# 处理器 / 航迹 / 滤波

> **来源**：AFSIM 2.9.0 官方 demo 集（`demos/`，4,751 个 `.txt`，132 万行）
> **性质**：原文摘抄，未改写。同一「参数签名」只保留 1 条代表，并注明出现次数与另见位置
> **警示**：片段中数值为 demo 原值，**仅供语法参考，不得直接复用**；依赖 `common/` 数据表的片段须另行提供
> **检索**：按命令 / 类型名 / 参数名搜本卷；总表见 `90-tokens.md`

### assets（conus_zone_coverage）｜

- **关键词**：assets, platform_type
- **出处**：`coverage_demos/coverage_grids/conus_zone_coverage.txt:26-28`　（同签名共 4 处，另见 `coverage_demos/coverage_grids/global_lat_lon_coverage.txt:29`、`coverage_demos/coverage_grids/state_zone_lat_lon_grid_coverage.txt:38`、`coverage_demos/coverage_grids/geo_belt_grid_coverage.txt:29`）
- **片段**：

```text
   assets
      platform_type SAT sat_geosensor
   end_assets
```

- **演示要点**：演示 assets 的参数：platform_type

### assets（existing_grid_coverage）｜

- **关键词**：assets, platform
- **出处**：`coverage_demos/coverage_grids/existing_grid_coverage.txt:29-31`　（同签名共 2 处，另见 `coverage_demos/coverage_grids/uav_stepped_grid_coverage.txt:27`）
- **片段**：

```text
   assets
      platform ground_station ground_sensor
   end_assets
```

- **演示要点**：演示 assets 的参数：platform

### cancelation_ratios（ew_radar）｜

- **关键词**：cancelation_ratios, jammer_to_noise, saturation_ratio
- **出处**：`aea_iads/sensors/radar/ew_radar.txt:44-49`
- **片段**：

```text
         cancelation_ratios
            jammer_to_noise         0.0 db   0.0 db
            jammer_to_noise        15.0 db  10.0 db
            jammer_to_noise        30.0 db  20.0 db
            saturation_ratio       10.0 dB
         end_cancelation_ratios
```

- **演示要点**：演示 cancelation_ratios 的参数：jammer_to_noise, saturation_ratio

### cancellation_ratios（jam_strobe_tracking）｜

- **关键词**：cancellation_ratios, jammer_to_noise, saturation_ratio
- **出处**：`electronic_warfare/jam_strobe_tracking.txt:127-132`　（同签名共 5 处，另见 `electronic_warfare/pol_mod_jamming.txt:141`、`electronic_warfare/slc_slb_script_jamming.txt:168`、`electronic_warfare/spot_jamming.txt:111`）
- **片段**：

```text
               cancellation_ratios
                  jammer_to_noise   0.0 db  0.0 db
                  jammer_to_noise  15.0 db 10.0 db
                  jammer_to_noise  30.0 db 20.0 db
                  saturation_ratio 10.0 dB
               end_cancellation_ratios
```

- **演示要点**：演示 cancellation_ratios 的参数：jammer_to_noise, saturation_ratio

### category（hel_test）｜

- **关键词**：category, minimum_energy, damage_radius, minimum_energy_density
- **出处**：`hel/hel_test.txt:146-151`
- **片段**：

```text
   category AIRCRAFT
     minimum_energy 10 kj
     damage_radius 2 cm
     minimum_energy_density 1.0 kj/cm^2
     damage_radius 1.0 cm
   end_category
```

- **演示要点**：演示 category 的参数：minimum_energy, damage_radius, minimum_energy_density

### category（ground_hel_vs_hypersonic）｜

- **关键词**：category, minimum_energy_density, damage_radius
- **出处**：`hel/ground_hel_vs_hypersonic.txt:26-29`
- **片段**：

```text
   category HYPERSONIC
      minimum_energy_density 5 kj/cm^2
      damage_radius 20 cm
   end_category
```

- **演示要点**：演示 category 的参数：minimum_energy_density, damage_radius

### filter（ssm_missile）｜滤波器

- **关键词**：filter, range_measurement_sigma, bearing_measurement_sigma, elevation_measurement_sigma, 滤波器
- **出处**：`new_guidance/weapons/ssm/ssm_missile.txt:188-192`　（同签名共 2 处，另见 `ship_ad/weapons/ssm/ssm_missile.txt:95`）
- **片段**：

```text
      filter FILTER_TACTICS
         range_measurement_sigma 0.5 m
         bearing_measurement_sigma 0.1 deg
         elevation_measurement_sigma 0.1 deg
      end_filter
```

- **演示要点**：演示 filter 的参数：range_measurement_sigma, bearing_measurement_sigma, elevation_measurement_sigma

### filter · WSF_KALMAN_FILTER｜滤波器

- **关键词**：filter, WSF_KALMAN_FILTER, range_measurement_sigma, elevation_measurement_sigma, bearing_measurement_sigma, 滤波器
- **出处**：`base_types/sensors/radar/generic_radar_10nm.txt:248-253`　（同签名共 22 处，另见 `suppressor/sensors/radar/sam_radar.txt:58`、`swarm/platforms/uhf_ew_radar_sensor_platform.txt:11`、`alternate_locations/platforms/common.txt:38`）
- **片段**：

```text
  filter WSF_KALMAN_FILTER
    range_measurement_sigma     1 m
    elevation_measurement_sigma 0.001 deg
    bearing_measurement_sigma   0.001 deg
    process_noise_sigmas_XYZ    1.0 1.0 1.0
  end_filter
```

- **演示要点**：演示 WSF_KALMAN_FILTER 的参数：range_measurement_sigma, elevation_measurement_sigma, bearing_measurement_sigma

### filter · WSF_ALPHA_BETA_FILTER｜滤波器

- **关键词**：filter, WSF_ALPHA_BETA_FILTER, alpha, beta, 滤波器
- **出处**：`alv_routing/sensors/ew_radar.txt:51-54`　（同签名共 18 处，另见 `base_types/sensors/radar/blue_a2a_radar.txt:184`、`base_types/sensors/radar/generic_fire_control_radar.txt:257`、`base_types/sensors/radar/generic_ground_radar.txt:194`）
- **片段**：

```text
  filter WSF_ALPHA_BETA_FILTER
    alpha  0.6
    beta   0.2
  end_filter
```

- **演示要点**：演示 WSF_ALPHA_BETA_FILTER 的参数：alpha, beta

### filter · WSF_KALMAN_FILTER｜滤波器

- **关键词**：filter, WSF_KALMAN_FILTER, process_noise_model, 滤波器
- **出处**：`air_to_air/platforms/lte_fighter.txt:211-214`　（同签名共 6 处，另见 `air_to_air/platforms/lte_fighter.txt:322`、`air_to_air/sensors/radar/long_range.txt:116`、`base_types/weapons/sam/blue_lr_sam_complex.txt:56`）
- **片段**：

```text
      filter WSF_KALMAN_FILTER
         process_noise_model      constant_velocity
         process_noise_sigmas_XYZ 2 2 2          # AFSIM recommended values for high agility aircraft
      end_filter
```

- **演示要点**：演示 WSF_KALMAN_FILTER 的参数：process_noise_model

### filter（commander_track_manager）｜滤波器

- **关键词**：filter, 滤波器
- **出处**：`aea_iads/processors/commander_track_manager.txt:16-17`　（同签名共 2 处，另见 `shooter/sensors/radar/aa_mrm_radar.txt:71`）
- **片段**：

```text
  filter FILTER_TACTICS
   end_filter
```

- **演示要点**：演示 filter（最小结构，无子参数）

### filter · WSF_ALPHA_BETA_FILTER｜滤波器

- **关键词**：filter, WSF_ALPHA_BETA_FILTER, 滤波器
- **出处**：`base_types/sensors/esm_rwr/generic_esm.txt:123-126`　（同签名共 3 处，另见 `base_types/sensors/esm_rwr/generic_esm_sensor.txt:123`、`outer_air_battle/sensors/esm_rwr/generic_esm_sensor.txt:125`）
- **片段**：

```text
  filter WSF_ALPHA_BETA_FILTER
  alpha 0.4
  beta  0.1
  end_filter
```

- **演示要点**：演示 WSF_ALPHA_BETA_FILTER（最小结构，无子参数）

### fusion_method（ssn_laydown）｜

- **关键词**：fusion_method, number_of_angle_measurements
- **出处**：`space_operations/scenarios/ssn_laydown.txt:49-52`
- **片段**：

```text
      fusion_method orbit_determination
         process_noise_sigmas_XYZ 0.1 0.1 0.1
         number_of_angle_measurements 8
      end_fusion_method
```

- **演示要点**：演示 fusion_method 的参数：number_of_angle_measurements

### fusion_method（commander_track_manager）｜

- **关键词**：fusion_method
- **出处**：`aea_iads/processors/commander_track_manager.txt:13-14`　（同签名共 6 处，另见 `air_to_air/platforms/brawler_test.txt:111`、`air_to_air/platforms/brawler_test.txt:135`、`air_to_air/platforms/brawler_test.txt:448`）
- **片段**：

```text
   fusion_method weighted_average
   end_fusion_method
```

- **演示要点**：演示 fusion_method（最小结构，无子参数）

### heat_map（flight_lead）｜

- **关键词**：heat_map, position, grid_extent, cell_size, sensor_range, heading_change_limit, use_asset_perception, heat_decay, decay_interval, expansion_timeout, draw_grid, draw_heat, draw_sensor_outline
- **出处**：`heatmap/platforms/flight_lead.txt:56-71`　（同签名共 2 处，另见 `heatmap/platforms/striker_pursuit.txt:99`）
- **片段**：

```text
      heat_map
       position 16:18:00.00s 50:41:00.00e altitude 30000.00 ft
       grid_extent 200 km
       cell_size 5 km
       sensor_range 60 nm
       heading_change_limit 5 deg
       use_asset_perception on # Use subordinate asset radar to "clear"
       heat_decay 0.2
       decay_interval 30 sec
       expansion_timeout 5 min
       # Commands that control drawing
       # activate to see representation of the grid
       draw_grid on
       draw_heat on
       draw_sensor_outline on
     end_heat_map
```

- **演示要点**：演示 heat_map 的参数：position, grid_extent, cell_size, sensor_range, heading_change_limit, use_asset_perception, heat_decay, decay_interval, expansion_timeout, draw_grid

### intercept_results（blue_sr_a2a_ir_missile_ata_launch_computer_alt10kft_0.6mach）｜

- **关键词**：intercept_results, number_of_aspect_angle_bins, azimuth_bin_count_and_limit, elevation_bin_count_min_and_max_limits, range_rate_bin_count_min_and_max_limits, firing_range_bin_count_and_values, time_of_flight_values
- **出处**：`base_types/weapons/aam/blue_sr_a2a_ir_missile_ata_launch_computer_alt10kft_0.6mach.txt:24-77`　（同签名共 3 处，另见 `behavior_tree/weapons/aam/blue_sr_a2a_ir_missile_ata_launch_computer_alt10kft_0.6mach.txt:25`、`wargame/weapons/aam/aam_ata_launch_computer.txt:23`）
- **片段**：

```text
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
```

- **演示要点**：演示 intercept_results 的参数：number_of_aspect_angle_bins, azimuth_bin_count_and_limit, elevation_bin_count_min_and_max_limits, range_rate_bin_count_min_and_max_limits, firing_range_bin_count_and_values, time_of_flight_values

### intercept_results（mrm_launch_computer_table.1.1）｜

- **关键词**：intercept_results, include
- **出处**：`air_to_air/weapons/aam/mrm_launch_computer_table.1.1.txt:32-34`　（同签名共 2 处，另见 `air_to_air/weapons/aam/srm_launch_computer_table.1.1.txt:32`）
- **片段**：

```text
   intercept_results
      include mrm_launch_computer_results.1.1.txt
   end_intercept_results
```

- **演示要点**：演示 intercept_results 的参数：include

### line_of_sight_manager（multi_thread）｜

- **关键词**：line_of_sight_manager, multi_thread, maximum_location_change
- **出处**：`aea_iads/multi_thread.txt:15-19`　（同签名共 2 处，另见 `iads/multi_thread.txt:15`）
- **片段**：

```text
line_of_sight_manager
   multi_thread
   maximum_location_change 2500.0 m
   #debug_thread
end_line_of_sight_manager
```

- **演示要点**：演示 line_of_sight_manager 的参数：multi_thread, maximum_location_change

### multiresolution_processor · WSF_MULTIRESOLUTION_PROCESSOR｜

- **关键词**：multiresolution_processor, WSF_MULTIRESOLUTION_PROCESSOR, model
- **出处**：`multiresolution_demos/processors/processor_include.txt:92-103`　（同签名共 2 处，另见 `multiresolution_demos/processors/processor_include.txt:12`）
- **片段**：

```text
multiresolution_processor MR_TASK_PROCESSOR WSF_MULTIRESOLUTION_PROCESSOR
   model low_fidelity_model
      fidelity_range 0.0 0.5
      processor LOW_FIDELITY_TASK_PROCESSOR
      end_processor
   end_model
   model hight_fidelity_model
      fidelity_range 0.5 1.0
      processor HIGH_FIDELITY_TASK_PROCESSOR
      end_processor
   end_model
end_multiresolution_processor
```

- **演示要点**：演示 WSF_MULTIRESOLUTION_PROCESSOR 的参数：model

### processor · WSF_SA_PROCESSOR｜处理器

- **关键词**：processor, WSF_SA_PROCESSOR, on, update_interval, include, flight_id, id_flag, joker_fuel, bingo_fuel, report_interval, engagement_data_update_interval, flight_data_update_interval, fuel_data_update_interval, nav_data_update_interval, 处理器
- **出处**：`air_to_air/platforms/brawler_test.txt:166-280`　（同签名共 2 处，另见 `air_to_air/platforms/brawler_test.txt:301`）
- **片段**：

```text
   processor assessment WSF_SA_PROCESSOR 
      on
#     update_interval 0.1 sec
      update_interval 1.0 sec

      //This includes the following blocks/scripts: 
      // script_variables, on_initialize, on_update, BogieBanditConsiderationScoring, CalculateRiskPosedByEntity, CalculateDefensivenessInducedByEntity, 
      // CalculateUrgencyInducedByEntity, CalcRisk, CalcSelfRisk, CalcFlightRisk, CalcPackageRisk, CalcMissionRisk, CalcDefensiveness, 
      // CalcUrgency, CalcWeaponSupport, CalculateThreatLevel, CalculateTargetValue,   
      include processors/assessment_scripts.txt
      
      # Flight Information
      flight_id  1
      id_flag    1
      
      # Joker/Bingo Fuel States
      joker_fuel 4000 lbs
      bingo_fuel 3000 lbs
      
#       filter_assets_from_bogies false
#       filter_assets_from_tracks false         
      
      # Data collection rates
      report_interval                              1.00 sec
      engagement_data_update_interval              1.00 sec
      flight_data_update_interval                  1.00 sec
      fuel_data_update_interval                    1.00 sec
      nav_data_update_interval                     1.00 sec
      flight_controls_data_update_interval         1.00 sec
      weapons_data_update_interval                 1.00 sec
      track_data_update_interval                   1.00 sec
      asset_data_update_interval                   1.00 sec
      perceived_item_data_update_interval          1.00 sec
      prioritized_item_data_update_interval        1.00 sec      
      perceived_item_calculation_update_interval   1.00 sec
      prioritized_item_calculation_update_interval 1.00 sec      
      
      enemy_side     red
      enemy_type     RED_STRIKER
      friendly_type  BLUE_STRIKER

      max_range_for_perceived_assets              150 nm
      max_range_for_perceived_bogies_and_bandits  150 nm
      max_range_for_engagement_data               200 nm
      assumed_range_for_angle_only_targets        150 nm      
      
      #filter_requires_same_side
      #filter_requires_not_same_side          true
      filter_requires_air_domain              true
      #filter_requires_not_air_domain         true
      #filter_requires_land_or_surface_domain true
      #filter_requires_not_subsurface_domain  true
      #filter_requires_not_space_domain       true
      filter_requires_sa_processor            true

      report_to commander    via datalink
      report_to peers        via datalink
      report_to subordinates via datalink

      # Assets/friends settings
      asset_perception           truth commander:peers:subordinates
      perceive_self              false
      reporting_self             true
      reporting_others           true
      max_asset_load             100

      # Bogie and bandit/threat settings
      max_threat_load            100
      
      # Expendable countermeasures
      use_simple_countermeasures true
      num_chaff                  60
      num_flares                 40
      num_decoys                 20  

      advanced_behavior_tree
         btt on
         #EZJA tactic set implementaion plan, emulates our RULES structure and call tree
         sequence 
            behavior_node rultype //select which RULES type I want

            # *******  PHASE CHANGING LOGIC ********

            selector # execute chosen RULES type
               behavior_node ftr_rules  // brawler rules
               behavior_node route_rules // follow a wsf_route
               behavior_node orbit_rules // cap
               behavior_node intercept_rules // intercept a task track
            end_selector

            selector
//             if rule_type == ftr, these nodes are used
               behavior_node ingress
               behavior_node direct
               behavior_node vectoring
               behavior_node sam_vctr
               behavior_node crank
               behavior_node reaction
               behavior_node pump
               behavior_node pump_in
               behavior_node merge
               behavior_node egress
            end_selector

            # *******  WEAPON EMPLOYMENT DECISION ********

            sequence  # weapon logic
               behavior_node select_wpn     // pair a weapon w/ target track
               behavior_node shoot_it       // loop through shoot list, fire weapon if proper conditions are met
               behavior_node sam_shoot_it   // fire weapon against SAMs if proper conditions are met
            end_sequence
         end_sequence 
      end_advanced_behavior_tree   

   end_processor
```

- **演示要点**：演示 WSF_SA_PROCESSOR 的参数：on, update_interval, include, flight_id, id_flag, joker_fuel, bingo_fuel, report_interval, engagement_data_update_interval, flight_data_update_interval

### processor · WSF_SA_PROCESSOR｜处理器

- **关键词**：processor, WSF_SA_PROCESSOR, on, update_interval, joker_fuel, bingo_fuel, behavior_calculation_update_interval, report_interval, engagement_data_update_interval, flight_data_update_interval, fuel_data_update_interval, nav_data_update_interval, flight_controls_data_update_interval, weapons_data_update_interval, 处理器
- **出处**：`six_dof/processors/sa.txt:11-55`
- **片段**：

```text
processor GENERAL_ASSESSMENT WSF_SA_PROCESSOR
   on
   
   update_interval 0.05 sec
   
   # Joker/Bingo Fuel States
   joker_fuel 4000 lbs      
   bingo_fuel 3000 lbs      
   
   # Data collection rates
   behavior_calculation_update_interval         3.00 sec
   report_interval                              1.00 sec
   engagement_data_update_interval              0.10 sec
   flight_data_update_interval                  0.05 sec
   fuel_data_update_interval                    1.00 sec
   nav_data_update_interval                     1.00 sec
   flight_controls_data_update_interval         0.10 sec
   weapons_data_update_interval                 0.50 sec
   track_data_update_interval                   0.10 sec
   asset_data_update_interval                   0.50 sec
   perceived_item_data_update_interval          0.20 sec
   prioritized_item_data_update_interval        1.00 sec      
   perceived_item_calculation_update_interval   0.20 sec
   prioritized_item_calculation_update_interval 1.00 sec      
   
   max_range_for_perceived_assets              2000 nm
   max_range_for_perceived_bogies_and_bandits  2000 nm
   max_range_for_engagement_data               2000 nm
   assumed_range_for_angle_only_targets        1400 nm      
   
   filter_requires_air_domain              true
   filter_requires_sa_processor            true

   # Assets/friends settings
   asset_perception           truth commander:peers:subordinates
   #asset_perception          status_messages
   perceive_self              false
   reporting_self             true
   reporting_others           true
   max_asset_load             100

   # Bogie and bandit/threat settings
   max_threat_load            100
   
end_processor
```

- **演示要点**：演示 WSF_SA_PROCESSOR 的参数：on, update_interval, joker_fuel, bingo_fuel, behavior_calculation_update_interval, report_interval, engagement_data_update_interval, flight_data_update_interval, fuel_data_update_interval, nav_data_update_interval

### processor · WSF_PERCEPTION_PROCESSOR｜处理器

- **关键词**：processor, WSF_PERCEPTION_PROCESSOR, on, script_debug_writes, reporting_self, reporting_others, report_interval, report_to, asset_perception, asset_update_interval, max_asset_load, threat_update_interval, max_threat_load, heat_map, 处理器
- **出处**：`heatmap/platforms/flight_lead.txt:43-72`
- **片段**：

```text
   processor perception WSF_PERCEPTION_PROCESSOR
      on
      #update_interval 10 sec
      script_debug_writes      on
      reporting_self           true
      reporting_others         true
      report_interval          10  sec
      report_to commander      via cmdr_net
      asset_perception         status_messages
      asset_update_interval     5 sec
      max_asset_load           10
      threat_update_interval    5 sec
      max_threat_load          10
      heat_map
       position 16:18:00.00s 50:41:00.00e altitude 30000.00 ft
       grid_extent 200 km
       cell_size 5 km
       sensor_range 60 nm
       heading_change_limit 5 deg
       use_asset_perception on # Use subordinate asset radar to "clear"
       heat_decay 0.2
       decay_interval 30 sec
       expansion_timeout 5 min
       # Commands that control drawing
       # activate to see representation of the grid
       draw_grid on
       draw_heat on
       draw_sensor_outline on
     end_heat_map
   end_processor
```

- **演示要点**：演示 WSF_PERCEPTION_PROCESSOR 的参数：on, script_debug_writes, reporting_self, reporting_others, report_interval, report_to, asset_perception, asset_update_interval, max_asset_load, threat_update_interval

### processor · WSF_PERCEPTION_PROCESSOR｜处理器

- **关键词**：processor, WSF_PERCEPTION_PROCESSOR, on, script_debug_writes, update_interval, threat_update_interval, heat_map, position, grid_extent, cell_size, sensor_range, heading_change_limit, use_asset_perception, heat_decay, 处理器
- **出处**：`heatmap/platforms/striker_pursuit.txt:94-115`
- **片段**：

```text
   processor perception WSF_PERCEPTION_PROCESSOR
      on
      script_debug_writes  off
      update_interval 3 sec        # required to update heat map, default of 5 if not specified
      threat_update_interval 3 sec # required to update heat map, default of 5 if not specified
      heat_map
       position 16:18:00.00s 50:50:00.00e altitude 30000.00 ft
       grid_extent 100 km
       cell_size 2 km
       sensor_range 30 nm
       heading_change_limit 5 deg
       use_asset_perception off # Only using own radar
       heat_decay 0.2
       decay_interval 10 sec
       expansion_timeout 120 sec
       # Commands that control drawing
       # activate to see representation of the grid
       draw_grid off
       draw_heat on
       draw_sensor_outline off
     end_heat_map
   end_processor
```

- **演示要点**：演示 WSF_PERCEPTION_PROCESSOR 的参数：on, script_debug_writes, update_interval, threat_update_interval, heat_map, position, grid_extent, cell_size, sensor_range, heading_change_limit

### processor · WSF_PERCEPTION_PROCESSOR｜处理器

- **关键词**：processor, WSF_PERCEPTION_PROCESSOR, on, script_debug_writes, reporting_self, reporting_others, report_interval, report_to, asset_perception, asset_update_interval, max_asset_load, threat_update_interval, max_threat_load, 处理器
- **出处**：`behavior_tree/platforms/flight_lead.txt:42-55`　（同签名共 5 处，另见 `route_finder_demos/platforms/flight_lead.txt:35`、`timeline/platforms/flight_lead.txt:47`、`timeline_lead/platforms/flight_lead.txt:46`）
- **片段**：

```text
   processor perception WSF_PERCEPTION_PROCESSOR
      on
      script_debug_writes      off
      reporting_self           true
      reporting_others         true
      report_interval          10  sec
     #report_to commander:peers via sub_net
      report_to commander      via cmdr_net
      asset_perception         status_messages
      asset_update_interval     5 sec
      max_asset_load           10
      threat_update_interval    5 sec
      max_threat_load          10
   end_processor
```

- **演示要点**：演示 WSF_PERCEPTION_PROCESSOR 的参数：on, script_debug_writes, reporting_self, reporting_others, report_interval, report_to, asset_perception, asset_update_interval, max_asset_load, threat_update_interval

### processor · WSF_ORBITAL_CONJUNCTION_PROCESSOR｜处理器

- **关键词**：processor, WSF_ORBITAL_CONJUNCTION_PROCESSOR, on, update_interval, search_interval, filter_cut_distance, search_step_size, exclusion_factor, default_variance, default_object_size, prediction_model, primary, script, 处理器
- **出处**：`space_operations/scenarios/ssn_laydown.txt:85-111`
- **片段**：

```text
   processor conj WSF_ORBITAL_CONJUNCTION_PROCESSOR
      on
      update_interval 10 min
      search_interval 3 hr
      filter_cut_distance 10.0 km
      search_step_size 1 deg
      exclusion_factor 10.0
      default_variance 100.0 m
      default_object_size 5.0 m
      prediction_model default
      primary
         primary
      end_primary

      script void on_conjunction_predicted(Array<WsfOrbitalConjunctionReport> aReports)
         for (int i = 0; i < aReports.Size(); i += 1)
         {
            writeln("Possible Conjunction:");
            writeln("   Between: ", aReports[i].Primary(), " and ", aReports[i].Secondary());
            writeln("   Max. Probability: ", aReports[i].MaximumProbability());
            writeln("   Miss Distance: ", aReports[i].MissDistance(), " [m]");
            writeln("   Relative Velocity: ", aReports[i].RelativeVelocity(), " [m/s]");
            writeln("   Times: (", aReports[i].StartTime(), ", ", aReports[i].EndTime(), ")");
            writeln("   Closest Approach Time: ", aReports[i].MinimumTime());
         }
      end_script
   end_processor
```

- **演示要点**：演示 WSF_ORBITAL_CONJUNCTION_PROCESSOR 的参数：on, update_interval, search_interval, filter_cut_distance, search_step_size, exclusion_factor, default_variance, default_object_size, prediction_model, primary

### processor · WSF_TASK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TASK_PROCESSOR, script_variables, int, script, bool, for, return, evaluation_interval, time_to_evaluate, state, next_state, 处理器
- **出处**：`suppressor/platforms/sam_regiment.txt:53-143`
- **片段**：

```text
  processor thinker WSF_TASK_PROCESSOR
    //show_state_transitions
    //show_task_messages

    script_variables
      int maxSubsAssigned = 1;
      int maxSubOngoingAssignments = 1;
    end_script_variables

    // script to determine if sub is operational
    script bool SubOperational(WsfPlatform aSub)
      bool operational = false;
      int numWeapons = aSub.WeaponCount();
      for (int i=0; i < numWeapons; i=i+1)
      {
        if (aSub.WeaponEntry(i).IsOperational())
        {
          operational=true;
          break;
        }
      }
      return operational;
    end_script

    evaluation_interval DETECTED 14.92537 sec      // (1/0.067)
    time_to_evaluate    DETECTED 0.1 sec
    state DETECTED
      next_state ASSIGNED
        if (TRACK.IFF_Friend() ||
            (TRACK.Type() != "BOMBER")) return false;

        Array<WsfPlatform> filter2 = Array<WsfPlatform>();
        Array<WsfPlatform> filter3 = Array<WsfPlatform>();

        foreach (WsfPlatform sub in PLATFORM.Subordinates("red-net"))
        {
          if (SubOperational(sub) &&
              (TasksAssignedTo(sub) < maxSubOngoingAssignments) &&
              TRACK.WithinZoneOf(sub, "sam_zone") &&
              (sub.RelativeHeadingOf(TRACK) < 68.754935) &&
              (sub.GroundRangeTo(TRACK) < 45000))
          {
            if ((sub.GroundRangeTo(TRACK) < 30000) &&
                (TasksAssignedFor(TRACK.TrackId(), "Engage") < maxSubsAssigned))
            {
              filter3.PushBack(sub);
            }
            else
            {
              filter2.PushBack(sub);
            }
          }
        }

        bool assigned = false;
        foreach (WsfPlatform sub in filter3)
        {
          if (TasksAssignedFor(TRACK.TrackId()," Engage") >= maxSubsAssigned) break;
          if (AssignTask(TRACK, "Engage", sub, "red-net")) assigned = true;
        }
        foreach (WsfPlatform sub in filter2)
        {
          if (TasksAssignedFor(TRACK.TrackId(), "Engage") >= maxSubsAssigned) break;
          if (AssignTask(TRACK, "Engage", sub, "red-net")) assigned = true;
        }

        return assigned;
      end_next_state
    end_state

    evaluation_interval ASSIGNED 14.92537 sec      // (1/0.067)
    time_to_evaluate    ASSIGNED 0.1 sec
    state ASSIGNED
      next_state DETECTED
        WsfPlatform sub = AssigneeForTask(TRACK.TrackId(), "Engage");
        if (sub.IsValid())
        {
            if ((! SubOperational(sub))                    ||
                (! TRACK.WithinZoneOf(sub, "sam_zone"))    ||
                (sub.RelativeHeadingOf(TRACK) > 114.59156) ||
                (sub.GroundRangeTo(TRACK) > 50000))
            {
              CancelTask(sub, TRACK.TrackId(), "Engage");
            }
        }
        // return to DETECTED state if no assignments for the track.
        return (TasksAssignedFor(TRACK.TrackId(), "Engage") == 0);
      end_next_state
    end_state

  end_processor
```

- **演示要点**：演示 WSF_TASK_PROCESSOR 的参数：script_variables, int, script, bool, for, return, evaluation_interval, time_to_evaluate, state, next_state

### processor · WSF_QUANTUM_TASKER_PROCESSOR｜处理器

- **关键词**：processor, WSF_QUANTUM_TASKER_PROCESSOR, script_variables, script, script_debug_writes, update_interval, asset_representation, reallocation_strategy, generator, evaluator, allocator, allocator_extra_assets, 处理器
- **出处**：`base_types/processors/timeline_agents/flight_lead_timeline_tasks_from_data.txt:10-121`　（同签名共 3 处，另见 `brawler/platforms/flight_lead.txt:41`、`heatmap/processors/quantum_agents/aifl/fl_quantum_tasker_simple.txt:15`）
- **片段**：

```text
processor FLIGHT_LEAD_DATA WSF_QUANTUM_TASKER_PROCESSOR

   script_variables
      #########################################################################
      ## for evaluating weapon tasks
      Map<string,int> mKnownTargetTypes = Map<string,int>();
      mKnownTargetTypes["STRIKER"]      = 1;
      mKnownTargetTypes["BLUE_STRIKER"] = 1;
      mKnownTargetTypes["RED_STRIKER"]  = 1;
      #########################################################################
      double FSR  = 30 * MATH.M_PER_NM();
      double DOR  = 20 * MATH.M_PER_NM();
      double MAR  = 10 * MATH.M_PER_NM();
      string RISK = "LOW";
      bool mStaticRiskLevel = true;
   end_script_variables

   #on_initialize
   #end_on_initialize

   script Array<WsfQuantumTask> FlightLeadTaskGeneration (Array<WsfLocalTrack> TRACKS, Array<WsfAssetPerception> ASSETS )
      Array<WsfQuantumTask> tasks = Array<WsfQuantumTask>();

      extern Map<int, int> mGrinderPairings;
      mGrinderPairings.Clear();

      #if its us, then create weapon tasks for enemy tracks
      for (int i=0; i<TRACKS.Size(); i=i+1)
      {
         WsfLocalTrack lt = TRACKS.Get(i);
         if (lt.IsValid() && (!lt.SideValid() || lt.Side() != PLATFORM.Side()))
         {
            if (mKnownTargetTypes.Size() <= 0 || mKnownTargetTypes.Exists(lt.TargetType()))
            {

               #WsfQuantumTask task = WsfQuantumTask.Construct(1.0, "TIMELINE");
               #task.SetUniqueId(lt.TargetIndex());   #use this for now, use cluster Id later
               #WsfQuantumTask task = WsfQuantumTask.Construct(1.0, "TIMELINE", lt);
               Array<WsfTrack> targets = Array<WsfTrack>();
               targets.PushBack(WsfTrack(lt));

               WsfQuantumTask task = WsfQuantumTask.Construct(1.0, "TIMELINE");
               task.UniqueId(lt.TargetIndex());   #use this for now, use cluster Id later
               task.SetAuxData("targets",targets);
               task.SetAuxData("FSR",FSR);
               task.SetAuxData("DOR",DOR);
               task.SetAuxData("MAR",MAR);
               task.SetAuxData("RISK",RISK);

               tasks.PushBack(task);
               writeln_d("timeline task generated for: ", lt.TargetName(), ", updated time: ", lt.UpdateTime());

               # Generate a second timeline task for support
               WsfQuantumTask taskSup = WsfQuantumTask.Construct(1.0, "TIMELINE");
               taskSup.UniqueId(lt.TargetIndex() + 123456);   //use this for now, use cluster Id later
               taskSup.SetAuxData("targets",targets);
               taskSup.SetAuxData("FSR",FSR);
               taskSup.SetAuxData("DOR",DOR);
               taskSup.SetAuxData("MAR",MAR);
               taskSup.SetAuxData("RISK",RISK);

               tasks.PushBack(taskSup);
               writeln_d("timeline support task generated for: ", lt.TargetName(), ", updated time: ", lt.UpdateTime());

               # Map task IDs to platforms doing grinder can look each other up
               mGrinderPairings.Set(lt.TargetIndex(), lt.TargetIndex() + 123456);
               mGrinderPairings.Set(lt.TargetIndex() + 123456, lt.TargetIndex());
            }
         }
      }
      return tasks;
   end_script


   script double FlightLeadEvaluation ( WsfQuantumTask TASK, WsfAssetPerception ASSET)
      writeln_d(PLATFORM.Name(), " evaluating task type ", TASK.TaskType());
      #TODO - include weapon capability in evaluation
      #       for now: just base value on range
      if (TASK.TaskType() == "TIMELINE")
      {
         Array<WsfTrack> targets = (Array<WsfTrack>)TASK.AuxDataObject("targets");
         if (targets.Size() > 0)
         {
            WsfTrack target = targets.Get(0);
            writeln_d("evaluating timeline task on: ", target.TargetName(), ", updated time: ", target.UpdateTime());
            double value = 1.0 / target.GroundRangeTo(ASSET.Location());
            return value;
         }
      }
      return 0;
   end_script

  #show_task_messages
   script_debug_writes    off
   update_interval        10.0 sec
   asset_representation   platform
  #reallocation_strategy  event
   reallocation_strategy  dynamic
   generator              custom          FlightLeadTaskGeneration
   evaluator              custom          FlightLeadEvaluation

#  #allocator              greedy_isolated type   TIMELINE
#  #allocator              greedy_isolated
#  #allocator_extra_tasks  optimal_profit
#   allocator              optimal_profit  type   TIMELINE
#   allocator_extra_assets optimal_profit  type   TIMELINE
#   allocator              greedy_isolated
   allocator              optimal_profit
   allocator_extra_assets optimal_profit


end_processor
```

- **演示要点**：演示 WSF_QUANTUM_TASKER_PROCESSOR 的参数：script_variables, script, script_debug_writes, update_interval, asset_representation, reallocation_strategy, generator, evaluator, allocator, allocator_extra_assets

### processor · WSF_QUANTUM_TASKER_PROCESSOR｜处理器

- **关键词**：processor, WSF_QUANTUM_TASKER_PROCESSOR, script_variables, script, on_initialize, reallocation_strategy, generator, evaluator, allocator, allocator_extra_assets, update_interval, 处理器
- **出处**：`base_types/platforms/brawler/brawler_flight_lead.txt:29-70`　（同签名共 2 处，另见 `brawler/platforms/brawler_flight_lead.txt:36`）
- **片段**：

```text
   processor task_mgr WSF_QUANTUM_TASKER_PROCESSOR
      script_variables
         ## for evaluating weapon tasks
         Map<string,int> mKnownTargetTypes = Map<string,int>();
         mKnownTargetTypes["BRAWLER_PLATFORM"] = 1;
      end_script_variables

      script Array<WsfTask> FlightLeadTaskGeneration (Array<WsfLocalTrack> TRACKS, Array<WsfAssetPerception> ASSETS )
         Array<WsfTask> tasks = Array<WsfTask>();
         //if its us, then create weapon tasks for enemy tracks
         writeln_d("TRACKS.Size() = ", TRACKS.Size(), ", ASSETS.Size() = ", ASSETS.Size());
         for (int i=0; i<TRACKS.Size(); i=i+1)
         {
            WsfLocalTrack lt = TRACKS.Get(i);
            if (lt.IsValid() && (!lt.SideValid() || lt.Side() != PLATFORM.Side()))
            {
               if (mKnownTargetTypes.Size() <= 0 || mKnownTargetTypes.Exists(lt.TargetType()))
               {
                  WsfTask task = WsfTask.Construct(1.0, "WEAPON", lt);
                  task.SetTaskType("WEAPON");
                  tasks.PushBack(task);
                  writeln_d("weapon task generated for: ", lt.TargetName(), ", updated time: ", lt.UpdateTime());
               }
            }
         }
         return tasks;
      end_script

      on_initialize
      end_on_initialize

      #debug
      #script_debug_writes on
      #show_task_messages
      reallocation_strategy dynamic
      generator custom FlightLeadTaskGeneration
      evaluator distance
     #allocator greedy_isolated
      allocator optimal_profit
      allocator_extra_assets optimal_profit   #assigns tasks to extra blue guys
      update_interval 0.3 sec
   end_processor
```

- **演示要点**：演示 WSF_QUANTUM_TASKER_PROCESSOR 的参数：script_variables, script, on_initialize, reallocation_strategy, generator, evaluator, allocator, allocator_extra_assets, update_interval

### processor · WSF_QUANTUM_TASKER_PROCESSOR｜处理器

- **关键词**：processor, WSF_QUANTUM_TASKER_PROCESSOR, script_variables, script, update_interval, asset_representation, reallocation_strategy, generator, evaluator, allocator, allocator_extra_assets, 处理器
- **出处**：`timeline_lead/processors/quantum_agents/aifl/fl_quantum_tasker.txt:12-79`　（同签名共 2 处，另见 `behavior_tree/processors/quantum_agents/aifl/fl_quantum_tasker_simple.txt:15`）
- **片段**：

```text
processor FL_QUANTUM_TASKER WSF_QUANTUM_TASKER_PROCESSOR

   script_variables
      #########################################################################
      ## for evaluating weapon tasks
      Map<string,int> mKnownTargetTypes = Map<string,int>();
      mKnownTargetTypes["BLUE_STRIKER"] = 1;
      mKnownTargetTypes["RED_STRIKER"]  = 1;
#      mKnownTargetTypes["STRIKER"] = 1;
#      mKnownTargetTypes["UCAV"]    = 1;
#      mKnownTargetTypes["SOJ"]     = 1;
      #########################################################################
   end_script_variables

   #on_initialize
   #end_on_initialize

   script Array<WsfQuantumTask> FlightLeadTaskGeneration (Array<WsfLocalTrack> TRACKS, Array<WsfAssetPerception> ASSETS )
      Array<WsfQuantumTask> tasks = Array<WsfQuantumTask>();
      //if its us, then create weapon tasks for enemy tracks
      for (int i=0; i<TRACKS.Size(); i=i+1)
      {
         WsfLocalTrack lt = TRACKS.Get(i);
         if (lt.IsValid() && (!lt.SideValid() || lt.Side() != PLATFORM.Side()))
         {
            if (mKnownTargetTypes.Size() <= 0 || mKnownTargetTypes.Exists(lt.TargetType()))
            {
               WsfQuantumTask task = WsfQuantumTask.Construct(1.0, "WEAPON", lt);
               task.SetTaskType("WEAPON");
               tasks.PushBack(task);
               writeln_d("weapon task generated for: ", lt.TargetName(), ", updated time: ", lt.UpdateTime());
            }
         }
      }
      return tasks;
   end_script


   script double FlightLeadEvaluation ( WsfQuantumTask TASK, WsfAssetPerception ASSET)
      writeln_d(PLATFORM.Name(), " evaluating task type ", TASK.TaskType());
      #TODO - include weapon capability in evaluation
      #       for now: just base value on range
      WsfTrack track = PLATFORM.MasterTrackList().FindTrack(TASK.TrackId());
      if (TASK.TaskType() == "WEAPON" && TASK.ResourceIsWeapon() && track.IsValid())
      {
         writeln_d("evaluating weapon task: ", track.TargetName(), ", updated time: ", track.UpdateTime());
         double value = 1.0 / track.SlantRangeTo(ASSET.Location());
         return value;
      }
      else
      {
         return 0;
      }
   end_script

  #show_task_messages
  #script_debug_writes    off
   update_interval        10.0 sec
   asset_representation   platform
   reallocation_strategy  dynamic
  #update_assignments
   generator              custom          FlightLeadTaskGeneration
   evaluator              custom          FlightLeadEvaluation
   allocator              optimal_profit  type   WEAPON
  #allocator_extra_tasks  optimal_profit
   allocator_extra_assets optimal_profit

end_processor
```

- **演示要点**：演示 WSF_QUANTUM_TASKER_PROCESSOR 的参数：script_variables, script, update_interval, asset_representation, reallocation_strategy, generator, evaluator, allocator, allocator_extra_assets

### processor · WSF_TASK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TASK_PROCESSOR, int, string, if, return, bool, else, foreach, for, next_state, 处理器
- **出处**：`shooter/platforms/awacs.txt:62-169`　（同签名共 2 处，另见 `laser_designator/platforms/soldier_jtac.txt:39`）
- **片段**：

```text
   processor CMDR_TASK_MGR WSF_TASK_PROCESSOR
   number_of_servers            5

   track_update_interval        10.0 sec

   #script_debug_writes true
   #show_state_transitions
   #show_task_messages

   script_variables
      int MAX_SUBS_PER_TARGET     = 2;
      int MAX_ASSIGNMENTS_PER_SUB = 4;
      string WEAPON_NAME          = "aa_mrm";
   end_script_variables

   // determine if TRACK is assignable
   script bool IsAssignable()
      if ((! TRACK.IFF_Friend()) &&
          (TRACK.TimeSinceUpdated() < 30.0))
      {
         return true;
      }

      return false;
   end_script

   // determine if the subordinate and/or his subordinates have weapons
   // remaining
   script bool WeaponsAvailable(WsfPlatform aAssignee)
      bool weaponsAvailable = false;

      int quantity = 0;
      WsfWeapon weapon = aAssignee.Weapon(WEAPON_NAME);
      if (weapon.IsTurnedOn())
      {
         quantity = quantity + weapon.QuantityRemaining();
      }
      if (quantity > 0)
      {
         weaponsAvailable = true;
      }
      else
      {
         foreach (WsfPlatform sub in aAssignee.Subordinates())
         {
            weapon = sub.Weapon(WEAPON_NAME);
            if (weapon.IsTurnedOn())
            {
               quantity = quantity + weapon.QuantityRemaining();
            }
         }

         if (quantity > 0) weaponsAvailable = true;
      }

      return weaponsAvailable;
   end_script

   script void MakeAssignments()
      Array<WsfPlatform> filter = Array<WsfPlatform>();
      foreach (WsfPlatform sub in PLATFORM.Subordinates())
      {
         if (sub.Type() == "JET_AIRCRAFT")
         {
            if (WeaponsAvailable(sub) &&
                (TasksAssignedTo(sub) < MAX_ASSIGNMENTS_PER_SUB) &&
                (TasksAssignedTo(sub, TRACK.TrackId()) < 1))
            {
               writeln_d("*** Adding ", sub.Name(), " to filter");
               filter.PushBack(sub);
            }
         }
      }

      int i;
      int numAssignments = (int)MATH.Min(filter.Size(), MAX_SUBS_PER_TARGET);
      for (int i=0; i < numAssignments; i = i + 1)
      {
         AssignTask(TRACK, "ENGAGE", filter[i]);
      }
   end_script

# -------------------------------------------------------------------------

   evaluation_interval DETECTED 10.0 sec
   state DETECTED
      next_state ASSIGNED
         if (! IsAssignable()) return false;

         MakeAssignments();
         return true;
      end_next_state
   end_state

   evaluation_interval ASSIGNED 10.0 sec
   state ASSIGNED
      next_state DETECTED
         if (! IsAssignable())
         {
            CancelTask(TRACK.TrackId());
            return true;
         }
         MakeAssignments();
         return false;
      end_next_state
   end_state

end_processor
```

- **演示要点**：演示 WSF_TASK_PROCESSOR 的参数：int, string, if, return, bool, else, foreach, for, next_state

### processor · WSF_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TRACK_PROCESSOR, purge_interval, report_to, report_interval, fused_track_reporting, raw_track_reporting, update_interval, script_variables, script, on_update, 处理器
- **出处**：`bearing_only/platforms/fuser_platform1.txt:37-148`
- **片段**：

```text
  processor fuser WSF_TRACK_PROCESSOR
    purge_interval       60 sec
    report_to commander via cmdr_net
    report_interval      10 sec
    fused_track_reporting off
    raw_track_reporting   on
    update_interval 10 sec
    script_variables
       string sensor1name = "bearing_sensor_01";
       string sensor2name = "bearing_sensor_02";
       string TargetName;
    end_script_variables

    script bool is_track_reportable(WsfTrack aTrack)
       //writeln("***** ", aTrack.TrackId(), " ", aTrack.LocationValid());
       return aTrack.LocationValid();
    end_script

    on_update
        WsfLocalTrackList localtracklist = PLATFORM.MasterTrackList();
        WsfTrackList        rawtracklist =  PLATFORM.MasterRawTrackList();
        WsfTrack            FusedTrack;
        double              sensor1bearing;
        double              sensor2bearing;
        double              normal1bearing;
        double              normal2bearing;
        double              sensor1elevation;
        double              sensor2elevation;
        WsfPlatform sensor1 = WsfSimulation.FindPlatform(sensor1name);
        WsfPlatform sensor2 = WsfSimulation.FindPlatform(sensor2name);
        double separation = sensor1.GroundRangeTo(sensor2);

       if (localtracklist.Count() > 0)
       {
          foreach (WsfTrack rawtrack in rawtracklist)
          {
            if (rawtrack.IsValid())
            {

               TargetName = rawtrack.TargetName();
               #writeln(TIME_NOW, "  RTrack platform name is ", rawtrack.TargetName());
               #Now set the two bearing sensors bearing reports
               if((rawtrack.OriginatorName() == sensor1name) )
               {
                  FusedTrack = WsfTrack(rawtrack); # we are going to copy this and update the location
                  sensor1bearing = rawtrack.Bearing(); # -180 to 180
                  normal1bearing = Math.NormalizeAngle0_360(sensor1bearing); # gives 0 to 360 angle
                  if(normal1bearing <= 90)
                  {
                     normal1bearing = 90 - normal1bearing;
                  }
                  if(normal1bearing >= 90)
                  {
                     normal1bearing = 180 - normal1bearing;
                  }
                  sensor1elevation = rawtrack.Elevation();
               }
               if((rawtrack.OriginatorName() == sensor2name) )
               {
                  sensor2bearing = rawtrack.Bearing();
                  normal2bearing = Math.NormalizeAngle0_360(sensor2bearing);
                  if(normal2bearing >= 270)
                  {
                     normal2bearing = 90 - (360 - normal2bearing);
                  }
               }
            }

             # This determines the range from a line between the two sensors perpendicular to the target
             double targetRangeP = separation * (MATH.Sin(normal1bearing) * MATH.Sin(normal2bearing)) / Math.Sin(normal1bearing + normal2bearing) * 0.985;
             # Now compute the range from sensor1
             double targetRange = targetRangeP / MATH.Sin(normal1bearing);
             WsfGeoPoint ComputedTrackLocation = PLATFORM.Location();
             ComputedTrackLocation.Extrapolate(sensor1bearing, targetRange);
             double ComputedTrackAltitude = targetRange / Math.Tan(90 - sensor1elevation) * 1.2; #1.22 is visual line of site curvature
             ComputedTrackLocation.SetAltitudeAGL(ComputedTrackAltitude);
             # Get rid of edge cases along 0 and 90 degrees
             if((targetRange > 20) && (ComputedTrackAltitude > 20)
                                  && (normal1bearing != 0)
                                  && (normal2bearing != 0)
                                  && (normal1bearing >= 2)
                                  && (normal2bearing <= 88))
             {
                #writeln(TIME_NOW, " Target Range is ", targetRange);
                WsfPlatform TargetPlatform =  WsfSimulation.FindPlatform("target1");
                double ErrorFromTargetTruth = TargetPlatform.SlantRangeTo(ComputedTrackLocation);
                string writeline = write_str(" Target Range is ", targetRange, " Target Alt is ", ComputedTrackAltitude, " TrackError is ", ErrorFromTargetTruth);
                PLATFORM.Comment(writeline);
                #writeln("Altitude of target is ", ComputedTrackAltitude);
                WsfDraw aDraw = WsfDraw(); # Make a draw object
                aDraw.SetColor(1, 0, 0, 1);
                aDraw.BeginIcons(rawtrack.Heading(), "wedge");
                aDraw.Vertex(rawtrack.ReportedLocation());
                aDraw.End();
                #Now make the updated FusedTrack
                FusedTrack.SetOriginator(PROCESSOR);
                FusedTrack.SetCurrentLocation(ComputedTrackLocation); # Now a 3d track
                #writeln("#### ",TIME_NOW, " Target Speed ", FusedTrack.Speed());
                Vec3 WCSvelocity = FusedTrack.Target().VelocityWCS();
                FusedTrack.SetVelocityWCS(WCSvelocity.X(), WCSvelocity.Y(), WCSvelocity.Z());
                #writeln("##### ",TIME_NOW, " Target Speed ", FusedTrack.Speed());
                #writeln(TIME_NOW, " Track Range is ", PLATFORM.DownRangeTo(FusedTrack));
                #writeln(TIME_NOW, "  FTrack Range is ", FusedTrack.Range());
                FusedTrack.SetRange(PLATFORM.DownRangeTo(FusedTrack));
                #writeln(TIME_NOW, "  FTrack Velocityvalidity is ", FusedTrack.VelocityValid());
             }
          }
          if(FusedTrack.IsValid())
          PLATFORM.TrackManager().AddTrackReport(FusedTrack);
       }
    end_on_update
  end_processor
```

- **演示要点**：演示 WSF_TRACK_PROCESSOR 的参数：purge_interval, report_to, report_interval, fused_track_reporting, raw_track_reporting, update_interval, script_variables, script, on_update

### processor · WSF_TASK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TASK_PROCESSOR, weapon_uplink_path, script, bool, if, return, evaluation_interval, time_to_evaluate, state, next_state, 处理器
- **出处**：`suppressor/platforms/sam_battery.txt:44-187`
- **片段**：

```text
  processor thinker WSF_TASK_PROCESSOR
    //show_state_transitions
    //show_task_messages

    weapon_uplink_path sam_radar weapon-uplink

    // Assign a tracking sensor
    script bool AcquireTarget()
      bool trackBlocksRemaining=false;
      WsfSensor sensor = PLATFORM.Sensor("sam_radar");
      if (sensor.IsOperational())
      {
        if ((sensor.ActiveRequestCount() < sensor.MaximumRequestCount()) ||
            sensor.HaveRequestFor(TRACK.TrackId()))
        {
          trackBlocksRemaining = StartTracking(TRACK, "Track", sensor, "");
        }
      }
      return trackBlocksRemaining;
    end_script

    // Check to see if should cancel all tasks
    script bool ShouldICancel()
      bool shouldCancel=false;
      if (TRACK.IFF_Friend()                                    ||
          (PLATFORM.Weapon("missile").QuantityRemaining() == 0) ||
          (! TRACK.WithinZoneOf(PLATFORM, "sam_zone"))          ||
          (PLATFORM.GroundRangeTo(TRACK) > 50000))
      {
        shouldCancel = true;
      }
      return shouldCancel;
    end_script

    // ************************************************************************

    // ASSIGNED is the initial state and the state where tracks reside
    // until they are determined to be of interest.
    evaluation_interval ASSIGNED 20.0 sec
    time_to_evaluate    ASSIGNED 0.1 sec
    state ASSIGNED
      next_state ASSIGNED
        if (ShouldICancel())
        {
          // cancel any tasks I have assigned this track
          CancelTask(TRACK.TrackId(), "");

          // if I received an assignment for this track the inform
          // commander what I've done
          if (TasksReceivedFor(TRACK.TrackId(), "Engage") != 0)
          {
            //TaskComplete(TRACK.TrackId(), "Engage");
          }
          return true;
        }
        return false;
      end_next_state

      next_state ENGAGEABLE
        return (TasksReceivedFor(TRACK.TrackId()) != 0);
      end_next_state
    end_state


    // target is now engageable
    evaluation_interval ENGAGEABLE 20.0 sec
    time_to_evaluate    ENGAGEABLE 0.1 sec

    state ENGAGEABLE
      next_state CANCELED
        return ((TasksReceivedFor(TRACK.TrackId(), "Engage") == 0) ||
                ShouldICancel());
      end_next_state

      next_state ENGAGED
        double relTgtAlt = PLATFORM.RelativeAltitudeOf(TRACK);
        if ((relTgtAlt > 50)                         &&
            (relTgtAlt < 15000)                      &&
            (PLATFORM.GroundRangeTo(TRACK) < 45000))
        {
          // give tracking radar task to begin tracking target
          AcquireTarget();
          return true;
        }
        return false;
      end_next_state
    end_state


    // engaging target; waiting to fire

    evaluation_interval ENGAGED 20.0 sec
    time_to_evaluate    ENGAGED 0.1 sec

    state ENGAGED
      next_state CANCELED
        return ((TasksReceivedFor(TRACK.TrackId(), "Engage") == 0) ||
                ShouldICancel());
      end_next_state

      next_state LAUNCHED
        WsfWeapon weapon = PLATFORM.Weapon("missile");
        double relTgtAlt = PLATFORM.RelativeAltitudeOf(TRACK);

        bool firedWeapon = false;
        if ((weapon.QuantityRemaining() > 0)               &&
            (relTgtAlt > 50)                               &&
            (relTgtAlt < 15000)                            &&
            (PLATFORM.GroundRangeTo(TRACK) < 45000)        &&
            (PLATFORM.RelativeHeadingOf(TRACK) > 95))
        {
          weapon.CueToTrack(TRACK);
          firedWeapon = weapon.FireSalvo(TRACK, 2);
        }

        return firedWeapon;
      end_next_state
    end_state


    evaluation_interval LAUNCHED 20.0 sec
    time_to_evaluate    LAUNCHED 0.1 sec

//TODO-may need to go to CANCELED instead of ASSIGNED so the sensor is dropped???
    state LAUNCHED
      next_state ASSIGNED
//        return (TasksReceivedFor(TRACK.TrackId(), "Engaged") == 0);
         return (WeaponsActiveFor(TRACK.TrackId()) < 1);
      end_next_state
    end_state


    evaluation_interval CANCELED 1 min
    time_to_evaluate    CANCELED 0.001 sec

    state CANCELED
      next_state ASSIGNED
        // cancel any tasks I have assigned this track
        CancelTask(TRACK.TrackId(), "");
        return true;
      end_next_state
    end_state

  end_processor
```

- **演示要点**：演示 WSF_TASK_PROCESSOR 的参数：weapon_uplink_path, script, bool, if, return, evaluation_interval, time_to_evaluate, state, next_state

### processor · WSF_WEAPON_FUSE｜处理器

- **关键词**：processor, WSF_WEAPON_FUSE, on, gross_update_interval, fine_update_interval, time_of_flight_to_arm, gross_proximity_range, maximum_time_of_flight, detonate_below_height_agl, detonate_below_height_msl, 处理器
- **出处**：`p6dof/platforms/agm-mrc.txt:55-64`　（同签名共 11 处，另见 `p6dof/platforms/gbu-500.txt:51`、`p6dof/platforms/ubu-500-hd.txt:41`、`p6dof/platforms/ubu-500-ld.txt:41`）
- **片段**：

```text
   processor fuse WSF_WEAPON_FUSE
      on
      gross_update_interval        0.02 sec
      fine_update_interval         0.01 sec
      time_of_flight_to_arm        1.00 sec
      gross_proximity_range      100.00 ft
      maximum_time_of_flight    7200.00 sec
      detonate_below_height_agl   40.00 ft
      detonate_below_height_msl   50.00 ft
   end_processor
```

- **演示要点**：演示 WSF_WEAPON_FUSE 的参数：on, gross_update_interval, fine_update_interval, time_of_flight_to_arm, gross_proximity_range, maximum_time_of_flight, detonate_below_height_agl, detonate_below_height_msl

### processor · WSF_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TRACK_PROCESSOR, master_track_processor, purge_interval, report_interval, unchanged_track_reporting, circular_report_rejection, internal_link, report_fused_tracks, report_to, 处理器
- **出处**：`air_to_air/platforms/brawler_test.txt:116-132`　（同签名共 2 处，另见 `air_to_air/platforms/brawler_test.txt:453`）
- **片段**：

```text
   processor data_mgr WSF_TRACK_PROCESSOR 
      master_track_processor 
      purge_interval  60 sec
      report_interval 10.0 sec 
      unchanged_track_reporting false   #TEST
      circular_report_rejection enable
#      report_raw_tracks 
      internal_link tsk_mgr
      report_fused_tracks 
#      report_to command_chain IFLITE commander via datalink
#      report_to command_chain IFLITE peers via datalink
#      report_to command_chain IFLITE subordinates via datalink
      report_to commander via datalink
      report_to subordinates via datalink
      report_to peers via datalink
      report_to subordinates via wpn_datalink to uplink
   end_processor
```

- **演示要点**：演示 WSF_TRACK_PROCESSOR 的参数：master_track_processor, purge_interval, report_interval, unchanged_track_reporting, circular_report_rejection, internal_link, report_fused_tracks, report_to

### processor · WSF_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TRACK_PROCESSOR, non_master_track_processor, purge_interval, update_interval, report_interval, drop_after_inactive, report_fused_tracks, internal_link, track_manager, 处理器
- **出处**：`air_to_air/platforms/brawler_test.txt:434-451`
- **片段**：

```text
   processor raw_data_mgr WSF_TRACK_PROCESSOR
      non_master_track_processor 
      purge_interval  60 sec
      update_interval 2.0 sec
      report_interval 2.0 sec 
      drop_after_inactive 30 sec
      
#      unchanged_track_reporting false   #TEST
#      report_raw_tracks 
      report_fused_tracks
#      circular_report_rejection enable
      internal_link data_mgr
      // fuze my own ship tracks, link to master track processor
      track_manager 
         fusion_method weighted_average       
         end_fusion_method
      end_track_manager
   end_processor
```

- **演示要点**：演示 WSF_TRACK_PROCESSOR 的参数：non_master_track_processor, purge_interval, update_interval, report_interval, drop_after_inactive, report_fused_tracks, internal_link, track_manager

### processor · WSF_QUANTUM_TASKER_PROCESSOR｜处理器

- **关键词**：processor, WSF_QUANTUM_TASKER_PROCESSOR, script_variables, script, update_interval, asset_representation, reallocation_strategy, generator, evaluator, allocator, 处理器
- **出处**：`timeline/processors/quantum_agents/aifl/fl_quantum_tasker.txt:12-76`　（同签名共 4 处，另见 `route_finder_demos/processors/quantum_agents/aifl/fl_quantum_tasker.txt:12`、`behavior_tree/processors/quantum_agents/aifl/fl_quantum_tasker_super_simple.txt:12`、`behavior_tree/processors/quantum_agents/aifl/fl_quantum_tasker_very_simple.txt:13`）
- **片段**：

```text
processor FL_QUANTUM_TASKER WSF_QUANTUM_TASKER_PROCESSOR

   script_variables
      #########################################################################
      ## for evaluating weapon tasks
#      Map<string,int> mKnownTargetTypes = Map<string,int>();
#      mKnownTargetTypes["STRIKER"] = 1;
#      mKnownTargetTypes["UCAV"]    = 1;
#      mKnownTargetTypes["SOJ"]     = 1;
      #########################################################################
   end_script_variables

   #on_initialize
   #end_on_initialize

   script Array<WsfQuantumTask> FlightLeadTaskGeneration (Array<WsfLocalTrack> TRACKS, Array<WsfAssetPerception> ASSETS )
      Array<WsfQuantumTask> tasks = Array<WsfQuantumTask>();
      //if its us, then create weapon tasks for enemy tracks
      for (int i=0; i<TRACKS.Size(); i=i+1)
      {
         WsfLocalTrack lt = TRACKS.Get(i);
         if (lt.IsValid() && (!lt.SideValid() || lt.Side() != PLATFORM.Side()))
         {
            #if (mKnownTargetTypes.Size() <= 0 || mKnownTargetTypes.Exists(lt.TargetType()))
            {
               WsfQuantumTask task = WsfQuantumTask.Construct(1.0, "WEAPON", lt);
               task.SetTaskType("WEAPON");
               tasks.PushBack(task);
               writeln_d("weapon task generated for: ", lt.TargetName(), ", updated time: ", lt.UpdateTime());
            }
         }
      }
      return tasks;
   end_script


   script double FlightLeadEvaluation ( WsfQuantumTask TASK, WsfAssetPerception ASSET)
      writeln_d(PLATFORM.Name(), " evaluating task type ", TASK.TaskType());
      #TODO - include weapon capability in evaluation
      #       for now: just base value on range
      WsfTrack track = PLATFORM.MasterTrackList().FindTrack(TASK.TrackId());
      if (TASK.TaskType() == "WEAPON" && TASK.ResourceIsWeapon() && track.IsValid())
      {
         writeln_d("evaluating weapon task: ", track.TargetName(), ", updated time: ", track.UpdateTime());
         double value = 1.0 / track.SlantRangeTo(ASSET.Location());
         return value;
      }
      else
      {
         return 0;
      }
   end_script

  #show_task_messages
  #script_debug_writes    off
   update_interval        10.0 sec
   asset_representation   platform
   reallocation_strategy  dynamic
   generator              custom          FlightLeadTaskGeneration
   evaluator              custom          FlightLeadEvaluation
   allocator              optimal_profit  type   WEAPON
  #allocator_extra_tasks  optimal_profit
  #allocator_extra_assets optimal_profit

end_processor
```

- **演示要点**：演示 WSF_QUANTUM_TASKER_PROCESSOR 的参数：script_variables, script, update_interval, asset_representation, reallocation_strategy, generator, evaluator, allocator

### processor · WSF_TASK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TASK_PROCESSOR, script_variables, on_initialize, script, update_interval, on_update, on_message, evaluation_interval, state, 处理器
- **出处**：`outer_air_battle/processors/cvn_task_processor.txt:29-295`
- **片段**：

```text
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

- **演示要点**：演示 WSF_TASK_PROCESSOR 的参数：script_variables, on_initialize, script, update_interval, on_update, on_message, evaluation_interval, state

### processor · WSF_OLD_GUIDANCE_COMPUTER｜处理器

- **关键词**：processor, WSF_OLD_GUIDANCE_COMPUTER, proportional_navigation_gain, velocity_pursuit_gain, g_bias, continuous_g_bias, max_commanded_g, omit_velocity_pursuit, update_interval, 处理器
- **出处**：`behavior_tree/weapons/aam/blue_sr_a2a_ir_missile.txt:68-76`
- **片段**：

```text
  processor blue_sr_a2a_ir_missile_autopilot WSF_OLD_GUIDANCE_COMPUTER
    proportional_navigation_gain  30.0
    velocity_pursuit_gain         30.0
    g_bias                         1.0
    continuous_g_bias
    max_commanded_g               40.0 g
    omit_velocity_pursuit
    update_interval                0.1 s
  end_processor
```

- **演示要点**：演示 WSF_OLD_GUIDANCE_COMPUTER 的参数：proportional_navigation_gain, velocity_pursuit_gain, g_bias, continuous_g_bias, max_commanded_g, omit_velocity_pursuit, update_interval

### processor · WSF_AIR_TARGET_FUSE｜处理器

- **关键词**：processor, WSF_AIR_TARGET_FUSE, use_current_target, update_interval, fine_update_interval, gross_proximity_range, detonate_below_height_agl, detonate_below_height_msl, maximum_time_of_flight, 处理器
- **出处**：`p6dof/platforms/aam-mr.txt:118-126`　（同签名共 10 处，另见 `p6dof/platforms/aam-sr-tvc.txt:102`、`p6dof/platforms/aam-sr.txt:110`、`p6dof/platforms/sam-mr.txt:101`）
- **片段**：

```text
   processor fuse WSF_AIR_TARGET_FUSE
      use_current_target
      update_interval           0.1 sec
      fine_update_interval      0.01 sec
      gross_proximity_range     500 ft
      detonate_below_height_agl 20.0 ft
      detonate_below_height_msl 20.0 ft
      maximum_time_of_flight    600.0 sec
   end_processor
```

- **演示要点**：演示 WSF_AIR_TARGET_FUSE 的参数：use_current_target, update_interval, fine_update_interval, gross_proximity_range, detonate_below_height_agl, detonate_below_height_msl, maximum_time_of_flight

### processor · WSF_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TRACK_PROCESSOR, purge_interval, report_to, report_interval, fused_track_reporting, raw_track_reporting, unchanged_track_reporting, circular_report_rejection, 处理器
- **出处**：`iads_c2_demos/platforms/sam_battalion.txt:44-53`　（同签名共 2 处，另见 `brawler/platforms/brawler_platform.txt:237`）
- **片段**：

```text
   processor data_mgr WSF_TRACK_PROCESSOR
      purge_interval 60 seconds
      report_to commander via cmdr_net to sub_net
      report_interval 1 sec

      fused_track_reporting on
      raw_track_reporting off
      unchanged_track_reporting disable
      circular_report_rejection on
   end_processor
```

- **演示要点**：演示 WSF_TRACK_PROCESSOR 的参数：purge_interval, report_to, report_interval, fused_track_reporting, raw_track_reporting, unchanged_track_reporting, circular_report_rejection

### processor · WSF_PERCEPTION_PROCESSOR｜处理器

- **关键词**：processor, WSF_PERCEPTION_PROCESSOR, update_interval, reports_self, report_interval, asset_perception, threat_update_interval, max_threat_load, max_asset_load, 处理器
- **出处**：`air_to_air/platforms/brawler_test.txt:481-496`
- **片段**：

```text
   processor perception WSF_PERCEPTION_PROCESSOR
      update_interval  0.5 s             // time interval sim will call processor
      reports_self on                  // Specifies whether or not to report out asset status messages about this platform
      report_interval 2.0 sec          // specifies the interval at which asset state messages are sent to friends
      asset_perception truth subordinates:commander:peers  // asset perception will utlize recieved WSF_ASSET_MESSAGE messages
      
      threat_update_interval 1 s       // interval at which the processor updates its threat perception
      max_threat_load 0               // max percievable threat entities
      max_asset_load 20
#      report_to commander via datalink
#      report_to subordinates via datalink
#      report_to peers via datalink
#      report_to command_chain IFLITE commander via datalink
#      report_to command_chain IFLITE peers via datalink
#      report_to command_chain IFLITE subordinates via datalink   
   end_processor
```

- **演示要点**：演示 WSF_PERCEPTION_PROCESSOR 的参数：update_interval, reports_self, report_interval, asset_perception, threat_update_interval, max_threat_load, max_asset_load

### processor · WSF_TASK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TASK_PROCESSOR, script_debug_writes, show_state_transitions, show_task_messages, script_variables, script, evaluation_interval, state, 处理器
- **出处**：`script_demos/script_demo_2.txt:147-212`
- **片段**：

```text
processor BOMB_1000_LB_LAUNCH_COMPUTER WSF_TASK_PROCESSOR
   script_debug_writes on
   show_state_transitions
   show_task_messages

   script_variables
      string WEAPON_NAME               = "bomb_1000_lb";
      int SALVO_SIZE                   = 1;
      # the following are used internally and should not be modified by the
      # user
      string mShootTaskStr      = "Shoot";
   end_script_variables

    script bool InInterceptEnvelopeOf(WsfWeapon aWeapon)
       bool canIntercept = false;
       double maxRng = 19000;
       double minRng = 300;
       WsfTrackId id = TRACK.TrackId();
       double targetrange = PLATFORM.SlantRangeTo(TRACK);
       writeln("Target range is " , targetrange);
       if ((targetrange > minRng) && (targetrange < maxRng))
       {
         canIntercept = true;
         writeln("Intercept is true");
       }
       return canIntercept;
   end_script

   script bool LaunchWeapon()
      WsfWeapon   weapon;
      weapon = PLATFORM.Weapon(WEAPON_NAME);
      bool canInterceptNow = false;
      if (weapon.QuantityRemaining() >= SALVO_SIZE)
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


# State Machine
# Very simple single state state machine
   evaluation_interval ENGAGE 2.0 sec
   state ENGAGE  # Engages and fires the weapon if it can
      next_state ENGAGE
         bool launched = false;
         if (InInterceptEnvelopeOf(PLATFORM.Weapon(WEAPON_NAME)))
         {
             writeln_d("Trying to launch weapon " );
             launched = LaunchWeapon();
         }
         return launched;
      end_next_state
   end_state
end_processor
```

- **演示要点**：演示 WSF_TASK_PROCESSOR 的参数：script_debug_writes, show_state_transitions, show_task_messages, script_variables, script, evaluation_interval, state

### processor · WSF_RIPR_PROCESSOR｜处理器

- **关键词**：processor, WSF_RIPR_PROCESSOR, update_interval, script_variables, int, on_initialize, on_update, string, foreach, 处理器
- **出处**：`base_types/processors/ripr_agents/aijc/aijc_processor.txt:15-107`
- **片段**：

```text
    processor AIJC-thinker WSF_RIPR_PROCESSOR

      update_interval 5.0 seconds
      #script_debug_writes on

      script_variables
        Map<string, int> mTargetNameJobIdMap = Map<string, int>();
        Map<int, string> mJobIdTargetNameMap = Map<int, string>();
        int mMaxJobWinners = 1;
      end_script_variables


      on_initialize
         //SetJobAllocationMode(2);
      end_on_initialize

      ##deprecated
      #query_bid
      #   return -MATH.DOUBLE_MAX();
      #end_query_bid


      on_update
        Map<string, int> updatedJobs = Map<string, int>();
        //simply create jam jobs for each threat we know about
        //this agent considers itself the highest level commander for any of it's subordinates
        WsfLocalTrackList localTracks = PLATFORM.MasterTrackList();

        string comment = "Num Tracks: " + (string)localTracks.Count();
        //PLATFORM.Comment(comment);

        foreach (WsfTrack track in localTracks)
        {
          if (mTargetNameJobIdMap.Exists(track.TargetName()))
          {
            //update existing job
            double currentPriority = 1.0;
            int jobId = mTargetNameJobIdMap.Get(track.TargetName());
            WsfRIPRJob job = GetJobById(jobId);
            job.Priority( currentPriority );
            //job.SetData("TrackId", track.TrackId() );           //redundant, this shouldn't change anything
            job.SetData("targetTrackName", track.TargetName()); //redundant, this shouldn't change anything
          }
          else
          {
            //create new job
            double initialPriority = 1.0;
            WsfRIPRJob temp;
            temp = temp.Create( PROCESSOR,
                                "jam-target",
                                "jam-target-" + track.TargetName(),
                                initialPriority,
                                mMaxJobWinners );
            //temp.SetData("TrackId", track.TrackId() );
            temp.SetData("targetTrackName", track.TargetName());

            AddJob(temp);
            mTargetNameJobIdMap.Set(track.TargetName(), temp.GetId());
            mJobIdTargetNameMap.Set(temp.GetId(), track.TargetName());
            writeln_d("~~~ ", PLATFORM.Name(), " job change, ADD: ", temp.Name() );

            comment = "create job: " + temp.GetDescription();
            PLATFORM.Comment(comment);
          }
          //either way the job was updated or created, record that fact
          updatedJobs.Set( track.TargetName(), 1 );
        }

        //now make sure the right jobs are removed
        //the targets for previous jobs might not exist anymore
        //remove any jobs that are for non-existent tracks
        Array<WsfRIPRJob> jobs = GetJobs();
        foreach (WsfRIPRJob x in jobs)
        {
          string name = (string)x.GetData("targetTrackName");
          if (updatedJobs[name] != 1)
          {
            int jid = x.GetId();
            writeln_d("--- ", PLATFORM.Name(), " job change, REMOVE: ", x.GetDescription());

            comment = "delete job: " + x.GetDescription();
            PLATFORM.Comment(comment);

            string tName = mJobIdTargetNameMap[jid];  //this should match the job's data: "targetTrackName"
            mTargetNameJobIdMap.Erase(name);
            mJobIdTargetNameMap.Erase(jid);
            RemoveJob(x);
          }
        }
      end_on_update


  end_processor
```

- **演示要点**：演示 WSF_RIPR_PROCESSOR 的参数：update_interval, script_variables, int, on_initialize, on_update, string, foreach

### processor · WSF_TASK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TASK_PROCESSOR, number_of_servers, track_update_interval, script_variables, script, evaluation_interval, time_to_evaluate, state, 处理器
- **出处**：`aea_iads/platforms/iads_cmdr.txt:18-126`
- **片段**：

```text
processor IADS_CMDR_TASK_MGR WSF_TASK_PROCESSOR
   number_of_servers            5

   track_update_interval        10.0 sec

   #script_debug_writes true
   #show_state_transitions
   #show_task_messages

   script_variables
      int MAX_SAMS_PER_TARGET     = 2;
      int MAX_ASSIGNMENTS_PER_SAM = 4;
      string WEAPON_NAME          = "sam";
   end_script_variables

   // determine if TRACK is assignable
   script bool IsAssignable()
      if ((! TRACK.IFF_Friend()) &&
          (TRACK.TimeSinceUpdated() < 30.0))
      {
         return true;
      }

      return false;
   end_script

   // determine if the subordinate and/or his subordinates have weapons remaining
   script bool WeaponsAvailable(WsfPlatform aAssignee)
      bool weaponsAvailable = false;

      int quantity = 0;
      WsfWeapon weapon = aAssignee.Weapon(WEAPON_NAME);
      if (weapon.IsTurnedOn())
      {
         quantity = quantity + weapon.QuantityRemaining();
      }
      if (quantity > 0)
      {
         weaponsAvailable = true;
      }
      else
      {
         foreach (WsfPlatform sub in aAssignee.Subordinates())
         {
            weapon = sub.Weapon(WEAPON_NAME);
            if (weapon.IsTurnedOn())
            {
               quantity = quantity + weapon.QuantityRemaining();
            }
         }

         if (quantity > 0) weaponsAvailable = true;
      }

      return weaponsAvailable;
   end_script

   script void MakeAssignments()
      Array<WsfPlatform> filter = Array<WsfPlatform>();
      foreach (WsfPlatform sub in PLATFORM.Subordinates())
      {
         if (sub.Type() == "LARGE_SAM_BATTALION")
         {
            if (WeaponsAvailable(sub) &&
                (TasksAssignedTo(sub) < MAX_ASSIGNMENTS_PER_SAM) &&
                (TasksAssignedTo(sub, TRACK.TrackId()) < 1) &&
                (TRACK.WithinZoneOf(sub, "battalion_sector")))
            {
               writeln_d("*** Adding ", sub.Name(), " to filter");
               filter.PushBack(sub);
            }
         }
      }

      int i;
      int numAssignments = (int)MATH.Min(filter.Size(), MAX_SAMS_PER_TARGET);
      for (int i=0; i < numAssignments; i = i + 1)
      {
         AssignTask(TRACK, "ENGAGE", filter[i]);
      }
   end_script

# -------------------------------------------------------------------------

   evaluation_interval DETECTED 10.0 sec
   time_to_evaluate    DETECTED  5.0 secs
   state DETECTED
      next_state ASSIGNED
         if (! IsAssignable()) return false;

         MakeAssignments();
         return true;
      end_next_state
   end_state

   evaluation_interval ASSIGNED 10.0 sec
   time_to_evaluate    ASSIGNED  1.0 secs
   state ASSIGNED
      next_state DETECTED
         if (! IsAssignable())
         {
            CancelTask(TRACK.TrackId());
            return true;
         }
         MakeAssignments();
         return false;
      end_next_state
   end_state
end_processor
```

- **演示要点**：演示 WSF_TASK_PROCESSOR 的参数：number_of_servers, track_update_interval, script_variables, script, evaluation_interval, time_to_evaluate, state

### processor · WSF_TASK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TASK_PROCESSOR, show_state_transitions, show_task_messages, script_variables, string, script, evaluation_interval, state, 处理器
- **出处**：`gun_engagement/processors/gun_battery_tactics.txt:15-222`
- **片段**：

```text
processor GUN_BATTERY_TACTICS WSF_TASK_PROCESSOR
   #update_interval .01 sec
   #script_debug_writes on
   show_state_transitions
   show_task_messages

   script_variables           # These variables are overwritten by the platform.
      string SENSOR_NAME               = "";
      string SENSOR_TRACK_MODE         = "TRACK"; # could be "default" if using a modeless sensor
	   string SENSOR_ACQUIRE_MODE       = "ACQUIRE";  # if used...
      string WEAPON_NAME               = ""; # Supplied by the gun platform
      double REQUIRED_TRACK_QUALITY    = .95; # Must have a high quality track
      int SALVO_SIZE                   = 1;  # Overwritten by platform using this processor
      double LAUNCH_DELAY              = 0;
      double MAX_RANGE                 = 0; # MUST BE SUPPLIED BY LAUNCHING PLATFORM!!!
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
      bool CanIntercept = 0;
      if((PLATFORM.GroundRangeTo(TRACK) > MAX_RANGE) || !aWeapon.IsValid() || !aWeapon.LaunchComputer().IsValid())
      {
         return CanIntercept;
      }
      WsfLaunchComputer computer = aWeapon.LaunchComputer();
      #writeln(TIME_NOW, " Launch Computer Name is = ", computer );
      #writeln(TIME_NOW, " computer.Intercept point is ", computer.InterceptPoint());
	   CanIntercept = computer.CanIntercept(TRACK, LAUNCH_DELAY) &&
                     computer.InterceptPointIsValid();
      if( ! computer.InterceptPointIsValid())
      {
         writeln_d("ERROR - ", aWeapon.Name(), " does not have a valid intercept point!!!");
      }
      writeln_d(TIME_NOW, "CanIntercept = ",   CanIntercept);
      return CanIntercept;
   end_script

   # returns true if acq_radar is tracking
   script bool HasAcquired()
      return (TRACK.TrackQuality() > 0.75);
   end_script

   # returns true if any TTR is tracking (external sensor not defined)
   script bool TrackingNow()
      if (!TRACK.IsValid())
      {
         return false;
      }


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
      if (weapon.IsTurnedOn() &&  (weapon.QuantityRemaining() >= SALVO_SIZE))
      {
         canInterceptNow = InInterceptEnvelopeOf(weapon);
      }
      bool launched = false;
      if (canInterceptNow)
      {
            canInterceptNow = InInterceptEnvelopeOf(weapon);
            weapon.CueToTarget(TRACK);
            launched = FireAt(TRACK, mShootTaskStr, weapon, SALVO_SIZE);
            #launched = FireAt(TRACK, mShootTaskStr, weapon,    1       );

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
               (OperatingLevelFor("ENGAGE") > 0))) ;
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


# ------------------------------------------------------------------
# START OF THE STATE MACHINE
   evaluation_interval DETECTED 0.5 sec
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
         return (TRACK.BelievedDead() || TRACK.IFF_Friend() || (! IsEngageable()));
      end_next_state

      next_state ENGAGE

         # wait until tracking target
         if (SENSOR_NAME == "")
         {
            writeln_d(TIME_NOW, " In intercept of the gun = ", InInterceptEnvelopeOf(PLATFORM.Weapon(WEAPON_NAME)));
            return (TRACK.BelievedAlive() &&
                    InInterceptEnvelopeOf(PLATFORM.Weapon(WEAPON_NAME)) &&
                    (TRACK.TrackQuality() > REQUIRED_TRACK_QUALITY));
         }
         else
         {
            return (TrackingNow() && InInterceptEnvelopeOf(PLATFORM.Weapon(WEAPON_NAME)) &&
                    ((TasksAssignedFor(TRACK.TrackId(), mTrackTaskStr) > 0) ||
                    (PLATFORM.Commander() == PLATFORM)));
         }
      end_next_state
   end_state

   evaluation_interval ENGAGE 0.01 sec
   state ENGAGE
      next_state ENGAGEABLE
         return (TRACK.BelievedDead() || ! TrackingNow());
      end_next_state

      next_state FIRING
         bool launched = false;

         if (TRACK.BelievedAlive() &&
             TrackingNow() &&
            # ! FiringNow() &&
             InInterceptEnvelopeOf(PLATFORM.Weapon(WEAPON_NAME)))
         {
            launched = LaunchWeapon();
         }
         return launched;
      end_next_state
   end_state

   evaluation_interval FIRING .01 sec
   state FIRING
      next_state ENGAGE
         if (TRACK.BelievedDead() ||
             ! InInterceptEnvelopeOf(PLATFORM.Weapon(WEAPON_NAME)) ||
             #(! FiringNow() &&
             (TasksAssignedFor(TRACK.TrackId(), mShootTaskStr) < 1) ||
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

- **演示要点**：演示 WSF_TASK_PROCESSOR 的参数：show_state_transitions, show_task_messages, script_variables, string, script, evaluation_interval, state

### processor · WSF_RIPR_PROCESSOR｜处理器

- **关键词**：processor, WSF_RIPR_PROCESSOR, script_debug_writes, update_interval, script_variables, behavior_tree, on_initialize, query_bid_type, on_update, 处理器
- **出处**：`base_types/processors/ripr_agents/aifl/aifl_processor.txt:26-281`
- **片段**：

```text
processor AIFL-thinker WSF_RIPR_PROCESSOR

  script_debug_writes off
  update_interval     3.0 sec

   script_variables
      bool windowToggle = false;
      // We need to keep references to all the jobs we create so they don't get
      // garbage collected when they go out of scope
      int maxJobWinnersForWeaponUplink = 1;
      double cPursuePointPriority  = 0.00001;
      double cFlankPointPriority   = 25000.0;
      double cPursueTargetPriority = 10000.0;
      double cPincerPriority       = 10000.0;
      WsfRIPRJob      mCurrentJob;
      WsfRIPRJob      mLastJob;
      double          mJobStickiness       =  1.25;
      int             mJobAllocationMode   =  3;
      bool            mFastAndDirtyBidding  = false;
      Map<string, string> ThreatTypeEngageZone = Map<string, string>();
      string          cPreferredFlank   = "auto";  //or "left" or "right"
      Map<int, WsfGeoPoint> mFlankJobIdToFlankPointMap = Map<int, WsfGeoPoint>();

   end_script_variables


   behavior_tree
      behavior_node  bid_on_jobs
      behavior_node  toggle_windows
      selector
         behavior_node  interpret_zone_jobs
         behavior_node  create_target_jobs_self
      end_selector
      behavior_node  create_point_job
      behavior_node  create_cap-routes
     #behavior_node  create_sar_jobs
     #behavior_node  interpret_flank_jobs
      behavior_node  manage-uplinks
      behavior_node  manage-pincer
     #behavior_node  debug_job_board
   end_behavior_tree

   ##deprecated
   #query_bid
   #   return -MATH.DOUBLE_MAX();
   #end_query_bid

   on_initialize
      # job allocation mode enumerations:
      # 0 --> spread (Default -- every subordinate is given the highest priority job that he has the highest bid for. If there are more subordinates than jobs, some subordinates will be left idle. )
      # 1 --> greedy (Every subordinate is given the job he bids highest on with the highest priority, without regard for the maximum number of winners that the job allows. Every subordinate will get a job. (Disregards Job Stickiness value) )
      # 2 --> coverthengreedy (Like spread, but remaining unassigned subordinates will be given the job they bid highest on with the highest priority, even if that results in the job having more winners that the maximum specified. )
      # 3 --> coverthenspread (Like spread, but remaining unassigned subordinates will be spread out over the pool of jobs with no job getting two extra winners before all jobs have one extra winner. )
      # 4 --> strictpriority (Like spread, awards the highest priority job to the highest bidder regardless of the bidder's highest overall bid. )
      PROCESSOR.SetJobAllocationMode(mJobAllocationMode);
      PROCESSOR.SetJobStickiness(mJobStickiness);
   end_on_initialize



   query_bid_type    zone

      if (PLATFORM.Subordinates().Count() <= 0 || PROCESSOR.GetRIPRSubordinateProcessors().Size() <= 0)
      {
        writeln_d("behavior interpret_zone_jobs: not enough subordinates");
        return -MATH.DOUBLE_MAX();
      }
      ########################################################################
      ##  bid on the cluster is based on subordinate bids on their members
      ########################################################################
      WsfRIPRJob tempJob = WsfRIPRJob.Create(PROCESSOR,"pursue-target","job description",1.0,1);
      Array<string> targetNames = (Array<string>)JOB.GetData("ZoneThreatNameArray");
      writeln_d("job ", JOB.GetDescription(),  " -> number of target names considering: ", targetNames.Size());
      double maxBid = -MATH.DOUBLE_MAX();

      foreach(string targetName in targetNames)
      {
          bool inZone   = true;
          WsfPlatform target = WsfSimulation.FindPlatform(targetName);
          if (target.IsValid())
          {
           #extern string DeterminePlatformCategory(WsfPlatform);
            string category = DeterminePlatformCategory(target);
            if (ThreatTypeEngageZone.Exists(category) && ThreatTypeEngageZone[category].Length()>0)
            {
              if ( ! target.Location().WithinZone(ThreatTypeEngageZone[category]))
              {
                inZone   = false;
                writeln_d("aifl ", PLATFORM.Name(),", target ", targetName, " outside of category ", category," zone ", ThreatTypeEngageZone[category], ".  bid = -DOUBLE_MAX.");
              }
              else
              {
                writeln_d("aifl ", PLATFORM.Name(),", target ", targetName, " inside category ", category," zone ", ThreatTypeEngageZone[category], ".  bid as usual!!!");
              }
            }
            foreach ( string aZone in PLATFORM.ZoneNames())
            {
              if ( !target.WithinZoneOf(PLATFORM, aZone) )
              {
                inZone   = false;
                writeln_d("ai flight lead, target ", targetName, " outside of defined zone ", aZone, " curBid from subordinate set to -DOUBLE_MAX.");
              }
              else
              {
                writeln_d("ai flight lead, target ", targetName, " inside of defined zone ", aZone, " curBid unchanged.");
              }
            }
         }
         if (inZone == true)
         {
         tempJob.SetData("targetTrackName", targetName);
         if (mFastAndDirtyBidding)
         {
            maxBid = PROCESSOR.GetRIPRSubordinateProcessors().Get(0).QueryBid(tempJob);
            writeln_d("ai flight lead, fast dirty bid on ", JOB.Description()," = ", maxBid);
            break;
         }
         else
         {
            //by default this expands through job-pass-through agents to get all bids
            double curBid = PROCESSOR.QuerySubordinatesMaxBid(tempJob);

            writeln_d("ai flight lead, max bid on ", targetName," from subordinates: ", curBid);
            if (curBid > maxBid)
            {
               maxBid = curBid;
            }
            }
         }
         else
         {
            maxBid = -MATH.DOUBLE_MAX();
         }
      }
      return maxBid;

   end_query_bid_type



   query_bid_type    flank

      if (PLATFORM.Subordinates().Count() <= 0)
      {
         writeln_d("no subordinates to carry out flank job");
         return -MATH.DOUBLE_MAX();
      }

      WsfGeoPoint zonePoint    = (WsfGeoPoint)JOB.GetData("ZonePoint");
      double      zoneBearing  = (double)     JOB.GetData("ZoneBearing");
      WsfZone     flankZone    = (WsfZone)    JOB.GetData("FlankZone");
      double      flankDist    = (double)     JOB.GetData("FlankDistance");
      bool        bearingValid = (bool)       JOB.GetData("ZoneBearingValid");

      //determine which side to flank on, based on subordinate that is closest to flank point
      //find closest subordinate & then calculate relative geometry

      WsfPlatform ClosestFlanker;

      if( zonePoint.IsValid() )
      {
         double MinRange = MATH.DOUBLE_MAX();
         double NumSubordinates = (double)(PLATFORM.Subordinates().Count());
         foreach (WsfPlatform sub in PLATFORM.Subordinates())
         {
            double range = sub.SlantRangeTo( zonePoint );
            if( range < MinRange )
            {
               MinRange = range;
               ClosestFlanker = sub;
            }
         }
         if (!ClosestFlanker.IsValid())
         {
            writeln_d("!!!   no valid subordinates to compare to flank point!");
            return -MATH.DOUBLE_MAX();
         }

         double clusterBearingTrue = 0.0;
         if (bearingValid)
         {
            //cluster heading is with reference to east (instead of north), so subtract 90 degrees
            #clusterBearingTrue = MATH.NormalizeAngle0_360( zoneBearing - 90.0 );
            clusterBearingTrue = MATH.NormalizeAngle0_360( zoneBearing );
         }
         else
         {
            writeln_d("cluster bearing invalid, bearing: ", zoneBearing);
            //assume cluster is flying straight at me, flank to side I'm already oriented towards
            clusterBearingTrue = ClosestFlanker.TrueBearingTo( zonePoint ) - 180.0;
         }

        //don't need to normalize it here, the next line catches it
        double angle = ClosestFlanker.TrueBearingTo( zonePoint ) - 180.0;
        double relativeFlankBearing = MATH.NormalizeAngle0_360( angle - clusterBearingTrue );
        double flankAngle = 90.0;
        if( relativeFlankBearing > 180.0 )
        {
          flankAngle = 270.0;
        }

        if (cPreferredFlank == "left")
        {
          flankAngle = 90.0;
        }
        else if(cPreferredFlank == "right")
        {
          flankAngle = 270.0;
        }

        double flankBearing = MATH.NormalizeAngle0_360( clusterBearingTrue + flankAngle );
        WsfGeoPoint ePoint = WsfGeoPoint(zonePoint);
        ePoint.Extrapolate( flankBearing, flankDist );

        //save off the flank point, in case we win this job
        mFlankJobIdToFlankPointMap.Set( JOB.GetId(), ePoint );

        //find the range to the place we will fly so as to flank the target
        MinRange = ClosestFlanker.SlantRangeTo( ePoint );

        double JobBidValue = 100000 + NumSubordinates * flankDist / MinRange;
        return JobBidValue;
      }
      else
      {
        writeln_d("!!!   Invalid point in flank job");
        return -MATH.DOUBLE_MAX();
      }

   end_query_bid_type


   on_update

      writeln_d("--- aifl_update Platform: ", PLATFORM.Name(), ", Time: ", TIME_NOW);

      WsfRIPRProcessor commander = PROCESSOR.GetRIPRCommanderProcessor();
      if (commander.IsValid())
      {
         // print any job changes, so check the board to see what we've won
         mCurrentJob = commander.GetJobFor(TIME_NOW, PROCESSOR);
         if( mCurrentJob.IsValid() )
         {
            if( (!mLastJob.IsValid()) || mCurrentJob.GetId() != mLastJob.GetId() )
            {
               string NewComment = "AIFL - Won new job: " + mCurrentJob.Name() + " - " + mCurrentJob.GetDescription();
               PLATFORM.Comment(NewComment);
            }
            mLastJob = mCurrentJob;
         }
      }

  end_on_update


end_processor
```

- **演示要点**：演示 WSF_RIPR_PROCESSOR 的参数：script_debug_writes, update_interval, script_variables, behavior_tree, on_initialize, query_bid_type, on_update

### processor · WSF_AIR_TARGET_FUSE｜处理器

- **关键词**：processor, WSF_AIR_TARGET_FUSE, use_current_target, gross_proximity_range, hit_proximity_range, update_interval, fine_update_interval, time_of_flight_to_arm, 处理器
- **出处**：`ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:171-178`　（同签名共 3 处，另见 `base_types/weapons/sam/blue_naval_sam.txt:169`、`space_operations/weapons/blue_naval_sam.txt:171`）
- **片段**：

```text
   processor fuse WSF_AIR_TARGET_FUSE
      use_current_target
      gross_proximity_range   7 km
      hit_proximity_range     5 km
      update_interval         0.50 sec
      fine_update_interval    0.01 sec
      time_of_flight_to_arm   60 sec
   end_processor
```

- **演示要点**：演示 WSF_AIR_TARGET_FUSE 的参数：use_current_target, gross_proximity_range, hit_proximity_range, update_interval, fine_update_interval, time_of_flight_to_arm

### processor · WSF_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TRACK_PROCESSOR, purge_interval, report_interval, fused_track_reporting, raw_track_reporting, report_to, circular_report_rejection, 处理器
- **出处**：`base_types/weapons/aam/scenario_test_launch_computer.txt:64-71`　（同签名共 16 处，另见 `behavior_tree/platforms/run_tree_striker.txt:67`、`behavior_tree/platforms/selector_striker.txt:62`、`route_finder_demos/platforms/striker.txt:54`）
- **片段**：

```text
   processor track_manager WSF_TRACK_PROCESSOR
      purge_interval             60 sec
      report_interval            1 sec
      fused_track_reporting      off
      raw_track_reporting        on
      report_to commander        via   sub_net
      circular_report_rejection  true
   end_processor
```

- **演示要点**：演示 WSF_TRACK_PROCESSOR 的参数：purge_interval, report_interval, fused_track_reporting, raw_track_reporting, report_to, circular_report_rejection

### processor · WSF_PERCEPTION_PROCESSOR｜处理器

- **关键词**：processor, WSF_PERCEPTION_PROCESSOR, on, script_debug_writes, report_interval, reporting_self, report_to, asset_perception, 处理器
- **出处**：`behavior_tree/platforms/run_tree_striker.txt:129-136`　（同签名共 7 处，另见 `behavior_tree/platforms/selector_striker.txt:141`、`heatmap/platforms/ew_radar.txt:31`、`route_finder_demos/platforms/striker.txt:63`）
- **片段**：

```text
   processor perception WSF_PERCEPTION_PROCESSOR
      on
      script_debug_writes  off
      report_interval      10 sec
      reporting_self       true
      report_to            commander via cmdr_net
      asset_perception     status_messages 
   end_processor
```

- **演示要点**：演示 WSF_PERCEPTION_PROCESSOR 的参数：on, script_debug_writes, report_interval, reporting_self, report_to, asset_perception

### processor · WSF_TRACK_MANAGER｜处理器

- **关键词**：processor, WSF_TRACK_MANAGER, purge_interval, report_interval, fused_track_reporting, raw_track_reporting, report_to, circular_report_rejection, 处理器
- **出处**：`iads_c2_demos/platforms/air_interceptor.txt:45-52`
- **片段**：

```text
   processor track_manager WSF_TRACK_MANAGER
      purge_interval             60 sec
      report_interval            1 sec
      fused_track_reporting      off
      raw_track_reporting        on
      report_to commander        via   cmdr_net to sub_net
      circular_report_rejection  true
   end_processor
```

- **演示要点**：演示 WSF_TRACK_MANAGER 的参数：purge_interval, report_interval, fused_track_reporting, raw_track_reporting, report_to, circular_report_rejection

### processor · WSF_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TRACK_PROCESSOR, purge_interval, report_to, report_interval, fused_track_reporting, raw_track_reporting, unchanged_track_reporting, 处理器
- **出处**：`iads_c2_demos/platforms/radar_company.txt:33-40`
- **片段**：

```text
  processor data_mgr WSF_TRACK_PROCESSOR
    purge_interval       60 sec
    report_to commander via cmdr_net to sub_net
    report_interval      20 sec
    fused_track_reporting on
    raw_track_reporting   off
    unchanged_track_reporting disable
  end_processor
```

- **演示要点**：演示 WSF_TRACK_PROCESSOR 的参数：purge_interval, report_to, report_interval, fused_track_reporting, raw_track_reporting, unchanged_track_reporting

### processor · WSF_GUIDANCE_COMPUTER｜处理器

- **关键词**：processor, WSF_GUIDANCE_COMPUTER, guide_to_truth, proportional_navigation_gain, velocity_pursuit_gain, g_bias, maximum_commanded_g, update_interval, 处理器
- **出处**：`ship_ad/weapons/sam/red_sr_sam_2.txt:73-80`
- **片段**：

```text
  processor computer WSF_GUIDANCE_COMPUTER
    guide_to_truth                true
    proportional_navigation_gain  2.0
    velocity_pursuit_gain         1.0
    g_bias                        1.0
    maximum_commanded_g           23.0 g       # Ref 1
    update_interval               0.1 s
  end_processor
```

- **演示要点**：演示 WSF_GUIDANCE_COMPUTER 的参数：guide_to_truth, proportional_navigation_gain, velocity_pursuit_gain, g_bias, maximum_commanded_g, update_interval

### processor · WSF_GUIDANCE_COMPUTER｜处理器

- **关键词**：processor, WSF_GUIDANCE_COMPUTER, proportional_navigation_gain, velocity_pursuit_gain, g_bias, maximum_commanded_g, guidance_delay, update_interval, 处理器
- **出处**：`draw/weapons/agm/bomb_1000_lb.txt:9-18`
- **片段**：

```text
processor BOMB_GUIDANCE_COMPUTER WSF_GUIDANCE_COMPUTER
  proportional_navigation_gain  10.0
  velocity_pursuit_gain         10.0
  g_bias                         1.0
  maximum_commanded_g          25.0 g
  guidance_delay                0.0 sec
  time_between_GPS_fixes      600.0 sec
  IMU_drift_rate                0.0 m/s
  update_interval               0.5 s
end_processor
```

- **演示要点**：演示 WSF_GUIDANCE_COMPUTER 的参数：proportional_navigation_gain, velocity_pursuit_gain, g_bias, maximum_commanded_g, guidance_delay, update_interval

### processor · WSF_WEAPONS_MANAGER_AI｜处理器

- **关键词**：processor, WSF_WEAPONS_MANAGER_AI, update_interval, haveco_reporting_strategy, assess_engage_via, intercept_speed, pursuit_range, engagement_settings, 处理器
- **出处**：`iads_c2_demos/processors/weapons_manager_ai.txt:14-28`
- **片段**：

```text
processor WM_AI WSF_WEAPONS_MANAGER_AI
   update_interval 1 sec

   haveco_reporting_strategy   on_detonate
   assess_engage_via           Collision-Intercept-PT-Inside-Zone
   intercept_speed             800 kts
   pursuit_range               60000 meters

   engagement_settings
      ew_targets                      false
      tar_targets                     false
      ttr_targets                     true
      engage_local_ttr_targets_only   true
   end_engagement_settings
end_processor
```

- **演示要点**：演示 WSF_WEAPONS_MANAGER_AI 的参数：update_interval, haveco_reporting_strategy, assess_engage_via, intercept_speed, pursuit_range, engagement_settings

### processor · WSF_PERCEPTION_PROCESSOR｜处理器

- **关键词**：processor, WSF_PERCEPTION_PROCESSOR, update_interval, reports_self, report_interval, threat_update_interval, max_threat_load, max_asset_load, 处理器
- **出处**：`air_to_air/platforms/brawler_test.txt:144-159`
- **片段**：

```text
   processor perception WSF_PERCEPTION_PROCESSOR
      update_interval  0.5 s             // time interval sim will call processor
      reports_self on                  // Specifies whether or not to report out asset status messages about this platform
      report_interval 6.0 sec          // specifies the interval at which asset state messages are sent to friends
#      asset_perception truth subordinates:commander:peers  // asset perception will utilize received WSF_ASSET_MESSAGE messages
      
      threat_update_interval 10 s       // interval at which the processor updates its threat perception
      max_threat_load 0               // max percievable threat entities
      max_asset_load 20
#      report_to commander via datalink
#      report_to subordinates via datalink
#      report_to peers via datalink
#      report_to command_chain IFLITE commander via datalink
#      report_to command_chain IFLITE peers via datalink
#      report_to command_chain IFLITE subordinates via datalink   
   end_processor
```

- **演示要点**：演示 WSF_PERCEPTION_PROCESSOR 的参数：update_interval, reports_self, report_interval, threat_update_interval, max_threat_load, max_asset_load

### processor · WSF_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TRACK_PROCESSOR, non_master_track_processor, purge_interval, update_interval, report_interval, drop_after_inactive, track_manager, 处理器
- **出处**：`air_to_air/platforms/brawler_test.txt:97-114`
- **片段**：

```text
   processor raw_data_mgr WSF_TRACK_PROCESSOR
      non_master_track_processor 
      purge_interval  60 sec
      update_interval 2.0 sec
      report_interval 2.0 sec 
      drop_after_inactive 30 sec
      
#      unchanged_track_reporting false   #TEST
#      report_raw_tracks 
#      report_fused_tracks
#      circular_report_rejection enable
#      internal_link data_mgr
      // fuze my own ship tracks, link to master track processor
      track_manager 
         fusion_method weighted_average       
         end_fusion_method
      end_track_manager
   end_processor
```

- **演示要点**：演示 WSF_TRACK_PROCESSOR 的参数：non_master_track_processor, purge_interval, update_interval, report_interval, drop_after_inactive, track_manager

### processor · WSF_RIPR_PROCESSOR｜处理器

- **关键词**：processor, WSF_RIPR_PROCESSOR, script_debug_writes, update_interval, script_variables, behavior_tree, on_initialize, on_update, 处理器
- **出处**：`base_types/processors/ripr_agents/aigci/aigci_processor.txt:17-51`
- **片段**：

```text
processor AIGCI-thinker WSF_RIPR_PROCESSOR

  script_debug_writes   off
  update_interval       5.0 sec

   script_variables
      double   mJobStickiness       =  1.0;
      int      mJobAllocationMode   =  3;
   end_script_variables


   behavior_tree
      behavior_node  toggle_windows
      behavior_node  create_clustering_jobs
     #behavior_node  create_flank_jobs
   end_behavior_tree


   on_initialize
      # job allocation mode enumerations:
      # 0 --> spread (Default -- every subordinate is given the highest priority job that he has the highest bid for. If there are more subordinates than jobs, some subordinates will be left idle. )
      # 1 --> greedy (Every subordinate is given the job he bids highest on with the highest priority, without regard for the maximum number of winners that the job allows. Every subordinate will get a job. (Disregards Job Stickiness value) )
      # 2 --> coverthengreedy (Like spread, but remaining unassigned subordinates will be given the job they bid highest on with the highest priority, even if that results in the job having more winners that the maximum specified. )
      # 3 --> coverthenspread (Like spread, but remaining unassigned subordinates will be spread out over the pool of jobs with no job getting two extra winners before all jobs have one extra winner. )
      # 4 --> strictpriority (Like spread, awards the highest priority job to the highest bidder regardless of the bidder's highest overall bid. )
      SetJobAllocationMode(mJobAllocationMode);
      SetJobStickiness(mJobStickiness);
   end_on_initialize


   on_update
      writeln_d("--- aigci_update Platform: ", PLATFORM.Name(), ", Time: ", TIME_NOW);
   end_on_update

end_processor
```

- **演示要点**：演示 WSF_RIPR_PROCESSOR 的参数：script_debug_writes, update_interval, script_variables, behavior_tree, on_initialize, on_update

### processor · WSF_TASK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TASK_PROCESSOR, script, return, evaluation_interval, time_to_evaluate, state, next_state, 处理器
- **出处**：`suppressor/platforms/bomber.txt:62-126`
- **片段**：

```text
  processor launch_computer WSF_TASK_PROCESSOR
    //show_state_transitions
    //show_task_messages
    //show_state_evaluations

    script bool InWeaponLAR()
      return ((PLATFORM.GroundRangeTo(TRACK) < 4000) &&              // 2D-DIST < 4. (KM)
              (PLATFORM.RelativeOffsetOf(TRACK) < 2000));            // 2D-REL-TGT-OFFSET < 2. (KM)
    end_script

    evaluation_interval DETECTED 12.5 sec
    time_to_evaluate    DETECTED 0.05 sec
    state DETECTED
      next_state ENGAGING
        bool okayToEngage = false;
        WsfWeapon weapon = PLATFORM.Weapon("bomber_weapon");
        // The tests have be reordered for better efficiency
        if ((! TRACK.IFF_Friend())                         &&        // IFF-STATUS IS-NOT-FRIEND
            (TRACK.TargetType() == "TARGET")               &&
            (! HaveFiredAt(TRACK.TrackId()))               &&        // FIRED-BEFORE IS NO
            TRACK.WithinZoneOf(PLATFORM, "target_area")    &&        // 3D-TGT-LOC WITHIN target_area
            (weapon.QuantityRemaining() > 0))                        // WPN-STATUS IS-NOT WPN-NON/OP
        {
          if (CountInState("ENGAGING") < 3)
          {
            okayToEngage = InWeaponLAR();
          }
        }
        return okayToEngage;
      end_next_state
    end_state

    // Because the tactics only allow one shot at the target and because the rules above
    // check for having fired at the target, we can immediately return to the DETECTED state
    // once we have fired.

    evaluation_interval ENGAGING 12.5 sec
    time_to_evaluate    ENGAGING 0.05 sec
    state ENGAGING
      next_state DETECTED
        bool exitState = false;
        WsfWeapon weapon = PLATFORM.Weapon("bomber_weapon");
        if (TRACK.IFF_Friend()                              ||
            (! TRACK.WithinZoneOf(PLATFORM, "target_area")) ||
            (weapon.QuantityRemaining() < 1))
        {
           exitState = true;
        }
        else if ((PLATFORM.RelativeBearingTo(TRACK) < 70)   && // REL-SUB-HDG < 70.0 (DEG)
                 InWeaponLAR())
        {
           // When the SALVO-FIRING indicates no rounds are to be fired at a receding target,
           // SUPPRESSOR proceeds internally with the firing request but then stops the engagement
           // when it determines there are no rounds available.
           exitState = true;
           if (PLATFORM.ClosingSpeedOf(TRACK) > 0)
           {
              exitState = FireAt(TRACK, "Shoot", weapon, 4);
           }
        }
        return exitState;
      end_next_state
    end_state

  end_processor
```

- **演示要点**：演示 WSF_TASK_PROCESSOR 的参数：script, return, evaluation_interval, time_to_evaluate, state, next_state

### processor · WSF_TASK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TASK_PROCESSOR, script_debug_writes, show_state_transitions, show_task_messages, script, evaluation_interval, state, 处理器
- **出处**：`electronic_warfare/semi-auto_repeater_jamming_1.txt:108-182`
- **片段**：

```text
processor JAMMER_TASK_MGR WSF_TASK_PROCESSOR

   script_debug_writes on
   show_state_transitions
   show_task_messages

   # Script to select a jammer and add a spot
   script bool AddSpot()
      bool startedJamming = false;
      for (int i=0; i < PLATFORM.WeaponCount(); i = i+1)
      {
         int tasksAssigned = TasksAssignedFor(TRACK.TrackId(), "Jam");
         WsfWeapon jammer = PLATFORM.WeaponEntry(i);
         writeln_d("TrackId=", TRACK.TrackId());
         writeln_d("RawTrackId=", TRACK.RawTrackId(0));
         if (PLATFORM.WithinFieldOfView(TRACK, jammer.Name()))
         {
            writeln_d("SignalFreq=", TRACK.Frequency());
            if (StartJamming(TRACK, "Jam", jammer, "false_target_jamming"))
            {
               writeln_d("T=", TIME_NOW, " ", PLATFORM.Name(), ":",
                         jammer.Name(), " started jamming ", TRACK.TargetName());
               writeln_d("Previous Tasks Assigned=", tasksAssigned,
                         " Tasks assigned=", TasksAssignedFor(TRACK.TrackId(), "Jam"));
               if (TasksAssignedFor(TRACK.TrackId(), "Jam") > tasksAssigned)
               {
                  startedJamming = true;
                  break;
               }
            }
            else
            {
               writeln_d("T=", TIME_NOW, " ", PLATFORM.Name(), ":",
                         jammer.Name(), " FAILED started jamming ", TRACK.TargetName());
            }
         }
      }
      return startedJamming;
   end_script

   # script to determine if platform can still jam emitter with current jammer
   script bool StoppedJamming()
      int tasksAssigned = TasksAssignedFor(TRACK.TrackId(), "Jam");
      writeln("tasksAssigned=", tasksAssigned);
      return (tasksAssigned == 0);
   end_script

   # -------------------------------------------------------------------------

   evaluation_interval DETECTED 5.0 sec
   state DETECTED
      next_state CAN_JAM
         return (TRACK.TimeSinceUpdated() < 10.0);
      end_next_state
   end_state

   evaluation_interval CAN_JAM 5.0 sec
   state CAN_JAM
      next_state DETECTED
         return (TRACK.TimeSinceUpdated() > 10.0);
      end_next_state

      next_state IS_JAMMING
         return AddSpot();
      end_next_state
   end_state

   evaluation_interval IS_JAMMING 5.0 sec
   state IS_JAMMING
      next_state CAN_JAM
         return StoppedJamming();
      end_next_state
   end_state

end_processor
```

- **演示要点**：演示 WSF_TASK_PROCESSOR 的参数：script_debug_writes, show_state_transitions, show_task_messages, script, evaluation_interval, state

### processor · WSF_SCRIPT_PROCESSOR｜处理器

- **关键词**：processor, WSF_SCRIPT_PROCESSOR, on, update_interval, script_variables, on_initialize, script, on_update, 处理器
- **出处**：`hel/hel_test.txt:49-134`　（同签名共 3 处，另见 `hel/intersect_mesh_test_beam_director.txt:67`、`hel/intersect_mesh_test.txt:58`）
- **片段**：

```text
processor auto_fire_computer WSF_SCRIPT_PROCESSOR
   on
   update_interval 1.0 s

   script_variables
      double fire_duration = 10.0;
      double fire_complete_time = 0.0;
      string weapon_name = "hel";
      WsfTrack mActiveTrack;
      WsfLaserWeapon weapon_system;
   end_script_variables

   on_initialize
      weapon_system = (WsfLaserWeapon)PLATFORM.Weapon(weapon_name);
   end_on_initialize

   # Logic to determine if a track is a missile
   script bool IsOK(WsfTrack aTrack)
      WsfPlatform targetPlatform = WsfSimulation.FindPlatform(aTrack.TargetIndex());
      bool isOk = targetPlatform.IsValid() && (targetPlatform.Side() != PLATFORM.Side());
      return isOk;
   end_script

   script WsfTrack FindBestTarget()
      double bestDistance = 1.0E20;
      WsfTrack missileTrack = null;
      WsfLocalTrackList tracks = PLATFORM.MasterTrackList();
      for (int i = 0; i < tracks.Count(); i=i+1)
      {
         WsfLocalTrack track = tracks.Entry(i);
         //writeln("Examining track, name ", track.TargetName());
         if (IsOK(track))
         {
            double dist = track.SlantRangeTo(PLATFORM);
            if (dist < bestDistance)
            {
               bestDistance = dist;
               missileTrack = track;
            }
         }
      }
      if (missileTrack.IsValid())
      {
         writeln("found ", missileTrack.TargetName());
      }
      return missileTrack;
   end_script

   on_update
      if (fire_complete_time > TIME_NOW)
      {
         if (mActiveTrack.IsValid())
         {
            string offset = mActiveTrack.AuxDataString("TARGET_OFFSET");
            if (! WsfSimulation.FindPlatform(mActiveTrack.TargetIndex()).IsValid())
            {
               fire_complete_time = TIME_NOW;
               weapon_system.CeaseFire();
               writeln("...Target ", mActiveTrack.TargetName(), " destroyed...");
            }
         }
         return;
      }
      if (weapon_system.IsFiring())
      {
         writeln(TIME_NOW, " ", PLATFORM.Name(), ": (cease fire).");
         weapon_system.CeaseFire();
      }
      WsfTrack target = FindBestTarget();
      if (target.IsValid())
      {
         mActiveTrack = target;
         //string offset = "CANOPY";
         string offset = "IRST";
         mActiveTrack.SetAuxData("TARGET_OFFSET", offset);
         writeln(TIME_NOW, ": firing at target: ", mActiveTrack.TargetName(), offset);
         weapon_system.Fire(mActiveTrack.TargetName(), offset);
         fire_complete_time = TIME_NOW + fire_duration;
      }
      else
      {
         //writeln("Target not valid!");
      }
   end_on_update

end_processor
```

- **演示要点**：演示 WSF_SCRIPT_PROCESSOR 的参数：on, update_interval, script_variables, on_initialize, script, on_update

### processor · WSF_SCRIPT_PROCESSOR｜处理器

- **关键词**：processor, WSF_SCRIPT_PROCESSOR, script_variables, on_initialize, on_initialize2, update_interval, on_update, on_message, 处理器
- **出处**：`p6dof/processors/missile_seeker.txt:10-96`　（同签名共 2 处，另见 `six_dof/processors/missile_seeker.txt:10`）
- **片段**：

```text
processor verbose_seeker_activation WSF_SCRIPT_PROCESSOR

   script_variables
      double turnOnRange_m = 40000.0;
      bool   sttMode       = false;
   end_script_variables

   on_initialize
   end_on_initialize

   on_initialize2
   end_on_initialize2

   update_interval 0.01 sec
   on_update

      WsfTrack trk = PLATFORM.CurrentTargetTrack();

      if( trk.IsValid() )
      {
        WsfSensor seeker = PLATFORM.SensorEntry(0);
        if( seeker.IsValid() )
        {
#         writeln("...cue to CurrentTargetTrack..." );
          seeker.CueToTrack(trk);
        }
      }

   end_on_update

   on_message
      type WSF_TRACK_MESSAGE
         script
            WsfSensor seeker         = PLATFORM.SensorEntry(0);
            WsfTrackMessage trackMsg = (WsfTrackMessage)MESSAGE;
            WsfTrack trk             = trackMsg.Track();

            WsfTrack currentTrk = PLATFORM.CurrentTargetTrack();
            
            if( !currentTrk.IsValid() )
            {
               # writeln("Current track not valid for missile seeker");
            }
            else
            {
               if( !trk.IsValid() )
               {
                  writeln("Track in track msg is not valid for missile seeker");
               }
               else
               {
                  if( trk.TargetIndex() == currentTrk.TargetIndex() )
                  {
                     seeker.CueToTrack(trk);
                  }
               }
            }

         end_script

      type WSF_DROP_TRACK_MESSAGE
         script
            WsfSensor seeker = PLATFORM.SensorEntry(0);
            writeln("!!! T=", TIME_NOW, " ", PLATFORM.Name(), " dropped track (WSF_DROP_TRACK_MESSAGE)");
         end_script

      type WSF_TRACK_DROP_MESSAGE
         script
            WsfSensor seeker = PLATFORM.SensorEntry(0);
            WsfLocalTrackList trackList = PLATFORM.MasterTrackList();
            writeln("!!! T=", TIME_NOW, " ", PLATFORM.Name(), " dropped track (WSF_TRACK_DROP_MESSAGE)");
         end_script

      type WSF_STATUS_MESSAGE
         script
            writeln("T=", TIME_NOW, " Missile WSF_STATUS_MESSAGE received...");
            WsfStatusMessage statMsg = (WsfStatusMessage)MESSAGE;
            writeln("     System:", statMsg.SystemName(), " has status=", statMsg.Status());
         end_script

      default
         script
            writeln("T=", TIME_NOW, " Missile received other message (", MESSAGE.Type(), ")");
         end_script
   end_on_message

end_processor
```

- **演示要点**：演示 WSF_SCRIPT_PROCESSOR 的参数：script_variables, on_initialize, on_initialize2, update_interval, on_update, on_message

### processor · WSF_TASK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TASK_PROCESSOR, number_of_servers, script_variables, on_initialize, on_track_drop, evaluation_interval, state, 处理器
- **出处**：`air_to_air/processors/sensor_cue_processor.txt:24-126`
- **片段**：

```text
processor SENSOR_CUE_PROCESSOR WSF_TASK_PROCESSOR
   number_of_servers 10
#   script_debug_writes enable
   script_variables
      # Sensor names of valid source tracks
      Set<string> mSourceSensorNames = Set<string>();
      
      # Name of cued sensor
      string mCuedSensorName = "";
      
      # Name of the tracking mode on the cued sensor
      string mTrackModeName = "";
      
      # Does the sensor require track designation to cue to the tracks
      bool mDesignationRequired = false;
      
      # DO NOT EDIT THESE VARIABLES
      WsfSensor mCuedSensor;
      string mDesignatorString = write_str("DESIGNSATED_", PLATFORM.Name());
   end_script_variables
   
   on_initialize 
      mCuedSensor = PLATFORM.Sensor(mCuedSensorName);
      if (!mCuedSensor.IsValid())
      {
         writeln("ERROR: ", mCuedSensorName, " is not a valid sensor on ", PLATFORM.Name());
         PROCESSOR.SetOperational(false);
      }
   end_on_initialize
   
   on_track_drop
      mCuedSensor.StopTracking(TRACK.TrackId());
      writeln_d("T=", TIME_NOW, " - ", PLATFORM.Name(), " dropped track for: ", TRACK.TargetName());
      if (mCuedSensor.ActiveRequestCount(mTrackModeName) <= 0) { mCuedSensor.CueToRelativeAzEl(0.0, -3.0); }   // platform flies at 3 deg AoA at all times
   end_on_track_drop

   
   
   evaluation_interval DETECTED 1 sec
   state DETECTED
      next_state CUED
         if (TRACK.IsValid() && TRACK.TimeSinceUpdated() < 30.0 && TIME_NOW > 60)
         {
            bool rangedTrackFound = false;
            for (int rawI = 0; rawI < TRACK.RawTrackCount(); rawI += 1)
            {
               WsfTrack rawTrack = TRACK.RawTrack(rawI);
               if (rawTrack.Originator() == PLATFORM &&
                  (mSourceSensorNames.Exists(rawTrack.SensorName()) ||
                   mSourceSensorNames.Exists("*")))
               {
                  if (rawTrack.LocationValid() || rawTrack.LocationValid2D())
                  {
                     rangedTrackFound = true;
                     if ((!mDesignationRequired || TRACK.AuxDataBool(mDesignatorString)) &&
                         mCuedSensor.ActiveRequestCount(mTrackModeName) < mCuedSensor.MaximumRequestCount(mTrackModeName))
                     {
                           writeln_d("T=", TIME_NOW, " - ", PLATFORM.Name(), " starting to track: ", TRACK.TargetName());
                           mCuedSensor.StartTracking(TRACK, mTrackModeName);
                           
                        return true;
                     }
                  }
               }
            }
            
            if (!rangedTrackFound)
            {
               return true;
            }
         }
         return false;
      end_next_state
   end_state
   
   evaluation_interval CUED 1 sec
   state CUED
      next_state DETECTED
         if (!TRACK.IsValid() || TRACK.TimeSinceUpdated() > 30.0 ||
            (mDesignationRequired && !TRACK.AuxDataBool(mDesignatorString)))
         {
            writeln_d("T=", TIME_NOW, " - ", PLATFORM.Name(), " stop tracking. ",TRACK.TargetName());
            writeln_d("  Track Valid: ", TRACK.IsValid(), " - Time Since Updated: ", TRACK.TimeSinceUpdated());
            mCuedSensor.StopTracking(TRACK.TrackId());
            return true;
         }
         
         if (!TRACK.LocationValid() && !TRACK.LocationValid2D())
         {
#            writeln("T=", TIME_NOW, " - ", PLATFORM.Name(), " cueing ", mCuedSensorName, " to ", TRACK.TargetName());
            mCuedSensor.CueToAzEl(TRACK.Bearing() - PLATFORM.Heading(), TRACK.Elevation());
         }
         else
         {
#            writeln("T=", TIME_NOW, " - ", PLATFORM.Name(), " cueing ", mCuedSensorName, " to ", TRACK.TargetName()
#            ," bearing error = ",PLATFORM.RelativeBearingTo(TRACK) - PLATFORM.RelativeBearingTo(TRACK.Target()));
#            mCuedSensor.CueToAzEl(PLATFORM.RelativeBearingTo(TRACK),TRACK.Elevation());
            mCuedSensor.StartTracking(TRACK, mTrackModeName);
         }
         return false;
      end_next_state
   end_state
end_processor
```

- **演示要点**：演示 WSF_TASK_PROCESSOR 的参数：number_of_servers, script_variables, on_initialize, on_track_drop, evaluation_interval, state

### processor · WSF_TASK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TASK_PROCESSOR, number_of_servers, track_update_interval, script_variables, script, evaluation_interval, state, 处理器
- **出处**：`cyber/exfiltrate_demo/platforms/iads_cmdr.txt:18-124`　（同签名共 3 处，另见 `iads/platforms/iads_cmdr.txt:18`、`electronic_warfare/test_false_targets/platforms/iads_cmdr.txt:18`）
- **片段**：

```text
processor IADS_CMDR_TASK_MGR WSF_TASK_PROCESSOR
   number_of_servers            5

   track_update_interval        10.0 sec

   #script_debug_writes true
   #show_state_transitions
   #show_task_messages

   script_variables
      int MAX_SAMS_PER_TARGET     = 2;
      int MAX_ASSIGNMENTS_PER_SAM = 4;
      string WEAPON_NAME          = "sam";
   end_script_variables

   // determine if TRACK is assignable
   script bool IsAssignable()
      if ((! TRACK.IFF_Friend()) &&
          (TRACK.TimeSinceUpdated() < 30.0))
      {
         return true;
      }

      return false;
   end_script

   // determine if the subordinate and/or his subordinates have weapons remaining
   script bool WeaponsAvailable(WsfPlatform aAssignee)
      bool weaponsAvailable = false;

      int quantity = 0;
      WsfWeapon weapon = aAssignee.Weapon(WEAPON_NAME);
      if (weapon.IsTurnedOn())
      {
         quantity = quantity + weapon.QuantityRemaining();
      }
      if (quantity > 0)
      {
         weaponsAvailable = true;
      }
      else
      {
         foreach (WsfPlatform sub in aAssignee.Subordinates())
         {
            weapon = sub.Weapon(WEAPON_NAME);
            if (weapon.IsTurnedOn())
            {
               quantity = quantity + weapon.QuantityRemaining();
            }
         }

         if (quantity > 0) weaponsAvailable = true;
      }

      return weaponsAvailable;
   end_script

   script void MakeAssignments()
      Array<WsfPlatform> filter = Array<WsfPlatform>();
      foreach (WsfPlatform sub in PLATFORM.Subordinates())
      {
         if (sub.Type() == "LARGE_SAM_BATTALION")
         {
            if (WeaponsAvailable(sub) &&
                (TasksAssignedTo(sub) < MAX_ASSIGNMENTS_PER_SAM) &&
                (TasksAssignedTo(sub, TRACK.TrackId()) < 1) &&
                (TRACK.WithinZoneOf(sub, "battalion_sector")))
            {
               writeln_d("*** Adding ", sub.Name(), " to filter");
               filter.PushBack(sub);
            }
         }
      }

      int i;
      int numAssignments = (int)MATH.Min(filter.Size(), MAX_SAMS_PER_TARGET);
      for (int i=0; i < numAssignments; i = i + 1)
      {
         AssignTask(TRACK, "ENGAGE", filter[i]);
      }
   end_script

# -------------------------------------------------------------------------

   evaluation_interval DETECTED 10.0 sec
   state DETECTED
      next_state ASSIGNED
         if (! IsAssignable()) return false;

         MakeAssignments();
         return true;
      end_next_state
   end_state

   evaluation_interval ASSIGNED 10.0 sec
   state ASSIGNED
      next_state DETECTED
         if (! IsAssignable())
         {
            CancelTask(TRACK.TrackId());
            return true;
         }
         MakeAssignments();
         return false;
      end_next_state
   end_state
end_processor
```

- **演示要点**：演示 WSF_TASK_PROCESSOR 的参数：number_of_servers, track_update_interval, script_variables, script, evaluation_interval, state

### processor · WSF_SCRIPT_PROCESSOR｜处理器

- **关键词**：processor, WSF_SCRIPT_PROCESSOR, internal_link, update_interval, script_variables, on_initialize, on_update, if, 处理器
- **出处**：`swarm/platforms/uhf_ew_radar_sensor_platform.txt:50-168`
- **片段**：

```text
   processor printout WSF_SCRIPT_PROCESSOR
      internal_link data_mgr
      update_interval 1 sec

      script_variables
         WsfDraw mDraw  =  WsfDraw(); # Will provide the track line
         WsfDraw ConDraw = WsfDraw(); # Gives the contributor line
         WsfDraw Con2Draw = WsfDraw(); # Gives the contributor line
         WsfDraw Con3Draw = WsfDraw(); # Gives the contributor line
      end_script_variables

      on_initialize
         # Red Line for Track to sensor
         mDraw.SetLineStyle("solid");
         mDraw.SetLineSize(3);
         mDraw.SetColor(1.0, 0.0, 0.0, 0.5);
         mDraw.SetDuration(1.0); # MATCH UPDATE INTERVAL!
         # Green line from platform shows where the sensor is reporting the target
         ConDraw.SetLineStyle("solid");
         ConDraw.SetLineSize(3);
         ConDraw.SetColor(0.0, 1.0, 0.0, 0.5);
         ConDraw.SetDuration(1.0); # MATCH UPDATE INTERVAL!
         # Blue line for platform to track location (who's contributing to the track)
         Con2Draw.SetLineStyle("solid");
         Con2Draw.SetLineSize(3);
         Con2Draw.SetColor(0.0, 0.0, 1.0, 0.5);
         Con2Draw.SetDuration(1.0); # MATCH UPDATE INTERVAL!
         # Gray for statecovariance ellipsoid
         Con3Draw.SetLineStyle("solid");
         Con3Draw.SetLineSize(3);
         Con3Draw.SetColor(0.5, 0.5, 0.5, 0.3); # Gray
         Con3Draw.SetDuration(1.0); # MATCH UPDATE INTERVAL!
         #int ConDrawNumber = 0;
      end_on_initialize

      on_update
      WsfLocalTrackList tracklist = PLATFORM.MasterTrackList();

      if (PLATFORM.MasterRawTrackList().Count() > 0)
      {
         writeln(TIME_NOW, " Number of Local Tracks is ", tracklist.Count(), " out of a total raw track count of ", PLATFORM.MasterRawTrackList().Count());
         string writeline = write_str("Total tracks reported by the platform track manager is ",
                                      tracklist.Count(), " out of a total raw track count of ",
                                      PLATFORM.MasterRawTrackList().Count());
         PLATFORM.Comment(writeline);
      }

      if (tracklist.Count() > 0)
      {
         foreach (WsfLocalTrack track in tracklist)
         {
            if (track.IsValid())
            {
               writeln(TIME_NOW, "  Track platform name is ", track.TargetName());
               writeln(TIME_NOW, "  Number of Contributors are ", track.RawTrackCount());

               WsfGeoPoint trackLocation = track.CurrentLocation();
               mDraw.BeginLines();
               mDraw.Vertex(PLATFORM);
               mDraw.Vertex(trackLocation);
               mDraw.End();
               for (int i=0; i < track.RawTrackCount(); i = i + 1)
               {
                  WsfTrack ContributorTrack = track.RawTrack(i);
                  WsfGeoPoint ContributorTrackLocation = ContributorTrack.CurrentLocation();
                  WsfPlatform ContributorTrackPlatform = ContributorTrack.Target();
                  if (ContributorTrackPlatform.IsValid())
                  {
                     double ContributorSlantrangeToTrack = ContributorTrackPlatform.SlantRangeTo(ContributorTrackLocation);
                     writeln(TIME_NOW, "   Contributor ", ContributorTrackPlatform.Name(), " is ", ContributorSlantrangeToTrack, " meters from reported track. Reported track is ",
                             PLATFORM.SlantRangeTo(trackLocation), " from sensor, contributor platorm is " , PLATFORM.SlantRangeTo(ContributorTrackPlatform), " meters from sensor");
                     #Draw a line to the platforms to the reported track location
                     #The reported track location will be a green ball.
                     ConDraw.BeginLines();
                     ConDraw.Vertex(ContributorTrackPlatform.Location());
                     ConDraw.Vertex(ContributorTrackLocation); #
                     ConDraw.End();
                     ConDraw.BeginEllipsoid(0, 50, 50, 50, 50, 50);
                     ConDraw.Vertex(ContributorTrackLocation);
                     ConDraw.End();
                     #Draw a line to where we THINK the contributors are...
                     Con2Draw.BeginLines();
                     Con2Draw.Vertex(ContributorTrackPlatform.Location());
                     Con2Draw.Vertex(trackLocation);
                     #Con2Draw.Vertex(ContributorTrackLocation);
                     Con2Draw.End();
                  }
               }

               WsfCovariance PWCS = track.StateCovariance();
               if(! PWCS.IsValid())
               PWCS = track.MeasurementCovariance();
               // Used to give the cov access to the track location, needed
               // for conversion to NED. ...Actually, this is not scriptable. The
               // call to track.StateCovariance() calls copy.
               ////PWCS.CopyTrackData(track);
                  if (PWCS.IsValid() && track.LocationValid())
                  {
                     // We can amplify the size to make it more findable
                     // in Mystic
                     double S = 1.0;
                     //WsfGeoPoint originatorLocation = track.OriginatorLocation();
                     Ellipsoid e2 = PWCS.EllipsoidNED();
                     Con3Draw.BeginEllipsoid(
                              e2.OrientationHeadingDeg(),
                              e2.OrientationPitchDeg(),
                              e2.OrientationRollDeg(),
                              e2.SemiAxisForward()*S,
                              e2.SemiAxisSide()*S,
                              e2.SemiAxisUp()*S
                     );
                     Con3Draw.Vertex(trackLocation);
                     Con3Draw.End();
                  }
               }
            }
         }
      end_on_update
   end_processor
```

- **演示要点**：演示 WSF_SCRIPT_PROCESSOR 的参数：internal_link, update_interval, script_variables, on_initialize, on_update, if

### processor · WSF_TASK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TASK_PROCESSOR, script_debug_writes, script_variables, on_initialize, script, evaluation_interval, state, 处理器
- **出处**：`base_types/processors/rcs_display_mgr.txt:16-139`
- **片段**：

```text
processor RCS_DISPLAY_MGR WSF_TASK_PROCESSOR

   script_debug_writes on
   #show_state_transitions
   #show_task_messages

   script_variables
      WsfDraw draw = WsfDraw();
      
      double mTrackUpdateStaleTime = 30.0; // seconds
   end_script_variables

   on_initialize
   end_on_initialize

   # Script to determine aspect of track location
   script Array<double> ComputeAspect()
      Array<double> AzEl;
      if (TRACK.ReportedLocation().IsValid())
      {
         AzEl = PLATFORM.AspectOf(TRACK.CurrentLocation(), 4.0/3.0);
      }
      return AzEl;
   end_script
   
   script void Draw()
      Array<double> AzEl = ComputeAspect();
      
      # use the track ID as a unique draw ID
      # a track icon and a line to the track icon
      # is drawn at each track update
      string trackId = TRACK.TrackId().ToString();
      double az = TRACK.Elevation();
      //draw.Erase(trackId);
      draw.SetId(trackId);
      draw.SetDuration(1.0); # this is faster than calling erase every time
      draw.SetColor(0,1,0);
      //draw.BeginIcons(TRACK.Heading(), "Wedge");
      //draw.BeginPolyline();
      //draw.Vertex(TRACK.CurrentLocation());
      //draw.End();

      # Draw a line to the track
      draw.SetLineStyle("dashed");
      draw.BeginLines();
      draw.Vertex(PLATFORM);
      draw.Vertex(TRACK.CurrentLocation());
      draw.End();
      
      draw.SetLineStyle("solid");
      draw.BeginPolyline();
      //writeln(TRACK.Target().Name());
      for (int i = -180; i < 180.0; i=i+1)
      {
         double r = 1000 * MATH.LinearToDB(1 + PLATFORM.RadarCrossSection(i,AzEl[1], "default", TRACK.Frequency()));
         //writeln("   r=", r, " Az=", i, " El=", AzEl[1]);
		 // Spherical (r, theta, phi) to Cartesian (x,y,z), ignoring elevation angle as we only do waterline display.
         double x = r * MATH.Cos(i + PLATFORM.Heading()); //sin(AzEl[1]);
         double y = r * MATH.Sin(i + PLATFORM.Heading()); // sin(AzEl[1]);
		 //double z = r * cos(AzEl[1]);
         //writeln("x=", x, " y=", y);
         draw.VertexNED(PLATFORM, x, y, 0.0);     
      }
      draw.End();
   end_script
   
   script bool StartDisplaying()
      if (TRACK.LocationValid() &&
          (
           //TRACK.TargetType() == "ACQ_RADAR" ||
           TRACK.TargetType() == "TTR_RADAR"
          )
         )
      {
         Draw();
         return true;
      }
      return false;
   end_script
   
   script void UpdateDisplay()
         Draw();
   end_script
   
   script void StopDisplaying()
      draw.Erase(TRACK.TrackId().ToString());
      writeln("erase: ", TRACK.TrackId().ToString());
   end_script

   evaluation_interval DETECTED 1.0 sec
   state DETECTED
      next_state START_DISPLAYING
         return ((TRACK.TimeSinceUpdated() < mTrackUpdateStaleTime) );
      end_next_state
   end_state

   evaluation_interval START_DISPLAYING 1.0 sec
   state START_DISPLAYING
      next_state DETECTED
         return (TRACK.TimeSinceUpdated() >= mTrackUpdateStaleTime);
      end_next_state

      next_state IS_DISPLAYING
         return StartDisplaying();
      end_next_state
   end_state

   evaluation_interval IS_DISPLAYING 1.0 sec
   state IS_DISPLAYING
      next_state START_DISPLAYING
         bool stopped = false;
         if (TRACK.TimeSinceUpdated() < mTrackUpdateStaleTime)
         {
            UpdateDisplay();
         }
         else
         {
            StopDisplaying();
            stopped = true;
         }
         return stopped;
      end_next_state
   end_state
end_processor
```

- **演示要点**：演示 WSF_TASK_PROCESSOR 的参数：script_debug_writes, script_variables, on_initialize, script, evaluation_interval, state

### processor · WSF_TASK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TASK_PROCESSOR, script_variables, on_message, script, on_track_drop, evaluation_interval, state, 处理器
- **出处**：`outer_air_battle/processors/blue_multirole_fighter_2_task_processor.txt:11-177`
- **片段**：

```text
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

- **演示要点**：演示 WSF_TASK_PROCESSOR 的参数：script_variables, on_message, script, on_track_drop, evaluation_interval, state

### processor · WSF_TASK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TASK_PROCESSOR, track_update_interval, script_variables, script, next_state, bool, if, 处理器
- **出处**：`laser_designator/platforms/uav.txt:32-201`
- **片段**：

```text
   processor task_mgr WSF_TASK_PROCESSOR 
      #show_state_transitions
      #show_task_messages
      track_update_interval 1.0 sec
      
      script_variables
         string SENSOR_NAME = "laser_tracker-1212";
         string WEAPON_NAME = "hellfire";
         double WEAPON_MAX_RNG = 7500;
         double WEAPON_MIN_RNG = 1500;
         double REQUIRED_TRACK_QUALITY    = 1.0; #whatever is feeding us the track it has to be good
         int SALVO_SIZE                   = 1;
         # the following are used internally and should not be modified by the user
         #string mTrackTaskStr     = "Track";
         string mShootTaskStr     = "Shoot";
      end_script_variables
      
      script bool InInterceptEnvelopeOf(WsfWeapon aWeapon)
         bool canIntercept = false;
         WsfTrackId id = TRACK.TrackId();       
         double targetrange = PLATFORM.GroundRangeTo(TRACK);
         if ((targetrange > WEAPON_MIN_RNG) && 
             (targetrange < WEAPON_MAX_RNG)  &&
             (Math.Fabs(PLATFORM.RelativeBearingTo(TRACK)) <= 5))
         {
            canIntercept = true;
            writeln_d("Target is in range to intercept");
         }
         return canIntercept;
      end_script

      script bool IsAssignable()  
         bool IsAssignable;    
          if((PLATFORM == PLATFORM.Commander()) || 
             (TRACK.TargetType() == "APC" ) && (TRACK.BelievedAlive()) &&             
             (TasksReceivedFor(TRACK.TrackId()) > 0))              
          {
             IsAssignable = true;
             PLATFORM.Sensor(SENSOR_NAME).TurnOn();
          }       
         return IsAssignable;       
      end_script

      script bool FiringNow()
         return (WeaponsActiveFor(TRACK.TrackId()) > 0);
      end_script 

      script void CancelTheTask()
         CancelTask(TRACK.TrackId());
      end_script 
          
      script bool HaveWeapons()
         WsfWeapon weapon = PLATFORM.Weapon(WEAPON_NAME);
         bool haveWeapons = false;
         if (weapon.QuantityRemaining() >= SALVO_SIZE)
         {
             haveWeapons = true;
         }
         return haveWeapons;
      end_script

      script bool LaunchWeapon()
         WsfWeapon   weapon;
         weapon = PLATFORM.Weapon(WEAPON_NAME);
         bool canInterceptNow = false;
         if (HaveWeapons())
         {
            canInterceptNow = ((InInterceptEnvelopeOf(weapon)) && (!FiringNow()));
         }
         bool launched = false;
         
         if (canInterceptNow)  
         {
            launched = Fire(TRACK, mShootTaskStr, weapon, SALVO_SIZE);
            
            if (launched)
            {
               writeln("*** T=", TIME_NOW, " ", PLATFORM.Name(), " ",
                      TRACK.TargetName(), " R=", PLATFORM.SlantRangeTo(TRACK),
                      " FIRE!!!!");
            }
         }
         return launched;
      end_script


# State Machine

  evaluation_interval IS_ASSIGNABLE 2.0 sec
  state IS_ASSIGNABLE
     next_state GOHOME
       
       bool weaponnotavail = false;
       if (! HaveWeapons())
         {
             #writeln("dont have weapons - duh");
             weaponnotavail = true;
         }
         return weaponnotavail;    
     end_next_state
  
     next_state ENGAGING
         bool Assignable = false;
         
         if ((IsAssignable()) && 
             
             ((PROCESSOR.CountInState("ENGAGING") < 1 ) || (PROCESSOR.CountInState("FIRED") < 1 )))
         {
            Assignable = true;
         } 
         #writeln("Got to here and Assignable = ", Assignable);
         return Assignable;        
     end_next_state
  end_state

  evaluation_interval GOHOME 2.0 sec
  state GOHOME  # Goes back to Loiter if out of weapons
      next_state GOHOME
         bool weaponavail = true; 
         if (! HaveWeapons())
         {
             weaponavail = false;
             PLATFORM.ReturnToRoute();
             writeln("Turning off launch computer");
             PROCESSOR.TurnOff();
         }
         return weaponavail;
      end_next_state
   end_state

   evaluation_interval ENGAGING 2.0 sec
   state ENGAGING  # Engages and fires the weapon if it can 
      next_state FIRED
         bool launched = false;
         PLATFORM.GoToLocation(TRACK.Latitude(), TRACK.Longitude());
         if (InInterceptEnvelopeOf(PLATFORM.Weapon(WEAPON_NAME)))
         {
             #writeln_d("Trying to launch weapon " );
             launched = LaunchWeapon();
         }
         return launched;
      end_next_state
   end_state
   
   evaluation_interval FIRED 4 seconds
   state FIRED   
      next_state  FIRED
         bool busy = false;
         if(TRACK.TrackQuality() > 0.95 && FiringNow())
         {
            busy = true;
         }
         return busy; 
      end_next_state 
      next_state IS_ASSIGNABLE
         bool done = false;
         if ((TimeSinceWeaponLastTerminatedFor(TRACK.TrackId()) > 0.0) && (TRACK.BelievedDead()))
 
         {
            TaskComplete(TRACK.TrackId(), "ENGAGE");
            CancelTheTask();
            PLATFORM.ReturnToRoute();
            done = true;
         }
         return done;
      end_next_state
   end_state     


   end_processor
```

- **演示要点**：演示 WSF_TASK_PROCESSOR 的参数：track_update_interval, script_variables, script, next_state, bool, if

### processor · WSF_RIPR_PROCESSOR｜处理器

- **关键词**：processor, WSF_RIPR_PROCESSOR, update_interval, debug, script_variables, on_initialize, script, on_update, 处理器
- **出处**：`base_types/processors/ripr_agents/aisoc/aisoc_processor_fez.txt:16-251`
- **片段**：

```text
   processor AISOC-thinker WSF_RIPR_PROCESSOR

      update_interval 5.0 seconds
      #script_debug_writes on
      #script_debug_writes off
      debug

      script_variables
        WsfClusterManager cManager;
        int               mMaxJobWinners       = 1;
        int               mLastNumClusters     = 0;
        bool              mDrawClusters        = true;
        WsfDraw           mDraw                = WsfDraw();
        Map<string, int>  mClusterNameJobIdMap = Map<string, int>();
      end_script_variables

      on_initialize
        //SetJobAllocationMode(2);
        cManager = WsfClusterManager.Create();               //creates a cluster manager owned by this script
        cManager.SetClusterMethod("H_TREE_MAX");             //default is: "K_MEANS"
        cManager.SetDistanceFunction("POSITION_VELOCITY");   //default is: "POSITION_ONLY"
        //cManager.SetDistanceLimit(92600);                  //default is: 100 meters, set to ~50 nautical miles
        cManager.SetDistanceLimit(46300);                    //default is: 100 meters, set to ~25 nautical miles
        mDraw.SetColor(1.0,0.5,0.0);  //orange?
        mDraw.SetLineStyle("solid");
        mDraw.SetLineSize(2);
        mDraw.SetDuration(5);
      end_on_initialize


      script void draw_cluster_hull(WsfCluster cluster)
        Array<WsfGeoPoint> pts = cluster.ConvexHull();
        //writeln_d("   ~~~ SOC cluster convex hull pts: ", pts.Size());
        if (pts.Size() <= 0)
        {
           return;
        }
        WsfGeoPoint first = pts.Get(0);
        mDraw.BeginPolyline();
          for (int j = 0; j < pts.Size(); j = j + 1 )
          {
             WsfGeoPoint pt = pts.Get(j);
             mDraw.Vertex(pt);
             //writeln_d("   ~~~ SOC cluster convex hull pt ", j+1, ": ", pt.Latitude(), ", ", pt.Longitude());
          }
          mDraw.Vertex(first);
        mDraw.End();
      end_script


      on_update

        //writeln_d("   ~~~ SOC tracklist count:       ", localTracks.Count());
        WsfLocalTrackList localTracks = PLATFORM.MasterTrackList();
        cManager.UpdateClusters(TIME_NOW,localTracks);
        int NumClusters = cManager.Count();

        for (int i = 0; i < NumClusters; i = i + 1 )
        {
          WsfCluster cluster = cManager.Entry(i);
          string ClusterName = PLATFORM.Name() + "_" + (string)i;

          //create a zone that bounds this cluster, with some padding
          //anybody can call up this zone by name to check if a threat is inside it

          //no need to have a zone on the platform: deprecated!
          //cluster.UpdatePlatformZone(PLATFORM,ClusterName,(5.0/60.0));   //5 minutes (1/12th of a degree)

          if (mDrawClusters == true)
          {
            draw_cluster_hull(cluster);
          }

          WsfGeoPoint clusterPoint = cluster.MeanLocation();
          double clusterBearing = cluster.Bearing();
          bool clusterBearingValid = cluster.BearingValid();

          //writeln_d("~~~ SOC - cluster ", ClusterName, ", BEARING ", clusterBearing, " bearing valid: ", clusterBearingValid );

          int numThreats = cluster.Count();
          double ClusterPriority = (double)numThreats;

          if( numThreats > 0 )
          {
            if( mClusterNameJobIdMap.Exists( ClusterName ) )
            {
              //writeln_d("~~~ SOC, updating job for cluster: ", ClusterName);

              //job exists for zone with threats, update job priority
              int jobId = mClusterNameJobIdMap.Get( ClusterName );
              WsfRIPRJob temp = GetJobById( jobId );

              //job priority could have changed, set it
              temp.Priority( ClusterPriority );
              temp.SetData( "ZonePoint", clusterPoint );
              temp.SetData( "ZoneBearing", clusterBearing );
              temp.SetData( "ZoneBearingValid", clusterBearingValid );
              //number of threats inside zone could have changed, set it
              temp.SetData( "ZoneNumThreats", numThreats );

              bool anyInsideMEZ = false;
              Array<string> arr = Array<string>();
              for (int i = 0; i < numThreats; i = i + 1 )
              {
                WsfTrack threat = cluster.Entry(i);
                arr.PushBack(threat.TargetName());
                if (threat.WithinZoneOf(PLATFORM,"MEZ"))
                {
                  anyInsideMEZ = true;
                  writeln_d("~~~ SOC, threat inside MEZ");   // dlc
                }
              }


              // dlc
              bool anyInsideFEZ = false;
              // Array<string> arr = Array<string>();
              for (int i = 0; i < numThreats; i = i + 1 )
              {
                WsfTrack threat = cluster.Entry(i);
                arr.PushBack(threat.TargetName());
                if (threat.WithinZoneOf(PLATFORM,"FEZ"))
                {
                  anyInsideFEZ = true;
                  writeln_d("~~~ SOC, threat inside FEZ");
                }
              }

/*
              temp.SetData( "ZoneThreatNameArray", arr );
              if (anyInsideMEZ)
              {
                temp.SetData( "for_air",    0 );
                temp.SetData( "for_ground", 1 );
              }
              else
              {
                temp.SetData( "for_air",    1 );
                temp.SetData( "for_ground", 0 );
              }
*/

              temp.SetData( "ZoneThreatNameArray", arr );
              if (anyInsideMEZ)
              {
                temp.SetData( "for_air",    0 );
                temp.SetData( "for_ground", 1 );
              }
              else if (anyInsideFEZ)
              {
                temp.SetData( "for_air",    1 );
                temp.SetData( "for_ground", 0 );
              }
              else
              {
                temp.SetData( "for_air",    0 );
                temp.SetData( "for_ground", 0 );
              }

              // cld


            }
            else
            {
              //zone just became hot, job not created yet, create one
              WsfRIPRJob temp = WsfRIPRJob.Create( PROCESSOR,
                                                   "zone",
                                                   "zone-" + ClusterName,
                                                   ClusterPriority,
                                                   mMaxJobWinners );
              temp.SetData( "ZoneName", ClusterName );
              temp.SetData( "ZonePoint", clusterPoint );
              temp.SetData( "ZoneBearing", clusterBearing );
              temp.SetData( "ZoneBearingValid", clusterBearingValid );
              temp.SetData( "ZoneNumThreats", numThreats );
              Array<string> arr = Array<string>();
              for (int i = 0; i < numThreats; i = i + 1 )
              {
                arr.PushBack(cluster.Entry(i).TargetName());
              }
              temp.SetData( "ZoneThreatNameArray", arr );

              AddJob(temp);
              mClusterNameJobIdMap.Set( ClusterName, temp.GetId() );

              //writeln_d("~~~ SOC, creating job for cluster: ", ClusterName);
              writeln_d("~~~ ", PLATFORM.Name(), " job change, ADD: ", temp.Name() );

              string NewComment = "SOC - " + PLATFORM.Name() + " job change, ADD: " + (temp.Name());
              PLATFORM.Comment(NewComment);
            }
          }
          else
          {
            //no threats in cluster, make sure job for cluster doesn't exist or is deleted
            if( mClusterNameJobIdMap.Exists( ClusterName ) )
            {
              //writeln_d("~~~ SOC, removing job for empty cluster: ", ClusterName);
              int jobId = mClusterNameJobIdMap.Get(ClusterName);
              writeln_d("~~~ ", PLATFORM.Name(), " job change, REMOVE: ", GetJobById(jobId).Name() );

              string NewComment = "SOC - " + PLATFORM.Name() + " job change, REMOVE: " + (GetJobById(jobId).Name());
              PLATFORM.Comment(NewComment);

              RemoveJob( GetJobById(jobId) );
              //mClusterNameJobIdMap.Erase( ClusterName );
              mClusterNameJobIdMap.Remove( ClusterName );
            }
          }
        }

        //remove any additional clusters
        for( int j = NumClusters; j < mLastNumClusters; j = j+1 )
        {
          string ClusterName = PLATFORM.Name() + "_" + (string)j;
          if( mClusterNameJobIdMap.Exists( ClusterName ) )
          {
            //writeln_d("~~~ SOC, removing job for empty cluster: ", ClusterName);
            int jobId = mClusterNameJobIdMap.Get(ClusterName);
            writeln_d("~~~ ", PLATFORM.Name(), " job change, REMOVE: ", GetJobById(jobId).Name() );

            string NewComment = "SOC - " + PLATFORM.Name() + " job change, REMOVE: " + (GetJobById(jobId).Name());
            PLATFORM.Comment(NewComment);

            RemoveJob( GetJobById(jobId) );
            //mClusterNameJobIdMap.Erase( ClusterName );
            mClusterNameJobIdMap.Remove( ClusterName );
          }
        }

        mLastNumClusters = NumClusters;

      end_on_update

   end_processor
```

- **演示要点**：演示 WSF_RIPR_PROCESSOR 的参数：update_interval, debug, script_variables, on_initialize, script, on_update

### processor · WSF_RIPR_PROCESSOR｜处理器

- **关键词**：processor, WSF_RIPR_PROCESSOR, script_debug_writes, update_interval, script_variables, on_initialize, script, on_update, 处理器
- **出处**：`base_types/processors/ripr_agents/aisoc/aisoc_processor.txt:16-258`
- **片段**：

```text
   processor AISOC-thinker WSF_RIPR_PROCESSOR

      #debug
      #script_debug_writes on
      script_debug_writes off

      update_interval 5.0 seconds

      script_variables
        WsfClusterManager cManager;
        int               mMaxJobWinners       = 2;
        int               mLastNumClusters     = 0;
        bool              mDrawClusters        = true;
        WsfDraw           mDraw                = WsfDraw();
        Map<string, int>  mClusterNameJobIdMap = Map<string, int>();
      end_script_variables

      on_initialize
        SetJobAllocationMode(2);

        cManager = WsfClusterManager.Create();               //creates a cluster manager owned by this script
        cManager.SetClusterMethod("H_TREE_MAX");             //default is: "H_TREE_MAX"
        cManager.SetDistanceFunction("POSITION_VELOCITY");   //default is: "POSITION_ONLY"
        //cManager.SetDistanceLimit(92600);                  //default is: 100 meters, set to ~50 nautical miles
        cManager.SetDistanceLimit(40000);                    //default is: 100 meters, set to ~25 nautical miles

        mDraw.SetLineStyle("solid");
        mDraw.SetLineSize(5);
        mDraw.SetDuration(5);
      end_on_initialize


      script void draw_cluster_hull(WsfCluster cluster)
        Array<WsfGeoPoint> pts = cluster.ConvexHull();
        //writeln_d("   ~~~ SOC cluster convex hull pts: ", pts.Size());
        if (pts.Size() <= 0)
        {
           return;
        }
        WsfGeoPoint first = pts.Get(0);
        mDraw.SetColor(1.0,0.5,0.0);
        mDraw.BeginPolyline();
          for (int j = 0; j < pts.Size(); j = j + 1 )
          {
             WsfGeoPoint pt = pts.Get(j);
             mDraw.Vertex(pt);
             //writeln_d("   ~~~ SOC cluster convex hull pt ", j+1, ": ", pt.Latitude(), ", ", pt.Longitude());
          }
          mDraw.Vertex(first);
        mDraw.End();
      end_script


      on_update
         writeln_d( "AISOC on_update" );

        WsfLocalTrackList localTracks = PLATFORM.MasterTrackList();
        writeln_d("   ~~~ SOC tracklist count:       ", localTracks.Count());
        cManager.UpdateClusters(TIME_NOW,localTracks);
        int NumClusters = cManager.Count();

        for (int i = 0; i < NumClusters; i = i + 1 )
        {
          WsfCluster cluster = cManager.Entry(i);
          string ClusterName = PLATFORM.Name() + "_" + (string)i;

          //create a zone that bounds this cluster, with some padding
          //anybody can call up this zone by name to check if a threat is inside it

          //no need to have a zone on the platform: deprecated!
          //cluster.UpdatePlatformZone(PLATFORM,ClusterName,(5.0/60.0));   //5 minutes (1/12th of a degree)

          if (mDrawClusters == true)
          {
            draw_cluster_hull(cluster);
          }

          WsfGeoPoint clusterPoint = cluster.MeanLocation();
          double clusterBearing = cluster.Bearing();
          bool clusterBearingValid = cluster.BearingValid();

          writeln_d("   ~~~ SOC - cluster ", ClusterName, ", BEARING ", clusterBearing, " bearing valid: ", clusterBearingValid );

          int numThreats = cluster.Count();
          double ClusterPriority = (double)numThreats;

          if( numThreats > 0 )
          {
            if( mClusterNameJobIdMap.Exists( ClusterName ) )
            {
              writeln_d("   ~~~ SOC, updating job for cluster: ", ClusterName);

              //job exists for zone with threats, update job priority
              int jobId = mClusterNameJobIdMap.Get( ClusterName );
              WsfRIPRJob temp = GetJobById( jobId );

              //job priority could have changed, set it
              temp.Priority( ClusterPriority );
              temp.SetData( "ZonePoint", clusterPoint );
              temp.SetData( "ZoneBearing", clusterBearing );
              temp.SetData( "ZoneBearingValid", clusterBearingValid );
              //number of threats inside zone could have changed, set it
              temp.SetData( "ZoneNumThreats", numThreats );

              bool anyInsideMEZ = false;
              bool anyInsideFEZ = false;
              Array<string> arr = Array<string>();
              for (int i = 0; i < numThreats; i = i + 1 )
              {
                WsfTrack threat = cluster.Entry(i);
                arr.PushBack(threat.TargetName());
                if ( threat.WithinZoneOf(PLATFORM,"MEZ") ||
                     threat.WithinZoneOf(PLATFORM,"mez") )
                {
                  anyInsideMEZ = true;
                }
                else if (  threat.WithinZoneOf(PLATFORM,"FEZ") ||
                           threat.WithinZoneOf(PLATFORM,"fez") )
                {
                  anyInsideFEZ = true;
                }
              }
              temp.SetData( "ZoneThreatNameArray", arr );

              if (anyInsideMEZ)
              {
                temp.SetData( "for_air",    0 );
                temp.SetData( "for_ground", 1 );
              }
              else if (anyInsideFEZ)
              {
                temp.SetData( "for_air",    1 );
                temp.SetData( "for_ground", 0 );
              }
              else
              {
                temp.SetData( "for_air",    1 );
                temp.SetData( "for_ground", 1 );
              }
            }
            else
            {
              //zone just became hot, job not created yet, create one
              WsfRIPRJob temp = WsfRIPRJob.Create( PROCESSOR,
                                                   "zone",
                                                   "zone-" + ClusterName,
                                                   ClusterPriority,
                                                   mMaxJobWinners );
              temp.SetData( "ZoneName", ClusterName );
              temp.SetData( "ZonePoint", clusterPoint );
              temp.SetData( "ZoneBearing", clusterBearing );
              temp.SetData( "ZoneBearingValid", clusterBearingValid );
              temp.SetData( "ZoneNumThreats", numThreats );

              bool anyInsideMEZ = false;
              bool anyInsideFEZ = false;
              Array<string> arr = Array<string>();
              for (int i = 0; i < numThreats; i = i + 1 )
              {
                WsfTrack threat = cluster.Entry(i);
                arr.PushBack(threat.TargetName());
                if ( threat.WithinZoneOf(PLATFORM,"MEZ") ||
                     threat.WithinZoneOf(PLATFORM,"mez") )
                {
                  anyInsideMEZ = true;
                }
                else if (  threat.WithinZoneOf(PLATFORM,"FEZ") ||
                           threat.WithinZoneOf(PLATFORM,"fez") )
                {
                  anyInsideFEZ = true;
                }
              }
              temp.SetData( "ZoneThreatNameArray", arr );

              if (anyInsideMEZ)
              {
                temp.SetData( "for_air",    0 );
                temp.SetData( "for_ground", 1 );
              }
              else if (anyInsideFEZ)
              {
                temp.SetData( "for_air",    1 );
                temp.SetData( "for_ground", 0 );
              }
              else
              {
                temp.SetData( "for_air",    1 );
                temp.SetData( "for_ground", 1 );
              }

              AddJob(temp);
              mClusterNameJobIdMap.Set( ClusterName, temp.GetId() );

              writeln_d("   ~~~ SOC, creating job for cluster: ", ClusterName);
              //writeln_d("   ~~~ ", PLATFORM.Name(), " job change, ADD: ", temp.Name() );

              string NewComment = "SOC - " + PLATFORM.Name() + " job change, ADD: " + (temp.Name());
              PLATFORM.Comment(NewComment);
            }
          }
          else
          {
            //no threats in cluster, make sure job for cluster doesn't exist or is deleted
            if( mClusterNameJobIdMap.Exists( ClusterName ) )
            {
              writeln_d("   ~~~ SOC, removing job for empty cluster: ", ClusterName);
              int jobId = mClusterNameJobIdMap.Get(ClusterName);
              //writeln_d("~~~ ", PLATFORM.Name(), " job change, REMOVE: ", GetJobById(jobId).Name() );

              string NewComment = "SOC - " + PLATFORM.Name() + " job change, REMOVE: " + (GetJobById(jobId).Name());
              PLATFORM.Comment(NewComment);

              RemoveJob( GetJobById(jobId) );
              //mClusterNameJobIdMap.Erase( ClusterName );
              mClusterNameJobIdMap.Remove( ClusterName );
            }
          }
        }

        //remove any additional clusters
        for( int j = NumClusters; j < mLastNumClusters; j = j+1 )
        {
          string ClusterName = PLATFORM.Name() + "_" + (string)j;
          if( mClusterNameJobIdMap.Exists( ClusterName ) )
          {
            writeln_d("~~~ SOC, removing job for empty cluster: ", ClusterName);
            int jobId = mClusterNameJobIdMap.Get(ClusterName);
            //writeln_d("~~~ ", PLATFORM.Name(), " job change, REMOVE: ", GetJobById(jobId).Name() );

            string NewComment = "SOC - " + PLATFORM.Name() + " job change, REMOVE: " + (GetJobById(jobId).Name());
            PLATFORM.Comment(NewComment);

            RemoveJob( GetJobById(jobId) );
            //mClusterNameJobIdMap.Erase( ClusterName );
            mClusterNameJobIdMap.Remove( ClusterName );
          }
        }

        mLastNumClusters = NumClusters;

      end_on_update

   end_processor
```

- **演示要点**：演示 WSF_RIPR_PROCESSOR 的参数：script_debug_writes, update_interval, script_variables, on_initialize, script, on_update

### processor · WSF_TASK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TASK_PROCESSOR, script_variables, on_track_drop, script, evaluation_interval, time_to_evaluate, state, 处理器
- **出处**：`space_operations/processors/anti_ballistic_missile_processor.txt:19-287`
- **片段**：

```text
processor ANTI_BALLISTIC_MISSILE_PROCESSOR WSF_TASK_PROCESSOR
   # show_state_transitions
   # show_task_messages
   # script_debug_writes on

   script_variables
      string WEAPON_NAME          = "sam"; # Change in scenario or platform
      double LAUNCH_DELAY         = 0;
      double SALVO_SIZE           = 1;
      double SALVO_DELAY          = 0.0;
      double REQUIRED_TRACK_QUALITY = 0.98;
      bool   SUBS_HAVE_WEAPONS    = true;  # Subordinates have weapons (separate launchers).
      Map<WsfTrackId, double> LaunchFutureTimeMap = Map<WsfTrackId, double>(); # Saves out the time of the launch
      Map<WsfTrackId, WsfPlatform> SubordinateLauncherMap = Map<WsfTrackId, WsfPlatform>(); # Only used if SUBS_HAVE_WEAPONS
   end_script_variables

   on_track_drop
     LaunchFutureTimeMap.Erase(TRACK.TrackId()); # Get rid of the time to launch since we dont have a track anymore.
   end_on_track_drop

   script bool Engageable()
      bool engageable = false;
      if ((PLATFORM == PLATFORM.Commander())   ||  # SELF Commanded ?
          (OperatingLevelFor("ENGAGE") > 0)    ||  # Processor set to ENGAGE?
          (TRACK.BelievedAlive())              ||  # Not believed dead...
          (TasksReceivedFor(TRACK.TrackId())))     # Been tasked to go after the TRACK?
      {
         engageable = true;
      }
      return engageable;
   end_script

   script bool WeaponQualityTrack()
      bool weaponQualityTrack = false;
      if (TRACK.TrackQuality() > REQUIRED_TRACK_QUALITY)
      {
         weaponQualityTrack = true;
      }
      return weaponQualityTrack;
   end_script

   script bool WeaponActive()
     return (WeaponsActiveFor(TRACK.TrackId()) > 0); # Already got one in the air against it
   end_script



   //Find a weapon and check its launch computer to see if it will work.
   script bool Find_Launch_Solution()
      bool LaunchSolutionFound = false;
      # Loop over the subordinates first.  If no weapons found, then look at yourself.
      if (SUBS_HAVE_WEAPONS)
      {
         foreach (WsfPlatform sub in PLATFORM.Subordinates())
         {
            #writeln("The subordinate name is ", sub.Name());
            WsfWeapon weap = sub.Weapon(WEAPON_NAME);

            if (!weap.IsValid())
            {
               #writeln("Going to next sub because the sub name is ", sub.Name());
               continue; # Not a valid weapon...
            }
            if (weap.IsTurnedOn() && TRACK.IsValid()  &&
                weap.QuantityRemaining() >= SALVO_SIZE  &&
                TasksAssignedTo(sub, "", weap.Name()) == 0)
            {
                WsfLaunchComputer computer = weap.LaunchComputer();
                computer.ComputeLaunchWindows();
                #writeln("The missile can intercept value is ", computer.CanIntercept(TRACK));
                // Now check to see if any LaunchWindow can intercept
                #writeln("The sub name is ", sub.Name());
                #writeln("The launch computer is ", computer);
                #writeln("First launch time is ", computer.FirstLaunchTime(0));
                #writeln("The time to launch is ", computer.LaunchTime());
                #writeln("The TRACK is ", TRACK);
                if (! computer.CanIntercept(TRACK, LAUNCH_DELAY))
                {
                   #writeln("Made it to here - No launch Windows Found!");
                   continue;
                }
                LaunchFutureTimeMap[TRACK.TrackId()] = computer.LaunchTime();
                SubordinateLauncherMap[TRACK.TrackId()] = sub;
                LaunchSolutionFound = true;
                break;
                #return LaunchSolutionFound;
            }
         }
      }
      else
      {
         WsfWeapon weap = PLATFORM.Weapon(WEAPON_NAME);
         if (!weap.IsValid())
            {
               return LaunchSolutionFound; # Not a valid weapon...
            }
         if (weap.IsTurnedOn() &&
                TRACK.IsValid()  &&
                weap.QuantityRemaining() >= SALVO_SIZE  &&
                TasksAssignedTo(PLATFORM, "", weap.Name()) == 0)
            {
                WsfLaunchComputer computer = weap.LaunchComputer();
                computer.ComputeLaunchWindows();
                // Now check to see if any LaunchWindow can intercept
                if (computer.CanIntercept(TRACK, LAUNCH_DELAY))
                {
                   LaunchFutureTimeMap[TRACK.TrackId()] = computer.LaunchTime();
                   LaunchSolutionFound = true;
                   #return LaunchSolutionFound;
                }
            }
      }
      return LaunchSolutionFound;
   end_script


   script bool ScheduleTheLaunch()
      bool LaunchScheduled = false;
         if ((TRACK.IsValid()) && (LaunchFutureTimeMap[TRACK.TrackId()] - TIME_NOW < (LAUNCH_DELAY + 5)))
         {
             if(SUBS_HAVE_WEAPONS)
             {
             WsfPlatform       sub = SubordinateLauncherMap[TRACK.TrackId()]; # Get the subordinate that we found
             WsfLaunchComputer computer = sub.Weapon(WEAPON_NAME).LaunchComputer();
             #WsfWeapon         weap = sub.Weapon(WEAPON_NAME);
             computer.ComputeEndPoint();
                if (computer.CanIntercept(TRACK, LAUNCH_DELAY))
                {
                   LaunchFutureTimeMap[TRACK.TrackId()] = computer.LaunchTime();
                   ExecuteAtTime(computer.LaunchTime(),  "Launch", {TRACK.TrackId(), SALVO_SIZE});
                   LaunchScheduled = true;
                   return LaunchScheduled;
                }
             }
             else
             {
                WsfLaunchComputer computer = PLATFORM.Weapon(WEAPON_NAME).LaunchComputer();
                computer.ComputeEndPoint();
                if (computer.CanIntercept(TRACK, LAUNCH_DELAY) )
                {
                   LaunchFutureTimeMap[TRACK.TrackId()] = computer.LaunchTime();
                   ExecuteAtTime(computer.LaunchTime(),  "Launch", {TRACK.TrackId(), SALVO_SIZE});
                   LaunchScheduled = true;
                   return LaunchScheduled;
                }
             }
         }
      return  LaunchScheduled;
   end_script

   script void Launch(WsfTrackId aTrackId, int aSalvoSize)
      WsfLocalTrack LocalTrack = PLATFORM.MasterTrackList().Find(aTrackId);
      if (LocalTrack.BelievedAlive() && LocalTrack.IsValid())
      {
         if (SUBS_HAVE_WEAPONS)
         {
            WsfPlatform sub = SubordinateLauncherMap[LocalTrack.TrackId()];
            WsfWeapon weap = sub.Weapon(WEAPON_NAME);
            bool Launched = Fire(LocalTrack, "FIRE", weap.Name(), 1, sub);
            if ((SALVO_SIZE > 1) && (weap.QuantityRemaining() > 0))
            {
               if (SALVO_DELAY > 0.0)
               {
                  ExecuteAtTime(TIME_NOW + 0.25, "LaunchSalvo", {LocalTrack.TrackId(), aSalvoSize - 1 });
               }
               else
               {
                  Launch(LocalTrack.TrackId(), aSalvoSize - 1);
               }
            }
         }
         else
         {
            WsfWeapon weap = PLATFORM.Weapon(WEAPON_NAME);
            bool Launched = Fire(LocalTrack, "FIRE", weap.Name(), 1, PLATFORM);
            if ((SALVO_SIZE > 1) && (weap.QuantityRemaining() > 0))
            {
               if (SALVO_DELAY > 0.0)
               {
                  ExecuteAtTime(TIME_NOW + 0.25, "LaunchSalvo", {LocalTrack.TrackId(), aSalvoSize - 1 });
               }
               else
               {
                  Launch(LocalTrack.TrackId(), aSalvoSize - 1);
               }
            }
         }
      }
   end_script

   script void LaunchSalvo(WsfTrackId aTrackId, int aSalvoSize)
      WsfLocalTrack LocalTrack = PLATFORM.MasterTrackList().Find(aTrackId);
      if (LocalTrack.IsValid())
      {
         if (SUBS_HAVE_WEAPONS)
         {
            WsfPlatform sub = SubordinateLauncherMap[LocalTrack.TrackId()];
            WsfLaunchComputer comp = sub.Weapon(WEAPON_NAME).LaunchComputer();
            if (comp.CanIntercept(LocalTrack, SALVO_DELAY))
            {
               LaunchFutureTimeMap[LocalTrack.TrackId()] = comp.LaunchTime();
            }
         }
         else
         {
            WsfLaunchComputer computer = PLATFORM.Weapon(WEAPON_NAME).LaunchComputer();
            if (computer.CanIntercept(LocalTrack, SALVO_DELAY))
            {
               LaunchFutureTimeMap[LocalTrack.TrackId()] = computer.LaunchTime();
            }
         }
      }
   end_script

#######################################################################################
##START OF STATE MACHINE
#######################################################################################
   evaluation_interval DETECTED 4 sec
   time_to_evaluate    DETECTED 4 sec
   state DETECTED
      next_state  ENGAGING
        return (Engageable() && (! TRACK.IFF_Friend()) && staging_failure);
      end_next_state
   end_state

   evaluation_interval ENGAGING 4 sec
   time_to_evaluate    ENGAGING 4 sec
   state ENGAGING
      next_state DETECTED
         return (TRACK.BelievedDead()) || (WeaponActive());
      end_next_state

      next_state FIND_LAUNCH_SOLUTION # Looks for a weapon that can hit it if we have a good track
         return WeaponQualityTrack();  # Track quality of weapons grade
      end_next_state
   end_state

   evaluation_interval FIND_LAUNCH_SOLUTION 10 sec
   time_to_evaluate    FIND_LAUNCH_SOLUTION  5 sec
   state  FIND_LAUNCH_SOLUTION
      next_state ENGAGING
         return (!Find_Launch_Solution());
      end_next_state
      next_state  SCHEDULE_LAUNCH
         return Find_Launch_Solution();
      end_next_state
   end_state

   evaluation_interval SCHEDULE_LAUNCH 1 sec
   state  SCHEDULE_LAUNCH
      next_state FIND_LAUNCH_SOLUTION
          return (TIME_NOW > (LaunchFutureTimeMap[TRACK.TrackId()] + 5.0 )); # Way past the time of scheduled launch...
      end_next_state
      next_state WAIT
          return ScheduleTheLaunch();
      end_next_state
   end_state

   evaluation_interval WAIT 1 sec
   state WAIT
      next_state WAIT
         return (TIME_NOW < LaunchFutureTimeMap[TRACK.TrackId()]); # Still havent fired.
      end_next_state
      next_state DETECTED
         #return (!WeaponActive());
         return (WeaponsActiveFor(TRACK.TrackId()) == 0);
      end_next_state
   end_state
end_processor
```

- **演示要点**：演示 WSF_TASK_PROCESSOR 的参数：script_variables, on_track_drop, script, evaluation_interval, time_to_evaluate, state

### processor · WSF_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TRACK_PROCESSOR, purge_interval, report_interval, report_to, fused_track_reporting, raw_track_reporting, 处理器
- **出处**：`base_types/platforms/brawler/brawler_platform.txt:118-124`　（同签名共 8 处，另见 `aea_iads/platforms/red_radar_company.txt:35`、`cyber/exfiltrate_demo/platforms/red_radar_company.txt:35`、`electronic_warfare/test_false_targets/platforms/red_radar_company.txt:33`）
- **片段**：

```text
   processor data_mgr WSF_TRACK_PROCESSOR
      purge_interval  60 sec
      report_interval 1.0 sec
      report_to commander via datalink
      fused_track_reporting on
      raw_track_reporting off
   end_processor
```

- **演示要点**：演示 WSF_TRACK_PROCESSOR 的参数：purge_interval, report_interval, report_to, fused_track_reporting, raw_track_reporting

### processor · WSF_GUIDANCE_COMPUTER｜处理器

- **关键词**：processor, WSF_GUIDANCE_COMPUTER, proportional_navigation_gain, velocity_pursuit_gain, g_bias, maximum_commanded_g, update_interval, 处理器
- **出处**：`air_to_air/weapons/aam/short_range_ir_missile.txt:137-143`　（同签名共 12 处，另见 `base_types/weapons/aam/blue_sr_a2a_ir_missile.txt:67`、`brawler/weapons/aam/blue_sr_a2a_ir_missile.txt:67`、`electronic_warfare/track_error.txt:298`）
- **片段**：

```text
   processor srm_autopilot WSF_GUIDANCE_COMPUTER
      proportional_navigation_gain  30.0
      velocity_pursuit_gain         30.0
      g_bias                         1.0
      maximum_commanded_g           40.0 g
      update_interval                0.1 s
   end_processor
```

- **演示要点**：演示 WSF_GUIDANCE_COMPUTER 的参数：proportional_navigation_gain, velocity_pursuit_gain, g_bias, maximum_commanded_g, update_interval

### processor · WSF_GUIDANCE_COMPUTER｜处理器

- **关键词**：processor, WSF_GUIDANCE_COMPUTER, proportional_navigation_gain, velocity_pursuit_gain, g_bias, maximum_commanded_g, guidance_delay, 处理器
- **出处**：`alternate_locations/weapons/agm/blue_glide_bomb_1.txt:36-42`　（同签名共 16 处，另见 `alternate_locations/weapons/agm/blue_gps_bomb_1.txt:53`、`cyber/GoneFishing_ConstraintDemo.txt:44`、`cyber/weapons/agm/blue_gps_bomb_1.txt:37`）
- **片段**：

```text
   processor guidance_computer WSF_GUIDANCE_COMPUTER 
      proportional_navigation_gain 10
      velocity_pursuit_gain        10
      g_bias                       1
      maximum_commanded_g          25 g
      guidance_delay               0 sec
   end_processor
```

- **演示要点**：演示 WSF_GUIDANCE_COMPUTER 的参数：proportional_navigation_gain, velocity_pursuit_gain, g_bias, maximum_commanded_g, guidance_delay

### processor · WSF_PERCEPTION_PROCESSOR｜处理器

- **关键词**：processor, WSF_PERCEPTION_PROCESSOR, threat_update_interval, max_threat_load, reports_self, report_interval, report_to, 处理器
- **出处**：`base_types/platforms/brawler/brawler_platform.txt:126-132`
- **片段**：

```text
   processor perception WSF_PERCEPTION_PROCESSOR
      threat_update_interval 2 sec
      max_threat_load 5
      reports_self on
      report_interval 1.0 sec
      report_to commander via datalink
   end_processor
```

- **演示要点**：演示 WSF_PERCEPTION_PROCESSOR 的参数：threat_update_interval, max_threat_load, reports_self, report_interval, report_to

### processor · WSF_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TRACK_PROCESSOR, purge_interval, report_interval, report_method, circular_report_rejection, external_link, 处理器
- **出处**：`electronic_warfare/simple_auto_jamming.txt:369-375`
- **片段**：

```text
   processor blue_data_mgr WSF_TRACK_PROCESSOR
      purge_interval 60.0 sec
      report_interval 5.0 sec
      report_method batch
      circular_report_rejection on
      external_link peers via blue_net
   end_processor
```

- **演示要点**：演示 WSF_TRACK_PROCESSOR 的参数：purge_interval, report_interval, report_method, circular_report_rejection, external_link

### processor · WSF_SIMPLE_SENSORS_MANAGER｜处理器

- **关键词**：processor, WSF_SIMPLE_SENSORS_MANAGER, update_interval, max_tar_acquisition_time, max_ttr_acquisition_time, turn_off_tar_if_no_tracks, turn_off_ttr_if_no_tracks, 处理器
- **出处**：`iads_c2_demos/processors/simple_sensors_manager.txt:14-22`
- **片段**：

```text
processor SIMPLE_SM WSF_SIMPLE_SENSORS_MANAGER
   update_interval 1 sec

   max_tar_acquisition_time 60 seconds
   max_ttr_acquisition_time 60 seconds

   turn_off_tar_if_no_tracks true
   turn_off_ttr_if_no_tracks true
end_processor
```

- **演示要点**：演示 WSF_SIMPLE_SENSORS_MANAGER 的参数：update_interval, max_tar_acquisition_time, max_ttr_acquisition_time, turn_off_tar_if_no_tracks, turn_off_ttr_if_no_tracks

### processor · WSF_UNCLASS_ASSET_MANAGER｜处理器

- **关键词**：processor, WSF_UNCLASS_ASSET_MANAGER, update_interval, status_settings, assignment_delay, log_status, filter_dead_tracks, 处理器
- **出处**：`iads_c2_demos/processors/asset_manager.txt:14-25`
- **片段**：

```text
processor ASV_AM WSF_UNCLASS_ASSET_MANAGER
   update_interval 1 sec

   status_settings
      subord_yellow_timeout  120 secs      # time elapsed before marking asset as yellow if no status
      subord_red_timeout     180 secs      # time elapsed before marking asset as red if no status
   end_status_settings

   assignment_delay     0 seconds
   log_status           off
   filter_dead_tracks   on
end_processor
```

- **演示要点**：演示 WSF_UNCLASS_ASSET_MANAGER 的参数：update_interval, status_settings, assignment_delay, log_status, filter_dead_tracks

### processor · WSF_AIR_TARGET_FUSE｜处理器

- **关键词**：processor, WSF_AIR_TARGET_FUSE, time_of_flight_to_arm, max_time_of_flight_to_detonate, coast_time_on_loss_of_target, gross_proximity_range, detonate_on_mach_decreasing_to, 处理器
- **出处**：`cyber/weapons/sam/sr_sam.txt:119-132`　（同签名共 2 处，另见 `orwaca_iads/weapons/sam/sr_sam.txt:117`）
- **片段**：

```text
processor SR_SAM_FUSE WSF_AIR_TARGET_FUSE
   time_of_flight_to_arm            1.0 sec     // Will arm during boost
   max_time_of_flight_to_detonate  80.0 sec     // Set to max out at about 10 nm.
   coast_time_on_loss_of_target      2.0 sec
   gross_proximity_range           600 meters
   detonate_on_mach_decreasing_to   0.6
#   script void on_weapon_detonation()
#      writeln("T=", TIME_NOW, " fuse on_weapon_detonation");
#   end_script

   #on_detonation
   #   writeln("T=", TIME_NOW, " fuse on_weapon_detonation");
   #end_on_detonation
end_processor
```

- **演示要点**：演示 WSF_AIR_TARGET_FUSE 的参数：time_of_flight_to_arm, max_time_of_flight_to_detonate, coast_time_on_loss_of_target, gross_proximity_range, detonate_on_mach_decreasing_to

### processor · WSF_GUIDANCE_COMPUTER｜处理器

- **关键词**：processor, WSF_GUIDANCE_COMPUTER, update_interval, proportional_navigation_gain, g_bias, guidance_delay, maximum_commanded_g, 处理器
- **出处**：`ship_ad/weapons/ssm/ssm_missile.txt:70-85`
- **片段**：

```text
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
```

- **演示要点**：演示 WSF_GUIDANCE_COMPUTER 的参数：update_interval, proportional_navigation_gain, g_bias, guidance_delay, maximum_commanded_g

### processor · WSF_THREAT_PROCESSOR｜处理器

- **关键词**：processor, WSF_THREAT_PROCESSOR, update_interval, threat_velocity, threat_angle_spread, threat_time_to_intercept, script, 处理器
- **出处**：`base_types/platforms/red_fighter_1_ripr.txt:56-80`　（同签名共 3 处，另见 `base_types/platforms/red_multirole_fighter_2_ripr.txt:72`、`base_types/platforms/red_adv_fighter_1_ripr.txt:79`）
- **片段**：

```text
   processor incoming_threats WSF_THREAT_PROCESSOR
     update_interval 0.1 sec
     #update_interval 2.0 sec

      #1300 knots
      threat_velocity 668.7778 m/s
      threat_angle_spread 13.0 deg
      threat_time_to_intercept 240 sec

      script void identified_new_threat(WsfTrack aTrack)
         writeln("!!! me: ", PLATFORM.Name(), ", new threat: ", aTrack.TargetName());
      end_script

      script void dropped_threat(WsfTrack aTrack)
         if (aTrack.IsValid())
         {
            writeln("!!! ", PLATFORM.Name(), " dropped a threat: ", aTrack.TargetName());
         }
         else
         {
            writeln("!!! ", PLATFORM.Name(), " dropped a threat");
         }
      end_script

   end_processor
```

- **演示要点**：演示 WSF_THREAT_PROCESSOR 的参数：update_interval, threat_velocity, threat_angle_spread, threat_time_to_intercept, script

### processor · WSF_SCRIPT_PROCESSOR｜处理器

- **关键词**：processor, WSF_SCRIPT_PROCESSOR, update_interval, on_update, double, extern, if, 处理器
- **出处**：`parachute/AvailableGs.txt:119-143`
- **片段**：

```text
 processor writeoutAvailableGs WSF_SCRIPT_PROCESSOR
    update_interval 1 sec
    on_update

    double CLMAX = .5; # SET THIS TO THE CLMAX OF THE PLATFORM
    double REFAREA = 190 * MATH.M_PER_FT() * MATH.M_PER_FT(); # SET THIS TO THE REF AREA OF THE PLATFORM in meters squared

    extern double Std76AtmosDens(double);
    double dSpeed = PLATFORM.Speed();
    double dAltitude = PLATFORM.Altitude();
    double dMass = PLATFORM.TotalMass();

    if ((! dSpeed == 0)  && (! dAltitude == 0) && (! dMass == 0))
    {
        double dAtmosDensity = Std76AtmosDens(dAltitude);
        double dDynamicPressure = 0.5 * dAtmosDensity * dSpeed * dSpeed;  # (1/2 * ro V^2)

        double MaxLift = CLMAX * dDynamicPressure * REFAREA;

        double MaxAvailableGs = MaxLift / dMass / Earth.ACCEL_OF_GRAVITY();

        writeln(TIME_NOW, " " , PLATFORM.Name(), " Available Gs " ,MaxAvailableGs);
    }
   end_on_update
 end_processor
```

- **演示要点**：演示 WSF_SCRIPT_PROCESSOR 的参数：update_interval, on_update, double, extern, if

### processor · WSF_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TRACK_PROCESSOR, update_interval, purge_interval, track_history_retention_interval, script_variables, on_update, 处理器
- **出处**：`space_operations/scenarios/ssn_laydown.txt:55-83`
- **片段**：

```text
   processor tp WSF_TRACK_PROCESSOR
      update_interval 100 sec
      purge_interval 2 days
      track_history_retention_interval 1000 sec

      script_variables
         Map<int, WsfGeoPoint> lastTrackLoc = {};
      end_script_variables

      on_update
         WsfLocalTrackList ltList = PLATFORM.TrackManager().LocalTrackList();
         foreach (WsfLocalTrack lt in ltList)
         {
               WsfGeoPoint trackLoc = lt.LocationAtTime(TIME_NOW);
               int id = lt.Target().Index();
               WsfGeoPoint lastLoc = lastTrackLoc[id];
               if (lastLoc.IsValid())
               {
                  WsfDraw draw = {};
                  draw.SetId(id);
                  draw.BeginLines();
                  draw.Vertex(lastTrackLoc[id]);
                  draw.Vertex(trackLoc);
                  draw.End();
               }
               lastTrackLoc[id] = trackLoc;
            }
      end_on_update
   end_processor
```

- **演示要点**：演示 WSF_TRACK_PROCESSOR 的参数：update_interval, purge_interval, track_history_retention_interval, script_variables, on_update

### processor · WSF_QUANTUM_TASKER_PROCESSOR｜处理器

- **关键词**：processor, WSF_QUANTUM_TASKER_PROCESSOR, script_debug_writes, update_interval, advanced_behavior_tree, script_variables, on_message, 处理器
- **出处**：`behavior_tree/platforms/selector_striker.txt:86-132`
- **片段**：

```text
   processor  task_mgr  WSF_QUANTUM_TASKER_PROCESSOR
      script_debug_writes  off
      update_interval 5 sec
      
      advanced_behavior_tree
         btt on
         selector
            behavior_node evade
            behavior_node escort
            behavior_node pincer_fsm
            behavior_node pursue_weapon_task_target
            behavior_node planned_route
         end_selector
         behavior_node engage_weapon_task_target
      end_advanced_behavior_tree
      
      script_variables
         int mLeftDragCount = 0;
         int mRightDragCount = 0;
      end_script_variables
      
      on_message 
         type WSF_CONTROL_MESSAGE
            script
               WsfControlMessage controlMsg = (WsfControlMessage)MESSAGE;
               if (controlMsg.Function() == "pincer" &&
                   controlMsg.Resource() == "drag")
               {
                  int adjust = 1;
                  if (controlMsg.AuxDataBool("dragging") == false)
                  {
                     adjust = -1;
                  }
                  if (controlMsg.AuxDataString("side") == "left")
                  {
                     mLeftDragCount += adjust;
                  }
                  else //if (controlMsg.AuxDataString("side") == "right")
                  {
                     mRightDragCount += adjust;
                  }
               }
               writeln_d("T=", TIME_NOW, " Received control, function: ", controlMsg.Function(), ", resources: ", controlMsg.Resource());
            end_script
      end_on_message
            
   end_processor
```

- **演示要点**：演示 WSF_QUANTUM_TASKER_PROCESSOR 的参数：script_debug_writes, update_interval, advanced_behavior_tree, script_variables, on_message

### processor · WSF_SCRIPT_PROCESSOR｜处理器

- **关键词**：processor, WSF_SCRIPT_PROCESSOR, update_interval, script_variables, on_initialize, script, on_update, 处理器
- **出处**：`electronic_warfare/simple_auto_jamming.txt:202-252`　（同签名共 4 处，另见 `outer_air_battle/processors/station_timer.txt:100`、`script_demos/script_demo_2.txt:228`、`script_demos/script_demo_1.txt:45`）
- **片段**：

```text
processor BLUE_TRACK_PROCESSOR WSF_SCRIPT_PROCESSOR
   update_interval 5.0 sec

   script_variables
      WsfTrackId mMyTrackId;
      WsfTrack
   end_script_variables

   on_initialize
      mMyTrack = PLATFORM.MakeTrack();
   end_on_initialize

   script void FindTrackId()
      WsfLocalTrackList tracklist = PLATFORM.MasterTrackList();
      writeln("Count: ", tracklist.Count());
      foreach (WsfLocalTrack track in PLATFORM.MasterTrackList())
      {
         if (track.TargetName() == PLATFORM.Name())
         {
            writeln("*** Found track.");
            mMyTrackId = track.TrackId();
         }
      }
      WsfLocalTrack track = PLATFORM.TrackList("blue_data_mgr").Find(mMyTrackId);
      if (track.IsValid())
      {
         track.Initialize();
         track.SetSide(PLATFORM.Side());
         track.SetAirDomain();
      }
   end_script

   on_update
      if (mMyTrackId.IsNull())
      {
         FindTrackId();
      }

      if (!mMyTrackId.IsNull())
      {
         WsfLocalTrack track = PLATFORM.TrackList("blue_data_mgr").Find(mMyTrackId);
         if (track.IsValid())
         {
            //writeln("Updating track");
            track.SetLocation(PLATFORM.PerceivedLocation());
            track.SetVelocity(PLATFORM.Vx(), PLATFORM.Vy(), PLATFORM.Vz());
            track.SetUpdateTime(TIME_NOW);
         }
      }
   end_on_update
end_processor
```

- **演示要点**：演示 WSF_SCRIPT_PROCESSOR 的参数：update_interval, script_variables, on_initialize, script, on_update

### processor · WSF_SCRIPT_PROCESSOR｜处理器

- **关键词**：processor, WSF_SCRIPT_PROCESSOR, script_variables, on_initialize2, script, update_interval, on_update, 处理器
- **出处**：`cyber/processors/uav_weapon_release.txt:11-62`　（同签名共 2 处，另见 `alternate_locations/processors/ucav_weapon_release.txt:10`）
- **片段**：

```text
processor BOMBER_WEAPON_RELEASE WSF_SCRIPT_PROCESSOR 

   script_variables 
      string wpn38 = "blue_gps_bomb_1";
      
      Array<bool> tgt_engaged = Array<bool>();
      string LARmeters = "lar_meters";
   end_script_variables
   
   on_initialize2 
      for (int i = 0; i < PLATFORM.MasterTrackList().Count(); i = i + 1)
      {
         tgt_engaged[i] = false;
      } // for loop
   end_on_initialize2
   
   script bool fireWeapon (WsfTrack tTrack, string tWpn)
      bool shot = false;
      
      WsfWeapon tempWeapon = PLATFORM.Weapon(tWpn);
      if (tempWeapon.IsValid())
      {
         double tempRange = tempWeapon.AuxDataDouble(LARmeters);
         if (PLATFORM.GroundRangeTo(tTrack) < tempRange)
         {
            shot = tempWeapon.FireSalvo(tTrack, 2);
         } // Within Range
      } // Is Valid
      if (shot == true)
      {
         writeln("TIME NOW = ",TIME_NOW, " ",PLATFORM.Name(), " FIRES ", tWpn, " at ", tTrack.TargetName());
      } // shots fired
      return shot;
   end_script
   
   update_interval 3.0 sec
   on_update 
      
      for (int i = 0; i < PLATFORM.MasterTrackList().Count(); i = i + 1)
      {
         if (!tgt_engaged[i])
         {
            
            WsfTrack tempTrack = PLATFORM.MasterTrackList().TrackEntry(i);
            if (fireWeapon(tempTrack, wpn38))
            {
               tgt_engaged[i] = true;
            } // fired blue_gps_bomb_1
         } // not engaged
      } // for loop
   end_on_update
end_processor
```

- **演示要点**：演示 WSF_SCRIPT_PROCESSOR 的参数：script_variables, on_initialize2, script, update_interval, on_update

### processor · WSF_SCRIPT_PROCESSOR｜处理器

- **关键词**：processor, WSF_SCRIPT_PROCESSOR, off, update_interval, script_variables, script, on_update, 处理器
- **出处**：`script_demos/script_demo_4.txt:34-95`
- **片段**：

```text
   processor script-proc WSF_SCRIPT_PROCESSOR
      off
      update_interval 4 min

      script_variables
         bool mGoToAlt               = false;
         bool mGoToSpeed             = false;
         bool mGoToLocation          = false;
         bool mTurnToHeading         = false;
         bool mTurnToRelativeHeading = false;
      end_script_variables

      script void start_maneuvering()
         writeln("Start Maneuvering");
         PROCESSOR.TurnOn();
      end_script

      on_update
         if (! mGoToAlt)
         {
            writeln("GoToAlt");
            PLATFORM.GoToAltitude(10000.0 * MATH.M_PER_FT());
            mGoToAlt = true;
         }
         else if (! mGoToSpeed)
         {
            writeln("GoToSpeed");
            PLATFORM.GoToSpeed(600.0 * MATH.MPS_PER_NMPH());
            mGoToSpeed = true;
         }
         else if (! mGoToLocation)
         {
            writeln("GoToLocation");
            double lat = PLATFORM.Latitude() + 1.0;
            double lon = PLATFORM.Longitude() + 1.0;
            double alt = PLATFORM.Altitude();
            PLATFORM.GoToLocation(lat, lon, alt);
            mGoToLocation = true;
         }
         else if (! mTurnToHeading)
         {
            writeln("TurnToHeading");
            PLATFORM.TurnToHeading(180.0);
            mTurnToHeading = true;
         }
         else if (! mTurnToRelativeHeading)
         {
            double relHeading = MATH.RandomUniform() * 90.0;
            relHeading = -1.0 * relHeading;
            if (MATH.RandomUniform() > 0.5)
            {
               relHeading = -1.0 * relHeading;
            }
            writeln("TurnToRelativeHeading ", relHeading);
            PLATFORM.TurnToHeading(relHeading);
         }
         else
         {
            PROCESSOR.TurnOff();
         }
      end_on_update
   end_processor
```

- **演示要点**：演示 WSF_SCRIPT_PROCESSOR 的参数：off, update_interval, script_variables, script, on_update

### processor · WSF_SCRIPT_PROCESSOR｜处理器

- **关键词**：processor, WSF_SCRIPT_PROCESSOR, script_debug_writes, update_interval, script_variables, on_initialize, on_update, 处理器
- **出处**：`electronic_warfare/slc_slb_script_jamming.txt:194-269`
- **片段**：

```text
processor SLB_SLC_Control WSF_SCRIPT_PROCESSOR
   #script_call_trace on
   script_debug_writes on

   update_interval 10.0 sec // update once per scan of the radar

   script_variables
      bool mSLB_Operating = false;
      bool mSLC_Operating = false;

      string mSensorName = "";
      string mSLB_TechName = "sidelobe_blanking";
      string mSLC_TechName = "sidelobe_cancelation";
   end_script_variables

   on_initialize
      if (mSensorName == "")
      {
         if (PLATFORM.SensorCount() == 0)
         {
            mSensorName = PLATFORM.SensorEntry(0).Name();
         }
      }

      if (mSensorName == "")
      {
         writeln("****WARNING: SLB_SLB_Operations script has null sensor name on ", PLATFORM.Name());
      }
   end_on_initialize

   on_update
      WsfSensor sensor = PLATFORM.Sensor(mSensorName);

      if (sensor.ContinuousJammingPerceived())
      {
         writeln_d("T=", TIME_NOW, " Continuous jamming perceived");
         if (! mSLC_Operating)
         {
            mSLC_Operating = sensor.SelectEP_Technique(mSLC_TechName);
         }

         if (mSLB_Operating && mSLC_Operating)
         {
            mSLB_Operating = (! sensor.DeselectEP_Technique(mSLB_TechName));
         }
      }
      else if (sensor.PulseJammingPerceived())
      {
         writeln_d("T=", TIME_NOW, " Pulse jamming perceived");
         if (! mSLB_Operating)
         {
            mSLB_Operating = sensor.SelectEP_Technique(mSLB_TechName);
         }

         if (mSLB_Operating && mSLC_Operating)
         {
            mSLC_Operating = (! sensor.DeselectEP_Technique(mSLC_TechName));
         }
      }
      else
      {
         writeln_d("T=", TIME_NOW, " Jamming not perceived");
         if (mSLC_Operating)
         {
            mSLC_Operating = (! sensor.DeselectEP_Technique(mSLC_TechName));
         }

         if (mSLB_Operating)
         {
            mSLB_Operating = (! sensor.DeselectEP_Technique(mSLB_TechName));
         }
      }
      writeln("   SLB=", mSLB_Operating);
      writeln("   SLC=", mSLC_Operating);
   end_on_update
end_processor
```

- **演示要点**：演示 WSF_SCRIPT_PROCESSOR 的参数：script_debug_writes, update_interval, script_variables, on_initialize, on_update

### processor · WSF_TASK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TASK_PROCESSOR, update_interval, script_variables, script, on_message, on_update, 处理器
- **出处**：`new_guidance/platforms/inflight_update_tactics.txt:17-95`　（同签名共 2 处，另见 `ship_ad/platforms/inflight_update_tactics.txt:17`）
- **片段**：

```text
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

- **演示要点**：演示 WSF_TASK_PROCESSOR 的参数：update_interval, script_variables, script, on_message, on_update

### processor · WSF_TASK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TASK_PROCESSOR, script_variables, on_initialize, show_state_transitions, evaluation_interval, state, 处理器
- **出处**：`fires/time_on_target.txt:51-130`
- **片段**：

```text
processor SUB_TASK_PROC WSF_TASK_PROCESSOR

   script_variables
      WsfLaunchComputer mLaunchComputer;
   end_script_variables

   on_initialize
      writeln(PLATFORM.WeaponEntry(0).Name());
      mLaunchComputer = PLATFORM.WeaponEntry(0).LaunchComputer();
      if (! mLaunchComputer.IsValid())
      {
         writeln("Not Valid!!");
      }
   end_on_initialize

   show_state_transitions
   evaluation_interval assess 0.5 seconds

   state assess

      next_state wait
         return (mLaunchComputer.CanIntercept(TRACK));
      end_next_state

      next_state done
         return true;  // if we can't intercept
      end_next_state

   end_state

   evaluation_interval wait 5.0 seconds
   state wait

      on_entry
         PLATFORM.SetCurrentTarget(TRACK);
         double impactTime = TRACK.AuxDataDouble("IMPACT_TIME");
         double timeToImpact = mLaunchComputer.TimeOfFlight();
         writeln(PLATFORM.Name(), ": Time of flight ", timeToImpact);
         double launchTime = impactTime - timeToImpact;
         writeln(PLATFORM.Name(), ": Launch time ", launchTime);
         TRACK.SetAuxData("LAUNCH_TIME", launchTime);
      end_on_entry

      next_state firing
         double timeToLaunch = (TIME_NOW - TRACK.AuxDataDouble("LAUNCH_TIME"));
         writeln("Time to launch ", timeToLaunch);
         return (timeToLaunch < 5.0);
      end_next_state

   end_state

   evaluation_interval firing 0.01 sec
   state firing
      next_state done
         if ((TIME_NOW - TRACK.AuxDataDouble("LAUNCH_TIME")) > 0.0)
         {
            WsfWeapon weapon = PLATFORM.WeaponEntry(0);
            if (weapon.CanIntercept(TRACK))
            {
               writeln(PLATFORM.Name(), " ", TIME_NOW, ": launching.");
               weapon.TurnOn();
               weapon.Fire(TRACK);
            }
            return true;
         }
         else
         {
            return false;
         }
      end_next_state
   end_state

   evaluation_interval done 500 sec
   state done
      on_entry
         TaskComplete(TRACK.TrackId(), "TIME_ON_TARGET");
      end_on_entry
   end_state

end_processor
```

- **演示要点**：演示 WSF_TASK_PROCESSOR 的参数：script_variables, on_initialize, show_state_transitions, evaluation_interval, state

### processor · WSF_RIPR_PROCESSOR｜处理器

- **关键词**：processor, WSF_RIPR_PROCESSOR, update_interval, script_debug_writes, script_variables, on_initialize, on_update, 处理器
- **出处**：`base_types/processors/ripr_agents/aisoc/aisoc_processor_no_cluster.txt:15-111`
- **片段**：

```text
   processor AISOC-thinker WSF_RIPR_PROCESSOR

      update_interval 5.0 seconds
      script_debug_writes on

      script_variables
          Map<WsfTrackId, int> mTrackIdJobIdMap = Map<WsfTrackId, int>();
          Map<int, WsfTrackId> mJobIdTrackIdMap = Map<int, WsfTrackId>();
          int mMaxJobWinners = 1;
      end_script_variables

      on_initialize
         //SetJobAllocationMode(2);
      end_on_initialize

      #query_bid
      #  double value = 7.654;
      #  writeln("query_bid() called!!! Platform: ", PLATFORM.Name() ,", Job: ", JOB.GetDescription() , ", TIME: ", TIME_NOW);
      #  return value;
      #end_query_bid

      on_update
         Map<int, int> updatedJobs = Map<int, int>();
         WsfLocalTrackList localTracks = PLATFORM.MasterTrackList();
         //writeln("top level cmdr ",PLATFORM.Name()," track count: ",localTracks.Count());

         foreach (WsfTrack track in localTracks)
         {
            if (mTrackIdJobIdMap.Exists(track.TrackId()))
            {
               //update existing job
               double currentPriority = 1.0;
               int jobId = mTrackIdJobIdMap.Get(track.TrackId());
               WsfRIPRJob job = GetJobById(jobId);
               job.Priority( currentPriority );
               job.SetData( "TrackId", track.TrackId() );  //redundant, this shouldn't change anything
               if (track.WithinZoneOf(PLATFORM,"MEZ"))
               {
                 job.SetData( "for_air",    0 );
                 job.SetData( "for_ground", 1 );
               }
               else
               {
                 job.SetData( "for_air",    1 );
                 job.SetData( "for_ground", 0 );
               }
               updatedJobs.Set( job.GetId(), 1 );
            }
            else
            {
               //create new job
               double initialPriority = 1.0;
               WsfRIPRJob temp = WsfRIPRJob.Create(PROCESSOR,
                                                   "pursue-target",
                                                   "pursue-target" + track.TargetName(),
                                                   initialPriority,
                                                   mMaxJobWinners );
               temp.SetData("targetTrackName", track.TargetName());

               if (track.WithinZoneOf(PLATFORM,"MEZ"))
               {
                 temp.SetData( "for_air",    0 );
                 temp.SetData( "for_ground", 1 );
               }
               else
               {
                 temp.SetData( "for_air",    1 );
                 temp.SetData( "for_ground", 0 );
               }

               AddJob(temp);
               mTrackIdJobIdMap.Set( track.TrackId(), temp.GetId() );
               mJobIdTrackIdMap.Set( temp.GetId(), track.TrackId() );
               updatedJobs.Set( temp.GetId(), 1 );
               writeln_d("~~~ ", PLATFORM.Name(), " job change, ADD: ", temp.Name() );
               double bidValue = QueryBid(temp);
               writeln("QueryBid(job) returned: ", bidValue);
            }
         }
         //remove any jobs that are for non-existent tracks
         Array<WsfRIPRJob> jobs = GetJobs();
         foreach (WsfRIPRJob x in jobs)
         {
            int jid = x.GetId();
            if (updatedJobs[jid] != 1)
            {
               writeln_d("--- ", PLATFORM.Name(), " job change, REMOVE: ", x.GetDescription());
               WsfTrackId tid = mJobIdTrackIdMap[jid];   //this should match the job's data: "TrackId"
               mTrackIdJobIdMap.Erase(tid);
               mJobIdTrackIdMap.Erase(jid);
               RemoveJob(x);
            }
         }
         //writeln("top level cmdr ",PLATFORM.Name()," job count: ",jobs.Size());
      end_on_update

   end_processor
```

- **演示要点**：演示 WSF_RIPR_PROCESSOR 的参数：update_interval, script_debug_writes, script_variables, on_initialize, on_update

### processor · WSF_SCRIPT_PROCESSOR｜处理器

- **关键词**：processor, WSF_SCRIPT_PROCESSOR, update_interval, script_variables, script, on_update, on_message, 处理器
- **出处**：`draw/draw_demo.txt:48-145`
- **片段**：

```text
   processor attack-proc WSF_SCRIPT_PROCESSOR
      #debug
      update_interval 1.0 sec

      script_variables
        string mWeaponName = "1000_lb_bomb";
        Map<string, bool> mTargetMap = Map<string, bool>();
        WsfDraw mPlatDraw = WsfDraw();
        WsfDraw mRadarDraw = WsfDraw();
        WsfDraw mEyeballDraw = WsfDraw();
        bool mOnce = true;
      end_script_variables

      script bool InInterceptEnvelopeOf(WsfWeapon aWeapon, WsfTrack aTrack)
        bool canIntercept = false;
        double maxRng = 800;
        double minRng = 300;
        WsfTrackId id = aTrack.TrackId();
        double targetrange = PLATFORM.SlantRangeTo(aTrack);
        if ((targetrange > minRng) && (targetrange < maxRng))
        {
           canIntercept = true;
        }
        return canIntercept;
      end_script

      on_update

        if (mOnce)
        {
          mOnce = false;

          mPlatDraw.SetLayer(PLATFORM.Name());
          mPlatDraw.SetColor(0.0, 0.2, 0.8, 0.25);
          mPlatDraw.BeginEllipse(0.0, 100.0, 300.0);
            mPlatDraw.Vertex(PLATFORM);
          mPlatDraw.End();
        }

        foreach (WsfTrack track in PLATFORM.MasterTrackList())
        {
          WsfWeapon weapon = PLATFORM.Weapon(mWeaponName);
          if (! mTargetMap[track.TargetName()] &&
              InInterceptEnvelopeOf(weapon, track))
          {
            bool launched = weapon.FireSalvo(track, 1);
            if (launched)
            {
               writeln("*** T=", TIME_NOW, " ", PLATFORM.Name(), " ",
                       track.TargetName(), " range=", PLATFORM.SlantRangeTo(track),
                       " FIRE!!!!");
               PLATFORM.Comment("Released weapon targeting " + track.TargetName());
               mTargetMap[track.TargetName()] = true;
            }
          }
        }

        mRadarDraw.SetLayer("radar-layer");
        mRadarDraw.SetDuration(1.0);
        mRadarDraw.SetColor(1, 0, 0);
        mRadarDraw.SetLineSize(5);
        foreach (WsfTrack track in PLATFORM.MasterTrackList())
        {
           mRadarDraw.BeginLines();
              mRadarDraw.Vertex(PLATFORM);
              mRadarDraw.Vertex(track.CurrentLocation());
           mRadarDraw.End();
        }
      end_on_update

      on_message
        type WSF_TRACK_MESSAGE
          script
            WsfTrack track = ((WsfTrackMessage)MESSAGE).Track();
            if (track.IsValid())
            {
               mEyeballDraw.SetLayer("eyeball-layer");
               mEyeballDraw.SetDuration(1.0);
               mEyeballDraw.SetColor(1, 1, 0);
               mEyeballDraw.SetLineSize(2);
               mEyeballDraw.BeginLines();
                  mEyeballDraw.Vertex(PLATFORM);
                  mEyeballDraw.Vertex(track.CurrentLocation());
               mEyeballDraw.End();

               //double lat = (PLATFORM.Latitude() + track.CurrentLocation().Latitude()) / 2.0;
               //double lon = (PLATFORM.Longitude() + track.CurrentLocation().Longitude()) / 2.0;
               //double alt = (PLATFORM.Altitude() + track.CurrentLocation().Altitude()) / 2.0;

               //mEyeballDraw.SetColor(1, 0, 1);
               //mEyeballDraw.SetPointSize(10);
               //mEyeballDraw.BeginPoints();
               //   mEyeballDraw.VertexLLA(lat, lon, alt);
               //mEyeballDraw.End();
            }
          end_script
      end_on_message
   end_processor
```

- **演示要点**：演示 WSF_SCRIPT_PROCESSOR 的参数：update_interval, script_variables, script, on_update, on_message

### processor · WSF_UPLINK_PROCESSOR｜处理器

- **关键词**：processor, WSF_UPLINK_PROCESSOR, update_interval, script_debug_writes, script_variables, script, on_update, 处理器
- **出处**：`air_to_air/processors/uplink.txt:10-112`
- **片段**：

```text
processor WEAPON_DL_MANAGER WSF_UPLINK_PROCESSOR
   update_interval 1 sec
    script_debug_writes off
   script_variables
      Map<string, bool>  mUplinkStatus             = Map<string, bool>();
      Set<string>        mWeaponTypesWithoutUplink = Set<string>();
      Array<string>      mUplinkSensorNames        = Array<string>();
      WsfUplinkProcessor uplinkProc                = (WsfUplinkProcessor)PROCESSOR;
      bool test = false;
   end_script_variables
   
   script bool UplinkCapableSensorExists(WsfPlatform i_weapon)
      foreach (string mUplinkSensorName in mUplinkSensorNames)
      {
         WsfSensor uplinkSensor = PLATFORM.Sensor(mUplinkSensorName);
         if (uplinkSensor.IsValid())
         {
            if (uplinkSensor.IsTurnedOn() && uplinkSensor.WithinFieldOfView(i_weapon.Location()))
            {
               writeln_d(" ",PLATFORM.Name()," ", uplinkSensor.Name(), " can uplink to <", i_weapon.Name(), ">. T=", TIME_NOW);
               return true;
            }
            else if (uplinkSensor.IsTurnedOff() )
            {
               // Simulates a low-power update via uplink sensor (e.g. a radar)
               if (uplinkSensor.AuxDataExists("SENSOR_AZ_HALF_ANGLE") && uplinkSensor.AuxDataExists("SENSOR_EL_HALF_ANGLE"))
               {
                  double relAZ = PLATFORM.RelativeAzimuthOf(i_weapon.Location());
                  double relEL = PLATFORM.RelativeElevationOf(i_weapon.Location());
                  if (MATH.Fabs(relAZ) <= uplinkSensor.AuxDataDouble("SENSOR_AZ_HALF_ANGLE") &&
                      MATH.Fabs(relEL) <= uplinkSensor.AuxDataDouble("SENSOR_EL_HALF_ANGLE"))
                  {
                     writeln_d(" ", uplinkSensor.Name(), " can uplink to <", i_weapon.Name(), ">. T=", TIME_NOW);
                     return true;
                  }
               }
               else { writeln_d(" Sensor aux data not defined for sensor type <", uplinkSensor.Type(), ">!!!"); }
            }
         }
         else { writeln_d(" ", mUplinkSensorName, " cannot uplink to <", i_weapon.Name(), "> because it is not valid. T=", TIME_NOW); }
      }
      
      return false;
   end_script

   on_update
      // Add Active Weapons to list (for when auto_weapon_uplink is not enabled in the WSF_TASK_PROCESSOR)
      Array<WsfPlatform> temp_list = PLATFORM->guid_list;
      if (temp_list.Size() > 0)
      {
         foreach (WsfPlatform weapon in temp_list)
         {
            if (weapon.IsValid() && !mUplinkStatus.Exists(weapon.Name())) 
            { 
               mUplinkStatus.Set(weapon.Name(), false); 
            }
         }
      }
            
      // Loop through active uplinks
      for(int linkI = 0; linkI < uplinkProc.UplinkCount(); linkI += 1)
      {
         WsfPlatform weapon = uplinkProc.UplinkPlatformEntry(linkI);
         if(weapon.IsValid())
         {
            // First time we've seen this uplink, add it to the map for future bookkeeping
            if(!mUplinkStatus.Exists(weapon.Name()))
            {
               if (!UplinkCapableSensorExists(weapon)) { mUplinkStatus[weapon.Name()] = false; }
            }
            
            // shutdown the uplink if this weapon type does not have one, or if no uplink capable sensor exists
            if(mWeaponTypesWithoutUplink.Exists(weapon.Type()) || !UplinkCapableSensorExists(weapon))
            {
               writeln_d("T=", TIME_NOW, " ", PLATFORM.Name(), " cutting link to: ", weapon.Name());
               uplinkProc.StopUplinking(weapon);
               mUplinkStatus[weapon.Name()] = false;
            }
         }
      }

      foreach(string weaponName : bool isUplinking in mUplinkStatus)
      {
         WsfPlatform weapon = WsfSimulation.FindPlatform(weaponName);
         if (weapon.IsValid())
         {
            // If this weapon has an uplink and we can talk to it turn the uplink back on
            if(!isUplinking &&
               !mWeaponTypesWithoutUplink.Exists(weapon.Type()) &&
               UplinkCapableSensorExists(weapon))
            {
               uplinkProc.StartUplinking(weapon);
               if(uplinkProc.IsUplinkingTo(weapon))
               {
                  mUplinkStatus[weaponName] = true;
                  writeln_d("T=" , TIME_NOW, "  ", PLATFORM.Name(), "  reacquiring link to: ", weapon.Name());
               }
            }
         }
         else { mUplinkStatus[weaponName] = false; }
      }
   end_on_update
end_processor
```

- **演示要点**：演示 WSF_UPLINK_PROCESSOR 的参数：update_interval, script_debug_writes, script_variables, script, on_update

### processor · WSF_TASK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TASK_PROCESSOR, show_task_messages, script_variables, script, evaluation_interval, state, 处理器
- **出处**：`launcher/platforms/tactics_processor4.txt:78-217`
- **片段**：

```text
processor SAM_TACTICS_PROCESSOR WSF_TASK_PROCESSOR
#   script_debug_writes on
#   show_state_transitions
   show_task_messages

   script_variables
      string SENSOR_NAME               = "radar_set";
      string SENSOR_TRACK_MODE         = "default";
      string WEAPON_NAME               = "sam_missile";
      double REQUIRED_TRACK_QUALITY    = 0.49;
      int SALVO_SIZE                   = 1;

      # the following are used internally and should not be modified by the
      # user
      string mTrackTaskStr      = "Track";
      string mShootTaskStr      = "Shoot";
   end_script_variables

   # demonstrates the use of calling an external local launch computer that could be
   # used to call other launchers to launch different missiles
   script bool InInterceptEnvelopeOf(WsfWeapon aWeapon)
      extern bool Local_SAM_LaunchComputer(WsfTrack, WsfWeapon, double);
      return Local_SAM_LaunchComputer(TRACK, aWeapon, 0.0);
   end_script


   script bool IsEngageable()
      return (((PLATFORM == PLATFORM.Commander()) ||
               (TasksReceivedFor(TRACK.TrackId()) > 0) ||
               (OperatingLevelFor("ENGAGE") > 0))) &&
               (TRACK.AirDomain());
   end_script

   script bool WeaponsAvailable()
      WsfWeapon   weapon;
      weapon = PLATFORM.Weapon(WEAPON_NAME);
      writeln_d("Weapons remaining " , weapon.QuantityRemaining());
      if (weapon.QuantityRemaining() > 0)
      {
         return true;
      }
      else
      {
         return false;
      }
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

   # returns true if weapon is still active for given track
   script bool FiringNow()
      return (WeaponsActiveFor(TRACK.TrackId()) > 0);
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

#-----------------------begin state machine-----------------------
   evaluation_interval DETECTED 2.0 sec
   state DETECTED
      next_state DETECTED
         if (TRACK.IFF_Friend() || ! WeaponsAvailable())
         {
            # cancel any tasks assigned against this track
            CancelTask(TRACK.TrackId());
            return true;
         }
         return false;
      end_next_state

      next_state ENGAGE
         return (TRACK.BelievedAlive() &&
                 (! TRACK.IFF_Friend()) &&
                 IsEngageable());
      end_next_state
   end_state

   evaluation_interval ENGAGE 2.0 sec
   state ENGAGE  # Engages and fires the weapon if it can
      next_state DETECTED
         return (TRACK.BelievedDead() ||
                 ! TrackingNow());
      end_next_state

      next_state WEAPONCHECK
         bool launched = false;
         if (TRACK.BelievedAlive() &&
             TrackingNow() &&  # in case we lost the track a microsecond ago
             ! FiringNow() &&  # if a shot has been fired, wait for results
             InInterceptEnvelopeOf(PLATFORM.Weapon(WEAPON_NAME)))
         {
             writeln_d("Trying to launch weapon " );
             launched = LaunchWeapon();
         }
         return launched;
      end_next_state
   end_state

   evaluation_interval WEAPONCHECK 2.0 sec
   state WEAPONCHECK
       next_state DETECTED
           return (WeaponsAvailable());
       end_next_state

       next_state WEAPONCHECK # example of dead ending a state machine
           return true;
       end_next_state
   end_state
end_processor
```

- **演示要点**：演示 WSF_TASK_PROCESSOR 的参数：show_task_messages, script_variables, script, evaluation_interval, state

### processor · WSF_SCRIPT_PROCESSOR｜处理器

- **关键词**：processor, WSF_SCRIPT_PROCESSOR, on, update_interval, script_variables, on_update, execute, 处理器
- **出处**：`coverage_demos/processors/sat_exclusion_angle_proc.txt:11-160`
- **片段**：

```text
processor SAT_EXCLUSION_ANGLE_PROC WSF_SCRIPT_PROCESSOR
   on
   update_interval 30 sec
   
   # Change these on the platform_type or platform level.
   # Set vars directly - do not specify type again.
   script_variables 
      string EXCL_SENSOR_NAME = "";  # default: no sensor
      double SOLAR_EXCL_ANGLE = 0.0; # default var for no exclusion
      double LUNAR_EXCL_ANGLE = 0.0; # default var for no exclusion
      bool ANGLES_TO_MYSTIC = false; # default: do not send angle data to Mystic
      bool DRAW_SEN_ON_OFF = false;  # default: do not draw to indicate sensor on/off
      bool BOOKMARK_SEN_OFF = false; # default: do not make Mystic bookmarks when sensor is turned off
      int senOffCt = 0;              # leave this var alone at the platform_type or platform level
      double drawRadius = 1.0e5;     # meters, tweak to adjust draw circle
   end_script_variables
   
   on_update
      # get the sensor subsystem to apply exclusion angle constraints to
      WsfSensor sen = PLATFORM.Sensor(EXCL_SENSOR_NAME);
      if (!sen.IsValid()) # turn of processor if sensor not found
      {
         PROCESSOR.TurnOff();
         return;
      }
      string platName = PLATFORM.Name();
      string senName = EXCL_SENSOR_NAME;
      string platSenStr = platName + "-" + senName;
      
      # time now in the sim
      Calendar simNow = WsfDateTime.CurrentTime();
      
      # update pointing
      bool senOn = sen.IsTurnedOn();
      if (senOn)
      {
         PointSensorToGEO_Belt(sen);
      }
      
      # sensor-platform related vectors
      Vec3 senBoresightUnit = Vec3.Construct(1.0, 0.0, 0.0); # unit vector along the sensor's boresight
      Vec3 senPosPlat = sen.ConvertPCSVectorToECS(senBoresightUnit); # platform/body or entity coord system (ECS)
      
      # solar related vectors
      Vec3 solarPosECI = Sun.LocationECI(simNow);  # ECI coord syst = GCRF (Geocentric Celestial Reference Frame)
      Vec3 solarPosWCS = PLATFORM.ConvertECIToWCS(solarPosECI); # WCS (world coord syst), a.k.a Earth Centered, Earth Fixed (ECEF)
      Vec3 solarPosPlat = PLATFORM.ConvertWCSToECS(solarPosWCS);
      
      # lunar related vectors
      Vec3 lunarPosECI = Moon.LocationECI(simNow); # ECI coord syst = GCRF (Geocentric Celestial Reference Frame)
      Vec3 lunarPosWCS = PLATFORM.ConvertECIToWCS(lunarPosECI); # WCS (world coord syst), a.k.a Earth Centered, Earth Fixed (ECEF)
      Vec3 lunarPosPlat = PLATFORM.ConvertWCSToECS(lunarPosWCS);
      
      # calculate the solar and lunar angles off the sensor boresight
      double solarNumer = Vec3.Dot(senPosPlat, solarPosPlat);
      double solarDenom = senPosPlat.Magnitude() * solarPosPlat.Magnitude();
      double solarAng = Math.ACos(solarNumer / solarDenom); # deg
   
      double lunarNumer = Vec3.Dot(senPosPlat, lunarPosPlat);
      double lunarDenom = senPosPlat.Magnitude() * lunarPosPlat.Magnitude();
      double lunarAng = Math.ACos(lunarNumer / lunarDenom); # deg
      
      # determine if exclusion conditions are met
      # if any are less than and the sensor is on, turn off the sensor
      # if both are greater than and the sensor is off, turn on the sensor
      bool solarExcl = solarAng < SOLAR_EXCL_ANGLE;
      bool lunarExcl = lunarAng < LUNAR_EXCL_ANGLE;
      
      if (senOn && (solarExcl || lunarExcl))
      {
         sen.TurnOff();
         senOffCt = senOffCt + 1;
         
         if (DRAW_SEN_ON_OFF)
         {
            WsfDraw draw = {};
            draw.Erase(platSenStr);
            draw.SetId(platSenStr);
            draw.SetColor(Color.Red());
            draw.BeginEllipse(0.0, drawRadius, drawRadius);
            draw.VertexNED(PLATFORM, 0.0, 0.0, 0.0);
            draw.End();
         }
         
         if (BOOKMARK_SEN_OFF)
         {
            string bmrkType = platSenStr;
            string bmrkText = "sensor_off_ct_" + (string) senOffCt;
            WsfEventPipe.AddBookmark(TIME_NOW, bmrkType, bmrkText);
         }
      }
      
      else if (!senOn && !solarExcl && !lunarExcl)
      {
         PointSensorToGEO_Belt(sen);
         sen.TurnOn();
         
         if (DRAW_SEN_ON_OFF)
         {
            WsfDraw draw = {};
            draw.Erase(platSenStr);
            draw.SetId(platSenStr);
            draw.SetColor(Color.Green());
            draw.BeginEllipse(0.0, drawRadius, drawRadius);
            draw.VertexNED(PLATFORM, 0.0, 0.0, 0.0);
            draw.End();
         }
      }
      
      # if enabled, sends angular data to Mystic
      if(ANGLES_TO_MYSTIC)
      {
         WsfEventPipe.Record(PLATFORM, "Sun-Sen", solarAng);
         WsfEventPipe.Record(PLATFORM, "Moon-Sen", lunarAng);
         WsfEventPipe.Record(PLATFORM, "Sen-On", sen.IsTurnedOn());
      }
      
   end_on_update
   
   # draw initial sensor on/off circle, if option enabled
   execute at_time 0.001 sec absolute 
      WsfSensor sen = PLATFORM.Sensor(EXCL_SENSOR_NAME);
      if (!sen.IsValid()) # turn of processor if sensor not found
      {
         PROCESSOR.TurnOff();
         return;
      }
      string platName = PLATFORM.Name();
      string senName = EXCL_SENSOR_NAME;
      string platSenStr = platName + "-" + senName;
      
      if(DRAW_SEN_ON_OFF)
      {
         bool senOn = sen.IsTurnedOn();
         Color initColor = Color.Green();
         if (!senOn)
         {
            initColor = Color.Red();
         }
         
         WsfDraw draw = {};
         draw.Erase(platSenStr);
         draw.SetId(platSenStr);
         draw.SetColor(initColor);
         draw.BeginEllipse(0.0, drawRadius, drawRadius);
         draw.VertexNED(PLATFORM, 0.0, 0.0, 0.0);
         draw.End();
      }
   end_execute
end_processor
```

- **演示要点**：演示 WSF_SCRIPT_PROCESSOR 的参数：on, update_interval, script_variables, on_update, execute

### processor · WSF_STATE_MACHINE｜处理器

- **关键词**：processor, WSF_STATE_MACHINE, script_variables, script, state, on_update, update_interval, 处理器
- **出处**：`logistics/processors/strike_controller.txt:18-221`　（同签名共 3 处，另见 `logistics/processors/platform_to_platform_transport_processor.txt:27`、`logistics/processors/shuttle_transport_processor.txt:18`）
- **片段**：

```text
processor STRIKE_CONTROLLER WSF_STATE_MACHINE

   script_variables

      bool        runSilent                 = true;
      bool        isInitialized             = false;
      bool        isDone                    = false;
      string      currentState              = "SC_IDLE";
      double      initializeTime            = 0.0;
      double      takeoffTime               = 0.0;
      double      missionDuration           = 0.0;
      double      landingTime               = 0.0;
      double      inspectionStartTime       = 0.0;
      double      engineDispatchReliability = 0.8;
      double      proximityLimit            = 20.0; // meters

      WsfRoute    missionRoute;
      WsfGeoPoint rampLocation;

      WsfExchangeProcessor exProc;

      Container   fuelContainer;        // Must be Full before takeoff.
      Container   goodEnginesContainer; // Must contain (2) Good engines before takeoff.

      Transactor  fuelRequestTransactor;
      Transactor  repairRequestTransactor;

   end_script_variables

   script void Say(string aMsg)
      if ((runSilent || gDebugNone) && (! gDebugAll)) return;
      writeln("At t=", TIME_NOW,", ",PLATFORM.Name(), " - ", aMsg);
   end_script

   script string GetState()
      return currentState;
   end_script

   state SC_IDLE
      on_entry
         Say("Entering state SC_IDLE.");
         PLATFORM.Comment("Entering State SC_IDLE");
      end_on_entry
      next_state PREFLIGHT_INSPECTION
         rampLocation = PLATFORM.Location();
         return true;
      end_next_state
   end_state

   state PREFLIGHT_INSPECTION
      on_entry
         Say("Entering state PREFLIGHT_INSPECTION.");
         PLATFORM.Comment("Entering State PREFLIGHT_INSPECTION");
         inspectionStartTime = TIME_NOW;
      end_on_entry
      next_state INSPECTED
         return TIME_NOW > inspectionStartTime + 1200.0;  # Inspection Interval
      end_next_state
      on_exit
         bool failedLeftEngine  = (RANDOM.Uniform() - engineDispatchReliability) > 0.0;
         bool failedRightEngine = (RANDOM.Uniform() - engineDispatchReliability) > 0.0;
         if (failedLeftEngine)
         {
            goodEnginesContainer.Decrement(1.0);
            Say("Inspection failed Left Engine!");
            PLATFORM.Comment("Left Engine Failed Inspection.");
         }
         if (failedRightEngine)
         {
            goodEnginesContainer.Decrement(1.0);
            Say("Inspection failed Right Engine!");
            PLATFORM.Comment("Right Engine Failed Inspection.");
         }
      end_on_exit
   end_state

   state INSPECTED
      on_entry
         Say("Entering state INSPECTED.");
         PLATFORM.Comment("Entering State INSPECTED");
      end_on_entry
      next_state MISSION_READY
         return fuelContainer.IsFull() && goodEnginesContainer.IsFull();
      end_next_state
      next_state NEEDS_REPAIR_OR_FUEL
         return ! (goodEnginesContainer.IsFull() && fuelContainer.IsFull());
      end_next_state
   end_state

   state NEEDS_REPAIR_OR_FUEL
      on_entry
         Say("Entering state NEEDS_REPAIR_OR_FUEL");
         PLATFORM.Comment("Entering state NEEDS_REPAIR_OR_FUEL.");
      end_on_entry
      next_state MISSION_READY
         return goodEnginesContainer.IsFull() && fuelContainer.IsFull();
      end_next_state
   end_state

   state MISSION_READY
      on_entry
         Say("Entering state MISSION_READY.");
         PLATFORM.Comment("Entering state MISSION_READY.");
         missionRoute = gNextMissionRouteToFly();
         Say("Mission Orders Received.");
      end_on_entry
      next_state WHEELS_UP
         return true;
      end_next_state
   end_state

   state WHEELS_UP
      on_entry
         Say("Entering state WHEELS_UP.");
         WsfRoute routeToJob = WsfRoute();
         routeToJob.Append(PLATFORM.LocationAsWaypoint());
         routeToJob.Back().SetSpeed(100.0);
         foreach(WsfWaypoint wp in missionRoute)
         {
            routeToJob.Append(wp);
         }
         WsfWaypoint endPt = WsfWaypoint();
         endPt.SetLocation(rampLocation);
         endPt.SetEndOfPathOption("STOP");
         routeToJob.Append(endPt);
         takeoffTime = TIME_NOW;
         PLATFORM.FollowRoute(routeToJob);
      end_on_entry
      next_state ON_MISSION
         return TIME_NOW - takeoffTime > 300.0;
      end_next_state
   end_state

   state ON_MISSION
      on_entry
         Say("Entering state ON_MISSION.");
      end_on_entry
      next_state LANDED
         return (missionDuration > 1000.0) && (PLATFORM.Speed() < 0.01) && (PLATFORM.GroundRangeTo(rampLocation) < proximityLimit);
      end_next_state
   end_state

   state LANDED
      on_entry
         Say("Entering state LANDED.");
         landingTime = TIME_NOW;
         # Update the tally of the number of missions flown.
         isDone = gIncrementSortieCount();
         fuelContainer.Decrement(120.0); # Temporary, just to mimic a fuel consumption model.
      end_on_entry
      next_state SC_COMPLETED
         return isDone;
      end_next_state
      next_state PREFLIGHT_INSPECTION
         return TIME_NOW > landingTime + 1200.0; # 20 minute crew changeout.
      end_next_state
   end_state

   state SC_COMPLETED
      on_entry
         Say("Entering state SC_COMPLETED.");
         PLATFORM.Comment("Entering State SC_COMPLETED");
      end_on_entry
   end_state

   script bool SC_Init(Container  aFuelContainer,
                       Container  aGoodEnginesContainer,
                       Transactor aFuelRequestTransactor,
                       Transactor aRepairRequestTransactor,
                       bool       aRunningSilent)

      runSilent = aRunningSilent;
      initializeTime = TIME_NOW;
      fuelContainer = aFuelContainer;
      goodEnginesContainer = aGoodEnginesContainer;
      fuelRequestTransactor = aFuelRequestTransactor;
      repairRequestTransactor = aRepairRequestTransactor;

      bool success = fuelContainer.IsValid() && goodEnginesContainer.IsValid() &&
                     fuelRequestTransactor.IsValid() && repairRequestTransactor.IsValid();

      if (success)
      {
         Say("The SC_Init() succeeded");
         isInitialized = true;
      }
      else
      {
         Say("The SC_Init() FAILED.");
      }
      return success;
   end_script

   on_update
      if (isInitialized && (TIME_NOW > initializeTime + 11.0))
      {
         currentState = STATE_MACHINE.Evaluate(currentState);
         missionDuration = TIME_NOW - takeoffTime;
      }
   end_on_update

   update_interval 5 sec

end_processor
```

- **演示要点**：演示 WSF_STATE_MACHINE 的参数：script_variables, script, state, on_update, update_interval

### processor · WSF_TASK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TASK_PROCESSOR, script_variables, string, script, evaluation_interval, state, 处理器
- **出处**：`ciws/processors/gun_battery_tactics.txt:11-221`
- **片段**：

```text
processor GUN_BATTERY_TACTICS WSF_TASK_PROCESSOR

   #show_state_transitions
   #show_task_messages

   script_variables           # These variables are overwritten by the platform.
      string TRACK_SENSOR_NAME               = "";
      string ACQ_SENSOR_NAME               = "";
      string SENSOR_TRACK_MODE         = "TRACK"; # could be "default" if using a modeless sensor if used
	   string SENSOR_ACQUIRE_MODE       = "ACQUIRE";  # if used...
      string WEAPON_NAME               = ""; # Supplied by the gun platform
      double REQUIRED_TRACK_QUALITY    = .98; # Must have a high quality track
      int SALVO_SIZE                   = 1;  # Overwritten by platform using this processor
      double LAUNCH_DELAY              = 0;
      double MAX_RANGE                 = 0; # MUST BE SUPPLIED BY LAUNCHING PLATFORM!!!
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

   # return true if TRACK is inside the intercept envelope AND flying toward us
   script bool InInterceptEnvelopeOf(WsfWeapon aWeapon)
      bool CanIntercept = 0;
      double targetRelativeHeading = PLATFORM.RelativeHeadingOf(TRACK);
      if((PLATFORM.GroundRangeTo(TRACK) > MAX_RANGE) || 
          !aWeapon.IsValid() || 
          !aWeapon.LaunchComputer().IsValid() ||
          MATH.Fabs(targetRelativeHeading) > 90)

      {
         return CanIntercept;
      }
      WsfLaunchComputer computer = aWeapon.LaunchComputer();
      #writeln(TIME_NOW, " Launch Computer Name is = ", computer );
      #writeln(TIME_NOW, " computer.Intercept point is ", computer.InterceptPoint());
	   CanIntercept = computer.CanIntercept(TRACK, LAUNCH_DELAY) &&
                     computer.InterceptPointIsValid();
      if( ! computer.InterceptPointIsValid())
      {
         writeln_d("ERROR - ", aWeapon.Name(), " does not have a valid intercept point!!!");
      }
      writeln_d(TIME_NOW, "CanIntercept = ",   CanIntercept);
      return CanIntercept;
   end_script

   # returns true if acq_radar is tracking
   script bool HasAcquired()
      return (TRACK.TrackQuality() > 0.75);
   end_script

   # returns true if any TTR is tracking (external sensor not defined)
   script bool TrackingNow()
      if (!TRACK.IsValid())
      {
         return false;
      }


      if (TRACK_SENSOR_NAME == "")
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
      if (weapon.IsTurnedOn() &&  (weapon.QuantityRemaining() >= SALVO_SIZE))
      {
         canInterceptNow = InInterceptEnvelopeOf(weapon);
      }
      bool launched = false;
      if (canInterceptNow)
      {
            canInterceptNow = InInterceptEnvelopeOf(weapon);
            weapon.CueToTarget(TRACK);
            launched = FireAt(TRACK, mShootTaskStr, weapon, SALVO_SIZE);
            #launched = FireAt(TRACK, mShootTaskStr, weapon,    1       );

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
               (OperatingLevelFor("ENGAGE") > 0))) ;
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


# ------------------------------------------------------------------
# START OF THE STATE MACHINE
   evaluation_interval DETECTED 0.5 sec
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
         return (TRACK.BelievedDead() || TRACK.IFF_Friend() || (! IsEngageable()));
      end_next_state

      next_state ENGAGE

         # wait until tracking target
         if (TRACK_SENSOR_NAME == "")
         {
            writeln_d(TIME_NOW, " In intercept of the gun = ", InInterceptEnvelopeOf(PLATFORM.Weapon(WEAPON_NAME)));
            return (TRACK.BelievedAlive() &&
                    InInterceptEnvelopeOf(PLATFORM.Weapon(WEAPON_NAME)) &&
                    (TRACK.TrackQuality() > REQUIRED_TRACK_QUALITY));
         }
         else
         {
            return (TrackingNow() && InInterceptEnvelopeOf(PLATFORM.Weapon(WEAPON_NAME)) &&
                    ((TasksAssignedFor(TRACK.TrackId(), mTrackTaskStr) > 0) ||
                    (PLATFORM.Commander() == PLATFORM)));
         }
      end_next_state
   end_state

   evaluation_interval ENGAGE 0.005 sec
   state ENGAGE
      next_state ENGAGEABLE
         return (TRACK.BelievedDead() || ! TrackingNow());
      end_next_state

      next_state FIRING
         bool launched = false;

         if (TRACK.BelievedAlive() &&
             TrackingNow() &&            
             InInterceptEnvelopeOf(PLATFORM.Weapon(WEAPON_NAME)))
         {
            launched = LaunchWeapon();
         }
         return launched;
      end_next_state
   end_state

   evaluation_interval FIRING .005 sec
   state FIRING
      next_state ENGAGE
         if (TRACK.BelievedDead() ||
             ! InInterceptEnvelopeOf(PLATFORM.Weapon(WEAPON_NAME)) ||             
             (TasksAssignedFor(TRACK.TrackId(), mShootTaskStr) < 1) ||
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

- **演示要点**：演示 WSF_TASK_PROCESSOR 的参数：script_variables, string, script, evaluation_interval, state

### processor · WSF_TASK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TASK_PROCESSOR, track_update_interval, script_variables, script, evaluation_interval, state, 处理器
- **出处**：`orwaca_iads/processors/sam_battery_tactics.txt:16-269`　（同签名共 6 处，另见 `cyber/processors/telar_task_mgr.txt:16`、`orwaca_iads/processors/telar_task_mgr.txt:16`、`aea_iads/processors/red_sam_battery_tactics.txt:18`）
- **片段**：

```text
processor SAM_BATTERY_TASK_MGR WSF_TASK_PROCESSOR

   #script_debug_writes on
   #show_state_transitions
   #show_task_messages

   track_update_interval 5.0 sec

   script_variables
      string SENSOR_NAME;
      string WEAPON_NAME;

      string ENVELOPE                  = "full_kinematic";

      // the following variables declare the names of the modes used for tracking
      string SENSOR_ACQUIRE_MODE       = "ACQUIRE";
      string SENSOR_TRACK_MODE         = "TRACK";

      // the following variable declares the minimum track quality to
      // attempt to engage the target
      double REQUIRED_TRACK_QUALITY    = 0.49;

      int SALVO_SIZE                   = 2;

      // the following are used internally and should not be modified by the user
      string mAcquireTaskStr   = "Acquire";
      string mTrackTaskStr     = "Track";
      string mShootTaskStr     = "Shoot";
   end_script_variables

   // returns true if weapon is still active for given track
   script bool FiringNow()
      return (WeaponsActiveFor(TRACK.TrackId()) > 0);
   end_script

   // return true if intercept results are known
   // (i.e. weapons have terminated for this TRACK)
   script bool InterceptResultsKnown()
      return (TimeSinceWeaponLastTerminatedFor(TRACK.TrackId()) > 0.0);
   end_script

   // return true if TRACK is inside the intercept envelope
   script bool InInterceptEnvelopeOf(string aEnvelopeName)
      extern bool SAM_LaunchComputer(WsfTrack, WsfPlatform, string, double);
      return SAM_LaunchComputer(TRACK, PLATFORM, aEnvelopeName, 0.0);
   end_script

   // returns true if acq_radar is tracking
   script bool HasDetected()
      return (TRACK.TrackQuality() > 0.55);
   end_script

   // returns true if TTR is tracking in acquire mode
   script bool HasAcquired()
      return (TRACK.TrackQuality() > 0.75);
   end_script

   // returns true if TTR is tracking in track mode
   script bool TrackingNow()
      return (TRACK.TrackQuality() > 0.95);
   end_script

   // release resources
   script void ReleaseResources()
      CancelTask(TRACK.TrackId());
   end_script

   // select a weapon and launch it
   // the selected weapon must be available, have sufficient rounds and not busy
   script bool LaunchWeapon()
      WsfWeapon   weapon;
      WsfPlatform platform;
      foreach (WsfPlatform sub in PLATFORM.Subordinates())
      {
         weapon = sub.Weapon(WEAPON_NAME);
         if (weapon.IsTurnedOn() &&
             (weapon.QuantityRemaining() >= SALVO_SIZE) &&
             (TasksAssignedTo(sub, "", weapon.Name()) < 1))
         {
            bool canInterceptNow = InInterceptEnvelopeOf(ENVELOPE);
            if (canInterceptNow)
            {
               platform = sub;
               break;
            }
         }
      }
      bool launched = false;
      if ((weapon.IsValid()) && (!platform.IsNull()))
      {
         launched = Fire(TRACK, mShootTaskStr, weapon.Name(), SALVO_SIZE, platform);
         if (launched)
         {
            writeln_d("*** T=", TIME_NOW, " ", platform.Name(), " ",
                      TRACK.TargetName(), " R=", platform.SlantRangeTo(TRACK),
                      " FIRE!!!!");
         }
      }
      return launched;
   end_script

   // returns true if the TRACK has been assigned or the system has
   // local engage authority
   script bool IsAssignable()
      #writeln ("OperatingLevel for ENGAGE is ", OperatingLevelFor("ENGAGE"));
      return ((PLATFORM == PLATFORM.Commander()) ||
              (TasksReceivedFor(TRACK.TrackId()) > 0)); # ||
              #(OperatingLevelFor("ENGAGE") > 0));
   end_script

   // determine the number of available weapons
   script int WeaponsAvailable(WsfPlatform aAssignee)
      int quantity = 0;
      WsfWeapon weapon = aAssignee.Weapon(WEAPON_NAME);
      if (weapon.IsTurnedOn())
      {
         quantity = weapon.QuantityRemaining();
      }
      return quantity;
   end_script

   // determine total number of available weapons
   script int TotalWeaponsAvailable()
      int quantity = 0;
      foreach (WsfPlatform sub in PLATFORM.Subordinates())
      {
         quantity = quantity + WeaponsAvailable(sub);
      }
      return quantity;
   end_script

   // begin tracking the current target
   script bool Engage()
      bool engaging = false;
      if (TotalWeaponsAvailable() < 1) return false;

      foreach (WsfPlatform sub in PLATFORM.Subordinates())
      {
         // bypass this subordinate if it already has a tracking assignment for this target
         if (TasksAssignedTo(sub, TRACK.TrackId(), mTrackTaskStr) > 0) continue;

         WsfSensor sensor = sub.Sensor(SENSOR_NAME);
         if (! sensor.IsValid()) continue;

         // the system can only track so many targets
         if (sensor.ActiveRequestCount(SENSOR_TRACK_MODE) >=
             sensor.MaximumRequestCount(SENSOR_TRACK_MODE)) continue;

         if (TRACK.BelievedAlive() &&
             InInterceptEnvelopeOf(ENVELOPE) &&
             (HasAcquired()))
         {
            // track the target
            engaging = StartTracking(TRACK, mTrackTaskStr, sensor.Name(), SENSOR_TRACK_MODE, sub);
            if (engaging) break;
         }
         
         if (sensor.ActiveRequestCount(SENSOR_ACQUIRE_MODE) >=
             sensor.MaximumRequestCount(SENSOR_ACQUIRE_MODE)) continue;
             
         if (TRACK.BelievedAlive() &&
             InInterceptEnvelopeOf(ENVELOPE) &&
             (HasDetected()))
         {
            // acquire the target
            engaging = StartTracking(TRACK, mAcquireTaskStr, sensor.Name(), SENSOR_ACQUIRE_MODE, sub);
            if (engaging) break;
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
            // cancel any tasks assigned against this track
            CancelTask(TRACK.TrackId());
            return true;
         }
         return false;
      end_next_state

      next_state ENGAGEABLE
         return (TRACK.BelievedAlive() && (! TRACK.IFF_Friend()) && IsAssignable());
      end_next_state
   end_state

   evaluation_interval ENGAGEABLE 2.0 sec
   state ENGAGEABLE
      next_state DETECTED
         bool cancel = false;
         if (TRACK.BelievedDead() ||  TRACK.IFF_Friend() ||
             ((TasksAssignedFor(TRACK.TrackId(), "ENGAGE") < 1)   &&  (! IsAssignable())))
         {
            cancel = true;
            ReleaseResources();
         }
         return cancel;
      end_next_state

      next_state ENGAGE
         Engage();

         // wait until tracking target
         return (TrackingNow() && (TasksAssignedFor(TRACK.TrackId(), mTrackTaskStr) > 0));
      end_next_state
   end_state

   evaluation_interval ENGAGE 2.0 sec
   state ENGAGE
      next_state ENGAGEABLE
         bool cancel = false;
         if (TRACK.BelievedDead() ||
             (! TrackingNow()) ||
             (! IsAssignable()))
         {
            cancel = true;
            ReleaseResources();
         }
         return cancel;
      end_next_state

      next_state FIRING
         bool launched = false;

         if (TRACK.BelievedAlive() &&
             TrackingNow() &&
             ! FiringNow() &&
             InInterceptEnvelopeOf(ENVELOPE))
         {
            launched = LaunchWeapon();
         }
         return launched;
      end_next_state
   end_state

   evaluation_interval FIRING 2.0 sec
   state FIRING
      next_state ENGAGE
         return (TRACK.BelievedDead() ||
                 ! InInterceptEnvelopeOf(ENVELOPE) ||
                 (! FiringNow() &&
                  (TasksAssignedFor(TRACK.TrackId(), mShootTaskStr) < 1)) ||
                 (TotalWeaponsAvailable() < 1) ||
                 ! TrackingNow());
      end_next_state
   end_state

end_processor
```

- **演示要点**：演示 WSF_TASK_PROCESSOR 的参数：track_update_interval, script_variables, script, evaluation_interval, state

### processor · WSF_TASK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TASK_PROCESSOR, script_variables, script, on_message, evaluation_interval, state, 处理器
- **出处**：`space_operations/processors/establish_link_processor.txt:21-304`
- **片段**：

```text
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

- **演示要点**：演示 WSF_TASK_PROCESSOR 的参数：script_variables, script, on_message, evaluation_interval, state

### processor · WSF_THREAT_PROCESSOR｜处理器

- **关键词**：processor, WSF_THREAT_PROCESSOR, update_interval, threat_velocity, threat_angle_spread, threat_time_to_intercept, 处理器
- **出处**：`behavior_tree/platforms/run_tree_striker.txt:122-127`　（同签名共 6 处，另见 `behavior_tree/platforms/selector_striker.txt:134`、`heatmap/platforms/striker.txt:109`、`heatmap/platforms/striker_pursuit.txt:117`）
- **片段**：

```text
   processor incoming_threats WSF_THREAT_PROCESSOR
      update_interval           1 sec
      threat_velocity        1300 knots
      threat_angle_spread     20.0 deg
      threat_time_to_intercept  60 sec
   end_processor
```

- **演示要点**：演示 WSF_THREAT_PROCESSOR 的参数：update_interval, threat_velocity, threat_angle_spread, threat_time_to_intercept

### processor · WSF_AIR_TARGET_FUSE｜处理器

- **关键词**：processor, WSF_AIR_TARGET_FUSE, gross_update_interval, fine_update_interval, gross_proximity_range, hit_proximity_range, 处理器
- **出处**：`ciws/weapons/guns/30mm_bullet.txt:41-46`　（同签名共 2 处，另见 `gun_engagement/weapons/guns/BULLET.txt:34`）
- **片段**：

```text
   processor fuse WSF_AIR_TARGET_FUSE
      gross_update_interval 0.01 sec
      fine_update_interval 0.001 sec
      gross_proximity_range  3 m
      hit_proximity_range 2 m
   end_processor
```

- **演示要点**：演示 WSF_AIR_TARGET_FUSE 的参数：gross_update_interval, fine_update_interval, gross_proximity_range, hit_proximity_range

### processor · WSF_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TRACK_PROCESSOR, raw_track_reporting, fused_track_reporting, purge_interval, report_interval, 处理器
- **出处**：`hel/intersect_mesh_test_beam_director.txt:255-260`　（同签名共 2 处，另见 `hel/intersect_mesh_test.txt:251`）
- **片段**：

```text
   processor fuser WSF_TRACK_PROCESSOR
      raw_track_reporting on
      fused_track_reporting off
      purge_interval 60.0 seconds
      report_interval 5.0 seconds
   end_processor
```

- **演示要点**：演示 WSF_TRACK_PROCESSOR 的参数：raw_track_reporting, fused_track_reporting, purge_interval, report_interval

### processor · WSF_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TRACK_PROCESSOR, on, master_track_processor, update_interval, purge_interval, 处理器
- **出处**：`p6dof/platforms/aam-mr.txt:111-116`　（同签名共 15 处，另见 `p6dof/platforms/aam-sr-tvc.txt:95`、`p6dof/platforms/sam-mr.txt:94`、`six_dof/platforms/aam-mr.txt:140`）
- **片段**：

```text
   processor data_mgr WSF_TRACK_PROCESSOR
      on
      master_track_processor
      update_interval 0.01 sec
      purge_interval  1 sec
   end_processor
```

- **演示要点**：演示 WSF_TRACK_PROCESSOR 的参数：on, master_track_processor, update_interval, purge_interval

### processor · WSF_GUIDANCE_COMPUTER｜处理器

- **关键词**：processor, WSF_GUIDANCE_COMPUTER, proportional_navigation_gain, g_bias, maximum_commanded_g, update_interval, 处理器
- **出处**：`shooter/weapons/aam/aa_mrm.txt:143-149`
- **片段**：

```text
   processor computer WSF_GUIDANCE_COMPUTER
      proportional_navigation_gain  455.0
#      velocity_pursuit_gain         1.0
      g_bias                        1.1
      maximum_commanded_g           12.0 g
      update_interval               0.05 s
   end_processor
```

- **演示要点**：演示 WSF_GUIDANCE_COMPUTER 的参数：proportional_navigation_gain, g_bias, maximum_commanded_g, update_interval

### processor · WSF_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TRACK_PROCESSOR, non_master_track_processor, retain_track_history, uncorrelated_track_drops, internal_link, 处理器
- **出处**：`engage/grid_react_man.txt:183-191`
- **片段**：

```text
   processor mar_track_list WSF_TRACK_PROCESSOR
      non_master_track_processor
      retain_track_history
      uncorrelated_track_drops off

      #report incoming weapon tracks to the reactive manuever processor,
      #so the target may make evasive maneuvers
      internal_link maneuver
   end_processor
```

- **演示要点**：演示 WSF_TRACK_PROCESSOR 的参数：non_master_track_processor, retain_track_history, uncorrelated_track_drops, internal_link

### processor · WSF_SCRIPT_PROCESSOR｜处理器

- **关键词**：processor, WSF_SCRIPT_PROCESSOR, debug, update_interval, on_update, if, 处理器
- **出处**：`simple_scenario/platforms/blue_strikers.txt:21-35`
- **片段**：

```text
   processor killer WSF_SCRIPT_PROCESSOR

     debug

     update_interval 1 sec

     on_update
       //end the simulation after X minutes have passed
       if ( TIME_NOW > 600.0 )
       {
         WsfSimulation.SetEndTime( TIME_NOW );
       }
     end_on_update

  end_processor
```

- **演示要点**：演示 WSF_SCRIPT_PROCESSOR 的参数：debug, update_interval, on_update, if

### processor · WSF_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TRACK_PROCESSOR, report_interval, circular_report_rejection, update_interval, on_message, 处理器
- **出处**：`comm/group_comm_example.txt:27-42`
- **片段**：

```text
processor BASIC_TRACK_PROC WSF_TRACK_PROCESSOR
   report_interval 2 sec
   circular_report_rejection on
   update_interval 10 sec

   on_message
      type WSF_TRACK_MESSAGE
      script
         WsfTrackMessage tmsg = (WsfTrackMessage)MESSAGE;
         if(tmsg.Originator() != PLATFORM.Name())
         {
            print("T=",TIME_NOW," P=",PLATFORM.Name(),"  Track ",tmsg.Track().TargetName()," received from ",tmsg.Originator());
         }
      end_script
   end_on_message
end_processor
```

- **演示要点**：演示 WSF_TRACK_PROCESSOR 的参数：report_interval, circular_report_rejection, update_interval, on_message

### processor · WSF_EXCHANGE_PROCESSOR｜处理器

- **关键词**：processor, WSF_EXCHANGE_PROCESSOR, commodity_and_capability_pairing, service_and_capability_pairing, update_interval, script, 处理器
- **出处**：`logistics/processors/exchange_processor.txt:10-26`
- **片段**：

```text
processor EXCHANGE_PROCESSOR WSF_EXCHANGE_PROCESSOR

   commodity_and_capability_pairing JP-8_FUEL     SUPPLY_FUEL
   service_and_capability_pairing   ENGINE_REPAIR VEHICLE_REPAIR

   #debug
   update_interval 10 sec

   /*script void on_request_failed(Transactor aTransactor)
     writeln(" request-timed-out"); // You may define this script if needed.
   end_script*/

   script void on_transaction_complete(Transactor aTransactor)
     writeln(" *** transaction-successful *** "); // You may define this script if needed.  This is just a placeholder.
   end_script

end_processor
```

- **演示要点**：演示 WSF_EXCHANGE_PROCESSOR 的参数：commodity_and_capability_pairing, service_and_capability_pairing, update_interval, script

### processor · WSF_RIPR_PROCESSOR｜处理器

- **关键词**：processor, WSF_RIPR_PROCESSOR, job_pass_through, script_variables, on_initialize, on_update, 处理器
- **出处**：`base_types/processors/ripr_agents/aisc/aisc_passthru_processor.txt:14-31`
- **片段**：

```text
   processor AISC-thinker WSF_RIPR_PROCESSOR

      job_pass_through  #very important for this commander, it is a pass through

      script_variables
      end_script_variables

      on_initialize
      end_on_initialize

      on_update
      end_on_update

      ##deprecated
      #query_bid
      #end_query_bid

   end_processor
```

- **演示要点**：演示 WSF_RIPR_PROCESSOR 的参数：job_pass_through, script_variables, on_initialize, on_update

### processor（jet_aircraft）｜处理器

- **关键词**：processor, operating_level, weapon_uplink_path, update_interval, on_update, 处理器
- **出处**：`shooter/platforms/jet_aircraft.txt:53-70`
- **片段**：

```text
   processor task_mgr AA_TASK_MGR
      operating_level ENGAGE 1
      weapon_uplink_path radar datalink
      update_interval 1 secs
      # check to see if I am commanded and turn on my radar
      on_update
            writeln_d(PLATFORM.CommanderName());
            WsfSensor sensor = PLATFORM.Sensor("radar");
            if ( ! sensor.IsTurnedOn())
            {
              if ((TasksReceived() > 0) ||
                   (PLATFORM == PLATFORM.Commander()))
                {
                sensor.TurnOn();
                }
            }
      end_on_update
   end_processor
```

- **演示要点**：演示 processor 的参数：operating_level, weapon_uplink_path, update_interval, on_update

### processor · WSF_WEAPONS_MANAGER_SAM｜处理器

- **关键词**：processor, WSF_WEAPONS_MANAGER_SAM, update_interval, haveco_reporting_strategy, engagement_settings, delays, 处理器
- **出处**：`iads_c2_demos/processors/weapons_manager_sam.txt:14-32`
- **片段**：

```text
processor WM_SAM WSF_WEAPONS_MANAGER_SAM
   update_interval 1 sec

   haveco_reporting_strategy on_detonate

   engagement_settings
      ew_targets                    false
      tar_targets                   false
      ttr_targets                   true
      engage_local_ttr_targets_only true
   end_engagement_settings

   delays
      # Note: time_to_launch delay is on the weapon as firing_delay and
		   # salvo_shot delay is on the weapon as salvo_interval
      time_between_engagements    0 seconds
      expected_sensor_acquisition 0 seconds
   end_delays
end_processor
```

- **演示要点**：演示 WSF_WEAPONS_MANAGER_SAM 的参数：update_interval, haveco_reporting_strategy, engagement_settings, delays

### processor · WSF_TASK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TASK_PROCESSOR, show_task_messages, track_update_interval, evaluation_interval, state, 处理器
- **出处**：`iads/ttr_test.txt:12-32`
- **片段**：

```text
processor TEST_LARGE_SAM_BATTALION_TASK_MGR WSF_TASK_PROCESSOR
   show_task_messages
   track_update_interval 5 secs

   evaluation_interval DETECTED 5 secs
   state DETECTED
      next_state ACQUIRE
         return true;
      end_next_state
   end_state

   evaluation_interval ACQUIRE 5 secs
   state ACQUIRE
      on_entry
         StartTracking(TRACK, "TRACK", "ttr", "ACQUIRE", WsfSimulation.FindPlatform("2920_large_sam_ttr"));
      end_on_entry
      //on_exit
      //   StopTracking(TRACK, "TRACK", "ttr");
      //end_on_exit
   end_state
end_processor
```

- **演示要点**：演示 WSF_TASK_PROCESSOR 的参数：show_task_messages, track_update_interval, evaluation_interval, state

### processor · WSF_THREAT_PROCESSOR｜处理器

- **关键词**：processor, WSF_THREAT_PROCESSOR, update_interval, threat_velocity, threat_angle_spread, script, 处理器
- **出处**：`base_types/platforms/blue_adv_fighter_1_ripr.txt:95-118`
- **片段**：

```text
  processor incoming_threats WSF_THREAT_PROCESSOR
    update_interval 0.1 sec
    #update_interval 2.0 sec

    #1300 knots
    threat_velocity 668.7778 m/s
    threat_angle_spread 20.0 deg

     script void identified_new_threat(WsfTrack aTrack)
        writeln("!!! me: ", PLATFORM.Name(), ", new threat: ", aTrack.TargetName(), ", speed: ", aTrack.Speed());
     end_script

     script void dropped_threat(WsfTrack aTrack)
        if (aTrack.IsValid())
        {
           writeln("!!! ", PLATFORM.Name(), " dropped a threat: ", aTrack.TargetName());
        }
        else
        {
           writeln("!!! ", PLATFORM.Name(), " dropped a threat");
        }
     end_script

  end_processor
```

- **演示要点**：演示 WSF_THREAT_PROCESSOR 的参数：update_interval, threat_velocity, threat_angle_spread, script

### processor · WSF_EXCHANGE_PROCESSOR｜处理器

- **关键词**：processor, WSF_EXCHANGE_PROCESSOR, update_interval, commodity_and_capability_pairing, container, transactor, 处理器
- **出处**：`exchange_proc/receiver_definition.txt:15-44`　（同签名共 2 处，另见 `exchange_proc/tanker_definition.txt:15`）
- **片段**：

```text
   processor exchange_proc WSF_EXCHANGE_PROCESSOR

      #debug
      update_interval 1 sec

      # Connect a commodity name with a DIS Capability name.
      commodity_and_capability_pairing JP8_FUEL SUPPLY_FUEL

      container fuel_and_receive_tank
         commodity JP8_FUEL
           maximum_mass_quantity 8000 kg
           mass_rate 40 kg/s
         end_commodity
         initial_mass_quantity 3000 kg
      end_container

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

   end_processor
```

- **演示要点**：演示 WSF_EXCHANGE_PROCESSOR 的参数：update_interval, commodity_and_capability_pairing, container, transactor

### processor · WSF_P6DOF_GUIDANCE_COMPUTER｜处理器

- **关键词**：processor, WSF_P6DOF_GUIDANCE_COMPUTER, on, update_interval, guide_to_truth, phase, 处理器
- **出处**：`p6dof/platforms/gbu-500.txt:97-126`
- **片段**：

```text
   processor guidance WSF_P6DOF_GUIDANCE_COMPUTER
      on
      
      update_interval 0.01 sec
      guide_to_truth  true

      phase BALLISTIC
         time_constant                   0 sec
         proportional_navigation_gain    0
         velocity_pursuit_gain           0
         g_bias                          0
         next_phase MIDCOURSE when phase_time > 15 s
      end_phase

      phase MIDCOURSE
         time_constant                   0.1 sec
         proportional_navigation_gain    6
         velocity_pursuit_gain           5
         g_bias                          0.5
         next_phase TERMINAL when range_to_intercept < 2 nm
      end_phase

      phase TERMINAL
         time_constant                   0.01 sec
         proportional_navigation_gain    8
         velocity_pursuit_gain           6
         g_bias                          0.4
      end_phase

   end_processor
```

- **演示要点**：演示 WSF_P6DOF_GUIDANCE_COMPUTER 的参数：on, update_interval, guide_to_truth, phase

### processor · WSF_SIX_DOF_GUIDANCE_COMPUTER｜处理器

- **关键词**：processor, WSF_SIX_DOF_GUIDANCE_COMPUTER, on, update_interval, guide_to_truth, phase, 处理器
- **出处**：`six_dof/platforms/gbu-500.txt:123-152`
- **片段**：

```text
   processor guidance WSF_SIX_DOF_GUIDANCE_COMPUTER
      on
      
      update_interval 0.01 sec
      guide_to_truth  true

      phase BALLISTIC
         time_constant                   0 sec
         proportional_navigation_gain    0
         velocity_pursuit_gain           0
         g_bias                          0
         next_phase MIDCOURSE when phase_time > 15 s
      end_phase

      phase MIDCOURSE
         time_constant                   0.1 sec
         proportional_navigation_gain    6
         velocity_pursuit_gain           5
         g_bias                          0.5
         next_phase TERMINAL when range_to_intercept < 2 nm
      end_phase

      phase TERMINAL
         time_constant                   0.01 sec
         proportional_navigation_gain    8
         velocity_pursuit_gain           6
         g_bias                          0.4
      end_phase

   end_processor
```

- **演示要点**：演示 WSF_SIX_DOF_GUIDANCE_COMPUTER 的参数：on, update_interval, guide_to_truth, phase

### processor · WSF_SCRIPT_PROCESSOR｜处理器

- **关键词**：processor, WSF_SCRIPT_PROCESSOR, on, update_interval, script_variables, on_update, 处理器
- **出处**：`p6dof/platforms/agm-mrc.txt:101-131`　（同签名共 2 处，另见 `six_dof/platforms/agm-mrc.txt:192`）
- **片段**：

```text
   processor range_to_tgt WSF_SCRIPT_PROCESSOR
      on      
      update_interval 10 sec
      
      script_variables
         double activationRange_m = 5000.0;
      end_script_variables
      
      on_update
      
         WsfTrack trk = PLATFORM.CurrentTargetTrack();
         if( trk.IsValid() )
         {
            if( !trk.IsNull() ) 
            {
               double rng = PLATFORM.SlantRangeTo(trk);
               if( rng < activationRange_m )
               {
                  PLATFORM.Processor("pitchup").TurnOn();
                  PLATFORM.Processor("range_to_tgt").TurnOff();
               }
            }
         }
         else
         {
            writeln("No current target exists!!!");
         }

      end_on_update
      
   end_processor
```

- **演示要点**：演示 WSF_SCRIPT_PROCESSOR 的参数：on, update_interval, script_variables, on_update

### processor · WSF_QUANTUM_TASKER_PROCESSOR｜处理器

- **关键词**：processor, WSF_QUANTUM_TASKER_PROCESSOR, script_debug_writes, update_interval, script_variables, on_message, 处理器
- **出处**：`behavior_tree/platforms/run_tree_striker.txt:86-120`
- **片段**：

```text
   processor  task_mgr  WSF_QUANTUM_TASKER_PROCESSOR
      script_debug_writes  off
      update_interval 5 sec
      
      script_variables
         int mLeftDragCount = 0;
         int mRightDragCount = 0;
      end_script_variables
      
      on_message 
         type WSF_CONTROL_MESSAGE
            script
               WsfControlMessage controlMsg = (WsfControlMessage)MESSAGE;
               if (controlMsg.Function() == "pincer" &&
                   controlMsg.Resource() == "drag")
               {
                  int adjust = 1;
                  if (controlMsg.AuxDataBool("dragging") == false)
                  {
                     adjust = -1;
                  }
                  if (controlMsg.AuxDataString("side") == "left")
                  {
                     mLeftDragCount += adjust;
                  }
                  else //if (controlMsg.AuxDataString("side") == "right")
                  {
                     mRightDragCount += adjust;
                  }
               }
               writeln_d("T=", TIME_NOW, " Received control, function: ", controlMsg.Function(), ", resources: ", controlMsg.Resource());
            end_script
      end_on_message
            
   end_processor
```

- **演示要点**：演示 WSF_QUANTUM_TASKER_PROCESSOR 的参数：script_debug_writes, update_interval, script_variables, on_message

### processor · WSF_SCRIPT_PROCESSOR｜处理器

- **关键词**：processor, WSF_SCRIPT_PROCESSOR, off, update_interval, script_variables, on_update, 处理器
- **出处**：`six_dof/platforms/orbiter-main.txt:34-72`　（同签名共 3 处，另见 `six_dof/platforms/agm-mrc.txt:225`、`p6dof/platforms/agm-mrc.txt:134`）
- **片段**：

```text
   processor orbit-maintenance WSF_SCRIPT_PROCESSOR
      off
      
      update_interval 1 sec
      
      script_variables
         double lastVerticalSpeed = 0.0;
         double lastTime = 0.0;
      end_script_variables
      
      on_update
         WsfSixDOF_Mover mover = (WsfSixDOF_Mover) PLATFORM.Mover();
         
         double currentVerticalSpeed = mover.GetVerticalSpeed();
         double currentTime = TIME_NOW;
         
         double deltaVerticalSpeed = currentVerticalSpeed - lastVerticalSpeed;
         double deltaTime = currentTime - lastTime;
         
         double altitudeAccel = deltaVerticalSpeed / deltaTime;
         double commandedThrottle = 0.05 + Math.Max(0.0, -1.0 * altitudeAccel);
         
         mover.SetAutopilotThrottle(commandedThrottle);
         
         if (mover.GetTotalFuelRemaining() < 200.0)
         {         
            mover.SetAutopilotPitchRate(-0.002);
         }
         else
         {
            mover.SetAutopilotAltitude(400000.0);
         }
         
         lastVerticalSpeed = currentVerticalSpeed;
         lastTime = currentTime;
         
      end_on_update
   
   end_processor
```

- **演示要点**：演示 WSF_SCRIPT_PROCESSOR 的参数：off, update_interval, script_variables, on_update

### processor · WSF_SCRIPT_PROCESSOR｜处理器

- **关键词**：processor, WSF_SCRIPT_PROCESSOR, script_variables, on_initialize, update_interval, on_update, 处理器
- **出处**：`ballistic/processors/launch_weapon_processor.txt:17-56`　（同签名共 4 处，另见 `ballistic_missile_shootdown/processors/launch_ssm_processor.txt:17`、`orwaca_iads/processors/launch_tbm_processor.txt:10`、`base_types/processors/ep_operations.txt:23`）
- **片段**：

```text
processor LAUNCH_WEAPON_PROCESSOR WSF_SCRIPT_PROCESSOR
   script_variables
      string WEAPON_NAME = " ";  # this is set in the platform_type definition
      double TIME_TO_LAUNCH = 0;  #if scenario doesn't give time, it will fire first pass
      bool LAUNCH_RANDOM    = 0;  # Default is not to fire at a random time
      double MIN_TIME       = 10.0; # Minumum time a missile can launch
      double MAX_TIME    = 1000.0; # Max time a missile can launch
      int trackIndex     = 0;   # Don't change this; used internally
   end_script_variables

   on_initialize
      // This will overide any static set launch time...
      if (LAUNCH_RANDOM == 1)
          TIME_TO_LAUNCH = RANDOM.Uniform(MIN_TIME, MAX_TIME);
   end_on_initialize

   update_interval 10.0 sec # how often to run the on_update script
   on_update
      if (TIME_NOW > TIME_TO_LAUNCH)
         {
         WsfLocalTrackList trackList = PLATFORM.MasterTrackList();
         WsfWeapon tbm = PLATFORM.Weapon(WEAPON_NAME);
         if ((PLATFORM.WeaponCount() > 0) && (trackIndex < trackList.TrackCount()))
            {
            if (tbm.IsValid() && (tbm.QuantityRemaining() > 0))
               {
               tbm.CueToTarget(trackList.TrackEntry(trackIndex));
               writeln(TIME_NOW, " Fired ", WEAPON_NAME);
               tbm.Fire(trackList.TrackEntry(trackIndex));
               trackIndex = trackIndex + 1;
               }
            }
          else
            {
             writeln(TIME_NOW, " Turning launch processor off for ", PLATFORM.Name());
             PROCESSOR.TurnOff(); # no weapons or targets left
            }
         }
   end_on_update
end_processor
```

- **演示要点**：演示 WSF_SCRIPT_PROCESSOR 的参数：script_variables, on_initialize, update_interval, on_update

### processor · WSF_GUIDANCE_COMPUTER｜处理器

- **关键词**：processor, WSF_GUIDANCE_COMPUTER, guide_to_truth, phase, maximum_commanded_g, g_bias, 处理器
- **出处**：`orwaca_iads/weapons/sam/sr_sam.txt:73-115`　（同签名共 2 处，另见 `cyber/weapons/sam/sr_sam.txt:74`）
- **片段**：

```text
processor SR_SAM_AUTOPILOT WSF_GUIDANCE_COMPUTER
   #show_status
   guide_to_truth true
   #show_evaluations

   phase LAUNCH_AND_PITCH_OVER
      on_entry
         WsfTrack targetTrack = PLATFORM.CurrentTargetTrack();
         double targetSlantRange = PLATFORM.SlantRangeTo(targetTrack);
	     if (targetSlantRange < 7408)
	     {
	        SelectPhase("SHORT_RANGE");
	     }
      end_on_entry
      maximum_commanded_g 35 g
      commanded_flight_path_angle   45 deg
      next_phase MIDCOURSE when on_commanded_flight_path_angle
   end_phase

   phase SHORT_RANGE
      maximum_commanded_g 40 g
      commanded_flight_path_angle   20 deg
      next_phase MIDCOURSE when on_commanded_flight_path_angle
   end_phase

   phase MIDCOURSE
      #on_entry
      #   //SetDebugEnabled(true);
      #end_on_entry
	  maximum_commanded_g 35 g
      proportional_navigation_gain  4.0
	  g_bias 1.1
      next_phase TERMINAL when target_ground_range < 4 km
   end_phase

   phase TERMINAL
      #on_entry
      #   #SetDebugEnabled(true);
      #end_on_entry
	  maximum_commanded_g 40 g
      proportional_navigation_gain  4.0
   end_phase
end_processor
```

- **演示要点**：演示 WSF_GUIDANCE_COMPUTER 的参数：guide_to_truth, phase, maximum_commanded_g, g_bias

### processor · WSF_QUANTUM_TASKER_PROCESSOR｜处理器

- **关键词**：processor, WSF_QUANTUM_TASKER_PROCESSOR, update_interval, script_debug_writes, script_variables, behavior_tree, 处理器
- **出处**：`timeline/processors/quantum_agents/aiai/ai_quantum_tasker.txt:21-68`　（同签名共 3 处，另见 `behavior_tree/processors/quantum_agents/aiai/ai_quantum_tasker.txt:15`、`base_types/processors/quantum_agents/aiai/ai_quantum_tasker.txt:22`）
- **片段**：

```text
processor AI_QUANTUM_TASKER WSF_QUANTUM_TASKER_PROCESSOR

   update_interval 2.0 sec
   script_debug_writes off
  #show_task_messages

   script_variables

      // the interceptor uses these threat priority pairs to determine who is the most important threat of concern
      Map<string, double> ThreatTypePriority = Map<string, double>();
      ThreatTypePriority["unknown"]      =     0.0;
      ThreatTypePriority["uav"]          =     2.0;
      ThreatTypePriority["sam"]          =     4.0;
      ThreatTypePriority["ship"]         =     4.0;
      ThreatTypePriority["awacs"]        =  -500.0;
      ThreatTypePriority["bomber"]       =     2.0;
      ThreatTypePriority["jammer"]       =     0.0;
      ThreatTypePriority["fighter"]      =    10.0;
      ThreatTypePriority["missile"]      =     9.0;
      ThreatTypePriority["missile_fast"] =     9.0;   // try new category for cmd

      bool   mAllowCoopEngage = false;
      string mUplinkSensorName  = "geo_sensor";  //name of sensor object
   end_script_variables

   behavior_tree
#     selector
#        behavior_node  evade
#        behavior_node  go_home
#        behavior_node  escort
#        behavior_node  cap-route
#        behavior_node  pincer
#        sequence
            selector
               behavior_node  pursue_weapon_task_target
#              behavior_node  sar_job
#              behavior_node  pursue-point
               behavior_node  planned_route
            end_selector
#           behavior_node  guide_weapons
#        end_sequence
#     end_selector
      behavior_node  engage_weapon_task_target
#     behavior_node  radar-control
#     behavior_node  weapon-uplink
   end_behavior_tree

end_processor
```

- **演示要点**：演示 WSF_QUANTUM_TASKER_PROCESSOR 的参数：update_interval, script_debug_writes, script_variables, behavior_tree

### processor · WSF_TASK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TASK_PROCESSOR, on, evaluation_interval, state, script, 处理器
- **出处**：`air_to_air/processors/hvaa_tasker.txt:12-70`
- **片段**：

```text
processor HVAA_TASKER WSF_TASK_PROCESSOR 
   on 
   evaluation_interval DETECTED 1 sec
   state DETECTED
      next_state ASSIGNED
#         writeln("HERE1 ", TRACK.IsValid()," ",TRACK.TimeSinceUpdated()," ",TRACK.LocationValid()," ",TRACK.VelocityValid()
#         ," ",PLATFORM.SlantRangeTo(TRACK)*MATH.NM_PER_M());
         if (TRACK.IsValid() && TRACK.TimeSinceUpdated() < 30.0 && TRACK.LocationValid() && TRACK.VelocityValid()
         && PLATFORM.SlantRangeTo(TRACK) <= 200.0*MATH.M_PER_NM())
         {
            foreach (WsfPlatform sub in PLATFORM.Subordinates())
            {
               if (sub.Name() == sub.CommanderName("IFLITE") && PROCESSOR.TasksAssignedTo(sub) == 0)
               {
                  bool test = PROCESSOR.AssignTask(TRACK,"INTERCEPT",sub);
                  if (test)
                  {
                     writeln(PLATFORM.Name()," Assigned INTERCEPT task to ",sub.Name()," for Track ",
                             TRACK.TargetName()," at time ",TIME_NOW);
                     // assign the same task to everyone in my iflite
                     foreach (WsfPlatform ssub in sub.Subordinates("IFLITE"))
                     {
                        if (ssub.CategoryMemberOf("missile")) {continue;} // skip missiles
                        WsfTaskProcessor sub_tsk_mgr = sub->tsk_mgr;
                        sub_tsk_mgr.AssignTask(TRACK,"INTERCEPT",ssub);
                     }
                  }
                  else
                  {
                     writeln("FAILED TO ASSIGN TASK");
                  }
                  return test;
               }
            }
         }
         return false;
      end_next_state
   end_state

   evaluation_interval ASSIGNED 1 sec
   state ASSIGNED
      next_state DETECTED
         if (TRACK.IsValid() && TRACK.TimeSinceUpdated() < 10.0)
         {
            if (PROCESSOR.TasksAssignedFor(TRACK.TrackId()) > 0)
            {
               return false;
            }
            return true;
         }
         return false;
      end_next_state
   end_state

   script void on_task_complete(WsfTask tsk)
      PROCESSOR.CancelTask(tsk.TrackId());
   end_script

end_processor
```

- **演示要点**：演示 WSF_TASK_PROCESSOR 的参数：on, evaluation_interval, state, script

### processor · WSF_SCRIPT_PROCESSOR｜处理器

- **关键词**：processor, WSF_SCRIPT_PROCESSOR, update_interval, on, on_initialize, on_update, 处理器
- **出处**：`six_dof/pm6_missile_comparison.txt:297-364`　（同签名共 5 处，另见 `six_dof/rb6_missile_comparison.txt:297`、`p6dof/missile_comparison.txt:114`、`six_dof/pm6_missile_comparison.txt:133`）
- **片段**：

```text
   processor pilot-thinker WSF_SCRIPT_PROCESSOR
     update_interval 1.5 sec

     on

     on_initialize
       WsfSensor seeker = PLATFORM.SensorEntry(0);
       seeker.TurnOn();
     end_on_initialize

     on_update
         WsfLocalTrackList trackList = PLATFORM.MasterTrackList();
         WsfLocalTrack     currentTgtTrack;
         int numTracks = trackList.TrackCount();
         
         # Find the nearest threat
         double nearestThreatDistance_m = 10000000;
         foreach (WsfLocalTrack trk in trackList)
         {
            if (trk.Range() < nearestThreatDistance_m)
            {         
               # Don't worry about targets we're already engaging
               if (PLATFORM.WeaponsActiveFor(trk.TrackId()) == 0)
               {
                  WsfPlatform target = trk.Target();
            
                  if (target.IsValid() &&
                      target.Side().Lower() == "red" &&
                      target.SpatialDomain().Lower() == "air")
                  {
                     PLATFORM.SetCurrentTarget(trk);
                     nearestThreatDistance_m = trk.Range();
                  }
               }
            }
         }
            
         # If the target is close enough, fire SR AAM
         WsfTrack trk = PLATFORM.CurrentTargetTrack();
         if(trk.IsValid())
         {
            # Only fire if we have no other missiles tracking
            if (PLATFORM.WeaponsActiveFor(trk.TrackId()) == 0)
            {
               WsfPlatform target = trk.Target();
               if (target.IsValid())
               {
                  double range_m = trk.Range();

                  if (range_m < 15000.0)
                  {
                     # Launch the SDM missile
                     WsfWeapon weapon_sr = PLATFORM.Weapon("sr-sdm");
                     
                     if (weapon_sr.IsValid() && weapon_sr.QuantityRemaining() > 0)
                     {
                        weapon_sr.Fire(trk);
                        writeln("T+", (string) TIME_NOW, ": FOX TWO (", weapon_sr.Name(), " vs ", target.Name(), ")");
                        
                        PLATFORM.TurnToHeading(0.0);
                        PLATFORM.GoToAltitude(10000.0 * MATH.M_PER_FT());
                     }
                  }
               }
            }       
         }
     end_on_update
   end_processor
```

- **演示要点**：演示 WSF_SCRIPT_PROCESSOR 的参数：update_interval, on, on_initialize, on_update

### processor · WSF_STATE_MACHINE｜处理器

- **关键词**：processor, WSF_STATE_MACHINE, update_interval, script_variables, state, on_update, 处理器
- **出处**：`behavior_tree/platforms/state_machine_striker.txt:46-121`
- **片段**：

```text
   processor task_mgr WSF_STATE_MACHINE
      update_interval 5 sec
   
      script_variables
         string currentState = "checkpoints_blue";
      end_script_variables
   
      state checkpoints_blue
         next_state checkpoints_green         
            if (PLATFORM.GroundRangeTo(WsfSimulation.FindPlatform("Blue_checkpoint_2")) < 10000)
            {
               currentState = "checkpoints_green";
               return true;
            }
            return false;
         end_next_state
         
         next_state checkpoints_blue
            return true;
         end_next_state
         
         advanced_behavior_tree
            btt on
            sequence
               behavior_node blue_checkpoint_1
               behavior_node blue_checkpoint_2
            end_sequence
         end_advanced_behavior_tree
      end_state
      
      state checkpoints_green
         next_state checkpoints_red
            if (PLATFORM.GroundRangeTo(WsfSimulation.FindPlatform("Green_checkpoint_3")) < 10000)
            {
               currentState = "checkpoints_red";
               return true;
            }
            return false;
         end_next_state
      
         next_state checkpoints_green
            return true;
         end_next_state
         
         advanced_behavior_tree
            btt on
            sequence
               behavior_node green_checkpoint_1
               behavior_node green_checkpoint_2
               behavior_node green_checkpoint_3
            end_sequence
         end_advanced_behavior_tree
      end_state
      
      state checkpoints_red
         next_state checkpoints_red
            return true;
         end_next_state
         
         advanced_behavior_tree
            btt on
            sequence
               behavior_node red_checkpoint_1
               behavior_node red_checkpoint_2
               behavior_node red_checkpoint_3
               behavior_node red_checkpoint_4
            end_sequence
         end_advanced_behavior_tree
      end_state
      
      on_update

      
            currentState = STATE_MACHINE.Evaluate(currentState);
      end_on_update
   end_processor
```

- **演示要点**：演示 WSF_STATE_MACHINE 的参数：update_interval, script_variables, state, on_update

### processor · WSF_SCRIPT_PROCESSOR｜处理器

- **关键词**：processor, WSF_SCRIPT_PROCESSOR, update_interval, script, execute, on_update, 处理器
- **出处**：`satellite_demos/platforms/iridium.txt:201-287`
- **片段**：

```text
   processor dynamic-link-processor WSF_SCRIPT_PROCESSOR

      update_interval 1 min
      
      script void InitIridiumComms()
         // set up the links that don't change (links with adjacent satellites in same plane).
         WsfComm comm = PLATFORM.Comm("iridium_crosslink");
         string netName = comm.NetworkName();
         mSatelliteNumber = SatelliteNumber(netName);
         mOrbitNumber = OrbitNumber(netName);
         bool isEvenOrbit = (Math.Mod(mOrbitNumber, 2) == 0);

         if (mOrbitNumber != sFIRST_ORBIT)
         {
            if (isEvenOrbit)
            {
               if (mSatelliteNumber != sLAST_SATELLITE)
               {
                  mNorthwardUpperLeftLink = "iridium" + (string)(mOrbitNumber - 1) + (string)(mSatelliteNumber + 1);
               }
               else
               {
                  mNorthwardUpperLeftLink = "iridium" + (string)(mOrbitNumber - 1) + (string)(sFIRST_SATELLITE);
               }
               mSouthwardUpperLeftLink = "iridium" + (string)(mOrbitNumber - 1) + (string)(mSatelliteNumber);
            }
            else // odd orbit
            {
               mNorthwardUpperLeftLink = "iridium" + (string)(mOrbitNumber - 1) + (string)(mSatelliteNumber);
               if (mSatelliteNumber != sFIRST_SATELLITE)
               {
                  mSouthwardUpperLeftLink = "iridium" + (string)(mOrbitNumber - 1) + (string)(mSatelliteNumber - 1);
               }
               else
               {
                  mSouthwardUpperLeftLink = "iridium" + (string)(mOrbitNumber - 1) + (string)(sLAST_SATELLITE);
               }
            }
         }
         if (mOrbitNumber != sLAST_ORBIT)
         {
            if (isEvenOrbit)
            {
               mNorthwardLowerRightLink = "iridium" + (string)(mOrbitNumber + 1) + (string)(mSatelliteNumber);
               if (mSatelliteNumber != sLAST_SATELLITE)
               {
                  mSouthwardLowerRightLink = "iridium" + (string)(mOrbitNumber + 1) + (string)(mSatelliteNumber + 1);
               }
               else
               {
                  mSouthwardLowerRightLink = "iridium" + (string)(mOrbitNumber + 1) + (string)(sFIRST_SATELLITE);
               }
            }
            else // odd orbit
            {
               if (mSatelliteNumber != sFIRST_SATELLITE)
               {
                  mNorthwardLowerRightLink = "iridium" + (string)(mOrbitNumber + 1) + (string)(mSatelliteNumber - 1);
               }
               else
               {
                  mNorthwardLowerRightLink = "iridium" + (string)(mOrbitNumber + 1) + (string)(sLAST_SATELLITE);
               }
               mSouthwardLowerRightLink = "iridium" + (string)(mOrbitNumber + 1) + (string)(mSatelliteNumber);
            }
         }
         Vec3 velWCS = PLATFORM.VelocityWCS();
         mIsTravelingNorth = (velWCS.Z() > 0.0);
         mWasTravelingNorth = mIsTravelingNorth;
      end_script

      // Goofy! Gateways are not added until 0.01 seconds, so we have to wait longer to do any dynamic routing...
      // todo bug
      execute at_time 0.02 s absolute
         AddStaticConnections();
         UpdateLinks();
      end_execute

      on_update
         UpdateTravelDirection();
         if (mIsTravelingNorth != mWasTravelingNorth)
         {
            UpdateLinks();
         }
      end_on_update

   end_processor
```

- **演示要点**：演示 WSF_SCRIPT_PROCESSOR 的参数：update_interval, script, execute, on_update

### processor · WSF_TASK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TASK_PROCESSOR, script_variables, script, evaluation_interval, state, 处理器
- **出处**：`alv_routing/weapons/alv_weapon.txt:39-127`　（同签名共 14 处，另见 `satellite_demos/scenarios/gps_denied.txt:313`、`script_demos/script_demo_5.txt:193`、`script_demos/script_demo_6.txt:192`）
- **片段**：

```text
processor ALV_LAUNCH_COMPUTER WSF_TASK_PROCESSOR
#   script_debug_writes on
#   show_state_transitions
#   show_task_messages

   script_variables
      string WEAPON_NAME        = "alv";
      int SALVO_SIZE            = 1;
      # the following variable is used internally and should not be modified by the user
      string mShootTaskStr      = "Shoot";
   end_script_variables

    script bool InInterceptEnvelopeOf(WsfWeapon aWeapon)
       bool canIntercept = false;
       double maxRng = 555600; # 300 nm
       double minRng = 300;
       WsfTrackId id = TRACK.TrackId();
       double targetrange = PLATFORM.GroundRangeTo(TRACK);
       if ((targetrange > minRng) && (targetrange < maxRng))
       {
         canIntercept = true;
         writeln_d("Target is in range to intercept");
       }
       return canIntercept;
   end_script

   script bool HaveWeapons()
      WsfWeapon weapon = PLATFORM.Weapon(WEAPON_NAME);
      bool haveWeapons = false;
      if (weapon.QuantityRemaining() >= SALVO_SIZE)
      {
          haveWeapons = true;
      }
      return haveWeapons;
   end_script

   script bool LaunchWeapon()
      WsfWeapon   weapon;
      weapon = PLATFORM.Weapon(WEAPON_NAME);
      bool canInterceptNow = false;
      if (HaveWeapons())
      {
         canInterceptNow = InInterceptEnvelopeOf(weapon);
      }
      bool launched = false;
      if (canInterceptNow)
      {
         launched = FireAt(TRACK, mShootTaskStr, weapon, SALVO_SIZE);
         if (launched)
         {
            writeln("*** T=", TIME_NOW, " ", PLATFORM.Name(), " ",
                    TRACK.TargetName(), " R=", PLATFORM.SlantRangeTo(TRACK),
                    " FIRE!!!!");
         }
      }
      return launched;
   end_script


  # State Machine
  # Very simple state machine
  evaluation_interval GOHOME 2.0 sec
  state GOHOME  # Goes back to Loiter if out of weapons
      next_state ENGAGE
         bool weaponavail = true;
         if (! HaveWeapons())
         {
             weaponavail = false;
             PLATFORM.ReturnToRoute();
             writeln_d("Turning off launch computer");
             PROCESSOR.TurnOff();
         }
         return weaponavail;
      end_next_state
   end_state

   evaluation_interval ENGAGE 2.0 sec
   state ENGAGE  # Engages and fires the weapon if it can
      next_state GOHOME
         bool launched = false;
         if (InInterceptEnvelopeOf(PLATFORM.Weapon(WEAPON_NAME)))
         {
             writeln_d("Trying to launch weapon " );
             launched = LaunchWeapon();
         }
         return launched;
      end_next_state
   end_state
end_processor
```

- **演示要点**：演示 WSF_TASK_PROCESSOR 的参数：script_variables, script, evaluation_interval, state

### processor · WSF_SCRIPT_PROCESSOR｜处理器

- **关键词**：processor, WSF_SCRIPT_PROCESSOR, script_variables, on_initialize2, script, on_message, 处理器
- **出处**：`space_operations/processors/linkable_targets_processor.txt:20-113`
- **片段**：

```text
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

- **演示要点**：演示 WSF_SCRIPT_PROCESSOR 的参数：script_variables, on_initialize2, script, on_message

### processor · WSF_SCRIPT_PROCESSOR｜处理器

- **关键词**：processor, WSF_SCRIPT_PROCESSOR, on, script, update_interval, on_update, 处理器
- **出处**：`six_dof/pm6_unguided_rocket_test.txt:69-176`　（同签名共 3 处，另见 `six_dof/rb6_unguided_rocket_test.txt:71`、`p6dof/unguided_rocket_test.txt:71`）
- **片段**：

```text
   processor script-proc WSF_SCRIPT_PROCESSOR
      
      on

      script void Dive()
         WsfSixDOF_Mover mover = (WsfSixDOF_Mover)PLATFORM.Mover();
         if(!mover.IsNull())
         {
            mover.SetPitchGLoad(0.0); 
         }
      end_script

      script void PullG(double numG)
         WsfSixDOF_Mover mover = (WsfSixDOF_Mover)PLATFORM.Mover();
         if(!mover.IsNull())
         {
            mover.SetPitchGLoad(numG); 
         }
      end_script

      script void Pullout()
         WsfSixDOF_Mover mover = (WsfSixDOF_Mover)PLATFORM.Mover();
         if(!mover.IsNull())
         {
            mover.SetPitchGLoad(7.0);
            mover.SetAutopilotDeltaRoll(70.0);
         }
      end_script
      
      script void LevelOff()
         WsfSixDOF_Mover mover = (WsfSixDOF_Mover)PLATFORM.Mover();
         if(!mover.IsNull())
         {
            mover.SetAutopilotVerticalSpeed(5000.0); 
            mover.SetAutopilotRollAngle(0.0); 
         }
      end_script
      
      update_interval 0.2 sec
      
      on_update
         if( (TIME_NOW > 4.0) && !diveInitiated )
         {
            writeln("Begin dive...");
            Dive();
            diveInitiated = true;
         }
         
         if( diveInitiated && !steadyDive)
         {
            double pitch_deg = PLATFORM.Pitch();
            if( pitch_deg < -20.0 )
            {
               writeln("Steady the dive...");
               steadyDive = true;
               PullG(1.0);
            }
         }
         
         if( steadyDive && !triggerPulled)
         {
            if( PLATFORM.Altitude() < 1500 )
            {
               writeln("Pull the trigger...");
               triggerPulled = true;
            }
         }

         if( triggerPulled && !noAmmo)
         {
            WsfWeapon lftPod = PLATFORM.Weapon("unguided_rocket_pods_lft");
            WsfWeapon rgtPod = PLATFORM.Weapon("unguided_rocket_pods_rgt");
            
            lftPod.Fire();
            rgtPod.Fire();
            
            if( (lftPod.QuantityRemaining() < 1.0 ) &&
                (rgtPod.QuantityRemaining() < 1.0 ) )
            {
               writeln("Out of ammo...");
               noAmmo = true;
               // Wait 1 second to pullout
               timeToPullout = TIME_NOW + 1.0;
            }
         }

         if( noAmmo && !pulloutInitiated )
         {
            if( TIME_NOW >= timeToPullout)
            {
               writeln("Pull out...");
               pulloutInitiated = true;
               Pullout();
            }         
         }
         
         if( pulloutInitiated && !leveloffInitiated )
         {
            if( PLATFORM.Heading() > 170.0 )
            {
               writeln("Level off ...");
               leveloffInitiated = true;
               LevelOff();
            }
         }
         
      end_on_update
   end_processor
```

- **演示要点**：演示 WSF_SCRIPT_PROCESSOR 的参数：on, script, update_interval, on_update

### processor · WSF_TASK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TASK_PROCESSOR, script_debug_writes, script, evaluation_interval, state, 处理器
- **出处**：`electronic_warfare/agile_repeater_jamming-rt1.txt:111-223`　（同签名共 6 处，另见 `electronic_warfare/agile_repeater_jamming-rt2.txt:111`、`electronic_warfare/air-to-air-rt1.txt:110`、`electronic_warfare/air-to-air-rt2.txt:110`）
- **片段**：

```text
processor JAMMER_TASK_MGR WSF_TASK_PROCESSOR

   script_debug_writes on
   #show_state_transitions
   #show_task_messages

   # Script to select a jammer and add a spot
   script bool AddSpot()
      bool startedJamming = false;
      for (int i=0; i < PLATFORM.WeaponCount(); i = i+1)
      {
         int tasksAssigned = TasksAssignedFor(TRACK.TrackId(), "Jam");
         WsfWeapon jammer = PLATFORM.WeaponEntry(i);
         writeln_d("TrackId=", TRACK.TrackId());
         writeln_d("RawTrackId=", TRACK.RawTrackId(0));
         if (PLATFORM.WithinFieldOfView(TRACK, jammer.Name()))
         {
            writeln_d("SignalFreq=", TRACK.Frequency());
            if (StartJamming(TRACK, "Jam", jammer, "false_target_jamming"))
            {
               writeln_d("T=", TIME_NOW, " ", PLATFORM.Name(), ":",
                         jammer.Name(), " started jamming ", TRACK.TargetName());
               writeln_d("Previous Tasks Assigned=", tasksAssigned,
                         " Tasks assigned=", TasksAssignedFor(TRACK.TrackId(), "Jam"));
               if (TasksAssignedFor(TRACK.TrackId(), "Jam") > tasksAssigned)
               {
                  startedJamming = true;
                  break;
               }
            }
            else
            {
               writeln_d("T=", TIME_NOW, " ", PLATFORM.Name(), ":",
                         jammer.Name(), " FAILED started jamming ", TRACK.TargetName());
            }
         }
      }
      return startedJamming;
   end_script

   # script to determine if platform can still jam emitter with current jammer
   script bool HadToStopJamming()
      bool stoppedJamming = false;
      bool cancelledTasks = true;
      WsfTaskList taskList = AssignedTaskList(TRACK.TrackId(),"Jam");
      foreach(WsfTask task in taskList)
      {
         if (task.ResourceIsJammer())
         {
            string reason = "UNKNOWN";
            bool needToStopJamming = true;
            if (PLATFORM.WithinFieldOfView(TRACK, task.ResourceName()))
            {
               if (TRACK.FrequencyValid())
               {
                  needToStopJamming = false;
                  break;
               }

               if (needToStopJamming)
               {
                  reason = "frequency invalid";
               }
            }
            else
            {
              reason = "FOV limits";
            }

            if (needToStopJamming)
            {
               cancelledTasks = (cancelledTasks && CancelTask(task.TrackId(), task.TaskType()));
               if (cancelledTasks)
               {
                  writeln_d("T=", TIME_NOW, " ", PLATFORM.Name(), ":", task.ResourceName(), " stopped jamming ",
                            TRACK.TargetName(), ", task=", task.TaskType()," freq=", task.ResourceFrequency(),
                            " due to ", reason);
               }
               stoppedJamming = true;
            }
         }
      }
      return (stoppedJamming && cancelledTasks);
   end_script

   # -------------------------------------------------------------------------

   evaluation_interval DETECTED 5.0 sec
   state DETECTED
      next_state CAN_JAM
         return (TRACK.TimeSinceUpdated() < 10.0);
      end_next_state
   end_state

   evaluation_interval CAN_JAM 5.0 sec
   state CAN_JAM
      next_state DETECTED
         return (TRACK.TimeSinceUpdated() > 10.0);
      end_next_state

      next_state IS_JAMMING
         return AddSpot();
      end_next_state
   end_state

   evaluation_interval IS_JAMMING 5.0 sec
   state IS_JAMMING
      next_state CAN_JAM
         return HadToStopJamming();
      end_next_state
   end_state

end_processor
```

- **演示要点**：演示 WSF_TASK_PROCESSOR 的参数：script_debug_writes, script, evaluation_interval, state

### processor · WSF_QUANTUM_TASKER_PROCESSOR｜处理器

- **关键词**：processor, WSF_QUANTUM_TASKER_PROCESSOR, script_debug_writes, update_interval, script_variables, state, 处理器
- **出处**：`base_types/processors/timeline_agents/timeline_flyer_proc.txt:23-197`
- **片段**：

```text
processor  TIMELINE_FLYER_PROC  WSF_QUANTUM_TASKER_PROCESSOR
  #show_task_messages
   script_debug_writes  off
   update_interval 5 sec

   script_variables
      bool stallForSupport = true;
      WsfDraw draw = WsfDraw();
   end_script_variables


   state COMMIT   #should this be "SEARCH" or "MISSION"? meh...
      on_entry
         PLATFORM.Comment("COMMIT");
      end_on_entry
      behavior_tree
         selector
            behavior_node  evade   #YES, evade will likely be in every state
            behavior_node  planned_route
         end_selector
      end_behavior_tree
      next_state APPROACH
#         #NAC+ at this point the fighter has committed to the target and received a timeline?
#         double curDist = GetTargetDistance(PLATFORM, PROCESSOR);
#         string distStr = (string)curDist;
#        #string distStr = (string)tgtDist;
#         string timelineStr = "COMMIT " + distStr;
#         PLATFORM.Comment(timelineStr);
#         double timelineVal = GetTimeLineValueForKey(PROCESSOR,"FSR");
#         writeln_d("timelineVal = ", timelineVal);
#         if (curDist != -1 && curDist <= GetTimeLineValueForKey(PROCESSOR,"FSR"))
#         {
#            return true;
#         }
         return GetTimelineTask(PROCESSOR).IsValid();
      end_next_state
   end_state


   state APPROACH
      on_entry
         PLATFORM.Comment("APPROACH");
      end_on_entry
      behavior_tree
         selector
            behavior_node  evade
	         behavior_node  fly_timeline
         end_selector
      end_behavior_tree
      next_state SHOOT_MANEUVER
         #Engage(PLATFORM, GetNearestTimelineTarget(PLATFORM, PROCESSOR));
         double curDist = GetTargetDistance(PLATFORM, PROCESSOR);
#         string distStr = (string)curDist;
#         string timelineStr = "APPROACH " + distStr;
#         PLATFORM.Comment(timelineStr);
         if (curDist != -1 && curDist <= GetTimeLineValueForKey(PROCESSOR,"DOR") && !stallForSupport)
         {
            #Take the shot
            WsfTrack targetTrack = GetNearestTimelineTarget(PLATFORM, PROCESSOR);
            if (targetTrack.IsValid() && PLATFORM.WeaponCount() > 0)
            {
               WsfWeapon myWeap = PLATFORM.WeaponEntry(0);
               if (myWeap.IsValid())
               {
                  myWeap.Fire(targetTrack);
                  PLATFORM.Comment("Fired Shot!");
               }
            }
            return true;
         }
         return false;
      end_next_state
      #NAC+ : Branch state here to maneuver if outside of OSR and need to slow down engagement or do something else
      next_state DELAY_MANEUVER
         double curDist = GetTargetDistance(PLATFORM, PROCESSOR);
#         string distStr = (string)curDist;
#         string timelineStr = "APPROACH delay" + distStr;
#         PLATFORM.Comment(timelineStr);
         if (curDist != -1 && curDist <= GetTimeLineValueForKey(PROCESSOR,"DOR") && stallForSupport)
         {
            #perform a delaying maneuver
            return true;
         }
         return false;
      end_next_state
   end_state


   state SHOOT_MANEUVER
      on_entry
         PLATFORM.Comment("SHOOT_MANEUVER");
      end_on_entry
      behavior_tree
         selector
            behavior_node  evade
	         behavior_node  fly_timeline
            behavior_node  planned_route
         end_selector
	     #behavior_node  engage_weapon_task_target
      end_behavior_tree
      next_state FLY_TO_DOR
         #Engage(PLATFORM, GetNearestTimelineTarget(PLATFORM, PROCESSOR));
         #Beam(PLATFORM, GetNearestTimelineTarget(PLATFORM, PROCESSOR));
         #Crank(PLATFORM, GetNearestTimelineTarget(PLATFORM, PROCESSOR));
         Drag(PLATFORM, GetNearestTimelineTarget(PLATFORM, PROCESSOR));
         #PostHole(PLATFORM, "right");
         double curDist = GetTargetDistance(PLATFORM, PROCESSOR);
#         string distStr = (string)curDist;
#         string timelineStr = "Shoot Maneuver " + distStr;
#         PLATFORM.Comment(timelineStr);
         if (curDist != -1 && curDist <= GetTimeLineValueForKey(PROCESSOR,"MAR"))
         {
            return true;
         }
         return false;
      end_next_state
   end_state


   state DELAY_MANEUVER
      on_entry
         PLATFORM.Comment("DELAY_MANEUVER");
      end_on_entry
      next_state APPROACH
         #Engage(PLATFORM, GetNearestTimelineTarget(PLATFORM, PROCESSOR));
         #Beam(PLATFORM, GetNearestTimelineTarget(PLATFORM, PROCESSOR));
         #Crank(PLATFORM, GetNearestTimelineTarget(PLATFORM, PROCESSOR));
         Drag(PLATFORM, GetNearestTimelineTarget(PLATFORM, PROCESSOR));
         stallForSupport = false;
         #PostHole(PLATFORM, "right");
         #PLATFORM.Comment("Stall Maneuver!");
         return true;
      end_next_state
   end_state


   state FLY_TO_DOR
      on_entry
         PLATFORM.Comment("FLY_TO_DOR");
      end_on_entry
      behavior_tree
           #behavior_node  pursue_weapon_task_target
	         behavior_node  fly_timeline
      end_behavior_tree
      next_state GO_HOME
         double curDist = GetTargetDistance(PLATFORM, PROCESSOR);
#         string distStr = (string)curDist;
#         string timelineStr = "FLY_TO_DOR " + distStr;
#         PLATFORM.Comment(timelineStr);
         if (curDist <= GetTimeLineValueForKey(PROCESSOR,"MAR"))
         {
            #PLATFORM.Comment("Reached MAR");
            return true;
         }
         return false;
      end_next_state
   end_state


   state GO_HOME
      on_entry
         PLATFORM.Comment("GO_HOME");
      end_on_entry
      behavior_tree
            behavior_node  planned_route
         end_behavior_tree
      next_state COMMIT
         WsfWaypoint waypt = PLATFORM.Mover().Route().Front();
         PLATFORM.GoToLocation(waypt);
#         PLATFORM.Comment("Flying Home");
         return false;
      end_next_state
   end_state

end_processor
```

- **演示要点**：演示 WSF_QUANTUM_TASKER_PROCESSOR 的参数：script_debug_writes, update_interval, script_variables, state

### processor · WSF_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TRACK_PROCESSOR, master_track_processor, fused_track_reporting, purge_interval, 处理器
- **出处**：`air_to_air/weapons/aam/medium_range_radar_missile.txt:225-229`　（同签名共 2 处，另见 `air_to_air/weapons/aam/short_range_ir_missile.txt:170`）
- **片段**：

```text
   processor data_mgr WSF_TRACK_PROCESSOR
      master_track_processor 
      fused_track_reporting on
      purge_interval 60 s
   end_processor 
```

- **演示要点**：演示 WSF_TRACK_PROCESSOR 的参数：master_track_processor, fused_track_reporting, purge_interval

### processor · WSF_WEAPON_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_WEAPON_TRACK_PROCESSOR, coast_time, ignore_uplink_target_change, uplink_required, 处理器
- **出处**：`base_types/weapons/aam/medium_range_uplink_missile.txt:121-125`
- **片段**：

```text
   processor weapon_manager WSF_WEAPON_TRACK_PROCESSOR
      coast_time      100 s
      ignore_uplink_target_change   #the processor ignores track messages that dont pertain to the current target
      uplink_required true          #this version is command guided missile only (no missile-active state)
   end_processor
```

- **演示要点**：演示 WSF_WEAPON_TRACK_PROCESSOR 的参数：coast_time, ignore_uplink_target_change, uplink_required

### processor · WSF_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TRACK_PROCESSOR, report_to, report_interval, raw_track_reporting, 处理器
- **出处**：`bearing_only/platforms/geometric_bearing_only_sensor_platform.txt:27-31`
- **片段**：

```text
  processor data_mgr WSF_TRACK_PROCESSOR
     report_to commander via datalink to sub_net
     report_interval      2 sec
     raw_track_reporting on
  end_processor
```

- **演示要点**：演示 WSF_TRACK_PROCESSOR 的参数：report_to, report_interval, raw_track_reporting

### processor · WSF_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TRACK_PROCESSOR, purge_interval, unchanged_track_reporting, circular_report_rejection, 处理器
- **出处**：`iads_c2_demos/delegate_battle_manager.txt:84-88`　（同签名共 2 处，另见 `iads_c2_demos/platforms/sam_launcher.txt:26`）
- **片段**：

```text
   processor data_mgr WSF_TRACK_PROCESSOR
      purge_interval              60 sec
      unchanged_track_reporting   disable
      circular_report_rejection   on
   end_processor
```

- **演示要点**：演示 WSF_TRACK_PROCESSOR 的参数：purge_interval, unchanged_track_reporting, circular_report_rejection

### processor · WSF_TRIMSIM_PROCESSOR｜处理器

- **关键词**：processor, WSF_TRIMSIM_PROCESSOR, debug, debug_level, minimum_detections, 处理器
- **出处**：`sensor_demos/esm_tdoa_demo.txt:90-94`
- **片段**：

```text
processor TRIMSIM_PROCESSOR WSF_TRIMSIM_PROCESSOR
   debug
   debug_level 2
   minimum_detections 2
end_processor
```

- **演示要点**：演示 WSF_TRIMSIM_PROCESSOR 的参数：debug, debug_level, minimum_detections

### processor · WSF_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TRACK_PROCESSOR, update_interval, purge_interval, track_history_retention_interval, 处理器
- **出处**：`space_operations/cloud_attenuation.txt:100-104`
- **片段**：

```text
   processor tp WSF_TRACK_PROCESSOR
      update_interval 100 sec
      purge_interval 1 day
      track_history_retention_interval 1000 sec
   end_processor
```

- **演示要点**：演示 WSF_TRACK_PROCESSOR 的参数：update_interval, purge_interval, track_history_retention_interval

### processor · WSF_WEAPON_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_WEAPON_TRACK_PROCESSOR, turn_on_sensor, coast_time, uplink_required, 处理器
- **出处**：`air_to_air/weapons/aam/medium_range_radar_missile.txt:211-216`　（同签名共 7 处，另见 `base_types/weapons/aam/medium_range_radar_missile.txt:168`、`behavior_tree/weapons/aam/medium_range_radar_missile.txt:166`、`brawler/weapons/aam/medium_range_radar_missile.txt:168`）
- **片段**：

```text
   processor weapon_manager WSF_WEAPON_TRACK_PROCESSOR
      turn_on_sensor seeker  at_time   20 s before_intercept
     #turn_on_sensor seeker at_range 3500 m before_intercept
      coast_time      100 s
      uplink_required false         #this version is active missile only (no no command guidance uplink)
   end_processor
```

- **演示要点**：演示 WSF_WEAPON_TRACK_PROCESSOR 的参数：turn_on_sensor, coast_time, uplink_required

### processor · WSF_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TRACK_PROCESSOR, purge_interval, report_fused_tracks, raw_track_reporting, 处理器
- **出处**：`new_guidance/platforms/red_naval_helicopter.txt:24-29`　（同签名共 2 处，另见 `ship_ad/platforms/red_naval_helicopter.txt:24`）
- **片段**：

```text
processor RED_NAVAL_HELICOPTER_DATA_MGR WSF_TRACK_PROCESSOR
   purge_interval            60 sec

   report_fused_tracks
   raw_track_reporting   false
end_processor
```

- **演示要点**：演示 WSF_TRACK_PROCESSOR 的参数：purge_interval, report_fused_tracks, raw_track_reporting

### processor · WSF_PERCEPTION_PROCESSOR｜处理器

- **关键词**：processor, WSF_PERCEPTION_PROCESSOR, reports_self, report_interval, report_to, 处理器
- **出处**：`brawler/platforms/brawler_platform.txt:249-255`
- **片段**：

```text
   processor perception WSF_PERCEPTION_PROCESSOR
#      threat_update_interval 2 sec
#      max_threat_load 5
      reports_self on
      report_interval 1.0 sec
      report_to commander via datalink
   end_processor
```

- **演示要点**：演示 WSF_PERCEPTION_PROCESSOR 的参数：reports_self, report_interval, report_to

### processor · WSF_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TRACK_PROCESSOR, purge_interval, update_interval, report_to, 处理器
- **出处**：`outer_air_battle/platforms/blue_multirole_fighter_2.txt:124-130`　（同签名共 2 处，另见 `outer_air_battle/platforms/blue_prop_awacs_1.txt:68`）
- **片段**：

```text
   processor data_mgr WSF_TRACK_PROCESSOR
      //debug
      purge_interval  60 sec
      update_interval 1 sec

      report_to commander via cmdr_net
   end_processor
```

- **演示要点**：演示 WSF_TRACK_PROCESSOR 的参数：purge_interval, update_interval, report_to

### processor · WSF_GUIDANCE_COMPUTER｜处理器

- **关键词**：processor, WSF_GUIDANCE_COMPUTER, g_bias, maximum_commanded_g, guidance_delay, 处理器
- **出处**：`script_demos/script_demo_6.txt:58-64`
- **片段**：

```text
   processor guidance_computer WSF_GUIDANCE_COMPUTER
      g_bias                        1.2
      maximum_commanded_g          3 g
      guidance_delay                0.0 sec

      #debug
   end_processor
```

- **演示要点**：演示 WSF_GUIDANCE_COMPUTER 的参数：g_bias, maximum_commanded_g, guidance_delay

### processor · WSF_AIR_TARGET_FUSE｜处理器

- **关键词**：processor, WSF_AIR_TARGET_FUSE, time_of_flight_to_arm, max_time_of_flight_to_detonate, detonate_on_mach_decreasing_to, 处理器
- **出处**：`base_types/weapons/aam/blue_lr_a2a_rf_missile.txt:102-109`　（同签名共 4 处，另见 `base_types/weapons/aam/simple_medium_range_missile.txt:84`、`base_types/weapons/aam/test_medium_range_missile.txt:99`、`behavior_tree/weapons/aam/simple_mrm.txt:80`）
- **片段**：

```text
  processor fuse WSF_AIR_TARGET_FUSE
    time_of_flight_to_arm  2.0 sec
    max_time_of_flight_to_detonate 140.0 sec
    detonate_on_mach_decreasing_to  1.0       # DRB Added 5/10/10
    detonate_below_height_AGL       0.0 ft #  -200.0 m
             # DRB:  Make sure does not detonate prematurely during generation.
             # PROBLEM:  For sea level test, cannot set negative!
  end_processor
```

- **演示要点**：演示 WSF_AIR_TARGET_FUSE 的参数：time_of_flight_to_arm, max_time_of_flight_to_detonate, detonate_on_mach_decreasing_to

### processor · WSF_SCRIPT_PROCESSOR｜处理器

- **关键词**：processor, WSF_SCRIPT_PROCESSOR, script_variables, update_interval, on_update, 处理器
- **出处**：`gun_engagement/weapons/guns/BULLET_buildertool.txt:10-18`　（同签名共 9 处，另见 `tbm_demos/weapons/ssm/tbm3.txt:59`、`kinematic_mover/kinematic_mover_demo.txt:45`、`terrain_following/terrain_demo.txt:10`）
- **片段**：

```text
   processor StoreRangeVelInfo WSF_SCRIPT_PROCESSOR
      script_variables
         extern Map<double, double> RangeVelMap;
      end_script_variables
      update_interval 0.01 seconds
      on_update
         RangeVelMap.Set(PLATFORM.GroundRangeTo(0,0,0), ((MUZZLE_VELOCITY_MS + PLATFORM.Speed()) / 2));
      end_on_update
   end_processor
```

- **演示要点**：演示 WSF_SCRIPT_PROCESSOR 的参数：script_variables, update_interval, on_update

### processor · WSF_AIR_TARGET_FUSE｜处理器

- **关键词**：processor, WSF_AIR_TARGET_FUSE, detonate_below_mach, detonate_above_height_msl, max_time_of_flight_to_detonate, 处理器
- **出处**：`base_types/weapons/sam/blue_sr_sam_common.txt:185-194`
- **片段**：

```text
  processor fuse WSF_AIR_TARGET_FUSE
     detonate_below_mach 1.0

     # The following are used to limit the run time during launch computer
     # generation. They can be removed for real simulation use if one really
     # wants to see the missile do something after a big miss.

     detonate_above_height_msl      35 km
     max_time_of_flight_to_detonate 80 sec
  end_processor
```

- **演示要点**：演示 WSF_AIR_TARGET_FUSE 的参数：detonate_below_mach, detonate_above_height_msl, max_time_of_flight_to_detonate

### processor · WSF_LINK16_COMPUTER｜处理器

- **关键词**：processor, WSF_LINK16_COMPUTER, output_dis, output_wsf, message_processor, 处理器
- **出处**：`l16_j11/jtids.txt:28-37`　（同签名共 2 处，另见 `l16_j11/jtids.txt:40`）
- **片段**：

```text
processor WEAPON_LINK16_COMPUTER WSF_LINK16_COMPUTER
   output_dis true  // default is false
   output_wsf false // default is true

   # Using a NETWORK_ENABLED_WEAPON part to automatically send WIFT messages
   message_processor NetworkEnabledWeapon NETWORK_ENABLED_WEAPON
      send_interval rrn 9
      command_chain NETWORK_ENABLED_WEAPON
   end_message_processor
end_processor
```

- **演示要点**：演示 WSF_LINK16_COMPUTER 的参数：output_dis, output_wsf, message_processor

### processor · WSF_QUANTUM_TASKER_PROCESSOR｜处理器

- **关键词**：processor, WSF_QUANTUM_TASKER_PROCESSOR, script_debug_writes, update_interval, behavior_tree, 处理器
- **出处**：`route_finder_demos/platforms/striker.txt:79-89`　（同签名共 4 处，另见 `heatmap/platforms/striker.txt:81`、`heatmap/platforms/striker_pursuit.txt:77`、`timeline/platforms/striker.txt:81`）
- **片段**：

```text
   processor  task_mgr  WSF_QUANTUM_TASKER_PROCESSOR
      script_debug_writes  off
      update_interval 5 sec
      behavior_tree
         selector
            behavior_node  pursue-target_route_finder
            behavior_node  planned_route
         end_selector
         behavior_node  engage_weapon_task_target
      end_behavior_tree
   end_processor
```

- **演示要点**：演示 WSF_QUANTUM_TASKER_PROCESSOR 的参数：script_debug_writes, update_interval, behavior_tree

### processor · WSF_AIR_TARGET_FUSE｜处理器

- **关键词**：processor, WSF_AIR_TARGET_FUSE, time_of_flight_to_arm, max_time_of_flight_to_detonate, coast_time_on_loss_of_target, 处理器
- **出处**：`orwaca_iads/weapons/sam/elr_sam.txt:114-126`　（同签名共 3 处，另见 `orwaca_iads/weapons/sam/lr_sam.txt:114`、`orwaca_iads/weapons/sam/mr_sam.txt:114`）
- **片段**：

```text
processor ELR_SAM_FUSE WSF_AIR_TARGET_FUSE
   time_of_flight_to_arm            25.0 sec     // Don't arm during the boost phase
   max_time_of_flight_to_detonate  160.0 sec     // Set to max out at 175 nm.
   coast_time_on_loss_of_target      6.0 sec

#   script void on_weapon_detonation()
#      writeln("T=", TIME_NOW, " fuse on_weapon_detonation");
#   end_script

   #on_detonation
   #   writeln("T=", TIME_NOW, " fuse on_weapon_detonation");
   #end_on_detonation
end_processor
```

- **演示要点**：演示 WSF_AIR_TARGET_FUSE 的参数：time_of_flight_to_arm, max_time_of_flight_to_detonate, coast_time_on_loss_of_target

### processor · WSF_QUANTUM_TASKER_PROCESSOR｜处理器

- **关键词**：processor, WSF_QUANTUM_TASKER_PROCESSOR, script_debug_writes, update_interval, advanced_behavior_tree, 处理器
- **出处**：`behavior_tree/platforms/priority_selector_striker.txt:39-52`　（同签名共 9 处，另见 `behavior_tree/platforms/selector_with_memory_striker.txt:39`、`behavior_tree/platforms/weighted_random_striker.txt:39`、`behavior_tree/platforms/sequence_striker.txt:42`）
- **片段**：

```text
   processor  task_mgr  WSF_QUANTUM_TASKER_PROCESSOR
      script_debug_writes  off
      update_interval 5 sec
      
      advanced_behavior_tree
         btt on
         priority_selector
            behavior_node checkpoint_1
            behavior_node checkpoint_2
            behavior_node checkpoint_3
            behavior_node checkpoint_4
         end_priority_selector
      end_advanced_behavior_tree
   end_processor
```

- **演示要点**：演示 WSF_QUANTUM_TASKER_PROCESSOR 的参数：script_debug_writes, update_interval, advanced_behavior_tree

### processor（gci）｜处理器

- **关键词**：processor, update_interval, behavior_tree, edit, 处理器
- **出处**：`behavior_tree/platforms/gci.txt:41-59`
- **片段**：

```text
   processor  ripr  AIGCI-thinker
      update_interval 3.0 sec
      
      ### overwrite the gci behavior tree, so it only creates clustering jobs:
      behavior_tree
         behavior_node  create_clustering_jobs  
         behavior_node  toggle_windows          
        #behavior_node  debug_job_board         
      ###behavior_node  create_flank_jobs       
      end_behavior_tree
      
      edit behavior create_clustering_jobs
         script_variables
            mDrawClusters         = true;
            mClusterDistanceLimit = 30*1852;    #30 nautical miles
         end_script_variables
      end_behavior

   end_processor
```

- **演示要点**：演示 processor 的参数：update_interval, behavior_tree, edit

### processor · WSF_GUIDANCE_COMPUTER｜处理器

- **关键词**：processor, WSF_GUIDANCE_COMPUTER, guide_to_truth, update_interval, phase, 处理器
- **出处**：`laser_designator/weapons/agm/hellfire.txt:36-54`
- **片段**：

```text
   processor hellfire_guidance WSF_GUIDANCE_COMPUTER
      #debug
      #show_status
      guide_to_truth false # Use track location, not truth.
      update_interval              0.01 s
      phase LAUNCH         
         g_bias                       0.0
         proportional_navigation_gain 0.0
         velocity_pursuit_gain        0.0
         next_phase PITCH_UP when flight_time >= 0.15 sec
      end_phase
      phase PITCH_UP
         g_bias                                   2
         next_phase TERMINAL if target_slant_range < 5000 meter
      end_phase
      phase TERMINAL
         guidance_target truth         
      end_phase
   end_processor
```

- **演示要点**：演示 WSF_GUIDANCE_COMPUTER 的参数：guide_to_truth, update_interval, phase

### processor · WSF_TASK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TASK_PROCESSOR, script, evaluation_interval, state, 处理器
- **出处**：`cyber/platforms/cyber_command_post.txt:27-47`　（同签名共 6 处，另见 `electronic_warfare/simple_auto_jamming.txt:94`、`electronic_warfare/agile_jamming.txt:90`、`iads/platforms/soj.txt:22`）
- **片段**：

```text
   processor task_mgr WSF_TASK_PROCESSOR
   
      script void SendCyberAttack()
         PLATFORM.CyberAttack(TRACK.Target(),"LOWER_ALTITUDE");
      end_script
   
      evaluation_interval DETECTED 1 s
      state DETECTED      
         next_state ATTACK
            return (PLATFORM.SlantRangeTo(TRACK) <= 10*MATH.M_PER_NM() && TRACK.TargetType() == "UAV");
         end_next_state
      end_state
      
      evaluation_interval ATTACK 1 s
      state ATTACK
         on_entry
            writeln("TIME NOW = ", TIME_NOW, " ",TRACK.TargetName()," WITHIN RANGE OF  ", PLATFORM.Name(),", SENDING CYBER ATTACK");
            SendCyberAttack();
         end_on_entry
      end_state
   end_processor
```

- **演示要点**：演示 WSF_TASK_PROCESSOR 的参数：script, evaluation_interval, state

### processor · WSF_WEAPON_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_WEAPON_TRACK_PROCESSOR, turn_on_sensor, update_interval, on_update, 处理器
- **出处**：`shooter/weapons/aam/aa_mrm.txt:167-187`
- **片段**：

```text
   processor seeker_turn_on WSF_WEAPON_TRACK_PROCESSOR
      # turn_on_sensor seeker 20.0 sec after_launch
      turn_on_sensor seeker at_range 20000.0 m before_intercept
      update_interval 1 sec
      on_update
         extern bool mTrackFromE2CSet;
         extern bool mTrackFromE2C;
         if (! mTrackFromE2CSet)
	 {
            if (PLATFORM.Sensor("seeker").IsTurnedOn())
	    {
               WsfTrack extTrack = PLATFORM.CurrentTargetTrack();
	       if (extTrack.IsValid() && (extTrack.OriginatorType() == "e2c"))
	       {
	          mTrackFromE2C = true;
	       }
	       mTrackFromE2CSet = true;
	    }
	 }
      end_on_update
   end_processor
```

- **演示要点**：演示 WSF_WEAPON_TRACK_PROCESSOR 的参数：turn_on_sensor, update_interval, on_update

### processor · WSF_THREAT_PROCESSOR｜处理器

- **关键词**：processor, WSF_THREAT_PROCESSOR, update_interval, threat_velocity, script, 处理器
- **出处**：`base_types/platforms/blue_multirole_fighter_1_ripr.txt:49-71`
- **片段**：

```text
   processor incoming_threats WSF_THREAT_PROCESSOR
     update_interval 0.1 sec
     #update_interval 2.0 sec

      #1300 knots
      threat_velocity          668.7778 m/s

      script void identified_new_threat(WsfTrack aTrack)
         writeln("!!! me: ", PLATFORM.Name(), ", new threat: ", aTrack.TargetName());
      end_script

      script void dropped_threat(WsfTrack aTrack)
         if (aTrack.IsValid())
         {
            writeln("!!! ", PLATFORM.Name(), " dropped a threat: ", aTrack.TargetName());
         }
         else
         {
            writeln("!!! ", PLATFORM.Name(), " dropped a threat");
         }
      end_script

   end_processor
```

- **演示要点**：演示 WSF_THREAT_PROCESSOR 的参数：update_interval, threat_velocity, script

### processor · WSF_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TRACK_PROCESSOR, update_interval, script, on_update, 处理器
- **出处**：`bearing_only/platforms/fuser_platform2.txt:32-54`
- **片段**：

```text
  processor trk_mgr WSF_TRACK_PROCESSOR
    update_interval 10 sec
    script bool is_track_reportable(WsfTrack aTrack)
       //writeln("***** ", aTrack.TrackId(), " ", aTrack.LocationValid());
       return aTrack.LocationValid();
    end_script
    on_update
        WsfLocalTrackList localtracklist = PLATFORM.MasterTrackList();
        WsfTrackList        rawtracklist =  PLATFORM.MasterRawTrackList();
        #foreach (WsfTrack track in rawtracklist)
        foreach (WsfTrack track in localtracklist)
        {
            if (track.IsValid())
            {
                WsfDraw aDraw = WsfDraw(); # Make a draw object
                aDraw.SetColor(1, 0, 0, 1);
                aDraw.BeginIcons(track.Heading(), "wedge");
                aDraw.Vertex(track.ReportedLocation());
                aDraw.End();
            }
        }
    end_on_update
  end_processor
```

- **演示要点**：演示 WSF_TRACK_PROCESSOR 的参数：update_interval, script, on_update

### processor · WSF_SCRIPT_PROCESSOR｜处理器

- **关键词**：processor, WSF_SCRIPT_PROCESSOR, on, update_interval, on_update, 处理器
- **出处**：`p6dof/platforms/agm-mrc.txt:76-99`　（同签名共 4 处，另见 `p6dof/platforms/gbu-500.txt:72`、`six_dof/platforms/agm-mrc.txt:167`、`six_dof/platforms/gbu-500.txt:98`）
- **片段**：

```text
   processor lock_target WSF_SCRIPT_PROCESSOR
      on      
      update_interval 1 sec
      
      on_update
         WsfTrackManager trkMgr = PLATFORM.TrackManager();
         if(trkMgr.IsValid())
         {
            WsfLocalTrackList trkList = trkMgr.LocalTrackList();
            if(trkList.IsValid())
            {
               foreach (WsfLocalTrack trk in trkList)
               {
                  if(trk.IsValid())
                  {
                     PLATFORM.SetCurrentTarget(trk);
                     PROCESSOR.TurnOff();
                  }
               }
            }
         }      
      end_on_update
      
   end_processor
```

- **演示要点**：演示 WSF_SCRIPT_PROCESSOR 的参数：on, update_interval, on_update

### processor · WSF_P6DOF_GUIDANCE_COMPUTER｜处理器

- **关键词**：processor, WSF_P6DOF_GUIDANCE_COMPUTER, update_interval, guide_to_truth, phase, 处理器
- **出处**：`p6dof/platforms/sam-mr.txt:64-92`　（同签名共 2 处，另见 `p6dof/platforms/agm-sr.txt:54`）
- **片段**：

```text
   processor guidance WSF_P6DOF_GUIDANCE_COMPUTER

      update_interval 0.01 sec
      guide_to_truth  true

      phase LAUNCH_GUIDANCE
         time_constant                   0.1 sec
         proportional_navigation_gain    0
         velocity_pursuit_gain           0
         g_bias                          0
         next_phase MIDCOURSE when phase_time > 1.5 sec
      end_phase

      phase MIDCOURSE
         time_constant                   0.01 sec
         proportional_navigation_gain    5
         velocity_pursuit_gain           6
         g_bias                          2
         next_phase TERMINAL_GUIDANCE when range_to_intercept < 2 nm
      end_phase

      phase TERMINAL_GUIDANCE
         time_constant                   0 sec
         proportional_navigation_gain    6
         velocity_pursuit_gain           6
         g_bias                          1
      end_phase

   end_processor
```

- **演示要点**：演示 WSF_P6DOF_GUIDANCE_COMPUTER 的参数：update_interval, guide_to_truth, phase

### processor · WSF_GUIDANCE_COMPUTER｜处理器

- **关键词**：processor, WSF_GUIDANCE_COMPUTER, show_graphics, guide_to_truth, phase, 处理器
- **出处**：`ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:139-169`　（同签名共 2 处，另见 `space_operations/weapons/blue_naval_sam.txt:139`）
- **片段**：

```text
   processor BLUE_NAVAL_SAM_GUIDANCE WSF_GUIDANCE_COMPUTER
     #show_status
     show_graphics
      guide_to_truth          true
      phase LAUNCH
         commanded_flight_path_angle     from_launch_computer
         proportional_navigation_gain    0.0                 # Don't guide to target
         velocity_pursuit_gain           0.0                 # Don't guide to target

         next_phase TERMINAL if target_slant_range < 200 km # 150 km
         next_phase MIDCOURSE if on_commanded_flight_path_angle
      end_phase

      phase MIDCOURSE
         guidance_delay       2000 secs # stay on commanded loft angle
         next_phase TERMINAL when target_slant_range < 100 km #250 km
      end_phase

      phase TERMINAL
         proportional_navigation_gain     10.0
         proportional_navigation_method   augmented

         # Disable velocity pursuit. The angle which controls the switch between
         # velocity pursuit and pronav are too sensitive at short ranges.
         velocity_pursuit_gain            0.0

         # Disable g-bias. The target is also falling, so we don't want to fight
         # against it! (this is assuming terminal intercept, not boost)
         g_bias                           0.0
      end_phase
   end_processor
```

- **演示要点**：演示 WSF_GUIDANCE_COMPUTER 的参数：show_graphics, guide_to_truth, phase

### processor · WSF_GUIDANCE_COMPUTER｜处理器

- **关键词**：processor, WSF_GUIDANCE_COMPUTER, guide_to_truth, script_variables, phase, 处理器
- **出处**：`wargame/weapons/sam/sam.txt:65-95`　（同签名共 4 处，另见 `orwaca_iads/weapons/sam/elr_sam.txt:78`、`orwaca_iads/weapons/sam/lr_sam.txt:78`、`orwaca_iads/weapons/sam/mr_sam.txt:78`）
- **片段**：

```text
processor SAM_AUTOPILOT WSF_GUIDANCE_COMPUTER
   #show_status
   guide_to_truth true
   //show_evaluations

   script_variables
      double PITCH_OVER_DELAY = 0.8;
   end_script_variables

   phase LIFT_OFF
      # No guidance commands during this phase
      guidance_delay 4 sec
      next_phase PITCH_OVER when phase_time >= variable PITCH_OVER_DELAY secs
   end_phase

   phase PITCH_OVER
      commanded_flight_path_angle   55 deg
      next_phase MIDCOURSE when on_commanded_flight_path_angle
   end_phase

   phase MIDCOURSE

      proportional_navigation_gain  4.0
      next_phase TERMINAL when time_to_intercept < 10 sec
   end_phase

   phase TERMINAL

      proportional_navigation_gain  4.0
   end_phase
end_processor
```

- **演示要点**：演示 WSF_GUIDANCE_COMPUTER 的参数：guide_to_truth, script_variables, phase

### processor · WSF_SCRIPT_PROCESSOR｜处理器

- **关键词**：processor, WSF_SCRIPT_PROCESSOR, update_interval, on_initialize, on_update, 处理器
- **出处**：`script_demos/script_demo_5.txt:48-78`　（同签名共 3 处，另见 `script_demos/script_demo_6.txt:105`、`script_demos/script_demo_7.txt:202`）
- **片段**：

```text
processor WRITE_INFO WSF_SCRIPT_PROCESSOR
  update_interval 1 sec
  on_initialize # Writes out the header one time for the data
    writeln("Name,Mtime,Vel(mps),Mach,Alt,WCSVelocity(x,y,z),RelAz,RelEl");
  end_on_initialize
  on_update
    Vec3 vectorVelocityWCS = PLATFORM.VelocityWCS(); # get my xyz velocities
    WsfTrack track = PLATFORM.CurrentTargetTrack();  # get my current track info
    WsfPlatform target = track.Target();             # get my target info from the track
    // Do a validity check on the track and target so we don't spew NULL warning messages
    // out because the target platform no longer exists (because we destoyed it).
    if(track.IsValid() && target.IsValid())
    {
       WsfGeoPoint trackpoint = track.ReportedLocation(); # get the geolocation of the track
       double RelativeAzimuth = PLATFORM.RelativeAzimuthOf(trackpoint);
       double RelativeElevation = PLATFORM.RelativeElevationOf(trackpoint);
       double weaponAz = target.RelativeAzimuthOf(PLATFORM.Location());
       double weaponEl = target.RelativeElevationOf(PLATFORM.Location());
       writeln(PLATFORM.Name(),",",
            PLATFORM.TimeSinceCreation(),",",
            PLATFORM.Speed(),",",
            PLATFORM.MachNumber(),",",
            PLATFORM.Altitude(),",",
            vectorVelocityWCS,",",
            RelativeAzimuth,",",
            RelativeElevation,",",
            weaponAz,",",
            weaponEl );
    }
  end_on_update
end_processor
```

- **演示要点**：演示 WSF_SCRIPT_PROCESSOR 的参数：update_interval, on_initialize, on_update

### processor · WSF_SCRIPT_PROCESSOR｜处理器

- **关键词**：processor, WSF_SCRIPT_PROCESSOR, script_debug_writes, update_interval, advanced_behavior_tree, 处理器
- **出处**：`behavior_tree/platforms/subtrees_striker.txt:42-78`
- **片段**：

```text
   processor  task_mgr  WSF_SCRIPT_PROCESSOR
      script_debug_writes off
      update_interval 5 sec

      advanced_behavior_tree
         btt on
         desc "This tree will run subtrees tree_checkpoints1234, tree_checkpoints34, tree_checkpoints321, and then will fly checkpoints 4 and 5"
         root_node_type sequence
         advanced_behavior_tree
            btt on
            name tree_checkpoints1234
            desc "This will fly to checkpoints 1 and 2, and then will run tree_checkpoints34"
            root_node_type sequence
            behavior_node checkpoint_1
            behavior_node checkpoint_2
            advanced_behavior_tree
               btt on
               name tree_checkpoints34
               desc "This will fly to checkpoint 3 and then to checkpoint 4"
               root_node_type sequence
               behavior_node checkpoint_3
               behavior_node checkpoint_4
            end_advanced_behavior_tree
         end_advanced_behavior_tree
         advanced_behavior_tree
            btt on
            name tree_checkpoints321
            desc "This will fly to checkpoints 3, 2, and 1"
            root_node_type sequence
            behavior_node checkpoint_3
            behavior_node checkpoint_2
            behavior_node checkpoint_1
         end_advanced_behavior_tree
         behavior_node checkpoint_4
         behavior_node checkpoint_5
      end_advanced_behavior_tree
   end_processor
```

- **演示要点**：演示 WSF_SCRIPT_PROCESSOR 的参数：script_debug_writes, update_interval, advanced_behavior_tree

### processor · WSF_TASK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TASK_PROCESSOR, evaluation_interval, script_variables, state, 处理器
- **出处**：`multiresolution_demos/processors/processor_include.txt:54-90`　（同签名共 2 处，另见 `ship_ad/weapons/agm/asm_tactics.txt:17`）
- **片段**：

```text
processor HIGH_FIDELITY_TASK_PROCESSOR WSF_TASK_PROCESSOR
   evaluation_interval SEARCHING 1.0 sec
   evaluation_interval MOVING 0.5 sec
   
   script_variables
      WsfGeoPoint targetPoint = WsfGeoPoint();
   end_script_variables
   
   state SEARCHING
      next_state MOVING
         if (TRACK) {
            targetPoint = TRACK.CurrentLocation();
            writeln("Found tortoise at ", targetPoint);
            return true;
         } else {
            return false;
         }
      end_next_state
   end_state
   
   state MOVING
      on_entry
         PLATFORM.GoToSpeed(250.0, 1.0, true);
         PLATFORM.GoToLocation(targetPoint);
         writeln("Chasing tortoise to ", targetPoint);
      end_on_entry
      next_state SEARCHING
         if (PLATFORM.Location().SlantRangeTo(targetPoint) < 200.0){
            writeln("Caught tortoise!");
            PLATFORM.SetVelocityNED(0,0,0);
            return true;
         } else {
            return false;
         }
      end_next_state
   end_state
end_processor
```

- **演示要点**：演示 WSF_TASK_PROCESSOR 的参数：evaluation_interval, script_variables, state

### processor · WSF_TASK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TASK_PROCESSOR, if, next_state, on_entry, 处理器
- **出处**：`cyber/platforms/cyber_outpost.txt:28-74`
- **片段**：

```text
   processor task_mgr WSF_TASK_PROCESSOR
   number_of_servers 100
   
   script void SendCyberAttack()
      if (!TRACK.Target().IsNull())
      {
         PLATFORM.CyberAttack(TRACK.Target(),"CRASH");
      }
   end_script
   
   evaluation_interval DETECTED 1 s
   state DETECTED
      next_state END_STATE
         return(TRACK.TimeSinceUpdated()>30);
      end_next_state
      
      next_state ATTACK
         return (PLATFORM.SlantRangeTo(TRACK) <= 40*MATH.M_PER_NM() && !TRACK.Target().IsNull() && TRACK.Target().Processor("guidance").IsTurnedOn() && TRACK.Target().Altitude()>15000*MATH.M_PER_FT());
      end_next_state
   end_state
   
   evaluation_interval ATTACK 61 s
   time_to_evaluate ATTACK 60 s
   state ATTACK
      on_entry
         writeln("TIME NOW = ", TIME_NOW, " WITHIN RANGE, SENDING CYBER ATTACK FOR ", TRACK.Target());
         SendCyberAttack();
      end_on_entry
      
      next_state END_STATE
         return(TRACK.TimeSinceUpdated()>30);
      end_next_state
      
      next_state DETECTED
         if (!TRACK.Target().IsNull()) 
         {
            return (PLATFORM.CyberAttackStatus(TRACK.Target(), "CRASH") == 0);
         }
         return false;
      end_next_state
   end_state
   
   evaluation_interval END_STATE 1 day
   state END_STATE
   end_state
   
   end_processor
```

- **演示要点**：演示 WSF_TASK_PROCESSOR 的参数：if, next_state, on_entry

### processor · WSF_TASK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TASK_PROCESSOR, show_state_transitions, evaluation_interval, state, 处理器
- **出处**：`engage/flight_path.txt:66-119`　（同签名共 7 处，另见 `engage/flight_route.txt:65`、`engage/grid.txt:64`、`engage/grid_w_observer.txt:64`）
- **片段**：

```text
   processor operator WSF_TASK_PROCESSOR
      show_state_transitions

      evaluation_interval DETECTED 0.5 sec
      state DETECTED
         next_state TRY_TO_ACQUIRE
            return StartTracking(TRACK, "DUMMY", PLATFORM.Sensor("ttr"), "SEARCH");
         end_next_state
      end_state

      evaluation_interval TRY_TO_ACQUIRE 0.5 sec
      state TRY_TO_ACQUIRE
         next_state TRY_TO_TRACK
            bool status = false;
            if (TRACK.TrackQuality() > 0.65)
            {
               status = StartTracking(TRACK, "DUMMY", PLATFORM.Sensor("ttr"), "ACQUIRE");
            }
            return status;
         end_next_state
      end_state

      evaluation_interval TRY_TO_TRACK 0.5 sec
      state TRY_TO_TRACK
         next_state TRY_TO_FIRE
            bool status = false;
            if (TRACK.TrackQuality() > 0.85)
            {
               status = StartTracking(TRACK, "DUMMY", PLATFORM.Sensor("ttr"), "TRACK");
            }
            return status;
         end_next_state
      end_state

      evaluation_interval TRY_TO_FIRE 0.5 sec
      state TRY_TO_FIRE
         next_state FIRED
            bool status = false;
            if (TRACK.TrackQuality() > 0.95)
            {
               WsfPlatform launcher = WsfSimulation.FindPlatform("launcher");
               status = FireAt(TRACK, "DUMMY", "lrsam", 1, launcher);
            }
            return status;
         end_next_state
      end_state

      evaluation_interval FIRED 0.1 sec
      state FIRED
         next_state FIRED
            return true;
         end_next_state
      end_state
   end_processor
```

- **演示要点**：演示 WSF_TASK_PROCESSOR 的参数：show_state_transitions, evaluation_interval, state

### processor（logistics_platform）｜处理器

- **关键词**：processor, update_interval, container, transactor, 处理器
- **出处**：`logistics/platforms/logistics_platform.txt:343-398`
- **片段**：

```text
   processor exchanger EXCHANGE_PROCESSOR

      # NOTE:  The components below are named placeholders, but
      # need to be filled in.  The derived classes must set their
      # own quantities and rates for these objects!  (Use 'edit').

      #debug
      update_interval 15 sec

      container fuel_container
         # Derived types must set values in this!
      end_container

      transactor fuel_offering_transactor
         container_name fuel_container
         is_offeror
         continue_to_offer      true
         proximity_limit         100 m     # If the transacting platforms are more than this distance apart,
                                           # the transaction will not be allowed to take place.
         #maximum_mass_rate  xx.0 kg/sec   # Derived types must set values in this!
         time_out_clock_interval  3.0 sec
      end_transactor

      transactor fuel_requesting_transactor
         container_name fuel_container
         is_receiver
         proximity_limit          100 m    # If the transacting platforms are more than this distance apart,
                                           # the transaction will not be allowed to take place.
         #maximum_mass_rate  xx.0 kg/sec    # Derived types must set values in this!
         time_out_clock_interval  3.0 sec
      end_transactor

      container good_engine_container
         # Derived types must set values in this!
      end_container

      transactor repair_offering_transactor
         container_name good_engine_container
         is_offeror
         continue_to_offer        true
         proximity_limit          100 m    # If the transacting platforms are more than this distance apart,
                                           # the transaction will not be allowed to take place.
         #maximum_mass_rate  xx.0 kg/sec    # Derived types must set values in this!
         time_out_clock_interval  3.0 sec
      end_transactor

      transactor repair_requesting_transactor
         container_name good_engine_container
         is_receiver
         proximity_limit          300 m    # If the transacting platforms are more than this distance apart,
                                           # the transaction will not be allowed to take place.
         #maximum_mass_rate  xx.0 kg/sec    # Derived types must set values in this!
         time_out_clock_interval  3.0 sec
      end_transactor

   end_processor
```

- **演示要点**：演示 processor 的参数：update_interval, container, transactor

### processor · WSF_GUIDANCE_COMPUTER｜处理器

- **关键词**：processor, WSF_GUIDANCE_COMPUTER, show_status, script_variables, phase, 处理器
- **出处**：`script_demos/script_demo_7.txt:102-162`
- **片段**：

```text
   processor guidance WSF_GUIDANCE_COMPUTER
      show_status
      #show_evaluations
      #debug

      script_variables
         double BeginningAlt = 0;

         double HighAlt = 3048;   #10kft
         double LowAlt  = 152;   # 500ft
         double tolerance = 300;   #1000 ft
         double BeginningRange = 0;
         double LowRange = 100000; # 100km
      end_script_variables
      phase LAUNCH
         guidance_delay   1 sec
         next_phase INITIAL when phase_time > 1 sec
      end_phase

      phase INITIAL
         on_entry
           BeginningAlt = PLATFORM.Altitude();
           WsfTrack targetTrack = PLATFORM.CurrentTargetTrack();
           BeginningRange =  PLATFORM.GroundRangeTo(targetTrack);
           if ((BeginningAlt + tolerance) >= HighAlt && (BeginningRange > LowRange))
           {
             SelectPhase("HIGHALT");
           }
           else
           {
              SelectPhase("LOWALT");
           }
         end_on_entry
      end_phase
      phase HIGHALT
         on_entry
            SetCommandedAltitudeAGL(HighAlt);
            SetAllowRouteFollowing(true);
            if (PLATFORM.Name().Contains("_1"))
            {
                 PLATFORM.FollowRoute("Route01");
            }
            if (PLATFORM.Name().Contains("_2"))
            {
                 PLATFORM.FollowRoute("Route02");
            }
         end_on_entry
         commanded_speed          537 mph
         next_phase LOWALT when target_ground_range < variable LowRange m
      end_phase
      phase LOWALT
         on_entry
            SetCommandedAltitudeAGL(LowAlt);
         end_on_entry
         commanded_speed          537 mph
         next_phase TERMINAL when target_ground_range < 1000 m
      end_phase
      phase TERMINAL
         maximum_commanded_g 10 g
      end_phase
   end_processor
```

- **演示要点**：演示 WSF_GUIDANCE_COMPUTER 的参数：show_status, script_variables, phase

### processor（large_sam_battalion）｜处理器

- **关键词**：processor, number_of_servers, on_initialize, script, 处理器
- **出处**：`aea_iads/platforms/large_sam_battalion.txt:18-80`　（同签名共 7 处，另见 `cyber/exfiltrate_demo/platforms/large_sam_battalion.txt:18`、`iads/platforms/large_sam_battalion.txt:18`、`orwaca_iads/platforms/elr_sam_battalion.txt:19`）
- **片段**：

```text
processor LARGE_SAM_BATTALION_TASK_MGR RED_SAM_BATTERY_TASK_MGR
   number_of_servers            2

   #script_debug_writes on
   #show_state_transitions
   #show_task_messages

   on_initialize
      SENSOR_NAME             = "ttr";
      REQUIRED_TRACK_QUALITY  = 0.75;
      SENSOR_ACQUIRE_MODE     = "ACQUIRE";
      SENSOR_TRACK_MODE       = "TRACK";
      WEAPON_NAME             = "sam";
      ENVELOPE                = "full_kinematic";
      SALVO_SIZE              = 2;
   end_on_initialize

# -------------------------------------------------------------------------------

   // on task assign / cancel, command the acquisition radar to emcon-on and
   // emcon-off, respectively
   script void EvaluateOperatingLevel()
      if ((TasksReceived() > 0) ||
          (OperatingLevelFor("ENGAGE") > 0))
      {
         foreach (WsfPlatform sub in PLATFORM.Subordinates())
         {
            string subType = sub.Type();
            if (subType == "ACQ_RADAR")
            {
               if (OperatingLevelFor("ENGAGE", sub) < 1)
               {
                  ChangeOperatingLevel("ENGAGE", 1, sub);
                  break;
               }
            }
         }
      }
      else
      {
         foreach (WsfPlatform sub in PLATFORM.Subordinates())
         {
            string subType = sub.Type();
            if (subType == "ACQ_RADAR")
            {
               if (OperatingLevelFor("ENGAGE", sub) > 0)
               {
                  ChangeOperatingLevel("ENGAGE", 0, sub);
                  break;
               }
            }
         }
      }
   end_script

   script void on_task_assign(WsfTask aTask, WsfTrack aTrack)
      EvaluateOperatingLevel();
   end_script

   script void on_task_cancel(WsfTask aTask)
      EvaluateOperatingLevel();
   end_script
end_processor
```

- **演示要点**：演示 processor 的参数：number_of_servers, on_initialize, script

### processor · WSF_TASK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TASK_PROCESSOR, script_variables, script, execute, 处理器
- **出处**：`cyber/exfiltrate_demo/platforms/red_radar_tactics.txt:17-83`　（同签名共 5 处，另见 `heatmap/processors/red_radar_tactics.txt:17`、`iads/platforms/red_radar_tactics.txt:17`、`orwaca_iads/processors/red_radar_tactics.txt:17`）
- **片段**：

```text
processor RED_RADAR_TACTICS WSF_TASK_PROCESSOR

   script_variables
      bool cEVALUATE_EMCON_TURN_OFF = false;
   end_script_variables

   script void EvaluateEmcon()
     int sensorCount = PLATFORM.SensorCount();
     if (sensorCount > 0)
     {
        WsfSensor sensor = PLATFORM.SensorEntry(0);
        if (sensor.IsTurnedOff())
        {
           # sensor is off.  Turn it on if we've received a task or
           # we are put on alert
           if ((TasksReceived() > 0) ||
               (OperatingLevelFor("ENGAGE") > 0))
           {
              for (int entry = 0; entry < sensorCount; entry = entry + 1)
              {
                 PLATFORM.SensorEntry(entry).TurnOn();
              }
           }
        }
        else if (sensor.IsTurnedOn() &&
                 cEVALUATE_EMCON_TURN_OFF)
        {
           # sensor is on.  Turn it off if we have no tasks and are
           # not on alert
           if ((TasksReceived() < 1) &&
               (OperatingLevelFor("ENGAGE") < 1))
           {
              for (int entry = 0; entry < sensorCount; entry = entry + 1)
              {
                 PLATFORM.SensorEntry(entry).TurnOff();
              }
           }
        }
     }
   end_script

   # this cannot be done in 'on_initialize' because the commander may not yet exist
   execute at_time 0.1 seconds relative
      # if my commander is in the category ENGAGEMENT then we will execute
      # the emcon/turn-off logic
      WsfPlatform commander = PLATFORM.Commander();
      if (commander.IsValid() &&
          commander.CategoryMemberOf("ENGAGEMENT"))
      {
         cEVALUATE_EMCON_TURN_OFF = true;
      }
   end_execute

   # evaluate emcon whenever we have a change in assignment or alert level
   script void on_task_assign(WsfTask aTask, WsfTrack aTrack)
      ExecuteScriptAtTime(TIME_NOW + RANDOM.Uniform(0.0, 4.0), "EvaluateEmcon");
   end_script

   script void on_task_cancel(WsfTask aTask)
      ExecuteScriptAtTime(TIME_NOW + RANDOM.Uniform(0.0, 4.0), "EvaluateEmcon");
   end_script

   script void on_operating_level_change(string aName)
      ExecuteScriptAtTime(TIME_NOW + RANDOM.Uniform(0.0, 4.0), "EvaluateEmcon");
   end_script

end_processor
```

- **演示要点**：演示 WSF_TASK_PROCESSOR 的参数：script_variables, script, execute

### processor · WSF_BRAWLER_PROCESSOR｜处理器

- **关键词**：processor, WSF_BRAWLER_PROCESSOR, mind_file, script_variables, behavior_tree, 处理器
- **出处**：`brawler/platforms/brawler_platform.txt:95-170`
- **片段**：

```text
   processor thinker WSF_BRAWLER_PROCESSOR

     #draw_alternatives
      mind_file platforms/MIND
     #draw_nominal_states
      #show_task_messages
      #debug

      script_variables
         int kturn = 0;            //turn type for BVR flight tactics
         Vec3   vecfpp = Vec3();   //vectored flight, direction
         double valfpp = 0.0;      //vectored flight, value
         double sflypp = 0.0;      //vectored flight, speed
      end_script_variables

      behavior_tree
         parallel

          #behavior_node debug_data

#         #FLIGHT TACTIC DECISION
#         priority_selector
#            behavior_node  alt1516_bvr_end_run_left
#            behavior_node  alt1517_bvr_end_run_right
#            behavior_node  alt1514_point
#         end_priority_selector

#         #FLIGHT POSTURE DECISION
#         selector
#            #behavior_node  altWXYZ_blah_blah
#         end_selector

#         #PILOT POSTURE DECISION
#         selector
#            behavior_node  pilot_posture
#         end_selector

         #PILOT MANEUVERING DECISION
         priority_selector
            #when debug: prints precondition score of each selector child behavior
            #debug
            behavior_node  alt3111_straight_level_max_speed
            behavior_node  alt3121_straight_level
            behavior_node  alt3411_straight_flight
            behavior_node  alt3421_roll_15_pull
            behavior_node  alt3431_roll-15_pull
            behavior_node  alt3441_tail_attack
            behavior_node  alt3451_pull_gmax_sust
            behavior_node  alt3471_slow_current_dir
            behavior_node  alt3472_slow_pull_right
            behavior_node  alt3473_slow_pull_left
            behavior_node  alt3474_slow_pull_current_plane
            behavior_node  alt3511_break_right
            behavior_node  alt3531_break_left
            behavior_node  alt3551_run_away
            behavior_node  alt3561_force_overshoot
            behavior_node  alt3581_negative_velocity
            #behavior_node  alt3611_fly_vector
            behavior_node  alt3841_aim_missile_typ4
           #behavior_node  alt3211_route_maneuver
            behavior_node  alt3911_evade_missile
           #behavior_node  alt3A11_low_speed_recover
           #behavior_node  alt3A21_low_speed_recover_right45
           #behavior_node  alt3A31_low_speed_recover_left45
           #behavior_node  alt3B11_illuminate
            behavior_node  alt3G11_barrel_roll
         end_priority_selector

         #WEAPON EMPLOYMENT DECISION
         selector
           behavior_node weapon_decision_gun
           behavior_node weapon_decision_missile
         end_selector
         end_parallel
      end_behavior_tree
   end_processor
```

- **演示要点**：演示 WSF_BRAWLER_PROCESSOR 的参数：mind_file, script_variables, behavior_tree

### processor · WSF_SCRIPT_PROCESSOR｜处理器

- **关键词**：processor, WSF_SCRIPT_PROCESSOR, update_interval, execute, on_update, 处理器
- **出处**：`space_operations/platforms/iridium_satellite.txt:142-235`
- **片段**：

```text
   processor dynamic-link-processor WSF_SCRIPT_PROCESSOR

      update_interval 1 min
      execute at_time 0.00001 s absolute
         // set up the links that don't change (links with adjacent satellites in same plane).
         WsfComm comm = PLATFORM.Comm("iridium_comm");
         string netName = comm.NetworkName();
         mSatelliteNumber = SatelliteNumber(netName);
         mOrbitNumber = OrbitNumber(netName);
         bool isEvenOrbit = (Math.Mod(mOrbitNumber, 2) == 0);

         if (mOrbitNumber != sFIRST_ORBIT)
         {
            if (isEvenOrbit)
            {
               if (mSatelliteNumber != sLAST_SATELLITE)
               {
                  mNorthwardUpperLeftLink = "iridium" + (string)(mOrbitNumber - 1) + (string)(mSatelliteNumber + 1);
               }
               else
               {
                  mNorthwardUpperLeftLink = "iridium" + (string)(mOrbitNumber - 1) + (string)(sFIRST_SATELLITE);
               }
               mSouthwardUpperLeftLink = "iridium" + (string)(mOrbitNumber - 1) + (string)(mSatelliteNumber);
            }
            else // odd orbit
            {
               mNorthwardUpperLeftLink = "iridium" + (string)(mOrbitNumber - 1) + (string)(mSatelliteNumber);
               if (mSatelliteNumber != sFIRST_SATELLITE)
               {
                  mSouthwardUpperLeftLink = "iridium" + (string)(mOrbitNumber - 1) + (string)(mSatelliteNumber - 1);
               }
               else
               {
                  mSouthwardUpperLeftLink = "iridium" + (string)(mOrbitNumber - 1) + (string)(sLAST_SATELLITE);
               }
            }
         }
         if (mOrbitNumber != sLAST_ORBIT)
         {
            if (isEvenOrbit)
            {
               mNorthwardLowerRightLink = "iridium" + (string)(mOrbitNumber + 1) + (string)(mSatelliteNumber);
               if (mSatelliteNumber != sLAST_SATELLITE)
               {
                  mSouthwardLowerRightLink = "iridium" + (string)(mOrbitNumber + 1) + (string)(mSatelliteNumber + 1);
               }
               else
               {
                  mSouthwardLowerRightLink = "iridium" + (string)(mOrbitNumber + 1) + (string)(sFIRST_SATELLITE);
               }
            }
            else // odd orbit
            {
               if (mSatelliteNumber != sFIRST_SATELLITE)
               {
                  mNorthwardLowerRightLink = "iridium" + (string)(mOrbitNumber + 1) + (string)(mSatelliteNumber - 1);
               }
               else
               {
                  mNorthwardLowerRightLink = "iridium" + (string)(mOrbitNumber + 1) + (string)(sLAST_SATELLITE);
               }
               mSouthwardLowerRightLink = "iridium" + (string)(mOrbitNumber + 1) + (string)(mSatelliteNumber);
            }
         }

#         writeln(PLATFORM.Name(), " Connections:");
#         writeln("   orbit, satellite: ", mOrbitNumber, ", ", mSatelliteNumber);
#         writeln("   nul ", mNorthwardUpperLeftLink);
#         writeln("   nlr ", mNorthwardLowerRightLink);
#         writeln("   sul ", mSouthwardUpperLeftLink);
#         writeln("   slr ", mSouthwardLowerRightLink);
         Vec3 velWCS = PLATFORM.VelocityWCS();
         mIsTravelingNorth = (velWCS.Z() > 0.0);
         mWasTravelingNorth = mIsTravelingNorth;
      end_execute

      execute at_time 10 s absolute
         AddStaticConnections();
         UpdateLinks();
      end_execute

      on_update
         if (TIME_NOW > 0.0)
         {
            UpdateTravelDirection();
            if (mIsTravelingNorth != mWasTravelingNorth)
            {
               UpdateLinks();
            }
         }
      end_on_update

   end_processor
```

- **演示要点**：演示 WSF_SCRIPT_PROCESSOR 的参数：update_interval, execute, on_update

### processor · WSF_SCRIPT_PROCESSOR｜处理器

- **关键词**：processor, WSF_SCRIPT_PROCESSOR, script_variables, script, on_initialize2, 处理器
- **出处**：`route_finder_demos/3d_route_finder.txt:49-186`
- **片段**：

```text
processor 3D_ROUTER WSF_SCRIPT_PROCESSOR

   script_variables
      string mTargetPlatform    = "target";
      string mAvoidPlatformType = "REDSAM";
     #double mRadiusPerAltitude = 2.5;
      double mRadiusPerAltitude = 7.0;
      double mAltCeiling = 40000 * MATH.M_PER_FT();
      double mAltFloor   = 10000 * MATH.M_PER_FT();
      Vec3 mAvoidColor = Vec3.Construct(1,0,0);
      Vec3 mRouteColor = Vec3.Construct(0,1,0);

      WsfDraw mDraw = WsfDraw();
      WsfRouteFinder mFinder = WsfRouteFinder();
      Array<WsfGeoPoint> mAvoids = Array<WsfGeoPoint>();
   end_script_variables

   script void DrawRoute(WsfRoute aRoute)
      if (aRoute.IsValid())
      {
         mDraw.SetColor(mRouteColor[0],mRouteColor[1],mRouteColor[2]);
         mDraw.BeginPolyline();
            for (int i=0; i<aRoute.Size(); i=i+1)
            {
               mDraw.Vertex(aRoute.Waypoint(i).Location());
            }
         mDraw.End();
      }
   end_script

   script void Draw3dSamAvoidance(WsfGeoPoint pos)
      if (pos.IsValid())
      {
         mDraw.SetColor(mAvoidColor[0],mAvoidColor[1],mAvoidColor[2]);
         double radiusAtCeiling = mRadiusPerAltitude * mAltCeiling;
         mDraw.BeginLines();
            for(double angle=0; angle<=360; angle = angle + 15)
            {
               WsfGeoPoint end = WsfGeoPoint(pos);               #clone the ground position
               end.Offset(angle,radiusAtCeiling,0,-mAltCeiling); #move the position up & out
               mDraw.Vertex(pos);
               mDraw.Vertex(end);
            }
         mDraw.End();

         mDraw.BeginCircle(0, radiusAtCeiling);
            WsfGeoPoint top = WsfGeoPoint(pos);               #clone the ground position
            top.OffsetNED(0,0,-mAltCeiling);
            mDraw.Vertex(top);
         mDraw.End();
      }
   end_script

   script double RouteLength3d(WsfRoute route)
      double length = 0;
      for(int i=0; i<(route.Size()-1); i+=1)
      {
         length += route[i].Location().SlantRangeTo(route[i+1].Location());
      }
      return length;
   end_script

   on_initialize2
      mDraw.SetLineSize(1);
      mDraw.SetLineStyle("solid");
      mDraw.SetDuration(WsfSimulation.EndTime());
      mDraw.SetId("3D_ROUTER");
      mDraw.SetEllipseMode("line");

      mFinder.SetImpossibleRouteResponse("SHIFT");
      mFinder.SetMaxArcLength(4000); //a little over 2 nm (in meters)
      WsfGeoPoint src = PLATFORM.Location();
      WsfGeoPoint tgt = WsfSimulation.FindPlatform(mTargetPlatform).Location();

      #setup avoidances
      for(int i=0; i < WsfSimulation.PlatformCount(); i+=1)
      {
         WsfPlatform avoid = WsfSimulation.PlatformEntry(i);
         if (avoid.Type() == mAvoidPlatformType)
         {
            Draw3dSamAvoidance(avoid.Location());
            mAvoids.PushBack(avoid.Location());
         }
      }


      WsfRoute shortestRoute;
      double shortestRouteLength = MATH.DOUBLE_MAX();

      double altIncrement = 1000 * MATH.M_PER_FT();

      WsfGeoPoint beg = WsfGeoPoint(src);
      WsfGeoPoint end = WsfGeoPoint(tgt);

      for (double alt = mAltCeiling; alt >= mAltFloor; alt -= altIncrement)
      {
         mFinder.ClearAvoidances();
         double SamRadiusAtAlt = alt * mRadiusPerAltitude;
         foreach(WsfGeoPoint avoid in mAvoids)
         {
            mFinder.Avoid(avoid, SamRadiusAtAlt);
         }

         #adjust start and end altitudes for current route
         beg.SetAltitudeAGL(alt);
         end.SetAltitudeAGL(alt);
         WsfRoute path = mFinder.Route(TIME_NOW, beg, end, 250); #(250 met/sec ~500 knots)

         #ignore routes that go so low, there is nothing to avoid (for now)
         if (path.Size() > 2)
         {
            #set altitudes of beginning and end points back to original
            beg = path.Front().Location();
            beg.SetAltitudeAGL(src.Altitude());
            path.Front().SetLocation(beg);
            end = path.Back().Location();
            end.SetAltitudeAGL(tgt.Altitude());
            path.Back().SetLocation(end);

            DrawRoute(path);

            double currentRouteLength = RouteLength3d(path);
            if (currentRouteLength < shortestRouteLength)
            {
               shortestRouteLength = currentRouteLength;
               shortestRoute = path;
            }
         }
      }

      if (shortestRoute.IsValid())
      {
         PLATFORM.SetRoute(shortestRoute);
      }

   end_on_initialize2

end_processor
```

- **演示要点**：演示 WSF_SCRIPT_PROCESSOR 的参数：script_variables, script, on_initialize2

### processor · WSF_BRAWLER_PROCESSOR｜处理器

- **关键词**：processor, WSF_BRAWLER_PROCESSOR, mind_file, consciousness_event_update_time, 处理器
- **出处**：`air_to_air/platforms/brawler_test.txt:75-78`
- **片段**：

```text
   processor thinker WSF_BRAWLER_PROCESSOR
      mind_file platforms/mind
      consciousness_event_update_time 10 s
   end_processor 
```

- **演示要点**：演示 WSF_BRAWLER_PROCESSOR 的参数：mind_file, consciousness_event_update_time

### processor · WSF_TASK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TASK_PROCESSOR, on, internal_link, 处理器
- **出处**：`air_to_air/platforms/brawler_test.txt:139-142`　（同签名共 2 处，另见 `air_to_air/platforms/brawler_test.txt:476`）
- **片段**：

```text
   processor tsk_mgr WSF_TASK_PROCESSOR 
      on
      internal_link data_mgr
   end_processor
```

- **演示要点**：演示 WSF_TASK_PROCESSOR 的参数：on, internal_link

### processor · WSF_GROUND_TARGET_FUSE｜处理器

- **关键词**：processor, WSF_GROUND_TARGET_FUSE, max_time_of_flight_to_detonate, proximity_all_on_loss_of_target, 处理器
- **出处**：`alv_routing/platforms/alv.txt:125-128`　（同签名共 4 处，另见 `satellite_demos/scenarios/gps_denied.txt:198`、`script_demos/script_demo_7.txt:164`、`script_demos/script_demo_6.txt:66`）
- **片段**：

```text
   processor fuse WSF_GROUND_TARGET_FUSE
      max_time_of_flight_to_detonate  100 min
      proximity_all_on_loss_of_target  # weapon keeps going even if target lost
   end_processor
```

- **演示要点**：演示 WSF_GROUND_TARGET_FUSE 的参数：max_time_of_flight_to_detonate, proximity_all_on_loss_of_target

### processor（fighter_bomber）｜处理器

- **关键词**：processor, off, update_interval, 处理器
- **出处**：`alv_routing/platforms/fighter_bomber.txt:65-68`　（同签名共 5 处，另见 `satellite_demos/scenarios/gps_denied.txt:527`、`script_demos/script_demo_5.txt:384`、`script_demos/script_demo_6.txt:384`）
- **片段**：

```text
   processor alv-launch-computer ALV_LAUNCH_COMPUTER
     off
     update_interval 1 sec
   end_processor
```

- **演示要点**：演示 processor 的参数：off, update_interval

### processor · WSF_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TRACK_PROCESSOR, purge_interval, update_interval, 处理器
- **出处**：`bearing_only/platforms/commander_platform.txt:51-54`　（同签名共 8 处，另见 `base_types/platforms/awacs.txt:78`、`base_types/platforms/blue_adv_fighter_1_base.txt:47`、`base_types/platforms/blue_multirole_fighter_1_base.txt:70`）
- **片段**：

```text
  processor data_mgr WSF_TRACK_PROCESSOR
    purge_interval       60 sec
    update_interval 5 secs
  end_processor
```

- **演示要点**：演示 WSF_TRACK_PROCESSOR 的参数：purge_interval, update_interval

### processor · WSF_LINKED_PROCESSOR｜处理器

- **关键词**：processor, WSF_LINKED_PROCESSOR, report_to, update_interval, 处理器
- **出处**：`bearing_only/platforms/fuser_platform2.txt:56-59`
- **片段**：

```text
  processor reporter WSF_LINKED_PROCESSOR
   report_to commander via cmdr_net to sub_net
   update_interval  10 sec
   end_processor
```

- **演示要点**：演示 WSF_LINKED_PROCESSOR 的参数：report_to, update_interval

### processor · WSF_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TRACK_PROCESSOR, internal_link, purge_interval, 处理器
- **出处**：`ciws/platforms/ship.txt:36-39`　（同签名共 6 处，另见 `gun_engagement/platforms/gun_battery.txt:35`、`wargame/platforms/bomber.txt:25`、`wargame/platforms/fighter.txt:25`）
- **片段**：

```text
  processor track_mgr WSF_TRACK_PROCESSOR
    internal_link gun
    purge_interval       60 sec
  end_processor
```

- **演示要点**：演示 WSF_TRACK_PROCESSOR 的参数：internal_link, purge_interval

### processor · WSF_WEAPON_FUSE｜处理器

- **关键词**：processor, WSF_WEAPON_FUSE, proximity_all_on_loss_of_target, detonate_below_height_agl, 处理器
- **出处**：`cyber/avengers_detonate_effect.txt:20-23`　（同签名共 2 处，另见 `cyber/weapons/agm/client_agm.txt:192`）
- **片段**：

```text
   processor fuse WSF_WEAPON_FUSE
      proximity_all_on_loss_of_target
      detonate_below_height_agl 1 m
   end_processor
```

- **演示要点**：演示 WSF_WEAPON_FUSE 的参数：proximity_all_on_loss_of_target, detonate_below_height_agl

### processor · WSF_AIR_TARGET_FUSE｜处理器

- **关键词**：processor, WSF_AIR_TARGET_FUSE, hit_proximity_range, debug, 处理器
- **出处**：`cyber/GoneFishing_ConstraintDemo.txt:52-55`
- **片段**：

```text
  processor fuse  WSF_AIR_TARGET_FUSE   
      hit_proximity_range 2500 m
      debug
  end_processor
```

- **演示要点**：演示 WSF_AIR_TARGET_FUSE 的参数：hit_proximity_range, debug

### processor · WSF_LINKED_PROCESSOR｜处理器

- **关键词**：processor, WSF_LINKED_PROCESSOR, on, external_link, 处理器
- **出处**：`distributed_operations/xio_setup.txt:34-37`
- **片段**：

```text
   processor link-proc WSF_LINKED_PROCESSOR
      on
      external_link commander via com1
   end_processor
```

- **演示要点**：演示 WSF_LINKED_PROCESSOR 的参数：on, external_link

### processor · WSF_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TRACK_PROCESSOR, report_to, raw_track_reporting, 处理器
- **出处**：`electronic_warfare/jam_strobe_direction_finder.txt:101-104`　（同签名共 2 处，另见 `sensor_demos/passive_detector_df_demo.txt:186`）
- **片段**：

```text
   processor data_manager WSF_TRACK_PROCESSOR
      report_to commander via datalink
      raw_track_reporting on
   end_processor
```

- **演示要点**：演示 WSF_TRACK_PROCESSOR 的参数：report_to, raw_track_reporting

### processor（ttr_test）｜处理器

- **关键词**：processor, show_task_messages, show_state_transitions, 处理器
- **出处**：`iads/ttr_test.txt:40-43`　（同签名共 2 处，另见 `iads/ttr_test.txt:74`）
- **片段**：

```text
   processor task_mgr
      show_task_messages
      show_state_transitions
   end_processor
```

- **演示要点**：演示 processor 的参数：show_task_messages, show_state_transitions

### processor · WSF_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TRACK_PROCESSOR, purge_interval, circular_report_rejection, 处理器
- **出处**：`iads_c2_demos/platforms/iads_cmdr.txt:21-24`
- **片段**：

```text
   processor track_manager WSF_TRACK_PROCESSOR
      purge_interval             60    seconds
      circular_report_rejection on
   end_processor
```

- **演示要点**：演示 WSF_TRACK_PROCESSOR 的参数：purge_interval, circular_report_rejection

### processor · WSF_IMAGE_PROCESSOR｜处理器

- **关键词**：processor, WSF_IMAGE_PROCESSOR, debug, internal_link, 处理器
- **出处**：`iads_c2_demos/platforms/ucav.txt:32-35`　（同签名共 2 处，另见 `sensor_demos/platforms/uav_sar.txt:71`）
- **片段**：

```text
  processor image_proc WSF_IMAGE_PROCESSOR
     debug
     internal_link data_mgr
  end_processor
```

- **演示要点**：演示 WSF_IMAGE_PROCESSOR 的参数：debug, internal_link

### processor（missile_ship）｜处理器

- **关键词**：processor, operating_level, weapon_uplink_path, 处理器
- **出处**：`new_guidance/platforms/missile_ship.txt:48-51`　（同签名共 3 处，另见 `ship_ad/platforms/missile_ship.txt:55`、`ship_ad/platforms/red_missile_destroyer.txt:59`）
- **片段**：

```text
  processor task_mgr MISSILE_SHIP_TASK_MGR
     operating_level ENGAGE 1
     weapon_uplink_path sr_sam_fcr_1 ssm_missile_uplink
  end_processor
```

- **演示要点**：演示 processor 的参数：operating_level, weapon_uplink_path

### processor · WSF_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TRACK_PROCESSOR, update_interval, report_to, 处理器
- **出处**：`satellite_demos/scenarios/gps_denied.txt:463-466`　（同签名共 5 处，另见 `script_demos/script_demo_2.txt:353`、`script_demos/script_demo_5.txt:321`、`script_demos/script_demo_6.txt:321`）
- **片段**：

```text
   processor track-proc WSF_TRACK_PROCESSOR
      update_interval 2 sec
      report_to command_chain GOOD_GUYS subordinates via xmtr-1 to rcvr-1
   end_processor
```

- **演示要点**：演示 WSF_TRACK_PROCESSOR 的参数：update_interval, report_to

### processor（script_demo_2）｜处理器

- **关键词**：processor, on, update_interval, 处理器
- **出处**：`script_demos/script_demo_2.txt:494-497`
- **片段**：

```text
   processor bomb_1000_lb-launch-computer BOMB_1000_LB_LAUNCH_COMPUTER
     on
     update_interval 2 sec
   end_processor
```

- **演示要点**：演示 processor 的参数：on, update_interval

### processor · WSF_PERFECT_TRACKER｜处理器

- **关键词**：processor, WSF_PERFECT_TRACKER, update_interval, internal_link, 处理器
- **出处**：`ship_ad/weapons/sam/red_sr_sam_2.txt:68-71`
- **片段**：

```text
  processor seeker WSF_PERFECT_TRACKER
     update_interval 1.0 sec
     internal_link data_mgr
  end_processor
```

- **演示要点**：演示 WSF_PERFECT_TRACKER 的参数：update_interval, internal_link

### processor · WSF_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TRACK_PROCESSOR, non_master_track_processor, uncorrelated_track_drops, 处理器
- **出处**：`space_operations/platforms/starlink_linkable.txt:48-51`
- **片段**：

```text
   processor track-proc WSF_TRACK_PROCESSOR
      non_master_track_processor
      uncorrelated_track_drops enable
   end_processor
```

- **演示要点**：演示 WSF_TRACK_PROCESSOR 的参数：non_master_track_processor, uncorrelated_track_drops

### processor · WSF_AIR_TARGET_FUSE｜处理器

- **关键词**：processor, WSF_AIR_TARGET_FUSE, time_of_flight_to_arm, coast_time_on_loss_of_target, 处理器
- **出处**：`suppressor/weapons/sam/missile.txt:118-121`
- **片段**：

```text
  processor fuze WSF_AIR_TARGET_FUSE
    time_of_flight_to_arm            10.0 sec     // Don't arm during the boost phase
    coast_time_on_loss_of_target      4.0 sec
  end_processor
```

- **演示要点**：演示 WSF_AIR_TARGET_FUSE 的参数：time_of_flight_to_arm, coast_time_on_loss_of_target

### processor · WSF_AIR_TARGET_FUSE｜处理器

- **关键词**：processor, WSF_AIR_TARGET_FUSE, gross_update_interval, fine_update_interval, 处理器
- **出处**：`base_types/weapons/other/gun.txt:34-38`　（同签名共 2 处，另见 `brawler/weapons/other/gun.txt:34`）
- **片段**：

```text
   processor   fuse   WSF_AIR_TARGET_FUSE
     #update_interval   0.01 sec
      gross_update_interval 0.10 sec
      fine_update_interval 0.01 sec
   end_processor
```

- **演示要点**：演示 WSF_AIR_TARGET_FUSE 的参数：gross_update_interval, fine_update_interval

### processor · WSF_GROUND_TARGET_FUSE｜处理器

- **关键词**：processor, WSF_GROUND_TARGET_FUSE, time_of_flight_to_arm, maximum_time_of_flight, 处理器
- **出处**：`hellfire/active_radar_hellfire/hellfire_type.txt:121-125`　（同签名共 4 处，另见 `hellfire/laser_designation_via_dis/hellfire_type.txt:115`、`hellfire/semiactive_laser_hellfire/hellfire_type.txt:114`、`laser_designator/weapons/agm/hellfire.txt:61`）
- **片段**：

```text
   processor hellfire_fuse WSF_GROUND_TARGET_FUSE
      #debug
      time_of_flight_to_arm  0.4 sec
      maximum_time_of_flight 5.0 min
   end_processor
```

- **演示要点**：演示 WSF_GROUND_TARGET_FUSE 的参数：time_of_flight_to_arm, maximum_time_of_flight

### processor（red_naval_helicopter）｜处理器

- **关键词**：processor, purge_interval, report_to, 处理器
- **出处**：`new_guidance/platforms/red_naval_helicopter.txt:52-56`　（同签名共 2 处，另见 `ship_ad/platforms/red_naval_helicopter.txt:52`）
- **片段**：

```text
  processor data_mgr RED_NAVAL_HELICOPTER_DATA_MGR
    purge_interval      60 sec

    report_to commander via datalink
  end_processor
```

- **演示要点**：演示 processor 的参数：purge_interval, report_to

### processor（blue_naval_sam_battery）｜处理器

- **关键词**：processor, show_state_transitions, on_initialize, 处理器
- **出处**：`space_operations/platforms/blue_naval_sam_battery.txt:45-50`　（同签名共 2 处，另见 `ballistic_missile_shootdown/platforms/blue_naval_sam_battery.txt:45`）
- **片段**：

```text
   processor task_mgr ANTI_BALLISTIC_MISSILE_PROCESSOR
      show_state_transitions
      on_initialize
         WEAPON_NAME              =  "blue_naval_sam";
      end_on_initialize
   end_processor
```

- **演示要点**：演示 processor 的参数：show_state_transitions, on_initialize

### processor · WSF_SCRIPT_PROCESSOR｜处理器

- **关键词**：processor, WSF_SCRIPT_PROCESSOR, update_interval, on_update, 处理器
- **出处**：`satellite_demos/5th_iridium_flares_demo.txt:252-257`　（同签名共 8 处，另见 `space_operations/attitude_control.txt:109`、`visual_part/red_tank.txt:23`、`cyber/GoneFishing_ConstraintDemo.txt:67`）
- **片段**：

```text
   processor CheckFlaresProcessor WSF_SCRIPT_PROCESSOR
      update_interval 10 s
      on_update
         CheckFlares();
      end_on_update
   end_processor
```

- **演示要点**：演示 WSF_SCRIPT_PROCESSOR 的参数：update_interval, on_update

### processor · WSF_AIR_TARGET_FUSE｜处理器

- **关键词**：processor, WSF_AIR_TARGET_FUSE, gross_proximity_range, hit_proximity_range, 处理器
- **出处**：`engage/weapons/lrsam.txt:121-126`
- **片段**：

```text
   processor fuse WSF_AIR_TARGET_FUSE
      #max_time_of_flight_to_detonate   320 sec
      #coast_time_on_loss_of_target    4.0
      gross_proximity_range  100 km
      hit_proximity_range   90 km
   end_processor
```

- **演示要点**：演示 WSF_AIR_TARGET_FUSE 的参数：gross_proximity_range, hit_proximity_range

### processor（missile_ship）｜处理器

- **关键词**：processor, operating_level, on_initialize, 处理器
- **出处**：`new_guidance/platforms/missile_ship.txt:59-64`　（同签名共 3 处，另见 `ship_ad/platforms/missile_ship.txt:66`、`ship_ad/platforms/red_missile_destroyer.txt:70`）
- **片段**：

```text
  processor ssm_task_mgr NAVAL_SSM_TACTICS
     operating_level ENGAGE 1
     on_initialize
        WEAPON_NAME          = "ssm";
     end_on_initialize
  end_processor
```

- **演示要点**：演示 processor 的参数：operating_level, on_initialize

### processor · WSF_GUIDANCE_COMPUTER｜处理器

- **关键词**：processor, WSF_GUIDANCE_COMPUTER, guide_to_truth, update_interval, 处理器
- **出处**：`hellfire/active_radar_hellfire/hellfire_type.txt:104-110`　（同签名共 3 处，另见 `hellfire/laser_designation_via_dis/hellfire_type.txt:98`、`hellfire/semiactive_laser_hellfire/hellfire_type.txt:97`）
- **片段**：

```text
   processor hellfire_autopilot WSF_GUIDANCE_COMPUTER
      #debug
      #show_status
      guide_to_truth false # Use track location, not truth.
      update_interval              0.01 s
      /* Flesh out the details in a derived object type. */
   end_processor
```

- **演示要点**：演示 WSF_GUIDANCE_COMPUTER 的参数：guide_to_truth, update_interval

### processor · WSF_PERCEPTION_PROCESSOR｜处理器

- **关键词**：processor, WSF_PERCEPTION_PROCESSOR, script_debug_writes, asset_perception, 处理器
- **出处**：`brawler/platforms/gci_cmdr.txt:34-43`
- **片段**：

```text
   processor perception WSF_PERCEPTION_PROCESSOR
      script_debug_writes      off
#      reporting_self           false
#      reporting_others         false
      asset_perception         status_messages
#      asset_update_interval     5 sec
#      max_asset_load          100
#      threat_update_interval    5 sec
#      max_threat_load         100
   end_processor
```

- **演示要点**：演示 WSF_PERCEPTION_PROCESSOR 的参数：script_debug_writes, asset_perception

### processor · WSF_TASK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TASK_PROCESSOR, evaluation_interval, state, 处理器
- **出处**：`multiresolution_demos/processors/processor_include.txt:43-52`　（同签名共 4 处，另见 `cyber/platforms/spotter.txt:31`、`outer_air_battle/platforms/bomber.txt:52`、`engage/grid_react_man.txt:72`）
- **片段**：

```text
processor LOW_FIDELITY_TASK_PROCESSOR WSF_TASK_PROCESSOR
   evaluation_interval MOVING 10.0 sec
   state MOVING
      on_entry
         PLATFORM.GoToSpeed(250.0);
         PLATFORM.GoToLocation(0.3, 0.0, 6096.0);
         writeln("Using low-fidelity task processor, heading straight to specified location.");
      end_on_entry
   end_state
end_processor
```

- **演示要点**：演示 WSF_TASK_PROCESSOR 的参数：evaluation_interval, state

### processor（commander）｜处理器

- **关键词**：processor, on_message, internal_link, 处理器
- **出处**：`space_operations/platforms/commander.txt:12-21`
- **片段**：

```text
   processor image_proc IMAGE_PROC
      on_message
         default
         script
            #writeln("COMMANDER GOT A MESSAGE");
         end_script
      end_on_message

      internal_link track_mgr
   end_processor
```

- **演示要点**：演示 processor 的参数：on_message, internal_link

### processor · WSF_SCRIPT_PROCESSOR｜处理器

- **关键词**：processor, WSF_SCRIPT_PROCESSOR, off, on_message, 处理器
- **出处**：`distributed_operations/xio_setup.txt:38-48`
- **片段**：

```text
   processor dumper WSF_SCRIPT_PROCESSOR
      off
      on_message
        default
           script  # Writes all received message to output
              writeln("T=", TIME_NOW, " ", PLATFORM.Name(),
                      " Received ", MESSAGE.Type(), " from ",
                      MESSAGE.Originator());
           end_script
      end_on_message
   end_processor
```

- **演示要点**：演示 WSF_SCRIPT_PROCESSOR 的参数：off, on_message

### processor · WSF_INTERSECT_PROCESSOR｜处理器

- **关键词**：processor, WSF_INTERSECT_PROCESSOR, define_offset, intersect_mesh, 处理器
- **出处**：`hel/intersect_mesh_test.txt:302-312`　（同签名共 2 处，另见 `hel/intersect_processor.txt:11`）
- **片段**：

```text
   processor RED_ADV_FIGHTER_2isector WSF_INTERSECT_PROCESSOR
     define_offset CANOPY
         3.461642 m
         0.000184 m
        -0.943480 m
     define_offset IRST
         5.138014 m
         0.000005 m
        -0.629733 m
     intersect_mesh ./mesh/red_adv_fighter_2.imesh
   end_processor
```

- **演示要点**：演示 WSF_INTERSECT_PROCESSOR 的参数：define_offset, intersect_mesh

### processor · WSF_SCRIPT_PROCESSOR｜处理器

- **关键词**：processor, WSF_SCRIPT_PROCESSOR, on_initialize, on_message, 处理器
- **出处**：`multiresolution_demos/processors/processor_include.txt:15-25`　（同签名共 2 处，另见 `multiresolution_demos/processors/processor_include.txt:29`）
- **片段**：

```text
      processor WSF_SCRIPT_PROCESSOR
         on_initialize
            writeln("Initializing low_fidelity_model script processor");
         end_on_initialize
         on_message
            default
            script
               writeln(PLATFORM.Name(), " received low fidelity message from ", MESSAGE.Originator(), " with tag ", MESSAGE.DataTag());
            end_script
         end_on_message
      end_processor
```

- **演示要点**：演示 WSF_SCRIPT_PROCESSOR 的参数：on_initialize, on_message

### processor（group_comm_example）｜处理器

- **关键词**：processor, script, for, 处理器
- **出处**：`comm/group_comm_example.txt:65-78`
- **片段**：

```text
   processor track_proc BASIC_TRACK_PROC
      script bool is_track_reportable(WsfTrack aTrack)
         writeln("T=",TIME_NOW," P=",PLATFORM.Name()," checking if ",aTrack.TargetName()," is reportable: YES");
         return true;
      end_script

      script void on_update()
      writeln(PLATFORM.Name());
      for (int i = 0; i < PLATFORM.MasterTrackList().TrackCount(); i = i + 1)
      {
         writeln(" * ", PLATFORM.MasterTrackList().TrackEntry(i).TrackId().ToString());
      }
      end_script
   end_processor
```

- **演示要点**：演示 processor 的参数：script, for

### processor · WSF_GUIDANCE_COMPUTER｜处理器

- **关键词**：processor, WSF_GUIDANCE_COMPUTER, guide_to_truth, phase, 处理器
- **出处**：`engage/weapons/lrsam.txt:27-41`　（同签名共 5 处，另见 `base_types/weapons/ssm/blue_cruise_missile.txt:71`、`base_types/weapons/sam/blue_naval_sam.txt:139`、`base_types/weapons/sam/blue_lr_sam_common.txt:264`）
- **片段**：

```text
processor LRSAM_GUIDANCE WSF_GUIDANCE_COMPUTER

   # No datalink or seeker is being used, so we must guide to the true target
   guide_to_truth                      true

   phase LAUNCH
      guidance_delay                   100.0 sec
      next_phase TERMINAL when phase_time >= 0.8 sec
   end_phase

   phase TERMINAL
      proportional_navigation_gain     4.0
      g_bias                           1.0
   end_phase
end_processor
```

- **演示要点**：演示 WSF_GUIDANCE_COMPUTER 的参数：guide_to_truth, phase

### processor · WSF_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TRACK_PROCESSOR, purge_interval, on_message, 处理器
- **出处**：`electronic_warfare/comm_jamming.txt:169-183`
- **片段**：

```text
   processor track-proc WSF_TRACK_PROCESSOR
      purge_interval 60 sec
    
      on_message 
         type WSF_TRACK_MESSAGE
            script
               WsfTrackMessage trackMsg = (WsfTrackMessage)MESSAGE;
               writeln("T=", TIME_NOW, " Received track: ", trackMsg.Track().TrackId().ToString());
            end_script
            default
               script
                  writeln("T=", TIME_NOW, " Received other message");
         end_script
      end_on_message
   end_processor
```

- **演示要点**：演示 WSF_TRACK_PROCESSOR 的参数：purge_interval, on_message

### processor · WSF_SCRIPT_PROCESSOR｜处理器

- **关键词**：processor, WSF_SCRIPT_PROCESSOR, on_initialize, on_update, 处理器
- **出处**：`space_operations/platforms/starlink_linkable.txt:113-128`
- **片段**：

```text
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

- **演示要点**：演示 WSF_SCRIPT_PROCESSOR 的参数：on_initialize, on_update

### processor（ww_lead_tasker）｜处理器

- **关键词**：processor, script_variables, behavior_tree, 处理器
- **出处**：`base_types/processors/quantum_agents/aiww/ww_lead_tasker.txt:21-38`
- **片段**：

```text
processor WW_LEAD_TASKER  AI_QUANTUM_TASKER

   script_variables
     #extern Array<Map<string, Object>> mWeaponArray;
   end_script_variables

   behavior_tree
      selector
         behavior_node  buddy_evade
         behavior_node  go_home
         behavior_node  pursue_weapon_task_target
        #behavior_node  pursue-point
         behavior_node  planned_route
      end_selector
      behavior_node  buddy_engage_weapon_task_target
   end_behavior_tree

end_processor
```

- **演示要点**：演示 processor 的参数：script_variables, behavior_tree

### processor（sr_sam_telar）｜处理器

- **关键词**：processor, number_of_servers, on_initialize, 处理器
- **出处**：`cyber/platforms/sr_sam_telar.txt:20-37`　（同签名共 2 处，另见 `orwaca_iads/platforms/sr_sam_telar.txt:20`）
- **片段**：

```text
processor SR_SAM_TELAR_TASK_MGR TELAR_TASK_MGR
   number_of_servers            4

   #script_debug_writes on
   #show_state_transitions
   #show_task_messages

   on_initialize
      ACQ_SENSOR_NAME         = "sr_sam_acq_radar_sensor";
      SENSOR_NAME             = "sr_sam_ttr_radar_sensor";
      REQUIRED_TRACK_QUALITY  = 0.75;
      SENSOR_ACQUIRE_MODE     = "ACQUIRE";
      SENSOR_TRACK_MODE       = "TRACK";
      WEAPON_NAME             = "sam";
      ENVELOPE                = "full_kinematic";
      SALVO_SIZE              = 1;
   end_on_initialize
end_processor
```

- **演示要点**：演示 processor 的参数：number_of_servers, on_initialize

### processor · WSF_TASK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TASK_PROCESSOR, update_interval, on_update, 处理器
- **出处**：`laser_designator/platforms/apc.txt:35-52`
- **片段**：

```text
   processor task_proc WSF_TASK_PROCESSOR
       update_interval 10 sec
       on_update
           WsfLocalTrackList localtracklist = PLATFORM.MasterTrackList();
           WsfTrackList        rawtracklist =  PLATFORM.MasterRawTrackList();
           if (localtracklist.Count() > 0)
       {          
          foreach (WsfTrack rawtrack in rawtracklist)
          {
            if (rawtrack.IsValid())
            {
               #writeln(TIME_NOW, " ", PLATFORM.Name()," WE ARE BEING LASED!!!");
               PLATFORM.Comment("I'm being lased!!!");
            }
          }
       }
       end_on_update
   end_processor
```

- **演示要点**：演示 WSF_TASK_PROCESSOR 的参数：update_interval, on_update

### processor · WSF_SCRIPT_PROCESSOR｜处理器

- **关键词**：processor, WSF_SCRIPT_PROCESSOR, script, execute, 处理器
- **出处**：`space_operations/processors/change_sig.txt:14-33`
- **片段**：

```text
processor CHANGE_SIG WSF_SCRIPT_PROCESSOR
   script void announce(string stage)
      writeln("LAUNCH FACILITY: ", PLATFORM.Name(), " added ", stage, " at time ", TIME_NOW);
   end_script

   execute at_time /variable first_stage_time /default 2000 s absolute
      PLATFORM.SetSignatureState("FIRST_STAGE");
      announce("FIRST_STAGE");
   end_execute

   execute at_time /variable second_stage_time /default 4000 s absolute
      PLATFORM.SetSignatureState("SECOND_STAGE");
      announce("SECOND_STAGE");
   end_execute

   execute at_time /variable third_stage_time /default 6000 s absolute
      PLATFORM.SetSignatureState("THIRD_STAGE");
      announce("THIRD_STAGE");
   end_execute
end_processor
```

- **演示要点**：演示 WSF_SCRIPT_PROCESSOR 的参数：script, execute

### processor · WSF_IMAGE_PROCESSOR｜处理器

- **关键词**：processor, WSF_IMAGE_PROCESSOR, script_variables, on_message, 处理器
- **出处**：`example_scripts/output_file_demo.txt:66-89`　（同签名共 2 处，另见 `space_operations/processors/image_proc.txt:12`）
- **片段**：

```text
   processor image_proc WSF_IMAGE_PROCESSOR
      script_variables
        FileIO gOut = FileIO();
      end_script_variables

      on_message
         script
            WsfVideoMessage msg = (WsfVideoMessage)MESSAGE;
#            writeln("Message received. Object Count is ", msg.Image().ObjectCount());
            for (int i = 0; i < msg.Image().ObjectCount(); i = i + 1)
            {
               int pixel_count = msg.Image().PixelCount(i);
               WsfPlatform f4_phantom = WsfSimulation.FindPlatform("f4_phantom");
               double range_in_nm = PLATFORM.GroundRangeTo(f4_phantom)*0.000539957;
#               writeln(PLATFORM.Name(), " detected ", pixel_count, " pixels at a range of ", range_in_nm, " nm");
               gOut.Open(PLATFORM.AuxDataString("outputFileName"), "append");
               string pixel_count_string = (string)pixel_count;
               string range_in_nm_string = (string)range_in_nm;
               string write = range_in_nm_string + " " + pixel_count_string;
               gOut.Writeln(write);
            }
         end_script
      end_on_message
   end_processor
```

- **演示要点**：演示 WSF_IMAGE_PROCESSOR 的参数：script_variables, on_message

### processor · WSF_TASK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TASK_PROCESSOR, script, execute, 处理器
- **出处**：`fires/time_on_target.txt:22-49`
- **片段**：

```text
processor CMDR_TASK_PROC WSF_TASK_PROCESSOR

   script void SetTask(WsfPlatform aPlatform,
                       WsfTrack    aTrack)
      string weaponName = aPlatform.WeaponEntry(0).Name();
      WsfWeaponTask task = WsfWeaponTask.Create("TIME_ON_TARGET", weaponName);
      task.SetQuantity(1);
      task.SetCommDevice("perfect");
      task.SetAssignee(aPlatform.Name());
      AssignTask(aTrack, task);
   end_script

   execute at_time 1.0 sec absolute
      WsfPlatform target = WsfSimulation.FindPlatform("target-1");
      WsfTrack targetTrack = target.MakeTrack();
      targetTrack.SetAuxData("IMPACT_TIME", 120.0);  // sim time of two minutes.
      PLATFORM.SetCurrentTarget(targetTrack);
      foreach(WsfPlatform subordinate in PLATFORM.Subordinates())
      {
         SetTask(subordinate, targetTrack);
      }
   end_execute

   script void on_task_complete(WsfTask aTask)
      writeln("Task ", aTask.TaskId(), " , assigned to ", aTask.Assignee(), " complete.");
   end_script

end_processor
```

- **演示要点**：演示 WSF_TASK_PROCESSOR 的参数：script, execute

### processor · WSF_P6DOF_GUIDANCE_COMPUTER｜处理器

- **关键词**：processor, WSF_P6DOF_GUIDANCE_COMPUTER, update_interval, phase, 处理器
- **出处**：`p6dof/platforms/aam-sr.txt:73-100`　（同签名共 3 处，另见 `p6dof/platforms/aam-sr-tvc.txt:65`、`p6dof/platforms/aam-mr.txt:66`）
- **片段**：

```text
   processor guidance WSF_P6DOF_GUIDANCE_COMPUTER

      update_interval 0.01 sec

      phase LAUNCH_GUIDANCE
         time_constant                   0.1 sec
         proportional_navigation_gain    4
         velocity_pursuit_gain           10
         g_bias                          0
         next_phase PHASE2 when phase_time > 0.5 sec
      end_phase

      phase PHASE2
         time_constant                   0.01 sec
         proportional_navigation_gain    4
         velocity_pursuit_gain           10
         g_bias                          2
         next_phase TERMINAL_GUIDANCE when range_to_intercept < 5.0 km
      end_phase

      phase TERMINAL_GUIDANCE
         time_constant                   0 sec
         proportional_navigation_gain    4
         velocity_pursuit_gain           10
         g_bias                          0
      end_phase

   end_processor
```

- **演示要点**：演示 WSF_P6DOF_GUIDANCE_COMPUTER 的参数：update_interval, phase

### processor · WSF_SIX_DOF_GUIDANCE_COMPUTER｜处理器

- **关键词**：processor, WSF_SIX_DOF_GUIDANCE_COMPUTER, update_interval, phase, 处理器
- **出处**：`six_dof/platforms/aam-sr.txt:37-64`　（同签名共 9 处，另见 `six_dof/platforms/aam-sr.txt:77`、`six_dof/platforms/sam-mr.txt:95`、`six_dof/platforms/aam-sr-tvc.txt:29`）
- **片段**：

```text
   processor guidance WSF_SIX_DOF_GUIDANCE_COMPUTER

      update_interval 0.01 sec

      phase LAUNCH_GUIDANCE
         time_constant                   0.1 sec
         proportional_navigation_gain    4
         velocity_pursuit_gain           10
         g_bias                          0
         next_phase PHASE2 when phase_time > 0.5 sec
      end_phase

      phase PHASE2
         time_constant                   0.01 sec
         proportional_navigation_gain    4
         velocity_pursuit_gain           10
         g_bias                          2
         next_phase TERMINAL_GUIDANCE when range_to_intercept < 5.0 km
      end_phase

      phase TERMINAL_GUIDANCE
         time_constant                   0 sec
         proportional_navigation_gain    4
         velocity_pursuit_gain           10
         g_bias                          0
      end_phase

   end_processor
```

- **演示要点**：演示 WSF_SIX_DOF_GUIDANCE_COMPUTER 的参数：update_interval, phase

### processor · WSF_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TRACK_PROCESSOR, master_track_processor, on_message, 处理器
- **出处**：`space_operations/platforms/sat_sensor.txt:31-61`
- **片段**：

```text
   processor track_mgr WSF_TRACK_PROCESSOR
      master_track_processor
      on_message
         type WSF_TRACK_DROP_MESSAGE
            script
               WsfTrackDropMessage dropMessage = (WsfTrackDropMessage)MESSAGE;
               string name = WsfSimulation.FindPlatform(dropMessage.TargetIndex()).Name();
#               writeln(PLATFORM.Name() + "had dropped tracking: " + name);

               WsfComm otherComm = WsfSimulation.FindPlatform(name).CommEntry(0);
               WsfComm myComm = PLATFORM.Comm(PLATFORM.Name());
               if(myComm.IsConnectedTo(otherComm.GetAddress()))
               {
                  myComm.RemoveConnection(otherComm.GetAddress());
               }
            end_script
         type WSF_TRACK_MESSAGE
            script
               WsfTrackMessage trackMessage = (WsfTrackMessage)MESSAGE;
               string name = trackMessage.Track().Target().Name();
#               writeln(PLATFORM.Name() + "is now tracking: " + name);

               WsfComm otherComm = WsfSimulation.FindPlatform(name).CommEntry(0);
               WsfComm myComm = PLATFORM.Comm(PLATFORM.Name());
               if(!myComm.IsConnectedTo(otherComm.GetAddress()))
               {
                  myComm.AddConnection(otherComm.GetAddress());
               }
            end_script
      end_on_message
   end_processor
```

- **演示要点**：演示 WSF_TRACK_PROCESSOR 的参数：master_track_processor, on_message

### processor · WSF_TASK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TASK_PROCESSOR, script_variables, script, 处理器
- **出处**：`cyber/processors/red_radar_tactics.txt:18-58`
- **片段**：

```text
processor RED_RADAR_TACTICS WSF_TASK_PROCESSOR

   script_variables
      bool cEVALUATE_EMCON_TURN_OFF = false;
   end_script_variables

   script void EvaluateEmcon()
     int sensorCount = PLATFORM.SensorCount();
     if (sensorCount > 0)
     {
        WsfSensor sensor = PLATFORM.SensorEntry(0);
        if (sensor.IsTurnedOff())
        {
           // sensor is off.  Turn it on if we've received a task or
           // we are put on alert
           if ((TasksReceived() > 0) ||
               (OperatingLevelFor("ENGAGE") > 0))
           {
              for (int entry = 0; entry < sensorCount; entry = entry + 1)
              {
                 PLATFORM.SensorEntry(entry).TurnOn();
              }
           }
        }
     }
   end_script

   // evaluate emcon whenever we have a change in assignment or alert level
   script void on_task_assign(WsfTask aTask, WsfTrack aTrack)
      ExecuteScriptAtTime(TIME_NOW + RANDOM.Uniform(0.0, 4.0), "EvaluateEmcon");
   end_script

   script void on_task_cancel(WsfTask aTask)
      ExecuteScriptAtTime(TIME_NOW + RANDOM.Uniform(0.0, 4.0), "EvaluateEmcon");
   end_script

   script void on_operating_level_change(string aName)
      ExecuteScriptAtTime(TIME_NOW + RANDOM.Uniform(0.0, 4.0), "EvaluateEmcon");
   end_script

end_processor
```

- **演示要点**：演示 WSF_TASK_PROCESSOR 的参数：script_variables, script

### processor · WSF_GUIDANCE_COMPUTER｜处理器

- **关键词**：processor, WSF_GUIDANCE_COMPUTER, show_status, phase, 处理器
- **出处**：`new_guidance/weapons/agm/blue_asm_missile.txt:65-115`
- **片段**：

```text
   processor guidance WSF_GUIDANCE_COMPUTER
      show_status
      #show_evaluations
      #debug

      phase CRUISE
         allow_route_following    true
         commanded_altitude       75 m
         commanded_speed          537 mph

         next_phase POPUP when target_slant_range < 3000 m
         next_phase POPUP when target_slant_range < 3000 m

 /*
         next_phase POPUP when phase_time > 1000 sec
         next_phase POPUP when altitude > 100000 m
         next_phase POPUP when speed    > 100000 m/s
         next_phase POPUP when target_altitude > 100000 m
         next_phase POPUP when target_speed    > 100000 m/s
         next_phase POPUP when closing_speed > 100000 m/s
         next_phase POPUP when time_to_intercept < 1 sec
         next_phase POPUP when range_to_intercept < 1 m
         next_phase POPUP when target_slant_range < 1 m
         next_phase POPUP when target_ground_range < 1 m
         next_phase POPUP when target_azimuth > 179 deg
         next_phase POPUP when target_elevation > 89 deg
         next_phase POPUP when los_target_azimuth > 179 deg
         next_phase POPUP when los_target_elevation > 89 deg
         next_phase POPUP when los_target_angle > 179 deg
 */
         maximum_pitch_angle           50 deg
         proportional_navigation_gain  10.0

         velocity_pursuit_gain         10.0

      end_phase

      phase POPUP
         # Command a ridiculous altitude... we just go up until the target
         # elevation angle is correct...

         commanded_altitude 6000 m
         next_phase DIVE when target_elevation < -20 deg
         proportional_navigation_gain  10.0
         velocity_pursuit_gain         5.0
      end_phase

      phase DIVE
         velocity_pursuit_gain         5.0
      end_phase
   end_processor
```

- **演示要点**：演示 WSF_GUIDANCE_COMPUTER 的参数：show_status, phase

### processor · WSF_TASK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TASK_PROCESSOR, script_variables, on_message, 处理器
- **出处**：`new_guidance/platforms/announce_launch_tactics.txt:18-71`　（同签名共 2 处，另见 `ship_ad/platforms/announce_launch_tactics.txt:18`）
- **片段**：

```text
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

- **演示要点**：演示 WSF_TASK_PROCESSOR 的参数：script_variables, on_message

### processor · WSF_GUIDANCE_COMPUTER｜处理器

- **关键词**：processor, WSF_GUIDANCE_COMPUTER, script_variables, phase, 处理器
- **出处**：`alv_routing/platforms/alv.txt:65-123`
- **片段**：

```text
   processor guidance WSF_GUIDANCE_COMPUTER
      #show_status
      #show_evaluations
      #debug
      script_variables
         double TimeLeft = 1;
      end_script_variables
      phase DROP
         next_phase CRUISE when phase_time >= .1 sec
      end_phase

      phase CRUISE
         on_entry
            SetAllowRouteFollowing(true);

            if(PLATFORM.Name().Contains("_1"))
            {
               PLATFORM.SetRoute("bogus_route_1");
               SetCommandedMach(0.90);
#               SetCommandedAltitudeAGL(9000);
               SetMaximumCommandedGees(15);
            }
            else
            {
               PLATFORM.SetRoute("bogus_route_2");
               SetCommandedMach(0.91);
#               SetCommandedAltitudeAGL(9000);
               SetMaximumCommandedGees(15);
            }
            TimeLeft = 5800 - (PLATFORM.TimeSinceCreation()); # give time to get back to target
         end_on_entry
         next_phase OVER_TARGET if end_of_route
         next_phase TERMINAL1 if phase_time >=  /variable TimeLeft
         #next_phase TERMINAL when phase_time >= 100 min     # allow 9 minutes for target endpoint / ditch point
      end_phase
      phase OVER_TARGET
         on_entry
            SetAllowRouteFollowing(true);
            PLATFORM.SetRoute("final_route");
            SetCommandedMach(0.80);
            SetCommandedAltitude(11000);
            SetMaximumCommandedGees(10);
            TimeLeft = 5200 - (PLATFORM.TimeSinceCreation()); # give time to get back to target
         end_on_entry

           next_phase TERMINAL1 if phase_time >= /variable TimeLeft
           next_phase OVER_TARGET if end_of_route
      end_phase
      phase TERMINAL1
         on_entry
            SetCommandedAltitude(11000);
         end_on_entry
         maximum_commanded_g 15 g
         next_phase FINAL_DIVE when target_ground_range <= 7 km
      end_phase
      phase  FINAL_DIVE
         maximum_commanded_g 10 g
      end_phase
   end_processor
```

- **演示要点**：演示 WSF_GUIDANCE_COMPUTER 的参数：script_variables, phase

### processor · WSF_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TRACK_PROCESSOR, purge_interval, 处理器
- **出处**：`aea_iads/platforms/iads_cmdr.txt:14-16`　（同签名共 81 处，另见 `aea_iads/platforms/large_sam_battalion.txt:110`、`aea_iads/platforms/soj.txt:448`、`alternate_locations/platforms/single_large_sam.txt:58`）
- **片段**：

```text
processor IADS_CMDR_DATA_MGR WSF_TRACK_PROCESSOR
   purge_interval       60 sec
end_processor
```

- **演示要点**：演示 WSF_TRACK_PROCESSOR 的参数：purge_interval

### processor（iads_cmdr）｜处理器

- **关键词**：processor, operating_level, 处理器
- **出处**：`aea_iads/platforms/iads_cmdr.txt:145-147`　（同签名共 8 处，另见 `cyber/exfiltrate_demo/platforms/iads_cmdr.txt:152`、`electronic_warfare/test_false_targets/platforms/iads_cmdr.txt:146`、`iads/platforms/iads_cmdr.txt:143`）
- **片段**：

```text
   processor task_mgr IADS_CMDR_TASK_MGR
      operating_level ENGAGE 1
   end_processor
```

- **演示要点**：演示 processor 的参数：operating_level

### processor · WSF_THREAT_PROCESSOR｜处理器

- **关键词**：processor, WSF_THREAT_PROCESSOR, threat_time_to_intercept, 处理器
- **出处**：`air_to_air/platforms/brawler_test.txt:162-164`　（同签名共 4 处，另见 `air_to_air/platforms/brawler_test.txt:499`、`base_types/platforms/brawler/brawler_platform.txt:134`、`brawler/platforms/brawler_platform.txt:257`）
- **片段**：

```text
   processor incoming_threats WSF_THREAT_PROCESSOR
      threat_time_to_intercept 120 sec   #default: 60 sec
   end_processor
```

- **演示要点**：演示 WSF_THREAT_PROCESSOR 的参数：threat_time_to_intercept

### processor（hvaa）｜处理器

- **关键词**：processor, internal_link, 处理器
- **出处**：`air_to_air/platforms/hvaa.txt:118-120`
- **片段**：

```text
   processor tasker HVAA_TASKER
      internal_link data_mgr
   end_processor 
```

- **演示要点**：演示 processor 的参数：internal_link

### processor · WSF_AIR_TARGET_FUSE｜处理器

- **关键词**：processor, WSF_AIR_TARGET_FUSE, max_time_of_flight_to_detonate, 处理器
- **出处**：`air_to_air/weapons/aam/medium_range_radar_missile.txt:180-182`　（同签名共 32 处，另见 `air_to_air/weapons/aam/short_range_ir_missile.txt:149`、`alternate_locations/weapons/sam/large_sam.txt:35`、`base_types/weapons/aam/blue_sr_a2a_ir_missile.txt:79`）
- **片段**：

```text
   processor fuse WSF_AIR_TARGET_FUSE
      max_time_of_flight_to_detonate  120.0 sec
   end_processor
```

- **演示要点**：演示 WSF_AIR_TARGET_FUSE 的参数：max_time_of_flight_to_detonate

### processor · WSF_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TRACK_PROCESSOR, master_track_processor, 处理器
- **出处**：`air_to_air/weapons/aam/medium_range_radar_missile.txt:204-206`　（同签名共 14 处，另见 `base_types/platforms/brawler/brawler_flight_lead.txt:17`、`base_types/weapons/aam/medium_range_missile.txt:69`、`base_types/weapons/aam/medium_range_radar_missile.txt:161`）
- **片段**：

```text
   processor track_mgr WSF_TRACK_PROCESSOR
      master_track_processor
   end_processor
```

- **演示要点**：演示 WSF_TRACK_PROCESSOR 的参数：master_track_processor

### processor · WSF_PERFECT_TRACKER｜处理器

- **关键词**：processor, WSF_PERFECT_TRACKER, update_interval, 处理器
- **出处**：`air_to_air/weapons/aam/short_range_ir_missile.txt:145-147`　（同签名共 23 处，另见 `alternate_locations/weapons/sam/large_sam.txt:39`、`ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:180`、`base_types/weapons/aam/blue_lr_a2a_rf_missile.txt:98`）
- **片段**：

```text
   processor srm_seeker WSF_PERFECT_TRACKER
      update_interval 0.10 s
   end_processor
```

- **演示要点**：演示 WSF_PERFECT_TRACKER 的参数：update_interval

### processor · WSF_GROUND_TARGET_FUSE｜处理器

- **关键词**：processor, WSF_GROUND_TARGET_FUSE, maximum_time_of_flight, 处理器
- **出处**：`alternate_locations/weapons/agm/blue_glide_bomb_1.txt:44-46`　（同签名共 4 处，另见 `cyber/weapons/agm/blue_gps_bomb_1.txt:45`、`wargame/weapons/agm/agm.txt:44`、`wargame/weapons/agm/atg.txt:45`）
- **片段**：

```text
   processor fuse WSF_GROUND_TARGET_FUSE 
      maximum_time_of_flight       900 s
   end_processor
```

- **演示要点**：演示 WSF_GROUND_TARGET_FUSE 的参数：maximum_time_of_flight

### processor（alv_demo）｜处理器

- **关键词**：processor, report_to, 处理器
- **出处**：`alv_routing/alv_demo.txt:78-80`　（同签名共 3 处，另见 `alv_routing/alv_demo_with_jammer.txt:81`、`ship_ad/platforms/red_missile_frigate.txt:57`）
- **片段**：

```text
   processor track-proc
      report_to command_chain GOOD_GUYS subordinates via xmtr-1 to rcvr-1
   end_processor
```

- **演示要点**：演示 processor 的参数：report_to

### processor · WSF_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TRACK_PROCESSOR, update_interval, 处理器
- **出处**：`alv_routing/platforms/awacs.txt:41-43`
- **片段**：

```text
   processor track-proc WSF_TRACK_PROCESSOR
      update_interval 2 sec
   end_processor
```

- **演示要点**：演示 WSF_TRACK_PROCESSOR 的参数：update_interval

### processor · WSF_LINKED_PROCESSOR｜处理器

- **关键词**：processor, WSF_LINKED_PROCESSOR, report_to, 处理器
- **出处**：`ballistic_missile_shootdown/platforms/blue_abm_ttr.txt:26-28`　（同签名共 26 处，另见 `cyber/exfiltrate_demo/platforms/large_sam_ttr.txt:32`、`cyber/exfiltrate_demo/platforms/red_radar.txt:32`、`electronic_warfare/false-target_command_center.txt:247`）
- **片段**：

```text
   processor data_mgr WSF_LINKED_PROCESSOR
      report_to commander via datalink to sub_net
   end_processor
```

- **演示要点**：演示 WSF_LINKED_PROCESSOR 的参数：report_to

### processor · WSF_PERCEPTION_PROCESSOR｜处理器

- **关键词**：processor, WSF_PERCEPTION_PROCESSOR, asset_perception, 处理器
- **出处**：`base_types/platforms/brawler/brawler_flight_lead.txt:25-27`　（同签名共 2 处，另见 `brawler/platforms/brawler_flight_lead.txt:32`）
- **片段**：

```text
   processor perception WSF_PERCEPTION_PROCESSOR
      asset_perception status_messages
   end_processor
```

- **演示要点**：演示 WSF_PERCEPTION_PROCESSOR 的参数：asset_perception

### processor · WSF_WEAPON_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_WEAPON_TRACK_PROCESSOR, turn_on_sensor, 处理器
- **出处**：`base_types/weapons/agm/mach_4_missile.txt:143-145`　（同签名共 4 处，另见 `laser_designator/weapons/agm/hellfire.txt:56`、`new_guidance/weapons/ssm/ssm_missile.txt:195`、`ship_ad/weapons/ssm/ssm_missile.txt:102`）
- **片段**：

```text
   processor seeker_turn_on WSF_WEAPON_TRACK_PROCESSOR
     turn_on_sensor seeker at_range 30000.0 m before_intercept
   end_processor
```

- **演示要点**：演示 WSF_WEAPON_TRACK_PROCESSOR 的参数：turn_on_sensor

### processor · WSF_AIR_TARGET_FUSE｜处理器

- **关键词**：processor, WSF_AIR_TARGET_FUSE, detonate_below_mach, 处理器
- **出处**：`base_types/weapons/sam/blue_lr_sam_common.txt:317-319`
- **片段**：

```text
  processor fuse WSF_AIR_TARGET_FUSE
     detonate_below_mach 1.0
  end_processor
```

- **演示要点**：演示 WSF_AIR_TARGET_FUSE 的参数：detonate_below_mach

### processor · WSF_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TRACK_PROCESSOR, report_to, 处理器
- **出处**：`cyber/platforms/ground_radar.txt:32-34`　（同签名共 5 处，另见 `electronic_warfare/comm_jamming.txt:111`、`laser_designator/platforms/soldier.txt:33`、`sensor_demos/passive_detector_demo.txt:188`）
- **片段**：

```text
  processor data_mgr WSF_TRACK_PROCESSOR
      report_to commander via datalink
  end_processor
```

- **演示要点**：演示 WSF_TRACK_PROCESSOR 的参数：report_to

### processor · WSF_GROUND_TARGET_FUSE｜处理器

- **关键词**：processor, WSF_GROUND_TARGET_FUSE, proximity_all_on_loss_of_target, 处理器
- **出处**：`cyber/weapons/agm/leader_agm.txt:155-157`　（同签名共 3 处，另见 `swarm/weapons/agm/client_agm.txt:229`、`swarm/weapons/agm/leader_agm.txt:176`）
- **片段**：

```text
   processor fuse WSF_GROUND_TARGET_FUSE
     proximity_all_on_loss_of_target
   end_processor
```

- **演示要点**：演示 WSF_GROUND_TARGET_FUSE 的参数：proximity_all_on_loss_of_target

### processor · WSF_GROUND_TARGET_FUSE｜处理器

- **关键词**：processor, WSF_GROUND_TARGET_FUSE, proximity_cancel_on_loss_of_target, 处理器
- **出处**：`draw/weapons/agm/bomb_1000_lb.txt:20-22`　（同签名共 4 处，另见 `script_demos/script_demo_2.txt:97`、`script_demos/script_demo_5.txt:137`、`suppressor/weapons/agm/blue_gps_bomb_3.txt:55`）
- **片段**：

```text
processor CONTACT_FUSE WSF_GROUND_TARGET_FUSE
   proximity_cancel_on_loss_of_target
end_processor
```

- **演示要点**：演示 WSF_GROUND_TARGET_FUSE 的参数：proximity_cancel_on_loss_of_target

### processor · WSF_IMAGE_PROCESSOR｜处理器

- **关键词**：processor, WSF_IMAGE_PROCESSOR, debug, 处理器
- **出处**：`electronic_warfare/test_multi_beam/platforms/ucav.txt:28-30`　（同签名共 2 处，另见 `sensor_demos/platforms/uav_eoir.txt:61`）
- **片段**：

```text
  processor image_proc WSF_IMAGE_PROCESSOR
     debug
  end_processor
```

- **演示要点**：演示 WSF_IMAGE_PROCESSOR 的参数：debug

### processor（ttr_test）｜处理器

- **关键词**：processor, show_task_messages, 处理器
- **出处**：`iads/ttr_test.txt:98-100`　（同签名共 2 处，另见 `iads/ttr_test.txt:86`）
- **片段**：

```text
   processor task_mgr
      show_task_messages
   end_processor
```

- **演示要点**：演示 processor 的参数：show_task_messages

### processor · WSF_GROUND_TARGET_FUSE｜处理器

- **关键词**：processor, WSF_GROUND_TARGET_FUSE, max_time_of_flight_to_detonate, 处理器
- **出处**：`ship_ad/weapons/agm/red_asm_msl.txt:62-64`　（同签名共 4 处，另见 `ship_ad/weapons/ssm/ssm_missile.txt:87`、`iads/weapons/agm/blue_glide_bomb_1.txt:57`、`iads_c2_demos/weapons/agm/blue_glide_bomb_1.txt:62`）
- **片段**：

```text
  processor fuse WSF_GROUND_TARGET_FUSE
    max_time_of_flight_to_detonate  392.0 sec            # 120 km @ M0.9
  end_processor
```

- **演示要点**：演示 WSF_GROUND_TARGET_FUSE 的参数：max_time_of_flight_to_detonate

### processor · WSF_TRACK_MANAGER｜处理器

- **关键词**：processor, WSF_TRACK_MANAGER, purge_interval, 处理器
- **出处**：`iads_c2_demos/platforms/ucav.txt:88-90`
- **片段**：

```text
  processor data_mgr WSF_TRACK_MANAGER
     purge_interval   60.0 sec
  end_processor
```

- **演示要点**：演示 WSF_TRACK_MANAGER 的参数：purge_interval

### processor（asset_manager）｜处理器

- **关键词**：processor, max_assignments, 处理器
- **出处**：`iads_c2_demos/processors/asset_manager.txt:27-29`
- **片段**：

```text
processor WPN_AM ASV_AM
   max_assignments 10
end_processor
```

- **演示要点**：演示 processor 的参数：max_assignments

### processor（j11_out）｜处理器

- **关键词**：processor, decimal_track_number, 处理器
- **出处**：`l16_j11/j11_out.txt:79-81`
- **片段**：

```text
   processor l16_computer
      decimal_track_number 120
   end_processor
```

- **演示要点**：演示 processor 的参数：decimal_track_number

### processor（platforms）｜处理器

- **关键词**：processor, comm, 处理器
- **出处**：`l16_j11/platforms.txt:80-82`　（同签名共 2 处，另见 `l16_j11/platforms.txt:29`）
- **片段**：

```text
   processor l16_computer FIGHTER_LINK16_COMPUTER
      comm j11_comm
   end_processor
```

- **演示要点**：演示 processor 的参数：comm

### processor · WSF_WEAPON_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_WEAPON_TRACK_PROCESSOR, update_interval, 处理器
- **出处**：`l16_j11/platforms.txt:34-36`
- **片段**：

```text
   processor track-processor WSF_WEAPON_TRACK_PROCESSOR
      update_interval 1 sec
   end_processor
```

- **演示要点**：演示 WSF_WEAPON_TRACK_PROCESSOR 的参数：update_interval

### processor · WSF_IMAGE_PROCESSOR｜处理器

- **关键词**：processor, WSF_IMAGE_PROCESSOR, internal_link, 处理器
- **出处**：`multiresolution_demos/sensor_demo.txt:50-52`　（同签名共 3 处，另见 `multiresolution_demos/platforms/generic_eoir_site.txt:20`、`signature_demos/platforms/generic_eoir_site.txt:20`）
- **片段**：

```text
   processor image_proc WSF_IMAGE_PROCESSOR 
     internal_link track_mgr
   end_processor
```

- **演示要点**：演示 WSF_IMAGE_PROCESSOR 的参数：internal_link

### processor（naval_sam_test）｜处理器

- **关键词**：processor, off, 处理器
- **出处**：`ship_ad/scenarios/naval_sam_test.txt:32-34`　（同签名共 2 处，另见 `ship_ad/scenarios/naval_sam_test.txt:46`）
- **片段**：

```text
   processor fuse
      off
   end_processor
```

- **演示要点**：演示 processor 的参数：off

### processor · WSF_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TRACK_PROCESSOR, on, 处理器
- **出处**：`six_dof/pm6_bomb_sequencers.txt:99-101`
- **片段**：

```text
   processor track_manager WSF_TRACK_PROCESSOR
      on
   end_processor
```

- **演示要点**：演示 WSF_TRACK_PROCESSOR 的参数：on

### processor（sa）｜处理器

- **关键词**：processor, enemy_side, 处理器
- **出处**：`six_dof/processors/sa.txt:57-59`　（同签名共 2 处，另见 `six_dof/processors/sa.txt:61`）
- **片段**：

```text
processor RED_ASSESSMENT GENERAL_ASSESSMENT
   enemy_side     blue
end_processor
```

- **演示要点**：演示 processor 的参数：enemy_side

### processor（starlink_linkable）｜处理器

- **关键词**：processor, track_processor, 处理器
- **出处**：`space_operations/platforms/starlink_linkable.txt:54-56`
- **片段**：

```text
   processor establish-link-processor ESTABLISH_LINK_PROCESSOR 
      track_processor track-proc
   end_processor
```

- **演示要点**：演示 processor 的参数：track_processor

### processor · WSF_SCRIPT_PROCESSOR｜处理器

- **关键词**：processor, WSF_SCRIPT_PROCESSOR, internal_link, 处理器
- **出处**：`space_operations/platforms/starlink_linkable.txt:58-60`
- **片段**：

```text
   processor establish-link-injector WSF_SCRIPT_PROCESSOR
      internal_link establish-link-processor
   end_processor
```

- **演示要点**：演示 WSF_SCRIPT_PROCESSOR 的参数：internal_link

### processor · WSF_AIR_TARGET_FUSE｜处理器

- **关键词**：processor, WSF_AIR_TARGET_FUSE, maximum_time_of_flight, 处理器
- **出处**：`wargame/weapons/sam/sam.txt:97-99`
- **片段**：

```text
processor SAM_FUSE WSF_AIR_TARGET_FUSE
   maximum_time_of_flight 80 sec
end_processor
```

- **演示要点**：演示 WSF_AIR_TARGET_FUSE 的参数：maximum_time_of_flight

### processor · WSF_GROUND_TARGET_FUSE｜处理器

- **关键词**：processor, WSF_GROUND_TARGET_FUSE, coast_time_on_loss_of_target, 处理器
- **出处**：`ballistic_missile_shootdown/weapons/ssm/red_mrbm_1.txt:343-346`　（同签名共 12 处，另见 `base_types/weapons/ssm/red_icbm_1.txt:259`、`base_types/weapons/ssm/red_icbm_2.txt:350`、`base_types/weapons/ssm/red_mrbm_1.txt:343`）
- **片段**：

```text
   processor fuse WSF_GROUND_TARGET_FUSE
      # If the target is killed by another weapon we want to still keep going.
      coast_time_on_loss_of_target     10000.0 secs
   end_processor
```

- **演示要点**：演示 WSF_GROUND_TARGET_FUSE 的参数：coast_time_on_loss_of_target

### processor（red_mrbm_3）｜处理器

- **关键词**：processor, guide_to_truth, 处理器
- **出处**：`base_types/weapons/ssm/red_mrbm_3.txt:481-484`
- **片段**：

```text
   processor guidance RED_MRBM_3_GUIDANCE
     # show_status
      guide_to_truth true #TODO TESTING
   end_processor
```

- **演示要点**：演示 processor 的参数：guide_to_truth

### processor（grid_react_man）｜处理器

- **关键词**：processor, include, 处理器
- **出处**：`engage/grid_react_man.txt:196-199`
- **片段**：

```text
   processor maneuver BASIC_MANEUVER_PROCESSOR
      #Esams-like definition of reactive_maneuvers are in this file
      include ./targets/reactive_maneuvers_esams.txt
   end_processor
```

- **演示要点**：演示 processor 的参数：include

### processor · WSF_MESSAGE_PROCESSOR｜处理器

- **关键词**：processor, WSF_MESSAGE_PROCESSOR, external_link, 处理器
- **出处**：`satellite_demos/platforms/ground_station.txt:74-77`
- **片段**：

```text
   processor dump-xmtr WSF_MESSAGE_PROCESSOR
     # Send message to peers
     external_link peers via radio
   end_processor
```

- **演示要点**：演示 WSF_MESSAGE_PROCESSOR 的参数：external_link

### processor（ew_radar）｜处理器

- **关键词**：processor, script_variables, 处理器
- **出处**：`aea_iads/platforms/ew_radar.txt:28-32`　（同签名共 54 处，另见 `air_to_air/platforms/dca.txt:110`、`air_to_air/platforms/escort.txt:111`、`air_to_air/platforms/hvaa.txt:112`）
- **片段**：

```text
  processor ep_operations EP_OPERATIONS
     script_variables
        mSensorNameList.PushBack("ew_radar");
     end_script_variables
  end_processor
```

- **演示要点**：演示 processor 的参数：script_variables

### processor（missile_ship）｜处理器

- **关键词**：processor, on_initialize, 处理器
- **出处**：`new_guidance/platforms/missile_ship.txt:53-57`　（同签名共 11 处，另见 `ship_ad/platforms/missile_ship.txt:60`、`ship_ad/platforms/red_missile_destroyer.txt:64`、`new_guidance/platforms/red_naval_helicopter.txt:58`）
- **片段**：

```text
  processor 3rd_party_mgr ANNOUNCE_LAUNCH_TACTICS
     on_initialize
        REMOTE_UPDATE_PLATFORM_TYPE = "RED_NAVAL_HELICOPTER";
     end_on_initialize
  end_processor
```

- **演示要点**：演示 processor 的参数：on_initialize

### processor · WSF_TRIMSIM_PROCESSOR｜处理器

- **关键词**：processor, WSF_TRIMSIM_PROCESSOR, minimum_detections, 处理器
- **出处**：`sensor_plot/esm/hm-tdoa.txt:30-34`
- **片段**：

```text
processor TRIMSIM_PROCESSOR WSF_TRIMSIM_PROCESSOR
   #debug
   #debug_level 2
   minimum_detections 2
end_processor
```

- **演示要点**：演示 WSF_TRIMSIM_PROCESSOR 的参数：minimum_detections

### processor（rocket）｜处理器

- **关键词**：processor, phase, 处理器
- **出处**：`signature_demos/platforms/rocket.txt:63-67`
- **片段**：

```text
   processor guidance SSM_GUIDANCE_BASE
      phase ASCENT
         guidance_delay 5000.0 sec
      end_phase
   end_processor
```

- **演示要点**：演示 processor 的参数：phase

### processor（sam_battalion）｜处理器

- **关键词**：processor, status_settings, 处理器
- **出处**：`iads_c2_demos/platforms/sam_battalion.txt:55-60`
- **片段**：

```text
   processor asset_manager WPN_AM
      status_settings
         subord_yellow_timeout  40 secs
         subord_red_timeout     60 secs
      end_status_settings
   end_processor
```

- **演示要点**：演示 processor 的参数：status_settings

### processor · WSF_SCRIPT_PROCESSOR｜处理器

- **关键词**：processor, WSF_SCRIPT_PROCESSOR, on_message, 处理器
- **出处**：`space_operations/platforms/launch_facility_telemetry.txt:19-25`　（同签名共 11 处，另见 `multiresolution_demos/comms/comm_include.txt:16`、`space_operations/platforms/intercept_radar.txt:31`、`space_operations/platforms/interceptor.txt:27`）
- **片段**：

```text
   processor message_proc WSF_SCRIPT_PROCESSOR
      on_message
         script
            PLATFORM.Comment("Receiving telemetry data");
         end_script
      end_on_message
   end_processor
```

- **演示要点**：演示 WSF_SCRIPT_PROCESSOR 的参数：on_message

### processor（coherent_sensor_demo）｜处理器

- **关键词**：processor, sensor, 处理器
- **出处**：`sensor_demos/coherent_sensor_demo.txt:112-119`
- **片段**：

```text
      processor track_manager
      #internal_link track_manager

      sensors
         sensor ew_radar_1
         sensor ew_radar_2
      end_sensors
   end_processor
```

- **演示要点**：演示 processor 的参数：sensor

### processor（hm-tdoa）｜处理器

- **关键词**：processor, sensors, 处理器
- **出处**：`sensor_plot/esm/hm-tdoa.txt:72-79`
- **片段**：

```text
   processor tdoa TRIMSIM_PROCESSOR
      sensors
         sensor passive
         platform_sensor sensor-2 passive
         platform_sensor sensor-3 passive
         platform_sensor sensor-4 passive
      end_sensors
   end_processor
```

- **演示要点**：演示 processor 的参数：sensors

### processor · WSF_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TRACK_PROCESSOR, on_message, 处理器
- **出处**：`space_operations/platforms/commander.txt:73-80`　（同签名共 2 处，另见 `space_operations/platforms/commander.txt:42`）
- **片段**：

```text
  processor track_mgr WSF_TRACK_PROCESSOR
     on_message
        default
        script
           #writeln("COMMANDER TRACK MANAGER GOT A TRACK");
        end_script
     end_on_message
  end_processor
```

- **演示要点**：演示 WSF_TRACK_PROCESSOR 的参数：on_message

### processor · WSF_SCRIPT_PROCESSOR｜处理器

- **关键词**：processor, WSF_SCRIPT_PROCESSOR, execute, 处理器
- **出处**：`ship_ad/weapons/ssm/ssm_missile.txt:58-68`
- **片段**：

```text
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
```

- **演示要点**：演示 WSF_SCRIPT_PROCESSOR 的参数：execute

### processor · WSF_GUIDANCE_COMPUTER｜处理器

- **关键词**：processor, WSF_GUIDANCE_COMPUTER, phase, 处理器
- **出处**：`air_to_air/weapons/aam/medium_range_radar_missile.txt:163-175`　（同签名共 25 处，另见 `parachute/parachute_example.txt:47`、`signature_demos/movers/ssm_base.txt:96`、`base_types_nx/weapons/ssm/blue_slbm.txt:120`）
- **片段**：

```text
  processor mrm_autopilot WSF_GUIDANCE_COMPUTER
     phase LAUNCH
         g_bias                         5.0
         maximum_commanded_g           40.0 g
#         update_interval                0.1 s
        next_phase TERMINAL when phase_time > 5 seconds
     end_phase
     phase TERMINAL
         proportional_navigation_gain  5.0
         velocity_pursuit_gain         5.0
         g_bias                        1.0
     end_phase 
  end_processor
```

- **演示要点**：演示 WSF_GUIDANCE_COMPUTER 的参数：phase

### processor（ww_buddy_tasker）｜处理器

- **关键词**：processor, behavior_tree, 处理器
- **出处**：`base_types/processors/quantum_agents/aiww/ww_buddy_tasker.txt:16-29`
- **片段**：

```text
processor WW_BUDDY_TASKER AI_QUANTUM_TASKER

   #script_variables
   #end_script_variables

   behavior_tree
      selector
         behavior_node  go_home
         behavior_node  formation
      end_selector
     #behavior_node  buddy_uplink
   end_behavior_tree

end_processor
```

- **演示要点**：演示 processor 的参数：behavior_tree

### processor · WSF_TASK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TASK_PROCESSOR, on_message, 处理器
- **出处**：`bearing_only/platforms/commander_platform.txt:56-72`
- **片段**：

```text
  processor task_mgr WSF_TASK_PROCESSOR
      on_message
         type WSF_TRACK_MESSAGE
            script
               WsfTrackMessage trackMsg = (WsfTrackMessage)MESSAGE;
               WsfTrack        track    = trackMsg.Track();
               WsfTrackId      trackId  = track.TrackId();
               double     targetLat     = track.Latitude();
               double     targetLon     = track.Longitude();
               double     targetAlt     = track.Altitude();
               #writeln(TIME_NOW, " Received track message from ", trackId.OwningPlatform());
               #writeln("Track is located ", targetLat , " " , targetLon );
               PLATFORM.GoToSpeed(300);
               PLATFORM.GoToLocation(targetLat, targetLon, targetAlt);
            end_script
      end_on_message
  end_processor
```

- **演示要点**：演示 WSF_TASK_PROCESSOR 的参数：on_message

### processor · WSF_QUANTUM_TASKER_PROCESSOR｜处理器

- **关键词**：processor, WSF_QUANTUM_TASKER_PROCESSOR, behavior_tree, 处理器
- **出处**：`base_types/platforms/brawler/brawler_platform.txt:138-207`
- **片段**：

```text
   processor task_mgr WSF_QUANTUM_TASKER_PROCESSOR
      #debug
      #show_task_messages

#      script_variables
#         int kturn = 0;            //turn type for BVR flight tactics
#         Vec3   vecfpp = Vec3();   //vectored flight, direction
#         double valfpp = 0.0;      //vectored flight, value
#         double sflypp = 0.0;      //vectored flight, speed
#      end_script_variables

      behavior_tree
        #behavior_node debug_data

#         #FLIGHT TACTIC DECISION
#         priority_selector
#            behavior_node  alt1516_bvr_end_run_left
#            behavior_node  alt1517_bvr_end_run_right
#            behavior_node  alt1514_point
#         end_priority_selector

#         #FLIGHT POSTURE DECISION
#         selector
#            #behavior_node  altWXYZ_blah_blah
#         end_selector

#         #PILOT POSTURE DECISION
#         selector
#            behavior_node  pilot_posture
#         end_selector

         #PILOT MANEUVERING DECISION
         priority_selector
            #when debug: prints precondition score of each selector child behavior
            #debug
            behavior_node  alt3111_straight_level_max_speed
            behavior_node  alt3121_straight_level
            behavior_node  alt3411_straight_flight
            behavior_node  alt3421_roll_15_pull
            behavior_node  alt3431_roll-15_pull
            behavior_node  alt3441_tail_attack
            behavior_node  alt3451_pull_gmax_sust
            behavior_node  alt3471_slow_current_dir
            behavior_node  alt3472_slow_pull_right
            behavior_node  alt3473_slow_pull_left
            behavior_node  alt3474_slow_pull_current_plane
            behavior_node  alt3511_break_right
            behavior_node  alt3531_break_left
            behavior_node  alt3551_run_away
            behavior_node  alt3561_force_overshoot
            behavior_node  alt3581_negative_velocity
           #behavior_node  alt3611_fly_vector
            behavior_node  alt3841_aim_missile_typ4
           #behavior_node  alt3211_route_maneuver
            behavior_node  alt3911_evade_missile
           #behavior_node  alt3A11_low_speed_recover
           #behavior_node  alt3A21_low_speed_recover_right45
           #behavior_node  alt3A31_low_speed_recover_left45
           #behavior_node  alt3B11_illuminate
            behavior_node  alt3G11_barrel_roll
         end_priority_selector

         #WEAPON EMPLOYMENT DECISION
         selector
           behavior_node weapon_decision_gun
           behavior_node weapon_decision_missile
         end_selector

      end_behavior_tree
   end_processor
```

- **演示要点**：演示 WSF_QUANTUM_TASKER_PROCESSOR 的参数：behavior_tree

### processor · WSF_GUIDANCE_COMPUTER｜处理器

- **关键词**：processor, WSF_GUIDANCE_COMPUTER, script_variables, 处理器
- **出处**：`cyber/weapons/agm/leader_agm.txt:68-154`　（同签名共 4 处，另见 `swarm/weapons/agm/leader_agm.txt:63`、`cyber/weapons/agm/client_agm.txt:67`、`swarm/weapons/agm/client_agm.txt:82`）
- **片段**：

```text
   processor guidance WSF_GUIDANCE_COMPUTER
       #show_status
       #show_evaluations
       #debug
       script_variables
          double   LeaderCommandedAlt         = 6096;      // alt in meters (20000 ft)
          double   LeaderMaxVel               = 130;       // meters per sec
          double   LeaderMinVel               = 70;        // meters per sec
          double   LeaderMinClimbVel          = 110;
          double   LeaderMaxHeadingDeviation  = 80;        // Max heading deviation from track location
          double   LeaderMaxAltDeviation      = 1600;      // meters
          double   LeaderNoDeviationRange     = 2000;      // meters from target - it goes in for the kill (no deviation)
        end_script_variables


        phase LAUNCH   # Drop like a rock
            guidance_delay                   10 sec
            next_phase INITIAL when phase_time > 10 sec
        end_phase
        phase INITIAL
            maximum_commanded_g            10 g
            commanded_speed                 100 m/s

            next_phase FLY when phase_time > 5 sec
        end_phase
        phase FLY
            maximum_commanded_g           1.3 g
            commanded_speed                 100 m/s
            commanded_altitude              20000 ft
            next_phase TERMINAL  if target_ground_range < variable LeaderNoDeviationRange m
            next_phase ALT_FLY if phase_time > 20 sec
        end_phase

        phase ALT_FLY
           on_entry
              SetAllowRouteFollowing(true);
              WsfTrack targetTrack = PLATFORM.CurrentTargetTrack();
              double CurrentSpeed = PLATFORM.Speed();
              double CurrentAlt   = PLATFORM.Altitude(); # meters above sea level
              double targetRelativeBearing = PLATFORM.RelativeBearingTo(targetTrack);
              double targetTrueBearing = PLATFORM.TrueBearingTo(targetTrack);
              if ((targetRelativeBearing < 15) && (targetRelativeBearing > -15))
              {
                 // Randomly turn away from the target in alt, heading and speed
                 double newspeed = RANDOM.Uniform(LeaderMinVel, LeaderMaxVel);
                 double newalt = RANDOM.Uniform((LeaderCommandedAlt - LeaderMaxAltDeviation),  (LeaderCommandedAlt + LeaderMaxAltDeviation));
                 double newheading = RANDOM.Uniform(0, 360);
                 WsfGeoPoint NewPoint = PLATFORM.Location();
                 NewPoint.Extrapolate(newheading, 5000);
                 WsfRoute NR = WsfRoute.Create("NewRoute");
                 if(newalt > CurrentAlt) // This is to prevent stalling out
                 {
                    newspeed = LeaderMinClimbVel;
                 }
                 SetCommandedAltitude(newalt);
                 NR.Append(NewPoint, newspeed);
                 PLATFORM.SetRoute(NR);

              }
           end_on_entry
           maximum_commanded_g           1.4 g
           allow_route_following          true
           next_phase FLY if phase_time > 35 sec
           on_exit
               WsfPlatformList SubordinateList = PLATFORM.Subordinates();
               WsfTrack targetTrack = PLATFORM.CurrentTargetTrack();
               if (! SubordinateList.Empty())
               {
                  SelectPhase("ALT_FLY");
               }
               if (PLATFORM.GroundRangeTo(targetTrack) < LeaderNoDeviationRange)
               {
                  SelectPhase("TERMINAL");
               }
           end_on_exit
         end_phase

         phase TERMINAL
           on_entry
                writeln("Master in TERMINAL");

           end_on_entry
           proportional_navigation_gain  5 # 10
           maximum_pitch_angle           80 deg
           maximum_commanded_g           10 g
         end_phase
   end_processor
```

- **演示要点**：演示 WSF_GUIDANCE_COMPUTER 的参数：script_variables

### processor（iads_cmdr）｜处理器

- **关键词**：processor, 处理器
- **出处**：`aea_iads/platforms/iads_cmdr.txt:142-143`　（同签名共 135 处，另见 `aea_iads/platforms/large_sam_battalion.txt:114`、`aea_iads/platforms/soj.txt:452`、`alternate_locations/platforms/ucav.txt:33`）
- **片段**：

```text
   processor data_mgr IADS_CMDR_DATA_MGR
   end_processor
```

- **演示要点**：演示 processor（最小结构，无子参数）

### processor · WSF_TASK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TASK_PROCESSOR, 处理器
- **出处**：`aea_iads/platforms/red_radar_company.txt:46-47`　（同签名共 50 处，另见 `alternate_locations/platforms/single_large_sam.txt:62`、`ballistic_missile_shootdown/platforms/blue_abm_ttr.txt:30`、`ballistic_missile_shootdown/platforms/blue_naval_sam_launcher.txt:27`）
- **片段**：

```text
  processor task_mgr WSF_TASK_PROCESSOR
  end_processor
```

- **演示要点**：演示 WSF_TASK_PROCESSOR（最小结构，无子参数）

### processor · WSF_GROUND_TARGET_FUSE｜处理器

- **关键词**：processor, WSF_GROUND_TARGET_FUSE, 处理器
- **出处**：`ballistic_missile_shootdown/weapons/ssm/red_mrbm_1.txt:125-126`　（同签名共 31 处，另见 `ballistic_missile_shootdown/weapons/ssm/red_mrbm_1.txt:165`、`base_types/weapons/agm/mach_4_missile.txt:118`、`base_types/weapons/sam/blue_lr_sam_common.txt:121`）
- **片段**：

```text
   processor fuse WSF_GROUND_TARGET_FUSE
   end_processor
```

- **演示要点**：演示 WSF_GROUND_TARGET_FUSE（最小结构，无子参数）

### processor · WSF_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_TRACK_PROCESSOR, 处理器
- **出处**：`alv_routing/platforms/ew_radar_site.txt:17-18`　（同签名共 106 处，另见 `alv_routing/platforms/fighter_bomber.txt:31`、`chaff/chaff_example.txt:188`、`chaff/chaff_example_ttr.txt:235`）
- **片段**：

```text
   processor track-proc WSF_TRACK_PROCESSOR
   end_processor
```

- **演示要点**：演示 WSF_TRACK_PROCESSOR（最小结构，无子参数）

### processor · WSF_WEAPON_TRACK_PROCESSOR｜处理器

- **关键词**：processor, WSF_WEAPON_TRACK_PROCESSOR, 处理器
- **出处**：`base_types/weapons/sam/blue_lr_sam_complex.txt:69-70`　（同签名共 8 处，另见 `base_types/weapons/sam/blue_sr_sam_complex.txt:82`、`electronic_warfare/track_error.txt:295`、`launcher/weapons/sam/sam_missile.txt:39`）
- **片段**：

```text
   processor data_mgr WSF_WEAPON_TRACK_PROCESSOR
   end_processor
```

- **演示要点**：演示 WSF_WEAPON_TRACK_PROCESSOR（最小结构，无子参数）

### processor · WSF_SCRIPT_PROCESSOR｜处理器

- **关键词**：processor, WSF_SCRIPT_PROCESSOR, 处理器
- **出处**：`outer_air_battle/platforms/blue_prop_awacs_1.txt:62-63`　（同签名共 3 处，另见 `satellite_demos/5th_iridium_flares_demo.txt:310`、`space_operations/scenarios/sat_sensor_constellation.txt:12`）
- **片段**：

```text
   processor sensor_coverage WSF_SCRIPT_PROCESSOR
   end_processor
```

- **演示要点**：演示 WSF_SCRIPT_PROCESSOR（最小结构，无子参数）

### processor · WSF_MESSAGE_PROCESSOR｜处理器

- **关键词**：processor, WSF_MESSAGE_PROCESSOR, 处理器
- **出处**：`satellite_demos/platforms/ground_station.txt:71-72`　（同签名共 2 处，另见 `satellite_demos/platforms/radar_truck.txt:33`）
- **片段**：

```text
   processor dump-rcvr WSF_MESSAGE_PROCESSOR
   end_processor
```

- **演示要点**：演示 WSF_MESSAGE_PROCESSOR（最小结构，无子参数）

### processor · WSF_IMAGE_PROCESSOR｜处理器

- **关键词**：processor, WSF_IMAGE_PROCESSOR, 处理器
- **出处**：`iads/platforms/ucav.txt:28-30`
- **片段**：

```text
  processor image_proc WSF_IMAGE_PROCESSOR
     #debug
  end_processor
```

- **演示要点**：演示 WSF_IMAGE_PROCESSOR（最小结构，无子参数）

### processor · WSF_UNCLASS_DISSEMINATE_C2｜处理器

- **关键词**：processor, WSF_UNCLASS_DISSEMINATE_C2, 处理器
- **出处**：`iads_c2_demos/processors/disseminate_c2.txt:14-27`
- **片段**：

```text
processor DC2 WSF_UNCLASS_DISSEMINATE_C2
      update_interval 0.5 sec

      routing_table
         # Routing values allowed are subordinate, peer, commander, dynamic, none. multiple entries can exist
         # for a given type of message.
         track_updates          none
         assign_track_updates   dynamic
         assignments            dynamic
         assignment_status      dynamic
         assignment_cancel      dynamic
         status                 commander
      end_routing_table
end_processor
```

- **演示要点**：演示 WSF_UNCLASS_DISSEMINATE_C2（最小结构，无子参数）

### processor · WSF_GUIDANCE_COMPUTER｜处理器

- **关键词**：processor, WSF_GUIDANCE_COMPUTER, 处理器
- **出处**：`base_types/weapons/agm/blue_adv_cruise_missile.txt:81-103`　（同签名共 2 处，另见 `satellite_demos/scenarios/gps_denied.txt:122`）
- **片段**：

```text
   processor guidance WSF_GUIDANCE_COMPUTER
       #show_status
       #show_evaluations
       #debug
        phase LAUNCH
            maximum_commanded_g          1.2 g
            next_phase GLIDE when phase_time > 10 sec
        end_phase

        phase GLIDE
            maximum_commanded_g           3 g
            maximum_descent_rate          5 fps
            g_bias                         1.03
            #next_phase TERMINAL  when los_target_angle > 25 deg
            next_phase TERMINAL  when target_slant_range < 5 nm
        end_phase

         phase TERMINAL
           proportional_navigation_gain  5 # 10
           maximum_pitch_angle           80 deg
           maximum_commanded_g           10 g
         end_phase
   end_processor
```

- **演示要点**：演示 WSF_GUIDANCE_COMPUTER（最小结构，无子参数）

### processor · WSF_UNCLASS_BM｜处理器

- **关键词**：processor, WSF_UNCLASS_BM, 处理器
- **出处**：`iads_c2_demos/processors/battle_manager.txt:14-65`
- **片段**：

```text
processor BM WSF_UNCLASS_BM
      update_interval 1 sec

      commit_authority       true
      project_tracks_by_delays enable

      stale_asset_time 60 secs
      shot_doctrine    Shoot-2
      max_firing_time  360 secs

      print_settings
         valid_units            on
         valid_unit_details     on
         invalid_unit_details   on
      end_print_settings

      weapon_table
         speed_attributes
            attrib slow 0 kts  < 250 kts
            attrib med  250 kts < 600 kts
            attrib fast 600 kts < 2000 kts
         end_speed_attributes

         altitude_attributes
            attrib low  0 ft     < 1000 ft
            attrib med  1000 ft  < 30000 ft
            attrib high 30000 ft < 100000 ft
         end_altitude_attributes

         # Weapon rows
         weapon_rows
            # format is: target_pref priority <int> "<type>" "<subtype>" <speed attrib> <alt attrib> <pk %> <AI priority> <SAM priority> <Other priority>
            target_pref priority 1 "UCAV" "Any" med high 0.7 1 1 0
         end_weapon_rows
      end_weapon_table

      scoring_factors
         weapon_type      1
         weapon_subtype   1
         intercept_range  1
         intercept_time   1
         pk               1
         workload         1
      end_scoring_factors

      engage_iff_permissions
         unknowns        false
         neutrals        false
         friendlies      false
         hostiles        true
      end_engage_iff_permissions
end_processor
```

- **演示要点**：演示 WSF_UNCLASS_BM（最小结构，无子参数）

### processor · WSF_QUANTUM_TASKER_PROCESSOR｜处理器

- **关键词**：processor, WSF_QUANTUM_TASKER_PROCESSOR, 处理器
- **出处**：`base_types/processors/quantum_agents/aigci/gci_quantum_tasker.txt:12-206`　（同签名共 3 处，另见 `timeline/processors/quantum_agents/aigci/gci_quantum_tasker.txt:14`、`brawler/platforms/gci_cmdr.txt:45`）
- **片段**：

```text
processor GCI_QUANTUM_TASKER WSF_QUANTUM_TASKER_PROCESSOR

      update_interval 10.0 sec

      script_variables
         ##########################################################################
         ##  user parameters, change these at will
         ##########################################################################
         bool    mDrawClusters           = false;
         bool    mRequireTasking         = false;
         int     mMaxTaskPerformers      =  1;
         string  mClusterMethod          =  "H_TREE_MAX";         //valid: K_MEANS, H_TREE_MIN, H_TREE_MAX
         string  mDistanceFunction       =  "POSITION_VELOCITY";  //valid: POSITION_VELOCITY, POSITION_ONLY, 2D_POSITION
         double  mClusterDistanceLimit   =  50*1852;       // ~50 nautical miles
         int     mNumClusters            =  -1; //not used unless positive (over-rides distance limit)
         double  mClusterJobPriority     =  1;  //if set to zero or less, then number of cluster occupants will be the priority

         ##########################################################################
         ##  script variables, used by methods below, do not change
         ##########################################################################
         WsfDraw                 draw             = WsfDraw();
         WsfClusterManager       cManager;
      end_script_variables


      on_initialize
         cManager = WsfClusterManager.Create(); // creates a cluster manager owned by this script
         cManager.SetClusterMethod(mClusterMethod);
         cManager.SetDistanceLimit(mClusterDistanceLimit);
         if (mNumClusters > 0)
         {
            cManager.SetNumClustersToCreate(mNumClusters);
         }
         else
         {
            cManager.SetDistanceFunction(mDistanceFunction);
         }
      end_on_initialize

      ############################################################################
      ##  utility method used to draw lines around tracks in a cluster
      ##  lines are drawn according to the convex hull of the cluster members
      ############################################################################
      script void draw_cluster_hull(WsfCluster cluster)
         Array<WsfGeoPoint> pts = cluster.ConvexHull();
         if (pts.Size() <= 0)
         {
            return;
         }
         WsfGeoPoint first = pts.Get(0);
         draw.SetDuration(PROCESSOR.UpdateInterval());
         draw.SetColor(1.0,0.5,0.0);  //orange?
         draw.SetLineStyle("solid");
         draw.SetLineSize(2);
         draw.BeginPolyline();
         for (int j = 0; j < pts.Size(); j = j + 1 )
         {
            WsfGeoPoint pt = pts.Get(j);
            draw.Vertex(pt);
         }
         draw.Vertex(first);
         draw.End();
      end_script


      script Array<WsfQuantumTask> GciCommanderTaskGeneration (Array<WsfLocalTrack> TRACKS, Array<WsfAssetPerception> ASSETS )

         //create weapon tasks for enemy track groups (clusters)
         Array<WsfQuantumTask> tasks = Array<WsfQuantumTask>();
         writeln_d(PLATFORM.Name(), " executing GciCommanderTaskGeneration(), T=", TIME_NOW);

         ##########################################################################
         ##   update the cluster manager with the current master track list
         ##########################################################################
         WsfLocalTrackList localTracks = PLATFORM.MasterTrackList();
         Array<WsfTrack> trackArray = Array<WsfTrack>();
         foreach (WsfLocalTrack lt in localTracks)
         {
            if (mRequireTasking == true && TasksReceivedForTarget(lt.TrackId()).Count() <= 0)
            {
               continue;
            }
            if (lt.IsValid() && (!lt.SideValid() || lt.Side() != PLATFORM.Side()))
            {
               lt.SetBearing( lt.Heading() );  #useful for the cluster processing
               trackArray.PushBack(lt);
            }
         }
         cManager.UpdateClusters(TIME_NOW,trackArray);

         ##########################################################################
         ##  generate a task for each clusters
         ##########################################################################
         int NumClusters = cManager.Count();
         for (int i = 0; i < NumClusters; i = i + 1 )
         {
            WsfCluster cluster = cManager.Entry(i);
            int clusterId = cluster.Id();

            if (mDrawClusters == true)
            {
               draw_cluster_hull(cluster);
            }

            if( cluster.Count() > 0 )
            {
               double ClusterPriority = mClusterJobPriority;
               if (ClusterPriority <= 0)
               {
                  ClusterPriority = (double)cluster.Count();
               }
               WsfQuantumTask qt = WsfQuantumTask.Construct(ClusterPriority, "CLUSTER", cluster.Entry(0));   //include a track with the task
               qt.SetTaskType("CLUSTER");
               qt.UniqueId(cluster.Id());
               qt.SetAuxData( "clusterIndex", i );   //for evaluation below
               //TODO local tracks in the quantum task???
               qt.SetAuxData( "maxPerformers", mMaxTaskPerformers );
               qt.SetAuxData( "clusterId", cluster.Id() );
               qt.SetAuxData( "ClusterMeanPoint", WsfGeoPoint(cluster.MeanLocation()) );
               qt.SetAuxData( "ClusterBearing", cluster.Bearing() );
               qt.SetAuxData( "ClusterBearingValid", cluster.BearingValid() );
               qt.SetAuxData( "ClusterNumMembers", cluster.Count() );
               Array<string> arr = Array<string>();
               for (int i = 0; i < cluster.Count(); i = i + 1 )
               {
                  arr.PushBack(cluster.Entry(i).TargetName());
                  writeln_d("job cluster member: ", cluster.Entry(i).TargetName());
               }
               qt.SetAuxData( "ClusterMemberNames", arr );
               tasks.PushBack(qt);
               writeln_d("cluster task generated for: ", cluster.Id());
            }
         }
         return tasks;
      end_script


      script double GciCommanderEvaluation ( WsfQuantumTask TASK, WsfAssetPerception ASSET)

         //simplistic evaluation for now
         //TODO : iterate over all perceived assets that are subordinates of this lead and...
         //       evaluate each entry separately & make a composite value
         writeln_d("evaluating ", ASSET.Name(), " and task type ", TASK.TaskType());
         if (ASSET.Type() == "FLIGHT_LEAD")
         {
            WsfPlatform lead = WsfSimulation.FindPlatform(ASSET.Index());
            if (lead.IsValid())
            {
               writeln_d("calculating value");
               WsfGeoPoint subCentroid = lead.SubordinatesCentroid();   //cheating, TODO: use asset perception
               int clusterIndex = TASK.AuxDataInt("clusterIndex");
               WsfCluster cluster = cManager.Entry(clusterIndex);
               double dist = cluster.MeanLocation().GroundRangeTo(subCentroid);
               #double count = (double)lead.Subordinates().Count();

               //count available weapons
               double weaponCount = 0;
               Array<WsfAssetPerception> assets = PLATFORM.PerceivedAssets();
               WsfPlatformList subs = lead.Subordinates();
               foreach(WsfPlatform sub in subs)
               {
                  foreach (WsfAssetPerception asset in assets)
                  {
                     if (asset.Index()==sub.Index())
                     {
                        for (int j=0; j<asset.SystemCount(); j+=1)
                        {
                           if (asset.SystemKind(j) == "weapon")
                           {
                              weaponCount += asset.SystemQuantityRemaining(j);
                           }
                        }
                        break;
                     }
                  }
               }
               writeln_d("T=", TIME_NOW, ", ", lead.Name(), " evaluation: ", (weaponCount/dist));
               #return (count/dist);
               return (weaponCount/dist);
            }
         }
         return 0.0;
      end_script

     #show_task_messages
      script_debug_writes    off
      update_interval        10.0 sec
      reallocation_strategy  dynamic
      generator              custom          GciCommanderTaskGeneration
      evaluator              custom          GciCommanderEvaluation
      allocator              optimal_profit
     #allocator_extra_tasks  optimal_profit
     #allocator              greedy_isolated
     #allocator_extra_tasks  greedy_isolated
end_processor
```

- **演示要点**：演示 WSF_QUANTUM_TASKER_PROCESSOR（最小结构，无子参数）

### scoring_factors（battle_manager）｜

- **关键词**：scoring_factors, weapon_type, weapon_subtype, intercept_range, intercept_time, pk, workload
- **出处**：`iads_c2_demos/processors/battle_manager.txt:50-57`
- **片段**：

```text
      scoring_factors
         weapon_type      1
         weapon_subtype   1
         intercept_range  1
         intercept_time   1
         pk               1
         workload         1
      end_scoring_factors
```

- **演示要点**：演示 scoring_factors 的参数：weapon_type, weapon_subtype, intercept_range, intercept_time, pk, workload

### scoring_factors（delegate_battle_manager）｜

- **关键词**：scoring_factors, pk
- **出处**：`iads_c2_demos/delegate_battle_manager.txt:111-113`
- **片段**：

```text
      scoring_factors
         pk 0
      end_scoring_factors
```

- **演示要点**：演示 scoring_factors 的参数：pk

### target（proximity_operations）｜

- **关键词**：target, offset, platform
- **出处**：`space_operations/proximity_operations.txt:51-54`　（同签名共 14 处，另见 `space_operations/proximity_operations.txt:58`、`space_operations/proximity_operations.txt:66`、`space_operations/proximity_operations.txt:73`）
- **片段**：

```text
            target
               offset ntw -50 0 30 m
               platform target
            end_target
```

- **演示要点**：演示 target 的参数：offset, platform

### target_data（red_mrbm_1）｜

- **关键词**：target_data, aero, mass
- **出处**：`ballistic_missile_shootdown/weapons/ssm/red_mrbm_1.txt:382-385`　（同签名共 9 处，另见 `base_types/weapons/ssm/red_icbm_2.txt:396`、`base_types/weapons/ssm/red_mrbm_1.txt:382`、`base_types/weapons/ssm/red_mrbm_2.txt:234`）
- **片段**：

```text
   target_data RED_MRBM_1
      aero RED_MRBM_1_RV_AERO              # Aero type of final stage
      mass 500 kg                      # Mass of final stage
   end_target_data
```

- **演示要点**：演示 target_data 的参数：aero, mass

### target_model（simple_target）｜

- **关键词**：target_model, state
- **出处**：`sosm/targets/simple_target.txt:17-22`　（同签名共 3 处，另见 `sosm/test_mission/simple_plot/simple_target.txt:13`、`sosm/targets/red_multirole_fighter_3/red_multirole_fighter_3.txt:23`）
- **片段**：

```text
target_model simple
   state default
      cold_part_area                   constant 1 m^2
      cold_part_radiant_intensity      1 w/sr
   end_state
end_target_model
```

- **演示要点**：演示 target_model 的参数：state

### target_type（hel_test）｜

- **关键词**：target_type, minimum_energy, damage_radius, minimum_energy_density
- **出处**：`hel/hel_test.txt:139-144`
- **片段**：

```text
   target_type RED_ADV_FIGHTER_2
     minimum_energy 10 kj
     damage_radius 2 cm
     minimum_energy_density 1.0 kj/cm^2
     damage_radius 1.0 cm
   end_target_type
```

- **演示要点**：演示 target_type 的参数：minimum_energy, damage_radius, minimum_energy_density

### target_type（hel_test）｜

- **关键词**：target_type, minimum_energy_density
- **出处**：`hel/hel_test.txt:232-234`
- **片段**：

```text
   target_type BALLISTIC_MISSILE
     minimum_energy_density 10 kj/cm^2
   end_target_type
```

- **演示要点**：演示 target_type 的参数：minimum_energy_density

### track（test_strike）｜

- **关键词**：track, platform, side, position
- **出处**：`iads/scenarios/test_strike.txt:79-83`　（同签名共 8 处，另见 `iads/scenarios/test_strike.txt:85`、`iads/scenarios/test_strike.txt:91`、`iads/scenarios/test_strike.txt:97`）
- **片段**：

```text
   track
      platform 300_target
      side     red
      position 38:04:31.0n 116:49:54.0w
   end_track
```

- **演示要点**：演示 track 的参数：platform, side, position

### track（blue_multirole_fighter_1_launch）｜

- **关键词**：track, position, platform
- **出处**：`new_guidance/scenarios/blue_multirole_fighter_1_launch.txt:39-42`　（同签名共 6 处，另见 `new_guidance/scenarios/blue_multirole_fighter_1_launch_blue_asm_missile.txt:38`、`tbm_demos/scenarios/launch1multi_stage_tbm.txt:63`、`tbm_demos/scenarios/launch3tbms.txt:70`）
- **片段**：

```text
   track
      position 38.6n 90.3w altitude 1 m agl
      platform target
   end_track
```

- **演示要点**：演示 track 的参数：position, platform

### track（launchers）｜

- **关键词**：track, platform
- **出处**：`ballistic/scenarios/launchers.txt:45-47`　（同签名共 23 处，另见 `ballistic/scenarios/launchers.txt:60`、`ballistic/scenarios/launchers.txt:75`、`ballistic/scenarios/launchers.txt:90`）
- **片段**：

```text
   track
     platform target01
   end_track
```

- **演示要点**：演示 track 的参数：platform

### track_manager（commander_platform）｜航迹管理器

- **关键词**：track_manager, correlation_method, tracking_sigma, turning_sigma, fusion_method, 航迹管理器
- **出处**：`bearing_only/platforms/commander_platform.txt:35-48`
- **片段**：

```text
       track_manager
        #filter KALMAN_Point5deg end_filter
        correlation_method nearest_neighbor
   #        precise_mode true  #NOT DOCUMENTED - EVENTUALLY WILL BE DEFAULT
           tracking_sigma 1   # multiplier applied to sensor sigma
                              #( 5 gives 99.99% correlation if ellipsoid boundaries intersected
                              #( 3 gives 99.73% correlation if ellipsoid boundaries intersected
                              #( 1 gives 68.27% correlation if ellipsoid boundaries intersected
                              #(.5 gives 38.29% correlation if ellipsoid boundaries intersected
           turning_sigma  1   # KEEP THE SAME AS tracking_sigma!!!
        end_correlation_method
        fusion_method replacement end_fusion_method
        #fusion_method weighted_average
     end_track_manager
```

- **演示要点**：演示 track_manager 的参数：correlation_method, tracking_sigma, turning_sigma, fusion_method

### track_manager（brawler_flight_lead）｜航迹管理器

- **关键词**：track_manager, retain_raw_tracks, retain_track_history, uncorrelated_track_drops, 航迹管理器
- **出处**：`base_types/platforms/brawler/brawler_flight_lead.txt:20-24`
- **片段**：

```text
   track_manager
      retain_raw_tracks
      retain_track_history
      uncorrelated_track_drops disable
   end_track_manager
```

- **演示要点**：演示 track_manager 的参数：retain_raw_tracks, retain_track_history, uncorrelated_track_drops

### track_manager（ssn_laydown）｜航迹管理器

- **关键词**：track_manager, retain_raw_tracks, retain_track_history, fusion_method, 航迹管理器
- **出处**：`space_operations/scenarios/ssn_laydown.txt:46-53`
- **片段**：

```text
   track_manager
      retain_raw_tracks
      retain_track_history
      fusion_method orbit_determination
         process_noise_sigmas_XYZ 0.1 0.1 0.1
         number_of_angle_measurements 8
      end_fusion_method
   end_track_manager
```

- **演示要点**：演示 track_manager 的参数：retain_raw_tracks, retain_track_history, fusion_method

### track_manager（commander_track_manager）｜航迹管理器

- **关键词**：track_manager, correlation_method, fusion_method, filter, 航迹管理器
- **出处**：`aea_iads/processors/commander_track_manager.txt:9-18`
- **片段**：

```text
track_manager
   correlation_method perfect
   end_correlation_method
   #correlation_method cluster end_cluster_method
   fusion_method weighted_average
   end_fusion_method

  filter FILTER_TACTICS
   end_filter
end_track_manager
```

- **演示要点**：演示 track_manager 的参数：correlation_method, fusion_method, filter

### track_manager（false-target_command_center）｜航迹管理器

- **关键词**：track_manager, correlation_method, fusion_method, 航迹管理器
- **出处**：`electronic_warfare/false-target_command_center.txt:426-429`　（同签名共 2 处，另见 `swarm/platforms/uhf_ew_radar_sensor_platform.txt:26`）
- **片段**：

```text
  track_manager
     correlation_method perfect end_correlation_method
     fusion_method weighted_average end_fusion_method
  end_track_manager
```

- **演示要点**：演示 track_manager 的参数：correlation_method, fusion_method

### track_manager（red_naval_helicopter）｜航迹管理器

- **关键词**：track_manager, filter, aux_data, 航迹管理器
- **出处**：`new_guidance/platforms/red_naval_helicopter.txt:43-50`　（同签名共 2 处，另见 `ship_ad/platforms/red_naval_helicopter.txt:43`）
- **片段**：

```text
  track_manager
     filter FILTER_TACTICS end_filter

     # required for inflight updates to work (as currently employed)
     aux_data
        string weapon_platform = "";
     end_aux_data
  end_track_manager
```

- **演示要点**：演示 track_manager 的参数：filter, aux_data

### track_manager（single_large_sam）｜航迹管理器

- **关键词**：track_manager, filter, 航迹管理器
- **出处**：`alternate_locations/platforms/single_large_sam.txt:24-26`　（同签名共 16 处，另见 `ballistic_missile_shootdown/platforms/blue_naval_sam_battery.txt:19`、`cyber/exfiltrate_demo/platforms/large_sam_battalion.txt:91`、`cyber/platforms/sr_sam_telar.txt:51`）
- **片段**：

```text
   track_manager
      filter FILTER_TACTICS end_filter
   end_track_manager
```

- **演示要点**：演示 track_manager 的参数：filter

### track_manager（time_on_target）｜航迹管理器

- **关键词**：track_manager, uncorrelated_track_drops, 航迹管理器
- **出处**：`fires/time_on_target.txt:146-148`　（同签名共 5 处，另见 `fires/time_on_target.txt:163`、`fires/time_on_target.txt:180`、`fires/time_on_target.txt:197`）
- **片段**：

```text
   track_manager
      uncorrelated_track_drops off
   end_track_manager
```

- **演示要点**：演示 track_manager 的参数：uncorrelated_track_drops

### track_manager（cloud_attenuation）｜航迹管理器

- **关键词**：track_manager, retain_track_history, 航迹管理器
- **出处**：`space_operations/cloud_attenuation.txt:96-98`
- **片段**：

```text
   track_manager
      retain_track_history
   end_track_manager
```

- **演示要点**：演示 track_manager 的参数：retain_track_history

### track_manager（brawler_test）｜航迹管理器

- **关键词**：track_manager, fusion_method, 航迹管理器
- **出处**：`air_to_air/platforms/brawler_test.txt:110-113`　（同签名共 6 处，另见 `air_to_air/platforms/brawler_test.txt:134`、`air_to_air/platforms/brawler_test.txt:447`、`air_to_air/platforms/brawler_test.txt:471`）
- **片段**：

```text
      track_manager 
         fusion_method weighted_average       
         end_fusion_method
      end_track_manager
```

- **演示要点**：演示 track_manager 的参数：fusion_method

### track_manager（jam_strobe_tracking）｜航迹管理器

- **关键词**：track_manager, 航迹管理器
- **出处**：`electronic_warfare/jam_strobe_tracking.txt:381-384`　（同签名共 2 处，另见 `brawler/platforms/brawler_flight_lead.txt:26`）
- **片段**：

```text
  track_manager
     #correlation_method perfect
     #fusion_method      weighted_average
  end_track_manager
```

- **演示要点**：演示 track_manager（最小结构，无子参数）
