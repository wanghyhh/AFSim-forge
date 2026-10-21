# 武器与杀伤

> **来源**：AFSIM 2.9.0 官方 demo 集（`demos/`，4,751 个 `.txt`，132 万行）
> **性质**：原文摘抄，未改写。同一「参数签名」只保留 1 条代表，并注明出现次数与另见位置
> **警示**：片段中数值为 demo 原值，**仅供语法参考，不得直接复用**；依赖 `common/` 数据表的片段须另行提供
> **检索**：按命令 / 类型名 / 参数名搜本卷；总表见 `90-tokens.md`

### chaff_parcel · WSF_CHAFF_PARCEL｜

- **关键词**：chaff_parcel, WSF_CHAFF_PARCEL, terminal_velocity, bloom_diameter, expansion_time_constant, deceleration_rate, expiration_time, number_dipoles, frequency_maximum_rcs_table
- **出处**：`chaff/chaff_example.txt:24-41`　（同签名共 2 处，另见 `chaff/chaff_example_ttr.txt:22`）
- **片段**：

```text
chaff_parcel CHAFF_PARCEL WSF_CHAFF_PARCEL
  #debug on
  terminal_velocity 1.0 m/s
  bloom_diameter 20 m
  expansion_time_constant 5.0 sec
  deceleration_rate 10 m/s2
  expiration_time 10 s

  number_dipoles 2000000

  frequency_maximum_rcs_table # if no units specified, assumed hz vs. dBsm
     independent_variable units mhz extrapolate
     100  71
     500  57
     1000 51
     1500 48
  end_frequency_maximum_rcs_table
end_chaff_parcel
```

- **演示要点**：演示 WSF_CHAFF_PARCEL 的参数：terminal_velocity, bloom_diameter, expansion_time_constant, deceleration_rate, expiration_time, number_dipoles, frequency_maximum_rcs_table

### effect · WSF_TRACK_EFFECT｜

- **关键词**：effect, WSF_TRACK_EFFECT, debug, track_behavior, required_j_to_s, range_error, range_walkoff_rate, range_holdout_time, range_recycle, azimuth_error, elevation_error
- **出处**：`electronic_warfare/track_effect_1.txt:40-52`
- **片段**：

```text
        effect ea_effect WSF_TRACK_EFFECT
         debug
          track_behavior distort
          required_j_to_s 2 dB
          range_error 0 km
          range_walkoff_rate 0.5 km/s
          range_holdout_time 6 sec
          range_recycle true
          azimuth_error 0 deg
          #azimuth_walkoff_rate 0.1 deg/s
          elevation_error 0 deg
          #elevation_walkoff_rate 0.01 deg/s
      end_effect
```

- **演示要点**：演示 WSF_TRACK_EFFECT 的参数：debug, track_behavior, required_j_to_s, range_error, range_walkoff_rate, range_holdout_time, range_recycle, azimuth_error, elevation_error

### effect · WSF_SIMPLE_FT_EFFECT｜

- **关键词**：effect, WSF_SIMPLE_FT_EFFECT, debug, jamming_pulse_density, maximum_false_target_capacity, percent_of_beamwidth_for_detection, update_once_per_frame, combine_multi_beam_counts, use_random_calculation_draw
- **出处**：`electronic_warfare/simple_ft_jamming.txt:50-64`
- **片段**：

```text
            effect simple_ft_effect WSF_SIMPLE_FT_EFFECT
               debug
               jamming_pulse_density 0.1
               maximum_false_target_capacity 100
               percent_of_beamwidth_for_detection 0.5
               update_once_per_frame true
               combine_multi_beam_counts true
               use_random_calculation_draw true
               #jamming_modulation_gain 3.0 db
               #jamming_power_gain 2.0 db
               #number_of_false_targets       1800

               #jamming_radius_factor inside_and_equal 0.75
               #jamming_radius_factor outside          0.9
            end_effect
```

- **演示要点**：演示 WSF_SIMPLE_FT_EFFECT 的参数：debug, jamming_pulse_density, maximum_false_target_capacity, percent_of_beamwidth_for_detection, update_once_per_frame, combine_multi_beam_counts, use_random_calculation_draw

### effect · WSF_SLC_EFFECT｜

- **关键词**：effect, WSF_SLC_EFFECT, number_canceler_channels, cancelation_lock_ratio, auxiliary_antenna_pattern, cancelation_ratios, receiver_noise_power_gain
- **出处**：`aea_iads/sensors/radar/ew_radar.txt:40-51`
- **片段**：

```text
      effect sidelobe_cancelation WSF_SLC_EFFECT
         number_canceler_channels 2
         cancelation_lock_ratio   2 dB
         auxiliary_antenna_pattern EW_RADAR_AUX_ANTENNA
         cancelation_ratios
            jammer_to_noise         0.0 db   0.0 db
            jammer_to_noise        15.0 db  10.0 db
            jammer_to_noise        30.0 db  20.0 db
            saturation_ratio       10.0 dB
         end_cancelation_ratios
        receiver_noise_power_gain 3.0 db
      end_effect
```

- **演示要点**：演示 WSF_SLC_EFFECT 的参数：number_canceler_channels, cancelation_lock_ratio, auxiliary_antenna_pattern, cancelation_ratios, receiver_noise_power_gain

### effect · WSF_SLC_EFFECT｜

- **关键词**：effect, WSF_SLC_EFFECT, debug, number_canceller_channels, cancellation_lock_ratio, antenna_pattern, cancellation_ratios
- **出处**：`electronic_warfare/slc_slb_script_jamming.txt:163-174`
- **片段**：

```text
            effect slc_effect WSF_SLC_EFFECT
               debug
               number_canceller_channels  2
               cancellation_lock_ratio    3 dB
               antenna_pattern            AUX_ANTENNA
               cancellation_ratios
                  jammer_to_noise   0.0 db  0.0 db
                  jammer_to_noise  15.0 db 10.0 db
                  jammer_to_noise  30.0 db 20.0 db
                  saturation_ratio 10.0 dB
               end_cancellation_ratios
            end_effect
```

- **演示要点**：演示 WSF_SLC_EFFECT 的参数：debug, number_canceller_channels, cancellation_lock_ratio, antenna_pattern, cancellation_ratios

### effect · WSF_SLC_EFFECT｜

- **关键词**：effect, WSF_SLC_EFFECT, antenna_pattern, signal_power_gain, number_canceler_channels, cancelation_lock_ratio, cancellation_ratios
- **出处**：`electronic_warfare/pol_mod_jamming.txt:135-147`
- **片段**：

```text
            effect slc_effect WSF_SLC_EFFECT
               #debug
               antenna_pattern            AUX_ANTENNA
               signal_power_gain -3.0 db
               number_canceler_channels  2
               cancelation_lock_ratio    3 dB
               cancellation_ratios
                  jammer_to_noise 0.0 db   0.0 db
                  jammer_to_noise 15.0 db 10.0 db
                  jammer_to_noise 30.0 db 20.0 db
                  saturation_ratio 3.0 dB
               end_cancellation_ratios
            end_effect
```

- **演示要点**：演示 WSF_SLC_EFFECT 的参数：antenna_pattern, signal_power_gain, number_canceler_channels, cancelation_lock_ratio, cancellation_ratios

### effect · WSF_SLB_EFFECT｜

- **关键词**：effect, WSF_SLB_EFFECT, antenna_pattern, blanking_threshold, saturation_effect, target_blanking_effect, probabilities
- **出处**：`electronic_warfare/cover_pulse_jamming.txt:94-110`　（同签名共 2 处，另见 `electronic_warfare/jtos_power.txt:93`）
- **片段**：

```text
      effect slb_effect WSF_SLB_EFFECT
         antenna_pattern      AUX_ANTENNA
         blanking_threshold 0 dB
         saturation_effect
            duty_cycle_limit_effect
            duty_cycle_limit 0.5
       end_saturation_effect
       target_blanking_effect
          probabilities
             pulse_density 0.0 0.0
             pulse_density 0.1 0.2
             pulse_density 0.3 0.6
             pulse_density 0.5 0.8
             pulse_density 1.0 1.0
           end_probabilities
         end_target_blanking_effect
      end_effect
```

- **演示要点**：演示 WSF_SLB_EFFECT 的参数：antenna_pattern, blanking_threshold, saturation_effect, target_blanking_effect, probabilities

### effect · WSF_TRACK_EFFECT｜

- **关键词**：effect, WSF_TRACK_EFFECT, track_behavior, azimuth_error, elevation_error, range_error
- **出处**：`electronic_warfare/track_error.txt:42-47`　（同签名共 2 处，另见 `electronic_warfare/track_error.txt:213`）
- **片段**：

```text
            effect track_effect WSF_TRACK_EFFECT
               track_behavior  distort
               azimuth_error    2 deg
               elevation_error  3 deg
               range_error     10 m
            end_effect
```

- **演示要点**：演示 WSF_TRACK_EFFECT 的参数：track_behavior, azimuth_error, elevation_error, range_error

### effect · WSF_SLB_EFFECT｜

- **关键词**：effect, WSF_SLB_EFFECT, auxiliary_antenna_pattern, blanking_threshold, saturation_effect, target_blanking_effect
- **出处**：`aea_iads/sensors/radar/ew_radar.txt:60-70`　（同签名共 2 处，另见 `electronic_warfare/simple_ft_jamming.txt:148`）
- **片段**：

```text
      effect sidelobe_blanking WSF_SLB_EFFECT
         auxiliary_antenna_pattern EW_RADAR_AUX_ANTENNA
         blanking_threshold    0 dB
         saturation_effect
           duty_cycle_limit_effect
           duty_cycle_limit    0.50
        end_saturation_effect
        target_blanking_effect
           duty_cycle_probability_effect
        end_target_blanking_effect
      end_effect
```

- **演示要点**：演示 WSF_SLB_EFFECT 的参数：auxiliary_antenna_pattern, blanking_threshold, saturation_effect, target_blanking_effect

### effect · WSF_SLB_EFFECT｜

- **关键词**：effect, WSF_SLB_EFFECT, antenna_pattern, blanking_threshold, saturation_effect, target_blanking_effect
- **出处**：`electronic_warfare/test_false_targets/sensors/radar/ew_radar.txt:92-102`　（同签名共 15 处，另见 `electronic_warfare/agile_auto-repeater_jamming.txt:192`、`electronic_warfare/agile_repeater_jamming-rt1.txt:306`、`electronic_warfare/agile_repeater_jamming-rt2.txt:306`）
- **片段**：

```text
            effect slb_effect WSF_SLB_EFFECT
               antenna_pattern      AUX_ANTENNA
               blanking_threshold 2 dB
               saturation_effect
                 duty_cycle_limit_effect
                 duty_cycle_limit 0.50
              end_saturation_effect
              target_blanking_effect
                 duty_cycle_probability_effect
              end_target_blanking_effect
            end_effect
```

- **演示要点**：演示 WSF_SLB_EFFECT 的参数：antenna_pattern, blanking_threshold, saturation_effect, target_blanking_effect

### effect · WSF_SLC_EFFECT｜

- **关键词**：effect, WSF_SLC_EFFECT, number_canceller_channels, cancellation_lock_ratio, antenna_pattern, cancellation_ratios
- **出处**：`electronic_warfare/jam_strobe_tracking.txt:123-133`　（同签名共 3 处，另见 `electronic_warfare/test_false_targets/sensors/radar/ew_radar.txt:75`、`electronic_warfare/spot_jamming.txt:106`）
- **片段**：

```text
            effect slc_effect WSF_SLC_EFFECT
               number_canceller_channels  2
               cancellation_lock_ratio    3 dB
               antenna_pattern            AUX_ANTENNA
               cancellation_ratios
                  jammer_to_noise   0.0 db  0.0 db
                  jammer_to_noise  15.0 db 10.0 db
                  jammer_to_noise  30.0 db 20.0 db
                  saturation_ratio 10.0 dB
               end_cancellation_ratios
            end_effect
```

- **演示要点**：演示 WSF_SLC_EFFECT 的参数：number_canceller_channels, cancellation_lock_ratio, antenna_pattern, cancellation_ratios

### effect · WSF_SIMPLE_FT_EFFECT｜

- **关键词**：effect, WSF_SIMPLE_FT_EFFECT, jamming_pulse_density, percent_of_beamwidth_for_detection, use_random_calculation_draw
- **出处**：`aea_iads/weapons/jammer/soj_base_jammer.txt:35-39`
- **片段**：

```text
      effect ft_effect WSF_SIMPLE_FT_EFFECT
          jamming_pulse_density               0.1
          percent_of_beamwidth_for_detection  0.5
          use_random_calculation_draw true
      end_effect
```

- **演示要点**：演示 WSF_SIMPLE_FT_EFFECT 的参数：jamming_pulse_density, percent_of_beamwidth_for_detection, use_random_calculation_draw

### effect · WSF_FALSE_TARGET_EFFECT｜

- **关键词**：effect, WSF_FALSE_TARGET_EFFECT, jamming_pulse_density, false_target_name, scan_rate_multiplier
- **出处**：`electronic_warfare/false-target_jamming_2.txt:49-53`　（同签名共 3 处，另见 `electronic_warfare/false-target_jamming_3.txt:54`、`electronic_warfare/false-target_jamming_4.txt:52`）
- **片段**：

```text
      effect ft_effect WSF_FALSE_TARGET_EFFECT
         jamming_pulse_density 0.1
         false_target_name FALSE_TARGET
         scan_rate_multiplier 5
      end_effect
```

- **演示要点**：演示 WSF_FALSE_TARGET_EFFECT 的参数：jamming_pulse_density, false_target_name, scan_rate_multiplier

### effect · WSF_JAMMER_POWER_EFFECT｜

- **关键词**：effect, WSF_JAMMER_POWER_EFFECT, repeater_effect_control_method, gain_control_method, desired_jammer_to_signal
- **出处**：`sensor_plot/radar/hm-repeater-effect.txt:71-76`
- **片段**：

```text
            effect power_effect WSF_JAMMER_POWER_EFFECT
               repeater_effect_control_method actuals
               gain_control_method jammer_to_signal
               desired_jammer_to_signal  0.0 db
               #debug
            end_effect
```

- **演示要点**：演示 WSF_JAMMER_POWER_EFFECT 的参数：repeater_effect_control_method, gain_control_method, desired_jammer_to_signal

### effect · WSF_TRACK_EFFECT｜

- **关键词**：effect, WSF_TRACK_EFFECT, debug, track_behavior, required_j_to_s
- **出处**：`electronic_warfare/track_drop_maintain_effect.txt:39-46`
- **片段**：

```text
      effect drop_track_effect WSF_TRACK_EFFECT
         debug
         track_behavior drop
         required_j_to_s 2.0 dB
         #maintain_drop_delay_time   5 sec
         #maintain_drop_holdout_time 10 sec
         #maintain_drop_recycle     true
      end_effect
```

- **演示要点**：演示 WSF_TRACK_EFFECT 的参数：debug, track_behavior, required_j_to_s

### effect · WSF_COVER_PULSE_EFFECT｜

- **关键词**：effect, WSF_COVER_PULSE_EFFECT, probability_of_cover, debug, jamming_to_signal_gain_table
- **出处**：`electronic_warfare/cover_pulse_jamming.txt:40-49`
- **片段**：

```text
      effect noise_effect WSF_COVER_PULSE_EFFECT
         probability_of_cover 0.5
         debug
         #jamming_delta_gain 1 dB
         jamming_to_signal_gain_table
           jamming_to_signal 0 db 0 db
           jamming_to_signal 1 db 1 db
           jamming_to_signal 2 db 2 db
         end_jamming_to_signal_gain_table
       end_effect
```

- **演示要点**：演示 WSF_COVER_PULSE_EFFECT 的参数：probability_of_cover, debug, jamming_to_signal_gain_table

### effect · WSF_TRACK_EFFECT｜

- **关键词**：effect, WSF_TRACK_EFFECT, debug, track_behavior, maintain_drop_holdout_time
- **出处**：`electronic_warfare/track_drop_maintain_effect.txt:99-108`
- **片段**：

```text
      effect drop_track_effect WSF_TRACK_EFFECT
         debug
         track_behavior maintain
         maintain_drop_holdout_time 10 sec
         #holdout_table maintain_drop
         #   jamming_to_signal 0.0 db 15 sec 20 sec
         #   jamming_to_signal 2.0 db 10 sec 15 sec
         #   jamming_to_signal 4.0 db 5 sec 10 sec
         #end_holdout_table
      end_effect
```

- **演示要点**：演示 WSF_TRACK_EFFECT 的参数：debug, track_behavior, maintain_drop_holdout_time

### effect · WSF_FALSE_TARGET_EFFECT｜

- **关键词**：effect, WSF_FALSE_TARGET_EFFECT, jamming_pulse_density, scan_rate_multiplier
- **出处**：`electronic_warfare/slc_slb_script_jamming.txt:59-62`　（同签名共 3 处，另见 `electronic_warfare/false-target_jamming_1.txt:44`、`electronic_warfare/ft_track_plot.txt:279`）
- **片段**：

```text
            effect ft_effect WSF_FALSE_TARGET_EFFECT
               jamming_pulse_density 0.1
               scan_rate_multiplier 5.0
            end_effect
```

- **演示要点**：演示 WSF_FALSE_TARGET_EFFECT 的参数：jamming_pulse_density, scan_rate_multiplier

### effect · WSF_FALSE_TARGET_EFFECT｜

- **关键词**：effect, WSF_FALSE_TARGET_EFFECT, jamming_pulse_density, range_constrained
- **出处**：`electronic_warfare/test_false_targets/weapons/jammer/soj_xband_jammer.txt:77-82`
- **片段**：

```text
           effect ft_effect WSF_FALSE_TARGET_EFFECT
           debug
              jamming_pulse_density 0.01
              range_constrained true
              //false_target_technique FALSE_TARGET_1
           end_effect
```

- **演示要点**：演示 WSF_FALSE_TARGET_EFFECT 的参数：jamming_pulse_density, range_constrained

### effect · WSF_TRACK_EFFECT｜

- **关键词**：effect, WSF_TRACK_EFFECT, track_behavior, range_error
- **出处**：`aea_iads/weapons/jammer/soj_base_jammer.txt:68-74`　（同签名共 2 处，另见 `electronic_warfare/test_false_targets/weapons/jammer/soj_xband_jammer.txt:110`）
- **片段**：

```text
      effect RANGE_ERROR WSF_TRACK_EFFECT
         track_behavior distort
         range_error 200 m
         //azimuth_error <angle-value>
         //elevation_error <angle-value>
         //range_drift_rate <speed-value>
      end_effect
```

- **演示要点**：演示 WSF_TRACK_EFFECT 的参数：track_behavior, range_error

### effect · WSF_JAMMER_POWER_EFFECT｜

- **关键词**：effect, WSF_JAMMER_POWER_EFFECT, debug, jamming_to_signal_gain_table
- **出处**：`electronic_warfare/jtos_power.txt:41-49`
- **片段**：

```text
      effect noise_effect WSF_JAMMER_POWER_EFFECT
         debug
         #jamming_delta_gain 1 dB
         jamming_to_signal_gain_table
           jamming_to_signal 0 db 0 db
           jamming_to_signal 1 db 1 db
           jamming_to_signal 2 db 2 db
         end_jamming_to_signal_gain_table
      end_effect
```

- **演示要点**：演示 WSF_JAMMER_POWER_EFFECT 的参数：debug, jamming_to_signal_gain_table

### effect · WSF_AGILITY_EFFECT｜

- **关键词**：effect, WSF_AGILITY_EFFECT, debug, agility_type
- **出处**：`electronic_warfare/test_multi_beam/sensors/radar/ew_radar.txt:69-78`
- **片段**：

```text
                  effect frequency_changing WSF_AGILITY_EFFECT
                     debug
                     agility_type mode_changing
                        mode_name one
                        mode_name two
                     end_agility_type
                     agility_type
                        frequency_changing
                     end_agility_type
                  end_effect
```

- **演示要点**：演示 WSF_AGILITY_EFFECT 的参数：debug, agility_type

### effect · WSF_PULSE_SUPPRESS_EFFECT｜

- **关键词**：effect, WSF_PULSE_SUPPRESS_EFFECT, reject
- **出处**：`aea_iads/sensors/radar/acq_radar.txt:29-31`　（同签名共 2 处，另见 `electronic_warfare/test_false_targets/sensors/radar/acq_radar.txt:68`）
- **片段**：

```text
      effect ps_effect WSF_PULSE_SUPPRESS_EFFECT
         reject pulses 0.05
      end_effect
```

- **演示要点**：演示 WSF_PULSE_SUPPRESS_EFFECT 的参数：reject

### effect · WSF_POWER_EFFECT｜

- **关键词**：effect, WSF_POWER_EFFECT, jamming_delta_gain
- **出处**：`aea_iads/weapons/jammer/soj_base_jammer.txt:19-21`　（同签名共 6 处，另见 `alv_routing/weapons/alv_jammer.txt:26`、`electronic_warfare/comm_jamming.txt:219`、`electronic_warfare/slc_slb_script_jamming.txt:51`）
- **片段**：

```text
      effect noise_effect WSF_POWER_EFFECT
         jamming_delta_gain 0 dB
      end_effect
```

- **演示要点**：演示 WSF_POWER_EFFECT 的参数：jamming_delta_gain

### effect · WSF_POWER_EFFECT｜

- **关键词**：effect, WSF_POWER_EFFECT, signal_power_gain
- **出处**：`electronic_warfare/comm_jamming.txt:68-70`　（同签名共 3 处，另见 `electronic_warfare/false-target_jamming_1.txt:120`、`electronic_warfare/ft_track_plot.txt:355`）
- **片段**：

```text
      effect proc_gain WSF_POWER_EFFECT
         signal_power_gain 3 db
      end_effect
```

- **演示要点**：演示 WSF_POWER_EFFECT 的参数：signal_power_gain

### effect · WSF_FALSE_TARGET_EFFECT｜

- **关键词**：effect, WSF_FALSE_TARGET_EFFECT, false_target_name
- **出处**：`electronic_warfare/false-target_command_center.txt:89-91`
- **片段**：

```text
             effect ft_effect WSF_FALSE_TARGET_EFFECT
                false_target_name FALSE_TARGET
             end_effect
```

- **演示要点**：演示 WSF_FALSE_TARGET_EFFECT 的参数：false_target_name

### effect · WSF_POL_MOD_EFFECT｜

- **关键词**：effect, WSF_POL_MOD_EFFECT, number_slc_channels_saturated
- **出处**：`electronic_warfare/pol_mod_jamming.txt:63-65`
- **片段**：

```text
            effect pol_mod_effect WSF_POL_MOD_EFFECT
               number_slc_channels_saturated 3
            end_effect
```

- **演示要点**：演示 WSF_POL_MOD_EFFECT 的参数：number_slc_channels_saturated

### effect · WSF_JAMMER_POWER_EFFECT｜

- **关键词**：effect, WSF_JAMMER_POWER_EFFECT, jamming_delta_gain
- **出处**：`electronic_warfare/test_false_targets/weapons/jammer/soj_xband_jammer.txt:64-66`　（同签名共 4 处，另见 `electronic_warfare/test_multi_beam/weapons/jammer/soj_sband_jammer.txt:45`、`electronic_warfare/test_multi_beam/weapons/jammer/soj_vhf_jammer.txt:35`、`electronic_warfare/test_multi_beam/weapons/jammer/soj_xband_jammer.txt:46`）
- **片段**：

```text
           effect noise_effect WSF_JAMMER_POWER_EFFECT
              jamming_delta_gain 0 dB
           end_effect
```

- **演示要点**：演示 WSF_JAMMER_POWER_EFFECT 的参数：jamming_delta_gain

### effect · WSF_AGILITY_EFFECT｜

- **关键词**：effect, WSF_AGILITY_EFFECT, agility_type
- **出处**：`aea_iads/sensors/radar/ew_radar.txt:78-82`　（同签名共 10 处，另见 `electronic_warfare/air-to-air-rt1.txt:275`、`electronic_warfare/air-to-air-rt2.txt:275`、`electronic_warfare/agile_auto-repeater_jamming.txt:178`）
- **片段**：

```text
      effect frequency_agility WSF_AGILITY_EFFECT
         agility_type
            frequency_changing
         end_agility_type
      end_effect
```

- **演示要点**：演示 WSF_AGILITY_EFFECT 的参数：agility_type

### effect · WSF_FALSE_TARGET_EFFECT｜

- **关键词**：effect, WSF_FALSE_TARGET_EFFECT, false_target_technique
- **出处**：`aea_iads/weapons/jammer/soj_base_jammer.txt:26-30`　（同签名共 2 处，另见 `electronic_warfare/test_false_targets/weapons/jammer/soj_xband_jammer.txt:69`）
- **片段**：

```text
      effect ft_effect WSF_FALSE_TARGET_EFFECT
          #jamming_pulse_density 0.1
          #scan_rate_multiplier 5
          false_target_technique FALSE_TARGET_1
      end_effect
```

- **演示要点**：演示 WSF_FALSE_TARGET_EFFECT 的参数：false_target_technique

### effect · WSF_FALSE_TARGET_EFFECT｜

- **关键词**：effect, WSF_FALSE_TARGET_EFFECT, number_of_false_targets
- **出处**：`sensor_demos/bistatic_sp_false_target_jamming_demo.txt:20-24`　（同签名共 3 处，另见 `sensor_demos/bistatic_support_false_target_jamming_demo.txt:20`、`sensor_plot/radar/hm-bistatic-ft-jamming-lab.txt:14`）
- **片段**：

```text
      effect ft_effect WSF_FALSE_TARGET_EFFECT
         #debug
         number_of_false_targets 1
         #scan_rate_multiplier 5
      end_effect
```

- **演示要点**：演示 WSF_FALSE_TARGET_EFFECT 的参数：number_of_false_targets

### effect · WSF_JAMMER_POWER_EFFECT｜

- **关键词**：effect, WSF_JAMMER_POWER_EFFECT, jamming_to_signal_gain_table
- **出处**：`aea_iads/weapons/jammer/soj_base_jammer.txt:79-87`
- **片段**：

```text
      effect jtos_gain_effect WSF_JAMMER_POWER_EFFECT
         jamming_to_signal_gain_table
           jamming_to_signal   -30 db  -30 db
           jamming_to_signal   0 db    0 db
           jamming_to_signal   3 db    5 db
           jamming_to_signal   6 db   10 db
           jamming_to_signal  15 db   15 db
         end_jamming_to_signal_gain_table
      end_effect
```

- **演示要点**：演示 WSF_JAMMER_POWER_EFFECT 的参数：jamming_to_signal_gain_table

### effect · WSF_FALSE_TARGET_EFFECT｜

- **关键词**：effect, WSF_FALSE_TARGET_EFFECT, system_type_data
- **出处**：`electronic_warfare/agile_auto-repeater_jamming.txt:98-107`　（同签名共 9 处，另见 `electronic_warfare/agile_repeater_jamming-rt1.txt:96`、`electronic_warfare/agile_repeater_jamming-rt2.txt:96`、`electronic_warfare/agile_repeater_jamming.txt:103`）
- **片段**：

```text
            effect ft_effect WSF_FALSE_TARGET_EFFECT
                system_type_data default
                   jamming_pulse_density 0.2
                   scan_rate_multiplier 2.0
                end_system_type_data
                system_type_data EW_RADAR
                   jamming_pulse_density 0.1
                   scan_rate_multiplier 2.0
                end_system_type_data
             end_effect
```

- **演示要点**：演示 WSF_FALSE_TARGET_EFFECT 的参数：system_type_data

### effect · WSF_SLB_EFFECT｜

- **关键词**：effect, WSF_SLB_EFFECT, debug
- **出处**：`electronic_warfare/slc_slb_script_jamming.txt:136-154`
- **片段**：

```text
         effect slb_effect WSF_SLB_EFFECT
            debug
               antenna_pattern    AUX_ANTENNA
               blanking_threshold 3 dB
               saturation_effect
                  no_saturation_effect
                  duty_cycle_limit_effect
                  duty_cycle_limit 0.8
               end_saturation_effect
               target_blanking_effect
                  probabilities
                     pulse_density 0.0 0.0
                     pulse_density 0.1 0.2
                     pulse_density 0.3 0.6
                     pulse_density 0.5 0.8
                     pulse_density 1.0 1.0
                  end_probabilities
               end_target_blanking_effect
            end_effect
```

- **演示要点**：演示 WSF_SLB_EFFECT 的参数：debug

### effect · WSF_RPJ_EFFECT｜

- **关键词**：effect, WSF_RPJ_EFFECT, system_type_data
- **出处**：`aea_iads/weapons/jammer/soj_base_jammer.txt:44-63`　（同签名共 4 处，另见 `alv_routing/weapons/alv_jammer.txt:33`、`electronic_warfare/rpj_jamming.txt:47`、`electronic_warfare/test_false_targets/weapons/jammer/soj_xband_jammer.txt:86`）
- **片段**：

```text
      effect rpj_effect WSF_RPJ_EFFECT
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
      end_effect
```

- **演示要点**：演示 WSF_RPJ_EFFECT 的参数：system_type_data

### effect · WSF_JAMMER_POWER_EFFECT｜

- **关键词**：effect, WSF_JAMMER_POWER_EFFECT
- **出处**：`electronic_warfare/agile_auto-repeater_jamming.txt:91-92`　（同签名共 9 处，另见 `electronic_warfare/agile_repeater_jamming-rt1.txt:89`、`electronic_warfare/agile_repeater_jamming-rt2.txt:89`、`electronic_warfare/agile_repeater_jamming.txt:96`）
- **片段**：

```text
            effect power_effect WSF_JAMMER_POWER_EFFECT
            end_effect
```

- **演示要点**：演示 WSF_JAMMER_POWER_EFFECT（最小结构，无子参数）

### effect · WSF_POWER_EFFECT｜

- **关键词**：effect, WSF_POWER_EFFECT
- **出处**：`electronic_warfare/jam_strobe_direction_finder.txt:164-165`　（同签名共 3 处，另见 `electronic_warfare/jam_strobe_tracking.txt:51`、`electronic_warfare/agile_jamming.txt:71`）
- **片段**：

```text
            effect noise_power_effect WSF_POWER_EFFECT
            end_effect
```

- **演示要点**：演示 WSF_POWER_EFFECT（最小结构，无子参数）

### effect · WSF_TRACK_EFFECT｜

- **关键词**：effect, WSF_TRACK_EFFECT
- **出处**：`electronic_warfare/track_effect_1.txt:90-93`
- **片段**：

```text
      effect track_mitigate_effect WSF_TRACK_EFFECT
         #debug
           track_behavior maintain
      end_effect
```

- **演示要点**：演示 WSF_TRACK_EFFECT（最小结构，无子参数）

### launch_acceptable_region（hellfire_type）｜

- **关键词**：launch_acceptable_region, delta_altitude, launch_speed, use_zone
- **出处**：`hellfire/active_radar_hellfire/hellfire_type.txt:329-336`　（同签名共 3 处，另见 `hellfire/laser_designation_via_dis/hellfire_type.txt:384`、`hellfire/semiactive_laser_hellfire/hellfire_type.txt:383`）
- **片段**：

```text
      launch_acceptable_region HELLFIRE_304m_101mps
         delta_altitude 0 m
         launch_speed 0 m/s
         use_zone HELLFIRE_304m_101mps as myZone
         #sensitivity_range_per_10m_altitude 0 m
         #sensitivity_range_per_10ms_velocity 0 m
         #sensitivity_range_per_percent_gradient 0 m
      end_launch_acceptable_region
```

- **演示要点**：演示 launch_acceptable_region 的参数：delta_altitude, launch_speed, use_zone

### launch_computer · WSF_ATA_LAUNCH_COMPUTER｜发射包线计算机

- **关键词**：launch_computer, WSF_ATA_LAUNCH_COMPUTER, minimum_slant_range, maximum_slant_range, maximum_boresight_angle, maximum_opening_speed, minimum_opening_speed, intercept_results, 发射包线计算机
- **出处**：`base_types/weapons/aam/blue_sr_a2a_ir_missile_ata_launch_computer_alt10kft_0.6mach.txt:11-78`　（同签名共 3 处，另见 `behavior_tree/weapons/aam/blue_sr_a2a_ir_missile_ata_launch_computer_alt10kft_0.6mach.txt:12`、`wargame/weapons/aam/aam_ata_launch_computer.txt:10`）
- **片段**：

```text
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

- **演示要点**：演示 WSF_ATA_LAUNCH_COMPUTER 的参数：minimum_slant_range, maximum_slant_range, maximum_boresight_angle, maximum_opening_speed, minimum_opening_speed, intercept_results

### launch_computer · WSF_BALLISTIC_MISSILE_LAUNCH_COMPUTER｜发射包线计算机

- **关键词**：launch_computer, WSF_BALLISTIC_MISSILE_LAUNCH_COMPUTER, maximum_time_of_flight, surface_to_air_table, integration_time_step, show_graphics, maximum_intercept_angle, 发射包线计算机
- **出处**：`ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:186-193`
- **片段**：

```text
launch_computer BLUE_NAVAL_SAM_LAUNCH_COMPUTER WSF_BALLISTIC_MISSILE_LAUNCH_COMPUTER
   maximum_time_of_flight             1000 sec
   surface_to_air_table               weapons/sam/blue_naval_sam_launch_data.txt
   integration_time_step              0.05 sec
   show_graphics
   # Disallow intercepts at unreasonable angles
   maximum_intercept_angle   60 deg
end_launch_computer
```

- **演示要点**：演示 WSF_BALLISTIC_MISSILE_LAUNCH_COMPUTER 的参数：maximum_time_of_flight, surface_to_air_table, integration_time_step, show_graphics, maximum_intercept_angle

### launch_computer · WSF_BALLISTIC_MISSILE_LAUNCH_COMPUTER｜发射包线计算机

- **关键词**：launch_computer, WSF_BALLISTIC_MISSILE_LAUNCH_COMPUTER, maximum_time_of_flight, surface_to_air_table, integration_time_step, maximum_intercept_angle, 发射包线计算机
- **出处**：`base_types/weapons/sam/blue_naval_sam.txt:184-191`
- **片段**：

```text
launch_computer BLUE_NAVAL_SAM_LAUNCH_COMPUTER WSF_BALLISTIC_MISSILE_LAUNCH_COMPUTER
   maximum_time_of_flight             1000 sec
   surface_to_air_table               weapons/sam/blue_naval_sam_launch_data.txt
   integration_time_step              0.05 sec

   # Disallow intercepts at unreasonable angles
   maximum_intercept_angle   60 deg
end_launch_computer
```

- **演示要点**：演示 WSF_BALLISTIC_MISSILE_LAUNCH_COMPUTER 的参数：maximum_time_of_flight, surface_to_air_table, integration_time_step, maximum_intercept_angle

### launch_computer · WSF_BALLISTIC_MISSILE_LAUNCH_COMPUTER｜发射包线计算机

- **关键词**：launch_computer, WSF_BALLISTIC_MISSILE_LAUNCH_COMPUTER, maximum_time_of_flight, surface_to_air_table, integration_time_step, show_graphics, 发射包线计算机
- **出处**：`space_operations/weapons/blue_naval_sam.txt:186-193`
- **片段**：

```text
launch_computer BLUE_NAVAL_SAM_LAUNCH_COMPUTER WSF_BALLISTIC_MISSILE_LAUNCH_COMPUTER
   maximum_time_of_flight             1000 sec
   surface_to_air_table               weapons/blue_naval_sam_launch_data.txt
   integration_time_step              0.05 sec
   show_graphics
   # Disallow intercepts at unreasonable angles
#   maximum_intercept_angle   60 deg
end_launch_computer
```

- **演示要点**：演示 WSF_BALLISTIC_MISSILE_LAUNCH_COMPUTER 的参数：maximum_time_of_flight, surface_to_air_table, integration_time_step, show_graphics

### launch_computer · WSF_BALLISTIC_MISSILE_LAUNCH_COMPUTER｜发射包线计算机

- **关键词**：launch_computer, WSF_BALLISTIC_MISSILE_LAUNCH_COMPUTER, surface_to_air_table, integration_time_step, maximum_intercept_angle, 发射包线计算机
- **出处**：`base_types/weapons/sam/blue_lr_sam_common.txt:339-345`　（同签名共 2 处，另见 `base_types/weapons/sam/blue_sr_sam_common.txt:199`）
- **片段**：

```text
launch_computer BLUE_LR_SAM_LAUNCH_COMPUTER WSF_BALLISTIC_MISSILE_LAUNCH_COMPUTER
   surface_to_air_table      weapons/sam/blue_lr_sam_launch_data.txt
   integration_time_step     0.05 sec

   # Disallow intercepts at unreasonable angles
   maximum_intercept_angle   60 deg
end_launch_computer
```

- **演示要点**：演示 WSF_BALLISTIC_MISSILE_LAUNCH_COMPUTER 的参数：surface_to_air_table, integration_time_step, maximum_intercept_angle

### launch_computer · WSF_AIR_TO_AIR_LAUNCH_COMPUTER｜发射包线计算机

- **关键词**：launch_computer, WSF_AIR_TO_AIR_LAUNCH_COMPUTER, debug, load_table, 发射包线计算机
- **出处**：`base_types/weapons/aam/simple_blue_lr_a2a_rf_missile.txt:18-21`
- **片段**：

```text
   launch_computer WSF_AIR_TO_AIR_LAUNCH_COMPUTER
      debug
      load_table blue_lr_a2a_rf_missile_launch_computer_table.txt
   end_launch_computer
```

- **演示要点**：演示 WSF_AIR_TO_AIR_LAUNCH_COMPUTER 的参数：debug, load_table

### launch_computer · WSF_AIR_TO_AIR_LAUNCH_COMPUTER｜发射包线计算机

- **关键词**：launch_computer, WSF_AIR_TO_AIR_LAUNCH_COMPUTER, load_table, 发射包线计算机
- **出处**：`air_to_air/weapons/aam/mrm_launch_computer.1.1.txt:10-12`　（同签名共 7 处，另见 `air_to_air/weapons/aam/mrm_lc.txt:10`、`air_to_air/weapons/aam/srm_lc.txt:10`、`base_types/weapons/aam/blue_lr_a2a_rf_missile_with_launch_computer.txt:15`）
- **片段**：

```text
launch_computer MRM_LC WSF_AIR_TO_AIR_LAUNCH_COMPUTER
   load_table mrm_launch_computer_table.1.1.txt
end_launch_computer
```

- **演示要点**：演示 WSF_AIR_TO_AIR_LAUNCH_COMPUTER 的参数：load_table

### launch_computer · WSF_BALLISTIC_MISSILE_LAUNCH_COMPUTER｜发射包线计算机

- **关键词**：launch_computer, WSF_BALLISTIC_MISSILE_LAUNCH_COMPUTER, surface_to_surface_table, 发射包线计算机
- **出处**：`ballistic_missile_shootdown/weapons/ssm/red_mrbm_1.txt:373-375`　（同签名共 11 处，另见 `base_types/weapons/ssm/red_icbm_1.txt:268`、`base_types/weapons/ssm/red_icbm_2.txt:387`、`base_types/weapons/ssm/red_mrbm_1.txt:373`）
- **片段**：

```text
launch_computer RED_MRBM_1_LAUNCH_COMPUTER WSF_BALLISTIC_MISSILE_LAUNCH_COMPUTER
   surface_to_surface_table weapons/ssm/red_mrbm_1_launch_data.txt
end_launch_computer
```

- **演示要点**：演示 WSF_BALLISTIC_MISSILE_LAUNCH_COMPUTER 的参数：surface_to_surface_table

### launch_computer · WSF_LAUNCH_COMPUTER｜发射包线计算机

- **关键词**：launch_computer, WSF_LAUNCH_COMPUTER, commanded_loft_angle, 发射包线计算机
- **出处**：`signature_demos/scenarios/rocket_launch.txt:27-29`　（同签名共 7 处，另见 `space_operations/launch_vehicles/atlas_v_401/test.txt:34`、`space_operations/launch_vehicles/delta_iv_m/test.txt:32`、`space_operations/launch_vehicles/falcon_9/test.txt:44`）
- **片段**：

```text
      launch_computer WSF_LAUNCH_COMPUTER
         commanded_loft_angle 83.3555 deg    # This just about hits 'target' 
      end_launch_computer
```

- **演示要点**：演示 WSF_LAUNCH_COMPUTER 的参数：commanded_loft_angle

### launch_computer · WSF_ORBITAL_LAUNCH_COMPUTER｜发射包线计算机

- **关键词**：launch_computer, WSF_ORBITAL_LAUNCH_COMPUTER, leo_data, 发射包线计算机
- **出处**：`space_operations/demo_delta_iv_m.txt:79-81`　（同签名共 4 处，另见 `space_operations/platforms/delta_iv_m_staging_failure.txt:36`、`space_operations/scenarios/launch.txt:38`、`space_operations/scenarios/launch_with_telemetry.txt:58`）
- **片段**：

```text
      launch_computer WSF_ORBITAL_LAUNCH_COMPUTER
         leo_data launch_vehicles/delta_iv_m/delta_iv_m_ccafs_leo.txt
      end_launch_computer
```

- **演示要点**：演示 WSF_ORBITAL_LAUNCH_COMPUTER 的参数：leo_data

### launch_computer · WSF_FIRES_LAUNCH_COMPUTER｜发射包线计算机

- **关键词**：launch_computer, WSF_FIRES_LAUNCH_COMPUTER, fires_table, 发射包线计算机
- **出处**：`fires/types/fires_120mm_artillery.txt:15-21`　（同签名共 9 处，另见 `fires/types/fires_120mm_mortar.txt:20`、`fires/types/fires_120mm_mortar_m934_he.txt:13`、`fires/types/fires_152mm_artillery.txt:15`）
- **片段**：

```text
launch_computer FIRES_120MM_ARTILLERY_LAUNCH_COMPUTER WSF_FIRES_LAUNCH_COMPUTER
  fires_table FIRES_120MM_ARTILLERY
      maximum_ordinate_values   376.367 434.216 497.708 568.108 645.866 731.082 824.125 926.828 1040.22 1165.23 1305.98 1463.59 end_maximum_ordinate_values
      range_values   5905.23 6205.24 6504.58 6805.12 7107.53 7409.15 7708.29 8009.73 8311 8610.23 8913.2 9215.95 end_range_values
      time_of_flight_values   17.51 18.76 20.01 21.31 22.66 24.06 25.51 27.06 28.61 30.26 32.01 33.86 end_time_of_flight_values
   end_fires_table
end_launch_computer
```

- **演示要点**：演示 WSF_FIRES_LAUNCH_COMPUTER 的参数：fires_table

### launch_computer · WSF_FIRES_LAUNCH_COMPUTER｜发射包线计算机

- **关键词**：launch_computer, WSF_FIRES_LAUNCH_COMPUTER, fires_elevation_angle_table, 发射包线计算机
- **出处**：`fires/types/fires_60mm_rocket.txt:14-23`　（同签名共 9 处，另见 `fires/types/fires_122mm_rocket_short.txt:15`、`fires/types/fires_107mm_rocket.txt:13`、`fires/types/fires_240mm_rocket.txt:14`）
- **片段**：

```text
launch_computer FIRES_60MM_ROCKET_LAUNCH_COMPUTER WSF_FIRES_LAUNCH_COMPUTER
  fires_elevation_angle_table FIRES_60MM_ROCKET
     1000 8.5 5.4
     1500 12.6 8.4
     2000 17.6 11.8
     2500 23.6 15.8
     3000 34.3 22.2
     3100 44.8 28.2
  end_fires_elevation_angle_table
end_launch_computer
```

- **演示要点**：演示 WSF_FIRES_LAUNCH_COMPUTER 的参数：fires_elevation_angle_table

### launch_computer · WSF_ATG_LAUNCH_COMPUTER｜发射包线计算机

- **关键词**：launch_computer, WSF_ATG_LAUNCH_COMPUTER, launch_acceptable_region, 发射包线计算机
- **出处**：`hellfire/active_radar_hellfire/hellfire_type.txt:328-337`　（同签名共 3 处，另见 `hellfire/laser_designation_via_dis/hellfire_type.txt:383`、`hellfire/semiactive_laser_hellfire/hellfire_type.txt:382`）
- **片段**：

```text
   launch_computer WSF_ATG_LAUNCH_COMPUTER
      launch_acceptable_region HELLFIRE_304m_101mps
         delta_altitude 0 m
         launch_speed 0 m/s
         use_zone HELLFIRE_304m_101mps as myZone
         #sensitivity_range_per_10m_altitude 0 m
         #sensitivity_range_per_10ms_velocity 0 m
         #sensitivity_range_per_percent_gradient 0 m
      end_launch_acceptable_region
   end_launch_computer
```

- **演示要点**：演示 WSF_ATG_LAUNCH_COMPUTER 的参数：launch_acceptable_region

### launch_computer · WSF_SCRIPT_LAUNCH_COMPUTER｜发射包线计算机

- **关键词**：launch_computer, WSF_SCRIPT_LAUNCH_COMPUTER, script, 发射包线计算机
- **出处**：`base_types/weapons/other/gun.txt:68-99`　（同签名共 4 处，另见 `brawler/weapons/other/gun.txt:68`、`gun_engagement/weapons/guns/BULLET_launch_computer.txt:4`、`ciws/weapons/guns/30mm_bullet_launch_computer.txt:11`）
- **片段**：

```text
launch_computer BULLET_LAUNCH_COMPUTER WSF_SCRIPT_LAUNCH_COMPUTER   #first attempt
   # This is the required script method name and signature.
   script void compute_intercept(WsfTrack aTrack, double aLaunchDelay)
      # If needed the following additional script variables are pre-defined:
      #
      #       WEAPON   references the WsfWeapon to which the launch computer is attached.
      #       PLATFORM references the WsfPlatform to which the weapon is attached.
      double weaponSpeed = 3000.0;         # feet/sec
      WsfWaypoint intercept = WsfWaypoint();
     #double tti = PLATFORM.InterceptLocation2D(aTrack, intercept, weaponSpeed, aLaunchDelay);
      double tti = PLATFORM.InterceptLocation3D(aTrack, intercept, weaponSpeed, aLaunchDelay);
      if (tti > 0.0)
      {
         double az = PLATFORM.RelativeAzimuthOf(intercept.Location());
         double el = PLATFORM.RelativeElevationOf(intercept.Location());
         if (az < WEAPON.SlewMaximumAzimuth() && az > WEAPON.SlewMinimumAzimuth() &&
             el < WEAPON.SlewMaximumElevation() && el > WEAPON.SlewMinimumElevation())
         {
            #compute additional drop in altitude from gravity
            double drop = 0.5 * Earth.ACCEL_OF_GRAVITY() * tti * tti;
            #add it back in (so the given point is above actual intercept point)
            intercept.SetAltitude(intercept.Altitude()+drop, false);

            SetInterceptPoint(intercept.Location());
            # The next call is the minimum requirement for reporting an intercept.
            SetInterceptTime(TIME_NOW + tti);
            SetLaunchTime(TIME_NOW + aLaunchDelay);
            SetTimeOfFlight(tti - aLaunchDelay);
         }
      }
   end_script
end_launch_computer
```

- **演示要点**：演示 WSF_SCRIPT_LAUNCH_COMPUTER 的参数：script

### launch_computer（blue_naval_sam）｜发射包线计算机

- **关键词**：launch_computer, 发射包线计算机
- **出处**：`ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:200-201`　（同签名共 56 处，另见 `ballistic_missile_shootdown/weapons/ssm/red_mrbm_1.txt:399`、`base_types/weapons/aam/simple_a2a_missile.txt:20`、`base_types/weapons/other/gun.txt:103`）
- **片段**：

```text
   launch_computer BLUE_NAVAL_SAM_LAUNCH_COMPUTER
   end_launch_computer
```

- **演示要点**：演示 launch_computer（最小结构，无子参数）

### launch_computer_table（mrm_launch_computer_table.1.1）｜

- **关键词**：launch_computer_table, no_escape_maneuver, independent_variables, intercept_results
- **出处**：`air_to_air/weapons/aam/mrm_launch_computer_table.1.1.txt:10-35`　（同签名共 2 处，另见 `air_to_air/weapons/aam/srm_launch_computer_table.1.1.txt:10`）
- **片段**：

```text
launch_computer_table
   # successes = 660, failures = 348
   # significant conditions = 319, versus null = 17
   # minRmin = 370.4, maxRmin = 24321
   # minRminTOF = 0.525775, maxRminTOF = 23.2213
   # minRmax = 13295.1, maxRmax = 154846
   # minRmaxTOF = 15.555, maxRmaxTOF = 101
   # minRne = 388.79, maxRne = 104979
   # minRneTOF = 0.648534, maxRneTOF = 101
   # Dimensionality = 2 X 2 X 2 X 2 X 7 X 3 = 336

   no_escape_maneuver 5 g 

   independent_variables
      shooter_altitudes 20000 ft 40000 ft end_shooter_altitudes
      shooter_machs 0.7 1.2 end_shooter_machs
      target_altitudes 20000 ft 40000 ft end_target_altitudes
      target_machs 0.7 0.9 end_target_machs
      target_aspects 0 deg 30 deg 60 deg 90 deg 120 deg 150 deg 180 deg end_target_aspects
      target_leads -30 deg 0 deg 30 deg end_target_leads
   end_independent_variables

   intercept_results
      include mrm_launch_computer_results.1.1.txt
   end_intercept_results
end_launch_computer_table
```

- **演示要点**：演示 launch_computer_table 的参数：no_escape_maneuver, independent_variables, intercept_results

### launch_computer_table（ata4_generator）｜

- **关键词**：launch_computer_table, no_escape_maneuver, independent_variables
- **出处**：`base_types/weapons/aam/ata4_generator.txt:120-130`　（同签名共 3 处，另见 `base_types/weapons/aam/ata4_generator.txt:135`、`base_types/weapons/aam/ata_blue_lr_a2a_rf_missile_lc_generator.txt:82`）
- **片段**：

```text
  launch_computer_table
     no_escape_maneuver 7 g
     independent_variables
        shooter_altitudes 10000 ft 20000 ft 30000 ft end_shooter_altitudes
        shooter_machs 0.8 1.0 1.2 1.4 1.6 1.8 2.0 end_shooter_machs
        target_altitudes 10000 ft 20000 ft 30000 ft end_target_altitudes
        target_machs 0.8 1.0 1.2 1.4 1.6 1.8 2.0  end_target_machs
        target_aspects     0 deg 30 deg 60 deg 90 deg 135 deg 180 deg  end_target_aspects
        target_lead_angles 0 deg 30 deg 60 deg 90 deg 135 deg 180 deg  end_target_lead_angles
     end_independent_variables
  end_launch_computer_table
```

- **演示要点**：演示 launch_computer_table 的参数：no_escape_maneuver, independent_variables

### weapon · WSF_RF_JAMMER｜武器

- **关键词**：weapon, WSF_RF_JAMMER, maximum_number_of_beams, beam_power_distribution, maximum_spots_per_beam, spot_power_distribution, azimuth_field_of_view, elevation_field_of_view, maximum_range, slew_mode, azimuth_slew_limits, elevation_slew_limits, electronic_beam_steering, electronic_beam_steering_loss_exponent, 武器
- **出处**：`electronic_warfare/test_false_targets/weapons/jammer/soj_xband_jammer.txt:36-120`
- **片段**：

```text
weapon SOJ_XBAND_JAMMER WSF_RF_JAMMER

  maximum_number_of_beams      2
  beam_power_distribution      average

  maximum_spots_per_beam       2
  spot_power_distribution      average

  # Field of view limits are slew limits + 1/2 the beamwidth
  azimuth_field_of_view       -65.0 deg 65.0 deg    # beamwidth estimate is 10 deg
  elevation_field_of_view     -65.0 deg 65.0 deg    # beamwidth estimate is 10 deg

  maximum_range                200 km

  slew_mode                    azimuth_and_elevation
  azimuth_slew_limits          -60.0 deg 60.0 deg
  elevation_slew_limits        -60.0 deg 60.0 deg

  electronic_beam_steering               azimuth_and_elevation
  electronic_beam_steering_loss_exponent 1.2

  transmitter
    antenna_pattern            SOJ_XBAND_ANTENNA
    frequency_band             8 ghz 12 ghz
    power                      1.5 kw
    internal_loss              0.0 db
     electronic_attack WSF_ELECTRONIC_ATTACK
        technique noise_jamming
           effect noise_effect WSF_JAMMER_POWER_EFFECT
              jamming_delta_gain 0 dB
           end_effect
         end_technique
         technique false_targets
            effect ft_effect WSF_FALSE_TARGET_EFFECT
            debug
               //jamming_pulse_density 0.01
               false_target_technique FALSE_TARGET_1
            end_effect
        end_technique

        technique false_targets_constrained
           effect ft_effect WSF_FALSE_TARGET_EFFECT
           debug
              jamming_pulse_density 0.01
              range_constrained true
              //false_target_technique FALSE_TARGET_1
           end_effect
        end_technique

        technique random_pulse_jamming
           effect rpj_effect WSF_RPJ_EFFECT
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
           end_effect
        end_technique

        technique track_error
           effect RANGE_ERROR WSF_TRACK_EFFECT
              track_behavior distort
              range_error 200 m
              //azimuth_error <angle-value>
              //elevation_error <angle-value>
              //range_drift_rate <speed-value>
           end_effect
        end_technique
     end_electronic_attack
  end_transmitter
end_weapon
```

- **演示要点**：演示 WSF_RF_JAMMER 的参数：maximum_number_of_beams, beam_power_distribution, maximum_spots_per_beam, spot_power_distribution, azimuth_field_of_view, elevation_field_of_view, maximum_range, slew_mode, azimuth_slew_limits, elevation_slew_limits

### weapon（soj_xband_jammer）｜武器

- **关键词**：weapon, maximum_number_of_beams, beam_power_distribution, maximum_spots_per_beam, spot_power_distribution, azimuth_field_of_view, elevation_field_of_view, slew_mode, azimuth_slew_limits, elevation_slew_limits, electronic_beam_steering, electronic_beam_steering_loss_exponent, transmitter, 武器
- **出处**：`aea_iads/weapons/jammer/soj_xband_jammer.txt:33-58`
- **片段**：

```text
weapon SOJ_XBAND_JAMMER SOJ_BASE_JAMMER

  maximum_number_of_beams      2
  beam_power_distribution      average

  maximum_spots_per_beam       2
  spot_power_distribution      average

  # Field of view limits are slew limits + 1/2 the beamwidth
  azimuth_field_of_view       -65.0 deg 65.0 deg    # beamwidth estimate is 10 deg
  elevation_field_of_view     -70.0 deg 70.0 deg    # beamwidth estimate is 20 deg

  slew_mode                    azimuth_and_elevation
  azimuth_slew_limits          -60.0 deg 60.0 deg
  elevation_slew_limits        -60.0 deg 60.0 deg

  electronic_beam_steering               azimuth_and_elevation
  electronic_beam_steering_loss_exponent 1.2

  transmitter
    antenna_pattern            SOJ_XBAND_ANTENNA
    frequency_band             8 ghz 12 ghz
    power                      1.5 kw
    internal_loss              0.0 db
  end_transmitter
end_weapon
```

- **演示要点**：演示 weapon 的参数：maximum_number_of_beams, beam_power_distribution, maximum_spots_per_beam, spot_power_distribution, azimuth_field_of_view, elevation_field_of_view, slew_mode, azimuth_slew_limits, elevation_slew_limits, electronic_beam_steering

### weapon · WSF_RF_JAMMER｜武器

- **关键词**：weapon, WSF_RF_JAMMER, maximum_number_of_beams, beam_power_distribution, maximum_spots_per_beam, spot_power_distribution, azimuth_field_of_view, elevation_field_of_view, maximum_range, slew_mode, azimuth_slew_limits, elevation_slew_limits, transmitter, antenna_pattern, 武器
- **出处**：`iads/weapons/jammer/soj_sband_jammer.txt:23-47`　（同签名共 2 处，另见 `iads/weapons/jammer/soj_xband_jammer.txt:23`）
- **片段**：

```text
weapon SOJ_SBAND_JAMMER WSF_RF_JAMMER

  maximum_number_of_beams      2
  beam_power_distribution      average

  maximum_spots_per_beam       2
  spot_power_distribution      average

  # Field of view limits are slew limits + 1/2 the beamwidth
  azimuth_field_of_view       -90.0 deg 90.0 deg
  elevation_field_of_view     -90.0 deg 90.0 deg

  maximum_range                200 km

  slew_mode                    azimuth_and_elevation
  azimuth_slew_limits          -80.0 deg 80.0 deg
  elevation_slew_limits        -80.0 deg 80.0 deg

  transmitter
    antenna_pattern            SOJ_SBAND_ANTENNA
    frequency_band             2000 mhz 4000 mhz
    power                      50.0 w
    internal_loss              0.0 db
  end_transmitter
end_weapon
```

- **演示要点**：演示 WSF_RF_JAMMER 的参数：maximum_number_of_beams, beam_power_distribution, maximum_spots_per_beam, spot_power_distribution, azimuth_field_of_view, elevation_field_of_view, maximum_range, slew_mode, azimuth_slew_limits, elevation_slew_limits

### weapon（soj_sband_jammer）｜武器

- **关键词**：weapon, maximum_number_of_beams, beam_power_distribution, maximum_spots_per_beam, spot_power_distribution, azimuth_field_of_view, elevation_field_of_view, slew_mode, azimuth_slew_limits, elevation_slew_limits, transmitter, antenna_pattern, frequency_band, 武器
- **出处**：`aea_iads/weapons/jammer/soj_sband_jammer.txt:25-47`
- **片段**：

```text
weapon SOJ_SBAND_JAMMER SOJ_BASE_JAMMER

  maximum_number_of_beams      2
  beam_power_distribution      average

  maximum_spots_per_beam       2
  spot_power_distribution      average

  # Field of view limits are slew limits + 1/2 the beamwidth
  azimuth_field_of_view       -90.0 deg 90.0 deg
  elevation_field_of_view     -90.0 deg 90.0 deg

  slew_mode                    azimuth_and_elevation
  azimuth_slew_limits          -80.0 deg 80.0 deg
  elevation_slew_limits        -80.0 deg 80.0 deg

  transmitter
    antenna_pattern            SOJ_SBAND_ANTENNA
    frequency_band             2000 mhz 4000 mhz
    power                      500.0 w
    internal_loss              0.0 db
  end_transmitter
end_weapon
```

- **演示要点**：演示 weapon 的参数：maximum_number_of_beams, beam_power_distribution, maximum_spots_per_beam, spot_power_distribution, azimuth_field_of_view, elevation_field_of_view, slew_mode, azimuth_slew_limits, elevation_slew_limits, transmitter

### weapon · WSF_RF_JAMMER｜武器

- **关键词**：weapon, WSF_RF_JAMMER, maximum_number_of_beams, beam_power_distribution, maximum_spots_per_beam, spot_power_distribution, slew_mode, azimuth_slew_limits, elevation_slew_limits, maximum_range, transmitter, antenna_pattern, frequency_band, power, 武器
- **出处**：`electronic_warfare/test_multi_beam/weapons/jammer/soj_sband_jammer.txt:24-51`　（同签名共 2 处，另见 `electronic_warfare/test_multi_beam/weapons/jammer/soj_xband_jammer.txt:24`）
- **片段**：

```text
weapon SOJ_SBAND_JAMMER WSF_RF_JAMMER

  maximum_number_of_beams      2
  beam_power_distribution      average

  maximum_spots_per_beam       2
  spot_power_distribution      average

  slew_mode                    azimuth_and_elevation
  azimuth_slew_limits          -60.0 deg 60.0 deg
  elevation_slew_limits        -60.0 deg 60.0 deg

  maximum_range                200 km

  transmitter
    antenna_pattern            SOJ_SBAND_ANTENNA
    frequency_band             2000 mhz 4000 mhz
    power                      50.0 w
    internal_loss              0.0 db
    electronic_attack
       technique noise_jamming
          effect noise_effect WSF_JAMMER_POWER_EFFECT
             jamming_delta_gain 0 dB
          end_effect
        end_technique
     end_electronic_attack
  end_transmitter
end_weapon
```

- **演示要点**：演示 WSF_RF_JAMMER 的参数：maximum_number_of_beams, beam_power_distribution, maximum_spots_per_beam, spot_power_distribution, slew_mode, azimuth_slew_limits, elevation_slew_limits, maximum_range, transmitter, antenna_pattern

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, launched_platform_type, weapon_effects, quantity, firing_delay, salvo_interval, slew_mode, azimuth_slew_limits, elevation_slew_limits, reload_threshold, reload_increment, reload_inventory, reload_time, 武器
- **出处**：`ship_ad/weapons/sam/red_sr_sam_1.txt:71-89`
- **片段**：

```text
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

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：launched_platform_type, weapon_effects, quantity, firing_delay, salvo_interval, slew_mode, azimuth_slew_limits, elevation_slew_limits, reload_threshold, reload_increment

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, launched_platform_type, weapon_effects, quantity, firing_delay, salvo_interval, slew_mode, azimuth_slew_limits, elevation_slew_limits, reload_threshold, reload_increment, reload_inventory, reload_time, 武器
- **出处**：`ship_ad/weapons/sam/red_sr_naval_sam_1.txt:82-98`
- **片段**：

```text
weapon RED_SR_NAVAL_SAM_1 WSF_EXPLICIT_WEAPON
   launched_platform_type RED_SR_NAVAL_SAM_1
   weapon_effects RED_SR_NAVAL_SAM_1_EFFECT

   quantity 2
   firing_delay           1.0 sec   # unknown
   salvo_interval         3.0 sec   # unknown

   slew_mode              azimuth_and_elevation
   azimuth_slew_limits    -180.0 deg 180.0 deg
   elevation_slew_limits  10.0 deg 70.0 deg  # allow some super-elevation for low-alt targets

   reload_threshold       1
   reload_increment       1
   reload_inventory       46
   reload_time            12 sec   # Ref 2
end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：launched_platform_type, weapon_effects, quantity, firing_delay, salvo_interval, slew_mode, azimuth_slew_limits, elevation_slew_limits, reload_threshold, reload_increment

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, launch_computer, launched_platform_type, weapon_effects, slew_mode, azimuth_slew_limits, elevation_slew_limits, quantity, firing_delay, salvo_interval, launch_delta_v, automatic_target_cueing, cue_to_predicted_intercept, 武器
- **出处**：`base_types/weapons/other/gun.txt:102-121`　（同签名共 2 处，另见 `brawler/weapons/other/gun.txt:102`）
- **片段**：

```text
weapon BULLET WSF_EXPLICIT_WEAPON
   launch_computer BULLET_LAUNCH_COMPUTER   #first attempt
   end_launch_computer
   launched_platform_type  BULLET
   weapon_effects          BULLET_LETHALITY
   # Slew is really not true but only for the air mover platform to be able to align to a target for it to shoot.
   slew_mode               azimuth_and_elevation
  #azimuth_slew_limits     -4 deg 4 deg
  #elevation_slew_limits   -4 deg 4 deg
   azimuth_slew_limits     -1.0 deg 1.0 deg
   elevation_slew_limits   -1.0 deg 1.0 deg
   quantity                10    #(each shot represents a quantity of bullets as established by Pk)
   firing_delay            0.1 sec
   salvo_interval          5 sec  # 5 seconds between bursts
  #launch_delta_v          1900   0   0 ft/s # muzzle velocity
   launch_delta_v          3000   0   0 ft/s # muzzle velocity - brawler: GUN_0_MD.GUN
  #cue_to_predicted_intercept  true
   automatic_target_cueing     false
   cue_to_predicted_intercept  false
end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：launch_computer, launched_platform_type, weapon_effects, slew_mode, azimuth_slew_limits, elevation_slew_limits, quantity, firing_delay, salvo_interval, launch_delta_v

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, script_variables, launch_computer, launched_platform_type, weapon_effects, slew_mode, quantity, firing_delay, firing_interval, salvo_interval, automatic_target_cueing, cue_to_predicted_intercept, script, 武器
- **出处**：`ciws/weapons/guns/30mm_bullet.txt:54-78`
- **片段**：

```text
weapon 30MM_BULLET WSF_EXPLICIT_WEAPON
    script_variables
        double AVG_VEL = 1021 ;  # muzzle velocity
        double VARIANCE = 3.0;   # Unknown muzzle velocity +/- variance
    end_script_variables
    launch_computer           30MM_BULLET_LAUNCH_COMPUTER   end_launch_computer
    launched_platform_type    30MM_BULLET
    weapon_effects            30MM_BULLET_LETHALITY
    slew_mode                 azimuth_and_elevation
       azimuth_slew_limits       -180 deg 180 deg
       elevation_slew_limits      -10 deg  85 deg
    quantity                  1200
    firing_delay              0 secs
    firing_interval           0.0142857 sec # 70 rnds per sec
    salvo_interval            0.0142857 sec  # 70 rnds per sec   
    #launch_delta_v            1021  0 0 m/s   # This is set in the on_create script

    automatic_target_cueing    true
    cue_to_predicted_intercept  true

    script void on_create(WsfPlatform aWeapon, WsfTrack aTarget)
       double LAUNCH_VEL = MATH.RandomUniform(AVG_VEL-VARIANCE, AVG_VEL+VARIANCE);
       aWeapon.SetVelocityECS(LAUNCH_VEL, 0, 0);  # Just like launch_delta_v...
    end_script
end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：script_variables, launch_computer, launched_platform_type, weapon_effects, slew_mode, quantity, firing_delay, firing_interval, salvo_interval, automatic_target_cueing

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, quantity, maximum_quantity, launched_platform_type, firing_delay, salvo_interval, firing_interval, update_interval, weapon_effects, launch_delta_v, ignore_launch_platform_velocity, launch_computer, 武器
- **出处**：`hellfire/active_radar_hellfire/hellfire_type.txt:315-338`　（同签名共 3 处，另见 `hellfire/laser_designation_via_dis/hellfire_type.txt:369`、`hellfire/semiactive_laser_hellfire/hellfire_type.txt:368`）
- **片段**：

```text
weapon HELLFIRE_LAUNCHER WSF_EXPLICIT_WEAPON
   quantity 4
   maximum_quantity 16
   launched_platform_type RF_HELLFIRE
   firing_delay   1.5 sec
   salvo_interval 4.0 sec
   firing_interval 4.0 sec
   update_interval 0.1 sec
   weapon_effects HELLFIRE_EFFECT

   launch_delta_v 3 0 0 m/s
   ignore_launch_platform_velocity true

   launch_computer WSF_ATG_LAUNCH_COMPUTER
      launch_acceptable_region HELLFIRE_304m_101mps
         delta_altitude 0 m
         launch_speed 0 m/s
         use_zone HELLFIRE_304m_101mps as myZone
         #sensitivity_range_per_10m_altitude 0 m
         #sensitivity_range_per_10ms_velocity 0 m
         #sensitivity_range_per_percent_gradient 0 m
      end_launch_acceptable_region
   end_launch_computer
end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：quantity, maximum_quantity, launched_platform_type, firing_delay, salvo_interval, firing_interval, update_interval, weapon_effects, launch_delta_v, ignore_launch_platform_velocity

### weapon · WSF_RF_JAMMER｜武器

- **关键词**：weapon, WSF_RF_JAMMER, maximum_range, maximum_number_of_beams, beam_power_distribution, maximum_spots_per_beam, spot_power_distribution, azimuth_field_of_view, elevation_field_of_view, slew_mode, azimuth_slew_limits, elevation_slew_limits, transmitter, 武器
- **出处**：`alv_routing/weapons/alv_jammer.txt:56-80`
- **片段**：

```text
weapon ALV_JAMMER WSF_RF_JAMMER
   maximum_range             200 km

   maximum_number_of_beams   2
   beam_power_distribution   average

   maximum_spots_per_beam    2
   spot_power_distribution   average

   azimuth_field_of_view    -90.0 deg 90.0 deg
   elevation_field_of_view  -90.0 deg 90.0 deg

  slew_mode                    azimuth_and_elevation
  azimuth_slew_limits          -80.0 deg 80.0 deg
  elevation_slew_limits        -80.0 deg 80.0 deg

   transmitter
      antenna_pattern         ALV_JAMMER_ANTENNA
      frequency_band          30 mhz 3000 mhz
      power                   100.0 w
      internal_loss           0.0 db

      electronic_attack ALV_EA end_electronic_attack
   end_transmitter
end_weapon
```

- **演示要点**：演示 WSF_RF_JAMMER 的参数：maximum_range, maximum_number_of_beams, beam_power_distribution, maximum_spots_per_beam, spot_power_distribution, azimuth_field_of_view, elevation_field_of_view, slew_mode, azimuth_slew_limits, elevation_slew_limits

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, launched_platform_type, weapon_effects, automatic_target_cueing, quantity, firing_delay, salvo_interval, firing_interval, slew_mode, azimuth_slew_limits, elevation_slew_limits, 武器
- **出处**：`shooter/weapons/aam/aa_mrm.txt:203-215`
- **片段**：

```text
weapon AA_MRM WSF_EXPLICIT_WEAPON
   launched_platform_type      AA_MRM
   weapon_effects              AA_MRM_EFFECT
   automatic_target_cueing     true
   quantity                    1
   firing_delay                0.2 sec   # unknown
   salvo_interval              5.0 sec   # unknown
   firing_interval             15.0 sec   # unknown
   slew_mode                   azimuth_and_elevation
   azimuth_slew_limits         -15.0 deg 15.0 deg  # allows for off boresight target slewing
   elevation_slew_limits       -35.0 deg 15.0 deg  # allow some super-elevation for low-alt targets

end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：launched_platform_type, weapon_effects, automatic_target_cueing, quantity, firing_delay, salvo_interval, firing_interval, slew_mode, azimuth_slew_limits, elevation_slew_limits

### weapon · WSF_RF_JAMMER｜武器

- **关键词**：weapon, WSF_RF_JAMMER, maximum_number_of_spots, spot_power_distribution, slew_mode, maximum_range, transmitter, antenna_pattern, frequency_band, power, internal_loss, electronic_attack, 武器
- **出处**：`electronic_warfare/test_multi_beam/weapons/jammer/soj_vhf_jammer.txt:19-41`
- **片段**：

```text
weapon SOJ_VHF_JAMMER WSF_RF_JAMMER

  maximum_number_of_spots      2
  spot_power_distribution      average

  slew_mode                    fixed

  maximum_range                200 km

  transmitter
    antenna_pattern            SOJ_VHF_ANTENNA
    frequency_band             30 mhz 300 mhz
    power                      100.0 w
    internal_loss              0.0 db
    electronic_attack
     technique noise_jamming
        effect noise_effect WSF_JAMMER_POWER_EFFECT
           jamming_delta_gain 0 dB
        end_effect
      end_technique
     end_electronic_attack
  end_transmitter
end_weapon
```

- **演示要点**：演示 WSF_RF_JAMMER 的参数：maximum_number_of_spots, spot_power_distribution, slew_mode, maximum_range, transmitter, antenna_pattern, frequency_band, power, internal_loss, electronic_attack

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, launched_platform_type, weapon_effects, quantity, firing_delay, salvo_interval, slew_mode, azimuth_slew_limits, tilt, launch_delta_v, 武器
- **出处**：`base_types/weapons/agm/mach_4_missile.txt:149-159`　（同签名共 3 处，另见 `new_guidance/weapons/ssm/ssm_missile.txt:204`、`ship_ad/weapons/ssm/ssm_missile.txt:114`）
- **片段**：

```text
weapon MACH_4_MISSILE WSF_EXPLICIT_WEAPON
   launched_platform_type MACH_4_MISSILE
   weapon_effects MACH_4_MISSILE_LETHALITY
   quantity 1
   firing_delay 0.0 sec
   salvo_interval 2.0 sec
   slew_mode azimuth
   azimuth_slew_limits -180.0 deg 180.0 deg
   tilt 88.9 deg
   launch_delta_v 60.0 0.0 0.0 fps
end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：launched_platform_type, weapon_effects, quantity, firing_delay, salvo_interval, slew_mode, azimuth_slew_limits, tilt, launch_delta_v

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, launched_platform_type, weapon_effects, quantity, firing_delay, firing_interval, salvo_interval, slew_mode, azimuth_slew_limits, elevation_slew_limits, 武器
- **出处**：`electronic_warfare/track_error.txt:176-186`　（同签名共 2 处，另见 `ship_ad/weapons/sam/red_sr_sam_2.txt:91`）
- **片段**：

```text
weapon SAM_MISSILE WSF_EXPLICIT_WEAPON
   launched_platform_type SAM_MISSILE
   weapon_effects SAM_MISSILE_EFFECT
   quantity 8
   firing_delay           1.0 sec
   firing_interval        20 sec
   salvo_interval         3.0 sec
   slew_mode              azimuth_and_elevation
   azimuth_slew_limits    -180.0 deg 180.0 deg
   elevation_slew_limits  10.0 deg 80.0 deg
end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：launched_platform_type, weapon_effects, quantity, firing_delay, firing_interval, salvo_interval, slew_mode, azimuth_slew_limits, elevation_slew_limits

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, launched_platform_type, weapon_effects, slew_mode, quantity, firing_delay, salvo_interval, launch_delta_v, automatic_target_cueing, cue_to_predicted_intercept, 武器
- **出处**：`gun_engagement/weapons/guns/BULLET.txt:50-64`
- **片段**：

```text
weapon BULLET WSF_EXPLICIT_WEAPON
    #launch_computer           BULLET_LAUNCH_COMPUTER   end_launch_computer
    launched_platform_type    BULLET
    weapon_effects            BULLET_LETHALITY
    slew_mode                 azimuth_and_elevation
       azimuth_slew_limits       -180 deg 180 deg
       elevation_slew_limits      -10 deg  85 deg
    quantity                  1200
    firing_delay              0 secs
    #firing_interval           10 secs  # cool down time after a salvo - total guess
    salvo_interval            0.0142857 sec
    launch_delta_v            1021 0 0 m/s
    automatic_target_cueing    true
    cue_to_predicted_intercept  true
end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：launched_platform_type, weapon_effects, slew_mode, quantity, firing_delay, salvo_interval, launch_delta_v, automatic_target_cueing, cue_to_predicted_intercept

### weapon · WSF_RF_JAMMER｜武器

- **关键词**：weapon, WSF_RF_JAMMER, maximum_number_of_spots, spot_power_distribution, slew_mode, maximum_range, transmitter, antenna_pattern, frequency_band, power, internal_loss, 武器
- **出处**：`iads/weapons/jammer/soj_vhf_jammer.txt:18-33`
- **片段**：

```text
weapon SOJ_VHF_JAMMER WSF_RF_JAMMER

  maximum_number_of_spots      2
  spot_power_distribution      average

  slew_mode                    fixed

  maximum_range                200 km

  transmitter
    antenna_pattern            SOJ_VHF_ANTENNA
    frequency_band             30 mhz 300 mhz
    power                      100.0 w
    internal_loss              0.0 db
  end_transmitter
end_weapon
```

- **演示要点**：演示 WSF_RF_JAMMER 的参数：maximum_number_of_spots, spot_power_distribution, slew_mode, maximum_range, transmitter, antenna_pattern, frequency_band, power, internal_loss

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, location, launched_platform_type, launch_computer, tilt, cue_to_predicted_intercept, slew_mode, azimuth_slew_limits, quantity, require_loft_angle, 武器
- **出处**：`base_types/weapons/sam/blue_sr_sam_common.txt:209-236`　（同签名共 11 处，另见 `base_types/weapons/sam/blue_lr_sam_common.txt:349`、`ballistic_missile_shootdown/weapons/ssm/red_mrbm_1.txt:390`、`base_types/weapons/ssm/red_icbm_2.txt:404`）
- **片段**：

```text
weapon BLUE_SR_SAM WSF_EXPLICIT_WEAPON

   # The location offset puts the weapon center at half the length - 1 m.
   # This assumes the scenario creator puts the launching platform at 1 m agl.

   location 0.0 0.0 -1.6025 m                    # Ref 1, length = 5.205 m

   launched_platform_type BLUE_SR_SAM

   launch_computer BLUE_SR_SAM_LAUNCH_COMPUTER
   end_launch_computer

   tilt 35 deg

   # This causes a call to the launch computer to compute the predicted intercept.
   # The launcher will then be cued to the proper angles (Subject to the slewing
   # limits defined below). This is a bit of a hack until the guidance computer
   # is changed...

   cue_to_predicted_intercept true
   slew_mode azimuth
   azimuth_slew_limits -180 deg 180 deg

   quantity 16                                   # Ref 2

   # Abort the launch if the launch computer didn't provide the required data
   require_loft_angle
end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：location, launched_platform_type, launch_computer, tilt, cue_to_predicted_intercept, slew_mode, azimuth_slew_limits, quantity, require_loft_angle

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, cue_to_predicted_intercept, launched_platform_type, launch_delta_v, tilt, slew_mode, azimuth_slew_limits, quantity, firing_delay, salvo_interval, 武器
- **出处**：`engage/weapons/lrsam.txt:167-199`
- **片段**：

```text
weapon LRSAM WSF_EXPLICIT_WEAPON

   #launch_computer LRSAM_LAUNCH_COMPUTER
   #end_launch_computer

   cue_to_predicted_intercept true

   launched_platform_type LRSAM

   # Janes indicates the missile is ejected from the canister and ignites at 25 m altitude.
   launch_delta_v 22.4 0 0 m/s

   # The missiles are launched vertically from the canisters.
   # We can't specify 90 degrees because of a singularity
   tilt  89.9 degrees
   tilt 90.0 degrees
   tilt 89.999 degrees

   # The user should cue the weapon to the target track before launching.
   # This is a bit of a hack until the missile guidance computer will roll.
   slew_mode azimuth
   azimuth_slew_limits -180 deg 180 deg

   # Janes indicates there are 4 canisters per TEL
   quantity 4

   # Janes had no value here. Assume there is some reaction time.
   firing_delay   1.0 secs
   firing_delay   0.0 secs

   # Janes indicated the salvo interval was 3-5 seconds
   salvo_interval uniform minimum 3.0 secs maximum 5.0 secs
end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：cue_to_predicted_intercept, launched_platform_type, launch_delta_v, tilt, slew_mode, azimuth_slew_limits, quantity, firing_delay, salvo_interval

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, launched_platform_type, weapon_effects, launch_computer, firing_delay, firing_interval, salvo_interval, slew_mode, azimuth_slew_limits, 武器
- **出处**：`air_to_air/weapons/aam/medium_range_radar_missile.txt:250-259`
- **片段**：

```text
weapon MEDIUM_RANGE_RADAR_MISSILE WSF_EXPLICIT_WEAPON
   launched_platform_type MEDIUM_RANGE_RADAR_MISSILE
   weapon_effects SIMPLE_EFFECT   
   launch_computer MRM_LC end_launch_computer
   firing_delay           0.5 sec
   firing_interval        1 sec
   salvo_interval         5.0 sec
   slew_mode              azimuth_and_elevation
   azimuth_slew_limits    -180.0 deg 180.0 deg
end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：launched_platform_type, weapon_effects, launch_computer, firing_delay, firing_interval, salvo_interval, slew_mode, azimuth_slew_limits

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, launched_platform_type, weapon_effects, quantity, firing_delay, salvo_interval, slew_mode, azimuth_slew_limits, elevation_slew_limits, 武器
- **出处**：`launcher/weapons/sam/sam_missile.txt:59-68`　（同签名共 14 处，另见 `alternate_locations/weapons/sam/large_sam.txt:48`、`cyber/exfiltrate_demo/weapons/sam/large_sam.txt:80`、`electronic_warfare/test_false_targets/weapons/sam/large_sam.txt:114`）
- **片段**：

```text
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

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：launched_platform_type, weapon_effects, quantity, firing_delay, salvo_interval, slew_mode, azimuth_slew_limits, elevation_slew_limits

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, launched_platform_type, weapon_effects, quantity, firing_delay, salvo_interval, slew_mode, azimuth_slew_limits, tilt, 武器
- **出处**：`base_types/weapons/ssm/blue_cruise_missile.txt:115-124`
- **片段**：

```text
weapon BLUE_CRUISE_MISSILE WSF_EXPLICIT_WEAPON
  launched_platform_type BLUE_CRUISE_MISSILE
  weapon_effects BLUE_CRUISE_MISSILE_LETHALITY
  quantity 1
  firing_delay 0.0 sec
  salvo_interval 2 sec
  slew_mode azimuth
  azimuth_slew_limits -180 deg 180 deg
  tilt 88.9 deg
end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：launched_platform_type, weapon_effects, quantity, firing_delay, salvo_interval, slew_mode, azimuth_slew_limits, tilt

### weapon（soj_vhf_jammer）｜武器

- **关键词**：weapon, maximum_number_of_spots, spot_power_distribution, slew_mode, transmitter, antenna_pattern, frequency_band, power, internal_loss, 武器
- **出处**：`aea_iads/weapons/jammer/soj_vhf_jammer.txt:20-33`
- **片段**：

```text
weapon SOJ_VHF_JAMMER SOJ_BASE_JAMMER

  maximum_number_of_spots      4
  spot_power_distribution      constant

  slew_mode                    fixed

  transmitter
    antenna_pattern            SOJ_VHF_ANTENNA
    frequency_band             30 mhz 300 mhz
    power                      100.0 w
    internal_loss              0.0 db
  end_transmitter
end_weapon
```

- **演示要点**：演示 weapon 的参数：maximum_number_of_spots, spot_power_distribution, slew_mode, transmitter, antenna_pattern, frequency_band, power, internal_loss

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, launched_platform_type, weapon_effects, quantity, firing_delay, salvo_interval, slew_mode, azimuth_slew_limits, aux_data, 武器
- **出处**：`iads_c2_demos/weapons/aa_missile.txt:70-87`
- **片段**：

```text
weapon AIR_TO_AIR_MISSILE WSF_EXPLICIT_WEAPON
   launched_platform_type AIR_TO_AIR_MISSILE
   weapon_effects SIMPLE_EFFECT
   quantity               2
   firing_delay           0.5 sec
   salvo_interval         5.0 sec
   slew_mode              azimuth_and_elevation
   azimuth_slew_limits    -180.0 deg 180.0 deg

   aux_data
      double maxTOF = 20 #s
      double avgSpd = 1657 #m/sec
      double maxRng = 20000 #m
      double minRng =  5000 #m
      double shootDelay = 0.0 #s
      double estPK = 0.75
   end_aux_data
end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：launched_platform_type, weapon_effects, quantity, firing_delay, salvo_interval, slew_mode, azimuth_slew_limits, aux_data

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, launched_platform_type, launch_computer, tilt, cue_to_predicted_intercept, slew_mode, azimuth_slew_limits, quantity, require_loft_angle, 武器
- **出处**：`ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:197-217`　（同签名共 3 处，另见 `base_types/weapons/sam/blue_naval_sam.txt:195`、`space_operations/weapons/blue_naval_sam.txt:197`）
- **片段**：

```text
weapon BLUE_NAVAL_SAM WSF_EXPLICIT_WEAPON
   launched_platform_type BLUE_NAVAL_SAM

   launch_computer BLUE_NAVAL_SAM_LAUNCH_COMPUTER
   end_launch_computer

   tilt  89.9 degrees

   # This causes a call to the launch computer to compute the predicted intercept.
   # The launcher will then be cued to the proper angles (Subject to the slewing
   # limits defined below). This is a bit of a hack until the guidance computer
   # is changed...

   cue_to_predicted_intercept true
   slew_mode azimuth
   azimuth_slew_limits -180 deg 180 deg

   quantity               1

   require_loft_angle
end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：launched_platform_type, launch_computer, tilt, cue_to_predicted_intercept, slew_mode, azimuth_slew_limits, quantity, require_loft_angle

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, location, launched_platform_type, launch_computer, tilt, cue_to_predicted_intercept, slew_mode, azimuth_slew_limits, quantity, 武器
- **出处**：`base_types/weapons/ssm/red_icbm_1.txt:274-294`
- **片段**：

```text
weapon RED_ICBM_1 WSF_EXPLICIT_WEAPON

   # The location offset puts the weapon center at half the length - 1 m.
   # This assumes the scenario creator puts the launching platform at 1 m agl.

   location 0.0 0.0 -9.0 m     # 1/2 distance of length of missile

   launched_platform_type RED_ICBM_1

   launch_computer RED_ICBM_1_LAUNCH_COMPUTER
   end_launch_computer

   tilt  89.9 degrees

   cue_to_predicted_intercept true
   slew_mode azimuth
   azimuth_slew_limits -180 deg 180 deg

   # Default to a single weapon on the vehicle
   quantity 1
end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：location, launched_platform_type, launch_computer, tilt, cue_to_predicted_intercept, slew_mode, azimuth_slew_limits, quantity

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, launched_platform_type, launch_delta_v, tilt, slew_mode, azimuth_slew_limits, quantity, firing_delay, salvo_interval, 武器
- **出处**：`orwaca_iads/weapons/sam/elr_sam.txt:142-169`　（同签名共 4 处，另见 `orwaca_iads/weapons/sam/lr_sam.txt:143`、`orwaca_iads/weapons/sam/mr_sam.txt:142`、`wargame/weapons/sam/sam.txt:114`）
- **片段**：

```text
weapon ELR_SAM WSF_EXPLICIT_WEAPON

   launched_platform_type ELR_SAM  // (User will probably choose to override this type.)
// We will manually make our own launch computer
#   launch_computer        ELR_SAM_LAUNCH_COMPUTER end_launch_computer

   // A cannister missile is ejected from the canister and ignites at 25 m altitude.
   launch_delta_v 22.4 0 0 m/s

   // The missiles are launched vertically from the canisters.
   // We can't specify 90 degrees because of a singularity
   tilt  89.9 degrees

   // The user should cue the weapon to the target track before launching.
   // This is a bit of a hack until the missile guidance computer will roll.
   slew_mode azimuth
   azimuth_slew_limits -180 deg 180 deg

   // There are 4 canisters per TEL
   quantity 4

   // Assume there is some reaction time.
   firing_delay   1.0 secs

   // Salvo interval
   salvo_interval uniform minimum 4.0 secs maximum 7.0 secs

end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：launched_platform_type, launch_delta_v, tilt, slew_mode, azimuth_slew_limits, quantity, firing_delay, salvo_interval

### weapon · WSF_RF_JAMMER｜武器

- **关键词**：weapon, WSF_RF_JAMMER, maximum_number_of_spots, slew_mode, azimuth_slew_limits, elevation_slew_limits, electronic_beam_steering, electronic_beam_steering_loss_exponent, repeater, transmitter, 武器
- **出处**：`electronic_warfare/agile_repeater_jamming.txt:69-116`
- **片段**：

```text
weapon JAMMER WSF_RF_JAMMER
#debug

   maximum_number_of_spots 2

  slew_mode                    azimuth_and_elevation
  azimuth_slew_limits          -60.0 deg 60.0 deg
  elevation_slew_limits        -60.0 deg 60.0 deg

  electronic_beam_steering               azimuth_and_elevation
  electronic_beam_steering_loss_exponent 1.2

   repeater
      signal_following    true
      operating_mode         auto
      #debug
   end_repeater

   transmitter
      power                100 w
      frequency_band       100 mhz 1000 mhz
      antenna_pattern      JAMMER_ANTENNA

      electronic_attack
         technique noise_jamming
            default_on
            mitigation_class_name NOISE_JAMMING
            effect power_effect WSF_JAMMER_POWER_EFFECT
            end_effect
         end_technique

         technique false_target_jamming
            //default_on
            mitigation_class_name FALSE_TARGET_JAMMING
            effect ft_effect WSF_FALSE_TARGET_EFFECT
                system_type_data default
                   jamming_pulse_density 0.2
                   scan_rate_multiplier 2.0
                end_system_type_data
                system_type_data EW_RADAR
                   jamming_pulse_density 0.1
                   scan_rate_multiplier 2.0
                end_system_type_data
             end_effect
          end_technique
      end_electronic_attack
   end_transmitter
end_weapon
```

- **演示要点**：演示 WSF_RF_JAMMER 的参数：maximum_number_of_spots, slew_mode, azimuth_slew_limits, elevation_slew_limits, electronic_beam_steering, electronic_beam_steering_loss_exponent, repeater, transmitter

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, launched_platform_type, weapon_effects, quantity, firing_delay, salvo_interval, slew_mode, azimuth_slew_limits, 武器
- **出处**：`base_types/weapons/aam/medium_range_missile.txt:79-87`　（同签名共 10 处，另见 `base_types/weapons/aam/medium_range_radar_missile.txt:180`、`base_types/weapons/aam/medium_range_uplink_missile.txt:132`、`behavior_tree/weapons/aam/medium_range_radar_missile.txt:178`）
- **片段**：

```text
weapon MEDIUM_RANGE_MISSILE WSF_EXPLICIT_WEAPON
   launched_platform_type MEDIUM_RANGE_MISSILE
   weapon_effects SIMPLE_EFFECT
   quantity               4
   firing_delay           0.5 sec
   salvo_interval         5.0 sec
   slew_mode              azimuth_and_elevation
   azimuth_slew_limits    -180.0 deg 180.0 deg
end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：launched_platform_type, weapon_effects, quantity, firing_delay, salvo_interval, slew_mode, azimuth_slew_limits

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, location, launched_platform_type, tilt, cue_to_predicted_intercept, slew_mode, azimuth_slew_limits, quantity, 武器
- **出处**：`base_types_nx/weapons/ssm/blue_slbm.txt:174-191`
- **片段**：

```text
weapon BLUE_SLBM WSF_EXPLICIT_WEAPON

   # The location offset puts the weapon center at half the length - 1 m.
   # This assumes the scenario creator puts the launching platform at 1 m agl.

   location 0.0 0.0 -5.71 m     # 1/2 distance of length of missile - 1

   launched_platform_type BLUE_SLBM

#   launch_computer BLUE_SLBM_LAUNCH_COMPUTER end_launch_computer

   tilt  89.9 degrees

   cue_to_predicted_intercept true
   slew_mode azimuth
   azimuth_slew_limits -180 deg 180 deg
   quantity 1  # Default to a single weapon on the vehicle
end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：location, launched_platform_type, tilt, cue_to_predicted_intercept, slew_mode, azimuth_slew_limits, quantity

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, launched_platform_type, weapon_effects, script, quantity, slew_mode, azimuth_slew_limits, pitch, 武器
- **出处**：`ship_ad/weapons/agm/red_asm_msl.txt:71-89`
- **片段**：

```text
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

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：launched_platform_type, weapon_effects, script, quantity, slew_mode, azimuth_slew_limits, pitch

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, launched_platform_type, tilt, slew_mode, azimuth_slew_limits, quantity, firing_delay, salvo_interval, 武器
- **出处**：`cyber/weapons/sam/sr_sam.txt:149-176`　（同签名共 2 处，另见 `orwaca_iads/weapons/sam/sr_sam.txt:146`）
- **片段**：

```text
weapon SR_SAM WSF_EXPLICIT_WEAPON

   launched_platform_type SR_SAM  # (User will probably choose to override this type.)
// We will manually make our own launch computer
#   launch_computer        SR_SAM_LAUNCH_COMPUTER end_launch_computer

   # A cannister missile is ejected from the canister and ignites at 25 m altitude.
#   launch_delta_v 22.4 0 0 m/s #Fired out of tube

   # The missiles are launched vertically from the canisters.
   # We can't specify 90 degrees because of a singularity
   tilt  89.9 degrees

   # The user should cue the weapon to the target track before launching.
   # This is a bit of a hack until the missile guidance computer will roll.
   slew_mode azimuth
   azimuth_slew_limits -180 deg 180 deg

   # There are 8 canisters per TEL
   quantity 8

   # Assume there is some reaction time.
   firing_delay   2.0 secs

   # Salvo interval
   salvo_interval uniform minimum 2.0 secs maximum 5.0 secs

end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：launched_platform_type, tilt, slew_mode, azimuth_slew_limits, quantity, firing_delay, salvo_interval

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, launched_platform_type, tilt, slew_mode, azimuth_slew_limits, firing_delay, quantity, 武器
- **出处**：`base_types/weapons/ssm/red_mrbm_3.txt:495-502`
- **片段**：

```text
weapon RED_MRBM_3 WSF_EXPLICIT_WEAPON
   launched_platform_type RED_MRBM_3
   tilt  89.9 degrees
   slew_mode azimuth
   azimuth_slew_limits -180 deg 180 deg
   firing_delay   1.0 secs
   quantity               1
end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：launched_platform_type, tilt, slew_mode, azimuth_slew_limits, firing_delay, quantity

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, launched_platform_type, weapon_effects, quantity, firing_delay, salvo_interval, tilt, 武器
- **出处**：`parachute/parachute_example.txt:71-78`
- **片段**：

```text
weapon PARACHUTE WSF_EXPLICIT_WEAPON
   launched_platform_type PARACHUTE
   weapon_effects PARACHUTE_EFFECT
   quantity 1
   firing_delay 0.0 sec
   salvo_interval 2.0 sec
   tilt -89.9 deg
end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：launched_platform_type, weapon_effects, quantity, firing_delay, salvo_interval, tilt

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, quantity, maximum_request_count, salvo_interval, launch_computer, launched_platform_type, weapon_effects, 武器
- **出处**：`fires/types/fires_120mm_mortar_m934_he.txt:47-56`　（同签名共 4 处，另见 `fires/types/fires_155mm_artillery_m107_he.txt:48`、`fires/types/fires_155mm_artillery_m107_he_lofted.txt:48`、`fires/types/fires_81mm_mortar_m821_he.txt:47`）
- **片段**：

```text
weapon FIRES_120MM_MORTAR_M934_HE_EXPLICIT WSF_EXPLICIT_WEAPON
   quantity 1000
   maximum_request_count 100
   salvo_interval 2.0 seconds
   launch_computer
      FIRES_120MM_MORTAR_M934_HE_LAUNCH_COMPUTER
   end_launch_computer
   launched_platform_type FIRES_120MM_MORTAR_M934_HE
  weapon_effects FIRES_120MM_MORTAR_M934_HE_EFFECTS
end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：quantity, maximum_request_count, salvo_interval, launch_computer, launched_platform_type, weapon_effects

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, launched_platform_type, weapon_effects, quantity, firing_delay, launch_delta_v, 武器
- **出处**：`gun_engagement/weapons/guns/BULLET_buildertool.txt:21-27`
- **片段**：

```text
weapon MYWEAP WSF_EXPLICIT_WEAPON
   launched_platform_type    MYWEAP
   weapon_effects            BULLET_LETHALITY
   quantity                  1
   firing_delay              0 secs
   launch_delta_v            1021 0 0 m/s
end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：launched_platform_type, weapon_effects, quantity, firing_delay, launch_delta_v

### weapon（bomber）｜武器

- **关键词**：weapon, weapon_effects, quantity, firing_delay, salvo_interval, maximum_request_count, 武器
- **出处**：`suppressor/platforms/bomber.txt:49-55`
- **片段**：

```text
  weapon bomber_weapon BLUE_GPS_BOMB_3_2000_LB
    weapon_effects           BLUE_GPS_BOMB_3_2000_LB_EFFECT
    quantity                 14
    firing_delay             2.5 sec
    salvo_interval           1.5 sec
    maximum_request_count    4
  end_weapon
```

- **演示要点**：演示 weapon 的参数：weapon_effects, quantity, firing_delay, salvo_interval, maximum_request_count

### weapon · WSF_IMPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_IMPLICIT_WEAPON, quantity, salvo_interval, launch_computer, launched_platform_type, weapon_effects, 武器
- **出处**：`fires/types/fires_107mm_rocket.txt:39-47`　（同签名共 18 处，另见 `fires/types/fires_120mm_artillery.txt:30`、`fires/types/fires_120mm_mortar.txt:35`、`fires/types/fires_120mm_mortar_m934_he.txt:28`）
- **片段**：

```text
weapon FIRES_107MM_ROCKET WSF_IMPLICIT_WEAPON
   quantity 1000
   salvo_interval 0.5 seconds
   launch_computer
      FIRES_107MM_ROCKET_LAUNCH_COMPUTER
   end_launch_computer
   launched_platform_type FIRES_107MM_ROCKET
   weapon_effects FIRES_107MM_ROCKET_EFFECTS
end_weapon
```

- **演示要点**：演示 WSF_IMPLICIT_WEAPON 的参数：quantity, salvo_interval, launch_computer, launched_platform_type, weapon_effects

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, quantity, salvo_interval, launch_computer, launched_platform_type, weapon_effects, 武器
- **出处**：`fires/types/fires_107mm_rocket.txt:58-66`　（同签名共 14 处，另见 `fires/types/fires_120mm_artillery.txt:48`、`fires/types/fires_120mm_mortar.txt:53`、`fires/types/fires_122mm_rocket.txt:84`）
- **片段**：

```text
weapon FIRES_107MM_ROCKET_EXPLICIT WSF_EXPLICIT_WEAPON
   quantity 1000
   salvo_interval 0.5 seconds
   launch_computer
      FIRES_107MM_ROCKET_LAUNCH_COMPUTER
   end_launch_computer
   launched_platform_type FIRES_107MM_ROCKET
   weapon_effects FIRES_107MM_ROCKET_EFFECTS
end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：quantity, salvo_interval, launch_computer, launched_platform_type, weapon_effects

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, launched_platform_type, weapon_effects, launch_delta_v, slew_mode, elevation_slew_limits, 武器
- **出处**：`suppressor/weapons/sam/missile.txt:137-146`
- **片段**：

```text
weapon missile WSF_EXPLICIT_WEAPON
  launched_platform_type  MISSILE
  weapon_effects          MISSILE_WARHEAD
  launch_delta_v          50.0 0.0 0.0 m/s

  slew_mode               both

  //elevation_slew_limits   30 deg 80 deg
  elevation_slew_limits   60 deg 89.5 deg
end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：launched_platform_type, weapon_effects, launch_delta_v, slew_mode, elevation_slew_limits

### weapon · WSF_RF_JAMMER｜武器

- **关键词**：weapon, WSF_RF_JAMMER, debug, debug_level, maximum_number_of_spots, repeater, transmitter, 武器
- **出处**：`electronic_warfare/agile_repeater_jamming-rt1.txt:68-109`　（同签名共 4 处，另见 `electronic_warfare/agile_repeater_jamming-rt2.txt:68`、`electronic_warfare/air-to-air-rt1.txt:67`、`electronic_warfare/air-to-air-rt2.txt:67`）
- **片段**：

```text
weapon JAMMER WSF_RF_JAMMER
   debug
   debug_level 1

   maximum_number_of_spots 2

   repeater
      frequency_following    true
      operating_mode         auto
      #debug
   end_repeater

   transmitter
      power                100 w
      frequency_band       100 mhz 1000 mhz
      antenna_pattern      JAMMER_ANTENNA

      electronic_attack
         technique noise_jamming
            //default_on
            mitigation_class_name NOISE_JAMMING
            effect power_effect WSF_JAMMER_POWER_EFFECT
            end_effect
         end_technique

         technique false_target_jamming
            default_on
            mitigation_class_name FALSE_TARGET_JAMMING
            effect ft_effect WSF_FALSE_TARGET_EFFECT
                system_type_data default
                   jamming_pulse_density 0.2
                   scan_rate_multiplier 2.0
                end_system_type_data
                system_type_data EW_RADAR
                   jamming_pulse_density 0.1
                   scan_rate_multiplier 2.0
                end_system_type_data
             end_effect
          end_technique
      end_electronic_attack
   end_transmitter
end_weapon
```

- **演示要点**：演示 WSF_RF_JAMMER 的参数：debug, debug_level, maximum_number_of_spots, repeater, transmitter

### weapon · WSF_LASER_WEAPON｜武器

- **关键词**：weapon, WSF_LASER_WEAPON, aux_data, comments, firing_time, weapon_effects, fluence_model, 武器
- **出处**：`hel/hel_test.txt:237-280`　（同签名共 3 处，另见 `hel/hel_test.txt:155`、`hel/intersect_mesh_test.txt:189`）
- **片段**：

```text
weapon ABM_HEL WSF_LASER_WEAPON

   aux_data
      bool auto_mode = false
   end_aux_data

   #debug
   comments enabled

   // The firing time per shot.
   firing_time 5000.0 sec

   // The lethalitiy model used by this HEL.
   weapon_effects ABM_LETHALITY

   //-------------------------------------------------------------------
   //  The following begins the hel-specific block of data.
   //-------------------------------------------------------------------

   fluence_model default

      // The aperture for the HEL beam.
      // The beam diffraction is inversely proportional to the aperture diameter.
      aperture_diameter 1 meters

      // The laser power (typically, expressed in kw).
      power 500 kw

      // The characteristic wavelength for the measurement.
      //wavelength 1.064 microns

      laser_type coil

      // The total jitter of the beam on target.
      // More jitter gives a larger spot size and less power/area.
      jitter 2e-6 radians

      // A measure of how close the beam is to a perfect gaussian.
      // Valid values are >= 1.0, where 1.0 is best.
      beam_quality 1.05

   end_fluence_model

end_weapon
```

- **演示要点**：演示 WSF_LASER_WEAPON 的参数：aux_data, comments, firing_time, weapon_effects, fluence_model

### weapon · WSF_CUED_LASER_WEAPON｜武器

- **关键词**：weapon, WSF_CUED_LASER_WEAPON, aux_data, comments, firing_time, weapon_effects, fluence_model, 武器
- **出处**：`hel/intersect_mesh_test_beam_director.txt:189-243`
- **片段**：

```text
weapon HEL WSF_CUED_LASER_WEAPON

   aux_data
      bool auto_mode = false
   end_aux_data

   #debug
   comments enabled

   // The firing time per shot.
   firing_time 5.0 sec

   // The lethalitiy model used by this HEL.
   weapon_effects hel_lethality

   //-------------------------------------------------------------------
   //  The following begins the hel-specific block of data.
   //-------------------------------------------------------------------

   fluence_model default

      // base_input_file ./intersect_test.hel

      // helcomes_install_folder C:\pkgs\helcomes\helcomes

      // helcomes_interface_jar c:\swdev\cme\wsf_helcomes\lib\wsf.jar
      // thermal_bloom enabled

      // The aperture for the HEL beam.
      // The beam diffraction is inversely proportional to the aperture diameter.
      aperture_diameter 0.2 meters

      // The laser power (typically, expressed in kw).
      power 20 kw

      // The characteristic wavelength for the measurement.
#      wavelength 1.064 microns

#      wavelength 1064e-9 meter
      laser_type nd_yag

#      atmosphere_model 1
#      haze_model 1

      // The total jitter of the beam on target.
      // More jitter gives a larger spot size and less power/area.
      jitter 2e-6 radians

      // A measure of how close the beam is to a perfect gaussian.
      // Valid values are >= 1.0, where 1.0 is best.
      beam_quality 1.2

   end_fluence_model

end_weapon
```

- **演示要点**：演示 WSF_CUED_LASER_WEAPON 的参数：aux_data, comments, firing_time, weapon_effects, fluence_model

### weapon（missile_ship）｜武器

- **关键词**：weapon, location, quantity, internal_link, ignore_launch_platform_velocity, 武器
- **出处**：`new_guidance/platforms/missile_ship.txt:80-85`　（同签名共 2 处，另见 `ship_ad/platforms/missile_ship.txt:93`）
- **片段**：

```text
  weapon ssm SSM_MISSILE
    location 0 0 -5 m
    quantity      16
    internal_link 3rd_party_mgr
    ignore_launch_platform_velocity true # ignore the movement of the ship
  end_weapon
```

- **演示要点**：演示 weapon 的参数：location, quantity, internal_link, ignore_launch_platform_velocity

### weapon（cruise_missile_test）｜武器

- **关键词**：weapon, quantity, pitch, location, launch_delta_v, 武器
- **出处**：`p6dof/cruise_missile_test.txt:104-109`　（同签名共 7 处，另见 `p6dof/unguided_rocket_test.txt:46`、`p6dof/unguided_rocket_test.txt:53`、`six_dof/pm6_cruise_missile_test.txt:104`）
- **片段**：

```text
   weapon cm AGM-MRC-WEAPON
      quantity 4
      pitch         -2.0 deg
      location       20.0 0.0 6.0 ft
      launch_delta_v 0.0 0.0 20.0 ft/sec
   end_weapon
```

- **演示要点**：演示 weapon 的参数：quantity, pitch, location, launch_delta_v

### weapon（hm-jammer-detect）｜武器

- **关键词**：weapon, off, slew_mode, yaw, power, 武器
- **出处**：`sensor_plot/radar/hm-jammer-detect.txt:48-53`
- **片段**：

```text
   weapon jammer SOJ_SBAND_JAMMER
      off
      slew_mode fixed // since there isn't any radar to jam, i.e. point at to get listener interface to work on ESM
      yaw 0.0 deg
      power 10 w   // if the power should need adjusting
   end_weapon
```

- **演示要点**：演示 weapon 的参数：off, slew_mode, yaw, power

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, tilt, launch_delta_v, launched_platform_type, quantity, 武器
- **出处**：`space_operations/launch_vehicles/atlas_v_401/atlas_v_401_base.txt:188-193`　（同签名共 7 处，另见 `space_operations/launch_vehicles/delta_iv_m/delta_iv_m_base.txt:145`、`space_operations/launch_vehicles/falcon_9/falcon_9_base.txt:198`、`space_operations/launch_vehicles/falcon_heavy/falcon_heavy_base.txt:261`）
- **片段**：

```text
weapon ATLAS_V_401_BASE WSF_EXPLICIT_WEAPON
   tilt                      90 deg
   launch_delta_v            0.0 0.0 0.0 m/s
   launched_platform_type    ATLAS_V_401_BASE
   quantity                  1
end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：tilt, launch_delta_v, launched_platform_type, quantity

### weapon（sam_battery）｜武器

- **关键词**：weapon, quantity, firing_delay, salvo_interval, slew_mode, 武器
- **出处**：`suppressor/platforms/sam_battery.txt:33-38`
- **片段**：

```text
  weapon missile missile
    quantity         6
    firing_delay     1.5 sec
    salvo_interval   1.5 sec
    slew_mode        both
  end_weapon
```

- **演示要点**：演示 weapon 的参数：quantity, firing_delay, salvo_interval, slew_mode

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, launched_platform_type, launch_delta_v, weapon_effects, launch_computer, 武器
- **出处**：`air_to_air/weapons/aam/short_range_ir_missile.txt:203-209`
- **片段**：

```text
weapon SHORT_RANGE_IR_MISSILE WSF_EXPLICIT_WEAPON
   #debug
   launched_platform_type SHORT_RANGE_IR_MISSILE_BASE
   launch_delta_v 10.0 0.0 0.0 m/s
   weapon_effects SHORT_RANGE_IR_MISSILE_EFFECT
   launch_computer SRM_LC end_launch_computer
end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：launched_platform_type, launch_delta_v, weapon_effects, launch_computer

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, launched_platform_type, quantity, launch_delta_v, weapon_effects, 武器
- **出处**：`base_types/weapons/aam/blue_sr_a2a_ir_missile.txt:96-102`　（同签名共 4 处，另见 `behavior_tree/weapons/aam/blue_sr_a2a_ir_missile.txt:99`、`brawler/weapons/aam/blue_sr_a2a_ir_missile.txt:101`、`wargame/weapons/aam/aam_type.txt:57`）
- **片段**：

```text
weapon BLUE_SR_A2A_IR_MISSILE WSF_EXPLICIT_WEAPON
   #debug
   launched_platform_type BLUE_SR_A2A_IR_MISSILE_BASE
   quantity 2
   launch_delta_v 10.0 0.0 0.0 m/s
   weapon_effects BLUE_SR_A2A_IR_MISSILE_EFFECT
end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：launched_platform_type, quantity, launch_delta_v, weapon_effects

### weapon（sam_launcher）｜武器

- **关键词**：weapon, quantity, firing_delay, firing_interval, internal_link, 武器
- **出处**：`launcher/platforms/sam_launcher.txt:21-27`
- **片段**：

```text
   weapon sam_missile SAM_MISSILE
      quantity 34
      firing_delay      5 sec
      firing_interval   20 sec
      internal_link data_mgr
      internal_link task_mgr
   end_weapon
```

- **演示要点**：演示 weapon 的参数：quantity, firing_delay, firing_interval, internal_link

### weapon（hm-jammer-detect-2）｜武器

- **关键词**：weapon, on, yaw, pitch, roll, 武器
- **出处**：`sensor_plot/esm/hm-jammer-detect-2.txt:68-74`
- **片段**：

```text
   weapon jammer JAMMER
      on

      yaw   0.0 deg
      pitch 0.0 deg
      roll  0.0 deg
   end_weapon
```

- **演示要点**：演示 weapon 的参数：on, yaw, pitch, roll

### weapon（soj）｜武器

- **关键词**：weapon, off, yaw, azimuth_field_of_view, ignore_same_side, 武器
- **出处**：`electronic_warfare/test_false_targets/platforms/soj.txt:243-251`　（同签名共 4 处，另见 `electronic_warfare/test_false_targets/platforms/soj.txt:259`、`iads/platforms/soj.txt:195`、`iads/platforms/soj.txt:211`）
- **片段**：

```text
  weapon aft_sband_jammer SOJ_SBAND_JAMMER
     off
     yaw 180.0 deg

     # Field of view limits are slew limits + 1/2 the beamwidth
     azimuth_field_of_view       -100.0 deg 100.0 deg

     ignore_same_side
  end_weapon
```

- **演示要点**：演示 weapon 的参数：off, yaw, azimuth_field_of_view, ignore_same_side

### weapon · WSF_RF_JAMMER｜武器

- **关键词**：weapon, WSF_RF_JAMMER, slew_mode, azimuth_slew_limits, elevation_slew_limits, transmitter, 武器
- **出处**：`sensor_plot/esm/hm-jammer-detect-2.txt:48-61`
- **片段**：

```text
weapon JAMMER WSF_RF_JAMMER

   slew_mode azimuth_and_elevation
   azimuth_slew_limits   -180 deg 180 deg
   elevation_slew_limits  -90 deg  90 deg

   transmitter
      antenna_pattern            JAMMER_ANTENNA
      frequency                  3 ghz
      bandwidth                  10 mhz
      power                      100.0 w
      internal_loss              0.0 db
   end_transmitter
end_weapon
```

- **演示要点**：演示 WSF_RF_JAMMER 的参数：slew_mode, azimuth_slew_limits, elevation_slew_limits, transmitter

### weapon · WSF_LASER_WEAPON｜武器

- **关键词**：weapon, WSF_LASER_WEAPON, firing_time, firing_update_interval, weapon_effects, fluence_model, 武器
- **出处**：`hel/ground_hel_vs_hypersonic.txt:33-80`
- **片段**：

```text
weapon HEL WSF_LASER_WEAPON

   #debug

   // The firing time per shot.
   firing_time 5000.0 sec
   firing_update_interval 0.1 seconds

   // The total number of shots allowed before the cooling time begins.
   //number_of_shots 5

   // The cooling time before the HEL is ready for another salvo.
   // !!! You must use either cooling time or thermal_system, but not both.
   //cooling_time 25 minutes

   // The lethality model used by this HEL.
   weapon_effects hel_lethality

   //-------------------------------------------------------------------
   //  The following begins the fluence model-specific block of data.
   //-------------------------------------------------------------------

   fluence_model default

      // The aperture for the HEL beam.
      // The beam diffraction is inversely proportional to the aperture diameter.
      aperture_diameter 1 m

      // The laser power (typically, expressed in kw).
      power 1000 kw // megawatt class laser

      // The characteristic wavelength for the measurement.
      wavelength 1.064 microns // Re-evaluate (optimal FEL wavelength?)_

      // Select version of CN2 to use
      CN2_form hv57

      // The total jitter of the beam on target.
      // More jitter gives a larger spot size and less power/area.
      jitter 6.61e-7 radians

      // A measure of how close the beam is to a perfect gaussian.
      // Valid values are >= 1.0, where 1.0 is best.
      beam_quality 1.8  // revisit- evaluate boundary layer at target

   end_fluence_model

end_weapon
```

- **演示要点**：演示 WSF_LASER_WEAPON 的参数：firing_time, firing_update_interval, weapon_effects, fluence_model

### weapon（soj）｜武器

- **关键词**：weapon, off, yaw, ignore_same_side, 武器
- **出处**：`aea_iads/platforms/soj.txt:420-424`　（同签名共 12 处，另见 `aea_iads/platforms/soj.txt:431`、`aea_iads/platforms/soj.txt:442`、`alv_routing/platforms/alv.txt:146`）
- **片段**：

```text
  weapon aft_vhf_jammer SOJ_VHF_JAMMER
     off
     yaw 180.0 deg
     ignore_same_side
  end_weapon
```

- **演示要点**：演示 weapon 的参数：off, yaw, ignore_same_side

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, launched_platform_type, launch_delta_v, quantity, 武器
- **出处**：`ballistic_missile_shootdown/weapons/ssm/red_mrbm_1.txt:348-352`　（同签名共 16 处，另见 `ballistic_missile_shootdown/weapons/ssm/red_mrbm_1.txt:354`、`base_types/weapons/sam/blue_lr_sam_common.txt:321`、`base_types/weapons/ssm/red_icbm_2.txt:355`）
- **片段**：

```text
   weapon stage_1 WSF_EXPLICIT_WEAPON
      launched_platform_type RED_MRBM_1_SPENT_STAGE_1
      launch_delta_v         -100.0 0.0 0.0 m/s
      quantity 1
   end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：launched_platform_type, launch_delta_v, quantity

### weapon（simple_a2a_missile）｜武器

- **关键词**：weapon, launched_platform_type, launch_computer, quantity, 武器
- **出处**：`base_types/weapons/aam/simple_a2a_missile.txt:24-28`
- **片段**：

```text
weapon SIMPLE_A2A_MISSILE_WEAPON BLUE_SR_A2A_IR_MISSILE
   launched_platform_type SIMPLE_A2A_MISSILE
   launch_computer        SIMPLE_A2A_LAUNCH_COMPUTER end_launch_computer
   quantity               4  // should be 2
end_weapon
```

- **演示要点**：演示 weapon 的参数：launched_platform_type, launch_computer, quantity

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, launched_platform_type, firing_delay, quantity, 武器
- **出处**：`base_types/weapons/ssm/red_mrbm_3.txt:421-425`
- **片段**：

```text
weapon RED_MRBM_3_STAGE1 WSF_EXPLICIT_WEAPON
   launched_platform_type RED_MRBM_3_STAGE1
   firing_delay   0 secs
   quantity               1
end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：launched_platform_type, firing_delay, quantity

### weapon（bomb_sequencers）｜武器

- **关键词**：weapon, quantity, location, launch_delta_v, 武器
- **出处**：`p6dof/bomb_sequencers.txt:89-93`　（同签名共 23 处，另见 `p6dof/bomb_sequencers.txt:196`、`p6dof/bomb_sequencers.txt:201`、`p6dof/bomb_sequencers.txt:206`）
- **片段**：

```text
   weapon gps_bomb GBU-500-WEAPON
      quantity       8
      location       0.0 0.0 0.0 ft
      launch_delta_v 0.0 0.0 2.0 ft/sec
   end_weapon
```

- **演示要点**：演示 weapon 的参数：quantity, location, launch_delta_v

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, location, launched_platform_type, weapon_effects, 武器
- **出处**：`p6dof/platforms/sam-mr.txt:24-28`　（同签名共 3 处，另见 `six_dof/platforms/sam-mr.txt:26`、`six_dof/platforms/sam-mr.txt:32`）
- **片段**：

```text
weapon SAM-MR_WEAPON WSF_EXPLICIT_WEAPON
   location  0.0 0.0 -5.0 ft
   launched_platform_type SAM-MR
   weapon_effects         SAM-MR_LETHALITY
end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：location, launched_platform_type, weapon_effects

### weapon（red_missile_destroyer）｜武器

- **关键词**：weapon, location, quantity, internal_link, 武器
- **出处**：`ship_ad/platforms/red_missile_destroyer.txt:102-106`
- **片段**：

```text
  weapon asm RED_ASM_MSL   
    location 0 0 -5 m  # estimate
    quantity      16
    internal_link 3rd_party_mgr
  end_weapon
```

- **演示要点**：演示 weapon 的参数：location, quantity, internal_link

### weapon（delta_iv_m_staging_failure）｜武器

- **关键词**：weapon, launched_platform_type, quantity, commander, 武器
- **出处**：`space_operations/platforms/delta_iv_m_staging_failure.txt:29-33`
- **片段**：

```text
weapon DELTA_IV_M DELTA_IV_M_BASE
   launched_platform_type    DELTA_IV_M
   quantity                  1
   commander                 LAUNCHER
end_weapon
```

- **演示要点**：演示 weapon 的参数：launched_platform_type, quantity, commander

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, launched_platform_type, weapon_effects, category, 武器
- **出处**：`draw/weapons/agm/bomb_1000_lb.txt:78-83`　（同签名共 9 处，另见 `script_demos/script_demo_2.txt:139`、`script_demos/script_demo_5.txt:185`、`suppressor/weapons/agm/blue_gps_bomb_3.txt:320`）
- **片段**：

```text
weapon BOMB_1000_LB WSF_EXPLICIT_WEAPON
   launched_platform_type BOMB_1000_LB
   weapon_effects         BOMB_1000_LB_EFFECT
   category               1000_POUNDER
   category               glide_bomb_unit
end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：launched_platform_type, weapon_effects, category

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, launched_platform_type, weapon_effects, aux_data, 武器
- **出处**：`cyber/weapons/agm/blue_gps_bomb_1.txt:61-67`　（同签名共 11 处，另见 `alternate_locations/weapons/agm/blue_glide_bomb_1.txt:59`、`alternate_locations/weapons/agm/blue_gps_bomb_1.txt:92`、`iads/weapons/agm/blue_glide_bomb_1.txt:83`）
- **片段**：

```text
weapon BLUE_GPS_BOMB_1 WSF_EXPLICIT_WEAPON 
   launched_platform_type BLUE_GPS_BOMB_1_PT 
   weapon_effects BLUE_GPS_BOMB_1_EFFECTS
   aux_data 
      double lar_meters = 18520
   end_aux_data
end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：launched_platform_type, weapon_effects, aux_data

### weapon（launch1multi_stage_tbm）｜武器

- **关键词**：weapon, quantity, yaw, pitch, 武器
- **出处**：`tbm_demos/scenarios/launch1multi_stage_tbm.txt:22-29`
- **片段**：

```text
   weapon tbm2-missile
      quantity 1
      # The following are the 'pre-computed' launch angles to hit target-1.
      # If you comment out the track definition then it will use these to
      # to define the initial conditions.
      yaw   75.3303928 deg
      pitch 85.67082852 deg
   end_weapon
```

- **演示要点**：演示 weapon 的参数：quantity, yaw, pitch

### weapon（missile_comparison）｜武器

- **关键词**：weapon, quantity, launch_delta_v, script, 武器
- **出处**：`p6dof/missile_comparison.txt:78-88`　（同签名共 13 处，另见 `p6dof/missile_comparison.txt:90`、`p6dof/missile_comparison.txt:102`、`six_dof/pm6_missile_comparison.txt:85`）
- **片段**：

```text
   weapon mr-aam AAM-MR_WEAPON

      quantity 1

      launch_delta_v 30.0 0.0 0.0 ft/sec

      script void on_create(WsfPlatform aWeapon, WsfTrack aTrack)
         missile_on_create(aWeapon, aTrack);
      end_script

   end_weapon
```

- **演示要点**：演示 weapon 的参数：quantity, launch_delta_v, script

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, launched_platform_type, weapon_effects, script, 武器
- **出处**：`tbm_demos/platforms/tbm_launcher1.txt:21-40`
- **片段**：

```text
   weapon tbm1-missile WSF_EXPLICIT_WEAPON
      launched_platform_type TBM1
      weapon_effects         TBM1_LETHALITY

      script void on_create(WsfPlatform aWeapon, WsfTrack aTrack)
         double distance = PLATFORM.SlantRangeTo(aTrack);
         writeln("We are ", distance / MATH.M_PER_NM(), " nautical miles from the target");
         if (distance < 350.0 * MATH.M_PER_NM())
         {
            writeln("Launch depressed");
            aWeapon.ProcessInput("trajectory_type depressed");
         }
         else
         {
            writeln("Launch lofted");
            aWeapon.ProcessInput("trajectory_type lofted");
         }

     end_script
   end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：launched_platform_type, weapon_effects, script

### weapon · WSF_RF_JAMMER｜武器

- **关键词**：weapon, WSF_RF_JAMMER, scan_mode, repeater, transmitter, 武器
- **出处**：`sensor_plot/radar/hm-repeater-effect.txt:50-80`
- **片段**：

```text
weapon JAMMER WSF_RF_JAMMER
   #debug

   scan_mode azimuth_and_elevation

/*
   repeater
      signal_following    true
      operating_mode         auto
      #debug
   end_repeater
*/
   transmitter
      power           100 w
      frequency       900 mhz
      antenna_pattern JAMMER_ANTENNA

      electronic_attack
         technique noise_jamming
            default_on
            mitigation_class_name NOISE_JAMMING
            effect power_effect WSF_JAMMER_POWER_EFFECT
               repeater_effect_control_method actuals
               gain_control_method jammer_to_signal
               desired_jammer_to_signal  0.0 db
               #debug
            end_effect
         end_technique
      end_electronic_attack
   end_transmitter
end_weapon
```

- **演示要点**：演示 WSF_RF_JAMMER 的参数：scan_mode, repeater, transmitter

### weapon · WSF_CHAFF_WEAPON｜武器

- **关键词**：weapon, WSF_CHAFF_WEAPON, launched_platform_type, draw_cloud_approximations, ejector, 武器
- **出处**：`chaff/chaff_example.txt:43-78`　（同签名共 2 处，另见 `chaff/chaff_example_ttr.txt:45`）
- **片段**：

```text
weapon CHAFF_WEAPON WSF_CHAFF_WEAPON
   #debug
   launched_platform_type CHAFF  # optional input. WSF_PLATFORM will be used as default
   #cloud_update_interval  1 sec
   draw_cloud_approximations on

   ejector eject-1
     quantity 15
     parcel_type CHAFF_PARCEL
     location 0 5 0 m

     ejection_velocity 25 m/s
     ejection_azimuth 90 deg
     ejection_elevation 30 deg
   end_ejector

   ejector eject-2
     quantity 17
     parcel_type CHAFF_PARCEL
     location 0 0 0 m

     ejection_velocity 25 m/s
     ejection_azimuth 180 deg
     ejection_elevation 30 deg
   end_ejector

   ejector eject-3
     quantity 19
     parcel_type CHAFF_PARCEL
     location 0 -5 0 m

     ejection_velocity 25 m/s
     ejection_azimuth -90 deg
     ejection_elevation 30 deg
   end_ejector
end_weapon
```

- **演示要点**：演示 WSF_CHAFF_WEAPON 的参数：launched_platform_type, draw_cloud_approximations, ejector

### weapon · WSF_RF_JAMMER｜武器

- **关键词**：weapon, WSF_RF_JAMMER, maximum_number_of_spots, repeater, transmitter, 武器
- **出处**：`electronic_warfare/manual_repeater_jamming.txt:69-107`　（同签名共 3 处，另见 `electronic_warfare/semi-auto_repeater_jamming_1.txt:67`、`electronic_warfare/agile_auto-repeater_jamming.txt:71`）
- **片段**：

```text
weapon JAMMER WSF_RF_JAMMER
#debug

   maximum_number_of_spots 2

   repeater
      signal_following    true
      operating_mode      manual
      #debug
   end_repeater

   transmitter
      power                100 w
      frequency_band       100 mhz 1000 mhz
      antenna_pattern      JAMMER_ANTENNA

      electronic_attack
         technique noise_jamming
            mitigation_class_name NOISE_JAMMING
            effect power_effect WSF_JAMMER_POWER_EFFECT
            end_effect
         end_technique

         technique false_target_jamming
            mitigation_class_name FALSE_TARGET_JAMMING
            effect ft_effect WSF_FALSE_TARGET_EFFECT
                system_type_data default
                   jamming_pulse_density 0.2
                   scan_rate_multiplier 2.0
                end_system_type_data
                system_type_data EW_RADAR
                   jamming_pulse_density 0.1
                   scan_rate_multiplier 2.0
                end_system_type_data
             end_effect
          end_technique
      end_electronic_attack
   end_transmitter
end_weapon
```

- **演示要点**：演示 WSF_RF_JAMMER 的参数：maximum_number_of_spots, repeater, transmitter

### weapon（soj）｜武器

- **关键词**：weapon, off, ignore_same_side, 武器
- **出处**：`aea_iads/platforms/soj.txt:415-418`　（同签名共 7 处，另见 `aea_iads/platforms/soj.txt:426`、`aea_iads/platforms/soj.txt:437`、`alv_routing/platforms/alv.txt:141`）
- **片段**：

```text
  weapon fwd_vhf_jammer SOJ_VHF_JAMMER
     off
     ignore_same_side
  end_weapon
```

- **演示要点**：演示 weapon 的参数：off, ignore_same_side

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, launched_platform_type, weapon_effects, 武器
- **出处**：`alv_routing/weapons/alv_weapon.txt:26-29`　（同签名共 26 处，另见 `alv_routing/weapons/alv_weapon.txt:32`、`base_types/weapons/agm/blue_adv_cruise_missile.txt:109`、`cyber/weapons/agm/leader_agm.txt:165`）
- **片段**：

```text
weapon ALV_WEAPON WSF_EXPLICIT_WEAPON
   launched_platform_type ALV
   weapon_effects         ALV_EFFECTS
end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：launched_platform_type, weapon_effects

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, launched_platform_type, quantity, 武器
- **出处**：`base_types/weapons/ssm/red_mrbm_3.txt:439-442`　（同签名共 2 处，另见 `new_guidance/scenarios/blue_multirole_fighter_1_launch.txt:16`）
- **片段**：

```text
weapon RED_MRBM_3_STAGE2 WSF_EXPLICIT_WEAPON
   launched_platform_type RED_MRBM_3_STAGE2
   quantity               1
end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：launched_platform_type, quantity

### weapon（red_mrbm_3）｜武器

- **关键词**：weapon, quantity, launch_delta_v, 武器
- **出处**：`base_types/weapons/ssm/red_mrbm_3.txt:457-460`　（同签名共 2 处，另见 `base_types/weapons/ssm/red_mrbm_3.txt:462`）
- **片段**：

```text
   weapon red_mrbm_3_stage1 RED_MRBM_3_STAGE1
      quantity 1
      launch_delta_v  -1 0 0 fps
   end_weapon
```

- **演示要点**：演示 weapon 的参数：quantity, launch_delta_v

### weapon（ship）｜武器

- **关键词**：weapon, location, quantity, 武器
- **出处**：`ciws/platforms/ship.txt:18-21`　（同签名共 3 处，另见 `ship_ad/platforms/red_missile_destroyer.txt:97`、`ship_ad/platforms/red_missile_frigate.txt:105`）
- **片段**：

```text
  weapon gun 30MM_BULLET
    location 0 0 -5 m  # 15 feet up off of waterline
    quantity 101
  end_weapon
```

- **演示要点**：演示 weapon 的参数：location, quantity

### weapon（GoneFishing_ConstraintDemo）｜武器

- **关键词**：weapon, quantity, weapon_effects, 武器
- **出处**：`cyber/GoneFishing_ConstraintDemo.txt:62-65`
- **片段**：

```text
   weapon bomb WEAPON
      quantity 1
      weapon_effects WEAPON_EFFECT
   end_weapon
```

- **演示要点**：演示 weapon 的参数：quantity, weapon_effects

### weapon（draw_demo）｜武器

- **关键词**：weapon, quantity, firing_interval, 武器
- **出处**：`draw/draw_demo.txt:172-175`　（同签名共 6 处，另见 `satellite_demos/scenarios/gps_denied.txt:590`、`script_demos/script_demo_2.txt:544`、`script_demos/script_demo_5.txt:444`）
- **片段**：

```text
  weapon 1000_lb_bomb
    quantity 4
    firing_interval 2 sec
  end_weapon
```

- **演示要点**：演示 weapon 的参数：quantity, firing_interval

### weapon（missile_comparison）｜武器

- **关键词**：weapon, pitch, quantity, 武器
- **出处**：`p6dof/missile_comparison.txt:267-270`　（同签名共 3 处，另见 `six_dof/pm6_missile_comparison.txt:414`、`six_dof/rb6_missile_comparison.txt:414`）
- **片段**：

```text
   weapon sam-mr SAM-MR_WEAPON
      pitch 60 deg
      quantity 1
   end_weapon
```

- **演示要点**：演示 weapon 的参数：pitch, quantity

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, launched_platform_type, tilt, 武器
- **出处**：`parachute/parachute_example2.txt:54-57`
- **片段**：

```text
weapon PARACHUTERS WSF_EXPLICIT_WEAPON
   launched_platform_type PARACHUTER
   tilt -90.0 deg
end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：launched_platform_type, tilt

### weapon（fighter）｜武器

- **关键词**：weapon, maximum_quantity, quantity, 武器
- **出处**：`wargame/platforms/fighter.txt:46-49`　（同签名共 2 处，另见 `wargame/platforms/fighter.txt:51`）
- **片段**：

```text
   weapon agm AGM
      maximum_quantity 6
      quantity 6
   end_weapon
```

- **演示要点**：演示 weapon 的参数：maximum_quantity, quantity

### weapon（aam-missile）｜武器

- **关键词**：weapon, launched_platform_type, launch_computer, 武器
- **出处**：`wargame/weapons/aam/aam-missile.txt:25-28`
- **片段**：

```text
weapon AAM ADV_AAM
   launched_platform_type SIMPLE_A2A_MISSILE
   launch_computer        SIMPLE_A2A_LAUNCH_COMPUTER end_launch_computer
end_weapon
```

- **演示要点**：演示 weapon 的参数：launched_platform_type, launch_computer

### weapon（hm-repeater-effect）｜武器

- **关键词**：weapon, pitch, on, 武器
- **出处**：`sensor_plot/radar/hm-repeater-effect.txt:86-90`
- **片段**：

```text
   weapon jammer JAMMER
      pitch   -10 deg                  // Aim jammer slightly toward the ground
      on
      #debug
   end_weapon
```

- **演示要点**：演示 weapon 的参数：pitch, on

### weapon（jet_aircraft）｜武器

- **关键词**：weapon, quantity, internal_link, 武器
- **出处**：`shooter/platforms/jet_aircraft.txt:32-36`
- **片段**：

```text
   weapon aa_mrm AA_MRM
     quantity 8
     internal_link task_mgr
     internal_link data_mgr
   end_weapon
```

- **演示要点**：演示 weapon 的参数：quantity, internal_link

### weapon · WSF_RF_JAMMER｜武器

- **关键词**：weapon, WSF_RF_JAMMER, maximum_range, transmitter, 武器
- **出处**：`aea_iads/weapons/jammer/soj_base_jammer.txt:91-99`
- **片段**：

```text
weapon SOJ_BASE_JAMMER WSF_RF_JAMMER

   maximum_range                400 km

   transmitter
      electronic_attack SOJ_EA
      end_electronic_attack
   end_transmitter
end_weapon
```

- **演示要点**：演示 WSF_RF_JAMMER 的参数：maximum_range, transmitter

### weapon · WSF_RF_JAMMER｜武器

- **关键词**：weapon, WSF_RF_JAMMER, pitch, transmitter, 武器
- **出处**：`satellite_demos/scenarios/gps_denied.txt:249-259`
- **片段**：

```text
weapon SPOT_JAMMER WSF_RF_JAMMER
   #ignore_side green
   pitch 90 deg
   transmitter
      power           2000 watts
      frequency       1575.42 mhz
      bandwidth         24 mhz
      antenna_pattern SPOT_JAMMER_ANTENNA
      electronic_attack JAM_EA end_electronic_attack
   end_transmitter
end_weapon
```

- **演示要点**：演示 WSF_RF_JAMMER 的参数：pitch, transmitter

### weapon · WSF_RF_JAMMER｜武器

- **关键词**：weapon, WSF_RF_JAMMER, transmitter, electronic_attack, 武器
- **出处**：`sensor_plot/radar/hm-bistatic-ft-jamming-lab.txt:26-39`　（同签名共 3 处，另见 `sensor_demos/bistatic_sp_false_target_jamming_demo.txt:32`、`sensor_demos/bistatic_support_false_target_jamming_demo.txt:32`）
- **片段**：

```text
weapon JAMMER WSF_RF_JAMMER
   transmitter
      antenna_pattern JAMMER_ANTENNA
      power           1 w
      frequency       100 mhz
      bandwidth       200 khz  # false target jamming
      internal_loss   11 db
   end_transmitter
   electronic_attack JAMMER_EA
      technique false_target_jamming
         default_on
      end_technique
   end_electronic_attack
end_weapon
```

- **演示要点**：演示 WSF_RF_JAMMER 的参数：transmitter, electronic_attack

### weapon · WSF_RF_JAMMER｜武器

- **关键词**：weapon, WSF_RF_JAMMER, repeater, transmitter, 武器
- **出处**：`electronic_warfare/repeater_jamming.txt:82-120`
- **片段**：

```text
weapon JAMMER WSF_RF_JAMMER

   repeater
      frequency_following    true
      operating_mode         auto
      #debug
   end_repeater

   transmitter
      power           100 w
      frequency       900 mhz
      bandwidth         1 mhz
      antenna_pattern JAMMER_ANTENNA

      electronic_attack
          technique false_target_jamming
             default_on
             effect ft_effect WSF_FALSE_TARGET_EFFECT
                system_type_data default
                   jamming_pulse_density 0.2
                   repeater_effect_control_method repeater
                   gain_control_method desired_rcs
                   desired_false_target_rcs 3.5 m^2
                   repeater_factor_limits  0.01 absolute 1000 absolute
                   scan_rate_multiplier 4
                end_system_type_data
                system_type_data EW_RADAR
                   jamming_pulse_density 0.2
                   repeater_effect_control_method repeater
                   gain_control_method desired_rcs
                   desired_false_target_rcs 4.5 m^2
                   repeater_factor_limits  0.01 absolute 1000 absolute
                   scan_rate_multiplier 4
                end_system_type_data
             end_effect
          end_technique
       end_electronic_attack
   end_transmitter
end_weapon
```

- **演示要点**：演示 WSF_RF_JAMMER 的参数：repeater, transmitter

### weapon（dca）｜武器

- **关键词**：weapon, quantity, 武器
- **出处**：`air_to_air/platforms/dca.txt:48-50`　（同签名共 98 处，另见 `air_to_air/platforms/dca.txt:52`、`air_to_air/platforms/dca.txt:56`、`air_to_air/platforms/dca.txt:60`）
- **片段**：

```text
   weapon fox3 MEDIUM_RANGE_RADAR_MISSILE # fox 3 (MRM)
      quantity 4
   end_weapon
```

- **演示要点**：演示 weapon 的参数：quantity

### weapon（short_range_ir_missile）｜武器

- **关键词**：weapon, launched_platform_type, 武器
- **出处**：`air_to_air/weapons/aam/short_range_ir_missile.txt:232-234`　（同签名共 10 处，另见 `base_types/weapons/aam/blue_sr_a2a_ir_missile.txt:125`、`behavior_tree/weapons/aam/blue_sr_a2a_ir_missile.txt:128`、`brawler/weapons/aam/blue_sr_a2a_ir_missile.txt:130`）
- **片段**：

```text
   weapon srm SHORT_RANGE_IR_MISSILE
      launched_platform_type SHORT_RANGE_IR_MISSILE
   end_weapon
```

- **演示要点**：演示 weapon 的参数：launched_platform_type

### weapon（blue_naval_sam_lcg）｜武器

- **关键词**：weapon, firing_delay, 武器
- **出处**：`ballistic_missile_shootdown/weapons/sam/blue_naval_sam_lcg.txt:18-20`　（同签名共 4 处，另见 `base_types/weapons/sam/blue_naval_sam_lcg.txt:18`、`space_operations/weapons/blue_naval_sam_lcg.txt:17`、`base_types/weapons/sam/blue_sr_sam_lcg.txt:18`）
- **片段**：

```text
   weapon blue_naval_sam BLUE_NAVAL_SAM
     firing_delay 0.0 sec
   end_weapon
```

- **演示要点**：演示 weapon 的参数：firing_delay

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, launched_platform_type, 武器
- **出处**：`cyber/GoneFishing_ConstraintDemo.txt:31-33`　（同签名共 16 处，另见 `p6dof/platforms/aam-mr.txt:47`、`p6dof/platforms/aam-sr-tvc.txt:39`、`p6dof/platforms/aam-sr.txt:47`）
- **片段**：

```text
weapon WEAPON WSF_EXPLICIT_WEAPON 
   launched_platform_type WEAPON_PT
end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON 的参数：launched_platform_type

### weapon（agile_auto-repeater_jamming）｜武器

- **关键词**：weapon, pitch, 武器
- **出处**：`electronic_warfare/agile_auto-repeater_jamming.txt:258-260`　（同签名共 32 处，另见 `electronic_warfare/agile_jamming.txt:319`、`electronic_warfare/agile_repeater_jamming-rt1.txt:373`、`electronic_warfare/agile_repeater_jamming-rt2.txt:373`）
- **片段**：

```text
   weapon jammer JAMMER
      pitch  -10 deg                  // Aim jammer slightly toward the ground
   end_weapon
```

- **演示要点**：演示 weapon 的参数：pitch

### weapon（agile_auto-repeater_jamming）｜武器

- **关键词**：weapon, on, 武器
- **出处**：`electronic_warfare/agile_auto-repeater_jamming.txt:310-312`　（同签名共 33 处，另见 `electronic_warfare/agile_repeater_jamming-rt1.txt:440`、`electronic_warfare/agile_repeater_jamming-rt2.txt:440`、`electronic_warfare/agile_repeater_jamming.txt:439`）
- **片段**：

```text
   weapon jammer
     on
   end_weapon
```

- **演示要点**：演示 weapon 的参数：on

### weapon（simple_mrm_with_lc）｜武器

- **关键词**：weapon, launch_computer, 武器
- **出处**：`behavior_tree/weapons/aam/simple_mrm_with_lc.txt:14-17`　（同签名共 3 处，另见 `base_types/weapons/aam/blue_lr_a2a_rf_missile_with_launch_computer.txt:13`、`base_types/weapons/aam/simple_blue_lr_a2a_rf_missile.txt:16`）
- **片段**：

```text
weapon SIMPLE_MRM_WEAPON_LC SIMPLE_MRM_WEAPON
   launch_computer SIMPLE_MRM_AIR_TO_AIR_LAUNCH_COMPUTER
   end_launch_computer
end_weapon
```

- **演示要点**：演示 weapon 的参数：launch_computer

### weapon（track_error）｜武器

- **关键词**：weapon, internal_link, 武器
- **出处**：`electronic_warfare/track_error.txt:262-265`
- **片段**：

```text
   weapon sam_missile SAM_MISSILE
      internal_link data_mgr
      internal_link task_mgr
   end_weapon
```

- **演示要点**：演示 weapon 的参数：internal_link

### weapon（false-target_command_center）｜武器

- **关键词**：weapon, transmitter, 武器
- **出处**：`electronic_warfare/false-target_command_center.txt:218-223`
- **片段**：

```text
   weapon jammer-2 FT_JAMMER
      transmitter
         frequency 800 MHz
      end_transmitter
         pitch -10 deg                  // Aim jammer slightly toward the ground
   end_weapon
```

- **演示要点**：演示 weapon 的参数：transmitter

### weapon · WSF_RF_JAMMER｜武器

- **关键词**：weapon, WSF_RF_JAMMER, transmitter, 武器
- **出处**：`electronic_warfare/barrage_jamming.txt:43-49`　（同签名共 29 处，另见 `electronic_warfare/esm_detect_jammer.txt:46`、`electronic_warfare/jamming_perception.txt:27`、`sensor_demos/bistatic_sp_noise_jamming_demo.txt:21`）
- **片段**：

```text
weapon JAMMER WSF_RF_JAMMER
   transmitter
      power           100 w
      frequency_band  150 mhz 450 mhz
      antenna_pattern JAMMER_ANTENNA
   end_transmitter
end_weapon
```

- **演示要点**：演示 WSF_RF_JAMMER 的参数：transmitter

### weapon · WSF_SIX_DOF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_SIX_DOF_EXPLICIT_WEAPON, add_subobject, 武器
- **出处**：`six_dof/platforms/fa-lgt-bombs-ld.txt:25-32`　（同签名共 2 处，另见 `six_dof/platforms/fa-lgt-bombs-ld.txt:48`）
- **片段**：

```text
   weapon Bomb WSF_SIX_DOF_EXPLICIT_WEAPON
      add_subobject Bomb1
      add_subobject Bomb2
      add_subobject Bomb3
      add_subobject Bomb4
      add_subobject Bomb5
      add_subobject Bomb6
   end_weapon
```

- **演示要点**：演示 WSF_SIX_DOF_EXPLICIT_WEAPON 的参数：add_subobject

### weapon（red_mrbm_1_lcg）｜武器

- **关键词**：weapon, 武器
- **出处**：`ballistic_missile_shootdown/weapons/ssm/red_mrbm_1_lcg.txt:17-18`　（同签名共 64 处，另见 `base_types/weapons/aam/ata4_generator.txt:40`、`base_types/weapons/aam/ata_blue_lr_a2a_rf_missile_lc_generator.txt:37`、`base_types/weapons/agm/atg_mach_4_missile_lc_generator.txt:17`）
- **片段**：

```text
   weapon red_mrbm_1 RED_MRBM_1
   end_weapon
```

- **演示要点**：演示 weapon（最小结构，无子参数）

### weapon · WSF_EXPLICIT_WEAPON｜武器

- **关键词**：weapon, WSF_EXPLICIT_WEAPON, 武器
- **出处**：`new_guidance/weapons/agm/blue_asm_missile.txt:122-125`
- **片段**：

```text
weapon BLUE_ASM_MISSILE WSF_EXPLICIT_WEAPON
      launched_platform_type BLUE_ASM_MISSILE
      quantity 1
end_weapon
```

- **演示要点**：演示 WSF_EXPLICIT_WEAPON（最小结构，无子参数）

### weapon_effects · WSF_SPHERICAL_LETHALITY｜杀伤效能

- **关键词**：weapon_effects, WSF_SPHERICAL_LETHALITY, allow_incidental_damage, minimum_radius, maximum_radius, minimum_damage, maximum_damage, threshold_damage, exponent, 杀伤效能
- **出处**：`cyber/weapons/agm/blue_gps_bomb_1.txt:51-59`　（同签名共 13 处，另见 `draw/weapons/agm/bomb_1000_lb.txt:66`、`script_demos/script_demo_2.txt:127`、`script_demos/script_demo_5.txt:172`）
- **片段**：

```text
weapon_effects BLUE_GPS_BOMB_1_EFFECTS WSF_SPHERICAL_LETHALITY 
   allow_incidental_damage 
   minimum_radius  25.0 m
   maximum_radius  30.0 m
   minimum_damage   0.1
   maximum_damage   1.0
   threshold_damage 0.2
   exponent         1.0
end_weapon_effects
```

- **演示要点**：演示 WSF_SPHERICAL_LETHALITY 的参数：allow_incidental_damage, minimum_radius, maximum_radius, minimum_damage, maximum_damage, threshold_damage, exponent

### weapon_effects · WSF_SPHERICAL_LETHALITY｜杀伤效能

- **关键词**：weapon_effects, WSF_SPHERICAL_LETHALITY, minimum_radius, maximum_radius, minimum_damage, maximum_damage, threshold_damage, exponent, 杀伤效能
- **出处**：`alternate_locations/weapons/agm/blue_glide_bomb_1.txt:49-57`　（同签名共 10 处，另见 `base_types/weapons/aam/blue_sr_a2a_ir_missile.txt:85`、`behavior_tree/weapons/aam/blue_sr_a2a_ir_missile.txt:88`、`wargame/weapons/aam/aam_type.txt:46`）
- **片段**：

```text
weapon_effects BLUE_GLIDE_BOMB_1_EFFECTS WSF_SPHERICAL_LETHALITY 
   minimum_radius    30 ft
   maximum_radius    100 ft
   minimum_damage    0.05
   maximum_damage    1
   threshold_damage  0.2
   
   exponent          1
end_weapon_effects
```

- **演示要点**：演示 WSF_SPHERICAL_LETHALITY 的参数：minimum_radius, maximum_radius, minimum_damage, maximum_damage, threshold_damage, exponent

### weapon_effects · WSF_SPHERICAL_LETHALITY｜杀伤效能

- **关键词**：weapon_effects, WSF_SPHERICAL_LETHALITY, allow_incidental_damage, minimum_radius, maximum_radius, maximum_damage, minimum_damage, 杀伤效能
- **出处**：`parachute/parachute_example.txt:63-69`　（同签名共 2 处，另见 `parachute/parachute_example2.txt:24`）
- **片段**：

```text
weapon_effects PARACHUTE_EFFECT WSF_SPHERICAL_LETHALITY
  allow_incidental_damage
  minimum_radius   .10 m
  maximum_radius   .15 m
  maximum_damage   0.1
  minimum_damage   0.0
end_weapon_effects
```

- **演示要点**：演示 WSF_SPHERICAL_LETHALITY 的参数：allow_incidental_damage, minimum_radius, maximum_radius, maximum_damage, minimum_damage

### weapon_effects · WSF_SPHERICAL_LETHALITY｜杀伤效能

- **关键词**：weapon_effects, WSF_SPHERICAL_LETHALITY, maximum_damage, minimum_radius, minimum_damage, maximum_radius, 杀伤效能
- **出处**：`cyber/avengers_detonate_effect.txt:10-15`　（同签名共 3 处，另见 `cyber/GoneFishing_ConstraintDemo.txt:24`、`wargame/weapons/agm/agm.txt:14`）
- **片段**：

```text
weapon_effects ALWAYS_ANGRY WSF_SPHERICAL_LETHALITY 
   maximum_damage 1.0
   minimum_radius 0.0 m
   minimum_damage 0.5
   maximum_radius 0.1 m
end_weapon_effects
```

- **演示要点**：演示 WSF_SPHERICAL_LETHALITY 的参数：maximum_damage, minimum_radius, minimum_damage, maximum_radius

### weapon_effects · WSF_GRADUATED_LETHALITY｜杀伤效能

- **关键词**：weapon_effects, WSF_GRADUATED_LETHALITY, radius_and_pk, allow_incidental_damage, 杀伤效能
- **出处**：`p6dof/platforms/sam-mr.txt:19-22`　（同签名共 26 处，另见 `p6dof/weapon_effects/basic_effects.txt:10`、`p6dof/weapon_effects/basic_effects.txt:15`、`p6dof/weapon_effects/basic_effects.txt:20`）
- **片段**：

```text
weapon_effects SAM-MR_LETHALITY WSF_GRADUATED_LETHALITY
   radius_and_pk 250 ft 1.0
   allow_incidental_damage
end_weapon_effects
```

- **演示要点**：演示 WSF_GRADUATED_LETHALITY 的参数：radius_and_pk, allow_incidental_damage

### weapon_effects · WSF_SPHERICAL_LETHALITY｜杀伤效能

- **关键词**：weapon_effects, WSF_SPHERICAL_LETHALITY, maximum_radius, allow_incidental_damage, 杀伤效能
- **出处**：`p6dof/unguided_rocket_test.txt:32-35`　（同签名共 9 处，另见 `p6dof/platforms/agm-mrc.txt:18`、`p6dof/platforms/gbu-500.txt:19`、`p6dof/platforms/ubu-500-ld.txt:15`）
- **片段**：

```text
weapon_effects UNGUIDED_ROCKET_LETHALITY WSF_SPHERICAL_LETHALITY
   maximum_radius 1500.0 ft
   allow_incidental_damage
end_weapon_effects
```

- **演示要点**：演示 WSF_SPHERICAL_LETHALITY 的参数：maximum_radius, allow_incidental_damage

### weapon_effects · WSF_GRADUATED_LETHALITY｜杀伤效能

- **关键词**：weapon_effects, WSF_GRADUATED_LETHALITY, radius_and_pk, incidental_damage_allowed, 杀伤效能
- **出处**：`laser_designator/weapons/agm/hellfire.txt:86-90`
- **片段**：

```text
weapon_effects HELLFIRE_EFFECT WSF_GRADUATED_LETHALITY
  #debug
  radius_and_pk 100 m 1.0  # put back at .7 after testing
  incidental_damage_allowed true
end_weapon_effects
```

- **演示要点**：演示 WSF_GRADUATED_LETHALITY 的参数：radius_and_pk, incidental_damage_allowed

### weapon_effects · WSF_GRADUATED_LETHALITY｜杀伤效能

- **关键词**：weapon_effects, WSF_GRADUATED_LETHALITY, use_3d_radius, radius_and_pk, 杀伤效能
- **出处**：`suppressor/weapons/sam/missile.txt:128-134`
- **片段**：

```text
weapon_effects MISSILE_WARHEAD WSF_GRADUATED_LETHALITY
  use_3d_radius

  radius_and_pk  100 m  0.75
  radius_and_pk  500 m  0.55
  radius_and_pk 5000 m  0
end_weapon_effects
```

- **演示要点**：演示 WSF_GRADUATED_LETHALITY 的参数：use_3d_radius, radius_and_pk

### weapon_effects · WSF_MOBILITY_AND_FIREPOWER_LETHALITY｜杀伤效能

- **关键词**：weapon_effects, WSF_MOBILITY_AND_FIREPOWER_LETHALITY, maximum_radius, table, 杀伤效能
- **出处**：`hellfire/active_radar_hellfire/hellfire_type.txt:219-230`　（同签名共 3 处，另见 `hellfire/laser_designation_via_dis/hellfire_type.txt:272`、`hellfire/semiactive_laser_hellfire/hellfire_type.txt:271`）
- **片段**：

```text
weapon_effects HELLFIRE_EFFECT WSF_MOBILITY_AND_FIREPOWER_LETHALITY
  #debug
  # Note:  Does not consider the hardness of any target.  All are treated the same.
  # No damage will occur to any platform unless detonation is within this radius.
  maximum_radius                          50 m
  table default
     probability_of_damage_given_proximity_hit 0.80
     probability_of_mk_given_damage            0.20
     probability_of_fk_given_damage            0.20
     probability_of_kk_given_damage            0.50
  end_table
end_weapon_effects
```

- **演示要点**：演示 WSF_MOBILITY_AND_FIREPOWER_LETHALITY 的参数：maximum_radius, table

### weapon_effects · WSF_HEL_LETHALITY｜杀伤效能

- **关键词**：weapon_effects, WSF_HEL_LETHALITY, target_type, category, 杀伤效能
- **出处**：`hel/hel_test.txt:138-153`
- **片段**：

```text
weapon_effects AA_SELF_PROTECT_LETHALITY WSF_HEL_LETHALITY
   target_type RED_ADV_FIGHTER_2
     minimum_energy 10 kj
     damage_radius 2 cm
     minimum_energy_density 1.0 kj/cm^2
     damage_radius 1.0 cm
   end_target_type

   category AIRCRAFT
     minimum_energy 10 kj
     damage_radius 2 cm
     minimum_energy_density 1.0 kj/cm^2
     damage_radius 1.0 cm
   end_category

end_weapon_effects
```

- **演示要点**：演示 WSF_HEL_LETHALITY 的参数：target_type, category

### weapon_effects · WSF_GRADUATED_LETHALITY｜杀伤效能

- **关键词**：weapon_effects, WSF_GRADUATED_LETHALITY, radius_and_pk, script, 杀伤效能
- **出处**：`base_types/weapons/other/gun.txt:49-65`　（同签名共 7 处，另见 `brawler/weapons/other/gun.txt:49`、`base_types/weapons/sam/blue_lr_sam_common.txt:142`、`base_types/weapons/sam/blue_sr_sam_common.txt:57`）
- **片段**：

```text
weapon_effects  BULLET_LETHALITY  WSF_GRADUATED_LETHALITY
   radius_and_pk      10 m   0.9   # bullet dispersion
   script void on_weapon_target_engagement(WsfPlatform aTarget)
      WsfPlatform weapon = WeaponPlatform();
      WsfPlatform target = aTarget;
      double slantrange = weapon.SlantRangeTo(TargetLocationAtLaunch());
      if ((!target.IsValid()) || (!weapon.IsValid()))
      {
         return;
      }
     #if (slantrange > 1300)
      if (slantrange > 650)   #meters
      {
         SetPkDegrade(0.5);
      }
   end_script
end_weapon_effects
```

- **演示要点**：演示 WSF_GRADUATED_LETHALITY 的参数：radius_and_pk, script

### weapon_effects · WSF_GRADUATED_LETHALITY｜杀伤效能

- **关键词**：weapon_effects, WSF_GRADUATED_LETHALITY, radius_and_pk, 杀伤效能
- **出处**：`air_to_air/weapons/aam/medium_range_radar_missile.txt:31-33`　（同签名共 79 处，另见 `air_to_air/weapons/aam/short_range_ir_missile.txt:188`、`alternate_locations/weapons/sam/large_sam.txt:44`、`ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:40`）
- **片段**：

```text
weapon_effects SIMPLE_EFFECT WSF_GRADUATED_LETHALITY
   radius_and_pk  20.0 m  0.5
end_weapon_effects
```

- **演示要点**：演示 WSF_GRADUATED_LETHALITY 的参数：radius_and_pk

### weapon_effects · WSF_SPHERICAL_LETHALITY｜杀伤效能

- **关键词**：weapon_effects, WSF_SPHERICAL_LETHALITY, maximum_radius, 杀伤效能
- **出处**：`p6dof/platforms/ubu-500-hd.txt:15-18`　（同签名共 2 处，另见 `six_dof/platforms/ubu-500-hd.txt:15`）
- **片段**：

```text
weapon_effects BOMB_500LB_HD_LETHALITY WSF_SPHERICAL_LETHALITY
   maximum_radius 500.0 ft
   # allow_incidental_damage
end_weapon_effects
```

- **演示要点**：演示 WSF_SPHERICAL_LETHALITY 的参数：maximum_radius

### weapon_effects · WSF_HEL_LETHALITY｜杀伤效能

- **关键词**：weapon_effects, WSF_HEL_LETHALITY, target_type, 杀伤效能
- **出处**：`hel/hel_test.txt:231-235`
- **片段**：

```text
weapon_effects ABM_LETHALITY WSF_HEL_LETHALITY
   target_type BALLISTIC_MISSILE
     minimum_energy_density 10 kj/cm^2
   end_target_type
end_weapon_effects
```

- **演示要点**：演示 WSF_HEL_LETHALITY 的参数：target_type

### weapon_effects · WSF_HEL_LETHALITY｜杀伤效能

- **关键词**：weapon_effects, WSF_HEL_LETHALITY, category, 杀伤效能
- **出处**：`hel/ground_hel_vs_hypersonic.txt:23-31`
- **片段**：

```text
weapon_effects hel_lethality WSF_HEL_LETHALITY

   //min_fluence 1.0e4 joules/m^2
   category HYPERSONIC
      minimum_energy_density 5 kj/cm^2
      damage_radius 20 cm
   end_category

end_weapon_effects
```

- **演示要点**：演示 WSF_HEL_LETHALITY 的参数：category

### weapon_effects · WSF_HEL_LETHALITY｜杀伤效能

- **关键词**：weapon_effects, WSF_HEL_LETHALITY, region, 杀伤效能
- **出处**：`hel/intersect_mesh_test.txt:44-56`　（同签名共 2 处，另见 `hel/intersect_mesh_test_beam_director.txt:49`）
- **片段**：

```text
weapon_effects hel_lethality WSF_HEL_LETHALITY

   region RED_ADV_FIGHTER_2 CANOPY
      minimum_energy 5 kj
   end_region

   region RED_ADV_FIGHTER_2 IRST
      minimum_energy 2 kj
      damage_radius 5 cm
   end_region

   #debug
end_weapon_effects
```

- **演示要点**：演示 WSF_HEL_LETHALITY 的参数：region

### weapon_rows（battle_manager）｜

- **关键词**：weapon_rows, target_pref
- **出处**：`iads_c2_demos/processors/battle_manager.txt:44-47`
- **片段**：

```text
         weapon_rows
            # format is: target_pref priority <int> "<type>" "<subtype>" <speed attrib> <alt attrib> <pk %> <AI priority> <SAM priority> <Other priority>
            target_pref priority 1 "UCAV" "Any" med high 0.7 1 1 0
         end_weapon_rows
```

- **演示要点**：演示 weapon_rows 的参数：target_pref

### weapon_table（battle_manager）｜

- **关键词**：weapon_table, speed_attributes, altitude_attributes, weapon_rows
- **出处**：`iads_c2_demos/processors/battle_manager.txt:30-48`
- **片段**：

```text
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
```

- **演示要点**：演示 weapon_table 的参数：speed_attributes, altitude_attributes, weapon_rows
