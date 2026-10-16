# 案例：ship_ad（水面舰艇 —— 反舰导弹交战 + 舰载直升机中继制导）

> **任务类型**：水面舰艇反舰交战 —— 蓝方 052B 驱逐舰 + 舰载直升机 vs 红方 054 护卫舰
> **来源**：AFSIM 官方 demo `ship_ad` 的入口 `1st_asm.txt`（改造后收录）
> **改造说明**：**仅结构改造，内容未增删** —— 块计数对比 **0 项差异**、行级审计**丢失 0 行 / 新增 0 行**；差异**只剩 `include` / `include_once` 路径改写与依赖补齐**（逐条可核，见 §4.5-1）
> **规模**：58 个文件 / 3,031 行（`processor/NAVAL_SAM_TACTICS.txt` 271、`processor/NAVAL_ASM_TACTICS.txt` 234、`processor/NAVAL_SSM_TACTICS.txt` 234、`weapon/SSM_MISSILE.txt` 113）
> **结构**：根文件 6（入口 / `event_pipe.txt` / `global_env.txt` / `global_route.txt` / `global_script.txt` / `setup.txt`）+ 目录 11（`comm/`、`config/`、`mover/`、`output/`、`platform/`、`processor/`、`sensor/`、`side/`、`signatures/`、`weapon/`、`weapon_effects/`）
> **自包含**：原 demo 三个入口（`1st_asm` / `2nd_sam` / `3rd_ssm`）**共用同一批平台定义**；本案例只收 `1st_asm.txt` 的闭包（34 个源文件），**无跨 demo 依赖**，改造后工程自包含
> **许可 / 限制**：原始文件含 CUI 受控横幅，本案例**原样保留**（见 §4.6）
> **亮点**：① **舰载中继制导闭环**（`ANNOUNCE_LAUNCH_TACTICS` 发 `Update` 任务 → 直升机 `INFLIGHT_UPDATE_TACTICS` 收任务 → 经 uplink 向飞行中的导弹送航迹）；② **`launch_computer` 两层聚合**（`SAM_LaunchComputer` → 按目标舰型分派 `RED_SR_SAM_1/2_LaunchComputer`）；③ **拦截包线 `zone` + `WithinZoneOf`**（`full_kinematic` / `half_kinematic`，护卫舰双包线）；④ **武器链路 ×4**（ASM 反舰 / SAM 防空 ×2 型 / SSM 巡航）；⑤ **战术处理器族**（4 个 `WSF_TASK_PROCESSOR` 状态机 + 2 个协作处理器）；⑥ **`filter` 块**（`WSF_KALMAN_FILTER` + `track_manager` 内联引用）；⑦ 三类签名齐备
> **对应**：结构 → `refs/structure/project-layout.md`；任务处理器 / `launch_computer` → `refs/knowledge/`；本案例 `processor/` `weapon/`

---

## 1. 文件结构

```text
ship_ad/
├── ship_ad.txt                          82   ★ 入口（装配总纲 + event_output 内联 + 仿真控制）
├── setup.txt                            21   平台装配（include 4 个 platform/*）
├── event_pipe.txt                       15   aer 记录配置
├── global_env.txt                       14   全局环境（terrain 块；本 demo 为空地形）
├── global_route.txt                     13   全局航路（route ASM_DUMMY，供弹上 on_create 变换）
├── global_script.txt                    20   共享定义（filter FILTER_TACTICS = WSF_KALMAN_FILTER）
├── config/
│   └── run.json                          1   运行控制（scenariosId 留空 0）
├── output/
│   └── blank_empty.txt                   0   占位（保证 output/ 不被 ZIP 丢弃）
│
├── mover/
│   ├── RED_SR_SAM_1_AERO.txt            18   aero RED_SR_SAM_1_AERO（短程 SAM 气动）
│   ├── RED_SR_SAM_2_AERO.txt            19   aero RED_SR_SAM_2_AERO（中程 SAM 气动）
│   └── SSM_MISSILE_AERO.txt             21   aero SSM_MISSILE_AERO（巡航弹气动）
├── comm/
│   └── RED_DATALINK.txt                 15   comm RED_DATALINK WSF_COMM_TRANSCEIVER（红方数据链）
├── sensor/
│   ├── FRONT_DOME.txt                   56   sensor FRONT_DOME（X 波段照射器；含 antenna_pattern）
│   ├── HELICOPTER_SURFACE_SEARCH_RADAR_1.txt   80   舰载直升机对海搜索雷达
│   ├── RED_MISSILE_SEEKER_1.txt         77   弹载雷达导引头（track_quality 1.0）
│   ├── RICE_SCREEN.txt                  80   sensor RICE_SCREEN（对空搜索，C 波段）
│   ├── SR_SAM_FCR_1.txt                 82   sensor SR_SAM_FCR_1（火控 / 跟踪雷达）
│   └── TOP_PLATE.txt                    75   sensor TOP_PLATE（对空搜索）
├── processor/
│   ├── NAVAL_SAM_TACTICS.txt           271   防空交战战术（DETECTED→ENGAGEABLE→ENGAGE→FIRING + 照射器分配）
│   ├── NAVAL_ASM_TACTICS.txt           234   反舰交战战术（同构四态 + script_interface）
│   ├── NAVAL_SSM_TACTICS.txt           234   巡航弹交战战术（同构四态 + script_interface）
│   ├── ASM_TACTICS.txt                  85   弹上 ASM 战术（ENROUTE→ACQUIRING_TARGET→TERMINAL）
│   ├── ANNOUNCE_LAUNCH_TACTICS.txt      71   发射通报：收 WEAPON_FIRED 状态消息 → 给下属派 Update 任务
│   ├── INFLIGHT_UPDATE_TACTICS.txt      95   中继制导：收 Update 任务 → 周期性经 uplink 送航迹
│   ├── MISSILE_SHIP_DATA_MGR.txt        11   WSF_TRACK_PROCESSOR（航迹管理）
│   ├── MISSILE_SHIP_TASK_MGR.txt        15   NAVAL_SAM_TACTICS 实例（舰载）
│   ├── RED_MISSILE_DESTROYER_DATA_MGR.txt 11
│   ├── RED_MISSILE_DESTROYER_TASK_MGR.txt 15
│   ├── RED_MISSILE_FRIGATE_DATA_MGR.txt 11
│   ├── RED_MISSILE_FRIGATE_TASK_MGR.txt 17   （含 ILLUMINATOR / ENVELOPE 配置）
│   └── RED_NAVAL_HELICOPTER_DATA_MGR.txt 14   （report_fused_tracks）
├── signatures/
│   ├── VEHICLE_RADAR_SIGNATURE.txt      11   radar_signature（1 m²）
│   ├── VEHICLE_INFRARED_SIGNATURE.txt   19   infrared_signature（10 W/sr）
│   ├── VEHICLE_OPTICAL_SIGNATURE.txt    11   optical_signature（10 m²）
│   ├── SHIP_RADAR_SIGNATURE.txt         11   radar_signature（1000 m²）
│   ├── SHIP_INFRARED_SIGNATURE.txt      14   infrared_signature
│   └── SHIP_OPTICAL_SIGNATURE.txt       11   optical_signature（300 m²）
├── weapon_effects/
│   ├── RED_ASM_MSL_EFFECT.txt           11   radius_and_pk 20 m 0.75
│   ├── RED_SR_SAM_1_EFFECT.txt          11   radius_and_pk 20 m 0.8
│   ├── RED_SR_SAM_2_EFFECT.txt          11   radius_and_pk 17 m 0.8
│   └── SSM_MISSILE_EFFECT.txt           14   radius_and_pk 20 m 1.0（demo 用 1.0）
├── weapon/
│   ├── RED_ASM_MSL.txt                  87   弹体 platform_type + weapon（两段式）
│   ├── RED_SR_SAM_1.txt                 77   弹体 platform_type + weapon（两段式）
│   ├── RED_SR_SAM_2.txt                 90   弹体 platform_type + weapon（两段式）
│   ├── SSM_MISSILE.txt                 113   弹体 platform_type + weapon（两段式，含 2 处 execute）
│   ├── ASM_LaunchComputer.txt           46   顶层 script 聚合（ASM，按舰型分派）
│   ├── SAM_LaunchComputer.txt           56   顶层 script 聚合（SAM，两型分派 + Local_ 版本）
│   ├── SSM_LaunchComputer.txt           46   顶层 script 聚合（SSM）
│   ├── RED_ASM_MSL_LaunchComputer.txt   41   单弹 LAR 判定（tti + maxTOF）
│   ├── RED_SR_SAM_1_LaunchComputer.txt  52   单弹 LAR 判定（tti + WithinZoneOf 包线）
│   ├── RED_SR_SAM_2_LaunchComputer.txt  49   单弹 LAR 判定（tti + WithinZoneOf 包线）
│   └── SSM_MISSILE_LaunchComputer.txt   41   单弹 LAR 判定（tti + maxTOF）
├── platform/
│   ├── MISSILE_SHIP.txt                 97   platform_type MISSILE_SHIP（现代级；含 zone full_kinematic）
│   ├── RED_MISSILE_DESTROYER.txt       105   platform_type RED_MISSILE_DESTROYER（052B）
│   ├── RED_MISSILE_FRIGATE.txt         111   platform_type RED_MISSILE_FRIGATE（054；双包线）
│   └── RED_NAVAL_HELICOPTER.txt         73   platform_type RED_NAVAL_HELICOPTER（中继制导节点）
└── side/
    ├── blue.txt                         31   蓝方实例（1000_test_ship 052B / 1000_helo 直升机）
    └── red.txt                          19   红方实例（1000_target_ship 054）
```

**范围说明**：原 demo 有三个入口 —— `1st_asm.txt`（反舰）、`2nd_sam.txt`（防空）、`3rd_ssm.txt`（巡航弹），三者**共用同一批平台定义**，各自只换一个 `scenarios/naval_*_test.txt`。本案例**只收 `1st_asm.txt` 的闭包**（34 个源文件 → 58 个规范文件），另两个入口的实例文件（`naval_sam_test.txt` / `naval_ssm_test.txt`）与仅被 `2nd_sam` 用到的 `weapons/sam/red_sr_naval_sam_1.txt` **不在本入口闭包内**，故未收录（详见 §4.3）。
原 demo 的非文本资产（`README.md` / `doc/ship_ad.rst` / `doc/images/ship_ad_demo.png`）按 §11.2 铁律 **一律不进改造工程**。

---

## 2. 案例详细说明

### 2.1 任务背景与态势

本案例源自 AFSIM 官方演示想定 `ship_ad`（入口 `1st_asm.txt` 闭包，源 34 个文件），归一化后为 58 个文件的本工程。案例主题为**水面舰艇反舰导弹交战 + 舰载直升机中继制导闭环**：蓝方导弹驱逐舰对红方导弹护卫舰发射反舰导弹（ASM），由于发射舰自身对海搜索雷达 `RICE_SCREEN` 显式 `ignore_domain surface`（`sensor/RICE_SCREEN.txt:71-74`），看不到水面目标，因此依赖本舰配属的舰载直升机用对海搜索雷达发现目标、经数据链回传航迹；导弹发射后，发射舰通过 `ANNOUNCE_LAUNCH_TACTICS` 通报发射并给直升机下达 `Update` 任务，由直升机周期性通过 uplink 上行链路向飞行中的导弹推送目标航迹，形成「发现→回传→发射→通报→中继更新→命中」的闭环。

入口 `ship_ad.txt` 顶部 `define_path_variable CASE ship_ad`（`ship_ad.txt:10`），日志输出 `output/$(CASE).log`（`:11`），另经 `event_output file output/$(CASE).evt`（`:78`）与 `event_pipe file output/$(CASE).aer`（`:79`）产生事件文件与回放文件。入口保留源文件写法、出现两行 `end_time`（`1 hrs` 与 `1.5 hours`，见 `ship_ad.txt:81-82`），后者生效，即仿真时长 1.5 小时。

蓝方兵力两艘（体）同侧：驱逐舰 `1000_test_ship`（指挥官 `SELF`）与其配属直升机 `1000_helo`（指挥官 `1000_test_ship`，`side/blue.txt:15-31`）；红方仅一艘护卫舰 `1000_target_ship`（`side/red.txt:9`），其对空搜索雷达 `top_plate` 在实例化时被显式 `off`（`side/red.txt:11-13`），因此本案例中红方主要充当被攻击靶舰。双方以舰艇位置差异拉开距离：驱逐舰在 30°N 78°W，直升机在其东侧 77°45′W、5000 ft agl，护卫舰在 77°30′W 并以 10 kts 向北航行（`side/red.txt:14-18`）。

### 2.2 兵力编成与阵营

| 阵营 | 平台实例名 | 平台类型 | 挂载（传感器/武器/处理器/comm） | 关键参数 |
|---|---|---|---|---|
| 蓝 blue | 1000_test_ship | RED_MISSILE_DESTROYER | 传感器 `rice_screen`(RICE_SCREEN,on)、`sr_sam_fcr_1`(SR_SAM_FCR_1,off)；武器 `sam`(RED_SR_SAM_1,量8)、`asm`(RED_ASM_MSL,量16)；处理器 data_mgr/task_mgr(NAVAL_SAM_TACTICS)/asm_task_mgr(NAVAL_ASM_TACTICS)/3rd_party_mgr(ANNOUNCE_LAUNCH_TACTICS)；comm `datalink`(<local:master>)、`RED_SR_SAM_1_uplink` | 指挥官 SELF；mover 31 kts；包线 full_kinematic 5km/12km；SAM 用 TTR 跟踪、ASM 依赖第三方中继 |
| 蓝 blue | 1000_helo | RED_NAVAL_HELICOPTER | 传感器 `helicopter_surface_search_radar_1`(on)；处理器 data_mgr、`inflight_update_mgr`(INFLIGHT_UPDATE_TACTICS)；comm `datalink`(<local:slave>)、`uplink_radio`(RED_DATALINK) | 指挥官 1000_test_ship；mover 159 kts / 14100 ft；对海搜索雷达 30km(1m²)；report_to commander via datalink |
| 红 red | 1000_target_ship | RED_MISSILE_FRIGATE | 传感器 `top_plate`(TOP_PLATE,实例中 off)、`ill-1`~`ill-4`(FRONT_DOME,ILLUMINATOR,off)；武器 `sam`(RED_SR_SAM_2,量32)；处理器 data_mgr/task_mgr(NAVAL_SAM_TACTICS,USE_ILLUMINATOR)；comm `datalink`(<local:master>)、`RED_SR_SAM_2_uplink` | mover 27 kts；包线 full_kinematic 22km/40km、half_kinematic 22km/20km；本案例实为靶舰 |

注：`MISSILE_SHIP` 平台类型（含 SSM 弹）在 `setup.txt` 中被 include 定义，但本案例 `side/blue.txt`、`side/red.txt` 未实例化它，故不参与交战。

### 2.3 装配链（入口 → 根文件 → 组件 → 实例）

```
ship_ad.txt (入口, define_path_variable CASE ship_ad)
 ├─ include_once event_pipe.txt          → event_pipe(副本 replay.aer, use_preset default)
 ├─ include_once global_env.txt          → terrain(空)
 ├─ include_once global_route.txt        → route ASM_DUMMY(306 m/s, 50m msl)
 ├─ include_once global_script.txt       → filter FILTER_TACTICS(WSF_KALMAN_FILTER)
 ├─ include_once setup.txt               → 4 个 platform_type 定义
 │    ├─ platform/RED_MISSILE_DESTROYER.txt
 │    ├─ platform/RED_MISSILE_FRIGATE.txt
 │    ├─ platform/MISSILE_SHIP.txt
 │    └─ platform/RED_NAVAL_HELICOPTER.txt
 ├─ include_once side/blue.txt           → 实例 1000_test_ship, 1000_helo
 └─ include_once side/red.txt            → 实例 1000_target_ship
```

平台类型文件内部再 `include_once` 各自的 processor / sensor / weapon / comm / signatures 子文件。以驱逐舰为例：`RED_MISSILE_DESTROYER.txt` include `NAVAL_SAM_TACTICS`、`NAVAL_ASM_TACTICS`、`ANNOUNCE_LAUNCH_TACTICS`、`RED_MISSILE_DESTROYER_DATA_MGR`、`RED_MISSILE_DESTROYER_TASK_MGR`、`RICE_SCREEN`、`SR_SAM_FCR_1`、`RED_SR_SAM_1`、`RED_ASM_MSL`、`RED_DATALINK`、`SHIP_RADAR_SIGNATURE`（`:9-19`）。武器定义又链到 mover/aero、weapon_effects、弹上 sensor 与 processor（如 `RED_ASM_MSL.txt` include `ASM_TACTICS`、`RED_MISSILE_SEEKER_1`、`VEHICLE_RADAR_SIGNATURE`、`RED_ASM_MSL_EFFECT`）。战术处理器再 include launch computer（如 `NAVAL_SAM_TACTICS.txt` include `SAM_LaunchComputer.txt`，后者 include `RED_SR_SAM_1/2_LaunchComputer.txt`）。

### 2.4 组件职责逐项说明

| 文件 | 块类型与名称 | 职责 | 关键参数/取值 |
|---|---|---|---|
| `ship_ad.txt` | 入口 | 定义 CASE 路径变量、装配全部子文件、配置事件/回放输出与仿真时长 | `define_path_variable CASE ship_ad`；`end_time 1 hrs` 与 `1.5 hours`（后者生效）；enable 大量 SENSOR_*/TASK_*/WEAPON_* 事件 |
| `setup.txt` | 装配 | 首先生效地 include 四个平台类型定义 | 仅 4 条 include_once |
| `global_env.txt` | terrain | 环境/地形配置 | 无地形（"no terrain for now"） |
| `global_route.txt` | route ASM_DUMMY | 供 ASM 发射时使用的占位航线 | offset 0/1 0km，speed 306 m/s，altitude 50 m msl |
| `global_script.txt` | filter FILTER_TACTICS(WSF_KALMAN_FILTER) | 全舰通用航迹滤波 | range σ 50 m；bearing/elevation σ 0.1 deg；process_noise_XYZ 50 50 30 |
| `event_pipe.txt` | event_pipe | 回放事件管道默认预设 | file replay.aer，use_preset default |
| `config/run.json` | 运行元数据 | 归一化工程附带的运行配置（非 AFSIM 脚本块） | scenariosTime startDate 2026-10-16 等；scenariosId 0 |
| `output/blank_empty.txt` | 占位 | 空输出占位文件 | 空 |
| `comm/RED_DATALINK.txt` | comm RED_DATALINK(WSF_COMM_TRANSCEIVER) | 编队数据链收发器类型 | transfer_rate 100 mbits/sec |
| `platform/RED_MISSILE_DESTROYER.txt` | platform_type RED_MISSILE_DESTROYER | 导弹驱逐舰类型：对空 SAM + 反舰 ASM + 第三方通报 | datalink <local:master>；mover 31 kts；zone full_kinematic 5km/12km；weapon sam 8 / asm 16 |
| `platform/RED_MISSILE_FRIGATE.txt` | platform_type RED_MISSILE_FRIGATE | 导弹护卫舰类型：SAM + 4 部照射器 | mover 27 kts；zone full_kinematic 22km/40km、half_kinematic 22km/20km；weapon sam 32 |
| `platform/MISSILE_SHIP.txt` | platform_type MISSILE_SHIP | 纯反舰导弹舰类型（SSM，本案例未实例化） | mover 31 kts；zone full_kinematic 5km/350km；weapon ssm 16 |
| `platform/RED_NAVAL_HELICOPTER.txt` | platform_type RED_NAVAL_HELICOPTER | 舰载直升机：对海搜索 + 中继更新 | datalink <local:slave>；mover 159 kts/14100 ft；uplink_radio 作上行 |
| `side/blue.txt` | platform 实例 | 蓝方部署驱逐舰与直升机 | 1000_test_ship 30N 78W；1000_helo 30N 77:45W 5000ft |
| `side/red.txt` | platform 实例 | 红方部署护卫舰（top_plate 关闭） | 1000_target_ship 30N 77:30W→30:30N 10kts |
| `processor/NAVAL_SAM_TACTICS.txt` | processor(WSF_TASK_PROCESSOR) | 通用舰载 SAM 交战四态状态机 + 照射器分配 | 四态 DETECTED/ENGAGEABLE/ENGAGE/FIRING；evaluation_interval 2.0s；SALVO_SIZE 2；REQUIRED_TRACK_QUALITY 0.49 |
| `processor/NAVAL_ASM_TACTICS.txt` | processor(WSF_TASK_PROCESSOR) | 舰载反舰导弹交战四态（同构 SAM） | SALVO_SIZE 1；IsEngageable 增判 SurfaceDomain；FireAt+`CueToTarget` |
| `processor/NAVAL_SSM_TACTICS.txt` | processor(WSF_TASK_PROCESSOR) | 舰载 SSM 交战四态（同构） | SALVO_SIZE 1；IsEngageable 判 Surface/LandDomain；SSM_LaunchComputer |
| `processor/ASM_TACTICS.txt` | processor(WSF_TASK_PROCESSOR) | 弹上反舰导弹三态战术（航路/搜索/末段） | ENROUTE/ACQUIRING_TARGET/TERMINAL；interval 1.0s；默认 CRUISE_ALT 50 / TERMINAL_ALT 10 / SEEKER_ACTIVATION 10000 |
| `processor/ANNOUNCE_LAUNCH_TACTICS.txt` | processor(WSF_TASK_PROCESSOR) | 监听 WEAPON_FIRED 并给直升机派 Update 任务 | REMOTE_UPDATE_PLATFORM_TYPE；mUpdateTaskStr="Update"；aux_data "weapon_platform" |
| `processor/INFLIGHT_UPDATE_TACTICS.txt` | processor(WSF_TASK_PROCESSOR) | 直升机侧中继：周期经 uplink 送航迹 | update_interval 5.0s；WEAPON_UPDATE_INTERVAL 60.0；UPLINK_COMM_NAME/WEAPON_COMM_NAME |
| `processor/MISSILE_SHIP_DATA_MGR.txt` | processor(WSF_TRACK_PROCESSOR) | MISSILE_SHIP 航迹管理 | purge_interval 60 sec |
| `processor/MISSILE_SHIP_TASK_MGR.txt` | processor(NAVAL_SAM_TACTICS) | MISSILE_SHIP 任务管理器实例化参数 | SENSOR_NAME sr_sam_fcr_1；SENSOR_TRACK_MODE default；WEAPON_NAME ssm |
| `processor/RED_MISSILE_DESTROYER_DATA_MGR.txt` | processor(WSF_TRACK_PROCESSOR) | 驱逐舰航迹管理 | purge_interval 60 sec |
| `processor/RED_MISSILE_DESTROYER_TASK_MGR.txt` | processor(NAVAL_SAM_TACTICS) | 驱逐舰 SAM 任务管理器参数 | SENSOR_NAME sr_sam_fcr_1；WEAPON_NAME sam；operating_level ENGAGE 1 |
| `processor/RED_MISSILE_FRIGATE_DATA_MGR.txt` | processor(WSF_TRACK_PROCESSOR) | 护卫舰航迹管理 | purge_interval 60 sec；report_to commander via datalink |
| `processor/RED_MISSILE_FRIGATE_TASK_MGR.txt` | processor(NAVAL_SAM_TACTICS) | 护卫舰 SAM 任务管理器（照射器模式） | USE_ILLUMINATOR true；ILLUMINATOR_TYPE FRONT_DOME；ENVELOPE half_kinematic |
| `processor/RED_NAVAL_HELICOPTER_DATA_MGR.txt` | processor(WSF_TRACK_PROCESSOR) | 直升机航迹管理并上报指挥官 | purge_interval 60 sec；report_fused_tracks；raw_track_reporting false |
| `sensor/RICE_SCREEN.txt` | sensor RICE_SCREEN(WSF_RADAR_SENSOR) | 对空搜索雷达（忽视水面） | one_m2_detect_range 100km；5000MHz；150kW；ignore_domain surface |
| `sensor/TOP_PLATE.txt` | sensor TOP_PLATE(WSF_RADAR_SENSOR) | 护卫舰对空搜索雷达 | one_m2_detect_range 83km；frame_time 4.0s；12cm 波长 |
| `sensor/FRONT_DOME.txt` | sensor FRONT_DOME(WSF_RADAR_SENSOR) | SAM 火控照射器（transmit_only） | 7000MHz；4kW；maximum_request_count 1；transmit_only |
| `sensor/SR_SAM_FCR_1.txt` | sensor SR_SAM_FCR_1(WSF_RADAR_SENSOR) | SAM 火控/跟踪雷达（TTR） | one_m2_detect_range 18km；最大跟踪 30km；18000MHz；track_quality 1.0 |
| `sensor/HELICOPTER_SURFACE_SEARCH_RADAR_1.txt` | sensor(Wsf_Radar) | 直升机对海搜索雷达 | one_m2_detect_range 30km；max 150km；10000MHz；50kW |
| `sensor/RED_MISSILE_SEEKER_1.txt` | sensor(Wsf_Radar) | 反舰导弹末制导雷达导引头 | one_m2_detect_range 10km；max 60km；9000MHz；500W；track_quality 1.0 |
| `weapon/RED_SR_SAM_1.txt` | weapon+platform_type RED_SR_SAM_1 | SA-8 舰空导弹（WSF_GUIDED_MOVER 单级） | 总质量 84.5kg；推力 5200lbf/2.5s；fuse 25s；quantity 8；salvo_interval 3.0s；reload 5min |
| `weapon/RED_SR_SAM_2.txt` | weapon+platform_type RED_SR_SAM_2 | SA-11 舰空导弹（两级 + 完美跟踪器） | stage1 265kg/2.9s、stage2 455kg/9.8s；guide_to_truth；fuse 60s；quantity 32；salvo 2.0s |
| `weapon/RED_ASM_MSL.txt` | weapon+platform_type RED_ASM_MSL | 反舰导弹（WSF_AIR_MOVER + ASM_TACTICS） | max speed 306m/s；CRUISE_ALT 25；SEEKER_ACTIVATION 11000；TERMINAL_ALT 6；fuse 392s |
| `weapon/SSM_MISSILE.txt` | weapon+platform_type SSM_MISSILE | 纯反舰导弹（两级 + 完美跟踪器 + 脚本切换制导参数） | stage1 1400lbm/900lbm/12500lbf/18.3s；fuse 680s；launch_delta_v 60fps |
| `weapon/SAM_LaunchComputer.txt` | script SAM_LaunchComputer / Local_ | SAM 发射计算机分派（按平台/武器类型） | RED_MISSILE_DESTROYER→SAM_1；RED_MISSILE_FRIGATE→SAM_2 |
| `weapon/ASM_LaunchComputer.txt` | script ASM_LaunchComputer / Local_ | ASM 发射计算机分派 | 仅 RED_MISSILE_DESTROYER→RED_ASM_MSL |
| `weapon/SSM_LaunchComputer.txt` | script SSM_LaunchComputer / Local_ | SSM 发射计算机分派 | 仅 MISSILE_SHIP→SSM_MISSILE |
| `weapon/RED_SR_SAM_1_LaunchComputer.txt` | script RED_SR_SAM_1_LaunchComputer | SAM_1 拦截窗口判定 | maxRng 12000；maxTOF 25.0；avgSpd 480；WithinZoneOf |
| `weapon/RED_SR_SAM_2_LaunchComputer.txt` | script RED_SR_SAM_2_LaunchComputer | SAM_2 拦截窗口判定 | maxRng 40000；maxTOF 45.0；avgSpd≈888.9；WithinZoneOf |
| `weapon/RED_ASM_MSL_LaunchComputer.txt` | script RED_ASM_MSL_LaunchComputer | ASM 可发射判定 | maxRng 120000；maxTOF 392.0；仅判 tti 范围 |
| `weapon/SSM_MISSILE_LaunchComputer.txt` | script SSM_MISSILE_LaunchComputer | SSM 可发射判定 | maxRng 920000；maxTOF 692.0；仅判 tti 范围 |
| `mover/RED_SR_SAM_1_AERO.txt` | aero(Wsf_Aero) | SAM_1 气动 | cd0 0.30/0.50；mach_max 2.3；ref_area 0.017m²；cl_max 3.5 |
| `mover/RED_SR_SAM_2_AERO.txt` | aero(Wsf_Aero) | SAM_2 气动 | cd0 0.30/0.50；supersonic_cd_slope -0.15；mach_max 4.0；ref_area 0.126m²；cl_max 7.5 |
| `mover/SSM_MISSILE_AERO.txt` | aero(Wsf_Aero) | SSM 气动 | cd0 0.21/0.29；mach_max 3；ref_area 0.073m²；cl_max 2.0 |
| `weapon_effects/RED_SR_SAM_1_EFFECT.txt` | weapon_effects(Wsf_Graduated_Lethality) | SAM_1 毁伤 | radius_and_pk 20.0m 0.8 |
| `weapon_effects/RED_SR_SAM_2_EFFECT.txt` | weapon_effects | SAM_2 毁伤 | radius_and_pk 17.0m 0.8 |
| `weapon_effects/RED_ASM_MSL_EFFECT.txt` | weapon_effects | ASM 毁伤 | radius_and_pk 20.0m 0.75 |
| `weapon_effects/SSM_MISSILE_EFFECT.txt` | weapon_effects | SSM 毁伤（演示置 1） | radius_and_pk 20.0m 1.0 |
| `signatures/SHIP_RADAR_SIGNATURE.txt` | radar_signature | 舰艇雷达 RCS | constant 1000 m² |
| `signatures/SHIP_INFRARED_SIGNATURE.txt` | infrared_signature | 舰艇红外 | constant 10 W/sr |
| `signatures/SHIP_OPTICAL_SIGNATURE.txt` | optical_signature | 舰艇光学 | constant 300 m² |
| `signatures/VEHICLE_RADAR_SIGNATURE.txt` | radar_signature | 弹/飞行器雷达 RCS | constant 1 m² |
| `signatures/VEHICLE_INFRARED_SIGNATURE.txt` | infrared_signature | 弹红外 | constant 10 W/sr |
| `signatures/VEHICLE_OPTICAL_SIGNATURE.txt` | optical_signature | 弹光学 | constant 10 m² |

### 2.5 运行时序与数据流

1. **直升机对海搜索**：`1000_helo` 的 `helicopter_surface_search_radar_1`（`platform/RED_NAVAL_HELICOPTER.txt:67-71`，`on`）开机搜索水面；红方护卫舰 RCS 1000 m²，对 1m² 探测距离 30 km、最大 150 km（`sensor/HELICOPTER_SURFACE_SEARCH_RADAR_1.txt:43-44`），可稳定发现并建立航迹（`hits_to_establish_track 3 5`）。

2. **航迹管理与融合上报**：直升机 `data_mgr`（`RED_NAVAL_HELICOPTER_DATA_MGR`）为 `WSF_TRACK_PROCESSOR`，`report_fused_tracks`、`raw_track_reporting false`、`report_to commander via datalink`（`:12-14`），将融合航迹经数据链上行；直升机 datalink 为 `<local:slave>`，驱逐舰为 `<local:master>`（`platform/RED_NAVAL_HELICOPTER.txt:31`、`platform/RED_MISSILE_DESTROYER.txt:39`）。驱逐舰 `datalink` 的 `internal_link data_mgr`（`:40`）把接收航迹喂给 `data_mgr`，再由 `track_manager` 用 `FILTER_TACTICS`（卡尔曼）滤波。

3. **战术处理器四态推进**：驱逐舰 `asm_task_mgr`（`NAVAL_ASM_TACTICS`，`WEAPON_NAME="asm"`、`SENSOR_NAME=""`，`platform/RED_MISSILE_DESTROYER.txt:61-66`）按 DETECTED→ENGAGEABLE→ENGAGE→FIRING 四态、每 2 秒评估。因 `SENSOR_NAME` 为空，`TrackingNow()` 走 `TRACK.TrackQuality() > REQUIRED_TRACK_QUALITY`（0.49，`processor/NAVAL_ASM_TACTICS.txt:67-76`）分支；`IsEngageable()` 需 `TRACK.SurfaceDomain()`（`:107-111`）。驱逐舰为指挥官（`PLATFORM==PLATFORM.Commander()`）故可直接交战。

4. **发射通报（发射→派 Update）**：ASM 满足包线/质量后 `FireAt` 发射。驱逐舰 `weapon asm` 有 `internal_link 3rd_party_mgr`（`platform/RED_MISSILE_DESTROYER.txt:96`），发射产生的 `WEAPON_FIRED` 状态消息进入 `3rd_party_mgr`（`ANNOUNCE_LAUNCH_TACTICS`）。其 `on_message` 读 `message.RequestId()` 从 `MasterTrackList` 找到目标航迹，写 `aux_data "weapon_platform"=<导弹平台名>`，再遍历指挥链下属，对 `Type()=="RED_NAVAL_HELICOPTER"` 的下属 `AssignTask(newTrack, "Update", sub)`（`processor/ANNOUNCE_LAUNCH_TACTICS.txt:31-67`）。

5. **直升机中继制导（核心闭环）**：直升机 `inflight_update_mgr`（`INFLIGHT_UPDATE_TACTICS`）`on_initialize` 置 `UPLINK_COMM_NAME="uplink_radio"`、`WEAPON_COMM_NAME="uplink"`（`platform/RED_NAVAL_HELICOPTER.txt:54-59`）。收到 `WSF_TASK_ASSIGN_MESSAGE` 且 `TaskType=="Update"` 时，按 `weapon_platform` 找到导弹平台，记 `updateMap[平台索引]=TIME_NOW+WEAPON_UPDATE_INTERVAL(60s)`，并在本地航迹表找到同 `weapon_platform` 辅助数据的航迹存入 `weaponMap`（`processor/INFLIGHT_UPDATE_TACTICS.txt:45-69`）。`on_update`（`update_interval 5.0 sec`）周期检查：时间到且目标仍存活，则 `UpdateWeapon()` 构造 `WsfTrackMessage`，经 `PLATFORM.Comm("uplink_radio")` `SendMessage` 到 `aWeapon.Comm("uplink")`（`:37-43`、`:71-93`），导弹 `comm uplink` 的 `internal_link data_mgr`（`weapon/RED_ASM_MSL.txt:40-42`）把航迹送入弹上 `data_mgr`。

6. **弹上 ASM 三态**：导弹 `task_mgr`（`ASM_TACTICS`）以 1 秒间隔推进。`ENROUTE` 入态即转向目标并爬升至 `CRUISE_ALT=25m`，当 `GroundRangeTo(TRACK) < SEEKER_ACTIVATION(11000m)` 时用 `seeker`（`RED_MISSILE_SEEKER_1`）`StartTracking` 转入 `ACQUIRING_TARGET`；待 `TrackQuality()>0.95` 转 `TERMINAL`，降至 `TERMINAL_ALT=6m` 持续指向目标（`processor/ASM_TACTICS.txt:36-83`，参数见 `weapon/RED_ASM_MSL.txt:48-56`）。全程中继航迹不断修正导弹目标位置，直到导引头自行截获。

7. **命中/脱靶**：导弹 `WSF_GROUND_TARGET_FUSE` `max_time_of_flight_to_detonate 392.0s`（120 km @ M0.9，`weapon/RED_ASM_MSL.txt:64-66`）触发，`RED_ASM_MSL_EFFECT` 以 `radius_and_pk 20.0m 0.75` 判定毁伤，产生 `WEAPON_HIT`/`WEAPON_MISSED` 事件（入口已 enable）。

### 2.6 关键脚本逻辑

**`processor/NAVAL_SAM_TACTICS.txt`（四态状态机 + 照射器分配，271 行）**：脚本变量（`:25-47`）定义 `USE_ILLUMINATOR=false`、`ENVELOPE="full_kinematic"`、`SENSOR_TRACK_MODE="TRACK"`、`REQUIRED_TRACK_QUALITY=0.49`、`SALVO_SIZE=2`。核心函数：`FiringNow()` 用 `WeaponsActiveFor>0` 判武器仍在飞；`InterceptResultsKnown()` 用 `TimeSinceWeaponLastTerminatedFor>0`；`InInterceptEnvelopeOf()` 外接 `Local_SAM_LaunchComputer`（`:60-64`）；`IlluminateTarget()`（`:67-89`）遍历平台传感器，对 `Type()==ILLUMINATOR_TYPE` 且未被分配的照射器 `StartTracking(TRACK,"Illuminate",sensor,ILLUMINATOR_MODE)` 分配照射；`HasAcquired()`=质量>0.75、`TrackingNow()` 在照射器模式下判 `Illuminate` 任务数>0，否则判质量>0.95（`:92-106`）；`LaunchWeapon()` 判武器开启、剩余弹≥`SALVO_SIZE` 后 `Fire(TRACK,"Shoot",weapon,SALVO_SIZE)`（`:110-131`）。四态（`:189-269`）：`DETECTED` 友军则 `CancelTask` 回自身，否则存活+非友+可交战→`ENGAGEABLE`；`ENGAGEABLE` 调 `Engage()`（无照射器时对 `SENSOR_NAME` 传感器 `StartTracking("Track")`）并等 `TrackingNow() && Track 任务>0`→`ENGAGE`；`ENGAGE` 满足存活+跟踪+未在射+在包线则 `LaunchWeapon()`→`FIRING`；`FIRING` 在目标死/出包线/无弹/失跟时 `CancelTask` 回 `ENGAGE`。照射器分配场景由 `RED_MISSILE_FRIGATE_TASK_MGR` 开启（`USE_ILLUMINATOR=true`、`ILLUMINATOR_TYPE="FRONT_DOME"`、`ENVELOPE="half_kinematic"`）。

**`processor/NAVAL_ASM_TACTICS.txt`（234 行）**：与 SAM 同构四态，差异点：`SALVO_SIZE=1`；`InInterceptEnvelopeOf` 接 `Local_ASM_LaunchComputer`；`LaunchWeapon()` 先 `weapon.CueToTarget(TRACK)` 再 `FireAt(...)`（`:92-93`）；`IsEngageable()` 追加 `TRACK.SurfaceDomain()`（`:107-111`）；`TrackingNow()` 在 `SENSOR_NAME==""` 时退化为质量>0.49（本案例驱逐舰 ASM 即走此分支，`:67-76`）。

**`processor/NAVAL_SSM_TACTICS.txt`（234 行）**：与 ASM 同构，差异：`InInterceptEnvelopeOf` 接 `Local_SSM_LaunchComputer`；`IsEngageable()` 判 `SurfaceDomain() || LandDomain()`（`:110`）。本案例 `MISSILE_SHIP` 未实例化，此处理器未投入运行。

**`processor/ASM_TACTICS.txt`（弹上三态，85 行）**：脚本变量 `CRUISE_ALT=50`、`TERMINAL_ALT=10`、`SEEKER_ACTIVATION=10000`（`:24-28`），实际被 `RED_ASM_MSL.txt:48-56` 覆盖为 25/6/11000。三态：`ENROUTE`（`:36-59`）入态转向+爬升，近程后启动导引头跟踪；`ACQUIRING_TARGET`（`:61-73`）质量>0.95 转末段降高；`TERMINAL`（`:75-83`）持续 `GoToLocation(目标, TERMINAL_ALT)` 直至命中/脱靶。

**`processor/ANNOUNCE_LAUNCH_TACTICS.txt`（71 行）**：`on_message` 只处理 `WSF_STATUS_MESSAGE` 且 `Status()=="WEAPON_FIRED"`，取 `message.Platform()` 得导弹平台、`message.RequestId()` 反查目标航迹，写 `aux_data "weapon_platform"`，遍历 `PLATFORM.CommandChainCount()` 与 `PLATFORM.Subordinates()`，对 `RED_NAVAL_HELICOPTER` 下属 `AssignTask("Update")`（`:31-67`）。变量 `REMOTE_UPDATE_PLATFORM_TYPE` 由平台 `on_initialize` 注入（`platform/RED_MISSILE_DESTROYER.txt:55-59`）。

**`processor/INFLIGHT_UPDATE_TACTICS.txt`（95 行）**：`update_interval 5.0 sec`；`WEAPON_UPDATE_INTERVAL=60.0`；`on_message` 收 `Update` 任务后建 `weaponMap`/`updateMap`；`on_update` 遍历 `updateMap` 到点即 `UpdateWeapon()`（构造 `WsfTrackMessage` 经 uplink 发给弹 uplink），随后顺延 60s；导弹失效则擦除两个 map 项（`:71-93`）。

**各 `launch_computer`**：`SAM_LaunchComputer`（`weapon/SAM_LaunchComputer.txt`）按平台类型分派 `RED_SR_SAM_1/2_LaunchComputer`；`Local_SAM_LaunchComputer` 按武器类型分派。`RED_SR_SAM_1_LaunchComputer` 硬编码 `maxRng=12000`、`maxTOF=25.0`、`avgSpd=480`，用 `InterceptLocation2D` 求拦截点，`tti∈(0,25)` 且 `WithinZoneOf(aLauncher,ENVELOPE)` 才可拦截（`:35-49`）；`RED_SR_SAM_2_LaunchComputer` 对应 40000/45.0（`:32-46`）。`RED_ASM_MSL_LaunchComputer`（120000/392.0）与 `SSM_MISSILE_LaunchComputer`（920000/692.0）不做包线判断、仅 `tti∈(0,maxTOF)` 即 `canIntercept=true`（`weapon/RED_ASM_MSL_LaunchComputer.txt:28-40`、`weapon/SSM_MISSILE_LaunchComputer.txt:28-40`）。

**`filter` / `track_manager` 配置**：`global_script.txt` 定义 `FILTER_TACTICS`（卡尔曼，测距 σ 50m、测角 σ 0.1°、过程噪声 XYZ 50/50/30）。各平台 `track_manager` 引用 `filter FILTER_TACTICS end_filter`（如 `platform/RED_MISSILE_DESTROYER.txt:68-70`、`platform/RED_NAVAL_HELICOPTER.txt:39-46`，直升机另加 `aux_data string weapon_platform=""` 供中继匹配用）。导弹侧 `SSM_MISSILE.txt:87-91` 给 `seeker` 覆写了更紧的滤波（测距 σ 0.5m、测角 σ 0.1°）。

### 2.7 可复用要点与陷阱

- **中继制导闭环的装配要点**：第三方更新闭环依赖四处联动——(1) 发射舰 `weapon` 的 `internal_link 3rd_party_mgr` 把 `WEAPON_FIRED` 导入 `ANNOUNCE_LAUNCH_TACTICS`；(2) `ANNOUNCE_LAUNCH_TACTICS` 用 `RequestId()` 反查航迹并写 `aux_data "weapon_platform"`；(3) 直升机 `track_manager` 预声明 `aux_data string weapon_platform`（`platform/RED_NAVAL_HELICOPTER.txt:42-45`）才能匹配航迹；(4) `INFLIGHT_UPDATE_TACTICS` 需 `UPLINK_COMM_NAME/WEAPON_COMM_NAME` 与弹上 `comm uplink` 命名一致。
- **搜索雷达域过滤的“分工”陷阱**：驱逐舰 `RICE_SCREEN` 与护卫舰 `TOP_PLATE` 都 `ignore_domain surface`，故水面目标只能由直升机对海搜索雷达发现——这是中继制导存在的根本原因；复用时若去掉 `ignore_domain surface` 会破坏该设计意图。
- **照射器是 `transmit_only`**：`FRONT_DOME` 只有发射无接收（`sensor/FRONT_DOME.txt:46`），`reports_range` 仅为满足初始化；SAM 半主动照射依赖它与 SAM 火控跟踪配合，切勿把它当完整跟踪雷达使用。
- **弹上参数被覆盖**：`ASM_TACTICS` 默认 `CRUISE_ALT=50`、`SEEKER_ACTIVATION=10000`、`TERMINAL_ALT=10`，实际以 `RED_ASM_MSL.txt` 的 `on_initialize` 覆盖值 25/11000/6 为准，读代码时勿照抄默认值。
- **发射计算机硬编码**：各 `*_LaunchComputer` 的 `maxRng/maxTOF/avgSpd` 是手写常量（非从武器 aero 推得），且 SAM 走 `WithinZoneOf` 包线、ASM/SSM 只判飞行时间窗口，修改武器性能时须同步改这里。
- **重复 `end_time`**：入口 `ship_ad.txt:81-82` 保留源文件两行 `end_time`，AFSIM 取后值 1.5 hours；自动化解析“仿真时长”时应取最后一个而非第一个。
- **定义但未实例化**：`MISSILE_SHIP`/`SSM_MISSILE` 及 `NAVAL_SSM_TACTICS` 全套已定义但 `side/*.txt` 未实例化，属源 demo 为 2nd/3rd 入口预留；分析“参战兵力”必须以 `side/blue.txt`、`side/red.txt` 的 `platform` 实例为准。
- **靶舰被动化**：`side/red.txt:11-13` 把护卫舰 `top_plate` 关掉，红方在本案例不构成防空对抗，只是 ASM 的靶子；若要复现“舰舰对抗”需恢复其搜索雷达。
- **毁伤演示特例**：`SSM_MISSILE_EFFECT` 的 `radius_and_pk 20.0m 1.0` 注释明示“仅为演示置 1”，正式建模不应照搬。

---

## 3. 完整脚本全文

> 文件顺序 = **装配顺序**（入口 → 根文件 → 组件自下而上 → `platform_type` → `side/` 实例 → 非 AFSIM 文件）。
> 共 58 个文件、3,031 行；正文与归一化工程**逐行一致**（文档内行尾统一为 LF；源为 CRLF 的文件在文档中即表现为 LF）。

### ===== FILE: ship_ad.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************

define_path_variable CASE ship_ad
log_file output/$(CASE).log

file_path .

include_once event_pipe.txt
include_once global_env.txt
include_once global_route.txt
include_once global_script.txt
include_once setup.txt
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
   enable JAMMING_ATTEMPT
   #enable LOCAL_TRACK_CORRELATION
   #enable LOCAL_TRACK_DECORRELATION
   enable LOCAL_TRACK_INITIATED
   #enable LOCAL_TRACK_UPDATED
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
   #enable SENSOR_TRACK_UPDATED
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
end_event_output

event_output  file   output/$(CASE).evt end_event_output
event_pipe    file   output/$(CASE).aer end_event_pipe

end_time 1 hrs
end_time 1.5 hours
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

#----------------------------------------------------------------------
# This file should be included first in each of the main input files.
# It includes all of the 'type' definitions as well as the core zone
# definitions
#----------------------------------------------------------------------

# include common type definitions

include_once platform/RED_MISSILE_DESTROYER.txt
include_once platform/RED_MISSILE_FRIGATE.txt
include_once platform/MISSILE_SHIP.txt
include_once platform/RED_NAVAL_HELICOPTER.txt
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

# common file for selecting which messages appear in the event pipe

event_pipe
   file replay.aer
   use_preset default
end_event_pipe
```

### ===== FILE: global_env.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************

# common terrain configuration

terrain
  #no terrain for now
end_terrain
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
route ASM_DUMMY
   label start
      offset 0 0 km speed 306 m/s altitude 50.0 m msl
      offset 1 0 km speed 306 m/s altitude 50.0 m msl
end_route
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
# --------------------------------------------------------------
#                         Filter tactics
# --------------------------------------------------------------

filter FILTER_TACTICS WSF_KALMAN_FILTER
   range_measurement_sigma       50. m
   bearing_measurement_sigma     0.1 deg
   elevation_measurement_sigma   0.1 deg

   # values for maneuvering targets (per Erik)
   process_noise_sigmas_XYZ  50 50 30
end_filter
```

### ===== FILE: config/run.json =====

```text
{"baseConfig":{"highPrecisionCounter":0,"multithreading":0,"pausetoadvancetime":1,"propulsionMethod":2,"recordAer":1,"recordEvent":0,"recordLog":1,"scenariosTime":{"continueTime":20,"startDate":"2026-10-16","startTime":"00:00:00"},"startMode":2,"stepValue":0.1,"terminalLog":1,"timeRate":1.0,"timeType":1},"scenariosId":0}
```

### ===== FILE: output/blank_empty.txt =====

```text
```

### ===== FILE: mover/RED_SR_SAM_1_AERO.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
aero RED_SR_SAM_1_AERO WSF_AERO
  # Values estimated from Hoerner's Drag book
   cd_zero_subsonic    0.30
   cd_zero_supersonic  0.50
   mach_begin_cd_rise  0.95
   mach_end_cd_rise    1.3
   mach_max_supersonic 2.3       # Ref 2
   reference_area      0.017 m2  # Ref 2 150mm body dia
   cl_max              3.5
end_aero
```

### ===== FILE: mover/RED_SR_SAM_2_AERO.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
aero RED_SR_SAM_2_AERO WSF_AERO
  # Values estimated from Hoerner's Drag book
   cd_zero_subsonic    0.30
   cd_zero_supersonic  0.50
   mach_begin_cd_rise  0.95
   mach_end_cd_rise    1.3
   supersonic_cd_slope -0.15     # required to reach max range
   mach_max_supersonic 4.0       # Ref 2
   reference_area      0.126 m2  # Ref 2 400mm body dia
   cl_max              7.5
end_aero
```

### ===== FILE: mover/SSM_MISSILE_AERO.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
aero SSM_MISSILE_AERO WSF_AERO
# Values estimated from Hoerners Drag book
   cd_zero_subsonic      0.21
   cd_zero_supersonic    0.29
   mach_begin_cd_rise    0.71
   mach_end_cd_rise      1.4
   supersonic_cd_slope   -0.05
   mach_max_supersonic   3
   reference_area        0.073 m2
   cl_max                2.0
end_aero


```

### ===== FILE: comm/RED_DATALINK.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
# --------------------------------------------------------------
#                         Red datalink
# --------------------------------------------------------------

comm RED_DATALINK WSF_COMM_TRANSCEIVER
   transfer_rate      100 mbits/sec
end_comm
```

### ===== FILE: sensor/FRONT_DOME.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
log version $Id: front_dome.txt,v 1.1.1.1 2008/07/28 15:09:03 m210650 Exp $

###############################################################################
#
#                               UNCLASSIFIED
#
#   Sources:
#
#     1.  www.sinodefence.com
#     2.  Jane's
#     3.  http://china-pla.blogspot.com/2007_10_01_archive.html
#     4.  http://www.kyes.com/antenna/navy/basics/antennas.htm
#
###############################################################################

antenna_pattern FRONT_DOME_ANTENNA
  sine_pattern
     peak_gain            39.8 db          # Ref 4 assuming 1.5 m diameter dish
     minimum_gain         -10 db           # unknown
     azimuth_beamwidth    1.8 deg          # Ref 4 est using 1.5 m diameter dish
     elevation_beamwidth  1.8 deg
  end_sine_pattern
end_antenna_pattern

sensor FRONT_DOME WSF_RADAR_SENSOR
  #show_calibration_data

  maximum_request_count          1

  frame_time                     1.0 sec       # unknown

  antenna_height                 20.0 m        # unknown

  slew_mode                      azimuth_and_elevation
  azimuth_slew_limits            -180.0 deg 180.0 deg
  elevation_slew_limits          0.0 deg 70.0 deg  # Ref 2

  transmit_only

  transmitter
     antenna_pattern             FRONT_DOME_ANTENNA
     power                       4.0 kw        # Ref 3
     frequency                   7000 mhz      # Ref 3 (C band)
  end_transmitter

  # false but it must report something to initialize
  reports_range
end_sensor
```

### ===== FILE: sensor/HELICOPTER_SURFACE_SEARCH_RADAR_1.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
log version $Id: helicopter_surface_search_radar_1.txt,v 1.1.1.1 2008/07/28 15:09:03 m210650 Exp $

###############################################################################
#
#                               UNCLASSIFIED
#
#   Sources:
#
#     1.  www.sinodefence.com
#     2.  Jane's
#     3.  http://www.stormpages.com/jetfight/helo/KLC-1.jpg
#     4.  http://en.wikipedia.org/wiki/AS_15_TT
#     5.  http://www.kyes.com/antenna/navy/basics/antennas.htm
#
#   Notes: Ref 4 claims range of 150 km for large vessel and 100 km for smaller
#          attack craft.  If one assume 30 dBsm for large vessel and 20 dBsm
#          for smaller attack craft, yields similar 1 m^2 detection of ~ 30 km
#
###############################################################################

antenna_pattern HELICOPTER_SURFACE_SEARCH_RADAR_1_ANTENNA
  sine_pattern
     peak_gain            32.0 db           # estimate using BWs (Ref 5)
     minimum_gain         -10 db            # unknown
     azimuth_beamwidth    3.0 deg           # Ref 2 lists resolution of 3 deg
     elevation_beamwidth  6.0 deg           # antenna roughly 1/2 tall as width
  end_sine_pattern
end_antenna_pattern

sensor HELICOPTER_SURFACE_SEARCH_RADAR_1 WSF_RADAR_SENSOR
  #show_calibration_data

  frame_time                     6.0 sec      # unknown

  one_m2_detect_range            30 km        # see note above
  maximum_range                  150 km       # see note above

  slew_mode                      azimuth_and_elevation
  azimuth_slew_limits            -60.0 deg 60.0 deg  # estimate from pic Ref 3
  elevation_slew_limits          -60.0 deg 60.0 deg  # estimate from pic Ref 3

  scan_mode                      azimuth_and_elevation
  azimuth_scan_limits            -60.0 deg 60.0 deg  # unknown
  elevation_scan_limits          -20.0 deg 0.0 deg   # unknown

  transmitter
     antenna_pattern             HELICOPTER_SURFACE_SEARCH_RADAR_1_ANTENNA
     power                       50.0 kw       # unknown
     frequency                   10000 mhz     # Ref 2 (X band)
     pulse_width                 1.0 usec      # unknown
     pulse_compression_ratio     15 absolute   # Ref 2 range resolution < 20 m
     pulse_repetition_frequency  400 hz        # unknown
  end_transmitter

  receiver
     antenna_pattern             HELICOPTER_SURFACE_SEARCH_RADAR_1_ANTENNA
     bandwidth                   15.0 mhz      # use inverse of compressed pulse width
  end_receiver

  hits_to_establish_track  3 5
  hits_to_maintain_track   1 3

  ignore_domain air
  ignore_domain subsurface
  ignore_domain space

  reports_range
  reports_bearing
  reports_elevation
  reports_velocity
  reports_iff
end_sensor
```

### ===== FILE: sensor/RED_MISSILE_SEEKER_1.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
log version $Id: red_missile_seeker_1.txt,v 1.1.1.1 2008/07/28 15:09:03 m210650 Exp $

###############################################################################
#
#                               UNCLASSIFIED
#
#                           RED_MISSILE_SEEKER_1
#
#   Sources:
#
#     1.  Jane's
#
###############################################################################

antenna_pattern RED_MISSILE_SEEKER_1_ANTENNA
  sine_pattern
     peak_gain            31 db            # computed using 420 mm dia & 9 GHz
     minimum_gain         -10 db           # unknown
     azimuth_beamwidth    4.6 deg          # 420 mm dia & 9 GHz
     elevation_beamwidth  4.6 deg          # 420 mm dia & 9 GHz
  end_sine_pattern
end_antenna_pattern

sensor RED_MISSILE_SEEKER_1 WSF_RADAR_SENSOR
  #show_calibration_data

  maximum_request_count          1

  frame_time                     1.0 sec       # unknown

  one_m2_detect_range            10 km         # unknown

  maximum_range                  60 km         # Ref 1

  slew_mode                      azimuth_and_elevation   # Ref 1
  azimuth_slew_limits            -45.0 deg 45.0 deg      # Ref 1
  elevation_slew_limits          -20.0 deg 10.0 deg      # Ref 1

  scan_mode                      azimuth_and_elevation
  azimuth_scan_limits            -45.0 deg 45.0 deg
  elevation_scan_limits          -20.0 deg 10.0 deg

  transmitter
     antenna_pattern             RED_MISSILE_SEEKER_1_ANTENNA
     power                       500 w         # unknown
     frequency                   9000 mhz      # assuming X-band
     pulse_width                 1.0 usec      # unknown
     pulse_repetition_frequency  3600 hz       # unknown
  end_transmitter

  receiver
     antenna_pattern             RED_MISSILE_SEEKER_1_ANTENNA
     bandwidth                   1.0 mhz       # use inverse of pulse width
  end_receiver

  hits_to_establish_track  2 2    # guess
  hits_to_maintain_track   1 3

  track_quality            1.0    # 'weapons' grade

  ignore_domain land
  ignore_domain air
  ignore_domain subsurface
  ignore_domain space

  reports_range
  reports_bearing
  reports_elevation
end_sensor
```

### ===== FILE: sensor/RICE_SCREEN.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
log version $Id: rice_screen.txt,v 1.1.1.1 2008/07/28 15:09:03 m210650 Exp $

###############################################################################
#
#                               UNCLASSIFIED
#
#   Sources:
#
#     1.  www.sinodefence.com
#     2.  Jane's
#     3.  http://en.wikipedia.org/wiki/Type_381_Radar
#     4.  http://www.kyes.com/antenna/navy/basics/antennas.htm
#
#
#   Notes: Ref 3 claims range of 100 km.  Since no associated RCS is listed,
#          assume 1 m^2
#
###############################################################################

antenna_pattern RICE_SCREEN_ANTENNA
  sine_pattern
     peak_gain  38.8 db                        # estimate using BWs
     minimum_gain -10 db                       # unknown
     azimuth_beamwidth  2.7 deg                # Ref 3
     elevation_beamwidth  1.4 deg              # Ref 3
  end_sine_pattern
end_antenna_pattern

sensor RICE_SCREEN WSF_RADAR_SENSOR
  #show_calibration_data

  frame_time  12.0 sec                         # Ref 3

  one_m2_detect_range            100 km

  antenna_height  20.0 m                       # unknown

  scan_mode                      azimuth_and_elevation
  azimuth_scan_limits            -180.0 deg 180.0 deg
  elevation_scan_limits          0.0 deg 30.0 deg  # unknown

  electronic_beam_steering       elevation

  transmitter
     antenna_pattern             RICE_SCREEN_ANTENNA
     antenna_tilt                10.0 deg      # estimate from picture
     power                       150.0 kw      # Ref 3
     frequency                   5000 mhz      # Ref 3 (C band)
     pulse_width                 40.0 usec     # Ref 3
     pulse_compression_ratio     40 absolute   # Ref 3
     pulse_repetition_frequency  370 hz        # Ref 3
  end_transmitter

  receiver
     antenna_pattern             RICE_SCREEN_ANTENNA
     antenna_tilt                10.0 deg
     bandwidth                   1.0 mhz       # use inverse of pulse width
  end_receiver

  hits_to_establish_track  3 5
  hits_to_maintain_track  1 3

  ignore_domain land
  ignore_domain surface
  ignore_domain subsurface
  ignore_domain space

  reports_range
  reports_bearing
  reports_elevation
  reports_iff
end_sensor
```

### ===== FILE: sensor/SR_SAM_FCR_1.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
log version $Id: sr_sam_fcr_1.txt,v 1.1.1.1 2008/07/28 15:09:03 m210650 Exp $

###############################################################################
#
#                               UNCLASSIFIED
#
#   Sources:
#
#     1.  www.sinodefence.com
#     2.  Jane's
#     3.  http://en.wikipedia.org/wiki/Type_345_Radar
#
#   Notes: Ref 3 claims range of 30 km vs fighter and 18 km vs ASM.
#          If one assume 1 m^2 for ASM and 6 m^2 for fighter, the resultant
#          one_m2_detect_range comes out about right for those two stated values
#
###############################################################################

antenna_pattern SR_SAM_FCR_1_ANTENNA
  sine_pattern
     peak_gain  43 db                          # Ref 3
     minimum_gain -10 db                       # unknown
     azimuth_beamwidth  1.5 deg                # Ref 3
     elevation_beamwidth  0.67 deg             # Ref 3
  end_sine_pattern
end_antenna_pattern

sensor SR_SAM_FCR_1 WSF_RADAR_SENSOR
  #show_calibration_data

  maximum_request_count          1

  frame_time  1.0 sec                          # unknown

  one_m2_detect_range            18 km

  antenna_height                 20.0 m        # unknown

  minimum_range                  350 m         # Ref 3
  maximum_range                  30 km         # Ref 3 (max tracking range)

  slew_mode                      azimuth_and_elevation
  azimuth_slew_limits            -180.0 deg 180.0 deg
  elevation_slew_limits          -25.0 deg 85.0 deg  # Ref 3

  transmitter
     antenna_pattern             SR_SAM_FCR_1_ANTENNA
     power                       30.0 kw       # Ref 3
     frequency                   18000 mhz     # Ref 3 (J band)
     pulse_width                 7.5 usec      # Ref 3
     pulse_repetition_frequency  3600 hz       # Ref 3
  end_transmitter

  receiver
     antenna_pattern             SR_SAM_FCR_1_ANTENNA
     bandwidth                   133.3 khz     # use inverse of pulse width
  end_receiver

  hits_to_establish_track  3 5                 # Ref 3 claims 2.8 sec for air target
                                               # and 1.7 sec for ASM
  hits_to_maintain_track   1 3

  track_quality            1.0    # 'weapons' grade

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

### ===== FILE: sensor/TOP_PLATE.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
log version $Id: top_plate.txt,v 1.1.1.1 2008/07/28 15:09:03 m210650 Exp $

###############################################################################
#
#                               UNCLASSIFIED
#
#   Sources:
#
#     1.  www.sinodefence.com
#     2.  Jane's
#     3.  http://www.kyes.com/antenna/navy/basics/antennas.htm
#
###############################################################################

antenna_pattern TOP_PLATE_ANTENNA
  sine_pattern
     peak_gain            39.9 db          # estimate using Ref 3
     minimum_gain         -10 db           # unknown
     azimuth_beamwidth    1.7 deg          # estimate using Ref 3
     elevation_beamwidth  1.7 deg          # estimate using Ref 3
  end_sine_pattern
end_antenna_pattern

sensor TOP_PLATE WSF_RADAR_SENSOR
  #show_calibration_data

  frame_time  4.0 sec                         # Ref 2

  # Ref 2 lists 30 km vs missile, 130 km vs fighter
  # assume 6 m^2 for fighter and missile is limited by clutter
  one_m2_detect_range            83 km

  antenna_height  20.0 m                       # unknown

  scan_mode                      azimuth_and_elevation
  azimuth_scan_limits            -180.0 deg 180.0 deg
  elevation_scan_limits          0.0 deg 55.0 deg  # Ref 2

  electronic_beam_steering       elevation

  transmitter
     antenna_pattern             TOP_PLATE_ANTENNA
     power                       30.0 kw       # Ref 2
     wavelength                  12 cm         # Ref 2 (12 or 15 cm)
     pulse_width                 40.0 usec     # using Rice Screen as surrogate
     pulse_compression_ratio     40 absolute   # using Rice Screen as surrogate
     pulse_repetition_frequency  370 hz        # using Rice Screen as surrogate
  end_transmitter

  receiver
     antenna_pattern             TOP_PLATE_ANTENNA
     bandwidth                   1.0 mhz       # use inverse of pulse width
  end_receiver

  hits_to_establish_track  3 5
  hits_to_maintain_track  1 3

  ignore_domain land
  ignore_domain surface
  ignore_domain subsurface
  ignore_domain space

  reports_range
  reports_bearing
  reports_elevation
  reports_iff
end_sensor
```

### ===== FILE: processor/NAVAL_SAM_TACTICS.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
# * * ************************************** * *
# *   ****** Demonstration input file ******   *
# *   ******      UNCLASSIFIED        ******   *
# * * ************************************** * *

# this file defines a task manager implementing generic
# naval sam engagement tactics

include_once weapon/SAM_LaunchComputer.txt

processor NAVAL_SAM_TACTICS WSF_TASK_PROCESSOR

   #script_debug_writes on
   #show_state_transitions
   #show_task_messages

   script_variables
      bool   USE_ILLUMINATOR           = false;
      string SENSOR_NAME;
      string ILLUMINATOR_TYPE;
      string ILLUMINATOR_MODE          = "default";
      string WEAPON_NAME;

      string ENVELOPE                  = "full_kinematic";

      # the following variable declares the name of the mode used for tracking
      string SENSOR_TRACK_MODE         = "TRACK";

      # the following variable declares the minimum track quality to
      # attempt to engage the target
      double REQUIRED_TRACK_QUALITY    = 0.49;

      int SALVO_SIZE                   = 2;

      # the following are used internally and should not be modified by the user
      string mTrackTaskStr      = "Track";
      string mIlluminateTaskStr = "Illuminate";
      string mShootTaskStr      = "Shoot";
   end_script_variables

   # returns true if weapon is still active for given track
   script bool FiringNow()
      return (WeaponsActiveFor(TRACK.TrackId()) > 0);
   end_script

   # return true if intercept results are known
   # (i.e. weapons have terminated for this TRACK)
   script bool InterceptResultsKnown()
      return (TimeSinceWeaponLastTerminatedFor(TRACK.TrackId()) > 0.0);
   end_script

   # return true if TRACK is inside the intercept envelope
   script bool InInterceptEnvelopeOf(WsfWeapon aWeapon, string aEnvelopeName)
      extern bool Local_SAM_LaunchComputer(WsfTrack, WsfWeapon, string, double);
      return Local_SAM_LaunchComputer(TRACK, aWeapon, aEnvelopeName, 0.0);
   end_script

   # update the pointing for any illuminators currently on
   script bool IlluminateTarget()
      # if already assigned, ignore
      if (TasksAssignedFor(TRACK.TrackId(), mIlluminateTaskStr) > 0) return false;

      bool illuminated=false;
      int numSensors = PLATFORM.SensorCount();
      int i;
      for (i = 0; i < numSensors; i = i + 1)
      {
         WsfSensor sensor = PLATFORM.SensorEntry(i);
         string sensorType = sensor.Type();
         if (sensorType == ILLUMINATOR_TYPE)
         {
            if (TasksAssignedTo(PLATFORM, mIlluminateTaskStr, sensor.Name()) < 1)
            {
               illuminated = StartTracking(TRACK, mIlluminateTaskStr,
                                           sensor, ILLUMINATOR_MODE);
               if (illuminated) break;
            }
         }
      }
      return illuminated;
   end_script

   # returns true if acq_radar is tracking
   script bool HasAcquired()
      return (TRACK.TrackQuality() > 0.75);
   end_script

   # returns true if TTR is tracking
   script bool TrackingNow()
      if (USE_ILLUMINATOR)
      {
         return (TasksAssignedFor(TRACK.TrackId(), mIlluminateTaskStr) > 0);
      }
      else
      {
         return (TRACK.TrackQuality() > 0.95);
      }
   end_script

   # select a weapon and launch it
   # the selected weapon must be available, have sufficient rounds and not busy
   script bool LaunchWeapon()
      WsfWeapon   weapon;
      weapon = PLATFORM.Weapon(WEAPON_NAME);
      bool canInterceptNow = false;
      if (weapon.IsTurnedOn() &&
          (weapon.QuantityRemaining() >= SALVO_SIZE))
      {
         canInterceptNow = InInterceptEnvelopeOf(weapon, ENVELOPE);
      }
      bool launched = false;
      if (canInterceptNow)
      {
         launched = Fire(TRACK, mShootTaskStr, weapon, SALVO_SIZE);
         if (launched)
         {
            writeln_d("*** T=", TIME_NOW, " ", PLATFORM.Name(), " ",
                      TRACK.TargetName(), " R=", PLATFORM.SlantRangeTo(TRACK),
                      " FIRE!!!!");
         }
      }
      return launched;
   end_script

   # returns true if the TRACK has been assigned or the system has
   # local engage authority
   script bool IsEngageable()
      return ((PLATFORM == PLATFORM.Commander()) ||
              (TasksReceivedFor(TRACK.TrackId()) > 0) ||
              (OperatingLevelFor("ENGAGE") > 0));
   end_script

   # determine the number of available weapons
   script int WeaponsAvailable()
      int quantity = 0;
      WsfWeapon weapon = PLATFORM.Weapon(WEAPON_NAME);
      if (weapon.IsTurnedOn())
      {
         quantity = weapon.QuantityRemaining();
      }
      return quantity;
   end_script

   # begin tracking the current target
   script bool Engage()
      bool engaging = false;
      if (WeaponsAvailable() < 1) return false;

      if (USE_ILLUMINATOR)
      {
         if (TRACK.BelievedAlive() &&
             InInterceptEnvelopeOf(PLATFORM.Weapon(WEAPON_NAME), ENVELOPE))
         {
            engaging = IlluminateTarget();
         }
      }
      else
      {
         WsfSensor sensor = PLATFORM.Sensor(SENSOR_NAME);
         if (! sensor.IsValid()) return engaging;

         # the system can only track so many targets
         if (sensor.ActiveRequestCount(SENSOR_TRACK_MODE) <
             sensor.MaximumRequestCount(SENSOR_TRACK_MODE))
         {
            if (TRACK.BelievedAlive() &&
                InInterceptEnvelopeOf(PLATFORM.Weapon(WEAPON_NAME), ENVELOPE) &&
                (TRACK.TrackQuality() > REQUIRED_TRACK_QUALITY))
            {
               // track the target
               engaging = StartTracking(TRACK, mTrackTaskStr, sensor, SENSOR_TRACK_MODE);
            }
         }
      }

      return engaging;
   end_script

# ------------------------------------------------------------------

   evaluation_interval DETECTED 2.0 sec
   state DETECTED
      next_state DETECTED
         if (TRACK.IFF_Friend())
         {
            # cancel any tasks assigned against this track
            CancelTask(TRACK.TrackId());
            return true;
         }
         return false;
      end_next_state

      next_state ENGAGEABLE
         return (TRACK.BelievedAlive() &&
                 (! TRACK.IFF_Friend()) &&
                 IsEngageable());
      end_next_state
   end_state

   evaluation_interval ENGAGEABLE 2.0 sec
   state ENGAGEABLE
      next_state DETECTED
         return (TRACK.BelievedDead() ||
                 TRACK.IFF_Friend() ||
                 ((TasksAssignedFor(TRACK.TrackId(), "ENGAGE") < 1) &&
                  (! IsEngageable())));
      end_next_state

      next_state ENGAGE
         Engage();

         # wait until tracking target
         if (USE_ILLUMINATOR)
         {
            return TrackingNow();
         }
         else
         {
            return (TrackingNow() &&
                    (TasksAssignedFor(TRACK.TrackId(), mTrackTaskStr) > 0));
         }
      end_next_state
   end_state

   evaluation_interval ENGAGE 2.0 sec
   state ENGAGE
      next_state ENGAGEABLE
         return (TRACK.BelievedDead() ||
                 ! TrackingNow());
      end_next_state

      next_state FIRING
         bool launched = false;

         if (TRACK.BelievedAlive() &&
             TrackingNow() &&
             ! FiringNow() &&
             InInterceptEnvelopeOf(PLATFORM.Weapon(WEAPON_NAME), ENVELOPE))
         {
            launched = LaunchWeapon();
         }
         return launched;
      end_next_state
   end_state

   evaluation_interval FIRING 2.0 sec
   state FIRING
      next_state ENGAGE
         if (TRACK.BelievedDead() ||
             ! InInterceptEnvelopeOf(PLATFORM.Weapon(WEAPON_NAME), ENVELOPE) ||
             (! FiringNow() &&
             (TasksAssignedFor(TRACK.TrackId(), mShootTaskStr) < 1)) ||
             (WeaponsAvailable() < 1) ||
             ! TrackingNow())
         {
            CancelTask(TRACK.TrackId());
            return true;
         }
         return false;
      end_next_state
   end_state

end_processor
```

### ===== FILE: processor/NAVAL_ASM_TACTICS.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
# * * ************************************** * *
# *   ****** Demonstration input file ******   *
# *   ******      UNCLASSIFIED        ******   *
# * * ************************************** * *

# this file defines a task manager implementing generic
# naval sam engagement tactics
script_interface
  # debug
end_script_interface

include_once weapon/ASM_LaunchComputer.txt

processor NAVAL_ASM_TACTICS WSF_TASK_PROCESSOR

   #script_debug_writes on
   #show_state_transitions
   #show_task_messages

   script_variables
      string SENSOR_NAME               = "";
      string SENSOR_TRACK_MODE         = "TRACK";
      string WEAPON_NAME               = "";

      # the following variable declares the minimum track quality to
      # attempt to engage the target
      double REQUIRED_TRACK_QUALITY    = 0.49;

      int SALVO_SIZE                   = 1;

      # the following are used internally and should not be modified by the user
      string mTrackTaskStr      = "Track";
      string mShootTaskStr      = "Shoot";
   end_script_variables

   # returns true if weapon is still active for given track
   script bool FiringNow()
      return (WeaponsActiveFor(TRACK.TrackId()) > 0);
   end_script

   # return true if intercept results are known
   # (i.e. weapons have terminated for this TRACK)
   script bool InterceptResultsKnown()
      return (TimeSinceWeaponLastTerminatedFor(TRACK.TrackId()) > 0.0);
   end_script

   # return true if TRACK is inside the intercept envelope
   script bool InInterceptEnvelopeOf(WsfWeapon aWeapon)
      extern bool Local_ASM_LaunchComputer(WsfTrack, WsfWeapon, double);
      return Local_ASM_LaunchComputer(TRACK, aWeapon, 0.0);
   end_script

   # returns true if acq_radar is tracking
   script bool HasAcquired()
      return (TRACK.TrackQuality() > 0.75);
   end_script

   # returns true if TTR is tracking
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

   # select a weapon and launch it
   # the selected weapon must be available, have sufficient rounds and not busy
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
         weapon.CueToTarget(TRACK);
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

   # returns true if the TRACK has been assigned or the system has
   # local engage authority
   script bool IsEngageable()
      return (((PLATFORM == PLATFORM.Commander()) ||
               (TasksReceivedFor(TRACK.TrackId()) > 0) ||
               (OperatingLevelFor("ENGAGE") > 0))) &&
              (TRACK.SurfaceDomain());
   end_script

   # determine the number of available weapons
   script int WeaponsAvailable()
      int quantity = 0;
      WsfWeapon weapon = PLATFORM.Weapon(WEAPON_NAME);
      if (weapon.IsTurnedOn())
      {
         quantity = weapon.QuantityRemaining();
      }
      return quantity;
   end_script

   # begin tracking the current target
   script bool Engage()
      bool engaging = false;
      if (WeaponsAvailable() < 1) return false;

      WsfSensor sensor = PLATFORM.Sensor(SENSOR_NAME);
      if (! sensor.IsValid()) return engaging;

      # the system can only track so many targets
      if (sensor.ActiveRequestCount(SENSOR_TRACK_MODE) <
          sensor.MaximumRequestCount(SENSOR_TRACK_MODE))
      {
         if (TRACK.BelievedAlive() &&
             InInterceptEnvelopeOf(PLATFORM.Weapon(WEAPON_NAME)) &&
             (TRACK.TrackQuality() > REQUIRED_TRACK_QUALITY))
         {
            // track the target
            engaging = StartTracking(TRACK, mTrackTaskStr, sensor, SENSOR_TRACK_MODE);
         }
      }

      return engaging;
   end_script

# ------------------------------------------------------------------

   evaluation_interval DETECTED 2.0 sec
   state DETECTED
      next_state DETECTED
         if (TRACK.IFF_Friend())
         {
            # cancel any tasks assigned against this track
            CancelTask(TRACK.TrackId());
            return true;
         }
         return false;
      end_next_state

      next_state ENGAGEABLE
         return (TRACK.BelievedAlive() &&
                 (! TRACK.IFF_Friend()) &&
                 IsEngageable());
      end_next_state
   end_state

   evaluation_interval ENGAGEABLE 2.0 sec
   state ENGAGEABLE
      next_state DETECTED
         return (TRACK.BelievedDead() ||
                 TRACK.IFF_Friend() ||
                 ((TasksAssignedFor(TRACK.TrackId(), "ENGAGE") < 1) &&
                  (! IsEngageable())));
      end_next_state

      next_state ENGAGE
         Engage();

         # wait until tracking target
         if (SENSOR_NAME == "")
         {
            return (TRACK.BelievedAlive() &&
                    InInterceptEnvelopeOf(PLATFORM.Weapon(WEAPON_NAME)) &&
                    (TRACK.TrackQuality() > REQUIRED_TRACK_QUALITY));
         }
         else
         {
            return (TrackingNow() &&
                    (TasksAssignedFor(TRACK.TrackId(), mTrackTaskStr) > 0));
         }
      end_next_state
   end_state

   evaluation_interval ENGAGE 2.0 sec
   state ENGAGE
      next_state ENGAGEABLE
         return (TRACK.BelievedDead() ||
                 ! TrackingNow());
      end_next_state

      next_state FIRING
         bool launched = false;

         if (TRACK.BelievedAlive() &&
             TrackingNow() &&
             ! FiringNow() &&
             InInterceptEnvelopeOf(PLATFORM.Weapon(WEAPON_NAME)))
         {
            launched = LaunchWeapon();
         }
         return launched;
      end_next_state
   end_state

   evaluation_interval FIRING 2.0 sec
   state FIRING
      next_state ENGAGE
         if (TRACK.BelievedDead() ||
             ! InInterceptEnvelopeOf(PLATFORM.Weapon(WEAPON_NAME)) ||
             (! FiringNow() &&
             (TasksAssignedFor(TRACK.TrackId(), mShootTaskStr) < 1)) ||
             (WeaponsAvailable() < 1) ||
             ! TrackingNow())
         {
            CancelTask(TRACK.TrackId());
            return true;
         }
         return false;
      end_next_state
   end_state

end_processor
```

### ===== FILE: processor/NAVAL_SSM_TACTICS.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
# * * ************************************** * *
# *   ****** Demonstration input file ******   *
# *   ******      UNCLASSIFIED        ******   *
# * * ************************************** * *

# this file defines a task manager implementing generic
# naval sam engagement tactics
script_interface
  # debug
end_script_interface

include_once weapon/SSM_LaunchComputer.txt

processor NAVAL_SSM_TACTICS WSF_TASK_PROCESSOR

   #script_debug_writes on
   #show_state_transitions
   #show_task_messages

   script_variables
      string SENSOR_NAME               = "";
      string SENSOR_TRACK_MODE         = "TRACK";
      string WEAPON_NAME               = "";

      # the following variable declares the minimum track quality to
      # attempt to engage the target
      double REQUIRED_TRACK_QUALITY    = 0.49;

      int SALVO_SIZE                   = 1;

      # the following are used internally and should not be modified by the user
      string mTrackTaskStr      = "Track";
      string mShootTaskStr      = "Shoot";
   end_script_variables

   # returns true if weapon is still active for given track
   script bool FiringNow()
      return (WeaponsActiveFor(TRACK.TrackId()) > 0);
   end_script

   # return true if intercept results are known
   # (i.e. weapons have terminated for this TRACK)
   script bool InterceptResultsKnown()
      return (TimeSinceWeaponLastTerminatedFor(TRACK.TrackId()) > 0.0);
   end_script

   # return true if TRACK is inside the intercept envelope
   script bool InInterceptEnvelopeOf(WsfWeapon aWeapon)
      extern bool Local_SSM_LaunchComputer(WsfTrack, WsfWeapon, double);
      return Local_SSM_LaunchComputer(TRACK, aWeapon, 0.0);
   end_script

   # returns true if acq_radar is tracking
   script bool HasAcquired()
      return (TRACK.TrackQuality() > 0.75);
   end_script

   # returns true if TTR is tracking
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

   # select a weapon and launch it
   # the selected weapon must be available, have sufficient rounds and not busy
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
         weapon.CueToTarget(TRACK);
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

   # returns true if the TRACK has been assigned or the system has
   # local engage authority
   script bool IsEngageable()
      return (((PLATFORM == PLATFORM.Commander()) ||
               (TasksReceivedFor(TRACK.TrackId()) > 0) ||
               (OperatingLevelFor("ENGAGE") > 0))) &&
              (TRACK.SurfaceDomain() || TRACK.LandDomain());
   end_script

   # determine the number of available weapons
   script int WeaponsAvailable()
      int quantity = 0;
      WsfWeapon weapon = PLATFORM.Weapon(WEAPON_NAME);
      if (weapon.IsTurnedOn())
      {
         quantity = weapon.QuantityRemaining();
      }
      return quantity;
   end_script

   # begin tracking the current target
   script bool Engage()
      bool engaging = false;
      if (WeaponsAvailable() < 1) return false;

      WsfSensor sensor = PLATFORM.Sensor(SENSOR_NAME);
      if (! sensor.IsValid()) return engaging;

      # the system can only track so many targets
      if (sensor.ActiveRequestCount(SENSOR_TRACK_MODE) <
          sensor.MaximumRequestCount(SENSOR_TRACK_MODE))
      {
         if (TRACK.BelievedAlive() &&
             InInterceptEnvelopeOf(PLATFORM.Weapon(WEAPON_NAME)) &&
             (TRACK.TrackQuality() > REQUIRED_TRACK_QUALITY))
         {
            // track the target
            engaging = StartTracking(TRACK, mTrackTaskStr, sensor, SENSOR_TRACK_MODE);
         }
      }

      return engaging;
   end_script

# ------------------------------------------------------------------

   evaluation_interval DETECTED 2.0 sec
   state DETECTED
      next_state DETECTED
         if (TRACK.IFF_Friend())
         {
            # cancel any tasks assigned against this track
            CancelTask(TRACK.TrackId());
            return true;
         }
         return false;
      end_next_state

      next_state ENGAGEABLE
         return (TRACK.BelievedAlive() &&
                 (! TRACK.IFF_Friend()) &&
                 IsEngageable());
      end_next_state
   end_state

   evaluation_interval ENGAGEABLE 2.0 sec
   state ENGAGEABLE
      next_state DETECTED
         return (TRACK.BelievedDead() ||
                 TRACK.IFF_Friend() ||
                 ((TasksAssignedFor(TRACK.TrackId(), "ENGAGE") < 1) &&
                  (! IsEngageable())));
      end_next_state

      next_state ENGAGE
         Engage();

         # wait until tracking target
         if (SENSOR_NAME == "")
         {
            return (TRACK.BelievedAlive() &&
                    InInterceptEnvelopeOf(PLATFORM.Weapon(WEAPON_NAME)) &&
                    (TRACK.TrackQuality() > REQUIRED_TRACK_QUALITY));
         }
         else
         {
            return (TrackingNow() &&
                    (TasksAssignedFor(TRACK.TrackId(), mTrackTaskStr) > 0));
         }
      end_next_state
   end_state

   evaluation_interval ENGAGE 2.0 sec
   state ENGAGE
      next_state ENGAGEABLE
         return (TRACK.BelievedDead() ||
                 ! TrackingNow());
      end_next_state

      next_state FIRING
         bool launched = false;

         if (TRACK.BelievedAlive() &&
             TrackingNow() &&
             ! FiringNow() &&
             InInterceptEnvelopeOf(PLATFORM.Weapon(WEAPON_NAME)))
         {
            launched = LaunchWeapon();
         }
         return launched;
      end_next_state
   end_state

   evaluation_interval FIRING 2.0 sec
   state FIRING
      next_state ENGAGE
         if (TRACK.BelievedDead() ||
             ! InInterceptEnvelopeOf(PLATFORM.Weapon(WEAPON_NAME)) ||
             (! FiringNow() &&
             (TasksAssignedFor(TRACK.TrackId(), mShootTaskStr) < 1)) ||
             (WeaponsAvailable() < 1) ||
             ! TrackingNow())
         {
            CancelTask(TRACK.TrackId());
            return true;
         }
         return false;
      end_next_state
   end_state

end_processor
```

### ===== FILE: processor/ASM_TACTICS.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
# * * ************************************** * *
# *   ****** Demonstration input file ******   *
# *   ******      UNCLASSIFIED        ******   *
# * * ************************************** * *

# this file defines a task manager implementing generic
# anti-ship missile engagement tactics

processor ASM_TACTICS WSF_TASK_PROCESSOR

   #script_debug_writes on
   #show_state_transitions
   #show_task_messages

   script_variables
      double CRUISE_ALT          = 50.0;
      double TERMINAL_ALT        = 10.0;
      double SEEKER_ACTIVATION   = 10000.0;
      string SENSOR_NAME;
      string SENSOR_TRACK_MODE   = "TRACK";

      # the following are used internally and should not be modified by the user
      string mTrackTaskStr      = "Track";
   end_script_variables

# ------------------------------------------------------------------

   evaluation_interval ENROUTE 1.0 sec
   state ENROUTE
      on_entry
         double heading = PLATFORM.TrueBearingTo(TRACK);
         PLATFORM.TurnToHeading(heading);
         PLATFORM.GoToAltitude(CRUISE_ALT);
      end_on_entry

      next_state ACQUIRING_TARGET
         PLATFORM.GoToLocation(TRACK.Latitude(),
                               TRACK.Longitude(),
                               CRUISE_ALT);
         bool tracking = false;
         if (PLATFORM.GroundRangeTo(TRACK) < SEEKER_ACTIVATION)
         {
            WsfSensor seeker = PLATFORM.Sensor(SENSOR_NAME);
            if (seeker.IsValid())
            {
               tracking = StartTracking(TRACK, mTrackTaskStr, seeker, SENSOR_TRACK_MODE);
            }
         }
         return tracking;
      end_next_state
   end_state

   evaluation_interval ACQUIRING_TARGET 1.0 sec
   state ACQUIRING_TARGET
      next_state TERMINAL
         bool terminal = false;
         if (TRACK.TrackQuality() > 0.95)
         {
            terminal = PLATFORM.GoToLocation(TRACK.Latitude(),
                                             TRACK.Longitude(),
                                             TERMINAL_ALT);
         }
         return terminal;
      end_next_state
   end_state

   evaluation_interval TERMINAL 1.0 sec
   state TERMINAL
      next_state TERMINAL
         PLATFORM.GoToLocation(TRACK.Latitude(),
                               TRACK.Longitude(),
                               TERMINAL_ALT);
         return false;
      end_next_state
   end_state

end_processor
```

### ===== FILE: processor/ANNOUNCE_LAUNCH_TACTICS.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
# * * ************************************** * *
# *   ****** Demonstration input file ******   *
# *   ******      UNCLASSIFIED        ******   *
# * * ************************************** * *

# this file defines a script processor that implements
# tactics that announce to subordinate when a weapon is launched
# that requires 3rd party updating

processor ANNOUNCE_LAUNCH_TACTICS WSF_TASK_PROCESSOR

   #script_debug_writes on
   #show_state_transitions
   #show_task_messages

   script_variables
      string REMOTE_UPDATE_PLATFORM_TYPE;

      # this should not be modified by user
      string mUpdateTaskStr = "Update";
   end_script_variables

   on_message
      type WSF_STATUS_MESSAGE
         script
            WsfStatusMessage message = (WsfStatusMessage)MESSAGE;
            if (message.Status() == "WEAPON_FIRED")
            {
               # get the explicit weapon platform that was created
               WsfPlatform weaponPlatform = message.Platform();

               # create a track to send as an assignment with the appropriate
               # aux data
               WsfTrackId trackId = message.RequestId();
               WsfTrack newTrack = PLATFORM.MasterTrackList().FindTrack(trackId);
               if (newTrack.IsValid())
               {
                  newTrack = WsfTrack(newTrack);
                  string name = weaponPlatform.Name();
                  newTrack.SetAuxData("weapon_platform", name);
                  writeln_d(" Assignment track aux data: ", newTrack.AuxDataString("weapon_platform"));

                  # assign the task
                  # loop on command chains platform belongs to
                  int i;
                  for (i=0; i < PLATFORM.CommandChainCount(); i = i + 1)
                  {
                     string chainName = PLATFORM.CommandChainEntry(i).Name();
                     foreach (WsfPlatform sub in PLATFORM.Subordinates())
                     {
                        if (sub.Type() == REMOTE_UPDATE_PLATFORM_TYPE)
                        {
                           bool assigned = AssignTask(newTrack, mUpdateTaskStr, sub);
                           if (assigned) break;
                        }
                     }
                  }
               }
            }
         end_script
   end_on_message

end_processor
```

### ===== FILE: processor/INFLIGHT_UPDATE_TACTICS.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
# * * ************************************** * *
# *   ****** Demonstration input file ******   *
# *   ******      UNCLASSIFIED        ******   *
# * * ************************************** * *

# this file defines a task manager implementing generic
# naval sam engagement tactics

processor INFLIGHT_UPDATE_TACTICS WSF_TASK_PROCESSOR

   update_interval 5.0 sec

   #script_debug_writes on
   #show_state_transitions
   #show_task_messages

   script_variables
      double WEAPON_UPDATE_INTERVAL = 60.0;
      string UPLINK_COMM_NAME;
      string WEAPON_COMM_NAME;

      # these variables are internal and should not be modified
      # by user
      string mUpdateTaskStr = "Update";
      Map<int, WsfTrack> weaponMap = Map<int, WsfTrack>();
      Map<int, double> updateMap = Map<int, double>();
   end_script_variables

   script void UpdateWeapon(WsfPlatform aWeapon, WsfTrack aTrack)
      WsfTrackMessage message = WsfTrackMessage();
      message.SetTrack(aTrack);
      WsfComm commDevice = PLATFORM.Comm(UPLINK_COMM_NAME);
      WsfComm weaponComm = aWeapon.Comm(WEAPON_COMM_NAME);
      commDevice.SendMessage(message, weaponComm);
   end_script

   on_message
      type WSF_TASK_ASSIGN_MESSAGE
         script
            WsfTaskAssignMessage message = (WsfTaskAssignMessage)MESSAGE;
            writeln_d("*** Task assigned.");
            if (message.TaskType() == mUpdateTaskStr)
            {
               string weaponPlatformName = message.Track().AuxDataString("weapon_platform");
               writeln_d("*** Task Track Aux Data: ", weaponPlatformName);
               WsfPlatform weapon = WsfSimulation.FindPlatform(weaponPlatformName);
               int platformIndex = weapon.Index();
               updateMap.Set(platformIndex, TIME_NOW + WEAPON_UPDATE_INTERVAL);

               # parse through local track list and find track with same aux field
               foreach (WsfTrack track in PLATFORM.MasterTrackList())
               {
                  if (track.AuxDataString("weapon_platform") == weaponPlatformName)
                  {
                     weaponMap.Set(platformIndex, track);
                     break;
                  }
               }
            }
         end_script
   end_on_message

   on_update
      foreach (int weaponIndex : double time in updateMap)
      {
         double timeToUpdate = updateMap.Get(weaponIndex);
         WsfPlatform weapon = WsfSimulation.FindPlatform(weaponIndex);
         # verify if weapon still exists
         if (weapon.IsValid())
         {
            WsfTrack track = weaponMap.Get(weaponIndex);
            if (track.BelievedAlive() &&
                (TIME_NOW > time))
            {
               UpdateWeapon(weapon, track);
               updateMap.Set(weaponIndex, TIME_NOW + WEAPON_UPDATE_INTERVAL);
            }
         }
         else
         {
            updateMap.Erase(weaponIndex);
            weaponMap.Erase(weaponIndex);
         }
      }
   end_on_update

end_processor
```

### ===== FILE: processor/MISSILE_SHIP_DATA_MGR.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
processor MISSILE_SHIP_DATA_MGR WSF_TRACK_PROCESSOR
   purge_interval            60 sec
end_processor
```

### ===== FILE: processor/MISSILE_SHIP_TASK_MGR.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
processor MISSILE_SHIP_TASK_MGR NAVAL_SAM_TACTICS
   on_initialize
      SENSOR_NAME       = "sr_sam_fcr_1";
      SENSOR_TRACK_MODE = "default";
      WEAPON_NAME       = "ssm";
   end_on_initialize
end_processor
```

### ===== FILE: processor/RED_MISSILE_DESTROYER_DATA_MGR.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
processor RED_MISSILE_DESTROYER_DATA_MGR WSF_TRACK_PROCESSOR
   purge_interval            60 sec
end_processor
```

### ===== FILE: processor/RED_MISSILE_DESTROYER_TASK_MGR.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
processor RED_MISSILE_DESTROYER_TASK_MGR NAVAL_SAM_TACTICS
   on_initialize
      SENSOR_NAME       = "sr_sam_fcr_1";
      SENSOR_TRACK_MODE = "default";
      WEAPON_NAME       = "sam";
   end_on_initialize
end_processor
```

### ===== FILE: processor/RED_MISSILE_FRIGATE_DATA_MGR.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
processor RED_MISSILE_FRIGATE_DATA_MGR WSF_TRACK_PROCESSOR
   purge_interval            60 sec
end_processor
```

### ===== FILE: processor/RED_MISSILE_FRIGATE_TASK_MGR.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
processor RED_MISSILE_FRIGATE_TASK_MGR NAVAL_SAM_TACTICS
   on_initialize
      USE_ILLUMINATOR   = true;
      ILLUMINATOR_TYPE  = "FRONT_DOME";
      ILLUMINATOR_MODE  = "default";
      WEAPON_NAME       = "sam";
      ENVELOPE          = "half_kinematic";
   end_on_initialize
end_processor
```

### ===== FILE: processor/RED_NAVAL_HELICOPTER_DATA_MGR.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
processor RED_NAVAL_HELICOPTER_DATA_MGR WSF_TRACK_PROCESSOR
   purge_interval            60 sec

   report_fused_tracks
   raw_track_reporting   false
end_processor
```

### ===== FILE: signatures/VEHICLE_RADAR_SIGNATURE.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
radar_signature     VEHICLE_RADAR_SIGNATURE
   constant  1 m^2
end_radar_signature
```

### ===== FILE: signatures/VEHICLE_INFRARED_SIGNATURE.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
# * * ************************************** * *
# *   ****** Demonstration input file ******   *
# *   ******      UNCLASSIFIED        ******   *
# * * ************************************** * *

# --------------------------------------------------------------
#                         Vehicle Signatures
# --------------------------------------------------------------
infrared_signature  VEHICLE_INFRARED_SIGNATURE
   constant  10 watts/steradian
end_infrared_signature
```

### ===== FILE: signatures/VEHICLE_OPTICAL_SIGNATURE.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
optical_signature   VEHICLE_OPTICAL_SIGNATURE
   constant  10 m^2
end_optical_signature
```

### ===== FILE: signatures/SHIP_RADAR_SIGNATURE.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
radar_signature     SHIP_RADAR_SIGNATURE
   constant  1000 m^2
end_radar_signature
```

### ===== FILE: signatures/SHIP_INFRARED_SIGNATURE.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
# --------------------------------------------------------------
#                         Ship Signatures
# --------------------------------------------------------------
infrared_signature  SHIP_INFRARED_SIGNATURE
   constant  10 watts/steradian
end_infrared_signature
```

### ===== FILE: signatures/SHIP_OPTICAL_SIGNATURE.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
optical_signature   SHIP_OPTICAL_SIGNATURE
   constant  300 m^2
end_optical_signature
```

### ===== FILE: weapon_effects/RED_ASM_MSL_EFFECT.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
weapon_effects RED_ASM_MSL_EFFECT WSF_GRADUATED_LETHALITY      # unknown
   radius_and_pk 20.0 m 0.75
end_weapon_effects
```

### ===== FILE: weapon_effects/RED_SR_SAM_1_EFFECT.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
weapon_effects RED_SR_SAM_1_EFFECT WSF_GRADUATED_LETHALITY      # unknown
   radius_and_pk 20.0 m 0.8
end_weapon_effects
```

### ===== FILE: weapon_effects/RED_SR_SAM_2_EFFECT.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
weapon_effects RED_SR_SAM_2_EFFECT WSF_GRADUATED_LETHALITY      # unknown
   radius_and_pk 17.0 m 0.8         # Ref 1 lethal radius for RED_SR_NAVAL_SAM_1
end_weapon_effects
```

### ===== FILE: weapon_effects/SSM_MISSILE_EFFECT.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
weapon_effects SSM_MISSILE_EFFECT WSF_GRADUATED_LETHALITY
    # radius_and_pk 20.0 m 0.8 # unknown
    radius_and_pk 20.0 m 1.0 # set to 1 only for demonstration purposes
end_weapon_effects


```

### ===== FILE: weapon/RED_ASM_MSL.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
include_once processor/ASM_TACTICS.txt
include_once sensor/RED_MISSILE_SEEKER_1.txt
include_once signatures/VEHICLE_RADAR_SIGNATURE.txt
include_once weapon_effects/RED_ASM_MSL_EFFECT.txt

log version $Id: red_asm_msl.txt,v 1.1.1.1 2008/07/28 15:09:03 m210650 Exp $

###############################################################################
#
#                               UNCLASSIFIED
#                             Anti-ship missile
#
#   Sources:
#
#     1.  www.sinodefence.com
#     2.  Jane's
#     3.  http://en.wikipedia.org/wiki/C-802
#     4.  http://en.wikipedia.org/wiki/P-15_Termit
#
###############################################################################

platform_type RED_ASM_MSL WSF_PLATFORM
  icon HARPOON
  radar_signature VEHICLE_RADAR_SIGNATURE
  mover WSF_AIR_MOVER
    #show_status
    default_dive_rate            27 m/s   # assume 5 degree dive
    default_radial_acceleration  2.0 g    # assume 2 g
    maximum_speed                306 m/s  # Ref 2 M0.9 @ sea level
  end_mover

  comm uplink WSF_COMM_TRANSCEIVER
     internal_link data_mgr
  end_comm

  processor data_mgr WSF_TRACK_PROCESSOR
     purge_interval   400 sec
  end_processor

  processor task_mgr ASM_TACTICS
     on_initialize
        CRUISE_ALT          = 25;     # Ref 2
        SENSOR_NAME         = "seeker";
        SENSOR_TRACK_MODE   = "default";
        SEEKER_ACTIVATION   = 11000;  # Ref 4 (using SS-N-2 Styx as surrogate)
        TERMINAL_ALT        = 6;      # Ref 2
     end_on_initialize
  end_processor

  sensor seeker RED_MISSILE_SEEKER_1    # using as surrogate
    off
    ignore_same_side
    processor data_mgr
  end_sensor

  processor fuse WSF_GROUND_TARGET_FUSE
    max_time_of_flight_to_detonate  392.0 sec            # 120 km @ M0.9
  end_processor
end_platform_type

weapon RED_ASM_MSL WSF_EXPLICIT_WEAPON
  launched_platform_type RED_ASM_MSL
  weapon_effects RED_ASM_MSL_EFFECT

  # due to complexities of modeling direction missile is released from platform,
  # point missile at target and rely on host platform to determine if with
  # angular LAR
  script void on_create(WsfPlatform aWeapon, WsfTrack aTrack)
     WsfRoute flight = aWeapon.CreateRoute("ASM_DUMMY");
     flight.Transform(aWeapon.Latitude(), aWeapon.Longitude(), aTrack.Bearing());
     aWeapon.FollowRoute(flight);
  end_script

  quantity 8

  slew_mode           azimuth
  azimuth_slew_limits -90.0 deg 90.0 deg
  pitch               15 deg   # Ref 2
end_weapon
```

### ===== FILE: weapon/RED_SR_SAM_1.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
include_once mover/RED_SR_SAM_1_AERO.txt
include_once weapon_effects/RED_SR_SAM_1_EFFECT.txt

log version $Id: red_sr_sam_1.txt,v 1.2 2010/12/07 13:39:52 m191713 Exp $

###############################################################################
#
#                               UNCLASSIFIED
#
#   Sources:
#
#     1.  www.sinodefence.com
#     2.  Jane's
#
#
###############################################################################

platform_type RED_SR_SAM_1 WSF_PLATFORM
  icon SA-8_Missile

  mover WSF_GUIDED_MOVER
    #show_status
    total_mass       84.5 kg     # Ref 2
    fuel_mass        25.45 kg    # Ref 2
    thrust           5200 lbf    # tuned for max speed
    thrust_duration  2.5 sec     # Ref 2 lists M2.3 in 2.5 sec
    update_interval  0.10 s
    aero             RED_SR_SAM_1_AERO
  end_mover

  comm uplink WSF_COMM_TRANSCEIVER
     internal_link data_mgr
  end_comm

  processor data_mgr WSF_WEAPON_TRACK_PROCESSOR
  end_processor

  processor computer WSF_GUIDANCE_COMPUTER
    proportional_navigation_gain  6.0
    velocity_pursuit_gain         6.0
    g_bias                        1.0
    maximum_commanded_g           25.0 g       # Ref 2
    update_interval               0.1 s
  end_processor

  processor fuse WSF_AIR_TARGET_FUSE
    max_time_of_flight_to_detonate  25.0 sec            # Ref 2 - max range of 12 km
  end_processor
end_platform_type

weapon RED_SR_SAM_1 WSF_EXPLICIT_WEAPON
   launched_platform_type RED_SR_SAM_1
   weapon_effects RED_SR_SAM_1_EFFECT

   quantity 8
   firing_delay           1.0 sec   # unknown
   salvo_interval         3.0 sec   # unknown

   slew_mode              azimuth_and_elevation
   azimuth_slew_limits    -180.0 deg 180.0 deg
   elevation_slew_limits  10.0 deg 80.0 deg  # allow some super-elevation for low-alt targets

   reload_threshold       0
   reload_increment       8
   reload_inventory       8
   reload_time            5 min   # Ref 2
   inhibit_while_reloading true
   #fire_inhibit_while_reloading #deprecated
end_weapon
```

### ===== FILE: weapon/RED_SR_SAM_2.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
include_once mover/RED_SR_SAM_2_AERO.txt
include_once weapon_effects/RED_SR_SAM_2_EFFECT.txt

log version $Id: red_sr_sam_2.txt,v 1.2 2010/12/07 13:39:52 m191713 Exp $

###############################################################################
#
#                               UNCLASSIFIED
#
#   Using data for RED_SR_NAVAL_SAM_1 and RED_SR_NAVAL_SAM_2
#
#   Sources:
#
#     1.  www.sinodefence.com
#     2.  Jane's
#     3.  http://china-pla.blogspot.com/2007_10_01_archive.html
#
#
###############################################################################

platform_type RED_SR_SAM_2 WSF_PLATFORM
  icon SA-11_Missile

  # Ref 2 lists max speed as 1.23 km/s; assume 15% longer burn time then RED_SR_NAVAL_SAM_1
  # Tuned stage 1 and stage 2 against 30kft target
  mover WSF_GUIDED_MOVER
    stage 1
       empty_mass        0.01 kg
       fuel_mass         265 kg
       thrust_duration   2.9 sec       # assuming 25% of total burn time
       specific_impulse  250 sec       # typical solid propellant
       aero              RED_SR_SAM_2_AERO
    end_stage

    stage 2
       total_mass        455 kg        # Ref 2 lists total missile mass of 720 kg
       fuel_mass         80 kg
       thrust_duration   9.8 sec
       specific_impulse  250 sec
       aero              RED_SR_SAM_2_AERO
    end_stage
  end_mover

  comm uplink WSF_COMM_TRANSCEIVER
     internal_link data_mgr
  end_comm

  processor data_mgr WSF_WEAPON_TRACK_PROCESSOR
  end_processor

  processor seeker WSF_PERFECT_TRACKER
     update_interval 1.0 sec
     internal_link data_mgr
  end_processor

  processor computer WSF_GUIDANCE_COMPUTER
    guide_to_truth                true
    proportional_navigation_gain  2.0
    velocity_pursuit_gain         1.0
    g_bias                        1.0
    maximum_commanded_g           23.0 g       # Ref 1
    update_interval               0.1 s
  end_processor

  processor fuse WSF_AIR_TARGET_FUSE
    max_time_of_flight_to_detonate  60.0 sec            # Ref 2 - max range of 40 km
  end_processor
end_platform_type

weapon RED_SR_SAM_2 WSF_EXPLICIT_WEAPON
   launched_platform_type RED_SR_SAM_2
   weapon_effects RED_SR_SAM_2_EFFECT

   quantity 32
   firing_delay           1.0 sec   # unknown
   salvo_interval         2.0 sec   # Ref 3
   firing_interval        2.0 sec   # Ref 3

   slew_mode              both
   azimuth_slew_limits    -180.0 deg 180.0 deg
   elevation_slew_limits  20 deg 89 deg
end_weapon
```

### ===== FILE: weapon/SSM_MISSILE.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
log version $Id: ssm_missile.txt,v 1.2 2010/12/07 13:39:53 m191713 Exp $

# include the sensor that goes on the missile
include_once sensor/RED_MISSILE_SEEKER_1.txt

# this is a totally made up missile

include_once mover/SSM_MISSILE_AERO.txt
include_once signatures/VEHICLE_RADAR_SIGNATURE.txt
include_once weapon_effects/SSM_MISSILE_EFFECT.txt

platform_type SSM_MISSILE WSF_PLATFORM
   icon Missile
   mover WSF_GUIDED_MOVER
      stage 1
      total_mass 1400.0 lbm
      fuel_mass 900.0 lbm
      thrust_duration 18.3 sec
      thrust 12500 lbf
      aero SSM_MISSILE_AERO
      end_stage
    end_mover

   radar_signature VEHICLE_RADAR_SIGNATURE

   comm uplink WSF_COMM_TRANSCEIVER
      internal_link data_mgr
   end_comm

   processor task_mgr WSF_TASK_PROCESSOR
   end_processor
   processor data_mgr WSF_TRACK_PROCESSOR
      purge_interval 400 seconds
   end_processor

   processor seeker WSF_PERFECT_TRACKER
      update_interval 0.5 sec
   end_processor

# vary the g bias and nav gain and the missile will
# obtain various flight profiles
   processor test WSF_SCRIPT_PROCESSOR
      execute at_time 2 min relative
         WsfProcessor computer = PLATFORM.Processor("computer");
         computer.ProcessInput("g_bias 2.0");
         computer.ProcessInput("proportional_navigation_gain 6.0");
      end_execute
      execute at_time 5.5 min relative
         WsfProcessor computer = PLATFORM.Processor("computer");
         computer.ProcessInput("g_bias 1.5");
      end_execute
   end_processor

   processor computer WSF_GUIDANCE_COMPUTER
       update_interval 0.1 sec
#       pitchover_guidance
       proportional_navigation_gain 8.0
       g_bias 3.0
#       loft_angle 35 deg
#       maximum_loft_time 11 sec
#       min_nav_gain 0.4
#       max_nav_gain 2.0
#       nav_gain_factor 3.0
#       frequency_cutoff 30000 hz
#       nav_gain_slope_1 1.e-4
#       nav_gain_slope_2 1.e-6
       guidance_delay 2 sec
       maximum_commanded_g 6.0 g
   end_processor

   processor fuse WSF_GROUND_TARGET_FUSE
      max_time_of_flight_to_detonate 680 sec
   end_processor

   sensor seeker  RED_MISSILE_SEEKER_1
      # on
      ignore_same_side
      processor data_mgr
      filter FILTER_TACTICS
         range_measurement_sigma 0.5 m
         bearing_measurement_sigma 0.1 deg
         elevation_measurement_sigma 0.1 deg
      end_filter
   end_sensor

   processor seeker_turn_on WSF_WEAPON_TRACK_PROCESSOR
     # switch_time 10 sec
     # turn_on_sensor seeker 80.0 sec after_launch
     turn_on_sensor seeker at_range 30000.0 m before_intercept
   end_processor
end_platform_type

weapon SSM_MISSILE WSF_EXPLICIT_WEAPON
   launched_platform_type SSM_MISSILE
   weapon_effects SSM_MISSILE_EFFECT
   quantity 1
   firing_delay 0.0 sec # unknown
   salvo_interval 2.0 sec # unknown
   slew_mode azimuth
   azimuth_slew_limits -180.0 deg 180.0 deg
   tilt 89.9 deg
   launch_delta_v 60.0 0.0 0.0 fps
end_weapon


```

### ===== FILE: weapon/ASM_LaunchComputer.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
# * * ************************************** * *
# *   ****** Demonstration input file ******   *
# *   ******      UNCLASSIFIED        ******   *
# * * ************************************** * *

# Launch/engagement computer

include_once weapon/RED_ASM_MSL_LaunchComputer.txt

script bool ASM_LaunchComputer(WsfTrack aTrack, WsfPlatform aAssignee, double aLaunchDelay)
   extern bool RED_ASM_MSL_LaunchComputer(WsfTrack, WsfPlatform, double);

   bool canIntercept = false;
   string subType = aAssignee.Type();
   if (subType == "RED_MISSILE_DESTROYER")
   {
      canIntercept = RED_ASM_MSL_LaunchComputer(aTrack, aAssignee, aLaunchDelay);
   }

   return canIntercept;
end_script


# -----------------------------------------------------------------------------

script bool Local_ASM_LaunchComputer(WsfTrack aTrack, WsfWeapon aWeapon, double aLaunchDelay)
   extern bool RED_ASM_MSL_LaunchComputer(WsfTrack, WsfPlatform, double);

   bool canIntercept = false;
   string weaponType = aWeapon.Type();
   WsfPlatform platform = aWeapon.Platform();
   if (weaponType == "RED_ASM_MSL")
   {
      canIntercept = RED_ASM_MSL_LaunchComputer(aTrack, platform, aLaunchDelay);
   }

   return canIntercept;
end_script
```

### ===== FILE: weapon/SAM_LaunchComputer.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
# * * ************************************** * *
# *   ****** Demonstration input file ******   *
# *   ******      UNCLASSIFIED        ******   *
# * * ************************************** * *

# Launch/engagement computer

include_once weapon/RED_SR_SAM_1_LaunchComputer.txt
include_once weapon/RED_SR_SAM_2_LaunchComputer.txt

script bool SAM_LaunchComputer(WsfTrack aTrack, WsfPlatform aAssignee, string aEnvelopeName, double aLaunchDelay)
   extern bool RED_SR_SAM_1_LaunchComputer(WsfTrack, WsfPlatform, string, double);
   extern bool RED_SR_SAM_2_LaunchComputer(WsfTrack, WsfPlatform, string, double);

   bool canIntercept = false;
   string subType = aAssignee.Type();
   if (subType == "RED_MISSILE_DESTROYER")
   {
      canIntercept = RED_SR_SAM_1_LaunchComputer(aTrack, aAssignee, aEnvelopeName, aLaunchDelay);
   }
   else if (subType == "RED_MISSILE_FRIGATE")
   {
      canIntercept = RED_SR_SAM_2_LaunchComputer(aTrack, aAssignee, aEnvelopeName, aLaunchDelay);
   }

   return canIntercept;
end_script


# -----------------------------------------------------------------------------

script bool Local_SAM_LaunchComputer(WsfTrack aTrack, WsfWeapon aWeapon, string aEnvelopeName, double aLaunchDelay)
   extern bool RED_SR_SAM_1_LaunchComputer(WsfTrack, WsfPlatform, string, double);

   bool canIntercept = false;
   string weaponType = aWeapon.Type();
   WsfPlatform platform = aWeapon.Platform();
   if (weaponType == "RED_SR_SAM_1")
   {
      canIntercept = RED_SR_SAM_1_LaunchComputer(aTrack, platform, aEnvelopeName, aLaunchDelay);
   }
   else if (weaponType == "RED_SR_SAM_2")
   {
      canIntercept = RED_SR_SAM_2_LaunchComputer(aTrack, platform, aEnvelopeName, aLaunchDelay);
   }

   return canIntercept;
end_script
```

### ===== FILE: weapon/SSM_LaunchComputer.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
# * * ************************************** * *
# *   ****** Demonstration input file ******   *
# *   ******      UNCLASSIFIED        ******   *
# * * ************************************** * *

# Launch/engagement computer

include_once weapon/SSM_MISSILE_LaunchComputer.txt

script bool SSM_LaunchComputer(WsfTrack aTrack, WsfPlatform aAssignee, double aLaunchDelay)
   extern bool SSM_MISSILE_LaunchComputer(WsfTrack, WsfPlatform, double);

   bool canIntercept = false;
   string subType = aAssignee.Type();
   if (subType == "MISSILE_SHIP")
   {
      canIntercept = SSM_MISSILE_LaunchComputer(aTrack, aAssignee, aLaunchDelay);
   }

   return canIntercept;
end_script


# -----------------------------------------------------------------------------

script bool Local_SSM_LaunchComputer(WsfTrack aTrack, WsfWeapon aWeapon, double aLaunchDelay)
   extern bool SSM_MISSILE_LaunchComputer(WsfTrack, WsfPlatform, double);

   bool canIntercept = false;
   string weaponType = aWeapon.Type();
   WsfPlatform platform = aWeapon.Platform();
   if (weaponType == "SSM_MISSILE")
   {
      canIntercept = SSM_MISSILE_LaunchComputer(aTrack, platform, aLaunchDelay);
   }

   return canIntercept;
end_script
```

### ===== FILE: weapon/RED_ASM_MSL_LaunchComputer.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
# * * ************************************** * *
# *   ****** Demonstration input file ******   *
# *   ******      UNCLASSIFIED        ******   *
# * * ************************************** * *

# Launch/engagement computer for the RED_ASM_MSL

script bool RED_ASM_MSL_LaunchComputer(WsfTrack aTrack,
                                 WsfPlatform aLauncher,
                                 double aLaunchDelay)

   bool canIntercept = false;

   # TODO assuming launcher at 0 alt.  need AGL of target
   double tgtAlt = aLauncher.RelativeAltitudeOf(aTrack);

   double shootDelay = 0.0;

   # simple wpn-spd data for now
   double maxRng = 120000;
   double maxTOF = 392.0;
   double avgSpd = maxRng / maxTOF;

   WsfWaypoint intercept = WsfWaypoint();
   double tti = aLauncher.InterceptLocation2D(aTrack, intercept, avgSpd,
aLaunchDelay + shootDelay);
   if ((tti > 0.0) && (tti < maxTOF))
   {
      canIntercept = true;
   }

   return canIntercept;
end_script
```

### ===== FILE: weapon/RED_SR_SAM_1_LaunchComputer.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
# * * ************************************** * *
# *   ****** Demonstration input file ******   *
# *   ******      UNCLASSIFIED        ******   *
# * * ************************************** * *

# Launch/engagement computer for the RED_SR_SAM_1
#script_interface
#  debug
#end_script_interface

script bool RED_SR_SAM_1_LaunchComputer(WsfTrack aTrack,
                                WsfPlatform aLauncher,
                                string aEnvelopeName,
                                double aLaunchDelay)

   bool canIntercept = false;

   # TODO assuming launcher at 0 alt.  need AGL of target
   double tgtAlt = aLauncher.RelativeAltitudeOf(aTrack);

   double maxTOF = 0.0;
   double avgSpd = 0.0;
   double maxRng = 0.0;
   double shootDelay = 0.0;

   # simple wpn-spd data for now
   maxRng = 12000;
   maxTOF = 25.0;
   avgSpd = 12000 / 25.0;

   WsfWaypoint intercept = WsfWaypoint();
   double tti = aLauncher.InterceptLocation2D(aTrack, intercept, avgSpd,
aLaunchDelay + shootDelay);
   if ((tti > 0.0) && (tti < maxTOF))
   {
      double lat = intercept.Latitude();
      double lon = intercept.Longitude();
      WsfGeoPoint point;
      point = point.Construct(lat, lon, tgtAlt);
      canIntercept = point.WithinZoneOf(aLauncher, aEnvelopeName);
   }

   return canIntercept;
end_script
```

### ===== FILE: weapon/RED_SR_SAM_2_LaunchComputer.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
# * * ************************************** * *
# *   ****** Demonstration input file ******   *
# *   ******      UNCLASSIFIED        ******   *
# * * ************************************** * *

# Launch/engagement computer for the RED_SR_SAM_2

script bool RED_SR_SAM_2_LaunchComputer(WsfTrack aTrack,
                                WsfPlatform aLauncher,
                                string aEnvelopeName,
                                double aLaunchDelay)

   bool canIntercept = false;

   # TODO assuming launcher at 0 alt.  need AGL of target
   double tgtAlt = aLauncher.RelativeAltitudeOf(aTrack);

   double maxTOF = 0.0;
   double avgSpd = 0.0;
   double maxRng = 0.0;
   double shootDelay = 0.0;

   # simple wpn-spd data for now
   maxRng = 40000;
   maxTOF = 45.0;  # est
   avgSpd = maxRng / maxTOF;

   WsfWaypoint intercept = WsfWaypoint();
   double tti = aLauncher.InterceptLocation2D(aTrack, intercept, avgSpd,
aLaunchDelay + shootDelay);
   if ((tti > 0.0) && (tti < maxTOF))
   {
      double lat = intercept.Latitude();
      double lon = intercept.Longitude();
      WsfGeoPoint point;
      point = point.Construct(lat, lon, tgtAlt);
      canIntercept = point.WithinZoneOf(aLauncher, aEnvelopeName);
   }

   return canIntercept;
end_script
```

### ===== FILE: weapon/SSM_MISSILE_LaunchComputer.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
# * * ************************************** * *
# *   ****** Demonstration input file ******   *
# *   ******      UNCLASSIFIED        ******   *
# * * ************************************** * *

# Launch/engagement computer for the RED_ASM_MSL

script bool SSM_MISSILE_LaunchComputer(WsfTrack aTrack,
                                 WsfPlatform aLauncher,
                                 double aLaunchDelay)

   bool canIntercept = false;

   # TODO assuming launcher at 0 alt.  need AGL of target
   double tgtAlt = aLauncher.RelativeAltitudeOf(aTrack);

   double shootDelay = 0.0;

   # simple wpn-spd data for now
   double maxRng = 920000;
   double maxTOF = 692.0;
   double avgSpd = maxRng / maxTOF;

   WsfWaypoint intercept = WsfWaypoint();
   double tti = aLauncher.InterceptLocation2D(aTrack, intercept, avgSpd,
aLaunchDelay + shootDelay);
   if ((tti > 0.0) && (tti < maxTOF))
   {
      canIntercept = true;
   }

   return canIntercept;
end_script
```

### ===== FILE: platform/MISSILE_SHIP.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
include_once processor/NAVAL_SAM_TACTICS.txt
include_once processor/NAVAL_ASM_TACTICS.txt
include_once processor/NAVAL_SSM_TACTICS.txt
include_once processor/ANNOUNCE_LAUNCH_TACTICS.txt
include_once processor/MISSILE_SHIP_DATA_MGR.txt
include_once processor/MISSILE_SHIP_TASK_MGR.txt
include_once sensor/RICE_SCREEN.txt
include_once sensor/SR_SAM_FCR_1.txt
include_once weapon/RED_SR_SAM_1.txt
include_once weapon/RED_ASM_MSL.txt
include_once weapon/SSM_MISSILE.txt
include_once comm/RED_DATALINK.txt
include_once signatures/SHIP_RADAR_SIGNATURE.txt

log version $Id: missile_ship.txt,v 1.1.1.1 2008/07/28 15:09:03 m210650 Exp $

#                               UNCLASSIFIED
#
# Made up missile ship with a radar and comm

platform_type MISSILE_SHIP WSF_PLATFORM
  icon jiangKai

  radar_signature SHIP_RADAR_SIGNATURE

  comm datalink RED_DATALINK
     network_name <local:master>
     internal_link data_mgr
     internal_link 3rd_party_mgr
  end_comm

  comm ssm_missile_uplink WSF_COMM_TRANSCEIVER
  end_comm

  processor data_mgr MISSILE_SHIP_DATA_MGR
  end_processor

  processor task_mgr MISSILE_SHIP_TASK_MGR
     operating_level ENGAGE 1
     weapon_uplink_path sr_sam_fcr_1 ssm_missile_uplink
  end_processor

  processor 3rd_party_mgr ANNOUNCE_LAUNCH_TACTICS
     on_initialize
        REMOTE_UPDATE_PLATFORM_TYPE = "RED_NAVAL_HELICOPTER";
     end_on_initialize
  end_processor

  processor ssm_task_mgr NAVAL_SSM_TACTICS
     operating_level ENGAGE 1
     on_initialize
        WEAPON_NAME          = "ssm";
     end_on_initialize
  end_processor

  track_manager
     filter FILTER_TACTICS end_filter
  end_track_manager

  mover WSF_SURFACE_MOVER
    maximum_speed  31 kts
  end_mover

  sensor rice_screen RICE_SCREEN
    on
    ignore_same_side
    internal_link data_mgr
  end_sensor

  sensor sr_sam_fcr_1 SR_SAM_FCR_1
    off
    ignore_same_side
    internal_link data_mgr
  end_sensor

  weapon ssm SSM_MISSILE
    location 0 0 -5 m
    quantity      16
    internal_link 3rd_party_mgr
    ignore_launch_platform_velocity true # ignore the movement of the ship
  end_weapon

  zone full_kinematic
     circular
        maximum_altitude 5 km
        maximum_radius   350 km
  end_zone

end_platform_type
```

### ===== FILE: platform/RED_MISSILE_DESTROYER.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
include_once processor/NAVAL_SAM_TACTICS.txt
include_once processor/NAVAL_ASM_TACTICS.txt
include_once processor/ANNOUNCE_LAUNCH_TACTICS.txt
include_once processor/RED_MISSILE_DESTROYER_DATA_MGR.txt
include_once processor/RED_MISSILE_DESTROYER_TASK_MGR.txt
include_once sensor/RICE_SCREEN.txt
include_once sensor/SR_SAM_FCR_1.txt
include_once weapon/RED_SR_SAM_1.txt
include_once weapon/RED_ASM_MSL.txt
include_once comm/RED_DATALINK.txt
include_once signatures/SHIP_RADAR_SIGNATURE.txt

log version $Id: red_missile_destroyer.txt,v 1.1.1.1 2008/07/28 15:09:03 m210650 Exp $

###############################################################################
#
#                               UNCLASSIFIED
#
#   Sources:
#
#     1.  www.sinodefence.com
#
###############################################################################

platform_type RED_MISSILE_DESTROYER WSF_PLATFORM
  icon jiangKai

  radar_signature SHIP_RADAR_SIGNATURE

  comm datalink RED_DATALINK
     network_name <local:master>
     internal_link data_mgr
     internal_link 3rd_party_mgr
  end_comm

  comm RED_SR_SAM_1_uplink WSF_COMM_TRANSCEIVER
  end_comm

  processor data_mgr RED_MISSILE_DESTROYER_DATA_MGR
  end_processor

  processor task_mgr RED_MISSILE_DESTROYER_TASK_MGR
     operating_level ENGAGE 1
     weapon_uplink_path sr_sam_fcr_1 RED_SR_SAM_1_uplink
  end_processor

  processor 3rd_party_mgr ANNOUNCE_LAUNCH_TACTICS
     on_initialize
        REMOTE_UPDATE_PLATFORM_TYPE = "RED_NAVAL_HELICOPTER";
     end_on_initialize
  end_processor

  processor asm_task_mgr NAVAL_ASM_TACTICS
     operating_level ENGAGE 1
     on_initialize
        WEAPON_NAME          = "asm";
     end_on_initialize
  end_processor

  track_manager
     filter FILTER_TACTICS end_filter
  end_track_manager

  mover WSF_SURFACE_MOVER
    maximum_speed  31 kts
  end_mover

  sensor rice_screen RICE_SCREEN # air search
    on
    ignore_same_side
    internal_link data_mgr
  end_sensor

  sensor sr_sam_fcr_1 SR_SAM_FCR_1 # TTR
    off
    ignore_same_side
    internal_link data_mgr
  end_sensor

  weapon sam RED_SR_SAM_1
    location 0 0 -5 m  # estimate
    quantity      8
  end_weapon

  weapon asm RED_ASM_MSL   
    location 0 0 -5 m  # estimate
    quantity      16
    internal_link 3rd_party_mgr
  end_weapon

  zone full_kinematic
     circular
        maximum_altitude 5 km
        maximum_radius   12 km
  end_zone

end_platform_type
```

### ===== FILE: platform/RED_MISSILE_FRIGATE.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
include_once processor/NAVAL_SAM_TACTICS.txt
include_once processor/RED_MISSILE_FRIGATE_DATA_MGR.txt
include_once processor/RED_MISSILE_FRIGATE_TASK_MGR.txt
include_once sensor/TOP_PLATE.txt
include_once sensor/FRONT_DOME.txt
include_once weapon/RED_SR_SAM_2.txt
include_once comm/RED_DATALINK.txt
include_once signatures/SHIP_RADAR_SIGNATURE.txt

log version $Id: red_missile_frigate.txt,v 1.1.1.1 2008/07/28 15:09:03 m210650 Exp $

###############################################################################
#
#                               UNCLASSIFIED
#
#                          Guided-Missile Frigate
#
#   Sources:
#
#     1.  www.sinodefence.com
#     2.  Jane's
#
###############################################################################

platform_type RED_MISSILE_FRIGATE WSF_PLATFORM
  icon JiangKai

  radar_signature SHIP_RADAR_SIGNATURE

  comm datalink RED_DATALINK
     network_name <local:master>
     internal_link task_mgr
  end_comm

  comm RED_SR_SAM_2_uplink WSF_COMM_TRANSCEIVER
  end_comm

  processor data_mgr RED_MISSILE_FRIGATE_DATA_MGR
    report_to commander via datalink
  end_processor

  processor task_mgr RED_MISSILE_FRIGATE_TASK_MGR
     operating_level ENGAGE 1
#     weapon_uplink_path top_plate RED_SR_SAM_2_uplink
  end_processor

  track_manager
     filter FILTER_TACTICS end_filter
  end_track_manager

  mover WSF_SURFACE_MOVER
    maximum_speed  27 kts
  end_mover

  sensor top_plate TOP_PLATE # air search
    on
    ignore_same_side

    internal_link data_mgr
  end_sensor

  sensor ill-1 FRONT_DOME # RED_SR_SAM_2 illuminator
    category ILLUMINATOR
    off
    ignore_same_side
  end_sensor

  sensor ill-2 FRONT_DOME # RED_SR_SAM_2 illuminator
    category ILLUMINATOR
    off
    ignore_same_side
  end_sensor

  sensor ill-3 FRONT_DOME # RED_SR_SAM_2 illuminator
    category ILLUMINATOR
    off
    ignore_same_side
  end_sensor

  sensor ill-4 FRONT_DOME # RED_SR_SAM_2 illuminator
    category ILLUMINATOR
    off
    ignore_same_side
  end_sensor

  weapon sam RED_SR_SAM_2
    location 0 0 -5 m  # estimate
    quantity      32
  end_weapon

  zone full_kinematic
     circular
        maximum_altitude 22 km
        maximum_radius   40 km
  end_zone

  zone half_kinematic
     circular
        maximum_altitude 22 km
        maximum_radius   20 km
  end_zone

end_platform_type
```

### ===== FILE: platform/RED_NAVAL_HELICOPTER.txt =====

```text
# ****************************************************************************
# CUI
#
# The Advanced Framework for Simulation, Integration, and Modeling (AFSIM)
#
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
# ****************************************************************************
include_once processor/RED_NAVAL_HELICOPTER_DATA_MGR.txt
include_once processor/INFLIGHT_UPDATE_TACTICS.txt
include_once sensor/HELICOPTER_SURFACE_SEARCH_RADAR_1.txt
include_once comm/RED_DATALINK.txt
include_once signatures/VEHICLE_RADAR_SIGNATURE.txt

log version $Id: red_naval_helicopter.txt,v 1.2 2011/09/28 19:06:28 jj672c Exp $

###############################################################################
#
#                               UNCLASSIFIED
#
#   Sources:
#
#     1.  www.sinodefence.com
#
###############################################################################

platform_type RED_NAVAL_HELICOPTER WSF_PLATFORM
  icon A-160
  radar_signature VEHICLE_RADAR_SIGNATURE
  comm datalink RED_DATALINK
     network_name <local:slave>
     internal_link data_mgr
     internal_link inflight_update_mgr
  end_comm

  comm uplink_radio RED_DATALINK
  end_comm

  track_manager
     filter FILTER_TACTICS end_filter

     # required for inflight updates to work (as currently employed)
     aux_data
        string weapon_platform = ""
     end_aux_data
  end_track_manager

  processor data_mgr RED_NAVAL_HELICOPTER_DATA_MGR
    purge_interval      60 sec

    report_to commander via datalink
  end_processor

  processor inflight_update_mgr INFLIGHT_UPDATE_TACTICS
     on_initialize
        UPLINK_COMM_NAME = "uplink_radio";
        WEAPON_COMM_NAME = "uplink";
     end_on_initialize
  end_processor

  mover WSF_AIR_MOVER
    maximum_speed         159 kts
    maximum_altitude      14100 ft
    maximum_climb_rate    1614 ft/m
  end_mover

  sensor helicopter_surface_search_radar_1 HELICOPTER_SURFACE_SEARCH_RADAR_1 # surface search
    on
    ignore_same_side
    processor data_mgr
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
# * * ************************************** * *
# *   ****** Demonstration input file ******   *
# *   ******      UNCLASSIFIED        ******   *
# * * ************************************** * *


platform 1000_test_ship RED_MISSILE_DESTROYER
   side blue
   commander SELF
   route
     position 30:00:00n  78:00:00w altitude 0 ft agl
        speed 0 kts
   end_route
end_platform

platform 1000_helo RED_NAVAL_HELICOPTER
   side blue
   commander 1000_test_ship
   route
     position 30:00:00n  77:45:00w altitude 5000 ft agl
     speed 0 kts  heading 90 deg
   end_route
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
platform 1000_target_ship RED_MISSILE_FRIGATE
   side red
   sensor top_plate
      off
   end_sensor
   route
      position 30:00:00n  77:30:00w altitude 0 m agl
         speed 10 kts
      position 30:30:00n  77:30:00w altitude 0 m agl
   end_route
end_platform
```
---

## 4. 使用指引

### 4.1 看点速览（这个案例演示什么）

- **★ 舰载中继制导闭环（本案例最有价值的一段）**：反舰/巡航导弹发射后需要**第三方持续送目标航迹**。闭环由三个处理器咬合：
  1. `processor ANNOUNCE_LAUNCH_TACTICS WSF_TASK_PROCESSOR` 监听 `WSF_STATUS_MESSAGE`，当 `message.Status() == "WEAPON_FIRED"` 时，用 `message.Platform()` 取到**刚生成的武器平台**，把它的名字写进一条新航迹的 AuxData（`newTrack.SetAuxData("weapon_platform", name)`），再沿**指挥链**（`PLATFORM.CommandChainCount()` / `Subordinates()`）给 `REMOTE_UPDATE_PLATFORM_TYPE`（= 红方直升机）派一条 `"Update"` 任务；
  2. `processor INFLIGHT_UPDATE_TACTICS WSF_TASK_PROCESSOR` 在直升机上收 `WSF_TASK_ASSIGN_MESSAGE`，按 AuxData 里的 `weapon_platform` 用 `WsfSimulation.FindPlatform(name)` 找到飞行中的导弹，登记进 `updateMap`；
  3. `on_update` 每 `update_interval 5.0 sec` 遍历，到 `WEAPON_UPDATE_INTERVAL`（60 s）就用 `WsfComm.SendMessage(WsfTrackMessage)` 经 `UPLINK_COMM_NAME` 把航迹送到导弹的 `WEAPON_COMM_NAME`。
  这是 AFSIM 里"**发射通报 → 中继更新**"的标准范式，也是本 demo 把 `announce_launch_tactics` 与 `inflight_update_tactics` 单独成文件的理由。
- **`launch_computer` 两层聚合**：单弹判定各写一个顶层 `script`（`RED_ASM_MSL_LaunchComputer` / `RED_SR_SAM_1/2_LaunchComputer` / `SSM_MISSILE_LaunchComputer`），再由 `SAM_LaunchComputer` / `ASM_LaunchComputer` / `SSM_LaunchComputer` 按**目标舰型**（`aAssignee.Type()`）分派；同时各聚合文件还提供 `Local_*_LaunchComputer(WsfTrack, WsfWeapon, …)` 版本供**弹上**用（战术处理器里以 `extern` 声明后调用）。
- **拦截包线用 `zone` + `WithinZoneOf`**：`launch_computer` 先算 `InterceptLocation2D` 得到拦截点 `tti`，再 `WsfGeoPoint.Construct(lat, lon, tgtAlt)` 后调 `point.WithinZoneOf(aLauncher, aEnvelopeName)` —— **包线名由战术处理器在 `on_initialize` 里以 `ENVELOPE` 变量传入**（护卫舰传 `"half_kinematic"`），于是同一条 `launch_computer` 代码可服务两种包线。包线本身定义在 `platform_type` 体内（`zone full_kinematic` / `zone half_kinematic`，`circular` + `maximum_altitude` + `maximum_radius`）。
- **战术处理器四态状态机**：`NAVAL_SAM/ASM/SSM_TACTICS` 都是 `WSF_TASK_PROCESSOR` 的 `DETECTED → ENGAGEABLE → ENGAGE → FIRING` 四态演进（`evaluation_interval` + `next_state`），配套一组 `script bool`（`FiringNow` / `InterceptResultsKnown` / `InInterceptEnvelopeOf` / `HasAcquired` / `TrackingNow` / `LaunchWeapon` / `IsEngageable` / `WeaponsAvailable` / `Engage`）。三者**结构同构、仅细节不同**，适合对照阅读"同一套战术模板怎么改任务"。
- **弹上战术 `ASM_TACTICS`**：反舰弹自己的三段剖面 —— `ENROUTE`（`TurnToHeading` + `GoToAltitude` 巡航高度）→ `ACQUIRING_TARGET`（进 `SEEKER_ACTIVATION` 距离开导引头 `StartTracking`）→ `TERMINAL`（`GoToLocation` 降到 `TERMINAL_ALT`）。参数（`CRUISE_ALT` / `TERMINAL_ALT` / `SEEKER_ACTIVATION`）由 `platform_type` 里的 `processor task_mgr ASM_TACTICS` 用 `on_initialize` 覆写。
- **武器链路 ×4（完整 `aero` → 弹体 → `weapon_effects` → `weapon`）**：
  - 反舰：`aero`（`RED_ASM_MSL` 复用 `WSF_AIR_MOVER` 内联，无独立 aero 文件）→ 弹体 `RED_ASM_MSL` → `weapon RED_ASM_MSL`（带 `slew_mode azimuth` + `pitch 15 deg`）；
  - 防空短程：`aero RED_SR_SAM_1_AERO` → 弹体 `RED_SR_SAM_1`（单级 `WSF_GUIDED_MOVER`）→ `weapon`（`reload_*` 族参数齐全）；
  - 防空中程：`aero RED_SR_SAM_2_AERO` → 弹体 `RED_SR_SAM_2`（**两级 stage**，`WSF_GUIDED_MOVER` + `stage 1/2`）→ `weapon`（`firing_interval` / `slew_mode both`）；
  - 巡航：`aero SSM_MISSILE_AERO` → 弹体 `SSM_MISSILE`（`stage 1` 单级 + `WSF_PERFECT_TRACKER` 导引头 + 2 处 `execute at_time … relative` 运行期改导航参数）→ `weapon`（`tilt 89.9 deg` + `launch_delta_v` 垂直发射）。
- **`filter` 与 `track_manager`**：`filter FILTER_TACTICS WSF_KALMAN_FILTER` 在 `global_script.txt` 里定义一次，平台用 `track_manager` + `filter FILTER_TACTICS end_filter` **按名引用**；弹上导引头则用**带参数的 `filter` 就地覆写**（`ssm_missile.txt` 的 `sensor seeker` 里 `range_measurement_sigma 0.5 m` 等）—— 两种用法并存，是 AFSIM 滤波配置的好对照。
- **传感器 6 部，`antenna_pattern` 一律前置**：`WSF_RADAR_SENSOR` 的 `transmitter` / `receiver` / `hits_to_establish_track` / `ignore_domain` / `reports_*` 写法齐备；`one_m2_detect_range` 与 `maximum_range` 的用法（"按 1 m² 基准给探测距离"）值得照抄。
- **三类签名独立成文件**：`VEHICLE_*`（弹/直升机）与 `SHIP_*`（舰艇）各三类，平台内按名引用（`radar_signature SHIP_RADAR_SIGNATURE`）。

### 4.2 怎么跑

1. 按 §1 的 tree 把 **58 个文件**复原为目录（`ship_ad/` 为工程根）。
2. 打包为 ZIP：**ZIP 名与入口同名** —— `ship_ad.zip`，内含 `ship_ad.txt` 于**压缩包根目录**。
3. 交给 AFSIM：本案例**仅通过语法校验，未跑仿真**。
   - 校验通道：`mcp__afsim__validate_scenario`（或等价 HTTP `POST /api/v1/scenarios/validate`）；判据只看 `valid`（语法对错都返回 200）。
4. 仿真时长 `end_time 1.5 hours`（入口另保留了源 `setup.txt` 的 `end_time 1 hrs`，后者被覆盖），输出落在 `output/`（`ship_ad.evt` / `.aer` / `.log`）。

> ⚠️ **改名注意**：入口内的 `define_path_variable CASE ship_ad` 决定输出文件名；若改工程名，须同步改入口文件名的 basename，**且保证全工程只有这一个文件与工程同名**（服务端按 `<工程名>.txt` 定位启动文件，大小写不敏感、不区分路径，出现两个即报"启动文件不唯一"）。

### 4.3 可借鉴 / 勿照抄

| 可借鉴 | 说明 |
| :-- | :-- |
| 中继制导三段闭环 | `WSF_STATUS_MESSAGE` 捕 `WEAPON_FIRED` → AuxData 传武器平台名 → `FindPlatform` + `WsfTrackMessage` 上行 |
| 按指挥链派单 | `CommandChainCount()` / `CommandChainEntry(i).Name()` / `Subordinates()` + `AssignTask(track, "Update", sub)` |
| `launch_computer` 两层聚合 | 单弹判定（顶层 `script`）+ 聚合分派（按 `aAssignee.Type()`）；`extern` 声明供处理器调用 |
| 包线名参数化 | 战术处理器 `on_initialize` 里 `ENVELOPE = "half_kinematic";` → `launch_computer` 里 `WithinZoneOf(launcher, envelopeName)` |
| 两段式武器定义 | 弹体 `platform_type`（挂 mover / 导引头 / 制导计算机 / 引信）+ `weapon WSF_EXPLICIT_WEAPON`（指向 `launched_platform_type` 与 `weapon_effects`） |
| 运行期改参数 | `processor test WSF_SCRIPT_PROCESSOR` + `execute at_time 2 min relative` 里 `computer.ProcessInput("g_bias 2.0")` |
| 多级导弹 | `WSF_GUIDED_MOVER` 的 `stage 1` / `stage 2`（各自 `fuel_mass` / `thrust_duration` / `specific_impulse` / `aero`） |
| `track_manager` + 命名 filter | 平台级 `track_manager` 内 `filter FILTER_TACTICS end_filter` 复用全局定义 |
| 组件独立成文件 | 4 个平台类型各把 `processor` / `signature` / `comm` 析出，平台内按名引用（改造后的规范形态） |

| 勿照抄 | 原因 |
| :-- | :-- |
| 入口同时存在 `event_output` / `event_pipe` 各 2 处 | 源 `setup.txt` 先 `include event_output.txt` / `event_pipe.txt`，入口再写单行版；**后者生效**。本案例原样保留；新工程只写一处 |
| 入口同时存在 `end_time 1 hrs` 与 `end_time 1.5 hours` | 前者来自源 `setup.txt`，被入口覆盖；原样保留 |
| `event_pipe` 里写死 `file replay.aer` | 源 `event_pipe.txt` 的文件名，与入口的 `output/$(CASE).aer` 不同；原样保留，新工程统一用 `output/$(CASE).aer` |
| `processor` 内联在 `platform_type` 体内 | 本案例为忠实原样保留；规范推荐"组件独立成文件 + 平台内按名引用" |
| `RED_SR_SAM_1_uplink` / `RED_SR_SAM_2_uplink` 等空 `comm` 块 | 官方为"占位/待配置"；新工程按需补参数 |
| `zone` 定义在 `platform_type` 体内 | 这是**平台级拦截包线**（被 `WithinZoneOf(launcher, name)` 引用），**不可**提到 `zone.txt`（语义会变成全局区域） |
| 另两个入口 `2nd_sam.txt` / `3rd_ssm.txt` | 与 `1st_asm.txt` **共用平台定义**，同时收录会重复定义；本案例只收 `1st_asm` |

### 4.4 对应关系

本案例的写法在本 Skill 内的权威参考：

| 本案例演示的写法 | 权威参考 |
| :-- | :-- |
| 目录划分与装配顺序 | `refs/structure/project-layout.md`、`refs/structure/assembly-rules.md` |
| 发射通报 → 中继更新的闭环 | `refs/sos/kill-chain.md`、`refs/sos/command-chain.md` |
| `launch_computer` 两层聚合与 `zone` 包线 | `refs/knowledge/commands_reference.md` |
| `WSF_TASK_PROCESSOR` 四态战术处理器族 | `refs/knowledge/script_types.md`、`refs/knowledge/message_types_reference.md` |
| `filter` / `track_manager` 航迹管理 | `refs/knowledge/commands_reference.md` |

### 4.5 改造中实测到的坑

1. **★ 行级保真审计的判据**：`ship_ad` 归一化后，块计数对比 **0 项差异**；行级审计的 111 条差异（43 删 + 68 增）**全部是 `include` / `include_once` / `define_path_variable` 行** —— 即 A2（入口同名化）/ A3（路径变量）/ A4（路径改写）/ A6（依赖补齐）。**零模型内容丢失**。其中唯一"净消失"的一行是源 `setup.txt` 的 `include_once platforms/common.txt`：该文件内容已被拆分到 `signatures/`（6 个）+ `comm/`（1 个）+ `global_script.txt`（`filter`），原 include 的职责由这三处的 `include_once` 承接（见下条）。
2. **`platforms/common.txt` 是"混合容器"，必须按块类型拆**：该文件把 **6 个签名 + 1 个 `comm` + 1 个 `filter`** 装在一起（官方注释就叫 "common type definitions"）。按 §11.2 映射表：签名 → `signatures/`、`comm` → `comm/`；**`filter` 无规范归属**（映射表未覆盖）→ 归 `global_script.txt`（该文件是"公共定义层"，样例工程里也放了 `zone` / `network` 等非脚本块）。原文件里的分隔注释（`# Vehicle Signatures` / `# Ship Signatures` / `# Red datalink` / `# Filter tactics`）**随各自块走**，未丢一行。
3. **`filter` 块无规范归属**：同 `outer_air_battle` 的 `launch_computer`（归 `weapon/`）与 `script_interface`（就地保留）。本案例处置：**顶层定义 → `global_script.txt`**（只此一处，无同名冲突）；**平台内 `track_manager` 里的 `filter FILTER_TACTICS end_filter` 引用 → 随平台文件就地保留**；**弹上带参数的 `filter` → 随 `sensor` 就地保留**。
4. **`script_interface` 就地保留**：`platforms/naval_asm_tactics.txt` 与 `platforms/naval_ssm_tactics.txt` 各有一个**内容相同**的 `script_interface`（`script_interface` + `# debug` + `end_script_interface`）。若都归 `global_script.txt` 会在同一文件内**同名重复**，故两处**各自随所属处理器文件就地保留**（`processor/NAVAL_ASM_TACTICS.txt` / `processor/NAVAL_SSM_TACTICS.txt`）。这与 `launcher`（只有一处 → 归 `global_script.txt`）的处置**不同但都合规**。注：`weapons/sam/red_sr_sam_1_launch_computer.txt` 里还有一段**已被注释掉**的 `#script_interface`，属历史快照，**原样保留在 `weapon/`**。
5. **`include` → `include_once` 的关键字改写范围**：仅限**顶层装配**（入口 `include setup.txt` → `include_once setup.txt`；`include scenarios/naval_asm_test.txt` → `include_once side/blue.txt` + `include_once side/red.txt`）。**绝不**改那些"就地插入片段"的 `include`（本 demo 无此类片段，但 `outer_air_battle` 的 `comm/BLUE_COMM.txt` 是典型 —— 改成 `include_once` 会变语义）。与 `launcher` / `outer_air_battle` 两案例口径一致。
6. **`setup.txt` 从"混合装配"变"纯 include_once"**：源 `setup.txt` 混装了 `file_path .` + `include event_output.txt` / `event_pipe.txt` / `terrain.txt` + 5 个平台 include + `end_time 1 hrs`。归一化后：`file_path .` 与 `end_time` 进**入口**（规范 §4.1 把 `file_path` / `end_time` 归入口的"仿真控制"），`event_pipe.txt` 进 `event_pipe.txt`，`terrain.txt` 进 `global_env.txt`，`event_output.txt` **内联进入口**，平台 include 留在 `setup.txt`。原文件的头注释（"This file should be included first…"）与 `# include common type definitions` 一并留在 `setup.txt`。
7. **`terrain` 块 → `global_env.txt`**：规范 §4.4 的 `global_env.txt` 要求 `global_environment` 块；本 demo 用的是 `terrain` 块（`#no terrain for now`）。**未改块关键字**（改了就变语义），按"全局环境配置"职责原样收进 `global_env.txt`。
8. **`route ASM_DUMMY` 藏在武器文件尾部**：`weapons/agm/asm_tactics.txt` 前 85 行是 `processor ASM_TACTICS`，尾部 5 行是 `route ASM_DUMMY`（被 `weapon RED_ASM_MSL` 的 `on_create` 用 `CreateRoute("ASM_DUMMY")` + `Transform` + `FollowRoute` 调用）。按映射表 `route` → `global_route.txt`，处理器归 `processor/`。
9. **`zone` 不可提到 `zone.txt`**：`full_kinematic` / `half_kinematic` 定义在 `platform_type` **体内**，是**平台级**包线（`point.WithinZoneOf(aLauncher, aEnvelopeName)` 引用）。提到全局 `zone.txt` 会从"平台包线"变成"全局区域"，**语义变了**。故随平台文件就地保留（映射表的 `zone → zone.txt` 只适用于**顶层** `zone`）。
10. **`file_path .` 必须保留**：AFSIM 的 `include_once` 按 `file_path` 搜索，工程内所有相对路径都相对**工程根** —— 这也是为什么 `platform/MISSILE_SHIP.txt` 里写 `include_once sensor/RICE_SCREEN.txt`（而不是同目录的 `RICE_SCREEN.txt`）。
11. **入口同名化**：`1st_asm.txt` → `ship_ad.txt`（A2），`define_path_variable CASE` 由 `1st_asm` 改为 `ship_ad`（A3），保证输出文件名与工程名一致。
12. **`processors` 与 `platform_type` 同文件的拆分**：`platforms/missile_ship.txt` 等 4 个文件都是"**2 个顶层 `processor` + 1 个 `platform_type`**"的混合体。按映射表 `processor` → `processor/`、`platform_type` → `platform/`，拆成 3 个文件（直升机文件是 2 个），原文件的头注释（`log version $Id: …` 与 `#### UNCLASSIFIED / Sources:` 框）**随 `platform_type` 走**。
13. **`side/` 按阵营拆分**：`scenarios/naval_asm_test.txt` 的 3 个 `platform` 实例按 `side` 字段拆成 `side/blue.txt`（2 个）+ `side/red.txt`（1 个），拆点落在实例之间，**未切断任何实例**。
14. **非文本资产一律不进**：原 demo 的 `README.md` / `doc/ship_ad.rst` / `doc/images/ship_ad_demo.png` 均**不进**改造工程（§11.2 铁律 3：改造后工程只允许 `.txt` + `config/run.json`）。

### 4.6 许可说明

原始 AFSIM 官方 demo 文件头部含 CUI（受控非密信息）横幅：

```text
# CUI
# The use, dissemination or disclosure of data in this file is subject to
# limitation or restriction. See accompanying README and LICENSE for details.
```

本案例**原样保留**该横幅（未剥离、未改写），并在每个文件头部呈现。使用与再分发须遵守原始许可（另见方案 §12 R1）。

# 案例：ship_ad —— 组件与实例全文

> 本文件是 `ship_ad.md` 的**续篇**（按 §6 大案例切分规则拆出）。
> 主文件含：元信息头、§1 文件结构、根文件全文、§3 使用指引。本文件含 **50 个组件与实例文件的全文**。
> 文件顺序 = **装配顺序**（`mover` → `comm` → `sensor` → `processor` → `signatures` → `weapon_effects` → `weapon` → `platform` → `side/` 实例）。

---
