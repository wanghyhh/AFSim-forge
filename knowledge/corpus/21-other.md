# 长尾块

> **来源**：AFSIM 2.9.0 官方 demo 集（`demos/`，4,751 个 `.txt`，132 万行）
> **性质**：原文摘抄，未改写。同一「参数签名」只保留 1 条代表，并注明出现次数与另见位置
> **警示**：片段中数值为 demo 原值，**仅供语法参考，不得直接复用**；依赖 `common/` 数据表的片段须另行提供
> **检索**：按命令 / 类型名 / 参数名搜本卷；总表见 `90-tokens.md`

### acquire_deltas（chaff_example_ttr）｜

- **关键词**：acquire_deltas, azimuth_delta, elevation_delta, range_delta
- **出处**：`chaff/chaff_example_ttr.txt:210-214`　（同签名共 4 处，另见 `electronic_warfare/closely_space_targets.txt:83`、`electronic_warfare/closely_space_targets_ttr.txt:129`、`electronic_warfare/close_targets_ttr.txt:140`）
- **片段**：

```text
         acquire_deltas
            azimuth_delta       0.2 deg
            elevation_delta     0.2 deg
            range_delta         25 m
         end_acquire_deltas
```

- **演示要点**：演示 acquire_deltas 的参数：azimuth_delta, elevation_delta, range_delta

### altitude_attributes（battle_manager）｜

- **关键词**：altitude_attributes, attrib
- **出处**：`iads_c2_demos/processors/battle_manager.txt:37-41`
- **片段**：

```text
         altitude_attributes
            attrib low  0 ft     < 1000 ft
            attrib med  1000 ft  < 30000 ft
            attrib high 30000 ft < 100000 ft
         end_altitude_attributes
```

- **演示要点**：演示 altitude_attributes 的参数：attrib

### attack_response（altitude_protect）｜

- **关键词**：attack_response, probability_of_scan_detection, probability_of_attack_success, probability_of_status_report, probability_of_attack_detection, probability_of_future_immunity, attack_detection_delay_time, attack_recovery_delay_time, restore
- **出处**：`cyber/cyber/cyber_protections/altitude_protect.txt:14-25`　（同签名共 3 处，另见 `cyber/cyber/cyber_protections/crash_protect.txt:12`、`cyber/cyber/cyber_protections/delay_comms.txt:14`）
- **片段**：

```text
   attack_response LOWER_ALTITUDE
      probability_of_scan_detection 1.0
      probability_of_attack_success 1.0
      probability_of_status_report 1.0
      probability_of_attack_detection 1.0
      probability_of_future_immunity 0.0
      
      
      attack_detection_delay_time 1 s
      attack_recovery_delay_time 20 s
      restore      
    end_attack_response     
```

- **演示要点**：演示 attack_response 的参数：probability_of_scan_detection, probability_of_attack_success, probability_of_status_report, probability_of_attack_detection, probability_of_future_immunity, attack_detection_delay_time, attack_recovery_delay_time, restore

### ballistic_missile_launch_computer（red_mrbm_1）｜

- **关键词**：ballistic_missile_launch_computer, target_data
- **出处**：`ballistic_missile_shootdown/weapons/ssm/red_mrbm_1.txt:381-386`　（同签名共 9 处，另见 `base_types/weapons/ssm/red_icbm_2.txt:395`、`base_types/weapons/ssm/red_mrbm_1.txt:381`、`base_types/weapons/ssm/red_mrbm_2.txt:233`）
- **片段**：

```text
ballistic_missile_launch_computer
   target_data RED_MRBM_1
      aero RED_MRBM_1_RV_AERO              # Aero type of final stage
      mass 500 kg                      # Mass of final stage
   end_target_data
end_ballistic_missile_launch_computer
```

- **演示要点**：演示 ballistic_missile_launch_computer 的参数：target_data

### ballistic_types（fires_all_indirect_fire）｜

- **关键词**：ballistic_types
- **出处**：`fires/types/fires_all_indirect_fire.txt:29-41`
- **片段**：

```text
ballistic_types
   FIRES_60MM_MORTAR
   FIRES_107MM_ROCKET
   FIRES_120MM_ARTILLERY
   FIRES_120MM_MORTAR
   FIRES_122MM_ROCKET
   FIRES_152MM_ARTILLERY
   FIRES_155MM_ARTILLERY_M107_HE
   FIRES_155MM_ARTILLERY_M107_HE_LOFTED
   FIRES_81MM_MORTAR_M821_HE
   FIRES_60MM_MORATAR_M720_HE
   FIRES_220MM_ROCKET_9M27F
end_ballistic_types
```

- **演示要点**：演示 ballistic_types（最小结构，无子参数）

### circular_pattern（medium_range_radar_missile）｜

- **关键词**：circular_pattern, beamwidth, peak_gain, minimum_gain
- **出处**：`air_to_air/weapons/aam/medium_range_radar_missile.txt:40-44`　（同签名共 16 处，另见 `air_to_air/weapons/aam/medium_range_radar_missile.txt:47`、`air_to_air/weapons/aam/short_range_ir_missile.txt:46`、`base_types/weapons/aam/medium_range_radar_missile.txt:33`）
- **片段**：

```text
  circular_pattern
    beamwidth             6.0 deg
    peak_gain            30.0 dB
    minimum_gain        -10.0 dB
  end_circular_pattern
```

- **演示要点**：演示 circular_pattern 的参数：beamwidth, peak_gain, minimum_gain

### circular_pattern（blue_ship_mf_radar）｜

- **关键词**：circular_pattern, peak_gain, beamwidth
- **出处**：`base_types/sensors/radar/blue_ship_mf_radar.txt:90-93`　（同签名共 29 处，另见 `base_types/sensors/radar/generic_fire_control_radar.txt:142`、`electronic_warfare/agile_auto-repeater_jamming.txt:65`、`electronic_warfare/agile_jamming.txt:61`）
- **片段**：

```text
  circular_pattern
    peak_gain         30 dB     // need to qualify based on Loop Gain
    beamwidth         2.1 deg
  end_circular_pattern
```

- **演示要点**：演示 circular_pattern 的参数：peak_gain, beamwidth

### circular_pattern（gps_denied）｜

- **关键词**：circular_pattern, peak_gain
- **出处**：`satellite_demos/scenarios/gps_denied.txt:244-246`
- **片段**：

```text
  circular_pattern
     peak_gain 5 dB
  end_circular_pattern
```

- **演示要点**：演示 circular_pattern 的参数：peak_gain

### conjunction_setup（conjunction_ssn）｜

- **关键词**：conjunction_setup, from_initial, with_target, at_time
- **出处**：`space_operations/conjunction_ssn.txt:38-42`　（同签名共 2 处，另见 `space_operations/conjunction_ssn.txt:55`）
- **片段**：

```text
      conjunction_setup
         from_initial
         with_target primary
         at_time 45 min
      end_conjunction_setup
```

- **演示要点**：演示 conjunction_setup 的参数：from_initial, with_target, at_time

### connections（dis_config）｜

- **关键词**：connections, multicast, port
- **出处**：`p6dof/config/dis_config.txt:30-33`　（同签名共 3 处，另见 `six_dof/config/dis_config.txt:30`、`six_dof_with_brawler/config/dis_config.txt:30`）
- **片段**：

```text
  connections
    multicast  228.10.10.2  10.34.209.67
    port 3000
  end_connections
```

- **演示要点**：演示 connections 的参数：multicast, port

### constant_pattern（ew_radar）｜

- **关键词**：constant_pattern, peak_gain, azimuth_beamwidth, elevation_beamwidth
- **出处**：`alv_routing/sensors/ew_radar.txt:13-17`　（同签名共 9 处，另见 `iads/sensors/radar/ucav_sar.txt:43`、`iads_c2_demos/sensors/ucav_sar.txt:47`、`satellite_demos/scenarios/gps_denied.txt:262`）
- **片段**：

```text
  constant_pattern
     peak_gain            35 dB
     azimuth_beamwidth    40 deg
     elevation_beamwidth  40 deg
  end_constant_pattern
```

- **演示要点**：演示 constant_pattern 的参数：peak_gain, azimuth_beamwidth, elevation_beamwidth

### constant_pattern（generic_ground_radar）｜

- **关键词**：constant_pattern
- **出处**：`base_types/sensors/radar/generic_ground_radar.txt:82-87`
- **片段**：

```text
  constant_pattern
  peak_gain             28 dB       # (A) antenna gain
  azimuth_beamwidth     4 deg       # (A) azimuth beamwidth
  elevation_beamwidth   10 deg      # (A) actual beamwidth
  elevation_beamwidth   10.5 deg    # (A) w/ 0.5 deg error
  end_constant_pattern
```

- **演示要点**：演示 constant_pattern（最小结构，无子参数）

### default（MITM_exfiltrate_demo）｜

- **关键词**：default, exfiltrate, all
- **出处**：`cyber/exfiltrate_demo/MITM_exfiltrate_demo.txt:37-40`
- **片段**：

```text
   default 
      exfiltrate true
      all
   end_default
```

- **演示要点**：演示 default 的参数：exfiltrate, all

### default（lower_altitude）｜

- **关键词**：default, script
- **出处**：`cyber/cyber/cyber_effects/lower_altitude.txt:17-28`　（同签名共 2 处，另见 `cyber/cyber/cyber_effects/crash.txt:13`）
- **片段**：

```text
   default
      script void Attack(WsfCyberEngagement aEngagement)
         WsfPlatform victim = aEngagement.VictimPlatform();
         originalAltitude.Set(victim, victim.Altitude());
         victim.GoToAltitude(1000*MATH.M_PER_FT());
      end_script
      
      script void Restore(WsfCyberEngagement aEngagement)
         WsfPlatform victim = aEngagement.VictimPlatform();
         victim.GoToAltitude(originalAltitude.Get(victim));
      end_script
   end_default
```

- **演示要点**：演示 default 的参数：script

### distribution_centroid（false_target）｜

- **关键词**：distribution_centroid, position, altitude, heading, speed
- **出处**：`electronic_warfare/test_false_targets/weapons/jammer/false_target.txt:21-26`
- **片段**：

```text
  distribution_centroid
    position 39:22:36n 117:33:25w
    altitude 30000.0 ft agl
    heading 0 deg
    speed 0 kts
  end_distribution_centroid
```

- **演示要点**：演示 distribution_centroid 的参数：position, altitude, heading, speed

### engage_iff_permissions（battle_manager）｜

- **关键词**：engage_iff_permissions, unknowns, neutrals, friendlies, hostiles
- **出处**：`iads_c2_demos/processors/battle_manager.txt:59-64`
- **片段**：

```text
      engage_iff_permissions
         unknowns        false
         neutrals        false
         friendlies      false
         hostiles        true
      end_engage_iff_permissions
```

- **演示要点**：演示 engage_iff_permissions 的参数：unknowns, neutrals, friendlies, hostiles

### error_model（esm_tdoa_demo）｜

- **关键词**：error_model, north_position_error_sigma, east_position_error_sigma, down_position_error_sigma, reference_time_error, inter_system_time_delay, sensor_timing_error, atmospheric_refraction_residual
- **出处**：`sensor_demos/esm_tdoa_demo.txt:117-125`　（同签名共 2 处，另见 `sensor_plot/esm/hm-tdoa.txt:52`）
- **片段**：

```text
   error_model trimsim_error
      north_position_error_sigma      0.1 ft
      east_position_error_sigma       0.1 ft
      down_position_error_sigma       0.1 ft
      reference_time_error            5.0 ns
      inter_system_time_delay         5.0 ns
      sensor_timing_error             0.0 s
      atmospheric_refraction_residual 0.0
   end_error_model
```

- **演示要点**：演示 error_model 的参数：north_position_error_sigma, east_position_error_sigma, down_position_error_sigma, reference_time_error, inter_system_time_delay, sensor_timing_error, atmospheric_refraction_residual

### error_model_parameters（passive_detector_df_demo）｜

- **关键词**：error_model_parameters, azimuth_beamwidth, elevation_beamwidth, receiver_bandwidth
- **出处**：`sensor_demos/passive_detector_df_demo.txt:68-72`
- **片段**：

```text
   error_model_parameters
      azimuth_beamwidth      90 deg  # quadrant detection
      elevation_beamwidth    90 deg
      receiver_bandwidth     50 mhz
   end_error_model_parameters
```

- **演示要点**：演示 error_model_parameters 的参数：azimuth_beamwidth, elevation_beamwidth, receiver_bandwidth

### ground_reaction_point（fa-lgt_landing-gear）｜

- **关键词**：ground_reaction_point, control_surface_name, steering_control_surface_name, nws_angle_control_surface_name, is_nose_gear, gear_extended_relative_position_x, gear_extended_relative_position_y, gear_extended_relative_position_z, gear_compression_vector_x, gear_compression_vector_y, gear_compression_vector_z, gear_rolling_vector_x, gear_rolling_vector_y
- **出处**：`p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:81-104`　（同签名共 2 处，另见 `six_dof/six_dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:81`）
- **片段**：

```text
         ground_reaction_point LandingGear_1
            control_surface_name              Nose_Gear
            steering_control_surface_name     NWS_Angle_Rgt
            nws_angle_control_surface_name    NWS_Right
            is_nose_gear                      true
            gear_extended_relative_position_x 12.5697 ft
            gear_extended_relative_position_y 0 ft
            gear_extended_relative_position_z 5.93762 ft
            gear_compression_vector_x         0
            gear_compression_vector_y         0
            gear_compression_vector_z         -1
            gear_rolling_vector_x             1
            gear_rolling_vector_y             0
            gear_rolling_vector_z             0
            spring_constant_lbs_per_ft        15000
            damper_constant_lbs_per_fps       4000
            uncompressed_length               4 ft
            max_compression                   2 ft
            rolling_coefficient_of_friction   0.001
            braking_coefficient_of_friction   0.8
            scuffing_coefficient_of_friction  1.2
            ignore_friction                   false
            is_landing_gear                   true
         end_ground_reaction_point
```

- **演示要点**：演示 ground_reaction_point 的参数：control_surface_name, steering_control_surface_name, nws_angle_control_surface_name, is_nose_gear, gear_extended_relative_position_x, gear_extended_relative_position_y, gear_extended_relative_position_z, gear_compression_vector_x, gear_compression_vector_y, gear_compression_vector_z

### ground_reaction_point（fa-lgt_landing-gear）｜

- **关键词**：ground_reaction_point, control_surface_name, braking_control_surface_name, is_nose_gear, gear_extended_relative_position_x, gear_extended_relative_position_y, gear_extended_relative_position_z, gear_compression_vector_x, gear_compression_vector_y, gear_compression_vector_z, gear_rolling_vector_x, gear_rolling_vector_y, gear_rolling_vector_z
- **出处**：`p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:106-128`　（同签名共 4 处，另见 `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:130`、`six_dof/six_dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:106`、`six_dof/six_dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:130`）
- **片段**：

```text
         ground_reaction_point LandingGear_2
            control_surface_name              Aft_Gear_Right
            braking_control_surface_name      Wheel_Brake_Rgt
            is_nose_gear                      false
            gear_extended_relative_position_x -2.89984 ft
            gear_extended_relative_position_y 5 ft
            gear_extended_relative_position_z 5.93762 ft
            gear_compression_vector_x         0
            gear_compression_vector_y         0
            gear_compression_vector_z         -1
            gear_rolling_vector_x             1
            gear_rolling_vector_y             0
            gear_rolling_vector_z             0
            spring_constant_lbs_per_ft        20000
            damper_constant_lbs_per_fps       5000
            uncompressed_length               4 ft
            max_compression                   3 ft
            rolling_coefficient_of_friction   0.001
            braking_coefficient_of_friction   0.8
            scuffing_coefficient_of_friction  1.2
            ignore_friction                   false
            is_landing_gear                   true
         end_ground_reaction_point
```

- **演示要点**：演示 ground_reaction_point 的参数：control_surface_name, braking_control_surface_name, is_nose_gear, gear_extended_relative_position_x, gear_extended_relative_position_y, gear_extended_relative_position_z, gear_compression_vector_x, gear_compression_vector_y, gear_compression_vector_z, gear_rolling_vector_x

### independent_variables（mrm_launch_computer_table.1.1）｜

- **关键词**：independent_variables, shooter_altitudes, shooter_machs, target_altitudes, target_machs, target_aspects, target_leads
- **出处**：`air_to_air/weapons/aam/mrm_launch_computer_table.1.1.txt:23-30`　（同签名共 3 处，另见 `air_to_air/weapons/aam/srm_launch_computer_table.1.1.txt:23`、`behavior_tree/weapons/aam/launch_computer_simple_mrm_table.txt:27`）
- **片段**：

```text
   independent_variables
      shooter_altitudes 20000 ft 40000 ft end_shooter_altitudes
      shooter_machs 0.7 1.2 end_shooter_machs
      target_altitudes 20000 ft 40000 ft end_target_altitudes
      target_machs 0.7 0.9 end_target_machs
      target_aspects 0 deg 30 deg 60 deg 90 deg 120 deg 150 deg 180 deg end_target_aspects
      target_leads -30 deg 0 deg 30 deg end_target_leads
   end_independent_variables
```

- **演示要点**：演示 independent_variables 的参数：shooter_altitudes, shooter_machs, target_altitudes, target_machs, target_aspects, target_leads

### independent_variables（ata4_generator）｜

- **关键词**：independent_variables, shooter_altitudes, shooter_machs, target_altitudes, target_machs, target_aspects, target_lead_angles
- **出处**：`base_types/weapons/aam/ata4_generator.txt:122-129`　（同签名共 5 处，另见 `base_types/weapons/aam/ata4_generator.txt:137`、`base_types/weapons/aam/ata_blue_lr_a2a_rf_missile_lc_generator.txt:84`、`base_types/weapons/aam/simple_blue_lr_a2a_rf_missile_air_to_air_launch_computer_table.txt:27`）
- **片段**：

```text
     independent_variables
        shooter_altitudes 10000 ft 20000 ft 30000 ft end_shooter_altitudes
        shooter_machs 0.8 1.0 1.2 1.4 1.6 1.8 2.0 end_shooter_machs
        target_altitudes 10000 ft 20000 ft 30000 ft end_target_altitudes
        target_machs 0.8 1.0 1.2 1.4 1.6 1.8 2.0  end_target_machs
        target_aspects     0 deg 30 deg 60 deg 90 deg 135 deg 180 deg  end_target_aspects
        target_lead_angles 0 deg 30 deg 60 deg 90 deg 135 deg 180 deg  end_target_lead_angles
     end_independent_variables
```

- **演示要点**：演示 independent_variables 的参数：shooter_altitudes, shooter_machs, target_altitudes, target_machs, target_aspects, target_lead_angles

### inherent_contrast（setup_launch_detection）｜

- **关键词**：inherent_contrast, state
- **出处**：`space_operations/setup_launch_detection.txt:34-46`
- **片段**：

```text
inherent_contrast LAUNCH_VEHICLE_CONTRAST
   state FIRST_STAGE
      constant 1      #inherent contrast of the first stage

   state SECOND_STAGE
      constant 1      #inherent contrast of the second stage

   state THIRD_STAGE
      constant 1      #inherent contrast of the third stage

   state default
      constant 1
end_inherent_contrast
```

- **演示要点**：演示 inherent_contrast 的参数：state

### j11（j11_out）｜

- **关键词**：j11, allow_any_comm
- **出处**：`l16_j11/j11_out.txt:92-95`　（同签名共 2 处，另见 `l16_j11/j11_in.txt:64`）
- **片段**：

```text
   j11
      allow_any_comm
#      print_messages
   end_j11
```

- **演示要点**：演示 j11 的参数：allow_any_comm

### mach（fuel_table_demo）｜

- **关键词**：mach
- **出处**：`example_scripts/fuel_table_demo.txt:38-40`　（同签名共 2 处，另见 `multiresolution_demos/fuel/fuel_include.txt:32`）
- **片段**：

```text
         mach
            .25 .5 .75 1.0
         end_mach
```

- **演示要点**：演示 mach（最小结构，无子参数）

### mission_sequence（mission_design_astrolabe）｜

- **关键词**：mission_sequence, execute_at, maneuver, event
- **出处**：`space_operations/mission_design_astrolabe.txt:81-121`
- **片段**：

```text
      mission_sequence
         execute_at relative_time 0 seconds

         maneuver tangent
            execute_at ascending_node
            finite
            duration 18.2 minutes
            update_interval 1 seconds
            delta_v -0 m/s
         end_maneuver

         maneuver tangent
            execute_at ascending_node
            finite
            duration 11.45 minutes
            update_interval 1 seconds
            delta_v 0 m/s
         end_maneuver

         event perform_staging
            execute_at relative_time 0 seconds
         end_event

         maneuver tangent
            execute_at relative_time 2 minutes
            finite
            duration 5 minutes
            update_interval 1 seconds
            delta_v 0 m/s
         end_maneuver

         maneuver change_inclination
            execute_at descending_node
            inclination 0 degrees
         end_maneuver

         maneuver circularize
            execute_at descending_radius 42164 kilometers
         end_maneuver

      end_mission_sequence
```

- **演示要点**：演示 mission_sequence 的参数：execute_at, maneuver, event

### mission_sequence（proximity_operations）｜

- **关键词**：mission_sequence, maneuver
- **出处**：`space_operations/proximity_operations.txt:48-151`
- **片段**：

```text
      mission_sequence
         maneuver intercept
            delta_time 1000 s
            target
               offset ntw -50 0 30 m
               platform target
            end_target
         end_maneuver
         maneuver intercept
            delta_time 100 s
            target
               offset ntw 50 0 30 m
               platform target
            end_target
         end_maneuver

         maneuver rendezvous
            delta_time 25 s
            target
               offset ntw 50 0 0 m
               platform target
            end_target
         end_maneuver
         maneuver rendezvous
            delta_time 25 s
            target
               offset ntw 50 0 0 m
               platform target
            end_target
         end_maneuver
         maneuver rendezvous
            delta_time 25 s
            target
               offset ntw 50 0 0 m
               platform target
            end_target
         end_maneuver
         maneuver rendezvous
            delta_time 25 s
            target
               offset ntw 50 0 0 m
               platform target
            end_target
         end_maneuver

         maneuver intercept
            delta_time 50 s
            target
               offset ntw 50 0 -30 m
               platform target
            end_target
         end_maneuver
         maneuver intercept
            delta_time 100 s
            target
               offset ntw -50 0 -30 m
               platform target
            end_target
         end_maneuver
         maneuver intercept
            delta_time 100 s
            target
               offset ntw -50 30 0 m
               platform target
            end_target
         end_maneuver
         maneuver intercept
            delta_time 100 s
            target
               offset ntw 50 30 0 m
               platform target
            end_target
         end_maneuver
         maneuver intercept
            delta_time 100 s
            target
               offset ntw 50 -30 0 m
               platform target
            end_target
         end_maneuver
         maneuver intercept
            delta_time 100 s
            target
               offset ntw -50 -30 0 m
               platform target
            end_target
         end_maneuver
         maneuver intercept
            delta_time 100 s
            target
               offset ntw -50 0 0 m
               platform target
            end_target
         end_maneuver

         maneuver rendezvous
            delta_time 100 s
            target
               offset ntw -50 0 30 m
               platform target
            end_target
         end_maneuver

      end_mission_sequence
```

- **演示要点**：演示 mission_sequence 的参数：maneuver

### normalized_thrust_vs_alt（Generic_ICBM_RocketEngines）｜

- **关键词**：normalized_thrust_vs_alt
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/Generic_ICBM_RocketEngines.txt:111-115`　（同签名共 2 处，另见 `six_dof/six_dof_types/spacecraft/orbiter-main/prop/solid_propellant_rockets/orbiter-main-rkt/orbiter-main-rkt.txt:35`）
- **片段**：

```text
      normalized_thrust_vs_alt
        #alt      normalized_thrust
        0.0       1.0
        300000.0  1.0
      end_normalized_thrust_vs_alt
```

- **演示要点**：演示 normalized_thrust_vs_alt（最小结构，无子参数）

### port（west_coast_sea_traffic）｜

- **关键词**：port, position, port_route, local_traffic_region, departure_interval, use_all_lanes
- **出处**：`traffic_demos/scenarios/west_coast_sea_traffic.txt:76-89`　（同签名共 3 处，另见 `traffic_demos/scenarios/west_coast_sea_traffic.txt:40`、`traffic_demos/scenarios/west_coast_sea_traffic.txt:56`）
- **片段**：

```text
   port port-seoul
      position 37:54:00n 125:45:00e 1 km

      port_route
         position 37:20:00n 125:40:00e 10 km
      end_port_route

      local_traffic_region 37:54:00n 125:45:00e 60 km 0.4
      local_traffic_region 37:30:00n 126:00:00e 30 km 0.6

      departure_interval 30 min

      use_all_lanes
   end_port
```

- **演示要点**：演示 port 的参数：position, port_route, local_traffic_region, departure_interval, use_all_lanes

### port（west_coast_sea_traffic）｜

- **关键词**：port, position, port_route, local_traffic_region, departure_interval, lane
- **出处**：`traffic_demos/scenarios/west_coast_sea_traffic.txt:15-38`
- **片段**：

```text
   port port-seattle
      position 48:15:00n 123:00:00w 1 km

      port_route
         position 48:30:00n 125:00:00w 10 km
         position 48:15:00n 124:00:00w  1 km
      end_port_route

      local_traffic_region 48:15:00n 123:00:00w 10 km 0.25
      local_traffic_region 48:10:00n 122:50:00w 10 km 0.25
      local_traffic_region 48:20:00n 122:52:00w 15 km 0.25
      local_traffic_region 48:25:00n 123:10:00w 15 km 0.25

      departure_interval 25 min

      // If you don't want to specify lanes explicitly, use_all_lanes
      // will use all lanes that are defined with this port being
      // one of the endpoints.
      //use_all_lanes

      // Or you can explicity specify which lanes outgoing traffic will travel on.
      lane lane-seattle-to-british-columbia 0.70
      lane lane-seattle-to-baja-mexico      0.30
   end_port
```

- **演示要点**：演示 port 的参数：position, port_route, local_traffic_region, departure_interval, lane

### port_route（west_coast_sea_traffic）｜

- **关键词**：port_route, position
- **出处**：`traffic_demos/scenarios/west_coast_sea_traffic.txt:79-81`　（同签名共 4 处，另见 `traffic_demos/scenarios/west_coast_sea_traffic.txt:18`、`traffic_demos/scenarios/west_coast_sea_traffic.txt:43`、`traffic_demos/scenarios/west_coast_sea_traffic.txt:59`）
- **片段**：

```text
      port_route
         position 37:20:00n 125:40:00e 10 km
      end_port_route
```

- **演示要点**：演示 port_route 的参数：position

### primary（conjunction_avoidance）｜

- **关键词**：primary
- **出处**：`space_operations/conjunction_avoidance.txt:154-155`　（同签名共 2 处，另见 `space_operations/scenarios/ssn_laydown.txt:96`）
- **片段**：

```text
         primary
      end_primary
```

- **演示要点**：演示 primary（最小结构，无子参数）

### probabilities（agile_auto-repeater_jamming）｜

- **关键词**：probabilities, pulse_density
- **出处**：`electronic_warfare/agile_auto-repeater_jamming.txt:201-207`　（同签名共 18 处，另见 `electronic_warfare/agile_repeater_jamming-rt1.txt:315`、`electronic_warfare/agile_repeater_jamming-rt2.txt:315`、`electronic_warfare/agile_repeater_jamming.txt:326`）
- **片段**：

```text
                       probabilities
                          pulse_density 0.0 0.0
                          pulse_density 0.1 0.2
                          pulse_density 0.3 0.6
                          pulse_density 0.5 0.8
                          pulse_density 1.0 1.0
                       end_probabilities
```

- **演示要点**：演示 probabilities 的参数：pulse_density

### reacquire_deltas（chaff_example_ttr）｜

- **关键词**：reacquire_deltas, azimuth_delta, elevation_delta, range_delta
- **出处**：`chaff/chaff_example_ttr.txt:216-220`　（同签名共 4 处，另见 `electronic_warfare/closely_space_targets.txt:89`、`electronic_warfare/closely_space_targets_ttr.txt:135`、`electronic_warfare/close_targets_ttr.txt:146`）
- **片段**：

```text
         reacquire_deltas
            azimuth_delta       0.25 deg
            elevation_delta     0.25 deg
            range_delta         1000 m
         end_reacquire_deltas
```

- **演示要点**：演示 reacquire_deltas 的参数：azimuth_delta, elevation_delta, range_delta

### rectangular_pattern（acq_radar）｜

- **关键词**：rectangular_pattern, peak_gain, minimum_gain, azimuth_beamwidth, elevation_beamwidth
- **出处**：`alternate_locations/sensors/radar/acq_radar.txt:11-16`　（同签名共 39 处，另见 `chaff/chaff_example.txt:120`、`cyber/sensors/radar/ground_radar.txt:13`、`electronic_warfare/agile_auto-repeater_jamming.txt:117`）
- **片段**：

```text
   rectangular_pattern 
      peak_gain             35 db
      minimum_gain          -10 db
      azimuth_beamwidth     10 deg
      elevation_beamwidth   10 deg
   end_rectangular_pattern 
```

- **演示要点**：演示 rectangular_pattern 的参数：peak_gain, minimum_gain, azimuth_beamwidth, elevation_beamwidth

### reference_centroid（false-target_command_center）｜

- **关键词**：reference_centroid, altitude, position
- **出处**：`electronic_warfare/false-target_command_center.txt:59-62`
- **片段**：

```text
  reference_centroid
    altitude 35000 ft
    position 36:25:24n 115:43:48w
  end_reference_centroid
```

- **演示要点**：演示 reference_centroid 的参数：altitude, position

### run（flight_path）｜

- **关键词**：run, record_file_base_name, flight_path, output
- **出处**：`engage/flight_path.txt:149-193`
- **片段**：

```text
run
   record_file_base_name flight_path

   flight_path
       # (Time) (X, Y, Z Position) (X, Y, Z Velocity) (Pitch) (Roll) (Yaw)
        0.0 sec    0.0    50.0 100.0 m 200.0   0.0 0.0 m/sec 0.0 0.0 90.0 deg
       10.0 sec 2000.0    50.0 100.0 m 200.0   0.0 0.0 m/sec 0.0 0.0 90.0 deg
       10.1 sec 2020.0    70.0 100.0 m   0.0 200.0 0.0 m/sec 0.0 0.0  0.0 deg
      110.1 sec 2020.0 20070.0 100.0 m   0.0 200.0 0.0 m/sec 0.0 0.0  0.0 deg
   end_flight_path

   output
      file fort.fp.6
      phase all

      items
         variable time format "%.2f"
         variable target_x units km format " %7.3f"
         variable target_y units km format " %7.3f"
         variable target_z units m
      end_items
   end_output

   output
      file fort.fp.7
      phase flying
      items
         variable weapon_flight_time format "%.2f"
         variable target_x units km format " %7.3f"
         variable target_y units km format " %7.3f"
         variable target_z units m format " %7.1f"
         variable weapon_x units km format " %7.3f"
         variable weapon_y units km format " %7.3f"
         variable weapon_z units m format " %7.1f"
         variable weapon_to_target_range units m format " %7.1f"
      end_items
   end_output

   output
     file fort.fp.6
     event_output true
     summary_output true
   end_output

end_run
```

- **演示要点**：演示 run 的参数：record_file_base_name, flight_path, output

### run（grid_react_man）｜

- **关键词**：run, record_file_base_name, target_grid, output
- **出处**：`engage/grid_react_man.txt:216-262`
- **片段**：

```text
run
   record_file_base_name grid

   target_grid
      down_range  from -100 km to 100 km by 100 km
      cross_range from  -20 km to  20 km by  40 km
      altitude    from  30 kft to 30 kft by 10 kft
      speed 262 kts

      #down_range  from 100 km to 100 km by 100 km
      #cross_range from  20 km to  20 km by 40 km
   end_target_grid

   output
      file fort.grm.6
      phase all

      items
         variable time format "%.2f"
         variable target_x units km format " %7.3f"
         variable target_y units km format " %7.3f"
         variable target_z units m
      end_items
   end_output

   output
      file fort.grm.7
      phase flying
      items
         variable weapon_flight_time format "%.2f"
         variable target_x units km format " %7.3f"
         variable target_y units km format " %7.3f"
         variable target_z units m format " %7.1f"
         variable weapon_x units km format " %7.3f"
         variable weapon_y units km format " %7.3f"
         variable weapon_z units m format " %7.1f"
         variable weapon_to_target_range units m format " %7.1f"
      end_items
   end_output

   output
     file fort.grm.6
     event_output true
     summary_output true
   end_output

end_run
```

- **演示要点**：演示 run 的参数：record_file_base_name, target_grid, output

### run（oo_grid）｜

- **关键词**：run, event_output_file_base_name, target_grid, output
- **出处**：`engage/oo_grid.txt:53-103`
- **片段**：

```text
run
   #record_file_base_name oo_grid
   event_output_file_base_name oo_grid

   target_grid
      down_range  from -100 km to 100 km by 10 km
      cross_range from -20 km to 20 km by 5 km
      altitude    from  30 kft to 30 kft by 10 kft
      speed 262 kts

      #down_range  from 100 km to 100 km by 100 km
      #cross_range from  20 km to  20 km by 40 km
   end_target_grid

   output
      file fort.oog.6
      phase all

      items
         variable time format "%.2f"
         variable target_x units km format " %7.3f"
         variable target_y units km format " %7.3f"
         variable target_z units m
      end_items
   end_output

   output
      file fort.oog.7
      phase flying
      items
         variable weapon_flight_time format "%.2f"
         variable target_x units km format " %7.3f"
         variable target_y units km format " %7.3f"
         variable target_z units m format " %7.1f"
         variable weapon_x units km format " %7.3f"
         variable weapon_y units km format " %7.3f"
         variable weapon_z units m format " %7.1f"
         variable weapon_to_target_range units m format " %7.1f"
      end_items
   end_output

   output
     file fort.oog.8
     event_output true
     events
        enable all
     end_events
     summary_output true
   end_output

end_run
```

- **演示要点**：演示 run 的参数：event_output_file_base_name, target_grid, output

### run（simple_flight_path）｜

- **关键词**：run, simple_path, output
- **出处**：`engage/simple_flight_path.txt:144-184`
- **片段**：

```text
run
   #record_file_base_name simple_path

   simple_path
      x 100.0 km y 0.0 m z 30 kft speed 262 kts heading 225.0 deg
   end_simple_path

   output
      file fort.sfp.6
      phase all

      items
         variable time format "%.2f"
         variable target_x units km format " %7.3f"
         variable target_y units km format " %7.3f"
         variable target_z units m
      end_items
   end_output

   output
      file fort.sfp.7
      phase flying
      items
         variable weapon_flight_time format "%.2f"
         variable target_x units km format " %7.3f"
         variable target_y units km format " %7.3f"
         variable target_z units m format " %7.1f"
         variable weapon_x units km format " %7.3f"
         variable weapon_y units km format " %7.3f"
         variable weapon_z units m format " %7.1f"
         variable weapon_to_target_range units m format " %7.1f"
      end_items
   end_output

   output
     file fort.sfp.6
     event_output true
     summary_output true
   end_output

end_run
```

- **演示要点**：演示 run 的参数：simple_path, output

### run（grid）｜

- **关键词**：run, target_grid, output
- **出处**：`engage/grid.txt:143-189`　（同签名共 3 处，另见 `engage/grid_w_offsetroute.txt:151`、`engage/grid_w_observer.txt:143`）
- **片段**：

```text
run
   #record_file_base_name grid

   target_grid
      down_range  from -100 km to 100 km by 100 km
      cross_range from  -20 km to  20 km by  40 km
      altitude    from  30 kft to 30 kft by 10 kft
      speed 262 kts

      #down_range  from 100 km to 100 km by 100 km
      #cross_range from  20 km to  20 km by 40 km
   end_target_grid

   output
      file fort.grid.6
      phase all

      items
         variable time format "%.2f"
         variable target_x units km format " %7.3f"
         variable target_y units km format " %7.3f"
         variable target_z units m
      end_items
   end_output

   output
      file fort.grid.7
      phase flying
      items
         variable weapon_flight_time format "%.2f"
         variable target_x units km format " %7.3f"
         variable target_y units km format " %7.3f"
         variable target_z units m format " %7.1f"
         variable weapon_x units km format " %7.3f"
         variable weapon_y units km format " %7.3f"
         variable weapon_z units m format " %7.1f"
         variable weapon_to_target_range units m format " %7.1f"
      end_items
   end_output

   output
     file fort.grid.6
     event_output true
     summary_output true
   end_output

end_run
```

- **演示要点**：演示 run 的参数：target_grid, output

### run（flight_route）｜

- **关键词**：run, flight_route, output
- **出处**：`engage/flight_route.txt:148-204`
- **片段**：

```text
run
   #record_file_base_name flight_route

   flight_route
       # (X, Y, Z Position) (Speed)
          0.0     0.0 100.0 m 200.0 m/sec
       2000.0     0.0 100.0 m 200.0 m/sec
       2020.0    20.0 100.0 m 200.0 m/sec
       2020.0 20020.0 100.0 m 200.0 m/sec

       #-2000.0     0.0 100.0 m 200.0 m/sec
       #-2020.0    20.0 100.0 m 200.0 m/sec
       #-2020.0 20020.0 100.0 m 200.0 m/sec

       #    0.0 2000.0 100.0 m 200.0 m/sec
       #   20.0 2020.0 100.0 m 200.0 m/sec
       #20020.0 2020.0 100.0 m 200.0 m/sec

       #    0.0 -2000.0 100.0 m 200.0 m/sec
       #   20.0 -2020.0 100.0 m 200.0 m/sec
       #20020.0 -2020.0 100.0 m 200.0 m/sec
   end_flight_route

   output
      file fort.fr.6
      phase all

      items
         variable time format "%.2f"
         variable target_x units km format " %7.3f"
         variable target_y units km format " %7.3f"
         variable target_z units m
      end_items
   end_output

   output
      file fort.fr.7
      phase flying
      items
         variable weapon_flight_time format "%.2f"
         variable target_x units km format " %7.3f"
         variable target_y units km format " %7.3f"
         variable target_z units m format " %7.1f"
         variable weapon_x units km format " %7.3f"
         variable weapon_y units km format " %7.3f"
         variable weapon_z units m format " %7.1f"
         variable weapon_to_target_range units m format " %7.1f"
      end_items
   end_output

   output
     file fort.fr.6
     event_output true
     summary_output true
   end_output

end_run
```

- **演示要点**：演示 run 的参数：flight_route, output

### service（mechanic）｜

- **关键词**：service, maximum_quantity, service_interval
- **出处**：`logistics/platforms/mechanic.txt:25-28`　（同签名共 2 处，另见 `logistics/platforms/strike_platform.txt:41`）
- **片段**：

```text
         service ENGINE_REPAIR
            maximum_quantity 14
            service_interval 30 min
         end_service
```

- **演示要点**：演示 service 的参数：maximum_quantity, service_interval

### simple_path（simple_flight_path）｜

- **关键词**：simple_path, x
- **出处**：`engage/simple_flight_path.txt:147-149`
- **片段**：

```text
   simple_path
      x 100.0 km y 0.0 m z 30 kft speed 262 kts heading 225.0 deg
   end_simple_path
```

- **演示要点**：演示 simple_path 的参数：x

### sine_pattern（ttr_radar）｜

- **关键词**：sine_pattern, peak_gain, minimum_gain, azimuth_beamwidth, elevation_beamwidth
- **出处**：`aea_iads/sensors/radar/ttr_radar.txt:15-20`　（同签名共 34 处，另见 `aea_iads/weapons/jammer/soj_sband_jammer.txt:17`、`alternate_locations/sensors/radar/ttr_radar.txt:11`、`base_types/sensors/radar/red_missile_seeker_1.txt:23`）
- **片段**：

```text
  sine_pattern
    peak_gain            20 dB
    minimum_gain         -10.0 db
    azimuth_beamwidth    1 deg
    elevation_beamwidth  1 deg
  end_sine_pattern
```

- **演示要点**：演示 sine_pattern 的参数：peak_gain, minimum_gain, azimuth_beamwidth, elevation_beamwidth

### sine_pattern（generic_file_control_radar）｜

- **关键词**：sine_pattern, azimuth_beamwidth, elevation_beamwidth, peak_gain
- **出处**：`shooter/sensors/radar/generic_file_control_radar.txt:12-16`
- **片段**：

```text
  sine_pattern
    azimuth_beamwidth           4.0 deg
    elevation_beamwidth         4.0 deg
    peak_gain           30 dB
  end_sine_pattern
```

- **演示要点**：演示 sine_pattern 的参数：azimuth_beamwidth, elevation_beamwidth, peak_gain

### sine_pattern（alv_jammer）｜

- **关键词**：sine_pattern
- **出处**：`alv_routing/weapons/alv_jammer.txt:15-20`
- **片段**：

```text
      sine_pattern
      peak_gain             10.0 db
      minimum_gain         -20.0 db
      azimuth_beamwidth     20.0 deg
      elevation_beamwidth   20.0 deg
   end_sine_pattern
```

- **演示要点**：演示 sine_pattern（最小结构，无子参数）

### speed_attributes（battle_manager）｜

- **关键词**：speed_attributes, attrib
- **出处**：`iads_c2_demos/processors/battle_manager.txt:31-35`
- **片段**：

```text
         speed_attributes
            attrib slow 0 kts  < 250 kts
            attrib med  250 kts < 600 kts
            attrib fast 600 kts < 2000 kts
         end_speed_attributes
```

- **演示要点**：演示 speed_attributes 的参数：attrib

### speeds（fuel_table_demo）｜

- **关键词**：speeds, units
- **出处**：`example_scripts/fuel_table_demo.txt:56-59`
- **片段**：

```text
         speeds
            units m/s
            100 200 300 400
         end_speeds
```

- **演示要点**：演示 speeds 的参数：units

### system_type_data（repeater_jamming）｜

- **关键词**：system_type_data, jamming_pulse_density, repeater_effect_control_method, gain_control_method, desired_false_target_rcs, repeater_factor_limits, scan_rate_multiplier
- **出处**：`electronic_warfare/repeater_jamming.txt:100-107`　（同签名共 2 处，另见 `electronic_warfare/repeater_jamming.txt:108`）
- **片段**：

```text
                system_type_data default
                   jamming_pulse_density 0.2
                   repeater_effect_control_method repeater
                   gain_control_method desired_rcs
                   desired_false_target_rcs 3.5 m^2
                   repeater_factor_limits  0.01 absolute 1000 absolute
                   scan_rate_multiplier 4
                end_system_type_data
```

- **演示要点**：演示 system_type_data 的参数：jamming_pulse_density, repeater_effect_control_method, gain_control_method, desired_false_target_rcs, repeater_factor_limits, scan_rate_multiplier

### system_type_data（soj_xband_jammer）｜

- **关键词**：system_type_data, jamming_pulse_density, samples_per_detection, minimum_jammer_to_noise_threshold, jammer_gain_table
- **出处**：`electronic_warfare/test_false_targets/weapons/jammer/soj_xband_jammer.txt:87-105`
- **片段**：

```text
              system_type_data default
                 jamming_pulse_density 0.01
                 samples_per_detection 32
                 minimum_jammer_to_noise_threshold 0.0 dB
                 jammer_gain_table
                    jammer_to_noise_ratio 10.0 dB
                       pulse_density_to_jamming_gain 0.05 30.0 dB
                       pulse_density_to_jamming_gain 0.2  15.0 dB
                       pulse_density_to_jamming_gain 0.30  0.0 dB
                    jammer_to_noise_ratio 5.0 dB
                       pulse_density_to_jamming_gain 0.05 20.0 dB
                       pulse_density_to_jamming_gain 0.2  10.0 dB
                       pulse_density_to_jamming_gain 0.30  0.0 dB
                    jammer_to_noise_ratio 0.0 dB
                       pulse_density_to_jamming_gain 0.05 10.0 dB
                       pulse_density_to_jamming_gain 0.2   5.0 dB
                       pulse_density_to_jamming_gain 0.30  0.0 dB
                 end_jammer_gain_table
              end_system_type_data
```

- **演示要点**：演示 system_type_data 的参数：jamming_pulse_density, samples_per_detection, minimum_jammer_to_noise_threshold, jammer_gain_table

### system_type_data（soj_base_jammer）｜

- **关键词**：system_type_data, jamming_pulse_density, minimum_jammer_to_noise_threshold, jammer_gain_table
- **出处**：`aea_iads/weapons/jammer/soj_base_jammer.txt:45-62`　（同签名共 3 处，另见 `alv_routing/weapons/alv_jammer.txt:34`、`electronic_warfare/rpj_jamming.txt:48`）
- **片段**：

```text
         system_type_data default
            jamming_pulse_density 0.15
            minimum_jammer_to_noise_threshold 0.0 dB
            jammer_gain_table
               jammer_to_noise_ratio 10.0 dB
                  pulse_density_to_jamming_gain 0.05 11.0 dB
                   pulse_density_to_jamming_gain 0.2  8.0 dB
                  pulse_density_to_jamming_gain 0.30  0.0 dB
               jammer_to_noise_ratio 5.0 dB
                  pulse_density_to_jamming_gain 0.05 8.0 dB
                  pulse_density_to_jamming_gain 0.2  5.0 dB
                  pulse_density_to_jamming_gain 0.30  0.0 dB
               jammer_to_noise_ratio 0.0 dB
                  pulse_density_to_jamming_gain 0.05 5.0 dB
                  pulse_density_to_jamming_gain 0.2   2.0 dB
                  pulse_density_to_jamming_gain 0.30  0.0 dB
            end_jammer_gain_table
         end_system_type_data
```

- **演示要点**：演示 system_type_data 的参数：jamming_pulse_density, minimum_jammer_to_noise_threshold, jammer_gain_table

### system_type_data（agile_auto-repeater_jamming）｜

- **关键词**：system_type_data, jamming_pulse_density, scan_rate_multiplier
- **出处**：`electronic_warfare/agile_auto-repeater_jamming.txt:99-102`　（同签名共 16 处，另见 `electronic_warfare/agile_auto-repeater_jamming.txt:103`、`electronic_warfare/agile_repeater_jamming-rt1.txt:97`、`electronic_warfare/agile_repeater_jamming-rt1.txt:101`）
- **片段**：

```text
                system_type_data default
                   jamming_pulse_density 0.2
                   scan_rate_multiplier 2.0
                end_system_type_data
```

- **演示要点**：演示 system_type_data 的参数：jamming_pulse_density, scan_rate_multiplier

### test_guidance（simple-icbm）｜

- **关键词**：test_guidance, guidance_group, body_yaw_rate, body_pitch_rate, body_roll_rate, switch_at_time_sec, body_roll_to_tgt_az, local_pitch_program, local_pitch_angle, local_roll_angle
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:925-1017`
- **片段**：

```text
      test_guidance

#       guidance_ballistic_file   data/TestTrajectoryOutput.dat

        guidance_group           Liftoff
          body_yaw_rate          0.0
          body_pitch_rate        0.0
          body_roll_rate         0.0
          switch_at_time_sec     1.0   RollProg
        end_guidance_group

        guidance_group           RollProg
          body_roll_to_tgt_az
          body_yaw_rate          0.0
          body_pitch_rate        0.0
          switch_at_time_sec     2.0   Stage1PitchProg
        end_guidance_group

        guidance_group           Stage1PitchProg
          local_pitch_program
            #Time         PitchAng(deg)
            0.0           90.0
            10.0          70.0
            45.0          30.0
            70.0          30.0
          end_local_pitch_program
          body_yaw_rate          0.0
          body_roll_rate         0.0
          switch_at_time_sec     100.0   Stage2PitchProg
        end_guidance_group

# 60.37 sec nominal burn time
# 65.69 sec nominal burn time
# 61.2 sec nominal burn time

        guidance_group           Stage2PitchProg
          local_pitch_program
            #Time         PitchAng(deg)
            0.0           30.0
            40.0          17.0
            80.0          17.0
          end_local_pitch_program
          body_yaw_rate          0.0
          body_roll_rate         0.0
          switch_at_time_sec     100.0   Stage3PitchProg
        end_guidance_group

        guidance_group           Stage3PitchProg

          local_pitch_program
            #Time         PitchAng(deg)
            0.0           16.8
            45.0          16.8
            70.0          16.8
          end_local_pitch_program

    terminate_thrust_by_cmd

          body_yaw_rate          0.0
          body_roll_rate         0.0
          switch_at_time_sec     100.0   PointDownProg
        end_guidance_group

        guidance_group           PBVPitchProg
          local_pitch_program
            #Time         PitchAng(deg)
            0.0           10.0
            10.0          -80.0
            20.0          -80.0
          end_local_pitch_program

          body_yaw_rate          0.0
          body_roll_rate         0.0
          switch_at_time_sec     20.0   Coast
        end_guidance_group

        guidance_group           PointDownProg
          local_pitch_angle        -80.0
          local_roll_angle         0.0
          switch_at_time_sec     6.0   Coast
        end_guidance_group

        guidance_group           Coast
          body_yaw_rate          0.0
          body_pitch_rate        0.0
          body_roll_rate         0.0
        end_guidance_group

# 60.37 sec nominal burn time
# 65.69 sec nominal burn time
# 61.2 sec nominal burn time

      end_test_guidance
```

- **演示要点**：演示 test_guidance 的参数：guidance_group, body_yaw_rate, body_pitch_rate, body_roll_rate, switch_at_time_sec, body_roll_to_tgt_az, local_pitch_program, local_pitch_angle, local_roll_angle

### time_of_flight_values（blue_sr_a2a_ir_missile_ata_launch_computer_alt10kft_0.6mach）｜

- **关键词**：time_of_flight_values
- **出处**：`base_types/weapons/aam/blue_sr_a2a_ir_missile_ata_launch_computer_alt10kft_0.6mach.txt:39-76`　（同签名共 3 处，另见 `behavior_tree/weapons/aam/blue_sr_a2a_ir_missile_ata_launch_computer_alt10kft_0.6mach.txt:40`、`wargame/weapons/aam/aam_ata_launch_computer.txt:38`）
- **片段**：

```text
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
```

- **演示要点**：演示 time_of_flight_values（最小结构，无子参数）

### transactor（receiver_definition）｜

- **关键词**：transactor, is_requestor, container_name, hook_to_fuel, exclusive_hook_to_fuel, hook_to_payload, proximity_limit
- **出处**：`exchange_proc/receiver_definition.txt:31-42`
- **片段**：

```text
      transactor fuel_receiver

         is_requestor
         container_name fuel_and_receive_tank

         hook_to_fuel                  true   # This flag would be applicable to the _receiver's_ processor.
         exclusive_hook_to_fuel        true
         hook_to_payload               false  # As transactions are completed, the exchanged quantity
                                              # is DECREMENTED from the payload attribute of the platform.
         proximity_limit             400 m    # If the transacting platforms are more than this distance apart,
                                              # the transaction will not be allowed to take place.
      end_transactor
```

- **演示要点**：演示 transactor 的参数：is_requestor, container_name, hook_to_fuel, exclusive_hook_to_fuel, hook_to_payload, proximity_limit

### transactor（tanker_definition）｜

- **关键词**：transactor, is_offeror, container_name, hook_to_fuel, hook_to_payload, exclusive_hook_to_payload, proximity_limit
- **出处**：`exchange_proc/tanker_definition.txt:31-43`
- **片段**：

```text
      transactor fuel_provider

         is_offeror
         container_name payload_and_supply_tank

         hook_to_fuel                  false  # This flag would be applicable to the _receiver's_ processor.
         hook_to_payload                true  # As transactions are completed, the exchanged quantity
                                              # is DECREMENTED from the payload attribute of the platform.
         exclusive_hook_to_payload      true

         proximity_limit                500 m # If the transacting platforms are more than this distance apart,
                                              # the transaction will not be allowed to take place.
      end_transactor
```

- **演示要点**：演示 transactor 的参数：is_offeror, container_name, hook_to_fuel, hook_to_payload, exclusive_hook_to_payload, proximity_limit

### transactor（logistics_platform）｜

- **关键词**：transactor, container_name, is_offeror, continue_to_offer, proximity_limit, time_out_clock_interval
- **出处**：`logistics/platforms/logistics_platform.txt:356-364`　（同签名共 2 处，另见 `logistics/platforms/logistics_platform.txt:379`）
- **片段**：

```text
      transactor fuel_offering_transactor
         container_name fuel_container
         is_offeror
         continue_to_offer      true
         proximity_limit         100 m     # If the transacting platforms are more than this distance apart,
                                           # the transaction will not be allowed to take place.
         #maximum_mass_rate  xx.0 kg/sec   # Derived types must set values in this!
         time_out_clock_interval  3.0 sec
      end_transactor
```

- **演示要点**：演示 transactor 的参数：container_name, is_offeror, continue_to_offer, proximity_limit, time_out_clock_interval

### transactor（logistics_platform）｜

- **关键词**：transactor, container_name, is_receiver, proximity_limit, time_out_clock_interval
- **出处**：`logistics/platforms/logistics_platform.txt:366-373`　（同签名共 2 处，另见 `logistics/platforms/logistics_platform.txt:389`）
- **片段**：

```text
      transactor fuel_requesting_transactor
         container_name fuel_container
         is_receiver
         proximity_limit          100 m    # If the transacting platforms are more than this distance apart,
                                           # the transaction will not be allowed to take place.
         #maximum_mass_rate  xx.0 kg/sec    # Derived types must set values in this!
         time_out_clock_interval  3.0 sec
      end_transactor
```

- **演示要点**：演示 transactor 的参数：container_name, is_receiver, proximity_limit, time_out_clock_interval

### uniform_pattern（generic_bomber_radar）｜

- **关键词**：uniform_pattern, peak_gain, azimuth_beamwidth, elevation_beamwidth
- **出处**：`base_types/sensors/radar/generic_bomber_radar.txt:52-56`　（同签名共 7 处，另见 `suppressor/platforms/sam_regiment.txt:16`、`suppressor/platforms/sam_regiment.txt:24`、`suppressor/sensors/radar/bomber_radar.txt:14`）
- **片段**：

```text
  uniform_pattern
    peak_gain             20 db
    azimuth_beamwidth     360 degrees
    elevation_beamwidth   180 degrees
  end_uniform_pattern
```

- **演示要点**：演示 uniform_pattern 的参数：peak_gain, azimuth_beamwidth, elevation_beamwidth

### uniform_pattern（ew_radar）｜

- **关键词**：uniform_pattern, peak_gain, beamwidth
- **出处**：`aea_iads/sensors/radar/ew_radar.txt:26-29`　（同签名共 27 处，另见 `chaff/chaff_example.txt:129`、`cyber/exfiltrate_demo/sensors/radar/ew_radar.txt:26`、`electronic_warfare/agile_auto-repeater_jamming.txt:126`）
- **片段**：

```text
  uniform_pattern
     peak_gain  0 dB
     beamwidth 360 deg
  end_uniform_pattern
```

- **演示要点**：演示 uniform_pattern 的参数：peak_gain, beamwidth

### uniform_pattern（blue_ew_radar_1）｜

- **关键词**：uniform_pattern, peak_gain
- **出处**：`base_types/sensors/radar/blue_ew_radar_1.txt:11-13`　（同签名共 9 处，另见 `electronic_warfare/comm_jamming.txt:226`、`satellite_demos/patterns/uniformPattern.txt:10`、`satellite_demos/platforms/comsat_satellite.txt:15`）
- **片段**：

```text
  uniform_pattern
    peak_gain 37.92 db               # From www.fas.org
  end_uniform_pattern
```

- **演示要点**：演示 uniform_pattern 的参数：peak_gain

### uniform_pattern（comm_jamming）｜

- **关键词**：uniform_pattern
- **出处**：`electronic_warfare/comm_jamming.txt:75-77`
- **片段**：

```text
   uniform_pattern
   peak_gain 10 dB
end_uniform_pattern
```

- **演示要点**：演示 uniform_pattern（最小结构，无子参数）

### unit（basic_formation）｜

- **关键词**：unit, member_platform, offset
- **出处**：`p6dof/basic_formation.txt:78-81`　（同签名共 4 处，另见 `p6dof/formation_tanking.txt:79`、`p6dof/formation_tanking.txt:84`、`p6dof/formation_tanking.txt:89`）
- **片段**：

```text
   unit two
      member_platform beta
      offset 20 m 135.0 deg 0 m welded_wing
   end_unit
```

- **演示要点**：演示 unit 的参数：member_platform, offset

### visual_part · WSF_VISUAL_PART｜

- **关键词**：visual_part, WSF_VISUAL_PART, yaw, azimuth_slew_limits, elevation_slew_limits
- **出处**：`space_operations/platforms/starlink.txt:56-60`　（同签名共 4 处，另见 `space_operations/platforms/starlink.txt:68`、`space_operations/platforms/starlink.txt:79`、`space_operations/platforms/starlink.txt:90`）
- **片段**：

```text
   visual_part crosslink1 WSF_VISUAL_PART
      yaw 0 deg
      azimuth_slew_limits -80 deg 80 deg
      elevation_slew_limits -80 deg 80 deg
   end_visual_part
```

- **演示要点**：演示 WSF_VISUAL_PART 的参数：yaw, azimuth_slew_limits, elevation_slew_limits

### visual_part · WSF_VISUAL_PART｜

- **关键词**：visual_part, WSF_VISUAL_PART, pitch, azimuth_slew_limits, elevation_slew_limits
- **出处**：`space_operations/platforms/starlink.txt:102-106`　（同签名共 2 处，另见 `space_operations/platforms/uplink.txt:27`）
- **片段**：

```text
   visual_part downlink WSF_VISUAL_PART
      pitch -90 deg
      azimuth_slew_limits -80 deg 80 deg
      elevation_slew_limits -80 deg 45 deg
   end_visual_part
```

- **演示要点**：演示 WSF_VISUAL_PART 的参数：pitch, azimuth_slew_limits, elevation_slew_limits

### visual_part · WSF_VISUAL_PART｜

- **关键词**：visual_part, WSF_VISUAL_PART, yaw, pitch
- **出处**：`satellite_demos/5th_iridium_flares_demo.txt:265-268`　（同签名共 4 处，另见 `satellite_demos/5th_iridium_flares_demo.txt:269`、`satellite_demos/5th_iridium_flares_demo.txt:273`、`satellite_demos/5th_iridium_flares_demo.txt:277`）
- **片段**：

```text
   visual_part MMA1 WSF_VISUAL_PART
      yaw 0 deg
      pitch 50 deg
   end_visual_part
```

- **演示要点**：演示 WSF_VISUAL_PART 的参数：yaw, pitch

### visual_part · WSF_VISUAL_PART｜

- **关键词**：visual_part, WSF_VISUAL_PART, pitch
- **出处**：`space_operations/attitude_control.txt:91-93`
- **片段**：

```text
   visual_part solar_panels WSF_VISUAL_PART
      pitch 90 degrees
   end_visual_part
```

- **演示要点**：演示 WSF_VISUAL_PART 的参数：pitch

### visual_part · WSF_VISUAL_PART｜

- **关键词**：visual_part, WSF_VISUAL_PART
- **出处**：`visual_part/red_tank.txt:17-18`　（同签名共 2 处，另见 `visual_part/red_tank.txt:20`）
- **片段**：

```text
   visual_part turret WSF_VISUAL_PART
   end_visual_part
```

- **演示要点**：演示 WSF_VISUAL_PART（最小结构，无子参数）

### wsf_weapon_server（j11_out）｜

- **关键词**：wsf_weapon_server, outgoing_weapon_server, outgoing_weapon_type
- **出处**：`l16_j11/j11_out.txt:101-105`
- **片段**：

```text
wsf_weapon_server
#   debug
   outgoing_weapon_server  10.0.234.59 3456  // ipconfig Ethernet:IPv4 Address
   outgoing_weapon_type    NE_SR_A2A_IR
end_wsf_weapon_server
```

- **演示要点**：演示 wsf_weapon_server 的参数：outgoing_weapon_server, outgoing_weapon_type

### wsf_weapon_server（j11_in）｜

- **关键词**：wsf_weapon_server, port
- **出处**：`l16_j11/j11_in.txt:74-77`
- **片段**：

```text
wsf_weapon_server
#   debug
   port 3456
end_wsf_weapon_server
```

- **演示要点**：演示 wsf_weapon_server 的参数：port
