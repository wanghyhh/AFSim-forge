# AFSIM 脚本语法摘抄库 · 总索引

> **来源**：AFSIM 2.9.0 官方 demo 集 `demos/` —— 4,751 个 `.txt` / 1,323,430 行
> **规模**：49,816 个语法块 → **449 种块类型** / **3,404 个参数签名** → **3,408 条摘抄**（3,404 条签名代表 + 4 条结构条目） / 12 个内容卷合计 132,674 行（全目录 18 个文件约 13.6 万行）
> **性质**：**原文摘抄，一字未改**。不做总结、不做改写、不删注释 —— 每条都能回原文逐字节核对
> **用途**：智能体生成工程时**按需检索**的保底参考。**不要通读**，只查你卡住的那个命令/参数
> **警示**：片段中的数值、平台名、路径均为 demo 原值，**只学语法结构，禁止照抄数值**；依赖 `common/` 数据表（`WSF_RADAR_SIGNATURE` 等）的片段须另行提供对应表文件

---

## 一、怎么用（三步）

```text
① 你手上有一个「不确定怎么写」的东西 —— 命令名？类型名？参数名？还是「要做某类功能」？
       ↓
①' 如果是「要做某类功能」（数据链上报 / 电子战 / 任务分配…）
     → 先看 91-feature-files.md：主题 → 最相关的 demo 文件，直接打开那个工程读
       ↓
② 如果知道大概的命令/参数名 → 查 90-tokens.md（全量关键字索引）：
     任何在 demo 里出现过的命令/参数名都在表里，命中行告诉你「属于哪个块类型」+「首个出处」
       ↓
③ 按「块类型」到 §三 类型→卷 定位表找到分卷，打开该卷搜 `### <块类型> ·` 看完整片段
```

**三种典型检索姿势**

| 你卡在哪 | 查什么 | 去哪 |
| :-- | :-- | :-- |
| **不知道从哪下手**（要做某类功能） | 功能主题 | `91-feature-files.md` → 最相关的 demo 工程 → 打开入口文件 |
| 不知道某个功能用什么命令 | 功能关键词（如 `report`、`fusion`、`jam`） | `90-tokens.md` → 命中 token 的「所在块类型」 |
| 知道类型名，不会写参数 | 类型名（如 `WSF_TRACK_PROCESSOR`） | 各卷标题行 `### processor · WSF_TRACK_PROCESSOR｜…` |
| 知道参数名，不知放哪、取值是什么 | 参数名（如 `report_interval`） | `90-tokens.md` 查参数 → 回分卷看上下文 |

**注意**：本库**只覆盖 demo 中出现过的语法**。查不到 = demo 里没有，此时回 `knowledge/` 与 `blueprints/cases/`，或按 AFSIM 手册语法推演后**必须走语法校验**。

> **智能体请直接读 `00-retrieval.md`**（检索协议，80 行 / 4 KB）—— 那里有可直接执行的 grep 配方、中→英检索词对照、单次读多少、查不到怎么降级。**本文只在需要「类型 → 卷」定位表（§三）时读**。

---

## 二、分卷总表

**编号规则（分区段 + 定宽两位，不是连续序号）**

```text
00        总索引（本文）
01        手工条目（结构 / 装配：没有 end_ 闭合的顶层指令，块扫描器抓不到）
10 – 21   机器生成的内容分卷（12 卷，按块类型归卷）
90 / 91   辅助索引（90 = token 全量索引，91 = 功能 → demo 文件反向索引）
99        覆盖报告
```

为什么这么编：① **定宽两位 → 字典序即正确序**（`1- 10- 2-` 在任何文件列表里都会排错，`01 02 … 10 11` 不会）；② **分区段预留扩展位**（以后加内容卷直接用 `22-`、`23-`，不必改动已有卷）；③ **引用稳定**（本文与各卷标题里都写着文件名，连续编号一旦中间插入就要全量改名）。所以看到「从 10 开始」不是漏号，是内容区段的起点。

| 卷 | 主题 | 条数 | 行数 | 覆盖块类型 | 主要块类型（按块数） |
| :-- | :-- | --: | --: | --: | :-- |
| `01-structural.md` | 结构与装配（入口 / include / setup / 块闭合） | 4 | 101 | 手工 | `file_path` / `include_once` / `define_path_variable` |
| `10-platform.md` | 平台与部署 | 741 | 32,732 | 19 | `platform`(7,479)、`route`(2,354)、`platform_type`(1,218)、`aux_data`(363)、`airbase`(101)、`zone`(69) |
| `11-mover.md` | 运动 / 制导 / 飞控（含 6DOF 控制积木） | 532 | 17,602 | 123 | `orbit`(1,418)、`mover`(952)、`control_input`(694)、`inputs`(540)、`scalar_gain`(508)、`phase`(270) |
| `12-sensor.md` | 传感器与电子战 | 557 | 16,853 | 41 | `sensor`(713)、`transmitter`(502)、`antenna_pattern`(332)、`receiver`(276)、`mode`(118)、`mode_template`(52) |
| `13-weapon.md` | 武器与杀伤 | 175 | 4,060 | 9 | `weapon`(613)、`weapon_effects`(161)、`launch_computer`(119)、`effect`(105)、`launch_computer_table`(5)、`launch_acceptable_region`(3) |
| `14-processor.md` | 处理器 / 航迹 / 滤波 | 305 | 13,723 | 18 | `processor`(1,218)、`filter`(53)、`track_manager`(38)、`track`(37)、`target`(14)、`target_data`(9) |
| `15-comm.md` | 通信与组网 | 89 | 1,974 | 14 | `comm`(1,959)、`network`(14)、`commodity`(10)、`common`(7)、`router`(3)、`link16_interface`(2) |
| `16-script.md` | 脚本与状态机 | 468 | 25,708 | 20 | `script`(2,395)、`execute`(971)、`script_variables`(817)、`next_state`(403)、`precondition`(324)、`state`(308) |
| `17-signature.md` | 目标特征 | 23 | 509 | 7 | `radar_signature`(2,519)、`optical_signature`(134)、`infrared_signature`(106)、`acoustic_signature`(7)、`bistatic_signature`(2)、`multiresolution_optical_signature`(1) |
| `18-event.md` | 输出 / 接口 / 绘图 | 120 | 3,477 | 30 | `event_pipe`(191)、`event_output`(167)、`observer`(71)、`dis_interface`(44)、`horizontal_map`(37)、`altitude`(27) |
| `19-table.md` | 数据表与变量 | 84 | 2,871 | 73 | `independent_variable`(4,979)、`dependent_variable`(2,041)、`regular_table`(2,041)、`irregular_table`(278)、`angle_mapping_table`(180)、`cd_angle_mach_table`(138) |
| `20-advanced.md` | 高级模型（行为树 / 赛博 / 环境 / 交通） | 239 | 11,375 | 53 | `behavior`(188)、`sequencer`(160)、`technique`(120)、`terrain`(78)、`advanced_behavior`(77)、`navigation`(37) |
| `21-other.md` | 长尾块 | 71 | 1,790 | 42 | `circular_pattern`(46)、`uniform_pattern`(44)、`rectangular_pattern`(39)、`sine_pattern`(36)、`system_type_data`(22)、`probabilities`(18) |
| `90-tokens.md` | 全量关键字索引（token → 块类型 / 出处） | 2,256 | 2,263 | — | — |
| `91-feature-files.md` | 功能主题 → demo 文件 反向索引（18 个主题） | — | 381 | — | — |
| `00-retrieval.md` | **检索协议（智能体唯一入口）** | — | 约 80 | — | — |
| `99-coverage.md` | 覆盖报告与边界说明 | — | 本文 | — | — |

**去重口径**：同一「参数签名」= `md5(块类型 | 类型名 | 排序后的一级子参数列表)`。同签名的 N 个块只保留**子参数最全**的 1 条作代表，并注明「同签名共 N 处，另见 …」。所以：**语法形态一条不缺，重复内容一条不多**。

---

## 三、类型 → 卷 定位表（449 种块类型全覆盖）

按字母序；括号内为该类型在 demo 中出现的块数。

### A

`acoustic_signature`(7) → [signature](17-signature.md) · `acquire_deltas`(4) → [other](21-other.md) · `actuator`(180) → [mover](11-mover.md) · `advanced_behavior`(77) → [advanced](20-advanced.md) · `advanced_behavior_tree`(21) → [advanced](20-advanced.md) · `aero`(167) → [mover](11-mover.md) · `aero_component`(138) → [mover](11-mover.md) · `aero_data`(36) → [mover](11-mover.md) · `aero_mode`(15) → [mover](11-mover.md) · `agility_type`(19) → [mover](11-mover.md) · `air_traffic`(1) → [advanced](20-advanced.md) · `airbase`(101) → [platform](10-platform.md) · `aircraft_type`(12) → [platform](10-platform.md) · `alpha_max_mach_table`(31) → [table](19-table.md) · `alpha_min_mach_table`(31) → [table](19-table.md) · `alpha_stabilizing_frequency_mach_table`(9) → [table](19-table.md) · `alpha_versus_mach_cl_table`(31) → [table](19-table.md) · `alternate_locations`(9) → [platform](10-platform.md) · `altitude`(27) → [event](18-event.md) · `altitude_attributes`(1) → [other](21-other.md) · `altitudes`(5) → [event](18-event.md) · `analysis_map`(2) → [event](18-event.md) · `angle_mapping_table`(180) → [table](19-table.md) · `angle_of_attack_table`(6) → [table](19-table.md) · `antenna_pattern`(332) → [sensor](12-sensor.md) · `antenna_plot`(24) → [sensor](12-sensor.md) · `assets`(6) → [processor](14-processor.md) · `atmosphere_model`(8) → [advanced](20-advanced.md) · `atmosphere_table`(4) → [advanced](20-advanced.md) · `atmospheric_coefficients`(2) → [advanced](20-advanced.md) · `attack_response`(3) → [other](21-other.md) · `attenuation`(28) → [sensor](12-sensor.md) · `attitude_controller`(2) → [mover](11-mover.md) · `autopilot_config`(58) → [mover](11-mover.md) · `autopilot_support_tables`(1) → [mover](11-mover.md) · `aux_data`(363) → [platform](10-platform.md)

### B

`ballistic_missile_launch_computer`(9) → [other](21-other.md) · `ballistic_types`(1) → [other](21-other.md) · `beam`(48) → [sensor](12-sensor.md) · `behavior`(188) → [advanced](20-advanced.md) · `behavior_tree`(25) → [advanced](20-advanced.md) · `beta_stabilizing_frequency_mach_table`(9) → [table](19-table.md) · `bistatic_signature`(2) → [signature](17-signature.md)

### C

`callback`(1) → [advanced](20-advanced.md) · `cancelation_ratios`(1) → [processor](14-processor.md) · `cancellation_ratios`(5) → [processor](14-processor.md) · `category`(2) → [processor](14-processor.md) · `cd_alpha_beta_mach_table`(54) → [table](19-table.md) · `cd_alpha_mach_table`(25) → [table](19-table.md) · `cd_angle_mach_table`(138) → [table](19-table.md) · `cd_beta_mach_table`(1) → [table](19-table.md) · `chaff_parcel`(2) → [weapon](13-weapon.md) · `circular_pattern`(46) → [other](21-other.md) · `cl_alpha_beta_mach_table`(34) → [table](19-table.md) · `cl_alphadot_mach_table`(34) → [table](19-table.md) · `cl_angle_alpha_beta_table`(138) → [table](19-table.md) · `cl_beta_mach_table`(1) → [table](19-table.md) · `cl_betadot_mach_table`(34) → [table](19-table.md) · `cl_max_mach_table`(31) → [table](19-table.md) · `cl_min_mach_table`(31) → [table](19-table.md) · `clamp_gain`(179) → [mover](11-mover.md) · `close_target_detection`(4) → [sensor](12-sensor.md) · `clp_angle_mach_table`(132) → [table](19-table.md) · `clp_mach_table`(34) → [table](19-table.md) · `clq_angle_mach_table`(132) → [table](19-table.md) · `clq_mach_table`(34) → [table](19-table.md) · `clr_angle_mach_table`(132) → [table](19-table.md) · `clr_mach_table`(34) → [table](19-table.md) · `clutter_model`(11) → [sensor](12-sensor.md) · `clutter_table`(2) → [sensor](12-sensor.md) · `cm_alpha_beta_mach_table`(34) → [table](19-table.md) · `cm_alpha_mach_table`(4) → [table](19-table.md) · `cm_alphadot_mach_table`(34) → [table](19-table.md) · `cm_angle_alpha_mach_table`(138) → [table](19-table.md) · `cmp_mach_table`(34) → [table](19-table.md) · `cmq_angle_mach_table`(132) → [table](19-table.md) · `cmq_mach_table`(34) → [table](19-table.md) · `cn_alpha_beta_mach_table`(34) → [table](19-table.md) · `cn_angle_beta_mach_table`(138) → [table](19-table.md) · `cn_beta_mach_table`(4) → [table](19-table.md) · `cn_betadot_mach_table`(34) → [table](19-table.md) · `cnp_mach_table`(34) → [table](19-table.md) · `cnr_angle_mach_table`(132) → [table](19-table.md) · `cnr_mach_table`(34) → [table](19-table.md) · `comm`(1,959) → [comm](15-comm.md) · `comm_link_list`(2) → [comm](15-comm.md) · `comm_list`(1) → [comm](15-comm.md) · `comm_network`(1) → [comm](15-comm.md) · `commodity`(10) → [comm](15-comm.md) · `common`(7) → [comm](15-comm.md) · `condition`(9) → [advanced](20-advanced.md) · `conditional_section`(5) → [advanced](20-advanced.md) · `conditionals`(5) → [advanced](20-advanced.md) · `conjunction_setup`(2) → [other](21-other.md) · `connections`(3) → [other](21-other.md) · `constant_pattern`(10) → [other](21-other.md) · `container`(4) → [advanced](20-advanced.md) · `contour_level`(3) → [event](18-event.md) · `control_boolean`(90) → [mover](11-mover.md) · `control_input`(694) → [mover](11-mover.md) · `control_inputs`(28) → [mover](11-mover.md) · `control_surface`(180) → [mover](11-mover.md) · `control_value`(270) → [mover](11-mover.md) · `convoy`(1) → [platform](10-platform.md) · `correlation_method`(3) → [sensor](12-sensor.md) · `coverage`(6) → [event](18-event.md) · `csv_event_output`(2) → [event](18-event.md) · `curve`(8) → [table](19-table.md) · `cy_alpha_beta_mach_table`(54) → [table](19-table.md) · `cy_angle_beta_mach_table`(138) → [table](19-table.md) · `cy_beta_mach_table`(1) → [table](19-table.md) · `cy_betadot_beta_mach_table`(34) → [table](19-table.md) · `cyber_attack`(7) → [advanced](20-advanced.md) · `cyber_constraint`(1) → [advanced](20-advanced.md) · `cyber_effect`(5) → [advanced](20-advanced.md) · `cyber_protect`(5) → [advanced](20-advanced.md) · `cyr_beta_mach_table`(34) → [table](19-table.md)

### D

`decorator`(6) → [advanced](20-advanced.md) · `default`(3) → [other](21-other.md) · `delays`(1) → [mover](11-mover.md) · `density_altitude_table`(1) → [table](19-table.md) · `departure_traffic`(1) → [advanced](20-advanced.md) · `dependent_variable`(2,041) → [table](19-table.md) · `detection_probability`(2) → [sensor](12-sensor.md) · `detection_sensitivities`(2) → [sensor](12-sensor.md) · `dis_exchange`(1) → [event](18-event.md) · `dis_interface`(44) → [event](18-event.md) · `distribution`(3) → [mover](11-mover.md) · `distribution_centroid`(1) → [other](21-other.md) · `dynamics`(3) → [mover](11-mover.md)

### E

`effect`(105) → [weapon](13-weapon.md) · `ejectable`(21) → [mover](11-mover.md) · `ejector`(6) → [mover](11-mover.md) · `electronic_attack`(38) → [sensor](12-sensor.md) · `electronic_protect`(29) → [sensor](12-sensor.md) · `electronic_warfare`(34) → [sensor](12-sensor.md) · `engage_iff_permissions`(1) → [other](21-other.md) · `engagement_settings`(2) → [mover](11-mover.md) · `engine`(97) → [mover](11-mover.md) · `error_model`(2) → [other](21-other.md) · `error_model_parameters`(1) → [other](21-other.md) · `event`(1) → [event](18-event.md) · `event_output`(167) → [event](18-event.md) · `event_pipe`(191) → [event](18-event.md) · `events`(2) → [event](18-event.md) · `execute`(971) → [script](16-script.md)

### F

`false_target`(6) → [sensor](12-sensor.md) · `false_target_movement`(4) → [sensor](12-sensor.md) · `false_target_screener`(23) → [sensor](12-sensor.md) · `field_of_view`(7) → [sensor](12-sensor.md) · `filter`(53) → [processor](14-processor.md) · `fires_elevation_angle_table`(9) → [table](19-table.md) · `fires_table`(9) → [table](19-table.md) · `flaps`(1) → [mover](11-mover.md) · `flight_controls`(17) → [mover](11-mover.md) · `flight_path`(1) → [mover](11-mover.md) · `flight_path_analysis`(4) → [mover](11-mover.md) · `flight_route`(1) → [mover](11-mover.md) · `fluence_model`(5) → [sensor](12-sensor.md) · `force_target_tracks`(7) → [sensor](12-sensor.md) · `formation`(3) → [platform](10-platform.md) · `frequency_list`(2) → [sensor](12-sensor.md) · `frequency_maximum_rcs_table`(2) → [table](19-table.md) · `fuel`(35) → [mover](11-mover.md) · `fuel_table`(4) → [mover](11-mover.md) · `fuel_tank`(57) → [mover](11-mover.md) · `fuel_transfer`(18) → [mover](11-mover.md) · `fusion_method`(7) → [processor](14-processor.md)

### G

`gain_table`(98) → [table](19-table.md) · `global_environment`(4) → [advanced](20-advanced.md) · `grid`(6) → [event](18-event.md) · `ground_reaction_point`(6) → [other](21-other.md) · `group`(7) → [platform](10-platform.md) · `guidance_autopilot_bank_to_turn`(6) → [mover](11-mover.md) · `guidance_autopilot_skid_to_turn`(6) → [mover](11-mover.md) · `guidance_group`(8) → [mover](11-mover.md)

### H

`hardware_autopilot_bank_to_turn`(6) → [mover](11-mover.md) · `hardware_autopilot_skid_to_turn`(6) → [mover](11-mover.md) · `heat_map`(2) → [processor](14-processor.md) · `horizontal_coverage`(5) → [event](18-event.md) · `horizontal_map`(37) → [event](18-event.md)

### I

`independent_variable`(4,979) → [table](19-table.md) · `independent_variables`(8) → [other](21-other.md) · `infrared_signature`(106) → [signature](17-signature.md) · `inherent_contrast`(1) → [other](21-other.md) · `initial_state`(1) → [advanced](20-advanced.md) · `inline_table`(11) → [table](19-table.md) · `inputs`(540) → [mover](11-mover.md) · `integrator`(3) → [mover](11-mover.md) · `integrators`(3) → [mover](11-mover.md) · `intercept_results`(5) → [processor](14-processor.md) · `ionospheric_characteristics`(1) → [advanced](20-advanced.md) · `irregular_table`(278) → [table](19-table.md) · `isp_vs_alt`(30) → [mover](11-mover.md) · `items`(16) → [advanced](20-advanced.md)

### J

`j11`(2) → [other](21-other.md) · `jam_strobe_detector`(2) → [sensor](12-sensor.md) · `jammer_gain_table`(4) → [sensor](12-sensor.md) · `jamming_to_signal_gain_table`(3) → [sensor](12-sensor.md) · `jet`(14) → [mover](11-mover.md) · `jet_engine_type`(7) → [mover](11-mover.md)

### L

`landing_gear`(2) → [mover](11-mover.md) · `lane`(3) → [platform](10-platform.md) · `lane_route`(3) → [platform](10-platform.md) · `laser_designations`(6) → [sensor](12-sensor.md) · `lateral_acceleration_rate_pid`(3) → [mover](11-mover.md) · `lateral_acceleration_value_pid`(3) → [mover](11-mover.md) · `launch_acceptable_region`(3) → [weapon](13-weapon.md) · `launch_computer`(119) → [weapon](13-weapon.md) · `launch_computer_table`(5) → [weapon](13-weapon.md) · `limits_and_settings`(58) → [mover](11-mover.md) · `line_of_sight_manager`(2) → [processor](14-processor.md) · `link16_interface`(2) → [comm](15-comm.md) · `liquid_propellant_rocket`(1) → [mover](11-mover.md) · `liquid_propellant_rocket_type`(1) → [mover](11-mover.md) · `local_pitch_program`(4) → [mover](11-mover.md) · `local_traffic`(1) → [advanced](20-advanced.md) · `location`(20) → [platform](10-platform.md)

### M

`mach`(2) → [other](21-other.md) · `maneuver`(19) → [mover](11-mover.md) · `maneuvering`(4) → [mover](11-mover.md) · `manual_pilot_augmented_controls`(40) → [mover](11-mover.md) · `manual_pilot_augmented_stability`(3) → [mover](11-mover.md) · `mapping_table`(30) → [table](19-table.md) · `mass_properties`(79) → [mover](11-mover.md) · `maximum_pitch_acceleration_mach_table`(16) → [table](19-table.md) · `maximum_roll_acceleration_mach_table`(16) → [table](19-table.md) · `maximum_yaw_acceleration_mach_table`(16) → [table](19-table.md) · `message_processor`(2) → [comm](15-comm.md) · `message_table`(1) → [comm](15-comm.md) · `mission_sequence`(2) → [other](21-other.md) · `mitigated_technique_classes`(30) → [sensor](12-sensor.md) · `mitigated_techniques`(15) → [sensor](12-sensor.md) · `mode`(118) → [sensor](12-sensor.md) · `mode_template`(52) → [sensor](12-sensor.md) · `model`(16) → [sensor](12-sensor.md) · `moe`(12) → [advanced](20-advanced.md) · `mover`(952) → [mover](11-mover.md) · `multiresolution_comm`(1) → [comm](15-comm.md) · `multiresolution_fuel`(3) → [mover](11-mover.md) · `multiresolution_mover`(6) → [mover](11-mover.md) · `multiresolution_optical_signature`(1) → [signature](17-signature.md) · `multiresolution_processor`(2) → [processor](14-processor.md) · `multiresolution_radar_signature`(1) → [signature](17-signature.md) · `multiresolution_sensor`(3) → [sensor](12-sensor.md)

### N

`navigation`(37) → [advanced](20-advanced.md) · `navigation_errors`(3) → [advanced](20-advanced.md) · `network`(14) → [comm](15-comm.md) · `next_state`(403) → [script](16-script.md) · `noise_cloud`(2) → [advanced](20-advanced.md) · `normalized_thrust_vs_alt`(2) → [other](21-other.md)

### O

`observer`(71) → [event](18-event.md) · `on_bingo`(1) → [script](16-script.md) · `on_empty`(1) → [script](16-script.md) · `on_entry`(95) → [script](16-script.md) · `on_exit`(9) → [script](16-script.md) · `on_init`(136) → [script](16-script.md) · `on_initialize`(127) → [script](16-script.md) · `on_initialize2`(33) → [script](16-script.md) · `on_message`(42) → [script](16-script.md) · `on_new_execute`(15) → [script](16-script.md) · `on_new_fail`(2) → [script](16-script.md) · `on_track_drop`(4) → [script](16-script.md) · `on_update`(129) → [script](16-script.md) · `optical_signature`(134) → [signature](17-signature.md) · `orbit`(1,418) → [mover](11-mover.md) · `osm_traffic`(1) → [advanced](20-advanced.md) · `output`(24) → [event](18-event.md) · `output_rate`(8) → [event](18-event.md)

### P

`p6dof_integrators`(1) → [mover](11-mover.md) · `p6dof_object_type`(43) → [mover](11-mover.md) · `p6dof_object_types`(50) → [mover](11-mover.md) · `p6dof_terrain`(1) → [mover](11-mover.md) · `parallel`(11) → [advanced](20-advanced.md) · `path`(1) → [platform](10-platform.md) · `phase`(270) → [mover](11-mover.md) · `pid_alpha`(44) → [mover](11-mover.md) · `pid_altitude`(58) → [mover](11-mover.md) · `pid_bank_angle`(58) → [mover](11-mover.md) · `pid_beta`(44) → [mover](11-mover.md) · `pid_delta_pitch`(55) → [mover](11-mover.md) · `pid_delta_roll`(55) → [mover](11-mover.md) · `pid_flightpath_angle`(58) → [mover](11-mover.md) · `pid_forward_accel`(58) → [mover](11-mover.md) · `pid_group`(58) → [mover](11-mover.md) · `pid_pitch_angle`(58) → [mover](11-mover.md) · `pid_pitch_gload`(1) → [mover](11-mover.md) · `pid_pitch_rate`(57) → [mover](11-mover.md) · `pid_roll_heading`(58) → [mover](11-mover.md) · `pid_roll_rate`(45) → [mover](11-mover.md) · `pid_speed`(58) → [mover](11-mover.md) · `pid_taxi_forward_accel`(52) → [mover](11-mover.md) · `pid_taxi_heading`(52) → [mover](11-mover.md) · `pid_taxi_speed`(52) → [mover](11-mover.md) · `pid_taxi_yaw_rate`(52) → [mover](11-mover.md) · `pid_vert_speed`(58) → [mover](11-mover.md) · `pid_yaw_gload`(1) → [mover](11-mover.md) · `pid_yaw_heading`(56) → [mover](11-mover.md) · `pid_yaw_rate`(56) → [mover](11-mover.md) · `pilot_manager`(45) → [mover](11-mover.md) · `pitch_control_mapping_table`(18) → [table](19-table.md) · `platform`(7,479) → [platform](10-platform.md) · `platform_availability`(16) → [platform](10-platform.md) · `platform_type`(1,218) → [platform](10-platform.md) · `point_mass_engine_type`(17) → [mover](11-mover.md) · `point_mass_vehicle_type`(27) → [mover](11-mover.md) · `port`(4) → [other](21-other.md) · `port_route`(4) → [other](21-other.md) · `precondition`(324) → [script](16-script.md) · `pressure_altitude_table`(1) → [table](19-table.md) · `primary`(2) → [other](21-other.md) · `print_settings`(1) → [event](18-event.md) · `priority_selector`(4) → [advanced](20-advanced.md) · `probabilities`(18) → [other](21-other.md) · `processor`(1,218) → [processor](14-processor.md) · `program`(31) → [advanced](20-advanced.md) · `propulsion_data`(58) → [mover](11-mover.md) · `protocol`(2) → [comm](15-comm.md) · `pulse_repetition_frequencies`(1) → [sensor](12-sensor.md)

### Q

`query_bid`(2) → [advanced](20-advanced.md) · `query_bid_type`(17) → [advanced](20-advanced.md)

### R

`radar_signature`(2,519) → [signature](17-signature.md) · `rates`(3) → [mover](11-mover.md) · `reacquire_deltas`(4) → [other](21-other.md) · `receiver`(276) → [sensor](12-sensor.md) · `rectangular_pattern`(39) → [other](21-other.md) · `reference_centroid`(1) → [other](21-other.md) · `region`(8) → [event](18-event.md) · `regular_table`(2,041) → [table](19-table.md) · `repeater`(10) → [advanced](20-advanced.md) · `reported_emitter_type`(3) → [sensor](12-sensor.md) · `reported_target_type`(1) → [sensor](12-sensor.md) · `response_curve`(4) → [mover](11-mover.md) · `rigid_body_engine_type`(14) → [mover](11-mover.md) · `rigid_body_vehicle_type`(22) → [mover](11-mover.md) · `road_traffic`(6) → [advanced](20-advanced.md) · `roll_control_mapping_table`(18) → [table](19-table.md) · `roll_stabilizing_frequency_mach_table`(5) → [table](19-table.md) · `route`(2,354) → [platform](10-platform.md) · `route_network`(1) → [platform](10-platform.md) · `router`(3) → [comm](15-comm.md) · `router_protocol`(1) → [comm](15-comm.md) · `routing_table`(1) → [table](19-table.md) · `rudder_right`(17) → [mover](11-mover.md) · `run`(8) → [other](21-other.md)

### S

`saturation_effect`(20) → [sensor](12-sensor.md) · `scalar_gain`(508) → [mover](11-mover.md) · `scattering`(27) → [advanced](20-advanced.md) · `scheduler`(1) → [advanced](20-advanced.md) · `scoring_factors`(2) → [processor](14-processor.md) · `script`(2,395) → [script](16-script.md) · `script_interface`(27) → [script](16-script.md) · `script_struct`(19) → [script](16-script.md) · `script_variables`(817) → [script](16-script.md) · `sea_traffic`(1) → [advanced](20-advanced.md) · `selector`(34) → [advanced](20-advanced.md) · `selector_with_memory`(1) → [advanced](20-advanced.md) · `sensor`(713) → [sensor](12-sensor.md) · `sensor_model`(6) → [sensor](12-sensor.md) · `sensors`(3) → [sensor](12-sensor.md) · `sequence`(18) → [advanced](20-advanced.md) · `sequence_with_memory`(2) → [advanced](20-advanced.md) · `sequencer`(160) → [advanced](20-advanced.md) · `service`(2) → [other](21-other.md) · `ship`(5) → [platform](10-platform.md) · `signal_processor`(8) → [sensor](12-sensor.md) · `simple_path`(1) → [other](21-other.md) · `simple_table`(90) → [table](19-table.md) · `sine_pattern`(36) → [other](21-other.md) · `six_dof_environment`(3) → [mover](11-mover.md) · `six_dof_formation`(5) → [mover](11-mover.md) · `six_dof_object_types`(56) → [mover](11-mover.md) · `six_dof_unit`(7) → [mover](11-mover.md) · `slot_group`(1) → [advanced](20-advanced.md) · `solar_characteristics`(1) → [advanced](20-advanced.md) · `solid_propellant_rocket`(15) → [mover](11-mover.md) · `solid_propellant_rocket_type`(13) → [mover](11-mover.md) · `sonic_speed_altitude_table`(1) → [table](19-table.md) · `sosm_interface`(12) → [event](18-event.md) · `spectrum_data`(7) → [advanced](20-advanced.md) · `speed_attributes`(1) → [other](21-other.md) · `speedbrake_dcd_mach_table`(4) → [mover](11-mover.md) · `speedbrakes`(3) → [mover](11-mover.md) · `speeds`(1) → [other](21-other.md) · `spherical_map`(3) → [event](18-event.md) · `spin_down_table_ab_per_sec`(8) → [mover](11-mover.md) · `spin_down_table_mil_per_sec`(21) → [mover](11-mover.md) · `spin_up_table_ab_per_sec`(8) → [mover](11-mover.md) · `spin_up_table_mil_per_sec`(21) → [mover](11-mover.md) · `spoilers`(1) → [mover](11-mover.md) · `stage`(167) → [mover](11-mover.md) · `state`(308) → [script](16-script.md) · `status_settings`(2) → [mover](11-mover.md) · `stick_back`(17) → [mover](11-mover.md) · `stick_right`(17) → [mover](11-mover.md) · `stick_zero_moment_delta_thrust_mach_alpha_table`(28) → [table](19-table.md) · `stick_zero_moment_delta_xcg_mach_alpha_table`(28) → [table](19-table.md) · `stick_zero_moment_delta_zcg_mach_alpha_table`(28) → [table](19-table.md) · `stick_zero_moment_mach_alpha_table`(29) → [table](19-table.md) · `subgrid`(2) → [event](18-event.md) · `subobject`(85) → [mover](11-mover.md) · `surface`(21) → [event](18-event.md) · `synthetic_pilot`(44) → [mover](11-mover.md) · `system_type_data`(22) → [other](21-other.md)

### T

`table`(3) → [table](19-table.md) · `table_data`(30) → [table](19-table.md) · `target`(14) → [processor](14-processor.md) · `target_blanking_effect`(20) → [sensor](12-sensor.md) · `target_data`(9) → [processor](14-processor.md) · `target_grid`(5) → [event](18-event.md) · `target_model`(3) → [processor](14-processor.md) · `target_region`(25) → [event](18-event.md) · `target_type`(2) → [processor](14-processor.md) · `technique`(120) → [advanced](20-advanced.md) · `temperature_altitude_table`(1) → [table](19-table.md) · `term`(10) → [advanced](20-advanced.md) · `terrain`(78) → [advanced](20-advanced.md) · `test`(3) → [advanced](20-advanced.md) · `test_guidance`(1) → [other](21-other.md) · `thrust_ab_alt_mach_table`(8) → [mover](11-mover.md) · `thrust_idle_alt_mach_table`(21) → [mover](11-mover.md) · `thrust_mil_alt_mach_table`(21) → [mover](11-mover.md) · `thrust_vs_time_sealevel`(25) → [mover](11-mover.md) · `thrust_vs_time_vacuum`(3) → [mover](11-mover.md) · `time_of_flight_values`(3) → [other](21-other.md) · `tool`(30) → [advanced](20-advanced.md) · `track`(37) → [processor](14-processor.md) · `track_manager`(38) → [processor](14-processor.md) · `transactor`(6) → [other](21-other.md) · `transmitter`(502) → [sensor](12-sensor.md)

### U

`uniform_pattern`(44) → [other](21-other.md) · `unit`(4) → [other](21-other.md)

### V

`vehicle`(21) → [mover](11-mover.md) · `vertical_acceleration_rate_pid`(3) → [mover](11-mover.md) · `vertical_acceleration_value_pid`(3) → [mover](11-mover.md) · `vertical_coverage`(6) → [event](18-event.md) · `vertical_map`(4) → [event](18-event.md) · `visual_part`(13) → [other](21-other.md)

### W

`weapon`(613) → [weapon](13-weapon.md) · `weapon_effects`(161) → [weapon](13-weapon.md) · `weapon_rows`(1) → [weapon](13-weapon.md) · `weapon_table`(1) → [weapon](13-weapon.md) · `weighted_random`(2) → [advanced](20-advanced.md) · `weighted_region`(6) → [event](18-event.md) · `wsf_weapon_server`(2) → [other](21-other.md)

### X

`xio_interface`(3) → [event](18-event.md)

### Y

`yaw_control_mapping_table`(18) → [table](19-table.md)

### Z

`zone`(69) → [platform](10-platform.md) · `zone_set`(2) → [platform](10-platform.md)

---

## 四、条目格式说明

````markdown
### <块类型> · <WSF_类型名>｜<中文名>          ← 无类型名时写成 ### <块类型>（<文件名主干>）

- **关键词**：块类型, 类型名, 前 12 个子参数, 中文名     ← 供 grep 命中
- **出处**：`相对路径:起-止`　（同签名共 N 处，另见 `文件:行`…）
- **片段**：

```text
<demo 原文，逐字节一致，含注释与缩进>
```

- **演示要点**：这条片段能学到什么
````

**出处路径**一律相对 `demos/` 根，可直接用 `demos/<出处路径>` 打开原文核对。

---

## 五、使用边界（必读）

1. **只学语法，不抄数值**。demo 里的距离/频率/RCS/时间都是为各自想定调的，直接搬进新工程会得到荒谬结果。
2. **`include` 的片段不可直接复制**。demo 工程高度依赖相对路径与 `common/` 数据表；复制前先确认目标工程里存在该文件，否则会出现「语法对、校验报错」。
3. **片段是「块」不是「整文件」**。一个 `platform_type` 块复制过去，仍需你自己补 `end_platform_type` 之外的装配关系。
4. **本库不是权威语法手册**。demo 里没出现的合法语法（新版本新增命令、冷门类型）本库查不到，不代表不能用 —— 此时以 AFSIM 手册为准，并用语法校验兜底。
5. **优先级**：`blueprints/cases/`（已验证可跑） > `knowledge/`（本项目经验） > **本库（语法参考）** > 手册推演。

---

## 六、检索协议 → 独立文件 `00-retrieval.md`

检索协议已独立成文件（**约 80 行 / 4 KB**，整读约 1~1.5K tokens）：四类问题 → 四入口、五条可直接跑的 `grep` 配方、中→英检索词对照、单次读多少、查不到四级降级、三条禁忌。

> **智能体请只读 `00-retrieval.md`，不要读本文**。本文约 230 行 / 33 KB（整读约 8~10K tokens），只在需要「类型 → 卷」定位表（§三）时才读。

---

## 七、维护

本目录由脚本机械生成，**不要手工编辑**（唯一例外：`01-structural.md` 是人工撰写的结构条目）。

**生成器不随库分发**（属开发痕迹，与本目录同源但独立维护）：`index_all.py`（扫 demo 建块索引）→ `gen_all.py`（签名去重出 12 卷 + `90-tokens.md`）→ `verify_corpus.py`（**必须 0 不一致**）→ `gen_feature.py` → `gen_index.py`（本文 + `99-coverage.md`）。

改语料请改生成器后重跑全链，不要手改分卷——手改会在下次生成时丢失，且破坏保真结论。
