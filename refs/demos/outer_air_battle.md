# 案例：outer_air_battle（航母战斗群防空 —— 远/中程 CAP 拦截轰炸机群）

> **任务类型**：空战体系对抗 —— 蓝方航母战斗群（CVN + 预警机 + ERC/MRC 战斗机）拦截红方轰炸机群
> **来源**：AFSIM 官方 demo `outer_air_battle` 的入口 `OAB_mrc_erc.txt`（改造后收录）
> **改造说明**：**仅结构改造，内容未增删** —— 块计数对比 **0 项差异**；行级审计显示差异**只剩 `include` / `file_path` 路径改写**（其中 2 行是随 `base_types` 依赖内化而取消的路径声明，见 §4.5-1）（逐条可核）
> **规模**：39 个文件 / 2,590 行（`global_route.txt` 316、`processor/CVN_TASK_PROCESSOR.txt` 288、`sensor/BLUE_A2A_RADAR.txt` 198、`processor/STATION_TIMER.txt` 191）
> **结构**：根文件 6（入口 / `event_pipe.txt` / `global_route.txt` / `global_script.txt` / `global_struct.txt` / `setup.txt`）+ 目录 11（`comm/`、`config/`、`mover/`、`output/`、`platform/`、`processor/`、`sensor/`、`side/`、`signatures/`、`weapon/`、`weapon_effects/`）
> **自包含**：原始 demo **跨 demo 依赖** `base_types`（入口用 `define_path_variable PATH base_types` + `file_path ../$(PATH)` 声明共享库，见 §4.5-1）；本案例已把缺失的 4 个武器文件**内化**到 `weapon/`，改造后工程**自包含**
> **许可 / 限制**：原始文件含 CUI 受控横幅，本案例**原样保留**（见 §4.6）
> **亮点**：① **体系级任务分配**（`CVN_TASK_PROCESSOR` 运行期 `CreatePlatform` + ERC/MRC 择优派单）；② **甲板周期出动**（`launchCycle 90 min`，AEW 加倍周期）；③ **CAP 驻留 / 空中加油 / 返场定时器**（`STATION_TIMER` + `OnStation` + 航路 `label` / `goto` / `execute`）；④ **多机种派生**（`BLUE_MULTIROLE_FIGHTER_2` → `_ERC` / `_MRC` 两级派生）；⑤ **完整武器链路 ×2**（RF 中距 + IR 近距）+ 表驱动 `launch_computer`；⑥ **三类签名**齐备
> **对应**：结构 → `refs/structure/project-layout.md`；任务处理器 → `refs/knowledge/`；本案例 `processor/`

---

## 1. 文件结构

```text
outer_air_battle/
├── outer_air_battle.txt                86   ★ 入口（装配总纲 + event_output 内联）
├── setup.txt                           14   平台装配（include 全部 platform/*）
├── event_pipe.txt                      12   aer 记录配置
├── global_script.txt                   32   共享脚本片段（script void OnStation）
├── global_struct.txt                   15   全局结构（script_struct launchParameters）
├── global_route.txt                   316   全局航路（12 条 route：aew-1/2、erc-1~4、mrc-1~6）
├── config/
│   └── run.json                         1   运行控制（scenariosId 留空 0）
├── output/
│   └── blank_empty.txt                  0   占位（保证 output/ 不被 ZIP 丢弃）
│
├── mover/
│   ├── GUESSED_AERO.txt                35   aero GUESSED_AERO（RF 弹体气动）
│   └── BLUE_SR_A2A_IR_MISSILE_AERO.txt 29   aero BLUE_SR_A2A_IR_MISSILE_AERO
├── comm/
│   └── BLUE_COMM.txt                   22   comm cmdr_net / sub_net（被平台内联 include）
├── sensor/
│   ├── BLUE_A2A_RADAR.txt             198   sensor BLUE_A2A_RADAR（含 antenna_pattern）
│   ├── GENERIC_ESM_SENSOR.txt         130   sensor GENERIC_ESM_SENSOR（被动 ESM）
│   └── GEO_AA_RADAR.txt                29   sensor GEO_AA_RADAR（几何传感器）
├── processor/
│   ├── STATION_TIMER.txt              191   processor STATION_TIMER（驻留/加油/返场定时）
│   ├── BLUE_MULTIROLE_FIGHTER_2_TASK_PROCESSOR.txt  177   战斗机交战状态机
│   └── CVN_TASK_PROCESSOR.txt         288   processor CVN_TASK_PROCESSOR（出动 + 派单）
├── signatures/
│   ├── BLUE_A2A_RADAR_SIGNATURE.txt    13   radar_signature
│   ├── BOMBER_RADAR_SIGNATURE.txt      10   radar_signature
│   ├── BOMBER_INFRARED_SIGNATURE.txt   10   infrared_signature
│   ├── BOMBER_OPTICAL_SIGNATURE.txt    10   optical_signature
│   ├── TEST_RADAR_SIGNATURE.txt        12   radar_signature
│   ├── TEST_INFRARED_SIGNATURE.txt     12   infrared_signature
│   └── TEST_OPTICAL_SIGNATURE.txt      12   optical_signature
├── weapon_effects/
│   ├── TEST_EFFECT.txt                 17   weapon_effects TEST_EFFECT（源文件内定义两次，原样保留）
│   └── BLUE_SR_A2A_IR_MISSILE_EFFECT.txt 19  weapon_effects（球形杀伤）
├── weapon/
│   ├── BLUE_LR_A2A_RF_MISSILE.txt      90   弹体 platform_type + weapon（两段式）
│   ├── BLUE_SR_A2A_IR_MISSILE.txt     102   弹体 platform_type + weapon（两段式）
│   ├── SIMPLE_A2A_MISSILE.txt          27   派生弹体 + launch_computer + weapon
│   └── BLUE_SR_A2A_IR_MISSILE_ATA_LAUNCH_COMPUTER_ALT10KFT_0P6MACH.txt  78  launch_computer（表驱动）
├── platform/
│   ├── TIMED_AC.txt                    31   platform_type TIMED_AC（基型：mover + 驻留定时器）
│   ├── BLUE_PROP_AWACS_1.txt           91   platform_type BLUE_PROP_AWACS_1（预警机）
│   ├── BLUE_MULTIROLE_FIGHTER_2.txt   148   platform_type BLUE_MULTIROLE_FIGHTER_2（多用途战斗机）
│   ├── BLUE_MULTIROLE_FIGHTER_2_ERC.txt 24  派生：category ERC
│   ├── BLUE_MULTIROLE_FIGHTER_2_MRC.txt 27  派生：category MRC
│   ├── CVN.txt                         25   platform_type CVN（航母）
│   └── BOMBER.txt                      67   platform_type BOMBER（红方轰炸机）
└── side/
    ├── blue.txt                        84   蓝方实例（cv_1 CVN / tanker1 / tanker2）
    └── red.txt                        106   红方实例（bomber-1 / 1a / 2 / 3 / 4 / 4a / 5）
```

**范围说明**：原 demo 另有第二个入口 `OAB_mrc_lrc.txt`（远中程 CAP 变体），与本入口**闭包部分重叠**；本案例只收 `OAB_mrc_erc.txt` 的闭包（见 §4.3）。原 demo 的 `struct_test.txt`（`script_struct` 素材）与 `route_edit.txt` **不在本入口闭包内**，故未收录。本案例**无二进制资产**，故无滤除项。

---

## 2. 案例详细说明

### 2.1 任务背景与态势

本案例主题为**航母战斗群外层空战（Outer Air Battle）**，演示一个以航母（CVN）为核心的蓝方水面/空中编队，面对多方向来袭的红方轰炸机群时，如何通过"甲板周期出动 → CAP 驻留/加油/返场 → 体系级派单 → 战斗机拦截交战"的完整闭环组织外层防御。案例的工程化重点不是单机交战细节，而是**体系级任务管理**：蓝方母舰用一个任务处理器（`CVN_TASK_PROCESSOR`）在运行期用 `CreatePlatform` 批量造机，用 `AssignTask` 给下属战斗机派发 `ENGAGE` 任务，属于典型的"指挥官（commander）— 下属（subordinate）"两段式任务状态机范例。

- 蓝方核心平台 `cv_1`（`CVN`）位于 `00:00:00.00n 30:00:00.00w`，航向 `90 deg`（`side/blue.txt:9-13`），其周围定义了 9 个同心圆/扇区 `zone`（`side/blue.txt:14-67`）。
- 红方 7 架轰炸机（`bomber-1` 至 `bomber-5`、`bomber-1a`、`bomber-4a`）从不同方向沿航线逼近 CVN，且都 `track platform cv_1`（`side/red.txt`）。其中 `bomber-1a` 带 `creation_time 30 minutes` 延迟生成。
- 红方轰炸机无武器，其任务处理器在接近 CVN 到 300 nm 内后掉头（`platform/BOMBER.txt:52-64`），用于给蓝方拦截链路提供可探测、可交战的目标。
- 仿真入口 `outer_air_battle.txt:10` 定义 `define_path_variable CASE outer_air_battle`，输出 `output/$(CASE).log`、`output/$(CASE).evt`、`output/$(CASE).aer`，`end_time 6 hours`（`outer_air_battle.txt:86`）。

**归一化特有问题**：原始 demo 入口 `OAB_mrc_erc.txt` 通过 `define_path_variable PATH base_types` + `file_path ../$(PATH)`（源入口 `OAB_mrc_erc.txt:18-20`）把武器定义指向同级 `base_types` demo 目录；归一化时把该依赖**内化**进本工程——原 `platforms/blue_multirole_fighter_2.txt` 引用的 3 个武器文件 `weapons/aam/blue_lr_a2a_rf_missile.txt`、`weapons/aam/blue_sr_a2a_ir_missile.txt`、`weapons/aam/simple_a2a_missile.txt`（来自同级 `base_types` demo）被复制为工程内 `weapon/BLUE_LR_A2A_RF_MISSILE.txt`、`weapon/BLUE_SR_A2A_IR_MISSILE.txt`、`weapon/SIMPLE_A2A_MISSILE.txt`，其传递依赖（`mover/*.txt` 气动、`weapon_effects/*.txt` 毁伤、`signatures/TEST_*` 特征、`weapon/BLUE_SR_A2A_IR_MISSILE_ATA_LAUNCH_COMPUTER_ALT10KFT_0P6MACH.txt` 发射计算表）也一并内化，使工程脱离 `../base_types` 自洽。

### 2.2 兵力编成与阵营

> 标注「运行期创建」的实例不在任何 `platform` 定义中，而是在仿真运行中由 `CVN_TASK_PROCESSOR.launch_ac_struct` 调用 `WsfSimulation.CreatePlatform` 生成（`processor/CVN_TASK_PROCESSOR.txt:55-87`）。

| 阵营 | 平台实例名 | 平台类型 | 挂载（传感器/武器/处理器/comm） | 关键参数 |
| --- | --- | --- | --- | --- |
| 蓝 | `cv_1` | `CVN`（`WSF_PLATFORM` 派生） | 处理器 `task_mgr`（`CVN_TASK_PROCESSOR`）、`data_mgr`（`WSF_TRACK_PROCESSOR`）；comm `cmdr_net`(slave)/`sub_net`(master) | `position 00:00:00.00n 30:00:00.00w`、`heading 90 deg`；9 个 zone（100 nm 全圆 + 150~500 nm 各 315°→45° 扇区），见 `side/blue.txt:14-67` |
| 蓝 | `tanker1` | `WSF_PLATFORM` | 无（仅图标 `kc-135`，作加油锚点） | `position 00:37:55.53n 27:48:46.39w altitude 30000 ft`（`side/blue.txt:72-76`） |
| 蓝 | `tanker2` | `WSF_PLATFORM` | 无（图标 `kc-135`） | `position 00:26:01.38s 27:45:33.25w altitude 30000 ft`（`side/blue.txt:78-82`） |
| 蓝 | `erc-1`…`erc-4`（运行期创建） | `BLUE_MULTIROLE_FIGHTER_2_ERC` | 继承战斗机全套（雷达/ESM/2 型武器/双处理器/comm） | 每次出动 4 架，`at_end_of_path extrapolate`，走 `erc-1..4` 航线，终点 `deleteSelf` |
| 蓝 | `mrc-1`…`mrc-6`（运行期创建） | `BLUE_MULTIROLE_FIGHTER_2_MRC` | 继承战斗机全套 + 处理器 `station_timer`（`STATION_TIMER`） | 每次出动 6 架，CAP 驻留 3 h、加油间隔 1.5 h，走 `mrc-1..6` 航线 |
| 蓝 | `aew-1`、`aew-2`（运行期创建） | `BLUE_PROP_AWACS_1`（派生自 `TIMED_AC`） | 传感器 `geo_sensor`（几何传感器 250 nm）；`data_mgr`、`task_mgr`、`station_timer`；comm | 每次出动 2 架，走 `aew-1/aew-2` 航线，`at_end_of_path remove` |
| 红 | `bomber-1`…`bomber-5`、`bomber-1a`、`bomber-4a` | `BOMBER`（`WSF_PLATFORM` 派生） | 处理器 `track_manager`、`task_mgr`；雷达/红外/光学三特征 | 均 `track cv_1`；速度 400 kts、高度 40000 ft；`bomber-1a` 带 `creation_time 30 minutes` |

蓝方战斗机/预警机的公共挂载（`platform/BLUE_MULTIROLE_FIGHTER_2.txt`）：传感器 `blue_a2a_radar`（类型 `GEO_AA_RADAR`，前扇区 ±60°、125 nm）与 4 个 `GENERIC_ESM_SENSOR`（yaw 45/135/-135/-45°）；武器 `blue_lr_a2a_rf_missile` ×10、`blue_sr_a2a_ir_missile` ×2；处理器 `data_mgr`（`report_to commander via cmdr_net`）、`task_mgr`（`BLUE_MULTIROLE_FIGHTER_2_TASK_PROCESSOR`）。

### 2.3 装配链（入口 → 根文件 → 组件 → 实例）

```
outer_air_battle.txt（入口）
├─ define_path_variable CASE outer_air_battle；log_file output/$(CASE).log
├─ include_once event_pipe.txt          → event_pipe file output/$(CASE).aer
├─ include_once global_struct.txt       → script_struct launchParameters（int num/string type/string prefix）
├─ include_once global_route.txt        → route aew-1/aew-2、erc-1..4、mrc-1..6
├─ include_once setup.txt
│   ├─ platform/BLUE_PROP_AWACS_1.txt   ─┬─ include platform/TIMED_AC.txt
│   │                                    │    ├─ include processor/STATION_TIMER.txt
│   │                                    │    └─ include global_script.txt（OnStation）
│   │                                    └─ include comm/BLUE_COMM.txt
│   ├─ platform/BLUE_MULTIROLE_FIGHTER_2.txt
│   │    ├─ include weapon/BLUE_LR_A2A_RF_MISSILE.txt（→ signatures/TEST_*、mover/GUESSED_AERO、weapon_effects/TEST_EFFECT）
│   │    ├─ include weapon/BLUE_SR_A2A_IR_MISSILE.txt（→ mover/BLUE_SR_A2A_IR_MISSILE_AERO、weapon_effects/BLUE_SR_A2A_IR_MISSILE_EFFECT）
│   │    ├─ include weapon/SIMPLE_A2A_MISSILE.txt（→ 上述两武器 + launch_computer 表）
│   │    ├─ include sensor/BLUE_A2A_RADAR.txt、sensor/GENERIC_ESM_SENSOR.txt、sensor/GEO_AA_RADAR.txt
│   │    ├─ include processor/BLUE_MULTIROLE_FIGHTER_2_TASK_PROCESSOR.txt
│   │    ├─ include signatures/BLUE_A2A_RADAR_SIGNATURE.txt
│   │    └─ include comm/BLUE_COMM.txt
│   ├─ platform/BLUE_MULTIROLE_FIGHTER_2_ERC.txt ─ include platform/BLUE_MULTIROLE_FIGHTER_2.txt
│   ├─ platform/BLUE_MULTIROLE_FIGHTER_2_MRC.txt ─ include processor/STATION_TIMER.txt + include global_script.txt
│   ├─ platform/CVN.txt               ─ include processor/CVN_TASK_PROCESSOR.txt + comm/BLUE_COMM.txt
│   └─ platform/BOMBER.txt            ─ include signatures/BOMBER_{RADAR,INFRARED,OPTICAL}_SIGNATURE.txt
├─ include_once side/blue.txt          → 实例 cv_1、tanker1、tanker2
└─ include_once side/red.txt           → 实例 bomber-1..5、bomber-1a、bomber-4a
```

要点：所有 `platform_type` 只定义**类型**，真正的平台**实例**只出现在 `side/blue.txt`（蓝方初始 3 个）与 `side/red.txt`（红方 7 个）；蓝方 12 架飞机（2 AEW + 4 ERC + 6 MRC）没有静态实例，全部由 `CVN_TASK_PROCESSOR` 在运行期生成。归一化时 `../base_types` 的 `file_path` 已删除，武器定义改为工程内 `weapon/` 相对路径（见 2.1）。

### 2.4 组件职责逐项说明

| 文件 | 块类型与名称 | 职责 | 关键参数/取值 |
| --- | --- | --- | --- |
| `outer_air_battle.txt` | 入口（`define_path_variable`、`include_once`、`event_output`、`event_pipe`、`end_time`） | 顶层装配：设 CASE 路径变量、引入全部文件、配置事件输出 | `CASE=outer_air_battle`（:10）；启用 LOCAL_TRACK_*/TASK_*/WEAPON_*/SENSOR_* 等事件（:40-77）；`end_time 6 hours`（:86） |
| `setup.txt` | `include_once` ×6 | 平台类型装配清单 | 引入 6 个 `platform/*.txt`（:9-14） |
| `event_pipe.txt` | `event_pipe` | 回放流输出（.aer） | `file output/$(CASE).aer`（:12） |
| `global_struct.txt` | `script_struct launchParameters` | 定义造机参数结构体 | 字段 `int num`、`string type`、`string prefix`（:9-15） |
| `global_route.txt` | `route aew-1/aew-2`、`erc-1..4`、`mrc-1..6` | 全部航线的统一定义 | aew 300 kts；erc 480 kts；mrc 420 kts（见 2.6） |
| `global_script.txt` | `script void OnStation()` | 航线进入 CAP 站时打点计时 | 置 `NOW_ON_CAP`/`ON_STATION_TIME`=TIME_NOW（仅首次，`<0.0` 才写）（:15-33） |
| `config/run.json` | 运行配置 JSON | 归一化工具附带的仿真运行参数 | `recordAer:1, recordLog:1, recordEvent:0, timeRate:1.0, stepValue:0.1, startMode:2` |
| `output/blank_empty.txt` | 空占位文件 | 保证 output 目录存在 | 空（0 行） |
| `side/blue.txt` | `platform cv_1/tanker1/tanker2` + 9 个 `zone` | 蓝方初始实例与 CVN 分区 | cv_1 位置/航向；zone 半径 100~500 nm（:14-67）；tanker 位置见 2.2 |
| `side/red.txt` | `platform bomber-1..5/1a/4a`（含 `route`、`track cv_1`） | 红方轰炸机实例与逼近航线 | 高度 40000 ft、速度 400 kts；`bomber-1a` `creation_time 30 minutes`（:30） |
| `comm/BLUE_COMM.txt` | `comm cmdr_net`、`comm sub_net` | 蓝方通信网络 | `cmdr_net`=`<local:slave>`、`sub_net`=`<local:master>`；均 `internal_link data_mgr/task_mgr`（:11-21） |
| `platform/CVN.txt` | `platform_type CVN WSF_PLATFORM` | 母舰平台类型：装任务/航迹处理器与通信 | `task_mgr CVN_TASK_PROCESSOR`、`data_mgr WSF_TRACK_PROCESSOR`（:18-23） |
| `platform/TIMED_AC.txt` | `platform_type TIMED_AC WSF_PLATFORM` | 带驻留计时的通用空中平台基类（AEW 的父类） | 空 `WSF_AIR_MOVER`；`station_timer` 默认 1000/3000 s（:14-32） |
| `platform/BLUE_PROP_AWACS_1.txt` | `platform_type BLUE_PROP_AWACS_1 TIMED_AC` | 预警机：几何全向传感器 + 上报 + 画覆盖圆 | `geo_sensor` 250 nm、`track_quality 0.75`、`reports_iff`（:27-43）；`data_mgr report_to commander via cmdr_net`、`purge_interval 10 min`（:67-73）；`station_timer` 总时长 3 h、`time_before_refueling=INTEGER_MAX`（:75-80） |
| `platform/BLUE_MULTIROLE_FIGHTER_2.txt` | `platform_type BLUE_MULTIROLE_FIGHTER_2 WSF_PLATFORM` | 多用途战斗机基类（ERC/MRC 共同父类） | mover `maximum_speed 1160 kts`、`maximum_altitude 50000 ft`、`at_end_of_path remove`（:30-50）；雷达扇区绘制 125 nm ±60°（:63-81）；ESM ×4（:91-117）；武器 `blue_lr_a2a_rf_missile`×10、`blue_sr_a2a_ir_missile`×2（:132-137） |
| `platform/BLUE_MULTIROLE_FIGHTER_2_ERC.txt` | `platform_type ..._ERC BLUE_MULTIROLE_FIGHTER_2` | 远程 CAP 型：`category ERC`、路径终点外推、自毁脚本 | `at_end_of_path extrapolate`（:16-18）；`deleteSelf()`→`PLATFORM.DeletePlatform()`（:20-22） |
| `platform/BLUE_MULTIROLE_FIGHTER_2_MRC.txt` | `platform_type ..._MRC BLUE_MULTIROLE_FIGHTER_2` | 中程 CAP 型：`category MRC` + 驻留计时 | `station_timer` 总时长 3 h、加油间隔 1.5 h（:22-27）；含 `global_script.txt` 的 OnStation |
| `platform/BOMBER.txt` | `platform_type BOMBER WSF_PLATFORM` | 红方轰炸机：三特征 + 抵近掉头任务 | mover `maximum_speed 516 kts`、`at_end_of_path extrapolate`（:22-43）；`task_mgr` 在 `GroundRangeTo<=300 nm` 时 `TurnToRelativeHeading(180)`（:51-64） |
| `processor/CVN_TASK_PROCESSOR.txt` | `processor CVN_TASK_PROCESSOR WSF_TASK_PROCESSOR` | 母舰体系处理器：造机循环 + 派单状态机 | 见 2.6（`numERC=4/numMRC=6/numAEW=2`、`launchCycle=90 min` 等） |
| `processor/STATION_TIMER.txt` | `processor STATION_TIMER WSF_SCRIPT_PROCESSOR` | 驻留计时器：到期去加油/返场 | 见 2.6（`time_before_refueling/total_station_time` 与标签参数） |
| `processor/BLUE_MULTIROLE_FIGHTER_2_TASK_PROCESSOR.txt` | `processor BLUE_MULTIROLE_FIGHTER_2_TASK_PROCESSOR WSF_TASK_PROCESSOR` | 战斗机拦截交战状态机 | 见 2.6（`aam="blue_lr_a2a_rf_missile"`、`flyout=60`、`Fire(...,2)`） |
| `sensor/GEO_AA_RADAR.txt` | `sensor GEO_AA_RADAR WSF_GEOMETRIC_SENSOR` | 战斗机几何探测传感器（"AA 雷达"实例化即此类型） | 方位 ±60°、俯仰 ±10°、`maximum_range 125 nm`、`track_quality 1.0`、`reports_iff`（:16-29） |
| `sensor/BLUE_A2A_RADAR.txt` | `antenna_pattern BLUE_A2A_RADAR_ANTENNA_PATTERN` + `sensor BLUE_A2A_RADAR WSF_RADAR_SENSOR` | 基于 APG-73 的详细雷达定义（本案例中被 `include` 但战斗机实例化的 `blue_a2a_radar` 实为 `GEO_AA_RADAR`） | 发射机 9.6 GHz/2.0 MW（:142-143）；`range_product 201.8 dBsm`(≈59.9 nm)；`mode 120X10` 2.3 MW、194.4 dBsm(≈39.1 nm)；`mode 40X20` 198.7 dBsm(≈50.1 nm)（:162-187）；α/β 滤波 0.4/0.1（:192-195） |
| `sensor/GENERIC_ESM_SENSOR.txt` | `sensor GENERIC_ESM_SENSOR WSF_ESM_SENSOR` | 无源 ESM：测频/测向、三角定位测距 | 频段 2-4 与 8-12 GHz（:103-104）；`ranging_time 30 sec`（:108）；`detection_threshold 3.0 db`、`noise_power -40 dbm`（:111-118）；FOV ±60°（:97-98） |
| `signatures/BLUE_A2A_RADAR_SIGNATURE.txt` | `radar_signature blue_a2a_radar_signature` | 战斗机雷达特征 | `constant 10 dbsm`（:10） |
| `signatures/BOMBER_RADAR_SIGNATURE.txt` | `radar_signature bomber_radar_signature` | 轰炸机雷达特征 | `constant 1000 m2`（:10） |
| `signatures/BOMBER_INFRARED_SIGNATURE.txt` | `infrared_signature bomber_infrared_signature` | 轰炸机红外特征 | `constant 1000 w/sr`（:10） |
| `signatures/BOMBER_OPTICAL_SIGNATURE.txt` | `optical_signature bomber_optical_signature` | 轰炸机光学特征 | `constant 1000 m2`（:10） |
| `signatures/TEST_RADAR_SIGNATURE.txt` | `radar_signature TEST_RADAR_SIGNATURE` | 导弹测试雷达特征 | `constant 1 m^2`（:10） |
| `signatures/TEST_INFRARED_SIGNATURE.txt` | `infrared_signature TEST_INFRARED_SIGNATURE` | 导弹测试红外特征 | `constant 1 watts/steradian`（:10） |
| `signatures/TEST_OPTICAL_SIGNATURE.txt` | `optical_signature TEST_OPTICAL_SIGNATURE` | 导弹测试光学特征 | `constant 1 m^2`（:10） |
| `weapon/BLUE_LR_A2A_RF_MISSILE.txt` | `platform_type BLUE_LR_A2A_RF_MISSILE` + `weapon BLUE_LR_A2A_RF_MISSILE WSF_EXPLICIT_WEAPON` | 远程射频空空弹（交战实际用弹，AIM-120 类） | 弹体 `WSF_GUIDED_MOVER`：总重 150 kg、燃料 80 kg、`thrust 4000 lbf`、`thrust_duration 40 s`、`specific_impulse 907.18 s`（:36-41）；制导 `WSF_GUIDANCE_COMPUTER`（PN/VP 增益 30、`g_bias 1.2`、40 g）；引信 `WSF_AIR_TARGET_FUSE`（`time_of_flight_to_arm 2 s`、`max_time_of_flight_to_detonate 140 s`）；武器 `quantity 4`、`salvo_interval 5 s`（:74-87） |
| `weapon/BLUE_SR_A2A_IR_MISSILE.txt` | `platform_type BLUE_SR_A2A_IR_MISSILE_BASE` + `weapon BLUE_SR_A2A_IR_MISSILE` | 近程红外空空弹（AIM-9X 类） | 总重 188 lbm、燃料 61 lbm、`thrust 2700 lbf`、`thrust_duration 5.1 s`、Isp 222 s（:37-43）；`launch_delta_v 10 0 0 m/s`；`max_time_of_flight_to_detonate 120 s`（:62） |
| `weapon/BLUE_SR_A2A_IR_MISSILE_ATA_LAUNCH_COMPUTER_ALT10KFT_0P6MACH.txt` | `launch_computer BLUE_SR_A2A_IR_MISSILE_ATA_LAUNCH_COMPUTER_10KFT_0.6MACH WSF_ATA_LAUNCH_COMPUTER` | 表驱动发射包线计算机（见 2.6） | 适用 3048 m/0.6 马赫；`minimum_slant_range 3472.5 m`、`maximum_slant_range 17362.5 m`、`maximum_boresight_angle 80.6647 deg`（:18-22） |
| `weapon/SIMPLE_A2A_MISSILE.txt` | `platform_type SIMPLE_A2A_MISSILE` + `launch_computer SIMPLE_A2A_LAUNCH_COMPUTER` + `weapon SIMPLE_A2A_MISSILE_WEAPON` | 简易导弹派生 + 挂接发射计算机（本案例未实际挂载） | `category ignored-by-iads-radar`（:15）；`launch_computer SIMPLE_A2A_LAUNCH_COMPUTER`（:19-25） |
| `mover/GUESSED_AERO.txt` | `aero GUESSED_AERO WSF_AERO` | 远程弹气动数据（借用/估测） | `mach_and_cd` 8 点（0.0→1.25 … 4.0→1.0）；`reference_area 0.02488 m2`；`cl_max 15.0`、`aspect_ratio 25.0`（:20-33） |
| `mover/BLUE_SR_A2A_IR_MISSILE_AERO.txt` | `aero BLUE_SR_A2A_IR_MISSILE_AERO WSF_AERO` | 近程弹气动数据 | `mach_and_cd` 8 点（0.0→1.35 … 4.0→1.0）；`reference_area 0.13635 ft2`；`cl_max 10.0`、`aspect_ratio 17.7`、`oswalds_factor 0.9`（:11-26） |
| `weapon_effects/TEST_EFFECT.txt` | `weapon_effects TEST_EFFECT WSF_GRADUATED_LETHALITY` | 远程弹毁伤（Pk=1 的占位效果） | `radius_and_pk 50 ft 1.0` 与 `100 m 1.0` 两条（:10、:15） |
| `weapon_effects/BLUE_SR_A2A_IR_MISSILE_EFFECT.txt` | `weapon_effects BLUE_SR_A2A_IR_MISSILE_EFFECT WSF_SPHERICAL_LETHALITY` | 近程弹球形毁伤 | `minimum_radius 50 ft`、`maximum_radius 60 ft`、`maximum_damage 1.0`、`minimum_damage 0.2`、`threshold_damage 0.2`、`exponent 1.0`（:11-17） |

### 2.5 运行时序与数据流

按时间顺序（时间单位除注明外为仿真时钟）：

1. **初始编成（t=0）**：入口解析完所有 `platform_type` 后，`side/blue.txt` 生成 `cv_1`、`tanker1`、`tanker2`，`side/red.txt` 生成 6 架轰炸机（`bomber-1a` 因 `creation_time 30 minutes` 在 30 min 时才生成）。红方轰炸机各自沿航线以 400 kts、40000 ft 朝 CVN 飞行。

2. **CVN 出动循环（首次 on_update，约 t=60 s）**：`CVN_TASK_PROCESSOR.on_update` 每 60 s 触发一次（`processor/CVN_TASK_PROCESSOR.txt:200`）。初始 `nextAEWlaunch/nextERClaunch/nextMRClaunch = -1.0` 均 `< TIME_NOW`，故首次即连续调用 `launch_ac_struct(AEW/ERC/MRC)`，一次性生成 2 AEW + 4 ERC + 6 MRC 共 12 架飞机，并把下次出动时间推后：AEW、MRC 各 `+2.0*launchCycle`（即 180 min），ERC `+launchCycle`（即 90 min）（`:202-218`）。

3. **`CreatePlatform` 造机时机与细节**：`launch_ac_struct` 对结构体 `tempParms` 内 `num` 架循环（`:56-86`）：`WsfSimulation.CreatePlatform(tempParms->type)` 造出对应类型；依次 `ProcessInput("side blue")`、`ProcessInput("position 0n 30w heading 90 deg")`、`ProcessInput("commander <PLATFORM.Name()>")`（即 `commander cv_1`），再 `WsfSimulation.AddPlatform(p, "")` 用自动命名挂入场景；随后 `pa.FollowRoute(prefix + i)`（如 `mrc-3`）使飞机立即沿对应航线起飞，失败则 `DeletePlatform` 并报错（`:74-82`）。造出的飞机自动成为 `cv_1` 的 subordinate（因 `commander cv_1`）。

4. **CAP 驻留 / 加油 / 返场**：MRC 沿 `mrc-N` 航线飞至 `on_station` 航路点，`execute OnStation`（`global_route.txt` 各 mrc 航线 `on_station` 段）首次置 `NOW_ON_CAP` 与 `ON_STATION_TIME`。`STATION_TIMER.on_update` 每 5 s 检查（`processor/STATION_TIMER.txt:162-189`）：当 `ON_STATION_TIME` 已过 `MAX_TIME_ON_STATION`（MRC 为 1.5 h）→ `GoRefuel()` 令飞机改飞 `cap_refuel` 标签（加油点，即 tanker 位置）并 `pause_time 10 min` 后回到轨道重新打点；当 `NOW_ON_CAP` 已过 `TOTAL_STATION_TIME`（3 h）→ `GoHome()` 令飞机改飞 `go_home` 标签返航。AEW 因 `time_before_refueling=INTEGER_MAX` 永不去加油，3 h 后直接返航。

5. **探测**：AEW 的 `geo_sensor`（250 nm 几何全向）与战斗机的 `GEO_AA_RADAR`（125 nm 前扇区）发现红方轰炸机，各自 `data_mgr` 处理器通过 `cmdr_net` 上报航迹给 `cv_1`；`cv_1` 的 `data_mgr` 汇总成统一航迹图。

6. **体系级派单（`AssignTask` 消息流）**：`cv_1` 的 `task_mgr`（`CVN_TASK_PROCESSOR`，`WSF_TASK_PROCESSOR`）逐航迹驱动状态机：`DETECTED → VECTOR`（`availableSubordinates()` 判断是否存在无任务空闲的 fighter，`:243-248`）；`VECTOR → ASSIGNED`（`assignInterceptor(1)`，`:250-256`）；`ASSIGNED → DEASSIGN`（`:258-281`）。`assignInterceptor` 先选**最近的 ERC**，再补选**最近的 MRC**，对选中者调用 `AssignTask(TRACK, "ENGAGE", 飞机)`（`:149、:181`），该调用经 `sub_net` 向对应战斗机 `task_mgr` 投递 `WSF_TASK_ASSIGN_MESSAGE`。

7. **交战**：战斗机 `BLUE_MULTIROLE_FIGHTER_2_TASK_PROCESSOR` 收到 `ENGAGE` 任务后 `DETECTED → INTERCEPT`（`:104-108`），在 `INTERCEPT` 里计算拦截点，`GoToSpeed(540 kts)` 并 `GoToPoint` 飞向目标，斜距 `< 50 nm` 时进入 `ENGAGE`（`:120-130`）；`ENGAGE` 里取 `blue_lr_a2a_rf_missile` 武器，`Fire(TRACK, "ENGAGE", aim120, 2)` 齐射 2 枚（`:140-152`）。

8. **武器飞行**：`blue_lr_a2a_rf_missile` 弹体按 `WSF_GUIDED_MOVER` + `WSF_GUIDANCE_COMPUTER`（比例导引/速度追踪）+ `WSF_PERFECT_TRACKER`（理想跟踪器）+ `WSF_AIR_TARGET_FUSE` 飞向目标，命中后按 `TEST_EFFECT`（Pk=1）判定击毁，产生 `WEAPON_HIT`/`PLATFORM_BROKEN` 事件。

9. **终结**：战斗机发射后进入 `WAIT`，设 `evalTime=TIME_NOW+flyout`（60 s）；目标被击毁（`TRACK.Target()` 失效）后 `WAIT → RETURN_TO_ROUTE`，`returnToRoute()` 里 `TaskComplete(TRACK.TrackId(), "ENGAGE")` 并 `FollowRoute` 恢复原航线（`:154-175`、`:75-82`）。若 CVN 判定目标背离（`RelativeBearingTo` 超出 ±90°）或目标失效，则在 `ASSIGNED` 态调用 `deassignInterceptor()`→`CancelTask`，战斗机收到 `WSF_TASK_CANCEL_MESSAGE` 记录 `deassigned[currentTarget]=true` 并清空当前目标（`:190-198`、`:48-57`）。

### 2.6 关键脚本逻辑

**（1）`processor/CVN_TASK_PROCESSOR.txt`（288 行）——母舰体系处理器**。结构与职责分两层：

- *造机循环*：`script_variables` 声明 `numERC=4/numMRC=6/numAEW=2`、`launchCycle=90.0`（分钟）、三个 `next*launch=-1.0`，并用 `struct.New("launchParameters")` 构造 `ERC/MRC/AEW` 三个参数结构（`:24-49`），这是 `global_struct.txt` 的 `script_struct launchParameters` 的实例化用法。`launch_ac_struct` 按 2.5 第 3 步造机并 `FollowRoute`。`on_update`（`update_interval 60 seconds`）按周期调用：AEW、MRC 每 `2*launchCycle`（180 min）、ERC 每 `launchCycle`（90 min）各出动一次（`:200-220`）。
- *派单状态机*（`WSF_TASK_PROCESSOR` 逐航迹）：`DETECTED→VECTOR→ASSIGNED→DEASSIGN`，各态 `evaluation_interval 10 sec`。`availableSubordinates()`（`:94-112`）遍历 `PLATFORM.Subordinates()`，返回是否存在 `CategoryMemberOf("fighter")` 且 `TasksAssignedTo(temp, TRACK.TrackId())<1` 的空闲机；`assignInterceptor`（`:123-188`）先 ERC 后 MRC 各取 `GroundRangeTo(TRACK)` 最近者 `AssignTask`，注意其注释自陈"非常简单，可能选中正在返航或超出射程的飞机"；`ASSIGNED` 态用 `TRACK.Target().RelativeBearingTo(PLATFORM)` 判定目标是否朝向 CVN，背离则 `deassignInterceptor()` 取消任务（`:262-280`）。

**（2）`processor/STATION_TIMER.txt`（191 行）——驻留计时器**。`processor STATION_TIMER WSF_SCRIPT_PROCESSOR`。脚本变量给出 4 个可覆盖参数：`time_before_refueling=1000.0`、`total_station_time=3000.0`、`refuel_waypoint_label="cap_refuel"`、`go_home_waypoint_label="go_home"`（`:104-109`）。`on_initialize` 把参数写入 AuxData：`MAX_TIME_ON_STATION`、`TOTAL_STATION_TIME`、并把 `ON_STATION_TIME`/`NOW_ON_CAP` 初始为 `-1.0`（`:112-119`）。`GoRefuel()`/`GoHome()` 通过 `PLATFORM.FollowRoute(routeName, label)` 令飞机跳到指定标签航点（`:130-158`）。`on_update`（5 s）比较 `TIME_NOW - ON_STATION_TIME >= MAX_TIME_ON_STATION` 触发去加油、`TIME_NOW - NOW_ON_CAP >= TOTAL_STATION_TIME` 触发返航（`:172-187`）。文件头注释明确要求航线必须含 `cap_refuel`/`go_home` 标签，否则飞机不会正确沿航线飞行。

**（3）`processor/BLUE_MULTIROLE_FIGHTER_2_TASK_PROCESSOR.txt`（177 行）——战斗机拦截状态机**。`script_variables` 定 `aam="blue_lr_a2a_rf_missile"`、`flyout=60.0`、`currentRouteIndex=-1`、`Map<string,bool> deassigned` 等（`:13-22`）。状态链 `DETECTED→INTERCEPT→ENGAGE→WAIT→RETURN_TO_ROUTE`：`DETECTED→INTERCEPT` 条件是 `TasksReceivedFor(TRACK.TrackId(),"ENGAGE")>0`（即确实收到指挥官的 ENGAGE 任务）；`INTERCEPT` 记下 `currentRouteIndex`、置 `activeTarget=true`，算拦截点飞向目标，`SlantRangeTo < 50 nm` 转 `ENGAGE`（`:110-138`）；`ENGAGE` 内 `Fire(TRACK,"ENGAGE",aim120,2)` 齐射 2 枚（`:144-150`）；`WAIT` 设 `evalTime` 后若目标失效转 `RETURN_TO_ROUTE`（`:154-166`）；`returnToRoute()` 调 `TaskComplete` 并 `FollowRoute(routeName, currentRouteIndex)` 恢复原航线、清 `activeTarget`（`:75-82`）。`WSF_TASK_CANCEL_MESSAGE` 分支把 `deassigned[currentTarget]=true` 并清空 `currentTarget`（`:48-57`），因取消消息里的 TrackId 来自指挥官、无法反查航迹，故用 map 记录，供状态机判断。

**（4）`global_script.txt`（32 行）——`OnStation()`**。`script void OnStation()` 被 `global_route.txt` 各 CAP 轨道首点 `execute OnStation` 调用：仅当 `PLATFORM.AuxDataDouble("NOW_ON_CAP")<0.0` 时才写入 `NOW_ON_CAP=TIME_NOW`，同理 `ON_STATION_TIME`（`:23-32`）。这种"负值哨兵 + 首次打点"写法保证飞机每次绕圈回到首点时不重置计时。

**（5）`global_struct.txt`（15 行）——`script_struct`**。`script_struct launchParameters` 定义三个字段 `int num / string type / string prefix`，供 `CVN_TASK_PROCESSOR` 用 `struct.New("launchParameters")` 实例化并在造机循环里取用（`:9-15`）。

**（6）`global_route.txt`（316 行）——route 组织**。共 12 条航线，均为"出发（0n 30w）→ 外走/集结 → 巡逻段 → 返航段"骨架：

- `aew-1/aew-2`：300 kts 起飞后爬升至 30000 ft，进入 `label on_station` 轨道（250 knots、`execute OnStation`、`goto on_station` 闭环），`label go_home` 段返航至 `0n 30w` 后 `execute atEndOfRoute`；`aew-2` 在第二点加 `pause_time 15 minutes`（`:12-49`）。
- `erc-1..4`：480 kts，`outbound_marshalling_point` 处 `pause_time` 10/15 min，过集结/加油点（`erc-1/2` 取 `00:37:55.53n 27:48:46.39w`=tanker1、`erc-3/4` 取 `00:26:01.38s 27:45:33.25w`=tanker2）再 `pause_time 10 min`，飞至远端（如 `erc-1` 终点 `05:52:31.28n 24:06:59.75w`）`execute atEndOfRoute`，随后 `label inbound_marshalling_point` 返航至 `0n 30w` `execute deleteSelf`（`:54-128`）。ERC 无驻留计时器，属"前出→折返→自毁"的一次性远程 CAP。
- `mrc-1..6`：420 kts，`outbound_marshalling_point` → `cap_refuel`（`pause_time 10 min`，`mrc-1/2/3` 挂 tanker1、`mrc-4/5/6` 挂 tanker2）→ `label on_station` 轨道（`radial_acceleration 1.000 g`、`execute OnStation`、`goto on_station`）→ `label go_home` → `inbound_marshalling_point` 返航 `execute atEndOfRoute`（`:134-315`）。轨道点分布在不同经纬度，实现多架 MRC 分片巡逻。注意 `mrc-N` 与 `erc-N` 的 `N` 对应 `CVN_TASK_PROCESSOR` 里 `prefix + i` 生成的航线名，是"参数结构体 → 航线名"表驱动耦合的关键。

**（7）表驱动 `launch_computer` 原理**。`weapon/BLUE_SR_A2A_IR_MISSILE_ATA_LAUNCH_COMPUTER_ALT10KFT_0P6MACH.txt` 定义 `WSF_ATA_LAUNCH_COMPUTER`：先用一组解析约束做快判（`minimum_slant_range 3472.5 m`、`maximum_slant_range 17362.5 m`、`maximum_boresight_angle 80.6647 deg`、`maximum_opening_speed ±228.6 m/s`，`:18-22`），命中判定则查一张由独立变量（进入角 4 bin、方位角 4 bin×90°、俯仰角 4 bin×-45°..45°、接近速率 4 bin×±304.8 m/s、发射距离 4 bin×0..27780 m）张成的多维 `time_of_flight_values` 表，表内 `0` 表示脱靶、非零为命中飞行时间（`:24-76`）。该表由 `ATALaunchComputerGenerator` 于 2007-07-06 生成，仅对 `altitude=3048 m, speed=197.035 m/s(0.6 马赫), DeltaV=(10 0 0)` 有效。本案例中它被 `weapon/SIMPLE_A2A_MISSILE.txt` 的 `SIMPLE_A2A_LAUNCH_COMPUTER` 继承，但该武器未被战斗机挂载；实际交战的 `blue_lr_a2a_rf_missile` 走 `WSF_EXPLICIT_WEAPON` 显式发射、并不使用此表——故表驱动发射计算机在本案例里是"随武器文件一并内化的可复用资产"，而非交战主链路。

### 2.7 可复用要点与陷阱

- **体系派单两段式模板**：`CVN_TASK_PROCESSOR`（指挥官端，逐航迹 `AssignTask`）+ `BLUE_MULTIROLE_FIGHTER_2_TASK_PROCESSOR`（执行端，按 `TasksReceivedFor` 触发拦截）是 AFSIM 多机协同任务的经典骨架，可直接复用。注意两端必须通过 `comm` 与 `report_to commander via cmdr_net`、`commander <母舰名>` 正确连通，否则任务消息无法到达。
- **`CreatePlatform` 造机**：用 `script_struct` + `struct.New` 做"类型/数量/前缀"表驱动批量造机，再 `FollowRoute(prefix+i)` 绑定同名航线，是最省事的多机生成手法。陷阱：航线名必须严格等于 `prefix + i`，且必须用 `include_once` 防重入；`AddPlatform` 失败要 `DeletePlatform` 清理（`processor/CVN_TASK_PROCESSOR.txt:78-82`）。
- **驻留计时用 AuxData + 负值哨兵**：`STATION_TIMER` 用 `-1.0` 表示"尚未到站"，配合 `global_script.txt` 的 `OnStation` 首次打点，避免轨道绕圈重置计时。陷阱：`GoRefuel/GoHome` 依赖航线上存在 `cap_refuel`/`go_home` 标签，标签名与脚本变量不一致会导致飞机走错航线（`processor/STATION_TIMER.txt:42-49` 头注释明确警告）。
- **`at_end_of_path` 的派生覆盖**：基类战斗机 `remove`，ERC 覆盖为 `extrapolate` 并靠 `deleteSelf` 脚本手动自毁；MRC/AEW 保持 `remove`。理解每个派生平台对 `edit mover` 的覆盖（`platform/BLUE_MULTIROLE_FIGHTER_2_ERC.txt:16-18`）是避免"飞机莫名消失或永不消失"的关键。
- **表驱动发射计算机**：`WSF_ATA_LAUNCH_COMPUTER` 的 `time_of_flight_values` 表里 `0` 即脱靶、非零即命中时间，且只对生成时的单一高度/速度/DeltaV 有效；换发射条件必须重新用生成器产出，不可手工外推（文件头 `# WARNING` 与 `:13-16` 说明）。
- **事件与输出**：`event_output` 与 `event_pipe` 都指向 `output/$(CASE).*`，`end_time 6 hours`；`config/run.json` 里 `recordAer=1` 与 `event_pipe` 对应 `.aer` 回放流，`recordEvent=0` 表示 GUI 侧不重复录事件（事件开关在入口 `event_output` 里显式 `enable`）。`output/blank_empty.txt` 仅用于占位保证目录存在。
- **陷阱（命名/依赖）**：`sensor/BLUE_A2A_RADAR.txt` 定义的 `WSF_RADAR_SENSOR` 在本案例中被 `include_once` 但战斗机实例化的 `blue_a2a_radar` 实际是 `GEO_AA_RADAR`（`platform/BLUE_MULTIROLE_FIGHTER_2.txt:56`）——几何传感器与详细雷达同名异类，阅读/复用时勿混淆；`weapon/SIMPLE_A2A_MISSILE.txt` 与 `weapon/BLUE_SR_A2A_IR_MISSILE.txt` 存在 `include_once` 的传递依赖去重关系，改动武器时要注意 `include_once` 的全局一次性语义。归一化后 `file_path ../base_types` 已内化，复制本工程到其他机器即可独立运行，无需携带 `base_types`。

---

## 3. 完整脚本全文

> 文件顺序 = **装配顺序**（入口 → 根文件 → 组件自下而上 → `platform_type` → `side/` 实例 → 非 AFSIM 文件）。
> 共 39 个文件、2,590 行；正文与归一化工程**逐行一致**（文档内行尾统一为 LF；源为 CRLF 的文件在文档中即表现为 LF）。
> 行数按**换行符**计（`wc -l` 口径）；本案例有 **6** 个源文件末行无换行符（`event_pipe.txt`、`global_script.txt`、`platform/BLUE_MULTIROLE_FIGHTER_2_MRC.txt`、`platform/BLUE_PROP_AWACS_1.txt`、`platform/TIMED_AC.txt`、`sensor/GEO_AA_RADAR.txt`），其**可寻址行号**比"行数"多 1；文档为闭合围栏在末行补一个换行符，正文内容不变。

### ===== FILE: outer_air_battle.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************

define_path_variable CASE outer_air_battle
log_file output/$(CASE).log

script_interface debug end_script_interface

file_path .

#dis_interface end_dis_interface

include_once event_pipe.txt
include_once global_struct.txt
include_once global_route.txt

# platforms
include_once setup.txt

## scenarios
include_once side/blue.txt
include_once side/red.txt

# File generated by Wizard 2.7.0 on Sep 3, 2020.
event_output 
   #enable all # comment this line out when only a few items are desired

   #enable COMM_TURNED_OFF
   #enable COMM_TURNED_ON
   #enable JAMMING_ATTEMPT
   #enable JAMMING_REQUEST_CANCELED
   #enable JAMMING_REQUEST_INITIATED
   #enable JAMMING_REQUEST_UPDATED
   enable LOCAL_TRACK_CORRELATION
   enable LOCAL_TRACK_DECORRELATION
   enable LOCAL_TRACK_INITIATED
   enable LOCAL_TRACK_UPDATED
   enable LOCAL_TRACK_DROPPED
   #enable MESSAGE_DISCARDED
   #enable MESSAGE_UPDATED
   #enable MESSAGE_QUEUED
   #enable MESSAGE_RECEIVED
   #enable MESSAGE_TRANSMITTED
   enable OPERATING_LEVEL_CHANGED
   #enable PLATFORM_ADDED
   #enable PLATFORM_DELETED
   enable PLATFORM_BROKEN
   #enable PROCESSOR_TURNED_OFF
   #enable PROCESSOR_TURNED_ON
   #enable SENSOR_DETECTION_ATTEMPT
   enable SENSOR_MODE_ACTIVATED
   enable SENSOR_MODE_DEACTIVATED
   enable SENSOR_REQUEST_CANCELED
   enable SENSOR_REQUEST_INITIATED
   enable SENSOR_REQUEST_UPDATED
   enable SENSOR_TRACK_INITIATED
   enable SENSOR_TRACK_UPDATED
   enable SENSOR_TRACK_DROPPED
   enable SENSOR_TURNED_ON
   enable SENSOR_TURNED_OFF
   enable TASK_ASSIGNED
   enable TASK_CANCELED
   enable TASK_COMPLETED
   enable WEAPON_FIRE_ABORTED
   enable WEAPON_FIRE_REQUESTED
   enable WEAPON_FIRED
   enable WEAPON_HIT
   enable WEAPON_MISSED
   enable WEAPON_RELOAD_STARTED
   enable WEAPON_RELOAD_ENDED
   enable WEAPON_TERMINATED
   #enable WEAPON_TURNED_OFF
   #enable WEAPON_TURNED_ON
   file output/$(CASE)_evt.txt 
end_event_output

event_output file output/$(CASE).evt end_event_output
event_pipe file output/$(CASE).aer end_event_pipe

end_time 6 hours
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
include_once platform/BLUE_PROP_AWACS_1.txt
include_once platform/BLUE_MULTIROLE_FIGHTER_2.txt
include_once platform/BLUE_MULTIROLE_FIGHTER_2_ERC.txt
include_once platform/BLUE_MULTIROLE_FIGHTER_2_MRC.txt
include_once platform/CVN.txt
include_once platform/BOMBER.txt
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

# File generated by Wizard 2.7.0 on Sep 3, 2020.
event_pipe 
   file output/$(CASE).aer 
end_event_pipe
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
# New file created by Wizard


#  This script is defined here, instead of in the processor, because it is
#  "called" by the aircraft, as part of the route.

   script void OnStation()
#  This script sets the ON_STATION_TIME variables
#  The two variables are checked each time because this script might be called
#  each time the aircraft goes around the orbit. The check prevents the
#  variables from being reset every time.

#   If this is the first time that the aircraft has hit this CAP station,
#   then set the flag for "on CAP".
      if ( PLATFORM.AuxDataDouble("NOW_ON_CAP") < 0.0 )
      {
         PLATFORM.SetAuxData("NOW_ON_CAP", TIME_NOW);
      }

#   If the aircraft is just arriving at this CAP station, then set the flag.
      if ( PLATFORM.AuxDataDouble("ON_STATION_TIME") < 0.0 )
      {
         PLATFORM.SetAuxData("ON_STATION_TIME", TIME_NOW);
      }
   end_script # OnStation
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
   script_struct launchParameters
      script_variables
         int num;
         string type;
         string prefix;
      end_script_variables
   end_script_struct
```

### ===== FILE: global_route.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
# New file created by Wizard


route aew-1
   position 00:00n 30:00w altitude 0.0 ft  speed 300 kts
   position 00:00n 29:55w altitude 0.0 ft  speed 300 kts
   position 00:42:52.79n 28:02:52.56w altitude 30000.00 ft

   label on_station
   position 01:25:42.60n 26:05:42.94w altitude 30000.00 ft
      speed 250 knots
      execute OnStation
   position 01:36:25.60n 25:18:25.32w altitude 30000.00 ft
   position 01:18:43.69n 26:12:26.79w altitude 30000.00 ft
      goto on_station

   label go_home
   position 00:42:52.79n 28:02:52.56w altitude 30000.00 ft
   position 00:00n 30:00w altitude 0.0 ft
      execute atEndOfRoute
end_route

route aew-2
   position 00:00n 30:00w altitude 0.0 ft  speed 300 kts
   position 00:00n 29:55w altitude 0.0 ft  speed 300 kts
      pause_time 15 minutes
   position 00:32:17.33s 27:59:30.97w altitude 30000.00 ft

   label on_station
   position 01:04:32.28s 25:59:00.66w altitude 30000.00 ft
      speed 250 knots
      execute OnStation
   position 01:14:33.08s 25:09:14.69w altitude 30000.00 ft
   position 00:57:18.05s 26:02:16.85w altitude 30000.00 ft
      goto on_station

   label go_home
   position 00:32:17.33s 27:59:30.97w altitude 30000.00 ft
   position 00:00n 30:00w altitude 0.0 ft
      execute atEndOfRoute
end_route




route erc-1
   position 00:00n 30:00w             altitude 0.0 ft
      speed 480 knots

   label outbound_marshalling_point
   position 00:00n 29:55w altitude 0.0 ft  altitude 30000.00 ft
      pause_time 10 minutes

   position 00:37:55.53n 27:48:46.39w altitude 30000.00 ft
      pause_time 10 minutes
   position 05:52:31.28n 24:06:59.75w altitude 30000.00 ft
      execute atEndOfRoute

   label inbound_marshalling_point
   position 00:00n 29:55w  altitude 30000.00 ft
   position 00:00n 30:00w  altitude 0.0 ft
      execute deleteSelf
end_route

route erc-2
   position 00:00n 30:00w             altitude 0.0 ft
      speed 480 knots

   label outbound_marshalling_point
   position 00:00n 29:55w altitude 0.0 ft  altitude 30000.00 ft
      pause_time 15 minutes

   position 00:37:55.53n 27:48:46.39w altitude 30000.00 ft
      pause_time 10 minutes
   position 02:32:30.82n 22:07:45.79w altitude 30000.00 ft
      execute atEndOfRoute

   label inbound_marshalling_point
   position 00:00n 29:55w  altitude 30000.00 ft
   position 00:00n 30:00w  altitude 0.0 ft
      execute deleteSelf
end_route

route erc-3
   position 00:00n 30:00w             altitude 0.0 ft
      speed 480 knots

   label outbound_marshalling_point
   position 00:00n 29:55w altitude 0.0 ft  altitude 30000.00 ft
      pause_time 10 minutes

   position 00:26:01.38s 27:45:33.25w  altitude 30000.00 ft
      pause_time 10 minutes
   position 01:56:23.33s 21:50:24.33w altitude 30000.00 ft
      execute atEndOfRoute

   label inbound_marshalling_point
   position 00:00n 29:55w  altitude 30000.00 ft
   position 00:00n 30:00w  altitude 0.0 ft
      execute deleteSelf
end_route

route erc-4
   position 00:00n 30:00w             altitude 0.0 ft
      speed 480 knots

   label outbound_marshalling_point
   position 00:00n 29:55w altitude 0.0 ft  altitude 30000.00 ft
      pause_time 15 minutes

   position 00:26:01.38s 27:45:33.25w  altitude 30000.00 ft
      pause_time 10 minutes
   position 05:52:07.38s 24:00:45.41w altitude 30000.00 ft
      execute atEndOfRoute

   label inbound_marshalling_point
   position 00:00n 29:55w  altitude 30000.00 ft
   position 00:00n 30:00w  altitude 0.0 ft
      execute deleteSelf
end_route





route mrc-1
   position 00:00n 30:00w altitude 0.0 ft  speed 420 kts

   label outbound_marshalling_point
   position 00:00n 29:55w altitude 0.0 ft  altitude 30000.00 ft

   position 00:22:09.89n 28:47:36.99w altitude 30000.00 ft
   label cap_refuel
   position 00:37:55.53n 27:48:46.39w
      pause_time 10 min

   label on_station
   position 01:04:37.57n 27:34:15.48w altitude 30000.00 ft
      radial_acceleration 1.000 g
      execute OnStation
   position 01:19:15.97n 26:57:47.87w altitude 30000.00 ft
      radial_acceleration 1.000 g
   position 00:58:11.45n 27:36:41.86w altitude 30000.00 ft
      radial_acceleration 1.000 g
      goto on_station

   label go_home
   position 00:22:09.89n 28:47:36.99w altitude 30000.00 ft

   label inbound_marshalling_point
   position 00:00n 29:55w  altitude 30000.00 ft
   position 00:00n 30:00w  altitude 0.0 ft
      execute atEndOfRoute
end_route

route mrc-2
   position 00:00n 30:00w altitude 0.0 ft  speed 420 kts

   label outbound_marshalling_point
   position 00:00n 29:55w altitude 0.0 ft  altitude 30000.00 ft
      pause_time 5 min

   position 00:22:09.89n 28:47:36.99w altitude 30000.00 ft
   label cap_refuel
   position 00:37:55.53n 27:48:46.39w
      pause_time 10 min

   label on_station
   position 00:48:17.18n 27:29:40.76w altitude 30000.00 ft
      radial_acceleration 1.000 g
      execute OnStation
   position 01:02:55.58n 26:53:12.94w altitude 30000.00 ft
      radial_acceleration 1.000 g
   position 00:42:00.19n 27:30:00.73w altitude 30000.00 ft
      radial_acceleration 1.000 g

      goto on_station
   label go_home
   position 00:22:09.89n 28:47:36.99w altitude 30000.00 ft

   label inbound_marshalling_point
   position 00:00n 29:55w  altitude 30000.00 ft
   position 00:00n 30:00w  altitude 0.0 ft
      execute atEndOfRoute
end_route

route mrc-3
   position 00:00n 30:00w altitude 0.0 ft  speed 420 kts

   label outbound_marshalling_point
   position 00:00n 29:55w altitude 0.0 ft  altitude 30000.00 ft
      pause_time 5 min

   position 00:22:09.89n 28:47:36.99w altitude 30000.00 ft
   label cap_refuel
   position 00:37:55.53n 27:48:46.39w
      pause_time 10 min

   label on_station
   position 00:11:51.41n 27:08:40.72w altitude 30000.00 ft
      radial_acceleration 1.000 g
      execute OnStation
   position 00:12:06.19n 26:50:18.32w altitude 30000.00 ft
      radial_acceleration 1.000 g
   position 00:06:58.64n 27:13:01.04w altitude 30000.00 ft
      radial_acceleration 1.000 g

      goto on_station
   label go_home
   position 00:22:09.89n 28:47:36.99w altitude 30000.00 ft

   label inbound_marshalling_point
   position 00:00n 29:55w  altitude 30000.00 ft
   position 00:00n 30:00w  altitude 0.0 ft
      execute atEndOfRoute
end_route

route mrc-4
   position 00:00:00.00n 30:00:00.00w altitude 0.00 ft  speed 420 kts

   label outbound_marshalling_point
   position 00:00n 29:55w altitude 0.0 ft  altitude 30000.00 ft

   position 00:14:06.48s 28:49:42.93w altitude 30000.00 ft
   label cap_refuel
   position 00:26:01.38s 27:45:33.25w
      pause_time 10 min

   label on_station
   position 00:11:36.79s 27:10:33.83w altitude 30000.00 ft
      radial_acceleration 1.000 g
      execute OnStation
   position 00:09:41.14s 26:46:42.55w altitude 30000.00 ft
      radial_acceleration 1.000 g
   position 00:07:02.81s 27:16:23.20w altitude 30000.00 ft
      radial_acceleration 1.000 g

      goto on_station
   label go_home
   position 00:26:01.38s 27:45:33.25w

   label inbound_marshalling_point
   position 00:00n 29:55w  altitude 30000.00 ft
   position 00:00n 30:00w  altitude 0.0 ft
      execute atEndOfRoute
end_route

route mrc-5
   position 00:00:00.00n 30:00:00.00w altitude 0.00 ft  speed 420 kts

   label outbound_marshalling_point
   position 00:00n 29:55w altitude 0.0 ft  altitude 30000.00 ft

   position 00:14:06.48s 28:49:42.93w altitude 30000.00 ft
   label cap_refuel
   position 00:26:01.38s 27:45:33.25w
      pause_time 10 min

   label on_station
   position 00:57:36.27s 27:20:05.69w altitude 30000.00 ft
      radial_acceleration 1.000 g
      execute OnStation
   position 01:12:33.75s 26:53:55.15w altitude 30000.00 ft
      radial_acceleration 1.000 g
   position 00:59:57.99s 27:27:18.62w altitude 30000.00 ft
      radial_acceleration 1.000 g

      goto on_station
   label go_home
   position 00:26:01.38s 27:45:33.25w

   label inbound_marshalling_point
   position 00:00n 29:55w  altitude 30000.00 ft
   position 00:00n 30:00w  altitude 0.0 ft
      execute atEndOfRoute
end_route

route mrc-6
   position 00:00n 30:00w altitude 0.0 ft  speed 420 kts

   label outbound_marshalling_point
   position 00:00n 29:55w altitude 0.0 ft  altitude 30000.00 ft
      pause_time 5 min

   position 00:14:06.48s 28:49:42.93w altitude 30000.00 ft
   label cap_refuel
   position 00:26:01.38s 27:45:33.25w
      pause_time 10 min

   label on_station
   position 00:40:50.48s 27:13:25.31w altitude 30000.00 ft
      radial_acceleration 1.000 g
      execute OnStation
   position 00:55:47.98s 26:47:14.94w altitude 30000.00 ft
      radial_acceleration 1.000 g
   position 00:43:13.33s 27:19:40.31w altitude 30000.00 ft
      radial_acceleration 1.000 g

      goto on_station
   label go_home
   position 00:26:01.38s 27:45:33.25w

   label inbound_marshalling_point
   position 00:00n 29:55w  altitude 30000.00 ft
   position 00:00n 30:00w  altitude 0.0 ft
      execute atEndOfRoute
end_route

```

### ===== FILE: config/run.json =====

```text
{"baseConfig":{"highPrecisionCounter":0,"multithreading":0,"pausetoadvancetime":1,"propulsionMethod":2,"recordAer":1,"recordEvent":0,"recordLog":1,"scenariosTime":{"continueTime":20,"startDate":"2026-10-16","startTime":"00:00:00"},"startMode":2,"stepValue":0.1,"terminalLog":1,"timeRate":1.0,"timeType":1},"scenariosId":0}
```

### ===== FILE: output/blank_empty.txt =====

```text
```

### ===== FILE: mover/GUESSED_AERO.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
aero GUESSED_AERO WSF_AERO
   // This is actually for an blue_sr_a2a_ir_missile, but we will assume similarity
  #mach_and_cd    0.0 1.35 # ref AIAA 79-0091
  #mach_and_cd    0.8 1.35 # ref AIAA 79-0091
  #mach_and_cd    1.0 1.85 # ref AIAA 79-0091
  #mach_and_cd    1.2 2.0  # ref AIAA 79-0091
  #mach_and_cd    1.5 1.8  # ref AIAA 79-0091
  #mach_and_cd    2.0 1.65 # ref AIAA 79-0091
  #mach_and_cd    3.0 1.2  # ref AIAA 79-0091
  #mach_and_cd    4.0 1.0  # ref AIAA 79-0091

   mach_and_cd    0.0 1.25 # ref AIAA 79-0091
   mach_and_cd    0.8 1.25 # ref AIAA 79-0091
   mach_and_cd    1.0 1.65 # ref AIAA 79-0091
   mach_and_cd    1.2 1.75 # ref AIAA 79-0091
   mach_and_cd    1.5 1.6  # ref AIAA 79-0091
   mach_and_cd    2.0 1.45 # ref AIAA 79-0091
   mach_and_cd    3.0 1.1  # ref AIAA 79-0091
   mach_and_cd    4.0 1.0  # ref AIAA 79-0091

   reference_area  0.02488 m2  # 17.8 cm dia (Wikipedia)
  #cl_max         10.0         # Unknown
  #aspect_ratio   17.7         # Unknown
   cl_max         15.0         # Unknown
   aspect_ratio   25.0         # Unknown
end_aero

```

### ===== FILE: mover/BLUE_SR_A2A_IR_MISSILE_AERO.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
aero BLUE_SR_A2A_IR_MISSILE_AERO WSF_AERO

   mach_and_cd    0.0 1.35 # ref AIAA 79-0091
   mach_and_cd    0.8 1.35 # ref AIAA 79-0091
   mach_and_cd    1.0 1.85 # ref AIAA 79-0091
   mach_and_cd    1.2 2.0  # ref AIAA 79-0091
   mach_and_cd    1.5 1.8  # ref AIAA 79-0091
   mach_and_cd    2.0 1.65 # ref AIAA 79-0091
   mach_and_cd    3.0 1.2  # ref AIAA 79-0091
   mach_and_cd    4.0 1.0  # ref AIAA 79-0091

   reference_area 0.13635 ft2 # 5.0 in body dia

   cl_max 10.0 # Experimentally set, to cause approx 30G max turn rate

   # Note:  Pi * AR * e = 50 => AR = 50 / Pi / e = 17.7 # ref Steve Knapp
   aspect_ratio   17.7
   oswalds_factor  0.9 # Approximate Guess

end_aero

```

### ===== FILE: comm/BLUE_COMM.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
# New file created by Wizard

   comm cmdr_net WSF_COMM_TRANSCEIVER
      network_name <local:slave>
      internal_link data_mgr
      internal_link task_mgr
   end_comm

   comm sub_net WSF_COMM_TRANSCEIVER
      network_name <local:master>
      internal_link data_mgr
      internal_link task_mgr
   end_comm

```

### ===== FILE: sensor/BLUE_A2A_RADAR.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
###############################################################################
#
#  File:  blue_a2a_radar.txt
#
#  Define BLUE_A2A_RADAR_RADAR based on APG-73.
#
#  WARNING: The tranmitter power, 2.3 MW, seems very high.
#        Could not find any public document that specified the
#        transmitter power of the APG-73 or its precursor, APG-65.
#
#                    ***** NOTICE *****
#
#  This definition is not intended to be representive of the real system.
#  Some undefined characteristics of the system have been provided so the
#  achieved performance matches the values defined in the noted references.
#
#  Reference:  unknown
#
#  June 08:  added to file repository
#
#                      UNCLASSIFIED
###############################################################################
#
#  Includes:
#    antenna_pattern : receive/transmit pattern
#    sensor :
#      slew_mode
#      mode_template: basic  sensor  specification
#        transmitter : uses predefined  antenna pattern , power, & frequency
#        receiver : not specified
#        range_product (equivalent on_m2_detect_range is provided)
#        report info
#      mode details for 120X10, 40X20, 20X15_BALL, & 20X15
#        these use the  data  in the mode template and provide a place to
#        edit various parameters such as:
#          range_product, azimuth_field_of_view & elevation_field_of_view
#      alpha/beta  filter
#
#    Minimum Additional  data  needed in user's file
#      Specify the location and orientation of the  sensor  on the  platform .
#        (e.g., location    0.0 0.0 -30 m)
#      Specify pitch of plane for antenna rotation (default = 0)
#        (e.g., pitch      0 deg)
#
###############################################################################
#
#  SNIPPET: example of how this sensor could be included in a simulation
#
#---*---*---
#  Define a platform that contains the sensor
#  BLUE_MULTIROLE_FIGHTER_2_BASELINE contains mover, signatures, dimensions, etc.
#---*---*---
// include_once blue_a2a_radar.txt
//
// ... simulation setup & initialization commands
//
// platform sensor_platform BLUE_MULTIROLE_FIGHTER_1_BASELINE
//   heading 180.0 deg
//   side red
//   start_time 0.0000000000 sec
//   // subsonic cruise at far less than max ceiling
//   route
//     position 06:56:24n 117:11:16e altitude 6000 m msl
//       speed 600 knots
//     position 08:21:12n 117:11:16e altitude 6000 m msl
//       speed 600 knots
//   end_route
//
//   add sensor gen_radar BLUE_A2A_RADAR
//     on
//     debug
//   end_sensor
// end_platform
#---*---*---
# Define a target
#---*---*---
// platform_type UAV_TYPE WSF_PLATFORM
//   icon predator    # or: Global_Hawk, predator, ucav, UCAV_Navy
//   side blue
//   category catUAV
//
//   radar_signature   ONE_M_SQUARED_RADAR_SIGNATURE
//   optical_signature ONE_M_SQUARED_OPTICAL_SIGNATURE
//
//   mover WSF_AIR_MOVER
//     roll_rate_limit          1 rad/sec
//     default_linear_acceleration  1.0 g
//     default_radial_acceleration  6.5 g
//     default_climb_rate        17.3 fps
//     maximum_speed            130.0 knots
//     maximum_altitude          15000 ft
//     minimum_altitude          50 ft
//     maximum_linear_acceleration  8 g
//   end_mover
//
// end_platform_type
#
###############################################################################

#-- Basic Antenna pattern
antenna_pattern BLUE_A2A_RADAR_ANTENNA_PATTERN
  inline_table db
    #-- The 1st is the number of azimuths and the 2nd is the number of elevations
    4  2
              -1.0  1.0
         -5.0    5.0  5.0
         -1.5   35.0  35.0
          1.5   35.0  35.0
          5.0    5.0  5.0
  end_inline_table
end_antenna_pattern

#-- BLUE_MULTIROLE_FIGHTER_1  Sensor  specification
sensor BLUE_A2A_RADAR WSF_RADAR_SENSOR

  #-- Platform Part Commands
  off                                   # default
  no_debug                              # default

  #-- Articulated Part Commands
  #   Slew mode and limits, yaw, pitch, & roll info goes here
  slew_mode                 azimuth

  #-- Sensor Level Commands
#  show_calibration_data                 # display radar characteristics

  #-- Detection Scheduling Commands
  # none at this time

  mode_template

    #-- Beam Commands
    transmitter
      frequency             9.6 ghz
      power                 2.0 MW
      antenna_pattern       BLUE_A2A_RADAR_ANTENNA_PATTERN
    end_transmitter

    receiver
    end_receiver

    range_product           201.8 dBsm    # ~59.9 nm
    // one_m2_detect_range     59.9 nm

    #-- Detection Scheduling Commands
    //frame_time              0.1 sec
    frame_time              0.5 sec

    #-- Track Formation Commands
    reports_location
    reports_velocity
  end_mode_template

  mode 120X10
    azimuth_field_of_view     -60.0 deg  60.0 deg
    elevation_field_of_view   -5.0 deg   5.0 deg
    range_product             194.4 dBsm            # ~39.1 nm
    // one_m2_detect_range    39.1 nm
    transmitter
      power                   2.3 MW
    end_transmitter
  end_mode

  mode 40X20
    azimuth_field_of_view   -20.0 deg  20.0 deg
    elevation_field_of_view -10.0 deg  10.0 deg
    range_product           198.7 dBsm              # ~50.1 nm
    //one_m2_detect_range     50.1 nm
  end_mode

  mode 20X15_BALL
    azimuth_field_of_view   -10.0 deg  10.0 deg
    elevation_field_of_view -7.5 deg   7.5 deg
  end_mode

  mode 20X15
    azimuth_field_of_view   -10.0 deg  10.0 deg
    elevation_field_of_view -7.5 deg   7.5 deg
  end_mode

  ignore_same_side

  #-- Track Filter Commands
  filter  WSF_ALPHA_BETA_FILTER
    alpha   0.4
    beta    0.1
  end_filter

end_sensor

```

### ===== FILE: sensor/GENERIC_ESM_SENSOR.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
###############################################################################
#
#  File: generic_esm_sensor.txt
#
#  Specify a GENERIC_ESM_SENSOR (Electronic Support Measure)
#  ESM is a Passive Detection System (i.e., recieve only)
#
#                           ***** NOTICE *****
#
#  This definition is not intended to be representative of the real system.
#  Some undefined characteristics of the system have been provided so the
#  achieved performance matches the values defined in the noted references.
#
#  Reference: none
#
#  June 08:  added to file repository
#
#                               UNCLASSIFIED
###############################################################################
#
#  SNIPPET: example of how this sensor could be included in a simulation
#
// include_once generic_esm_sensor.txt
//
// ... simulation setup & initialization commands
//
//	platform_type UAV_PLATFORM WSF_PLATFORM
//	  icon predator
//	  mover WSF_AIR_MOVER
//	  ... mover commands
//	  end_mover
//	end_platform_type
//
//	platform sensor_test UAV_PLATFORM
//	  side blue
//	  route
//	  position 35:00n 118:15w altitude 20000 ft heading 90 deg speed 1200 kts
//	  extrapolate
//	  end_route
//
//	  add sensor esm_sensor GENERIC_ESM_SENSOR
//	  on    // initialize sensor as 'on'
//	  debug    // print debug info about sensor operation
//	  end_sensor
//	end_platform
#
#############################################################################

sensor GENERIC_ESM_SENSOR WSF_ESM_SENSOR

  #-- Platform Part Commands
  off                                   // default
  no_debug                              // default

  #-- Articulated Part Commands
  #   Slew mode and limits, yaw, pitch, & roll info goes here
  #   slew_mode: [fixed|azimuth|elevation|both|azimuth_and_elevation]
  #   slew limits define ability of subsystem to respond to cue
  #   if not cued, then oriented in direction spec'd by yaw, pitch, & roll
  azimuth_slew_limits     -90.0 deg 90.0 deg
  elevation_slew_limits   -60.0 deg 60.0 deg

  #-- Sensor Level Commands
  // none

  #-- Detection Scheduling Commands
  // none

  mode_template
    #-- Detection Scheduling Commands
    frame_time   2.0 s

	  #-- Track Formation Commands
    reports_range
    reports_bearing
    reports_location
    reports_velocity
    reports_elevation
    reports_signal_to_noise
    reports_frequency
    reports_side
  end_mode_template

  mode Default
    #-- Detection Scheduling Commands
    frame_time    0.5 sec

    #-- Antenna Commands
    azimuth_field_of_view     -60 deg 60 deg
    elevation_field_of_view   -60 deg 60 deg

    #-- ESM Sensor Mode Commands

    # Band of frequencies this sensor can detect
    frequency_band   2.0 ghz  4.0 ghz
    frequency_band   8.0 ghz  12.0 ghz

    # Adds range information to any track generated by this sensor after
    #  the specified time has elapsed (simulates triangulation)
    ranging_time    30.0 sec

    # Detection_threshold is the signal/noise required for detection.
  	detection_threshold  3.0 db

    receiver
      # detection_threshold command should not be used for WSF_ESM_SENSOR
      #   noise_power is the explicit noise power.
      # This is one mechanism for specifying the receiver noise.
      noise_power   -40 dbm
    end_receiver

  end_mode

  ignore_same_side

  #-- Filter Commands
  filter WSF_ALPHA_BETA_FILTER
  alpha 0.4
  beta  0.1
  end_filter

end_sensor
```

### ===== FILE: sensor/GEO_AA_RADAR.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
# New file created by Wizard

// --- * --- * ---
//     Sensors
// --- * --- * ---
// N/A
sensor GEO_AA_RADAR WSF_GEOMETRIC_SENSOR
   azimuth_field_of_view -60.0 degrees 60.0 degrees
   elevation_field_of_view -10.0 degrees 10.0 degrees
   minimum_range 0 m
   # 300 nm
   maximum_range 125.0 nm

   frame_time              0.5 sec
   reports_location
   reports_velocity
   reports_iff
   reports_bearing

   track_quality 1.0
   ignore_same_side
end_sensor
```

### ===== FILE: processor/STATION_TIMER.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
#
# This file defines the STATION_TIMER script. It is used in the aircraft_type
# TIMED_STATION_AC, which follows a specific mission profile.
#
#
# The aircraft goes to a station and flies a defined orbit. The aircraft will
# leave the orbit for two reasons.
#
# First, it will temporarily leave the orbit to refuel. After refueling, it
# returns to the same orbit.
#
# Second, it will permanently leave the orbit and return to home at the end of
# its mission time.
#
#
# The following four parameters are defined when the aircraft is instantiated:
#
# time_before_refueling  - the time after the aircraft arrives at the station
#                          that it departs to refuel. (units - seconds)
#                          Default value = 1000 seconds
# total_station_time     - the time after first arriving on station that the
#                          aircraft leaves to return home (units - seconds)
#                          Default value = 3000 seconds
# refuel_waypoint_label  - the waypoint label at the refueling point
#                          Default value = "cap_refuel"
# go_home_waypoint_label - the waypoint label at the start of the return path
#                          towards home
#                          Default value = "go_home"
#
# The user can supply values for any or all of these during the aircraft
# definition. If no values are supplied, the default values are used.
#
#
# IMPORTANT!!!!!!!
#
# If the user specified waypoint label does not exist in the route, the
# aircraft will not correctly follow the route, and unexpected results
# may occur.
# This also applies if the default values are used, and those labels
# do not exist in the route.
#
#
# The route is assumed to have the following general structure:
#
# Initial waypoint
# Optional waypoints before the first point in the orbit
#
# First waypoint in the orbit, with label
# Optional intermediate waypoints in the orbit
# Final waypoint in the orbit, with "goto" to the first waypoint in the orbit
#
# Refueling waypoint, with label, and a "goto" back to the orbit
# (Additional points can be after the labeled refueling, but the last one
# needs to have a "goto" to return to the orbit.)
#
# Waypoint to define the return home path, with label
# Optional waypoints
#
#
#
# The OnStation script must be called on the first waypoint in the orbit. This
# starts the timers for the aircraft.
#
#
# This processor assumes that the aircraft only uses the default route.
#
#
# The following AuxData variables are used in this aircraft definition and the
# processor.
#
# TOTAL_STATION_TIME  = total time the aircraft can remain in the area before
#                       it must return home (seconds)
#
# NOW_ON_CAP          = time that the aircraft first entered the CAP station;
#                       used for the total time it will stay up
#                     = -1.0 when the aircraft has yet to hit the CAP station.
#
# MAX_TIME_ON_STATION = time the aircraft can remain on station before needing
#                       to refuel (seconds)
#
# ON_STATION_TIME     = time that the aircraft entered the CAP station this
#                       time; used to determine when to refuel
#                     = -1.0 when the aircraft is not at the CAP station
#


script_interface
#   debug
end_script_interface

# This processor manages the station timing
processor STATION_TIMER WSF_SCRIPT_PROCESSOR

# These are the default values for the user variables.
# Values assigned at instatiation overwrite these values.
   script_variables
      double time_before_refueling  = 1000.0;
      double total_station_time     = 3000.0;
      string refuel_waypoint_label  = "cap_refuel";
      string go_home_waypoint_label = "go_home";
   end_script_variables


   on_initialize
# This script assigns the AuxData variables from the user inputs, and
# initializes necessary variables/flags.
      PLATFORM.SetAuxData("MAX_TIME_ON_STATION", time_before_refueling);
      PLATFORM.SetAuxData("TOTAL_STATION_TIME",  total_station_time);
      PLATFORM.SetAuxData("ON_STATION_TIME",     -1.0);
      PLATFORM.SetAuxData("NOW_ON_CAP",          -1.0);
   end_on_initialize

   script void OffStation()
#  This script resets the AuxData variable ON_STATION_TIME to indicate that the
#  aircraft is no longer on the station

      PLATFORM.SetAuxData("ON_STATION_TIME", -1.0);

   end_script #OffStation


   script void GoRefuel()
#  This script sends the aircraft to the refueling point.
#  The label for the refueling point is defined by the user.
      OffStation();
      if (PLATFORM.Route().Name() == "")
      {
         PLATFORM.FollowRoute("DEFAULT_ROUTE", refuel_waypoint_label);
      }
      else
      {
         PLATFORM.FollowRoute(PLATFORM.Route().Name(), refuel_waypoint_label);
      }
   end_script # GoRefuel


   script void GoHome()
#  This script sends the aircraft home.
#  The label for the beginning of the path home is defined by the user.
      OffStation();
      PLATFORM.SetAuxData("NOW_ON_CAP", -1.0);
      if (PLATFORM.Route().Name() == "")
      {
         PLATFORM.FollowRoute("DEFAULT_ROUTE", go_home_waypoint_label);
      }
      else
      {
         PLATFORM.FollowRoute(PLATFORM.Route().Name(), go_home_waypoint_label);
      }
   end_script # GoHome


#   This causes the aircraft to check its status every 5 seconds.
   update_interval 5 sec
   on_update
#  This script confirms that the aircraft is on station, and then checks to
#  determine if its time has expired.

#    First, it checks to see if the on station orbit time has expired.

#    The first term confirms that the aircraft is on station.
#    The second term checks to see if the station time has expired.

      if ( ( PLATFORM.AuxDataDouble("ON_STATION_TIME") > 0.0 ) &&
           ( (TIME_NOW - PLATFORM.AuxDataDouble("ON_STATION_TIME") ) >=
              PLATFORM.AuxDataDouble("MAX_TIME_ON_STATION") ) )
      {
         GoRefuel();
      }

#    Next, it checks to see if the on total time has expired.

#    The first term confirms that the aircraft has been on station.
#    The second term checks to see if the total time has expired.
      if ( ( PLATFORM.AuxDataDouble("NOW_ON_CAP") > 0.0 ) &&
           ( (TIME_NOW - PLATFORM.AuxDataDouble("NOW_ON_CAP") ) >= PLATFORM.AuxDataDouble("TOTAL_STATION_TIME") ) )
      {
         GoHome();
      }

   end_on_update

end_processor # station_timer
```

### ===== FILE: processor/BLUE_MULTIROLE_FIGHTER_2_TASK_PROCESSOR.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
# New file created by Wizard

processor BLUE_MULTIROLE_FIGHTER_2_TASK_PROCESSOR WSF_TASK_PROCESSOR

   script_variables
      string aam          = "blue_lr_a2a_rf_missile";
      double flyout       = 60.0;

      string activeTarget = "Active target";     # used in aux data command
      string evalTime     = "Evaluation time";   # used in aux data command
      int currentRouteIndex = -1;
      Map<string, bool> deassigned = Map<string, bool>();
      string currentTarget;
   end_script_variables

#   show_task_messages

   on_message
      type WSF_STATUS_MESSAGE
         script
         end_script
      type WSF_TRACK_MESSAGE
         script
         end_script
      type WSF_TASK_ASSIGN_MESSAGE
         script
#            writeln("");
#            writeln(PLATFORM.Name(), " received a task assign message at time ", TIME_NOW);
#            WsfTaskAssignMessage TAmsg = (WsfTaskAssignMessage)MESSAGE;
#
#            writeln(" the assigner is      ", TAmsg.AssignerName());
#            writeln(" the task type is     ", TAmsg.TaskType());
#            writeln(" the resource name is ", TAmsg.ResourceName());
#
#            WsfTrack tempTrack = TAmsg.Track();
#            writeln(" the target is        ", tempTrack.TargetName());
#            writeln(" the track ID is      ", tempTrack.TrackId().ToString());

         end_script
      type WSF_TASK_CANCEL_MESSAGE
         script
            # Note: the track ID is from the commander, so I can't use it to find the track!
            # to add insult to injury, the task is now cancelled, so I don't have any received tasks!
            # my approach is to use a map to record what is deassigned, and to look for
            # that value in the state machine.
            # this assumes that I only have one current target at a time.
            deassigned[currentTarget] = true;
            currentTarget = "";
         end_script
      default
         script
#            writeln(PLATFORM.Name(), " received a ", MESSAGE.Type(), " from ", MESSAGE.Originator());
#            writeln("");
         end_script
   end_on_message

   script void announce(string sState)
#      writeln("");
      writeln(PLATFORM.Name(), " has entered state ", sState, " for "
            , TRACK.TargetName(), " at time ", TIME_NOW);
#      writeln(" the track ID is      ", TRACK.TrackId().ToString());
#      writeln(" the number of assigned tasks is ", TasksAssignedFor(TRACK.TrackId(), "ENGAGE"));
#      writeln(" the number of received tasks is ", TasksReceivedFor(TRACK.TrackId(), "ENGAGE"));
   end_script

   # this script needs to tell the commander that the task is finished.
   script void returnToRoute()
      TaskComplete(TRACK.TrackId(), "ENGAGE");
      string routeName = PLATFORM.AuxDataString("route");
      writeln(" ***** ", PLATFORM.Name(), " is resuming route ", routeName, " at point ", currentRouteIndex);
      PLATFORM.FollowRoute(routeName, currentRouteIndex);
      currentRouteIndex = -1;
      TRACK.SetAuxData(activeTarget, false);
   end_script

   on_track_drop
      writeln("");
      writeln("**************************");
      writeln(PLATFORM.Name(), " has dropped track on ", TRACK.TargetName());
      if ( TRACK.AuxDataBool(activeTarget) && !deassigned[TRACK.TargetName()])
      {
         writeln("This was the active target!");
         returnToRoute();
      }
      writeln("");
   end_on_track_drop

   evaluation_interval DETECTED 10 sec
   state DETECTED
      on_entry
#         announce("DETECTED");
         TRACK.SetAuxData(activeTarget, false);
      end_on_entry


      next_state INTERCEPT
#         writeln(PLATFORM.Name(), " has received ", TasksReceivedFor(TRACK.TrackId(), "ENGAGE"), " tasks for ", TRACK.TargetName());
         return (TasksReceivedFor(TRACK.TrackId(), "ENGAGE") > 0);
      end_next_state
   end_state

   evaluation_interval INTERCEPT 10 sec
   state INTERCEPT
      on_entry
         announce("INTERCEPT");
         TRACK.SetAuxData(activeTarget, true);
         currentTarget = TRACK.TargetName();
         if (currentRouteIndex < 0) currentRouteIndex = PLATFORM.RoutePointIndex();
         deassigned[TRACK.TargetName()] = false;
      end_on_entry

      next_state ENGAGE
         WsfWaypoint intercept = WsfWaypoint();
         double interceptTime = PLATFORM.InterceptLocation3D(TRACK, intercept);
         if (interceptTime > 0.0)
         {
#            writeln(PLATFORM.Name(), " is headed to ", intercept.Location().ToString());
            PLATFORM.GoToSpeed(540.0*MATH.MPS_PER_NMPH());
            PLATFORM.GoToPoint(intercept.Location());
         }
         return (PLATFORM.SlantRangeTo(TRACK) < 50.0 * MATH.M_PER_NM());
      end_next_state

      next_state RETURN_TO_ROUTE
         WsfPlatform target = TRACK.Target();
         if (target.IsValid()) return false;
         if (deassigned[target.Name()]) return true;
         return true;
      end_next_state
   end_state

   evaluation_interval ENGAGE 10 sec
   state ENGAGE
      on_entry announce("ENGAGE"); end_on_entry
      next_state WAIT
         bool fired = false;
         WsfWeapon aim120 = PLATFORM.Weapon(aam);
         if (aim120.IsValid())
         {
            fired = Fire(TRACK, "ENGAGE", aim120, 2);
         }
         return fired;
      end_next_state
   end_state

   evaluation_interval WAIT 1.0 sec
   state WAIT
      on_entry
         announce("WAIT");
         TRACK.SetAuxData(evalTime, TIME_NOW+flyout);
      end_on_entry

      next_state RETURN_TO_ROUTE
         WsfPlatform target = TRACK.Target();
         if (target.IsValid()) return false;
         return true;
      end_next_state
   end_state

   evaluation_interval RETURN_TO_ROUTE 24 hours
   state RETURN_TO_ROUTE
      on_entry
         announce ("RETURN_TO_ROUTE");
         if (currentTarget != "") deassigned[currentTarget] = true;
         returnToRoute();
      end_on_entry
   end_state

end_processor
```

### ===== FILE: processor/CVN_TASK_PROCESSOR.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
# New file created by Wizard
include_once global_struct.txt

##############################################################################
#
# This processor has two parts:
#
# The on_update block launches aircraft, based on the specified launch cycle.
#
# The state machine vectors aircraft towards targets, using assignments.
#
##############################################################################

processor CVN_TASK_PROCESSOR WSF_TASK_PROCESSOR

   script_variables
      int numERC = 4;
      int numMRC = 6;
      int numAEW = 2;
      double separationERC = 30.0;
      double separationMRC = 45.0;
      double launchCycle   = 90.0; # minutes
      double nextERClaunch = -1.0;
      double nextMRClaunch = -1.0;
      double nextAEWlaunch = -1.0;

      struct ERC = struct.New("launchParameters");
         ERC->num    = numERC;
         ERC->type   = "BLUE_MULTIROLE_FIGHTER_2_ERC";
         ERC->prefix = "erc-";
      struct MRC = struct.New("launchParameters");
         MRC->num    = numMRC;
         MRC->type   = "BLUE_MULTIROLE_FIGHTER_2_MRC";
         MRC->prefix = "mrc-";
      struct AEW = struct.New("launchParameters");
         AEW->num    = numAEW;
         AEW->type   = "BLUE_PROP_AWACS_1";
         AEW->prefix = "aew-";

      int numberToAssign = 1;
   end_script_variables

   on_initialize
   end_on_initialize


   script void launch_ac_struct(struct tempParms)
      for (int i = 1; i <= tempParms->num; i = i + 1)
      {
         string commander = write_str("commander ", PLATFORM.Name());

         WsfPlatform p = WsfSimulation.CreatePlatform(tempParms->type);
         p.ProcessInput("side blue");
         p.ProcessInput("position 0n 30w heading 90 deg");
         p.ProcessInput(commander);
         WsfPlatform pa = WsfSimulation.AddPlatform(p, "");    // Use a generated name
         if (! pa.IsValid()) writeln("***** ERROR T=", TIME_NOW, " Could not add platform of type ", p.Type());

         string routeName = write_str(tempParms->prefix, i);
#         if (!pa.FollowRoute(routeName)) # if this route does not exist
#         {
#            writeln(" non-existing route. deleting ", pa.Name());
#            WsfSimulation.DeletePlatform(pa.Name());
#         } # check route exists

         if (pa.FollowRoute(routeName))
         {
            pa.SetAuxData("route", routeName); # remember route name
         }
         else   # if this route does not exist
         {
            writeln(" non-existing route. deleting ", pa.Name());
            WsfSimulation.DeletePlatform(pa.Name());
         } # check route exists



      } # for loop
   end_script

   script void announce(string sState)
#      writeln(PLATFORM.Name(), " has entered state ", sState, " for "
#            , TRACK.TargetName(), " at time ", TIME_NOW);
   end_script

   script bool availableSubordinates()
      bool available = false;
      WsfPlatformList subordinates = PLATFORM.Subordinates();
      foreach (WsfPlatform temp in subordinates)
      {
         if (temp.IsValid())
         {
            if ( temp.CategoryMemberOf("fighter") )
            {
               if (TasksAssignedTo(temp, TRACK.TrackId()) < 1)
               {
                  available = true;
                  break;
               } # no tasks assigned to this one
            } # interceptor
         } # is valid
      } # for each
      return available;
   end_script


   # this script assignes interceptors to the tracks. it is a very simple sript
   # in particular, it assigns the closest available interceptors
   # first, it looks at the ERC (extended range CAP) aircraft,
   # and picks the closest one. This could be one that is returning to the CV.
   # worse, it could be one that is really out of range.
   # then, it goes through the MRC (medium range CAP) aircraft and sends
   # enough to fill the request.
   # note: if it manages to send ANY aircraft, it will return true!
   script bool assignInterceptor(int numberToAssign)
      bool madeAssignment = false;
      WsfPlatformList subordinates = PLATFORM.Subordinates();
      int assignmentsMade = 0;

      # start with ERC fighters
      double rangeERC = MATH.DOUBLE_MAX();
      WsfPlatform tempERC;
      foreach (WsfPlatform temp in subordinates)
      {
         if (temp.IsValid() && temp.CategoryMemberOf("ERC"))
         {
            if (TasksAssignedTo(temp) < 1)
            {
               if (temp.GroundRangeTo(TRACK) < rangeERC)
               {
                  rangeERC = temp.GroundRangeTo(TRACK);
                  tempERC = temp;
               } # closer than previous selection
            } # no current tasks
         } # is valid and ERC
      } # for each loop

      # if an ERC was found, then assign it
      if (tempERC.IsValid())
      {
         AssignTask(TRACK, "ENGAGE", tempERC);
         madeAssignment = true;
         assignmentsMade = assignmentsMade + 1;
      }

      # then look at MRC fighters
      for (int i = 1; i <= numberToAssign - assignmentsMade; i = i + 1)
      {
#         writeln("");
#         writeln(" the current value of i is ", i, " and is limited to ", numberToAssign - assignmentsMade);
#         writeln(" there are ", subordinates.Count(), " subordinates");
         double rangeMRC = MATH.DOUBLE_MAX();
         WsfPlatform tempMRC;
         foreach (WsfPlatform temp in subordinates)
         {
#            if (temp.IsValid()) writeln(" looking at ", temp.Name());
            if (temp.IsValid() && temp.CategoryMemberOf("MRC"))
            {
               if (TasksAssignedTo(temp) < 1)
               {
                  if (temp.GroundRangeTo(TRACK) < rangeMRC)
                  {
                     rangeMRC = temp.GroundRangeTo(TRACK);
                     tempMRC = temp;
                  } # closer than previous selection
               } # no current tasks
            } # is valid and MRC
         } # for each loop

         # if an MRC was found, then assign it
         if (tempMRC.IsValid())
         {
            AssignTask(TRACK, "ENGAGE", tempMRC);
            madeAssignment = true;
            assignmentsMade = assignmentsMade + 1;
         }
      } # for loop

      return madeAssignment;
   end_script

   # this script cancels the assignments for the interceptors
   script void deassignInterceptor()
      writeln("   !!! canceling tasks  !!!! ", PLATFORM.Name(), " cancelling for ", TRACK.TargetName());
      int numTasks = TasksAssignedFor(TRACK.TrackId());
      if (numTasks > 0)
      {
         CancelTask(TRACK.TrackId());
      }
   end_script

   update_interval 60 seconds
   on_update
      if (nextAEWlaunch < TIME_NOW)
      {
         launch_ac_struct(AEW);
         nextAEWlaunch = TIME_NOW + (2.0*launchCycle)*60.0;
      } # time to create new AEW

      if (nextERClaunch < TIME_NOW)
      {
         launch_ac_struct(ERC);
         nextERClaunch = TIME_NOW + launchCycle*60.0;
      } # time to create new ERC

      if (nextMRClaunch < TIME_NOW)
      {
         launch_ac_struct(MRC);
         nextMRClaunch = TIME_NOW + (2.0*launchCycle)*60.0;
      } # time to create new MRC

   end_on_update

   on_message
      type WSF_TASK_STATUS_MESSAGE
         script
            writeln("*** ", PLATFORM.Name(), " has received a ", MESSAGE.Type(), " from ", MESSAGE.Originator());
            string status   = ((WsfTaskStatusMessage)MESSAGE).Status();
            string taskType = ((WsfTaskStatusMessage)MESSAGE).TaskType();
            writeln(" the status is ", status, " and the type is ", taskType);
         end_script
#      type WSF_TRACK_MESSAGE
#         script
#            writeln(" received a track message from ", MESSAGE.Originator(), " at time ", TIME_NOW);
#            string targetName = ((WsfTrackMessage)MESSAGE).Track().TargetName();
#            writeln(" the target name is ", targetName);
#         end_script
#      default
#         script
#            writeln(" received a message from ", MESSAGE.Originator(), " of type ", MESSAGE.Type(), " at time ", TIME_NOW);
#         end_script
   end_on_message

   evaluation_interval DETECTED 10 sec
   state DETECTED
      on_entry announce("DETECTED"); end_on_entry
      next_state VECTOR
         return availableSubordinates();
      end_next_state
   end_state

   evaluation_interval VECTOR 10 sec
   state VECTOR
      on_entry announce("VECTOR"); end_on_entry
      next_state ASSIGNED
         return assignInterceptor(numberToAssign);
      end_next_state
   end_state

   evaluation_interval ASSIGNED 10 sec
   state ASSIGNED
      on_entry announce("ASSIGNED"); end_on_entry

      next_state DEASSIGN
         bool deassign = false;
         WsfPlatform target = TRACK.Target();
         if (target.IsValid())
         {
            double headingAngle = TRACK.Target().RelativeBearingTo(PLATFORM);  # yes, this is a cheat!
            bool headedMyWay = MATH.AngleIsBetween(headingAngle, -90.0, 90.0);
            if (!headedMyWay)
            {
               deassignInterceptor();
               deassign = true;
            }
         }
         else
         {
            deassign = true;
         }
         return deassign;
      end_next_state
   end_state

   evaluation_interval DEASSIGN 10 sec
   state DEASSIGN

   end_state

end_processor
```

### ===== FILE: signatures/BLUE_A2A_RADAR_SIGNATURE.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
radar_signature blue_a2a_radar_signature
    constant 10 dbsm
end_radar_signature


```

### ===== FILE: signatures/BOMBER_RADAR_SIGNATURE.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************

radar_signature    bomber_radar_signature    constant 1000 m2   end_radar_signature
```

### ===== FILE: signatures/BOMBER_INFRARED_SIGNATURE.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************

infrared_signature bomber_infrared_signature constant 1000 w/sr end_infrared_signature
```

### ===== FILE: signatures/BOMBER_OPTICAL_SIGNATURE.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************

optical_signature  bomber_optical_signature  constant 1000 m2   end_optical_signature
```

### ===== FILE: signatures/TEST_RADAR_SIGNATURE.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
radar_signature    TEST_RADAR_SIGNATURE
   constant 1 m^2
end_radar_signature

```

### ===== FILE: signatures/TEST_INFRARED_SIGNATURE.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
infrared_signature TEST_INFRARED_SIGNATURE
   constant 1 watts/steradian
end_infrared_signature

```

### ===== FILE: signatures/TEST_OPTICAL_SIGNATURE.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
optical_signature  TEST_OPTICAL_SIGNATURE
   constant 1 m^2
end_optical_signature

```

### ===== FILE: weapon_effects/TEST_EFFECT.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
weapon_effects TEST_EFFECT WSF_GRADUATED_LETHALITY
   radius_and_pk  50.0 ft  1.0
end_weapon_effects

weapon_effects TEST_EFFECT WSF_GRADUATED_LETHALITY
   # A Pk of 1.0 is needed for weapon launch computer generation.
   radius_and_pk  100.0 m  1.0
end_weapon_effects

```

### ===== FILE: weapon_effects/BLUE_SR_A2A_IR_MISSILE_EFFECT.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
weapon_effects BLUE_SR_A2A_IR_MISSILE_EFFECT WSF_SPHERICAL_LETHALITY
  # Note:  Does not consider the hardness of any target.  All are treated the same.
  minimum_radius  50.0 ft # largest blast radius at which damage inflicted is maximum.
  maximum_damage   1.0    # maximum damage level achievable upon the target.
  maximum_radius  60.0 ft # blast radius beyond which the damage inflicted is Zero.
  minimum_damage   0.2    # damage level acheived at the maximum radius.
  threshold_damage 0.20   # initial damage level which must be acheived
                          # before effects begin to accumulate upon the target
  exponent         1.00   # exponent of proportionality of damage with radius.
end_weapon_effects

```

### ===== FILE: weapon/BLUE_LR_A2A_RF_MISSILE.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
include_once signatures/TEST_INFRARED_SIGNATURE.txt
include_once signatures/TEST_OPTICAL_SIGNATURE.txt
include_once signatures/TEST_RADAR_SIGNATURE.txt
include_once mover/GUESSED_AERO.txt
include_once weapon_effects/TEST_EFFECT.txt

# * * ************************************** * *
# *   ****** Demonstration input file ******   *
# *   ******      UNCLASSIFIED        ******   *
# * * ************************************** * *

platform_type BLUE_LR_A2A_RF_MISSILE WSF_PLATFORM

  weapon_effects TEST_EFFECT

  icon SA-10_Missile
  infrared_signature TEST_INFRARED_SIGNATURE
  optical_signature  TEST_OPTICAL_SIGNATURE
  radar_signature    TEST_RADAR_SIGNATURE

 #mover WSF_OLD_GUIDED_MOVER
  mover WSF_GUIDED_MOVER
   #thrust             2500.0 lbf
   #fuel_mass            55.0 kg
   #specific_impulse    250.0 sec
   #thrust_duration    12.12 sec

    total_mass          150.0  kg
    fuel_mass            80.0  kg
    thrust_duration      40.0  sec
    burn_rate             2.0  kg/s
    specific_impulse    907.18 sec
    thrust             4000.0  lbf
    update_interval       0.1  sec
    aero GUESSED_AERO
    #show_status # Turns on some mass properties diagnostic output
  end_mover

 #processor autopilot WSF_OLD_GUIDANCE_COMPUTER
  processor autopilot WSF_GUIDANCE_COMPUTER
    proportional_navigation_gain  30.0
    velocity_pursuit_gain         30.0
    g_bias                         1.2
    #continuous_g_bias
    maximum_commanded_g           40.0 g
    #omit_velocity_pursuit
    update_interval                0.1 s
  end_processor

  processor seeker WSF_PERFECT_TRACKER
    update_interval 0.10 s
  end_processor

  processor fuse WSF_AIR_TARGET_FUSE
    time_of_flight_to_arm  2.0 sec
    max_time_of_flight_to_detonate 140.0 sec
    detonate_on_mach_decreasing_to  1.0       # DRB Added 5/10/10
    detonate_below_height_AGL       0.0 ft #  -200.0 m
             # DRB:  Make sure does not detonate prematurely during generation.
             # PROBLEM:  For sea level test, cannot set negative!
  end_processor

end_platform_type

### A weapon can have the same name as its launched platform type
weapon BLUE_LR_A2A_RF_MISSILE WSF_EXPLICIT_WEAPON

   launched_platform_type BLUE_LR_A2A_RF_MISSILE

   weapon_effects TEST_EFFECT

   quantity               4

   firing_delay           0.5 sec
   salvo_interval         5.0 sec

   slew_mode              azimuth_and_elevation
   azimuth_slew_limits    -180.0 deg 180.0 deg
   elevation_slew_limits  10.0 deg  70.0 deg

end_weapon

```

### ===== FILE: weapon/BLUE_SR_A2A_IR_MISSILE.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
include_once mover/BLUE_SR_A2A_IR_MISSILE_AERO.txt
include_once weapon_effects/BLUE_SR_A2A_IR_MISSILE_EFFECT.txt

###############################################################################
#
#                          ------ UNCLASSIFIED ------
#                    Short-Range Infrared Air-To-Air Missile
#
# This file contains definitions for the 'mover', guidance computer, fuse and
# lethality and a base platform type.  It should be considered a rudimentary
# beginning point for further refinement.  The user is then responsible for:
#
# A) Creating a 'platform_type' that derives from BLUE_SR_A2A_IR_MISSILE_BASE which defines
#    the seeker and any other subsystems that may be required.
#
# B) Creating a 'platform_type' that represents the launcher.
#
# The last part of the file is commented out and demonstrates the above steps.
#
# All information below is representative only, and is estimated or obtained
# from open sources.
################################################################################

platform_type BLUE_SR_A2A_IR_MISSILE_BASE WSF_PLATFORM

  icon AIM-9X

  mover WSF_GUIDED_MOVER
    total_mass       188.0 lbm # init=188, bo=127
    fuel_mass         61.0 lbm
    # Isp values of 250 are typical of solid rocket motors of
    # today, but that value would not close, so was reduced.
    specific_impulse 222.0 sec
    thrust          2700.0 lbf
    thrust_duration    5.1 sec
    update_interval 0.10 s
    aero BLUE_SR_A2A_IR_MISSILE_AERO
    #show_status # Turns on some mass properties diagnostic output
  end_mover

  processor blue_sr_a2a_ir_missile_autopilot WSF_GUIDANCE_COMPUTER
    proportional_navigation_gain  30.0
    velocity_pursuit_gain         30.0
    g_bias                         1.0
    maximum_commanded_g           40.0 g
    update_interval                0.1 s
  end_processor

  processor blue_sr_a2a_ir_missile_seeker WSF_PERFECT_TRACKER
    update_interval 0.10 s
  end_processor

  processor blue_sr_a2a_ir_missile_fuse WSF_AIR_TARGET_FUSE
    max_time_of_flight_to_detonate  120.0 sec
  end_processor

end_platform_type

weapon BLUE_SR_A2A_IR_MISSILE WSF_EXPLICIT_WEAPON
   #debug
   launched_platform_type BLUE_SR_A2A_IR_MISSILE_BASE
   quantity 2
   launch_delta_v 10.0 0.0 0.0 m/s
   weapon_effects BLUE_SR_A2A_IR_MISSILE_EFFECT
end_weapon

# Following is an example launch computer for this weapon,
# valid only at the specified launch altitude and speed.
#include_once blue_sr_a2a_ir_missile_ata_launch_computer_alt10kft_0.6mach.txt   #not used right now

###############################################################################
#                         START OF EXAMPLE SECTION
###############################################################################

/* <----- START BLOCK COMMENT

platform_type BLUE_SR_A2A_IR_MISSILE BLUE_SR_A2A_IR_MISSILE_BASE
   comm uplink <comm-type>
      <comm-data>
   end_comm
   sensor seeker <sensor-type>
      <sensor-data>
   end_sensor
end_platform_type

platform_type BLUE_SR_A2A_IR_MISSILE_LAUNCHER WSF_PLATFORM
   #icon <unknown>
   weapon blue_sr_a2a_ir_missile BLUE_SR_A2A_IR_MISSILE
      launched_platform_type BLUE_SR_A2A_IR_MISSILE
   end_weapon
end_platform_type

-----> END BLOCK COMMENT */

```

### ===== FILE: weapon/BLUE_SR_A2A_IR_MISSILE_ATA_LAUNCH_COMPUTER_ALT10KFT_0P6MACH.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
# WARNING:  LAR Generator encountered a weapon hit at the shortest specified range.

launch_computer BLUE_SR_A2A_IR_MISSILE_ATA_LAUNCH_COMPUTER_10KFT_0.6MACH WSF_ATA_LAUNCH_COMPUTER

   # Use caution when hand-editing this file.  Some values are computer generated, and should not
   # be overridden.  Written by ATALaunchComputerGenerator on Fri Jul 06 11:03:14 2007
   # Valid for altitude = 3048 m, and speed = 197.035 m/s ( Mach = 0.6 ), and DeltaV = (10 0 0) m/s
   # Global launch constraints (below) will always be checked before a more expensive table lookup is done.

   minimum_slant_range 3472.5 m
   maximum_slant_range 17362.5 m
   maximum_boresight_angle 80.6647 deg
   maximum_opening_speed 228.6 m/s
   minimum_opening_speed -228.6 m/s

   intercept_results
      # The independent variable ranges below must be defined before the results table...
      # Aspect angle has to cover zero to 180 degrees approach angle,
      # and results are assumed symmetric about Left and Right,
      # so the only question is how many bins (what resolution).
      number_of_aspect_angle_bins 4
      # Azimuth results are assumed symmetric about the centerline, so should cover zero to
      # <limit value> target azimuth angle, user must specify how many bins (what resolution).
      azimuth_bin_count_and_limit 4 90 deg
      # Elevation results are not assumed symmetric about the horizon, so should cover
      # <negative limit> to <positive limit> target elevation angle, and how many bins (what resolution).
      elevation_bin_count_min_and_max_limits 4 -45 deg 45 deg
      range_rate_bin_count_min_and_max_limits 4 -304.8 m/s 304.8 m/s
      firing_range_bin_count_and_values 4
           0 m  6945 m  13890 m  20835 m  27780 m
      time_of_flight_values
         # Dependent Variable = Time Of Flight (sec.)  [0 => Miss] Hits/Misses = 146 / 344
         5.95 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5.85 21.45 0 0 0 0 0 0 0 0 0 0 0 0
         0 0 5.9 20.5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6.15 19.5 0 0 0 0 0 0 0 0 0 0
         0 0 0 0 6.1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5.9 20.45 0 0 0 0 0 0 0 0
         0 0 0 0 0 0 6 19.75 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6.4 19.4 0 0 0 0 0 0
         0 0 0 0 0 0 0 0 6.85 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6.25 18.35 0 0 0 0
         0 0 0 0 0 0 0 0 0 0 6.5 18.05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 19 0 0
         0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7.9 0 0 0 5.55 0 0 0 0 0 0 0 0 15.7
         0 0 7.8 24.1 0 0 0 10.4 0 0 0 0 0 0 0 15.85 0 0 8.15 23.9 0 0 0 10.45 19.15 0 0 0 0 0
         0 0 0 0 8.8 24.2 0 0 0 0 0 0 0 0 0 0 6.3 0 0 0 0 0 0 0 0 0 0 0 0 0
         0 0 6 22.9 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6.05 21.8 0 0 0 0 0 0 0 0 0 0
         0 0 0 0 6.5 22.7 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6.75 0 0 0 6.5 0 0 0 0 0
         0 0 0 0 0 0 6.3 23.9 0 0 6.5 0 0 0 0 0 0 0 0 0 0 0 6.4 23 0 0 6.55 0 0 0
         0 0 0 0 0 0 0 0 7.05 24.55 0 0 6.7 0 0 0 0 0 0 0 0 0 0 0 8.45 0 0 0 6.9 0
         0 0 6.55 0 0 0 0 0 0 0 7.4 26.7 0 0 6.55 24.8 0 0 6.15 0 0 0 0 0 0 0 7.65 26.05 0 0
         6.65 24.05 0 0 6.25 0 0 0 0 0 0 0 9.45 0 0 0 7.15 25.4 0 0 6.75 0 0 0 0 0 0 0 0 0
         0 0 8.7 0 0 0 6.9 0 0 0 7.15 0 0 0 14.85 0 0 0 8.45 29.75 0 0 6.85 24.9 0 0 6.6 0 0 0
         0 0 0 0 8.7 29.65 0 0 7 24.35 0 0 6.65 0 0 0 0 0 0 0 9.45 31 0 0 7.15 25.2 0 0 7.35 0
         0 0 0 0 0 0 7.15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7.35 0 0 0 0 0 0 0
         0 0 0 0 0 0 0 0 7.35 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7.25 0 0 0 0 0
         0 0 0 0 0 0 0 0 0 0 6.7 0 0 0 8.8 0 0 0 0 0 0 0 0 0 0 0 6.6 35.75 0 0
         8.55 0 0 0 0 0 0 0 0 0 0 0 6.65 32.25 0 0 8.55 0 0 0 0 0 0 0 0 0 0 0 6.85 28.65
         0 0 8.85 0 0 0 0 0 0 0 0 0 0 0 7.1 0 0 0 7.6 0 0 0 0 0 0 0 12.25 0 0 0
         6.95 29 0 0 7.5 0 0 0 0 0 0 0 12.5 0 0 0 7.05 28.05 0 0 7.55 0 0 0 11.4 0 0 0 0 0
         0 0 7.35 27.45 0 0 7.75 0 0 0 0 0 0 0 0 0 0 0 9.4 0 0 0 8.05 0 0 0 0 0 0 0
         0 0 0 0 8.95 36.7 0 0 8.05 0 0 0 0 0 0 0 0 0 0 0 9.25 36.7 0 0 8.2 0 0 0 0 0
         0 0 0 0 0 0 10.15 0 0 0 8.35 0 0 0 0 0 0 0 0 0 0 0 7.05 0 0 0 0 0 0 0
         0 0 0 0 0 0 0 0 7.15 0 0 0 11.4 0 0 0 0 0 0 0 0 0 0 0 7.2 0 0 0 11.1 0
         0 0 0 0 0 0 0 0 0 0 7.2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7 0 0 0
         0 0 0 0 0 0 0 0 0 0 0 0 7.1 0 0 0 10.15 0 0 0 0 0 0 0 0 0 0 0 7.15 0
         0 0 10.05 0 0 0 0 0 0 0 0 0 0 0 7.2 34.65 0 0 0 0 0 0 0 0 0 0 0 0 0 0
         7.25 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7.25 33.45 0 0 0 0 0 0 0 0 0 0 0 0
         0 0 7.35 32.35 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7.5 29.2 0 0 0 0 0 0 0 0 0 0
         0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
         0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
         0 0 0 0
      end_time_of_flight_values
   end_intercept_results
end_launch_computer
```

### ===== FILE: weapon/SIMPLE_A2A_MISSILE.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************

include_once weapon/BLUE_SR_A2A_IR_MISSILE.txt
include_once weapon/BLUE_SR_A2A_IR_MISSILE_ATA_LAUNCH_COMPUTER_ALT10KFT_0P6MACH.txt

platform_type SIMPLE_A2A_MISSILE BLUE_SR_A2A_IR_MISSILE_BASE
	// max speed about 850 m/s according to Wikipedia (mach 2.5)
   category ignored-by-iads-radar
end_platform_type


launch_computer SIMPLE_A2A_LAUNCH_COMPUTER BLUE_SR_A2A_IR_MISSILE_ATA_LAUNCH_COMPUTER_10KFT_0.6MACH
end_launch_computer


weapon SIMPLE_A2A_MISSILE_WEAPON BLUE_SR_A2A_IR_MISSILE
   launched_platform_type SIMPLE_A2A_MISSILE
   launch_computer        SIMPLE_A2A_LAUNCH_COMPUTER end_launch_computer
   quantity               4  // should be 2
end_weapon
```

### ===== FILE: platform/TIMED_AC.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
# New file created by Wizard

#include_once platforms/TIMED_STATION_AC.txt
include_once processor/STATION_TIMER.txt

platform_type TIMED_AC WSF_PLATFORM

#  this platform MUST have a mover so that the route/labels will work.
   mover WSF_AIR_MOVER end_mover

#  This script is defined here, instead of in the processor, because it is
#  "called" by the aircraft, as part of the route.
   include global_script.txt

   processor station_timer STATION_TIMER
      script_variables
         time_before_refueling = 1000.0;
         total_station_time    = 3000.0;
         refuel_waypoint_label = "cap_refuel";
         go_home_waypoint_label= "go_home";
      end_script_variables
   end_processor

end_platform_type
```

### ===== FILE: platform/BLUE_PROP_AWACS_1.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
# New file created by Wizard
include_once platform/TIMED_AC.txt

platform_type BLUE_PROP_AWACS_1 TIMED_AC
   icon awacs
   edit mover
      maximum_radial_acceleration 0.5 g
      at_end_of_path              remove
   end_mover

   # comm networks
   include comm/BLUE_COMM.txt


   // --- * --- * ---
   //     Sensors
   // --- * --- * ---
   // N/A
   sensor geo_sensor WSF_GEOMETRIC_SENSOR
      azimuth_field_of_view -180.0 degrees 180.0 degrees
      elevation_field_of_view -90.0 degrees 90.0 degrees
      minimum_range 0 m
      # 300 nm
      maximum_range 250.0 nm
      on
      frame_time              0.5 sec
      reports_location
      reports_velocity
      reports_iff
      reports_bearing
      #do not report weapons quality tracks
      track_quality 0.75
      ignore_same_side
      internal_link data_mgr
   end_sensor

   execute at_time 5 seconds relative
      WsfDraw sensorCircle = WsfDraw();
      sensorCircle.SetId(PLATFORM.Name());
      sensorCircle.SetColor(1,0,0);
      sensorCircle.SetEllipseMode("line");
      sensorCircle.BeginCircle(0.0, MATH.M_PER_NM()*250.0);
      sensorCircle.Vertex(PLATFORM);
      sensorCircle.End();
   end_execute

   script void atEndOfRoute()
      # turn off radar arc
      WsfDraw turnOffArc = WsfDraw();
      turnOffArc.Erase(PLATFORM.Name());
   end_script

   processor sensor_coverage WSF_SCRIPT_PROCESSOR
   end_processor

   // --- * --- * ---
   //   Processors
   // --- * --- * ---
   processor data_mgr WSF_TRACK_PROCESSOR
#      purge_interval  5 min
      purge_interval  10 min # 120.0 sec
      update_interval  10.0 sec

      report_to commander via cmdr_net
   end_processor

   edit processor station_timer
      script_variables
         total_station_time     = 3600.0 * 3.0; # three hours
         time_before_refueling  = MATH.INTEGER_MAX();
      end_script_variables
   end_processor

   processor task_mgr WSF_TASK_PROCESSOR

#      evaluation_interval DETECTED 10 sec
#      state DETECTED
#         on_entry
#            writeln(PLATFORM.Name(), " has detected ", TRACK.TargetName(), " at time ", TIME_NOW);
#         end_on_entry
#      end_state
   end_processor

end_platform_type
```

### ===== FILE: platform/BLUE_MULTIROLE_FIGHTER_2.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
# New file created by Wizard
include_once weapon/BLUE_LR_A2A_RF_MISSILE.txt
include_once weapon/BLUE_SR_A2A_IR_MISSILE.txt
//include_once ../weapons/harm2.txt
//include_once ../weapons/jsow.txt
//include_once aiai_weapon.txt
include_once sensor/BLUE_A2A_RADAR.txt
include_once sensor/GENERIC_ESM_SENSOR.txt
include_once weapon/SIMPLE_A2A_MISSILE.txt

include_once sensor/GEO_AA_RADAR.txt

include_once processor/BLUE_MULTIROLE_FIGHTER_2_TASK_PROCESSOR.txt

include_once signatures/BLUE_A2A_RADAR_SIGNATURE.txt

platform_type BLUE_MULTIROLE_FIGHTER_2 WSF_PLATFORM

   icon F-18E
   category fighter

   mover WSF_AIR_MOVER
      roll_rate_limit               1 rad/sec
      default_linear_acceleration   1.0 g
      default_radial_acceleration   6.5 g
      default_climb_rate            400 fps

      //old value
      //maximum_speed                 600.0 knots
      // Janes Reference, Max level speed: more than M1.8 (1160 kts)
      maximum_speed      1160.0 knots

      //old value
      //maximum_altitude              55000 ft
      //Combat Ceiling, Janes Reference
      maximum_altitude              50000 ft

      minimum_altitude              50 ft
      maximum_linear_acceleration   8 g
      #no_pitch
      at_end_of_path remove
   end_mover

   radar_signature blue_a2a_radar_signature

   include comm/BLUE_COMM.txt

   sensor blue_a2a_radar GEO_AA_RADAR
      //debug
      on
      internal_link data_mgr
      ignore_same_side
   end_sensor

   execute at_time 5 seconds relative
      WsfDraw sensorArc = WsfDraw();
      sensorArc.SetId(PLATFORM.Name());
      sensorArc.SetColor(0,1,0);
      sensorArc.SetEllipseMode("line");
      sensorArc.BeginPolyline();
      sensorArc.Vertex(PLATFORM);
      double range = 125. * MATH.M_PER_NM();
      double heading = PLATFORM.Heading();
      WsfGeoPoint loc = PLATFORM.Location();
      for (double angle = -60.; angle <= 60.; angle = angle + 5.)
      {
         double aFront = MATH.Cos(angle)*range;
         double aRight = MATH.Sin(angle)*range;
         sensorArc.VertexECS(PLATFORM, aFront, aRight, 0.0);
      }
      sensorArc.Vertex(PLATFORM);
      sensorArc.End();
   end_execute

   script void atEndOfRoute()
      # turn off radar arc
      WsfDraw turnOffArc = WsfDraw();
      turnOffArc.Erase(PLATFORM.Name());
   end_script



   sensor esm-1 GENERIC_ESM_SENSOR
      //debug
      on
      yaw 45. degrees
      internal_link data_mgr
   end_sensor

   sensor esm-2 GENERIC_ESM_SENSOR
      //debug
      on
      yaw 135 degrees
      internal_link data_mgr
   end_sensor

   sensor esm-3 GENERIC_ESM_SENSOR
      //debug
      on
      yaw -135 degrees
      internal_link data_mgr
   end_sensor

   sensor esm-4 GENERIC_ESM_SENSOR
      //debug
      on
      yaw -45 degrees
      internal_link data_mgr
   end_sensor

   processor data_mgr WSF_TRACK_PROCESSOR
      //debug
      purge_interval  60 sec
      update_interval 1 sec

      report_to commander via cmdr_net
   end_processor

   processor task_mgr BLUE_MULTIROLE_FIGHTER_2_TASK_PROCESSOR #WSF_TASK_PROCESSOR
   end_processor

#   weapon int_missile SIMPLE_A2A_MISSILE_WEAPON end_weapon

   weapon blue_lr_a2a_rf_missile BLUE_LR_A2A_RF_MISSILE
      quantity 10
   end_weapon
   weapon blue_sr_a2a_ir_missile BLUE_SR_A2A_IR_MISSILE
      quantity 2
   end_weapon

//   weapon HARM2 HARM2_WEAPON
//      quantity 2
//   end_weapon
//   weapon JSOW JSOW_WEAPON
//      quantity 2
//   end_weapon

end_platform_type


```

### ===== FILE: platform/BLUE_MULTIROLE_FIGHTER_2_ERC.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
# New file created by Wizard
include_once platform/BLUE_MULTIROLE_FIGHTER_2.txt

platform_type BLUE_MULTIROLE_FIGHTER_2_ERC BLUE_MULTIROLE_FIGHTER_2

   category ERC

   edit mover
      at_end_of_path extrapolate
   end_mover

   script void deleteSelf()
      PLATFORM.DeletePlatform();
   end_script

end_platform_type
```

### ===== FILE: platform/BLUE_MULTIROLE_FIGHTER_2_MRC.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
# New file created by Wizard

#include_once platforms/TIMED_STATION_AC.txt
include_once processor/STATION_TIMER.txt

platform_type BLUE_MULTIROLE_FIGHTER_2_MRC BLUE_MULTIROLE_FIGHTER_2

   category MRC

#  This script is defined here, instead of in the processor, because it is
#  "called" by the aircraft, as part of the route.
   include global_script.txt

   processor station_timer STATION_TIMER
      script_variables
         total_station_time     = 3600.0 * 3.0;  # three hours
         time_before_refueling  = 3600.0 * 1.5;        # one hour
      end_script_variables
   end_processor
end_platform_type
```

### ===== FILE: platform/CVN.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
# New file created by Wizard
include_once processor/CVN_TASK_PROCESSOR.txt

platform_type CVN WSF_PLATFORM

   # comm networks
   include comm/BLUE_COMM.txt


   processor task_mgr CVN_TASK_PROCESSOR

   end_processor

   processor data_mgr WSF_TRACK_PROCESSOR
   end_processor

end_platform_type
```

### ===== FILE: platform/BOMBER.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************

include_once signatures/BOMBER_RADAR_SIGNATURE.txt
include_once signatures/BOMBER_INFRARED_SIGNATURE.txt
include_once signatures/BOMBER_OPTICAL_SIGNATURE.txt

platform_type BOMBER WSF_PLATFORM

#  icon EA-6B
   icon B-52

   radar_signature    bomber_radar_signature
   infrared_signature bomber_infrared_signature
   optical_signature  bomber_optical_signature
   mover WSF_AIR_MOVER

      # WAGs - Luke Miklos
      roll_rate_limit               0.7 rad/sec
      default_linear_acceleration   0.7 g
      default_radial_acceleration   2.5 g
      default_climb_rate            300 fps

      # Mach 0.9 (516.0 kts) at altitude, Janes Reference
      maximum_speed                 516.0 knots

      # Ceiling, Janes Reference
      maximum_altitude              55000 ft
      minimum_altitude              1000 ft

      # WAG - Luke Miklos
      maximum_linear_acceleration   7 g

      #no_pitch
      at_end_of_path extrapolate

   end_mover

   processor track_manager WSF_TRACK_PROCESSOR
      //debug
#      purge_interval  60 sec
#      update_interval 2 sec
   end_processor

   processor task_mgr WSF_TASK_PROCESSOR
      evaluation_interval DETECTED 60 seconds
      state DETECTED
         next_state RETURN
            return (PLATFORM.GroundRangeTo(TRACK) <= 300.0 * MATH.M_PER_NM());
         end_next_state
      end_state
      evaluation_interval RETURN 100 hours
      state RETURN
         on_entry
            PLATFORM.TurnToRelativeHeading(180.0);
            writeln("!!!!!!!!!!!!! ", PLATFORM.Name(), " has reached launch point!!!!!!!!!!");
         end_on_entry
      end_state
   end_processor

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
platform cv_1 CVN
  side blue
  icon Carrier
  position 00:00:00.00n 30:00:00.00w
  heading 90 deg
  zone circle_zone_5190
    circular
    maximum_radius 100.00 nm
#    start_angle 315.00 deg
#    stop_angle 45.00 deg
  end_zone
  zone circle_zone_52115
    circular
    maximum_radius 150.00 nm
    start_angle 315.00 deg
    stop_angle 45.00 deg
  end_zone
  zone circle_zone_52120
    circular
    maximum_radius 200.00 nm
    start_angle 315.00 deg
    stop_angle 45.00 deg
  end_zone
  zone circle_zone_52125
    circular
    maximum_radius 250.00 nm
    start_angle 315.00 deg
    stop_angle 45.00 deg
  end_zone
  zone circle_zone_52130
    circular
    maximum_radius 300.00 nm
    start_angle 315.00 deg
    stop_angle 45.00 deg
  end_zone
  zone circle_zone_52135
    circular
    maximum_radius 350.00 nm
    start_angle 315.00 deg
    stop_angle 45.00 deg
  end_zone
  zone circle_zone_52140
    circular
    maximum_radius 400.00 nm
    start_angle 315.00 deg
    stop_angle 45.00 deg
  end_zone
  zone circle_zone_52145
    circular
    maximum_radius 450.00 nm
    start_angle 315.00 deg
    stop_angle 45.00 deg
  end_zone
  zone circle_zone_52150
    circular
    maximum_radius 500.00 nm
    start_angle 315.00 deg
    stop_angle 45.00 deg
  end_zone
end_platform



platform tanker1 WSF_PLATFORM
   side blue
   icon kc-135
   position 00:37:55.53n 27:48:46.39w altitude 30000 ft
end_platform

platform tanker2 WSF_PLATFORM
   side blue
   icon kc-135
   position 00:26:01.38s 27:45:33.25w altitude 30000 ft
end_platform


```

### ===== FILE: side/red.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
# New file created by Wizard


platform bomber-1 BOMBER
  side red
  icon bomber
  heading 000 deg
  route
    position 10:20:29.55n 12:40:30.75w altitude 40000.00 ft
    speed 400 kts
    pause_time 30 minutes
    position 00:00:00.00n 30:00:00.00w altitude 40000.00 ft
  end_route

  track platform cv_1 end_track
end_platform

platform bomber-1a BOMBER
  side red
  icon bomber
  heading 000 deg
  creation_time 30 minutes
  route
    position 10:20:29.55n 12:40:30.75w altitude 40000.00 ft
    speed 400 kts
    pause_time 30 minutes
    position 00:00:00.00n 30:00:00.00w altitude 40000.00 ft
  end_route

  track platform cv_1 end_track
end_platform



platform bomber-2 BOMBER
  side red
  icon bomber
  heading 000 deg
  route
    position 05:32:31.57n 10:32:12.07w altitude 40000.00 ft
    speed 400 kts
    position 00:00:00.00n 30:00:00.00w altitude 40000.00 ft
  end_route

  track platform cv_1 end_track
end_platform

platform bomber-3 BOMBER
  side red
  icon bomber
  heading 269 deg
  route
    position 00:00:00.00n 10:07:11.75w altitude 40000.00 ft
    speed 400 kts
    position 00:00:00.00n 30:00:00.00w altitude 40000.00 ft
  end_route

  track platform cv_1 end_track
end_platform

platform bomber-4 BOMBER
  side red
  icon bomber
  heading 000 deg
  route
    position 05:03:47.09s 10:30:56.84w altitude 40000.00 ft
    speed 400 kts
    position 00:00:00.00n 30:00:00.00w altitude 40000.00 ft
  end_route

  track platform cv_1 end_track
end_platform

platform bomber-4a BOMBER
  side red
  icon bomber
  heading 000 deg
  route
    position 05:03:47.09s 10:30:56.84w altitude 40000.00 ft
    speed 400 kts
    position 00:00:00.00n 30:00:00.00w altitude 40000.00 ft
  end_route

  track platform cv_1 end_track
end_platform

platform bomber-5 BOMBER
  side red
  icon bomber
  heading 000 deg
  route
    position 10:18:45.41s 12:25:46.53w altitude 40000.00 ft
    speed 400 kts
    position 00:00:00.00n 30:00:00.00w altitude 40000.00 ft
  end_route

  track platform cv_1 end_track
end_platform
```
---

## 4. 使用指引

### 4.1 看点速览（这个案例演示什么）

- **体系级任务分配**：`CVN_TASK_PROCESSOR WSF_TASK_PROCESSOR` 是"指挥节点"范式 —— `on_update` 里按 `launchCycle`（90 min）周期用 `WsfSimulation.CreatePlatform(type)` **运行期造机**并按命名前缀（`erc-` / `mrc-` / `aew-`）挂航路；收到航迹后进入 `DETECTED → VECTOR → ASSIGNED → DEASSIGN` 状态机，`assignInterceptor()` **先挑最近的 ERC、再用 MRC 补足**，`CancelTask` 撤销派单。
- **甲板周期出动**：`nextAEWlaunch = TIME_NOW + (2.0*launchCycle)*60.0` —— 预警机 180 min 一个周期、ERC/MRC 各 90/180 min，是"周期性持续出动"的最小写法。
- **CAP 驻留 / 加油 / 返场定时器**：`processor STATION_TIMER WSF_SCRIPT_PROCESSOR` 用 `on_update` 每 5 s 检查 `ON_STATION_TIME` / `NOW_ON_CAP` 两个 AuxData，超时即 `GoRefuel()` / `GoHome()`，靠 `PLATFORM.FollowRoute(route, label)` 跳转 —— 航路侧用 `label on_station` / `label go_home` / `goto on_station` / `execute OnStation` 配套（见 `global_route.txt`）。**这是 AFSIM 里"按任务剖面飞行"的经典写法。**
- **多机种派生**：`BLUE_MULTIROLE_FIGHTER_2`（基型）→ `_ERC`（只改 `category ERC` + `edit mover` + 一个 `deleteSelf` 脚本）/ `_MRC`（改 `category MRC` + 覆盖 `station_timer` 的 `script_variables`）。派生用 `platform_type <子> <父>` + `edit <组件>` 覆盖，**不复制整份定义**。
- **完整武器链路 ×2**：
  - 中距 RF：`aero GUESSED_AERO` → 弹体 `platform_type BLUE_LR_A2A_RF_MISSILE`（`WSF_GUIDED_MOVER` + `WSF_GUIDANCE_COMPUTER` + `WSF_PERFECT_TRACKER` + `WSF_AIR_TARGET_FUSE`）→ `weapon BLUE_LR_A2A_RF_MISSILE WSF_EXPLICIT_WEAPON`；
  - 近距 IR：`aero BLUE_SR_A2A_IR_MISSILE_AERO` → 弹体 `platform_type BLUE_SR_A2A_IR_MISSILE_BASE` → `weapon BLUE_SR_A2A_IR_MISSILE`；
  - 再派生一个 `SIMPLE_A2A_MISSILE` + `launch_computer SIMPLE_A2A_LAUNCH_COMPUTER`。
- **表驱动 `launch_computer`**：`BLUE_SR_A2A_IR_MISSILE_ATA_LAUNCH_COMPUTER_10KFT_0.6MACH WSF_ATA_LAUNCH_COMPUTER` 是 LAR 生成器产出的**拦截结果表**（`number_of_aspect_angle_bins` / `firing_range_bin_count_and_values` / `time_of_flight_values` 多维表）—— 想接真实发射包线时照这个结构填表。
- **三类签名齐备**：`radar_signature` / `infrared_signature` / `optical_signature` 全部独立成文件（`signatures/`），平台内按名引用。
- **ESM 被动探测**：`sensor GENERIC_ESM_SENSOR WSF_ESM_SENSOR` 的 `frequency_band` / `ranging_time`（三角定位后才出距离）写法，与主动雷达（`WSF_RADAR_SENSOR` 的 `mode_template` / `mode` 多模式）形成对照。

### 4.2 怎么跑

1. 按 §1 的 tree 把 **39 个文件**复原为目录（`outer_air_battle/` 为工程根）。
2. 打包为 ZIP：**ZIP 名与入口同名** —— `outer_air_battle.zip`，内含 `outer_air_battle.txt` 于**压缩包根目录**。
3. 交给 AFSIM：本案例**仅通过语法校验，未跑仿真**。
   - 校验通道：`mcp__afsim__validate_scenario`（或等价 HTTP `POST /api/v1/scenarios/validate`）；判据只看 `valid`（语法对错都返回 200）。
4. 仿真时长 `end_time 6 hours`，输出落在 `output/`（`outer_air_battle.evt` / `.aer` / `.log`）。

> ⚠️ **改名注意**：入口内的 `define_path_variable CASE outer_air_battle` 决定输出文件名；若改工程名，须同步改入口文件名的 basename，**且保证全工程只有这一个文件与工程同名**（服务端按 `<工程名>.txt` 定位启动文件，大小写不敏感、不区分路径，出现两个即报"启动文件不唯一"）。

### 4.3 可借鉴 / 勿照抄

| 可借鉴 | 说明 |
| :-- | :-- |
| 指挥节点派单 | `WsfSimulation.CreatePlatform` + `AssignTask` / `CancelTask` / `TaskComplete` 的完整闭环 |
| 周期性出动 | `on_update` 里维护 `next*launch` 时间戳，到点造机并顺延 |
| 任务剖面飞行 | `FollowRoute(routeName, label)` + 航路 `label` / `goto` / `execute <脚本>` |
| 平台派生 | `platform_type <子> <父>` + `edit <组件>` 局部覆盖，不复制整份定义 |
| 拦截结果表 | `WSF_ATA_LAUNCH_COMPUTER` 的 `intercept_results` 多维表结构 |
| 多模式雷达 | `mode_template` + 多个 `mode`（`120X10` / `40X20` / `20X15_BALL` / `20X15`） |
| 被动 ESM | `frequency_band` + `ranging_time`（模拟三角定位后出距离） |
| 内联片段复用 | `comm/BLUE_COMM.txt` 被 3 个平台类型以 `include` 就地插入 |

| 勿照抄 | 原因 |
| :-- | :-- |
| `weapon_effects TEST_EFFECT` 定义两次 | 官方原样如此（同名重定义，后者生效）；新工程只写一个 |
| `platform_type` 内联 `mover` / `processor` / `sensor` | 本案例为忠实原样保留；规范推荐"组件独立成文件 + 平台内按名引用" |
| `#include_once platforms/TIMED_STATION_AC.txt` 等注释行 | 官方遗留的**已注释**旧路径，本案例**原样保留**（属历史快照，未回改） |
| 入口 `script_interface debug` + `STATION_TIMER` 内 `script_interface` | 两处并存（后者生效）；新工程只留一处 |
| 第二个入口 `OAB_mrc_lrc.txt` | 与 `OAB_mrc_erc.txt` 闭包部分重叠，**不可合并**（会重复定义） |

### 4.4 对应关系

本案例的写法在本 Skill 内的权威参考：

| 本案例演示的写法 | 权威参考 |
| :-- | :-- |
| 目录划分与装配顺序 | `refs/structure/project-layout.md`、`refs/structure/assembly-rules.md` |
| 运行期造机与体系级派单 | `refs/sos/task-taxonomy.md`、`refs/sos/command-chain.md` |
| `script_struct` 与脚本语法要点 | `refs/knowledge/script_syntax_critical.md`、`refs/knowledge/script_types.md` |
| `WSF_ATA_LAUNCH_COMPUTER` 拦截结果表 | `refs/knowledge/commands_reference.md` |
| 多模式雷达与被动 ESM | `refs/knowledge/sensor_types_reference.md` |

### 4.5 改造中实测到的坑

1. **★ 跨 demo 依赖（本案例最大特征）**：入口用 `define_path_variable PATH base_types` + `file_path ../$(PATH)` 指向**同级 demo** `base_types`，`platforms/blue_multirole_fighter_2.txt` include 的 `weapons/aam/*.txt` **不在本 demo 目录内**。缺的 4 个文件在 `base_types/weapons/aam/`（`blue_lr_a2a_rf_missile.txt` / `blue_sr_a2a_ir_missile.txt` / `simple_a2a_missile.txt` / `..._ata_launch_computer_alt10kft_0.6mach.txt`）。**处置**：4 个文件一并内化到 `weapon/`，路径声明随之取消（属 A4 路径改写）。→ 这暴露了方案 §10.8 "自包含"判定口径的**盲区**：只判了"demo 内是否存在"，漏了"引用了 demo 内不存在、但在同级 demo 中"这一类。
2. **`include` 内联片段必须就地保留**：`platforms/blue_comm.txt`（2 个 `comm` 块）与 `processors/onstation.txt`（`script void OnStation()`）是被 `include` **就地插入 `platform_type` 体内**的片段。**不能**改成 `include_once` 提到顶层 —— 否则 `comm` 块会变成非法顶层块，`OnStation` 会从"平台类型脚本"变成"全局脚本"（语义变了）。本案例按 §11.2 铁律**只改路径字符串**：`include platforms/blue_comm.txt` → `include comm/BLUE_COMM.txt`。
3. **`script_struct` 与 `processor` 同文件**：`processors/cvn_task_processor.txt` 前 7 行是 `script_struct launchParameters`，后接 `processor CVN_TASK_PROCESSOR`。已按规范把 `script_struct` 析出到 `global_struct.txt`，并在处理器文件头 `include_once global_struct.txt`。
4. **`launch_computer` 无规范归属**：映射表未覆盖 → 归 `weapon/`（与武器同层），文件名随块名。
5. **同一文件内 `weapon_effects TEST_EFFECT` 定义两次**：`blue_lr_a2a_rf_missile.txt` 的 L54-56（`radius_and_pk 50.0 ft 1.0`）与 L114-117（`radius_and_pk 100.0 m 1.0`）**同名**。**未合并、未删除**，按原文顺序收入 `weapon_effects/TEST_EFFECT.txt`；AFSIM 接受同名重定义（校验通过）。
6. **`script_interface` 就地保留（与 `launcher` 案例略有差异）**：本 demo 有两处（入口单行 `script_interface debug end_script_interface`、`processor/STATION_TIMER.txt` 内三行块）。若都归 `global_script.txt` 会造成**同名块在同一文件内重复**，故**两处各自就地保留**。（`launcher` 案例只有一处，当时归入了 `global_script.txt`；两种处置都合规，见 §11.7 口径说明。）
7. **`event_output` 被 `include`**：原始入口是 `include event_output.txt`（62 行块）；按规范 §4.2"入口内联 `event_output`"改为**入口内联**，块内容原样。
8. **`file_path .` 必须保留**：AFSIM 的 `include_once` 按 `file_path` 搜索，工程内所有相对路径都相对**工程根** —— 这也是为什么 `platforms/blue_prop_awacs_1.txt` 里写 `include_once platforms/timed_ac.txt`（而不是同目录的 `timed_ac.txt`）。改造后同理，所有 include 一律写**相对工程根**的路径。
9. **入口同名化**：`OAB_mrc_erc.txt` → `outer_air_battle.txt`（A2），`define_path_variable CASE` 由 `outer_air_battle-mrc-erc` 改为 `outer_air_battle`（A3），保证输出文件名与工程名一致。

### 4.6 许可说明

原始 AFSIM 官方 demo 文件头部含 CUI（受控非密信息）横幅：

```text
# CUI
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
```

本案例**原样保留**该横幅（未剥离、未改写），并在每个文件头部呈现。使用与再分发须遵守原始许可（另见方案 §12 R1）。

# 案例：outer_air_battle —— 组件与实例全文

> 本文件是 `outer_air_battle.md` 的**续篇**（按 §6 大案例切分规则拆出）。
> 主文件含：元信息头、§1 文件结构、根文件全文、§3 使用指引。本文件含 **31 个组件与实例文件的全文**。
> 文件顺序 = **装配顺序**（`mover` → `comm` → `sensor` → `processor` → `signatures` → `weapon_effects` → `weapon` → `platform` → `side/` 实例）。

---
