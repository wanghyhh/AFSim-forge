# 功能 → demo 文件 反向索引

> **用途**：本库按「块类型」组织（`10-`~`21-` 卷）。但真实问题是「**我要做一个数据链上报的工程**」——这时按块类型找不到入口。本文给出**主题 → 最相关的 demo 文件**，先去读那个工程，再回分卷查语法。

> **生成方式**：对 `demos/` 全量 `.txt` 统计关键词命中次数，按命中数排序。纯机械统计，**不做语义判断** —— 命中多不代表该文件是「该主题的最佳范例」，只代表它讲得最多。

> **用法**：挑 1~2 个命中文件 → 打开它的入口（与目录同名的 `.txt`）→ 看它 include 了哪些文件 → 顺着 `platforms/` 找具体平台块。

---

## 数据链 / 航迹上报

**关键词**：`master_track_processor`、`report_to`、`report_interval`、`unchanged_track_reporting`、`circular_report_rejection`、`report_fused_tracks`、`report_raw_tracks`

| 命中 | 文件 |
| --: | :-- |
| 60 | `air_to_air/platforms/brawler_test.txt` |
| 24 | `space_operations/scenarios/sat_sensor_constellation.txt` |
| 13 | `air_to_air/scenarios/escort.txt` |
| 10 | `brawler/platforms/flight_lead.txt` |
| 8 | `timeline_lead/platforms/red_flight_lead.txt` |
| 8 | `timeline_lead/platforms/flight_lead.txt` |
| 8 | `timeline/platforms/flight_lead.txt` |
| 8 | `route_finder_demos/platforms/flight_lead.txt` |
| 8 | `brawler/platforms/brawler_platform.txt` |
| 8 | `behavior_tree/platforms/flight_lead.txt` |

## 航迹融合 / 多源合成

**关键词**：`track_manager`、`fusion_method`、`fused_track`、`raw_track`

| 命中 | 文件 |
| --: | :-- |
| 24 | `air_to_air/platforms/brawler_test.txt` |
| 12 | `fires/time_on_target.txt` |
| 11 | `electronic_warfare/jam_strobe_tracking.txt` |
| 8 | `electronic_warfare/false-target_command_center.txt` |
| 6 | `swarm/platforms/uhf_ew_radar_sensor_platform.txt` |
| 6 | `sensor_demos/coherent_sensor_demo.txt` |
| 6 | `air_to_air/scenarios/escort.txt` |
| 5 | `space_operations/scenarios/ssn_laydown.txt` |
| 5 | `route_finder_demos/platforms/striker.txt` |
| 5 | `iads_c2_demos/platforms/air_interceptor.txt` |

## 任务分配 / 指挥控制

**关键词**：`WSF_TASK_PROCESSOR`、`WSF_QUANTUM_TASKER_PROCESSOR`、`WSF_QUANTUM_ASSIGNER_PROCESSOR`、`command_chain`、`asset_representation`

| 命中 | 文件 |
| --: | :-- |
| 26 | `air_to_air/scenarios/escort.txt` |
| 22 | `air_to_air/scenarios/hvaa_dca.txt` |
| 14 | `air_to_air/platforms/brawler_test.txt` |
| 8 | `air_to_air/scenarios/2v2_six_dof.txt` |
| 8 | `air_to_air/scenarios/2v2_air_movers.txt` |
| 8 | `air_to_air/scenarios/2v2.txt` |
| 6 | `air_to_air/scenarios/1v1_initial_prediction.txt` |
| 5 | `suppressor/bomb_demo_laydown.txt` |
| 5 | `multiresolution_demos/comm_with_command_chain_demo.txt` |
| 4 | `timeline_lead/processors/quantum_agents/aiai/behavior_pursue_weapon_task_target.txt` |

## 传感器探测（雷达）

**关键词**：`WSF_RADAR_SENSOR`、`transmitter`、`antenna_pattern`、`detection_threshold`

| 命中 | 文件 |
| --: | :-- |
| 58 | `iads/scenarios/iads_laydown_vegas.txt` |
| 58 | `iads/scenarios/iads_laydown_cali.txt` |
| 58 | `iads/scenarios/iads_laydown.txt` |
| 58 | `cyber/exfiltrate_demo/scenarios/iads_laydown.txt` |
| 44 | `iads_c2_demos/scenarios/iads_laydown_asv_full_bm.txt` |
| 28 | `sensor_demos/passive_detector_df_demo.txt` |
| 28 | `sensor_demos/passive_detector_demo.txt` |
| 25 | `electronic_warfare/semi-auto_repeater_jamming_1.txt` |
| 25 | `electronic_warfare/manual_repeater_jamming.txt` |
| 25 | `electronic_warfare/agile_repeater_jamming.txt` |

## 传感器探测（ESM / 无源）

**关键词**：`WSF_ESM_SENSOR`、`WSF_PASSIVE_SENSOR`、`WSF_IRST_SENSOR`、`WSF_EOIR_SENSOR`、`WSF_GEOMETRIC_SENSOR`

| 命中 | 文件 |
| --: | :-- |
| 3 | `six_dof/rb6_missile_comparison.txt` |
| 3 | `six_dof/pm6_missile_comparison.txt` |
| 3 | `multiresolution_demos/sensors/sensor_include.txt` |
| 3 | `multiresolution_demos/sensor_demo.txt` |
| 3 | `air_to_air/platforms/lte_fighter.txt` |
| 2 | `space_operations/scenarios/iridium_handheld.txt` |
| 2 | `space_operations/cloud_attenuation.txt` |
| 2 | `six_dof/sensors/simple_generic_seeker.txt` |
| 2 | `six_dof/sensors/generic_seeker.txt` |
| 2 | `p6dof/sensors/simple_generic_seeker.txt` |

## 武器交战 / 发射包线

**关键词**：`WSF_EXPLICIT_WEAPON`、`WSF_IMPLICIT_WEAPON`、`launch_computer`、`weapon_effects`、`WSF_WEAPON_EFFECTS`

| 命中 | 文件 |
| --: | :-- |
| 20 | `suppressor/weapons/agm/blue_gps_bomb_3.txt` |
| 14 | `base_types/weapons/ssm/red_srbm_4.txt` |
| 14 | `base_types/weapons/ssm/red_icbm_2.txt` |
| 13 | `orwaca_iads/weapons/ssm/tbm.txt` |
| 13 | `base_types/weapons/ssm/red_srbm_3.txt` |
| 13 | `base_types/weapons/ssm/red_mrbm_1.txt` |
| 13 | `ballistic_missile_shootdown/weapons/ssm/red_mrbm_1.txt` |
| 12 | `fires/types/fires_81mm_mortar_m821_he.txt` |
| 12 | `fires/types/fires_60mm_rocket.txt` |
| 12 | `fires/types/fires_60mm_mortar_m720_he.txt` |

## 电子战 / 干扰

**关键词**：`WSF_RF_JAMMER`、`WSF_ELECTRONIC_WARFARE`、`WSF_ELECTRONIC_ATTACK`、`WSF_ELECTRONIC_PROTECT`、`technique`、`noise_jamming`、`deception_jamming`

| 命中 | 文件 |
| --: | :-- |
| 21 | `electronic_warfare/track_drop_maintain_effect.txt` |
| 20 | `electronic_warfare/agile_repeater_jamming-rt2.txt` |
| 20 | `electronic_warfare/agile_repeater_jamming-rt1.txt` |
| 18 | `electronic_warfare/spot_jamming.txt` |
| 17 | `aea_iads/weapons/jammer/soj_base_jammer.txt` |
| 16 | `electronic_warfare/air-to-air-rt2.txt` |
| 16 | `electronic_warfare/air-to-air-rt1.txt` |
| 16 | `electronic_warfare/agile_jamming.txt` |
| 15 | `electronic_warfare/track_effect_1.txt` |
| 15 | `electronic_warfare/test_false_targets/weapons/jammer/soj_xband_jammer.txt` |

## 通信 / 组网

**关键词**：`WSF_COMM_TRANSCEIVER`、`WSF_COMM`、`WSF_RADIO_TRANSCEIVER`、`router`、`WSF_LINK16`、`network`

| 命中 | 文件 |
| --: | :-- |
| 1440 | `space_operations/scenarios/starlink_autogen.txt` |
| 265 | `space_operations/scenarios/iridium.txt` |
| 265 | `satellite_demos/satellites/orbit_nominal/iridium.txt` |
| 72 | `space_operations/scenarios/sat_sensor_constellation.txt` |
| 67 | `space_operations/scenarios/iridium_constellation.txt` |
| 17 | `space_operations/lasercomm_scripted.txt` |
| 15 | `space_operations/scenarios/iridium_handheld.txt` |
| 14 | `space_operations/platforms/starlink.txt` |
| 12 | `space_operations/scenarios/starlink_generator.txt` |
| 11 | `traffic_demos/osm_traffic.txt` |

## IADS 防空体系

**关键词**：`WSF_IADS_C2`、`WSF_BATTLE_MANAGER`、`WSF_ASSET_MANAGER`、`WSF_WEAPON_SERVER`、`engagement_settings`

| 命中 | 文件 |
| --: | :-- |
| 2 | `iads_c2_demos/processors/weapons_manager_sam.txt` |
| 2 | `iads_c2_demos/processors/weapons_manager_ai.txt` |

## 6DOF 飞行动力学

**关键词**：`WSF_SIX_DOF_MOVER`、`aero`、`point_mass_vehicle_type`、`rigid_body_vehicle_type`、`pilot_manager`、`WSF_P6DOF_MOVER`

| 命中 | 文件 |
| --: | :-- |
| 33 | `base_types/weapons/ssm/red_srbm_3.txt` |
| 30 | `six_dof/six_dof_types/aircraft/fa-lgt/aero/aero_rb6.txt` |
| 30 | `p6dof/p6dof_types/scripts/p6dof_simple_scripts.txt` |
| 30 | `p6dof/p6dof_types/aircraft/fa-lgt/aero/aero.txt` |
| 28 | `six_dof/six_dof_types/aircraft/b-fw/aero/aero_rb6.txt` |
| 28 | `p6dof/p6dof_types/aircraft/b-fw/aero/aero.txt` |
| 28 | `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt` |
| 26 | `six_dof/six_dof_types/aircraft/fa-hvy/aero/aero_rb6.txt` |
| 26 | `six_dof/six_dof_types/aircraft/c-hvy/aero/aero_rb6.txt` |
| 26 | `p6dof/p6dof_types/aircraft/fa-hvy/aero/aero.txt` |

## 行为树 / 智能体

**关键词**：`WSF_BEHAVIOR_TREE_PROCESSOR`、`behavior_tree`、`sequencer`、`selector`、`advanced_behavior`

| 命中 | 文件 |
| --: | :-- |
| 82 | `p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt` |
| 52 | `six_dof/six_dof_types/aircraft/fa-lgt/fa-lgt-bombs-ld.txt` |
| 32 | `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt-bombs-hd.txt` |
| 32 | `p6dof/p6dof_types/aircraft/b-fw/b-fw-bombs.txt` |
| 26 | `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt-bombs-ld.txt` |
| 16 | `behavior_tree/platforms/subtrees_striker.txt` |
| 16 | `base_types/processors/timeline_agents/timeline_flyer_proc.txt` |
| 16 | `air_to_air/platforms/brawler_test.txt` |
| 13 | `p6dof/p6dof_types/aircraft/a-lgt/a-lgt-bombs.txt` |
| 13 | `brawler/platforms/brawler_platform.txt` |

## 脚本 / 状态机

**关键词**：`WSF_SCRIPT_PROCESSOR`、`script_variables`、`state`、`next_state`、`on_update`、`script_struct`

| 命中 | 文件 |
| --: | :-- |
| 172 | `base_types/processors/timeline_agents/timeline_proc_fsm.txt` |
| 75 | `logistics/processors/strike_controller.txt` |
| 61 | `ballistic_missile_shootdown/processors/anti_ballistic_missile_processor.txt` |
| 59 | `timeline/processors/quantum_agents/aiai/behavior_grinder.txt` |
| 58 | `logistics/processors/shuttle_transport_processor.txt` |
| 56 | `behavior_tree/processors/quantum_agents/aiai/selector_pincer_fsm.txt` |
| 54 | `logistics/processors/platform_to_platform_transport_processor.txt` |
| 53 | `space_operations/processors/establish_link_processor.txt` |
| 49 | `space_operations/processors/anti_ballistic_missile_processor.txt` |
| 45 | `suppressor/platforms/sam_battery.txt` |

## 航路 / 区域 / 编组

**关键词**：`route`、`zone`、`group`、`position`、`heading`、`speed`

| 命中 | 文件 |
| --: | :-- |
| 11094 | `traffic_demos/roads/china_expressways.txt` |
| 9493 | `traffic_demos/roads/vwc_roadnetwork.txt` |
| 9493 | `traffic_demos/roads/korea_roadnetwork.txt` |
| 3681 | `traffic_demos/roads/nkorea_roadnetwork.txt` |
| 3098 | `traffic_demos/roads/china_roadnetwork.txt` |
| 1488 | `traffic_demos/roads/scal_roadnetwork.txt` |
| 1368 | `traffic_demos/roads/taiwan_freeways_expressways.txt` |
| 764 | `traffic_demos/roads/stl_roadnetwork.txt` |
| 692 | `traffic_demos/roads/lasvegas_roadnetwork.txt` |
| 231 | `six_dof/rb6_airport_operations.txt` |

## 事件输出 / 回放

**关键词**：`event_output`、`event_pipe`、`observer`、`csv_event_output`、`WSF_EVENT_OUTPUT`

| 命中 | 文件 |
| --: | :-- |
| 38 | `air_to_air/sensor_observer.txt` |
| 8 | `sensor_demos/passive_detector_df_demo.txt` |
| 8 | `iads_c2_demos/assignment_priority.txt` |
| 8 | `iads/view.txt` |
| 8 | `iads/strike-rt.txt` |
| 8 | `iads/iads-rt.txt` |
| 8 | `aea_iads/view.txt` |
| 8 | `aea_iads/strike.txt` |
| 8 | `aea_iads/strike-rt.txt` |
| 8 | `aea_iads/iads-rt.txt` |

## 目标特征 / RCS

**关键词**：`radar_signature`、`infrared_signature`、`optical_signature`、`WSF_RADAR_SIGNATURE`、`inherent_contrast`

| 命中 | 文件 |
| --: | :-- |
| 8828 | `satellite_demos/satellites/satcat/satcat.txt` |
| 36 | `base_types/weapons/ssm/red_srbm_4.txt` |
| 36 | `base_types/weapons/ssm/red_icbm_2.txt` |
| 27 | `orwaca_iads/weapons/ssm/tbm.txt` |
| 27 | `base_types/weapons/ssm/red_srbm_3.txt` |
| 27 | `base_types/weapons/ssm/red_mrbm_1.txt` |
| 27 | `ballistic_missile_shootdown/weapons/ssm/red_mrbm_1.txt` |
| 18 | `base_types/weapons/ssm/red_mrbm_2.txt` |
| 18 | `base_types/weapons/sam/blue_lr_sam_common.txt` |
| 18 | `air_to_air/scenarios/escort.txt` |

## 太空 / 轨道

**关键词**：`WSF_SPACE_MOVER`、`orbit`、`WSF_ORBITAL_MOVER`、`constellation`

| 命中 | 文件 |
| --: | :-- |
| 2931 | `satellite_demos/satellites/satcat/satcat.txt` |
| 778 | `satellite_demos/TLE/geo_platforms.txt` |
| 190 | `satellite_demos/TLE/resource_platforms.txt` |
| 168 | `satellite_demos/satellites/orbit_tle/globalstar.txt` |
| 136 | `satellite_demos/satellites/orbit_tle/intelsat.txt` |
| 126 | `satellite_demos/TLE/iridium_platforms.txt` |
| 118 | `satellite_demos/satellites/orbit_tle/orbcomm.txt` |
| 116 | `satellite_demos/TLE/science_platforms.txt` |
| 102 | `satellite_demos/TLE/cubesat_platforms.txt` |
| 94 | `satellite_demos/TLE/globalstar_platforms.txt` |

## 赛博

**关键词**：`WSF_CYBER`、`cyber_attack`、`cyber_effect`、`tool`、`WSF_CYBER_ROUTER`

| 命中 | 文件 |
| --: | :-- |
| 7 | `cyber/GoneFishing_ConstraintDemo.txt` |
| 6 | `cyber/exfiltrate_demo/MITM_exfiltrate_demo.txt` |
| 6 | `cyber/avengers_detonate_effect.txt` |
| 5 | `base_types/weapons/aam/ata4_generator.txt` |
| 4 | `space_operations/launch_vehicles/saturn_v/tune.txt` |
| 4 | `space_operations/launch_vehicles/proton_m/tune.txt` |
| 4 | `space_operations/launch_vehicles/launcher_one/lcg_ccafs_leo.txt` |
| 4 | `space_operations/launch_vehicles/falcon_heavy/lcg_ccafs_leo.txt` |
| 4 | `space_operations/launch_vehicles/falcon_9/lcg_ccafs_leo.txt` |
| 4 | `space_operations/launch_vehicles/delta_iv_m/lcg_ccafs_leo.txt` |

## 交通 / 环境

**关键词**：`road_traffic`、`air_traffic`、`sea_traffic`、`terrain`、`atmosphere`

| 命中 | 文件 |
| --: | :-- |
| 21 | `hellfire/semiactive_laser_hellfire/longbow_type.txt` |
| 21 | `hellfire/laser_designation_via_dis/longbow_type.txt` |
| 21 | `hellfire/active_radar_hellfire/longbow_type.txt` |
| 17 | `coverage_demos/terrain/uav_coverage_terrain.txt` |
| 9 | `terrain_following/terrain_demo.txt` |
| 7 | `six_dof_with_brawler/six_dof_types/environment/six_dof_environment.txt` |
| 7 | `six_dof/six_dof_types/environment/six_dof_environment.txt` |
| 7 | `air_to_air/six_dof_types/environment/six_dof_environment.txt` |
| 6 | `sosm/sensor_plot/common_types.txt` |
| 6 | `p6dof/p6dof_types/environment/p6dof_environment.txt` |

---

## 附：demo 顶层工程目录一览

| 目录 | `.txt` 数 | 说明 |
| :-- | --: | :-- |
| `acoustic/` | 2 | |
| `aea_iads/` | 36 | |
| `air_to_air/` | 91 | |
| `alternate_locations/` | 20 | |
| `alv_routing/` | 12 | |
| `ballistic/` | 13 | |
| `ballistic_missile_shootdown/` | 25 | |
| `base_types/` | 300 | |
| `base_types_nx/` | 3 | |
| `bearing_only/` | 13 | |
| `behavior_tree/` | 126 | |
| `brawler/` | 58 | |
| `chaff/` | 2 | |
| `cislunar/` | 5 | |
| `ciws/` | 10 | |
| `comm/` | 8 | |
| `coverage_demos/` | 36 | |
| `cyber/` | 78 | |
| `distributed_operations/` | 3 | |
| `draw/` | 4 | |
| `electronic_warfare/` | 85 | |
| `engage/` | 20 | |
| `example_scripts/` | 4 | |
| `exchange_proc/` | 4 | |
| `fires/` | 21 | |
| `gun_engagement/` | 15 | |
| `heatmap/` | 32 | |
| `hel/` | 20 | |
| `hellfire/` | 29 | |
| `iads/` | 73 | |
| `iads_c2_demos/` | 49 | |
| `kinematic_mover/` | 1 | |
| `l16_j11/` | 6 | |
| `laser_designator/` | 17 | |
| `launcher/` | 16 | |
| `logistics/` | 24 | |
| `multiresolution_demos/` | 28 | |
| `new_guidance/` | 23 | |
| `noise_cloud/` | 2 | |
| `orwaca_iads/` | 68 | |
| `oth_radar/` | 2 | |
| `outer_air_battle/` | 30 | |
| `p6dof/` | 1241 | |
| `parachute/` | 3 | |
| `route_finder_demos/` | 14 | |
| `satellite_demos/` | 149 | |
| `script_demos/` | 8 | |
| `sensor_demos/` | 27 | |
| `sensor_plot/` | 85 | |
| `ship_ad/` | 39 | |
| `shooter/` | 22 | |
| `signature_demos/` | 17 | |
| `simple_scenario/` | 7 | |
| `six_dof/` | 1331 | |
| `six_dof_with_brawler/` | 34 | |
| `sosm/` | 32 | |
| `space_operations/` | 129 | |
| `suppressor/` | 11 | |
| `swarm/` | 14 | |
| `tbm_demos/` | 19 | |
| `terrain_following/` | 1 | |
| `timeline/` | 26 | |
| `timeline_lead/` | 17 | |
| `traffic_demos/` | 60 | |
| `visual_part/` | 5 | |
| `wargame/` | 46 | |
