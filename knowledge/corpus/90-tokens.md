# 全量关键字索引（token → 块类型 / 出处）

> 用途：**任何在 demo 中出现过的命令 / 参数名都能在此查到**；命中后按「块类型」到对应分卷看完整片段。
> 生成方式：扫描 49,816 个块的每一行首词，脚本机械统计。

| token | 次数 | 所在块类型 | 首个出处 |
| :-- | --: | :-- | :-- |
| `a` | 3 | on_update, platform_type, processor | `example_scripts/proc_mover_demo.txt:62` |
| `a0` | 4 | behavior, precondition | `base_types/platforms/brawler/alternatives/behavior_alt3474_slow_pull_current_plane.txt:102` |
| `acc` | 8 | script | `six_dof/scripts/brawler_behaviors.txt:219` |
| `acc0` | 4 | script | `six_dof/scripts/brawler_behaviors.txt:223` |
| `acidf` | 2 | script | `base_types/platforms/brawler/alternatives/behavior_weapon_decision_missile.txt:310` |
| `acoustic_signature` | 18 | acoustic_signature, platform_type | `acoustic/acoustic_demo.txt:10` |
| `acoustic_type` | 2 | sensor | `acoustic/acoustic_demo.txt:49` |
| `acquire_deltas` | 15 | acquire_deltas, close_target_detection, mode… | `chaff/chaff_example_ttr.txt:210` |
| `action_change_aero_mode` | 87 | p6dof_object_type, p6dof_object_types, point_mass_vehicle_type… | `p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:45` |
| `action_disable_controls` | 12 | p6dof_object_type, p6dof_object_types, point_mass_vehicle_type… | `p6dof/p6dof_types/weapons/agm-mrc/agm-mrc.txt:80` |
| `action_enable_controls` | 12 | p6dof_object_type, p6dof_object_types, point_mass_vehicle_type… | `p6dof/p6dof_types/weapons/agm-mrc/agm-mrc.txt:83` |
| `action_enable_size_factor` | 3 | p6dof_object_type, sequencer | `p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:600` |
| `action_ignite_engine` | 75 | p6dof_object_type, p6dof_object_types, point_mass_vehicle_type… | `p6dof/p6dof_types/misc/srb-rato/srb-rato.txt:59` |
| `action_ignite_subobject` | 38 | p6dof_object_type, p6dof_object_types, point_mass_vehicle_type… | `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt-zll.txt:51` |
| `action_jett_obj` | 448 | p6dof_object_type, p6dof_object_types, point_mass_vehicle_type… | `p6dof/p6dof_types/aircraft/a-lgt/a-lgt-bombs.txt:103` |
| `action_jett_self` | 9 | p6dof_object_type, p6dof_object_types, point_mass_vehicle_type… | `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt-zll.txt:56` |
| `action_null` | 22 | p6dof_object_type, p6dof_object_types, point_mass_vehicle_type… | `p6dof/p6dof_types/weapons/gbu-500/gbu-500.txt:40` |
| `action_set_graphical_model` | 4 | p6dof_object_type, p6dof_object_types, sequencer | `p6dof/p6dof_types/weapons/ubu-500/ubu-500-hd.txt:40` |
| `action_shutdown_subobject` | 12 | sequencer | `p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:1101` |
| `activated` | 4 | on_update, platform_type | `p6dof/aam_launch_test.txt:124` |
| `active_pilot` | 45 | pilot_manager | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/control_inputs_pm6.txt:72` |
| `actuator` | 360 | actuator, control_surface | `p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:184` |
| `add` | 3324 | comm, multiresolution_fuel, multiresolution_optical_signature… | `air_to_air/scenarios/escort.txt:56` |
| `add_subobject` | 24 | platform_type, weapon | `six_dof/platforms/fa-lgt-bombs-ld.txt:26` |
| `adding` | 1 | script | `air_to_air/prdata/rules_utils.txt:1119` |
| `adjust` | 8 | on_message, platform_type, processor… | `behavior_tree/platforms/run_tree_striker.txt:105` |
| `advanced_behavior` | 77 | advanced_behavior | `air_to_air/rules/crank.txt:20` |
| `advanced_behavior_tree` | 68 | advanced_behavior_tree, platform, platform_type… | `air_to_air/platforms/brawler_test.txt:241` |
| `aero` | 683 | aero, ballistic_missile_launch_computer, mover… | `air_to_air/weapons/aam/medium_range_radar_missile.txt:95` |
| `aero_center_x` | 28 | aero_data, aero_mode | `p6dof/p6dof_types/weapons/simple-icbm/ICBM_BalloonAero.txt:41` |
| `aero_center_y` | 28 | aero_data, aero_mode | `p6dof/p6dof_types/weapons/simple-icbm/ICBM_BalloonAero.txt:42` |
| `aero_center_z` | 28 | aero_data, aero_mode | `p6dof/p6dof_types/weapons/simple-icbm/ICBM_BalloonAero.txt:43` |
| `aero_component` | 138 | aero_component | `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:297` |
| `aero_data` | 36 | aero_data | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/aero/aero_pm6.txt:10` |
| `aero_file` | 35 | fuel, mover, platform… | `air_to_air/platforms/dca.txt:39` |
| `aero_mode` | 30 | aero_data, aero_mode | `p6dof/p6dof_types/weapons/simple-icbm/ICBM_BalloonAero.txt:37` |
| `afterburner_threshold` | 174 | autopilot_config, limits_and_settings, pid_group | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:89` |
| `agility_type` | 136 | agility_type, beam, effect… | `aea_iads/sensors/radar/ew_radar.txt:79` |
| `air_target_file` | 5 | tool | `ballistic_missile_shootdown/weapons/sam/blue_naval_sam_lcg.txt:31` |
| `air_traffic` | 1 | air_traffic | `traffic_demos/scenarios/china_air_traffic.txt:9` |
| `airbase` | 114 | air_traffic, airbase | `traffic_demos/scenarios/china_airports.txt:44` |
| `aircraft` | 98 | air_traffic, airbase | `traffic_demos/scenarios/china_air_traffic.txt:44` |
| `aircraft_type` | 15 | air_traffic, aircraft_type | `traffic_demos/scenarios/china_airports.txt:15` |
| `alarm_pattern` | 3 | antenna_pattern | `base_types/sensors/radar/mtd_radar.txt:11` |
| `alert` | 1 | script | `air_to_air/prdata/rules_utils.txt:536` |
| `all` | 4 | cyber_effect, default, platform_type | `cyber/cyber/cyber_effects/delay_comms.txt:15` |
| `allocator` | 19 | platform_type, processor | `base_types/platforms/brawler/brawler_flight_lead.txt:67` |
| `allocator_extra_assets` | 10 | platform_type, processor | `base_types/platforms/brawler/brawler_flight_lead.txt:68` |
| `allow_any_comm` | 4 | j11, link16_interface | `l16_j11/j11_in.txt:65` |
| `allow_incidental_damage` | 50 | weapon_effects | `alternate_locations/weapons/agm/blue_gps_bomb_1.txt:71` |
| `allow_route_following` | 24 | phase, platform_type, processor | `cyber/weapons/agm/client_agm.txt:109` |
| `allow_track_reporting_when_flooded` | 12 | false_target_screener, sensor | `aea_iads/sensors/radar/ew_radar.txt:102` |
| `aload` | 1 | script | `air_to_air/rules/brawler_script_util.txt:379` |
| `alpha` | 7636 | aero_data, aero_mode, autopilot_support_tables… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_support_tables.txt:325` |
| `alpha_max` | 174 | autopilot_config, limits_and_settings, pid_group | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:92` |
| `alpha_max_mach_table` | 32 | alpha_max_mach_table, autopilot_support_tables | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_support_tables.txt:100` |
| `alpha_min` | 174 | autopilot_config, limits_and_settings, pid_group | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:91` |
| `alpha_min_mach_table` | 32 | alpha_min_mach_table, autopilot_support_tables | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_support_tables.txt:144` |
| `alpha_stabilizing_frequency_mach_table` | 18 | aero_data, alpha_stabilizing_frequency_mach_table | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/aero/aero_pm6.txt:42` |
| `alpha_versus_mach_cl_table` | 32 | alpha_versus_mach_cl_table, autopilot_support_tables | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_support_tables.txt:188` |
| `alt` | 448 | irregular_table | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/prop/data/thrust_ab_alt_mach.txt:14` |
| `alt_ctrl` | 4 | behavior, precondition | `base_types/platforms/brawler/alternatives/behavior_alt3841_aim_missile_typ4.txt:116` |
| `alt_ft` | 64 | location, p6dof_terrain, region… | `air_to_air/six_dof_types/environment/terrain_config.txt:19` |
| `alternate_frequency` | 6 | comm, platform_type, transmitter | `satellite_demos/platforms/iridium.txt:38` |
| `alternate_locations` | 18 | alternate_locations, platform | `alternate_locations/scenarios/blue_sams.txt:22` |
| `altitude` | 504 | altitude, angle_of_attack_table, atmospheric_coefficients… | `base_types/processors/quantum_agents/aiai/behavior_evade.txt:115` |
| `altitude_and_mach` | 1 | tool | `base_types/weapons/agm/atg_mach_4_missile_lc_generator.txt:43` |
| `altitude_attributes` | 3 | altitude_attributes, processor, weapon_table | `iads_c2_demos/processors/battle_manager.txt:37` |
| `altitude_error_to_rate_of_climb_gain` | 3 | mover | `hellfire/active_radar_hellfire/helo_mover.txt:125` |
| `altitude_limits` | 4 | vertical_map | `sensor_plot/radar/vm-ucav-dry.txt:86` |
| `altitude_range` | 18 | state, target_model | `sosm/targets/red_multirole_fighter_3/red_multirole_fighter_3.txt:26` |
| `altitude_step` | 4 | vertical_map | `sensor_plot/radar/vm-ucav-dry.txt:87` |
| `altitude_units` | 6 | horizontal_coverage, vertical_coverage | `sensor_plot/radar/hcd-ew_radar.txt:46` |
| `altitudes` | 15 | altitudes, clutter_table, fuel… | `example_scripts/fuel_table_demo.txt:34` |
| `amplitude_quantization_bits` | 5 | antenna_pattern | `aea_iads/weapons/jammer/soj_xband_jammer.txt:19` |
| `analysis_map` | 4 | analysis_map, horizontal_map | `sensor_plot/radar/analysis_map-ucav-dry.txt:35` |
| `and` | 3 | script, script_variables | `air_to_air/prdata/rules_utils.txt:483` |
| `ang` | 2 | script | `p6dof/p6dof_types/scripts/support_scripts.txt:54` |
| `angle` | 8 | execute, script | `base_types/processors/quantum_agents/aiai/behavior_pincer.txt:115` |
| `angle_deg` | 4 | script | `p6dof/airport_operations.txt:504` |
| `angle_mapping_table` | 360 | angle_mapping_table, control_surface | `p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:179` |
| `angle_of_attack_table` | 18 | angle_of_attack_table, mover, platform_type | `sensor_plot/eoir/px_fighter.txt:22` |
| `angular_resolution` | 9 | mode_template, platform, platform_type… | `base_types/sensors/eo_ir/generic_eoir.txt:35` |
| `announce` | 3 | on_entry, processor, state | `outer_air_battle/processors/blue_multirole_fighter_2_task_processor.txt:171` |
| `anomaly` | 426 | execute, platform | `satellite_demos/4th_constellation_demo.txt:60` |
| `antenna_height` | 173 | beam, mode_template, platform_type… | `aea_iads/sensors/radar/acq_radar.txt:41` |
| `antenna_ohmic_loss` | 6 | receiver, sensor | `base_types/sensors/radar/mtd_radar.txt:49` |
| `antenna_pattern` | 1547 | antenna_pattern, beam, comm… | `aea_iads/sensors/esm_rwr/ucav_esm.txt:14` |
| `antenna_plot` | 24 | antenna_plot | `sensor_plot/antenna/circular_2d.txt:15` |
| `antenna_tilt` | 107 | beam, mode_template, receiver… | `air_to_air/sensors/esm_rwr/esm.txt:32` |
| `aperture_diameter` | 14 | comm, fluence_model, receiver… | `hel/ground_hel_vs_hypersonic.txt:59` |
| `aperture_shape` | 13 | antenna_pattern | `air_to_air/sensors/esm_rwr/esm.txt:17` |
| `apoapsis_altitude` | 1 | platform | `satellite_demos/aerobraking_demo.txt:39` |
| `apogee` | 2 | script | `p6dof/sam_launch_test.txt:172` |
| `application` | 35 | dis_interface | `aea_iads/dis_realtime.txt:13` |
| `argument_of_periapsis` | 13 | common, mover, multiresolution_mover… | `multiresolution_demos/space_mover_demo.txt:64` |
| `aspect_ratio` | 111 | aero | `air_to_air/weapons/aam/medium_range_radar_missile.txt:108` |
| `assess_engage_via` | 1 | processor | `iads_c2_demos/processors/weapons_manager_ai.txt:18` |
| `asset` | 17 | grid, precondition, subgrid | `base_types/processors/quantum_agents/aiai/behavior_evade.txt:223` |
| `asset_data_update_interval` | 8 | platform, platform_type, processor | `air_to_air/platforms/brawler_test.txt:197` |
| `asset_perception` | 43 | platform, platform_type, processor | `air_to_air/platforms/brawler_test.txt:226` |
| `asset_representation` | 10 | platform_type, processor | `base_types/processors/timeline_agents/flight_lead_timeline_tasks_from_data.txt:105` |
| `asset_update_interval` | 12 | platform_type, processor | `behavior_tree/platforms/flight_lead.txt:51` |
| `assets` | 12 | assets, coverage | `coverage_demos/coverage_grids/conus_zone_coverage.txt:26` |
| `assign_track_updates` | 2 | processor, routing_table | `iads_c2_demos/processors/disseminate_c2.txt:21` |
| `assignment_cancel` | 2 | processor, routing_table | `iads_c2_demos/processors/disseminate_c2.txt:24` |
| `assignment_delay` | 1 | processor | `iads_c2_demos/processors/asset_manager.txt:22` |
| `assignment_status` | 2 | processor, routing_table | `iads_c2_demos/processors/disseminate_c2.txt:23` |
| `assignments` | 2 | processor, routing_table | `iads_c2_demos/processors/disseminate_c2.txt:22` |
| `assumed_range_for_angle_only_targets` | 7 | platform, platform_type, processor | `air_to_air/platforms/brawler_test.txt:210` |
| `assumes` | 1 | script | `air_to_air/prdata/rules_utils.txt:223` |
| `at` | 1 | script | `air_to_air/prdata/rules_utils.txt:369` |
| `at_end_of_path` | 82 | mover, platform, platform_type | `aea_iads/platforms/soj.txt:412` |
| `at_time` | 6 | conjunction_setup, mover, platform | `space_operations/conjunction_ssn.txt:41` |
| `atmosphere_model` | 18 | atmosphere_model, atmospheric_coefficients, dynamics… | `hel/atmosphere/AAA_README.txt:84` |
| `atmosphere_table` | 4 | atmosphere_table | `air_to_air/six_dof_types/environment/six_dof_environment.txt:43` |
| `atmospheric_attenuation` | 6 | sensor | `base_types/sensors/eo_ir/generic_irst.txt:79` |
| `atmospheric_coefficients` | 2 | atmospheric_coefficients | `hel/atmosphere/AAA_README.txt:81` |
| `atmospheric_refraction_residual` | 4 | error_model, sensor | `sensor_demos/esm_tdoa_demo.txt:124` |
| `attachment_type` | 8 | platform | `electronic_warfare/comm_jamming.txt:192` |
| `attack_detection_delay_time` | 6 | attack_response, cyber_protect | `cyber/cyber/cyber_protections/altitude_protect.txt:22` |
| `attack_detection_draw_frequency` | 3 | cyber_attack | `cyber/cyber/cyber_attacks/crash.txt:27` |
| `attack_recovery_delay_time` | 6 | attack_response, cyber_protect | `cyber/cyber/cyber_protections/altitude_protect.txt:23` |
| `attack_response` | 6 | attack_response, cyber_protect | `cyber/cyber/cyber_protections/altitude_protect.txt:14` |
| `attack_success` | 1 | on_initialize | `air_to_air/processors/assessment_scripts.txt:501` |
| `attack_success_draw_frequency` | 3 | cyber_attack | `cyber/cyber/cyber_attacks/crash.txt:25` |
| `attenuation` | 115 | atmospheric_coefficients, attenuation, comm… | `aea_iads/sensors/radar/ttr_radar.txt:51` |
| `attenuation_model` | 20 | beam, mode_template, sensor… | `air_to_air/sensors/radar/aesa.txt:55` |
| `attitude_controller` | 6 | attitude_controller, mover, platform_type | `satellite_demos/5th_iridium_flares_demo.txt:261` |
| `attrib` | 18 | altitude_attributes, processor, speed_attributes… | `iads_c2_demos/processors/battle_manager.txt:32` |
| `auto_dis_mapping` | 3 | xio_interface | `aea_iads/xio_interface.txt:15` |
| `automated_interface_linking` | 6 | platform_type, router | `cyber/exfiltrate_demo/platforms/iads_cmdr.txt:135` |
| `automatic_recovery_time` | 2 | mover, platform_type | `hellfire/laser_designation_via_dis/target_type.txt:33` |
| `automatic_target_cueing` | 10 | horizontal_map, weapon | `base_types/weapons/other/gun.txt:119` |
| `automatic_turn_off` | 4 | platform_type, sensor | `sensor_demos/platforms/uav_sar.txt:60` |
| `autopilot_config` | 58 | autopilot_config | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:10` |
| `autopilot_support_tables` | 1 | autopilot_support_tables | `p6dof/p6dof_types/misc/srb-rato/controls/autopilot_support_tables.txt:18` |
| `autostart` | 18 | dis_interface | `aea_iads/dis_realtime.txt:17` |
| `aux_data` | 746 | aux_data, navigation, platform… | `aea_iads/platforms/ew_radar.txt:34` |
| `auxiliary_antenna_pattern` | 12 | beam, effect, electronic_protect… | `aea_iads/sensors/radar/ew_radar.txt:43` |
| `available` | 2 | processor, script | `outer_air_battle/processors/cvn_task_processor.txt:112` |
| `average_speed` | 40 | mover, platform_type | `alternate_locations/weapons/sam/large_sam.txt:30` |
| `avg_hdg` | 4 | advanced_behavior, execute | `air_to_air/rules/pump_in.txt:118` |
| `axes` | 24 | antenna_plot | `sensor_plot/antenna/circular_2d.txt:18` |
| `azimuth` | 10 | bistatic_signature, radar_signature | `base_types/signatures/small_bistatic_radar_signature.txt:12` |
| `azimuth_angle_increment` | 3 | clutter_model, sensor | `sensor_plot/clutter/clutter_table_generation.txt:42` |
| `azimuth_angle_limit` | 3 | clutter_model, sensor | `sensor_plot/clutter/clutter_table_generation.txt:41` |
| `azimuth_beamwidth` | 223 | antenna_pattern, constant_pattern, error_model_parameters… | `aea_iads/sensors/radar/acq_radar.txt:18` |
| `azimuth_bin_count_and_limit` | 6 | intercept_results, launch_computer | `base_types/weapons/aam/blue_sr_a2a_ir_missile_ata_launch_computer_alt10kft_0.6mach.txt:32` |
| `azimuth_cue_limits` | 10 | mode, sensor | `air_to_air/sensors/esm_rwr/esm.txt:80` |
| `azimuth_cue_rate` | 6 | mode_template, sensor | `hellfire/active_radar_hellfire/hellfire_type.txt:39` |
| `azimuth_delta` | 30 | acquire_deltas, close_target_detection, mode… | `chaff/chaff_example_ttr.txt:211` |
| `azimuth_distribution` | 13 | antenna_pattern | `air_to_air/sensors/esm_rwr/esm.txt:18` |
| `azimuth_error` | 13 | effect, electronic_attack, electronic_protect… | `electronic_warfare/track_effect_1.txt:48` |
| `azimuth_error_sigma` | 71 | mode_template, platform, platform_type… | `air_to_air/platforms/dca.txt:83` |
| `azimuth_exponent` | 11 | antenna_pattern | `air_to_air/sensors/esm_rwr/esm.txt:20` |
| `azimuth_field_of_view` | 331 | comm, common, field_of_view… | `aea_iads/weapons/jammer/soj_sband_jammer.txt:34` |
| `azimuth_limits` | 8 | horizontal_coverage, spherical_map | `sensor_plot/radar/hcd-ew_radar.txt:37` |
| `azimuth_range` | 18 | antenna_plot | `sensor_plot/antenna/circular_2d.txt:19` |
| `azimuth_scan_limits` | 225 | beam, mode, mode_template… | `acoustic/acoustic_demo.txt:54` |
| `azimuth_side_lobe_level` | 2 | antenna_pattern | `sensor_plot/antenna/genap_circular_pattern.txt:20` |
| `azimuth_slew_limits` | 151 | comm, common, multiresolution_sensor… | `aea_iads/sensors/radar/ttr_radar.txt:38` |
| `azimuth_slew_rate` | 16 | comm, common, multiresolution_sensor… | `ciws/sensors/radar/red_ciws_radar_1.txt:80` |
| `azimuth_steering_angle` | 8 | antenna_plot | `sensor_plot/antenna/esa_2d.txt:20` |
| `azimuth_step` | 24 | antenna_plot, horizontal_coverage, spherical_map | `sensor_plot/antenna/circular_2d.txt:20` |
| `b` | 3 | on_update, platform_type, processor | `example_scripts/proc_mover_demo.txt:63` |
| `back_baffled` | 1 | antenna_pattern | `sensor_plot/antenna/esa_pattern.txt:18` |
| `background_noise` | 10 | sensor | `acoustic/acoustic_demo.txt:69` |
| `background_radiance` | 10 | atmosphere_model, sensor | `base_types/sensors/eo_ir/generic_irst.txt:85` |
| `backscatter_coefficient` | 14 | platform_type, sensor | `sensor_plot/sar/dt_example.txt:26` |
| `ballistic_coefficient` | 14 | mover, platform_type, stage | `tbm_demos/weapons/ssm/tbm1.txt:27` |
| `ballistic_missile_launch_computer` | 9 | ballistic_missile_launch_computer | `ballistic_missile_shootdown/weapons/ssm/red_mrbm_1.txt:381` |
| `ballistic_types` | 1 | ballistic_types | `fires/types/fires_all_indirect_fire.txt:29` |
| `band` | 34 | infrared_signature, sensor, state… | `base_types/sensors/eo_ir/generic_irst.txt:92` |
| `bandwidth` | 757 | beam, comm, mode… | `aea_iads/platforms/soj.txt:181` |
| `bank` | 5 | script | `air_to_air/rules/brawler_script_util.txt:398` |
| `bank_angle_max` | 174 | autopilot_config, limits_and_settings, pid_group | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:100` |
| `beam` | 126 | beam, mode, mode_template… | `electronic_warfare/agile_auto-repeater_jamming.txt:148` |
| `beam_power_distribution` | 8 | weapon | `aea_iads/weapons/jammer/soj_sband_jammer.txt:28` |
| `beam_quality` | 10 | fluence_model, weapon | `hel/ground_hel_vs_hypersonic.txt:76` |
| `beam_tilt` | 177 | beam, mode_template, receiver… | `aea_iads/sensors/radar/ew_radar.txt:112` |
| `beamwidth` | 179 | antenna_pattern, circular_pattern, comm… | `aea_iads/sensors/radar/ew_radar.txt:28` |
| `beans` | 2 | script | `air_to_air/processors/assessment_scripts.txt:193` |
| `bearing` | 4 | script | `air_to_air/prdata/rules_utils.txt:912` |
| `bearing_measurement_sigma` | 30 | filter, platform_type, sensor | `alternate_locations/platforms/common.txt:40` |
| `bearing_reference` | 6 | distribution, false_target | `aea_iads/weapons/jammer/false_target.txt:31` |
| `bearings` | 4 | altitudes, clutter_table | `sensor_plot/clutter/clutter_table_generation.txt:114` |
| `beg` | 2 | on_initialize2, processor | `route_finder_demos/3d_route_finder.txt:161` |
| `behavior` | 220 | behavior, selector | `base_types/platforms/brawler/alternatives/behavior_alt1514_point.txt:12` |
| `behavior_calculation_update_interval` | 1 | processor | `six_dof/processors/sa.txt:21` |
| `behavior_node` | 1119 | advanced_behavior_tree, behavior, behavior_tree… | `air_to_air/platforms/brawler_test.txt:250` |
| `behavior_tree` | 60 | behavior_tree, platform_type, processor… | `base_types/platforms/brawler/brawler_platform.txt:149` |
| `beta` | 64 | aero_data, aero_mode, cn_beta_mach_table… | `alv_routing/sensors/ew_radar.txt:53` |
| `beta_max` | 174 | autopilot_config, limits_and_settings, pid_group | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:97` |
| `beta_stabilizing_frequency_mach_table` | 18 | aero_data, beta_stabilizing_frequency_mach_table | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/aero/aero_pm6.txt:46` |
| `bias` | 2 | on_update, platform_type | `hellfire/active_radar_hellfire/hellfire_type.txt:203` |
| `bid` | 10 | query_bid_type | `base_types/processors/ripr_agents/aiai/aiai_processor.txt:260` |
| `bingo_fuel` | 5 | platform_type, processor | `air_to_air/platforms/brawler_test.txt:183` |
| `bingo_misl` | 3 | script | `air_to_air/prdata/rules_utils.txt:1205` |
| `bingo_quantity` | 34 | fuel, platform_type | `base_types/platforms/red_multirole_fighter_2_base.txt:74` |
| `bistatic_signature` | 4 | bistatic_signature, radar_signature | `base_types/signatures/small_bistatic_radar_signature.txt:11` |
| `blanking_threshold` | 95 | beam, effect, electronic_protect… | `aea_iads/sensors/radar/ew_radar.txt:62` |
| `bloom_diameter` | 2 | chaff_parcel | `chaff/chaff_example.txt:27` |
| `blue_aircraft` | 3 | script | `air_to_air/observer.txt:113` |
| `blue_sam` | 2 | script | `air_to_air/observer.txt:118` |
| `blue_total_ac` | 1 | script | `air_to_air/observer.txt:388` |
| `blue_total_sam` | 1 | script | `air_to_air/observer.txt:393` |
| `body_g_limit` | 2 | mover, platform_type | `terrain_following/terrain_demo.txt:49` |
| `body_pitch_rate` | 6 | guidance_group, test_guidance | `p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:931` |
| `body_rates_gain` | 24 | mode, mover | `hellfire/active_radar_hellfire/helo_mover.txt:23` |
| `body_roll_rate` | 12 | guidance_group, test_guidance | `p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:932` |
| `body_roll_to_tgt_az` | 2 | guidance_group, test_guidance | `p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:937` |
| `body_yaw_rate` | 14 | guidance_group, test_guidance | `p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:930` |
| `bool` | 2693 | advanced_behavior, aux_data, behavior… | `aea_iads/detection_writes.txt:48` |
| `border` | 6 | script | `air_to_air/rules/brawler_script_util.txt:170` |
| `braking_coefficient_of_friction` | 24 | ground_reaction_point, landing_gear, p6dof_object_type… | `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:100` |
| `braking_control_surface_name` | 16 | ground_reaction_point, landing_gear, p6dof_object_type… | `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:108` |
| `broadcast` | 5 | dis_interface, xio_interface | `distributed_operations/xio_part_1.txt:12` |
| `broke` | 1 | script | `base_types/processors/ripr_agents/aigci/aigci_processor.old.txt:187` |
| `btt` | 66 | advanced_behavior_tree, platform, platform_type… | `air_to_air/platforms/brawler_test.txt:242` |
| `bullet_comp_line` | 4 | script | `gun_engagement/run_me_second.txt:21` |
| `bullet_gen_line` | 8 | script | `gun_engagement/run_me_first.txt:126` |
| `bullet_line` | 15 | script | `gun_engagement/run_me_first.txt:35` |
| `burn_rate` | 50 | mover, platform_type, stage | `base_types/weapons/aam/blue_lr_a2a_rf_missile.txt:79` |
| `burn_time` | 2 | mover, stage | `base_types/weapons/sam/blue_sr_sam_common.txt:119` |
| `burn_times` | 10 | tool | `ballistic_missile_shootdown/weapons/ssm/red_mrbm_1_lcg.txt:30` |
| `busy` | 4 | next_state, platform_type, processor… | `laser_designator/platforms/uav.txt:182` |
| `bx` | 3 | script | `air_to_air/rules/brawler_script_util.txt:30` |
| `by` | 6 | script | `air_to_air/rules/brawler_script_util.txt:32` |
| `bz` | 3 | script | `air_to_air/rules/brawler_script_util.txt:42` |
| `c` | 3 | script | `air_to_air/rules/brawler_script_util.txt:61` |
| `call` | 106 | script | `base_types/platforms/brawler/alternatives/behavior_weapon_decision_gun.txt:67` |
| `call_sensor_track_observers` | 1 | sensor | `space_operations/sensors/sat_sensor.txt:18` |
| `callback` | 2 | callback, platform_type | `script_demos/script_demo_4.txt:30` |
| `cancel` | 44 | next_state, processor, script… | `aea_iads/processors/red_sam_battery_tactics.txt:253` |
| `cancelation_lock_ratio` | 8 | effect, electronic_protect, electronic_warfare… | `aea_iads/sensors/radar/ew_radar.txt:42` |
| `cancelation_ratios` | 4 | cancelation_ratios, effect, electronic_warfare… | `aea_iads/sensors/radar/ew_radar.txt:44` |
| `cancellation_lock_ratio` | 18 | effect, electronic_protect, electronic_warfare… | `electronic_warfare/jam_strobe_tracking.txt:125` |
| `cancellation_ratios` | 28 | cancellation_ratios, effect, electronic_protect… | `electronic_warfare/jam_strobe_tracking.txt:127` |
| `cap_ind` | 6 | advanced_behavior, execute, on_init… | `air_to_air/rules/orbit_rules.txt:83` |
| `category` | 350 | category, comm, platform… | `aea_iads/platforms/ew_radar.txt:20` |
| `cd_alpha_beta_mach_table` | 79 | aero_data, cd_alpha_beta_mach_table | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/aero/aero_pm6.txt:18` |
| `cd_alpha_mach_table` | 64 | aero_data, aero_mode, cd_alpha_mach_table | `p6dof/p6dof_types/weapons/simple-icbm/ICBM_BalloonAero.txt:22` |
| `cd_angle_mach_table` | 276 | aero_component, cd_angle_mach_table | `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:305` |
| `cd_beta_mach_table` | 2 | aero_data, cd_beta_mach_table | `p6dof/p6dof_types/weapons/simple-icbm/refAero.txt:66` |
| `cd_zero_subsonic` | 99 | aero | `alternate_locations/weapons/agm/blue_glide_bomb_1.txt:15` |
| `cd_zero_supersonic` | 99 | aero | `alternate_locations/weapons/agm/blue_glide_bomb_1.txt:16` |
| `cell_size` | 6 | heat_map, platform_type, processor | `heatmap/platforms/flight_lead.txt:59` |
| `center_of_mass_x` | 178 | mass_properties, p6dof_object_type, p6dof_object_types… | `p6dof/p6dof_types/aircraft/a-lgt/a-lgt.txt:32` |
| `center_of_mass_y` | 178 | mass_properties, p6dof_object_type, p6dof_object_types… | `p6dof/p6dof_types/aircraft/a-lgt/a-lgt.txt:33` |
| `center_of_mass_z` | 178 | mass_properties, p6dof_object_type, p6dof_object_types… | `p6dof/p6dof_types/aircraft/a-lgt/a-lgt.txt:34` |
| `cg_empty_x` | 213 | fuel_tank, p6dof_object_type, p6dof_object_types… | `p6dof/p6dof_types/aircraft/a-lgt/a-lgt.txt:69` |
| `cg_empty_y` | 213 | fuel_tank, p6dof_object_type, p6dof_object_types… | `p6dof/p6dof_types/aircraft/a-lgt/a-lgt.txt:70` |
| `cg_empty_z` | 213 | fuel_tank, p6dof_object_type, p6dof_object_types… | `p6dof/p6dof_types/aircraft/a-lgt/a-lgt.txt:71` |
| `cg_full_x` | 213 | fuel_tank, p6dof_object_type, p6dof_object_types… | `p6dof/p6dof_types/aircraft/a-lgt/a-lgt.txt:66` |
| `cg_full_y` | 213 | fuel_tank, p6dof_object_type, p6dof_object_types… | `p6dof/p6dof_types/aircraft/a-lgt/a-lgt.txt:67` |
| `cg_full_z` | 213 | fuel_tank, p6dof_object_type, p6dof_object_types… | `p6dof/p6dof_types/aircraft/a-lgt/a-lgt.txt:68` |
| `chaff_parcel` | 2 | chaff_parcel | `chaff/chaff_example.txt:24` |
| `change_desired` | 1 | on_initialize | `air_to_air/processors/assessment_scripts.txt:505` |
| `channels` | 1 | script | `base_types/processors/ripr_agents/aijam/aijam_processor.txt:656` |
| `check_for_ground_impact` | 17 | mover, platform_type | `signature_demos/platforms/rocket.txt:55` |
| `check_terrain_masking` | 12 | mode_template, platform, platform_type… | `coverage_demos/sensors/ground_sensor_geo.txt:22` |
| `check_transmitter_masking` | 20 | receiver, sensor | `sensor_demos/bistatic_demo.txt:49` |
| `chk_dead_buddy` | 2 | script | `air_to_air/prdata/rules_utils.txt:491` |
| `circuit_capacitance` | 2 | comm, receiver | `space_operations/comms/lasercomm_link.txt:61` |
| `circuit_temperature` | 2 | comm, receiver | `space_operations/comms/lasercomm_link.txt:60` |
| `circular` | 81 | platform, platform_type, zone | `aea_iads/platforms/large_sam_battalion.txt:105` |
| `circular_pattern` | 124 | antenna_pattern, circular_pattern | `air_to_air/weapons/aam/medium_range_radar_missile.txt:40` |
| `circular_report_rejection` | 53 | platform, platform_type, processor | `air_to_air/platforms/brawler_test.txt:121` |
| `cl` | 1787 | alpha_versus_mach_cl_table, autopilot_support_tables, irregular_table | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_support_tables.txt:194` |
| `cl_alpha_beta_mach_table` | 39 | aero_data, cl_alpha_beta_mach_table | `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:196` |
| `cl_alphadot_mach_table` | 39 | aero_data, cl_alphadot_mach_table | `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:219` |
| `cl_angle_alpha_beta_table` | 276 | aero_component, cl_angle_alpha_beta_table | `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:329` |
| `cl_beta_mach_table` | 2 | aero_data, cl_beta_mach_table | `p6dof/p6dof_types/weapons/simple-icbm/refAero.txt:108` |
| `cl_betadot_mach_table` | 39 | aero_data, cl_betadot_mach_table | `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:253` |
| `cl_max` | 126 | aero | `air_to_air/weapons/aam/medium_range_radar_missile.txt:105` |
| `cl_max_mach_table` | 32 | autopilot_support_tables, cl_max_mach_table | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_support_tables.txt:12` |
| `cl_min_mach_table` | 32 | autopilot_support_tables, cl_min_mach_table | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_support_tables.txt:56` |
| `clamp_gain` | 179 | clamp_gain | `p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:108` |
| `clientquantity` | 12 | on_update, platform | `cyber/scenarios/duck_hunt.txt:48` |
| `climb_rate` | 6 | platform, route | `draw/draw_demo.txt:159` |
| `clockwise` | 2 | platform, scheduler | `sensor_demos/spin_scheduler.txt:94` |
| `close_target_detection` | 11 | close_target_detection, mode, sensor | `chaff/chaff_example_ttr.txt:208` |
| `closest` | 1 | script | `base_types/processors/timeline_agents/flight_lead_filtered_timeline.txt:135` |
| `closest_hostile` | 1 | execute | `air_to_air/observer.txt:48` |
| `clp_angle_mach_table` | 264 | aero_component, clp_angle_mach_table | `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:333` |
| `clp_mach_table` | 39 | aero_data, clp_mach_table | `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:202` |
| `clq_angle_mach_table` | 264 | aero_component, clq_angle_mach_table | `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:337` |
| `clq_mach_table` | 39 | aero_data, clq_mach_table | `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:270` |
| `clr_angle_mach_table` | 264 | aero_component, clr_angle_mach_table | `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:341` |
| `clr_mach_table` | 39 | aero_data, clr_mach_table | `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:236` |
| `cls_host` | 1 | script | `air_to_air/prdata/rules_utils.txt:619` |
| `cls_host_ltrk` | 2 | advanced_behavior, execute | `air_to_air/rules/rultype_change.txt:141` |
| `clutter` | 3 | sensor | `base_types/sensors/radar/mtd_radar.txt:54` |
| `clutter_attenuation_factor` | 1 | sensor | `sensor_demos/clutter_demo.txt:80` |
| `clutter_model` | 21 | beam, clutter_model, mode… | `aea_iads/sensors/radar/ttr_radar.txt:23` |
| `clutter_table` | 2 | clutter_table | `sensor_plot/clutter/clutter_table_generation.txt:109` |
| `cm_alpha_beta_mach_table` | 39 | aero_data, cm_alpha_beta_mach_table | `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:82` |
| `cm_alpha_mach_table` | 10 | aero_data, aero_mode, cm_alpha_mach_table | `p6dof/p6dof_types/weapons/simple-icbm/ICBM_FullAero.txt:36` |
| `cm_alphadot_mach_table` | 39 | aero_data, cm_alphadot_mach_table | `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:122` |
| `cm_angle_alpha_mach_table` | 276 | aero_component, cm_angle_alpha_mach_table | `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:313` |
| `cmp_mach_table` | 39 | aero_data, cmp_mach_table | `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:105` |
| `cmq_angle_mach_table` | 264 | aero_component, cmq_angle_mach_table | `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:317` |
| `cmq_mach_table` | 39 | aero_data, cmq_mach_table | `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:88` |
| `cn_alpha_beta_mach_table` | 39 | aero_data, cn_alpha_beta_mach_table | `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:139` |
| `cn_angle_beta_mach_table` | 276 | aero_component, cn_angle_beta_mach_table | `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:321` |
| `cn_beta_mach_table` | 10 | aero_data, aero_mode, cn_beta_mach_table | `p6dof/p6dof_types/weapons/simple-icbm/ICBM_FullAero.txt:50` |
| `cn_betadot_mach_table` | 39 | aero_data, cn_betadot_mach_table | `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:145` |
| `cnfire` | 8 | script | `base_types/platforms/brawler/alternatives/behavior_weapon_decision_gun.txt:63` |
| `cnp_mach_table` | 39 | aero_data, cnp_mach_table | `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:179` |
| `cnr_angle_mach_table` | 264 | aero_component, cnr_angle_mach_table | `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:325` |
| `cnr_mach_table` | 39 | aero_data, cnr_mach_table | `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:162` |
| `coast_time` | 16 | platform_type, processor | `air_to_air/weapons/aam/medium_range_radar_missile.txt:214` |
| `coast_time_on_loss_of_target` | 31 | platform_type, processor | `ballistic_missile_shootdown/weapons/ssm/red_mrbm_1.txt:345` |
| `cold_part_area` | 4 | state, target_model | `sosm/targets/simple_target.txt:19` |
| `cold_part_radiant_intensity` | 2 | state, target_model | `sosm/targets/simple_target.txt:20` |
| `collect_replacement_interval` | 2 | platform_type, processor | `sensor_demos/passive_detector_df_demo.txt:112` |
| `color_range` | 16 | analysis_map, horizontal_map | `sensor_plot/radar/analysis_map-ucav-dry.txt:37` |
| `combine_multi_beam_counts` | 5 | effect, electronic_attack, technique… | `electronic_warfare/simple_ft_jamming.txt:56` |
| `comm` | 3802 | comm, model, multiresolution_comm… | `aea_iads/platforms/iads_cmdr.txt:136` |
| `comm_link_list` | 4 | comm_link_list, network | `multiresolution_demos/comm_with_command_chain_demo.txt:40` |
| `comm_list` | 2 | comm_list, network | `multiresolution_demos/comm_with_command_chain_demo.txt:35` |
| `comm_modifier` | 1 | noise_cloud | `space_operations/scenarios/noise_cloud.txt:15` |
| `comm_network` | 1 | comm_network | `satellite_demos/iridium.txt:30` |
| `command_chain` | 115 | comm, message_processor, platform… | `air_to_air/scenarios/1v1.txt:25` |
| `commanded_altitude` | 42 | phase, platform_type, processor | `base_types/weapons/agm/mach_4_missile.txt:93` |
| `commanded_flight_path_angle` | 58 | phase, platform_type, processor | `ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:144` |
| `commanded_loft_angle` | 14 | launch_computer, platform | `signature_demos/scenarios/rocket_launch.txt:28` |
| `commanded_speed` | 66 | phase, platform_type, processor | `base_types/weapons/agm/mach_4_missile.txt:103` |
| `commander` | 1326 | platform, platform_type, weapon | `aea_iads/scenarios/strike.txt:18` |
| `comment` | 11 | next_state, on_update, processor… | `base_types/processors/ripr_agents/aijam/aijam_processor.txt:759` |
| `comments` | 4 | weapon | `hel/hel_test.txt:162` |
| `commit_authority` | 1 | processor | `iads_c2_demos/processors/battle_manager.txt:17` |
| `commodity` | 24 | commodity, container, platform… | `exchange_proc/receiver_definition.txt:24` |
| `commodity_and_capability_pairing` | 5 | platform_type, processor | `exchange_proc/receiver_definition.txt:21` |
| `common` | 15 | common, multiresolution_mover, multiresolution_sensor… | `multiresolution_demos/air_mover_demo.txt:44` |
| `common_autopilot_support_file` | 44 | pilot_manager | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/control_inputs_pm6.txt:77` |
| `completed` | 10 | on_update, platform_type, script | `p6dof/aam_launch_test.txt:162` |
| `compute_measurement_errors` | 10 | mode_template, sensor | `aea_iads/sensors/radar/acq_radar.txt:75` |
| `concealment_factor` | 1 | platform_type | `space_operations/platforms/launch_facility.txt:14` |
| `condition` | 45 | advanced_behavior_tree, condition, parallel… | `behavior_tree/run_tree.txt:52` |
| `conditional_section` | 5 | conditional_section | `air_to_air/escort.txt:24` |
| `conditionals` | 10 | conditional_section, conditionals | `air_to_air/escort.txt:26` |
| `conjunction_setup` | 6 | conjunction_setup, mover, platform | `space_operations/conjunction_ssn.txt:38` |
| `connect_to_simulations` | 3 | xio_interface | `aea_iads/xio_interface.txt:14` |
| `connection1` | 8 | platform_type, script | `satellite_demos/platforms/iridium.txt:182` |
| `connection2` | 8 | platform_type, script | `satellite_demos/platforms/iridium.txt:190` |
| `connections` | 6 | connections, dis_interface | `p6dof/config/dis_config.txt:30` |
| `consciousness_event_update_time` | 2 | platform_type, processor | `air_to_air/platforms/brawler_test.txt:77` |
| `constant` | 2838 | antenna_pattern, bistatic_signature, fuel… | `aea_iads/sensors/esm_rwr/ucav_esm.txt:15` |
| `constant_height` | 2 | noise_cloud | `noise_cloud/noise_cloud.txt:40` |
| `constant_pattern` | 27 | antenna_pattern, constant_pattern | `alv_routing/sensors/ew_radar.txt:13` |
| `consumption_rate` | 39 | fuel, platform_type | `base_types/platforms/red_multirole_fighter_2_base.txt:73` |
| `cont2` | 3 | message_processor, processor, script | `l16_j11/jtids.txt:66` |
| `cont3` | 3 | message_processor, processor, script | `l16_j11/jtids.txt:76` |
| `cont5` | 3 | message_processor, processor, script | `l16_j11/jtids.txt:86` |
| `container` | 10 | container, platform_type, processor | `exchange_proc/receiver_definition.txt:23` |
| `container_name` | 15 | platform_type, processor, transactor | `exchange_proc/receiver_definition.txt:34` |
| `continue` | 6 | script | `base_types/platforms/brawler/alternatives/behavior_weapon_decision_missile.txt:205` |
| `continue_to_offer` | 4 | processor, transactor | `logistics/platforms/logistics_platform.txt:359` |
| `continuous_g_bias` | 2 | platform_type, processor | `behavior_tree/weapons/aam/blue_sr_a2a_ir_missile.txt:72` |
| `continuous_jamming_perception_threshold` | 3 | beam, sensor | `aea_iads/sensors/radar/ew_radar.txt:133` |
| `contour_level` | 6 | contour_level, horizontal_map | `sensor_plot/radar/analysis_map-ucav-dry.txt:45` |
| `control_boolean` | 90 | control_boolean | `p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:547` |
| `control_input` | 2082 | control_boolean, control_input, control_surface… | `p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:175` |
| `control_inputs` | 56 | control_inputs, pilot_manager | `p6dof/p6dof_types/aircraft/a-lgt/controls/control_inputs.txt:20` |
| `control_method` | 58 | autopilot_config | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:19` |
| `control_name` | 1344 | control_inputs, pilot_manager | `p6dof/p6dof_types/aircraft/a-lgt/controls/control_inputs.txt:22` |
| `control_surface` | 180 | control_surface | `p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:170` |
| `control_surface_name` | 24 | ground_reaction_point, landing_gear, p6dof_object_type… | `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:82` |
| `control_value` | 572 | autopilot_config, control_value, gain_table… | `p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:27` |
| `controls_config_file` | 2 | pilot_manager, synthetic_pilot | `p6dof/p6dof_types/weapons/simple-icbm/control_inputs.txt:60` |
| `convoy` | 3 | convoy, network, road_traffic | `traffic_demos/scenarios/korea_traffic.txt:97` |
| `coordinate_frame` | 15 | mover, platform_type | `space_operations/launch_vehicles/atlas_v_401/atlas_v_401_base.txt:43` |
| `correlation_method` | 10 | correlation_method, platform, platform_type… | `aea_iads/processors/commander_track_manager.txt:10` |
| `cosecant_squared_pattern` | 4 | antenna_pattern | `aea_iads/sensors/radar/ew_radar.txt:15` |
| `cosine` | 4 | script | `air_to_air/rules/brawler_script_util.txt:354` |
| `count` | 7 | execute, on_update, platform_type… | `base_types/processors/quantum_agents/aiai/behavior_pincer.txt:235` |
| `counter` | 1 | script | `ciws/observer_bullseye.txt:109` |
| `coverage` | 6 | coverage | `coverage_demos/coverage_grids/conus_zone_coverage.txt:20` |
| `create_integrator` | 7 | integrators, p6dof_integrators | `air_to_air/six_dof_types/environment/integrators_config.txt:12` |
| `created` | 1 | script | `air_to_air/prdata/rules_utils.txt:1121` |
| `creation_time` | 14 | platform | `aea_iads/scenarios/strike.txt:19` |
| `cross_range` | 10 | run, target_grid | `engage/grid.txt:148` |
| `cross_range_limits` | 58 | horizontal_map, target_region | `sensor_plot/comm/comm.txt:93` |
| `cross_range_step` | 57 | horizontal_map, target_region | `sensor_plot/comm/comm.txt:94` |
| `cross_sectional_area` | 8 | dynamics, model, mover… | `multiresolution_demos/movers/space_mover.txt:28` |
| `csenow` | 6 | script | `air_to_air/rules/brawler_script_util.txt:271` |
| `csv_event_output` | 2 | csv_event_output | `aea_iads/csv_event_output.txt:10` |
| `cue_mode` | 17 | mode, platform_type, sensor | `aea_iads/sensors/radar/ttr_radar.txt:81` |
| `cue_to_predicted_intercept` | 21 | weapon | `ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:210` |
| `current_angle` | 540 | actuator, control_surface | `p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:189` |
| `current_bid` | 36 | behavior, query_bid, query_bid_type | `base_types/processors/quantum_agents/aiai/behavior_radar-control_new.txt:69` |
| `current_fuel_quantity` | 229 | fuel_tank, p6dof_object_type, p6dof_object_types… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/LTE_FIGHTER.txt:32` |
| `current_value` | 360 | control_boolean, control_value | `p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:548` |
| `currentpriority` | 4 | script | `orwaca_iads/platforms/iads_cmdr.txt:166` |
| `curve` | 30 | curve, mover, platform_type… | `space_operations/launch_vehicles/atlas_v_401/atlas_v_401_base.txt:86` |
| `cy_alpha_beta_mach_table` | 79 | aero_data, cy_alpha_beta_mach_table | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/aero/aero_pm6.txt:22` |
| `cy_angle_beta_mach_table` | 276 | aero_component, cy_angle_beta_mach_table | `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:309` |
| `cy_beta_mach_table` | 2 | aero_data, cy_beta_mach_table | `p6dof/p6dof_types/weapons/simple-icbm/refAero.txt:80` |
| `cy_betadot_beta_mach_table` | 39 | aero_data, cy_betadot_beta_mach_table | `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:76` |
| `cyber_attack` | 7 | cyber_attack | `cyber/avengers_detonate_effect.txt:47` |
| `cyber_constraint` | 2 | cyber_constraint, platform_type | `cyber/GoneFishing_ConstraintDemo.txt:163` |
| `cyber_effect` | 5 | cyber_effect | `cyber/avengers_detonate_effect.txt:43` |
| `cyber_protect` | 7 | cyber_protect, platform_type | `cyber/cyber/cyber_protections/altitude_protect.txt:13` |
| `cyr_beta_mach_table` | 39 | aero_data, cyr_beta_mach_table | `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:70` |
| `d3` | 24 | advanced_behavior, behavior, execute… | `base_types/processors/quantum_agents/aiai/behavior_planned_route.txt:85` |
| `damage_radius` | 14 | category, region, target_type… | `hel/ground_hel_vs_hypersonic.txt:28` |
| `damper_constant_lbs_per_fps` | 24 | ground_reaction_point, landing_gear, p6dof_object_type… | `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:96` |
| `dark_count_rate` | 2 | comm, receiver | `space_operations/comms/lasercomm_link.txt:65` |
| `dark_current` | 2 | comm, receiver | `space_operations/comms/lasercomm_link.txt:64` |
| `data_reference_range` | 7 | acoustic_signature | `acoustic/acoustic_demo.txt:11` |
| `data_title` | 4 | analysis_map, horizontal_map | `sensor_plot/radar/analysis_map-ucav-dry.txt:41` |
| `day_of_year` | 2 | sensor, solar_characteristics | `oth_radar/sensors/radar/oth_radar.txt:29` |
| `deactivation_time` | 1 | airbase | `traffic_demos/scenarios/nevada_air_traffic.txt:89` |
| `deassign` | 6 | next_state, processor, state | `outer_air_battle/processors/cvn_task_processor.txt:279` |
| `debug` | 126 | alternate_locations, beam, dis_exchange… | `alternate_locations/scenarios/red_air_strike.txt:43` |
| `debug_emission_pdu` | 2 | dis_interface | `electronic_warfare/air-to-air-rt1.txt:391` |
| `debug_laser_designations` | 1 | laser_designations | `hellfire/laser_designation_via_dis/ldt_target_only.txt:28` |
| `debug_level` | 8 | platform_type, processor, sosm_interface… | `electronic_warfare/agile_repeater_jamming-rt1.txt:70` |
| `debug_print_modulus` | 1 | laser_designations | `hellfire/laser_designation_via_dis/ldt_target_only.txt:31` |
| `debug_scheduler` | 1 | sensor | `electronic_warfare/closely_space_targets_ttr.txt:44` |
| `debug_tracker` | 2 | sensor | `electronic_warfare/closely_space_targets_ttr.txt:43` |
| `decay_interval` | 6 | heat_map, platform_type, processor | `heatmap/platforms/flight_lead.txt:64` |
| `deceleration_rate` | 2 | chaff_parcel | `chaff/chaff_example.txt:29` |
| `decimal_track_number` | 2 | platform, processor | `l16_j11/j11_out.txt:80` |
| `decorator` | 31 | advanced_behavior_tree, decorator, platform_type… | `behavior_tree/platforms/decorator_striker.txt:49` |
| `default` | 37 | cyber_effect, default, message_table… | `cyber/cyber/cyber_effects/crash.txt:13` |
| `default_climb_rate` | 70 | mover, platform_type | `base_types/platforms/blue_adv_fighter_1_base.txt:23` |
| `default_comm_type` | 1 | message_table | `suppressor/bomb_demo.txt:38` |
| `default_dive_rate` | 4 | mover, platform_type | `ship_ad/weapons/agm/red_asm_msl.txt:33` |
| `default_gateway` | 4 | platform | `space_operations/scenarios/iridium_handheld.txt:23` |
| `default_linear_acceleration` | 88 | mover, platform_type | `base_types/platforms/awacs.txt:28` |
| `default_object_size` | 3 | platform, platform_type, processor | `space_operations/conjunction_avoidance.txt:151` |
| `default_on` | 142 | beam, electronic_attack, electronic_protect… | `electronic_warfare/agile_auto-repeater_jamming.txt:96` |
| `default_radial_acceleration` | 108 | mover, platform_type | `aea_iads/platforms/soj.txt:411` |
| `default_type` | 8 | reported_emitter_type, reported_target_type, sensor | `electronic_warfare/esm_detect_multi_beam_radar.txt:60` |
| `default_variance` | 3 | platform, platform_type, processor | `space_operations/conjunction_avoidance.txt:150` |
| `defended_area_report_file` | 12 | horizontal_map | `sensor_plot/esm/hm-tdoa.txt:154` |
| `deferred_connection_time` | 1 | dis_interface | `script_demos/observer.txt:69` |
| `define_offset` | 6 | platform_type, processor | `hel/intersect_mesh_test.txt:303` |
| `define_path_variable` | 2 | conditional_section | `six_dof_with_brawler/pm6_brawler_maneuver_comparison.txt:23` |
| `delay` | 4 | behavior, precondition | `base_types/processors/quantum_agents/aigci/behavior_launch_alert-5_aircraft.txt:266` |
| `delays` | 2 | delays, processor | `iads_c2_demos/processors/weapons_manager_sam.txt:26` |
| `delete` | 16 | platform, platform_type | `air_to_air/scenarios/1v1_initial_prediction.txt:270` |
| `delivery_delay_time` | 3 | cyber_attack | `cyber/cyber/cyber_attacks/crash.txt:32` |
| `delta` | 9 | script | `base_types/processors/quantum_agents/aiai/behavior_evade.txt:107` |
| `delta_altitude` | 9 | launch_acceptable_region, launch_computer, weapon | `hellfire/active_radar_hellfire/hellfire_type.txt:330` |
| `delta_time` | 42 | maneuver, mission_sequence, platform | `space_operations/proximity_operations.txt:50` |
| `delta_v` | 14 | maneuver, maneuvering, mission_sequence… | `space_operations/conjunction_avoidance.txt:80` |
| `density_altitude_table` | 1 | density_altitude_table | `p6dof/p6dof_types/environment/atm_config.txt:19` |
| `departure_interval` | 51 | air_traffic, airbase, port… | `traffic_demos/scenarios/china_air_traffic.txt:62` |
| `departure_traffic` | 2 | departure_traffic, sea_traffic | `traffic_demos/scenarios/west_coast_sea_traffic.txt:126` |
| `dependent_variable` | 4658 | aero_data, aero_mode, alpha_versus_mach_cl_table… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/aero/data/cd_alpha_beta_mach_table.txt:24` |
| `derivative_gain` | 24 | lateral_acceleration_rate_pid, lateral_acceleration_value_pid, mover… | `hellfire/active_radar_hellfire/helo_mover.txt:98` |
| `desc` | 16 | advanced_behavior_tree, platform_type, processor | `behavior_tree/platforms/subtrees_striker.txt:60` |
| `desdir` | 8 | advanced_behavior, execute, script | `air_to_air/prdata/rules_utils.txt:2376` |
| `designator` | 3045 | platform | `satellite_demos/satellites/orbit_nominal/beidou.txt:25` |
| `desired_false_target_rcs` | 12 | effect, electronic_attack, system_type_data… | `electronic_warfare/repeater_jamming.txt:104` |
| `desired_jammer_to_signal` | 5 | effect, electronic_attack, technique… | `sensor_plot/radar/hm-repeater-effect.txt:74` |
| `destination` | 112 | air_traffic, airbase | `traffic_demos/scenarios/china_air_traffic.txt:63` |
| `detection` | 1 | script | `engage/scripts/utility_scripts.txt:620` |
| `detection_probability` | 6 | detection_probability, mode_template, sensor | `air_to_air/sensors/radar/aesa.txt:65` |
| `detection_sensitivities` | 5 | detection_sensitivities, mode_template, sensor | `air_to_air/sensors/esm_rwr/esm.txt:53` |
| `detection_sensitivity` | 3 | receiver, sensor | `electronic_warfare/test_multi_beam/sensors/esm/ucav_esm.txt:28` |
| `detection_threshold` | 203 | comm, mode, mode_template… | `acoustic/acoustic_demo.txt:57` |
| `detector_gain` | 2 | comm, receiver | `space_operations/comms/lasercomm_link.txt:53` |
| `detector_law` | 17 | beam, mode_template, sensor | `aea_iads/sensors/radar/ttr_radar.txt:66` |
| `detector_size` | 2 | comm, receiver | `space_operations/comms/lasercomm_link.txt:57` |
| `detonate_above_height_msl` | 2 | platform_type, processor | `base_types/weapons/sam/blue_sr_sam_common.txt:192` |
| `detonate_below_height_agl` | 46 | platform_type, processor | `cyber/avengers_detonate_effect.txt:22` |
| `detonate_below_height_msl` | 42 | platform_type, processor | `p6dof/platforms/aam-mr.txt:124` |
| `detonate_below_mach` | 4 | platform_type, processor | `base_types/weapons/sam/blue_lr_sam_common.txt:318` |
| `detonate_on_mach_decreasing_to` | 10 | platform_type, processor | `base_types/weapons/aam/blue_lr_a2a_rf_missile.txt:105` |
| `dhead` | 1 | script | `air_to_air/rules/brawler_script_util.txt:383` |
| `didlaunch` | 6 | next_state, processor, state | `cyber/processors/telar_task_mgr.txt:276` |
| `diff` | 6 | execute, script | `base_types/processors/quantum_agents/aiai/behavior_pincer.txt:247` |
| `dir` | 8 | script | `six_dof/scripts/brawler_behaviors.txt:70` |
| `dir0` | 85 | advanced_behavior, behavior, execute… | `air_to_air/prdata/rules_utils.txt:1366` |
| `dis_exchange` | 2 | dis_exchange, dis_interface | `exchange_proc/dis_interface.txt:41` |
| `dis_interface` | 44 | dis_interface | `aea_iads/dis_data.txt:9` |
| `disable` | 48 | event_output, event_pipe | `acoustic/acoustic_demo.txt:191` |
| `disk_tilt_filter_time_constant` | 3 | mover | `hellfire/active_radar_hellfire/helo_mover.txt:123` |
| `dist` | 9 | execute | `base_types/processors/quantum_agents/aiai/behavior_evade.txt:299` |
| `distribution` | 6 | distribution, false_target | `aea_iads/weapons/jammer/false_target.txt:29` |
| `distribution_centroid` | 2 | distribution_centroid, false_target | `electronic_warfare/test_false_targets/weapons/jammer/false_target.txt:21` |
| `distribution_type` | 5 | antenna_pattern | `aea_iads/weapons/jammer/soj_xband_jammer.txt:26` |
| `divert_altitude_limits` | 4 | mover | `ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:91` |
| `divert_fuel_flow_rate` | 4 | mover | `ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:90` |
| `divert_fuel_mass` | 5 | mover | `ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:89` |
| `divert_thrust` | 4 | mover | `ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:88` |
| `diving` | 16 | platform_type, script | `p6dof/tactical_maneuvers.txt:282` |
| `dlag` | 4 | script | `base_types/platforms/brawler/alternatives/behavior_alt3441_tail_attack.txt:120` |
| `do` | 4 | script | `base_types/platforms/brawler/alternatives/behavior_weapon_decision_missile.txt:308` |
| `done` | 4 | next_state, platform_type, processor… | `laser_designator/platforms/uav.txt:194` |
| `doppler_filter_broadening_factor` | 8 | mode_template, sensor | `base_types/sensors/radar/generic_sar.txt:58` |
| `doppler_foldover_margin_factor` | 8 | mode_template, sensor | `base_types/sensors/radar/generic_sar.txt:59` |
| `doppler_resolution` | 4 | mode_template, sensor | `air_to_air/sensors/radar/aesa.txt:79` |
| `double` | 7941 | advanced_behavior, aux_data, behavior… | `aea_iads/detection_writes.txt:49` |
| `down_position_error_sigma` | 4 | error_model, sensor | `sensor_demos/esm_tdoa_demo.txt:120` |
| `down_range` | 10 | run, target_grid | `engage/grid.txt:147` |
| `down_range_limits` | 57 | horizontal_map, target_region | `sensor_plot/comm/comm.txt:91` |
| `down_range_step` | 57 | horizontal_map, target_region | `sensor_plot/comm/comm.txt:92` |
| `dp` | 4 | script | `p6dof/p6dof_types/scripts/support_scripts.txt:35` |
| `drag_coefficient` | 8 | dynamics, model, mover… | `multiresolution_demos/movers/space_mover.txt:29` |
| `dragging` | 3 | precondition | `base_types/processors/quantum_agents/aifl/behavior_manage-pincer.txt:228` |
| `draw_cloud_approximations` | 2 | weapon | `chaff/chaff_example.txt:47` |
| `draw_grid` | 6 | heat_map, platform_type, processor | `heatmap/platforms/flight_lead.txt:68` |
| `draw_heat` | 6 | heat_map, platform_type, processor | `heatmap/platforms/flight_lead.txt:69` |
| `draw_sensor_outline` | 6 | heat_map, platform_type, processor | `heatmap/platforms/flight_lead.txt:70` |
| `drop_after_inactive` | 4 | platform_type, processor | `air_to_air/platforms/brawler_test.txt:102` |
| `drop_track_technique` | 6 | electronic_warfare, mitigated_technique_classes, mitigated_techniques… | `electronic_warfare/track_drop_maintain_effect.txt:97` |
| `dsemax` | 3 | script | `air_to_air/rules/brawler_script_util.txt:275` |
| `dspd` | 1 | script | `air_to_air/rules/brawler_script_util.txt:392` |
| `dted` | 83 | terrain | `laser_designator/terrain.txt:10` |
| `duration` | 14 | maneuver, mission_sequence, on_update… | `base_types/processors/ripr_agents/aiai/aiai_processor.old.txt:1856` |
| `duty_cycle` | 9 | mode_template, sensor, transmitter | `aea_iads/sensors/radar/ttr_radar.txt:54` |
| `duty_cycle_limit` | 115 | beam, effect, electronic_protect… | `aea_iads/sensors/radar/ew_radar.txt:65` |
| `duty_cycle_limit_effect` | 115 | beam, effect, electronic_protect… | `aea_iads/sensors/radar/ew_radar.txt:64` |
| `duty_cycle_probability_effect` | 10 | effect, electronic_protect, electronic_warfare… | `aea_iads/sensors/radar/ew_radar.txt:68` |
| `dwell_time` | 15 | mode, mode_template, platform_type… | `air_to_air/sensors/radar/long_range.txt:110` |
| `dynamics` | 8 | dynamics, model, mover… | `cislunar/scenarios/orbiter.txt:39` |
| `dzr_change` | 4 | advanced_behavior, execute | `air_to_air/rules/ftr_rules.txt:256` |
| `dzr_phase` | 4 | advanced_behavior, execute | `air_to_air/rules/ftr_rules.txt:248` |
| `earth_radius_multiplier` | 5 | comm, platform_type, transmitter | `satellite_demos/platforms/comsat_satellite.txt:33` |
| `east_position_error_sigma` | 4 | error_model, sensor | `sensor_demos/esm_tdoa_demo.txt:119` |
| `eccentricity` | 2946 | common, mover, multiresolution_mover… | `multiresolution_demos/space_mover_demo.txt:59` |
| `edge_angle_x` | 3 | antenna_pattern | `sensor_plot/antenna/esa_circular_pattern.txt:20` |
| `edge_angle_y` | 3 | antenna_pattern | `sensor_plot/antenna/esa_circular_pattern.txt:23` |
| `edit` | 1564 | platform, platform_type, processor… | `aea_iads/scenarios/strike.txt:21` |
| `effect` | 469 | beam, cyber_attack, effect… | `aea_iads/sensors/radar/acq_radar.txt:29` |
| `egm96` | 10 | dynamics, model, mover… | `multiresolution_demos/movers/space_mover.txt:33` |
| `ejectable` | 52 | ejectable, mover, platform_type | `space_operations/launch_vehicles/atlas_v_401/atlas_v_401_base.txt:46` |
| `ejection_azimuth` | 12 | ejector, weapon | `chaff/chaff_example.txt:55` |
| `ejection_elevation` | 12 | ejector, weapon | `chaff/chaff_example.txt:56` |
| `ejection_velocity` | 12 | ejector, weapon | `chaff/chaff_example.txt:54` |
| `ejector` | 12 | ejector, weapon | `chaff/chaff_example.txt:49` |
| `el` | 8 | launch_computer, script | `base_types/weapons/other/gun.txt:84` |
| `electron_density_at_max` | 2 | ionospheric_characteristics, sensor | `oth_radar/sensors/radar/oth_radar.txt:35` |
| `electron_height_at_max` | 2 | ionospheric_characteristics, sensor | `oth_radar/sensors/radar/oth_radar.txt:36` |
| `electron_temperature` | 2 | ionospheric_characteristics, sensor | `oth_radar/sensors/radar/oth_radar.txt:34` |
| `electronic_attack` | 117 | electronic_attack, transmitter, weapon | `aea_iads/weapons/jammer/soj_base_jammer.txt:96` |
| `electronic_beam_steering` | 36 | antenna_plot, mode_template, receiver… | `aea_iads/weapons/jammer/soj_xband_jammer.txt:49` |
| `electronic_beam_steering_limit` | 20 | mode_template, receiver, sensor… | `air_to_air/sensors/radar/aesa.txt:37` |
| `electronic_beam_steering_loss_exponent` | 26 | antenna_plot, mode_template, sensor… | `aea_iads/weapons/jammer/soj_xband_jammer.txt:50` |
| `electronic_beam_steering_loss_exponent_azimuth` | 4 | sensor | `engage/radars/mar_esams.txt:30` |
| `electronic_beam_steering_loss_exponent_elevation` | 4 | sensor | `engage/radars/mar_esams.txt:31` |
| `electronic_protect` | 112 | beam, comm, electronic_protect… | `aea_iads/sensors/radar/acq_radar.txt:64` |
| `electronic_warfare` | 34 | electronic_warfare | `aea_iads/sensors/radar/acq_radar.txt:24` |
| `element` | 8 | advanced_behavior, execute | `air_to_air/rules/crank.txt:101` |
| `element_pattern` | 1 | antenna_pattern | `sensor_plot/antenna/esa_pattern.txt:17` |
| `element_spacing_x` | 8 | antenna_pattern | `aea_iads/weapons/jammer/soj_xband_jammer.txt:21` |
| `element_spacing_y` | 7 | antenna_pattern | `aea_iads/weapons/jammer/soj_xband_jammer.txt:23` |
| `elevation` | 26 | bistatic_signature, radar_signature | `base_types/signatures/small_bistatic_radar_signature.txt:13` |
| `elevation_angle_values` | 10 | fires_table, launch_computer | `fires/types/fires_120mm_mortar_m934_he.txt:17` |
| `elevation_beamwidth` | 227 | antenna_pattern, constant_pattern, error_model_parameters… | `aea_iads/sensors/radar/acq_radar.txt:19` |
| `elevation_bin_count_min_and_max_limits` | 6 | intercept_results, launch_computer | `base_types/weapons/aam/blue_sr_a2a_ir_missile_ata_launch_computer_alt10kft_0.6mach.txt:35` |
| `elevation_cue_limits` | 10 | mode, sensor | `air_to_air/sensors/esm_rwr/esm.txt:81` |
| `elevation_cue_rate` | 6 | mode_template, sensor | `hellfire/active_radar_hellfire/hellfire_type.txt:40` |
| `elevation_delta` | 30 | acquire_deltas, close_target_detection, mode… | `chaff/chaff_example_ttr.txt:212` |
| `elevation_distribution` | 13 | antenna_pattern | `air_to_air/sensors/esm_rwr/esm.txt:21` |
| `elevation_error` | 13 | effect, electronic_attack, electronic_protect… | `electronic_warfare/track_effect_1.txt:50` |
| `elevation_error_sigma` | 71 | mode_template, platform, platform_type… | `air_to_air/platforms/dca.txt:84` |
| `elevation_exponent` | 11 | antenna_pattern | `air_to_air/sensors/esm_rwr/esm.txt:23` |
| `elevation_field_of_view` | 327 | beam, comm, common… | `aea_iads/weapons/jammer/soj_sband_jammer.txt:35` |
| `elevation_limits` | 4 | spherical_map, vertical_coverage | `sensor_plot/radar/sm-nostab.txt:52` |
| `elevation_measurement_sigma` | 30 | filter, platform_type, sensor | `alternate_locations/platforms/common.txt:41` |
| `elevation_range` | 14 | antenna_plot | `sensor_plot/antenna/circular_2d.txt:28` |
| `elevation_scan_limits` | 167 | beam, mode, mode_template… | `acoustic/acoustic_demo.txt:55` |
| `elevation_side_lobe_level` | 2 | antenna_pattern | `sensor_plot/antenna/genap_circular_pattern.txt:23` |
| `elevation_slew_limits` | 111 | comm, common, multiresolution_sensor… | `aea_iads/sensors/radar/ttr_radar.txt:39` |
| `elevation_slew_rate` | 16 | comm, common, multiresolution_sensor… | `ciws/sensors/radar/red_ciws_radar_1.txt:81` |
| `elevation_steering_angle` | 8 | antenna_plot | `sensor_plot/antenna/esa_2d.txt:21` |
| `elevation_step` | 16 | antenna_plot, spherical_map, vertical_coverage | `sensor_plot/antenna/circular_2d.txt:29` |
| `elevnow` | 2 | script | `base_types/platforms/brawler/alternatives/behavior_weapon_decision_gun.txt:135` |
| `elevprj` | 2 | script | `base_types/platforms/brawler/alternatives/behavior_weapon_decision_gun.txt:145` |
| `else` | 4072 | advanced_behavior, behavior, condition… | `aea_iads/track_writes.txt:192` |
| `elseif` | 4 | script | `base_types/platforms/brawler/alternatives/behavior_weapon_decision_missile.txt:358` |
| `emitter` | 8 | reported_target_type, sensor | `electronic_warfare/esm_detect_multi_sensor_radar.txt:65` |
| `emitter_type` | 25 | dis_interface | `aea_iads/dis_data.txt:30` |
| `empty_mass` | 151 | maneuvering, mover, platform… | `ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:97` |
| `enable` | 1146 | conditional_section, csv_event_output, event_output… | `acoustic/acoustic_demo.txt:192` |
| `enable_controls` | 4 | platform_type | `p6dof/aam_launch_test.txt:95` |
| `enabled` | 3 | advanced_behavior | `air_to_air/rules/rultype_change.txt:49` |
| `end` | 2 | on_initialize2, processor | `route_finder_demos/3d_route_finder.txt:164` |
| `endif` | 54 | script | `base_types/platforms/brawler/alternatives/behavior_weapon_decision_gun.txt:78` |
| `enemy_side` | 40 | platform, platform_type, processor | `air_to_air/platforms/brawler_test.txt:203` |
| `enemy_type` | 39 | platform, platform_type, processor | `air_to_air/platforms/brawler_test.txt:204` |
| `engage_iff_permissions` | 2 | engage_iff_permissions, processor | `iads_c2_demos/processors/battle_manager.txt:59` |
| `engage_local_ttr_targets_only` | 4 | engagement_settings, processor | `iads_c2_demos/processors/weapons_manager_ai.txt:26` |
| `engageable` | 3 | processor, script | `ballistic_missile_shootdown/processors/anti_ballistic_missile_processor.txt:70` |
| `engagement_data_update_interval` | 5 | platform_type, processor | `air_to_air/platforms/brawler_test.txt:190` |
| `engagement_range_tolerance` | 1 | tool | `base_types/weapons/aam/ata4_generator.txt:103` |
| `engagement_settings` | 4 | engagement_settings, processor | `iads_c2_demos/processors/weapons_manager_ai.txt:22` |
| `engaging` | 38 | processor, script | `aea_iads/processors/red_sam_battery_tactics.txt:186` |
| `engine` | 382 | engine, p6dof_object_type, p6dof_object_types… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/LTE_FIGHTER.txt:26` |
| `engines_on` | 8 | platform, platform_type | `p6dof/airport_operations.txt:963` |
| `entity_orientation_threshold` | 4 | dis_interface | `l16_j11/dis_network.txt:61` |
| `entity_position_threshold` | 16 | dis_interface | `aea_iads/dis_realtime.txt:28` |
| `entity_type` | 76 | dis_interface | `aea_iads/dis_data.txt:11` |
| `epoch_date_time` | 3 | platform_type | `coverage_demos/platforms/sat1.txt:19` |
| `error_criterion` | 8 | integrator, model, mover… | `cislunar/scenarios/orbiter.txt:32` |
| `error_model` | 4 | error_model, sensor | `sensor_demos/esm_tdoa_demo.txt:117` |
| `error_model_parameters` | 2 | error_model_parameters, sensor | `sensor_demos/passive_detector_df_demo.txt:68` |
| `esa_pattern` | 4 | antenna_pattern | `aea_iads/weapons/jammer/soj_xband_jammer.txt:17` |
| `establish_track_probability` | 2 | mode, sensor | `base_types/sensors/radar/generic_bomber_radar.txt:147` |
| `established` | 5 | next_state, processor, script… | `space_operations/processors/establish_link_processor.txt:230` |
| `evaluation_interval` | 287 | platform_type, processor | `aea_iads/platforms/iads_cmdr.txt:102` |
| `evaluator` | 18 | platform_type, processor | `base_types/platforms/brawler/brawler_flight_lead.txt:65` |
| `evd_msl` | 1 | on_initialize | `air_to_air/processors/assessment_scripts.txt:513` |
| `event` | 3 | event, mission_sequence, platform | `space_operations/mission_design_astrolabe.txt:100` |
| `event_autopilot_data` | 64 | mover, platform_type | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/LTE_FIGHTER.txt:58` |
| `event_autopilot_limits_data` | 58 | mover, platform_type | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/LTE_FIGHTER.txt:59` |
| `event_control_inputs_data` | 64 | mover, platform_type | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/LTE_FIGHTER.txt:60` |
| `event_control_surfaces_data` | 38 | mover, platform_type | `p6dof/platforms/aam-mr.txt:39` |
| `event_core_data` | 69 | mover, platform_type | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/LTE_FIGHTER.txt:55` |
| `event_dynamic_pressure_below` | 6 | sequencer | `p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:1069` |
| `event_engine_fuel_data` | 60 | mover, platform_type | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/LTE_FIGHTER.txt:57` |
| `event_force_moment_data` | 66 | mover, platform_type | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/LTE_FIGHTER.txt:61` |
| `event_kinematic_data` | 69 | mover, platform_type | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/LTE_FIGHTER.txt:56` |
| `event_null` | 21 | p6dof_object_type, p6dof_object_types, point_mass_vehicle_type… | `p6dof/p6dof_types/aircraft/b-fw/b-fw-bombs.txt:176` |
| `event_nx_above` | 2 | sequencer | `p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:1050` |
| `event_nx_below` | 31 | point_mass_vehicle_type, rigid_body_vehicle_type, sequencer… | `p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:1096` |
| `event_output` | 184 | conditional_section, event_output, output… | `acoustic/acoustic_demo.txt:189` |
| `event_output_file_base_name` | 1 | run | `engage/oo_grid.txt:55` |
| `event_pipe` | 192 | conditional_section, event_pipe | `acoustic/acoustic_demo.txt:185` |
| `event_released_from_parent` | 129 | p6dof_object_type, p6dof_object_types, point_mass_vehicle_type… | `p6dof/p6dof_types/misc/srb-rato/srb-rato.txt:58` |
| `event_timer` | 313 | p6dof_object_type, p6dof_object_types, point_mass_vehicle_type… | `p6dof/p6dof_types/aircraft/a-lgt/a-lgt-bombs.txt:102` |
| `events` | 6 | events, output, run | `engage/grid_w_observer.txt:186` |
| `every` | 1 | script | `air_to_air/prdata/rules_utils.txt:676` |
| `ew_targets` | 4 | engagement_settings, processor | `iads_c2_demos/processors/weapons_manager_ai.txt:23` |
| `ew_technique_type` | 30 | dis_interface | `aea_iads/dis_ew_data.txt:10` |
| `exclude` | 15 | horizontal_map | `sensor_plot/comm/comm.txt:82` |
| `exclusion_factor` | 3 | platform, platform_type, processor | `space_operations/conjunction_avoidance.txt:149` |
| `exclusive_hook_to_fuel` | 3 | platform_type, processor, transactor | `exchange_proc/receiver_definition.txt:37` |
| `exclusive_hook_to_payload` | 3 | platform_type, processor, transactor | `exchange_proc/tanker_definition.txt:39` |
| `execute` | 1898 | advanced_behavior, behavior, callback… | `aea_iads/platforms/iads_cmdr.txt:160` |
| `execute_at` | 20 | event, maneuver, mission_sequence… | `space_operations/mission_design_astrolabe.txt:85` |
| `exercise` | 16 | dis_interface | `aea_iads/dis_realtime.txt:11` |
| `exfiltrate` | 2 | cyber_effect, default | `cyber/exfiltrate_demo/MITM_exfiltrate_demo.txt:38` |
| `expansion_time_constant` | 2 | chaff_parcel | `chaff/chaff_example.txt:28` |
| `expansion_timeout` | 6 | heat_map, platform_type, processor | `heatmap/platforms/flight_lead.txt:65` |
| `expected_sensor_acquisition` | 2 | delays, processor | `iads_c2_demos/processors/weapons_manager_sam.txt:30` |
| `expiration_time` | 2 | chaff_parcel | `chaff/chaff_example.txt:30` |
| `exponent` | 23 | weapon_effects | `alternate_locations/weapons/agm/blue_glide_bomb_1.txt:56` |
| `extern` | 1444 | advanced_behavior, behavior, behavior_tree… | `aea_iads/processors/red_sam_battery_tactics.txt:61` |
| `external_link` | 7 | platform_type, processor | `comm/platforms/detector.txt:29` |
| `externally_controlled` | 12 | electronic_protect, electronic_warfare, receiver… | `aea_iads/sensors/radar/ew_radar.txt:36` |
| `extrapolate` | 12 | platform, route | `oth_radar/othTest.txt:128` |
| `fail` | 1 | script | `engage/post_process_test.txt:123` |
| `false_target` | 6 | false_target | `aea_iads/weapons/jammer/false_target.txt:9` |
| `false_target_behavior` | 4 | false_target | `aea_iads/weapons/jammer/false_target.txt:17` |
| `false_target_jamming` | 29 | electronic_protect, electronic_warfare, mitigated_technique_classes… | `aea_iads/sensors/radar/ew_radar.txt:57` |
| `false_target_movement` | 8 | false_target, false_target_movement | `aea_iads/weapons/jammer/false_target.txt:36` |
| `false_target_name` | 14 | effect, electronic_attack, electronic_warfare… | `electronic_warfare/false-target_command_center.txt:90` |
| `false_target_screener` | 54 | false_target_screener, mode_template, sensor | `aea_iads/sensors/radar/ew_radar.txt:98` |
| `false_target_technique` | 8 | effect, electronic_attack, electronic_warfare… | `aea_iads/weapons/jammer/soj_base_jammer.txt:29` |
| `false_targets` | 17 | beam, electronic_protect, electronic_warfare… | `electronic_warfare/cover_pulse_jamming.txt:92` |
| `far` | 2 | on_update | `base_types/processors/timeline_agents/timeline_proc.txt:95` |
| `fast_detection_mode` | 4 | sosm_interface | `sosm/sensor_plot/hmap/hmapf/hmapf.txt:14` |
| `faz` | 21 | advanced_behavior, execute, on_init… | `air_to_air/processors/assessment_scripts.txt:499` |
| `faz_desired` | 111 | advanced_behavior, execute, on_initialize | `air_to_air/processors/assessment_scripts.txt:503` |
| `feature_not_present` | 2 | conditional_section, conditionals | `wargame/scripts/check_for_warlock.txt:23` |
| `feature_present` | 8 | conditional_section, conditionals | `air_to_air/escort.txt:27` |
| `fidelity` | 18 | multiresolution_fuel, multiresolution_mover, multiresolution_sensor… | `multiresolution_demos/air_mover_demo.txt:43` |
| `fidelity_range` | 35 | model, multiresolution_comm, multiresolution_fuel… | `multiresolution_demos/comms/comm_include.txt:45` |
| `field_of_view` | 15 | field_of_view, platform_type, sensor | `ciws/sensors/radar/red_ciws_radar_1.txt:72` |
| `file` | 3965 | aero_component, aero_data, alpha_stabilizing_frequency_mach_table… | `acoustic/acoustic_demo.txt:186` |
| `fill_color` | 4 | zone | `wargame/zones/blue_zone.txt:19` |
| `filter` | 127 | filter, platform_type, sensor… | `aea_iads/processors/commander_track_manager.txt:16` |
| `filter_bypass` | 2 | platform_type, processor | `sensor_demos/passive_detector_df_demo.txt:115` |
| `filter_cut_distance` | 3 | platform, platform_type, processor | `space_operations/conjunction_avoidance.txt:147` |
| `filter_dead_tracks` | 1 | processor | `iads_c2_demos/processors/asset_manager.txt:24` |
| `filter_requires_air_domain` | 6 | platform, platform_type, processor | `air_to_air/platforms/brawler_test.txt:214` |
| `filter_requires_not_air_domain` | 1 | platform | `air_to_air/scenarios/escort.txt:124` |
| `filter_requires_not_same_side` | 1 | platform | `air_to_air/scenarios/escort.txt:123` |
| `filter_requires_not_space_domain` | 1 | platform | `air_to_air/scenarios/escort.txt:126` |
| `filter_requires_not_subsurface_domain` | 1 | platform | `air_to_air/scenarios/escort.txt:125` |
| `filter_requires_sa_processor` | 7 | platform, platform_type, processor | `air_to_air/platforms/brawler_test.txt:219` |
| `fine_update_interval` | 56 | platform_type, processor | `ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:176` |
| `finite` | 9 | maneuver, mission_sequence, platform | `space_operations/mission_design_astrolabe.txt:86` |
| `fire_complete_time` | 10 | on_update, processor | `hel/hel_test.txt:105` |
| `fired` | 3 | next_state, processor, state | `outer_air_battle/processors/blue_multirole_fighter_2_task_processor.txt:148` |
| `fires_elevation_angle_table` | 18 | fires_elevation_angle_table, launch_computer | `fires/types/fires_107mm_rocket.txt:14` |
| `fires_table` | 18 | fires_table, launch_computer | `fires/types/fires_120mm_artillery.txt:16` |
| `firing_delay` | 69 | platform, platform_type, weapon | `air_to_air/weapons/aam/medium_range_radar_missile.txt:254` |
| `firing_interval` | 24 | platform, platform_type, weapon | `air_to_air/weapons/aam/medium_range_radar_missile.txt:255` |
| `firing_range_bin_count_and_values` | 6 | intercept_results, launch_computer | `base_types/weapons/aam/blue_sr_a2a_ir_missile_ata_launch_computer_alt10kft_0.6mach.txt:37` |
| `firing_time` | 5 | weapon | `hel/ground_hel_vs_hypersonic.txt:38` |
| `firing_update_interval` | 1 | weapon | `hel/ground_hel_vs_hypersonic.txt:39` |
| `first` | 1 | script | `space_operations/scripts/tapsolver.txt:237` |
| `first_pass` | 5 | advanced_behavior, execute, on_initialize | `air_to_air/processors/assessment_scripts.txt:497` |
| `fixed_azimuth_error_sigma` | 2 | sensor | `iads/sensors/radar/ucav_sar.txt:86` |
| `fixed_elevation_error_sigma` | 2 | sensor | `iads/sensors/radar/ucav_sar.txt:87` |
| `fixed_object` | 8 | p6dof_object_type, p6dof_object_types, point_mass_vehicle_type… | `p6dof/p6dof_types/misc/zell-launch-system/zell-launch-system.txt:17` |
| `fixed_range_error_sigma` | 2 | sensor | `iads/sensors/radar/ucav_sar.txt:88` |
| `flaps` | 2 | flaps, flight_controls | `six_dof/six_dof_types/aircraft/fa-lgt/controls/flight_controls_pm6.txt:42` |
| `flight_controls` | 17 | flight_controls | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/flight_controls_pm6.txt:10` |
| `flight_controls_data_update_interval` | 5 | platform_type, processor | `air_to_air/platforms/brawler_test.txt:194` |
| `flight_data_update_interval` | 7 | platform, platform_type, processor | `air_to_air/platforms/brawler_test.txt:191` |
| `flight_id` | 49 | platform, platform_type, processor | `air_to_air/platforms/brawler_test.txt:178` |
| `flight_path` | 2 | flight_path, run | `engage/flight_path.txt:152` |
| `flight_path_analysis` | 4 | flight_path_analysis | `sensor_plot/radar/fpa-path.txt:28` |
| `flight_path_angle` | 7 | phase, platform_type, processor… | `space_operations/launch_vehicles/saturn_v/saturn_v_complex.txt:293` |
| `flight_route` | 2 | flight_route, run | `engage/flight_route.txt:151` |
| `flt_guiding` | 5 | script | `air_to_air/processors/assessment_scripts.txt:237` |
| `flt_lead` | 1 | on_initialize | `air_to_air/processors/assessment_scripts.txt:528` |
| `fluence_model` | 10 | fluence_model, weapon | `hel/ground_hel_vs_hypersonic.txt:55` |
| `flush_output` | 3 | event_output | `hel/ground_hel_vs_hypersonic.txt:163` |
| `focal_length` | 2 | comm, receiver | `space_operations/comms/lasercomm_link.txt:56` |
| `follow_vertical_track` | 54 | platform, platform_type | `p6dof/airport_operations.txt:960` |
| `for` | 700 | advanced_behavior, behavior, execute… | `aea_iads/platforms/iads_cmdr.txt:94` |
| `force` | 7 | dis_interface | `exchange_proc/dis_interface.txt:18` |
| `force_target_tracks` | 21 | false_target_screener, force_target_tracks, sensor | `aea_iads/sensors/radar/ew_radar.txt:103` |
| `foreach` | 795 | advanced_behavior, behavior, execute… | `aea_iads/detection_writes.txt:34` |
| `foreground_radiance` | 6 | atmosphere_model | `sosm/modtran/mid_lat_summer_day.txt:15` |
| `foreground_transmittance` | 6 | atmosphere_model | `sosm/modtran/mid_lat_summer_day.txt:16` |
| `form` | 2 | script | `p6dof/scripts/tanking_scripts.txt:96` |
| `formation` | 3 | formation | `p6dof/basic_formation.txt:71` |
| `forward_accel_max` | 174 | autopilot_config, limits_and_settings, pid_group | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:102` |
| `forward_accel_min` | 174 | autopilot_config, limits_and_settings, pid_group | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:101` |
| `found` | 1 | script | `space_operations/scripts/FindEquinoxOrSolstice.txt:53` |
| `fox1_left` | 2 | script | `air_to_air/prdata/rules_utils.txt:1167` |
| `fox2_left` | 2 | script | `air_to_air/prdata/rules_utils.txt:1171` |
| `fox3_left` | 2 | script | `air_to_air/prdata/rules_utils.txt:1175` |
| `fraction` | 78 | departure_traffic, local_traffic, network… | `traffic_demos/scenarios/china_traffic.txt:37` |
| `frame_step` | 5 | tool | `ballistic_missile_shootdown/weapons/sam/blue_naval_sam_lcg.txt:26` |
| `frame_time` | 535 | common, mode, mode_template… | `acoustic/acoustic_demo.txt:51` |
| `freq` | 176 | acoustic_signature, spectrum_data | `acoustic/acoustic_demo.txt:14` |
| `frequency` | 1197 | antenna_plot, beam, comm… | `aea_iads/sensors/radar/acq_radar.txt:52` |
| `frequency_band` | 106 | mode, mode_template, platform_type… | `aea_iads/sensors/esm_rwr/ucav_esm.txt:32` |
| `frequency_changing` | 12 | agility_type, beam, effect… | `aea_iads/sensors/radar/ew_radar.txt:80` |
| `frequency_channels` | 118 | beam, mode, mode_template… | `aea_iads/sensors/radar/ew_radar.txt:115` |
| `frequency_following` | 14 | repeater, weapon | `electronic_warfare/agile_auto-repeater_jamming.txt:77` |
| `frequency_id` | 30 | beam, frequency_list, mode… | `electronic_warfare/agile_jamming.txt:260` |
| `frequency_list` | 10 | beam, frequency_list, mode… | `electronic_warfare/agile_jamming.txt:259` |
| `frequency_maximum_rcs_table` | 4 | chaff_parcel, frequency_maximum_rcs_table | `chaff/chaff_example.txt:34` |
| `frequency_select_delay` | 18 | mode_template, sensor | `electronic_warfare/agile_auto-repeater_jamming.txt:140` |
| `friendlies` | 2 | engage_iff_permissions, processor | `iads_c2_demos/processors/battle_manager.txt:62` |
| `friendly_type` | 40 | platform, platform_type, processor | `air_to_air/platforms/brawler_test.txt:205` |
| `from` | 12 | altitudes, clutter_table | `sensor_plot/clutter/clutter_table_generation.txt:111` |
| `from_initial` | 6 | conjunction_setup, mover, platform | `space_operations/conjunction_ssn.txt:39` |
| `ftr_lead` | 2 | advanced_behavior, execute | `air_to_air/rules/ftr_rules.txt:228` |
| `fuel` | 69 | fuel, model, multiresolution_fuel… | `air_to_air/platforms/dca.txt:43` |
| `fuel_data_update_interval` | 6 | platform, platform_type, processor | `air_to_air/platforms/brawler_test.txt:192` |
| `fuel_feed` | 339 | engine, p6dof_object_type, p6dof_object_types… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/LTE_FIGHTER.txt:27` |
| `fuel_mass` | 272 | maneuvering, mover, platform… | `air_to_air/weapons/aam/medium_range_radar_missile.txt:151` |
| `fuel_mass_fraction` | 2 | mover, platform_type | `tbm_demos/weapons/ssm/tbm1.txt:25` |
| `fuel_table` | 11 | fuel, fuel_table, platform_type | `example_scripts/fuel_table_demo.txt:27` |
| `fuel_tank` | 223 | fuel_tank, p6dof_object_type, p6dof_object_types… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/LTE_FIGHTER.txt:30` |
| `fuel_transfer` | 62 | fuel_transfer, p6dof_object_type, p6dof_object_types… | `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt.txt:137` |
| `fused_track_reporting` | 67 | platform_type, processor | `aea_iads/platforms/red_radar_company.txt:42` |
| `fusion_method` | 31 | fusion_method, platform, platform_type… | `aea_iads/processors/commander_track_manager.txt:13` |
| `future_immunity_draw_frequency` | 3 | cyber_attack | `cyber/cyber/cyber_attacks/crash.txt:29` |
| `g_bias` | 339 | phase, platform_type, processor… | `air_to_air/weapons/aam/medium_range_radar_missile.txt:165` |
| `gain` | 508 | scalar_gain | `p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:41` |
| `gain_adjustment` | 3 | antenna_pattern | `base_types/sensors/radar/mtd_radar.txt:13` |
| `gain_control_method` | 17 | effect, electronic_attack, system_type_data… | `electronic_warfare/repeater_jamming.txt:103` |
| `gain_table` | 122 | autopilot_config, gain_table, pid_group… | `p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:138` |
| `gate` | 6 | behavior, on_update, precondition… | `base_types/processors/timeline_agents/behavior_timeline_reposition.txt:82` |
| `gaussian_azimuth_error_sigma` | 4 | jam_strobe_detector, sensor | `electronic_warfare/jam_strobe_direction_finder.txt:72` |
| `gaussian_elevation_error_sigma` | 2 | jam_strobe_detector, sensor | `electronic_warfare/jam_strobe_tracking.txt:147` |
| `gdes` | 4 | script | `air_to_air/rules/brawler_script_util.txt:399` |
| `gear_compression_vector_x` | 24 | ground_reaction_point, landing_gear, p6dof_object_type… | `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:89` |
| `gear_compression_vector_y` | 24 | ground_reaction_point, landing_gear, p6dof_object_type… | `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:90` |
| `gear_compression_vector_z` | 24 | ground_reaction_point, landing_gear, p6dof_object_type… | `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:91` |
| `gear_extended_relative_position_x` | 24 | ground_reaction_point, landing_gear, p6dof_object_type… | `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:86` |
| `gear_extended_relative_position_y` | 24 | ground_reaction_point, landing_gear, p6dof_object_type… | `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:87` |
| `gear_extended_relative_position_z` | 24 | ground_reaction_point, landing_gear, p6dof_object_type… | `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:88` |
| `gear_rolling_vector_x` | 24 | ground_reaction_point, landing_gear, p6dof_object_type… | `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:92` |
| `gear_rolling_vector_y` | 24 | ground_reaction_point, landing_gear, p6dof_object_type… | `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:93` |
| `gear_rolling_vector_z` | 24 | ground_reaction_point, landing_gear, p6dof_object_type… | `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:94` |
| `genap_pattern` | 13 | antenna_pattern | `air_to_air/sensors/esm_rwr/esm.txt:15` |
| `generator` | 18 | platform_type, processor | `base_types/platforms/brawler/brawler_flight_lead.txt:64` |
| `global` | 60 | execute, script_variables | `aea_iads/detection_writes.txt:10` |
| `global_environment` | 4 | global_environment | `sensor_demos/clutter_demo.txt:16` |
| `gmx` | 73 | behavior, precondition, script | `air_to_air/prdata/rules_utils.txt:1384` |
| `gmxsu` | 5 | script | `air_to_air/prdata/rules_utils.txt:1376` |
| `gmxsut` | 5 | script | `air_to_air/prdata/rules_utils.txt:1375` |
| `gnow` | 1 | script | `air_to_air/rules/brawler_script_util.txt:381` |
| `gnuplot_file` | 50 | antenna_plot, flight_path_analysis, horizontal_map… | `sensor_plot/antenna/circular_3d.txt:23` |
| `gnuplot_player_file` | 10 | horizontal_map | `sensor_plot/radar/hm-bistatic-ft-jamming-lab.txt:166` |
| `go` | 2 | advanced_behavior, execute | `air_to_air/rules/shoot_it.txt:264` |
| `go_to` | 2 | platform, route | `kinematic_mover/kinematic_mover_demo.txt:101` |
| `goto` | 154 | navigation, platform, route… | `aea_iads/platforms/soj.txt:467` |
| `gps_cross_track_error` | 4 | navigation_errors, platform_type | `satellite_demos/scenarios/gps_denied.txt:114` |
| `gps_degraded_multiplier` | 2 | navigation_errors, platform_type | `satellite_demos/scenarios/gps_denied.txt:112` |
| `gps_in_track_error` | 4 | navigation_errors, platform_type | `satellite_demos/scenarios/gps_denied.txt:113` |
| `gps_status` | 4 | navigation_errors, platform_type | `satellite_demos/platforms/intelsat.txt:27` |
| `gps_vertical_error` | 4 | navigation_errors, platform_type | `satellite_demos/scenarios/gps_denied.txt:115` |
| `gravity_bias` | 18 | phase, processor, program | `space_operations/launch_vehicles/saturn_v/saturn_v_complex.txt:313` |
| `grid` | 12 | coverage, grid | `coverage_demos/coverage_grids/conus_zone_coverage.txt:13` |
| `grid_data_file` | 6 | grid | `coverage_demos/coverage_grids/conus_zone_coverage.txt:17` |
| `grid_extent` | 6 | heat_map, platform_type, processor | `heatmap/platforms/flight_lead.txt:58` |
| `gross_proximity_range` | 56 | platform_type, processor | `ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:173` |
| `gross_update_interval` | 30 | platform_type, processor | `base_types/weapons/other/gun.txt:36` |
| `ground_range_limits` | 4 | vertical_map | `sensor_plot/radar/vm-ucav-dry.txt:84` |
| `ground_range_step` | 4 | vertical_map | `sensor_plot/radar/vm-ucav-dry.txt:85` |
| `ground_reaction_point` | 24 | ground_reaction_point, landing_gear, p6dof_object_type… | `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:81` |
| `group` | 7 | group | `space_operations/comms/crosslink.txt:12` |
| `group_join` | 20 | comm, platform, platform_type | `comm/group_comm_example.txt:124` |
| `guid_list` | 1 | script | `air_to_air/processors/assessment_scripts.txt:190` |
| `guidance_autopilot_bank_to_turn` | 12 | guidance_autopilot_bank_to_turn, pilot_manager | `p6dof/p6dof_types/aircraft/a-lgt/controls/control_inputs.txt:133` |
| `guidance_autopilot_skid_to_turn` | 12 | guidance_autopilot_skid_to_turn, pilot_manager | `p6dof/p6dof_types/weapons/aam-mr/controls/control_inputs.txt:91` |
| `guidance_delay` | 167 | phase, platform_type, processor | `alternate_locations/weapons/agm/blue_glide_bomb_1.txt:41` |
| `guidance_group` | 16 | guidance_group, test_guidance | `p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:929` |
| `guidance_mode` | 40 | mover, platform_type | `alternate_locations/weapons/sam/large_sam.txt:32` |
| `guidance_target` | 3 | phase, platform_type, processor | `laser_designator/weapons/agm/hellfire.txt:52` |
| `guide_to_truth` | 64 | mover, platform_type, processor | `ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:142` |
| `guider` | 1 | script | `air_to_air/prdata/rules_utils.txt:162` |
| `gunacq` | 2 | script | `base_types/platforms/brawler/alternatives/behavior_weapon_decision_gun.txt:107` |
| `h` | 3 | script | `air_to_air/rules/brawler_script_util.txt:246` |
| `half_angle` | 9 | field_of_view, platform_type, sensor | `coverage_demos/sensors/sat_geosensor.txt:19` |
| `hardware_autopilot_bank_to_turn` | 12 | hardware_autopilot_bank_to_turn, pilot_manager | `p6dof/p6dof_types/aircraft/a-lgt/controls/control_inputs.txt:128` |
| `hardware_autopilot_skid_to_turn` | 12 | hardware_autopilot_skid_to_turn, pilot_manager | `p6dof/p6dof_types/weapons/aam-mr/controls/control_inputs.txt:86` |
| `haveco_reporting_strategy` | 2 | processor | `iads_c2_demos/processors/weapons_manager_ai.txt:17` |
| `haze_model` | 2 | atmospheric_coefficients | `hel/atmosphere/AAA_README.txt:85` |
| `hdg` | 5 | script | `air_to_air/prdata/rules_utils.txt:758` |
| `hdgnow` | 1 | script | `air_to_air/rules/brawler_script_util.txt:378` |
| `head` | 1 | execute | `space_operations/space_weather.txt:120` |
| `header` | 12 | on_initialize, script | `aea_iads/report_writes.txt:46` |
| `header_line_1` | 34 | horizontal_map, vertical_map | `sensor_plot/comm/comm.txt:86` |
| `heading` | 828 | behavior, conditional_section, distribution_centroid… | `acoustic/acoustic_demo.txt:158` |
| `heading_change_limit` | 6 | heat_map, platform_type, processor | `heatmap/platforms/flight_lead.txt:61` |
| `headings` | 8 | false_target, false_target_movement | `aea_iads/weapons/jammer/false_target.txt:38` |
| `heartbeat_multiplier` | 8 | dis_interface | `aea_iads/dis_realtime.txt:26` |
| `heartbeat_timer` | 12 | dis_interface | `aea_iads/dis_realtime.txt:25` |
| `heat_decay` | 6 | heat_map, platform_type, processor | `heatmap/platforms/flight_lead.txt:63` |
| `heat_map` | 6 | heat_map, platform_type, processor | `heatmap/platforms/flight_lead.txt:56` |
| `height` | 4 | platform_type | `ciws/platforms/air_target.txt:13` |
| `hint` | 36 | script | `wargame/scripts/blue_team_hints.txt:21` |
| `hit_proximity_range` | 14 | platform_type, processor | `ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:174` |
| `hits_to_establish_track` | 249 | mode, mode_template, platform_type… | `acoustic/acoustic_demo.txt:59` |
| `hits_to_maintain_track` | 247 | mode, mode_template, platform_type… | `acoustic/acoustic_demo.txt:60` |
| `hlspd` | 4 | behavior, execute | `base_types/platforms/brawler/alternatives/behavior_pilot_posture.txt:180` |
| `hlval` | 4 | behavior, execute | `base_types/platforms/brawler/alternatives/behavior_pilot_posture.txt:223` |
| `hlvec` | 4 | behavior, execute | `base_types/platforms/brawler/alternatives/behavior_pilot_posture.txt:179` |
| `hnorm` | 3 | script | `air_to_air/rules/brawler_script_util.txt:312` |
| `home_base` | 24 | platform, script_variables | `air_to_air/scenarios/escort.txt:363` |
| `hook_to_fuel` | 7 | platform_type, processor, transactor | `exchange_proc/receiver_definition.txt:36` |
| `hook_to_payload` | 6 | platform_type, processor, transactor | `exchange_proc/receiver_definition.txt:38` |
| `hop` | 2 | router_protocol, script | `comm/comms/ad_hoc_comm.txt:119` |
| `hop_limit` | 1 | router | `comm/comms/ad_hoc_comm.txt:135` |
| `horizontal_coverage` | 5 | horizontal_coverage | `sensor_plot/radar/hcd-ew_radar.txt:29` |
| `horizontal_map` | 37 | horizontal_map | `noise_cloud/noise_cloud.txt:45` |
| `hostiles` | 2 | engage_iff_permissions, processor | `iads_c2_demos/processors/battle_manager.txt:63` |
| `hour_of_day` | 2 | sensor, solar_characteristics | `oth_radar/sensors/radar/oth_radar.txt:30` |
| `i` | 22 | advanced_behavior, behavior, execute… | `base_types/processors/quantum_agents/aiai/behavior_planned_route.txt:105` |
| `iacf` | 2 | script | `base_types/platforms/brawler/alternatives/behavior_weapon_decision_missile.txt:309` |
| `iacid` | 1 | script | `air_to_air/processors/assessment_scripts.txt:290` |
| `icon` | 1268 | platform, platform_type | `acoustic/acoustic_demo.txt:35` |
| `id` | 2 | script | `aea_iads/report_writes.txt:127` |
| `id_flag` | 41 | platform, platform_type, processor | `air_to_air/platforms/brawler_test.txt:179` |
| `if` | 10501 | advanced_behavior, behavior, behavior_tree… | `aea_iads/detection_writes.txt:19` |
| `ignition_failure_probability` | 2 | platform_type, stage | `space_operations/platforms/delta_iv_m_staging_failure.txt:24` |
| `ignore` | 70 | platform_type, sensor | `air_to_air/platforms/dca.txt:96` |
| `ignore_domain` | 84 | platform_type, sensor | `air_to_air/sensors/radar/aesa.txt:15` |
| `ignore_friction` | 24 | ground_reaction_point, landing_gear, p6dof_object_type… | `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:102` |
| `ignore_large_error_accum` | 165 | autopilot_config, pid_group, pid_vert_speed | `p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:172` |
| `ignore_launch_platform_velocity` | 7 | platform_type, weapon | `hellfire/active_radar_hellfire/hellfire_type.txt:326` |
| `ignore_pdu_time` | 4 | dis_interface | `aea_iads/dis_realtime.txt:20` |
| `ignore_same_side` | 471 | common, multiresolution_sensor, platform… | `acoustic/acoustic_demo2.txt:151` |
| `ignore_side` | 7 | platform | `space_operations/cloud_attenuation.txt:381` |
| `ignore_uplink_target_change` | 2 | platform_type, processor | `base_types/weapons/aam/medium_range_uplink_missile.txt:123` |
| `ill_list` | 1 | script | `air_to_air/processors/assessment_scripts.txt:192` |
| `illuminated` | 2 | processor, script | `ship_ad/platforms/naval_sam_tactics.txt:82` |
| `image_formation_time` | 2 | sensor | `iads/sensors/radar/ucav_sar.txt:57` |
| `in` | 1 | script | `air_to_air/processors/assessment_scripts.txt:351` |
| `in_rtr` | 1 | script | `air_to_air/processors/assessment_scripts.txt:400` |
| `incidental_damage_allowed` | 1 | weapon_effects | `laser_designator/weapons/agm/hellfire.txt:89` |
| `inclination` | 3968 | common, maneuver, mission_sequence… | `coverage_demos/scenarios/sat_con_1_autogen.txt:29` |
| `include` | 765 | aero, atmosphere_table, autopilot_config… | `aea_iads/platforms/iads_cmdr.txt:149` |
| `include_once` | 6 | conditional_section | `air_to_air/escort.txt:30` |
| `independent_variable` | 11144 | aero_data, aero_mode, alpha_versus_mach_cl_table… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/aero/data/cd_alpha_beta_mach_table.txt:12` |
| `independent_variables` | 16 | independent_variables, launch_computer_table, tool | `air_to_air/weapons/aam/mrm_launch_computer_table.1.1.txt:23` |
| `indestructible` | 40 | platform, platform_type | `air_to_air/platforms/escort.txt:35` |
| `info` | 1 | script | `wargame/scripts/general_scripts.txt:109` |
| `infrared_signature` | 280 | infrared_signature, platform, platform_type | `aea_iads/platforms/iads_cmdr.txt:132` |
| `inherent_contrast` | 2 | inherent_contrast, platform_type | `space_operations/setup_launch_detection.txt:34` |
| `inherit_controls` | 6 | pilot_manager, synthetic_pilot | `six_dof/six_dof_types/spacecraft/orbiter-booster/controls/control_inputs_pm6.txt:24` |
| `inhibit_while_reloading` | 1 | weapon | `ship_ad/weapons/sam/red_sr_sam_1.txt:87` |
| `initial_distribution_interval` | 2 | dis_interface | `exchange_proc/dis_interface.txt:30` |
| `initial_flight_path_angle` | 6 | mover, platform | `kinematic_mover/kinematic_mover_demo.txt:79` |
| `initial_mass` | 11 | mover, platform_type, stage | `base_types/weapons/ssm/blue_cruise_missile.txt:54` |
| `initial_mass_quantity` | 23 | container, platform, platform_type… | `exchange_proc/receiver_definition.txt:28` |
| `initial_mode` | 22 | platform_type, sensor | `air_to_air/sensors/esm_rwr/esm.txt:30` |
| `initial_quantity` | 59 | fuel, platform, platform_type | `air_to_air/platforms/dca.txt:45` |
| `initial_quantity_ratio` | 6 | fuel, platform_type | `air_to_air/platforms/escort.txt:46` |
| `initial_speed` | 6 | mover, platform | `kinematic_mover/kinematic_mover_demo.txt:78` |
| `initial_state` | 2 | initial_state, platform | `cislunar/scenarios/orbiter.txt:24` |
| `inline_table` | 22 | antenna_pattern, inline_table, optical_signature… | `alternate_locations/signatures/ucav_radar_sig.txt:14` |
| `inner_radius` | 18 | network, road_traffic, weighted_region | `traffic_demos/scenarios/china_traffic.txt:29` |
| `inner_weight` | 18 | network, road_traffic, weighted_region | `traffic_demos/scenarios/china_traffic.txt:31` |
| `inop_ref_area` | 38 | jet_engine_type, p6dof_object_types, point_mass_engine_type… | `p6dof/p6dof_types/aircraft/a-lgt/prop/jet_engines/a-m4-22a-1-tf/a-m4-22a-1-tf.txt:31` |
| `input` | 270 | irregular_table, mapping_table, table_data | `p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:28` |
| `input_threshold` | 24 | lateral_acceleration_rate_pid, lateral_acceleration_value_pid, mover… | `hellfire/active_radar_hellfire/helo_mover.txt:99` |
| `inputs` | 1080 | control_boolean, control_surface, control_value… | `p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:174` |
| `ins_accelerometer_bias_error` | 2 | navigation_errors, platform_type | `satellite_demos/scenarios/gps_denied.txt:116` |
| `ins_gyroscope_bias_error` | 2 | navigation_errors, platform_type | `satellite_demos/scenarios/gps_denied.txt:117` |
| `ins_random_walk_error` | 2 | navigation_errors, platform_type | `satellite_demos/scenarios/gps_denied.txt:118` |
| `ins_vertical_error` | 4 | navigation_errors, platform_type | `satellite_demos/scenarios/gps_denied.txt:119` |
| `insert_route` | 53 | navigation, platform, route | `aea_iads/scenarios/strike.txt:119` |
| `instantaneous_bandwidth` | 14 | mode_template, receiver, sensor | `air_to_air/sensors/radar/aesa.txt:61` |
| `int` | 2293 | advanced_behavior, aux_data, behavior… | `aea_iads/detection_writes.txt:47` |
| `integral_gain` | 24 | lateral_acceleration_rate_pid, lateral_acceleration_value_pid, mover… | `hellfire/active_radar_hellfire/helo_mover.txt:97` |
| `integration_gain` | 12 | mode, sensor | `air_to_air/sensors/radar/aesa.txt:125` |
| `integration_method` | 8 | mover, platform_type | `hellfire/active_radar_hellfire/hellfire_type.txt:94` |
| `integration_time_step` | 5 | launch_computer | `ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:189` |
| `integration_timestep` | 84 | mover, platform_type | `alv_routing/platforms/alv.txt:47` |
| `integrator` | 8 | integrator, model, mover… | `cislunar/scenarios/orbiter.txt:30` |
| `integrators` | 6 | integrators, six_dof_object_types | `air_to_air/six_dof_types/environment/integrators_config.txt:10` |
| `inter_system_time_delay` | 4 | error_model, sensor | `sensor_demos/esm_tdoa_demo.txt:122` |
| `intercept_range` | 2 | processor, scoring_factors | `iads_c2_demos/processors/battle_manager.txt:53` |
| `intercept_results` | 10 | intercept_results, launch_computer, launch_computer_table | `air_to_air/weapons/aam/mrm_launch_computer_table.1.1.txt:32` |
| `intercept_speed` | 1 | processor | `iads_c2_demos/processors/weapons_manager_ai.txt:19` |
| `intercept_time` | 2 | processor, scoring_factors | `iads_c2_demos/processors/battle_manager.txt:54` |
| `interface` | 4 | platform | `space_operations/scenarios/iridium_handheld.txt:43` |
| `internal_link` | 1319 | comm, common, model… | `aea_iads/platforms/ew_radar.txt:24` |
| `internal_loss` | 522 | beam, comm, mode… | `aea_iads/sensors/esm_rwr/ucav_esm.txt:29` |
| `internal_table` | 1 | attenuation | `space_operations/comms/lasercomm_link.txt:11` |
| `interpolate_tables` | 1 | radar_signature | `iads/signatures/ucav_radar_sig.txt:17` |
| `interpolation_interval` | 5 | dynamics, model, mover… | `multiresolution_demos/movers/space_mover.txt:41` |
| `interpolation_type` | 1 | radar_signature | `iads/signatures/ucav_radar_sig.txt:18` |
| `intersect_mesh` | 3 | platform_type, processor | `hel/intersect_mesh_test.txt:311` |
| `invalid_unit_details` | 2 | print_settings, processor | `iads_c2_demos/processors/battle_manager.txt:27` |
| `ionosphere_constrains_minimum_range` | 2 | ionospheric_characteristics, sensor | `oth_radar/sensors/radar/oth_radar.txt:38` |
| `ionospheric_characteristics` | 2 | ionospheric_characteristics, sensor | `oth_radar/sensors/radar/oth_radar.txt:33` |
| `irregular_table` | 576 | aero_data, aero_mode, alpha_versus_mach_cl_table… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_support_tables.txt:189` |
| `is` | 1 | script | `air_to_air/prdata/rules_utils.txt:268` |
| `is_dedicated` | 2 | script, script_struct | `space_operations/scripts/comm_link.txt:102` |
| `is_landing_gear` | 24 | ground_reaction_point, landing_gear, p6dof_object_type… | `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:103` |
| `is_linked` | 4 | script, script_struct | `space_operations/scripts/comm_link.txt:71` |
| `is_linking` | 4 | script, script_struct | `space_operations/scripts/comm_link.txt:54` |
| `is_nose_gear` | 24 | ground_reaction_point, landing_gear, p6dof_object_type… | `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:85` |
| `is_offeror` | 7 | platform_type, processor, transactor | `exchange_proc/tanker_definition.txt:33` |
| `is_receiver` | 5 | platform_type, processor, transactor | `logistics/platforms/logistics_platform.txt:368` |
| `is_requestor` | 3 | platform_type, processor, transactor | `exchange_proc/receiver_definition.txt:33` |
| `isp_vs_alt` | 104 | isp_vs_alt, liquid_propellant_rocket, liquid_propellant_rocket_type… | `p6dof/p6dof_types/misc/srb-rato/prop/solid_propellant_rockets/aim-sr-1-rkt/aim-sr-1-rkt.txt:37` |
| `items` | 48 | items, output, run | `engage/flight_path.txt:164` |
| `j` | 2 | script | `base_types/processors/timeline_agents/common_timeline_scripts.txt:154` |
| `j11` | 4 | j11, link16_interface | `l16_j11/j11_in.txt:64` |
| `jam_strobe_detector` | 4 | jam_strobe_detector, sensor | `electronic_warfare/jam_strobe_direction_finder.txt:68` |
| `jammer` | 9 | processor, script | `aea_iads/platforms/soj.txt:204` |
| `jammer_gain_table` | 22 | effect, electronic_attack, electronic_warfare… | `aea_iads/weapons/jammer/soj_base_jammer.txt:48` |
| `jammer_to_noise` | 96 | cancelation_ratios, cancellation_ratios, effect… | `aea_iads/sensors/radar/ew_radar.txt:45` |
| `jammer_to_noise_ratio` | 66 | effect, electronic_attack, electronic_warfare… | `aea_iads/weapons/jammer/soj_base_jammer.txt:49` |
| `jammer_to_signal_reference` | 2 | horizontal_map | `sensor_plot/radar/hm-required-jamming-power.txt:59` |
| `jamming_delta_gain` | 40 | effect, electronic_attack, electronic_warfare… | `aea_iads/weapons/jammer/soj_base_jammer.txt:20` |
| `jamming_perception_threshold` | 37 | beam, comm, jam_strobe_detector… | `electronic_warfare/agile_auto-repeater_jamming.txt:157` |
| `jamming_perception_timeout` | 3 | comm, platform_type | `electronic_warfare/comm_jamming.txt:98` |
| `jamming_platform_name` | 4 | horizontal_map | `sensor_plot/radar/hm-jammer-detect.txt:78` |
| `jamming_pulse_density` | 159 | effect, electronic_attack, electronic_warfare… | `aea_iads/weapons/jammer/soj_base_jammer.txt:36` |
| `jamming_to_signal` | 44 | effect, electronic_warfare, jamming_to_signal_gain_table… | `aea_iads/weapons/jammer/soj_base_jammer.txt:81` |
| `jamming_to_signal_gain_table` | 12 | effect, electronic_warfare, jamming_to_signal_gain_table… | `aea_iads/weapons/jammer/soj_base_jammer.txt:80` |
| `jet` | 42 | jet, point_mass_engine_type, rigid_body_engine_type… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/prop/LTE_FIGHTER_Eng.txt:14` |
| `jet_engine_type` | 14 | jet_engine_type, p6dof_object_types | `p6dof/p6dof_types/aircraft/a-lgt/prop/jet_engines/a-m4-22a-1-tf/a-m4-22a-1-tf.txt:23` |
| `jitter` | 10 | fluence_model, weapon | `hel/ground_hel_vs_hypersonic.txt:72` |
| `job_pass_through` | 1 | processor | `base_types/processors/ripr_agents/aisc/aisc_passthru_processor.txt:16` |
| `jobs` | 12 | behavior, execute | `base_types/processors/quantum_agents/aiai/behavior_bid_on_jobs.txt:75` |
| `join_multicast_group` | 2 | protocol | `space_operations/platforms/interceptor.txt:14` |
| `joker_fuel` | 5 | platform_type, processor | `air_to_air/platforms/brawler_test.txt:182` |
| `kd` | 3236 | autopilot_config, gain_table, pid_alpha… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:26` |
| `ki` | 3260 | autopilot_config, gain_table, pid_alpha… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:25` |
| `killed` | 2 | script | `air_to_air/observer.txt:181` |
| `kp` | 3284 | autopilot_config, gain_table, pid_alpha… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:24` |
| `kturn` | 12 | behavior, execute | `base_types/platforms/brawler/alternatives/behavior_alt1514_point.txt:20` |
| `label` | 329 | navigation, platform, route | `aea_iads/platforms/soj.txt:458` |
| `lag_time_constant` | 10 | flaps, flight_controls, speedbrakes… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/flight_controls_pm6.txt:31` |
| `land_cover` | 3 | global_environment | `sensor_demos/clutter_demo.txt:17` |
| `land_formation` | 3 | global_environment | `sensor_demos/clutter_demo.txt:18` |
| `landing_gear` | 6 | landing_gear, p6dof_object_type, p6dof_object_types… | `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:76` |
| `landing_gear_down` | 4 | platform | `p6dof/airport_operations.txt:964` |
| `lane` | 10 | lane, port, sea_traffic | `traffic_demos/scenarios/west_coast_sea_traffic.txt:36` |
| `lane_route` | 9 | lane, lane_route, sea_traffic | `traffic_demos/scenarios/west_coast_sea_traffic.txt:96` |
| `large_range_step` | 6 | horizontal_coverage, vertical_coverage | `sensor_plot/radar/hcd-ew_radar.txt:42` |
| `laser_code` | 12 | platform_type, sensor | `hellfire/laser_designation_via_dis/designator_type.txt:31` |
| `laser_designations` | 6 | laser_designations | `hellfire/active_radar_hellfire/rf_autonomous_test.txt:26` |
| `laser_type` | 4 | fluence_model, weapon | `hel/hel_test.txt:268` |
| `lat` | 61 | location, p6dof_terrain, region… | `air_to_air/six_dof_types/environment/terrain_config.txt:17` |
| `lat_lon` | 14 | platform, zone | `coverage_demos/zones/state_zones.txt:13` |
| `lat_lon_format` | 29 | event_output | `aea_iads/event_output.txt:14` |
| `lateral_acceleration_rate_pid` | 6 | lateral_acceleration_rate_pid, mover | `hellfire/active_radar_hellfire/helo_mover.txt:95` |
| `lateral_acceleration_value_pid` | 6 | lateral_acceleration_value_pid, mover | `hellfire/active_radar_hellfire/helo_mover.txt:102` |
| `lateral_g_bias` | 8 | phase, platform_type, processor | `hellfire/active_radar_hellfire/hellfire_type.txt:160` |
| `lateral_middle_loop_rate_factor` | 58 | autopilot_config | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:14` |
| `lateral_outer_loop_rate_factor` | 58 | autopilot_config | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:15` |
| `lateral_thrust_gain` | 60 | mover, platform_type, stage | `space_operations/launch_vehicles/atlas_v_401/atlas_v_401_base.txt:93` |
| `latitude` | 20 | network, on_initialize, platform_type… | `comm/platforms/detector.txt:47` |
| `latitude_limits` | 4 | horizontal_map, target_region | `sensor_plot/radar/analysis_map-ucav-dry.txt:57` |
| `latitude_range` | 1 | horizontal_map | `noise_cloud/noise_cloud.txt:50` |
| `latitude_spacing` | 2 | grid | `coverage_demos/coverage_grids/geo_belt_grid_coverage.txt:15` |
| `latitude_span` | 2 | grid | `coverage_demos/coverage_grids/geo_belt_grid_coverage.txt:16` |
| `latitude_step` | 5 | horizontal_map, target_region | `noise_cloud/noise_cloud.txt:52` |
| `lattice` | 1 | antenna_pattern | `sensor_plot/antenna/esa_pattern.txt:19` |
| `launch_acceptable_region` | 9 | launch_acceptable_region, launch_computer, weapon | `hellfire/active_radar_hellfire/hellfire_type.txt:329` |
| `launch_computer` | 193 | launch_computer, platform, weapon | `air_to_air/weapons/aam/medium_range_radar_missile.txt:253` |
| `launch_computer_table` | 8 | launch_computer_table, tool | `air_to_air/weapons/aam/mrm_launch_computer_table.1.1.txt:10` |
| `launch_delta_v` | 150 | platform_type, weapon | `air_to_air/weapons/aam/short_range_ir_missile.txt:206` |
| `launch_heading` | 7 | tool | `space_operations/launch_vehicles/atlas_v_401/tune.txt:28` |
| `launch_headings` | 5 | tool | `space_operations/launch_vehicles/atlas_v_401/lcg_ccafs_leo.txt:30` |
| `launch_platform_type` | 12 | tool | `space_operations/launch_vehicles/atlas_v_401/lcg_ccafs_leo.txt:24` |
| `launch_speed` | 9 | launch_acceptable_region, launch_computer, weapon | `hellfire/active_radar_hellfire/hellfire_type.txt:331` |
| `launched` | 169 | advanced_behavior, behavior, execute… | `aea_iads/processors/red_sam_battery_tactics.txt:108` |
| `launched_platform_type` | 267 | platform, platform_type, processor… | `air_to_air/weapons/aam/medium_range_radar_missile.txt:251` |
| `lbeam` | 2 | script | `base_types/platforms/brawler/alternatives/behavior_weapon_decision_missile.txt:289` |
| `lead` | 10 | formation, script, six_dof_formation | `air_to_air/prdata/rules_utils.txt:1156` |
| `length` | 32 | optical_signature, platform_type, processor… | `ciws/platforms/air_target.txt:14` |
| `leo_data` | 7 | launch_computer, platform | `space_operations/demo_delta_iv_m.txt:80` |
| `leo_data_file` | 12 | tool | `space_operations/launch_vehicles/atlas_v_401/lcg_ccafs_leo.txt:22` |
| `lfire` | 8 | script | `base_types/platforms/brawler/alternatives/behavior_weapon_decision_gun.txt:157` |
| `lfrat` | 2 | script | `base_types/platforms/brawler/alternatives/behavior_weapon_decision_missile.txt:299` |
| `lfrnd` | 2 | script | `base_types/platforms/brawler/alternatives/behavior_weapon_decision_missile.txt:303` |
| `lift_curve_slope` | 4 | aero | `hellfire/active_radar_hellfire/hellfire_type.txt:86` |
| `limited_to_preapogee` | 1 | tool | `base_types/weapons/sam/blue_lr_sam_lcg.txt:48` |
| `limits_and_settings` | 174 | autopilot_config, limits_and_settings, pid_group | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:85` |
| `line_color` | 10 | contour_level, horizontal_map, zone | `sensor_plot/radar/analysis_map-ucav-dry.txt:46` |
| `line_of_sight_manager` | 2 | line_of_sight_manager | `aea_iads/multi_thread.txt:15` |
| `line_width` | 6 | contour_level, horizontal_map | `sensor_plot/radar/analysis_map-ucav-dry.txt:47` |
| `linear_acceleration` | 4 | platform, route | `electronic_warfare/track_error.txt:358` |
| `lines` | 12 | advanced_behavior, behavior, execute | `base_types/processors/quantum_agents/aiai/behavior_debug_job_board.txt:69` |
| `link` | 1164 | comm, comm_link_list, network… | `multiresolution_demos/comm_with_command_chain_demo.txt:41` |
| `link16_interface` | 2 | link16_interface | `l16_j11/j11_in.txt:62` |
| `liquid_propellant_rocket` | 3 | liquid_propellant_rocket, point_mass_engine_type, six_dof_object_types | `six_dof/six_dof_types/spacecraft/orbiter-main/prop/solid_propellant_rockets/orbiter-main-rkt/orbiter-main-rkt.txt:26` |
| `liquid_propellant_rocket_type` | 2 | liquid_propellant_rocket_type, p6dof_object_types | `p6dof/p6dof_types/weapons/simple-icbm/Generic_ICBM_RocketEngines.txt:109` |
| `lngtrn` | 3 | script | `air_to_air/rules/brawler_script_util.txt:277` |
| `load_atmosphere` | 7 | sosm_interface | `sosm/sensor_plot/common_types.txt:16` |
| `load_sensor` | 7 | sosm_interface | `sosm/sensor_plot/common_types.txt:21` |
| `load_table` | 10 | launch_computer, weapon | `air_to_air/weapons/aam/mrm_launch_computer.1.1.txt:11` |
| `load_target` | 6 | sosm_interface | `sosm/sensor_plot/common_types.txt:22` |
| `loc` | 1 | script | `space_operations/scripts/FindEquinoxOrSolstice.txt:48` |
| `local_link` | 1 | platform | `comm/platforms/detector.txt:82` |
| `local_pitch_angle` | 2 | guidance_group, test_guidance | `p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:1002` |
| `local_pitch_program` | 12 | guidance_group, local_pitch_program, test_guidance | `p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:944` |
| `local_roll_angle` | 2 | guidance_group, test_guidance | `p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:1003` |
| `local_traffic` | 2 | local_traffic, sea_traffic | `traffic_demos/scenarios/west_coast_sea_traffic.txt:147` |
| `local_traffic_region` | 22 | port, sea_traffic | `traffic_demos/scenarios/west_coast_sea_traffic.txt:23` |
| `location` | 356 | alternate_locations, comm, ejector… | `air_to_air/six_dof_types/environment/terrain_config.txt:15` |
| `loft_angle` | 2 | tool | `base_types/weapons/ssm/red_icbm_1_lcg.txt:52` |
| `loft_angles` | 31 | tool | `ballistic_missile_shootdown/weapons/sam/blue_naval_sam_lcg.txt:34` |
| `log_created_entities` | 2 | dis_interface | `l16_j11/j11_in.txt:31` |
| `log_status` | 1 | processor | `iads_c2_demos/processors/asset_manager.txt:23` |
| `loiter_route` | 6 | local_traffic, sea_traffic, ship | `traffic_demos/scenarios/west_coast_sea_traffic.txt:162` |
| `lon` | 62 | location, p6dof_terrain, region… | `air_to_air/six_dof_types/environment/terrain_config.txt:18` |
| `longitude` | 20 | network, on_initialize, platform_type… | `comm/platforms/detector.txt:48` |
| `longitude_limits` | 4 | horizontal_map, target_region | `sensor_plot/radar/analysis_map-ucav-dry.txt:58` |
| `longitude_range` | 1 | horizontal_map | `noise_cloud/noise_cloud.txt:49` |
| `longitude_spacing` | 2 | grid | `coverage_demos/coverage_grids/geo_belt_grid_coverage.txt:14` |
| `longitude_span` | 2 | grid | `coverage_demos/coverage_grids/geo_belt_grid_coverage.txt:17` |
| `longitude_step` | 5 | horizontal_map, target_region | `noise_cloud/noise_cloud.txt:51` |
| `lookup` | 2 | script | `base_types/processors/ripr_agents/aijam/aijam_processor.txt:250` |
| `loop` | 5 | script | `air_to_air/prdata/rules_utils.txt:876` |
| `low_pass_alpha` | 514 | autopilot_config, gain_table, pid_alpha… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:35` |
| `mach` | 9866 | aero_data, aero_mode, alpha_versus_mach_cl_table… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_support_tables.txt:193` |
| `mach_and_cd` | 204 | aero | `air_to_air/weapons/aam/medium_range_radar_missile.txt:97` |
| `mach_begin_cd_rise` | 99 | aero | `alternate_locations/weapons/agm/blue_glide_bomb_1.txt:17` |
| `mach_end_cd_rise` | 99 | aero | `alternate_locations/weapons/agm/blue_glide_bomb_1.txt:18` |
| `mach_max_supersonic` | 99 | aero | `alternate_locations/weapons/agm/blue_glide_bomb_1.txt:19` |
| `mach_range` | 18 | state, target_model | `sosm/targets/red_multirole_fighter_3/red_multirole_fighter_3.txt:27` |
| `maintain_drop_holdout_time` | 3 | effect, electronic_warfare, technique | `electronic_warfare/track_drop_maintain_effect.txt:102` |
| `maintain_track_probability` | 2 | mode, sensor | `base_types/sensors/radar/generic_bomber_radar.txt:148` |
| `maneuver` | 57 | maneuver, mission_sequence, platform | `space_operations/mission_design_astrolabe.txt:84` |
| `maneuvering` | 9 | maneuvering, mover, platform… | `space_operations/conjunction_avoidance.txt:79` |
| `manual_pilot_augmented_controls` | 80 | manual_pilot_augmented_controls, pilot_manager | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/control_inputs_pm6.txt:16` |
| `manual_pilot_augmented_stability` | 6 | manual_pilot_augmented_stability, pilot_manager | `p6dof/p6dof_types/aircraft/b-hvy/controls/control_inputs.txt:73` |
| `map_p6dof_object_to_platform` | 23 | p6dof_object_types | `p6dof/platforms/agm-mrc.txt:236` |
| `map_sensor_type` | 1 | sosm_interface | `sosm/sensor_plot/test.txt:16` |
| `map_target_type` | 1 | sosm_interface | `sosm/sensor_plot/test.txt:17` |
| `map_vehicle_to_platform` | 19 | six_dof_object_types | `six_dof/platforms/agm-mrc.txt:325` |
| `mapping_table` | 30 | mapping_table | `p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:20` |
| `mass` | 337 | ballistic_missile_launch_computer, ejectable, mass_properties… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/LTE_FIGHTER.txt:21` |
| `mass_properties` | 220 | mass_properties, p6dof_object_type, p6dof_object_types… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/LTE_FIGHTER.txt:20` |
| `mass_rate` | 16 | commodity, container, platform… | `exchange_proc/receiver_definition.txt:26` |
| `master_track_processor` | 70 | platform, platform_type, processor | `air_to_air/platforms/brawler_test.txt:117` |
| `max` | 6 | precondition, script | `base_types/processors/quantum_agents/aiai/behavior_guide_weapons.txt:121` |
| `max_angle` | 540 | actuator, control_surface | `p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:187` |
| `max_asset_load` | 23 | platform, platform_type, processor | `air_to_air/platforms/brawler_test.txt:152` |
| `max_assignments` | 1 | processor | `iads_c2_demos/processors/asset_manager.txt:28` |
| `max_clamp` | 179 | clamp_gain | `p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:110` |
| `max_commanded_g` | 2 | platform_type, processor | `behavior_tree/weapons/aam/blue_sr_a2a_ir_missile.txt:73` |
| `max_compression` | 24 | ground_reaction_point, landing_gear, p6dof_object_type… | `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:98` |
| `max_error_accum` | 3263 | autopilot_config, gain_table, pid_alpha… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:28` |
| `max_fill_rate` | 221 | fuel_tank, p6dof_object_type, p6dof_object_types… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/LTE_FIGHTER.txt:34` |
| `max_firing_time` | 1 | processor | `iads_c2_demos/processors/battle_manager.txt:22` |
| `max_flow_rate` | 229 | fuel_tank, p6dof_object_type, p6dof_object_types… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/LTE_FIGHTER.txt:33` |
| `max_fuel_quantity` | 229 | fuel_tank, p6dof_object_type, p6dof_object_types… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/LTE_FIGHTER.txt:31` |
| `max_negative_rate` | 360 | actuator, control_surface | `p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:186` |
| `max_positive_rate` | 360 | actuator, control_surface | `p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:185` |
| `max_range_for_engagement_data` | 7 | platform, platform_type, processor | `air_to_air/platforms/brawler_test.txt:209` |
| `max_range_for_perceived_assets` | 7 | platform, platform_type, processor | `air_to_air/platforms/brawler_test.txt:207` |
| `max_range_for_perceived_bogies_and_bandits` | 7 | platform, platform_type, processor | `air_to_air/platforms/brawler_test.txt:208` |
| `max_step_size` | 4 | integrator, platform | `cislunar/scenarios/orbiter.txt:33` |
| `max_tar_acquisition_time` | 1 | processor | `iads_c2_demos/processors/simple_sensors_manager.txt:17` |
| `max_threat_load` | 25 | platform, platform_type, processor | `air_to_air/platforms/brawler_test.txt:151` |
| `max_thrust_sealevel` | 2 | liquid_propellant_rocket_type, p6dof_object_types | `p6dof/p6dof_types/weapons/simple-icbm/Generic_ICBM_RocketEngines.txt:126` |
| `max_thrust_vacuum` | 3 | liquid_propellant_rocket, point_mass_engine_type, six_dof_object_types | `six_dof/six_dof_types/spacecraft/orbiter-main/prop/solid_propellant_rockets/orbiter-main-rkt/orbiter-main-rkt.txt:28` |
| `max_time_of_flight_to_detonate` | 95 | platform_type, processor | `air_to_air/weapons/aam/medium_range_radar_missile.txt:181` |
| `max_ttr_acquisition_time` | 1 | processor | `iads_c2_demos/processors/simple_sensors_manager.txt:18` |
| `max_value` | 270 | control_value | `p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:559` |
| `max_xfer_rate` | 221 | fuel_tank, p6dof_object_type, p6dof_object_types… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/LTE_FIGHTER.txt:35` |
| `maxbank` | 1 | script | `air_to_air/rules/brawler_script_util.txt:395` |
| `maximum_altitude` | 128 | mode_template, mover, platform… | `aea_iads/platforms/large_sam_battalion.txt:106` |
| `maximum_attitude_rate` | 24 | mode, mover | `hellfire/active_radar_hellfire/helo_mover.txt:19` |
| `maximum_body_roll_rate` | 6 | mover, platform | `kinematic_mover/kinematic_mover_demo.txt:84` |
| `maximum_body_turn_rate` | 6 | mover, platform | `kinematic_mover/kinematic_mover_demo.txt:83` |
| `maximum_boresight_angle` | 3 | launch_computer | `base_types/weapons/aam/blue_sr_a2a_ir_missile_ata_launch_computer_alt10kft_0.6mach.txt:20` |
| `maximum_climb_rate` | 50 | mover, platform_type | `base_types/weapons/aam/scenario_test_launch_computer.txt:54` |
| `maximum_commanded_g` | 242 | phase, platform_type, processor | `air_to_air/weapons/aam/medium_range_radar_missile.txt:166` |
| `maximum_cruise_altitude` | 15 | air_traffic, aircraft_type | `traffic_demos/scenarios/china_airports.txt:17` |
| `maximum_damage` | 28 | weapon_effects | `alternate_locations/weapons/agm/blue_glide_bomb_1.txt:53` |
| `maximum_descent_rate` | 3 | phase, platform_type, processor | `base_types/weapons/agm/blue_adv_cruise_missile.txt:92` |
| `maximum_distance_off_road` | 12 | network, road_traffic | `traffic_demos/scenarios/china_traffic.txt:21` |
| `maximum_doppler_speed` | 6 | mode_template, sensor, signal_processor | `air_to_air/sensors/radar/aesa.txt:84` |
| `maximum_dwell_time` | 6 | mode_template, sensor | `sensor_plot/sar/bomber_sar.txt:90` |
| `maximum_elevation_for_csc2` | 4 | antenna_pattern | `aea_iads/sensors/radar/ew_radar.txt:22` |
| `maximum_false_target_capacity` | 5 | effect, electronic_attack, technique… | `electronic_warfare/simple_ft_jamming.txt:53` |
| `maximum_ground_speed` | 24 | mode, mover | `hellfire/active_radar_hellfire/helo_mover.txt:27` |
| `maximum_impact_speed` | 2 | mover, platform_type | `cyber/platforms/uav.txt:36` |
| `maximum_intercept_angle` | 4 | launch_computer | `ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:192` |
| `maximum_iterations_per_engagement` | 2 | tool | `base_types/weapons/aam/ata4_generator.txt:102` |
| `maximum_lateral_acceleration` | 40 | mover, platform_type | `alternate_locations/weapons/sam/large_sam.txt:31` |
| `maximum_linear_acceleration` | 104 | mover, platform, platform_type | `alv_routing/platforms/awacs.txt:19` |
| `maximum_location_change` | 2 | line_of_sight_manager | `aea_iads/multi_thread.txt:17` |
| `maximum_mass_quantity` | 22 | commodity, container, platform… | `exchange_proc/receiver_definition.txt:25` |
| `maximum_mass_rate` | 6 | commodity, platform_type | `logistics/platforms/fueling_truck.txt:35` |
| `maximum_mover_update_interval` | 5 | event_pipe | `multiresolution_demos/air_mover_demo.txt:31` |
| `maximum_number_of_beams` | 8 | weapon | `aea_iads/weapons/jammer/soj_sband_jammer.txt:27` |
| `maximum_number_of_spots` | 11 | weapon | `aea_iads/weapons/jammer/soj_vhf_jammer.txt:22` |
| `maximum_opening_speed` | 3 | launch_computer | `base_types/weapons/aam/blue_sr_a2a_ir_missile_ata_launch_computer_alt10kft_0.6mach.txt:21` |
| `maximum_operating_range` | 15 | air_traffic, aircraft_type | `traffic_demos/scenarios/china_airports.txt:21` |
| `maximum_ordinate_values` | 8 | fires_table, launch_computer | `fires/types/fires_120mm_artillery.txt:17` |
| `maximum_output_altitude` | 1 | tool | `base_types/weapons/sam/blue_sr_sam_lcg.txt:63` |
| `maximum_output_range` | 5 | tool | `ballistic_missile_shootdown/weapons/sam/blue_naval_sam_lcg.txt:45` |
| `maximum_pitch_acceleration_at_thrust` | 12 | engine, point_mass_vehicle_type, propulsion_data… | `six_dof/six_dof_types/spacecraft/orbiter-booster/orbiter-booster.txt:50` |
| `maximum_pitch_acceleration_mach_table` | 32 | aero_data, maximum_pitch_acceleration_mach_table | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/aero/aero_pm6.txt:30` |
| `maximum_pitch_angle` | 39 | phase, platform_type, processor | `base_types/weapons/agm/blue_adv_cruise_missile.txt:100` |
| `maximum_pitch_rate` | 3 | attitude_controller, mover, platform_type | `space_operations/attitude_control.txt:58` |
| `maximum_quantity` | 65 | commodity, fuel, platform… | `base_types/platforms/blue_adv_fighter_1_base.txt:43` |
| `maximum_radial_acceleration` | 53 | mover, platform, platform_type | `alternate_locations/platforms/ucav.txt:21` |
| `maximum_radius` | 129 | platform, platform_type, weapon_effects… | `aea_iads/platforms/large_sam_battalion.txt:107` |
| `maximum_range` | 310 | beam, clutter_model, comm… | `aea_iads/sensors/esm_rwr/ucav_esm.txt:23` |
| `maximum_rate_of_climb` | 24 | mode, mover | `hellfire/active_radar_hellfire/helo_mover.txt:29` |
| `maximum_rate_of_descent` | 24 | mode, mover | `hellfire/active_radar_hellfire/helo_mover.txt:30` |
| `maximum_request_count` | 99 | mode, mode_template, platform_type… | `aea_iads/sensors/radar/ttr_radar.txt:79` |
| `maximum_rmax_limit` | 1 | tool | `base_types/weapons/aam/ata4_generator.txt:107` |
| `maximum_roll_acceleration_at_thrust` | 4 | engine, point_mass_vehicle_type, propulsion_data… | `six_dof/six_dof_types/spacecraft/orbiter-main/orbiter-main.txt:53` |
| `maximum_roll_acceleration_mach_table` | 32 | aero_data, maximum_roll_acceleration_mach_table | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/aero/aero_pm6.txt:26` |
| `maximum_roll_rate` | 3 | attitude_controller, mover, platform_type | `space_operations/attitude_control.txt:59` |
| `maximum_slant_range` | 3 | launch_computer | `base_types/weapons/aam/blue_sr_a2a_ir_missile_ata_launch_computer_alt10kft_0.6mach.txt:19` |
| `maximum_speed` | 110 | mover, network, osm_traffic… | `base_types/platforms/blue_adv_fighter_1_base.txt:26` |
| `maximum_spots_per_beam` | 8 | weapon | `aea_iads/weapons/jammer/soj_sband_jammer.txt:30` |
| `maximum_target_association_distance` | 3 | platform_type, sensor | `hellfire/laser_designation_via_dis/designator_type.txt:28` |
| `maximum_time_difference` | 6 | platform_type, processor | `bearing_only/platforms/fuser_platform2.txt:64` |
| `maximum_time_of_flight` | 62 | launch_computer, platform_type, processor | `alternate_locations/weapons/agm/blue_glide_bomb_1.txt:45` |
| `maximum_total_acceleration` | 24 | mode, mover | `hellfire/active_radar_hellfire/helo_mover.txt:32` |
| `maximum_transmission_range` | 3 | platform_type, sensor | `hellfire/laser_designation_via_dis/designator_type.txt:25` |
| `maximum_turn_rate` | 6 | mover, platform_type | `wargame/platforms/bomber.txt:43` |
| `maximum_yaw_acceleration_at_thrust` | 12 | engine, point_mass_vehicle_type, propulsion_data… | `six_dof/six_dof_types/spacecraft/orbiter-booster/orbiter-booster.txt:49` |
| `maximum_yaw_acceleration_mach_table` | 32 | aero_data, maximum_yaw_acceleration_mach_table | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/aero/aero_pm6.txt:34` |
| `maximum_yaw_rate` | 3 | attitude_controller, mover, platform_type | `space_operations/attitude_control.txt:57` |
| `me` | 2 | script | `air_to_air/processors/assessment_scripts.txt:189` |
| `mean` | 5 | script | `base_types/processors/quantum_agents/aifl/behavior_manage-pincer.txt:97` |
| `mean_anomaly` | 3 | platform | `space_operations/mission_design_astrolabe.txt:55` |
| `mean_cruise_speed` | 15 | air_traffic, aircraft_type | `traffic_demos/scenarios/china_airports.txt:18` |
| `mean_loiter_time` | 6 | local_traffic, sea_traffic, ship | `traffic_demos/scenarios/west_coast_sea_traffic.txt:150` |
| `mean_speed` | 78 | departure_traffic, local_traffic, network… | `traffic_demos/scenarios/china_traffic.txt:38` |
| `mean_travel_time` | 12 | network, road_traffic | `traffic_demos/scenarios/china_traffic.txt:23` |
| `member` | 6 | comm_list, network | `multiresolution_demos/comm_with_command_chain_demo.txt:36` |
| `member_platform` | 30 | formation, six_dof_formation, six_dof_unit… | `p6dof/basic_formation.txt:79` |
| `message_processor` | 4 | message_processor, processor | `l16_j11/jtids.txt:33` |
| `message_table` | 1 | message_table | `suppressor/bomb_demo.txt:37` |
| `mgr_string` | 2 | script | `air_to_air/sensor_observer.txt:365` |
| `min` | 5 | precondition, script | `base_types/processors/quantum_agents/aifl/behavior_manage-pincer.txt:240` |
| `min_angle` | 540 | actuator, control_surface | `p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:188` |
| `min_clamp` | 179 | clamp_gain | `p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:109` |
| `min_hdg` | 2 | advanced_behavior, execute | `air_to_air/rules/pump_in.txt:121` |
| `min_rng` | 2 | advanced_behavior, on_new_execute | `air_to_air/rules/route_rules.txt:120` |
| `min_step_size` | 2 | integrator, platform | `satellite_demos/aerobraking_demo.txt:46` |
| `min_taxi_turn_radius` | 41 | autopilot_config | `p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:37` |
| `min_value` | 270 | control_value | `p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:558` |
| `mind_file` | 6 | platform_type, processor | `air_to_air/platforms/brawler_test.txt:76` |
| `minimum_altitude` | 83 | mode_template, mover, platform… | `air_to_air/sensors/esm_rwr/esm.txt:33` |
| `minimum_clutter_to_noise_ratio` | 6 | mode_template, sensor | `sensor_plot/sar/bomber_sar.txt:91` |
| `minimum_cruise_altitude` | 15 | air_traffic, aircraft_type | `traffic_demos/scenarios/china_airports.txt:16` |
| `minimum_damage` | 28 | weapon_effects | `alternate_locations/weapons/agm/blue_glide_bomb_1.txt:52` |
| `minimum_detections` | 2 | processor | `sensor_demos/esm_tdoa_demo.txt:93` |
| `minimum_distance_off_road` | 12 | network, road_traffic | `traffic_demos/scenarios/china_traffic.txt:20` |
| `minimum_doppler_speed` | 7 | mode_template, sensor, signal_processor | `base_types/sensors/radar/blue_ship_mf_radar.txt:131` |
| `minimum_elevation_for_peak_gain` | 4 | antenna_pattern | `aea_iads/sensors/radar/ew_radar.txt:20` |
| `minimum_energy` | 12 | category, region, target_type… | `hel/hel_test.txt:140` |
| `minimum_energy_density` | 8 | category, target_type, weapon_effects | `hel/ground_hel_vs_hypersonic.txt:27` |
| `minimum_gain` | 236 | antenna_pattern, circular_pattern, rectangular_pattern… | `aea_iads/sensors/radar/acq_radar.txt:17` |
| `minimum_jammer_to_noise_threshold` | 18 | effect, electronic_attack, electronic_warfare… | `aea_iads/weapons/jammer/soj_base_jammer.txt:47` |
| `minimum_opening_speed` | 3 | launch_computer | `base_types/weapons/aam/blue_sr_a2a_ir_missile_ata_launch_computer_alt10kft_0.6mach.txt:22` |
| `minimum_output_time` | 5 | tool | `ballistic_missile_shootdown/weapons/sam/blue_naval_sam_lcg.txt:43` |
| `minimum_radius` | 39 | platform_type, weapon_effects, zone | `alternate_locations/weapons/agm/blue_glide_bomb_1.txt:50` |
| `minimum_range` | 64 | beam, platform, platform_type… | `alv_routing/sensors/ew_radar.txt:24` |
| `minimum_runway_length` | 15 | air_traffic, aircraft_type | `traffic_demos/scenarios/china_airports.txt:20` |
| `minimum_slant_range` | 3 | launch_computer | `base_types/weapons/aam/blue_sr_a2a_ir_missile_ata_launch_computer_alt10kft_0.6mach.txt:18` |
| `minimum_speed` | 54 | mover, platform_type | `base_types/weapons/aam/scenario_test_launch_computer.txt:56` |
| `minimum_upward_acceleration` | 24 | mode, mover | `hellfire/active_radar_hellfire/helo_mover.txt:20` |
| `mission_sequence` | 4 | mission_sequence, platform | `space_operations/mission_design_astrolabe.txt:81` |
| `mission_task` | 14 | platform | `air_to_air/scenarios/1v1.txt:56` |
| `mitigated_technique_classes` | 146 | beam, electronic_protect, electronic_warfare… | `aea_iads/sensors/radar/ew_radar.txt:37` |
| `mitigated_techniques` | 68 | beam, electronic_protect, electronic_warfare… | `aea_iads/sensors/radar/acq_radar.txt:26` |
| `mitigation_class` | 20 | electronic_warfare, technique | `aea_iads/weapons/jammer/soj_base_jammer.txt:18` |
| `mitigation_class_name` | 106 | electronic_attack, electronic_warfare, technique… | `electronic_warfare/agile_auto-repeater_jamming.txt:90` |
| `mode` | 293 | fuel, fuel_table, mode… | `aea_iads/sensors/radar/ttr_radar.txt:76` |
| `mode_name` | 120 | agility_type, beam, effect… | `electronic_warfare/agile_auto-repeater_jamming.txt:180` |
| `mode_select_delay` | 8 | sensor | `electronic_warfare/agile_auto-repeater_jamming.txt:134` |
| `mode_template` | 106 | mode_template, platform_type, sensor | `aea_iads/sensors/radar/ttr_radar.txt:41` |
| `model` | 32 | model, multiresolution_comm, multiresolution_fuel… | `multiresolution_demos/comms/comm_include.txt:44` |
| `modifier` | 3184 | behavior, control_boolean, control_input… | `base_types/processors/quantum_agents/aiai/behavior_unload.txt:50` |
| `modifier_category` | 10 | platform, platform_type, sensor | `draw/draw_demo.txt:35` |
| `modulation_type` | 2 | comm, transmitter | `space_operations/comms/lasercomm_link.txt:37` |
| `moe` | 24 | coverage, moe | `coverage_demos/coverage_grids/conus_zone_coverage.txt:39` |
| `moment_of_inertia_ixx` | 175 | mass_properties, p6dof_object_type, p6dof_object_types… | `p6dof/p6dof_types/aircraft/a-lgt/a-lgt.txt:29` |
| `moment_of_inertia_iyy` | 175 | mass_properties, p6dof_object_type, p6dof_object_types… | `p6dof/p6dof_types/aircraft/a-lgt/a-lgt.txt:30` |
| `moment_of_inertia_izz` | 175 | mass_properties, p6dof_object_type, p6dof_object_types… | `p6dof/p6dof_types/aircraft/a-lgt/a-lgt.txt:31` |
| `mover` | 2046 | model, mover, multiresolution_mover… | `acoustic/acoustic_demo.txt:36` |
| `mover_update_timer` | 12 | dis_interface | `aea_iads/dis_realtime.txt:27` |
| `msg` | 119 | behavior, execute, precondition | `base_types/platforms/brawler/alternatives/behavior_weapon_decision_missile.txt:465` |
| `msl_loft` | 4 | behavior, precondition | `base_types/platforms/brawler/alternatives/behavior_alt3841_aim_missile_typ4.txt:117` |
| `mti_angle_limits` | 4 | sensor, signal_processor | `base_types/sensors/radar/mtd_radar.txt:63` |
| `mti_min_response` | 4 | sensor, signal_processor | `base_types/sensors/radar/mtd_radar.txt:60` |
| `mti_num_delays` | 4 | sensor, signal_processor | `base_types/sensors/radar/mtd_radar.txt:59` |
| `mti_num_gates` | 4 | sensor, signal_processor | `base_types/sensors/radar/mtd_radar.txt:61` |
| `mti_range_limits` | 4 | sensor, signal_processor | `base_types/sensors/radar/mtd_radar.txt:62` |
| `mti_switch` | 4 | sensor, signal_processor | `base_types/sensors/radar/mtd_radar.txt:58` |
| `multi_radar_behavior` | 3 | false_target | `aea_iads/weapons/jammer/false_target.txt:15` |
| `multi_thread` | 2 | line_of_sight_manager | `aea_iads/multi_thread.txt:16` |
| `multi_threading` | 2 | dis_interface | `aea_iads/multi_thread.txt:23` |
| `multicast` | 20 | connections, dis_interface, xio_interface | `aea_iads/dis_realtime.txt:14` |
| `multiplier` | 8 | script | `p6dof/p6dof_types/scripts/p6dof_complex_scripts.txt:61` |
| `multiresolution_comm` | 1 | multiresolution_comm | `multiresolution_demos/comms/comm_include.txt:43` |
| `multiresolution_fuel` | 5 | multiresolution_fuel, platform, platform_type | `multiresolution_demos/fuel_demo.txt:47` |
| `multiresolution_mover` | 10 | multiresolution_mover, platform, platform_type | `multiresolution_demos/air_mover_demo.txt:36` |
| `multiresolution_optical_signature` | 1 | multiresolution_optical_signature | `multiresolution_demos/signatures/fighter_multiresolution_signature.txt:16` |
| `multiresolution_processor` | 2 | multiresolution_processor | `multiresolution_demos/processors/processor_include.txt:12` |
| `multiresolution_radar_signature` | 1 | multiresolution_radar_signature | `multiresolution_demos/signatures/radar_signatures.txt:44` |
| `multiresolution_sensor` | 5 | multiresolution_sensor, platform, platform_type | `multiresolution_demos/sensor_demo.txt:54` |
| `munition_type` | 2 | dis_interface | `l16_j11/j11_in.txt:29` |
| `my` | 3 | script | `air_to_air/prdata/rules_utils.txt:35` |
| `my_wing` | 4 | advanced_behavior, execute | `air_to_air/rules/crank.txt:113` |
| `myalt` | 1 | script | `air_to_air/rules/brawler_script_util.txt:375` |
| `myroc` | 1 | script | `air_to_air/rules/brawler_script_util.txt:376` |
| `mystring` | 13 | script | `electronic_warfare/esm_detect_multi_sensor_radar.txt:426` |
| `n_bar_x` | 5 | antenna_pattern | `aea_iads/weapons/jammer/soj_xband_jammer.txt:29` |
| `n_bar_y` | 5 | antenna_pattern | `aea_iads/weapons/jammer/soj_xband_jammer.txt:30` |
| `n_pump` | 1 | on_initialize | `air_to_air/processors/assessment_scripts.txt:495` |
| `name` | 250 | advanced_behavior_tree, clamp_gain, control_boolean… | `aea_iads/strike.txt:25` |
| `nav_data_update_interval` | 6 | platform, platform_type, processor | `air_to_air/platforms/brawler_test.txt:193` |
| `navigation` | 111 | mover, navigation, platform… | `aea_iads/platforms/soj.txt:457` |
| `navigation_errors` | 6 | navigation_errors, platform_type | `satellite_demos/platforms/intelsat.txt:26` |
| `near` | 7 | on_update, precondition, script | `base_types/processors/quantum_agents/aifl/behavior_manage-pincer.txt:194` |
| `near2` | 10 | precondition, script | `base_types/processors/quantum_agents/aifl/behavior_manage-pincer.txt:192` |
| `nearest` | 2 | script | `base_types/processors/timeline_agents/common_timeline_scripts.txt:301` |
| `needid` | 4 | script | `base_types/platforms/brawler/alternatives/behavior_weapon_decision_gun.txt:153` |
| `needil` | 3 | script | `air_to_air/processors/assessment_scripts.txt:191` |
| `needwqt` | 6 | script | `base_types/platforms/brawler/alternatives/behavior_weapon_decision_missile.txt:357` |
| `network` | 21 | network, osm_traffic, road_traffic | `comm/comms/network.txt:10` |
| `network_address` | 1 | network | `space_operations/platforms/starlink.txt:25` |
| `network_link` | 132 | platform | `space_operations/scenarios/iridium.txt:22` |
| `network_name` | 3634 | comm, common, platform… | `aea_iads/platforms/iads_cmdr.txt:137` |
| `neutrals` | 2 | engage_iff_permissions, processor | `iads_c2_demos/processors/battle_manager.txt:61` |
| `new_altitude` | 3 | script | `air_to_air/prdata/rules_utils.txt:1358` |
| `newalt` | 8 | on_entry, phase, platform_type… | `cyber/weapons/agm/client_agm.txt:158` |
| `newspeed` | 24 | on_entry, phase, platform_type… | `cyber/weapons/agm/client_agm.txt:146` |
| `next_phase` | 694 | phase, platform_type, processor | `air_to_air/weapons/aam/medium_range_radar_missile.txt:168` |
| `next_state` | 1225 | next_state, platform_type, processor… | `aea_iads/platforms/iads_cmdr.txt:105` |
| `no_debug` | 13 | sensor | `base_types/sensors/eo_ir/generic_irst.txt:56` |
| `no_escape_maneuver` | 8 | launch_computer_table, tool | `air_to_air/weapons/aam/mrm_launch_computer_table.1.1.txt:21` |
| `no_saturation_effect` | 97 | beam, effect, electronic_protect… | `electronic_warfare/agile_auto-repeater_jamming.txt:196` |
| `no_trk` | 2 | script | `base_types/platforms/brawler/alternatives/behavior_weapon_decision_missile.txt:351` |
| `node_id` | 3122 | navigation, route, route_network | `traffic_demos/roads/china_roadnetwork.txt:13` |
| `noise_cloud` | 2 | noise_cloud | `noise_cloud/noise_cloud.txt:36` |
| `noise_environment` | 1 | sensor | `oth_radar/sensors/radar/oth_radar.txt:63` |
| `noise_equivalent_irradiance` | 10 | sensor, sensor_model | `base_types/sensors/eo_ir/generic_irst.txt:97` |
| `noise_figure` | 44 | mode_template, receiver, sensor | `air_to_air/sensors/radar/aesa.txt:60` |
| `noise_frequency` | 2 | noise_cloud | `noise_cloud/noise_cloud.txt:37` |
| `noise_jamming` | 32 | beam, electronic_protect, electronic_warfare… | `aea_iads/sensors/radar/ew_radar.txt:38` |
| `noise_octaves` | 2 | noise_cloud | `noise_cloud/noise_cloud.txt:38` |
| `noise_power` | 355 | beam, comm, mode… | `aea_iads/sensors/esm_rwr/ucav_esm.txt:28` |
| `nominal_height_above_ground_on_gear` | 6 | landing_gear, p6dof_object_type, p6dof_object_types… | `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:79` |
| `non_master_track_processor` | 7 | platform_type, processor | `air_to_air/platforms/brawler_test.txt:98` |
| `normal1bearing` | 9 | on_update, platform_type, processor | `bearing_only/platforms/fuser_platform1.txt:83` |
| `normal2bearing` | 6 | on_update, platform_type, processor | `bearing_only/platforms/fuser_platform1.txt:97` |
| `normalized_spindown` | 5 | liquid_propellant_rocket, liquid_propellant_rocket_type, p6dof_object_types… | `p6dof/p6dof_types/weapons/simple-icbm/Generic_ICBM_RocketEngines.txt:129` |
| `normalized_spinup` | 5 | liquid_propellant_rocket, liquid_propellant_rocket_type, p6dof_object_types… | `p6dof/p6dof_types/weapons/simple-icbm/Generic_ICBM_RocketEngines.txt:128` |
| `normalized_thrust_vs_alt` | 7 | liquid_propellant_rocket, liquid_propellant_rocket_type, normalized_thrust_vs_alt… | `p6dof/p6dof_types/weapons/simple-icbm/Generic_ICBM_RocketEngines.txt:111` |
| `north_position_error_sigma` | 4 | error_model, sensor | `sensor_demos/esm_tdoa_demo.txt:118` |
| `nozzle_exit_area` | 8 | mover, platform_type, stage | `base_types/weapons/sam/blue_lr_sam_common.txt:243` |
| `num_chaff` | 5 | platform, platform_type, processor | `air_to_air/platforms/brawler_test.txt:237` |
| `num_decoys` | 5 | platform, platform_type, processor | `air_to_air/platforms/brawler_test.txt:239` |
| `num_flares` | 5 | platform, platform_type, processor | `air_to_air/platforms/brawler_test.txt:238` |
| `num_stages` | 3 | on_message, processor, script | `space_operations/processors/image_proc.txt:37` |
| `num_threats` | 3 | script | `air_to_air/prdata/rules_utils.txt:914` |
| `number_canceler_channels` | 8 | effect, electronic_protect, electronic_warfare… | `aea_iads/sensors/radar/ew_radar.txt:41` |
| `number_canceller_channels` | 18 | effect, electronic_protect, electronic_warfare… | `electronic_warfare/jam_strobe_tracking.txt:124` |
| `number_dipoles` | 2 | chaff_parcel | `chaff/chaff_example.txt:32` |
| `number_elements_x` | 8 | antenna_pattern | `aea_iads/weapons/jammer/soj_xband_jammer.txt:22` |
| `number_elements_y` | 7 | antenna_pattern | `aea_iads/weapons/jammer/soj_xband_jammer.txt:24` |
| `number_of_angle_measurements` | 3 | fusion_method, platform_type, track_manager | `space_operations/scenarios/ssn_laydown.txt:51` |
| `number_of_aspect_angle_bins` | 6 | intercept_results, launch_computer | `base_types/weapons/aam/blue_sr_a2a_ir_missile_ata_launch_computer_alt10kft_0.6mach.txt:29` |
| `number_of_false_targets` | 9 | effect, electronic_warfare, technique | `sensor_demos/bistatic_sp_false_target_jamming_demo.txt:22` |
| `number_of_pulses_integrated` | 50 | beam, mode_template, sensor | `aea_iads/sensors/radar/acq_radar.txt:70` |
| `number_of_servers` | 20 | platform_type, processor | `aea_iads/platforms/iads_cmdr.txt:19` |
| `number_slc_channels_saturated` | 5 | effect, electronic_attack, technique… | `electronic_warfare/pol_mod_jamming.txt:64` |
| `nws_angle_control_surface_name` | 8 | ground_reaction_point, landing_gear, p6dof_object_type… | `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:84` |
| `nws_enable_control_name` | 6 | landing_gear, p6dof_object_type, p6dof_object_types… | `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:77` |
| `nws_enabled` | 4 | platform | `p6dof/airport_operations.txt:966` |
| `oba` | 2 | script | `air_to_air/prdata/rules_utils.txt:708` |
| `obang` | 3 | script | `air_to_air/prdata/rules_utils.txt:337` |
| `object_graphical_type_num` | 19 | p6dof_object_type, p6dof_object_types | `p6dof/p6dof_types/misc/zell-launch-system/zell-launch-system.txt:15` |
| `oblate_earth` | 4 | mover, platform, platform_type | `space_operations/satellite_breakup.txt:29` |
| `observer` | 71 | observer | `acoustic/acoustic_demo2.txt:335` |
| `occluded` | 4 | processor, script | `hel/intersect_mesh_test.txt:90` |
| `off` | 255 | platform, platform_type, processor… | `aea_iads/platforms/soj.txt:416` |
| `offset` | 155 | formation, maneuver, mission_sequence… | `aea_iads/platforms/soj.txt:459` |
| `offset_ara` | 4 | alternate_locations, platform | `alternate_locations/scenarios/target_list.txt:16` |
| `offset_from_reference` | 8 | platform | `electronic_warfare/comm_jamming.txt:194` |
| `offset_lla` | 4 | alternate_locations, platform | `alternate_locations/scenarios/target_list.txt:36` |
| `ok` | 30 | on_initialize, on_update, platform… | `base_types/processors/timeline_agents/air_combat_maneuvers.txt:214` |
| `omit_velocity_pursuit` | 2 | platform_type, processor | `behavior_tree/weapons/aam/blue_sr_a2a_ir_missile.txt:74` |
| `on` | 1375 | comm, common, multiresolution_sensor… | `acoustic/acoustic_demo.txt:47` |
| `on_bingo` | 3 | fuel, on_bingo, platform_type | `base_types/platforms/red_multirole_fighter_2_base.txt:75` |
| `on_empty` | 3 | fuel, on_empty, platform_type | `base_types/platforms/red_multirole_fighter_2_base.txt:78` |
| `on_entry` | 298 | on_entry, phase, platform_type… | `alv_routing/platforms/alv.txt:77` |
| `on_exit` | 26 | on_exit, phase, platform_type… | `base_types/processors/quantum_agents/aiai/behavior_pincer_fsm.txt:335` |
| `on_failure` | 9 | mode, platform_type, sensor | `hel/intersect_mesh_test_beam_director.txt:356` |
| `on_ground` | 6 | mover, platform_type | `hellfire/active_radar_hellfire/target_type.txt:31` |
| `on_init` | 256 | advanced_behavior, behavior, on_init | `air_to_air/rules/ftr_rules.txt:154` |
| `on_initialize` | 253 | model, multiresolution_processor, on_initialize… | `aea_iads/detection_writes.txt:18` |
| `on_initialize2` | 63 | on_initialize2, platform, platform_type… | `alternate_locations/processors/ucav_weapon_release.txt:19` |
| `on_message` | 106 | model, multiresolution_processor, on_message… | `alv_routing/platforms/fighter_bomber.txt:35` |
| `on_new_execute` | 29 | advanced_behavior, behavior, on_new_execute | `air_to_air/rules/merge.txt:62` |
| `on_new_fail` | 4 | advanced_behavior, behavior, on_new_fail | `air_to_air/rules/merge.txt:65` |
| `on_road` | 6 | mover, platform_type | `traffic_demos/platforms/car.txt:12` |
| `on_success` | 17 | mode, platform_type, sensor | `aea_iads/sensors/radar/ttr_radar.txt:91` |
| `on_track_drop` | 7 | on_track_drop, processor | `air_to_air/processors/sensor_cue_processor.txt:54` |
| `on_update` | 296 | on_update, platform, platform_type… | `air_to_air/processors/uplink.txt:55` |
| `one_m2_detect_range` | 174 | beam, mode, mode_template… | `aea_iads/sensors/radar/acq_radar.txt:39` |
| `operating_level` | 30 | platform_type, processor | `aea_iads/platforms/iads_cmdr.txt:146` |
| `operating_mode` | 41 | mode, platform, repeater… | `base_types/sensors/radar/generic_sar.txt:85` |
| `optical_signature` | 337 | model, multiresolution_optical_signature, optical_signature… | `aea_iads/platforms/iads_cmdr.txt:133` |
| `optics_transmission_factor` | 4 | comm, receiver, transmitter | `space_operations/comms/lasercomm_link.txt:42` |
| `orbit` | 2836 | orbit, platform | `satellite_demos/6th_Hohmann_leo_orbit_transfer_demo.txt:46` |
| `orientation` | 6 | attitude_controller, mover, platform_type | `satellite_demos/5th_iridium_flares_demo.txt:262` |
| `origin` | 4 | execute, grid | `base_types/weapons/aam/scenario_test_launch_computer.txt:161` |
| `orphan_action` | 5 | platform | `electronic_warfare/comm_jamming.txt:195` |
| `osm_traffic` | 1 | osm_traffic | `traffic_demos/scenarios/osm_traffic.txt:9` |
| `oswalds_factor` | 18 | aero | `air_to_air/weapons/aam/medium_range_radar_missile.txt:109` |
| `other_dragging_count` | 8 | script | `base_types/processors/quantum_agents/aiai/behavior_pincer_fsm.txt:217` |
| `other_tgtd` | 6 | script | `base_types/platforms/brawler/alternatives/behavior_weapon_decision_missile.txt:307` |
| `out` | 4 | script | `engage/post_process_test.txt:105` |
| `outer_radius` | 18 | network, road_traffic, weighted_region | `traffic_demos/scenarios/china_traffic.txt:30` |
| `outer_weight` | 18 | network, road_traffic, weighted_region | `traffic_demos/scenarios/china_traffic.txt:32` |
| `outgoing_weapon_server` | 1 | wsf_weapon_server | `l16_j11/j11_out.txt:103` |
| `outgoing_weapon_type` | 1 | wsf_weapon_server | `l16_j11/j11_out.txt:104` |
| `output` | 88 | coverage, moe, output… | `coverage_demos/coverage_grids/conus_zone_coverage.txt:40` |
| `output_column_limit` | 22 | horizontal_map, vertical_map | `sensor_plot/esm/hm-jammer-detect-1.txt:93` |
| `output_dir` | 6 | coverage | `coverage_demos/coverage_grids/conus_zone_coverage.txt:35` |
| `output_dis` | 2 | processor | `l16_j11/jtids.txt:29` |
| `output_file` | 29 | antenna_plot, horizontal_coverage, vertical_coverage | `iads/sensors/radar/acq_radar_vcd.txt:24` |
| `output_file_name` | 5 | clutter_table, tool | `base_types/weapons/aam/ata4_generator.txt:98` |
| `output_max_height` | 1 | vertical_coverage | `sensor_plot/radar/vcd-acq_radar.txt:47` |
| `output_max_range` | 6 | horizontal_coverage, vertical_coverage | `sensor_plot/radar/hcd-ew_radar.txt:54` |
| `output_min_range` | 5 | horizontal_coverage | `sensor_plot/radar/hcd-ew_radar.txt:53` |
| `output_object_name` | 3 | tool | `base_types/weapons/aam/ata4_generator.txt:97` |
| `output_rate` | 8 | output_rate | `engage/flight_path.txt:141` |
| `output_wsf` | 2 | processor | `l16_j11/jtids.txt:30` |
| `outstr` | 10 | on_initialize | `aea_iads/report_writes.txt:41` |
| `overheat` | 2 | script | `base_types/platforms/brawler/alternatives/behavior_weapon_decision_gun.txt:74` |
| `overlay_file` | 5 | coverage | `coverage_demos/coverage_grids/conus_zone_coverage.txt:56` |
| `p6dof_1_fuel` | 1 | execute | `p6dof/external_fuel_tank_test2.txt:70` |
| `p6dof_1_range` | 1 | execute | `p6dof/external_fuel_tank_test2.txt:87` |
| `p6dof_1_time` | 1 | execute | `p6dof/external_fuel_tank_test2.txt:88` |
| `p6dof_2_fuel` | 1 | execute | `p6dof/external_fuel_tank_test2.txt:74` |
| `p6dof_2_range` | 1 | execute | `p6dof/external_fuel_tank_test2.txt:97` |
| `p6dof_2_time` | 1 | execute | `p6dof/external_fuel_tank_test2.txt:98` |
| `p6dof_alt` | 4 | platform, platform_type | `p6dof/flight_envelope.txt:119` |
| `p6dof_atmosphere` | 1 | p6dof_object_types | `p6dof/p6dof_types/environment/p6dof_environment.txt:37` |
| `p6dof_gravity` | 1 | p6dof_object_types | `p6dof/p6dof_types/environment/p6dof_environment.txt:40` |
| `p6dof_integrators` | 2 | p6dof_integrators, p6dof_object_types | `p6dof/p6dof_types/environment/integrators_config.txt:18` |
| `p6dof_ned_heading` | 5 | platform, platform_type | `p6dof/aam_launch_test.txt:89` |
| `p6dof_ned_pitch` | 3 | platform, platform_type | `p6dof/flight_envelope.txt:115` |
| `p6dof_ned_roll` | 3 | platform, platform_type | `p6dof/flight_envelope.txt:116` |
| `p6dof_object_type` | 170 | mover, p6dof_object_type, p6dof_object_types… | `p6dof/aam_launch_test.txt:74` |
| `p6dof_object_types` | 50 | p6dof_object_types | `p6dof/p6dof_types/aircraft/a-lgt/a-lgt-bombs.txt:17` |
| `p6dof_position` | 6 | platform, platform_type | `p6dof/aam_launch_test.txt:90` |
| `p6dof_set_velocity_ned_fps` | 6 | platform, platform_type | `p6dof/aam_launch_test.txt:91` |
| `p6dof_terrain` | 2 | p6dof_object_types, p6dof_terrain | `p6dof/p6dof_types/environment/p6dof_environment.txt:39` |
| `p6dof_wind` | 1 | p6dof_object_types | `p6dof/p6dof_types/environment/p6dof_environment.txt:38` |
| `p_pump` | 1 | on_initialize | `air_to_air/processors/assessment_scripts.txt:517` |
| `p_snip` | 1 | on_initialize | `air_to_air/processors/assessment_scripts.txt:515` |
| `parallel` | 44 | advanced_behavior_tree, behavior, behavior_tree… | `base_types/processors/quantum_agents/aiai/behavior_pursue_base.txt:213` |
| `parcel_type` | 12 | ejector, weapon | `chaff/chaff_example.txt:51` |
| `parent_rel_pitch` | 211 | p6dof_object_type, p6dof_object_types, point_mass_vehicle_type… | `p6dof/p6dof_types/aircraft/a-lgt/a-lgt-bombs.txt:24` |
| `parent_rel_roll` | 37 | p6dof_object_type, p6dof_object_types, point_mass_vehicle_type… | `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt-zll.txt:38` |
| `parent_rel_x` | 220 | p6dof_object_type, p6dof_object_types, point_mass_vehicle_type… | `p6dof/p6dof_types/aircraft/a-lgt/a-lgt-bombs.txt:21` |
| `parent_rel_y` | 211 | p6dof_object_type, p6dof_object_types, point_mass_vehicle_type… | `p6dof/p6dof_types/aircraft/a-lgt/a-lgt-bombs.txt:22` |
| `parent_rel_yaw` | 37 | p6dof_object_type, p6dof_object_types, point_mass_vehicle_type… | `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt-zll.txt:36` |
| `parent_rel_z` | 211 | p6dof_object_type, p6dof_object_types, point_mass_vehicle_type… | `p6dof/p6dof_types/aircraft/a-lgt/a-lgt-bombs.txt:23` |
| `parking_brake_on` | 4 | platform | `p6dof/airport_operations.txt:965` |
| `pass_1_loft_angle_start` | 2 | tool | `base_types/weapons/ssm/red_srbm_3_lcg.txt:29` |
| `pass_2_loft_angle_step` | 3 | tool | `base_types/weapons/ssm/red_icbm_2_lcg.txt:34` |
| `path` | 2 | flight_path_analysis, path | `sensor_plot/radar/fpa-path.txt:30` |
| `pattern_name` | 24 | antenna_plot | `sensor_plot/antenna/circular_2d.txt:16` |
| `pause_time` | 78 | platform, route | `orwaca_iads/scenarios/tbm_route_and_launch.txt:46` |
| `pause_time_off_road` | 12 | network, road_traffic | `traffic_demos/scenarios/china_traffic.txt:22` |
| `payload_mass` | 2 | platform_type | `exchange_proc/receiver_definition.txt:13` |
| `pbinrg` | 8 | script | `base_types/platforms/brawler/alternatives/behavior_weapon_decision_gun.txt:88` |
| `pd_filter_bandwidth` | 6 | sensor, signal_processor | `base_types/sensors/radar/mtd_radar.txt:67` |
| `pd_filter_slr` | 4 | sensor, signal_processor | `base_types/sensors/radar/mtd_radar.txt:69` |
| `pd_map_file` | 16 | horizontal_map, spherical_map, vertical_map | `sensor_plot/radar/hm-bistatic-ft-jamming-lab.txt:164` |
| `pd_num_filter_poles` | 4 | sensor, signal_processor | `base_types/sensors/radar/mtd_radar.txt:66` |
| `pd_num_filters` | 4 | sensor, signal_processor | `base_types/sensors/radar/mtd_radar.txt:65` |
| `peak_gain` | 427 | antenna_pattern, circular_pattern, constant_pattern… | `aea_iads/sensors/radar/acq_radar.txt:16` |
| `perceive_self` | 7 | platform, platform_type, processor | `air_to_air/platforms/brawler_test.txt:227` |
| `perceived_item_calculation_update_interval` | 6 | platform, platform_type, processor | `air_to_air/platforms/brawler_test.txt:200` |
| `perceived_item_data_update_interval` | 6 | platform, platform_type, processor | `air_to_air/platforms/brawler_test.txt:198` |
| `percent_of_beamwidth_for_detection` | 8 | effect, electronic_attack, electronic_warfare… | `aea_iads/weapons/jammer/soj_base_jammer.txt:37` |
| `perception` | 102 | advanced_behavior, behavior, on_init | `air_to_air/rules/ftr_rules.txt:155` |
| `perfect_correlation` | 3 | mode_template, platform_type, sensor | `hel/intersect_mesh_test_beam_director.txt:300` |
| `periapsis_altitude` | 1 | platform | `satellite_demos/aerobraking_demo.txt:38` |
| `persistence` | 4 | false_target | `aea_iads/weapons/jammer/false_target.txt:41` |
| `phase` | 731 | output, phase, platform… | `air_to_air/weapons/aam/medium_range_radar_missile.txt:164` |
| `phase_quantization_bits` | 5 | antenna_pattern | `aea_iads/weapons/jammer/soj_xband_jammer.txt:20` |
| `pid_alpha` | 132 | autopilot_config, pid_alpha, pid_group | `p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:45` |
| `pid_altitude` | 174 | autopilot_config, pid_altitude, pid_group | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:23` |
| `pid_bank_angle` | 174 | autopilot_config, pid_bank_angle, pid_group | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:31` |
| `pid_beta` | 132 | autopilot_config, pid_beta, pid_group | `p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:67` |
| `pid_delta_pitch` | 165 | autopilot_config, pid_delta_pitch, pid_group | `p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:75` |
| `pid_delta_roll` | 165 | autopilot_config, pid_delta_roll, pid_group | `p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:82` |
| `pid_flightpath_angle` | 174 | autopilot_config, pid_flightpath_angle, pid_group | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:38` |
| `pid_forward_accel` | 174 | autopilot_config, pid_forward_accel, pid_group | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:46` |
| `pid_group` | 116 | autopilot_config, pid_group | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:21` |
| `pid_pitch_angle` | 174 | autopilot_config, pid_group, pid_pitch_angle | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:53` |
| `pid_pitch_gload` | 3 | autopilot_config, pid_group, pid_pitch_gload | `p6dof/p6dof_types/weapons/simple-icbm/autopilot_config.txt:40` |
| `pid_pitch_rate` | 171 | autopilot_config, pid_group, pid_pitch_rate | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:60` |
| `pid_roll_heading` | 174 | autopilot_config, pid_group, pid_roll_heading | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:64` |
| `pid_roll_rate` | 135 | autopilot_config, pid_group, pid_roll_rate | `p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:125` |
| `pid_speed` | 174 | autopilot_config, pid_group, pid_speed | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:72` |
| `pid_taxi_forward_accel` | 156 | autopilot_config, pid_group, pid_taxi_forward_accel | `p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:139` |
| `pid_taxi_heading` | 156 | autopilot_config, pid_group, pid_taxi_heading | `p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:146` |
| `pid_taxi_speed` | 156 | autopilot_config, pid_group, pid_taxi_speed | `p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:153` |
| `pid_taxi_yaw_rate` | 156 | autopilot_config, pid_group, pid_taxi_yaw_rate | `p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:160` |
| `pid_vert_speed` | 174 | autopilot_config, pid_group, pid_vert_speed | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:81` |
| `pid_yaw_gload` | 3 | autopilot_config, pid_group, pid_yaw_gload | `p6dof/p6dof_types/weapons/simple-icbm/autopilot_config.txt:115` |
| `pid_yaw_heading` | 168 | autopilot_config, pid_group, pid_yaw_heading | `p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:175` |
| `pid_yaw_rate` | 168 | autopilot_config, pid_group, pid_yaw_rate | `p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:182` |
| `pilot_manager` | 45 | pilot_manager | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/control_inputs_pm6.txt:10` |
| `pinrng` | 8 | script | `base_types/platforms/brawler/alternatives/behavior_weapon_decision_gun.txt:87` |
| `pitch` | 223 | advanced_behavior, behavior, comm… | `air_to_air/rules/brawler_script_util.txt:377` |
| `pitch_control_augmentation_factor_g` | 80 | manual_pilot_augmented_controls, pilot_manager | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/control_inputs_pm6.txt:65` |
| `pitch_control_mapping_table` | 54 | manual_pilot_augmented_controls, manual_pilot_augmented_stability, pilot_manager… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/control_inputs_pm6.txt:33` |
| `pitch_gload_max` | 9 | autopilot_config, limits_and_settings, pid_group | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:87` |
| `pitch_gload_min` | 9 | autopilot_config, limits_and_settings, pid_group | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:86` |
| `pitch_rate` | 48 | phase, platform_type, processor… | `hellfire/laser_designation_via_dis/hellfire_type.txt:184` |
| `pitch_rate_max` | 174 | autopilot_config, limits_and_settings, pid_group | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:94` |
| `pitch_rate_min` | 174 | autopilot_config, limits_and_settings, pid_group | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:93` |
| `pitch_rates` | 14 | tool | `space_operations/launch_vehicles/atlas_v_401/tune.txt:31` |
| `pitch_stability_augmentation` | 6 | manual_pilot_augmented_stability, pilot_manager | `p6dof/p6dof_types/aircraft/b-hvy/controls/control_inputs.txt:124` |
| `pitch_trim_factor` | 87 | manual_pilot_augmented_controls, manual_pilot_augmented_stability, pilot_manager | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/control_inputs_pm6.txt:64` |
| `pitch_up` | 12 | advanced_behavior, execute | `air_to_air/rules/sam_shoot_it.txt:106` |
| `pixel_count` | 2 | sensor | `multiresolution_demos/sensors/generic_eoir.txt:28` |
| `pk` | 3 | processor, scoring_factors | `iads_c2_demos/delegate_battle_manager.txt:112` |
| `plat` | 16 | script | `base_types/processors/quantum_agents/common/common_platform_script.txt:235` |
| `platform` | 7637 | assets, conditional_section, coverage… | `acoustic/acoustic_demo.txt:118` |
| `platform_availability` | 16 | platform_availability | `aea_iads/strike.txt:24` |
| `platform_sensor` | 13 | platform, platform_type, processor… | `sensor_demos/esm_tdoa_demo.txt:203` |
| `platform_to_detect_name` | 6 | horizontal_map | `sensor_plot/esm/hm-jammer-detect-1.txt:89` |
| `platform_type` | 1233 | assets, conditional_section, coverage… | `acoustic/acoustic_demo.txt:34` |
| `plot_capacity` | 52 | false_target_screener, mode_template, sensor | `aea_iads/sensors/radar/ew_radar.txt:100` |
| `plt_file` | 1 | radar_signature | `base_types/signatures/plt/example_radar_sig.txt:17` |
| `point` | 503 | platform, script, zone | `base_types/processors/ripr_agents/aifl/aifl_processor.old.txt:600` |
| `point_mass_engine_type` | 34 | point_mass_engine_type, six_dof_object_types | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/prop/LTE_FIGHTER_Eng.txt:12` |
| `point_mass_vehicle_type` | 54 | point_mass_vehicle_type, six_dof_object_types | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/LTE_FIGHTER.txt:14` |
| `pointing` | 1 | script | `air_to_air/prdata/rules_utils.txt:385` |
| `pol_mod_jamming` | 5 | electronic_protect, mitigated_techniques, receiver… | `electronic_warfare/pol_mod_jamming.txt:133` |
| `polarization` | 94 | beam, comm, mode_template… | `aea_iads/sensors/radar/ew_radar.txt:111` |
| `polygonal` | 22 | platform, zone | `coverage_demos/zones/state_zones.txt:12` |
| `populated` | 1 | script | `air_to_air/prdata/rules_utils.txt:794` |
| `port` | 42 | connections, dis_interface, lane… | `aea_iads/dis_realtime.txt:16` |
| `port_route` | 12 | port, port_route, sea_traffic | `traffic_demos/scenarios/west_coast_sea_traffic.txt:18` |
| `position` | 40475 | common, conditional_section, distribution_centroid… | `acoustic/acoustic_demo.txt:119` |
| `position_hold_capture_radius` | 3 | mover | `hellfire/active_radar_hellfire/helo_mover.txt:124` |
| `positioning` | 152 | behavior, execute, script | `base_types/processors/quantum_agents/aiai/behavior_guide_weapons.txt:162` |
| `post_lockon_detection_threshold_adjustment` | 6 | mode, sensor | `air_to_air/sensors/radar/aesa.txt:109` |
| `power` | 736 | beam, comm, fluence_model… | `aea_iads/sensors/radar/acq_radar.txt:51` |
| `ppm_order` | 2 | comm, transmitter | `space_operations/comms/lasercomm_link.txt:38` |
| `pr_altitude` | 29 | advanced_behavior, execute, on_initialize | `air_to_air/processors/assessment_scripts.txt:522` |
| `pr_gees` | 24 | advanced_behavior, execute | `air_to_air/rules/crank.txt:129` |
| `pr_heading` | 43 | advanced_behavior, execute, on_initialize | `air_to_air/processors/assessment_scripts.txt:524` |
| `pr_speed` | 37 | advanced_behavior, execute, on_initialize | `air_to_air/processors/assessment_scripts.txt:521` |
| `pre_ignition_coast_time` | 52 | mover, platform_type, stage | `ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:104` |
| `pre_separation_coast_time` | 87 | mover, platform_type, stage | `alv_routing/platforms/alv.txt:53` |
| `precise_mode` | 3 | correlation_method, platform_type, track_manager | `swarm/platforms/uhf_ew_radar_sensor_platform.txt:29` |
| `precondition` | 610 | advanced_behavior, behavior, behavior_tree… | `air_to_air/rules/crank.txt:51` |
| `prediction_model` | 3 | platform, platform_type, processor | `space_operations/conjunction_avoidance.txt:152` |
| `pressure_altitude_table` | 1 | pressure_altitude_table | `p6dof/p6dof_types/environment/atm_config.txt:307` |
| `prf` | 6 | pulse_repetition_frequencies, sensor, transmitter | `base_types/sensors/radar/mtd_radar.txt:38` |
| `prf_factor` | 4 | mode_template, sensor | `air_to_air/sensors/radar/aesa.txt:77` |
| `primary` | 8 | platform, platform_type, primary… | `space_operations/conjunction_avoidance.txt:154` |
| `print_failed_message_delivery_attempts` | 1 | event_output | `suppressor/bomb_demo.txt:61` |
| `print_failed_sensor_detection_attempts` | 1 | event_output | `suppressor/bomb_demo.txt:60` |
| `print_route` | 4 | mover, platform_type | `engage/flight_path.txt:129` |
| `print_settings` | 2 | print_settings, processor | `iads_c2_demos/processors/battle_manager.txt:24` |
| `print_track_in_message` | 29 | event_output | `aea_iads/event_output.txt:15` |
| `prioritized_item_calculation_update_interval` | 6 | platform, platform_type, processor | `air_to_air/platforms/brawler_test.txt:201` |
| `prioritized_item_data_update_interval` | 6 | platform, platform_type, processor | `air_to_air/platforms/brawler_test.txt:199` |
| `priority` | 2 | script | `base_types/processors/ripr_agents/aijam/aijam_processor.txt:181` |
| `priority_selector` | 18 | advanced_behavior_tree, behavior_tree, parallel… | `base_types/platforms/brawler/brawler_platform.txt:170` |
| `probabilities` | 123 | beam, effect, electronic_protect… | `electronic_warfare/agile_auto-repeater_jamming.txt:201` |
| `probability_of_attack_attribution` | 1 | cyber_attack | `cyber/cyber/cyber_attacks/crash.txt:22` |
| `probability_of_attack_detection` | 9 | attack_response, cyber_attack, cyber_protect | `cyber/cyber/cyber_attacks/crash.txt:21` |
| `probability_of_attack_success` | 12 | attack_response, cyber_attack, cyber_protect | `cyber/avengers_detonate_effect.txt:50` |
| `probability_of_cover` | 3 | effect, electronic_warfare, technique | `electronic_warfare/cover_pulse_jamming.txt:41` |
| `probability_of_damage_given_proximity_hit` | 6 | table, weapon_effects | `hellfire/active_radar_hellfire/hellfire_type.txt:225` |
| `probability_of_false_alarm` | 104 | beam, mode_template, sensor | `aea_iads/sensors/radar/acq_radar.txt:67` |
| `probability_of_fk_given_damage` | 6 | table, weapon_effects | `hellfire/active_radar_hellfire/hellfire_type.txt:227` |
| `probability_of_future_immunity` | 9 | attack_response, cyber_attack, cyber_protect | `cyber/cyber/cyber_attacks/crash.txt:23` |
| `probability_of_kk_given_damage` | 6 | table, weapon_effects | `hellfire/active_radar_hellfire/hellfire_type.txt:228` |
| `probability_of_mk_given_damage` | 6 | table, weapon_effects | `hellfire/active_radar_hellfire/hellfire_type.txt:226` |
| `probability_of_scan_attribution` | 1 | cyber_attack | `cyber/cyber/cyber_attacks/crash.txt:18` |
| `probability_of_scan_detection` | 9 | attack_response, cyber_attack, cyber_protect | `cyber/cyber/cyber_attacks/crash.txt:17` |
| `probability_of_status_report` | 9 | attack_response, cyber_attack, cyber_protect | `cyber/cyber/cyber_attacks/crash.txt:20` |
| `process_noise_model` | 15 | filter, platform_type, sensor | `air_to_air/platforms/brawler_test.txt:54` |
| `processor` | 2562 | behavior, comm, model… | `aea_iads/platforms/ew_radar.txt:28` |
| `program` | 151 | phase, platform_type, processor… | `hellfire/laser_designation_via_dis/hellfire_type.txt:182` |
| `project_tracks_by_delays` | 1 | processor | `iads_c2_demos/processors/battle_manager.txt:18` |
| `prompt` | 6 | script | `wargame/scripts/general_scripts.txt:46` |
| `propagation_model` | 80 | comm, platform, transmitter | `satellite_demos/avionics/comm/BEIDOUCommDef.txt:36` |
| `propagation_speed` | 16 | comm, platform, platform_type | `air_to_air/platforms/brawler_test.txt:81` |
| `propellant_mass` | 26 | p6dof_object_types, solid_propellant_rocket_type | `p6dof/p6dof_types/misc/srb-rato/prop/solid_propellant_rockets/aim-sr-1-rkt/aim-sr-1-rkt.txt:101` |
| `proportional_gain` | 24 | lateral_acceleration_rate_pid, lateral_acceleration_value_pid, mover… | `hellfire/active_radar_hellfire/helo_mover.txt:96` |
| `proportional_navigation_gain` | 390 | mover, phase, platform… | `air_to_air/weapons/aam/medium_range_radar_missile.txt:171` |
| `proportional_navigation_method` | 13 | phase, platform_type, processor | `ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:159` |
| `propulsion_data` | 166 | p6dof_object_type, p6dof_object_types, point_mass_vehicle_type… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/LTE_FIGHTER.txt:24` |
| `protocol` | 2 | protocol | `space_operations/platforms/interceptor.txt:13` |
| `protocol_version` | 5 | dis_interface | `exchange_proc/dis_interface.txt:16` |
| `proximity_all_on_loss_of_target` | 18 | platform_type, processor | `alv_routing/platforms/alv.txt:127` |
| `proximity_cancel_on_loss_of_target` | 4 | processor | `draw/weapons/agm/bomb_1000_lb.txt:21` |
| `proximity_limit` | 19 | platform_type, processor, transactor | `exchange_proc/receiver_definition.txt:40` |
| `psubs` | 1 | script | `air_to_air/rules/brawler_script_util.txt:416` |
| `pswtch` | 2 | script | `base_types/platforms/brawler/alternatives/behavior_weapon_decision_missile.txt:83` |
| `pulse_compression_ratio` | 15 | mode_template, sensor, transmitter | `base_types/sensors/radar/generic_sar.txt:66` |
| `pulse_density` | 615 | beam, effect, electronic_protect… | `electronic_warfare/agile_auto-repeater_jamming.txt:202` |
| `pulse_density_to_jamming_gain` | 198 | effect, electronic_attack, electronic_warfare… | `aea_iads/weapons/jammer/soj_base_jammer.txt:50` |
| `pulse_jamming` | 24 | electronic_warfare, mitigated_technique_classes, technique | `aea_iads/sensors/radar/ew_radar.txt:58` |
| `pulse_repetition_frequencies` | 3 | pulse_repetition_frequencies, sensor, transmitter | `base_types/sensors/radar/mtd_radar.txt:37` |
| `pulse_repetition_frequency` | 80 | mode_template, platform, sensor… | `air_to_air/sensors/radar/aesa.txt:53` |
| `pulse_repetition_interval` | 257 | beam, comm, mode_template… | `aea_iads/sensors/radar/acq_radar.txt:55` |
| `pulse_width` | 325 | beam, comm, mode_template… | `aea_iads/sensors/radar/acq_radar.txt:54` |
| `pulsed_jamming_perception_threshold` | 3 | beam, sensor | `aea_iads/sensors/radar/ew_radar.txt:134` |
| `pump_per` | 1 | on_initialize | `air_to_air/processors/assessment_scripts.txt:518` |
| `purge_interval` | 313 | platform, platform_type, processor | `aea_iads/platforms/iads_cmdr.txt:15` |
| `pursuit_range` | 1 | processor | `iads_c2_demos/processors/weapons_manager_ai.txt:20` |
| `quality` | 1 | script | `base_types/processors/ripr_agents/aiss/aiss_processor.txt:167` |
| `quant` | 8 | script | `base_types/processors/quantum_agents/common/common_platform_script.txt:634` |
| `quantity` | 604 | ejector, false_target, platform… | `aea_iads/platforms/iads_cmdr.txt:52` |
| `quantum_efficiency` | 2 | comm, receiver | `space_operations/comms/lasercomm_link.txt:52` |
| `query_bid` | 2 | query_bid | `base_types/processors/ripr_agents/aiai/aiai_processor.old.txt:1538` |
| `query_bid_type` | 25 | behavior, processor, query_bid_type | `base_types/processors/quantum_agents/aiai/behavior_radar-control_new.txt:43` |
| `raan` | 1310 | common, execute, mover… | `coverage_demos/scenarios/sat_con_1_autogen.txt:31` |
| `radar_signature` | 5126 | model, multiresolution_radar_signature, platform… | `aea_iads/platforms/iads_cmdr.txt:134` |
| `radial_acceleration` | 168 | mover, navigation, platform… | `aea_iads/platforms/soj.txt:460` |
| `radius` | 50 | behavior, distribution, false_target… | `aea_iads/weapons/jammer/false_target.txt:32` |
| `radius_and_pk` | 159 | weapon_effects | `air_to_air/weapons/aam/medium_range_radar_missile.txt:32` |
| `random_pulse_jamming` | 13 | electronic_protect, electronic_warfare, mitigated_techniques… | `aea_iads/sensors/radar/acq_radar.txt:27` |
| `random_seed` | 1 | conditional_section | `air_to_air/escort.txt:64` |
| `range` | 20 | on_update, script, spherical_map | `base_types/platforms/brawler/alternatives/behavior_weapon_decision_missile.txt:125` |
| `range_constrained` | 10 | effect, electronic_attack, false_target… | `electronic_warfare/false-target_command_center.txt:75` |
| `range_delta` | 30 | acquire_deltas, close_target_detection, mode… | `chaff/chaff_example_ttr.txt:213` |
| `range_distribution` | 2 | distribution, false_target | `aea_iads/weapons/jammer/false_target.txt:30` |
| `range_error` | 21 | effect, electronic_attack, electronic_protect… | `aea_iads/weapons/jammer/soj_base_jammer.txt:70` |
| `range_error_sigma` | 54 | mode_template, platform, platform_type… | `air_to_air/platforms/dca.txt:81` |
| `range_force` | 21 | false_target_screener, force_target_tracks, sensor | `aea_iads/sensors/radar/ew_radar.txt:104` |
| `range_holdout_time` | 3 | effect, electronic_warfare, technique | `electronic_warfare/track_effect_1.txt:46` |
| `range_measurement_sigma` | 30 | filter, platform_type, sensor | `alternate_locations/platforms/common.txt:39` |
| `range_product` | 21 | mode, mode_template, platform_type… | `base_types/sensors/radar/blue_a2a_radar.txt:144` |
| `range_rate_bin_count_min_and_max_limits` | 6 | intercept_results, launch_computer | `base_types/weapons/aam/blue_sr_a2a_ir_missile_ata_launch_computer_alt10kft_0.6mach.txt:36` |
| `range_rate_error_sigma` | 16 | mode_template, platform_type, sensor | `air_to_air/platforms/dca.txt:82` |
| `range_recycle` | 3 | effect, electronic_warfare, technique | `electronic_warfare/track_effect_1.txt:47` |
| `range_sector_force` | 3 | false_target_screener, force_target_tracks, sensor | `electronic_warfare/simple_ft_jamming.txt:102` |
| `range_tolerance` | 1 | tool | `base_types/weapons/aam/ata_blue_lr_a2a_rf_missile_lc_generator.txt:64` |
| `range_units` | 6 | horizontal_coverage, vertical_coverage | `sensor_plot/radar/hcd-ew_radar.txt:47` |
| `range_values` | 18 | fires_table, launch_computer | `fires/types/fires_120mm_artillery.txt:18` |
| `range_walkoff_rate` | 3 | effect, electronic_warfare, technique | `electronic_warfare/track_effect_1.txt:45` |
| `ranges` | 4 | altitudes, clutter_table | `sensor_plot/clutter/clutter_table_generation.txt:112` |
| `ranging_time` | 7 | mode, sensor | `base_types/sensors/esm_rwr/generic_esm.txt:108` |
| `rate` | 12 | commodity, fuel, platform… | `base_types/platforms/blue_adv_fighter_1_base.txt:41` |
| `rated_thrust` | 69 | p6dof_object_types, point_mass_engine_type, rigid_body_engine_type… | `p6dof/p6dof_types/misc/srb-rato/prop/solid_propellant_rockets/aim-sr-1-rkt/aim-sr-1-rkt.txt:97` |
| `rated_thrust_ab` | 22 | jet, jet_engine_type, p6dof_object_types… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/prop/LTE_FIGHTER_Eng.txt:22` |
| `rated_thrust_idle` | 56 | jet, jet_engine_type, p6dof_object_types… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/prop/LTE_FIGHTER_Eng.txt:20` |
| `rated_thrust_mil` | 56 | jet, jet_engine_type, p6dof_object_types… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/prop/LTE_FIGHTER_Eng.txt:21` |
| `rates` | 11 | fuel, fuel_table, platform_type… | `example_scripts/fuel_table_demo.txt:41` |
| `ratio` | 8 | script | `parachute/AvailableGs.txt:61` |
| `raw_data_file` | 6 | coverage | `coverage_demos/coverage_grids/conus_zone_coverage.txt:36` |
| `raw_dted` | 7 | terrain | `coverage_demos/terrain/uav_coverage_terrain.txt:13` |
| `raw_track_reporting` | 71 | platform_type, processor | `aea_iads/platforms/red_radar_company.txt:43` |
| `reacquire_deltas` | 15 | close_target_detection, mode, reacquire_deltas… | `chaff/chaff_example_ttr.txt:216` |
| `react` | 1 | on_initialize | `air_to_air/processors/assessment_scripts.txt:511` |
| `reallocation_strategy` | 18 | platform_type, processor | `base_types/platforms/brawler/brawler_flight_lead.txt:63` |
| `reason` | 147 | advanced_behavior, execute, on_initialize… | `aea_iads/platforms/soj.txt:267` |
| `receive_line_loss` | 6 | receiver, sensor | `base_types/sensors/radar/mtd_radar.txt:51` |
| `receive_only` | 11 | sensor | `sensor_demos/bistatic_demo.txt:38` |
| `receiver` | 630 | beam, comm, mode… | `aea_iads/sensors/esm_rwr/ucav_esm.txt:25` |
| `receiver_bandwidth` | 2 | error_model_parameters, sensor | `sensor_demos/passive_detector_df_demo.txt:71` |
| `receiver_noise_power_gain` | 3 | effect, electronic_warfare, technique | `aea_iads/sensors/radar/ew_radar.txt:50` |
| `record_file_base_name` | 2 | run | `engage/flight_path.txt:150` |
| `recovery_factor` | 2 | state, target_model | `sosm/test_mission/simple_plot/simple_target.txt:16` |
| `rectangular_pattern` | 88 | antenna_pattern, rectangular_pattern | `aea_iads/sensors/radar/acq_radar.txt:15` |
| `red_aircraft` | 3 | script | `air_to_air/observer.txt:99` |
| `red_sam` | 2 | script | `air_to_air/observer.txt:104` |
| `red_total_ac` | 1 | script | `air_to_air/observer.txt:402` |
| `red_total_sam` | 1 | script | `air_to_air/observer.txt:407` |
| `ref_area_sqft` | 59 | aero_data, aero_mode | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/aero/aero_pm6.txt:12` |
| `ref_heading` | 3 | on_update, platform_type, processor | `script_demos/script_demo_3.txt:81` |
| `reference_area` | 167 | aero | `air_to_air/weapons/aam/medium_range_radar_missile.txt:103` |
| `reference_centroid` | 2 | false_target, reference_centroid | `electronic_warfare/false-target_command_center.txt:59` |
| `reference_platform` | 10 | platform, zone | `electronic_warfare/comm_jamming.txt:193` |
| `reference_time_error` | 4 | error_model, sensor | `sensor_demos/esm_tdoa_demo.txt:121` |
| `reflectance` | 2 | optical_signature, surface | `space_operations/moon_as_satellite.txt:36` |
| `reflection_height` | 2 | ionospheric_characteristics, sensor | `oth_radar/sensors/radar/oth_radar.txt:37` |
| `refuel_waypoint_label` | 3 | platform_type, processor, script_variables | `outer_air_battle/platforms/timed_ac.txt:27` |
| `region` | 16 | p6dof_terrain, region, terrain… | `air_to_air/six_dof_types/environment/terrain_config.txt:12` |
| `regular_table` | 2041 | regular_table | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/aero/data/cd_alpha_beta_mach_table.txt:10` |
| `reject` | 8 | effect, electronic_protect, electronic_warfare… | `aea_iads/sensors/radar/acq_radar.txt:30` |
| `rel_bearing` | 3 | script | `air_to_air/prdata/rules_utils.txt:913` |
| `rel_pitch` | 374 | engine, p6dof_object_type, p6dof_object_types… | `p6dof/p6dof_types/aircraft/a-lgt/a-lgt.txt:44` |
| `rel_pos_x` | 374 | engine, p6dof_object_type, p6dof_object_types… | `p6dof/p6dof_types/aircraft/a-lgt/a-lgt.txt:40` |
| `rel_pos_y` | 374 | engine, p6dof_object_type, p6dof_object_types… | `p6dof/p6dof_types/aircraft/a-lgt/a-lgt.txt:41` |
| `rel_pos_z` | 374 | engine, p6dof_object_type, p6dof_object_types… | `p6dof/p6dof_types/aircraft/a-lgt/a-lgt.txt:42` |
| `rel_roll` | 18 | engine, p6dof_object_type, propulsion_data | `p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:39` |
| `rel_yaw` | 374 | engine, p6dof_object_type, p6dof_object_types… | `p6dof/p6dof_types/aircraft/a-lgt/a-lgt.txt:43` |
| `reload_increment` | 2 | weapon | `ship_ad/weapons/sam/red_sr_naval_sam_1.txt:95` |
| `reload_inventory` | 2 | weapon | `ship_ad/weapons/sam/red_sr_naval_sam_1.txt:96` |
| `reload_threshold` | 2 | weapon | `ship_ad/weapons/sam/red_sr_naval_sam_1.txt:94` |
| `reload_time` | 2 | weapon | `ship_ad/weapons/sam/red_sr_naval_sam_1.txt:97` |
| `remote_comm` | 2 | script, script_struct | `space_operations/scripts/comm_link.txt:47` |
| `remote_comm_name` | 2 | script, script_struct | `space_operations/scripts/comm_link.txt:53` |
| `remote_platform_index` | 2 | script, script_struct | `space_operations/scripts/comm_link.txt:52` |
| `remote_platform_name` | 4 | script, script_struct | `space_operations/scripts/comm_link.txt:51` |
| `remove` | 2 | platform, route | `orwaca_iads/scenarios/tbm_route_and_launch.txt:57` |
| `repeater` | 20 | repeater, weapon | `electronic_warfare/agile_auto-repeater_jamming.txt:76` |
| `repeater_effect_control_method` | 17 | effect, electronic_attack, system_type_data… | `electronic_warfare/repeater_jamming.txt:102` |
| `repeater_factor_limits` | 12 | effect, electronic_attack, system_type_data… | `electronic_warfare/repeater_jamming.txt:105` |
| `report_fused_tracks` | 9 | platform, platform_type, processor | `air_to_air/platforms/brawler_test.txt:124` |
| `report_interval` | 120 | platform, platform_type, processor | `aea_iads/platforms/red_radar_company.txt:40` |
| `report_method` | 2 | platform_type, processor | `electronic_warfare/simple_auto_jamming.txt:372` |
| `report_to` | 268 | platform, platform_type, processor | `aea_iads/platforms/red_radar_company.txt:38` |
| `report_to_group` | 2 | platform | `comm/group_comm_example.txt:112` |
| `report_truth` | 12 | reported_emitter_type, reported_target_type, sensor | `electronic_warfare/esm_detect_multi_beam_radar.txt:62` |
| `report_type` | 10 | reported_target_type, sensor | `electronic_warfare/esm_detect_multi_sensor_radar.txt:64` |
| `reported_emitter_type` | 6 | reported_emitter_type, sensor | `electronic_warfare/esm_detect_multi_beam_radar.txt:59` |
| `reported_target_type` | 2 | reported_target_type, sensor | `electronic_warfare/esm_detect_multi_sensor_radar.txt:60` |
| `reporting_others` | 20 | platform, platform_type, processor | `air_to_air/platforms/brawler_test.txt:229` |
| `reporting_self` | 34 | platform, platform_type, processor | `air_to_air/platforms/brawler_test.txt:228` |
| `reports_bearing` | 224 | jam_strobe_detector, mode_template, platform_type… | `acoustic/acoustic_demo.txt:62` |
| `reports_elevation` | 137 | jam_strobe_detector, mode_template, platform_type… | `acoustic/acoustic_demo.txt:63` |
| `reports_frequency` | 54 | mode_template, platform_type, sensor | `aea_iads/sensors/esm_rwr/ucav_esm.txt:36` |
| `reports_iff` | 157 | mode_template, platform, platform_type… | `aea_iads/sensors/radar/acq_radar.txt:82` |
| `reports_location` | 305 | mode_template, platform, platform_type… | `aea_iads/sensors/esm_rwr/ucav_esm.txt:34` |
| `reports_other` | 2 | sensor | `multiresolution_demos/sensors/generic_eoir.txt:33` |
| `reports_pri` | 13 | sensor | `aea_iads/sensors/esm_rwr/ucav_esm.txt:38` |
| `reports_pw` | 13 | sensor | `aea_iads/sensors/esm_rwr/ucav_esm.txt:37` |
| `reports_range` | 211 | common, mode_template, multiresolution_sensor… | `aea_iads/sensors/radar/acq_radar.txt:79` |
| `reports_range_rate` | 26 | mode_template, platform_type, sensor | `air_to_air/platforms/lte_fighter.txt:92` |
| `reports_self` | 9 | platform_type, processor | `air_to_air/platforms/brawler_test.txt:146` |
| `reports_side` | 20 | mode_template, sensor | `air_to_air/sensors/esm_rwr/esm.txt:74` |
| `reports_signal_to_noise` | 58 | mode_template, platform, platform_type… | `acoustic/acoustic_demo.txt:64` |
| `reports_type` | 59 | mode_template, platform_type, sensor | `aea_iads/sensors/esm_rwr/ucav_esm.txt:35` |
| `reports_velocity` | 220 | mode_template, platform, platform_type… | `aea_iads/sensors/radar/ttr_radar.txt:73` |
| `request_based_tracking` | 6 | false_target_screener, mode_template, sensor | `electronic_warfare/closely_space_targets_ttr.txt:62` |
| `require_loft_angle` | 14 | weapon | `ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:216` |
| `required_j_to_s` | 6 | effect, electronic_warfare, technique | `electronic_warfare/track_drop_maintain_effect.txt:42` |
| `required_pd` | 108 | horizontal_coverage, mode_template, sensor… | `aea_iads/sensors/radar/acq_radar.txt:68` |
| `reserve_quantity` | 3 | fuel, platform_type | `example_scripts/fuel_table_demo.txt:24` |
| `resolution` | 14 | mode, mode_template, sensor | `base_types/sensors/radar/generic_sar.txt:86` |
| `resources` | 2 | cyber_constraint, platform_type | `cyber/GoneFishing_ConstraintDemo.txt:164` |
| `resources_required` | 2 | cyber_attack | `cyber/GoneFishing_ConstraintDemo.txt:145` |
| `response_curve` | 8 | response_curve, sensor_model | `sosm/sensors/gaussian_lwir.txt:23` |
| `response_limits` | 6 | sensor_model | `sosm/sensors/gaussian_lwir.txt:20` |
| `restorable` | 2 | mover, platform_type | `hellfire/laser_designation_via_dis/target_type.txt:32` |
| `restore` | 6 | attack_response, cyber_protect | `cyber/cyber/cyber_protections/altitude_protect.txt:24` |
| `result` | 102 | behavior, precondition, script | `base_types/processors/quantum_agents/aiai/behavior_go_home.txt:105` |
| `result_processing_type` | 1 | platform_type | `sensor_demos/coherent_sensor_demo.txt:109` |
| `retain_raw_tracks` | 4 | platform_type, track_manager | `base_types/platforms/brawler/brawler_flight_lead.txt:21` |
| `retain_track_history` | 8 | platform_type, processor, track_manager | `base_types/platforms/brawler/brawler_flight_lead.txt:22` |
| `return` | 6810 | advanced_behavior, behavior, behavior_tree… | `aea_iads/detection_writes.txt:38` |
| `returns` | 1 | script | `air_to_air/prdata/rules_utils.txt:1114` |
| `retval` | 17 | script, script_struct | `p6dof/scripts/tanking_scripts.txt:95` |
| `revisit_time` | 8 | mode, mode_template, platform_type… | `base_types/sensors/radar/generic_bomber_radar.txt:133` |
| `revs_per_day` | 3947 | mover, platform, platform_type | `coverage_demos/scenarios/sat_con_1_autogen.txt:30` |
| `rhst` | 2 | script | `air_to_air/prdata/rules_utils.txt:584` |
| `rigid_body_engine_type` | 28 | rigid_body_engine_type, six_dof_object_types | `six_dof/six_dof_types/aircraft/b-fw/prop/jet_engines/b-h4-40w-1-tf/b-h4-40w-1-tf.txt:23` |
| `rigid_body_vehicle_type` | 44 | rigid_body_vehicle_type, six_dof_object_types | `six_dof/six_dof_types/aircraft/b-fw/b-fw.txt:21` |
| `rmax_fraction` | 1 | script | `air_to_air/processors/assessment_scripts.txt:401` |
| `rmax_limit` | 1 | tool | `base_types/weapons/aam/ata_blue_lr_a2a_rf_missile_lc_generator.txt:67` |
| `rng` | 3 | script | `air_to_air/prdata/rules_utils.txt:581` |
| `rng_sam` | 1 | script | `air_to_air/prdata/rules_utils.txt:652` |
| `road_traffic` | 6 | road_traffic | `traffic_demos/scenarios/china_traffic.txt:15` |
| `rolds` | 1 | script | `air_to_air/rules/brawler_script_util.txt:430` |
| `roll` | 9 | execute, flight_path_analysis, mover… | `satellite_demos/shuttle-tspi-demo.txt:24` |
| `roll_control_augmentation_factor_dps` | 80 | manual_pilot_augmented_controls, pilot_manager | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/control_inputs_pm6.txt:68` |
| `roll_control_mapping_table` | 54 | manual_pilot_augmented_controls, manual_pilot_augmented_stability, pilot_manager… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/control_inputs_pm6.txt:47` |
| `roll_rate_limit` | 58 | mover, platform_type | `base_types/platforms/blue_adv_fighter_1_base.txt:20` |
| `roll_rate_max` | 174 | autopilot_config, limits_and_settings, pid_group | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:99` |
| `roll_stability_augmentation` | 6 | manual_pilot_augmented_stability, pilot_manager | `p6dof/p6dof_types/aircraft/b-hvy/controls/control_inputs.txt:126` |
| `roll_stabilizing_frequency_mach_table` | 10 | aero_data, roll_stabilizing_frequency_mach_table | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/aero/aero_pm6.txt:38` |
| `roll_trim_factor` | 87 | manual_pilot_augmented_controls, manual_pilot_augmented_stability, pilot_manager | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/control_inputs_pm6.txt:67` |
| `rolling_coefficient_of_friction` | 24 | ground_reaction_point, landing_gear, p6dof_object_type… | `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:99` |
| `root_node_type` | 16 | advanced_behavior_tree, platform_type, processor | `behavior_tree/platforms/subtrees_striker.txt:61` |
| `rot` | 6 | script | `air_to_air/rules/brawler_script_util.txt:127` |
| `route` | 2966 | common, conditional_section, mover… | `acoustic/acoustic_demo.txt:149` |
| `route_allowable_angle_error` | 171 | autopilot_config, limits_and_settings, pid_group | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:104` |
| `route_network` | 1 | route_network | `traffic_demos/roads/osm_roadnetwork.txt:13` |
| `router` | 5 | platform_type, router | `comm/comms/ad_hoc_comm.txt:132` |
| `router_name` | 4 | comm, platform_type | `cyber/exfiltrate_demo/platforms/iads_cmdr.txt:139` |
| `router_protocol` | 1 | router_protocol | `comm/comms/ad_hoc_comm.txt:63` |
| `routing_table` | 2 | processor, routing_table | `iads_c2_demos/processors/disseminate_c2.txt:17` |
| `row` | 36 | advanced_behavior, behavior, execute | `base_types/processors/quantum_agents/aiai/behavior_debug_job_board.txt:102` |
| `rsfail` | 40 | script | `base_types/platforms/brawler/alternatives/behavior_weapon_decision_gun.txt:76` |
| `rte_ind` | 8 | advanced_behavior, execute, on_init… | `air_to_air/rules/route_rules.txt:97` |
| `rudder_right` | 34 | flight_controls, rudder_right | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/flight_controls_pm6.txt:24` |
| `rule_type` | 3 | on_initialize, platform, script_variables | `air_to_air/processors/assessment_scripts.txt:526` |
| `run` | 8 | run | `engage/flight_path.txt:149` |
| `runway` | 8 | air_traffic, airbase | `traffic_demos/scenarios/china_airports.txt:45` |
| `runway_heading` | 106 | air_traffic, airbase | `traffic_demos/scenarios/china_airports.txt:53` |
| `runway_length` | 106 | air_traffic, airbase | `traffic_demos/scenarios/china_airports.txt:52` |
| `s1` | 3 | script | `p6dof/flight_envelope.txt:257` |
| `s2` | 3 | script | `p6dof/flight_envelope.txt:263` |
| `s3` | 3 | script | `p6dof/flight_envelope.txt:269` |
| `sal_fired` | 2 | on_update, platform | `hellfire/semiactive_laser_hellfire/ldt_combined_test.txt:54` |
| `salram_file` | 1 | radar_signature | `base_types/signatures/salram_radar_signature.txt:12` |
| `salvo_interval` | 90 | platform_type, weapon | `air_to_air/weapons/aam/medium_range_radar_missile.txt:256` |
| `sample_interval` | 3 | flight_path_analysis | `sensor_plot/radar/fpa-path.txt:29` |
| `samples_per_detection` | 6 | effect, electronic_attack, system_type_data… | `electronic_warfare/test_false_targets/weapons/jammer/soj_xband_jammer.txt:89` |
| `sar_constraint_plotting` | 14 | platform_type, sensor | `sensor_plot/sar/ag_bomber.txt:28` |
| `satur` | 2 | script | `base_types/platforms/brawler/alternatives/behavior_weapon_decision_missile.txt:337` |
| `saturation_effect` | 115 | beam, effect, electronic_protect… | `aea_iads/sensors/radar/ew_radar.txt:63` |
| `saturation_ratio` | 32 | cancelation_ratios, cancellation_ratios, effect… | `aea_iads/sensors/radar/ew_radar.txt:48` |
| `scalar` | 2 | noise_cloud | `noise_cloud/noise_cloud.txt:41` |
| `scalar_gain` | 508 | scalar_gain | `p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:40` |
| `scan_delay_time` | 3 | cyber_attack | `cyber/cyber/cyber_attacks/crash.txt:31` |
| `scan_detection_draw_frequency` | 3 | cyber_attack | `cyber/cyber/cyber_attacks/crash.txt:28` |
| `scan_mode` | 250 | beam, mode, mode_template… | `acoustic/acoustic_demo.txt:52` |
| `scan_period` | 2 | platform, scheduler | `sensor_demos/spin_scheduler.txt:92` |
| `scan_rate_multiplier` | 128 | effect, electronic_attack, electronic_warfare… | `electronic_warfare/agile_auto-repeater_jamming.txt:101` |
| `scan_stabilization` | 7 | mode_template, sensor | `hellfire/active_radar_hellfire/hellfire_type.txt:37` |
| `scan_time` | 3 | false_target | `aea_iads/weapons/jammer/false_target.txt:21` |
| `scattering` | 29 | atmospheric_coefficients, scattering | `hel/atmosphere/AAA_README.txt:93` |
| `scheduler` | 2 | platform, scheduler | `sensor_demos/spin_scheduler.txt:91` |
| `score` | 4 | precondition | `base_types/platforms/brawler/alternatives/behavior_alt3441_tail_attack.txt:272` |
| `scoring_factors` | 3 | processor, scoring_factors | `iads_c2_demos/delegate_battle_manager.txt:111` |
| `script` | 3470 | advanced_behavior, behavior, conditional_section… | `acoustic/acoustic_demo2.txt:324` |
| `script_debug_writes` | 248 | advanced_behavior, behavior, platform_type… | `air_to_air/processors/uplink.txt:12` |
| `script_interface` | 27 | script_interface | `base_types/platforms/red_multirole_fighter_2_ripr.txt:18` |
| `script_struct` | 19 | script_struct | `base_types/processors/quantum_agents/common/weapon_defs.txt:11` |
| `script_variables` | 1547 | advanced_behavior, behavior, conditional_section… | `aea_iads/detection_writes.txt:9` |
| `scuffing_coefficient_of_friction` | 24 | ground_reaction_point, landing_gear, p6dof_object_type… | `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:101` |
| `sea_level_specific_impulse` | 5 | mover, platform_type, stage | `base_types/weapons/sam/blue_lr_sam_common.txt:251` |
| `sea_level_thrust` | 23 | mover, platform_type, stage | `space_operations/launch_vehicles/atlas_v_401/atlas_v_401_base.txt:69` |
| `sea_state` | 1 | global_environment | `sensor_demos/clutter_demo.txt:19` |
| `sea_traffic` | 1 | sea_traffic | `traffic_demos/scenarios/west_coast_sea_traffic.txt:12` |
| `search_interval` | 3 | platform, platform_type, processor | `space_operations/conjunction_avoidance.txt:146` |
| `search_step_size` | 3 | platform, platform_type, processor | `space_operations/conjunction_avoidance.txt:148` |
| `search_while_track` | 6 | mode, sensor | `base_types/sensors/radar/generic_bomber_radar.txt:131` |
| `sector_arc` | 6 | distribution, false_target | `aea_iads/weapons/jammer/false_target.txt:33` |
| `sedit_file` | 1 | horizontal_map | `sensor_plot/radar/sedit-ucav-dry.txt:34` |
| `selection_mode` | 37 | common, multiresolution_sensor, platform_type… | `aea_iads/sensors/radar/ttr_radar.txt:35` |
| `selector` | 123 | advanced_behavior_tree, behavior, behavior_tree… | `air_to_air/platforms/brawler_test.txt:249` |
| `selector_with_memory` | 4 | advanced_behavior_tree, platform_type, processor… | `behavior_tree/platforms/selector_with_memory_striker.txt:45` |
| `semi_major_axis` | 18 | common, mover, multiresolution_mover… | `multiresolution_demos/space_mover_demo.txt:60` |
| `send_interval` | 4 | message_processor, processor | `l16_j11/jtids.txt:34` |
| `send_track_drop_on_turn_off` | 2 | sensor | `iads_c2_demos/sensors/acq_radar.txt:42` |
| `senow` | 3 | script | `air_to_air/rules/brawler_script_util.txt:273` |
| `sensor` | 1190 | model, multiresolution_sensor, platform… | `acoustic/acoustic_demo.txt:45` |
| `sensor1bearing` | 3 | on_update, platform_type, processor | `bearing_only/platforms/fuser_platform1.txt:82` |
| `sensor1elevation` | 3 | on_update, platform_type, processor | `bearing_only/platforms/fuser_platform1.txt:92` |
| `sensor2bearing` | 3 | on_update, platform_type, processor | `bearing_only/platforms/fuser_platform1.txt:96` |
| `sensor_altitude` | 2 | sosm_interface, test | `sosm/test_mission/query_atmosphere/test_qa.txt:21` |
| `sensor_model` | 6 | sensor_model | `sosm/sensors/gaussian_lwir.txt:15` |
| `sensor_modifier` | 3 | noise_cloud, zone | `noise_cloud/noise_cloud.txt:39` |
| `sensor_platform_altitude` | 2 | clutter_table | `sensor_plot/clutter/clutter_table_generation.txt:120` |
| `sensor_platform_latitude` | 2 | clutter_table | `sensor_plot/clutter/clutter_table_generation.txt:118` |
| `sensor_platform_longitude` | 2 | clutter_table | `sensor_plot/clutter/clutter_table_generation.txt:119` |
| `sensor_platform_pitch` | 2 | horizontal_map | `sensor_plot/sar/sc_bomber.txt:55` |
| `sensor_platform_roll` | 3 | horizontal_map, spherical_map | `sensor_plot/radar/sm-stab.txt:63` |
| `sensor_platform_yaw` | 2 | horizontal_map | `sensor_plot/sar/sc_bomber.txt:54` |
| `sensor_range` | 6 | heat_map, platform_type, processor | `heatmap/platforms/flight_lead.txt:60` |
| `sensor_timing_error` | 4 | error_model, sensor | `sensor_demos/esm_tdoa_demo.txt:123` |
| `sensor_to_target_elevation` | 2 | sosm_interface, test | `sosm/test_mission/query_atmosphere/test_qa.txt:22` |
| `sensor_to_target_range` | 2 | sosm_interface, test | `sosm/test_mission/query_atmosphere/test_qa.txt:23` |
| `sensors` | 8 | platform, platform_type, processor… | `sensor_demos/coherent_sensor_demo.txt:115` |
| `separate_angle` | 16 | next_state, state | `base_types/processors/quantum_agents/aiai/behavior_pincer_fsm.txt:272` |
| `separation_failure_probability` | 2 | platform_type, stage | `space_operations/platforms/delta_iv_m_staging_failure.txt:23` |
| `separation_omega_x` | 211 | p6dof_object_type, p6dof_object_types, point_mass_vehicle_type… | `p6dof/p6dof_types/aircraft/a-lgt/a-lgt-bombs.txt:26` |
| `separation_omega_y` | 211 | p6dof_object_type, p6dof_object_types, point_mass_vehicle_type… | `p6dof/p6dof_types/aircraft/a-lgt/a-lgt-bombs.txt:27` |
| `separation_omega_z` | 211 | p6dof_object_type, p6dof_object_types, point_mass_vehicle_type… | `p6dof/p6dof_types/aircraft/a-lgt/a-lgt-bombs.txt:28` |
| `separation_vx` | 46 | p6dof_object_type, p6dof_object_types, point_mass_vehicle_type… | `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt-zll.txt:40` |
| `separation_vy` | 37 | p6dof_object_type, p6dof_object_types, point_mass_vehicle_type… | `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt-zll.txt:41` |
| `separation_vz` | 211 | p6dof_object_type, p6dof_object_types, point_mass_vehicle_type… | `p6dof/p6dof_types/aircraft/a-lgt/a-lgt-bombs.txt:25` |
| `sequence` | 77 | advanced_behavior_tree, behavior_tree, parallel… | `air_to_air/platforms/brawler_test.txt:272` |
| `sequence_with_memory` | 8 | advanced_behavior_tree, platform_type, processor… | `behavior_tree/platforms/blackboard_striker.txt:49` |
| `sequencer` | 604 | p6dof_object_type, p6dof_object_types, point_mass_vehicle_type… | `p6dof/p6dof_types/aircraft/a-lgt/a-lgt-bombs.txt:101` |
| `service` | 4 | platform_type, service | `logistics/platforms/mechanic.txt:25` |
| `service_and_capability_pairing` | 1 | processor | `logistics/processors/exchange_processor.txt:13` |
| `service_interval` | 4 | platform_type, service | `logistics/platforms/mechanic.txt:27` |
| `setup_bm_logging` | 1 | script_variables | `iads_c2_demos/setup/setup.txt:18` |
| `sflypp` | 4 | behavior, execute | `base_types/platforms/brawler/alternatives/behavior_pilot_posture.txt:242` |
| `sgn` | 4 | behavior, execute | `base_types/platforms/brawler/alternatives/behavior_pilot_posture.txt:84` |
| `ship` | 15 | departure_traffic, local_traffic, sea_traffic… | `traffic_demos/scenarios/west_coast_sea_traffic.txt:127` |
| `shooter` | 8 | execute, script | `air_to_air/observer.txt:158` |
| `shooter_altitudes` | 16 | independent_variables, launch_computer_table, tool | `air_to_air/weapons/aam/mrm_launch_computer_table.1.1.txt:24` |
| `shooter_index` | 6 | script | `air_to_air/observer.txt:159` |
| `shooter_machs` | 16 | independent_variables, launch_computer_table, tool | `air_to_air/weapons/aam/mrm_launch_computer_table.1.1.txt:25` |
| `shot` | 4 | processor, script | `alternate_locations/processors/ucav_weapon_release.txt:35` |
| `shot_doctrine` | 1 | processor | `iads_c2_demos/processors/battle_manager.txt:21` |
| `show_calibration_data` | 10 | sensor | `base_types/sensors/radar/blue_a2a_radar.txt:127` |
| `show_commands` | 4 | platform_type | `space_operations/launch_vehicles/delta_iv_m/test.txt:21` |
| `show_diagnostics` | 7 | platform_type | `space_operations/launch_vehicles/atlas_v_401/test.txt:20` |
| `show_graphics` | 7 | launch_computer, platform_type, processor | `ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:141` |
| `show_iripp_data` | 2 | sosm_interface | `sosm/sensor_plot/test.txt:21` |
| `show_state_transitions` | 26 | platform, platform_type, processor | `ballistic_missile_shootdown/platforms/blue_naval_sam_battery.txt:46` |
| `show_status` | 42 | mover, platform_type, processor… | `base_types/weapons/ssm/red_icbm_1.txt:250` |
| `show_status_changes` | 2 | navigation_errors, platform_type | `sensor_demos/nav_demo.txt:65` |
| `show_task_messages` | 13 | platform, processor | `electronic_warfare/semi-auto_repeater_jamming_1.txt:112` |
| `side` | 2447 | conditional_section, platform, platform_type… | `acoustic/acoustic_demo.txt:120` |
| `sidelobe_level_x` | 5 | antenna_pattern | `aea_iads/weapons/jammer/soj_xband_jammer.txt:27` |
| `sidelobe_level_y` | 5 | antenna_pattern | `aea_iads/weapons/jammer/soj_xband_jammer.txt:28` |
| `sigma_cruise_speed` | 15 | air_traffic, aircraft_type | `traffic_demos/scenarios/china_airports.txt:19` |
| `sigma_loiter_time` | 6 | local_traffic, sea_traffic, ship | `traffic_demos/scenarios/west_coast_sea_traffic.txt:151` |
| `sigma_speed` | 78 | departure_traffic, local_traffic, network… | `traffic_demos/scenarios/china_traffic.txt:39` |
| `sigma_travel_time` | 12 | network, road_traffic | `traffic_demos/scenarios/china_traffic.txt:24` |
| `sign` | 2 | execute, platform | `sensor_demos/scanning_eoir.txt:60` |
| `signal_following` | 6 | repeater, weapon | `electronic_warfare/agile_repeater_jamming.txt:82` |
| `signal_power_gain` | 14 | effect, electronic_protect, electronic_warfare… | `electronic_warfare/comm_jamming.txt:69` |
| `signal_processor` | 19 | mode_template, sensor, signal_processor | `air_to_air/sensors/radar/aesa.txt:83` |
| `signal_to_noise` | 54 | detection_probability, mode_template, sensor | `air_to_air/sensors/radar/aesa.txt:66` |
| `signal_type` | 4 | detection_sensitivities, sensor | `sensor_plot/radar/hm-pass-detect.txt:53` |
| `simple_detonations` | 4 | dis_interface | `aea_iads/dis_realtime.txt:22` |
| `simple_false_targets` | 6 | beam, electronic_protect, mitigated_techniques… | `electronic_warfare/simple_ft_jamming.txt:146` |
| `simple_kill_range` | 4 | dis_interface | `aea_iads/dis_realtime.txt:23` |
| `simple_path` | 2 | run, simple_path | `engage/simple_flight_path.txt:147` |
| `simple_table` | 180 | gain_table, simple_table | `p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:140` |
| `simple_yaw_damper` | 1 | pilot_manager | `p6dof/p6dof_types/misc/srb-rato/controls/control_inputs.txt:74` |
| `sine_pattern` | 78 | antenna_pattern, sine_pattern | `aea_iads/sensors/radar/ttr_radar.txt:15` |
| `site` | 19 | dis_interface | `aea_iads/dis_realtime.txt:12` |
| `six_dof_alt` | 11 | platform | `air_to_air/scenarios/2v2_six_dof.txt:31` |
| `six_dof_environment` | 3 | six_dof_environment | `air_to_air/six_dof_types/environment/six_dof_environment.txt:39` |
| `six_dof_formation` | 5 | six_dof_formation | `six_dof/pm6_formation_tanking.txt:74` |
| `six_dof_ned_heading` | 11 | platform, platform_type | `air_to_air/scenarios/2v2_six_dof.txt:32` |
| `six_dof_ned_pitch` | 5 | platform | `six_dof/pm6_orbit_launch.txt:40` |
| `six_dof_ned_roll` | 5 | platform | `six_dof/pm6_orbit_launch.txt:41` |
| `six_dof_object_types` | 56 | six_dof_object_types | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/LTE_FIGHTER.txt:12` |
| `six_dof_position` | 13 | platform, platform_type | `air_to_air/scenarios/2v2_six_dof.txt:30` |
| `six_dof_set_velocity_ned_fps` | 10 | platform, platform_type | `air_to_air/scenarios/2v2_six_dof.txt:29` |
| `six_dof_unit` | 14 | six_dof_formation, six_dof_unit | `six_dof/pm6_formation_tanking.txt:79` |
| `sixdof_1_fuel` | 2 | execute | `six_dof/pm6_external_fuel_tank_test2.txt:70` |
| `sixdof_1_range` | 2 | execute | `six_dof/pm6_external_fuel_tank_test2.txt:87` |
| `sixdof_1_time` | 2 | execute | `six_dof/pm6_external_fuel_tank_test2.txt:88` |
| `sixdof_2_fuel` | 2 | execute | `six_dof/pm6_external_fuel_tank_test2.txt:74` |
| `sixdof_2_range` | 2 | execute | `six_dof/pm6_external_fuel_tank_test2.txt:97` |
| `sixdof_2_time` | 2 | execute | `six_dof/pm6_external_fuel_tank_test2.txt:98` |
| `size` | 9 | grid, optical_signature, surface | `coverage_demos/coverage_grids/uav_stepped_grid_coverage.txt:15` |
| `size_factor_max` | 1 | p6dof_object_type | `p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:585` |
| `size_factor_min` | 1 | p6dof_object_type | `p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:584` |
| `size_factor_radius` | 1 | p6dof_object_type | `p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:586` |
| `size_factor_volume_rate_m3_per_sec` | 1 | p6dof_object_type | `p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:588` |
| `skr_lock` | 4 | script | `base_types/platforms/brawler/alternatives/behavior_weapon_decision_missile.txt:339` |
| `slew_mode` | 187 | comm, common, multiresolution_sensor… | `aea_iads/sensors/esm_rwr/ucav_esm.txt:21` |
| `slot_group` | 2 | comm, slot_group | `l16_j11/jtids.txt:13` |
| `slots_per_frame` | 2 | comm, slot_group | `l16_j11/jtids.txt:14` |
| `small_range_step` | 6 | horizontal_coverage, vertical_coverage | `sensor_plot/radar/hcd-ew_radar.txt:43` |
| `solar_characteristics` | 2 | sensor, solar_characteristics | `oth_radar/sensors/radar/oth_radar.txt:28` |
| `solid_propellant_rocket` | 43 | point_mass_engine_type, rigid_body_engine_type, six_dof_object_types… | `six_dof/six_dof_types/misc/srb-rato/prop/solid_propellant_rockets/rato-rkt/rato-rkt.txt:27` |
| `solid_propellant_rocket_type` | 26 | p6dof_object_types, solid_propellant_rocket_type | `p6dof/p6dof_types/misc/srb-rato/prop/solid_propellant_rockets/aim-sr-1-rkt/aim-sr-1-rkt.txt:23` |
| `solo` | 6 | advanced_behavior, execute, on_new_fail | `air_to_air/rules/merge.txt:66` |
| `sonic_speed_altitude_table` | 1 | sonic_speed_altitude_table | `p6dof/p6dof_types/environment/atm_config.txt:883` |
| `sosm_interface` | 12 | sosm_interface | `sosm/sensor_plot/common_types.txt:13` |
| `source_tank` | 62 | fuel_transfer, p6dof_object_type, p6dof_object_types… | `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt.txt:138` |
| `spacing` | 8 | convoy, grid, network… | `coverage_demos/coverage_grids/conus_zone_coverage.txt:16` |
| `spatial_domain` | 114 | platform, platform_type | `air_to_air/scenarios/escort.txt:343` |
| `spd0` | 77 | behavior, precondition, script | `air_to_air/prdata/rules_utils.txt:1365` |
| `spddes` | 2 | script | `air_to_air/rules/brawler_script_util.txt:222` |
| `spdmod` | 8 | precondition, script | `base_types/platforms/brawler/alternatives/behavior_alt3441_tail_attack.txt:156` |
| `spduse` | 6 | script | `air_to_air/rules/brawler_script_util.txt:284` |
| `specific_impulse` | 131 | maneuvering, mover, platform… | `air_to_air/weapons/aam/medium_range_radar_missile.txt:154` |
| `spectral_print_format` | 2 | sosm_interface | `sosm/test_mission/query_atmosphere/test_qa.txt:18` |
| `spectrum_data` | 14 | acoustic_signature, spectrum_data | `acoustic/acoustic_demo.txt:13` |
| `speed` | 868 | angle_of_attack_table, convoy, distribution_centroid… | `acoustic/acoustic_demo.txt:151` |
| `speed_attributes` | 3 | processor, speed_attributes, weapon_table | `iads_c2_demos/processors/battle_manager.txt:31` |
| `speed_ktas` | 6 | script | `p6dof/airport_operations.txt:391` |
| `speed_middle_loop_rate_factor` | 58 | autopilot_config | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:16` |
| `speed_mps` | 6 | script | `p6dof/airport_operations.txt:392` |
| `speed_outer_loop_rate_factor` | 58 | autopilot_config | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:17` |
| `speedbrake_dcd_mach_table` | 8 | aero_data, speedbrake_dcd_mach_table | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/aero/aero_pm6.txt:50` |
| `speedbrake_threshold` | 174 | autopilot_config, limits_and_settings, pid_group | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:90` |
| `speedbrakes` | 6 | flight_controls, speedbrakes | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/flight_controls_pm6.txt:30` |
| `speeds` | 12 | false_target, false_target_movement, fuel… | `aea_iads/weapons/jammer/false_target.txt:37` |
| `spherical_map` | 3 | spherical_map | `sensor_plot/radar/sm-nostab.txt:50` |
| `spiked` | 2 | script | `air_to_air/prdata/rules_utils.txt:245` |
| `spin_down_table_ab_per_sec` | 30 | jet, jet_engine_type, p6dof_object_types… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/prop/LTE_FIGHTER_Eng.txt:39` |
| `spin_down_table_mil_per_sec` | 77 | jet, jet_engine_type, p6dof_object_types… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/prop/LTE_FIGHTER_Eng.txt:29` |
| `spin_up_table_ab_per_sec` | 30 | jet, jet_engine_type, p6dof_object_types… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/prop/LTE_FIGHTER_Eng.txt:34` |
| `spin_up_table_mil_per_sec` | 77 | jet, jet_engine_type, p6dof_object_types… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/prop/LTE_FIGHTER_Eng.txt:24` |
| `spoilers` | 2 | flight_controls, spoilers | `six_dof/six_dof_types/aircraft/fa-lgt/controls/flight_controls_pm6.txt:46` |
| `spot_power_distribution` | 11 | weapon | `aea_iads/weapons/jammer/soj_sband_jammer.txt:31` |
| `spring_constant_lbs_per_ft` | 24 | ground_reaction_point, landing_gear, p6dof_object_type… | `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:95` |
| `stage` | 425 | maneuvering, mover, platform… | `alv_routing/platforms/alv.txt:51` |
| `staging_failure` | 1 | script | `space_operations/scenarios/launch.txt:55` |
| `stale_asset_time` | 1 | processor | `iads_c2_demos/processors/battle_manager.txt:20` |
| `stale_out_interval` | 6 | laser_designations | `hellfire/active_radar_hellfire/rf_autonomous_test.txt:27` |
| `start_angle` | 36 | platform, zone | `outer_air_battle/scenarios/cvbg.txt:23` |
| `start_epoch` | 5 | coverage | `coverage_demos/coverage_grids/conus_zone_coverage.txt:31` |
| `start_mode` | 9 | mover, platform_type | `hellfire/active_radar_hellfire/apache_type.txt:20` |
| `start_position` | 3 | convoy, network, road_traffic | `traffic_demos/scenarios/korea_traffic.txt:98` |
| `start_range_for_decreasing` | 2 | tool | `base_types/weapons/aam/ata4_generator.txt:105` |
| `start_range_for_increasing` | 2 | tool | `base_types/weapons/aam/ata4_generator.txt:104` |
| `start_time` | 2 | platform | `sensor_plot/radar/fpa-route.txt:22` |
| `starting_beam_azimuth` | 2 | platform, scheduler | `sensor_demos/spin_scheduler.txt:93` |
| `state` | 673 | acoustic_signature, infrared_signature, inherent_contrast… | `acoustic/acoustic_demo.txt:12` |
| `static` | 113 | execute, next_state, on_update… | `base_types/processors/quantum_agents/common/common_platform_script.txt:135` |
| `status` | 98 | next_state, platform_type, processor… | `engage/flight_path.txt:82` |
| `status_report_draw_frequency` | 3 | cyber_attack | `cyber/cyber/cyber_attacks/crash.txt:26` |
| `status_settings` | 5 | platform_type, processor, status_settings | `iads_c2_demos/platforms/sam_battalion.txt:56` |
| `std_flaps_down` | 56 | control_inputs, pilot_manager | `p6dof/p6dof_types/aircraft/a-lgt/controls/control_inputs.txt:58` |
| `std_landing_gear_down` | 56 | control_inputs, pilot_manager | `p6dof/p6dof_types/aircraft/a-lgt/controls/control_inputs.txt:59` |
| `std_nose_wheel_steering` | 56 | control_inputs, pilot_manager | `p6dof/p6dof_types/aircraft/a-lgt/controls/control_inputs.txt:60` |
| `std_nws_enabled` | 56 | control_inputs, pilot_manager | `p6dof/p6dof_types/aircraft/a-lgt/controls/control_inputs.txt:62` |
| `std_nws_steering` | 56 | control_inputs, pilot_manager | `p6dof/p6dof_types/aircraft/a-lgt/controls/control_inputs.txt:61` |
| `std_rudder_right` | 56 | control_inputs, pilot_manager | `p6dof/p6dof_types/aircraft/a-lgt/controls/control_inputs.txt:49` |
| `std_speed_brakes_out` | 56 | control_inputs, pilot_manager | `p6dof/p6dof_types/aircraft/a-lgt/controls/control_inputs.txt:56` |
| `std_spoilers_out` | 56 | control_inputs, pilot_manager | `p6dof/p6dof_types/aircraft/a-lgt/controls/control_inputs.txt:57` |
| `std_stick_back` | 56 | control_inputs, pilot_manager | `p6dof/p6dof_types/aircraft/a-lgt/controls/control_inputs.txt:47` |
| `std_stick_right` | 56 | control_inputs, pilot_manager | `p6dof/p6dof_types/aircraft/a-lgt/controls/control_inputs.txt:48` |
| `std_throttle_ab` | 56 | control_inputs, pilot_manager | `p6dof/p6dof_types/aircraft/a-lgt/controls/control_inputs.txt:51` |
| `std_throttle_mil` | 56 | control_inputs, pilot_manager | `p6dof/p6dof_types/aircraft/a-lgt/controls/control_inputs.txt:50` |
| `std_thrust_reverser` | 56 | control_inputs, pilot_manager | `p6dof/p6dof_types/aircraft/a-lgt/controls/control_inputs.txt:52` |
| `std_thrust_vectoring_pitch` | 56 | control_inputs, pilot_manager | `p6dof/p6dof_types/aircraft/a-lgt/controls/control_inputs.txt:54` |
| `std_thrust_vectoring_roll` | 56 | control_inputs, pilot_manager | `p6dof/p6dof_types/aircraft/a-lgt/controls/control_inputs.txt:55` |
| `std_thrust_vectoring_yaw` | 56 | control_inputs, pilot_manager | `p6dof/p6dof_types/aircraft/a-lgt/controls/control_inputs.txt:53` |
| `std_wheel_brake_left` | 56 | control_inputs, pilot_manager | `p6dof/p6dof_types/aircraft/a-lgt/controls/control_inputs.txt:63` |
| `std_wheel_brake_right` | 56 | control_inputs, pilot_manager | `p6dof/p6dof_types/aircraft/a-lgt/controls/control_inputs.txt:64` |
| `steered_array_pattern` | 4 | antenna_pattern | `sensor_plot/antenna/esa_circular_pattern.txt:14` |
| `steering_control_surface_name` | 8 | ground_reaction_point, landing_gear, p6dof_object_type… | `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:83` |
| `step` | 2 | script | `air_to_air/observer_utils.txt:57` |
| `step_distance` | 1 | grid | `coverage_demos/coverage_grids/uav_stepped_grid_coverage.txt:14` |
| `stick_back` | 34 | flight_controls, stick_back | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/flight_controls_pm6.txt:12` |
| `stick_right` | 34 | flight_controls, stick_right | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/flight_controls_pm6.txt:18` |
| `stick_zero_moment_delta_thrust_mach_alpha_table` | 28 | stick_zero_moment_delta_thrust_mach_alpha_table | `p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_support_tables.txt:300` |
| `stick_zero_moment_delta_xcg_mach_alpha_table` | 28 | stick_zero_moment_delta_xcg_mach_alpha_table | `p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_support_tables.txt:386` |
| `stick_zero_moment_delta_zcg_mach_alpha_table` | 28 | stick_zero_moment_delta_zcg_mach_alpha_table | `p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_support_tables.txt:472` |
| `stick_zero_moment_mach_alpha_table` | 30 | autopilot_support_tables, stick_zero_moment_mach_alpha_table | `p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_support_tables.txt:214` |
| `stop` | 26 | mover, platform, platform_type… | `exchange_proc/input_for_combined_tanker_to_receiver.txt:35` |
| `stop_angle` | 36 | platform, zone | `outer_air_battle/scenarios/cvbg.txt:24` |
| `stopped` | 3 | next_state, processor, state | `base_types/processors/rcs_display_mgr.txt:134` |
| `string` | 2221 | advanced_behavior, aux_data, behavior… | `aea_iads/detection_writes.txt:23` |
| `struct` | 71 | execute, on_initialize, platform… | `aea_iads/platforms/soj.txt:50` |
| `sub` | 9 | execute | `base_types/processors/quantum_agents/aiai/behavior_evade.txt:363` |
| `subgrid` | 4 | grid, subgrid | `coverage_demos/coverage_grids/state_zone_lat_lon_grid_coverage.txt:15` |
| `subobject` | 220 | p6dof_object_type, p6dof_object_types, point_mass_vehicle_type… | `p6dof/p6dof_types/aircraft/a-lgt/a-lgt-bombs.txt:20` |
| `subord_red_timeout` | 5 | platform_type, processor, status_settings | `iads_c2_demos/platforms/sam_battalion.txt:58` |
| `subord_yellow_timeout` | 5 | platform_type, processor, status_settings | `iads_c2_demos/platforms/sam_battalion.txt:57` |
| `subsonic_cd_slope` | 1 | aero | `space_operations/launch_vehicles/delta_iv_m/delta_iv_m_base.txt:24` |
| `subtype` | 12 | coverage, moe | `coverage_demos/coverage_grids/conus_zone_coverage.txt:45` |
| `success` | 55 | behavior, execute, on_initialize2… | `base_types/processors/quantum_agents/aiai/behavior_default-flight.txt:60` |
| `success_policy` | 15 | advanced_behavior_tree, parallel, platform_type… | `behavior_tree/platforms/parallel_striker.txt:58` |
| `summary_output` | 16 | output, run | `engage/flight_path.txt:190` |
| `supersonic_cd_slope` | 4 | aero | `ship_ad/weapons/sam/red_sr_naval_sam_1.txt:29` |
| `support` | 2 | script | `air_to_air/prdata/rules_utils.txt:51` |
| `suppress_comm_data` | 1 | dis_interface | `bearing_only/event_pipe.txt:12` |
| `surface` | 42 | optical_signature, surface | `multiresolution_demos/sensor_demo.txt:100` |
| `surface_target_file` | 10 | tool | `ballistic_missile_shootdown/weapons/ssm/red_mrbm_1_lcg.txt:27` |
| `surface_to_air_table` | 5 | launch_computer | `ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:188` |
| `surface_to_surface_table` | 11 | launch_computer | `ballistic_missile_shootdown/weapons/ssm/red_mrbm_1.txt:374` |
| `swapped` | 4 | script | `base_types/processors/timeline_agents/common_timeline_scripts.txt:153` |
| `swerling_case` | 106 | beam, mode_template, platform… | `aea_iads/sensors/radar/acq_radar.txt:69` |
| `switch_at_time_sec` | 14 | guidance_group, test_guidance | `p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:933` |
| `synthetic_pilot` | 88 | pilot_manager, synthetic_pilot | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/control_inputs_pm6.txt:12` |
| `system_type_data` | 126 | effect, electronic_attack, electronic_warfare… | `aea_iads/weapons/jammer/soj_base_jammer.txt:45` |
| `t_faz_switch` | 6 | advanced_behavior, execute | `air_to_air/rules/ftr_rules.txt:286` |
| `t_last_pickle` | 4 | advanced_behavior, execute | `air_to_air/rules/sam_shoot_it.txt:216` |
| `t_phase` | 5 | advanced_behavior, execute, script | `air_to_air/prdata/rules_utils.txt:462` |
| `table` | 6 | table, weapon_effects | `hellfire/active_radar_hellfire/hellfire_type.txt:224` |
| `table_data` | 60 | mapping_table, table_data | `p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:22` |
| `tail` | 2 | script, script_struct | `space_operations/scripts/schedule.txt:192` |
| `tap` | 4 | advanced_behavior, execute | `air_to_air/rules/select_wpn.txt:148` |
| `tar_targets` | 4 | engagement_settings, processor | `iads_c2_demos/processors/weapons_manager_ai.txt:24` |
| `target` | 64 | maneuver, mission_sequence, on_initialize2… | `air_to_air/observer.txt:147` |
| `target_altitude` | 31 | horizontal_map, sosm_interface, test | `noise_cloud/noise_cloud.txt:47` |
| `target_altitudes` | 16 | independent_variables, launch_computer_table, tool | `air_to_air/weapons/aam/mrm_launch_computer_table.1.1.txt:26` |
| `target_aspects` | 16 | independent_variables, launch_computer_table, tool | `air_to_air/weapons/aam/mrm_launch_computer_table.1.1.txt:28` |
| `target_association_staleout_interval` | 3 | platform_type, sensor | `hellfire/laser_designation_via_dis/designator_type.txt:27` |
| `target_blanking_effect` | 115 | beam, effect, electronic_protect… | `aea_iads/sensors/radar/ew_radar.txt:67` |
| `target_data` | 18 | ballistic_missile_launch_computer, target_data | `ballistic_missile_shootdown/weapons/ssm/red_mrbm_1.txt:382` |
| `target_grid` | 10 | run, target_grid | `engage/grid.txt:146` |
| `target_heading` | 33 | horizontal_coverage, horizontal_map, spherical_map… | `sensor_plot/comm/comm.txt:100` |
| `target_index` | 6 | script | `air_to_air/observer.txt:148` |
| `target_lead_angles` | 11 | independent_variables, launch_computer_table, tool | `base_types/weapons/aam/ata4_generator.txt:128` |
| `target_leads` | 5 | independent_variables, launch_computer_table | `air_to_air/weapons/aam/mrm_launch_computer_table.1.1.txt:29` |
| `target_mach` | 4 | horizontal_map, spherical_map, vertical_map | `sosm/sensor_plot/test.txt:68` |
| `target_machs` | 16 | independent_variables, launch_computer_table, tool | `air_to_air/weapons/aam/mrm_launch_computer_table.1.1.txt:27` |
| `target_model` | 3 | target_model | `sosm/targets/simple_target.txt:17` |
| `target_offsets` | 1 | tool | `base_types/weapons/agm/atg_mach_4_missile_lc_generator.txt:58` |
| `target_pitch` | 30 | horizontal_coverage, horizontal_map, vertical_coverage | `sensor_plot/comm/comm.txt:103` |
| `target_platform_type` | 1 | horizontal_map | `noise_cloud/noise_cloud.txt:46` |
| `target_pref` | 3 | processor, weapon_rows, weapon_table | `iads_c2_demos/processors/battle_manager.txt:46` |
| `target_region` | 50 | horizontal_map, target_region | `sensor_plot/comm/comm.txt:90` |
| `target_roll` | 30 | horizontal_coverage, horizontal_map, vertical_coverage | `sensor_plot/comm/comm.txt:104` |
| `target_speed` | 49 | horizontal_coverage, horizontal_map, mover… | `kinematic_mover/kinematic_mover_demo.txt:80` |
| `target_tank` | 62 | fuel_transfer, p6dof_object_type, p6dof_object_types… | `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt.txt:139` |
| `target_to_sensor_azimuth` | 4 | sosm_interface, test | `sosm/test_mission/query_detect/test_qd.txt:26` |
| `target_to_sensor_elevation` | 4 | sosm_interface, test | `sosm/test_mission/query_detect/test_qd.txt:27` |
| `target_to_sensor_range` | 2 | sosm_interface, test | `sosm/test_mission/query_detect/test_qd.txt:25` |
| `target_type` | 4 | target_type, weapon_effects | `hel/hel_test.txt:139` |
| `targets` | 4 | execute, platform, script | `base_types/processors/timeline_agents/common_timeline_scripts.txt:276` |
| `taxi_speed_max_fps` | 165 | autopilot_config, limits_and_settings, pid_group | `p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:205` |
| `taxi_yaw_rate_max` | 165 | autopilot_config, limits_and_settings, pid_group | `p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:206` |
| `technique` | 416 | beam, electronic_attack, electronic_protect… | `aea_iads/sensors/radar/acq_radar.txt:25` |
| `temp` | 3 | on_update, processor | `base_types/processors/ripr_agents/aijc/aijc_processor.txt:63` |
| `temp_score` | 8 | script | `air_to_air/processors/assessment_scripts.txt:399` |
| `temperature` | 40 | optical_signature, surface | `multiresolution_demos/sensor_demo.txt:102` |
| `temperature_altitude_table` | 1 | temperature_altitude_table | `p6dof/p6dof_types/environment/atm_config.txt:595` |
| `term` | 42 | dynamics, model, mover… | `cislunar/scenarios/orbiter.txt:42` |
| `term1` | 2 | script | `air_to_air/sensor_observer.txt:196` |
| `terminal` | 3 | next_state, processor, state | `ship_ad/weapons/agm/asm_tactics.txt:67` |
| `terminal_velocity` | 2 | chaff_parcel | `chaff/chaff_example.txt:26` |
| `terminate_thrust_by_cmd` | 2 | guidance_group, test_guidance | `p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:981` |
| `terrain` | 81 | six_dof_environment, terrain | `aea_iads/terrain.txt:11` |
| `terrain_float_distance` | 3 | platform_type, sensor | `hellfire/laser_designation_via_dis/designator_type.txt:26` |
| `test` | 10 | platform_type, processor, sosm_interface… | `sensor_demos/passive_detector_df_demo.txt:116` |
| `test_guidance` | 1 | test_guidance | `p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:925` |
| `tgleav` | 8 | script | `base_types/platforms/brawler/alternatives/behavior_weapon_decision_missile.txt:198` |
| `the` | 3 | script | `air_to_air/prdata/rules_utils.txt:80` |
| `then` | 1 | script | `air_to_air/prdata/rules_utils.txt:269` |
| `these` | 1 | platform_type | `air_to_air/platforms/brawler_test.txt:71` |
| `theta` | 10 | execute, script | `base_types/processors/quantum_agents/aiai/behavior_evade.txt:394` |
| `things` | 1 | script | `air_to_air/processors/assessment_scripts.txt:356` |
| `threat` | 9 | precondition | `base_types/processors/quantum_agents/aiai/behavior_evade.txt:202` |
| `threat_angle_spread` | 20 | platform_type, processor | `base_types/platforms/blue_adv_fighter_1_ripr.txt:101` |
| `threat_time_to_intercept` | 27 | platform_type, processor | `air_to_air/platforms/brawler_test.txt:163` |
| `threat_update_interval` | 20 | platform_type, processor | `air_to_air/platforms/brawler_test.txt:150` |
| `threat_velocity` | 23 | platform_type, processor | `base_types/platforms/blue_adv_fighter_1_ripr.txt:100` |
| `threatening` | 2 | script | `air_to_air/prdata/rules_utils.txt:878` |
| `threshold` | 2 | noise_cloud | `noise_cloud/noise_cloud.txt:42` |
| `threshold_damage` | 23 | weapon_effects | `alternate_locations/weapons/agm/blue_glide_bomb_1.txt:54` |
| `threshold_value` | 90 | control_boolean | `p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:549` |
| `throttle` | 22 | mover, platform_type, stage | `space_operations/launch_vehicles/atlas_v_401/atlas_v_401_base.txt:85` |
| `throttle_setting_ab` | 53 | jet_engine_type, p6dof_object_type, p6dof_object_types… | `p6dof/p6dof_types/aircraft/a-lgt/a-lgt.txt:76` |
| `throttle_setting_mil` | 116 | jet_engine_type, p6dof_object_type, p6dof_object_types… | `p6dof/p6dof_types/aircraft/a-lgt/a-lgt.txt:75` |
| `throttle_setting_pitch` | 12 | p6dof_object_type, p6dof_object_types, propulsion_data… | `p6dof/p6dof_types/aircraft/fa-hvy/fa-hvy.txt:81` |
| `throttle_setting_reverser` | 45 | p6dof_object_type, p6dof_object_types, propulsion_data… | `p6dof/p6dof_types/aircraft/a-lgt/a-lgt.txt:77` |
| `throttle_setting_yaw` | 6 | p6dof_object_type, p6dof_object_types, propulsion_data… | `p6dof/p6dof_types/weapons/aam-sr/aam-sr-tvc.txt:53` |
| `thrust` | 190 | maneuvering, mover, platform… | `air_to_air/weapons/aam/medium_range_radar_missile.txt:155` |
| `thrust_ab_alt_mach_table` | 30 | jet, jet_engine_type, p6dof_object_types… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/prop/LTE_FIGHTER_Eng.txt:52` |
| `thrust_delay` | 9 | mover, platform_type, stage | `base_types/weapons/ssm/blue_cruise_missile.txt:67` |
| `thrust_duration` | 234 | mover, platform_type, stage | `air_to_air/weapons/aam/medium_range_radar_missile.txt:156` |
| `thrust_idle_alt_mach_table` | 77 | jet, jet_engine_type, p6dof_object_types… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/prop/LTE_FIGHTER_Eng.txt:44` |
| `thrust_mil_alt_mach_table` | 77 | jet, jet_engine_type, p6dof_object_types… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/prop/LTE_FIGHTER_Eng.txt:48` |
| `thrust_offset` | 82 | jet_engine_type, p6dof_object_types, point_mass_engine_type… | `p6dof/p6dof_types/aircraft/a-lgt/prop/jet_engines/a-m4-22a-1-tf/a-m4-22a-1-tf.txt:27` |
| `thrust_vectoring_angle_limit` | 62 | mover, platform_type, stage | `engage/weapons/lrsam.txt:87` |
| `thrust_vectoring_time_limits` | 2 | mover, stage | `engage/weapons/lrsam.txt:86` |
| `thrust_vs_time_sealevel` | 88 | p6dof_object_types, point_mass_engine_type, rigid_body_engine_type… | `p6dof/p6dof_types/misc/srb-rato/prop/solid_propellant_rockets/aim-sr-1-rkt/aim-sr-1-rkt.txt:27` |
| `thrust_vs_time_vacuum` | 9 | p6dof_object_types, solid_propellant_rocket_type, thrust_vs_time_vacuum | `p6dof/p6dof_types/weapons/simple-icbm/Generic_ICBM_RocketEngines.txt:135` |
| `tick` | 6 | advanced_behavior, execute | `behavior_tree/processors/quantum_agents/aiai/parallel_turn_left.txt:25` |
| `tiff_file` | 1 | horizontal_map | `noise_cloud/noise_cloud.txt:53` |
| `tilt` | 46 | platform, platform_type, sensor… | `ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:203` |
| `time` | 91 | ejectable, mover, output_rate… | `base_types/processors/timeline_agents/flight_lead_filtered_timeline.txt:181` |
| `time1` | 1 | on_update | `base_types/processors/ripr_agents/aijam/aijam_processor.txt:765` |
| `time2` | 1 | on_update | `base_types/processors/ripr_agents/aijam/aijam_processor.txt:766` |
| `time3` | 1 | on_update | `base_types/processors/ripr_agents/aijam/aijam_processor.txt:767` |
| `time4` | 1 | on_update | `base_types/processors/ripr_agents/aijam/aijam_processor.txt:768` |
| `time_before_refueling` | 8 | platform_type, processor, script_variables | `outer_air_battle/platforms/blue_multirole_fighter_2_mrc.txt:26` |
| `time_between_engagements` | 2 | delays, processor | `iads_c2_demos/processors/weapons_manager_sam.txt:29` |
| `time_constant` | 165 | phase, platform_type, processor | `p6dof/platforms/aam-mr.txt:71` |
| `time_format` | 31 | event_output | `aea_iads/event_output.txt:13` |
| `time_history_path` | 2 | navigation_errors, platform_type | `sensor_demos/nav_demo.txt:62` |
| `time_of_flight_to_arm` | 51 | platform_type, processor | `ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:177` |
| `time_of_flight_values` | 27 | fires_table, intercept_results, launch_computer… | `base_types/weapons/aam/blue_sr_a2a_ir_missile_ata_launch_computer_alt10kft_0.6mach.txt:39` |
| `time_out_clock_interval` | 26 | platform, platform_type, processor… | `logistics/platforms/fueling_truck.txt:41` |
| `time_to_declare` | 10 | reported_emitter_type, sensor | `electronic_warfare/esm_detect_multi_beam_radar.txt:61` |
| `time_to_evaluate` | 25 | platform_type, processor | `aea_iads/platforms/iads_cmdr.txt:103` |
| `time_to_live` | 2 | xio_interface | `aea_iads/xio_interface.txt:16` |
| `time_to_reevaluate` | 4 | reported_emitter_type, sensor | `electronic_warfare/esm_detect_multi_sensor_radar.txt:84` |
| `to` | 1 | script | `air_to_air/prdata/rules_utils.txt:795` |
| `tolerance` | 8 | integrator, model, mover… | `cislunar/scenarios/orbiter.txt:31` |
| `tool` | 30 | tool | `ballistic_missile_shootdown/weapons/sam/blue_naval_sam_lcg.txt:23` |
| `tool_debug` | 22 | tool | `ballistic_missile_shootdown/weapons/sam/blue_naval_sam_lcg.txt:24` |
| `tot_missiles` | 2 | script | `air_to_air/prdata/rules_utils.txt:1202` |
| `total` | 14 | behavior, script | `base_types/processors/quantum_agents/aiai/behavior_go_home.txt:58` |
| `total_aircraft` | 5 | script | `air_to_air/observer.txt:100` |
| `total_mass` | 391 | mover, platform_type, stage | `air_to_air/weapons/aam/medium_range_radar_missile.txt:150` |
| `total_sam` | 3 | script | `air_to_air/observer.txt:105` |
| `total_station_time` | 8 | platform_type, processor, script_variables | `outer_air_battle/platforms/blue_multirole_fighter_2_mrc.txt:25` |
| `total_total_ac` | 1 | script | `air_to_air/observer.txt:375` |
| `total_total_sam` | 1 | script | `air_to_air/observer.txt:380` |
| `track` | 95 | platform, script, track | `alternate_locations/scenarios/red_air_strike.txt:24` |
| `track_behavior` | 30 | effect, electronic_attack, electronic_protect… | `aea_iads/weapons/jammer/soj_base_jammer.txt:69` |
| `track_capacity` | 54 | false_target_screener, mode_template, sensor | `aea_iads/sensors/radar/ew_radar.txt:99` |
| `track_data_update_interval` | 6 | platform, platform_type, processor | `air_to_air/platforms/brawler_test.txt:196` |
| `track_error_inducement` | 5 | electronic_protect, mitigated_techniques, receiver… | `electronic_warfare/track_error.txt:211` |
| `track_history_retention_interval` | 4 | platform_type, processor | `space_operations/cloud_attenuation.txt:103` |
| `track_manager` | 78 | platform, platform_type, processor… | `aea_iads/processors/commander_track_manager.txt:9` |
| `track_processor` | 1 | processor | `space_operations/platforms/starlink_linkable.txt:55` |
| `track_quality` | 232 | jam_strobe_detector, mode, mode_template… | `aea_iads/sensors/radar/acq_radar.txt:77` |
| `track_update_interval` | 17 | platform_type, processor | `aea_iads/platforms/iads_cmdr.txt:21` |
| `track_updates` | 2 | processor, routing_table | `iads_c2_demos/processors/disseminate_c2.txt:20` |
| `tracking` | 3 | next_state, processor, state | `ship_ad/weapons/agm/asm_tactics.txt:54` |
| `tracking_sigma` | 6 | correlation_method, platform_type, track_manager | `bearing_only/platforms/commander_platform.txt:39` |
| `trajectory_type` | 4 | mover, platform_type | `tbm_demos/weapons/ssm/tbm1.txt:29` |
| `transactor` | 14 | platform_type, processor, transactor | `exchange_proc/receiver_definition.txt:31` |
| `transfer_capacity` | 52 | false_target_screener, mode_template, sensor | `aea_iads/sensors/radar/ew_radar.txt:101` |
| `transfer_rate` | 44 | comm, comm_network, platform_type | `alternate_locations/platforms/common.txt:31` |
| `transform_route` | 2 | platform, route | `iads_c2_demos/scenarios/air_interceptor.txt:30` |
| `transmit_mode` | 2 | comm | `electronic_warfare/comm_jamming.txt:83` |
| `transmit_only` | 12 | sensor | `sensor_demos/bistatic_demo.txt:64` |
| `transmitter` | 1128 | beam, comm, mode… | `aea_iads/sensors/radar/acq_radar.txt:49` |
| `true_anomaly` | 878 | common, mover, multiresolution_mover… | `coverage_demos/scenarios/sat_con_1_autogen.txt:32` |
| `tsfc_ab_pph` | 22 | jet, jet_engine_type, p6dof_object_types… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/prop/LTE_FIGHTER_Eng.txt:18` |
| `tsfc_idle_pph` | 56 | jet, jet_engine_type, p6dof_object_types… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/prop/LTE_FIGHTER_Eng.txt:16` |
| `tsfc_mil_pph` | 56 | jet, jet_engine_type, p6dof_object_types… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/prop/LTE_FIGHTER_Eng.txt:17` |
| `tspi_file` | 1 | flight_path_analysis | `sensor_plot/radar/fpa-tspi.txt:35` |
| `ttr_targets` | 4 | engagement_settings, processor | `iads_c2_demos/processors/weapons_manager_ai.txt:25` |
| `turn_hot` | 6 | advanced_behavior, execute | `air_to_air/rules/pump.txt:97` |
| `turn_off_tar_if_no_tracks` | 1 | processor | `iads_c2_demos/processors/simple_sensors_manager.txt:20` |
| `turn_off_ttr_if_no_tracks` | 1 | processor | `iads_c2_demos/processors/simple_sensors_manager.txt:21` |
| `turn_on_sensor` | 24 | platform_type, processor | `air_to_air/weapons/aam/medium_range_radar_missile.txt:212` |
| `turn_rate_limit` | 40 | mover, platform, platform_type | `base_types/weapons/aam/scenario_test_launch_computer.txt:61` |
| `turn_roll_in_multiplier` | 171 | autopilot_config, limits_and_settings, pid_group | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:103` |
| `turning_sigma` | 6 | correlation_method, platform_type, track_manager | `bearing_only/platforms/commander_platform.txt:44` |
| `txt` | 4 | script | `engage/post_process_test.txt:39` |
| `type` | 401 | aero_component, gain_table, mapping_table… | `air_to_air/prdata/rules_utils.txt:675` |
| `unchanged_track_reporting` | 15 | platform, platform_type, processor | `air_to_air/platforms/brawler_test.txt:120` |
| `uncompressed_length` | 24 | ground_reaction_point, landing_gear, p6dof_object_type… | `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:97` |
| `uncorrelated_track_drops` | 15 | platform, platform_type, processor… | `base_types/platforms/brawler/brawler_flight_lead.txt:23` |
| `unframed_detection_optimization` | 1 | sensor | `electronic_warfare/agile_auto-repeater_jamming.txt:46` |
| `uniform_pattern` | 92 | antenna_pattern, uniform_pattern | `aea_iads/sensors/radar/ew_radar.txt:26` |
| `unit` | 8 | formation, unit | `p6dof/basic_formation.txt:78` |
| `unitary` | 30 | aux_data, route, route_network | `iads_c2_demos/sensors_manager_fov.txt:58` |
| `units` | 30 | altitudes, analysis_map, fuel… | `example_scripts/fuel_table_demo.txt:35` |
| `unknowns` | 2 | engage_iff_permissions, processor | `iads_c2_demos/processors/battle_manager.txt:60` |
| `update_interval` | 1036 | common, conditional_section, laser_designations… | `air_to_air/platforms/brawler_test.txt:100` |
| `update_once_per_frame` | 5 | effect, electronic_attack, technique… | `electronic_warfare/simple_ft_jamming.txt:55` |
| `update_rate` | 1 | network | `comm/comms/network.txt:11` |
| `update_time_tolerance` | 29 | mover, platform, platform_type | `air_to_air/platforms/dca.txt:40` |
| `uplink_required` | 16 | platform_type, processor | `air_to_air/weapons/aam/medium_range_radar_missile.txt:215` |
| `use_3d_radius` | 1 | weapon_effects | `suppressor/weapons/sam/missile.txt:129` |
| `use_all_lanes` | 6 | port, sea_traffic | `traffic_demos/scenarios/west_coast_sea_traffic.txt:53` |
| `use_asset_perception` | 6 | heat_map, platform_type, processor | `heatmap/platforms/flight_lead.txt:62` |
| `use_bisector_for_bistatic` | 10 | radar_signature | `sensor_demos/bistatic_demo.txt:17` |
| `use_current_target` | 26 | platform_type, processor | `ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:172` |
| `use_default_protocol` | 1 | router | `comm/comms/ad_hoc_comm.txt:134` |
| `use_legacy_beta` | 28 | autopilot_config | `p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:35` |
| `use_legacy_derivatives` | 11 | aero_data | `p6dof/p6dof_types/weapons/simple-icbm/ICBM_BalloonAero.txt:19` |
| `use_nav_radios` | 1 | pilot_manager | `p6dof/p6dof_types/weapons/simple-icbm/control_inputs.txt:65` |
| `use_preset` | 39 | event_pipe | `aea_iads/event_pipe.txt:13` |
| `use_program` | 12 | phase, platform_type | `hellfire/laser_designation_via_dis/hellfire_type.txt:210` |
| `use_random_calculation_draw` | 8 | effect, electronic_attack, electronic_warfare… | `aea_iads/weapons/jammer/soj_base_jammer.txt:38` |
| `use_reduced_frequency` | 11 | aero_data | `p6dof/p6dof_types/weapons/simple-icbm/ICBM_BalloonAero.txt:20` |
| `use_rotating_earth` | 4 | point_mass_vehicle_type, six_dof_object_types | `six_dof/six_dof_types/spacecraft/orbiter-booster/orbiter-booster.txt:24` |
| `use_route` | 8 | platform | `outer_air_battle/scenarios/temp_platforms.txt:16` |
| `use_simple_countermeasures` | 5 | platform, platform_type, processor | `air_to_air/platforms/brawler_test.txt:236` |
| `use_simple_yaw_damper` | 40 | autopilot_config | `p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:39` |
| `use_spherical_earth` | 17 | p6dof_object_type | `p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:17` |
| `use_target_result` | 1 | platform_type | `sensor_demos/coherent_sensor_demo.txt:107` |
| `use_truth_altitude` | 4 | platform_type, processor | `electronic_warfare/jam_strobe_direction_finder.txt:220` |
| `use_zone` | 53 | launch_acceptable_region, launch_computer, platform… | `cyber/exfiltrate_demo/scenarios/iads_laydown.txt:340` |
| `user` | 1 | script | `air_to_air/prdata/rules_utils.txt:463` |
| `v` | 2 | script | `engage/post_process_test.txt:38` |
| `vacuum_specific_impulse` | 3 | mover, platform_type, stage | `space_operations/launch_vehicles/launcher_one/launcher_one_base.txt:120` |
| `vacuum_thrust` | 23 | mover, platform_type, stage | `space_operations/launch_vehicles/atlas_v_401/atlas_v_401_base.txt:70` |
| `valfpp` | 4 | behavior, execute | `base_types/platforms/brawler/alternatives/behavior_pilot_posture.txt:241` |
| `valid_unit_details` | 2 | print_settings, processor | `iads_c2_demos/processors/battle_manager.txt:26` |
| `valid_units` | 2 | print_settings, processor | `iads_c2_demos/processors/battle_manager.txt:25` |
| `value` | 6 | platform_type, processor, script | `base_types/processors/timeline_agents/flight_lead_filtered_timeline.txt:496` |
| `values` | 10121 | aero_data, aero_mode, alpha_versus_mach_cl_table… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_support_tables.txt:195` |
| `variable` | 398 | flight_path_analysis, horizontal_map, items… | `engage/flight_path.txt:165` |
| `vecfpp` | 4 | behavior, execute | `base_types/platforms/brawler/alternatives/behavior_pilot_posture.txt:240` |
| `vehicle` | 69 | convoy, network, osm_traffic… | `traffic_demos/scenarios/china_traffic.txt:36` |
| `vehicle_count` | 14 | network, osm_traffic, road_traffic | `traffic_demos/scenarios/china_traffic.txt:18` |
| `vehicle_type` | 102 | mover, platform_type | `air_to_air/platforms/lte_fighter.txt:267` |
| `velocity` | 5 | script | `air_to_air/prdata/rules_utils.txt:325` |
| `velocity_pursuit_gain` | 339 | mover, phase, platform… | `air_to_air/weapons/aam/medium_range_radar_missile.txt:172` |
| `vert_speed_max` | 174 | autopilot_config, limits_and_settings, pid_group | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:96` |
| `vert_speed_min` | 174 | autopilot_config, limits_and_settings, pid_group | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:95` |
| `vertical_acceleration_rate_pid` | 6 | mover, vertical_acceleration_rate_pid | `hellfire/active_radar_hellfire/helo_mover.txt:109` |
| `vertical_acceleration_value_pid` | 6 | mover, vertical_acceleration_value_pid | `hellfire/active_radar_hellfire/helo_mover.txt:116` |
| `vertical_coverage` | 6 | vertical_coverage | `iads/sensors/radar/acq_radar_vcd.txt:23` |
| `vertical_map` | 4 | vertical_map | `sensor_plot/radar/vm-ucav-dry.txt:34` |
| `vertical_middle_loop_rate_factor` | 58 | autopilot_config | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:12` |
| `vertical_outer_loop_rate_factor` | 58 | autopilot_config | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:13` |
| `visacq` | 2 | script | `base_types/platforms/brawler/alternatives/behavior_weapon_decision_gun.txt:94` |
| `visual_part` | 26 | platform_type, visual_part | `satellite_demos/5th_iridium_flares_demo.txt:265` |
| `visual_part_update_interval` | 1 | event_pipe | `visual_part/startup.txt:20` |
| `void` | 4 | processor, script | `cyber/processors/telar_task_mgr.txt:179` |
| `vout` | 6 | script | `air_to_air/rules/brawler_script_util.txt:134` |
| `vuse` | 6 | script | `air_to_air/rules/brawler_script_util.txt:245` |
| `wash_in_conditions` | 18 | platform | `p6dof/bomb_sequencers.txt:106` |
| `wavelength` | 196 | atmospheric_coefficients, comm, fluence_model… | `hel/ground_hel_vs_hypersonic.txt:65` |
| `wcs` | 1 | script | `base_types/processors/timeline_agents/common_timeline_scripts.txt:203` |
| `weapon` | 1067 | advanced_behavior, behavior, execute… | `aea_iads/platforms/iads_cmdr.txt:62` |
| `weapon_effects` | 367 | platform, platform_type, weapon… | `air_to_air/weapons/aam/medium_range_radar_missile.txt:31` |
| `weapon_name` | 3 | cyber_effect, platform_type, script_variables | `cyber/avengers_detonate_effect.txt:44` |
| `weapon_rows` | 3 | processor, weapon_rows, weapon_table | `iads_c2_demos/processors/battle_manager.txt:44` |
| `weapon_subtype` | 2 | processor, scoring_factors | `iads_c2_demos/processors/battle_manager.txt:52` |
| `weapon_system` | 6 | on_initialize, processor | `hel/hel_test.txt:62` |
| `weapon_table` | 2 | processor, weapon_table | `iads_c2_demos/processors/battle_manager.txt:30` |
| `weapon_type` | 2 | processor, scoring_factors | `iads_c2_demos/processors/battle_manager.txt:51` |
| `weapon_uplink_path` | 10 | platform_type, processor | `new_guidance/platforms/missile_ship.txt:50` |
| `weaponavail` | 19 | next_state, platform_type, processor… | `alv_routing/weapons/alv_weapon.txt:106` |
| `weaponnotavail` | 4 | next_state, platform_type, processor… | `laser_designator/platforms/uav.txt:128` |
| `weapons_data_update_interval` | 5 | platform_type, processor | `air_to_air/platforms/brawler_test.txt:195` |
| `weathercock_speed` | 24 | mode, mover | `hellfire/active_radar_hellfire/helo_mover.txt:17` |
| `weight` | 24 | advanced_behavior, execute | `behavior_tree/processors/quantum_agents/aiai/blackboard_checkpoint_1_task.txt:28` |
| `weight_closing_speed` | 1 | query_bid_type | `base_types/processors/ripr_agents/aiai/aiai_processor.txt:254` |
| `weighted_random` | 9 | advanced_behavior_tree, platform_type, processor… | `behavior_tree/platforms/blackboard_striker.txt:50` |
| `weighted_region` | 18 | network, road_traffic, weighted_region | `traffic_demos/scenarios/china_traffic.txt:26` |
| `while` | 104 | advanced_behavior, behavior, execute… | `base_types/processors/quantum_agents/aiai/behavior_debug_job_board.txt:53` |
| `width` | 4 | platform_type | `ciws/platforms/air_target.txt:15` |
| `wind_direction` | 1 | global_environment | `space_operations/scenarios/noise_cloud.txt:63` |
| `wind_speed` | 1 | global_environment | `space_operations/scenarios/noise_cloud.txt:62` |
| `wing_area_sqft` | 5 | aero_data | `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:36` |
| `wing_chord_ft` | 5 | aero_data | `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:34` |
| `wing_span_ft` | 5 | aero_data | `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:35` |
| `wingman` | 2 | platform_type, script | `timeline/platforms/flight_lead.txt:89` |
| `winner` | 60 | advanced_behavior, behavior, execute | `base_types/processors/quantum_agents/aiai/behavior_debug_job_board.txt:135` |
| `with_target` | 6 | conjunction_setup, mover, platform | `space_operations/conjunction_ssn.txt:40` |
| `workload` | 2 | processor, scoring_factors | `iads_c2_demos/processors/battle_manager.txt:56` |
| `worse` | 4 | script | `base_types/platforms/brawler/alternatives/behavior_weapon_decision_gun.txt:150` |
| `writeln_d` | 24 | advanced_behavior, behavior, execute… | `base_types/platforms/red_multirole_fighter_2_base.txt:76` |
| `wsf_weapon_server` | 2 | wsf_weapon_server | `l16_j11/j11_in.txt:74` |
| `x` | 40 | behavior, execute, run… | `base_types/processors/quantum_agents/aiai/behavior_disengage.txt:149` |
| `x_units` | 11 | horizontal_coverage, vertical_coverage | `iads/sensors/radar/acq_radar_vcd.txt:25` |
| `xio_interface` | 3 | xio_interface | `aea_iads/xio_interface.txt:10` |
| `xy` | 2 | script | `p6dof/p6dof_types/scripts/support_scripts.txt:55` |
| `y` | 38 | behavior, execute, script | `base_types/processors/quantum_agents/aiai/behavior_disengage.txt:150` |
| `y_comp` | 1 | script | `air_to_air/rules/brawler_script_util.txt:428` |
| `y_units` | 11 | horizontal_coverage, vertical_coverage | `iads/sensors/radar/acq_radar_vcd.txt:26` |
| `yaw` | 133 | comm, platform, platform_type… | `aea_iads/platforms/soj.txt:422` |
| `yaw_control_augmentation_factor_deg` | 4 | manual_pilot_augmented_controls, pilot_manager | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/control_inputs_pm6.txt:62` |
| `yaw_control_mapping_table` | 54 | manual_pilot_augmented_controls, manual_pilot_augmented_stability, pilot_manager… | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/control_inputs_pm6.txt:19` |
| `yaw_gload_max` | 9 | autopilot_config, limits_and_settings, pid_group | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:88` |
| `yaw_rate_max` | 174 | autopilot_config, limits_and_settings, pid_group | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:98` |
| `yaw_stability_augmentation` | 6 | manual_pilot_augmented_stability, pilot_manager | `p6dof/p6dof_types/aircraft/b-hvy/controls/control_inputs.txt:125` |
| `yaw_trim_factor` | 87 | manual_pilot_augmented_controls, manual_pilot_augmented_stability, pilot_manager | `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/control_inputs_pm6.txt:61` |
| `z` | 12 | platform_type, script | `p6dof/alternate_tactical_maneuvers.txt:61` |
| `z_comp` | 1 | script | `air_to_air/rules/brawler_script_util.txt:429` |
| `zero_lift_cd` | 29 | aero | `ballistic_missile_shootdown/weapons/ssm/red_mrbm_1.txt:95` |
| `zone` | 116 | grid, platform, platform_type… | `aea_iads/platforms/large_sam_battalion.txt:104` |
| `zone_set` | 3 | platform, zone_set | `sensor_demos/nav_demo.txt:118` |
| `zvf_filter_bandwidth` | 4 | sensor, signal_processor | `base_types/sensors/radar/mtd_radar.txt:73` |
| `zvf_filter_slr` | 2 | sensor, signal_processor | `base_types/sensors/radar/mtd_radar.txt:75` |
| `zvf_num_filter_poles` | 2 | sensor, signal_processor | `base_types/sensors/radar/mtd_radar.txt:72` |
| `zvf_switch` | 2 | sensor, signal_processor | `base_types/sensors/radar/mtd_radar.txt:71` |
