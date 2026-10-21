# 目标特征

> **来源**：AFSIM 2.9.0 官方 demo 集（`demos/`，4,751 个 `.txt`，132 万行）
> **性质**：原文摘抄，未改写。同一「参数签名」只保留 1 条代表，并注明出现次数与另见位置
> **警示**：片段中数值为 demo 原值，**仅供语法参考，不得直接复用**；依赖 `common/` 数据表的片段须另行提供
> **检索**：按命令 / 类型名 / 参数名搜本卷；总表见 `90-tokens.md`

### acoustic_signature（acoustic_demo2）｜声学特征

- **关键词**：acoustic_signature, data_reference_range, state, spectrum_data, 声学特征
- **出处**：`acoustic/acoustic_demo2.txt:167-173`　（同签名共 7 处，另见 `acoustic/acoustic_demo2.txt:11`、`acoustic/acoustic_demo2.txt:32`、`acoustic/acoustic_demo2.txt:53`）
- **片段**：

```text
acoustic_signature BOGUS # MADE UP NUMBERS
   data_reference_range 10 feet
   state default
   spectrum_data
        freq    31.5 hz   noise_pressure 20.3 dB_20uPa
   end_spectrum_data
end_acoustic_signature
```

- **演示要点**：演示 acoustic_signature 的参数：data_reference_range, state, spectrum_data

### bistatic_signature（small_bistatic_radar_signature）｜双站特征

- **关键词**：bistatic_signature, azimuth, elevation, 双站特征
- **出处**：`base_types/signatures/small_bistatic_radar_signature.txt:11-22`　（同签名共 2 处，另见 `base_types/signatures/small_radar_signature.txt:11`）
- **片段**：

```text
  bistatic_signature
    azimuth -180 deg
      elevation -90 deg
        constant 0.0001 m^2
      elevation 90 deg
        constant 0.0001 m^2
    azimuth 180 deg
      elevation -90 deg
        constant 0.0001 m^2
      elevation 90 deg
        constant 0.0001 m^2
  end_bistatic_signature
```

- **演示要点**：演示 bistatic_signature 的参数：azimuth, elevation

### infrared_signature（escort）｜红外特征

- **关键词**：infrared_signature, constant, 红外特征
- **出处**：`air_to_air/scenarios/escort.txt:27-29`　（同签名共 98 处，另见 `air_to_air/scenarios/escort.txt:329`、`air_to_air/weapons/aam/medium_range_radar_missile.txt:22`、`air_to_air/weapons/aam/short_range_ir_missile.txt:32`）
- **片段**：

```text
infrared_signature SIMPLE_BOMBER_INFRARED_SIGNATURE
   constant 10 watts/steradian
end_infrared_signature
```

- **演示要点**：演示 infrared_signature 的参数：constant

### infrared_signature（simple_signatures）｜红外特征

- **关键词**：infrared_signature, state, 红外特征
- **出处**：`p6dof/signatures/simple_signatures.txt:37-41`　（同签名共 8 处，另见 `p6dof/signatures/simple_signatures.txt:43`、`p6dof/signatures/simple_signatures.txt:49`、`six_dof/signatures/simple_signatures.txt:37`）
- **片段**：

```text
infrared_signature SIMPLE_FIGHTER_IR_SIG
   state default
      band default
         constant 200 w/sr
end_infrared_signature
```

- **演示要点**：演示 infrared_signature 的参数：state

### multiresolution_optical_signature · WSF_MULTIRESOLUTION_OPTICAL_SIGNATURE｜

- **关键词**：multiresolution_optical_signature, WSF_MULTIRESOLUTION_OPTICAL_SIGNATURE, add, model
- **出处**：`multiresolution_demos/signatures/fighter_multiresolution_signature.txt:16-32`
- **片段**：

```text
multiresolution_optical_signature FIGHTER_MULTIRESOLUTION_OPTICAL_SIGNATURE WSF_MULTIRESOLUTION_OPTICAL_SIGNATURE
   add model sphere_sig
      fidelity_range 0.0 0.33 
      optical_signature FIGHTER_SPHERICAL_OPTICAL_SIG
      end_optical_signature
   end_model
   add model box_sig
      fidelity_range 0.33 0.66
      optical_signature FIGHTER_BOX_OPTICAL_SIG
      end_optical_signature
   end_model
   model multishape_sig
      fidelity_range 0.66 1.0
      optical_signature FIGHTER_MULTI_SHAPE_OPTICAL_SIG
      end_optical_signature
   end_model
end_multiresolution_optical_signature
```

- **演示要点**：演示 WSF_MULTIRESOLUTION_OPTICAL_SIGNATURE 的参数：add, model

### multiresolution_radar_signature · WSF_MULTIRESOLUTION_RADAR_SIGNATURE｜

- **关键词**：multiresolution_radar_signature, WSF_MULTIRESOLUTION_RADAR_SIGNATURE, model
- **出处**：`multiresolution_demos/signatures/radar_signatures.txt:44-55`
- **片段**：

```text
multiresolution_radar_signature MULTIRESOLUTION_RADAR_SIGNATURE WSF_MULTIRESOLUTION_RADAR_SIGNATURE
   model constant_sig
      fidelity_range 0.0 0.5
      radar_signature CONSTANT_RADAR_SIGNATURE
      end_radar_signature
   end_model
   model tabular_sig
      fidelity_range 0.5 1.0
      radar_signature TABULAR_RADAR_SIGNATURE
      end_radar_signature
   end_model
end_multiresolution_radar_signature
```

- **演示要点**：演示 WSF_MULTIRESOLUTION_RADAR_SIGNATURE 的参数：model

### optical_signature（escort）｜光学特征

- **关键词**：optical_signature, constant, 光学特征
- **出处**：`air_to_air/scenarios/escort.txt:30-32`　（同签名共 120 处，另见 `air_to_air/scenarios/escort.txt:332`、`air_to_air/weapons/aam/medium_range_radar_missile.txt:25`、`air_to_air/weapons/aam/short_range_ir_missile.txt:35`）
- **片段**：

```text
optical_signature  SIMPLE_BOMBER_OPTICAL_SIGNATURE
   constant 10 m^2
end_optical_signature
```

- **演示要点**：演示 optical_signature 的参数：constant

### optical_signature · WSF_COMPOSITE_OPTICAL_SIGNATURE｜光学特征

- **关键词**：optical_signature, WSF_COMPOSITE_OPTICAL_SIGNATURE, surface, 光学特征
- **出处**：`multiresolution_demos/sensor_demo.txt:99-104`　（同签名共 7 处，另见 `multiresolution_demos/signatures/fighter_box_optical_signature.txt:12`、`multiresolution_demos/signatures/fighter_spherical_optical_signature.txt:12`、`signature_demos/signatures/fighter_box_optical_signature.txt:12`）
- **片段**：

```text
optical_signature FIGHTER_SPHERICAL_OPTICAL_SIG WSF_COMPOSITE_OPTICAL_SIGNATURE
   surface sphere 
      radius 2 m
      temperature adiabatic_wall
   end_surface
end_optical_signature
```

- **演示要点**：演示 WSF_COMPOSITE_OPTICAL_SIGNATURE 的参数：surface

### optical_signature · WSF_SPACE_OPTICAL_SIGNATURE｜光学特征

- **关键词**：optical_signature, WSF_SPACE_OPTICAL_SIGNATURE, surface, 光学特征
- **出处**：`space_operations/moon_as_satellite.txt:33-38`
- **片段**：

```text
optical_signature MOON_SIGNATURE WSF_SPACE_OPTICAL_SIGNATURE
   surface sphere
      radius      1737.1 km
      reflectance 0.1362
   end_surface
end_optical_signature
```

- **演示要点**：演示 WSF_SPACE_OPTICAL_SIGNATURE 的参数：surface

### optical_signature（setup_launch_detection）｜光学特征

- **关键词**：optical_signature, state, 光学特征
- **出处**：`space_operations/setup_launch_detection.txt:19-31`
- **片段**：

```text
optical_signature LAUNCH_VEHICLE_SIG
   state FIRST_STAGE
      constant 10 m^2 #optical signature of first stage

   state SECOND_STAGE
      constant 20 m^2 #optical signature of second stage

   state THIRD_STAGE
      constant 30 m^2 #optical signature of third stage

   state default
      constant 0 m^2
end_optical_signature
```

- **演示要点**：演示 optical_signature 的参数：state

### optical_signature（output_file_demo）｜光学特征

- **关键词**：optical_signature, inline_table, 光学特征
- **出处**：`example_scripts/output_file_demo.txt:16-29`
- **片段**：

```text
optical_signature F4_OPTICAL_SIG
   inline_table m^2 9 5
            -90    -45    0    45    90
      -180  200    100   10   100   200
      -135  200     90   50    90   200
       -90  200     80   90    80   200
       -45  200     90   50    90   200
         0  200    100   10   100   200
        45  200     90   50    90   200
        90  200     80   90    80   200
       135  200     90   50    90   200
       180  200    100   10   100   200
   end_inline_table
end_optical_signature
```

- **演示要点**：演示 optical_signature 的参数：inline_table

### optical_signature · WSF_COMPOSITE_OPTICAL_SIGNATURE｜光学特征

- **关键词**：optical_signature, WSF_COMPOSITE_OPTICAL_SIGNATURE, state, 光学特征
- **出处**：`signature_demos/signatures/rocket_optical_signature.txt:12-69`
- **片段**：

```text
optical_signature ROCKET_OPTICAL_SIG WSF_COMPOSITE_OPTICAL_SIGNATURE

   # We are figuring the base structure at about 11 m long (1 m cone, 10 m body)
   #debug

   # Stage 1, 2 and RV
   state default
      surface cone
         length 1 m
         radius 0.7 m
         temperature adiabatic_wall
      end_surface

      # Length includes stages 1 and 2.
      surface cylinder
         length 10.0 m        # Just a guess
         radius 0.7 m
         temperature adiabatic_wall
      end_surface

      # This will eventually automatically attaches to the previous object...
      surface plume
         temperature 2000 K
         length 50 m          # About 5x total
         radius 1 m
      end_surface

   # Stage 2 and RV
   state STAGE_2_RV
       surface cone
         length 1 m
         radius 0.7 m
         temperature adiabatic_wall
      end_surface

      # Shorten the body to reflect only the upper stage
      surface cylinder
         length 4.0 m        # Just a guess
         radius 0.7 m
         temperature adiabatic_wall
      end_surface

      # This will eventually automatically attaches to the previous object...
      surface plume
         temperature 2000 K
         length 50 m         # About 5x total
         radius 1 m
      end_surface

   # RV only
   state RV_ONLY
      surface cone
         length 1 m
         radius 0.7 m
         temperature adiabatic_wall
      end_surface

end_optical_signature
```

- **演示要点**：演示 WSF_COMPOSITE_OPTICAL_SIGNATURE 的参数：state

### optical_signature（fighter_multiresolution_signature）｜光学特征

- **关键词**：optical_signature, 光学特征
- **出处**：`multiresolution_demos/signatures/fighter_multiresolution_signature.txt:19-20`　（同签名共 3 处，另见 `multiresolution_demos/signatures/fighter_multiresolution_signature.txt:24`、`multiresolution_demos/signatures/fighter_multiresolution_signature.txt:29`）
- **片段**：

```text
      optical_signature FIGHTER_SPHERICAL_OPTICAL_SIG
      end_optical_signature
```

- **演示要点**：演示 optical_signature（最小结构，无子参数）

### radar_signature（small_bistatic_radar_signature）｜雷达特征

- **关键词**：radar_signature, constant, bistatic_signature, azimuth, 雷达特征
- **出处**：`base_types/signatures/small_bistatic_radar_signature.txt:9-23`　（同签名共 2 处，另见 `base_types/signatures/small_radar_signature.txt:9`）
- **片段**：

```text
radar_signature SMALL_RADAR_SIGNATURE
  constant .0001 m^2
  bistatic_signature
    azimuth -180 deg
      elevation -90 deg
        constant 0.0001 m^2
      elevation 90 deg
        constant 0.0001 m^2
    azimuth 180 deg
      elevation -90 deg
        constant 0.0001 m^2
      elevation 90 deg
        constant 0.0001 m^2
  end_bistatic_signature
end_radar_signature
```

- **演示要点**：演示 radar_signature 的参数：constant, bistatic_signature, azimuth

### radar_signature（ucav_radar_sig）｜雷达特征

- **关键词**：radar_signature, interpolate_tables, interpolation_type, state, 雷达特征
- **出处**：`iads/signatures/ucav_radar_sig.txt:16-43`
- **片段**：

```text
radar_signature UCAV_RADAR_SIG
   interpolate_tables $<INTERPOLATE_TABLES:true>$
   interpolation_type $<INTERPOLATION_TYPE:linear>$
   state default
      inline_table dbsm 20 2
                -90.0  90.0
        -180.0    0.0   0.0
        -137.5    0.0   0.0
        -135.0   20.0  20.0
        -132.5    0.0   0.0
         -92.5    0.0   0.0
         -90.0   20.0  20.0
         -87.5    0.0   0.0
         -47.5    0.0   0.0
         -45.0   20.0  20.0
         -42.5    0.0   0.0
          42.5    0.0   0.0
          45.0   20.0  20.0
          47.5    0.0   0.0
          87.5    0.0   0.0
          90.0   20.0  20.0
          92.5    0.0   0.0
         132.5    0.0   0.0
         135.0   20.0  20.0
         137.5    0.0   0.0
         180.0    0.0   0.0
      end_inline_table
end_radar_signature
```

- **演示要点**：演示 radar_signature 的参数：interpolate_tables, interpolation_type, state

### radar_signature（bistatic_demo）｜雷达特征

- **关键词**：radar_signature, use_bisector_for_bistatic, constant, 雷达特征
- **出处**：`sensor_demos/bistatic_demo.txt:16-19`　（同签名共 10 处，另见 `sensor_demos/bistatic_sp_false_target_jamming_demo.txt:48`、`sensor_demos/bistatic_sp_noise_jamming_demo.txt:31`、`sensor_demos/bistatic_support_false_target_jamming_demo.txt:48`）
- **片段**：

```text
radar_signature RADAR_SIGNATURE
  use_bisector_for_bistatic true
  constant 5 m^2
end_radar_signature
```

- **演示要点**：演示 radar_signature 的参数：use_bisector_for_bistatic, constant

### radar_signature（salram_radar_signature）｜雷达特征

- **关键词**：radar_signature, state, polarization, 雷达特征
- **出处**：`base_types/signatures/salram_radar_signature.txt:9-13`
- **片段**：

```text
radar_signature salram_radar_signature
  state default
    polarization default
        salram_file salram/newman.psam units dbsm
end_radar_signature
```

- **演示要点**：演示 radar_signature 的参数：state, polarization

### radar_signature（_common）｜雷达特征

- **关键词**：radar_signature, constant, 雷达特征
- **出处**：`air_to_air/_common.txt:25-27`　（同签名共 282 处，另见 `air_to_air/scenarios/escort.txt:33`、`air_to_air/scenarios/escort.txt:335`、`air_to_air/weapons/aam/medium_range_radar_missile.txt:28`）
- **片段**：

```text
radar_signature 0dB_FuzzBall
   constant 0 dbsm
end_radar_signature
```

- **演示要点**：演示 radar_signature 的参数：constant

### radar_signature（example_radar_sig）｜雷达特征

- **关键词**：radar_signature, plt_file, 雷达特征
- **出处**：`base_types/signatures/plt/example_radar_sig.txt:16-18`
- **片段**：

```text
radar_signature EXAMPLE_RADAR_SIG
   plt_file plt_radar_sig.txt default horizontal
end_radar_signature
```

- **演示要点**：演示 radar_signature 的参数：plt_file

### radar_signature · WSF_RADAR_SIGNATURE｜雷达特征

- **关键词**：radar_signature, WSF_RADAR_SIGNATURE, constant, 雷达特征
- **出处**：`cyber/exfiltrate_demo/MITM_exfiltrate_demo.txt:17-19`　（同签名共 2209 处，另见 `satellite_demos/satellites/satcat/satcat.txt:10`、`satellite_demos/satellites/satcat/satcat.txt:24`、`satellite_demos/satellites/satcat/satcat.txt:38`）
- **片段**：

```text
radar_signature basic_plane WSF_RADAR_SIGNATURE 
   constant 10 m^2
end_radar_signature
```

- **演示要点**：演示 WSF_RADAR_SIGNATURE 的参数：constant

### radar_signature（ucav_radar_sig_10db_down）｜雷达特征

- **关键词**：radar_signature, state, 雷达特征
- **出处**：`iads/signatures/ucav_radar_sig_10db_down.txt:17-42`　（同签名共 6 处，另见 `iads/signatures/ucav_radar_sig_20db_down.txt:17`、`iads_c2_demos/signatures/ucav_radar_sig.txt:16`、`multiresolution_demos/signatures/radar_signatures.txt:17`）
- **片段**：

```text
radar_signature UCAV_RADAR_SIG
   state default
      inline_table dbsm 20 2
                 -90.0  90.0
         -180.0  -10.0 -10.0
         -137.5  -10.0 -10.0
         -135.0   10.0  10.0
         -132.5  -10.0 -10.0
          -92.5  -10.0 -10.0
          -90.0   10.0  10.0
          -87.5  -10.0 -10.0
          -47.5  -10.0 -10.0
          -45.0   10.0  10.0
          -42.5  -10.0 -10.0
           42.5  -10.0 -10.0
           45.0   10.0  10.0
           47.5  -10.0 -10.0
           87.5  -10.0 -10.0
           90.0   10.0  10.0
           92.5  -10.0 -10.0
          132.5  -10.0 -10.0
          135.0   10.0  10.0
          137.5  -10.0 -10.0
          180.0  -10.0 -10.0
      end_inline_table
end_radar_signature
```

- **演示要点**：演示 radar_signature 的参数：state

### radar_signature（radar_signatures）｜雷达特征

- **关键词**：radar_signature, 雷达特征
- **出处**：`multiresolution_demos/signatures/radar_signatures.txt:47-48`　（同签名共 2 处，另见 `multiresolution_demos/signatures/radar_signatures.txt:52`）
- **片段**：

```text
      radar_signature CONSTANT_RADAR_SIGNATURE
      end_radar_signature
```

- **演示要点**：演示 radar_signature（最小结构，无子参数）

### radar_signature · WSF_RADAR_SIGNATURE｜雷达特征

- **关键词**：radar_signature, WSF_RADAR_SIGNATURE, 雷达特征
- **出处**：`air_to_air/platforms/dca.txt:28-30`　（同签名共 5 处，另见 `air_to_air/platforms/escort.txt:28`、`air_to_air/platforms/hvaa.txt:31`、`air_to_air/platforms/lte_fighter.txt:29`）
- **片段**：

```text
radar_signature 10dB_FuzzBall WSF_RADAR_SIGNATURE 
constant 10 dBsm
end_radar_signature
```

- **演示要点**：演示 WSF_RADAR_SIGNATURE（最小结构，无子参数）
