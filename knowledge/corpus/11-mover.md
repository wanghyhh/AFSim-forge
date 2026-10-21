# 运动 / 制导 / 飞控（含 6DOF 控制积木）

> **来源**：AFSIM 2.9.0 官方 demo 集（`demos/`，4,751 个 `.txt`，132 万行）
> **性质**：原文摘抄，未改写。同一「参数签名」只保留 1 条代表，并注明出现次数与另见位置
> **警示**：片段中数值为 demo 原值，**仅供语法参考，不得直接复用**；依赖 `common/` 数据表的片段须另行提供
> **检索**：按命令 / 类型名 / 参数名搜本卷；总表见 `90-tokens.md`

### actuator（flight_controls）｜

- **关键词**：actuator, max_positive_rate, max_negative_rate, max_angle, min_angle, current_angle
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:184-190`　（同签名共 180 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:209`、`p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:234`、`p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:259`）
- **片段**：

```text
   actuator
      max_positive_rate     40.00 deg/sec
      max_negative_rate    -40.00 deg/sec
      max_angle             20.00 deg
      min_angle            -20.00 deg
      current_angle          0.00 deg
   end_actuator
```

- **演示要点**：演示 actuator 的参数：max_positive_rate, max_negative_rate, max_angle, min_angle, current_angle

### aero · WSF_AERO｜

- **关键词**：aero, WSF_AERO, cd_zero_subsonic, cd_zero_supersonic, mach_begin_cd_rise, mach_end_cd_rise, mach_max_supersonic, reference_area, cl_max, aspect_ratio, oswalds_factor, lift_curve_slope
- **出处**：`hellfire/active_radar_hellfire/hellfire_type.txt:76-87`　（同签名共 4 处，另见 `hellfire/laser_designation_via_dis/hellfire_type.txt:71`、`hellfire/semiactive_laser_hellfire/hellfire_type.txt:70`、`laser_designator/weapons/agm/hellfire.txt:9`）
- **片段**：

```text
aero HELLFIRE_AERO WSF_AERO
   cd_zero_subsonic    0.290
   cd_zero_supersonic  0.835
   mach_begin_cd_rise  0.500
   mach_end_cd_rise    1.400
   mach_max_supersonic 2.000
   reference_area      0.267 ft2 # 7.0 in body dia
   cl_max              2.5       # arbitrary, at 12 deg alpha = f(fin defl)
   aspect_ratio        0.863     # from aero data on hand.
   oswalds_factor      0.9       # unknown
   lift_curve_slope   11.9       # CL = 2.5 at 12 deg = 2.5 / (12/57.3) = 11.9 per radian
end_aero
```

- **演示要点**：演示 WSF_AERO 的参数：cd_zero_subsonic, cd_zero_supersonic, mach_begin_cd_rise, mach_end_cd_rise, mach_max_supersonic, reference_area, cl_max, aspect_ratio, oswalds_factor, lift_curve_slope

### aero · WSF_AERO｜

- **关键词**：aero, WSF_AERO, cd_zero_subsonic, cd_zero_supersonic, mach_begin_cd_rise, mach_end_cd_rise, mach_max_supersonic, reference_area, cl_max, aspect_ratio, oswalds_factor
- **出处**：`alternate_locations/weapons/agm/blue_glide_bomb_1.txt:14-24`　（同签名共 9 处，另见 `alv_routing/platforms/alv.txt:17`、`alv_routing/platforms/alv.txt:29`、`iads/weapons/agm/blue_glide_bomb_1.txt:22`）
- **片段**：

```text
aero BLUE_GLIDE_BOMB_1_AERO WSF_AERO
  cd_zero_subsonic    0.150
  cd_zero_supersonic  0.220
  mach_begin_cd_rise  0.850
  mach_end_cd_rise    1.150
  mach_max_supersonic 2.000
  reference_area      0.028 m2 
  cl_max              7.00
  aspect_ratio        14.000
  oswalds_factor      0.95
end_aero
```

- **演示要点**：演示 WSF_AERO 的参数：cd_zero_subsonic, cd_zero_supersonic, mach_begin_cd_rise, mach_end_cd_rise, mach_max_supersonic, reference_area, cl_max, aspect_ratio, oswalds_factor

### aero · WSF_AERO｜

- **关键词**：aero, WSF_AERO, reference_area, cd_zero_subsonic, cd_zero_supersonic, mach_begin_cd_rise, mach_end_cd_rise, mach_max_supersonic, cl_max, aspect_ratio
- **出处**：`base_types/weapons/agm/blue_adv_cruise_missile.txt:36-45`　（同签名共 64 处，另见 `base_types/weapons/agm/blue_adv_cruise_missile.txt:47`、`base_types/weapons/ssm/blue_cruise_missile.txt:27`、`cyber/weapons/agm/blue_gps_bomb_1.txt:16`）
- **片段**：

```text
aero BLUE_ADV_CRUISE_MISSILE_WINGS_FOLDED WSF_AERO #used for initial drop from aircraft
  reference_area      169 in2 #13x13box
  cd_zero_subsonic    0.100
  cd_zero_supersonic  0.40
  mach_begin_cd_rise  0.800
  mach_end_cd_rise    1.200
  mach_max_supersonic 2.000
  cl_max              3.00    # unknown
  aspect_ratio        4.000    # unknown
end_aero
```

- **演示要点**：演示 WSF_AERO 的参数：reference_area, cd_zero_subsonic, cd_zero_supersonic, mach_begin_cd_rise, mach_end_cd_rise, mach_max_supersonic, cl_max, aspect_ratio

### aero · WSF_AERO｜

- **关键词**：aero, WSF_AERO, cd_zero_subsonic, cd_zero_supersonic, mach_begin_cd_rise, mach_end_cd_rise, supersonic_cd_slope, mach_max_supersonic, reference_area, cl_max
- **出处**：`ship_ad/weapons/sam/red_sr_naval_sam_1.txt:23-33`　（同签名共 3 处，另见 `ship_ad/weapons/sam/red_sr_sam_2.txt:26`、`ship_ad/weapons/ssm/ssm_missile.txt:16`）
- **片段**：

```text
aero RED_SR_NAVAL_SAM_1_AERO WSF_AERO
  # Values estimated from Hoerner's Drag book
   cd_zero_subsonic    0.30
   cd_zero_supersonic  0.50
   mach_begin_cd_rise  0.95
   mach_end_cd_rise    1.3
   supersonic_cd_slope -0.15     # required to reach max range
   mach_max_supersonic 3.0       # Ref 2
   reference_area      0.126 m2  # Ref 2 400mm body dia
   cl_max              3.5
end_aero
```

- **演示要点**：演示 WSF_AERO 的参数：cd_zero_subsonic, cd_zero_supersonic, mach_begin_cd_rise, mach_end_cd_rise, supersonic_cd_slope, mach_max_supersonic, reference_area, cl_max

### aero · WSF_AERO｜

- **关键词**：aero, WSF_AERO, reference_area, cd_zero_subsonic, subsonic_cd_slope, mach_begin_cd_rise, cd_zero_supersonic, mach_end_cd_rise, mach_max_supersonic, supersonic_cd_slope
- **出处**：`space_operations/launch_vehicles/delta_iv_m/delta_iv_m_base.txt:19-30`
- **片段**：

```text
aero DELTA_IV_M_STAGE_1_AERO WSF_AERO
   reference_area            19.63 m^2           # 5 m diameter

   # Follow is a really rough Saturn IV. (www.braeunig.us/apollo/Saturn5.htm)
   cd_zero_subsonic          0.27
   subsonic_cd_slope         0.0
   mach_begin_cd_rise        0.8
   cd_zero_supersonic        0.55
   mach_end_cd_rise          1.4
   mach_max_supersonic       4.5       # Cd is about 0.2 here
   supersonic_cd_slope       0.3871    # (0.2 - 1.4) / (4.5 - 1.4)
end_aero
```

- **演示要点**：演示 WSF_AERO 的参数：reference_area, cd_zero_subsonic, subsonic_cd_slope, mach_begin_cd_rise, cd_zero_supersonic, mach_end_cd_rise, mach_max_supersonic, supersonic_cd_slope

### aero · WSF_AERO｜

- **关键词**：aero, WSF_AERO, cd_zero_subsonic, cd_zero_supersonic, mach_begin_cd_rise, mach_end_cd_rise, mach_max_supersonic, reference_area, cl_max
- **出处**：`electronic_warfare/track_error.txt:56-64`　（同签名共 4 处，另见 `launcher/weapons/sam/sam_missile.txt:12`、`ship_ad/weapons/sam/red_sr_sam_1.txt:23`、`shooter/weapons/aam/aa_mrm.txt:108`）
- **片段**：

```text
aero SAM_MISSILE_AERO WSF_AERO
   cd_zero_subsonic    0.30
   cd_zero_supersonic  0.50
   mach_begin_cd_rise  0.95
   mach_end_cd_rise    1.3
   mach_max_supersonic 2.3
   reference_area      0.017 m2
   cl_max              3.5
end_aero
```

- **演示要点**：演示 WSF_AERO 的参数：cd_zero_subsonic, cd_zero_supersonic, mach_begin_cd_rise, mach_end_cd_rise, mach_max_supersonic, reference_area, cl_max

### aero · WSF_AERO｜

- **关键词**：aero, WSF_AERO, reference_area, cd_zero_subsonic, cd_zero_supersonic, mach_begin_cd_rise, mach_end_cd_rise, mach_max_supersonic
- **出处**：`ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:45-53`　（同签名共 14 处，另见 `ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:54`、`ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:63`、`ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:72`）
- **片段**：

```text
aero                   BLUE_NAVAL_SAM_STAGE_1_AERO WSF_AERO
   reference_area            2.35 ft^2
   # Values estimated from Hoerner's Drag book
   cd_zero_subsonic          0.10
   cd_zero_supersonic        0.25
   mach_begin_cd_rise        0.95
   mach_end_cd_rise          1.30
   mach_max_supersonic       10.00
end_aero
```

- **演示要点**：演示 WSF_AERO 的参数：reference_area, cd_zero_subsonic, cd_zero_supersonic, mach_begin_cd_rise, mach_end_cd_rise, mach_max_supersonic

### aero · WSF_AERO｜

- **关键词**：aero, WSF_AERO, mach_and_cd, reference_area, cl_max, aspect_ratio, oswalds_factor
- **出处**：`air_to_air/weapons/aam/medium_range_radar_missile.txt:95-111`　（同签名共 5 处，另见 `air_to_air/weapons/aam/short_range_ir_missile.txt:94`、`base_types/weapons/aam/blue_sr_a2a_ir_missile.txt:29`、`behavior_tree/weapons/aam/blue_sr_a2a_ir_missile.txt:30`）
- **片段**：

```text
aero MRM_AERO WSF_AERO
   // NAS - made up some values
   mach_and_cd    0.0 .15 
   mach_and_cd    0.8 .2 
   mach_and_cd    1.0 .27
   mach_and_cd    1.2 .25  
   mach_and_cd    1.5 .23  

   reference_area 49 in2 # Generic medium-range missile 7.0 in body dia

   cl_max 10.0 # Experimentally set, to cause approx 30G max turn rate

   # Note:  Pi * AR * e = 50 => AR = 50 / Pi / e = 17.7 # ref Steve Knapp
   aspect_ratio   17.7
   oswalds_factor  0.9 # Approximate Guess

end_aero
```

- **演示要点**：演示 WSF_AERO 的参数：mach_and_cd, reference_area, cl_max, aspect_ratio, oswalds_factor

### aero · WSF_AERO｜

- **关键词**：aero, WSF_AERO, reference_area, aspect_ratio, cl_max, zero_lift_cd
- **出处**：`ballistic_missile_shootdown/weapons/ssm/red_mrbm_1.txt:91-96`　（同签名共 18 处，另见 `ballistic_missile_shootdown/weapons/ssm/red_mrbm_1.txt:131`、`base_types/weapons/ssm/red_icbm_2.txt:51`、`base_types/weapons/ssm/red_icbm_2.txt:91`）
- **片段**：

```text
aero RED_MRBM_1_SPENT_STAGE_1_AERO WSF_AERO          # TODO
   reference_area            16.62 ft^2
   aspect_ratio              1.0
   cl_max                    5.0
   zero_lift_cd              0.7
end_aero
```

- **演示要点**：演示 WSF_AERO 的参数：reference_area, aspect_ratio, cl_max, zero_lift_cd

### aero · WSF_AERO｜

- **关键词**：aero, WSF_AERO, reference_area, mach_and_cd, aspect_ratio, cl_max
- **出处**：`base_types/weapons/agm/mach_4_missile.txt:16-28`　（同签名共 11 处，另见 `new_guidance/weapons/ssm/ssm_missile.txt:15`、`base_types/weapons/agm/mach_4_missile.txt:30`、`base_types/weapons/ssm/typical_ballistic_missile_aero.txt:35`）
- **片段**：

```text
aero MACH_4_MISSILE_BOOST_AERO WSF_AERO
   reference_area            63.62 in2
   mach_and_cd               0.1  0.3258
   mach_and_cd               0.6  0.3258
   mach_and_cd               0.9  0.3554
   mach_and_cd               1.05 0.5718
   mach_and_cd               1.3  0.5994
   mach_and_cd               1.51  0.5824
   mach_and_cd               1.97  0.5639
   mach_and_cd               2.47  0.5448
   aspect_ratio              4.5
   cl_max                    2.669
end_aero
```

- **演示要点**：演示 WSF_AERO 的参数：reference_area, mach_and_cd, aspect_ratio, cl_max

### aero · WSF_AERO｜

- **关键词**：aero, WSF_AERO, reference_area, zero_lift_cd, cl_max
- **出处**：`parachute/parachute_example2.txt:10-15`　（同签名共 2 处，另见 `parachute/parachute_example2.txt:17`）
- **片段**：

```text
aero free_fall  WSF_AERO
   reference_area      0.1 m^2
   zero_lift_cd        0.5
   cl_max             0.25    # unknown
   //aspect_ratio        1.000    # unknown
end_aero
```

- **演示要点**：演示 WSF_AERO 的参数：reference_area, zero_lift_cd, cl_max

### aero · WSF_AERO｜

- **关键词**：aero, WSF_AERO, reference_area, cl_max, mach_and_cd
- **出处**：`base_types/weapons/other/gun.txt:13-22`　（同签名共 5 处，另见 `brawler/weapons/other/gun.txt:13`、`ciws/weapons/guns/30mm_bullet.txt:11`、`gun_engagement/weapons/guns/BULLET.txt:4`）
- **片段**：

```text
aero BULLET_AERO  WSF_AERO
   reference_area      7.0 cm2
   cl_max              0.1
   mach_and_cd         0.2      .2
   mach_and_cd         0.8      .21
   mach_and_cd         0.95     .29
   mach_and_cd         1.1      .45
   mach_and_cd         1.5      .3
   mach_and_cd         4.2      .23
end_aero
```

- **演示要点**：演示 WSF_AERO 的参数：reference_area, cl_max, mach_and_cd

### aero · WSF_AERO｜

- **关键词**：aero, WSF_AERO, reference_area, zero_lift_cd
- **出处**：`space_operations/launch_vehicles/atlas_v_401/atlas_v_401_base.txt:29-32`　（同签名共 6 处，另见 `space_operations/launch_vehicles/delta_iv_m/delta_iv_m_base.txt:32`、`space_operations/launch_vehicles/delta_iv_m/delta_iv_m_base.txt:37`、`space_operations/launch_vehicles/falcon_9/falcon_9_base.txt:36`）
- **片段**：

```text
aero ATLAS_V_401_STAGE_2_AERO WSF_AERO
   reference_area            7.31 m^2           # 3.05 m diameter (SF101)
   zero_lift_cd              0.2
end_aero
```

- **演示要点**：演示 WSF_AERO 的参数：reference_area, zero_lift_cd

### aero · WSF_AERO｜

- **关键词**：aero, WSF_AERO, reference_area, include
- **出处**：`space_operations/launch_vehicles/saturn_v/saturn_v_complex.txt:48-51`　（同签名共 4 处，另见 `space_operations/launch_vehicles/saturn_v/saturn_v_simple.txt:33`、`space_operations/launch_vehicles/saturn_v/saturn_v_complex.txt:42`、`space_operations/launch_vehicles/saturn_v/saturn_v_simple.txt:27`）
- **片段**：

```text
aero SATURN_V_S-II_AERO WSF_AERO
   reference_area            855.2986 ft^2       # 33 ft diameter
   include saturn_v_cd_vs_mach.txt
end_aero
```

- **演示要点**：演示 WSF_AERO 的参数：reference_area, include

### aero · WSF_AERO｜

- **关键词**：aero, WSF_AERO, reference_area, mach_and_cd
- **出处**：`space_operations/launch_vehicles/atlas_v_401/atlas_v_401_base.txt:17-27`　（同签名共 5 处，另见 `space_operations/launch_vehicles/proton_m/proton-m.txt:21`、`space_operations/launch_vehicles/falcon_9/falcon_9_base.txt:23`、`space_operations/launch_vehicles/falcon_heavy/falcon_heavy_base.txt:39`）
- **片段**：

```text
aero ATLAS_V_401_STAGE_1_AERO WSF_AERO
   reference_area            11.40 m^2           # 3.81 m diameter (SF101)

   # Reasonable data according to Dan Schueths
   mach_and_cd 0.1 0.15      # 0.12-0.18
   mach_and_cd 0.9 0.23
   mach_and_cd 0.98 0.4
   mach_and_cd 1.0  3.2
   mach_and_cd 1.2  2.0
   mach_and_cd 5.0  .21
end_aero
```

- **演示要点**：演示 WSF_AERO 的参数：reference_area, mach_and_cd

### aero（red_srbm_4）｜

- **关键词**：aero, reference_area
- **出处**：`base_types/weapons/ssm/red_srbm_4.txt:62-64`　（同签名共 12 处，另见 `base_types/weapons/ssm/red_srbm_4.txt:101`、`base_types/weapons/ssm/red_srbm_4.txt:140`、`base_types/weapons/ssm/red_srbm_4.txt:208`）
- **片段**：

```text
aero RED_SRBM_4_SPENT_STAGE_1_AERO TYPICAL_SPENT_STAGE_AERO
   reference_area            13.203 ft^2           # Ref 1 - 1.25 m diam (4.1 ft)
end_aero
```

- **演示要点**：演示 aero 的参数：reference_area

### aero_component（aero）｜

- **关键词**：aero_component, type, cd_angle_mach_table, cy_angle_beta_mach_table, cm_angle_alpha_mach_table, cmq_angle_mach_table, cn_angle_beta_mach_table, cnr_angle_mach_table, cl_angle_alpha_beta_table, clp_angle_mach_table, clq_angle_mach_table, clr_angle_mach_table
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:297-345`　（同签名共 132 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:348`、`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:399`、`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:450`）
- **片段**：

```text
aero_component
   type                    Drageron_Right_Top
   #ref_area_sqft          12.0

   cL_angle_alpha_mach_table
      file data/Drageron_Right_Top/cLift_angle_alpha_mach_table.txt
   end_cL_angle_alpha_mach_table

   cd_angle_mach_table
      file data/Drageron_Right_Top/cd_angle_mach_table.txt
   end_cd_angle_mach_table

   cy_angle_beta_mach_table
      file data/Drageron_Right_Top/cy_angle_beta_mach_table.txt
   end_cy_angle_beta_mach_table

   cm_angle_alpha_mach_table
      file data/Drageron_Right_Top/cm_angle_alpha_mach_table.txt
   end_cm_angle_alpha_mach_table

   cmq_angle_mach_table
      file data/Drageron_Right_Top/cmq_angle_mach_table.txt
   end_cmq_angle_mach_table

   cn_angle_beta_mach_table
      file data/Drageron_Right_Top/cn_angle_beta_mach_table.txt
   end_cn_angle_beta_mach_table

   cnr_angle_mach_table
      file data/Drageron_Right_Top/cnr_angle_mach_table.txt
   end_cnr_angle_mach_table

   cl_angle_alpha_beta_table
      file data/Drageron_Right_Top/cl_angle_alpha_beta_table.txt
   end_cl_angle_alpha_beta_table

   clp_angle_mach_table
      file data/Drageron_Right_Top/clp_angle_mach_table.txt
   end_clp_angle_mach_table

   clq_angle_mach_table
      file data/Drageron_Right_Top/clq_angle_mach_table.txt
   end_clq_angle_mach_table

   clr_angle_mach_table
      file data/Drageron_Right_Top/clr_angle_mach_table.txt
   end_clr_angle_mach_table

end_aero_component
```

- **演示要点**：演示 aero_component 的参数：type, cd_angle_mach_table, cy_angle_beta_mach_table, cm_angle_alpha_mach_table, cmq_angle_mach_table, cn_angle_beta_mach_table, cnr_angle_mach_table, cl_angle_alpha_beta_table, clp_angle_mach_table, clq_angle_mach_table

### aero_component（aero_landing_gear）｜

- **关键词**：aero_component, type, cd_angle_mach_table, cy_angle_beta_mach_table, cm_angle_alpha_mach_table, cn_angle_beta_mach_table, cl_angle_alpha_beta_table
- **出处**：`p6dof/p6dof_types/aircraft/fa-lgt/aero/aero_landing_gear.txt:22-50`　（同签名共 6 处，另见 `p6dof/p6dof_types/aircraft/fa-lgt/aero/aero_landing_gear.txt:53`、`p6dof/p6dof_types/aircraft/fa-lgt/aero/aero_landing_gear.txt:84`、`six_dof/six_dof_types/aircraft/fa-lgt/aero/aero_landing_gear.txt:22`）
- **片段**：

```text
aero_component
   type                    Nose_Gear
   #ref_area_sqft          12.0

   cL_angle_alpha_mach_table
      file data/Nose_Gear/cLift_angle_alpha_mach_table.txt
   end_cL_angle_alpha_mach_table

   cd_angle_mach_table
      file data/Nose_Gear/cd_angle_mach_table.txt
   end_cd_angle_mach_table

   cy_angle_beta_mach_table
      file data/Nose_Gear/cy_angle_beta_mach_table.txt
   end_cy_angle_beta_mach_table

   cm_angle_alpha_mach_table
      file data/Nose_Gear/cm_angle_alpha_mach_table.txt
   end_cm_angle_alpha_mach_table

   cn_angle_beta_mach_table
      file data/Nose_Gear/cn_angle_beta_mach_table.txt
   end_cn_angle_beta_mach_table

   cl_angle_alpha_beta_table
      file data/Nose_Gear/cl_angle_alpha_beta_table.txt
   end_cl_angle_alpha_beta_table

end_aero_component
```

- **演示要点**：演示 aero_component 的参数：type, cd_angle_mach_table, cy_angle_beta_mach_table, cm_angle_alpha_mach_table, cn_angle_beta_mach_table, cl_angle_alpha_beta_table

### aero_data（aero）｜

- **关键词**：aero_data, wing_chord_ft, wing_span_ft, wing_area_sqft, cd_alpha_beta_mach_table, cy_alpha_beta_mach_table, cyr_beta_mach_table, cy_betadot_beta_mach_table, cm_alpha_beta_mach_table, cmq_mach_table, cmp_mach_table, cm_alphadot_mach_table, cn_alpha_beta_mach_table
- **出处**：`p6dof/p6dof_types/aircraft/b-fw/aero/aero.txt:32-210`　（同签名共 5 处，另见 `six_dof/six_dof_types/aircraft/b-fw/aero/aero_rb6.txt:32`、`p6dof/p6dof_types/aircraft/a-lgt/aero/aero.txt:32`、`p6dof/p6dof_types/aircraft/b-hvy/aero/aero.txt:32`）
- **片段**：

```text
aero_data

   wing_chord_ft            18.0000
   wing_span_ft            172.0000
   wing_area_sqft         3096.0000

# --------------------------------------------------------------------------------------------------

   cL_alpha_beta_mach_table
      file data/cLift_alpha_beta_mach_table.txt
   end_cL_alpha_beta_mach_table

# --------------------------------------------------------------------------------------------------

   cLq_alpha_mach_table
      file data/cLiftq_alpha_mach_table.txt
   end_cLq_alpha_mach_table

# --------------------------------------------------------------------------------------------------

   cL_alphadot_alpha_mach_table
      file data/cLift_alphadot_alpha_mach_table.txt
   end_cL_alphadot_alpha_mach_table

# --------------------------------------------------------------------------------------------------

   cd_alpha_beta_mach_table
      file data/cd_alpha_beta_mach_table.txt
   end_cd_alpha_beta_mach_table

# --------------------------------------------------------------------------------------------------

   cy_alpha_beta_mach_table
      file data/cy_alpha_beta_mach_table.txt
   end_cy_alpha_beta_mach_table

# --------------------------------------------------------------------------------------------------

   cyr_beta_mach_table
      file data/cyr_beta_mach_table.txt
   end_cyr_beta_mach_table

# --------------------------------------------------------------------------------------------------

   cy_betadot_beta_mach_table
      file data/cy_betadot_beta_mach_table.txt
   end_cy_betadot_beta_mach_table

# --------------------------------------------------------------------------------------------------

   cm_alpha_beta_mach_table
      file data/cm_alpha_beta_mach_table.txt
   end_cm_alpha_beta_mach_table

# --------------------------------------------------------------------------------------------------

   cmq_mach_table
        0.1000        -0.250273140729203
        0.5000        -0.250699667349162
        0.7000        -0.250690227268525
        0.7500        -0.250688361630963
        0.8000        -0.250686776899251
   end_cmq_mach_table

# --------------------------------------------------------------------------------------------------

   cmp_mach_table
        0.1000        -0.000010384289843
        0.5000        -0.000026075577166
        0.7000        -0.000027196235471
        0.7500        -0.000027383007994
        0.8000        -0.000027546432804
   end_cmp_mach_table

# --------------------------------------------------------------------------------------------------

   cm_alphadot_mach_table
        0.1000        -0.250273140729203
        0.5000        -0.250699667349162
        0.7000        -0.250690227268525
        0.7500        -0.250688361630963
        0.8000        -0.250686776899251
   end_cm_alphadot_mach_table

# --------------------------------------------------------------------------------------------------

   cn_alpha_beta_mach_table
      file data/cn_alpha_beta_mach_table.txt
   end_cn_alpha_beta_mach_table

# --------------------------------------------------------------------------------------------------

   cn_betadot_mach_table
        0.1000         0.000171928251450
        0.5000         0.000176598156541
        0.7000         0.000176494672894
        0.7500         0.000176474224485
        0.8000         0.000176456854561
   end_cn_betadot_mach_table

# --------------------------------------------------------------------------------------------------

   cnr_mach_table
        0.1000        -0.000171928251450
        0.5000        -0.000176598156541
        0.7000        -0.000176494672894
        0.7500        -0.000176474224485
        0.8000        -0.000176456854561
   end_cnr_mach_table

# --------------------------------------------------------------------------------------------------

   cnp_mach_table
        0.1000         0.000006689894723
        0.5000         0.000006953343407
        0.7000         0.000006960395613
        0.7500         0.000006961807142
        0.8000         0.000006963182564
   end_cnp_mach_table

# --------------------------------------------------------------------------------------------------

   cl_alpha_beta_mach_table
      file data/cl_alpha_beta_mach_table.txt
   end_cl_alpha_beta_mach_table

# --------------------------------------------------------------------------------------------------

   clp_mach_table
        0.1000        -0.681544901600898
        0.5000        -0.681358096031866
        0.7000        -0.681324179882883
        0.7500        -0.681317424606177
        0.8000        -0.681311165459603
   end_clp_mach_table

# --------------------------------------------------------------------------------------------------

   cl_alphadot_mach_table
        0.1000         0.000000000000000
        0.5000         0.000000000000000
        0.7000         0.000000000000000
        0.7500         0.000000000000000
        0.8000         0.000000000000000
   end_cl_alphadot_mach_table

# --------------------------------------------------------------------------------------------------

   clr_mach_table
        0.1000         0.000006689945147
        0.5000         0.000006953355327
        0.7000         0.000006960404240
        0.7500         0.000006961815203
        0.8000         0.000006963190118
   end_clr_mach_table

# --------------------------------------------------------------------------------------------------

   cl_betadot_mach_table
        0.1000        -0.000006689945147
        0.5000        -0.000006953355327
        0.7000        -0.000006960404240
        0.7500        -0.000006961815203
        0.8000        -0.000006963190118
   end_cl_betadot_mach_table

# --------------------------------------------------------------------------------------------------

   clq_mach_table
        0.1000         0.000000000000000
        0.5000         0.000000000000000
        0.7000         0.000000000000000
        0.7500         0.000000000000000
        0.8000         0.000000000000000
   end_clq_mach_table

# --------------------------------------------------------------------------------------------------

end_aero_data
```

- **演示要点**：演示 aero_data 的参数：wing_chord_ft, wing_span_ft, wing_area_sqft, cd_alpha_beta_mach_table, cy_alpha_beta_mach_table, cyr_beta_mach_table, cy_betadot_beta_mach_table, cm_alpha_beta_mach_table, cmq_mach_table, cmp_mach_table

### aero_data（aero_pm6）｜

- **关键词**：aero_data, ref_area_sqft, cd_alpha_beta_mach_table, cy_alpha_beta_mach_table, maximum_roll_acceleration_mach_table, maximum_pitch_acceleration_mach_table, maximum_yaw_acceleration_mach_table, roll_stabilizing_frequency_mach_table, alpha_stabilizing_frequency_mach_table, beta_stabilizing_frequency_mach_table, speedbrake_dcd_mach_table
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/aero/aero_pm6.txt:10-54`　（同签名共 2 处，另见 `six_dof_with_brawler/six_dof_types/aircraft/LTE_FIGHTER/aero/aero_pm6.txt:10`）
- **片段**：

```text
aero_data

   ref_area_sqft	667.0

   cL_alpha_beta_mach_table
      file data/cLift_alpha_beta_mach_table.txt
   end_cL_alpha_beta_mach_table

   cd_alpha_beta_mach_table
      file data/cd_alpha_beta_mach_table.txt
   end_cd_alpha_beta_mach_table

   cy_alpha_beta_mach_table
      file data/cy_alpha_beta_mach_table.txt
   end_cy_alpha_beta_mach_table

   maximum_roll_acceleration_mach_table
      file data/pdotmax_mach_table.txt
   end_maximum_roll_acceleration_mach_table

   maximum_pitch_acceleration_mach_table
      file data/qdotmax_mach_table.txt
   end_maximum_pitch_acceleration_mach_table

   maximum_yaw_acceleration_mach_table
      file data/rdotmax_mach_table.txt
   end_maximum_yaw_acceleration_mach_table

   roll_stabilizing_frequency_mach_table
      file data/roll_frequency_mach_table.txt
   end_roll_stabilizing_frequency_mach_table

   alpha_stabilizing_frequency_mach_table
      file data/pitch_frequency_mach_table.txt
   end_alpha_stabilizing_frequency_mach_table

   beta_stabilizing_frequency_mach_table
      file data/yaw_frequency_mach_table.txt
   end_beta_stabilizing_frequency_mach_table

   speedbrake_dcd_mach_table
      file data/speedbrake_dcd_mach_table.txt
   end_speedbrake_dcd_mach_table

end_aero_data
```

- **演示要点**：演示 aero_data 的参数：ref_area_sqft, cd_alpha_beta_mach_table, cy_alpha_beta_mach_table, maximum_roll_acceleration_mach_table, maximum_pitch_acceleration_mach_table, maximum_yaw_acceleration_mach_table, roll_stabilizing_frequency_mach_table, alpha_stabilizing_frequency_mach_table, beta_stabilizing_frequency_mach_table, speedbrake_dcd_mach_table

### aero_data（refAero）｜

- **关键词**：aero_data, ref_area_sqft, use_legacy_derivatives, use_reduced_frequency, cd_alpha_mach_table, cm_alpha_mach_table, cd_beta_mach_table, cy_beta_mach_table, cn_beta_mach_table, cl_beta_mach_table, aero_mode
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/refAero.txt:17-129`
- **片段**：

```text
aero_data

   ref_area_sqft           20.0
   
   use_legacy_derivatives   true
   use_reduced_frequency    false
   
   cL_alpha_mach_table
      irregular_table
         independent_variable mach precision float
         independent_variable alpha units deg
         dependent_variable precision float
         mach  0.000
            alpha     -90.0   0.0    90.0
            values    0.0     0.0    0.0
         mach  30.000
            alpha     -90.0   0.0    90.0
            values    0.0     0.0    0.0
      end_irregular_table
   end_cL_alpha_mach_table

   cd_alpha_mach_table
      irregular_table
         independent_variable mach precision float
         independent_variable alpha units deg
         dependent_variable precision float
         mach  0.000
            alpha     -90.0   0.0    90.0
            values    0.3     0.3    0.3
         mach  30.000
            alpha     -90.0   0.0    90.0
            values    0.3     0.3    0.3
      end_irregular_table
   end_cd_alpha_mach_table

   cm_alpha_mach_table
      irregular_table
         independent_variable mach precision float
         independent_variable alpha units deg
         dependent_variable precision float
         mach  0.000
            alpha     -90.0   0.0    90.0
            values    0.0     0.0    0.0
         mach  30.000
            alpha     -90.0   0.0    90.0
            values    0.0     0.0    0.0
      end_irregular_table
   end_cm_alpha_mach_table

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

   cn_beta_mach_table
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
   end_cn_beta_mach_table

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



   aero_mode  PostStaging


   end_aero_mode

end_aero_data
```

- **演示要点**：演示 aero_data 的参数：ref_area_sqft, use_legacy_derivatives, use_reduced_frequency, cd_alpha_mach_table, cm_alpha_mach_table, cd_beta_mach_table, cy_beta_mach_table, cn_beta_mach_table, cl_beta_mach_table, aero_mode

### aero_data（ICBM_FullAero）｜

- **关键词**：aero_data, ref_area_sqft, aero_center_x, aero_center_y, aero_center_z, use_legacy_derivatives, use_reduced_frequency, cd_alpha_mach_table, cm_alpha_mach_table, cn_beta_mach_table, aero_mode
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/ICBM_FullAero.txt:11-224`
- **片段**：

```text
aero_data

   ref_area_sqft              23.75

   aero_center_x              -30 ft
   aero_center_y              0 ft
   aero_center_z              0 ft

   use_legacy_derivatives   true
   use_reduced_frequency    false
   
   cd_alpha_mach_table
      irregular_table
         independent_variable mach precision float
         independent_variable alpha units deg
         dependent_variable precision float
         mach  0.000
            alpha     -90.0   0.0    90.0
            values    0.28    0.28   0.28
         mach  30.000
            alpha     -90.0   0.0    90.0
            values    0.28    0.28   0.28
      end_irregular_table
   end_cd_alpha_mach_table

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




   aero_mode  Stage2BurnWithNosecone

      ref_area_sqft           14.75

      cd_alpha_mach_table
         irregular_table
            independent_variable mach precision float
            independent_variable alpha units deg
            dependent_variable precision float
            mach  0.000
               alpha     -90.0   0.0    90.0
               values    0.28    0.28   0.28
            mach  30.000
               alpha     -90.0   0.0    90.0
               values    0.28    0.28   0.28
         end_irregular_table
      end_cd_alpha_mach_table

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


   end_aero_mode

   aero_mode  Stage2BurnWithoutNosecone

      ref_area_sqft           14.75

      cd_alpha_mach_table
         irregular_table
            independent_variable mach precision float
            independent_variable alpha units deg
            dependent_variable precision float
            mach  0.000
               alpha     -90.0   0.0    90.0
               values    0.7     0.7    0.7
            mach  30.000
               alpha     -90.0   0.0    90.0
               values    0.7     0.7    0.7
         end_irregular_table
      end_cd_alpha_mach_table

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

   end_aero_mode

   aero_mode  Stage3BurnWithoutNosecone

      ref_area_sqft           14.75

      cd_alpha_mach_table
         irregular_table
            independent_variable mach precision float
            independent_variable alpha units deg
            dependent_variable precision float
            mach  0.000
               alpha     -90.0   0.0    90.0
               values    0.7     0.7    0.7
            mach  30.000
               alpha     -90.0   0.0    90.0
               values    0.7     0.7    0.7
         end_irregular_table
      end_cd_alpha_mach_table

   end_aero_mode

   aero_mode  PBVBurn

      ref_area_sqft           14.75

      cd_alpha_mach_table
         irregular_table
            independent_variable mach precision float
            independent_variable alpha units deg
            dependent_variable precision float
            mach  0.000
               alpha     -90.0   0.0    90.0
               values    0.7     0.7    0.7
            mach  30.000
               alpha     -90.0   0.0    90.0
               values    0.7     0.7    0.7
         end_irregular_table
      end_cd_alpha_mach_table

   end_aero_mode

   aero_mode  RVFree

      ref_area_sqft           1.75

      cd_alpha_mach_table
         irregular_table
            independent_variable mach precision float
            independent_variable alpha units deg
            dependent_variable precision float
            mach  0.000
               alpha     -90.0   0.0    90.0
               values    0.2     0.2    0.2
            mach  30.000
               alpha     -90.0   0.0    90.0
               values    0.2     0.2    0.2
         end_irregular_table
      end_cd_alpha_mach_table

   end_aero_mode

end_aero_data
```

- **演示要点**：演示 aero_data 的参数：ref_area_sqft, aero_center_x, aero_center_y, aero_center_z, use_legacy_derivatives, use_reduced_frequency, cd_alpha_mach_table, cm_alpha_mach_table, cn_beta_mach_table, aero_mode

### aero_data（aero_pm6）｜

- **关键词**：aero_data, ref_area_sqft, cd_alpha_beta_mach_table, cy_alpha_beta_mach_table, maximum_roll_acceleration_mach_table, maximum_pitch_acceleration_mach_table, maximum_yaw_acceleration_mach_table, alpha_stabilizing_frequency_mach_table, file, beta_stabilizing_frequency_mach_table
- **出处**：`six_dof/six_dof_types/spacecraft/orbiter-booster/aero/aero_pm6.txt:32-84`　（同签名共 3 处，另见 `six_dof/six_dof_types/weapons/lrm-1-c/aero/aero_pm6.txt:32`、`six_dof/six_dof_types/weapons/sam-mr/aero/aero_pm6.txt:32`）
- **片段**：

```text
aero_data

   ref_area_sqft             0.2669

# --------------------------------------------------------------------------------------------------

   cL_alpha_beta_mach_table
      file data/cLift_alpha_beta_mach_table.txt
   end_cL_alpha_beta_mach_table

# --------------------------------------------------------------------------------------------------

   cd_alpha_beta_mach_table
      file data/cd_alpha_beta_mach_table.txt
   end_cd_alpha_beta_mach_table

# --------------------------------------------------------------------------------------------------

   cy_alpha_beta_mach_table
      file data/cy_alpha_beta_mach_table.txt
   end_cy_alpha_beta_mach_table

# --------------------------------------------------------------------------------------------------

   maximum_roll_acceleration_mach_table
      file data/pdotmax_mach_table.txt
   end_maximum_roll_acceleration_mach_table

# --------------------------------------------------------------------------------------------------

   maximum_pitch_acceleration_mach_table
      file data/qdotmax_mach_table.txt
   end_maximum_pitch_acceleration_mach_table

# --------------------------------------------------------------------------------------------------

   maximum_yaw_acceleration_mach_table
      file data/rdotmax_mach_table.txt
   end_maximum_yaw_acceleration_mach_table
   
# --------------------------------------------------------------------------------------------------

	alpha_stabilizing_frequency_mach_table
		file data/frequency_mach_table.txt
	end_alpha_stabilizing_frequency_mach_table
	
# --------------------------------------------------------------------------------------------------

	beta_stabilizing_frequency_mach_table
		file data/frequency_mach_table.txt
	end_beta_stabilizing_frequency_mach_table
	
end_aero_data
```

- **演示要点**：演示 aero_data 的参数：ref_area_sqft, cd_alpha_beta_mach_table, cy_alpha_beta_mach_table, maximum_roll_acceleration_mach_table, maximum_pitch_acceleration_mach_table, maximum_yaw_acceleration_mach_table, alpha_stabilizing_frequency_mach_table, file, beta_stabilizing_frequency_mach_table

### aero_data（ICBM_Stage3Aero）｜

- **关键词**：aero_data, ref_area_sqft, aero_center_x, aero_center_y, aero_center_z, use_legacy_derivatives, use_reduced_frequency, cd_alpha_mach_table, aero_mode
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/ICBM_Stage3Aero.txt:11-60`　（同签名共 9 处，另见 `p6dof/p6dof_types/weapons/simple-icbm/ICBM_BalloonAero.txt:11`、`p6dof/p6dof_types/weapons/simple-icbm/ICBM_Interstage12Aero.txt:11`、`p6dof/p6dof_types/weapons/simple-icbm/ICBM_Interstage23Aero.txt:11`）
- **片段**：

```text
aero_data

   ref_area_sqft              0

   aero_center_x              0 ft
   aero_center_y              0 ft
   aero_center_z              0 ft
   
   use_legacy_derivatives   true
   use_reduced_frequency    false
   
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

   aero_mode  PostStaging

      ref_area_sqft           19.63

      aero_center_x           0 ft
      aero_center_y           0 ft
      aero_center_z           0 ft

      cd_alpha_mach_table
         irregular_table
            independent_variable mach precision float
            independent_variable alpha units deg
            dependent_variable precision float
            mach  0.000
               alpha     -90.0   0.0    90.0
               values    1.0     1.0    1.0
            mach  30.000
               alpha     -90.0   0.0    90.0
               values    1.0     1.0    1.0
         end_irregular_table
      end_cd_alpha_mach_table

   end_aero_mode

end_aero_data
```

- **演示要点**：演示 aero_data 的参数：ref_area_sqft, aero_center_x, aero_center_y, aero_center_z, use_legacy_derivatives, use_reduced_frequency, cd_alpha_mach_table, aero_mode

### aero_data（aero_pm6）｜

- **关键词**：aero_data, ref_area_sqft, cd_alpha_beta_mach_table, cy_alpha_beta_mach_table, maximum_roll_acceleration_mach_table, maximum_pitch_acceleration_mach_table, maximum_yaw_acceleration_mach_table, speedbrake_dcd_mach_table, roll_stabilizing_frequency_mach_table
- **出处**：`six_dof/six_dof_types/aircraft/fa-hvy/aero/aero_pm6.txt:32-84`　（同签名共 2 处，另见 `six_dof/six_dof_types/aircraft/fa-lgt/aero/aero_pm6.txt:32`）
- **片段**：

```text
aero_data

   ref_area_sqft          675.0000

# --------------------------------------------------------------------------------------------------

   cL_alpha_beta_mach_table
      file data/cLift_alpha_beta_mach_table.txt
   end_cL_alpha_beta_mach_table

# --------------------------------------------------------------------------------------------------

   cd_alpha_beta_mach_table
      file data/cd_alpha_beta_mach_table.txt
   end_cd_alpha_beta_mach_table

# --------------------------------------------------------------------------------------------------

   cy_alpha_beta_mach_table
      file data/cy_alpha_beta_mach_table.txt
   end_cy_alpha_beta_mach_table

# --------------------------------------------------------------------------------------------------

   maximum_roll_acceleration_mach_table
      file data/pdotmax_mach_table.txt
   end_maximum_roll_acceleration_mach_table

# --------------------------------------------------------------------------------------------------

   maximum_pitch_acceleration_mach_table
      file data/qdotmax_mach_table.txt
   end_maximum_pitch_acceleration_mach_table

# --------------------------------------------------------------------------------------------------

   maximum_yaw_acceleration_mach_table
      file data/rdotmax_mach_table.txt
   end_maximum_yaw_acceleration_mach_table
   
# --------------------------------------------------------------------------------------------------

   speedbrake_dcd_mach_table
      file data/speedbrake_dcd_mach_table.txt
   end_speedbrake_dcd_mach_table
	
# --------------------------------------------------------------------------------------------------

   roll_stabilizing_frequency_mach_table 
      file data/roll_frequency_mach_table.txt
   end_roll_stabilizing_frequency_mach_table
   
end_aero_data
```

- **演示要点**：演示 aero_data 的参数：ref_area_sqft, cd_alpha_beta_mach_table, cy_alpha_beta_mach_table, maximum_roll_acceleration_mach_table, maximum_pitch_acceleration_mach_table, maximum_yaw_acceleration_mach_table, speedbrake_dcd_mach_table, roll_stabilizing_frequency_mach_table

### aero_data（aero_pm6）｜

- **关键词**：aero_data, ref_area_sqft, cd_alpha_beta_mach_table, cy_alpha_beta_mach_table, maximum_roll_acceleration_mach_table, maximum_pitch_acceleration_mach_table, maximum_yaw_acceleration_mach_table, roll_stabilizing_frequency_mach_table
- **出处**：`six_dof/six_dof_types/weapons/agm-mrc/aero/aero_pm6.txt:32-78`
- **片段**：

```text
aero_data

   ref_area_sqft           13.1250

# --------------------------------------------------------------------------------------------------

   cL_alpha_beta_mach_table
      file data/cLift_alpha_beta_mach_table.txt
   end_cL_alpha_beta_mach_table

# --------------------------------------------------------------------------------------------------

   cd_alpha_beta_mach_table
      file data/cd_alpha_beta_mach_table.txt
   end_cd_alpha_beta_mach_table

# --------------------------------------------------------------------------------------------------

   cy_alpha_beta_mach_table
      file data/cy_alpha_beta_mach_table.txt
   end_cy_alpha_beta_mach_table

# --------------------------------------------------------------------------------------------------

   maximum_roll_acceleration_mach_table
      file data/pdotmax_mach_table.txt
   end_maximum_roll_acceleration_mach_table

# --------------------------------------------------------------------------------------------------

   maximum_pitch_acceleration_mach_table
      file data/qdotmax_mach_table.txt
   end_maximum_pitch_acceleration_mach_table

# --------------------------------------------------------------------------------------------------

   maximum_yaw_acceleration_mach_table
      file data/rdotmax_mach_table.txt
   end_maximum_yaw_acceleration_mach_table
   
# --------------------------------------------------------------------------------------------------

   roll_stabilizing_frequency_mach_table 
      file data/roll_frequency_mach_table.txt
   end_roll_stabilizing_frequency_mach_table
   
end_aero_data
```

- **演示要点**：演示 aero_data 的参数：ref_area_sqft, cd_alpha_beta_mach_table, cy_alpha_beta_mach_table, maximum_roll_acceleration_mach_table, maximum_pitch_acceleration_mach_table, maximum_yaw_acceleration_mach_table, roll_stabilizing_frequency_mach_table

### aero_data（aero_pm6）｜

- **关键词**：aero_data, ref_area_sqft, cd_alpha_beta_mach_table, cy_alpha_beta_mach_table, alpha_stabilizing_frequency_mach_table, file, beta_stabilizing_frequency_mach_table
- **出处**：`six_dof/six_dof_types/misc/srb-rato/aero/aero_pm6.txt:32-66`　（同签名共 4 处，另见 `six_dof/six_dof_types/misc/tnk-f16-370g/aero/aero_pm6.txt:32`、`six_dof/six_dof_types/weapons/ubu-500/aero/aero_pm6.txt:32`、`six_dof/six_dof_types/weapons/unguided_rocket/aero/aero_pm6.txt:32`）
- **片段**：

```text
aero_data

   ref_area_sqft             0.1385

# --------------------------------------------------------------------------------------------------

   cL_alpha_beta_mach_table
      file data/cLift_alpha_beta_mach_table.txt
   end_cL_alpha_beta_mach_table

# --------------------------------------------------------------------------------------------------

   cd_alpha_beta_mach_table
      file data/cd_alpha_beta_mach_table.txt
   end_cd_alpha_beta_mach_table

# --------------------------------------------------------------------------------------------------

   cy_alpha_beta_mach_table
      file data/cy_alpha_beta_mach_table.txt
   end_cy_alpha_beta_mach_table

# --------------------------------------------------------------------------------------------------

	alpha_stabilizing_frequency_mach_table
		file data/frequency_mach_table.txt
	end_alpha_stabilizing_frequency_mach_table
	
# --------------------------------------------------------------------------------------------------

	beta_stabilizing_frequency_mach_table
		file data/frequency_mach_table.txt
	end_beta_stabilizing_frequency_mach_table
	
end_aero_data
```

- **演示要点**：演示 aero_data 的参数：ref_area_sqft, cd_alpha_beta_mach_table, cy_alpha_beta_mach_table, alpha_stabilizing_frequency_mach_table, file, beta_stabilizing_frequency_mach_table

### aero_data（aero_pm6）｜

- **关键词**：aero_data, ref_area_sqft, cd_alpha_beta_mach_table, cy_alpha_beta_mach_table, maximum_roll_acceleration_mach_table, maximum_pitch_acceleration_mach_table, maximum_yaw_acceleration_mach_table
- **出处**：`six_dof/six_dof_types/aircraft/b-fw/aero/aero_pm6.txt:32-72`　（同签名共 8 处，另见 `six_dof/six_dof_types/aircraft/b-hvy/aero/aero_pm6.txt:32`、`six_dof/six_dof_types/aircraft/c-hvy/aero/aero_pm6.txt:32`、`six_dof/six_dof_types/spacecraft/orbiter-main/aero/aero_pm6.txt:32`）
- **片段**：

```text
aero_data

   ref_area_sqft         3096.0000

# --------------------------------------------------------------------------------------------------

   cL_alpha_beta_mach_table
      file data/cLift_alpha_beta_mach_table.txt
   end_cL_alpha_beta_mach_table

# --------------------------------------------------------------------------------------------------

   cd_alpha_beta_mach_table
      file data/cd_alpha_beta_mach_table.txt
   end_cd_alpha_beta_mach_table

# --------------------------------------------------------------------------------------------------

   cy_alpha_beta_mach_table
      file data/cy_alpha_beta_mach_table.txt
   end_cy_alpha_beta_mach_table

# --------------------------------------------------------------------------------------------------

   maximum_roll_acceleration_mach_table
      file data/pdotmax_mach_table.txt
   end_maximum_roll_acceleration_mach_table

# --------------------------------------------------------------------------------------------------

   maximum_pitch_acceleration_mach_table
      file data/qdotmax_mach_table.txt
   end_maximum_pitch_acceleration_mach_table

# --------------------------------------------------------------------------------------------------

   maximum_yaw_acceleration_mach_table
      file data/rdotmax_mach_table.txt
   end_maximum_yaw_acceleration_mach_table
   
end_aero_data
```

- **演示要点**：演示 aero_data 的参数：ref_area_sqft, cd_alpha_beta_mach_table, cy_alpha_beta_mach_table, maximum_roll_acceleration_mach_table, maximum_pitch_acceleration_mach_table, maximum_yaw_acceleration_mach_table

### aero_mode（ICBM_BalloonAero）｜

- **关键词**：aero_mode, ref_area_sqft, aero_center_x, aero_center_y, aero_center_z, cd_alpha_mach_table
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/ICBM_BalloonAero.txt:37-59`　（同签名共 9 处，另见 `p6dof/p6dof_types/weapons/simple-icbm/ICBM_Interstage12Aero.txt:37`、`p6dof/p6dof_types/weapons/simple-icbm/ICBM_Interstage23Aero.txt:37`、`p6dof/p6dof_types/weapons/simple-icbm/ICBM_NoseconeAero.txt:37`）
- **片段**：

```text
   aero_mode  PostStaging

      ref_area_sqft           23.75

      aero_center_x           0 ft
      aero_center_y           0 ft
      aero_center_z           0 ft

      cd_alpha_mach_table
         irregular_table
            independent_variable mach precision float
            independent_variable alpha units deg
            dependent_variable precision float
            mach  0.000
               alpha     -90.0   0.0    90.0
               values    1.0     1.0    1.0
            mach  30.000
               alpha     -90.0   0.0    90.0
               values    1.0     1.0    1.0
         end_irregular_table
      end_cd_alpha_mach_table

   end_aero_mode
```

- **演示要点**：演示 aero_mode 的参数：ref_area_sqft, aero_center_x, aero_center_y, aero_center_z, cd_alpha_mach_table

### aero_mode（ICBM_FullAero）｜

- **关键词**：aero_mode, ref_area_sqft, cd_alpha_mach_table, cm_alpha_mach_table, cn_beta_mach_table
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/ICBM_FullAero.txt:116-162`　（同签名共 2 处，另见 `p6dof/p6dof_types/weapons/simple-icbm/ICBM_FullAero.txt:67`）
- **片段**：

```text
   aero_mode  Stage2BurnWithoutNosecone

      ref_area_sqft           14.75

      cd_alpha_mach_table
         irregular_table
            independent_variable mach precision float
            independent_variable alpha units deg
            dependent_variable precision float
            mach  0.000
               alpha     -90.0   0.0    90.0
               values    0.7     0.7    0.7
            mach  30.000
               alpha     -90.0   0.0    90.0
               values    0.7     0.7    0.7
         end_irregular_table
      end_cd_alpha_mach_table

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

   end_aero_mode
```

- **演示要点**：演示 aero_mode 的参数：ref_area_sqft, cd_alpha_mach_table, cm_alpha_mach_table, cn_beta_mach_table

### aero_mode（ICBM_FullAero）｜

- **关键词**：aero_mode, ref_area_sqft, cd_alpha_mach_table
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/ICBM_FullAero.txt:164-182`　（同签名共 3 处，另见 `p6dof/p6dof_types/weapons/simple-icbm/ICBM_FullAero.txt:184`、`p6dof/p6dof_types/weapons/simple-icbm/ICBM_FullAero.txt:204`）
- **片段**：

```text
   aero_mode  Stage3BurnWithoutNosecone

      ref_area_sqft           14.75

      cd_alpha_mach_table
         irregular_table
            independent_variable mach precision float
            independent_variable alpha units deg
            dependent_variable precision float
            mach  0.000
               alpha     -90.0   0.0    90.0
               values    0.7     0.7    0.7
            mach  30.000
               alpha     -90.0   0.0    90.0
               values    0.7     0.7    0.7
         end_irregular_table
      end_cd_alpha_mach_table

   end_aero_mode
```

- **演示要点**：演示 aero_mode 的参数：ref_area_sqft, cd_alpha_mach_table

### aero_mode（refAero）｜

- **关键词**：aero_mode
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/refAero.txt:124-127`
- **片段**：

```text
   aero_mode  PostStaging


   end_aero_mode
```

- **演示要点**：演示 aero_mode（最小结构，无子参数）

### agility_type（ew_radar）｜

- **关键词**：agility_type, frequency_changing
- **出处**：`aea_iads/sensors/radar/ew_radar.txt:79-81`　（同签名共 2 处，另见 `electronic_warfare/test_multi_beam/sensors/radar/ew_radar.txt:75`）
- **片段**：

```text
         agility_type
            frequency_changing
         end_agility_type
```

- **演示要点**：演示 agility_type 的参数：frequency_changing

### agility_type（agile_auto-repeater_jamming）｜

- **关键词**：agility_type, mode_name
- **出处**：`electronic_warfare/agile_auto-repeater_jamming.txt:179-182`　（同签名共 8 处，另见 `electronic_warfare/agile_jamming.txt:219`、`electronic_warfare/agile_repeater_jamming-rt1.txt:293`、`electronic_warfare/agile_repeater_jamming-rt2.txt:293`）
- **片段**：

```text
                     agility_type mode_changing
                        mode_name one
                        mode_name two
                     end_agility_type
```

- **演示要点**：演示 agility_type 的参数：mode_name

### agility_type（agile_auto-repeater_jamming）｜

- **关键词**：agility_type
- **出处**：`electronic_warfare/agile_auto-repeater_jamming.txt:183-184`　（同签名共 9 处，另见 `electronic_warfare/agile_jamming.txt:224`、`electronic_warfare/agile_repeater_jamming-rt1.txt:297`、`electronic_warfare/agile_repeater_jamming-rt2.txt:297`）
- **片段**：

```text
                     agility_type frequency_changing
                     end_agility_type
```

- **演示要点**：演示 agility_type（最小结构，无子参数）

### attitude_controller（attitude_control）｜

- **关键词**：attitude_controller, maximum_yaw_rate, maximum_pitch_rate, maximum_roll_rate, orientation
- **出处**：`space_operations/attitude_control.txt:56-61`
- **片段**：

```text
      attitude_controller rate_limited
         maximum_yaw_rate 5 deg/s
         maximum_pitch_rate 5 deg/s
         maximum_roll_rate 5 deg/s
         orientation none
      end_attitude_controller
```

- **演示要点**：演示 attitude_controller 的参数：maximum_yaw_rate, maximum_pitch_rate, maximum_roll_rate, orientation

### attitude_controller（5th_iridium_flares_demo）｜

- **关键词**：attitude_controller, orientation
- **出处**：`satellite_demos/5th_iridium_flares_demo.txt:261-263`
- **片段**：

```text
      attitude_controller instant
         orientation nadir_with_eci_velocity_constraint
      end_attitude_controller
```

- **演示要点**：演示 attitude_controller 的参数：orientation

### autopilot_config（autopilot_config）｜

- **关键词**：autopilot_config, vertical_middle_loop_rate_factor, vertical_outer_loop_rate_factor, lateral_middle_loop_rate_factor, lateral_outer_loop_rate_factor, speed_middle_loop_rate_factor, speed_outer_loop_rate_factor, control_method, use_legacy_beta, min_taxi_turn_radius, use_simple_yaw_damper, pid_group, pid_alpha
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:24-213`　（同签名共 27 处，另见 `p6dof/p6dof_types/aircraft/b-fw/controls/autopilot_config.txt:24`、`p6dof/p6dof_types/aircraft/c-hvy/controls/autopilot_config.txt:24`、`p6dof/p6dof_types/aircraft/fa-lgt/controls/autopilot_config.txt:24`）
- **片段**：

```text
autopilot_config

  vertical_middle_loop_rate_factor  4
  vertical_outer_loop_rate_factor   4
  lateral_middle_loop_rate_factor   4
  lateral_outer_loop_rate_factor    4
  speed_middle_loop_rate_factor     200
  speed_outer_loop_rate_factor      4

  control_method                    BANK_TO_TURN_WITH_YAW

  use_legacy_beta                   false

  min_taxi_turn_radius              50.0 ft   # This can be adjusted after testing

  use_simple_yaw_damper             false     # This can be set to true to damp yaw oscillations

  # ------------------------------------------------------------

  pid_group

    pid_alpha
      kp 0.144695
      ki 1.73862e-08
      kd 0.0343042
      max_error_accum 0
      low_pass_alpha 0.7
    end_pid_alpha

    pid_altitude
      kp 10.8697
      ki 1.46779e-07
      kd 2.80909e-07
      max_error_accum 100
    end_pid_altitude

    pid_bank_angle
      kp 4.70425
      ki 2.57364e-07
      kd 0.173307
      max_error_accum 1
    end_pid_bank_angle

    pid_beta
      kp 0.600643
      ki 3.67398e-07
      kd 0.61506
      max_error_accum 0.5
      low_pass_alpha 0.7
    end_pid_beta

    pid_delta_pitch
      kp 0.674482
      ki 14.7908
      kd 0.0295742
      max_error_accum 10
    end_pid_delta_pitch

    pid_delta_roll
      kp 3.46491
      ki 0.0129985
      kd 0.666012
      max_error_accum 1
    end_pid_delta_roll

    pid_flightpath_angle
      kp 1.50112
      ki 0.00248413
      kd 7.29851e-07
      max_error_accum 0.5
    end_pid_flightpath_angle

    pid_forward_accel
      kp 20
      ki 2
      kd 0
      max_error_accum 1
    end_pid_forward_accel

    pid_pitch_angle
      kp 1.5017
      ki 1.3849
      kd 3.33783e-06
      max_error_accum 0.5
    end_pid_pitch_angle

    pid_pitch_rate
      kp 0.00984123
      ki 1.5081
      kd 1.06997e-09
      max_error_accum 10
    end_pid_pitch_rate

    pid_roll_heading
      kp 0.127881
      ki 0.0543592
      kd 5.59324e-05
      max_error_accum 2
      low_pass_alpha 0.5
    end_pid_roll_heading

    pid_roll_rate
      kp 0.645499
      ki 2.10493
      kd 0.0420401
      max_error_accum 0
    end_pid_roll_rate

    pid_speed
      kp 0.00658906
      ki 5.08909e-09
      kd 5.36562e-05
      max_error_accum 10
    end_pid_speed

    pid_taxi_forward_accel
      kp 1
      ki 0
      kd 0
      max_error_accum 1
    end_pid_taxi_forward_accel

    pid_taxi_heading
      kp 1
      ki 0.01
      kd 0
      max_error_accum 10
    end_pid_taxi_heading

    pid_taxi_speed
      kp 1
      ki 0
      kd 0
      max_error_accum 1
    end_pid_taxi_speed

    pid_taxi_yaw_rate
      kp 0.1
      ki 0.2
      kd 0
      max_error_accum 10
    end_pid_taxi_yaw_rate

    pid_vert_speed
      kp 0.00191321
      ki 1.37015e-09
      kd 9.16773e-06
      max_error_accum 60
      ignore_large_error_accum 500
    end_pid_vert_speed

    pid_yaw_heading
      kp 0.210933
      ki 4.87967e-08
      kd 1.09535
      max_error_accum 1
    end_pid_yaw_heading

    pid_yaw_rate
      kp 0.0163975
      ki 7.74487
      kd 8.85439e-07
      max_error_accum 1
    end_pid_yaw_rate

    limits_and_settings
      include autopilot_config_g_limits.txt
      afterburner_threshold       1
      speedbrake_threshold        0
      alpha_min                   -16
      alpha_max                   20
      pitch_rate_min              -10
      pitch_rate_max              40
      vert_speed_min              -5000
      vert_speed_max              5000
      beta_max                    10
      yaw_rate_max                5
      roll_rate_max               180
      bank_angle_max              60
      forward_accel_min           -1
      forward_accel_max           2
      taxi_speed_max_fps          10
      taxi_yaw_rate_max           10
      turn_roll_in_multiplier     4         # This can be manually 'tuned' for improved performance
      route_allowable_angle_error 5 deg     # This can be manually 'tuned' for improved performance
    end_limits_and_settings

  end_pid_group

end_autopilot_config
```

- **演示要点**：演示 autopilot_config 的参数：vertical_middle_loop_rate_factor, vertical_outer_loop_rate_factor, lateral_middle_loop_rate_factor, lateral_outer_loop_rate_factor, speed_middle_loop_rate_factor, speed_outer_loop_rate_factor, control_method, use_legacy_beta, min_taxi_turn_radius, use_simple_yaw_damper

### autopilot_config（autopilot_config_rb6）｜

- **关键词**：autopilot_config, vertical_middle_loop_rate_factor, vertical_outer_loop_rate_factor, lateral_middle_loop_rate_factor, lateral_outer_loop_rate_factor, speed_middle_loop_rate_factor, speed_outer_loop_rate_factor, control_method, min_taxi_turn_radius, use_simple_yaw_damper, pid_group, pid_alpha, pid_altitude
- **出处**：`six_dof/six_dof_types/aircraft/b-fw/controls/autopilot_config_rb6.txt:24-211`　（同签名共 13 处，另见 `six_dof/six_dof_types/aircraft/c-hvy/controls/autopilot_config_rb6.txt:24`、`six_dof/six_dof_types/aircraft/fa-lgt/controls/autopilot_config_rb6.txt:24`、`six_dof/six_dof_types/weapons/aam-mr/controls/autopilot_config_rb6.txt:24`）
- **片段**：

```text
autopilot_config

  vertical_middle_loop_rate_factor  4
  vertical_outer_loop_rate_factor   4
  lateral_middle_loop_rate_factor   4
  lateral_outer_loop_rate_factor    4
  speed_middle_loop_rate_factor     200
  speed_outer_loop_rate_factor      4

  control_method                    BANK_TO_TURN_WITH_YAW

  min_taxi_turn_radius              50.0 ft   # This can be adjusted after testing

  use_simple_yaw_damper             false     # This can be set to true to damp yaw oscillations

  # ------------------------------------------------------------

  pid_group

    pid_alpha
      kp 0.868975
      ki 3.21182e-07
      kd 0.302513
      max_error_accum 0
      low_pass_alpha 0.7
    end_pid_alpha

    pid_altitude
      kp 7.01664
      ki 1.12921e-05
      kd 1.66228e-05
      max_error_accum 100
    end_pid_altitude

    pid_bank_angle
      kp 3.55674
      ki 0.0421938
      kd 1.94097e-07
      max_error_accum 1
    end_pid_bank_angle

    pid_beta
      kp 1.0
      ki 0.0985542
      kd 2.0
      max_error_accum 0
      low_pass_alpha 0.7
    end_pid_beta

    pid_delta_pitch
      kp 1.5313
      ki 0.92581
      kd 0.118689
      max_error_accum 10
    end_pid_delta_pitch

    pid_delta_roll
      kp 3.84484
      ki 5.92135e-09
      kd 0.0185156
      max_error_accum 1
    end_pid_delta_roll

    pid_flightpath_angle
      kp 0.483096
      ki 0.855124
      kd 2.0241e-07
      max_error_accum 0.5
    end_pid_flightpath_angle

    pid_forward_accel
      kp 20
      ki 2
      kd 0
      max_error_accum 1
    end_pid_forward_accel

    pid_pitch_angle
      kp 0.788463
      ki 0.997509
      kd 1.14704e-07
      max_error_accum 0.5
    end_pid_pitch_angle

    pid_pitch_rate
      kp 3.98551
      ki 1.95961e-06
      kd 0.591771
      max_error_accum 10
    end_pid_pitch_rate

    pid_roll_heading
      kp 0.0456199
      ki 0.106207
      kd 9.14495e-09
      max_error_accum 0
      low_pass_alpha 0.5
    end_pid_roll_heading

    pid_roll_rate
      kp 6.66335
      ki 0.0199451
      kd 0.251979
      max_error_accum 0
    end_pid_roll_rate

    pid_speed
      kp 1.17195
      ki 3.74672e-06
      kd 1.20782
      max_error_accum 10
    end_pid_speed

    pid_taxi_forward_accel
      kp 1
      ki 0
      kd 0
      max_error_accum 1
    end_pid_taxi_forward_accel

    pid_taxi_heading
      kp 1
      ki 0.01
      kd 0
      max_error_accum 10
    end_pid_taxi_heading

    pid_taxi_speed
      kp 1
      ki 0
      kd 0
      max_error_accum 1
    end_pid_taxi_speed

    pid_taxi_yaw_rate
      kp 0.1
      ki 0.2
      kd 0
      max_error_accum 10
    end_pid_taxi_yaw_rate

    pid_vert_speed
      kp 0.00116256
      ki 0.00267028
      kd 1.26032e-09
      max_error_accum 60
      ignore_large_error_accum 500
    end_pid_vert_speed

    pid_yaw_heading
      kp 0.210933
      ki 4.87967e-08
      kd 1.09535
      max_error_accum 1
    end_pid_yaw_heading

    pid_yaw_rate
      kp 2.61981e-07
      ki 14.2191
      kd 5.10485e-09
      max_error_accum 1
    end_pid_yaw_rate

    limits_and_settings
      include autopilot_config_g_limits.txt
      afterburner_threshold       1
      speedbrake_threshold        0
      alpha_min                   -16
      alpha_max                   20
      pitch_rate_min              -10
      pitch_rate_max              40
      vert_speed_min              -15000
      vert_speed_max              15000
      beta_max                    10
      yaw_rate_max                5
      roll_rate_max               15
      bank_angle_max              60
      forward_accel_min           -1
      forward_accel_max           2
      taxi_speed_max_fps          10
      taxi_yaw_rate_max           10
      turn_roll_in_multiplier     4         # This can be manually 'tuned' for improved performance
      route_allowable_angle_error 5 deg     # This can be manually 'tuned' for improved performance
    end_limits_and_settings

  end_pid_group

end_autopilot_config
```

- **演示要点**：演示 autopilot_config 的参数：vertical_middle_loop_rate_factor, vertical_outer_loop_rate_factor, lateral_middle_loop_rate_factor, lateral_outer_loop_rate_factor, speed_middle_loop_rate_factor, speed_outer_loop_rate_factor, control_method, min_taxi_turn_radius, use_simple_yaw_damper, pid_group

### autopilot_config（autopilot_config）｜

- **关键词**：autopilot_config, vertical_middle_loop_rate_factor, vertical_outer_loop_rate_factor, lateral_middle_loop_rate_factor, lateral_outer_loop_rate_factor, speed_middle_loop_rate_factor, speed_outer_loop_rate_factor, control_method, use_legacy_beta, min_taxi_turn_radius, pid_group, pid_pitch_gload, pid_delta_pitch
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/autopilot_config.txt:17-266`
- **片段**：

```text
autopilot_config

  vertical_middle_loop_rate_factor  4
  vertical_outer_loop_rate_factor   4
  lateral_middle_loop_rate_factor   4
  lateral_outer_loop_rate_factor    4
  speed_middle_loop_rate_factor     200
  speed_outer_loop_rate_factor      4

  control_method                    BANK_TO_TURN_NO_YAW

  use_legacy_beta                   true

# min_taxi_turn_radius              60.0 ft
# min_taxi_turn_radius              10.0 ft
  min_taxi_turn_radius              7.0 ft

# Anything less than 20 ft causes problems with an 80deg max NWS

  # ------------------------------------------------------------

  pid_group

    pid_pitch_gload

      gain_table
        control_value            0
        kp                       0.1
        ki                       0.15
        kd                       0
        max_error_accum          10
        low_pass_alpha           0.7
      end_gain_table

      gain_table
        control_value            400
        kp                       0.1
        ki                       0.15
        kd                       0
        max_error_accum          10
        low_pass_alpha           0.7
      end_gain_table

      gain_table
        control_value            800
        kp                       0.1
        ki                       0.15
        kd                       0
        max_error_accum          10
        low_pass_alpha           0.7
      end_gain_table

      gain_table
        control_value            1600
        kp                       0.15
        ki                       0.15
        kd                       0
        max_error_accum          10
        low_pass_alpha           0.7
      end_gain_table

    end_pid_pitch_gload

    pid_delta_pitch
      kp                         0.1
      ki                         1
      kd                         0
      max_error_accum            1
    end_pid_delta_pitch

    pid_vert_speed
      kp                         0.0002
      ki                         0.0005
      kd                         1e-05
      max_error_accum            10
    end_pid_vert_speed

    pid_pitch_angle
      kp                         0.1
      ki                         1
      kd                         0
      max_error_accum            1
    end_pid_pitch_angle

    pid_flightpath_angle
      kp                         0.1
      ki                         1
      kd                         0
      max_error_accum            1
    end_pid_flightpath_angle

    pid_altitude
      kp                         15
      ki                         0
      kd                         0.002
      max_error_accum            15
    end_pid_altitude

    pid_yaw_gload
      kp                         1
      ki                         0
      kd                         0
      max_error_accum            1
    end_pid_yaw_gload

    pid_yaw_rate
      kp                         1
      ki                         0
      kd                         0
      max_error_accum            1
    end_pid_yaw_rate

    pid_yaw_heading
      kp                         1
      ki                         0
      kd                         0
      max_error_accum            1
    end_pid_yaw_heading

# -----------------------------------------------------------------------------------------------------
    pid_taxi_heading
      kp                         1
      ki                         0.01
      kd                         0
      max_error_accum            10
    end_pid_taxi_heading

    pid_roll_rate

      gain_table
        control_value            0
        kp                       0.3
        ki                       3
        kd                       0.01
        max_error_accum          1
      end_gain_table

      gain_table
        control_value            150
        kp                       0.3
        ki                       3
        kd                       0.05
        max_error_accum          1
      end_gain_table

      gain_table
        control_value            350
        kp                       0.1
        ki                       0.4
        kd                       0.01
        max_error_accum          1
      end_gain_table

      gain_table
        control_value            1600
        kp                       0.01
        ki                       0.02
        kd                       0.001
        max_error_accum          50
      end_gain_table

    end_pid_roll_rate

    pid_delta_roll
      kp                         10
      ki                         0
      kd                         0
      max_error_accum            1
    end_pid_delta_roll

    pid_bank_angle
      kp                         0.8
      ki                         0.5
      kd                         0.1
      max_error_accum            5
    end_pid_bank_angle

    pid_roll_heading
      kp                         5
      ki                         0
      kd                         0
      max_error_accum            1
      low_pass_alpha             0.5
    end_pid_roll_heading

    pid_forward_accel
      kp                         3
      ki                         2
      kd                         0
      max_error_accum            1
    end_pid_forward_accel

    pid_speed
      kp                         0.1
      ki                         0.1
      kd                         0.01
      max_error_accum            5
    end_pid_speed

    pid_taxi_forward_accel
      kp                         1
      ki                         0
      kd                         0
      max_error_accum            1
    end_pid_taxi_forward_accel

    pid_taxi_speed
      kp                         0.1
      ki                         0.2
      kd                         0.01
      max_error_accum            10
    end_pid_taxi_speed

# -----------------------------------------------------------------------------------------------------
    pid_taxi_yaw_rate
      kp                         0.1
      ki                         0.2
      kd                         0
      max_error_accum            10
    end_pid_taxi_yaw_rate

    # .............................

    limits_and_settings
      afterburner_threshold      1
      speedbrake_threshold       -0.5
      pitch_gload_min            -1
      pitch_gload_max            9
      alpha_min                  -2
      alpha_max                  10
      pitch_rate_min             -5
      pitch_rate_max             30
      vert_speed_min             -5000
      vert_speed_max             5000
      yaw_gload_max              2
      beta_max                   10
      yaw_rate_max               15
      roll_rate_max              180
      bank_angle_max             60
      forward_accel_min          -1
      forward_accel_max          2
      taxi_speed_max_fps         10
      taxi_yaw_rate_max          30
    end_limits_and_settings

  end_pid_group

  # ------------------------------------------------------------

end_autopilot_config
```

- **演示要点**：演示 autopilot_config 的参数：vertical_middle_loop_rate_factor, vertical_outer_loop_rate_factor, lateral_middle_loop_rate_factor, lateral_outer_loop_rate_factor, speed_middle_loop_rate_factor, speed_outer_loop_rate_factor, control_method, use_legacy_beta, min_taxi_turn_radius, pid_group

### autopilot_config（autopilot_config_pm6）｜

- **关键词**：autopilot_config, vertical_middle_loop_rate_factor, vertical_outer_loop_rate_factor, lateral_middle_loop_rate_factor, lateral_outer_loop_rate_factor, speed_middle_loop_rate_factor, speed_outer_loop_rate_factor, control_method, pid_group, pid_alpha, pid_altitude, pid_bank_angle, pid_beta
- **出处**：`six_dof/six_dof_types/aircraft/b-hvy/controls/autopilot_config_pm6.txt:24-205`　（同签名共 4 处，另见 `six_dof/six_dof_types/spacecraft/orbiter-booster/controls/autopilot_config_pm6.txt:24`、`six_dof/six_dof_types/weapons/lrm-1-a/controls/autopilot_config_pm6.txt:24`、`six_dof/six_dof_types/weapons/lrm-1-c/controls/autopilot_config_pm6.txt:24`）
- **片段**：

```text
autopilot_config

  vertical_middle_loop_rate_factor  4
  vertical_outer_loop_rate_factor   4
  lateral_middle_loop_rate_factor   4
  lateral_outer_loop_rate_factor    4
  speed_middle_loop_rate_factor     200
  speed_outer_loop_rate_factor      4

  control_method                    BANK_TO_TURN_WITH_YAW

  # ------------------------------------------------------------

  pid_group

    pid_alpha
      kp 0.50437
      kd 0.0245818
      max_error_accum 0
      low_pass_alpha 0.7
    end_pid_alpha

    pid_altitude
      kp 7.82309
      ki 3.17896e-09
      kd 0.00884211
      max_error_accum 100
    end_pid_altitude

    pid_bank_angle
      kp 1.71093
      ki 0.00259252
      kd 0.0237339
      max_error_accum 1
    end_pid_bank_angle

    pid_beta
      kp 0.0797966
      ki 0.000379328
      kd 0.733064
      max_error_accum 0
      low_pass_alpha 0.7
    end_pid_beta

    pid_delta_pitch
      kp 4.81089
      ki 2.0339e-07
      kd 0.708688
      max_error_accum 10
    end_pid_delta_pitch

    pid_delta_roll
      kp 0.433584
      ki 0.0873381
      kd 4.82617e-09
      max_error_accum 1
    end_pid_delta_roll

    pid_flightpath_angle
      kp 0.787245
      ki 1.89362
      kd 0.00389162
      max_error_accum 0.5
    end_pid_flightpath_angle

    pid_forward_accel
      kp 20
      ki 2
      kd 0
      max_error_accum 1
    end_pid_forward_accel

    pid_pitch_angle
      kp 1.47182
      ki 0.000892027
      kd 0.166351
      max_error_accum 0.5
    end_pid_pitch_angle

    pid_pitch_rate
      kp 4.12419
      ki 7.07357e-07
      kd 0.384669
      max_error_accum 0
    end_pid_pitch_rate

    pid_roll_heading
      kp 0.263838
      ki 2.31549e-07
      kd 4.81808e-05
      max_error_accum 2
      low_pass_alpha 0.5
    end_pid_roll_heading

    pid_roll_rate
      kp 0.05
      max_error_accum 0
      low_pass_alpha 0.7
    end_pid_roll_rate

    pid_speed
      kp 0.294855
      ki 0.0306032
      kd 9.80844e-08
      max_error_accum 10
    end_pid_speed

    pid_taxi_forward_accel
      kp 1
      ki 0
      kd 0
      max_error_accum 1
    end_pid_taxi_forward_accel

    pid_taxi_heading
      kp 1
      ki 0.01
      kd 0
      max_error_accum 10
    end_pid_taxi_heading

    pid_taxi_speed
      kp 1
      ki 0
      kd 0
      max_error_accum 1
    end_pid_taxi_speed

    pid_taxi_yaw_rate
      kp 0.1
      ki 0.2
      kd 0
      max_error_accum 10
    end_pid_taxi_yaw_rate

    pid_vert_speed
      kp 0.000986434
      ki 0.00401185
      kd 3.32585e-06
      max_error_accum 60
      ignore_large_error_accum 500
    end_pid_vert_speed

    pid_yaw_heading
      kp 1
      ki 0
      kd 0
      max_error_accum 1
    end_pid_yaw_heading

    pid_yaw_rate
      kp 2.30546e-08
      ki 4.31481e-07
      kd 1.33212e-09
      max_error_accum 0
    end_pid_yaw_rate

    limits_and_settings
      include autopilot_config_g_limits.txt
      afterburner_threshold       1
      speedbrake_threshold        0
      alpha_min                   -16
      alpha_max                   20
      pitch_rate_min              -10
      pitch_rate_max              40
      vert_speed_min              -15000
      vert_speed_max              15000
      beta_max                    10
      yaw_rate_max                5
      roll_rate_max               10
      bank_angle_max              30
      forward_accel_min           -1
      forward_accel_max           2
      taxi_speed_max_fps          10
      taxi_yaw_rate_max           10
      turn_roll_in_multiplier     4         # This can be manually 'tuned' for improved performance
      route_allowable_angle_error 5 deg     # This can be manually 'tuned' for improved performance
    end_limits_and_settings

  end_pid_group

end_autopilot_config
```

- **演示要点**：演示 autopilot_config 的参数：vertical_middle_loop_rate_factor, vertical_outer_loop_rate_factor, lateral_middle_loop_rate_factor, lateral_outer_loop_rate_factor, speed_middle_loop_rate_factor, speed_outer_loop_rate_factor, control_method, pid_group, pid_alpha, pid_altitude

### autopilot_config（autopilot_config_pm6）｜

- **关键词**：autopilot_config, vertical_middle_loop_rate_factor, vertical_outer_loop_rate_factor, lateral_middle_loop_rate_factor, lateral_outer_loop_rate_factor, speed_middle_loop_rate_factor, speed_outer_loop_rate_factor, control_method, pid_group, pid_altitude, pid_bank_angle, pid_delta_pitch, pid_delta_roll
- **出处**：`six_dof/six_dof_types/aircraft/b-fw/controls/autopilot_config_pm6.txt:24-184`　（同签名共 7 处，另见 `six_dof/six_dof_types/aircraft/c-hvy/controls/autopilot_config_pm6.txt:24`、`six_dof/six_dof_types/aircraft/fa-hvy/controls/autopilot_config_pm6.txt:24`、`six_dof/six_dof_types/weapons/aam-mr/controls/autopilot_config_pm6.txt:24`）
- **片段**：

```text
autopilot_config

  vertical_middle_loop_rate_factor  4
  vertical_outer_loop_rate_factor   4
  lateral_middle_loop_rate_factor   4
  lateral_outer_loop_rate_factor    4
  speed_middle_loop_rate_factor     200
  speed_outer_loop_rate_factor      4

  control_method                    BANK_TO_TURN_WITH_YAW

  # ------------------------------------------------------------

  pid_group

    pid_altitude
      kp 7.01664
      ki 1.12921e-05
      kd 1.66228e-05
      max_error_accum 100
    end_pid_altitude

    pid_bank_angle
      kp 3.55674
      ki 0.0421938
      kd 1.94097e-07
      max_error_accum 1
    end_pid_bank_angle

    pid_delta_pitch
      kp 1.5313
      ki 0.92581
      kd 0.118689
      max_error_accum 10
    end_pid_delta_pitch

    pid_delta_roll
      kp 3.84484
      ki 5.92135e-09
      kd 0.0185156
      max_error_accum 1
    end_pid_delta_roll

    pid_flightpath_angle
      kp 0.483096
      ki 0.855124
      kd 2.0241e-07
      max_error_accum 0.5
    end_pid_flightpath_angle

    pid_forward_accel
      kp 20
      ki 2
      kd 0
      max_error_accum 1
    end_pid_forward_accel

    pid_pitch_angle
      kp 0.788463
      ki 0.997509
      kd 1.14704e-07
      max_error_accum 0.5
    end_pid_pitch_angle

    pid_pitch_rate
      kp 3.98551
      ki 1.95961e-06
      kd 0.591771
      max_error_accum 10
    end_pid_pitch_rate

    pid_roll_heading
      kp 0.0456199
      ki 0.106207
      kd 9.14495e-09
      max_error_accum 0
      low_pass_alpha 0.5
    end_pid_roll_heading

    pid_speed
      kp 1.17195
      ki 3.74672e-06
      kd 1.20782
      max_error_accum 10
    end_pid_speed

    pid_taxi_forward_accel
      kp 1
      ki 0
      kd 0
      max_error_accum 1
    end_pid_taxi_forward_accel

    pid_taxi_heading
      kp 1
      ki 0.01
      kd 0
      max_error_accum 10
    end_pid_taxi_heading

    pid_taxi_speed
      kp 1
      ki 0
      kd 0
      max_error_accum 1
    end_pid_taxi_speed

    pid_taxi_yaw_rate
      kp 0.1
      ki 0.2
      kd 0
      max_error_accum 10
    end_pid_taxi_yaw_rate

    pid_vert_speed
      kp 0.00116256
      ki 0.00267028
      kd 1.26032e-09
      max_error_accum 60
      ignore_large_error_accum 500
    end_pid_vert_speed

    pid_yaw_heading
      kp 0.210933
      ki 4.87967e-08
      kd 1.09535
      max_error_accum 1
    end_pid_yaw_heading

    pid_yaw_rate
      kp 2.61981e-07
      ki 14.2191
      kd 5.10485e-09
      max_error_accum 1
    end_pid_yaw_rate

    limits_and_settings
      include autopilot_config_g_limits.txt
      afterburner_threshold       1
      speedbrake_threshold        0
      alpha_min                   -16
      alpha_max                   20
      pitch_rate_min              -10
      pitch_rate_max              40
      vert_speed_min              -15000
      vert_speed_max              15000
      beta_max                    10
      yaw_rate_max                5
      roll_rate_max               15
      bank_angle_max              60
      forward_accel_min           -1
      forward_accel_max           2
      taxi_speed_max_fps          10
      taxi_yaw_rate_max           10
      turn_roll_in_multiplier     4         # This can be manually 'tuned' for improved performance
      route_allowable_angle_error 5 deg     # This can be manually 'tuned' for improved performance
    end_limits_and_settings

  end_pid_group

end_autopilot_config
```

- **演示要点**：演示 autopilot_config 的参数：vertical_middle_loop_rate_factor, vertical_outer_loop_rate_factor, lateral_middle_loop_rate_factor, lateral_outer_loop_rate_factor, speed_middle_loop_rate_factor, speed_outer_loop_rate_factor, control_method, pid_group, pid_altitude, pid_bank_angle

### autopilot_config（autopilot_config_pm6）｜

- **关键词**：autopilot_config, vertical_middle_loop_rate_factor, vertical_outer_loop_rate_factor, lateral_middle_loop_rate_factor, lateral_outer_loop_rate_factor, speed_middle_loop_rate_factor, speed_outer_loop_rate_factor, control_method, pid_group, pid_altitude, pid_bank_angle, pid_delta_pitch, pid_delta_roll
- **出处**：`six_dof/six_dof_types/aircraft/fa-lgt/controls/autopilot_config_pm6.txt:24-152`　（同签名共 3 处，另见 `six_dof/six_dof_types/weapons/agm-mrc/controls/autopilot_config_pm6.txt:24`、`six_dof/six_dof_types/weapons/sam-mr/controls/autopilot_config_pm6.txt:24`）
- **片段**：

```text
autopilot_config

  vertical_middle_loop_rate_factor  4
  vertical_outer_loop_rate_factor   4
  lateral_middle_loop_rate_factor   4
  lateral_outer_loop_rate_factor    4
  speed_middle_loop_rate_factor     200
  speed_outer_loop_rate_factor      4

  control_method                    BANK_TO_TURN_WITH_YAW

  # ------------------------------------------------------------

  pid_group

    pid_altitude
      kp 7.44406
      ki 0.74806
      kd 0.2
      max_error_accum 100
    end_pid_altitude

    pid_bank_angle
      kp 2.5
      ki 0
      kd 0.01
      max_error_accum 0
      low_pass_alpha 0.5
    end_pid_bank_angle

    pid_delta_pitch
      kp 0.836492
      ki 0.694051
      max_error_accum 0.5
    end_pid_delta_pitch

    pid_delta_roll
      kp 2
      ki 0
      kd 0.01
      max_error_accum 0
    end_pid_delta_roll

    pid_flightpath_angle
      kp 2.39429
      ki 1.14449
      kd 0.0509812
      max_error_accum 0.5
    end_pid_flightpath_angle

    pid_forward_accel
      kp 20
      ki 2
      kd 0
      max_error_accum 1
    end_pid_forward_accel

    pid_pitch_angle
      kp 0.836492
      ki 0.694051
      max_error_accum 0.5
    end_pid_pitch_angle

    pid_pitch_rate
      kp 0.064873
      ki 1.68004e-05
      max_error_accum 0
    end_pid_pitch_rate

    pid_roll_heading
      kp 0.218918
      ki 0.000224949
      max_error_accum 2
      low_pass_alpha 0.5
    end_pid_roll_heading

    pid_speed
      kp 0.02
      ki 0.01
      kd 0.001
      max_error_accum 10
      low_pass_alpha 0.5
    end_pid_speed

    pid_vert_speed
      kp 0.0005
      ki 0.000454646
      max_error_accum 60
      ignore_large_error_accum 500
      low_pass_alpha 0.5
    end_pid_vert_speed

    pid_yaw_heading
      kp 0.210933
      ki 4.87967e-08
      kd 1.09535
      max_error_accum 1
    end_pid_yaw_heading

    pid_yaw_rate
      kp 1.91375e-05
      ki 3.02441
      kd 4.23386e-07
      max_error_accum 1
    end_pid_yaw_rate

    limits_and_settings
      include autopilot_config_g_limits.txt
      afterburner_threshold       1
      speedbrake_threshold        0
      alpha_min                   -16
      alpha_max                   20
      pitch_rate_min              -10
      pitch_rate_max              40
      vert_speed_min              -15000
      vert_speed_max              15000
      beta_max                    10
      yaw_rate_max                5
      roll_rate_max               180
      bank_angle_max              180
      forward_accel_min           -1
      forward_accel_max           2
      turn_roll_in_multiplier     4         # This can be manually 'tuned' for improved performance
      route_allowable_angle_error 5 deg     # This can be manually 'tuned' for improved performance
    end_limits_and_settings

  end_pid_group

end_autopilot_config
```

- **演示要点**：演示 autopilot_config 的参数：vertical_middle_loop_rate_factor, vertical_outer_loop_rate_factor, lateral_middle_loop_rate_factor, lateral_outer_loop_rate_factor, speed_middle_loop_rate_factor, speed_outer_loop_rate_factor, control_method, pid_group, pid_altitude, pid_bank_angle

### autopilot_config（autopilot_config_pm6）｜

- **关键词**：autopilot_config, vertical_middle_loop_rate_factor, vertical_outer_loop_rate_factor, lateral_middle_loop_rate_factor, lateral_outer_loop_rate_factor, speed_middle_loop_rate_factor, speed_outer_loop_rate_factor, control_method, pid_group, pid_altitude, pid_bank_angle, pid_flightpath_angle, pid_forward_accel
- **出处**：`six_dof/six_dof_types/spacecraft/orbiter-main/controls/autopilot_config_pm6.txt:24-143`
- **片段**：

```text
autopilot_config

  vertical_middle_loop_rate_factor  4
  vertical_outer_loop_rate_factor   4
  lateral_middle_loop_rate_factor   4
  lateral_outer_loop_rate_factor    4
  speed_middle_loop_rate_factor     200
  speed_outer_loop_rate_factor      4

  control_method                    BANK_TO_TURN_WITH_YAW

# ------------------------------------------------------------

  pid_group
  
    pid_altitude
      kp 10
      ki 10
      kd 50
      max_error_accum 100
    end_pid_altitude

    pid_bank_angle
      kp 0.1
      ki 0
      kd 0.01
      max_error_accum 1
    end_pid_bank_angle
    
    pid_flightpath_angle
      kp 2
      ki 0
      kd 0.0
      max_error_accum 0.5
    end_pid_flightpath_angle

    pid_forward_accel
      kp 20
      ki 2
      kd 0
      max_error_accum 1
    end_pid_forward_accel

    pid_pitch_angle
      kp 1.0
      ki 0.0
      kd 0.2
      low_pass_alpha 0.5
    end_pid_pitch_angle

    pid_pitch_rate
      kp 0.1
      ki 0.2
      kd 0.001
      max_error_accum 0
    end_pid_pitch_rate

    pid_roll_heading
      kp 1
      ki 0
      kd 0
      max_error_accum 2
      low_pass_alpha 0.5
    end_pid_roll_heading

    pid_speed
      kp 0.5
      ki 0.05
      kd 0.5
      max_error_accum 10
    end_pid_speed

    pid_vert_speed
      kp 0.0012
      ki 0
      kd 0
      max_error_accum 60
      ignore_large_error_accum 500
    end_pid_vert_speed

    pid_yaw_heading
      kp 1
      ki 0
      kd 0
      max_error_accum 1
    end_pid_yaw_heading

    pid_yaw_rate
      kp 1
      ki 0
      kd 0
      max_error_accum 0
    end_pid_yaw_rate


    limits_and_settings
     include autopilot_config_g_limits.txt
     afterburner_threshold       1
     speedbrake_threshold        0
     alpha_min                   -20
     alpha_max                   20
     pitch_rate_min              -60
     pitch_rate_max              60
     vert_speed_min              -600000
     vert_speed_max              600000
     beta_max                    20.0
     yaw_rate_max                60.0
     roll_rate_max               360.0
     bank_angle_max              180.0
     forward_accel_min           -1
     forward_accel_max           2
     taxi_speed_max_fps          10
     taxi_yaw_rate_max           10
     turn_roll_in_multiplier     4.0       # This can be manually 'tuned' for improved performance
     route_allowable_angle_error 5.0 deg   # This can be manually 'tuned' for improved performance
    end_limits_and_settings

  end_pid_group

end_autopilot_config
```

- **演示要点**：演示 autopilot_config 的参数：vertical_middle_loop_rate_factor, vertical_outer_loop_rate_factor, lateral_middle_loop_rate_factor, lateral_outer_loop_rate_factor, speed_middle_loop_rate_factor, speed_outer_loop_rate_factor, control_method, pid_group, pid_altitude, pid_bank_angle

### autopilot_config（autopilot_config_pm6）｜

- **关键词**：autopilot_config, vertical_middle_loop_rate_factor, vertical_outer_loop_rate_factor, lateral_middle_loop_rate_factor, lateral_outer_loop_rate_factor, speed_middle_loop_rate_factor, speed_outer_loop_rate_factor, control_method, pid_group
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:10-109`　（同签名共 2 处，另见 `six_dof_with_brawler/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:10`）
- **片段**：

```text
autopilot_config

   vertical_middle_loop_rate_factor   4
   vertical_outer_loop_rate_factor    4
   lateral_middle_loop_rate_factor    4
   lateral_outer_loop_rate_factor     4
   speed_middle_loop_rate_factor    200
   speed_outer_loop_rate_factor       4

   control_method                     BANK_TO_TURN_WITH_YAW

   pid_group

      pid_altitude
         kp 7.50
         ki 2.00
         kd 0.10

         max_error_accum 200
      end_pid_altitude

      pid_bank_angle
         kp 2.50
         kd 0.01

         low_pass_alpha 0.5
      end_pid_bank_angle

      pid_flightpath_angle
         kp 2.50
         ki 1.15
         kd 0.05

         max_error_accum 0.5
      end_pid_flightpath_angle

      pid_forward_accel
         kp 20.00
         ki  2.00

         max_error_accum 1.0
      end_pid_forward_accel

      pid_pitch_angle
         kp 0.80
         ki 0.70

         max_error_accum 0.5
      end_pid_pitch_angle

      pid_pitch_rate
         kp 0.06
      end_pid_pitch_rate

      pid_roll_heading
         kp 0.20
         ki 0.0002

         max_error_accum 2.0
         low_pass_alpha  0.5
      end_pid_roll_heading

      pid_speed
         kp 0.02
         ki 0.01
         kd 0.001

         max_error_accum 10.0
         low_pass_alpha   0.5
      end_pid_speed

      pid_vert_speed
         kp 0.001
      end_pid_vert_speed

      limits_and_settings
         pitch_gload_min             -2
         pitch_gload_max              8
         yaw_gload_max                0.5
         afterburner_threshold        1
         speedbrake_threshold         0
         alpha_min                  -16
         alpha_max                   20
         pitch_rate_min             -10
         pitch_rate_max              40
         vert_speed_min          -15000
         vert_speed_max           15000
         beta_max                    10
         yaw_rate_max                 5
         roll_rate_max              180
         bank_angle_max              90
         forward_accel_min           -1
         forward_accel_max            2
         turn_roll_in_multiplier      4
         route_allowable_angle_error  5 deg
      end_limits_and_settings

   end_pid_group

end_autopilot_config
```

- **演示要点**：演示 autopilot_config 的参数：vertical_middle_loop_rate_factor, vertical_outer_loop_rate_factor, lateral_middle_loop_rate_factor, lateral_outer_loop_rate_factor, speed_middle_loop_rate_factor, speed_outer_loop_rate_factor, control_method, pid_group

### autopilot_support_tables（autopilot_support_tables）｜

- **关键词**：autopilot_support_tables, cl_max_mach_table, cl_min_mach_table, alpha_max_mach_table, alpha_min_mach_table, alpha_versus_mach_cl_table, stick_zero_moment_mach_alpha_table
- **出处**：`p6dof/p6dof_types/misc/srb-rato/controls/autopilot_support_tables.txt:18-95`
- **片段**：

```text
autopilot_support_tables

   cl_max_mach_table
      0.000    0.934
      1.000    0.931
      50.000   0.909
   end_cl_max_mach_table

   cl_min_mach_table
      0.000   -0.934
      1.000   -0.931
      50.000  -0.909
   end_cl_min_mach_table

   alpha_max_mach_table
      0.000    26.010
      1.000    26.010
      50.000   26.010
   end_alpha_max_mach_table

   alpha_min_mach_table
      0.000   -26.010
      1.000   -26.010
      50.000  -26.010
   end_alpha_min_mach_table

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

   effective_CL_versus_mach_alpha_table
      irregular_table
      independent_variable mach precision float
      independent_variable alpha units deg
      dependent_variable precision float
      mach   0.00
         alpha  -26.00  0.000   26.01
         values -0.934  0.000   0.934
      mach   1.00
         alpha  -26.00  0.000   26.01
         values -0.934  0.000   0.934
      mach  50.00
         alpha  -26.00  0.000   26.01
         values -0.934  0.000   0.934
      end_irregular_table
   end_effective_CL_versus_mach_alpha_table

end_autopilot_support_tables
```

- **演示要点**：演示 autopilot_support_tables 的参数：cl_max_mach_table, cl_min_mach_table, alpha_max_mach_table, alpha_min_mach_table, alpha_versus_mach_cl_table, stick_zero_moment_mach_alpha_table

### clamp_gain（flight_controls）｜

- **关键词**：clamp_gain, name, min_clamp, max_clamp
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/flight_controls.txt:107-111`　（同签名共 5 处，另见 `p6dof/p6dof_types/weapons/simple-icbm/flight_controls.txt:113`、`p6dof/p6dof_types/weapons/simple-icbm/flight_controls.txt:119`、`p6dof/p6dof_types/weapons/simple-icbm/flight_controls.txt:125`）
- **片段**：

```text
 clamp_gain
  name      Clamp_PosNeg
  min_clamp  -1.0
  max_clamp  1.0
 end_clamp_gain
```

- **演示要点**：演示 clamp_gain 的参数：name, min_clamp, max_clamp

### clamp_gain（flight_controls）｜

- **关键词**：clamp_gain, min_clamp, max_clamp
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:108-111`　（同签名共 174 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:113`、`p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:118`、`p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:123`）
- **片段**：

```text
clamp_gain Clamp_PosNeg
   min_clamp -1.0
   max_clamp  1.0
end_clamp_gain
```

- **演示要点**：演示 clamp_gain 的参数：min_clamp, max_clamp

### control_boolean（flight_controls）｜

- **关键词**：control_boolean, name, current_value, threshold_value, inputs, control_input, modifier
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/flight_controls.txt:747-757`　（同签名共 2 处，另见 `p6dof/p6dof_types/weapons/simple-icbm/flight_controls.txt:760`）
- **片段**：

```text
 control_boolean
  name                       TriggerPulled
  current_value              0
  threshold_value            0.5
  inputs
   control_input
    name                     TriggerPulled
    modifier                 Clamp_ZeroOne
   end_control_input
  end_inputs
 end_control_boolean
```

- **演示要点**：演示 control_boolean 的参数：name, current_value, threshold_value, inputs, control_input, modifier

### control_boolean（flight_controls）｜

- **关键词**：control_boolean, current_value, threshold_value, inputs, control_input, modifier
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:669-677`　（同签名共 58 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:680`、`p6dof/p6dof_types/aircraft/b-fw/controls/flight_controls.txt:755`、`p6dof/p6dof_types/aircraft/b-fw/controls/flight_controls.txt:766`）
- **片段**：

```text
 control_boolean TriggerPulled
  current_value              0
  threshold_value            0.5
  inputs
   control_input TriggerPulled
    modifier                 Clamp_ZeroOne
   end_control_input
  end_inputs
 end_control_boolean
```

- **演示要点**：演示 control_boolean 的参数：current_value, threshold_value, inputs, control_input, modifier

### control_boolean（flight_controls）｜

- **关键词**：control_boolean, name, current_value, threshold_value, inputs, control_input
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/flight_controls.txt:605-614`
- **片段**：

```text
 control_boolean
  name                       NWS_EnableActive
  current_value              0
  threshold_value            0.5
  inputs
   control_input
    name                     NWS_Enable
   end_control_input
  end_inputs
 end_control_boolean
```

- **演示要点**：演示 control_boolean 的参数：name, current_value, threshold_value, inputs, control_input

### control_boolean（flight_controls）｜

- **关键词**：control_boolean, current_value, threshold_value, inputs, control_input
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:547-554`　（同签名共 29 处，另见 `p6dof/p6dof_types/aircraft/b-fw/controls/flight_controls.txt:633`、`p6dof/p6dof_types/aircraft/b-hvy/controls/flight_controls.txt:377`、`p6dof/p6dof_types/aircraft/c-hvy/controls/flight_controls.txt:419`）
- **片段**：

```text
 control_boolean NWS_EnableActive
  current_value              0
  threshold_value            0.5
  inputs
   control_input NWS_Enable
   end_control_input
  end_inputs
end_control_boolean
```

- **演示要点**：演示 control_boolean 的参数：current_value, threshold_value, inputs, control_input

### control_input（flight_controls）｜

- **关键词**：control_input, name, modifier
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/flight_controls.txt:245-248`　（同签名共 23 处，另见 `p6dof/p6dof_types/weapons/simple-icbm/flight_controls.txt:310`、`p6dof/p6dof_types/weapons/simple-icbm/flight_controls.txt:375`、`p6dof/p6dof_types/weapons/simple-icbm/flight_controls.txt:401`）
- **片段**：

```text
   control_input
    name                     RudderRight
    modifier                 Clamp_PosNeg
   end_control_input
```

- **演示要点**：演示 control_input 的参数：name, modifier

### control_input（flight_controls）｜

- **关键词**：control_input, modifier
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:175-177`　（同签名共 641 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:345`、`p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:348`、`p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:414`）
- **片段**：

```text
      control_input  RudderRight
         modifier        Clamp_PosNeg
      end_control_input
```

- **演示要点**：演示 control_input 的参数：modifier

### control_input（flight_controls）｜

- **关键词**：control_input, name
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/flight_controls.txt:610-612`
- **片段**：

```text
   control_input
    name                     NWS_Enable
   end_control_input
```

- **演示要点**：演示 control_input 的参数：name

### control_input（flight_controls）｜

- **关键词**：control_input
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:551-552`　（同签名共 29 处，另见 `p6dof/p6dof_types/aircraft/b-fw/controls/flight_controls.txt:637`、`p6dof/p6dof_types/aircraft/b-hvy/controls/flight_controls.txt:381`、`p6dof/p6dof_types/aircraft/c-hvy/controls/flight_controls.txt:423`）
- **片段**：

```text
   control_input NWS_Enable
   end_control_input
```

- **演示要点**：演示 control_input（最小结构，无子参数）

### control_inputs（control_inputs）｜

- **关键词**：control_inputs, control_name, std_stick_back, std_stick_right, std_rudder_right, std_throttle_mil, std_throttle_ab, std_thrust_reverser, std_thrust_vectoring_yaw, std_thrust_vectoring_pitch, std_thrust_vectoring_roll, std_speed_brakes_out, std_spoilers_out
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/control_inputs.txt:20-66`　（同签名共 28 处，另见 `p6dof/p6dof_types/aircraft/b-fw/controls/control_inputs.txt:20`、`p6dof/p6dof_types/aircraft/b-hvy/controls/control_inputs.txt:20`、`p6dof/p6dof_types/aircraft/c-hvy/controls/control_inputs.txt:20`）
- **片段**：

```text
   control_inputs

      control_name StickBack
      control_name StickRight
      control_name RudderRight
      control_name ThrottleMil
      control_name ThrottleAB
      control_name ThrustReverser
      control_name ThrustVectorYaw
      control_name ThrustVectorPitch
      control_name ThrustVectorRoll
      control_name LandingGearDown
      control_name FlapsDown
      control_name SpeedBrakesOut
      control_name SpoilersOut
      control_name NoseWheelRight
      control_name NWS_Right
      control_name NWS_Enable
      control_name RgtWheelBrake
      control_name LftWheelBrake
      control_name TrimPitchUp
      control_name TrimPitchDown
      control_name TrimRollRight
      control_name TrimRollLeft
      control_name TriggerPulled
      control_name ButtonPressed

      std_stick_back              StickBack
      std_stick_right             StickRight
      std_rudder_right            RudderRight
      std_throttle_mil            ThrottleMil
      std_throttle_ab             ThrottleAB
      std_thrust_reverser         ThrustReverser
      std_thrust_vectoring_yaw    ThrustVectorYaw
      std_thrust_vectoring_pitch  ThrustVectorPitch
      std_thrust_vectoring_roll   ThrustVectorRoll
      std_speed_brakes_out        SpeedBrakesOut
      std_spoilers_out            SpoilersOut
      std_flaps_down              FlapsDown
      std_landing_gear_down       LandingGearDown
      std_nose_wheel_steering     NoseWheelRight
      std_nws_steering            NWS_Right
      std_nws_enabled             NWS_Enable
      std_wheel_brake_left        LftWheelBrake
      std_wheel_brake_right       RgtWheelBrake

   end_control_inputs
```

- **演示要点**：演示 control_inputs 的参数：control_name, std_stick_back, std_stick_right, std_rudder_right, std_throttle_mil, std_throttle_ab, std_thrust_reverser, std_thrust_vectoring_yaw, std_thrust_vectoring_pitch, std_thrust_vectoring_roll

### control_surface（flight_controls）｜

- **关键词**：control_surface, name, min_angle, max_angle, current_angle, inputs, control_input, modifier, angle_mapping_table, actuator, max_positive_rate, max_negative_rate
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/flight_controls.txt:369-392`　（同签名共 10 处，另见 `p6dof/p6dof_types/weapons/simple-icbm/flight_controls.txt:395`、`p6dof/p6dof_types/weapons/simple-icbm/flight_controls.txt:421`、`p6dof/p6dof_types/weapons/simple-icbm/flight_controls.txt:447`）
- **片段**：

```text
 control_surface
  name                       Spoilers-Both-Extended
  min_angle                  0.00 deg
  max_angle                  70.00 deg
  current_angle              0.0 deg
  inputs
   control_input
    name                     SpoilersOut
    modifier                 Clamp_ZeroOne
   end_control_input
  end_inputs
  angle_mapping_table
    0.0      0.000
    1.0     70.000
  end_angle_mapping_table
  actuator
#   lag                     0.00010 sec
   max_positive_rate       10.00 deg/sec
   max_negative_rate       -10.00 deg/sec
   max_angle               70.00 deg
   min_angle               0.00 deg
   current_angle           0.00 deg
  end_actuator
 end_control_surface
```

- **演示要点**：演示 control_surface 的参数：name, min_angle, max_angle, current_angle, inputs, control_input, modifier, angle_mapping_table, actuator, max_positive_rate

### control_surface（flight_controls_landing_gear）｜

- **关键词**：control_surface, min_angle, max_angle, current_angle, inputs, control_input, modifier, angle_mapping_table, actuator, max_positive_rate, max_negative_rate
- **出处**：`p6dof/p6dof_types/aircraft/fa-lgt/controls/flight_controls_landing_gear.txt:532-591`　（同签名共 2 处，另见 `six_dof/six_dof_types/aircraft/fa-lgt/controls/flight_controls_landing_gear.txt:532`）
- **片段**：

```text
 control_surface NWS_Angle_Rgt
  min_angle                  -80.00 deg
  max_angle                  80.00 deg
  current_angle              0.0 deg
  inputs
   control_input NWS_Right
    modifier                 Clamp_PosNeg
   end_control_input
  end_inputs
  angle_mapping_table
   -1.000    -80.000
   -0.950    -69.331
   -0.900    -59.688
   -0.850    -51.017
   -0.800    -43.264
   -0.750    -36.375
   -0.700    -30.296
   -0.650    -24.973
   -0.600    -20.352
   -0.550    -16.379
   -0.500    -13.000
   -0.450    -10.161
   -0.400     -7.808
   -0.350     -5.887
   -0.300     -4.344
   -0.250     -3.125
   -0.200     -2.176
   -0.150     -1.443
   -0.100     -0.872
   -0.050     -0.409
   0.000      0.000
   0.050      0.409
   0.100      0.872
   0.150      1.443
   0.200      2.176
   0.250      3.125
   0.300      4.344
   0.350      5.887
   0.400      7.808
   0.450     10.161
   0.500     13.000
   0.550     16.379
   0.600     20.352
   0.650     24.973
   0.700     30.296
   0.750     36.375
   0.800     43.264
   0.850     51.017
   0.900     59.688
   0.950     69.331
   1.000     80.000
  end_angle_mapping_table
  actuator
   max_positive_rate       300.00 deg/sec
   max_negative_rate       -300.00 deg/sec
   max_angle               80.00 deg
   min_angle               -80.00 deg
   current_angle           0.00 deg
  end_actuator
 end_control_surface
```

- **演示要点**：演示 control_surface 的参数：min_angle, max_angle, current_angle, inputs, control_input, modifier, angle_mapping_table, actuator, max_positive_rate, max_negative_rate

### control_surface（flight_controls）｜

- **关键词**：control_surface, min_angle, max_angle, current_angle, inputs, angle_mapping_table, actuator
- **出处**：`p6dof/p6dof_types/aircraft/fa-hvy/controls/flight_controls.txt:405-425`　（同签名共 168 处，另见 `p6dof/p6dof_types/aircraft/fa-lgt/controls/flight_controls.txt:371`、`p6dof/p6dof_types/aircraft/fa-lgt/controls/flight_controls.txt:394`、`p6dof/p6dof_types/aircraft/fa-lgt/controls/flight_controls.txt:417`）
- **片段**：

```text
control_surface  SpeedBrake
   min_angle        0.0 deg
   max_angle       40.0 deg
   current_angle    0.0 deg
   inputs
      control_input  SpeedBrakesOut
         modifier  Clamp_PosNeg
      end_control_input
   end_inputs
   angle_mapping_table
       0.000     0.0
       1.000    40.0
   end_angle_mapping_table
   actuator
      max_positive_rate     40.0 deg/sec
      max_negative_rate    -60.0 deg/sec
      max_angle             40.0 deg
      min_angle              0.0 deg
      current_angle          0.0 deg
   end_actuator
end_control_surface
```

- **演示要点**：演示 control_surface 的参数：min_angle, max_angle, current_angle, inputs, angle_mapping_table, actuator

### control_value（flight_controls）｜

- **关键词**：control_value, name, min_value, max_value, current_value, inputs, control_input, modifier
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/flight_controls.txt:617-628`　（同签名共 9 处，另见 `p6dof/p6dof_types/weapons/simple-icbm/flight_controls.txt:631`、`p6dof/p6dof_types/weapons/simple-icbm/flight_controls.txt:645`、`p6dof/p6dof_types/weapons/simple-icbm/flight_controls.txt:659`）
- **片段**：

```text
 control_value
  name                       RightWheelBrake
  min_value                  0.0
  max_value                  1.0
  current_value              0.0
  inputs
   control_input
    name                     RgtWheelBrake
    modifier                 Clamp_ZeroOne
   end_control_input
  end_inputs
 end_control_value
```

- **演示要点**：演示 control_value 的参数：name, min_value, max_value, current_value, inputs, control_input, modifier

### control_value（flight_controls）｜

- **关键词**：control_value, min_value, max_value, current_value, inputs, control_input, modifier
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:569-578`　（同签名共 232 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:581`、`p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:593`、`p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:605`）
- **片段**：

```text
 control_value LeftWheelBrake
  min_value                  0.0
  max_value                  1.0
  current_value              0.0
  inputs
   control_input LftWheelBrake
    modifier                 Clamp_ZeroOne
   end_control_input
  end_inputs
 end_control_value
```

- **演示要点**：演示 control_value 的参数：min_value, max_value, current_value, inputs, control_input, modifier

### control_value（flight_controls）｜

- **关键词**：control_value, inputs, control_input, modifier
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:557-566`　（同签名共 29 处，另见 `p6dof/p6dof_types/aircraft/b-fw/controls/flight_controls.txt:643`、`p6dof/p6dof_types/aircraft/b-hvy/controls/flight_controls.txt:387`、`p6dof/p6dof_types/aircraft/c-hvy/controls/flight_controls.txt:429`）
- **片段**：

```text
 control_value Wheel_Brake_Rgt
 min_value                  0.0
 max_value                  1.0
 current_value              0.0
  inputs
   control_input RgtWheelBrake
    modifier                 Clamp_ZeroOne
   end_control_input
  end_inputs
 end_control_value
```

- **演示要点**：演示 control_value 的参数：inputs, control_input, modifier

### delays（weapons_manager_sam）｜

- **关键词**：delays, time_between_engagements, expected_sensor_acquisition
- **出处**：`iads_c2_demos/processors/weapons_manager_sam.txt:26-31`
- **片段**：

```text
   delays
      # Note: time_to_launch delay is on the weapon as firing_delay and
		   # salvo_shot delay is on the weapon as salvo_interval
      time_between_engagements    0 seconds
      expected_sensor_acquisition 0 seconds
   end_delays
```

- **演示要点**：演示 delays 的参数：time_between_engagements, expected_sensor_acquisition

### distribution（false_target）｜

- **关键词**：distribution, range_distribution, bearing_reference, radius, sector_arc
- **出处**：`aea_iads/weapons/jammer/false_target.txt:29-34`
- **片段**：

```text
  distribution
    range_distribution exponential
    bearing_reference  jammer
    radius      500 km
    sector_arc  360 deg
  end_distribution
```

- **演示要点**：演示 distribution 的参数：range_distribution, bearing_reference, radius, sector_arc

### distribution（false-target_command_center）｜

- **关键词**：distribution, radius, sector_arc, bearing_reference
- **出处**：`electronic_warfare/false-target_command_center.txt:64-68`　（同签名共 2 处，另见 `electronic_warfare/test_false_targets/weapons/jammer/false_target.txt:28`）
- **片段**：

```text
  distribution
    radius      150000 m
    sector_arc  360 deg
    bearing_reference jammer
  end_distribution
```

- **演示要点**：演示 distribution 的参数：radius, sector_arc, bearing_reference

### dynamics（aerobraking_demo）｜

- **关键词**：dynamics, term
- **出处**：`satellite_demos/aerobraking_demo.txt:49-58`　（同签名共 3 处，另见 `cislunar/scenarios/orbiter.txt:39`、`multiresolution_demos/movers/space_mover.txt:26`）
- **片段**：

```text
      dynamics
         term earth_monopole 
         end_term
         
         term atmospheric_drag 
            cross_sectional_area 10.0 m^2
            drag_coefficient 1.2
            atmosphere_model atmo
         end_term
      end_dynamics
```

- **演示要点**：演示 dynamics 的参数：term

### ejectable（atlas_v_401_base）｜

- **关键词**：ejectable, mass, time
- **出处**：`space_operations/launch_vehicles/atlas_v_401/atlas_v_401_base.txt:46-49`　（同签名共 21 处，另见 `space_operations/launch_vehicles/atlas_v_401/atlas_v_401_base.txt:51`、`space_operations/launch_vehicles/delta_iv_m/delta_iv_m_base.txt:53`、`space_operations/launch_vehicles/falcon_9/falcon_9_base.txt:66`）
- **片段**：

```text
      ejectable interstage
         mass 947 kg    # (SF101)
         time 253 sec   # (SF101) end of first stage
      end_ejectable
```

- **演示要点**：演示 ejectable 的参数：mass, time

### ejector（chaff_example）｜

- **关键词**：ejector, quantity, parcel_type, location, ejection_velocity, ejection_azimuth, ejection_elevation
- **出处**：`chaff/chaff_example.txt:49-57`　（同签名共 6 处，另见 `chaff/chaff_example.txt:59`、`chaff/chaff_example.txt:69`、`chaff/chaff_example_ttr.txt:51`）
- **片段**：

```text
   ejector eject-1
     quantity 15
     parcel_type CHAFF_PARCEL
     location 0 5 0 m

     ejection_velocity 25 m/s
     ejection_azimuth 90 deg
     ejection_elevation 30 deg
   end_ejector
```

- **演示要点**：演示 ejector 的参数：quantity, parcel_type, location, ejection_velocity, ejection_azimuth, ejection_elevation

### engagement_settings（weapons_manager_ai）｜

- **关键词**：engagement_settings, ew_targets, tar_targets, ttr_targets, engage_local_ttr_targets_only
- **出处**：`iads_c2_demos/processors/weapons_manager_ai.txt:22-27`　（同签名共 2 处，另见 `iads_c2_demos/processors/weapons_manager_sam.txt:19`）
- **片段**：

```text
   engagement_settings
      ew_targets                      false
      tar_targets                     false
      ttr_targets                     true
      engage_local_ttr_targets_only   true
   end_engagement_settings
```

- **演示要点**：演示 engagement_settings 的参数：ew_targets, tar_targets, ttr_targets, engage_local_ttr_targets_only

### engine（orbiter-main）｜

- **关键词**：engine, rel_pos_x, rel_pos_y, rel_pos_z, rel_yaw, rel_pitch, maximum_yaw_acceleration_at_thrust, maximum_pitch_acceleration_at_thrust, maximum_roll_acceleration_at_thrust, fuel_feed
- **出处**：`six_dof/six_dof_types/spacecraft/orbiter-main/orbiter-main.txt:44-56`
- **片段**：

```text
         engine Engine  ORBITER-MAIN-RKT_PM6
            rel_pos_x                       -1.71444 ft
            rel_pos_y                        0.00000 ft
            rel_pos_z                       -0.00000 ft
            rel_yaw                          0.00000 deg
            rel_pitch                        0.00000 deg

            maximum_yaw_acceleration_at_thrust   1000 deg/s^2  3000 lbf
            maximum_pitch_acceleration_at_thrust 1000 deg/s^2  3000 lbf
            maximum_roll_acceleration_at_thrust  1000 deg/s^2  3000 lbf
            
            fuel_feed RocketFuel
         end_engine
```

- **演示要点**：演示 engine 的参数：rel_pos_x, rel_pos_y, rel_pos_z, rel_yaw, rel_pitch, maximum_yaw_acceleration_at_thrust, maximum_pitch_acceleration_at_thrust, maximum_roll_acceleration_at_thrust, fuel_feed

### engine（orbiter-booster）｜

- **关键词**：engine, rel_pos_x, rel_pos_y, rel_pos_z, rel_yaw, rel_pitch, maximum_yaw_acceleration_at_thrust, maximum_pitch_acceleration_at_thrust, fuel_feed
- **出处**：`six_dof/six_dof_types/spacecraft/orbiter-booster/orbiter-booster.txt:42-53`　（同签名共 2 处，另见 `six_dof/six_dof_types/weapons/aam-sr/aam-sr-tvc.txt:92`）
- **片段**：

```text
         engine Engine  ORBITER-BOOSTER-RKT_PM6
            rel_pos_x                        0.66601 ft
            rel_pos_y                        0.00000 ft
            rel_pos_z                       -0.00000 ft
            rel_yaw                          0.00000 deg
            rel_pitch                        0.00000 deg            

            maximum_yaw_acceleration_at_thrust   100 deg/s^2  30000 lbf
            maximum_pitch_acceleration_at_thrust 100 deg/s^2  30000 lbf
            
            fuel_feed   Propellant
         end_engine         
```

- **演示要点**：演示 engine 的参数：rel_pos_x, rel_pos_y, rel_pos_z, rel_yaw, rel_pitch, maximum_yaw_acceleration_at_thrust, maximum_pitch_acceleration_at_thrust, fuel_feed

### engine（simple-icbm）｜

- **关键词**：engine, rel_pos_x, rel_pos_y, rel_pos_z, rel_yaw, rel_pitch, rel_roll, fuel_feed
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:481-489`
- **片段**：

```text
         engine    PBVMainEngine   ICBM_PBV_MainEngine
            rel_pos_x             0.0 ft
            rel_pos_y             0.0 ft
            rel_pos_z             0.0 ft
            rel_yaw               0.0 deg
            rel_pitch             0.0 deg
            rel_roll              0.0 deg
            fuel_feed             FeederTank
         end_engine
```

- **演示要点**：演示 engine 的参数：rel_pos_x, rel_pos_y, rel_pos_z, rel_yaw, rel_pitch, rel_roll, fuel_feed

### engine（a-lgt）｜

- **关键词**：engine, rel_pos_x, rel_pos_y, rel_pos_z, rel_yaw, rel_pitch, fuel_feed
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/a-lgt.txt:39-46`　（同签名共 79 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/a-lgt.txt:48`、`p6dof/p6dof_types/aircraft/b-fw/b-fw.txt:39`、`p6dof/p6dof_types/aircraft/b-fw/b-fw.txt:48`）
- **片段**：

```text
         engine Engine_Right  A-M4-22A-1-TF
            rel_pos_x                      -11.77330 ft
            rel_pos_y                        4.20000 ft
            rel_pos_z                       -1.36416 ft
            rel_yaw                          0.00000 deg
            rel_pitch                        3.00000 deg
            fuel_feed                   MainFuelTank
         end_engine
```

- **演示要点**：演示 engine 的参数：rel_pos_x, rel_pos_y, rel_pos_z, rel_yaw, rel_pitch, fuel_feed

### engine（simple-icbm）｜

- **关键词**：engine, rel_pos_x, rel_pos_y, rel_pos_z, rel_yaw, rel_pitch, rel_roll
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:33-40`　（同签名共 5 处，另见 `p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:173`、`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:313`、`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:352`）
- **片段**：

```text
         engine     Stage1Motor   ICBM_Stage1_Rocket
            rel_pos_x             0.0 ft
            rel_pos_y             0.0 ft
            rel_pos_z             0.0 ft
            rel_yaw               0.0 deg
            rel_pitch             0.0 deg
            rel_roll              0.0 deg
         end_engine
```

- **演示要点**：演示 engine 的参数：rel_pos_x, rel_pos_y, rel_pos_z, rel_yaw, rel_pitch, rel_roll

### engine（srb-rato）｜

- **关键词**：engine, rel_pos_x, rel_pos_y, rel_pos_z, rel_yaw, rel_pitch
- **出处**：`p6dof/p6dof_types/misc/srb-rato/srb-rato.txt:37-43`　（同签名共 7 处，另见 `p6dof/p6dof_types/weapons/aam-mr/aam-mr.txt:39`、`p6dof/p6dof_types/weapons/aam-sr/aam-sr-tvc.txt:39`、`p6dof/p6dof_types/weapons/aam-sr/aam-sr.txt:39`）
- **片段**：

```text
         engine Engine  RATO-RKT
            rel_pos_x                        1.55536 ft
            rel_pos_y                        0.00000 ft
            rel_pos_z                        0.00000 ft
            rel_yaw                          0.00000 deg
            rel_pitch                        0.00000 deg
         end_engine
```

- **演示要点**：演示 engine 的参数：rel_pos_x, rel_pos_y, rel_pos_z, rel_yaw, rel_pitch

### engine（LTE_FIGHTER）｜

- **关键词**：engine, fuel_feed
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/LTE_FIGHTER.txt:26-28`　（同签名共 2 处，另见 `six_dof_with_brawler/six_dof_types/aircraft/LTE_FIGHTER/LTE_FIGHTER.txt:26`）
- **片段**：

```text
         engine Engine LTE_FIGHTER_Eng_PM6
            fuel_feed	MainFuelTank
         end_engine
```

- **演示要点**：演示 engine 的参数：fuel_feed

### flaps（flight_controls_pm6）｜

- **关键词**：flaps, lag_time_constant
- **出处**：`six_dof/six_dof_types/aircraft/fa-lgt/controls/flight_controls_pm6.txt:42-44`
- **片段**：

```text
   flaps
      lag_time_constant  5 sec
   end_flaps
```

- **演示要点**：演示 flaps 的参数：lag_time_constant

### flight_controls（flight_controls_pm6）｜

- **关键词**：flight_controls, stick_back, stick_right, rudder_right, speedbrakes, flaps, spoilers
- **出处**：`six_dof/six_dof_types/aircraft/fa-lgt/controls/flight_controls_pm6.txt:18-50`
- **片段**：

```text
flight_controls

   stick_back
      -1.0  -6.0
       0.0   0.0
       1.0   10.0
   end_stick_back

   stick_right
      -1.0  -360.0
       0.0   0.0
       1.0   360.0 
   end_stick_right

   rudder_right
      -1.0  -5.0
       0.0   0.0
       1.0   5.0    
   end_rudder_right

   speedbrakes
      lag_time_constant  1.0 sec
   end_speedbrakes

   flaps
      lag_time_constant  5 sec
   end_flaps

   spoilers
      lag_time_constant  1.0 sec
   end_spoilers

end_flight_controls
```

- **演示要点**：演示 flight_controls 的参数：stick_back, stick_right, rudder_right, speedbrakes, flaps, spoilers

### flight_controls（flight_controls_pm6）｜

- **关键词**：flight_controls, stick_back, stick_right, rudder_right, speedbrakes
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/flight_controls_pm6.txt:10-34`　（同签名共 2 处，另见 `six_dof_with_brawler/six_dof_types/aircraft/LTE_FIGHTER/controls/flight_controls_pm6.txt:10`）
- **片段**：

```text
flight_controls

   stick_back # Map of stick throw vs pitch rate command (deg/s)
      -1.0  -6.0
       0.0   0.0
       1.0  10.0
   end_stick_back

   stick_right # Map of stick throw vs roll rate command (deg/s)
      -1.0  -360.0
       0.0     0.0
       1.0   360.0
   end_stick_right

   rudder_right # Map of rudder throw vs yaw rate command (deg/s)
      -1.0  -5.0
       0.0   0.0
       1.0   5.0
   end_rudder_right

   speedbrakes
      lag_time_constant 0 sec
   end_speedbrakes

end_flight_controls
```

- **演示要点**：演示 flight_controls 的参数：stick_back, stick_right, rudder_right, speedbrakes

### flight_controls（flight_controls_pm6）｜

- **关键词**：flight_controls, stick_back, stick_right, rudder_right
- **出处**：`six_dof/six_dof_types/aircraft/b-fw/controls/flight_controls_pm6.txt:18-38`　（同签名共 14 处，另见 `six_dof/six_dof_types/aircraft/b-hvy/controls/flight_controls_pm6.txt:18`、`six_dof/six_dof_types/aircraft/c-hvy/controls/flight_controls_pm6.txt:18`、`six_dof/six_dof_types/aircraft/fa-hvy/controls/flight_controls_pm6.txt:18`）
- **片段**：

```text
flight_controls

   stick_back
      -1.0  -60.0
       0.0    0.0
       1.0   60.0
   end_stick_back

   stick_right
      -1.0  -30.0
       0.0    0.0
       1.0   30.0 
   end_stick_right

   rudder_right
      -1.0  -5.0
       0.0   0.0
       1.0   5.0    
   end_rudder_right

end_flight_controls
```

- **演示要点**：演示 flight_controls 的参数：stick_back, stick_right, rudder_right

### flight_path（flight_path）｜

- **关键词**：flight_path
- **出处**：`engage/flight_path.txt:152-158`
- **片段**：

```text
   flight_path
       # (Time) (X, Y, Z Position) (X, Y, Z Velocity) (Pitch) (Roll) (Yaw)
        0.0 sec    0.0    50.0 100.0 m 200.0   0.0 0.0 m/sec 0.0 0.0 90.0 deg
       10.0 sec 2000.0    50.0 100.0 m 200.0   0.0 0.0 m/sec 0.0 0.0 90.0 deg
       10.1 sec 2020.0    70.0 100.0 m   0.0 200.0 0.0 m/sec 0.0 0.0  0.0 deg
      110.1 sec 2020.0 20070.0 100.0 m   0.0 200.0 0.0 m/sec 0.0 0.0  0.0 deg
   end_flight_path
```

- **演示要点**：演示 flight_path（最小结构，无子参数）

### flight_path_analysis（fpa-tspi）｜

- **关键词**：flight_path_analysis, altitude, roll, tspi_file, gnuplot_file, variable
- **出处**：`sensor_plot/radar/fpa-tspi.txt:30-47`
- **片段**：

```text
flight_path_analysis

   # NOTE: Configure the TSPI reader to use the BLUEMAX conventions
   altitude in feet
   roll inverted
   tspi_file bluemax.tspi

   gnuplot_file fpa-tspi.plt
   variable target_latitude
   variable target_longitude
   variable target_altitude
   variable target_speed
   variable slant_range
   variable pd
   variable signal_to_noise
   variable rcs_required

end_flight_path_analysis
```

- **演示要点**：演示 flight_path_analysis 的参数：altitude, roll, tspi_file, gnuplot_file, variable

### flight_path_analysis（fpa-path）｜

- **关键词**：flight_path_analysis, sample_interval, path, gnuplot_file, variable
- **出处**：`sensor_plot/radar/fpa-path.txt:28-44`
- **片段**：

```text
flight_path_analysis
   sample_interval 1.0 sec
   path
      position 1.0n 0e altitude 30000 ft
      position 0.8n 0e
      position 0.6n 0e
      position 0.4n 0e
      position 0.2n 0e
   end_path

   gnuplot_file fpa-path.plt
   variable slant_range
   variable pd
   variable signal_to_noise
   variable rcs_required

end_flight_path_analysis
```

- **演示要点**：演示 flight_path_analysis 的参数：sample_interval, path, gnuplot_file, variable

### flight_path_analysis（fpa-tspi-route）｜

- **关键词**：flight_path_analysis, sample_interval, gnuplot_file, variable
- **出处**：`sensor_plot/radar/fpa-tspi-route.txt:38-51`　（同签名共 2 处，另见 `sensor_plot/radar/fpa-route.txt:37`）
- **片段**：

```text
flight_path_analysis
   sample_interval 1 sec               # To match the TSPI file sample interval

   gnuplot_file fpa-tspi-route.plt
   variable target_latitude
   variable target_longitude
   variable target_altitude
   variable target_speed
   variable slant_range
   variable pd
   variable signal_to_noise
   variable rcs_required

end_flight_path_analysis
```

- **演示要点**：演示 flight_path_analysis 的参数：sample_interval, gnuplot_file, variable

### flight_route（flight_route）｜

- **关键词**：flight_route
- **出处**：`engage/flight_route.txt:151-169`
- **片段**：

```text
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
```

- **演示要点**：演示 flight_route（最小结构，无子参数）

### fuel · WSF_FUEL｜

- **关键词**：fuel, WSF_FUEL, maximum_quantity, initial_quantity, consumption_rate, bingo_quantity, on_bingo, on_empty
- **出处**：`base_types/platforms/red_multirole_fighter_2_base.txt:67-81`
- **片段**：

```text
   fuel WSF_FUEL
    //maximum_quantity 6531 kg
    //10,000 lbs is about 4536 kg
      maximum_quantity 4536 kg
    //initial_quantity 6000 kg
      initial_quantity 4500 kg
      consumption_rate 1 kg/sec
      bingo_quantity   1500 kg
      on_bingo
          writeln_d ("!!! ", PLATFORM.Name(), " on_bingo fuel");
      end_on_bingo
      on_empty
          writeln_d ("!!! ", PLATFORM.Name(), " on_empty fuel");
      end_on_empty
   end_fuel
```

- **演示要点**：演示 WSF_FUEL 的参数：maximum_quantity, initial_quantity, consumption_rate, bingo_quantity, on_bingo, on_empty

### fuel · WSF_TABULAR_RATE_FUEL｜

- **关键词**：fuel, WSF_TABULAR_RATE_FUEL, maximum_quantity, reserve_quantity, initial_quantity, mode, fuel_table
- **出处**：`multiresolution_demos/fuel/fuel_include.txt:18-43`　（同签名共 2 处，另见 `example_scripts/fuel_table_demo.txt:21`）
- **片段**：

```text
fuel HIGH_FIDELITY_FUEL WSF_TABULAR_RATE_FUEL
   maximum_quantity 10000 kg
   reserve_quantity 1500  kg
   initial_quantity 1000 kg
   
   mode TEST_MODE
  
   # Values from fuel_table_demo
   fuel_table
      mode TEST_MODE
      altitudes
         units m
         0 5000 10000
      end_altitudes
      mach
        0.25 0.5 0.75 1.0
      end_mach
      rates
         units kg/s
      #  0.25 0.5  0.75 1.0    mach
         3.0  4.5  5.5  7.0  # Sea Level
         2.0  3.5  4.5  6.0  # 5000 m
         1.0  2.5  3.5  5.0  # 10000 m
      end_rates
   end_fuel_table
end_fuel
```

- **演示要点**：演示 WSF_TABULAR_RATE_FUEL 的参数：maximum_quantity, reserve_quantity, initial_quantity, mode, fuel_table

### fuel · WSF_FUEL｜

- **关键词**：fuel, WSF_FUEL, consumption_rate, initial_quantity, maximum_quantity, bingo_quantity
- **出处**：`behavior_tree/platforms/blackboard_striker.txt:36-41`　（同签名共 16 处，另见 `behavior_tree/platforms/condition_striker.txt:35`、`behavior_tree/platforms/decorator_striker.txt:34`、`behavior_tree/platforms/parallel_striker.txt:43`）
- **片段**：

```text
   fuel WSF_FUEL
      consumption_rate     7 lb/s
      initial_quantity 14000 lb     #~33 minutes, at this consumption rate
      maximum_quantity 14000 lb
      bingo_quantity    1000 lb
   end_fuel  
```

- **演示要点**：演示 WSF_FUEL 的参数：consumption_rate, initial_quantity, maximum_quantity, bingo_quantity

### fuel · WSF_VARIABLE_RATE_FUEL｜

- **关键词**：fuel, WSF_VARIABLE_RATE_FUEL, rate, initial_quantity, maximum_quantity
- **出处**：`base_types/platforms/blue_adv_fighter_1_base.txt:40-44`　（同签名共 5 处，另见 `base_types/platforms/blue_multirole_fighter_1_base.txt:27`、`base_types/platforms/red_adv_fighter_1_base.txt:44`、`base_types/platforms/red_fighter_1_base.txt:41`）
- **片段**：

```text
   fuel WSF_VARIABLE_RATE_FUEL
      rate 7.0 lb/s
      initial_quantity 14000 lb
      maximum_quantity 14000 lb
   end_fuel
```

- **演示要点**：演示 WSF_VARIABLE_RATE_FUEL 的参数：rate, initial_quantity, maximum_quantity

### fuel · WSF_FUEL｜

- **关键词**：fuel, WSF_FUEL, consumption_rate, initial_quantity, maximum_quantity
- **出处**：`behavior_tree/platforms/run_tree_striker.txt:80-84`　（同签名共 3 处，另见 `logistics/platforms/strike_platform.txt:62`、`multiresolution_demos/fuel/fuel_include.txt:12`）
- **片段**：

```text
   fuel WSF_FUEL
      consumption_rate    10 lb/s
      initial_quantity 50000 lb
      maximum_quantity 50000 lb
   end_fuel  
```

- **演示要点**：演示 WSF_FUEL 的参数：consumption_rate, initial_quantity, maximum_quantity

### fuel · WSF_BRAWLER_FUEL｜

- **关键词**：fuel, WSF_BRAWLER_FUEL, aero_file, initial_quantity
- **出处**：`air_to_air/platforms/dca.txt:43-46`　（同签名共 2 处，另见 `air_to_air/platforms/hvaa.txt:47`）
- **片段**：

```text
   fuel WSF_BRAWLER_FUEL
      aero_file platforms/fxw/lte_fighter.fxw
      initial_quantity 20000 pounds
   end_fuel
```

- **演示要点**：演示 WSF_BRAWLER_FUEL 的参数：aero_file, initial_quantity

### fuel · WSF_BRAWLER_FUEL｜

- **关键词**：fuel, WSF_BRAWLER_FUEL, aero_file, initial_quantity_ratio
- **出处**：`air_to_air/platforms/escort.txt:44-47`　（同签名共 3 处，另见 `air_to_air/platforms/lte_fighter.txt:47`、`six_dof_with_brawler/platforms/lte_fighter.txt:38`）
- **片段**：

```text
   fuel WSF_BRAWLER_FUEL
      aero_file platforms/fxw/lte_fighter.fxw
      initial_quantity_ratio 1.0
   end_fuel
```

- **演示要点**：演示 WSF_BRAWLER_FUEL 的参数：aero_file, initial_quantity_ratio

### fuel · WSF_BRAWLER_FUEL｜

- **关键词**：fuel, WSF_BRAWLER_FUEL, aero_file
- **出处**：`brawler/platforms/brawler_platform.txt:91-93`
- **片段**：

```text
   fuel WSF_BRAWLER_FUEL
      aero_file platforms/ACFT_BD.FXW
   end_fuel
```

- **演示要点**：演示 WSF_BRAWLER_FUEL 的参数：aero_file

### fuel（fuel_include）｜

- **关键词**：fuel
- **出处**：`multiresolution_demos/fuel/fuel_include.txt:48-49`　（同签名共 2 处，另见 `multiresolution_demos/fuel/fuel_include.txt:54`）
- **片段**：

```text
     fuel HIGH_FIDELITY_FUEL
     end_fuel
```

- **演示要点**：演示 fuel（最小结构，无子参数）

### fuel_table（fuel_table_demo）｜

- **关键词**：fuel_table, mode, altitudes, mach, rates
- **出处**：`example_scripts/fuel_table_demo.txt:32-48`　（同签名共 2 处，另见 `multiresolution_demos/fuel/fuel_include.txt:26`）
- **片段**：

```text
      fuel_table
         mode MACH_MODE
         altitudes
            units m
            0 5000 10000
         end_altitudes
         mach
            .25 .5 .75 1.0
         end_mach
         rates
            units kg/s
          # .25  0.5  .75  1.0 mach
            3.0  4.5  5.5  7.0  # Sea Level
            2.0  3.5  4.5  6.0  # 5000 m
            1.0  2.5  3.5  5.0  # 10000 m
         end_rates
      end_fuel_table
```

- **演示要点**：演示 fuel_table 的参数：mode, altitudes, mach, rates

### fuel_table（fuel_table_demo）｜

- **关键词**：fuel_table, mode, altitudes, speeds, rates
- **出处**：`example_scripts/fuel_table_demo.txt:50-67`
- **片段**：

```text
      fuel_table
         mode MPS_MODE
         altitudes
            units m
            0 5000 10000
         end_altitudes
         speeds
            units m/s
            100 200 300 400
         end_speeds
         rates
            units kg/s
          # 100  200  300  400 m/s
            3.0  4.5  5.5  7.0  # Sea Level
            2.0  3.5  4.5  6.0  # 5000 m
            1.0  2.5  3.5  5.0  # 10000 m
         end_rates
      end_fuel_table
```

- **演示要点**：演示 fuel_table 的参数：mode, altitudes, speeds, rates

### fuel_table（fuel_table_demo）｜

- **关键词**：fuel_table, mode, constant
- **出处**：`example_scripts/fuel_table_demo.txt:27-30`
- **片段**：

```text
      fuel_table
         mode CONSTANT_MODE
         constant 4.0 kg/s
      end_fuel_table
```

- **演示要点**：演示 fuel_table 的参数：mode, constant

### fuel_tank（a-lgt）｜

- **关键词**：fuel_tank, max_fuel_quantity, current_fuel_quantity, max_flow_rate, max_fill_rate, max_xfer_rate, cg_full_x, cg_full_y, cg_full_z, cg_empty_x, cg_empty_y, cg_empty_z
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/a-lgt.txt:60-72`　（同签名共 53 处，另见 `p6dof/p6dof_types/aircraft/b-fw/b-fw.txt:78`、`p6dof/p6dof_types/aircraft/b-hvy/b-hvy.txt:114`、`p6dof/p6dof_types/aircraft/c-hvy/c-hvy.txt:78`）
- **片段**：

```text
         fuel_tank  MainFuelTank
            max_fuel_quantity            11000.00000 lbs
            current_fuel_quantity        11000.00000 lbs
            max_flow_rate              1000000.00000 lbs/sec
            max_fill_rate              1000000.00000 lbs/sec
            max_xfer_rate              1000000.00000 lbs/sec
            cg_full_x                        1.22687 ft
            cg_full_y                       -0.00000 ft
            cg_full_z                        0.63584 ft
            cg_empty_x                       1.22687 ft
            cg_empty_y                      -0.00000 ft
            cg_empty_z                       0.63584 ft
         end_fuel_tank
```

- **演示要点**：演示 fuel_tank 的参数：max_fuel_quantity, current_fuel_quantity, max_flow_rate, max_fill_rate, max_xfer_rate, cg_full_x, cg_full_y, cg_full_z, cg_empty_x, cg_empty_y

### fuel_tank（LTE_FIGHTER）｜

- **关键词**：fuel_tank, max_fuel_quantity, current_fuel_quantity, max_flow_rate, max_fill_rate, max_xfer_rate
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/LTE_FIGHTER.txt:30-36`　（同签名共 2 处，另见 `six_dof_with_brawler/six_dof_types/aircraft/LTE_FIGHTER/LTE_FIGHTER.txt:30`）
- **片段**：

```text
         fuel_tank MainFuelTank
            max_fuel_quantity      20718.0 lbs
            current_fuel_quantity  20718.0 lbs
            max_flow_rate          10000.00 lbs/sec
            max_fill_rate          10000.00 lbs/sec
            max_xfer_rate          10000.00 lbs/sec
         end_fuel_tank
```

- **演示要点**：演示 fuel_tank 的参数：max_fuel_quantity, current_fuel_quantity, max_flow_rate, max_fill_rate, max_xfer_rate

### fuel_tank（orbiter-booster）｜

- **关键词**：fuel_tank, max_fuel_quantity, current_fuel_quantity, max_flow_rate
- **出处**：`six_dof/six_dof_types/spacecraft/orbiter-booster/orbiter-booster.txt:55-59`　（同签名共 2 处，另见 `six_dof/six_dof_types/spacecraft/orbiter-main/orbiter-main.txt:58`）
- **片段**：

```text
         fuel_tank Propellant
            max_fuel_quantity     50000 lbs
            current_fuel_quantity 50000 lbs
            max_flow_rate         10000 lbs/sec
         end_fuel_tank
```

- **演示要点**：演示 fuel_tank 的参数：max_fuel_quantity, current_fuel_quantity, max_flow_rate

### fuel_transfer（fa-lgt）｜

- **关键词**：fuel_transfer, source_tank, target_tank
- **出处**：`p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt.txt:137-140`　（同签名共 18 处，另见 `p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt.txt:142`、`p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt.txt:147`、`p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt.txt:152`）
- **片段**：

```text
         fuel_transfer LeftWingTankToAftTank
            source_tank LeftWingTank
            target_tank AftTank
         end_fuel_transfer
```

- **演示要点**：演示 fuel_transfer 的参数：source_tank, target_tank

### guidance_autopilot_bank_to_turn（control_inputs）｜

- **关键词**：guidance_autopilot_bank_to_turn, include
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/control_inputs.txt:133-136`　（同签名共 6 处，另见 `p6dof/p6dof_types/aircraft/b-fw/controls/control_inputs.txt:133`、`p6dof/p6dof_types/aircraft/c-hvy/controls/control_inputs.txt:133`、`p6dof/p6dof_types/aircraft/fa-hvy/controls/control_inputs.txt:133`）
- **片段**：

```text
   guidance_autopilot_bank_to_turn
      # Define the guidance configuration
      include autopilot_config.txt
   end_guidance_autopilot_bank_to_turn
```

- **演示要点**：演示 guidance_autopilot_bank_to_turn 的参数：include

### guidance_autopilot_skid_to_turn（control_inputs）｜

- **关键词**：guidance_autopilot_skid_to_turn, include
- **出处**：`p6dof/p6dof_types/weapons/aam-mr/controls/control_inputs.txt:91-94`　（同签名共 6 处，另见 `p6dof/p6dof_types/weapons/aam-sr/controls/control_inputs.txt:91`、`p6dof/p6dof_types/weapons/aam-sr/controls-tvc/control_inputs.txt:91`、`p6dof/p6dof_types/weapons/agm-sr/controls/control_inputs.txt:91`）
- **片段**：

```text
   guidance_autopilot_skid_to_turn
      # Define the guidance configuration
      include autopilot_config.txt
   end_guidance_autopilot_skid_to_turn
```

- **演示要点**：演示 guidance_autopilot_skid_to_turn 的参数：include

### guidance_group（simple-icbm）｜

- **关键词**：guidance_group, body_yaw_rate, body_pitch_rate, body_roll_rate, switch_at_time_sec
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:929-934`
- **片段**：

```text
        guidance_group           Liftoff
          body_yaw_rate          0.0
          body_pitch_rate        0.0
          body_roll_rate         0.0
          switch_at_time_sec     1.0   RollProg
        end_guidance_group
```

- **演示要点**：演示 guidance_group 的参数：body_yaw_rate, body_pitch_rate, body_roll_rate, switch_at_time_sec

### guidance_group（simple-icbm）｜

- **关键词**：guidance_group, body_roll_to_tgt_az, body_yaw_rate, body_pitch_rate, switch_at_time_sec
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:936-941`
- **片段**：

```text
        guidance_group           RollProg
          body_roll_to_tgt_az
          body_yaw_rate          0.0
          body_pitch_rate        0.0
          switch_at_time_sec     2.0   Stage1PitchProg
        end_guidance_group
```

- **演示要点**：演示 guidance_group 的参数：body_roll_to_tgt_az, body_yaw_rate, body_pitch_rate, switch_at_time_sec

### guidance_group（simple-icbm）｜

- **关键词**：guidance_group, local_pitch_program, body_yaw_rate, body_roll_rate, switch_at_time_sec
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:960-970`　（同签名共 4 处，另见 `p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:943`、`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:988`、`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:972`）
- **片段**：

```text
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
```

- **演示要点**：演示 guidance_group 的参数：local_pitch_program, body_yaw_rate, body_roll_rate, switch_at_time_sec

### guidance_group（simple-icbm）｜

- **关键词**：guidance_group, local_pitch_angle, local_roll_angle, switch_at_time_sec
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:1001-1005`
- **片段**：

```text
        guidance_group           PointDownProg
          local_pitch_angle        -80.0
          local_roll_angle         0.0
          switch_at_time_sec     6.0   Coast
        end_guidance_group
```

- **演示要点**：演示 guidance_group 的参数：local_pitch_angle, local_roll_angle, switch_at_time_sec

### guidance_group（simple-icbm）｜

- **关键词**：guidance_group, body_yaw_rate, body_pitch_rate, body_roll_rate
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:1007-1011`
- **片段**：

```text
        guidance_group           Coast
          body_yaw_rate          0.0
          body_pitch_rate        0.0
          body_roll_rate         0.0
        end_guidance_group
```

- **演示要点**：演示 guidance_group 的参数：body_yaw_rate, body_pitch_rate, body_roll_rate

### hardware_autopilot_bank_to_turn（control_inputs）｜

- **关键词**：hardware_autopilot_bank_to_turn, include
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/control_inputs.txt:128-131`　（同签名共 6 处，另见 `p6dof/p6dof_types/aircraft/b-fw/controls/control_inputs.txt:128`、`p6dof/p6dof_types/aircraft/c-hvy/controls/control_inputs.txt:128`、`p6dof/p6dof_types/aircraft/fa-hvy/controls/control_inputs.txt:128`）
- **片段**：

```text
   hardware_autopilot_bank_to_turn
      # Define the hardware autopilot configuration
      include hw_autopilot_config.txt
   end_hardware_autopilot_bank_to_turn
```

- **演示要点**：演示 hardware_autopilot_bank_to_turn 的参数：include

### hardware_autopilot_skid_to_turn（control_inputs）｜

- **关键词**：hardware_autopilot_skid_to_turn, include
- **出处**：`p6dof/p6dof_types/weapons/aam-mr/controls/control_inputs.txt:86-89`　（同签名共 6 处，另见 `p6dof/p6dof_types/weapons/aam-sr/controls/control_inputs.txt:86`、`p6dof/p6dof_types/weapons/aam-sr/controls-tvc/control_inputs.txt:86`、`p6dof/p6dof_types/weapons/agm-sr/controls/control_inputs.txt:86`）
- **片段**：

```text
   hardware_autopilot_skid_to_turn
      # Define the hardware autopilot configuration
      include hw_autopilot_config.txt
   end_hardware_autopilot_skid_to_turn
```

- **演示要点**：演示 hardware_autopilot_skid_to_turn 的参数：include

### inputs（flight_controls）｜

- **关键词**：inputs, control_input, name, modifier
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/flight_controls.txt:244-249`　（同签名共 21 处，另见 `p6dof/p6dof_types/weapons/simple-icbm/flight_controls.txt:309`、`p6dof/p6dof_types/weapons/simple-icbm/flight_controls.txt:374`、`p6dof/p6dof_types/weapons/simple-icbm/flight_controls.txt:400`）
- **片段**：

```text
  inputs
   control_input
    name                     RudderRight
    modifier                 Clamp_PosNeg
   end_control_input
  end_inputs
```

- **演示要点**：演示 inputs 的参数：control_input, name, modifier

### inputs（flight_controls）｜

- **关键词**：inputs, control_input, modifier
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:561-565`　（同签名共 321 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:573`、`p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:585`、`p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:597`）
- **片段**：

```text
  inputs
   control_input RgtWheelBrake
    modifier                 Clamp_ZeroOne
   end_control_input
  end_inputs
```

- **演示要点**：演示 inputs 的参数：control_input, modifier

### inputs（flight_controls）｜

- **关键词**：inputs, control_input, name
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/flight_controls.txt:609-613`
- **片段**：

```text
  inputs
   control_input
    name                     NWS_Enable
   end_control_input
  end_inputs
```

- **演示要点**：演示 inputs 的参数：control_input, name

### inputs（flight_controls）｜

- **关键词**：inputs, control_input
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:550-553`　（同签名共 197 处，另见 `p6dof/p6dof_types/aircraft/b-fw/controls/flight_controls.txt:636`、`p6dof/p6dof_types/aircraft/b-hvy/controls/flight_controls.txt:380`、`p6dof/p6dof_types/aircraft/c-hvy/controls/flight_controls.txt:422`）
- **片段**：

```text
  inputs
   control_input NWS_Enable
   end_control_input
  end_inputs
```

- **演示要点**：演示 inputs 的参数：control_input

### integrator（aerobraking_demo）｜

- **关键词**：integrator, error_criterion, tolerance, max_step_size, min_step_size
- **出处**：`satellite_demos/aerobraking_demo.txt:42-47`
- **片段**：

```text
      integrator prince_dormand_78
         error_criterion L_infinity
         tolerance 1.0e-10
         max_step_size 3600
         min_step_size 0
      end_integrator
```

- **演示要点**：演示 integrator 的参数：error_criterion, tolerance, max_step_size, min_step_size

### integrator（orbiter）｜

- **关键词**：integrator, tolerance, error_criterion, max_step_size
- **出处**：`cislunar/scenarios/orbiter.txt:30-34`
- **片段**：

```text
      integrator prince_dormand_78
         tolerance 1.0e-11
         error_criterion L_2
         max_step_size 3600.0
      end_integrator
```

- **演示要点**：演示 integrator 的参数：tolerance, error_criterion, max_step_size

### integrator（space_mover）｜

- **关键词**：integrator, tolerance, error_criterion
- **出处**：`multiresolution_demos/movers/space_mover.txt:22-25`
- **片段**：

```text
         integrator prince_dormand_78
            tolerance 1.0e-11
            error_criterion L_2
         end_integrator
```

- **演示要点**：演示 integrator 的参数：tolerance, error_criterion

### integrators（integrators_config）｜

- **关键词**：integrators, create_integrator
- **出处**：`air_to_air/six_dof_types/environment/integrators_config.txt:10-15`　（同签名共 3 处，另见 `six_dof/six_dof_types/environment/integrators_config.txt:10`、`six_dof_with_brawler/six_dof_types/environment/integrators_config.txt:10`）
- **片段**：

```text
integrators

   create_integrator  STANDARD_RIGID_BODY_INTEGRATOR
   create_integrator  STANDARD_POINT_MASS_INTEGRATOR

end_integrators
```

- **演示要点**：演示 integrators 的参数：create_integrator

### isp_vs_alt（Generic_ICBM_RocketEngines）｜

- **关键词**：isp_vs_alt
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/Generic_ICBM_RocketEngines.txt:146-150`　（同签名共 30 处，另见 `p6dof/p6dof_types/weapons/simple-icbm/Generic_ICBM_RocketEngines.txt:170`、`p6dof/p6dof_types/weapons/simple-icbm/Generic_ICBM_RocketEngines.txt:194`、`p6dof/p6dof_types/weapons/simple-icbm/Generic_ICBM_RocketEngines.txt:32`）
- **片段**：

```text
      isp_vs_alt
         #alt_feet     Isp
         0.0           280.0
         300000.0      280.0
      end_isp_vs_alt
```

- **演示要点**：演示 isp_vs_alt（最小结构，无子参数）

### jet（LTE_FIGHTER_Eng）｜

- **关键词**：jet, tsfc_idle_pph, tsfc_mil_pph, tsfc_ab_pph, rated_thrust_idle, rated_thrust_mil, rated_thrust_ab, spin_up_table_mil_per_sec, spin_down_table_mil_per_sec, spin_up_table_ab_per_sec, spin_down_table_ab_per_sec, thrust_idle_alt_mach_table, thrust_mil_alt_mach_table
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/prop/LTE_FIGHTER_Eng.txt:14-56`　（同签名共 6 处，另见 `six_dof_with_brawler/six_dof_types/aircraft/LTE_FIGHTER/prop/LTE_FIGHTER_Eng.txt:14`、`six_dof/six_dof_types/aircraft/fa-hvy/prop/jet_engines/f-h4-22a-1-tf/f-h4-22a-1-tf.txt:28`、`six_dof/six_dof_types/aircraft/fa-hvy/prop/jet_engines/f-h4-22a-1-tf/f-h4-22a-1-tf.txt:106`）
- **片段**：

```text
      jet

         tsfc_idle_pph      -0.02710004531071167
         tsfc_mil_pph       1.4504621608555324
         tsfc_ab_pph        1.6062186380240169

         rated_thrust_idle  802.9000000000001 lbf
         rated_thrust_mil   23892.5 lbf
         rated_thrust_ab    74142.5 lbf

         spin_up_table_mil_per_sec
            0.00	2.0
            1.00	2.0
         end_spin_up_table_mil_per_sec

         spin_down_table_mil_per_sec
            0.00	2.0
            1.00	2.0
         end_spin_down_table_mil_per_sec

         spin_up_table_ab_per_sec
            0.00	1.0
            1.00	1.0
         end_spin_up_table_ab_per_sec

         spin_down_table_ab_per_sec
            0.00	1.0
            1.00	1.0
         end_spin_down_table_ab_per_sec

         thrust_idle_alt_mach_table
            file data/thrust_idle_alt_mach.txt
         end_thrust_idle_alt_mach_table

         thrust_mil_alt_mach_table
            file data/thrust_mil_alt_mach.txt
         end_thrust_mil_alt_mach_table

         thrust_ab_alt_mach_table
            file data/thrust_ab_alt_mach.txt
         end_thrust_ab_alt_mach_table

      end_jet
```

- **演示要点**：演示 jet 的参数：tsfc_idle_pph, tsfc_mil_pph, tsfc_ab_pph, rated_thrust_idle, rated_thrust_mil, rated_thrust_ab, spin_up_table_mil_per_sec, spin_down_table_mil_per_sec, spin_up_table_ab_per_sec, spin_down_table_ab_per_sec

### jet（b-h4-40w-1-tf）｜

- **关键词**：jet, tsfc_idle_pph, tsfc_mil_pph, rated_thrust_idle, rated_thrust_mil, spin_up_table_mil_per_sec, spin_down_table_mil_per_sec, thrust_idle_alt_mach_table, thrust_mil_alt_mach_table
- **出处**：`six_dof/six_dof_types/aircraft/b-fw/prop/jet_engines/b-h4-40w-1-tf/b-h4-40w-1-tf.txt:28-69`　（同签名共 5 处，另见 `six_dof/six_dof_types/aircraft/b-fw/prop/jet_engines/b-h4-40w-1-tf/b-h4-40w-1-tf.txt:80`、`six_dof/six_dof_types/aircraft/c-hvy/prop/jet_engines/c-hj-41a-1-tf/c-hj-41a-1-tf.txt:33`、`six_dof/six_dof_types/aircraft/c-hvy/prop/jet_engines/c-hj-41a-1-tf/c-hj-41a-1-tf.txt:90`）
- **片段**：

```text
      jet

         tsfc_idle_pph             0.3800  # lb/lb/hr
         tsfc_mil_pph              0.3800  # lb/lb/hr

         //-------------------------------------------------------------------------

         rated_thrust_idle      5000.0000 lbf
         rated_thrust_mil      19000.0000 lbf
         //-------------------------------------------------------------------------

         spin_up_table_mil_per_sec
            // throttle_level  spin_up_per_sec
                       0.0000               0.0500
                       0.2500               0.1625
                       0.5000               0.2750
                       0.7500               0.3875
                       1.0000               0.5000
         end_spin_up_table_mil_per_sec

         spin_down_table_mil_per_sec
            // throttle_level  spin_down_per_sec
                       0.0000               0.0500
                       0.2500               0.1625
                       0.5000               0.2750
                       0.7500               0.3875
                       1.0000               0.5000
         end_spin_down_table_mil_per_sec

         //-------------------------------------------------------------------------

         thrust_idle_alt_mach_table
            file data/thrust_idle_alt_mach.txt
         end_thrust_idle_alt_mach_table

         //-------------------------------------------------------------------------

         thrust_mil_alt_mach_table
            file data/thrust_mil_alt_mach.txt
         end_thrust_mil_alt_mach_table

      end_jet
```

- **演示要点**：演示 jet 的参数：tsfc_idle_pph, tsfc_mil_pph, rated_thrust_idle, rated_thrust_mil, spin_up_table_mil_per_sec, spin_down_table_mil_per_sec, thrust_idle_alt_mach_table, thrust_mil_alt_mach_table

### jet（b-h3-81a-1-tf）｜

- **关键词**：jet
- **出处**：`six_dof/six_dof_types/aircraft/b-hvy/prop/jet_engines/b-h3-81a-1-tf/b-h3-81a-1-tf.txt:28-69`　（同签名共 3 处，另见 `six_dof/six_dof_types/aircraft/b-hvy/prop/jet_engines/b-h3-81a-1-tf/b-h3-81a-1-tf.txt:81`、`six_dof/six_dof_types/weapons/agm-mrc/prop/jet_engines/generic-cm-1-tf/generic-cm-1-tf.txt:82`）
- **片段**：

```text
      jet

			tsfc_idle_pph             0.7800  # lb/lb/hr
			tsfc_mil_pph              0.7800  # lb/lb/hr

			//-------------------------------------------------------------------------

			rated_thrust_idle      2500.0000 lbf
			rated_thrust_mil      17000.0000 lbf
			//-------------------------------------------------------------------------

			spin_up_table_mil_per_sec
				// throttle_level  spin_up_per_sec
							  0.0000               0.0500
							  0.2500               0.1625
							  0.5000               0.2750
							  0.7500               0.3875
							  1.0000               0.5000
			end_spin_up_table_mil_per_sec

			spin_down_table_mil_per_sec
				// throttle_level  spin_down_per_sec
							  0.0000               0.0500
							  0.2500               0.1625
							  0.5000               0.2750
							  0.7500               0.3875
							  1.0000               0.5000
			end_spin_down_table_mil_per_sec

			//-------------------------------------------------------------------------

			thrust_idle_alt_mach_table
				file data/thrust_idle_alt_mach.txt
			end_thrust_idle_alt_mach_table

			//-------------------------------------------------------------------------

			thrust_mil_alt_mach_table
				file data/thrust_mil_alt_mach.txt
			end_thrust_mil_alt_mach_table

      end_jet
```

- **演示要点**：演示 jet（最小结构，无子参数）

### jet_engine_type（f-h4-22a-1-tf）｜

- **关键词**：jet_engine_type, thrust_offset, inop_ref_area, tsfc_idle_pph, tsfc_mil_pph, tsfc_ab_pph, rated_thrust_idle, rated_thrust_mil, rated_thrust_ab, spin_up_table_mil_per_sec, spin_down_table_mil_per_sec, spin_up_table_ab_per_sec, spin_down_table_ab_per_sec
- **出处**：`p6dof/p6dof_types/aircraft/fa-hvy/prop/jet_engines/f-h4-22a-1-tf/f-h4-22a-1-tf.txt:23-104`　（同签名共 2 处，另见 `p6dof/p6dof_types/aircraft/fa-lgt/prop/jet_engines/f-l4-11a-1-tf/f-l4-11a-1-tf.txt:23`）
- **片段**：

```text
   jet_engine_type   F-H4-22A-1-TF   P6DOF_JET_ENGINE

      //-------------------------------------------------------------------------

      thrust_offset           -11.0000 ft

      //-------------------------------------------------------------------------

      inop_ref_area             7.0000 ft^2

      //-------------------------------------------------------------------------

      tsfc_idle_pph             0.7500  # lb/lb/hr
      tsfc_mil_pph              0.7500  # lb/lb/hr
      tsfc_ab_pph               1.9500  # lb/lb/hr

      //-------------------------------------------------------------------------

      rated_thrust_idle      3000.0000 lbf
      rated_thrust_mil      19400.0000 lbf
      rated_thrust_ab       32000.0000 lbf
      //-------------------------------------------------------------------------

      spin_up_table_mil_per_sec
         // throttle_level  spin_up_per_sec
                    0.0000               0.0500
                    0.2500               0.1625
                    0.5000               0.2750
                    0.7500               0.3875
                    1.0000               0.5000
      end_spin_up_table_mil_per_sec

      spin_down_table_mil_per_sec
         // throttle_level  spin_down_per_sec
                    0.0000               0.0500
                    0.2500               0.1625
                    0.5000               0.2750
                    0.7500               0.3875
                    1.0000               0.5000
      end_spin_down_table_mil_per_sec

      spin_up_table_ab_per_sec
         // throttle_level  spin_up_per_sec
                    0.0000               0.1000
                    0.2500               0.1625
                    0.5000               0.2250
                    0.7500               0.2875
                    1.0000               0.3500
      end_spin_up_table_ab_per_sec

      spin_down_table_ab_per_sec
         // throttle_level  spin_up_per_sec
                    0.0000               0.2000
                    0.2500               0.3250
                    0.5000               0.4500
                    0.7500               0.5750
                    1.0000               0.7000
      end_spin_down_table_ab_per_sec
      //-------------------------------------------------------------------------

      thrust_idle_alt_mach_table
         file data/thrust_idle_alt_mach.txt
      end_thrust_idle_alt_mach_table

      //-------------------------------------------------------------------------

      thrust_mil_alt_mach_table
         file data/thrust_mil_alt_mach.txt
      end_thrust_mil_alt_mach_table

      //-------------------------------------------------------------------------

      thrust_ab_alt_mach_table
         file data/thrust_ab_alt_mach.txt
      end_thrust_ab_alt_mach_table

      //-------------------------------------------------------------------------

      throttle_setting_ab     ThrottleAfterburner

      throttle_setting_mil    ThrottleMilitary
   end_jet_engine_type
```

- **演示要点**：演示 jet_engine_type 的参数：thrust_offset, inop_ref_area, tsfc_idle_pph, tsfc_mil_pph, tsfc_ab_pph, rated_thrust_idle, rated_thrust_mil, rated_thrust_ab, spin_up_table_mil_per_sec, spin_down_table_mil_per_sec

### jet_engine_type（a-m4-22a-1-tf）｜

- **关键词**：jet_engine_type, thrust_offset, inop_ref_area, tsfc_idle_pph, tsfc_mil_pph, rated_thrust_idle, rated_thrust_mil, spin_up_table_mil_per_sec, spin_down_table_mil_per_sec, thrust_idle_alt_mach_table, thrust_mil_alt_mach_table, throttle_setting_mil
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/prop/jet_engines/a-m4-22a-1-tf/a-m4-22a-1-tf.txt:23-77`　（同签名共 5 处，另见 `p6dof/p6dof_types/aircraft/b-fw/prop/jet_engines/b-h4-40w-1-tf/b-h4-40w-1-tf.txt:23`、`p6dof/p6dof_types/aircraft/b-hvy/prop/jet_engines/b-h3-81a-1-tf/b-h3-81a-1-tf.txt:23`、`p6dof/p6dof_types/aircraft/c-hvy/prop/jet_engines/c-hj-41a-1-tf/c-hj-41a-1-tf.txt:23`）
- **片段**：

```text
   jet_engine_type   A-M4-22A-1-TF   P6DOF_JET_ENGINE

      //-------------------------------------------------------------------------

      thrust_offset            -4.1500 ft

      //-------------------------------------------------------------------------

      inop_ref_area            12.6000 ft^2

      //-------------------------------------------------------------------------

      tsfc_idle_pph             0.3700  # lb/lb/hr
      tsfc_mil_pph              0.3700  # lb/lb/hr

      //-------------------------------------------------------------------------

      rated_thrust_idle      1200.0000 lbf
      rated_thrust_mil       9065.0000 lbf
      //-------------------------------------------------------------------------

      spin_up_table_mil_per_sec
         // throttle_level  spin_up_per_sec
                    0.0000               0.0500
                    0.2500               0.1625
                    0.5000               0.2750
                    0.7500               0.3875
                    1.0000               0.5000
      end_spin_up_table_mil_per_sec

      spin_down_table_mil_per_sec
         // throttle_level  spin_down_per_sec
                    0.0000               0.0500
                    0.2500               0.1625
                    0.5000               0.2750
                    0.7500               0.3875
                    1.0000               0.5000
      end_spin_down_table_mil_per_sec

      //-------------------------------------------------------------------------

      thrust_idle_alt_mach_table
         file data/thrust_idle_alt_mach.txt
      end_thrust_idle_alt_mach_table

      //-------------------------------------------------------------------------

      thrust_mil_alt_mach_table
         file data/thrust_mil_alt_mach.txt
      end_thrust_mil_alt_mach_table

      //-------------------------------------------------------------------------

      throttle_setting_mil    ThrottleMilitary
   end_jet_engine_type
```

- **演示要点**：演示 jet_engine_type 的参数：thrust_offset, inop_ref_area, tsfc_idle_pph, tsfc_mil_pph, rated_thrust_idle, rated_thrust_mil, spin_up_table_mil_per_sec, spin_down_table_mil_per_sec, thrust_idle_alt_mach_table, thrust_mil_alt_mach_table

### landing_gear（fa-lgt_landing-gear）｜

- **关键词**：landing_gear
- **出处**：`p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:76-153`　（同签名共 2 处，另见 `six_dof/six_dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:76`）
- **片段**：

```text
	  landing_gear
         nws_enable_control_name              NWS_Enable

         nominal_height_above_ground_on_gear  5.5 ft

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

         ground_reaction_point LandingGear_3
            control_surface_name              Aft_Gear_Left
            braking_control_surface_name      LeftWheelBrake
            is_nose_gear                      false
            gear_extended_relative_position_x -2.89984 ft
            gear_extended_relative_position_y -5 ft
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
      end_landing_gear
```

- **演示要点**：演示 landing_gear（最小结构，无子参数）

### lateral_acceleration_rate_pid（helo_mover）｜

- **关键词**：lateral_acceleration_rate_pid, proportional_gain, integral_gain, derivative_gain, input_threshold
- **出处**：`hellfire/active_radar_hellfire/helo_mover.txt:95-100`　（同签名共 3 处，另见 `hellfire/laser_designation_via_dis/helo_mover.txt:100`、`hellfire/semiactive_laser_hellfire/helo_mover.txt:100`）
- **片段**：

```text
   lateral_acceleration_rate_pid
      proportional_gain 2.0
      integral_gain     0.0
      derivative_gain   0.5
      input_threshold   0.0
   end_lateral_acceleration_rate_pid
```

- **演示要点**：演示 lateral_acceleration_rate_pid 的参数：proportional_gain, integral_gain, derivative_gain, input_threshold

### lateral_acceleration_value_pid（helo_mover）｜

- **关键词**：lateral_acceleration_value_pid, proportional_gain, integral_gain, derivative_gain, input_threshold
- **出处**：`hellfire/active_radar_hellfire/helo_mover.txt:102-107`　（同签名共 3 处，另见 `hellfire/laser_designation_via_dis/helo_mover.txt:107`、`hellfire/semiactive_laser_hellfire/helo_mover.txt:107`）
- **片段**：

```text
   lateral_acceleration_value_pid
      proportional_gain 0.020
      integral_gain     0.0
      derivative_gain   20.0
      input_threshold   0.0
   end_lateral_acceleration_value_pid
```

- **演示要点**：演示 lateral_acceleration_value_pid 的参数：proportional_gain, integral_gain, derivative_gain, input_threshold

### limits_and_settings（autopilot_config_pm6）｜

- **关键词**：limits_and_settings, pitch_gload_min, pitch_gload_max, yaw_gload_max, afterburner_threshold, speedbrake_threshold, alpha_min, alpha_max, pitch_rate_min, pitch_rate_max, vert_speed_min, vert_speed_max, beta_max
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:85-105`　（同签名共 2 处，另见 `six_dof_with_brawler/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:85`）
- **片段**：

```text
      limits_and_settings
         pitch_gload_min             -2
         pitch_gload_max              8
         yaw_gload_max                0.5
         afterburner_threshold        1
         speedbrake_threshold         0
         alpha_min                  -16
         alpha_max                   20
         pitch_rate_min             -10
         pitch_rate_max              40
         vert_speed_min          -15000
         vert_speed_max           15000
         beta_max                    10
         yaw_rate_max                 5
         roll_rate_max              180
         bank_angle_max              90
         forward_accel_min           -1
         forward_accel_max            2
         turn_roll_in_multiplier      4
         route_allowable_angle_error  5 deg
      end_limits_and_settings
```

- **演示要点**：演示 limits_and_settings 的参数：pitch_gload_min, pitch_gload_max, yaw_gload_max, afterburner_threshold, speedbrake_threshold, alpha_min, alpha_max, pitch_rate_min, pitch_rate_max, vert_speed_min

### limits_and_settings（autopilot_config）｜

- **关键词**：limits_and_settings, include, afterburner_threshold, speedbrake_threshold, alpha_min, alpha_max, pitch_rate_min, pitch_rate_max, vert_speed_min, vert_speed_max, beta_max, yaw_rate_max, roll_rate_max
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:189-209`　（同签名共 54 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/controls/hw_autopilot_config.txt:190`、`p6dof/p6dof_types/aircraft/b-fw/controls/autopilot_config.txt:189`、`p6dof/p6dof_types/aircraft/b-fw/controls/hw_autopilot_config.txt:190`）
- **片段**：

```text
    limits_and_settings
      include autopilot_config_g_limits.txt
      afterburner_threshold       1
      speedbrake_threshold        0
      alpha_min                   -16
      alpha_max                   20
      pitch_rate_min              -10
      pitch_rate_max              40
      vert_speed_min              -5000
      vert_speed_max              5000
      beta_max                    10
      yaw_rate_max                5
      roll_rate_max               180
      bank_angle_max              60
      forward_accel_min           -1
      forward_accel_max           2
      taxi_speed_max_fps          10
      taxi_yaw_rate_max           10
      turn_roll_in_multiplier     4         # This can be manually 'tuned' for improved performance
      route_allowable_angle_error 5 deg     # This can be manually 'tuned' for improved performance
    end_limits_and_settings
```

- **演示要点**：演示 limits_and_settings 的参数：include, afterburner_threshold, speedbrake_threshold, alpha_min, alpha_max, pitch_rate_min, pitch_rate_max, vert_speed_min, vert_speed_max, beta_max

### limits_and_settings（autopilot_config）｜

- **关键词**：limits_and_settings, afterburner_threshold, speedbrake_threshold, pitch_gload_min, pitch_gload_max, alpha_min, alpha_max, pitch_rate_min, pitch_rate_max, vert_speed_min, vert_speed_max, yaw_gload_max, beta_max
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/autopilot_config.txt:240-260`
- **片段**：

```text
    limits_and_settings
      afterburner_threshold      1
      speedbrake_threshold       -0.5
      pitch_gload_min            -1
      pitch_gload_max            9
      alpha_min                  -2
      alpha_max                  10
      pitch_rate_min             -5
      pitch_rate_max             30
      vert_speed_min             -5000
      vert_speed_max             5000
      yaw_gload_max              2
      beta_max                   10
      yaw_rate_max               15
      roll_rate_max              180
      bank_angle_max             60
      forward_accel_min          -1
      forward_accel_max          2
      taxi_speed_max_fps         10
      taxi_yaw_rate_max          30
    end_limits_and_settings
```

- **演示要点**：演示 limits_and_settings 的参数：afterburner_threshold, speedbrake_threshold, pitch_gload_min, pitch_gload_max, alpha_min, alpha_max, pitch_rate_min, pitch_rate_max, vert_speed_min, vert_speed_max

### limits_and_settings（autopilot_config_pm6）｜

- **关键词**：limits_and_settings, include, afterburner_threshold, speedbrake_threshold, alpha_min, alpha_max, pitch_rate_min, pitch_rate_max, vert_speed_min, vert_speed_max, beta_max, yaw_rate_max, roll_rate_max
- **出处**：`six_dof/six_dof_types/aircraft/fa-lgt/controls/autopilot_config_pm6.txt:130-148`
- **片段**：

```text
    limits_and_settings
      include autopilot_config_g_limits.txt
      afterburner_threshold       1
      speedbrake_threshold        0
      alpha_min                   -16
      alpha_max                   20
      pitch_rate_min              -10
      pitch_rate_max              40
      vert_speed_min              -15000
      vert_speed_max              15000
      beta_max                    10
      yaw_rate_max                5
      roll_rate_max               180
      bank_angle_max              180
      forward_accel_min           -1
      forward_accel_max           2
      turn_roll_in_multiplier     4         # This can be manually 'tuned' for improved performance
      route_allowable_angle_error 5 deg     # This can be manually 'tuned' for improved performance
    end_limits_and_settings
```

- **演示要点**：演示 limits_and_settings 的参数：include, afterburner_threshold, speedbrake_threshold, alpha_min, alpha_max, pitch_rate_min, pitch_rate_max, vert_speed_min, vert_speed_max, beta_max

### liquid_propellant_rocket（orbiter-main-rkt）｜

- **关键词**：liquid_propellant_rocket, max_thrust_vacuum, normalized_spindown, normalized_spinup, normalized_thrust_vs_alt, isp_vs_alt
- **出处**：`six_dof/six_dof_types/spacecraft/orbiter-main/prop/solid_propellant_rockets/orbiter-main-rkt/orbiter-main-rkt.txt:26-95`
- **片段**：

```text
      liquid_propellant_rocket

         max_thrust_vacuum 10000 lbf
         
         normalized_spindown 0.5
         normalized_spinup 0.5
      
         //-------------------------------------------------------------------------
      
         normalized_thrust_vs_alt
                 0.0      0.900000
            150000.0      1.000000
            
         end_normalized_thrust_vs_alt
      
         isp_vs_alt
            // alt          Isp
                 0.0      240.000000
              5000.0      242.766560
             10000.0      245.230420
             15000.0      247.415200
             20000.0      249.343720
             25000.0      251.037580
             30000.0      252.517340
             35000.0      253.802480
             40000.0      255.076600
             45000.0      256.128340
             50000.0      256.955400
             55000.0      257.605800
             60000.0      258.117240
             65000.0      258.519460
             70000.0      258.842120
             75000.0      259.093700
             80000.0      259.289420
             85000.0      259.441940
             90000.0      259.561000
             95000.0      259.654100
            100000.0      259.727020
            105000.0      259.784220
            110000.0      259.830960
            115000.0      259.866980
            120000.0      259.894880
            125000.0      259.916580
            130000.0      259.933540
            135000.0      259.946840
            140000.0      259.957320
            145000.0      259.965620
            150000.0      259.972220
            155000.0      259.977400
            160000.0      259.981360
            165000.0      259.984620
            170000.0      259.987200
            175000.0      259.989300
            180000.0      259.991100
            185000.0      259.992600
            190000.0      259.993880
            195000.0      259.994940
            200000.0      259.995840
            210000.0      259.997220
            220000.0      259.998160
            230000.0      259.998800
            240000.0      259.999240
            250000.0      259.999520
            260000.0      259.999720
            270000.0      259.999820
            280000.0      259.999900
            400000.0      260.000000
         end_isp_vs_alt
      
      end_liquid_propellant_rocket
```

- **演示要点**：演示 liquid_propellant_rocket 的参数：max_thrust_vacuum, normalized_spindown, normalized_spinup, normalized_thrust_vs_alt, isp_vs_alt

### liquid_propellant_rocket_type（Generic_ICBM_RocketEngines）｜

- **关键词**：liquid_propellant_rocket_type, normalized_thrust_vs_alt, isp_vs_alt, max_thrust_sealevel, normalized_spinup, normalized_spindown
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/Generic_ICBM_RocketEngines.txt:109-131`
- **片段**：

```text
   liquid_propellant_rocket_type   ICBM_PBV_MainEngine   P6DOF_LIQUID_PROPELLANT_ROCKET

      normalized_thrust_vs_alt
        #alt      normalized_thrust
        0.0       1.0
        300000.0  1.0
      end_normalized_thrust_vs_alt

      isp_vs_alt
         #alt_feet     Isp
         0.0           285.0
         100000.0      290.0
         300000.0      295.0
      end_isp_vs_alt

#     FuelFeed             *****

      max_thrust_sealevel    300.0 lbf

      normalized_spinup     100.0
      normalized_spindown   100.0

   end_liquid_propellant_rocket_type
```

- **演示要点**：演示 liquid_propellant_rocket_type 的参数：normalized_thrust_vs_alt, isp_vs_alt, max_thrust_sealevel, normalized_spinup, normalized_spindown

### local_pitch_program（simple-icbm）｜

- **关键词**：local_pitch_program
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:961-966`　（同签名共 4 处，另见 `p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:974`、`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:989`、`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:944`）
- **片段**：

```text
          local_pitch_program
            #Time         PitchAng(deg)
            0.0           30.0
            40.0          17.0
            80.0          17.0
          end_local_pitch_program
```

- **演示要点**：演示 local_pitch_program（最小结构，无子参数）

### maneuver（mission_design_astrolabe）｜

- **关键词**：maneuver, execute_at, finite, duration, update_interval, delta_v
- **出处**：`space_operations/mission_design_astrolabe.txt:84-90`　（同签名共 3 处，另见 `space_operations/mission_design_astrolabe.txt:92`、`space_operations/mission_design_astrolabe.txt:104`）
- **片段**：

```text
         maneuver tangent
            execute_at ascending_node
            finite
            duration 18.2 minutes
            update_interval 1 seconds
            delta_v -0 m/s
         end_maneuver
```

- **演示要点**：演示 maneuver 的参数：execute_at, finite, duration, update_interval, delta_v

### maneuver（mission_design_astrolabe）｜

- **关键词**：maneuver, execute_at, inclination
- **出处**：`space_operations/mission_design_astrolabe.txt:112-115`
- **片段**：

```text
         maneuver change_inclination
            execute_at descending_node
            inclination 0 degrees
         end_maneuver
```

- **演示要点**：演示 maneuver 的参数：execute_at, inclination

### maneuver（proximity_operations）｜

- **关键词**：maneuver, delta_time, target
- **出处**：`space_operations/proximity_operations.txt:49-55`　（同签名共 14 处，另见 `space_operations/proximity_operations.txt:56`、`space_operations/proximity_operations.txt:64`、`space_operations/proximity_operations.txt:71`）
- **片段**：

```text
         maneuver intercept
            delta_time 1000 s
            target
               offset ntw -50 0 30 m
               platform target
            end_target
         end_maneuver
```

- **演示要点**：演示 maneuver 的参数：delta_time, target

### maneuver（mission_design_astrolabe）｜

- **关键词**：maneuver, execute_at
- **出处**：`space_operations/mission_design_astrolabe.txt:117-119`
- **片段**：

```text
         maneuver circularize
            execute_at descending_radius 42164 kilometers
         end_maneuver
```

- **演示要点**：演示 maneuver 的参数：execute_at

### maneuvering（conjunction_avoidance）｜

- **关键词**：maneuvering, delta_v
- **出处**：`space_operations/conjunction_avoidance.txt:79-81`　（同签名共 2 处，另见 `space_operations/traveling_astronaut.txt:35`）
- **片段**：

```text
   maneuvering simple
      delta_v 15 km/s
   end_maneuvering
```

- **演示要点**：演示 maneuvering 的参数：delta_v

### maneuvering（mission_design_astrolabe）｜

- **关键词**：maneuvering, stage
- **出处**：`space_operations/mission_design_astrolabe.txt:57-79`
- **片段**：

```text
      maneuvering rocket
         stage  // breeze-M APT (Auxiliary Propellant Tank; modeled as a separate stage, as it is jettisoned).
            specific_impulse 326 seconds
            thrust 19620 newtons
            empty_mass 1125 kg  // APT Only
            fuel_mass 10920 kg  // APT Only
         end_stage
         
         stage  // breeze-M upper stage
            specific_impulse 326 seconds
            thrust 19620 newtons
            empty_mass 1125 kg
            fuel_mass 8300 kg
         end_stage

         stage  // payload with mr-107 aerojet small thrusters
            specific_impulse 236 s
            thrust           1028 newtons // assume x4
            empty_mass       2000 kg
            fuel_mass        500 kg       // guess
         end_stage
         
      end_maneuvering
```

- **演示要点**：演示 maneuvering 的参数：stage

### maneuvering（tapsatellite）｜

- **关键词**：maneuvering
- **出处**：`space_operations/platforms/tapsatellite.txt:19-20`
- **片段**：

```text
      maneuvering simple
      end_maneuvering
```

- **演示要点**：演示 maneuvering（最小结构，无子参数）

### manual_pilot_augmented_controls（control_inputs_pm6）｜

- **关键词**：manual_pilot_augmented_controls, include, yaw_control_mapping_table, pitch_control_mapping_table, roll_control_mapping_table, yaw_trim_factor, yaw_control_augmentation_factor_deg, pitch_trim_factor, pitch_control_augmentation_factor_g, roll_trim_factor, roll_control_augmentation_factor_dps
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/control_inputs_pm6.txt:16-70`　（同签名共 2 处，另见 `six_dof_with_brawler/six_dof_types/aircraft/LTE_FIGHTER/controls/control_inputs_pm6.txt:16`）
- **片段**：

```text
   manual_pilot_augmented_controls
      include autopilot_config_pm6.txt

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

      yaw_trim_factor                         0.1
      yaw_control_augmentation_factor_deg    10

      pitch_trim_factor                       0.1
      pitch_control_augmentation_factor_g     8

      roll_trim_factor                        0.1
      roll_control_augmentation_factor_dps  180

   end_manual_pilot_augmented_controls
```

- **演示要点**：演示 manual_pilot_augmented_controls 的参数：include, yaw_control_mapping_table, pitch_control_mapping_table, roll_control_mapping_table, yaw_trim_factor, yaw_control_augmentation_factor_deg, pitch_trim_factor, pitch_control_augmentation_factor_g, roll_trim_factor, roll_control_augmentation_factor_dps

### manual_pilot_augmented_controls（control_inputs_pm6）｜

- **关键词**：manual_pilot_augmented_controls, include, yaw_control_mapping_table, pitch_control_mapping_table, roll_control_mapping_table, pitch_trim_factor, roll_trim_factor, yaw_trim_factor, pitch_control_augmentation_factor_g, roll_control_augmentation_factor_dps
- **出处**：`six_dof/six_dof_types/aircraft/b-fw/controls/control_inputs_pm6.txt:25-77`　（同签名共 13 处，另见 `six_dof/six_dof_types/aircraft/b-fw/controls/control_inputs_rb6.txt:73`、`p6dof/p6dof_types/aircraft/a-lgt/controls/control_inputs.txt:73`、`p6dof/p6dof_types/aircraft/b-fw/controls/control_inputs.txt:73`）
- **片段**：

```text
   manual_pilot_augmented_controls
      # Define the CAS autopilot configuration
      include autopilot_config_pm6.txt

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

      pitch_trim_factor                     0.1
      roll_trim_factor                      0.1
      yaw_trim_factor                       0.1

      pitch_control_augmentation_factor_g   4
      roll_control_augmentation_factor_dps  10
   end_manual_pilot_augmented_controls
```

- **演示要点**：演示 manual_pilot_augmented_controls 的参数：include, yaw_control_mapping_table, pitch_control_mapping_table, roll_control_mapping_table, pitch_trim_factor, roll_trim_factor, yaw_trim_factor, pitch_control_augmentation_factor_g, roll_control_augmentation_factor_dps

### manual_pilot_augmented_controls（control_inputs_pm6）｜

- **关键词**：manual_pilot_augmented_controls, include, pitch_trim_factor, roll_trim_factor, yaw_trim_factor, pitch_control_augmentation_factor_g, roll_control_augmentation_factor_dps
- **出处**：`six_dof/six_dof_types/spacecraft/orbiter-booster/controls/control_inputs_pm6.txt:27-37`　（同签名共 25 处，另见 `six_dof/six_dof_types/spacecraft/orbiter-main/controls/control_inputs_pm6.txt:25`、`six_dof/six_dof_types/weapons/aam-mr/controls/control_inputs_pm6.txt:25`、`six_dof/six_dof_types/weapons/aam-mr/controls/control_inputs_rb6.txt:73`）
- **片段**：

```text
   manual_pilot_augmented_controls
      # Define the CAS autopilot configuration
      include autopilot_config_pm6.txt

      pitch_trim_factor                     0.1
      roll_trim_factor                      0.1
      yaw_trim_factor                       0.1

      pitch_control_augmentation_factor_g   30
      roll_control_augmentation_factor_dps  360
   end_manual_pilot_augmented_controls
```

- **演示要点**：演示 manual_pilot_augmented_controls 的参数：include, pitch_trim_factor, roll_trim_factor, yaw_trim_factor, pitch_control_augmentation_factor_g, roll_control_augmentation_factor_dps

### manual_pilot_augmented_stability（control_inputs）｜

- **关键词**：manual_pilot_augmented_stability, include, yaw_control_mapping_table, pitch_control_mapping_table, roll_control_mapping_table, pitch_trim_factor, roll_trim_factor, yaw_trim_factor, pitch_stability_augmentation, yaw_stability_augmentation, roll_stability_augmentation
- **出处**：`p6dof/p6dof_types/aircraft/b-hvy/controls/control_inputs.txt:73-127`　（同签名共 3 处，另见 `six_dof/six_dof_types/aircraft/b-hvy/controls/control_inputs_pm6.txt:25`、`six_dof/six_dof_types/aircraft/b-hvy/controls/control_inputs_rb6.txt:73`）
- **片段**：

```text
   manual_pilot_augmented_stability
      # Define the SAS autopilot configuration
      include autopilot_config.txt

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


      pitch_trim_factor                     0.1
      roll_trim_factor                      0.1
      yaw_trim_factor                       0.1

      pitch_stability_augmentation          true
      yaw_stability_augmentation            true
      roll_stability_augmentation           true
   end_manual_pilot_augmented_stability
```

- **演示要点**：演示 manual_pilot_augmented_stability 的参数：include, yaw_control_mapping_table, pitch_control_mapping_table, roll_control_mapping_table, pitch_trim_factor, roll_trim_factor, yaw_trim_factor, pitch_stability_augmentation, yaw_stability_augmentation, roll_stability_augmentation

### mass_properties（a-lgt）｜

- **关键词**：mass_properties, mass, moment_of_inertia_ixx, moment_of_inertia_iyy, moment_of_inertia_izz, center_of_mass_x, center_of_mass_y, center_of_mass_z
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/a-lgt.txt:27-35`　（同签名共 64 处，另见 `p6dof/p6dof_types/aircraft/b-fw/b-fw.txt:27`、`p6dof/p6dof_types/aircraft/b-hvy/b-hvy.txt:27`、`p6dof/p6dof_types/aircraft/c-hvy/c-hvy.txt:27`）
- **片段**：

```text
      mass_properties
         mass                            25000.00000 lbs
         moment_of_inertia_ixx           45194.59152 slug*ft^2
         moment_of_inertia_iyy          137396.07195 slug*ft^2
         moment_of_inertia_izz          179049.47601 slug*ft^2
         center_of_mass_x                    0.00001 ft
         center_of_mass_y                   -0.00000 ft
         center_of_mass_z                   -0.00000 ft
      end_mass_properties
```

- **演示要点**：演示 mass_properties 的参数：mass, moment_of_inertia_ixx, moment_of_inertia_iyy, moment_of_inertia_izz, center_of_mass_x, center_of_mass_y, center_of_mass_z

### mass_properties（aam-mr）｜

- **关键词**：mass_properties, mass, center_of_mass_x, center_of_mass_y, center_of_mass_z
- **出处**：`six_dof/six_dof_types/weapons/aam-mr/aam-mr.txt:84-89`
- **片段**：

```text
      mass_properties
         mass                              195.72917 lbs
         center_of_mass_x                   -0.00000 ft
         center_of_mass_y                   -0.00000 ft
         center_of_mass_z                    0.00000 ft
      end_mass_properties
```

- **演示要点**：演示 mass_properties 的参数：mass, center_of_mass_x, center_of_mass_y, center_of_mass_z

### mass_properties（LTE_FIGHTER）｜

- **关键词**：mass_properties, mass
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/LTE_FIGHTER.txt:20-22`　（同签名共 14 处，另见 `six_dof/six_dof_types/aircraft/c-hvy/c-hvy.txt:107`、`six_dof/six_dof_types/aircraft/fa-hvy/fa-hvy.txt:93`、`six_dof/six_dof_types/misc/srb-rato/srb-rato.txt:82`）
- **片段**：

```text
      mass_properties
         mass	36109.999986200004 lbs
      end_mass_properties
```

- **演示要点**：演示 mass_properties 的参数：mass

### mover · WSF_AIR_MOVER｜运动模型

- **关键词**：mover, WSF_AIR_MOVER, roll_rate_limit, default_linear_acceleration, default_radial_acceleration, default_climb_rate, maximum_climb_rate, maximum_speed, minimum_speed, maximum_altitude, minimum_altitude, maximum_linear_acceleration, at_end_of_path, turn_rate_limit, 运动模型
- **出处**：`base_types/weapons/aam/scenario_test_launch_computer.txt:49-62`　（同签名共 19 处，另见 `behavior_tree/platforms/blackboard_striker.txt:21`、`behavior_tree/platforms/condition_striker.txt:20`、`behavior_tree/platforms/decorator_striker.txt:19`）
- **片段**：

```text
   mover WSF_AIR_MOVER
      roll_rate_limit               1 rad/sec
      default_linear_acceleration   1.0 g
      default_radial_acceleration   6.5 g
      default_climb_rate            400 fps
      maximum_climb_rate            400 fps
      maximum_speed                 600.0 knots
      minimum_speed                 150.0 knots
      maximum_altitude              50000 ft
      minimum_altitude              50 ft
      maximum_linear_acceleration   9 g
      at_end_of_path extrapolate
      turn_rate_limit               4.0 deg/sec
   end_mover
```

- **演示要点**：演示 WSF_AIR_MOVER 的参数：roll_rate_limit, default_linear_acceleration, default_radial_acceleration, default_climb_rate, maximum_climb_rate, maximum_speed, minimum_speed, maximum_altitude, minimum_altitude, maximum_linear_acceleration

### mover · WSF_AIR_MOVER｜运动模型

- **关键词**：mover, WSF_AIR_MOVER, roll_rate_limit, default_linear_acceleration, default_radial_acceleration, maximum_radial_acceleration, default_climb_rate, maximum_climb_rate, maximum_speed, minimum_speed, maximum_altitude, minimum_altitude, maximum_linear_acceleration, at_end_of_path, 运动模型
- **出处**：`timeline_lead/platforms/striker.txt:41-56`
- **片段**：

```text
   mover WSF_AIR_MOVER
      roll_rate_limit               1 rad/sec
      default_linear_acceleration   1.0 g
     #default_radial_acceleration   6.5 g
      default_radial_acceleration   6.0 g
      maximum_radial_acceleration   9.0 g
      default_climb_rate            400 fps
      maximum_climb_rate            400 fps
      maximum_speed                 650.0 knots
      minimum_speed                 150.0 knots
      maximum_altitude              50000 ft
      minimum_altitude              50 ft
      maximum_linear_acceleration   9.0 g
      at_end_of_path extrapolate
     #turn_rate_limit               4.0 deg/sec
   end_mover
```

- **演示要点**：演示 WSF_AIR_MOVER 的参数：roll_rate_limit, default_linear_acceleration, default_radial_acceleration, maximum_radial_acceleration, default_climb_rate, maximum_climb_rate, maximum_speed, minimum_speed, maximum_altitude, minimum_altitude

### mover · WSF_P6DOF_MOVER｜运动模型

- **关键词**：mover, WSF_P6DOF_MOVER, p6dof_object_type, update_interval, event_core_data, event_kinematic_data, event_engine_fuel_data, event_autopilot_data, event_autopilot_limits_data, event_control_inputs_data, event_control_surfaces_data, event_force_moment_data, 运动模型
- **出处**：`p6dof/platforms/aam-mr.txt:30-41`　（同签名共 10 处，另见 `p6dof/platforms/aam-sr.txt:30`、`p6dof/platforms/agm-mrc.txt:42`、`p6dof/platforms/b-fw.txt:27`）
- **片段**：

```text
   mover WSF_P6DOF_MOVER
      p6dof_object_type AAM-MR
      update_interval   0.01 sec
      event_core_data             20 Hz
      event_kinematic_data        20 Hz
      event_engine_fuel_data      10 Hz
      event_autopilot_data         5 Hz
      event_autopilot_limits_data  1 Hz
      event_control_inputs_data    1 Hz
      event_control_surfaces_data  1 Hz
      event_force_moment_data      1 Hz	  
   end_mover
```

- **演示要点**：演示 WSF_P6DOF_MOVER 的参数：p6dof_object_type, update_interval, event_core_data, event_kinematic_data, event_engine_fuel_data, event_autopilot_data, event_autopilot_limits_data, event_control_inputs_data, event_control_surfaces_data, event_force_moment_data

### mover · WSF_RIGID_BODY_SIX_DOF_MOVER｜运动模型

- **关键词**：mover, WSF_RIGID_BODY_SIX_DOF_MOVER, vehicle_type, update_interval, event_core_data, event_kinematic_data, event_engine_fuel_data, event_autopilot_data, event_autopilot_limits_data, event_control_inputs_data, event_control_surfaces_data, event_force_moment_data, 运动模型
- **出处**：`six_dof/platforms/aam-mr.txt:30-41`　（同签名共 9 处，另见 `six_dof/platforms/aam-sr.txt:24`、`six_dof/platforms/agm-mrc.txt:40`、`six_dof/platforms/b-fw.txt:27`）
- **片段**：

```text
   mover WSF_RIGID_BODY_SIX_DOF_MOVER
      vehicle_type     AAM-MR_RB6
      update_interval  0.01 sec
      event_core_data             20 Hz
      event_kinematic_data        20 Hz
      event_engine_fuel_data      10 Hz
      event_autopilot_data         5 Hz
      event_autopilot_limits_data  1 Hz
      event_control_inputs_data    1 Hz
      event_control_surfaces_data  1 Hz
      event_force_moment_data      1 Hz	  
   end_mover
```

- **演示要点**：演示 WSF_RIGID_BODY_SIX_DOF_MOVER 的参数：vehicle_type, update_interval, event_core_data, event_kinematic_data, event_engine_fuel_data, event_autopilot_data, event_autopilot_limits_data, event_control_inputs_data, event_control_surfaces_data, event_force_moment_data

### mover（kinematic_mover_demo）｜运动模型

- **关键词**：mover, initial_speed, initial_flight_path_angle, target_speed, maximum_linear_acceleration, maximum_radial_acceleration, maximum_body_turn_rate, maximum_body_roll_rate, proportional_navigation_gain, velocity_pursuit_gain, update_interval, 运动模型
- **出处**：`kinematic_mover/kinematic_mover_demo.txt:76-88`　（同签名共 3 处，另见 `kinematic_mover/kinematic_mover_demo.txt:112`、`kinematic_mover/kinematic_mover_demo.txt:155`）
- **片段**：

```text
    mover
      #detailed_debug true
      initial_speed          250 kts
      initial_flight_path_angle 5 deg
      target_speed           210 kts
      maximum_linear_acceleration  1.4 g
      maximum_radial_acceleration 4.0 g
      maximum_body_turn_rate  65 deg/sec
      maximum_body_roll_rate  80 deg/sec
      proportional_navigation_gain 10.0
      velocity_pursuit_gain        30.0
      update_interval 0.1 sec
    end_mover
```

- **演示要点**：演示 mover 的参数：initial_speed, initial_flight_path_angle, target_speed, maximum_linear_acceleration, maximum_radial_acceleration, maximum_body_turn_rate, maximum_body_roll_rate, proportional_navigation_gain, velocity_pursuit_gain, update_interval

### mover · WSF_ROTORCRAFT_MOVER｜运动模型

- **关键词**：mover, WSF_ROTORCRAFT_MOVER, mode, start_mode, update_interval, lateral_acceleration_rate_pid, lateral_acceleration_value_pid, vertical_acceleration_rate_pid, vertical_acceleration_value_pid, disk_tilt_filter_time_constant, position_hold_capture_radius, altitude_error_to_rate_of_climb_gain, 运动模型
- **出处**：`hellfire/active_radar_hellfire/helo_mover.txt:13-127`　（同签名共 3 处，另见 `hellfire/laser_designation_via_dis/helo_mover.txt:13`、`hellfire/semiactive_laser_hellfire/helo_mover.txt:13`）
- **片段**：

```text
mover HELO_MOVER WSF_ROTORCRAFT_MOVER

   mode HOVER

      weathercock_speed               12 kts # Speed above which the aircraft weathercocks to point into the velocity vector.

      maximum_attitude_rate         3.0 rpm # <fabricated>  # Largest angular rate for the body, in any axis.
      minimum_upward_acceleration   0.1 g  # <fabricated>   # Most-negative permitted value for downward acceleration.
                                                            # (Generally, rotorcraft CANNOT fly negative G without risk to airframe.)

      body_rates_gain                10 # Rotate heading toward the target at
                                        # a rate proportional to the error,
                                        # clamped to maximum_attitude_rate

      maximum_ground_speed          30 kts                  # Self explanatory.  Fastest speed attainable in this mode (HOVER).

      maximum_rate_of_climb       1250 ft/min # <fabricated>
      maximum_rate_of_descent     1500 ft/min # <fabricated>

      maximum_total_acceleration   2.0 g      # <fabricated>

   end_mode

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

   mode CRUISE

      weathercock_speed              12 kts

      maximum_attitude_rate         3.0 rpm # <fabricated>
      minimum_upward_acceleration   0.1 g  # <fabricated>

      body_rates_gain                10 # Rotate heading toward the target at
                                        # a rate proportional to the error,
                                        # clamped to maximum_attitude_rate

      maximum_ground_speed         149 kts    # Max Cruise
      maximum_rate_of_climb       1850 ft/min # <fabricated>
      maximum_rate_of_descent     2550 ft/min # <fabricated>
      maximum_total_acceleration   3.5 g      # <fabricated>

   end_mode

   mode DASH

      weathercock_speed               12 kts

      maximum_attitude_rate         3.0 rpm # <fabricated>
      minimum_upward_acceleration   0.1 g  # <fabricated>

      body_rates_gain                10 # Rotate heading toward the target at
                                        # a rate proportional to the error,
                                        # clamped to maximum_attitude_rate

      maximum_ground_speed         180 kts    # (Vne = 195 kts)
      maximum_rate_of_climb        550 ft/min # <fabricated>
      maximum_rate_of_descent      850 ft/min # <fabricated>
      maximum_total_acceleration   3.0 g      # <fabricated>

   end_mode

   start_mode HOVER

   update_interval 0.1 sec

   // Default values for the PIDs are provided in code.
   lateral_acceleration_rate_pid
      proportional_gain 2.0
      integral_gain     0.0
      derivative_gain   0.5
      input_threshold   0.0
   end_lateral_acceleration_rate_pid

   lateral_acceleration_value_pid
      proportional_gain 0.020
      integral_gain     0.0
      derivative_gain   20.0
      input_threshold   0.0
   end_lateral_acceleration_value_pid

   vertical_acceleration_rate_pid
      proportional_gain 0.025
      integral_gain     0.001
      derivative_gain   2.00
      input_threshold   0.0
   end_vertical_acceleration_rate_pid

   vertical_acceleration_value_pid
      proportional_gain 0.025
      integral_gain     0.000
      derivative_gain   12.00
      input_threshold   0.0
   end_vertical_acceleration_value_pid

   disk_tilt_filter_time_constant           3 sec
   position_hold_capture_radius             100.0 m
   altitude_error_to_rate_of_climb_gain      2.0

end_mover
```

- **演示要点**：演示 WSF_ROTORCRAFT_MOVER 的参数：mode, start_mode, update_interval, lateral_acceleration_rate_pid, lateral_acceleration_value_pid, vertical_acceleration_rate_pid, vertical_acceleration_value_pid, disk_tilt_filter_time_constant, position_hold_capture_radius, altitude_error_to_rate_of_climb_gain

### mover · WSF_POINT_MASS_SIX_DOF_MOVER｜运动模型

- **关键词**：mover, WSF_POINT_MASS_SIX_DOF_MOVER, vehicle_type, update_interval, event_core_data, event_kinematic_data, event_engine_fuel_data, event_autopilot_data, event_autopilot_limits_data, event_control_inputs_data, event_force_moment_data, 运动模型
- **出处**：`six_dof/platforms/aam-mr.txt:56-66`　（同签名共 10 处，另见 `six_dof/platforms/agm-mrc.txt:58`、`six_dof/platforms/b-fw.txt:53`、`six_dof/platforms/b-hvy.txt:42`）
- **片段**：

```text
   mover WSF_POINT_MASS_SIX_DOF_MOVER
      vehicle_type     AAM-MR_PM6
      update_interval  0.05 sec
      event_core_data             20 Hz
      event_kinematic_data        20 Hz
      event_engine_fuel_data      10 Hz
      event_autopilot_data         5 Hz
      event_autopilot_limits_data  1 Hz
      event_control_inputs_data    1 Hz
      event_force_moment_data     20 Hz  
   end_mover
```

- **演示要点**：演示 WSF_POINT_MASS_SIX_DOF_MOVER 的参数：vehicle_type, update_interval, event_core_data, event_kinematic_data, event_engine_fuel_data, event_autopilot_data, event_autopilot_limits_data, event_control_inputs_data, event_force_moment_data

### mover · WSF_AIR_MOVER｜运动模型

- **关键词**：mover, WSF_AIR_MOVER, roll_rate_limit, default_linear_acceleration, default_radial_acceleration, default_climb_rate, maximum_speed, maximum_altitude, minimum_altitude, maximum_linear_acceleration, at_end_of_path, 运动模型
- **出处**：`base_types/platforms/red_multirole_fighter_2_base.txt:25-35`　（同签名共 8 处，另见 `base_types/platforms/blue_adv_fighter_1_base.txt:18`、`base_types/platforms/blue_multirole_fighter_1_base.txt:33`、`base_types/platforms/red_fighter_1_base.txt:19`）
- **片段**：

```text
   mover WSF_AIR_MOVER
      roll_rate_limit               1 rad/sec
      default_linear_acceleration   1.0 g
      default_radial_acceleration   6.0 g
      default_climb_rate            400 fps
      maximum_speed                 850.0 knots
      maximum_altitude              50000 ft
      minimum_altitude              50 ft
      maximum_linear_acceleration   8 g
      at_end_of_path extrapolate
   end_mover
```

- **演示要点**：演示 WSF_AIR_MOVER 的参数：roll_rate_limit, default_linear_acceleration, default_radial_acceleration, default_climb_rate, maximum_speed, maximum_altitude, minimum_altitude, maximum_linear_acceleration, at_end_of_path

### mover · WSF_GUIDED_MOVER｜运动模型

- **关键词**：mover, WSF_GUIDED_MOVER, total_mass, fuel_mass, thrust_duration, burn_rate, specific_impulse, thrust, update_interval, aero, 运动模型
- **出处**：`base_types/weapons/aam/blue_lr_a2a_rf_missile.txt:70-85`　（同签名共 2 处，另见 `base_types/weapons/aam/test_medium_range_missile.txt:69`）
- **片段**：

```text
  mover WSF_GUIDED_MOVER
   #thrust             2500.0 lbf
   #fuel_mass            55.0 kg
   #specific_impulse    250.0 sec
   #thrust_duration    12.12 sec

    total_mass          150.0  kg
    fuel_mass            80.0  kg
    thrust_duration      40.0  sec
    burn_rate             2.0  kg/s
    specific_impulse    907.18 sec
    thrust             4000.0  lbf
    update_interval       0.1  sec
    aero GUESSED_AERO
    #show_status # Turns on some mass properties diagnostic output
  end_mover
```

- **演示要点**：演示 WSF_GUIDED_MOVER 的参数：total_mass, fuel_mass, thrust_duration, burn_rate, specific_impulse, thrust, update_interval, aero

### mover · WSF_GUIDED_MOVER｜运动模型

- **关键词**：mover, WSF_GUIDED_MOVER, total_mass, fuel_mass, specific_impulse, thrust, thrust_duration, update_interval, aero, 运动模型
- **出处**：`wargame/weapons/aam/aam_type.txt:18-26`　（同签名共 7 处，另见 `base_types/weapons/aam/simple_medium_range_missile.txt:59`、`behavior_tree/weapons/aam/simple_mrm.txt:55`、`air_to_air/weapons/aam/medium_range_radar_missile.txt:149`）
- **片段**：

```text
  mover WSF_GUIDED_MOVER
    total_mass       188.0 lbm
    fuel_mass         61.0 lbm
    specific_impulse 222.0 sec
    thrust          2700.0 lbf
    thrust_duration    5.1 sec
    update_interval 0.10 s
    aero WSF_AERO
  end_mover
```

- **演示要点**：演示 WSF_GUIDED_MOVER 的参数：total_mass, fuel_mass, specific_impulse, thrust, thrust_duration, update_interval, aero

### mover · WSF_P6DOF_MOVER｜运动模型

- **关键词**：mover, WSF_P6DOF_MOVER, p6dof_object_type, update_interval, event_core_data, event_kinematic_data, event_autopilot_data, event_control_inputs_data, event_force_moment_data, 运动模型
- **出处**：`p6dof/platforms/gbu-500.txt:41-49`
- **片段**：

```text
   mover WSF_P6DOF_MOVER
      p6dof_object_type GBU-500
      update_interval   0.01 sec
      event_core_data             10 Hz
      event_kinematic_data        10 Hz
      event_autopilot_data         1 Hz
      event_control_inputs_data    1 Hz
      event_force_moment_data      1 Hz	  
   end_mover   
```

- **演示要点**：演示 WSF_P6DOF_MOVER 的参数：p6dof_object_type, update_interval, event_core_data, event_kinematic_data, event_autopilot_data, event_control_inputs_data, event_force_moment_data

### mover · WSF_RIGID_BODY_SIX_DOF_MOVER｜运动模型

- **关键词**：mover, WSF_RIGID_BODY_SIX_DOF_MOVER, vehicle_type, update_interval, event_core_data, event_kinematic_data, event_autopilot_data, event_control_inputs_data, event_force_moment_data, 运动模型
- **出处**：`six_dof/platforms/gbu-500.txt:41-49`
- **片段**：

```text
   mover WSF_RIGID_BODY_SIX_DOF_MOVER
      vehicle_type                GBU-500_RB6
      update_interval             0.01 sec
      event_core_data             10 Hz
      event_kinematic_data        10 Hz
      event_autopilot_data         1 Hz
      event_control_inputs_data    1 Hz
      event_force_moment_data      1 Hz	  
   end_mover
```

- **演示要点**：演示 WSF_RIGID_BODY_SIX_DOF_MOVER 的参数：vehicle_type, update_interval, event_core_data, event_kinematic_data, event_autopilot_data, event_control_inputs_data, event_force_moment_data

### mover · WSF_POINT_MASS_SIX_DOF_MOVER｜运动模型

- **关键词**：mover, WSF_POINT_MASS_SIX_DOF_MOVER, vehicle_type, update_interval, event_core_data, event_kinematic_data, event_autopilot_data, event_control_inputs_data, event_force_moment_data, 运动模型
- **出处**：`six_dof/platforms/gbu-500.txt:56-64`
- **片段**：

```text
   mover WSF_POINT_MASS_SIX_DOF_MOVER
      vehicle_type                GBU-500_PM6
      update_interval             0.05 sec
      event_core_data             10 Hz
      event_kinematic_data        10 Hz
      event_autopilot_data         1 Hz
      event_control_inputs_data    1 Hz
      event_force_moment_data      1 Hz	  
   end_mover   
```

- **演示要点**：演示 WSF_POINT_MASS_SIX_DOF_MOVER 的参数：vehicle_type, update_interval, event_core_data, event_kinematic_data, event_autopilot_data, event_control_inputs_data, event_force_moment_data

### mover · WSF_GUIDED_MOVER｜运动模型

- **关键词**：mover, WSF_GUIDED_MOVER, integration_method, total_mass, thrust, thrust_duration, specific_impulse, update_interval, aero, 运动模型
- **出处**：`hellfire/active_radar_hellfire/hellfire_type.txt:93-102`　（同签名共 3 处，另见 `hellfire/laser_designation_via_dis/hellfire_type.txt:87`、`hellfire/semiactive_laser_hellfire/hellfire_type.txt:86`）
- **片段**：

```text
   mover WSF_GUIDED_MOVER
      integration_method rk4

      total_mass        98.0 lbm  # For SAL only, overridden for RF
      thrust          1600.0 lbf
      thrust_duration    4.0 sec
      specific_impulse 250.0 sec
      update_interval 0.01 s
      aero               HELLFIRE_AERO
   end_mover
```

- **演示要点**：演示 WSF_GUIDED_MOVER 的参数：integration_method, total_mass, thrust, thrust_duration, specific_impulse, update_interval, aero

### mover · WSF_GUIDED_MOVER｜运动模型

- **关键词**：mover, WSF_GUIDED_MOVER, integration_method, total_mass, empty_mass, thrust, thrust_duration, update_interval, aero, 运动模型
- **出处**：`laser_designator/weapons/agm/hellfire.txt:25-34`
- **片段**：

```text
   mover WSF_GUIDED_MOVER      
      integration_method rk4
      # data for the agm-114k model
      total_mass        45.7 kg # 9.00 kg
      empty_mass        36.7 kg 
      thrust          1614.0 lbf
      thrust_duration    3.0 sec      
      update_interval 0.01 s
      aero               HELLFIRE_AERO
   end_mover
```

- **演示要点**：演示 WSF_GUIDED_MOVER 的参数：integration_method, total_mass, empty_mass, thrust, thrust_duration, update_interval, aero

### mover · WSF_OLD_GUIDED_MOVER｜运动模型

- **关键词**：mover, WSF_OLD_GUIDED_MOVER, total_mass, fuel_mass, specific_impulse, thrust, thrust_duration, update_interval, aero, 运动模型
- **出处**：`behavior_tree/weapons/aam/blue_sr_a2a_ir_missile.txt:55-66`
- **片段**：

```text
  mover WSF_OLD_GUIDED_MOVER
    total_mass       188.0 lbm # init=188, bo=127
    fuel_mass         61.0 lbm
    # Isp values of 250 are typical of solid rocket motors of
    # today, but that value would not close, so was reduced.
    specific_impulse 222.0 sec
    thrust          2700.0 lbf
    thrust_duration    5.1 sec
    update_interval 0.10 s
    aero BLUE_SR_A2A_IR_MISSILE_AERO 
    #show_status # Turns on some mass properties diagnostic output
  end_mover
```

- **演示要点**：演示 WSF_OLD_GUIDED_MOVER 的参数：total_mass, fuel_mass, specific_impulse, thrust, thrust_duration, update_interval, aero

### mover · WSF_TBM_MOVER｜运动模型

- **关键词**：mover, WSF_TBM_MOVER, total_mass, fuel_mass_fraction, specific_impulse, ballistic_coefficient, thrust_duration, trajectory_type, show_status, 运动模型
- **出处**：`tbm_demos/weapons/ssm/tbm1.txt:21-32`
- **片段**：

```text
   mover WSF_TBM_MOVER
      # The TOTAL launch mass (structure, warhead, fuel/propellant)
      total_mass             6481 kg
      # Fraction of the launch mass that is fuel/propellant
      fuel_mass_fraction     0.751
      specific_impulse       253 sec
      ballistic_coefficient  98000.0 nt/m^2
      thrust_duration        79.2 sec
      trajectory_type        lofted
      show_status
#      debug
   end_mover
```

- **演示要点**：演示 WSF_TBM_MOVER 的参数：total_mass, fuel_mass_fraction, specific_impulse, ballistic_coefficient, thrust_duration, trajectory_type, show_status

### mover（conjunction_ssn）｜运动模型

- **关键词**：mover, eccentricity, inclination, raan, semi_major_axis, true_anomaly, argument_of_periapsis, conjunction_setup, 运动模型
- **出处**：`space_operations/conjunction_ssn.txt:30-43`　（同签名共 2 处，另见 `space_operations/conjunction_ssn.txt:47`）
- **片段**：

```text
   mover
      eccentricity 0.001
      inclination 40.0 deg
      raan 330.0 deg
      semi_major_axis 7410 km
      true_anomaly 20 deg
      argument_of_periapsis 0.0 deg

      conjunction_setup
         from_initial
         with_target primary
         at_time 45 min
      end_conjunction_setup
   end_mover
```

- **演示要点**：演示 mover 的参数：eccentricity, inclination, raan, semi_major_axis, true_anomaly, argument_of_periapsis, conjunction_setup

### mover · WSF_GUIDED_MOVER｜运动模型

- **关键词**：mover, WSF_GUIDED_MOVER, integration_timestep, update_interval, divert_thrust, divert_fuel_mass, divert_fuel_flow_rate, divert_altitude_limits, stage, 运动模型
- **出处**：`ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:83-126`　（同签名共 4 处，另见 `base_types/weapons/sam/blue_naval_sam.txt:83`、`space_operations/weapons/blue_naval_sam.txt:83`、`base_types/weapons/sam/blue_lr_sam_common.txt:198`）
- **片段**：

```text
mover BLUE_NAVAL_SAM_MOVER WSF_GUIDED_MOVER
   #show_status
   integration_timestep      0.001 secs
   update_interval           0.01 secs
# divert thrust taken from unclass blue_lr_sam and doubled
   divert_thrust                        8000 Nt
   divert_fuel_mass                     10 kg
   divert_fuel_flow_rate                1.0 kg/s
   divert_altitude_limits               80 km 1000 km
   # stage info came from janes.com,
   # designation-systems.com
   # astronautix.com
   stage 1 # MK-72 Solid Rocket Booster
       aero                   BLUE_NAVAL_SAM_STAGE_1_AERO
       empty_mass             535 lbs
       total_mass             1540 lbs
       specific_impulse       260 sec
       thrust_duration        6 sec
   end_stage
   stage 2 # MK-104 Solid Rocket Booster
       aero                   BLUE_NAVAL_SAM_STAGE_2_AERO
       pre_ignition_coast_time 1 sec
       total_mass              1100 lbs
       empty_mass              282 lbs
       #fuel_mass              418 lbs
       specific_impulse       260 sec
       thrust_duration        25 sec
       pre_separation_coast_time  30 sec
   end_stage
   stage 3 # MK-136 Solid Rocket
       aero                  BLUE_NAVAL_SAM_STAGE_3_AERO
       total_mass            220 lbs
       empty_mass            187 lbs
      # fuel_mass             125 lbs
       specific_impulse      260 sec
       thrust_duration        15 sec
       pre_separation_coast_time  1 sec
   end_stage
   stage 4 # warhead and seeker (aka kill vehicle )
       aero                  BLUE_NAVAL_SAM_STAGE_4_AERO
       total_mass           70 lbs
       fuel_mass              0 lbs
   end_stage
end_mover
```

- **演示要点**：演示 WSF_GUIDED_MOVER 的参数：integration_timestep, update_interval, divert_thrust, divert_fuel_mass, divert_fuel_flow_rate, divert_altitude_limits, stage

### mover · WSF_STRAIGHT_LINE_MOVER｜运动模型

- **关键词**：mover, WSF_STRAIGHT_LINE_MOVER, average_speed, update_interval, update_time_tolerance, maximum_lateral_acceleration, guidance_mode, guide_to_truth, 运动模型
- **出处**：`base_types/weapons/aam/medium_range_radar_missile.txt:125-132`　（同签名共 7 处，另见 `base_types/weapons/aam/medium_range_uplink_missile.txt:73`、`behavior_tree/weapons/aam/medium_range_radar_missile.txt:123`、`brawler/weapons/aam/medium_range_radar_missile.txt:125`）
- **片段**：

```text
   mover WSF_STRAIGHT_LINE_MOVER
      average_speed           3221.5 kts     # mach 5
      update_interval         0.006  sec
      update_time_tolerance   0.0006 sec     # this mover travels 1 meter in 0.00060339 seconds
      maximum_lateral_acceleration  15.0 g   # average turner
      guidance_mode           lead_pursuit   # or pure_pursuit
      guide_to_truth          false          # guide to perception
   end_mover
```

- **演示要点**：演示 WSF_STRAIGHT_LINE_MOVER 的参数：average_speed, update_interval, update_time_tolerance, maximum_lateral_acceleration, guidance_mode, guide_to_truth

### mover · WSF_GUIDED_MOVER｜运动模型

- **关键词**：mover, WSF_GUIDED_MOVER, total_mass, fuel_mass, thrust, thrust_duration, update_interval, aero, 运动模型
- **出处**：`shooter/weapons/aam/aa_mrm.txt:123-130`　（同签名共 4 处，另见 `electronic_warfare/track_error.txt:281`、`launcher/weapons/sam/sam_missile.txt:25`、`ship_ad/weapons/sam/red_sr_sam_1.txt:37`）
- **片段**：

```text
   mover WSF_GUIDED_MOVER
      total_mass       175 kg  # all of the sources say this
      fuel_mass        80 kg # guess - 30 kg warhead, sensor weight, and body weight
      thrust           6500 lbf # to make it go 1300 mps as stated above
      thrust_duration  95 sec # sources say several seconds
      update_interval  0.05 sec
      aero             AA_MRM_AERO
   end_mover
```

- **演示要点**：演示 WSF_GUIDED_MOVER 的参数：total_mass, fuel_mass, thrust, thrust_duration, update_interval, aero

### mover（conjunction_ssn）｜运动模型

- **关键词**：mover, eccentricity, inclination, raan, semi_major_axis, true_anomaly, argument_of_periapsis, 运动模型
- **出处**：`space_operations/conjunction_ssn.txt:19-26`
- **片段**：

```text
   mover
      eccentricity 0.001
      inclination 40.0 deg
      raan 350.0 deg
      semi_major_axis 7410 km
      true_anomaly 0 deg
      argument_of_periapsis 0.0 deg
   end_mover
```

- **演示要点**：演示 mover 的参数：eccentricity, inclination, raan, semi_major_axis, true_anomaly, argument_of_periapsis

### mover · WSF_AIR_MOVER｜运动模型

- **关键词**：mover, WSF_AIR_MOVER, default_climb_rate, default_dive_rate, maximum_linear_acceleration, minimum_altitude, maximum_altitude, maximum_speed, 运动模型
- **出处**：`suppressor/platforms/bomber.txt:36-43`
- **片段**：

```text
  mover WSF_AIR_MOVER
    default_climb_rate           50 m/s
    default_dive_rate            30 m/s
    maximum_linear_acceleration  20 m/s2
    minimum_altitude             0 m
    maximum_altitude             15 km
    maximum_speed                500 m/s
  end_mover
```

- **演示要点**：演示 WSF_AIR_MOVER 的参数：default_climb_rate, default_dive_rate, maximum_linear_acceleration, minimum_altitude, maximum_altitude, maximum_speed

### mover · WSF_GUIDED_MOVER｜运动模型

- **关键词**：mover, WSF_GUIDED_MOVER, stage, total_mass, fuel_mass, thrust_duration, thrust, aero, 运动模型
- **出处**：`ship_ad/weapons/ssm/ssm_missile.txt:30-38`
- **片段**：

```text
   mover WSF_GUIDED_MOVER
      stage 1
      total_mass 1400.0 lbm
      fuel_mass 900.0 lbm
      thrust_duration 18.3 sec
      thrust 12500 lbf
      aero SSM_MISSILE_AERO
      end_stage
    end_mover
```

- **演示要点**：演示 WSF_GUIDED_MOVER 的参数：stage, total_mass, fuel_mass, thrust_duration, thrust, aero

### mover · WSF_POINT_MASS_SIX_DOF_MOVER｜运动模型

- **关键词**：mover, WSF_POINT_MASS_SIX_DOF_MOVER, vehicle_type, update_interval, event_core_data, event_engine_fuel_data, event_kinematic_data, event_force_moment_data, 运动模型
- **出处**：`six_dof/platforms/orbiter-main.txt:24-32`
- **片段**：

```text
   mover WSF_POINT_MASS_SIX_DOF_MOVER
      vehicle_type      ORBITER-MAIN_PM6
      update_interval   0.05 sec
      
      event_core_data 10 Hz
      event_engine_fuel_data 10 Hz
      event_kinematic_data 10 Hz
      event_force_moment_data 10 Hz
   end_mover
```

- **演示要点**：演示 WSF_POINT_MASS_SIX_DOF_MOVER 的参数：vehicle_type, update_interval, event_core_data, event_engine_fuel_data, event_kinematic_data, event_force_moment_data

### mover · WSF_GUIDED_MOVER｜运动模型

- **关键词**：mover, WSF_GUIDED_MOVER, integration_timestep, update_interval, coordinate_frame, check_for_ground_impact, ejectable, stage, 运动模型
- **出处**：`space_operations/launch_vehicles/delta_iv_m/delta_iv_m_base.txt:45-102`　（同签名共 7 处，另见 `space_operations/launch_vehicles/atlas_v_401/atlas_v_401_base.txt:39`、`space_operations/launch_vehicles/proton_m/proton-m.txt:44`、`space_operations/launch_vehicles/falcon_9/falcon_9_base.txt:46`）
- **片段**：

```text
   mover WSF_GUIDED_MOVER
      #show_status
      integration_timestep 0.01 sec
      update_interval      0.01 sec
      coordinate_frame     eci
      check_for_ground_impact          # Don't require a fuse on the platform

      # Payload fairing (PF): ~2800 kg
      ejectable payload_fairing
         mass   2800 kg
         time   275 sec
      end_ejectable

      stage 1
         aero DELTA_IV_M_STAGE_1_AERO
         total_mass                    226400 kg           # Wiki
         sea_level_thrust              3137000 nt          # UG
         #vacuum_thrust                 3560000 nt
         sea_level_specific_impulse    362.95794943820224719101123595506 s
         #vacuum_specific_impulse       411.9 s             # UG
         nozzle_exit_area              4.1744794236652521464521859271687 m2
         thrust_duration               245 sec
         thrust_vectoring_angle_limit  5 deg
         lateral_thrust_gain           5.0
         pre_separation_coast_time     6 sec               # UG
      end_stage

      # RL10B-2, 4-meter tanks
      stage 2
         aero DELTA_IV_M_STAGE_2_AERO
         total_mass                    24170 kg            # Wiki
         fuel_mass                     20410 kg            # UG
         thrust                        110000 nt           # UG
         # Calculated automatically from fuel_mass and thrust_duration.
         #specific_impulse              465 sec             # UG
         thrust_duration               850 sec             # UG says 'approximately'
         thrust_vectoring_angle_limit  5 deg
         lateral_thrust_gain           10.0                # Need a bigger value for small engine
         pre_ignition_coast_time       14 sec              # UG
      end_stage

      # The next-to-last stage contains ONLY the mass of the 'consumable' hardware
      #  associated with attachment and deployment of the payload.
      #
      # Payload attach fitting (PAF): 240 kg

      stage 3
         aero none
         total_mass                    240 kg              # TODO_TEMP no PAF
      end_stage

      # The last stage represents the final delivered payload (i.e.: the satellite).
      # It should include nothing extra.
      stage 4
         aero none
         total_mass                    9180 kg             # UG, max to LEO (9420 kg-PAF)
      end_stage
   end_mover
```

- **演示要点**：演示 WSF_GUIDED_MOVER 的参数：integration_timestep, update_interval, coordinate_frame, check_for_ground_impact, ejectable, stage

### mover · WSF_AIR_MOVER｜运动模型

- **关键词**：mover, WSF_AIR_MOVER, maximum_speed, minimum_speed, maximum_altitude, minimum_altitude, at_end_of_path, 运动模型
- **出处**：`example_scripts/proc_mover_demo.txt:26-32`
- **片段**：

```text
   mover WSF_AIR_MOVER
      maximum_speed     0.000000001 knots
      minimum_speed     0 knots
      maximum_altitude  50000 ft
      minimum_altitude  0 ft
      at_end_of_path    stop
  end_mover
```

- **演示要点**：演示 WSF_AIR_MOVER 的参数：maximum_speed, minimum_speed, maximum_altitude, minimum_altitude, at_end_of_path

### mover · WSF_SURFACE_MOVER｜运动模型

- **关键词**：mover, WSF_SURFACE_MOVER, maximum_speed, minimum_speed, maximum_linear_acceleration, maximum_radial_acceleration, update_interval, 运动模型
- **出处**：`logistics/platforms/fueling_truck.txt:50-56`　（同签名共 4 处，另见 `logistics/platforms/mechanic.txt:42`、`logistics/platforms/ocean_going_tanker.txt:63`、`logistics/platforms/semi_tanker_truck.txt:54`）
- **片段**：

```text
   mover WSF_SURFACE_MOVER
      maximum_speed 25 mph
      minimum_speed 10 mph
      maximum_linear_acceleration 0.5 g
      maximum_radial_acceleration 0.5 g
      update_interval 5 sec
   end_mover
```

- **演示要点**：演示 WSF_SURFACE_MOVER 的参数：maximum_speed, minimum_speed, maximum_linear_acceleration, maximum_radial_acceleration, update_interval

### mover · WSF_AIR_MOVER｜运动模型

- **关键词**：mover, WSF_AIR_MOVER, maximum_speed, minimum_speed, maximum_linear_acceleration, maximum_radial_acceleration, update_interval, 运动模型
- **出处**：`logistics/platforms/strike_platform.txt:68-74`
- **片段**：

```text
   mover WSF_AIR_MOVER
      maximum_speed 200 kts
      minimum_speed  80 kts
      maximum_linear_acceleration 0.5 g
      maximum_radial_acceleration 0.5 g
      update_interval 5 sec
   end_mover
```

- **演示要点**：演示 WSF_AIR_MOVER 的参数：maximum_speed, minimum_speed, maximum_linear_acceleration, maximum_radial_acceleration, update_interval

### mover · WSF_STRAIGHT_LINE_MOVER｜运动模型

- **关键词**：mover, WSF_STRAIGHT_LINE_MOVER, average_speed, update_interval, maximum_lateral_acceleration, guidance_mode, guide_to_truth, 运动模型
- **出处**：`base_types/weapons/aam/medium_range_missile.txt:41-48`　（同签名共 4 处，另见 `iads_c2_demos/weapons/aa_missile.txt:43`、`route_finder_demos/weapons/aam/medium_range_missile.txt:41`、`brawler/weapons/aam/medium_range_missile.txt:45`）
- **片段**：

```text
   mover WSF_STRAIGHT_LINE_MOVER
      average_speed           3221.5 kts     # mach 5
      update_interval         0.006  sec
    ##update_time_tolerance   0.0006 sec     # this mover travels 1 meter in 0.00060339 seconds
      maximum_lateral_acceleration  15.0 g   # average turner
      guidance_mode           pure_pursuit   # or lead_pursuit
      guide_to_truth          false          # guide to perception
   end_mover
```

- **演示要点**：演示 WSF_STRAIGHT_LINE_MOVER 的参数：average_speed, update_interval, maximum_lateral_acceleration, guidance_mode, guide_to_truth

### mover · WSF_TSPI_MOVER｜运动模型

- **关键词**：mover, WSF_TSPI_MOVER, heading, pitch, roll, altitude, speed, 运动模型
- **出处**：`satellite_demos/shuttle-tspi-demo.txt:21-28`
- **片段**：

```text
   mover WSF_TSPI_MOVER
      heading in degrees
      pitch in degrees
      roll in degrees
      altitude in feet
      speed in ft/s
      //extrapolation disabled
   end_mover
```

- **演示要点**：演示 WSF_TSPI_MOVER 的参数：heading, pitch, roll, altitude, speed

### mover · WSF_GUIDED_MOVER｜运动模型

- **关键词**：mover, WSF_GUIDED_MOVER, initial_mass, fuel_mass, specific_impulse, thrust, aero, 运动模型
- **出处**：`suppressor/weapons/sam/missile.txt:93-100`
- **片段**：

```text
  mover WSF_GUIDED_MOVER
    //show_status
    initial_mass        500 kg
    fuel_mass           200 kg
    specific_impulse    300 sec
    thrust            44000 nt
    aero          MISSILE_AERO
  end_mover
```

- **演示要点**：演示 WSF_GUIDED_MOVER 的参数：initial_mass, fuel_mass, specific_impulse, thrust, aero

### mover · WSF_GUIDED_MOVER｜运动模型

- **关键词**：mover, WSF_GUIDED_MOVER, integration_timestep, update_interval, coordinate_frame, check_for_ground_impact, stage, 运动模型
- **出处**：`space_operations/launch_vehicles/launcher_one/launcher_one_base.txt:95-155`
- **片段**：

```text
    mover WSF_GUIDED_MOVER

       # ejectables are the interstage between stages and payload shroud.

       integration_timestep 0.01 sec
       update_interval      0.01 sec
       coordinate_frame     eci
       check_for_ground_impact          # Don't require a fuse on the platform

       # Dummy stage for the fall after release
       stage 1
          aero LAUNCHER_ONE_AERO
          total_mass                0.0 kg
          pre_separation_coast_time 4.0 sec
       end_stage

       # NewtonThree engine
       # diameter 1.8 m / 72 in
       stage 2
          aero LAUNCHER_ONE_AERO

          empty_mass               2000 kg
          fuel_mass                27500 kg    # 80% of volume is fuel

          vacuum_thrust            327000 nt
          vacuum_specific_impulse  311 sec
          nozzle_exit_area         1.88 m^2

          thrust_vectoring_angle_limit  10 deg
          lateral_thrust_gain      100.0
       end_stage

       # Interstage
       stage 3
          aero none
          total_mass               500 kg
          pre_separation_coast_time 2.0 sec
       end_stage

       # NewtonFour engine
       # diameter 1.5 m/ 59 in
       stage 4
          aero none

          empty_mass               750 kg
          fuel_mass                6000 kg   # 80% of the volume is fuel

          # Use unreferenced thrust and specific_impulse commands when both aren't given
          thrust                   22000 nt
          specific_impulse         311 sec

          thrust_vectoring_angle_limit  10 deg
          lateral_thrust_gain      100.0
       end_stage

       stage 5
          aero none
          total_mass 300 kg
       end_stage

    end_mover
```

- **演示要点**：演示 WSF_GUIDED_MOVER 的参数：integration_timestep, update_interval, coordinate_frame, check_for_ground_impact, stage

### mover · WSF_NEW_UNGUIDED_MOVER｜运动模型

- **关键词**：mover, WSF_NEW_UNGUIDED_MOVER, update_interval, show_status, aero, total_mass, 运动模型
- **出处**：`base_types/weapons/ssm/red_mrbm_3.txt:411-416`　（同签名共 2 处，另见 `base_types/weapons/ssm/red_mrbm_3.txt:429`）
- **片段**：

```text
  mover WSF_NEW_UNGUIDED_MOVER
     update_interval 0.5 sec
     show_status
     aero RED_MRBM_3_STAGE_EMPTY_AERO
     total_mass            2500  kg
  end_mover
```

- **演示要点**：演示 WSF_NEW_UNGUIDED_MOVER 的参数：update_interval, show_status, aero, total_mass

### mover（sat_con_1_autogen）｜运动模型

- **关键词**：mover, inclination, revs_per_day, raan, true_anomaly, 运动模型
- **出处**：`coverage_demos/scenarios/sat_con_1_autogen.txt:28-33`　（同签名共 432 处，另见 `coverage_demos/scenarios/sat_con_1_autogen.txt:37`、`coverage_demos/scenarios/sat_con_1_autogen.txt:46`、`coverage_demos/scenarios/sat_con_1_autogen.txt:55`）
- **片段**：

```text
   mover
      inclination 85 degrees
      revs_per_day 15
      raan 0 degrees
      true_anomaly 0 degrees
   end_mover
```

- **演示要点**：演示 mover 的参数：inclination, revs_per_day, raan, true_anomaly

### mover · WSF_AIR_MOVER｜运动模型

- **关键词**：mover, WSF_AIR_MOVER, debug, print_route, maximum_radial_acceleration, maximum_linear_acceleration, 运动模型
- **出处**：`engage/flight_path.txt:127-132`　（同签名共 2 处，另见 `engage/flight_route.txt:126`）
- **片段**：

```text
   mover WSF_AIR_MOVER
      debug
      print_route true
      maximum_radial_acceleration 150 g
      maximum_linear_acceleration 150 g
   end_mover
```

- **演示要点**：演示 WSF_AIR_MOVER 的参数：debug, print_route, maximum_radial_acceleration, maximum_linear_acceleration

### mover（kinematic_mover_demo）｜运动模型

- **关键词**：mover, maximum_linear_acceleration, maximum_radial_acceleration, turn_rate_limit, update_interval, 运动模型
- **出处**：`kinematic_mover/kinematic_mover_demo.txt:197-202`
- **片段**：

```text
   mover
      maximum_linear_acceleration  1.4 g
      maximum_radial_acceleration 2.2 g
      turn_rate_limit           50 deg/sec
      update_interval 0.1 sec
   end_mover
```

- **演示要点**：演示 mover 的参数：maximum_linear_acceleration, maximum_radial_acceleration, turn_rate_limit, update_interval

### mover · WSF_AIR_MOVER｜运动模型

- **关键词**：mover, WSF_AIR_MOVER, maximum_speed, maximum_altitude, minimum_altitude, maximum_turn_rate, 运动模型
- **出处**：`wargame/platforms/bomber.txt:39-44`　（同签名共 3 处，另见 `wargame/platforms/fighter.txt:39`、`wargame/platforms/sensor_drone.txt:22`）
- **片段**：

```text
   mover WSF_AIR_MOVER 
      maximum_speed 700 mph
      maximum_altitude 50000 ft
      minimum_altitude 1000 ft
      maximum_turn_rate 180 deg/min
   end_mover
```

- **演示要点**：演示 WSF_AIR_MOVER 的参数：maximum_speed, maximum_altitude, minimum_altitude, maximum_turn_rate

### mover · WSF_GROUND_MOVER｜运动模型

- **关键词**：mover, WSF_GROUND_MOVER, on_ground, restorable, automatic_recovery_time, route, 运动模型
- **出处**：`hellfire/laser_designation_via_dis/target_type.txt:30-39`
- **片段**：

```text
   mover WSF_GROUND_MOVER
      on_ground
      restorable
      automatic_recovery_time 25.0 sec
      route
         position 39:09:29.8n 106:51:10.9w speed 30 km/hr
         position 39:10:35.0n 106:50:44.8w
         stop
      end_route
   end_mover
```

- **演示要点**：演示 WSF_GROUND_MOVER 的参数：on_ground, restorable, automatic_recovery_time, route

### mover · WSF_GUIDED_MOVER｜运动模型

- **关键词**：mover, WSF_GUIDED_MOVER, update_interval, integration_timestep, stage, route, 运动模型
- **出处**：`new_guidance/weapons/agm/blue_asm_missile.txt:40-63`
- **片段**：

```text
   mover WSF_GUIDED_MOVER
      #debug
      #show_status

      update_interval        0.5 s
      integration_timestep   0.05 s

      stage 1
         # Warhead 487 lb (221 kg)
         initial_mass        519 kg              # 1144 lb
         fuel_mass           200 kg              # Guess
         thrust              2900 Nt
         #specific_impulse    300 sec             # Guess
         thrust_duration      1000 sec
         aero                BLUE_ASM_MISSILE_AERO
         thrust_delay        1.0 sec
      end_stage

      # pre-briefed route (normally provided by a task manager)
      route
        position 39.0n 89.5w
        position 38.8n 89.5w
      end_route
   end_mover
```

- **演示要点**：演示 WSF_GUIDED_MOVER 的参数：update_interval, integration_timestep, stage, route

### mover · WSF_GUIDED_MOVER｜运动模型

- **关键词**：mover, WSF_GUIDED_MOVER, aero, total_mass, update_interval, 运动模型
- **出处**：`alternate_locations/weapons/agm/blue_glide_bomb_1.txt:30-34`　（同签名共 3 处，另见 `alternate_locations/weapons/agm/blue_gps_bomb_1.txt:47`、`cyber/GoneFishing_ConstraintDemo.txt:38`）
- **片段**：

```text
   mover WSF_GUIDED_MOVER 
      aero BLUE_GLIDE_BOMB_1_AERO
      total_mass 250 lbm
      update_interval .5 s
   end_mover
```

- **演示要点**：演示 WSF_GUIDED_MOVER 的参数：aero, total_mass, update_interval

### mover · WSF_STRAIGHT_LINE_MOVER｜运动模型

- **关键词**：mover, WSF_STRAIGHT_LINE_MOVER, average_speed, maximum_lateral_acceleration, guidance_mode, 运动模型
- **出处**：`alternate_locations/weapons/sam/large_sam.txt:29-33`　（同签名共 9 处，另见 `base_types/weapons/aam/red_mr_a2a_rf_missile.txt:37`、`base_types/weapons/aam/simple_long_range_missile.txt:37`、`base_types/weapons/aam/simple_short_range_missile.txt:37`）
- **片段**：

```text
  mover WSF_STRAIGHT_LINE_MOVER
     average_speed                 2643.0 kts  # mach 4
     maximum_lateral_acceleration  20.0 g
     guidance_mode                 lead_pursuit
  end_mover
```

- **演示要点**：演示 WSF_STRAIGHT_LINE_MOVER 的参数：average_speed, maximum_lateral_acceleration, guidance_mode

### mover · WSF_AIR_MOVER｜运动模型

- **关键词**：mover, WSF_AIR_MOVER, maximum_radial_acceleration, maximum_linear_acceleration, maximum_climb_rate, 运动模型
- **出处**：`bearing_only/platforms/commander_platform.txt:23-27`
- **片段**：

```text
   mover WSF_AIR_MOVER
     maximum_radial_acceleration 1.1 g  # make smooth transitions
     maximum_linear_acceleration 1.5 g
     maximum_climb_rate           10 ft/sec
   end_mover
```

- **演示要点**：演示 WSF_AIR_MOVER 的参数：maximum_radial_acceleration, maximum_linear_acceleration, maximum_climb_rate

### mover · WSF_GUIDED_MOVER｜运动模型

- **关键词**：mover, WSF_GUIDED_MOVER, aero, mass, update_interval, 运动模型
- **出处**：`cyber/weapons/agm/blue_gps_bomb_1.txt:31-35`　（同签名共 19 处，另见 `draw/weapons/agm/bomb_1000_lb.txt:39`、`iads/weapons/agm/blue_gps_bomb_1.txt:46`、`iads_c2_demos/weapons/agm/blue_gps_bomb_1.txt:51`）
- **片段**：

```text
   mover WSF_GUIDED_MOVER 
      aero BLUE_GPS_BOMB_1_AERO
      mass 500 lbs
      update_interval 0.5 s
   end_mover
```

- **演示要点**：演示 WSF_GUIDED_MOVER 的参数：aero, mass, update_interval

### mover · WSF_AIR_MOVER｜运动模型

- **关键词**：mover, WSF_AIR_MOVER, maximum_radial_acceleration, maximum_linear_acceleration, roll_rate_limit, 运动模型
- **出处**：`draw/draw_demo.txt:17-21`
- **片段**：

```text
   mover WSF_AIR_MOVER
     maximum_radial_acceleration 1.5 g # Makes for a smooth turn
     maximum_linear_acceleration 1.3 g
     roll_rate_limit 1 deg/s # smooth turn
   end_mover
```

- **演示要点**：演示 WSF_AIR_MOVER 的参数：maximum_radial_acceleration, maximum_linear_acceleration, roll_rate_limit

### mover · WSF_AIR_MOVER｜运动模型

- **关键词**：mover, WSF_AIR_MOVER, default_linear_acceleration, default_radial_acceleration, default_climb_rate, 运动模型
- **出处**：`electronic_warfare/comm_jamming.txt:129-133`　（同签名共 6 处，另见 `electronic_warfare/comm_jamming.txt:157`、`hel/intersect_mesh_test.txt:28`、`hel/intersect_mesh_test_beam_director.txt:33`）
- **片段**：

```text
   mover WSF_AIR_MOVER
      default_linear_acceleration 1.0 g
      default_radial_acceleration 1.0 g
      default_climb_rate 200 fps
   end_mover
```

- **演示要点**：演示 WSF_AIR_MOVER 的参数：default_linear_acceleration, default_radial_acceleration, default_climb_rate

### mover · WSF_AIR_MOVER｜运动模型

- **关键词**：mover, WSF_AIR_MOVER, maximum_speed, maximum_altitude, maximum_climb_rate, 运动模型
- **出处**：`new_guidance/platforms/red_naval_helicopter.txt:65-69`　（同签名共 2 处，另见 `ship_ad/platforms/red_naval_helicopter.txt:65`）
- **片段**：

```text
  mover WSF_AIR_MOVER
    maximum_speed         159 kts
    maximum_altitude      14100 ft
    maximum_climb_rate    1614 ft/m
  end_mover
```

- **演示要点**：演示 WSF_AIR_MOVER 的参数：maximum_speed, maximum_altitude, maximum_climb_rate

### mover · WSF_UNGUIDED_MOVER｜运动模型

- **关键词**：mover, WSF_UNGUIDED_MOVER, aero, mass, update_interval, 运动模型
- **出处**：`suppressor/weapons/agm/blue_gps_bomb_3.txt:139-143`　（同签名共 3 处，另见 `suppressor/weapons/agm/blue_gps_bomb_3.txt:165`、`suppressor/weapons/agm/blue_gps_bomb_3.txt:205`）
- **片段**：

```text
  mover WSF_UNGUIDED_MOVER
    aero BLUE_GPS_BOMB_3_500_LB_AERO
    mass 500.0 lbm
    update_interval 0.5 s
  end_mover
```

- **演示要点**：演示 WSF_UNGUIDED_MOVER 的参数：aero, mass, update_interval

### mover · WSF_UNGUIDED_MOVER｜运动模型

- **关键词**：mover, WSF_UNGUIDED_MOVER, update_interval, total_mass, aero, 运动模型
- **出处**：`ciws/weapons/guns/30mm_bullet.txt:27-32`　（同签名共 2 处，另见 `gun_engagement/weapons/guns/BULLET.txt:21`）
- **片段**：

```text
   mover WSF_UNGUIDED_MOVER
      #show status
      update_interval   0.001 sec
      total_mass        0.671 kg
      aero              30MM_BULLET_AERO
   end_mover
```

- **演示要点**：演示 WSF_UNGUIDED_MOVER 的参数：update_interval, total_mass, aero

### mover · WSF_AIR_MOVER｜运动模型

- **关键词**：mover, WSF_AIR_MOVER, default_dive_rate, default_radial_acceleration, maximum_speed, 运动模型
- **出处**：`ship_ad/weapons/agm/red_asm_msl.txt:31-36`
- **片段**：

```text
  mover WSF_AIR_MOVER
    #show_status
    default_dive_rate            27 m/s   # assume 5 degree dive
    default_radial_acceleration  2.0 g    # assume 2 g
    maximum_speed                306 m/s  # Ref 2 M0.9 @ sea level
  end_mover
```

- **演示要点**：演示 WSF_AIR_MOVER 的参数：default_dive_rate, default_radial_acceleration, maximum_speed

### mover · WSF_GUIDED_MOVER｜运动模型

- **关键词**：mover, WSF_GUIDED_MOVER, integration_timestep, update_interval, stage, 运动模型
- **出处**：`base_types/weapons/ssm/red_srbm_1.txt:67-79`　（同签名共 22 处，另见 `base_types/weapons/ssm/red_srbm_2.txt:68`、`base_types/weapons/ssm/red_mrbm_2.txt:122`、`cyber/weapons/sam/sr_sam.txt:53`）
- **片段**：

```text
mover RED_SRBM_1_MOVER WSF_GUIDED_MOVER
   integration_timestep      0.005 secs
   update_interval           0.05 secs

   stage 1
      aero                   RED_SRBM_1_AERO
      empty_mass             4500.0 lbs          # Brian's data
      fuel_mass              9450.0 lbs          # Brian's data
      thrust                 26000.0 lbf         # Brian's data
      specific_impulse       220.0 sec           # Brian's data
      thrust_duration        79.94 sec           # Brian's data (From BallisticTable)
   end_stage
end_mover
```

- **演示要点**：演示 WSF_GUIDED_MOVER 的参数：integration_timestep, update_interval, stage

### mover · WSF_P6DOF_MOVER｜运动模型

- **关键词**：mover, WSF_P6DOF_MOVER, p6dof_object_type, event_core_data, event_kinematic_data, 运动模型
- **出处**：`p6dof/aam_launch_test.txt:73-86`
- **片段**：

```text
   mover WSF_P6DOF_MOVER
      p6dof_object_type $<MOVER_TYPE:AAM-MR>$
      
      # Include P6DOF event pipe data
      event_core_data               30 Hz
      event_kinematic_data          30 Hz
      # event_engine_fuel_data       1 Hz
      # event_autopilot_data         1 Hz
      # event_autopilot_limits_data  1 Hz
      # event_control_inputs_data    1 Hz
      # event_control_surfaces_data  1 Hz
      # event_force_moment_data      1 Hz
      
   end_mover
```

- **演示要点**：演示 WSF_P6DOF_MOVER 的参数：p6dof_object_type, event_core_data, event_kinematic_data

### mover · WSF_TBM_MOVER｜运动模型

- **关键词**：mover, WSF_TBM_MOVER, trajectory_type, show_status, stage, 运动模型
- **出处**：`tbm_demos/weapons/ssm/tbm2.txt:35-57`
- **片段**：

```text
   mover WSF_TBM_MOVER
      # This is same as the tbm mover in tbm1.txt except that it has been split into
      # two stages (the first stage is essentially massless except for fuel).

      #update_time_tolerance     0.005 sec
      trajectory_type           depressed
      show_status
      #debug
      stage 1
         total_mass             3000 kg
         fuel_mass              2999.99 kg
         ballistic_coefficient  208250.0 nt/m^2
         thrust                 150000 nt
         thrust_duration        50 sec
      end_stage
      stage 2
         total_mass             3400 kg
         fuel_mass              1800 kg
         ballistic_coefficient  98000.0 nt/m^2
         thrust                 150000 nt
         thrust_duration        30 sec
      end_stage
   end_mover
```

- **演示要点**：演示 WSF_TBM_MOVER 的参数：trajectory_type, show_status, stage

### mover · WSF_GUIDED_MOVER｜运动模型

- **关键词**：mover, WSF_GUIDED_MOVER, show_status, update_interval, stage, 运动模型
- **出处**：`base_types/weapons/ssm/red_mrbm_3.txt:209-233`
- **片段**：

```text
mover RED_MRBM_3_MOVER WSF_GUIDED_MOVER
   show_status
   update_interval           0.05 secs
   stage 1
       aero                   RED_MRBM_3_STAGE_1_AERO
       total_mass             10000 kg
       fuel_mass               8000 kg
       specific_impulse       240 sec # The platform script will vary this.
       thrust_duration        52 sec
   end_stage
   stage 2
       aero                   RED_MRBM_3_STAGE_2_AERO
       pre_ignition_coast_time 3 sec
       total_mass             4000 kg
       fuel_mass              3350 kg
       specific_impulse       240 sec  # adjusted for max range of 2000 km
       thrust_duration        46 sec
       pre_separation_coast_time  10 sec
   end_stage
   stage 3  # warhead
       aero                  RED_MRBM_3_STAGE_3_AERO
       total_mass            400 kg
       fuel_mass               0 kg
   end_stage
end_mover
```

- **演示要点**：演示 WSF_GUIDED_MOVER 的参数：show_status, update_interval, stage

### mover · WSF_AIR_MOVER｜运动模型

- **关键词**：mover, WSF_AIR_MOVER, default_radial_acceleration, at_end_of_path, 运动模型
- **出处**：`aea_iads/platforms/soj.txt:410-413`　（同签名共 7 处，另见 `electronic_warfare/test_false_targets/platforms/soj.txt:227`、`electronic_warfare/test_multi_beam/platforms/soj.txt:220`、`electronic_warfare/test_multi_beam/platforms/ucav.txt:78`）
- **片段**：

```text
  mover WSF_AIR_MOVER
    default_radial_acceleration 2.0 g
    at_end_of_path remove
  end_mover
```

- **演示要点**：演示 WSF_AIR_MOVER 的参数：default_radial_acceleration, at_end_of_path

### mover · WSF_BRAWLER_MOVER｜运动模型

- **关键词**：mover, WSF_BRAWLER_MOVER, aero_file, update_time_tolerance, 运动模型
- **出处**：`air_to_air/platforms/dca.txt:38-41`　（同签名共 5 处，另见 `air_to_air/platforms/escort.txt:39`、`air_to_air/platforms/hvaa.txt:42`、`air_to_air/platforms/lte_fighter.txt:42`）
- **片段**：

```text
   mover WSF_BRAWLER_MOVER
      aero_file platforms/fxw/lte_fighter.fxw
      update_time_tolerance 0.01 s
   end_mover
```

- **演示要点**：演示 WSF_BRAWLER_MOVER 的参数：aero_file, update_time_tolerance

### mover · WSF_POINT_MASS_SIX_DOF_MOVER｜运动模型

- **关键词**：mover, WSF_POINT_MASS_SIX_DOF_MOVER, vehicle_type, update_interval, 运动模型
- **出处**：`air_to_air/platforms/lte_fighter.txt:266-269`　（同签名共 15 处，另见 `six_dof/platforms/aam-sr.txt:71`、`six_dof/platforms/c-hvy.txt:43`、`six_dof/platforms/fa-hvy.txt:43`）
- **片段**：

```text
   mover WSF_POINT_MASS_SIX_DOF_MOVER
       vehicle_type LTE_FIGHTER_PM6
       update_interval 0.05 sec
   end_mover
```

- **演示要点**：演示 WSF_POINT_MASS_SIX_DOF_MOVER 的参数：vehicle_type, update_interval

### mover · WSF_AIR_MOVER｜运动模型

- **关键词**：mover, WSF_AIR_MOVER, maximum_radial_acceleration, at_end_of_path, 运动模型
- **出处**：`alternate_locations/platforms/ucav.txt:20-23`
- **片段**：

```text
   mover WSF_AIR_MOVER 
      maximum_radial_acceleration 1.5 g
      at_end_of_path remove
   end_mover
```

- **演示要点**：演示 WSF_AIR_MOVER 的参数：maximum_radial_acceleration, at_end_of_path

### mover · WSF_AIR_MOVER｜运动模型

- **关键词**：mover, WSF_AIR_MOVER, maximum_radial_acceleration, maximum_linear_acceleration, 运动模型
- **出处**：`alv_routing/platforms/awacs.txt:17-20`　（同签名共 10 处，另见 `alv_routing/platforms/fighter_bomber.txt:16`、`satellite_demos/scenarios/gps_denied.txt:437`、`satellite_demos/scenarios/gps_denied.txt:474`）
- **片段**：

```text
   mover WSF_AIR_MOVER
     maximum_radial_acceleration .5 g
     maximum_linear_acceleration .5 g
   end_mover
```

- **演示要点**：演示 WSF_AIR_MOVER 的参数：maximum_radial_acceleration, maximum_linear_acceleration

### mover · WSF_AIR_MOVER｜运动模型

- **关键词**：mover, WSF_AIR_MOVER, default_linear_acceleration, default_radial_acceleration, 运动模型
- **出处**：`base_types/platforms/awacs.txt:27-30`　（同签名共 2 处，另见 `shooter/platforms/awacs.txt:27`）
- **片段**：

```text
   mover WSF_AIR_MOVER
      default_linear_acceleration   1.0 g
      default_radial_acceleration   1.0 g
   end_mover
```

- **演示要点**：演示 WSF_AIR_MOVER 的参数：default_linear_acceleration, default_radial_acceleration

### mover · WSF_AIR_MOVER｜运动模型

- **关键词**：mover, WSF_AIR_MOVER, maximum_climb_rate, maximum_impact_speed, 运动模型
- **出处**：`cyber/platforms/uav.txt:34-37`
- **片段**：

```text
   mover WSF_AIR_MOVER 
      maximum_climb_rate 900.8 m/s
      maximum_impact_speed 0 mph
   end_mover
```

- **演示要点**：演示 WSF_AIR_MOVER 的参数：maximum_climb_rate, maximum_impact_speed

### mover · WSF_P6DOF_MOVER｜运动模型

- **关键词**：mover, WSF_P6DOF_MOVER, p6dof_object_type, update_interval, 运动模型
- **出处**：`p6dof/platforms/a-lgt-bombs.txt:27-30`　（同签名共 17 处，另见 `p6dof/platforms/a-lgt.txt:20`、`p6dof/platforms/aam-sr-tvc.txt:30`、`p6dof/platforms/agm-sr.txt:38`）
- **片段**：

```text
   mover WSF_P6DOF_MOVER
      p6dof_object_type A-LGT-BOMBS
      update_interval   0.01 sec
   end_mover
```

- **演示要点**：演示 WSF_P6DOF_MOVER 的参数：p6dof_object_type, update_interval

### mover · WSF_SPACE_MOVER｜运动模型

- **关键词**：mover, WSF_SPACE_MOVER, revs_per_day, inclination, 运动模型
- **出处**：`satellite_demos/4th_constellation_demo.txt:50-53`　（同签名共 5 处，另见 `satellite_demos/platforms/glonass.txt:26`、`satellite_demos/platforms/iridium.txt:22`、`space_operations/platforms/iridium_satellite.txt:14`）
- **片段**：

```text
   mover WSF_SPACE_MOVER
      revs_per_day 2.0
      inclination 55 deg
   end_mover
```

- **演示要点**：演示 WSF_SPACE_MOVER 的参数：revs_per_day, inclination

### mover · WSF_RIGID_BODY_SIX_DOF_MOVER｜运动模型

- **关键词**：mover, WSF_RIGID_BODY_SIX_DOF_MOVER, vehicle_type, update_interval, 运动模型
- **出处**：`six_dof/platforms/aam-sr-tvc.txt:24-27`　（同签名共 12 处，另见 `six_dof/platforms/c-hvy.txt:26`、`six_dof/platforms/fa-hvy.txt:26`、`six_dof/platforms/fa-lgt-bombs-ld.txt:20`）
- **片段**：

```text
   mover WSF_RIGID_BODY_SIX_DOF_MOVER
      vehicle_type     AAM-SR-TVC_RB6
      update_interval  0.001 sec
   end_mover
```

- **演示要点**：演示 WSF_RIGID_BODY_SIX_DOF_MOVER 的参数：vehicle_type, update_interval

### mover · WSF_SPACE_MOVER｜运动模型

- **关键词**：mover, WSF_SPACE_MOVER, semi_major_axis, inclination, 运动模型
- **出处**：`space_operations/platforms/starlink.txt:41-44`
- **片段**：

```text
   mover WSF_SPACE_MOVER
      semi_major_axis 7178 km
      inclination 72 deg
   end_mover
```

- **演示要点**：演示 WSF_SPACE_MOVER 的参数：semi_major_axis, inclination

### mover · WSF_AIR_MOVER｜运动模型

- **关键词**：mover, WSF_AIR_MOVER, body_g_limit, maximum_climb_rate, 运动模型
- **出处**：`terrain_following/terrain_demo.txt:48-51`
- **片段**：

```text
   mover WSF_AIR_MOVER
     body_g_limit 4 g
     maximum_climb_rate 200 ft/s
   end_mover
```

- **演示要点**：演示 WSF_AIR_MOVER 的参数：body_g_limit, maximum_climb_rate

### mover · WSF_GROUND_MOVER｜运动模型

- **关键词**：mover, WSF_GROUND_MOVER, on_road, default_linear_acceleration, 运动模型
- **出处**：`traffic_demos/platforms/car.txt:11-14`　（同签名共 3 处，另见 `traffic_demos/platforms/pickup_truck.txt:11`、`traffic_demos/platforms/school_bus.txt:11`）
- **片段**：

```text
   mover WSF_GROUND_MOVER
     on_road
     default_linear_acceleration 1.0 g
   end_mover
```

- **演示要点**：演示 WSF_GROUND_MOVER 的参数：on_road, default_linear_acceleration

### mover · WSF_AIR_MOVER｜运动模型

- **关键词**：mover, WSF_AIR_MOVER, maximum_speed, minimum_speed, 运动模型
- **出处**：`cyber/GoneFishing_ConstraintDemo.txt:98-102`
- **片段**：

```text
   mover WSF_AIR_MOVER  
      maximum_speed 50 m/s
      minimum_speed 25 m/s
        
   end_mover
```

- **演示要点**：演示 WSF_AIR_MOVER 的参数：maximum_speed, minimum_speed

### mover · WSF_GUIDED_MOVER｜运动模型

- **关键词**：mover, WSF_GUIDED_MOVER, integration_timestep, stage, 运动模型
- **出处**：`ballistic_missile_shootdown/weapons/ssm/red_mrbm_1.txt:117-123`　（同签名共 16 处，另见 `ballistic_missile_shootdown/weapons/ssm/red_mrbm_1.txt:157`、`base_types/weapons/sam/blue_lr_sam_common.txt:113`、`base_types/weapons/ssm/red_icbm_2.txt:77`）
- **片段**：

```text
   mover WSF_GUIDED_MOVER
      integration_timestep   0.01 secs
      stage 1
         aero                RED_MRBM_1_SPENT_STAGE_1_AERO
         total_mass          1618.0 kg
      end_stage
   end_mover
```

- **演示要点**：演示 WSF_GUIDED_MOVER 的参数：integration_timestep, stage

### mover · WSF_UNGUIDED_MOVER｜运动模型

- **关键词**：mover, WSF_UNGUIDED_MOVER, update_interval, stage, 运动模型
- **出处**：`base_types/weapons/other/gun.txt:26-33`　（同签名共 2 处，另见 `brawler/weapons/other/gun.txt:26`）
- **片段**：

```text
   mover WSF_UNGUIDED_MOVER
     # show status
      update_interval   0.01 sec
      stage 1
         total_mass       0.4 kg
         aero             BULLET_AERO
      end_stage
   end_mover
```

- **演示要点**：演示 WSF_UNGUIDED_MOVER 的参数：update_interval, stage

### mover（traveling_astronaut）｜运动模型

- **关键词**：mover, position, maneuvering, 运动模型
- **出处**：`space_operations/traveling_astronaut.txt:31-38`
- **片段**：

```text
   mover
      position 0n 90w altitude 1687.83 km heading 55 degrees

      # The TAP solution will resepct the maximum allowed delta V of the central platform.
      maneuvering simple
         delta_v 16 km/s
      end_maneuvering
   end_mover
```

- **演示要点**：演示 mover 的参数：position, maneuvering

### mover · WSF_AIR_MOVER｜运动模型

- **关键词**：mover, WSF_AIR_MOVER, route, at_end_of_path, 运动模型
- **出处**：`engage/grid_w_offsetroute.txt:126-134`
- **片段**：

```text
   mover WSF_AIR_MOVER
      route
        offset  5 0 km speed 262 kts altitude 30 kft msl
        radial_acceleration 2 g
        offset  0 2000 km speed 262 kts altitude 30 kft msl
        radial_acceleration 2 g
      end_route
      at_end_of_path remove
   end_mover
```

- **演示要点**：演示 WSF_AIR_MOVER 的参数：route, at_end_of_path

### mover（rocket）｜运动模型

- **关键词**：mover, check_for_ground_impact, stage, 运动模型
- **出处**：`signature_demos/platforms/rocket.txt:53-61`
- **片段**：

```text
   mover SSM_MOVER_BASE
      # Treat this as a simple launch vehicle and not a weapon (no 'weapon_effects' or fuse)
      check_for_ground_impact

      stage 1
         # Add some coast between stages so we can see the plume change
         pre_separation_coast_time 4.0 sec
      end_stage
   end_mover
```

- **演示要点**：演示 mover 的参数：check_for_ground_impact, stage

### mover · WSF_GROUND_MOVER｜运动模型

- **关键词**：mover, WSF_GROUND_MOVER, on_ground, route, 运动模型
- **出处**：`hellfire/active_radar_hellfire/target_type.txt:30-39`　（同签名共 2 处，另见 `hellfire/semiactive_laser_hellfire/target_type.txt:30`）
- **片段**：

```text
   mover WSF_GROUND_MOVER
      on_ground
      #resurrectible
      #automatic_recovery_time 25.0 sec
      route
         position 39:09:29.8n 106:51:10.9w speed 10 km/hr
         position 39:10:35.0n 106:50:44.8w
         stop
      end_route
   end_mover
```

- **演示要点**：演示 WSF_GROUND_MOVER 的参数：on_ground, route

### mover · WSF_GUIDED_MOVER｜运动模型

- **关键词**：mover, WSF_GUIDED_MOVER, update_interval, stage, 运动模型
- **出处**：`parachute/parachute_example.txt:34-45`　（同签名共 7 处，另见 `base_types/weapons/agm/blue_adv_cruise_missile.txt:68`、`parachute/parachute_example2.txt:37`、`cyber/weapons/agm/client_agm.txt:51`）
- **片段**：

```text
   mover WSF_GUIDED_MOVER
     update_interval .01 sec
     stage 1 # intial jump; parachute not open
        total_mass 0.01 lbs
        pre_separation_coast_time   10 sec
        aero INITIAL_PARACHUTE_AERO
     end_stage
     stage 2 # parachute open
        total_mass 20 lbs
        aero PARACHUTE_AERO
     end_stage
   end_mover
```

- **演示要点**：演示 WSF_GUIDED_MOVER 的参数：update_interval, stage

### mover · WSF_TBM_MOVER｜运动模型

- **关键词**：mover, WSF_TBM_MOVER, show_status, stage, 运动模型
- **出处**：`tbm_demos/weapons/ssm/tbm3.txt:35-51`
- **片段**：

```text
   mover WSF_TBM_MOVER
      show_status
      stage 1
         empty_mass             613 lb
         fuel_mass              3474 lb
         ballistic_coefficient  5000 lbf/ft^2
         thrust                 53900 lbf
         thrust_duration        16.1 sec
      end_stage
      stage 2
         fuel_mass              1685 lb
         empty_mass             397 lb            # 297 lb structure + 100 lb payload
         ballistic_coefficient  5000 lbf/ft^2
         thrust                 7946 lbf
         thrust_duration        53 sec
      end_stage
   end_mover
```

- **演示要点**：演示 WSF_TBM_MOVER 的参数：show_status, stage

### mover · WSF_AIR_MOVER｜运动模型

- **关键词**：mover, WSF_AIR_MOVER, maximum_speed, maximum_altitude, 运动模型
- **出处**：`engage/grid_react_man.txt:153-173`
- **片段**：

```text
   mover WSF_AIR_MOVER
      #Some examples of commands useful to limiting/setting physical constraints
      #on maneuverability of the target. Use these in lieu of the reactive manuever
      #variables dictating these values

#      bank_angle_limit 90 deg
#      body_g_limit 6 g
#      maximum_climb_rate 60 m/s
#      maximum_flight_path_angle 70 deg
#      maximum_linear_acceleration 6 g
#      maximum_radial_acceleration 6 g
#      roll_rate_limit 2 rad/s
#      turn_rate_limit .5 rad/s

      #Set the maximum speed value here
      #Important to set this, so that slice
      #maneuvers (which increase speed to maximum)
      #are bounded by a realistic velocity
      maximum_speed 600 knots
      maximum_altitude 50000 ft
   end_mover
```

- **演示要点**：演示 WSF_AIR_MOVER 的参数：maximum_speed, maximum_altitude

### mover · WSF_INTEGRATING_SPACE_MOVER｜运动模型

- **关键词**：mover, WSF_INTEGRATING_SPACE_MOVER, integrator, dynamics, 运动模型
- **出处**：`multiresolution_demos/movers/space_mover.txt:21-46`
- **片段**：

```text
      mover WSF_INTEGRATING_SPACE_MOVER
         integrator prince_dormand_78
            tolerance 1.0e-11
            error_criterion L_2
         end_integrator
         dynamics
            term atmospheric_drag
               cross_sectional_area 1.0 m^2
               drag_coefficient 1.0e-6
               atmosphere_model basic
            end_term
            term earth_monopole
               egm96
            end_term
            term earth_j2
               egm96
            end_term
            term sun_monopole
            end_term
            term moon_monopole
               interpolation_interval 100.0 s
            end_term
            term jupiter_monopole
            end_term
         end_dynamics
      end_mover
```

- **演示要点**：演示 WSF_INTEGRATING_SPACE_MOVER 的参数：integrator, dynamics

### mover · WSF_GUIDED_MOVER｜运动模型

- **关键词**：mover, WSF_GUIDED_MOVER, integration_timestep, update_interval, 运动模型
- **出处**：`base_types/weapons/ssm/red_icbm_1.txt:122-208`
- **片段**：

```text
mover RED_ICBM_1_MOVER WSF_GUIDED_MOVER
   integration_timestep      0.01 secs
   update_interval           0.01 secs
   # Length: 	18.7 m (31A)
   #Body diameter: 	2.0 m (1st and 2nd stages) and 1.5 m (3rd stage)
   #Launch weight: 	 63,000 kg (31A)
   #Payload: 	Single warhead or 3-5 MIRV, 1,050-1,750 kg
   #Warhead: 	Nuclear 1 MT or 3-5 MIRV with selectable 20, 90 or 150 kT each
   #Guidance: 	Inertial with stellar updates
   #Propulsion: 	3-stage solid propellant
   #Range:       14,000 km (31A) / 11,200 km wiki
   #Stage1:Motor: 1 x red_icbm_1-1. Length: 8.00 m (26.20 ft). Diameter: 2.00 m (6.50 ft). Propellants: Solid.
   #Stage2:Motor: 1 x red_icbm_1-2. Length: 4.00 m (13.10 ft). Diameter: 2.00 m (6.50 ft). Propellants: Solid.
   #Stage3:Motor: 1 x red_icbm_1-3. Length: 2.00 m (6.50 ft).  Diameter: 2.00 m (6.50 ft). Propellants: Solid.
   #Appr:Taking 63,000 kg - 1,050kg for RV
   #Appr:61,950 kg total x 22% for empty weight leaves
   #Appr:13,629 kg structure weight and 48321 fuel weight
   #Appr:Motor Total weight (lbs) is function of diameter and length:
   #Appr:Rule of thumb: W = length(in) x diam^2(in) x 0.04
   #Appr:First stage total mass  314.4 x 6084 x 0.04 = 76512.384 lbs = 34705 kg
   #Appr:Second stage total mass 157.2 x 6084 x 0.04 = 38256.192 lbs = 17352 kg
   #Appr:Third stage total mass   78.0 x 6084 x 0.04 = 18982.080 lbs =  8610 kg
   #Appr:Total Weight of stages = 60667 kg - close to published weight
   #Appr:Use 90% of total weight for fuel.  Rule of thumb is 75-90%.
   #Appr:Burn time = (total impulse)/(average thrust)
   #Appr:Burn time = (motor impulse in newton seconds / (motor thrust in Newtons )
   #Appr:Burn time = (Fuel Mass) / (Mass Flow Rate)
      stage 1
         aero                   RED_ICBM_1_STAGE_1_AERO
         total_mass             34750 kg       # rounded
         fuel_mass              31275 kg       # 90% of stage weight
         specific_impulse       270 sec        # typical
         thrust_duration        70 sec         # adjust for max g's
    # COMPUTED FROM WSF RUN
    #Empty Mass      : 3475 kg; 7661.06 lbm
    #Fuel Mass       : 31275 kg; 68949.6 lbm
    #Total Mass      : 34750 kg; 76610.6 lbm
    #Thrust          : 1.183e+06 N; 265948 lbf; 120632 kgf
    #Specific Impulse: 270 sec
    #Burn Rate       : 446.786 kg/sec; 984.994 lbm/sec
    #Thrust Duration : 70 sec
    #Fuel Used       : 31275 kg; 68949.6 lbm
    #Total Starting Mass: 61800 kg; 136246 lbm
    #Total Ending   Mass: 30525 kg; 67296.1 lbm
    #Acceleration at stage 1 separation: 3.26g
      end_stage
      stage 2
         aero                   RED_ICBM_1_STAGE_2_AERO
         total_mass             17400 kg       # rounded
         fuel_mass              15660 kg       # 90% of stage weight
         specific_impulse       270 sec        # typical
         thrust_duration        80 sec         # adjust for max g's
    #Empty Mass      : 1740 kg; 3836.04 lbm
    #Fuel Mass       : 15660 kg; 34524.4 lbm
    #Total Mass      : 17400 kg; 38360.4 lbm
    #Thrust          : 518306 N; 116520 lbf; 52852.5 kgf
    #Specific Impulse: 270 sec
    #Burn Rate       : 195.75 kg/sec; 431.555 lbm/sec
    #Thrust Duration : 80 sec
    #Fuel Used       : 15660 kg; 34524.4 lbm
    #Total Starting Mass: 27050 kg; 59635 lbm
    #Total Ending   Mass: 11390 kg; 25110.7 lbm
    #Acceleration at stage 2 separation: 4.30g
      end_stage
      stage 3
         aero                   RED_ICBM_1_STAGE_3_AERO
         total_mass             8600 kg         # rounded
         fuel_mass              7740 kg         # 90% of stage weight
         specific_impulse       270 sec         # typical
         thrust_duration        100 sec          # adjust for max g's
    #Empty Mass      : 860 kg; 1895.98 lbm
    #Fuel Mass       : 7740 kg; 17063.8 lbm
    #Total Mass      : 8600 kg; 18959.8 lbm
    #Thrust          : 204939 N; 46072.2 lbf; 20898 kgf
    #Specific Impulse: 270 sec
    #Burn Rate       : 77.4 kg/sec; 170.638 lbm/sec
    #Thrust Duration : 100 sec
    #Fuel Used       : 7740 kg; 17063.8 lbm
    #Total Starting Mass: 9650 kg; 21274.6 lbm
    #Total Ending   Mass: 1910 kg; 4210.83 lbm
    #Acceleration at stage 3 separation: 9.9g (a little high)
      end_stage
      stage 4
         aero                   RED_ICBM_1_RV_AERO
         total_mass             1050 kg
      end_stage
end_mover
```

- **演示要点**：演示 WSF_GUIDED_MOVER 的参数：integration_timestep, update_interval

### mover · WSF_AIR_MOVER｜运动模型

- **关键词**：mover, WSF_AIR_MOVER, maximum_radial_acceleration, 运动模型
- **出处**：`laser_designator/platforms/uav.txt:15-17`
- **片段**：

```text
   mover WSF_AIR_MOVER 
      maximum_radial_acceleration 1.5 g
   end_mover
```

- **演示要点**：演示 WSF_AIR_MOVER 的参数：maximum_radial_acceleration

### mover · WSF_AIR_MOVER｜运动模型

- **关键词**：mover, WSF_AIR_MOVER, update_interval, 运动模型
- **出处**：`multiresolution_demos/movers/air_mover.txt:15-17`　（同签名共 2 处，另见 `multiresolution_demos/movers/air_mover.txt:21`）
- **片段**：

```text
      mover WSF_AIR_MOVER
         update_interval 30 sec
      end_mover
```

- **演示要点**：演示 WSF_AIR_MOVER 的参数：update_interval

### mover · WSF_SURFACE_MOVER｜运动模型

- **关键词**：mover, WSF_SURFACE_MOVER, maximum_speed, 运动模型
- **出处**：`new_guidance/platforms/missile_ship.txt:70-72`　（同签名共 4 处，另见 `ship_ad/platforms/missile_ship.txt:77`、`ship_ad/platforms/red_missile_destroyer.txt:81`、`ship_ad/platforms/red_missile_frigate.txt:70`）
- **片段**：

```text
  mover WSF_SURFACE_MOVER
    maximum_speed  31 kts
  end_mover
```

- **演示要点**：演示 WSF_SURFACE_MOVER 的参数：maximum_speed

### mover · WSF_AIR_MOVER｜运动模型

- **关键词**：mover, WSF_AIR_MOVER, default_radial_acceleration, 运动模型
- **出处**：`new_guidance/scenarios/blue_multirole_fighter_1_launch.txt:12-14`　（同签名共 10 处，另见 `new_guidance/scenarios/blue_multirole_fighter_1_launch_blue_asm_missile.txt:13`、`traffic_demos/platforms/b-707.txt:12`、`traffic_demos/platforms/b-737.txt:12`）
- **片段**：

```text
   mover WSF_AIR_MOVER
      default_radial_acceleration 2 g
   end_mover
```

- **演示要点**：演示 WSF_AIR_MOVER 的参数：default_radial_acceleration

### mover · WSF_P6DOF_MOVER｜运动模型

- **关键词**：mover, WSF_P6DOF_MOVER, p6dof_object_type, 运动模型
- **出处**：`p6dof/flight_envelope.txt:107-109`　（同签名共 20 处，另见 `p6dof/range_endurance_test.txt:82`、`p6dof/sam_launch_test.txt:68`、`p6dof/platforms/simple-icbm-platform.txt:15`）
- **片段**：

```text
   mover WSF_P6DOF_MOVER
      p6dof_object_type $<MOVER_TYPE:FA-LGT>$
   end_mover
```

- **演示要点**：演示 WSF_P6DOF_MOVER 的参数：p6dof_object_type

### mover · WSF_SPACE_MOVER｜运动模型

- **关键词**：mover, WSF_SPACE_MOVER, update_interval, 运动模型
- **出处**：`satellite_demos/platforms/gps.txt:24-26`　（同签名共 2 处，另见 `space_operations/proximity_operations.txt:23`）
- **片段**：

```text
   mover WSF_SPACE_MOVER
      update_interval 10 sec
   end_mover
```

- **演示要点**：演示 WSF_SPACE_MOVER 的参数：update_interval

### mover · WSF_NORAD_SPACE_MOVER｜运动模型

- **关键词**：mover, WSF_NORAD_SPACE_MOVER, update_interval, 运动模型
- **出处**：`satellite_demos/platforms/intelsat.txt:22-24`
- **片段**：

```text
   mover WSF_NORAD_SPACE_MOVER
      update_interval 10 sec
   end_mover
```

- **演示要点**：演示 WSF_NORAD_SPACE_MOVER 的参数：update_interval

### mover（comm_satellite）｜运动模型

- **关键词**：mover, debug, 运动模型
- **出处**：`satellite_demos/scenarios/comm_satellite.txt:33-35`
- **片段**：

```text
   mover
     debug
   end_mover
```

- **演示要点**：演示 mover 的参数：debug

### mover · WSF_POINT_MASS_SIX_DOF_MOVER｜运动模型

- **关键词**：mover, WSF_POINT_MASS_SIX_DOF_MOVER, vehicle_type, 运动模型
- **出处**：`six_dof/platforms/zell-launcher.txt:19-21`　（同签名共 2 处，另见 `six_dof/platforms/zell-launcher.txt:29`）
- **片段**：

```text
   mover WSF_POINT_MASS_SIX_DOF_MOVER
      vehicle_type  ZELL-LAUNCHER_RB6
   end_mover
```

- **演示要点**：演示 WSF_POINT_MASS_SIX_DOF_MOVER 的参数：vehicle_type

### mover（attitude_control）｜运动模型

- **关键词**：mover, position, 运动模型
- **出处**：`space_operations/attitude_control.txt:144-146`
- **片段**：

```text
   mover
      position 0n 90w altitude 450 km heading 30 deg
   end_mover
```

- **演示要点**：演示 mover 的参数：position

### mover · WSF_SPACE_MOVER｜运动模型

- **关键词**：mover, WSF_SPACE_MOVER, oblate_earth, 运动模型
- **出处**：`space_operations/satellite_breakup.txt:56-58`
- **片段**：

```text
   mover WSF_SPACE_MOVER
      oblate_earth enable
   end_mover
```

- **演示要点**：演示 WSF_SPACE_MOVER 的参数：oblate_earth

### mover · WSF_GROUND_MOVER｜运动模型

- **关键词**：mover, WSF_GROUND_MOVER, maximum_speed, 运动模型
- **出处**：`wargame/platforms/sam_launcher.txt:45-47`
- **片段**：

```text
  mover WSF_GROUND_MOVER 
     maximum_speed 50 mph
  end_mover
```

- **演示要点**：演示 WSF_GROUND_MOVER 的参数：maximum_speed

### mover · WSF_BRAWLER_MOVER｜运动模型

- **关键词**：mover, WSF_BRAWLER_MOVER, aero_file, 运动模型
- **出处**：`base_types/platforms/brawler/brawler_platform.txt:76-79`　（同签名共 2 处，另见 `brawler/platforms/brawler_platform.txt:86`）
- **片段**：

```text
   mover WSF_BRAWLER_MOVER
      aero_file ACFT_BD.FXW
      #draw_projection
   end_mover
```

- **演示要点**：演示 WSF_BRAWLER_MOVER 的参数：aero_file

### mover（red_icbm_1）｜运动模型

- **关键词**：mover, show_status, 运动模型
- **出处**：`base_types/weapons/ssm/red_icbm_1.txt:249-252`　（同签名共 2 处，另见 `base_types_nx/weapons/ssm/blue_slbm.txt:152`）
- **片段**：

```text
   mover RED_ICBM_1_MOVER
      show_status
      #debug
   end_mover
```

- **演示要点**：演示 mover 的参数：show_status

### mover（apache_type）｜运动模型

- **关键词**：mover, start_mode, 运动模型
- **出处**：`hellfire/active_radar_hellfire/apache_type.txt:18-21`　（同签名共 3 处，另见 `hellfire/laser_designation_via_dis/apache_type.txt:18`、`hellfire/semiactive_laser_hellfire/apache_type.txt:18`）
- **片段**：

```text
   mover HELO_MOVER
      # Begin the ingress at a cautious speed, since we are terrain following.
      start_mode HOVER
   end_mover
```

- **演示要点**：演示 mover 的参数：start_mode

### mover · WSF_SURFACE_MOVER｜运动模型

- **关键词**：mover, WSF_SURFACE_MOVER, default_linear_acceleration, 运动模型
- **出处**：`traffic_demos/platforms/ship_container.txt:13-16`　（同签名共 5 处，另见 `traffic_demos/platforms/ship_fishing_trawler.txt:13`、`traffic_demos/platforms/ship_jetski.txt:13`、`traffic_demos/platforms/ship_small_fishing.txt:12`）
- **片段**：

```text
  mover WSF_SURFACE_MOVER
#    at_end_of_path remove
    default_linear_acceleration 0.3 g
  end_mover
```

- **演示要点**：演示 WSF_SURFACE_MOVER 的参数：default_linear_acceleration

### mover · WSF_NORAD_SPACE_MOVER｜运动模型

- **关键词**：mover, WSF_NORAD_SPACE_MOVER, attitude_controller, 运动模型
- **出处**：`satellite_demos/5th_iridium_flares_demo.txt:260-264`
- **片段**：

```text
   mover WSF_NORAD_SPACE_MOVER
      attitude_controller instant
         orientation nadir_with_eci_velocity_constraint
      end_attitude_controller
   end_mover
```

- **演示要点**：演示 WSF_NORAD_SPACE_MOVER 的参数：attitude_controller

### mover · WSF_AIR_MOVER｜运动模型

- **关键词**：mover, WSF_AIR_MOVER, angle_of_attack_table, 运动模型
- **出处**：`sensor_plot/sar/ag_bomber.txt:20-25`　（同签名共 6 处，另见 `sensor_plot/sar/ip_bomber.txt:20`、`sensor_plot/sar/sn_bomber.txt:20`、`sensor_plot/eoir/px_fighter.txt:20`）
- **片段**：

```text
   mover WSF_AIR_MOVER
      angle_of_attack_table
         altitude 0 m
            speed    0 kts angle 5 deg           # <--- Angle of attack
      end_angle_of_attack_table
   end_mover
```

- **演示要点**：演示 WSF_AIR_MOVER 的参数：angle_of_attack_table

### mover · WSF_SPACE_MOVER｜运动模型

- **关键词**：mover, WSF_SPACE_MOVER, attitude_controller, 运动模型
- **出处**：`space_operations/attitude_control.txt:55-62`
- **片段**：

```text
   mover WSF_SPACE_MOVER
      attitude_controller rate_limited
         maximum_yaw_rate 5 deg/s
         maximum_pitch_rate 5 deg/s
         maximum_roll_rate 5 deg/s
         orientation none
      end_attitude_controller
   end_mover
```

- **演示要点**：演示 WSF_SPACE_MOVER 的参数：attitude_controller

### mover（blue_laydown）｜运动模型

- **关键词**：mover, route, 运动模型
- **出处**：`cyber/scenarios/blue_laydown.txt:16-25`　（同签名共 2 处，另见 `cyber/scenarios/mitm_blue_laydown.txt:18`）
- **片段**：

```text
   mover
      route
         navigation
            position 38:47:48.237n 87:53:26.794w
               altitude 2500 feet
               speed 600 mi/h
            position 38:50:06.35n 91:40:52.01w
         end_navigation
      end_route
   end_mover
```

- **演示要点**：演示 mover 的参数：route

### mover · WSF_GUIDED_MOVER｜运动模型

- **关键词**：mover, WSF_GUIDED_MOVER, stage, 运动模型
- **出处**：`ship_ad/weapons/sam/red_sr_naval_sam_1.txt:40-56`　（同签名共 2 处，另见 `ship_ad/weapons/sam/red_sr_sam_2.txt:43`）
- **片段**：

```text
  mover WSF_GUIDED_MOVER
    stage 1
       empty_mass        0.01 kg
       fuel_mass         230 kg
       thrust_duration   2.5 sec       # assuming 25% of total burn time
       specific_impulse  250 sec       # typical solid propellant
       aero              RED_SR_NAVAL_SAM_1_AERO
    end_stage

    stage 2
       total_mass        460 kg        # Ref 2 lists total missile mass of 690 kg
       fuel_mass         70 kg
       thrust_duration   8.5 sec
       specific_impulse  250 sec
       aero              RED_SR_NAVAL_SAM_1_AERO
    end_stage
  end_mover
```

- **演示要点**：演示 WSF_GUIDED_MOVER 的参数：stage

### mover · WSF_AIR_MOVER｜运动模型

- **关键词**：mover, WSF_AIR_MOVER, 运动模型
- **出处**：`bearing_only/platforms/air_target.txt:25-26`　（同签名共 52 处，另见 `ciws/platforms/air_target.txt:16`、`coverage_demos/platforms/air_target.txt:12`、`coverage_demos/platforms/uav.txt:17`）
- **片段**：

```text
   mover WSF_AIR_MOVER
   end_mover
```

- **演示要点**：演示 WSF_AIR_MOVER（最小结构，无子参数）

### mover（blue_naval_sam）｜运动模型

- **关键词**：mover, 运动模型
- **出处**：`ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:136-137`　（同签名共 16 处，另见 `base_types/weapons/sam/blue_naval_sam.txt:136`、`base_types/weapons/ssm/red_mrbm_3.txt:453`、`space_operations/weapons/blue_naval_sam.txt:136`）
- **片段**：

```text
   mover BLUE_NAVAL_SAM_MOVER
   end_mover
```

- **演示要点**：演示 mover（最小结构，无子参数）

### mover · WSF_FIRES_MOVER｜运动模型

- **关键词**：mover, WSF_FIRES_MOVER, 运动模型
- **出处**：`fires/types/fires_120mm_artillery.txt:44-45`　（同签名共 18 处，另见 `fires/types/fires_120mm_mortar.txt:49`、`fires/types/fires_152mm_artillery.txt:43`、`fires/types/fires_60mm_mortar.txt:46`）
- **片段**：

```text
   mover WSF_FIRES_MOVER
   end_mover
```

- **演示要点**：演示 WSF_FIRES_MOVER（最小结构，无子参数）

### mover · WSF_KINEMATIC_MOVER｜运动模型

- **关键词**：mover, WSF_KINEMATIC_MOVER, 运动模型
- **出处**：`kinematic_mover/kinematic_mover_demo.txt:32-33`
- **片段**：

```text
  mover WSF_KINEMATIC_MOVER
  end_mover
```

- **演示要点**：演示 WSF_KINEMATIC_MOVER（最小结构，无子参数）

### mover · WSF_SPACE_MOVER｜运动模型

- **关键词**：mover, WSF_SPACE_MOVER, 运动模型
- **出处**：`multiresolution_demos/movers/space_mover.txt:15-16`　（同签名共 14 处，另见 `satellite_demos/6th_Hohmann_leo_orbit_transfer_demo.txt:26`、`satellite_demos/platforms/beidou.txt:26`、`satellite_demos/platforms/globalstar.txt:22`）
- **片段**：

```text
      mover WSF_SPACE_MOVER
      end_mover
```

- **演示要点**：演示 WSF_SPACE_MOVER（最小结构，无子参数）

### mover · WSF_NORAD_SPACE_MOVER｜运动模型

- **关键词**：mover, WSF_NORAD_SPACE_MOVER, 运动模型
- **出处**：`satellite_demos/platforms/irnss.txt:23-24`　（同签名共 27 处，另见 `satellite_demos/platforms/noaa.txt:23`、`satellite_demos/platforms/satellite_types.txt:12`、`satellite_demos/platforms/satellite_types.txt:19`）
- **片段**：

```text
  mover WSF_NORAD_SPACE_MOVER
  end_mover
```

- **演示要点**：演示 WSF_NORAD_SPACE_MOVER（最小结构，无子参数）

### mover · WSF_GUIDED_MOVER｜运动模型

- **关键词**：mover, WSF_GUIDED_MOVER, 运动模型
- **出处**：`script_demos/script_demo_7.txt:86-101`　（同签名共 3 处，另见 `satellite_demos/scenarios/gps_denied.txt:73`、`alv_routing/platforms/alv.txt:45`）
- **片段**：

```text
   mover WSF_GUIDED_MOVER
         update_interval 0.5 s
         #debug
         #show_trajectory
         stage 1
         # Warhead 487 lb (221 kg)
         total_mass         2250 lb
         fuel_mass          1200 lb              # Guess
         thrust             3000 Nt
         #specific_impulse    2427 sec
         thrust_duration      1.2 hours   #620 / 537 = 1.15 hours
         aero                AGM-158_AERO
         thrust_delay        1.0 sec
         aero AGM-158_AERO
      end_stage
   end_mover
```

- **演示要点**：演示 WSF_GUIDED_MOVER（最小结构，无子参数）

### multiresolution_fuel · WSF_MULTIRESOLUTION_FUEL｜

- **关键词**：multiresolution_fuel, WSF_MULTIRESOLUTION_FUEL, model, add
- **出处**：`multiresolution_demos/fuel/fuel_include.txt:45-57`
- **片段**：

```text
multiresolution_fuel MR_FUEL WSF_MULTIRESOLUTION_FUEL     
  model high_fidelity_fuel
     fidelity_range 0.5 1.0
     fuel HIGH_FIDELITY_FUEL
     end_fuel
  end_model
 
  add model low_fidelity_fuel
     fidelity_range 0.0 0.5 
     fuel LOW_FIDELITY_FUEL
     end_fuel
  end_model
end_multiresolution_fuel
```

- **演示要点**：演示 WSF_MULTIRESOLUTION_FUEL 的参数：model, add

### multiresolution_fuel（fuel_demo）｜

- **关键词**：multiresolution_fuel, fidelity
- **出处**：`multiresolution_demos/fuel_demo.txt:52-54`
- **片段**：

```text
   multiresolution_fuel
      fidelity 0
   end_multiresolution_fuel
```

- **演示要点**：演示 multiresolution_fuel 的参数：fidelity

### multiresolution_fuel（fuel_demo）｜

- **关键词**：multiresolution_fuel
- **出处**：`multiresolution_demos/fuel_demo.txt:47-48`
- **片段**：

```text
   multiresolution_fuel MR_FUEL
   end_multiresolution_fuel
```

- **演示要点**：演示 multiresolution_fuel（最小结构，无子参数）

### multiresolution_mover（air_mover_demo）｜

- **关键词**：multiresolution_mover, fidelity, common
- **出处**：`multiresolution_demos/air_mover_demo.txt:42-51`
- **片段**：

```text
   multiresolution_mover
      fidelity 1
      common
         route
            position 0n 0e altitude 20000 ft heading 0 deg speed 450 kts
            position 0.1n 0e altitude 20000 ft speed 450 kts
            position 0.1n 0.1e altitude 25000 ft speed 450 kts
         end_route
      end_common
   end_multiresolution_mover
```

- **演示要点**：演示 multiresolution_mover 的参数：fidelity, common

### multiresolution_mover · WSF_MULTIRESOLUTION_MOVER｜

- **关键词**：multiresolution_mover, WSF_MULTIRESOLUTION_MOVER, model, common
- **出处**：`multiresolution_demos/movers/space_mover.txt:12-57`
- **片段**：

```text
multiresolution_mover MR_MOVER WSF_MULTIRESOLUTION_MOVER
   model low_fidelity_mover
      fidelity_range 0.0 0.5
      mover WSF_SPACE_MOVER
      end_mover
   end_model
      
   model high_fidelity_mover
      fidelity_range 0.5 1.0
      mover WSF_INTEGRATING_SPACE_MOVER
         integrator prince_dormand_78
            tolerance 1.0e-11
            error_criterion L_2
         end_integrator
         dynamics
            term atmospheric_drag
               cross_sectional_area 1.0 m^2
               drag_coefficient 1.0e-6
               atmosphere_model basic
            end_term
            term earth_monopole
               egm96
            end_term
            term earth_j2
               egm96
            end_term
            term sun_monopole
            end_term
            term moon_monopole
               interpolation_interval 100.0 s
            end_term
            term jupiter_monopole
            end_term
         end_dynamics
      end_mover
   end_model
   common
      update_interval 5 sec
      eccentricity 1e-3
      semi_major_axis 6600 km
      raan 0 deg
      inclination 0 deg
      true_anomaly 0 deg
      argument_of_periapsis 0 deg
   end_common
end_multiresolution_mover
```

- **演示要点**：演示 WSF_MULTIRESOLUTION_MOVER 的参数：model, common

### multiresolution_mover（space_mover_demo）｜

- **关键词**：multiresolution_mover, fidelity
- **出处**：`multiresolution_demos/space_mover_demo.txt:48-50`
- **片段**：

```text
   multiresolution_mover
      fidelity 1
   end_multiresolution_mover
```

- **演示要点**：演示 multiresolution_mover 的参数：fidelity

### multiresolution_mover · WSF_MULTIRESOLUTION_MOVER｜

- **关键词**：multiresolution_mover, WSF_MULTIRESOLUTION_MOVER, model
- **出处**：`multiresolution_demos/movers/air_mover.txt:12-25`
- **片段**：

```text
multiresolution_mover MR_AIR_MOVER WSF_MULTIRESOLUTION_MOVER
   model low_fidelity_mover
      fidelity_range 0 0.5
      mover WSF_AIR_MOVER
         update_interval 30 sec
      end_mover
   end_model
   model high_fidelity_mover
      fidelity_range 0.5 1.0
      mover WSF_AIR_MOVER
         update_interval 0.1 sec
      end_mover
   end_model
end_multiresolution_mover
```

- **演示要点**：演示 WSF_MULTIRESOLUTION_MOVER 的参数：model

### multiresolution_mover（air_mover_demo）｜

- **关键词**：multiresolution_mover
- **出处**：`multiresolution_demos/air_mover_demo.txt:36-37`　（同签名共 2 处，另见 `multiresolution_demos/space_mover_demo.txt:41`）
- **片段**：

```text
   multiresolution_mover MR_AIR_MOVER
   end_multiresolution_mover
```

- **演示要点**：演示 multiresolution_mover（最小结构，无子参数）

### orbit（beidou）｜

- **关键词**：orbit
- **出处**：`satellite_demos/satellites/orbit_tle/beidou.txt:21-24`　（同签名共 1418 处，另见 `satellite_demos/satellites/orbit_tle/beidou.txt:30`、`satellite_demos/satellites/orbit_tle/beidou.txt:39`、`satellite_demos/satellites/orbit_tle/beidou.txt:48`）
- **片段**：

```text
orbit
1 36287U 10001A   17192.24952231 -.00000286  00000-0  00000-0 0  9993
2 36287   1.4803   1.5211 0003448 156.6282   1.1030  1.00271897 27451
end_orbit
```

- **演示要点**：演示 orbit（最小结构，无子参数）

### p6dof_integrators（integrators_config）｜

- **关键词**：p6dof_integrators, create_integrator
- **出处**：`p6dof/p6dof_types/environment/integrators_config.txt:18-22`
- **片段**：

```text
p6dof_integrators

   create_integrator  STANDARD_P6DOF_INTEGRATOR

end_p6dof_integrators
```

- **演示要点**：演示 p6dof_integrators 的参数：create_integrator

### p6dof_object_type（simple-icbm）｜

- **关键词**：p6dof_object_type, mass, moment_of_inertia_ixx, moment_of_inertia_iyy, moment_of_inertia_izz, center_of_mass_x, center_of_mass_y, center_of_mass_z, engine, event_released_from_parent, action_change_aero_mode
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:154-188`
- **片段**：

```text
      p6dof_object_type  ICBM_Stage2  P6DOF_BASE_TYPE

      object_graphical_type_num     10002
      use_spherical_earth           true

      mass_properties
         mass                    1250 lbs
         moment_of_inertia_ixx   3000  slug*ft^2
         moment_of_inertia_iyy   50000 slug*ft^2
         moment_of_inertia_izz   60000 slug*ft^2
         center_of_mass_x        0.0 ft
         center_of_mass_y        0.0 ft
         center_of_mass_z        0.0 ft
      end_mass_properties

      # AeroData
      include ICBM_Stage2Aero.txt

      propulsion_data
         engine    Stage2Motor   ICBM_Stage2_Rocket
            rel_pos_x              0.0 ft
            rel_pos_y              0.0 ft
            rel_pos_z              0.0 ft
            rel_yaw               0.0 deg
            rel_pitch             0.0 deg
            rel_roll              0.0 deg
         end_engine
      end_propulsion_data

      sequencer NewAeroAtStaging
        event_released_from_parent
        action_change_aero_mode    PostStaging
      end_sequencer

   end_p6dof_object_type
```

- **演示要点**：演示 p6dof_object_type 的参数：mass, moment_of_inertia_ixx, moment_of_inertia_iyy, moment_of_inertia_izz, center_of_mass_x, center_of_mass_y, center_of_mass_z, engine, event_released_from_parent, action_change_aero_mode

### p6dof_object_type（simple-icbm）｜

- **关键词**：p6dof_object_type, object_graphical_type_num, use_spherical_earth, mass_properties, include, propulsion_data, size_factor_min, size_factor_max, size_factor_radius, size_factor_volume_rate_m3_per_sec, sequencer
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:562-604`
- **片段**：

```text
   p6dof_object_type  ICBM_DecoyBalloon   P6DOF_BASE_TYPE

      object_graphical_type_num     10031
      use_spherical_earth           true

      mass_properties
         mass                    1 lbs
         moment_of_inertia_ixx   3  slug*ft^2
         moment_of_inertia_iyy   50 slug*ft^2
         moment_of_inertia_izz   60 slug*ft^2
         center_of_mass_x        0.0 ft
         center_of_mass_y        0.0 ft
         center_of_mass_z        0.0 ft
      end_mass_properties

      # AeroData
      include ICBM_BalloonAero.txt

      propulsion_data
        # No propulsion data
      end_propulsion_data

      size_factor_min                     1.0
      size_factor_max                     50.0
      size_factor_radius                  0.1 m
#     size_factor_radius_rate_m_per_sec   2.0
      size_factor_volume_rate_m3_per_sec  10.0

      sequencer  NewAeroAtStaging
        event_released_from_parent
        action_change_aero_mode    PostStaging
      end_sequencer

      sequencer  BalloonReleased
        event_released_from_parent
        action_change_aero_mode    PostStaging
        sequencer StartInflating
          event_timer            5.0 sec
          action_enable_size_factor
        end_sequencer
      end_sequencer

   end_p6dof_object_type
```

- **演示要点**：演示 p6dof_object_type 的参数：object_graphical_type_num, use_spherical_earth, mass_properties, include, propulsion_data, size_factor_min, size_factor_max, size_factor_radius, size_factor_volume_rate_m3_per_sec, sequencer

### p6dof_object_type（simple-icbm）｜

- **关键词**：p6dof_object_type, object_graphical_type_num, use_spherical_earth, mass_properties, include, propulsion_data, sequencer
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:14-48`　（同签名共 4 处，另见 `p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:294`、`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:333`、`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:379`）
- **片段**：

```text
   p6dof_object_type  ICBM_Stage1  P6DOF_BASE_TYPE

      object_graphical_type_num     10001
      use_spherical_earth           true

      mass_properties
         mass                    4250 lbs
         moment_of_inertia_ixx   3000  slug*ft^2
         moment_of_inertia_iyy   50000 slug*ft^2
         moment_of_inertia_izz   60000 slug*ft^2
         center_of_mass_x        0.0 ft
         center_of_mass_y        0.0 ft
         center_of_mass_z        0.0 ft
      end_mass_properties

      # AeroData
      include ICBM_Stage1Aero.txt

      propulsion_data
         engine     Stage1Motor   ICBM_Stage1_Rocket
            rel_pos_x             0.0 ft
            rel_pos_y             0.0 ft
            rel_pos_z             0.0 ft
            rel_yaw               0.0 deg
            rel_pitch             0.0 deg
            rel_roll              0.0 deg
         end_engine
      end_propulsion_data

      sequencer NewAeroAtStaging
        event_released_from_parent
        action_change_aero_mode     PostStaging
      end_sequencer

   end_p6dof_object_type
```

- **演示要点**：演示 p6dof_object_type 的参数：object_graphical_type_num, use_spherical_earth, mass_properties, include, propulsion_data, sequencer

### p6dof_object_type（simple-icbm）｜

- **关键词**：p6dof_object_type, object_graphical_type_num, use_spherical_earth, mass_properties, include, sequencer
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:52-75`　（同签名共 8 处，另见 `p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:77`、`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:102`、`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:127`）
- **片段**：

```text
   p6dof_object_type  ICBM_Interstage12A  P6DOF_BASE_TYPE

      object_graphical_type_num     10011
      use_spherical_earth           true

      mass_properties
         mass                    20 lbs
         moment_of_inertia_ixx   300  slug*ft^2
         moment_of_inertia_iyy   5000 slug*ft^2
         moment_of_inertia_izz   6000 slug*ft^2
         center_of_mass_x        0.0 ft
         center_of_mass_y        0.0 ft
         center_of_mass_z        0.0 ft
      end_mass_properties

      # AeroData
      include ICBM_Interstage12Aero.txt

      sequencer NewAeroAtStaging
        event_released_from_parent
        action_change_aero_mode    PostStaging
      end_sequencer

   end_p6dof_object_type
```

- **演示要点**：演示 p6dof_object_type 的参数：object_graphical_type_num, use_spherical_earth, mass_properties, include, sequencer

### p6dof_object_type（simple-icbm）｜

- **关键词**：p6dof_object_type, object_graphical_type_num, use_spherical_earth, fixed_object, subobject, sequencer
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:1156-1196`
- **片段**：

```text
   p6dof_object_type  ICBM_Silo   P6DOF_BASE_TYPE

      object_graphical_type_num     1002
      use_spherical_earth           true
      fixed_object                  true

      # No AeroData

      # RV location above floor: 0.254*60.0 = 15.24
      subobject      ICBM        SIMPLE-ICBM
         parent_rel_x            15.24 m
         parent_rel_y            0.0 m
         parent_rel_z            0.0 m
         parent_rel_yaw          0.0 deg
         parent_rel_pitch        0.0 deg
         parent_rel_roll         0.0 deg
         separation_vx           0.0 ft/sec
         separation_vy           0.0 ft/sec
         separation_vz           0.0 ft/sec
         separation_omega_x      0.0 deg/sec
         separation_omega_y      0.0 deg/sec
         separation_omega_z      0.0 deg/sec
      end_subobject

      sequencer  IgniteICBM
        event_timer                        3.0 sec
#       event_manual_input_button_released 10
        action_ignite_subobject            ICBM_Stage1

        sequencer  ReleaseICBM
          event_timer      0.5 sec
          action_jett_obj  ICBM
        end_sequencer

      end_sequencer

# ------------------------------------------------------------------------------

   # ***** VANDENBERG LAUNCH COORD BASED ON GOOGLE MAPS:  34.888278,-120.636874

   end_p6dof_object_type
```

- **演示要点**：演示 p6dof_object_type 的参数：object_graphical_type_num, use_spherical_earth, fixed_object, subobject, sequencer

### p6dof_object_type（zell-launch-system）｜

- **关键词**：p6dof_object_type, object_graphical_type_num, fixed_object, mass_properties, subobject
- **出处**：`p6dof/p6dof_types/misc/zell-launch-system/zell-launch-system.txt:13-44`
- **片段**：

```text
   p6dof_object_type ZELL-LAUNCHER P6DOF_BASE_TYPE

      object_graphical_type_num 16

      fixed_object              true

      mass_properties
         mass                  1000000000 lbs
         moment_of_inertia_ixx 1000000000 slug*ft^2
         moment_of_inertia_iyy 1000000000 slug*ft^2
         moment_of_inertia_izz 1000000000 slug*ft^2
         center_of_mass_x      0.0 ft
         center_of_mass_y      0.0 ft
         center_of_mass_z      0.0 ft
      end_mass_properties

      subobject              Fighter    FA-LGT-ZLL
         parent_rel_x        0.0 ft
         parent_rel_y        0.0 ft
         parent_rel_z       -20.0 ft
         parent_rel_yaw      0.0 deg
         parent_rel_pitch    45.0 deg
         parent_rel_roll     0.0 deg
         separation_vx       0.0 ft/sec
         separation_vy       0.0 ft/sec
         separation_vz       0.0 ft/sec
         separation_omega_x  0.0 deg/sec
         separation_omega_y  0.0 deg/sec
         separation_omega_z  0.0 deg/sec
      end_subobject

   end_p6dof_object_type
```

- **演示要点**：演示 p6dof_object_type 的参数：object_graphical_type_num, fixed_object, mass_properties, subobject

### p6dof_object_type（srb-rato）｜

- **关键词**：p6dof_object_type, include, mass_properties, propulsion_data, sequencer
- **出处**：`p6dof/p6dof_types/misc/srb-rato/srb-rato.txt:21-61`　（同签名共 8 处，另见 `p6dof/p6dof_types/weapons/unguided_rocket/unguided_rocket.txt:21`、`p6dof/p6dof_types/weapons/aam-mr/aam-mr.txt:21`、`p6dof/p6dof_types/weapons/aam-sr/aam-sr-tvc.txt:21`）
- **片段**：

```text
   p6dof_object_type SRB-RATO P6DOF_BASE_TYPE

      include aero/aero.txt                 # Defines the vehicle aerodynamics

      mass_properties
         mass                              133.33333 lbs
         moment_of_inertia_ixx               5.93933 slug*ft^2
         moment_of_inertia_iyy              54.81502 slug*ft^2
         moment_of_inertia_izz              54.81502 slug*ft^2
         center_of_mass_x                   -0.00000 ft
         center_of_mass_y                   -0.00000 ft
         center_of_mass_z                   -0.00000 ft
      end_mass_properties

      propulsion_data

         engine Engine  RATO-RKT
            rel_pos_x                        1.55536 ft
            rel_pos_y                        0.00000 ft
            rel_pos_z                        0.00000 ft
            rel_yaw                          0.00000 deg
            rel_pitch                        0.00000 deg
         end_engine

         # This vehicle lacks a fuel tank

         # Throttle controls:
         throttle_setting_mil         ThrottleMilitary

         # Thrust vectoring controls:
         #throttle_setting_yaw        ThrustVectoringYaw
         #throttle_setting_pitch      ThrustVectoringPitch

      end_propulsion_data

      # This sequencer will ignite/start the engine(s)
      sequencer ReleaseFromVehicle
         event_released_from_parent
         action_ignite_engine Engine
      end_sequencer
   end_p6dof_object_type
```

- **演示要点**：演示 p6dof_object_type 的参数：include, mass_properties, propulsion_data, sequencer

### p6dof_object_type（simple-icbm）｜

- **关键词**：p6dof_object_type, object_graphical_type_num, use_spherical_earth, mass_properties, include
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:502-558`
- **片段**：

```text
   p6dof_object_type  ICBM_RV   P6DOF_BASE_TYPE

      object_graphical_type_num     10006
      use_spherical_earth           true

      # Should this be one or three RVs?
      mass_properties
         mass                    2300 lbs
         moment_of_inertia_ixx   300  slug*ft^2
         moment_of_inertia_iyy   5000 slug*ft^2
         moment_of_inertia_izz   6000 slug*ft^2
         center_of_mass_x        0.0 ft
         center_of_mass_y        0.0 ft
         center_of_mass_z        0.0 ft
      end_mass_properties

      # AeroData
      include ICBM_RVAero.txt

//      propulsion_data
//         solid_propellant_rocket    SpinMotor1   ICBM_NoseconeMotor1
//            rel_pos_x              0.0 ft
//            rel_pos_y              0.0 ft
//            rel_pos_z              0.0 ft
//            rel_yaw               0.0 deg
//            rel_pitch             0.0 deg
//            rel_roll              0.0 deg
//         end_engine
//         solid_propellant_rocket    SpinMotor2   ICBM_NoseconeMotor2
//            rel_pos_x              0.0 ft
//            rel_pos_y              0.0 ft
//            rel_pos_z              0.0 ft
//            rel_yaw               0.0 deg
//            rel_pitch             0.0 deg
//            rel_roll              0.0 deg
//        end_engine
//      end_propulsion_data
//
//      sequencer
//        name                     NewAeroAtStaging
//        event_released_from_parent
//        action_change_aero_mode    PostStaging
//      end_sequencer
//
//      sequencer
//        name                     RVReleased
//        event_released_from_parent
//        Action_Null
//        sequencer
//          Event_Timer_sec            5.0
//          Action_IgniteEngine    SpinMotor1
//          Action_IgniteEngine    SpinMotor2
//          Action_IgniteSelf
//        end_sequencer
//      end_sequencer

   end_p6dof_object_type
```

- **演示要点**：演示 p6dof_object_type 的参数：object_graphical_type_num, use_spherical_earth, mass_properties, include

### p6dof_object_type（simple-icbm）｜

- **关键词**：p6dof_object_type, object_graphical_type_num, use_spherical_earth, fixed_object
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:1198-1203`
- **片段**：

```text
   p6dof_object_type  SimpleLatLon_Target   P6DOF_BASE_TYPE
      object_graphical_type_num     1088
      use_spherical_earth           true
      fixed_object                  true
      # No AeroData
   end_p6dof_object_type
```

- **演示要点**：演示 p6dof_object_type 的参数：object_graphical_type_num, use_spherical_earth, fixed_object

### p6dof_object_type（gbu-500）｜

- **关键词**：p6dof_object_type, include, mass_properties, sequencer
- **出处**：`p6dof/p6dof_types/weapons/gbu-500/gbu-500.txt:20-43`　（同签名共 2 处，另见 `p6dof/p6dof_types/weapons/ubu-500/ubu-500-hd.txt:19`）
- **片段**：

```text
   p6dof_object_type GBU-500 P6DOF_BASE_TYPE

      include aero/aero.txt                 # Defines the vehicle aerodynamics
      include controls/control_inputs.txt   # Defines the control inputs (stick, rudder, throttle, etc)
      include controls/flight_controls.txt  # Defines how the control inputs move the control surfaces

      mass_properties
         mass                              500.00000 lbs
         moment_of_inertia_ixx               1.53565 slug*ft^2
         moment_of_inertia_iyy              43.45092 slug*ft^2
         moment_of_inertia_izz              43.45092 slug*ft^2
         center_of_mass_x                   -0.00000 ft
         center_of_mass_y                   -0.00000 ft
         center_of_mass_z                    0.00000 ft
      end_mass_properties

      # Note: This vehicle lacks any propulsion system
      
      sequencer Release
         event_released_from_parent
         action_null
      end_sequencer

   end_p6dof_object_type
```

- **演示要点**：演示 p6dof_object_type 的参数：include, mass_properties, sequencer

### p6dof_object_type（tnk-f16-370g）｜

- **关键词**：p6dof_object_type, include, mass_properties, propulsion_data
- **出处**：`p6dof/p6dof_types/misc/tnk-f16-370g/tnk-f16-370g.txt:20-55`　（同签名共 8 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/a-lgt.txt:21`、`p6dof/p6dof_types/aircraft/fa-hvy/fa-hvy.txt:21`、`p6dof/p6dof_types/aircraft/b-fw/b-fw.txt:21`）
- **片段**：

```text
   p6dof_object_type TNK-F16-370G P6DOF_BASE_TYPE

      include aero/aero.txt                 # Defines the vehicle aerodynamics

      mass_properties
         mass                              200.00000 lbs
         moment_of_inertia_ixx               5.04840 slug*ft^2
         moment_of_inertia_iyy             179.64406 slug*ft^2
         moment_of_inertia_izz             179.84623 slug*ft^2
         center_of_mass_x                    0.00000 ft
         center_of_mass_y                    0.00000 ft
         center_of_mass_z                    0.00000 ft
      end_mass_properties

      propulsion_data

         # Current fuel tank support is limited to a single tank.
         # Future Mover Creator upgrades may support more complex, multi-tank fuel systems.

         fuel_tank  MainFuelTank
            max_fuel_quantity             2400.00000 lbs
            current_fuel_quantity         2400.00000 lbs
            max_flow_rate              1000000.00000 lbs/sec
            max_fill_rate              1000000.00000 lbs/sec
            max_xfer_rate              1000000.00000 lbs/sec
            cg_full_x                       -0.00000 ft
            cg_full_y                        0.00000 ft
            cg_full_z                        0.00360 ft
            cg_empty_x                      -0.00000 ft
            cg_empty_y                       0.00000 ft
            cg_empty_z                       0.00360 ft
         end_fuel_tank

      end_propulsion_data

   end_p6dof_object_type
```

- **演示要点**：演示 p6dof_object_type 的参数：include, mass_properties, propulsion_data

### p6dof_object_type（fa-lgt_external-tanks）｜

- **关键词**：p6dof_object_type, subobject, fuel_transfer, sequencer
- **出处**：`p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt_external-tanks.txt:22-63`
- **片段**：

```text
   p6dof_object_type FA-LGT-EXTERNAL-TANKS FA-LGT
   
      subobject TankLft TNK-F16-370G
         parent_rel_x        -1.0 ft
         parent_rel_y        -6.0 ft
         parent_rel_z         2.5 ft
         parent_rel_pitch    -1.0 deg
         separation_vz        2.0 ft/sec
         separation_omega_x   0.0 deg/sec
         separation_omega_y -45.0 deg/sec
         separation_omega_z   0.0 deg/sec
      end_subobject

      subobject TankRgt TNK-F16-370G
         parent_rel_x        -1.0 ft
         parent_rel_y         6.0 ft
         parent_rel_z         2.5 ft
         parent_rel_pitch    -1.0 deg
         separation_vz        2.0 ft/sec
         separation_omega_x   0.0 deg/sec
         separation_omega_y -45.0 deg/sec
         separation_omega_z   0.0 deg/sec
      end_subobject

      fuel_transfer LeftTankToMainXfer
         source_tank TankLft.MainFuelTank
         target_tank MainFuelTank
         #target_tank LeftWingTank   # Uncomment if using multiple internal tanks for FA-LGT
      end_fuel_transfer

      fuel_transfer RightTankToMainXfer
         source_tank TankRgt.MainFuelTank
         target_tank MainFuelTank
         #target_tank RightWingTank   # Uncomment if using multiple internal tanks for FA-LGT
      end_fuel_transfer

      sequencer DropExternalTanks
         action_jett_obj TankRgt
         action_jett_obj TankLft
      end_sequencer

   end_p6dof_object_type
```

- **演示要点**：演示 p6dof_object_type 的参数：subobject, fuel_transfer, sequencer

### p6dof_object_type（ubu-500-ld）｜

- **关键词**：p6dof_object_type, include, mass_properties
- **出处**：`p6dof/p6dof_types/weapons/ubu-500/ubu-500-ld.txt:20-36`
- **片段**：

```text
   p6dof_object_type UBU-500-LD P6DOF_BASE_TYPE

      include aero/aero.txt                 # Defines the vehicle aerodynamics

      mass_properties
         mass                              500.00000 lbs
         moment_of_inertia_ixx               0.67780 slug*ft^2
         moment_of_inertia_iyy              39.55762 slug*ft^2
         moment_of_inertia_izz              39.55762 slug*ft^2
         center_of_mass_x                    0.00000 ft
         center_of_mass_y                   -0.00000 ft
         center_of_mass_z                    0.00000 ft
      end_mass_properties

      # Note: This vehicle lacks any propulsion system

   end_p6dof_object_type
```

- **演示要点**：演示 p6dof_object_type 的参数：include, mass_properties

### p6dof_object_type（fa-lgt-zll）｜

- **关键词**：p6dof_object_type, subobject, sequencer
- **出处**：`p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt-zll.txt:29-64`　（同签名共 5 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/a-lgt-bombs.txt:18`、`p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt-bombs-ld.txt:22`、`p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt-bombs-hd.txt:22`）
- **片段**：

```text
   p6dof_object_type FA-LGT-ZLL FA-LGT
   
      subobject              ZellRocket SRB-RATO
         parent_rel_x          5.5 ft
         parent_rel_y          0.0 ft
         parent_rel_z          0.0 ft
 
         parent_rel_yaw        0.0 deg
         parent_rel_pitch      0.0 deg
         parent_rel_roll       0.0 deg

         separation_vx         0.0 ft/sec
         separation_vy         0.0 ft/sec
         separation_vz         5.0 ft/sec

         separation_omega_x    0.0 deg/sec
         separation_omega_y  -10.0 deg/sec
         separation_omega_z    0.0 deg/sec
      end_subobject

      sequencer  IgniteZellRocket
         event_timer                 4.9 sec
         action_ignite_subobject     ZellRocket
      end_sequencer
      
      sequencer  Launch
         event_timer                 5 sec
         action_jett_self
      end_sequencer
      
      sequencer  JettisonZellRocket
         event_timer                 8.0 sec
         action_jett_obj             ZellRocket
      end_sequencer

   end_p6dof_object_type
```

- **演示要点**：演示 p6dof_object_type 的参数：subobject, sequencer

### p6dof_object_types（p6dof_environment）｜

- **关键词**：p6dof_object_types, p6dof_atmosphere, p6dof_wind, p6dof_terrain, p6dof_gravity, p6dof_integrators
- **出处**：`p6dof/p6dof_types/environment/p6dof_environment.txt:35-43`
- **片段**：

```text
p6dof_object_types

   p6dof_atmosphere         atm_config.txt
   p6dof_wind               wind_config.txt
   p6dof_terrain            terrain_config.txt
   p6dof_gravity            gravity_config.txt
   p6dof_integrators        integrators_config.txt

end_p6dof_object_types
```

- **演示要点**：演示 p6dof_object_types 的参数：p6dof_atmosphere, p6dof_wind, p6dof_terrain, p6dof_gravity, p6dof_integrators

### p6dof_object_types（fa-lgt_landing-gear）｜

- **关键词**：p6dof_object_types, p6dof_object_type, landing_gear
- **出处**：`p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:20-156`
- **片段**：

```text
p6dof_object_types
   p6dof_object_type FA-LGT_Landing-Gear P6DOF_BASE_TYPE

      include aero/aero_landing_gear.txt
      include controls/control_inputs.txt
      include controls/flight_controls_landing_gear.txt

      mass_properties
         mass                            18900.00000 lbs
         moment_of_inertia_ixx            7166.47417 slug*ft^2
         moment_of_inertia_iyy           76887.57324 slug*ft^2
         moment_of_inertia_izz           81517.30433 slug*ft^2
         center_of_mass_x                    0.00000 ft
         center_of_mass_y                    0.00000 ft
         center_of_mass_z                   -0.00000 ft
      end_mass_properties

      propulsion_data

         engine Engine  F-L4-11A-1-TF
            rel_pos_x                       -7.71046 ft
            rel_pos_y                       -0.00000 ft
            rel_pos_z                       -0.13705 ft
            rel_yaw                          0.00000 deg
            rel_pitch                        0.00000 deg
            fuel_feed                   MainFuelTank
         end_engine

         # Current fuel tank support is limited to a single tank.
         # Future Mover Creator upgrades may support more complex, multi-tank fuel systems.

         fuel_tank  MainFuelTank
            max_fuel_quantity             7000.00000 lbs
            current_fuel_quantity         7000.00000 lbs
            max_flow_rate              1000000.00000 lbs/sec
            max_fill_rate              1000000.00000 lbs/sec
            max_xfer_rate              1000000.00000 lbs/sec
            cg_full_x                        0.68954 ft
            cg_full_y                       -0.00000 ft
            cg_full_z                       -0.13705 ft
            cg_empty_x                       0.68954 ft
            cg_empty_y                      -0.00000 ft
            cg_empty_z                      -0.13705 ft
         end_fuel_tank

         # Throttle controls:
         throttle_setting_mil         ThrottleMilitary
         throttle_setting_ab          ThrottleAfterburner
         throttle_setting_reverser    ThrottleThrustReverser

         # Thrust vectoring controls:
         #throttle_setting_yaw        ThrustVectoringYaw
         #throttle_setting_pitch      ThrustVectoringPitch

      end_propulsion_data
	  
	  landing_gear
         nws_enable_control_name              NWS_Enable

         nominal_height_above_ground_on_gear  5.5 ft

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

         ground_reaction_point LandingGear_3
            control_surface_name              Aft_Gear_Left
            braking_control_surface_name      LeftWheelBrake
            is_nose_gear                      false
            gear_extended_relative_position_x -2.89984 ft
            gear_extended_relative_position_y -5 ft
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
      end_landing_gear

   end_p6dof_object_type
end_p6dof_object_types
```

- **演示要点**：演示 p6dof_object_types 的参数：p6dof_object_type, landing_gear

### p6dof_object_types（Generic_ICBM_RocketEngines）｜

- **关键词**：p6dof_object_types, solid_propellant_rocket_type, liquid_propellant_rocket_type
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/Generic_ICBM_RocketEngines.txt:10-204`
- **片段**：

```text
p6dof_object_types
   solid_propellant_rocket_type   ICBM_Stage1_Rocket   P6DOF_SOLID_PROPELLANT_ROCKET

      thrust_vs_time_sealevel
        #time   normalized_thrust
        0.00    0.0
        0.05    90000.0
        0.20    180000.0
        1.0     200000.0
        61.0    200000.0
        61.37   20000.0
        63.0    1000.0
      end_thrust_vs_time_sealevel

      #  45000 0.05 8.4
      # 135000 0.15 75.8
      # 190000 0.80 569.3   @ 1sec burned 653.5 lbs leaving 45,096.5 lbs
      # @ 200,000 lbs burns 749.1 lbs/sec
      # With 60 sec additional burn, it burns 44,943.8 lbs, leaving 152.7 lbs
      # 110,000 0.37 burns 152.4 leaving 0.3 lbs
      # 60.37 sec nominal burn time

      isp_vs_alt
         #alt_feet     Isp
         0.0           267.0
         100000.0      272.0
         300000.0      278.0
      end_isp_vs_alt

      rated_thrust     200000.0 lbf
      propellant_mass  45750.0 lbs

   end_solid_propellant_rocket_type

   solid_propellant_rocket_type   ICBM_Stage2_Rocket   P6DOF_SOLID_PROPELLANT_ROCKET

      thrust_vs_time_sealevel
        #time   normalized_thrust
        0.0     0.0
        0.20    30000.0
        1.0     60000.0
        65.5    60000.0
        65.69   40000.0
        67.0    5000.0
      end_thrust_vs_time_sealevel

      # 15000 0.2  10.5
      # 45000 0.8  126.3  @ 1sec burned 136.8 lbs leaving 13,613.2 lbs
      # @ 60,000 lbs burns 210.5 lbs/sec
      # With 64.5 sec additional burn, it burns 13,578.9 lbs, leaving 34.3 lbs.
      # 50000 0.19 33.3 leaving 1 lbs
      # 65.69 sec nominal burn time

      isp_vs_alt
         #alt_feet     Isp
         0.0           285.0
         100000.0      290.0
         300000.0      295.0
      end_isp_vs_alt

      rated_thrust     60000.0 lbf
      propellant_mass  13750.0 lbs

   end_solid_propellant_rocket_type

   solid_propellant_rocket_type   ICBM_Stage3_Rocket   P6DOF_SOLID_PROPELLANT_ROCKET

      thrust_vs_time_sealevel
        #time   normalized_thrust
        0.00    0.0
        0.20    25000.0
        1.00    34000.0
        60.5    34000.0
        61.2    14000.0
        63.0    4000.0
      end_thrust_vs_time_sealevel

      # 12500 0.2 8.8
      # 29500 0.8 82.8  @ 1sec burned 91.6 lbs leaving 7158.4 lbs
      # @ 34,000 lbs burns 119.3 lbs/sec
      # With 59.5 sec additional burn, it burns 7098.2 lbs, leaving 60.2 lbs
      # 24000 0.7 58.9 leaving 1.3 lbs
      # 61.2 sec nominal burn time

      isp_vs_alt
         #alt_feet     Isp
         0.0           285.0
         100000.0      290.0
         300000.0      295.0
      end_isp_vs_alt

      rated_thrust     34000.0 lbf
      propellant_mass  7250.0 lbs

   end_solid_propellant_rocket_type


#  ------------------------------------------------------------------

   liquid_propellant_rocket_type   ICBM_PBV_MainEngine   P6DOF_LIQUID_PROPELLANT_ROCKET

      normalized_thrust_vs_alt
        #alt      normalized_thrust
        0.0       1.0
        300000.0  1.0
      end_normalized_thrust_vs_alt

      isp_vs_alt
         #alt_feet     Isp
         0.0           285.0
         100000.0      290.0
         300000.0      295.0
      end_isp_vs_alt

#     FuelFeed             *****

      max_thrust_sealevel    300.0 lbf

      normalized_spinup     100.0
      normalized_spindown   100.0

   end_liquid_propellant_rocket_type

   solid_propellant_rocket_type   ICBM_RV_SpinMotor   P6DOF_SOLID_PROPELLANT_ROCKET

      thrust_vs_time_vacuum
        #time    normalized_thrust
        0.00     0.0
        0.10     200.0
        3.0      200.0
        3.1      20.0
        3.2      1.0
      end_thrust_vs_time_vacuum

      #45.42 sec

      isp_vs_alt
         #alt_feet     Isp
         0.0           280.0
         300000.0      280.0
      end_isp_vs_alt

      rated_thrust     200.0 lbf
      propellant_mass  2.21 lbs

   end_solid_propellant_rocket_type

   solid_propellant_rocket_type   ICBM_NoseconeMotor1   P6DOF_SOLID_PROPELLANT_ROCKET

      thrust_vs_time_vacuum
        #time    normalized_thrust
        0.00     0.0
        0.10     500.0
        3.0      500.0
        3.1      30.0
        3.2      1.0
      end_thrust_vs_time_vacuum

      #45.42 sec

      isp_vs_alt
         #alt_feet     Isp
         0.0           250.0
         300000.0      250.0
      end_isp_vs_alt

      rated_thrust     150.0 lbf
      propellant_mass  6.0 lbs

   end_solid_propellant_rocket_type

   solid_propellant_rocket_type   ICBM_NoseconeMotor2   P6DOF_SOLID_PROPELLANT_ROCKET

      thrust_vs_time_vacuum
        #time    normalized_thrust
        0.00     0.0
        0.10     600.0
        3.0      600.0
        3.1      30.0
        3.2      1.0
      end_thrust_vs_time_vacuum

      #45.42 sec

      isp_vs_alt
        #alt_feet     Isp
        0.0           250.0
        300000.0      250.0
      end_isp_vs_alt

      rated_thrust     160.0 lbf
      propellant_mass  7.2 lbs

   end_solid_propellant_rocket_type
end_p6dof_object_types
```

- **演示要点**：演示 p6dof_object_types 的参数：solid_propellant_rocket_type, liquid_propellant_rocket_type

### p6dof_object_types（agm-mrc）｜

- **关键词**：p6dof_object_types, map_p6dof_object_to_platform
- **出处**：`p6dof/platforms/agm-mrc.txt:235-237`　（同签名共 8 处，另见 `p6dof/platforms/gbu-500.txt:130`、`p6dof/platforms/tnk-f16-370g.txt:27`、`p6dof/platforms/ubu-500-hd.txt:54`）
- **片段**：

```text
p6dof_object_types
   map_p6dof_object_to_platform AGM-MRC AGM-MRC
end_p6dof_object_types
```

- **演示要点**：演示 p6dof_object_types 的参数：map_p6dof_object_to_platform

### p6dof_object_types（ubu-500-ld）｜

- **关键词**：p6dof_object_types, p6dof_object_type
- **出处**：`p6dof/p6dof_types/weapons/ubu-500/ubu-500-ld.txt:19-37`　（同签名共 25 处，另见 `p6dof/p6dof_types/weapons/gbu-500/gbu-500.txt:19`、`p6dof/p6dof_types/weapons/ubu-500/ubu-500-hd.txt:18`、`p6dof/p6dof_types/misc/zell-launch-system/zell-launch-system.txt:12`）
- **片段**：

```text
p6dof_object_types
   p6dof_object_type UBU-500-LD P6DOF_BASE_TYPE

      include aero/aero.txt                 # Defines the vehicle aerodynamics

      mass_properties
         mass                              500.00000 lbs
         moment_of_inertia_ixx               0.67780 slug*ft^2
         moment_of_inertia_iyy              39.55762 slug*ft^2
         moment_of_inertia_izz              39.55762 slug*ft^2
         center_of_mass_x                    0.00000 ft
         center_of_mass_y                   -0.00000 ft
         center_of_mass_z                    0.00000 ft
      end_mass_properties

      # Note: This vehicle lacks any propulsion system

   end_p6dof_object_type
end_p6dof_object_types
```

- **演示要点**：演示 p6dof_object_types 的参数：p6dof_object_type

### p6dof_object_types（a-m4-22a-1-tf）｜

- **关键词**：p6dof_object_types, jet_engine_type
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/prop/jet_engines/a-m4-22a-1-tf/a-m4-22a-1-tf.txt:21-79`　（同签名共 7 处，另见 `p6dof/p6dof_types/aircraft/b-fw/prop/jet_engines/b-h4-40w-1-tf/b-h4-40w-1-tf.txt:21`、`p6dof/p6dof_types/aircraft/b-hvy/prop/jet_engines/b-h3-81a-1-tf/b-h3-81a-1-tf.txt:21`、`p6dof/p6dof_types/aircraft/c-hvy/prop/jet_engines/c-hj-41a-1-tf/c-hj-41a-1-tf.txt:21`）
- **片段**：

```text
p6dof_object_types

   jet_engine_type   A-M4-22A-1-TF   P6DOF_JET_ENGINE

      //-------------------------------------------------------------------------

      thrust_offset            -4.1500 ft

      //-------------------------------------------------------------------------

      inop_ref_area            12.6000 ft^2

      //-------------------------------------------------------------------------

      tsfc_idle_pph             0.3700  # lb/lb/hr
      tsfc_mil_pph              0.3700  # lb/lb/hr

      //-------------------------------------------------------------------------

      rated_thrust_idle      1200.0000 lbf
      rated_thrust_mil       9065.0000 lbf
      //-------------------------------------------------------------------------

      spin_up_table_mil_per_sec
         // throttle_level  spin_up_per_sec
                    0.0000               0.0500
                    0.2500               0.1625
                    0.5000               0.2750
                    0.7500               0.3875
                    1.0000               0.5000
      end_spin_up_table_mil_per_sec

      spin_down_table_mil_per_sec
         // throttle_level  spin_down_per_sec
                    0.0000               0.0500
                    0.2500               0.1625
                    0.5000               0.2750
                    0.7500               0.3875
                    1.0000               0.5000
      end_spin_down_table_mil_per_sec

      //-------------------------------------------------------------------------

      thrust_idle_alt_mach_table
         file data/thrust_idle_alt_mach.txt
      end_thrust_idle_alt_mach_table

      //-------------------------------------------------------------------------

      thrust_mil_alt_mach_table
         file data/thrust_mil_alt_mach.txt
      end_thrust_mil_alt_mach_table

      //-------------------------------------------------------------------------

      throttle_setting_mil    ThrottleMilitary
   end_jet_engine_type

end_p6dof_object_types
```

- **演示要点**：演示 p6dof_object_types 的参数：jet_engine_type

### p6dof_object_types（aim-sr-1-rkt）｜

- **关键词**：p6dof_object_types, solid_propellant_rocket_type
- **出处**：`p6dof/p6dof_types/misc/srb-rato/prop/solid_propellant_rockets/aim-sr-1-rkt/aim-sr-1-rkt.txt:21-105`　（同签名共 7 处，另见 `p6dof/p6dof_types/misc/srb-rato/prop/solid_propellant_rockets/rato-rkt/rato-rkt.txt:21`、`p6dof/p6dof_types/weapons/aam-mr/prop/solid_propellant_rockets/aim-mr-1-rkt/aim-mr-1-rkt.txt:21`、`p6dof/p6dof_types/weapons/aam-sr/prop/solid_propellant_rockets/aim-sr-1-rkt/aim-sr-1-rkt.txt:21`）
- **片段**：

```text
p6dof_object_types

   solid_propellant_rocket_type   AIM-SR-1-RKT   P6DOF_SOLID_PROPELLANT_ROCKET

      //-------------------------------------------------------------------------
      
      thrust_vs_time_sealevel
         // time    thrust_lbs
              0.000           0.000
              0.100        2800.000
              7.800        2400.000
              8.000           0.000
      end_thrust_vs_time_sealevel
      
      //-------------------------------------------------------------------------
      
      isp_vs_alt
         // alt          Isp
              0.0      240.000000
           5000.0      242.766560
          10000.0      245.230420
          15000.0      247.415200
          20000.0      249.343720
          25000.0      251.037580
          30000.0      252.517340
          35000.0      253.802480
          40000.0      255.076600
          45000.0      256.128340
          50000.0      256.955400
          55000.0      257.605800
          60000.0      258.117240
          65000.0      258.519460
          70000.0      258.842120
          75000.0      259.093700
          80000.0      259.289420
          85000.0      259.441940
          90000.0      259.561000
          95000.0      259.654100
         100000.0      259.727020
         105000.0      259.784220
         110000.0      259.830960
         115000.0      259.866980
         120000.0      259.894880
         125000.0      259.916580
         130000.0      259.933540
         135000.0      259.946840
         140000.0      259.957320
         145000.0      259.965620
         150000.0      259.972220
         155000.0      259.977400
         160000.0      259.981360
         165000.0      259.984620
         170000.0      259.987200
         175000.0      259.989300
         180000.0      259.991100
         185000.0      259.992600
         190000.0      259.993880
         195000.0      259.994940
         200000.0      259.995840
         210000.0      259.997220
         220000.0      259.998160
         230000.0      259.998800
         240000.0      259.999240
         250000.0      259.999520
         260000.0      259.999720
         270000.0      259.999820
         280000.0      259.999900
         400000.0      260.000000
      end_isp_vs_alt

      //-------------------------------------------------------------------------

      thrust_offset          -2.25 ft

      //-------------------------------------------------------------------------

      rated_thrust          2800.0 lbf

      //-------------------------------------------------------------------------

      propellant_mass         85.0 lbs

   end_solid_propellant_rocket_type

end_p6dof_object_types
```

- **演示要点**：演示 p6dof_object_types 的参数：solid_propellant_rocket_type

### p6dof_terrain（terrain_config）｜

- **关键词**：p6dof_terrain, region
- **出处**：`p6dof/p6dof_types/environment/terrain_config.txt:18-60`
- **片段**：

```text
p6dof_terrain

   region
      # Oahu, HI

      location
         # Honolulu Intl, PHNL
         lat    21.3178275
         lon  -157.92026310
         alt_ft  5.0
      end_location

      location
         # Kalaeloa, PHJR
         lat    21.3073539
         lon  -158.0703017
         alt_ft 30.0
      end_location

      location
         # Kaneohe Bay MCAS, PHNG
         lat    21.4504556
         lon  -157.7679486
         alt_ft 24.0
      end_location

      location
         # Wheeler AFB, HHI/PHHI
         lat     21.4814475
         lon   -158.0378379
         alt_ft 843.0
      end_location

      location
         # Dillingham, PHDH
         lat    21.5794736
         lon  -158.1972814
         alt_ft 14.0
      end_location

   end_region

end_p6dof_terrain
```

- **演示要点**：演示 p6dof_terrain 的参数：region

### phase（blue_asm_missile）｜

- **关键词**：phase, allow_route_following, commanded_altitude, commanded_speed, next_phase, maximum_pitch_angle, proportional_navigation_gain, velocity_pursuit_gain
- **出处**：`new_guidance/weapons/agm/blue_asm_missile.txt:70-100`
- **片段**：

```text
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
```

- **演示要点**：演示 phase 的参数：allow_route_following, commanded_altitude, commanded_speed, next_phase, maximum_pitch_angle, proportional_navigation_gain, velocity_pursuit_gain

### phase（mach_4_missile）｜

- **关键词**：phase, commanded_altitude, commanded_speed, maximum_pitch_angle, proportional_navigation_gain, maximum_commanded_g, next_phase
- **出处**：`base_types/weapons/agm/mach_4_missile.txt:101-108`
- **片段**：

```text
      phase CRUISE
         commanded_altitude      72000 ft
         commanded_speed         3950 fps #mach 4
         maximum_pitch_angle           40 deg
         proportional_navigation_gain  15.0
         maximum_commanded_g           2 g
         next_phase TERMINAL  when los_target_angle > 35 deg
      end_phase
```

- **演示要点**：演示 phase 的参数：commanded_altitude, commanded_speed, maximum_pitch_angle, proportional_navigation_gain, maximum_commanded_g, next_phase

### phase（ssm_missile）｜

- **关键词**：phase, commanded_altitude, commanded_speed, maximum_pitch_angle, proportional_navigation_gain, velocity_pursuit_gain, next_phase
- **出处**：`new_guidance/weapons/ssm/ssm_missile.txt:112-121`　（同签名共 2 处，另见 `new_guidance/weapons/ssm/ssm_missile.txt:98`）
- **片段**：

```text
      phase CRUISE
         commanded_altitude      68000 ft
         commanded_speed         2810 fps
         maximum_pitch_angle           30 deg
         proportional_navigation_gain  15.0
         velocity_pursuit_gain         10.0
         next_phase TERMINAL  when los_target_angle > 25 deg
#         next_phase TERMINAL when target_ground_range < 42 miles
#         next_phase TERMINAL  when los_target_elevation > -35 deg
      end_phase
```

- **演示要点**：演示 phase 的参数：commanded_altitude, commanded_speed, maximum_pitch_angle, proportional_navigation_gain, velocity_pursuit_gain, next_phase

### phase（agm-mrc）｜

- **关键词**：phase, commanded_altitude, commanded_speed, proportional_navigation_gain, velocity_pursuit_gain, lateral_g_bias, next_phase
- **出处**：`six_dof/platforms/agm-mrc.txt:113-122`
- **片段**：

```text
      phase FLANK
         commanded_altitude 150 ft
         commanded_speed 450 knots
         
         proportional_navigation_gain    4
         velocity_pursuit_gain           10
         lateral_g_bias                  0.1
         
         next_phase INGRESS when range_to_intercept < 50 km
      end_phase
```

- **演示要点**：演示 phase 的参数：commanded_altitude, commanded_speed, proportional_navigation_gain, velocity_pursuit_gain, lateral_g_bias, next_phase

### phase（agm-mrc）｜

- **关键词**：phase, commanded_speed, time_constant, proportional_navigation_gain, velocity_pursuit_gain, g_bias, next_phase
- **出处**：`six_dof/platforms/agm-mrc.txt:143-152`
- **片段**：

```text
      phase TERMINAL_LOFT
         commanded_speed 1000 knots

         time_constant                   0.01 sec
         proportional_navigation_gain    4
         velocity_pursuit_gain           10
         g_bias                          4
         
         next_phase TERMINAL when range_to_intercept < 5 km
      end_phase
```

- **演示要点**：演示 phase 的参数：commanded_speed, time_constant, proportional_navigation_gain, velocity_pursuit_gain, g_bias, next_phase

### phase（client_agm）｜

- **关键词**：phase, on_entry, maximum_commanded_g, commanded_speed, commanded_altitude, allow_route_following, next_phase
- **出处**：`swarm/weapons/agm/client_agm.txt:128-140`
- **片段**：

```text
        phase CLIENT_FLY  # Puts the client back on a course to the target
            on_entry
               #writeln("In CLIENT_FLY");
            end_on_entry
            maximum_commanded_g           1.3 g
            #maximum_descent_rate          5 fps
            #g_bias                         1.03
            commanded_speed                 100 m/s
            commanded_altitude              20000 ft
            allow_route_following          false
            next_phase CLIENT_TERMINAL  if target_ground_range < variable ClientNoDeviationRange m
            next_phase CLIENT_ALT_FLY if phase_time > 10 sec
        end_phase
```

- **演示要点**：演示 phase 的参数：on_entry, maximum_commanded_g, commanded_speed, commanded_altitude, allow_route_following, next_phase

### phase（red_mrbm_1）｜

- **关键词**：phase, commanded_flight_path_angle, proportional_navigation_gain, velocity_pursuit_gain, maximum_commanded_g, next_phase
- **出处**：`ballistic_missile_shootdown/weapons/ssm/red_mrbm_1.txt:301-307`　（同签名共 14 处，另见 `base_types/weapons/sam/blue_lr_sam_common.txt:269`、`base_types/weapons/sam/blue_sr_sam_common.txt:136`、`base_types/weapons/ssm/red_icbm_2.txt:309`）
- **片段**：

```text
   phase PITCH_OVER
      commanded_flight_path_angle      from_launch_computer
      proportional_navigation_gain     0.0                 # Don't guide to target
      velocity_pursuit_gain            0.0                 # Don't guide to target
      maximum_commanded_g              1.0 g
      next_phase BALLISTIC when on_commanded_flight_path_angle
   end_phase
```

- **演示要点**：演示 phase 的参数：commanded_flight_path_angle, proportional_navigation_gain, velocity_pursuit_gain, maximum_commanded_g, next_phase

### phase（hellfire_type）｜

- **关键词**：phase, g_bias, proportional_navigation_gain, velocity_pursuit_gain, use_program, next_phase
- **出处**：`hellfire/laser_designation_via_dis/hellfire_type.txt:228-234`　（同签名共 6 处，另见 `hellfire/semiactive_laser_hellfire/hellfire_type.txt:227`、`hellfire/laser_designation_via_dis/hellfire_type.txt:206`、`hellfire/semiactive_laser_hellfire/hellfire_type.txt:205`）
- **片段**：

```text
      phase CRUISE
         g_bias                       0.0
         proportional_navigation_gain 0.0
         velocity_pursuit_gain        0.0
         use_program cruise_attitude
         next_phase TERMINAL when sensor_track_initiated
      end_phase
```

- **演示要点**：演示 phase 的参数：g_bias, proportional_navigation_gain, velocity_pursuit_gain, use_program, next_phase

### phase（aam-mr）｜

- **关键词**：phase, time_constant, proportional_navigation_gain, velocity_pursuit_gain, g_bias, next_phase
- **出处**：`p6dof/platforms/aam-mr.txt:70-76`　（同签名共 38 处，另见 `p6dof/platforms/aam-mr.txt:78`、`p6dof/platforms/aam-mr.txt:86`、`p6dof/platforms/aam-mr.txt:94`）
- **片段**：

```text
      phase LAUNCH_GUIDANCE
         time_constant                   0.1 sec
         proportional_navigation_gain    0
         velocity_pursuit_gain           0
         g_bias                          0
         next_phase LEVEL when phase_time > 1 sec
      end_phase
```

- **演示要点**：演示 phase 的参数：time_constant, proportional_navigation_gain, velocity_pursuit_gain, g_bias, next_phase

### phase（mach_4_missile）｜

- **关键词**：phase, commanded_altitude, maximum_pitch_angle, proportional_navigation_gain, velocity_pursuit_gain, next_phase
- **出处**：`base_types/weapons/agm/mach_4_missile.txt:92-99`
- **片段**：

```text
      phase LAUNCH
         commanded_altitude      72000 ft
         maximum_pitch_angle           30 deg
         proportional_navigation_gain  15.0
         velocity_pursuit_gain         15.0
         next_phase TERMINAL if target_slant_range < 30 miles
         next_phase CRUISE when phase_time > 100 sec
      end_phase
```

- **演示要点**：演示 phase 的参数：commanded_altitude, maximum_pitch_angle, proportional_navigation_gain, velocity_pursuit_gain, next_phase

### phase（client_agm）｜

- **关键词**：phase, maximum_commanded_g, commanded_speed, commanded_altitude, allow_route_following, next_phase
- **出处**：`cyber/weapons/agm/client_agm.txt:105-112`
- **片段**：

```text
        phase CLIENT_FLY  // Puts the client back on a course to the target
            maximum_commanded_g           1.3 g
            commanded_speed                 100 m/s
            commanded_altitude              20000 ft
            allow_route_following          false
            next_phase CLIENT_TERMINAL  if target_ground_range < variable ClientNoDeviationRange m
            next_phase CLIENT_ALT_FLY if phase_time > 10 sec
        end_phase
```

- **演示要点**：演示 phase 的参数：maximum_commanded_g, commanded_speed, commanded_altitude, allow_route_following, next_phase

### phase（agm-mrc）｜

- **关键词**：phase, commanded_speed, time_constant, proportional_navigation_gain, velocity_pursuit_gain, g_bias
- **出处**：`six_dof/platforms/agm-mrc.txt:154-161`
- **片段**：

```text
      phase TERMINAL
         commanded_speed 1000 knots
         
         time_constant                   0 sec
         proportional_navigation_gain    4
         velocity_pursuit_gain           10
         g_bias                          1
      end_phase
```

- **演示要点**：演示 phase 的参数：commanded_speed, time_constant, proportional_navigation_gain, velocity_pursuit_gain, g_bias

### phase（ssm_missile）｜

- **关键词**：phase, commanded_speed, velocity_pursuit_gain, proportional_navigation_gain, maximum_pitch_angle, maximum_commanded_g
- **出处**：`new_guidance/weapons/ssm/ssm_missile.txt:154-162`
- **片段**：

```text
      phase TERMINAL
         #proportional_navigation_gain  40.0
         #omit_velocity_pursuit
         commanded_speed              2200 fps
         velocity_pursuit_gain        5.0
        proportional_navigation_gain  40
        maximum_pitch_angle           90 deg
        maximum_commanded_g           25 g
      end_phase
```

- **演示要点**：演示 phase 的参数：commanded_speed, velocity_pursuit_gain, proportional_navigation_gain, maximum_pitch_angle, maximum_commanded_g

### phase（agm-mrc）｜

- **关键词**：phase, commanded_altitude, commanded_speed, proportional_navigation_gain, velocity_pursuit_gain, next_phase
- **出处**：`six_dof/platforms/agm-mrc.txt:133-141`
- **片段**：

```text
      phase INGRESS
         commanded_altitude 150 ft
         commanded_speed 450 knots
         
         proportional_navigation_gain    4
         velocity_pursuit_gain           10
         
         next_phase TERMINAL_LOFT when range_to_intercept < 7 km
      end_phase
```

- **演示要点**：演示 phase 的参数：commanded_altitude, commanded_speed, proportional_navigation_gain, velocity_pursuit_gain, next_phase

### phase（sr_sam）｜

- **关键词**：phase, on_entry, if, maximum_commanded_g, commanded_flight_path_angle, next_phase
- **出处**：`cyber/weapons/sam/sr_sam.txt:80-92`　（同签名共 2 处，另见 `orwaca_iads/weapons/sam/sr_sam.txt:78`）
- **片段**：

```text
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
```

- **演示要点**：演示 phase 的参数：on_entry, if, maximum_commanded_g, commanded_flight_path_angle, next_phase

### phase（leader_agm）｜

- **关键词**：phase, on_entry, maximum_commanded_g, allow_route_following, next_phase, on_exit
- **出处**：`cyber/weapons/agm/leader_agm.txt:101-143`　（同签名共 3 处，另见 `swarm/weapons/agm/leader_agm.txt:110`、`cyber/weapons/agm/client_agm.txt:114`）
- **片段**：

```text
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
```

- **演示要点**：演示 phase 的参数：on_entry, maximum_commanded_g, allow_route_following, next_phase, on_exit

### phase（mach_4_missile）｜

- **关键词**：phase, commanded_speed, proportional_navigation_gain, maximum_pitch_angle, maximum_commanded_g
- **出处**：`base_types/weapons/agm/mach_4_missile.txt:110-115`　（同签名共 2 处，另见 `base_types/weapons/ssm/blue_cruise_missile.txt:90`）
- **片段**：

```text
      phase TERMINAL
         commanded_speed              2200 fps
        proportional_navigation_gain  40
        maximum_pitch_angle           90 deg
        maximum_commanded_g           4 g
      end_phase
```

- **演示要点**：演示 phase 的参数：commanded_speed, proportional_navigation_gain, maximum_pitch_angle, maximum_commanded_g

### phase（blue_cruise_missile）｜

- **关键词**：phase, commanded_altitude, commanded_speed, maximum_commanded_g, next_phase
- **出处**：`base_types/weapons/ssm/blue_cruise_missile.txt:83-88`　（同签名共 3 处，另见 `cyber/weapons/agm/leader_agm.txt:93`、`swarm/weapons/agm/leader_agm.txt:96`）
- **片段**：

```text
     phase CRUISE
        commanded_altitude     500 ft agl
        commanded_speed        910 fps
        maximum_commanded_g    2 g
        next_phase TERMINAL    if target_slant_range < 1 miles
     end_phase
```

- **演示要点**：演示 phase 的参数：commanded_altitude, commanded_speed, maximum_commanded_g, next_phase

### phase（red_mrbm_3）｜

- **关键词**：phase, g_bias, maximum_commanded_g, guidance_delay, next_phase
- **出处**：`base_types/weapons/ssm/red_mrbm_3.txt:275-280`　（同签名共 20 处，另见 `base_types/weapons/ssm/red_mrbm_3.txt:282`、`base_types/weapons/ssm/red_mrbm_3.txt:289`、`base_types/weapons/ssm/red_mrbm_3.txt:295`）
- **片段**：

```text
   phase 1100-1200
       g_bias                  1.4 #
       maximum_commanded_g     1 g #
       guidance_delay          8 sec
       next_phase TERMINAL when phase_time > 101 secs # burnout time
   end_phase
```

- **演示要点**：演示 phase 的参数：g_bias, maximum_commanded_g, guidance_delay, next_phase

### phase（hellfire）｜

- **关键词**：phase, g_bias, proportional_navigation_gain, velocity_pursuit_gain, next_phase
- **出处**：`laser_designator/weapons/agm/hellfire.txt:41-46`　（同签名共 4 处，另见 `six_dof/platforms/agm-mrc.txt:106`、`hellfire/laser_designation_via_dis/hellfire_type.txt:198`、`hellfire/semiactive_laser_hellfire/hellfire_type.txt:197`）
- **片段**：

```text
      phase LAUNCH         
         g_bias                       0.0
         proportional_navigation_gain 0.0
         velocity_pursuit_gain        0.0
         next_phase PITCH_UP when flight_time >= 0.15 sec
      end_phase
```

- **演示要点**：演示 phase 的参数：g_bias, proportional_navigation_gain, velocity_pursuit_gain, next_phase

### phase（hellfire_type）｜

- **关键词**：phase, proportional_navigation_gain, velocity_pursuit_gain, g_bias, lateral_g_bias
- **出处**：`hellfire/laser_designation_via_dis/hellfire_type.txt:236-241`　（同签名共 2 处，另见 `hellfire/semiactive_laser_hellfire/hellfire_type.txt:235`）
- **片段**：

```text
      phase TERMINAL
         proportional_navigation_gain 5.0
         velocity_pursuit_gain        2.0
         g_bias                      12.0
         lateral_g_bias               0.0
      end_phase
```

- **演示要点**：演示 phase 的参数：proportional_navigation_gain, velocity_pursuit_gain, g_bias, lateral_g_bias

### phase（aam-mr）｜

- **关键词**：phase, time_constant, proportional_navigation_gain, velocity_pursuit_gain, g_bias
- **出处**：`p6dof/platforms/aam-mr.txt:102-107`　（同签名共 15 处，另见 `p6dof/platforms/aam-sr-tvc.txt:86`、`p6dof/platforms/aam-sr.txt:93`、`p6dof/platforms/gbu-500.txt:119`）
- **片段**：

```text
      phase TERMINAL_GUIDANCE
         time_constant                   0.01 sec
         proportional_navigation_gain    4
         velocity_pursuit_gain           4
         g_bias                          1
      end_phase
```

- **演示要点**：演示 phase 的参数：time_constant, proportional_navigation_gain, velocity_pursuit_gain, g_bias

### phase（blue_adv_cruise_missile）｜

- **关键词**：phase, maximum_commanded_g, maximum_descent_rate, g_bias, next_phase
- **出处**：`base_types/weapons/agm/blue_adv_cruise_missile.txt:90-96`
- **片段**：

```text
        phase GLIDE
            maximum_commanded_g           3 g
            maximum_descent_rate          5 fps
            g_bias                         1.03
            #next_phase TERMINAL  when los_target_angle > 25 deg
            next_phase TERMINAL  when target_slant_range < 5 nm
        end_phase
```

- **演示要点**：演示 phase 的参数：maximum_commanded_g, maximum_descent_rate, g_bias, next_phase

### phase（blue_naval_sam）｜

- **关键词**：phase, commanded_flight_path_angle, proportional_navigation_gain, velocity_pursuit_gain, next_phase
- **出处**：`ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:143-150`　（同签名共 3 处，另见 `base_types/weapons/sam/blue_naval_sam.txt:141`、`space_operations/weapons/blue_naval_sam.txt:143`）
- **片段**：

```text
      phase LAUNCH
         commanded_flight_path_angle     from_launch_computer
         proportional_navigation_gain    0.0                 # Don't guide to target
         velocity_pursuit_gain           0.0                 # Don't guide to target

         next_phase TERMINAL if target_slant_range < 200 km # 150 km
         next_phase MIDCOURSE if on_commanded_flight_path_angle
      end_phase
```

- **演示要点**：演示 phase 的参数：commanded_flight_path_angle, proportional_navigation_gain, velocity_pursuit_gain, next_phase

### phase（client_agm）｜

- **关键词**：phase, on_entry, proportional_navigation_gain, maximum_pitch_angle, maximum_commanded_g
- **出处**：`swarm/weapons/agm/client_agm.txt:220-227`　（同签名共 3 处，另见 `cyber/weapons/agm/leader_agm.txt:145`、`swarm/weapons/agm/leader_agm.txt:166`）
- **片段**：

```text
         phase CLIENT_TERMINAL
           on_entry
               #writeln("In CLIENT_TERMINAL");
            end_on_entry
           proportional_navigation_gain  5 # 10
           maximum_pitch_angle           80 deg
           maximum_commanded_g           10 g
         end_phase
```

- **演示要点**：演示 phase 的参数：on_entry, proportional_navigation_gain, maximum_pitch_angle, maximum_commanded_g

### phase（agm-mrc）｜

- **关键词**：phase, allow_route_following, proportional_navigation_gain, velocity_pursuit_gain, next_phase
- **出处**：`six_dof/platforms/agm-mrc.txt:124-131`
- **片段**：

```text
      phase CRUISE
         allow_route_following on
         
         proportional_navigation_gain    4
         velocity_pursuit_gain           10
         
         next_phase INGRESS when target_ground_range < 20 km
      end_phase
```

- **演示要点**：演示 phase 的参数：allow_route_following, proportional_navigation_gain, velocity_pursuit_gain, next_phase

### phase（blue_asm_missile）｜

- **关键词**：phase, commanded_altitude, next_phase, proportional_navigation_gain, velocity_pursuit_gain
- **出处**：`new_guidance/weapons/agm/blue_asm_missile.txt:102-110`
- **片段**：

```text
      phase POPUP
         # Command a ridiculous altitude... we just go up until the target
         # elevation angle is correct...

         commanded_altitude 6000 m
         next_phase DIVE when target_elevation < -20 deg
         proportional_navigation_gain  10.0
         velocity_pursuit_gain         5.0
      end_phase
```

- **演示要点**：演示 phase 的参数：commanded_altitude, next_phase, proportional_navigation_gain, velocity_pursuit_gain

### phase（blue_naval_sam）｜

- **关键词**：phase, proportional_navigation_gain, proportional_navigation_method, velocity_pursuit_gain, g_bias
- **出处**：`ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:157-168`　（同签名共 5 处，另见 `base_types/weapons/sam/blue_lr_sam_common.txt:283`、`base_types/weapons/sam/blue_naval_sam.txt:155`、`base_types/weapons/sam/blue_sr_sam_common.txt:150`）
- **片段**：

```text
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
```

- **演示要点**：演示 phase 的参数：proportional_navigation_gain, proportional_navigation_method, velocity_pursuit_gain, g_bias

### phase（client_agm）｜

- **关键词**：phase, on_entry, maximum_commanded_g, commanded_speed, next_phase
- **出处**：`cyber/weapons/agm/client_agm.txt:89-104`　（同签名共 2 处，另见 `swarm/weapons/agm/client_agm.txt:107`）
- **片段**：

```text
        phase CLIENT_INITIAL
            on_entry             
               // Immediately go to some random bearing away from the track.
               // This will separate the clients out from each other
               SetAllowRouteFollowing(true);
               double newheading = RANDOM.Uniform(0, 360);
               WsfGeoPoint NewPoint = PLATFORM.Location();
               NewPoint.Extrapolate(newheading, 5000);
               WsfRoute NR = WsfRoute.Create("NewRoute");
               NR.Append(NewPoint, ClientCommandedAlt);
               PLATFORM.SetRoute(NR);
            end_on_entry
            maximum_commanded_g            10 g
            commanded_speed                 100 m/s
            next_phase CLIENT_FLY when phase_time > 10 sec
        end_phase
```

- **演示要点**：演示 phase 的参数：on_entry, maximum_commanded_g, commanded_speed, next_phase

### phase（client_agm）｜

- **关键词**：phase, on_entry, maximum_commanded_g, allow_route_following, next_phase
- **出处**：`swarm/weapons/agm/client_agm.txt:142-218`
- **片段**：

```text
        phase CLIENT_ALT_FLY
           on_entry
              SetAllowRouteFollowing(true);
              WsfTrack targetTrack = PLATFORM.CurrentTargetTrack();
              if( ! targetTrack.IsValid())
              {
               SelectPhase("CLIENT_TERMINAL");
              }
              double CurrentSpeed = PLATFORM.Speed();
              double CurrentAlt   = PLATFORM.Altitude(); # meters above sea level
              double targetRelativeBearing = PLATFORM.RelativeBearingTo(targetTrack);
              WsfPlatform Leader = WsfSimulation.FindPlatform("bomber_leader_agm_1"); # Use this if the bomber launched us.
              if(! Leader.IsValid() || ! targetTrack.IsValid() || Leader.IsNull())
              {
               SelectPhase("CLIENT_TERMINAL");
              }
              double leaderRelativeBearing = PLATFORM.RelativeBearingTo(Leader);

              #WsfPlatform Leader = PLATFORM.Commander(); # Only if the bomber spawned us.
              #if (MATH.Fabs(PLATFORM.RelativeBearingTo(LeaderTrack)) < 6)

              if (leaderRelativeBearing < -15)  leaderRelativeBearing = leaderRelativeBearing + 360;

              if ((Leader.IsValid())  && (PLATFORM.SlantRangeTo(Leader) < ClientMinRangeToLeader))
              {
##                 # Randomly turn away from the leader
                 double newspeed = RANDOM.Uniform(ClientMinVel, ClientMaxVel);
                 double newalt = RANDOM.Uniform((CurrentAlt - ClientMaxAltDeviation),(CurrentAlt + ClientMaxAltDeviation));
                 double newheading = RANDOM.Uniform(0,360);
                 WsfGeoPoint NewPoint = PLATFORM.Location();
                 NewPoint.Extrapolate(newheading, 5000);
                 WsfRoute NR1 = WsfRoute.Create("NewRoute1");
                 if(newalt > CurrentAlt) # This is to prevent stalling out
                 {
                    newspeed = ClientMinClimbVel;
                 }
                 NR1.Append(NewPoint, newspeed);
                 PLATFORM.SetRoute(NR1);
                 SetCommandedAltitude(newalt);
              }
              if ((Leader.IsValid())  && (PLATFORM.SlantRangeTo(Leader) > ClientMaxRangeToLeader))
              {
                 #SetAllowRouteFollowing(true);
                 double newspeed = RANDOM.Uniform(ClientMinVel, ClientMaxVel);
                 double newalt = RANDOM.Uniform((Leader.Altitude() - ClientMaxAltDeviation),(Leader.Altitude() + ClientMaxAltDeviation));
                 if (newalt < (ClientCommandedAlt / 2))
                 {
                    newalt = newalt + ClientMaxAltDeviation; # This prevents the cliant alt from getting too low if the leader already is in terminal
                 }

                 SetCommandedAltitude(newalt);
                 double newheading = RANDOM.Uniform((leaderRelativeBearing - 5),(leaderRelativeBearing + 5));
                 #double newheading = MATH.Fabs(leaderRelativeBearing);
                 if (newheading < 0) newheading = newheading + 360;

                 WsfGeoPoint NewPoint = Leader.Location();

                 NewPoint.Extrapolate(newheading, 8550);
#                  WsfDraw draw = WsfDraw();
#                  draw.BeginCircle(0, 400.0);
#                  draw.Vertex(NewPoint);
#                 draw.End();
                 WsfRoute NR2 = WsfRoute.Create("NewRoute2");
                 if(newalt > CurrentAlt) # This is to prevent stalling out
                 {
                    newspeed = ClientMinClimbVel;
                 }
                 NR2.Append(NewPoint, newspeed);
                 PLATFORM.SetRoute(NR2);

              }
           end_on_entry
           maximum_commanded_g           4.5 g
           allow_route_following          true
           next_phase CLIENT_TERMINAL  if target_ground_range < variable ClientNoDeviationRange m
           next_phase CLIENT_FLY if phase_time > variable PhaseTimeAltFly sec # 22 - 28 secs
         end_phase
```

- **演示要点**：演示 phase 的参数：on_entry, maximum_commanded_g, allow_route_following, next_phase

### phase（red_mrbm_3）｜

- **关键词**：phase, g_bias, maximum_commanded_g, next_phase
- **出处**：`base_types/weapons/ssm/red_mrbm_3.txt:265-269`　（同签名共 3 处，另见 `base_types/weapons/ssm/red_mrbm_3.txt:270`、`air_to_air/weapons/aam/medium_range_radar_missile.txt:164`）
- **片段**：

```text
   phase 200-1000
       g_bias                  1.1 # 200-1000
       maximum_commanded_g     4 g # 200-1000
       next_phase TERMINAL when phase_time > 101 secs # burnout time
   end_phase
```

- **演示要点**：演示 phase 的参数：g_bias, maximum_commanded_g, next_phase

### phase（medium_range_radar_missile）｜

- **关键词**：phase, proportional_navigation_gain, velocity_pursuit_gain, g_bias
- **出处**：`air_to_air/weapons/aam/medium_range_radar_missile.txt:170-174`
- **片段**：

```text
     phase TERMINAL
         proportional_navigation_gain  5.0
         velocity_pursuit_gain         5.0
         g_bias                        1.0
     end_phase 
```

- **演示要点**：演示 phase 的参数：proportional_navigation_gain, velocity_pursuit_gain, g_bias

### phase（blue_adv_cruise_missile）｜

- **关键词**：phase, proportional_navigation_gain, maximum_pitch_angle, maximum_commanded_g
- **出处**：`base_types/weapons/agm/blue_adv_cruise_missile.txt:98-102`　（同签名共 2 处，另见 `cyber/weapons/agm/client_agm.txt:186`）
- **片段**：

```text
         phase TERMINAL
           proportional_navigation_gain  5 # 10
           maximum_pitch_angle           80 deg
           maximum_commanded_g           10 g
         end_phase
```

- **演示要点**：演示 phase 的参数：proportional_navigation_gain, maximum_pitch_angle, maximum_commanded_g

### phase（blue_cruise_missile）｜

- **关键词**：phase, commanded_altitude, commanded_flight_path_angle, next_phase
- **出处**：`base_types/weapons/ssm/blue_cruise_missile.txt:77-81`
- **片段**：

```text
     phase LAUNCH
        commanded_altitude    5000 ft
        commanded_flight_path_angle 60 deg
        next_phase CRUISE when phase_time > 16 sec
     end_phase
```

- **演示要点**：演示 phase 的参数：commanded_altitude, commanded_flight_path_angle, next_phase

### phase（red_icbm_1）｜

- **关键词**：phase, guidance_delay, commanded_flight_path_angle, next_phase
- **出处**：`base_types/weapons/ssm/red_icbm_1.txt:213-217`
- **片段**：

```text
   phase LIFTOFF
      guidance_delay                   5.0 sec
      commanded_flight_path_angle      89.9 deg
      next_phase PITCH_OVER when phase_time >= 5.0 sec
   end_phase
```

- **演示要点**：演示 phase 的参数：guidance_delay, commanded_flight_path_angle, next_phase

### phase（sr_sam）｜

- **关键词**：phase, maximum_commanded_g, commanded_flight_path_angle, next_phase
- **出处**：`cyber/weapons/sam/sr_sam.txt:94-98`　（同签名共 2 处，另见 `orwaca_iads/weapons/sam/sr_sam.txt:92`）
- **片段**：

```text
   phase SHORT_RANGE
      maximum_commanded_g 40 g
      commanded_flight_path_angle   20 deg
      next_phase MIDCOURSE when on_commanded_flight_path_angle
   end_phase
```

- **演示要点**：演示 phase 的参数：maximum_commanded_g, commanded_flight_path_angle, next_phase

### phase（leader_agm）｜

- **关键词**：phase, maximum_commanded_g, commanded_speed, next_phase
- **出处**：`cyber/weapons/agm/leader_agm.txt:87-92`　（同签名共 2 处，另见 `swarm/weapons/agm/leader_agm.txt:87`）
- **片段**：

```text
        phase INITIAL
            maximum_commanded_g            10 g
            commanded_speed                 100 m/s

            next_phase FLY when phase_time > 5 sec
        end_phase
```

- **演示要点**：演示 phase 的参数：maximum_commanded_g, commanded_speed, next_phase

### phase（alv）｜

- **关键词**：phase, on_entry, maximum_commanded_g, next_phase
- **出处**：`alv_routing/platforms/alv.txt:113-119`　（同签名共 2 处，另见 `satellite_demos/scenarios/gps_denied.txt:175`）
- **片段**：

```text
      phase TERMINAL1
         on_entry
            SetCommandedAltitude(11000);
         end_on_entry
         maximum_commanded_g 15 g
         next_phase FINAL_DIVE when target_ground_range <= 7 km
      end_phase
```

- **演示要点**：演示 phase 的参数：on_entry, maximum_commanded_g, next_phase

### phase（script_demo_7）｜

- **关键词**：phase, on_entry, commanded_speed, next_phase
- **出处**：`script_demos/script_demo_7.txt:152-158`　（同签名共 2 处，另见 `script_demos/script_demo_7.txt:136`）
- **片段**：

```text
      phase LOWALT
         on_entry
            SetCommandedAltitudeAGL(LowAlt);
         end_on_entry
         commanded_speed          537 mph
         next_phase TERMINAL when target_ground_range < 1000 m
      end_phase
```

- **演示要点**：演示 phase 的参数：on_entry, commanded_speed, next_phase

### phase（blue_naval_sam）｜

- **关键词**：phase, guidance_delay, next_phase
- **出处**：`ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:152-155`　（同签名共 27 处，另见 `base_types/weapons/sam/blue_naval_sam.txt:150`、`base_types/weapons/sam/blue_sr_sam_common.txt:131`、`cyber/weapons/agm/client_agm.txt:85`）
- **片段**：

```text
      phase MIDCOURSE
         guidance_delay       2000 secs # stay on commanded loft angle
         next_phase TERMINAL when target_slant_range < 100 km #250 km
      end_phase
```

- **演示要点**：演示 phase 的参数：guidance_delay, next_phase

### phase（blue_adv_cruise_missile）｜

- **关键词**：phase, maximum_commanded_g, next_phase
- **出处**：`base_types/weapons/agm/blue_adv_cruise_missile.txt:85-88`
- **片段**：

```text
        phase LAUNCH
            maximum_commanded_g          1.2 g
            next_phase GLIDE when phase_time > 10 sec
        end_phase
```

- **演示要点**：演示 phase 的参数：maximum_commanded_g, next_phase

### phase（lrsam）｜

- **关键词**：phase, proportional_navigation_gain, g_bias
- **出处**：`engage/weapons/lrsam.txt:37-40`
- **片段**：

```text
   phase TERMINAL
      proportional_navigation_gain     4.0
      g_bias                           1.0
   end_phase
```

- **演示要点**：演示 phase 的参数：proportional_navigation_gain, g_bias

### phase（hellfire）｜

- **关键词**：phase, g_bias, next_phase
- **出处**：`laser_designator/weapons/agm/hellfire.txt:47-50`
- **片段**：

```text
      phase PITCH_UP
         g_bias                                   2
         next_phase TERMINAL if target_slant_range < 5000 meter
      end_phase
```

- **演示要点**：演示 phase 的参数：g_bias, next_phase

### phase（elr_sam）｜

- **关键词**：phase, commanded_flight_path_angle, next_phase
- **出处**：`orwaca_iads/weapons/sam/elr_sam.txt:93-96`　（同签名共 4 处，另见 `orwaca_iads/weapons/sam/lr_sam.txt:93`、`orwaca_iads/weapons/sam/mr_sam.txt:93`、`wargame/weapons/sam/sam.txt:80`）
- **片段**：

```text
   phase PITCH_OVER
      commanded_flight_path_angle   55 deg
      next_phase MIDCOURSE when on_commanded_flight_path_angle
   end_phase
```

- **演示要点**：演示 phase 的参数：commanded_flight_path_angle, next_phase

### phase（ssm_base）｜

- **关键词**：phase, program, next_phase
- **出处**：`signature_demos/movers/ssm_base.txt:99-102`　（同签名共 35 处，另见 `space_operations/launch_vehicles/delta_iv_m/delta_iv_m_base.txt:109`、`space_operations/launch_vehicles/falcon_heavy/falcon_heavy_base.txt:224`、`space_operations/launch_vehicles/launcher_one/launcher_one_base.txt:159`）
- **片段**：

```text
   phase LIFTOFF
      program NULL_PROGRAM end_program
      next_phase PITCH_OVER when speed > 75 m/s
   end_phase
```

- **演示要点**：演示 phase 的参数：program, next_phase

### phase（sam）｜

- **关键词**：phase, proportional_navigation_gain, next_phase
- **出处**：`wargame/weapons/sam/sam.txt:85-89`　（同签名共 6 处，另见 `orwaca_iads/weapons/sam/elr_sam.txt:98`、`orwaca_iads/weapons/sam/lr_sam.txt:98`、`orwaca_iads/weapons/sam/mr_sam.txt:98`）
- **片段**：

```text
   phase MIDCOURSE

      proportional_navigation_gain  4.0
      next_phase TERMINAL when time_to_intercept < 10 sec
   end_phase
```

- **演示要点**：演示 phase 的参数：proportional_navigation_gain, next_phase

### phase（saturn_v_complex）｜

- **关键词**：phase, on_entry, program
- **出处**：`space_operations/launch_vehicles/saturn_v/saturn_v_complex.txt:367-372`　（同签名共 3 处，另见 `space_operations/launch_vehicles/saturn_v/saturn_v_simple.txt:251`、`space_operations/launch_vehicles/launcher_one/launcher_one_base.txt:179`）
- **片段**：

```text
      phase IN_ORBIT
         on_entry
            writeln("***** IN ORBIT, Alt=", PLATFORM.Altitude());
         end_on_entry
         program NULL_PROGRAM end_program        # No guidance
      end_phase
```

- **演示要点**：演示 phase 的参数：on_entry, program

### phase（red_mrbm_1）｜

- **关键词**：phase, on_entry, guidance_delay
- **出处**：`ballistic_missile_shootdown/weapons/ssm/red_mrbm_1.txt:311-318`　（同签名共 9 处，另见 `base_types/weapons/ssm/red_icbm_2.txt:319`、`base_types/weapons/ssm/red_mrbm_1.txt:311`、`base_types/weapons/ssm/red_mrbm_2.txt:171`）
- **片段**：

```text
   phase BALLISTIC
      # Turn the guidance processor off once pure ballistic mode is started.
      # This shaves several percent off the processor time.
      on_entry
        TurnOff();
      end_on_entry
      guidance_delay                   2000.0 sec
   end_phase
```

- **演示要点**：演示 phase 的参数：on_entry, guidance_delay

### phase（alv）｜

- **关键词**：phase, on_entry, next_phase
- **出处**：`alv_routing/platforms/alv.txt:76-99`　（同签名共 2 处，另见 `satellite_demos/scenarios/gps_denied.txt:135`）
- **片段**：

```text
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
```

- **演示要点**：演示 phase 的参数：on_entry, next_phase

### phase（alv）｜

- **关键词**：phase, next_phase
- **出处**：`alv_routing/platforms/alv.txt:72-74`　（同签名共 3 处，另见 `satellite_demos/scenarios/gps_denied.txt:131`、`base_types/weapons/ssm/red_mrbm_3.txt:240`）
- **片段**：

```text
      phase DROP
         next_phase CRUISE when phase_time >= .1 sec
      end_phase
```

- **演示要点**：演示 phase 的参数：next_phase

### phase（alv）｜

- **关键词**：phase, maximum_commanded_g
- **出处**：`alv_routing/platforms/alv.txt:120-122`　（同签名共 4 处，另见 `base_types/weapons/ssm/red_mrbm_3.txt:403`、`satellite_demos/scenarios/gps_denied.txt:184`、`script_demos/script_demo_7.txt:159`）
- **片段**：

```text
      phase  FINAL_DIVE
         maximum_commanded_g 10 g
      end_phase
```

- **演示要点**：演示 phase 的参数：maximum_commanded_g

### phase（red_icbm_1）｜

- **关键词**：phase, guidance_delay
- **出处**：`base_types/weapons/ssm/red_icbm_1.txt:232-234`　（同签名共 4 处，另见 `base_types_nx/weapons/ssm/blue_slbm.txt:138`、`signature_demos/platforms/rocket.txt:64`、`parachute/parachute_example.txt:56`）
- **片段**：

```text
   phase BALLISTIC
      guidance_delay                   5000.0 sec
   end_phase
```

- **演示要点**：演示 phase 的参数：guidance_delay

### phase（hellfire）｜

- **关键词**：phase, guidance_target
- **出处**：`laser_designator/weapons/agm/hellfire.txt:51-53`
- **片段**：

```text
      phase TERMINAL
         guidance_target truth         
      end_phase
```

- **演示要点**：演示 phase 的参数：guidance_target

### phase（blue_asm_missile）｜

- **关键词**：phase, velocity_pursuit_gain
- **出处**：`new_guidance/weapons/agm/blue_asm_missile.txt:112-114`
- **片段**：

```text
      phase DIVE
         velocity_pursuit_gain         5.0
      end_phase
```

- **演示要点**：演示 phase 的参数：velocity_pursuit_gain

### phase（atlas_v_401_base）｜

- **关键词**：phase, program
- **出处**：`space_operations/launch_vehicles/atlas_v_401/atlas_v_401_base.txt:180-182`　（同签名共 4 处，另见 `space_operations/launch_vehicles/delta_iv_m/delta_iv_m_base.txt:132`、`space_operations/launch_vehicles/falcon_9/falcon_9_base.txt:190`、`space_operations/launch_vehicles/falcon_heavy/falcon_heavy_base.txt:253`）
- **片段**：

```text
      phase ORBIT
         program NULL_PROGRAM end_program        # No guidance
      end_phase
```

- **演示要点**：演示 phase 的参数：program

### phase（sam）｜

- **关键词**：phase, proportional_navigation_gain
- **出处**：`wargame/weapons/sam/sam.txt:91-94`　（同签名共 6 处，另见 `orwaca_iads/weapons/sam/elr_sam.txt:106`、`orwaca_iads/weapons/sam/lr_sam.txt:106`、`orwaca_iads/weapons/sam/mr_sam.txt:106`）
- **片段**：

```text
   phase TERMINAL

      proportional_navigation_gain  4.0
   end_phase
```

- **演示要点**：演示 phase 的参数：proportional_navigation_gain

### phase（alv）｜

- **关键词**：phase, on_entry
- **出处**：`alv_routing/platforms/alv.txt:100-112`　（同签名共 3 处，另见 `satellite_demos/scenarios/gps_denied.txt:161`、`script_demos/script_demo_7.txt:121`）
- **片段**：

```text
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
```

- **演示要点**：演示 phase 的参数：on_entry

### phase（proton-m）｜

- **关键词**：phase
- **出处**：`space_operations/launch_vehicles/proton_m/proton-m.txt:175-176`
- **片段**：

```text
      phase IN_ORBIT
      end_phase
```

- **演示要点**：演示 phase（最小结构，无子参数）

### pid_alpha（autopilot_config）｜

- **关键词**：pid_alpha, kp, ki, kd, max_error_accum, low_pass_alpha
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:45-51`　（同签名共 43 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/controls/hw_autopilot_config.txt:45`、`p6dof/p6dof_types/aircraft/b-fw/controls/autopilot_config.txt:45`、`p6dof/p6dof_types/aircraft/b-fw/controls/hw_autopilot_config.txt:45`）
- **片段**：

```text
    pid_alpha
      kp 0.144695
      ki 1.73862e-08
      kd 0.0343042
      max_error_accum 0
      low_pass_alpha 0.7
    end_pid_alpha
```

- **演示要点**：演示 pid_alpha 的参数：kp, ki, kd, max_error_accum, low_pass_alpha

### pid_alpha（autopilot_config_pm6）｜

- **关键词**：pid_alpha, kp, kd, max_error_accum, low_pass_alpha
- **出处**：`six_dof/six_dof_types/aircraft/b-hvy/controls/autopilot_config_pm6.txt:39-44`
- **片段**：

```text
    pid_alpha
      kp 0.50437
      kd 0.0245818
      max_error_accum 0
      low_pass_alpha 0.7
    end_pid_alpha
```

- **演示要点**：演示 pid_alpha 的参数：kp, kd, max_error_accum, low_pass_alpha

### pid_altitude（autopilot_config）｜

- **关键词**：pid_altitude, kp, ki, kd, max_error_accum
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:53-58`　（同签名共 58 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/controls/hw_autopilot_config.txt:53`、`p6dof/p6dof_types/aircraft/b-fw/controls/autopilot_config.txt:53`、`p6dof/p6dof_types/aircraft/b-fw/controls/hw_autopilot_config.txt:53`）
- **片段**：

```text
    pid_altitude
      kp 10.8697
      ki 1.46779e-07
      kd 2.80909e-07
      max_error_accum 100
    end_pid_altitude
```

- **演示要点**：演示 pid_altitude 的参数：kp, ki, kd, max_error_accum

### pid_bank_angle（autopilot_config_pm6）｜

- **关键词**：pid_bank_angle, kp, ki, kd, max_error_accum, low_pass_alpha
- **出处**：`six_dof/six_dof_types/aircraft/fa-lgt/controls/autopilot_config_pm6.txt:46-52`
- **片段**：

```text
    pid_bank_angle
      kp 2.5
      ki 0
      kd 0.01
      max_error_accum 0
      low_pass_alpha 0.5
    end_pid_bank_angle
```

- **演示要点**：演示 pid_bank_angle 的参数：kp, ki, kd, max_error_accum, low_pass_alpha

### pid_bank_angle（autopilot_config）｜

- **关键词**：pid_bank_angle, kp, ki, kd, max_error_accum
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:60-65`　（同签名共 55 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/controls/hw_autopilot_config.txt:60`、`p6dof/p6dof_types/aircraft/b-fw/controls/autopilot_config.txt:60`、`p6dof/p6dof_types/aircraft/b-fw/controls/hw_autopilot_config.txt:60`）
- **片段**：

```text
    pid_bank_angle
      kp 4.70425
      ki 2.57364e-07
      kd 0.173307
      max_error_accum 1
    end_pid_bank_angle
```

- **演示要点**：演示 pid_bank_angle 的参数：kp, ki, kd, max_error_accum

### pid_bank_angle（autopilot_config_pm6）｜

- **关键词**：pid_bank_angle, kp, kd, low_pass_alpha
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:31-36`　（同签名共 2 处，另见 `six_dof_with_brawler/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:31`）
- **片段**：

```text
      pid_bank_angle
         kp 2.50
         kd 0.01

         low_pass_alpha 0.5
      end_pid_bank_angle
```

- **演示要点**：演示 pid_bank_angle 的参数：kp, kd, low_pass_alpha

### pid_beta（autopilot_config）｜

- **关键词**：pid_beta, kp, ki, kd, max_error_accum, low_pass_alpha
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:67-73`　（同签名共 44 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/controls/hw_autopilot_config.txt:67`、`p6dof/p6dof_types/aircraft/b-fw/controls/autopilot_config.txt:67`、`p6dof/p6dof_types/aircraft/b-fw/controls/hw_autopilot_config.txt:67`）
- **片段**：

```text
    pid_beta
      kp 0.600643
      ki 3.67398e-07
      kd 0.61506
      max_error_accum 0.5
      low_pass_alpha 0.7
    end_pid_beta
```

- **演示要点**：演示 pid_beta 的参数：kp, ki, kd, max_error_accum, low_pass_alpha

### pid_delta_pitch（autopilot_config）｜

- **关键词**：pid_delta_pitch, kp, ki, kd, max_error_accum
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:75-80`　（同签名共 54 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/controls/hw_autopilot_config.txt:75`、`p6dof/p6dof_types/aircraft/b-fw/controls/autopilot_config.txt:75`、`p6dof/p6dof_types/aircraft/b-fw/controls/hw_autopilot_config.txt:75`）
- **片段**：

```text
    pid_delta_pitch
      kp 0.674482
      ki 14.7908
      kd 0.0295742
      max_error_accum 10
    end_pid_delta_pitch
```

- **演示要点**：演示 pid_delta_pitch 的参数：kp, ki, kd, max_error_accum

### pid_delta_pitch（autopilot_config_pm6）｜

- **关键词**：pid_delta_pitch, kp, ki, max_error_accum
- **出处**：`six_dof/six_dof_types/aircraft/fa-lgt/controls/autopilot_config_pm6.txt:54-58`
- **片段**：

```text
    pid_delta_pitch
      kp 0.836492
      ki 0.694051
      max_error_accum 0.5
    end_pid_delta_pitch
```

- **演示要点**：演示 pid_delta_pitch 的参数：kp, ki, max_error_accum

### pid_delta_roll（autopilot_config）｜

- **关键词**：pid_delta_roll, kp, ki, kd, max_error_accum
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:82-87`　（同签名共 55 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/controls/hw_autopilot_config.txt:82`、`p6dof/p6dof_types/aircraft/b-fw/controls/autopilot_config.txt:82`、`p6dof/p6dof_types/aircraft/b-fw/controls/hw_autopilot_config.txt:82`）
- **片段**：

```text
    pid_delta_roll
      kp 3.46491
      ki 0.0129985
      kd 0.666012
      max_error_accum 1
    end_pid_delta_roll
```

- **演示要点**：演示 pid_delta_roll 的参数：kp, ki, kd, max_error_accum

### pid_flightpath_angle（autopilot_config）｜

- **关键词**：pid_flightpath_angle, kp, ki, kd, max_error_accum
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:89-94`　（同签名共 58 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/controls/hw_autopilot_config.txt:89`、`p6dof/p6dof_types/aircraft/b-fw/controls/autopilot_config.txt:89`、`p6dof/p6dof_types/aircraft/b-fw/controls/hw_autopilot_config.txt:89`）
- **片段**：

```text
    pid_flightpath_angle
      kp 1.50112
      ki 0.00248413
      kd 7.29851e-07
      max_error_accum 0.5
    end_pid_flightpath_angle
```

- **演示要点**：演示 pid_flightpath_angle 的参数：kp, ki, kd, max_error_accum

### pid_forward_accel（autopilot_config）｜

- **关键词**：pid_forward_accel, kp, ki, kd, max_error_accum
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:96-101`　（同签名共 56 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/controls/hw_autopilot_config.txt:96`、`p6dof/p6dof_types/aircraft/b-fw/controls/autopilot_config.txt:96`、`p6dof/p6dof_types/aircraft/b-fw/controls/hw_autopilot_config.txt:96`）
- **片段**：

```text
    pid_forward_accel
      kp 20
      ki 2
      kd 0
      max_error_accum 1
    end_pid_forward_accel
```

- **演示要点**：演示 pid_forward_accel 的参数：kp, ki, kd, max_error_accum

### pid_forward_accel（autopilot_config_pm6）｜

- **关键词**：pid_forward_accel, kp, ki, max_error_accum
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:46-51`　（同签名共 2 处，另见 `six_dof_with_brawler/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:46`）
- **片段**：

```text
      pid_forward_accel
         kp 20.00
         ki  2.00

         max_error_accum 1.0
      end_pid_forward_accel
```

- **演示要点**：演示 pid_forward_accel 的参数：kp, ki, max_error_accum

### pid_group（autopilot_config_pm6）｜

- **关键词**：pid_group, pid_alpha, kp, kd, max_error_accum, low_pass_alpha, pid_altitude, ki, pid_bank_angle, pid_beta, pid_delta_pitch, pid_delta_roll, pid_flightpath_angle
- **出处**：`six_dof/six_dof_types/aircraft/b-hvy/controls/autopilot_config_pm6.txt:37-203`　（同签名共 44 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:43`、`p6dof/p6dof_types/aircraft/b-fw/controls/autopilot_config.txt:43`、`p6dof/p6dof_types/aircraft/c-hvy/controls/autopilot_config.txt:43`）
- **片段**：

```text
  pid_group

    pid_alpha
      kp 0.50437
      kd 0.0245818
      max_error_accum 0
      low_pass_alpha 0.7
    end_pid_alpha

    pid_altitude
      kp 7.82309
      ki 3.17896e-09
      kd 0.00884211
      max_error_accum 100
    end_pid_altitude

    pid_bank_angle
      kp 1.71093
      ki 0.00259252
      kd 0.0237339
      max_error_accum 1
    end_pid_bank_angle

    pid_beta
      kp 0.0797966
      ki 0.000379328
      kd 0.733064
      max_error_accum 0
      low_pass_alpha 0.7
    end_pid_beta

    pid_delta_pitch
      kp 4.81089
      ki 2.0339e-07
      kd 0.708688
      max_error_accum 10
    end_pid_delta_pitch

    pid_delta_roll
      kp 0.433584
      ki 0.0873381
      kd 4.82617e-09
      max_error_accum 1
    end_pid_delta_roll

    pid_flightpath_angle
      kp 0.787245
      ki 1.89362
      kd 0.00389162
      max_error_accum 0.5
    end_pid_flightpath_angle

    pid_forward_accel
      kp 20
      ki 2
      kd 0
      max_error_accum 1
    end_pid_forward_accel

    pid_pitch_angle
      kp 1.47182
      ki 0.000892027
      kd 0.166351
      max_error_accum 0.5
    end_pid_pitch_angle

    pid_pitch_rate
      kp 4.12419
      ki 7.07357e-07
      kd 0.384669
      max_error_accum 0
    end_pid_pitch_rate

    pid_roll_heading
      kp 0.263838
      ki 2.31549e-07
      kd 4.81808e-05
      max_error_accum 2
      low_pass_alpha 0.5
    end_pid_roll_heading

    pid_roll_rate
      kp 0.05
      max_error_accum 0
      low_pass_alpha 0.7
    end_pid_roll_rate

    pid_speed
      kp 0.294855
      ki 0.0306032
      kd 9.80844e-08
      max_error_accum 10
    end_pid_speed

    pid_taxi_forward_accel
      kp 1
      ki 0
      kd 0
      max_error_accum 1
    end_pid_taxi_forward_accel

    pid_taxi_heading
      kp 1
      ki 0.01
      kd 0
      max_error_accum 10
    end_pid_taxi_heading

    pid_taxi_speed
      kp 1
      ki 0
      kd 0
      max_error_accum 1
    end_pid_taxi_speed

    pid_taxi_yaw_rate
      kp 0.1
      ki 0.2
      kd 0
      max_error_accum 10
    end_pid_taxi_yaw_rate

    pid_vert_speed
      kp 0.000986434
      ki 0.00401185
      kd 3.32585e-06
      max_error_accum 60
      ignore_large_error_accum 500
    end_pid_vert_speed

    pid_yaw_heading
      kp 1
      ki 0
      kd 0
      max_error_accum 1
    end_pid_yaw_heading

    pid_yaw_rate
      kp 2.30546e-08
      ki 4.31481e-07
      kd 1.33212e-09
      max_error_accum 0
    end_pid_yaw_rate

    limits_and_settings
      include autopilot_config_g_limits.txt
      afterburner_threshold       1
      speedbrake_threshold        0
      alpha_min                   -16
      alpha_max                   20
      pitch_rate_min              -10
      pitch_rate_max              40
      vert_speed_min              -15000
      vert_speed_max              15000
      beta_max                    10
      yaw_rate_max                5
      roll_rate_max               10
      bank_angle_max              30
      forward_accel_min           -1
      forward_accel_max           2
      taxi_speed_max_fps          10
      taxi_yaw_rate_max           10
      turn_roll_in_multiplier     4         # This can be manually 'tuned' for improved performance
      route_allowable_angle_error 5 deg     # This can be manually 'tuned' for improved performance
    end_limits_and_settings

  end_pid_group
```

- **演示要点**：演示 pid_group 的参数：pid_alpha, kp, kd, max_error_accum, low_pass_alpha, pid_altitude, ki, pid_bank_angle, pid_beta, pid_delta_pitch

### pid_group（autopilot_config）｜

- **关键词**：pid_group, pid_pitch_gload, gain_table, pid_delta_pitch, kp, ki, kd, max_error_accum, pid_vert_speed, pid_pitch_angle, pid_flightpath_angle, pid_altitude, pid_yaw_gload
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/autopilot_config.txt:38-262`
- **片段**：

```text
  pid_group

    pid_pitch_gload

      gain_table
        control_value            0
        kp                       0.1
        ki                       0.15
        kd                       0
        max_error_accum          10
        low_pass_alpha           0.7
      end_gain_table

      gain_table
        control_value            400
        kp                       0.1
        ki                       0.15
        kd                       0
        max_error_accum          10
        low_pass_alpha           0.7
      end_gain_table

      gain_table
        control_value            800
        kp                       0.1
        ki                       0.15
        kd                       0
        max_error_accum          10
        low_pass_alpha           0.7
      end_gain_table

      gain_table
        control_value            1600
        kp                       0.15
        ki                       0.15
        kd                       0
        max_error_accum          10
        low_pass_alpha           0.7
      end_gain_table

    end_pid_pitch_gload

    pid_delta_pitch
      kp                         0.1
      ki                         1
      kd                         0
      max_error_accum            1
    end_pid_delta_pitch

    pid_vert_speed
      kp                         0.0002
      ki                         0.0005
      kd                         1e-05
      max_error_accum            10
    end_pid_vert_speed

    pid_pitch_angle
      kp                         0.1
      ki                         1
      kd                         0
      max_error_accum            1
    end_pid_pitch_angle

    pid_flightpath_angle
      kp                         0.1
      ki                         1
      kd                         0
      max_error_accum            1
    end_pid_flightpath_angle

    pid_altitude
      kp                         15
      ki                         0
      kd                         0.002
      max_error_accum            15
    end_pid_altitude

    pid_yaw_gload
      kp                         1
      ki                         0
      kd                         0
      max_error_accum            1
    end_pid_yaw_gload

    pid_yaw_rate
      kp                         1
      ki                         0
      kd                         0
      max_error_accum            1
    end_pid_yaw_rate

    pid_yaw_heading
      kp                         1
      ki                         0
      kd                         0
      max_error_accum            1
    end_pid_yaw_heading

# -----------------------------------------------------------------------------------------------------
    pid_taxi_heading
      kp                         1
      ki                         0.01
      kd                         0
      max_error_accum            10
    end_pid_taxi_heading

    pid_roll_rate

      gain_table
        control_value            0
        kp                       0.3
        ki                       3
        kd                       0.01
        max_error_accum          1
      end_gain_table

      gain_table
        control_value            150
        kp                       0.3
        ki                       3
        kd                       0.05
        max_error_accum          1
      end_gain_table

      gain_table
        control_value            350
        kp                       0.1
        ki                       0.4
        kd                       0.01
        max_error_accum          1
      end_gain_table

      gain_table
        control_value            1600
        kp                       0.01
        ki                       0.02
        kd                       0.001
        max_error_accum          50
      end_gain_table

    end_pid_roll_rate

    pid_delta_roll
      kp                         10
      ki                         0
      kd                         0
      max_error_accum            1
    end_pid_delta_roll

    pid_bank_angle
      kp                         0.8
      ki                         0.5
      kd                         0.1
      max_error_accum            5
    end_pid_bank_angle

    pid_roll_heading
      kp                         5
      ki                         0
      kd                         0
      max_error_accum            1
      low_pass_alpha             0.5
    end_pid_roll_heading

    pid_forward_accel
      kp                         3
      ki                         2
      kd                         0
      max_error_accum            1
    end_pid_forward_accel

    pid_speed
      kp                         0.1
      ki                         0.1
      kd                         0.01
      max_error_accum            5
    end_pid_speed

    pid_taxi_forward_accel
      kp                         1
      ki                         0
      kd                         0
      max_error_accum            1
    end_pid_taxi_forward_accel

    pid_taxi_speed
      kp                         0.1
      ki                         0.2
      kd                         0.01
      max_error_accum            10
    end_pid_taxi_speed

# -----------------------------------------------------------------------------------------------------
    pid_taxi_yaw_rate
      kp                         0.1
      ki                         0.2
      kd                         0
      max_error_accum            10
    end_pid_taxi_yaw_rate

    # .............................

    limits_and_settings
      afterburner_threshold      1
      speedbrake_threshold       -0.5
      pitch_gload_min            -1
      pitch_gload_max            9
      alpha_min                  -2
      alpha_max                  10
      pitch_rate_min             -5
      pitch_rate_max             30
      vert_speed_min             -5000
      vert_speed_max             5000
      yaw_gload_max              2
      beta_max                   10
      yaw_rate_max               15
      roll_rate_max              180
      bank_angle_max             60
      forward_accel_min          -1
      forward_accel_max          2
      taxi_speed_max_fps         10
      taxi_yaw_rate_max          30
    end_limits_and_settings

  end_pid_group
```

- **演示要点**：演示 pid_group 的参数：pid_pitch_gload, gain_table, pid_delta_pitch, kp, ki, kd, max_error_accum, pid_vert_speed, pid_pitch_angle, pid_flightpath_angle

### pid_group（autopilot_config_pm6）｜

- **关键词**：pid_group, pid_altitude, kp, ki, kd, max_error_accum, pid_bank_angle, pid_delta_pitch, pid_delta_roll, pid_flightpath_angle, pid_forward_accel, pid_pitch_angle, pid_pitch_rate
- **出处**：`six_dof/six_dof_types/aircraft/b-fw/controls/autopilot_config_pm6.txt:37-182`　（同签名共 7 处，另见 `six_dof/six_dof_types/aircraft/c-hvy/controls/autopilot_config_pm6.txt:37`、`six_dof/six_dof_types/aircraft/fa-hvy/controls/autopilot_config_pm6.txt:37`、`six_dof/six_dof_types/weapons/aam-mr/controls/autopilot_config_pm6.txt:37`）
- **片段**：

```text
  pid_group

    pid_altitude
      kp 7.01664
      ki 1.12921e-05
      kd 1.66228e-05
      max_error_accum 100
    end_pid_altitude

    pid_bank_angle
      kp 3.55674
      ki 0.0421938
      kd 1.94097e-07
      max_error_accum 1
    end_pid_bank_angle

    pid_delta_pitch
      kp 1.5313
      ki 0.92581
      kd 0.118689
      max_error_accum 10
    end_pid_delta_pitch

    pid_delta_roll
      kp 3.84484
      ki 5.92135e-09
      kd 0.0185156
      max_error_accum 1
    end_pid_delta_roll

    pid_flightpath_angle
      kp 0.483096
      ki 0.855124
      kd 2.0241e-07
      max_error_accum 0.5
    end_pid_flightpath_angle

    pid_forward_accel
      kp 20
      ki 2
      kd 0
      max_error_accum 1
    end_pid_forward_accel

    pid_pitch_angle
      kp 0.788463
      ki 0.997509
      kd 1.14704e-07
      max_error_accum 0.5
    end_pid_pitch_angle

    pid_pitch_rate
      kp 3.98551
      ki 1.95961e-06
      kd 0.591771
      max_error_accum 10
    end_pid_pitch_rate

    pid_roll_heading
      kp 0.0456199
      ki 0.106207
      kd 9.14495e-09
      max_error_accum 0
      low_pass_alpha 0.5
    end_pid_roll_heading

    pid_speed
      kp 1.17195
      ki 3.74672e-06
      kd 1.20782
      max_error_accum 10
    end_pid_speed

    pid_taxi_forward_accel
      kp 1
      ki 0
      kd 0
      max_error_accum 1
    end_pid_taxi_forward_accel

    pid_taxi_heading
      kp 1
      ki 0.01
      kd 0
      max_error_accum 10
    end_pid_taxi_heading

    pid_taxi_speed
      kp 1
      ki 0
      kd 0
      max_error_accum 1
    end_pid_taxi_speed

    pid_taxi_yaw_rate
      kp 0.1
      ki 0.2
      kd 0
      max_error_accum 10
    end_pid_taxi_yaw_rate

    pid_vert_speed
      kp 0.00116256
      ki 0.00267028
      kd 1.26032e-09
      max_error_accum 60
      ignore_large_error_accum 500
    end_pid_vert_speed

    pid_yaw_heading
      kp 0.210933
      ki 4.87967e-08
      kd 1.09535
      max_error_accum 1
    end_pid_yaw_heading

    pid_yaw_rate
      kp 2.61981e-07
      ki 14.2191
      kd 5.10485e-09
      max_error_accum 1
    end_pid_yaw_rate

    limits_and_settings
      include autopilot_config_g_limits.txt
      afterburner_threshold       1
      speedbrake_threshold        0
      alpha_min                   -16
      alpha_max                   20
      pitch_rate_min              -10
      pitch_rate_max              40
      vert_speed_min              -15000
      vert_speed_max              15000
      beta_max                    10
      yaw_rate_max                5
      roll_rate_max               15
      bank_angle_max              60
      forward_accel_min           -1
      forward_accel_max           2
      taxi_speed_max_fps          10
      taxi_yaw_rate_max           10
      turn_roll_in_multiplier     4         # This can be manually 'tuned' for improved performance
      route_allowable_angle_error 5 deg     # This can be manually 'tuned' for improved performance
    end_limits_and_settings

  end_pid_group
```

- **演示要点**：演示 pid_group 的参数：pid_altitude, kp, ki, kd, max_error_accum, pid_bank_angle, pid_delta_pitch, pid_delta_roll, pid_flightpath_angle, pid_forward_accel

### pid_group（autopilot_config_pm6）｜

- **关键词**：pid_group, pid_altitude, kp, ki, kd, max_error_accum, pid_bank_angle, pid_delta_pitch, pid_delta_roll, pid_flightpath_angle, pid_forward_accel, pid_pitch_angle, pid_pitch_rate
- **出处**：`six_dof/six_dof_types/weapons/agm-mrc/controls/autopilot_config_pm6.txt:37-154`　（同签名共 2 处，另见 `six_dof/six_dof_types/weapons/sam-mr/controls/autopilot_config_pm6.txt:37`）
- **片段**：

```text
  pid_group

    pid_altitude
      kp 4.85641
      ki 0.00890211
      kd 2.83776e-08
      max_error_accum 100
    end_pid_altitude

    pid_bank_angle
      kp 2.44694
      ki 1.5081
      kd 1.08674e-08
      max_error_accum 1
    end_pid_bank_angle

    pid_delta_pitch
      kp 1.28434e-09
      ki 13.9982
      kd 1.1477e-07
      max_error_accum 10
    end_pid_delta_pitch

    pid_delta_roll
      kp 8.35718
      ki 1.47054e-06
      kd 0.0574305
      max_error_accum 1
    end_pid_delta_roll

    pid_flightpath_angle
      kp 2.16958
      ki 0.383704
      kd 1.10218e-08
      max_error_accum 0.5
    end_pid_flightpath_angle

    pid_forward_accel
      kp 20
      ki 2
      kd 0
      max_error_accum 1
    end_pid_forward_accel

    pid_pitch_angle
      kp 0.600643
      ki 2.08887e-07
      kd 0.000611492
      max_error_accum 0.5
    end_pid_pitch_angle

    pid_pitch_rate
      kp 0.041635
      ki 0.396902
      kd 5.73624e-08
      max_error_accum 0
    end_pid_pitch_rate

    pid_roll_heading
      kp 0.569777
      ki 1.33521e-09
      kd 4.67016e-08
      max_error_accum 2
      low_pass_alpha 0.5
    end_pid_roll_heading

    pid_speed
      kp 0.00174993
      ki 1.36534e-08
      kd 7.07643e-09
      max_error_accum 10
    end_pid_speed

    pid_vert_speed
      kp 0.00155289
      ki 0.00404598
      kd 5.99396e-05
      max_error_accum 60
      ignore_large_error_accum 500
    end_pid_vert_speed

    pid_yaw_heading
      kp 0.210933
      ki 4.87967e-08
      kd 1.09535
      max_error_accum 1
    end_pid_yaw_heading

    pid_yaw_rate
      kp 0.0138573
      ki 0.0105584
      kd 3.47046e-09
      max_error_accum 0
    end_pid_yaw_rate

    limits_and_settings
      include autopilot_config_g_limits.txt
      afterburner_threshold       1
      speedbrake_threshold        0
      alpha_min                   -20
      alpha_max                   20
      pitch_rate_min              -40
      pitch_rate_max              40
      vert_speed_min              -15000
      vert_speed_max              15000
      beta_max                    10
      yaw_rate_max                5
      roll_rate_max               60
      bank_angle_max              45
      forward_accel_min           -1
      forward_accel_max           2
      taxi_speed_max_fps          10
      taxi_yaw_rate_max           10
      turn_roll_in_multiplier     4         # This can be manually 'tuned' for improved performance
      route_allowable_angle_error 5 deg     # This can be manually 'tuned' for improved performance
    end_limits_and_settings

  end_pid_group
```

- **演示要点**：演示 pid_group 的参数：pid_altitude, kp, ki, kd, max_error_accum, pid_bank_angle, pid_delta_pitch, pid_delta_roll, pid_flightpath_angle, pid_forward_accel

### pid_group（autopilot_config_pm6）｜

- **关键词**：pid_group, pid_altitude, kp, ki, kd, max_error_accum, pid_bank_angle, pid_flightpath_angle, pid_forward_accel, pid_pitch_angle, low_pass_alpha, pid_pitch_rate, pid_roll_heading
- **出处**：`six_dof/six_dof_types/spacecraft/orbiter-main/controls/autopilot_config_pm6.txt:37-141`
- **片段**：

```text
  pid_group
  
    pid_altitude
      kp 10
      ki 10
      kd 50
      max_error_accum 100
    end_pid_altitude

    pid_bank_angle
      kp 0.1
      ki 0
      kd 0.01
      max_error_accum 1
    end_pid_bank_angle
    
    pid_flightpath_angle
      kp 2
      ki 0
      kd 0.0
      max_error_accum 0.5
    end_pid_flightpath_angle

    pid_forward_accel
      kp 20
      ki 2
      kd 0
      max_error_accum 1
    end_pid_forward_accel

    pid_pitch_angle
      kp 1.0
      ki 0.0
      kd 0.2
      low_pass_alpha 0.5
    end_pid_pitch_angle

    pid_pitch_rate
      kp 0.1
      ki 0.2
      kd 0.001
      max_error_accum 0
    end_pid_pitch_rate

    pid_roll_heading
      kp 1
      ki 0
      kd 0
      max_error_accum 2
      low_pass_alpha 0.5
    end_pid_roll_heading

    pid_speed
      kp 0.5
      ki 0.05
      kd 0.5
      max_error_accum 10
    end_pid_speed

    pid_vert_speed
      kp 0.0012
      ki 0
      kd 0
      max_error_accum 60
      ignore_large_error_accum 500
    end_pid_vert_speed

    pid_yaw_heading
      kp 1
      ki 0
      kd 0
      max_error_accum 1
    end_pid_yaw_heading

    pid_yaw_rate
      kp 1
      ki 0
      kd 0
      max_error_accum 0
    end_pid_yaw_rate


    limits_and_settings
     include autopilot_config_g_limits.txt
     afterburner_threshold       1
     speedbrake_threshold        0
     alpha_min                   -20
     alpha_max                   20
     pitch_rate_min              -60
     pitch_rate_max              60
     vert_speed_min              -600000
     vert_speed_max              600000
     beta_max                    20.0
     yaw_rate_max                60.0
     roll_rate_max               360.0
     bank_angle_max              180.0
     forward_accel_min           -1
     forward_accel_max           2
     taxi_speed_max_fps          10
     taxi_yaw_rate_max           10
     turn_roll_in_multiplier     4.0       # This can be manually 'tuned' for improved performance
     route_allowable_angle_error 5.0 deg   # This can be manually 'tuned' for improved performance
    end_limits_and_settings

  end_pid_group
```

- **演示要点**：演示 pid_group 的参数：pid_altitude, kp, ki, kd, max_error_accum, pid_bank_angle, pid_flightpath_angle, pid_forward_accel, pid_pitch_angle, low_pass_alpha

### pid_group（autopilot_config_pm6）｜

- **关键词**：pid_group, pid_altitude, kp, ki, kd, max_error_accum, pid_bank_angle, low_pass_alpha, pid_delta_pitch, pid_delta_roll, pid_flightpath_angle, pid_forward_accel, pid_pitch_angle
- **出处**：`six_dof/six_dof_types/aircraft/fa-lgt/controls/autopilot_config_pm6.txt:37-150`
- **片段**：

```text
  pid_group

    pid_altitude
      kp 7.44406
      ki 0.74806
      kd 0.2
      max_error_accum 100
    end_pid_altitude

    pid_bank_angle
      kp 2.5
      ki 0
      kd 0.01
      max_error_accum 0
      low_pass_alpha 0.5
    end_pid_bank_angle

    pid_delta_pitch
      kp 0.836492
      ki 0.694051
      max_error_accum 0.5
    end_pid_delta_pitch

    pid_delta_roll
      kp 2
      ki 0
      kd 0.01
      max_error_accum 0
    end_pid_delta_roll

    pid_flightpath_angle
      kp 2.39429
      ki 1.14449
      kd 0.0509812
      max_error_accum 0.5
    end_pid_flightpath_angle

    pid_forward_accel
      kp 20
      ki 2
      kd 0
      max_error_accum 1
    end_pid_forward_accel

    pid_pitch_angle
      kp 0.836492
      ki 0.694051
      max_error_accum 0.5
    end_pid_pitch_angle

    pid_pitch_rate
      kp 0.064873
      ki 1.68004e-05
      max_error_accum 0
    end_pid_pitch_rate

    pid_roll_heading
      kp 0.218918
      ki 0.000224949
      max_error_accum 2
      low_pass_alpha 0.5
    end_pid_roll_heading

    pid_speed
      kp 0.02
      ki 0.01
      kd 0.001
      max_error_accum 10
      low_pass_alpha 0.5
    end_pid_speed

    pid_vert_speed
      kp 0.0005
      ki 0.000454646
      max_error_accum 60
      ignore_large_error_accum 500
      low_pass_alpha 0.5
    end_pid_vert_speed

    pid_yaw_heading
      kp 0.210933
      ki 4.87967e-08
      kd 1.09535
      max_error_accum 1
    end_pid_yaw_heading

    pid_yaw_rate
      kp 1.91375e-05
      ki 3.02441
      kd 4.23386e-07
      max_error_accum 1
    end_pid_yaw_rate

    limits_and_settings
      include autopilot_config_g_limits.txt
      afterburner_threshold       1
      speedbrake_threshold        0
      alpha_min                   -16
      alpha_max                   20
      pitch_rate_min              -10
      pitch_rate_max              40
      vert_speed_min              -15000
      vert_speed_max              15000
      beta_max                    10
      yaw_rate_max                5
      roll_rate_max               180
      bank_angle_max              180
      forward_accel_min           -1
      forward_accel_max           2
      turn_roll_in_multiplier     4         # This can be manually 'tuned' for improved performance
      route_allowable_angle_error 5 deg     # This can be manually 'tuned' for improved performance
    end_limits_and_settings

  end_pid_group
```

- **演示要点**：演示 pid_group 的参数：pid_altitude, kp, ki, kd, max_error_accum, pid_bank_angle, low_pass_alpha, pid_delta_pitch, pid_delta_roll, pid_flightpath_angle

### pid_group（autopilot_config_pm6）｜

- **关键词**：pid_group, pid_altitude, pid_bank_angle, pid_flightpath_angle, pid_forward_accel, pid_pitch_angle, pid_pitch_rate, pid_roll_heading, pid_speed, pid_vert_speed, limits_and_settings
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:21-107`　（同签名共 2 处，另见 `six_dof_with_brawler/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:21`）
- **片段**：

```text
   pid_group

      pid_altitude
         kp 7.50
         ki 2.00
         kd 0.10

         max_error_accum 200
      end_pid_altitude

      pid_bank_angle
         kp 2.50
         kd 0.01

         low_pass_alpha 0.5
      end_pid_bank_angle

      pid_flightpath_angle
         kp 2.50
         ki 1.15
         kd 0.05

         max_error_accum 0.5
      end_pid_flightpath_angle

      pid_forward_accel
         kp 20.00
         ki  2.00

         max_error_accum 1.0
      end_pid_forward_accel

      pid_pitch_angle
         kp 0.80
         ki 0.70

         max_error_accum 0.5
      end_pid_pitch_angle

      pid_pitch_rate
         kp 0.06
      end_pid_pitch_rate

      pid_roll_heading
         kp 0.20
         ki 0.0002

         max_error_accum 2.0
         low_pass_alpha  0.5
      end_pid_roll_heading

      pid_speed
         kp 0.02
         ki 0.01
         kd 0.001

         max_error_accum 10.0
         low_pass_alpha   0.5
      end_pid_speed

      pid_vert_speed
         kp 0.001
      end_pid_vert_speed

      limits_and_settings
         pitch_gload_min             -2
         pitch_gload_max              8
         yaw_gload_max                0.5
         afterburner_threshold        1
         speedbrake_threshold         0
         alpha_min                  -16
         alpha_max                   20
         pitch_rate_min             -10
         pitch_rate_max              40
         vert_speed_min          -15000
         vert_speed_max           15000
         beta_max                    10
         yaw_rate_max                 5
         roll_rate_max              180
         bank_angle_max              90
         forward_accel_min           -1
         forward_accel_max            2
         turn_roll_in_multiplier      4
         route_allowable_angle_error  5 deg
      end_limits_and_settings

   end_pid_group
```

- **演示要点**：演示 pid_group 的参数：pid_altitude, pid_bank_angle, pid_flightpath_angle, pid_forward_accel, pid_pitch_angle, pid_pitch_rate, pid_roll_heading, pid_speed, pid_vert_speed, limits_and_settings

### pid_pitch_angle（autopilot_config）｜

- **关键词**：pid_pitch_angle, kp, ki, kd, max_error_accum
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:103-108`　（同签名共 54 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/controls/hw_autopilot_config.txt:103`、`p6dof/p6dof_types/aircraft/b-fw/controls/autopilot_config.txt:103`、`p6dof/p6dof_types/aircraft/b-fw/controls/hw_autopilot_config.txt:103`）
- **片段**：

```text
    pid_pitch_angle
      kp 1.5017
      ki 1.3849
      kd 3.33783e-06
      max_error_accum 0.5
    end_pid_pitch_angle
```

- **演示要点**：演示 pid_pitch_angle 的参数：kp, ki, kd, max_error_accum

### pid_pitch_angle（autopilot_config_pm6）｜

- **关键词**：pid_pitch_angle, kp, ki, kd, low_pass_alpha
- **出处**：`six_dof/six_dof_types/spacecraft/orbiter-main/controls/autopilot_config_pm6.txt:67-72`
- **片段**：

```text
    pid_pitch_angle
      kp 1.0
      ki 0.0
      kd 0.2
      low_pass_alpha 0.5
    end_pid_pitch_angle
```

- **演示要点**：演示 pid_pitch_angle 的参数：kp, ki, kd, low_pass_alpha

### pid_pitch_angle（autopilot_config_pm6）｜

- **关键词**：pid_pitch_angle, kp, ki, max_error_accum
- **出处**：`six_dof/six_dof_types/aircraft/fa-lgt/controls/autopilot_config_pm6.txt:81-85`　（同签名共 3 处，另见 `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:53`、`six_dof_with_brawler/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:53`）
- **片段**：

```text
    pid_pitch_angle
      kp 0.836492
      ki 0.694051
      max_error_accum 0.5
    end_pid_pitch_angle
```

- **演示要点**：演示 pid_pitch_angle 的参数：kp, ki, max_error_accum

### pid_pitch_gload（autopilot_config）｜

- **关键词**：pid_pitch_gload, gain_table, control_value, kp, ki, kd, max_error_accum, low_pass_alpha
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/autopilot_config.txt:40-78`
- **片段**：

```text
    pid_pitch_gload

      gain_table
        control_value            0
        kp                       0.1
        ki                       0.15
        kd                       0
        max_error_accum          10
        low_pass_alpha           0.7
      end_gain_table

      gain_table
        control_value            400
        kp                       0.1
        ki                       0.15
        kd                       0
        max_error_accum          10
        low_pass_alpha           0.7
      end_gain_table

      gain_table
        control_value            800
        kp                       0.1
        ki                       0.15
        kd                       0
        max_error_accum          10
        low_pass_alpha           0.7
      end_gain_table

      gain_table
        control_value            1600
        kp                       0.15
        ki                       0.15
        kd                       0
        max_error_accum          10
        low_pass_alpha           0.7
      end_gain_table

    end_pid_pitch_gload
```

- **演示要点**：演示 pid_pitch_gload 的参数：gain_table, control_value, kp, ki, kd, max_error_accum, low_pass_alpha

### pid_pitch_rate（autopilot_config）｜

- **关键词**：pid_pitch_rate, kp, ki, kd, max_error_accum
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:110-115`　（同签名共 54 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/controls/hw_autopilot_config.txt:110`、`p6dof/p6dof_types/aircraft/b-fw/controls/autopilot_config.txt:110`、`p6dof/p6dof_types/aircraft/b-fw/controls/hw_autopilot_config.txt:110`）
- **片段**：

```text
    pid_pitch_rate
      kp 0.00984123
      ki 1.5081
      kd 1.06997e-09
      max_error_accum 10
    end_pid_pitch_rate
```

- **演示要点**：演示 pid_pitch_rate 的参数：kp, ki, kd, max_error_accum

### pid_pitch_rate（autopilot_config_pm6）｜

- **关键词**：pid_pitch_rate, kp, ki, max_error_accum
- **出处**：`six_dof/six_dof_types/aircraft/fa-lgt/controls/autopilot_config_pm6.txt:87-91`
- **片段**：

```text
    pid_pitch_rate
      kp 0.064873
      ki 1.68004e-05
      max_error_accum 0
    end_pid_pitch_rate
```

- **演示要点**：演示 pid_pitch_rate 的参数：kp, ki, max_error_accum

### pid_pitch_rate（autopilot_config_pm6）｜

- **关键词**：pid_pitch_rate, kp
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:60-62`　（同签名共 2 处，另见 `six_dof_with_brawler/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:60`）
- **片段**：

```text
      pid_pitch_rate
         kp 0.06
      end_pid_pitch_rate
```

- **演示要点**：演示 pid_pitch_rate 的参数：kp

### pid_roll_heading（autopilot_config）｜

- **关键词**：pid_roll_heading, kp, ki, kd, max_error_accum, low_pass_alpha
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:117-123`　（同签名共 55 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/controls/hw_autopilot_config.txt:117`、`p6dof/p6dof_types/aircraft/b-fw/controls/autopilot_config.txt:117`、`p6dof/p6dof_types/aircraft/b-fw/controls/hw_autopilot_config.txt:117`）
- **片段**：

```text
    pid_roll_heading
      kp 0.127881
      ki 0.0543592
      kd 5.59324e-05
      max_error_accum 2
      low_pass_alpha 0.5
    end_pid_roll_heading
```

- **演示要点**：演示 pid_roll_heading 的参数：kp, ki, kd, max_error_accum, low_pass_alpha

### pid_roll_heading（autopilot_config_pm6）｜

- **关键词**：pid_roll_heading, kp, ki, max_error_accum, low_pass_alpha
- **出处**：`six_dof/six_dof_types/aircraft/fa-lgt/controls/autopilot_config_pm6.txt:93-98`　（同签名共 3 处，另见 `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:64`、`six_dof_with_brawler/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:64`）
- **片段**：

```text
    pid_roll_heading
      kp 0.218918
      ki 0.000224949
      max_error_accum 2
      low_pass_alpha 0.5
    end_pid_roll_heading
```

- **演示要点**：演示 pid_roll_heading 的参数：kp, ki, max_error_accum, low_pass_alpha

### pid_roll_rate（autopilot_config）｜

- **关键词**：pid_roll_rate, gain_table, control_value, kp, ki, kd, max_error_accum
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/autopilot_config.txt:144-178`
- **片段**：

```text
    pid_roll_rate

      gain_table
        control_value            0
        kp                       0.3
        ki                       3
        kd                       0.01
        max_error_accum          1
      end_gain_table

      gain_table
        control_value            150
        kp                       0.3
        ki                       3
        kd                       0.05
        max_error_accum          1
      end_gain_table

      gain_table
        control_value            350
        kp                       0.1
        ki                       0.4
        kd                       0.01
        max_error_accum          1
      end_gain_table

      gain_table
        control_value            1600
        kp                       0.01
        ki                       0.02
        kd                       0.001
        max_error_accum          50
      end_gain_table

    end_pid_roll_rate
```

- **演示要点**：演示 pid_roll_rate 的参数：gain_table, control_value, kp, ki, kd, max_error_accum

### pid_roll_rate（autopilot_config）｜

- **关键词**：pid_roll_rate, kp, ki, kd, max_error_accum, low_pass_alpha
- **出处**：`p6dof/p6dof_types/aircraft/b-hvy/controls/autopilot_config.txt:125-131`　（同签名共 11 处，另见 `p6dof/p6dof_types/aircraft/fa-hvy/controls/autopilot_config.txt:125`、`p6dof/p6dof_types/weapons/agm-mrc/controls/autopilot_config.txt:125`、`six_dof/six_dof_types/aircraft/b-hvy/controls/autopilot_config_rb6.txt:123`）
- **片段**：

```text
    pid_roll_rate
      kp 0.48059
      ki 1.08396e-09
      kd 0.921287
      max_error_accum 0
      low_pass_alpha 0.7
    end_pid_roll_rate
```

- **演示要点**：演示 pid_roll_rate 的参数：kp, ki, kd, max_error_accum, low_pass_alpha

### pid_roll_rate（autopilot_config）｜

- **关键词**：pid_roll_rate, kp, ki, kd, max_error_accum
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:125-130`　（同签名共 32 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/controls/hw_autopilot_config.txt:125`、`p6dof/p6dof_types/aircraft/b-fw/controls/autopilot_config.txt:125`、`p6dof/p6dof_types/aircraft/b-fw/controls/hw_autopilot_config.txt:125`）
- **片段**：

```text
    pid_roll_rate
      kp 0.645499
      ki 2.10493
      kd 0.0420401
      max_error_accum 0
    end_pid_roll_rate
```

- **演示要点**：演示 pid_roll_rate 的参数：kp, ki, kd, max_error_accum

### pid_roll_rate（autopilot_config_pm6）｜

- **关键词**：pid_roll_rate, kp, max_error_accum, low_pass_alpha
- **出处**：`six_dof/six_dof_types/aircraft/b-hvy/controls/autopilot_config_pm6.txt:118-122`
- **片段**：

```text
    pid_roll_rate
      kp 0.05
      max_error_accum 0
      low_pass_alpha 0.7
    end_pid_roll_rate
```

- **演示要点**：演示 pid_roll_rate 的参数：kp, max_error_accum, low_pass_alpha

### pid_speed（autopilot_config_pm6）｜

- **关键词**：pid_speed, kp, ki, kd, max_error_accum, low_pass_alpha
- **出处**：`six_dof/six_dof_types/aircraft/fa-lgt/controls/autopilot_config_pm6.txt:100-106`　（同签名共 3 处，另见 `air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:72`、`six_dof_with_brawler/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:72`）
- **片段**：

```text
    pid_speed
      kp 0.02
      ki 0.01
      kd 0.001
      max_error_accum 10
      low_pass_alpha 0.5
    end_pid_speed
```

- **演示要点**：演示 pid_speed 的参数：kp, ki, kd, max_error_accum, low_pass_alpha

### pid_speed（autopilot_config）｜

- **关键词**：pid_speed, kp, ki, kd, max_error_accum
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:132-137`　（同签名共 55 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/controls/hw_autopilot_config.txt:132`、`p6dof/p6dof_types/aircraft/b-fw/controls/autopilot_config.txt:132`、`p6dof/p6dof_types/aircraft/b-fw/controls/hw_autopilot_config.txt:132`）
- **片段**：

```text
    pid_speed
      kp 0.00658906
      ki 5.08909e-09
      kd 5.36562e-05
      max_error_accum 10
    end_pid_speed
```

- **演示要点**：演示 pid_speed 的参数：kp, ki, kd, max_error_accum

### pid_taxi_forward_accel（autopilot_config）｜

- **关键词**：pid_taxi_forward_accel, kp, ki, kd, max_error_accum
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:139-144`　（同签名共 52 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/controls/hw_autopilot_config.txt:139`、`p6dof/p6dof_types/aircraft/b-fw/controls/autopilot_config.txt:139`、`p6dof/p6dof_types/aircraft/b-fw/controls/hw_autopilot_config.txt:139`）
- **片段**：

```text
    pid_taxi_forward_accel
      kp 1
      ki 0
      kd 0
      max_error_accum 1
    end_pid_taxi_forward_accel
```

- **演示要点**：演示 pid_taxi_forward_accel 的参数：kp, ki, kd, max_error_accum

### pid_taxi_heading（autopilot_config）｜

- **关键词**：pid_taxi_heading, kp, ki, kd, max_error_accum
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:146-151`　（同签名共 52 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/controls/hw_autopilot_config.txt:146`、`p6dof/p6dof_types/aircraft/b-fw/controls/autopilot_config.txt:146`、`p6dof/p6dof_types/aircraft/b-fw/controls/hw_autopilot_config.txt:146`）
- **片段**：

```text
    pid_taxi_heading
      kp 1
      ki 0.01
      kd 0
      max_error_accum 10
    end_pid_taxi_heading
```

- **演示要点**：演示 pid_taxi_heading 的参数：kp, ki, kd, max_error_accum

### pid_taxi_speed（autopilot_config）｜

- **关键词**：pid_taxi_speed, kp, ki, kd, max_error_accum
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:153-158`　（同签名共 52 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/controls/hw_autopilot_config.txt:153`、`p6dof/p6dof_types/aircraft/b-fw/controls/autopilot_config.txt:153`、`p6dof/p6dof_types/aircraft/b-fw/controls/hw_autopilot_config.txt:153`）
- **片段**：

```text
    pid_taxi_speed
      kp 1
      ki 0
      kd 0
      max_error_accum 1
    end_pid_taxi_speed
```

- **演示要点**：演示 pid_taxi_speed 的参数：kp, ki, kd, max_error_accum

### pid_taxi_yaw_rate（autopilot_config）｜

- **关键词**：pid_taxi_yaw_rate, kp, ki, kd, max_error_accum
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:160-165`　（同签名共 52 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/controls/hw_autopilot_config.txt:160`、`p6dof/p6dof_types/aircraft/b-fw/controls/autopilot_config.txt:160`、`p6dof/p6dof_types/aircraft/b-fw/controls/hw_autopilot_config.txt:160`）
- **片段**：

```text
    pid_taxi_yaw_rate
      kp 0.1
      ki 0.2
      kd 0
      max_error_accum 10
    end_pid_taxi_yaw_rate
```

- **演示要点**：演示 pid_taxi_yaw_rate 的参数：kp, ki, kd, max_error_accum

### pid_vert_speed（autopilot_config）｜

- **关键词**：pid_vert_speed, kp, ki, kd, max_error_accum, ignore_large_error_accum
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:167-173`　（同签名共 54 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/controls/hw_autopilot_config.txt:167`、`p6dof/p6dof_types/aircraft/b-fw/controls/autopilot_config.txt:167`、`p6dof/p6dof_types/aircraft/b-fw/controls/hw_autopilot_config.txt:167`）
- **片段**：

```text
    pid_vert_speed
      kp 0.00191321
      ki 1.37015e-09
      kd 9.16773e-06
      max_error_accum 60
      ignore_large_error_accum 500
    end_pid_vert_speed
```

- **演示要点**：演示 pid_vert_speed 的参数：kp, ki, kd, max_error_accum, ignore_large_error_accum

### pid_vert_speed（autopilot_config_pm6）｜

- **关键词**：pid_vert_speed, kp, ki, max_error_accum, ignore_large_error_accum, low_pass_alpha
- **出处**：`six_dof/six_dof_types/aircraft/fa-lgt/controls/autopilot_config_pm6.txt:108-114`
- **片段**：

```text
    pid_vert_speed
      kp 0.0005
      ki 0.000454646
      max_error_accum 60
      ignore_large_error_accum 500
      low_pass_alpha 0.5
    end_pid_vert_speed
```

- **演示要点**：演示 pid_vert_speed 的参数：kp, ki, max_error_accum, ignore_large_error_accum, low_pass_alpha

### pid_vert_speed（autopilot_config）｜

- **关键词**：pid_vert_speed, kp, ki, kd, max_error_accum
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/autopilot_config.txt:87-92`
- **片段**：

```text
    pid_vert_speed
      kp                         0.0002
      ki                         0.0005
      kd                         1e-05
      max_error_accum            10
    end_pid_vert_speed
```

- **演示要点**：演示 pid_vert_speed 的参数：kp, ki, kd, max_error_accum

### pid_vert_speed（autopilot_config_pm6）｜

- **关键词**：pid_vert_speed, kp
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:81-83`　（同签名共 2 处，另见 `six_dof_with_brawler/six_dof_types/aircraft/LTE_FIGHTER/controls/autopilot_config_pm6.txt:81`）
- **片段**：

```text
      pid_vert_speed
         kp 0.001
      end_pid_vert_speed
```

- **演示要点**：演示 pid_vert_speed 的参数：kp

### pid_yaw_gload（autopilot_config）｜

- **关键词**：pid_yaw_gload, kp, ki, kd, max_error_accum
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/autopilot_config.txt:115-120`
- **片段**：

```text
    pid_yaw_gload
      kp                         1
      ki                         0
      kd                         0
      max_error_accum            1
    end_pid_yaw_gload
```

- **演示要点**：演示 pid_yaw_gload 的参数：kp, ki, kd, max_error_accum

### pid_yaw_heading（autopilot_config）｜

- **关键词**：pid_yaw_heading, kp, ki, kd, max_error_accum
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:175-180`　（同签名共 56 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/controls/hw_autopilot_config.txt:175`、`p6dof/p6dof_types/aircraft/b-fw/controls/autopilot_config.txt:175`、`p6dof/p6dof_types/aircraft/b-fw/controls/hw_autopilot_config.txt:175`）
- **片段**：

```text
    pid_yaw_heading
      kp 0.210933
      ki 4.87967e-08
      kd 1.09535
      max_error_accum 1
    end_pid_yaw_heading
```

- **演示要点**：演示 pid_yaw_heading 的参数：kp, ki, kd, max_error_accum

### pid_yaw_rate（autopilot_config）｜

- **关键词**：pid_yaw_rate, kp, ki, kd, max_error_accum
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/autopilot_config.txt:182-187`　（同签名共 56 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/controls/hw_autopilot_config.txt:182`、`p6dof/p6dof_types/aircraft/b-fw/controls/autopilot_config.txt:182`、`p6dof/p6dof_types/aircraft/b-fw/controls/hw_autopilot_config.txt:182`）
- **片段**：

```text
    pid_yaw_rate
      kp 0.0163975
      ki 7.74487
      kd 8.85439e-07
      max_error_accum 1
    end_pid_yaw_rate
```

- **演示要点**：演示 pid_yaw_rate 的参数：kp, ki, kd, max_error_accum

### pilot_manager（control_inputs）｜

- **关键词**：pilot_manager, control_inputs, synthetic_pilot, manual_pilot_augmented_controls, hardware_autopilot_bank_to_turn, guidance_autopilot_bank_to_turn, active_pilot, common_autopilot_support_file
- **出处**：`p6dof/p6dof_types/weapons/agm-mrc/controls/control_inputs.txt:18-103`　（同签名共 6 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/controls/control_inputs.txt:18`、`p6dof/p6dof_types/aircraft/b-fw/controls/control_inputs.txt:18`、`p6dof/p6dof_types/aircraft/c-hvy/controls/control_inputs.txt:18`）
- **片段**：

```text
pilot_manager

   control_inputs

      control_name StickBack
      control_name StickRight
      control_name RudderRight
      control_name ThrottleMil
      control_name ThrottleAB
      control_name ThrustReverser
      control_name ThrustVectorYaw
      control_name ThrustVectorPitch
      control_name ThrustVectorRoll
      control_name LandingGearDown
      control_name FlapsDown
      control_name SpeedBrakesOut
      control_name SpoilersOut
      control_name NoseWheelRight
      control_name NWS_Right
      control_name NWS_Enable
      control_name RgtWheelBrake
      control_name LftWheelBrake
      control_name TrimPitchUp
      control_name TrimPitchDown
      control_name TrimRollRight
      control_name TrimRollLeft
      control_name TriggerPulled
      control_name ButtonPressed

      std_stick_back              StickBack
      std_stick_right             StickRight
      std_rudder_right            RudderRight
      std_throttle_mil            ThrottleMil
      std_throttle_ab             ThrottleAB
      std_thrust_reverser         ThrustReverser
      std_thrust_vectoring_yaw    ThrustVectorYaw
      std_thrust_vectoring_pitch  ThrustVectorPitch
      std_thrust_vectoring_roll   ThrustVectorRoll
      std_speed_brakes_out        SpeedBrakesOut
      std_spoilers_out            SpoilersOut
      std_flaps_down              FlapsDown
      std_landing_gear_down       LandingGearDown
      std_nose_wheel_steering     NoseWheelRight
      std_nws_steering            NWS_Right
      std_nws_enabled             NWS_Enable
      std_wheel_brake_left        LftWheelBrake
      std_wheel_brake_right       RgtWheelBrake

   end_control_inputs

   synthetic_pilot
      # Define the autopilot configuration
      include autopilot_config.txt
   end_synthetic_pilot

   manual_pilot_augmented_controls
      # Define the CAS autopilot configuration
      include autopilot_config.txt


      pitch_trim_factor                     0.1
      roll_trim_factor                      0.1
      yaw_trim_factor                       0.1

      pitch_control_augmentation_factor_g   3
      roll_control_augmentation_factor_dps  120
   end_manual_pilot_augmented_controls

   hardware_autopilot_bank_to_turn
      # Define the hardware autopilot configuration
      include hw_autopilot_config.txt
   end_hardware_autopilot_bank_to_turn

   guidance_autopilot_bank_to_turn
      # Define the guidance configuration
      include autopilot_config.txt
   end_guidance_autopilot_bank_to_turn

   # Make the synthetic pilot active
   active_pilot synthetic_pilot

   # This autopilot support file is common to all pilots
   # that use a P6DofCommonController (autopilot)
   common_autopilot_support_file      autopilot_support_tables.txt

end_pilot_manager
```

- **演示要点**：演示 pilot_manager 的参数：control_inputs, synthetic_pilot, manual_pilot_augmented_controls, hardware_autopilot_bank_to_turn, guidance_autopilot_bank_to_turn, active_pilot, common_autopilot_support_file

### pilot_manager（control_inputs）｜

- **关键词**：pilot_manager, control_inputs, synthetic_pilot, manual_pilot_augmented_controls, hardware_autopilot_skid_to_turn, guidance_autopilot_skid_to_turn, active_pilot, common_autopilot_support_file
- **出处**：`p6dof/p6dof_types/weapons/aam-mr/controls/control_inputs.txt:18-103`　（同签名共 6 处，另见 `p6dof/p6dof_types/weapons/aam-sr/controls/control_inputs.txt:18`、`p6dof/p6dof_types/weapons/aam-sr/controls-tvc/control_inputs.txt:18`、`p6dof/p6dof_types/weapons/agm-sr/controls/control_inputs.txt:18`）
- **片段**：

```text
pilot_manager

   control_inputs

      control_name StickBack
      control_name StickRight
      control_name RudderRight
      control_name ThrottleMil
      control_name ThrottleAB
      control_name ThrustReverser
      control_name ThrustVectorYaw
      control_name ThrustVectorPitch
      control_name ThrustVectorRoll
      control_name LandingGearDown
      control_name FlapsDown
      control_name SpeedBrakesOut
      control_name SpoilersOut
      control_name NoseWheelRight
      control_name NWS_Right
      control_name NWS_Enable
      control_name RgtWheelBrake
      control_name LftWheelBrake
      control_name TrimPitchUp
      control_name TrimPitchDown
      control_name TrimRollRight
      control_name TrimRollLeft
      control_name TriggerPulled
      control_name ButtonPressed

      std_stick_back              StickBack
      std_stick_right             StickRight
      std_rudder_right            RudderRight
      std_throttle_mil            ThrottleMil
      std_throttle_ab             ThrottleAB
      std_thrust_reverser         ThrustReverser
      std_thrust_vectoring_yaw    ThrustVectorYaw
      std_thrust_vectoring_pitch  ThrustVectorPitch
      std_thrust_vectoring_roll   ThrustVectorRoll
      std_speed_brakes_out        SpeedBrakesOut
      std_spoilers_out            SpoilersOut
      std_flaps_down              FlapsDown
      std_landing_gear_down       LandingGearDown
      std_nose_wheel_steering     NoseWheelRight
      std_nws_steering            NWS_Right
      std_nws_enabled             NWS_Enable
      std_wheel_brake_left        LftWheelBrake
      std_wheel_brake_right       RgtWheelBrake

   end_control_inputs

   synthetic_pilot
      # Define the autopilot configuration
      include autopilot_config.txt
   end_synthetic_pilot

   manual_pilot_augmented_controls
      # Define the CAS autopilot configuration
      include autopilot_config.txt


      pitch_trim_factor                     0.1
      roll_trim_factor                      0.1
      yaw_trim_factor                       0.1

      pitch_control_augmentation_factor_g   30
      roll_control_augmentation_factor_dps  360
   end_manual_pilot_augmented_controls

   hardware_autopilot_skid_to_turn
      # Define the hardware autopilot configuration
      include hw_autopilot_config.txt
   end_hardware_autopilot_skid_to_turn

   guidance_autopilot_skid_to_turn
      # Define the guidance configuration
      include autopilot_config.txt
   end_guidance_autopilot_skid_to_turn

   # Make the synthetic pilot active
   active_pilot synthetic_pilot

   # This autopilot support file is common to all pilots
   # that use a P6DofCommonController (autopilot)
   common_autopilot_support_file      autopilot_support_tables.txt

end_pilot_manager
```

- **演示要点**：演示 pilot_manager 的参数：control_inputs, synthetic_pilot, manual_pilot_augmented_controls, hardware_autopilot_skid_to_turn, guidance_autopilot_skid_to_turn, active_pilot, common_autopilot_support_file

### pilot_manager（control_inputs_rb6）｜

- **关键词**：pilot_manager, control_inputs, synthetic_pilot, manual_pilot_augmented_controls, active_pilot, common_autopilot_support_file
- **出处**：`six_dof/six_dof_types/weapons/aam-mr/controls/control_inputs_rb6.txt:18-92`　（同签名共 12 处，另见 `six_dof/six_dof_types/weapons/aam-sr/controls-tvc/control_inputs_rb6.txt:18`、`six_dof/six_dof_types/weapons/gbu-500/controls/control_inputs_rb6.txt:18`、`six_dof/six_dof_types/weapons/lrm-1-a/controls/control_inputs_rb6.txt:18`）
- **片段**：

```text
pilot_manager

   control_inputs

      control_name StickBack
      control_name StickRight
      control_name RudderRight
      control_name ThrottleMil
      control_name ThrottleAB
      control_name ThrustReverser
      control_name ThrustVectorYaw
      control_name ThrustVectorPitch
      control_name ThrustVectorRoll
      control_name LandingGearDown
      control_name FlapsDown
      control_name SpeedBrakesOut
      control_name SpoilersOut
      control_name NoseWheelRight
      control_name NWS_Right
      control_name NWS_Enable
      control_name RgtWheelBrake
      control_name LftWheelBrake
      control_name TrimPitchUp
      control_name TrimPitchDown
      control_name TrimRollRight
      control_name TrimRollLeft
      control_name TriggerPulled
      control_name ButtonPressed

      std_stick_back              StickBack
      std_stick_right             StickRight
      std_rudder_right            RudderRight
      std_throttle_mil            ThrottleMil
      std_throttle_ab             ThrottleAB
      std_thrust_reverser         ThrustReverser
      std_thrust_vectoring_yaw    ThrustVectorYaw
      std_thrust_vectoring_pitch  ThrustVectorPitch
      std_thrust_vectoring_roll   ThrustVectorRoll
      std_speed_brakes_out        SpeedBrakesOut
      std_spoilers_out            SpoilersOut
      std_flaps_down              FlapsDown
      std_landing_gear_down       LandingGearDown
      std_nose_wheel_steering     NoseWheelRight
      std_nws_steering            NWS_Right
      std_nws_enabled             NWS_Enable
      std_wheel_brake_left        LftWheelBrake
      std_wheel_brake_right       RgtWheelBrake

   end_control_inputs

   synthetic_pilot
      # Define the autopilot configuration
      include autopilot_config_rb6.txt
   end_synthetic_pilot

   manual_pilot_augmented_controls
      # Define the CAS autopilot configuration
      include autopilot_config_rb6.txt

      pitch_trim_factor                     0.1
      roll_trim_factor                      0.1
      yaw_trim_factor                       0.1

      pitch_control_augmentation_factor_g   30
      roll_control_augmentation_factor_dps  360
   end_manual_pilot_augmented_controls

   # Make the synthetic pilot active
   active_pilot synthetic_pilot

   # This autopilot support file is common to all pilots
   # that use a SixDOF_CommonController (autopilot)
   common_autopilot_support_file      autopilot_support_tables.txt

end_pilot_manager
```

- **演示要点**：演示 pilot_manager 的参数：control_inputs, synthetic_pilot, manual_pilot_augmented_controls, active_pilot, common_autopilot_support_file

### pilot_manager（control_inputs）｜

- **关键词**：pilot_manager, control_inputs, synthetic_pilot, manual_pilot_augmented_stability, active_pilot, common_autopilot_support_file
- **出处**：`p6dof/p6dof_types/aircraft/b-hvy/controls/control_inputs.txt:18-136`　（同签名共 2 处，另见 `six_dof/six_dof_types/aircraft/b-hvy/controls/control_inputs_rb6.txt:18`）
- **片段**：

```text
pilot_manager

   control_inputs

      control_name StickBack
      control_name StickRight
      control_name RudderRight
      control_name ThrottleMil
      control_name ThrottleAB
      control_name ThrustReverser
      control_name ThrustVectorYaw
      control_name ThrustVectorPitch
      control_name ThrustVectorRoll
      control_name LandingGearDown
      control_name FlapsDown
      control_name SpeedBrakesOut
      control_name SpoilersOut
      control_name NoseWheelRight
      control_name NWS_Right
      control_name NWS_Enable
      control_name RgtWheelBrake
      control_name LftWheelBrake
      control_name TrimPitchUp
      control_name TrimPitchDown
      control_name TrimRollRight
      control_name TrimRollLeft
      control_name TriggerPulled
      control_name ButtonPressed

      std_stick_back              StickBack
      std_stick_right             StickRight
      std_rudder_right            RudderRight
      std_throttle_mil            ThrottleMil
      std_throttle_ab             ThrottleAB
      std_thrust_reverser         ThrustReverser
      std_thrust_vectoring_yaw    ThrustVectorYaw
      std_thrust_vectoring_pitch  ThrustVectorPitch
      std_thrust_vectoring_roll   ThrustVectorRoll
      std_speed_brakes_out        SpeedBrakesOut
      std_spoilers_out            SpoilersOut
      std_flaps_down              FlapsDown
      std_landing_gear_down       LandingGearDown
      std_nose_wheel_steering     NoseWheelRight
      std_nws_steering            NWS_Right
      std_nws_enabled             NWS_Enable
      std_wheel_brake_left        LftWheelBrake
      std_wheel_brake_right       RgtWheelBrake

   end_control_inputs

   synthetic_pilot
      # Define the autopilot configuration
      include autopilot_config.txt
   end_synthetic_pilot

   manual_pilot_augmented_stability
      # Define the SAS autopilot configuration
      include autopilot_config.txt

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


      pitch_trim_factor                     0.1
      roll_trim_factor                      0.1
      yaw_trim_factor                       0.1

      pitch_stability_augmentation          true
      yaw_stability_augmentation            true
      roll_stability_augmentation           true
   end_manual_pilot_augmented_stability

   # Make the synthetic pilot active
   active_pilot synthetic_pilot

   # This autopilot support file is common to all pilots
   # that use a P6DofCommonController (autopilot)
   common_autopilot_support_file      autopilot_support_tables.txt

end_pilot_manager
```

- **演示要点**：演示 pilot_manager 的参数：control_inputs, synthetic_pilot, manual_pilot_augmented_stability, active_pilot, common_autopilot_support_file

### pilot_manager（control_inputs_pm6）｜

- **关键词**：pilot_manager, synthetic_pilot, manual_pilot_augmented_controls, active_pilot, common_autopilot_support_file
- **出处**：`six_dof/six_dof_types/spacecraft/orbiter-main/controls/control_inputs_pm6.txt:18-44`　（同签名共 16 处，另见 `six_dof/six_dof_types/weapons/aam-mr/controls/control_inputs_pm6.txt:18`、`six_dof/six_dof_types/weapons/aam-sr/controls/control_inputs_pm6.txt:18`、`six_dof/six_dof_types/weapons/aam-sr/controls-tvc/control_inputs_pm6.txt:18`）
- **片段**：

```text
pilot_manager

   synthetic_pilot
      # Define the autopilot configuration
      include autopilot_config_pm6.txt
   end_synthetic_pilot

   manual_pilot_augmented_controls
      # Define the CAS autopilot configuration
      include autopilot_config_pm6.txt

      pitch_trim_factor                     0.1
      roll_trim_factor                      0.1
      yaw_trim_factor                       0.1

      pitch_control_augmentation_factor_g   30
      roll_control_augmentation_factor_dps  360
   end_manual_pilot_augmented_controls

   # Make the synthetic pilot active
   active_pilot synthetic_pilot

   # This autopilot support file is common to all pilots
   # that use a SixDOF_CommonController (autopilot)
   common_autopilot_support_file      autopilot_support_tables.txt

end_pilot_manager
```

- **演示要点**：演示 pilot_manager 的参数：synthetic_pilot, manual_pilot_augmented_controls, active_pilot, common_autopilot_support_file

### pilot_manager（control_inputs）｜

- **关键词**：pilot_manager, control_inputs, synthetic_pilot, active_pilot, use_nav_radios
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/control_inputs.txt:9-67`
- **片段**：

```text
pilot_manager

   control_inputs

      control_name StickBack
      control_name StickRight
      control_name RudderRight
      control_name ThrottleMil
      control_name ThrottleAB
      control_name ThrustReverser
      control_name ThrustVectorYaw
      control_name ThrustVectorPitch
      control_name ThrustVectorRoll
      control_name LandingGearDown
      control_name FlapsDown
      control_name SpeedBrakesOut
      control_name SpoilersOut
      control_name NoseWheelRight
      control_name NWS_Right
      control_name NWS_Enable
      control_name RgtWheelBrake
      control_name LftWheelBrake
      control_name TrimPitchUp
      control_name TrimPitchDown
      control_name TrimRollRight
      control_name TrimRollLeft
      control_name TriggerPulled
      control_name ButtonPressed

      std_stick_back              StickBack
      std_stick_right             StickRight
      std_rudder_right            RudderRight
      std_throttle_mil            ThrottleMil
      std_throttle_ab             ThrottleAB
      std_thrust_reverser         ThrustReverser
      std_thrust_vectoring_yaw    ThrustVectorYaw
      std_thrust_vectoring_pitch  ThrustVectorPitch
      std_thrust_vectoring_roll   ThrustVectorRoll
      std_speed_brakes_out        SpeedBrakesOut
      std_spoilers_out            SpoilersOut
      std_flaps_down              FlapsDown
      std_landing_gear_down       LandingGearDown
      std_nose_wheel_steering     NoseWheelRight
      std_nws_steering            NWS_Right
      std_nws_enabled             NWS_Enable
      std_wheel_brake_left        LftWheelBrake
      std_wheel_brake_right       RgtWheelBrake

   end_control_inputs

   synthetic_pilot
      controls_config_file  autopilot_config.txt
   end_synthetic_pilot

   active_pilot synthetic_pilot

   use_nav_radios         1

end_pilot_manager
```

- **演示要点**：演示 pilot_manager 的参数：control_inputs, synthetic_pilot, active_pilot, use_nav_radios

### pilot_manager（control_inputs_pm6）｜

- **关键词**：pilot_manager, synthetic_pilot, manual_pilot_augmented_stability, active_pilot, common_autopilot_support_file
- **出处**：`six_dof/six_dof_types/aircraft/b-hvy/controls/control_inputs_pm6.txt:18-88`
- **片段**：

```text
pilot_manager

   synthetic_pilot
      # Define the autopilot configuration
      include autopilot_config_pm6.txt
   end_synthetic_pilot

   manual_pilot_augmented_stability
      # Define the SAS autopilot configuration
      include autopilot_config_pm6.txt

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


      pitch_trim_factor                     0.1
      roll_trim_factor                      0.1
      yaw_trim_factor                       0.1

      pitch_stability_augmentation          true
      yaw_stability_augmentation            true
      roll_stability_augmentation           true
   end_manual_pilot_augmented_stability

   # Make the synthetic pilot active
   active_pilot synthetic_pilot

   # This autopilot support file is common to all pilots
   # that use a SixDOF_CommonController (autopilot)
   common_autopilot_support_file      autopilot_support_tables.txt

end_pilot_manager
```

- **演示要点**：演示 pilot_manager 的参数：synthetic_pilot, manual_pilot_augmented_stability, active_pilot, common_autopilot_support_file

### pilot_manager（control_inputs）｜

- **关键词**：pilot_manager, control_inputs, active_pilot, common_autopilot_support_file
- **出处**：`p6dof/p6dof_types/misc/srb-rato/controls/control_inputs.txt:18-88`
- **片段**：

```text
pilot_manager

   control_inputs

      control_name StickBack
      control_name StickRight
      control_name RudderRight
      control_name ThrottleMil
      control_name ThrottleAB
      control_name ThrustReverser
      control_name ThrustVectorYaw
      control_name ThrustVectorPitch
      control_name ThrustVectorRoll
      control_name LandingGearDown
      control_name FlapsDown
      control_name SpeedBrakesOut
      control_name SpoilersOut
      control_name NoseWheelRight
      control_name NWS_Right
      control_name NWS_Enable
      control_name RgtWheelBrake
      control_name LftWheelBrake
      control_name TrimPitchUp
      control_name TrimPitchDown
      control_name TrimRollRight
      control_name TrimRollLeft
      control_name TriggerPulled
      control_name ButtonPressed

      std_stick_back              StickBack
      std_stick_right             StickRight
      std_rudder_right            RudderRight
      std_throttle_mil            ThrottleMil
      std_throttle_ab             ThrottleAB
      std_thrust_reverser         ThrustReverser
      std_thrust_vectoring_yaw    ThrustVectorYaw
      std_thrust_vectoring_pitch  ThrustVectorPitch
      std_thrust_vectoring_roll   ThrustVectorRoll
      std_speed_brakes_out        SpeedBrakesOut
      std_spoilers_out            SpoilersOut
      std_flaps_down              FlapsDown
      std_landing_gear_down       LandingGearDown
      std_nose_wheel_steering     NoseWheelRight
      std_nws_steering            NWS_Right
      std_nws_enabled             NWS_Enable
      std_wheel_brake_left        LftWheelBrake
      std_wheel_brake_right       RgtWheelBrake

   end_control_inputs

/* synthetic_pilot
      # Define the autopilot configuration
      include autopilot_config.txt
   end_synthetic_pilot
*/
/* manual_pilot_simple_controls
      simple_yaw_damper   false
      pitch_trim_factor   0.1
      roll_trim_factor    0.1
      yaw_trim_factor     0.1

   end_manual_pilot_simple_controls
*/
   # Make the synthetic pilot active
   active_pilot synthetic_pilot

   # This autopilot support file is common to all pilots
   # that use a P6DofCommonController (autopilot)
   common_autopilot_support_file      autopilot_support_tables.txt

end_pilot_manager
```

- **演示要点**：演示 pilot_manager 的参数：control_inputs, active_pilot, common_autopilot_support_file

### point_mass_engine_type（b-h3-81a-1-tf）｜

- **关键词**：point_mass_engine_type, thrust_offset, inop_ref_area, jet, file
- **出处**：`six_dof/six_dof_types/aircraft/b-hvy/prop/jet_engines/b-h3-81a-1-tf/b-h3-81a-1-tf.txt:75-124`　（同签名共 2 处，另见 `six_dof/six_dof_types/weapons/agm-mrc/prop/jet_engines/generic-cm-1-tf/generic-cm-1-tf.txt:76`）
- **片段**：

```text
   point_mass_engine_type   B-H3-81A-1-TF_PM6   BASE_TYPE

      thrust_offset            -5.9000 ft

      inop_ref_area            15.3000 ft^2

      jet

			tsfc_idle_pph             0.7800  # lb/lb/hr
			tsfc_mil_pph              0.7800  # lb/lb/hr

			//-------------------------------------------------------------------------

			rated_thrust_idle      2500.0000 lbf
			rated_thrust_mil      17000.0000 lbf
			//-------------------------------------------------------------------------

			spin_up_table_mil_per_sec
				// throttle_level  spin_up_per_sec
							  0.0000               0.0500
							  0.2500               0.1625
							  0.5000               0.2750
							  0.7500               0.3875
							  1.0000               0.5000
			end_spin_up_table_mil_per_sec

			spin_down_table_mil_per_sec
				// throttle_level  spin_down_per_sec
							  0.0000               0.0500
							  0.2500               0.1625
							  0.5000               0.2750
							  0.7500               0.3875
							  1.0000               0.5000
			end_spin_down_table_mil_per_sec

			//-------------------------------------------------------------------------

			thrust_idle_alt_mach_table
				file data/thrust_idle_alt_mach.txt
			end_thrust_idle_alt_mach_table

			//-------------------------------------------------------------------------

			thrust_mil_alt_mach_table
				file data/thrust_mil_alt_mach.txt
			end_thrust_mil_alt_mach_table

      end_jet

   end_point_mass_engine_type
```

- **演示要点**：演示 point_mass_engine_type 的参数：thrust_offset, inop_ref_area, jet, file

### point_mass_engine_type（b-h4-40w-1-tf）｜

- **关键词**：point_mass_engine_type, thrust_offset, inop_ref_area, jet
- **出处**：`six_dof/six_dof_types/aircraft/b-fw/prop/jet_engines/b-h4-40w-1-tf/b-h4-40w-1-tf.txt:75-123`　（同签名共 4 处，另见 `six_dof/six_dof_types/aircraft/c-hvy/prop/jet_engines/c-hj-41a-1-tf/c-hj-41a-1-tf.txt:80`、`six_dof/six_dof_types/aircraft/fa-hvy/prop/jet_engines/f-h4-22a-1-tf/f-h4-22a-1-tf.txt:101`、`six_dof/six_dof_types/aircraft/fa-lgt/prop/jet_engines/f-l4-11a-1-tf/f-l4-11a-1-tf.txt:103`）
- **片段**：

```text
   point_mass_engine_type   B-H4-40W-1-TF_PM6   BASE_TYPE

      thrust_offset            -6.0000 ft
      inop_ref_area             8.0000 ft^2

      jet

         tsfc_idle_pph             0.3800  # lb/lb/hr
         tsfc_mil_pph              0.3800  # lb/lb/hr

         //-------------------------------------------------------------------------

         rated_thrust_idle      5000.0000 lbf
         rated_thrust_mil      19000.0000 lbf
         //-------------------------------------------------------------------------

         spin_up_table_mil_per_sec
            // throttle_level  spin_up_per_sec
                       0.0000               0.0500
                       0.2500               0.1625
                       0.5000               0.2750
                       0.7500               0.3875
                       1.0000               0.5000
         end_spin_up_table_mil_per_sec

         spin_down_table_mil_per_sec
            // throttle_level  spin_down_per_sec
                       0.0000               0.0500
                       0.2500               0.1625
                       0.5000               0.2750
                       0.7500               0.3875
                       1.0000               0.5000
         end_spin_down_table_mil_per_sec

         //-------------------------------------------------------------------------

         thrust_idle_alt_mach_table
            file data/thrust_idle_alt_mach.txt
         end_thrust_idle_alt_mach_table

         //-------------------------------------------------------------------------

         thrust_mil_alt_mach_table
            file data/thrust_mil_alt_mach.txt
         end_thrust_mil_alt_mach_table

      end_jet

   end_point_mass_engine_type
```

- **演示要点**：演示 point_mass_engine_type 的参数：thrust_offset, inop_ref_area, jet

### point_mass_engine_type（orbiter-main-rkt）｜

- **关键词**：point_mass_engine_type, thrust_offset, liquid_propellant_rocket
- **出处**：`six_dof/six_dof_types/spacecraft/orbiter-main/prop/solid_propellant_rockets/orbiter-main-rkt/orbiter-main-rkt.txt:22-97`
- **片段**：

```text
   point_mass_engine_type    ORBITER-MAIN-RKT_PM6   BASE_TYPE
   
      thrust_offset          -1.88 ft

      liquid_propellant_rocket

         max_thrust_vacuum 10000 lbf
         
         normalized_spindown 0.5
         normalized_spinup 0.5
      
         //-------------------------------------------------------------------------
      
         normalized_thrust_vs_alt
                 0.0      0.900000
            150000.0      1.000000
            
         end_normalized_thrust_vs_alt
      
         isp_vs_alt
            // alt          Isp
                 0.0      240.000000
              5000.0      242.766560
             10000.0      245.230420
             15000.0      247.415200
             20000.0      249.343720
             25000.0      251.037580
             30000.0      252.517340
             35000.0      253.802480
             40000.0      255.076600
             45000.0      256.128340
             50000.0      256.955400
             55000.0      257.605800
             60000.0      258.117240
             65000.0      258.519460
             70000.0      258.842120
             75000.0      259.093700
             80000.0      259.289420
             85000.0      259.441940
             90000.0      259.561000
             95000.0      259.654100
            100000.0      259.727020
            105000.0      259.784220
            110000.0      259.830960
            115000.0      259.866980
            120000.0      259.894880
            125000.0      259.916580
            130000.0      259.933540
            135000.0      259.946840
            140000.0      259.957320
            145000.0      259.965620
            150000.0      259.972220
            155000.0      259.977400
            160000.0      259.981360
            165000.0      259.984620
            170000.0      259.987200
            175000.0      259.989300
            180000.0      259.991100
            185000.0      259.992600
            190000.0      259.993880
            195000.0      259.994940
            200000.0      259.995840
            210000.0      259.997220
            220000.0      259.998160
            230000.0      259.998800
            240000.0      259.999240
            250000.0      259.999520
            260000.0      259.999720
            270000.0      259.999820
            280000.0      259.999900
            400000.0      260.000000
         end_isp_vs_alt
      
      end_liquid_propellant_rocket

   end_point_mass_engine_type
```

- **演示要点**：演示 point_mass_engine_type 的参数：thrust_offset, liquid_propellant_rocket

### point_mass_engine_type（rato-rkt）｜

- **关键词**：point_mass_engine_type, thrust_offset, solid_propellant_rocket
- **出处**：`six_dof/six_dof_types/misc/srb-rato/prop/solid_propellant_rockets/rato-rkt/rato-rkt.txt:101-177`　（同签名共 7 处，另见 `six_dof/six_dof_types/weapons/aam-sr/prop/solid_propellant_rockets/aim-sr-1-rkt/aim-sr-1-rkt.txt:101`、`six_dof/six_dof_types/weapons/sam-mr/prop/solid_propellant_rockets/mim-mr-1-rkt/mim-mr-1-rkt.txt:102`、`six_dof/six_dof_types/weapons/unguided_rocket/prop/solid_propellant_rockets/unguided_rocket_rocketmotor/unguided_rocket_rocketmotor.txt:101`）
- **片段**：

```text
   point_mass_engine_type   RATO-RKT_PM6   BASE_TYPE

      thrust_offset          -5.00 ft

      solid_propellant_rocket

         thrust_vs_time_sealevel
            // time    thrust_lbs
                 0.000           0.000
                 0.100      100000.000
                 2.800       80000.000
                 3.000           0.000
         end_thrust_vs_time_sealevel
      
         //-------------------------------------------------------------------------
      
         isp_vs_alt
            // alt          Isp
                 0.0      240.000000
              5000.0      242.766560
             10000.0      245.230420
             15000.0      247.415200
             20000.0      249.343720
             25000.0      251.037580
             30000.0      252.517340
             35000.0      253.802480
             40000.0      255.076600
             45000.0      256.128340
             50000.0      256.955400
             55000.0      257.605800
             60000.0      258.117240
             65000.0      258.519460
             70000.0      258.842120
             75000.0      259.093700
             80000.0      259.289420
             85000.0      259.441940
             90000.0      259.561000
             95000.0      259.654100
            100000.0      259.727020
            105000.0      259.784220
            110000.0      259.830960
            115000.0      259.866980
            120000.0      259.894880
            125000.0      259.916580
            130000.0      259.933540
            135000.0      259.946840
            140000.0      259.957320
            145000.0      259.965620
            150000.0      259.972220
            155000.0      259.977400
            160000.0      259.981360
            165000.0      259.984620
            170000.0      259.987200
            175000.0      259.989300
            180000.0      259.991100
            185000.0      259.992600
            190000.0      259.993880
            195000.0      259.994940
            200000.0      259.995840
            210000.0      259.997220
            220000.0      259.998160
            230000.0      259.998800
            240000.0      259.999240
            250000.0      259.999520
            260000.0      259.999720
            270000.0      259.999820
            280000.0      259.999900
            400000.0      260.000000
         end_isp_vs_alt

         //-------------------------------------------------------------------------

         rated_thrust        100000.0 lbf

      end_solid_propellant_rocket

   end_point_mass_engine_type
```

- **演示要点**：演示 point_mass_engine_type 的参数：thrust_offset, solid_propellant_rocket

### point_mass_engine_type（orbiter-booster-rkt）｜

- **关键词**：point_mass_engine_type, include
- **出处**：`six_dof/six_dof_types/spacecraft/orbiter-booster/prop/solid_propellant_rockets/orbiter-booster-rkt/orbiter-booster-rkt.txt:26-28`
- **片段**：

```text
   point_mass_engine_type    ORBITER-BOOSTER-RKT_PM6   BASE_TYPE   
      include orbiter-booster-rkt_data.txt
   end_point_mass_engine_type
```

- **演示要点**：演示 point_mass_engine_type 的参数：include

### point_mass_engine_type（LTE_FIGHTER_Eng）｜

- **关键词**：point_mass_engine_type, jet
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/prop/LTE_FIGHTER_Eng.txt:12-58`　（同签名共 2 处，另见 `six_dof_with_brawler/six_dof_types/aircraft/LTE_FIGHTER/prop/LTE_FIGHTER_Eng.txt:12`）
- **片段**：

```text
   point_mass_engine_type   LTE_FIGHTER_Eng_PM6   BASE_TYPE

      jet

         tsfc_idle_pph      -0.02710004531071167
         tsfc_mil_pph       1.4504621608555324
         tsfc_ab_pph        1.6062186380240169

         rated_thrust_idle  802.9000000000001 lbf
         rated_thrust_mil   23892.5 lbf
         rated_thrust_ab    74142.5 lbf

         spin_up_table_mil_per_sec
            0.00	2.0
            1.00	2.0
         end_spin_up_table_mil_per_sec

         spin_down_table_mil_per_sec
            0.00	2.0
            1.00	2.0
         end_spin_down_table_mil_per_sec

         spin_up_table_ab_per_sec
            0.00	1.0
            1.00	1.0
         end_spin_up_table_ab_per_sec

         spin_down_table_ab_per_sec
            0.00	1.0
            1.00	1.0
         end_spin_down_table_ab_per_sec

         thrust_idle_alt_mach_table
            file data/thrust_idle_alt_mach.txt
         end_thrust_idle_alt_mach_table

         thrust_mil_alt_mach_table
            file data/thrust_mil_alt_mach.txt
         end_thrust_mil_alt_mach_table

         thrust_ab_alt_mach_table
            file data/thrust_ab_alt_mach.txt
         end_thrust_ab_alt_mach_table

      end_jet

   end_point_mass_engine_type
```

- **演示要点**：演示 point_mass_engine_type 的参数：jet

### point_mass_vehicle_type（orbiter-main）｜

- **关键词**：point_mass_vehicle_type, use_rotating_earth, include, mass_properties, propulsion_data, subobject, sequencer
- **出处**：`six_dof/six_dof_types/spacecraft/orbiter-main/orbiter-main.txt:24-86`
- **片段**：

```text
   point_mass_vehicle_type ORBITER-MAIN_PM6 BASE_TYPE

      use_rotating_earth yes

      include aero/aero_pm6.txt                 # Defines the vehicle aerodynamics
      include controls/control_inputs_pm6.txt   # Defines the control inputs (stick, rudder, throttle, etc)
      include controls/flight_controls_pm6.txt  # Defines how the control inputs move the control surfaces

      mass_properties
         mass                             1800.00000 lbs
         moment_of_inertia_ixx               0.39034 slug*ft^2
         moment_of_inertia_iyy              20.71385 slug*ft^2
         moment_of_inertia_izz              20.71385 slug*ft^2
         center_of_mass_x                    0.00000 ft
         center_of_mass_y                   -0.00000 ft
         center_of_mass_z                    0.00000 ft
      end_mass_properties

      propulsion_data

         engine Engine  ORBITER-MAIN-RKT_PM6
            rel_pos_x                       -1.71444 ft
            rel_pos_y                        0.00000 ft
            rel_pos_z                       -0.00000 ft
            rel_yaw                          0.00000 deg
            rel_pitch                        0.00000 deg

            maximum_yaw_acceleration_at_thrust   1000 deg/s^2  3000 lbf
            maximum_pitch_acceleration_at_thrust 1000 deg/s^2  3000 lbf
            maximum_roll_acceleration_at_thrust  1000 deg/s^2  3000 lbf
            
            fuel_feed RocketFuel
         end_engine
         
         fuel_tank RocketFuel
            max_fuel_quantity     12000 lbs
            current_fuel_quantity 10000 lbs
            max_flow_rate          1000 lbs/sec
         end_fuel_tank

      end_propulsion_data
      
      subobject BoosterStage ORBITER-BOOSTER_PM6
         parent_rel_x   -6 ft
         separation_vx -10 fps         
      end_subobject

      # This sequencer will ignite/start the engine(s)
      sequencer ReleaseFromVehicle
         event_released_from_parent
         action_ignite_subobject BoosterStage
         #action_disable_controls
      end_sequencer
      
      sequencer BoosterExpended
         event_nx_below  0.0 g
         
         action_jett_obj BoosterStage
         #action_enable_controls 
         action_ignite_engine Engine
      end_sequencer
      
   end_point_mass_vehicle_type
```

- **演示要点**：演示 point_mass_vehicle_type 的参数：use_rotating_earth, include, mass_properties, propulsion_data, subobject, sequencer

### point_mass_vehicle_type（orbiter-booster）｜

- **关键词**：point_mass_vehicle_type, use_rotating_earth, include, mass_properties, propulsion_data, sequencer
- **出处**：`six_dof/six_dof_types/spacecraft/orbiter-booster/orbiter-booster.txt:22-68`
- **片段**：

```text
   point_mass_vehicle_type ORBITER-BOOSTER_PM6 BASE_TYPE
   
      use_rotating_earth yes

      include aero/aero_pm6.txt                 # Defines the vehicle aerodynamics
      include controls/control_inputs_pm6.txt   # Defines the control inputs (stick, rudder, throttle, etc)
      include controls/flight_controls_pm6.txt  # Defines how the control inputs move the control surfaces

      mass_properties
         mass                             6000.00000 lbs
         moment_of_inertia_ixx               0.08259 slug*ft^2
         moment_of_inertia_iyy               0.67196 slug*ft^2
         moment_of_inertia_izz               0.67196 slug*ft^2
         center_of_mass_x                    0.00000 ft
         center_of_mass_y                   -0.00000 ft
         center_of_mass_z                    0.00000 ft
      end_mass_properties

      propulsion_data

         engine Engine  ORBITER-BOOSTER-RKT_PM6
            rel_pos_x                        0.66601 ft
            rel_pos_y                        0.00000 ft
            rel_pos_z                       -0.00000 ft
            rel_yaw                          0.00000 deg
            rel_pitch                        0.00000 deg            

            maximum_yaw_acceleration_at_thrust   100 deg/s^2  30000 lbf
            maximum_pitch_acceleration_at_thrust 100 deg/s^2  30000 lbf
            
            fuel_feed   Propellant
         end_engine         
         
         fuel_tank Propellant
            max_fuel_quantity     50000 lbs
            current_fuel_quantity 50000 lbs
            max_flow_rate         10000 lbs/sec
         end_fuel_tank

      end_propulsion_data

      # This sequencer will ignite/start the engine(s)
      sequencer ReleaseFromVehicle
         event_timer 0 s
      end_sequencer
      
   end_point_mass_vehicle_type
```

- **演示要点**：演示 point_mass_vehicle_type 的参数：use_rotating_earth, include, mass_properties, propulsion_data, sequencer

### point_mass_vehicle_type（lrm-1-a）｜

- **关键词**：point_mass_vehicle_type, include, mass_properties, propulsion_data, subobject, sequencer
- **出处**：`six_dof/six_dof_types/weapons/lrm-1-a/lrm-1-a.txt:95-158`
- **片段**：

```text
   point_mass_vehicle_type LRM-1-A_PM6 BASE_TYPE

      include aero/aero_pm6.txt                 # Defines the vehicle aerodynamics
      include controls/control_inputs_pm6.txt   # Defines the control inputs (stick, rudder, throttle, etc)
      include controls/flight_controls_pm6.txt  # Defines how the control inputs move the control surfaces

      mass_properties
         mass                              145.00000 lbs
         moment_of_inertia_ixx               0.39034 slug*ft^2
         moment_of_inertia_iyy              20.71385 slug*ft^2
         moment_of_inertia_izz              20.71385 slug*ft^2
         center_of_mass_x                    0.00000 ft
         center_of_mass_y                   -0.00000 ft
         center_of_mass_z                    0.00000 ft
      end_mass_properties

      propulsion_data

         engine Engine  LRM-ST-RKT_PM6
            rel_pos_x                       -1.71444 ft
            rel_pos_y                        0.00000 ft
            rel_pos_z                       -0.00000 ft
            rel_yaw                          0.00000 deg
            rel_pitch                        0.00000 deg
            fuel_feed  Propellant
         end_engine

         fuel_tank Propellant
            max_fuel_quantity               85.0 lbs
            current_fuel_quantity           85.0 lbs
            max_fill_rate                 100000 lbs/s
            max_flow_rate                 100000 lbs/s
            max_xfer_rate                 100000 lbs/s
            cg_empty_x                       0.0 ft
            cg_empty_y                       0.0 ft
            cg_empty_z                       0.0 ft
            cg_full_x                        0.0 ft
            cg_full_y                        0.0 ft
            cg_full_z                        0.0 ft
         end_fuel_tank

      end_propulsion_data
      
      subobject BoosterStage LRM-1-C_PM6
         parent_rel_x   -6 ft
         separation_vx -10 fps         
      end_subobject

      # This sequencer will ignite/start the engine(s)
      sequencer ReleaseFromVehicle
         event_released_from_parent
         action_ignite_subobject BoosterStage
         #action_disable_controls
      end_sequencer
      
      sequencer BoosterExpended
         event_nx_below  -0.5 g
         
         action_jett_obj BoosterStage
         #action_enable_controls 
         action_ignite_engine Engine
      end_sequencer
      
   end_point_mass_vehicle_type
```

- **演示要点**：演示 point_mass_vehicle_type 的参数：include, mass_properties, propulsion_data, subobject, sequencer

### point_mass_vehicle_type（sam-mr）｜

- **关键词**：point_mass_vehicle_type, include, mass_properties, propulsion_data, sequencer
- **出处**：`six_dof/six_dof_types/weapons/sam-mr/sam-mr.txt:80-122`　（同签名共 6 处，另见 `six_dof/six_dof_types/weapons/aam-mr/aam-mr.txt:78`、`six_dof/six_dof_types/weapons/aam-sr/aam-sr-tvc.txt:80`、`six_dof/six_dof_types/weapons/aam-sr/aam-sr.txt:80`）
- **片段**：

```text
   point_mass_vehicle_type SAM-MR_PM6 BASE_TYPE

      include aero/aero_pm6.txt                 # Defines the vehicle aerodynamics
      include controls/control_inputs_pm6.txt   # Defines the control inputs (stick, rudder, throttle, etc)
      include controls/flight_controls_pm6.txt  # Defines how the control inputs move the control surfaces

      mass_properties
         mass                              854.37500 lbs
      end_mass_properties

      propulsion_data

         engine Engine  MIM-MR-1-RKT_PM6
            rel_pos_x                       -4.47074 ft
            rel_pos_y                        0.00000 ft
            rel_pos_z                        0.00000 ft
            rel_yaw                          0.00000 deg
            rel_pitch                        0.00000 deg
            fuel_feed   Propellant
         end_engine

         fuel_tank Propellant
            max_fuel_quantity              695.6 lbs
            current_fuel_quantity          695.6 lbs
            max_fill_rate                 100000 lbs/s
            max_flow_rate                 100000 lbs/s
            max_xfer_rate                 100000 lbs/s
            cg_empty_x                       0.0 ft
            cg_empty_y                       0.0 ft
            cg_empty_z                       0.0 ft
            cg_full_x                        0.0 ft
            cg_full_y                        0.0 ft
            cg_full_z                        0.0 ft         
         end_fuel_tank

      end_propulsion_data

      # This sequencer will ignite/start the engine(s)
      sequencer ReleaseFromVehicle
         event_released_from_parent
         action_ignite_engine Engine
      end_sequencer
   end_point_mass_vehicle_type
```

- **演示要点**：演示 point_mass_vehicle_type 的参数：include, mass_properties, propulsion_data, sequencer

### point_mass_vehicle_type（gbu-500）｜

- **关键词**：point_mass_vehicle_type, include, mass_properties, sequencer
- **出处**：`six_dof/six_dof_types/weapons/gbu-500/gbu-500.txt:44-61`　（同签名共 2 处，另见 `six_dof/six_dof_types/weapons/ubu-500/ubu-500-hd.txt:46`）
- **片段**：

```text
   point_mass_vehicle_type GBU-500_PM6 BASE_TYPE

      include aero/aero_pm6.txt                 # Defines the vehicle aerodynamics
      include controls/control_inputs_pm6.txt   # Defines the control inputs (stick, rudder, throttle, etc)
      include controls/flight_controls_pm6.txt  # Defines how the control inputs move the control surfaces

      mass_properties
         mass                              500.00000 lbs
      end_mass_properties

      # Note: This vehicle lacks any propulsion system
      
      sequencer Release
         event_released_from_parent
         action_null
      end_sequencer

   end_point_mass_vehicle_type
```

- **演示要点**：演示 point_mass_vehicle_type 的参数：include, mass_properties, sequencer

### point_mass_vehicle_type（zell-launch-system）｜

- **关键词**：point_mass_vehicle_type, fixed_object, mass_properties, subobject
- **出处**：`six_dof/six_dof_types/misc/zell-launch-system/zell-launch-system.txt:13-36`　（同签名共 2 处，另见 `six_dof/six_dof_types/misc/zell-launch-system/zell-launch-system.txt:38`）
- **片段**：

```text
   point_mass_vehicle_type ZELL-LAUNCHER_RB6 BASE_TYPE

      fixed_object              true

      mass_properties
         mass                  1000000000 lbs
      end_mass_properties

      subobject              Fighter    FA-LGT-ZLL_RB6
         parent_rel_x        0.0 ft
         parent_rel_y        0.0 ft
         parent_rel_z       -20.0 ft
         parent_rel_yaw      0.0 deg
         parent_rel_pitch    45.0 deg
         parent_rel_roll     0.0 deg
         separation_vx       0.0 ft/sec
         separation_vy       0.0 ft/sec
         separation_vz       0.0 ft/sec
         separation_omega_x  0.0 deg/sec
         separation_omega_y  0.0 deg/sec
         separation_omega_z  0.0 deg/sec
      end_subobject

   end_point_mass_vehicle_type
```

- **演示要点**：演示 point_mass_vehicle_type 的参数：fixed_object, mass_properties, subobject

### point_mass_vehicle_type（LTE_FIGHTER）｜

- **关键词**：point_mass_vehicle_type, include, mass_properties, propulsion_data
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/LTE_FIGHTER.txt:14-40`　（同签名共 4 处，另见 `six_dof_with_brawler/six_dof_types/aircraft/LTE_FIGHTER/LTE_FIGHTER.txt:14`、`six_dof/six_dof_types/misc/tnk-f16-370g/tnk-f16-370g.txt:56`、`six_dof/six_dof_types/aircraft/b-hvy/b-hvy.txt:141`）
- **片段**：

```text
   point_mass_vehicle_type   LTE_FIGHTER_PM6   BASE_TYPE

      include aero/aero_pm6.txt
      include controls/control_inputs_pm6.txt
      include controls/flight_controls_pm6.txt

      mass_properties
         mass	36109.999986200004 lbs
      end_mass_properties

      propulsion_data

         engine Engine LTE_FIGHTER_Eng_PM6
            fuel_feed	MainFuelTank
         end_engine

         fuel_tank MainFuelTank
            max_fuel_quantity      20718.0 lbs
            current_fuel_quantity  20718.0 lbs
            max_flow_rate          10000.00 lbs/sec
            max_fill_rate          10000.00 lbs/sec
            max_xfer_rate          10000.00 lbs/sec
         end_fuel_tank

      end_propulsion_data

   end_point_mass_vehicle_type
```

- **演示要点**：演示 point_mass_vehicle_type 的参数：include, mass_properties, propulsion_data

### point_mass_vehicle_type（fa-lgt_external-tanks）｜

- **关键词**：point_mass_vehicle_type, subobject, fuel_transfer, sequencer
- **出处**：`six_dof/six_dof_types/aircraft/fa-lgt/fa-lgt_external-tanks.txt:65-106`
- **片段**：

```text
   point_mass_vehicle_type FA-LGT-EXTERNAL-TANKS_PM6 FA-LGT_PM6
   
      subobject TankLft TNK-F16-370G_PM6
         parent_rel_x        -1.0 ft
         parent_rel_y        -6.0 ft
         parent_rel_z         2.5 ft
         parent_rel_pitch    -1.0 deg
         separation_vz        2.0 ft/sec
         separation_omega_x   0.0 deg/sec
         separation_omega_y -45.0 deg/sec
         separation_omega_z   0.0 deg/sec
      end_subobject

      subobject TankRgt TNK-F16-370G_PM6
         parent_rel_x        -1.0 ft
         parent_rel_y         6.0 ft
         parent_rel_z         2.5 ft
         parent_rel_pitch    -1.0 deg
         separation_vz        2.0 ft/sec
         separation_omega_x   0.0 deg/sec
         separation_omega_y -45.0 deg/sec
         separation_omega_z   0.0 deg/sec
      end_subobject

      fuel_transfer LeftTankToMainXfer
         source_tank TankLft.MainFuelTank
         target_tank MainFuelTank
         #target_tank LeftWingTank   # Uncomment if using multiple internal tanks for FA-LGT
      end_fuel_transfer

      fuel_transfer RightTankToMainXfer
         source_tank TankRgt.MainFuelTank
         target_tank MainFuelTank
         #target_tank RightWingTank   # Uncomment if using multiple internal tanks for FA-LGT
      end_fuel_transfer

      sequencer DropExternalTanks
         action_jett_obj TankRgt
         action_jett_obj TankLft
      end_sequencer

   end_point_mass_vehicle_type
```

- **演示要点**：演示 point_mass_vehicle_type 的参数：subobject, fuel_transfer, sequencer

### point_mass_vehicle_type（ubu-500-ld）｜

- **关键词**：point_mass_vehicle_type, include, mass_properties
- **出处**：`six_dof/six_dof_types/weapons/ubu-500/ubu-500-ld.txt:37-47`
- **片段**：

```text
   point_mass_vehicle_type UBU-500-LD_PM6 BASE_TYPE

      include aero/aero_pm6.txt                 # Defines the vehicle aerodynamics

      mass_properties
         mass                              500.00000 lbs
      end_mass_properties

      # Note: This vehicle lacks any propulsion system

   end_point_mass_vehicle_type
```

- **演示要点**：演示 point_mass_vehicle_type 的参数：include, mass_properties

### point_mass_vehicle_type（fa-lgt-zll）｜

- **关键词**：point_mass_vehicle_type
- **出处**：`six_dof/six_dof_types/aircraft/fa-lgt/fa-lgt-zll.txt:66-101`　（同签名共 8 处，另见 `six_dof/six_dof_types/misc/srb-rato/srb-rato.txt:78`、`six_dof/six_dof_types/weapons/unguided_rocket/unguided_rocket.txt:76`、`six_dof/six_dof_types/aircraft/fa-lgt/fa-lgt.txt:171`）
- **片段**：

```text
	point_mass_vehicle_type FA-LGT-ZLL_PM6 FA-LGT_PM6
   
      subobject              ZellRocket SRB-RATO_PM6
         parent_rel_x          5.5 ft
         parent_rel_y          0.0 ft
         parent_rel_z          0.0 ft
 
         parent_rel_yaw        0.0 deg
         parent_rel_pitch      0.0 deg
         parent_rel_roll       0.0 deg

         separation_vx         0.0 ft/sec
         separation_vy         0.0 ft/sec
         separation_vz         5.0 ft/sec

         separation_omega_x    0.0 deg/sec
         separation_omega_y  -10.0 deg/sec
         separation_omega_z    0.0 deg/sec
      end_subobject

      sequencer  IgniteZellRocket
         event_timer                 4.9 sec
         action_ignite_subobject     ZellRocket
      end_sequencer
      
      sequencer  Launch
         event_timer                 5 sec
         action_jett_self
      end_sequencer
      
      sequencer  JettisonZellRocket
         event_timer                 8.0 sec
         action_jett_obj             ZellRocket
      end_sequencer

   end_point_mass_vehicle_type
```

- **演示要点**：演示 point_mass_vehicle_type（最小结构，无子参数）

### propulsion_data（fa-hvy）｜

- **关键词**：propulsion_data, engine, fuel_tank, throttle_setting_mil, throttle_setting_ab, throttle_setting_reverser, throttle_setting_pitch
- **出处**：`p6dof/p6dof_types/aircraft/fa-hvy/fa-hvy.txt:37-83`　（同签名共 2 处，另见 `six_dof/six_dof_types/aircraft/fa-hvy/fa-hvy.txt:37`）
- **片段**：

```text
      propulsion_data

         engine Engine_Right  F-H4-22A-1-TF
            rel_pos_x                      -13.34660 ft
            rel_pos_y                        2.60000 ft
            rel_pos_z                        0.47728 ft
            rel_yaw                          0.00000 deg
            rel_pitch                        0.00000 deg
            fuel_feed                   MainFuelTank
         end_engine

         engine Engine_Left  F-H4-22A-1-TF
            rel_pos_x                      -13.34660 ft
            rel_pos_y                       -2.60000 ft
            rel_pos_z                        0.47728 ft
            rel_yaw                          0.00000 deg
            rel_pitch                        0.00000 deg
            fuel_feed                   MainFuelTank
         end_engine

         # Current fuel tank support is limited to a single tank.
         # Future Mover Creator upgrades may support more complex, multi-tank fuel systems.

         fuel_tank  MainFuelTank
            max_fuel_quantity            25400.00000 lbs
            current_fuel_quantity        25400.00000 lbs
            max_flow_rate              1000000.00000 lbs/sec
            max_fill_rate              1000000.00000 lbs/sec
            max_xfer_rate              1000000.00000 lbs/sec
            cg_full_x                        0.65342 ft
            cg_full_y                       -0.00000 ft
            cg_full_z                       -0.02272 ft
            cg_empty_x                       0.65342 ft
            cg_empty_y                      -0.00000 ft
            cg_empty_z                      -0.02272 ft
         end_fuel_tank

         # Throttle controls:
         throttle_setting_mil         ThrottleMilitary
         throttle_setting_ab          ThrottleAfterburner
         throttle_setting_reverser    ThrottleThrustReverser

         # Thrust vectoring controls:
         #throttle_setting_yaw        ThrustVectoringYaw
         throttle_setting_pitch       ThrustVectoringPitch

      end_propulsion_data
```

- **演示要点**：演示 propulsion_data 的参数：engine, fuel_tank, throttle_setting_mil, throttle_setting_ab, throttle_setting_reverser, throttle_setting_pitch

### propulsion_data（fa-lgt）｜

- **关键词**：propulsion_data, engine, fuel_tank, fuel_transfer, throttle_setting_mil, throttle_setting_ab, throttle_setting_reverser
- **出处**：`p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt.txt:37-167`　（同签名共 2 处，另见 `six_dof/six_dof_types/aircraft/fa-lgt/fa-lgt.txt:37`）
- **片段**：

```text
      propulsion_data

         engine Engine  F-L4-11A-1-TF
            rel_pos_x                       -7.71046 ft
            rel_pos_y                       -0.00000 ft
            rel_pos_z                       -0.13705 ft
            rel_yaw                          0.00000 deg
            rel_pitch                        0.00000 deg
            fuel_feed                   MainFuelTank
         end_engine

         # Current fuel tank support is limited to a single tank.
         # Future Mover Creator upgrades may support more complex, multi-tank fuel systems.

         fuel_tank  MainFuelTank
            max_fuel_quantity             7000.00000 lbs
            current_fuel_quantity         7000.00000 lbs
            max_flow_rate              1000000.00000 lbs/sec
            max_fill_rate              1000000.00000 lbs/sec
            max_xfer_rate              1000000.00000 lbs/sec
            cg_full_x                        0.68954 ft
            cg_full_y                       -0.00000 ft
            cg_full_z                       -0.13705 ft
            cg_empty_x                       0.68954 ft
            cg_empty_y                      -0.00000 ft
            cg_empty_z                      -0.13705 ft
         end_fuel_tank

         # Alternatively, for more realistic weight transfer,
         # we can manually introduce additional tanks.
         /* fuel_tank MainFuelTank
            max_fuel_quantity              1000 lbs
            current_fuel_quantity          1000 lbs
            max_flow_rate                   200 lbs/sec
            max_fill_rate                   100 lbs/sec
            max_xfer_rate                   100 lbs/sec
            cg_full_x                        0.68572 ft
            cg_full_y                       -0.00000 ft
            cg_full_z                       -0.13705 ft
            cg_empty_x                       0.68572 ft
            cg_empty_y                      -0.00000 ft
            cg_empty_z                      -0.13705 ft
         end_fuel_tank

         fuel_tank AftTank
            max_fuel_quantity              2000 lbs
            current_fuel_quantity          2000 lbs
            max_flow_rate                   100 lbs/sec
            max_fill_rate                   100 lbs/sec
            max_xfer_rate                   100 lbs/sec
            cg_full_x                       -9.31428 ft
            cg_full_y                       -0.00000 ft
            cg_full_z                       -0.13705 ft
            cg_empty_x                      -9.31428 ft
            cg_empty_y                      -0.00000 ft
            cg_empty_z                      -0.13705 ft
         end_fuel_tank 

         fuel_tank ForeTank
            max_fuel_quantity              2000 lbs
            current_fuel_quantity          2000 lbs
            max_flow_rate                   100 lbs/sec
            max_fill_rate                   100 lbs/sec
            max_xfer_rate                   100 lbs/sec
            cg_full_x                       10.68572 ft
            cg_full_y                       -0.00000 ft
            cg_full_z                       -0.13705 ft
            cg_empty_x                      10.68572 ft
            cg_empty_y                      -0.00000 ft
            cg_empty_z                      -0.13705 ft
         end_fuel_tank 

         fuel_tank RightWingTank
            max_fuel_quantity              1000 lbs
            current_fuel_quantity          1000 lbs
            max_flow_rate                   100 lbs/sec
            max_fill_rate                   100 lbs/sec
            max_xfer_rate                   100 lbs/sec
            cg_full_x                        0.68572 ft
            cg_full_y                       10.00000 ft
            cg_full_z                       -0.13705 ft
            cg_empty_x                       0.68572 ft
            cg_empty_y                      10.00000 ft
            cg_empty_z                      -0.13705 ft
         end_fuel_tank 

         fuel_tank LeftWingTank
            max_fuel_quantity              1000 lbs
            current_fuel_quantity          1000 lbs
            max_flow_rate                   100 lbs/sec
            max_fill_rate                   100 lbs/sec
            max_xfer_rate                   100 lbs/sec
            cg_full_x                        0.68572 ft
            cg_full_y                      -10.00000 ft
            cg_full_z                       -0.13705 ft
            cg_empty_x                       0.68572 ft
            cg_empty_y                     -10.00000 ft
            cg_empty_z                      -0.13705 ft
         end_fuel_tank 

         fuel_transfer LeftWingTankToAftTank
            source_tank LeftWingTank
            target_tank AftTank
         end_fuel_transfer

         fuel_transfer RightWingTankToForeTank
            source_tank RightWingTank
            target_tank ForeTank
         end_fuel_transfer

         fuel_transfer ForeTankToReservoir
            source_tank ForeTank
            target_tank MainFuelTank
         end_fuel_transfer

         fuel_transfer AftTankToReservoir
            source_tank AftTank
            target_tank MainFuelTank
         end_fuel_transfer
         */

         # Throttle controls:
         throttle_setting_mil         ThrottleMilitary
         throttle_setting_ab          ThrottleAfterburner
         throttle_setting_reverser    ThrottleThrustReverser

         # Thrust vectoring controls:
         #throttle_setting_yaw        ThrustVectoringYaw
         #throttle_setting_pitch      ThrustVectoringPitch

      end_propulsion_data
```

- **演示要点**：演示 propulsion_data 的参数：engine, fuel_tank, fuel_transfer, throttle_setting_mil, throttle_setting_ab, throttle_setting_reverser

### propulsion_data（aam-sr-tvc）｜

- **关键词**：propulsion_data, engine, fuel_tank, throttle_setting_mil, throttle_setting_yaw, throttle_setting_pitch
- **出处**：`six_dof/six_dof_types/weapons/aam-sr/aam-sr-tvc.txt:37-71`
- **片段**：

```text
      propulsion_data

         engine Engine  AIM-SR-1-RKT_RB6
            rel_pos_x                       -1.88627 ft
            rel_pos_y                        0.00000 ft
            rel_pos_z                        0.00000 ft
            rel_yaw                          0.00000 deg
            rel_pitch                        0.00000 deg
            fuel_feed   Propellant
         end_engine

         fuel_tank Propellant
            max_fuel_quantity               85.0 lbs
            current_fuel_quantity           85.0 lbs
            max_fill_rate                 100000 lbs/s
            max_flow_rate                 100000 lbs/s
            max_xfer_rate                 100000 lbs/s
            cg_empty_x                       0.0 ft
            cg_empty_y                       0.0 ft
            cg_empty_z                       0.0 ft
            cg_full_x                        0.0 ft
            cg_full_y                        0.0 ft
            cg_full_z                        0.0 ft
         end_fuel_tank

         # This vehicle lacks a fuel tank

         # Throttle controls:
         throttle_setting_mil         ThrottleMilitary

         # Thrust vectoring controls:
         throttle_setting_yaw         ThrustVectoringYaw
         throttle_setting_pitch       ThrustVectoringPitch

      end_propulsion_data
```

- **演示要点**：演示 propulsion_data 的参数：engine, fuel_tank, throttle_setting_mil, throttle_setting_yaw, throttle_setting_pitch

### propulsion_data（fa-lgt_landing-gear）｜

- **关键词**：propulsion_data, engine, fuel_tank, throttle_setting_mil, throttle_setting_ab, throttle_setting_reverser
- **出处**：`p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:37-74`　（同签名共 11 处，另见 `p6dof/p6dof_types/weapons/agm-mrc/agm-mrc.txt:37`、`six_dof/six_dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:37`、`six_dof/six_dof_types/weapons/agm-mrc/agm-mrc.txt:37`）
- **片段**：

```text
      propulsion_data

         engine Engine  F-L4-11A-1-TF
            rel_pos_x                       -7.71046 ft
            rel_pos_y                       -0.00000 ft
            rel_pos_z                       -0.13705 ft
            rel_yaw                          0.00000 deg
            rel_pitch                        0.00000 deg
            fuel_feed                   MainFuelTank
         end_engine

         # Current fuel tank support is limited to a single tank.
         # Future Mover Creator upgrades may support more complex, multi-tank fuel systems.

         fuel_tank  MainFuelTank
            max_fuel_quantity             7000.00000 lbs
            current_fuel_quantity         7000.00000 lbs
            max_flow_rate              1000000.00000 lbs/sec
            max_fill_rate              1000000.00000 lbs/sec
            max_xfer_rate              1000000.00000 lbs/sec
            cg_full_x                        0.68954 ft
            cg_full_y                       -0.00000 ft
            cg_full_z                       -0.13705 ft
            cg_empty_x                       0.68954 ft
            cg_empty_y                      -0.00000 ft
            cg_empty_z                      -0.13705 ft
         end_fuel_tank

         # Throttle controls:
         throttle_setting_mil         ThrottleMilitary
         throttle_setting_ab          ThrottleAfterburner
         throttle_setting_reverser    ThrottleThrustReverser

         # Thrust vectoring controls:
         #throttle_setting_yaw        ThrustVectoringYaw
         #throttle_setting_pitch      ThrustVectoringPitch

      end_propulsion_data
```

- **演示要点**：演示 propulsion_data 的参数：engine, fuel_tank, throttle_setting_mil, throttle_setting_ab, throttle_setting_reverser

### propulsion_data（aam-sr-tvc）｜

- **关键词**：propulsion_data, engine, throttle_setting_mil, throttle_setting_yaw, throttle_setting_pitch
- **出处**：`p6dof/p6dof_types/weapons/aam-sr/aam-sr-tvc.txt:37-56`
- **片段**：

```text
      propulsion_data

         engine Engine  AIM-SR-1-RKT
            rel_pos_x                       -1.88627 ft
            rel_pos_y                        0.00000 ft
            rel_pos_z                        0.00000 ft
            rel_yaw                          0.00000 deg
            rel_pitch                        0.00000 deg
         end_engine

         # This vehicle lacks a fuel tank

         # Throttle controls:
         throttle_setting_mil         ThrottleMilitary

         # Thrust vectoring controls:
         throttle_setting_yaw         ThrustVectoringYaw
         throttle_setting_pitch       ThrustVectoringPitch

      end_propulsion_data
```

- **演示要点**：演示 propulsion_data 的参数：engine, throttle_setting_mil, throttle_setting_yaw, throttle_setting_pitch

### propulsion_data（aam-mr）｜

- **关键词**：propulsion_data, engine, fuel_tank, throttle_setting_mil
- **出处**：`six_dof/six_dof_types/weapons/aam-mr/aam-mr.txt:37-69`　（同签名共 7 处，另见 `six_dof/six_dof_types/weapons/lrm-1-a/lrm-1-a.txt:39`、`six_dof/six_dof_types/weapons/lrm-1-c/lrm-1-c.txt:38`、`six_dof/six_dof_types/weapons/sam-mr/sam-mr.txt:39`）
- **片段**：

```text
      propulsion_data

         engine Engine  AIM-MR-1-RKT_RB6
            rel_pos_x                       -2.97090 ft
            rel_pos_y                        0.00000 ft
            rel_pos_z                       -0.00000 ft
            rel_yaw                          0.00000 deg
            rel_pitch                        0.00000 deg
            fuel_feed   Propellant
         end_engine

         fuel_tank Propellant
            max_fuel_quantity              204.3 lbs
            current_fuel_quantity          204.3 lbs
            max_fill_rate                 100000 lbs/s
            max_flow_rate                 100000 lbs/s
            max_xfer_rate                 100000 lbs/s
            cg_empty_x                       0.0 ft
            cg_empty_y                       0.0 ft
            cg_empty_z                       0.0 ft
            cg_full_x                        0.0 ft
            cg_full_y                        0.0 ft
            cg_full_z                        0.0 ft
         end_fuel_tank

         # Throttle controls:
         throttle_setting_mil         ThrottleMilitary

         # Thrust vectoring controls:
         #throttle_setting_yaw        ThrustVectoringYaw
         #throttle_setting_pitch      ThrustVectoringPitch

      end_propulsion_data
```

- **演示要点**：演示 propulsion_data 的参数：engine, fuel_tank, throttle_setting_mil

### propulsion_data（simple-icbm）｜

- **关键词**：propulsion_data, fuel_tank, fuel_transfer, engine
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:397-491`
- **片段**：

```text
      propulsion_data
         fuel_tank FeederTank
            max_fuel_quantity      10.0 lbs
            current_fuel_quantity       10.0 lbs
            max_flow_rate          30.0 lbs/sec
            max_fill_rate          30.0 lbs/sec
            max_xfer_rate          30.0 lbs/sec
            cg_full_x              0.0 ft
            cg_full_y              0.0 ft
            cg_full_z              0.0 ft
            cg_empty_x             0.0 ft
            cg_empty_y             0.0 ft
            cg_empty_z             0.0 ft
         end_fuel_tank
         fuel_tank Tank1
            max_fuel_quantity      10.0 lbs
            current_fuel_quantity       10.0 lbs
            max_flow_rate          30.0 lbs/sec
            max_fill_rate          30.0 lbs/sec
            max_xfer_rate          30.0 lbs/sec
            cg_full_x              0.0 ft
            cg_full_y              0.0 ft
            cg_full_z              0.0 ft
            cg_empty_x             0.0 ft
            cg_empty_y             0.0 ft
            cg_empty_z             0.0 ft
         end_fuel_tank
         fuel_tank Tank2
            max_fuel_quantity      10.0 lbs
            current_fuel_quantity       10.0 lbs
            max_flow_rate          30.0 lbs/sec
            max_fill_rate          30.0 lbs/sec
            max_xfer_rate          30.0 lbs/sec
            cg_full_x              0.0 ft
            cg_full_y              0.0 ft
            cg_full_z              0.0 ft
            cg_empty_x             0.0 ft
            cg_empty_y             0.0 ft
            cg_empty_z             0.0 ft
         end_fuel_tank
         fuel_tank  Tank3
            max_fuel_quantity      10.0 lbs
            current_fuel_quantity       10.0 lbs
            max_flow_rate          30.0 lbs/sec
            max_fill_rate          30.0 lbs/sec
            max_xfer_rate          30.0 lbs/sec
            cg_full_x              0.0 ft
            cg_full_y              0.0 ft
            cg_full_z              0.0 ft
            cg_empty_x             0.0 ft
            cg_empty_y             0.0 ft
            cg_empty_z             0.0 ft
         end_fuel_tank
         fuel_tank  Tank4
            max_fuel_quantity      10.0 lbs
            current_fuel_quantity       10.0 lbs
            max_flow_rate          30.0 lbs/sec
            max_fill_rate          30.0 lbs/sec
            max_xfer_rate          30.0 lbs/sec
            cg_full_x              0.0 ft
            cg_full_y              0.0 ft
            cg_full_z              0.0 ft
            cg_empty_x             0.0 ft
            cg_empty_y             0.0 ft
            cg_empty_z             0.0 ft
         end_fuel_tank

         fuel_transfer    T1toFeeder
            source_tank           Tank1
            target_tank           FeederTank
         end_fuel_transfer
         fuel_transfer    T2toFeeder
            source_tank           Tank2
            target_tank           FeederTank
         end_fuel_transfer
         fuel_transfer    T3toFeeder
            source_tank           Tank3
            target_tank           FeederTank
         end_fuel_transfer
         fuel_transfer    T4toFeeder
            source_tank           Tank4
            target_tank           FeederTank
         end_fuel_transfer

         engine    PBVMainEngine   ICBM_PBV_MainEngine
            rel_pos_x             0.0 ft
            rel_pos_y             0.0 ft
            rel_pos_z             0.0 ft
            rel_yaw               0.0 deg
            rel_pitch             0.0 deg
            rel_roll              0.0 deg
            fuel_feed             FeederTank
         end_engine

      end_propulsion_data
```

- **演示要点**：演示 propulsion_data 的参数：fuel_tank, fuel_transfer, engine

### propulsion_data（LTE_FIGHTER）｜

- **关键词**：propulsion_data, engine, fuel_tank
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/LTE_FIGHTER.txt:24-38`　（同签名共 18 处，另见 `six_dof_with_brawler/six_dof_types/aircraft/LTE_FIGHTER/LTE_FIGHTER.txt:24`、`six_dof/six_dof_types/spacecraft/orbiter-booster/orbiter-booster.txt:40`、`six_dof/six_dof_types/spacecraft/orbiter-main/orbiter-main.txt:42`）
- **片段**：

```text
      propulsion_data

         engine Engine LTE_FIGHTER_Eng_PM6
            fuel_feed	MainFuelTank
         end_engine

         fuel_tank MainFuelTank
            max_fuel_quantity      20718.0 lbs
            current_fuel_quantity  20718.0 lbs
            max_flow_rate          10000.00 lbs/sec
            max_fill_rate          10000.00 lbs/sec
            max_xfer_rate          10000.00 lbs/sec
         end_fuel_tank

      end_propulsion_data
```

- **演示要点**：演示 propulsion_data 的参数：engine, fuel_tank

### propulsion_data（srb-rato）｜

- **关键词**：propulsion_data, engine, throttle_setting_mil
- **出处**：`p6dof/p6dof_types/misc/srb-rato/srb-rato.txt:35-54`　（同签名共 6 处，另见 `p6dof/p6dof_types/weapons/aam-mr/aam-mr.txt:37`、`p6dof/p6dof_types/weapons/aam-sr/aam-sr.txt:37`、`p6dof/p6dof_types/weapons/agm-sr/agm-sr.txt:37`）
- **片段**：

```text
      propulsion_data

         engine Engine  RATO-RKT
            rel_pos_x                        1.55536 ft
            rel_pos_y                        0.00000 ft
            rel_pos_z                        0.00000 ft
            rel_yaw                          0.00000 deg
            rel_pitch                        0.00000 deg
         end_engine

         # This vehicle lacks a fuel tank

         # Throttle controls:
         throttle_setting_mil         ThrottleMilitary

         # Thrust vectoring controls:
         #throttle_setting_yaw        ThrustVectoringYaw
         #throttle_setting_pitch      ThrustVectoringPitch

      end_propulsion_data
```

- **演示要点**：演示 propulsion_data 的参数：engine, throttle_setting_mil

### propulsion_data（simple-icbm）｜

- **关键词**：propulsion_data, engine
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:32-41`　（同签名共 4 处，另见 `p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:172`、`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:312`、`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:351`）
- **片段**：

```text
      propulsion_data
         engine     Stage1Motor   ICBM_Stage1_Rocket
            rel_pos_x             0.0 ft
            rel_pos_y             0.0 ft
            rel_pos_z             0.0 ft
            rel_yaw               0.0 deg
            rel_pitch             0.0 deg
            rel_roll              0.0 deg
         end_engine
      end_propulsion_data
```

- **演示要点**：演示 propulsion_data 的参数：engine

### propulsion_data（tnk-f16-370g）｜

- **关键词**：propulsion_data, fuel_tank
- **出处**：`p6dof/p6dof_types/misc/tnk-f16-370g/tnk-f16-370g.txt:34-53`　（同签名共 3 处，另见 `six_dof/six_dof_types/misc/tnk-f16-370g/tnk-f16-370g.txt:33`、`six_dof/six_dof_types/misc/tnk-f16-370g/tnk-f16-370g.txt:64`）
- **片段**：

```text
      propulsion_data

         # Current fuel tank support is limited to a single tank.
         # Future Mover Creator upgrades may support more complex, multi-tank fuel systems.

         fuel_tank  MainFuelTank
            max_fuel_quantity             2400.00000 lbs
            current_fuel_quantity         2400.00000 lbs
            max_flow_rate              1000000.00000 lbs/sec
            max_fill_rate              1000000.00000 lbs/sec
            max_xfer_rate              1000000.00000 lbs/sec
            cg_full_x                       -0.00000 ft
            cg_full_y                        0.00000 ft
            cg_full_z                        0.00360 ft
            cg_empty_x                      -0.00000 ft
            cg_empty_y                       0.00000 ft
            cg_empty_z                       0.00360 ft
         end_fuel_tank

      end_propulsion_data
```

- **演示要点**：演示 propulsion_data 的参数：fuel_tank

### propulsion_data（simple-icbm）｜

- **关键词**：propulsion_data
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:580-582`　（同签名共 2 处，另见 `p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:628`）
- **片段**：

```text
      propulsion_data
        # No propulsion data
      end_propulsion_data
```

- **演示要点**：演示 propulsion_data（最小结构，无子参数）

### rates（fuel_table_demo）｜

- **关键词**：rates, units
- **出处**：`example_scripts/fuel_table_demo.txt:41-47`　（同签名共 3 处，另见 `example_scripts/fuel_table_demo.txt:60`、`multiresolution_demos/fuel/fuel_include.txt:35`）
- **片段**：

```text
         rates
            units kg/s
          # .25  0.5  .75  1.0 mach
            3.0  4.5  5.5  7.0  # Sea Level
            2.0  3.5  4.5  6.0  # 5000 m
            1.0  2.5  3.5  5.0  # 10000 m
         end_rates
```

- **演示要点**：演示 rates 的参数：units

### response_curve（simple_lwir_sensor）｜

- **关键词**：response_curve, wavelength
- **出处**：`sosm/test_mission/simple_plot/simple_lwir_sensor.txt:18-21`　（同签名共 4 处，另见 `sosm/test_mission/simple_plot/simple_mwir_sensor.txt:18`、`sosm/sensors/gaussian_lwir.txt:23`、`sosm/sensors/gaussian_mwir.txt:23`）
- **片段**：

```text
   response_curve
      wavelength  8 um  1.0
      wavelength 12 um  1.0
   end_response_curve
```

- **演示要点**：演示 response_curve 的参数：wavelength

### rigid_body_engine_type（b-h3-81a-1-tf）｜

- **关键词**：rigid_body_engine_type, thrust_offset, inop_ref_area, jet, file, throttle_setting_mil
- **出处**：`six_dof/six_dof_types/aircraft/b-hvy/prop/jet_engines/b-h3-81a-1-tf/b-h3-81a-1-tf.txt:22-73`
- **片段**：

```text
   rigid_body_engine_type   B-H3-81A-1-TF_RB6   BASE_TYPE

      thrust_offset            -5.9000 ft

      inop_ref_area            15.3000 ft^2

      jet

			tsfc_idle_pph             0.7800  # lb/lb/hr
			tsfc_mil_pph              0.7800  # lb/lb/hr

			//-------------------------------------------------------------------------

			rated_thrust_idle      2500.0000 lbf
			rated_thrust_mil      17000.0000 lbf
			//-------------------------------------------------------------------------

			spin_up_table_mil_per_sec
				// throttle_level  spin_up_per_sec
							  0.0000               0.0500
							  0.2500               0.1625
							  0.5000               0.2750
							  0.7500               0.3875
							  1.0000               0.5000
			end_spin_up_table_mil_per_sec

			spin_down_table_mil_per_sec
				// throttle_level  spin_down_per_sec
							  0.0000               0.0500
							  0.2500               0.1625
							  0.5000               0.2750
							  0.7500               0.3875
							  1.0000               0.5000
			end_spin_down_table_mil_per_sec

			//-------------------------------------------------------------------------

			thrust_idle_alt_mach_table
				file data/thrust_idle_alt_mach.txt
			end_thrust_idle_alt_mach_table

			//-------------------------------------------------------------------------

			thrust_mil_alt_mach_table
				file data/thrust_mil_alt_mach.txt
			end_thrust_mil_alt_mach_table

      end_jet

      throttle_setting_mil    ThrottleMilitary
      
   end_rigid_body_engine_type
```

- **演示要点**：演示 rigid_body_engine_type 的参数：thrust_offset, inop_ref_area, jet, file, throttle_setting_mil

### rigid_body_engine_type（f-h4-22a-1-tf）｜

- **关键词**：rigid_body_engine_type, thrust_offset, inop_ref_area, jet, throttle_setting_ab, throttle_setting_mil
- **出处**：`six_dof/six_dof_types/aircraft/fa-hvy/prop/jet_engines/f-h4-22a-1-tf/f-h4-22a-1-tf.txt:23-99`　（同签名共 2 处，另见 `six_dof/six_dof_types/aircraft/fa-lgt/prop/jet_engines/f-l4-11a-1-tf/f-l4-11a-1-tf.txt:23`）
- **片段**：

```text
   rigid_body_engine_type   F-H4-22A-1-TF_RB6   BASE_TYPE

      thrust_offset           -11.0000 ft
      inop_ref_area             7.0000 ft^2

      jet

         tsfc_idle_pph             0.7500  # lb/lb/hr
         tsfc_mil_pph              0.7500  # lb/lb/hr
         tsfc_ab_pph               1.9500  # lb/lb/hr

         //-------------------------------------------------------------------------

         rated_thrust_idle      3000.0000 lbf
         rated_thrust_mil      19400.0000 lbf
         rated_thrust_ab       32000.0000 lbf
         //-------------------------------------------------------------------------

         spin_up_table_mil_per_sec
            // throttle_level  spin_up_per_sec
                       0.0000               0.0500
                       0.2500               0.1625
                       0.5000               0.2750
                       0.7500               0.3875
                       1.0000               0.5000
         end_spin_up_table_mil_per_sec

         spin_down_table_mil_per_sec
            // throttle_level  spin_down_per_sec
                       0.0000               0.0500
                       0.2500               0.1625
                       0.5000               0.2750
                       0.7500               0.3875
                       1.0000               0.5000
         end_spin_down_table_mil_per_sec

         spin_up_table_ab_per_sec
            // throttle_level  spin_up_per_sec
                       0.0000               0.1000
                       0.2500               0.1625
                       0.5000               0.2250
                       0.7500               0.2875
                       1.0000               0.3500
         end_spin_up_table_ab_per_sec

         spin_down_table_ab_per_sec
            // throttle_level  spin_up_per_sec
                       0.0000               0.2000
                       0.2500               0.3250
                       0.5000               0.4500
                       0.7500               0.5750
                       1.0000               0.7000
         end_spin_down_table_ab_per_sec
         //-------------------------------------------------------------------------

         thrust_idle_alt_mach_table
            file data/thrust_idle_alt_mach.txt
         end_thrust_idle_alt_mach_table

         //-------------------------------------------------------------------------

         thrust_mil_alt_mach_table
            file data/thrust_mil_alt_mach.txt
         end_thrust_mil_alt_mach_table

         //-------------------------------------------------------------------------

         thrust_ab_alt_mach_table
            file data/thrust_ab_alt_mach.txt
         end_thrust_ab_alt_mach_table

      end_jet

      throttle_setting_ab     ThrottleAfterburner
      throttle_setting_mil    ThrottleMilitary
      
   end_rigid_body_engine_type
```

- **演示要点**：演示 rigid_body_engine_type 的参数：thrust_offset, inop_ref_area, jet, throttle_setting_ab, throttle_setting_mil

### rigid_body_engine_type（b-h4-40w-1-tf）｜

- **关键词**：rigid_body_engine_type, thrust_offset, inop_ref_area, jet, throttle_setting_mil
- **出处**：`six_dof/six_dof_types/aircraft/b-fw/prop/jet_engines/b-h4-40w-1-tf/b-h4-40w-1-tf.txt:23-73`　（同签名共 3 处，另见 `six_dof/six_dof_types/weapons/agm-mrc/prop/jet_engines/generic-cm-1-tf/generic-cm-1-tf.txt:23`、`six_dof/six_dof_types/aircraft/c-hvy/prop/jet_engines/c-hj-41a-1-tf/c-hj-41a-1-tf.txt:23`）
- **片段**：

```text
   rigid_body_engine_type   B-H4-40W-1-TF_RB6   BASE_TYPE

      thrust_offset            -6.0000 ft
      inop_ref_area             8.0000 ft^2

      jet

         tsfc_idle_pph             0.3800  # lb/lb/hr
         tsfc_mil_pph              0.3800  # lb/lb/hr

         //-------------------------------------------------------------------------

         rated_thrust_idle      5000.0000 lbf
         rated_thrust_mil      19000.0000 lbf
         //-------------------------------------------------------------------------

         spin_up_table_mil_per_sec
            // throttle_level  spin_up_per_sec
                       0.0000               0.0500
                       0.2500               0.1625
                       0.5000               0.2750
                       0.7500               0.3875
                       1.0000               0.5000
         end_spin_up_table_mil_per_sec

         spin_down_table_mil_per_sec
            // throttle_level  spin_down_per_sec
                       0.0000               0.0500
                       0.2500               0.1625
                       0.5000               0.2750
                       0.7500               0.3875
                       1.0000               0.5000
         end_spin_down_table_mil_per_sec

         //-------------------------------------------------------------------------

         thrust_idle_alt_mach_table
            file data/thrust_idle_alt_mach.txt
         end_thrust_idle_alt_mach_table

         //-------------------------------------------------------------------------

         thrust_mil_alt_mach_table
            file data/thrust_mil_alt_mach.txt
         end_thrust_mil_alt_mach_table

      end_jet

      throttle_setting_mil    ThrottleMilitary
      
   end_rigid_body_engine_type
```

- **演示要点**：演示 rigid_body_engine_type 的参数：thrust_offset, inop_ref_area, jet, throttle_setting_mil

### rigid_body_engine_type（rato-rkt）｜

- **关键词**：rigid_body_engine_type, thrust_offset, solid_propellant_rocket
- **出处**：`six_dof/six_dof_types/misc/srb-rato/prop/solid_propellant_rockets/rato-rkt/rato-rkt.txt:23-99`　（同签名共 7 处，另见 `six_dof/six_dof_types/weapons/aam-sr/prop/solid_propellant_rockets/aim-sr-1-rkt/aim-sr-1-rkt.txt:23`、`six_dof/six_dof_types/weapons/unguided_rocket/prop/solid_propellant_rockets/unguided_rocket_rocketmotor/unguided_rocket_rocketmotor.txt:23`、`six_dof/six_dof_types/weapons/aam-mr/prop/solid_propellant_rockets/aim-mr-1-rkt/aim-mr-1-rkt.txt:22`）
- **片段**：

```text
   rigid_body_engine_type   RATO-RKT_RB6   BASE_TYPE

      thrust_offset          -5.00 ft

      solid_propellant_rocket
      
         thrust_vs_time_sealevel
            // time    thrust_lbs
                 0.000           0.000
                 0.100      100000.000
                 2.800       80000.000
                 3.000           0.000
         end_thrust_vs_time_sealevel
      
         //-------------------------------------------------------------------------
      
         isp_vs_alt
            // alt          Isp
                 0.0      240.000000
              5000.0      242.766560
             10000.0      245.230420
             15000.0      247.415200
             20000.0      249.343720
             25000.0      251.037580
             30000.0      252.517340
             35000.0      253.802480
             40000.0      255.076600
             45000.0      256.128340
             50000.0      256.955400
             55000.0      257.605800
             60000.0      258.117240
             65000.0      258.519460
             70000.0      258.842120
             75000.0      259.093700
             80000.0      259.289420
             85000.0      259.441940
             90000.0      259.561000
             95000.0      259.654100
            100000.0      259.727020
            105000.0      259.784220
            110000.0      259.830960
            115000.0      259.866980
            120000.0      259.894880
            125000.0      259.916580
            130000.0      259.933540
            135000.0      259.946840
            140000.0      259.957320
            145000.0      259.965620
            150000.0      259.972220
            155000.0      259.977400
            160000.0      259.981360
            165000.0      259.984620
            170000.0      259.987200
            175000.0      259.989300
            180000.0      259.991100
            185000.0      259.992600
            190000.0      259.993880
            195000.0      259.994940
            200000.0      259.995840
            210000.0      259.997220
            220000.0      259.998160
            230000.0      259.998800
            240000.0      259.999240
            250000.0      259.999520
            260000.0      259.999720
            270000.0      259.999820
            280000.0      259.999900
            400000.0      260.000000
         end_isp_vs_alt

         //-------------------------------------------------------------------------

         rated_thrust        100000.0 lbf

      end_solid_propellant_rocket
   
   end_rigid_body_engine_type
```

- **演示要点**：演示 rigid_body_engine_type 的参数：thrust_offset, solid_propellant_rocket

### rigid_body_engine_type（orbiter-booster-rkt）｜

- **关键词**：rigid_body_engine_type, include
- **出处**：`six_dof/six_dof_types/spacecraft/orbiter-booster/prop/solid_propellant_rockets/orbiter-booster-rkt/orbiter-booster-rkt.txt:22-24`
- **片段**：

```text
   rigid_body_engine_type    ORBITER-BOOSTER-RKT_RB6   BASE_TYPE   
      include orbiter-booster-rkt_data.txt
   end_rigid_body_engine_type
```

- **演示要点**：演示 rigid_body_engine_type 的参数：include

### rigid_body_vehicle_type（lrm-1-a）｜

- **关键词**：rigid_body_vehicle_type, include, mass_properties, propulsion_data, subobject, sequencer
- **出处**：`six_dof/six_dof_types/weapons/lrm-1-a/lrm-1-a.txt:23-93`
- **片段**：

```text
   rigid_body_vehicle_type LRM-1-A_RB6 BASE_TYPE

      include aero/aero_rb6.txt                 # Defines the vehicle aerodynamics
      include controls/control_inputs_rb6.txt   # Defines the control inputs (stick, rudder, throttle, etc)
      include controls/flight_controls_rb6.txt  # Defines how the control inputs move the control surfaces

      mass_properties
         mass                              145.00000 lbs
         moment_of_inertia_ixx               0.39034 slug*ft^2
         moment_of_inertia_iyy              20.71385 slug*ft^2
         moment_of_inertia_izz              20.71385 slug*ft^2
         center_of_mass_x                    0.00000 ft
         center_of_mass_y                   -0.00000 ft
         center_of_mass_z                    0.00000 ft
      end_mass_properties

      propulsion_data

         engine Engine  LRM-ST-RKT_RB6
            rel_pos_x                       -1.71444 ft
            rel_pos_y                        0.00000 ft
            rel_pos_z                       -0.00000 ft
            rel_yaw                          0.00000 deg
            rel_pitch                        0.00000 deg
            fuel_feed  Propellant
         end_engine

         fuel_tank Propellant
            max_fuel_quantity               85.0 lbs
            current_fuel_quantity           85.0 lbs
            max_fill_rate                 100000 lbs/s
            max_flow_rate                 100000 lbs/s
            max_xfer_rate                 100000 lbs/s
            cg_empty_x                       0.0 ft
            cg_empty_y                       0.0 ft
            cg_empty_z                       0.0 ft
            cg_full_x                        0.0 ft
            cg_full_y                        0.0 ft
            cg_full_z                        0.0 ft
         end_fuel_tank

         # Throttle controls:
         throttle_setting_mil         ThrottleMilitary

         # Thrust vectoring controls:
         #throttle_setting_yaw        ThrustVectoringYaw
         #throttle_setting_pitch      ThrustVectoringPitch

      end_propulsion_data
      
      subobject BoosterStage LRM-1-C_RB6
         parent_rel_x   -6 ft
         separation_vx -10 fps         
      end_subobject

      # This sequencer will ignite/start the engine(s)
      sequencer ReleaseFromVehicle
         event_released_from_parent
         action_ignite_subobject BoosterStage
         #action_disable_controls
      end_sequencer
      
      sequencer BoosterExpended
         event_nx_below  -0.5 g
         
         action_jett_obj BoosterStage
         #action_enable_controls 
         action_ignite_engine Engine
      end_sequencer
      
   end_rigid_body_vehicle_type
```

- **演示要点**：演示 rigid_body_vehicle_type 的参数：include, mass_properties, propulsion_data, subobject, sequencer

### rigid_body_vehicle_type（unguided_rocket）｜

- **关键词**：rigid_body_vehicle_type, include, mass_properties, propulsion_data, sequencer
- **出处**：`six_dof/six_dof_types/weapons/unguided_rocket/unguided_rocket.txt:21-74`　（同签名共 8 处，另见 `six_dof/six_dof_types/misc/srb-rato/srb-rato.txt:21`、`six_dof/six_dof_types/weapons/aam-mr/aam-mr.txt:21`、`six_dof/six_dof_types/weapons/lrm-1-c/lrm-1-c.txt:22`）
- **片段**：

```text
   rigid_body_vehicle_type UNGUIDED_ROCKET_RB6 BASE_TYPE

      include aero/aero_rb6.txt                 # Defines the vehicle aerodynamics

      mass_properties
         mass                               80.71875 lbs
         moment_of_inertia_ixx               0.10135 slug*ft^2
         moment_of_inertia_iyy               7.01084 slug*ft^2
         moment_of_inertia_izz               7.01084 slug*ft^2
         center_of_mass_x                    0.00000 ft
         center_of_mass_y                    0.00000 ft
         center_of_mass_z                   -0.00000 ft
      end_mass_properties

      propulsion_data

         engine Engine  UNGUIDED_ROCKET_ROCKETMOTOR_RB6
            rel_pos_x                       -2.35684 ft
            rel_pos_y                        0.00000 ft
            rel_pos_z                       -0.00000 ft
            rel_yaw                          0.00000 deg
            rel_pitch                        0.00000 deg
            fuel_feed   Propellant
         end_engine

         fuel_tank Propellant
            max_fuel_quantity               64.3 lbs
            current_fuel_quantity           64.3 lbs
            max_fill_rate                 100000 lbs/s
            max_flow_rate                 100000 lbs/s
            max_xfer_rate                 100000 lbs/s
            cg_empty_x                       0.0 ft
            cg_empty_y                       0.0 ft
            cg_empty_z                       0.0 ft
            cg_full_x                        0.0 ft
            cg_full_y                        0.0 ft
            cg_full_z                        0.0 ft
         end_fuel_tank

         # Throttle controls:
         throttle_setting_mil         ThrottleMilitary

         # Thrust vectoring controls:
         #throttle_setting_yaw        ThrustVectoringYaw
         #throttle_setting_pitch      ThrustVectoringPitch

      end_propulsion_data

      # This sequencer will ignite/start the engine(s)
      sequencer ReleaseFromVehicle
         event_released_from_parent
         action_ignite_engine Engine
      end_sequencer
   end_rigid_body_vehicle_type
```

- **演示要点**：演示 rigid_body_vehicle_type 的参数：include, mass_properties, propulsion_data, sequencer

### rigid_body_vehicle_type（gbu-500）｜

- **关键词**：rigid_body_vehicle_type, include, mass_properties, sequencer
- **出处**：`six_dof/six_dof_types/weapons/gbu-500/gbu-500.txt:19-42`　（同签名共 2 处，另见 `six_dof/six_dof_types/weapons/ubu-500/ubu-500-hd.txt:20`）
- **片段**：

```text
   rigid_body_vehicle_type GBU-500_RB6 BASE_TYPE

      include aero/aero_rb6.txt                 # Defines the vehicle aerodynamics
      include controls/control_inputs_rb6.txt   # Defines the control inputs (stick, rudder, throttle, etc)
      include controls/flight_controls_rb6.txt  # Defines how the control inputs move the control surfaces

      mass_properties
         mass                              500.00000 lbs
         moment_of_inertia_ixx               1.53565 slug*ft^2
         moment_of_inertia_iyy              43.45092 slug*ft^2
         moment_of_inertia_izz              43.45092 slug*ft^2
         center_of_mass_x                   -0.00000 ft
         center_of_mass_y                   -0.00000 ft
         center_of_mass_z                    0.00000 ft
      end_mass_properties

      # Note: This vehicle lacks any propulsion system
      
      sequencer Release
         event_released_from_parent
         action_null
      end_sequencer

   end_rigid_body_vehicle_type
```

- **演示要点**：演示 rigid_body_vehicle_type 的参数：include, mass_properties, sequencer

### rigid_body_vehicle_type（tnk-f16-370g）｜

- **关键词**：rigid_body_vehicle_type, include, mass_properties, propulsion_data
- **出处**：`six_dof/six_dof_types/misc/tnk-f16-370g/tnk-f16-370g.txt:19-54`　（同签名共 7 处，另见 `six_dof/six_dof_types/aircraft/fa-hvy/fa-hvy.txt:21`、`six_dof/six_dof_types/aircraft/c-hvy/c-hvy.txt:21`、`six_dof/six_dof_types/aircraft/b-fw/b-fw.txt:21`）
- **片段**：

```text
   rigid_body_vehicle_type TNK-F16-370G_RB6 BASE_TYPE

      include aero/aero_rb6.txt                 # Defines the vehicle aerodynamics

      mass_properties
         mass                              200.00000 lbs
         moment_of_inertia_ixx               5.04840 slug*ft^2
         moment_of_inertia_iyy             179.64406 slug*ft^2
         moment_of_inertia_izz             179.84623 slug*ft^2
         center_of_mass_x                    0.00000 ft
         center_of_mass_y                    0.00000 ft
         center_of_mass_z                    0.00000 ft
      end_mass_properties

      propulsion_data

         # Current fuel tank support is limited to a single tank.
         # Future Mover Creator upgrades may support more complex, multi-tank fuel systems.

         fuel_tank  MainFuelTank
            max_fuel_quantity             2400.00000 lbs
            current_fuel_quantity         2400.00000 lbs
            max_flow_rate              1000000.00000 lbs/sec
            max_fill_rate              1000000.00000 lbs/sec
            max_xfer_rate              1000000.00000 lbs/sec
            cg_full_x                       -0.00000 ft
            cg_full_y                        0.00000 ft
            cg_full_z                        0.00360 ft
            cg_empty_x                      -0.00000 ft
            cg_empty_y                       0.00000 ft
            cg_empty_z                       0.00360 ft
         end_fuel_tank

      end_propulsion_data

   end_rigid_body_vehicle_type
```

- **演示要点**：演示 rigid_body_vehicle_type 的参数：include, mass_properties, propulsion_data

### rigid_body_vehicle_type（fa-lgt_external-tanks）｜

- **关键词**：rigid_body_vehicle_type, subobject, fuel_transfer, sequencer
- **出处**：`six_dof/six_dof_types/aircraft/fa-lgt/fa-lgt_external-tanks.txt:22-63`
- **片段**：

```text
   rigid_body_vehicle_type FA-LGT-EXTERNAL-TANKS_RB6 FA-LGT_RB6
   
      subobject TankLft TNK-F16-370G_RB6
         parent_rel_x        -1.0 ft
         parent_rel_y        -6.0 ft
         parent_rel_z         2.5 ft
         parent_rel_pitch    -1.0 deg
         separation_vz        2.0 ft/sec
         separation_omega_x   0.0 deg/sec
         separation_omega_y -45.0 deg/sec
         separation_omega_z   0.0 deg/sec
      end_subobject

      subobject TankRgt TNK-F16-370G_RB6
         parent_rel_x        -1.0 ft
         parent_rel_y         6.0 ft
         parent_rel_z         2.5 ft
         parent_rel_pitch    -1.0 deg
         separation_vz        2.0 ft/sec
         separation_omega_x   0.0 deg/sec
         separation_omega_y -45.0 deg/sec
         separation_omega_z   0.0 deg/sec
      end_subobject

      fuel_transfer LeftTankToMainXfer
         source_tank TankLft.MainFuelTank
         target_tank MainFuelTank
         #target_tank LeftWingTank   # Uncomment if using multiple internal tanks for FA-LGT
      end_fuel_transfer

      fuel_transfer RightTankToMainXfer
         source_tank TankRgt.MainFuelTank
         target_tank MainFuelTank
         #target_tank RightWingTank   # Uncomment if using multiple internal tanks for FA-LGT
      end_fuel_transfer

      sequencer DropExternalTanks
         action_jett_obj TankRgt
         action_jett_obj TankLft
      end_sequencer

   end_rigid_body_vehicle_type
```

- **演示要点**：演示 rigid_body_vehicle_type 的参数：subobject, fuel_transfer, sequencer

### rigid_body_vehicle_type（ubu-500-ld）｜

- **关键词**：rigid_body_vehicle_type, include, mass_properties
- **出处**：`six_dof/six_dof_types/weapons/ubu-500/ubu-500-ld.txt:19-35`
- **片段**：

```text
   rigid_body_vehicle_type UBU-500-LD_RB6 BASE_TYPE

      include aero/aero_rb6.txt                 # Defines the vehicle aerodynamics

      mass_properties
         mass                              500.00000 lbs
         moment_of_inertia_ixx               0.67780 slug*ft^2
         moment_of_inertia_iyy              39.55762 slug*ft^2
         moment_of_inertia_izz              39.55762 slug*ft^2
         center_of_mass_x                    0.00000 ft
         center_of_mass_y                   -0.00000 ft
         center_of_mass_z                    0.00000 ft
      end_mass_properties

      # Note: This vehicle lacks any propulsion system

   end_rigid_body_vehicle_type
```

- **演示要点**：演示 rigid_body_vehicle_type 的参数：include, mass_properties

### rigid_body_vehicle_type（fa-lgt-zll）｜

- **关键词**：rigid_body_vehicle_type, subobject, sequencer
- **出处**：`six_dof/six_dof_types/aircraft/fa-lgt/fa-lgt-zll.txt:29-64`　（同签名共 2 处，另见 `six_dof/six_dof_types/aircraft/fa-lgt/fa-lgt-bombs-ld.txt:22`）
- **片段**：

```text
   rigid_body_vehicle_type FA-LGT-ZLL_RB6 FA-LGT_RB6
   
      subobject              ZellRocket SRB-RATO_RB6
         parent_rel_x          5.5 ft
         parent_rel_y          0.0 ft
         parent_rel_z          0.0 ft
 
         parent_rel_yaw        0.0 deg
         parent_rel_pitch      0.0 deg
         parent_rel_roll       0.0 deg

         separation_vx         0.0 ft/sec
         separation_vy         0.0 ft/sec
         separation_vz         5.0 ft/sec

         separation_omega_x    0.0 deg/sec
         separation_omega_y  -10.0 deg/sec
         separation_omega_z    0.0 deg/sec
      end_subobject

      sequencer  IgniteZellRocket
         event_timer                 4.9 sec
         action_ignite_subobject     ZellRocket
      end_sequencer
      
      sequencer  Launch
         event_timer                 5 sec
         action_jett_self
      end_sequencer
      
      sequencer  JettisonZellRocket
         event_timer                 8.0 sec
         action_jett_obj             ZellRocket
      end_sequencer

   end_rigid_body_vehicle_type
```

- **演示要点**：演示 rigid_body_vehicle_type 的参数：subobject, sequencer

### rudder_right（flight_controls_pm6）｜

- **关键词**：rudder_right
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/flight_controls_pm6.txt:24-28`　（同签名共 17 处，另见 `six_dof/six_dof_types/aircraft/b-fw/controls/flight_controls_pm6.txt:32`、`six_dof/six_dof_types/aircraft/b-hvy/controls/flight_controls_pm6.txt:32`、`six_dof/six_dof_types/aircraft/c-hvy/controls/flight_controls_pm6.txt:32`）
- **片段**：

```text
   rudder_right # Map of rudder throw vs yaw rate command (deg/s)
      -1.0  -5.0
       0.0   0.0
       1.0   5.0
   end_rudder_right
```

- **演示要点**：演示 rudder_right（最小结构，无子参数）

### scalar_gain（flight_controls）｜

- **关键词**：scalar_gain, name, gain
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/flight_controls.txt:32-35`　（同签名共 15 处，另见 `p6dof/p6dof_types/weapons/simple-icbm/flight_controls.txt:37`、`p6dof/p6dof_types/weapons/simple-icbm/flight_controls.txt:42`、`p6dof/p6dof_types/weapons/simple-icbm/flight_controls.txt:47`）
- **片段**：

```text
 scalar_gain
  name NegativeGain
  gain -1.0
 end_scalar_gain
```

- **演示要点**：演示 scalar_gain 的参数：name, gain

### scalar_gain（flight_controls）｜

- **关键词**：scalar_gain, gain
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:40-42`　（同签名共 493 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:44`、`p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:48`、`p6dof/p6dof_types/aircraft/a-lgt/controls/flight_controls.txt:52`）
- **片段**：

```text
scalar_gain NegativeGain
   gain -1.0
end_scalar_gain
```

- **演示要点**：演示 scalar_gain 的参数：gain

### six_dof_environment（six_dof_environment）｜

- **关键词**：six_dof_environment, terrain
- **出处**：`air_to_air/six_dof_types/environment/six_dof_environment.txt:39-41`　（同签名共 3 处，另见 `six_dof/six_dof_types/environment/six_dof_environment.txt:36`、`six_dof_with_brawler/six_dof_types/environment/six_dof_environment.txt:36`）
- **片段**：

```text
six_dof_environment
   terrain            terrain_config.txt
end_six_dof_environment
```

- **演示要点**：演示 six_dof_environment 的参数：terrain

### six_dof_formation（six_dof_basic_formation）｜

- **关键词**：six_dof_formation, lead, six_dof_unit
- **出处**：`six_dof/six_dof_basic_formation.txt:78-89`　（同签名共 3 处，另见 `six_dof/pm6_formation_tanking.txt:74`、`six_dof/rb6_formation_tanking.txt:74`）
- **片段**：

```text
six_dof_formation tango
   # 'alpha' is the lead unit in the formation 'tango'.
   lead six_dof_unit one
      member_platform alpha
   end_six_dof_unit

   # 'beta' is the wingman in the formation 'tango'.
   six_dof_unit two
      member_platform beta
      offset 20 m 135.0 deg 0 m welded_wing
   end_six_dof_unit
end_six_dof_formation
```

- **演示要点**：演示 six_dof_formation 的参数：lead, six_dof_unit

### six_dof_formation（pm6_formation_tanking）｜

- **关键词**：six_dof_formation, lead
- **出处**：`six_dof/pm6_formation_tanking.txt:122-126`　（同签名共 2 处，另见 `six_dof/rb6_formation_tanking.txt:122`）
- **片段**：

```text
six_dof_formation foxtrot
   lead six_dof_unit one
      member_platform lambda
   end_six_dof_unit
end_six_dof_formation
```

- **演示要点**：演示 six_dof_formation 的参数：lead

### six_dof_object_types（b-h3-81a-1-tf）｜

- **关键词**：six_dof_object_types, rigid_body_engine_type, tsfc_idle_pph, tsfc_mil_pph, rated_thrust_idle, rated_thrust_mil, spin_up_table_mil_per_sec, spin_down_table_mil_per_sec, thrust_idle_alt_mach_table, file, thrust_mil_alt_mach_table, point_mass_engine_type
- **出处**：`six_dof/six_dof_types/aircraft/b-hvy/prop/jet_engines/b-h3-81a-1-tf/b-h3-81a-1-tf.txt:20-126`　（同签名共 2 处，另见 `six_dof/six_dof_types/weapons/agm-mrc/prop/jet_engines/generic-cm-1-tf/generic-cm-1-tf.txt:21`）
- **片段**：

```text
six_dof_object_types

   rigid_body_engine_type   B-H3-81A-1-TF_RB6   BASE_TYPE

      thrust_offset            -5.9000 ft

      inop_ref_area            15.3000 ft^2

      jet

			tsfc_idle_pph             0.7800  # lb/lb/hr
			tsfc_mil_pph              0.7800  # lb/lb/hr

			//-------------------------------------------------------------------------

			rated_thrust_idle      2500.0000 lbf
			rated_thrust_mil      17000.0000 lbf
			//-------------------------------------------------------------------------

			spin_up_table_mil_per_sec
				// throttle_level  spin_up_per_sec
							  0.0000               0.0500
							  0.2500               0.1625
							  0.5000               0.2750
							  0.7500               0.3875
							  1.0000               0.5000
			end_spin_up_table_mil_per_sec

			spin_down_table_mil_per_sec
				// throttle_level  spin_down_per_sec
							  0.0000               0.0500
							  0.2500               0.1625
							  0.5000               0.2750
							  0.7500               0.3875
							  1.0000               0.5000
			end_spin_down_table_mil_per_sec

			//-------------------------------------------------------------------------

			thrust_idle_alt_mach_table
				file data/thrust_idle_alt_mach.txt
			end_thrust_idle_alt_mach_table

			//-------------------------------------------------------------------------

			thrust_mil_alt_mach_table
				file data/thrust_mil_alt_mach.txt
			end_thrust_mil_alt_mach_table

      end_jet

      throttle_setting_mil    ThrottleMilitary
      
   end_rigid_body_engine_type

   point_mass_engine_type   B-H3-81A-1-TF_PM6   BASE_TYPE

      thrust_offset            -5.9000 ft

      inop_ref_area            15.3000 ft^2

      jet

			tsfc_idle_pph             0.7800  # lb/lb/hr
			tsfc_mil_pph              0.7800  # lb/lb/hr

			//-------------------------------------------------------------------------

			rated_thrust_idle      2500.0000 lbf
			rated_thrust_mil      17000.0000 lbf
			//-------------------------------------------------------------------------

			spin_up_table_mil_per_sec
				// throttle_level  spin_up_per_sec
							  0.0000               0.0500
							  0.2500               0.1625
							  0.5000               0.2750
							  0.7500               0.3875
							  1.0000               0.5000
			end_spin_up_table_mil_per_sec

			spin_down_table_mil_per_sec
				// throttle_level  spin_down_per_sec
							  0.0000               0.0500
							  0.2500               0.1625
							  0.5000               0.2750
							  0.7500               0.3875
							  1.0000               0.5000
			end_spin_down_table_mil_per_sec

			//-------------------------------------------------------------------------

			thrust_idle_alt_mach_table
				file data/thrust_idle_alt_mach.txt
			end_thrust_idle_alt_mach_table

			//-------------------------------------------------------------------------

			thrust_mil_alt_mach_table
				file data/thrust_mil_alt_mach.txt
			end_thrust_mil_alt_mach_table

      end_jet

   end_point_mass_engine_type

end_six_dof_object_types
```

- **演示要点**：演示 six_dof_object_types 的参数：rigid_body_engine_type, tsfc_idle_pph, tsfc_mil_pph, rated_thrust_idle, rated_thrust_mil, spin_up_table_mil_per_sec, spin_down_table_mil_per_sec, thrust_idle_alt_mach_table, file, thrust_mil_alt_mach_table

### six_dof_object_types（orbiter-booster-rkt）｜

- **关键词**：six_dof_object_types, rigid_body_engine_type, point_mass_engine_type
- **出处**：`six_dof/six_dof_types/spacecraft/orbiter-booster/prop/solid_propellant_rockets/orbiter-booster-rkt/orbiter-booster-rkt.txt:20-30`　（同签名共 12 处，另见 `six_dof/six_dof_types/aircraft/b-fw/prop/jet_engines/b-h4-40w-1-tf/b-h4-40w-1-tf.txt:21`、`six_dof/six_dof_types/aircraft/c-hvy/prop/jet_engines/c-hj-41a-1-tf/c-hj-41a-1-tf.txt:21`、`six_dof/six_dof_types/aircraft/fa-hvy/prop/jet_engines/f-h4-22a-1-tf/f-h4-22a-1-tf.txt:21`）
- **片段**：

```text
six_dof_object_types

   rigid_body_engine_type    ORBITER-BOOSTER-RKT_RB6   BASE_TYPE   
      include orbiter-booster-rkt_data.txt
   end_rigid_body_engine_type
   
   point_mass_engine_type    ORBITER-BOOSTER-RKT_PM6   BASE_TYPE   
      include orbiter-booster-rkt_data.txt
   end_point_mass_engine_type
   
end_six_dof_object_types
```

- **演示要点**：演示 six_dof_object_types 的参数：rigid_body_engine_type, point_mass_engine_type

### six_dof_object_types（ubu-500-ld）｜

- **关键词**：six_dof_object_types, rigid_body_vehicle_type, point_mass_vehicle_type
- **出处**：`six_dof/six_dof_types/weapons/ubu-500/ubu-500-ld.txt:18-48`　（同签名共 21 处，另见 `six_dof/six_dof_types/weapons/gbu-500/gbu-500.txt:18`、`six_dof/six_dof_types/weapons/ubu-500/ubu-500-hd.txt:19`、`six_dof/six_dof_types/misc/tnk-f16-370g/tnk-f16-370g.txt:18`）
- **片段**：

```text
six_dof_object_types
   rigid_body_vehicle_type UBU-500-LD_RB6 BASE_TYPE

      include aero/aero_rb6.txt                 # Defines the vehicle aerodynamics

      mass_properties
         mass                              500.00000 lbs
         moment_of_inertia_ixx               0.67780 slug*ft^2
         moment_of_inertia_iyy              39.55762 slug*ft^2
         moment_of_inertia_izz              39.55762 slug*ft^2
         center_of_mass_x                    0.00000 ft
         center_of_mass_y                   -0.00000 ft
         center_of_mass_z                    0.00000 ft
      end_mass_properties

      # Note: This vehicle lacks any propulsion system

   end_rigid_body_vehicle_type
	
   point_mass_vehicle_type UBU-500-LD_PM6 BASE_TYPE

      include aero/aero_pm6.txt                 # Defines the vehicle aerodynamics

      mass_properties
         mass                              500.00000 lbs
      end_mass_properties

      # Note: This vehicle lacks any propulsion system

   end_point_mass_vehicle_type
end_six_dof_object_types
```

- **演示要点**：演示 six_dof_object_types 的参数：rigid_body_vehicle_type, point_mass_vehicle_type

### six_dof_object_types（fa-lgt_landing-gear）｜

- **关键词**：six_dof_object_types, rigid_body_vehicle_type, landing_gear
- **出处**：`six_dof/six_dof_types/aircraft/fa-lgt/fa-lgt_landing-gear.txt:20-156`
- **片段**：

```text
six_dof_object_types
   rigid_body_vehicle_type FA-LGT_Landing-Gear BASE_TYPE

      include aero/aero_landing_gear.txt
      include controls/control_inputs_rb6.txt
      include controls/flight_controls_landing_gear.txt

      mass_properties
         mass                            18900.00000 lbs
         moment_of_inertia_ixx            7166.47417 slug*ft^2
         moment_of_inertia_iyy           76887.57324 slug*ft^2
         moment_of_inertia_izz           81517.30433 slug*ft^2
         center_of_mass_x                    0.00000 ft
         center_of_mass_y                    0.00000 ft
         center_of_mass_z                   -0.00000 ft
      end_mass_properties

      propulsion_data

         engine Engine  F-L4-11A-1-TF_RB6
            rel_pos_x                       -7.71046 ft
            rel_pos_y                       -0.00000 ft
            rel_pos_z                       -0.13705 ft
            rel_yaw                          0.00000 deg
            rel_pitch                        0.00000 deg
            fuel_feed                   MainFuelTank
         end_engine

         # Current fuel tank support is limited to a single tank.
         # Future Mover Creator upgrades may support more complex, multi-tank fuel systems.

         fuel_tank  MainFuelTank
            max_fuel_quantity             7000.00000 lbs
            current_fuel_quantity         7000.00000 lbs
            max_flow_rate              1000000.00000 lbs/sec
            max_fill_rate              1000000.00000 lbs/sec
            max_xfer_rate              1000000.00000 lbs/sec
            cg_full_x                        0.68954 ft
            cg_full_y                       -0.00000 ft
            cg_full_z                       -0.13705 ft
            cg_empty_x                       0.68954 ft
            cg_empty_y                      -0.00000 ft
            cg_empty_z                      -0.13705 ft
         end_fuel_tank

         # Throttle controls:
         throttle_setting_mil         ThrottleMilitary
         throttle_setting_ab          ThrottleAfterburner
         throttle_setting_reverser    ThrottleThrustReverser

         # Thrust vectoring controls:
         #throttle_setting_yaw        ThrustVectoringYaw
         #throttle_setting_pitch      ThrustVectoringPitch

      end_propulsion_data
	  
	  landing_gear
         nws_enable_control_name              NWS_Enable

         nominal_height_above_ground_on_gear  5.5 ft

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

         ground_reaction_point LandingGear_3
            control_surface_name              Aft_Gear_Left
            braking_control_surface_name      LeftWheelBrake
            is_nose_gear                      false
            gear_extended_relative_position_x -2.89984 ft
            gear_extended_relative_position_y -5 ft
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
      end_landing_gear

   end_rigid_body_vehicle_type
end_six_dof_object_types
```

- **演示要点**：演示 six_dof_object_types 的参数：rigid_body_vehicle_type, landing_gear

### six_dof_object_types（six_dof_environment）｜

- **关键词**：six_dof_object_types, integrators
- **出处**：`air_to_air/six_dof_types/environment/six_dof_environment.txt:35-37`　（同签名共 3 处，另见 `six_dof/six_dof_types/environment/six_dof_environment.txt:32`、`six_dof_with_brawler/six_dof_types/environment/six_dof_environment.txt:32`）
- **片段**：

```text
six_dof_object_types
   integrators        integrators_config.txt
end_six_dof_object_types
```

- **演示要点**：演示 six_dof_object_types 的参数：integrators

### six_dof_object_types（orbiter-booster）｜

- **关键词**：six_dof_object_types, map_vehicle_to_platform
- **出处**：`six_dof/platforms/orbiter-booster.txt:34-36`　（同签名共 9 处，另见 `six_dof/platforms/agm-mrc.txt:324`、`six_dof/platforms/gbu-500.txt:158`、`six_dof/platforms/lrm-1-c.txt:49`）
- **片段**：

```text
six_dof_object_types
   map_vehicle_to_platform ORBITER-BOOSTER_PM6 ORBITER-BOOSTER_PM6
end_six_dof_object_types
```

- **演示要点**：演示 six_dof_object_types 的参数：map_vehicle_to_platform

### six_dof_object_types（LTE_FIGHTER）｜

- **关键词**：six_dof_object_types, point_mass_vehicle_type
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/LTE_FIGHTER.txt:12-42`　（同签名共 5 处，另见 `six_dof_with_brawler/six_dof_types/aircraft/LTE_FIGHTER/LTE_FIGHTER.txt:12`、`six_dof/six_dof_types/misc/zell-launch-system/zell-launch-system.txt:12`、`six_dof/six_dof_types/spacecraft/orbiter-booster/orbiter-booster.txt:20`）
- **片段**：

```text
six_dof_object_types

   point_mass_vehicle_type   LTE_FIGHTER_PM6   BASE_TYPE

      include aero/aero_pm6.txt
      include controls/control_inputs_pm6.txt
      include controls/flight_controls_pm6.txt

      mass_properties
         mass	36109.999986200004 lbs
      end_mass_properties

      propulsion_data

         engine Engine LTE_FIGHTER_Eng_PM6
            fuel_feed	MainFuelTank
         end_engine

         fuel_tank MainFuelTank
            max_fuel_quantity      20718.0 lbs
            current_fuel_quantity  20718.0 lbs
            max_flow_rate          10000.00 lbs/sec
            max_fill_rate          10000.00 lbs/sec
            max_xfer_rate          10000.00 lbs/sec
         end_fuel_tank

      end_propulsion_data

   end_point_mass_vehicle_type

end_six_dof_object_types
```

- **演示要点**：演示 six_dof_object_types 的参数：point_mass_vehicle_type

### six_dof_object_types（LTE_FIGHTER_Eng）｜

- **关键词**：six_dof_object_types, point_mass_engine_type
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/prop/LTE_FIGHTER_Eng.txt:10-60`　（同签名共 3 处，另见 `six_dof_with_brawler/six_dof_types/aircraft/LTE_FIGHTER/prop/LTE_FIGHTER_Eng.txt:10`、`six_dof/six_dof_types/spacecraft/orbiter-main/prop/solid_propellant_rockets/orbiter-main-rkt/orbiter-main-rkt.txt:20`）
- **片段**：

```text
six_dof_object_types

   point_mass_engine_type   LTE_FIGHTER_Eng_PM6   BASE_TYPE

      jet

         tsfc_idle_pph      -0.02710004531071167
         tsfc_mil_pph       1.4504621608555324
         tsfc_ab_pph        1.6062186380240169

         rated_thrust_idle  802.9000000000001 lbf
         rated_thrust_mil   23892.5 lbf
         rated_thrust_ab    74142.5 lbf

         spin_up_table_mil_per_sec
            0.00	2.0
            1.00	2.0
         end_spin_up_table_mil_per_sec

         spin_down_table_mil_per_sec
            0.00	2.0
            1.00	2.0
         end_spin_down_table_mil_per_sec

         spin_up_table_ab_per_sec
            0.00	1.0
            1.00	1.0
         end_spin_up_table_ab_per_sec

         spin_down_table_ab_per_sec
            0.00	1.0
            1.00	1.0
         end_spin_down_table_ab_per_sec

         thrust_idle_alt_mach_table
            file data/thrust_idle_alt_mach.txt
         end_thrust_idle_alt_mach_table

         thrust_mil_alt_mach_table
            file data/thrust_mil_alt_mach.txt
         end_thrust_mil_alt_mach_table

         thrust_ab_alt_mach_table
            file data/thrust_ab_alt_mach.txt
         end_thrust_ab_alt_mach_table

      end_jet

   end_point_mass_engine_type

end_six_dof_object_types
```

- **演示要点**：演示 six_dof_object_types 的参数：point_mass_engine_type

### six_dof_unit（pm6_formation_tanking）｜

- **关键词**：six_dof_unit, member_platform, offset
- **出处**：`six_dof/pm6_formation_tanking.txt:79-82`　（同签名共 7 处，另见 `six_dof/pm6_formation_tanking.txt:84`、`six_dof/pm6_formation_tanking.txt:89`、`six_dof/rb6_formation_tanking.txt:79`）
- **片段**：

```text
   six_dof_unit two
      member_platform beta
      offset 30 m 135.0 deg -1.0 m welded_wing
   end_six_dof_unit
```

- **演示要点**：演示 six_dof_unit 的参数：member_platform, offset

### solid_propellant_rocket（orbiter-booster-rkt_data）｜

- **关键词**：solid_propellant_rocket, thrust_vs_time_sealevel, isp_vs_alt, rated_thrust
- **出处**：`six_dof/six_dof_types/spacecraft/orbiter-booster/prop/solid_propellant_rockets/orbiter-booster-rkt/orbiter-booster-rkt_data.txt:22-91`　（同签名共 15 处，另见 `six_dof/six_dof_types/misc/srb-rato/prop/solid_propellant_rockets/rato-rkt/rato-rkt.txt:27`、`six_dof/six_dof_types/misc/srb-rato/prop/solid_propellant_rockets/rato-rkt/rato-rkt.txt:105`、`six_dof/six_dof_types/weapons/aam-sr/prop/solid_propellant_rockets/aim-sr-1-rkt/aim-sr-1-rkt.txt:27`）
- **片段**：

```text
solid_propellant_rocket

   //-------------------------------------------------------------------------

   thrust_vs_time_sealevel
      // time    thrust_lbs
           0.000           0.000
           0.100      200000.000
           100.0       80000.000
   end_thrust_vs_time_sealevel

   //-------------------------------------------------------------------------

   isp_vs_alt
      // alt          Isp
           0.0      240.000000
        5000.0      242.766560
       10000.0      245.230420
       15000.0      247.415200
       20000.0      249.343720
       25000.0      251.037580
       30000.0      252.517340
       35000.0      253.802480
       40000.0      255.076600
       45000.0      256.128340
       50000.0      256.955400
       55000.0      257.605800
       60000.0      258.117240
       65000.0      258.519460
       70000.0      258.842120
       75000.0      259.093700
       80000.0      259.289420
       85000.0      259.441940
       90000.0      259.561000
       95000.0      259.654100
      100000.0      259.727020
      105000.0      259.784220
      110000.0      259.830960
      115000.0      259.866980
      120000.0      259.894880
      125000.0      259.916580
      130000.0      259.933540
      135000.0      259.946840
      140000.0      259.957320
      145000.0      259.965620
      150000.0      259.972220
      155000.0      259.977400
      160000.0      259.981360
      165000.0      259.984620
      170000.0      259.987200
      175000.0      259.989300
      180000.0      259.991100
      185000.0      259.992600
      190000.0      259.993880
      195000.0      259.994940
      200000.0      259.995840
      210000.0      259.997220
      220000.0      259.998160
      230000.0      259.998800
      240000.0      259.999240
      250000.0      259.999520
      260000.0      259.999720
      270000.0      259.999820
      280000.0      259.999900
      400000.0      260.000000
   end_isp_vs_alt

   rated_thrust         280000.0 lbf

end_solid_propellant_rocket
```

- **演示要点**：演示 solid_propellant_rocket 的参数：thrust_vs_time_sealevel, isp_vs_alt, rated_thrust

### solid_propellant_rocket_type（aim-sr-1-rkt）｜

- **关键词**：solid_propellant_rocket_type, thrust_vs_time_sealevel, isp_vs_alt, thrust_offset, rated_thrust, propellant_mass
- **出处**：`p6dof/p6dof_types/misc/srb-rato/prop/solid_propellant_rockets/aim-sr-1-rkt/aim-sr-1-rkt.txt:23-103`　（同签名共 7 处，另见 `p6dof/p6dof_types/misc/srb-rato/prop/solid_propellant_rockets/rato-rkt/rato-rkt.txt:23`、`p6dof/p6dof_types/weapons/aam-mr/prop/solid_propellant_rockets/aim-mr-1-rkt/aim-mr-1-rkt.txt:23`、`p6dof/p6dof_types/weapons/aam-sr/prop/solid_propellant_rockets/aim-sr-1-rkt/aim-sr-1-rkt.txt:23`）
- **片段**：

```text
   solid_propellant_rocket_type   AIM-SR-1-RKT   P6DOF_SOLID_PROPELLANT_ROCKET

      //-------------------------------------------------------------------------
      
      thrust_vs_time_sealevel
         // time    thrust_lbs
              0.000           0.000
              0.100        2800.000
              7.800        2400.000
              8.000           0.000
      end_thrust_vs_time_sealevel
      
      //-------------------------------------------------------------------------
      
      isp_vs_alt
         // alt          Isp
              0.0      240.000000
           5000.0      242.766560
          10000.0      245.230420
          15000.0      247.415200
          20000.0      249.343720
          25000.0      251.037580
          30000.0      252.517340
          35000.0      253.802480
          40000.0      255.076600
          45000.0      256.128340
          50000.0      256.955400
          55000.0      257.605800
          60000.0      258.117240
          65000.0      258.519460
          70000.0      258.842120
          75000.0      259.093700
          80000.0      259.289420
          85000.0      259.441940
          90000.0      259.561000
          95000.0      259.654100
         100000.0      259.727020
         105000.0      259.784220
         110000.0      259.830960
         115000.0      259.866980
         120000.0      259.894880
         125000.0      259.916580
         130000.0      259.933540
         135000.0      259.946840
         140000.0      259.957320
         145000.0      259.965620
         150000.0      259.972220
         155000.0      259.977400
         160000.0      259.981360
         165000.0      259.984620
         170000.0      259.987200
         175000.0      259.989300
         180000.0      259.991100
         185000.0      259.992600
         190000.0      259.993880
         195000.0      259.994940
         200000.0      259.995840
         210000.0      259.997220
         220000.0      259.998160
         230000.0      259.998800
         240000.0      259.999240
         250000.0      259.999520
         260000.0      259.999720
         270000.0      259.999820
         280000.0      259.999900
         400000.0      260.000000
      end_isp_vs_alt

      //-------------------------------------------------------------------------

      thrust_offset          -2.25 ft

      //-------------------------------------------------------------------------

      rated_thrust          2800.0 lbf

      //-------------------------------------------------------------------------

      propellant_mass         85.0 lbs

   end_solid_propellant_rocket_type
```

- **演示要点**：演示 solid_propellant_rocket_type 的参数：thrust_vs_time_sealevel, isp_vs_alt, thrust_offset, rated_thrust, propellant_mass

### solid_propellant_rocket_type（Generic_ICBM_RocketEngines）｜

- **关键词**：solid_propellant_rocket_type, thrust_vs_time_vacuum, isp_vs_alt, rated_thrust, propellant_mass
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/Generic_ICBM_RocketEngines.txt:133-155`　（同签名共 3 处，另见 `p6dof/p6dof_types/weapons/simple-icbm/Generic_ICBM_RocketEngines.txt:157`、`p6dof/p6dof_types/weapons/simple-icbm/Generic_ICBM_RocketEngines.txt:181`）
- **片段**：

```text
   solid_propellant_rocket_type   ICBM_RV_SpinMotor   P6DOF_SOLID_PROPELLANT_ROCKET

      thrust_vs_time_vacuum
        #time    normalized_thrust
        0.00     0.0
        0.10     200.0
        3.0      200.0
        3.1      20.0
        3.2      1.0
      end_thrust_vs_time_vacuum

      #45.42 sec

      isp_vs_alt
         #alt_feet     Isp
         0.0           280.0
         300000.0      280.0
      end_isp_vs_alt

      rated_thrust     200.0 lbf
      propellant_mass  2.21 lbs

   end_solid_propellant_rocket_type
```

- **演示要点**：演示 solid_propellant_rocket_type 的参数：thrust_vs_time_vacuum, isp_vs_alt, rated_thrust, propellant_mass

### solid_propellant_rocket_type（Generic_ICBM_RocketEngines）｜

- **关键词**：solid_propellant_rocket_type, thrust_vs_time_sealevel, isp_vs_alt, rated_thrust, propellant_mass
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/Generic_ICBM_RocketEngines.txt:44-73`　（同签名共 3 处，另见 `p6dof/p6dof_types/weapons/simple-icbm/Generic_ICBM_RocketEngines.txt:75`、`p6dof/p6dof_types/weapons/simple-icbm/Generic_ICBM_RocketEngines.txt:11`）
- **片段**：

```text
   solid_propellant_rocket_type   ICBM_Stage2_Rocket   P6DOF_SOLID_PROPELLANT_ROCKET

      thrust_vs_time_sealevel
        #time   normalized_thrust
        0.0     0.0
        0.20    30000.0
        1.0     60000.0
        65.5    60000.0
        65.69   40000.0
        67.0    5000.0
      end_thrust_vs_time_sealevel

      # 15000 0.2  10.5
      # 45000 0.8  126.3  @ 1sec burned 136.8 lbs leaving 13,613.2 lbs
      # @ 60,000 lbs burns 210.5 lbs/sec
      # With 64.5 sec additional burn, it burns 13,578.9 lbs, leaving 34.3 lbs.
      # 50000 0.19 33.3 leaving 1 lbs
      # 65.69 sec nominal burn time

      isp_vs_alt
         #alt_feet     Isp
         0.0           285.0
         100000.0      290.0
         300000.0      295.0
      end_isp_vs_alt

      rated_thrust     60000.0 lbf
      propellant_mass  13750.0 lbs

   end_solid_propellant_rocket_type
```

- **演示要点**：演示 solid_propellant_rocket_type 的参数：thrust_vs_time_sealevel, isp_vs_alt, rated_thrust, propellant_mass

### speedbrake_dcd_mach_table（aero_pm6）｜

- **关键词**：speedbrake_dcd_mach_table, file
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/aero/aero_pm6.txt:50-52`　（同签名共 4 处，另见 `six_dof/six_dof_types/aircraft/fa-hvy/aero/aero_pm6.txt:74`、`six_dof/six_dof_types/aircraft/fa-lgt/aero/aero_pm6.txt:74`、`six_dof_with_brawler/six_dof_types/aircraft/LTE_FIGHTER/aero/aero_pm6.txt:50`）
- **片段**：

```text
   speedbrake_dcd_mach_table
      file data/speedbrake_dcd_mach_table.txt
   end_speedbrake_dcd_mach_table
```

- **演示要点**：演示 speedbrake_dcd_mach_table 的参数：file

### speedbrakes（flight_controls_pm6）｜

- **关键词**：speedbrakes, lag_time_constant
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/flight_controls_pm6.txt:30-32`　（同签名共 3 处，另见 `six_dof/six_dof_types/aircraft/fa-lgt/controls/flight_controls_pm6.txt:38`、`six_dof_with_brawler/six_dof_types/aircraft/LTE_FIGHTER/controls/flight_controls_pm6.txt:30`）
- **片段**：

```text
   speedbrakes
      lag_time_constant 0 sec
   end_speedbrakes
```

- **演示要点**：演示 speedbrakes 的参数：lag_time_constant

### spin_down_table_ab_per_sec（LTE_FIGHTER_Eng）｜

- **关键词**：spin_down_table_ab_per_sec
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/prop/LTE_FIGHTER_Eng.txt:39-42`　（同签名共 8 处，另见 `six_dof_with_brawler/six_dof_types/aircraft/LTE_FIGHTER/prop/LTE_FIGHTER_Eng.txt:39`、`p6dof/p6dof_types/aircraft/fa-hvy/prop/jet_engines/f-h4-22a-1-tf/f-h4-22a-1-tf.txt:73`、`p6dof/p6dof_types/aircraft/fa-lgt/prop/jet_engines/f-l4-11a-1-tf/f-l4-11a-1-tf.txt:73`）
- **片段**：

```text
         spin_down_table_ab_per_sec
            0.00	1.0
            1.00	1.0
         end_spin_down_table_ab_per_sec
```

- **演示要点**：演示 spin_down_table_ab_per_sec（最小结构，无子参数）

### spin_down_table_mil_per_sec（LTE_FIGHTER_Eng）｜

- **关键词**：spin_down_table_mil_per_sec
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/prop/LTE_FIGHTER_Eng.txt:29-32`　（同签名共 21 处，另见 `six_dof_with_brawler/six_dof_types/aircraft/LTE_FIGHTER/prop/LTE_FIGHTER_Eng.txt:29`、`p6dof/p6dof_types/aircraft/a-lgt/prop/jet_engines/a-m4-22a-1-tf/a-m4-22a-1-tf.txt:53`、`p6dof/p6dof_types/aircraft/b-fw/prop/jet_engines/b-h4-40w-1-tf/b-h4-40w-1-tf.txt:53`）
- **片段**：

```text
         spin_down_table_mil_per_sec
            0.00	2.0
            1.00	2.0
         end_spin_down_table_mil_per_sec
```

- **演示要点**：演示 spin_down_table_mil_per_sec（最小结构，无子参数）

### spin_up_table_ab_per_sec（LTE_FIGHTER_Eng）｜

- **关键词**：spin_up_table_ab_per_sec
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/prop/LTE_FIGHTER_Eng.txt:34-37`　（同签名共 8 处，另见 `six_dof_with_brawler/six_dof_types/aircraft/LTE_FIGHTER/prop/LTE_FIGHTER_Eng.txt:34`、`p6dof/p6dof_types/aircraft/fa-hvy/prop/jet_engines/f-h4-22a-1-tf/f-h4-22a-1-tf.txt:64`、`p6dof/p6dof_types/aircraft/fa-lgt/prop/jet_engines/f-l4-11a-1-tf/f-l4-11a-1-tf.txt:64`）
- **片段**：

```text
         spin_up_table_ab_per_sec
            0.00	1.0
            1.00	1.0
         end_spin_up_table_ab_per_sec
```

- **演示要点**：演示 spin_up_table_ab_per_sec（最小结构，无子参数）

### spin_up_table_mil_per_sec（LTE_FIGHTER_Eng）｜

- **关键词**：spin_up_table_mil_per_sec
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/prop/LTE_FIGHTER_Eng.txt:24-27`　（同签名共 21 处，另见 `six_dof_with_brawler/six_dof_types/aircraft/LTE_FIGHTER/prop/LTE_FIGHTER_Eng.txt:24`、`p6dof/p6dof_types/aircraft/a-lgt/prop/jet_engines/a-m4-22a-1-tf/a-m4-22a-1-tf.txt:44`、`p6dof/p6dof_types/aircraft/b-fw/prop/jet_engines/b-h4-40w-1-tf/b-h4-40w-1-tf.txt:44`）
- **片段**：

```text
         spin_up_table_mil_per_sec
            0.00	2.0
            1.00	2.0
         end_spin_up_table_mil_per_sec
```

- **演示要点**：演示 spin_up_table_mil_per_sec（最小结构，无子参数）

### spoilers（flight_controls_pm6）｜

- **关键词**：spoilers, lag_time_constant
- **出处**：`six_dof/six_dof_types/aircraft/fa-lgt/controls/flight_controls_pm6.txt:46-48`
- **片段**：

```text
   spoilers
      lag_time_constant  1.0 sec
   end_spoilers
```

- **演示要点**：演示 spoilers 的参数：lag_time_constant

### stage（saturn_v_complex）｜

- **关键词**：stage, aero, total_mass, fuel_mass, empty_mass, sea_level_thrust, vacuum_thrust, burn_rate, thrust_duration, throttle, thrust_vectoring_angle_limit, lateral_thrust_gain, pre_separation_coast_time
- **出处**：`space_operations/launch_vehicles/saturn_v/saturn_v_complex.txt:134-187`　（同签名共 2 处，另见 `space_operations/launch_vehicles/saturn_v/saturn_v_simple.txt:68`）
- **片段**：

```text
      stage 1
         aero SATURN_V_S-IC_AERO
         total_mass                    5023648 lbm
         fuel_mass                     4730675 lbm         # 3,305,786 oxidizer + 1,424,889 fuel
         empty_mass                     292973 lbm         # 287,531 dry + 5,442 other

         # As noted below, first motion does not occur until T+0.3. During the time the engines are
         # ignited (T-6.4) and when the holdback arms are released (T+0.3) the documentation says
         # 86,308 lbm of fuel is consumed.
         #
         # Adding these lines affects the mass-related lines in from 'show_status', but are needed
         # to get the masses correct at the staging events. Prior to doing this I ensured that the
         # 'Total Start Mass' value for stage 1 matched the document.

         total_mass                    4937340 lbm
         fuel_mass                     4644367 lbm

         # For some unknown reason I did not get the initial masses in the time history to line up.
         # I had to deduct an additional 225 kg (495 lb).

         total_mass                    4936845 lbm
         fuel_mass                     4643872 lbm

         # According to the documentation, the following is the launch sequence:
         #
         #   T-6.4 : Ignition
         #   T-1.6 : All engines at full thrust
         #   T+0   : 'Range 0'
         #   T+0.3 : Holddown arms released (first motion)
         #   T+0.63: Liftoff (umbilical disconnect)

         # These are the peak rates.
         sea_level_thrust              7840980 lbf         # 7715150 at launch, 6251000 last part
         vacuum_thrust                 9008530 lbf         # 8863960 at launch, 7182470 last part
         burn_rate                     29633.32 lbm/sec    # 29157.78 at launch, 23626.56 last part
         thrust_duration               161.33 sec

         throttle
            curve
               independent_variable time units sec
               #dependent_variable
                 0.000 0.98395226 # T+0.3
                69.700 0.98395226 # T+1:10 (70.00 - 0.3 = 69.70)      Begin ramp up to max power
               134.900 1.00000000 # T+2:15.20 (135.20 - 0.3 = 134.90) Center engine cutoff (CECO)
               134.901 0.79722178
               161.330 0.79722178 # T+2:41.63 (161.63 - 0.3 = 161.33) Shutdown
            end_curve

         thrust_vectoring_angle_limit  10 deg
         lateral_thrust_gain           10.0

         # Engine cutoff at T+2:41.63, separation at T+2:42.20
         pre_separation_coast_time     0.57 sec
      end_stage
```

- **演示要点**：演示 stage 的参数：aero, total_mass, fuel_mass, empty_mass, sea_level_thrust, vacuum_thrust, burn_rate, thrust_duration, throttle, thrust_vectoring_angle_limit

### stage（proton-m）｜

- **关键词**：stage, aero, empty_mass, fuel_mass, sea_level_thrust, vacuum_thrust, burn_rate, thrust_duration, thrust_vectoring_angle_limit, lateral_thrust_gain, pre_separation_coast_time
- **出处**：`space_operations/launch_vehicles/proton_m/proton-m.txt:55-72`
- **片段**：

```text
      stage 1
         aero                          PROTON-M_STAGE_1_AERO
         empty_mass                    31000 kg            # (SF101)
         fuel_mass                     419400 kg           # (SF101)

         # (SF101) states vacuum thrust of 10,998 kn and a vacuum impulse of 325 sec
         # This gives a burn rate of 10,998 kn / (9.8 m/s^2 * 325 sec) = 3,453.06 kg/s

         sea_level_thrust              9942000 nt          # (SF101)
         vacuum_thrust                 10998000 nt         # (SF101)
         burn_rate                     3453.06 kg/s        # (SF101) Derived above
         thrust_duration               120 sec             # (SF101)

         thrust_vectoring_angle_limit  7.0 deg
         lateral_thrust_gain           100.0

         pre_separation_coast_time     3 sec               # SPG, separate at T+123
      end_stage
```

- **演示要点**：演示 stage 的参数：aero, empty_mass, fuel_mass, sea_level_thrust, vacuum_thrust, burn_rate, thrust_duration, thrust_vectoring_angle_limit, lateral_thrust_gain, pre_separation_coast_time

### stage（atlas_v_401_base）｜

- **关键词**：stage, aero, empty_mass, fuel_mass, thrust, burn_rate, thrust_duration, thrust_vectoring_angle_limit, lateral_thrust_gain, pre_ignition_coast_time, pre_separation_coast_time
- **出处**：`space_operations/launch_vehicles/atlas_v_401/atlas_v_401_base.txt:99-119`
- **片段**：

```text
      stage 2
         aero                          ATLAS_V_401_STAGE_2_AERO
         empty_mass                    2243 kg             # (SF101)
         fuel_mass                     20830 kg            # (SF101)
         # For engines that run ONLY in a vacuum, just use the normal thrust/impulse values.
         thrust                        101800 nt           # (SF101) Isp 449.7 sec
         # mdot = thrust / (g0 * Isp)
         #      = 101800 / (9.8 * 449.7) = 23.1
         burn_rate                     23.1 kg/s           # calculated above
         # (SF101) lists the thrust duration as variable. At full throttle the thrust duration would becomes
         #   20830 kg / 23.1 kg/s = 901.7 sec
         thrust_duration               901.7 sec           # (SF101)

         thrust_vectoring_angle_limit  10 deg
         lateral_thrust_gain           100.0

         pre_ignition_coast_time       0 sec               # UNKNOWN
         pre_separation_coast_time     0 sec               # UNKNOWN

         # Attitude control via thrusters 4 x 27-N (roll?) and 8 x 40-N (lateral) (SF101)0
      end_stage
```

- **演示要点**：演示 stage 的参数：aero, empty_mass, fuel_mass, thrust, burn_rate, thrust_duration, thrust_vectoring_angle_limit, lateral_thrust_gain, pre_ignition_coast_time, pre_separation_coast_time

### stage（falcon_9_base）｜

- **关键词**：stage, aero, empty_mass, fuel_mass, sea_level_thrust, vacuum_thrust, burn_rate, throttle, thrust_vectoring_angle_limit, lateral_thrust_gain, pre_separation_coast_time
- **出处**：`space_operations/launch_vehicles/falcon_9/falcon_9_base.txt:86-110`　（同签名共 3 处，另见 `space_operations/launch_vehicles/falcon_heavy/falcon_heavy_base.txt:154`、`space_operations/launch_vehicles/atlas_v_401/atlas_v_401_base.txt:65`）
- **片段**：

```text
      stage 1
         aero                          FALCON_9_STAGE_1_AERO
         empty_mass                    22200 kg            # SF101 (estimated 20-24 kg)
         empty_mass                    24564 kg            # adding 2,364 kg assumed for interstage (see stage 4)
         fuel_mass                     411000 kg           # SF101 (estimated)
         sea_level_thrust              7607000 nt          # SF101 (Isp: 282 sec)
         vacuum_thrust                 8227000 nt          # SF101 (Isp: 311 sec)
         burn_rate                     2700 kg/s           # calculated from thrust and Isp, full throttle

         # There is not much known about the throttle profile.
         throttle
            curve
               independent_variable time units secs
                 0.000  0.95
                60.000  0.95
                60.001  0.8
                70.000  1.0
                85.001  0.95
               200.000  0.95  # Setting a large time will go until the fuel runs out
            end_curve

         thrust_vectoring_angle_limit  10 deg
         lateral_thrust_gain           10.0
         pre_separation_coast_time     5 sec               # PUG
      end_stage
```

- **演示要点**：演示 stage 的参数：aero, empty_mass, fuel_mass, sea_level_thrust, vacuum_thrust, burn_rate, throttle, thrust_vectoring_angle_limit, lateral_thrust_gain, pre_separation_coast_time

### stage（saturn_v_complex）｜

- **关键词**：stage, aero, fuel_mass, empty_mass, total_mass, thrust, thrust_duration, burn_rate, thrust_vectoring_angle_limit, lateral_thrust_gain, pre_ignition_coast_time
- **出处**：`space_operations/launch_vehicles/saturn_v/saturn_v_complex.txt:235-262`　（同签名共 2 处，另见 `space_operations/launch_vehicles/saturn_v/saturn_v_simple.txt:159`）
- **片段**：

```text
      stage 3
         aero none
         #total_mass                    262613 lbm
         fuel_mass                     236105 lbm          # 192,497 oxidizer + 43,608 fuel
         empty_mass                     26508 lbm          # 24,852 dry + 1,656 other

         # Removed 178 lbm for ullage fuel and motors that are handled as ejectables...
         total_mass                    262435 lbm
         empty_mass                     26330 lbm

         thrust                        202603 lbf
         thrust_duration               147.13 sec          # From T+9:12.20 (552.20) to T+11:39.33 (699.33)
         # The time history file from the website at the first burn ending at 706.85 seconds (T+11:46.85).
         # I'm increasing the duration to correspond to the time history file.
         thrust_duration               154.65 sec          # From T+9:12.20 (552.20) to T+11:46.85 (706.85)

         burn_rate                     470.50 lbm/sec

         # Lateral commands are accomplished by thrusters and not thrust vectoring. But we don't do
         # thrusters so we use thrust vectoring but make it very efficient so it doesn't steal axial thrust.

         thrust_vectoring_angle_limit  10 deg
         lateral_thrust_gain           100.0

         # Separation of previous stage was at T+9:09.00 (549.00)
         # Ignition at T+9:12.20 (552.20)
         pre_ignition_coast_time       3.20 sec
      end_stage
```

- **演示要点**：演示 stage 的参数：aero, fuel_mass, empty_mass, total_mass, thrust, thrust_duration, burn_rate, thrust_vectoring_angle_limit, lateral_thrust_gain, pre_ignition_coast_time

### stage（saturn_v_simple）｜

- **关键词**：stage, aero, fuel_mass, empty_mass, thrust, burn_rate, throttle, thrust_vectoring_angle_limit, lateral_thrust_gain, pre_ignition_coast_time, pre_separation_coast_time
- **出处**：`space_operations/launch_vehicles/saturn_v/saturn_v_simple.txt:124-156`　（同签名共 2 处，另见 `space_operations/launch_vehicles/saturn_v/saturn_v_complex.txt:190`）
- **片段**：

```text
      stage 2
         aero SATURN_V_S-II_AERO
         #total_mass                    1058140 lbm
         fuel_mass                      977166 lbm         # 819,050 oxidizer + 158,116 fuel
         empty_mass                      80974 lbm         # 79,714 dry + 1,260 other

         # This is a vacuum only engine... use unqualified thrust and burn rate.
         thrust                         1147500 lbf
         burn_rate                      2701.65 lbm/sec

         throttle
            curve
               independent_variable time units sec
               #dependent_variable
                 0.000 1.00000000  # T+2:44.00 (164.00)
               296.621 1.00000000  # T+7:40.62 (460.62 - 164.00 = 296.62) Center engine cutoff (CECO)
               296.622 0.79672331
               334.001 0.79672331  # T+8:18.00 (498.00 - 164.00 = 334.00) EMR shift
               334.002 0.59765577
               384.220 0.59765577  # T+9:08.22 (548.22 - 164.00 = 384.22) Shutdown
            end_curve

         thrust_vectoring_angle_limit  10 deg
         lateral_thrust_gain           10.0

         # Separation of previous stage was at T+2:42.20 (162.20)
         # Ignition of this stage is T+2:44.00 (164.00)
         pre_ignition_coast_time       1.8 sec            # 164.00 - 162.20

         # Cutoff is T+9:08.22 (548.22)
         # Separation is at T+9:09.00 (549.00)
         pre_separation_coast_time     0.78 sec           # 549.00 - 548.22
      end_stage
```

- **演示要点**：演示 stage 的参数：aero, fuel_mass, empty_mass, thrust, burn_rate, throttle, thrust_vectoring_angle_limit, lateral_thrust_gain, pre_ignition_coast_time, pre_separation_coast_time

### stage（delta_iv_m_base）｜

- **关键词**：stage, aero, total_mass, sea_level_thrust, sea_level_specific_impulse, nozzle_exit_area, thrust_duration, thrust_vectoring_angle_limit, lateral_thrust_gain, pre_separation_coast_time
- **出处**：`space_operations/launch_vehicles/delta_iv_m/delta_iv_m_base.txt:58-70`
- **片段**：

```text
      stage 1
         aero DELTA_IV_M_STAGE_1_AERO
         total_mass                    226400 kg           # Wiki
         sea_level_thrust              3137000 nt          # UG
         #vacuum_thrust                 3560000 nt
         sea_level_specific_impulse    362.95794943820224719101123595506 s
         #vacuum_specific_impulse       411.9 s             # UG
         nozzle_exit_area              4.1744794236652521464521859271687 m2
         thrust_duration               245 sec
         thrust_vectoring_angle_limit  5 deg
         lateral_thrust_gain           5.0
         pre_separation_coast_time     6 sec               # UG
      end_stage
```

- **演示要点**：演示 stage 的参数：aero, total_mass, sea_level_thrust, sea_level_specific_impulse, nozzle_exit_area, thrust_duration, thrust_vectoring_angle_limit, lateral_thrust_gain, pre_separation_coast_time

### stage（proton-m）｜

- **关键词**：stage, aero, empty_mass, fuel_mass, thrust, specific_impulse, thrust_duration, thrust_vectoring_angle_limit, lateral_thrust_gain, pre_separation_coast_time
- **出处**：`space_operations/launch_vehicles/proton_m/proton-m.txt:79-92`
- **片段**：

```text
      stage 2
         aero                          PROTON-M_STAGE_2_AERO
         empty_mass                    11715 kg            # (SF101)
         fuel_mass                     156113 kg           # (SF101)

         thrust                        2399000 Nt          # (SF101)
         specific_impulse              327 sec             # (SF101)
         thrust_duration               206 sec             # (SF101)

         thrust_vectoring_angle_limit  7.0 deg
         lateral_thrust_gain           100.0

         pre_separation_coast_time     6 sec               # (SPG) separate at T+335
      end_stage
```

- **演示要点**：演示 stage 的参数：aero, empty_mass, fuel_mass, thrust, specific_impulse, thrust_duration, thrust_vectoring_angle_limit, lateral_thrust_gain, pre_separation_coast_time

### stage（falcon_9_base）｜

- **关键词**：stage, aero, empty_mass, fuel_mass, thrust, burn_rate, thrust_vectoring_angle_limit, lateral_thrust_gain, pre_ignition_coast_time, pre_separation_coast_time
- **出处**：`space_operations/launch_vehicles/falcon_9/falcon_9_base.txt:115-129`　（同签名共 2 处，另见 `space_operations/launch_vehicles/falcon_heavy/falcon_heavy_base.txt:182`）
- **片段**：

```text
      stage 2
         aero                          FALCON_9_STAGE_2_AERO
         empty_mass                    4000 kg             # SF101 (estimated)
         fuel_mass                     107500 kg           # SF101 (estimated)
         # For engines that run ONLY in a vacuum, just use the normal thrust/impulse values.
         thrust                        934000 nt           # SF101: (Isp 348 sec)
         burn_rate                     273.68 kg/s         # calculated from thrust and Isp
         #thrust_duration               392 sec             # SF101
         #thrust_duration               360 sec             # PUG

         thrust_vectoring_angle_limit  10 deg
         lateral_thrust_gain           100.0
         pre_ignition_coast_time       5 sec               # PUG
         pre_separation_coast_time     60 sec              # PUG   # TODO_JAJ IS IT THIS LONG!
      end_stage
```

- **演示要点**：演示 stage 的参数：aero, empty_mass, fuel_mass, thrust, burn_rate, thrust_vectoring_angle_limit, lateral_thrust_gain, pre_ignition_coast_time, pre_separation_coast_time

### stage（proton-m）｜

- **关键词**：stage, aero, total_mass, empty_mass, fuel_mass, thrust, specific_impulse, thrust_duration, thrust_vectoring_angle_limit, lateral_thrust_gain
- **出处**：`space_operations/launch_vehicles/proton_m/proton-m.txt:119-136`
- **片段**：

```text
      stage 4
         aero                          none
         total_mass                    0.01 kg             # Dummy placeholder when not using Briz-M
/*
         empty_mass                    2370 kg             # (SF101)
         fuel_mass                     19800 kg            # (SF101)
         thrust                        19620 nt            # (SF101)
         specific_impulse              328.6 sec           # (SF101)
         thrust_duration               200 sec             # (SF101) 3,200 sec with 8 restarts or 2,000 single burn

         thrust_vectoring_angle_limit  7.0 deg
         lateral_thrust_gain           100.0

         # There are also thrusters, but we won't worry about them:
         #   4x 11D458M (392N, Isp=296)
         #  12x 17D58E (13.3N, Isp=269s)
*/
      end_stage
```

- **演示要点**：演示 stage 的参数：aero, total_mass, empty_mass, fuel_mass, thrust, specific_impulse, thrust_duration, thrust_vectoring_angle_limit, lateral_thrust_gain

### stage（falcon_heavy_base）｜

- **关键词**：stage, aero, empty_mass, fuel_mass, sea_level_thrust, vacuum_thrust, burn_rate, throttle, thrust_vectoring_angle_limit, lateral_thrust_gain
- **出处**：`space_operations/launch_vehicles/falcon_heavy/falcon_heavy_base.txt:110-152`
- **片段**：

```text
      stage 1
         aero                          FALCON_HEAVY_STAGE_1A_AERO

         # Empty mass is two Falcon Heavy Boosters, 2 x 22,500 kg (SF101)
         empty_mass                    45000 kg            # (SF101)
         empty_mass                    51000 kg            # + 6,000 kg for coupling hardware (see NOTES)

         # Fuel mass is the fuel mass of two Falcon Heavy Boosters, 2 x 409,500 kg (SF101)
         #     PLUS xxx seconds of Falcon Heavy Core running at 50% =
         fuel_mass                     819000 kg           # (SF101) Two Falcon Heavy Boosters
         # The core is assumed 30 seconds at full thrust plus 132 seconds at 55%
         #  (2,700 kg/sec * (30.0 + 132 * 0.55) = 277,200 kg
         fuel_mass                     277200 kg
         fuel_mass                     1096020 kg          # Sum of the above two...

         # Full throttle thrust and burn rate...

         sea_level_thrust              22819000 nt         # (SF101) (Isp: 282 sec)
         vacuum_thrust                 24678000 nt         # (SF101) (Isp: 311 sec)
         burn_rate                     8100 kg/s           # 27 engines * 300 kg/sec/engine

         # We don't know much about the throttle except what SF101 says:
         #   1) The engines at full thrust during initial liftoff.
         #   2) Core is throttled back to a 'minimal thrust'. SF101 says 'the baseline throttle capability
         #      is 55-100% of the rated performance, but there is strong indication it can go as low as 40%.
         #   3) The booster burn time is 162 sec.
         #   4) The core burn time is 230 sec.

         # The 0.85 throttle factor in the table is the two boosters at 100% and the core at 55%.
         #
         #   (18 engines * 1.0 + 9 engines * 0.55) / 27 engines = (18 + 4.95) / 27 = 22.95 / 27 = 0.85
         throttle
            curve
               independent_variable time units secs
                 0.000  1.0
                30.000  1.0
                30.001  0.85
               162.000  0.85
            end_curve

         thrust_vectoring_angle_limit  10 deg
         lateral_thrust_gain           100.0
      end_stage
```

- **演示要点**：演示 stage 的参数：aero, empty_mass, fuel_mass, sea_level_thrust, vacuum_thrust, burn_rate, throttle, thrust_vectoring_angle_limit, lateral_thrust_gain

### stage（delta_iv_m_base）｜

- **关键词**：stage, aero, total_mass, fuel_mass, thrust, thrust_duration, thrust_vectoring_angle_limit, lateral_thrust_gain, pre_ignition_coast_time
- **出处**：`space_operations/launch_vehicles/delta_iv_m/delta_iv_m_base.txt:73-84`
- **片段**：

```text
      stage 2
         aero DELTA_IV_M_STAGE_2_AERO
         total_mass                    24170 kg            # Wiki
         fuel_mass                     20410 kg            # UG
         thrust                        110000 nt           # UG
         # Calculated automatically from fuel_mass and thrust_duration.
         #specific_impulse              465 sec             # UG
         thrust_duration               850 sec             # UG says 'approximately'
         thrust_vectoring_angle_limit  5 deg
         lateral_thrust_gain           10.0                # Need a bigger value for small engine
         pre_ignition_coast_time       14 sec              # UG
      end_stage
```

- **演示要点**：演示 stage 的参数：aero, total_mass, fuel_mass, thrust, thrust_duration, thrust_vectoring_angle_limit, lateral_thrust_gain, pre_ignition_coast_time

### stage（launcher_one_base）｜

- **关键词**：stage, aero, empty_mass, fuel_mass, vacuum_thrust, vacuum_specific_impulse, nozzle_exit_area, thrust_vectoring_angle_limit, lateral_thrust_gain
- **出处**：`space_operations/launch_vehicles/launcher_one/launcher_one_base.txt:113-125`
- **片段**：

```text
       stage 2
          aero LAUNCHER_ONE_AERO

          empty_mass               2000 kg
          fuel_mass                27500 kg    # 80% of volume is fuel

          vacuum_thrust            327000 nt
          vacuum_specific_impulse  311 sec
          nozzle_exit_area         1.88 m^2

          thrust_vectoring_angle_limit  10 deg
          lateral_thrust_gain      100.0
       end_stage
```

- **演示要点**：演示 stage 的参数：aero, empty_mass, fuel_mass, vacuum_thrust, vacuum_specific_impulse, nozzle_exit_area, thrust_vectoring_angle_limit, lateral_thrust_gain

### stage（proton-m）｜

- **关键词**：stage, aero, empty_mass, fuel_mass, thrust, specific_impulse, thrust_duration, thrust_vectoring_angle_limit, lateral_thrust_gain
- **出处**：`space_operations/launch_vehicles/proton_m/proton-m.txt:103-116`
- **片段**：

```text
      stage 3
         aero                          none
         empty_mass                    4185 kg             # (SF101)
         fuel_mass                     46562 kg            # (SF101)

         thrust                        613800 Nt           # (SF101) Includes the RD-0213 and the RD-0214 vernier
         specific_impulse              325 sec             # (SF101)
         thrust_duration               238 sec             # (SF101)

         thrust_vectoring_angle_limit  7.0 deg
         lateral_thrust_gain           100.0

         #pre_separation_coast_time     0.1 sec
      end_stage
```

- **演示要点**：演示 stage 的参数：aero, empty_mass, fuel_mass, thrust, specific_impulse, thrust_duration, thrust_vectoring_angle_limit, lateral_thrust_gain

### stage（red_mrbm_3）｜

- **关键词**：stage, aero, pre_ignition_coast_time, total_mass, fuel_mass, specific_impulse, thrust_duration, pre_separation_coast_time
- **出处**：`base_types/weapons/ssm/red_mrbm_3.txt:219-227`
- **片段**：

```text
   stage 2
       aero                   RED_MRBM_3_STAGE_2_AERO
       pre_ignition_coast_time 3 sec
       total_mass             4000 kg
       fuel_mass              3350 kg
       specific_impulse       240 sec  # adjusted for max range of 2000 km
       thrust_duration        46 sec
       pre_separation_coast_time  10 sec
   end_stage
```

- **演示要点**：演示 stage 的参数：aero, pre_ignition_coast_time, total_mass, fuel_mass, specific_impulse, thrust_duration, pre_separation_coast_time

### stage（blue_naval_sam）｜

- **关键词**：stage, aero, pre_ignition_coast_time, total_mass, empty_mass, specific_impulse, thrust_duration, pre_separation_coast_time
- **出处**：`ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:102-111`　（同签名共 3 处，另见 `base_types/weapons/sam/blue_naval_sam.txt:102`、`space_operations/weapons/blue_naval_sam.txt:102`）
- **片段**：

```text
   stage 2 # MK-104 Solid Rocket Booster
       aero                   BLUE_NAVAL_SAM_STAGE_2_AERO
       pre_ignition_coast_time 1 sec
       total_mass              1100 lbs
       empty_mass              282 lbs
       #fuel_mass              418 lbs
       specific_impulse       260 sec
       thrust_duration        25 sec
       pre_separation_coast_time  30 sec
   end_stage
```

- **演示要点**：演示 stage 的参数：aero, pre_ignition_coast_time, total_mass, empty_mass, specific_impulse, thrust_duration, pre_separation_coast_time

### stage（lrsam）｜

- **关键词**：stage, aero, total_mass, fuel_mass, thrust_duration, thrust, thrust_vectoring_time_limits, thrust_vectoring_angle_limit
- **出处**：`engage/weapons/lrsam.txt:79-88`
- **片段**：

```text
   stage 2
      aero                          LRSAM_AERO
      total_mass                    1284.001 kg
      fuel_mass                     1284 kg
      thrust_duration               20.0 sec
      thrust                        157386.0 nt

      thrust_vectoring_time_limits  0.77 sec 5.0 sec
      thrust_vectoring_angle_limit  15 deg
   end_stage
```

- **演示要点**：演示 stage 的参数：aero, total_mass, fuel_mass, thrust_duration, thrust, thrust_vectoring_time_limits, thrust_vectoring_angle_limit

### stage（launcher_one_base）｜

- **关键词**：stage, aero, empty_mass, fuel_mass, thrust, specific_impulse, thrust_vectoring_angle_limit, lateral_thrust_gain
- **出处**：`space_operations/launch_vehicles/launcher_one/launcher_one_base.txt:136-148`
- **片段**：

```text
       stage 4
          aero none

          empty_mass               750 kg
          fuel_mass                6000 kg   # 80% of the volume is fuel

          # Use unreferenced thrust and specific_impulse commands when both aren't given
          thrust                   22000 nt
          specific_impulse         311 sec

          thrust_vectoring_angle_limit  10 deg
          lateral_thrust_gain      100.0
       end_stage
```

- **演示要点**：演示 stage 的参数：aero, empty_mass, fuel_mass, thrust, specific_impulse, thrust_vectoring_angle_limit, lateral_thrust_gain

### stage（blue_cruise_missile）｜

- **关键词**：stage, initial_mass, fuel_mass, thrust, burn_rate, aero, thrust_delay
- **出处**：`base_types/weapons/ssm/blue_cruise_missile.txt:61-68`
- **片段**：

```text
     stage 2 # Turbofan
        initial_mass         2650 lb
        fuel_mass            500 lb # guess
        thrust               696.9 lbf
        burn_rate            350 lb/hr
        aero                 BLUE_CRUISE_MISSILE_AERO
        thrust_delay         1.0 sec  # no idea how long before it fires off after the booster falls off...
     end_stage
```

- **演示要点**：演示 stage 的参数：initial_mass, fuel_mass, thrust, burn_rate, aero, thrust_delay

### stage（red_srbm_1）｜

- **关键词**：stage, aero, empty_mass, fuel_mass, thrust, specific_impulse, thrust_duration
- **出处**：`base_types/weapons/ssm/red_srbm_1.txt:71-78`　（同签名共 3 处，另见 `base_types/weapons/ssm/red_srbm_2.txt:72`、`base_types/weapons/ssm/red_mrbm_2.txt:126`）
- **片段**：

```text
   stage 1
      aero                   RED_SRBM_1_AERO
      empty_mass             4500.0 lbs          # Brian's data
      fuel_mass              9450.0 lbs          # Brian's data
      thrust                 26000.0 lbf         # Brian's data
      specific_impulse       220.0 sec           # Brian's data
      thrust_duration        79.94 sec           # Brian's data (From BallisticTable)
   end_stage
```

- **演示要点**：演示 stage 的参数：aero, empty_mass, fuel_mass, thrust, specific_impulse, thrust_duration

### stage（blue_slbm）｜

- **关键词**：stage, aero, total_mass, fuel_mass, specific_impulse, thrust_duration, pre_ignition_coast_time
- **出处**：`base_types_nx/weapons/ssm/blue_slbm.txt:106-113`　（同签名共 2 处，另见 `base_types_nx/weapons/ssm/blue_slbm.txt:97`）
- **片段**：

```text
   stage 3
      aero                   BLUE_SLBM_STAGE_3_AERO
      total_mass             4820   lbm     # per RMED data
      fuel_mass              4470   lbm     # per RMED data
      specific_impulse       260 sec        # typical for high end per internet
      thrust_duration        40 sec         # from alternatewars.com
      pre_ignition_coast_time 2 sec         # unknown
   end_stage
```

- **演示要点**：演示 stage 的参数：aero, total_mass, fuel_mass, specific_impulse, thrust_duration, pre_ignition_coast_time

### stage（ssm_base）｜

- **关键词**：stage, aero, total_mass, fuel_mass, specific_impulse, thrust_duration, burn_rate
- **出处**：`signature_demos/movers/ssm_base.txt:70-77`　（同签名共 2 处，另见 `signature_demos/movers/ssm_base.txt:79`）
- **片段**：

```text
   stage 1
      aero                   SSM_STAGE_1_AERO
      total_mass             10454 kg
      fuel_mass              8844 kg             # 10,454 * 0.846 (using Ref 3)
      specific_impulse       260 sec             # Ref 4/5
      thrust_duration        90 sec
      burn_rate              98.267 kg/sec       # 8844 kg / 90 sec
   end_stage
```

- **演示要点**：演示 stage 的参数：aero, total_mass, fuel_mass, specific_impulse, thrust_duration, burn_rate

### stage（blue_naval_sam）｜

- **关键词**：stage, aero, total_mass, empty_mass, specific_impulse, thrust_duration, pre_separation_coast_time
- **出处**：`ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:112-120`　（同签名共 3 处，另见 `base_types/weapons/sam/blue_naval_sam.txt:112`、`space_operations/weapons/blue_naval_sam.txt:112`）
- **片段**：

```text
   stage 3 # MK-136 Solid Rocket
       aero                  BLUE_NAVAL_SAM_STAGE_3_AERO
       total_mass            220 lbs
       empty_mass            187 lbs
      # fuel_mass             125 lbs
       specific_impulse      260 sec
       thrust_duration        15 sec
       pre_separation_coast_time  1 sec
   end_stage
```

- **演示要点**：演示 stage 的参数：aero, total_mass, empty_mass, specific_impulse, thrust_duration, pre_separation_coast_time

### stage（blue_asm_missile）｜

- **关键词**：stage, initial_mass, fuel_mass, thrust, thrust_duration, aero, thrust_delay
- **出处**：`new_guidance/weapons/agm/blue_asm_missile.txt:47-56`
- **片段**：

```text
      stage 1
         # Warhead 487 lb (221 kg)
         initial_mass        519 kg              # 1144 lb
         fuel_mass           200 kg              # Guess
         thrust              2900 Nt
         #specific_impulse    300 sec             # Guess
         thrust_duration      1000 sec
         aero                BLUE_ASM_MISSILE_AERO
         thrust_delay        1.0 sec
      end_stage
```

- **演示要点**：演示 stage 的参数：initial_mass, fuel_mass, thrust, thrust_duration, aero, thrust_delay

### stage（blue_lr_sam_common）｜

- **关键词**：stage, aero, nozzle_exit_area, total_mass, fuel_mass, thrust_duration, sea_level_specific_impulse
- **出处**：`base_types/weapons/sam/blue_lr_sam_common.txt:241-252`
- **片段**：

```text
  stage 1
     aero                              BLUE_LR_SAM_BOOSTER_AERO
     nozzle_exit_area                  0.305 m^2           # See calculations above

     total_mass                        600 kg              # See calculations above
     fuel_mass                         485 kg              # See calculations above
     #thrust_duration                   11.0 sec
     #sea_level_specific_impulse        265 sec             # Ref 6

     thrust_duration                   18 sec              # Adjusted to get close to 2800 m/s
     sea_level_specific_impulse        250 sec             # Adjusted to get close to 2800 m/s
  end_stage
```

- **演示要点**：演示 stage 的参数：aero, nozzle_exit_area, total_mass, fuel_mass, thrust_duration, sea_level_specific_impulse

### stage（blue_naval_sam）｜

- **关键词**：stage, aero, empty_mass, total_mass, specific_impulse, thrust_duration
- **出处**：`ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:95-101`　（同签名共 3 处，另见 `base_types/weapons/sam/blue_naval_sam.txt:95`、`space_operations/weapons/blue_naval_sam.txt:95`）
- **片段**：

```text
   stage 1 # MK-72 Solid Rocket Booster
       aero                   BLUE_NAVAL_SAM_STAGE_1_AERO
       empty_mass             535 lbs
       total_mass             1540 lbs
       specific_impulse       260 sec
       thrust_duration        6 sec
   end_stage
```

- **演示要点**：演示 stage 的参数：aero, empty_mass, total_mass, specific_impulse, thrust_duration

### stage（red_mrbm_1）｜

- **关键词**：stage, aero, total_mass, fuel_mass, specific_impulse, thrust_duration
- **出处**：`ballistic_missile_shootdown/weapons/ssm/red_mrbm_1.txt:260-266`　（同签名共 13 处，另见 `ballistic_missile_shootdown/weapons/ssm/red_mrbm_1.txt:268`、`base_types/weapons/ssm/red_mrbm_1.txt:260`、`base_types/weapons/ssm/red_mrbm_1.txt:268`）
- **片段**：

```text
   stage 1
      aero                   RED_MRBM_1_STAGE_1_AERO
      total_mass             10454 kg
      fuel_mass              8844 kg             # 10,454 * 0.846 (using Ref 3)
      specific_impulse       260 sec             # Ref 4/5
      thrust_duration        90 sec
   end_stage
```

- **演示要点**：演示 stage 的参数：aero, total_mass, fuel_mass, specific_impulse, thrust_duration

### stage（ssm_missile）｜

- **关键词**：stage, empty_mass, fuel_mass, thrust, thrust_duration, aero
- **出处**：`new_guidance/weapons/ssm/ssm_missile.txt:69-75`　（同签名共 6 处，另见 `base_types/weapons/agm/mach_4_missile.txt:60`、`base_types/weapons/agm/mach_4_missile.txt:68`、`base_types/weapons/agm/mach_4_missile.txt:77`）
- **片段**：

```text
      stage 2 # Second Stage LightOff
         empty_mass          0.01 lb
         fuel_mass           10.0 lb
         thrust              800 lbsf
         thrust_duration     23 sec
         aero                SSM203_CRUISE_AERO
      end_stage
```

- **演示要点**：演示 stage 的参数：empty_mass, fuel_mass, thrust, thrust_duration, aero

### stage（blue_cruise_missile）｜

- **关键词**：stage, initial_mass, fuel_mass, thrust, thrust_duration, aero
- **出处**：`base_types/weapons/ssm/blue_cruise_missile.txt:53-59`
- **片段**：

```text
     stage 1 # Booster
        initial_mass         550 lbs
        fuel_mass            440 lbs
        thrust               7418 lbf
        thrust_duration      12 sec
        aero                 BLUE_CRUISE_MISSILE_AERO
     end_stage
```

- **演示要点**：演示 stage 的参数：initial_mass, fuel_mass, thrust, thrust_duration, aero

### stage（client_agm）｜

- **关键词**：stage, aero, total_mass, thrust, fuel_mass, thrust_duration
- **出处**：`cyber/weapons/agm/client_agm.txt:59-65`　（同签名共 13 处，另见 `cyber/weapons/agm/leader_agm.txt:60`、`cyber/weapons/sam/sr_sam.txt:64`、`orwaca_iads/weapons/sam/elr_sam.txt:64`）
- **片段**：

```text
      stage 2
         aero CLIENT_AGM_EXTENDED_AERO
         total_mass 50 lbs
         thrust 150 lbsf
         fuel_mass 40 lbs
         thrust_duration 4 hours
      end_stage
```

- **演示要点**：演示 stage 的参数：aero, total_mass, thrust, fuel_mass, thrust_duration

### stage（lrsam）｜

- **关键词**：stage, aero, total_mass, empty_mass, thrust, thrust_duration
- **出处**：`engage/weapons/lrsam.txt:71-77`　（同签名共 5 处，另见 `orwaca_iads/weapons/sam/elr_sam.txt:56`、`orwaca_iads/weapons/sam/lr_sam.txt:56`、`orwaca_iads/weapons/sam/mr_sam.txt:56`）
- **片段**：

```text
   stage 1
      aero                          LRSAM_AERO
      total_mass                    0.0078 kg
      empty_mass                    0.0001 kg
      thrust                        51479.4 nt
      thrust_duration               0.77 sec
   end_stage
```

- **演示要点**：演示 stage 的参数：aero, total_mass, empty_mass, thrust, thrust_duration

### stage（red_sr_naval_sam_1）｜

- **关键词**：stage, empty_mass, fuel_mass, thrust_duration, specific_impulse, aero
- **出处**：`ship_ad/weapons/sam/red_sr_naval_sam_1.txt:41-47`　（同签名共 2 处，另见 `ship_ad/weapons/sam/red_sr_sam_2.txt:44`）
- **片段**：

```text
    stage 1
       empty_mass        0.01 kg
       fuel_mass         230 kg
       thrust_duration   2.5 sec       # assuming 25% of total burn time
       specific_impulse  250 sec       # typical solid propellant
       aero              RED_SR_NAVAL_SAM_1_AERO
    end_stage
```

- **演示要点**：演示 stage 的参数：empty_mass, fuel_mass, thrust_duration, specific_impulse, aero

### stage（tbm2）｜

- **关键词**：stage, total_mass, fuel_mass, ballistic_coefficient, thrust, thrust_duration
- **出处**：`tbm_demos/weapons/ssm/tbm2.txt:43-49`　（同签名共 2 处，另见 `tbm_demos/weapons/ssm/tbm2.txt:50`）
- **片段**：

```text
      stage 1
         total_mass             3000 kg
         fuel_mass              2999.99 kg
         ballistic_coefficient  208250.0 nt/m^2
         thrust                 150000 nt
         thrust_duration        50 sec
      end_stage
```

- **演示要点**：演示 stage 的参数：total_mass, fuel_mass, ballistic_coefficient, thrust, thrust_duration

### stage（tbm3）｜

- **关键词**：stage, empty_mass, fuel_mass, ballistic_coefficient, thrust, thrust_duration
- **出处**：`tbm_demos/weapons/ssm/tbm3.txt:37-43`　（同签名共 2 处，另见 `tbm_demos/weapons/ssm/tbm3.txt:44`）
- **片段**：

```text
      stage 1
         empty_mass             613 lb
         fuel_mass              3474 lb
         ballistic_coefficient  5000 lbf/ft^2
         thrust                 53900 lbf
         thrust_duration        16.1 sec
      end_stage
```

- **演示要点**：演示 stage 的参数：empty_mass, fuel_mass, ballistic_coefficient, thrust, thrust_duration

### stage（red_srbm_3）｜

- **关键词**：stage, aero, total_mass, fuel_mass, specific_impulse, thrust
- **出处**：`base_types/weapons/ssm/red_srbm_3.txt:199-206`　（同签名共 5 处，另见 `base_types/weapons/ssm/red_srbm_3.txt:208`、`base_types/weapons/ssm/red_srbm_4.txt:232`、`base_types/weapons/ssm/red_srbm_4.txt:241`）
- **片段**：

```text
   stage 1
      aero                   RED_SRBM_3_STAGE_1_AERO
      total_mass             32384 lbs             # Ref 1, 14720 kg (32384 lbs)
      fuel_mass              27522 lbs             # Ref 1, Empty wgt 2210 kg (4862)
      specific_impulse       235 sec               # Ref 1, Average of 220-250
#     thrust_duration        50 sec                # Ref 1
      thrust                 122320 lbf            # Ref 1, 55600 kgf (122320 lbf)
   end_stage
```

- **演示要点**：演示 stage 的参数：aero, total_mass, fuel_mass, specific_impulse, thrust

### stage（blue_sr_sam_common）｜

- **关键词**：stage, aero, total_mass, empty_mass, specific_impulse, burn_time
- **出处**：`base_types/weapons/sam/blue_sr_sam_common.txt:105-120`
- **片段**：

```text
   stage 1
      aero                   BLUE_SR_SAM_AERO
      total_mass             315 kg              # Ref 1

#     Ref 2 defines the warhead to be 73 kg
#     Add another 20% of remaining mass for structure. (Space Shuttle SRB is
#     about 15% structure, but we're making it 20% to account for higher G's.
#
#     315 kg - 73 kg = 242 kg
#     242 kg * 0.2   = 48.4 kg
#     So empty mass = 73 + 48 = 121.4 kg

      empty_mass             121.4 kg            # See calculations above
      specific_impulse       250 sec             # Nominal solid rocket
      burn_time              13 sec              # Estimated to get speed ~= 1700 m/s
   end_stage
```

- **演示要点**：演示 stage 的参数：aero, total_mass, empty_mass, specific_impulse, burn_time

### stage（blue_adv_cruise_missile）｜

- **关键词**：stage, aero, total_mass, pre_ignition_coast_time, pre_separation_coast_time
- **出处**：`base_types/weapons/agm/blue_adv_cruise_missile.txt:70-75`　（同签名共 6 处，另见 `cyber/weapons/agm/client_agm.txt:53`、`cyber/weapons/agm/leader_agm.txt:54`、`parachute/parachute_example2.txt:40`）
- **片段**：

```text
      stage 1
         aero BLUE_ADV_CRUISE_MISSILE_WINGS_FOLDED
         total_mass 0 lbs
         pre_ignition_coast_time 0.1 sec
         pre_separation_coast_time 10.0 sec #give it 10 secs to open wings
      end_stage
```

- **演示要点**：演示 stage 的参数：aero, total_mass, pre_ignition_coast_time, pre_separation_coast_time

### stage（mission_design_astrolabe）｜

- **关键词**：stage, specific_impulse, thrust, empty_mass, fuel_mass
- **出处**：`space_operations/mission_design_astrolabe.txt:58-63`　（同签名共 3 处，另见 `space_operations/mission_design_astrolabe.txt:65`、`space_operations/mission_design_astrolabe.txt:72`）
- **片段**：

```text
         stage  // breeze-M APT (Auxiliary Propellant Tank; modeled as a separate stage, as it is jettisoned).
            specific_impulse 326 seconds
            thrust 19620 newtons
            empty_mass 1125 kg  // APT Only
            fuel_mass 10920 kg  // APT Only
         end_stage
```

- **演示要点**：演示 stage 的参数：specific_impulse, thrust, empty_mass, fuel_mass

### stage（blue_naval_sam）｜

- **关键词**：stage, aero, total_mass, fuel_mass
- **出处**：`ballistic_missile_shootdown/weapons/sam/blue_naval_sam.txt:121-125`　（同签名共 4 处，另见 `base_types/weapons/sam/blue_naval_sam.txt:121`、`base_types/weapons/ssm/red_mrbm_3.txt:228`、`space_operations/weapons/blue_naval_sam.txt:121`）
- **片段**：

```text
   stage 4 # warhead and seeker (aka kill vehicle )
       aero                  BLUE_NAVAL_SAM_STAGE_4_AERO
       total_mass           70 lbs
       fuel_mass              0 lbs
   end_stage
```

- **演示要点**：演示 stage 的参数：aero, total_mass, fuel_mass

### stage（parachute_example）｜

- **关键词**：stage, total_mass, pre_separation_coast_time, aero
- **出处**：`parachute/parachute_example.txt:36-40`　（同签名共 3 处，另见 `space_operations/launch_vehicles/launcher_one/launcher_one_base.txt:105`、`space_operations/launch_vehicles/launcher_one/launcher_one_base.txt:128`）
- **片段**：

```text
     stage 1 # intial jump; parachute not open
        total_mass 0.01 lbs
        pre_separation_coast_time   10 sec
        aero INITIAL_PARACHUTE_AERO
     end_stage
```

- **演示要点**：演示 stage 的参数：total_mass, pre_separation_coast_time, aero

### stage（alv）｜

- **关键词**：stage, aero, pre_separation_coast_time
- **出处**：`alv_routing/platforms/alv.txt:51-54`　（同签名共 2 处，另见 `satellite_demos/scenarios/gps_denied.txt:79`）
- **片段**：

```text
         stage 1 # Drop for 1 sec with folded wings
           aero               ALV_WINGS_FOLDED_AERO
           pre_separation_coast_time 0.2 sec
         end_stage
```

- **演示要点**：演示 stage 的参数：aero, pre_separation_coast_time

### stage（red_mrbm_1）｜

- **关键词**：stage, aero, total_mass
- **出处**：`ballistic_missile_shootdown/weapons/ssm/red_mrbm_1.txt:119-122`　（同签名共 50 处，另见 `ballistic_missile_shootdown/weapons/ssm/red_mrbm_1.txt:159`、`ballistic_missile_shootdown/weapons/ssm/red_mrbm_1.txt:276`、`base_types/weapons/agm/blue_adv_cruise_missile.txt:76`）
- **片段**：

```text
      stage 1
         aero                RED_MRBM_1_SPENT_STAGE_1_AERO
         total_mass          1618.0 kg
      end_stage
```

- **演示要点**：演示 stage 的参数：aero, total_mass

### stage（delta_iv_m_staging_failure）｜

- **关键词**：stage, separation_failure_probability, ignition_failure_probability
- **出处**：`space_operations/platforms/delta_iv_m_staging_failure.txt:22-25`
- **片段**：

```text
      stage 2
         separation_failure_probability 0.0
         ignition_failure_probability   1.0
      end_stage
```

- **演示要点**：演示 stage 的参数：separation_failure_probability, ignition_failure_probability

### stage（rocket）｜

- **关键词**：stage, pre_separation_coast_time
- **出处**：`signature_demos/platforms/rocket.txt:57-60`
- **片段**：

```text
      stage 1
         # Add some coast between stages so we can see the plume change
         pre_separation_coast_time 4.0 sec
      end_stage
```

- **演示要点**：演示 stage 的参数：pre_separation_coast_time

### stage（atlas_v_401_base）｜

- **关键词**：stage, aero
- **出处**：`space_operations/launch_vehicles/atlas_v_401/atlas_v_401_base.txt:126-129`
- **片段**：

```text
      stage 3
         aero                           none
         #total_mass                     2000 kg              # Not known
      end_stage
```

- **演示要点**：演示 stage 的参数：aero

### stage（gps_denied）｜

- **关键词**：stage
- **出处**：`satellite_demos/scenarios/gps_denied.txt:83-89`　（同签名共 4 处，另见 `ship_ad/weapons/ssm/ssm_missile.txt:31`、`alv_routing/platforms/alv.txt:55`、`script_demos/script_demo_7.txt:90`）
- **片段**：

```text
         stage 2 # Open wings and fire off engine
         total_mass         250 lb
         fuel_mass          200 lb  # Guess 80% fuel
         thrust             800 Nt
         thrust_duration      100 min
         aero                DECOY_MISSILE_AERO
         end_stage
```

- **演示要点**：演示 stage（最小结构，无子参数）

### status_settings（sam_battalion）｜

- **关键词**：status_settings, subord_yellow_timeout, subord_red_timeout
- **出处**：`iads_c2_demos/platforms/sam_battalion.txt:56-59`　（同签名共 2 处，另见 `iads_c2_demos/processors/asset_manager.txt:17`）
- **片段**：

```text
      status_settings
         subord_yellow_timeout  40 secs
         subord_red_timeout     60 secs
      end_status_settings
```

- **演示要点**：演示 status_settings 的参数：subord_yellow_timeout, subord_red_timeout

### stick_back（flight_controls_pm6）｜

- **关键词**：stick_back
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/flight_controls_pm6.txt:12-16`　（同签名共 17 处，另见 `six_dof/six_dof_types/aircraft/b-fw/controls/flight_controls_pm6.txt:20`、`six_dof/six_dof_types/aircraft/b-hvy/controls/flight_controls_pm6.txt:20`、`six_dof/six_dof_types/aircraft/c-hvy/controls/flight_controls_pm6.txt:20`）
- **片段**：

```text
   stick_back # Map of stick throw vs pitch rate command (deg/s)
      -1.0  -6.0
       0.0   0.0
       1.0  10.0
   end_stick_back
```

- **演示要点**：演示 stick_back（最小结构，无子参数）

### stick_right（flight_controls_pm6）｜

- **关键词**：stick_right
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/flight_controls_pm6.txt:18-22`　（同签名共 17 处，另见 `six_dof/six_dof_types/aircraft/b-fw/controls/flight_controls_pm6.txt:26`、`six_dof/six_dof_types/aircraft/b-hvy/controls/flight_controls_pm6.txt:26`、`six_dof/six_dof_types/aircraft/c-hvy/controls/flight_controls_pm6.txt:26`）
- **片段**：

```text
   stick_right # Map of stick throw vs roll rate command (deg/s)
      -1.0  -360.0
       0.0     0.0
       1.0   360.0
   end_stick_right
```

- **演示要点**：演示 stick_right（最小结构，无子参数）

### subobject（zell-launch-system）｜

- **关键词**：subobject, parent_rel_x, parent_rel_y, parent_rel_z, parent_rel_yaw, parent_rel_pitch, parent_rel_roll, separation_vx, separation_vy, separation_vz, separation_omega_x, separation_omega_y, separation_omega_z
- **出处**：`p6dof/p6dof_types/misc/zell-launch-system/zell-launch-system.txt:29-42`　（同签名共 24 处，另见 `p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:637`、`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:654`、`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:669`）
- **片段**：

```text
      subobject              Fighter    FA-LGT-ZLL
         parent_rel_x        0.0 ft
         parent_rel_y        0.0 ft
         parent_rel_z       -20.0 ft
         parent_rel_yaw      0.0 deg
         parent_rel_pitch    45.0 deg
         parent_rel_roll     0.0 deg
         separation_vx       0.0 ft/sec
         separation_vy       0.0 ft/sec
         separation_vz       0.0 ft/sec
         separation_omega_x  0.0 deg/sec
         separation_omega_y  0.0 deg/sec
         separation_omega_z  0.0 deg/sec
      end_subobject
```

- **演示要点**：演示 subobject 的参数：parent_rel_x, parent_rel_y, parent_rel_z, parent_rel_yaw, parent_rel_pitch, parent_rel_roll, separation_vx, separation_vy, separation_vz, separation_omega_x

### subobject（a-lgt-bombs）｜

- **关键词**：subobject, parent_rel_x, parent_rel_y, parent_rel_z, parent_rel_pitch, separation_vz, separation_omega_x, separation_omega_y, separation_omega_z
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/a-lgt-bombs.txt:20-29`　（同签名共 58 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/a-lgt-bombs.txt:31`、`p6dof/p6dof_types/aircraft/a-lgt/a-lgt-bombs.txt:42`、`p6dof/p6dof_types/aircraft/a-lgt/a-lgt-bombs.txt:53`）
- **片段**：

```text
      subobject              LD_Bomb1       UBU-500_LD
         parent_rel_x        -6.0 ft
         parent_rel_y        10.0 ft
         parent_rel_z        2.5 ft
         parent_rel_pitch    -10.0 deg
         separation_vz       4.0 ft/sec
         separation_omega_x  5.0 deg/sec
         separation_omega_y  60.0 deg/sec
         separation_omega_z  -30.0 deg/sec
      end_subobject
```

- **演示要点**：演示 subobject 的参数：parent_rel_x, parent_rel_y, parent_rel_z, parent_rel_pitch, separation_vz, separation_omega_x, separation_omega_y, separation_omega_z

### subobject（orbiter-main）｜

- **关键词**：subobject, parent_rel_x, separation_vx
- **出处**：`six_dof/six_dof_types/spacecraft/orbiter-main/orbiter-main.txt:66-69`　（同签名共 3 处，另见 `six_dof/six_dof_types/weapons/lrm-1-a/lrm-1-a.txt:73`、`six_dof/six_dof_types/weapons/lrm-1-a/lrm-1-a.txt:138`）
- **片段**：

```text
      subobject BoosterStage ORBITER-BOOSTER_PM6
         parent_rel_x   -6 ft
         separation_vx -10 fps         
      end_subobject
```

- **演示要点**：演示 subobject 的参数：parent_rel_x, separation_vx

### synthetic_pilot（control_inputs_pm6）｜

- **关键词**：synthetic_pilot, include, inherit_controls
- **出处**：`six_dof/six_dof_types/spacecraft/orbiter-booster/controls/control_inputs_pm6.txt:20-25`　（同签名共 3 处，另见 `six_dof/six_dof_types/weapons/lrm-1-c/controls/control_inputs_pm6.txt:20`、`six_dof/six_dof_types/weapons/lrm-1-c/controls/control_inputs_rb6.txt:68`）
- **片段**：

```text
   synthetic_pilot
      # Define the autopilot configuration
      include autopilot_config_pm6.txt
      
      inherit_controls  true
   end_synthetic_pilot
```

- **演示要点**：演示 synthetic_pilot 的参数：include, inherit_controls

### synthetic_pilot（control_inputs_pm6）｜

- **关键词**：synthetic_pilot, include
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/controls/control_inputs_pm6.txt:12-14`　（同签名共 40 处，另见 `six_dof_with_brawler/six_dof_types/aircraft/LTE_FIGHTER/controls/control_inputs_pm6.txt:12`、`p6dof/p6dof_types/aircraft/a-lgt/controls/control_inputs.txt:68`、`p6dof/p6dof_types/aircraft/b-fw/controls/control_inputs.txt:68`）
- **片段**：

```text
   synthetic_pilot
      include autopilot_config_pm6.txt
   end_synthetic_pilot
```

- **演示要点**：演示 synthetic_pilot 的参数：include

### synthetic_pilot（control_inputs）｜

- **关键词**：synthetic_pilot, controls_config_file
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/control_inputs.txt:59-61`
- **片段**：

```text
   synthetic_pilot
      controls_config_file  autopilot_config.txt
   end_synthetic_pilot
```

- **演示要点**：演示 synthetic_pilot 的参数：controls_config_file

### thrust_ab_alt_mach_table（LTE_FIGHTER_Eng）｜

- **关键词**：thrust_ab_alt_mach_table, file
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/prop/LTE_FIGHTER_Eng.txt:52-54`　（同签名共 8 处，另见 `p6dof/p6dof_types/aircraft/fa-hvy/prop/jet_engines/f-h4-22a-1-tf/f-h4-22a-1-tf.txt:95`、`p6dof/p6dof_types/aircraft/fa-lgt/prop/jet_engines/f-l4-11a-1-tf/f-l4-11a-1-tf.txt:95`、`six_dof/six_dof_types/aircraft/fa-hvy/prop/jet_engines/f-h4-22a-1-tf/f-h4-22a-1-tf.txt:90`）
- **片段**：

```text
         thrust_ab_alt_mach_table
            file data/thrust_ab_alt_mach.txt
         end_thrust_ab_alt_mach_table
```

- **演示要点**：演示 thrust_ab_alt_mach_table 的参数：file

### thrust_idle_alt_mach_table（LTE_FIGHTER_Eng）｜

- **关键词**：thrust_idle_alt_mach_table, file
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/prop/LTE_FIGHTER_Eng.txt:44-46`　（同签名共 21 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/prop/jet_engines/a-m4-22a-1-tf/a-m4-22a-1-tf.txt:64`、`p6dof/p6dof_types/aircraft/b-fw/prop/jet_engines/b-h4-40w-1-tf/b-h4-40w-1-tf.txt:64`、`p6dof/p6dof_types/aircraft/b-hvy/prop/jet_engines/b-h3-81a-1-tf/b-h3-81a-1-tf.txt:64`）
- **片段**：

```text
         thrust_idle_alt_mach_table
            file data/thrust_idle_alt_mach.txt
         end_thrust_idle_alt_mach_table
```

- **演示要点**：演示 thrust_idle_alt_mach_table 的参数：file

### thrust_mil_alt_mach_table（LTE_FIGHTER_Eng）｜

- **关键词**：thrust_mil_alt_mach_table, file
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/prop/LTE_FIGHTER_Eng.txt:48-50`　（同签名共 21 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/prop/jet_engines/a-m4-22a-1-tf/a-m4-22a-1-tf.txt:70`、`p6dof/p6dof_types/aircraft/b-fw/prop/jet_engines/b-h4-40w-1-tf/b-h4-40w-1-tf.txt:70`、`p6dof/p6dof_types/aircraft/b-hvy/prop/jet_engines/b-h3-81a-1-tf/b-h3-81a-1-tf.txt:70`）
- **片段**：

```text
         thrust_mil_alt_mach_table
            file data/thrust_mil_alt_mach.txt
         end_thrust_mil_alt_mach_table
```

- **演示要点**：演示 thrust_mil_alt_mach_table 的参数：file

### thrust_vs_time_sealevel（orbiter-booster-rkt_data）｜

- **关键词**：thrust_vs_time_sealevel
- **出处**：`six_dof/six_dof_types/spacecraft/orbiter-booster/prop/solid_propellant_rockets/orbiter-booster-rkt/orbiter-booster-rkt_data.txt:26-31`　（同签名共 25 处，另见 `p6dof/p6dof_types/misc/srb-rato/prop/solid_propellant_rockets/aim-sr-1-rkt/aim-sr-1-rkt.txt:27`、`p6dof/p6dof_types/misc/srb-rato/prop/solid_propellant_rockets/rato-rkt/rato-rkt.txt:27`、`p6dof/p6dof_types/weapons/aam-mr/prop/solid_propellant_rockets/aim-mr-1-rkt/aim-mr-1-rkt.txt:27`）
- **片段**：

```text
   thrust_vs_time_sealevel
      // time    thrust_lbs
           0.000           0.000
           0.100      200000.000
           100.0       80000.000
   end_thrust_vs_time_sealevel
```

- **演示要点**：演示 thrust_vs_time_sealevel（最小结构，无子参数）

### thrust_vs_time_vacuum（Generic_ICBM_RocketEngines）｜

- **关键词**：thrust_vs_time_vacuum
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/Generic_ICBM_RocketEngines.txt:135-142`　（同签名共 3 处，另见 `p6dof/p6dof_types/weapons/simple-icbm/Generic_ICBM_RocketEngines.txt:159`、`p6dof/p6dof_types/weapons/simple-icbm/Generic_ICBM_RocketEngines.txt:183`）
- **片段**：

```text
      thrust_vs_time_vacuum
        #time    normalized_thrust
        0.00     0.0
        0.10     200.0
        3.0      200.0
        3.1      20.0
        3.2      1.0
      end_thrust_vs_time_vacuum
```

- **演示要点**：演示 thrust_vs_time_vacuum（最小结构，无子参数）

### vehicle（china_traffic）｜

- **关键词**：vehicle, fraction, mean_speed, sigma_speed
- **出处**：`traffic_demos/scenarios/china_traffic.txt:36-40`　（同签名共 21 处，另见 `traffic_demos/scenarios/china_traffic.txt:42`、`traffic_demos/scenarios/china_traffic.txt:48`、`traffic_demos/scenarios/korea_traffic.txt:78`）
- **片段**：

```text
      vehicle CAR
         fraction      0.75
         mean_speed   60 mi/h
         sigma_speed   5 mi/h
      end_vehicle
```

- **演示要点**：演示 vehicle 的参数：fraction, mean_speed, sigma_speed

### vertical_acceleration_rate_pid（helo_mover）｜

- **关键词**：vertical_acceleration_rate_pid, proportional_gain, integral_gain, derivative_gain, input_threshold
- **出处**：`hellfire/active_radar_hellfire/helo_mover.txt:109-114`　（同签名共 3 处，另见 `hellfire/laser_designation_via_dis/helo_mover.txt:114`、`hellfire/semiactive_laser_hellfire/helo_mover.txt:114`）
- **片段**：

```text
   vertical_acceleration_rate_pid
      proportional_gain 0.025
      integral_gain     0.001
      derivative_gain   2.00
      input_threshold   0.0
   end_vertical_acceleration_rate_pid
```

- **演示要点**：演示 vertical_acceleration_rate_pid 的参数：proportional_gain, integral_gain, derivative_gain, input_threshold

### vertical_acceleration_value_pid（helo_mover）｜

- **关键词**：vertical_acceleration_value_pid, proportional_gain, integral_gain, derivative_gain, input_threshold
- **出处**：`hellfire/active_radar_hellfire/helo_mover.txt:116-121`　（同签名共 3 处，另见 `hellfire/laser_designation_via_dis/helo_mover.txt:121`、`hellfire/semiactive_laser_hellfire/helo_mover.txt:121`）
- **片段**：

```text
   vertical_acceleration_value_pid
      proportional_gain 0.025
      integral_gain     0.000
      derivative_gain   12.00
      input_threshold   0.0
   end_vertical_acceleration_value_pid
```

- **演示要点**：演示 vertical_acceleration_value_pid 的参数：proportional_gain, integral_gain, derivative_gain, input_threshold
