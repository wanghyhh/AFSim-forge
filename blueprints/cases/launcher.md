# 案例：launcher（地空导弹拦截空中目标）

> **任务类型**：陆基防空 —— SAM 拦截（探测 → 交战 → 发射 → 引爆）
> **来源**：AFSIM 官方 demo `launcher` 的入口 `1st_run.txt`（改造后收录）
> **改造说明**：**仅结构改造，内容未增删** —— 块计数对比 **0 项差异**、行级审计**丢失 0 行 / 新增 0 行**；无骨架补齐
> **规模**：16 个文件 / 462 行（`processor/SAM_TACTICS_PROCESSOR.txt` 112、`launcher.txt` 80、`weapon/SAM_MISSILE.txt` 58、`sensor/RADAR_SET.txt` 43）
> **结构**：根文件 5（入口 / `event_pipe.txt` / `global_env.txt` / `global_script.txt` / `setup.txt`）+ 目录 9（`config/`、`mover/`、`output/`、`platform/`、`processor/`、`sensor/`、`side/`、`weapon/`、`weapon_effects/`）
> **自包含**：是（无跨工程依赖）
> **许可 / 限制**：原始 demo 头部的受控标记已中性化移除，内容未增删（见 §4.6）
> **亮点**：① **完整武器链路**（`aero` → 弹体 `platform_type` → `weapon` → `weapon_effects`）；② **任务处理器状态机**（`DETECTED` ↔ `ENGAGE`）；③ 事件输出**逐项 enable 白名单**；④ 多入口"逐步加复杂度"演进（本案例收最简的 1st）
> **对应**：结构 → `blueprints/layout/layout.md`；武器 → `knowledge/blocks/commands.md`；处理器 → 本案例 `processor/`

---

## 1. 文件结构

```text
launcher/
├── launcher.txt                         80   ★ 入口（装配总纲 + event_output）
├── setup.txt                            14   平台装配（include 全部 platform/*）
├── event_pipe.txt                       10   aer 记录配置
├── global_env.txt                       13   全局环境（terrain 块）
├── global_script.txt                    13   全局脚本（script_interface）
├── config/
│   └── run.json                          1   运行控制（scenariosId 留空 0）
├── output/
│   └── blank_empty.txt                   0   占位（保证 output/ 不被 ZIP 丢弃）
├── mover/
│   └── SAM_MISSILE_AERO.txt             18   aero SAM_MISSILE_AERO WSF_AERO
├── sensor/
│   └── RADAR_SET.txt                    43   sensor RADAR_SET WSF_RADAR_SENSOR
├── processor/
│   └── SAM_TACTICS_PROCESSOR.txt       112   processor SAM_TACTICS_PROCESSOR（状态机）
├── weapon/
│   └── SAM_MISSILE.txt                  58   弹体 platform_type + weapon 块（两段式）
├── weapon_effects/
│   └── SAM_MISSILE_EFFECT.txt           12   weapon_effects SAM_MISSILE_EFFECT
├── platform/
│   ├── AIRPLANE.txt                     13   platform_type AIRPLANE
│   └── SAM_LAUNCHER.txt                 40   platform_type SAM_LAUNCHER
└── side/
    ├── blue.txt                         20   实例（target1 AIRPLANE）
    └── red.txt                          15   实例（sam_site SAM_LAUNCHER）
```

**范围说明**：原 demo 另有 `2nd_run.txt` / `3rd_run.txt` / `4th_run.txt` 三个入口（战术处理器逐步复杂化），属**同一任务的进阶阶段**，不在本案例范围内。本案例**无二进制资产**，故无滤除项。

---

## 2. 案例详细说明

### 2.1 任务背景与态势

本案例演示一条**陆基防空（Surface-to-Air Missile，SAM）完整武器链路**：红方一部地空导弹发射阵地（平台实例 `sam_site`）对蓝方一架入侵运输机（平台实例 `target1`）实施「雷达搜索 → 航迹建立 → 任务处理器状态机派单 → SAM 齐射 → 中段/末段制导 → 命中」的全过程。仿真总时长由入口文件设定为 `end_time 1200 sec`（`launcher.txt:80`）。

态势属于典型的防空拦截想定，交战双方分属两个阵营：

- **蓝方目标** `target1` 从防区西北向东南穿越，航线由两个航路点定义（`side/blue.txt:13-18`）：
  - 起点 `34:42:32n 76:52:56w`、高度 `4000 ft msl`，以 `linear_acceleration 0.20 g` 加速飞行；
  - 终点 `36:03:28n 75:47:28w`、高度 `5000 ft msl`，第二段巡航速度 `speed 175 kts`；
  - 目标被显式标记为 `indestructible`（`side/blue.txt:12`），即不可被摧毁。
- **红方发射阵地** `sam_site` 部署在目标航线南侧，坐标为 `35:32n 76:13w`、高度 `0 ft msl`、航向 `heading 0 deg`（`side/red.txt:12-13`），携带一部搜索雷达、34 发地空导弹及配套处理器。

由于目标标记为 `indestructible`，本案例的观察重点在于**武器链路的触发条件与状态推进逻辑是否成立**，而非最终杀伤判定：命中与终结事件会照常记录，但目标平台不会被真正摧毁。

本案例源自 AFSIM 官方 demo `launcher` 的入口 `1st_run.txt` 闭包，经「仅结构改造」归一化：入口顶部将路径变量由 `1st_run` 改为 `CASE launcher`（`launcher.txt:9`），全部输出文件统一改为 `output/$(CASE).log|.evt|.aer`。原 demo 另有的 2nd_run/3rd_run/4th_run（战术处理器逐步复杂化的进阶阶段）不在本案例范围内。

### 2.2 兵力编成与阵营

| 阵营 | 平台实例名 | 平台类型 | 传感器/武器/处理器挂载 | 关键参数 |
| --- | --- | --- | --- | --- |
| Blue | `target1` | `AIRPLANE`（`WSF_PLATFORM` + `WSF_AIR_MOVER`） | 无（纯靶机，无传感器/武器/处理器） | `icon C-130`、`indestructible`、`commander SELF`；航线 `34:42:32n 76:52:56w` alt `4000 ft` → `36:03:28n 75:47:28w` alt `5000 ft`，第一段 `linear_acceleration 0.20 g`、第二段 `speed 175 kts` |
| Red | `sam_site` | `SAM_LAUNCHER`（`WSF_PLATFORM`） | 传感器 `radar_set`(RADAR_SET)；武器 `sam_missile`(SAM_MISSILE)；处理器 `task_mgr`(SAM_TACTICS_PROCESSOR)、`data_mgr`(WSF_TRACK_PROCESSOR)；`uplink` 通信 | `icon SA-11_Launcher`、`commander SELF`；部署 `35:32n 76:13w` alt `0 ft`、`heading 0 deg`；挂弹 `quantity 34` |

补充说明弹药量的两级语义：`SAM_LAUNCHER` 平台上的 `weapon sam_missile ... quantity 34`（`platform/SAM_LAUNCHER.txt:22-23`）是平台实际挂载量；而武器定义 `SAM_MISSILE` 本身另有默认 `quantity 8`（`weapon/SAM_MISSILE.txt:51`）。平台级 `quantity 34` 覆盖武器定义的默认值，故本案例实际可用弹药为 34 发。

### 2.3 装配链（入口 → 根文件 → 组件 → 实例）

`include_once` 装配关系（自 `launcher.txt` 入口向下展开）：

```
launcher.txt（入口）
├─ event_pipe.txt                    # 回放事件管道 output/$(CASE).aer
├─ global_env.txt                    # 环境/地形（空地形）
├─ global_script.txt                 # 脚本接口（空）
├─ setup.txt
│   ├─ platform/SAM_LAUNCHER.txt
│   │   ├─ sensor/RADAR_SET.txt
│   │   ├─ weapon/SAM_MISSILE.txt
│   │   │   ├─ mover/SAM_MISSILE_AERO.txt
│   │   │   └─ weapon_effects/SAM_MISSILE_EFFECT.txt
│   │   └─ processor/SAM_TACTICS_PROCESSOR.txt
│   └─ platform/AIRPLANE.txt
├─ side/blue.txt                     # 实例化 target1（AIRPLANE）
└─ side/red.txt                      # 实例化 sam_site（SAM_LAUNCHER）
```

装配说明：

- `launcher.txt:12-21` 依次 `include_once` 事件管道、全局环境、全局脚本、`setup.txt` 与两个阵营文件。
- `setup.txt:9` 用 `file_path .` 将相对路径基准锚定到工程根目录，随后 `include_once` 两个平台类型定义（`setup.txt:11-12`）。
- 平台类型 `SAM_LAUNCHER` 内部再聚合传感器、武器、处理器（`platform/SAM_LAUNCHER.txt:9-11`）；武器定义 `SAM_MISSILE` 内部又聚合气动模型与杀伤效果（`weapon/SAM_MISSILE.txt:9-10`）。
- 「组件（类型）定义」与「实例化」分离：类型文件只写 `platform_type`/`sensor`/`weapon` 等模板，真正的实体实例化发生在 `side/*.txt` 的 `platform` 块中。

### 2.4 组件职责逐项说明

| 文件 | 块类型与名称 | 职责 | 关键参数/取值 |
| --- | --- | --- | --- |
| `launcher.txt` | 入口/装配 + `event_output` | 定义路径变量、装配全部子文件、配置事件输出白名单与仿真时长 | `define_path_variable CASE launcher`(:9)；`log_file output/$(CASE).log`(:10)；`end_time 1200 sec`(:80) |
| `event_pipe.txt` | `event_pipe` | 建立回放管道，记录可回放事件流 | `event_pipe file output/$(CASE).aer`(:9) |
| `global_env.txt` | `terrain` | 全局地形配置 | 空地形（`#no terrain for now`，:12） |
| `global_script.txt` | `script_interface` | 全局脚本接口 | 空（仅注释，`# debug` 未启用） |
| `setup.txt` | 装配 | 锚定路径基准并装配平台类型 | `file_path .`(:9)；include 两个平台类型(:11-12) |
| `platform/SAM_LAUNCHER.txt` | `platform_type SAM_LAUNCHER` | 发射车平台模板：雷达、导弹武器、通信、任务/航迹处理器 | 雷达 `radar_set` `on` + `ignore_same_side`；武器 `sam_missile` `quantity 34`/`firing_delay 5 sec`/`firing_interval 20 sec`(:22-24)；处理器 `task_mgr`、`data_mgr` |
| `platform/AIRPLANE.txt` | `platform_type AIRPLANE` | 靶机平台模板 | `icon F-18`；`mover WSF_AIR_MOVER`(:11) |
| `sensor/RADAR_SET.txt` | `sensor RADAR_SET` | 搜索雷达传感器：探测、建航迹、上报 | `frame_time 2.0 sec`；`one_m2_detect_range 20 km`；`maximum_range 60 km`；发射机 `power 500 w`/`frequency 9000 mhz`(X 波段)/`pulse_width 1.0 usec`/`pulse_repetition_frequency 3600 hz`；`hits_to_establish_track 2 2`、`hits_to_maintain_track 1 3`；`track_quality 1.0`；`ignore_domain land/surface/subsurface/space`（仅探测空中） |
| `processor/SAM_TACTICS_PROCESSOR.txt` | `processor SAM_TACTICS_PROCESSOR` | 任务处理器：状态机判定探测/交战并触发齐射 | 详见 2.6 |
| `weapon/SAM_MISSILE.txt` | `platform_type SAM_MISSILE` + `weapon SAM_MISSILE` | 导弹弹体平台 + 显式武器定义 | 弹体 `total_mass 84.5 kg`/`fuel_mass 25.45 kg`/`thrust 5200 lbf`/`thrust_duration 20.0 sec`；制导 `proportional_navigation_gain 6.0`/`velocity_pursuit_gain 6.0`/`g_bias 1.2`/`maximum_commanded_g 25.0 g`；引信 `max_time_of_flight_to_detonate 45.0 sec`；武器 `quantity 8`/`firing_delay 1.0 sec`/`salvo_interval 3.0 sec`/`elevation_slew_limits 10.0 deg 80.0 deg` |
| `mover/SAM_MISSILE_AERO.txt` | `aero SAM_MISSILE_AERO` | 导弹气动模型（阻力/升力） | `cd_zero_subsonic 0.30`/`cd_zero_supersonic 0.50`/`mach_begin_cd_rise 0.95`/`mach_end_cd_rise 1.3`/`mach_max_supersonic 2.3`/`reference_area 0.017 m2`/`cl_max 3.5` |
| `weapon_effects/SAM_MISSILE_EFFECT.txt` | `weapon_effects SAM_MISSILE_EFFECT` | 杀伤效果模型 | `WSF_GRADUATED_LETHALITY`；`radius_and_pk 20.0 m 0.8` |
| `side/blue.txt` | `platform target1` | 蓝方靶机实例 | `side Blue`、`icon C-130`、`indestructible`、航线与速度（见 2.2） |
| `side/red.txt` | `platform sam_site` | 红方发射阵地实例 | `side Red`、`icon SA-11_Launcher`、部署坐标/航向（见 2.2） |
| `config/run.json` | 归一化附加配置 | 归一化工程附加的运行参数快照（非 AFSIM 脚本） | `recordAer 1`/`recordEvent 0`/`recordLog 1`/`stepValue 0.1`/`timeRate 1.0`/`timeType 1`/`startMode 2` |
| `output/blank_empty.txt` | 占位空文件 | 保证 `output/` 目录结构存在的空占位（0 字节） | 无内容 |

其中 14 个为 AFSIM 脚本文件，`config/run.json` 与 `output/blank_empty.txt` 为归一化工程附加物，不参与 AFSIM 解析。

关键文件的块级细节补充：

- **发射车 `SAM_LAUNCHER`**（`platform/SAM_LAUNCHER.txt`）：
  - 传感器 `radar_set` 开机（`on`），`internal_link data_mgr`、`internal_link task_mgr` 将探测数据送往航迹处理器与任务处理器，`ignore_same_side` 忽略己方目标（:15-20）；
  - 武器 `sam_missile` 挂载 34 发，`firing_delay 5 sec`、`firing_interval 20 sec` 约束载台武器调度节奏（:22-28）；
  - `uplink` 通信（`WSF_COMM_TRANSCEIVER`）链到 `data_mgr`（:30-32）；
  - 两个处理器：`task_mgr`（`SAM_TACTICS_PROCESSOR`，任务/状态机）与 `data_mgr`（`WSF_TRACK_PROCESSOR`，航迹融合），均无额外参数（:34-38）。
- **雷达 `RADAR_SET`**（`sensor/RADAR_SET.txt`）：`maximum_request_count 0`（不限制请求数）、`slew_mode both`（:12-13）；探测帧周期 `frame_time 2.0 sec`（:15）；以 `one_m2_detect_range 20 km` 为 1 m² 目标基准探测距离、`maximum_range 60 km` 为硬上限（:17-19）；发射机为 X 波段（`9000 mhz`）`500 w` 功率、`1.0 usec` 脉宽、`3600 hz` 重频（:21-26）；建航迹需 2 次命中、维护航迹每次 1 次命中、最多 3 次未命中丢航迹（:28-29）。
- **导弹 `SAM_MISSILE`**（`weapon/SAM_MISSILE.txt`）：
  - 弹体平台 `platform_type SAM_MISSILE`（`WSF_PLATFORM`）由 `WSF_GUIDED_MOVER` 推动，质量 84.5 kg、燃料 25.45 kg、推力 5200 lbf 持续 20 s，积分步长 `update_interval 0.10 s`，气动模型指向 `SAM_MISSILE_AERO`（:18-26）；
  - 制导计算机 `computer`（`WSF_GUIDANCE_COMPUTER`）：`proportional_navigation_gain 6.0`、`velocity_pursuit_gain 6.0`、`g_bias 1.2`、`maximum_commanded_g 25.0 g`、`update_interval 0.1 s`（:35-41）；
  - 引信 `fuse`（`WSF_AIR_TARGET_FUSE`）：`max_time_of_flight_to_detonate 45.0 sec`（:43-45）；
  - 武器定义 `weapon SAM_MISSILE`（`WSF_EXPLICIT_WEAPON`）：`launched_platform_type SAM_MISSILE`、`weapon_effects SAM_MISSILE_EFFECT`、默认 `quantity 8`、`firing_delay 1.0 sec`、`salvo_interval 3.0 sec`、`slew_mode azimuth_and_elevation`、方位限界 `-180~180 deg`、俯仰限界 `10~80 deg`（:48-57）。
- **气动 `SAM_MISSILE_AERO`**（`mover/SAM_MISSILE_AERO.txt`）：亚声速零升阻力系数 0.30、超声速 0.50，阻力上升区马赫数 0.95~1.3，最大超声速马赫数 2.3，参考面积 0.017 m²，最大升力系数 3.5（:10-16）。

### 2.5 运行时序与数据流

按时间推进的事件序列与数据流如下：

1. **雷达搜索**：仿真开始后，`sam_site` 的 `radar_set` 处于 `on` 状态（`platform/SAM_LAUNCHER.txt:16`），以 `frame_time 2.0 sec` 为帧周期扫描空域（`sensor/RADAR_SET.txt:15`），最大探测距离 `maximum_range 60 km`（:19），对 1 m² 基准目标探测距离 `one_m2_detect_range 20 km`（:17），且仅对空中目标有效（`ignore_domain land/surface/subsurface/space`，:33-36）。
2. **探测/建航迹**：雷达对蓝方 `target1` 建立航迹需满足 `hits_to_establish_track 2 2`（:28），维护航迹需 `hits_to_maintain_track 1 3`（:29）。航迹以 `track_quality 1.0`（:31）上报 `range/bearing/elevation/velocity` 四类报告（:38-41），经 `internal_link data_mgr`（`WSF_TRACK_PROCESSOR`）与 `internal_link task_mgr`（`SAM_TACTICS_PROCESSOR`）分发。
3. **任务处理器状态推进**：`task_mgr` 收到航迹后按 `evaluation_interval 2.0 sec`（`SAM_TACTICS_PROCESSOR.txt:86`）周期评估状态机，从 `DETECTED` 推进到 `ENGAGE`（转移条件见 2.6）。
4. **指派（派单）**：进入 `ENGAGE` 状态且目标满足可交战条件时，处理器通过 `FireAt` 创建 "Shoot" 任务消息，产生 `TASK_ASSIGNED` 等任务事件。
5. **发射**：`LaunchWeapon()` 判定弹药充足（`QuantityRemaining() >= SALVO_SIZE`，即 ≥2）且武器开启、目标处于拦截包线内，随即以 `SALVO_SIZE = 2` 齐射两枚 `sam_missile`（`SAM_TACTICS_PROCESSOR.txt:62-83`）。
6. **中段/末段制导**：导弹平台 `SAM_MISSILE` 由 `WSF_GUIDED_MOVER` 推动（推力 `5200 lbf`、持续 `20.0 sec`，`weapon/SAM_MISSILE.txt:22-23`），`computer`（`WSF_GUIDANCE_COMPUTER`）按比例导引/速度追踪制导律（增益均为 6.0，:36-37）持续导引，`fuse`（`WSF_AIR_TARGET_FUSE`）在最大飞行时间 `45.0 sec` 内待命（:44）。
7. **命中/终结**：导弹进入 `weapon_effects` 定义的 `radius_and_pk 20.0 m 0.8` 杀伤半径内即判命中，产生 `WEAPON_HIT`、`WEAPON_TERMINATED` 事件；由于 `target1` 为 `indestructible`，不触发 `PLATFORM_BROKEN`。

**事件输出白名单**（`launcher.txt:25-76` 的 `event_output` 块）记录的事件：

- 显式禁用：`disable TEAM_NAME_DEFINITION`（:31）。
- 显式启用：`PLATFORM_ADDED`(:47)、`PLATFORM_BROKEN`(:49)、`TASK_ASSIGNED`(:63)、`TASK_CANCELED`(:64)、`TASK_COMPLETED`(:65)、`WEAPON_FIRE_ABORTED`(:66)、`WEAPON_FIRE_REQUESTED`(:67)、`WEAPON_FIRED`(:68)、`WEAPON_HIT`(:69)、`WEAPON_MISSED`(:70)、`WEAPON_TERMINATED`(:73)。
- 其余事件（`SENSOR_*`、`LOCAL_TRACK_*`、`MESSAGE_*`、`COMM_*`、`PROCESSOR_*`、`PLATFORM_DELETED`、`WEAPON_RELOAD_*` 等）均被注释禁用。

该块输出到屏幕回放文件 `replay.evt`（:26），并设置 `time_format h:m:s.1`、`lat_lon_format d:m:s.2`、`print_track_in_message true`（:27-29）；另有 `event_output file output/$(CASE).evt`（:78）输出工程结果事件文件 `output/launcher.evt`。日志文件为 `output/launcher.log`（:10），回放管道为 `output/launcher.aer`（`event_pipe.txt:9`）。

### 2.6 关键脚本逻辑

核心是 `processor/SAM_TACTICS_PROCESSOR.txt`（`WSF_TASK_PROCESSOR` 派生，共 112 行），实现「探测—交战」两态状态机与齐射决策。逐项拆解如下。

**脚本变量**（`:15-26`）：

| 变量 | 取值 | 用途 |
| --- | --- | --- |
| `SENSOR_NAME` | `"radar_set"` | 关联的传感器名 |
| `SENSOR_TRACK_MODE` | `"default"` | 航迹模式 |
| `WEAPON_NAME` | `"sam_missile"` | 关联的武器名 |
| `REQUIRED_TRACK_QUALITY` | `0.49` | 期望航迹质量阈值 |
| `SALVO_SIZE` | `2` | 每次齐射枚数 |
| `mTrackTaskStr` | `"Track"` | 航迹任务消息串 |
| `mShootTaskStr` | `"Shoot"` | 射击任务消息串 |

**辅助脚本函数**：

| 函数 | 行号 | 逻辑 | 关键取值 |
| --- | --- | --- | --- |
| `InInterceptEnvelopeOf(WsfWeapon)` | :28-41 | 判定目标斜距是否在拦截包线内 | `maxRng = 35000`(:30)、`minRng = 300`(:31)，条件 `minRng < targetrange < maxRng`(:35) |
| `IsEngageable()` | :43-48 | 判定目标是否可交战 | `PLATFORM==Commander() || TasksReceivedFor>0 || OperatingLevelFor("ENGAGE")>0`，且 `TRACK.AirDomain()` |
| `TrackingNow()` | :50-59 | 判定航迹质量是否满足交战 | 因 `SENSOR_NAME` 非空，走 else 分支：`TRACK.TrackQuality() > 0.95`(:57) |
| `LaunchWeapon()` | :62-83 | 取武器、查弹药、按齐射量发射 | 武器 `IsTurnedOn()` 且 `QuantityRemaining() >= SALVO_SIZE`(:66-67)，`FireAt(TRACK, mShootTaskStr, weapon, SALVO_SIZE)`(:74) |

函数细节解读：

- `InInterceptEnvelopeOf`：局部变量 `maxRng`/`minRng` 硬编码为 35000/300（米），通过 `PLATFORM.SlantRangeTo(TRACK)` 取平台到目标的斜距，落入开区间即返回真。它同时把结果写进 `writeln_d` 调试输出（:34）。
- `IsEngageable`：三选一的指挥授权（自身是指挥官、或已收到该航迹的分配任务、或 ENGAGE 操作级大于 0）与「目标为空中域」两条件相与。
- `TrackingNow`：`SENSOR_NAME` 为空串时用 `REQUIRED_TRACK_QUALITY`（0.49），否则用硬编码 0.95。本案例 `SENSOR_NAME="radar_set"` 非空，故实际阈值是 0.95。
- `LaunchWeapon`：先取 `WEAPON_NAME` 对应武器句柄，检查「已开机 + 剩余弹药 ≥ 齐射量」后调用 `InInterceptEnvelopeOf`，再以 `SALVO_SIZE` 齐射量调用 `FireAt`，成功时打印带仿真时刻、平台名、目标名、斜距与 "FIRE!!!!" 的调试行（:77-79）。

**状态机**（`:85-112`）：

- 状态 `DETECTED`（`:87-92`，评估间隔 `2.0 sec`）：唯一转移 `next_state ENGAGE`，条件 `TRACK.BelievedAlive() && IsEngageable()`（`:89-90`）——目标存活且可交战时进入交战。
- 状态 `ENGAGE`（`:95-110`，评估间隔 `2.0 sec`）：
  - `next_state DETECTED`（`:96-98`）：条件 `TRACK.BelievedDead() || !TrackingNow()`——目标已死或航迹质量掉到 0.95 以下时退回探测。
  - `next_state ENGAGE`（自环，`:100-109`）：当目标仍在拦截包线内且 `WeaponsActiveFor(TRACK.TrackId()) < 1`（尚无在飞武器）时调用 `LaunchWeapon()` 并返回其布尔结果；成功发射则保持 ENGAGE，失败则本次评估不转移。

**任务消息**：发射时 `FireAt` 的第三个参数为 `mShootTaskStr`（即 "Shoot"），生成射击任务消息；`mTrackTaskStr`（"Track"）为航迹任务命名串，供任务消息匹配使用。任务消息的产生与完成对应事件白名单中的 `TASK_ASSIGNED`/`TASK_COMPLETED` 等。

### 2.7 可复用要点与陷阱

1. **路径变量与输出命名**：入口 `define_path_variable CASE launcher`（`launcher.txt:9`）是「路径变量」，仅用于文件名/路径替换，与 preprocessor 的 `$define` 变量机制不同（后者不会被 `-list-variables` 之外的方式展开到路径）。日志/事件/回放统一引用 `output/$(CASE).log|.evt|.aer`，改工程名只需改 `CASE` 一处。
2. **两级弹药量定义**：武器定义 `SAM_MISSILE` 的 `quantity 8` 是默认值，平台挂载 `quantity 34` 覆盖之。理解「武器类型定义 vs 平台挂载」两层语义，否则会误读实际弹药数。
3. **齐射规模由处理器决定**：`SALVO_SIZE=2` 决定每次 `FireAt` 的齐射枚数；平台武器挂载的 `firing_delay 5 sec`/`firing_interval 20 sec`（`platform/SAM_LAUNCHER.txt:24-25`）与武器定义内的 `firing_delay 1.0 sec`/`salvo_interval 3.0 sec`（`weapon/SAM_MISSILE.txt:52-53`）属不同层级参数，勿混淆。
4. **`REQUIRED_TRACK_QUALITY=0.49` 实际未生效**：`TrackingNow()` 因 `SENSOR_NAME` 非空走 else 分支，硬编码阈值 `0.95`（`:57`）；`REQUIRED_TRACK_QUALITY` 仅在 `SENSOR_NAME==""` 时才被使用。修改交战门槛时须注意这一分支，否则改了变量却看不到效果。
5. **`indestructible` 目标不触发 `PLATFORM_BROKEN`**：`target1` 被标记为不可摧毁（`side/blue.txt:12`），故武器命中后只会记录 `WEAPON_HIT`/`WEAPON_TERMINATED`，不会产生 `PLATFORM_BROKEN`。若需完整杀伤链路演示，应移除该标记。
6. **雷达只探测空中目标**：`ignore_domain land/surface/subsurface/space`（`sensor/RADAR_SET.txt:33-36`）限制探测域，配合 `TRACK.AirDomain()`（`SAM_TACTICS_PROCESSOR.txt:47`）双重限定，确保只对空中目标交战。
7. **事件白名单决定结果可观测性**：传感器探测/航迹相关事件（`SENSOR_*`、`LOCAL_TRACK_*`）全部被注释禁用，结果里看不到原始探测过程，只能看到任务与武器链路事件。调试探测链路时需临时放开相应 `enable`。
8. **拦截包线与杀伤半径是两回事**：`InInterceptEnvelopeOf` 的 300–35000 m 是「允许发射」的斜距窗口（`SAM_TACTICS_PROCESSOR.txt:30-31`），而 `radius_and_pk 20.0 m 0.8`（`weapon_effects/SAM_MISSILE_EFFECT.txt:10`）是弹头引爆的杀伤半径与命中概率，二者作用阶段不同。
9. **回放与结果事件文件并存**：入口内同时存在 `event_output file replay.evt`（`launcher.txt:26`，屏幕回放）与 `event_output file output/$(CASE).evt`（:78，工程结果），另有 `event_pipe output/$(CASE).aer`（回放管道）。三者用途不同，勿混淆 `replay.evt` 与 `output/launcher.evt`。

---

## 3. 完整脚本全文

> 文件顺序 = **装配顺序**（入口 → 根文件 → 组件自下而上 → `platform_type` → `side/` 实例 → 非 AFSIM 文件）。
> 共 16 个文件、462 行；正文与归一化工程**逐行一致**（文档内行尾统一为 LF；源为 CRLF 的文件在文档中即表现为 LF）。

### ===== FILE: launcher.txt =====

```text
# ****************************************************************************
# AFSIM demo input file
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# Original demo input. Structure reorganized only; content not modified.
# ****************************************************************************
define_path_variable CASE launcher
log_file output/$(CASE).log

include_once event_pipe.txt
include_once global_env.txt
include_once global_script.txt

# setup file includes the platforms
include_once setup.txt

# this scenario...
include_once side/blue.txt
include_once side/red.txt

# common file for selecting which messages appear in the event log

event_output
   file replay.evt
   time_format h:m:s.1
   lat_lon_format d:m:s.2
   print_track_in_message true

   disable TEAM_NAME_DEFINITION
   #enable all
   #enable COMM_TURNED_OFF
   #enable COMM_TURNED_ON
   #enable JAMMING_ATTEMPT
   #enable LOCAL_TRACK_CORRELATION
   #enable LOCAL_TRACK_DECORRELATION
   #enable LOCAL_TRACK_INITIATED
   #enable LOCAL_TRACK_UPDATED
   #enable LOCAL_TRACK_DROPPED
   #enable MESSAGE_DISCARDED
   #enable MESSAGE_UPDATED
   #enable MESSAGE_QUEUED
   #enable MESSAGE_RECEIVED
   #enable MESSAGE_TRANSMITTED
   #enable OPERATING_LEVEL_CHANGED
   enable PLATFORM_ADDED
   #enable PLATFORM_DELETED
   enable PLATFORM_BROKEN
   #enable PROCESSOR_TURNED_OFF
   #enable PROCESSOR_TURNED_ON
   #enable SENSOR_DETECTION_ATTEMPT
   #enable SENSOR_MODE_ACTIVATED
   #enable SENSOR_MODE_DEACTIVATED
   #enable SENSOR_REQUEST_CANCELED
   #enable SENSOR_REQUEST_INITIATED
   #enable SENSOR_REQUEST_UPDATED
   #enable SENSOR_TRACK_INITIATED
   #enable SENSOR_TRACK_UPDATED
   #enable SENSOR_TRACK_DROPPED
   #enable SENSOR_TURNED_ON
   #enable SENSOR_TURNED_OFF
   enable TASK_ASSIGNED
   enable TASK_CANCELED
   enable TASK_COMPLETED
   enable WEAPON_FIRE_ABORTED
   enable WEAPON_FIRE_REQUESTED
   enable WEAPON_FIRED
   enable WEAPON_HIT
   enable WEAPON_MISSED
   #enable WEAPON_RELOAD_STARTED
   #enable WEAPON_RELOAD_ENDED
   enable WEAPON_TERMINATED
   #enable WEAPON_TURNED_OFF
   #enable WEAPON_TURNED_ON
end_event_output

event_output file output/$(CASE).evt end_event_output

end_time 1200 sec
```

### ===== FILE: event_pipe.txt =====

```text
# ****************************************************************************
# AFSIM demo input file
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# Original demo input. Structure reorganized only; content not modified.
# ****************************************************************************
event_pipe file output/$(CASE).aer end_event_pipe

```

### ===== FILE: global_env.txt =====

```text
# ****************************************************************************
# AFSIM demo input file
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# Original demo input. Structure reorganized only; content not modified.
# ****************************************************************************
# common terrain configuration

terrain
  #no terrain for now
end_terrain
```

### ===== FILE: global_script.txt =====

```text
# ****************************************************************************
# AFSIM demo input file
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# Original demo input. Structure reorganized only; content not modified.
# ****************************************************************************
# simple task processor to launch a sam at an air target

script_interface
#  debug
end_script_interface
```

### ===== FILE: setup.txt =====

```text
# ****************************************************************************
# AFSIM demo input file
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# Original demo input. Structure reorganized only; content not modified.
# ****************************************************************************
file_path .

include_once platform/SAM_LAUNCHER.txt
include_once platform/AIRPLANE.txt


```

### ===== FILE: mover/SAM_MISSILE_AERO.txt =====

```text
# ****************************************************************************
# AFSIM demo input file
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# Original demo input. Structure reorganized only; content not modified.
# ****************************************************************************
aero SAM_MISSILE_AERO WSF_AERO
   cd_zero_subsonic    0.30
   cd_zero_supersonic  0.50
   mach_begin_cd_rise  0.95
   mach_end_cd_rise    1.3
   mach_max_supersonic 2.3
   reference_area      0.017 m2
   cl_max              3.5
end_aero

```

### ===== FILE: weapon_effects/SAM_MISSILE_EFFECT.txt =====

```text
# ****************************************************************************
# AFSIM demo input file
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# Original demo input. Structure reorganized only; content not modified.
# ****************************************************************************
weapon_effects SAM_MISSILE_EFFECT WSF_GRADUATED_LETHALITY      # unknown
   radius_and_pk 20.0 m 0.8
end_weapon_effects

```

### ===== FILE: sensor/RADAR_SET.txt =====

```text
# ****************************************************************************
# AFSIM demo input file
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# Original demo input. Structure reorganized only; content not modified.
# ****************************************************************************
sensor RADAR_SET WSF_RADAR_SENSOR
 # show_calibration_data
  on
  maximum_request_count          0
  slew_mode                      both

  frame_time                     2.0 sec

  one_m2_detect_range            20 km

  maximum_range                  60 km

  transmitter
     power                       500 w         # unknown
     frequency                   9000 mhz      # X-band
     pulse_width                 1.0 usec      # unknown
     pulse_repetition_frequency  3600 hz       # unknown
  end_transmitter

  hits_to_establish_track  2 2
  hits_to_maintain_track   1 3

  track_quality            1.0

  ignore_domain land
  ignore_domain surface
  ignore_domain subsurface
  ignore_domain space

  reports_range
  reports_bearing
  reports_elevation
  reports_velocity
end_sensor

```

### ===== FILE: processor/SAM_TACTICS_PROCESSOR.txt =====

```text
# ****************************************************************************
# AFSIM demo input file
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# Original demo input. Structure reorganized only; content not modified.
# ****************************************************************************
#---------------------------------------
processor SAM_TACTICS_PROCESSOR WSF_TASK_PROCESSOR
#   script_debug_writes on
#   show_state_transitions
#   show_task_messages

   script_variables
      string SENSOR_NAME               = "radar_set";
      string SENSOR_TRACK_MODE         = "default";
      string WEAPON_NAME               = "sam_missile";
      double REQUIRED_TRACK_QUALITY    = 0.49;
      int SALVO_SIZE                   = 2;

      # the following are used internally and should not be modified by the
      # user
      string mTrackTaskStr      = "Track";
      string mShootTaskStr      = "Shoot";
   end_script_variables

   script bool InInterceptEnvelopeOf(WsfWeapon aWeapon)
       bool canIntercept = false;
       double maxRng = 35000;
       double minRng = 300;
       WsfTrackId id = TRACK.TrackId();
       double targetrange = PLATFORM.SlantRangeTo(TRACK);
       writeln_d("Target range is " , targetrange);
       if ((targetrange > minRng) && (targetrange < maxRng))
       {
         canIntercept = true;
       }
       return canIntercept;

   end_script

   script bool IsEngageable()
      return (((PLATFORM == PLATFORM.Commander()) ||
               (TasksReceivedFor(TRACK.TrackId()) > 0) ||
               (OperatingLevelFor("ENGAGE") > 0))) &&
               (TRACK.AirDomain());
   end_script

   script bool TrackingNow()
      if (SENSOR_NAME == "")
      {
         return (TRACK.TrackQuality() > REQUIRED_TRACK_QUALITY);
      }
      else
      {
         return (TRACK.TrackQuality() > 0.95);
      }
   end_script


   script bool LaunchWeapon()
      WsfWeapon   weapon;
      weapon = PLATFORM.Weapon(WEAPON_NAME);
      bool canInterceptNow = false;
      if (weapon.IsTurnedOn() &&
          (weapon.QuantityRemaining() >= SALVO_SIZE))
      {
         canInterceptNow = InInterceptEnvelopeOf(weapon);
      }
      bool launched = false;
      if (canInterceptNow)
      {
         launched = FireAt(TRACK, mShootTaskStr, weapon, SALVO_SIZE);
         if (launched)
         {
            writeln_d("*** T=", TIME_NOW, " ", PLATFORM.Name(), " ",
                      TRACK.TargetName(), " R=", PLATFORM.SlantRangeTo(TRACK),
                      " FIRE!!!!");
         }
      }
      return launched;
   end_script

#-----------------------begin state machine-----------------------
   evaluation_interval DETECTED 2.0 sec
   state DETECTED
      next_state ENGAGE
         return (TRACK.BelievedAlive() &&
                 IsEngageable());
      end_next_state
   end_state

   evaluation_interval ENGAGE 2.0 sec
   state ENGAGE  # Engages and fires the weapon if it can
      next_state DETECTED
         return (TRACK.BelievedDead() || ! TrackingNow());
      end_next_state

      next_state ENGAGE
         bool launched = false;
         if (InInterceptEnvelopeOf(PLATFORM.Weapon(WEAPON_NAME)) &&
               WeaponsActiveFor(TRACK.TrackId()) < 1)
         {
             writeln_d("Trying to launch weapon " );
             launched = LaunchWeapon();
         }
         return launched;
      end_next_state
   end_state

end_processor
```

### ===== FILE: weapon/SAM_MISSILE.txt =====

```text
# ****************************************************************************
# AFSIM demo input file
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# Original demo input. Structure reorganized only; content not modified.
# ****************************************************************************
include_once mover/SAM_MISSILE_AERO.txt
include_once weapon_effects/SAM_MISSILE_EFFECT.txt

# data used from the reno demo...
# several items removed to simplify it

platform_type SAM_MISSILE WSF_PLATFORM
  icon Missile

  mover WSF_GUIDED_MOVER
    #show_status
    total_mass       84.5 kg
    fuel_mass        25.45 kg
    thrust           5200 lbf
    thrust_duration  20.0 sec
    update_interval  0.10 s
    aero             SAM_MISSILE_AERO
  end_mover

  comm uplink WSF_COMM_TRANSCEIVER
     internal_link data_mgr
  end_comm

  processor data_mgr WSF_WEAPON_TRACK_PROCESSOR
  end_processor

  processor computer WSF_GUIDANCE_COMPUTER
    proportional_navigation_gain  6.0
    velocity_pursuit_gain         6.0
    g_bias                        1.2
    maximum_commanded_g           25.0 g
    update_interval               0.1 s
  end_processor

  processor fuse WSF_AIR_TARGET_FUSE
    max_time_of_flight_to_detonate  45.0 sec
  end_processor
end_platform_type

weapon SAM_MISSILE WSF_EXPLICIT_WEAPON
   launched_platform_type SAM_MISSILE
   weapon_effects SAM_MISSILE_EFFECT
   quantity 8
   firing_delay           1.0 sec
   salvo_interval         3.0 sec
   slew_mode              azimuth_and_elevation
   azimuth_slew_limits    -180.0 deg 180.0 deg
   elevation_slew_limits  10.0 deg 80.0 deg
end_weapon

```

### ===== FILE: platform/AIRPLANE.txt =====

```text
# ****************************************************************************
# AFSIM demo input file
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# Original demo input. Structure reorganized only; content not modified.
# ****************************************************************************
platform_type AIRPLANE WSF_PLATFORM
  icon F-18
  mover WSF_AIR_MOVER
  end_mover
end_platform_type
```

### ===== FILE: platform/SAM_LAUNCHER.txt =====

```text
# ****************************************************************************
# AFSIM demo input file
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# Original demo input. Structure reorganized only; content not modified.
# ****************************************************************************
include_once sensor/RADAR_SET.txt
include_once weapon/SAM_MISSILE.txt
include_once processor/SAM_TACTICS_PROCESSOR.txt

platform_type SAM_LAUNCHER WSF_PLATFORM
   icon Launcher
   sensor radar_set RADAR_SET
      on
      internal_link data_mgr
      internal_link task_mgr
      ignore_same_side
   end_sensor

   weapon sam_missile SAM_MISSILE
      quantity 34
      firing_delay      5 sec
      firing_interval   20 sec
      internal_link data_mgr
      internal_link task_mgr
   end_weapon

   comm uplink WSF_COMM_TRANSCEIVER
     internal_link data_mgr
   end_comm

   processor task_mgr SAM_TACTICS_PROCESSOR
   end_processor

   processor data_mgr WSF_TRACK_PROCESSOR
   end_processor

end_platform_type
```

### ===== FILE: side/blue.txt =====

```text
# ****************************************************************************
# AFSIM demo input file
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# Original demo input. Structure reorganized only; content not modified.
# ****************************************************************************
platform target1 AIRPLANE
   side Blue
   icon C-130
   indestructible
   route
    position 34:42:32n 76:52:56w altitude 4000 ft msl
      linear_acceleration 0.20 g
    position 36:03:28n 75:47:28w altitude 5000 ft msl
      speed 175 kts
   end_route
  commander SELF
end_platform
```

### ===== FILE: side/red.txt =====

```text
# ****************************************************************************
# AFSIM demo input file
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# Original demo input. Structure reorganized only; content not modified.
# ****************************************************************************
platform sam_site SAM_LAUNCHER
side Red
   icon SA-11_Launcher
   position 35:32n 76:13w altitude 0 ft msl
   heading 0 deg
   commander SELF
end_platform
```

### ===== FILE: config/run.json =====

```text
{"baseConfig":{"highPrecisionCounter":0,"multithreading":0,"pausetoadvancetime":1,"propulsionMethod":2,"recordAer":1,"recordEvent":0,"recordLog":1,"scenariosTime":{"continueTime":20,"startDate":"2026-10-16","startTime":"00:00:00"},"startMode":2,"stepValue":0.1,"terminalLog":1,"timeRate":1.0,"timeType":1},"scenariosId":0}
```

### ===== FILE: output/blank_empty.txt =====

```text
```
---

## 4. 使用指引

### 4.1 看点速览（这个案例演示什么）

- **完整武器链路（两段式 + aero + 效能）**：`aero SAM_MISSILE_AERO` → 弹体 `platform_type SAM_MISSILE`（内联 `WSF_GUIDED_MOVER` / `WSF_WEAPON_TRACK_PROCESSOR` / `WSF_GUIDANCE_COMPUTER` / `WSF_AIR_TARGET_FUSE`）→ `weapon SAM_MISSILE WSF_EXPLICIT_WEAPON`（`launched_platform_type` 指向弹体、`weapon_effects` 指向效能）→ `weapon_effects SAM_MISSILE_EFFECT WSF_GRADUATED_LETHALITY`。
- **任务处理器状态机**：`SAM_TACTICS_PROCESSOR WSF_TASK_PROCESSOR` 用 `state DETECTED` / `state ENGAGE` + `next_state` 组织"探测 → 交战 → 发射"闭环；`InInterceptEnvelopeOf` 判定 **300 ~ 35000 m** 拦截包线，`SALVO_SIZE 2` 齐射，`TrackingNow` 按航迹质量放行。
- **平台装配与内部连线**：`SAM_LAUNCHER` 挂 `sensor radar_set` / `weapon sam_missile` / `comm uplink` / `processor task_mgr` / `processor data_mgr`，用 `internal_link` 把感知与火力串起来。
- **事件输出白名单**：`launcher.txt` 内联的 `event_output` 块是"**逐项 `enable` + 其余全部注释**"的范例 —— 想缩小 `.evt` 体积时可直接照抄这份清单（本案例启用了 `PLATFORM_ADDED` / `TASK_*` / `WEAPON_FIRED` / `WEAPON_HIT` 等，注释掉了 `TEAM_NAME_DEFINITION`）。
- **多入口"逐步加复杂度"**：原 demo 的 `1st_run` ~ `4th_run` 共用同一套平台定义，只是替换战术处理器（`tactics_processor1` ~ `4`，118 / 132 / 148 / 217 行）。要看"任务处理器如何逐级演进"，去读原 demo 的 2~4 号处理器。

### 4.2 怎么跑

1. 按 §1 的 tree 把 16 个文件复原为目录（`launcher/` 为工程根）。
2. 打包为 ZIP：**ZIP 名与入口同名** —— `launcher.zip`，内含 `launcher.txt` 于**压缩包根目录**。
3. 交给 AFSIM：本案例**仅通过语法校验，未跑仿真**。
   - 校验通道：`mcp__afsim__validate_scenario`（或等价 HTTP `POST /api/v1/scenarios/validate`）；判据只看 `valid`（语法对错都返回 200）。
4. 仿真时长 `end_time 1200 sec`（20 分钟），输出落在 `output/`（`launcher.evt` / `launcher.aer` / `launcher.log`）。

### 4.3 可借鉴 / 勿照抄

| 可借鉴 | 说明 |
| :-- | :-- |
| 武器"两段式" | `weapon/` 里「弹体 `platform_type` + `weapon` 块」同文件，`launched_platform_type` 串起来 |
| `aero` 块 | `WSF_GUIDED_MOVER` 用 `aero <名>` 引用独立 `aero` 块（本案例放在 `mover/`） |
| 拦截包线判定 | `InInterceptEnvelopeOf` 里用 `PLATFORM.SlantRangeTo(TRACK)` + 上下限 |
| 任务状态机 | `evaluation_interval <状态> <时间>` + `state` / `next_state` 结构 |
| 事件白名单 | 逐项 `enable` + 注释掉其余，控制 `.evt` 体积 |
| 组件依赖前置 | 组件文件头部 `include_once` 自己的全部依赖（规范 §4.5） |

| 勿照抄 | 原因 |
| :-- | :-- |
| 两个 `event_output` 块 | 官方原样如此（一个来自公共 `event_output.txt`、一个是入口单行）；新工程只写一个 |
| `platform_type SAM_MISSILE` 内联 mover / processor | 本案例为忠实原样保留；规范推荐"组件独立成文件 + 平台内按名引用" |
| `event_output` 里 `file replay.evt` | 官方遗留的裸文件名；新工程应写 `output/$(CASE).evt` |

### 4.4 对应关系

本案例的写法在本 Skill 内的权威参考：

| 本案例演示的写法 | 权威参考 |
| :-- | :-- |
| 目录划分与装配顺序 | `blueprints/layout/layout.md`、`blueprints/layout/assembly.md` |
| 武器链路 `aero`→弹体→`weapon`→`weapon_effects` | `knowledge/blocks/commands.md`、`knowledge/blocks/movers.md` |
| `WSF_TASK_PROCESSOR` 状态机与任务消息 | `knowledge/language/script-types.md`、`knowledge/language/messages.md` |
| 雷达传感器参数（`one_m2_detect_range` 等） | `knowledge/blocks/sensors.md` |
| `run.json` 运行控制 | `blueprints/layout/run-json.md` |

### 4.5 改造中实测到的坑

1. **原始用 `include` 而非 `include_once`**：入口与 `setup.txt` 全部是 `include`；已统一改为 `include_once`（规范 §7.9"统一用 `include_once` 防重复定义"）。
2. **`setup.txt` 混装了非平台内容**：原始 `setup.txt` 里同时 include 了 `event_output.txt` 和 `terrain.txt`。按规范拆分 —— `event_output` 内联进入口、`terrain` 归 `global_env.txt`、`setup.txt` 只留 `platform/*`。
3. **入口存在两个 `event_output` 块**：一个来自公共 `event_output.txt`，一个是入口单行 `event_output file output/$(CASE).evt end_event_output`。**未合并**（合并属"改内容"），原样保留两个。
4. **目录名与内容不符**：`platforms/tactics_processor1.txt` 实际是 `processor` 定义，已归 `processor/`；`weapons/sam/sam_missile.txt` 一个文件里含 **4 类块**（`aero` / 弹体 `platform_type` / `weapon_effects` / `weapon`），已按类型拆到 `mover/` `weapon/` `weapon_effects/`。
5. **`script_interface` 块无规范归属**：顶层 `script_interface`（启用脚本调试）归入 `global_script.txt`（全局脚本层）。

### 4.6 许可说明

原始 AFSIM 官方 demo 文件头部含 受控标记横幅，收录时已移除受控标记与分发限制声明，替换为不含限制声明的中性头注：

```text
# AFSIM demo input file
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# Original demo input. Structure reorganized only; content not modified.
```

文件内其余 AFSIM 命令内容未作任何增删。
