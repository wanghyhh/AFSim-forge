# 数据表与变量

> **来源**：AFSIM 2.9.0 官方 demo 集（`demos/`，4,751 个 `.txt`，132 万行）
> **性质**：原文摘抄，未改写。同一「参数签名」只保留 1 条代表，并注明出现次数与另见位置
> **警示**：片段中数值为 demo 原值，**仅供语法参考，不得直接复用**；依赖 `common/` 数据表的片段须另行提供
> **检索**：按命令 / 类型名 / 参数名搜本卷；总表见 `90-tokens.md`

### alpha_max_mach_table（autopilot_support_tables）｜

- **关键词**：alpha_max_mach_table
- **出处**：`p6dof/p6dof_types/misc/srb-rato/controls/autopilot_support_tables.txt:32-36`　（同签名共 31 处，另见 `p6dof/p6dof_types/aircraft/b-fw/controls/autopilot_support_tables.txt:44`、`six_dof/six_dof_types/aircraft/b-fw/controls/autopilot_support_tables.txt:44`、`p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_support_tables.txt:70`）
- **片段**：

```text
   alpha_max_mach_table
      0.000    26.010
      1.000    26.010
      50.000   26.010
   end_alpha_max_mach_table
```

- **演示要点**：演示 alpha_max_mach_table（最小结构，无子参数）

### alpha_min_mach_table（autopilot_support_tables）｜

- **关键词**：alpha_min_mach_table
- **出处**：`p6dof/p6dof_types/misc/srb-rato/controls/autopilot_support_tables.txt:38-42`　（同签名共 31 处，另见 `p6dof/p6dof_types/aircraft/b-fw/controls/autopilot_support_tables.txt:60`、`six_dof/six_dof_types/aircraft/b-fw/controls/autopilot_support_tables.txt:60`、`p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_support_tables.txt:99`）
- **片段**：

```text
   alpha_min_mach_table
      0.000   -26.010
      1.000   -26.010
      50.000  -26.010
   end_alpha_min_mach_table
```

- **演示要点**：演示 alpha_min_mach_table（最小结构，无子参数）

### alpha_stabilizing_frequency_mach_table（aero_pm6）｜

- **关键词**：alpha_stabilizing_frequency_mach_table, file
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/aero/aero_pm6.txt:42-44`　（同签名共 9 处，另见 `six_dof/six_dof_types/misc/srb-rato/aero/aero_pm6.txt:56`、`six_dof/six_dof_types/misc/tnk-f16-370g/aero/aero_pm6.txt:56`、`six_dof/six_dof_types/spacecraft/orbiter-booster/aero/aero_pm6.txt:74`）
- **片段**：

```text
   alpha_stabilizing_frequency_mach_table
      file data/pitch_frequency_mach_table.txt
   end_alpha_stabilizing_frequency_mach_table
```

- **演示要点**：演示 alpha_stabilizing_frequency_mach_table 的参数：file

### alpha_versus_mach_cl_table（autopilot_support_tables）｜

- **关键词**：alpha_versus_mach_cl_table, irregular_table, independent_variable, dependent_variable, mach
- **出处**：`p6dof/p6dof_types/misc/srb-rato/controls/autopilot_support_tables.txt:44-59`
- **片段**：

```text
   alpha_versus_mach_cl_table
      irregular_table
      independent_variable mach precision float
      independent_variable cl precision float
      dependent_variable precision float
      mach   0.00
         cl     -0.9340  0.000  0.9340
         values -26.010  0.000  26.010
      mach   1.00
         cl     -0.9340  0.000  0.9340
         values -26.010  0.000  26.010
      mach  50.00
         cl     -0.9340  0.000  0.9340
         values -26.010  0.000  26.010
      end_irregular_table
   end_alpha_versus_mach_cl_table
```

- **演示要点**：演示 alpha_versus_mach_cl_table 的参数：irregular_table, independent_variable, dependent_variable, mach

### alpha_versus_mach_cl_table（autopilot_support_tables）｜

- **关键词**：alpha_versus_mach_cl_table, irregular_table
- **出处**：`p6dof/p6dof_types/aircraft/b-fw/controls/autopilot_support_tables.txt:76-121`　（同签名共 30 处，另见 `six_dof/six_dof_types/aircraft/b-fw/controls/autopilot_support_tables.txt:76`、`p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_support_tables.txt:128`、`p6dof/p6dof_types/aircraft/b-hvy/controls/autopilot_support_tables.txt:128`）
- **片段**：

```text
   alpha_versus_mach_cl_table
      irregular_table
         independent_variable mach precision float
         independent_variable cl precision float
         dependent_variable precision float
         mach   0.30
            cl             -1.890     -1.700     -1.600     -1.500     -1.400     -1.300     -1.200     -1.100     -1.000     -0.900     -0.800     -0.700     -0.600     -0.500     -0.400     -0.300     -0.200     -0.100      0.000      0.100      0.200      0.300      0.400      0.500      0.600      0.700      0.800      0.900      1.000      1.100      1.200      1.300      1.400      1.500      1.600      1.700      1.890
            values        -20.000    -16.526    -15.084    -13.697    -12.327    -10.962     -9.620     -8.330     -7.158     -6.027     -5.235     -4.545     -3.895     -3.247     -2.599     -1.950     -1.300     -0.650      0.000      0.650      1.300      1.950      2.599      3.247      3.895      4.545      5.235      6.027      7.158      8.330      9.620     10.962     12.327     13.697     15.084     16.526     20.000
         mach   0.60
            cl             -1.890     -1.700     -1.600     -1.500     -1.400     -1.300     -1.200     -1.100     -1.000     -0.900     -0.800     -0.700     -0.600     -0.500     -0.400     -0.300     -0.200     -0.100      0.000      0.100      0.200      0.300      0.400      0.500      0.600      0.700      0.800      0.900      1.000      1.100      1.200      1.300      1.400      1.500      1.600      1.700      1.890
            values        -20.000    -16.526    -15.084    -13.697    -12.327    -10.962     -9.620     -8.330     -7.158     -6.027     -5.235     -4.545     -3.895     -3.247     -2.599     -1.950     -1.300     -0.650      0.000      0.650      1.300      1.950      2.599      3.247      3.895      4.545      5.235      6.027      7.158      8.330      9.620     10.962     12.327     13.697     15.084     16.526     20.000
         mach   0.70
            cl             -1.890     -1.700     -1.600     -1.500     -1.400     -1.300     -1.200     -1.100     -1.000     -0.900     -0.800     -0.700     -0.600     -0.500     -0.400     -0.300     -0.200     -0.100      0.000      0.100      0.200      0.300      0.400      0.500      0.600      0.700      0.800      0.900      1.000      1.100      1.200      1.300      1.400      1.500      1.600      1.700      1.890
            values        -20.000    -16.526    -15.084    -13.697    -12.327    -10.962     -9.620     -8.330     -7.158     -6.027     -5.235     -4.545     -3.895     -3.247     -2.599     -1.950     -1.300     -0.650      0.000      0.650      1.300      1.950      2.599      3.247      3.895      4.545      5.235      6.027      7.158      8.330      9.620     10.962     12.327     13.697     15.084     16.526     20.000
         mach   0.75
            cl             -1.890     -1.700     -1.600     -1.500     -1.400     -1.300     -1.200     -1.100     -1.000     -0.900     -0.800     -0.700     -0.600     -0.500     -0.400     -0.300     -0.200     -0.100      0.000      0.100      0.200      0.300      0.400      0.500      0.600      0.700      0.800      0.900      1.000      1.100      1.200      1.300      1.400      1.500      1.600      1.700      1.890
            values        -20.000    -16.526    -15.084    -13.697    -12.327    -10.962     -9.620     -8.330     -7.158     -6.027     -5.235     -4.545     -3.895     -3.247     -2.599     -1.950     -1.300     -0.650      0.000      0.650      1.300      1.950      2.599      3.247      3.895      4.545      5.235      6.027      7.158      8.330      9.620     10.962     12.327     13.697     15.084     16.526     20.000
         mach   0.80
            cl             -1.890     -1.700     -1.600     -1.500     -1.400     -1.300     -1.200     -1.100     -1.000     -0.900     -0.800     -0.700     -0.600     -0.500     -0.400     -0.300     -0.200     -0.100      0.000      0.100      0.200      0.300      0.400      0.500      0.600      0.700      0.800      0.900      1.000      1.100      1.200      1.300      1.400      1.500      1.600      1.700      1.890
            values        -20.000    -16.526    -15.084    -13.697    -12.327    -10.962     -9.620     -8.330     -7.158     -6.027     -5.235     -4.545     -3.895     -3.247     -2.599     -1.950     -1.300     -0.650      0.000      0.650      1.300      1.950      2.599      3.247      3.895      4.545      5.235      6.027      7.158      8.330      9.620     10.962     12.327     13.697     15.084     16.526     20.000
         mach   0.82
            cl             -1.890     -1.700     -1.600     -1.500     -1.400     -1.300     -1.200     -1.100     -1.000     -0.900     -0.800     -0.700     -0.600     -0.500     -0.400     -0.300     -0.200     -0.100      0.000      0.100      0.200      0.300      0.400      0.500      0.600      0.700      0.800      0.900      1.000      1.100      1.200      1.300      1.400      1.500      1.600      1.700      1.890
            values        -20.000    -16.526    -15.084    -13.697    -12.327    -10.962     -9.620     -8.330     -7.158     -6.027     -5.235     -4.545     -3.895     -3.247     -2.599     -1.950     -1.300     -0.650      0.000      0.650      1.300      1.950      2.599      3.247      3.895      4.545      5.235      6.027      7.158      8.330      9.620     10.962     12.327     13.697     15.084     16.526     20.000
         mach   0.85
            cl             -1.890     -1.700     -1.600     -1.500     -1.400     -1.300     -1.200     -1.100     -1.000     -0.900     -0.800     -0.700     -0.600     -0.500     -0.400     -0.300     -0.200     -0.100      0.000      0.100      0.200      0.300      0.400      0.500      0.600      0.700      0.800      0.900      1.000      1.100      1.200      1.300      1.400      1.500      1.600      1.700      1.890
            values        -20.000    -16.526    -15.084    -13.697    -12.327    -10.962     -9.620     -8.330     -7.158     -6.027     -5.235     -4.545     -3.895     -3.247     -2.599     -1.950     -1.300     -0.650      0.000      0.650      1.300      1.950      2.599      3.247      3.895      4.545      5.235      6.027      7.158      8.330      9.620     10.962     12.327     13.697     15.084     16.526     20.000
         mach   0.87
            cl             -1.890     -1.700     -1.600     -1.500     -1.400     -1.300     -1.200     -1.100     -1.000     -0.900     -0.800     -0.700     -0.600     -0.500     -0.400     -0.300     -0.200     -0.100      0.000      0.100      0.200      0.300      0.400      0.500      0.600      0.700      0.800      0.900      1.000      1.100      1.200      1.300      1.400      1.500      1.600      1.700      1.890
            values        -20.000    -16.526    -15.084    -13.697    -12.327    -10.962     -9.620     -8.330     -7.158     -6.027     -5.235     -4.545     -3.895     -3.247     -2.599     -1.950     -1.300     -0.650      0.000      0.650      1.300      1.950      2.599      3.247      3.895      4.545      5.235      6.027      7.158      8.330      9.620     10.962     12.327     13.697     15.084     16.526     20.000
         mach   0.90
            cl             -1.890     -1.700     -1.600     -1.500     -1.400     -1.300     -1.200     -1.100     -1.000     -0.900     -0.800     -0.700     -0.600     -0.500     -0.400     -0.300     -0.200     -0.100      0.000      0.100      0.200      0.300      0.400      0.500      0.600      0.700      0.800      0.900      1.000      1.100      1.200      1.300      1.400      1.500      1.600      1.700      1.890
            values        -20.000    -16.526    -15.084    -13.697    -12.327    -10.962     -9.620     -8.330     -7.158     -6.027     -5.235     -4.545     -3.895     -3.247     -2.599     -1.950     -1.300     -0.650      0.000      0.650      1.300      1.950      2.599      3.247      3.895      4.545      5.235      6.027      7.158      8.330      9.620     10.962     12.327     13.697     15.084     16.526     20.000
         mach   0.93
            cl             -1.890     -1.700     -1.600     -1.500     -1.400     -1.300     -1.200     -1.100     -1.000     -0.900     -0.800     -0.700     -0.600     -0.500     -0.400     -0.300     -0.200     -0.100      0.000      0.100      0.200      0.300      0.400      0.500      0.600      0.700      0.800      0.900      1.000      1.100      1.200      1.300      1.400      1.500      1.600      1.700      1.890
            values        -20.000    -16.526    -15.084    -13.697    -12.327    -10.962     -9.620     -8.330     -7.158     -6.027     -5.235     -4.545     -3.895     -3.247     -2.599     -1.950     -1.300     -0.650      0.000      0.650      1.300      1.950      2.599      3.247      3.895      4.545      5.235      6.027      7.158      8.330      9.620     10.962     12.327     13.697     15.084     16.526     20.000
         mach   0.95
            cl             -1.890     -1.700     -1.600     -1.500     -1.400     -1.300     -1.200     -1.100     -1.000     -0.900     -0.800     -0.700     -0.600     -0.500     -0.400     -0.300     -0.200     -0.100      0.000      0.100      0.200      0.300      0.400      0.500      0.600      0.700      0.800      0.900      1.000      1.100      1.200      1.300      1.400      1.500      1.600      1.700      1.890
            values        -20.000    -16.526    -15.084    -13.697    -12.327    -10.962     -9.620     -8.330     -7.158     -6.027     -5.235     -4.545     -3.895     -3.247     -2.599     -1.950     -1.300     -0.650      0.000      0.650      1.300      1.950      2.599      3.247      3.895      4.545      5.235      6.027      7.158      8.330      9.620     10.962     12.327     13.697     15.084     16.526     20.000
         mach   0.97
            cl             -1.890     -1.700     -1.600     -1.500     -1.400     -1.300     -1.200     -1.100     -1.000     -0.900     -0.800     -0.700     -0.600     -0.500     -0.400     -0.300     -0.200     -0.100      0.000      0.100      0.200      0.300      0.400      0.500      0.600      0.700      0.800      0.900      1.000      1.100      1.200      1.300      1.400      1.500      1.600      1.700      1.890
            values        -20.000    -16.526    -15.084    -13.697    -12.327    -10.962     -9.620     -8.330     -7.158     -6.027     -5.235     -4.545     -3.895     -3.247     -2.599     -1.950     -1.300     -0.650      0.000      0.650      1.300      1.950      2.599      3.247      3.895      4.545      5.235      6.027      7.158      8.330      9.620     10.962     12.327     13.697     15.084     16.526     20.000
         mach   1.00
            cl             -1.890     -1.700     -1.600     -1.500     -1.400     -1.300     -1.200     -1.100     -1.000     -0.900     -0.800     -0.700     -0.600     -0.500     -0.400     -0.300     -0.200     -0.100      0.000      0.100      0.200      0.300      0.400      0.500      0.600      0.700      0.800      0.900      1.000      1.100      1.200      1.300      1.400      1.500      1.600      1.700      1.890
            values        -20.000    -16.526    -15.084    -13.697    -12.327    -10.962     -9.620     -8.330     -7.158     -6.027     -5.235     -4.545     -3.895     -3.247     -2.599     -1.950     -1.300     -0.650      0.000      0.650      1.300      1.950      2.599      3.247      3.895      4.545      5.235      6.027      7.158      8.330      9.620     10.962     12.327     13.697     15.084     16.526     20.000
      end_irregular_table
   end_alpha_versus_mach_cl_table
```

- **演示要点**：演示 alpha_versus_mach_cl_table 的参数：irregular_table

### angle_mapping_table（flight_controls）｜

- **关键词**：angle_mapping_table
- **出处**：`p6dof/p6dof_types/aircraft/fa-hvy/controls/flight_controls.txt:414-417`　（同签名共 180 处，另见 `p6dof/p6dof_types/aircraft/fa-lgt/controls/flight_controls.txt:380`、`p6dof/p6dof_types/aircraft/fa-lgt/controls/flight_controls.txt:403`、`p6dof/p6dof_types/aircraft/fa-lgt/controls/flight_controls.txt:426`）
- **片段**：

```text
   angle_mapping_table
       0.000     0.0
       1.000    40.0
   end_angle_mapping_table
```

- **演示要点**：演示 angle_mapping_table（最小结构，无子参数）

### angle_of_attack_table（px_fighter）｜

- **关键词**：angle_of_attack_table, altitude
- **出处**：`sensor_plot/eoir/px_fighter.txt:22-25`　（同签名共 6 处，另见 `sensor_plot/sar/ag_bomber.txt:21`、`sensor_plot/sar/ip_bomber.txt:21`、`sensor_plot/sar/px_fighter.txt:22`）
- **片段**：

```text
      angle_of_attack_table
         altitude 0 m
            speed    0 kts angle 3 deg           # <--- Spreadsheet value: Pitch angle
      end_angle_of_attack_table
```

- **演示要点**：演示 angle_of_attack_table 的参数：altitude

### beta_stabilizing_frequency_mach_table（aero_pm6）｜

- **关键词**：beta_stabilizing_frequency_mach_table, file
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/aero/aero_pm6.txt:46-48`　（同签名共 9 处，另见 `six_dof/six_dof_types/misc/srb-rato/aero/aero_pm6.txt:62`、`six_dof/six_dof_types/misc/tnk-f16-370g/aero/aero_pm6.txt:62`、`six_dof/six_dof_types/spacecraft/orbiter-booster/aero/aero_pm6.txt:80`）
- **片段**：

```text
   beta_stabilizing_frequency_mach_table
      file data/yaw_frequency_mach_table.txt
   end_beta_stabilizing_frequency_mach_table
```

- **演示要点**：演示 beta_stabilizing_frequency_mach_table 的参数：file

### cd_alpha_beta_mach_table（aero_pm6）｜

- **关键词**：cd_alpha_beta_mach_table, file
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/aero/aero_pm6.txt:18-20`　（同签名共 54 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:58`、`p6dof/p6dof_types/aircraft/b-fw/aero/aero.txt:58`、`p6dof/p6dof_types/aircraft/b-hvy/aero/aero.txt:58`）
- **片段**：

```text
   cd_alpha_beta_mach_table
      file data/cd_alpha_beta_mach_table.txt
   end_cd_alpha_beta_mach_table
```

- **演示要点**：演示 cd_alpha_beta_mach_table 的参数：file

### cd_alpha_mach_table（ICBM_BalloonAero）｜

- **关键词**：cd_alpha_mach_table, irregular_table
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/ICBM_BalloonAero.txt:22-34`　（同签名共 25 处，另见 `p6dof/p6dof_types/weapons/simple-icbm/ICBM_BalloonAero.txt:45`、`p6dof/p6dof_types/weapons/simple-icbm/ICBM_FullAero.txt:22`、`p6dof/p6dof_types/weapons/simple-icbm/ICBM_FullAero.txt:71`）
- **片段**：

```text
   cd_alpha_mach_table
      irregular_table
         independent_variable mach precision float
         independent_variable alpha units deg
         dependent_variable precision float
         mach  0.000
            alpha     -90.0   0.0    90.0
            values    0       0      0
         mach  30.000
            alpha     -90.0   0.0    90.0
            values    0       0      0
      end_irregular_table
   end_cd_alpha_mach_table
```

- **演示要点**：演示 cd_alpha_mach_table 的参数：irregular_table

### cd_angle_mach_table（aero）｜

- **关键词**：cd_angle_mach_table, file
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:305-307`　（同签名共 138 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:356`、`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:407`、`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:458`）
- **片段**：

```text
   cd_angle_mach_table
      file data/Drageron_Right_Top/cd_angle_mach_table.txt
   end_cd_angle_mach_table
```

- **演示要点**：演示 cd_angle_mach_table 的参数：file

### cd_beta_mach_table（refAero）｜

- **关键词**：cd_beta_mach_table, irregular_table
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/refAero.txt:66-78`
- **片段**：

```text
   cd_beta_mach_table
      irregular_table
         independent_variable mach precision float
         independent_variable beta units deg
         dependent_variable precision float
         mach  0.000
            alpha     -90.0   0.0    90.0
            values    0.0     0.0    0.0
         mach  30.000
            alpha     -90.0   0.0    90.0
            values    0.0     0.0    0.0
      end_irregular_table
   end_cd_beta_mach_table
```

- **演示要点**：演示 cd_beta_mach_table 的参数：irregular_table

### cl_alpha_beta_mach_table（aero）｜

- **关键词**：cl_alpha_beta_mach_table, file
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:196-198`　（同签名共 34 处，另见 `p6dof/p6dof_types/aircraft/b-fw/aero/aero.txt:154`、`p6dof/p6dof_types/aircraft/b-hvy/aero/aero.txt:196`、`p6dof/p6dof_types/aircraft/c-hvy/aero/aero.txt:250`）
- **片段**：

```text
   cl_alpha_beta_mach_table
      file data/cl_alpha_beta_mach_table.txt
   end_cl_alpha_beta_mach_table
```

- **演示要点**：演示 cl_alpha_beta_mach_table 的参数：file

### cl_alphadot_mach_table（aero）｜

- **关键词**：cl_alphadot_mach_table
- **出处**：`p6dof/p6dof_types/aircraft/b-fw/aero/aero.txt:170-176`　（同签名共 34 处，另见 `six_dof/six_dof_types/aircraft/b-fw/aero/aero_rb6.txt:170`、`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:219`、`p6dof/p6dof_types/aircraft/b-hvy/aero/aero.txt:219`）
- **片段**：

```text
   cl_alphadot_mach_table
        0.1000         0.000000000000000
        0.5000         0.000000000000000
        0.7000         0.000000000000000
        0.7500         0.000000000000000
        0.8000         0.000000000000000
   end_cl_alphadot_mach_table
```

- **演示要点**：演示 cl_alphadot_mach_table（最小结构，无子参数）

### cl_angle_alpha_beta_table（aero）｜

- **关键词**：cl_angle_alpha_beta_table, file
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:329-331`　（同签名共 138 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:380`、`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:431`、`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:482`）
- **片段**：

```text
   cl_angle_alpha_beta_table
      file data/Drageron_Right_Top/cl_angle_alpha_beta_table.txt
   end_cl_angle_alpha_beta_table
```

- **演示要点**：演示 cl_angle_alpha_beta_table 的参数：file

### cl_beta_mach_table（refAero）｜

- **关键词**：cl_beta_mach_table, irregular_table
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/refAero.txt:108-120`
- **片段**：

```text
   cl_beta_mach_table
      irregular_table
         independent_variable mach precision float
         independent_variable beta units deg
         dependent_variable precision float
         mach  0.000
            alpha     -90.0   0.0    90.0
            values    0.0     0.0    0.0
         mach  30.000
            alpha     -90.0   0.0    90.0
            values    0.0     0.0    0.0
      end_irregular_table
   end_cl_beta_mach_table
```

- **演示要点**：演示 cl_beta_mach_table 的参数：irregular_table

### cl_betadot_mach_table（aero）｜

- **关键词**：cl_betadot_mach_table
- **出处**：`p6dof/p6dof_types/aircraft/b-fw/aero/aero.txt:190-196`　（同签名共 34 处，另见 `six_dof/six_dof_types/aircraft/b-fw/aero/aero_rb6.txt:190`、`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:253`、`p6dof/p6dof_types/aircraft/b-hvy/aero/aero.txt:253`）
- **片段**：

```text
   cl_betadot_mach_table
        0.1000        -0.000006689945147
        0.5000        -0.000006953355327
        0.7000        -0.000006960404240
        0.7500        -0.000006961815203
        0.8000        -0.000006963190118
   end_cl_betadot_mach_table
```

- **演示要点**：演示 cl_betadot_mach_table（最小结构，无子参数）

### cl_max_mach_table（autopilot_support_tables）｜

- **关键词**：cl_max_mach_table
- **出处**：`p6dof/p6dof_types/misc/srb-rato/controls/autopilot_support_tables.txt:20-24`　（同签名共 31 处，另见 `p6dof/p6dof_types/aircraft/b-fw/controls/autopilot_support_tables.txt:12`、`six_dof/six_dof_types/aircraft/b-fw/controls/autopilot_support_tables.txt:12`、`p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_support_tables.txt:12`）
- **片段**：

```text
   cl_max_mach_table
      0.000    0.934
      1.000    0.931
      50.000   0.909
   end_cl_max_mach_table
```

- **演示要点**：演示 cl_max_mach_table（最小结构，无子参数）

### cl_min_mach_table（autopilot_support_tables）｜

- **关键词**：cl_min_mach_table
- **出处**：`p6dof/p6dof_types/misc/srb-rato/controls/autopilot_support_tables.txt:26-30`　（同签名共 31 处，另见 `p6dof/p6dof_types/aircraft/b-fw/controls/autopilot_support_tables.txt:28`、`six_dof/six_dof_types/aircraft/b-fw/controls/autopilot_support_tables.txt:28`、`p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_support_tables.txt:41`）
- **片段**：

```text
   cl_min_mach_table
      0.000   -0.934
      1.000   -0.931
      50.000  -0.909
   end_cl_min_mach_table
```

- **演示要点**：演示 cl_min_mach_table（最小结构，无子参数）

### clp_angle_mach_table（aero）｜

- **关键词**：clp_angle_mach_table, file
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:333-335`　（同签名共 132 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:384`、`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:435`、`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:486`）
- **片段**：

```text
   clp_angle_mach_table
      file data/Drageron_Right_Top/clp_angle_mach_table.txt
   end_clp_angle_mach_table
```

- **演示要点**：演示 clp_angle_mach_table 的参数：file

### clp_mach_table（aero）｜

- **关键词**：clp_mach_table
- **出处**：`p6dof/p6dof_types/aircraft/b-fw/aero/aero.txt:160-166`　（同签名共 34 处，另见 `six_dof/six_dof_types/aircraft/b-fw/aero/aero_rb6.txt:160`、`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:202`、`p6dof/p6dof_types/aircraft/b-hvy/aero/aero.txt:202`）
- **片段**：

```text
   clp_mach_table
        0.1000        -0.681544901600898
        0.5000        -0.681358096031866
        0.7000        -0.681324179882883
        0.7500        -0.681317424606177
        0.8000        -0.681311165459603
   end_clp_mach_table
```

- **演示要点**：演示 clp_mach_table（最小结构，无子参数）

### clq_angle_mach_table（aero）｜

- **关键词**：clq_angle_mach_table, file
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:337-339`　（同签名共 132 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:388`、`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:439`、`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:490`）
- **片段**：

```text
   clq_angle_mach_table
      file data/Drageron_Right_Top/clq_angle_mach_table.txt
   end_clq_angle_mach_table
```

- **演示要点**：演示 clq_angle_mach_table 的参数：file

### clq_mach_table（aero）｜

- **关键词**：clq_mach_table
- **出处**：`p6dof/p6dof_types/aircraft/b-fw/aero/aero.txt:200-206`　（同签名共 34 处，另见 `six_dof/six_dof_types/aircraft/b-fw/aero/aero_rb6.txt:200`、`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:270`、`p6dof/p6dof_types/aircraft/b-hvy/aero/aero.txt:270`）
- **片段**：

```text
   clq_mach_table
        0.1000         0.000000000000000
        0.5000         0.000000000000000
        0.7000         0.000000000000000
        0.7500         0.000000000000000
        0.8000         0.000000000000000
   end_clq_mach_table
```

- **演示要点**：演示 clq_mach_table（最小结构，无子参数）

### clr_angle_mach_table（aero）｜

- **关键词**：clr_angle_mach_table, file
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:341-343`　（同签名共 132 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:392`、`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:443`、`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:494`）
- **片段**：

```text
   clr_angle_mach_table
      file data/Drageron_Right_Top/clr_angle_mach_table.txt
   end_clr_angle_mach_table
```

- **演示要点**：演示 clr_angle_mach_table 的参数：file

### clr_mach_table（aero）｜

- **关键词**：clr_mach_table
- **出处**：`p6dof/p6dof_types/aircraft/b-fw/aero/aero.txt:180-186`　（同签名共 34 处，另见 `six_dof/six_dof_types/aircraft/b-fw/aero/aero_rb6.txt:180`、`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:236`、`p6dof/p6dof_types/aircraft/b-hvy/aero/aero.txt:236`）
- **片段**：

```text
   clr_mach_table
        0.1000         0.000006689945147
        0.5000         0.000006953355327
        0.7000         0.000006960404240
        0.7500         0.000006961815203
        0.8000         0.000006963190118
   end_clr_mach_table
```

- **演示要点**：演示 clr_mach_table（最小结构，无子参数）

### cm_alpha_beta_mach_table（aero）｜

- **关键词**：cm_alpha_beta_mach_table, file
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:82-84`　（同签名共 34 处，另见 `p6dof/p6dof_types/aircraft/b-fw/aero/aero.txt:82`、`p6dof/p6dof_types/aircraft/b-hvy/aero/aero.txt:82`、`p6dof/p6dof_types/aircraft/c-hvy/aero/aero.txt:82`）
- **片段**：

```text
   cm_alpha_beta_mach_table
      file data/cm_alpha_beta_mach_table.txt
   end_cm_alpha_beta_mach_table
```

- **演示要点**：演示 cm_alpha_beta_mach_table 的参数：file

### cm_alpha_mach_table（ICBM_FullAero）｜

- **关键词**：cm_alpha_mach_table, irregular_table
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/ICBM_FullAero.txt:36-48`　（同签名共 4 处，另见 `p6dof/p6dof_types/weapons/simple-icbm/ICBM_FullAero.txt:85`、`p6dof/p6dof_types/weapons/simple-icbm/ICBM_FullAero.txt:134`、`p6dof/p6dof_types/weapons/simple-icbm/refAero.txt:52`）
- **片段**：

```text
   cm_alpha_mach_table
      irregular_table
         independent_variable mach precision float
         independent_variable alpha units deg
         dependent_variable precision float
         mach  0.000
            alpha     -180.0  -90.0   0.0   90.0  180.0
            values    0.0     50.1    0.0   -50.1  0.0
         mach  30.000
            alpha     -180.0  -90.0   0.0   90.0  180.0
            values    0.0     50.1    0.0   -50.1  0.0
      end_irregular_table
   end_cm_alpha_mach_table
```

- **演示要点**：演示 cm_alpha_mach_table 的参数：irregular_table

### cm_alphadot_mach_table（aero）｜

- **关键词**：cm_alphadot_mach_table
- **出处**：`p6dof/p6dof_types/aircraft/b-fw/aero/aero.txt:108-114`　（同签名共 34 处，另见 `six_dof/six_dof_types/aircraft/b-fw/aero/aero_rb6.txt:108`、`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:122`、`p6dof/p6dof_types/aircraft/b-hvy/aero/aero.txt:122`）
- **片段**：

```text
   cm_alphadot_mach_table
        0.1000        -0.250273140729203
        0.5000        -0.250699667349162
        0.7000        -0.250690227268525
        0.7500        -0.250688361630963
        0.8000        -0.250686776899251
   end_cm_alphadot_mach_table
```

- **演示要点**：演示 cm_alphadot_mach_table（最小结构，无子参数）

### cm_angle_alpha_mach_table（aero）｜

- **关键词**：cm_angle_alpha_mach_table, file
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:313-315`　（同签名共 138 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:364`、`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:415`、`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:466`）
- **片段**：

```text
   cm_angle_alpha_mach_table
      file data/Drageron_Right_Top/cm_angle_alpha_mach_table.txt
   end_cm_angle_alpha_mach_table
```

- **演示要点**：演示 cm_angle_alpha_mach_table 的参数：file

### cmp_mach_table（aero）｜

- **关键词**：cmp_mach_table
- **出处**：`p6dof/p6dof_types/aircraft/b-fw/aero/aero.txt:98-104`　（同签名共 34 处，另见 `six_dof/six_dof_types/aircraft/b-fw/aero/aero_rb6.txt:98`、`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:105`、`p6dof/p6dof_types/aircraft/b-hvy/aero/aero.txt:105`）
- **片段**：

```text
   cmp_mach_table
        0.1000        -0.000010384289843
        0.5000        -0.000026075577166
        0.7000        -0.000027196235471
        0.7500        -0.000027383007994
        0.8000        -0.000027546432804
   end_cmp_mach_table
```

- **演示要点**：演示 cmp_mach_table（最小结构，无子参数）

### cmq_angle_mach_table（aero）｜

- **关键词**：cmq_angle_mach_table, file
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:317-319`　（同签名共 132 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:368`、`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:419`、`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:470`）
- **片段**：

```text
   cmq_angle_mach_table
      file data/Drageron_Right_Top/cmq_angle_mach_table.txt
   end_cmq_angle_mach_table
```

- **演示要点**：演示 cmq_angle_mach_table 的参数：file

### cmq_mach_table（aero）｜

- **关键词**：cmq_mach_table
- **出处**：`p6dof/p6dof_types/aircraft/b-fw/aero/aero.txt:88-94`　（同签名共 34 处，另见 `six_dof/six_dof_types/aircraft/b-fw/aero/aero_rb6.txt:88`、`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:88`、`p6dof/p6dof_types/aircraft/b-hvy/aero/aero.txt:88`）
- **片段**：

```text
   cmq_mach_table
        0.1000        -0.250273140729203
        0.5000        -0.250699667349162
        0.7000        -0.250690227268525
        0.7500        -0.250688361630963
        0.8000        -0.250686776899251
   end_cmq_mach_table
```

- **演示要点**：演示 cmq_mach_table（最小结构，无子参数）

### cn_alpha_beta_mach_table（aero）｜

- **关键词**：cn_alpha_beta_mach_table, file
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:139-141`　（同签名共 34 处，另见 `p6dof/p6dof_types/aircraft/b-fw/aero/aero.txt:118`、`p6dof/p6dof_types/aircraft/b-hvy/aero/aero.txt:139`、`p6dof/p6dof_types/aircraft/c-hvy/aero/aero.txt:166`）
- **片段**：

```text
   cn_alpha_beta_mach_table
      file data/cn_alpha_beta_mach_table.txt
   end_cn_alpha_beta_mach_table
```

- **演示要点**：演示 cn_alpha_beta_mach_table 的参数：file

### cn_angle_beta_mach_table（aero）｜

- **关键词**：cn_angle_beta_mach_table, file
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:321-323`　（同签名共 138 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:372`、`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:423`、`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:474`）
- **片段**：

```text
   cn_angle_beta_mach_table
      file data/Drageron_Right_Top/cn_angle_beta_mach_table.txt
   end_cn_angle_beta_mach_table
```

- **演示要点**：演示 cn_angle_beta_mach_table 的参数：file

### cn_beta_mach_table（ICBM_FullAero）｜

- **关键词**：cn_beta_mach_table, irregular_table
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/ICBM_FullAero.txt:50-62`　（同签名共 4 处，另见 `p6dof/p6dof_types/weapons/simple-icbm/ICBM_FullAero.txt:99`、`p6dof/p6dof_types/weapons/simple-icbm/ICBM_FullAero.txt:148`、`p6dof/p6dof_types/weapons/simple-icbm/refAero.txt:94`）
- **片段**：

```text
   cn_beta_mach_table
      irregular_table
         independent_variable mach precision float
         independent_variable beta units deg
         dependent_variable precision float
         mach  0.000
            beta      -180.0  -90.0   0.0   90.0  180.0
            values    0.0     -50.1    0.0   50.1  0.0
         mach  30.000
            beta      -180.0  -90.0   0.0   90.0  180.0
            values    0.0     -50.1    0.0   50.1  0.0
      end_irregular_table
   end_cn_beta_mach_table
```

- **演示要点**：演示 cn_beta_mach_table 的参数：irregular_table

### cn_betadot_mach_table（aero）｜

- **关键词**：cn_betadot_mach_table
- **出处**：`p6dof/p6dof_types/aircraft/b-fw/aero/aero.txt:124-130`　（同签名共 34 处，另见 `six_dof/six_dof_types/aircraft/b-fw/aero/aero_rb6.txt:124`、`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:145`、`p6dof/p6dof_types/aircraft/b-hvy/aero/aero.txt:145`）
- **片段**：

```text
   cn_betadot_mach_table
        0.1000         0.000171928251450
        0.5000         0.000176598156541
        0.7000         0.000176494672894
        0.7500         0.000176474224485
        0.8000         0.000176456854561
   end_cn_betadot_mach_table
```

- **演示要点**：演示 cn_betadot_mach_table（最小结构，无子参数）

### cnp_mach_table（aero）｜

- **关键词**：cnp_mach_table
- **出处**：`p6dof/p6dof_types/aircraft/b-fw/aero/aero.txt:144-150`　（同签名共 34 处，另见 `six_dof/six_dof_types/aircraft/b-fw/aero/aero_rb6.txt:144`、`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:179`、`p6dof/p6dof_types/aircraft/b-hvy/aero/aero.txt:179`）
- **片段**：

```text
   cnp_mach_table
        0.1000         0.000006689894723
        0.5000         0.000006953343407
        0.7000         0.000006960395613
        0.7500         0.000006961807142
        0.8000         0.000006963182564
   end_cnp_mach_table
```

- **演示要点**：演示 cnp_mach_table（最小结构，无子参数）

### cnr_angle_mach_table（aero）｜

- **关键词**：cnr_angle_mach_table, file
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:325-327`　（同签名共 132 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:376`、`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:427`、`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:478`）
- **片段**：

```text
   cnr_angle_mach_table
      file data/Drageron_Right_Top/cnr_angle_mach_table.txt
   end_cnr_angle_mach_table
```

- **演示要点**：演示 cnr_angle_mach_table 的参数：file

### cnr_mach_table（aero）｜

- **关键词**：cnr_mach_table
- **出处**：`p6dof/p6dof_types/aircraft/b-fw/aero/aero.txt:134-140`　（同签名共 34 处，另见 `six_dof/six_dof_types/aircraft/b-fw/aero/aero_rb6.txt:134`、`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:162`、`p6dof/p6dof_types/aircraft/b-hvy/aero/aero.txt:162`）
- **片段**：

```text
   cnr_mach_table
        0.1000        -0.000171928251450
        0.5000        -0.000176598156541
        0.7000        -0.000176494672894
        0.7500        -0.000176474224485
        0.8000        -0.000176456854561
   end_cnr_mach_table
```

- **演示要点**：演示 cnr_mach_table（最小结构，无子参数）

### curve（atlas_v_401_base）｜

- **关键词**：curve, independent_variable
- **出处**：`space_operations/launch_vehicles/atlas_v_401/atlas_v_401_base.txt:86-90`　（同签名共 8 处，另见 `space_operations/launch_vehicles/falcon_heavy/falcon_heavy_base.txt:170`、`space_operations/launch_vehicles/falcon_heavy/falcon_heavy_base.txt:142`、`space_operations/launch_vehicles/falcon_9/falcon_9_base.txt:97`）
- **片段**：

```text
            curve
               independent_variable time units sec
                 0.0  0.895
               999.0  0.895   # A large time will run until out of fuel
            end_curve
```

- **演示要点**：演示 curve 的参数：independent_variable

### cy_alpha_beta_mach_table（aero_pm6）｜

- **关键词**：cy_alpha_beta_mach_table, file
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/aero/aero_pm6.txt:22-24`　（同签名共 54 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:64`、`p6dof/p6dof_types/aircraft/b-fw/aero/aero.txt:64`、`p6dof/p6dof_types/aircraft/b-hvy/aero/aero.txt:64`）
- **片段**：

```text
   cy_alpha_beta_mach_table
      file data/cy_alpha_beta_mach_table.txt
   end_cy_alpha_beta_mach_table
```

- **演示要点**：演示 cy_alpha_beta_mach_table 的参数：file

### cy_angle_beta_mach_table（aero）｜

- **关键词**：cy_angle_beta_mach_table, file
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:309-311`　（同签名共 138 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:360`、`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:411`、`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:462`）
- **片段**：

```text
   cy_angle_beta_mach_table
      file data/Drageron_Right_Top/cy_angle_beta_mach_table.txt
   end_cy_angle_beta_mach_table
```

- **演示要点**：演示 cy_angle_beta_mach_table 的参数：file

### cy_beta_mach_table（refAero）｜

- **关键词**：cy_beta_mach_table, irregular_table
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/refAero.txt:80-92`
- **片段**：

```text
   cy_beta_mach_table
      irregular_table
         independent_variable mach precision float
         independent_variable beta units deg
         dependent_variable precision float
         mach  0.000
            alpha     -90.0   0.0    90.0
            values    0.0     0.0    0.0
         mach  30.000
            alpha     -90.0   0.0    90.0
            values    0.0     0.0    0.0
      end_irregular_table
   end_cy_beta_mach_table
```

- **演示要点**：演示 cy_beta_mach_table 的参数：irregular_table

### cy_betadot_beta_mach_table（aero）｜

- **关键词**：cy_betadot_beta_mach_table, file
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:76-78`　（同签名共 34 处，另见 `p6dof/p6dof_types/aircraft/b-fw/aero/aero.txt:76`、`p6dof/p6dof_types/aircraft/b-hvy/aero/aero.txt:76`、`p6dof/p6dof_types/aircraft/c-hvy/aero/aero.txt:76`）
- **片段**：

```text
   cy_betadot_beta_mach_table
      file data/cy_betadot_beta_mach_table.txt
   end_cy_betadot_beta_mach_table
```

- **演示要点**：演示 cy_betadot_beta_mach_table 的参数：file

### cyr_beta_mach_table（aero）｜

- **关键词**：cyr_beta_mach_table, file
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:70-72`　（同签名共 34 处，另见 `p6dof/p6dof_types/aircraft/b-fw/aero/aero.txt:70`、`p6dof/p6dof_types/aircraft/b-hvy/aero/aero.txt:70`、`p6dof/p6dof_types/aircraft/c-hvy/aero/aero.txt:70`）
- **片段**：

```text
   cyr_beta_mach_table
      file data/cyr_beta_mach_table.txt
   end_cyr_beta_mach_table
```

- **演示要点**：演示 cyr_beta_mach_table 的参数：file

### density_altitude_table（atm_config）｜

- **关键词**：density_altitude_table
- **出处**：`p6dof/p6dof_types/environment/atm_config.txt:19-305`
- **片段**：

```text
density_altitude_table
# altitude_ft  density_slugs_ft3
0             0.002377170
1000          0.002308390
2000          0.002241140
3000          0.002175390
4000          0.002111140
5000          0.002048340
6000          0.001986980
7000          0.001927040
8000          0.001868500
9000          0.001811320
10000         0.001755490
11000         0.001700990
12000         0.001647790
13000         0.001595880
14000         0.001545220
15000         0.001495810
16000         0.001447610
17000         0.001400610
18000         0.001354790
19000         0.001310120
20000         0.001266590
21000         0.001224170
22000         0.001182850
23000         0.001142600
24000         0.001103410
25000         0.001065260
26000         0.001028120
27000         0.000991984
28000         0.000956827
29000         0.000922631
30000         0.000889378
31000         0.000857050
32000         0.000825628
33000         0.000795096
34000         0.000765434
35000         0.000736627
36000         0.000708657
37000         0.000675954
38000         0.000644234
39000         0.000614002
40000         0.000585189
41000         0.000557728
42000         0.000531556
43000         0.000506612
44000         0.000482838
45000         0.000460180
46000         0.000438586
47000         0.000418004
48000         0.000398389
49000         0.000379694
50000         0.000361876
51000         0.000344894
52000         0.000328709
53000         0.000313284
54000         0.000298583
55000         0.000284571
56000         0.000271217
57000         0.000258490
58000         0.000246360
59000         0.000234799
60000         0.000223781
61000         0.000213279
62000         0.000203271
63000         0.000193732
64000         0.000184641
65000         0.000175976
66000         0.000167629
67000         0.000159548
68000         0.000151867
69000         0.000144566
70000         0.000137625
71000         0.000131026
72000         0.000124753
73000         0.000118788
74000         0.000113116
75000         0.000107722
76000         0.000102592
77000         0.000097713
78000         0.000093073
79000         0.000088658
80000         0.000084459
81000         0.000080464
82000         0.000076663
83000         0.000073047
84000         0.000069605
85000         0.000066331
86000         0.000063214
87000         0.000060248
88000         0.000057425
89000         0.000054738
90000         0.000052179
91000         0.000049744
92000         0.000047425
93000         0.000045218
94000         0.000043116
95000         0.000041114
96000         0.000039208
97000         0.000037392
98000         0.000035663
99000         0.000034016
100000        0.000032447
101000        0.000030953
102000        0.000029529
103000        0.000028172
104000        0.000026880
105000        0.000025647
106000        0.000024416
107000        0.000023249
108000        0.000022141
109000        0.000021090
110000        0.000020093
111000        0.000019146
112000        0.000018246
113000        0.000017392
114000        0.000016581
115000        0.000015811
116000        0.000015079
117000        0.000014383
118000        0.000013722
119000        0.000013093
120000        0.000012495
121000        0.000011926
122000        0.000011385
123000        0.000010871
124000        0.000010381
125000        0.000009915
126000        0.000009472
127000        0.000009049
128000        0.000008647
129000        0.000008264
130000        0.000007899
131000        0.000007552
132000        0.000007221
133000        0.000006905
134000        0.000006604
135000        0.000006318
136000        0.000006044
137000        0.000005784
138000        0.000005535
139000        0.000005298
140000        0.000005072
141000        0.000004856
142000        0.000004650
143000        0.000004453
144000        0.000004265
145000        0.000004086
146000        0.000003915
147000        0.000003751
148000        0.000003595
149000        0.000003446
150000        0.000003303
151000        0.000003167
152000        0.000003037
153000        0.000002912
154000        0.000002793
155000        0.000002686
156000        0.000002585
157000        0.000002487
158000        0.000002393
159000        0.000002303
160000        0.000002216
161000        0.000002132
162000        0.000002052
163000        0.000001975
164000        0.000001900
165000        0.000001828
166000        0.000001759
167000        0.000001693
168000        0.000001632
169000        0.000001576
170000        0.000001521
171000        0.000001467
172000        0.000001416
173000        0.000001366
174000        0.000001317
175000        0.000001271
176000        0.000001225
177000        0.000001182
178000        0.000001139
179000        0.000001098
180000        0.000001059
181000        0.000001020
182000        0.000000983
183000        0.000000948
184000        0.000000913
185000        0.000000879
186000        0.000000847
187000        0.000000816
188000        0.000000786
189000        0.000000756
190000        0.000000728
191000        0.000000701
192000        0.000000675
193000        0.000000649
194000        0.000000625
195000        0.000000601
196000        0.000000578
197000        0.000000556
198000        0.000000535
199000        0.000000514
200000        0.000000495
201000        0.000000475
202000        0.000000457
203000        0.000000439
204000        0.000000422
205000        0.000000405
206000        0.000000390
207000        0.000000374
208000        0.000000359
209000        0.000000345
210000        0.000000331
211000        0.000000318
212000        0.000000305
213000        0.000000293
214000        0.000000281
215000        0.000000270
216000        0.000000259
217000        0.000000248
218000        0.000000238
219000        0.000000228
220000        0.000000219
221000        0.000000209
222000        0.000000201
223000        0.000000192
224000        0.000000184
225000        0.000000176
226000        0.000000169
227000        0.000000162
228000        0.000000155
229000        0.000000148
230000        0.000000142
231000        0.000000136
232000        0.000000130
233000        0.000000124
234000        0.000000119
235000        0.000000113
236000        0.000000108
237000        0.000000103
238000        0.000000099
239000        0.000000094
240000        0.000000090
241000        0.000000086
242000        0.000000082
243000        0.000000078
244000        0.000000075
245000        0.000000071
246000        0.000000068
247000        0.000000065
248000        0.000000062
249000        0.000000059
250000        0.000000056
251000        0.000000053
252000        0.000000051
253000        0.000000049
254000        0.000000046
255000        0.000000044
256000        0.000000042
257000        0.000000040
258000        0.000000038
259000        0.000000036
260000        0.000000034
261000        0.000000033
262000        0.000000031
263000        0.000000030
264000        0.000000028
265000        0.000000027
266000        0.000000026
267000        0.000000024
268000        0.000000023
269000        0.000000022
270000        0.000000021
271000        0.000000020
272000        0.000000019
273000        0.000000018
274000        0.000000017
275000        0.000000016
276000        0.000000015
277000        0.000000015
278000        0.000000014
279000        0.000000013
280000        0.000000012
281000        0.000000012
282000        0.000000011
400000        0.000000000
end_density_altitude_table
```

- **演示要点**：演示 density_altitude_table（最小结构，无子参数）

### dependent_variable（cd_alpha_beta_mach_table）｜

- **关键词**：dependent_variable
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/aero/data/cd_alpha_beta_mach_table.txt:24-26`　（同签名共 2041 处，另见 `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/aero/data/cLift_alpha_beta_mach_table.txt:24`、`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/aero/data/cy_alpha_beta_mach_table.txt:24`、`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/aero/data/pdotmax_mach_table.txt:16`）
- **片段**：

```text
dependent_variable precision double
0.9134 0.9653 0.9086 0.9063 0.9042 0.8278 0.5832 0.4858 0.2995 0.1451 0.06169 0.0277 0.02033 0.0277 0.06169 0.1451 0.2995 0.4858 0.5832 0.8278 0.9042 0.9063 0.9086 0.9653 0.9134 0.9134 0.9653 0.9086 0.9063 0.9042 0.8278 0.5832 0.4858 0.2995 0.1451 0.06169 0.0277 0.02033 0.0277 0.06169 0.1451 0.2995 0.4858 0.5832 0.8278 0.9042 0.9063 0.9086 0.9653 0.9134 0.925 0.9225 0.9202 0.9181 0.9161 0.8037 0.5659 0.4712 0.2836 0.1369 0.05782 0.02582 0.01879 0.02582 0.05782 0.1369 0.2836 0.4712 0.5659 0.8037 0.9161 0.9181 0.9202 0.9225 0.925 0.925 0.9225 0.9202 0.9181 0.9161 0.8037 0.5659 0.4712 0.2836 0.1369 0.05782 0.02582 0.01879 0.02582 0.05782 0.1369 0.2836 0.4712 0.5659 0.8037 0.9161 0.9181 0.9202 0.9225 0.925 0.9674 0.9653 0.9633 0.9614 0.8731 0.7369 0.5191 0.4324 0.2423 0.1176 0.05075 0.02432 0.01825 0.02432 0.05075 0.1176 0.2423 0.4324 0.5191 0.7369 0.8731 0.9614 0.9633 0.9653 0.9674 0.9674 0.9653 0.9633 0.9614 0.8731 0.7369 0.5191 0.4324 0.2423 0.1176 0.05075 0.02432 0.01825 0.02432 0.05075 0.1176 0.2423 0.4324 0.5191 0.7369 0.8731 0.9614 0.9633 0.9653 0.9674 1.068 1.065 1.063 1.061 0.7985 0.6746 0.4767 0.3748 0.2069 0.1028 0.0472 0.02575 0.02037 0.02575 0.0472 0.1028 0.2069 0.3748 0.4767 0.6746 0.7985 1.061 1.063 1.065 1.068 1.068 1.065 1.063 1.061 0.7985 0.6746 0.4767 0.3748 0.2069 0.1028 0.0472 0.02575 0.02037 0.02575 0.0472 0.1028 0.2069 0.3748 0.4767 0.6746 0.7985 1.061 1.063 1.065 1.068 1.095 1.091 1.088 1.085 0.8222 0.6977 0.4992 0.3968 0.2279 0.1231 0.06697 0.04519 0.03975 0.04519 0.06697 0.1231 0.2279 0.3968 0.4992 0.6977 0.8222 1.085 1.088 1.091 1.095 1.095 1.091 1.088 1.085 0.8222 0.6977 0.4992 0.3968 0.2279 0.1231 0.06697 0.04519 0.03975 0.04519 0.06697 0.1231 0.2279 0.3968 0.4992 0.6977 0.8222 1.085 1.088 1.091 1.095 1.094 1.093 1.091 1.09 0.8292 0.7063 0.5093 0.4082 0.2417 0.1387 0.08402 0.06313 0.058 0.06313 0.08402 0.1387 0.2417 0.4082 0.5093 0.7063 0.8292 1.09 1.091 1.093 1.094 1.094 1.093 1.091 1.09 0.8292 0.7063 0.5093 0.4082 0.2417 0.1387 0.08402 0.06313 0.058 0.06313 0.08402 0.1387 0.2417 0.4082 0.5093 0.7063 0.8292 1.09 1.091 1.093 1.094 0.6843 0.6803 0.6766 0.673 0.6697 0.6666 0.6637 0.6611 0.471 0.2836 0.1326 0.06801 0.05375 0.06801 0.1326 0.2836 0.471 0.6611 0.6637 0.6666 0.6697 0.673 0.6766 0.6803 0.6843 0.6843 0.6803 0.6766 0.673 0.6697 0.6666 0.6637 0.6611 0.471 0.2836 0.1326 0.06801 0.05375 0.06801 0.1326 0.2836 0.471 0.6611 0.6637 0.6666 0.6697 0.673 0.6766 0.6803 0.6843 0.8745 0.8599 0.8461 0.8332 0.821 0.8097 0.7862 0.6603 0.4441 0.2503 0.1233 0.0676 0.0526 0.0676 0.1233 0.2503 0.4441 0.6603 0.7862 0.8097 0.821 0.8332 0.8461 0.8599 0.8745 0.8745 0.8599 0.8461 0.8332 0.821 0.8097 0.7862 0.6603 0.4441 0.2503 0.1233 0.0676 0.0526 0.0676 0.1233 0.2503 0.4441 0.6603 0.7862 0.8097 0.821 0.8332 0.8461 0.8599 0.8745 1.012 0.9976 0.9837 0.9705 0.9581 0.9352 0.6784 0.5714 0.3712 0.2013 0.1064 0.06477 0.05172 0.06477 0.1064 0.2013 0.3712 0.5714 0.6784 0.9352 0.9581 0.9705 0.9837 0.9976 1.012 1.012 0.9976 0.9837 0.9705 0.9581 0.9352 0.6784 0.5714 0.3712 0.2013 0.1064 0.06477 0.05172 0.06477 0.1064 0.2013 0.3712 0.5714 0.6784 0.9352 0.9581 0.9705 0.9837 0.9976 1.012 1.192 1.176 1.161 1.147 0.943 0.8035 0.5878 0.486 0.289 0.1633 0.09261 0.06128 0.04818 0.06128 0.09261 0.1633 0.289 0.486 0.5878 0.8035 0.943 1.147 1.161 1.176 1.192 1.192 1.176 1.161 1.147 0.943 0.8035 0.5878 0.486 0.289 0.1633 0.09261 0.06128 0.04818 0.06128 0.09261 0.1633 0.289 0.486 0.5878 0.8035 0.943 1.147 1.161 1.176 1.192 1.551 1.515 1.482 1.383 0.8652 0.7204 0.4657 0.3554 0.2041 0.1133 0.06676 0.05035 0.04637 0.05035 0.06676 0.1133 0.2041 0.3554 0.4657 0.7204 0.8652 1.383 1.482 1.515 1.551 1.551 1.515 1.482 1.383 0.8652 0.7204 0.4657 0.3554 0.2041 0.1133 0.06676 0.05035 0.04637 0.05035 0.06676 0.1133 0.2041 0.3554 0.4657 0.7204 0.8652 1.383 1.482 1.515 1.551 
end_dependent_variable
```

- **演示要点**：演示 dependent_variable（最小结构，无子参数）

### fires_elevation_angle_table（fires_60mm_rocket）｜

- **关键词**：fires_elevation_angle_table
- **出处**：`fires/types/fires_60mm_rocket.txt:15-22`　（同签名共 9 处，另见 `fires/types/fires_122mm_rocket_short.txt:16`、`fires/types/fires_107mm_rocket.txt:14`、`fires/types/fires_240mm_rocket.txt:15`）
- **片段**：

```text
  fires_elevation_angle_table FIRES_60MM_ROCKET
     1000 8.5 5.4
     1500 12.6 8.4
     2000 17.6 11.8
     2500 23.6 15.8
     3000 34.3 22.2
     3100 44.8 28.2
  end_fires_elevation_angle_table
```

- **演示要点**：演示 fires_elevation_angle_table（最小结构，无子参数）

### fires_table（fires_120mm_artillery）｜

- **关键词**：fires_table, maximum_ordinate_values, range_values, time_of_flight_values
- **出处**：`fires/types/fires_120mm_artillery.txt:16-20`　（同签名共 4 处，另见 `fires/types/fires_120mm_mortar.txt:21`、`fires/types/fires_152mm_artillery.txt:16`、`fires/types/fires_60mm_mortar.txt:18`）
- **片段**：

```text
  fires_table FIRES_120MM_ARTILLERY
      maximum_ordinate_values   376.367 434.216 497.708 568.108 645.866 731.082 824.125 926.828 1040.22 1165.23 1305.98 1463.59 end_maximum_ordinate_values
      range_values   5905.23 6205.24 6504.58 6805.12 7107.53 7409.15 7708.29 8009.73 8311 8610.23 8913.2 9215.95 end_range_values
      time_of_flight_values   17.51 18.76 20.01 21.31 22.66 24.06 25.51 27.06 28.61 30.26 32.01 33.86 end_time_of_flight_values
   end_fires_table
```

- **演示要点**：演示 fires_table 的参数：maximum_ordinate_values, range_values, time_of_flight_values

### fires_table（fires_120mm_mortar_m934_he）｜

- **关键词**：fires_table, range_values, time_of_flight_values, elevation_angle_values
- **出处**：`fires/types/fires_120mm_mortar_m934_he.txt:14-18`　（同签名共 5 处，另见 `fires/types/fires_60mm_mortar_m720_he.txt:16`、`fires/types/fires_81mm_mortar_m821_he.txt:14`、`fires/types/fires_155mm_artillery_m107_he.txt:15`）
- **片段**：

```text
  fires_table FIRES_120MM_MORTAR_M934_HE
      range_values             1500 1600  1700  1800  1900  2000  2100  2200  2300  end_range_values
      time_of_flight_values    41.8 41.7  41.6  41.5  41.4  41.3  41.2  41    40.9  end_time_of_flight_values
      elevation_angle_values   1410 1397  1383  1370  1356  1342  1328  1314  1299  end_elevation_angle_values
   end_fires_table
```

- **演示要点**：演示 fires_table 的参数：range_values, time_of_flight_values, elevation_angle_values

### frequency_maximum_rcs_table（chaff_example）｜

- **关键词**：frequency_maximum_rcs_table, independent_variable
- **出处**：`chaff/chaff_example.txt:34-40`　（同签名共 2 处，另见 `chaff/chaff_example_ttr.txt:32`）
- **片段**：

```text
  frequency_maximum_rcs_table # if no units specified, assumed hz vs. dBsm
     independent_variable units mhz extrapolate
     100  71
     500  57
     1000 51
     1500 48
  end_frequency_maximum_rcs_table
```

- **演示要点**：演示 frequency_maximum_rcs_table 的参数：independent_variable

### gain_table（autopilot_config）｜

- **关键词**：gain_table, control_value, kp, ki, kd, max_error_accum, low_pass_alpha
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/autopilot_config.txt:42-49`　（同签名共 4 处，另见 `p6dof/p6dof_types/weapons/simple-icbm/autopilot_config.txt:51`、`p6dof/p6dof_types/weapons/simple-icbm/autopilot_config.txt:60`、`p6dof/p6dof_types/weapons/simple-icbm/autopilot_config.txt:69`）
- **片段**：

```text
      gain_table
        control_value            0
        kp                       0.1
        ki                       0.15
        kd                       0
        max_error_accum          10
        low_pass_alpha           0.7
      end_gain_table
```

- **演示要点**：演示 gain_table 的参数：control_value, kp, ki, kd, max_error_accum, low_pass_alpha

### gain_table（autopilot_config）｜

- **关键词**：gain_table, control_value, kp, ki, kd, max_error_accum
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/autopilot_config.txt:146-152`　（同签名共 4 处，另见 `p6dof/p6dof_types/weapons/simple-icbm/autopilot_config.txt:154`、`p6dof/p6dof_types/weapons/simple-icbm/autopilot_config.txt:162`、`p6dof/p6dof_types/weapons/simple-icbm/autopilot_config.txt:170`）
- **片段**：

```text
      gain_table
        control_value            0
        kp                       0.3
        ki                       3
        kd                       0.01
        max_error_accum          1
      end_gain_table
```

- **演示要点**：演示 gain_table 的参数：control_value, kp, ki, kd, max_error_accum

### gain_table（flight_controls）｜

- **关键词**：gain_table, name, type, simple_table
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/flight_controls.txt:137-145`　（同签名共 3 处，另见 `p6dof/p6dof_types/weapons/simple-icbm/flight_controls.txt:161`、`p6dof/p6dof_types/weapons/simple-icbm/flight_controls.txt:147`）
- **片段**：

```text
 gain_table
  name MachGainTableName
  type mach_gain
  simple_table
   0.00          1.0
   1.00          0.5
   2.00          0.1
  end_simple_table
 end_gain_table
```

- **演示要点**：演示 gain_table 的参数：name, type, simple_table

### gain_table（flight_controls）｜

- **关键词**：gain_table, type, simple_table
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:138-145`　（同签名共 87 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:160`、`p6dof/p6dof_types/aircraft/b-fw/controls/flight_controls.txt:138`、`p6dof/p6dof_types/aircraft/b-fw/controls/flight_controls.txt:160`）
- **片段**：

```text
gain_table MachGainTableName
  type mach_gain
  simple_table
   0.00          1.0
   1.00          0.5
   2.00          0.1
  end_simple_table
end_gain_table
```

- **演示要点**：演示 gain_table 的参数：type, simple_table

### independent_variable（cd_alpha_beta_mach_table）｜

- **关键词**：independent_variable
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/aero/data/cd_alpha_beta_mach_table.txt:12-14`　（同签名共 4979 处，另见 `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/aero/data/cd_alpha_beta_mach_table.txt:16`、`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/aero/data/cd_alpha_beta_mach_table.txt:20`、`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/aero/data/cLift_alpha_beta_mach_table.txt:12`）
- **片段**：

```text
independent_variable mach precision float
0.25 0.5 0.75 0.85 1.0 1.05 1.2 1.5 1.75 2.0 2.25 
end_independent_variable
```

- **演示要点**：演示 independent_variable（最小结构，无子参数）

### inline_table（blue_a2a_radar）｜

- **关键词**：inline_table
- **出处**：`base_types/sensors/radar/blue_a2a_radar.txt:104-112`　（同签名共 11 处，另见 `draw/sensors/radar/generic_fighter_radar.txt:11`、`outer_air_battle/sensors/radar/blue_a2a_radar.txt:110`、`example_scripts/output_file_demo.txt:17`）
- **片段**：

```text
  inline_table db
    #-- The 1st is the number of azimuths and the 2nd is the number of elevations
    4  2
              -1.0  1.0
         -5.0    5.0  5.0
         -1.5   35.0  35.0
          1.5   35.0  35.0
          5.0    5.0  5.0
  end_inline_table
```

- **演示要点**：演示 inline_table（最小结构，无子参数）

### irregular_table（ICBM_BalloonAero）｜

- **关键词**：irregular_table, independent_variable, dependent_variable, mach
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/ICBM_BalloonAero.txt:23-33`　（同签名共 209 处，另见 `p6dof/p6dof_types/weapons/simple-icbm/ICBM_BalloonAero.txt:46`、`p6dof/p6dof_types/weapons/simple-icbm/ICBM_FullAero.txt:23`、`p6dof/p6dof_types/weapons/simple-icbm/ICBM_FullAero.txt:37`）
- **片段**：

```text
      irregular_table
         independent_variable mach precision float
         independent_variable alpha units deg
         dependent_variable precision float
         mach  0.000
            alpha     -90.0   0.0    90.0
            values    0       0      0
         mach  30.000
            alpha     -90.0   0.0    90.0
            values    0       0      0
      end_irregular_table
```

- **演示要点**：演示 irregular_table 的参数：independent_variable, dependent_variable, mach

### irregular_table（flight_controls）｜

- **关键词**：irregular_table, independent_variable, dependent_variable, control_value
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:23-36`　（同签名共 30 处，另见 `p6dof/p6dof_types/aircraft/b-fw/controls/flight_controls.txt:23`、`p6dof/p6dof_types/aircraft/b-hvy/controls/flight_controls.txt:23`、`p6dof/p6dof_types/aircraft/c-hvy/controls/flight_controls.txt:23`）
- **片段**：

```text
      irregular_table
         independent_variable control_value precision float
         independent_variable input         precision float
         dependent_variable                 precision float
         control_value 0.0
            input -1.0 -0.5  0.0  0.5  1.0
            values -0.8 -0.4  0.0  0.4  0.8
         control_value 1.0
            input -1.0 -0.5  0.0  0.5  1.0
            values -0.8 -0.4  0.0  0.4  0.8
         control_value 2.0
            input -1.0 -0.5  0.0  0.5  1.0
            values -0.8 -0.4  0.0  0.4  0.8
      end_irregular_table
```

- **演示要点**：演示 irregular_table 的参数：independent_variable, dependent_variable, control_value

### irregular_table（thrust_ab_alt_mach）｜

- **关键词**：irregular_table, independent_variable, dependent_variable, alt
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/prop/data/thrust_ab_alt_mach.txt:10-32`　（同签名共 36 处，另见 `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/prop/data/thrust_idle_alt_mach.txt:10`、`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/prop/data/thrust_mil_alt_mach.txt:10`、`six_dof_with_brawler/six_dof_types/aircraft/LTE_FIGHTER/prop/data/thrust_ab_alt_mach.txt:10`）
- **片段**：

```text
irregular_table
   independent_variable alt units ft
   independent_variable mach precision float
   dependent_variable precision float
   alt	0.0
      mach	0.25	0.5	0.75	0.85	1.0	1.05	1.2	1.5	1.75	2.0	2.25	
      values	6.399e+04	7.412e+04	7.289e+04	7.427e+04	7.278e+04	7.354e+04	7.165e+04	7.146e+04	7.25e+04	7.415e+04	8.475e+04	
   alt	10000.0
      mach	0.25	0.5	0.75	0.85	1.0	1.05	1.2	1.5	1.75	2.0	2.25	
      values	7.165e+04	7.146e+04	7.25e+04	7.415e+04	8.475e+04	4.798e+04	5.155e+04	5.905e+04	6.192e+04	6.157e+04	6.161e+04	
   alt	20000.0
      mach	0.25	0.5	0.75	0.85	1.0	1.05	1.2	1.5	1.75	2.0	2.25	
      values	5.155e+04	5.905e+04	6.192e+04	6.157e+04	6.161e+04	6.048e+04	6.29e+04	6.732e+04	6.888e+04	7.581e+04	3.313e+04	
   alt	30000.0
      mach	0.25	0.5	0.75	0.85	1.0	1.05	1.2	1.5	1.75	2.0	2.25	
      values	6.29e+04	6.732e+04	6.888e+04	7.581e+04	3.313e+04	3.71e+04	4.069e+04	4.44e+04	4.96e+04	5.114e+04	5.213e+04	
   alt	40000.0
      mach	0.25	0.5	0.75	0.85	1.0	1.05	1.2	1.5	1.75	2.0	2.25	
      values	4.069e+04	4.44e+04	4.96e+04	5.114e+04	5.213e+04	5.465e+04	5.906e+04	6.265e+04	6.544e+04	2.283e+04	2.42e+04	
   alt	50000.0
      mach	0.25	0.5	0.75	0.85	1.0	1.05	1.2	1.5	1.75	2.0	2.25	
      values	5.906e+04	6.265e+04	6.544e+04	2.283e+04	2.42e+04	2.646e+04	3.046e+04	3.356e+04	3.53e+04	4.028e+04	4.239e+04	
end_irregular_table
```

- **演示要点**：演示 irregular_table 的参数：independent_variable, dependent_variable, alt

### irregular_table（autopilot_support_tables）｜

- **关键词**：irregular_table, cl, values
- **出处**：`p6dof/p6dof_types/misc/srb-rato/controls/autopilot_support_tables.txt:45-58`
- **片段**：

```text
      irregular_table
      independent_variable mach precision float
      independent_variable cl precision float
      dependent_variable precision float
      mach   0.00
         cl     -0.9340  0.000  0.9340
         values -26.010  0.000  26.010
      mach   1.00
         cl     -0.9340  0.000  0.9340
         values -26.010  0.000  26.010
      mach  50.00
         cl     -0.9340  0.000  0.9340
         values -26.010  0.000  26.010
      end_irregular_table
```

- **演示要点**：演示 irregular_table 的参数：cl, values

### irregular_table（autopilot_support_tables）｜

- **关键词**：irregular_table, alpha, values
- **出处**：`p6dof/p6dof_types/misc/srb-rato/controls/autopilot_support_tables.txt:62-75`　（同签名共 2 处，另见 `p6dof/p6dof_types/misc/srb-rato/controls/autopilot_support_tables.txt:79`）
- **片段**：

```text
      irregular_table
      independent_variable mach precision float
      independent_variable alpha units deg
      dependent_variable precision float
      mach   0.00
         alpha  -26.00   0.000    26.00
         values -0.828   0.000    0.828
      mach   1.00
         alpha  -26.00   0.000    26.00
         values -0.828   0.000    0.828
      mach  50.00
         alpha  -26.00   0.000    26.00
         values -0.828   0.000    0.828
      end_irregular_table
```

- **演示要点**：演示 irregular_table 的参数：alpha, values

### mapping_table（flight_controls）｜

- **关键词**：mapping_table, name, type, table_data, irregular_table
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/flight_controls.txt:11-30`
- **片段**：

```text
 mapping_table
  name SignalMappingTableName
  type signal_mapping
  table_data
    irregular_table
       independent_variable control_value precision float
       independent_variable input         precision float
       dependent_variable                 precision float
       control_value 0.0
          input   -1.0 -0.5  0.0  0.5  1.0
          values  -0.8 -0.4  0.0  0.4  0.8
       control_value 1.0
          input   -1.0 -0.5  0.0  0.5  1.0
          values  -0.8 -0.4  0.0  0.4  0.8
       control_value 2.0
          input   -1.0 -0.5  0.0  0.5  1.0
          values  -0.8 -0.4  0.0  0.4  0.8
    end_irregular_table
  end_table_data
 end_mapping_table
```

- **演示要点**：演示 mapping_table 的参数：name, type, table_data, irregular_table

### mapping_table（flight_controls）｜

- **关键词**：mapping_table, type, table_data
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:20-38`　（同签名共 29 处，另见 `p6dof/p6dof_types/aircraft/b-fw/controls/flight_controls.txt:20`、`p6dof/p6dof_types/aircraft/b-hvy/controls/flight_controls.txt:20`、`p6dof/p6dof_types/aircraft/c-hvy/controls/flight_controls.txt:20`）
- **片段**：

```text
mapping_table SignalMappingTableName
   type signal_mapping
   table_data
      irregular_table
         independent_variable control_value precision float
         independent_variable input         precision float
         dependent_variable                 precision float
         control_value 0.0
            input -1.0 -0.5  0.0  0.5  1.0
            values -0.8 -0.4  0.0  0.4  0.8
         control_value 1.0
            input -1.0 -0.5  0.0  0.5  1.0
            values -0.8 -0.4  0.0  0.4  0.8
         control_value 2.0
            input -1.0 -0.5  0.0  0.5  1.0
            values -0.8 -0.4  0.0  0.4  0.8
      end_irregular_table
   end_table_data
end_mapping_table
```

- **演示要点**：演示 mapping_table 的参数：type, table_data

### maximum_pitch_acceleration_mach_table（aero_pm6）｜

- **关键词**：maximum_pitch_acceleration_mach_table, file
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/aero/aero_pm6.txt:30-32`　（同签名共 16 处，另见 `six_dof/six_dof_types/aircraft/b-fw/aero/aero_pm6.txt:62`、`six_dof/six_dof_types/aircraft/b-hvy/aero/aero_pm6.txt:62`、`six_dof/six_dof_types/aircraft/c-hvy/aero/aero_pm6.txt:62`）
- **片段**：

```text
   maximum_pitch_acceleration_mach_table
      file data/qdotmax_mach_table.txt
   end_maximum_pitch_acceleration_mach_table
```

- **演示要点**：演示 maximum_pitch_acceleration_mach_table 的参数：file

### maximum_roll_acceleration_mach_table（aero_pm6）｜

- **关键词**：maximum_roll_acceleration_mach_table, file
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/aero/aero_pm6.txt:26-28`　（同签名共 16 处，另见 `six_dof/six_dof_types/aircraft/b-fw/aero/aero_pm6.txt:56`、`six_dof/six_dof_types/aircraft/b-hvy/aero/aero_pm6.txt:56`、`six_dof/six_dof_types/aircraft/c-hvy/aero/aero_pm6.txt:56`）
- **片段**：

```text
   maximum_roll_acceleration_mach_table
      file data/pdotmax_mach_table.txt
   end_maximum_roll_acceleration_mach_table
```

- **演示要点**：演示 maximum_roll_acceleration_mach_table 的参数：file

### maximum_yaw_acceleration_mach_table（aero_pm6）｜

- **关键词**：maximum_yaw_acceleration_mach_table, file
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/aero/aero_pm6.txt:34-36`　（同签名共 16 处，另见 `six_dof/six_dof_types/aircraft/b-fw/aero/aero_pm6.txt:68`、`six_dof/six_dof_types/aircraft/b-hvy/aero/aero_pm6.txt:68`、`six_dof/six_dof_types/aircraft/c-hvy/aero/aero_pm6.txt:68`）
- **片段**：

```text
   maximum_yaw_acceleration_mach_table
      file data/rdotmax_mach_table.txt
   end_maximum_yaw_acceleration_mach_table
```

- **演示要点**：演示 maximum_yaw_acceleration_mach_table 的参数：file

### pitch_control_mapping_table（control_inputs_pm6）｜

- **关键词**：pitch_control_mapping_table
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/control_inputs_pm6.txt:33-45`　（同签名共 18 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/controls/control_inputs.txt:91`、`p6dof/p6dof_types/aircraft/b-fw/controls/control_inputs.txt:91`、`p6dof/p6dof_types/aircraft/b-hvy/controls/control_inputs.txt:91`）
- **片段**：

```text
      pitch_control_mapping_table
         -1.00   -1.00
         -0.90   -0.75
         -0.75   -0.45
         -0.50   -0.15
         -0.25   -0.05
          0.00    0.00
          0.25    0.05
          0.50    0.15
          0.75    0.45
          0.90    0.75
          1.00    1.00
      end_pitch_control_mapping_table
```

- **演示要点**：演示 pitch_control_mapping_table（最小结构，无子参数）

### pressure_altitude_table（atm_config）｜

- **关键词**：pressure_altitude_table
- **出处**：`p6dof/p6dof_types/environment/atm_config.txt:307-593`
- **片段**：

```text
pressure_altitude_table
# altitude_ft  pressure_lbs_ft2
0           2116.2300
1000        2040.8600
2000        1967.6900
3000        1896.6500
4000        1827.7100
5000        1760.8000
6000        1695.9000
7000        1632.9400
8000        1571.9000
9000        1512.7100
10000       1455.3400
11000       1399.7400
12000       1345.8800
13000       1293.7100
14000       1243.1900
15000       1194.2800
16000       1146.9300
17000       1101.1200
18000       1056.8100
19000       1013.9400
20000       972.4990
21000       932.4380
22000       893.7240
23000       856.3210
24000       820.1960
25000       785.3160
26000       751.6460
27000       719.1550
28000       687.8100
29000       657.5820
30000       628.4380
31000       600.3480
32000       573.2850
33000       547.2170
34000       522.1180
35000       497.9590
36000       474.7140
37000       452.4380
38000       431.2070
39000       410.9720
40000       391.6860
41000       373.3050
42000       355.7870
43000       339.0920
44000       323.1790
45000       308.0130
46000       293.5590
47000       279.7840
48000       266.6540
49000       254.1410
50000       242.2150
51000       230.8490
52000       220.0160
53000       209.6910
54000       199.8510
55000       190.4730
56000       181.5340
57000       173.0160
58000       164.8970
59000       157.1590
60000       149.7840
61000       142.7550
62000       136.0560
63000       129.6710
64000       123.5860
65000       117.7870
66000       112.2600
67000       106.9980
68000       101.9900
69000       97.2230
70000       92.6848
71000       88.3644
72000       84.2510
73000       80.3344
74000       76.6049
75000       73.0534
76000       69.6712
77000       66.4499
78000       63.3817
79000       60.4591
80000       57.6751
81000       55.0228
82000       52.4959
83000       50.0882
84000       47.7941
85000       45.6080
86000       43.5246
87000       41.5391
88000       39.6467
89000       37.8429
90000       36.1234
91000       34.4843
92000       32.9216
93000       31.4317
94000       30.0111
95000       28.6565
96000       27.3648
97000       26.1329
98000       24.9580
99000       23.8374
100000      22.7686
101000      21.7490
102000      20.7763
103000      19.8483
104000      18.9630
105000      18.1182
106000      17.3131
107000      16.5466
108000      15.8166
109000      15.1214
110000      14.4591
111000      13.8281
112000      13.2267
113000      12.6536
114000      12.1072
115000      11.5863
116000      11.0895
117000      10.6157
118000      10.1638
119000      9.7325
120000      9.3210
121000      8.9283
122000      8.5534
123000      8.1955
124000      7.8537
125000      7.5273
126000      7.2155
127000      6.9177
128000      6.6331
129000      6.3611
130000      6.1011
131000      5.8526
132000      5.6151
133000      5.3879
134000      5.1706
135000      4.9628
136000      4.7640
137000      4.5738
138000      4.3917
139000      4.2175
140000      4.0508
141000      3.8911
142000      3.7382
143000      3.5919
144000      3.4516
145000      3.3173
146000      3.1887
147000      3.0654
148000      2.9472
149000      2.8340
150000      2.7255
151000      2.6214
152000      2.5216
153000      2.4260
154000      2.3342
155000      2.2461
156000      2.1613
157000      2.0797
158000      2.0012
159000      1.9257
160000      1.8530
161000      1.7831
162000      1.7158
163000      1.6510
164000      1.5887
165000      1.5288
166000      1.4711
167000      1.4155
168000      1.3621
169000      1.3105
170000      1.2607
171000      1.2126
172000      1.1663
173000      1.1215
174000      1.0784
175000      1.0367
176000      0.9966
177000      0.9579
178000      0.9206
179000      0.8846
180000      0.8499
181000      0.8164
182000      0.7842
183000      0.7531
184000      0.7232
185000      0.6944
186000      0.6666
187000      0.6399
188000      0.6141
189000      0.5893
190000      0.5654
191000      0.5424
192000      0.5203
193000      0.4990
194000      0.4785
195000      0.4588
196000      0.4398
197000      0.4216
198000      0.4040
199000      0.3872
200000      0.3709
201000      0.3553
202000      0.3403
203000      0.3259
204000      0.3121
205000      0.2988
206000      0.2860
207000      0.2737
208000      0.2619
209000      0.2506
210000      0.2397
211000      0.2293
212000      0.2192
213000      0.2096
214000      0.2004
215000      0.1915
216000      0.1830
217000      0.1749
218000      0.1671
219000      0.1596
220000      0.1524
221000      0.1455
222000      0.1389
223000      0.1326
224000      0.1265
225000      0.1207
226000      0.1152
227000      0.1099
228000      0.1048
229000      0.0999
230000      0.0952
231000      0.0908
232000      0.0865
233000      0.0824
234000      0.0785
235000      0.0748
236000      0.0712
237000      0.0678
238000      0.0645
239000      0.0614
240000      0.0585
241000      0.0556
242000      0.0529
243000      0.0504
244000      0.0479
245000      0.0456
246000      0.0433
247000      0.0412
248000      0.0392
249000      0.0372
250000      0.0354
251000      0.0336
252000      0.0319
253000      0.0303
254000      0.0288
255000      0.0274
256000      0.0260
257000      0.0247
258000      0.0234
259000      0.0222
260000      0.0211
261000      0.0200
262000      0.0190
263000      0.0180
264000      0.0171
265000      0.0162
266000      0.0153
267000      0.0145
268000      0.0138
269000      0.0131
270000      0.0124
271000      0.0117
272000      0.0111
273000      0.0105
274000      0.0099
275000      0.0094
276000      0.0089
277000      0.0084
278000      0.0080
279000      0.0075
280000      0.0071
281000      0.0067
282000      0.0064
400000      0.0000
end_pressure_altitude_table
```

- **演示要点**：演示 pressure_altitude_table（最小结构，无子参数）

### regular_table（pdotmax_mach_table）｜

- **关键词**：regular_table
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/aero/data/pdotmax_mach_table.txt:10-20`　（同签名共 2041 处，另见 `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/aero/data/pitch_frequency_mach_table.txt:10`、`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/aero/data/qdotmax_mach_table.txt:10`、`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/aero/data/rdotmax_mach_table.txt:10`）
- **片段**：

```text
regular_table

independent_variable mach precision float
0.25 0.5 0.75 0.85 1.0 1.05 1.2 1.5 1.75 2.0 2.25 
end_independent_variable

dependent_variable precision double
4.841 21.65 63.78 102.9 154.6 160.8 172.2 150.9 159.9 173.2 188.4 
end_dependent_variable

end_regular_table
```

- **演示要点**：演示 regular_table（最小结构，无子参数）

### roll_control_mapping_table（control_inputs_pm6）｜

- **关键词**：roll_control_mapping_table
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/control_inputs_pm6.txt:47-59`　（同签名共 18 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/controls/control_inputs.txt:105`、`p6dof/p6dof_types/aircraft/b-fw/controls/control_inputs.txt:105`、`p6dof/p6dof_types/aircraft/b-hvy/controls/control_inputs.txt:105`）
- **片段**：

```text
      roll_control_mapping_table
         -1.00   -1.00
         -0.90   -0.75
         -0.75   -0.45
         -0.50   -0.15
         -0.25   -0.05
          0.00    0.00
          0.25    0.05
          0.50    0.15
          0.75    0.45
          0.90    0.75
          1.00    1.00
      end_roll_control_mapping_table
```

- **演示要点**：演示 roll_control_mapping_table（最小结构，无子参数）

### roll_stabilizing_frequency_mach_table（aero_pm6）｜

- **关键词**：roll_stabilizing_frequency_mach_table, file
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/aero/aero_pm6.txt:38-40`　（同签名共 5 处，另见 `six_dof/six_dof_types/aircraft/fa-hvy/aero/aero_pm6.txt:80`、`six_dof/six_dof_types/aircraft/fa-lgt/aero/aero_pm6.txt:80`、`six_dof/six_dof_types/weapons/agm-mrc/aero/aero_pm6.txt:74`）
- **片段**：

```text
   roll_stabilizing_frequency_mach_table
      file data/roll_frequency_mach_table.txt
   end_roll_stabilizing_frequency_mach_table
```

- **演示要点**：演示 roll_stabilizing_frequency_mach_table 的参数：file

### routing_table（disseminate_c2）｜

- **关键词**：routing_table, track_updates, assign_track_updates, assignments, assignment_status, assignment_cancel, status
- **出处**：`iads_c2_demos/processors/disseminate_c2.txt:17-26`
- **片段**：

```text
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
```

- **演示要点**：演示 routing_table 的参数：track_updates, assign_track_updates, assignments, assignment_status, assignment_cancel, status

### simple_table（flight_controls）｜

- **关键词**：simple_table
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:140-144`　（同签名共 90 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:162`、`p6dof/p6dof_types/aircraft/b-fw/controls/flight_controls.txt:140`、`p6dof/p6dof_types/aircraft/b-fw/controls/flight_controls.txt:162`）
- **片段**：

```text
  simple_table
   0.00          1.0
   1.00          0.5
   2.00          0.1
  end_simple_table
```

- **演示要点**：演示 simple_table（最小结构，无子参数）

### sonic_speed_altitude_table（atm_config）｜

- **关键词**：sonic_speed_altitude_table
- **出处**：`p6dof/p6dof_types/environment/atm_config.txt:883-1169`
- **片段**：

```text
sonic_speed_altitude_table
# altitude_ft  sonic_speed_ft_s
0           1116.45
1000        1112.61
2000        1108.75
3000        1104.88
4000        1100.99
5000        1097.09
6000        1093.18
7000        1089.25
8000        1085.31
9000        1081.36
10000       1077.39
11000       1073.40
12000       1069.40
13000       1065.39
14000       1061.36
15000       1057.31
16000       1053.25
17000       1049.18
18000       1045.08
19000       1040.97
20000       1036.85
21000       1032.71
22000       1028.55
23000       1024.38
24000       1020.19
25000       1015.98
26000       1011.75
27000       1007.51
28000       1003.24
29000       998.96
30000       994.66
31000       990.35
32000       986.01
33000       981.66
34000       977.28
35000       972.89
36000       968.47
37000       968.08
38000       968.08
39000       968.08
40000       968.08
41000       968.08
42000       968.08
43000       968.08
44000       968.08
45000       968.08
46000       968.08
47000       968.08
48000       968.08
49000       968.08
50000       968.08
51000       968.08
52000       968.08
53000       968.08
54000       968.08
55000       968.08
56000       968.08
57000       968.08
58000       968.08
59000       968.08
60000       968.08
61000       968.08
62000       968.08
63000       968.08
64000       968.08
65000       968.08
66000       968.34
67000       969.02
68000       969.70
69000       970.38
70000       971.06
71000       971.74
72000       972.41
73000       973.09
74000       973.77
75000       974.45
76000       975.12
77000       975.80
78000       976.47
79000       977.15
80000       977.82
81000       978.50
82000       979.17
83000       979.84
84000       980.52
85000       981.19
86000       981.86
87000       982.53
88000       983.20
89000       983.87
90000       984.54
91000       985.21
92000       985.88
93000       986.55
94000       987.22
95000       987.88
96000       988.55
97000       989.22
98000       989.88
99000       990.55
100000      991.21
101000      991.88
102000      992.54
103000      993.21
104000      993.87
105000      994.55
106000      996.40
107000      998.25
108000      1000.10
109000      1001.95
110000      1003.79
111000      1005.62
112000      1007.46
113000      1009.29
114000      1011.12
115000      1012.94
116000      1014.76
117000      1016.58
118000      1018.39
119000      1020.20
120000      1022.01
121000      1023.81
122000      1025.62
123000      1027.41
124000      1029.21
125000      1031.00
126000      1032.79
127000      1034.58
128000      1036.36
129000      1038.14
130000      1039.91
131000      1041.69
132000      1043.46
133000      1045.23
134000      1046.99
135000      1048.75
136000      1050.51
137000      1052.27
138000      1054.02
139000      1055.77
140000      1057.52
141000      1059.26
142000      1061.00
143000      1062.74
144000      1064.47
145000      1066.21
146000      1067.94
147000      1069.66
148000      1071.39
149000      1073.11
150000      1074.83
151000      1076.55
152000      1078.26
153000      1079.97
154000      1081.68
155000      1082.02
156000      1082.02
157000      1082.02
158000      1082.02
159000      1082.02
160000      1082.02
161000      1082.02
162000      1082.02
163000      1082.02
164000      1082.02
165000      1082.02
166000      1082.02
167000      1082.02
168000      1080.86
169000      1079.15
170000      1077.44
171000      1075.73
172000      1074.01
173000      1072.29
174000      1070.57
175000      1068.84
176000      1067.11
177000      1065.38
178000      1063.65
179000      1061.91
180000      1060.17
181000      1058.43
182000      1056.68
183000      1054.93
184000      1053.18
185000      1051.43
186000      1049.67
187000      1047.91
188000      1046.15
189000      1044.38
190000      1042.61
191000      1040.84
192000      1039.07
193000      1037.29
194000      1035.51
195000      1033.72
196000      1031.94
197000      1030.15
198000      1028.35
199000      1026.56
200000      1024.76
201000      1022.95
202000      1021.15
203000      1019.34
204000      1017.53
205000      1015.71
206000      1013.89
207000      1012.07
208000      1010.24
209000      1008.41
210000      1006.58
211000      1004.75
212000      1002.91
213000      1001.07
214000      999.22
215000      997.37
216000      995.52
217000      993.66
218000      991.80
219000      989.94
220000      988.07
221000      986.20
222000      984.33
223000      982.45
224000      980.57
225000      978.69
226000      976.80
227000      974.91
228000      973.01
229000      971.12
230000      969.21
231000      967.31
232000      965.40
233000      963.52
234000      962.15
235000      960.77
236000      959.40
237000      958.03
238000      956.65
239000      955.27
240000      953.89
241000      952.50
242000      951.12
243000      949.73
244000      948.34
245000      946.95
246000      945.56
247000      944.16
248000      942.77
249000      941.37
250000      939.96
251000      938.56
252000      937.15
253000      935.75
254000      934.34
255000      932.92
256000      931.51
257000      930.09
258000      928.67
259000      927.25
260000      925.83
261000      924.41
262000      922.98
263000      921.55
264000      920.12
265000      918.68
266000      917.25
267000      915.81
268000      914.37
269000      912.92
270000      911.48
271000      910.03
272000      908.58
273000      907.13
274000      905.67
275000      904.22
276000      902.76
277000      901.30
278000      899.83
279000      899.27
280000      899.27
281000      899.27
282000      899.27
400000      899.27
end_sonic_speed_altitude_table
```

- **演示要点**：演示 sonic_speed_altitude_table（最小结构，无子参数）

### stick_zero_moment_delta_thrust_mach_alpha_table（autopilot_support_tables）｜

- **关键词**：stick_zero_moment_delta_thrust_mach_alpha_table, irregular_table
- **出处**：`p6dof/p6dof_types/aircraft/b-fw/controls/autopilot_support_tables.txt:170-215`　（同签名共 28 处，另见 `six_dof/six_dof_types/aircraft/b-fw/controls/autopilot_support_tables.txt:170`、`p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_support_tables.txt:300`、`p6dof/p6dof_types/aircraft/b-hvy/controls/autopilot_support_tables.txt:300`）
- **片段**：

```text
   stick_zero_moment_delta_thrust_mach_alpha_table
      irregular_table
         independent_variable mach precision float
         independent_variable alpha units deg
         dependent_variable precision float
         mach   0.30
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values          0.141      0.144      0.146      0.148      0.149      0.150      0.151      0.152      0.152      0.153      0.154      0.154      0.154      0.154      0.154      0.154      0.153      0.152      0.151      0.150      0.148      0.146      0.144      0.142      0.140      0.137      0.135      0.133      0.135      0.137      0.141      0.146      0.151      0.156      0.162      0.167      0.172      0.175      0.177      0.177      0.175      0.171      0.167      0.162      0.157      0.152      0.147      0.142      0.139      0.135      0.134      0.133      0.134      0.136      0.138      0.140      0.142      0.144      0.147      0.149      0.150      0.151      0.152      0.154      0.154      0.155      0.155      0.155      0.155      0.155      0.154      0.154      0.154      0.153      0.152      0.152      0.150      0.149      0.146
         mach   0.60
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values          0.033      0.033      0.034      0.035      0.035      0.035      0.035      0.035      0.035      0.035      0.036      0.036      0.036      0.036      0.036      0.036      0.035      0.035      0.035      0.035      0.034      0.033      0.032      0.032      0.031      0.031      0.030      0.029      0.030      0.030      0.032      0.033      0.035      0.036      0.038      0.040      0.042      0.043      0.044      0.044      0.044      0.043      0.042      0.040      0.038      0.037      0.035      0.034      0.032      0.031      0.030      0.030      0.031      0.032      0.032      0.033      0.034      0.034      0.036      0.037      0.037      0.037      0.037      0.038      0.038      0.039      0.039      0.039      0.039      0.039      0.039      0.039      0.038      0.038      0.037      0.037      0.038      0.037      0.036
         mach   0.70
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values          0.023      0.023      0.024      0.025      0.025      0.025      0.025      0.025      0.025      0.025      0.025      0.026      0.026      0.026      0.026      0.026      0.025      0.025      0.025      0.025      0.024      0.023      0.023      0.023      0.022      0.021      0.021      0.021      0.021      0.021      0.022      0.023      0.024      0.026      0.027      0.029      0.030      0.031      0.032      0.033      0.032      0.032      0.031      0.029      0.028      0.026      0.025      0.024      0.022      0.022      0.021      0.021      0.022      0.022      0.023      0.024      0.024      0.024      0.026      0.026      0.026      0.026      0.027      0.028      0.028      0.028      0.028      0.028      0.028      0.028      0.028      0.028      0.028      0.027      0.027      0.027      0.027      0.027      0.026
         mach   0.75
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values          0.020      0.020      0.021      0.021      0.021      0.021      0.021      0.021      0.021      0.021      0.022      0.022      0.022      0.022      0.022      0.022      0.021      0.021      0.021      0.021      0.021      0.020      0.019      0.019      0.019      0.017      0.017      0.017      0.017      0.017      0.019      0.019      0.021      0.022      0.023      0.025      0.026      0.027      0.028      0.028      0.028      0.027      0.026      0.025      0.024      0.022      0.021      0.020      0.019      0.018      0.018      0.017      0.018      0.019      0.019      0.020      0.020      0.021      0.022      0.022      0.022      0.022      0.023      0.024      0.024      0.024      0.024      0.024      0.024      0.024      0.024      0.024      0.024      0.024      0.023      0.023      0.023      0.023      0.022
         mach   0.80
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values          0.016      0.017      0.018      0.018      0.018      0.018      0.018      0.018      0.018      0.018      0.019      0.019      0.019      0.019      0.019      0.019      0.018      0.018      0.018      0.018      0.017      0.017      0.016      0.016      0.016      0.015      0.014      0.014      0.014      0.014      0.016      0.016      0.017      0.019      0.020      0.021      0.022      0.024      0.024      0.025      0.025      0.024      0.023      0.022      0.020      0.018      0.018      0.017      0.016      0.015      0.015      0.015      0.015      0.015      0.016      0.017      0.017      0.017      0.019      0.019      0.019      0.019      0.020      0.020      0.021      0.021      0.021      0.021      0.021      0.021      0.021      0.021      0.021      0.020      0.020      0.020      0.020      0.020      0.019
         mach   0.82
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values          0.016      0.016      0.017      0.017      0.017      0.017      0.017      0.017      0.017      0.017      0.018      0.018      0.018      0.018      0.018      0.018      0.017      0.017      0.017      0.017      0.017      0.016      0.015      0.015      0.015      0.014      0.013      0.013      0.013      0.013      0.015      0.015      0.016      0.018      0.019      0.020      0.021      0.022      0.023      0.024      0.024      0.023      0.022      0.021      0.019      0.018      0.017      0.016      0.015      0.014      0.014      0.014      0.014      0.015      0.015      0.016      0.016      0.016      0.018      0.018      0.018      0.018      0.019      0.019      0.020      0.020      0.020      0.020      0.020      0.020      0.020      0.020      0.020      0.019      0.019      0.019      0.019      0.019      0.018
         mach   0.85
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values          0.015      0.015      0.016      0.016      0.016      0.016      0.016      0.016      0.016      0.016      0.016      0.017      0.017      0.017      0.017      0.017      0.016      0.016      0.016      0.016      0.015      0.015      0.014      0.014      0.014      0.013      0.013      0.012      0.013      0.013      0.014      0.014      0.015      0.016      0.017      0.019      0.020      0.021      0.022      0.022      0.022      0.021      0.020      0.019      0.018      0.016      0.016      0.015      0.014      0.013      0.013      0.013      0.013      0.014      0.014      0.015      0.015      0.015      0.017      0.017      0.017      0.017      0.018      0.018      0.018      0.018      0.018      0.018      0.018      0.018      0.018      0.018      0.019      0.018      0.018      0.017      0.018      0.018      0.017
         mach   0.87
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values          0.014      0.014      0.015      0.015      0.015      0.015      0.015      0.015      0.015      0.015      0.016      0.016      0.016      0.016      0.016      0.016      0.015      0.015      0.015      0.015      0.015      0.014      0.013      0.013      0.013      0.012      0.012      0.012      0.012      0.012      0.013      0.013      0.015      0.016      0.017      0.018      0.019      0.020      0.021      0.021      0.021      0.020      0.019      0.018      0.017      0.016      0.015      0.014      0.013      0.013      0.013      0.013      0.013      0.013      0.013      0.014      0.014      0.015      0.016      0.016      0.016      0.016      0.017      0.017      0.017      0.017      0.017      0.017      0.018      0.018      0.018      0.018      0.018      0.017      0.017      0.017      0.017      0.017      0.017
         mach   0.90
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values          0.013      0.013      0.014      0.014      0.014      0.014      0.014      0.014      0.014      0.014      0.015      0.015      0.015      0.015      0.015      0.015      0.014      0.014      0.014      0.014      0.014      0.013      0.013      0.012      0.012      0.011      0.011      0.011      0.011      0.011      0.012      0.012      0.014      0.015      0.015      0.017      0.018      0.019      0.019      0.020      0.020      0.019      0.018      0.017      0.016      0.015      0.014      0.013      0.012      0.012      0.012      0.012      0.012      0.012      0.013      0.013      0.013      0.014      0.015      0.015      0.015      0.015      0.016      0.016      0.016      0.016      0.016      0.016      0.016      0.016      0.016      0.016      0.017      0.016      0.016      0.016      0.016      0.016      0.016
         mach   0.93
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values          0.012      0.012      0.013      0.013      0.013      0.014      0.014      0.013      0.013      0.013      0.014      0.014      0.014      0.014      0.014      0.014      0.013      0.013      0.013      0.013      0.013      0.013      0.012      0.012      0.012      0.011      0.011      0.010      0.011      0.011      0.012      0.012      0.013      0.014      0.015      0.016      0.017      0.018      0.018      0.019      0.018      0.018      0.017      0.016      0.015      0.014      0.014      0.012      0.012      0.011      0.011      0.011      0.011      0.011      0.012      0.013      0.013      0.013      0.014      0.014      0.014      0.014      0.015      0.015      0.015      0.015      0.015      0.015      0.016      0.016      0.016      0.016      0.016      0.015      0.015      0.015      0.015      0.015      0.015
         mach   0.95
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values          0.012      0.012      0.013      0.013      0.013      0.013      0.013      0.013      0.013      0.013      0.013      0.013      0.013      0.013      0.013      0.013      0.013      0.013      0.013      0.012      0.012      0.012      0.011      0.011      0.011      0.010      0.010      0.010      0.010      0.010      0.011      0.011      0.012      0.013      0.014      0.015      0.016      0.017      0.017      0.018      0.018      0.017      0.016      0.015      0.014      0.013      0.013      0.012      0.011      0.011      0.011      0.011      0.011      0.011      0.011      0.012      0.012      0.012      0.013      0.013      0.013      0.014      0.014      0.015      0.015      0.015      0.015      0.015      0.015      0.015      0.015      0.015      0.015      0.015      0.014      0.014      0.014      0.014      0.014
         mach   0.97
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values          0.011      0.011      0.012      0.012      0.012      0.012      0.012      0.012      0.012      0.012      0.012      0.013      0.013      0.013      0.013      0.013      0.012      0.012      0.012      0.012      0.012      0.011      0.011      0.011      0.011      0.010      0.010      0.009      0.010      0.010      0.010      0.011      0.012      0.013      0.013      0.014      0.015      0.016      0.016      0.017      0.017      0.016      0.015      0.015      0.014      0.012      0.012      0.011      0.011      0.010      0.010      0.010      0.010      0.010      0.011      0.011      0.011      0.012      0.013      0.013      0.013      0.013      0.014      0.014      0.014      0.014      0.014      0.014      0.014      0.014      0.014      0.014      0.014      0.014      0.013      0.013      0.013      0.013      0.013
         mach   1.00
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values          0.011      0.011      0.011      0.011      0.012      0.012      0.012      0.012      0.012      0.011      0.012      0.012      0.012      0.012      0.012      0.012      0.011      0.011      0.011      0.011      0.011      0.011      0.010      0.010      0.010      0.009      0.009      0.009      0.009      0.009      0.010      0.010      0.011      0.012      0.012      0.014      0.014      0.015      0.016      0.016      0.016      0.015      0.015      0.014      0.013      0.012      0.012      0.011      0.010      0.010      0.010      0.010      0.010      0.010      0.010      0.011      0.011      0.011      0.012      0.012      0.012      0.012      0.013      0.013      0.013      0.013      0.013      0.013      0.013      0.013      0.013      0.013      0.013      0.013      0.013      0.013      0.013      0.013      0.013
      end_irregular_table
   end_stick_zero_moment_delta_thrust_mach_alpha_table
```

- **演示要点**：演示 stick_zero_moment_delta_thrust_mach_alpha_table 的参数：irregular_table

### stick_zero_moment_delta_xcg_mach_alpha_table（autopilot_support_tables）｜

- **关键词**：stick_zero_moment_delta_xcg_mach_alpha_table, irregular_table
- **出处**：`p6dof/p6dof_types/aircraft/b-fw/controls/autopilot_support_tables.txt:217-262`　（同签名共 28 处，另见 `six_dof/six_dof_types/aircraft/b-fw/controls/autopilot_support_tables.txt:217`、`p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_support_tables.txt:386`、`p6dof/p6dof_types/aircraft/b-hvy/controls/autopilot_support_tables.txt:386`）
- **片段**：

```text
   stick_zero_moment_delta_xcg_mach_alpha_table
      irregular_table
         independent_variable mach precision float
         independent_variable alpha units deg
         dependent_variable precision float
         mach   0.30
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values         -0.852     -0.851     -0.842     -0.848     -0.852     -0.837     -0.822     -0.822     -0.805     -0.787     -0.770     -0.753     -0.734     -0.716     -0.697     -0.679     -0.659     -0.639     -0.608     -0.588     -0.555     -0.523     -0.501     -0.462     -0.438     -0.405     -0.368     -0.345     -0.318     -0.300     -0.275     -0.252     -0.224     -0.199     -0.172     -0.143     -0.110     -0.076     -0.039     -0.001      0.038      0.076      0.111      0.145      0.175      0.204      0.232      0.255      0.280      0.304      0.332      0.362      0.386      0.424      0.459      0.485      0.524      0.548      0.591      0.627      0.648      0.670      0.692      0.734      0.755      0.776      0.797      0.817      0.837      0.856      0.876      0.895      0.912      0.930      0.918      0.934      0.945      0.956      0.960
         mach   0.60
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values         -0.823     -0.804     -0.808     -0.832     -0.817     -0.802     -0.801     -0.785     -0.768     -0.751     -0.734     -0.716     -0.698     -0.680     -0.662     -0.644     -0.625     -0.605     -0.586     -0.557     -0.514     -0.485     -0.464     -0.436     -0.396     -0.367     -0.346     -0.306     -0.298     -0.273     -0.248     -0.232     -0.215     -0.186     -0.167     -0.140     -0.108     -0.075     -0.039     -0.001      0.038      0.076      0.110      0.142      0.170      0.194      0.215      0.243      0.261      0.287      0.304      0.324      0.365      0.389      0.420      0.461      0.491      0.523      0.566      0.599      0.621      0.642      0.692      0.714      0.734      0.755      0.776      0.797      0.816      0.836      0.856      0.875      0.893      0.911      0.890      0.905      0.917      0.929      0.936
         mach   0.70
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values         -0.796     -0.776     -0.779     -0.811     -0.796     -0.781     -0.779     -0.763     -0.746     -0.729     -0.712     -0.695     -0.677     -0.659     -0.641     -0.623     -0.604     -0.586     -0.567     -0.545     -0.518     -0.471     -0.443     -0.424     -0.374     -0.353     -0.326     -0.306     -0.282     -0.257     -0.247     -0.222     -0.207     -0.179     -0.163     -0.138     -0.107     -0.075     -0.039     -0.001      0.038      0.075      0.109      0.139      0.167      0.187      0.217      0.233      0.247      0.272      0.299      0.304      0.347      0.370      0.398      0.451      0.472      0.502      0.551      0.583      0.604      0.624      0.679      0.701      0.722      0.742      0.763      0.784      0.804      0.823      0.843      0.863      0.881      0.899      0.910      0.888      0.900      0.912      0.921
         mach   0.75
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values         -0.772     -0.752     -0.754     -0.793     -0.778     -0.774     -0.759     -0.744     -0.727     -0.710     -0.693     -0.676     -0.658     -0.640     -0.623     -0.605     -0.587     -0.568     -0.550     -0.531     -0.502     -0.451     -0.426     -0.407     -0.379     -0.335     -0.310     -0.291     -0.268     -0.248     -0.241     -0.212     -0.200     -0.184     -0.160     -0.136     -0.105     -0.074     -0.039     -0.001      0.038      0.075      0.108      0.137      0.164      0.182      0.211      0.225      0.236      0.260      0.285      0.292      0.332      0.359      0.380      0.435      0.456      0.484      0.537      0.569      0.589      0.609      0.668      0.689      0.710      0.731      0.751      0.772      0.792      0.812      0.832      0.852      0.870      0.888      0.906      0.872      0.885      0.897      0.907
         mach   0.80
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values         -0.742     -0.732     -0.722     -0.769     -0.754     -0.750     -0.735     -0.719     -0.702     -0.685     -0.668     -0.651     -0.634     -0.617     -0.599     -0.582     -0.564     -0.546     -0.528     -0.510     -0.483     -0.427     -0.403     -0.385     -0.365     -0.313     -0.295     -0.273     -0.254     -0.232     -0.228     -0.204     -0.194     -0.178     -0.155     -0.133     -0.104     -0.074     -0.039     -0.001      0.038      0.075      0.107      0.135      0.162      0.175      0.203      0.214      0.239      0.249      0.269      0.293      0.313      0.338      0.387      0.415      0.435      0.462      0.520      0.550      0.570      0.590      0.653      0.674      0.695      0.716      0.736      0.757      0.777      0.797      0.817      0.837      0.855      0.874      0.892      0.851      0.864      0.877      0.889
         mach   0.82
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values         -0.742     -0.732     -0.722     -0.769     -0.754     -0.750     -0.735     -0.719     -0.702     -0.685     -0.668     -0.651     -0.634     -0.617     -0.599     -0.582     -0.564     -0.546     -0.528     -0.510     -0.483     -0.427     -0.403     -0.385     -0.365     -0.313     -0.295     -0.273     -0.254     -0.232     -0.228     -0.204     -0.194     -0.178     -0.155     -0.133     -0.104     -0.074     -0.039     -0.001      0.038      0.075      0.107      0.135      0.162      0.175      0.203      0.214      0.239      0.249      0.269      0.293      0.313      0.338      0.387      0.415      0.435      0.462      0.520      0.550      0.570      0.590      0.653      0.674      0.695      0.716      0.736      0.757      0.777      0.797      0.817      0.837      0.855      0.874      0.892      0.851      0.864      0.877      0.889
         mach   0.85
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values         -0.742     -0.732     -0.722     -0.769     -0.754     -0.750     -0.735     -0.719     -0.702     -0.685     -0.668     -0.651     -0.634     -0.617     -0.599     -0.582     -0.564     -0.546     -0.528     -0.510     -0.483     -0.427     -0.403     -0.385     -0.365     -0.313     -0.295     -0.273     -0.254     -0.232     -0.228     -0.204     -0.194     -0.178     -0.155     -0.133     -0.104     -0.074     -0.039     -0.001      0.038      0.075      0.107      0.135      0.162      0.175      0.203      0.214      0.239      0.249      0.269      0.293      0.313      0.338      0.387      0.415      0.435      0.462      0.520      0.550      0.570      0.590      0.653      0.674      0.695      0.716      0.736      0.757      0.777      0.797      0.817      0.837      0.855      0.874      0.892      0.851      0.864      0.877      0.889
         mach   0.87
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values         -0.742     -0.732     -0.722     -0.769     -0.754     -0.750     -0.735     -0.719     -0.702     -0.685     -0.668     -0.651     -0.634     -0.617     -0.599     -0.582     -0.564     -0.546     -0.528     -0.510     -0.483     -0.427     -0.403     -0.385     -0.365     -0.313     -0.295     -0.273     -0.254     -0.232     -0.228     -0.204     -0.194     -0.178     -0.155     -0.133     -0.104     -0.074     -0.039     -0.001      0.038      0.075      0.107      0.135      0.162      0.175      0.203      0.214      0.239      0.249      0.269      0.293      0.313      0.338      0.387      0.415      0.435      0.462      0.520      0.550      0.570      0.590      0.653      0.674      0.695      0.716      0.736      0.757      0.777      0.797      0.817      0.837      0.855      0.874      0.892      0.851      0.864      0.877      0.889
         mach   0.90
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values         -0.742     -0.732     -0.722     -0.769     -0.754     -0.750     -0.735     -0.719     -0.702     -0.685     -0.668     -0.651     -0.634     -0.617     -0.599     -0.582     -0.564     -0.546     -0.528     -0.510     -0.483     -0.427     -0.403     -0.385     -0.365     -0.313     -0.295     -0.273     -0.254     -0.232     -0.228     -0.204     -0.194     -0.178     -0.155     -0.133     -0.104     -0.074     -0.039     -0.001      0.038      0.075      0.107      0.135      0.162      0.175      0.203      0.214      0.239      0.249      0.269      0.293      0.313      0.338      0.387      0.415      0.435      0.462      0.520      0.550      0.570      0.590      0.653      0.674      0.695      0.716      0.736      0.757      0.777      0.797      0.817      0.837      0.855      0.874      0.892      0.851      0.864      0.877      0.889
         mach   0.93
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values         -0.742     -0.732     -0.722     -0.769     -0.754     -0.750     -0.735     -0.719     -0.702     -0.685     -0.668     -0.651     -0.634     -0.617     -0.599     -0.582     -0.564     -0.546     -0.528     -0.510     -0.483     -0.427     -0.403     -0.385     -0.365     -0.313     -0.295     -0.273     -0.254     -0.232     -0.228     -0.204     -0.194     -0.178     -0.155     -0.133     -0.104     -0.074     -0.039     -0.001      0.038      0.075      0.107      0.135      0.162      0.175      0.203      0.214      0.239      0.249      0.269      0.293      0.313      0.338      0.387      0.415      0.435      0.462      0.520      0.550      0.570      0.590      0.653      0.674      0.695      0.716      0.736      0.757      0.777      0.797      0.817      0.837      0.855      0.874      0.892      0.851      0.864      0.877      0.889
         mach   0.95
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values         -0.742     -0.732     -0.722     -0.769     -0.754     -0.750     -0.735     -0.719     -0.702     -0.685     -0.668     -0.651     -0.634     -0.617     -0.599     -0.582     -0.564     -0.546     -0.528     -0.510     -0.483     -0.427     -0.403     -0.385     -0.365     -0.313     -0.295     -0.273     -0.254     -0.232     -0.228     -0.204     -0.194     -0.178     -0.155     -0.133     -0.104     -0.074     -0.039     -0.001      0.038      0.075      0.107      0.135      0.162      0.175      0.203      0.214      0.239      0.249      0.269      0.293      0.313      0.338      0.387      0.415      0.435      0.462      0.520      0.550      0.570      0.590      0.653      0.674      0.695      0.716      0.736      0.757      0.777      0.797      0.817      0.837      0.855      0.874      0.892      0.851      0.864      0.877      0.889
         mach   0.97
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values         -0.742     -0.732     -0.722     -0.769     -0.754     -0.750     -0.735     -0.719     -0.702     -0.685     -0.668     -0.651     -0.634     -0.617     -0.599     -0.582     -0.564     -0.546     -0.528     -0.510     -0.483     -0.427     -0.403     -0.385     -0.365     -0.313     -0.295     -0.273     -0.254     -0.232     -0.228     -0.204     -0.194     -0.178     -0.155     -0.133     -0.104     -0.074     -0.039     -0.001      0.038      0.075      0.107      0.135      0.162      0.175      0.203      0.214      0.239      0.249      0.269      0.293      0.313      0.338      0.387      0.415      0.435      0.462      0.520      0.550      0.570      0.590      0.653      0.674      0.695      0.716      0.736      0.757      0.777      0.797      0.817      0.837      0.855      0.874      0.892      0.851      0.864      0.877      0.889
         mach   1.00
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values         -0.742     -0.732     -0.722     -0.769     -0.754     -0.750     -0.735     -0.719     -0.702     -0.685     -0.668     -0.651     -0.634     -0.617     -0.599     -0.582     -0.564     -0.546     -0.528     -0.510     -0.483     -0.427     -0.403     -0.385     -0.365     -0.313     -0.295     -0.273     -0.254     -0.232     -0.228     -0.204     -0.194     -0.178     -0.155     -0.133     -0.104     -0.074     -0.039     -0.001      0.038      0.075      0.107      0.135      0.162      0.175      0.203      0.214      0.239      0.249      0.269      0.293      0.313      0.338      0.387      0.415      0.435      0.462      0.520      0.550      0.570      0.590      0.653      0.674      0.695      0.716      0.736      0.757      0.777      0.797      0.817      0.837      0.855      0.874      0.892      0.851      0.864      0.877      0.889
      end_irregular_table
   end_stick_zero_moment_delta_xcg_mach_alpha_table
```

- **演示要点**：演示 stick_zero_moment_delta_xcg_mach_alpha_table 的参数：irregular_table

### stick_zero_moment_delta_zcg_mach_alpha_table（autopilot_support_tables）｜

- **关键词**：stick_zero_moment_delta_zcg_mach_alpha_table, irregular_table
- **出处**：`p6dof/p6dof_types/aircraft/b-fw/controls/autopilot_support_tables.txt:264-309`　（同签名共 28 处，另见 `six_dof/six_dof_types/aircraft/b-fw/controls/autopilot_support_tables.txt:264`、`p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_support_tables.txt:472`、`p6dof/p6dof_types/aircraft/b-hvy/controls/autopilot_support_tables.txt:472`）
- **片段**：

```text
   stick_zero_moment_delta_zcg_mach_alpha_table
      irregular_table
         independent_variable mach precision float
         independent_variable alpha units deg
         dependent_variable precision float
         mach   0.30
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values          0.170      0.164      0.159      0.157      0.153      0.146      0.139      0.134      0.126      0.118      0.111      0.103      0.095      0.087      0.080      0.073      0.064      0.056      0.047      0.040      0.031      0.022      0.014      0.006     -0.002     -0.009     -0.016     -0.022     -0.024     -0.027     -0.027     -0.026     -0.025     -0.024     -0.023     -0.022     -0.021     -0.020     -0.019     -0.018     -0.019     -0.020     -0.022     -0.023     -0.024     -0.026     -0.027     -0.028     -0.028     -0.028     -0.027     -0.025     -0.017     -0.010     -0.002      0.006      0.015      0.024      0.034      0.044      0.053      0.061      0.070      0.082      0.090      0.098      0.107      0.117      0.125      0.133      0.142      0.152      0.160      0.168      0.171      0.180      0.186      0.192      0.200
         mach   0.60
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values          0.155      0.147      0.145      0.147      0.140      0.133      0.128      0.122      0.114      0.107      0.100      0.093      0.085      0.078      0.070      0.064      0.055      0.047      0.039      0.032      0.022      0.013      0.005     -0.003     -0.010     -0.017     -0.024     -0.029     -0.032     -0.033     -0.032     -0.032     -0.030     -0.028     -0.026     -0.024     -0.022     -0.020     -0.019     -0.018     -0.019     -0.021     -0.023     -0.026     -0.028     -0.030     -0.032     -0.035     -0.036     -0.037     -0.035     -0.033     -0.027     -0.019     -0.012     -0.003      0.005      0.015      0.025      0.036      0.044      0.053      0.064      0.074      0.082      0.091      0.099      0.109      0.117      0.125      0.134      0.143      0.151      0.159      0.162      0.169      0.174      0.179      0.187
         mach   0.70
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values          0.145      0.137      0.135      0.139      0.132      0.125      0.121      0.115      0.107      0.100      0.094      0.087      0.079      0.072      0.065      0.058      0.050      0.042      0.035      0.027      0.018      0.008      0.000     -0.007     -0.014     -0.021     -0.028     -0.034     -0.035     -0.036     -0.036     -0.034     -0.033     -0.029     -0.028     -0.025     -0.023     -0.021     -0.019     -0.018     -0.019     -0.022     -0.024     -0.027     -0.030     -0.033     -0.036     -0.038     -0.039     -0.041     -0.040     -0.036     -0.031     -0.024     -0.016     -0.008      0.000      0.010      0.020      0.031      0.039      0.048      0.060      0.069      0.077      0.086      0.095      0.104      0.112      0.120      0.129      0.138      0.145      0.153      0.162      0.162      0.166      0.172      0.179
         mach   0.75
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values          0.136      0.129      0.127      0.132      0.125      0.121      0.115      0.109      0.102      0.095      0.088      0.082      0.074      0.067      0.060      0.054      0.046      0.038      0.030      0.023      0.014      0.005     -0.003     -0.011     -0.018     -0.024     -0.030     -0.036     -0.037     -0.038     -0.039     -0.036     -0.035     -0.033     -0.029     -0.027     -0.023     -0.021     -0.019     -0.018     -0.020     -0.022     -0.025     -0.028     -0.032     -0.035     -0.039     -0.041     -0.041     -0.043     -0.043     -0.039     -0.035     -0.028     -0.020     -0.012     -0.004      0.005      0.016      0.027      0.035      0.043      0.056      0.065      0.073      0.082      0.090      0.099      0.107      0.115      0.124      0.133      0.140      0.148      0.156      0.155      0.160      0.165      0.172
         mach   0.80
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values          0.125      0.120      0.117      0.123      0.117      0.112      0.106      0.101      0.094      0.087      0.081      0.075      0.068      0.061      0.055      0.048      0.040      0.033      0.025      0.018      0.009      0.000     -0.008     -0.015     -0.023     -0.027     -0.034     -0.039     -0.040     -0.040     -0.041     -0.038     -0.037     -0.035     -0.031     -0.028     -0.024     -0.021     -0.019     -0.018     -0.020     -0.023     -0.026     -0.030     -0.035     -0.037     -0.042     -0.044     -0.047     -0.047     -0.046     -0.046     -0.039     -0.032     -0.026     -0.017     -0.009      0.000      0.010      0.021      0.029      0.038      0.050      0.060      0.068      0.076      0.085      0.094      0.101      0.109      0.118      0.126      0.134      0.141      0.149      0.147      0.151      0.156      0.163
         mach   0.82
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values          0.125      0.120      0.117      0.123      0.117      0.112      0.106      0.101      0.094      0.087      0.081      0.075      0.068      0.061      0.055      0.048      0.040      0.033      0.025      0.018      0.009      0.000     -0.008     -0.015     -0.023     -0.027     -0.034     -0.039     -0.040     -0.040     -0.041     -0.038     -0.037     -0.035     -0.031     -0.028     -0.024     -0.021     -0.019     -0.018     -0.020     -0.023     -0.026     -0.030     -0.035     -0.037     -0.042     -0.044     -0.047     -0.047     -0.046     -0.046     -0.039     -0.032     -0.026     -0.017     -0.009      0.000      0.010      0.021      0.029      0.038      0.050      0.060      0.068      0.076      0.085      0.094      0.101      0.109      0.118      0.126      0.134      0.141      0.149      0.147      0.151      0.156      0.163
         mach   0.85
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values          0.125      0.120      0.117      0.123      0.117      0.112      0.106      0.101      0.094      0.087      0.081      0.075      0.068      0.061      0.055      0.048      0.040      0.033      0.025      0.018      0.009      0.000     -0.008     -0.015     -0.023     -0.027     -0.034     -0.039     -0.040     -0.040     -0.041     -0.038     -0.037     -0.035     -0.031     -0.028     -0.024     -0.021     -0.019     -0.018     -0.020     -0.023     -0.026     -0.030     -0.035     -0.037     -0.042     -0.044     -0.047     -0.047     -0.046     -0.046     -0.039     -0.032     -0.026     -0.017     -0.009      0.000      0.010      0.021      0.029      0.038      0.050      0.060      0.068      0.076      0.085      0.094      0.101      0.109      0.118      0.126      0.134      0.141      0.149      0.147      0.151      0.156      0.163
         mach   0.87
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values          0.125      0.120      0.117      0.123      0.117      0.112      0.106      0.101      0.094      0.087      0.081      0.075      0.068      0.061      0.055      0.048      0.040      0.033      0.025      0.018      0.009      0.000     -0.008     -0.015     -0.023     -0.027     -0.034     -0.039     -0.040     -0.040     -0.041     -0.038     -0.037     -0.035     -0.031     -0.028     -0.024     -0.021     -0.019     -0.018     -0.020     -0.023     -0.026     -0.030     -0.035     -0.037     -0.042     -0.044     -0.047     -0.047     -0.046     -0.046     -0.039     -0.032     -0.026     -0.017     -0.009      0.000      0.010      0.021      0.029      0.038      0.050      0.060      0.068      0.076      0.085      0.094      0.101      0.109      0.118      0.126      0.134      0.141      0.149      0.147      0.151      0.156      0.163
         mach   0.90
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values          0.125      0.120      0.117      0.123      0.117      0.112      0.106      0.101      0.094      0.087      0.081      0.075      0.068      0.061      0.055      0.048      0.040      0.033      0.025      0.018      0.009      0.000     -0.008     -0.015     -0.023     -0.027     -0.034     -0.039     -0.040     -0.040     -0.041     -0.038     -0.037     -0.035     -0.031     -0.028     -0.024     -0.021     -0.019     -0.018     -0.020     -0.023     -0.026     -0.030     -0.035     -0.037     -0.042     -0.044     -0.047     -0.047     -0.046     -0.046     -0.039     -0.032     -0.026     -0.017     -0.009      0.000      0.010      0.021      0.029      0.038      0.050      0.060      0.068      0.076      0.085      0.094      0.101      0.109      0.118      0.126      0.134      0.141      0.149      0.147      0.151      0.156      0.163
         mach   0.93
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values          0.125      0.120      0.117      0.123      0.117      0.112      0.106      0.101      0.094      0.087      0.081      0.075      0.068      0.061      0.055      0.048      0.040      0.033      0.025      0.018      0.009      0.000     -0.008     -0.015     -0.023     -0.027     -0.034     -0.039     -0.040     -0.040     -0.041     -0.038     -0.037     -0.035     -0.031     -0.028     -0.024     -0.021     -0.019     -0.018     -0.020     -0.023     -0.026     -0.030     -0.035     -0.037     -0.042     -0.044     -0.047     -0.047     -0.046     -0.046     -0.039     -0.032     -0.026     -0.017     -0.009      0.000      0.010      0.021      0.029      0.038      0.050      0.060      0.068      0.076      0.085      0.094      0.101      0.109      0.118      0.126      0.134      0.141      0.149      0.147      0.151      0.156      0.163
         mach   0.95
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values          0.125      0.120      0.117      0.123      0.117      0.112      0.106      0.101      0.094      0.087      0.081      0.075      0.068      0.061      0.055      0.048      0.040      0.033      0.025      0.018      0.009      0.000     -0.008     -0.015     -0.023     -0.027     -0.034     -0.039     -0.040     -0.040     -0.041     -0.038     -0.037     -0.035     -0.031     -0.028     -0.024     -0.021     -0.019     -0.018     -0.020     -0.023     -0.026     -0.030     -0.035     -0.037     -0.042     -0.044     -0.047     -0.047     -0.046     -0.046     -0.039     -0.032     -0.026     -0.017     -0.009      0.000      0.010      0.021      0.029      0.038      0.050      0.060      0.068      0.076      0.085      0.094      0.101      0.109      0.118      0.126      0.134      0.141      0.149      0.147      0.151      0.156      0.163
         mach   0.97
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values          0.125      0.120      0.117      0.123      0.117      0.112      0.106      0.101      0.094      0.087      0.081      0.075      0.068      0.061      0.055      0.048      0.040      0.033      0.025      0.018      0.009      0.000     -0.008     -0.015     -0.023     -0.027     -0.034     -0.039     -0.040     -0.040     -0.041     -0.038     -0.037     -0.035     -0.031     -0.028     -0.024     -0.021     -0.019     -0.018     -0.020     -0.023     -0.026     -0.030     -0.035     -0.037     -0.042     -0.044     -0.047     -0.047     -0.046     -0.046     -0.039     -0.032     -0.026     -0.017     -0.009      0.000      0.010      0.021      0.029      0.038      0.050      0.060      0.068      0.076      0.085      0.094      0.101      0.109      0.118      0.126      0.134      0.141      0.149      0.147      0.151      0.156      0.163
         mach   1.00
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values          0.125      0.120      0.117      0.123      0.117      0.112      0.106      0.101      0.094      0.087      0.081      0.075      0.068      0.061      0.055      0.048      0.040      0.033      0.025      0.018      0.009      0.000     -0.008     -0.015     -0.023     -0.027     -0.034     -0.039     -0.040     -0.040     -0.041     -0.038     -0.037     -0.035     -0.031     -0.028     -0.024     -0.021     -0.019     -0.018     -0.020     -0.023     -0.026     -0.030     -0.035     -0.037     -0.042     -0.044     -0.047     -0.047     -0.046     -0.046     -0.039     -0.032     -0.026     -0.017     -0.009      0.000      0.010      0.021      0.029      0.038      0.050      0.060      0.068      0.076      0.085      0.094      0.101      0.109      0.118      0.126      0.134      0.141      0.149      0.147      0.151      0.156      0.163
      end_irregular_table
   end_stick_zero_moment_delta_zcg_mach_alpha_table
```

- **演示要点**：演示 stick_zero_moment_delta_zcg_mach_alpha_table 的参数：irregular_table

### stick_zero_moment_mach_alpha_table（autopilot_support_tables）｜

- **关键词**：stick_zero_moment_mach_alpha_table, irregular_table, independent_variable, dependent_variable, mach
- **出处**：`p6dof/p6dof_types/misc/srb-rato/controls/autopilot_support_tables.txt:61-76`
- **片段**：

```text
   stick_zero_moment_mach_alpha_table
      irregular_table
      independent_variable mach precision float
      independent_variable alpha units deg
      dependent_variable precision float
      mach   0.00
         alpha  -26.00   0.000    26.00
         values -0.828   0.000    0.828
      mach   1.00
         alpha  -26.00   0.000    26.00
         values -0.828   0.000    0.828
      mach  50.00
         alpha  -26.00   0.000    26.00
         values -0.828   0.000    0.828
      end_irregular_table
   end_stick_zero_moment_mach_alpha_table
```

- **演示要点**：演示 stick_zero_moment_mach_alpha_table 的参数：irregular_table, independent_variable, dependent_variable, mach

### stick_zero_moment_mach_alpha_table（autopilot_support_tables）｜

- **关键词**：stick_zero_moment_mach_alpha_table, irregular_table
- **出处**：`p6dof/p6dof_types/aircraft/b-fw/controls/autopilot_support_tables.txt:123-168`　（同签名共 28 处，另见 `six_dof/six_dof_types/aircraft/b-fw/controls/autopilot_support_tables.txt:123`、`p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_support_tables.txt:214`、`p6dof/p6dof_types/aircraft/b-hvy/controls/autopilot_support_tables.txt:214`）
- **片段**：

```text
   stick_zero_moment_mach_alpha_table
      irregular_table
         independent_variable mach precision float
         independent_variable alpha units deg
         dependent_variable precision float
         mach   0.30
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values         -0.558     -0.522     -0.503     -0.485     -0.475     -0.464     -0.453     -0.443     -0.436     -0.430     -0.424     -0.417     -0.418     -0.418     -0.418     -0.418     -0.430     -0.442     -0.453     -0.465     -0.492     -0.518     -0.544     -0.569     -0.598     -0.626     -0.654     -0.681     -0.660     -0.639     -0.591     -0.540     -0.480     -0.418     -0.351     -0.282     -0.212     -0.141     -0.069      0.004      0.077      0.149      0.222      0.292      0.362      0.429      0.492      0.552      0.603      0.651      0.671      0.691      0.661      0.630      0.598      0.566      0.537      0.507      0.477      0.446      0.431      0.416      0.400      0.384      0.380      0.376      0.372      0.368      0.371      0.374      0.377      0.380      0.388      0.395      0.403      0.410      0.427      0.443      0.477
         mach   0.60
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values         -0.546     -0.512     -0.494     -0.477     -0.467     -0.456     -0.446     -0.436     -0.429     -0.423     -0.417     -0.411     -0.411     -0.411     -0.411     -0.411     -0.422     -0.433     -0.444     -0.455     -0.480     -0.504     -0.528     -0.551     -0.577     -0.603     -0.628     -0.652     -0.633     -0.614     -0.569     -0.523     -0.467     -0.409     -0.345     -0.279     -0.211     -0.140     -0.069      0.004      0.077      0.149      0.221      0.290      0.357      0.421      0.481      0.538      0.584      0.629      0.648      0.666      0.639      0.610      0.582      0.553      0.525      0.498      0.469      0.440      0.426      0.411      0.396      0.381      0.377      0.373      0.370      0.366      0.369      0.372      0.375      0.378      0.385      0.393      0.400      0.407      0.423      0.440      0.472
         mach   0.70
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values         -0.541     -0.507     -0.490     -0.473     -0.463     -0.453     -0.442     -0.432     -0.426     -0.420     -0.414     -0.408     -0.408     -0.408     -0.408     -0.408     -0.418     -0.429     -0.439     -0.450     -0.474     -0.497     -0.519     -0.542     -0.567     -0.590     -0.614     -0.637     -0.618     -0.600     -0.558     -0.513     -0.460     -0.403     -0.342     -0.277     -0.210     -0.140     -0.069      0.004      0.077      0.149      0.220      0.288      0.355      0.417      0.475      0.529      0.574      0.617      0.635      0.652      0.626      0.600      0.573      0.545      0.519      0.493      0.465      0.437      0.423      0.409      0.394      0.379      0.376      0.372      0.369      0.365      0.368      0.371      0.374      0.377      0.384      0.392      0.399      0.406      0.422      0.439      0.471
         mach   0.75
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values         -0.536     -0.503     -0.486     -0.469     -0.459     -0.449     -0.439     -0.429     -0.423     -0.417     -0.411     -0.405     -0.405     -0.405     -0.405     -0.405     -0.415     -0.425     -0.435     -0.445     -0.468     -0.491     -0.512     -0.533     -0.557     -0.580     -0.602     -0.624     -0.606     -0.589     -0.548     -0.505     -0.453     -0.399     -0.339     -0.275     -0.209     -0.139     -0.069      0.004      0.077      0.149      0.219      0.287      0.352      0.413      0.470      0.522      0.566      0.607      0.624      0.641      0.616      0.591      0.566      0.538      0.513      0.488      0.461      0.434      0.420      0.407      0.393      0.378      0.375      0.371      0.368      0.364      0.367      0.370      0.373      0.376      0.384      0.391      0.399      0.406      0.422      0.438      0.469
         mach   0.80
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values         -0.529     -0.498     -0.482     -0.465     -0.455     -0.445     -0.435     -0.425     -0.419     -0.413     -0.407     -0.401     -0.401     -0.401     -0.401     -0.401     -0.410     -0.420     -0.429     -0.439     -0.461     -0.483     -0.503     -0.523     -0.546     -0.567     -0.588     -0.608     -0.592     -0.575     -0.536     -0.495     -0.445     -0.393     -0.335     -0.273     -0.208     -0.139     -0.068      0.004      0.077      0.149      0.219      0.286      0.349      0.409      0.463      0.514      0.555      0.594      0.611      0.627      0.604      0.580      0.556      0.530      0.507      0.483      0.457      0.430      0.417      0.404      0.390      0.376      0.373      0.370      0.366      0.363      0.366      0.369      0.372      0.375      0.383      0.390      0.398      0.405      0.421      0.436      0.468
         mach   0.82
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values         -0.529     -0.498     -0.482     -0.465     -0.455     -0.445     -0.435     -0.425     -0.419     -0.413     -0.407     -0.401     -0.401     -0.401     -0.401     -0.401     -0.410     -0.420     -0.429     -0.439     -0.461     -0.483     -0.503     -0.523     -0.546     -0.567     -0.588     -0.608     -0.592     -0.575     -0.536     -0.495     -0.445     -0.393     -0.335     -0.273     -0.208     -0.139     -0.068      0.004      0.077      0.149      0.219      0.286      0.349      0.409      0.463      0.514      0.555      0.594      0.611      0.627      0.604      0.580      0.556      0.530      0.507      0.483      0.457      0.430      0.417      0.404      0.390      0.376      0.373      0.370      0.366      0.363      0.366      0.369      0.372      0.375      0.383      0.390      0.398      0.405      0.421      0.436      0.468
         mach   0.85
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values         -0.529     -0.498     -0.482     -0.465     -0.455     -0.445     -0.435     -0.425     -0.419     -0.413     -0.407     -0.401     -0.401     -0.401     -0.401     -0.401     -0.410     -0.420     -0.429     -0.439     -0.461     -0.483     -0.503     -0.523     -0.546     -0.567     -0.588     -0.608     -0.592     -0.575     -0.536     -0.495     -0.445     -0.393     -0.335     -0.273     -0.208     -0.139     -0.068      0.004      0.077      0.149      0.219      0.286      0.349      0.409      0.463      0.514      0.555      0.594      0.611      0.627      0.604      0.580      0.556      0.530      0.507      0.483      0.457      0.430      0.417      0.404      0.390      0.376      0.373      0.370      0.366      0.363      0.366      0.369      0.372      0.375      0.383      0.390      0.398      0.405      0.421      0.436      0.468
         mach   0.87
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values         -0.529     -0.498     -0.482     -0.465     -0.455     -0.445     -0.435     -0.425     -0.419     -0.413     -0.407     -0.401     -0.401     -0.401     -0.401     -0.401     -0.410     -0.420     -0.429     -0.439     -0.461     -0.483     -0.503     -0.523     -0.546     -0.567     -0.588     -0.608     -0.592     -0.575     -0.536     -0.495     -0.445     -0.393     -0.335     -0.273     -0.208     -0.139     -0.068      0.004      0.077      0.149      0.219      0.286      0.349      0.409      0.463      0.514      0.555      0.594      0.611      0.627      0.604      0.580      0.556      0.530      0.507      0.483      0.457      0.430      0.417      0.404      0.390      0.376      0.373      0.370      0.366      0.363      0.366      0.369      0.372      0.375      0.383      0.390      0.398      0.405      0.421      0.436      0.468
         mach   0.90
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values         -0.529     -0.498     -0.482     -0.465     -0.455     -0.445     -0.435     -0.425     -0.419     -0.413     -0.407     -0.401     -0.401     -0.401     -0.401     -0.401     -0.410     -0.420     -0.429     -0.439     -0.461     -0.483     -0.503     -0.523     -0.546     -0.567     -0.588     -0.608     -0.592     -0.575     -0.536     -0.495     -0.445     -0.393     -0.335     -0.273     -0.208     -0.139     -0.068      0.004      0.077      0.149      0.219      0.286      0.349      0.409      0.463      0.514      0.555      0.594      0.611      0.627      0.604      0.580      0.556      0.530      0.507      0.483      0.457      0.430      0.417      0.404      0.390      0.376      0.373      0.370      0.366      0.363      0.366      0.369      0.372      0.375      0.383      0.390      0.398      0.405      0.421      0.436      0.468
         mach   0.93
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values         -0.529     -0.498     -0.482     -0.465     -0.455     -0.445     -0.435     -0.425     -0.419     -0.413     -0.407     -0.401     -0.401     -0.401     -0.401     -0.401     -0.410     -0.420     -0.429     -0.439     -0.461     -0.483     -0.503     -0.523     -0.546     -0.567     -0.588     -0.608     -0.592     -0.575     -0.536     -0.495     -0.445     -0.393     -0.335     -0.273     -0.208     -0.139     -0.068      0.004      0.077      0.149      0.219      0.286      0.349      0.409      0.463      0.514      0.555      0.594      0.611      0.627      0.604      0.580      0.556      0.530      0.507      0.483      0.457      0.430      0.417      0.404      0.390      0.376      0.373      0.370      0.366      0.363      0.366      0.369      0.372      0.375      0.383      0.390      0.398      0.405      0.421      0.436      0.468
         mach   0.95
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values         -0.529     -0.498     -0.482     -0.465     -0.455     -0.445     -0.435     -0.425     -0.419     -0.413     -0.407     -0.401     -0.401     -0.401     -0.401     -0.401     -0.410     -0.420     -0.429     -0.439     -0.461     -0.483     -0.503     -0.523     -0.546     -0.567     -0.588     -0.608     -0.592     -0.575     -0.536     -0.495     -0.445     -0.393     -0.335     -0.273     -0.208     -0.139     -0.068      0.004      0.077      0.149      0.219      0.286      0.349      0.409      0.463      0.514      0.555      0.594      0.611      0.627      0.604      0.580      0.556      0.530      0.507      0.483      0.457      0.430      0.417      0.404      0.390      0.376      0.373      0.370      0.366      0.363      0.366      0.369      0.372      0.375      0.383      0.390      0.398      0.405      0.421      0.436      0.468
         mach   0.97
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values         -0.529     -0.498     -0.482     -0.465     -0.455     -0.445     -0.435     -0.425     -0.419     -0.413     -0.407     -0.401     -0.401     -0.401     -0.401     -0.401     -0.410     -0.420     -0.429     -0.439     -0.461     -0.483     -0.503     -0.523     -0.546     -0.567     -0.588     -0.608     -0.592     -0.575     -0.536     -0.495     -0.445     -0.393     -0.335     -0.273     -0.208     -0.139     -0.068      0.004      0.077      0.149      0.219      0.286      0.349      0.409      0.463      0.514      0.555      0.594      0.611      0.627      0.604      0.580      0.556      0.530      0.507      0.483      0.457      0.430      0.417      0.404      0.390      0.376      0.373      0.370      0.366      0.363      0.366      0.369      0.372      0.375      0.383      0.390      0.398      0.405      0.421      0.436      0.468
         mach   1.00
            alpha         -20.000    -19.000    -18.500    -18.000    -17.500    -17.000    -16.500    -16.000    -15.500    -15.000    -14.500    -14.000    -13.500    -13.000    -12.500    -12.000    -11.500    -11.000    -10.500    -10.000     -9.500     -9.000     -8.500     -8.000     -7.500     -7.000     -6.500     -6.000     -5.500     -5.000     -4.500     -4.000     -3.500     -3.000     -2.500     -2.000     -1.500     -1.000     -0.500      0.000      0.500      1.000      1.500      2.000      2.500      3.000      3.500      4.000      4.500      5.000      5.500      6.000      6.500      7.000      7.500      8.000      8.500      9.000      9.500     10.000     10.500     11.000     11.500     12.000     12.500     13.000     13.500     14.000     14.500     15.000     15.500     16.000     16.500     17.000     17.500     18.000     18.500     19.000     20.000
            values         -0.529     -0.498     -0.482     -0.465     -0.455     -0.445     -0.435     -0.425     -0.419     -0.413     -0.407     -0.401     -0.401     -0.401     -0.401     -0.401     -0.410     -0.420     -0.429     -0.439     -0.461     -0.483     -0.503     -0.523     -0.546     -0.567     -0.588     -0.608     -0.592     -0.575     -0.536     -0.495     -0.445     -0.393     -0.335     -0.273     -0.208     -0.139     -0.068      0.004      0.077      0.149      0.219      0.286      0.349      0.409      0.463      0.514      0.555      0.594      0.611      0.627      0.604      0.580      0.556      0.530      0.507      0.483      0.457      0.430      0.417      0.404      0.390      0.376      0.373      0.370      0.366      0.363      0.366      0.369      0.372      0.375      0.383      0.390      0.398      0.405      0.421      0.436      0.468
      end_irregular_table
   end_stick_zero_moment_mach_alpha_table
```

- **演示要点**：演示 stick_zero_moment_mach_alpha_table 的参数：irregular_table

### table（hellfire_type）｜

- **关键词**：table, probability_of_damage_given_proximity_hit, probability_of_mk_given_damage, probability_of_fk_given_damage, probability_of_kk_given_damage
- **出处**：`hellfire/active_radar_hellfire/hellfire_type.txt:224-229`　（同签名共 3 处，另见 `hellfire/laser_designation_via_dis/hellfire_type.txt:277`、`hellfire/semiactive_laser_hellfire/hellfire_type.txt:276`）
- **片段**：

```text
  table default
     probability_of_damage_given_proximity_hit 0.80
     probability_of_mk_given_damage            0.20
     probability_of_fk_given_damage            0.20
     probability_of_kk_given_damage            0.50
  end_table
```

- **演示要点**：演示 table 的参数：probability_of_damage_given_proximity_hit, probability_of_mk_given_damage, probability_of_fk_given_damage, probability_of_kk_given_damage

### table_data（flight_controls）｜

- **关键词**：table_data, irregular_table
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:22-37`　（同签名共 30 处，另见 `p6dof/p6dof_types/aircraft/b-fw/controls/flight_controls.txt:22`、`p6dof/p6dof_types/aircraft/b-hvy/controls/flight_controls.txt:22`、`p6dof/p6dof_types/aircraft/c-hvy/controls/flight_controls.txt:22`）
- **片段**：

```text
   table_data
      irregular_table
         independent_variable control_value precision float
         independent_variable input         precision float
         dependent_variable                 precision float
         control_value 0.0
            input -1.0 -0.5  0.0  0.5  1.0
            values -0.8 -0.4  0.0  0.4  0.8
         control_value 1.0
            input -1.0 -0.5  0.0  0.5  1.0
            values -0.8 -0.4  0.0  0.4  0.8
         control_value 2.0
            input -1.0 -0.5  0.0  0.5  1.0
            values -0.8 -0.4  0.0  0.4  0.8
      end_irregular_table
   end_table_data
```

- **演示要点**：演示 table_data 的参数：irregular_table

### temperature_altitude_table（atm_config）｜

- **关键词**：temperature_altitude_table
- **出处**：`p6dof/p6dof_types/environment/atm_config.txt:595-881`
- **片段**：

```text
temperature_altitude_table
# altitude_ft  rankine_deg
0           518.67
1000        515.10
2000        511.54
3000        507.97
4000        504.41
5000        500.84
6000        497.27
7000        493.71
8000        490.14
9000        486.58
10000       483.01
11000       479.44
12000       475.88
13000       472.31
14000       468.74
15000       465.18
16000       461.61
17000       458.05
18000       454.48
19000       450.91
20000       447.35
21000       443.78
22000       440.21
23000       436.65
24000       433.08
25000       429.52
26000       425.95
27000       422.38
28000       418.82
29000       415.25
30000       411.69
31000       408.12
32000       404.55
33000       400.99
34000       397.42
35000       393.85
36000       390.29
37000       389.97
38000       389.97
39000       389.97
40000       389.97
41000       389.97
42000       389.97
43000       389.97
44000       389.97
45000       389.97
46000       389.97
47000       389.97
48000       389.97
49000       389.97
50000       389.97
51000       389.97
52000       389.97
53000       389.97
54000       389.97
55000       389.97
56000       389.97
57000       389.97
58000       389.97
59000       389.97
60000       389.97
61000       389.97
62000       389.97
63000       389.97
64000       389.97
65000       389.97
66000       390.18
67000       390.73
68000       391.28
69000       391.83
70000       392.38
71000       392.92
72000       393.47
73000       394.02
74000       394.57
75000       395.12
76000       395.67
77000       396.22
78000       396.76
79000       397.31
80000       397.86
81000       398.41
82000       398.96
83000       399.51
84000       400.06
85000       400.60
86000       401.15
87000       401.70
88000       402.25
89000       402.80
90000       403.35
91000       403.90
92000       404.45
93000       404.99
94000       405.54
95000       406.09
96000       406.64
97000       407.19
98000       407.74
99000       408.29
100000      408.83
101000      409.38
102000      409.93
103000      410.48
104000      411.03
105000      411.59
106000      413.13
107000      414.66
108000      416.20
109000      417.74
110000      419.27
111000      420.81
112000      422.34
113000      423.88
114000      425.42
115000      426.95
116000      428.49
117000      430.02
118000      431.56
119000      433.10
120000      434.63
121000      436.17
122000      437.71
123000      439.24
124000      440.78
125000      442.31
126000      443.85
127000      445.39
128000      446.92
129000      448.46
130000      450.00
131000      451.53
132000      453.07
133000      454.60
134000      456.14
135000      457.68
136000      459.21
137000      460.75
138000      462.28
139000      463.82
140000      465.36
141000      466.89
142000      468.43
143000      469.97
144000      471.50
145000      473.04
146000      474.57
147000      476.11
148000      477.65
149000      479.18
150000      480.72
151000      482.26
152000      483.79
153000      485.33
154000      486.86
155000      487.17
156000      487.17
157000      487.17
158000      487.17
159000      487.17
160000      487.17
161000      487.17
162000      487.17
163000      487.17
164000      487.17
165000      487.17
166000      487.17
167000      487.17
168000      486.13
169000      484.59
170000      483.06
171000      481.52
172000      479.99
173000      478.45
174000      476.91
175000      475.38
176000      473.84
177000      472.30
178000      470.77
179000      469.23
180000      467.70
181000      466.16
182000      464.62
183000      463.09
184000      461.55
185000      460.01
186000      458.48
187000      456.94
188000      455.41
189000      453.87
190000      452.33
191000      450.80
192000      449.26
193000      447.73
194000      446.19
195000      444.65
196000      443.12
197000      441.58
198000      440.04
199000      438.51
200000      436.97
201000      435.44
202000      433.90
203000      432.36
204000      430.83
205000      429.29
206000      427.75
207000      426.22
208000      424.68
209000      423.15
210000      421.61
211000      420.07
212000      418.54
213000      417.00
214000      415.47
215000      413.93
216000      412.39
217000      410.86
218000      409.32
219000      407.78
220000      406.25
221000      404.71
222000      403.18
223000      401.64
224000      400.10
225000      398.57
226000      397.03
227000      395.49
228000      393.96
229000      392.42
230000      390.89
231000      389.35
232000      387.81
233000      386.30
234000      385.21
235000      384.11
236000      383.01
237000      381.92
238000      380.82
239000      379.72
240000      378.62
241000      377.53
242000      376.43
243000      375.33
244000      374.23
245000      373.14
246000      372.04
247000      370.94
248000      369.85
249000      368.75
250000      367.65
251000      366.55
252000      365.46
253000      364.36
254000      363.26
255000      362.16
256000      361.07
257000      359.97
258000      358.87
259000      357.77
260000      356.68
261000      355.58
262000      354.48
263000      353.39
264000      352.29
265000      351.19
266000      350.09
267000      349.00
268000      347.90
269000      346.80
270000      345.70
271000      344.61
272000      343.51
273000      342.41
274000      341.32
275000      340.22
276000      339.12
277000      338.02
278000      336.93
279000      336.50
280000      336.50
281000      336.50
282000      336.50
400000      336.50
end_temperature_altitude_table
```

- **演示要点**：演示 temperature_altitude_table（最小结构，无子参数）

### yaw_control_mapping_table（control_inputs_pm6）｜

- **关键词**：yaw_control_mapping_table
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/control_inputs_pm6.txt:19-31`　（同签名共 18 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/controls/control_inputs.txt:77`、`p6dof/p6dof_types/aircraft/b-fw/controls/control_inputs.txt:77`、`p6dof/p6dof_types/aircraft/b-hvy/controls/control_inputs.txt:77`）
- **片段**：

```text
      yaw_control_mapping_table
         -1.00   -1.00
         -0.90   -0.75
         -0.75   -0.45
         -0.50   -0.15
         -0.25   -0.05
          0.00    0.00
          0.25    0.05
          0.50    0.15
          0.75    0.45
          0.90    0.75
          1.00    1.00
      end_yaw_control_mapping_table
```

- **演示要点**：演示 yaw_control_mapping_table（最小结构，无子参数）
