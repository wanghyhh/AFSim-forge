# 传感器与电子战

> **来源**：AFSIM 2.9.0 官方 demo 集（`demos/`，4,751 个 `.txt`，132 万行）
> **性质**：原文摘抄，未改写。同一「参数签名」只保留 1 条代表，并注明出现次数与另见位置
> **警示**：片段中数值为 demo 原值，**仅供语法参考，不得直接复用**；依赖 `common/` 数据表的片段须另行提供
> **检索**：按命令 / 类型名 / 参数名搜本卷；总表见 `90-tokens.md`

### antenna_pattern（acq_radar）｜天线方向图

- **关键词**：antenna_pattern, genap_pattern, peak_gain, minimum_gain, aperture_shape, azimuth_distribution, azimuth_beamwidth, azimuth_exponent, elevation_distribution, elevation_beamwidth, elevation_exponent, 天线方向图
- **出处**：`electronic_warfare/test_false_targets/sensors/radar/acq_radar.txt:15-26`　（同签名共 8 处，另见 `electronic_warfare/test_false_targets/sensors/radar/ew_radar.txt:15`、`electronic_warfare/test_multi_beam/sensors/radar/ew_radar.txt:15`、`iads_c2_demos/sensors/acq_radar.txt:14`）
- **片段**：

```text
antenna_pattern ACQ_RADAR_ANTENNA
  genap_pattern
    peak_gain              30 dB
    minimum_gain           -10.0 db
    aperture_shape         rectangular
    azimuth_distribution   cosine
    azimuth_beamwidth      5 deg
    azimuth_exponent       1.0
    elevation_distribution cosine
    elevation_beamwidth    5 deg
    elevation_exponent     1.0
end_antenna_pattern
```

- **演示要点**：演示 antenna_pattern 的参数：genap_pattern, peak_gain, minimum_gain, aperture_shape, azimuth_distribution, azimuth_beamwidth, azimuth_exponent, elevation_distribution, elevation_beamwidth, elevation_exponent

### antenna_pattern（soj_xband_jammer）｜天线方向图

- **关键词**：antenna_pattern, esa_pattern, minimum_gain, amplitude_quantization_bits, phase_quantization_bits, element_spacing_x, number_elements_x, element_spacing_y, number_elements_y, distribution_type, 天线方向图
- **出处**：`aea_iads/weapons/jammer/soj_xband_jammer.txt:16-31`　（同签名共 2 处，另见 `electronic_warfare/esm_detect_radar2.txt:35`）
- **片段**：

```text
antenna_pattern SOJ_XBAND_ANTENNA
  esa_pattern
    minimum_gain                -80.0 db
    amplitude_quantization_bits   8
    phase_quantization_bits       8
    element_spacing_x             0.015 m
    number_elements_x            100
    element_spacing_y             0.015 m
    number_elements_y            25

    distribution_type taylor
       sidelobe_level_x         25 dB
       sidelobe_level_y         25 dB
       n_bar_x                    5
       n_bar_y                    5
end_antenna_pattern
```

- **演示要点**：演示 antenna_pattern 的参数：esa_pattern, minimum_gain, amplitude_quantization_bits, phase_quantization_bits, element_spacing_x, number_elements_x, element_spacing_y, number_elements_y, distribution_type

### antenna_pattern（soj_xband_jammer）｜天线方向图

- **关键词**：antenna_pattern, esa_pattern, minimum_gain, amplitude_quantization_bits, phase_quantization_bits, element_spacing_x, number_elements_x, distribution_type, 天线方向图
- **出处**：`electronic_warfare/test_false_targets/weapons/jammer/soj_xband_jammer.txt:17-34`
- **片段**：

```text
antenna_pattern SOJ_XBAND_ANTENNA
  //complex_esa_pattern
  esa_pattern
    minimum_gain                -80.0 db
    amplitude_quantization_bits   8
    phase_quantization_bits       8
    element_spacing_x             0.015 m
    number_elements_x            10
    //edge_angle_x                  0.0 degrees  # rectangular array if 0.0 degrees
    //element_spacing_y             0.015 m
    //number_elements_y            10
    //edge_angle_y                 90.0 degrees # rectangular array if 90.0 degrees
    distribution_type taylor
       sidelobe_level_x         25 dB
       sidelobe_level_y         25 dB
       n_bar_x                    5
       n_bar_y                    5
end_antenna_pattern
```

- **演示要点**：演示 antenna_pattern 的参数：esa_pattern, minimum_gain, amplitude_quantization_bits, phase_quantization_bits, element_spacing_x, number_elements_x, distribution_type

### antenna_pattern（acq_radar）｜天线方向图

- **关键词**：antenna_pattern, rectangular_pattern, peak_gain, minimum_gain, azimuth_beamwidth, elevation_beamwidth, 天线方向图
- **出处**：`aea_iads/sensors/radar/acq_radar.txt:14-20`　（同签名共 4 处，另见 `cyber/exfiltrate_demo/sensors/radar/acq_radar.txt:14`、`iads/sensors/radar/acq_radar.txt:14`、`heatmap/sensors/radar/ew_radar.txt:14`）
- **片段**：

```text
antenna_pattern ACQ_RADAR_ANTENNA
  rectangular_pattern
    peak_gain              15 dB
    minimum_gain           -10.0 db
    azimuth_beamwidth      5 deg
    elevation_beamwidth    5 deg
end_antenna_pattern
```

- **演示要点**：演示 antenna_pattern 的参数：rectangular_pattern, peak_gain, minimum_gain, azimuth_beamwidth, elevation_beamwidth

### antenna_pattern（passive_detector_demo）｜天线方向图

- **关键词**：antenna_pattern, sine_pattern, peak_gain, minimum_gain, azimuth_beamwidth, elevation_beamwidth, 天线方向图
- **出处**：`sensor_demos/passive_detector_demo.txt:30-36`　（同签名共 21 处，另见 `sensor_demos/passive_detector_demo.txt:38`、`sensor_demos/passive_detector_df_demo.txt:28`、`sensor_demos/passive_detector_df_demo.txt:36`）
- **片段**：

```text
antenna_pattern BISTATIC_TX_ANTENNA
  sine_pattern
    peak_gain               0 dB
    minimum_gain          -20 db
    azimuth_beamwidth     360 deg
    elevation_beamwidth    45 deg
end_antenna_pattern
```

- **演示要点**：演示 antenna_pattern 的参数：sine_pattern, peak_gain, minimum_gain, azimuth_beamwidth, elevation_beamwidth

### antenna_pattern（sr_sam_acq_radar_sensor）｜天线方向图

- **关键词**：antenna_pattern, circular_pattern, peak_gain, beamwidth, minimum_gain, 天线方向图
- **出处**：`cyber/sensors/radar/sr_sam_acq_radar_sensor.txt:11-16`　（同签名共 22 处，另见 `orwaca_iads/sensors/radar/elr_sam_acq_radar_sensor.txt:10`、`orwaca_iads/sensors/radar/lr_sam_acq_radar_sensor.txt:10`、`orwaca_iads/sensors/radar/mr_sam_acq_radar_sensor.txt:10`）
- **片段**：

```text
antenna_pattern SR_SAM_ACQ_RADAR_ANTENNA
   circular_pattern
   peak_gain 20 db
   beamwidth 4 deg
   minimum_gain 10 db
end_antenna_pattern
```

- **演示要点**：演示 antenna_pattern 的参数：circular_pattern, peak_gain, beamwidth, minimum_gain

### antenna_pattern（generic_bomber_radar）｜天线方向图

- **关键词**：antenna_pattern, uniform_pattern, peak_gain, azimuth_beamwidth, elevation_beamwidth, 天线方向图
- **出处**：`base_types/sensors/radar/generic_bomber_radar.txt:51-57`　（同签名共 7 处，另见 `suppressor/platforms/sam_regiment.txt:15`、`suppressor/platforms/sam_regiment.txt:23`、`suppressor/sensors/radar/bomber_radar.txt:13`）
- **片段**：

```text
antenna_pattern GENERIC_BOMBER_RADAR_ANTENNA_PATTERN
  uniform_pattern
    peak_gain             20 db
    azimuth_beamwidth     360 degrees
    elevation_beamwidth   180 degrees
  end_uniform_pattern
end_antenna_pattern
```

- **演示要点**：演示 antenna_pattern 的参数：uniform_pattern, peak_gain, azimuth_beamwidth, elevation_beamwidth

### antenna_pattern（generic_file_control_radar）｜天线方向图

- **关键词**：antenna_pattern, sine_pattern, azimuth_beamwidth, elevation_beamwidth, peak_gain, 天线方向图
- **出处**：`shooter/sensors/radar/generic_file_control_radar.txt:11-17`
- **片段**：

```text
antenna_pattern GENERIC_FIRE_CONTROL_RADAR_ANTENNA_PATTERN
  sine_pattern
    azimuth_beamwidth           4.0 deg
    elevation_beamwidth         4.0 deg
    peak_gain           30 dB
  end_sine_pattern
end_antenna_pattern
```

- **演示要点**：演示 antenna_pattern 的参数：sine_pattern, azimuth_beamwidth, elevation_beamwidth, peak_gain

### antenna_pattern（generic_ground_radar）｜天线方向图

- **关键词**：antenna_pattern, constant_pattern, peak_gain, azimuth_beamwidth, elevation_beamwidth, 天线方向图
- **出处**：`base_types/sensors/radar/generic_ground_radar.txt:81-88`　（同签名共 2 处，另见 `base_types/sensors/radar/generic_radar_10nm.txt:156`）
- **片段**：

```text
antenna_pattern GROUND_RADAR_ANTENNA_PATTERN
  constant_pattern
  peak_gain             28 dB       # (A) antenna gain
  azimuth_beamwidth     4 deg       # (A) azimuth beamwidth
  elevation_beamwidth   10 deg      # (A) actual beamwidth
  elevation_beamwidth   10.5 deg    # (A) w/ 0.5 deg error
  end_constant_pattern
end_antenna_pattern
```

- **演示要点**：演示 antenna_pattern 的参数：constant_pattern, peak_gain, azimuth_beamwidth, elevation_beamwidth

### antenna_pattern（generic_fire_control_radar）｜天线方向图

- **关键词**：antenna_pattern, circular_pattern, beamwidth, peak_gain, 天线方向图
- **出处**：`base_types/sensors/radar/generic_fire_control_radar.txt:141-146`　（同签名共 2 处，另见 `base_types/sensors/radar/blue_ship_mf_radar.txt:89`）
- **片段**：

```text
antenna_pattern GENERIC_FIRE_CONTROL_RADAR_ANTENNA_PATTERN
  circular_pattern
    beamwidth           1.0 deg
    peak_gain           30 dB
  end_circular_pattern
end_antenna_pattern
```

- **演示要点**：演示 antenna_pattern 的参数：circular_pattern, beamwidth, peak_gain

### antenna_pattern（blue_ew_radar_1）｜天线方向图

- **关键词**：antenna_pattern, uniform_pattern, peak_gain, 天线方向图
- **出处**：`base_types/sensors/radar/blue_ew_radar_1.txt:10-14`　（同签名共 9 处，另见 `electronic_warfare/comm_jamming.txt:74`、`satellite_demos/patterns/uniformPattern.txt:9`、`satellite_demos/platforms/comsat_satellite.txt:14`）
- **片段**：

```text
antenna_pattern GS_RADAR_ANTENNA
  uniform_pattern
    peak_gain 37.92 db               # From www.fas.org
  end_uniform_pattern
end_antenna_pattern
```

- **演示要点**：演示 antenna_pattern 的参数：uniform_pattern, peak_gain

### antenna_pattern（ucav_esm）｜天线方向图

- **关键词**：antenna_pattern, constant, 天线方向图
- **出处**：`aea_iads/sensors/esm_rwr/ucav_esm.txt:14-16`　（同签名共 58 处，另见 `aea_iads/weapons/jammer/soj_vhf_jammer.txt:16`、`alv_routing/sensors/alv_esm.txt:14`、`base_types/weapons/aam/medium_range_uplink_missile.txt:32`）
- **片段**：

```text
antenna_pattern UCAV_ESM_ANTENNA
   constant 0 db
end_antenna_pattern
```

- **演示要点**：演示 antenna_pattern 的参数：constant

### antenna_pattern（sam_radar）｜天线方向图

- **关键词**：antenna_pattern, file, 天线方向图
- **出处**：`suppressor/sensors/radar/sam_radar.txt:14-16`　（同签名共 2 处，另见 `suppressor/sensors/radar/sam_radar.txt:18`）
- **片段**：

```text
antenna_pattern SAM_RDR_RX_ANTENNA
  file patterns/antgr_13.ant units db
end_antenna_pattern
```

- **演示要点**：演示 antenna_pattern 的参数：file

### antenna_pattern（parallel_striker）｜天线方向图

- **关键词**：antenna_pattern, constant_pattern, 天线方向图
- **出处**：`behavior_tree/platforms/parallel_striker.txt:20-23`　（同签名共 15 处，另见 `behavior_tree/platforms/run_tree_striker.txt:30`、`behavior_tree/platforms/selector_striker.txt:25`、`brawler/platforms/combined_platform.txt:27`）
- **片段**：

```text
antenna_pattern ESM_ANTENNA
   constant_pattern
      peak_gain 3 db
end_antenna_pattern
```

- **演示要点**：演示 antenna_pattern 的参数：constant_pattern

### antenna_pattern（comm_jamming）｜天线方向图

- **关键词**：antenna_pattern, uniform_pattern, 天线方向图
- **出处**：`electronic_warfare/comm_jamming.txt:225-229`　（同签名共 32 处，另见 `aea_iads/sensors/radar/ew_radar.txt:25`、`chaff/chaff_example.txt:128`、`cyber/exfiltrate_demo/sensors/radar/ew_radar.txt:25`）
- **片段**：

```text
antenna_pattern SPOT_JAMMER_ANTENNA
  uniform_pattern
     peak_gain 10 dB
  end_uniform_pattern
end_antenna_pattern
```

- **演示要点**：演示 antenna_pattern 的参数：uniform_pattern

### antenna_pattern（blue_abm_ttr）｜天线方向图

- **关键词**：antenna_pattern, circular_pattern, 天线方向图
- **出处**：`ballistic_missile_shootdown/sensors/radar/blue_abm_ttr.txt:19-23`　（同签名共 50 处，另见 `base_types/sensors/radar/blue_abm_ttr.txt:34`、`base_types/sensors/radar/blue_fcr_radar_1.txt:45`、`base_types/sensors/radar/generic_sar.txt:37`）
- **片段**：

```text
antenna_pattern BLUE_ABM_TTR_ANTENNA
   circular_pattern
      beamwidth                        1.0 deg              # Typical for phased-array tracker
      peak_gain                        40.0 db              # Typical for phased-array tracker
end_antenna_pattern
```

- **演示要点**：演示 antenna_pattern 的参数：circular_pattern

### antenna_pattern（rectangular_pattern）｜天线方向图

- **关键词**：antenna_pattern, rectangular_pattern, 天线方向图
- **出处**：`sensor_plot/antenna/rectangular_pattern.txt:9-14`　（同签名共 45 处，另见 `electronic_warfare/agile_jamming.txt:203`、`electronic_warfare/barrage_jamming.txt:55`、`electronic_warfare/esm_detect_multi_beam_radar.txt:77`）
- **片段**：

```text
antenna_pattern RECTANGULAR_PATTERN
   rectangular_pattern
      peak_gain                        40 db
      azimuth_beamwidth                4 deg
      elevation_beamwidth              2 deg
end_antenna_pattern
```

- **演示要点**：演示 antenna_pattern 的参数：rectangular_pattern

### antenna_pattern（mtd_radar）｜天线方向图

- **关键词**：antenna_pattern, alarm_pattern, 天线方向图
- **出处**：`base_types/sensors/radar/mtd_radar.txt:10-15`　（同签名共 3 处，另见 `base_types/sensors/radar/mti_radar.txt:10`、`base_types/sensors/radar/pd_radar.txt:10`）
- **片段**：

```text
antenna_pattern MTD_RADAR_ANTENNA
  alarm_pattern
     file            patterns/radar1.ant
     gain_adjustment 0.0 db
     #minimum_gain    -10 db
end_antenna_pattern
```

- **演示要点**：演示 antenna_pattern 的参数：alarm_pattern

### antenna_pattern（soj_sband_jammer）｜天线方向图

- **关键词**：antenna_pattern, sine_pattern, 天线方向图
- **出处**：`aea_iads/weapons/jammer/soj_sband_jammer.txt:16-23`　（同签名共 19 处，另见 `base_types/sensors/radar/red_missile_seeker_1.txt:22`、`ciws/sensors/radar/red_ciws_radar_1.txt:54`、`electronic_warfare/test_multi_beam/weapons/jammer/soj_sband_jammer.txt:15`）
- **片段**：

```text
antenna_pattern SOJ_SBAND_ANTENNA
   sine_pattern
      peak_gain             10.0 db
      minimum_gain         -20.0 db
      azimuth_beamwidth     20.0 deg
      elevation_beamwidth   20.0 deg
   end_sine_pattern
end_antenna_pattern
```

- **演示要点**：演示 antenna_pattern 的参数：sine_pattern

### antenna_pattern（esa_ula_pattern）｜天线方向图

- **关键词**：antenna_pattern, steered_array_pattern, 天线方向图
- **出处**：`sensor_plot/antenna/esa_ula_pattern.txt:13-20`　（同签名共 4 处，另见 `sensor_plot/antenna/esa_circular_pattern.txt:13`、`sensor_plot/sar/bomber_sar.txt:23`、`sensor_plot/sar/fighter_sar.txt:23`）
- **片段**：

```text
antenna_pattern ESA_ULA_PATTERN
   steered_array_pattern
      minimum_gain                     -60.0 db
      element_spacing_x                0.25 m
      number_elements_x                4
      element_spacing_y                0.25 m
      number_elements_y                1
end_antenna_pattern
```

- **演示要点**：演示 antenna_pattern 的参数：steered_array_pattern

### antenna_pattern（cosecant_pattern）｜天线方向图

- **关键词**：antenna_pattern, cosecant_squared_pattern, 天线方向图
- **出处**：`sensor_plot/antenna/cosecant_pattern.txt:13-21`　（同签名共 4 处，另见 `aea_iads/sensors/radar/ew_radar.txt:14`、`cyber/exfiltrate_demo/sensors/radar/ew_radar.txt:14`、`iads/sensors/radar/ew_radar.txt:14`）
- **片段**：

```text
antenna_pattern COSECANT_PATTERN
   cosecant_squared_pattern
      peak_gain                        35 db
      azimuth_beamwidth                10 deg
      elevation_beamwidth              15 deg
      minimum_elevation_for_peak_gain  5 deg
      elevation_of_peak/csc2_boundary  10 deg
      maximum_elevation_for_csc2       15 deg
end_antenna_pattern
```

- **演示要点**：演示 antenna_pattern 的参数：cosecant_squared_pattern

### antenna_pattern（blue_a2a_radar）｜天线方向图

- **关键词**：antenna_pattern, inline_table, 天线方向图
- **出处**：`base_types/sensors/radar/blue_a2a_radar.txt:103-113`　（同签名共 3 处，另见 `draw/sensors/radar/generic_fighter_radar.txt:10`、`outer_air_battle/sensors/radar/blue_a2a_radar.txt:109`）
- **片段**：

```text
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
```

- **演示要点**：演示 antenna_pattern 的参数：inline_table

### antenna_pattern（esm）｜天线方向图

- **关键词**：antenna_pattern, genap_pattern, 天线方向图
- **出处**：`air_to_air/sensors/esm_rwr/esm.txt:14-25`　（同签名共 5 处，另见 `air_to_air/sensors/radar/aesa_antenna.txt:10`、`engage/radars/mar.txt:10`、`sensor_plot/antenna/genap_circular_pattern.txt:13`）
- **片段**：

```text
antenna_pattern esm_reciever
   genap_pattern
      peak_gain               30 db 
      aperture_shape          circular
      azimuth_distribution    cosine
      azimuth_beamwidth       3.0 deg // x-band
      azimuth_exponent        1.0
      elevation_distribution  cosine
      elevation_beamwidth     3.0 deg 
      elevation_exponent      1.0
      minimum_gain           -5.0 db
end_antenna_pattern
```

- **演示要点**：演示 antenna_pattern 的参数：genap_pattern

### antenna_pattern（esa_pattern）｜天线方向图

- **关键词**：antenna_pattern, esa_pattern, 天线方向图
- **出处**：`sensor_plot/antenna/esa_pattern.txt:15-35`
- **片段**：

```text
antenna_pattern ESA_PATTERN
   esa_pattern
      element_pattern                  ESA_ELEMENT_PATTERN # comment out for isotrpic element
      back_baffled                     false  # use minimum gain outside az of [-90 90] range
      lattice                          rectangular
      minimum_gain                     -100.0 db

      amplitude_quantization_bits      8
      phase_quantization_bits          8

      element_spacing_x                0.1499 m
      number_elements_x                20
      element_spacing_y                0.1499 m
      number_elements_y                10

      distribution_type taylor
         sidelobe_level_x              18 dB
         sidelobe_level_y              18 dB
         n_bar_x                       5
         n_bar_y                       5
end_antenna_pattern
```

- **演示要点**：演示 antenna_pattern 的参数：esa_pattern

### antenna_pattern（bistatic_sp_false_target_jamming_demo）｜天线方向图

- **关键词**：antenna_pattern, 天线方向图
- **出处**：`sensor_demos/bistatic_sp_false_target_jamming_demo.txt:28-30`　（同签名共 12 处，另见 `sensor_demos/bistatic_sp_noise_jamming_demo.txt:17`、`sensor_demos/bistatic_support_false_target_jamming_demo.txt:28`、`sensor_demos/bistatic_support_noise_jamming_demo.txt:16`）
- **片段**：

```text
antenna_pattern JAMMER_ANTENNA
     constant  1 db
end_antenna_pattern
```

- **演示要点**：演示 antenna_pattern（最小结构，无子参数）

### antenna_plot（esa_circular_3d）｜

- **关键词**：antenna_plot, pattern_name, frequency, electronic_beam_steering, electronic_beam_steering_loss_exponent, azimuth_steering_angle, elevation_steering_angle, axes, azimuth_range, azimuth_step, elevation_range, elevation_step, gnuplot_file
- **出处**：`sensor_plot/antenna/esa_circular_3d.txt:15-29`
- **片段**：

```text
antenna_plot
   pattern_name                           ESA_CIRCULAR_PATTERN
   frequency                              1.0 ghz
   electronic_beam_steering               both
   electronic_beam_steering_loss_exponent 1.0
   azimuth_steering_angle                 0.0 degrees
   elevation_steering_angle               0.0 degrees

   axes                                both
   azimuth_range                       -90 deg 90 deg
   azimuth_step                        0.2 deg
   elevation_range                     -90 deg 90 deg
   elevation_step                      0.2 deg
   gnuplot_file                        esa_circular_3d.plt
end_antenna_plot
```

- **演示要点**：演示 antenna_plot 的参数：pattern_name, frequency, electronic_beam_steering, electronic_beam_steering_loss_exponent, azimuth_steering_angle, elevation_steering_angle, axes, azimuth_range, azimuth_step, elevation_range

### antenna_plot（esa_3d）｜

- **关键词**：antenna_plot, pattern_name, frequency, electronic_beam_steering, azimuth_steering_angle, elevation_steering_angle, axes, azimuth_range, azimuth_step, elevation_range, elevation_step, gnuplot_file
- **出处**：`sensor_plot/antenna/esa_3d.txt:15-29`
- **片段**：

```text
antenna_plot
   pattern_name                           ESA_PATTERN
   frequency                              1.0 ghz
   electronic_beam_steering               both
   #electronic_beam_steering_loss_exponent 1.0 # if using an element pattern may not want to use this
   azimuth_steering_angle                 30.0 degrees
   elevation_steering_angle               -30.0 degrees

   axes                                both
   azimuth_range                       -180 deg 180 deg
   azimuth_step                        1.0 deg
   elevation_range                     -90 deg 90 deg
   elevation_step                      1.0 deg
   gnuplot_file                        esa_3d.plt
end_antenna_plot
```

- **演示要点**：演示 antenna_plot 的参数：pattern_name, frequency, electronic_beam_steering, azimuth_steering_angle, elevation_steering_angle, axes, azimuth_range, azimuth_step, elevation_range, elevation_step

### antenna_plot（esa_2d）｜

- **关键词**：antenna_plot, pattern_name, frequency, electronic_beam_steering, electronic_beam_steering_loss_exponent, azimuth_steering_angle, elevation_steering_angle, axes, elevation_range, elevation_step, output_file
- **出处**：`sensor_plot/antenna/esa_2d.txt:29-41`　（同签名共 3 处，另见 `sensor_plot/antenna/esa_circular_2d.txt:29`、`sensor_plot/antenna/esa_ula_2d.txt:29`）
- **片段**：

```text
antenna_plot
   pattern_name                           ESA_PATTERN
   frequency                              10.0 ghz
   electronic_beam_steering               both
   electronic_beam_steering_loss_exponent 1.0
   azimuth_steering_angle                 0.0 degrees
   elevation_steering_angle               0.0 degrees

   axes                                vertical
   elevation_range                       -90 deg 90 deg
   elevation_step                        1.0 deg
   output_file                         esa_el.plt
end_antenna_plot
```

- **演示要点**：演示 antenna_plot 的参数：pattern_name, frequency, electronic_beam_steering, electronic_beam_steering_loss_exponent, azimuth_steering_angle, elevation_steering_angle, axes, elevation_range, elevation_step, output_file

### antenna_plot（esa_circular_2d）｜

- **关键词**：antenna_plot, pattern_name, frequency, electronic_beam_steering, electronic_beam_steering_loss_exponent, azimuth_steering_angle, elevation_steering_angle, axes, azimuth_range, azimuth_step, output_file
- **出处**：`sensor_plot/antenna/esa_circular_2d.txt:15-27`　（同签名共 2 处，另见 `sensor_plot/antenna/esa_ula_2d.txt:15`）
- **片段**：

```text
antenna_plot
   pattern_name                           ESA_CIRCULAR_PATTERN
   frequency                              1.0 ghz
   electronic_beam_steering               both
   electronic_beam_steering_loss_exponent 1.0
   azimuth_steering_angle                 0.0 degrees
   elevation_steering_angle               0.0 degrees

   axes                                horizontal
   azimuth_range                       -180 deg 180 deg
   azimuth_step                        1.0 deg
   output_file                         esa_circular_az.plt
end_antenna_plot
```

- **演示要点**：演示 antenna_plot 的参数：pattern_name, frequency, electronic_beam_steering, electronic_beam_steering_loss_exponent, azimuth_steering_angle, elevation_steering_angle, axes, azimuth_range, azimuth_step, output_file

### antenna_plot（esa_2d）｜

- **关键词**：antenna_plot, pattern_name, frequency, electronic_beam_steering, azimuth_steering_angle, elevation_steering_angle, axes, azimuth_range, azimuth_step, output_file
- **出处**：`sensor_plot/antenna/esa_2d.txt:15-27`
- **片段**：

```text
antenna_plot
   pattern_name                           ESA_PATTERN
   frequency                              1.0 ghz
   electronic_beam_steering               both
   #electronic_beam_steering_loss_exponent 1.0 # if using an element pattern may not want to use this
   azimuth_steering_angle                 0.0 degrees
   elevation_steering_angle               0.0 degrees

   axes                                horizontal
   azimuth_range                       -180 deg 180 deg
   azimuth_step                        1.0 deg
   output_file                         esa_az.plt
end_antenna_plot
```

- **演示要点**：演示 antenna_plot 的参数：pattern_name, frequency, electronic_beam_steering, azimuth_steering_angle, elevation_steering_angle, axes, azimuth_range, azimuth_step, output_file

### antenna_plot（circular_3d）｜

- **关键词**：antenna_plot, pattern_name, axes, azimuth_range, azimuth_step, elevation_range, elevation_step, gnuplot_file, output_file
- **出处**：`sensor_plot/antenna/circular_3d.txt:15-25`　（同签名共 2 处，另见 `sensor_plot/antenna/cosecant_3d.txt:15`）
- **片段**：

```text
antenna_plot
   pattern_name                        CIRCULAR_PATTERN

   axes                                both
   azimuth_range                       -180 deg 180 deg
   azimuth_step                        0.2 deg
   elevation_range                     -90 deg 90 deg
   elevation_step                      0.2 deg
   gnuplot_file                        circular_3d.plt
   output_file                         circular_3d.ant
end_antenna_plot
```

- **演示要点**：演示 antenna_plot 的参数：pattern_name, axes, azimuth_range, azimuth_step, elevation_range, elevation_step, gnuplot_file, output_file

### antenna_plot（esa_element_3d）｜

- **关键词**：antenna_plot, pattern_name, frequency, axes, azimuth_range, azimuth_step, elevation_range, elevation_step, gnuplot_file
- **出处**：`sensor_plot/antenna/esa_element_3d.txt:15-25`
- **片段**：

```text
antenna_plot
   pattern_name                       ESA_ELEMENT_PATTERN
   frequency                          1.0 ghz

   axes                               both
   azimuth_range                      -180 deg 180 deg
   azimuth_step                       1.0 deg
   elevation_range                    -90 deg 90 deg
   elevation_step                     1.0 deg
   gnuplot_file                       esa_element_3d.plt
end_antenna_plot
```

- **演示要点**：演示 antenna_plot 的参数：pattern_name, frequency, axes, azimuth_range, azimuth_step, elevation_range, elevation_step, gnuplot_file

### antenna_plot（genap_circular_3d）｜

- **关键词**：antenna_plot, pattern_name, axes, azimuth_range, azimuth_step, elevation_range, elevation_step, gnuplot_file
- **出处**：`sensor_plot/antenna/genap_circular_3d.txt:15-24`　（同签名共 3 处，另见 `sensor_plot/antenna/genap_rectangular_3d.txt:15`、`sensor_plot/antenna/rectangular_3d.txt:15`）
- **片段**：

```text
antenna_plot
   pattern_name                        GENAP_CIRCULAR_PATTERN

   axes                                both
   azimuth_range                       -180 deg 180 deg
   azimuth_step                        0.2 deg
   elevation_range                     -90 deg 90 deg
   elevation_step                      0.2 deg
   gnuplot_file                        genap_circular_3d.plt
end_antenna_plot
```

- **演示要点**：演示 antenna_plot 的参数：pattern_name, axes, azimuth_range, azimuth_step, elevation_range, elevation_step, gnuplot_file

### antenna_plot（circular_2d）｜

- **关键词**：antenna_plot, pattern_name, axes, azimuth_range, azimuth_step, output_file
- **出处**：`sensor_plot/antenna/circular_2d.txt:15-22`　（同签名共 7 处，另见 `sensor_plot/antenna/cosecant_2d.txt:15`、`sensor_plot/antenna/genap_circular_2d.txt:15`、`sensor_plot/antenna/genap_circular_2d.txt:24`）
- **片段**：

```text
antenna_plot
   pattern_name                        CIRCULAR_PATTERN

   axes                                horizontal
   azimuth_range                       -180 deg 180 deg
   azimuth_step                        0.1 deg
   output_file                         circular_az.plt
end_antenna_plot
```

- **演示要点**：演示 antenna_plot 的参数：pattern_name, axes, azimuth_range, azimuth_step, output_file

### antenna_plot（circular_2d）｜

- **关键词**：antenna_plot, pattern_name, axes, elevation_range, elevation_step, output_file
- **出处**：`sensor_plot/antenna/circular_2d.txt:24-31`　（同签名共 3 处，另见 `sensor_plot/antenna/cosecant_2d.txt:24`、`sensor_plot/antenna/rectangular_2d.txt:24`）
- **片段**：

```text
antenna_plot
   pattern_name                        CIRCULAR_PATTERN

   axes                                vertical
   elevation_range                       -90 deg 90 deg
   elevation_step                        0.1 deg
   output_file                         circular_el.plt
end_antenna_plot
```

- **演示要点**：演示 antenna_plot 的参数：pattern_name, axes, elevation_range, elevation_step, output_file

### attenuation · WSF_OPTICAL_ATTENUATION｜衰减

- **关键词**：attenuation, WSF_OPTICAL_ATTENUATION, internal_table, 衰减
- **出处**：`space_operations/comms/lasercomm_link.txt:10-12`
- **片段**：

```text
attenuation laser_link_attenuation WSF_OPTICAL_ATTENUATION
   internal_table mono_1550nm_a2_h1
end_attenuation
```

- **演示要点**：演示 WSF_OPTICAL_ATTENUATION 的参数：internal_table

### attenuation（AAA_README）｜衰减

- **关键词**：attenuation, 衰减
- **出处**：`hel/atmosphere/AAA_README.txt:90-91`　（同签名共 27 处，另见 `hel/atmosphere/COEFSxxxx_x.txt:18`、`hel/atmosphere/COEFS1000_1.txt:119`、`hel/atmosphere/COEFS1000_2.txt:119`）
- **片段**：

```text
attenuation
end_attenuation
```

- **演示要点**：演示 attenuation（最小结构，无子参数）

### beam（composite_demo）｜波束

- **关键词**：beam, antenna_height, scan_mode, azimuth_scan_limits, elevation_scan_limits, antenna_tilt, transmitter, receiver, clutter_model, swerling_case, probability_of_false_alarm, number_of_pulses_integrated, detector_law, 波束
- **出处**：`sensor_demos/composite_demo.txt:52-87`
- **片段**：

```text
   beam 1
      antenna_height                     10 m

      scan_mode                          azimuth_and_elevation
      azimuth_scan_limits                -45 deg 45 deg
      elevation_scan_limits              -45 deg 45 deg

      antenna_tilt                       40 deg

      transmitter
         antenna_pattern                 EW_RADAR_ANTENNA
         power                           100 kw
         frequency                       200 mhz
         polarization                    horizontal
         pulse_width                     50 us
         pulse_repetition_interval       1250 usec
         internal_loss                   2 db
         attenuation_model               earce
      end_transmitter

      receiver
         antenna_pattern                 EW_RADAR_ANTENNA
         beam_tilt                       10.0 deg
         bandwidth                       2.0 mhz
         noise_power                     -150 dBw
         internal_loss                   7 dB
      end_receiver

      clutter_model                      EW_RADAR_CLUTTER_B1


      swerling_case                      1
      probability_of_false_alarm         10e-6
      number_of_pulses_integrated        32
      detector_law                       linear
   end_beam
```

- **演示要点**：演示 beam 的参数：antenna_height, scan_mode, azimuth_scan_limits, elevation_scan_limits, antenna_tilt, transmitter, receiver, clutter_model, swerling_case, probability_of_false_alarm

### beam（esm_detect_multi_beam_radar）｜波束

- **关键词**：beam, one_m2_detect_range, maximum_range, antenna_height, scan_mode, azimuth_scan_limits, elevation_scan_limits, transmitter, receiver, swerling_case, probability_of_false_alarm, number_of_pulses_integrated, 波束
- **出处**：`electronic_warfare/esm_detect_multi_beam_radar.txt:90-120`　（同签名共 3 处，另见 `electronic_warfare/esm_detect_multi_sensor_radar.txt:124`、`electronic_warfare/esm_detect_multi_sensor_radar.txt:186`）
- **片段**：

```text
   beam 1
      one_m2_detect_range          100.0 nm
      maximum_range                120 nm

      antenna_height               6.0 m

      scan_mode                    azimuth_and_elevation
      azimuth_scan_limits          -180 deg 180 deg
      elevation_scan_limits        -6 deg 2.5 deg

      transmitter
         antenna_pattern            EW_RADAR_ANTENNA
         power                      1000.0 kw
         frequency                  200 mhz
         pulse_width                25 usec
         pulse_repetition_interval  1250 usec
         internal_loss              2 db
      end_transmitter

      receiver
         beam_tilt                  10.0 deg
         bandwidth                  2.0 mhz
         noise_power                -160 dBw  # will be calibrated for 1 m^2
         internal_loss              7 dB
      end_receiver

      # Swerling detector
      swerling_case                 1
      probability_of_false_alarm    1.0e-6
      number_of_pulses_integrated   32
   end_beam
```

- **演示要点**：演示 beam 的参数：one_m2_detect_range, maximum_range, antenna_height, scan_mode, azimuth_scan_limits, elevation_scan_limits, transmitter, receiver, swerling_case, probability_of_false_alarm

### beam（jamming_perception）｜波束

- **关键词**：beam, maximum_range, antenna_height, scan_mode, azimuth_scan_limits, transmitter, receiver, swerling_case, probability_of_false_alarm, number_of_pulses_integrated, continuous_jamming_perception_threshold, pulsed_jamming_perception_threshold, 波束
- **出处**：`electronic_warfare/jamming_perception.txt:53-85`
- **片段**：

```text
   beam 1
      maximum_range                120 nm
   
      antenna_height                6.0 m

      scan_mode                     azimuth
      azimuth_scan_limits           -180 deg 180 deg

      transmitter
         antenna_pattern            EW_RADAR_ANTENNA
         beam_tilt                  20.0 deg
         power                      100.0 kw
         frequency                  200 mhz
         pulse_width                25 usec
         pulse_repetition_interval  1250 usec
         internal_loss              2 db
      end_transmitter

      receiver
         beam_tilt                  5.0 deg
         bandwidth                  20.0 mhz
         noise_power                -160 dBw  # will be calibrated for 1 m^2
         internal_loss              7 dB
      end_receiver

      # Swerling detector
      swerling_case                 1
      probability_of_false_alarm    1.0e-6
      number_of_pulses_integrated   16

      continuous_jamming_perception_threshold 15 db
      pulsed_jamming_perception_threshold     15 db
   end_beam
```

- **演示要点**：演示 beam 的参数：maximum_range, antenna_height, scan_mode, azimuth_scan_limits, transmitter, receiver, swerling_case, probability_of_false_alarm, number_of_pulses_integrated, continuous_jamming_perception_threshold

### beam（agile_jamming）｜波束

- **关键词**：beam, one_m2_detect_range, maximum_range, antenna_height, scan_mode, azimuth_scan_limits, transmitter, receiver, jamming_perception_threshold, swerling_case, probability_of_false_alarm, number_of_pulses_integrated, 波束
- **出处**：`electronic_warfare/agile_jamming.txt:241-282`
- **片段**：

```text
      beam 1
         one_m2_detect_range          100.0 nm
         maximum_range                120 nm

         antenna_height               6.0 m

         scan_mode                    azimuth
         azimuth_scan_limits         -180 deg 180 deg


         transmitter
            antenna_pattern            EW_RADAR_ANTENNA
            beam_tilt                  10.0 deg
            power                      1000.0 kw
            frequency                  200 mhz
            pulse_width                25 usec
            pulse_repetition_interval  1250 usec
            internal_loss              2 db
            frequency_list
               frequency_id            1 200 mhz
               frequency_id            2 210 mhz
               frequency_id            3 220 mhz
            end_frequency_list
         end_transmitter

         receiver
            beam_tilt                  10.0 deg
            bandwidth                  2.0 mhz
            noise_power                -160 dBw  # will be calibrated for 1 m^2
            internal_loss              7 dB

            electronic_protect EW_RADAR_EP
            end_electronic_protect
         end_receiver

         jamming_perception_threshold  3.0 dB

         # Swerling detector
         swerling_case                 1
         probability_of_false_alarm    1.0e-6
         number_of_pulses_integrated   32
      end_beam
```

- **演示要点**：演示 beam 的参数：one_m2_detect_range, maximum_range, antenna_height, scan_mode, azimuth_scan_limits, transmitter, receiver, jamming_perception_threshold, swerling_case, probability_of_false_alarm

### beam（ew_radar）｜波束

- **关键词**：beam, one_m2_detect_range, antenna_height, scan_mode, azimuth_scan_limits, jamming_perception_threshold, transmitter, receiver, probability_of_false_alarm, swerling_case, 波束
- **出处**：`electronic_warfare/test_multi_beam/sensors/radar/ew_radar.txt:39-85`
- **片段**：

```text
      beam 1
         one_m2_detect_range            100.0 nm

         antenna_height                 6.0 m

         scan_mode                      azimuth
         azimuth_scan_limits            -180 deg 180 deg

         jamming_perception_threshold 3.0 dB

         transmitter
            antenna_pattern             EW_RADAR_ANTENNA
            beam_tilt                   10.0 deg
            power                       1000.0 kw
            frequency                   200 mhz
            internal_loss               2 db
            frequency_channels 150 mhz 5 mhz 250 mhz
         end_transmitter

         receiver
            antenna_pattern             EW_RADAR_ANTENNA
            beam_tilt                   10.0 deg
            bandwidth                   2.0 mhz
            noise_power                 -160 dBw  # will be calibrated for 1 m^2
            internal_loss               7 dB
            electronic_protect
               technique frequency_agility
                  mitigated_techniques
                     noise_jamming
                  end_mitigated_techniques
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
               end_technique
            end_electronic_protect
         end_receiver

         probability_of_false_alarm     1.0e-6
         swerling_case                  1
      end_beam
```

- **演示要点**：演示 beam 的参数：one_m2_detect_range, antenna_height, scan_mode, azimuth_scan_limits, jamming_perception_threshold, transmitter, receiver, probability_of_false_alarm, swerling_case

### beam（simple_ft_jamming）｜波束

- **关键词**：beam, scan_mode, azimuth_scan_limits, elevation_field_of_view, minimum_range, maximum_range, one_m2_detect_range, transmitter, receiver, number_of_pulses_integrated, 波束
- **出处**：`electronic_warfare/simple_ft_jamming.txt:106-171`
- **片段**：

```text
beam 1

   # The sensor sweeps only in azimuth
   scan_mode                 azimuth
   azimuth_scan_limits       -180 deg 180 deg

   # The field of view, minimum_range and maximum_range are not required.
   # They are simply used for quick culling and should be generous.
   # (i.e. the field_of_view limits should be probably be larger than the
   # corresponding slew limit because the beam can probably detect things
   # outside the slew limit).
   elevation_field_of_view  -2.5 deg 42.5 deg

   minimum_range        0 nm
   maximum_range      400 km  # really 225 km

   one_m2_detect_range 225 km


   transmitter
      power           750 kw
      frequency       900 mhz
      bandwidth       0.1 mhz
      pulse_width                  3  usec
      pulse_repetition_interval    750 usec // max PRI range of 225 km
      antenna_pattern EW_RADAR_ANTENNA
      antenna_tilt     10 deg
   end_transmitter

   receiver
      antenna_pattern EW_RADAR_ANTENNA
      antenna_tilt     10 deg
      frequency       900 mhz
      bandwidth         1 mhz
     # To remove SLB: Comment out following electronic_protect block
     electronic_protect
        technique sensor_sidelobe_blanker
           default_on
            mitigated_techniques
               false_targets
               simple_false_targets
            end_mitigated_techniques
            effect slb_effect WSF_SLB_EFFECT
               auxiliary_antenna_pattern    AUX_ANTENNA
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
         end_technique
      end_electronic_protect
   end_receiver

   number_of_pulses_integrated 10
end_beam
```

- **演示要点**：演示 beam 的参数：scan_mode, azimuth_scan_limits, elevation_field_of_view, minimum_range, maximum_range, one_m2_detect_range, transmitter, receiver, number_of_pulses_integrated

### beam（agile_auto-repeater_jamming）｜波束

- **关键词**：beam, one_m2_detect_range, maximum_range, antenna_height, scan_mode, azimuth_scan_limits, jamming_perception_threshold, transmitter, receiver, 波束
- **出处**：`electronic_warfare/agile_auto-repeater_jamming.txt:148-213`　（同签名共 6 处，另见 `electronic_warfare/semi-auto_repeater_jamming_1.txt:219`、`electronic_warfare/agile_repeater_jamming-rt1.txt:260`、`electronic_warfare/agile_repeater_jamming-rt2.txt:260`）
- **片段**：

```text
      beam 1
         one_m2_detect_range          100.0 nm
         maximum_range                120 nm

         antenna_height               6.0 m

         scan_mode                    azimuth
         azimuth_scan_limits         -180 deg 180 deg

         jamming_perception_threshold 3.0 dB

         transmitter
            antenna_pattern           EW_RADAR_ANTENNA
            beam_tilt              10 deg
            power                     750.0 kw
            pulse_width                  50  usec
            pulse_repetition_interval    750 usec // max PRI range of 225 km
            frequency_channels 920 mhz 10 mhz 940 mhz
         end_transmitter

         receiver
            antenna_pattern           EW_RADAR_ANTENNA
            bandwidth                 2.0 mhz

            electronic_protect
               technique agility
                  mitigated_technique_classes
                     NOISE_JAMMING
                     FALSE_TARGET_JAMMING
                  end_mitigated_technique_classes
                  effect agility_effect WSF_AGILITY_EFFECT
                     agility_type mode_changing
                        mode_name one
                        mode_name two
                     end_agility_type
                     agility_type frequency_changing
                     end_agility_type
                  end_effect
               end_technique

              technique sensor_sidelobe_blanker
                  mitigated_technique_classes
                     FALSE_TARGET_JAMMING
                  end_mitigated_technique_classes
                 effect slb_effect WSF_SLB_EFFECT
                    antenna_pattern    AUX_ANTENNA
                    blanking_threshold 0 dB
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
               end_technique
            end_electronic_protect
         end_receiver
      end_beam
```

- **演示要点**：演示 beam 的参数：one_m2_detect_range, maximum_range, antenna_height, scan_mode, azimuth_scan_limits, jamming_perception_threshold, transmitter, receiver

### beam（coherent_sensor_demo）｜波束

- **关键词**：beam, one_m2_detect_range, maximum_range, antenna_height, scan_mode, azimuth_scan_limits, transmitter, receiver, 波束
- **出处**：`sensor_demos/coherent_sensor_demo.txt:33-56`
- **片段**：

```text
   beam 1
      one_m2_detect_range          100 nm
      maximum_range                120 nm

      antenna_height               6 m

      scan_mode                    azimuth
      azimuth_scan_limits         -180 deg 180 deg

      transmitter
         antenna_pattern           EW_RADAR_ANTENNA
         beam_tilt                  10 deg
         power                     750 kw
         pulse_width                50 usec
         pulse_repetition_interval 750 usec // max PRI range of 225 km
         frequency                 920 mhz
      end_transmitter

      receiver
         antenna_pattern           EW_RADAR_ANTENNA
         bandwidth                 2.0 mhz
      end_receiver

   end_beam
```

- **演示要点**：演示 beam 的参数：one_m2_detect_range, maximum_range, antenna_height, scan_mode, azimuth_scan_limits, transmitter, receiver

### beam（noise_cloud）｜波束

- **关键词**：beam, transmitter, receiver, swerling_case, 波束
- **出处**：`noise_cloud/noise_cloud.txt:19-28`
- **片段**：

```text
      beam 1
         transmitter
            frequency 0.5 ghz
            power 60 dbw
         end_transmitter
         receiver
            noise_power -140 dbw
         end_receiver
         swerling_case 1
      end_beam
```

- **演示要点**：演示 beam 的参数：transmitter, receiver, swerling_case

### beam（composite_demo）｜波束

- **关键词**：beam, transmitter, clutter_model, 波束
- **出处**：`sensor_demos/composite_demo.txt:89-95`
- **片段**：

```text
   beam 2
      transmitter
         frequency                       225 mhz
      end_transmitter

      clutter_model                      EW_RADAR_CLUTTER_B2
   end_beam
```

- **演示要点**：演示 beam 的参数：transmitter, clutter_model

### beam（jamming_perception）｜波束

- **关键词**：beam, transmitter, receiver, 波束
- **出处**：`electronic_warfare/jamming_perception.txt:87-96`
- **片段**：

```text
   beam 2
      transmitter
         frequency                  250 mhz
         beam_tilt                  65 deg
      end_transmitter
      receiver
         beam_tilt                  65 deg
      end_receiver
      #continuous_jamming_perception_threshold 15 db
   end_beam
```

- **演示要点**：演示 beam 的参数：transmitter, receiver

### beam（agile_auto-repeater_jamming）｜波束

- **关键词**：beam, transmitter, 波束
- **出处**：`electronic_warfare/agile_auto-repeater_jamming.txt:215-219`　（同签名共 23 处，另见 `electronic_warfare/agile_auto-repeater_jamming.txt:235`、`electronic_warfare/agile_auto-repeater_jamming.txt:241`、`electronic_warfare/agile_repeater_jamming-rt1.txt:330`）
- **片段**：

```text
      beam 2
         transmitter
            frequency_channels 925 mhz 10 mhz 945 mhz
         end_transmitter
      end_beam
```

- **演示要点**：演示 beam 的参数：transmitter

### beam（simple_ft_jamming）｜波束

- **关键词**：beam, 波束
- **出处**：`electronic_warfare/simple_ft_jamming.txt:173-174`　（同签名共 7 处，另见 `electronic_warfare/esm_detect_multi_beam_radar.txt:122`、`electronic_warfare/esm_detect_multi_sensor_radar.txt:156`、`electronic_warfare/esm_detect_multi_sensor_radar.txt:218`）
- **片段**：

```text
beam 2
end_beam
```

- **演示要点**：演示 beam（最小结构，无子参数）

### close_target_detection（chaff_example_ttr）｜

- **关键词**：close_target_detection, acquire_deltas, reacquire_deltas
- **出处**：`chaff/chaff_example_ttr.txt:208-221`　（同签名共 4 处，另见 `electronic_warfare/closely_space_targets.txt:81`、`electronic_warfare/closely_space_targets_ttr.txt:127`、`electronic_warfare/close_targets_ttr.txt:138`）
- **片段**：

```text
      close_target_detection
         #debug
         acquire_deltas
            azimuth_delta       0.2 deg
            elevation_delta     0.2 deg
            range_delta         25 m
         end_acquire_deltas

         reacquire_deltas
            azimuth_delta       0.25 deg
            elevation_delta     0.25 deg
            range_delta         1000 m
         end_reacquire_deltas
      end_close_target_detection
```

- **演示要点**：演示 close_target_detection 的参数：acquire_deltas, reacquire_deltas

### clutter_model（clutter_table_generation）｜

- **关键词**：clutter_model, maximum_range, azimuth_angle_limit, azimuth_angle_increment
- **出处**：`sensor_plot/clutter/clutter_table_generation.txt:39-43`　（同签名共 2 处，另见 `sensor_plot/clutter/clutter_table_regneration_test.txt:51`）
- **片段**：

```text
clutter_model acq_radar_clutter alarm
   maximum_range 20 km
   azimuth_angle_limit 8 degrees
   azimuth_angle_increment 1.5 degrees
end_clutter_model
```

- **演示要点**：演示 clutter_model 的参数：maximum_range, azimuth_angle_limit, azimuth_angle_increment

### clutter_model（ttr_radar）｜

- **关键词**：clutter_model
- **出处**：`aea_iads/sensors/radar/ttr_radar.txt:23-24`　（同签名共 9 处，另见 `aea_iads/sensors/radar/ttr_radar.txt:26`、`aea_iads/sensors/radar/ttr_radar.txt:29`、`base_types/sensors/radar/mtd_radar.txt:17`）
- **片段**：

```text
clutter_model TTR_RADAR_SEARCH_CLUTTER surface_clutter
end_clutter_model
```

- **演示要点**：演示 clutter_model（最小结构，无子参数）

### clutter_table（clutter_table_generation）｜

- **关键词**：clutter_table, altitudes, sensor_platform_latitude, sensor_platform_longitude, sensor_platform_altitude, output_file_name
- **出处**：`sensor_plot/clutter/clutter_table_generation.txt:109-123`　（同签名共 2 处，另见 `sensor_plot/clutter/clutter_table_regneration_test.txt:116`）
- **片段**：

```text
clutter_table
   altitudes
      from  0 m to 5000 m by 0.5 km
      ranges
         from 1 km to 10 km by 0.5 km
      bearings
         from -180 degrees to 180 degrees by 20 degrees
   end_altitudes

   sensor_platform_latitude 27.3112n
   sensor_platform_longitude 56.2564e
   sensor_platform_altitude 30 feet

   output_file_name clutter_table.dat
end_clutter_table
```

- **演示要点**：演示 clutter_table 的参数：altitudes, sensor_platform_latitude, sensor_platform_longitude, sensor_platform_altitude, output_file_name

### correlation_method（uhf_ew_radar_sensor_platform）｜

- **关键词**：correlation_method, precise_mode, tracking_sigma, turning_sigma
- **出处**：`swarm/platforms/uhf_ew_radar_sensor_platform.txt:28-36`
- **片段**：

```text
      correlation_method nearest_neighbor
         precise_mode true  #NOT DOCUMENTED - EVENTUALLY WILL BE DEFAULT
         tracking_sigma 1   # multiplier applied to sensor sigma
                            #( 5 gives 99.99% correlation if ellipsoid boundaries intersected
                            #( 3 gives 99.73% correlation if ellipsoid boundaries intersected
                            #( 1 gives 68.27% correlation if ellipsoid boundaries intersected
                             #(.5 gives 38.29% correlation if ellipsoid boundaries intersected
         turning_sigma  1   # KEEP THE SAME AS tracking_sigma!!!
      end_correlation_method
```

- **演示要点**：演示 correlation_method 的参数：precise_mode, tracking_sigma, turning_sigma

### correlation_method（commander_platform）｜

- **关键词**：correlation_method, tracking_sigma, turning_sigma
- **出处**：`bearing_only/platforms/commander_platform.txt:37-45`
- **片段**：

```text
        correlation_method nearest_neighbor
   #        precise_mode true  #NOT DOCUMENTED - EVENTUALLY WILL BE DEFAULT
           tracking_sigma 1   # multiplier applied to sensor sigma
                              #( 5 gives 99.99% correlation if ellipsoid boundaries intersected
                              #( 3 gives 99.73% correlation if ellipsoid boundaries intersected
                              #( 1 gives 68.27% correlation if ellipsoid boundaries intersected
                              #(.5 gives 38.29% correlation if ellipsoid boundaries intersected
           turning_sigma  1   # KEEP THE SAME AS tracking_sigma!!!
        end_correlation_method
```

- **演示要点**：演示 correlation_method 的参数：tracking_sigma, turning_sigma

### correlation_method（commander_track_manager）｜

- **关键词**：correlation_method
- **出处**：`aea_iads/processors/commander_track_manager.txt:10-11`
- **片段**：

```text
   correlation_method perfect
   end_correlation_method
```

- **演示要点**：演示 correlation_method（最小结构，无子参数）

### detection_probability（aesa）｜

- **关键词**：detection_probability, signal_to_noise
- **出处**：`air_to_air/sensors/radar/aesa.txt:65-75`　（同签名共 2 处，另见 `air_to_air/sensors/radar/long_range.txt:60`）
- **片段**：

```text
      detection_probability
         signal_to_noise 6.9  absolute probability 0.00
         signal_to_noise 7.0  absolute probability 0.01
         signal_to_noise 8.0  absolute probability 0.05
         signal_to_noise 9.0  absolute probability 0.10
         signal_to_noise 10.0 absolute probability 0.50
         signal_to_noise 11.0 absolute probability 0.80
         signal_to_noise 12.0 absolute probability 0.90
         signal_to_noise 13.0 absolute probability 0.95
         signal_to_noise 14.0 absolute probability 0.99
      end_detection_probability
```

- **演示要点**：演示 detection_probability 的参数：signal_to_noise

### detection_sensitivities（esm）｜

- **关键词**：detection_sensitivities, frequency
- **出处**：`air_to_air/sensors/esm_rwr/esm.txt:53-56`
- **片段**：

```text
      detection_sensitivities
         frequency 8.0 ghz   -70.0 dbw 
         frequency 12.0 ghz  -70.0 dbw 
      end_detection_sensitivities
```

- **演示要点**：演示 detection_sensitivities 的参数：frequency

### detection_sensitivities（hm-pass-detect）｜

- **关键词**：detection_sensitivities
- **出处**：`sensor_plot/radar/hm-pass-detect.txt:52-59`
- **片段**：

```text
  detection_sensitivities
       signal_type pulsed
          frequency 1.0 Hz  -70 dBm
          frequency 3.0 GHz -80 dBm
       signal_type continuous
          frequency 1.0 Hz  -75 dBm
          frequency 3.0 GHz -85 dBm
  end_detection_sensitivities
```

- **演示要点**：演示 detection_sensitivities（最小结构，无子参数）

### electronic_attack（soj_vhf_jammer）｜

- **关键词**：electronic_attack, technique, effect
- **出处**：`electronic_warfare/test_multi_beam/weapons/jammer/soj_vhf_jammer.txt:33-39`
- **片段**：

```text
    electronic_attack
     technique noise_jamming
        effect noise_effect WSF_JAMMER_POWER_EFFECT
           jamming_delta_gain 0 dB
        end_effect
      end_technique
     end_electronic_attack
```

- **演示要点**：演示 electronic_attack 的参数：technique, effect

### electronic_attack（simple_auto_jamming）｜

- **关键词**：electronic_attack, technique, debug
- **出处**：`electronic_warfare/simple_auto_jamming.txt:79-89`
- **片段**：

```text
      electronic_attack
      debug
         technique noise_jamming
         debug
            mitigation_class_name NOISE_JAMMING
            default_on
            effect power_effect WSF_JAMMER_POWER_EFFECT
            debug
            end_effect
         end_technique
      end_electronic_attack
```

- **演示要点**：演示 electronic_attack 的参数：technique, debug

### electronic_attack（agile_jamming）｜

- **关键词**：electronic_attack, technique
- **出处**：`electronic_warfare/agile_jamming.txt:83-86`　（同签名共 32 处，另见 `electronic_warfare/false-target_jamming_1.txt:60`、`electronic_warfare/false-target_jamming_2.txt:64`、`electronic_warfare/false-target_jamming_3.txt:69`）
- **片段**：

```text
      electronic_attack JAMMER_EA
         technique noise_jamming
         end_technique
      end_electronic_attack
```

- **演示要点**：演示 electronic_attack 的参数：technique

### electronic_attack · WSF_ELECTRONIC_ATTACK｜

- **关键词**：electronic_attack, WSF_ELECTRONIC_ATTACK, technique
- **出处**：`electronic_warfare/test_false_targets/weapons/jammer/soj_xband_jammer.txt:62-118`
- **片段**：

```text
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
```

- **演示要点**：演示 WSF_ELECTRONIC_ATTACK 的参数：technique

### electronic_attack（soj_base_jammer）｜

- **关键词**：electronic_attack
- **出处**：`aea_iads/weapons/jammer/soj_base_jammer.txt:96-97`　（同签名共 3 处，另见 `electronic_warfare/cover_pulse_jamming.txt:61`、`electronic_warfare/jtos_power.txt:60`）
- **片段**：

```text
      electronic_attack SOJ_EA
      end_electronic_attack
```

- **演示要点**：演示 electronic_attack（最小结构，无子参数）

### electronic_protect（slc_slb_script_jamming）｜

- **关键词**：electronic_protect, debug, technique, externally_controlled, mitigated_technique_classes, effect
- **出处**：`electronic_warfare/slc_slb_script_jamming.txt:128-176`
- **片段**：

```text
      electronic_protect
         debug
         technique sidelobe_blanking
         externally_controlled
         mitigated_technique_classes
            FALSE_TARGET_JAMMING
         end_mitigated_technique_classes

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
         end_technique

         technique sidelobe_cancelation
            externally_controlled
            mitigated_technique_classes
               NOISE_JAMMING
            end_mitigated_technique_classes

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
         end_technique
      end_electronic_protect
```

- **演示要点**：演示 electronic_protect 的参数：debug, technique, externally_controlled, mitigated_technique_classes, effect

### electronic_protect（acq_radar）｜

- **关键词**：electronic_protect, technique
- **出处**：`electronic_warfare/test_false_targets/sensors/radar/acq_radar.txt:63-72`　（同签名共 17 处，另见 `electronic_warfare/air-to-air-rt1.txt:269`、`electronic_warfare/air-to-air-rt2.txt:269`、`electronic_warfare/track_error.txt:207`）
- **片段**：

```text
      electronic_protect
         technique pulse_suppression
            mitigated_techniques
               random_pulse_jamming
            end_mitigated_techniques
            effect ps_effect WSF_PULSE_SUPPRESS_EFFECT
               reject pulses 0.05
            end_effect
         end_technique
      end_electronic_protect
```

- **演示要点**：演示 electronic_protect 的参数：technique

### electronic_protect（agile_jamming）｜

- **关键词**：electronic_protect
- **出处**：`electronic_warfare/agile_jamming.txt:272-273`　（同签名共 11 处，另见 `electronic_warfare/cover_pulse_jamming.txt:149`、`electronic_warfare/false-target_jamming_1.txt:167`、`electronic_warfare/false-target_jamming_2.txt:162`）
- **片段**：

```text
            electronic_protect EW_RADAR_EP
            end_electronic_protect
```

- **演示要点**：演示 electronic_protect（最小结构，无子参数）

### electronic_warfare · WSF_ELECTRONIC_ATTACK｜

- **关键词**：electronic_warfare, WSF_ELECTRONIC_ATTACK, technique
- **出处**：`electronic_warfare/comm_jamming.txt:216-223`　（同签名共 19 处，另见 `satellite_demos/scenarios/gps_denied.txt:234`、`electronic_warfare/agile_jamming.txt:67`、`electronic_warfare/spot_jamming.txt:54`）
- **片段**：

```text
electronic_warfare JAM_EA WSF_ELECTRONIC_ATTACK
   technique noise_jamming WSF_EA_TECHNIQUE
      mitigation_class noise_jamming
      effect noise_effect WSF_POWER_EFFECT
         jamming_delta_gain 0 dB
      end_effect
   end_technique
end_electronic_warfare
```

- **演示要点**：演示 WSF_ELECTRONIC_ATTACK 的参数：technique

### electronic_warfare · WSF_ELECTRONIC_PROTECT｜

- **关键词**：electronic_warfare, WSF_ELECTRONIC_PROTECT, technique
- **出处**：`aea_iads/sensors/radar/acq_radar.txt:24-33`　（同签名共 14 处，另见 `electronic_warfare/comm_jamming.txt:63`、`electronic_warfare/agile_jamming.txt:211`、`electronic_warfare/spot_jamming.txt:100`）
- **片段**：

```text
electronic_warfare ACQ_RADAR_EP WSF_ELECTRONIC_PROTECT
   technique pulse_suppression WSF_EP_TECHNIQUE
      mitigated_techniques
         random_pulse_jamming
      end_mitigated_techniques
      effect ps_effect WSF_PULSE_SUPPRESS_EFFECT
         reject pulses 0.05
      end_effect
   end_technique
end_electronic_warfare
```

- **演示要点**：演示 WSF_ELECTRONIC_PROTECT 的参数：technique

### electronic_warfare · WSF_ELECTRONIC_PROTECT｜

- **关键词**：electronic_warfare, WSF_ELECTRONIC_PROTECT
- **出处**：`electronic_warfare/track_effect_1.txt:84-95`
- **片段**：

```text
electronic_warfare EW_RADAR_EP WSF_ELECTRONIC_PROTECT
      technique mitigate_drop_track_technique WSF_EP_TECHNIQUE
      #debug
      mitigated_technique_classes
         drop_track_technique
      end_mitigated_technique_classes
      effect track_mitigate_effect WSF_TRACK_EFFECT
         #debug
           track_behavior maintain
      end_effect
   end_technique
end_electronic_warfare
```

- **演示要点**：演示 WSF_ELECTRONIC_PROTECT（最小结构，无子参数）

### false_target · WSF_FALSE_TARGET｜

- **关键词**：false_target, WSF_FALSE_TARGET, quantity, multi_radar_behavior, false_target_behavior, scan_time, distribution_centroid, position, altitude, heading, speed, distribution, bearing_reference, radius
- **出处**：`electronic_warfare/test_false_targets/weapons/jammer/false_target.txt:10-42`
- **片段**：

```text
false_target FALSE_TARGET_1 WSF_FALSE_TARGET
  quantity               250

  multi_radar_behavior consistent_to_multiple_radars
  #multi_radar_behavior random_to_multiple_radars

  false_target_behavior  consistent_scan_to_scan
  #false_target_behavior  random_scan_to_scan

  scan_time 10 sec

  distribution_centroid
    position 39:22:36n 117:33:25w
    altitude 30000.0 ft agl
    heading 0 deg
    speed 0 kts
  end_distribution_centroid

  distribution
    bearing_reference       jammer
    radius      200 km
    sector_arc  360 deg
  end_distribution

  false_target_movement
     speeds     0 kts 0 kts
     headings -90 deg -90 deg
     #reference jammer
  end_false_target_movement

  range_constrained  false
  persistence        1.0
end_false_target
```

- **演示要点**：演示 WSF_FALSE_TARGET 的参数：quantity, multi_radar_behavior, false_target_behavior, scan_time, distribution_centroid, position, altitude, heading, speed, distribution

### false_target · WSF_FALSE_TARGET｜

- **关键词**：false_target, WSF_FALSE_TARGET, quantity, multi_radar_behavior, false_target_behavior, scan_time, reference_centroid, altitude, position, distribution, radius, sector_arc, bearing_reference, false_target_movement
- **出处**：`electronic_warfare/false-target_command_center.txt:48-77`
- **片段**：

```text
false_target FALSE_TARGET WSF_FALSE_TARGET
  quantity                200

  multi_radar_behavior consistent_to_multiple_radars
  #multi_radar_behavior random_to_multiple_radars

  false_target_behavior  consistent_scan_to_scan
  #false_target_behavior  random_scan_to_scan

  scan_time 60 sec

  reference_centroid
    altitude 35000 ft
    position 36:25:24n 115:43:48w
  end_reference_centroid

  distribution
    radius      150000 m
    sector_arc  360 deg
    bearing_reference jammer
  end_distribution

  false_target_movement
     speeds 450 kts 450 kts
     headings 0 deg 0 deg
  end_false_target_movement

  range_constrained    true
  persistence          1.0
end_false_target
```

- **演示要点**：演示 WSF_FALSE_TARGET 的参数：quantity, multi_radar_behavior, false_target_behavior, scan_time, reference_centroid, altitude, position, distribution, radius, sector_arc

### false_target · WSF_FALSE_TARGET｜

- **关键词**：false_target, WSF_FALSE_TARGET, multi_radar_behavior, false_target_behavior, scan_time, distribution, range_distribution, bearing_reference, radius, sector_arc, false_target_movement, persistence
- **出处**：`aea_iads/weapons/jammer/false_target.txt:9-42`
- **片段**：

```text
false_target FALSE_TARGET_1 WSF_FALSE_TARGET
   #debug

  #quantity               1000

  #multi_radar_behavior consistent_to_multiple_radars
  multi_radar_behavior random_to_multiple_radars

  false_target_behavior  consistent_scan_to_scan
  #false_target_behavior  random_scan_to_scan


  scan_time 60 sec

  #distribution_centroid
  #  altitude 35000 ft
  #  latitude 38:04:06n
  #  longitude 117:14:00w
  #end_distribution_centroid

  distribution
    range_distribution exponential
    bearing_reference  jammer
    radius      500 km
    sector_arc  360 deg
  end_distribution

  false_target_movement
     speeds     20 kts 600 kts
     headings -180 deg  180 deg
  end_false_target_movement

  persistence          1.0
end_false_target
```

- **演示要点**：演示 WSF_FALSE_TARGET 的参数：multi_radar_behavior, false_target_behavior, scan_time, distribution, range_distribution, bearing_reference, radius, sector_arc, false_target_movement, persistence

### false_target · WSF_FALSE_TARGET｜

- **关键词**：false_target, WSF_FALSE_TARGET, range_constrained, false_target_behavior, persistence, debug
- **出处**：`electronic_warfare/false-target_jamming_4.txt:40-46`
- **片段**：

```text
false_target FALSE_TARGET WSF_FALSE_TARGET
  #debug
  range_constrained     true
  false_target_behavior consistent_scan_to_scan
  persistence 0.5
  debug
end_false_target
```

- **演示要点**：演示 WSF_FALSE_TARGET 的参数：range_constrained, false_target_behavior, persistence, debug

### false_target · WSF_FALSE_TARGET｜

- **关键词**：false_target, WSF_FALSE_TARGET, false_target_movement, range_constrained
- **出处**：`electronic_warfare/false-target_jamming_3.txt:40-48`
- **片段**：

```text
false_target FALSE_TARGET WSF_FALSE_TARGET
  #debug
  false_target_movement
     speeds   100 kts 450 kts
     headings -180 deg 180 deg
  end_false_target_movement

  range_constrained    true
end_false_target
```

- **演示要点**：演示 WSF_FALSE_TARGET 的参数：false_target_movement, range_constrained

### false_target · WSF_FALSE_TARGET｜

- **关键词**：false_target, WSF_FALSE_TARGET, range_constrained
- **出处**：`electronic_warfare/false-target_jamming_2.txt:40-43`
- **片段**：

```text
false_target FALSE_TARGET WSF_FALSE_TARGET
  #debug
  range_constrained    true
end_false_target
```

- **演示要点**：演示 WSF_FALSE_TARGET 的参数：range_constrained

### false_target_movement（false_target）｜

- **关键词**：false_target_movement, speeds, headings
- **出处**：`aea_iads/weapons/jammer/false_target.txt:36-39`　（同签名共 4 处，另见 `electronic_warfare/false-target_command_center.txt:70`、`electronic_warfare/false-target_jamming_3.txt:42`、`electronic_warfare/test_false_targets/weapons/jammer/false_target.txt:34`）
- **片段**：

```text
  false_target_movement
     speeds     20 kts 600 kts
     headings -180 deg  180 deg
  end_false_target_movement
```

- **演示要点**：演示 false_target_movement 的参数：speeds, headings

### false_target_screener · WSF_FT_SCREENER｜

- **关键词**：false_target_screener, WSF_FT_SCREENER, track_capacity, plot_capacity, transfer_capacity, allow_track_reporting_when_flooded, force_target_tracks
- **出处**：`aea_iads/sensors/radar/ew_radar.txt:98-107`　（同签名共 6 处，另见 `electronic_warfare/false-target_jamming_1.txt:149`、`electronic_warfare/false-target_jamming_2.txt:144`、`electronic_warfare/false-target_jamming_3.txt:149`）
- **片段**：

```text
   false_target_screener SCREENER WSF_FT_SCREENER
      track_capacity     500
      plot_capacity      100
      transfer_capacity  100
      allow_track_reporting_when_flooded false
      force_target_tracks
         range_force  inside_blip_range
         #sector_force 45 deg 3
      end_force_target_tracks
   end_false_target_screener
```

- **演示要点**：演示 WSF_FT_SCREENER 的参数：track_capacity, plot_capacity, transfer_capacity, allow_track_reporting_when_flooded, force_target_tracks

### false_target_screener · WSF_FT_SCREENER｜

- **关键词**：false_target_screener, WSF_FT_SCREENER, track_capacity, plot_capacity, transfer_capacity, request_based_tracking
- **出处**：`electronic_warfare/closely_space_targets_ttr.txt:57-64`　（同签名共 2 处，另见 `electronic_warfare/test_false_targets/sensors/radar/ttr_radar.txt:41`）
- **片段**：

```text
      false_target_screener SCREENER WSF_FT_SCREENER
         #debug
         track_capacity     1000
         plot_capacity      1000
         transfer_capacity  1000
         request_based_tracking true
         #only_screen_false_target_track_requests true
      end_false_target_screener
```

- **演示要点**：演示 WSF_FT_SCREENER 的参数：track_capacity, plot_capacity, transfer_capacity, request_based_tracking

### false_target_screener · WSF_FT_SCREENER｜

- **关键词**：false_target_screener, WSF_FT_SCREENER, track_capacity, plot_capacity, transfer_capacity
- **出处**：`electronic_warfare/agile_auto-repeater_jamming.txt:142-146`　（同签名共 14 处，另见 `electronic_warfare/agile_repeater_jamming-rt1.txt:254`、`electronic_warfare/agile_repeater_jamming-rt2.txt:254`、`electronic_warfare/agile_repeater_jamming.txt:265`）
- **片段**：

```text
      false_target_screener SCREENER WSF_FT_SCREENER
         track_capacity              100
         plot_capacity                50
         transfer_capacity            50
      end_false_target_screener
```

- **演示要点**：演示 WSF_FT_SCREENER 的参数：track_capacity, plot_capacity, transfer_capacity

### false_target_screener · WSF_FT_SCREENER｜

- **关键词**：false_target_screener, WSF_FT_SCREENER, track_capacity, force_target_tracks
- **出处**：`electronic_warfare/simple_ft_jamming.txt:98-104`
- **片段**：

```text
   false_target_screener SCREENER_1 WSF_FT_SCREENER
      track_capacity 1000
      force_target_tracks
         range_force both
         range_sector_force 10 km 20 deg 5
      end_force_target_tracks
   end_false_target_screener
```

- **演示要点**：演示 WSF_FT_SCREENER 的参数：track_capacity, force_target_tracks

### field_of_view（red_ciws_radar_1）｜

- **关键词**：field_of_view, azimuth_field_of_view, elevation_field_of_view
- **出处**：`ciws/sensors/radar/red_ciws_radar_1.txt:72-75`　（同签名共 3 处，另见 `coverage_demos/sensors/ground_sensor_geo.txt:17`、`coverage_demos/sensors/sat_sensor_geo.txt:21`）
- **片段**：

```text
  field_of_view rectangular
     azimuth_field_of_view -180.0 deg 180.0 deg # stated
     elevation_field_of_view -25.0 deg 85.0 deg  # stated
  end_field_of_view
```

- **演示要点**：演示 field_of_view 的参数：azimuth_field_of_view, elevation_field_of_view

### field_of_view（sat_geosensor）｜

- **关键词**：field_of_view, half_angle
- **出处**：`coverage_demos/sensors/sat_geosensor.txt:18-20`　（同签名共 4 处，另见 `coverage_demos/sensors/sat_sensor_narrow.txt:18`、`coverage_demos/sensors/uav_sensor.txt:19`、`space_operations/attitude_control.txt:99`）
- **片段**：

```text
   field_of_view circular
      half_angle 45 deg
   end_field_of_view
```

- **演示要点**：演示 field_of_view 的参数：half_angle

### fluence_model（hel_test）｜

- **关键词**：fluence_model, aperture_diameter, power, laser_type, jitter, beam_quality
- **出处**：`hel/hel_test.txt:256-278`　（同签名共 2 处，另见 `hel/intersect_mesh_test_beam_director.txt:208`）
- **片段**：

```text
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
```

- **演示要点**：演示 fluence_model 的参数：aperture_diameter, power, laser_type, jitter, beam_quality

### fluence_model（ground_hel_vs_hypersonic）｜

- **关键词**：fluence_model, aperture_diameter, power, wavelength, jitter, beam_quality
- **出处**：`hel/ground_hel_vs_hypersonic.txt:55-78`　（同签名共 3 处，另见 `hel/hel_test.txt:174`、`hel/intersect_mesh_test.txt:208`）
- **片段**：

```text
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
```

- **演示要点**：演示 fluence_model 的参数：aperture_diameter, power, wavelength, jitter, beam_quality

### force_target_tracks（simple_ft_jamming）｜

- **关键词**：force_target_tracks, range_force, range_sector_force
- **出处**：`electronic_warfare/simple_ft_jamming.txt:100-103`
- **片段**：

```text
      force_target_tracks
         range_force both
         range_sector_force 10 km 20 deg 5
      end_force_target_tracks
```

- **演示要点**：演示 force_target_tracks 的参数：range_force, range_sector_force

### force_target_tracks（ew_radar）｜

- **关键词**：force_target_tracks, range_force
- **出处**：`aea_iads/sensors/radar/ew_radar.txt:103-106`　（同签名共 6 处，另见 `electronic_warfare/false-target_jamming_1.txt:155`、`electronic_warfare/false-target_jamming_2.txt:150`、`electronic_warfare/false-target_jamming_3.txt:155`）
- **片段**：

```text
      force_target_tracks
         range_force  inside_blip_range
         #sector_force 45 deg 3
      end_force_target_tracks
```

- **演示要点**：演示 force_target_tracks 的参数：range_force

### frequency_list（agile_jamming）｜

- **关键词**：frequency_list, frequency_id
- **出处**：`electronic_warfare/agile_jamming.txt:259-263`　（同签名共 2 处，另见 `electronic_warfare/agile_jamming.txt:299`）
- **片段**：

```text
            frequency_list
               frequency_id            1 200 mhz
               frequency_id            2 210 mhz
               frequency_id            3 220 mhz
            end_frequency_list
```

- **演示要点**：演示 frequency_list 的参数：frequency_id

### jam_strobe_detector（jam_strobe_tracking）｜

- **关键词**：jam_strobe_detector, reports_bearing, reports_elevation, gaussian_azimuth_error_sigma, gaussian_elevation_error_sigma, jamming_perception_threshold, track_quality
- **出处**：`electronic_warfare/jam_strobe_tracking.txt:142-152`
- **片段**：

```text
   jam_strobe_detector
      reports_bearing
      reports_elevation

      gaussian_azimuth_error_sigma 1.0 deg
      gaussian_elevation_error_sigma 0.1 fraction_of_beamwidth

      jamming_perception_threshold 3 db

      track_quality 0.9
   end_jam_strobe_detector
```

- **演示要点**：演示 jam_strobe_detector 的参数：reports_bearing, reports_elevation, gaussian_azimuth_error_sigma, gaussian_elevation_error_sigma, jamming_perception_threshold, track_quality

### jam_strobe_detector（jam_strobe_direction_finder）｜

- **关键词**：jam_strobe_detector, reports_bearing, gaussian_azimuth_error_sigma, jamming_perception_threshold
- **出处**：`electronic_warfare/jam_strobe_direction_finder.txt:68-74`
- **片段**：

```text
   jam_strobe_detector
      reports_bearing
      #reports_elevation

      gaussian_azimuth_error_sigma 2.0 deg
      jamming_perception_threshold 3 db
   end_jam_strobe_detector
```

- **演示要点**：演示 jam_strobe_detector 的参数：reports_bearing, gaussian_azimuth_error_sigma, jamming_perception_threshold

### jammer_gain_table（soj_base_jammer）｜

- **关键词**：jammer_gain_table, jammer_to_noise_ratio
- **出处**：`aea_iads/weapons/jammer/soj_base_jammer.txt:48-61`　（同签名共 4 处，另见 `alv_routing/weapons/alv_jammer.txt:37`、`electronic_warfare/rpj_jamming.txt:51`、`electronic_warfare/test_false_targets/weapons/jammer/soj_xband_jammer.txt:91`）
- **片段**：

```text
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
```

- **演示要点**：演示 jammer_gain_table 的参数：jammer_to_noise_ratio

### jamming_to_signal_gain_table（cover_pulse_jamming）｜

- **关键词**：jamming_to_signal_gain_table, jamming_to_signal
- **出处**：`electronic_warfare/cover_pulse_jamming.txt:44-48`　（同签名共 3 处，另见 `electronic_warfare/jtos_power.txt:44`、`aea_iads/weapons/jammer/soj_base_jammer.txt:80`）
- **片段**：

```text
         jamming_to_signal_gain_table
           jamming_to_signal 0 db 0 db
           jamming_to_signal 1 db 1 db
           jamming_to_signal 2 db 2 db
         end_jamming_to_signal_gain_table
```

- **演示要点**：演示 jamming_to_signal_gain_table 的参数：jamming_to_signal

### laser_designations（ldt_target_only）｜

- **关键词**：laser_designations, debug_laser_designations, stale_out_interval, update_interval, debug_print_modulus
- **出处**：`hellfire/laser_designation_via_dis/ldt_target_only.txt:27-32`
- **片段**：

```text
laser_designations
   debug_laser_designations
   stale_out_interval 4 sec
   update_interval    5 sec
   debug_print_modulus 333
end_laser_designations
```

- **演示要点**：演示 laser_designations 的参数：debug_laser_designations, stale_out_interval, update_interval, debug_print_modulus

### laser_designations（rf_autonomous_test）｜

- **关键词**：laser_designations, stale_out_interval, update_interval
- **出处**：`hellfire/active_radar_hellfire/rf_autonomous_test.txt:26-29`　（同签名共 5 处，另见 `hellfire/laser_designation_via_dis/ldt_designator_only.txt:26`、`hellfire/laser_designation_via_dis/ldt_shooter_only.txt:26`、`hellfire/laser_designation_via_dis/ldt_three_platforms_combined.txt:25`）
- **片段**：

```text
laser_designations
   stale_out_interval 4 sec
   update_interval    5 sec
end_laser_designations
```

- **演示要点**：演示 laser_designations 的参数：stale_out_interval, update_interval

### mitigated_technique_classes（ew_radar）｜

- **关键词**：mitigated_technique_classes, false_target_jamming, pulse_jamming
- **出处**：`aea_iads/sensors/radar/ew_radar.txt:56-59`　（同签名共 6 处，另见 `electronic_warfare/false-target_jamming_1.txt:90`、`electronic_warfare/false-target_jamming_2.txt:94`、`electronic_warfare/false-target_jamming_3.txt:99`）
- **片段**：

```text
      mitigated_technique_classes
         false_target_jamming
         pulse_jamming
      end_mitigated_technique_classes
```

- **演示要点**：演示 mitigated_technique_classes 的参数：false_target_jamming, pulse_jamming

### mitigated_technique_classes（ew_radar）｜

- **关键词**：mitigated_technique_classes, noise_jamming, pulse_jamming
- **出处**：`aea_iads/sensors/radar/ew_radar.txt:74-77`
- **片段**：

```text
      mitigated_technique_classes
         noise_jamming
         pulse_jamming
      end_mitigated_technique_classes
```

- **演示要点**：演示 mitigated_technique_classes 的参数：noise_jamming, pulse_jamming

### mitigated_technique_classes（ew_radar）｜

- **关键词**：mitigated_technique_classes, noise_jamming
- **出处**：`aea_iads/sensors/radar/ew_radar.txt:37-39`　（同签名共 3 处，另见 `electronic_warfare/agile_jamming.txt:213`、`electronic_warfare/spot_jamming.txt:103`）
- **片段**：

```text
      mitigated_technique_classes
         noise_jamming
      end_mitigated_technique_classes
```

- **演示要点**：演示 mitigated_technique_classes 的参数：noise_jamming

### mitigated_technique_classes（false-target_jamming_1）｜

- **关键词**：mitigated_technique_classes, false_target_jamming
- **出处**：`electronic_warfare/false-target_jamming_1.txt:117-119`　（同签名共 2 处，另见 `electronic_warfare/ft_track_plot.txt:352`）
- **片段**：

```text
      mitigated_technique_classes
         false_target_jamming
      end_mitigated_technique_classes
```

- **演示要点**：演示 mitigated_technique_classes 的参数：false_target_jamming

### mitigated_technique_classes（rpj_jamming）｜

- **关键词**：mitigated_technique_classes, pulse_jamming
- **出处**：`electronic_warfare/rpj_jamming.txt:107-109`
- **片段**：

```text
      mitigated_technique_classes
         pulse_jamming
      end_mitigated_technique_classes
```

- **演示要点**：演示 mitigated_technique_classes 的参数：pulse_jamming

### mitigated_technique_classes（track_effect_1）｜

- **关键词**：mitigated_technique_classes, drop_track_technique
- **出处**：`electronic_warfare/track_effect_1.txt:87-89`
- **片段**：

```text
      mitigated_technique_classes
         drop_track_technique
      end_mitigated_technique_classes
```

- **演示要点**：演示 mitigated_technique_classes 的参数：drop_track_technique

### mitigated_technique_classes（agile_auto-repeater_jamming）｜

- **关键词**：mitigated_technique_classes
- **出处**：`electronic_warfare/agile_auto-repeater_jamming.txt:189-191`　（同签名共 16 处，另见 `electronic_warfare/agile_repeater_jamming-rt1.txt:303`、`electronic_warfare/agile_repeater_jamming-rt2.txt:303`、`electronic_warfare/agile_repeater_jamming.txt:314`）
- **片段**：

```text
                  mitigated_technique_classes
                     FALSE_TARGET_JAMMING
                  end_mitigated_technique_classes
```

- **演示要点**：演示 mitigated_technique_classes（最小结构，无子参数）

### mitigated_techniques（simple_ft_jamming）｜

- **关键词**：mitigated_techniques, false_targets, simple_false_targets
- **出处**：`electronic_warfare/simple_ft_jamming.txt:144-147`
- **片段**：

```text
            mitigated_techniques
               false_targets
               simple_false_targets
            end_mitigated_techniques
```

- **演示要点**：演示 mitigated_techniques 的参数：false_targets, simple_false_targets

### mitigated_techniques（acq_radar）｜

- **关键词**：mitigated_techniques, random_pulse_jamming
- **出处**：`aea_iads/sensors/radar/acq_radar.txt:26-28`　（同签名共 3 处，另见 `electronic_warfare/test_false_targets/sensors/radar/acq_radar.txt:65`、`electronic_warfare/test_false_targets/sensors/radar/ew_radar.txt:88`）
- **片段**：

```text
      mitigated_techniques
         random_pulse_jamming
      end_mitigated_techniques
```

- **演示要点**：演示 mitigated_techniques 的参数：random_pulse_jamming

### mitigated_techniques（comm_jamming）｜

- **关键词**：mitigated_techniques, noise_jamming
- **出处**：`electronic_warfare/comm_jamming.txt:65-67`　（同签名共 4 处，另见 `electronic_warfare/jam_strobe_tracking.txt:120`、`electronic_warfare/test_false_targets/sensors/radar/ew_radar.txt:72`、`electronic_warfare/test_multi_beam/sensors/radar/ew_radar.txt:66`）
- **片段**：

```text
      mitigated_techniques
         noise_jamming
      end_mitigated_techniques
```

- **演示要点**：演示 mitigated_techniques 的参数：noise_jamming

### mitigated_techniques（cover_pulse_jamming）｜

- **关键词**：mitigated_techniques, false_targets
- **出处**：`electronic_warfare/cover_pulse_jamming.txt:91-93`　（同签名共 3 处，另见 `electronic_warfare/false-target_command_center.txt:168`、`electronic_warfare/jtos_power.txt:90`）
- **片段**：

```text
      mitigated_techniques
         false_targets
      end_mitigated_techniques
```

- **演示要点**：演示 mitigated_techniques 的参数：false_targets

### mitigated_techniques（pol_mod_jamming）｜

- **关键词**：mitigated_techniques, pol_mod_jamming
- **出处**：`electronic_warfare/pol_mod_jamming.txt:132-134`
- **片段**：

```text
            mitigated_techniques
               pol_mod_jamming
            end_mitigated_techniques
```

- **演示要点**：演示 mitigated_techniques 的参数：pol_mod_jamming

### mitigated_techniques（repeater_jamming）｜

- **关键词**：mitigated_techniques, false_target_jamming
- **出处**：`electronic_warfare/repeater_jamming.txt:192-194`
- **片段**：

```text
           mitigated_techniques
              false_target_jamming
           end_mitigated_techniques
```

- **演示要点**：演示 mitigated_techniques 的参数：false_target_jamming

### mitigated_techniques（track_drop_maintain_effect）｜

- **关键词**：mitigated_techniques, drop_track_technique
- **出处**：`electronic_warfare/track_drop_maintain_effect.txt:96-98`
- **片段**：

```text
      mitigated_techniques
         drop_track_technique
      end_mitigated_techniques
```

- **演示要点**：演示 mitigated_techniques 的参数：drop_track_technique

### mitigated_techniques（track_error）｜

- **关键词**：mitigated_techniques, track_error_inducement
- **出处**：`electronic_warfare/track_error.txt:210-212`
- **片段**：

```text
            mitigated_techniques
               track_error_inducement
            end_mitigated_techniques
```

- **演示要点**：演示 mitigated_techniques 的参数：track_error_inducement

### mode（aesa）｜工作模式

- **关键词**：mode, frame_time, maximum_request_count, cue_mode, azimuth_cue_limits, elevation_cue_limits, scan_mode, azimuth_scan_limits, elevation_scan_limits, integration_gain, post_lockon_detection_threshold_adjustment, 工作模式
- **出处**：`air_to_air/sensors/radar/aesa.txt:115-127`
- **片段**：

```text
   mode TWS
      frame_time              2 sec # 
      maximum_request_count   20 #
      cue_mode                azimuth_and_elevation
      azimuth_cue_limits     -57.0 deg 57.0 deg
      elevation_cue_limits   -27.0 deg 27.0 deg
   
      scan_mode               azimuth_and_elevation
      azimuth_scan_limits    -3.0 deg 3.0 deg # 
      elevation_scan_limits  -3.0 deg 3.0 deg # 
      integration_gain         4.0 db      
      post_lockon_detection_threshold_adjustment -1 db       
   end_mode
```

- **演示要点**：演示 mode 的参数：frame_time, maximum_request_count, cue_mode, azimuth_cue_limits, elevation_cue_limits, scan_mode, azimuth_scan_limits, elevation_scan_limits, integration_gain, post_lockon_detection_threshold_adjustment

### mode（ttr_radar）｜工作模式

- **关键词**：mode, frame_time, maximum_request_count, cue_mode, scan_mode, azimuth_scan_limits, elevation_scan_limits, hits_to_establish_track, hits_to_maintain_track, track_quality, on_success, 工作模式
- **出处**：`aea_iads/sensors/radar/ttr_radar.txt:76-92`
- **片段**：

```text
   mode SEARCH
      frame_time                     4.0 sec

      maximum_request_count          1

      cue_mode                       azimuth
      scan_mode                      azimuth_and_elevation
      azimuth_scan_limits            -10 deg 10 deg
      elevation_scan_limits            0 deg 40 deg

      hits_to_establish_track        3 5
      hits_to_maintain_track         1 3

      track_quality                  0.6

      on_success TRACK
   end_mode
```

- **演示要点**：演示 mode 的参数：frame_time, maximum_request_count, cue_mode, scan_mode, azimuth_scan_limits, elevation_scan_limits, hits_to_establish_track, hits_to_maintain_track, track_quality, on_success

### mode（ttr_radar）｜工作模式

- **关键词**：mode, frame_time, maximum_request_count, scan_mode, azimuth_scan_limits, elevation_scan_limits, receiver, clutter_model, hits_to_establish_track, hits_to_maintain_track, track_quality, 工作模式
- **出处**：`aea_iads/sensors/radar/ttr_radar.txt:109-130`
- **片段**：

```text
   mode TRACK
      frame_time                     1.0 sec

      maximum_request_count          6

      scan_mode                      azimuth_and_elevation
      azimuth_scan_limits            -1 deg 1 deg
      elevation_scan_limits          -1 deg 1 deg

      receiver
         bandwidth                   250.0 hz
         noise_power                 -175 dBw  // will be calibrated for 1 m^2
         internal_loss               7 dB
      end_receiver

      clutter_model TTR_RADAR_TRACK_CLUTTER

      hits_to_establish_track        3 5
      hits_to_maintain_track         1 3

      track_quality                  1.0   // 'weapons' grade
   end_mode
```

- **演示要点**：演示 mode 的参数：frame_time, maximum_request_count, scan_mode, azimuth_scan_limits, elevation_scan_limits, receiver, clutter_model, hits_to_establish_track, hits_to_maintain_track, track_quality

### mode（closely_space_targets_ttr）｜工作模式

- **关键词**：mode, scan_mode, azimuth_scan_limits, elevation_scan_limits, maximum_request_count, frame_time, hits_to_establish_track, hits_to_maintain_track, track_quality, search_while_track, close_target_detection, 工作模式
- **出处**：`electronic_warfare/closely_space_targets_ttr.txt:107-141`
- **片段**：

```text
   mode TRACK
      scan_mode                      azimuth_and_elevation
      azimuth_scan_limits            -.1 deg .1 deg
      elevation_scan_limits          -.1 deg .1 deg

      maximum_request_count          6

      frame_time                     1.0 sec

      hits_to_establish_track        3 5
      hits_to_maintain_track         1 3

      track_quality                  1.0   // 'weapons' grade

      #transmitter
      #   frequency                   9800 mhz
      #end_transmitter

	   search_while_track

      close_target_detection
         #debug
         acquire_deltas
            azimuth_delta       0.2 deg
            elevation_delta     0.2 deg
            range_delta         5 m
         end_acquire_deltas

         reacquire_deltas
            azimuth_delta       0.25 deg
            elevation_delta     0.25 deg
            range_delta         1000 m
         end_reacquire_deltas
      end_close_target_detection
   end_mode
```

- **演示要点**：演示 mode 的参数：scan_mode, azimuth_scan_limits, elevation_scan_limits, maximum_request_count, frame_time, hits_to_establish_track, hits_to_maintain_track, track_quality, search_while_track, close_target_detection

### mode（long_range）｜工作模式

- **关键词**：mode, maximum_request_count, frame_time, cue_mode, azimuth_cue_limits, elevation_cue_limits, scan_mode, azimuth_scan_limits, elevation_scan_limits, post_lockon_detection_threshold_adjustment, 工作模式
- **出处**：`air_to_air/sensors/radar/long_range.txt:92-102`　（同签名共 2 处，另见 `air_to_air/sensors/radar/aesa.txt:98`）
- **片段**：

```text
   mode SEARCH
      maximum_request_count   0
      frame_time              10 sec #  
      cue_mode                azimuth_and_elevation
      azimuth_cue_limits     -179.0 deg 179.0 deg
      elevation_cue_limits   -60.0 deg 60.0 deg   
      scan_mode               azimuth_and_elevation
      azimuth_scan_limits    -60.0 deg 60.0 deg # 
      elevation_scan_limits  -5.0 deg 5.0 deg # 
      post_lockon_detection_threshold_adjustment -1 db
   end_mode
```

- **演示要点**：演示 mode 的参数：maximum_request_count, frame_time, cue_mode, azimuth_cue_limits, elevation_cue_limits, scan_mode, azimuth_scan_limits, elevation_scan_limits, post_lockon_detection_threshold_adjustment

### mode（long_range）｜工作模式

- **关键词**：mode, frame_time, maximum_request_count, cue_mode, azimuth_cue_limits, elevation_cue_limits, dwell_time, azimuth_scan_limits, elevation_scan_limits, integration_gain, 工作模式
- **出处**：`air_to_air/sensors/radar/long_range.txt:104-114`
- **片段**：

```text
   mode TWS
      frame_time              0.1 sec # 
      maximum_request_count   20 #
      cue_mode                azimuth_and_elevation
      azimuth_cue_limits     -179.0 deg 179.0 deg
      elevation_cue_limits   -60.0 deg 60.0 deg
      dwell_time 0.04 seconds
      azimuth_scan_limits     -3.0 deg  3.0 deg
      elevation_scan_limits   -3.0 deg  3.0 deg
      integration_gain         4.0 db             
   end_mode
```

- **演示要点**：演示 mode 的参数：frame_time, maximum_request_count, cue_mode, azimuth_cue_limits, elevation_cue_limits, dwell_time, azimuth_scan_limits, elevation_scan_limits, integration_gain

### mode（intersect_mesh_test_beam_director）｜工作模式

- **关键词**：mode, scan_mode, frame_time, azimuth_scan_limits, elevation_scan_limits, track_quality, hits_to_establish_track, hits_to_maintain_track, type, on_success, 工作模式
- **出处**：`hel/intersect_mesh_test_beam_director.txt:331-345`
- **片段**：

```text
        mode SCAN
          // Search to acquire tracks
          scan_mode                 azimuth_and_elevation
          frame_time                0.1 s
          azimuth_scan_limits       -4.0 degrees 4.0 degrees
          elevation_scan_limits     -4.0 degrees 4.0 degrees

          // If maximum_request_count > 0 then this mode only responds
          //   to explicit requests as initiated by WsfTaskManager::StartTracking.
          track_quality             0.8  // Near 'weapon quality'
          hits_to_establish_track   1 1  // 1 of last 1 scans to establish track
          hits_to_maintain_track    1 5  // 1 of last 5 scans to maintain  track
          type                      scanning
          on_success                LOCK1
        end_mode
```

- **演示要点**：演示 mode 的参数：scan_mode, frame_time, azimuth_scan_limits, elevation_scan_limits, track_quality, hits_to_establish_track, hits_to_maintain_track, type, on_success

### mode（ttr_radar）｜工作模式

- **关键词**：mode, maximum_request_count, scan_mode, azimuth_scan_limits, elevation_scan_limits, frame_time, hits_to_establish_track, hits_to_maintain_track, track_quality, on_success, 工作模式
- **出处**：`alternate_locations/sensors/radar/ttr_radar.txt:57-72`　（同签名共 2 处，另见 `iads_c2_demos/sensors/ttr_radar.txt:65`）
- **片段**：

```text
   mode ACQUIRE
      maximum_request_count          1

      scan_mode                      azimuth_and_elevation
      azimuth_scan_limits            -5 deg 5 deg
      elevation_scan_limits          -5 deg 5 deg

      frame_time                     2.0 sec

      hits_to_establish_track        3 5
      hits_to_maintain_track         1 3

      track_quality                  0.9   # near 'weapons' grade

      on_success TRACK
   end_mode
```

- **演示要点**：演示 mode 的参数：maximum_request_count, scan_mode, azimuth_scan_limits, elevation_scan_limits, frame_time, hits_to_establish_track, hits_to_maintain_track, track_quality, on_success

### mode（chaff_example_ttr）｜工作模式

- **关键词**：mode, scan_mode, azimuth_scan_limits, elevation_scan_limits, maximum_request_count, frame_time, hits_to_establish_track, hits_to_maintain_track, track_quality, close_target_detection, 工作模式
- **出处**：`chaff/chaff_example_ttr.txt:192-222`　（同签名共 2 处，另见 `electronic_warfare/close_targets_ttr.txt:122`）
- **片段**：

```text
   mode TRACK
      scan_mode                      azimuth_and_elevation
      azimuth_scan_limits            -.1 deg .1 deg
      elevation_scan_limits          -.1 deg .1 deg

      maximum_request_count          6

      frame_time                     1 sec

      hits_to_establish_track        3 5
      hits_to_maintain_track         1 3

      track_quality                  1.0   // 'weapons' grade

      #search_while_track

      close_target_detection
         #debug
         acquire_deltas
            azimuth_delta       0.2 deg
            elevation_delta     0.2 deg
            range_delta         25 m
         end_acquire_deltas

         reacquire_deltas
            azimuth_delta       0.25 deg
            elevation_delta     0.25 deg
            range_delta         1000 m
         end_reacquire_deltas
      end_close_target_detection
   end_mode
```

- **演示要点**：演示 mode 的参数：scan_mode, azimuth_scan_limits, elevation_scan_limits, maximum_request_count, frame_time, hits_to_establish_track, hits_to_maintain_track, track_quality, close_target_detection

### mode（intersect_mesh_test_beam_director）｜工作模式

- **关键词**：mode, scan_mode, frame_time, track_quality, hits_to_establish_track, hits_to_maintain_track, type, on_success, on_failure, 工作模式
- **出处**：`hel/intersect_mesh_test_beam_director.txt:359-368`　（同签名共 2 处，另见 `hel/intersect_mesh_test_beam_director.txt:347`）
- **片段**：

```text
        mode LOCK2
          scan_mode                 fixed
          frame_time                0.1 s
          track_quality             1.0  // 'weapon quality'
          hits_to_establish_track   1 1  // 1 of last 1 scans to establish track
          hits_to_maintain_track    1 5  // Allow .5 seconds of coasting (5th failure will drop)
          type                      locked
          on_success                CUED
          on_failure                LOCK1
        end_mode
```

- **演示要点**：演示 mode 的参数：scan_mode, frame_time, track_quality, hits_to_establish_track, hits_to_maintain_track, type, on_success, on_failure

### mode（ttr_radar）｜工作模式

- **关键词**：mode, maximum_request_count, scan_mode, azimuth_scan_limits, elevation_scan_limits, frame_time, hits_to_establish_track, hits_to_maintain_track, track_quality, 工作模式
- **出处**：`alternate_locations/sensors/radar/ttr_radar.txt:74-86`　（同签名共 23 处，另见 `cyber/exfiltrate_demo/sensors/radar/ttr_radar.txt:76`、`cyber/sensors/radar/sr_sam_ttr_radar_sensor.txt:73`、`iads/sensors/radar/ttr_radar.txt:76`）
- **片段**：

```text
   mode TRACK
      maximum_request_count          6

      scan_mode                      azimuth_and_elevation
      azimuth_scan_limits            -1 deg 1 deg
      elevation_scan_limits          -1 deg 1 deg
      frame_time                     1.0 sec

      hits_to_establish_track        3 5
      hits_to_maintain_track         1 3

      track_quality                  1.0   # 'weapons' grade
   end_mode
```

- **演示要点**：演示 mode 的参数：maximum_request_count, scan_mode, azimuth_scan_limits, elevation_scan_limits, frame_time, hits_to_establish_track, hits_to_maintain_track, track_quality

### mode（lrsam_ttr）｜工作模式

- **关键词**：mode, cue_mode, scan_mode, azimuth_scan_limits, elevation_scan_limits, frame_time, hits_to_establish_track, hits_to_maintain_track, track_quality, 工作模式
- **出处**：`engage/radars/lrsam_ttr.txt:58-70`
- **片段**：

```text
   mode SEARCH
      cue_mode azimuth
      scan_mode                       azimuth_and_elevation
      azimuth_scan_limits            -10 deg 10 deg
      elevation_scan_limits            0 deg 40 deg

      frame_time                       2.0 sec

      hits_to_establish_track          3 5
      hits_to_maintain_track           1 3

      track_quality                    0.7   # 'weapons' grade
   end_mode
```

- **演示要点**：演示 mode 的参数：cue_mode, scan_mode, azimuth_scan_limits, elevation_scan_limits, frame_time, hits_to_establish_track, hits_to_maintain_track, track_quality

### mode（generic_fire_control_radar）｜工作模式

- **关键词**：mode, scan_mode, azimuth_scan_limits, elevation_scan_limits, maximum_request_count, track_quality, hits_to_establish_track, hits_to_maintain_track, on_success, 工作模式
- **出处**：`base_types/sensors/radar/generic_fire_control_radar.txt:230-243`
- **片段**：

```text
  mode ACQUIRE
    # Search to acquire tracks
    scan_mode                 azimuth_and_elevation
    azimuth_scan_limits       -4.0 degrees 4.0 degrees
    elevation_scan_limits     -4.0 degrees 4.0 degrees

    # If maximum_request_count > 0 then this mode only responds
    #   to explicit requests as initiated by WsfTaskManager::StartTracking.
    maximum_request_count     1
    track_quality             0.8  # Near 'weapon quality'
    hits_to_establish_track   3 5  # 3 of last 5 scans to establish track
    hits_to_maintain_track    1 5  # 1 of last 5 scans to maintain  track
    on_success                TRACK
  end_mode
```

- **演示要点**：演示 mode 的参数：scan_mode, azimuth_scan_limits, elevation_scan_limits, maximum_request_count, track_quality, hits_to_establish_track, hits_to_maintain_track, on_success

### mode（helo_mover）｜工作模式

- **关键词**：mode, weathercock_speed, maximum_attitude_rate, minimum_upward_acceleration, body_rates_gain, maximum_ground_speed, maximum_rate_of_climb, maximum_rate_of_descent, maximum_total_acceleration, 工作模式
- **出处**：`hellfire/active_radar_hellfire/helo_mover.txt:36-52`　（同签名共 12 处，另见 `hellfire/active_radar_hellfire/helo_mover.txt:54`、`hellfire/active_radar_hellfire/helo_mover.txt:72`、`hellfire/laser_designation_via_dis/helo_mover.txt:41`）
- **片段**：

```text
   mode LOITER

      weathercock_speed              12 kts

      maximum_attitude_rate         3.0 rpm # <fabricated>
      minimum_upward_acceleration   0.1 g  # <fabricated>

      body_rates_gain                10 # Rotate heading toward the target at
                                        # a rate proportional to the error,
                                        # clamped to maximum_attitude_rate

      maximum_ground_speed         135 kts    # Economy Cruise
      maximum_rate_of_climb       2250 ft/min # Max ROC
      maximum_rate_of_descent     2550 ft/min # <fabricated>
      maximum_total_acceleration   3.0 g      # <fabricated>

   end_mode
```

- **演示要点**：演示 mode 的参数：weathercock_speed, maximum_attitude_rate, minimum_upward_acceleration, body_rates_gain, maximum_ground_speed, maximum_rate_of_climb, maximum_rate_of_descent, maximum_total_acceleration

### mode（generic_bomber_radar）｜工作模式

- **关键词**：mode, search_while_track, maximum_request_count, revisit_time, track_quality, hits_to_establish_track, hits_to_maintain_track, establish_track_probability, maintain_track_probability, 工作模式
- **出处**：`base_types/sensors/radar/generic_bomber_radar.txt:129-153`
- **片段**：

```text
  mode TRACK
    # Allow the sensor to continue search processing while also performing tracking.
    search_while_track
    maximum_request_count     3
    revisit_time              4 sec
    track_quality             1.0

    # Actual START-LOCKON-DELAY is 5 sec, but it must be adjusted to a
    #   multiple of the revisit time. Requiring one hit will result in a
    #   4 second delay.
    # The same thing goes for MAX-COAST-TIME. Allowing 2 misses will
    #   give an 8 second delay.
    # SUPPRESSOR does essentially the same thing, but it may round up
    #   (so maybe it should be 1 of 4???)

    hits_to_establish_track    1 3
    hits_to_maintain_track     1 3

    establish_track_probability 0.600       # INITIAL-LOCK-PROB
    maintain_track_probability  0.925       # CONTINUE-TRACK-PROB

    //START-LOCKON-DELAY      5.0 sec
    //MAX-COAST-TIME          10.0 sec
    //POST-LOCKON-S/N-DELAY   4.0 sec
  end_mode
```

- **演示要点**：演示 mode 的参数：search_while_track, maximum_request_count, revisit_time, track_quality, hits_to_establish_track, hits_to_maintain_track, establish_track_probability, maintain_track_probability

### mode（generic_esm）｜工作模式

- **关键词**：mode, frame_time, azimuth_field_of_view, elevation_field_of_view, frequency_band, ranging_time, detection_threshold, receiver, noise_power, 工作模式
- **出处**：`base_types/sensors/esm_rwr/generic_esm.txt:92-120`　（同签名共 3 处，另见 `base_types/sensors/esm_rwr/generic_esm_sensor.txt:92`、`outer_air_battle/sensors/esm_rwr/generic_esm_sensor.txt:92`）
- **片段**：

```text
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
```

- **演示要点**：演示 mode 的参数：frame_time, azimuth_field_of_view, elevation_field_of_view, frequency_band, ranging_time, detection_threshold, receiver, noise_power

### mode（intersect_mesh_test_beam_director）｜工作模式

- **关键词**：mode, scan_mode, frame_time, track_quality, hits_to_establish_track, hits_to_maintain_track, on_failure, type, 工作模式
- **出处**：`hel/intersect_mesh_test_beam_director.txt:370-378`
- **片段**：

```text
        mode CUED
          scan_mode                 fixed
          frame_time                0.01 s
          track_quality             1.0  // 'weapon quality'
          hits_to_establish_track   1 1  // 1 of last 1 scans to establish track
          hits_to_maintain_track    1 5  // Allow .05 seconds of coasting (5th failure will drop)
          on_failure                LOCK2
          type                      cued
        end_mode
```

- **演示要点**：演示 mode 的参数：scan_mode, frame_time, track_quality, hits_to_establish_track, hits_to_maintain_track, on_failure, type

### mode（esm）｜工作模式

- **关键词**：mode, frame_time, cue_mode, azimuth_cue_limits, elevation_cue_limits, scan_mode, azimuth_scan_limits, elevation_scan_limits, 工作模式
- **出处**：`air_to_air/sensors/esm_rwr/esm.txt:77-86`
- **片段**：

```text
   mode SEARCH 
      frame_time              2 sec #  
      cue_mode                azimuth_and_elevation
      azimuth_cue_limits     -180.0 deg 180.0 deg
      elevation_cue_limits   -90.0 deg 90.0 deg
   
      scan_mode               azimuth_and_elevation
      azimuth_scan_limits    -180.0 deg 180.0 deg # 
      elevation_scan_limits  -90.0 deg 90.0 deg # 
   end_mode
```

- **演示要点**：演示 mode 的参数：frame_time, cue_mode, azimuth_cue_limits, elevation_cue_limits, scan_mode, azimuth_scan_limits, elevation_scan_limits

### mode（generic_bomber_radar）｜工作模式

- **关键词**：mode, scan_mode, frame_time, hits_to_establish_track, track_quality, hits_to_maintain_track, 工作模式
- **出处**：`base_types/sensors/radar/generic_bomber_radar.txt:120-127`
- **片段**：

```text
  mode ACQUIRE
    # This mode searchs to acquire tracks.
    scan_mode                 azimuth_and_elevation
    frame_time                8 sec
    hits_to_establish_track   4 4
    track_quality             0.7
    hits_to_maintain_track    1 8
  end_mode
```

- **演示要点**：演示 mode 的参数：scan_mode, frame_time, hits_to_establish_track, track_quality, hits_to_maintain_track

### mode（blue_a2a_radar）｜工作模式

- **关键词**：mode, azimuth_field_of_view, elevation_field_of_view, range_product, transmitter, power, 工作模式
- **出处**：`base_types/sensors/radar/blue_a2a_radar.txt:156-164`　（同签名共 3 处，另见 `draw/sensors/radar/generic_fighter_radar.txt:62`、`outer_air_battle/sensors/radar/blue_a2a_radar.txt:162`）
- **片段**：

```text
  mode 120X10
    azimuth_field_of_view     -60.0 deg  60.0 deg
    elevation_field_of_view   -5.0 deg   5.0 deg
    range_product             194.4 dBsm            # ~39.1 nm
    // one_m2_detect_range    39.1 nm
    transmitter
      power                   2.3 MW
    end_transmitter
  end_mode
```

- **演示要点**：演示 mode 的参数：azimuth_field_of_view, elevation_field_of_view, range_product, transmitter, power

### mode（ttr_radar）｜工作模式

- **关键词**：mode, maximum_request_count, frame_time, hits_to_establish_track, hits_to_maintain_track, track_quality, 工作模式
- **出处**：`electronic_warfare/test_false_targets/sensors/radar/ttr_radar.txt:91-105`
- **片段**：

```text
   mode TRACK
      maximum_request_count          6

      frame_time                     1.0 sec

      hits_to_establish_track        3 5
      hits_to_maintain_track         1 3

      track_quality                  1.0   // 'weapons' grade

      #transmitter
      #   frequency                   9800 mhz
      #end_transmitter

   end_mode
```

- **演示要点**：演示 mode 的参数：maximum_request_count, frame_time, hits_to_establish_track, hits_to_maintain_track, track_quality

### mode（hellfire_type）｜工作模式

- **关键词**：mode, maximum_range, azimuth_field_of_view, elevation_field_of_view, frame_time, 工作模式
- **出处**：`hellfire/laser_designation_via_dis/hellfire_type.txt:54-60`
- **片段**：

```text
   mode TRACK
      # While tracking, null seeker to target Line-Of-Sight, with 4-deg half-cone FOV (approximately)
      maximum_range            10 km
      azimuth_field_of_view    -40 deg +40 deg
      elevation_field_of_view  -40 deg +40 deg
      frame_time               0.01 sec  # Nearly instantaneous updates are needed for accurate guidance.
   end_mode
```

- **演示要点**：演示 mode 的参数：maximum_range, azimuth_field_of_view, elevation_field_of_view, frame_time

### mode（generic_fire_control_radar）｜工作模式

- **关键词**：mode, maximum_request_count, track_quality, hits_to_establish_track, hits_to_maintain_track, 工作模式
- **出处**：`base_types/sensors/radar/generic_fire_control_radar.txt:245-254`
- **片段**：

```text
  mode TRACK
    # Allow the sensor to continue search processing while also performing tracking.
    # This mode does not 'scan'. The target must be in the beam.
    # If maximum_request_count > 0 then this mode only responds
    #   to explicit requests as initiated by WsfTaskManager::StartTracking.
    maximum_request_count     6
    track_quality             1.0  # 'weapon quality'
    hits_to_establish_track   3 5  # 3 of last 5 scans to establish track
    hits_to_maintain_track    1 5  # Allow 5 seconds of coasting (5th failure will drop)
  end_mode
```

- **演示要点**：演示 mode 的参数：maximum_request_count, track_quality, hits_to_establish_track, hits_to_maintain_track

### mode（red_a2a_radar）｜工作模式

- **关键词**：mode, azimuth_field_of_view, elevation_field_of_view, one_m2_detect_range, 工作模式
- **出处**：`base_types/sensors/radar/red_a2a_radar.txt:137-141`
- **片段**：

```text
   mode 60X10
      azimuth_field_of_view    -30.0 deg   30.0 deg
      elevation_field_of_view   -5.0 deg    5.0 deg
      one_m2_detect_range 40 nm
   end_mode
```

- **演示要点**：演示 mode 的参数：azimuth_field_of_view, elevation_field_of_view, one_m2_detect_range

### mode（blue_a2a_radar）｜工作模式

- **关键词**：mode, azimuth_field_of_view, elevation_field_of_view, range_product, 工作模式
- **出处**：`base_types/sensors/radar/blue_a2a_radar.txt:166-171`　（同签名共 4 处，另见 `draw/draw_demo.txt:25`、`draw/sensors/radar/generic_fighter_radar.txt:72`、`outer_air_battle/sensors/radar/blue_a2a_radar.txt:172`）
- **片段**：

```text
  mode 40X20
    azimuth_field_of_view   -20.0 deg  20.0 deg
    elevation_field_of_view -10.0 deg  10.0 deg
    range_product           198.7 dBsm              # ~50.1 nm
    //one_m2_detect_range     50.1 nm
  end_mode
```

- **演示要点**：演示 mode 的参数：azimuth_field_of_view, elevation_field_of_view, range_product

### mode（hellfire_type）｜工作模式

- **关键词**：mode, azimuth_field_of_view, elevation_field_of_view, frame_time, 工作模式
- **出处**：`hellfire/semiactive_laser_hellfire/hellfire_type.txt:54-59`
- **片段**：

```text
   mode TRACK
      # While tracking, null seeker to target Line-Of-Sight, with 4-deg half-cone FOV (approximately)
      azimuth_field_of_view    -40 deg +40 deg
      elevation_field_of_view  -40 deg +40 deg
      frame_time               0.01 sec  # Nearly instantaneous updates are needed for accurate guidance.
   end_mode
```

- **演示要点**：演示 mode 的参数：azimuth_field_of_view, elevation_field_of_view, frame_time

### mode（blue_a2a_radar）｜工作模式

- **关键词**：mode, azimuth_field_of_view, elevation_field_of_view, 工作模式
- **出处**：`base_types/sensors/radar/blue_a2a_radar.txt:173-176`　（同签名共 9 处，另见 `base_types/sensors/radar/blue_a2a_radar.txt:178`、`base_types/sensors/radar/red_a2a_radar.txt:142`、`base_types/sensors/radar/red_a2a_radar.txt:146`）
- **片段**：

```text
  mode 20X15_BALL
    azimuth_field_of_view   -10.0 deg  10.0 deg
    elevation_field_of_view -7.5 deg   7.5 deg
  end_mode
```

- **演示要点**：演示 mode 的参数：azimuth_field_of_view, elevation_field_of_view

### mode（generic_sar）｜工作模式

- **关键词**：mode, operating_mode, resolution, 工作模式
- **出处**：`base_types/sensors/radar/generic_sar.txt:84-87`　（同签名共 4 处，另见 `base_types/sensors/radar/generic_sar.txt:89`、`base_types/sensors/radar/generic_sar.txt:94`、`base_types/sensors/radar/generic_sar.txt:99`）
- **片段**：

```text
   mode SPOT_HI_RES
      operating_mode                   spot
      resolution                       1 m
   end_mode
```

- **演示要点**：演示 mode 的参数：operating_mode, resolution

### mode（medium_range_radar_missile）｜工作模式

- **关键词**：mode, frame_time, 工作模式
- **出处**：`air_to_air/weapons/aam/medium_range_radar_missile.txt:90-92`　（同签名共 11 处，另见 `air_to_air/weapons/aam/short_range_ir_missile.txt:89`、`base_types/weapons/aam/medium_range_radar_missile.txt:83`、`behavior_tree/weapons/aam/medium_range_radar_missile.txt:81`）
- **片段**：

```text
   mode SEARCH
      frame_time                  0.1 sec
   end_mode
```

- **演示要点**：演示 mode 的参数：frame_time

### mode（bomber_sar）｜工作模式

- **关键词**：mode, operating_mode, 工作模式
- **出处**：`sensor_plot/sar/bomber_sar.txt:99-101`　（同签名共 6 处，另见 `sensor_plot/sar/bomber_sar.txt:103`、`sensor_plot/sar/example_sar.txt:64`、`sensor_plot/sar/example_sar.txt:68`）
- **片段**：

```text
   mode SPOT
      operating_mode                   spot
   end_mode
```

- **演示要点**：演示 mode 的参数：operating_mode

### mode（px_fighter）｜工作模式

- **关键词**：mode, dwell_time, 工作模式
- **出处**：`sensor_plot/sar/px_fighter.txt:34-36`　（同签名共 2 处，另见 `sensor_plot/sar/px_fighter.txt:37`）
- **片段**：

```text
      mode SPOT
         dwell_time 10 sec
      end_mode
```

- **演示要点**：演示 mode 的参数：dwell_time

### mode（agile_jamming）｜工作模式

- **关键词**：mode, beam, 工作模式
- **出处**：`electronic_warfare/agile_jamming.txt:296-306`　（同签名共 8 处，另见 `electronic_warfare/agile_auto-repeater_jamming.txt:234`、`electronic_warfare/agile_repeater_jamming-rt1.txt:349`、`electronic_warfare/agile_repeater_jamming-rt2.txt:349`）
- **片段**：

```text
   mode two
      beam 1
         transmitter
            frequency_list
               frequency_id           1 230 mhz
               frequency_id           2 240 mhz
               frequency_id           3 250 mhz
            end_frequency_list
         end_transmitter
      end_beam
   end_mode
```

- **演示要点**：演示 mode 的参数：beam

### mode（agile_auto-repeater_jamming）｜工作模式

- **关键词**：mode, 工作模式
- **出处**：`electronic_warfare/agile_auto-repeater_jamming.txt:231-232`　（同签名共 8 处，另见 `electronic_warfare/agile_jamming.txt:293`、`electronic_warfare/agile_repeater_jamming-rt1.txt:346`、`electronic_warfare/agile_repeater_jamming-rt2.txt:346`）
- **片段**：

```text
   mode one
   end_mode
```

- **演示要点**：演示 mode（最小结构，无子参数）

### mode_template（aesa）｜

- **关键词**：mode_template, antenna_tilt, azimuth_field_of_view, elevation_field_of_view, minimum_altitude, maximum_altitude, maximum_range, electronic_beam_steering, electronic_beam_steering_limit, electronic_beam_steering_loss_exponent, azimuth_error_sigma, elevation_error_sigma, range_error_sigma
- **出处**：`air_to_air/sensors/radar/aesa.txt:26-96`
- **片段**：

```text
   mode_template
      antenna_tilt  0.0 deg     
      
      azimuth_field_of_view     -60.0 deg 60.0 deg
      elevation_field_of_view   -30.0 deg 30.0 deg
      
      minimum_altitude    -50000.0 ft
      maximum_altitude     100000.0 ft
      maximum_range        400.0 km   
      
      electronic_beam_steering                azimuth_and_elevation
      electronic_beam_steering_limit          60.0 deg
      electronic_beam_steering_loss_exponent  1.2      # Brawler default
      
      azimuth_error_sigma            0.3 deg  // beamwidth / 10            
      elevation_error_sigma          0.3 deg  // beamwidth / 10              
      range_error_sigma              100 ft   
#     fixed_range_rate_error_sigma   5 ft/s 
      range_rate_error_sigma         5 ft/s             

      transmitter
         antenna_pattern  AESA_ANTENNA
         power                       13 kw       #
         frequency                   9.5 ghz     
         polarization                vertical
         duty_cycle                  0.25       
         pulse_width                 2.0 usec   
         pulse_repetition_frequency  90 khz      
         internal_loss               2.0 db      #
         attenuation_model itu end_attenuation_model
      end_transmitter
      
      receiver
         antenna_pattern          AESA_ANTENNA
         noise_figure             5.5    db      
         instantaneous_bandwidth  30.00  hz      
         internal_loss            2.5    db      
      end_receiver
      
      detection_probability
         signal_to_noise 6.9  absolute probability 0.00
         signal_to_noise 7.0  absolute probability 0.01
         signal_to_noise 8.0  absolute probability 0.05
         signal_to_noise 9.0  absolute probability 0.10
         signal_to_noise 10.0 absolute probability 0.50
         signal_to_noise 11.0 absolute probability 0.80
         signal_to_noise 12.0 absolute probability 0.90
         signal_to_noise 13.0 absolute probability 0.95
         signal_to_noise 14.0 absolute probability 0.99
      end_detection_probability
      
      prf_factor -10 db                     
      compute_measurement_errors  true
      doppler_resolution          5.0 m/s
      hits_to_establish_track     2 2         
      hits_to_maintain_track      1 3         

      signal_processor simple_doppler
         maximum_doppler_speed       3000.0 m/s  
      end_signal_processor 
      
      reports_location
      reports_range
      reports_range_rate
      reports_elevation
      reports_bearing
      reports_velocity
      reports_side
      reports_iff
      reports_signal_to_noise
   end_mode_template
```

- **演示要点**：演示 mode_template 的参数：antenna_tilt, azimuth_field_of_view, elevation_field_of_view, minimum_altitude, maximum_altitude, maximum_range, electronic_beam_steering, electronic_beam_steering_limit, electronic_beam_steering_loss_exponent, azimuth_error_sigma

### mode_template（esm）｜

- **关键词**：mode_template, antenna_tilt, minimum_altitude, maximum_altitude, frame_time, maximum_range, scan_mode, azimuth_scan_limits, elevation_scan_limits, azimuth_field_of_view, elevation_field_of_view, receiver, frequency_band
- **出处**：`air_to_air/sensors/esm_rwr/esm.txt:31-75`
- **片段**：

```text
   mode_template
      antenna_tilt       0.0 deg
      minimum_altitude  -50000.0 ft
      maximum_altitude   50000.0 ft
      frame_time         10.0 sec   
      maximum_range      200.0 nm
   
#     electronic_beam_steering                azimuth_and_elevation
#     electronic_beam_steering_limit          60.0 deg
#     electronic_beam_steering_loss_exponent  1.2       # Brawler default
   
      scan_mode                 azimuth_and_elevation
      azimuth_scan_limits      -180.0 deg 180.0 deg   
      elevation_scan_limits    -90.0 deg 90.0 deg    
      azimuth_field_of_view    -180.0 deg 180.0 deg
      elevation_field_of_view  -90.0 deg 90.0 deg
   
      receiver
         antenna_pattern   esm_reciever
      end_receiver
   
      frequency_band 8.0 ghz 12.0 ghz # x-band
      detection_sensitivities
         frequency 8.0 ghz   -70.0 dbw 
         frequency 12.0 ghz  -70.0 dbw 
      end_detection_sensitivities
   
      range_error_sigma         20   percent_of_true_range
      range_rate_error_sigma    500  ft/s
      azimuth_error_sigma       0.3  deg
      elevation_error_sigma     0.3  deg
   
      hits_to_establish_track   2 2  # 
      hits_to_maintain_track    1 3  # 
   
      reports_range
      reports_range_rate
      reports_velocity
      reports_location
      reports_bearing
      reports_elevation
      reports_frequency
      reports_type
      reports_side
   end_mode_template
```

- **演示要点**：演示 mode_template 的参数：antenna_tilt, minimum_altitude, maximum_altitude, frame_time, maximum_range, scan_mode, azimuth_scan_limits, elevation_scan_limits, azimuth_field_of_view, elevation_field_of_view

### mode_template（long_range）｜

- **关键词**：mode_template, antenna_tilt, azimuth_field_of_view, elevation_field_of_view, minimum_altitude, maximum_altitude, maximum_range, azimuth_error_sigma, elevation_error_sigma, range_error_sigma, transmitter, receiver, detection_probability
- **出处**：`air_to_air/sensors/radar/long_range.txt:23-90`
- **片段**：

```text
   mode_template
      antenna_tilt  0.0 deg     
      
      azimuth_field_of_view     -179.0 deg 179.0 deg
      elevation_field_of_view   -60.0 deg 60.0 deg
      
      minimum_altitude    -50000.0 ft
      maximum_altitude     100000.0 ft
      maximum_range        300.0 nmi   
      
#     electronic_beam_steering                azimuth_and_elevation
#     electronic_beam_steering_limit          60.0 deg
#     electronic_beam_steering_loss_exponent  1.2      # Brawler default
      
      azimuth_error_sigma            0.3 deg  // beamwidth / 10            
      elevation_error_sigma          0.3 deg  // beamwidth / 10              
      range_error_sigma             100.0 ft                  

      transmitter
         antenna_pattern  AESA_ANTENNA
         power                       30 kw       #
         frequency                   9.5 ghz     
         polarization                vertical
         duty_cycle                  0.25       
         pulse_width                 2.0 usec   
         pulse_repetition_frequency  90 khz      
         internal_loss               2.0 db      #
         attenuation_model itu end_attenuation_model
      end_transmitter
      
      receiver
         antenna_pattern          AESA_ANTENNA
         noise_figure             5.5    db      
         instantaneous_bandwidth  30.00  hz      
         internal_loss            2.5    db      
      end_receiver
      
      detection_probability
         signal_to_noise 6.9  absolute probability 0.00
         signal_to_noise 7.0  absolute probability 0.01
         signal_to_noise 8.0  absolute probability 0.05
         signal_to_noise 9.0  absolute probability 0.10
         signal_to_noise 10.0 absolute probability 0.50
         signal_to_noise 11.0 absolute probability 0.80
         signal_to_noise 12.0 absolute probability 0.90
         signal_to_noise 13.0 absolute probability 0.95
         signal_to_noise 14.0 absolute probability 0.99
      end_detection_probability
      
      prf_factor -10 db                     
      compute_measurement_errors  true
      doppler_resolution          5.0 m/s
      hits_to_establish_track     1 1         
      hits_to_maintain_track      1 3         

      signal_processor simple_doppler
         maximum_doppler_speed       3000.0 m/s  
      end_signal_processor 
      
      reports_location
      reports_range
      reports_range_rate
      reports_elevation
      reports_bearing
      reports_velocity
      reports_side
      reports_signal_to_noise
   end_mode_template
```

- **演示要点**：演示 mode_template 的参数：antenna_tilt, azimuth_field_of_view, elevation_field_of_view, minimum_altitude, maximum_altitude, maximum_range, azimuth_error_sigma, elevation_error_sigma, range_error_sigma, transmitter

### mode_template（generic_fire_control_radar）｜

- **关键词**：mode_template, frame_time, revisit_time, dwell_time, transmitter, antenna_pattern, power, frequency, pulse_repetition_frequency, receiver, bandwidth, swerling_case, number_of_pulses_integrated
- **出处**：`base_types/sensors/radar/generic_fire_control_radar.txt:178-228`
- **片段**：

```text
  mode_template
    # Given that 18 total objects can be tracked,
    #   we'll assume that the dwell time is 1/18 of the revist time.
    #   The value of the revist time is not known so we'll simply assume 1 second.
    #   This will give 'reasonable' track update rates.

    frame_time                    1 sec
    revisit_time                  1 sec
    dwell_time                    0.0555555 sec       # 1/18 sec

    #-- Beam Commands
    transmitter
      antenna_pattern             GENERIC_FIRE_CONTROL_RADAR_ANTENNA_PATTERN
      power                       250 kw
      frequency                   3 ghz
      pulse_repetition_frequency  250 hz
      //internal_loss               10 db
    end_transmitter

    receiver
      antenna_pattern             GENERIC_FIRE_CONTROL_RADAR_ANTENNA_PATTERN
      bandwidth                   1 mhz
      //internal_loss               19 dB
    end_receiver

    swerling_case                 1
    number_of_pulses_integrated   44        # integrated by Marcum-Swerling detector
    detector_law                  square
    probability_of_false_alarm    1.0e-6

    # Field of view is used to cull targets, usually set larger than scan limits
    #    -5  deg detects ships more than 457.19 ft (139.35 m) away
    #   -10 deg detects ships more than 226.85 ft (69.14 m) away
    azimuth_field_of_view         -60.0 deg 60.0 deg
    elevation_field_of_view       -5.0 deg 65.0 deg   # detects surface ships
    //elevation_field_of_view       5.0 deg 65.0 deg    # okay for aircraft

    azimuth_error_sigma           0.03 deg
    elevation_error_sigma         0.03 deg
    //TODO range_error_sigma        2 km
    range_error_sigma             100 m

    #-- Track Formation Commands
    reports_bearing
    reports_elevation
    reports_frequency
    reports_location
    reports_velocity
    reports_iff

  end_mode_template
```

- **演示要点**：演示 mode_template 的参数：frame_time, revisit_time, dwell_time, transmitter, antenna_pattern, power, frequency, pulse_repetition_frequency, receiver, bandwidth

### mode_template（generic_bomber_radar）｜

- **关键词**：mode_template, maximum_range, one_m2_detect_range, signal_processor, minimum_doppler_speed, transmitter, antenna_pattern, power, frequency, pulse_repetition_frequency, internal_loss, receiver, bandwidth
- **出处**：`base_types/sensors/radar/generic_bomber_radar.txt:79-115`
- **片段**：

```text
  mode_template

    #-- Antenna Commands
    maximum_range           40 km     # max scope range

    #-- Beam Commands
    one_m2_detect_range     40 km

    signal_processor simple_doppler
      minimum_doppler_speed   11 m/s    # (~25 mph) ground targets
    end_signal_processor

    transmitter
      antenna_pattern       GENERIC_BOMBER_RADAR_ANTENNA_PATTERN
      power                 5 mw
      frequency             3 ghz
      pulse_repetition_frequency 250 hz
      internal_loss         10 db
    end_transmitter

    receiver
      antenna_pattern       GENERIC_BOMBER_RADAR_ANTENNA_PATTERN
      bandwidth             1.6 mhz
      detection_threshold   13 db
      noise_power           -150 dbw
      internal_loss         10 db
    end_receiver

    #-- Track Formation Commands
    reports_bearing
    reports_elevation
    reports_frequency
    reports_iff
    reports_location
    reports_velocity
    reports_type
  end_mode_template
```

- **演示要点**：演示 mode_template 的参数：maximum_range, one_m2_detect_range, signal_processor, minimum_doppler_speed, transmitter, antenna_pattern, power, frequency, pulse_repetition_frequency, internal_loss

### mode_template（hellfire_type）｜

- **关键词**：mode_template, azimuth_field_of_view, elevation_field_of_view, maximum_range, scan_stabilization, azimuth_cue_rate, elevation_cue_rate, azimuth_scan_limits, elevation_scan_limits, scan_mode, transmitter, receiver, reports_location
- **出处**：`hellfire/active_radar_hellfire/hellfire_type.txt:31-62`
- **片段**：

```text
   mode_template
      # Instantaneous FOV of seeker is not known, but probably changes with illumination mode.
      azimuth_field_of_view    -10 deg +10 deg
      elevation_field_of_view  -10 deg +10 deg

      maximum_range            10 km
      scan_stabilization          roll

      azimuth_cue_rate         30 deg/sec
      elevation_cue_rate       30 deg/sec

      azimuth_scan_limits     -30 deg +30 deg
      elevation_scan_limits   -30 deg +30 deg

      scan_mode                   both

      transmitter
         frequency 94 ghz  # Take advantage of moisture absorption notch
         power      1 w    # Unknown
      end_transmitter

      receiver
         frequency 94 ghz  # Take advantage of moisture absorption notch
      end_receiver

      reports_location
      reports_velocity
      reports_range
      reports_bearing
      reports_elevation
      reports_range_rate
   end_mode_template
```

- **演示要点**：演示 mode_template 的参数：azimuth_field_of_view, elevation_field_of_view, maximum_range, scan_stabilization, azimuth_cue_rate, elevation_cue_rate, azimuth_scan_limits, elevation_scan_limits, scan_mode, transmitter

### mode_template（example_sar）｜

- **关键词**：mode_template, maximum_range, azimuth_field_of_view, elevation_field_of_view, electronic_beam_steering, electronic_beam_steering_limit, electronic_beam_steering_loss_exponent, transmitter, receiver, resolution, maximum_dwell_time, minimum_clutter_to_noise_ratio, doppler_filter_broadening_factor
- **出处**：`sensor_plot/sar/example_sar.txt:28-62`　（同签名共 3 处，另见 `sensor_plot/sar/fighter_sar.txt:62`、`sensor_plot/sar/bomber_sar.txt:61`）
- **片段**：

```text
   mode_template

      maximum_range                    100 nm
      azimuth_field_of_view            -1.58 deg 1.58 deg
      elevation_field_of_view          -1.58 deg 1.58 deg

      electronic_beam_steering         azimuth_and_elevation
      electronic_beam_steering_limit   70.0 deg            # Same as slew limits
      electronic_beam_steering_loss_exponent 1.4

      transmitter
         antenna_pattern               EXAMPLE_SAR_ANTENNA
         frequency                     9 ghz
         power                         12690.0 w
         pulse_width                   50 us
         #pulse_repetition_frequency    1000 hz
         internal_loss                 3.25 db
      end_transmitter

      receiver
         # Assume a matched-filter for a pulse width of 50 us
         bandwidth                     20 khz
         noise_figure                  4 db
         internal_loss                 3.25 db
      end_receiver

      resolution                       2 ft
      maximum_dwell_time               30 sec
      minimum_clutter_to_noise_ratio   6 db

      doppler_filter_broadening_factor 1.20                # Ka
      doppler_foldover_margin_factor   1.37                # Kd

      reports_location
   end_mode_template
```

- **演示要点**：演示 mode_template 的参数：maximum_range, azimuth_field_of_view, elevation_field_of_view, electronic_beam_steering, electronic_beam_steering_limit, electronic_beam_steering_loss_exponent, transmitter, receiver, resolution, maximum_dwell_time

### mode_template（medium_range_radar_missile）｜

- **关键词**：mode_template, scan_mode, azimuth_scan_limits, elevation_scan_limits, frame_time, transmitter, receiver, one_m2_detect_range, hits_to_establish_track, hits_to_maintain_track, reports_location, reports_velocity, reports_iff
- **出处**：`air_to_air/weapons/aam/medium_range_radar_missile.txt:67-89`　（同签名共 8 处，另见 `air_to_air/weapons/aam/short_range_ir_missile.txt:66`、`base_types/weapons/aam/medium_range_radar_missile.txt:60`、`behavior_tree/weapons/aam/medium_range_radar_missile.txt:58`）
- **片段**：

```text
   mode_template
      scan_mode                   azimuth_and_elevation
      azimuth_scan_limits         -90 deg 90 deg
      elevation_scan_limits       -90 deg 90 deg      
      frame_time                  1.0 sec
      transmitter
         antenna_pattern          SEEKER_ANTENNA
         power                       1.0 kW
         frequency                  10.0 GHz
         pulse_repetition_interval   3.3 usec    #HPRF 300 kHz
         pulse_width                 1.0 usec    #30% duty factor
      end_transmitter
      receiver
         bandwidth                  1 MHz
      end_receiver
      one_m2_detect_range         50.0 km
      hits_to_establish_track        1 2
      hits_to_maintain_track         1 3
      reports_location
      reports_velocity
      reports_iff
      track_quality                  1.0
   end_mode_template
```

- **演示要点**：演示 mode_template 的参数：scan_mode, azimuth_scan_limits, elevation_scan_limits, frame_time, transmitter, receiver, one_m2_detect_range, hits_to_establish_track, hits_to_maintain_track, reports_location

### mode_template（hellfire_type）｜

- **关键词**：mode_template, azimuth_field_of_view, elevation_field_of_view, maximum_range, scan_stabilization, scan_mode, azimuth_cue_rate, elevation_cue_rate, frame_time, receiver, reports_bearing, reports_elevation, reports_location
- **出处**：`hellfire/laser_designation_via_dis/hellfire_type.txt:32-52`　（同签名共 2 处，另见 `hellfire/semiactive_laser_hellfire/hellfire_type.txt:32`）
- **片段**：

```text
   mode_template
      # Total field of view involved while box-scanning for laser spots.
      # Total angle traversed during the box scan is 2 X (32 + 4) = 72 deg.
      azimuth_field_of_view    -35 deg +35 deg
      elevation_field_of_view   -16 deg  +16 deg

      maximum_range            10 km
      scan_stabilization          roll
      scan_mode                   both
      azimuth_cue_rate         18 deg/sec
      elevation_cue_rate       18 deg/sec
      frame_time                   4 sec  # Time it takes to do a complete box scan.
                                          # 72 deg / (18 deg/sec) = 4 sec scan
      receiver
         wavelength 1.06E-6 microns
      end_receiver

      reports_bearing
      reports_elevation
      reports_location
    end_mode_template
```

- **演示要点**：演示 mode_template 的参数：azimuth_field_of_view, elevation_field_of_view, maximum_range, scan_stabilization, scan_mode, azimuth_cue_rate, elevation_cue_rate, frame_time, receiver, reports_bearing

### mode_template（sr_sam_ttr_radar_sensor）｜

- **关键词**：mode_template, one_m2_detect_range, maximum_range, antenna_height, transmitter, receiver, probability_of_false_alarm, required_pd, swerling_case, reports_range, reports_bearing, reports_elevation, reports_velocity
- **出处**：`cyber/sensors/radar/sr_sam_ttr_radar_sensor.txt:29-56`　（同签名共 5 处，另见 `orwaca_iads/sensors/radar/elr_sam_ttr_radar_sensor.txt:27`、`orwaca_iads/sensors/radar/lr_sam_ttr_radar_sensor.txt:27`、`orwaca_iads/sensors/radar/mr_sam_ttr_radar_sensor.txt:27`）
- **片段**：

```text
   mode_template
      one_m2_detect_range            20.0 nm
      maximum_range                  30.0 nm
      antenna_height                 3.0 m

      transmitter
         antenna_pattern             SR_SAM_TTR_RADAR_ANTENNA
         power                       1000.0 kw
         frequency                   9530 mhz
         internal_loss               2 db
      end_transmitter

      receiver
         antenna_pattern             SR_SAM_TTR_RADAR_ANTENNA
         bandwidth                   500.0 khz
         noise_power                 -160 dBw  # will be calibrated for 1 m^2
         internal_loss               7 dB
      end_receiver

      probability_of_false_alarm     1.0e-6
      required_pd                    0.5
      swerling_case                  1

      reports_range
      reports_bearing
      reports_elevation
      reports_velocity
   end_mode_template
```

- **演示要点**：演示 mode_template 的参数：one_m2_detect_range, maximum_range, antenna_height, transmitter, receiver, probability_of_false_alarm, required_pd, swerling_case, reports_range, reports_bearing

### mode_template（intersect_mesh_test_beam_director）｜

- **关键词**：mode_template, perfect_correlation, maximum_range, angular_resolution, frame_time, revisit_time, dwell_time, azimuth_field_of_view, elevation_field_of_view, reports_bearing, reports_elevation, reports_location, reports_velocity
- **出处**：`hel/intersect_mesh_test_beam_director.txt:298-325`
- **片段**：

```text
        mode_template

          perfect_correlation enabled

          maximum_range            50 nm
          angular_resolution       1.0e-6 rad

          frame_time                    1 sec
          revisit_time                0.1 sec
          dwell_time          0.0555555 sec       // 1/18 sec

          // Field of view is used to cull targets, usually set larger than scan limits
          // fovs based on scan volume
          azimuth_field_of_view   -4.0 deg 4.0 deg
          elevation_field_of_view -4.0 deg 4.0 deg

          // the errors are the same as the beam diveregence (or less)
#             azimuth_error_sigma   0.0 deg
#             elevation_error_sigma 0.0 deg
#             range_error_sigma 0.0 m

          // Track Formation Commands
          reports_bearing
          reports_elevation
          reports_location
          reports_velocity

        end_mode_template
```

- **演示要点**：演示 mode_template 的参数：perfect_correlation, maximum_range, angular_resolution, frame_time, revisit_time, dwell_time, azimuth_field_of_view, elevation_field_of_view, reports_bearing, reports_elevation

### mode_template（lrsam_ttr）｜

- **关键词**：mode_template, maximum_request_count, one_m2_detect_range, antenna_height, transmitter, receiver, probability_of_false_alarm, required_pd, swerling_case, reports_range, reports_bearing, reports_elevation, reports_velocity
- **出处**：`engage/radars/lrsam_ttr.txt:28-56`
- **片段**：

```text
   mode_template
      maximum_request_count            1
      one_m2_detect_range              150.0 nm

      antenna_height                   4.0 m

      transmitter
         antenna_pattern               LRSAM_TTR_ANTENNA
         power                         1000.0 kw
         frequency                     9500 mhz
         internal_loss                 2 db
      end_transmitter

      receiver
         antenna_pattern               LRSAM_TTR_ANTENNA
         bandwidth                     500.0 khz
         noise_power                   -160 dBw  # will be calibrated for 1 m^2
         internal_loss                 7 dB
      end_receiver

      probability_of_false_alarm       1.0e-6
      required_pd                      0.5
      swerling_case                    1

      reports_range
      reports_bearing
      reports_elevation
      reports_velocity
   end_mode_template
```

- **演示要点**：演示 mode_template 的参数：maximum_request_count, one_m2_detect_range, antenna_height, transmitter, receiver, probability_of_false_alarm, required_pd, swerling_case, reports_range, reports_bearing

### mode_template（ttr_radar）｜

- **关键词**：mode_template, one_m2_detect_range, antenna_height, transmitter, receiver, swerling_case, probability_of_false_alarm, detector_law, compute_measurement_errors, reports_range, reports_bearing, reports_elevation, reports_velocity
- **出处**：`aea_iads/sensors/radar/ttr_radar.txt:41-74`
- **片段**：

```text
   mode_template
      one_m2_detect_range            35.0 nm

      antenna_height                 4.0 m

      transmitter
         antenna_pattern             TTR_RADAR_ANTENNA
         power                       100.0 kw
         frequency                   9500 mhz
         internal_loss               2 db
         attenuation                 blake
         pulse_width                 0.8 usec
         pulse_repetition_interval   12.0 usec
         duty_cycle                  0.067   # 10*log10(0.8/12) = -11.76 dB loss
      end_transmitter

      receiver
         antenna_pattern             TTR_RADAR_ANTENNA
         bandwidth                   500.0 khz
         noise_power                 -160 dBw  # will be calibrated for 1 m^2
         internal_loss               7 dB
      end_receiver

      swerling_case                  1
      probability_of_false_alarm     1.0e-6
      detector_law                   linear

      compute_measurement_errors true

      reports_range
      reports_bearing
      reports_elevation
      reports_velocity
   end_mode_template
```

- **演示要点**：演示 mode_template 的参数：one_m2_detect_range, antenna_height, transmitter, receiver, swerling_case, probability_of_false_alarm, detector_law, compute_measurement_errors, reports_range, reports_bearing

### mode_template（generic_sar）｜

- **关键词**：mode_template, azimuth_field_of_view, elevation_field_of_view, maximum_range, electronic_beam_steering, electronic_beam_steering_limit, electronic_beam_steering_loss_exponent, doppler_filter_broadening_factor, doppler_foldover_margin_factor, transmitter, receiver, detection_threshold, reports_location
- **出处**：`base_types/sensors/radar/generic_sar.txt:49-82`
- **片段**：

```text
   mode_template
      azimuth_field_of_view            -1.58 deg 1.58 deg
      elevation_field_of_view          -1.58 deg 1.58 deg
      maximum_range                    200 km

      electronic_beam_steering         azimuth_and_elevation
      electronic_beam_steering_limit   70.0 deg            # same as slew limits
      electronic_beam_steering_loss_exponent 1.4

      doppler_filter_broadening_factor 1.20                # Ka
      doppler_foldover_margin_factor   1.20                # Kd - or azimuth_overcollect_ratio

      transmitter
         antenna_pattern               GENERIC_SAR_ANTENNA
         power                         6 kw
         frequency                     10 ghz
         pulse_width                   50 us
         pulse_compression_ratio       7500 absolute
         # pulse_repetition_frequency  xxxx hz             # The PRF will be dynamically chosen
         internal_loss                 6.5 db
         attenuation_model             earce
      end_transmitter

      receiver
         antenna_pattern               GENERIC_SAR_ANTENNA
         # Bandwidth assumes a matched filter for a pulse width of 50 us (i.e.: 1 / pulse_width)
         bandwidth                     20 khz
         noise_figure                  4 db
      end_receiver

      detection_threshold              6 db

      reports_location
   end_mode_template
```

- **演示要点**：演示 mode_template 的参数：azimuth_field_of_view, elevation_field_of_view, maximum_range, electronic_beam_steering, electronic_beam_steering_limit, electronic_beam_steering_loss_exponent, doppler_filter_broadening_factor, doppler_foldover_margin_factor, transmitter, receiver

### mode_template（closely_space_targets_ttr）｜

- **关键词**：mode_template, one_m2_detect_range, antenna_height, false_target_screener, transmitter, receiver, probability_of_false_alarm, required_pd, swerling_case, reports_range, reports_bearing, reports_elevation, reports_velocity
- **出处**：`electronic_warfare/closely_space_targets_ttr.txt:52-90`　（同签名共 2 处，另见 `electronic_warfare/test_false_targets/sensors/radar/ttr_radar.txt:36`）
- **片段**：

```text
   mode_template
      one_m2_detect_range            35.0 nm

      antenna_height                 4.0 m

      false_target_screener SCREENER WSF_FT_SCREENER
         #debug
         track_capacity     1000
         plot_capacity      1000
         transfer_capacity  1000
         request_based_tracking true
         #only_screen_false_target_track_requests true
      end_false_target_screener

      transmitter
         antenna_pattern             TTR_RADAR_ANTENNA
         power                       1000.0 kw
         frequency                   9500 mhz
         internal_loss               2 db
         pulse_repetition_interval   225 usec
         pulse_width                  25 usec
      end_transmitter

      receiver
         antenna_pattern             TTR_RADAR_ANTENNA
         bandwidth                   500.0 khz
         noise_power                 -160 dBw  # will be calibrated for 1 m^2
         internal_loss               7 dB
      end_receiver

      probability_of_false_alarm     1.0e-6
      required_pd                    0.5
      swerling_case                  1

      reports_range
      reports_bearing
      reports_elevation
      reports_velocity
   end_mode_template
```

- **演示要点**：演示 mode_template 的参数：one_m2_detect_range, antenna_height, false_target_screener, transmitter, receiver, probability_of_false_alarm, required_pd, swerling_case, reports_range, reports_bearing

### mode_template（ttr_radar）｜

- **关键词**：mode_template, one_m2_detect_range, antenna_height, transmitter, receiver, probability_of_false_alarm, required_pd, swerling_case, reports_range, reports_bearing, reports_elevation, reports_velocity
- **出处**：`alternate_locations/sensors/radar/ttr_radar.txt:28-55`　（同签名共 6 处，另见 `cyber/exfiltrate_demo/sensors/radar/ttr_radar.txt:32`、`iads/sensors/radar/ttr_radar.txt:32`、`iads_c2_demos/sensors/ttr_radar.txt:36`）
- **片段**：

```text
   mode_template
      one_m2_detect_range            35.0 nm

      antenna_height                 4.0 m

      transmitter
         antenna_pattern             TTR_RADAR_ANTENNA
         power                       1000.0 kw
         frequency                   9500 mhz
         internal_loss               2 db
      end_transmitter

      receiver
         antenna_pattern             TTR_RADAR_ANTENNA
         bandwidth                   500.0 khz
         noise_power                 -160 dBw  # will be calibrated for 1 m^2
         internal_loss               7 dB
      end_receiver

      probability_of_false_alarm     1.0e-6
      required_pd                    0.5
      swerling_case                  1

      reports_range
      reports_bearing
      reports_elevation
      reports_velocity
   end_mode_template
```

- **演示要点**：演示 mode_template 的参数：one_m2_detect_range, antenna_height, transmitter, receiver, probability_of_false_alarm, required_pd, swerling_case, reports_range, reports_bearing, reports_elevation

### mode_template（ew_radar）｜

- **关键词**：mode_template, frame_time, frequency_select_delay, beam, required_pd, hits_to_establish_track, hits_to_maintain_track, track_quality, reports_range, reports_bearing, reports_iff
- **出处**：`electronic_warfare/test_multi_beam/sensors/radar/ew_radar.txt:34-104`
- **片段**：

```text
   mode_template
      frame_time                     5.0 sec

      frequency_select_delay 10.0 sec

      beam 1
         one_m2_detect_range            100.0 nm

         antenna_height                 6.0 m

         scan_mode                      azimuth
         azimuth_scan_limits            -180 deg 180 deg

         jamming_perception_threshold 3.0 dB

         transmitter
            antenna_pattern             EW_RADAR_ANTENNA
            beam_tilt                   10.0 deg
            power                       1000.0 kw
            frequency                   200 mhz
            internal_loss               2 db
            frequency_channels 150 mhz 5 mhz 250 mhz
         end_transmitter

         receiver
            antenna_pattern             EW_RADAR_ANTENNA
            beam_tilt                   10.0 deg
            bandwidth                   2.0 mhz
            noise_power                 -160 dBw  # will be calibrated for 1 m^2
            internal_loss               7 dB
            electronic_protect
               technique frequency_agility
                  mitigated_techniques
                     noise_jamming
                  end_mitigated_techniques
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
               end_technique
            end_electronic_protect
         end_receiver

         probability_of_false_alarm     1.0e-6
         swerling_case                  1
      end_beam

      beam 2
         transmitter
            frequency_channels 155 mhz 5 mhz 255 mhz
         end_transmitter
      end_beam

      required_pd              0.5

      hits_to_establish_track  3 5
      hits_to_maintain_track   1 3

       # This sensor produces a relatively low fidelity track.
      track_quality            0.5

      reports_range
      reports_bearing
      reports_iff
   end_mode_template
```

- **演示要点**：演示 mode_template 的参数：frame_time, frequency_select_delay, beam, required_pd, hits_to_establish_track, hits_to_maintain_track, track_quality, reports_range, reports_bearing, reports_iff

### mode_template（agile_auto-repeater_jamming）｜

- **关键词**：mode_template, frame_time, frequency_select_delay, false_target_screener, beam, required_pd, hits_to_establish_track, hits_to_maintain_track, reports_range, reports_bearing, reports_iff
- **出处**：`electronic_warfare/agile_auto-repeater_jamming.txt:137-229`　（同签名共 6 处，另见 `electronic_warfare/semi-auto_repeater_jamming_1.txt:208`、`electronic_warfare/agile_repeater_jamming-rt1.txt:249`、`electronic_warfare/agile_repeater_jamming-rt2.txt:249`）
- **片段**：

```text
   mode_template
      frame_time                      1.0 sec

      frequency_select_delay 10.0 sec

      false_target_screener SCREENER WSF_FT_SCREENER
         track_capacity              100
         plot_capacity                50
         transfer_capacity            50
      end_false_target_screener

      beam 1
         one_m2_detect_range          100.0 nm
         maximum_range                120 nm

         antenna_height               6.0 m

         scan_mode                    azimuth
         azimuth_scan_limits         -180 deg 180 deg

         jamming_perception_threshold 3.0 dB

         transmitter
            antenna_pattern           EW_RADAR_ANTENNA
            beam_tilt              10 deg
            power                     750.0 kw
            pulse_width                  50  usec
            pulse_repetition_interval    750 usec // max PRI range of 225 km
            frequency_channels 920 mhz 10 mhz 940 mhz
         end_transmitter

         receiver
            antenna_pattern           EW_RADAR_ANTENNA
            bandwidth                 2.0 mhz

            electronic_protect
               technique agility
                  mitigated_technique_classes
                     NOISE_JAMMING
                     FALSE_TARGET_JAMMING
                  end_mitigated_technique_classes
                  effect agility_effect WSF_AGILITY_EFFECT
                     agility_type mode_changing
                        mode_name one
                        mode_name two
                     end_agility_type
                     agility_type frequency_changing
                     end_agility_type
                  end_effect
               end_technique

              technique sensor_sidelobe_blanker
                  mitigated_technique_classes
                     FALSE_TARGET_JAMMING
                  end_mitigated_technique_classes
                 effect slb_effect WSF_SLB_EFFECT
                    antenna_pattern    AUX_ANTENNA
                    blanking_threshold 0 dB
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
               end_technique
            end_electronic_protect
         end_receiver
      end_beam

      beam 2
         transmitter
            frequency_channels 925 mhz 10 mhz 945 mhz
         end_transmitter
      end_beam

      required_pd                     0.5

      hits_to_establish_track         3 5
      hits_to_maintain_track          1 3

      reports_range
      reports_bearing
      reports_iff
   end_mode_template
```

- **演示要点**：演示 mode_template 的参数：frame_time, frequency_select_delay, false_target_screener, beam, required_pd, hits_to_establish_track, hits_to_maintain_track, reports_range, reports_bearing, reports_iff

### mode_template（generic_esm）｜

- **关键词**：mode_template, frame_time, reports_range, reports_bearing, reports_location, reports_velocity, reports_elevation, reports_signal_to_noise, reports_frequency, reports_side
- **出处**：`base_types/sensors/esm_rwr/generic_esm.txt:77-90`　（同签名共 3 处，另见 `base_types/sensors/esm_rwr/generic_esm_sensor.txt:77`、`outer_air_battle/sensors/esm_rwr/generic_esm_sensor.txt:77`）
- **片段**：

```text
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
```

- **演示要点**：演示 mode_template 的参数：frame_time, reports_range, reports_bearing, reports_location, reports_velocity, reports_elevation, reports_signal_to_noise, reports_frequency, reports_side

### mode_template（blue_a2a_radar）｜

- **关键词**：mode_template, transmitter, frequency, power, antenna_pattern, receiver, range_product, frame_time, reports_location, reports_velocity
- **出处**：`base_types/sensors/radar/blue_a2a_radar.txt:132-154`　（同签名共 3 处，另见 `draw/sensors/radar/generic_fighter_radar.txt:38`、`outer_air_battle/sensors/radar/blue_a2a_radar.txt:138`）
- **片段**：

```text
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
```

- **演示要点**：演示 mode_template 的参数：transmitter, frequency, power, antenna_pattern, receiver, range_product, frame_time, reports_location, reports_velocity

### mode_template（agile_jamming）｜

- **关键词**：mode_template, frame_time, frequency_select_delay, beam, required_pd, hits_to_establish_track, hits_to_maintain_track, reports_range, reports_bearing
- **出处**：`electronic_warfare/agile_jamming.txt:236-291`
- **片段**：

```text
   mode_template
      frame_time                      10.0 sec

      frequency_select_delay 10.0 sec

      beam 1
         one_m2_detect_range          100.0 nm
         maximum_range                120 nm

         antenna_height               6.0 m

         scan_mode                    azimuth
         azimuth_scan_limits         -180 deg 180 deg


         transmitter
            antenna_pattern            EW_RADAR_ANTENNA
            beam_tilt                  10.0 deg
            power                      1000.0 kw
            frequency                  200 mhz
            pulse_width                25 usec
            pulse_repetition_interval  1250 usec
            internal_loss              2 db
            frequency_list
               frequency_id            1 200 mhz
               frequency_id            2 210 mhz
               frequency_id            3 220 mhz
            end_frequency_list
         end_transmitter

         receiver
            beam_tilt                  10.0 deg
            bandwidth                  2.0 mhz
            noise_power                -160 dBw  # will be calibrated for 1 m^2
            internal_loss              7 dB

            electronic_protect EW_RADAR_EP
            end_electronic_protect
         end_receiver

         jamming_perception_threshold  3.0 dB

         # Swerling detector
         swerling_case                 1
         probability_of_false_alarm    1.0e-6
         number_of_pulses_integrated   32
      end_beam

      required_pd                   0.5

      hits_to_establish_track       3 5   # 3 of last 5 scans to establish track
      hits_to_maintain_track        1 3   # 1 of last 3 scans to maintain  track

      reports_range
      reports_bearing
   end_mode_template
```

- **演示要点**：演示 mode_template 的参数：frame_time, frequency_select_delay, beam, required_pd, hits_to_establish_track, hits_to_maintain_track, reports_range, reports_bearing

### mode_template（red_a2a_radar）｜

- **关键词**：mode_template, reports_location, reports_velocity, transmitter, receiver, one_m2_detect_range, frame_time, track_quality
- **出处**：`base_types/sensors/radar/red_a2a_radar.txt:122-135`
- **片段**：

```text
   mode_template
      reports_location
      reports_velocity

      transmitter
         frequency 9.6 ghz
         power 1.0 mw
      end_transmitter
      receiver
      end_receiver
      one_m2_detect_range 50 nm
      frame_time 2 sec
      track_quality 1.0
   end_mode_template
```

- **演示要点**：演示 mode_template 的参数：reports_location, reports_velocity, transmitter, receiver, one_m2_detect_range, frame_time, track_quality

### mode_template（5th_iridium_flares_demo）｜

- **关键词**：mode_template, maximum_range, check_terrain_masking, reports_location, reports_velocity
- **出处**：`satellite_demos/5th_iridium_flares_demo.txt:292-297`
- **片段**：

```text
      mode_template
         maximum_range 80 km
         check_terrain_masking off
         reports_location
         reports_velocity
      end_mode_template
```

- **演示要点**：演示 mode_template 的参数：maximum_range, check_terrain_masking, reports_location, reports_velocity

### model（comm_include）｜

- **关键词**：model, fidelity_range, comm
- **出处**：`multiresolution_demos/comms/comm_include.txt:44-48`　（同签名共 2 处，另见 `multiresolution_demos/comms/comm_include.txt:50`）
- **片段**：

```text
   model low_fidelity_comm
      fidelity_range 0.0 0.5
      comm TEAM_DATALINK
      end_comm
   end_model
```

- **演示要点**：演示 model 的参数：fidelity_range, comm

### model（fuel_include）｜

- **关键词**：model, fidelity_range, fuel
- **出处**：`multiresolution_demos/fuel/fuel_include.txt:46-50`
- **片段**：

```text
  model high_fidelity_fuel
     fidelity_range 0.5 1.0
     fuel HIGH_FIDELITY_FUEL
     end_fuel
  end_model
```

- **演示要点**：演示 model 的参数：fidelity_range, fuel

### model（space_mover）｜

- **关键词**：model, fidelity_range, mover
- **出处**：`multiresolution_demos/movers/space_mover.txt:13-17`　（同签名共 4 处，另见 `multiresolution_demos/movers/air_mover.txt:13`、`multiresolution_demos/movers/air_mover.txt:19`、`multiresolution_demos/movers/space_mover.txt:19`）
- **片段**：

```text
   model low_fidelity_mover
      fidelity_range 0.0 0.5
      mover WSF_SPACE_MOVER
      end_mover
   end_model
```

- **演示要点**：演示 model 的参数：fidelity_range, mover

### model（processor_include）｜

- **关键词**：model, fidelity_range, processor
- **出处**：`multiresolution_demos/processors/processor_include.txt:93-97`　（同签名共 4 处，另见 `multiresolution_demos/processors/processor_include.txt:98`、`multiresolution_demos/processors/processor_include.txt:13`、`multiresolution_demos/processors/processor_include.txt:27`）
- **片段**：

```text
   model low_fidelity_model
      fidelity_range 0.0 0.5
      processor LOW_FIDELITY_TASK_PROCESSOR
      end_processor
   end_model
```

- **演示要点**：演示 model 的参数：fidelity_range, processor

### model（fighter_multiresolution_signature）｜

- **关键词**：model, fidelity_range, optical_signature
- **出处**：`multiresolution_demos/signatures/fighter_multiresolution_signature.txt:27-31`
- **片段**：

```text
   model multishape_sig
      fidelity_range 0.66 1.0
      optical_signature FIGHTER_MULTI_SHAPE_OPTICAL_SIG
      end_optical_signature
   end_model
```

- **演示要点**：演示 model 的参数：fidelity_range, optical_signature

### model（radar_signatures）｜

- **关键词**：model, fidelity_range, radar_signature
- **出处**：`multiresolution_demos/signatures/radar_signatures.txt:45-49`　（同签名共 2 处，另见 `multiresolution_demos/signatures/radar_signatures.txt:50`）
- **片段**：

```text
   model constant_sig
      fidelity_range 0.0 0.5
      radar_signature CONSTANT_RADAR_SIGNATURE
      end_radar_signature
   end_model
```

- **演示要点**：演示 model 的参数：fidelity_range, radar_signature

### model（sensor_include）｜

- **关键词**：model, fidelity_range, sensor
- **出处**：`multiresolution_demos/sensors/sensor_include.txt:30-35`　（同签名共 2 处，另见 `multiresolution_demos/sensors/sensor_include.txt:37`）
- **片段**：

```text
   model low_res_sensor
      fidelity_range 0.0 0.5
      sensor WSF_GEOMETRIC_SENSOR
         internal_link track_mgr
      end_sensor
   end_model
```

- **演示要点**：演示 model 的参数：fidelity_range, sensor

### multiresolution_sensor · WSF_MULTIRESOLUTION_SENSOR｜

- **关键词**：multiresolution_sensor, WSF_MULTIRESOLUTION_SENSOR, model, common
- **出处**：`multiresolution_demos/sensors/sensor_include.txt:29-60`
- **片段**：

```text
multiresolution_sensor MR_SENSOR WSF_MULTIRESOLUTION_SENSOR
   model low_res_sensor
      fidelity_range 0.0 0.5
      sensor WSF_GEOMETRIC_SENSOR
         internal_link track_mgr
      end_sensor
   end_model
  
   model high_res_sensor
      fidelity_range 0.5 1.0
      sensor GENERIC_IRST
         internal_link image_proc
      end_sensor
   end_model
  
   common
      on
      reports_range
      frame_time               10 sec
      azimuth_field_of_view   -45.0 deg 45.0 deg  
      elevation_field_of_view -45.0 deg 45.0 deg  
      maximum_range            50 nm
     
      slew_mode                 azimuth_and_elevation
      azimuth_slew_limits     -45 deg 45 deg    
      elevation_slew_limits   -45 deg 45 deg    
      azimuth_slew_rate         5 deg/s
      elevation_slew_rate       5 deg/s 
      selection_mode            single
      ignore_same_side
   end_common
end_multiresolution_sensor
```

- **演示要点**：演示 WSF_MULTIRESOLUTION_SENSOR 的参数：model, common

### multiresolution_sensor（sensor_demo）｜

- **关键词**：multiresolution_sensor, fidelity
- **出处**：`multiresolution_demos/sensor_demo.txt:83-85`
- **片段**：

```text
   multiresolution_sensor mr_sensor
      fidelity 1 # Adjust to swap sensors 
   end_multiresolution_sensor
```

- **演示要点**：演示 multiresolution_sensor 的参数：fidelity

### multiresolution_sensor（sensor_demo）｜

- **关键词**：multiresolution_sensor
- **出处**：`multiresolution_demos/sensor_demo.txt:54-55`
- **片段**：

```text
   multiresolution_sensor mr_sensor MR_SENSOR
   end_multiresolution_sensor
```

- **演示要点**：演示 multiresolution_sensor（最小结构，无子参数）

### pulse_repetition_frequencies（mtd_radar）｜

- **关键词**：pulse_repetition_frequencies, prf
- **出处**：`base_types/sensors/radar/mtd_radar.txt:37-40`
- **片段**：

```text
      pulse_repetition_frequencies
         prf 1 500 hz
         prf 2 350 hz
      end_pulse_repetition_frequencies
```

- **演示要点**：演示 pulse_repetition_frequencies 的参数：prf

### receiver（lasercomm_link）｜接收机

- **关键词**：receiver, aperture_diameter, optics_transmission_factor, quantum_efficiency, detector_gain, focal_length, detector_size, circuit_temperature, circuit_capacitance, dark_current, dark_count_rate, 接收机
- **出处**：`space_operations/comms/lasercomm_link.txt:48-67`
- **片段**：

```text
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
```

- **演示要点**：演示 receiver 的参数：aperture_diameter, optics_transmission_factor, quantum_efficiency, detector_gain, focal_length, detector_size, circuit_temperature, circuit_capacitance, dark_current, dark_count_rate

### receiver（mar）｜接收机

- **关键词**：receiver, antenna_pattern, bandwidth, noise_power, internal_loss, electronic_beam_steering, electronic_beam_steering_limit, antenna_height, 接收机
- **出处**：`engage/radars/mar.txt:55-63`
- **片段**：

```text
   receiver
      antenna_pattern    MAR_ANTENNA
      bandwidth          500.0 khz
      noise_power        -100 dBw
      internal_loss      7 db
      electronic_beam_steering azimuth_and_elevation
      electronic_beam_steering_limit 90 deg
      antenna_height 1 m
   end_receiver
```

- **演示要点**：演示 receiver 的参数：antenna_pattern, bandwidth, noise_power, internal_loss, electronic_beam_steering, electronic_beam_steering_limit, antenna_height

### receiver（passive_detector_demo）｜接收机

- **关键词**：receiver, antenna_pattern, beam_tilt, frequency, bandwidth, noise_power, instantaneous_bandwidth, check_transmitter_masking, 接收机
- **出处**：`sensor_demos/passive_detector_demo.txt:57-66`　（同签名共 2 处，另见 `sensor_demos/passive_detector_df_demo.txt:55`）
- **片段**：

```text
   receiver
      antenna_pattern          BISTATIC_RX_ANTENNA
      beam_tilt                  0 deg
      frequency                 525 mhz
      bandwidth                950.0 mhz
      noise_power              -175 dbm
      instantaneous_bandwidth    10 mhz

      check_transmitter_masking false
   end_receiver
```

- **演示要点**：演示 receiver 的参数：antenna_pattern, beam_tilt, frequency, bandwidth, noise_power, instantaneous_bandwidth, check_transmitter_masking

### receiver（mtd_radar）｜接收机

- **关键词**：receiver, beam_tilt, bandwidth, internal_loss, antenna_ohmic_loss, noise_figure, receive_line_loss, 接收机
- **出处**：`base_types/sensors/radar/mtd_radar.txt:45-52`　（同签名共 2 处，另见 `base_types/sensors/radar/mti_radar.txt:42`）
- **片段**：

```text
   receiver
      beam_tilt                  1.0 deg
      bandwidth                  0.3 mhz
      internal_loss              6 dB
      antenna_ohmic_loss         0.0 db
      noise_figure               3 db
      receive_line_loss          2 db
   end_receiver
```

- **演示要点**：演示 receiver 的参数：beam_tilt, bandwidth, internal_loss, antenna_ohmic_loss, noise_figure, receive_line_loss

### receiver（BEIDOUCommDef）｜接收机

- **关键词**：receiver, antenna_pattern, frequency, bandwidth, wavelength, noise_power, detection_threshold, 接收机
- **出处**：`satellite_demos/avionics/comm/BEIDOUCommDef.txt:94-101`　（同签名共 12 处，另见 `satellite_demos/avionics/comm/BEIDOUCommDef.txt:110`、`satellite_demos/avionics/comm/BEIDOUCommDef.txt:126`、`satellite_demos/avionics/comm/BEIDOUCommDef_GS.txt:88`）
- **片段**：

```text
   receiver
      antenna_pattern                     SATELLITE_NADIR_CONE
      frequency                           1561.098 mhz   # ref 1
      bandwidth                           4.092 mhz      # ref 2
      wavelength                          0.1921 m       # ref 2
      noise_power                         -163 dbw       # ref 3
      detection_threshold                 3.0 dB
   end_receiver
```

- **演示要点**：演示 receiver 的参数：antenna_pattern, frequency, bandwidth, wavelength, noise_power, detection_threshold

### receiver（ew_radar）｜接收机

- **关键词**：receiver, antenna_pattern, beam_tilt, bandwidth, noise_power, internal_loss, electronic_protect, 接收机
- **出处**：`aea_iads/sensors/radar/ew_radar.txt:121-129`　（同签名共 3 处，另见 `electronic_warfare/test_multi_beam/sensors/radar/ew_radar.txt:58`、`electronic_warfare/test_false_targets/sensors/radar/ew_radar.txt:63`）
- **片段**：

```text
   receiver
      antenna_pattern             EW_RADAR_ANTENNA
      beam_tilt                   10.0 deg
      bandwidth                   2.0 mhz
      noise_power                 -160 dBw  # will be calibrated for 1 m^2
      internal_loss               7 dB

      electronic_protect EW_RADAR_EP end_electronic_protect
   end_receiver
```

- **演示要点**：演示 receiver 的参数：antenna_pattern, beam_tilt, bandwidth, noise_power, internal_loss, electronic_protect

### receiver（bistatic_demo）｜接收机

- **关键词**：receiver, antenna_pattern, antenna_height, frequency, bandwidth, noise_figure, check_transmitter_masking, 接收机
- **出处**：`sensor_demos/bistatic_demo.txt:42-50`　（同签名共 8 处，另见 `sensor_demos/bistatic_sp_false_target_jamming_demo.txt:74`、`sensor_demos/bistatic_sp_noise_jamming_demo.txt:57`、`sensor_demos/bistatic_support_false_target_jamming_demo.txt:80`）
- **片段**：

```text
   receiver
      antenna_pattern    BISTATIC_RX_ANTENNA
      antenna_height     9 m
      frequency          100 mhz
      bandwidth          200 khz
      noise_figure         7 db

      check_transmitter_masking false
   end_receiver
```

- **演示要点**：演示 receiver 的参数：antenna_pattern, antenna_height, frequency, bandwidth, noise_figure, check_transmitter_masking

### receiver（generic_bomber_radar）｜接收机

- **关键词**：receiver, antenna_pattern, bandwidth, detection_threshold, noise_power, internal_loss, 接收机
- **出处**：`base_types/sensors/radar/generic_bomber_radar.txt:99-105`　（同签名共 4 处，另见 `suppressor/sensors/radar/bomber_radar.txt:48`、`suppressor/sensors/radar/sam_radar.txt:49`、`suppressor/weapons/sam/missile.txt:51`）
- **片段**：

```text
    receiver
      antenna_pattern       GENERIC_BOMBER_RADAR_ANTENNA_PATTERN
      bandwidth             1.6 mhz
      detection_threshold   13 db
      noise_power           -150 dbw
      internal_loss         10 db
    end_receiver
```

- **演示要点**：演示 receiver 的参数：antenna_pattern, bandwidth, detection_threshold, noise_power, internal_loss

### receiver（pd_radar）｜接收机

- **关键词**：receiver, bandwidth, internal_loss, antenna_ohmic_loss, noise_figure, receive_line_loss, 接收机
- **出处**：`base_types/sensors/radar/pd_radar.txt:41-47`
- **片段**：

```text
   receiver
      bandwidth                  0.02 mhz
      internal_loss              6 dB
      antenna_ohmic_loss         0.0 db
      noise_figure               3 db
      receive_line_loss          2 db
   end_receiver
```

- **演示要点**：演示 receiver 的参数：bandwidth, internal_loss, antenna_ohmic_loss, noise_figure, receive_line_loss

### receiver（ew_radar）｜接收机

- **关键词**：receiver, antenna_pattern, beam_tilt, bandwidth, noise_power, internal_loss, 接收机
- **出处**：`cyber/exfiltrate_demo/sensors/radar/ew_radar.txt:51-57`　（同签名共 10 处，另见 `cyber/sensors/radar/uhf_ew_radar_sensor.txt:46`、`heatmap/sensors/radar/ew_radar.txt:43`、`iads/sensors/radar/ew_radar.txt:52`）
- **片段**：

```text
   receiver
      antenna_pattern             EW_RADAR_ANTENNA
      beam_tilt                   10.0 deg
      bandwidth                   2.0 mhz
      noise_power                 -160 dBw  # will be calibrated for 1 m^2
      internal_loss               7 dB
   end_receiver
```

- **演示要点**：演示 receiver 的参数：antenna_pattern, beam_tilt, bandwidth, noise_power, internal_loss

### receiver（esm_detect_multi_beam_radar）｜接收机

- **关键词**：receiver, antenna_pattern, antenna_tilt, detection_threshold, noise_power, internal_loss, 接收机
- **出处**：`electronic_warfare/esm_detect_multi_beam_radar.txt:49-55`
- **片段**：

```text
   receiver
      antenna_pattern      ESM_ANTENNA
      antenna_tilt         -45 deg
      detection_threshold  5 db
      noise_power          -120 dbw
      internal_loss        0 db
   end_receiver
```

- **演示要点**：演示 receiver 的参数：antenna_pattern, antenna_tilt, detection_threshold, noise_power, internal_loss

### receiver（GlobalstarCommDef）｜接收机

- **关键词**：receiver, antenna_pattern, frequency, bandwidth, noise_power, detection_threshold, 接收机
- **出处**：`satellite_demos/avionics/comm/GlobalstarCommDef.txt:44-50`　（同签名共 33 处，另见 `satellite_demos/avionics/comm/GlobalstarCommDef.txt:77`、`satellite_demos/avionics/comm/GlobalstarCommDef_GS.txt:38`、`satellite_demos/avionics/comm/GlobalstarCommDef_HH.txt:38`）
- **片段**：

```text
   receiver
      antenna_pattern                     SATELLITE_NADIR_CONE
      frequency                           5250 MHz   # ref 2
      bandwidth                           50 kHz        #
      noise_power                         -143.7 dBW   # ref 2
      detection_threshold                 3.0 dB
   end_receiver
```

- **演示要点**：演示 receiver 的参数：antenna_pattern, frequency, bandwidth, noise_power, detection_threshold

### receiver（hm-bistatic-radar）｜接收机

- **关键词**：receiver, antenna_pattern, beam_tilt, frequency, bandwidth, noise_power, 接收机
- **出处**：`sensor_plot/radar/hm-bistatic-radar.txt:43-49`
- **片段**：

```text
   receiver
      antenna_pattern             BISTATIC_RX_ANTENNA
      beam_tilt                   0 deg
      frequency                   400 mhz
      bandwidth                   2.0 mhz
      noise_power                 -175 dBw
   end_receiver
```

- **演示要点**：演示 receiver 的参数：antenna_pattern, beam_tilt, frequency, bandwidth, noise_power

### receiver（acq_radar）｜接收机

- **关键词**：receiver, antenna_pattern, bandwidth, noise_power, internal_loss, electronic_protect, 接收机
- **出处**：`aea_iads/sensors/radar/acq_radar.txt:58-65`　（同签名共 2 处，另见 `electronic_warfare/test_false_targets/sensors/radar/acq_radar.txt:57`）
- **片段**：

```text
   receiver
      antenna_pattern             ACQ_RADAR_ANTENNA
      bandwidth                   2.0 mhz
      noise_power                 -160 dBw  # will be calibrated for 1 m^2
      internal_loss               7 dB

      electronic_protect ACQ_RADAR_EP end_electronic_protect
   end_receiver
```

- **演示要点**：演示 receiver 的参数：antenna_pattern, bandwidth, noise_power, internal_loss, electronic_protect

### receiver（track_drop_maintain_effect）｜接收机

- **关键词**：receiver, beam_tilt, bandwidth, noise_power, internal_loss, electronic_protect, 接收机
- **出处**：`electronic_warfare/track_drop_maintain_effect.txt:136-143`　（同签名共 12 处，另见 `electronic_warfare/agile_jamming.txt:266`、`electronic_warfare/cover_pulse_jamming.txt:143`、`electronic_warfare/false-target_jamming_1.txt:161`）
- **片段**：

```text
   receiver
      beam_tilt                  10.0 deg
      bandwidth                  2.0 mhz
      noise_power                -160 dBw  # will be calibrated for 1 m^2
      internal_loss              7 dB

      electronic_protect EW_RADAR_EP end_electronic_protect
   end_receiver
```

- **演示要点**：演示 receiver 的参数：beam_tilt, bandwidth, noise_power, internal_loss, electronic_protect

### receiver（hm-bistatic-ft-jamming-lab）｜接收机

- **关键词**：receiver, antenna_pattern, antenna_height, frequency_band, bandwidth, noise_figure, 接收机
- **出处**：`sensor_plot/radar/hm-bistatic-ft-jamming-lab.txt:77-85`
- **片段**：

```text
   receiver
      antenna_pattern    BISTATIC_RX_ANTENNA
      antenna_height     9 m
      frequency_band     100 mhz 200 mhz
      bandwidth          200 khz
      noise_figure         7 db
      #check_terrain_masking false
      #check_transmitter_masking false
   end_receiver
```

- **演示要点**：演示 receiver 的参数：antenna_pattern, antenna_height, frequency_band, bandwidth, noise_figure

### receiver（ground_station）｜接收机

- **关键词**：receiver, antenna_pattern, frequency, internal_loss, noise_power, detection_threshold, 接收机
- **出处**：`satellite_demos/platforms/ground_station.txt:46-58`
- **片段**：

```text
      receiver
         antenna_pattern GS_RCVR_ANTENNA
         frequency       435.300 mhz
         # The internal_loss is used to account the following items from the
         # link budget calculator:
         #   a) 3 dB polarization mismatch loss.
         #   b) 1 dB loss for going through the ionosphere
         #   c) 3 dB receive antenna feeder loss
         internal_loss   7 db
         # The receiver noise floor in the link budget calculator is -130 dBm
         noise_power     -130 dBm
         detection_threshold 12 dB
      end_receiver
```

- **演示要点**：演示 receiver 的参数：antenna_pattern, frequency, internal_loss, noise_power, detection_threshold

### receiver（jam_strobe_tracking）｜接收机

- **关键词**：receiver, antenna_pattern, antenna_tilt, frequency, bandwidth, electronic_protect, 接收机
- **出处**：`electronic_warfare/jam_strobe_tracking.txt:113-136`　（同签名共 6 处，另见 `electronic_warfare/pol_mod_jamming.txt:125`、`electronic_warfare/false-target_command_center.txt:159`、`electronic_warfare/repeater_jamming.txt:183`）
- **片段**：

```text
   receiver
      antenna_pattern EW_RADAR_ANTENNA
      antenna_tilt     10 deg
      frequency       900 mhz
      bandwidth         1 mhz
      electronic_protect
         technique sidelobe_canceller
            mitigated_techniques
               noise_jamming
            end_mitigated_techniques
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
         end_technique
      end_electronic_protect
   end_receiver
```

- **演示要点**：演示 receiver 的参数：antenna_pattern, antenna_tilt, frequency, bandwidth, electronic_protect

### receiver（ucav_esm）｜接收机

- **关键词**：receiver, antenna_pattern, detection_threshold, noise_power, internal_loss, 接收机
- **出处**：`aea_iads/sensors/esm_rwr/ucav_esm.txt:25-30`　（同签名共 23 处，另见 `alv_routing/sensors/alv_esm.txt:25`、`electronic_warfare/agile_auto-repeater_jamming.txt:48`、`electronic_warfare/agile_jamming.txt:46`）
- **片段**：

```text
   receiver
      antenna_pattern      UCAV_ESM_ANTENNA
      detection_threshold  5 db
      noise_power          -180 dbw
      internal_loss        0 db
   end_receiver
```

- **演示要点**：演示 receiver 的参数：antenna_pattern, detection_threshold, noise_power, internal_loss

### receiver（ttr_radar）｜接收机

- **关键词**：receiver, antenna_pattern, bandwidth, noise_power, internal_loss, 接收机
- **出处**：`aea_iads/sensors/radar/ttr_radar.txt:57-62`　（同签名共 32 处，另见 `alternate_locations/sensors/radar/acq_radar.txt:36`、`alternate_locations/sensors/radar/ttr_radar.txt:40`、`chaff/chaff_example_ttr.txt:160`）
- **片段**：

```text
      receiver
         antenna_pattern             TTR_RADAR_ANTENNA
         bandwidth                   500.0 khz
         noise_power                 -160 dBw  # will be calibrated for 1 m^2
         internal_loss               7 dB
      end_receiver
```

- **演示要点**：演示 receiver 的参数：antenna_pattern, bandwidth, noise_power, internal_loss

### receiver（aesa）｜接收机

- **关键词**：receiver, antenna_pattern, noise_figure, instantaneous_bandwidth, internal_loss, 接收机
- **出处**：`air_to_air/sensors/radar/aesa.txt:58-63`　（同签名共 2 处，另见 `air_to_air/sensors/radar/long_range.txt:53`）
- **片段**：

```text
      receiver
         antenna_pattern          AESA_ANTENNA
         noise_figure             5.5    db      
         instantaneous_bandwidth  30.00  hz      
         internal_loss            2.5    db      
      end_receiver
```

- **演示要点**：演示 receiver 的参数：antenna_pattern, noise_figure, instantaneous_bandwidth, internal_loss

### receiver（ew_radar）｜接收机

- **关键词**：receiver, antenna_pattern, antenna_tilt, bandwidth, internal_loss, 接收机
- **出处**：`alv_routing/sensors/ew_radar.txt:36-41`　（同签名共 6 处，另见 `satellite_demos/scenarios/gps_denied.txt:285`、`script_demos/script_demo_2.txt:63`、`script_demos/script_demo_5.txt:103`）
- **片段**：

```text
  receiver
     antenna_pattern EARLY_WARNING_RADAR_ANTENNA
     antenna_tilt  5 deg
     bandwidth  1 mhz
     internal_loss  19 dB
  end_receiver
```

- **演示要点**：演示 receiver 的参数：antenna_pattern, antenna_tilt, bandwidth, internal_loss

### receiver（medium_range_uplink_missile）｜接收机

- **关键词**：receiver, antenna_pattern, frequency, bandwidth, detection_threshold, 接收机
- **出处**：`base_types/weapons/aam/medium_range_uplink_missile.txt:103-108`
- **片段**：

```text
      receiver
         antenna_pattern weapon_datalink_gain
         frequency 10 GHz
         bandwidth 500 MHz
         detection_threshold 0 dB
      end_receiver
```

- **演示要点**：演示 receiver 的参数：antenna_pattern, frequency, bandwidth, detection_threshold

### receiver（chaff_example）｜接收机

- **关键词**：receiver, beam_tilt, bandwidth, noise_power, internal_loss, 接收机
- **出处**：`chaff/chaff_example.txt:157-162`　（同签名共 10 处，另见 `electronic_warfare/barrage_jamming.txt:86`、`electronic_warfare/closely_space_targets.txt:65`、`electronic_warfare/esm_detect_multi_beam_radar.txt:109`）
- **片段**：

```text
   receiver
      beam_tilt                  10.0 deg
      bandwidth                  2.0 mhz
      noise_power                -160 dBw  # will be calibrated for 1 m^2
      internal_loss              7 dB
   end_receiver
```

- **演示要点**：演示 receiver 的参数：beam_tilt, bandwidth, noise_power, internal_loss

### receiver（comm_jamming）｜接收机

- **关键词**：receiver, antenna_pattern, frequency, bandwidth, electronic_protect, 接收机
- **出处**：`electronic_warfare/comm_jamming.txt:90-95`
- **片段**：

```text
   receiver
      antenna_pattern RADIO_ANTENNA_PATTERN
      frequency 2.4 GHz
      bandwidth 1 MHz
      electronic_protect RADIO_EP end_electronic_protect
   end_receiver
```

- **演示要点**：演示 receiver 的参数：antenna_pattern, frequency, bandwidth, electronic_protect

### receiver（esm_detect_jammer）｜接收机

- **关键词**：receiver, antenna_pattern, antenna_tilt, frequency, bandwidth, 接收机
- **出处**：`electronic_warfare/esm_detect_jammer.txt:102-107`　（同签名共 4 处，另见 `electronic_warfare/jam_strobe_direction_finder.txt:61`、`sensor_demos/esm_demo.txt:69`、`sensor_demos/esm_tdoa_demo.txt:69`）
- **片段**：

```text
   receiver
      antenna_pattern EW_RADAR_ANTENNA
      antenna_tilt     10 deg
      frequency       900 mhz
      bandwidth         1 mhz
   end_receiver
```

- **演示要点**：演示 receiver 的参数：antenna_pattern, antenna_tilt, frequency, bandwidth

### receiver（ucav_esm）｜接收机

- **关键词**：receiver, antenna_pattern, detection_sensitivity, noise_power, internal_loss, 接收机
- **出处**：`electronic_warfare/test_multi_beam/sensors/esm/ucav_esm.txt:26-31`
- **片段**：

```text
   receiver
      antenna_pattern        UCAV_ESM_ANTENNA
      detection_sensitivity   -70 dbm
      noise_power            -180 dbw
      internal_loss             0 db
   end_receiver
```

- **演示要点**：演示 receiver 的参数：antenna_pattern, detection_sensitivity, noise_power, internal_loss

### receiver（iridium）｜接收机

- **关键词**：receiver, antenna_pattern, frequency, bandwidth, polarization, 接收机
- **出处**：`satellite_demos/platforms/iridium.txt:45-50`
- **片段**：

```text
      receiver
         antenna_pattern                     UNIFORM_0DBI_PATTERN
         frequency                            22.28 ghz  # ref 1
         bandwidth                            200 mhz    # ref 1
         polarization                         horizontal  # ref 1
      end_receiver
```

- **演示要点**：演示 receiver 的参数：antenna_pattern, frequency, bandwidth, polarization

### receiver（comm）｜接收机

- **关键词**：receiver, frequency, bandwidth, antenna_pattern, noise_power, 接收机
- **出处**：`sensor_plot/comm/comm.txt:62-67`
- **片段**：

```text
   receiver
      frequency              1.2 ghz
      bandwidth              1 mhz
      antenna_pattern        RX_ANTENNA_PATTERN
      noise_power            -145 dbw
   end_receiver
```

- **演示要点**：演示 receiver 的参数：frequency, bandwidth, antenna_pattern, noise_power

### receiver（semi-auto_repeater_jamming_1）｜接收机

- **关键词**：receiver, antenna_pattern, antenna_tilt, bandwidth, electronic_protect, 接收机
- **出处**：`electronic_warfare/semi-auto_repeater_jamming_1.txt:238-283`　（同签名共 3 处，另见 `electronic_warfare/agile_repeater_jamming-rt1.txt:279`、`electronic_warfare/agile_repeater_jamming-rt2.txt:279`）
- **片段**：

```text
         receiver
            antenna_pattern           EW_RADAR_ANTENNA
            antenna_tilt              10 deg
            bandwidth                 2.0 mhz

            electronic_protect
               technique agility
                  mitigated_technique_classes
                     NOISE_JAMMING
                     FALSE_TARGET_JAMMING
                  end_mitigated_technique_classes
                  effect agility_effect WSF_AGILITY_EFFECT
                     agility_type mode_changing
                        mode_name one
                        mode_name two
                     end_agility_type
                     agility_type frequency_changing
                     end_agility_type
                  end_effect
               end_technique

              technique sensor_sidelobe_blanker
                  mitigated_technique_classes
                     FALSE_TARGET_JAMMING
                  end_mitigated_technique_classes
                 effect slb_effect WSF_SLB_EFFECT
                    antenna_pattern    AUX_ANTENNA
                    blanking_threshold 0 dB
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
               end_technique
            end_electronic_protect
         end_receiver
```

- **演示要点**：演示 receiver 的参数：antenna_pattern, antenna_tilt, bandwidth, electronic_protect

### receiver（ttr_radar）｜接收机

- **关键词**：receiver, bandwidth, noise_power, internal_loss, 接收机
- **出处**：`aea_iads/sensors/radar/ttr_radar.txt:118-122`
- **片段**：

```text
      receiver
         bandwidth                   250.0 hz
         noise_power                 -175 dBw  // will be calibrated for 1 m^2
         internal_loss               7 dB
      end_receiver
```

- **演示要点**：演示 receiver 的参数：bandwidth, noise_power, internal_loss

### receiver（simple_auto_jamming）｜接收机

- **关键词**：receiver, antenna_pattern, antenna_tilt, bandwidth, 接收机
- **出处**：`electronic_warfare/simple_auto_jamming.txt:287-291`　（同签名共 2 处，另见 `ship_ad/sensors/radar/rice_screen.txt:62`）
- **片段**：

```text
   receiver
      antenna_pattern           EW_RADAR_ANTENNA
      antenna_tilt              10 deg
      bandwidth                 2.0 mhz
   end_receiver
```

- **演示要点**：演示 receiver 的参数：antenna_pattern, antenna_tilt, bandwidth

### receiver（iridium）｜接收机

- **关键词**：receiver, antenna_pattern, frequency, bandwidth, 接收机
- **出处**：`satellite_demos/platforms/iridium.txt:64-68`　（同签名共 5 处，另见 `satellite_demos/platforms/iridium.txt:90`、`satellite_demos/platforms/iridium_gs.txt:41`、`satellite_demos/user_handhelds/iridium_handheld.txt:35`）
- **片段**：

```text
      receiver
         antenna_pattern                     UNIFORM_0DBI_PATTERN
         frequency                           1621 mhz  # ref 1
         bandwidth                           10.5 mhz  # ref 1
      end_receiver
```

- **演示要点**：演示 receiver 的参数：antenna_pattern, frequency, bandwidth

### receiver（generic_sar）｜接收机

- **关键词**：receiver, antenna_pattern, bandwidth, noise_figure, 接收机
- **出处**：`base_types/sensors/radar/generic_sar.txt:72-77`　（同签名共 2 处，另见 `sensor_plot/sar/bomber_sar.txt:81`）
- **片段**：

```text
      receiver
         antenna_pattern               GENERIC_SAR_ANTENNA
         # Bandwidth assumes a matched filter for a pulse width of 50 us (i.e.: 1 / pulse_width)
         bandwidth                     20 khz
         noise_figure                  4 db
      end_receiver
```

- **演示要点**：演示 receiver 的参数：antenna_pattern, bandwidth, noise_figure

### receiver（example_sar）｜接收机

- **关键词**：receiver, bandwidth, noise_figure, internal_loss, 接收机
- **出处**：`sensor_plot/sar/example_sar.txt:47-52`
- **片段**：

```text
      receiver
         # Assume a matched-filter for a pulse width of 50 us
         bandwidth                     20 khz
         noise_figure                  4 db
         internal_loss                 3.25 db
      end_receiver
```

- **演示要点**：演示 receiver 的参数：bandwidth, noise_figure, internal_loss

### receiver（air-to-air-rt1）｜接收机

- **关键词**：receiver, antenna_tilt, bandwidth, electronic_protect, 接收机
- **出处**：`electronic_warfare/air-to-air-rt1.txt:265-282`　（同签名共 2 处，另见 `electronic_warfare/air-to-air-rt2.txt:265`）
- **片段**：

```text
      receiver
         antenna_tilt              10 deg
         bandwidth                 2.0 mhz

         electronic_protect
            technique agility
               mitigated_technique_classes
                  NOISE_JAMMING
                  FALSE_TARGET_JAMMING
               end_mitigated_technique_classes
               effect agility_effect WSF_AGILITY_EFFECT
                  #debug
                  agility_type frequency_changing
                  end_agility_type
               end_effect
            end_technique
         end_electronic_protect
      end_receiver
```

- **演示要点**：演示 receiver 的参数：antenna_tilt, bandwidth, electronic_protect

### receiver（track_error）｜接收机

- **关键词**：receiver, frequency, bandwidth, electronic_protect, 接收机
- **出处**：`electronic_warfare/track_error.txt:204-221`
- **片段**：

```text
   receiver
      frequency       900 mhz
      bandwidth         1 mhz
      electronic_protect
         technique
            default_on
            mitigated_techniques
               track_error_inducement
            end_mitigated_techniques
            effect mitigate_track_error WSF_TRACK_EFFECT
               track_behavior distort
               range_error     50   m
               azimuth_error    0.5 deg
               elevation_error  1   deg
            end_effect
         end_technique
      end_electronic_protect
   end_receiver
```

- **演示要点**：演示 receiver 的参数：frequency, bandwidth, electronic_protect

### receiver（agile_auto-repeater_jamming）｜接收机

- **关键词**：receiver, antenna_pattern, bandwidth, electronic_protect, 接收机
- **出处**：`electronic_warfare/agile_auto-repeater_jamming.txt:168-212`　（同签名共 3 处，另见 `electronic_warfare/agile_repeater_jamming.txt:291`、`electronic_warfare/manual_repeater_jamming.txt:315`）
- **片段**：

```text
         receiver
            antenna_pattern           EW_RADAR_ANTENNA
            bandwidth                 2.0 mhz

            electronic_protect
               technique agility
                  mitigated_technique_classes
                     NOISE_JAMMING
                     FALSE_TARGET_JAMMING
                  end_mitigated_technique_classes
                  effect agility_effect WSF_AGILITY_EFFECT
                     agility_type mode_changing
                        mode_name one
                        mode_name two
                     end_agility_type
                     agility_type frequency_changing
                     end_agility_type
                  end_effect
               end_technique

              technique sensor_sidelobe_blanker
                  mitigated_technique_classes
                     FALSE_TARGET_JAMMING
                  end_mitigated_technique_classes
                 effect slb_effect WSF_SLB_EFFECT
                    antenna_pattern    AUX_ANTENNA
                    blanking_threshold 0 dB
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
               end_technique
            end_electronic_protect
         end_receiver
```

- **演示要点**：演示 receiver 的参数：antenna_pattern, bandwidth, electronic_protect

### receiver（blue_ship_mf_radar）｜接收机

- **关键词**：receiver, bandwidth, antenna_pattern, 接收机
- **出处**：`base_types/sensors/radar/blue_ship_mf_radar.txt:140-143`　（同签名共 14 处，另见 `base_types/sensors/radar/red_missile_seeker_1.txt:58`、`new_guidance/sensors/radar/helicopter_surface_search_radar_1.txt:64`、`new_guidance/sensors/radar/red_missile_seeker.txt:50`）
- **片段**：

```text
  receiver
    bandwidth         1.666 mhz
    antenna_pattern   BLUE_SHIP_MF_RADAR_ANTENNA_PATTERN
  end_receiver
```

- **演示要点**：演示 receiver 的参数：bandwidth, antenna_pattern

### receiver（generic_radar_10nm）｜接收机

- **关键词**：receiver, detection_threshold, bandwidth, 接收机
- **出处**：`base_types/sensors/radar/generic_radar_10nm.txt:227-230`
- **片段**：

```text
  receiver
    detection_threshold     12 dB     # From Eric Auger
    bandwidth               2 mhz     # From Eric Auger
  end_receiver
```

- **演示要点**：演示 receiver 的参数：detection_threshold, bandwidth

### receiver（red_ciws_radar_1）｜接收机

- **关键词**：receiver, antenna_pattern, noise_figure, 接收机
- **出处**：`ciws/sensors/radar/red_ciws_radar_1.txt:92-95`
- **片段**：

```text
  receiver
     antenna_pattern             RED_CIWS_RADAR_1_ANTENNA     
     noise_figure                 8 db          # stated
  end_receiver
```

- **演示要点**：演示 receiver 的参数：antenna_pattern, noise_figure

### receiver（high_band_esm）｜接收机

- **关键词**：receiver, antenna_pattern, instantaneous_bandwidth, 接收机
- **出处**：`heatmap/sensors/esm_rwr/high_band_esm.txt:19-22`　（同签名共 2 处，另见 `sensor_plot/radar/hm-pass-detect.txt:61`）
- **片段**：

```text
   receiver
      antenna_pattern         ESM_ANTENNA
      instantaneous_bandwidth 1 mhz
   end_receiver
```

- **演示要点**：演示 receiver 的参数：antenna_pattern, instantaneous_bandwidth

### receiver（GPSCommDef）｜接收机

- **关键词**：receiver, antenna_pattern, frequency, 接收机
- **出处**：`satellite_demos/avionics/comm/GPSCommDef.txt:123-126`　（同签名共 2 处，另见 `satellite_demos/avionics/comm/GPSCommDef.txt:135`）
- **片段**：

```text
   receiver
      antenna_pattern                     SATELLITE_NADIR_CONE
      frequency                           1227.6 mhz
   end_receiver
```

- **演示要点**：演示 receiver 的参数：antenna_pattern, frequency

### receiver（spin_scheduler）｜接收机

- **关键词**：receiver, frequency, bandwidth, 接收机
- **出处**：`sensor_demos/spin_scheduler.txt:103-106`
- **片段**：

```text
      receiver   
         frequency 10 ghz
         bandwidth 10 mhz
      end_receiver
```

- **演示要点**：演示 receiver 的参数：frequency, bandwidth

### receiver（hm-jammer-detect-1）｜接收机

- **关键词**：receiver, antenna_pattern, noise_power, 接收机
- **出处**：`sensor_plot/esm/hm-jammer-detect-1.txt:33-36`　（同签名共 4 处，另见 `sensor_plot/esm/hm-jammer-detect-2.txt:33`、`sensor_plot/esm/hm-reverse.txt:22`、`sensor_plot/radar/hm-jammer-detect.txt:37`）
- **片段**：

```text
  receiver
    antenna_pattern constAntenna
    noise_power   -120 dbm
  end_receiver
```

- **演示要点**：演示 receiver 的参数：antenna_pattern, noise_power

### receiver（fighter_sar）｜接收机

- **关键词**：receiver, bandwidth, noise_figure, 接收机
- **出处**：`sensor_plot/sar/fighter_sar.txt:82-86`
- **片段**：

```text
      receiver
         # Assume a matched-filter for a pulse width of 50 us
         bandwidth                     20 khz
         noise_figure                  6.1 absolute
      end_receiver
```

- **演示要点**：演示 receiver 的参数：bandwidth, noise_figure

### receiver（generic_ground_radar）｜接收机

- **关键词**：receiver, antenna_pattern, antenna_tilt, 接收机
- **出处**：`base_types/sensors/radar/generic_ground_radar.txt:160-170`
- **片段**：

```text
  receiver
   # Specify antenna pattern for receiver (see its definition above)
   antenna_pattern      GROUND_RADAR_ANTENNA_PATTERN

   # Enter antenna tilt parameter to specify constant angle of
   #  antenna above horizon for all azimuths of its scan.
   #  antenna_tilt      5 deg             # Actual tilt (optical)
   #  antenna_tilt      4.75 deg          # Adjusted tilt (allowing for 4/3 earth)
   #  antenna_tilt      0 deg             # No tilt (used with double-beamwidth)
   antenna_tilt       5 deg
  end_receiver
```

- **演示要点**：演示 receiver 的参数：antenna_pattern, antenna_tilt

### receiver（esm）｜接收机

- **关键词**：receiver, antenna_pattern, 接收机
- **出处**：`air_to_air/sensors/esm_rwr/esm.txt:48-50`　（同签名共 13 处，另见 `ballistic_missile_shootdown/sensors/radar/blue_abm_ttr.txt:46`、`iads/sensors/radar/ucav_sar.txt:80`、`iads_c2_demos/sensors/ucav_sar.txt:84`）
- **片段**：

```text
      receiver
         antenna_pattern   esm_reciever
      end_receiver
```

- **演示要点**：演示 receiver 的参数：antenna_pattern

### receiver（medium_range_radar_missile）｜接收机

- **关键词**：receiver, bandwidth, 接收机
- **出处**：`air_to_air/weapons/aam/medium_range_radar_missile.txt:79-81`　（同签名共 9 处，另见 `air_to_air/weapons/aam/short_range_ir_missile.txt:78`、`base_types/weapons/aam/medium_range_radar_missile.txt:72`、`behavior_tree/weapons/aam/medium_range_radar_missile.txt:70`）
- **片段**：

```text
      receiver
         bandwidth                  1 MHz
      end_receiver
```

- **演示要点**：演示 receiver 的参数：bandwidth

### receiver（noise_cloud）｜接收机

- **关键词**：receiver, noise_power, 接收机
- **出处**：`noise_cloud/noise_cloud.txt:24-26`　（同签名共 4 处，另见 `base_types/sensors/esm_rwr/generic_esm.txt:113`、`base_types/sensors/esm_rwr/generic_esm_sensor.txt:113`、`outer_air_battle/sensors/esm_rwr/generic_esm_sensor.txt:113`）
- **片段**：

```text
         receiver
            noise_power -140 dbw
         end_receiver
```

- **演示要点**：演示 receiver 的参数：noise_power

### receiver（ad_hoc_comm）｜接收机

- **关键词**：receiver, frequency, 接收机
- **出处**：`comm/comms/ad_hoc_comm.txt:58-60`　（同签名共 5 处，另见 `electronic_warfare/false-target_command_center.txt:414`、`hellfire/active_radar_hellfire/hellfire_type.txt:52`、`hellfire/active_radar_hellfire/longbow_type.txt:139`）
- **片段**：

```text
   receiver
      frequency 100 mhz
   end_receiver
```

- **演示要点**：演示 receiver 的参数：frequency

### receiver（jamming_perception）｜接收机

- **关键词**：receiver, beam_tilt, 接收机
- **出处**：`electronic_warfare/jamming_perception.txt:92-94`
- **片段**：

```text
      receiver
         beam_tilt                  65 deg
      end_receiver
```

- **演示要点**：演示 receiver 的参数：beam_tilt

### receiver（hellfire_type）｜接收机

- **关键词**：receiver, wavelength, 接收机
- **出处**：`hellfire/laser_designation_via_dis/hellfire_type.txt:45-47`　（同签名共 4 处，另见 `hellfire/semiactive_laser_hellfire/hellfire_type.txt:45`、`laser_designator/sensors/laser/laser_tracker-1212.txt:22`、`laser_designator/weapons/agm/hellfire.txt:73`）
- **片段**：

```text
      receiver
         wavelength 1.06E-6 microns
      end_receiver
```

- **演示要点**：演示 receiver 的参数：wavelength

### receiver（blue_a2a_radar）｜接收机

- **关键词**：receiver, 接收机
- **出处**：`base_types/sensors/radar/blue_a2a_radar.txt:141-142`　（同签名共 10 处，另见 `base_types/sensors/radar/red_a2a_radar.txt:130`、`draw/sensors/radar/generic_fighter_radar.txt:47`、`heatmap/sensors/radar/striker_radar.txt:28`）
- **片段**：

```text
    receiver
    end_receiver
```

- **演示要点**：演示 receiver（最小结构，无子参数）

### reported_emitter_type（esm_detect_multi_sensor_radar）｜

- **关键词**：reported_emitter_type, type, default_type
- **出处**：`electronic_warfare/esm_detect_multi_sensor_radar.txt:81-97`
- **片段**：

```text
   reported_emitter_type
      type EW_RADAR
         time_to_declare 10 sec
         time_to_reevaluate 20 sec
         #report_type EW_RDR 0.5
         #report_type EW_UNK 0.5
         report_truth
      type ACQ_RADAR
         time_to_declare 5 sec
         time_to_reevaluate 5 sec
         #report_type ACQ_RDR 0.75
         #report_type ACQ_UNK 0.25
         report_truth
      default_type
         time_to_declare 1 sec
         report_truth
   end_reported_emitter_type
```

- **演示要点**：演示 reported_emitter_type 的参数：type, default_type

### reported_emitter_type（esm_detect_multi_beam_radar）｜

- **关键词**：reported_emitter_type, default_type
- **出处**：`electronic_warfare/esm_detect_multi_beam_radar.txt:59-63`　（同签名共 2 处，另见 `electronic_warfare/esm_detect_radar.txt:55`）
- **片段**：

```text
   reported_emitter_type
      default_type
         time_to_declare 10 sec
         report_truth
   end_reported_emitter_type
```

- **演示要点**：演示 reported_emitter_type 的参数：default_type

### reported_target_type（esm_detect_multi_sensor_radar）｜

- **关键词**：reported_target_type, type, default_type
- **出处**：`electronic_warfare/esm_detect_multi_sensor_radar.txt:60-79`
- **片段**：

```text
   reported_target_type
      type EW_RADAR_SITE
         #time_to_declare 20 sec
         #time_to_reevaluate 20 sec
         report_type EW_ACQ_SITE
            emitter EW_RADAR
            emitter ACQ_RADAR
         report_type ACQ_SITE
            emitter ACQ_RADAR
         report_type EW_SITE
            emitter EW_RADAR
      type ACQ_RADAR_SITE
         #time_to_declare 10 sec
         #time_to_reevaluate 10 sec
         report_type ACQ_RDR_SITE 0.75
         report_type ACQ_SITE 0.25
      default_type
         #time_to_declare 1 sec
         report_truth
   end_reported_target_type
```

- **演示要点**：演示 reported_target_type 的参数：type, default_type

### saturation_effect（agile_auto-repeater_jamming）｜

- **关键词**：saturation_effect, no_saturation_effect, duty_cycle_limit_effect, duty_cycle_limit
- **出处**：`electronic_warfare/agile_auto-repeater_jamming.txt:195-199`　（同签名共 16 处，另见 `electronic_warfare/agile_repeater_jamming-rt1.txt:309`、`electronic_warfare/agile_repeater_jamming-rt2.txt:309`、`electronic_warfare/agile_repeater_jamming.txt:320`）
- **片段**：

```text
                    saturation_effect
                       no_saturation_effect
                       duty_cycle_limit_effect
                       duty_cycle_limit 0.8
                    end_saturation_effect
```

- **演示要点**：演示 saturation_effect 的参数：no_saturation_effect, duty_cycle_limit_effect, duty_cycle_limit

### saturation_effect（ew_radar）｜

- **关键词**：saturation_effect, duty_cycle_limit_effect, duty_cycle_limit
- **出处**：`aea_iads/sensors/radar/ew_radar.txt:63-66`　（同签名共 4 处，另见 `electronic_warfare/cover_pulse_jamming.txt:97`、`electronic_warfare/jtos_power.txt:96`、`electronic_warfare/test_false_targets/sensors/radar/ew_radar.txt:95`）
- **片段**：

```text
         saturation_effect
           duty_cycle_limit_effect
           duty_cycle_limit    0.50
        end_saturation_effect
```

- **演示要点**：演示 saturation_effect 的参数：duty_cycle_limit_effect, duty_cycle_limit

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, off, no_debug, location, slew_mode, azimuth_slew_limits, elevation_slew_limits, show_calibration_data, selection_mode, mode_template, frame_time, revisit_time, dwell_time, 传感器
- **出处**：`base_types/sensors/radar/generic_fire_control_radar.txt:148-262`
- **片段**：

```text
sensor GENERIC_FIRE_CONTROL_RADAR WSF_RADAR_SENSOR

  #-- Platform Part Commands
  off                               # default
  no_debug                          # default

  //debug_scheduler
  //debug_tracker

  #-- Articulated Part Commands
  #   Slew mode and limits, yaw, pitch, & roll info goes here
  location                0 0 -20 m
  slew_mode               azimuth_and_elevation
  azimuth_slew_limits     -180.0 degrees  180 degrees
  elevation_slew_limits   -5.0 degrees    85 degrees

  #-- Sensor Level Commands
  show_calibration_data             # display radar characteristics
  selection_mode          multiple  # can have more than one mode active at a time

  #-- Detection Scheduling Commands
  # none at this time

  # Maximum number of targets being engaged: 6
  # Maximum number of missles being guided: 12

  # The mode_template specifies a common set of parameters for
  #   all modes of the radar.
  # Note that individual modes may override the template values.

  mode_template
    # Given that 18 total objects can be tracked,
    #   we'll assume that the dwell time is 1/18 of the revist time.
    #   The value of the revist time is not known so we'll simply assume 1 second.
    #   This will give 'reasonable' track update rates.

    frame_time                    1 sec
    revisit_time                  1 sec
    dwell_time                    0.0555555 sec       # 1/18 sec

    #-- Beam Commands
    transmitter
      antenna_pattern             GENERIC_FIRE_CONTROL_RADAR_ANTENNA_PATTERN
      power                       250 kw
      frequency                   3 ghz
      pulse_repetition_frequency  250 hz
      //internal_loss               10 db
    end_transmitter

    receiver
      antenna_pattern             GENERIC_FIRE_CONTROL_RADAR_ANTENNA_PATTERN
      bandwidth                   1 mhz
      //internal_loss               19 dB
    end_receiver

    swerling_case                 1
    number_of_pulses_integrated   44        # integrated by Marcum-Swerling detector
    detector_law                  square
    probability_of_false_alarm    1.0e-6

    # Field of view is used to cull targets, usually set larger than scan limits
    #    -5  deg detects ships more than 457.19 ft (139.35 m) away
    #   -10 deg detects ships more than 226.85 ft (69.14 m) away
    azimuth_field_of_view         -60.0 deg 60.0 deg
    elevation_field_of_view       -5.0 deg 65.0 deg   # detects surface ships
    //elevation_field_of_view       5.0 deg 65.0 deg    # okay for aircraft

    azimuth_error_sigma           0.03 deg
    elevation_error_sigma         0.03 deg
    //TODO range_error_sigma        2 km
    range_error_sigma             100 m

    #-- Track Formation Commands
    reports_bearing
    reports_elevation
    reports_frequency
    reports_location
    reports_velocity
    reports_iff

  end_mode_template

  mode ACQUIRE
    # Search to acquire tracks
    scan_mode                 azimuth_and_elevation
    azimuth_scan_limits       -4.0 degrees 4.0 degrees
    elevation_scan_limits     -4.0 degrees 4.0 degrees

    # If maximum_request_count > 0 then this mode only responds
    #   to explicit requests as initiated by WsfTaskManager::StartTracking.
    maximum_request_count     1
    track_quality             0.8  # Near 'weapon quality'
    hits_to_establish_track   3 5  # 3 of last 5 scans to establish track
    hits_to_maintain_track    1 5  # 1 of last 5 scans to maintain  track
    on_success                TRACK
  end_mode

  mode TRACK
    # Allow the sensor to continue search processing while also performing tracking.
    # This mode does not 'scan'. The target must be in the beam.
    # If maximum_request_count > 0 then this mode only responds
    #   to explicit requests as initiated by WsfTaskManager::StartTracking.
    maximum_request_count     6
    track_quality             1.0  # 'weapon quality'
    hits_to_establish_track   3 5  # 3 of last 5 scans to establish track
    hits_to_maintain_track    1 5  # Allow 5 seconds of coasting (5th failure will drop)
  end_mode

  #-- Filter commands
  filter WSF_ALPHA_BETA_FILTER
    alpha  0.6
    beta  0.2
  end_filter

end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：off, no_debug, location, slew_mode, azimuth_slew_limits, elevation_slew_limits, show_calibration_data, selection_mode, mode_template, frame_time

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, off, no_debug, scan_mode, slew_mode, azimuth_scan_limits, elevation_scan_limits, maximum_range, azimuth_field_of_view, elevation_field_of_view, show_calibration_data, frame_time, one_m2_detect_range, 传感器
- **出处**：`base_types/sensors/radar/generic_radar_10nm.txt:166-271`
- **片段**：

```text
sensor GENERIC_RADAR_10NM WSF_RADAR_SENSOR

  #-- Platform Part Commands
  off                                         # default
  no_debug                                    # default

  #-- Articulated Part Commands
  #   Set scan_mode (fixed, azimuth, elevation, both, azimuth_and_elevation)
  scan_mode                 both              # Default: fixed

  #   Slew mode and limits, yaw, pitch, & roll info goes here
  slew_mode                 azimuth
  azimuth_scan_limits       -180.0 deg  180.0 deg # Default: -180.0 deg 180.0 deg
  elevation_scan_limits     0.0 deg    5.0 deg    # Default: -90.0 90.0
  //minimum_range           0 nm
  maximum_range             160 nm
  azimuth_field_of_view     -60.0 deg 60.0 deg  # 120 degrees symmetric
  elevation_field_of_view   -22.5 deg 22.5 deg  # 45 degrees symmetric
  //azimuth_slew_limits       -45 deg  45 deg     # Default:  -57.29 deg  57.29 deg
  //elevation_slew_limits     -5 deg  25 deg      # Default: -28.64 deg 28.64 deg

  #-- Sensor Level Commands
  show_calibration_data                 # display radar characteristics

  #-- Detection Scheduling Commands
  # none at this time

  #-- Detection Scheduling Commands
  frame_time  10 sec                    # rotating antenna scan rate = 6 RPM

  # Specify pitch of plane for antenna rotation (Default: 0)
  //pitch                     0 deg

  #-- Beam Commands
  #   NOTE:  Both range_product & one_m2_detect_range force radar equation
  #          to adjust parameters so detection occurs at a specific range.
  #           Use one or the other.
  #   Specify maximum detection range for a target with one square meter
  one_m2_detect_range         10.0 nm

  transmitter
    antenna_pattern           GENERIC_RADAR_10NM_ANTENNA_PATTERN

    # Enter antenna tilt parameter to specify constant angle of
    #    antenna above horizon for all azimuths of its scan.
    //  antenna_tilt            5 deg         # Actual tilt (optical)
    //  antenna_tilt            4.75 deg      # Adjusted tilt (allowing for 4/3 earth)
    //  antenna_tilt            0 deg         # No tilt (used with double-beamwidth)
    antenna_tilt              4.75 deg      # (A) w/ 0.5 deg error

    # NOTE: Any values for peak power and frequency can be entered
    #     when using the simple "cookie-cutter" model because
    #     range for detecting a target of a specified radar
    #     cross section calculated using parameter:
    #     "one_m2_detect_range"
    power                   100 kw    # peak power
    frequency               3 ghz     # nominal S-band frequency
                                      # (for detection & tracking)

  end_transmitter

  receiver
    detection_threshold     12 dB     # From Eric Auger
    bandwidth               2 mhz     # From Eric Auger
  end_receiver

  // signal_processor simple_doppler
     # Default "minimum_doppler_speed" is zero
     # (e.g., minimum_doppler_speed  0 kts)
     # TPS-1D does not do Doppler processing
     // minimum_doppler_speed      0 kts
  // end_signal_processor

  number_of_pulses_integrated   1
  detector_law                  linear
  swerling_case                 4
  probability_of_false_alarm    1.0e-6

  azimuth_error_sigma           0.001 deg
  elevation_error_sigma         0.001 deg
  range_error_sigma             7.0 m

  filter WSF_KALMAN_FILTER
    range_measurement_sigma     1 m
    elevation_measurement_sigma 0.001 deg
    bearing_measurement_sigma   0.001 deg
    process_noise_sigmas_XYZ    1.0 1.0 1.0
  end_filter

  # Default value for "hits_to_establish_track" is 1 1
  # (e.g., hits_to_establish_track  1 1)
  hits_to_establish_track       3 5  // 3 of last 5 scans to establish track

  # Default value for "hits_to_maintain_track" is 1 1
  # (e.g., hits_to_maintain_track  1 1)
  hits_to_maintain_track        1 4  // 1 of last 4 scans to maintain  track

  #-- Track Formation Commands
  reports_bearing
  reports_elevation
  reports_frequency
  reports_location
  reports_range
  reports_velocity

end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：off, no_debug, scan_mode, slew_mode, azimuth_scan_limits, elevation_scan_limits, maximum_range, azimuth_field_of_view, elevation_field_of_view, show_calibration_data

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, off, no_debug, pitch, slew_mode, minimum_range, maximum_range, scan_mode, elevation_scan_limits, azimuth_scan_limits, show_calibration_data, frame_time, detector_law, 传感器
- **出处**：`base_types/sensors/radar/generic_ground_radar.txt:91-199`
- **片段**：

```text
sensor GENERIC_GROUND_RADAR WSF_RADAR_SENSOR

  #-- Platform Part Commands
  off                                     # default
  no_debug                                # default

  #-- Articulated Part Commands
  pitch                     0 deg         # default

  #  slew_mode: [fixed|azimuth|elevation|both|azimuth_and_elevation]
  slew_mode                 azimuth       # default: fixed

  #  slew limits define ability of subsystem to respond to cue
  #  if not cued, then oriented in direction spec'd by yaw, pitch, & roll
  //azimuth_slew_limits     -180 deg 180 deg    # default
  //elevation_slew_limits   -5 deg  90 deg

  #  The minimum_range, maximum_range, and field of view are not required.
  #  They are simply used for quick culling and should be generous.
  #  (i.e. the field_of_view limits should be probably be larger than the
  #  corresponding slew limit because the beam can probably detect things
  #  outside the slew limit).
  minimum_range             0 nm          # default = 0
  maximum_range             160 nm        # set to maximum "scope limit"

  # scan mode: [fixed|azimuth|elevation|both|azimuth_and_elevation]
  scan_mode                 azimuth               # default: fixed
  elevation_scan_limits     0.0 deg 5.0 deg       # default: -90.0 90.0
  azimuth_scan_limits       -180.0 deg 180.0 deg  # default

  #-- Sensor Level Commands
  show_calibration_data                   # display radar characteristics

  #-- Detection Scheduling Commands
  frame_time                10 sec        # set to 6 RPM (A)

  #-- Beam Commands
  detector_law              linear        # [linear|square|log]

  //signal_processor simple_doppler
    # Default "minimum_doppler_speed" is zero
    # TPS-1D does not do Doppler processing
    // minimum_doppler_speed      0 kts
  //end_signal_processor

  number_of_pulses_integrated   1
  one_m2_detect_range           65 km
  probability_of_false_alarm    1.0e-6    # Default: 1.0e-8
  swerling_case                 4         # Swerling model: [0|1|2|3|4]

  transmitter
  antenna_pattern     GROUND_RADAR_ANTENNA_PATTERN

   # Enter antenna tilt parameter to specify constant angle of
   #  antenna above horizon for all azimuths of its scan.
   #  antenna_tilt      5 deg             # Actual tilt (optical)
   #  antenna_tilt      4.75 deg          # Adjusted tilt (allowing for 4/3 earth)
   #  antenna_tilt      0 deg             # No tilt (used with double-beamwidth)
   antenna_tilt       4.75 deg            # (A) w/ 0.5 deg error

   # NOTE: Any values for peak power and frequency can be entered
   #    when using the simple "cookie-cutter" model because
   #    range for detecting a target of a specified radar
   #    cross section calculated using parameter: "one_m2_detect_range"
   power              100 kw              # nominal peak power of radar transmitter
   frequency          3 ghz               # nominal frequency of radar transmitter

  end_transmitter

  receiver
   # Specify antenna pattern for receiver (see its definition above)
   antenna_pattern      GROUND_RADAR_ANTENNA_PATTERN

   # Enter antenna tilt parameter to specify constant angle of
   #  antenna above horizon for all azimuths of its scan.
   #  antenna_tilt      5 deg             # Actual tilt (optical)
   #  antenna_tilt      4.75 deg          # Adjusted tilt (allowing for 4/3 earth)
   #  antenna_tilt      0 deg             # No tilt (used with double-beamwidth)
   antenna_tilt       5 deg
  end_receiver

  #-- Track Formation Commands
  azimuth_error_sigma     0.001 deg
  elevation_error_sigma   0.001 deg
  range_error_sigma       7.0 m

  # Default value for "hits_to_establish_track" is 1 1
  hits_to_establish_track   3 5           # 3 of last 5 scans to establish track

  # Default value for "hits_to_maintain_track" is 1 1
  hits_to_maintain_track    1 4           # 1 of last 4 scans to maintain  track

  #-- Track Formation Commands
  reports_location
  reports_velocity
  reports_range
  reports_bearing
  reports_elevation
  reports_signal_to_noise
  reports_frequency
  //reports_side

  #-- Track Filter Commands
  filter WSF_ALPHA_BETA_FILTER
   alpha  0.4
   beta   0.1
  end_filter

end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：off, no_debug, pitch, slew_mode, minimum_range, maximum_range, scan_mode, elevation_scan_limits, azimuth_scan_limits, show_calibration_data

### sensor · WSF_OTH_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_OTH_RADAR_SENSOR, solar_characteristics, day_of_year, hour_of_day, ionospheric_characteristics, electron_temperature, electron_density_at_max, electron_height_at_max, reflection_height, ionosphere_constrains_minimum_range, scan_mode, azimuth_scan_limits, elevation_scan_limits, 传感器
- **出处**：`oth_radar/sensors/radar/oth_radar.txt:26-74`
- **片段**：

```text
sensor OTH_RADAR_1 WSF_OTH_RADAR_SENSOR
  //debug
  solar_characteristics
    day_of_year                182
    hour_of_day                12
  end_solar_characteristics

  ionospheric_characteristics
    electron_temperature       1540
    electron_density_at_max    4.0e11
    electron_height_at_max     250 km
    reflection_height          300 km
    ionosphere_constrains_minimum_range  true
  end_ionospheric_characteristics

  scan_mode                    azimuth_and_elevation
  azimuth_scan_limits          -60 deg 60 deg
  elevation_scan_limits        0 deg 35 deg

  frame_time 	               5 sec

  minimum_range               100 nm
  signal_processor simple_doppler
    minimum_doppler_speed       30 kts
  end_signal_processor
  transmitter
    power                      1000 kw
    frequency                  10  mhz
    bandwidth                  0.1 mhz
    antenna_pattern            OTH_RADAR_ANTENNA
    antenna_height             50 m
  end_transmitter

  receiver
    bandwidth                  0.1 mhz
  end_receiver

  noise_environment quiet_rural

  reports_location
  reports_velocity
  reports_signal_to_noise
  reports_range
  reports_bearing
  reports_elevation

  hits_to_establish_track 3 5
  hits_to_maintain_track  2 3
end_sensor
```

- **演示要点**：演示 WSF_OTH_RADAR_SENSOR 的参数：solar_characteristics, day_of_year, hour_of_day, ionospheric_characteristics, electron_temperature, electron_density_at_max, electron_height_at_max, reflection_height, ionosphere_constrains_minimum_range, scan_mode

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, off, no_debug, slew_mode, show_calibration_data, selection_mode, mode_template, maximum_range, one_m2_detect_range, signal_processor, transmitter, receiver, reports_bearing, 传感器
- **出处**：`base_types/sensors/radar/generic_bomber_radar.txt:60-155`
- **片段**：

```text
sensor GENERIC_BOMBER_RADAR WSF_RADAR_SENSOR

  #-- Platform Part Commands
  off                                 # default
  no_debug                            # default

  #-- Articulated Part Commands
  #   Slew mode and limits, yaw, pitch, & roll info goes here
  slew_mode           azimuth_and_elevation

  #-- Sensor Level Commands
  show_calibration_data               # display radar characteristics

  #-- Detection Scheduling Commands
  # none at this time

  #-- Sensor Commands
  selection_mode            multiple  # Allow both the acquisition and tracking...

  mode_template

    #-- Antenna Commands
    maximum_range           40 km     # max scope range

    #-- Beam Commands
    one_m2_detect_range     40 km

    signal_processor simple_doppler
      minimum_doppler_speed   11 m/s    # (~25 mph) ground targets
    end_signal_processor

    transmitter
      antenna_pattern       GENERIC_BOMBER_RADAR_ANTENNA_PATTERN
      power                 5 mw
      frequency             3 ghz
      pulse_repetition_frequency 250 hz
      internal_loss         10 db
    end_transmitter

    receiver
      antenna_pattern       GENERIC_BOMBER_RADAR_ANTENNA_PATTERN
      bandwidth             1.6 mhz
      detection_threshold   13 db
      noise_power           -150 dbw
      internal_loss         10 db
    end_receiver

    #-- Track Formation Commands
    reports_bearing
    reports_elevation
    reports_frequency
    reports_iff
    reports_location
    reports_velocity
    reports_type
  end_mode_template

  # The sensor will go into ACQUIRE mode when it is turned-on.
  initial_mode                ACQUIRE

  mode ACQUIRE
    # This mode searchs to acquire tracks.
    scan_mode                 azimuth_and_elevation
    frame_time                8 sec
    hits_to_establish_track   4 4
    track_quality             0.7
    hits_to_maintain_track    1 8
  end_mode

  mode TRACK
    # Allow the sensor to continue search processing while also performing tracking.
    search_while_track
    maximum_request_count     3
    revisit_time              4 sec
    track_quality             1.0

    # Actual START-LOCKON-DELAY is 5 sec, but it must be adjusted to a
    #   multiple of the revisit time. Requiring one hit will result in a
    #   4 second delay.
    # The same thing goes for MAX-COAST-TIME. Allowing 2 misses will
    #   give an 8 second delay.
    # SUPPRESSOR does essentially the same thing, but it may round up
    #   (so maybe it should be 1 of 4???)

    hits_to_establish_track    1 3
    hits_to_maintain_track     1 3

    establish_track_probability 0.600       # INITIAL-LOCK-PROB
    maintain_track_probability  0.925       # CONTINUE-TRACK-PROB

    //START-LOCKON-DELAY      5.0 sec
    //MAX-COAST-TIME          10.0 sec
    //POST-LOCKON-S/N-DELAY   4.0 sec
  end_mode

end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：off, no_debug, slew_mode, show_calibration_data, selection_mode, mode_template, maximum_range, one_m2_detect_range, signal_processor, transmitter

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, one_m2_detect_range, hits_to_establish_track, frame_time, maximum_request_count, revisit_time, search_while_track, location, slew_mode, scan_mode, maximum_range, transmitter, antenna_pattern, 传感器
- **出处**：`suppressor/sensors/radar/sam_radar.txt:22-70`
- **片段**：

```text
sensor SAM_RADAR WSF_RADAR_SENSOR
  #show_calibration_data
  one_m2_detect_range          30 km

  hits_to_establish_track      2 2

  frame_time                   6 sec

  maximum_request_count        1
  revisit_time                 3 sec
  search_while_track

  location                     0 0 -6 m

  slew_mode                    both
  scan_mode                    both

  maximum_range                40 km

  transmitter
    antenna_pattern            SAM_RDR_TX_ANTENNA
    power                      5 mw
    frequency                  3 ghz
    pulse_repetition_frequency 250 hz
    internal_loss              10 db
  end_transmitter

  receiver
    antenna_pattern            SAM_RDR_RX_ANTENNA
    bandwidth                  1.6 mhz
    detection_threshold        10 db
    noise_power                -150 dbw
    internal_loss              10 db
  end_receiver

  # For now the filter is required if we're to report velocity
  filter WSF_KALMAN_FILTER
    range_measurement_sigma     1 m
    elevation_measurement_sigma 0.001 deg
    bearing_measurement_sigma   0.001 deg
    process_noise_sigmas_XYZ    1.0 1.0 1.0
  end_filter

  reports_location
  reports_velocity
  reports_iff
  reports_bearing
  reports_type
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：one_m2_detect_range, hits_to_establish_track, frame_time, maximum_request_count, revisit_time, search_while_track, location, slew_mode, scan_mode, maximum_range

### sensor · WSF_ESM_SENSOR｜传感器

- **关键词**：sensor, WSF_ESM_SENSOR, off, no_debug, azimuth_slew_limits, elevation_slew_limits, mode_template, frame_time, reports_range, reports_bearing, reports_location, reports_velocity, reports_elevation, reports_signal_to_noise, 传感器
- **出处**：`outer_air_battle/sensors/esm_rwr/generic_esm_sensor.txt:57-130`
- **片段**：

```text
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

- **演示要点**：演示 WSF_ESM_SENSOR 的参数：off, no_debug, azimuth_slew_limits, elevation_slew_limits, mode_template, frame_time, reports_range, reports_bearing, reports_location, reports_velocity

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, one_m2_detect_range, hits_to_establish_track, frame_time, scan_mode, maximum_range, transmitter, antenna_pattern, power, frequency, pulse_repetition_frequency, internal_loss, receiver, 传感器
- **出处**：`suppressor/sensors/radar/bomber_radar.txt:29-69`
- **片段**：

```text
sensor BOMBER_RADAR WSF_RADAR_SENSOR
  one_m2_detect_range          40 km

  hits_to_establish_track      4 4

  frame_time                   6 sec

  scan_mode                    azimuth_and_elevation

  maximum_range                40 km

  transmitter
    antenna_pattern            BOMBER_RDR_TX_ANTENNA
    power                      5 mw
    frequency                  3 ghz
    pulse_repetition_frequency 250 hz
    internal_loss              10 db
  end_transmitter

  receiver
    antenna_pattern            BOMBER_RDR_RX_ANTENNA
    bandwidth                  1.6 mhz
    detection_threshold        13 db
    noise_power                -150 dbw
    internal_loss              10 db
  end_receiver

  # For now the filter is required if we're to report velocity
  filter WSF_ALPHA_BETA_FILTER
    alpha 0.6
    beta  0.2
  end_filter

  reports_location
  reports_velocity
  reports_bearing
  reports_iff
  reports_type

  processor sensor_processor
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：one_m2_detect_range, hits_to_establish_track, frame_time, scan_mode, maximum_range, transmitter, antenna_pattern, power, frequency, pulse_repetition_frequency

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, one_m2_detect_range, hits_to_establish_track, frame_time, maximum_request_count, search_while_track, scan_mode, maximum_range, transmitter, antenna_pattern, power, frequency, pulse_repetition_frequency, 传感器
- **出处**：`suppressor/weapons/sam/missile.txt:29-69`
- **片段**：

```text
sensor MISSILE_RADAR WSF_RADAR_SENSOR
  one_m2_detect_range          25 km

  hits_to_establish_track      3 3

  frame_time                   1 sec

  maximum_request_count        1
  search_while_track

  scan_mode                    both

  maximum_range                25 km

  transmitter
    antenna_pattern            MISSILE_RDR_TX_ANTENNA
    power                      1 mw
    frequency                  14.8 ghz
    pulse_repetition_frequency 250 hz
    internal_loss              10 db
  end_transmitter

  receiver
    antenna_pattern            MISSILE_RDR_RX_ANTENNA
    bandwidth                  1.6 mhz
    detection_threshold        3 db
    noise_power                -160 dbw
    internal_loss              10 db
  end_receiver

  # for now the filter is required if we're to report velocity
  filter WSF_ALPHA_BETA_FILTER
    alpha 0.6
    beta  0.2
  end_filter

  reports_location
  reports_velocity
  reports_bearing
  reports_type
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：one_m2_detect_range, hits_to_establish_track, frame_time, maximum_request_count, search_while_track, scan_mode, maximum_range, transmitter, antenna_pattern, power

### sensor · WSF_ESM_SENSOR｜传感器

- **关键词**：sensor, WSF_ESM_SENSOR, off, no_debug, azimuth_slew_limits, elevation_slew_limits, mode_template, frame_time, reports_range, reports_bearing, reports_location, reports_velocity, reports_elevation, reports_signal_to_noise, 传感器
- **出处**：`base_types/sensors/esm_rwr/generic_esm.txt:57-128`　（同签名共 2 处，另见 `base_types/sensors/esm_rwr/generic_esm_sensor.txt:57`）
- **片段**：

```text
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

  #-- Filter Commands
  filter WSF_ALPHA_BETA_FILTER
  alpha 0.4
  beta  0.1
  end_filter

end_sensor
```

- **演示要点**：演示 WSF_ESM_SENSOR 的参数：off, no_debug, azimuth_slew_limits, elevation_slew_limits, mode_template, frame_time, reports_range, reports_bearing, reports_location, reports_velocity

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, frame_time, location, scan_mode, minimum_range, maximum_range, transmitter, receiver, swerling_case, number_of_pulses_integrated, detector_law, probability_of_false_alarm, azimuth_error_sigma, 传感器
- **出处**：`script_demos/script_demo_2.txt:49-86`　（同签名共 6 处，另见 `script_demos/script_demo_5.txt:89`、`script_demos/script_demo_6.txt:146`、`script_demos/script_demo_7.txt:243`）
- **片段**：

```text
sensor EARLY_WARNING_SENSOR WSF_RADAR_SENSOR
  frame_time  10 sec
  location  0.0 0.0 -30 ft
  scan_mode  azimuth
  minimum_range    0 nm
  maximum_range  160 nm
  transmitter
     antenna_pattern EARLY_WARNING_RADAR_ANTENNA
     antenna_tilt  5 deg
     power  500 kw
     pulse_width                 2.0e-6 sec
     pulse_repetition_frequency  400 hz
     frequency  1285 mhz
  end_transmitter
  receiver
     antenna_pattern EARLY_WARNING_RADAR_ANTENNA
     antenna_tilt  5 deg
     bandwidth  1 mhz
     internal_loss  19 dB
  end_receiver
  swerling_case  1
  number_of_pulses_integrated  44
  detector_law  square
  probability_of_false_alarm  1.0e-6
  azimuth_error_sigma  0.5 deg
  elevation_error_sigma  0.0 deg
  range_error_sigma  1.2 nm
  filter WSF_ALPHA_BETA_FILTER
    alpha  0.6
    beta   0.2
  end_filter
  hits_to_establish_track  3 5
  hits_to_maintain_track  1 3
  reports_location
  reports_signal_to_noise
  reports_range
  reports_bearing
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：frame_time, location, scan_mode, minimum_range, maximum_range, transmitter, receiver, swerling_case, number_of_pulses_integrated, detector_law

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, on, azimuth_field_of_view, elevation_field_of_view, maximum_range, frame_time, scan_mode, slew_mode, azimuth_slew_limits, elevation_slew_limits, track_quality, reports_range, reports_bearing, 传感器
- **出处**：`p6dof/sensors/generic_seeker.txt:14-55`　（同签名共 2 处，另见 `six_dof/sensors/generic_seeker.txt:14`）
- **片段**：

```text
sensor GENERIC_SEEKER WSF_GEOMETRIC_SENSOR

   on
   azimuth_field_of_view     -5 degrees 5 degrees
   elevation_field_of_view   -5 degrees 5 degrees
   maximum_range             200 nm
   frame_time                0.01 sec

   scan_mode                 both
   slew_mode                 both

   azimuth_slew_limits       -120.0 deg 120.0 deg
   elevation_slew_limits      -90.0 deg  90.0 deg

   track_quality 1.0

   reports_range
   reports_bearing
   reports_elevation
   reports_range_rate
   reports_iff
   reports_location
   reports_velocity
   reports_range_rate
   reports_iff
   reports_side
   reports_type
#  reports_signal_to_noise
#  reports_frequency
#  reports_pulsewidth
#  reports_pulse_repetition_interval

   ignore_same_side
#  ignore_domain air
   ignore_domain surface
   ignore_domain subsurface
   ignore_domain space

   hits_to_establish_track 2 3
   hits_to_maintain_track  1 4

end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：on, azimuth_field_of_view, elevation_field_of_view, maximum_range, frame_time, scan_mode, slew_mode, azimuth_slew_limits, elevation_slew_limits, track_quality

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, on, no_debug, slew_mode, azimuth_slew_limits, elevation_slew_limits, scan_mode, azimuth_scan_limits, elevation_scan_limits, minimum_range, maximum_range, frame_time, transmitter, 传感器
- **出处**：`shooter/sensors/radar/generic_file_control_radar.txt:19-62`
- **片段**：

```text
sensor GENERIC_FIRE_CONTROL_RADAR WSF_RADAR_SENSOR
#  off                               # default
   on
  no_debug                          # default
#  debug
  slew_mode               azimuth_and_elevation
  azimuth_slew_limits     -45.0 degrees  45 degrees
  elevation_slew_limits   -45.0 degrees  45 degrees
  scan_mode               azimuth_and_elevation
  azimuth_scan_limits     -15 degrees  15 degrees
  elevation_scan_limits   -15 degrees  15 degrees

  minimum_range                 2  km
  maximum_range                 90  km

#  show_calibration_data             # display radar characteristics
  frame_time                    1 sec

  transmitter
      antenna_pattern             GENERIC_FIRE_CONTROL_RADAR_ANTENNA_PATTERN
      power                       250 kw
      frequency                   3 ghz
      pulse_repetition_frequency  250 hz
      pulse_width		  8 usec
  end_transmitter

  receiver
     antenna_pattern             GENERIC_FIRE_CONTROL_RADAR_ANTENNA_PATTERN
     bandwidth                   1 mhz
  end_receiver

  azimuth_error_sigma           0.3 deg
  elevation_error_sigma         0.3 deg
  range_error_sigma             4 m

    #-- Track Formation Commands
  reports_bearing
  reports_elevation
  reports_location
  reports_velocity
  track_quality             1.0  # Perfect track quality
  hits_to_establish_track   2 2  # 2 of last 3 scans to establish track
  hits_to_maintain_track    1 2  # 1 of last 2 scans to maintain  track
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：on, no_debug, slew_mode, azimuth_slew_limits, elevation_slew_limits, scan_mode, azimuth_scan_limits, elevation_scan_limits, minimum_range, maximum_range

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, one_m2_detect_range, maximum_range, antenna_height, frame_time, scan_mode, azimuth_scan_limits, elevation_scan_limits, transmitter, receiver, probability_of_false_alarm, required_pd, swerling_case, 传感器
- **出处**：`orwaca_iads/sensors/radar/sr_sam_acq_radar_sensor.txt:17-61`　（同签名共 5 处，另见 `orwaca_iads/sensors/radar/lr_sam_acq_radar_sensor.txt:17`、`orwaca_iads/sensors/radar/mr_sam_acq_radar_sensor.txt:17`、`cyber/sensors/radar/sr_sam_acq_radar_sensor.txt:19`）
- **片段**：

```text
sensor SR_SAM_ACQ_RADAR_SENSOR WSF_RADAR_SENSOR

   one_m2_detect_range            20 nm
   maximum_range                  30 nm
   antenna_height                 3.0 m

   frame_time                     2.0 sec

   scan_mode                      azimuth_and_elevation
   azimuth_scan_limits            -180 deg 180 deg
   elevation_scan_limits          0.0 deg 50.0 deg

   transmitter
      antenna_pattern             SR_SAM_ACQ_RADAR_ANTENNA
      power                       1000.0 kw
      frequency                   4520 mhz  // NATO C BAND
      internal_loss               2 db
   end_transmitter

   receiver
      antenna_pattern             SR_SAM_ACQ_RADAR_ANTENNA
      bandwidth                   2.0 mhz
      noise_power                 -160 dBw  // will be calibrated for 1 m^2
      internal_loss               7 dB
   end_receiver

   probability_of_false_alarm     1.0e-6
   required_pd                    0.5
   swerling_case                  1

   hits_to_establish_track        2 5
   hits_to_maintain_track         1 3

   azimuth_error_sigma     1.2 deg
   elevation_error_sigma   1.2 deg
   range_error_sigma       60.0 m

   track_quality                  0.6
   // This is a 3D radar
   reports_range
   reports_bearing
   reports_elevation
   reports_location
   reports_iff
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：one_m2_detect_range, maximum_range, antenna_height, frame_time, scan_mode, azimuth_scan_limits, elevation_scan_limits, transmitter, receiver, probability_of_false_alarm

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, off, no_debug, scan_mode, antenna_tilt, azimuth_scan_limits, elevation_scan_limits, azimuth_field_of_view, elevation_field_of_view, show_calibration_data, frame_time, one_m2_detect_range, signal_processor, 传感器
- **出处**：`base_types/sensors/radar/blue_ship_mf_radar.txt:101-152`
- **片段**：

```text
sensor BLUE_SHIP_MF_RADAR WSF_RADAR_SENSOR

  #-- Platform Part Commands
  off                         // default
  no_debug                    // default

  #-- Articulated Part Commands
  #   Slew mode and limits, yaw, pitch, & roll info goes here
  scan_mode                   azimuth_and_elevation
  antenna_tilt                15 deg
  azimuth_scan_limits         -60.0 deg 60.0 deg
  elevation_scan_limits       -45.0 deg 45.0 deg
  # Field of view is used to cull targets, usually set larger than scan limits
  #   -5  deg detects ships more than 457.19 ft (139.35 m) away
  #   -10 deg detects ships more than 226.85 ft (69.14 m) away
  azimuth_field_of_view       -60.0 deg 60.0 deg
  // elevation_field_of_view    5.0 deg 65.0 deg    // okay for aircraft
  elevation_field_of_view     -5.0 deg 65.0 deg   // detects surface ships

  #-- Sensor Level Commands
  show_calibration_data                     // display radar characteristics

  #-- Detection Scheduling Commands
  frame_time                  4.0 sec

  #-- Beam Commands
  one_m2_detect_range 800 nm

  signal_processor simple_doppler
     //minimum_doppler_speed       35.0 kts
     minimum_doppler_speed       25.0 kts      // slightly less than patrol boat
  end_signal_processor

  transmitter
    frequency         3287 mhz
    power             0.1 MW                // GUESS: could not find in available data
    antenna_pattern   BLUE_SHIP_MF_RADAR_ANTENNA_PATTERN
  end_transmitter

  receiver
    bandwidth         1.666 mhz
    antenna_pattern   BLUE_SHIP_MF_RADAR_ANTENNA_PATTERN
  end_receiver

  #-- Track Formation Commands
  reports_bearing
  reports_elevation
  reports_frequency
  reports_location
  reports_velocity

end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：off, no_debug, scan_mode, antenna_tilt, azimuth_scan_limits, elevation_scan_limits, azimuth_field_of_view, elevation_field_of_view, show_calibration_data, frame_time

### sensor · WSF_IRST_SENSOR｜传感器

- **关键词**：sensor, WSF_IRST_SENSOR, off, no_debug, azimuth_field_of_view, elevation_field_of_view, frame_time, maximum_range, atmospheric_attenuation, background_radiance, band, noise_equivalent_irradiance, detection_threshold, azimuth_error_sigma, 传感器
- **出处**：`base_types/sensors/eo_ir/generic_irst.txt:52-115`
- **片段**：

```text
sensor GENERIC_IRST WSF_IRST_SENSOR

   #-- Platform Part Commands
   off                         # default
   no_debug                    # default

   #-- Articulated Part Commands
   #   Slew mode and limits, yaw, pitch, & roll info goes here

   #-- Antenna Commands
   azimuth_field_of_view   -45 deg 45 deg
   elevation_field_of_view -45 deg 45 deg

   #-- Detection Scheduling Commands
   frame_time              0.5 seconds
   maximum_range           50 nm

   #-- IRST Sensor Mode Commands

   # atmospheric_attenuation is a very simple-minded approach to modeling
   #   propagation.  It can also be thought of as the 'rate_of_extinction'.
   #   This should include the effects of scattering and absorbance.
   #
   # In reality the propagation would have to consider the wavelength of
   #   the spectral content, the scattering and absorbsion coefficients as a
   #   function of altitude and wavelength as well as environmental effects
   #   such as dust, humidity, etc.
   atmospheric_attenuation   0.05 per km

   # Background_radiance is a very simple-minded approach to modeling
   #   the background radiance.  In reality it is a function of many
   #   variables time of day (and hence, sun position), temperature, and many
   #   other environmental effects.
   background_radiance       500 microwatts/cm^2/sr

   # Set operating band of the sensor as one of following:
   #     short       1 -  3 microns
   #     medium      3 -  5 microns
   #     long        8 - 12 microns
   #     very_long  15 - 30 microns
   band                      medium

   # Noise Equivalent Irradiance (NEI) is the receiver noise.
   #    The ratio of computed 'signal' and this value must exceed the value of
   #    'detection_threshold' for a detection to be declared.
   noise_equivalent_irradiance  1.0E-12 w/cm^2

   # detection_threshold is the signal/noise required for detection.
   detection_threshold         3.0

   #-- Track Formation Commands
   azimuth_error_sigma         0.001 deg
   elevation_error_sigma       0.001 deg
   range_error_sigma           7.0 m
   hits_to_establish_track     3 5  #-- 3 of last 5 scans to establish track
   hits_to_maintain_track      1 4  #-- 1 of last 4 scans to maintain  track

   reports_range
   reports_bearing
   reports_elevation
   reports_location
   reports_signal_to_noise
   reports_velocity
end_sensor
```

- **演示要点**：演示 WSF_IRST_SENSOR 的参数：off, no_debug, azimuth_field_of_view, elevation_field_of_view, frame_time, maximum_range, atmospheric_attenuation, background_radiance, band, noise_equivalent_irradiance

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, pitch, frame_time, maximum_range, electronic_beam_steering, electronic_beam_steering_limit, electronic_beam_steering_loss_exponent, scan_mode, azimuth_scan_limits, elevation_scan_limits, transmitter, receiver, detection_threshold, 传感器
- **出处**：`ballistic_missile_shootdown/sensors/radar/blue_abm_ttr.txt:25-61`　（同签名共 2 处，另见 `space_operations/sensors/blue_abm_ttr.txt:25`）
- **片段**：

```text
sensor BLUE_ABM_TTR WSF_RADAR_SENSOR

   pitch                               45 deg
   frame_time                          1 sec
   # This is just for culling purposes
   maximum_range                       2500 km              # Increased for this demo

   electronic_beam_steering            azimuth_and_elevation
   electronic_beam_steering_limit      70 deg               # Typical for phased-array
   electronic_beam_steering_loss_exponent 1.4               # Typical for phased-array

   scan_mode                           azimuth_and_elevation
   azimuth_scan_limits                 -70 deg 70 deg       # Same as steering limits
   elevation_scan_limits               -70 deg 70 deg       # Same as steering limits

   transmitter
      antenna_pattern                  BLUE_ABM_TTR_ANTENNA
      frequency                        10 ghz               # Ref 1, 8-12 ghz
      power                            200 kw
   end_transmitter

   receiver
      antenna_pattern                  BLUE_ABM_TTR_ANTENNA
   end_receiver

   detection_threshold                 12.8 db              # Nominal Swerling case 1, Pd=0.5
   one_m2_detect_range                 1500 km              # Ref 1

   hits_to_establish_track             2 3
   hits_to_maintain_track              1 3
   track_quality                       1 # weapons grade high quality track
   reports_range
   reports_bearing
   reports_elevation
   reports_velocity
   reports_iff
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：pitch, frame_time, maximum_range, electronic_beam_steering, electronic_beam_steering_limit, electronic_beam_steering_loss_exponent, scan_mode, azimuth_scan_limits, elevation_scan_limits, transmitter

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, on, azimuth_field_of_view, elevation_field_of_view, maximum_range, frame_time, scan_mode, slew_mode, track_quality, reports_range, reports_bearing, reports_elevation, reports_range_rate, 传感器
- **出处**：`p6dof/sensors/simple_generic_seeker.txt:14-54`　（同签名共 2 处，另见 `six_dof/sensors/simple_generic_seeker.txt:14`）
- **片段**：

```text
sensor SIMPLE_GENERIC_SEEKER WSF_GEOMETRIC_SENSOR

   on
#  azimuth_field_of_view     -120 degrees 120 degrees
#  elevation_field_of_view    -90 degrees  90 degrees
   azimuth_field_of_view     -80 degrees 80 degrees
   elevation_field_of_view   -80 degrees 80 degrees
   maximum_range             200 nm
   frame_time                0.01 sec

   scan_mode                 both
   slew_mode                 both

   track_quality 1.0

   reports_range
   reports_bearing
   reports_elevation
   reports_range_rate
   reports_iff
   reports_location
   reports_velocity
   reports_range_rate
   reports_iff
   reports_side
   reports_type
#  reports_signal_to_noise
#  reports_frequency
#  reports_pulsewidth
#  reports_pulse_repetition_interval

   ignore_same_side
#  ignore_domain air
   ignore_domain surface
   ignore_domain subsurface
   ignore_domain space

   hits_to_establish_track 2 3
   hits_to_maintain_track  1 4

end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：on, azimuth_field_of_view, elevation_field_of_view, maximum_range, frame_time, scan_mode, slew_mode, track_quality, reports_range, reports_bearing

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, one_m2_detect_range, antenna_height, frame_time, maximum_range, scan_mode, azimuth_scan_limits, elevation_scan_limits, transmitter, receiver, probability_of_false_alarm, required_pd, swerling_case, 传感器
- **出处**：`cyber/sensors/radar/uhf_ew_radar_sensor.txt:22-70`　（同签名共 2 处，另见 `swarm/sensors/radar/uhf_ew_radar_sensor.txt:22`）
- **片段**：

```text
sensor UHF_EW_RADAR_SENSOR WSF_RADAR_SENSOR

   one_m2_detect_range            220.0 nm

   antenna_height                   6.0 m

   frame_time                       5.0 sec

   maximum_range                  300 nmi

   scan_mode                      azimuth
   azimuth_scan_limits        -180 deg 180 deg
   elevation_scan_limits         0.0 deg 35.0 deg

   transmitter
      antenna_pattern             UHF_EW_RADAR_ANTENNA
      #beam_tilt                    10.0 deg
      power                       1000.0 kw
      frequency                    200 mhz
      internal_loss                  2 db
      pulse_repetition_frequency   400 Hz
      pulse_width                    0.6 usec
   end_transmitter

   receiver
      antenna_pattern             UHF_EW_RADAR_ANTENNA
      beam_tilt                   10.0 deg
      bandwidth                   30.0 mhz
      noise_power               -160 dBw  # will be calibrated for 1 m^2 anyway
      internal_loss                7 dB
   end_receiver

   probability_of_false_alarm     1.0e-6
   required_pd                    0.5
   swerling_case                  1

   azimuth_error_sigma       1 deg
   elevation_error_sigma     0.5 deg
   range_error_sigma       100.0 m

   hits_to_establish_track        3 5
   hits_to_maintain_track         1 3

   track_quality 0.75         # This sensor produces a relatively low fidelity track.

   reports_location
   reports_velocity
   reports_iff
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：one_m2_detect_range, antenna_height, frame_time, maximum_range, scan_mode, azimuth_scan_limits, elevation_scan_limits, transmitter, receiver, probability_of_false_alarm

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, one_m2_detect_range, maximum_range, antenna_height, frame_time, scan_mode, azimuth_scan_limits, elevation_scan_limits, transmitter, receiver, swerling_case, probability_of_false_alarm, required_pd, 传感器
- **出处**：`electronic_warfare/track_drop_maintain_effect.txt:112-162`　（同签名共 2 处，另见 `electronic_warfare/track_effect_1.txt:97`）
- **片段**：

```text
sensor EW_RADAR WSF_RADAR_SENSOR
   #show_calibration_data

   one_m2_detect_range           100.0 nm
   maximum_range                 120 nm

   antenna_height                6.0 m

   frame_time                    1.0 sec

   scan_mode                     azimuth_and_elevation
   azimuth_scan_limits           -180 deg 180 deg
   elevation_scan_limits         -1 deg 85 deg

   transmitter
      antenna_pattern            EW_RADAR_ANTENNA
      beam_tilt                  0.0 deg
      power                      100.0 kw
      frequency                  9500 mhz
      pulse_width                25 usec
      pulse_repetition_interval  1250 usec
      internal_loss              2 db
   end_transmitter

   receiver
      beam_tilt                  10.0 deg
      bandwidth                  2.0 mhz
      noise_power                -160 dBw  # will be calibrated for 1 m^2
      internal_loss              7 dB

      electronic_protect EW_RADAR_EP end_electronic_protect
   end_receiver

   # Swerling detector
   swerling_case                 1
   probability_of_false_alarm    1.0e-6
   required_pd                   0.5
   number_of_pulses_integrated   16

  filter WSF_ALPHA_BETA_FILTER
    alpha 0.4
    beta  0.1
  end_filter

   hits_to_establish_track       1 1   # 3 of last 5 scans to establish track
   hits_to_maintain_track        1 1   # 1 of last 3 scans to maintain  track

  reports_location
  reports_velocity
  reports_signal_to_noise
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：one_m2_detect_range, maximum_range, antenna_height, frame_time, scan_mode, azimuth_scan_limits, elevation_scan_limits, transmitter, receiver, swerling_case

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, antenna_height, frame_time, scan_mode, azimuth_scan_limits, elevation_scan_limits, transmitter, receiver, clutter, signal_processor, swerling_case, detector_law, probability_of_false_alarm, 传感器
- **出处**：`base_types/sensors/radar/pd_radar.txt:20-74`
- **片段**：

```text
sensor PD_RADAR WSF_RADAR_SENSOR
   #show_calibration_data

   antenna_height                10.0 m

   frame_time                    10.0 sec

   scan_mode                     azimuth_and_elevation
   azimuth_scan_limits           -180 deg 180 deg
   elevation_scan_limits         -5 deg 88 deg

   transmitter
      antenna_pattern            PD_RADAR_ANTENNA
      polarization               vertical
      power                      100.0 kw
      frequency                  4000 mhz
      pulse_width                10 usec
      pulse_repetition_frequency 10 khz
      internal_loss              2 db
   end_transmitter

   receiver
      bandwidth                  0.02 mhz
      internal_loss              6 dB
      antenna_ohmic_loss         0.0 db
      noise_figure               3 db
      receive_line_loss          2 db
   end_receiver

   clutter PD_RADAR_CLUTTER

   signal_processor pulse_doppler
      //debug
      pd_num_filters             64
      pd_num_filter_poles        5
      pd_filter_bandwidth        1 156.25 hz
      pd_filter_slr              60.0 db
   end_signal_processor

   # Swerling detector
   swerling_case                 1
   detector_law                  square
   probability_of_false_alarm    1.0e-6
   required_pd                   0.9
   number_of_pulses_integrated   64

   hits_to_establish_track       3 5   # 3 of last 5 scans to establish track
   hits_to_maintain_track        1 3   # 1 of last 3 scans to maintain  track

   reports_range
   reports_bearing
   reports_velocity
   reports_range_rate
   reports_signal_to_noise
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：antenna_height, frame_time, scan_mode, azimuth_scan_limits, elevation_scan_limits, transmitter, receiver, clutter, signal_processor, swerling_case

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, one_m2_detect_range, maximum_range, antenna_height, frame_time, scan_mode, azimuth_scan_limits, false_target_screener, transmitter, receiver, swerling_case, probability_of_false_alarm, required_pd, 传感器
- **出处**：`electronic_warfare/cover_pulse_jamming.txt:114-170`　（同签名共 2 处，另见 `electronic_warfare/jtos_power.txt:113`）
- **片段**：

```text
sensor EW_RADAR WSF_RADAR_SENSOR
   #show_calibration_data

   one_m2_detect_range           100.0 nm
   maximum_range                 120 nm

   antenna_height                6.0 m

   frame_time                    10.0 sec

   scan_mode                     azimuth
   azimuth_scan_limits           -180 deg 180 deg

  false_target_screener SCREENER_1 WSF_FT_SCREENER
     track_capacity    50
     plot_capacity     100
     transfer_capacity 50
  end_false_target_screener

   transmitter
      antenna_pattern            EW_RADAR_ANTENNA
      beam_tilt                  10.0 deg
      power                      100.0 kw
      frequency                  200 mhz
      pulse_width                25 usec
      pulse_repetition_interval  1250 usec
      internal_loss              2 db
   end_transmitter

   receiver
      beam_tilt                  10.0 deg
      bandwidth                  2.0 mhz
      noise_power                -160 dBw  # will be calibrated for 1 m^2
      internal_loss              7 dB

      electronic_protect EW_RADAR_EP
      end_electronic_protect
   end_receiver

   # Swerling detector
   swerling_case                 1
   probability_of_false_alarm    1.0e-6
   required_pd                   0.5
   number_of_pulses_integrated   16

  filter WSF_ALPHA_BETA_FILTER
    alpha 0.4
    beta  0.1
  end_filter

   hits_to_establish_track       3 5   # 3 of last 5 scans to establish track
   hits_to_maintain_track        1 3   # 1 of last 3 scans to maintain  track

   reports_range
   reports_bearing
   reports_signal_to_noise
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：one_m2_detect_range, maximum_range, antenna_height, frame_time, scan_mode, azimuth_scan_limits, false_target_screener, transmitter, receiver, swerling_case

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, show_calibration_data, antenna_height, frame_time, scan_mode, azimuth_scan_limits, transmitter, receiver, clutter, signal_processor, swerling_case, detector_law, probability_of_false_alarm, 传感器
- **出处**：`base_types/sensors/radar/mti_radar.txt:20-78`　（同签名共 2 处，另见 `base_types/sensors/radar/mtd_radar.txt:20`）
- **片段**：

```text
sensor MTI_RADAR WSF_RADAR_SENSOR
   show_calibration_data

   antenna_height                10.0 m

   frame_time                    10.0 sec

   scan_mode                     azimuth_and_elevation
   azimuth_scan_limits           -180 deg 180 deg

   transmitter
      antenna_pattern            MTI_RADAR_ANTENNA
      beam_tilt                  1.0 deg
      polarization               vertical
      power                      1000.0 kw
      frequency                  1325 mhz
      pulse_width                50 usec
      pulse_repetition_frequency 750 hz
      internal_loss              2 db
      pulse_compression_ratio    13 absolute
   end_transmitter

   receiver
      beam_tilt                  1.0 deg
      bandwidth                  0.3 mhz
      internal_loss              6 dB
      antenna_ohmic_loss         0.0 db
      noise_figure               3 db
      receive_line_loss          2 db
   end_receiver

   clutter MTI_RADAR_CLUTTER

   signal_processor moving_target_indicator
      debug
      mti_switch                 on
      mti_num_delays             4
      mti_min_response           32 dB
      mti_num_gates              1
      mti_range_limits           1 0 km 500 km
      mti_angle_limits           1 -180 deg 180 deg
   end_signal_processor

   # Swerling detector
   swerling_case                 1
   detector_law                  square
   probability_of_false_alarm    1.0e-6
   required_pd                   0.5
   number_of_pulses_integrated   10

   hits_to_establish_track       3 5   # 3 of last 5 scans to establish track
   hits_to_maintain_track        1 3   # 1 of last 3 scans to maintain  track

   reports_range
   reports_bearing
   reports_velocity
   reports_range_rate
   reports_signal_to_noise
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：show_calibration_data, antenna_height, frame_time, scan_mode, azimuth_scan_limits, transmitter, receiver, clutter, signal_processor, swerling_case

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, one_m2_detect_range, antenna_height, frame_time, scan_mode, azimuth_scan_limits, false_target_screener, transmitter, receiver, compute_measurement_errors, continuous_jamming_perception_threshold, pulsed_jamming_perception_threshold, swerling_case, 传感器
- **出处**：`aea_iads/sensors/radar/ew_radar.txt:88-149`
- **片段**：

```text
sensor EW_RADAR WSF_RADAR_SENSOR
   one_m2_detect_range            100.0 nm

   antenna_height                 6.0 m

   frame_time                     20.0 sec

   scan_mode                      azimuth
   azimuth_scan_limits            -180 deg 180 deg

   false_target_screener SCREENER WSF_FT_SCREENER
      track_capacity     500
      plot_capacity      100
      transfer_capacity  100
      allow_track_reporting_when_flooded false
      force_target_tracks
         range_force  inside_blip_range
         #sector_force 45 deg 3
      end_force_target_tracks
   end_false_target_screener

   transmitter
      antenna_pattern             EW_RADAR_ANTENNA
      polarization                horizontal
      beam_tilt                   10.0 deg
      power                       1000.0 kw
      frequency                   200 mhz
      frequency_channels          150 mhz 10 mhz 200 mhz
      pulse_width                   50 usec
      pulse_repetition_interval   1250 usec
      internal_loss               2 db
   end_transmitter

   receiver
      antenna_pattern             EW_RADAR_ANTENNA
      beam_tilt                   10.0 deg
      bandwidth                   2.0 mhz
      noise_power                 -160 dBw  # will be calibrated for 1 m^2
      internal_loss               7 dB

      electronic_protect EW_RADAR_EP end_electronic_protect
   end_receiver

   compute_measurement_errors true

   continuous_jamming_perception_threshold 15 db
   pulsed_jamming_perception_threshold     15 db

   swerling_case                  1
   probability_of_false_alarm     1.0e-6
   required_pd                    0.5
   number_of_pulses_integrated    32

   hits_to_establish_track        3 5
   hits_to_maintain_track         1 3

   track_quality 0.5         # This sensor produces a relatively low fidelity track.

   reports_range
   reports_bearing
   reports_iff
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：one_m2_detect_range, antenna_height, frame_time, scan_mode, azimuth_scan_limits, false_target_screener, transmitter, receiver, compute_measurement_errors, continuous_jamming_perception_threshold

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, on, azimuth_field_of_view, elevation_field_of_view, maximum_range, frame_time, range_error_sigma, range_rate_error_sigma, azimuth_error_sigma, elevation_error_sigma, reports_location, reports_velocity, reports_range_rate, 传感器
- **出处**：`air_to_air/platforms/lte_fighter.txt:187-215`　（同签名共 2 处，另见 `air_to_air/platforms/lte_fighter.txt:298`）
- **片段**：

```text
   sensor eyes WSF_GEOMETRIC_SENSOR
      on
      azimuth_field_of_view   -180.0 degrees  180.0 degrees
      elevation_field_of_view -90.0  degrees  90.0  degrees
      maximum_range           10 nmi
      frame_time              1 sec
      range_error_sigma       1000 ft
      range_rate_error_sigma  50 m/s
      azimuth_error_sigma     1 deg
      elevation_error_sigma   1 deg
      reports_location 
      reports_velocity 
      reports_range_rate
      reports_range
      reports_bearing 
      reports_elevation 
      reports_iff
      internal_link raw_data_mgr
      ignore_same_side
      ignore missile
#      filter WSF_KALMAN_FILTER
#         process_noise_model      constant_acceleration
#         process_noise_sigmas_XYZ 50 10 50          # AFSIM recommended values for high agility aircraft
#      end_filter
      filter WSF_KALMAN_FILTER
         process_noise_model      constant_velocity
         process_noise_sigmas_XYZ 2 2 2          # AFSIM recommended values for high agility aircraft
      end_filter
   end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：on, azimuth_field_of_view, elevation_field_of_view, maximum_range, frame_time, range_error_sigma, range_rate_error_sigma, azimuth_error_sigma, elevation_error_sigma, reports_location

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, category, one_m2_detect_range, antenna_height, frame_time, scan_mode, azimuth_scan_limits, elevation_scan_limits, send_track_drop_on_turn_off, transmitter, receiver, probability_of_false_alarm, required_pd, 传感器
- **出处**：`iads_c2_demos/sensors/acq_radar.txt:28-71`
- **片段**：

```text
sensor ACQ_RADAR WSF_RADAR_SENSOR

   category TAR

   one_m2_detect_range            50.0 nm

   antenna_height                 5.0 m

   frame_time                     10.0 sec

   scan_mode                      azimuth_and_elevation
   azimuth_scan_limits            -180 deg 180 deg
   elevation_scan_limits          0.0 deg 50.0 deg

   send_track_drop_on_turn_off    true # typically want this on TAR and TTR radars so we get the appropriate drop tracks SM offs

   transmitter
      antenna_pattern             ACQ_RADAR_ANTENNA
      power                       1000.0 kw
      frequency                   3000 mhz
      internal_loss               2 db
   end_transmitter

   receiver
      antenna_pattern             ACQ_RADAR_ANTENNA
      bandwidth                   2.0 mhz
      noise_power                 -160 dBw  # will be calibrated for 1 m^2
      internal_loss               7 dB
   end_receiver

   probability_of_false_alarm     1.0e-6
   required_pd                    0.5
   swerling_case                  1

   hits_to_establish_track        3 5
   hits_to_maintain_track         1 3

   track_quality                  0.8      # 'weapons' cue quality

   reports_range
   reports_bearing
   reports_elevation
   reports_iff
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：category, one_m2_detect_range, antenna_height, frame_time, scan_mode, azimuth_scan_limits, elevation_scan_limits, send_track_drop_on_turn_off, transmitter, receiver

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, one_m2_detect_range, antenna_height, frame_time, maximum_range, scan_mode, transmitter, pulse_repetition_frequency, receiver, probability_of_false_alarm, required_pd, swerling_case, azimuth_error_sigma, 传感器
- **出处**：`orwaca_iads/sensors/radar/s-band_ew_radar_sensor.txt:21-64`　（同签名共 3 处，另见 `orwaca_iads/sensors/radar/uhf_ew_radar_sensor.txt:21`、`orwaca_iads/sensors/radar/vhf_ew_radar_sensor.txt:21`）
- **片段**：

```text
sensor S-BAND_EW_RADAR_SENSOR WSF_RADAR_SENSOR

   one_m2_detect_range            100.0 nm
   antenna_height                 6.0 m
   frame_time                     10.0 sec
   maximum_range                  150 nmi
   scan_mode                      azimuth
      azimuth_scan_limits         -180 deg 180 deg
      elevation_scan_limits        0.0 deg 35.0 deg

   transmitter
      antenna_pattern             S-BAND_EW_RADAR_ANTENNA
      beam_tilt                   10.0 deg
      power                       1000.0 kw
      frequency                   2500 mhz
      internal_loss               2 db
	   pulse_repetition_frequency  400 Hz
   end_transmitter

   receiver
      antenna_pattern             S-BAND_EW_RADAR_ANTENNA
      beam_tilt                   10.0 deg
      bandwidth                   2.0 mhz
      noise_power                 -160 dBw  // will be calibrated for 1 m^2 anyway
      internal_loss               7 dB
   end_receiver

   probability_of_false_alarm     1.0e-6
   required_pd                    0.5
   swerling_case                  1

   azimuth_error_sigma     0.3 deg
   elevation_error_sigma   0.3 deg
   range_error_sigma       100.0 m

   hits_to_establish_track        3 5
   hits_to_maintain_track         1 3

   track_quality 0.5         // This sensor produces a relatively low fidelity track.

   reports_range
   reports_bearing
   reports_iff
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：one_m2_detect_range, antenna_height, frame_time, maximum_range, scan_mode, transmitter, pulse_repetition_frequency, receiver, probability_of_false_alarm, required_pd

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, one_m2_detect_range, antenna_height, frame_time, scan_mode, azimuth_scan_limits, elevation_scan_limits, transmitter, receiver, probability_of_false_alarm, required_pd, swerling_case, number_of_pulses_integrated, 传感器
- **出处**：`aea_iads/sensors/radar/acq_radar.txt:37-83`
- **片段**：

```text
sensor ACQ_RADAR WSF_RADAR_SENSOR

   one_m2_detect_range            50.0 nm

   antenna_height                 5.0 m

   frame_time                     10.0 sec

   scan_mode                      azimuth_and_elevation
   azimuth_scan_limits            -180 deg 180 deg
   elevation_scan_limits          0.0 deg 50.0 deg

   transmitter
      antenna_pattern             ACQ_RADAR_ANTENNA
      power                       1000.0 kw
      frequency                   3000 mhz
      internal_loss               2 db
      pulse_width                 35 usec
      pulse_repetition_interval   350 usec
   end_transmitter

   receiver
      antenna_pattern             ACQ_RADAR_ANTENNA
      bandwidth                   2.0 mhz
      noise_power                 -160 dBw  # will be calibrated for 1 m^2
      internal_loss               7 dB

      electronic_protect ACQ_RADAR_EP end_electronic_protect
   end_receiver

   probability_of_false_alarm     1.0e-6
   required_pd                    0.5
   swerling_case                  1
   number_of_pulses_integrated    10

   hits_to_establish_track        3 5
   hits_to_maintain_track         1 3

   compute_measurement_errors true

   track_quality                  0.6      // 'weapons' cue quality

   reports_range
   reports_bearing
   reports_elevation
   reports_iff
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：one_m2_detect_range, antenna_height, frame_time, scan_mode, azimuth_scan_limits, elevation_scan_limits, transmitter, receiver, probability_of_false_alarm, required_pd

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, frame_time, location, scan_mode, azimuth_scan_limits, elevation_field_of_view, minimum_range, maximum_range, one_m2_detect_range, transmitter, receiver, jam_strobe_detector, jamming_perception_threshold, 传感器
- **出处**：`electronic_warfare/jam_strobe_direction_finder.txt:41-87`　（同签名共 2 处，另见 `electronic_warfare/jam_strobe_tracking.txt:80`）
- **片段**：

```text
sensor EW_RADAR WSF_RADAR_SENSOR
   frame_time              10 sec
   location                0.0 0.0 -30 m
   scan_mode               azimuth
   azimuth_scan_limits     -180 deg 180 deg
   elevation_field_of_view -2.5 deg 42.5 deg
   minimum_range           0 nm
   maximum_range           400 km
   one_m2_detect_range     225 km

   transmitter
      antenna_pattern           EW_RADAR_ANTENNA
      antenna_tilt              10 deg
      power                     750 kw
      frequency                 900 mhz
      bandwidth                 0.1 mhz
      pulse_width               10  usec
      pulse_repetition_interval 750 usec
   end_transmitter

   receiver
      antenna_pattern           EW_RADAR_ANTENNA
      antenna_tilt              10  deg
      frequency                 900 mhz
      bandwidth                 1   mhz
   end_receiver

   jam_strobe_detector
      reports_bearing
      #reports_elevation

      gaussian_azimuth_error_sigma 2.0 deg
      jamming_perception_threshold 3 db
   end_jam_strobe_detector

   jamming_perception_threshold 3 db

   hits_to_establish_track 3 5
   hits_to_maintain_track  1 4

   reports_location
   reports_velocity
   reports_signal_to_noise
   reports_range
   reports_bearing
   reports_elevation
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：frame_time, location, scan_mode, azimuth_scan_limits, elevation_field_of_view, minimum_range, maximum_range, one_m2_detect_range, transmitter, receiver

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, frame_time, minimum_range, maximum_range, field_of_view, slew_mode, azimuth_slew_limits, elevation_slew_limits, azimuth_slew_rate, elevation_slew_rate, transmitter, receiver, hits_to_establish_track, 传感器
- **出处**：`ciws/sensors/radar/red_ciws_radar_1.txt:63-112`
- **片段**：

```text
sensor RED_CIWS_RADAR_1 WSF_RADAR_SENSOR
 # show_calibration_data
 # maximum_request_count          1
  
  frame_time  0.01 sec 

  minimum_range                  20 m         # unknown
  maximum_range                  20 km         # unknown

  field_of_view rectangular
     azimuth_field_of_view -180.0 deg 180.0 deg # stated
     elevation_field_of_view -25.0 deg 85.0 deg  # stated
  end_field_of_view

  slew_mode                      azimuth_and_elevation
  azimuth_slew_limits            -180.0 deg 180.0 deg # stated
  elevation_slew_limits          -25.0 deg 85.0 deg  # stated
  azimuth_slew_rate 100 deg/s
  elevation_slew_rate 85 deg/s

  transmitter
     antenna_pattern             RED_CIWS_RADAR_1_ANTENNA
     power                       100.0 kw       # stated
     frequency                   10000 mhz     # stated xband
     pulse_width                 0.8 usec      
     pulse_repetition_frequency  3600 hz       
     polarization                vertical
  end_transmitter

  receiver
     antenna_pattern             RED_CIWS_RADAR_1_ANTENNA     
     noise_figure                 8 db          # stated
  end_receiver

  hits_to_establish_track  2 3                 # unknown
                                               
  hits_to_maintain_track   1 3

  track_quality            1.0    # 'weapons' grade

  ignore_domain subsurface
  ignore_domain space

  azimuth_error_sigma 1.0 mil
  elevation_error_sigma 1.0 mil
  range_error_sigma 1.0 meter  # unknown

  reports_velocity
  reports_location
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：frame_time, minimum_range, maximum_range, field_of_view, slew_mode, azimuth_slew_limits, elevation_slew_limits, azimuth_slew_rate, elevation_slew_rate, transmitter

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, pitch, frame_time, maximum_range, electronic_beam_steering, electronic_beam_steering_limit, electronic_beam_steering_loss_exponent, scan_mode, azimuth_scan_limits, elevation_scan_limits, transmitter, receiver, detection_threshold, 传感器
- **出处**：`base_types/sensors/radar/blue_fcr_radar_1.txt:51-108`　（同签名共 2 处，另见 `base_types/sensors/radar/blue_abm_ttr.txt:40`）
- **片段**：

```text
sensor BLUE_FCR_RADAR_1 WSF_RADAR_SENSOR

   pitch                               67.5 deg             # Ref 2

   frame_time                          1 sec

   # This is just for culling purposes
   maximum_range                       200 km               # Ref 1, plus a little slop

   electronic_beam_steering            azimuth_and_elevation
   electronic_beam_steering_limit      60 deg               # Ref 1, 1/2 of track sector
   electronic_beam_steering_loss_exponent 1.4               # Typical for phased-array

   scan_mode                           azimuth_and_elevation
   azimuth_scan_limits                 -60 deg 60 deg       # Same as steering limits
   elevation_scan_limits               -60 deg 60 deg       # Same as steering limits

   transmitter
      antenna_pattern                  BLUE_FCR_RADAR_1_ANTENNA
      frequency                        6 ghz                # Ref 1, C band (4-8)

      # Nothing was specified about the power. But something must be given so the model
      # can compute a receiver noise power that results in a detection range of 170 km.
      #
      # The actual power isn't important because passive detection of the transmitter is
      # not being considered.

      power                            50 kw

      # We don't know anything else about the transmitted signal (pulse width, PRF,
      # pulse_compression), so nothing is supplied.

   end_transmitter

   receiver
      antenna_pattern                  BLUE_FCR_RADAR_1_ANTENNA

      # We don't know anything about the receiver (noise figure, etc.) The effective
      # noise power is derived by the model to get the required nominal detection range.
      #
      # This will probably result in a ridiculously low effective noise power, but
      # because we don't know anything about the transmitted signal modulation, we just
      # have let it ride. It shouldn't be important because we aren't worried about jamming
      # or passive detection.

   end_receiver

   detection_threshold                 12.8 db              # Nominal Swerling case 1, Pd=0.5
   one_m2_detect_range                 170  km              # Ref 1

   hits_to_establish_track             2 3
   hits_to_maintain_track              1 3
   reports_range
   reports_bearing
   reports_elevation
   reports_velocity
   reports_iff
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：pitch, frame_time, maximum_range, electronic_beam_steering, electronic_beam_steering_limit, electronic_beam_steering_loss_exponent, scan_mode, azimuth_scan_limits, elevation_scan_limits, transmitter

### sensor · WSF_IRST_SENSOR｜传感器

- **关键词**：sensor, WSF_IRST_SENSOR, azimuth_field_of_view, elevation_field_of_view, frame_time, maximum_range, atmospheric_attenuation, background_radiance, band, noise_equivalent_irradiance, detection_threshold, azimuth_error_sigma, elevation_error_sigma, range_error_sigma, 传感器
- **出处**：`multiresolution_demos/sensors/generic_irst.txt:12-70`　（同签名共 2 处，另见 `signature_demos/sensors/generic_irst.txt:12`）
- **片段**：

```text
sensor GENERIC_IRST WSF_IRST_SENSOR
   #-- Articulated Part Commands
   #   Slew mode and limits, yaw, pitch, & roll info goes here

   #-- Antenna Commands
   azimuth_field_of_view   -45 deg 45 deg
   elevation_field_of_view -45 deg 45 deg

   #-- Detection Scheduling Commands
   frame_time              10 sec # 0.5 seconds
   maximum_range           50 nm

   #-- IRST Sensor Mode Commands

   # atmospheric_attenuation is a very simple-minded approach to modeling
   #   propagation.  It can also be thought of as the 'rate_of_extinction'.
   #   This should include the effects of scattering and absorbance.
   #
   # In reality the propagation would have to consider the wavelength of
   #   the spectral content, the scattering and absorbsion coefficients as a
   #   function of altitude and wavelength as well as environmental effects
   #   such as dust, humidity, etc.
   atmospheric_attenuation   0.05 per km

   # Background_radiance is a very simple-minded approach to modeling
   #   the background radiance.  In reality it is a function of many
   #   variables time of day (and hence, sun position), temperature, and many
   #   other environmental effects.
   background_radiance       500 microwatts/cm^2/sr

   # Set operating band of the sensor as one of following:
   #     short       1 -  3 microns
   #     medium      3 -  5 microns
   #     long        8 - 12 microns
   #     very_long  15 - 30 microns
   band                      medium

   # Noise Equivalent Irradiance (NEI) is the receiver noise.
   #    The ratio of computed 'signal' and this value must exceed the value of
   #    'detection_threshold' for a detection to be declared.
   noise_equivalent_irradiance  1.0E-12 w/cm^2

   # detection_threshold is the signal/noise required for detection.
   detection_threshold         3.0

   #-- Track Formation Commands
   azimuth_error_sigma         0.001 deg
   elevation_error_sigma       0.001 deg
   range_error_sigma           7.0 m
   hits_to_establish_track     3 5  #-- 3 of last 5 scans to establish track
   hits_to_maintain_track      1 4  #-- 1 of last 4 scans to maintain  track

   reports_range
   reports_bearing
   reports_elevation
   reports_location
   reports_signal_to_noise
   reports_velocity
end_sensor
```

- **演示要点**：演示 WSF_IRST_SENSOR 的参数：azimuth_field_of_view, elevation_field_of_view, frame_time, maximum_range, atmospheric_attenuation, background_radiance, band, noise_equivalent_irradiance, detection_threshold, azimuth_error_sigma

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, frame_time, location, scan_mode, azimuth_scan_limits, elevation_field_of_view, minimum_range, maximum_range, one_m2_detect_range, transmitter, false_target_screener, receiver, number_of_pulses_integrated, 传感器
- **出处**：`electronic_warfare/repeater_jamming.txt:145-228`　（同签名共 2 处，另见 `electronic_warfare/simple_ft_jamming.txt:92`）
- **片段**：

```text
sensor EW_RADAR WSF_RADAR_SENSOR

   frame_time                10  sec

   # Specify the location and orientation of the sensor on the platform.
   location                  0.0 0.0 -30 m

   # The sensor sweeps only in azimuth
   scan_mode                 azimuth
   azimuth_scan_limits       -180 deg 180 deg

   # The field of view, minimum_range and maximum_range are not required.
   # They are simply used for quick culling and should be generous.
   # (i.e. the field_of_view limits should be probably be larger than the
   # corresponding slew limit because the beam can probably detect things
   # outside the slew limit).
   elevation_field_of_view  -2.5 deg 42.5 deg

   minimum_range        0 nm
   maximum_range      400 km  # really 225 km

   one_m2_detect_range 225 km

   transmitter
      power           750 kw
      frequency       900 mhz
      pulse_width     3  usec
      pulse_repetition_interval    750 usec // max PRI range of 225 km
      antenna_pattern EW_RADAR_ANTENNA
      antenna_tilt     10 deg
   end_transmitter

   false_target_screener SCREENER WSF_FT_SCREENER
      track_capacity              100
      plot_capacity                50
      transfer_capacity            50
   end_false_target_screener

   receiver
      antenna_pattern EW_RADAR_ANTENNA
      antenna_tilt     10 deg
      frequency       900 mhz
      bandwidth         1 mhz
     # To remove SLB: Comment out following electronic_protect block
     electronic_protect
        technique sensor_sidelobe_blanker
           default_on
           mitigated_techniques
              false_target_jamming
           end_mitigated_techniques
           effect slb_effect WSF_SLB_EFFECT
              antenna_pattern    AUX_ANTENNA
              blanking_threshold 0 dB
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
        end_technique
     end_electronic_protect
   end_receiver

   number_of_pulses_integrated 10

   hits_to_establish_track   1 3   # 1 of last 5 scans to establish track
   hits_to_maintain_track    1 4   # 1 of last 4 scans to maintain  track

   reports_location
   reports_velocity
   reports_signal_to_noise
   reports_range
   reports_bearing
   reports_elevation
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：frame_time, location, scan_mode, azimuth_scan_limits, elevation_field_of_view, minimum_range, maximum_range, one_m2_detect_range, transmitter, false_target_screener

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, frame_time, location, scan_mode, azimuth_scan_limits, elevation_field_of_view, minimum_range, maximum_range, one_m2_detect_range, transmitter, receiver, number_of_pulses_integrated, jamming_perception_threshold, 传感器
- **出处**：`electronic_warfare/slc_slb_script_jamming.txt:90-192`
- **片段**：

```text
sensor EW_RADAR WSF_RADAR_SENSOR

   frame_time                10  sec
   # Specify the location and orientation of the sensor on the platform.
   location                  0.0 0.0 -30 m

   # The sensor sweeps only in azimuth
   scan_mode                 azimuth
   azimuth_scan_limits       -180 deg 180 deg

   # The field of view, minimum_range and maximum_range are not required.
   # They are simply used for quick culling and should be generous.
   # (i.e. the field_of_view limits should be probably be larger than the
   # corresponding slew limit because the beam can probably detect things
   # outside the slew limit).
   elevation_field_of_view  -2.5 deg 42.5 deg

   minimum_range        0 nm
   maximum_range      400 km  # really 225 km

   one_m2_detect_range 225 km

   transmitter
      power           750 kw
      frequency       900 mhz
      bandwidth       0.1 mhz
      pulse_width                  3  usec
      pulse_repetition_interval    750 usec // max PRI range of 225 km
      antenna_pattern EW_RADAR_ANTENNA
      antenna_tilt     10 deg
   end_transmitter

   receiver
      antenna_pattern EW_RADAR_ANTENNA
      antenna_tilt     10 deg
      frequency       900 mhz
      bandwidth         1 mhz

      electronic_protect
         debug
         technique sidelobe_blanking
         externally_controlled
         mitigated_technique_classes
            FALSE_TARGET_JAMMING
         end_mitigated_technique_classes

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
         end_technique

         technique sidelobe_cancelation
            externally_controlled
            mitigated_technique_classes
               NOISE_JAMMING
            end_mitigated_technique_classes

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
         end_technique
      end_electronic_protect
   end_receiver

   number_of_pulses_integrated 10

   jamming_perception_threshold 3 db

   hits_to_establish_track   3 5   # 1 of last 5 scans to establish track
   hits_to_maintain_track    1 4   # 1 of last 4 scans to maintain  track

   reports_location
   reports_velocity
   reports_signal_to_noise
   reports_range
   reports_bearing
   reports_elevation
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：frame_time, location, scan_mode, azimuth_scan_limits, elevation_field_of_view, minimum_range, maximum_range, one_m2_detect_range, transmitter, receiver

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, on, azimuth_field_of_view, elevation_field_of_view, maximum_range, frame_time, range_error_sigma, range_rate_error_sigma, azimuth_error_sigma, elevation_error_sigma, reports_location, reports_velocity, reports_range_rate, 传感器
- **出处**：`air_to_air/platforms/lte_fighter.txt:80-100`
- **片段**：

```text
   sensor eyes WSF_GEOMETRIC_SENSOR
      on
      azimuth_field_of_view   -180.0 degrees  180.0 degrees
      elevation_field_of_view -90.0  degrees  90.0  degrees
      maximum_range           10 nmi
      frame_time              1 sec
      range_error_sigma       1000 ft
      range_rate_error_sigma  50 m/s
      azimuth_error_sigma     1 deg
      elevation_error_sigma   1 deg
      reports_location 
      reports_velocity 
      reports_range_rate
      reports_range
      reports_bearing 
      reports_elevation 
      reports_iff
      internal_link raw_data_mgr
      ignore_same_side
      ignore missile
   end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：on, azimuth_field_of_view, elevation_field_of_view, maximum_range, frame_time, range_error_sigma, range_rate_error_sigma, azimuth_error_sigma, elevation_error_sigma, reports_location

### sensor · WSF_EOIR_SENSOR｜传感器

- **关键词**：sensor, WSF_EOIR_SENSOR, frame_time, slew_mode, azimuth_slew_limits, elevation_slew_limits, azimuth_slew_rate, elevation_slew_rate, selection_mode, ignore_same_side, atmospheric_attenuation, band, azimuth_field_of_view, elevation_field_of_view, 传感器
- **出处**：`multiresolution_demos/sensors/generic_eoir.txt:12-37`　（同签名共 2 处，另见 `signature_demos/sensors/generic_eoir.txt:11`）
- **片段**：

```text
sensor GENERIC_EOIR WSF_EOIR_SENSOR
   frame_time                          10 sec     # sample rate
   slew_mode                           azimuth_and_elevation
   azimuth_slew_limits                 -45 deg 45 deg    
   elevation_slew_limits               -45 deg 45 deg    
   azimuth_slew_rate                   5 deg/s
   elevation_slew_rate                 5 deg/s 
   selection_mode single
   ignore_same_side

   atmospheric_attenuation 0.005 per m
   band visual

   azimuth_field_of_view               -45.0 deg 45.0 deg  
   elevation_field_of_view             -45.0 deg 45.0 deg  
   maximum_range                       50 nm
   pixel_count  1000  1000             
   detection_threshold 3   
   track_quality .5
   azimuth_error_sigma 0.45 deg
   elevation_error_sigma  0.45 deg
   reports_other 
   #reports_bearing
   #reports_elevation
   #reports_location
end_sensor
```

- **演示要点**：演示 WSF_EOIR_SENSOR 的参数：frame_time, slew_mode, azimuth_slew_limits, elevation_slew_limits, azimuth_slew_rate, elevation_slew_rate, selection_mode, ignore_same_side, atmospheric_attenuation, band

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, one_m2_detect_range, maximum_range, antenna_height, frame_time, scan_mode, azimuth_scan_limits, elevation_scan_limits, transmitter, receiver, probability_of_false_alarm, required_pd, swerling_case, 传感器
- **出处**：`alternate_locations/sensors/radar/acq_radar.txt:19-56`　（同签名共 2 处，另见 `cyber/sensors/radar/ground_radar.txt:21`）
- **片段**：

```text
sensor ACQ_RADAR WSF_RADAR_SENSOR 
   one_m2_detect_range    50 nm
   maximum_range          150 nm
   antenna_height         5 m
   frame_time             10 s

   scan_mode azimuth_and_elevation
   azimuth_scan_limits    -180 deg 180 deg
   elevation_scan_limits  0 deg 50 deg
   
   transmitter 
      antenna_pattern      ACQ_RADAR_ANTENNA
      power                1000 kw
      frequency            3000 mhz
      internal_loss        2 db
   end_transmitter
   
   receiver  
      antenna_pattern      ACQ_RADAR_ANTENNA
      bandwidth            2 mhz
      noise_power          -150 dbw
      internal_loss        7 db
   end_receiver
   
   probability_of_false_alarm   1e-6
   required_pd                  .5
   swerling_case                1
   
   hits_to_establish_track    3   5
   hits_to_maintain_track     1   5
   
   track_quality             .8
   
   reports_range 
   reports_bearing 
   reports_elevation 
   reports_iff 
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：one_m2_detect_range, maximum_range, antenna_height, frame_time, scan_mode, azimuth_scan_limits, elevation_scan_limits, transmitter, receiver, probability_of_false_alarm

### sensor · WSF_SAR_SENSOR｜传感器

- **关键词**：sensor, WSF_SAR_SENSOR, category, frame_time, dwell_time, image_formation_time, slew_mode, minimum_range, maximum_range, azimuth_field_of_view, elevation_field_of_view, electronic_beam_steering, azimuth_scan_limits, elevation_scan_limits, 传感器
- **出处**：`iads/sensors/radar/ucav_sar.txt:50-92`　（同签名共 2 处，另见 `iads_c2_demos/sensors/ucav_sar.txt:54`）
- **片段**：

```text
sensor SAR_RADAR WSF_SAR_SENSOR
   category                   SAR

   # frame_time                 0.1 sec for pretty graphics
   frame_time                 1 sec

   dwell_time                 0.0555555 sec
   image_formation_time       20 sec

   slew_mode both                         # Temporary - to allow cueing

   minimum_range                1 km
   maximum_range              100 km
   azimuth_field_of_view      -2.5 deg  2.5 deg
   elevation_field_of_view    -2.5 deg  2.5 deg

 	electronic_beam_steering   azimuth_and_elevation
 	azimuth_scan_limits        -75 deg  75 deg
 	elevation_scan_limits      -75 deg  75 deg

   transmitter
      power                   10 kw
      frequency               6 ghz
      antenna_pattern         SAR_ANTENNA

      # The PRF was chosen to give unambiguous range of about 60nm.
      pulse_repetition_frequency       1350 hz

   end_transmitter

   receiver
      antenna_pattern         SAR_ANTENNA
   end_receiver

   one_m2_detect_range        1000 km

   fixed_azimuth_error_sigma     0.00001 deg
   fixed_elevation_error_sigma   0.00001 deg
   fixed_range_error_sigma       1.0 m

   reports_location

end_sensor
```

- **演示要点**：演示 WSF_SAR_SENSOR 的参数：category, frame_time, dwell_time, image_formation_time, slew_mode, minimum_range, maximum_range, azimuth_field_of_view, elevation_field_of_view, electronic_beam_steering

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, frame_time, one_m2_detect_range, maximum_range, slew_mode, azimuth_slew_limits, elevation_slew_limits, scan_mode, azimuth_scan_limits, elevation_scan_limits, transmitter, receiver, hits_to_establish_track, 传感器
- **出处**：`ship_ad/sensors/radar/helicopter_surface_search_radar_1.txt:38-80`　（同签名共 2 处，另见 `new_guidance/sensors/radar/helicopter_surface_search_radar_1.txt:38`）
- **片段**：

```text
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

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：frame_time, one_m2_detect_range, maximum_range, slew_mode, azimuth_slew_limits, elevation_slew_limits, scan_mode, azimuth_scan_limits, elevation_scan_limits, transmitter

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, one_m2_detect_range, antenna_height, frame_time, clutter_model, scan_mode, azimuth_scan_limits, elevation_scan_limits, transmitter, receiver, probability_of_false_alarm, required_pd, swerling_case, 传感器
- **出处**：`sensor_plot/clutter/clutter_table_generation.txt:45-87`　（同签名共 2 处，另见 `sensor_plot/clutter/clutter_table_regneration_test.txt:41`）
- **片段**：

```text
sensor ACQ_RADAR WSF_RADAR_SENSOR
   one_m2_detect_range            50.0 nm

   antenna_height                 5.0 m

   frame_time                     10.0 sec

   clutter_model acq_radar_clutter  // clutter model defined here for the sensor

   scan_mode                      azimuth_and_elevation
   azimuth_scan_limits            -180 deg 180 deg
   elevation_scan_limits          -90.0 deg 90.0 deg

   transmitter
      antenna_pattern             ACQ_RADAR_ANTENNA
      power                       1000.0 kw
      pulse_width                 0.3 microseconds
      pulse_repetition_interval   0.0003 s
      frequency                   3000 mhz
      internal_loss               2 db
   end_transmitter

   receiver
      antenna_pattern             ACQ_RADAR_ANTENNA
      bandwidth                   2.0 mhz
      noise_power                 -160 dBw  # will be calibrated for 1 m^2
      internal_loss               7 dB
   end_receiver

   probability_of_false_alarm     1.0e-6
   required_pd                    0.5
   swerling_case                  1

   hits_to_establish_track        3 5
   hits_to_maintain_track         1 3

   track_quality                  0.8      # 'weapons' cue quality

   reports_range
   reports_bearing
   reports_elevation
   reports_iff
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：one_m2_detect_range, antenna_height, frame_time, clutter_model, scan_mode, azimuth_scan_limits, elevation_scan_limits, transmitter, receiver, probability_of_false_alarm

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, maximum_request_count, frame_time, one_m2_detect_range, maximum_range, slew_mode, azimuth_slew_limits, elevation_slew_limits, scan_mode, azimuth_scan_limits, elevation_scan_limits, transmitter, receiver, 传感器
- **出处**：`shooter/sensors/radar/aa_mrm_radar.txt:38-82`
- **片段**：

```text
sensor AA_MRM_RADAR WSF_RADAR_SENSOR
  #show_calibration_data

  maximum_request_count          1

  frame_time                     .50 sec       # unknown

  one_m2_detect_range            25 km         # from aa_mrm.txt documentation

  maximum_range                  30 km         # unknown

  slew_mode                      azimuth_and_elevation   # Ref 1
  azimuth_slew_limits            -30.0 deg 30.0 deg      # Ref 1
  elevation_slew_limits          -20.0 deg 10.0 deg      # Ref 1

  scan_mode                      azimuth_and_elevation
  azimuth_scan_limits            -30.0 deg 30.0 deg
  elevation_scan_limits          -20.0 deg 10.0 deg

  transmitter
     antenna_pattern             AA_MRM_RADAR_ANTENNA
     power                       500 w         # unknown
     frequency                   9000 mhz      # assuming X-band
     pulse_width                 1.0 usec      # unknown
     pulse_repetition_frequency  3600 hz       # unknown
  end_transmitter

  receiver
     antenna_pattern             AA_MRM_RADAR_ANTENNA
     bandwidth                   1.0 mhz       # use inverse of pulse width
  end_receiver


  filter AA_MRM_RADAR_FILTER_TACTICS
  end_filter

  hits_to_establish_track  2 3    # make it easy
  hits_to_maintain_track   1 3    # make it real easy

  track_quality            1.0    # 'weapons' grade

  reports_range
  reports_bearing
  reports_elevation
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：maximum_request_count, frame_time, one_m2_detect_range, maximum_range, slew_mode, azimuth_slew_limits, elevation_slew_limits, scan_mode, azimuth_scan_limits, elevation_scan_limits

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, maximum_request_count, frame_time, one_m2_detect_range, maximum_range, slew_mode, azimuth_slew_limits, elevation_slew_limits, scan_mode, azimuth_scan_limits, elevation_scan_limits, transmitter, receiver, 传感器
- **出处**：`base_types/sensors/radar/red_missile_seeker_1.txt:31-76`　（同签名共 3 处，另见 `new_guidance/sensors/radar/red_missile_seeker.txt:23`、`ship_ad/sensors/radar/red_missile_seeker_1.txt:32`）
- **片段**：

```text
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

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：maximum_request_count, frame_time, one_m2_detect_range, maximum_range, slew_mode, azimuth_slew_limits, elevation_slew_limits, scan_mode, azimuth_scan_limits, elevation_scan_limits

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, maximum_request_count, frame_time, one_m2_detect_range, antenna_height, minimum_range, maximum_range, slew_mode, azimuth_slew_limits, elevation_slew_limits, transmitter, receiver, hits_to_establish_track, 传感器
- **出处**：`new_guidance/sensors/radar/sr_sam_fcr_1.txt:36-82`　（同签名共 2 处，另见 `ship_ad/sensors/radar/sr_sam_fcr_1.txt:36`）
- **片段**：

```text
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

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：maximum_request_count, frame_time, one_m2_detect_range, antenna_height, minimum_range, maximum_range, slew_mode, azimuth_slew_limits, elevation_slew_limits, transmitter

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, one_m2_detect_range, maximum_range, antenna_height, frame_time, scan_mode, azimuth_scan_limits, transmitter, receiver, swerling_case, probability_of_false_alarm, required_pd, number_of_pulses_integrated, 传感器
- **出处**：`electronic_warfare/closely_space_targets.txt:42-100`
- **片段**：

```text
sensor EW_RADAR WSF_RADAR_SENSOR
   #show_calibration_data

   one_m2_detect_range           100.0 nm
   maximum_range                 120 nm

   antenna_height                6.0 m

   frame_time                    1.0 sec

   scan_mode                     azimuth
   azimuth_scan_limits           -180 deg 180 deg

   transmitter
      antenna_pattern            EW_RADAR_ANTENNA
      beam_tilt                  10.0 deg
      power                      100.0 kw
      frequency                  200 mhz
      pulse_width                25 usec
      pulse_repetition_interval  1250 usec
      internal_loss              2 db
   end_transmitter

   receiver
      beam_tilt                  10.0 deg
      bandwidth                  2.0 mhz
      noise_power                -160 dBw  # will be calibrated for 1 m^2
      internal_loss              7 dB
   end_receiver

   # Swerling detector
   swerling_case                 1
   probability_of_false_alarm    1.0e-6
   required_pd                   0.5
   number_of_pulses_integrated   32

   hits_to_establish_track       3 5   # 3 of last 5 scans to establish track
   hits_to_maintain_track        1 3   # 1 of last 3 scans to maintain  track

   close_target_detection
      #debug
      acquire_deltas
         azimuth_delta       0.2 deg
         elevation_delta     0.2 deg
         range_delta         5 m
      end_acquire_deltas

      reacquire_deltas
         azimuth_delta       0.25 deg
         elevation_delta     0.25 deg
         range_delta         1000 m
      end_reacquire_deltas
   end_close_target_detection
   
   reports_range
   reports_bearing
   reports_velocity
   reports_signal_to_noise
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：one_m2_detect_range, maximum_range, antenna_height, frame_time, scan_mode, azimuth_scan_limits, transmitter, receiver, swerling_case, probability_of_false_alarm

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, one_m2_detect_range, maximum_range, antenna_height, frame_time, scan_mode, azimuth_scan_limits, transmitter, false_target_screener, receiver, swerling_case, probability_of_false_alarm, required_pd, 传感器
- **出处**：`electronic_warfare/false-target_jamming_1.txt:126-184`　（同签名共 5 处，另见 `electronic_warfare/false-target_jamming_2.txt:121`、`electronic_warfare/false-target_jamming_3.txt:126`、`electronic_warfare/false-target_jamming_4.txt:124`）
- **片段**：

```text
sensor EW_RADAR WSF_RADAR_SENSOR
   #show_calibration_data

   one_m2_detect_range           100.0 nm
   maximum_range                 120 nm

   antenna_height                6.0 m

   frame_time                    10.0 sec

   scan_mode                     azimuth
   azimuth_scan_limits           -180 deg 180 deg

   transmitter
      antenna_pattern            EW_RADAR_ANTENNA
      beam_tilt                  10.0 deg
      power                      100.0 kw
      frequency                  200 mhz
      pulse_width                25 usec
      pulse_repetition_interval  1250 usec
      internal_loss              2 db
   end_transmitter

   false_target_screener SCREENER_1 WSF_FT_SCREENER
      #debug
      track_capacity     100
      plot_capacity      100
      transfer_capacity  100
      allow_track_reporting_when_flooded false
      force_target_tracks
         range_force  inside_blip_range
         #sector_force 45 deg 3
      end_force_target_tracks
   end_false_target_screener

   receiver
      beam_tilt                  10.0 deg
      bandwidth                  2.0 mhz
      noise_power                -160 dBw  # will be calibrated for 1 m^2
      internal_loss              7 dB

      electronic_protect EW_RADAR_EP
      end_electronic_protect
   end_receiver

   # Swerling detector
   swerling_case                 1
   probability_of_false_alarm    1.0e-6
   required_pd                   0.5
   number_of_pulses_integrated   32

   hits_to_establish_track       3 5   # 3 of last 5 scans to establish track
   hits_to_maintain_track        1 3   # 1 of last 3 scans to maintain  track

   reports_range
   reports_bearing
   reports_velocity
   reports_signal_to_noise
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：one_m2_detect_range, maximum_range, antenna_height, frame_time, scan_mode, azimuth_scan_limits, transmitter, false_target_screener, receiver, swerling_case

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, one_m2_detect_range, antenna_height, frame_time, scan_mode, azimuth_scan_limits, elevation_scan_limits, false_target_screener, transmitter, receiver, probability_of_false_alarm, required_pd, swerling_case, 传感器
- **出处**：`electronic_warfare/test_false_targets/sensors/radar/acq_radar.txt:29-89`
- **片段**：

```text
sensor ACQ_RADAR WSF_RADAR_SENSOR

   one_m2_detect_range            50.0 nm

   antenna_height                 5.0 m

   frame_time                     10.0 sec

   scan_mode                      azimuth_and_elevation
   azimuth_scan_limits            -180 deg 180 deg
   elevation_scan_limits          0.0 deg 50.0 deg

   false_target_screener SCREENER WSF_FT_SCREENER
      #debug
      track_capacity     1000
      plot_capacity      1000
      transfer_capacity  1000
   end_false_target_screener

   transmitter
      antenna_pattern             ACQ_RADAR_ANTENNA
      power                       1000.0 kw
      frequency                   3000 mhz
      internal_loss               2 db
      pulse_width                 350 usec
      pulse_repetition_interval    35 usec
   end_transmitter

   receiver
      antenna_pattern             ACQ_RADAR_ANTENNA
      bandwidth                   2.0 mhz
      noise_power                 -160 dBw  # will be calibrated for 1 m^2
      internal_loss               7 dB

      electronic_protect
         technique pulse_suppression
            mitigated_techniques
               random_pulse_jamming
            end_mitigated_techniques
            effect ps_effect WSF_PULSE_SUPPRESS_EFFECT
               reject pulses 0.05
            end_effect
         end_technique
      end_electronic_protect

   end_receiver

   probability_of_false_alarm     1.0e-6
   required_pd                    0.5
   swerling_case                  1

   hits_to_establish_track        3 5
   hits_to_maintain_track         1 3

   track_quality                  0.6      // 'weapons' cue quality

   reports_range
   reports_bearing
   reports_elevation
   reports_iff
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：one_m2_detect_range, antenna_height, frame_time, scan_mode, azimuth_scan_limits, elevation_scan_limits, false_target_screener, transmitter, receiver, probability_of_false_alarm

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, one_m2_detect_range, antenna_height, frame_time, scan_mode, azimuth_scan_limits, elevation_scan_limits, transmitter, receiver, probability_of_false_alarm, required_pd, swerling_case, hits_to_establish_track, 传感器
- **出处**：`cyber/exfiltrate_demo/sensors/radar/acq_radar.txt:23-62`　（同签名共 2 处，另见 `iads/sensors/radar/acq_radar.txt:23`）
- **片段**：

```text
sensor ACQ_RADAR WSF_RADAR_SENSOR

   one_m2_detect_range            50.0 nm

   antenna_height                 5.0 m

   frame_time                     10.0 sec

   scan_mode                      azimuth_and_elevation
   azimuth_scan_limits            -180 deg 180 deg
   elevation_scan_limits          0.0 deg 50.0 deg

   transmitter
      antenna_pattern             ACQ_RADAR_ANTENNA
      power                       1000.0 kw
      frequency                   3000 mhz
      internal_loss               2 db
   end_transmitter

   receiver
      antenna_pattern             ACQ_RADAR_ANTENNA
      bandwidth                   2.0 mhz
      noise_power                 -160 dBw  # will be calibrated for 1 m^2
      internal_loss               7 dB
   end_receiver

   probability_of_false_alarm     1.0e-6
   required_pd                    0.5
   swerling_case                  1

   hits_to_establish_track        3 5
   hits_to_maintain_track         1 3

   track_quality                  0.6      // 'weapons' cue quality

   reports_range
   reports_bearing
   reports_elevation
   reports_iff
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：one_m2_detect_range, antenna_height, frame_time, scan_mode, azimuth_scan_limits, elevation_scan_limits, transmitter, receiver, probability_of_false_alarm, required_pd

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, on, update_interval, frame_time, hits_to_establish_track, hits_to_maintain_track, track_quality, reports_range, reports_bearing, reports_elevation, reports_location, reports_velocity, reports_type, 传感器
- **出处**：`engage/radars/mar.txt:23-64`
- **片段**：

```text
sensor MAR WSF_RADAR_SENSOR
   on
   update_interval                  .01 s
   frame_time                       .01 s
   hits_to_establish_track          1 32
   hits_to_maintain_track           1 32
   track_quality                    1.0
   reports_range
   reports_bearing
   reports_elevation
   reports_location
   reports_velocity
   reports_type
   ignore_same_side
   ignore_domain land
   ignore_domain space
   ignore_domain subsurface
   ignore_domain surface
   scan_mode azimuth_and_elevation

   selection_mode single

   transmitter
      antenna_pattern   MAR_ANTENNA
      power             5 kw
      frequency         3 ghz
      internal_loss     2 db
      electronic_beam_steering azimuth_and_elevation
      electronic_beam_steering_limit 90 deg
      antenna_height 1 m
   end_transmitter

   receiver
      antenna_pattern    MAR_ANTENNA
      bandwidth          500.0 khz
      noise_power        -100 dBw
      internal_loss      7 db
      electronic_beam_steering azimuth_and_elevation
      electronic_beam_steering_limit 90 deg
      antenna_height 1 m
   end_receiver
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：on, update_interval, frame_time, hits_to_establish_track, hits_to_maintain_track, track_quality, reports_range, reports_bearing, reports_elevation, reports_location

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, category, one_m2_detect_range, antenna_height, frame_time, scan_mode, azimuth_scan_limits, transmitter, receiver, probability_of_false_alarm, required_pd, swerling_case, hits_to_establish_track, 传感器
- **出处**：`iads_c2_demos/sensors/ew_radar.txt:28-70`
- **片段**：

```text
sensor EW_RADAR WSF_RADAR_SENSOR

   category EW

   one_m2_detect_range            100.0 nm

   antenna_height                 6.0 m

   frame_time                     20.0 sec

   scan_mode                      azimuth
   azimuth_scan_limits            -180 deg 180 deg

   transmitter
      antenna_pattern             EW_RADAR_ANTENNA
      beam_tilt                   10.0 deg
      power                       1000.0 kw
      frequency                   200 mhz
      internal_loss               2 db
   end_transmitter

   receiver
      antenna_pattern             EW_RADAR_ANTENNA
      beam_tilt                   10.0 deg
      bandwidth                   2.0 mhz
      noise_power                 -160 dBw  # will be calibrated for 1 m^2
      internal_loss               7 dB
   end_receiver

   probability_of_false_alarm     1.0e-6
   required_pd                    0.5
   swerling_case                  1

   hits_to_establish_track        3 5
   hits_to_maintain_track         1 3

   track_quality 0.5         # This sensor produces a relatively low fidelity track.

   reports_location
   reports_velocity
   reports_type
   reports_iff
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：category, one_m2_detect_range, antenna_height, frame_time, scan_mode, azimuth_scan_limits, transmitter, receiver, probability_of_false_alarm, required_pd

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, show_calibration_data, one_m2_detect_range, maximum_range, antenna_height, frame_time, scan_mode, azimuth_scan_limits, transmitter, receiver, swerling_case, probability_of_false_alarm, required_pd, 传感器
- **出处**：`electronic_warfare/rpj_jamming.txt:134-179`
- **片段**：

```text
sensor EW_RADAR WSF_RADAR_SENSOR
   show_calibration_data

   one_m2_detect_range           100.0 nm
   maximum_range                 120 nm

   antenna_height                6.0 m

   frame_time                    10.0 sec

   scan_mode                     azimuth
   azimuth_scan_limits           -180 deg 180 deg

   transmitter
      antenna_pattern            EW_RADAR_ANTENNA
      beam_tilt                  10.0 deg
      power                      100.0 kw
      frequency                  200 mhz
      pulse_width                25 usec
      pulse_repetition_interval  1250 usec
      internal_loss              2 db
   end_transmitter

   receiver
      beam_tilt                  10.0 deg
      bandwidth                  2.0 mhz
      noise_power                -160 dBw  # will be calibrated for 1 m^2
      internal_loss              7 dB

      electronic_protect EW_RADAR_EP
      end_electronic_protect
   end_receiver

   # Swerling detector
   swerling_case                 1
   probability_of_false_alarm    1.0e-6
   required_pd                   0.5
   number_of_pulses_integrated   32

   hits_to_establish_track       3 5   # 3 of last 5 scans to establish track
   hits_to_maintain_track        1 3   # 1 of last 3 scans to maintain  track

   reports_range
   reports_bearing
   reports_signal_to_noise
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：show_calibration_data, one_m2_detect_range, maximum_range, antenna_height, frame_time, scan_mode, azimuth_scan_limits, transmitter, receiver, swerling_case

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, frame_time, location, scan_mode, azimuth_scan_limits, elevation_field_of_view, minimum_range, maximum_range, one_m2_detect_range, transmitter, receiver, hits_to_establish_track, hits_to_maintain_track, 传感器
- **出处**：`electronic_warfare/esm_detect_jammer.txt:70-118`　（同签名共 4 处，另见 `sensor_demos/esm_demo.txt:37`、`sensor_demos/esm_tdoa_demo.txt:37`、`electronic_warfare/pol_mod_jamming.txt:93`）
- **片段**：

```text
sensor EW_RADAR WSF_RADAR_SENSOR

   frame_time                1  sec

   # Specify the location and orientation of the sensor on the platform.
   location                  0.0 0.0 -30 m

   # The sensor sweeps only in azimuth
   scan_mode                 azimuth
   azimuth_scan_limits       -180 deg 180 deg

   # The field of view, minimum_range and maximum_range are not required.
   # They are simply used for quick culling and should be generous.
   # (i.e. the field_of_view limits should be probably be larger than the
   # corresponding slew limit because the beam can probably detect things
   # outside the slew limit).
   elevation_field_of_view  -2.5 deg 42.5 deg

   minimum_range        0 nm
   maximum_range      400 km  # really 225 km

   one_m2_detect_range 225 km

   transmitter
      power           750 kw
      frequency       900 mhz
      bandwidth       0.1 mhz
      pulse_width                  10  usec
      pulse_repetition_interval    750 usec // max PRI range of 225 km
      antenna_pattern EW_RADAR_ANTENNA
      antenna_tilt     10 deg
   end_transmitter
   receiver
      antenna_pattern EW_RADAR_ANTENNA
      antenna_tilt     10 deg
      frequency       900 mhz
      bandwidth         1 mhz
   end_receiver

   hits_to_establish_track   3 5   # 3 of last 5 scans to establish track
   hits_to_maintain_track    1 4   # 1 of last 4 scans to maintain  track

   reports_location
   reports_velocity
   reports_signal_to_noise
   reports_range
   reports_bearing
   reports_elevation
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：frame_time, location, scan_mode, azimuth_scan_limits, elevation_field_of_view, minimum_range, maximum_range, one_m2_detect_range, transmitter, receiver

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, frame_time, location, scan_mode, azimuth_scan_limits, elevation_field_of_view, minimum_range, maximum_range, one_m2_detect_range, transmitter, false_target_screener, receiver, number_of_pulses_integrated, 传感器
- **出处**：`electronic_warfare/false-target_command_center.txt:120-203`
- **片段**：

```text
sensor EW_RADAR WSF_RADAR_SENSOR

   frame_time                1  sec

   # Specify the location and orientation of the sensor on the platform.
   location                  0.0 0.0 -30 m

   # The sensor sweeps only in azimuth
   scan_mode                 azimuth
   azimuth_scan_limits       -180 deg 180 deg

   # The field of view, minimum_range and maximum_range are not required.
   # They are simply used for quick culling and should be generous.
   # (i.e. the field_of_view limits should be probably be larger than the
   # corresponding slew limit because the beam can probably detect things
   # outside the slew limit).
   elevation_field_of_view  -2.5 deg 42.5 deg

   minimum_range        0 nm
   maximum_range      400 km  # really 225 km

   one_m2_detect_range 225 km

   transmitter
      power           750 kw
      frequency       900 mhz
      bandwidth       0.1 mhz
      pulse_width                  50  usec
      pulse_repetition_interval    750 usec // max PRI range of 225 km
      antenna_pattern EW_RADAR_ANTENNA
      antenna_tilt     10 deg
   end_transmitter

   false_target_screener SCREENER_1 WSF_FT_SCREENER
      track_capacity              100
      plot_capacity                50
      transfer_capacity            50
   end_false_target_screener

   receiver
      antenna_pattern EW_RADAR_ANTENNA
      antenna_tilt     10 deg
      frequency       900 mhz
      bandwidth         1 mhz
     # To remove SLB: Comment out following electronic_protect block
     electronic_protect
        technique sensor_sidelobe_blanker
           default_on
           mitigated_techniques
              false_targets
           end_mitigated_techniques
           effect slb_effect WSF_SLB_EFFECT
              antenna_pattern    AUX_ANTENNA
              blanking_threshold 0 dB
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
        end_technique
     end_electronic_protect
   end_receiver

   number_of_pulses_integrated 10

   hits_to_establish_track   3 5   # 1 of last 5 scans to establish track
   hits_to_maintain_track    1 4   # 1 of last 4 scans to maintain  track

   reports_velocity
   reports_signal_to_noise
   reports_range
   reports_bearing

end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：frame_time, location, scan_mode, azimuth_scan_limits, elevation_field_of_view, minimum_range, maximum_range, one_m2_detect_range, transmitter, false_target_screener

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, one_m2_detect_range, antenna_height, frame_time, scan_mode, azimuth_scan_limits, elevation_scan_limits, transmitter, receiver, probability_of_false_alarm, required_pd, swerling_case, hits_to_establish_track, 传感器
- **出处**：`sensor_plot/radar/fpa-setup.txt:27-66`
- **片段**：

```text
sensor ACQ_RADAR WSF_RADAR_SENSOR

   one_m2_detect_range            50.0 nm

   antenna_height                 5.0 m

   frame_time                     10.0 sec

   scan_mode                      azimuth_and_elevation
   azimuth_scan_limits            -180 deg 180 deg
   elevation_scan_limits          0.0 deg 50.0 deg

   transmitter
      antenna_pattern             ACQ_RADAR_ANTENNA
      power                       1000.0 kw
      frequency                   3000 mhz
      internal_loss               2 db
      pulse_width                 350 usec
      pulse_repetition_interval    35 usec
   end_transmitter

   receiver
      antenna_pattern             ACQ_RADAR_ANTENNA
      bandwidth                   2.0 mhz
      noise_power                 -160 dBw  # will be calibrated for 1 m^2
      internal_loss               7 dB

   end_receiver

   probability_of_false_alarm     1.0e-6
   required_pd                    0.5
   swerling_case                  1

   hits_to_establish_track        3 5
   hits_to_maintain_track         1 3
   reports_range
   reports_bearing
   reports_elevation
   reports_iff
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：one_m2_detect_range, antenna_height, frame_time, scan_mode, azimuth_scan_limits, elevation_scan_limits, transmitter, receiver, probability_of_false_alarm, required_pd

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, one_m2_detect_range, maximum_range, antenna_height, frame_time, scan_mode, azimuth_scan_limits, transmitter, receiver, swerling_case, probability_of_false_alarm, required_pd, number_of_pulses_integrated, 传感器
- **出处**：`electronic_warfare/barrage_jamming.txt:63-105`　（同签名共 2 处，另见 `electronic_warfare/spot_jamming.txt:121`）
- **片段**：

```text
sensor EW_RADAR WSF_RADAR_SENSOR
   #show_calibration_data

   one_m2_detect_range           100.0 nm
   maximum_range                 120 nm

   antenna_height                6.0 m

   frame_time                    10.0 sec

   scan_mode                     azimuth
   azimuth_scan_limits           -180 deg 180 deg

   transmitter
      antenna_pattern            EW_RADAR_ANTENNA
      beam_tilt                  10.0 deg
      power                      100.0 kw
      frequency                  200 mhz
      pulse_width                25 usec
      pulse_repetition_interval  1250 usec
      internal_loss              2 db
   end_transmitter

   receiver
      beam_tilt                  10.0 deg
      bandwidth                  2.0 mhz
      noise_power                -160 dBw  # will be calibrated for 1 m^2
      internal_loss              7 dB
   end_receiver

   # Swerling detector
   swerling_case                 1
   probability_of_false_alarm    1.0e-6
   required_pd                   0.5
   number_of_pulses_integrated   16

   hits_to_establish_track       3 5   # 3 of last 5 scans to establish track
   hits_to_maintain_track        1 3   # 1 of last 3 scans to maintain  track

   reports_range
   reports_bearing
   reports_signal_to_noise
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：one_m2_detect_range, maximum_range, antenna_height, frame_time, scan_mode, azimuth_scan_limits, transmitter, receiver, swerling_case, probability_of_false_alarm

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, off, no_debug, slew_mode, show_calibration_data, mode_template, transmitter, receiver, range_product, frame_time, reports_location, reports_velocity, mode, 传感器
- **出处**：`base_types/sensors/radar/blue_a2a_radar.txt:116-189`　（同签名共 2 处，另见 `draw/sensors/radar/generic_fighter_radar.txt:22`）
- **片段**：

```text
sensor BLUE_A2A_RADAR WSF_RADAR_SENSOR

  #-- Platform Part Commands
  off                                   # default
  no_debug                              # default

  #-- Articulated Part Commands
  #   Slew mode and limits, yaw, pitch, & roll info goes here
  slew_mode                 azimuth

  #-- Sensor Level Commands
  show_calibration_data                 # display radar characteristics

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

  #-- Track Filter Commands
  filter  WSF_ALPHA_BETA_FILTER
    alpha   0.4
    beta    0.1
  end_filter

end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：off, no_debug, slew_mode, show_calibration_data, mode_template, transmitter, receiver, range_product, frame_time, reports_location

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, off, no_debug, slew_mode, mode_template, transmitter, receiver, range_product, frame_time, reports_location, reports_velocity, mode, azimuth_field_of_view, 传感器
- **出处**：`outer_air_battle/sensors/radar/blue_a2a_radar.txt:122-197`
- **片段**：

```text
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

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：off, no_debug, slew_mode, mode_template, transmitter, receiver, range_product, frame_time, reports_location, reports_velocity

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, one_m2_detect_range, antenna_height, frame_time, scan_mode, azimuth_scan_limits, false_target_screener, transmitter, receiver, probability_of_false_alarm, required_pd, swerling_case, hits_to_establish_track, 传感器
- **出处**：`electronic_warfare/test_false_targets/sensors/radar/ew_radar.txt:35-120`
- **片段**：

```text
sensor EW_RADAR WSF_RADAR_SENSOR

   one_m2_detect_range            100.0 nm

   antenna_height                 6.0 m

   frame_time                     20.0 sec

   scan_mode                      azimuth
   azimuth_scan_limits            -180 deg 180 deg

   false_target_screener SCREENER WSF_FT_SCREENER
      #debug
      track_capacity     1000
      plot_capacity      1000
      transfer_capacity  1000
   end_false_target_screener

   transmitter
      antenna_pattern             EW_RADAR_ANTENNA
      beam_tilt                   10.0 deg
      power                       1000.0 kw
      frequency                   200 mhz
      pulse_width                 700 usec
      pulse_repetition_interval    70 usec
      internal_loss               2 db
   end_transmitter

   receiver
      antenna_pattern             EW_RADAR_ANTENNA
      beam_tilt                   10.0 deg
      bandwidth                   2.0 mhz
      noise_power                 -160 dBw  # will be calibrated for 1 m^2
      internal_loss               7 dB

      electronic_protect
         technique sensor_sidelobe_canceler
            mitigated_techniques
               noise_jamming
            end_mitigated_techniques
            effect slc_effect WSF_SLC_EFFECT
               number_canceller_channels  2
               cancellation_lock_ratio    2 dB
               antenna_pattern            AUX_ANTENNA
               cancellation_ratios
                  jammer_to_noise 0.0 db   0.0 db
                  jammer_to_noise 15.0 db 10.0 db
                  jammer_to_noise 30.0 db 20.0 db
                  saturation_ratio 10.0 dB
               end_cancellation_ratios
            end_effect
         end_technique
         technique sensor_sidelobe_blanker
            mitigated_techniques
               random_pulse_jamming
              # false_targets
            end_mitigated_techniques
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
         end_technique
      end_electronic_protect

   end_receiver

   probability_of_false_alarm     1.0e-6
   required_pd                    0.5
   swerling_case                  1

   hits_to_establish_track        3 5
   hits_to_maintain_track         1 3

   track_quality 0.5         # This sensor produces a relatively low fidelity track.

   reports_range
   reports_bearing
   reports_iff
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：one_m2_detect_range, antenna_height, frame_time, scan_mode, azimuth_scan_limits, false_target_screener, transmitter, receiver, probability_of_false_alarm, required_pd

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, one_m2_detect_range, antenna_height, frame_time, scan_mode, azimuth_scan_limits, transmitter, receiver, probability_of_false_alarm, required_pd, swerling_case, hits_to_establish_track, hits_to_maintain_track, 传感器
- **出处**：`cyber/exfiltrate_demo/sensors/radar/ew_radar.txt:33-71`　（同签名共 2 处，另见 `iads/sensors/radar/ew_radar.txt:33`）
- **片段**：

```text
sensor EW_RADAR WSF_RADAR_SENSOR
   one_m2_detect_range            100.0 nm

   antenna_height                 6.0 m

   frame_time                     20.0 sec

   scan_mode                      azimuth
   azimuth_scan_limits            -180 deg 180 deg

   transmitter
      antenna_pattern             EW_RADAR_ANTENNA
      beam_tilt                   10.0 deg
      power                       1000.0 kw
      frequency                   200 mhz
      internal_loss               2 db
   end_transmitter

   receiver
      antenna_pattern             EW_RADAR_ANTENNA
      beam_tilt                   10.0 deg
      bandwidth                   2.0 mhz
      noise_power                 -160 dBw  # will be calibrated for 1 m^2
      internal_loss               7 dB
   end_receiver

   probability_of_false_alarm     1.0e-6
   required_pd                    0.5
   swerling_case                  1

   hits_to_establish_track        3 5
   hits_to_maintain_track         1 3

   track_quality 0.5         # This sensor produces a relatively low fidelity track.

   reports_range
   reports_bearing
   reports_iff
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：one_m2_detect_range, antenna_height, frame_time, scan_mode, azimuth_scan_limits, transmitter, receiver, probability_of_false_alarm, required_pd, swerling_case

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, antenna_height, maximum_range, frame_time, scan_mode, azimuth_scan_limits, transmitter, receiver, swerling_case, probability_of_false_alarm, required_pd, number_of_pulses_integrated, hits_to_establish_track, 传感器
- **出处**：`chaff/chaff_example.txt:135-176`　（同签名共 2 处，另见 `sensor_demos/ew_radar_demo.txt:45`）
- **片段**：

```text
sensor EW_RADAR WSF_RADAR_SENSOR
   #show_calibration_data

   antenna_height                6.0 m
   
   maximum_range 100 km

   frame_time                    1.0 sec

   scan_mode                     azimuth
   azimuth_scan_limits           -180 deg 180 deg

   transmitter
      antenna_pattern            EW_RADAR_ANTENNA
      beam_tilt                  10.0 deg
      power                      100.0 w
      frequency                  1000 mhz
      pulse_width                25 usec
      pulse_repetition_interval  1250 usec
      internal_loss              2 db
   end_transmitter

   receiver
      beam_tilt                  10.0 deg
      bandwidth                  2.0 mhz
      noise_power                -160 dBw  # will be calibrated for 1 m^2
      internal_loss              7 dB
   end_receiver

   # Swerling detector
   swerling_case                 1
   probability_of_false_alarm    1.0e-6
   required_pd                   0.5
   number_of_pulses_integrated   16

   hits_to_establish_track       3 5   # 3 of last 5 scans to establish track
   hits_to_maintain_track        1 3   # 1 of last 3 scans to maintain  track

   reports_range
   reports_bearing
   reports_signal_to_noise
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：antenna_height, maximum_range, frame_time, scan_mode, azimuth_scan_limits, transmitter, receiver, swerling_case, probability_of_false_alarm, required_pd

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, one_m2_detect_range, antenna_height, frame_time, scan_mode, azimuth_scan_limits, transmitter, receiver, probability_of_false_alarm, required_pd, swerling_case, hits_to_establish_track, hits_to_maintain_track, 传感器
- **出处**：`heatmap/sensors/radar/ew_radar.txt:24-66`
- **片段**：

```text
sensor EW_RADAR WSF_RADAR_SENSOR

   one_m2_detect_range            75.0 nm

   antenna_height                 6.0 m

   frame_time                     20.0 sec

   scan_mode                      azimuth
   azimuth_scan_limits            -8 deg 8 deg

   transmitter
      antenna_pattern             EW_RADAR_ANTENNA
      beam_tilt                   10.0 deg
      power                       1000.0 kw
      frequency                   200 mhz
      internal_loss               2 db
   end_transmitter

   receiver
      antenna_pattern             EW_RADAR_ANTENNA
      beam_tilt                   10.0 deg
      bandwidth                   2.0 mhz
      noise_power                 -160 dBw  # will be calibrated for 1 m^2
      internal_loss               7 dB
   end_receiver

   probability_of_false_alarm     1.0e-6
   required_pd                    0.5
   swerling_case                  1

   hits_to_establish_track        3 5
   hits_to_maintain_track         1 3

   track_quality 0.5         # This sensor produces a relatively low fidelity track.

#   reports_range
#   reports_bearing
#   reports_elevation
   reports_location
   reports_velocity
   reports_iff
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：one_m2_detect_range, antenna_height, frame_time, scan_mode, azimuth_scan_limits, transmitter, receiver, probability_of_false_alarm, required_pd, swerling_case

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, frame_time, one_m2_detect_range, maximum_range, antenna_height, scan_mode, azimuth_scan_limits, transmitter, receiver, swerling_case, probability_of_false_alarm, number_of_pulses_integrated, required_pd, 传感器
- **出处**：`electronic_warfare/esm_detect_radar.txt:81-124`　（同签名共 2 处，另见 `electronic_warfare/esm_detect_radar2.txt:103`）
- **片段**：

```text
sensor EW_RADAR WSF_RADAR_SENSOR
   #show_calibration_data

   frame_time                      10.0 sec

   one_m2_detect_range          100.0 nm
   maximum_range                120 nm

   antenna_height               6.0 m

   scan_mode                    azimuth
   azimuth_scan_limits         -180 deg 180 deg


   transmitter
      antenna_pattern            EW_RADAR_ANTENNA
      beam_tilt                  10.0 deg
      power                      1000.0 kw
      frequency                  200 mhz
      pulse_width                25 usec
      pulse_repetition_interval  1250 usec
      internal_loss              2 db
   end_transmitter

   receiver
      beam_tilt                  10.0 deg
      bandwidth                  2.0 mhz
      noise_power                -160 dBw  # will be calibrated for 1 m^2
      internal_loss              7 dB
   end_receiver

   # Swerling detector
   swerling_case                 1
   probability_of_false_alarm    1.0e-6
   number_of_pulses_integrated   32

   required_pd                   0.5

   hits_to_establish_track       3 5   # 3 of last 5 scans to establish track
   hits_to_maintain_track        1 3   # 1 of last 3 scans to maintain  track

   reports_range
   reports_bearing
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：frame_time, one_m2_detect_range, maximum_range, antenna_height, scan_mode, azimuth_scan_limits, transmitter, receiver, swerling_case, probability_of_false_alarm

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, debug, frame_time, antenna_height, antenna_tilt, scan_mode, azimuth_scan_limits, transmitter, receiver, clutter_model, clutter_attenuation_factor, detection_threshold, hits_to_establish_track, 传感器
- **出处**：`sensor_demos/clutter_demo.txt:47-90`
- **片段**：

```text
sensor EW_RADAR WSF_RADAR_SENSOR
   debug
   frame_time                         10 sec

   antenna_height                     10 m
   antenna_tilt                       1 deg

   scan_mode                          azimuth
   azimuth_scan_limits                -180 deg 180 deg

   transmitter
      antenna_pattern                 EW_RADAR_ANTENNA
      power                           100 kw
      frequency                       1.2 ghz
      polarization                    vertical

      # =======================================================================
      # NOTE: The pulse_width and pulse_repetition_frequency must be specified
      #       when using any of the algorithmic clutter models.
      # =======================================================================

      pulse_width                     1 us
      pulse_repetition_frequency      1.5 khz
      attenuation_model               blake
   end_transmitter

   receiver

   end_receiver

   clutter_model                       EW_RADAR_CLUTTER

   # knock 10db off the clutter
   clutter_attenuation_factor          -10 db

   detection_threshold                 12.8 db

   hits_to_establish_track             2 3
   hits_to_maintain_track              1 3

   reports_range
   reports_bearing
   reports_elevation
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：debug, frame_time, antenna_height, antenna_tilt, scan_mode, azimuth_scan_limits, transmitter, receiver, clutter_model, clutter_attenuation_factor

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, frame_time, one_m2_detect_range, antenna_height, scan_mode, azimuth_scan_limits, elevation_scan_limits, electronic_beam_steering, transmitter, receiver, hits_to_establish_track, hits_to_maintain_track, ignore_domain, 传感器
- **出处**：`ship_ad/sensors/radar/rice_screen.txt:37-80`　（同签名共 2 处，另见 `ship_ad/sensors/radar/top_plate.txt:32`）
- **片段**：

```text
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

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：frame_time, one_m2_detect_range, antenna_height, scan_mode, azimuth_scan_limits, elevation_scan_limits, electronic_beam_steering, transmitter, receiver, hits_to_establish_track

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, on, azimuth_field_of_view, elevation_field_of_view, maximum_range, frame_time, range_error_sigma, range_rate_error_sigma, azimuth_error_sigma, elevation_error_sigma, reports_velocity, reports_range, reports_bearing, 传感器
- **出处**：`air_to_air/platforms/hvaa.txt:79-95`　（同签名共 3 处，另见 `air_to_air/platforms/dca.txt:75`、`air_to_air/platforms/escort.txt:76`）
- **片段**：

```text
   sensor eyes WSF_GEOMETRIC_SENSOR
      on
      azimuth_field_of_view   -180.0 degrees  180.0 degrees
      elevation_field_of_view  -90.0 degrees   90.0 degrees
      maximum_range 10 nmi
      frame_time    0.5 sec
      range_error_sigma 2000 ft
      range_rate_error_sigma 100 ft/s
      azimuth_error_sigma 0.1 deg
      elevation_error_sigma 0.1 deg
      reports_velocity 
      reports_range
      reports_bearing 
      reports_iff
      internal_link data_mgr
      ignore_same_side
   end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：on, azimuth_field_of_view, elevation_field_of_view, maximum_range, frame_time, range_error_sigma, range_rate_error_sigma, azimuth_error_sigma, elevation_error_sigma, reports_velocity

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, processor, on, azimuth_field_of_view, elevation_field_of_view, minimum_range, maximum_range, frame_time, ignore_same_side, azimuth_error_sigma, elevation_error_sigma, reports_location, reports_velocity, 传感器
- **出处**：`gun_engagement/platforms/gun_battery.txt:40-60`
- **片段**：

```text
  sensor test_sensor WSF_GEOMETRIC_SENSOR
     processor track_mgr
     #update_interval 1 sec
     on
     azimuth_field_of_view  -180 deg 180 deg
     elevation_field_of_view -0 deg 85 deg
     minimum_range  50 meters
     maximum_range 4000 meters
     frame_time .1 secs
     ignore_same_side

     azimuth_error_sigma .1 mil
     elevation_error_sigma .1 mil
 #    range_error_sigma 1 meter

     reports_location
     reports_velocity
     hits_to_establish_track 3 5
     hits_to_maintain_track 1 5
     track_quality 1.0
   end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：processor, on, azimuth_field_of_view, elevation_field_of_view, minimum_range, maximum_range, frame_time, ignore_same_side, azimuth_error_sigma, elevation_error_sigma

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, off, frame_time, azimuth_field_of_view, elevation_field_of_view, maximum_range, maximum_request_count, range_error_sigma, azimuth_error_sigma, elevation_error_sigma, filter, reports_range, reports_bearing, 传感器
- **出处**：`base_types/weapons/sam/blue_lr_sam_complex.txt:41-67`　（同签名共 2 处，另见 `base_types/weapons/sam/blue_sr_sam_complex.txt:54`）
- **片段**：

```text
   sensor seeker WSF_GEOMETRIC_SENSOR
      off

      frame_time                       0.1 sec

      azimuth_field_of_view            -30 deg 30 deg
      elevation_field_of_view          -30 deg 30 deg
      maximum_range                    50 km

      maximum_request_count            1

      range_error_sigma                1 m
      azimuth_error_sigma              0.001 deg
      elevation_error_sigma            0.001 deg

      filter                           WSF_KALMAN_FILTER
         process_noise_sigmas_XYZ      50 50 50
         process_noise_model           constant_acceleration
      end_filter

      reports_range
      reports_bearing
      reports_elevation
      reports_velocity

      internal_link data_mgr
   end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：off, frame_time, azimuth_field_of_view, elevation_field_of_view, maximum_range, maximum_request_count, range_error_sigma, azimuth_error_sigma, elevation_error_sigma, filter

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, on, maximum_request_count, slew_mode, frame_time, one_m2_detect_range, maximum_range, transmitter, hits_to_establish_track, hits_to_maintain_track, track_quality, ignore_domain, reports_range, 传感器
- **出处**：`launcher/sensors/radar/radar_set.txt:9-42`
- **片段**：

```text
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

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：on, maximum_request_count, slew_mode, frame_time, one_m2_detect_range, maximum_range, transmitter, hits_to_establish_track, hits_to_maintain_track, track_quality

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, frame_time, maximum_request_count, slew_mode, one_m2_detect_range, maximum_range, transmitter, receiver, hits_to_establish_track, hits_to_maintain_track, track_quality, ignore_domain, reports_range, 传感器
- **出处**：`electronic_warfare/track_error.txt:188-236`
- **片段**：

```text
sensor RADAR_SET WSF_RADAR_SENSOR
   #show_calibration_data
   frame_time                     2.0 sec
   maximum_request_count          0
   slew_mode                      both
   one_m2_detect_range            20 km
   maximum_range                  60 km

   transmitter
      power         15000 kw
      frequency       900 mhz
      bandwidth       0.1 mhz
     pulse_width                  50  usec
     pulse_repetition_interval    750 usec // max PRI range of 225 km
   end_transmitter

   receiver
      frequency       900 mhz
      bandwidth         1 mhz
      electronic_protect
         technique
            default_on
            mitigated_techniques
               track_error_inducement
            end_mitigated_techniques
            effect mitigate_track_error WSF_TRACK_EFFECT
               track_behavior distort
               range_error     50   m
               azimuth_error    0.5 deg
               elevation_error  1   deg
            end_effect
         end_technique
      end_electronic_protect
   end_receiver

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

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：frame_time, maximum_request_count, slew_mode, one_m2_detect_range, maximum_range, transmitter, receiver, hits_to_establish_track, hits_to_maintain_track, track_quality

### sensor（sensor_demo）｜传感器

- **关键词**：sensor, on, internal_link, reports_range, frame_time, azimuth_field_of_view, elevation_field_of_view, maximum_range, slew_mode, azimuth_slew_limits, elevation_slew_limits, azimuth_slew_rate, elevation_slew_rate, 传感器
- **出处**：`multiresolution_demos/sensor_demo.txt:62-78`
- **片段**：

```text
   sensor geom_sensor GEOM_SENSOR
      on
      internal_link track_mgr
      # The following inputs are identical to the inputs in MR_SENSOR/common
      reports_range
      frame_time               10 sec
      azimuth_field_of_view   -45.0 deg 45.0 deg  
      elevation_field_of_view -45.0 deg 45.0 deg  
      maximum_range            50 nm
      slew_mode                 azimuth_and_elevation
      azimuth_slew_limits     -45 deg 45 deg    
      elevation_slew_limits   -45 deg 45 deg    
      azimuth_slew_rate         5 deg/s
      elevation_slew_rate       5 deg/s 
      selection_mode            single
      ignore_same_side
   end_sensor
```

- **演示要点**：演示 sensor 的参数：on, internal_link, reports_range, frame_time, azimuth_field_of_view, elevation_field_of_view, maximum_range, slew_mode, azimuth_slew_limits, elevation_slew_limits

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, off, azimuth_field_of_view, elevation_field_of_view, one_m2_detect_range, frame_time, reports_location, reports_velocity, reports_iff, track_quality, internal_link, ignore_same_side, ignore_domain, 传感器
- **出处**：`heatmap/sensors/radar/striker_radar.txt:10-30`
- **片段**：

```text
sensor STRIKER_RADAR WSF_RADAR_SENSOR
   off
   azimuth_field_of_view    -20.0 deg   20.0 deg
   elevation_field_of_view   -15.0 deg    15.0 deg
   one_m2_detect_range 60 nm
   frame_time 2 sec
   reports_location
   reports_velocity
   reports_iff
   track_quality 1.0
   internal_link data_mgr
   internal_link task_mgr
   ignore_same_side
   ignore_domain land
   transmitter
      frequency 9.6 ghz
      power 10.0 kw
   end_transmitter
   receiver
   end_receiver
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：off, azimuth_field_of_view, elevation_field_of_view, one_m2_detect_range, frame_time, reports_location, reports_velocity, reports_iff, track_quality, internal_link

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, maximum_range, antenna_height, frame_time, scan_mode, azimuth_scan_limits, elevation_scan_limits, required_pd, hits_to_establish_track, hits_to_maintain_track, track_quality, reports_range, reports_bearing, 传感器
- **出处**：`cyber/sensors/eyeball.txt:11-35`
- **片段**：

```text
sensor EYEBALL WSF_GEOMETRIC_SENSOR 

   maximum_range        10 nm
   
   antenna_height         2 m
   
   frame_time            1 sec
   
   scan_mode             azimuth_and_elevation
   azimuth_scan_limits   -180 deg 180 deg
   elevation_scan_limits    0 deg  90 deg

   required_pd                  0.5
   
   hits_to_establish_track      3  5
   hits_to_maintain_track       1  5
   
   track_quality                0.8
   
   reports_range 
   reports_bearing 
   reports_elevation 
   reports_iff 
   
end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：maximum_range, antenna_height, frame_time, scan_mode, azimuth_scan_limits, elevation_scan_limits, required_pd, hits_to_establish_track, hits_to_maintain_track, track_quality

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, frame_time, one_m2_detect_range, maximum_range, antenna_height, scan_mode, azimuth_scan_limits, transmitter, receiver, required_pd, hits_to_establish_track, hits_to_maintain_track, reports_range, 传感器
- **出处**：`electronic_warfare/simple_auto_jamming.txt:266-301`
- **片段**：

```text
sensor EW_RADAR WSF_RADAR_SENSOR

   frame_time                      5.0 sec


   one_m2_detect_range          100.0 nm
   maximum_range                120 nm

   antenna_height               6.0 m

   scan_mode                    azimuth
   azimuth_scan_limits         -180 deg 180 deg

   transmitter
      antenna_pattern           EW_RADAR_ANTENNA
      power                     750.0 kw
      pulse_width                  50  usec
      pulse_repetition_interval    750 usec // max PRI range of 225 km
      frequency                 900 mhz
   end_transmitter

   receiver
      antenna_pattern           EW_RADAR_ANTENNA
      antenna_tilt              10 deg
      bandwidth                 2.0 mhz
   end_receiver

   required_pd                     0.5

   hits_to_establish_track         3 5
   hits_to_maintain_track          1 3

   reports_range
   reports_bearing
   reports_iff
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：frame_time, one_m2_detect_range, maximum_range, antenna_height, scan_mode, azimuth_scan_limits, transmitter, receiver, required_pd, hits_to_establish_track

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, frame_time, antenna_height, maximum_range, scan_mode, azimuth_scan_limits, jamming_perception_threshold, transmitter, receiver, required_pd, hits_to_establish_track, hits_to_maintain_track, reports_range, 传感器
- **出处**：`sensor_plot/radar/hm-repeater-effect.txt:110-145`
- **片段**：

```text
sensor EW_RADAR WSF_RADAR_SENSOR

   frame_time                      1.0 sec

   antenna_height               6.0 m

   maximum_range 250 km

   scan_mode                    azimuth
   azimuth_scan_limits         -180 deg 180 deg

   jamming_perception_threshold 3.0 dB

   transmitter
      antenna_pattern           EW_RADAR_ANTENNA
      beam_tilt                  10 deg
      power                    750.0 kw
      pulse_width                50  usec
      pulse_repetition_interval  750 usec // max PRI range of 225 km
      frequency                  900 mhz
   end_transmitter

   receiver
      antenna_pattern           EW_RADAR_ANTENNA
      bandwidth                 2.0 mhz
   end_receiver

   required_pd                     0.5

   hits_to_establish_track         3 5
   hits_to_maintain_track          1 3

   reports_range
   reports_bearing
   reports_iff
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：frame_time, antenna_height, maximum_range, scan_mode, azimuth_scan_limits, jamming_perception_threshold, transmitter, receiver, required_pd, hits_to_establish_track

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, on, azimuth_field_of_view, elevation_field_of_view, maximum_range, frame_time, reports_location, reports_velocity, reports_range, reports_iff, reports_type, track_quality, internal_link, 传感器
- **出处**：`p6dof/missile_comparison.txt:58-72`　（同签名共 5 处，另见 `six_dof/pm6_missile_comparison.txt:65`、`six_dof/pm6_missile_comparison.txt:277`、`six_dof/rb6_missile_comparison.txt:65`）
- **片段**：

```text
   sensor radar WSF_GEOMETRIC_SENSOR
      on
      azimuth_field_of_view   -110.0 degrees  110.0 degrees
      elevation_field_of_view  -90.0 degrees   90.0 degrees
      maximum_range 100 nm
      frame_time    0.1 sec
      reports_location
      reports_velocity
      reports_range
      reports_iff
      reports_type
      track_quality 1.0
      internal_link data_mgr
      ignore_same_side
   end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：on, azimuth_field_of_view, elevation_field_of_view, maximum_range, frame_time, reports_location, reports_velocity, reports_range, reports_iff, reports_type

### sensor · WSF_ACOUSTIC_SENSOR｜传感器

- **关键词**：sensor, WSF_ACOUSTIC_SENSOR, ignore_same_side, acoustic_type, detection_threshold, on, frame_time, scan_mode, azimuth_scan_limits, elevation_scan_limits, hits_to_establish_track, hits_to_maintain_track, reports_bearing, reports_elevation, 传感器
- **出处**：`acoustic/acoustic_demo2.txt:149-164`
- **片段**：

```text
sensor ACOUSTIC_BASE WSF_ACOUSTIC_SENSOR
#   debug
   ignore_same_side
   acoustic_type human
   detection_threshold 0.0 # do not adjust for human hearing
   on
   frame_time 0.5 sec
   scan_mode both
   azimuth_scan_limits -180 deg 180 deg
   elevation_scan_limits 0 deg 90 deg
   hits_to_establish_track 2 3
   hits_to_maintain_track 1 2
   reports_bearing
   reports_elevation
   reports_signal_to_noise
end_sensor
```

- **演示要点**：演示 WSF_ACOUSTIC_SENSOR 的参数：ignore_same_side, acoustic_type, detection_threshold, on, frame_time, scan_mode, azimuth_scan_limits, elevation_scan_limits, hits_to_establish_track, hits_to_maintain_track

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, azimuth_field_of_view, elevation_field_of_view, minimum_range, maximum_range, on, frame_time, reports_location, reports_velocity, reports_iff, reports_bearing, track_quality, ignore_same_side, 传感器
- **出处**：`base_types/platforms/awacs.txt:56-72`　（同签名共 3 处，另见 `outer_air_battle/platforms/blue_prop_awacs_1.txt:28`、`shooter/platforms/awacs.txt:44`）
- **片段**：

```text
   sensor geo_sensor WSF_GEOMETRIC_SENSOR
      azimuth_field_of_view -180.0 degrees 180.0 degrees
      elevation_field_of_view -90.0 degrees 90.0 degrees
      minimum_range 0 m
      # 300 nm
      maximum_range 555600 m
      on
      frame_time              0.5 sec
      reports_location
      reports_velocity
      reports_iff
      reports_bearing
      #do not report weapons quality tracks
      track_quality 0.75
      ignore_same_side
      internal_link track-proc
   end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：azimuth_field_of_view, elevation_field_of_view, minimum_range, maximum_range, on, frame_time, reports_location, reports_velocity, reports_iff, reports_bearing

### sensor · WSF_LASER_TRACKER｜传感器

- **关键词**：sensor, WSF_LASER_TRACKER, ignore_same_side, laser_code, off, update_interval, frame_time, receiver, maximum_range, azimuth_field_of_view, elevation_field_of_view, reports_bearing, reports_elevation, reports_location, 传感器
- **出处**：`laser_designator/weapons/agm/hellfire.txt:67-83`
- **片段**：

```text
   sensor laser_tracker WSF_LASER_TRACKER 
       ignore_same_side           
       laser_code                    1212
       off
       update_interval             0.01 s
       frame_time                   1 sec  # Time it takes to do a complete box scan.
       receiver
          wavelength 1.06E-6 microns
       end_receiver
       maximum_range            10 km      
       azimuth_field_of_view    -15 deg +15 deg
       elevation_field_of_view   -20 deg  10 deg
       reports_bearing
       reports_elevation
       reports_location
       track_quality 1.0    # weapons quality
   end_sensor
```

- **演示要点**：演示 WSF_LASER_TRACKER 的参数：ignore_same_side, laser_code, off, update_interval, frame_time, receiver, maximum_range, azimuth_field_of_view, elevation_field_of_view, reports_bearing

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, on, azimuth_field_of_view, elevation_field_of_view, minimum_range, maximum_range, frame_time, reports_location, reports_velocity, reports_iff, track_quality, internal_link, ignore_same_side, 传感器
- **出处**：`timeline/platforms/striker.txt:118-134`　（同签名共 2 处，另见 `timeline_lead/platforms/striker.txt:101`）
- **片段**：

```text
   sensor geo_sensor WSF_GEOMETRIC_SENSOR
      on
      azimuth_field_of_view   -180.0 degrees  180.0 degrees
      elevation_field_of_view  -90.0 degrees   90.0 degrees
      minimum_range 0 m
     #maximum_range 277800 m     //about 150 nm
      maximum_range 175940 m     //about  95 nm
      frame_time    0.5 sec
      reports_location
      reports_velocity
      reports_iff
      track_quality 1.0
      internal_link data_mgr
      internal_link task_mgr
      ignore_same_side
      ignore_domain land
   end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：on, azimuth_field_of_view, elevation_field_of_view, minimum_range, maximum_range, frame_time, reports_location, reports_velocity, reports_iff, track_quality

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, azimuth_field_of_view, elevation_field_of_view, minimum_range, maximum_range, on, frame_time, reports_location, reports_velocity, reports_iff, track_quality, ignore_same_side, internal_link, 传感器
- **出处**：`base_types/platforms/blue_multirole_fighter_1_ripr.txt:34-47`　（同签名共 9 处，另见 `base_types/weapons/aam/scenario_test_launch_computer.txt:77`、`route_finder_demos/platforms/striker.txt:92`、`behavior_tree/platforms/run_tree_striker.txt:138`）
- **片段**：

```text
   sensor geo_sensor WSF_GEOMETRIC_SENSOR
      azimuth_field_of_view -180.0 degrees 180.0 degrees
      elevation_field_of_view -90.0 degrees 90.0 degrees
      minimum_range 0 m
      maximum_range 100000 m
      on
      frame_time              0.5 sec
      reports_location
      reports_velocity
      reports_iff
      track_quality 1.0
      ignore_same_side
      internal_link track_manager
   end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：azimuth_field_of_view, elevation_field_of_view, minimum_range, maximum_range, on, frame_time, reports_location, reports_velocity, reports_iff, track_quality

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, azimuth_field_of_view, elevation_field_of_view, minimum_range, maximum_range, on, frame_time, reports_location, reports_velocity, hits_to_maintain_track, reports_iff, track_quality, check_terrain_masking, 传感器
- **出处**：`draw/sensors/human/generic_eyeball.txt:9-22`
- **片段**：

```text
sensor GENERIC_EYEBALL WSF_GEOMETRIC_SENSOR
   azimuth_field_of_view -180.0 degrees 180.0 degrees
   elevation_field_of_view -90.0 degrees 90.0 degrees
   minimum_range 0 km
   maximum_range 2 km
   on
   frame_time              0.5 sec
   reports_location
   reports_velocity
   hits_to_maintain_track   1 32   # 1 of last 32 scans to establish track
   reports_iff
   track_quality 1.0
   check_terrain_masking true
end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：azimuth_field_of_view, elevation_field_of_view, minimum_range, maximum_range, on, frame_time, reports_location, reports_velocity, hits_to_maintain_track, reports_iff

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, on, azimuth_field_of_view, elevation_field_of_view, maximum_range, frame_time, reports_location, reports_velocity, reports_range, reports_iff, reports_type, track_quality, internal_link, 传感器
- **出处**：`p6dof/missile_comparison.txt:248-261`　（同签名共 3 处，另见 `six_dof/pm6_missile_comparison.txt:395`、`six_dof/rb6_missile_comparison.txt:395`）
- **片段**：

```text
   sensor radar WSF_GEOMETRIC_SENSOR
      on
      azimuth_field_of_view   -60.0 degrees  60.0 degrees
      elevation_field_of_view  1.0 degrees   60.0 degrees
      maximum_range 50 nm
      frame_time    0.1 sec
      reports_location
      reports_velocity
      reports_range
      reports_iff
      reports_type
      track_quality 1.0
      internal_link data_mgr
   end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：on, azimuth_field_of_view, elevation_field_of_view, maximum_range, frame_time, reports_location, reports_velocity, reports_range, reports_iff, reports_type

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, off, azimuth_field_of_view, elevation_field_of_view, minimum_range, maximum_range, frame_time, reports_location, reports_velocity, reports_iff, track_quality, internal_link, ignore_same_side, 传感器
- **出处**：`heatmap/platforms/striker.txt:122-136`　（同签名共 2 处，另见 `heatmap/platforms/striker_pursuit.txt:131`）
- **片段**：

```text
   sensor geo_sensor WSF_GEOMETRIC_SENSOR
      off
      azimuth_field_of_view   -180.0 degrees  180.0 degrees
      elevation_field_of_view  -90.0 degrees   90.0 degrees
      minimum_range 0 m
      maximum_range 175940 m     //about  95 nm
      frame_time    0.5 sec
      reports_location
      reports_velocity
      reports_iff
      track_quality 1.0
      internal_link data_mgr
      internal_link task_mgr
      ignore_same_side
   end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：off, azimuth_field_of_view, elevation_field_of_view, minimum_range, maximum_range, frame_time, reports_location, reports_velocity, reports_iff, track_quality

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, on, azimuth_field_of_view, elevation_field_of_view, maximum_range, frame_time, reports_location, reports_velocity, reports_range, reports_iff, track_quality, internal_link, ignore_same_side, 传感器
- **出处**：`base_types/platforms/brawler/brawler_platform.txt:101-116`　（同签名共 2 处，另见 `brawler/platforms/brawler_platform.txt:188`）
- **片段**：

```text
   sensor simple_sensor WSF_GEOMETRIC_SENSOR
      on
      #azimuth_field_of_view   -45.0 degrees  45.0 degrees
      #elevation_field_of_view  -20.0 degrees   20.0 degrees
      azimuth_field_of_view   -180.0 degrees  180.0 degrees
      elevation_field_of_view  -90.0 degrees   90.0 degrees
      maximum_range 150 km
      frame_time    0.5 sec
      reports_location
      reports_velocity
      reports_range
      reports_iff
      track_quality 1.0
      internal_link data_mgr
      ignore_same_side
   end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：on, azimuth_field_of_view, elevation_field_of_view, maximum_range, frame_time, reports_location, reports_velocity, reports_range, reports_iff, track_quality

### sensor · WSF_ACOUSTIC_SENSOR｜传感器

- **关键词**：sensor, WSF_ACOUSTIC_SENSOR, on, acoustic_type, frame_time, scan_mode, azimuth_scan_limits, elevation_scan_limits, detection_threshold, hits_to_establish_track, hits_to_maintain_track, reports_bearing, reports_elevation, reports_signal_to_noise, 传感器
- **出处**：`acoustic/acoustic_demo.txt:45-65`
- **片段**：

```text
sensor ACOUSTIC_BASE WSF_ACOUSTIC_SENSOR
   #debug
   on

   acoustic_type human

   frame_time 1 sec
   scan_mode both

   azimuth_scan_limits -180 deg 180 deg
   elevation_scan_limits 0 deg 90 deg

    detection_threshold 0.0 # do not adjust for human hearing

   hits_to_establish_track 2 3
   hits_to_maintain_track 1 2

   reports_bearing
   reports_elevation
   reports_signal_to_noise
end_sensor
```

- **演示要点**：演示 WSF_ACOUSTIC_SENSOR 的参数：on, acoustic_type, frame_time, scan_mode, azimuth_scan_limits, elevation_scan_limits, detection_threshold, hits_to_establish_track, hits_to_maintain_track, reports_bearing

### sensor · WSF_LASER_TRACKER｜传感器

- **关键词**：sensor, WSF_LASER_TRACKER, laser_code, off, update_interval, azimuth_field_of_view, elevation_field_of_view, maximum_range, frame_time, receiver, reports_bearing, reports_elevation, reports_location, track_quality, 传感器
- **出处**：`laser_designator/sensors/laser/laser_tracker-1212.txt:10-30`
- **片段**：

```text
sensor LASER_TRACKER-1212 WSF_LASER_TRACKER

   #debug
   #private_debug
   laser_code                    1212
   off
   update_interval             0.01 s
   azimuth_field_of_view    -15 deg +15 deg
   elevation_field_of_view   -65 deg  -5 deg

   maximum_range            10 km
   frame_time                   4 sec  # Time it takes to do a complete box scan.
   receiver
      wavelength 1.06E-6 microns
   end_receiver

   reports_bearing
   reports_elevation
   reports_location
   track_quality 1.0    # weapons quality
end_sensor
```

- **演示要点**：演示 WSF_LASER_TRACKER 的参数：laser_code, off, update_interval, azimuth_field_of_view, elevation_field_of_view, maximum_range, frame_time, receiver, reports_bearing, reports_elevation

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, frame_time, scan_mode, azimuth_scan_limits, elevation_scan_limits, electronic_beam_steering, electronic_beam_steering_limit, electronic_beam_steering_loss_exponent, scan_stabilization, transmitter, receiver, one_m2_detect_range, reports_location, 传感器
- **出处**：`sensor_plot/radar/sm-stab.txt:18-43`
- **片段**：

```text
sensor FIGHTER_RADAR WSF_RADAR_SENSOR
   frame_time 10 sec


   scan_mode                 azimuth_and_elevation
   azimuth_scan_limits       -70 deg 70 deg
   elevation_scan_limits     -10 deg 10 deg

#   antenna_tilt              30 deg

   electronic_beam_steering  azimuth_and_elevation
   electronic_beam_steering_limit      70 deg
   electronic_beam_steering_loss_exponent 1.4

   scan_stabilization        pitch_and_roll

   transmitter
      frequency              3 ghz
      power                  100 kw
      antenna_pattern        FIGHTER_RADAR_ANTENNA
   end_transmitter
   receiver
   end_receiver
   one_m2_detect_range       100 nm
   reports_location
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：frame_time, scan_mode, azimuth_scan_limits, elevation_scan_limits, electronic_beam_steering, electronic_beam_steering_limit, electronic_beam_steering_loss_exponent, scan_stabilization, transmitter, receiver

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, transmitter, receiver, detection_threshold, one_m2_detect_range, hits_to_establish_track, hits_to_maintain_track, track_quality, reports_range, reports_bearing, reports_elevation, reports_velocity, reports_iff, 传感器
- **出处**：`space_operations/cloud_attenuation.txt:50-84`
- **片段**：

```text
sensor RADAR WSF_RADAR_SENSOR
      pitch                               90 deg
      frame_time                          5 sec
      # This is just for culling purposes
      maximum_range                       2800000 km

      electronic_beam_steering            azimuth_and_elevation
      electronic_beam_steering_limit      90 deg
      electronic_beam_steering_loss_exponent 1.4

      scan_mode                           azimuth_and_elevation
      azimuth_scan_limits                 -180 deg 180 deg
      elevation_scan_limits               -90 deg 90 deg

   transmitter
      antenna_pattern                  ALTAIR
      frequency                        1 MHz
      power                            1 watts
   end_transmitter

   receiver
      antenna_pattern                  ALTAIR
   end_receiver

   detection_threshold                 12.8 db
   one_m2_detect_range                 2800000 km
   hits_to_establish_track             2 3
   hits_to_maintain_track              1 3
   track_quality                       1
   reports_range
   reports_bearing
   reports_elevation
   reports_velocity
   reports_iff
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：transmitter, receiver, detection_threshold, one_m2_detect_range, hits_to_establish_track, hits_to_maintain_track, track_quality, reports_range, reports_bearing, reports_elevation

### sensor · WSF_EOIR_SENSOR｜传感器

- **关键词**：sensor, WSF_EOIR_SENSOR, on, frame_time, reports_location, azimuth_field_of_view, elevation_field_of_view, slew_mode, call_sensor_track_observers, angular_resolution, hits_to_establish_track, hits_to_maintain_track, ignore_same_side, 传感器
- **出处**：`space_operations/sensors/sat_sensor.txt:10-23`
- **片段**：

```text
sensor SAT_SENSOR WSF_EOIR_SENSOR
   on
   frame_time 10 sec
   //reports_bearing
   reports_location
   azimuth_field_of_view -1.0 deg 1.0 deg
   elevation_field_of_view -1.0 deg 1.0 deg
   slew_mode azimuth_and_elevation
   call_sensor_track_observers false
   angular_resolution 0.00001 deg
   hits_to_establish_track  3  5
   hits_to_maintain_track   1  5
   ignore_same_side
end_sensor
```

- **演示要点**：演示 WSF_EOIR_SENSOR 的参数：on, frame_time, reports_location, azimuth_field_of_view, elevation_field_of_view, slew_mode, call_sensor_track_observers, angular_resolution, hits_to_establish_track, hits_to_maintain_track

### sensor · WSF_ESM_SENSOR｜传感器

- **关键词**：sensor, WSF_ESM_SENSOR, on, frame_time, receiver, antenna_pattern, detection_threshold, noise_power, internal_loss, frequency_band, reports_location, reports_frequency, reports_bearing, 传感器
- **出处**：`laser_designator/sensors/laser/laser_detector.txt:14-28`
- **片段**：

```text
   sensor LASER_DETECTOR WSF_ESM_SENSOR
      on
      frame_time 1 sec
      receiver
      antenna_pattern      LASER_ANTENNA
      detection_threshold  1 db
      noise_power          -230 dbw
      internal_loss        0 db
      end_receiver
      #wavelength 1.06E-6 microns = 1.06E-12 meters
      frequency_band 100000000000 ghz 1000000000000 ghz    #cover the laser band (gross example)
      reports_location
      reports_frequency  
      reports_bearing
   end_sensor
```

- **演示要点**：演示 WSF_ESM_SENSOR 的参数：on, frame_time, receiver, antenna_pattern, detection_threshold, noise_power, internal_loss, frequency_band, reports_location, reports_frequency

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, azimuth_field_of_view, elevation_field_of_view, minimum_range, maximum_range, frame_time, reports_location, reports_velocity, reports_iff, reports_bearing, track_quality, ignore_same_side, 传感器
- **出处**：`outer_air_battle/sensors/radar/geo_aa_radar.txt:15-30`
- **片段**：

```text
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

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：azimuth_field_of_view, elevation_field_of_view, minimum_range, maximum_range, frame_time, reports_location, reports_velocity, reports_iff, reports_bearing, track_quality

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, frame_time, maximum_range, azimuth_field_of_view, elevation_field_of_view, azimuth_error_sigma, elevation_error_sigma, hits_to_establish_track, hits_to_maintain_track, reports_bearing, reports_elevation, track_quality, 传感器
- **出处**：`bearing_only/sensors/geometric_bearing_only_sensor.txt:10-27`
- **片段**：

```text
sensor GEOMETRIC_BEARING_ONLY_SENSOR WSF_GEOMETRIC_SENSOR

   frame_time 2 secs
   maximum_range 140000 m
   azimuth_field_of_view -180 deg 180 deg
   elevation_field_of_view 0 deg 45 deg

   azimuth_error_sigma 1.0 deg
   elevation_error_sigma .1 deg
   #range_error_sigma  10 km

   hits_to_establish_track 3 4
   hits_to_maintain_track  1 3

   reports_bearing
   reports_elevation
   track_quality 0.4
end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：frame_time, maximum_range, azimuth_field_of_view, elevation_field_of_view, azimuth_error_sigma, elevation_error_sigma, hits_to_establish_track, hits_to_maintain_track, reports_bearing, reports_elevation

### sensor · WSF_ESM_SENSOR｜传感器

- **关键词**：sensor, WSF_ESM_SENSOR, on, frame_time, detection_sensitivity, receiver, frequency_band, reports_elevation, reports_bearing, reports_frequency, internal_link, ignore_same_side, ignore_domain, 传感器
- **出处**：`heatmap/sensors/esm_rwr/high_band_esm.txt:15-32`
- **片段**：

```text
sensor HIGH_BAND_ESM WSF_ESM_SENSOR
   on
   frame_time                 1 sec
   detection_sensitivity      -105 dbw
   receiver
      antenna_pattern         ESM_ANTENNA
      instantaneous_bandwidth 1 mhz
   end_receiver
   frequency_band             5 ghz 30 ghz
  #reports_range
   reports_elevation
   reports_bearing
   reports_frequency
   internal_link data_mgr
   internal_link task_mgr
   ignore_same_side
   ignore_domain land
end_sensor
```

- **演示要点**：演示 WSF_ESM_SENSOR 的参数：on, frame_time, detection_sensitivity, receiver, frequency_band, reports_elevation, reports_bearing, reports_frequency, internal_link, ignore_same_side

### sensor · WSF_ESM_SENSOR｜传感器

- **关键词**：sensor, WSF_ESM_SENSOR, frame_time, slew_mode, maximum_range, receiver, frequency_band, azimuth_error_sigma, elevation_error_sigma, range_error_sigma, reports_location, reports_type, reports_frequency, 传感器
- **出处**：`electronic_warfare/simple_auto_jamming.txt:41-64`
- **片段**：

```text
sensor ESM_SENSOR WSF_ESM_SENSOR
   frame_time              4 sec

   slew_mode               fixed

   maximum_range           200 km

   receiver
      antenna_pattern      ESM_ANTENNA
      detection_threshold  5 db
      noise_power          -180 dbw
      internal_loss        0 db
   end_receiver

   frequency_band          0.1 ghz  20 ghz

   azimuth_error_sigma   0.2 deg
   elevation_error_sigma 0.0 deg
   range_error_sigma     0.0 m

   reports_location
   reports_type
   reports_frequency
end_sensor
```

- **演示要点**：演示 WSF_ESM_SENSOR 的参数：frame_time, slew_mode, maximum_range, receiver, frequency_band, azimuth_error_sigma, elevation_error_sigma, range_error_sigma, reports_location, reports_type

### sensor · WSF_ESM_SENSOR｜传感器

- **关键词**：sensor, WSF_ESM_SENSOR, frame_time, slew_mode, maximum_range, unframed_detection_optimization, receiver, frequency_band, reports_location, reports_type, reports_frequency, reports_pw, reports_pri, 传感器
- **出处**：`electronic_warfare/agile_auto-repeater_jamming.txt:38-62`
- **片段**：

```text
sensor ESM_SENSOR WSF_ESM_SENSOR
#debug
   frame_time              2.5 sec

   slew_mode               fixed

   maximum_range           200 km

   unframed_detection_optimization false

   receiver
      antenna_pattern      ESM_ANTENNA
      detection_threshold  5 db
      noise_power          -180 dbw
      internal_loss        0 db
   end_receiver

   frequency_band          100 mhz 1000 mhz

   reports_location
   reports_type
   reports_frequency
   reports_pw
   reports_pri
end_sensor
```

- **演示要点**：演示 WSF_ESM_SENSOR 的参数：frame_time, slew_mode, maximum_range, unframed_detection_optimization, receiver, frequency_band, reports_location, reports_type, reports_frequency, reports_pw

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, scan_mode, maximum_range, transmitter, receiver, reports_velocity, reports_side, reports_type, reports_location, frame_time, azimuth_field_of_view, elevation_field_of_view, 传感器
- **出处**：`wargame/sensors/radar/bomber_radar.txt:17-47`　（同签名共 2 处，另见 `wargame/sensors/radar/scout_radar.txt:17`）
- **片段**：

```text
sensor BOMBER_RADAR WSF_RADAR_SENSOR 
   
   scan_mode                      azimuth_and_elevation
         
   maximum_range                  50000 ft
   
   transmitter 
      antenna_pattern             SCOUT_RADAR_ANTENNA
      power                       1000.0 kw
      frequency                   200 mhz
      internal_loss               2 db
   end_transmitter
   
   receiver
      antenna_pattern             SCOUT_RADAR_ANTENNA
      bandwidth                   30.0 khz
      noise_power                 -160 dBw  # will be calibrated for 1 m^2
      internal_loss               7 dB
   end_receiver  
      
   reports_velocity
   reports_side
   reports_type
   reports_location
   
   frame_time                     2.0 sec
   
   azimuth_field_of_view          -90 deg 90 deg
   elevation_field_of_view        -90 deg -30 deg
   
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：scan_mode, maximum_range, transmitter, receiver, reports_velocity, reports_side, reports_type, reports_location, frame_time, azimuth_field_of_view

### sensor · WSF_ESM_SENSOR｜传感器

- **关键词**：sensor, WSF_ESM_SENSOR, frame_time, slew_mode, maximum_range, antenna_tilt, receiver, frequency_band, reported_target_type, reported_emitter_type, reports_location, reports_frequency, reports_type, 传感器
- **出处**：`electronic_warfare/esm_detect_multi_sensor_radar.txt:42-104`
- **片段**：

```text
sensor ESM_SENSOR WSF_ESM_SENSOR
   frame_time              1 sec

   slew_mode               fixed

   maximum_range           200 km

   antenna_tilt         -45 deg

   receiver
      antenna_pattern      ESM_ANTENNA
      detection_threshold  5 db
      noise_power          -120 dbw
      internal_loss        0 db
   end_receiver

   frequency_band          0.1 ghz  20 ghz

   reported_target_type
      type EW_RADAR_SITE
         #time_to_declare 20 sec
         #time_to_reevaluate 20 sec
         report_type EW_ACQ_SITE
            emitter EW_RADAR
            emitter ACQ_RADAR
         report_type ACQ_SITE
            emitter ACQ_RADAR
         report_type EW_SITE
            emitter EW_RADAR
      type ACQ_RADAR_SITE
         #time_to_declare 10 sec
         #time_to_reevaluate 10 sec
         report_type ACQ_RDR_SITE 0.75
         report_type ACQ_SITE 0.25
      default_type
         #time_to_declare 1 sec
         report_truth
   end_reported_target_type

   reported_emitter_type
      type EW_RADAR
         time_to_declare 10 sec
         time_to_reevaluate 20 sec
         #report_type EW_RDR 0.5
         #report_type EW_UNK 0.5
         report_truth
      type ACQ_RADAR
         time_to_declare 5 sec
         time_to_reevaluate 5 sec
         #report_type ACQ_RDR 0.75
         #report_type ACQ_UNK 0.25
         report_truth
      default_type
         time_to_declare 1 sec
         report_truth
   end_reported_emitter_type

   #ranging_time 30 sec

   reports_location
   reports_frequency
   reports_type
end_sensor
```

- **演示要点**：演示 WSF_ESM_SENSOR 的参数：frame_time, slew_mode, maximum_range, antenna_tilt, receiver, frequency_band, reported_target_type, reported_emitter_type, reports_location, reports_frequency

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, ignore_domain, ignore, ignore_same_side, initial_mode, selection_mode, slew_mode, azimuth_slew_limits, elevation_slew_limits, mode_template, mode, filter, 传感器
- **出处**：`air_to_air/sensors/radar/long_range.txt:11-120`
- **片段**：

```text
sensor long_range WSF_RADAR_SENSOR
   ignore_domain           surface
   ignore invisible
   ignore_same_side
   
   initial_mode            SEARCH
   selection_mode          multiple // multiple to allow the "TWS" mode operation
    
   slew_mode               azimuth_and_elevation
   azimuth_slew_limits    -179.0 deg 179.0 deg 
   elevation_slew_limits  -60.0 deg 60.0 deg 
   
   mode_template
      antenna_tilt  0.0 deg     
      
      azimuth_field_of_view     -179.0 deg 179.0 deg
      elevation_field_of_view   -60.0 deg 60.0 deg
      
      minimum_altitude    -50000.0 ft
      maximum_altitude     100000.0 ft
      maximum_range        300.0 nmi   
      
#     electronic_beam_steering                azimuth_and_elevation
#     electronic_beam_steering_limit          60.0 deg
#     electronic_beam_steering_loss_exponent  1.2      # Brawler default
      
      azimuth_error_sigma            0.3 deg  // beamwidth / 10            
      elevation_error_sigma          0.3 deg  // beamwidth / 10              
      range_error_sigma             100.0 ft                  

      transmitter
         antenna_pattern  AESA_ANTENNA
         power                       30 kw       #
         frequency                   9.5 ghz     
         polarization                vertical
         duty_cycle                  0.25       
         pulse_width                 2.0 usec   
         pulse_repetition_frequency  90 khz      
         internal_loss               2.0 db      #
         attenuation_model itu end_attenuation_model
      end_transmitter
      
      receiver
         antenna_pattern          AESA_ANTENNA
         noise_figure             5.5    db      
         instantaneous_bandwidth  30.00  hz      
         internal_loss            2.5    db      
      end_receiver
      
      detection_probability
         signal_to_noise 6.9  absolute probability 0.00
         signal_to_noise 7.0  absolute probability 0.01
         signal_to_noise 8.0  absolute probability 0.05
         signal_to_noise 9.0  absolute probability 0.10
         signal_to_noise 10.0 absolute probability 0.50
         signal_to_noise 11.0 absolute probability 0.80
         signal_to_noise 12.0 absolute probability 0.90
         signal_to_noise 13.0 absolute probability 0.95
         signal_to_noise 14.0 absolute probability 0.99
      end_detection_probability
      
      prf_factor -10 db                     
      compute_measurement_errors  true
      doppler_resolution          5.0 m/s
      hits_to_establish_track     1 1         
      hits_to_maintain_track      1 3         

      signal_processor simple_doppler
         maximum_doppler_speed       3000.0 m/s  
      end_signal_processor 
      
      reports_location
      reports_range
      reports_range_rate
      reports_elevation
      reports_bearing
      reports_velocity
      reports_side
      reports_signal_to_noise
   end_mode_template
   
   mode SEARCH
      maximum_request_count   0
      frame_time              10 sec #  
      cue_mode                azimuth_and_elevation
      azimuth_cue_limits     -179.0 deg 179.0 deg
      elevation_cue_limits   -60.0 deg 60.0 deg   
      scan_mode               azimuth_and_elevation
      azimuth_scan_limits    -60.0 deg 60.0 deg # 
      elevation_scan_limits  -5.0 deg 5.0 deg # 
      post_lockon_detection_threshold_adjustment -1 db
   end_mode
   
   mode TWS
      frame_time              0.1 sec # 
      maximum_request_count   20 #
      cue_mode                azimuth_and_elevation
      azimuth_cue_limits     -179.0 deg 179.0 deg
      elevation_cue_limits   -60.0 deg 60.0 deg
      dwell_time 0.04 seconds
      azimuth_scan_limits     -3.0 deg  3.0 deg
      elevation_scan_limits   -3.0 deg  3.0 deg
      integration_gain         4.0 db             
   end_mode
   
   filter WSF_KALMAN_FILTER
      process_noise_model constant_velocity
      process_noise_sigmas_XYZ 2 2 2          # AFSIM recommended values for high agility aircraft
   end_filter
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：ignore_domain, ignore, ignore_same_side, initial_mode, selection_mode, slew_mode, azimuth_slew_limits, elevation_slew_limits, mode_template, mode

### sensor · WSF_IRST_SENSOR｜传感器

- **关键词**：sensor, WSF_IRST_SENSOR, atmospheric_attenuation, background_radiance, band, noise_equivalent_irradiance, detection_threshold, azimuth_error_sigma, elevation_error_sigma, range_error_sigma, hits_to_establish_track, hits_to_maintain_track, 传感器
- **出处**：`multiresolution_demos/sensors/sensor_include.txt:12-24`
- **片段**：

```text
sensor GENERIC_IRST WSF_IRST_SENSOR
   atmospheric_attenuation   0.05 per km
   background_radiance       500 microwatts/cm^2/sr
   band                      medium
   noise_equivalent_irradiance  1.0E-12 w/cm^2
   detection_threshold         3.0

   azimuth_error_sigma         0.001 deg
   elevation_error_sigma       0.001 deg
   range_error_sigma           7.0 m
   hits_to_establish_track     3 5
   hits_to_maintain_track      1 4
end_sensor
```

- **演示要点**：演示 WSF_IRST_SENSOR 的参数：atmospheric_attenuation, background_radiance, band, noise_equivalent_irradiance, detection_threshold, azimuth_error_sigma, elevation_error_sigma, range_error_sigma, hits_to_establish_track, hits_to_maintain_track

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, on, frame_time, pitch, azimuth_field_of_view, elevation_field_of_view, reports_location, hits_to_establish_track, hits_to_maintain_track, transmitter, one_m2_detect_range, 传感器
- **出处**：`satellite_demos/platforms/radar_truck.txt:17-31`
- **片段**：

```text
  sensor sensor-1 WSF_RADAR_SENSOR
    on
    frame_time                 10 sec
    pitch                      90 deg
    azimuth_field_of_view   -180.0 deg 180.0 deg     # All the way around
    elevation_field_of_view  -60.0 deg  60.0 deg
    reports_location
    hits_to_establish_track   2 3   # 2 of last 3 scans to establish track
    hits_to_maintain_track    1 3   # 1 of last 3 scans to maintain  track
    transmitter
       power 10000 kw
       frequency 100 mhz
    end_transmitter
    one_m2_detect_range 25000 km
  end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：on, frame_time, pitch, azimuth_field_of_view, elevation_field_of_view, reports_location, hits_to_establish_track, hits_to_maintain_track, transmitter, one_m2_detect_range

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, frame_time, scan_mode, azimuth_scan_limits, elevation_scan_limits, electronic_beam_steering, electronic_beam_steering_loss_exponent, transmitter, receiver, one_m2_detect_range, reports_location, 传感器
- **出处**：`sensor_plot/radar/sm-nostab.txt:16-33`
- **片段**：

```text
sensor FIGHTER_RADAR WSF_RADAR_SENSOR
   frame_time 10 sec
   scan_mode                 azimuth_and_elevation
   azimuth_scan_limits       -70 deg 70 deg
   elevation_scan_limits     -70 deg 70 deg
   electronic_beam_steering  azimuth_and_elevation
   #electronic_beam_steering_limit      70 deg
   electronic_beam_steering_loss_exponent 1.4
   transmitter
      frequency              3 ghz
      power                  100 kw
      antenna_pattern        FIGHTER_RADAR_ANTENNA
   end_transmitter
   receiver
   end_receiver
   one_m2_detect_range       100 nm
   reports_location
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：frame_time, scan_mode, azimuth_scan_limits, elevation_scan_limits, electronic_beam_steering, electronic_beam_steering_loss_exponent, transmitter, receiver, one_m2_detect_range, reports_location

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, pitch, frame_time, maximum_range, slew_mode, field_of_view, check_terrain_masking, hits_to_establish_track, hits_to_maintain_track, ignore_same_side, reports_location, 传感器
- **出处**：`coverage_demos/sensors/sat_sensor_geo.txt:13-33`
- **片段**：

```text
sensor SAT_SENSOR WSF_GEOMETRIC_SENSOR 
   pitch 90 deg
   
   frame_time 20 s
   maximum_range 40000 km
   
   slew_mode azimuth_and_elevation
   
   field_of_view rectangular
      azimuth_field_of_view -2.5 deg 2.5 deg
      elevation_field_of_view -2.5 deg 2.5 deg 
   end_field_of_view
   
   check_terrain_masking enable
   
   hits_to_establish_track 1 1
   hits_to_maintain_track 1 1
   
   ignore_same_side
   reports_location
end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：pitch, frame_time, maximum_range, slew_mode, field_of_view, check_terrain_masking, hits_to_establish_track, hits_to_maintain_track, ignore_same_side, reports_location

### sensor · WSF_ESM_SENSOR｜传感器

- **关键词**：sensor, WSF_ESM_SENSOR, frame_time, slew_mode, maximum_range, receiver, frequency_band, reports_location, reports_type, reports_frequency, reports_pw, reports_pri, 传感器
- **出处**：`aea_iads/sensors/esm_rwr/ucav_esm.txt:18-39`　（同签名共 10 处，另见 `alv_routing/sensors/alv_esm.txt:18`、`electronic_warfare/semi-auto_repeater_jamming_1.txt:37`、`electronic_warfare/test_false_targets/sensors/esm_rwr/ucav_esm.txt:19`）
- **片段**：

```text
sensor UCAV_ESM WSF_ESM_SENSOR
   frame_time             1.0 sec

   slew_mode              fixed

   maximum_range          200 km

   receiver
      antenna_pattern      UCAV_ESM_ANTENNA
      detection_threshold  5 db
      noise_power          -180 dbw
      internal_loss        0 db
   end_receiver

   frequency_band    0.1 ghz  20 ghz

   reports_location
   reports_type
   reports_frequency
   reports_pw
   reports_pri
end_sensor
```

- **演示要点**：演示 WSF_ESM_SENSOR 的参数：frame_time, slew_mode, maximum_range, receiver, frequency_band, reports_location, reports_type, reports_frequency, reports_pw, reports_pri

### sensor（mar_esams）｜传感器

- **关键词**：sensor, on, internal_link, one_m2_detect_range, yaw, pitch, elevation_field_of_view, electronic_beam_steering_loss_exponent_azimuth, electronic_beam_steering_loss_exponent_elevation, azimuth_scan_limits, azimuth_field_of_view, 传感器
- **出处**：`engage/radars/mar_esams.txt:16-38`　（同签名共 4 处，另见 `engage/radars/mar_esams.txt:40`、`engage/radars/mar_esams.txt:64`、`engage/radars/mar_esams.txt:88`）
- **片段**：

```text
   sensor mar1 MAR
      on
      internal_link mar_track_list

      #The following values are determined by ESAMS input
      one_m2_detect_range 50 km   #Detection range (DRANGE)
      yaw 0 deg                  #Azimuth boresight of sector (AZBORE)
      pitch 0 deg                #Elevation boresight of sector (ELBORE)

      #Note that elevation limts are not defined by ESAMS, but can modified
      #if necessary. Avoid full 90 degree sectors as it causes issues
      elevation_field_of_view -89.99 deg 89.99 deg

      #Cosine rolloff exponent values
      electronic_beam_steering_loss_exponent_azimuth .75    #(AZFAC)
      electronic_beam_steering_loss_exponent_elevation .75  #(ELFAC)

      #The following values correspond to AZMIN and AZMAX,
      #however in WSF, they are relative to the boresight,
      #where these values are relative to the platform in ESAMS
      azimuth_scan_limits -45 deg 45 deg
      azimuth_field_of_view -45 deg 45 deg
   end_sensor
```

- **演示要点**：演示 sensor 的参数：on, internal_link, one_m2_detect_range, yaw, pitch, elevation_field_of_view, electronic_beam_steering_loss_exponent_azimuth, electronic_beam_steering_loss_exponent_elevation, azimuth_scan_limits, azimuth_field_of_view

### sensor · WSF_ESM_SENSOR｜传感器

- **关键词**：sensor, WSF_ESM_SENSOR, frame_time, slew_mode, maximum_range, receiver, frequency_band, reported_emitter_type, ranging_time, reports_location, reports_frequency, reports_type, 传感器
- **出处**：`electronic_warfare/esm_detect_radar.txt:39-66`
- **片段**：

```text
sensor ESM_SENSOR WSF_ESM_SENSOR
   frame_time              4 sec

   slew_mode               fixed

   maximum_range           200 km

   receiver
      antenna_pattern      ESM_ANTENNA
      detection_threshold  5 db
      noise_power          -180 dbw
      internal_loss        0 db
   end_receiver

   frequency_band          0.1 ghz  20 ghz

   reported_emitter_type
      default_type
         time_to_declare 10 sec
         report_truth
   end_reported_emitter_type

   ranging_time 30 sec

   reports_location
   reports_frequency
   reports_type
end_sensor
```

- **演示要点**：演示 WSF_ESM_SENSOR 的参数：frame_time, slew_mode, maximum_range, receiver, frequency_band, reported_emitter_type, ranging_time, reports_location, reports_frequency, reports_type

### sensor · WSF_ESM_SENSOR｜传感器

- **关键词**：sensor, WSF_ESM_SENSOR, frame_time, slew_mode, azimuth_slew_limits, elevation_slew_limits, maximum_range, receiver, frequency_band, reports_location, reports_frequency, reports_type, 传感器
- **出处**：`electronic_warfare/esm_detect_radar2.txt:59-88`
- **片段**：

```text
sensor ESM_SENSOR WSF_ESM_SENSOR
   frame_time              0.1 sec

   slew_mode               azimuth_and_elevation
   azimuth_slew_limits     -60 deg 60 deg
   elevation_slew_limits   -60 deg 60 deg

   maximum_range           200 km

   receiver
      antenna_pattern      ESM_ANTENNA
      detection_threshold  5 db
      noise_power          -180 dbw
      internal_loss        0 db
   end_receiver

   frequency_band          0.1 ghz  20 ghz

   #reported_emitter_type
   #   default_type
   #      time_to_declare 10 sec
   #      report_truth
   #end_reported_emitter_type

   #ranging_time 30 sec

   reports_location
   reports_frequency
   reports_type
end_sensor
```

- **演示要点**：演示 WSF_ESM_SENSOR 的参数：frame_time, slew_mode, azimuth_slew_limits, elevation_slew_limits, maximum_range, receiver, frequency_band, reports_location, reports_frequency, reports_type

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, ignore_domain, ignore, ignore_same_side, initial_mode, selection_mode, slew_mode, azimuth_slew_limits, elevation_slew_limits, mode_template, mode, 传感器
- **出处**：`air_to_air/sensors/radar/aesa.txt:14-129`
- **片段**：

```text
sensor aesa WSF_RADAR_SENSOR
   ignore_domain           surface
   ignore invisible
   ignore_same_side 
   
   initial_mode            SEARCH
   selection_mode          multiple // multiple to allow the "TWS" mode operation
    
   slew_mode               azimuth_and_elevation
   azimuth_slew_limits    -60.0 deg 60.0 deg 
   elevation_slew_limits  -60.0 deg 60.0 deg 
   
   mode_template
      antenna_tilt  0.0 deg     
      
      azimuth_field_of_view     -60.0 deg 60.0 deg
      elevation_field_of_view   -30.0 deg 30.0 deg
      
      minimum_altitude    -50000.0 ft
      maximum_altitude     100000.0 ft
      maximum_range        400.0 km   
      
      electronic_beam_steering                azimuth_and_elevation
      electronic_beam_steering_limit          60.0 deg
      electronic_beam_steering_loss_exponent  1.2      # Brawler default
      
      azimuth_error_sigma            0.3 deg  // beamwidth / 10            
      elevation_error_sigma          0.3 deg  // beamwidth / 10              
      range_error_sigma              100 ft   
#     fixed_range_rate_error_sigma   5 ft/s 
      range_rate_error_sigma         5 ft/s             

      transmitter
         antenna_pattern  AESA_ANTENNA
         power                       13 kw       #
         frequency                   9.5 ghz     
         polarization                vertical
         duty_cycle                  0.25       
         pulse_width                 2.0 usec   
         pulse_repetition_frequency  90 khz      
         internal_loss               2.0 db      #
         attenuation_model itu end_attenuation_model
      end_transmitter
      
      receiver
         antenna_pattern          AESA_ANTENNA
         noise_figure             5.5    db      
         instantaneous_bandwidth  30.00  hz      
         internal_loss            2.5    db      
      end_receiver
      
      detection_probability
         signal_to_noise 6.9  absolute probability 0.00
         signal_to_noise 7.0  absolute probability 0.01
         signal_to_noise 8.0  absolute probability 0.05
         signal_to_noise 9.0  absolute probability 0.10
         signal_to_noise 10.0 absolute probability 0.50
         signal_to_noise 11.0 absolute probability 0.80
         signal_to_noise 12.0 absolute probability 0.90
         signal_to_noise 13.0 absolute probability 0.95
         signal_to_noise 14.0 absolute probability 0.99
      end_detection_probability
      
      prf_factor -10 db                     
      compute_measurement_errors  true
      doppler_resolution          5.0 m/s
      hits_to_establish_track     2 2         
      hits_to_maintain_track      1 3         

      signal_processor simple_doppler
         maximum_doppler_speed       3000.0 m/s  
      end_signal_processor 
      
      reports_location
      reports_range
      reports_range_rate
      reports_elevation
      reports_bearing
      reports_velocity
      reports_side
      reports_iff
      reports_signal_to_noise
   end_mode_template
   
   mode SEARCH
      maximum_request_count   0 
      
      frame_time              10 sec #  
      cue_mode                azimuth_and_elevation
      azimuth_cue_limits     -0.0 deg 0.0 deg
      elevation_cue_limits   -0.0 deg 0.0 deg
   
      scan_mode               azimuth_and_elevation
      azimuth_scan_limits    -60.0 deg 60.0 deg # 
      elevation_scan_limits  -30.0 deg 30.0 deg # 
      post_lockon_detection_threshold_adjustment -1 db

#     range_error_sigma  10000 ft
#     range_rate_error_sigma 100 fps
   end_mode
   
   mode TWS
      frame_time              2 sec # 
      maximum_request_count   20 #
      cue_mode                azimuth_and_elevation
      azimuth_cue_limits     -57.0 deg 57.0 deg
      elevation_cue_limits   -27.0 deg 27.0 deg
   
      scan_mode               azimuth_and_elevation
      azimuth_scan_limits    -3.0 deg 3.0 deg # 
      elevation_scan_limits  -3.0 deg 3.0 deg # 
      integration_gain         4.0 db      
      post_lockon_detection_threshold_adjustment -1 db       
   end_mode

end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：ignore_domain, ignore, ignore_same_side, initial_mode, selection_mode, slew_mode, azimuth_slew_limits, elevation_slew_limits, mode_template, mode

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, on, frame_time, hits_to_establish_track, hits_to_maintain_track, transmitter, power, frequency, antenna_pattern, reports_location, 传感器
- **出处**：`base_types/sensors/radar/blue_ew_radar_1.txt:16-29`
- **片段**：

```text
sensor BLUE_EW_RADAR_1 WSF_RADAR_SENSOR
  on
  frame_time 30 sec
  hits_to_establish_track 3 5
  hits_to_maintain_track 1 2
  transmitter
    power           145.6 kw          # average
    frequency       435 mhz           # 420-450 mhz
    antenna_pattern GS_RADAR_ANTENNA
  end_transmitter

  reports_location

end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：on, frame_time, hits_to_establish_track, hits_to_maintain_track, transmitter, power, frequency, antenna_pattern, reports_location

### sensor（draw_demo）｜传感器

- **关键词**：sensor, on, mode, azimuth_field_of_view, elevation_field_of_view, range_product, initial_mode, ignore, processor, modifier_category, 传感器
- **出处**：`draw/draw_demo.txt:23-36`
- **片段**：

```text
   sensor radar GENERIC_FIGHTER_RADAR
     on
     mode 20X50
       azimuth_field_of_view   -20.0 deg  20.0 deg
       elevation_field_of_view -45.0 deg  5.0 deg
       range_product             194.4 dBsm            # ~39.1 nm
       // one_m2_detect_range    39.1 nm
     end_mode
     initial_mode 20X50
     ignore weapon
     processor track-proc

     modifier_category fighter-radar-modifier
   end_sensor
```

- **演示要点**：演示 sensor 的参数：on, mode, azimuth_field_of_view, elevation_field_of_view, range_product, initial_mode, ignore, processor, modifier_category

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, transmitter, ignore_same_side, compute_measurement_errors, azimuth_error_sigma, elevation_error_sigma, range_error_sigma, reports_location, reports_velocity, frame_time, 传感器
- **出处**：`space_operations/scenarios/ssn_laydown.txt:22-35`
- **片段**：

```text
sensor RADAR WSF_RADAR_SENSOR
   transmitter
      power 10 gw
      frequency 100 mhz
   end_transmitter
   ignore_same_side
   compute_measurement_errors false
   azimuth_error_sigma 0.0001 deg
   elevation_error_sigma 0.0001 deg
   range_error_sigma 1 m
   reports_location
   reports_velocity
   frame_time 10 sec
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：transmitter, ignore_same_side, compute_measurement_errors, azimuth_error_sigma, elevation_error_sigma, range_error_sigma, reports_location, reports_velocity, frame_time

### sensor · WSF_EOIR_SENSOR｜传感器

- **关键词**：sensor, WSF_EOIR_SENSOR, frame_time, slew_mode, azimuth_slew_limits, elevation_slew_limits, azimuth_field_of_view, elevation_field_of_view, maximum_range, angular_resolution, reports_location, 传感器
- **出处**：`base_types/sensors/eo_ir/generic_eoir.txt:23-39`
- **片段**：

```text
sensor GENERIC_EOIR WSF_EOIR_SENSOR

   frame_time                          2 sec     # sample rate

   slew_mode                           azimuth_and_elevation
   azimuth_slew_limits                 -180 deg 180 deg
   elevation_slew_limits               -90 deg 10 deg

   azimuth_field_of_view               -1.58 deg 1.58 deg
   elevation_field_of_view             -1.58 deg 1.58 deg
   maximum_range                       200 km

   angular_resolution                  0.001 deg

   reports_location

end_sensor
```

- **演示要点**：演示 WSF_EOIR_SENSOR 的参数：frame_time, slew_mode, azimuth_slew_limits, elevation_slew_limits, azimuth_field_of_view, elevation_field_of_view, maximum_range, angular_resolution, reports_location

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, tilt, frame_time, maximum_range, field_of_view, check_terrain_masking, hits_to_establish_track, hits_to_maintain_track, ignore_same_side, reports_location, 传感器
- **出处**：`coverage_demos/sensors/sat_geosensor.txt:13-29`　（同签名共 3 处，另见 `coverage_demos/sensors/sat_sensor_narrow.txt:12`、`coverage_demos/sensors/uav_sensor.txt:13`）
- **片段**：

```text
sensor SAT_GEOSENSOR WSF_GEOMETRIC_SENSOR 
   tilt -90 deg
   frame_time 10 s
   maximum_range 1000 km
     
   field_of_view circular
      half_angle 45 deg
   end_field_of_view
   
   check_terrain_masking enable
   
   hits_to_establish_track 1 1
   hits_to_maintain_track 1 1
   
   ignore_same_side
   reports_location
end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：tilt, frame_time, maximum_range, field_of_view, check_terrain_masking, hits_to_establish_track, hits_to_maintain_track, ignore_same_side, reports_location

### sensor · WSF_ESM_SENSOR｜传感器

- **关键词**：sensor, WSF_ESM_SENSOR, frame_time, maximum_range, receiver, frequency_band, reports_location, reports_type, reports_frequency, reports_pw, reports_pri, 传感器
- **出处**：`electronic_warfare/air-to-air-rt1.txt:37-58`　（同签名共 2 处，另见 `electronic_warfare/air-to-air-rt2.txt:37`）
- **片段**：

```text
sensor ESM_SENSOR WSF_ESM_SENSOR
   #debug

   frame_time              2.5 sec

   maximum_range           400 km

   receiver
      antenna_pattern      ESM_ANTENNA
      detection_threshold  5 db
      noise_power          -180 dbw
      internal_loss        0 db
   end_receiver

   frequency_band          100 mhz 10000 mhz

   reports_location
   reports_type
   reports_frequency
   reports_pw
   reports_pri
end_sensor
```

- **演示要点**：演示 WSF_ESM_SENSOR 的参数：frame_time, maximum_range, receiver, frequency_band, reports_location, reports_type, reports_frequency, reports_pw, reports_pri

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, maximum_request_count, frame_time, antenna_height, slew_mode, azimuth_slew_limits, elevation_slew_limits, transmit_only, transmitter, reports_range, 传感器
- **出处**：`ship_ad/sensors/radar/front_dome.txt:33-56`
- **片段**：

```text
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

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：maximum_request_count, frame_time, antenna_height, slew_mode, azimuth_slew_limits, elevation_slew_limits, transmit_only, transmitter, reports_range

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, receive_only, antenna_height, frame_time, receiver, detection_threshold, reports_range, reports_bearing, reports_elevation, reports_iff, 传感器
- **出处**：`sensor_plot/radar/hm-bistatic-radar.txt:36-60`
- **片段**：

```text
sensor BISTATIC_SENSOR_RCVR WSF_RADAR_SENSOR
   receive_only

   antenna_height                 25.0 m

   frame_time                     10.0 sec

   receiver
      antenna_pattern             BISTATIC_RX_ANTENNA
      beam_tilt                   0 deg
      frequency                   400 mhz
      bandwidth                   2.0 mhz
      noise_power                 -175 dBw
   end_receiver

   detection_threshold 3 db
   #probability_of_false_alarm     1.0e-6
   #required_pd                    0.9
   #swerling_case                  1

   reports_range
   reports_bearing
   reports_elevation
   reports_iff
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：receive_only, antenna_height, frame_time, receiver, detection_threshold, reports_range, reports_bearing, reports_elevation, reports_iff

### sensor · WSF_ESM_SENSOR｜传感器

- **关键词**：sensor, WSF_ESM_SENSOR, frame_time, slew_mode, maximum_range, receiver, frequency_band, reported_emitter_type, reports_location, reports_frequency, reports_type, 传感器
- **出处**：`electronic_warfare/esm_detect_multi_beam_radar.txt:42-70`
- **片段**：

```text
sensor ESM_SENSOR WSF_ESM_SENSOR
   frame_time              1 sec

   slew_mode               fixed

   maximum_range           200 km

   receiver
      antenna_pattern      ESM_ANTENNA
      antenna_tilt         -45 deg
      detection_threshold  5 db
      noise_power          -120 dbw
      internal_loss        0 db
   end_receiver

   frequency_band          0.1 ghz  20 ghz

   reported_emitter_type
      default_type
         time_to_declare 10 sec
         report_truth
   end_reported_emitter_type

   #ranging_time 30 sec

   reports_location
   reports_frequency
   reports_type
end_sensor
```

- **演示要点**：演示 WSF_ESM_SENSOR 的参数：frame_time, slew_mode, maximum_range, receiver, frequency_band, reported_emitter_type, reports_location, reports_frequency, reports_type

### sensor · WSF_ESM_SENSOR｜传感器

- **关键词**：sensor, WSF_ESM_SENSOR, frame_time, slew_mode, maximum_range, receiver, error_model, frequency_band, reports_location, reports_type, reports_frequency, 传感器
- **出处**：`sensor_demos/esm_tdoa_demo.txt:103-132`
- **片段**：

```text
sensor ESM_SENSOR WSF_ESM_SENSOR
   frame_time              4 sec

   slew_mode               fixed

   maximum_range           400 km

   receiver
      antenna_pattern      ESM_ANTENNA
      detection_threshold  5 db
      noise_power          -180 dbw
      internal_loss        0 db
   end_receiver

   error_model trimsim_error
      north_position_error_sigma      0.1 ft
      east_position_error_sigma       0.1 ft
      down_position_error_sigma       0.1 ft
      reference_time_error            5.0 ns
      inter_system_time_delay         5.0 ns
      sensor_timing_error             0.0 s
      atmospheric_refraction_residual 0.0
   end_error_model

   frequency_band          0.1 ghz  20 ghz

   reports_location
   reports_type
   reports_frequency
end_sensor
```

- **演示要点**：演示 WSF_ESM_SENSOR 的参数：frame_time, slew_mode, maximum_range, receiver, error_model, frequency_band, reports_location, reports_type, reports_frequency

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, receive_only, maximum_range, antenna_height, frame_time, receiver, compute_measurement_errors, detection_threshold, reports_range, reports_bearing, 传感器
- **出处**：`sensor_demos/passive_detector_demo.txt:46-79`
- **片段**：

```text
sensor BISTATIC_SENSOR_RCVR WSF_RADAR_SENSOR
   #debug

   receive_only
   
   maximum_range                  120 nm

   antenna_height                 0.0 m

   frame_time                     10.0 sec

   receiver
      antenna_pattern          BISTATIC_RX_ANTENNA
      beam_tilt                  0 deg
      frequency                 525 mhz
      bandwidth                950.0 mhz
      noise_power              -175 dbm
      instantaneous_bandwidth    10 mhz

      check_transmitter_masking false
   end_receiver

   compute_measurement_errors true

   detection_threshold 3 db
   #probability_of_false_alarm     1.0e-6
   #required_pd                    0.9
   #swerling_case                  1

   reports_range
   reports_bearing
   #reports_elevation
   #reports_iff
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：receive_only, maximum_range, antenna_height, frame_time, receiver, compute_measurement_errors, detection_threshold, reports_range, reports_bearing

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, off, ignore_domain, selection_mode, initial_mode, slew_mode, azimuth_slew_limits, elevation_slew_limits, mode_template, mode, 传感器
- **出处**：`air_to_air/weapons/aam/medium_range_radar_missile.txt:58-93`　（同签名共 8 处，另见 `air_to_air/weapons/aam/short_range_ir_missile.txt:57`、`base_types/weapons/aam/medium_range_radar_missile.txt:51`、`behavior_tree/weapons/aam/medium_range_radar_missile.txt:49`）
- **片段**：

```text
sensor RADAR_SEEKER WSF_RADAR_SENSOR
   off
   ignore_domain                  land
   ignore_domain                  subsurface
   selection_mode                 single        #multiple
   initial_mode                   SEARCH
   slew_mode                      azimuth_and_elevation
   azimuth_slew_limits            -45 deg 45 deg
   elevation_slew_limits          -45 deg 45 deg
   mode_template
      scan_mode                   azimuth_and_elevation
      azimuth_scan_limits         -90 deg 90 deg
      elevation_scan_limits       -90 deg 90 deg      
      frame_time                  1.0 sec
      transmitter
         antenna_pattern          SEEKER_ANTENNA
         power                       1.0 kW
         frequency                  10.0 GHz
         pulse_repetition_interval   3.3 usec    #HPRF 300 kHz
         pulse_width                 1.0 usec    #30% duty factor
      end_transmitter
      receiver
         bandwidth                  1 MHz
      end_receiver
      one_m2_detect_range         50.0 km
      hits_to_establish_track        1 2
      hits_to_maintain_track         1 3
      reports_location
      reports_velocity
      reports_iff
      track_quality                  1.0
   end_mode_template
   mode SEARCH
      frame_time                  0.1 sec
   end_mode
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：off, ignore_domain, selection_mode, initial_mode, slew_mode, azimuth_slew_limits, elevation_slew_limits, mode_template, mode

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, debug_tracker, debug_scheduler, selection_mode, slew_mode, azimuth_slew_limits, elevation_slew_limits, mode_template, mode, search_while_track, 传感器
- **出处**：`electronic_warfare/closely_space_targets_ttr.txt:42-142`
- **片段**：

```text
sensor TTR_RADAR WSF_RADAR_SENSOR
   debug_tracker
   debug_scheduler

   selection_mode                 multiple

   slew_mode                      azimuth_and_elevation
   azimuth_slew_limits            -180 deg 180 deg
   elevation_slew_limits          0.0 deg 80.0 deg

   mode_template
      one_m2_detect_range            35.0 nm

      antenna_height                 4.0 m

      false_target_screener SCREENER WSF_FT_SCREENER
         #debug
         track_capacity     1000
         plot_capacity      1000
         transfer_capacity  1000
         request_based_tracking true
         #only_screen_false_target_track_requests true
      end_false_target_screener

      transmitter
         antenna_pattern             TTR_RADAR_ANTENNA
         power                       1000.0 kw
         frequency                   9500 mhz
         internal_loss               2 db
         pulse_repetition_interval   225 usec
         pulse_width                  25 usec
      end_transmitter

      receiver
         antenna_pattern             TTR_RADAR_ANTENNA
         bandwidth                   500.0 khz
         noise_power                 -160 dBw  # will be calibrated for 1 m^2
         internal_loss               7 dB
      end_receiver

      probability_of_false_alarm     1.0e-6
      required_pd                    0.5
      swerling_case                  1

      reports_range
      reports_bearing
      reports_elevation
      reports_velocity
   end_mode_template

   mode ACQUIRE
      maximum_request_count          1

      scan_mode                      azimuth_and_elevation
      azimuth_scan_limits            -5 deg 5 deg
      elevation_scan_limits          -5 deg 5 deg

      frame_time                     2.0 sec

      hits_to_establish_track        3 5
      hits_to_maintain_track         1 3

      track_quality                  0.8   // near 'weapons' grade
   end_mode

   mode TRACK
      scan_mode                      azimuth_and_elevation
      azimuth_scan_limits            -.1 deg .1 deg
      elevation_scan_limits          -.1 deg .1 deg

      maximum_request_count          6

      frame_time                     1.0 sec

      hits_to_establish_track        3 5
      hits_to_maintain_track         1 3

      track_quality                  1.0   // 'weapons' grade

      #transmitter
      #   frequency                   9800 mhz
      #end_transmitter

	   search_while_track

      close_target_detection
         #debug
         acquire_deltas
            azimuth_delta       0.2 deg
            elevation_delta     0.2 deg
            range_delta         5 m
         end_acquire_deltas

         reacquire_deltas
            azimuth_delta       0.25 deg
            elevation_delta     0.25 deg
            range_delta         1000 m
         end_reacquire_deltas
      end_close_target_detection
   end_mode
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：debug_tracker, debug_scheduler, selection_mode, slew_mode, azimuth_slew_limits, elevation_slew_limits, mode_template, mode, search_while_track

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, on, reports_location, reports_velocity, frame_time, cue_mode, slew_mode, azimuth_field_of_view, elevation_field_of_view, 传感器
- **出处**：`space_operations/platforms/intercept_radar.txt:20-29`
- **片段**：

```text
   sensor radar WSF_GEOMETRIC_SENSOR
      on
      reports_location
      reports_velocity
      frame_time 5 s
      cue_mode both
      slew_mode both
      azimuth_field_of_view -10 deg 10 deg
      elevation_field_of_view -10 deg 10 deg
   end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：on, reports_location, reports_velocity, frame_time, cue_mode, slew_mode, azimuth_field_of_view, elevation_field_of_view

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, on, reports_location, frame_time, azimuth_field_of_view, elevation_field_of_view, ignore, internal_link, maximum_range, 传感器
- **出处**：`space_operations/platforms/commander.txt:25-35`
- **片段**：

```text
   sensor detect WSF_GEOMETRIC_SENSOR
      on
      reports_location
      frame_time 1 min
      azimuth_field_of_view -180 deg 180 deg
      elevation_field_of_view -90 deg 90 deg
      ignore sat_sensor
      ignore launch
      internal_link iridium_mgr
      maximum_range 1500 nm
   end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：on, reports_location, frame_time, azimuth_field_of_view, elevation_field_of_view, ignore, internal_link, maximum_range

### sensor · WSF_ESM_SENSOR｜传感器

- **关键词**：sensor, WSF_ESM_SENSOR, frame_time, slew_mode, maximum_range, receiver, frequency_band, reports_location, reports_type, reports_frequency, 传感器
- **出处**：`electronic_warfare/agile_jamming.txt:39-58`　（同签名共 6 处，另见 `electronic_warfare/esm_detect_jammer.txt:127`、`electronic_warfare/test_multi_beam/sensors/esm/ucav_esm.txt:19`、`iads/sensors/esm_rwr/ucav_esm.txt:18`）
- **片段**：

```text
sensor ESM_SENSOR WSF_ESM_SENSOR
   frame_time              4 sec

   slew_mode               fixed

   maximum_range           200 km

   receiver
      antenna_pattern      ESM_ANTENNA
      detection_threshold  5 db
      noise_power          -180 dbw
      internal_loss        0 db
   end_receiver

   frequency_band          0.1 ghz  20 ghz

   reports_location
   reports_type
   reports_frequency
end_sensor
```

- **演示要点**：演示 WSF_ESM_SENSOR 的参数：frame_time, slew_mode, maximum_range, receiver, frequency_band, reports_location, reports_type, reports_frequency

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, transmit_only, antenna_height, frame_time, transmitter, reports_range, reports_bearing, reports_elevation, reports_iff, 传感器
- **出处**：`sensor_plot/radar/hm-bistatic-radar.txt:62-81`
- **片段**：

```text
sensor BISTATIC_SENSOR_XMTR WSF_RADAR_SENSOR
   transmit_only

   antenna_height                 25.0 m

   frame_time                     10.0 sec

   transmitter
      antenna_pattern             BISTATIC_TX_ANTENNA
      beam_tilt                   25 deg
      power                       100.0 w
      frequency                   400 mhz
      bandwidth                   2.0 mhz
   end_transmitter

   reports_range
   reports_bearing
   reports_elevation
   reports_iff
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：transmit_only, antenna_height, frame_time, transmitter, reports_range, reports_bearing, reports_elevation, reports_iff

### sensor · WSF_ESM_SENSOR｜传感器

- **关键词**：sensor, WSF_ESM_SENSOR, frame_time, azimuth_field_of_view, elevation_field_of_view, frequency_band, detection_sensitivities, receiver, antenna_pattern, instantaneous_bandwidth, 传感器
- **出处**：`sensor_plot/radar/hm-pass-detect.txt:31-66`
- **片段**：

```text
sensor PASSIVE_SNSR WSF_ESM_SENSOR
  frame_time    0.5 sec
  azimuth_field_of_view     -180 deg 180 deg
  elevation_field_of_view   -90 deg 90 deg
  frequency_band   1.0 ghz  100.0 ghz

  #continuous_detection_threshold 15 dB
  #pulsed_detection_threshold     15 dB

  #continuous_detection_sensitivity -80 dBm
  #pulsed_detection_sensitivity     -80 dBm

  #detection_threshold_table
  #   signal_type pulsed
  #      frequency 1.0 Hz  5 dB
  #      frequency 3.0 GHz 9 dB
  #   signal_type continuous
  #      frequency 1.0 Hz 3 dB
  #      frequency 3.0 GHz 6 dB
  #end_detection_threshold_table

  detection_sensitivities
       signal_type pulsed
          frequency 1.0 Hz  -70 dBm
          frequency 3.0 GHz -80 dBm
       signal_type continuous
          frequency 1.0 Hz  -75 dBm
          frequency 3.0 GHz -85 dBm
  end_detection_sensitivities

  receiver
    antenna_pattern constAntenna
    instantaneous_bandwidth 500 MHz # -87 dBm noise power
    //noise_power   -80 dbm
  end_receiver
end_sensor
```

- **演示要点**：演示 WSF_ESM_SENSOR 的参数：frame_time, azimuth_field_of_view, elevation_field_of_view, frequency_band, detection_sensitivities, receiver, antenna_pattern, instantaneous_bandwidth

### sensor · WSF_LASER_TRACKER｜传感器

- **关键词**：sensor, WSF_LASER_TRACKER, laser_code, off, update_interval, slew_mode, azimuth_slew_limits, elevation_slew_limits, mode_template, mode, 传感器
- **出处**：`hellfire/semiactive_laser_hellfire/hellfire_type.txt:20-60`　（同签名共 2 处，另见 `hellfire/laser_designation_via_dis/hellfire_type.txt:20`）
- **片段**：

```text
sensor HELLFIRE_LASER_TRACKER WSF_LASER_TRACKER
   #debug
   #private_debug
   laser_code                    1212
   off
   update_interval             0.01 s
   slew_mode                   both

   # Gimbal limits on the hellfire seeker.
   azimuth_slew_limits      -40 deg +40 deg
   elevation_slew_limits    -40 deg +40 deg

   mode_template
      # Total field of view involved while box-scanning for laser spots.
      # Total angle traversed during the box scan is 2 X (32 + 4) = 72 deg.
      azimuth_field_of_view    -35 deg +35 deg
      elevation_field_of_view   -16 deg  +16 deg

      maximum_range            10 km
      scan_stabilization          roll
      scan_mode                   both
      azimuth_cue_rate         18 deg/sec
      elevation_cue_rate       18 deg/sec
      frame_time                   4 sec  # Time it takes to do a complete box scan.
                                          # 72 deg / (18 deg/sec) = 4 sec scan
      receiver
         wavelength 1.06E-6 microns
      end_receiver

      reports_bearing
      reports_elevation
      reports_location
    end_mode_template

   mode TRACK
      # While tracking, null seeker to target Line-Of-Sight, with 4-deg half-cone FOV (approximately)
      azimuth_field_of_view    -40 deg +40 deg
      elevation_field_of_view  -40 deg +40 deg
      frame_time               0.01 sec  # Nearly instantaneous updates are needed for accurate guidance.
   end_mode
end_sensor
```

- **演示要点**：演示 WSF_LASER_TRACKER 的参数：laser_code, off, update_interval, slew_mode, azimuth_slew_limits, elevation_slew_limits, mode_template, mode

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, maximum_range, receive_only, antenna_height, frame_time, receiver, error_model_parameters, detection_threshold, reports_bearing, 传感器
- **出处**：`sensor_demos/passive_detector_df_demo.txt:44-84`
- **片段**：

```text
sensor BISTATIC_SENSOR_RCVR WSF_RADAR_SENSOR
   #debug

   maximum_range          120 nm

   receive_only

   antenna_height          0.0 m

   frame_time              10.0 sec

   receiver
      antenna_pattern          BISTATIC_RX_ANTENNA
      beam_tilt                  0 deg
      frequency                 525 mhz
      bandwidth                950.0 mhz
      noise_power              -175 dbm
      instantaneous_bandwidth    10 mhz

      check_transmitter_masking false
   end_receiver

   #compute_measurement_errors true

   error_model_parameters
      azimuth_beamwidth      90 deg  # quadrant detection
      elevation_beamwidth    90 deg
      receiver_bandwidth     50 mhz
   end_error_model_parameters

   detection_threshold 3 db
   #probability_of_false_alarm     1.0e-6
   #required_pd                    0.9
   #swerling_case                  1

   #reports_range
   reports_bearing
   #reports_signal_to_noise
   #reports_elevation
   #reports_iff
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：maximum_range, receive_only, antenna_height, frame_time, receiver, error_model_parameters, detection_threshold, reports_bearing

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, frame_time, beam, required_pd, hits_to_establish_track, hits_to_maintain_track, reports_range, reports_bearing, reports_iff, 传感器
- **出处**：`sensor_demos/coherent_sensor_demo.txt:29-72`
- **片段**：

```text
sensor EW_RADAR WSF_RADAR_SENSOR
   #show_calibration_data
   frame_time                      10.0 sec

   beam 1
      one_m2_detect_range          100 nm
      maximum_range                120 nm

      antenna_height               6 m

      scan_mode                    azimuth
      azimuth_scan_limits         -180 deg 180 deg

      transmitter
         antenna_pattern           EW_RADAR_ANTENNA
         beam_tilt                  10 deg
         power                     750 kw
         pulse_width                50 usec
         pulse_repetition_interval 750 usec // max PRI range of 225 km
         frequency                 920 mhz
      end_transmitter

      receiver
         antenna_pattern           EW_RADAR_ANTENNA
         bandwidth                 2.0 mhz
      end_receiver

   end_beam

   beam 2
      transmitter
         frequency 925 mhz
      end_transmitter
   end_beam

   required_pd                     0.5

   hits_to_establish_track         3 5
   hits_to_maintain_track          1 3

   reports_range
   reports_bearing
   reports_iff
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：frame_time, beam, required_pd, hits_to_establish_track, hits_to_maintain_track, reports_range, reports_bearing, reports_iff

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, update_interval, on, selection_mode, slew_mode, azimuth_slew_limits, elevation_slew_limits, mode_template, mode, 传感器
- **出处**：`hellfire/active_radar_hellfire/hellfire_type.txt:20-67`
- **片段**：

```text
sensor HELLFIRE_RADAR_SEEKER WSF_RADAR_SENSOR
   #debug
   update_interval             0.01 s
   on
   selection_mode            single
   slew_mode                   both

   # Gimbal limits on the hellfire RF seeker are not known, but believed greater than SAL.
   azimuth_slew_limits      -40 deg +40 deg
   elevation_slew_limits    -40 deg +40 deg

   mode_template
      # Instantaneous FOV of seeker is not known, but probably changes with illumination mode.
      azimuth_field_of_view    -10 deg +10 deg
      elevation_field_of_view  -10 deg +10 deg

      maximum_range            10 km
      scan_stabilization          roll

      azimuth_cue_rate         30 deg/sec
      elevation_cue_rate       30 deg/sec

      azimuth_scan_limits     -30 deg +30 deg
      elevation_scan_limits   -30 deg +30 deg

      scan_mode                   both

      transmitter
         frequency 94 ghz  # Take advantage of moisture absorption notch
         power      1 w    # Unknown
      end_transmitter

      receiver
         frequency 94 ghz  # Take advantage of moisture absorption notch
      end_receiver

      reports_location
      reports_velocity
      reports_range
      reports_bearing
      reports_elevation
      reports_range_rate
   end_mode_template

   mode TRACK  // While flying out, and tracking, null LOS to target.
     frame_time 0.01 sec
   end_mode
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：update_interval, on, selection_mode, slew_mode, azimuth_slew_limits, elevation_slew_limits, mode_template, mode

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, frame_time, beam, required_pd, hits_to_establish_track, hits_to_maintain_track, reports_range, reports_bearing, reports_signal_to_noise, 传感器
- **出处**：`electronic_warfare/jamming_perception.txt:48-106`
- **片段**：

```text
sensor EW_RADAR WSF_RADAR_SENSOR
   #show_calibration_data

   frame_time                    10.0 sec

   beam 1
      maximum_range                120 nm
   
      antenna_height                6.0 m

      scan_mode                     azimuth
      azimuth_scan_limits           -180 deg 180 deg

      transmitter
         antenna_pattern            EW_RADAR_ANTENNA
         beam_tilt                  20.0 deg
         power                      100.0 kw
         frequency                  200 mhz
         pulse_width                25 usec
         pulse_repetition_interval  1250 usec
         internal_loss              2 db
      end_transmitter

      receiver
         beam_tilt                  5.0 deg
         bandwidth                  20.0 mhz
         noise_power                -160 dBw  # will be calibrated for 1 m^2
         internal_loss              7 dB
      end_receiver

      # Swerling detector
      swerling_case                 1
      probability_of_false_alarm    1.0e-6
      number_of_pulses_integrated   16

      continuous_jamming_perception_threshold 15 db
      pulsed_jamming_perception_threshold     15 db
   end_beam

   beam 2
      transmitter
         frequency                  250 mhz
         beam_tilt                  65 deg
      end_transmitter
      receiver
         beam_tilt                  65 deg
      end_receiver
      #continuous_jamming_perception_threshold 15 db
   end_beam

   required_pd                   0.5

   hits_to_establish_track       3 5   # 3 of last 5 scans to establish track
   hits_to_maintain_track        1 3   # 1 of last 3 scans to maintain  track

   reports_range
   reports_bearing
   reports_signal_to_noise
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：frame_time, beam, required_pd, hits_to_establish_track, hits_to_maintain_track, reports_range, reports_bearing, reports_signal_to_noise

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, debug, frame_time, beam, hits_to_establish_track, hits_to_maintain_track, reports_range, reports_bearing, reports_elevation, 传感器
- **出处**：`sensor_demos/composite_demo.txt:46-104`
- **片段**：

```text
sensor EW_RADAR WSF_RADAR_SENSOR
   #show_calibration_data
   debug

   frame_time                         10 sec

   beam 1
      antenna_height                     10 m

      scan_mode                          azimuth_and_elevation
      azimuth_scan_limits                -45 deg 45 deg
      elevation_scan_limits              -45 deg 45 deg

      antenna_tilt                       40 deg

      transmitter
         antenna_pattern                 EW_RADAR_ANTENNA
         power                           100 kw
         frequency                       200 mhz
         polarization                    horizontal
         pulse_width                     50 us
         pulse_repetition_interval       1250 usec
         internal_loss                   2 db
         attenuation_model               earce
      end_transmitter

      receiver
         antenna_pattern                 EW_RADAR_ANTENNA
         beam_tilt                       10.0 deg
         bandwidth                       2.0 mhz
         noise_power                     -150 dBw
         internal_loss                   7 dB
      end_receiver

      clutter_model                      EW_RADAR_CLUTTER_B1


      swerling_case                      1
      probability_of_false_alarm         10e-6
      number_of_pulses_integrated        32
      detector_law                       linear
   end_beam

   beam 2
      transmitter
         frequency                       225 mhz
      end_transmitter

      clutter_model                      EW_RADAR_CLUTTER_B2
   end_beam


   hits_to_establish_track             3 5
   hits_to_maintain_track              1 3

   reports_range
   reports_bearing
   reports_elevation
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：debug, frame_time, beam, hits_to_establish_track, hits_to_maintain_track, reports_range, reports_bearing, reports_elevation

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, category, selection_mode, slew_mode, azimuth_slew_limits, elevation_slew_limits, send_track_drop_on_turn_off, mode_template, mode, 传感器
- **出处**：`iads_c2_demos/sensors/ttr_radar.txt:24-95`
- **片段**：

```text
sensor TTR_RADAR WSF_RADAR_SENSOR

   category TTR

   selection_mode                 multiple

   slew_mode                      azimuth_and_elevation
   azimuth_slew_limits            -180 deg 180 deg
   elevation_slew_limits          0.0 deg 80.0 deg

   send_track_drop_on_turn_off    true # typically want this on TAR and TTR radars so we get the appropriate drop tracks SM offs

   mode_template
      one_m2_detect_range            35.0 nm

      antenna_height                 4.0 m

      transmitter
         antenna_pattern             TTR_RADAR_ANTENNA
         power                       1000.0 kw
         frequency                   9500 mhz
         internal_loss               2 db
      end_transmitter

      receiver
         antenna_pattern             TTR_RADAR_ANTENNA
         bandwidth                   500.0 khz
         noise_power                 -160 dBw  # will be calibrated for 1 m^2
         internal_loss               7 dB
      end_receiver

      probability_of_false_alarm     1.0e-6
      required_pd                    0.5
      swerling_case                  1

      reports_range
      reports_bearing
      reports_elevation
      reports_velocity
   end_mode_template

   mode ACQUIRE
      maximum_request_count          1

      scan_mode                      azimuth_and_elevation
      azimuth_scan_limits            -5 deg 5 deg
      elevation_scan_limits          -5 deg 5 deg

      frame_time                     2.0 sec

      hits_to_establish_track        3 5
      hits_to_maintain_track         1 3

      track_quality                  0.9   # near 'weapons' grade

      on_success TRACK
   end_mode

   mode TRACK
      maximum_request_count          6

      scan_mode                      azimuth_and_elevation
      azimuth_scan_limits            -1 deg 1 deg
      elevation_scan_limits          -1 deg 1 deg
      frame_time                     1.0 sec

      hits_to_establish_track        3 5
      hits_to_maintain_track         1 3

      track_quality                  1.0   # 'weapons' grade
   end_mode
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：category, selection_mode, slew_mode, azimuth_slew_limits, elevation_slew_limits, send_track_drop_on_turn_off, mode_template, mode

### sensor · WSF_ESM_SENSOR｜传感器

- **关键词**：sensor, WSF_ESM_SENSOR, on, frame_time, frequency_band, reports_location, reports_frequency, processor, ignore, 传感器
- **出处**：`alv_routing/platforms/awacs.txt:31-39`　（同签名共 6 处，另见 `script_demos/script_demo_2.txt:344`、`script_demos/script_demo_5.txt:312`、`script_demos/script_demo_6.txt:312`）
- **片段**：

```text
   sensor esm-1 WSF_ESM_SENSOR
      on
      frame_time 5 sec
      frequency_band 1000 mhz 2000 mhz    // L-band
      reports_location
      reports_frequency
      processor track-proc
      ignore no_awacs_esm
   end_sensor
```

- **演示要点**：演示 WSF_ESM_SENSOR 的参数：on, frame_time, frequency_band, reports_location, reports_frequency, processor, ignore

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, location, ignore_same_side, frame_time, reports_location, on, track_quality, internal_link, 传感器
- **出处**：`engage/simple_flight_path.txt:47-55`
- **片段**：

```text
   sensor find WSF_GEOMETRIC_SENSOR
      location 100 0.0 0.0 m
      ignore_same_side
      frame_time 10 sec
      reports_location
      on
      track_quality 0.5
      internal_link tracker
   end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：location, ignore_same_side, frame_time, reports_location, on, track_quality, internal_link

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, on, reports_location, maximum_range, frame_time, azimuth_field_of_view, elevation_field_of_view, processor, 传感器
- **出处**：`space_operations/platforms/starlink_linkable.txt:33-41`
- **片段**：

```text
   sensor detect WSF_GEOMETRIC_SENSOR
      on
      reports_location
      maximum_range 1500 km
      frame_time 20 sec
      azimuth_field_of_view -180 deg 180 deg
      elevation_field_of_view -90 deg 90 deg
      processor link-proc
   end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：on, reports_location, maximum_range, frame_time, azimuth_field_of_view, elevation_field_of_view, processor

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, ignore_same_side, frame_time, reports_location, on, track_quality, internal_link, debug, 传感器
- **出处**：`engage/flight_path.txt:47-56`
- **片段**：

```text
   sensor find WSF_GEOMETRIC_SENSOR
      #location 0 0 0 m
      ignore_same_side
      frame_time 10 sec
      reports_location
      on
      track_quality 0.5
      internal_link tracker
      debug
   end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：ignore_same_side, frame_time, reports_location, on, track_quality, internal_link, debug

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, on, ignore_same_side, internal_link, frame_time, hits_to_establish_track, hits_to_maintain_track, reports_location, 传感器
- **出处**：`electronic_warfare/comm_jamming.txt:116-126`
- **片段**：

```text
   sensor my-sensor WSF_GEOMETRIC_SENSOR
      on
      ignore_same_side
      internal_link track-proc
      frame_time 5 sec
      hits_to_establish_track 1 1
      hits_to_maintain_track 1 1

      reports_location
      //reports_signal_to_noise
   end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：on, ignore_same_side, internal_link, frame_time, hits_to_establish_track, hits_to_maintain_track, reports_location

### sensor · WSF_ESM_SENSOR｜传感器

- **关键词**：sensor, WSF_ESM_SENSOR, frame_time, azimuth_field_of_view, elevation_field_of_view, frequency_band, receiver, antenna_pattern, noise_power, 传感器
- **出处**：`sensor_plot/esm/hm-jammer-detect-1.txt:27-37`　（同签名共 3 处，另见 `sensor_plot/esm/hm-jammer-detect-2.txt:27`、`sensor_plot/radar/hm-jammer-detect.txt:31`）
- **片段**：

```text
sensor PASSIVE_SNSR WSF_ESM_SENSOR
  frame_time    0.5 sec
  azimuth_field_of_view     -180 deg 180 deg
  elevation_field_of_view   -90 deg 90 deg
  frequency_band   1.0 ghz  100.0 ghz

  receiver
    antenna_pattern constAntenna
    noise_power   -120 dbm
  end_receiver
end_sensor
```

- **演示要点**：演示 WSF_ESM_SENSOR 的参数：frame_time, azimuth_field_of_view, elevation_field_of_view, frequency_band, receiver, antenna_pattern, noise_power

### sensor · WSF_EOIR_SENSOR｜传感器

- **关键词**：sensor, WSF_EOIR_SENSOR, frame_time, slew_mode, azimuth_field_of_view, azimuth_slew_limits, elevation_slew_limits, angular_resolution, reports_location, 传感器
- **出处**：`sensor_plot/eoir/fighter_eoir.txt:9-21`
- **片段**：

```text
sensor FIGHTER_EOIR WSF_EOIR_SENSOR
   frame_time 1 s
   slew_mode                           azimuth_and_elevation
   #azimuth_slew_limits                 -60 deg 60 deg
   #elevation_slew_limits               -60 deg 60 deg
   azimuth_field_of_view               -60 deg 60 deg
   azimuth_slew_limits                 -6 deg 6 deg
   elevation_slew_limits               -6 deg 6 deg

   angular_resolution 0.01 deg
   reports_location

end_sensor
```

- **演示要点**：演示 WSF_EOIR_SENSOR 的参数：frame_time, slew_mode, azimuth_field_of_view, azimuth_slew_limits, elevation_slew_limits, angular_resolution, reports_location

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, frame_time, maximum_range, slew_mode, field_of_view, check_terrain_masking, ignore_same_side, reports_location, 传感器
- **出处**：`coverage_demos/sensors/ground_sensor_geo.txt:11-26`
- **片段**：

```text
sensor GROUND_STATION_SENSOR WSF_GEOMETRIC_SENSOR 
   frame_time 20 s
   maximum_range 40000 km
      
   slew_mode azimuth_and_elevation
      
   field_of_view rectangular 
      azimuth_field_of_view -2.5 deg 2.5 deg
      elevation_field_of_view -2.5 deg 2.5 deg 
   end_field_of_view
          
   check_terrain_masking enable
      
   ignore_same_side       
   reports_location      
end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：frame_time, maximum_range, slew_mode, field_of_view, check_terrain_masking, ignore_same_side, reports_location

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, receive_only, frame_time, receiver, detection_threshold, integration_gain, reports_range, reports_bearing, 传感器
- **出处**：`sensor_demos/bistatic_demo.txt:35-60`　（同签名共 8 处，另见 `sensor_demos/bistatic_sp_false_target_jamming_demo.txt:67`、`sensor_demos/bistatic_sp_noise_jamming_demo.txt:50`、`sensor_demos/bistatic_support_false_target_jamming_demo.txt:73`）
- **片段**：

```text
sensor BISTATIC_SENSOR_RCVR WSF_RADAR_SENSOR
   #debug

   receive_only

   frame_time            1.0 sec

   receiver
      antenna_pattern    BISTATIC_RX_ANTENNA
      antenna_height     9 m
      frequency          100 mhz
      bandwidth          200 khz
      noise_figure         7 db

      check_transmitter_masking false
   end_receiver

   detection_threshold    15 db
   integration_gain 1e5 absolute // Signal Processing Gain, Gsp = Tsp * Br = 0.5 sec * 200e3 1/sec
   #probability_of_false_alarm  1.0e-6
   #required_pd                    0.9
   #swerling_case                  1

   reports_range
   reports_bearing
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：receive_only, frame_time, receiver, detection_threshold, integration_gain, reports_range, reports_bearing

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, frame_time, beam, required_pd, hits_to_establish_track, hits_to_maintain_track, reports_range, reports_bearing, 传感器
- **出处**：`electronic_warfare/esm_detect_multi_beam_radar.txt:85-141`　（同签名共 3 处，另见 `electronic_warfare/esm_detect_multi_sensor_radar.txt:119`、`electronic_warfare/esm_detect_multi_sensor_radar.txt:181`）
- **片段**：

```text
sensor EW_RADAR WSF_RADAR_SENSOR
   #show_calibration_data

   frame_time                   10.0 sec

   beam 1
      one_m2_detect_range          100.0 nm
      maximum_range                120 nm

      antenna_height               6.0 m

      scan_mode                    azimuth_and_elevation
      azimuth_scan_limits          -180 deg 180 deg
      elevation_scan_limits        -6 deg 2.5 deg

      transmitter
         antenna_pattern            EW_RADAR_ANTENNA
         power                      1000.0 kw
         frequency                  200 mhz
         pulse_width                25 usec
         pulse_repetition_interval  1250 usec
         internal_loss              2 db
      end_transmitter

      receiver
         beam_tilt                  10.0 deg
         bandwidth                  2.0 mhz
         noise_power                -160 dBw  # will be calibrated for 1 m^2
         internal_loss              7 dB
      end_receiver

      # Swerling detector
      swerling_case                 1
      probability_of_false_alarm    1.0e-6
      number_of_pulses_integrated   32
   end_beam

   beam 2
         elevation_scan_limits         5 deg 7.5 deg
   end_beam

   beam 3
         elevation_scan_limits         10 deg 27.5 deg

         transmitter
            power 0.01 w
         end_transmitter
   end_beam

   required_pd                   0.5

   hits_to_establish_track       3 5   # 3 of last 5 scans to establish track
   hits_to_maintain_track        1 3   # 1 of last 3 scans to maintain  track

   reports_range
   reports_bearing
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：frame_time, beam, required_pd, hits_to_establish_track, hits_to_maintain_track, reports_range, reports_bearing

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, debug_tracker, selection_mode, slew_mode, azimuth_slew_limits, elevation_slew_limits, mode_template, mode, 传感器
- **出处**：`electronic_warfare/test_false_targets/sensors/radar/ttr_radar.txt:25-106`
- **片段**：

```text
sensor TTR_RADAR WSF_RADAR_SENSOR

   debug_tracker
   #debug_scheduler

   selection_mode                 multiple

   slew_mode                      azimuth_and_elevation
   azimuth_slew_limits            -180 deg 180 deg
   elevation_slew_limits          0.0 deg 80.0 deg

   mode_template
      one_m2_detect_range            35.0 nm

      antenna_height                 4.0 m

      false_target_screener SCREENER WSF_FT_SCREENER
         #debug
         track_capacity     1000
         plot_capacity      1000
         transfer_capacity  1000
         request_based_tracking true
         #only_screen_false_target_track_requests true
      end_false_target_screener

      transmitter
         antenna_pattern             TTR_RADAR_ANTENNA
         power                       1000.0 kw
         frequency                   9500 mhz
         internal_loss               2 db
         pulse_repetition_interval   225 usec
         pulse_width                  25 usec
      end_transmitter

      receiver
         antenna_pattern             TTR_RADAR_ANTENNA
         bandwidth                   500.0 khz
         noise_power                 -160 dBw  # will be calibrated for 1 m^2
         internal_loss               7 dB
      end_receiver

      probability_of_false_alarm     1.0e-6
      required_pd                    0.5
      swerling_case                  1

      reports_range
      reports_bearing
      reports_elevation
      reports_velocity
   end_mode_template

   mode ACQUIRE
      maximum_request_count          1

      scan_mode                      azimuth_and_elevation
      azimuth_scan_limits            -5 deg 5 deg
      elevation_scan_limits          -5 deg 5 deg

      frame_time                     2.0 sec

      hits_to_establish_track        3 5
      hits_to_maintain_track         1 3

      track_quality                  0.8   // near 'weapons' grade
   end_mode

   mode TRACK
      maximum_request_count          6

      frame_time                     1.0 sec

      hits_to_establish_track        3 5
      hits_to_maintain_track         1 3

      track_quality                  1.0   // 'weapons' grade

      #transmitter
      #   frequency                   9800 mhz
      #end_transmitter

   end_mode
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：debug_tracker, selection_mode, slew_mode, azimuth_slew_limits, elevation_slew_limits, mode_template, mode

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, selection_mode, slew_mode, azimuth_slew_limits, elevation_slew_limits, mode_template, mode, ignore_same_side, 传感器
- **出处**：`engage/radars/lrsam_ttr.txt:20-105`
- **片段**：

```text
sensor LRSAM_TTR WSF_RADAR_SENSOR

   selection_mode                      multiple

   slew_mode                           azimuth_and_elevation
   azimuth_slew_limits                 -180 deg 180 deg
   elevation_slew_limits               0.0 deg 80.0 deg

   mode_template
      maximum_request_count            1
      one_m2_detect_range              150.0 nm

      antenna_height                   4.0 m

      transmitter
         antenna_pattern               LRSAM_TTR_ANTENNA
         power                         1000.0 kw
         frequency                     9500 mhz
         internal_loss                 2 db
      end_transmitter

      receiver
         antenna_pattern               LRSAM_TTR_ANTENNA
         bandwidth                     500.0 khz
         noise_power                   -160 dBw  # will be calibrated for 1 m^2
         internal_loss                 7 dB
      end_receiver

      probability_of_false_alarm       1.0e-6
      required_pd                      0.5
      swerling_case                    1

      reports_range
      reports_bearing
      reports_elevation
      reports_velocity
   end_mode_template

   mode SEARCH
      cue_mode azimuth
      scan_mode                       azimuth_and_elevation
      azimuth_scan_limits            -10 deg 10 deg
      elevation_scan_limits            0 deg 40 deg

      frame_time                       2.0 sec

      hits_to_establish_track          3 5
      hits_to_maintain_track           1 3

      track_quality                    0.7   # 'weapons' grade
   end_mode

   mode ACQUIRE
      maximum_request_count            1

      scan_mode                        azimuth_and_elevation
      azimuth_scan_limits              -2 deg 2 deg
      elevation_scan_limits            -2 deg 2 deg

      frame_time                       1.0 sec

      hits_to_establish_track          2 4
      hits_to_maintain_track           1 3

      track_quality                    0.9
   end_mode

   mode TRACK
      maximum_request_count            1

      scan_mode                        azimuth_and_elevation
      azimuth_scan_limits              -1 deg 1 deg
      elevation_scan_limits            -1 deg 1 deg

      frame_time                       1.0 sec

      hits_to_establish_track          2 4
      hits_to_maintain_track           1 3

      track_quality                    1.0   # 'weapons' grade
   end_mode

   ignore_same_side

   #debug_scheduler
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：selection_mode, slew_mode, azimuth_slew_limits, elevation_slew_limits, mode_template, mode, ignore_same_side

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, off, ignore_same_side, reports_location, maximum_range, frame_time, internal_link, 传感器
- **出处**：`comm/group_comm_example.txt:80-87`
- **片段**：

```text
   sensor geo WSF_GEOMETRIC_SENSOR
      off
      ignore_same_side
      reports_location
      maximum_range 100 nm
      frame_time 1 sec
      internal_link track_proc
   end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：off, ignore_same_side, reports_location, maximum_range, frame_time, internal_link

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, ignore_same_side, frame_time, reports_location, on, track_quality, internal_link, 传感器
- **出处**：`engage/grid.txt:47-54`　（同签名共 5 处，另见 `engage/grid_react_man.txt:55`、`engage/grid_w_observer.txt:47`、`engage/flight_route.txt:47`）
- **片段**：

```text
   sensor find WSF_GEOMETRIC_SENSOR
      ignore_same_side
      frame_time 10 sec
      reports_location
      on
      track_quality 0.5
      internal_link tracker
   end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：ignore_same_side, frame_time, reports_location, on, track_quality, internal_link

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, on, reports_location, frame_time, azimuth_field_of_view, elevation_field_of_view, ignore, 传感器
- **出处**：`satellite_demos/platforms/commander.txt:17-25`
- **片段**：

```text
   sensor detect WSF_GEOMETRIC_SENSOR
      on
      reports_location
      frame_time 1 min
      azimuth_field_of_view -180 deg 180 deg
      elevation_field_of_view -90 deg 90 deg
      ignore sat_sensor
#      ignore iridium
   end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：on, reports_location, frame_time, azimuth_field_of_view, elevation_field_of_view, ignore

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, ignore_same_side, frame_time, reports_bearing, reports_elevation, azimuth_error_sigma, elevation_error_sigma, 传感器
- **出处**：`space_operations/scenarios/ssn_laydown.txt:11-19`
- **片段**：

```text
sensor TELESCOPE WSF_GEOMETRIC_SENSOR
   ignore_same_side
   frame_time 2 seconds
   frame_time 100 seconds
   reports_bearing
   reports_elevation
   azimuth_error_sigma 1.0e-4 rad
   elevation_error_sigma 1.0e-4 rad
end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：ignore_same_side, frame_time, reports_bearing, reports_elevation, azimuth_error_sigma, elevation_error_sigma

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, frame_time, azimuth_slew_rate, elevation_slew_rate, reports_bearing, reports_elevation, modifier_category, 传感器
- **出处**：`space_operations/cloud_attenuation.txt:39-48`
- **片段**：

```text
sensor TELESCOPE WSF_GEOMETRIC_SENSOR
   frame_time 10 seconds

   azimuth_slew_rate        18 deg/sec       # AEOST azimuth track rate
   elevation_slew_rate      4.75 deg/sec     # AEOST elevation track rate

   reports_bearing
   reports_elevation
   modifier_category cloud_mod
end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：frame_time, azimuth_slew_rate, elevation_slew_rate, reports_bearing, reports_elevation, modifier_category

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, frame_time, maximum_range, check_terrain_masking, hits_to_establish_track, hits_to_maintain_track, reports_location, 传感器
- **出处**：`coverage_demos/sensors/ground_station_sensor.txt:11-21`
- **片段**：

```text
sensor GROUND_STATION_SENSOR WSF_GEOMETRIC_SENSOR 
   frame_time 1 s
   maximum_range 400 km
   
   check_terrain_masking enable
   
   hits_to_establish_track 1 1
   hits_to_maintain_track 1 1
   
   reports_location
end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：frame_time, maximum_range, check_terrain_masking, hits_to_establish_track, hits_to_maintain_track, reports_location

### sensor · WSF_EOIR_SENSOR｜传感器

- **关键词**：sensor, WSF_EOIR_SENSOR, on, frame_time, angular_resolution, reports_location, ignore_same_side, internal_link, 传感器
- **出处**：`example_scripts/output_file_demo.txt:43-54`
- **片段**：

```text
   sensor eoir WSF_EOIR_SENSOR
      on
      frame_time 10 sec
      angular_resolution 0.001 deg
      reports_location
      ignore_same_side
#      slew_mode azimuth_and_elevation
#      azimuth_field_of_view -60 deg 60 deg
#      azimuth_slew_limits -6 deg 6 deg
#      elevation_slew_limits -6 deg 6 deg
      internal_link image_proc
   end_sensor
```

- **演示要点**：演示 WSF_EOIR_SENSOR 的参数：on, frame_time, angular_resolution, reports_location, ignore_same_side, internal_link

### sensor（ucav）｜传感器

- **关键词**：sensor, off, yaw, pitch, aux_data, internal_link, ignore_same_side, 传感器
- **出处**：`electronic_warfare/test_multi_beam/platforms/ucav.txt:38-50`　（同签名共 6 处，另见 `electronic_warfare/test_multi_beam/platforms/ucav.txt:52`、`iads/platforms/ucav.txt:38`、`iads/platforms/ucav.txt:52`）
- **片段**：

```text
   sensor sar_left SAR_RADAR
      off
      yaw       -60 deg
      pitch     -10 deg
      aux_data
         double min_frequency_band_hz = 8e9
         double max_frequency_band_hz = 12e9
         double pref_az_aspect1_deg   = -50
         double pref_az_aspect2_deg   = -85
      end_aux_data
      internal_link image_proc
      ignore_same_side
   end_sensor
```

- **演示要点**：演示 sensor 的参数：off, yaw, pitch, aux_data, internal_link, ignore_same_side

### sensor · WSF_ESM_SENSOR｜传感器

- **关键词**：sensor, WSF_ESM_SENSOR, frame_time, azimuth_field_of_view, elevation_field_of_view, frequency_band, receiver, reports_location, 传感器
- **出处**：`sensor_plot/esm/hm-reverse.txt:16-28`
- **片段**：

```text
sensor ESM WSF_ESM_SENSOR
   frame_time    0.5 sec
   azimuth_field_of_view     -180 deg 180 deg
   elevation_field_of_view   -90 deg 90 deg
   frequency_band   1.0 ghz  100.0 ghz

   receiver
     antenna_pattern constAntenna
     noise_power   -120 dbm
   end_receiver

   reports_location
end_sensor
```

- **演示要点**：演示 WSF_ESM_SENSOR 的参数：frame_time, azimuth_field_of_view, elevation_field_of_view, frequency_band, receiver, reports_location

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, selection_mode, slew_mode, azimuth_slew_limits, elevation_slew_limits, mode_template, mode, 传感器
- **出处**：`cyber/exfiltrate_demo/sensors/radar/ttr_radar.txt:24-89`　（同签名共 11 处，另见 `cyber/sensors/radar/sr_sam_ttr_radar_sensor.txt:21`、`iads/sensors/radar/ttr_radar.txt:24`、`orwaca_iads/sensors/radar/elr_sam_ttr_radar_sensor.txt:19`）
- **片段**：

```text
sensor TTR_RADAR WSF_RADAR_SENSOR

   selection_mode                 multiple

   slew_mode                      azimuth_and_elevation
   azimuth_slew_limits            -180 deg 180 deg
   elevation_slew_limits          0.0 deg 80.0 deg

   mode_template
      one_m2_detect_range            35.0 nm

      antenna_height                 4.0 m

      transmitter
         antenna_pattern             TTR_RADAR_ANTENNA
         power                       1000.0 kw
         frequency                   9500 mhz
         internal_loss               2 db
      end_transmitter

      receiver
         antenna_pattern             TTR_RADAR_ANTENNA
         bandwidth                   500.0 khz
         noise_power                 -160 dBw  # will be calibrated for 1 m^2
         internal_loss               7 dB
      end_receiver

      probability_of_false_alarm     1.0e-6
      required_pd                    0.5
      swerling_case                  1

      reports_range
      reports_bearing
      reports_elevation
      reports_velocity
   end_mode_template

   mode ACQUIRE
      maximum_request_count          1

      scan_mode                      azimuth_and_elevation
      azimuth_scan_limits            -5 deg 5 deg
      elevation_scan_limits          -5 deg 5 deg

      frame_time                     2.0 sec

      hits_to_establish_track        3 5
      hits_to_maintain_track         1 3

      track_quality                  0.8   // near 'weapons' grade
   end_mode

   mode TRACK
      maximum_request_count          6

      scan_mode                      azimuth_and_elevation
      azimuth_scan_limits            -1 deg 1 deg
      elevation_scan_limits          -1 deg 1 deg
      frame_time                     1.0 sec

      hits_to_establish_track        3 5
      hits_to_maintain_track         1 3

      track_quality                  1.0   // 'weapons' grade
   end_mode
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：selection_mode, slew_mode, azimuth_slew_limits, elevation_slew_limits, mode_template, mode

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, off, maximum_range, frame_time, reports_location, processor, 传感器
- **出处**：`distributed_operations/xio_setup.txt:27-33`
- **片段**：

```text
   sensor sensor-1 WSF_GEOMETRIC_SENSOR
      off
      maximum_range 100 nm
      frame_time 2.0 s
      reports_location
      processor link-proc
   end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：off, maximum_range, frame_time, reports_location, processor

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, on, processor, reports_location, reports_velocity, frame_time, 传感器
- **出处**：`hel/hel_test.txt:39-45`　（同签名共 3 处，另见 `hel/intersect_mesh_test.txt:259`、`hel/intersect_mesh_test_beam_director.txt:262`）
- **片段**：

```text
   sensor all-seeing WSF_GEOMETRIC_SENSOR
      on
      processor fuser
      reports_location
      reports_velocity
      frame_time 1.0 second
   end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：on, processor, reports_location, reports_velocity, frame_time

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, on, reports_location, frame_time, azimuth_field_of_view, elevation_field_of_view, 传感器
- **出处**：`satellite_demos/platforms/galileo_gs.txt:17-23`　（同签名共 3 处，另见 `satellite_demos/platforms/iridium_gs.txt:70`、`satellite_demos/platforms/iridium_handheld.txt:10`）
- **片段**：

```text
   sensor detect WSF_GEOMETRIC_SENSOR
      on
      reports_location
      frame_time 1 min
      azimuth_field_of_view -180 deg 180 deg
      elevation_field_of_view -90 deg 90 deg
   end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：on, reports_location, frame_time, azimuth_field_of_view, elevation_field_of_view

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, off, frame_time, ignore, reports_location, modifier_category, 传感器
- **出处**：`satellite_demos/platforms/gps.txt:30-36`
- **片段**：

```text
   sensor optical WSF_GEOMETRIC_SENSOR
      off
      frame_time 10 sec
      ignore GPS
      reports_location
      modifier_category cloud_mod
   end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：off, frame_time, ignore, reports_location, modifier_category

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, frame_time, maximum_range, ignore_same_side, reports_location, on, 传感器
- **出处**：`sensor_demos/nav_demo.txt:69-75`
- **片段**：

```text
   sensor perfect WSF_GEOMETRIC_SENSOR
      frame_time 10 sec
      maximum_range 200 km
      ignore_same_side
      reports_location
      on
   end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：frame_time, maximum_range, ignore_same_side, reports_location, on

### sensor（uav_sar）｜传感器

- **关键词**：sensor, show_status, yaw, pitch, internal_link, automatic_turn_off, 传感器
- **出处**：`sensor_demos/platforms/uav_sar.txt:55-61`　（同签名共 2 处，另见 `sensor_demos/platforms/uav_sar.txt:63`）
- **片段**：

```text
   sensor sar_right GENERIC_SAR
      show_status
      yaw                    90 deg
      pitch                  -5 deg
      internal_link          image_proc
      automatic_turn_off
   end_sensor
```

- **演示要点**：演示 sensor 的参数：show_status, yaw, pitch, internal_link, automatic_turn_off

### sensor（ssn_laydown）｜传感器

- **关键词**：sensor, on, internal_link, azimuth_error_sigma, elevation_error_sigma, range_error_sigma, 传感器
- **出处**：`space_operations/scenarios/ssn_laydown.txt:255-261`
- **片段**：

```text
   sensor millstone_radar RADAR
      on
      internal_link report
      azimuth_error_sigma 0.01 deg
      elevation_error_sigma 0.01 deg
      range_error_sigma 5 m
   end_sensor
```

- **演示要点**：演示 sensor 的参数：on, internal_link, azimuth_error_sigma, elevation_error_sigma, range_error_sigma

### sensor · WSF_SOSM_SENSOR｜传感器

- **关键词**：sensor, WSF_SOSM_SENSOR, frame_time, azimuth_field_of_view, elevation_field_of_view, reports_bearing, reports_elevation, 传感器
- **出处**：`sosm/test_mission/a2a/test_a2a.txt:21-29`
- **片段**：

```text
sensor LWIR_SENSOR WSF_SOSM_SENSOR
   frame_time                5 sec

   azimuth_field_of_view     -90 deg 90 deg
   elevation_field_of_view   -90 deg 90 deg

   reports_bearing
   reports_elevation
end_sensor
```

- **演示要点**：演示 WSF_SOSM_SENSOR 的参数：frame_time, azimuth_field_of_view, elevation_field_of_view, reports_bearing, reports_elevation

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, frame_time, pitch, reports_location, field_of_view, yaw, 传感器
- **出处**：`space_operations/attitude_control.txt:95-103`
- **片段**：

```text
   sensor sensor WSF_GEOMETRIC_SENSOR
      frame_time 2 s
      pitch -90 deg
      reports_location
      field_of_view circular
         half_angle 5 deg
      end_field_of_view
      yaw 0 degrees
   end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：frame_time, pitch, reports_location, field_of_view, yaw

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, on, reports_location, frame_time, maximum_range, ignore, 传感器
- **出处**：`space_operations/sensors/sense_iridium.txt:12-20`
- **片段**：

```text
sensor SENSE_IRIDIUM WSF_GEOMETRIC_SENSOR
   on
   reports_location
   frame_time 10 s
   maximum_range 1500 nm
   ignore commander
   ignore launch
   ignore sat_sensor
end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：on, reports_location, frame_time, maximum_range, ignore

### sensor · WSF_ESM_SENSOR｜传感器

- **关键词**：sensor, WSF_ESM_SENSOR, frame_time, frequency_band, receiver, antenna_pattern, error_model, 传感器
- **出处**：`sensor_plot/esm/hm-tdoa.txt:44-61`
- **片段**：

```text
sensor PASSIVE_SNSR WSF_ESM_SENSOR
  frame_time    0.5 sec
  frequency_band   1.0 ghz  100.0 ghz

  receiver
    antenna_pattern constAntenna
  end_receiver

   error_model trimsim_error
      north_position_error_sigma      0.1 ft
      east_position_error_sigma       0.1 ft
      down_position_error_sigma       0.1 ft
      reference_time_error            5.0 ns
      inter_system_time_delay         5.0 ns
      sensor_timing_error             0.0 s
      atmospheric_refraction_residual 0.0
   end_error_model
end_sensor
```

- **演示要点**：演示 WSF_ESM_SENSOR 的参数：frame_time, frequency_band, receiver, antenna_pattern, error_model

### sensor · WSF_ESM_SENSOR｜传感器

- **关键词**：sensor, WSF_ESM_SENSOR, frame_time, receiver, detection_threshold, reports_range, reports_bearing, 传感器
- **出处**：`sensor_plot/radar/hm-bistatic-ft-jamming-lab.txt:70-95`
- **片段**：

```text
sensor BISTATIC_SENSOR_RCVR WSF_ESM_SENSOR
   #debug

   #receive_only

   frame_time            1.0 sec

   receiver
      antenna_pattern    BISTATIC_RX_ANTENNA
      antenna_height     9 m
      frequency_band     100 mhz 200 mhz
      bandwidth          200 khz
      noise_figure         7 db
      #check_terrain_masking false
      #check_transmitter_masking false
   end_receiver

   detection_threshold    -35 db
   #TODO integration_gain 1e5 absolute // Signal Processing Gain, Gsp = Tsp * Br = 0.5 sec * 200e3 1/sec
   #probability_of_false_alarm  1.0e-6
   #required_pd                    0.9
   #swerling_case                  1

   reports_range
   reports_bearing
end_sensor
```

- **演示要点**：演示 WSF_ESM_SENSOR 的参数：frame_time, receiver, detection_threshold, reports_range, reports_bearing

### sensor · WSF_SAR_SENSOR｜传感器

- **关键词**：sensor, WSF_SAR_SENSOR, slew_mode, azimuth_slew_limits, elevation_slew_limits, mode_template, mode, 传感器
- **出处**：`sensor_plot/sar/example_sar.txt:22-72`　（同签名共 4 处，另见 `sensor_plot/sar/fighter_sar.txt:56`、`sensor_plot/sar/bomber_sar.txt:55`、`base_types/sensors/radar/generic_sar.txt:43`）
- **片段**：

```text
sensor EXAMPLE_SAR WSF_SAR_SENSOR

   slew_mode                           azimuth_and_elevation
   azimuth_slew_limits                 -70 deg 70 deg
   elevation_slew_limits               -70 deg 70 deg

   mode_template

      maximum_range                    100 nm
      azimuth_field_of_view            -1.58 deg 1.58 deg
      elevation_field_of_view          -1.58 deg 1.58 deg

      electronic_beam_steering         azimuth_and_elevation
      electronic_beam_steering_limit   70.0 deg            # Same as slew limits
      electronic_beam_steering_loss_exponent 1.4

      transmitter
         antenna_pattern               EXAMPLE_SAR_ANTENNA
         frequency                     9 ghz
         power                         12690.0 w
         pulse_width                   50 us
         #pulse_repetition_frequency    1000 hz
         internal_loss                 3.25 db
      end_transmitter

      receiver
         # Assume a matched-filter for a pulse width of 50 us
         bandwidth                     20 khz
         noise_figure                  4 db
         internal_loss                 3.25 db
      end_receiver

      resolution                       2 ft
      maximum_dwell_time               30 sec
      minimum_clutter_to_noise_ratio   6 db

      doppler_filter_broadening_factor 1.20                # Ka
      doppler_foldover_margin_factor   1.37                # Kd

      reports_location
   end_mode_template

   mode SPOT
      operating_mode                   spot
   end_mode

   mode STRIP
      operating_mode                   strip
   end_mode

end_sensor
```

- **演示要点**：演示 WSF_SAR_SENSOR 的参数：slew_mode, azimuth_slew_limits, elevation_slew_limits, mode_template, mode

### sensor · WSF_ESM_SENSOR｜传感器

- **关键词**：sensor, WSF_ESM_SENSOR, on, slew_mode, initial_mode, mode_template, mode, 传感器
- **出处**：`air_to_air/sensors/esm_rwr/esm.txt:27-87`
- **片段**：

```text
sensor esm WSF_ESM_SENSOR
   on
   slew_mode          fixed
   initial_mode       SEARCH
   mode_template
      antenna_tilt       0.0 deg
      minimum_altitude  -50000.0 ft
      maximum_altitude   50000.0 ft
      frame_time         10.0 sec   
      maximum_range      200.0 nm
   
#     electronic_beam_steering                azimuth_and_elevation
#     electronic_beam_steering_limit          60.0 deg
#     electronic_beam_steering_loss_exponent  1.2       # Brawler default
   
      scan_mode                 azimuth_and_elevation
      azimuth_scan_limits      -180.0 deg 180.0 deg   
      elevation_scan_limits    -90.0 deg 90.0 deg    
      azimuth_field_of_view    -180.0 deg 180.0 deg
      elevation_field_of_view  -90.0 deg 90.0 deg
   
      receiver
         antenna_pattern   esm_reciever
      end_receiver
   
      frequency_band 8.0 ghz 12.0 ghz # x-band
      detection_sensitivities
         frequency 8.0 ghz   -70.0 dbw 
         frequency 12.0 ghz  -70.0 dbw 
      end_detection_sensitivities
   
      range_error_sigma         20   percent_of_true_range
      range_rate_error_sigma    500  ft/s
      azimuth_error_sigma       0.3  deg
      elevation_error_sigma     0.3  deg
   
      hits_to_establish_track   2 2  # 
      hits_to_maintain_track    1 3  # 
   
      reports_range
      reports_range_rate
      reports_velocity
      reports_location
      reports_bearing
      reports_elevation
      reports_frequency
      reports_type
      reports_side
   end_mode_template

   mode SEARCH 
      frame_time              2 sec #  
      cue_mode                azimuth_and_elevation
      azimuth_cue_limits     -180.0 deg 180.0 deg
      elevation_cue_limits   -90.0 deg 90.0 deg
   
      scan_mode               azimuth_and_elevation
      azimuth_scan_limits    -180.0 deg 180.0 deg # 
      elevation_scan_limits  -90.0 deg 90.0 deg # 
   end_mode
end_sensor
```

- **演示要点**：演示 WSF_ESM_SENSOR 的参数：on, slew_mode, initial_mode, mode_template, mode

### sensor（hvaa）｜传感器

- **关键词**：sensor, on, ignore, ignore_same_side, internal_link, 传感器
- **出处**：`air_to_air/platforms/hvaa.txt:97-102`　（同签名共 6 处，另见 `air_to_air/platforms/lte_fighter.txt:217`、`air_to_air/platforms/lte_fighter.txt:328`、`air_to_air/platforms/dca.txt:94`）
- **片段**：

```text
    sensor rwr esm                       // 3
      on
      ignore IGNORE
      ignore_same_side
      internal_link data_mgr
   end_sensor
```

- **演示要点**：演示 sensor 的参数：on, ignore, ignore_same_side, internal_link

### sensor（ship）｜传感器

- **关键词**：sensor, on, ignore_same_side, processor, antenna_height, 传感器
- **出处**：`ciws/platforms/ship.txt:41-46`
- **片段**：

```text
  sensor red_ciws_radar_1 RED_CIWS_RADAR_1
     on 
     ignore_same_side 
     processor track_mgr     
     antenna_height                 6.0 m        # about 18 ft above waterline
  end_sensor
```

- **演示要点**：演示 sensor 的参数：on, ignore_same_side, processor, antenna_height

### sensor（draw_demo）｜传感器

- **关键词**：sensor, on, ignore, processor, modifier_category, 传感器
- **出处**：`draw/draw_demo.txt:38-43`
- **片段**：

```text
   sensor eyeball GENERIC_EYEBALL
     on
     ignore weapon
     processor attack-proc
     modifier_category fighter-eyeball-modifier
   end_sensor
```

- **演示要点**：演示 sensor 的参数：on, ignore, processor, modifier_category

### sensor（soldier）｜传感器

- **关键词**：sensor, location, internal_link, update_interval, ignore_same_side, 传感器
- **出处**：`laser_designator/platforms/soldier.txt:36-41`
- **片段**：

```text
   sensor geo_sensor GEO_SENSOR 
      location 0 0 -2 meters # about 6 ft up
      internal_link data_mgr
      update_interval 1 sec
      ignore_same_side
   end_sensor
```

- **演示要点**：演示 sensor 的参数：location, internal_link, update_interval, ignore_same_side

### sensor（sc_bomber）｜传感器

- **关键词**：sensor, sar_constraint_plotting, yaw, pitch, backscatter_coefficient, 传感器
- **出处**：`sensor_plot/sar/sc_bomber.txt:23-28`　（同签名共 4 处，另见 `sensor_plot/sar/sc_example.txt:23`、`sensor_plot/sar/sc_fighter.txt:23`、`sensor_plot/sar/sn_fighter.txt:28`）
- **片段**：

```text
   sensor sar BOMBER_SAR
      sar_constraint_plotting     true           ###### Required for SAR constraint plotting
      yaw   90 deg                               # <--- Spreadsheet value: Installed azimuth
      pitch -45 deg                              # <--- Spreadsheet value: Installed elevation
      backscatter_coefficient     -11.9 db       # <--- Spreadsheet value: Clutter backscatter
   end_sensor
```

- **演示要点**：演示 sensor 的参数：sar_constraint_plotting, yaw, pitch, backscatter_coefficient

### sensor（cloud_attenuation）｜传感器

- **关键词**：sensor, on, internal_link, elevation_error_sigma, azimuth_error_sigma, 传感器
- **出处**：`space_operations/cloud_attenuation.txt:233-238`　（同签名共 4 处，另见 `space_operations/scenarios/ssn_laydown.txt:136`、`space_operations/scenarios/ssn_laydown.txt:192`、`space_operations/scenarios/ssn_laydown.txt:235`）
- **片段**：

```text
   sensor geodss TELESCOPE
      on
      internal_link report
      elevation_error_sigma  0.00194 deg
      azimuth_error_sigma 0.00194 deg
   end_sensor
```

- **演示要点**：演示 sensor 的参数：on, internal_link, elevation_error_sigma, azimuth_error_sigma

### sensor（px_fighter）｜传感器

- **关键词**：sensor, yaw, pitch, backscatter_coefficient, mode, 传感器
- **出处**：`sensor_plot/sar/px_fighter.txt:28-40`
- **片段**：

```text
   sensor sar FIGHTER_SAR
      yaw 0 deg                                  # <--- Spreadsheet value: Installed azimuth
      pitch 27 deg                               # <--- Spreadsheet value: Installed elevation
      backscatter_coefficient -15 db             # <--- Spreadsheet value: Clutter backscatter

      # The modes must be overriden with the desired dwell time
      mode SPOT
         dwell_time 10 sec
      end_mode
      mode STRIP
         dwell_time 10 sec
      end_mode
   end_sensor
```

- **演示要点**：演示 sensor 的参数：yaw, pitch, backscatter_coefficient, mode

### sensor · WSF_ESM_SENSOR｜传感器

- **关键词**：sensor, WSF_ESM_SENSOR, frame_time, frequency_band, receiver, reports_location, 传感器
- **出处**：`sensor_plot/comm/comm.txt:57-70`
- **片段**：

```text
sensor FAKE_RADIO_RCVR WSF_ESM_SENSOR
   frame_time 1.0 sec

   frequency_band            1 ghz 2 ghz

   receiver
      frequency              1.2 ghz
      bandwidth              1 mhz
      antenna_pattern        RX_ANTENNA_PATTERN
      noise_power            -145 dbw
   end_receiver

   reports_location          # A sensor must report something
end_sensor
```

- **演示要点**：演示 WSF_ESM_SENSOR 的参数：frame_time, frequency_band, receiver, reports_location

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, transmit_only, antenna_height, frame_time, transmitter, 传感器
- **出处**：`sensor_demos/passive_detector_demo.txt:81-95`　（同签名共 2 处，另见 `sensor_demos/passive_detector_df_demo.txt:86`）
- **片段**：

```text
sensor BISTATIC_SENSOR_XMTR WSF_RADAR_SENSOR

   transmit_only

   antenna_height                 0.0 m

   frame_time                     10.0 sec

   transmitter
      antenna_pattern             BISTATIC_TX_ANTENNA
      power                        1.0 w
      frequency                  525 mhz
      bandwidth                    2.0 mhz
   end_transmitter
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：transmit_only, antenna_height, frame_time, transmitter

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, on, mode_template, mode, processor, 传感器
- **出处**：`satellite_demos/5th_iridium_flares_demo.txt:289-308`
- **片段**：

```text
   sensor local_flare_detector WSF_GEOMETRIC_SENSOR
      on

      mode_template
         maximum_range 80 km
         check_terrain_masking off
         reports_location
         reports_velocity
      end_mode_template

      mode search
         frame_time 5.0 seconds
      end_mode

      mode track
         frame_time 0.5 seconds
      end_mode

      processor dummy  // to trigger the callbacks we must send the messages to something
   end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：on, mode_template, mode, processor

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, mode_select_delay, initial_mode, mode_template, mode, 传感器
- **出处**：`electronic_warfare/agile_jamming.txt:230-308`　（同签名共 8 处，另见 `electronic_warfare/test_multi_beam/sensors/radar/ew_radar.txt:29`、`electronic_warfare/agile_auto-repeater_jamming.txt:132`、`electronic_warfare/semi-auto_repeater_jamming_1.txt:203`）
- **片段**：

```text
sensor EW_RADAR WSF_RADAR_SENSOR
   #show_calibration_data

   mode_select_delay                 30.0 sec
   initial_mode one

   mode_template
      frame_time                      10.0 sec

      frequency_select_delay 10.0 sec

      beam 1
         one_m2_detect_range          100.0 nm
         maximum_range                120 nm

         antenna_height               6.0 m

         scan_mode                    azimuth
         azimuth_scan_limits         -180 deg 180 deg


         transmitter
            antenna_pattern            EW_RADAR_ANTENNA
            beam_tilt                  10.0 deg
            power                      1000.0 kw
            frequency                  200 mhz
            pulse_width                25 usec
            pulse_repetition_interval  1250 usec
            internal_loss              2 db
            frequency_list
               frequency_id            1 200 mhz
               frequency_id            2 210 mhz
               frequency_id            3 220 mhz
            end_frequency_list
         end_transmitter

         receiver
            beam_tilt                  10.0 deg
            bandwidth                  2.0 mhz
            noise_power                -160 dBw  # will be calibrated for 1 m^2
            internal_loss              7 dB

            electronic_protect EW_RADAR_EP
            end_electronic_protect
         end_receiver

         jamming_perception_threshold  3.0 dB

         # Swerling detector
         swerling_case                 1
         probability_of_false_alarm    1.0e-6
         number_of_pulses_integrated   32
      end_beam

      required_pd                   0.5

      hits_to_establish_track       3 5   # 3 of last 5 scans to establish track
      hits_to_maintain_track        1 3   # 1 of last 3 scans to maintain  track

      reports_range
      reports_bearing
   end_mode_template

   mode one
   end_mode

   mode two
      beam 1
         transmitter
            frequency_list
               frequency_id           1 230 mhz
               frequency_id           2 240 mhz
               frequency_id           3 250 mhz
            end_frequency_list
         end_transmitter
      end_beam
   end_mode

end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：mode_select_delay, initial_mode, mode_template, mode

### sensor（ew_radar）｜传感器

- **关键词**：sensor, on, internal_link, ignore_same_side, 传感器
- **出处**：`aea_iads/platforms/ew_radar.txt:22-26`　（同签名共 46 处，另见 `aea_iads/platforms/soj.txt:404`、`alv_routing/platforms/alv.txt:135`、`ballistic_missile_shootdown/platforms/blue_abm_ttr.txt:20`）
- **片段**：

```text
  sensor ew_radar EW_RADAR
     on
     internal_link data_mgr
     ignore_same_side
  end_sensor
```

- **演示要点**：演示 sensor 的参数：on, internal_link, ignore_same_side

### sensor（lte_fighter）｜传感器

- **关键词**：sensor, on, internal_link, ignore, 传感器
- **出处**：`air_to_air/platforms/lte_fighter.txt:181-185`　（同签名共 4 处，另见 `air_to_air/platforms/lte_fighter.txt:292`、`cyber/exfiltrate_demo/platforms/ew_radar.txt:21`、`air_to_air/platforms/lte_fighter.txt:73`）
- **片段**：

```text
   sensor rdr1 aesa  
      on
      internal_link raw_data_mgr
      ignore missile
   end_sensor
```

- **演示要点**：演示 sensor 的参数：on, internal_link, ignore

### sensor（red_multirole_fighter_2_base）｜传感器

- **关键词**：sensor, on, processor, ignore_same_side, 传感器
- **出处**：`base_types/platforms/red_multirole_fighter_2_base.txt:46-50`　（同签名共 26 处，另见 `electronic_warfare/agile_auto-repeater_jamming.txt:279`、`electronic_warfare/agile_jamming.txt:342`、`electronic_warfare/agile_repeater_jamming-rt1.txt:396`）
- **片段**：

```text
   sensor red_multirole_fighter_2_radar RED_A2A_RADAR
      on
      processor track_manager
      ignore_same_side
   end_sensor
```

- **演示要点**：演示 sensor 的参数：on, processor, ignore_same_side

### sensor（acq_radar）｜传感器

- **关键词**：sensor, off, internal_link, ignore_same_side, 传感器
- **出处**：`cyber/exfiltrate_demo/platforms/acq_radar.txt:21-25`　（同签名共 23 处，另见 `cyber/exfiltrate_demo/platforms/large_sam_ttr.txt:26`、`cyber/platforms/sr_sam_telar.txt:89`、`electronic_warfare/test_false_targets/platforms/acq_radar.txt:21`）
- **片段**：

```text
  sensor acq_radar ACQ_RADAR
     off
     internal_link data_mgr
     ignore_same_side
  end_sensor
```

- **演示要点**：演示 sensor 的参数：off, internal_link, ignore_same_side

### sensor（closely_space_targets）｜传感器

- **关键词**：sensor, processor, internal_link, ignore_same_side, 传感器
- **出处**：`electronic_warfare/closely_space_targets.txt:147-151`　（同签名共 9 处，另见 `electronic_warfare/closely_space_targets_ttr.txt:200`、`electronic_warfare/false-target_command_center.txt:241`、`electronic_warfare/false-target_jamming_1.txt:252`）
- **片段**：

```text
   sensor ew_radar EW_RADAR
      processor track_manager
      internal_link track_manager
      ignore_same_side
   end_sensor
```

- **演示要点**：演示 sensor 的参数：processor, internal_link, ignore_same_side

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, frame_time, reports_location, track_quality, 传感器
- **出处**：`engage/radars/geometric_sensor.txt:11-15`
- **片段**：

```text
sensor GEOMETRIC_SENSOR WSF_GEOMETRIC_SENSOR
   frame_time 10 sec
   reports_location
   track_quality 0.5
end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：frame_time, reports_location, track_quality

### sensor（hellfire_type）｜传感器

- **关键词**：sensor, off, processor, laser_code, 传感器
- **出处**：`hellfire/laser_designation_via_dis/hellfire_type.txt:244-248`　（同签名共 2 处，另见 `hellfire/semiactive_laser_hellfire/hellfire_type.txt:243`）
- **片段**：

```text
   sensor laser_seeker HELLFIRE_LASER_TRACKER
      off
      processor track_manager
      laser_code                    1212
   end_sensor
```

- **演示要点**：演示 sensor 的参数：off, processor, laser_code

### sensor（uav_eoir）｜传感器

- **关键词**：sensor, yaw, pitch, internal_link, 传感器
- **出处**：`sensor_demos/platforms/uav_eoir.txt:55-59`
- **片段**：

```text
   sensor eoir GENERIC_EOIR
      yaw                    0 deg
      pitch                  -5 deg
      internal_link          image_proc
   end_sensor
```

- **演示要点**：演示 sensor 的参数：yaw, pitch, internal_link

### sensor（hm-jammer-detect-1）｜传感器

- **关键词**：sensor, on, reports_location, reports_signal_to_noise, 传感器
- **出处**：`sensor_plot/esm/hm-jammer-detect-1.txt:44-48`　（同签名共 2 处，另见 `sensor_plot/esm/hm-tdoa.txt:64`）
- **片段**：

```text
   sensor passive PASSIVE_SNSR
      on
      reports_location
      reports_signal_to_noise
   end_sensor
```

- **演示要点**：演示 sensor 的参数：on, reports_location, reports_signal_to_noise

### sensor（ag_bomber）｜传感器

- **关键词**：sensor, sar_constraint_plotting, yaw, pitch, 传感器
- **出处**：`sensor_plot/sar/ag_bomber.txt:27-31`　（同签名共 3 处，另见 `sensor_plot/sar/ip_bomber.txt:27`、`sensor_plot/sar/sn_bomber.txt:27`）
- **片段**：

```text
   sensor sar BOMBER_SAR
      sar_constraint_plotting     true           ###### Required for SAR constraint plotting
      yaw   60 deg                               # <--- Installed azimuth
      pitch -65 deg                              # <--- Installed elevation
   end_sensor
```

- **演示要点**：演示 sensor 的参数：sar_constraint_plotting, yaw, pitch

### sensor（red_missile_frigate）｜传感器

- **关键词**：sensor, category, off, ignore_same_side, 传感器
- **出处**：`ship_ad/platforms/red_missile_frigate.txt:81-85`　（同签名共 4 处，另见 `ship_ad/platforms/red_missile_frigate.txt:87`、`ship_ad/platforms/red_missile_frigate.txt:93`、`ship_ad/platforms/red_missile_frigate.txt:99`）
- **片段**：

```text
  sensor ill-1 FRONT_DOME # RED_SR_SAM_2 illuminator
    category ILLUMINATOR
    off
    ignore_same_side
  end_sensor
```

- **演示要点**：演示 sensor 的参数：category, off, ignore_same_side

### sensor（red_asm_msl）｜传感器

- **关键词**：sensor, off, ignore_same_side, processor, 传感器
- **出处**：`ship_ad/weapons/agm/red_asm_msl.txt:56-60`
- **片段**：

```text
  sensor seeker RED_MISSILE_SEEKER_1    # using as surrogate
    off
    ignore_same_side
    processor data_mgr
  end_sensor
```

- **演示要点**：演示 sensor 的参数：off, ignore_same_side, processor

### sensor · WSF_SOSM_SENSOR｜传感器

- **关键词**：sensor, WSF_SOSM_SENSOR, frame_time, reports_range, reports_bearing, 传感器
- **出处**：`sosm/sensor_plot/common_types.txt:33-37`　（同签名共 2 处，另见 `sosm/sensor_plot/test.txt:33`）
- **片段**：

```text
sensor IRST WSF_SOSM_SENSOR
   frame_time  1 sec
   reports_range
   reports_bearing
end_sensor
```

- **演示要点**：演示 WSF_SOSM_SENSOR 的参数：frame_time, reports_range, reports_bearing

### sensor（sam_battery）｜传感器

- **关键词**：sensor, off, processor, ignore, 传感器
- **出处**：`suppressor/platforms/sam_battery.txt:27-31`
- **片段**：

```text
  sensor sam_radar SAM_RADAR
    off
    processor track_processor
    ignore ignored-by-iads-radar
  end_sensor
```

- **演示要点**：演示 sensor 的参数：off, processor, ignore

### sensor（sam_regiment）｜传感器

- **关键词**：sensor, on, processor, ignore, 传感器
- **出处**：`suppressor/platforms/sam_regiment.txt:43-47`　（同签名共 2 处，另见 `suppressor/weapons/sam/missile.txt:87`）
- **片段**：

```text
  sensor sam_radar SAM_RADAR
    on
    processor track_processor
    ignore ignored-by-iads-radar
  end_sensor
```

- **演示要点**：演示 sensor 的参数：on, processor, ignore

### sensor（blue_multirole_fighter_2）｜传感器

- **关键词**：sensor, on, yaw, internal_link, 传感器
- **出处**：`outer_air_battle/platforms/blue_multirole_fighter_2.txt:96-101`　（同签名共 4 处，另见 `outer_air_battle/platforms/blue_multirole_fighter_2.txt:103`、`outer_air_battle/platforms/blue_multirole_fighter_2.txt:110`、`outer_air_battle/platforms/blue_multirole_fighter_2.txt:117`）
- **片段**：

```text
   sensor esm-1 GENERIC_ESM_SENSOR
      //debug
      on
      yaw 45. degrees
      internal_link data_mgr
   end_sensor
```

- **演示要点**：演示 sensor 的参数：on, yaw, internal_link

### sensor（aam-mr）｜传感器

- **关键词**：sensor, category, on, internal_link, 传感器
- **出处**：`p6dof/platforms/aam-mr.txt:59-64`　（同签名共 11 处，另见 `p6dof/platforms/aam-sr-tvc.txt:58`、`p6dof/platforms/aam-sr.txt:66`、`p6dof/platforms/agm-sr.txt:47`）
- **片段**：

```text
   sensor ir_seeker SIMPLE_GENERIC_SEEKER
      category ir_seeker
      on
      internal_link data_mgr
      internal_link seeker_activation
   end_sensor
```

- **演示要点**：演示 sensor 的参数：category, on, internal_link

### sensor（false-target_command_center）｜传感器

- **关键词**：sensor, on, transmitter, receiver, 传感器
- **出处**：`electronic_warfare/false-target_command_center.txt:409-417`
- **片段**：

```text
  sensor radar
     on
     transmitter
        frequency 800 mhz
     end_transmitter
     receiver
        frequency 800 mhz
     end_receiver
  end_sensor
```

- **演示要点**：演示 sensor 的参数：on, transmitter, receiver

### sensor（ssm_missile）｜传感器

- **关键词**：sensor, ignore_same_side, processor, filter, 传感器
- **出处**：`new_guidance/weapons/ssm/ssm_missile.txt:184-193`　（同签名共 2 处，另见 `ship_ad/weapons/ssm/ssm_missile.txt:91`）
- **片段**：

```text
   sensor seeker  RED_MISSILE_SEEKER
      # on
      ignore_same_side
      processor data_mgr
      filter FILTER_TACTICS
         range_measurement_sigma 0.5 m
         bearing_measurement_sigma 0.1 deg
         elevation_measurement_sigma 0.1 deg
      end_filter
   end_sensor
```

- **演示要点**：演示 sensor 的参数：ignore_same_side, processor, filter

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, frame_time, transmitter, reports_location, 传感器
- **出处**：`sensor_plot/comm/comm.txt:31-42`
- **片段**：

```text
sensor FAKE_RADIO_XMTR WSF_RADAR_SENSOR
   frame_time 1.0 sec

   transmitter
      power                  1 kw
      frequency              1.2 ghz
      bandwidth              1 mhz
      antenna_pattern        TX_ANTENNA_PATTERN
   end_transmitter

   reports_location          # A sensor must report something.
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：frame_time, transmitter, reports_location

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, transmit_only, frame_time, transmitter, 传感器
- **出处**：`sensor_demos/bistatic_demo.txt:62-77`　（同签名共 8 处，另见 `sensor_demos/bistatic_sp_false_target_jamming_demo.txt:94`、`sensor_demos/bistatic_sp_noise_jamming_demo.txt:77`、`sensor_demos/bistatic_support_false_target_jamming_demo.txt:100`）
- **片段**：

```text
sensor BISTATIC_SENSOR_XMTR WSF_RADAR_SENSOR

   transmit_only

   frame_time                10.0 sec

   transmitter
      antenna_pattern       BISTATIC_TX_ANTENNA
      antenna_height        90 m
      power                    50 kw
      frequency               100 mhz
      bandwidth               200 khz
      #pulse_compression_ratio 1e5 absolute // Signal Processing Gain, Gsp = Tsp * Br = 0.5 sec * 200e3 1/sec
      internal_loss        8 db
   end_transmitter
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：transmit_only, frame_time, transmitter

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, mode_template, mode, filter, 传感器
- **出处**：`base_types/sensors/radar/red_a2a_radar.txt:120-156`
- **片段**：

```text
sensor RED_A2A_RADAR WSF_RADAR_SENSOR

   mode_template
      reports_location
      reports_velocity

      transmitter
         frequency 9.6 ghz
         power 1.0 mw
      end_transmitter
      receiver
      end_receiver
      one_m2_detect_range 50 nm
      frame_time 2 sec
      track_quality 1.0
   end_mode_template

   mode 60X10
      azimuth_field_of_view    -30.0 deg   30.0 deg
      elevation_field_of_view   -5.0 deg    5.0 deg
      one_m2_detect_range 40 nm
   end_mode
   mode 40X20
      azimuth_field_of_view    -20.0 deg   20.0 deg
      elevation_field_of_view  -10.0 deg   10.0 deg
   end_mode
   mode 20X15
      azimuth_field_of_view    -10.0 deg   10.0 deg
      elevation_field_of_view   -7.5 deg    7.5 deg
   end_mode

   filter WSF_ALPHA_BETA_FILTER
      alpha 0.4
      beta  0.1
   end_filter

end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR 的参数：mode_template, mode, filter

### sensor（acoustic_demo）｜传感器

- **关键词**：sensor, background_noise, on, 传感器
- **出处**：`acoustic/acoustic_demo.txt:68-71`　（同签名共 10 处，另见 `acoustic/acoustic_demo.txt:78`、`acoustic/acoustic_demo.txt:88`、`acoustic/acoustic_demo.txt:98`）
- **片段**：

```text
sensor JUNGLE_DAY_ACOUSTIC_SENSOR ACOUSTIC_BASE
   background_noise jungle_day
   on
end_sensor
```

- **演示要点**：演示 sensor 的参数：background_noise, on

### sensor（single_large_sam）｜传感器

- **关键词**：sensor, on, internal_link, 传感器
- **出处**：`alternate_locations/platforms/single_large_sam.txt:46-49`　（同签名共 25 处，另见 `engage/flight_path.txt:58`、`engage/flight_route.txt:57`、`engage/grid.txt:56`）
- **片段**：

```text
   sensor acq ACQ_RADAR
      on
      internal_link data_mgr
   end_sensor
```

- **演示要点**：演示 sensor 的参数：on, internal_link

### sensor（short_range_ir_missile）｜传感器

- **关键词**：sensor, off, internal_link, 传感器
- **出处**：`air_to_air/weapons/aam/short_range_ir_missile.txt:158-161`　（同签名共 10 处，另见 `coverage_demos/platforms/sat3.txt:23`、`air_to_air/weapons/aam/medium_range_radar_missile.txt:195`、`base_types/platforms/blue_multirole_fighter_1_base.txt:64`）
- **片段**：

```text
   sensor seeker IR_SEEKER
      off
      internal_link data_mgr
   end_sensor
```

- **演示要点**：演示 sensor 的参数：off, internal_link

### sensor（chaff_example）｜传感器

- **关键词**：sensor, processor, ignore_same_side, 传感器
- **出处**：`chaff/chaff_example.txt:183-186`　（同签名共 16 处，另见 `chaff/chaff_example_ttr.txt:230`、`electronic_warfare/air-to-air-rt1.txt:329`、`electronic_warfare/air-to-air-rt2.txt:329`）
- **片段**：

```text
   sensor ew_radar EW_RADAR
      processor track_manager
      ignore_same_side
   end_sensor
```

- **演示要点**：演示 sensor 的参数：processor, ignore_same_side

### sensor（groud_station_existing）｜传感器

- **关键词**：sensor, on, tilt, 传感器
- **出处**：`coverage_demos/platforms/groud_station_existing.txt:17-20`
- **片段**：

```text
   sensor ground_sensor GROUND_STATION_SENSOR  
      on
      tilt 0 deg
   end_sensor
```

- **演示要点**：演示 sensor 的参数：on, tilt

### sensor（ground_station）｜传感器

- **关键词**：sensor, on, pitch, 传感器
- **出处**：`coverage_demos/platforms/ground_station.txt:17-20`
- **片段**：

```text
   sensor ground_sensor GROUND_STATION_SENSOR 
      on
      pitch 44 deg
   end_sensor
```

- **演示要点**：演示 sensor 的参数：on, pitch

### sensor（esm_detect_multi_beam_radar）｜传感器

- **关键词**：sensor, internal_link, ignore_same_side, 传感器
- **出处**：`electronic_warfare/esm_detect_multi_beam_radar.txt:153-156`　（同签名共 9 处，另见 `electronic_warfare/esm_detect_multi_sensor_radar.txt:253`、`electronic_warfare/esm_detect_radar.txt:135`、`electronic_warfare/esm_detect_radar2.txt:157`）
- **片段**：

```text
   sensor esm ESM_SENSOR
      internal_link track_manager
      ignore_same_side
   end_sensor
```

- **演示要点**：演示 sensor 的参数：internal_link, ignore_same_side

### sensor（soldier_jtac）｜传感器

- **关键词**：sensor, off, location, 传感器
- **出处**：`laser_designator/platforms/soldier_jtac.txt:34-37`
- **片段**：

```text
   sensor laser_designator-1212 LASER_DESIGNATOR-1212 
      off  # The logic will turn it on
      location 0 0 -6 ft  # eye level
   end_sensor
```

- **演示要点**：演示 sensor 的参数：off, location

### sensor（coherent_sensor_demo）｜传感器

- **关键词**：sensor, on, location, 传感器
- **出处**：`sensor_demos/coherent_sensor_demo.txt:185-188`　（同签名共 2 处，另见 `sensor_demos/coherent_sensor_demo.txt:190`）
- **片段**：

```text
   sensor ew_radar_1
      on
      location 0 -25 0 m
   end_sensor
```

- **演示要点**：演示 sensor 的参数：on, location

### sensor（px_fighter）｜传感器

- **关键词**：sensor, yaw, pitch, 传感器
- **出处**：`sensor_plot/eoir/px_fighter.txt:28-31`
- **片段**：

```text
   sensor eoir FIGHTER_EOIR
      yaw 0 deg                                  # <--- Spreadsheet value: Installed azimuth
      pitch 27 deg                               # <--- Spreadsheet value: Installed elevation
   end_sensor
```

- **演示要点**：演示 sensor 的参数：yaw, pitch

### sensor（hm-pass-detect）｜传感器

- **关键词**：sensor, on, reports_location, 传感器
- **出处**：`sensor_plot/radar/hm-pass-detect.txt:72-75`
- **片段**：

```text
   sensor passive PASSIVE_SNSR
      on
      reports_location
   end_sensor
```

- **演示要点**：演示 sensor 的参数：on, reports_location

### sensor（hellfire_type）｜传感器

- **关键词**：sensor, on, processor, 传感器
- **出处**：`hellfire/active_radar_hellfire/hellfire_type.txt:146-150`　（同签名共 3 处，另见 `oth_radar/othTest.txt:36`、`space_operations/scenarios/over_the_horizon_radar.txt:36`）
- **片段**：

```text
   sensor hellfire_mmw_seeker HELLFIRE_RADAR_SEEKER
      on
      processor track_manager
      #debug
   end_sensor
```

- **演示要点**：演示 sensor 的参数：on, processor

### sensor（ground_station）｜传感器

- **关键词**：sensor, processor, ignore, 传感器
- **出处**：`satellite_demos/platforms/ground_station.txt:65-69`
- **片段**：

```text
   sensor radar-1 BLUE_EW_RADAR_1
     processor  dump-xmtr # add a processor to the radar
     # Don't attempt to detect ground stations
     ignore ground_station
   end_sensor
```

- **演示要点**：演示 sensor 的参数：processor, ignore

### sensor（dt_example）｜传感器

- **关键词**：sensor, yaw, backscatter_coefficient, 传感器
- **出处**：`sensor_plot/sar/dt_example.txt:23-27`　（同签名共 2 处，另见 `sensor_plot/sar/dt_example.txt:29`）
- **片段**：

```text
   sensor left_sar  BOMBER_SAR
      #initial_mode SPOT
      yaw -90 deg
      backscatter_coefficient -15 db
   end_sensor
```

- **演示要点**：演示 sensor 的参数：yaw, backscatter_coefficient

### sensor（alv_demo）｜传感器

- **关键词**：sensor, off, 传感器
- **出处**：`alv_routing/alv_demo.txt:46-48`　（同签名共 7 处，另见 `alv_routing/alv_demo_with_jammer.txt:49`、`cyber/scenarios/mitm_red_laydown.txt:27`、`script_demos/script_demo_5.txt:398`）
- **片段**：

```text
   sensor ew-radar-1
      off
   end_sensor
```

- **演示要点**：演示 sensor 的参数：off

### sensor（alv_demo）｜传感器

- **关键词**：sensor, on, 传感器
- **出处**：`alv_routing/alv_demo.txt:70-72`　（同签名共 54 处，另见 `alv_routing/alv_demo_with_jammer.txt:73`、`chaff/chaff_example.txt:199`、`coverage_demos/platforms/sat1.txt:22`）
- **片段**：

```text
   sensor esm-1
     on
   end_sensor
```

- **演示要点**：演示 sensor 的参数：on

### sensor（ew_radar_site）｜传感器

- **关键词**：sensor, processor, 传感器
- **出处**：`alv_routing/platforms/ew_radar_site.txt:13-15`　（同签名共 6 处，另见 `satellite_demos/scenarios/gps_denied.txt:406`、`script_demos/script_demo_2.txt:218`、`script_demos/script_demo_5.txt:288`）
- **片段**：

```text
   sensor ew-radar-1 EARLY_WARNING_SENSOR
      processor track-proc
   end_sensor
```

- **演示要点**：演示 sensor 的参数：processor

### sensor（bearing_sensors_net）｜传感器

- **关键词**：sensor, azimuth_field_of_view, 传感器
- **出处**：`bearing_only/scenarios/bearing_sensors_net.txt:32-34`　（同签名共 2 处，另见 `bearing_only/scenarios/bearing_sensors_net.txt:40`）
- **片段**：

```text
   sensor geometric_bearing_only_sensor
       azimuth_field_of_view 0 deg 90 deg
   end_sensor
```

- **演示要点**：演示 sensor 的参数：azimuth_field_of_view

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, internal_link, 传感器
- **出处**：`multiresolution_demos/sensors/sensor_include.txt:32-34`
- **片段**：

```text
      sensor WSF_GEOMETRIC_SENSOR
         internal_link track_mgr
      end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR 的参数：internal_link

### sensor（sensor_include）｜传感器

- **关键词**：sensor, internal_link, 传感器
- **出处**：`multiresolution_demos/sensors/sensor_include.txt:39-41`
- **片段**：

```text
      sensor GENERIC_IRST
         internal_link image_proc
      end_sensor
```

- **演示要点**：演示 sensor 的参数：internal_link

### sensor（passive_detector_demo）｜传感器

- **关键词**：sensor, location, 传感器
- **出处**：`sensor_demos/passive_detector_demo.txt:200-202`　（同签名共 4 处，另见 `sensor_demos/passive_detector_demo.txt:212`、`sensor_demos/passive_detector_df_demo.txt:203`、`sensor_demos/passive_detector_df_demo.txt:215`）
- **片段**：

```text
   sensor rcvr
      location 0 0 -630 ft
   end_sensor
```

- **演示要点**：演示 sensor 的参数：location

### sensor（bomber）｜传感器

- **关键词**：sensor, ignore, 传感器
- **出处**：`suppressor/platforms/bomber.txt:45-47`
- **片段**：

```text
  sensor bomber_radar BOMBER_RADAR
    ignore ignored-by-bomber-radar
  end_sensor
```

- **演示要点**：演示 sensor 的参数：ignore

### sensor（narrow_spot_sar_demo）｜传感器

- **关键词**：sensor, mode, 传感器
- **出处**：`sensor_demos/narrow_spot_sar_demo.txt:44-49`
- **片段**：

```text
   sensor sar_left
      mode SPOT_HI_RES
         azimuth_field_of_view   -0.01 deg 0.01 deg
         elevation_field_of_view -0.01 deg 0.01 deg
      end_mode
   end_sensor
```

- **演示要点**：演示 sensor 的参数：mode

### sensor（single_large_sam）｜传感器

- **关键词**：sensor, 传感器
- **出处**：`alternate_locations/platforms/single_large_sam.txt:51-52`　（同签名共 52 处，另见 `chaff/chaff_example_ttr.txt:303`、`electronic_warfare/agile_auto-repeater_jamming.txt:324`、`electronic_warfare/agile_jamming.txt:386`）
- **片段**：

```text
   sensor ttr TTR_RADAR
   end_sensor
```

- **演示要点**：演示 sensor（最小结构，无子参数）

### sensor · WSF_GEOMETRIC_SENSOR｜传感器

- **关键词**：sensor, WSF_GEOMETRIC_SENSOR, 传感器
- **出处**：`multiresolution_demos/sensors/sensor_include.txt:26-27`　（同签名共 3 处，另见 `satellite_demos/platforms/gps_control.txt:15`、`laser_designator/sensors/geosensor/geo_sensor.txt:11`）
- **片段**：

```text
sensor GEOM_SENSOR WSF_GEOMETRIC_SENSOR
end_sensor
```

- **演示要点**：演示 WSF_GEOMETRIC_SENSOR（最小结构，无子参数）

### sensor · WSF_LASER_DESIGNATOR｜传感器

- **关键词**：sensor, WSF_LASER_DESIGNATOR, 传感器
- **出处**：`laser_designator/sensors/laser/laser_designator-1212.txt:9-28`
- **片段**：

```text
sensor LASER_DESIGNATOR-1212 WSF_LASER_DESIGNATOR
      azimuth_field_of_view   -0.25 deg 0.25 deg
      elevation_field_of_view -0.25 deg 0.25 deg
      on
      maximum_transmission_range 10 km
      terrain_float_distance     10 m
      target_association_staleout_interval 10 sec
      maximum_target_association_distance 200 m
      frame_time          0.1 s
      cue_mode            both
      slew_mode           both
      laser_code          1212
      azimuth_slew_rate   20 deg/s
      elevation_slew_rate 20 deg/s
      reports_location
      transmitter
         wavelength 1.06E-6 microns
         power 1 mw
      end_transmitter
end_sensor
```

- **演示要点**：演示 WSF_LASER_DESIGNATOR（最小结构，无子参数）

### sensor · WSF_RADAR_SENSOR｜传感器

- **关键词**：sensor, WSF_RADAR_SENSOR, 传感器
- **出处**：`wargame/sensors/radar/sam_radar.txt:18-57`　（同签名共 4 处，另见 `wargame/sensors/radar/drone_radar.txt:18`、`electronic_warfare/air-to-air-rt1.txt:236`、`electronic_warfare/air-to-air-rt2.txt:236`）
- **片段**：

```text
sensor SAM_RADAR_SENSOR WSF_RADAR_SENSOR

      scan_mode                      azimuth_and_elevation
      azimuth_slew_limits            -180 deg 180 deg
      elevation_slew_limits          0.0 deg 80.0 deg

      maximum_range                  100.0 km
      antenna_height                 4.0 m

      transmitter
         antenna_pattern             SAM_RADAR_ANTENNA
         power                       1000.0 kw
         frequency                   200 mhz
         internal_loss               2 db
      end_transmitter

      receiver
         antenna_pattern             SAM_RADAR_ANTENNA
         bandwidth                   30.0 khz
         noise_power                 -160 dBw  # will be calibrated for 1 m^2
         internal_loss               7 dB
      end_receiver

      probability_of_false_alarm     1.0e-6
      required_pd                    0.5
      swerling_case                  1

      reports_velocity
      reports_side
      reports_type
      reports_location

      frame_time                     2.0 sec

      hits_to_establish_track        2 3
      hits_to_maintain_track         1 3

      track_quality                  1   
      
end_sensor
```

- **演示要点**：演示 WSF_RADAR_SENSOR（最小结构，无子参数）

### sensor · WSF_BEAM_DIRECTOR｜传感器

- **关键词**：sensor, WSF_BEAM_DIRECTOR, 传感器
- **出处**：`hel/intersect_mesh_test_beam_director.txt:270-380`
- **片段**：

```text
   sensor beam_director WSF_BEAM_DIRECTOR

#         debug

         category LASER
         category ID
         category BEAM-DIRECTOR

        off                               // default
#        debug

#        debug_scheduler
#        debug_tracker
#        comments enabled

        //   Slew mode and limits, yaw, pitch, & roll info goes here
        location                0 0 0 m  // tbd
        slew_mode               azimuth_and_elevation
        azimuth_slew_limits     -180.0 degrees  180 degrees
        elevation_slew_limits   -90.0 degrees    90 degrees

        selection_mode          single    // can have only one mode active at a time

        // Max gimbal rates.
        // todo max_slew_rate_az 20.0 deg/s
        // todo max_slew_rate_el 20.0 deg/s

        // Mode template inputs are defaults that are valid for any mode.
        mode_template

          perfect_correlation enabled

          maximum_range            50 nm
          angular_resolution       1.0e-6 rad

          frame_time                    1 sec
          revisit_time                0.1 sec
          dwell_time          0.0555555 sec       // 1/18 sec

          // Field of view is used to cull targets, usually set larger than scan limits
          // fovs based on scan volume
          azimuth_field_of_view   -4.0 deg 4.0 deg
          elevation_field_of_view -4.0 deg 4.0 deg

          // the errors are the same as the beam diveregence (or less)
#             azimuth_error_sigma   0.0 deg
#             elevation_error_sigma 0.0 deg
#             range_error_sigma 0.0 m

          // Track Formation Commands
          reports_bearing
          reports_elevation
          reports_location
          reports_velocity

        end_mode_template

         // Following are the sensor modes.  When the beam director is cued to a track, it begins in the
         // first mode.  The on_success and on_failure inputs indicate mode transitions.  In the example
         // below there are four modes.  They progress from one to the next in order.  If track is lost in
         // one mode, it falls back to the prior mode.
        mode SCAN
          // Search to acquire tracks
          scan_mode                 azimuth_and_elevation
          frame_time                0.1 s
          azimuth_scan_limits       -4.0 degrees 4.0 degrees
          elevation_scan_limits     -4.0 degrees 4.0 degrees

          // If maximum_request_count > 0 then this mode only responds
          //   to explicit requests as initiated by WsfTaskManager::StartTracking.
          track_quality             0.8  // Near 'weapon quality'
          hits_to_establish_track   1 1  // 1 of last 1 scans to establish track
          hits_to_maintain_track    1 5  // 1 of last 5 scans to maintain  track
          type                      scanning
          on_success                LOCK1
        end_mode

        mode LOCK1
          scan_mode                 fixed
          frame_time                5.0 s  // Implement scan mode delay here; it must be
                                           // enforced in one of the fixed modes
          track_quality             0.9  // 'weapon quality'
          hits_to_establish_track   1 1  // 1 of last 1 scans to establish track
          hits_to_maintain_track    1 5  // Allow 25 seconds of coasting (5th failure will drop)
          type                      locked
          on_success                LOCK2
          on_failure                SCAN
        end_mode

        mode LOCK2
          scan_mode                 fixed
          frame_time                0.1 s
          track_quality             1.0  // 'weapon quality'
          hits_to_establish_track   1 1  // 1 of last 1 scans to establish track
          hits_to_maintain_track    1 5  // Allow .5 seconds of coasting (5th failure will drop)
          type                      locked
          on_success                CUED
          on_failure                LOCK1
        end_mode

        mode CUED
          scan_mode                 fixed
          frame_time                0.01 s
          track_quality             1.0  // 'weapon quality'
          hits_to_establish_track   1 1  // 1 of last 1 scans to establish track
          hits_to_maintain_track    1 5  // Allow .05 seconds of coasting (5th failure will drop)
          on_failure                LOCK2
          type                      cued
        end_mode

   end_sensor  // beam director
```

- **演示要点**：演示 WSF_BEAM_DIRECTOR（最小结构，无子参数）

### sensor_model（simple_lwir_sensor）｜

- **关键词**：sensor_model, response_limits, response_curve, noise_equivalent_irradiance, detection_threshold
- **出处**：`sosm/test_mission/simple_plot/simple_lwir_sensor.txt:15-27`　（同签名共 4 处，另见 `sosm/test_mission/simple_plot/simple_mwir_sensor.txt:15`、`sosm/sensors/gaussian_lwir.txt:15`、`sosm/sensors/gaussian_mwir.txt:15`）
- **片段**：

```text
sensor_model default
   response_limits 8.0 um 12.0 um

   response_curve
      wavelength  8 um  1.0
      wavelength 12 um  1.0
   end_response_curve

   noise_equivalent_irradiance    1.0E-10 w/m2
   detection_threshold            6.0 db

#   show_response true
end_sensor_model
```

- **演示要点**：演示 sensor_model 的参数：response_limits, response_curve, noise_equivalent_irradiance, detection_threshold

### sensor_model（uniform_lwir）｜

- **关键词**：sensor_model, response_limits, noise_equivalent_irradiance, detection_threshold
- **出处**：`sosm/sensors/uniform_lwir.txt:15-28`　（同签名共 2 处，另见 `sosm/sensors/uniform_mwir.txt:15`）
- **片段**：

```text
sensor_model default

   #show_response

   # The band over which the sensor can detect objects.
   response_limits                8 um 12 um

   # A response_curve isn't provided, so uniform response of 1.0 will be assumed.

   noise_equivalent_irradiance    2.0e-13 w/cm^2

   # The signal-to-noise ratio required for detection.
   detection_threshold            10.0 absolute
end_sensor_model
```

- **演示要点**：演示 sensor_model 的参数：response_limits, noise_equivalent_irradiance, detection_threshold

### sensors（esm_tdoa_demo）｜

- **关键词**：sensors, sensor, platform_sensor
- **出处**：`sensor_demos/esm_tdoa_demo.txt:201-205`　（同签名共 2 处，另见 `sensor_plot/esm/hm-tdoa.txt:73`）
- **片段**：

```text
      sensors
         sensor esm
         platform_sensor striker-2 esm
         platform_sensor striker-3 esm
      end_sensors
```

- **演示要点**：演示 sensors 的参数：sensor, platform_sensor

### sensors（coherent_sensor_demo）｜

- **关键词**：sensors, sensor
- **出处**：`sensor_demos/coherent_sensor_demo.txt:115-118`
- **片段**：

```text
      sensors
         sensor ew_radar_1
         sensor ew_radar_2
      end_sensors
```

- **演示要点**：演示 sensors 的参数：sensor

### signal_processor（mtd_radar）｜

- **关键词**：signal_processor, debug, mti_switch, mti_num_delays, mti_min_response, mti_num_gates, mti_range_limits, mti_angle_limits, pd_num_filters, pd_num_filter_poles, pd_filter_bandwidth, pd_filter_slr, zvf_switch
- **出处**：`base_types/sensors/radar/mtd_radar.txt:56-76`
- **片段**：

```text
   signal_processor moving_target_detector
      debug
      mti_switch                 on
      mti_num_delays             2
      mti_min_response           32 dB
      mti_num_gates              1
      mti_range_limits           1 0 km 500 km
      mti_angle_limits           1 -180 deg 180 deg

      pd_num_filters             8
      pd_num_filter_poles        5
      pd_filter_bandwidth        1 0.0 hz # auto calculated
      pd_filter_bandwidth        2 0.0 hz # auto calculated
      pd_filter_slr              60.0 db

      zvf_switch                 on
      zvf_num_filter_poles       5
      zvf_filter_bandwidth       1 0.0 hz # auto calculated
      zvf_filter_bandwidth       2 0.0 hz # auto calculated
      zvf_filter_slr             60.0 db
   end_signal_processor
```

- **演示要点**：演示 signal_processor 的参数：debug, mti_switch, mti_num_delays, mti_min_response, mti_num_gates, mti_range_limits, mti_angle_limits, pd_num_filters, pd_num_filter_poles, pd_filter_bandwidth

### signal_processor（mti_radar）｜

- **关键词**：signal_processor, debug, mti_switch, mti_num_delays, mti_min_response, mti_num_gates, mti_range_limits, mti_angle_limits
- **出处**：`base_types/sensors/radar/mti_radar.txt:53-61`
- **片段**：

```text
   signal_processor moving_target_indicator
      debug
      mti_switch                 on
      mti_num_delays             4
      mti_min_response           32 dB
      mti_num_gates              1
      mti_range_limits           1 0 km 500 km
      mti_angle_limits           1 -180 deg 180 deg
   end_signal_processor
```

- **演示要点**：演示 signal_processor 的参数：debug, mti_switch, mti_num_delays, mti_min_response, mti_num_gates, mti_range_limits, mti_angle_limits

### signal_processor（pd_radar）｜

- **关键词**：signal_processor, pd_num_filters, pd_num_filter_poles, pd_filter_bandwidth, pd_filter_slr
- **出处**：`base_types/sensors/radar/pd_radar.txt:51-57`
- **片段**：

```text
   signal_processor pulse_doppler
      //debug
      pd_num_filters             64
      pd_num_filter_poles        5
      pd_filter_bandwidth        1 156.25 hz
      pd_filter_slr              60.0 db
   end_signal_processor
```

- **演示要点**：演示 signal_processor 的参数：pd_num_filters, pd_num_filter_poles, pd_filter_bandwidth, pd_filter_slr

### signal_processor（aesa）｜

- **关键词**：signal_processor, maximum_doppler_speed
- **出处**：`air_to_air/sensors/radar/aesa.txt:83-85`　（同签名共 2 处，另见 `air_to_air/sensors/radar/long_range.txt:78`）
- **片段**：

```text
      signal_processor simple_doppler
         maximum_doppler_speed       3000.0 m/s  
      end_signal_processor 
```

- **演示要点**：演示 signal_processor 的参数：maximum_doppler_speed

### signal_processor（generic_bomber_radar）｜

- **关键词**：signal_processor, minimum_doppler_speed
- **出处**：`base_types/sensors/radar/generic_bomber_radar.txt:87-89`　（同签名共 3 处，另见 `oth_radar/sensors/radar/oth_radar.txt:48`、`base_types/sensors/radar/blue_ship_mf_radar.txt:129`）
- **片段**：

```text
    signal_processor simple_doppler
      minimum_doppler_speed   11 m/s    # (~25 mph) ground targets
    end_signal_processor
```

- **演示要点**：演示 signal_processor 的参数：minimum_doppler_speed

### target_blanking_effect（ew_radar）｜

- **关键词**：target_blanking_effect, duty_cycle_probability_effect
- **出处**：`aea_iads/sensors/radar/ew_radar.txt:67-69`　（同签名共 2 处，另见 `electronic_warfare/test_false_targets/sensors/radar/ew_radar.txt:99`）
- **片段**：

```text
        target_blanking_effect
           duty_cycle_probability_effect
        end_target_blanking_effect
```

- **演示要点**：演示 target_blanking_effect 的参数：duty_cycle_probability_effect

### target_blanking_effect（agile_auto-repeater_jamming）｜

- **关键词**：target_blanking_effect, probabilities
- **出处**：`electronic_warfare/agile_auto-repeater_jamming.txt:200-208`　（同签名共 18 处，另见 `electronic_warfare/agile_repeater_jamming-rt1.txt:314`、`electronic_warfare/agile_repeater_jamming-rt2.txt:314`、`electronic_warfare/agile_repeater_jamming.txt:325`）
- **片段**：

```text
                    target_blanking_effect
                       probabilities
                          pulse_density 0.0 0.0
                          pulse_density 0.1 0.2
                          pulse_density 0.3 0.6
                          pulse_density 0.5 0.8
                          pulse_density 1.0 1.0
                       end_probabilities
                    end_target_blanking_effect
```

- **演示要点**：演示 target_blanking_effect 的参数：probabilities

### transmitter（BEIDOUCommDef）｜发射机

- **关键词**：transmitter, antenna_pattern, attenuation, frequency, bandwidth, wavelength, propagation_model, polarization, power, pulse_width, pulse_repetition_interval, 发射机
- **出处**：`satellite_demos/avionics/comm/BEIDOUCommDef.txt:30-41`　（同签名共 6 处，另见 `satellite_demos/avionics/comm/BEIDOUCommDef.txt:52`、`satellite_demos/avionics/comm/BEIDOUCommDef.txt:74`、`satellite_demos/avionics/comm/BEIDOUCommDef_GS.txt:28`）
- **片段**：

```text
   transmitter
      antenna_pattern                     SATELLITE_NADIR_CONE
      attenuation                         none
      frequency                           1561.098 mhz   # ref 1
      bandwidth                           4.092 mhz      # ref 2
      wavelength                          0.1921 m       # ref 2
      propagation_model                   none
      polarization                        right_circular # ref 3
      power                               20 dbw         # ref 4
      pulse_width                         15.0 usec
      pulse_repetition_interval           150.0 usec
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, attenuation, frequency, bandwidth, wavelength, propagation_model, polarization, power, pulse_width, pulse_repetition_interval

### transmitter（ew_radar）｜发射机

- **关键词**：transmitter, antenna_pattern, polarization, beam_tilt, power, frequency, frequency_channels, pulse_width, pulse_repetition_interval, internal_loss, 发射机
- **出处**：`aea_iads/sensors/radar/ew_radar.txt:109-119`
- **片段**：

```text
   transmitter
      antenna_pattern             EW_RADAR_ANTENNA
      polarization                horizontal
      beam_tilt                   10.0 deg
      power                       1000.0 kw
      frequency                   200 mhz
      frequency_channels          150 mhz 10 mhz 200 mhz
      pulse_width                   50 usec
      pulse_repetition_interval   1250 usec
      internal_loss               2 db
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, polarization, beam_tilt, power, frequency, frequency_channels, pulse_width, pulse_repetition_interval, internal_loss

### transmitter（aesa）｜发射机

- **关键词**：transmitter, antenna_pattern, power, frequency, polarization, duty_cycle, pulse_width, pulse_repetition_frequency, internal_loss, attenuation_model, 发射机
- **出处**：`air_to_air/sensors/radar/aesa.txt:46-56`　（同签名共 2 处，另见 `air_to_air/sensors/radar/long_range.txt:41`）
- **片段**：

```text
      transmitter
         antenna_pattern  AESA_ANTENNA
         power                       13 kw       #
         frequency                   9.5 ghz     
         polarization                vertical
         duty_cycle                  0.25       
         pulse_width                 2.0 usec   
         pulse_repetition_frequency  90 khz      
         internal_loss               2.0 db      #
         attenuation_model itu end_attenuation_model
      end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, power, frequency, polarization, duty_cycle, pulse_width, pulse_repetition_frequency, internal_loss, attenuation_model

### transmitter（mti_radar）｜发射机

- **关键词**：transmitter, antenna_pattern, beam_tilt, polarization, power, frequency, pulse_width, pulse_repetition_frequency, internal_loss, pulse_compression_ratio, 发射机
- **出处**：`base_types/sensors/radar/mti_radar.txt:30-40`
- **片段**：

```text
   transmitter
      antenna_pattern            MTI_RADAR_ANTENNA
      beam_tilt                  1.0 deg
      polarization               vertical
      power                      1000.0 kw
      frequency                  1325 mhz
      pulse_width                50 usec
      pulse_repetition_frequency 750 hz
      internal_loss              2 db
      pulse_compression_ratio    13 absolute
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, beam_tilt, polarization, power, frequency, pulse_width, pulse_repetition_frequency, internal_loss, pulse_compression_ratio

### transmitter（GALILEOCommDef）｜发射机

- **关键词**：transmitter, antenna_pattern, attenuation, frequency, bandwidth, wavelength, propagation_model, power, pulse_width, pulse_repetition_interval, 发射机
- **出处**：`satellite_demos/avionics/comm/GALILEOCommDef.txt:26-36`　（同签名共 11 处，另见 `satellite_demos/avionics/comm/GALILEOCommDef.txt:46`、`satellite_demos/avionics/comm/GALILEOCommDef.txt:66`、`satellite_demos/avionics/comm/GALILEOCommDef_GS.txt:25`）
- **片段**：

```text
   transmitter
      antenna_pattern                     SATELLITE_NADIR_CONE
      attenuation                         none
      frequency                           1575.42 MHz     # ref 1
      bandwidth                           12  MHz         # ref 1
      wavelength                          19.04 cm        # ref 1
      propagation_model                   none
      power                               35.06 dBW       # ref 3
      pulse_width                         15.0 usec
      pulse_repetition_interval           150.0 usec
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, attenuation, frequency, bandwidth, wavelength, propagation_model, power, pulse_width, pulse_repetition_interval

### transmitter（mtd_radar）｜发射机

- **关键词**：transmitter, antenna_pattern, beam_tilt, polarization, power, frequency, pulse_width, pulse_repetition_frequencies, internal_loss, pulse_compression_ratio, 发射机
- **出处**：`base_types/sensors/radar/mtd_radar.txt:30-43`
- **片段**：

```text
   transmitter
      antenna_pattern            MTD_RADAR_ANTENNA
      beam_tilt                  1.0 deg
      polarization               vertical
      power                      1000.0 kw
      frequency                  1325 mhz
      pulse_width                50 usec
      pulse_repetition_frequencies
         prf 1 500 hz
         prf 2 350 hz
      end_pulse_repetition_frequencies
      internal_loss              2 db
      pulse_compression_ratio    13 absolute
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, beam_tilt, polarization, power, frequency, pulse_width, pulse_repetition_frequencies, internal_loss, pulse_compression_ratio

### transmitter（lasercomm_link）｜发射机

- **关键词**：transmitter, wavelength, power, modulation_type, ppm_order, pulse_width, aperture_diameter, beamwidth, optics_transmission_factor, attenuation, 发射机
- **出处**：`space_operations/comms/lasercomm_link.txt:33-46`
- **片段**：

```text
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
```

- **演示要点**：演示 transmitter 的参数：wavelength, power, modulation_type, ppm_order, pulse_width, aperture_diameter, beamwidth, optics_transmission_factor, attenuation

### transmitter（ttr_radar）｜发射机

- **关键词**：transmitter, antenna_pattern, power, frequency, internal_loss, attenuation, pulse_width, pulse_repetition_interval, duty_cycle, 发射机
- **出处**：`aea_iads/sensors/radar/ttr_radar.txt:46-55`
- **片段**：

```text
      transmitter
         antenna_pattern             TTR_RADAR_ANTENNA
         power                       100.0 kw
         frequency                   9500 mhz
         internal_loss               2 db
         attenuation                 blake
         pulse_width                 0.8 usec
         pulse_repetition_interval   12.0 usec
         duty_cycle                  0.067   # 10*log10(0.8/12) = -11.76 dB loss
      end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, power, frequency, internal_loss, attenuation, pulse_width, pulse_repetition_interval, duty_cycle

### transmitter（GlobalstarCommDef）｜发射机

- **关键词**：transmitter, antenna_pattern, attenuation, frequency, bandwidth, propagation_model, power, pulse_width, pulse_repetition_interval, 发射机
- **出处**：`satellite_demos/avionics/comm/GlobalstarCommDef.txt:26-35`　（同签名共 15 处，另见 `satellite_demos/avionics/comm/GlobalstarCommDef.txt:59`、`satellite_demos/avionics/comm/GlobalstarCommDef_GS.txt:20`、`satellite_demos/avionics/comm/GlobalstarCommDef_HH.txt:20`）
- **片段**：

```text
   transmitter
      antenna_pattern                     SATELLITE_NADIR_CONE
      attenuation                         none
      frequency                           7052.9 MHz   # ref 2
      bandwidth                           50 kHz      #
      propagation_model                   none
      power                               26.8 dBW      # ref 2; EIRP
      pulse_width                         15.0 usec
      pulse_repetition_interval           150.0 usec
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, attenuation, frequency, bandwidth, propagation_model, power, pulse_width, pulse_repetition_interval

### transmitter（GPSCommDef）｜发射机

- **关键词**：transmitter, antenna_pattern, frequency, wavelength, bandwidth, power, polarization, pulse_width, pulse_repetition_interval, 发射机
- **出处**：`satellite_demos/avionics/comm/GPSCommDef.txt:51-60`　（同签名共 3 处，另见 `satellite_demos/avionics/comm/GPSCommDef.txt:71`、`satellite_demos/platforms/gps_control.txt:29`）
- **片段**：

```text
   transmitter
      antenna_pattern                     SATELLITE_NADIR_CONE
      frequency                           1227.6 mhz  # ref 2
      wavelength                          24.45 cm    # ref 2
      bandwidth                           20 mhz      # guess
      power                               6.35 dBW    # ref 4
      polarization                        right_circular  # ref 3
      pulse_width                         15.0 usec   # guess
      pulse_repetition_interval           150.0 usec  # guess
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, frequency, wavelength, bandwidth, power, polarization, pulse_width, pulse_repetition_interval

### transmitter（composite_demo）｜发射机

- **关键词**：transmitter, antenna_pattern, power, frequency, polarization, pulse_width, pulse_repetition_interval, internal_loss, attenuation_model, 发射机
- **出处**：`sensor_demos/composite_demo.txt:61-70`
- **片段**：

```text
      transmitter
         antenna_pattern                 EW_RADAR_ANTENNA
         power                           100 kw
         frequency                       200 mhz
         polarization                    horizontal
         pulse_width                     50 us
         pulse_repetition_interval       1250 usec
         internal_loss                   2 db
         attenuation_model               earce
      end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, power, frequency, polarization, pulse_width, pulse_repetition_interval, internal_loss, attenuation_model

### transmitter（bistatic_sp_false_target_jamming_demo）｜发射机

- **关键词**：transmitter, antenna_pattern, antenna_height, power, frequency, bandwidth, pulse_width, pulse_repetition_interval, internal_loss, 发射机
- **出处**：`sensor_demos/bistatic_sp_false_target_jamming_demo.txt:100-110`　（同签名共 7 处，另见 `sensor_demos/bistatic_sp_noise_jamming_demo.txt:83`、`sensor_demos/bistatic_support_false_target_jamming_demo.txt:106`、`sensor_demos/bistatic_support_noise_jamming_demo.txt:88`）
- **片段**：

```text
   transmitter
      antenna_pattern       BISTATIC_TX_ANTENNA
      antenna_height        90 m
      power                    50 kw
      frequency               100 mhz
      bandwidth               200 khz
      pulse_width 5 usec
      pulse_repetition_interval 100 usec
      #pulse_compression_ratio 1e5 absolute // Signal Processing Gain, Gsp = Tsp * Br = 0.5 sec * 200e3 1/sec
      internal_loss        8 db
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, antenna_height, power, frequency, bandwidth, pulse_width, pulse_repetition_interval, internal_loss

### transmitter（agile_jamming）｜发射机

- **关键词**：transmitter, antenna_pattern, beam_tilt, power, frequency, pulse_width, pulse_repetition_interval, internal_loss, frequency_list, 发射机
- **出处**：`electronic_warfare/agile_jamming.txt:251-264`
- **片段**：

```text
         transmitter
            antenna_pattern            EW_RADAR_ANTENNA
            beam_tilt                  10.0 deg
            power                      1000.0 kw
            frequency                  200 mhz
            pulse_width                25 usec
            pulse_repetition_interval  1250 usec
            internal_loss              2 db
            frequency_list
               frequency_id            1 200 mhz
               frequency_id            2 210 mhz
               frequency_id            3 220 mhz
            end_frequency_list
         end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, beam_tilt, power, frequency, pulse_width, pulse_repetition_interval, internal_loss, frequency_list

### transmitter（pd_radar）｜发射机

- **关键词**：transmitter, antenna_pattern, polarization, power, frequency, pulse_width, pulse_repetition_frequency, internal_loss, 发射机
- **出处**：`base_types/sensors/radar/pd_radar.txt:31-39`
- **片段**：

```text
   transmitter
      antenna_pattern            PD_RADAR_ANTENNA
      polarization               vertical
      power                      100.0 kw
      frequency                  4000 mhz
      pulse_width                10 usec
      pulse_repetition_frequency 10 khz
      internal_loss              2 db
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, polarization, power, frequency, pulse_width, pulse_repetition_frequency, internal_loss

### transmitter（chaff_example）｜发射机

- **关键词**：transmitter, antenna_pattern, beam_tilt, power, frequency, pulse_width, pulse_repetition_interval, internal_loss, 发射机
- **出处**：`chaff/chaff_example.txt:147-155`　（同签名共 19 处，另见 `electronic_warfare/barrage_jamming.txt:76`、`electronic_warfare/closely_space_targets.txt:55`、`electronic_warfare/cover_pulse_jamming.txt:133`）
- **片段**：

```text
   transmitter
      antenna_pattern            EW_RADAR_ANTENNA
      beam_tilt                  10.0 deg
      power                      100.0 w
      frequency                  1000 mhz
      pulse_width                25 usec
      pulse_repetition_interval  1250 usec
      internal_loss              2 db
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, beam_tilt, power, frequency, pulse_width, pulse_repetition_interval, internal_loss

### transmitter（esm_detect_jammer）｜发射机

- **关键词**：transmitter, power, frequency, bandwidth, pulse_width, pulse_repetition_interval, antenna_pattern, antenna_tilt, 发射机
- **出处**：`electronic_warfare/esm_detect_jammer.txt:93-101`　（同签名共 9 处，另见 `electronic_warfare/false-target_command_center.txt:143`、`electronic_warfare/jam_strobe_direction_finder.txt:51`、`electronic_warfare/jam_strobe_tracking.txt:103`）
- **片段**：

```text
   transmitter
      power           750 kw
      frequency       900 mhz
      bandwidth       0.1 mhz
      pulse_width                  10  usec
      pulse_repetition_interval    750 usec // max PRI range of 225 km
      antenna_pattern EW_RADAR_ANTENNA
      antenna_tilt     10 deg
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：power, frequency, bandwidth, pulse_width, pulse_repetition_interval, antenna_pattern, antenna_tilt

### transmitter（mar）｜发射机

- **关键词**：transmitter, antenna_pattern, power, frequency, internal_loss, electronic_beam_steering, electronic_beam_steering_limit, antenna_height, 发射机
- **出处**：`engage/radars/mar.txt:45-53`
- **片段**：

```text
   transmitter
      antenna_pattern   MAR_ANTENNA
      power             5 kw
      frequency         3 ghz
      internal_loss     2 db
      electronic_beam_steering azimuth_and_elevation
      electronic_beam_steering_limit 90 deg
      antenna_height 1 m
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, power, frequency, internal_loss, electronic_beam_steering, electronic_beam_steering_limit, antenna_height

### transmitter（GPSCommDef）｜发射机

- **关键词**：transmitter, antenna_pattern, frequency, wavelength, bandwidth, power, polarization, pulse_repetition_interval, 发射机
- **出处**：`satellite_demos/avionics/comm/GPSCommDef.txt:34-42`
- **片段**：

```text
   transmitter
      antenna_pattern                     SATELLITE_NADIR_CONE
      frequency                           1575.42 mhz  # ref 2
      wavelength                          19.05 cm     # ref 2
      bandwidth                           24 mhz       # ref 3
      power                               12.75 dBW   # ref 4  this is the average between C/A and PY codes
      polarization                        right_circular  # ref 3
      pulse_repetition_interval           1.0 msecs    # ref 4  chipping rate of 1.023 Mbps with code of 1 ms
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, frequency, wavelength, bandwidth, power, polarization, pulse_repetition_interval

### transmitter（GPSCommDef）｜发射机

- **关键词**：transmitter, antenna_pattern, frequency, wavelength, bandwidth, power, pulse_width, pulse_repetition_interval, 发射机
- **出处**：`satellite_demos/avionics/comm/GPSCommDef.txt:91-99`
- **片段**：

```text
   transmitter
      antenna_pattern                     SATELLITE_NADIR_CONE
      frequency                           1176.45 mhz  # ref 5
      wavelength                          25.48 cm    # ref 5
      bandwidth                           12 mhz      # ref 4
      power                               24.2 dBW    # ref 4
      pulse_width                         3.5 usec   # ref 6
      pulse_repetition_interval           12.0 usec   # ref 6
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, frequency, wavelength, bandwidth, power, pulse_width, pulse_repetition_interval

### transmitter（iridium_handheld）｜发射机

- **关键词**：transmitter, antenna_pattern, attenuation, frequency, bandwidth, propagation_model, polarization, power, 发射机
- **出处**：`satellite_demos/user_handhelds/iridium_handheld.txt:62-70`　（同签名共 6 处，另见 `satellite_demos/user_handhelds/iridium_handheld.txt:104`、`satellite_demos/user_handhelds/iridium_handheld.txt:159`、`space_operations/scenarios/iridium_handheld.txt:60`）
- **片段**：

```text
   transmitter
      antenna_pattern                     UNIFORM_0DBI_PATTERN
      attenuation                         none
      frequency                           1621 mhz  # ref 1
      bandwidth                           10.5 mhz  # ref 1
      propagation_model                   none
      polarization                        right_circular  # ref 1
      power                               50 dbw
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, attenuation, frequency, bandwidth, propagation_model, polarization, power

### transmitter（rice_screen）｜发射机

- **关键词**：transmitter, antenna_pattern, antenna_tilt, power, frequency, pulse_width, pulse_compression_ratio, pulse_repetition_frequency, 发射机
- **出处**：`ship_ad/sensors/radar/rice_screen.txt:52-60`
- **片段**：

```text
  transmitter
     antenna_pattern             RICE_SCREEN_ANTENNA
     antenna_tilt                10.0 deg      # estimate from picture
     power                       150.0 kw      # Ref 3
     frequency                   5000 mhz      # Ref 3 (C band)
     pulse_width                 40.0 usec     # Ref 3
     pulse_compression_ratio     40 absolute   # Ref 3
     pulse_repetition_frequency  370 hz        # Ref 3
  end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, antenna_tilt, power, frequency, pulse_width, pulse_compression_ratio, pulse_repetition_frequency

### transmitter（cloud_attenuation）｜发射机

- **关键词**：transmitter, antenna_pattern, frequency, power, bandwidth, wavelength, pulse_repetition_frequency, pulse_width, 发射机
- **出处**：`space_operations/cloud_attenuation.txt:207-215`
- **片段**：

```text
      transmitter
         antenna_pattern                  FPS85
         frequency                        0.442 ghz
         power                            32000 kw
         bandwidth                        .001 ghz
         wavelength                       0.68 m
         pulse_repetition_frequency       20 Hz
         pulse_width                      0.25 msec
      end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, frequency, power, bandwidth, wavelength, pulse_repetition_frequency, pulse_width

### transmitter（generic_sar）｜发射机

- **关键词**：transmitter, antenna_pattern, power, frequency, pulse_width, pulse_compression_ratio, internal_loss, attenuation_model, 发射机
- **出处**：`base_types/sensors/radar/generic_sar.txt:61-70`
- **片段**：

```text
      transmitter
         antenna_pattern               GENERIC_SAR_ANTENNA
         power                         6 kw
         frequency                     10 ghz
         pulse_width                   50 us
         pulse_compression_ratio       7500 absolute
         # pulse_repetition_frequency  xxxx hz             # The PRF will be dynamically chosen
         internal_loss                 6.5 db
         attenuation_model             earce
      end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, power, frequency, pulse_width, pulse_compression_ratio, internal_loss, attenuation_model

### transmitter（clutter_demo）｜发射机

- **关键词**：transmitter, antenna_pattern, power, frequency, polarization, pulse_width, pulse_repetition_frequency, attenuation_model, 发射机
- **出处**：`sensor_demos/clutter_demo.txt:57-71`
- **片段**：

```text
   transmitter
      antenna_pattern                 EW_RADAR_ANTENNA
      power                           100 kw
      frequency                       1.2 ghz
      polarization                    vertical

      # =======================================================================
      # NOTE: The pulse_width and pulse_repetition_frequency must be specified
      #       when using any of the algorithmic clutter models.
      # =======================================================================

      pulse_width                     1 us
      pulse_repetition_frequency      1.5 khz
      attenuation_model               blake
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, power, frequency, polarization, pulse_width, pulse_repetition_frequency, attenuation_model

### transmitter（acq_radar）｜发射机

- **关键词**：transmitter, antenna_pattern, power, frequency, internal_loss, pulse_width, pulse_repetition_interval, 发射机
- **出处**：`aea_iads/sensors/radar/acq_radar.txt:49-56`　（同签名共 12 处，另见 `chaff/chaff_example_ttr.txt:151`、`electronic_warfare/closely_space_targets_ttr.txt:66`、`electronic_warfare/close_targets_ttr.txt:81`）
- **片段**：

```text
   transmitter
      antenna_pattern             ACQ_RADAR_ANTENNA
      power                       1000.0 kw
      frequency                   3000 mhz
      internal_loss               2 db
      pulse_width                 35 usec
      pulse_repetition_interval   350 usec
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, power, frequency, internal_loss, pulse_width, pulse_repetition_interval

### transmitter（ew_radar）｜发射机

- **关键词**：transmitter, antenna_pattern, antenna_tilt, power, pulse_width, pulse_repetition_frequency, frequency, 发射机
- **出处**：`alv_routing/sensors/ew_radar.txt:27-34`　（同签名共 6 处，另见 `satellite_demos/scenarios/gps_denied.txt:276`、`script_demos/script_demo_2.txt:55`、`script_demos/script_demo_5.txt:95`）
- **片段**：

```text
  transmitter
     antenna_pattern EARLY_WARNING_RADAR_ANTENNA
     antenna_tilt  5 deg
     power  800 kw
     pulse_width                 2.0e-6 sec
     pulse_repetition_frequency  400 hz
     frequency  1285 mhz
  end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, antenna_tilt, power, pulse_width, pulse_repetition_frequency, frequency

### transmitter（red_ciws_radar_1）｜发射机

- **关键词**：transmitter, antenna_pattern, power, frequency, pulse_width, pulse_repetition_frequency, polarization, 发射机
- **出处**：`ciws/sensors/radar/red_ciws_radar_1.txt:83-90`
- **片段**：

```text
  transmitter
     antenna_pattern             RED_CIWS_RADAR_1_ANTENNA
     power                       100.0 kw       # stated
     frequency                   10000 mhz     # stated xband
     pulse_width                 0.8 usec      
     pulse_repetition_frequency  3600 hz       
     polarization                vertical
  end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, power, frequency, pulse_width, pulse_repetition_frequency, polarization

### transmitter（agile_auto-repeater_jamming）｜发射机

- **关键词**：transmitter, antenna_pattern, beam_tilt, power, pulse_width, pulse_repetition_interval, frequency_channels, 发射机
- **出处**：`electronic_warfare/agile_auto-repeater_jamming.txt:159-166`　（同签名共 3 处，另见 `electronic_warfare/agile_repeater_jamming.txt:282`、`electronic_warfare/manual_repeater_jamming.txt:306`）
- **片段**：

```text
         transmitter
            antenna_pattern           EW_RADAR_ANTENNA
            beam_tilt              10 deg
            power                     750.0 kw
            pulse_width                  50  usec
            pulse_repetition_interval    750 usec // max PRI range of 225 km
            frequency_channels 920 mhz 10 mhz 940 mhz
         end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, beam_tilt, power, pulse_width, pulse_repetition_interval, frequency_channels

### transmitter（repeater_jamming）｜发射机

- **关键词**：transmitter, power, frequency, pulse_width, pulse_repetition_interval, antenna_pattern, antenna_tilt, 发射机
- **出处**：`electronic_warfare/repeater_jamming.txt:168-175`
- **片段**：

```text
   transmitter
      power           750 kw
      frequency       900 mhz
      pulse_width     3  usec
      pulse_repetition_interval    750 usec // max PRI range of 225 km
      antenna_pattern EW_RADAR_ANTENNA
      antenna_tilt     10 deg
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：power, frequency, pulse_width, pulse_repetition_interval, antenna_pattern, antenna_tilt

### transmitter（ew_radar）｜发射机

- **关键词**：transmitter, antenna_pattern, beam_tilt, power, frequency, internal_loss, frequency_channels, 发射机
- **出处**：`electronic_warfare/test_multi_beam/sensors/radar/ew_radar.txt:49-56`
- **片段**：

```text
         transmitter
            antenna_pattern             EW_RADAR_ANTENNA
            beam_tilt                   10.0 deg
            power                       1000.0 kw
            frequency                   200 mhz
            internal_loss               2 db
            frequency_channels 150 mhz 5 mhz 250 mhz
         end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, beam_tilt, power, frequency, internal_loss, frequency_channels

### transmitter（helicopter_surface_search_radar_1）｜发射机

- **关键词**：transmitter, antenna_pattern, power, frequency, pulse_width, pulse_compression_ratio, pulse_repetition_frequency, 发射机
- **出处**：`new_guidance/sensors/radar/helicopter_surface_search_radar_1.txt:55-62`　（同签名共 2 处，另见 `ship_ad/sensors/radar/helicopter_surface_search_radar_1.txt:54`）
- **片段**：

```text
  transmitter
     antenna_pattern             HELICOPTER_SURFACE_SEARCH_RADAR_1_ANTENNA
     power                       50.0 kw       # unknown
     frequency                   10000 mhz     # Ref 2 (X band)
     pulse_width                 1.0 usec      # unknown
     pulse_compression_ratio     15 absolute   # Ref 2 range resolution < 20 m
     pulse_repetition_frequency  400 hz        # unknown
  end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, power, frequency, pulse_width, pulse_compression_ratio, pulse_repetition_frequency

### transmitter（s-band_ew_radar_sensor）｜发射机

- **关键词**：transmitter, antenna_pattern, beam_tilt, power, frequency, internal_loss, pulse_repetition_frequency, 发射机
- **出处**：`orwaca_iads/sensors/radar/s-band_ew_radar_sensor.txt:31-38`
- **片段**：

```text
   transmitter
      antenna_pattern             S-BAND_EW_RADAR_ANTENNA
      beam_tilt                   10.0 deg
      power                       1000.0 kw
      frequency                   2500 mhz
      internal_loss               2 db
	   pulse_repetition_frequency  400 Hz
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, beam_tilt, power, frequency, internal_loss, pulse_repetition_frequency

### transmitter（bistatic_sp_false_target_jamming_demo）｜发射机

- **关键词**：transmitter, antenna_pattern, power, frequency, bandwidth, pulse_repetition_interval, internal_loss, 发射机
- **出处**：`sensor_demos/bistatic_sp_false_target_jamming_demo.txt:33-40`　（同签名共 2 处，另见 `sensor_demos/bistatic_support_false_target_jamming_demo.txt:33`）
- **片段**：

```text
   transmitter
      antenna_pattern JAMMER_ANTENNA
      power           1 w
      frequency       100 mhz
      bandwidth       200 khz  # false target jamming
      pulse_repetition_interval 100 usec
      internal_loss   11 db
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, power, frequency, bandwidth, pulse_repetition_interval, internal_loss

### transmitter（coherent_sensor_demo）｜发射机

- **关键词**：transmitter, antenna_pattern, beam_tilt, power, pulse_width, pulse_repetition_interval, frequency, 发射机
- **出处**：`sensor_demos/coherent_sensor_demo.txt:42-49`　（同签名共 2 处，另见 `sensor_plot/radar/hm-repeater-effect.txt:123`）
- **片段**：

```text
      transmitter
         antenna_pattern           EW_RADAR_ANTENNA
         beam_tilt                  10 deg
         power                     750 kw
         pulse_width                50 usec
         pulse_repetition_interval 750 usec // max PRI range of 225 km
         frequency                 920 mhz
      end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, beam_tilt, power, pulse_width, pulse_repetition_interval, frequency

### transmitter（top_plate）｜发射机

- **关键词**：transmitter, antenna_pattern, power, wavelength, pulse_width, pulse_compression_ratio, pulse_repetition_frequency, 发射机
- **出处**：`ship_ad/sensors/radar/top_plate.txt:49-56`
- **片段**：

```text
  transmitter
     antenna_pattern             TOP_PLATE_ANTENNA
     power                       30.0 kw       # Ref 2
     wavelength                  12 cm         # Ref 2 (12 or 15 cm)
     pulse_width                 40.0 usec     # using Rice Screen as surrogate
     pulse_compression_ratio     40 absolute   # using Rice Screen as surrogate
     pulse_repetition_frequency  370 hz        # using Rice Screen as surrogate
  end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, power, wavelength, pulse_width, pulse_compression_ratio, pulse_repetition_frequency

### transmitter（cloud_attenuation）｜发射机

- **关键词**：transmitter, antenna_pattern, frequency, power, bandwidth, pulse_repetition_frequency, pulse_width, 发射机
- **出处**：`space_operations/cloud_attenuation.txt:171-178`
- **片段**：

```text
      transmitter
         antenna_pattern                  ALTAIR
         frequency                        422 MHz
         power                            5 MW
         bandwidth                        4 MHz
         pulse_repetition_frequency       2976 Hz
         pulse_width                      0.6 msec
      end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, frequency, power, bandwidth, pulse_repetition_frequency, pulse_width

### transmitter（uhf_ew_radar_sensor）｜发射机

- **关键词**：transmitter, antenna_pattern, power, frequency, internal_loss, pulse_repetition_frequency, pulse_width, 发射机
- **出处**：`cyber/sensors/radar/uhf_ew_radar_sensor.txt:36-44`　（同签名共 2 处，另见 `swarm/sensors/radar/uhf_ew_radar_sensor.txt:36`）
- **片段**：

```text
   transmitter
      antenna_pattern             UHF_EW_RADAR_ANTENNA
      #beam_tilt                    10.0 deg
      power                       1000.0 kw
      frequency                    200 mhz
      internal_loss                  2 db
      pulse_repetition_frequency   400 Hz
      pulse_width                    0.6 usec
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, power, frequency, internal_loss, pulse_repetition_frequency, pulse_width

### transmitter（bistatic_demo）｜发射机

- **关键词**：transmitter, antenna_pattern, antenna_height, power, frequency, bandwidth, internal_loss, 发射机
- **出处**：`sensor_demos/bistatic_demo.txt:68-76`
- **片段**：

```text
   transmitter
      antenna_pattern       BISTATIC_TX_ANTENNA
      antenna_height        90 m
      power                    50 kw
      frequency               100 mhz
      bandwidth               200 khz
      #pulse_compression_ratio 1e5 absolute // Signal Processing Gain, Gsp = Tsp * Br = 0.5 sec * 200e3 1/sec
      internal_loss        8 db
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, antenna_height, power, frequency, bandwidth, internal_loss

### transmitter（bomber_sar）｜发射机

- **关键词**：transmitter, antenna_pattern, frequency, power, pulse_width, internal_loss, attenuation_model, 发射机
- **出处**：`sensor_plot/sar/bomber_sar.txt:71-79`　（同签名共 2 处，另见 `sensor_plot/sar/fighter_sar.txt:72`）
- **片段**：

```text
      transmitter
         antenna_pattern               BOMBER_SAR_ANTENNA
         frequency                     16 ghz
         power                         15256.0 w           # 7628 modules * 2 watts/modules
         pulse_width                   100 us
         # The pulse repetition frequency is not defined. It will be dynamically determined.
         internal_loss                 6.74 db
         attenuation_model             earce
      end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, frequency, power, pulse_width, internal_loss, attenuation_model

### transmitter（NOAACommDef）｜发射机

- **关键词**：transmitter, antenna_pattern, attenuation, frequency, bandwidth, propagation_model, power, 发射机
- **出处**：`satellite_demos/avionics/comm/NOAACommDef.txt:27-37`　（同签名共 2 处，另见 `satellite_demos/avionics/comm/NOAACommDef_GS.txt:17`）
- **片段**：

```text
   transmitter
      antenna_pattern                     UNIFORM_0DBI_PATTERN
      attenuation                         none
      frequency                           137.5 MHz       # ref 1;  average between 137 and 138
#      wavelength                          25.5 cm         #
      bandwidth                           24 MHz          #
      propagation_model                   none
      power                               6.35 watts       # ref 3
#      pulse_width                         15.0 usec
#      pulse_repetition_interval           150.0 usec
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, attenuation, frequency, bandwidth, propagation_model, power

### transmitter（cover_pulse_jamming）｜发射机

- **关键词**：transmitter, power, frequency, bandwidth, antenna_pattern, electronic_attack, technique, 发射机
- **出处**：`electronic_warfare/cover_pulse_jamming.txt:55-66`　（同签名共 2 处，另见 `electronic_warfare/jtos_power.txt:54`）
- **片段**：

```text
   transmitter
      power           100 w
      frequency       200 mhz
      bandwidth         2 mhz   # Set to the radar receive bandwidth
      antenna_pattern JAMMER_ANTENNA

      electronic_attack JAMMER_EA
      technique cover_pulse_jamming
            default_on
         end_technique
      end_electronic_attack
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：power, frequency, bandwidth, antenna_pattern, electronic_attack, technique

### transmitter（soj_vhf_jammer）｜发射机

- **关键词**：transmitter, antenna_pattern, frequency_band, power, internal_loss, electronic_attack, technique, 发射机
- **出处**：`electronic_warfare/test_multi_beam/weapons/jammer/soj_vhf_jammer.txt:28-40`
- **片段**：

```text
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
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, frequency_band, power, internal_loss, electronic_attack, technique

### transmitter（medium_range_radar_missile）｜发射机

- **关键词**：transmitter, antenna_pattern, power, frequency, pulse_repetition_interval, pulse_width, 发射机
- **出处**：`air_to_air/weapons/aam/medium_range_radar_missile.txt:72-78`　（同签名共 9 处，另见 `air_to_air/weapons/aam/short_range_ir_missile.txt:71`、`base_types/weapons/aam/medium_range_radar_missile.txt:65`、`behavior_tree/weapons/aam/medium_range_radar_missile.txt:63`）
- **片段**：

```text
      transmitter
         antenna_pattern          SEEKER_ANTENNA
         power                       1.0 kW
         frequency                  10.0 GHz
         pulse_repetition_interval   3.3 usec    #HPRF 300 kHz
         pulse_width                 1.0 usec    #30% duty factor
      end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, power, frequency, pulse_repetition_interval, pulse_width

### transmitter（generic_bomber_radar）｜发射机

- **关键词**：transmitter, antenna_pattern, power, frequency, pulse_repetition_frequency, internal_loss, 发射机
- **出处**：`base_types/sensors/radar/generic_bomber_radar.txt:91-97`　（同签名共 6 处，另见 `suppressor/sensors/radar/bomber_radar.txt:40`、`suppressor/sensors/radar/sam_radar.txt:41`、`suppressor/weapons/sam/missile.txt:43`）
- **片段**：

```text
    transmitter
      antenna_pattern       GENERIC_BOMBER_RADAR_ANTENNA_PATTERN
      power                 5 mw
      frequency             3 ghz
      pulse_repetition_frequency 250 hz
      internal_loss         10 db
    end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, power, frequency, pulse_repetition_frequency, internal_loss

### transmitter（red_missile_seeker_1）｜发射机

- **关键词**：transmitter, antenna_pattern, power, frequency, pulse_width, pulse_repetition_frequency, 发射机
- **出处**：`base_types/sensors/radar/red_missile_seeker_1.txt:50-56`　（同签名共 7 处，另见 `new_guidance/sensors/radar/red_missile_seeker.txt:42`、`new_guidance/sensors/radar/sr_sam_fcr_1.txt:54`、`ship_ad/sensors/radar/red_missile_seeker_1.txt:51`）
- **片段**：

```text
  transmitter
     antenna_pattern             RED_MISSILE_SEEKER_1_ANTENNA
     power                       500 w         # unknown
     frequency                   9000 mhz      # assuming X-band
     pulse_width                 1.0 usec      # unknown
     pulse_repetition_frequency  3600 hz       # unknown
  end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, power, frequency, pulse_width, pulse_repetition_frequency

### transmitter（ew_radar）｜发射机

- **关键词**：transmitter, antenna_pattern, beam_tilt, power, frequency, internal_loss, 发射机
- **出处**：`cyber/exfiltrate_demo/sensors/radar/ew_radar.txt:43-49`　（同签名共 4 处，另见 `heatmap/sensors/radar/ew_radar.txt:35`、`iads/sensors/radar/ew_radar.txt:44`、`iads_c2_demos/sensors/ew_radar.txt:41`）
- **片段**：

```text
   transmitter
      antenna_pattern             EW_RADAR_ANTENNA
      beam_tilt                   10.0 deg
      power                       1000.0 kw
      frequency                   200 mhz
      internal_loss               2 db
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, beam_tilt, power, frequency, internal_loss

### transmitter（agile_repeater_jamming-rt1）｜发射机

- **关键词**：transmitter, antenna_pattern, power, pulse_width, pulse_repetition_interval, frequency_channels, 发射机
- **出处**：`electronic_warfare/agile_repeater_jamming-rt1.txt:271-277`　（同签名共 5 处，另见 `electronic_warfare/agile_repeater_jamming-rt2.txt:271`、`electronic_warfare/air-to-air-rt1.txt:257`、`electronic_warfare/air-to-air-rt2.txt:257`）
- **片段**：

```text
         transmitter
            antenna_pattern           EW_RADAR_ANTENNA
            power                     750.0 kw
            pulse_width                  50  usec
            pulse_repetition_interval    750 usec // max PRI range of 225 km
            frequency_channels 920 mhz 10 mhz 940 mhz
         end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, power, pulse_width, pulse_repetition_interval, frequency_channels

### transmitter（comm_jamming）｜发射机

- **关键词**：transmitter, power, frequency, bandwidth, antenna_pattern, electronic_attack, 发射机
- **出处**：`electronic_warfare/comm_jamming.txt:233-239`　（同签名共 18 处，另见 `satellite_demos/scenarios/gps_denied.txt:252`、`electronic_warfare/false-target_jamming_1.txt:54`、`electronic_warfare/false-target_jamming_2.txt:58`）
- **片段**：

```text
   transmitter
      power           1000 w
      frequency       2.4 GHz
      bandwidth         1 mhz
      antenna_pattern SPOT_JAMMER_ANTENNA
      electronic_attack JAM_EA end_electronic_attack
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：power, frequency, bandwidth, antenna_pattern, electronic_attack

### transmitter（track_error）｜发射机

- **关键词**：transmitter, power, frequency, bandwidth, pulse_width, pulse_repetition_interval, 发射机
- **出处**：`electronic_warfare/track_error.txt:196-202`
- **片段**：

```text
   transmitter
      power         15000 kw
      frequency       900 mhz
      bandwidth       0.1 mhz
     pulse_width                  50  usec
     pulse_repetition_interval    750 usec // max PRI range of 225 km
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：power, frequency, bandwidth, pulse_width, pulse_repetition_interval

### transmitter（oth_radar）｜发射机

- **关键词**：transmitter, power, frequency, bandwidth, antenna_pattern, antenna_height, 发射机
- **出处**：`oth_radar/sensors/radar/oth_radar.txt:51-57`
- **片段**：

```text
  transmitter
    power                      1000 kw
    frequency                  10  mhz
    bandwidth                  0.1 mhz
    antenna_pattern            OTH_RADAR_ANTENNA
    antenna_height             50 m
  end_transmitter
```

- **演示要点**：演示 transmitter 的参数：power, frequency, bandwidth, antenna_pattern, antenna_height

### transmitter（iridium_ground）｜发射机

- **关键词**：transmitter, antenna_pattern, frequency, bandwidth, polarization, power, 发射机
- **出处**：`satellite_demos/ground_networks/iridium_ground.txt:33-39`　（同签名共 15 处，另见 `satellite_demos/ground_networks/iridium_ground.txt:56`、`satellite_demos/ground_networks/iridium_ground.txt:78`、`satellite_demos/ground_networks/iridium_ground.txt:100`）
- **片段**：

```text
   transmitter
      antenna_pattern                     UNIFORM_0DBI_PATTERN
      frequency                           29.2 ghz  # ref 1
      bandwidth                           195 mhz  # ref 1
      polarization                        right_circular  # ref 1
      power                               45 dbw
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, frequency, bandwidth, polarization, power

### transmitter（bistatic_sp_noise_jamming_demo）｜发射机

- **关键词**：transmitter, antenna_pattern, power, frequency, bandwidth, internal_loss, 发射机
- **出处**：`sensor_demos/bistatic_sp_noise_jamming_demo.txt:22-28`　（同签名共 7 处，另见 `sensor_demos/bistatic_support_noise_jamming_demo.txt:21`、`sensor_plot/esm/hm-jammer-detect-1.txt:62`、`sensor_plot/esm/hm-jammer-detect-2.txt:54`）
- **片段**：

```text
   transmitter
      antenna_pattern JAMMER_ANTENNA
      power           1 w
      frequency       100 mhz
      bandwidth       20 mhz  # noise jamming
      internal_loss   11 db
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, power, frequency, bandwidth, internal_loss

### transmitter（hm-bistatic-radar）｜发射机

- **关键词**：transmitter, antenna_pattern, beam_tilt, power, frequency, bandwidth, 发射机
- **出处**：`sensor_plot/radar/hm-bistatic-radar.txt:69-75`
- **片段**：

```text
   transmitter
      antenna_pattern             BISTATIC_TX_ANTENNA
      beam_tilt                   25 deg
      power                       100.0 w
      frequency                   400 mhz
      bandwidth                   2.0 mhz
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, beam_tilt, power, frequency, bandwidth

### transmitter（cloud_attenuation）｜发射机

- **关键词**：transmitter, antenna_pattern, frequency, power, bandwidth, wavelength, 发射机
- **出处**：`space_operations/cloud_attenuation.txt:317-323`　（同签名共 2 处，另见 `space_operations/cloud_attenuation.txt:285`）
- **片段**：

```text
      transmitter
         antenna_pattern                  MILLSTONE
         frequency                        1.295 GHz
         power                            3 MW
         bandwidth                        1 ghz
         wavelength                       23.3 cm
      end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, frequency, power, bandwidth, wavelength

### transmitter（alv_jammer）｜发射机

- **关键词**：transmitter, antenna_pattern, frequency_band, power, internal_loss, electronic_attack, 发射机
- **出处**：`alv_routing/weapons/alv_jammer.txt:72-79`　（同签名共 4 处，另见 `electronic_warfare/test_multi_beam/weapons/jammer/soj_sband_jammer.txt:38`、`electronic_warfare/test_multi_beam/weapons/jammer/soj_xband_jammer.txt:39`、`electronic_warfare/test_false_targets/weapons/jammer/soj_xband_jammer.txt:57`）
- **片段**：

```text
   transmitter
      antenna_pattern         ALV_JAMMER_ANTENNA
      frequency_band          30 mhz 3000 mhz
      power                   100.0 w
      internal_loss           0.0 db

      electronic_attack ALV_EA end_electronic_attack
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, frequency_band, power, internal_loss, electronic_attack

### transmitter（iridium）｜发射机

- **关键词**：transmitter, antenna_pattern, alternate_frequency, bandwidth, polarization, power, 发射机
- **出处**：`satellite_demos/platforms/iridium.txt:36-43`
- **片段**：

```text
      transmitter
         antenna_pattern                     UNIFORM_0DBI_PATTERN
         alternate_frequency 1                1621 mhz   # ref 1
         alternate_frequency 2                22.28 ghz  # ref 1
         bandwidth                            200 mhz    # ref 1
         polarization                         horizontal  # ref 1
         power                                35 dbw  # ref 1
      end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, alternate_frequency, bandwidth, polarization, power

### transmitter（example_sar）｜发射机

- **关键词**：transmitter, antenna_pattern, frequency, power, pulse_width, internal_loss, 发射机
- **出处**：`sensor_plot/sar/example_sar.txt:38-45`
- **片段**：

```text
      transmitter
         antenna_pattern               EXAMPLE_SAR_ANTENNA
         frequency                     9 ghz
         power                         12690.0 w
         pulse_width                   50 us
         #pulse_repetition_frequency    1000 hz
         internal_loss                 3.25 db
      end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, frequency, power, pulse_width, internal_loss

### transmitter（ground_station）｜发射机

- **关键词**：transmitter, earth_radius_multiplier, antenna_pattern, frequency, power, internal_loss, 发射机
- **出处**：`satellite_demos/platforms/ground_station.txt:34-44`
- **片段**：

```text
      transmitter
         # The earth radius multiplier is set to one to disable the
         # computations that simulate atmospheric refraction.
         earth_radius_multiplier 1.0
         antenna_pattern GS_XMTR_ANTENNA
         frequency       145.920 mhz
         power           5 watts
         # The internal loss accounts for the 'transmit feeder loss' in the
         # link budget calculator
         internal_loss   3 dB
      end_transmitter
```

- **演示要点**：演示 transmitter 的参数：earth_radius_multiplier, antenna_pattern, frequency, power, internal_loss

### transmitter（simple_auto_jamming）｜发射机

- **关键词**：transmitter, power, frequency_band, antenna_pattern, electronic_attack, debug, 发射机
- **出处**：`electronic_warfare/simple_auto_jamming.txt:74-91`
- **片段**：

```text
   transmitter
      power                100 w
      frequency_band       100 mhz 1000 mhz
      antenna_pattern      JAMMER_ANTENNA

      electronic_attack
      debug
         technique noise_jamming
         debug
            mitigation_class_name NOISE_JAMMING
            default_on
            effect power_effect WSF_JAMMER_POWER_EFFECT
            debug
            end_effect
         end_technique
      end_electronic_attack

   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：power, frequency_band, antenna_pattern, electronic_attack, debug

### transmitter（soj_sband_jammer）｜发射机

- **关键词**：transmitter, antenna_pattern, frequency_band, power, internal_loss, 发射机
- **出处**：`aea_iads/weapons/jammer/soj_sband_jammer.txt:41-46`　（同签名共 6 处，另见 `aea_iads/weapons/jammer/soj_vhf_jammer.txt:27`、`aea_iads/weapons/jammer/soj_xband_jammer.txt:52`、`iads/weapons/jammer/soj_sband_jammer.txt:41`）
- **片段**：

```text
  transmitter
    antenna_pattern            SOJ_SBAND_ANTENNA
    frequency_band             2000 mhz 4000 mhz
    power                      500.0 w
    internal_loss              0.0 db
  end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, frequency_band, power, internal_loss

### transmitter（acq_radar）｜发射机

- **关键词**：transmitter, antenna_pattern, power, frequency, internal_loss, 发射机
- **出处**：`alternate_locations/sensors/radar/acq_radar.txt:29-34`　（同签名共 24 处，另见 `alternate_locations/sensors/radar/ttr_radar.txt:33`、`cyber/exfiltrate_demo/sensors/radar/acq_radar.txt:35`、`cyber/exfiltrate_demo/sensors/radar/ttr_radar.txt:37`）
- **片段**：

```text
   transmitter 
      antenna_pattern      ACQ_RADAR_ANTENNA
      power                1000 kw
      frequency            3000 mhz
      internal_loss        2 db
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, power, frequency, internal_loss

### transmitter（comm_jamming）｜发射机

- **关键词**：transmitter, power, antenna_pattern, frequency, bandwidth, 发射机
- **出处**：`electronic_warfare/comm_jamming.txt:84-89`　（同签名共 6 处，另见 `electronic_warfare/esm_detect_jammer.txt:47`、`electronic_warfare/jamming_perception.txt:28`、`sensor_demos/passive_detector_demo.txt:89`）
- **片段**：

```text
   transmitter
      power 100 w
      antenna_pattern RADIO_ANTENNA_PATTERN
      frequency 2.4 GHz
      bandwidth 5.0 MHz
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：power, antenna_pattern, frequency, bandwidth

### transmitter（radar_set）｜发射机

- **关键词**：transmitter, power, frequency, pulse_width, pulse_repetition_frequency, 发射机
- **出处**：`launcher/sensors/radar/radar_set.txt:21-26`
- **片段**：

```text
  transmitter
     power                       500 w         # unknown
     frequency                   9000 mhz      # X-band
     pulse_width                 1.0 usec      # unknown
     pulse_repetition_frequency  3600 hz       # unknown
  end_transmitter
```

- **演示要点**：演示 transmitter 的参数：power, frequency, pulse_width, pulse_repetition_frequency

### transmitter（generic_fire_control_radar）｜发射机

- **关键词**：transmitter, antenna_pattern, power, frequency, pulse_repetition_frequency, 发射机
- **出处**：`base_types/sensors/radar/generic_fire_control_radar.txt:189-195`　（同签名共 3 处，另见 `iads/sensors/radar/ucav_sar.txt:70`、`iads_c2_demos/sensors/ucav_sar.txt:74`）
- **片段**：

```text
    transmitter
      antenna_pattern             GENERIC_FIRE_CONTROL_RADAR_ANTENNA_PATTERN
      power                       250 kw
      frequency                   3 ghz
      pulse_repetition_frequency  250 hz
      //internal_loss               10 db
    end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, power, frequency, pulse_repetition_frequency

### transmitter（agile_jamming）｜发射机

- **关键词**：transmitter, power, frequency_band, antenna_pattern, electronic_attack, 发射机
- **出处**：`electronic_warfare/agile_jamming.txt:78-87`　（同签名共 9 处，另见 `electronic_warfare/manual_repeater_jamming.txt:80`、`electronic_warfare/agile_auto-repeater_jamming.txt:82`、`electronic_warfare/agile_repeater_jamming-rt1.txt:80`）
- **片段**：

```text
   transmitter
      power           100 w
      frequency_band  100 mhz 1000 mhz
      antenna_pattern JAMMER_ANTENNA

      electronic_attack JAMMER_EA
         technique noise_jamming
         end_technique
      end_electronic_attack
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：power, frequency_band, antenna_pattern, electronic_attack

### transmitter（track_error）｜发射机

- **关键词**：transmitter, power, frequency, bandwidth, electronic_attack, 发射机
- **出处**：`electronic_warfare/track_error.txt:35-50`
- **片段**：

```text
   transmitter
      power             1 w
      frequency       900 mhz
      bandwidth         1 mhz
      electronic_attack
         technique track_error_inducement
            default_on
            effect track_effect WSF_TRACK_EFFECT
               track_behavior  distort
               azimuth_error    2 deg
               elevation_error  3 deg
               range_error     10 m
            end_effect
         end_technique
      end_electronic_attack
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：power, frequency, bandwidth, electronic_attack

### transmitter（hm-repeater-effect）｜发射机

- **关键词**：transmitter, power, frequency, antenna_pattern, electronic_attack, 发射机
- **出处**：`sensor_plot/radar/hm-repeater-effect.txt:62-79`
- **片段**：

```text
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
```

- **演示要点**：演示 transmitter 的参数：power, frequency, antenna_pattern, electronic_attack

### transmitter（generic_radar_10nm）｜发射机

- **关键词**：transmitter, antenna_pattern, antenna_tilt, power, frequency, 发射机
- **出处**：`base_types/sensors/radar/generic_radar_10nm.txt:206-225`
- **片段**：

```text
  transmitter
    antenna_pattern           GENERIC_RADAR_10NM_ANTENNA_PATTERN

    # Enter antenna tilt parameter to specify constant angle of
    #    antenna above horizon for all azimuths of its scan.
    //  antenna_tilt            5 deg         # Actual tilt (optical)
    //  antenna_tilt            4.75 deg      # Adjusted tilt (allowing for 4/3 earth)
    //  antenna_tilt            0 deg         # No tilt (used with double-beamwidth)
    antenna_tilt              4.75 deg      # (A) w/ 0.5 deg error

    # NOTE: Any values for peak power and frequency can be entered
    #     when using the simple "cookie-cutter" model because
    #     range for detecting a target of a specified radar
    #     cross section calculated using parameter:
    #     "one_m2_detect_range"
    power                   100 kw    # peak power
    frequency               3 ghz     # nominal S-band frequency
                                      # (for detection & tracking)

  end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, antenna_tilt, power, frequency

### transmitter（blue_abm_ttr）｜发射机

- **关键词**：transmitter, antenna_pattern, frequency, power, 发射机
- **出处**：`ballistic_missile_shootdown/sensors/radar/blue_abm_ttr.txt:40-44`　（同签名共 14 处，另见 `base_types/sensors/radar/blue_a2a_radar.txt:135`、`base_types/sensors/radar/blue_ew_radar_1.txt:21`、`base_types/sensors/radar/blue_ship_mf_radar.txt:134`）
- **片段**：

```text
   transmitter
      antenna_pattern                  BLUE_ABM_TTR_ANTENNA
      frequency                        10 ghz               # Ref 1, 8-12 ghz
      power                            200 kw
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_pattern, frequency, power

### transmitter（ad_hoc_comm）｜发射机

- **关键词**：transmitter, frequency, power, maximum_range, 发射机
- **出处**：`comm/comms/ad_hoc_comm.txt:52-56`　（同签名共 2 处，另见 `multiresolution_demos/comms/comm_include.txt:32`）
- **片段**：

```text
   transmitter
      frequency 100 mhz
      power 50 mw
      maximum_range 100 km
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：frequency, power, maximum_range

### transmitter（barrage_jamming）｜发射机

- **关键词**：transmitter, power, frequency_band, antenna_pattern, 发射机
- **出处**：`electronic_warfare/barrage_jamming.txt:44-48`
- **片段**：

```text
   transmitter
      power           100 w
      frequency_band  150 mhz 450 mhz
      antenna_pattern JAMMER_ANTENNA
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：power, frequency_band, antenna_pattern

### transmitter（passive_detector_demo）｜发射机

- **关键词**：transmitter, power, frequency, bandwidth, 发射机
- **出处**：`sensor_demos/passive_detector_demo.txt:252-256`　（同签名共 15 处，另见 `sensor_demos/passive_detector_demo.txt:273`、`sensor_demos/passive_detector_demo.txt:293`、`sensor_demos/passive_detector_demo.txt:314`）
- **片段**：

```text
      transmitter
         power     50000 w  // ERP
         frequency  88.7 mhz
         bandwidth 200 khz
      end_transmitter
```

- **演示要点**：演示 transmitter 的参数：power, frequency, bandwidth

### transmitter（generic_ground_radar）｜发射机

- **关键词**：transmitter, antenna_tilt, power, frequency, 发射机
- **出处**：`base_types/sensors/radar/generic_ground_radar.txt:141-158`
- **片段**：

```text
  transmitter
  antenna_pattern     GROUND_RADAR_ANTENNA_PATTERN

   # Enter antenna tilt parameter to specify constant angle of
   #  antenna above horizon for all azimuths of its scan.
   #  antenna_tilt      5 deg             # Actual tilt (optical)
   #  antenna_tilt      4.75 deg          # Adjusted tilt (allowing for 4/3 earth)
   #  antenna_tilt      0 deg             # No tilt (used with double-beamwidth)
   antenna_tilt       4.75 deg            # (A) w/ 0.5 deg error

   # NOTE: Any values for peak power and frequency can be entered
   #    when using the simple "cookie-cutter" model because
   #    range for detecting a target of a specified radar
   #    cross section calculated using parameter: "one_m2_detect_range"
   power              100 kw              # nominal peak power of radar transmitter
   frequency          3 ghz               # nominal frequency of radar transmitter

  end_transmitter
```

- **演示要点**：演示 transmitter 的参数：antenna_tilt, power, frequency

### transmitter（red_a2a_radar）｜发射机

- **关键词**：transmitter, frequency, power, 发射机
- **出处**：`base_types/sensors/radar/red_a2a_radar.txt:126-129`　（同签名共 9 处，另见 `electronic_warfare/esm_detect_multi_sensor_radar.txt:166`、`electronic_warfare/esm_detect_multi_sensor_radar.txt:228`、`heatmap/sensors/radar/striker_radar.txt:24`）
- **片段**：

```text
      transmitter
         frequency 9.6 ghz
         power 1.0 mw
      end_transmitter
```

- **演示要点**：演示 transmitter 的参数：frequency, power

### transmitter（jamming_perception）｜发射机

- **关键词**：transmitter, frequency, beam_tilt, 发射机
- **出处**：`electronic_warfare/jamming_perception.txt:88-91`
- **片段**：

```text
      transmitter
         frequency                  250 mhz
         beam_tilt                  65 deg
      end_transmitter
```

- **演示要点**：演示 transmitter 的参数：frequency, beam_tilt

### transmitter（designator_type）｜发射机

- **关键词**：transmitter, wavelength, power, 发射机
- **出处**：`hellfire/laser_designation_via_dis/designator_type.txt:35-38`　（同签名共 3 处，另见 `hellfire/semiactive_laser_hellfire/designator_type.txt:35`、`laser_designator/sensors/laser/laser_designator-1212.txt:24`）
- **片段**：

```text
      transmitter
         wavelength 1.06E-6 microns
         power 1 mw
      end_transmitter
```

- **演示要点**：演示 transmitter 的参数：wavelength, power

### transmitter（passive_detector_demo）｜发射机

- **关键词**：transmitter, power, bandwidth, 发射机
- **出处**：`sensor_demos/passive_detector_demo.txt:230-234`　（同签名共 2 处，另见 `sensor_demos/passive_detector_df_demo.txt:304`）
- **片段**：

```text
      transmitter
         power     42000 w  // ERP
         #frequency  88.1 mhz
         bandwidth 200 khz
      end_transmitter
```

- **演示要点**：演示 transmitter 的参数：power, bandwidth

### transmitter（blue_a2a_radar）｜发射机

- **关键词**：transmitter, power, 发射机
- **出处**：`base_types/sensors/radar/blue_a2a_radar.txt:161-163`　（同签名共 4 处，另见 `draw/sensors/radar/generic_fighter_radar.txt:67`、`electronic_warfare/esm_detect_multi_beam_radar.txt:129`、`outer_air_battle/sensors/radar/blue_a2a_radar.txt:167`）
- **片段**：

```text
    transmitter
      power                   2.3 MW
    end_transmitter
```

- **演示要点**：演示 transmitter 的参数：power

### transmitter（iads_laydown）｜发射机

- **关键词**：transmitter, frequency, 发射机
- **出处**：`cyber/exfiltrate_demo/scenarios/iads_laydown.txt:35-37`　（同签名共 155 处，另见 `cyber/exfiltrate_demo/scenarios/iads_laydown.txt:48`、`cyber/exfiltrate_demo/scenarios/iads_laydown.txt:61`、`cyber/exfiltrate_demo/scenarios/iads_laydown.txt:74`）
- **片段**：

```text
     transmitter
        frequency  150.0 mhz
     end_transmitter
```

- **演示要点**：演示 transmitter 的参数：frequency

### transmitter（agile_auto-repeater_jamming）｜发射机

- **关键词**：transmitter, frequency_channels, 发射机
- **出处**：`electronic_warfare/agile_auto-repeater_jamming.txt:216-218`　（同签名共 21 处，另见 `electronic_warfare/agile_auto-repeater_jamming.txt:236`、`electronic_warfare/agile_auto-repeater_jamming.txt:242`、`electronic_warfare/agile_repeater_jamming-rt1.txt:331`）
- **片段**：

```text
         transmitter
            frequency_channels 925 mhz 10 mhz 945 mhz
         end_transmitter
```

- **演示要点**：演示 transmitter 的参数：frequency_channels

### transmitter（soj_base_jammer）｜发射机

- **关键词**：transmitter, electronic_attack, 发射机
- **出处**：`aea_iads/weapons/jammer/soj_base_jammer.txt:95-98`
- **片段**：

```text
   transmitter
      electronic_attack SOJ_EA
      end_electronic_attack
   end_transmitter
```

- **演示要点**：演示 transmitter 的参数：electronic_attack

### transmitter（agile_jamming）｜发射机

- **关键词**：transmitter, frequency_list, 发射机
- **出处**：`electronic_warfare/agile_jamming.txt:298-304`
- **片段**：

```text
         transmitter
            frequency_list
               frequency_id           1 230 mhz
               frequency_id           2 240 mhz
               frequency_id           3 250 mhz
            end_frequency_list
         end_transmitter
```

- **演示要点**：演示 transmitter 的参数：frequency_list
