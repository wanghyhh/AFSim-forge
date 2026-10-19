# 案例：space_operations（天基 —— 激光通信星座 + 脚本化动态组网）

> **任务类型**：天基 / 空间作战 —— Starlink 类低轨星座（16 面 × 18 颗 = 288 颗）的**激光星间链路（crosslink）+ 下行（downlink）+ 上行（uplink）**，由脚本在运行期动态建链 / 断链，最终让一颗卫星**跨半个地球**把消息送到地面指挥官
> **来源**：AFSIM 官方 demo `space_operations` 的入口 `lasercomm_scripted.txt`（**选摘**，非全 demo —— 原 demo 共 132 文件 / 36 个入口候选，详见 §3.3）
> **改造说明**：**仅结构改造，内容未增删** —— 块计数对比 **30 类块全部一致、0 项差异**、行级审计**丢失 0 行 / 新增 0 行**；差异**只剩 `include` / `include_once` 路径改写**（逐条可核，见 §4.5-1）
> **规模**：23 个文件 / 1,429 行（`processor/ESTABLISH_LINK_PROCESSOR.txt` 298、`global_script.txt` 245、`global_struct.txt` 195、`platform/STARLINK_LINKABLE.txt` 128）
> **结构**：根文件 6（入口 / `event_pipe.txt` / `global_script.txt` / `global_struct.txt` / `group.txt` / `setup.txt`）+ 目录 9（`comm/`、`config/`、`network/`、`output/`、`platform/`、`processor/`、`sensor/`、`side/`、`signatures/`）
> **自包含**：原 demo 有 20 个顶层入口 + 16 个 `scenarios/*` 入口；本案例**只收 `lasercomm_scripted.txt` 的闭包**（15 个源文件 / 1,376 行），**无跨 demo 依赖**，改造后工程自包含
> **许可 / 限制**：原始文件含 CUI 受控横幅，本案例**原样保留**（见 §4.6）
> **亮点**：① **运行期造星座**（`WsfConstellationMaker.CreateGeneral(16, 18, 5.0, 360.0)` → `maker.Create("", "StarlinkSetup")` → `starlink.Apply("AddInPlaneLink")`）；② **运行期改网络成员**（`WsfNetwork.AddNetwork` / `GetNetwork` / `RemoveMember` / `AddMember`）；③ **自定义脚本类 `script_struct CommLink`** + `Map<string, WsfTrack>` + `AuxData` 挂对象；④ **激光通信模型**（`WSF_LASER_TRANSCEIVER` + `WSF_OPTICAL_ATTENUATION`）；⑤ **五组组网**（`LINKABLE_TARGETS` / `CROSSLINK` / `DOWNLINK` / `DEDICATED_COMM` / `UPLINK`）+ `category linkable`；⑥ **七态建链状态机**（`entry` → `not_linkable` / `slewing` / `acquire` → `establish` → `maintain` → `complete`）；⑦ `WsfDraw` 画动态链路
> **对应**：结构 → `blueprints/layout/layout.md`；`comm` / `network` / `sensor` 块语法 → `knowledge/`；体系概念 → `knowledge/system-of-systems/sensor-network.md`；本案例 `global_struct.txt` `global_script.txt` `processor/`

---

## 1. 文件结构

```text
space_operations/
├── space_operations.txt                 45   ★ 入口（描述注释 + 装配总纲 + 仿真控制 + event_output 内联）
├── setup.txt                            10   平台装配（include 2 个 platform/*）
├── event_pipe.txt                       14   aer 记录配置（含 enable DRAW）
├── global_struct.txt                   195   共享数据结构（script_struct CommLink + 其成员函数与变量）
├── global_script.txt                   245   共享脚本（顶层 script 35 个 + 顶层 script_variables）
├── group.txt                            22   全局组定义（5 个 WSF_GROUP：LINKABLE_TARGETS / CROSSLINK / DOWNLINK / DEDICATED_COMM / UPLINK）
├── config/
│   └── run.json                          1   运行控制（scenariosId 留空 0）
├── output/
│   └── blank_empty.txt                   0   占位（保证 output/ 不被 ZIP 丢弃）
├── comm/
│   ├── LASERCOMM_LINK.txt               70   ★ 激光通信基类（attenuation 块 + comm LASERCOMM_LINK WSF_LASER_TRANSCEIVER）
│   ├── UPLINK.txt                       14   comm UPLINK（继承 LASERCOMM_LINK）
│   ├── CROSSLINK.txt                    13   comm CROSSLINK（继承 LASERCOMM_LINK）
│   └── DOWNLINK.txt                     14   comm DOWNLINK（继承 LASERCOMM_LINK）
├── network/
│   ├── starlink_default.txt             15   network starlink_default WSF_COMM_NETWORK_GENERIC
│   └── network.txt                       9   目录装配（include_once network/starlink_default.txt）
├── sensor/
│   └── UNIFORM_0DBI_PATTERN.txt         12   antenna_pattern UNIFORM_0DBI_PATTERN（uniform_pattern / peak_gain 50 dB）
├── signatures/
│   └── STARLINK_RADAR_SIG.txt           12   radar_signature STARLINK_RADAR_SIG（constant 5 dbsm）
├── processor/
│   ├── ESTABLISH_LINK_PROCESSOR.txt    298   ★ 建链状态机（WSF_TASK_PROCESSOR，7 态）
│   └── LINKABLE_TARGETS_PROCESSOR.txt  106   可链接目标维护（WSF_SCRIPT_PROCESSOR；含 CanLink 判定）
├── platform/
│   ├── STARLINK_LINKABLE.txt           128   ★ **内联片段**（被 include 进 platform_type 体内；不可独立 include）
│   ├── STARLINK.txt                     99   platform_type STARLINK（卫星本体：5 comm + 4 visual_part + mover + router）
│   └── UPLINK.txt                       40   platform_type UPLINK（地面站：1 comm + 1 sensor + edit sensor）
└── side/
    ├── blue.txt                         21   platform commander1（蓝方，收信端）
    └── green.txt                        46   platform sender1（绿方，发信端；含 execute at_interval_of 10 s 测试脚本）
```

**范围说明**：原 demo 共 **132 个文件**、**20 个顶层入口** + **16 个 `scenarios/*` 入口**（合计 36 个入口候选），另有 `weapons/blue_naval_sam_launch_data.txt`（192,099 行的数据表）与 `scenarios/starlink_autogen.txt`（9,804 行 / 288 个 `platform` 实例，Constellation Maker 预生成的等价星座）。本案例按 §6「**宁可选摘，不要塞爆**」原则，选 **`lasercomm_scripted.txt` 闭包**（15 个源文件 / 1,376 行）—— 它用 `WsfConstellationMaker` **运行期**造星座，**不需要**那个 9,804 行的 autogen 文件，且完整覆盖 `group` / `network` / `script_struct` 三项稀缺块（详见 §4.3）。
原 demo 的非文本资产（`README.md` / `doc/space_operations.rst` / `doc/images/space_operations.png` / `launch_vehicles/AAA_README.TXT`）按 §11.2 铁律 **一律不进改造工程**。

---

## 2. 案例详细说明

### 2.1 任务背景与态势

本案例（`space_operations`）是 AFSIM 官方 demo 中激光通信（lasercomm）星座组网演示的一个**选摘**子集，入口为 `space_operations.txt`，其头注释（`space_operations.txt:10-18`）明确了任务意图：用 `WsfConstellationMaker`（Wizard 星座生成器）在运行期建模一个"starfire"星座子集；星座内卫星之间的 crosslink（星间链路）与 downlink（下行链路）均为激光通信；同一轨道面内的卫星与轨道中前后相邻卫星建立**固定**网络链路，而侧向 crosslink 则与相对较近的卫星**动态**建立连接；所有通信链路的管理均通过脚本完成，最终利用这张 ad-hoc（自组）网络，让一个地面平台周期性地向地球另一侧的指挥官发送消息。

仿真时间窗口在入口文件顶层声明（`space_operations.txt:37-39`）：`start_date nov 1 2019`、`start_time 07:30:00`、`end_time 2000 s`，即总时长 2000 秒。事件输出分两条通道：`event_output` 块输出 `output/lasercomm_scripted.evt`（`space_operations.txt:40-45`），显式 enable `TASK_ASSIGNED`、`MESSAGE_TRANSMITTED`、`MESSAGE_RECEIVED` 三类事件；`event_pipe` 块输出 `output/lasercomm_scripted.aer`（`event_pipe.txt:9-14`），enable `MESSAGE_TRANSMITTED`、`MESSAGE_RECEIVED`、`DRAW` 三类事件（`DRAW` 用于记录 `WsfDraw` 动态链路绘制的回放）。注意：两个输出文件名是源文件里的**字面量**（非 `$(CASE)` 路径变量），为原样保留。

态势上，本案例不涉及交战，而是纯粹的**通信组网验证**：星座自身为 blue 方，一名地面指挥官 `commander1` 同在 blue 方；另一地面平台 `sender1` 属 green 方，作为"地球另一侧"的消息发起者，借助星座链路向 `commander1` 中继消息。

### 2.2 兵力编成与阵营

星座平台是**运行期生成**的，其余两个地面平台是**静态声明**的：

| 阵营 | 平台实例名 | 平台类型 | 挂载（comm / network / processor / group） | 关键参数 |
|---|---|---|---|---|
| blue | `commander1`（静态） | `UPLINK` | comm `uplink`（`UPLINK` 型，on，`group_join UPLINK`）；sensor `detect`；processor `link-proc` / `track-proc` / `establish-link-processor` / `establish-link-injector` / `establish-ad-hoc-connections` | 位置 `38.7372n 104.8808w`；`icon cmd_post`；comm `uplink` `network_name commander1`（`side/blue.txt:11-20`） |
| blue | 星座卫星（运行期，共 288 颗） | `STARLINK` | comm `crosslink1..4`（`CROSSLINK` 型）、`downlink`（`DOWNLINK` 型）；router `default`（`WSF_COMM_ROUTER`）；mover `WSF_SPACE_MOVER`；sensor `detect` 及同 UPLINK 的各 processor；group `DOWNLINK`/`CROSSLINK`/`LINKABLE_TARGETS`/`DEDICATED_COMM` | `WsfConstellationMaker.CreateGeneral(16, 18, 5.0, 360.0)`（16 轨道面 × 每面 18 颗 = 288 颗，`global_script.txt:103`）；maker 设 `SetInclination(53.0)`、`SetRevolutionsPerDay(13.3)`（`global_script.txt:105,109`） |
| green | `sender1`（静态） | `UPLINK` | comm `uplink`（`UPLINK` 型，on，`pitch 90 deg`）；sensor `detect` 及各 processor | 位置 `35:25:28.276n 83:38:16.705e`、`altitude 100 ft`；`icon cmd_post`；comm `uplink` `network_name sender1`（`side/green.txt:11-22`） |

两点说明：

1. **星座生成方式**：星座卫星不是逐个静态声明的，而是在运行期 `t=1.0e-10 s` 由主 `execute` 脚本创建（`global_script.txt:100-119`）：`WsfConstellationMaker.CreateGeneral(16, 18, 5.0, 360.0)` 构造 maker，随后 `maker.Create("", "StarlinkSetup")` 实例化全部平台（首参为空串，脚本未显式指定实例名前缀，平台名由生成器自动给出），创建完成后用 `starlink.Apply("AddInPlaneLink")` 补建轨道面内专用链路。星上平台类型由 `maker.SetPlatformType("STARLINK")` 指定（`global_script.txt:108`）。
2. **轨道参数存在两套声明**：平台类型 `STARLINK` 的 mover 静态声明 `semi_major_axis 7178 km`、`inclination 72 deg`（`platform/STARLINK.txt:32-35`）；而 maker 运行期另设 `SetInclination(53.0)` 与 `SetRevolutionsPerDay(13.3)`（`global_script.txt:105,109`）。二者数值不一致（倾角 53° vs 72°、`revolutions_per_day` 与 `semi_major_axis` 两套描述），运行期实际生效取值以 `WsfConstellationMaker` 计算为准，属易混淆点（详见 2.7）。

### 2.3 装配链（入口 → 根文件 → 组件 → 实例）

```
space_operations.txt（场景入口）
├─ include_once event_pipe.txt          → event_pipe 块
├─ include_once global_struct.txt       → script_struct CommLink
├─ include_once global_script.txt       → 全部脚本回调/工具函数
├─ include_once group.txt               → 5 个 group（空）
├─ include_once network/network.txt     → include network/starlink_default.txt
├─ include_once processor/ESTABLISH_LINK_PROCESSOR.txt
├─ include_once processor/LINKABLE_TARGETS_PROCESSOR.txt
├─ include_once setup.txt
│    ├─ include platform/STARLINK.txt
│    │    ├─ include comm/CROSSLINK.txt    ─┐
│    │    ├─ include comm/DOWNLINK.txt     ─┼─ 均 include comm/LASERCOMM_LINK.txt
│    │    ├─ include signatures/STARLINK_RADAR_SIG.txt
│    │    ├─ include network/starlink_default.txt
│    │    ├─ include processor/LINKABLE_TARGETS_PROCESSOR.txt
│    │    ├─ include global_struct.txt / global_script.txt
│    │    └─ platform_type STARLINK 内 include platform/STARLINK_LINKABLE.txt
│    └─ include platform/UPLINK.txt
│         ├─ include sensor/UNIFORM_0DBI_PATTERN.txt
│         ├─ include processor/ESTABLISH_LINK_PROCESSOR.txt
│         ├─ include processor/LINKABLE_TARGETS_PROCESSOR.txt
│         ├─ include comm/UPLINK.txt      ── include comm/LASERCOMM_LINK.txt
│         ├─ include global_struct.txt / global_script.txt
│         └─ platform_type UPLINK 内 include platform/STARLINK_LINKABLE.txt
├─ include_once side/blue.txt           → 实例 commander1（UPLINK）
└─ include_once side/green.txt          → 实例 sender1（UPLINK）
```

组件依赖的核心链条：激光通信模型 `LASERCOMM_LINK`（`WSF_LASER_TRANSCEIVER` + 衰减 `laser_link_attenuation` `WSF_OPTICAL_ATTENUATION`）被 `CROSSLINK` / `DOWNLINK` / `UPLINK` 三个 comm 类型复用；`STARLINK` 与 `UPLINK` 两个平台类型都 `include platform/STARLINK_LINKABLE.txt` 以获得"可被星链链接"的探测/建链/目标维护能力；`ESTABLISH_LINK_PROCESSOR` 与 `LINKABLE_TARGETS_PROCESSOR` 在入口与平台类型两处都被 include（`include_once` 保证不重复定义）。

### 2.4 组件职责逐项说明

| 文件 | 块类型与名称 | 职责 | 关键参数/取值 |
|---|---|---|---|
| `space_operations.txt` | 场景入口 | 声明时间窗、include 全部子文件、配置事件输出 | `end_time 2000 s`；`event_output` 输出 `output/lasercomm_scripted.evt`，enable `TASK_ASSIGNED`/`MESSAGE_TRANSMITTED`/`MESSAGE_RECEIVED` |
| `setup.txt` | include 集合 | 引入两个平台类型定义 | `include platform/STARLINK.txt`、`include platform/UPLINK.txt` |
| `event_pipe.txt` | `event_pipe` 块 | 定义 .aer 回放事件管道 | 输出 `output/lasercomm_scripted.aer`；enable `MESSAGE_TRANSMITTED`/`MESSAGE_RECEIVED`/`DRAW` |
| `global_script.txt` | `script`/`execute` | 星座生成、换网、建链、CommLink 全局访问器与释放/绘图工具 | 详见 2.6（245 行，本例最大脚本文件） |
| `global_struct.txt` | `script_struct CommLink` | 封装"单 comm 单链路"的状态与方法 | 成员含 `is_linking`/`is_linked`/`is_dedicated`、`linkable_targets` Map 等（`global_struct.txt:20-33`） |
| `group.txt` | 5 个 `group WSF_GROUP` | 声明空分组供 `group_join`/`GroupMemberOf` 过滤 | `LINKABLE_TARGETS`、`CROSSLINK`、`DOWNLINK`、`DEDICATED_COMM`、`UPLINK` |
| `network/network.txt` | include 集合 | 引入默认网络定义 | `include network/starlink_default.txt` |
| `network/starlink_default.txt` | `network starlink_default WSF_COMM_NETWORK_GENERIC` | 平台类型 comm 的初始默认网络 | `network_address 192.168.1.1/21` |
| `comm/LASERCOMM_LINK.txt` | `attenuation` + `comm LASERCOMM_LINK WSF_LASER_TRANSCEIVER` | 激光收发机模型 + 光学衰减表 | 见下两行拆分 |
| （同上）attenuation 块 | `laser_link_attenuation WSF_OPTICAL_ATTENUATION` | 光链路大气衰减 | `internal_table mono_1550nm_a2_h1`（1550nm 单色表） |
| （同上）comm 块 | `WSF_LASER_TRANSCEIVER` | 激光收发参数 | `category linkable`；`slew_mode azimuth_and_elevation`，`azimuth/elevation_slew_rate 30 deg/s`，`slew_limits ±80 deg`；发射机 `wavelength 1550 nm`、`power 100 W`、`modulation_type ppm`、`ppm_order 64`、`pulse_width 10 ns`、`aperture_diameter 2.5 cm`、`beamwidth 0.120 deg`、`optics_transmission_factor 0.7`；接收机 `aperture_diameter 2.5 cm`、`quantum_efficiency 0.3`、`detector_gain 1.0`、`focal_length 0.1 m`、`detector_size 0.0001 m`、`circuit_temperature 300 K`、`circuit_capacitance 1.0E-12 F`、`dark_current 1 nanoamp`、`dark_count_rate 6231.51 mHz` |
| `comm/CROSSLINK.txt` | `comm CROSSLINK LASERCOMM_LINK` | 星间链路 comm 类型（默认关闭） | `group_join CROSSLINK`（无 `on`） |
| `comm/DOWNLINK.txt` | `comm DOWNLINK LASERCOMM_LINK` | 下行链路 comm 类型 | `on`；`group_join DOWNLINK` |
| `comm/UPLINK.txt` | `comm UPLINK LASERCOMM_LINK` | 上行链路 comm 类型 | `on`；`group_join UPLINK` |
| `platform/STARLINK.txt` | `platform_type STARLINK WSF_PLATFORM` | 星链卫星平台模板 | `icon cubesat`、`side blue`、`commander commander1`；mover `semi_major_axis 7178 km`/`inclination 72 deg`；router `default WSF_COMM_ROUTER` 且 `automated_interface_linking true`；5 个 comm（`crosslink1` yaw 0°/`crosslink2` yaw 180°/`crosslink3` yaw -90°/`crosslink4` yaw 90° 均 `network_name starlink_default`，其中 `crosslink1/2` 额外 `group_join DEDICATED_COMM`；`downlink` pitch -90° `group_join DOWNLINK`），每个 comm 配同名 `visual_part` |
| `platform/STARLINK_LINKABLE.txt` | 能力片段（include 进平台类型） | 提供探测/目标维护/动态建链/请求建链能力 | `group_join LINKABLE_TARGETS`；sensor `detect WSF_GEOMETRIC_SENSOR`（`maximum_range 1500 km`、`frame_time 20 sec`、`azimuth_field_of_view ±180 deg`、`elevation_field_of_view ±90 deg`、`processor link-proc`）；processor `link-proc`(LINKABLE_TARGETS_PROCESSOR)、`track-proc`(WSF_TRACK_PROCESSOR, `non_master_track_processor` + `uncorrelated_track_drops enable`)、`establish-link-processor`(ESTABLISH_LINK_PROCESSOR, `track_processor track-proc`)、`establish-link-injector`(WSF_SCRIPT_PROCESSOR, `internal_link establish-link-processor`)、`establish-ad-hoc-connections`(WSF_SCRIPT_PROCESSOR)；脚本 `RequestLink`/`AttemptLinks` |
| `platform/UPLINK.txt` | `platform_type UPLINK WSF_PLATFORM` | 上行地面站平台模板 | `group_join UPLINK`；comm `uplink`（`pitch 90 deg`）；`edit sensor detect` 设 `elevation_scan_limits 30 deg 90 deg` |
| `processor/ESTABLISH_LINK_PROCESSOR.txt` | `processor ESTABLISH_LINK_PROCESSOR WSF_TASK_PROCESSOR` | 七态建链状态机 | 变量 `mTimeToAcquire=1.0 s`、`mIsGimbaled=true`、`mTrackProcessorName="track-proc"`；七态 `entry/not_linkable/slewing/acquire/establish/maintain/complete`，各态 `evaluation_interval` 分别为 `1.0s/1e6s/0.1s/0.1s/1s/2s/1e6s` |
| `processor/LINKABLE_TARGETS_PROCESSOR.txt` | `processor LINKABLE_TARGETS_PROCESSOR WSF_SCRIPT_PROCESSOR` | 维护"可链接目标"清单 | `on_initialize2` 把 `DEDICATED_COMM` 成员 `SetDedicated(true)`；`CanLink` 过滤（category/group/视场）；处理 `WSF_TRACK_MESSAGE` 与 `WSF_TRACK_DROP_MESSAGE` |
| `sensor/UNIFORM_0DBI_PATTERN.txt` | `antenna_pattern UNIFORM_0DBI_PATTERN` | 全向天线方向图（本场景未被显式挂载） | `uniform_pattern` `peak_gain 50.0 dB` |
| `side/blue.txt` | `platform commander1 UPLINK` | blue 方地面指挥所实例 | `commander SELF`、`side blue`、`icon cmd_post`、位置 `38.7372n 104.8808w`；comm `uplink` `network_name commander1` |
| `side/green.txt` | `platform sender1 UPLINK` + `execute` | green 方地面发射平台，周期发消息 | `side green`、`icon cmd_post`、位置 `35:25:28.276n 83:38:16.705e`、`altitude 100 ft`；comm `uplink` `network_name sender1`、`pitch 90 deg`；`execute at_interval_of 10 s` 在 `TIME_NOW > 60.0` 且 `link.Linked()` 且 `PathExistsTo` 时 `SendMessage` |
| `signatures/STARLINK_RADAR_SIG.txt` | `radar_signature STARLINK_RADAR_SIG` | 卫星雷达散射截面 | `constant 5 dbsm` |
| `output/blank_empty.txt` | 空文件（0 字节） | 占位，保证 `output/` 目录被打包携带 | — |
| `config/run.json` | 归一化附带的运行配置（非 AFSIM 场景输入） | 记录 GUI 运行参数 | `baseConfig.stepValue 0.1`、`recordAer 1`、`recordLog 1` 等 |

### 2.5 运行时序与数据流

按仿真时间推进，链路从"造星座"到"消息中继"的完整过程如下：

1. **造星座并回调换网（t=1.0e-10 s）**：主 `execute` 脚本（`global_script.txt:100-119`）创建 maker、设参后 `maker.Create("", "StarlinkSetup")`。每颗卫星实例化后回调 `StarlinkSetup`（`global_script.txt:56-82`）：先把 `crosslink1..4`、`downlink` 五个 comm 各自移出 `starlink_default` 网络、按"comm名_平台名"命名建新网络；再在平台内部把五个 comm **两两** `AddConnection`。这一步必须做，因为换网导致各 comm 地址改变，初始网络上的默认 router 不再连通（见该函数 64-67 行注释）。
2. **补建轨道面内专用链路**：`maker.Create` 返回后 `starlink.Apply("AddInPlaneLink")`（`global_script.txt:118`）。`AddInPlaneLink`（`global_script.txt:87-96`）对每颗星：`crosslink1` 连"下一颗星"的 `crosslink2`，`crosslink2` 连"上一颗星"的 `crosslink1`，形成轨道面内环形/链式专用链路。此步必须放在星座创建之后（84-86 行注释：地址会随换网改变）。
3. **标记专用链路（on_initialize2）**：`LINKABLE_TARGETS_PROCESSOR` 初始化时遍历本平台 comm，凡 `GroupMemberOf("DEDICATED_COMM")`（即 `crosslink1/2`）调用 `SetDedicated(true)`，使其不参与动态重分配（`LINKABLE_TARGETS_PROCESSOR.txt:19-29`）。
4. **探测与目标筛选（每 20 s）**：sensor `detect` 以 `frame_time 20 sec`、`maximum_range 1500 km` 探测，产生 `WSF_TRACK_MESSAGE` 交 `link-proc`。`LINKABLE_TARGETS_PROCESSOR` 的 `CanLink`（`LINKABLE_TARGETS_PROCESSOR.txt:32-48`）过滤：comm 须 `CategoryMemberOf("linkable")`、非 `DEDICATED_COMM`、目标在 `WithinFieldOfRegard` 内，且 group 配对合法（`DOWNLINK↔UPLINK` 或 `CROSSLINK↔CROSSLINK`），通过者写入 comm 的 `linkable_targets` Map。
5. **侧向动态建链（约每 10 s，随机 ±0.5）**：`establish-ad-hoc-connections`（`STARLINK_LINKABLE.txt:113-128`）`on_initialize` 里 `SetUpdateInterval(10.0 + RandomUniform() - 0.5)`；`on_update` 遍历本平台非 `DEDICATED_COMM` 的 comm，调用 `AttemptLinks`（83-111 行）→ `RequestLink`（62-80 行）：本端先 `Acquire` 目标，再发 `WSF_CONTROL_MESSAGE`（`SetSubType("link")`、`SetFunction("<本平台名> <本comm名>")`）到对方 `establish-link-injector`，由 `internal_link` 转发给 `establish-link-processor`。
6. **七态状态机推进（双方各自）**：`ESTABLISH_LINK_PROCESSOR` 收到控制消息后 `SelectComm` 选可用 comm 并 `Acquire`，把 track 经 `track-proc` 加入轨迹列表触发任务，然后按状态机推进（推进条件详见 2.6）：
   - `entry`(1.0s) → `slewing`（因 `mIsGimbaled=true` 恒真）；→ `acquire`；→ `establish`；→ `maintain`(2s) → `complete`(1e6s)；
   - `entry` → `not_linkable`（目标不在 `LINKABLE_TARGETS` 组时）。
   - `establish` 态中当 `CommLink_MutuallyLinking` 成立（双方 `Linking()` 且 remote 名互指）时调用 `link.Establish()` 双向 `AddConnection`，成功后按 `sDrawLinks` 用 `WsfDraw` 以红色（`SetColor(1.0,0.2,0.2)`）画链路（`ESTABLISH_LINK_PROCESSOR.txt:198-268`）。
7. **链路维护与拆除**：`maintain` 态每 2 s 检查 `link.Linked()`、目标有效、双方 `WithinFieldOfRegard`；任一不满足则 `link.Free()` 并 `DropTrack` → `complete`，`Free` 内部擦除对应 `WsfDraw` 线（`ESTABLISH_LINK_PROCESSOR.txt:271-290`）。
8. **跨洋消息中继**：`sender1` 的 `execute at_interval_of 10 s`（`side/green.txt:25-44`）在 `TIME_NOW > 60.0` 后，若其 `uplink` 的 `CommLink.Linked()` 且 `uplink.PathExistsTo(commander1 的 uplink 地址)` 成立，则 `SendMessage`（subtype `"blah blah blah"`），消息经星座侧向链路与轨道面内链路逐跳中继到 blue 方 `commander1`，由 `event_output`/`event_pipe` 的 `MESSAGE_TRANSMITTED`/`MESSAGE_RECEIVED` 事件记录。
9. **链路绘制（贯穿全期）**：`WsfDraw` 用 `SetId(本平台Index*10000000 + 目标Index)` 标识线，建立时 `BeginLines/Vertex(两端)/End`，拆除或丢迹时按同 id `Erase`（`ESTABLISH_LINK_PROCESSOR.txt:233-243`、`LINKABLE_TARGETS_PROCESSOR.txt:97-102`、`global_script.txt:211-216`），`DRAW` 事件进入 .aer 供回放。

### 2.6 关键脚本逻辑

**`global_script.txt`（245 行）**——星座与建链的脚本中枢：

- `AddCommToNewNetwork`（11-41 行）：把指定 comm 从当前网络移出，`WsfNetworkGeneric` 以 `comm名_平台名` 命名建新网并 `AddNetwork`，成功后从旧网 `RemoveMember`、向新网 `AddMember`；失败分支 `writeln` 报错。
- `AddLink`（44-51 行）：两个平台的两个 comm 之间单边 `AddConnection`。
- `StarlinkSetup`（56-82 行）：星座生成回调，做换网 + 平台内五 comm 两两互联（上文步骤 1）。
- `AddInPlaneLink`（87-96 行）：`starlink.Apply` 回调，用 `NextSatelliteInPlane/PreviousSatelliteInPlane` 建立前后星专用链路。
- 主 `execute`（100-119 行）：`CreateGeneral(16,18,5.0,360.0)` → 设名/倾角/初始近点角/初始 RAAN/平台类型/每日圈数 → `Create("", "StarlinkSetup")` → `Apply("AddInPlaneLink")`。
- `script_variables`（125-127 行）：`bool sDrawLinks = true`，控制是否画链路。
- **CommLink 全局访问器**（131-154 行）：`CommLink_Link(aComm)` 惰性创建——若 comm 无 `AuxData("Link")` 则 `SetAuxData` 挂一个 `CommLink` 结构体，实现"每 comm 一条链路对象"；`CommLink_Free/Establish/Linked` 均委托给该对象。
- `CommLink_MutuallyLinked`（160-167 行）与 `CommLink_MutuallyLinking`（169-180 行）：判定双方是否都 `Linked()/Linking()` 且 remote 名互指（`RemotePlatformCommName()==PlatformCommName(对方)`），用于避免单边建链。
- `CommLink_FreeP`（182-218 行）：真正拆除——`RemoveConnection`、擦除 `linkable_targets` 与远端名、复位标志位，并按 id `draw.Erase` 擦线。
- `WithinFieldOfRegard`（227-241 行）：目标位置 WCS→本 comm 的 PCS，取方位/俯仰（`-ASin(z)`/`ATan2(y,x)`），与 visual_part 的 `CueMinimum/MaximumElevation/Azimuth` 比较，返回是否在视场（field of regard）内。
- `Comm_Orientation`（243-245 行）：返回 comm 同名 `visual_part`，作为视场判定的姿态载体。

**`global_struct.txt`（195 行）**——`script_struct CommLink`：

- 成员变量（20-33 行）：`local_comm/remote_comm`、四个名称串、`remote_platform_index`（用于擦线）、`is_linking/is_linked/is_dedicated`、`Map<string,WsfTrack> linkable_targets`、`static string sDEDICATED="(DEDICATED)"`。
- `Acquire`（42-58 行）：定位目标平台与 comm，记录远端名，置 `is_linking=true`。
- `Establish`（61-87 行）：在 `MutuallyLinking` 成立时双向 `AddConnection`，置 `is_linked`，并递归 `Establish(remote_comm)` 保证对端也建立。
- `SetDedicated`（90-103 行）：置专用态（`is_linking/is_linked=true`、`remote_platform_name=sDEDICATED`），或取消专用时 `Free`。
- `Free`（111-132 行）：双向互链时写 `REMOVE_CONNECTION` 注释并递归 `CommLink_FreeP(对端)`，否则写 `LINK_ABORTED`，最后 `CommLink_FreeP(本端)`。

**`processor/ESTABLISH_LINK_PROCESSOR.txt`（298 行）**——七态状态机：

- 变量（18-23 行）：`mTimeToAcquire=1.0 s`、`mIsGimbaled=true`、`mAcquireTime` Map、`mTrackProcessorName="track-proc"`。
- `SelectComm`（47-65 行）：选第一个 `IsTurnedOn()`、未 `Linking`、且 `linkable_targets` 含目标的 comm。
- `on_message type WSF_CONTROL_MESSAGE`（70-107 行）：拆出对方平台名/comm 名 → `Acquire` → 设 `local_comm` AuxData → 把 track 经 `TrackManager().AddTrackReport` 入轨（从而自动派发任务）。
- 七态推进条件：
  - `entry`（109-121，间隔 1.0 s）：`next_state not_linkable`（`!TRACK.Target().GroupMemberOf("LINKABLE_TARGETS")`）→ `next_state slewing`（`mIsGimbaled`）→ `next_state acquire`（恒真兜底）。
  - `not_linkable`（123-125，间隔 1e6 s）：空态，无迁移。
  - `slewing`（127-174，间隔 0.1 s）：`on_entry` 调 `LocalComm(TRACK).CueToTrack(TRACK)` 并置 `begin_slewing`；`next_state acquire` 的判定中，第一次评估（`begin_slewing` 为真）清标志后返回 false 停留，第二次评估返回 true 迁往 `acquire`。注意：原本基于方位/俯仰误差（`sTOL=0.5`）的"转动到位"判定已被注释（151-166 行），当前实现等效于"延迟一个评估间隔即放行"。
  - `acquire`（176-196，间隔 0.1 s）：`on_entry` 记 `mAcquireTime = mTimeToAcquire + TIME_NOW`（即 1 s 捕获延迟）；`next_state establish` 条件为 `TIME_NOW >= mAcquireTime[TrackId]`；`on_exit` 清除计时。
  - `establish`（198-269，间隔 1 s）：若 `remoteComm` 无效或非 `MutuallyLinking` → `next_state complete`；否则在 `MutuallyLinking` 成立时 `link.Establish()` 双向建链、写 `ADD_CONNECTION` 注释并按 `sDrawLinks` 画线 → `next_state maintain`；失败则 `link.Free()`、`CancelTask` 返回 false。
  - `maintain`（271-290，间隔 2 s）：`!link.Linked()` 或目标无效或任一端超出 `WithinFieldOfRegard` 时 `link.Free()` + `DropTrack` → `next_state complete`；否则停留。
  - `complete`（292-297，间隔 1e6 s）：`on_entry` `TaskComplete(TRACK.TrackId(), "link")`。

**`processor/LINKABLE_TARGETS_PROCESSOR.txt`（106 行）**——目标清单维护：

- `CanLink`（32-48 行）：四条件——`CategoryMemberOf("linkable")`、非 `DEDICATED_COMM`、`WithinFieldOfRegard`、group 配对（DOWNLINK↔UPLINK 或 CROSSLINK↔CROSSLINK）。
- `on_message type WSF_TRACK_MESSAGE`（50-69 行）：目标有效且属 `LINKABLE_TARGETS` 时，对本平台每个 comm 若 `CanLink` 则把 track 写入 `linkable_targets[目标名]`。
- `on_message type WSF_TRACK_DROP_MESSAGE`（70-104 行）：目标丢迹时，若某 comm 正 `Linking` 且远端正是该目标则 `Free` + `DropTrack`，并从各 comm 的 `linkable_targets` 擦除该目标；同时按 id 擦两条方向的 `WsfDraw` 线。

**`group.txt`（22 行）**：声明 5 个空 `WSF_GROUP`，作为运行期 `group_join`/`GroupMemberOf` 的类别开关（`LINKABLE_TARGETS`/`CROSSLINK`/`DOWNLINK`/`DEDICATED_COMM`/`UPLINK`）。

**`network/*`**：`network/starlink_default.txt`（15 行）定义 `WSF_COMM_NETWORK_GENERIC` 默认网 `192.168.1.1/21`，是 comm 换网前的初始落点；`network/network.txt` 仅负责 include。

### 2.7 可复用要点与陷阱

1. **运行期造星座 + 回调换网是核心套路**：`WsfConstellationMaker` 让数百颗星免于逐条静态声明。但换网会改变 comm 地址、使初始默认 router 失效，必须在 `StarlinkSetup` 回调里手工重建平台内互联（`global_script.txt:64-81`）；同理 `AddInPlaneLink` 必须在星座创建完成后 `Apply`（`global_script.txt:84-86`）。
2. **`AuxData` 挂 `script_struct` 是"每 comm 一条链路"的封装范式**：`CommLink_Link(aComm)` 惰性创建并把对象存进 comm 的 `AuxData("Link")`（`global_script.txt:131-141`），配合 `script_struct` 的成员态与 `Free/Establish/Linked` 方法，把散落的链接状态收敛到一个对象里（`global_struct.txt:11-17` 头注释）。
3. **双向建链必须双端校验**：`CommLink_MutuallyLinking/MutuallyLinked` 检查双方 `Linking/Linked` 且 remote 名互指，防止只有单边加连接造成"半链路"（`global_script.txt:160-180`）。`Establish` 还会递归调用对端的 `Establish`。
4. **七态状态机用 `evaluation_interval` 控制节奏**：捕获延迟由 `mTimeToAcquire=1.0 s` + `mAcquireTime` Map 实现（`acquire` 态）；维护巡检固定 2 s（`maintain` 态）。`slewing` 态的"转动到位"判定已被注释、当前立即放行（`ESTABLISH_LINK_PROCESSOR.txt:151-171`），若需真实指向约束需解除注释或改用 2.3+ 的 `CurrentCuedAzimuth()==ActualCuedAzimuth()` 判定。
5. **轨道参数两套声明的隐患**：`STARLINK` 平台类型 mover 静态写 `semi_major_axis 7178 km`、`inclination 72 deg`（`platform/STARLINK.txt:32-35`），而 maker 运行期设 `SetInclination(53.0)`、`SetRevolutionsPerDay(13.3)`（`global_script.txt:105,109`）。两处数值不一致，实际以 `WsfConstellationMaker` 运行期计算为准，复用时务必对齐，否则星座构型与单星运动学不一致。
6. **激光模型参数集中且敏感**：`WSF_LASER_TRANSCEIVER` 使用 PPM 调制（`ppm_order 64` 覆盖传输速率）、波长 1550 nm、孔径 2.5 cm、`beamwidth 0.120 deg`，衰减表 `WSF_OPTICAL_ATTENUATION` 用 `mono_1550nm_a2_h1`（`comm/LASERCOMM_LINK.txt:10-12,33-67`）；注释说明 `power 100 W` 来自"1.56 W 平均功率 × 64 PPM 阶"。
7. **`category` 与 `group` 双重过滤**：激光 comm 用 `category linkable` 标记"可被动态链接"，用 `DEDICATED_COMM` 组排除 `crosslink1/2`（前后专用），用 `CROSSLINK/DOWNLINK/UPLINK` 组做配对约束（`LINKABLE_TARGETS_PROCESSOR.txt:32-48`）。新增 comm 需同时加入正确 group/category 才会参与动态组网。
8. **`WsfDraw` 线用 id 编码便于定点擦除**：id 用 `平台Index*10000000 + 目标Index` 编码，建立时画、释放/丢迹时按同 id `Erase`（`ESTABLISH_LINK_PROCESSOR.txt:233-243`、`global_script.txt:211-216`）。复用时应保证 id 唯一且两端一致。
9. **未挂载的 `UNIFORM_0DBI_PATTERN`**：`sensor/UNIFORM_0DBI_PATTERN.txt` 定义了 `peak_gain 50.0 dB` 的全向方向图，仅在 `platform/UPLINK.txt:11` 被 include，场景中没有任何 sensor/comm 显式引用它（激光模型走 `WSF_OPTICAL_ATTENUATION`，不用 `antenna_pattern`），属"引入未用"的遗留项。
10. **输出文件名为源字面量**：`output/lasercomm_scripted.evt`/`.aer` 是源里写死的路径（`space_operations.txt:42`、`event_pipe.txt:10`），非 `$(CASE)` 变量，部署/打包时须保证 `output/` 目录存在（归一化工程以空占位文件 `output/blank_empty.txt` 确保目录被携带）。
11. **消息发送条件静默失败**：`sender1` 仅在 `link.Linked() && PathExistsTo(...)` 时发送（`side/green.txt:34-38`），失败时无告警（原"No path"日志被注释，39-42 行），调试时需自行打开该日志确认链路是否就绪。

---

## 3. 完整脚本全文

> 文件顺序 = **装配顺序**（入口 → 根文件 → 组件自下而上 → `platform_type` → `side/` 实例 → 非 AFSIM 文件）。
> 共 23 个文件、1,429 行；正文与归一化工程**逐行一致**（文档内行尾统一为 LF；源为 CRLF 的文件在文档中即表现为 LF）。
> 行数按**换行符**计（`wc -l` 口径）；本案例有 **3** 个源文件末行无换行符（`platform/STARLINK_LINKABLE.txt`、`processor/ESTABLISH_LINK_PROCESSOR.txt`、`sensor/UNIFORM_0DBI_PATTERN.txt`），其**可寻址行号**比"行数"多 1；文档为闭合围栏在末行补一个换行符，正文内容不变。

### ===== FILE: space_operations.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
# ==============================================================================
# A demonstration using the AFSIM lasercomm model.  A subset of the planned 
# "starfire" constellation is modeled using the Wizard Constellation Maker.  
# The crosslinks and downlinks of the satellites in the constellation are 
# lasercomms.  Satellites in the same plane in the constellation have fixed 
# network links with the previous and subsequent satellites in their orbits, 
# but side crosslinks dynamically connect with relatively nearby satellites.  
# Managing communication links is performed through scripting.  Using this 
# ad-hoc network, a platform periodically sends messages to a commander 
# on the other side of the world.
# ==============================================================================

file_path .

# This section is meant to be generic so that it can
# be included to enable ad-hoc comm networking
include_once event_pipe.txt
include_once global_struct.txt
include_once global_script.txt
include_once group.txt
include_once network/network.txt
include_once processor/ESTABLISH_LINK_PROCESSOR.txt
include_once processor/LINKABLE_TARGETS_PROCESSOR.txt
include_once setup.txt
include_once side/blue.txt
include_once side/green.txt

start_date nov 1 2019
start_time 07:30:00
end_time 2000 s

event_output
   file output/lasercomm_scripted.evt
   enable TASK_ASSIGNED
   enable MESSAGE_TRANSMITTED
   enable MESSAGE_RECEIVED
end_event_output
```

### ===== FILE: setup.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
include_once platform/STARLINK.txt
include_once platform/UPLINK.txt
```

### ===== FILE: event_pipe.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
event_pipe 
   file output/lasercomm_scripted.aer
   enable MESSAGE_TRANSMITTED
   enable MESSAGE_RECEIVED
   enable DRAW
end_event_pipe
```

### ===== FILE: global_struct.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************


# A more encapsulated way of maintaining a comm link.
# A CommLink object is placed on each comm device that maintains a single link.
# Static methods are prefaced with "CommLink_" and are defined below the scipt_struct.
# To access a CommLink, call CommLink_Link(<your comm>).  This will create a CommLink object
# on demand if not already defined, place it on the comm device, and return the Link.
# Other platforms to which the comm device can potentially communicate should be inserted into 
# the linkable_targets map.
script_struct CommLink

   script_variables
      WsfComm local_comm;
      WsfComm remote_comm;
      string local_platform_name = "";
      string remote_platform_name = "";
      int    remote_platform_index = 0; // for erasing drawn link lines
      string remote_comm_name = "";
      string local_comm_name = "";
      bool   is_linking  = false;
      bool   is_linked   = false;
      bool   is_dedicated = false;
      Map<string, WsfTrack> linkable_targets = {};
      static string sDEDICATED = "(DEDICATED)";
   end_script_variables   

   # Return the list of Potentially linkable targets.
   script Map<string, WsfTrack> LinkableTargets()
      return linkable_targets;
   end_script
   
   # Attempt to start acquiring a target comm.  If the acquisition process is successful,
   # Establish() should subsequently be called.
   script bool Acquire(string aLinkTarget, string aLinkComm)
      WsfPlatform target = WsfSimulation.FindPlatform(aLinkTarget);
      bool success = target.IsValid();
      if (success)
      {
         remote_comm = target.Comm(aLinkComm);
         success = remote_comm.IsValid();
         if (success)
         {
            remote_platform_name = aLinkTarget;
            remote_platform_index = target.Index(); 
            remote_comm_name = remote_comm.Name();
            is_linking = true; 
         }
      }
      return success;
   end_script
   
   // Establish the communications link for which "Acquire" has previously been called.
   script bool Establish()
      extern bool CommLink_MutuallyLinking(WsfComm aLocalComm, WsfComm aRemoteComm);
      bool established = true;
      if (WsfSimulation.FindPlatform(remote_platform_name).IsValid() && CommLink_MutuallyLinking(local_comm, remote_comm))
      {
          WsfAddress lca = local_comm.GetAddress();
          WsfAddress rca = WsfSimulation.FindPlatform(remote_platform_name).Comm(remote_comm_name).GetAddress();
          bool connectedLocal = local_comm.AddConnection(lca, rca);
          if (connectedLocal)
          {
             is_linked = true;
             
             extern bool CommLink_Linked(WsfComm aComm);
             if (!CommLink_Linked(remote_comm))
             {
                extern bool CommLink_Establish(WsfComm aComm);
                bool established = CommLink_Establish(remote_comm);              
             }
          }
      }
      else
      {
         established = false;
      }
      
      return established;
   end_script
   
   # Indicate that this comm link is dedicated (i.e., should not be reassigned dynamically").
   script void SetDedicated(bool aIsDedicated)
      if (aIsDedicated)
      {
         is_linking = true;
         is_linked = true;
         remote_platform_name = sDEDICATED;
      }
      else if (is_dedicated)
      {
         extern void CommLink_Free(WsfComm aComm);
         CommLink_Free(local_comm);
      }
      is_dedicated = aIsDedicated;
   end_script
   
   # Return whether this link is dedicated.
   script bool Dedicated()
      return is_dedicated;
   end_script
   
   # Free a link that has been assigned and established with the Assign and Establish methods above.
   script void Free()
   
      extern void CommLink_FreeP(WsfComm aComm);
      extern bool CommLink_MutuallyLinked(WsfComm aLocalComm, WsfComm aRemoteComm);
      if (WsfSimulation.FindPlatform(remote_platform_name).IsValid() && CommLink_MutuallyLinked(local_comm, remote_comm))
      {
         string comment = "REMOVE_CONNECTION " + local_platform_name + ":" + local_comm_name + " from " + remote_platform_name + ":" + remote_comm_name;
         local_comm.Platform().Comment(comment);                         
         comment = "REMOVE_CONNECTION " + remote_platform_name + ":" + remote_comm_name + " from " + local_platform_name + ":" + local_comm_name;
         remote_comm.Platform().Comment(comment);                         
         CommLink_FreeP(remote_comm);
      }
      else
      {
         string comment = "LINK_ABORTED " + local_platform_name + ":" 
                          + local_comm_name + " from " + remote_platform_name + ":" + remote_comm_name;
         local_comm.Platform().Comment(comment);
      }
      
      CommLink_FreeP(local_comm);
            
   end_script

   # Return whether we are establishing, or have establised a link. 
   script bool Linking()
      return is_linking;
   end_script
   
   # Return whether we have established a link.
   script bool Linked()
      return is_linked;
   end_script
   
   # Return the local comm object.
   script WsfComm LocalComm()
      return local_comm;
   end_script
   
   # Return the remote comm object if linked to a remote comm device on a valid platform; otherwise the object will be invalid.
   script WsfComm RemoteComm()
      WsfComm comm;
      if (is_linking && WsfSimulation.FindPlatform(remote_platform_name).IsValid())
      {
         comm = remote_comm;
      }
      return comm;
   end_script
   
   # Return the valid remote platform of a linked comm device; otherwise the object will be invalid. 
   script WsfPlatform RemotePlatform()
      return WsfSimulation.FindPlatform(remote_platform_name);
   end_script
   
   script string RemotePlatformName()
      return remote_platform_name;
   end_script
   
   script string LocalPlatformName()
      return local_platform_name;
   end_script
   
   script string LocalCommName()
      return local_comm_name;
   end_script
   
   script string RemoteCommName()
      return remote_comm_name;
   end_script
   
   script string LocalPlatformCommName()
      return local_platform_name + ":" + local_comm_name;
   end_script
   
   script string RemotePlatformCommName()
      if (is_linking && WsfSimulation.FindPlatform(remote_platform_name).IsValid())
      {
         return remote_platform_name + ":" + remote_comm_name;
      }
      else
      {
         return "";
      }   
   end_script
   
end_script_struct
```

### ===== FILE: global_script.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
# This moves the comm device on the given platform onto a new network with a name
# derived from the comm device name and platform name.
script void AddCommToNewNetwork(WsfPlatform aPlatform, string aCommDeviceName)
   WsfComm comm = aPlatform.Comm(aCommDeviceName);
   if (comm.IsValid())
   {
      WsfNetworkGeneric network = WsfNetworkGeneric();
      network.SetName(aCommDeviceName + "_" + aPlatform.Name());
      if (WsfNetwork.AddNetwork(network))
      {         
         WsfNetwork current = WsfNetwork.GetNetwork(comm.NetworkName());
         if (current.RemoveMember(aPlatform.Name(), aCommDeviceName))
         {        
            network.AddMember(comm);
         }
         else
         {
            writeln("***** ERROR: Unable to remove device ", aCommDeviceName, " from network '",
                    current.GetName(), "'.");
         }
      }
      else
      {
         writeln("***** ERROR: Unable to add network for device ", aCommDeviceName,
                 " on platform ", aPlatform.Name(), ".");
      }
   }
   else
   {
      writeln("***** ERROR: During setup, unable to find ", aCommDeviceName,
              " for platform ", aPlatform.Name(), ".");
   }
end_script

# This utility script is used to add a link between the specified platforms and devices.
script void AddLink(string aSourcePlatform,
                    string aSourceDevice,
                    string aTargetPlatform,
                    string aTargetDevice)
   WsfComm sourceComm = WsfSimulation.FindPlatform(aSourcePlatform).Comm(aSourceDevice);
   WsfComm targetComm = WsfSimulation.FindPlatform(aTargetPlatform).Comm(aTargetDevice);
   sourceComm.AddConnection(targetComm.GetAddress());
end_script

# This script is called by WsfConstellationMaker.Create after the member platforms
# have been instantiated. This script will move the comm devices off of the starlink_default
# network and onto the networks as they are in the lasercomm.txt demo.
script void StarlinkSetup(WsfConstellation aConstellation, int aPlane, int aSat, WsfPlatform aPlatform)
   // Move comm devices into their final networks
   AddCommToNewNetwork(aPlatform, "crosslink1");
   AddCommToNewNetwork(aPlatform, "crosslink2");
   AddCommToNewNetwork(aPlatform, "crosslink3");
   AddCommToNewNetwork(aPlatform, "crosslink4");
   AddCommToNewNetwork(aPlatform, "downlink");
   
   // Connect all comms on each platform to one another.
   // The default router is created when the devices are on the initial
   // network. When the comm devices are moved to their final network, their
   // addresses change, and so they are no longer linked via aPlatform's router.
   int commCount = aPlatform.CommCount();
   for (int s = 0; s < commCount; s += 1)
   {
      WsfComm source = aPlatform.CommEntry(s);
      for (int t = 0; t < commCount; t += 1)
      {
         WsfComm target = aPlatform.CommEntry(t);
         
         if (s != t)
         {
            source.AddConnection(target.GetAddress());
         }
      }
   }
end_script

# This script, used in a call to WsfConstellation.Apply, sets up the dedicated links in the 
# constellation. This has to occur after the creation of the constellation, because the addresses
# of the devices will change as they are moved into their final network.
script void AddInPlaneLink(WsfConstellation aConstellation, int aPlane, int aSatellite, WsfPlatform aPlatform)
   AddLink(aPlatform.Name(),
           "crosslink1",
           aConstellation.MemberName(aPlane, aConstellation.NextSatelliteInPlane(aSatellite)),
           "crosslink2");
   AddLink(aPlatform.Name(),
           "crosslink2",
           aConstellation.MemberName(aPlane, aConstellation.PreviousSatelliteInPlane(aSatellite)),
           "crosslink1");   
end_script

# The main script in this scenario. This kicks off the operations by adding the constellation to
# the simulation.
execute at_time 1.0e-10 s absolute
   // Create an object that can be used to create the constellation, and set its options to match
   // those used in the original lasercomm demo. See also ./scenarios/starlink_autogen.txt.
   WsfConstellationMaker maker = WsfConstellationMaker.CreateGeneral(16, 18, 5.0, 360.0);
   maker.SetConstellationName("starlink");
   maker.SetInclination(53.0);
   maker.SetInitialAnomaly(0.0);
   maker.SetInitialRAAN(0.0);
   maker.SetPlatformType("STARLINK");
   maker.SetRevolutionsPerDay(13.3);
   
   // Use the maker object to instantiate the platforms into the scenario. This makes use of a
   // setup script, defined above, to make changes to the comm devices after the platforms
   // have been instantiated.
   WsfConstellation starlink = maker.Create("", "StarlinkSetup");
   
   // Once all of the changes to the comm devices have been made, setup the dedicated, in-plane links
   // between the various members.
   starlink.Apply("AddInPlaneLink");
end_execute

script string CommName(WsfPlatform aPlatform, WsfComm aComm)
   return (aPlatform.Name() + ":" + aComm.Name()); 
end_script

script_variables
   bool sDrawLinks = true;
end_script_variables


// Global accessor; create-on-demand.
script CommLink CommLink_Link(WsfComm aComm)
   if (!aComm.AuxDataExists("Link"))
   {
      CommLink commLink = {};
      commLink.local_comm = aComm;
      commLink.local_comm_name = aComm.Name();
      commLink.local_platform_name = aComm.Platform().Name();
      aComm.SetAuxData("Link", commLink);      
   }
   return ((CommLink)aComm.AuxDataObject("Link")); 
end_script

// Global free method; used within CommLink->Free().
script void CommLink_Free(WsfComm aComm)
   CommLink_Link(aComm).Free();
end_script

script bool CommLink_Establish(WsfComm aComm)
   return CommLink_Link(aComm).Establish();
end_script

script bool CommLink_Linked(WsfComm aComm)
   return CommLink_Link(aComm).Linked();
end_script

script string PlatformCommName(WsfComm aComm)
   return aComm.Platform().Name() + ":" + aComm.Name();
end_script

script bool CommLink_MutuallyLinked(WsfComm aLocalComm, WsfComm aRemoteComm)
   CommLink localLink = CommLink_Link(aLocalComm);
   CommLink remoteLink = CommLink_Link(aRemoteComm);
   return (localLink.Linked() && 
           remoteLink.Linked() && 
          (localLink.RemotePlatformCommName() == PlatformCommName(aRemoteComm)) &&
          (remoteLink.RemotePlatformCommName() == PlatformCommName(aLocalComm)));
end_script

script bool CommLink_MutuallyLinking(WsfComm aLocalComm, WsfComm aRemoteComm)
   CommLink localLink = CommLink_Link(aLocalComm);
   CommLink remoteLink = CommLink_Link(aRemoteComm);
#   writeln(localLink.Linking(), " ",
#           remoteLink.Linking() , " ", 
#           localLink.RemotePlatformCommName(), " ", PlatformCommName(aRemoteComm) , " ",
#           remoteLink.RemotePlatformCommName(), " ", PlatformCommName(aLocalComm));
   return (localLink.Linking() && 
           remoteLink.Linking() && 
          (localLink.RemotePlatformCommName() == PlatformCommName(aRemoteComm)) &&
          (remoteLink.RemotePlatformCommName() == PlatformCommName(aLocalComm)));
end_script

script void CommLink_FreeP(WsfComm aComm)
   CommLink localLink = CommLink_Link(aComm);
   if (localLink.RemotePlatformName() != "") // Hasn't already been freed (as on a track drop)
   {
      WsfAddress lca = aComm.GetAddress();
      WsfPlatform remotePlatform = WsfSimulation.FindPlatform(localLink.RemotePlatformName());
      if (remotePlatform.IsValid())
      {
         string remoteCommName = localLink.RemoteCommName();
         WsfComm remoteComm = remotePlatform.Comm(remoteCommName);
         if (remoteComm.IsValid())
         {
            WsfAddress rca = remoteComm.GetAddress();
            localLink.LocalComm().RemoveConnection(lca, rca);
         }
         else
         {
            writeln("Could not find comm ", remoteCommName);
         }
      }
      else
      {
         writeln("Could not find platform ", localLink.RemotePlatformName());
      }
      localLink.linkable_targets.Erase(localLink.remote_platform_name);
      localLink.remote_platform_name = "";
      localLink.remote_comm_name = "";
      localLink.is_linking = false;
      localLink.is_linked = false;
      if (sDrawLinks)
      {
         WsfDraw draw = {};
         draw.Erase(localLink.local_comm.Platform().Index() * 10000000 + localLink.remote_platform_index);      
      }
      localLink.remote_platform_index = 0;
   }  
end_script

# Return the list of potentially linkable targets.
script Map<string, WsfTrack> CommLink_LinkableTargets(WsfComm aComm)
   return CommLink_Link(aComm).LinkableTargets();
end_script


# New file created by AFSIM Wizard
script bool WithinFieldOfRegard(WsfArticulatedPart aPart,
                                WsfPlatform        aTarget)
   Vec3 targetLocWCS = aTarget.LocationWCS();
   Vec3 myLocWCS = aPart.Platform().LocationWCS();
   Vec3 targetVecWCS = Vec3.Subtract(targetLocWCS, myLocWCS);
   Vec3 targetVecPCS = aPart.ConvertWCSVectorToPCS(targetVecWCS);
   targetVecPCS.Normalize();
   double el = -Math.ASin(targetVecPCS[2]);
   double az =  Math.ATan2(targetVecPCS[1], targetVecPCS[0]);
      
   bool withinEl = (el >= aPart.CueMinimumElevation()) && (el <= aPart.CueMaximumElevation());
   bool withinAz = (az >= aPart.CueMinimumAzimuth())   && (az <= aPart.CueMaximumAzimuth());
      
   return (withinAz && withinEl);
end_script

script WsfVisualPart Comm_Orientation(WsfComm aComm)
   return aComm.Platform().VisualPart(aComm.Name());
end_script
```

### ===== FILE: group.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
group LINKABLE_TARGETS WSF_GROUP 
end_group

group CROSSLINK WSF_GROUP 
end_group

group DOWNLINK WSF_GROUP 
end_group

group DEDICATED_COMM WSF_GROUP 
end_group

group UPLINK WSF_GROUP 
end_group
```

### ===== FILE: config/run.json =====

```text
{"baseConfig":{"highPrecisionCounter":0,"multithreading":0,"pausetoadvancetime":1,"propulsionMethod":2,"recordAer":1,"recordEvent":0,"recordLog":1,"scenariosTime":{"continueTime":20,"startDate":"2026-10-16","startTime":"00:00:00"},"startMode":2,"stepValue":0.1,"terminalLog":1,"timeRate":1.0,"timeType":1},"scenariosId":0}
```

### ===== FILE: output/blank_empty.txt =====

```text
```

### ===== FILE: comm/LASERCOMM_LINK.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************

attenuation laser_link_attenuation WSF_OPTICAL_ATTENUATION
   internal_table mono_1550nm_a2_h1
end_attenuation


## for AFSIM 2.2.3 or custom build with laser transceiver model
comm LASERCOMM_LINK WSF_LASER_TRANSCEIVER  
   on
   
   category linkable
   
   slew_mode azimuth_and_elevation   
   azimuth_slew_rate 30 deg/s
   elevation_slew_rate 30 deg/s  
   azimuth_slew_limits -80 deg 80 deg
   elevation_slew_limits -80 deg 80 deg

   azimuth_slew_limits -80 deg 80 deg
   elevation_slew_limits -80 deg 80 deg
   slew_mode azimuth_and_elevation   
   azimuth_slew_rate 30 deg/s
   elevation_slew_rate 30 deg/s
   
   transmitter
      wavelength                       1550 nanometers
      power                            100 watts   // 1.56 W average power * 64 PPM order

      modulation_type ppm
      ppm_order                        64 // overrides transfer_rate input
      pulse_width                      10  nanoseconds
      aperture_diameter                2.5 cm
      beamwidth                        0.120 deg
      optics_transmission_factor       0.7
      
      attenuation laser_link_attenuation 
      
   end_transmitter
      
   receiver
   
      aperture_diameter                2.5 cm
      optics_transmission_factor       0.7
      quantum_efficiency               0.3
      detector_gain                    1.0

      # Parameters for computing instantaneous field-of-view (IFOV)
      focal_length                     0.1 m // used to calculate fov of sensor for background noise.
      detector_size                    0.0001 m
      
      # Parameters for computing thermal noise
      circuit_temperature              300 K
      circuit_capacitance              1.0E-12 farads
      
      # Parameters for computing background noise
      dark_current                     1 nanoamp
      dark_count_rate                  6231.51 mHz        # Preferred alternative: produces 1 nanoamp
      
   end_receiver
   
end_comm

```

### ===== FILE: comm/UPLINK.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************

include_once comm/LASERCOMM_LINK.txt
comm UPLINK LASERCOMM_LINK
   on
   group_join UPLINK
end_comm
```

### ===== FILE: comm/CROSSLINK.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************

include_once comm/LASERCOMM_LINK.txt
comm CROSSLINK LASERCOMM_LINK 
   group_join CROSSLINK 
end_comm
```

### ===== FILE: comm/DOWNLINK.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************

include_once comm/LASERCOMM_LINK.txt
comm DOWNLINK LASERCOMM_LINK 
   on
   group_join DOWNLINK   
end_comm
```

### ===== FILE: network/starlink_default.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************

# The comm devices for the platform type are added to this network
# by default. Most of the time, the assignments of the comm devices
# to this network would be overridden.
network starlink_default WSF_COMM_NETWORK_GENERIC
   network_address 192.168.1.1/21
end_network
```

### ===== FILE: network/network.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
include_once network/starlink_default.txt
```

### ===== FILE: sensor/UNIFORM_0DBI_PATTERN.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
antenna_pattern UNIFORM_0DBI_PATTERN
  uniform_pattern
    peak_gain 50.0 dB
  end_uniform_pattern
end_antenna_pattern
```

### ===== FILE: signatures/STARLINK_RADAR_SIG.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************

radar_signature STARLINK_RADAR_SIG
  constant 5 dbsm
end_radar_signature
```

### ===== FILE: processor/ESTABLISH_LINK_PROCESSOR.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************

#script_variables
#   extern bool sDrawLinks;
#end_script_variables

# Processor used to establish links with other comm devices.
# Receive control message to establish link 
processor ESTABLISH_LINK_PROCESSOR WSF_TASK_PROCESSOR 

   script_variables
      double mTimeToAcquire = 1.0; // seconds
      bool mIsGimbaled = true;
      Map<WsfTrackId, double> mAcquireTime = {};
      string mTrackProcessorName = "track-proc";
   end_script_variables
   
#   show_state_evaluations 
#   show_state_transitions
#   show_uncompleted_tasks
   
#   on_initialize
#   
#      // Place aux data on each of the laser comm devices to provide a connecting/connected state.
#      for (int commNum; commNum < PLATFORM.CommCount(); commNum = commNum + 1)
#      {
#         WsfComm comm = PLATFORM.CommEntry(commNum);
#         comm.SetAuxData("link_target", "");   // The name of the target platform to which the comm is currently linked (is_linked must be true).
#         comm.SetAuxData("link_comm", "");     // The name of the target comm device on the target platform to which the comm is currently linked (is_linked must be true).
#         comm.SetAuxData("is_linked", false);  // Whether a link has been establised; link_target and link_comm will be valid if this is true.
#         comm.SetAuxData("is_linking", false); // Whether a link is currently being established; this value will continue to be true if is_linked is true.
#      }      
#      
#   end_on_initialize
      
   script WsfComm LocalComm(WsfTrack aTrack)
      return PLATFORM.Comm(aTrack.AuxDataString("local_comm"));
   end_script
   
   script WsfComm SelectComm(WsfPlatform aTarget)
   
      // Pick the first comm that is available and can link to the target.
      WsfComm availableComm;
      for (int commNum; commNum < PLATFORM.CommCount(); commNum = commNum + 1)
      {
         WsfComm comm = PLATFORM.CommEntry(commNum);
         CommLink link = CommLink_Link(comm);
         if (comm.IsTurnedOn() && (!link.Linking()))
         {
            if (CommLink_LinkableTargets(comm).Exists(aTarget.Name()))
            {
               availableComm = comm;
               break;
            }    
         }
      }
      return availableComm;
   end_script
   
   // Receive control messages to potentially initiate acquision of an availble comm device.
   // The message will be of subtype "link" and contain the name of the sending platform and sending comm device,
   // separated by a space, in the message's function.
   on_message type WSF_CONTROL_MESSAGE
      script
         WsfControlMessage msg = (WsfControlMessage)(MESSAGE);
         Array<string> platformComm = msg.Function().Split();
         WsfPlatform target = WsfSimulation.FindPlatform(platformComm[0]);
         
         if (target.IsValid())
         {
            WsfComm comm = SelectComm(target);
            
            if (comm.IsValid())  // A comm was found.
            {
               CommLink link = CommLink_Link(comm);
               
               writeln_d(" found comm " , PLATFORM.Name(), ":", comm.Name()); 
               
               // Attempt to acquire the link.  The link.Linked() flag will return true until link.Free() is called.  
               if (link.Acquire(target.Name(), platformComm[1]))
               {
                  string comment = "CONNECTION_ATTEMPT " + PLATFORM.Name() + ":" + comm.Name() + " to " + target.Name() + ":" + platformComm[1];
                  PLATFORM.Comment(comment);
                  WsfTrack targetTrack = CommLink_LinkableTargets(comm)[target.Name()];
                  targetTrack.SetAuxData("local_comm", comm.Name());
               
                  // The following will kick off a task assignment to acquire the remote comm;
                  // there is no need to explicitly call AssignTask.
                  WsfTrackProcessor trackProc = (WsfTrackProcessor)(PLATFORM.Processor(mTrackProcessorName));
                  WsfLocalTrack lt = trackProc.TrackManager().AddTrackReport(targetTrack);  // track must be in the track list
               }
               else
               {
                  string comment = "CONNECTION_ATTEMPT_FAILED " + PLATFORM.Name() + ":" + comm.Name() + " to " + target.Name() + ":" + platformComm[1];
                  PLATFORM.Comment(comment);
               }
            }
         }
      end_script
   end_on_message
   
   evaluation_interval entry 1.0 s
   
   state entry
      next_state not_linkable
         return !TRACK.Target().GroupMemberOf("LINKABLE_TARGETS");
      end_next_state
      next_state slewing
         return mIsGimbaled;      
      end_next_state
      next_state acquire
         return true;
      end_next_state
   end_state
   
   evaluation_interval not_linkable 1e6 s
   state not_linkable
   end_state
   
   evaluation_interval slewing 0.1 s
   state slewing
      on_entry
         #writeln(LocalComm(TRACK).Name(), " ... slewing to target");
         #LocalComm(TRACK).EnableArticulationUpdates(1.0);
         LocalComm(TRACK).CueToTrack(TRACK);
         TRACK.SetAuxData("begin_slewing", true);
      end_on_entry
      next_state acquire
      
         WsfComm comm = LocalComm(TRACK);
         comm.CueToTrack(TRACK);
         WsfGeoPoint targetLoc = TRACK.Target().Location();
         static double sTOL = 0.5;
         double targetAz = comm.RelativeAzimuthOf(targetLoc); 
         double targetEl = comm.RelativeElevationOf(targetLoc);
         
         if (TRACK.AuxDataBool("begin_slewing"))
         {
            #writeln(TIME_NOW, ": ", PLATFORM.Name(), ":", comm.Name(), ": begin slew");
            TRACK.SetAuxData("begin_slewing", false);
         }
         else
         {
##   Following is valid for AFSIM 2.3+ or custom build only.
##            if ((comm.CurrentCuedAzimuth() == comm.ActualCuedAzimuth()) &&
##                (comm.CurrentCuedElevation() == comm.ActualCuedElevation()))
#            if ((MATH.Fabs(targetAz) < sTOL) &&
#                (MATH.Fabs(targetEl) < sTOL))
#            {                
#               #writeln(TIME_NOW, ": ", PLATFORM.Name(), ":", comm.Name(), ": slew complete");
#               return true;
#            }
#            else
#            {
##               writeln("slew limit exceeded");
##               CancelTask(TRACK.TrackId(), "slew_limit_exceeded");
#               #writeln( TIME_NOW, ": ", PLATFORM.Name(), ":", comm.Name(), " slewing; az, el: ", targetAz, ", ", targetEl); 
#            }
##         }
##         else
##         {
##            writeln( TIME_NOW, ": ", PLATFORM.Name(), ":", comm.Name(), " slewing; az, el: ", targetAz, ", ", targetEl);
            return true; // todo evaluate 
         }
         return false;
      end_next_state
   end_state
   
   evaluation_interval acquire 0.1 s
   state acquire      
      on_entry
         if (!TRACK.Target().IsValid())
         {
            CancelTask(TRACK.TrackId(), "target_invalid");
         }
         // Check LOS??
         mAcquireTime.Set(TRACK.TrackId(), mTimeToAcquire + TIME_NOW);
         #writeln(TIME_NOW, ":", TRACK.TrackId(), " begin acq");
      end_on_entry
      next_state establish
         // automatically transition after delay     
         bool complete = TIME_NOW >= mAcquireTime[TRACK.TrackId()];
         return (complete);
      end_next_state
      on_exit
         mAcquireTime.Remove(TRACK.TrackId());         
      end_on_exit
      
   end_state
   
   evaluation_interval establish 1 s
      state establish
         next_state complete
            WsfComm localComm = LocalComm(TRACK);
            CommLink link = CommLink_Link(localComm);
            WsfComm remoteComm = link.RemoteComm();
            if (remoteComm.IsValid())
            {      
               return (!CommLink_MutuallyLinking(localComm, remoteComm));
            }
            else
            {
               return true;
            }
         end_next_state
         next_state maintain
            #writeln(TIME_NOW, ":", TRACK.TrackId(), " end acq");
            WsfComm localComm = LocalComm(TRACK);
            WsfPlatform target = TRACK.Target();
            bool established = false;     
            if (target.IsValid())
            {  
               CommLink link = CommLink_Link(localComm);
               WsfComm remoteComm = link.RemoteComm();
               if (CommLink_MutuallyLinking(localComm, remoteComm))
               {
                  // Add the bidirectional link.
                  established = link.Establish();
                  if (established)
                  {
                     string comment = "ADD_CONNECTION " + PLATFORM.Name() + ":" + localComm.Name()+ " to "+ target.Name() + ":" + remoteComm.Name();
                     PLATFORM.Comment(comment); 
                     comment = "ADD_CONNECTION " + target.Name() + ":" + remoteComm.Name()+ " to "+ PLATFORM.Name() + ":" + localComm.Name();
                     PLATFORM.Comment(comment); 
                  
                     if (sDrawLinks)
                     {
                        WsfDraw draw = {};
                        draw.SetLineSize(5);
                        draw.SetColor(1.0, 0.2, 0.2);
                        draw.SetId(PLATFORM.Index() * 10000000 + TRACK.TargetIndex());  
                        draw.BeginLines();
                        draw.Vertex(PLATFORM);
                        draw.Vertex(target);
                        draw.End();            
                     }                  
                  }
                  else
                  {
                     if (!link.Linked())
                     {
                        string comment = "CONNECTION_FAILED " + PLATFORM.Name() + ":" + localComm.Name()+ " to "+ target.Name() + ":" + remoteComm.Name();
                        PLATFORM.Comment(comment); 
                     }
                     CommLink remoteLink = CommLink_Link(remoteComm);
                     if (!remoteLink.Linked())
                     {
                        string comment = "CONNECTION_FAILED " + target.Name() + ":" + remoteComm.Name()+ " to "+ PLATFORM.Name() + ":" + localComm.Name();
                        PLATFORM.Comment(comment); 
                     }
                     link.Free();
                  }
               }
            }
            if (!established)
            {
               CancelTask(TRACK.TrackId(), "acquire_fail");
            }
            return established;
            
         end_next_state
   end_state

   evaluation_interval maintain 2 s
   state maintain
      next_state complete
         WsfComm localComm = LocalComm(TRACK);
         WsfPlatform target = TRACK.Target();
         CommLink link = CommLink_Link(localComm);
         if (!link.Linked() ||
             !target.IsValid() || 
             !WithinFieldOfRegard(Comm_Orientation(localComm), target) ||
             !WithinFieldOfRegard(Comm_Orientation(link.RemoteComm()), PLATFORM))
         {
            #writeln(TIME_NOW, " out of for ", TRACK.RawTrack(0).TrackId());
            link.Free();
            WsfTrackProcessor trackProc = (WsfTrackProcessor)(PLATFORM.Processor(mTrackProcessorName));
            trackProc.TrackManager().DropTrack(TRACK.RawTrack(0).TrackId());
            return true;            
         }
         return false;
      end_next_state      
   end_state
   
   evaluation_interval complete 1e6 s
   state complete
      on_entry
          TaskComplete(TRACK.TrackId(), "link");
      end_on_entry
   end_state
      
end_processor
```

### ===== FILE: processor/LINKABLE_TARGETS_PROCESSOR.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************

include_once global_script.txt
# Processor that maintains a list of potenentially linkable targets in aux data.

processor LINKABLE_TARGETS_PROCESSOR WSF_SCRIPT_PROCESSOR
   
   script_variables
      string mTrackProcessorName = "track-proc";
   end_script_variables
   
   on_initialize2
      for (int commNum; commNum < PLATFORM.CommCount(); commNum = commNum + 1)
      {
        WsfComm comm = PLATFORM.CommEntry(commNum);
        if (comm.GroupMemberOf("DEDICATED_COMM"))
        {
           CommLink link = CommLink_Link(comm);
           link.SetDedicated(true);
        }
      }
   end_on_initialize2
   
   script
      bool CanLink(WsfComm aComm, WsfPlatform aTarget)
         bool canLink = false;
         
            if (aComm.CategoryMemberOf("linkable") && 
               !aComm.GroupMemberOf("DEDICATED_COMM") && 
                WithinFieldOfRegard(Comm_Orientation(aComm), aTarget))                  
            {
               if ((aComm.GroupMemberOf("DOWNLINK") && (aTarget.GroupMemberOf("UPLINK"))) ||
                   (aComm.GroupMemberOf("UPLINK") && (aTarget.GroupMemberOf("DOWNLINK"))) ||
                   (aComm.GroupMemberOf("CROSSLINK") && (aTarget.GroupMemberOf("CROSSLINK"))))
               {
                  canLink = true;
               }
            }
                  
         return canLink;
   end_script
   
   on_message
      type WSF_TRACK_MESSAGE
         script
            WsfTrackMessage trackMsg = (WsfTrackMessage)MESSAGE;
            WsfPlatform target = trackMsg.Track().Target();
            if (target.IsValid() && (target.GroupMemberOf("LINKABLE_TARGETS")))
            {               
               for (int commNum; commNum < PLATFORM.CommCount(); commNum = commNum + 1)
               {
                  WsfComm comm = PLATFORM.CommEntry(commNum);
                  if (CanLink(comm, target))
                  {
                     WsfTrack track = WsfTrack(trackMsg.Track()); // THIS TRACK WILL BE PURGED
                     #WsfTrack track = target.MakeTrack();   // THIS TRACK WILL NOT BE PURGED (MUST BE DELETED)
                     CommLink_LinkableTargets(comm).Set(target.Name(), track);
                     #PLATFORM.Comment(PLATFORM.Name()+ ":"+ comm.Name()+ " can link with "+ target.Name());             
                  }
               }
            }
         end_script
      type WSF_TRACK_DROP_MESSAGE
         script
         WsfTrackDropMessage trackMsg = (WsfTrackDropMessage)MESSAGE;
            WsfPlatform target = WsfSimulation.FindPlatform(trackMsg.TargetIndex());
            if (target.IsValid() && (target.GroupMemberOf("LINKABLE_TARGETS")))
            {
               string targetName = target.Name();
               for (int commNum; commNum < PLATFORM.CommCount(); commNum = commNum + 1)
               {
                  WsfComm comm = PLATFORM.CommEntry(commNum);
                  CommLink link = CommLink_Link(comm);
                  if (link.Linking() && link.RemotePlatformName() == target.Name())
                  {
                      WsfComm linkComm = link.RemoteComm();
                      string linkCommName = linkComm.Name();
                      
                      CommLink remoteLink = CommLink_Link(linkComm);
                      
                      link.Free();
                      WsfTrackProcessor trackProc = (WsfTrackProcessor)(PLATFORM.Processor(mTrackProcessorName));
                      trackProc.TrackManager().DropTrack(trackMsg.TrackId());                      
                  }

                  CommLink_LinkableTargets(comm).Erase(target.Name());                  
               }               
            }
            
            if (sDrawLinks)
            {
               WsfDraw draw = {};
               draw.Erase(PLATFORM.Index() * 10000000 + trackMsg.TargetIndex());  
               draw.Erase(trackMsg.TargetIndex() * 10000000 + PLATFORM.Index());  
            }
            
      end_script
   end_on_message
end_processor
```

### ===== FILE: platform/STARLINK_LINKABLE.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************

# New file created by AFSIM Wizard

# Define the capability to communicate with
# the starlink constellation.
# This file should be "include"-ed directy in platform_type definitions.  For example:
#
#   platform_type 
#      include platforms/starlink_linkable.txt
#   end_platform_type
#
# This definition uses 
#   processors/establish_link_processor.txt
# and 
#   processors/linkable_targets_processor.txt
# these must be included elsewhere in the scenario, or:
#
#   include_once starlink_linkable_setup.txt
#
   
   group_join LINKABLE_TARGETS
   
   // Provide a sensor that detects potential targets/comms to link with.
   // These are refined in link-proc
   sensor detect WSF_GEOMETRIC_SENSOR
      on
      reports_location
      maximum_range 1500 km
      frame_time 20 sec
      azimuth_field_of_view -180 deg 180 deg
      elevation_field_of_view -90 deg 90 deg
      processor link-proc
   end_sensor
   
   // From an initial list of potential linkable targets, refine these to 
   // only those candidates that match requirements.
   processor link-proc LINKABLE_TARGETS_PROCESSOR 
   end_processor
   
   processor track-proc WSF_TRACK_PROCESSOR
      non_master_track_processor
      uncorrelated_track_drops enable
   end_processor
   
   // Provide the means to Establish, maintain, and drop a point-to-point duplex link.
   processor establish-link-processor ESTABLISH_LINK_PROCESSOR 
      track_processor track-proc
   end_processor
   
   processor establish-link-injector WSF_SCRIPT_PROCESSOR
      internal_link establish-link-processor
   end_processor
   
   script bool RequestLink(WsfComm aLocalComm, WsfComm aTargetComm)
      Map<string, WsfTrack> targetLinkableTargets = CommLink_LinkableTargets(aTargetComm);
      bool linkable = targetLinkableTargets.Exists(PLATFORM.Name());
      bool isLinking = CommLink_Link(aTargetComm).Linking();
      if (linkable && !isLinking)
      {
          WsfControlMessage msg = {};
          msg.SetSubType("link");
          WsfPlatform target = aTargetComm.Platform();
          
          CommLink link = CommLink_Link(aLocalComm);
          link.Acquire(target.Name(), aTargetComm.Name());
          
          msg.SetFunction(PLATFORM.Name() + " " + aLocalComm.Name()); // These are retrieved in the saved message
          writeln_d("linking commm ", PLATFORM.Name(), ":", aLocalComm.Name(), " to ", target.Name(), ":", aTargetComm.Name());
          target.Processor("establish-link-injector").SendMessage(msg);
       }
       return linkable;
   end_script
   
   // Automatically attempt to link a comm with a comm on a target platform.
   script bool AttemptLinks(WsfComm aComm)
      bool found = false;
      CommLink link = CommLink_Link(aComm);
      if (!link.Linking())
      {
         Map<string, WsfTrack> linkableTargets = CommLink_LinkableTargets(aComm);
         foreach(string name: WsfTrack track in linkableTargets)
         {
            WsfPlatform target = WsfSimulation.FindPlatform(name);
            if (target.IsValid())
            {
               for (int commNum = 0; commNum < target.CommCount(); commNum = commNum + 1)
               {
                  // This is an optimization.
                  WsfComm targetComm = target.CommEntry(commNum);
                  CommLink targetLink = CommLink_Link(targetComm);
                  if (!targetLink.Linking())
                  {
                     if (RequestLink(aComm, targetComm))
                     {
                        break;
                     }
                  }
               }
            }
         }
      }
      return found;
   end_script

   processor establish-ad-hoc-connections WSF_SCRIPT_PROCESSOR
      on_initialize
         SetUpdateInterval(10.0 + MATH.RandomUniform() - 0.5);  // introduce some randomness in update times
      end_on_initialize
      
      on_update
         for (int commNum = 0; commNum < PLATFORM.CommCount(); commNum += 1)
         {
            WsfComm comm = PLATFORM.CommEntry(commNum);
            if (!comm.GroupMemberOf("DEDICATED_COMM"))
            {
               AttemptLinks(comm);
            }
         }         
      end_on_update
   end_processor
   
```

### ===== FILE: platform/STARLINK.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************

# New file created by AFSIM Wizard
include_once comm/CROSSLINK.txt
include_once comm/DOWNLINK.txt
include_once signatures/STARLINK_RADAR_SIG.txt
include_once network/starlink_default.txt
include_once processor/LINKABLE_TARGETS_PROCESSOR.txt
include_once global_struct.txt
include_once global_script.txt

platform_type STARLINK WSF_PLATFORM
   
   include platform/STARLINK_LINKABLE.txt
   
   icon cubesat
   radar_signature STARLINK_RADAR_SIG
   side blue
   
   commander commander1
   
   group_join DOWNLINK
   group_join CROSSLINK
   
   mover WSF_SPACE_MOVER
      semi_major_axis 7178 km
      inclination 72 deg
   end_mover
   
   router default WSF_COMM_ROUTER
      automated_interface_linking true
   end_router
   
   comm crosslink1 CROSSLINK
      yaw 0 deg      
      group_join DEDICATED_COMM  // links only to forward satellite
      network_name starlink_default
   end_comm
   
   visual_part crosslink1 WSF_VISUAL_PART
      yaw 0 deg
      azimuth_slew_limits -80 deg 80 deg
      elevation_slew_limits -80 deg 80 deg
   end_visual_part
   
   comm crosslink2 CROSSLINK 
      yaw 180 deg
      group_join DEDICATED_COMM  // links only to rearward satellite
      network_name starlink_default
   end_comm
   
   visual_part crosslink2 WSF_VISUAL_PART
      yaw 180 deg
      azimuth_slew_limits -80 deg 80 deg
      elevation_slew_limits -80 deg 80 deg
   end_visual_part

   comm crosslink3 CROSSLINK 
      yaw -90 deg
      network_name starlink_default
   end_comm
   
   visual_part crosslink3 WSF_VISUAL_PART
      yaw -90 deg
      azimuth_slew_limits -80 deg 80 deg
      elevation_slew_limits -80 deg 80 deg      
   end_visual_part

   comm crosslink4 CROSSLINK
      yaw 90 deg
      network_name starlink_default
   end_comm

   visual_part crosslink4 WSF_VISUAL_PART
      yaw 90 deg
      azimuth_slew_limits -80 deg 80 deg
      elevation_slew_limits -80 deg 80 deg
   end_visual_part

   comm downlink DOWNLINK
      pitch -90 deg           
      group_join DOWNLINK
      network_name starlink_default
   end_comm
   
   visual_part downlink WSF_VISUAL_PART
      pitch -90 deg
      azimuth_slew_limits -80 deg 80 deg
      elevation_slew_limits -80 deg 45 deg
   end_visual_part

end_platform_type
```

### ===== FILE: platform/UPLINK.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************

# Uplink
include_once sensor/UNIFORM_0DBI_PATTERN.txt
include_once processor/ESTABLISH_LINK_PROCESSOR.txt
include_once processor/LINKABLE_TARGETS_PROCESSOR.txt
include_once comm/UPLINK.txt
include_once global_struct.txt
include_once global_script.txt

platform_type UPLINK WSF_PLATFORM 

  include platform/STARLINK_LINKABLE.txt
    
  group_join UPLINK
  
  comm uplink UPLINK
     group_join UPLINK
     pitch 90 deg 
  end_comm

  visual_part uplink WSF_VISUAL_PART
     pitch 90 deg
     azimuth_slew_limits -80 deg 80 deg
     elevation_slew_limits -80 deg 80 deg     
  end_visual_part
  
  edit sensor detect  
     // Set realistic angles for laser transmission.
     elevation_scan_limits 30 deg 90 deg 
  end_sensor
  
end_platform_type
```

### ===== FILE: side/blue.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************

# The commander can receive any starlink related communcations.
platform commander1 UPLINK
  commander SELF
  side blue
  icon cmd_post
  position 38.7372n 104.8808w

  comm uplink
     network_name commander1
  end_comm
  
end_platform
```

### ===== FILE: side/green.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************

# This is an example of a ground platform transmitting to the starlink constellation.
platform sender1 UPLINK

  commander SELF
  side green
  icon cmd_post
  position 35:25:28.276n 83:38:16.705e
  altitude 100 ft
  
  comm uplink
     network_name sender1
     pitch 90 deg
  end_comm
  
  // test script
  execute at_interval_of 10 s
     if (TIME_NOW > 60.0)
     {
         WsfMessage msg = WsfMessage();
         msg.SetSubType("blah blah blah");
         WsfPlatform sender = WsfSimulation.FindPlatform("sender1");
         WsfComm uplink = PLATFORM.Comm("uplink");
         CommLink link = CommLink_Link(uplink);
         WsfAddress uplinkAddr = WsfSimulation.FindPlatform("commander1").Comm("uplink").GetAddress();
         if (link.Linked() && 
             uplink.PathExistsTo(uplinkAddr))
         {
            uplink.SendMessage(msg, uplinkAddr);
         }
#         if (!uplink.PathExistsTo("commander1", "uplink"))
#         {
#             writeln(TIME_NOW, ": No path to commander"); 
#         }
      } 
   end_execute

end_platform
```
---

## 4. 使用指引

### 4.1 看点速览（这个案例演示什么）

- **★ 运行期造星座（本案例最有价值的一段）**：入口里只有一条 `execute at_time 1.0e-10 s absolute`，三行核心代码就把 288 颗卫星造出来并配好链路：
  1. `WsfConstellationMaker maker = WsfConstellationMaker.CreateGeneral(16, 18, 5.0, 360.0);` —— 16 个轨道面 × 18 颗/面，随后 `SetConstellationName` / `SetInclination(53.0)` / `SetInitialAnomaly` / `SetInitialRAAN` / `SetPlatformType("STARLINK")` / `SetRevolutionsPerDay(13.3)` 逐项配置；
  2. `WsfConstellation starlink = maker.Create("", "StarlinkSetup");` —— **第 2 个参数是"每个成员造好后回调的脚本名"**，`StarlinkSetup(WsfConstellation, int aPlane, int aSat, WsfPlatform)` 在每颗星实例化后被调用；
  3. `starlink.Apply("AddInPlaneLink");` —— **第 1 个参数同样是脚本名**，`AddInPlaneLink(...)` 给同面相邻星（`NextSatelliteInPlane` / `PreviousSatelliteInPlane`）挂**专用固定链路**。
  这套"**造机 → 回调改属性 → 回调连线**"的 API 范式，比手写 288 个 `platform` 块清晰得多（`scenarios/starlink_autogen.txt` 就是手写版的 9,804 行产物，可对照）。
- **★ 运行期改网络成员**：`AddCommToNewNetwork(WsfPlatform, string)` 演示了完整的"**换网**"流程 —— 新建 `WsfNetworkGeneric` 并 `SetName`（名字 = `<comm名>_<平台名>`，保证一机一网）→ `WsfNetwork.AddNetwork(network)` → 从旧网 `WsfNetwork.GetNetwork(comm.NetworkName())` 里 `RemoveMember(平台名, comm名)` → `network.AddMember(comm)`。`StarlinkSetup` 对每颗星的 `crosslink1..4` 和 `downlink` 各调一次，然后**双循环**把同一平台上所有 comm 两两 `AddConnection`（因为换网后地址变了，原来的 router 自动互连失效）。
- **★ 自定义脚本类 `script_struct CommLink`**（`global_struct.txt`，196 行）：AFSIM 里"**给对象挂状态**"的标准做法。类里持有 `WsfComm local_comm` / `remote_comm`、平台与 comm 名、`is_linking` / `is_linked` / `is_dedicated` 标志、`Map<string, WsfTrack> linkable_targets`。**实例不是 new 出来的，而是挂在 comm 设备的 AuxData 上**：`aComm.SetAuxData("Link", commLink)` 存入、`(CommLink)aComm.AuxDataObject("Link")` 取出，统一入口是 `CommLink_Link(WsfComm)`（**create-on-demand**：不存在就建一个挂上去再返回）。
  类里还大量用 `extern` 声明外部自由函数（`CommLink_MutuallyLinking` / `CommLink_Linked` / `CommLink_Establish` / `CommLink_FreeP`），把"**类内方法**"与"**类外的全局函数**"接起来 —— 这些全局函数就定义在 `global_script.txt` 里（`CommLink_Link` / `CommLink_Free` / `CommLink_Establish` / `CommLink_Linked` / `CommLink_MutuallyLinked` / `CommLink_MutuallyLinking` / `CommLink_FreeP` / `CommLink_LinkableTargets`）。
- **★ 激光通信模型**（`comm/LASERCOMM_LINK.txt`）：`WSF_LASER_TRANSCEIVER` 的 `transmitter` 段齐备 —— `wavelength 1550 nanometers` / `power 100 watts` / `modulation_type ppm` / `ppm_order 64` / `pulse_width 10 nanoseconds` / `aperture_diameter 2.5 cm` / `beamwidth 0.120 deg` / `optics_transmission_factor 0.7`，并用 `attenuation laser_link_attenuation` 指向一个 `WSF_OPTICAL_ATTENUATION` 块；`receiver` 段覆盖**量子效率 / 探测器增益 / IFOV（`focal_length` + `detector_size`）/ 热噪声（`circuit_temperature` + `circuit_capacitance`）/ 背景噪声（`dark_current` / `dark_count_rate`）**。三处注释直接写明各参数"用来算什么"，是学习光学通信模型的现成讲义。
- **五组 + category 决定"谁能连谁"**：`group.txt` 定义 5 个空 `WSF_GROUP`（`LINKABLE_TARGETS` / `CROSSLINK` / `DOWNLINK` / `DEDICATED_COMM` / `UPLINK`）；`comm LASERCOMM_LINK` 带 `category linkable`；判定逻辑集中在 `LINKABLE_TARGETS_PROCESSOR` 的 `CanLink(WsfComm, WsfPlatform)`：`CategoryMemberOf("linkable")` + **排除** `DEDICATED_COMM` + `WithinFieldOfRegard(...)` + **上下行必须配对**（`DOWNLINK↔UPLINK`）或**同向**（`CROSSLINK↔CROSSLINK`）。
- **七态建链状态机**（`processor/ESTABLISH_LINK_PROCESSOR.txt`，300 行，`WSF_TASK_PROCESSOR`）：`entry` →（`not_linkable` 死等 / `slewing` 指向 / `acquire` 计时）→ `establish`（互认后 `link.Establish()` 建双向连接）→ `maintain`（每 2 s 检查 `WithinFieldOfRegard`，出视野就 `link.Free()` + `DropTrack`）→ `complete`。每个状态都配了 `evaluation_interval`（`0.1 s` / `1 s` / `2 s` / `1e6 s`），演示"**用 `1e6 s` 让状态'睡着'**"的惯用法。`on_message type WSF_CONTROL_MESSAGE` 收对端发来的建链请求，`msg.Function().Split()` 拆出"平台名 comm名"。
- **指向与视野判定**：`global_script.txt` 里的 `WithinFieldOfRegard(WsfArticulatedPart, WsfPlatform)` 用 `LocationWCS()` 取世界坐标 → `Vec3.Subtract` → `ConvertWCSVectorToPCS` 转到部件坐标系 → `Math.ASin` / `Math.ATan2` 算方位俯仰 → 与 `CueMinimum/MaximumAzimuth/Elevation()` 比对。`Comm_Orientation(WsfComm)` 则用 `aComm.Platform().VisualPart(aComm.Name())` 把"**comm 与其同名 visual_part**"关联起来（所以 `platform/STARLINK.txt` 里每个 `comm crosslinkN` 都配了一个同名 `visual_part crosslinkN`）。
- **可链接目标维护**（`processor/LINKABLE_TARGETS_PROCESSOR.txt`）：`on_message type WSF_TRACK_MESSAGE` 收到目标航迹后，遍历本机所有 comm，`CanLink` 通过就 `CommLink_LinkableTargets(comm).Set(target.Name(), track)` 塞进 map；`on_message type WSF_TRACK_DROP_MESSAGE` 时反向清理（`link.Free()` + `DropTrack` + `Erase`）。`on_initialize2` 里把 `GroupMemberOf("DEDICATED_COMM")` 的 comm 标记为 `SetDedicated(true)`。
- **可视化**：`event_pipe.txt` 里 `enable DRAW`，配合脚本里的 `WsfDraw`（`SetLineSize(5)` / `SetColor(1.0, 0.2, 0.2)` / `SetId(平台索引*10000000 + 目标索引)` / `BeginLines` / `Vertex(平台)` / `End`），把动态链路画成红线；断开时用同一个 `SetId` 算式 `Erase` 抹掉。
- **`include` 内联片段复用平台能力**：`platform/STARLINK_LINKABLE.txt`（130 行）是一段**没有 `platform_type` 头尾的裸片段**（`group_join` + `sensor detect` + 3 个 `processor` + 3 个 `script` + 1 个 `WSF_SCRIPT_PROCESSOR`），被 `platform/STARLINK.txt` 和 `platform/UPLINK.txt` **各自 `include` 一次**，从而把"能建立点对点激光链路"的能力**注入两个不同的平台类型**。文件自己的注释就写明了用法：`# This file should be "include"-ed directy in platform_type definitions.`（原文拼写如此）

### 4.2 怎么跑

1. 按 §1 的 tree 把 **23 个文件**复原为目录（`space_operations/` 为工程根）。
2. 打包为 ZIP：**ZIP 名与入口同名** —— `space_operations.zip`，内含 `space_operations.txt` 于**压缩包根目录**。
3. 交给 AFSIM：本案例**仅通过语法校验，未跑仿真**。
   - 校验通道：`mcp__afsim__validate_scenario`（或等价 HTTP `POST /api/v1/scenarios/validate`）；判据只看 `valid`（语法对错都返回 200）。
4. 仿真时长 `end_time 2000 s`，起始 `start_date nov 1 2019` / `start_time 07:30:00`；输出落在 `output/`（`lasercomm_scripted.evt` / `.aer`，**文件名沿用源入口名**，见 §4.3）。

> ⚠️ **改名注意**：入口内的 `define_path_variable CASE space_operations` 是规范要求（A3），但本案例**源入口没有 `$(CASE)` 引用**（输出文件名仍是 `output/lasercomm_scripted.*`），故该变量目前未被使用；若要改工程名，须同步改入口文件名的 basename，**且保证全工程只有这一个文件与工程同名**（服务端按 `<工程名>.txt` 定位启动文件，大小写不敏感、不区分路径，出现两个即报"启动文件不唯一"）。

### 4.3 可借鉴 / 勿照抄

| 可借鉴 | 说明 |
| :-- | :-- |
| 运行期造机三件套 | `WsfConstellationMaker.CreateGeneral(...)` → `maker.Create("", "<造后回调脚本名>")` → `constellation.Apply("<连线回调脚本名>")` |
| 用 AuxData 挂自定义对象 | `aComm.SetAuxData("Link", commLink)` + `(CommLink)aComm.AuxDataObject("Link")`；统一入口 `CommLink_Link()` 做 create-on-demand |
| 类内 `extern` 声明 + 类外自由函数 | `script_struct` 里声明 `extern bool CommLink_Linked(WsfComm);`，实现放 `global_script.txt` |
| 运行期换网 | `WsfNetworkGeneric` + `WsfNetwork.AddNetwork` / `GetNetwork` / `RemoveMember` / `AddMember` |
| `category` + `group` 做可链接性判定 | `CategoryMemberOf("linkable")` + `GroupMemberOf("DEDICATED_COMM")` 排除 + 上下行配对 |
| `include` 内联片段复用能力 | 裸片段文件（无 `platform_type` 头尾）被多个 `platform_type` 各 `include` 一次 |
| `1e6 s` 让状态睡着 | `evaluation_interval not_linkable 1e6 s` + 空 `state not_linkable end_state` |
| 视野判定 | `LocationWCS()` → `ConvertWCSVectorToPCS` → `Math.ASin` / `Math.ATan2` 对比 `Cue*` 限值 |
| `WsfDraw` 画/抹动态链路 | `SetId(平台索引*10000000 + 目标索引)` 保证画与抹用同一 ID；`event_pipe` 里 `enable DRAW` |
| `comm` 继承基类 | `comm UPLINK LASERCOMM_LINK` 继承 `comm LASERCOMM_LINK WSF_LASER_TRANSCEIVER` 的全部参数，只覆写差异 |

| 勿照抄 | 原因 |
| :-- | :-- |
| `slewing` 状态里的大段注释代码 | 含 `##` 与 `#` **两层**注释（`##` 是"仅 AFSIM 2.3+ 有效"的备选写法），官方为版本兼容留的历史快照；本案例原样保留 |
| `processor/ESTABLISH_LINK_PROCESSOR.txt` 顶部的 `#script_variables` / `#on_initialize` | 整段被注释掉（已被 `CommLink` 类取代），历史快照，原样保留 |
| `comm LASERCOMM_LINK` 里 `slew_mode` / `azimuth_slew_limits` 等**重复出现两次** | 官方文件如此（第 22-26 行与第 28-32 行内容重叠），原样保留 |
| 入口 `event_output` 的 `file output/lasercomm_scripted.evt`、`event_pipe` 的 `output/lasercomm_scripted.aer` | 沿用源入口名；**忠实原样未改**。新工程建议写 `output/$(CASE).evt` / `.aer` 并让 `$(CASE)` 真正生效 |
| `platform/UPLINK.txt` 里 `edit sensor detect` 去改 `platform/STARLINK_LINKABLE.txt` 定义的 sensor | 跨文件 `edit`（先 `include` 片段再改）能跑，但**可读性差**；新工程建议把差异参数提到片段内用变量或直接分叉两份片段 |
| `scenarios/starlink_autogen.txt`（9,804 行 / 288 实例） | 与 `lasercomm_scripted` **二选一**（等价星座的两种写法），同时收会重复定义 |
| 另 19 个顶层入口 + 15 个 `scenarios/*` 入口 | 各有各的闭包，同时收会重复定义；本案例只收 `lasercomm_scripted` |
| `weapons/blue_naval_sam_launch_data.txt`（192,099 行数据表） | 属另一个入口（`launch_vehicle_interdiction`）的闭包，且按 §4 判定树"数据表只登记不收录" |

### 4.4 对应关系

本案例的写法在本 Skill 内的权威参考：

| 本案例演示的写法 | 权威参考 |
| :-- | :-- |
| 目录划分与装配顺序 | `blueprints/layout/layout.md`、`blueprints/layout/assembly.md` |
| `script_struct` + `AuxData` 挂对象 | `knowledge/language/script-types.md`、`knowledge/language/script-api.md` |
| `comm` / `network` / `group` 与 `category` | `knowledge/system-of-systems/sensor-network.md`、`knowledge/blocks/commands.md` |
| 激光通信模型参数 | `knowledge/blocks/sensors.md` |
| 七态建链状态机（`WSF_TASK_PROCESSOR`） | `knowledge/language/script-types.md`、`knowledge/blocks/pitfalls.md` |

### 4.5 改造中实测到的坑

1. **★ 行级保真审计的判据**：`space_operations` 归一化后，块计数对比 **30 类块全部一致、0 项差异**；行级审计的差异（**19 行次"原始多于改造后" + 33 行次"改造后多于原始"**，去空去横幅后 1,071 → 1,085 行次）**全部是 `include` / `include_once` 装配行与 `define_path_variable`**。其中"净消失"的 2 行是 `include_once platforms/uplink.txt`（源 `scenarios/ground_segment.txt` 内）与 `include_once platforms/starlink_linkable_setup.txt`（源入口内），**职责已被入口的 `include_once setup.txt` 与入口自身的装配链等价承接**（见下条）。
2. **★★ `include` 内联片段绝不可在顶层 `include_once`（本轮踩到的唯一硬错误）**：`platform/STARLINK_LINKABLE.txt` 是**裸片段**（`group_join` / `sensor` / `processor` / `script`），必须留在 `platform_type` **体内**。首轮归一化我误把它当成普通组件、在 `platform/STARLINK.txt` 与 `platform/UPLINK.txt` 顶层各加了一句 `include_once platform/STARLINK_LINKABLE.txt`，Step 3 校验直接报：
   ```text
   ***** ERROR: Unknown command: group_join
            'platform\STARLINK_LINKABLE.txt', line 30, near column 14
   ```
   根因：`group_join` 只在 `platform_type` / `comm` 等**块体内**合法，顶层解析即报未知命令。**修法**：删掉两句顶层 `include_once`，把体内原来的 `include platforms/starlink_linkable.txt` **改写路径**为 `include platform/STARLINK_LINKABLE.txt`（**关键字仍是 `include`，不是 `include_once`**）。
3. **★ 内联片段必须用 `include` 而非 `include_once`**：`STARLINK` 与 `UPLINK` 两个 `platform_type` **都要各内联一份**同一片段。若写 `include_once`，第二个平台会因"该文件已引入过"而**静默跳过**，导致 `platform_type UPLINK` 缺少 `group_join LINKABLE_TARGETS` / `sensor detect` / `establish-link-processor` 等一整块能力 —— **不报错，但语义已变**。这也正是片段文件自己的注释写明 "should be `include`-ed" 的原因。
4. **★ 行级审计只能查"数量"，查不出"路径改写漏做"**：本轮 `include platforms/starlink_linkable.txt` 在改造前后**各出现 2 次**，多重集计数完全相等 → 审计**零告警**；但该路径在改造后**已不存在**（`platforms/` 目录已并入 `platform/`）。是补做的一道「**include 目标存在性检查**」（遍历全工程 `include` / `include_once` 行，验证目标文件存在）才把这两条**悬空 include** 抓出来。**结论：改造自检必须"块计数 + 行级审计 + include 存在性检查"三道并行**，前两道都通过不代表工程可跑。
5. **入口文件头描述注释必须原样保留**：`lasercomm_scripted.txt` 的 L9-19 是一整块描述性注释（"A demonstration using the AFSIM lasercomm model…"共 11 行），首轮归一化时**只取了仿真控制与 `event_output` 两段、漏了它**；行级审计报出 10 行"原始 N → 改造后 0"才发现。**教训：`seg()` 切块时，块**上方**的注释属于该块，切区间起点要往前吃到注释**。补回后审计即收敛到"只剩 include 行"。
6. **`group` 块从 4 个源文件汇聚到 `group.txt`**：5 个 `group` 块原本散在 `processors/linkable_targets_processor.txt`（`LINKABLE_TARGETS`）、`comms/crosslink.txt`（`CROSSLINK`）、`comms/downlink.txt`（`DOWNLINK`）、`comms/uplink.txt`（`UPLINK`）、`platforms/starlink.txt`（`DEDICATED_COMM`）。按映射表 `group → group.txt` 汇聚，**顺序沿用"处理器 → comm → 平台"的首次出现序**，块计数 5/5 一致。
7. **`script_struct` 与它的配套自由函数必须分家**：`scripts/comm_link.txt`（290 行）前段是 `script_struct CommLink`（L19-196），后段是 9 个**顶层** `CommLink_*` 自由函数（L196-290）。按映射表 `script_struct → global_struct.txt`、顶层 `script → global_script.txt`，于是**一个源文件被拆进两个根文件**。同时 `processors/establish_link_processor.txt` 的 `script string CommName(...)`、`processors/linkable_targets_processor.txt` 的 `script_variables bool sDrawLinks` 也都是**顶层**定义，一并归 `global_script.txt`。
8. **`attenuation` 块无规范归属 → 随 `comm/` 就地保留**：`WSF_OPTICAL_ATTENUATION`（`internal_table mono_1550nm_a2_h1`）在规范映射表里没有对应目录。它被 `comm LASERCOMM_LINK` 的 `transmitter` 段以 `attenuation laser_link_attenuation` **按名引用**，故与 `comm/` 同文件就地保留（同 `ship_ad` 的 `filter` 就地保留、`outer_air_battle` 的 `script_interface` 就地保留，处置口径一致）。
9. **`comm` 定义是"继承式"，三处 `include_once` 是必需依赖**：`comm UPLINK LASERCOMM_LINK` / `comm CROSSLINK LASERCOMM_LINK` / `comm DOWNLINK LASERCOMM_LINK` 都继承基类，所以 `comm/UPLINK.txt` / `CROSSLINK.txt` / `DOWNLINK.txt` **各自开头都要 `include_once comm/LASERCOMM_LINK.txt`**（3 次，`include_once` 会去重，不会重复定义）。这是 A6「依赖补齐」的正当产物，不是内容新增。
10. **"纯装配文件"的职责被入口吸收**：`platforms/starlink_linkable_setup.txt` 只有 1 段注释 + 3 个 `include_once`（`processors/establish_link_processor.txt` / `processors/linkable_targets_processor.txt` / `scripts/comm_link.txt`），没有定义任何块。归一化后这 3 个依赖由入口的 `include_once global_struct.txt` + `global_script.txt` + `processor/*` 承接，注释留在入口；同理 `scenarios/ground_segment.txt` 的 `include_once platforms/uplink.txt` 由 `setup.txt` 的 `include_once platform/UPLINK.txt` 承接（等价）。
11. **`side/` 按阵营拆分**：`scenarios/ground_segment.txt` 含 2 个 `platform` 实例（`commander1` 属 `blue`、`sender1` 属 `green`）→ 拆成 `side/blue.txt` + `side/green.txt`，拆点落在两个实例之间，**未切断任何实例**；文件内的原注释（"The commander can receive any starlink related communcations." 等）随各自实例走。
12. **`file_path .` 必须保留**：AFSIM 的 `include_once` 按 `file_path` 搜索，工程内所有相对路径都相对**工程根** —— 这也是为什么 `platform/STARLINK.txt` 体内写 `include platform/STARLINK_LINKABLE.txt`（工程根相对路径），而不是同目录的 `STARLINK_LINKABLE.txt`。
13. **`closure.py` 不识别 `../` 相对路径**：源文件用 `include_once ../comms/crosslink.txt` 这类写法，闭包脚本会生成 `platforms/../comms/crosslink.txt` 这样的条目。本案例**改为手工列 15 个去重后的工程根相对路径**生成清单，避免清单与打包不一致。
14. **选摘决策：`lasercomm_scripted` 而非 `lasercomm`**：`lasercomm` 入口闭包 17 文件 / 11,142 行，其中 9,804 行是 `scenarios/starlink_autogen.txt`（288 个 `platform` 实例的预生成版）；`lasercomm_scripted` 闭包 15 文件 / 1,376 行，**用 `WsfConstellationMaker` 在运行期造同样的星座**，`group` / `network` / `script_struct` / 激光 `comm` 四项一个不少。按 §6「宁可选摘，不要塞爆」取后者。备选 `launch_vehicle_interdiction`（17 文件 / 1,300 行，但会牵入 `weapons/*_launch_data.txt` 大表）未选。
15. **非文本资产一律不进**：原 demo 的 `README.md` / `doc/space_operations.rst` / `doc/images/space_operations.png` / `launch_vehicles/AAA_README.TXT` 均**不进**改造工程（§11.2 铁律 3：改造后工程只允许 `.txt` + `config/run.json`）。

### 4.6 许可说明

原始 AFSIM 官方 demo 文件头部含 CUI（受控非密信息）横幅：

```text
# CUI
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
```

本案例**原样保留**该横幅（未剥离、未改写），并在每个文件头部呈现。使用与再分发须遵守原始许可（另见方案 §12 R1）。
