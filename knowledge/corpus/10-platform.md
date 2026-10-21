# 平台与部署

> **来源**：AFSIM 2.9.0 官方 demo 集（`demos/`，4,751 个 `.txt`，132 万行）
> **性质**：原文摘抄，未改写。同一「参数签名」只保留 1 条代表，并注明出现次数与另见位置
> **警示**：片段中数值为 demo 原值，**仅供语法参考，不得直接复用**；依赖 `common/` 数据表的片段须另行提供
> **检索**：按命令 / 类型名 / 参数名搜本卷；总表见 `90-tokens.md`

### airbase（nevada_air_traffic）｜

- **关键词**：airbase, runway_length, runway_heading, departure_interval, aircraft, destination
- **出处**：`traffic_demos/scenarios/nevada_air_traffic.txt:94-102`　（同签名共 29 处，另见 `traffic_demos/scenarios/nevada_air_traffic.txt:126`、`traffic_demos/scenarios/nevada_air_traffic.txt:137`、`traffic_demos/scenarios/nevada_air_traffic.txt:148`）
- **片段**：

```text
  airbase RNO 39:29:56.800N 119:46:05.200W
    runway_length   11000 ft
    runway_heading  180

    departure_interval 50.0 min
    aircraft    B-707  1.0
    destination LAS 1.0

  end_airbase
```

- **演示要点**：演示 airbase 的参数：runway_length, runway_heading, departure_interval, aircraft, destination

### airbase（nevada_air_traffic）｜

- **关键词**：airbase, runway, departure_interval, aircraft, destination, deactivation_time
- **出处**：`traffic_demos/scenarios/nevada_air_traffic.txt:70-91`
- **片段**：

```text
  airbase LAS 36:04:49.300N 115:09:08.400W
    runway # 7L-25R
      36:04.58200N 115:10.21140W
      36:04.58440N 115:07.26597W

    departure_interval 5 min

    aircraft    B-737  0.5
    aircraft    B-707  0.5

    destination PHX 0.20
    destination LAX 0.20
    destination SAN 0.1
    destination SEA 0.1
    destination SFO 0.1
    destination RNO 0.1
    destination PDX 0.1
    destination DEN 0.1

    deactivation_time 210 min

  end_airbase
```

- **演示要点**：演示 airbase 的参数：runway, departure_interval, aircraft, destination, deactivation_time

### airbase（china_air_traffic）｜

- **关键词**：airbase, runway, aircraft, departure_interval, destination
- **出处**：`traffic_demos/scenarios/china_air_traffic.txt:244-253`
- **片段**：

```text
  airbase RCTP 25.073081N 121.215572E
    runway 25.073081N 121.215572E 25.094647N 121.243133E
  #  runway_length 3660 m
  #  runway_heading 049.0
    aircraft B-747 .5
    aircraft B-757 .25
    aircraft B-737 .25
    departure_interval 45 min
    destination VHHH 1
   end_airbase
```

- **演示要点**：演示 airbase 的参数：runway, aircraft, departure_interval, destination

### airbase（china_air_traffic）｜

- **关键词**：airbase, runway_length, runway_heading, aircraft
- **出处**：`traffic_demos/scenarios/china_air_traffic.txt:41-47`
- **片段**：

```text
  airbase ZGGG 23.376822N 113.283497E
    runway_length 3600 m
    runway_heading 14.0
    aircraft B-747 .5
    aircraft B-757 .25
    aircraft B-737 .25
  end_airbase
```

- **演示要点**：演示 airbase 的参数：runway_length, runway_heading, aircraft

### airbase（china_airports）｜

- **关键词**：airbase, runway_length, runway_heading
- **出处**：`traffic_demos/scenarios/china_airports.txt:51-54`　（同签名共 64 处，另见 `traffic_demos/scenarios/china_airports.txt:57`、`traffic_demos/scenarios/china_airports.txt:63`、`traffic_demos/scenarios/china_airports.txt:69`）
- **片段**：

```text
  airbase ZGGG 23.376822N 113.283497E
    runway_length 3600 m
    runway_heading 14.0
  end_airbase
```

- **演示要点**：演示 airbase 的参数：runway_length, runway_heading

### airbase（china_airports）｜

- **关键词**：airbase, runway
- **出处**：`traffic_demos/scenarios/china_airports.txt:44-48`　（同签名共 5 处，另见 `traffic_demos/scenarios/china_airports.txt:329`、`traffic_demos/scenarios/nevada_air_traffic.txt:105`、`traffic_demos/scenarios/nevada_air_traffic.txt:112`）
- **片段**：

```text
  airbase ZBHH 40:50:41.22N 111:48:15.26E
    runway 40:50:41.22N 111:48:15.26E 40.854411N 40.854411E
  # runway_length 3600 m
  # runway_heading 72.7
  end_airbase
```

- **演示要点**：演示 airbase 的参数：runway

### aircraft_type（china_airports）｜

- **关键词**：aircraft_type, minimum_cruise_altitude, maximum_cruise_altitude, mean_cruise_speed, sigma_cruise_speed, minimum_runway_length, maximum_operating_range
- **出处**：`traffic_demos/scenarios/china_airports.txt:15-22`　（同签名共 12 处，另见 `traffic_demos/scenarios/china_airports.txt:24`、`traffic_demos/scenarios/china_airports.txt:33`、`traffic_demos/scenarios/china_air_traffic.txt:11`）
- **片段**：

```text
  aircraft_type B-737
    minimum_cruise_altitude 20000 ft
    maximum_cruise_altitude 30000 ft
    mean_cruise_speed         480 kts
    sigma_cruise_speed         40 kts
    minimum_runway_length    8000 ft
    maximum_operating_range  2000 nm
  end_aircraft_type
```

- **演示要点**：演示 aircraft_type 的参数：minimum_cruise_altitude, maximum_cruise_altitude, mean_cruise_speed, sigma_cruise_speed, minimum_runway_length, maximum_operating_range

### alternate_locations（red_air_strike）｜

- **关键词**：alternate_locations, location, debug
- **出处**：`alternate_locations/scenarios/red_air_strike.txt:39-44`
- **片段**：

```text
  alternate_locations reference uav-1
     location 30:18:42.17n 78:48:39.59w altitude 35000.00 ft heading 90 deg
     location 30:25n   78:55w altitude 35000 ft heading 585 deg
     location 30:30n   79:15w altitude 35000 ft heading 270 deg
     debug on
  end_alternate_locations
```

- **演示要点**：演示 alternate_locations 的参数：location, debug

### alternate_locations（target_list）｜

- **关键词**：alternate_locations, offset_ara
- **出处**：`alternate_locations/scenarios/target_list.txt:15-17`　（同签名共 2 处，另见 `alternate_locations/scenarios/target_list.txt:25`）
- **片段**：

```text
  alternate_locations reference sam-1
     offset_ara 0 deg 11 nm altitude 0 m
  end_alternate_locations
```

- **演示要点**：演示 alternate_locations 的参数：offset_ara

### alternate_locations（target_list）｜

- **关键词**：alternate_locations, offset_lla
- **出处**：`alternate_locations/scenarios/target_list.txt:35-37`　（同签名共 2 处，另见 `alternate_locations/scenarios/target_list.txt:45`）
- **片段**：

```text
   alternate_locations
     offset_lla 0:00n 0:15w altitude 0 m heading 0 deg reference sam-1
  end_alternate_locations
```

- **演示要点**：演示 alternate_locations 的参数：offset_lla

### alternate_locations（red_air_strike）｜

- **关键词**：alternate_locations, location
- **出处**：`alternate_locations/scenarios/red_air_strike.txt:18-22`　（同签名共 4 处，另见 `alternate_locations/scenarios/red_air_strike.txt:58`、`alternate_locations/scenarios/red_air_strike.txt:75`、`alternate_locations/scenarios/blue_sams.txt:22`）
- **片段**：

```text
  alternate_locations 
     location 30:30:00n   79:00:00w  altitude 35000 ft heading  90 deg # [1] diamond formation
     location 30:35:00n   79:00:00w  altitude 35000 ft heading 235 deg # [2] stepped formation
     location 30:20:00n   79:30:00w  altitude 35000 ft heading 270 deg # [3] V formation
  end_alternate_locations
```

- **演示要点**：演示 alternate_locations 的参数：location

### aux_data（osm_roadnetwork）｜辅助数据

- **关键词**：aux_data, bool, string, unitary, 辅助数据
- **出处**：`traffic_demos/roads/osm_roadnetwork.txt:53-57`　（同签名共 2 处，另见 `traffic_demos/roads/osm_roadnetwork.txt:290`）
- **片段**：

```text
      aux_data
         bool oneway = false
         string highway = "residential"
         unitary maxspeed = 35 mph
      end_aux_data
```

- **演示要点**：演示 aux_data 的参数：bool, string, unitary

### aux_data（osm_roadnetwork）｜辅助数据

- **关键词**：aux_data, string, unitary, 辅助数据
- **出处**：`traffic_demos/roads/osm_roadnetwork.txt:22-25`　（同签名共 6 处，另见 `traffic_demos/roads/osm_roadnetwork.txt:67`、`traffic_demos/roads/osm_roadnetwork.txt:120`、`traffic_demos/roads/osm_roadnetwork.txt:136`）
- **片段**：

```text
      aux_data
         string highway = "residential"
         unitary maxspeed = 35 mph
      end_aux_data
```

- **演示要点**：演示 aux_data 的参数：string, unitary

### aux_data（ew_radar）｜辅助数据

- **关键词**：aux_data, double, 辅助数据
- **出处**：`aea_iads/platforms/ew_radar.txt:34-36`　（同签名共 44 处，另见 `alternate_locations/weapons/agm/blue_glide_bomb_1.txt:63`、`alternate_locations/weapons/agm/blue_gps_bomb_1.txt:94`、`cyber/exfiltrate_demo/platforms/acq_radar.txt:27`）
- **片段**：

```text
  aux_data
     double max_range = 185200 # meters = 100 nm
  end_aux_data
```

- **演示要点**：演示 aux_data 的参数：double

### aux_data（brawler_test）｜辅助数据

- **关键词**：aux_data, bool, 辅助数据
- **出处**：`air_to_air/platforms/brawler_test.txt:66-68`　（同签名共 10 处，另见 `air_to_air/platforms/brawler_test.txt:289`、`hel/hel_test.txt:157`、`hel/hel_test.txt:239`）
- **片段**：

```text
   aux_data 
      bool captured = false // set to true if captured which is brawler lingo meaning landed at a base
   end_aux_data
```

- **演示要点**：演示 aux_data 的参数：bool

### aux_data（output_file_demo）｜辅助数据

- **关键词**：aux_data, string, 辅助数据
- **出处**：`example_scripts/output_file_demo.txt:100-102`　（同签名共 6 处，另见 `example_scripts/output_file_demo.txt:116`、`example_scripts/output_file_demo.txt:132`、`iads_c2_demos/platforms/ucav.txt:28`）
- **片段**：

```text
   aux_data
      string outputFileName = "PixelCountSide.out"
   end_aux_data
```

- **演示要点**：演示 aux_data 的参数：string

### aux_data（starlink_autogen）｜辅助数据

- **关键词**：aux_data, int, 辅助数据
- **出处**：`space_operations/scenarios/starlink_autogen.txt:20-22`　（同签名共 288 处，另见 `space_operations/scenarios/starlink_autogen.txt:54`、`space_operations/scenarios/starlink_autogen.txt:88`、`space_operations/scenarios/starlink_autogen.txt:122`）
- **片段**：

```text
   aux_data
      int plane = 0
   end_aux_data
```

- **演示要点**：演示 aux_data 的参数：int

### aux_data（sensors_manager_fov）｜辅助数据

- **关键词**：aux_data, unitary, 辅助数据
- **出处**：`iads_c2_demos/sensors_manager_fov.txt:57-61`
- **片段**：

```text
   aux_data
      unitary RESTING_AZIMUTH = 0.0 deg
      unitary COARSE_SLEW_RATE_AZIMUTH = 10.0 deg/sec
      unitary FINE_SLEW_RATE_AZIMUTH = 1.0 deg/sec
   end_aux_data
```

- **演示要点**：演示 aux_data 的参数：unitary

### aux_data（assignment_priority）｜辅助数据

- **关键词**：aux_data, 辅助数据
- **出处**：`iads_c2_demos/assignment_priority.txt:104-106`　（同签名共 6 处，另见 `iads_c2_demos/assignment_priority.txt:128`、`iads_c2_demos/assignment_priority.txt:146`、`iads_c2_demos/assignment_priority.txt:159`）
- **片段**：

```text
   aux_data
      WsfBMAuxDataZoneAttachment iads_c2_zones
   end_aux_data
```

- **演示要点**：演示 aux_data（最小结构，无子参数）

### convoy（korea_traffic）｜

- **关键词**：convoy, start_position, spacing, speed, vehicle
- **出处**：`traffic_demos/scenarios/korea_traffic.txt:97-111`
- **片段**：

```text
      convoy
         start_position  37:30n 127:00e
         end_position    37:51n 127:42e
         spacing         1000 ft
         speed           50 mi/h

         // If you uncomment use_closest_waypoint the vehicles will snap
         // the closest point on the road.
         // use_closest_waypoint

         // You can specify as many vehicle types here as you want,
         // just create multiple vehicle/end_vehicle blocks for each.
         vehicle 5 PICKUP_TRUCK  end_vehicle
         vehicle 5 CAR  end_vehicle
      end_convoy
```

- **演示要点**：演示 convoy 的参数：start_position, spacing, speed, vehicle

### formation（basic_formation）｜

- **关键词**：formation, lead, unit
- **出处**：`p6dof/basic_formation.txt:71-82`　（同签名共 2 处，另见 `p6dof/formation_tanking.txt:74`）
- **片段**：

```text
formation tango
   # 'alpha' is the lead unit in the formation 'tango'.
   lead unit one
      member_platform alpha
   end_unit

   # 'beta' is the wingman in the formation 'tango'.
   unit two
      member_platform beta
      offset 20 m 135.0 deg 0 m welded_wing
   end_unit
end_formation
```

- **演示要点**：演示 formation 的参数：lead, unit

### formation（formation_tanking）｜

- **关键词**：formation, lead
- **出处**：`p6dof/formation_tanking.txt:122-126`
- **片段**：

```text
formation foxtrot
   lead unit one
      member_platform lambda
   end_unit
end_formation
```

- **演示要点**：演示 formation 的参数：lead

### group · WSF_GROUP｜编组

- **关键词**：group, WSF_GROUP, 编组
- **出处**：`space_operations/comms/crosslink.txt:12-13`　（同签名共 7 处，另见 `space_operations/comms/downlink.txt:12`、`space_operations/comms/uplink.txt:12`、`space_operations/platforms/starlink.txt:18`）
- **片段**：

```text
group CROSSLINK WSF_GROUP 
end_group
```

- **演示要点**：演示 WSF_GROUP（最小结构，无子参数）

### lane（west_coast_sea_traffic）｜

- **关键词**：lane, port, lane_route
- **出处**：`traffic_demos/scenarios/west_coast_sea_traffic.txt:92-99`　（同签名共 3 处，另见 `traffic_demos/scenarios/west_coast_sea_traffic.txt:101`、`traffic_demos/scenarios/west_coast_sea_traffic.txt:112`）
- **片段**：

```text
   lane lane-seattle-to-british-columbia
      port port-seattle
      port port-british-columbia

      lane_route
         position 50:00:00n 129:00:00w 50 km
      end_lane_route
   end_lane
```

- **演示要点**：演示 lane 的参数：port, lane_route

### lane_route（west_coast_sea_traffic）｜

- **关键词**：lane_route, position
- **出处**：`traffic_demos/scenarios/west_coast_sea_traffic.txt:96-98`　（同签名共 3 处，另见 `traffic_demos/scenarios/west_coast_sea_traffic.txt:105`、`traffic_demos/scenarios/west_coast_sea_traffic.txt:116`）
- **片段**：

```text
      lane_route
         position 50:00:00n 129:00:00w 50 km
      end_lane_route
```

- **演示要点**：演示 lane_route 的参数：position

### location（terrain_config）｜

- **关键词**：location, lat, lon, alt_ft
- **出处**：`air_to_air/six_dof_types/environment/terrain_config.txt:15-20`　（同签名共 20 处，另见 `air_to_air/six_dof_types/environment/terrain_config.txt:22`、`air_to_air/six_dof_types/environment/terrain_config.txt:29`、`air_to_air/six_dof_types/environment/terrain_config.txt:36`）
- **片段**：

```text
      location
         # Honolulu Intl, PHNL
         lat    21.3178275
         lon  -157.92026310
         alt_ft  5.0
      end_location
```

- **演示要点**：演示 location 的参数：lat, lon, alt_ft

### path（fpa-path）｜

- **关键词**：path, position
- **出处**：`sensor_plot/radar/fpa-path.txt:30-36`
- **片段**：

```text
   path
      position 1.0n 0e altitude 30000 ft
      position 0.8n 0e
      position 0.6n 0e
      position 0.4n 0e
      position 0.2n 0e
   end_path
```

- **演示要点**：演示 path 的参数：position

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, icon, side, indestructible, infrared_signature, optical_signature, radar_signature, include, commander, command_chain, heading, position, add, 平台实例
- **出处**：`air_to_air/scenarios/escort.txt:37-176`
- **片段**：

```text
platform bomber1 WSF_PLATFORM
   icon b-1
   side blue
   indestructible 
#  draw_nominal_states

   infrared_signature SIMPLE_BOMBER_INFRARED_SIGNATURE
   optical_signature  SIMPLE_BOMBER_OPTICAL_SIGNATURE
   radar_signature    SIMPLE_BOMBER_RADAR_SIGNATURE

   # define global script variables attached to this platform type - these are used in the EZJA behavior tree
   include rules/ezja_script_variables.txt

   commander blue_1
   command_chain BOMBER blue_1
   
   heading 90 deg
   position 00:02:50.00n 02:10:00.00w  altitude 30000.00 ft

   add sensor rdr1 aesa 
      on 
      internal_link data_mgr
   end_sensor

   add processor data_mgr WSF_TRACK_PROCESSOR
      master_track_processor 
      purge_interval  60 sec
      report_interval 10.0 sec 
      unchanged_track_reporting false
      circular_report_rejection enable
      # report_raw_tracks 
      internal_link tsk_mgr
      report_fused_tracks
      report_to commander via    datalink
      report_to subordinates via datalink
      report_to peers via        datalink
   end_processor

   track_manager 
      fusion_method weighted_average
      end_fusion_method
   end_track_manager
   
   add processor tsk_mgr WSF_TASK_PROCESSOR 
      on
      internal_link data_mgr
   end_processor

   add mover WSF_AIR_MOVER end_mover
   route 
      position 00:00:00.00n 01:30:00.00w  altitude 30000.0 ft  
      speed 850 ft/s
      position 00:00:00.00n 02:50:00.00e  altitude 30000.0 ft
   end_route

   // Give it a weapon to shoot at a ground target
   // Note: this weapon was intended for air targets and usually doesn't hit the ground target
   add weapon agm MEDIUM_RANGE_RADAR_MISSILE 
      quantity 2
   end_weapon

   add processor limited_assessment WSF_SA_PROCESSOR 
      on
      update_interval 1.0 sec

      # Flight Information
      flight_id  10
      id_flag    B

      # Data collection rates
      report_interval               1.00 sec
      flight_data_update_interval   1.00 sec
      fuel_data_update_interval    10.00 sec
      nav_data_update_interval     10.00 sec
      asset_data_update_interval    3.00 sec      
      
      enemy_side       red
      enemy_type       RED_STRIKER
      friendly_type    BLUE_STRIKER
      
      max_range_for_perceived_assets              150 nm
      max_range_for_perceived_bogies_and_bandits  150 nm
      max_range_for_engagement_data                 0 nm
      assumed_range_for_angle_only_targets        150 nm      
      
      // Set filters to result in the fewest items for engagement data
      filter_requires_not_same_side          true
      filter_requires_not_air_domain         true
      filter_requires_not_subsurface_domain  true
      filter_requires_not_space_domain       true
      filter_requires_sa_processor           true
      
      report_to commander    via datalink
      report_to peers        via datalink
      report_to subordinates via datalink

      # Assets/friends settings
      asset_perception  truth commander:peers:subordinates
      perceive_self     false
      reporting_self    true
      reporting_others  true
      max_asset_load    100

      # Bogie and bandit/threat settings
      max_threat_load   12
      
      # Expendable countermeasures
      use_simple_countermeasures true
      num_chaff                  120
      num_flares                  80
      num_decoys                  20  
      
   end_processor

   add comm datalink WSF_COMM_TRANSCEIVER
      propagation_speed 0 m/s   #instantaneous propogation (faster than speed of light)
      network_name brawler_net
      internal_link data_mgr
      internal_link tsk_mgr
      internal_link limited_assessment
   end_comm

   execute at_interval_of 5 s 
      foreach (WsfLocalTrack ltrk in PLATFORM.MasterTrackList())
      {
         if (ltrk.IsValid() && ltrk.Target().IsValid() && ltrk.TargetName() == "ground_target")
         {
            if ( PLATFORM.SlantRangeTo(ltrk) < 20.0 *MATH.M_PER_NM() 
            && PLATFORM.Weapon("agm").QuantityRemaining() > 0 )
            {
               PLATFORM.Weapon("agm").FireSalvo(ltrk,2);
            }
            if (PLATFORM.Weapon("agm").QuantityRemaining() == 0)
            {
               PLATFORM.TurnToHeading(270);
            }
         }
      }
   end_execute
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, indestructible, infrared_signature, optical_signature, radar_signature, include, commander, command_chain, heading

### platform（2v2_six_dof）｜平台实例

- **关键词**：platform, indestructible, side, commander, command_chain, six_dof_set_velocity_ned_fps, six_dof_position, six_dof_alt, six_dof_ned_heading, script_variables, edit, 平台实例
- **出处**：`air_to_air/scenarios/2v2_six_dof.txt:22-53`　（同签名共 2 处，另见 `air_to_air/scenarios/2v2_six_dof.txt:55`）
- **片段**：

```text
platform blue_1 BLUE_FIGHTER_PM6 
   indestructible 
   side blue 
   commander SELF
   command_chain IFLITE  SELF
   command_chain ELEMENT SELF

   six_dof_set_velocity_ned_fps 0 900 0
   six_dof_position 0.0833 -1.167
   six_dof_alt 30000 ft
   six_dof_ned_heading 90 deg
   
   script_variables
      START_TYPE = "route";
      RISK_WPN = 0.0;
      MISSION_TYPE = "SWEEP";
      ENG_TGT = "";
      RPEAK_LOC ={1.0,0.8,0.95,1.0,1.0};
      ROUTE.Append("blue_route");
      WINCHESTER = {-1,-1,-1,-1,-1};
   end_script_variables
   
   edit processor assessment
      enemy_side    red
      enemy_type    RED_FIGHTER
      friendly_type BLUE_FIGHTER
      flight_id     1
      id_flag       1
      mission_task  SWEEP 
   end_processor   
 
end_platform
```

- **演示要点**：演示 platform 的参数：indestructible, side, commander, command_chain, six_dof_set_velocity_ned_fps, six_dof_position, six_dof_alt, six_dof_ned_heading, script_variables, edit

### platform（bomb_demo_laydown）｜平台实例

- **关键词**：platform, side, creation_time, route, position, sensor, on, zone, minimum_altitude, maximum_altitude, polygonal, 平台实例
- **出处**：`suppressor/bomb_demo_laydown.txt:181-228`
- **片段**：

```text
platform 11_bomber BOMBER
  side blue
  creation_time 0.5 sec
  route
    position 33:35:03.6n  34:55:14.2e  altitude 1200 m agl
      speed 235 m/s
      radial_acceleration 1.13 g
    position 33:35:16.3n  35:27:37.0e  altitude 1200 m agl
      speed 235 m/s
      radial_acceleration 1.13 g
    position 33:38:02.2n  35:53:31.2e  altitude 1200 m agl
      speed 235 m/s
      radial_acceleration 1.13 g
    position 33:35:20.5n  36:00:00.0e  altitude 1200 m agl
      speed 235 m/s
      radial_acceleration 1.13 g
    position 33:35:07.2n  36:09:42.9e  altitude 1200 m agl
      speed 235 m/s
      radial_acceleration 1.13 g
    position 33:35:06.9n  36:12:57.2e  altitude 2200 m agl
      speed 235 m/s
      radial_acceleration 1.13 g
    position 33:38:08.7n  35:53:31.2e  altitude 1200 m agl
      speed 235 m/s
      radial_acceleration 1.13 g
    position 33:35:10.1n  34:55:14.1e  altitude 1200 m agl
      speed 235 m/s
      radial_acceleration 1.13 g
      stop
  end_route

  sensor bomber_radar
    on
  end_sensor

  zone target_area
    minimum_altitude    -5 m
    maximum_altitude     5 m

    polygonal
      lat_lon
      point  33:35:23.2n  36:11:39.4e
      point  33:34:18.4n  36:11:39.4e
      point  33:34:18.4n  36:14:14.9e
      point  33:35:23.2n  36:14:14.9e
  end_zone

end_platform
```

- **演示要点**：演示 platform 的参数：side, creation_time, route, position, sensor, on, zone, minimum_altitude, maximum_altitude, polygonal

### platform（cvbg_mrc_lrc）｜平台实例

- **关键词**：platform, side, icon, processor, position, heading, zone, circular, maximum_radius, start_angle, stop_angle, 平台实例
- **出处**：`outer_air_battle/scenarios/cvbg_mrc_lrc.txt:9-77`
- **片段**：

```text
platform cv_1 CVN
  side blue
  icon Carrier

   processor task_mgr
      script_variables
         ERC->num    = 6;
         ERC->type   = "BLUE_MULTIROLE_FIGHTER_2_MRC";
         ERC->prefix = "lrc-";
      end_script_variables
   end_processor

  position 00:00:00.00n 30:00:00.00w
  heading 90 deg
  zone circle_zone_5190
    circular
    maximum_radius 100.00 nm
#    start_angle 315.00 deg
#    stop_angle 45.00 deg
  end_zone
  zone circle_zone_52115
    circular
    maximum_radius 150.00 nm
    start_angle 315.00 deg
    stop_angle 45.00 deg
  end_zone
  zone circle_zone_52120
    circular
    maximum_radius 200.00 nm
    start_angle 315.00 deg
    stop_angle 45.00 deg
  end_zone
  zone circle_zone_52125
    circular
    maximum_radius 250.00 nm
    start_angle 315.00 deg
    stop_angle 45.00 deg
  end_zone
  zone circle_zone_52130
    circular
    maximum_radius 300.00 nm
    start_angle 315.00 deg
    stop_angle 45.00 deg
  end_zone
  zone circle_zone_52135
    circular
    maximum_radius 350.00 nm
    start_angle 315.00 deg
    stop_angle 45.00 deg
  end_zone
  zone circle_zone_52140
    circular
    maximum_radius 400.00 nm
    start_angle 315.00 deg
    stop_angle 45.00 deg
  end_zone
  zone circle_zone_52145
    circular
    maximum_radius 450.00 nm
    start_angle 315.00 deg
    stop_angle 45.00 deg
  end_zone
  zone circle_zone_52150
    circular
    maximum_radius 500.00 nm
    start_angle 315.00 deg
    stop_angle 45.00 deg
  end_zone
end_platform
```

- **演示要点**：演示 platform 的参数：side, icon, processor, position, heading, zone, circular, maximum_radius, start_angle, stop_angle

### platform（hvaa_dca）｜平台实例

- **关键词**：platform, icon, side, commander, command_chain, heading, position, script_variables, edit, delete, add, 平台实例
- **出处**：`air_to_air/scenarios/hvaa_dca.txt:25-114`
- **片段**：

```text
platform hvaa1 HVAA
   icon awacs
   side blue
#  draw_nominal_states   
   commander SELF
   command_chain IFLITE SELF
   command_chain ELEMENT SELF   
   heading 180 deg
   position 00:02:50.00n 02:10:00.00w  altitude 30000.00 ft

   script_variables
      START_TYPE = "orbit";
      WINCHESTER = {-1,-1,-1,-1,-1}; // don't ever hit winchester
      COMMIT_RNG = 1; // ensures they don't ever commit on anyone
      I_SUPPORT = 0;
   end_script_variables
   
   edit weapon fox3 quantity 0 end_weapon
   edit weapon fox2 quantity 0 end_weapon
   edit weapon fox1 quantity 0 end_weapon
   
   delete processor assessment 
   add processor CAP WSF_SA_PROCESSOR
      on 
      update_interval 1 sec
      flight_id       10
      id_flag         A
      
      # Data collection rates
      report_interval                              1.00 sec
      flight_data_update_interval                  1.00 sec
      track_data_update_interval                   3.00 sec
      asset_data_update_interval                   3.00 sec
      asset_data_update_interval                   3.00 sec
      perceived_item_data_update_interval          3.00 sec
      prioritized_item_data_update_interval        3.00 sec      
      perceived_item_calculation_update_interval   3.00 sec
      prioritized_item_calculation_update_interval 3.00 sec    
          
      enemy_side       red
      enemy_type       RED_STRIKER
      friendly_type    BLUE_STRIKER

      max_range_for_perceived_assets              350 nm
      max_range_for_perceived_bogies_and_bandits  350 nm
      max_range_for_engagement_data                 0 nm
      assumed_range_for_angle_only_targets        350 nm      
      
      #filter_requires_same_side
      #filter_requires_not_same_side          true
      filter_requires_air_domain              true
      #filter_requires_not_air_domain         true
      #filter_requires_land_or_surface_domain true
      #filter_requires_not_subsurface_domain  true
      #filter_requires_not_space_domain       true
      filter_requires_sa_processor            true

      report_to commander    via datalink2
      report_to peers        via datalink2
      report_to subordinates via datalink2
      
      # Assets/friends settings
      asset_perception  truth commander:peers:subordinates
      perceive_self     false
      reporting_self    true
      reporting_others  true
      max_asset_load    100

      # Bogie and bandit/threat settings
      max_threat_load   100      

      script_variables 
         rule_type = "orbit";
      end_script_variables
      advanced_behavior_tree 
         behavior_node orbit_rules 
      end_advanced_behavior_tree
   end_processor
   
   edit comm datalink
      internal_link CAP
   end_comm
   
   add comm datalink2 WSF_COMM_TRANSCEIVER
      propagation_speed 0 m/s   #instantaneous propogation (faster than speed of light)
      network_name brawler_net
      internal_link CAP
   end_comm
     
end_platform
```

- **演示要点**：演示 platform 的参数：icon, side, commander, command_chain, heading, position, script_variables, edit, delete, add

### platform（bombers）｜平台实例

- **关键词**：platform, side, icon, heading, creation_time, route, position, speed, pause_time, track, 平台实例
- **出处**：`outer_air_battle/scenarios/bombers.txt:26-39`
- **片段**：

```text
platform bomber-1a BOMBER
  side red
  icon bomber
  heading 000 deg
  creation_time 30 minutes
  route
    position 10:20:29.55n 12:40:30.75w altitude 40000.00 ft
    speed 400 kts
    pause_time 30 minutes
    position 00:00:00.00n 30:00:00.00w altitude 40000.00 ft
  end_route

  track platform cv_1 end_track
end_platform
```

- **演示要点**：演示 platform 的参数：side, icon, heading, creation_time, route, position, speed, pause_time, track

### platform（simple_icbm_test）｜平台实例

- **关键词**：platform, icon, update_interval, side, p6dof_position, p6dof_alt, p6dof_ned_heading, p6dof_ned_pitch, p6dof_ned_roll, p6dof_set_velocity_ned_fps, 平台实例
- **出处**：`p6dof/simple_icbm_test.txt:30-43`
- **片段**：

```text
platform simple-icbm ICBM_PLATFORM
   icon scud_missile
   update_interval 0.01 sec
   side blue

   p6dof_position      48.5538  -98.3805
   p6dof_alt           100.0 ft

   p6dof_ned_heading   20 deg
   p6dof_ned_pitch     80 deg
   p6dof_ned_roll      0 deg

   p6dof_set_velocity_ned_fps  0 0 0
end_platform
```

- **演示要点**：演示 platform 的参数：icon, update_interval, side, p6dof_position, p6dof_alt, p6dof_ned_heading, p6dof_ned_pitch, p6dof_ned_roll, p6dof_set_velocity_ned_fps

### platform（iridium_ground）｜平台实例

- **关键词**：platform, side, position, commander, category, add, on, azimuth_field_of_view, elevation_field_of_view, transmitter, 平台实例
- **出处**：`satellite_demos/ground_networks/iridium_ground.txt:45-65`　（同签名共 10 处，另见 `satellite_demos/ground_networks/iridium_ground.txt:67`、`satellite_demos/ground_networks/iridium_ground.txt:89`、`satellite_demos/ground_networks/iridium_ground.txt:111`）
- **片段**：

```text
platform WAHIAWA IRIDIUM_GS
  side dark_purple
  position   21.519404n 157.995435w altitude 1.0 m agl
  commander SELF
  category ground_station
  add comm WAHIAWA WSF_RADIO_XMTR
   on

   azimuth_field_of_view                  -180.0 deg 180.0 deg
   elevation_field_of_view                   -90.0 deg  90.0 deg

   transmitter
      antenna_pattern                     UNIFORM_0DBI_PATTERN
      frequency                           29.2 ghz  # ref 1
      bandwidth                           195 mhz  # ref 1
      polarization                        right_circular  # ref 1
      power                               45 dbw
   end_transmitter

  end_comm
end_platform
```

- **演示要点**：演示 platform 的参数：side, position, commander, category, add, on, azimuth_field_of_view, elevation_field_of_view, transmitter

### platform（2v2_six_dof）｜平台实例

- **关键词**：platform, side, commander, command_chain, six_dof_set_velocity_ned_fps, six_dof_position, six_dof_alt, six_dof_ned_heading, script_variables, edit, 平台实例
- **出处**：`air_to_air/scenarios/2v2_six_dof.txt:88-119`　（同签名共 2 处，另见 `air_to_air/scenarios/2v2_six_dof.txt:121`）
- **片段**：

```text
platform red_1 RED_FIGHTER_PM6
   side red
   commander SELF
   command_chain IFLITE  SELF
   command_chain ELEMENT SELF
   
   six_dof_set_velocity_ned_fps 0 -900 0
   six_dof_position 0.0 1.167
   six_dof_alt 30000 ft
   six_dof_ned_heading -90 deg
   
   script_variables
      START_TYPE = "route";
      RISK_AVRS = 1.0;
      RISK_WPN = 1.0;
      DOR = 40*MATH.M_PER_NM();
      MISSION_TYPE = "SWEEP";
      ENG_TGT = "";
      RPEAK_LOC ={1.0,0.8,0.95,1.0,1.0};
      ROUTE.Append("red_route");
      WINCHESTER = {-1,-1,-1,-1,-1};
   end_script_variables
  
   edit processor assessment
      enemy_side    blue
      enemy_type    BLUE_FIGHTER
      friendly_type RED_FIGHTER
      flight_id     202
      id_flag       1
      mission_task  SWEEP 
   end_processor   
end_platform
```

- **演示要点**：演示 platform 的参数：side, commander, command_chain, six_dof_set_velocity_ned_fps, six_dof_position, six_dof_alt, six_dof_ned_heading, script_variables, edit

### platform（kinematic_mover_demo）｜平台实例

- **关键词**：platform, position, mover, route, label, speed, goto, heading, side, icon, 平台实例
- **出处**：`kinematic_mover/kinematic_mover_demo.txt:194-227`　（同签名共 2 处，另见 `kinematic_mover/kinematic_mover_demo.txt:152`）
- **片段**：

```text
platform flyer4 AIRFLYER  #uses the AIR_MOVER to show differences...
   position 34:00:05.33n 83:12:52.77w altitude 32808.40 ft

   mover
      maximum_linear_acceleration  1.4 g
      maximum_radial_acceleration 2.2 g
      turn_rate_limit           50 deg/sec
      update_interval 0.1 sec
   end_mover

   route
    label begin
    position 34:00:05.33n 83:12:52.77w altitude 32808.40 ft
    speed 200 kts
    position 33:59:41.20n 83:13:13.35w altitude 29527.56 ft
    speed 210 kts
    position 34:00:08.68n 83:13:48.07w altitude 25965.88 ft
    speed 180 kts
    position 34:01:59.96n 83:14:13.03w altitude 25685.04 ft
    speed 210 kts
    position 34:01:48.43n 83:15:27.17w altitude 23246.72 ft
    position 34:02:22.51n 83:14:31.62w altitude 24685.04 ft speed 300 kts
    position 34:02:19.52n 83:13:47.29w altitude 26246.72 ft
    speed 200 kts
    position 34:00:21.31n 83:13:33.54w altitude 22685.04 ft
    speed 210 kts
    position 34:02:32.03n 83:13:07.49w altitude 29685.04 ft
    speed 200 kts
    goto begin
  end_route
  heading 215 deg
  side blue
  icon F-18
end_platform
```

- **演示要点**：演示 platform 的参数：position, mover, route, label, speed, goto, heading, side, icon

### platform（bomb_demo_laydown）｜平台实例

- **关键词**：platform, side, route, position, sensor, on, zone, minimum_altitude, maximum_altitude, polygonal, 平台实例
- **出处**：`suppressor/bomb_demo_laydown.txt:133-179`
- **片段**：

```text
platform 10_bomber BOMBER
  side blue
  route
    position 33:35:06.9n  34:55:14.1e  altitude 1200 m agl
      speed 235 m/s
      radial_acceleration 1.13 g
    position 33:35:19.5n  35:27:37.0e  altitude 1200 m agl
      speed 235 m/s
      radial_acceleration 1.13 g
    position 33:38:05.4n  35:53:31.2e  altitude 1200 m agl
      speed 235 m/s
      radial_acceleration 1.13 g
    position 33:35:23.7n  36:00:00.0e  altitude 1200 m agl
      speed 235 m/s
      radial_acceleration 1.13 g
    position 33:35:39.5n  36:09:43.0e  altitude 1200 m agl
      speed 235 m/s
      radial_acceleration 1.13 g
    position 33:35:39.2n  36:12:57.3e  altitude 2200 m agl
      speed 235 m/s
      radial_acceleration 1.13 g
    position 33:38:05.4n  35:53:31.2e  altitude 1200 m agl
      speed 235 m/s
      radial_acceleration 1.13 g
    position 33:35:06.9n  34:55:14.1e  altitude 1200 m agl
      speed 235 m/s
      radial_acceleration 1.13 g
      stop
  end_route

  sensor bomber_radar
    on
  end_sensor

  zone target_area
    minimum_altitude    -5 m
    maximum_altitude     5 m

    polygonal
      lat_lon
      point  33:36:27.9n  36:11:39.4e
      point  33:35:23.2n  36:11:39.4e
      point  33:35:23.2n  36:14:14.9e
      point  33:36:27.9n  36:14:14.9e
  end_zone

end_platform
```

- **演示要点**：演示 platform 的参数：side, route, position, sensor, on, zone, minimum_altitude, maximum_altitude, polygonal

### platform（cvbg）｜平台实例

- **关键词**：platform, side, icon, position, heading, zone, circular, maximum_radius, start_angle, stop_angle, 平台实例
- **出处**：`outer_air_battle/scenarios/cvbg.txt:9-68`
- **片段**：

```text
platform cv_1 CVN
  side blue
  icon Carrier
  position 00:00:00.00n 30:00:00.00w
  heading 90 deg
  zone circle_zone_5190
    circular
    maximum_radius 100.00 nm
#    start_angle 315.00 deg
#    stop_angle 45.00 deg
  end_zone
  zone circle_zone_52115
    circular
    maximum_radius 150.00 nm
    start_angle 315.00 deg
    stop_angle 45.00 deg
  end_zone
  zone circle_zone_52120
    circular
    maximum_radius 200.00 nm
    start_angle 315.00 deg
    stop_angle 45.00 deg
  end_zone
  zone circle_zone_52125
    circular
    maximum_radius 250.00 nm
    start_angle 315.00 deg
    stop_angle 45.00 deg
  end_zone
  zone circle_zone_52130
    circular
    maximum_radius 300.00 nm
    start_angle 315.00 deg
    stop_angle 45.00 deg
  end_zone
  zone circle_zone_52135
    circular
    maximum_radius 350.00 nm
    start_angle 315.00 deg
    stop_angle 45.00 deg
  end_zone
  zone circle_zone_52140
    circular
    maximum_radius 400.00 nm
    start_angle 315.00 deg
    stop_angle 45.00 deg
  end_zone
  zone circle_zone_52145
    circular
    maximum_radius 450.00 nm
    start_angle 315.00 deg
    stop_angle 45.00 deg
  end_zone
  zone circle_zone_52150
    circular
    maximum_radius 500.00 nm
    start_angle 315.00 deg
    stop_angle 45.00 deg
  end_zone
end_platform
```

- **演示要点**：演示 platform 的参数：side, icon, position, heading, zone, circular, maximum_radius, start_angle, stop_angle

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, side, icon, category, spatial_domain, infrared_signature, optical_signature, radar_signature, position, 平台实例
- **出处**：`air_to_air/scenarios/escort.txt:339-350`
- **片段**：

```text
platform ground_target WSF_PLATFORM 
   side red
   icon bullseye
   category surface   
   spatial_domain surface
   
   infrared_signature SIMPLE_GROUND_TARGET_INFRARED_SIGNATURE
   optical_signature  SIMPLE_GROUND_TARGET_OPTICAL_SIGNATURE
   radar_signature    SIMPLE_GROUND_TARGET_RADAR_SIGNATURE

   position 00:00:00.00n 02:50:00.00e altitude 0.0 ft
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：side, icon, category, spatial_domain, infrared_signature, optical_signature, radar_signature, position

### platform（zero_length_launch）｜平台实例

- **关键词**：platform, update_interval, side, p6dof_position, p6dof_alt, p6dof_set_velocity_ned_fps, p6dof_ned_heading, p6dof_ned_pitch, p6dof_ned_roll, 平台实例
- **出处**：`p6dof/zero_length_launch.txt:38-49`
- **片段**：

```text
platform zell_launch_platform ZELL-LAUNCHER
   update_interval            0.01 sec
   side                       blue

   p6dof_position             21.301 -158.074

   p6dof_alt                  10.0 ft
   p6dof_set_velocity_ned_fps 0.0 0.0 0.0
   p6dof_ned_heading          200.0 deg
   p6dof_ned_pitch            0.0 deg
   p6dof_ned_roll             0.0 deg
end_platform
```

- **演示要点**：演示 platform 的参数：update_interval, side, p6dof_position, p6dof_alt, p6dof_set_velocity_ned_fps, p6dof_ned_heading, p6dof_ned_pitch, p6dof_ned_roll

### platform（pm6_zero_length_launch）｜平台实例

- **关键词**：platform, update_interval, side, six_dof_position, six_dof_alt, six_dof_set_velocity_ned_fps, six_dof_ned_heading, six_dof_ned_pitch, six_dof_ned_roll, 平台实例
- **出处**：`six_dof/pm6_zero_length_launch.txt:38-49`　（同签名共 2 处，另见 `six_dof/rb6_zero_length_launch.txt:38`）
- **片段**：

```text
platform zell_launch_platform ZELL-LAUNCHER_PM6
   update_interval              0.01 sec
   side                         blue

   six_dof_position             21.301 -158.074

   six_dof_alt                  30.0 ft
   six_dof_set_velocity_ned_fps 0.0 0.0 0.0
   six_dof_ned_heading          200.0 deg
   six_dof_ned_pitch            0.0 deg
   six_dof_ned_roll             0.0 deg
end_platform
```

- **演示要点**：演示 platform 的参数：update_interval, side, six_dof_position, six_dof_alt, six_dof_set_velocity_ned_fps, six_dof_ned_heading, six_dof_ned_pitch, six_dof_ned_roll

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, side, icon, category, heading, add, route, position, speed, 平台实例
- **出处**：`hel/ground_hel_vs_hypersonic.txt:182-194`
- **片段**：

```text
platform hypersonic-1 WSF_PLATFORM
  side blue
  icon wedge
  category HYPERSONIC
  heading 270 deg
  add mover WSF_AIR_MOVER
  end_mover
  route
    position 40:00:00.00n 86:47:55.98w altitude 100000.00 ft agl
    speed 3422 mph
    position 40:00:00.00n 88:38:32.52w altitude 100000.00 ft
  end_route
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：side, icon, category, heading, add, route, position, speed

### platform（bombers）｜平台实例

- **关键词**：platform, side, icon, heading, route, position, speed, pause_time, track, 平台实例
- **出处**：`outer_air_battle/scenarios/bombers.txt:12-24`
- **片段**：

```text
platform bomber-1 BOMBER
  side red
  icon bomber
  heading 000 deg
  route
    position 10:20:29.55n 12:40:30.75w altitude 40000.00 ft
    speed 400 kts
    pause_time 30 minutes
    position 00:00:00.00n 30:00:00.00w altitude 40000.00 ft
  end_route

  track platform cv_1 end_track
end_platform
```

- **演示要点**：演示 platform 的参数：side, icon, heading, route, position, speed, pause_time, track

### platform（false-target_command_center）｜平台实例

- **关键词**：platform, side, commander, route, position, altitude, heading, sensor, on, 平台实例
- **出处**：`electronic_warfare/false-target_command_center.txt:381-396`
- **片段**：

```text
platform ew-radar-site-1 EW_RADAR_SITE
  side red

  commander command_center

  route
    position 37:10:00n 115:53:24w
    altitude 100 ft
    heading 90 deg
  end_route

  sensor radar
    on
  end_sensor

end_platform
```

- **演示要点**：演示 platform 的参数：side, commander, route, position, altitude, heading, sensor, on

### platform（over_the_horizon_radar）｜平台实例

- **关键词**：platform, side, route, position, altitude, heading, sensor, on, processor, 平台实例
- **出处**：`space_operations/scenarios/over_the_horizon_radar.txt:106-122`
- **片段**：

```text
platform oth-radar-site-1 OTH_RADAR_SITE
  side red
  route
    position 56:45n 126:38w
    altitude 0 ft agl
    heading 180 deg
  end_route
  sensor radar-1
  on
  end_sensor
  processor track_manager
  on
  end_processor
  processor draw_processor
  on
  end_processor
end_platform
```

- **演示要点**：演示 platform 的参数：side, route, position, altitude, heading, sensor, on, processor

### platform（escort）｜平台实例

- **关键词**：platform, side, icon, commander, command_chain, position, heading, script_variables, edit, 平台实例
- **出处**：`air_to_air/scenarios/escort.txt:440-465`　（同签名共 12 处，另见 `air_to_air/scenarios/escort.txt:495`、`air_to_air/scenarios/escort.txt:412`、`air_to_air/scenarios/escort.txt:467`）
- **片段**：

```text
platform red_4 DCA
   side red
   icon su27
   commander red_1
   command_chain IFLITE red_3
   command_chain ELEMENT red_3

   position 00:10:00.00s 02:10:00.00e altitude 30000.00 ft
   heading 90 deg

   script_variables 
      home_base = WsfGeoPoint.Construct("00:00:00n 03:00:00.0e");
   end_script_variables

   script_variables
      START_TYPE = "orbit";
      ENG_TGT = "";
      ROUTE.Append("red_route");
   end_script_variables

   edit processor assessment
      flight_id   202
      id_flag     4
   end_processor

end_platform
```

- **演示要点**：演示 platform 的参数：side, icon, commander, command_chain, position, heading, script_variables, edit

### platform（iridium_handheld）｜平台实例

- **关键词**：platform, commander, side, icon, position, add, transmitter, receiver, edit, 平台实例
- **出处**：`satellite_demos/user_handhelds/iridium_handheld.txt:17-49`　（同签名共 2 处，另见 `satellite_demos/user_handhelds/iridium_handheld.txt:51`）
- **片段**：

```text
platform commander1 HANDHELD
  commander SELF
  side green
  icon cmd_post
  position 17:57:41.24n 20:28:25.87e

  add comm commander1 WSF_RADIO_TRANSCEIVER
     on
     network_name commander1

   transmitter
      antenna_pattern                     UNIFORM_0DBI_PATTERN
      frequency                           1621 mhz  # ref 1
      bandwidth                           10.5 mhz  # ref 1
      polarization                        right_circular  # ref 1
      power                               50 dbw
   end_transmitter

   receiver
      antenna_pattern                     UNIFORM_0DBI_PATTERN
      frequency                           1621 mhz  # ref 1
      bandwidth                           10.5 mhz  # ref 1
   end_receiver
  end_comm

  add processor linker DYNAMIC_LINKING_PROC
  end_processor

  edit sensor detect
     internal_link linker
  end_sensor

end_platform
```

- **演示要点**：演示 platform 的参数：commander, side, icon, position, add, transmitter, receiver, edit

### platform（2v2_air_movers）｜平台实例

- **关键词**：platform, indestructible, side, commander, command_chain, heading, route, script_variables, edit, 平台实例
- **出处**：`air_to_air/scenarios/2v2_air_movers.txt:22-55`　（同签名共 2 处，另见 `air_to_air/scenarios/2v2_air_movers.txt:57`）
- **片段**：

```text
platform blue_1 BLUE_FIGHTER_AIR 
   indestructible 
   side blue 
   commander SELF
   command_chain IFLITE  SELF
   command_chain ELEMENT SELF
   heading 90 deg
   
   route
      position 00:05:00.00n  01:10:00.00w  altitude 30000 ft
      position 00:00:36.035n 01:47:21.156e altitude 30000 ft msl speed 900 ft/s
      position 00:00:36.035n 01:57:21.156e altitude 30000 ft msl speed 900 ft/s
   end_route
   
   script_variables
      START_TYPE = "route";
      RISK_WPN = 0.0;
      MISSION_TYPE = "SWEEP";
      ENG_TGT = "";
      RPEAK_LOC ={1.0,0.8,0.95,1.0,1.0};
#     ROUTE.Append("blue_route");
      WINCHESTER = {-1,-1,-1,-1,-1};
   end_script_variables
   
   edit processor assessment
      enemy_side    red
      enemy_type    RED_FIGHTER
      friendly_type BLUE_FIGHTER
      flight_id     1
      id_flag       1
      mission_task  SWEEP 
   end_processor   
 
end_platform
```

- **演示要点**：演示 platform 的参数：indestructible, side, commander, command_chain, heading, route, script_variables, edit

### platform（hvaa_dca）｜平台实例

- **关键词**：platform, side, commander, command_chain, heading, position, script_variables, execute, edit, 平台实例
- **出处**：`air_to_air/scenarios/hvaa_dca.txt:196-229`　（同签名共 5 处，另见 `air_to_air/scenarios/hvaa_dca.txt:231`、`air_to_air/scenarios/hvaa_dca.txt:156`、`air_to_air/scenarios/escort.txt:228`）
- **片段**：

```text
platform blue_3 BLUE_FIGHTER 
   side blue
  #draw_nominal_states
   commander hvaa1
   command_chain IFLITE blue_1
   command_chain ELEMENT SELF
   heading 270 deg
   position 00:05:00.00s 01:10:00.00w  altitude 30000.00 ft

   script_variables
      START_TYPE = "orbit";
      RISK_WPN = 0.0;
      MISSION_TYPE = "HVAADCA";
      PROTECTING = {"hvaa1"};
      ENG_TGT = "";
      ROUTE.Append("test_route");
      FORM_FLY_CHAIN = iflite;
      VECTOR_FORMATION = {3,-15.0*MATH.M_PER_NM(),5.0*MATH.M_PER_NM(),0};
      APOLE_RDR = 30;
   end_script_variables
   
   execute at_time 1 s absolute 
#     PLATFORM.Sensor("rdr1").TurnOff();
#     PLATFORM.Sensor("eyes").TurnOff();
   end_execute
    
   edit processor assessment
      enemy_side    red
      enemy_type    RED_FIGHTER
      friendly_type BLUE_FIGHTER
      flight_id     1
      id_flag       3
   end_processor     
end_platform
```

- **演示要点**：演示 platform 的参数：side, commander, command_chain, heading, position, script_variables, execute, edit

### platform（2v2）｜平台实例

- **关键词**：platform, indestructible, side, commander, command_chain, heading, position, script_variables, edit, 平台实例
- **出处**：`air_to_air/scenarios/2v2.txt:22-57`　（同签名共 2 处，另见 `air_to_air/scenarios/2v2.txt:59`）
- **片段**：

```text
platform blue_1 BLUE_FIGHTER
   indestructible 
   side blue 
   commander SELF
   command_chain IFLITE  SELF
   command_chain ELEMENT SELF
   heading 90 deg
   position 00:05:00.00n 01:10:00.00w  altitude 30000.00 ft

   script_variables
      START_TYPE = "route";
      RISK_WPN = 0.0;
      MISSION_TYPE = "SWEEP";
      ENG_TGT = "";
      RPEAK_LOC ={1.0,0.8,0.95,1.0,1.0};
      ROUTE.Append("blue_route");
      WINCHESTER = {-1,-1,-1,-1,-1};
   end_script_variables

// if you desire no weapons to be launched
#   edit weapon fox3
#      quantity 0 
#   end_weapon 
#   edit weapon fox2
#      quantity 0 
#   end_weapon

   edit processor assessment
      enemy_side    red
      enemy_type    RED_FIGHTER
      friendly_type BLUE_FIGHTER
      flight_id     1
      id_flag       1
      mission_task  SWEEP 
   end_processor   
end_platform
```

- **演示要点**：演示 platform 的参数：indestructible, side, commander, command_chain, heading, position, script_variables, edit

### platform（kinematic_mover_demo）｜平台实例

- **关键词**：platform, position, mover, label, speed, goto, heading, side, icon, 平台实例
- **出处**：`kinematic_mover/kinematic_mover_demo.txt:109-150`
- **片段**：

```text
platform flyer2 FLYER
    position 33:58:17.63n 83:14:40.49w altitude 32808.40 ft

   mover
      #detailed_debug true
      initial_speed          250 kts
      initial_flight_path_angle 5 deg
      target_speed           210 kts
      maximum_linear_acceleration  1.4 g
      maximum_radial_acceleration 2.2 g  # about 2.5 g total...
      maximum_body_turn_rate  50 deg/sec
      maximum_body_roll_rate  45 deg/sec
      proportional_navigation_gain 30.0
      velocity_pursuit_gain        30.0
      update_interval 0.1 sec
   end_mover
      route

    label begin
    position 33:58:17.63n 83:14:40.49w altitude 32808.40 ft
    speed 200 kts
    position 33:57:53.50n 83:15:01.07w altitude 29527.56 ft
    speed 210 kts
    position 33:58:20.98n 83:15:35.77w altitude 25965.88 ft
    speed 180 kts
    position 34:00:12.26n 83:16:00.72w altitude 25685.04 ft
    speed 210 kts
    position 34:00:00.73n 83:17:14.84w altitude 23246.72 ft
    position 34:00:34.81n 83:16:19.31w altitude 24685.04 ft  speed 300 kts
    position 34:00:31.82n 83:15:34.99w altitude 26246.72 ft
    speed 200 kts
    position 33:58:33.61n 83:15:21.25w altitude 22685.04 ft
    speed 210 kts
    position 34:00:44.33n 83:14:55.21w altitude 29685.04 ft
    speed 200 kts
    goto begin
      end_route

  heading 215 deg
  side blue
  icon F-15
end_platform
```

- **演示要点**：演示 platform 的参数：position, mover, label, speed, goto, heading, side, icon

### platform（jam_strobe_tracking）｜平台实例

- **关键词**：platform, side, commander, position, altitude, heading, sensor, script_variables, execute, 平台实例
- **出处**：`electronic_warfare/jam_strobe_tracking.txt:277-325`　（同签名共 2 处，另见 `electronic_warfare/jam_strobe_tracking.txt:327`）
- **片段**：

```text
platform ew-radar_1 EW_RADAR
   side red
   commander report_center

   position 37:00:00n 116:00:00w
   altitude 0.0 ft agl
   heading   270 deg

   sensor radar
      on
   end_sensor


  script_variables
     # Create a WsfDraw object.
     WsfDraw draw = WsfDraw();
  end_script_variables

  execute at_interval_of 10.0 s
     foreach (WsfTrack track in MasterTrackList())
     {
        if (track.IsValid())
        {
           # use the track ID as a unique draw ID
           # a track icon and a line to the track icon
           # is drawn at each track update
           string trackId = track.TrackId().ToString();
           draw.SetId(trackId);
           draw.SetDuration(10.0); # this is faster than calling erase every time

           # Draw a track icon
           draw.SetColor(0,1,0);
           draw.BeginIcons(track.Heading(), "Wedge");
              draw.Vertex(track.ReportedLocation());
           draw.End();

           draw.SetLineStyle("solid");
           //draw.SetLineSize(3);

           # Draw a line to the track
           draw.BeginLines();
              draw.Vertex(PLATFORM);
              draw.Vertex(track.ReportedLocation());
              #writeln("1RepLoc: ", track.X(), ", ", track.Y(), ", ", track.Z(), ", LLA: ", track.Latitude(), " ", track.Longitude(), " ", track.Altitude());
           draw.End();
        }
     }
   end_execute
end_platform
```

- **演示要点**：演示 platform 的参数：side, commander, position, altitude, heading, sensor, script_variables, execute

### platform（jam_strobe_tracking）｜平台实例

- **关键词**：platform, side, commander, track_manager, position, altitude, heading, script_variables, execute, 平台实例
- **出处**：`electronic_warfare/jam_strobe_tracking.txt:377-425`
- **片段**：

```text
platform report_center COMMAND_CENTER
  side red
  commander SELF

  track_manager
     #correlation_method perfect
     #fusion_method      weighted_average
  end_track_manager

   position 37:05:00n 116:00:00w
   altitude 0.0 ft agl
   heading   90 deg

  script_variables
     # Create a WsfDraw object.
     WsfDraw draw = WsfDraw();
  end_script_variables

  execute at_interval_of 10.0 s
     foreach (WsfTrack track in MasterTrackList())
     {
        if (track.IsValid())
        {
           # use the track ID as a unique draw ID
           # a track icon and a line to the track icon
           # is drawn at each track update
           string trackId = track.TrackId().ToString();
           draw.SetId(trackId);
           draw.SetDuration(10.0); # this is faster than calling erase every time

           # Draw a track icon
           draw.SetColor(1,1,0);
           draw.BeginIcons(track.Heading(), "Wedge");
              draw.Vertex(track.ReportedLocation());
           draw.End();

           draw.SetLineStyle("solid");
           //draw.SetLineSize(3);

           # Draw a line to the track
           draw.BeginLines();
              draw.Vertex(PLATFORM);
              draw.Vertex(track.ReportedLocation());
              #writeln("3RepLoc: ", track.X(), ", ", track.Y(), ", ", track.Z(), ", LLA: ", track.Latitude(), " ", track.Longitude(), " ", track.Altitude());
           draw.End();
        }
     }
   end_execute
end_platform
```

- **演示要点**：演示 platform 的参数：side, commander, track_manager, position, altitude, heading, script_variables, execute

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, commander, side, icon, position, add, transmitter, receiver, execute, 平台实例
- **出处**：`satellite_demos/user_handhelds/iridium_handheld.txt:148-201`　（同签名共 4 处，另见 `satellite_demos/user_handhelds/iridium_handheld.txt:92`、`space_operations/scenarios/iridium_handheld.txt:149`、`space_operations/scenarios/iridium_handheld.txt:88`）
- **片段**：

```text
platform sender2 WSF_PLATFORM

  commander SELF
  side blue
  icon cmd_post
  position 35n 99w altitude 100 ft

  add comm sender2 WSF_RADIO_TRANSCEIVER
     on
     network_name sender2

   transmitter
      antenna_pattern                     UNIFORM_0DBI_PATTERN
      attenuation                         none
      frequency                           1621 mhz  # ref 1
      bandwidth                           10.5 mhz  # ref 1
      propagation_model                   none
      polarization                        right_circular  # ref 1
      power                               50 dbw
   end_transmitter

   receiver
      antenna_pattern                     UNIFORM_0DBI_PATTERN
      frequency                           1621 mhz  # ref 1
      bandwidth                           10.5 mhz  # ref 1
      noise_power                         -105.0 dbm
      detection_threshold                 3.0 dB
   end_receiver

  end_comm

   add sensor detect DETECT
      internal_link linker
   end_sensor

  add processor linker DYNAMIC_LINKING_PROC
  end_processor

   // test script
   execute at_interval_of 1 s
      if (TIME_NOW > 20.0)
      {
         WsfControlMessage msg = WsfControlMessage();
         msg.SetFunction("blah blah blah");
         WsfPlatform commander1 = WsfSimulation.FindPlatform("commander1");
         WsfComm comm = PLATFORM.Comm("sender2");
         if(comm.PathExistsTo(commander1.Comm("commander1").GetAddress()))
         {
            PLATFORM.Comm("sender2").SendMessage(msg, commander1.Comm("commander1").GetAddress());
         }
      }
   end_execute

end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：commander, side, icon, position, add, transmitter, receiver, execute

### platform（10_clients）｜平台实例

- **关键词**：platform, side, position, altitude, heading, route, track, edit, add, 平台实例
- **出处**：`swarm/scenarios/10_clients.txt:15-79`　（同签名共 3 处，另见 `swarm/scenarios/200_clients.txt:15`、`cyber/scenarios/duck_hunt.txt:15`）
- **片段**：

```text
platform bomber BOMBER
   side blue
   position 39:31:42.00n 91:38:35.00w
   altitude 30000.00 ft
   heading 90 deg
   route
      position 39:31:42n 91:38:35w altitude 30000 ft speed 300 kts
      position 39:31:40n 91:30:00w altitude 30000 ft speed 300 kts
   end_route
   track platform target01 end_track
   edit weapon client_agm
      quantity 10
   end_weapon


   add processor launch_leader_agm WSF_SCRIPT_PROCESSOR
      update_interval 1.0 sec
      on_update
         if (TIME_NOW > 1.0)
         {
            int trackIndex = 0;
            WsfWeapon weapon = PLATFORM.Weapon("leader_agm");
            WsfLocalTrackList trackList = PLATFORM.MasterTrackList();
            double clientquantity = weapon.QuantityRemaining();
            while (clientquantity > 0)
            {
              weapon.Fire(trackList.TrackEntry(trackIndex));
              clientquantity = weapon.QuantityRemaining();
            }
          }
          if (TIME_NOW > 10)
          {
             PLATFORM.TurnToRelativeHeading(179, 9.9);
             PROCESSOR.TurnOff();
          }
      end_on_update
    end_processor
    add processor launch_client_agm WSF_SCRIPT_PROCESSOR
      update_interval 1.0 sec
      on_update
         if (TIME_NOW > 3.0)
         {
            int trackIndex = 0;
            double LastFired = 0;
            double Interval  = 1;
            WsfWeapon weapon = PLATFORM.Weapon("client_agm");
            WsfLocalTrackList trackList = PLATFORM.MasterTrackList();
            double clientquantity = weapon.QuantityRemaining();
            while (clientquantity > 0)
            {
              weapon.Fire(trackList.TrackEntry(trackIndex));
              clientquantity = weapon.QuantityRemaining();

            }
          }
          if (TIME_NOW > 10)
          {
             #PLATFORM.TurnToHeading(270);
             PROCESSOR.TurnOff();
          }


      end_on_update
    end_processor
end_platform
```

- **演示要点**：演示 platform 的参数：side, position, altitude, heading, route, track, edit, add

### platform（airport_operations）｜平台实例

- **关键词**：platform, update_interval, side, icon, commander, route, follow_vertical_track, edit, execute, 平台实例
- **出处**：`p6dof/airport_operations.txt:1042-1117`　（同签名共 4 处，另见 `six_dof/rb6_airport_operations.txt:1040`、`six_dof/rb6_airport_operations.txt:942`、`p6dof/airport_operations.txt:942`）
- **片段**：

```text
platform Scramble2 ScrambleFighter
   update_interval 0.01 sec
   side blue
   icon f15c

   commander Scramble1   

   # Airport altitude is assumed to be 5 ft
   route
      position   21.32807n 157.94755w altitude    11.0 ft speed    0.0 kts
      position   21.32807n 157.94728w altitude    11.0 ft speed    8.0 kts
      position   21.32785n 157.94674w altitude    11.0 ft speed    8.0 kts
      position   21.32785n 157.94614w altitude    11.0 ft speed    8.0 kts
      position   21.32525n 157.94335w altitude    11.0 ft speed    8.0 kts
      position   21.32525n 157.94312w altitude    11.0 ft speed    8.0 kts
      position   21.32514n 157.94290w altitude    11.0 ft speed    8.0 kts
      position   21.32514n 157.94275w altitude    11.0 ft speed    4.0 kts
   end_route
   follow_vertical_track

   edit mover
      engines_on        true
      landing_gear_down true
      parking_brake_on  true
      nws_enabled       true
   end_mover

   execute at_time 0.01 sec absolute
      LowerLandingGear(PLATFORM);
      TaxiBackToRamp = "TaxiBackToRampRoute2";
      SetTaxiMode(PLATFORM, true);
      SetTaxiRadius(PLATFORM, 80.0);
      SetAutopilotNoControl(PLATFORM);
      EnableDirectThrottleInput(PLATFORM);
      MoveThrottleToIdle(PLATFORM);
   end_execute

   execute at_time 20.0 sec absolute
      EnableDirectBraking(PLATFORM);
      ReleaseWheelBrakes(PLATFORM);
      ReleaseDirectBraking(PLATFORM);
      ReleaseDirectThrottleInput(PLATFORM);
      SetAutopilotWaypointMode(PLATFORM);
   end_execute

   execute at_time 180.0 sec absolute
      SetAutopilotNoControl(PLATFORM);
      EnableDirectBraking(PLATFORM);
      SetParkingBrake(PLATFORM);
      EnableDirectThrottleInput(PLATFORM);
      MoveThrottleToIdle(PLATFORM);
   end_execute

   # Bring power up to full MIL power
   execute at_time 183.0 sec absolute
      MoveThrottleToFull(PLATFORM);
   end_execute

   # Bring power up to full AB power
   execute at_time 187.0 sec absolute
      MoveThrottleToAfterburner(PLATFORM);
   end_execute

   # Release the brakes and start takeoff roll in full AB
   execute at_time 190.0 sec absolute
      ReleaseWheelBrakes(PLATFORM);
      ReleaseDirectBraking(PLATFORM);
      SetVerticalSpeedMax(PLATFORM, 40000);
      SetAutopilotWaypointMode(PLATFORM);
      SetTaxiMode(PLATFORM, true);
      PLATFORM.FollowRoute("Scramble2TakeOffRoute");
#     BeginTakeOff(PLATFORM, 120, 12000.0, "TakeOffRouteComplete");
      BeginSteepTakeOff(PLATFORM, 120, 50.0, "TakeOffRouteComplete2");
   end_execute

end_platform
```

- **演示要点**：演示 platform 的参数：update_interval, side, icon, commander, route, follow_vertical_track, edit, execute

### platform（pm6_bomb_sequencers）｜平台实例

- **关键词**：platform, update_interval, side, heading, route, edit, include, execute, script, 平台实例
- **出处**：`six_dof/pm6_bomb_sequencers.txt:438-515`
- **片段**：

```text
platform viper_1 FA-LGT-BOMBS-LD_PM6
   update_interval 0.01 sec
   side blue

   heading 90 deg
   route
      position 21:21:15.98n 158:08:15.79w  altitude 12000.0 ft  speed 550.0 kts
      position 21:19:18.96n 158:07:40.00w  altitude 12000.0 ft  speed 550.0 kts      
      position 21:18:46.68n 158:04:41.20w  altitude 12000.0 ft  speed 550.0 kts
   end_route

   edit mover
      wash_in_conditions true
   end_mover

   include scripts/six_dof_simple_scripts.txt

   execute at_time 12.0 sec absolute
      WsfSixDOF_Mover mover = (WsfSixDOF_Mover)PLATFORM.Mover();
      if(!mover.IsNull())
      {
         mover.SetPitchGLoad(5.0);
         mover.SetAutopilotRollAngle(-145.0);         
      }
   end_execute
   
   execute at_time 16.0 sec absolute
      WsfSixDOF_Mover mover = (WsfSixDOF_Mover)PLATFORM.Mover();
      if(!mover.IsNull())
      {
         mover.SetAutopilotPitchAngle(-40.0);
         mover.SetAutopilotRollAngle(0.0);         
      }
   end_execute
   
   script void EmptyWeapon(WsfWeapon wpn)
   if(wpn.IsValid() && wpn.QuantityRemaining() > 0)
   {
      wpn.Fire();
      PLATFORM.ExecuteAtTime(TIME_NOW + 0.15, "EmptyWeapon", {wpn});
   }
   end_script

   execute at_time 25.0 sec absolute
      writeln("viper_1 is rippling off six bombs with a nested sequencer...");
      # ActivateSequencer(PLATFORM, "RippleBombs");
      WsfWeapon bomb = PLATFORM.Weapon("Bomb");
      EmptyWeapon(bomb);      
   end_execute

   execute at_time 25.0 sec absolute
      WsfSixDOF_Mover mover = (WsfSixDOF_Mover)PLATFORM.Mover();
      if(!mover.IsNull())
      {
         mover.SetPitchGLoad(7.0);
         mover.SetAutopilotRollAngle(50.0);         
      }
   end_execute

   execute at_time 37.0 sec absolute
      WsfSixDOF_Mover mover = (WsfSixDOF_Mover)PLATFORM.Mover();
      if(!mover.IsNull())
      {
         mover.SetPitchGLoad(0.2);
         mover.SetAutopilotRollAngle(0.0);         
      }
   end_execute

   execute at_time 55.0 sec absolute
      WsfSixDOF_Mover mover = (WsfSixDOF_Mover)PLATFORM.Mover();
      if(!mover.IsNull())
      {
         mover.SetAutopilotVerticalSpeed(0.0);
         mover.SetAutopilotRollAngle(0.0);         
      }
   end_execute

end_platform
```

- **演示要点**：演示 platform 的参数：update_interval, side, heading, route, edit, include, execute, script

### platform（bomb_demo_laydown）｜平台实例

- **关键词**：platform, side, position, heading, command_chain, comm, network_name, use_zone, 平台实例
- **出处**：`suppressor/bomb_demo_laydown.txt:81-90`　（同签名共 4 处，另见 `suppressor/bomb_demo_laydown.txt:92`、`suppressor/bomb_demo_laydown.txt:103`、`suppressor/bomb_demo_laydown.txt:114`）
- **片段**：

```text
platform 110_sam_battery sam_battery
  side red
  position 33:32:09.5n  35:57:24.8e altitude 1 m agl
  heading 90 deg
  command_chain red-net 100_sam_regiment
  comm red-net
    network_name red-net
  end_comm
  use_zone 100_sam_zone as sam_zone
end_platform
```

- **演示要点**：演示 platform 的参数：side, position, heading, command_chain, comm, network_name, use_zone

### platform（full_laydown）｜平台实例

- **关键词**：platform, side, position, commander, icon, heading, edit, on, 平台实例
- **出处**：`timeline_lead/scenarios/full_laydown.txt:121-130`
- **片段**：

```text
platform red_flight_lead RED_FLIGHT_LEAD
  side red
  position 38:34:47.97n 89:21:40.97w
  commander SELF
  icon Command_Truck
  heading 100 deg
  edit processor timeline
    on
  end_processor
end_platform
```

- **演示要点**：演示 platform 的参数：side, position, commander, icon, heading, edit, on

### platform（bombers）｜平台实例

- **关键词**：platform, side, icon, heading, route, position, speed, track, 平台实例
- **出处**：`outer_air_battle/scenarios/bombers.txt:43-54`　（同签名共 5 处，另见 `outer_air_battle/scenarios/bombers.txt:56`、`outer_air_battle/scenarios/bombers.txt:69`、`outer_air_battle/scenarios/bombers.txt:82`）
- **片段**：

```text
platform bomber-2 BOMBER
  side red
  icon bomber
  heading 000 deg
  route
    position 05:32:31.57n 10:32:12.07w altitude 40000.00 ft
    speed 400 kts
    position 00:00:00.00n 30:00:00.00w altitude 40000.00 ft
  end_route

  track platform cv_1 end_track
end_platform
```

- **演示要点**：演示 platform 的参数：side, icon, heading, route, position, speed, track

### platform（scenario_route_finder_2）｜平台实例

- **关键词**：platform, indestructible, side, icon, heading, commander, route, edit, 平台实例
- **出处**：`route_finder_demos/scenario_route_finder_2.txt:44-55`
- **片段**：

```text
platform  red_1  STRIKER
   indestructible
   side red
   icon SU-27
   heading 300 deg
   commander   SELF
   route
      position 0.78n 3.75e altitude 30000 ft speed 450 kts
      position 1.45n 2.60e altitude 30000 ft speed 450 kts
   end_route
   edit processor task_mgr off end_processor
end_platform
```

- **演示要点**：演示 platform 的参数：indestructible, side, icon, heading, commander, route, edit

### platform（six_dof_flight_envelope）｜平台实例

- **关键词**：platform, edit, six_dof_ned_heading, six_dof_ned_pitch, six_dof_ned_roll, six_dof_set_velocity_ned_fps, six_dof_position, six_dof_alt, 平台实例
- **出处**：`six_dof/six_dof_flight_envelope.txt:222-236`
- **片段**：

```text
platform platform TEST_PLATFORM_TYPE
   
   edit mover
      engines_on true
   end_mover

   # This is important for CanFly() to return correct information
   six_dof_ned_heading 0 deg
   six_dof_ned_pitch 0 deg
   six_dof_ned_roll 0 deg
   six_dof_set_velocity_ned_fps 100 0 0
   six_dof_position 0 0
   six_dof_alt 1000 ft

end_platform
```

- **演示要点**：演示 platform 的参数：edit, six_dof_ned_heading, six_dof_ned_pitch, six_dof_ned_roll, six_dof_set_velocity_ned_fps, six_dof_position, six_dof_alt

### platform（strike）｜平台实例

- **关键词**：platform, side, commander, creation_time, position, edit, route, heading, 平台实例
- **出处**：`aea_iads/scenarios/strike.txt:16-37`　（同签名共 12 处，另见 `aea_iads/scenarios/strike.txt:39`、`aea_iads/scenarios/strike.txt:62`、`aea_iads/scenarios/strike.txt:85`）
- **片段**：

```text
platform 100_ucav UCAV
   side blue
   commander SELF
   creation_time 10.0 min
   position 38:16:36n 116:19:48w altitude 35000 ft msl
   edit weapon blue_gps_bomb_2
      quantity 0
   end_weapon
   route
      navigation
         position 38:16:36n 116:19:48w altitude 35000 ft msl
            speed 460 kts
         position 38:10:24n 117:02:48w altitude 35000 ft msl
            speed 460 kts
         position 38:24:12n 117:21:12w altitude 35000 ft msl
            speed 460 kts
         position 41:13:48n 111:35:00w altitude 35000 ft msl
            speed 460 kts
      end_navigation
   end_route
   heading 259.6 deg
end_platform
```

- **演示要点**：演示 platform 的参数：side, commander, creation_time, position, edit, route, heading

### platform（false-target_command_center）｜平台实例

- **关键词**：platform, side, commander, route, position, altitude, heading, sensor, 平台实例
- **出处**：`electronic_warfare/false-target_command_center.txt:398-419`
- **片段**：

```text
platform ew-radar-site-2 EW_RADAR_SITE
  side red

  commander command_center

  route
    position 36:30:00n 115:53:24w
    altitude 100 ft
    heading 90 deg
  end_route

  sensor radar
     on
     transmitter
        frequency 800 mhz
     end_transmitter
     receiver
        frequency 800 mhz
     end_receiver
  end_sensor

end_platform
```

- **演示要点**：演示 platform 的参数：side, commander, route, position, altitude, heading, sensor

### platform（draw_demo）｜平台实例

- **关键词**：platform, side, route, position, weapon, quantity, firing_interval, heading, 平台实例
- **出处**：`draw/draw_demo.txt:154-177`
- **片段**：

```text
platform strike-1 FIGHTER
  side blue
  route
    position 31:17:38.0n 45:13:54.9e altitude 500.00 ft agl
      speed 250 kts
      climb_rate 41 ft/s
    position 31:18:30.4n 45:13:53.8e altitude 500.00 ft agl
      speed 270 kts
      climb_rate 107 ft/s
    position 31:18:49.30n 45:13:44.80e altitude 1000.00 ft agl
      speed 300 kts
      climb_rate 410 ft/s
    position 31:19:26.4n 45:13:18.6e altitude 10000.00 ft agl
      speed 310 kts
    position 31:23:55.2n 45:09:46.4e altitude 10000.00 ft agl
      speed 330 kts
  end_route

  weapon 1000_lb_bomb
    quantity 4
    firing_interval 2 sec
  end_weapon
  heading 359 deg
end_platform
```

- **演示要点**：演示 platform 的参数：side, route, position, weapon, quantity, firing_interval, heading

### platform（brawler_demo_combined_agent）｜平台实例

- **关键词**：platform, indestructible, side, icon, commander, edit, position, heading, 平台实例
- **出处**：`brawler/brawler_demo_combined_agent.txt:45-69`　（同签名共 3 处，另见 `brawler/brawler_demo_combined_agent_BVR.txt:52`、`brawler/brawler_demo_1v1.txt:82`）
- **片段**：

```text
platform red_1 COMBINED_PLATFORM

   indestructible
   side red
   icon SU-27
   commander red_cmdr
   edit mover
      aero_file platforms/ACFT_RAC1.FXW
   end_mover

   position 00:01:50.00n 00:00:25.00e altitude 10000.00 ft
   heading 180 deg
#   ##for testing route flying:
#   edit processor task_mgr
#      behavior_tree  end_behavior_tree   #clear it
#   end_processor
#   route
#      position 00:01:50.00n 00:00:25.00e altitude 10000.00 ft speed 350.0 kts
#      position 00:00:50.02s 00:00:24.97e altitude 10000.00 ft speed 350.0 kts
#      position 00:02:31.69s 00:02:28.74e altitude 10000.00 ft
#      position 00:05:13.85s 00:02:29.85e altitude 10000.00 ft
#      position 00:06:46.37s 00:00:33.45e altitude 10000.00 ft
#      position 00:11:03.64s 00:00:35.73e altitude 10000.00 ft
#   end_route
end_platform
```

- **演示要点**：演示 platform 的参数：indestructible, side, icon, commander, edit, position, heading

### platform（escort）｜平台实例

- **关键词**：platform, side, commander, command_chain, heading, position, edit, script_variables, 平台实例
- **出处**：`air_to_air/scenarios/escort.txt:275-300`　（同签名共 7 处，另见 `air_to_air/scenarios/escort.txt:302`、`air_to_air/scenarios/1v1.txt:61`、`air_to_air/scenarios/2v2.txt:96`）
- **片段**：

```text
platform blue_3 ESCORT 
   side blue
#  draw_nominal_states
   commander blue_1
   command_chain IFLITE  blue_1
   command_chain ELEMENT SELF   
   command_chain BOMBER  blue_1

   heading 90 deg
   position 00:05:00.00s 01:20:00.00w  altitude 30000.00 ft

   edit processor assessment
      flight_id   1
      id_flag     3
   end_processor

   script_variables
      ENG_TGT = "";
      ROUTE.Append("test_route");
      FORM_FLY_CHAIN = iflite;
      VECTOR_FORMATION = {3,-15.0*MATH.M_PER_NM(),5.0*MATH.M_PER_NM(),0};
      ESCORT_FORMATION = {30.0*MATH.M_PER_NM(), 15.0*MATH.M_PER_NM()};   //! X and Y offset from the protected entity (relative to PE's bearing)                       
      COMMIT_RNG =70.0 *MATH.M_PER_NM();
   end_script_variables
   
end_platform
```

- **演示要点**：演示 platform 的参数：side, commander, command_chain, heading, position, edit, script_variables

### platform（alv_demo）｜平台实例

- **关键词**：platform, side, command_chain, route, heading, sensor, execute, processor, 平台实例
- **出处**：`alv_routing/alv_demo.txt:56-81`　（同签名共 2 处，另见 `alv_routing/alv_demo_with_jammer.txt:59`）
- **片段**：

```text
platform awacs-1 AWACS
   side blue
   command_chain GOOD_GUYS SELF

   route
      label awacs_loiter
      position 41:34:32.15n 89:12:49.08w altitude 35000.00 ft speed 450 kts
      position 42:34:31.97n 89:13:40.29w
      position 42:34:32.11n 88:42:27.79w
      position 41:34:32.11n 88:42:28.54w
      goto awacs_loiter
   end_route
  heading 359 deg

   sensor esm-1
     on
   end_sensor

   execute at_time 5 minutes absolute
     # PLATFORM.TurnSensorOn("esm-1"); # Turn on the ground radar system instead...
   end_execute

   processor track-proc
      report_to command_chain GOOD_GUYS subordinates via xmtr-1 to rcvr-1
   end_processor
end_platform
```

- **演示要点**：演示 platform 的参数：side, command_chain, route, heading, sensor, execute, processor

### platform（test_maneuvers）｜平台实例

- **关键词**：platform, side, icon, commander, edit, route, heading, execute, 平台实例
- **出处**：`timeline/scenarios/test_maneuvers.txt:291-317`　（同签名共 2 处，另见 `timeline/scenarios/test_maneuvers.txt:60`）
- **片段**：

```text
platform red_5 STRIKER
   side red
   icon SU-27
   commander flight_lead_red

   edit processor task_mgr
     off // Not using behavior tree in tests
   end_processor

   route
      position 40:58:33.93n 90:03:39.91w
         altitude 35000 feet
         speed 450 nm/h
      position 39:25:44.23n 90:04:32.58w
         altitude 35000 feet
         speed 450 nm/h
   end_route
   heading 272 deg

   execute at_interval_of 5 sec
      WsfTrack track = PLATFORM.MasterTrackList().Entry(0);
      if (track.IsValid())
      {
         Engage(PLATFORM, track, "pure", 237, 35000 * Math.M_PER_FT(), 6.0);
      }
   end_execute
end_platform
```

- **演示要点**：演示 platform 的参数：side, icon, commander, edit, route, heading, execute

### platform（air_interceptor）｜平台实例

- **关键词**：platform, side, icon, commander, route, aux_data, zone, on_initialize2, 平台实例
- **出处**：`iads_c2_demos/scenarios/air_interceptor.txt:23-51`
- **片段**：

```text
platform 17_ai AIR_INTERCEPTOR
   side red
   icon SU-27
   commander   10_iads_cmdr

   route
      position 38:00:00n 117:15:00w altitude 30000 ft msl speed 580 kts
      transform_route cap_orbit reference_heading 0.0 deg
   end_route

   aux_data
      WsfBMAuxDataZoneAttachment iads_c2_zones
   end_aux_data

   zone weapon_engagement_zone
      polygonal lat_lon
         point 38:40:24n 117:00:00w // Top Right
         point 37:04:10n 117:00:00w // Bottom Right
         point 37:04:10n 117:47:40w // Bottom Left
         point 38:40:24n 117:47:40w // Top Left
   end_zone

   on_initialize2
      # add zone references to this platform
      WsfBMAuxDataZoneAttachment iads_c2_zones = WsfBMAuxDataZoneAttachment ();
      iads_c2_zones.Add ("platform", 1.0, "weapon_engagement_zone", "FEZ");
      WsfBMUtils.SetZoneAuxData (PLATFORM, "iads_c2_zones", iads_c2_zones);
   end_on_initialize2
end_platform
```

- **演示要点**：演示 platform 的参数：side, icon, commander, route, aux_data, zone, on_initialize2

### platform（iridium_handheld）｜平台实例

- **关键词**：platform, commander, side, icon, position, add, transmitter, receiver, 平台实例
- **出处**：`space_operations/scenarios/iridium_handheld.txt:14-46`　（同签名共 2 处，另见 `space_operations/scenarios/iridium_handheld.txt:48`）
- **片段**：

```text
platform commander1 HANDHELD
  commander SELF
  side green
  icon cmd_post
  position 17:57:41.24n 20:28:25.87e

  add comm commander1 WSF_RADIO_TRANSCEIVER

     on
     default_gateway
     network_name commander1

   transmitter
      antenna_pattern                     UNIFORM_0DBI_PATTERN
      frequency                           1621 mhz  # ref 1
      bandwidth                           10.5 mhz  # ref 1
      polarization                        right_circular  # ref 1
      power                               50 dbw
   end_transmitter

   receiver
      antenna_pattern                     UNIFORM_0DBI_PATTERN
      frequency                           1621 mhz  # ref 1
      bandwidth                           10.5 mhz  # ref 1
   end_receiver

  end_comm

  add processor commander_router WSF_COMM_ROUTER
     interface commander1
  end_processor

end_platform
```

- **演示要点**：演示 platform 的参数：commander, side, icon, position, add, transmitter, receiver

### platform（2v2_air_movers）｜平台实例

- **关键词**：platform, side, commander, command_chain, heading, route, script_variables, edit, 平台实例
- **出处**：`air_to_air/scenarios/2v2_air_movers.txt:92-125`　（同签名共 2 处，另见 `air_to_air/scenarios/2v2_air_movers.txt:127`）
- **片段**：

```text
platform red_1 RED_FIGHTER_AIR
   side red
   commander SELF
   command_chain IFLITE  SELF
   command_chain ELEMENT SELF
   heading 270 deg
   
   route
      position 00:00:00.00n  01:10:00.00e  altitude 30000 ft
      position 00:00:36.035n 01:47:21.156w altitude 30000 ft msl speed 900 ft/s
      position 00:00:36.035n 01:57:21.156w altitude 30000 ft msl speed 900 ft/s
   end_route

   script_variables
      START_TYPE = "route";
      RISK_AVRS = 1.0;
      RISK_WPN = 1.0;
      DOR = 40*MATH.M_PER_NM();
      MISSION_TYPE = "SWEEP";
      ENG_TGT = "";
      RPEAK_LOC ={1.0,0.8,0.95,1.0,1.0};
#     ROUTE.Append("red_route");
      WINCHESTER = {-1,-1,-1,-1,-1};
   end_script_variables
  
   edit processor assessment
      enemy_side    blue
      enemy_type    BLUE_FIGHTER
      friendly_type RED_FIGHTER
      flight_id     202
      id_flag       1
      mission_task  SWEEP 
   end_processor   
end_platform
```

- **演示要点**：演示 platform 的参数：side, commander, command_chain, heading, route, script_variables, edit

### platform（jam_strobe_direction_finder）｜平台实例

- **关键词**：platform, side, commander, position, altitude, heading, script_variables, execute, 平台实例
- **出处**：`electronic_warfare/jam_strobe_direction_finder.txt:227-261`
- **片段**：

```text
platform command_center COMMAND_CENTER
   side      red
   commander SELF
   position  37:05:00n 116:00:00w
   altitude  0.0 ft agl
   heading   90 deg

   script_variables
      WsfDraw draw = WsfDraw();
   end_script_variables

   execute at_interval_of 10.0 s
      foreach (WsfTrack track in MasterTrackList())
      {
         if (track.IsValid() && track.LocationValid())
         {
            string trackId = track.TrackId().ToString();
            draw.SetId(trackId);
            draw.SetDuration(10.0);

            draw.SetColor(0,0.3,0.9, 0.4);
            draw.SetLineStyle("solid");

           draw.BeginLines();
              draw.Vertex(PLATFORM);
              draw.Vertex(track.ReportedLocation());
           draw.End();

           draw.BeginIcons(track.Heading(), "Wedge");
              draw.Vertex(track.ReportedLocation());
           draw.End();
        }
     }
   end_execute
end_platform
```

- **演示要点**：演示 platform 的参数：side, commander, position, altitude, heading, script_variables, execute

### platform（ground_segment）｜平台实例

- **关键词**：platform, commander, side, icon, position, altitude, comm, execute, 平台实例
- **出处**：`space_operations/scenarios/ground_segment.txt:26-61`
- **片段**：

```text
platform sender1 UPLINK

  commander SELF
  side green
  icon cmd_post
  position 35:25:28.276n 83:38:16.705e
  altitude 100 ft
  
  comm uplink
     network_name sender1
     pitch 90 deg
  end_comm
  
  // test script
  execute at_interval_of 10 s
     if (TIME_NOW > 60.0)
     {
         WsfMessage msg = WsfMessage();
         msg.SetSubType("blah blah blah");
         WsfPlatform sender = WsfSimulation.FindPlatform("sender1");
         WsfComm uplink = PLATFORM.Comm("uplink");
         CommLink link = CommLink_Link(uplink);
         WsfAddress uplinkAddr = WsfSimulation.FindPlatform("commander1").Comm("uplink").GetAddress();
         if (link.Linked() && 
             uplink.PathExistsTo(uplinkAddr))
         {
            uplink.SendMessage(msg, uplinkAddr);
         }
#         if (!uplink.PathExistsTo("commander1", "uplink"))
#         {
#             writeln(TIME_NOW, ": No path to commander"); 
#         }
      } 
   end_execute

end_platform
```

- **演示要点**：演示 platform 的参数：commander, side, icon, position, altitude, comm, execute

### platform（test_maneuvers）｜平台实例

- **关键词**：platform, side, position, commander, icon, heading, add, edit, 平台实例
- **出处**：`timeline/scenarios/test_maneuvers.txt:22-57`
- **片段**：

```text
platform flight_lead_blue FLIGHT_LEAD
  side blue
  position 38:47:31.12n 90:15:32.46w
  commander SELF
  icon Command_Truck
  heading 100 deg

  add sensor geo_sensor WSF_GEOMETRIC_SENSOR
      on
      azimuth_field_of_view   -180.0 degrees  180.0 degrees
      elevation_field_of_view  -10.0 degrees   90.0 degrees
      minimum_range 0 m
     #maximum_range 277800 m     //about 150 nm
      maximum_range 175940 m     //about  95 nm
      frame_time    0.5 sec
      reports_location
      reports_velocity
      reports_iff
      track_quality 1.0
      internal_link data_mgr
      #internal_link task_mgr
      ignore_same_side
   end_sensor

  edit processor task_mgr
     off // Not creating tasks in tests
     #show_task_messages
#     behavior_tree
#       behavior_node debug_quantum_tasker
#     end_behavior_tree
   end_processor

   edit processor timeline_data
      off // Not creating tasks in tests
   end_processor
end_platform
```

- **演示要点**：演示 platform 的参数：side, position, commander, icon, heading, add, edit

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, side, icon, add, route, script_variables, update_interval, execute, 平台实例
- **出处**：`example_scripts/scenario_route_finder_orbit.txt:44-86`
- **片段**：

```text
platform player-1 WSF_PLATFORM
   side blue
   icon F-18E
   add mover WSF_AIR_MOVER update_interval 1 sec end_mover
   route
      position 00.32462n 02.0e altitude 10000 ft msl speed 250 m/s
      position 00.32462n 01.0e altitude 10000 ft msl speed 250 m/s
   end_route

   script_variables
      WsfRouteFinder finder = WsfRouteFinder();
   end_script_variables

   update_interval 1 sec
   execute at_interval_of 10 sec


         finder.SetMaxArcLength(4000); //a little over 2 nm (in meters)
         WsfGeoPoint src = PLATFORM.Location();
         WsfPlatform tgt = WsfSimulation.FindPlatform("target");

         WsfGeoPoint tempLoc = tgt.Location();
         double locDir = PLATFORM.TrueBearingTo(tgt)-1.0;
         tempLoc.Extrapolate(locDir, 20*MATH.M_PER_NM());

         finder.ClearAvoidances();
         finder.Avoid(tgt.Location(), 1852*20);  # 1

         WsfRoute path = finder.Route(TIME_NOW, src, tempLoc, 250); //250 met/sec ~500 knots

         writeln("path: ");
         for(int i=0; i<path.Size(); i=i+1)
         {
            WsfWaypoint pt = path.Waypoint(i);
            writeln(pt.Location().ToString());
         }

         writeln_d(PLATFORM.Name(), " given path, size: ", path.Size());
         PLATFORM.SetRoute(path);
         finder.DrawAvoidances(1, Vec3.Construct(0.4, 0.4, 0.4));
         DrawRoute(path);
   end_execute
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：side, icon, add, route, script_variables, update_interval, execute

### platform（tbm_route_and_launch）｜平台实例

- **关键词**：platform, side, icon, heading, commander, processor, route, track, 平台实例
- **出处**：`orwaca_iads/scenarios/tbm_route_and_launch.txt:19-63`
- **片段**：

```text
platform tbm_launcher_vehicle_1 TBM_LAUNCHER_VEHICLE
   side red
   icon tbm_launcher_icon
   heading 317 deg
   commander SELF
   
   processor launch_ssm_processor
      script_variables
         #TIME_TO_LAUNCH = 180 ; // sim time in seconds you want it to launch
         #LAUNCH_RANDOM = 1;     // uncomment this if you want to randomize the launch time
         #MIN_TIME      = 10;    // minimum random launch time for this weapon
         #MAX_TIME      = 500;   // maximum random launch time for this weapon
      end_script_variables
   end_processor
   
   route
      position 45:19:40.71n 121:54:36.17w altitude 3.00 ft msl speed 40 kts
      position 45:20:02.91n 121:55:05.58w radial_acceleration 0.134793 g
      position 45:20:26.58n 121:55:56.90w
      position 45:20:44.29n 121:57:14.84w
      position 45:21:22.85n 121:59:14.43w
      position 45:22:11.45n 122:00:45.83w
      position 45:22:36.26n 122:02:12.60w
      position 45:22:47.25n 122:02:56.33w
      position 45:22:45.73n 122:03:46.75w
      position 45:22:35.79n 122:04:31.42w speed 40 kts
      position 45:22:57.45n 122:05:11.23w speed 5 kts radial_acceleration 0.034793 g
         pause_time 30 min
      position 45:22:35.79n 122:04:31.42w speed 40 kts
      position 45:22:45.73n 122:03:46.75w
      position 45:22:47.25n 122:02:56.33w
      position 45:22:36.26n 122:02:12.60w
      position 45:22:11.45n 122:00:45.83w
      position 45:21:22.85n 121:59:14.43w
      position 45:20:44.29n 121:57:14.84w
      position 45:20:26.58n 121:55:56.90w
      position 45:20:02.91n 121:55:05.58w
      position 45:19:40.71n 121:54:36.17w speed 1 knots
         remove
   end_route

   track
      platform tbm_target01
   end_track
end_platform
```

- **演示要点**：演示 platform 的参数：side, icon, heading, commander, processor, route, track

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, icon, side, add, route, script_variables, script, execute, 平台实例
- **出处**：`space_operations/launch_vehicles/launcher_one/test.txt:23-72`
- **片段**：

```text
platform cosmic_girl WSF_PLATFORM
   icon B-747
   side blue

   add mover WSF_AIR_MOVER
   end_mover

   add weapon rocket WSF_EXPLICIT_WEAPON
      launched_platform_type LAUNCHER_ONE_MOD
      launch_computer WSF_LAUNCH_COMPUTER
         commanded_loft_angle 40 deg       # <==== The desired flight path angle for the PITCH_UP phase
      end_launch_computer
      quantity 1
   end_weapon

   route
      position 28.608422n 80.604133w altitude 35000 ft heading 90 deg speed 400 kts
      #position 130w 35n altitude 35000 ft heading 90 deg speed 500 kts         # West of MHV
   end_route

   script_variables
      double mInitialAltitude;
   end_script_variables

   script void BeginLaunch()
      mInitialAltitude = Altitude();
      double speed = Speed();
      double desiredPitch = 10.0; # Degrees
      double climbRate = speed * Math.Sin(desiredPitch);
      double targetAltitude = Altitude() + 2000.0;
      writeln("Going to altitude ", targetAltitude, " climb rate=", climbRate, " speed=", speed);
      GoToAltitude(Altitude() + 2000.0, climbRate);
      ExecuteAtTime(TIME_NOW + 1.0, "Launch");
   end_script

   script void Launch()
      writeln("Launching, pitch=", Pitch(), " Speed=", Speed());
      WeaponEntry(0).Fire();
      ExecuteAtTime(TIME_NOW + 10.0, "ResumeFlight");
   end_script

   script void ResumeFlight()
      writeln("resume original path");
      GoToAltitude(mInitialAltitude);
   end_script

   execute at_time 0.001 sec relative
      BeginLaunch();
   end_execute
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, add, route, script_variables, script, execute

### platform（bomb_sequencers）｜平台实例

- **关键词**：platform, update_interval, side, route, edit, script_variables, script, execute, 平台实例
- **出处**：`p6dof/bomb_sequencers.txt:231-312`　（同签名共 6 处，另见 `six_dof/pm6_bomb_sequencers.txt:256`、`six_dof/rb6_bomb_sequencers.txt:230`、`six_dof/pm6_bomb_sequencers.txt:339`）
- **片段**：

```text
platform arc_light B-HVY-BOMBS-LD
   update_interval 0.01 sec
   side blue

   route
      position 21:14:10.0n 158:10:29.0w  altitude 36000.0 ft  speed 530.0 kts
      position 21:18:10.0n 158:04:29.0w  altitude 36000.0 ft  speed 530.0 kts
   end_route

   edit mover
      wash_in_conditions true
   end_mover   

   script_variables
      bool bombTriggerPulled = false;
      bool bombsRemain       = true;
      string activeRack      = "iron_bomb_aft_rack";
   end_script_variables
   
   script void ReleaseNextBomb()

      // First, verify bombs are available
      WsfWeapon wpn = PLATFORM.Weapon(activeRack);
      if(wpn.IsValid())
      {
         if(wpn.QuantityRemaining() < 0.5)
         {
            // Switch to the next rack
            if(activeRack == "iron_bomb_aft_rack")
            {
               activeRack = "iron_bomb_mid_rack";
            }
            else if(activeRack == "iron_bomb_mid_rack")
            {
               activeRack = "iron_bomb_forward_rack";
            }
            else
            {
               // No racks
               bombsRemain = false;
            }
         }
      }
      
      if(bombTriggerPulled && bombsRemain)
      {
         WsfWeapon wpn = PLATFORM.Weapon(activeRack);
         if(wpn.IsValid())
         {
            if(wpn.QuantityRemaining() > 0.0)
            {
               wpn.Fire();
            }
         }
      }

      if(bombsRemain) { PLATFORM.ExecuteAtTime(TIME_NOW + 0.3, "ReleaseNextBomb", {}); }
      
   end_script
   
   script void ReleaseBombs()
      bombTriggerPulled = true;
      ReleaseNextBomb();
   end_script
   
   # Drop the bombs
   execute at_time 5.0 sec absolute   
      writeln("Bomber 'arc_light' drops its bombs...");
      ReleaseBombs();
   end_execute

   execute at_time 16.0 sec absolute
      writeln("Bomber 'arc_light' making a right turn towards the east...");
      PLATFORM.TurnToHeading(90.0);
   end_execute

   execute at_time 35.0 sec absolute
      writeln("Bomber 'arc_light' continuing turn towards the southwest...");
      PLATFORM.TurnToHeading(230.0);    
   end_execute

end_platform
```

- **演示要点**：演示 platform 的参数：update_interval, side, route, edit, script_variables, script, execute

### platform（rb6_bomb_sequencers）｜平台实例

- **关键词**：platform, update_interval, side, heading, route, edit, include, execute, 平台实例
- **出处**：`six_dof/rb6_bomb_sequencers.txt:412-495`　（同签名共 5 处，另见 `p6dof/bomb_sequencers.txt:415`、`six_dof/pm6_bomb_sequencers.txt:517`、`six_dof/rb6_bomb_sequencers.txt:497`）
- **片段**：

```text
platform viper_1 FA-LGT-BOMBS-LD_RB6
   update_interval 0.01 sec
   side blue

   heading 90 deg
   route
      position 21:21:15.98n 158:08:15.79w  altitude 12000.0 ft  speed 550.0 kts
      position 21:19:18.96n 158:07:40.00w  altitude 12000.0 ft  speed 550.0 kts      
      position 21:18:46.68n 158:04:41.20w  altitude 12000.0 ft  speed 550.0 kts
   end_route

   edit mover
      wash_in_conditions true
   end_mover

   include scripts/six_dof_simple_scripts.txt

   execute at_time 14.0 sec absolute
      WsfSixDOF_Mover mover = (WsfSixDOF_Mover)PLATFORM.Mover();
      if(!mover.IsNull())
      {
         mover.SetPitchGLoad(0.2);
         mover.SetAutopilotDeltaRoll(-100.0);         
      }
   end_execute

   execute at_time 16.0 sec absolute
      WsfSixDOF_Mover mover = (WsfSixDOF_Mover)PLATFORM.Mover();
      if(!mover.IsNull())
      {
         mover.SetPitchGLoad(5.0);
         mover.SetAutopilotDeltaRoll(0.0);         
      }
   end_execute
   execute at_time 20.0 sec absolute
      WsfSixDOF_Mover mover = (WsfSixDOF_Mover)PLATFORM.Mover();
      if(!mover.IsNull())
      {
         mover.SetPitchGLoad(0.2);
         mover.SetAutopilotRollAngle(0.0);         
      }
   end_execute
   execute at_time 22.0 sec absolute
      WsfSixDOF_Mover mover = (WsfSixDOF_Mover)PLATFORM.Mover();
      if(!mover.IsNull())
      {
         mover.SetPitchGLoad(0.9);
         mover.SetAutopilotRollAngle(0.0);         
      }
   end_execute

   execute at_time 24.0 sec absolute
      writeln("viper_1 is rippling off six bombs with a nested sequencer...");
      ActivateSequencer(PLATFORM, "RippleBombs");
   end_execute

   execute at_time 25.0 sec absolute
      WsfSixDOF_Mover mover = (WsfSixDOF_Mover)PLATFORM.Mover();
      if(!mover.IsNull())
      {
         mover.SetPitchGLoad(7.0);
         mover.SetAutopilotRollAngle(50.0);         
      }
   end_execute

   execute at_time 37.0 sec absolute
      WsfSixDOF_Mover mover = (WsfSixDOF_Mover)PLATFORM.Mover();
      if(!mover.IsNull())
      {
         mover.SetPitchGLoad(0.2);
         mover.SetAutopilotRollAngle(0.0);         
      }
   end_execute

   execute at_time 55.0 sec absolute
      WsfSixDOF_Mover mover = (WsfSixDOF_Mover)PLATFORM.Mover();
      if(!mover.IsNull())
      {
         mover.SetAutopilotVerticalSpeed(0.0);
         mover.SetAutopilotRollAngle(0.0);         
      }
   end_execute

end_platform
```

- **演示要点**：演示 platform 的参数：update_interval, side, heading, route, edit, include, execute

### platform（1v1_initial_prediction）｜平台实例

- **关键词**：platform, side, commander, command_chain, heading, route, edit, execute, 平台实例
- **出处**：`air_to_air/scenarios/1v1_initial_prediction.txt:21-256`
- **片段**：

```text
platform Talon_1_1 BLUE_FIGHTER_PM6
   side blue
   commander SELF
   command_chain IFLITE SELF
   command_chain ELEMENT SELF
   heading 90 deg   

   route
      position 00:00:00.00n 00:00:00.00w altitude 30000.00 ft speed 300 m/s
      position 00:00:00.00n 00:01:00.00e altitude 30000.00 ft speed 300 m/s
   end_route

   edit processor assessment
      on
   
      enemy_type    red_maneuver_target
      friendly_type blue_maneuver_target
      flight_id     1
      id_flag       1
      
   end_processor
   
   execute at_time 20 sec absolute 
      double predictTime = 100;
      WsfSA_Processor saProc = (WsfSA_Processor)Processor("assessment");
      WsfDraw draw = WsfDraw();
      
      double levelTurnGees = 2;
      
      // Set the perceived entity
      WsfSA_EntityPerception perceivedEntity = saProc.PerceivedBandits()[0];
      
      # Forward
      {
         // Get a list of points to plot by running the prediction
         // at many time points in the future.
         Array<WsfGeoPoint> pointsToPlot = Array<WsfGeoPoint>();
         for (int time = 0; time <= predictTime; time += 5)
         {
            pointsToPlot.PushBack(
            saProc.ProjectPositionForward(time,
                                          perceivedEntity));
         }

         steadyPrediction.Set(pointsToPlot.Back());

         // Do the drawing here
         draw.SetLayer("predict_steady");
         draw.SetLineStyle("solid");
         draw.BeginPolyline();
         draw.SetColor(0.3, 0.3, 0.5);
         for (int i = 0; i < pointsToPlot.Size(); i += 1)
         {
            draw.Vertex(pointsToPlot.Get(i));
         }
         draw.End();
      }
      
      # Level turn left
      {
         // Get a list of points to plot by running the prediction
         // at many time points in the future.
         Array<WsfGeoPoint> pointsToPlot = Array<WsfGeoPoint>();
         for (int time = 0; time <= predictTime; time += 5)
         {
            pointsToPlot.PushBack(
            saProc.ProjectPositionLevelTurnLeft(time,
                                                perceivedEntity,
                                                levelTurnGees));
         }

         turnLeftPrediction.Set(pointsToPlot.Back());

         // Do the drawing here
         draw.SetLayer("predict_level_turn_left");
         draw.SetLineStyle("solid");
         draw.BeginPolyline();
         draw.SetColor(0.3, 0.3, 0.5);
         for (int i = 0; i < pointsToPlot.Size(); i += 1)
         {
            draw.Vertex(pointsToPlot.Get(i));
         }
         draw.End();
      }
      
      # Level turn right
      {
         // Get a list of points to plot by running the prediction
         // at many time points in the future.
         Array<WsfGeoPoint> pointsToPlot = Array<WsfGeoPoint>();
         for (int time = 0; time <= predictTime; time += 5)
         {
            pointsToPlot.PushBack(
            saProc.ProjectPositionLevelTurnRight(time,
                                                 perceivedEntity,
                                                 levelTurnGees));
         }

         turnRightPrediction.Set(pointsToPlot.Back());

         // Do the drawing here
         draw.SetLayer("predict_level_turn_right");
         draw.SetLineStyle("solid");
         draw.BeginPolyline();
         draw.SetColor(0.3, 0.3, 0.5);
         for (int i = 0; i < pointsToPlot.Size(); i += 1)
         {
            draw.Vertex(pointsToPlot.Get(i));
         }
         draw.End();
      }
      
      # Slice
      {
         double predictGees    = 2;     // Gees to use for prediction
         double predictAngle   = 135.0; // Angle to use for prediction
         double predictHeading = 45.0;  // Angle to use for prediction

         // Get a list of points to plot by running the prediction
         // at many time points in the future.
         Array<WsfGeoPoint> pointsToPlot = Array<WsfGeoPoint>();
         for (int time = 0; time <= predictTime; time += 5)
         {
            pointsToPlot.PushBack(
            saProc.ProjectPositionSlice(time,
                                        perceivedEntity,
                                        predictHeading,
                                        predictAngle,
                                        predictGees));
         }
         
         slicePrediction.Set(pointsToPlot.Back());

         // Do the drawing here
         draw.SetLayer("predict_slice");
         draw.SetLineStyle("solid");
         draw.BeginPolyline();
         draw.SetColor(0.3, 0.3, 0.5);
         for (int i = 0; i < pointsToPlot.Size(); i += 1)
         {
            draw.Vertex(pointsToPlot.Get(i));
         }
         draw.End();
      }
      
      # Turn to Heading
      {
         double predictGees    = 2;     // Gees to use for prediction
         double predictHeading = 145.0; // Heading to use for prediction

         // Get a list of points to plot by running the prediction
         // at many time points in the future.
         Array<WsfGeoPoint> pointsToPlot = Array<WsfGeoPoint>();
         for (int time = 0; time <= predictTime; time += 5)
         {
            pointsToPlot.PushBack(
            saProc.ProjectPositionTurnToHeading(time,
                                                perceivedEntity,
                                                predictHeading,
                                                predictGees));
         }

         turnToHeadingPrediction.Set(pointsToPlot.Back());

         // Do the drawing here
         draw.SetLayer("predict_turn_to_heading");
         draw.SetLineStyle("solid");
         draw.BeginPolyline();
         draw.SetColor(0.3, 0.3, 0.5);
         for (int i = 0; i < pointsToPlot.Size(); i += 1)
         {
            draw.Vertex(pointsToPlot.Get(i));
         }
         draw.End();
      }
      
      # Go to Point
      {
         double      predictGees  = 2; // Gees to use for prediction
         WsfGeoPoint predictPoint = WsfGeoPoint.Construct(1.0, 0.5, 10000.0);

         // Get a list of points to plot by running the prediction
         // at many time points in the future.
         Array<WsfGeoPoint> pointsToPlot = Array<WsfGeoPoint>();
         for (int time = 0; time <= predictTime; time += 5)
         {
            pointsToPlot.PushBack(
            saProc.ProjectPositionGoToPoint(time,
                                            perceivedEntity,
                                            predictPoint,
                                            predictGees));
         }

         goToPointPrediction.Set(pointsToPlot.Back());

         // Do the drawing here
         draw.SetLayer("predict_go_to_point");
         draw.SetLineStyle("solid");
         draw.BeginPolyline();
         draw.SetColor(0.3, 0.3, 0.5);
         for (int i = 0; i < pointsToPlot.Size(); i += 1)
         {
            draw.Vertex(pointsToPlot.Get(i));
         }
         draw.End();
      }
      
      # Split-S
      {
         double predictGees = 4; // Gees to use for prediction

         // Get a list of points to plot by running the prediction
         // at many time points in the future.
         Array<WsfGeoPoint> pointsToPlot = Array<WsfGeoPoint>();
         for (int time = 0; time <= predictTime; time += 5)
         {
            pointsToPlot.PushBack(
            saProc.ProjectPositionSplitS(time, perceivedEntity, predictGees));
         }

         splitEssPrediction.Set(pointsToPlot.Back());

         // Do the drawing here
         draw.SetLayer("predict_split_s");
         draw.SetLineStyle("solid");
         draw.BeginPolyline();
         draw.SetColor(0.3, 0.3, 0.5);
         for (int i = 0; i < pointsToPlot.Size(); i += 1)
         {
            draw.Vertex(pointsToPlot.Get(i));
         }
         draw.End();
      }
   end_execute
   
end_platform
```

- **演示要点**：演示 platform 的参数：side, commander, command_chain, heading, route, edit, execute

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, icon, side, radar_signature, position, heading, commander, 平台实例
- **出处**：`draw/draw_demo.txt:186-193`　（同签名共 5 处，另见 `draw/draw_demo.txt:195`、`draw/draw_demo.txt:204`、`new_guidance/scenarios/naval_ssm_test.txt:35`）
- **片段**：

```text
platform red_1 WSF_PLATFORM
  icon M1A1
  side red
  radar_signature  TARGET_RADAR_SIGNATURE
  position 31:18:21.61n 45:13:52.78e altitude 0.00 ft agl
  heading 280 deg
  commander SELF
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, radar_signature, position, heading, commander

### platform（bomb_demo_laydown）｜平台实例

- **关键词**：platform, side, position, heading, command_chain, comm, network_name, 平台实例
- **出处**：`suppressor/bomb_demo_laydown.txt:71-79`
- **片段**：

```text
platform 100_sam_regiment sam_regiment
  side red
  position 33:30:00.0n  36:00:00.0e altitude 1 m agl
  heading 90 deg
  command_chain red-net SELF
  comm red-net
    network_name red-net
  end_comm
end_platform
```

- **演示要点**：演示 platform 的参数：side, position, heading, command_chain, comm, network_name

### platform（run_tree）｜平台实例

- **关键词**：platform, icon, side, commander, route, position, heading, 平台实例
- **出处**：`behavior_tree/run_tree.txt:124-133`　（同签名共 2 处，另见 `behavior_tree/selector.txt:88`）
- **片段**：

```text
platform  Red_3  STRIKER
   icon        SU-27
   side        red
   commander   SELF
   route
    position 00:13:18.00n 02:25:34.00w altitude 30000.00 ft speed 450 kts
    position 00:13:18.00n 02:06:30.76e altitude 30000.00 ft
   end_route
   heading 90 deg
end_platform
```

- **演示要点**：演示 platform 的参数：icon, side, commander, route, position, heading

### platform（scenario_test_launch_computer）｜平台实例

- **关键词**：platform, indestructible, icon, side, commander, route, heading, 平台实例
- **出处**：`base_types/weapons/aam/scenario_test_launch_computer.txt:95-105`　（同签名共 2 处，另见 `base_types/weapons/aam/scenario_test_launch_computer.txt:108`）
- **片段**：

```text
platform Shooter STRIKER
   indestructible
   icon        F-22
   side        blue
   commander   blue-FL
   route
      position 0.6n 4.12e altitude 30000 ft msl speed 500 kts
      position 1.6n 4.12e altitude 30000 ft msl speed 500 kts
   end_route
   heading 0 deg
end_platform
```

- **演示要点**：演示 platform 的参数：indestructible, icon, side, commander, route, heading

### platform（jam_strobe_direction_finder）｜平台实例

- **关键词**：platform, side, commander, position, altitude, heading, sensor, 平台实例
- **出处**：`electronic_warfare/jam_strobe_direction_finder.txt:107-117`　（同签名共 3 处，另见 `electronic_warfare/jam_strobe_direction_finder.txt:119`、`electronic_warfare/jam_strobe_direction_finder.txt:131`）
- **片段**：

```text
platform radar_1 EW_RADAR
   side      red
   commander command_center
   position 36:00:24.602n 116:00:18.006w
   altitude  0.0 ft agl
   heading   90 deg

   sensor radar
      on
   end_sensor
end_platform
```

- **演示要点**：演示 platform 的参数：side, commander, position, altitude, heading, sensor

### platform（pm6_orbit_launch）｜平台实例

- **关键词**：platform, side, six_dof_ned_heading, six_dof_ned_pitch, six_dof_ned_roll, six_dof_position, six_dof_alt, 平台实例
- **出处**：`six_dof/pm6_orbit_launch.txt:49-59`
- **片段**：

```text
platform OrbiterWrongWay ORBITER-MAIN_PM6

   side dark_green

   six_dof_ned_heading -60 deg
   six_dof_ned_pitch   85 deg
   six_dof_ned_roll   180 deg
   six_dof_position 28.45 -80.55
   six_dof_alt        100 ft

end_platform
```

- **演示要点**：演示 platform 的参数：side, six_dof_ned_heading, six_dof_ned_pitch, six_dof_ned_roll, six_dof_position, six_dof_alt

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, side, icon, position, commander, add, track_manager, 平台实例
- **出处**：`fires/time_on_target.txt:240-251`
- **片段**：

```text
platform cmdr WSF_PLATFORM
  side red
  icon command_truck
   position 51:34:59.936n 00:18:39.311e
  commander SELF
  add processor cmdr_task_proc CMDR_TASK_PROC
  end_processor
  add comm perfect PERFECT
     processor cmdr_task_proc
  end_comm
  track_manager uncorrelated_track_drops off end_track_manager
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：side, icon, position, commander, add, track_manager

### platform（scenario1）｜平台实例

- **关键词**：platform, side, icon, indestructible, route, position, commander, 平台实例
- **出处**：`launcher/scenarios/scenario1.txt:9-20`
- **片段**：

```text
platform target1 AIRPLANE
   side Blue
   icon C-130
   indestructible
   route
    position 34:42:32n 76:52:56w altitude 4000 ft msl
      linear_acceleration 0.20 g
    position 36:03:28n 75:47:28w altitude 5000 ft msl
      speed 175 kts
   end_route
  commander SELF
end_platform
```

- **演示要点**：演示 platform 的参数：side, icon, indestructible, route, position, commander

### platform（targets）｜平台实例

- **关键词**：platform, side, indestructible, commander, position, route, heading, 平台实例
- **出处**：`electronic_warfare/test_false_targets/scenarios/targets.txt:16-28`　（同签名共 9 处，另见 `electronic_warfare/test_false_targets/scenarios/targets.txt:30`、`electronic_warfare/test_false_targets/scenarios/targets.txt:44`、`electronic_warfare/test_false_targets/scenarios/targets.txt:58`）
- **片段**：

```text
platform ucav_1 UCAV
   side blue
   indestructible
   commander SELF
   position 41:42:36n 113:27:36w altitude 35000 ft msl
   route
      position 41:42:36n 113:27:36w altitude 35000 ft msl
         speed 460 kts
      position 37:17:24n 113:27:36w altitude 35000 ft msl
         speed 460 kts
   end_route
   heading 180 deg
end_platform
```

- **演示要点**：演示 platform 的参数：side, indestructible, commander, position, route, heading

### platform（chaff_example_ttr）｜平台实例

- **关键词**：platform, side, position, altitude, heading, sensor, track, 平台实例
- **出处**：`chaff/chaff_example_ttr.txt:296-309`　（同签名共 3 处，另见 `electronic_warfare/closely_space_targets_ttr.txt:245`、`electronic_warfare/close_targets_ttr.txt:226`）
- **片段**：

```text
platform ttr-radar-site TTR_RADAR_SITE
   side red

   position 47:55:06.64n 120:07:57.54w
   altitude 0.0 ft agl
   heading   270 deg

   sensor ttr_radar
   end_sensor

   track
      platform blue_airlifter_jet
   end_track
end_platform
```

- **演示要点**：演示 platform 的参数：side, position, altitude, heading, sensor, track

### platform（track_error）｜平台实例

- **关键词**：platform, side, icon, indestructible, route, position, weapon, 平台实例
- **出处**：`electronic_warfare/track_error.txt:352-365`
- **片段**：

```text
platform target1 AIRPLANE
   side blue
   icon C-130
   indestructible
   route
    position 34:42:32n 76:52:56w altitude 4000 ft msl
      linear_acceleration 0.20 g
    position 36:03:28n 75:47:28w altitude 5000 ft msl
      speed 175 kts
   end_route
   weapon wpn
      on
   end_weapon
end_platform
```

- **演示要点**：演示 platform 的参数：side, icon, indestructible, route, position, weapon

### platform（output_file_demo）｜平台实例

- **关键词**：platform, position, side, icon, aux_data, route, speed, 平台实例
- **出处**：`example_scripts/output_file_demo.txt:128-141`
- **片段**：

```text
platform fighter_sensor_3 FIGHTER_SENSOR
   position 35:00:00.00n 60:00:00.00w altitude 40000.00 ft heading 180 deg
   side red
   icon fighter
   aux_data
      string outputFileName = "PixelCountTop.out"
   end_aux_data
   route
    position 35:00:00.00n 60:00:00.00w altitude 40000.00 ft
    speed 400 kts
    position 30:00:00.00n 60:00:00.00w altitude 40000.00 ft
    speed 400 kts
  end_route
end_platform
```

- **演示要点**：演示 platform 的参数：position, side, icon, aux_data, route, speed

### platform（test_maneuvers）｜平台实例

- **关键词**：platform, side, icon, commander, heading, route, edit, 平台实例
- **出处**：`timeline/scenarios/test_maneuvers.txt:175-189`　（同签名共 13 处，另见 `timeline/scenarios/test_maneuvers.txt:218`、`timeline/scenarios/test_maneuvers.txt:234`、`heatmap/scenarios/red_laydown.txt:15`）
- **片段**：

```text
platform blue_2 STRIKER
  side blue
  icon F-15
  commander flight_lead_blue
  heading 90 deg
  route
     position 38:49:11n 90:14:23.91w altitude 35000.00 ft msl
     position 38:49:11n 88:28:14.67w altitude 35000 feet
  end_route

  edit processor task_mgr
     off // Not using behavior tree in tests
  end_processor

end_platform
```

- **演示要点**：演示 platform 的参数：side, icon, commander, heading, route, edit

### platform（time_on_target）｜平台实例

- **关键词**：platform, icon, position, commander, add, track_manager, edit, 平台实例
- **出处**：`fires/time_on_target.txt:137-152`　（同签名共 5 处，另见 `fires/time_on_target.txt:154`、`fires/time_on_target.txt:171`、`fires/time_on_target.txt:188`）
- **片段**：

```text
platform 155mm_artillery-1 FIRES_155MM_ARTILLERY_M107_HE_EXPLICIT_LAUNCHER
   icon sa-10_launcher
   position 51:31:37.933n 00:26:08.630e
   commander cmdr
   add processor sub_task_proc SUB_TASK_PROC
   end_processor
   add comm perfect PERFECT
      processor sub_task_proc
   end_comm
   track_manager
      uncorrelated_track_drops off
   end_track_manager
   edit weapon fires_155MM_ARTILLERY_M107_HE
      off
   end_weapon
end_platform
```

- **演示要点**：演示 platform 的参数：icon, position, commander, add, track_manager, edit

### platform（two_more_shooters）｜平台实例

- **关键词**：platform, side, icon, commander, route, position, weapon, 平台实例
- **出处**：`shooter/scenarios/two_more_shooters.txt:10-27`　（同签名共 4 处，另见 `shooter/scenarios/two_more_shooters.txt:29`、`shooter/scenarios/with_awacs.txt:21`、`shooter/scenarios/simple_one_on_one.txt:9`）
- **片段**：

```text
platform shooter2 JET_AIRCRAFT
   side blue
   icon F-18
   commander SELF
   route
    position 38:18:24n 134:44:00e altitude 20000 ft agl
       speed 300 kts
    position 38:30:36n 135:34:00e altitude 20000 ft agl
       speed 300 kts
     position 39:00:36n 136:30:48e altitude 20000 ft agl
       speed 300 kts
   end_route

   weapon aa_mrm
      quantity 8
   end_weapon

end_platform
```

- **演示要点**：演示 platform 的参数：side, icon, commander, route, position, weapon

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, add, include, p6dof_set_velocity_ned_fps, p6dof_position, p6dof_alt, on_initialize2, 平台实例
- **出处**：`p6dof/generate_secondary_aero_file.txt:52-70`
- **片段**：

```text
platform TEST_PLATFORM WSF_PLATFORM

   add mover WSF_P6DOF_MOVER
      p6dof_object_type $<MOVER_TYPE:FA-LGT>$
   end_mover

   include p6dof_types/scripts/p6dof_testing_scripts.txt

   p6dof_set_velocity_ned_fps 100 0 0
   p6dof_position 0 0
   p6dof_alt 1000 ft

   on_initialize2
      writeln("Generating Autopilot Support File");
      CreateAutopilotSupportFile(PLATFORM, OUTPUT_FILE_NAME);
      writeln("Generating ", OUTPUT_FILE_NAME, " complete.");
   end_on_initialize2

end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：add, include, p6dof_set_velocity_ned_fps, p6dof_position, p6dof_alt, on_initialize2

### platform（launch_with_telemetry）｜平台实例

- **关键词**：platform, icon, side, commander, position, add, execute, 平台实例
- **出处**：`space_operations/scenarios/launch_with_telemetry.txt:49-67`
- **片段**：

```text
platform LAUNCHER LAUNCH_FACILITY
   icon Wedge
   side red
   commander SELF

   # Cape Canaveral, SLC-37 (Eastern Range Launch Site), inclinations 28-57
   position 28.531986n 80.566821w altitude 1 m agl heading 0 deg

   add weapon launcher DELTA_IV_M
      launch_computer WSF_ORBITAL_LAUNCH_COMPUTER
         leo_data ../launch_vehicles/delta_iv_m/delta_iv_m_ccafs_leo.txt
      end_launch_computer
      launched_platform_type DELTA_IV_M_MOD
   end_weapon

   execute at_time 1.0 sec absolute
      AttemptOrbitalLaunch(PLATFORM, "launcher", 402290.0, 28.6);
   end_execute
end_platform
```

- **演示要点**：演示 platform 的参数：icon, side, commander, position, add, execute

### platform（test_maneuvers）｜平台实例

- **关键词**：platform, side, position, commander, icon, heading, edit, 平台实例
- **出处**：`timeline/scenarios/test_maneuvers.txt:198-216`　（同签名共 2 处，另见 `timeline_lead/scenarios/full_laydown.txt:19`）
- **片段**：

```text
platform flight_lead_red FLIGHT_LEAD
  side red
  position 39:04:34.54n 85:14:39.03w
  commander SELF
  icon Command_Truck
  heading 220 deg

  edit processor task_mgr
     off // Not creating tasks in tests
     #show_task_messages
#     behavior_tree
#       behavior_node debug_quantum_tasker
#     end_behavior_tree
   end_processor

   edit processor timeline_data
      off // Not creating tasks in tests
   end_processor
end_platform
```

- **演示要点**：演示 platform 的参数：side, position, commander, icon, heading, edit

### platform（assignment_priority）｜平台实例

- **关键词**：platform, side, commander, position, aux_data, on_initialize2, edit, 平台实例
- **出处**：`iads_c2_demos/assignment_priority.txt:98-117`　（同签名共 2 处，另见 `iads_c2_demos/assignment_priority.txt:140`）
- **片段**：

```text
platform 13_sam_launcher SAM_LAUNCHER
   side red

   commander 10_iads_cmdr
   position 38:21:06n 117:28:44w altitude 0.0 m agl

   aux_data
      WsfBMAuxDataZoneAttachment iads_c2_zones
   end_aux_data

   on_initialize2
      WsfBMAuxDataZoneAttachment iads_c2_zones = WsfBMAuxDataZoneAttachment();
      iads_c2_zones.Add("global", 1.0, "defended_asset_zone", "DA");
      WsfBMUtils.SetZoneAuxData(PLATFORM, "iads_c2_zones", iads_c2_zones);
   end_on_initialize2

   edit weapon sam
      quantity 1
   end_weapon
end_platform
```

- **演示要点**：演示 platform 的参数：side, commander, position, aux_data, on_initialize2, edit

### platform（gps_denied）｜平台实例

- **关键词**：platform, side, command_chain, sensor, execute, route, heading, 平台实例
- **出处**：`satellite_demos/scenarios/gps_denied.txt:550-570`
- **片段**：

```text
platform awacs-1 AWACS
   side blue
   command_chain GOOD_GUYS SELF

   sensor esm-1
     on
   end_sensor
   execute at_time 5 minutes absolute
     # PLATFORM.TurnSensorOn("esm-1"); # Turn on the ground radar system instead...
   end_execute

   route
      label awacs_loiter
      position 42:07:45.70n 88:53:57.96w altitude 30000.00 ft speed 450 kts
      position 43:07:45.49n 88:54:57.67w
      position 43:07:45.64n 88:23:28.31w
      position 42:07:45.64n 88:23:29.35w
      goto awacs_loiter
   end_route
  heading 359 deg
end_platform
```

- **演示要点**：演示 platform 的参数：side, command_chain, sensor, execute, route, heading

### platform（script_demo_7）｜平台实例

- **关键词**：platform, side, command_chain, edit, sensor, execute, route, 平台实例
- **出处**：`script_demos/script_demo_7.txt:504-530`
- **片段**：

```text
platform awacs-1 AWACS
   side blue
   command_chain GOOD_GUYS SELF

   edit comm xmtr-1
      // Use perception based routing to send, even if not capable.
      // This ensures legacy behavior so that transmissions are sent
      // and the esm detection attempts occur.
      //link strike-1 rcvr-1
   end_comm

   sensor esm-1
     on
   end_sensor
   execute at_time 5 minutes absolute
     # PLATFORM.TurnSensorOn("esm-1"); # Turn on the ground radar system instead...
   end_execute

   route
      label awacs_loiter
      position 39n 90w altitude 30000 ft speed 450 kts
      position 40n 90w
      position 40n 89:30w
      position 39n 89:30w
      goto awacs_loiter
   end_route
end_platform
```

- **演示要点**：演示 platform 的参数：side, command_chain, edit, sensor, execute, route

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, side, icon, add, route, script_variables, on_initialize2, 平台实例
- **出处**：`route_finder_demos/scenario_route_finder_1.txt:39-88`
- **片段**：

```text
platform blue_1 WSF_PLATFORM
   side blue
   icon F-18E

   add mover WSF_AIR_MOVER
      update_interval 1 sec
      at_end_of_path stop
   end_mover

   route
      position 00.32462n 03.86294e altitude 10000 ft msl speed 250 m/s
      position 00.32462n 02.86294e altitude 10000 ft msl speed 250 m/s
   end_route

   script_variables
      WsfRouteFinder finder = WsfRouteFinder();
   end_script_variables

   on_initialize2

         finder.SetImpossibleRouteResponse("SHRINK");
        #finder.SetImpossibleRouteResponse("SHIFT");
        #finder.SetImpossibleRouteResponse("IGNORE");
         finder.SetMaxArcLength(4000); #a little over 2 nm (in meters)
         WsfGeoPoint src = PLATFORM.Location();
         WsfGeoPoint tgt = WsfSimulation.FindPlatform("target").Location();
         finder.Avoid(WsfGeoPoint.Construct( 0.46222, 2.87111, 0), 1852*20);

         finder.Avoid(WsfGeoPoint.Construct(-0.06667, 2.88222, 0), 1852*20);
         finder.Avoid(WsfGeoPoint.Construct( 0.91667, 3.16667, 0), 1852*20);
         ##different option than the previous two avoidances, to show "shrink" and "shift" responses
         #finder.Avoid(WsfGeoPoint.Construct(-0.62784, 3.33309, 0), 1852*100);
         #finder.Avoid(WsfGeoPoint.Construct( 0.91667, 3.16667, 0), 1852*80);
         ##extra to force a northern path
         #finder.Avoid(WsfGeoPoint.Construct( -1.07825, 3.19900, 0), 1852*50);
         ##extra to force a southern path
         #finder.Avoid(WsfGeoPoint.Construct( 2.00000, 3.20000, 0), 1852*100);

         finder.Avoid(WsfGeoPoint.Construct( 0.77000, 1.95833, 0), 1852*10);
        #finder.Avoid(WsfGeoPoint.Construct(-0.07333, 1.91500, 0), 1852*10);
         finder.Avoid(WsfGeoPoint.Construct(-0.13500, 1.91500, 0), 1852*10);
         WsfRoute path = finder.Route(TIME_NOW, src, tgt, 250); #250 met/sec ~500 knots

         PLATFORM.SetRoute(path);
         finder.DrawAvoidances(2000, Vec3.Construct(0.4, 0.4, 0.4));
         finder.DrawGraph(250, Vec3.Construct(0.0, 0.65, 0.0));   #only show whole graph for part of the time
         DrawRoute(path);
   end_on_initialize2

end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：side, icon, add, route, script_variables, on_initialize2

### platform（passive_detector_df_demo）｜平台实例

- **关键词**：platform, icon, side, commander, position, script_variables, execute, 平台实例
- **出处**：`sensor_demos/passive_detector_df_demo.txt:123-172`　（同签名共 2 处，另见 `sensor_demos/passive_detector_demo.txt:118`）
- **片段**：

```text
platform c4i C4I_PLATFORM
   icon c4i
   side red
   commander SELF

   position 38:30:00n 90:30:00w

   # ---------------------------------------------
   # Draw track for Tracks
   # ---------------------------------------------
   script_variables
      # Create a WsfDraw object.
      WsfDraw draw = WsfDraw();
   end_script_variables

   execute at_interval_of 10.0 s
      foreach (WsfTrack track in MasterTrackList())
      {
         if (track.IsValid())
         {
            string str = write_str("T=", (string)track.UpdateTime(), " Lat=", (string)track.Latitude(), " Lon=", (string)track.Longitude());
            #writeln("T=" + track.UpdateTime().ToString() + "Count=" + track.UpdateCount().ToString() + " SNR=" + (string)Math.LinearToDB(track.SignalToNoise()));
            #writeln(str);
            # use the track ID as a unique draw ID
            # a track icon and a line to the track icon
            # is drawn at each track update
            string trackId = track.TrackId().ToString();
            draw.SetId(trackId);
            draw.SetDuration(10.0); # this is faster than calling erase every time
            draw.SetColor(0,0,1);
            draw.BeginIcons(track.Heading(), "Wedge");
            draw.Vertex(track.CurrentLocation());
            draw.End();

            # Draw a line to the track
            draw.SetLineStyle("dashed");
            draw.BeginLines();
            draw.Vertex(PLATFORM);
            draw.Vertex(track.CurrentLocation());
            draw.End();

            # draw the text for the track
            string bearing = " Bearing: " + (string)track.Bearing() + " deg";
            draw.BeginText(str);
            draw.Vertex(track.CurrentLocation());
            draw.End();
         }
      }
   end_execute
end_platform
```

- **演示要点**：演示 platform 的参数：icon, side, commander, position, script_variables, execute

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, icon, side, add, maneuvering, execute, script, 平台实例
- **出处**：`space_operations/conjunction_avoidance.txt:66-129`
- **片段**：

```text
platform threat WSF_PLATFORM
   icon satellite
   side red

   add mover WSF_SPACE_MOVER
      eccentricity 0.001
      inclination 20.0 deg
      raan 0.0 deg
      semi_major_axis 16610 km
      true_anomaly 0 deg
      argument_of_periapsis 0.0 deg
   end_mover

   maneuvering simple
      delta_v 15 km/s
   end_maneuvering

   execute at_time 0.001 s absolute
      double initialDelay = 3600.0 * MATH.RandomUniform() + 1800.0;
      PLATFORM.ExecuteAtTime(initialDelay, "Intercept");
   end_execute

   script void Intercept()
      WsfTrackManager mgr = PLATFORM.TrackManager();
      mgr.AddTrackReport(WsfSimulation.FindPlatform("primary").MakeTrack());

      WsfSpaceMover mov = (WsfSpaceMover)PLATFORM.Mover();
      double remainingDeltaV = mov.AvailableDeltaV();

      Array<double> results = mov.ComputeIntercept(mgr.LocalTrackList().Get(0).TrackId(), 12.0 * 3600.0, remainingDeltaV, false);
      if (results.Size())
      {
         writeln("**** Threat: will intercept at time ", TIME_NOW + results[0]);
         WsfOrbitalManeuver itcpt = WsfInterceptManeuver.Construct(WsfOrbitalEventCondition.NONE(),
                                           WsfTargetPoint.ConstructFromTrack(mgr.LocalTrackList().Get(0).TrackId()),
                                           WsfInterceptManeuver.EARLIEST_TIME(),
                                           12.0 * 3600.0,
                                           remainingDeltaV);
         mov.ExecuteManeuver(itcpt);
         PLATFORM.ExecuteAtTime(TIME_NOW + results[0], "CheckIntercept");
      }
      else
      {
         writeln("**** Threat: Unable to compute intercept solution.");
      }
   end_script

   script void CheckIntercept()
      WsfPlatform target = WsfSimulation.FindPlatform("primary");
      if (target.IsValid())
      {
         double diff = Vec3.Subtract(target.LocationECI(), PLATFORM.LocationECI()).Magnitude();
         if (diff < 10.0)
         {
            writeln("**** Threat: Successful intercept!");
         }
         else
         {
            writeln("**** Threat: Failed intercept.");
         }
      }
   end_script

end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, add, maneuvering, execute, script

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, icon, side, command_chain, position, add, execute, 平台实例
- **出处**：`space_operations/conjunction_avoidance.txt:133-212`
- **片段**：

```text
platform ground-control WSF_PLATFORM
   icon c4i
   side blue
   command_chain BLUETEAM SELF
   position 28:39:18.251n 80:42:31.178w

   add comm perfect WSF_COMM_TRANSCEIVER
      network_name blue-radio
   end_comm

   add processor conj WSF_ORBITAL_CONJUNCTION_PROCESSOR
      update_interval 20 min

      search_interval 12.0 hr
      filter_cut_distance 5.0 km
      search_step_size 0.1 deg
      exclusion_factor 8.0
      default_variance 100.0 m
      default_object_size 1.0 m
      prediction_model default
      primary
         primary
      end_primary

      script void on_conjunction_predicted(Array<WsfOrbitalConjunctionReport> aReports)
         for (int i = 0; i < aReports.Size(); i += 1)
         {
            writeln("Ground Control: Possible Conjunction:");
            writeln("   Between: ", aReports[i].Primary(), " and ", aReports[i].Secondary());
            writeln("   Max. Probability: ", aReports[i].MaximumProbability());
            writeln("   Miss Distance: ", aReports[i].MissDistance(), " [m]");
            writeln("   Relative Velocity: ", aReports[i].RelativeVelocity(), " [m/s]");
            writeln("   Times: (", aReports[i].StartTime(), ", ", aReports[i].EndTime(), ")");
            writeln("   Closest Approach Time: ", aReports[i].MinimumTime());

            # If a conjunction is predicted, and there is not enough time between now and
            # the next assessment before the predicted conjunction, send a message to
            # 'primary'.
            double diff = aReports[i].MinimumTime() - TIME_NOW;
            bool betterHurry = diff < PROCESSOR.UpdateInterval();
            if (aReports[i].Primary() == "primary" && betterHurry)
            {
               WsfComm comm = PLATFORM.Comm("perfect");
               if (comm.IsValid())
               {
                  WsfStatusMessage msg = WsfStatusMessage();
                  msg.SetStatus("****** Watch out! ******");
                  comm.SendMessageToSubordinates("BLUETEAM", msg);
               }
               PROCESSOR.ExecuteScriptAtTime(aReports[i].MinimumTime(), "CheckMissDistance");
            }
         }
      end_script

      script void CheckMissDistance()
         WsfPlatform primary = WsfSimulation.FindPlatform("primary");
         WsfPlatform threat = WsfSimulation.FindPlatform("threat");
         if (primary.IsValid() && threat.IsValid())
         {
            double missDist = Vec3.Subtract(primary.LocationECI(), threat.LocationECI()).Magnitude();
            writeln("Ground Control: CONJUNCTION CHECK: Miss distance is ", missDist, " [m] *****");
         }
      end_script
   end_processor

   # Simulate 'sensors' periodically updating the tracking for the two objects.
   execute at_interval_of 10 min
      WsfTrackManager mgr = PLATFORM.TrackManager();
      WsfPlatform center = WsfSimulation.FindPlatform("primary");
      if (center.IsValid())
      {
         mgr.AddTrackReport(center.MakeTrack());
      }
      WsfPlatform threat = WsfSimulation.FindPlatform("threat");
      if (threat.IsValid())
      {
         mgr.AddTrackReport(threat.MakeTrack());
      }
   end_execute
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, command_chain, position, add, execute

### platform（many_blue_side）｜平台实例

- **关键词**：platform, commander, side, position, heading, icon, 平台实例
- **出处**：`ballistic_missile_shootdown/scenarios/many_blue_side.txt:58-64`　（同签名共 95 处，另见 `behavior_tree/sequence.txt:62`、`behavior_tree/sequence_with_memory.txt:62`、`brawler/brawler_demo_combined_agent_BVR_8v16.txt:298`）
- **片段**：

```text
platform blue_abm_ttr_01 BLUE_ABM_TTR
  commander blue_naval_sam_battery_01
  side blue
  position 39:43:46.64n 76:32:38.11w
  heading 340 deg
  icon Ground_Radar
end_platform
```

- **演示要点**：演示 platform 的参数：commander, side, position, heading, icon

### platform（brawler_demo_combined_agent）｜平台实例

- **关键词**：platform, indestructible, side, commander, heading, position, 平台实例
- **出处**：`brawler/brawler_demo_combined_agent.txt:30-36`　（同签名共 3 处，另见 `brawler/brawler_demo_combined_agent_BVR.txt:38`、`brawler/brawler_demo_1v1.txt:56`）
- **片段**：

```text
platform blue_1 COMBINED_PLATFORM
   indestructible
   side blue
   commander blue_cmdr
   heading 360 deg
   position 00:01:50.00s 00:00:25.00w  altitude 10000.00 ft
end_platform
```

- **演示要点**：演示 platform 的参数：indestructible, side, commander, heading, position

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, spatial_domain, icon, side, position, heading, 平台实例
- **出处**：`p6dof/unguided_rocket_test.txt:212-218`　（同签名共 3 处，另见 `six_dof/pm6_unguided_rocket_test.txt:194`、`six_dof/rb6_unguided_rocket_test.txt:196`）
- **片段**：

```text
platform target WSF_PLATFORM
   spatial_domain land
   icon           tank
   side           red
   position  21.341944n 157.940039w  altitude 45.0 ft
   heading   205 deg
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：spatial_domain, icon, side, position, heading

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, category, icon, side, commander, position, 平台实例
- **出处**：`satellite_demos/scenarios/comm_satellite.txt:47-53`
- **片段**：

```text
platform COMMANDER-1 WSF_PLATFORM
   category ground_station
   icon C4I
   side blue
   commander SELF
   position 41:58:46.500N 087:54:16.100W altitude 2 m agl
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：category, icon, side, commander, position

### platform（othTest）｜平台实例

- **关键词**：platform, side, route, position, altitude, heading, 平台实例
- **出处**：`oth_radar/othTest.txt:116-123`　（同签名共 3 处，另见 `gun_engagement/scenarios/gun_scenario_test.txt:10`、`wargame/scenario/laydowns/purple.txt:92`）
- **片段**：

```text
platform oth-radar-site-1 OTH_RADAR_SITE
  side red
  route
    position 56:45n 126:38w
    altitude 0 ft agl
    heading 180 deg
  end_route
end_platform
```

- **演示要点**：演示 platform 的参数：side, route, position, altitude, heading

### platform（acoustic_demo）｜平台实例

- **关键词**：platform, side, heading, route, position, speed, 平台实例
- **出处**：`acoustic/acoustic_demo.txt:156-164`　（同签名共 9 处，另见 `acoustic/acoustic_demo2.txt:274`、`acoustic/acoustic_demo2.txt:284`、`acoustic/acoustic_demo2.txt:294`）
- **片段**：

```text
platform player-2 ACOUSTIC_TARGET
  side blue
  heading 360 deg
  route
    position 29:30:56.33n 29:54:21.23e altitude 1500.00 ft
    speed 100 kts
    position 30:40:36.42n 29:54:21.23e altitude 1500.00 ft
  end_route
end_platform
```

- **演示要点**：演示 platform 的参数：side, heading, route, position, speed

### platform（many_blue_side）｜平台实例

- **关键词**：platform, commander, side, icon, position, weapon, 平台实例
- **出处**：`ballistic_missile_shootdown/scenarios/many_blue_side.txt:17-25`
- **片段**：

```text
platform blue_naval_sam_launcher_01 BLUE_NAVAL_SAM_LAUNCHER
  commander blue_naval_sam_battery_01
  side blue
  icon PAC-3_Launcher
  position 39:44:35.76n 76:33:10.07w
  weapon blue_naval_sam
     quantity 4
  end_weapon
end_platform
```

- **演示要点**：演示 platform 的参数：commander, side, icon, position, weapon

### platform（sensor_demo）｜平台实例

- **关键词**：platform, icon, multiresolution_sensor, side, position, heading, 平台实例
- **出处**：`multiresolution_demos/sensor_demo.txt:81-89`
- **片段**：

```text
platform mr_sensor_site MR_SENSOR_SITE
   icon Ground_Radar
   multiresolution_sensor mr_sensor
      fidelity 1 # Adjust to swap sensors 
   end_multiresolution_sensor
   side blue
   position 40n 90w
   heading 0 deg
end_platform
```

- **演示要点**：演示 platform 的参数：icon, multiresolution_sensor, side, position, heading

### platform（beidou）｜平台实例

- **关键词**：platform, designator, revs_per_day, inclination, raan, anomaly, 平台实例
- **出处**：`satellite_demos/satellites/orbit_nominal/beidou.txt:23-31`　（同签名共 27 处，另见 `satellite_demos/satellites/orbit_nominal/beidou.txt:33`、`satellite_demos/satellites/orbit_nominal/beidou.txt:43`、`satellite_demos/satellites/orbit_nominal/beidou.txt:53`）
- **片段**：

```text
platform MEO11 BEIDOU
edit mover
   designator MEO11
   revs_per_day 2.1333333
   inclination 55 deg
   raan 120 deg
   anomaly 45 deg
end_mover
end_platform
```

- **演示要点**：演示 platform 的参数：designator, revs_per_day, inclination, raan, anomaly

### platform（pm6_orbit_launch）｜平台实例

- **关键词**：platform, six_dof_ned_heading, six_dof_ned_pitch, six_dof_ned_roll, six_dof_position, six_dof_alt, 平台实例
- **出处**：`six_dof/pm6_orbit_launch.txt:37-45`
- **片段**：

```text
platform Orbiter ORBITER-MAIN_PM6

   six_dof_ned_heading 60 deg
   six_dof_ned_pitch   85 deg
   six_dof_ned_roll   180 deg
   six_dof_position 28.45 -80.55
   six_dof_alt        100 ft

end_platform
```

- **演示要点**：演示 platform 的参数：six_dof_ned_heading, six_dof_ned_pitch, six_dof_ned_roll, six_dof_position, six_dof_alt

### platform（run_tree）｜平台实例

- **关键词**：platform, side, icon, heading, commander, route, 平台实例
- **出处**：`behavior_tree/run_tree.txt:101-110`　（同签名共 11 处，另见 `behavior_tree/run_tree.txt:112`、`behavior_tree/selector.txt:38`、`behavior_tree/selector.txt:50`）
- **片段**：

```text
platform  Red_1  STRIKER
   side red
   icon SU-27
   heading 90 deg
   commander   SELF
   route
      position 00:00:52.00n 02:09:34.00w altitude 30000 ft speed 450 kts
      position 00:00:52.00n 02:16:38.46e altitude 30000 ft speed 450 kts
   end_route
end_platform
```

- **演示要点**：演示 platform 的参数：side, icon, heading, commander, route

### platform（othTest）｜平台实例

- **关键词**：platform, route, position, extrapolate, side, heading, 平台实例
- **出处**：`oth_radar/othTest.txt:125-134`　（同签名共 6 处，另见 `oth_radar/othTest.txt:151`、`space_operations/scenarios/over_the_horizon_radar.txt:124`、`space_operations/scenarios/over_the_horizon_radar.txt:150`）
- **片段**：

```text
platform striker-1 STRIKER_PLATFORM
  route
    position 11n 127w altitude 35 kft msl heading 0 deg speed 450 kts
    extrapolate
  end_route

  side blue

  heading 90 deg
end_platform
```

- **演示要点**：演示 platform 的参数：route, position, extrapolate, side, heading

### platform（scenario_route_finder_2）｜平台实例

- **关键词**：platform, indestructible, icon, side, commander, route, 平台实例
- **出处**：`route_finder_demos/scenario_route_finder_2.txt:32-41`
- **片段**：

```text
platform  blue_1  STRIKER
   indestructible
   icon        F-22
   side        blue
   commander   blue_lead
   route
      position 0.75n 4.29e altitude 30000 ft msl speed 450 kts
      position 0.75n 2.56e altitude 30000 ft msl speed 450 kts
   end_route
end_platform
```

- **演示要点**：演示 platform 的参数：indestructible, icon, side, commander, route

### platform（chaff_example）｜平台实例

- **关键词**：platform, side, position, altitude, heading, sensor, 平台实例
- **出处**：`chaff/chaff_example.txt:192-202`　（同签名共 2 处，另见 `electronic_warfare/ft_track_plot.txt:523`）
- **片段**：

```text
platform ew-radar-site EW_RADAR_SITE
   side red

   position 47:55:06.64n 120:07:57.54w
   altitude 0.0 ft agl
   heading   270 deg

   sensor ew_radar
      on
   end_sensor
end_platform
```

- **演示要点**：演示 platform 的参数：side, position, altitude, heading, sensor

### platform（ciws_test）｜平台实例

- **关键词**：platform, side, position, route, heading, icon, 平台实例
- **出处**：`ciws/scenarios/ciws_test.txt:10-20`
- **片段**：

```text
platform air_target1 AIR_TARGET 
   side red
   position 00:01:03.77n 00:00:00.00e
   route
      position 00:01:03.77n 00:00:00.00e altitude 100 m msl speed 480 knots
      position 00:00:00.00n 00:00:00.00e
   end_route
   heading 180 deg

  icon F-35
end_platform
```

- **演示要点**：演示 platform 的参数：side, position, route, heading, icon

### platform（ttr_test）｜平台实例

- **关键词**：platform, indestructible, side, commander, route, sensor, 平台实例
- **出处**：`iads/ttr_test.txt:111-121`
- **片段**：

```text
platform 100_ucav UCAV
   indestructible
   side blue
   commander SELF
   route
     navigation
        position 40:00:00n 89:00:00w altitude 35000 ft heading 270 deg speed 400 kts
     end_navigation
   end_route
   sensor esm off end_sensor
end_platform
```

- **演示要点**：演示 platform 的参数：indestructible, side, commander, route, sensor

### platform（unguided_rocket_test）｜平台实例

- **关键词**：platform, update_interval, spatial_domain, icon, side, route, 平台实例
- **出处**：`p6dof/unguided_rocket_test.txt:200-210`　（同签名共 3 处，另见 `six_dof/pm6_unguided_rocket_test.txt:182`、`six_dof/rb6_unguided_rocket_test.txt:184`）
- **片段**：

```text
platform strike_fighter FA-LGT-UNGUIDED_ROCKET
   update_interval 0.01 sec
   spatial_domain air 
   icon  f16
   side  blue
   route
     position  21.28n  157.940w  altitude 6000.0 ft   speed  450.0 kts
     position  21.38n  157.940w  altitude 6000.0 ft   speed  450.0 kts
   end_route
   
end_platform
```

- **演示要点**：演示 platform 的参数：update_interval, spatial_domain, icon, side, route

### platform（passive_detector_demo）｜平台实例

- **关键词**：platform, icon, side, commander, position, sensor, 平台实例
- **出处**：`sensor_demos/passive_detector_demo.txt:193-203`　（同签名共 4 处，另见 `sensor_demos/passive_detector_demo.txt:205`、`sensor_demos/passive_detector_df_demo.txt:196`、`sensor_demos/passive_detector_df_demo.txt:208`）
- **片段**：

```text
platform arch RCVR_PLATFORM
   icon c4i
   side red

  commander c4i

   position 38:37:29n 90:11:05w
   sensor rcvr
      location 0 0 -630 ft
   end_sensor
end_platform
```

- **演示要点**：演示 platform 的参数：icon, side, commander, position, sensor

### platform（ground_segment）｜平台实例

- **关键词**：platform, commander, side, icon, position, comm, 平台实例
- **出处**：`space_operations/scenarios/ground_segment.txt:13-23`
- **片段**：

```text
platform commander1 UPLINK
  commander SELF
  side blue
  icon cmd_post
  position 38.7372n 104.8808w

  comm uplink
     network_name commander1
  end_comm
  
end_platform
```

- **演示要点**：演示 platform 的参数：commander, side, icon, position, comm

### platform（iads_laydown_vegas）｜平台实例

- **关键词**：platform, side, icon, commander, position, edit, 平台实例
- **出处**：`iads/scenarios/iads_laydown_vegas.txt:28-39`　（同签名共 22 处，另见 `iads/scenarios/iads_laydown_vegas.txt:41`、`iads/scenarios/iads_laydown_vegas.txt:54`、`iads/scenarios/iads_laydown_vegas.txt:67`）
- **片段**：

```text
platform 200_ew_radar EW_RADAR
  side red
  icon Ground_Radar
  commander 100_radar_company
  position 38:00:54n 114:52:03w  altitude 0.0 m agl

  edit sensor ew_radar
     transmitter
        frequency  150.0 mhz
     end_transmitter
  end_sensor
end_platform
```

- **演示要点**：演示 platform 的参数：side, icon, commander, position, edit

### platform（light_attack_initial）｜平台实例

- **关键词**：platform, side, commander, heading, position, processor, 平台实例
- **出处**：`laser_designator/scenarios/light_attack_initial.txt:10-21`
- **片段**：

```text
platform blue_ground_troop-JTAC SOLDIER_JTAC
  side blue
  commander SELF
  heading 265 deg
  position 45:02:22.16n 121:47:56.00w altitude 10.00 ft agl
  #position 45:02:20.88n 121:47:56.93w altitude 12.00 ft agl
  processor CMDR_TASK_MGR
     script_variables
        DRAW_DESIGNATE_BEAM  = true; # draws the lasing beam from the forward observer
     end_script_variables
  end_processor
end_platform
```

- **演示要点**：演示 platform 的参数：side, commander, heading, position, processor

### platform（time_on_target）｜平台实例

- **关键词**：platform, icon, position, add, commander, edit, 平台实例
- **出处**：`fires/time_on_target.txt:222-234`
- **片段**：

```text
platform 240mm_rocket-1 FIRES_240MM_ROCKET_EXPLICIT_LAUNCHER
   icon sa-10_launcher
   position 51:32:25.853n 00:19:54.361e
   add processor sub_task_proc SUB_TASK_PROC
   end_processor
   add comm perfect PERFECT
      internal_link sub_task_proc
   end_comm
   commander cmdr
   edit weapon fires_240mm_rocket
      off
   end_weapon
end_platform
```

- **演示要点**：演示 platform 的参数：icon, position, add, commander, edit

### platform（output_file_demo）｜平台实例

- **关键词**：platform, position, side, icon, aux_data, route, 平台实例
- **出处**：`example_scripts/output_file_demo.txt:96-109`　（同签名共 2 处，另见 `example_scripts/output_file_demo.txt:112`）
- **片段**：

```text
platform fighter_sensor_1 FIGHTER_SENSOR
   position 30:00:00.00n 55:00:00.00w altitude 20000.00 ft heading 270 deg
   side red
   icon fighter
   aux_data
      string outputFileName = "PixelCountSide.out"
   end_aux_data
   route
     position 30:00:00.00n 55:00:00.00w altitude 20000.00 ft
     speed 400 kts
     position 30:00:00.00n 60:00:00.00w altitude 20000.00 ft
     speed 400 kts
   end_route
end_platform
```

- **演示要点**：演示 platform 的参数：position, side, icon, aux_data, route

### platform（six_dof_generate_secondary_aero_file）｜平台实例

- **关键词**：platform, include, six_dof_set_velocity_ned_fps, six_dof_position, six_dof_alt, on_initialize2, 平台实例
- **出处**：`six_dof/six_dof_generate_secondary_aero_file.txt:53-67`
- **片段**：

```text
platform TEST_PLATFORM $<PLATFORM_TYPE:FA-LGT_PM6>$

   include scripts/six_dof_testing_scripts.txt

   six_dof_set_velocity_ned_fps 100 0 0
   six_dof_position 0 0
   six_dof_alt 1000 ft

   on_initialize2
      writeln("Generating Autopilot Support File");
      CreateAutopilotSupportFile(PLATFORM, OUTPUT_FILE_NAME);
      writeln("Generating ", OUTPUT_FILE_NAME, " complete.");
   end_on_initialize2

end_platform
```

- **演示要点**：演示 platform 的参数：include, six_dof_set_velocity_ned_fps, six_dof_position, six_dof_alt, on_initialize2

### platform（red_air_strike）｜平台实例

- **关键词**：platform, side, icon, heading, track, alternate_locations, 平台实例
- **出处**：`alternate_locations/scenarios/red_air_strike.txt:48-63`　（同签名共 4 处，另见 `alternate_locations/scenarios/red_air_strike.txt:65`、`alternate_locations/scenarios/red_air_strike.txt:10`、`alternate_locations/scenarios/red_air_strike.txt:29`）
- **片段**：

```text
platform uav-3 UCAV
  side red
  icon UCAV
#  position 30:06:59.68n 78:59:23.29w altitude 35000.00 ft
  heading 271 deg
  
  track platform target_3 end_track
  track platform target_4 end_track
  
  # refers to uav-1 for location
  alternate_locations
     location 30:06:59.68n 78:59:23.29w altitude 35000.00 ft 
     location 30:15n   78:50w altitude 35000 ft
     location 30:10n   79:30w altitude 35000 ft reference uav-1
  end_alternate_locations
end_platform
```

- **演示要点**：演示 platform 的参数：side, icon, heading, track, alternate_locations

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, icon, side, position, add, execute, 平台实例
- **出处**：`space_operations/launch_vehicles/saturn_v/complex_test.txt:58-73`　（同签名共 10 处，另见 `space_operations/launch_vehicles/saturn_v/simple_test.txt:59`、`space_operations/launch_vehicles/proton_m/test.txt:29`、`space_operations/launch_vehicles/atlas_v_401/test.txt:26`）
- **片段**：

```text
platform launcher WSF_PLATFORM
   icon Wedge
   side blue

   # Altitude is the midpoint of the rocket. This is what the time history files have.
   position 28.608422n 80.604133w altitude 59 m msl heading 72.058 deg

   add weapon rocket SATURN_V
      launched_platform_type SATURN_V_MOD
   end_weapon

   execute at_time 0.3 sec relative
      WeaponEntry(0).Fire();
   end_execute

end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, position, add, execute

### platform（analysis_map-ucav-wet）｜平台实例

- **关键词**：platform, side, commander, position, heading, execute, 平台实例
- **出处**：`sensor_plot/radar/analysis_map-ucav-wet.txt:32-47`　（同签名共 2 处，另见 `sensor_plot/radar/analysis_map-ucav-wet.txt:49`）
- **片段**：

```text
platform 100_soj SOJ
   side blue
   commander SELF

      #position 40:43:48.000n 116:30:48.000w altitude 35000 ft msl
      #   speed 450 kts
   position 39:48:36.000n 117:37:48.000w altitude 35000 ft msl

   heading 221.0 deg

   execute at_time 0.001 minutes absolute
      WsfWeapon jammer = PLATFORM.Weapon("vhf_jammer");
      // Any of the jamming routines can be used at this point
      jammer.StartJamming(200000000., 100000000.);
   end_execute
end_platform
```

- **演示要点**：演示 platform 的参数：side, commander, position, heading, execute

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, icon, side, position, spatial_domain, add, 平台实例
- **出处**：`sensor_demos/clutter_demo.txt:101-119`
- **片段**：

```text
platform ship_ew WSF_PLATFORM
   icon Cruiser
   side green
   position 39n 90w

   # The clutter model for this platform will use the sea-based parameters
   # because this platforms 'spatial domain' is 'surface'. It can be explicitly
   # defined as such using the 'spatial_domain surface' command OR it will be
   # implicitly define as such by having a mover derived from WSF_SURFACE_MOVER.

   spatial_domain surface
   #add mover WSF_SURFACE_MOVER
   #end_mover

   add sensor ew_radar EW_RADAR
      on
      ignore_same_side
   end_sensor
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, position, spatial_domain, add

### platform（fuel_table_demo）｜平台实例

- **关键词**：platform, icon, update_interval, route, edit, execute, 平台实例
- **出处**：`example_scripts/fuel_table_demo.txt:73-92`
- **片段**：

```text
platform FUEL_FLYER FUEL_TEST_TYPE
   icon kc-135
   
   update_interval 0.01 sec
   route
      position 0n 0e altitude 30000 ft speed 300 kts
      position 1n 0e altitude  5000 ft speed 600 kts
   end_route
   edit fuel
      mode MACH_MODE     #with this route, goes from 2.72 to 5.65
     #mode MPS_MODE      #with this route, goes from 2.01 to 4.79
     #mode CONSTANT_MODE #always 4
   end_fuel
   execute at_interval_of 10 sec
      WsfFuel fuel = PLATFORM.Fuel();
      if (fuel.IsValid())
         writeln("T=",TIME_NOW,", ",PLATFORM.Name(), " fuel rate = ", fuel.ConsumptionRate());
   end_execute

end_platform
```

- **演示要点**：演示 platform 的参数：icon, update_interval, route, edit, execute

### platform（script_demo_5）｜平台实例

- **关键词**：platform, side, command_chain, sensor, execute, route, 平台实例
- **出处**：`script_demos/script_demo_5.txt:408-427`　（同签名共 2 处，另见 `script_demos/script_demo_6.txt:408`）
- **片段**：

```text
platform awacs-1 AWACS
   side blue
   command_chain GOOD_GUYS SELF

   sensor esm-1
     on
   end_sensor
   execute at_time 5 minutes absolute
     # PLATFORM.TurnSensorOn("esm-1"); # Turn on the ground radar system instead...
   end_execute

   route
      label awacs_loiter
      position 39n 90w altitude 30000 ft speed 450 kts
      position 40n 90w
      position 40n 89:30w
      position 39n 89:30w
      goto awacs_loiter
   end_route
end_platform
```

- **演示要点**：演示 platform 的参数：side, command_chain, sensor, execute, route

### platform（ttr_test）｜平台实例

- **关键词**：platform, side, commander, position, zone, processor, 平台实例
- **出处**：`iads/ttr_test.txt:60-80`
- **片段**：

```text
platform 2900_large_sam_battalion LARGE_SAM_BATTALION
   side red
   #commander SELF
   commander 100_iads_cmdr
   position 40:00:00n 90:00:00w altitude 0.0 m agl

   zone battalion_sector
      circular maximum_radius 100 nm
   end_zone

#   delete processor task_mgr
#   add processor task_mgr TEST_LARGE_SAM_BATTALION_TASK_MGR
#   end_processor

   processor task_mgr
     show_task_messages
     show_state_transitions
#     operating_level ENGAGE 1
   end_processor

end_platform
```

- **演示要点**：演示 platform 的参数：side, commander, position, zone, processor

### platform（delegate_battle_manager）｜平台实例

- **关键词**：platform, side, commander, position, add, script, 平台实例
- **出处**：`iads_c2_demos/delegate_battle_manager.txt:158-178`
- **片段**：

```text
platform 2940_sam_launcher SAM_LAUNCHER
   side red

   commander 2900_sam_battalion
   position 38:21:26n 117:28:44w altitude 0.0 m agl

   add weapon sam_three SAM
      quantity 2
      weapon_effects HIGH_PK_SAM_EFFECT
      aux_data
         double pK = 0.9
     end_aux_data
   end_weapon

   # Intercept calculator
   script WsfBMInterceptCalcResult can_intercept(WsfWeapon weapon, WsfTrack track)
      WsfBMInterceptCalcResult result = SAM_LaunchComputer(track, weapon.Platform(), "no-zone", 0, weapon.AuxDataDouble("pK"));

      return result;
   end_script
end_platform
```

- **演示要点**：演示 platform 的参数：side, commander, position, add, script

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, side, icon, add, route, on_initialize2, 平台实例
- **出处**：`route_finder_demos/zone_route_finder_1.txt:41-61`　（同签名共 2 处，另见 `route_finder_demos/zone_route_finder_2.txt:43`）
- **片段**：

```text
platform  router  WSF_PLATFORM
   side blue
   icon F-18
   add mover WSF_AIR_MOVER
      at_end_of_path stop
   end_mover
   route
      position 15:31:04s 49:02:50e altitude 35000 ft msl speed 250 m/s
   end_route
   on_initialize2
      WsfZoneRouteFinder finder = WsfZoneRouteFinder();
      finder.AvoidZone("crown_zone");   #avoid zone by name
      WsfZone polyZone = WsfZone.FindZone("poly_zone");
      finder.AvoidZone(polyZone);       #avoid zone by script object
      WsfGeoPoint tgt = WsfSimulation.FindPlatform("target").Location();
      WsfRoute path = finder.RouteAroundZones(PLATFORM.Location(), tgt, 250);
      finder.DrawAvoidances(1200,Vec3.Construct(0,0,0));
      finder.DrawGraph(200,Vec3.Construct(0,0.8,0));
      PLATFORM.SetRoute(path);
   end_on_initialize2
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：side, icon, add, route, on_initialize2

### platform（script_demo_5）｜平台实例

- **关键词**：platform, side, command_chain, route, weapon, heading, 平台实例
- **出处**：`script_demos/script_demo_5.txt:429-449`　（同签名共 4 处，另见 `script_demos/script_demo_6.txt:429`、`script_demos/script_demo_7.txt:532`、`satellite_demos/scenarios/gps_denied.txt:572`）
- **片段**：

```text
platform strike-1 FIGHTER_BOMBER
   side blue
   command_chain GOOD_GUYS awacs-1
   route
      label Loiter_Cap
      position 38:42:04.0n 90:32:08.0w altitude 15000 ft agl speed 250 kts
      position 38:48:00.0n 90:31:20.0w altitude 15000 ft agl speed 270 kts
      position 38:52:12n 90:30:36w altitude 15000 ft speed 400 kts
      position 39:02:36n 90:25:18w altitude 15000 ft
      position 38:59:48n 90:10:48w
      position 38:50:18n 90:06:42w altitude 11000 ft speed 250 kts
      position 38:37:48.0n 90:13:12.0w altitude 11000 ft agl speed 120 kts
      goto Loiter_Cap
   end_route

   weapon bomb_1000
      quantity 4
      firing_interval 1 sec
   end_weapon
  heading 6 deg
end_platform
```

- **演示要点**：演示 platform 的参数：side, command_chain, route, weapon, heading

### platform（missile_comparison）｜平台实例

- **关键词**：platform, update_interval, icon, side, route, execute, 平台实例
- **出处**：`p6dof/missile_comparison.txt:205-226`　（同签名共 3 处，另见 `six_dof/pm6_missile_comparison.txt:235`、`six_dof/rb6_missile_comparison.txt:235`）
- **片段**：

```text
platform blue_fighter BLUE_FIGHTER_WITH_MISSILES

   update_interval 0.01 sec
   
   icon  f16
   side  blue

   route
     position 21.225n 157.94w  altitude 24000.0 ft  speed 600.0 kts
     position 21.225n 157.25w  altitude 24000.0 ft  speed 600.0 kts
   end_route
   
   execute at_time 9.0 sec absolute
      writeln("blue_fighter cranks right...");
      PLATFORM.TurnToHeading(140.0);
   end_execute

   execute at_time 22.0 sec absolute
      PLATFORM.TurnToHeading(40.0);
   end_execute

end_platform
```

- **演示要点**：演示 platform 的参数：update_interval, icon, side, route, execute

### platform（alv_demo）｜平台实例

- **关键词**：platform, side, command_chain, route, heading, add, 平台实例
- **出处**：`alv_routing/alv_demo.txt:83-105`　（同签名共 2 处，另见 `alv_routing/alv_demo_with_jammer.txt:86`）
- **片段**：

```text
platform strike-1 FIGHTER_BOMBER
   side blue
   command_chain GOOD_GUYS awacs-1

   route
      label Loiter_Cap
      position 39:12:32.96n 83:59:04.84w altitude 40000.00 ft msl speed 250 kts
      position 39:18:28.95n 83:58:21.90w altitude 40000.00 ft agl speed 270 kts
      position 39:22:40.95n 83:57:37.59w altitude 40000.00 ft speed 400 kts
      position 39:33:04.96n 83:52:17.31w altitude 40000.00 ft
      position 39:30:16.95n 83:37:40.98w
      position 39:20:46.95n 83:33:33.22w altitude 40000.00 ft speed 250 kts
      position 39:08:16.96n 83:40:06.06w altitude 40000.00 ft agl speed 220 kts
      goto Loiter_Cap
   end_route

  heading 5 deg

  add weapon alv ALV_WEAPON
     quantity 2
     firing_interval 4 sec
  end_weapon
end_platform
```

- **演示要点**：演示 platform 的参数：side, command_chain, route, heading, add

### platform（blue_laydown）｜平台实例

- **关键词**：platform, side, icon, commander, route, edit, 平台实例
- **出处**：`heatmap/scenarios/blue_laydown.txt:88-111`
- **片段**：

```text
platform cap_escort STRIKER
  side blue
  icon F-18
  commander flight_lead
  route
     position 16:32:39.05s 49:35:51.80e altitude 35000.00 ft
     insert_route cap_orbit reference_heading  0.0 deg
  end_route
  edit processor task_mgr
     edit behavior engage_weapon_task_target
        script_variables
           DefaultPercentRangeMax = 0.85;
        end_script_variables
     end_behavior
     edit behavior escort
        script_variables
           mDrawEscortData = true;
           mEscortNames.PushBack("cap_1");
           mEscortProtectDistance = 5.0 * MATH.M_PER_NM();
           mEscortChaseDistance   = 10.0 * MATH.M_PER_NM();
        end_script_variables
     end_behavior
  end_processor
end_platform
```

- **演示要点**：演示 platform 的参数：side, icon, commander, route, edit

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, icon, side, radar_signature, add, execute, 平台实例
- **出处**：`cyber/exfiltrate_demo/MITM_exfiltrate_demo.txt:47-76`
- **片段**：

```text
platform blue_cyber_awacs WSF_PLATFORM
   icon awacs
   side blue
   
   radar_signature basic_plane
   
   add mover WSF_AIR_MOVER
      route 
         label start
         position 38:04:17.28n 110:13:06.09w altitude 35000 ft
            speed 460 kts
         position 38:32:27n 111:33:41w
            altitude 35000 ft
         position 39:35:42n 110:28:34w
         position 38:12:12n 110:14:21w 
         goto start
      end_route
   end_mover
   
   add processor data_proc WSF_TRACK_PROCESSOR 
   end_processor
   
   add comm exfiltrate_comm WSF_COMM_RCVR
      internal_link data_proc
   end_comm
   
   execute at_time 1 s absolute
      PLATFORM.CyberAttack(WsfSimulation.FindPlatform("10_iads_cmdr"), "EXFILTRATE");
   end_execute
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, radar_signature, add, execute

### platform（external_fuel_tank_test1）｜平台实例

- **关键词**：platform, update_interval, side, route, follow_vertical_track, execute, 平台实例
- **出处**：`p6dof/external_fuel_tank_test1.txt:40-69`　（同签名共 6 处，另见 `six_dof/pm6_external_fuel_tank_test1.txt:40`、`six_dof/rb6_external_fuel_tank_test1.txt:40`、`p6dof/external_fuel_tank_test1.txt:71`）
- **片段**：

```text
platform p6dof_1 FA-LGT
   update_interval 0.01 sec
   side blue
   route
      position   21.310n  158.50w  altitude 6000.0 ft  speed 450.0 kts
      position   21.310n  157.65w  altitude 6000.0 ft  speed 450.0 kts
      position   21.910n  157.65w  altitude 6000.0 ft  speed 450.0 kts
      position   21.910n  158.50w  altitude 6000.0 ft  speed 450.0 kts
      position   21.310n  158.50w  altitude 6000.0 ft  speed 450.0 kts
      position   21.310n  157.65w  altitude 6000.0 ft  speed 450.0 kts
      position   21.910n  157.65w  altitude 6000.0 ft  speed 450.0 kts
      position   21.910n  158.50w  altitude 6000.0 ft  speed 450.0 kts

      position   21.310n  158.50w  altitude 6000.0 ft  speed 450.0 kts
      position   21.310n  157.65w  altitude 6000.0 ft  speed 450.0 kts
      position   21.910n  157.65w  altitude 6000.0 ft  speed 450.0 kts
      position   21.910n  158.50w  altitude 6000.0 ft  speed 450.0 kts
      position   21.310n  158.50w  altitude 6000.0 ft  speed 450.0 kts
      position   21.310n  157.65w  altitude 6000.0 ft  speed 450.0 kts
      position   21.910n  157.65w  altitude 6000.0 ft  speed 450.0 kts
      position   21.910n  158.50w  altitude 6000.0 ft  speed 450.0 kts
   end_route
   follow_vertical_track

   execute at_time 3599 sec absolute
      double totalFuel = GetTotalFuelRemaining_lbs(PLATFORM);
      writeln("Aircraft 1 has ", totalFuel, " lbs of fuel remaining...");
   end_execute

end_platform
```

- **演示要点**：演示 platform 的参数：update_interval, side, route, follow_vertical_track, execute

### platform（parachute_example2）｜平台实例

- **关键词**：platform, side, route, execute, weapon, heading, 平台实例
- **出处**：`parachute/parachute_example2.txt:71-103`
- **片段**：

```text
platform   blue_airlifter_jet BLUE_AIRLIFTER_JET
   side blue

   route
      position   40:00:00.00n   88:00:00.00w altitude 40000.00 ft
      heading 270.00 deg speed 500 kts
      position   40:01:40.75n   88:00:53.11w altitude 40000.00 ft
      speed 500 kts
      heading 0.00 deg
      position   40:01:36.70n   88:03:14.41w altitude 40000.00 ft
      speed 500 kts
      position   39:59:51.27n   88:03:48.20w altitude 40000.00 ft
      speed 500 kts
      position   39:59:07.31n   88:01:43.43w altitude 40000.00 ft
      speed 500 kts
      position   39:59:56.15n   88:00:07.87w altitude 40000.00 ft
      speed 500 kts
   end_route

   execute at_interval_of 2.5 seconds
      WsfWeapon parachuters = PLATFORM.Weapon("parachuters");
      if (parachuters.QuantityRemaining() > 0)
      {
         writeln("Firing No. ", parachuters.TotalQuantityUsed() + 1);
         parachuters.Fire();
      }
   end_execute

   weapon parachuters
      quantity 24
   end_weapon
  heading 56.39 deg
end_platform
```

- **演示要点**：演示 platform 的参数：side, route, execute, weapon, heading

### platform（cloud_attenuation）｜平台实例

- **关键词**：platform, icon, commander, position, heading, edit, 平台实例
- **出处**：`space_operations/cloud_attenuation.txt:194-226`
- **片段**：

```text
platform FPS85 SSN_RADAR
   icon ew_radar_icon
   commander commander
   position 30:34:24n 86:12:54w altitude 100 ft
   heading          180 deg


   edit sensor radar
      on
      pitch                                45 deg
      azimuth_scan_limits                 -60 deg 60 deg
      elevation_scan_limits               -45 deg 15 deg

      transmitter
         antenna_pattern                  FPS85
         frequency                        0.442 ghz
         power                            32000 kw
         bandwidth                        .001 ghz
         wavelength                       0.68 m
         pulse_repetition_frequency       20 Hz
         pulse_width                      0.25 msec
      end_transmitter

      receiver
         antenna_pattern                  FPS85
      end_receiver

      internal_link report
      elevation_error_sigma 0.18 deg
      azimuth_error_sigma 0.026 deg
   end_sensor

end_platform
```

- **演示要点**：演示 platform 的参数：icon, commander, position, heading, edit

### platform（traveling_astronaut）｜平台实例

- **关键词**：platform, icon, side, mover, script_variables, execute, 平台实例
- **出处**：`space_operations/traveling_astronaut.txt:27-59`
- **片段**：

```text
platform central TAPSATELLITE
   icon satellite
   side blue

   mover
      position 0n 90w altitude 1687.83 km heading 55 degrees

      # The TAP solution will resepct the maximum allowed delta V of the central platform.
      maneuvering simple
         delta_v 16 km/s
      end_maneuvering
   end_mover

   script_variables
      Array<string> targets = {};
   end_script_variables

   execute at_time 1 min absolute
      # To change the number of targets, either change the final argument to CreateJunk,
      # or modify the parameters in script/cascade.txt.
      targets = CreateJunk(PLATFORM.LocationECI(), PLATFORM.VelocityECI(), "junk_", 3.0);
      writeln(targets.Size(), " Pieces of junk created.");
   end_execute

   execute at_time 10 min absolute
      writeln("Solving for optimal junk retrieval route...");

      # To select a different operation, replace the final argument with the name of the
      # script method (as a string).
      TravelingAstronaut("central", targets, TIME_NOW, "RemoveJunk");
   end_execute

end_platform
```

- **演示要点**：演示 platform 的参数：icon, side, mover, script_variables, execute

### platform（narrow_spot_sar_demo）｜平台实例

- **关键词**：platform, side, route, sensor, execute, track, 平台实例
- **出处**：`sensor_demos/narrow_spot_sar_demo.txt:34-68`
- **片段**：

```text
platform uav UAV
   side blue
   route
      position 34n 116w altitude 80000 ft heading 0 deg speed 250 kts
   end_route

   # For this case we narrow the field of view down so we can test to make sure
   # the apparent location computations are actually working. Note that it won't
   # work at less that 0.01 deg.

   sensor sar_left
      mode SPOT_HI_RES
         azimuth_field_of_view   -0.01 deg 0.01 deg
         elevation_field_of_view -0.01 deg 0.01 deg
      end_mode
   end_sensor

   execute at_time 10 sec absolute
      WsfSensor sensor = Sensor("sar_left");
      WsfTrack  target = MasterTrackList().Entry(0);

      // Cue to the apparent location of the target.
      sensor.CueToPoint(sensor.ApparentLocationOf(target.CurrentLocation(), 1.333333));

      // Enabling the next line will result in no detection.

      writeln("True     Location: ", target.CurrentLocation());
      writeln("Apparent Location: ", sensor.ApparentLocationOf(target.CurrentLocation(), 1.333333));
      sensor.TurnOn();
   end_execute

   track
      platform target
   end_track
end_platform
```

- **演示要点**：演示 platform 的参数：side, route, sensor, execute, track

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, icon, side, command_chain, add, script, 平台实例
- **出处**：`space_operations/conjunction_avoidance.txt:15-63`
- **片段**：

```text
platform primary WSF_PLATFORM
   icon satellite
   side blue

   command_chain BLUETEAM ground-control

   add comm perfect WSF_COMM_TRANSCEIVER
      network_name blue-radio
      internal_link task_mgr
   end_comm

   # Pick a random delta V of a fixed magnitude.
   script Vec3 PickDeltaV()
      double vMag = 20.0;
      double ctheta = 2.0 * MATH.RandomUniform() - 1.0;
      double stheta = MATH.Sqrt(1.0 - ctheta * ctheta);
      double phi = 2.0 * MATH.PI() * MATH.RandomUniform();
      return Vec3.Construct(vMag * stheta * MATH.Cos(phi),
                            vMag * stheta * MATH.Sin(phi),
                            vMag * ctheta);
   end_script

   # Whenever this platform receives a message, execute a small burn to dodge.
   add processor task_mgr WSF_TASK_PROCESSOR
      on_message
         type WSF_STATUS_MESSAGE
            script
               WsfStatusMessage msg = (WsfStatusMessage)MESSAGE;
               writeln("Primary: received a message: ", msg.Status());
               writeln("Primary: performing dodge at time: ", TIME_NOW);
               WsfSpaceMover mov = (WsfSpaceMover)PLATFORM.Mover();
               WsfDeltaV_Maneuver mvr = WsfDeltaV_Maneuver.Construct(WsfOrbitalEventCondition.NONE(),
                                                                     PickDeltaV(),
                                                                     WsfOrbitalReferenceFrame.INERTIAL());
               mov.ExecuteManeuver(mvr);
            end_script
      end_on_message
   end_processor

   add mover WSF_SPACE_MOVER
      eccentricity 0.001
      inclination 0.0 deg
      raan 0.0 deg
      semi_major_axis 16610 km
      true_anomaly 30 deg
      argument_of_periapsis 0.0 deg
   end_mover

end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, command_chain, add, script

### platform（launch1multi_stage_tbm）｜平台实例

- **关键词**：platform, side, position, weapon, add, track, 平台实例
- **出处**：`tbm_demos/scenarios/launch1multi_stage_tbm.txt:17-68`　（同签名共 2 处，另见 `tbm_demos/scenarios/launch3tbms.txt:30`）
- **片段**：

```text
platform tbm2-launcher TBM2_LAUNCHER
   side red
   position 36:01n 120e

   # Declare how many missiles we have
   weapon tbm2-missile
      quantity 1
      # The following are the 'pre-computed' launch angles to hit target-1.
      # If you comment out the track definition then it will use these to
      # to define the initial conditions.
      yaw   75.3303928 deg
      pitch 85.67082852 deg
   end_weapon

   # Add a script processor that will launch the weapon.
   add processor script WSF_SCRIPT_PROCESSOR
      update_interval 45.0 sec
      on_update
         if (TIME_NOW > 1.0)
         {
            static int trackIndex = 0;
            writeln("TIME_NOW ", TIME_NOW);
            WsfWeapon tbm = PLATFORM.Weapon("tbm2-missile");
            if (tbm.IsValid() &&
                (tbm.QuantityRemaining() > 0))
            {
               WsfLocalTrackList trackList = PLATFORM.MasterTrackList();
               if (trackIndex < trackList.TrackCount())
               {
                  tbm.Fire(trackList.TrackEntry(trackIndex));
                  trackIndex = trackIndex + 1;
               }
               else
               {
                  tbm.Fire();
               }
            }
            else
            {
               PROCESSOR.TurnOff();
            }
         }
      end_on_update
   end_processor

   # Define a 'pre-brief' track that indicates the target location
   track
      platform target-4
      position 37:31n 127e
   end_track

end_platform
```

- **演示要点**：演示 platform 的参数：side, position, weapon, add, track

### platform（test_strike）｜平台实例

- **关键词**：platform, side, commander, route, track, execute, 平台实例
- **出处**：`iads/scenarios/test_strike.txt:116-172`　（同签名共 3 处，另见 `iads/scenarios/test_strike.txt:174`、`iads/scenarios/test_strike.txt:39`）
- **片段**：

```text
platform 300_ucav UCAV
   side blue
   commander SELF
   route
      navigation
         position 38:06:03.3n 115:56:33.9w altitude 35000 ft msl speed 460 kts # at 1.000
         position 38:06:11.0n 116:02:53.4w altitude 35000 ft msl speed 400 kts # at 46.000
         position 38:06:18.3n 116:09:13.0w altitude 35000 ft msl speed 400 kts # at 91.000
         position 38:06:25.3n 116:15:32.6w altitude 35000 ft msl speed 400 kts # at 136.000
   #T=164.037 300_ucav weapon waypoint 4 grid 295 38:06:29.9n 116:19:54.3w speed 205.778
   #T=164.037 300_ucav release blue_gps_bomb_2 target 38:04:31.0n 116:49:54.0w plantime 182.000 early 17.963
   #T=164.037 300_ucav release blue_glide_bomb_1 target 38:12:24.0n 117:27:36.0w plantime 182.000 early 17.963
         position 38:06:31.9n 116:21:52.2w altitude 35000 ft msl speed 400 kts # at 181.000
   		# loiter at 225.000
   		# loiter at 271.000
         position 38:06:44.2n 116:34:31.7w altitude 35000 ft msl speed 400 kts # at 316.000
   		# loiter at 360.000
   		# loiter at 406.000
         position 38:11:50.0n 116:40:44.7w altitude 35000 ft msl speed 400 kts # at 451.000
         position 38:16:50.1n 116:40:37.9w altitude 35000 ft msl speed 400 kts # at 496.000
   		# loiter at 540.000
   		# loiter at 585.000
   		# loiter at 631.000
   		# loiter at 675.000
   		# loiter at 721.000
         position 38:16:44.4n 116:34:17.2w altitude 35000 ft msl speed 400 kts # at 766.000
         position 38:11:44.3n 116:34:24.5w altitude 35000 ft msl speed 400 kts # at 811.000
   		# loiter at 855.000
   		# loiter at 901.000
         position 38:06:38.3n 116:28:11.9w altitude 35000 ft msl speed 400 kts # at 946.000
         position 38:06:31.9n 116:21:52.2w altitude 35000 ft msl speed 400 kts # at 991.000
         position 38:06:25.3n 116:15:32.6w altitude 35000 ft msl speed 400 kts # at 1036.000
         position 38:06:18.3n 116:09:13.0w altitude 35000 ft msl speed 400 kts # at 1081.000
         position 38:06:11.0n 116:02:53.4w altitude 35000 ft msl speed 400 kts #
      end_navigation
   end_route

   track
      platform 200_target
      side     red
      position 38:04:31.0n 116:49:54.0w
   end_track

   track
      platform 1200_target
      side     red
      position 38:12:24.0n 117:27:36.0w
   end_track

   execute at_time 164.037 secs absolute
      # Fire blue_gps_bomb_2 at 200_target
      # Fire blue_glide_bomb_1 at 1200_target
      Weapon("blue_gps_bomb_2").Fire(MasterTrackList().TrackEntry(0));
      Weapon("blue_glide_bomb_1").Fire(MasterTrackList().TrackEntry(1));
   end_execute

end_platform
```

- **演示要点**：演示 platform 的参数：side, commander, route, track, execute

### platform（pm6_missile_comparison）｜平台实例

- **关键词**：platform, icon, position, heading, script_variables, execute, 平台实例
- **出处**：`six_dof/pm6_missile_comparison.txt:421-484`　（同签名共 3 处，另见 `six_dof/rb6_missile_comparison.txt:421`、`p6dof/missile_comparison.txt:274`）
- **片段**：

```text
platform sam SAM_LAUNCHER
   icon tank
   position 21:34:37n 158:12:07w  altitude 15 ft   
   heading 5 deg
   
   script_variables
        bool   tgtLocked    = false;
        double lastShot_sec = -3600.0;
   end_script_variables
   
   execute at_interval_of 2 sec
   
      tgtLocked = false;
   
      WsfLocalTrackList trackList = PLATFORM.MasterTrackList();
   
      double closestTrackDistance_m = 10000000;
      foreach (WsfLocalTrack trk in trackList)
      {
         if( trk.IsValid() &&
             trk.Target().IsValid() &&
             trk.Target().Side() != Side())
         {
            if( trk.Range() < closestTrackDistance_m)
            {
               closestTrackDistance_m = GroundRangeTo(trk);
               PLATFORM.SetCurrentTarget(trk);
               tgtLocked = true;
               # writeln("T=", TIME_NOW, " Sam locked onto unknown target at ", trk.Range()/1000.0, " km...");
            }
         }
      }
       
   end_execute
   
   execute at_interval_of 2 sec
   
      if(tgtLocked)
      {
         WsfTrack track = PLATFORM.CurrentTargetTrack();
         if( track.IsValid() && 
             track.Range() < 20000)
         {
            WsfWeapon missile = PLATFORM.Weapon("sam-mr");            
            if(missile.IsValid())
            {
               if(missile.QuantityRemaining() > 0 && missile.ActiveWeaponPlatformsFor(track.TrackId()).Empty())
               {
                  if((TIME_NOW - lastShot_sec) > 30.0)
                  {
                     if (missile.Fire(track))
                     {
                        lastShot_sec = TIME_NOW;
                        writeln("T=", TIME_NOW, " Sam firing at unknown target at ", track.Range()/1000.0, " km  -- bird away!");
                     }
                  }
               }
            }
         }
      }
   
   end_execute

end_platform
```

- **演示要点**：演示 platform 的参数：icon, position, heading, script_variables, execute

### platform（rb6_bomb_sequencers）｜平台实例

- **关键词**：platform, update_interval, side, route, edit, execute, 平台实例
- **出处**：`six_dof/rb6_bomb_sequencers.txt:96-190`　（同签名共 6 处，另见 `p6dof/bomb_sequencers.txt:96`、`six_dof/pm6_bomb_sequencers.txt:104`、`six_dof/pm6_cruise_missile_test.txt:113`）
- **片段**：

```text
platform ghost B-FW-GPS-BOMBS
   update_interval 0.01 sec
   side blue

   route
      position 21:17:00n 158:10:00w  altitude 24000.0 ft  speed 500.0 kts
      position 21:18:38n 158:03:54w  altitude 24000.0 ft  speed 500.0 kts
   end_route

   edit mover
      wash_in_conditions true
   end_mover

include scripts/six_dof_simple_scripts.txt

   execute at_time 24.0 sec absolute   
      writeln("Bomber 'ghost' begins to drop GPS-guided bombs.");
      
      writeln("Bomber 'ghost' drops first gps bomb...");
      WsfWeapon wpn = PLATFORM.Weapon("gps_bomb");
      if(wpn.IsValid())
      {
         WsfTrack trk = WsfTrack();         
         trk.SetTarget("gnd_tgt_1");      
         wpn.Fire(trk);
      }
   end_execute

   execute at_time 24.5 sec absolute   
      writeln("Bomber 'ghost' drops second gps bomb...");
      WsfWeapon wpn = PLATFORM.Weapon("gps_bomb");
      if(wpn.IsValid())
      {
         WsfTrack trk = WsfTrack();
         trk.SetTarget("gnd_tgt_2");      
         wpn.Fire(trk);
      }
   end_execute

   execute at_time 25.0 sec absolute   
      writeln("Bomber 'ghost' drops third gps bomb...");
      WsfWeapon wpn = PLATFORM.Weapon("gps_bomb");
      if(wpn.IsValid())
      {
         WsfTrack trk = WsfTrack();
         trk.SetTarget("gnd_tgt_3");      
         wpn.Fire(trk);
      }
   end_execute

   execute at_time 25.5 sec absolute   
      writeln("Bomber 'ghost' drops fourth gps bomb...");
      WsfWeapon wpn = PLATFORM.Weapon("gps_bomb");
      if(wpn.IsValid())
      {
         WsfTrack trk = WsfTrack();
         trk.SetTarget("gnd_tgt_4");      
         wpn.Fire(trk);
      }
   end_execute

   execute at_time 26.0 sec absolute   
      writeln("Bomber 'ghost' drops fifth gps bomb...");
      WsfWeapon wpn = PLATFORM.Weapon("gps_bomb");
      if(wpn.IsValid())
      {
         WsfTrack trk = WsfTrack();
         trk.SetTarget("gnd_tgt_5");      
         wpn.Fire(trk);
      }
   end_execute

   execute at_time 26.5 sec absolute   
      writeln("Bomber 'ghost' drops sixth (and last) gps bomb...");
      WsfWeapon wpn = PLATFORM.Weapon("gps_bomb");
      if(wpn.IsValid())
      {
         WsfTrack trk = WsfTrack();
         trk.SetTarget("gnd_tgt_6");      
         wpn.Fire(trk);
      }
   end_execute

   execute at_time 40.0 sec absolute
      writeln("Bomber 'ghost' making a slow right turn towards the south...");
      WsfSixDOF_Mover mover = (WsfSixDOF_Mover)PLATFORM.Mover();
      if(!mover.IsNull())
      {
         mover.SetAutopilotVerticalSpeed(0.0);
         mover.SetAutopilotRollAngle(10.0);
         mover.SetAutopilotSpeedKCAS(500.0);
      }
   end_execute
   
end_platform
```

- **演示要点**：演示 platform 的参数：update_interval, side, route, edit, execute

### platform（blue_side）｜平台实例

- **关键词**：platform, commander, side, icon, position, 平台实例
- **出处**：`ballistic_missile_shootdown/scenarios/blue_side.txt:11-16`　（同签名共 15 处，另见 `ballistic_missile_shootdown/scenarios/blue_side.txt:18`、`ballistic_missile_shootdown/scenarios/many_blue_side.txt:10`、`ballistic_missile_shootdown/scenarios/many_blue_side.txt:26`）
- **片段**：

```text
platform blue_naval_sam_battery_01 BLUE_NAVAL_SAM_BATTERY
  commander SELF
  side blue
  icon command_truck
  position 39:42:01.23n 76:41:49.89w
end_platform
```

- **演示要点**：演示 platform 的参数：commander, side, icon, position

### platform（blue_side）｜平台实例

- **关键词**：platform, commander, side, position, heading, 平台实例
- **出处**：`ballistic_missile_shootdown/scenarios/blue_side.txt:25-30`　（同签名共 9 处，另见 `heatmap/scenarios/blue_laydown.txt:60`、`laser_designator/scenarios/light_attack_initial.txt:23`、`laser_designator/scenarios/light_attack_initial.txt:30`）
- **片段**：

```text
platform blue_abm_ttr_01 BLUE_ABM_TTR
  commander blue_naval_sam_battery_01
  side blue
  position 39:44:02.86n 76:31:44.28w
  heading 340 deg
end_platform
```

- **演示要点**：演示 platform 的参数：commander, side, position, heading

### platform（blackboard）｜平台实例

- **关键词**：platform, icon, side, position, heading, 平台实例
- **出处**：`behavior_tree/blackboard.txt:48-53`　（同签名共 10 处，另见 `behavior_tree/condition.txt:48`、`behavior_tree/decorator.txt:48`、`behavior_tree/parallel.txt:27`）
- **片段**：

```text
platform  Blue_1  STRIKER
   icon        F-22
   side        blue
   position 00:00:00.00s 02:00:00.00e altitude 30000 ft agl
   heading 270 deg
end_platform
```

- **演示要点**：演示 platform 的参数：icon, side, position, heading

### platform（iads_laydown_cali）｜平台实例

- **关键词**：platform, side, commander, position, use_zone, 平台实例
- **出处**：`iads/scenarios/iads_laydown_cali.txt:309-314`　（同签名共 36 处，另见 `cyber/exfiltrate_demo/scenarios/iads_laydown.txt:335`、`cyber/exfiltrate_demo/scenarios/iads_laydown.txt:398`、`cyber/exfiltrate_demo/scenarios/iads_laydown.txt:461`）
- **片段**：

```text
platform 2900_large_sam_battalion LARGE_SAM_BATTALION
  side red
  commander 10_iads_cmdr
  position 34:40:00.000n 119:17:12.000w  altitude 0 m agl
  use_zone 100_battalion_sector as battalion_sector
end_platform
```

- **演示要点**：演示 platform 的参数：side, commander, position, use_zone

### platform（hel_test）｜平台实例

- **关键词**：platform, side, icon, category, position, 平台实例
- **出处**：`hel/hel_test.txt:221-226`
- **片段**：

```text
platform red_adv_fighter_2 RED_ADV_FIGHTER_2
   side red
   icon SU-27
   category RED_ADV_FIGHTER_2
   position 40:03:00n 90.0383w altitude 2000 meters heading 180 degrees
end_platform
```

- **演示要点**：演示 platform 的参数：side, icon, category, position

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, side, category, icon, position, 平台实例
- **出处**：`hel/intersect_mesh_test.txt:278-283`　（同签名共 2 处，另见 `hel/intersect_mesh_test.txt:285`）
- **片段**：

```text
platform threat WSF_PLATFORM
   side red
   category SA
   icon SA_TEMPLATE
   position 0n 0e altitude 1 m
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：side, category, icon, position

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, side, icon, position, heading, 平台实例
- **出处**：`p6dof/airport_operations.txt:177-182`　（同签名共 4 处，另见 `p6dof/airport_operations.txt:184`、`six_dof/rb6_airport_operations.txt:177`、`six_dof/rb6_airport_operations.txt:184`）
- **片段**：

```text
platform ParkedFighter1 WSF_PLATFORM
   side blue
   icon f15c
   position  21.32785n 157.94755w altitude 11.0 ft
   heading   90.0 deg
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：side, icon, position, heading

### platform（globalstar_ground）｜平台实例

- **关键词**：platform, side, position, commander, category, 平台实例
- **出处**：`satellite_demos/ground_networks/globalstar_ground.txt:72-77`　（同签名共 67 处，另见 `satellite_demos/ground_networks/globalstar_ground.txt:79`、`satellite_demos/ground_networks/globalstar_ground.txt:86`、`satellite_demos/ground_networks/globalstar_ground.txt:93`）
- **片段**：

```text
platform AUSSAGUEL GLOBALSTAR_GS               # approximate location; T & C Site
  side blue
  position 43.42916667n 1.49777778e altitude 1.0 m agl
  commander SELF
  category ground_station
end_platform
```

- **演示要点**：演示 platform 的参数：side, position, commander, category

### platform（scenario1）｜平台实例

- **关键词**：platform, icon, position, heading, commander, 平台实例
- **出处**：`launcher/scenarios/scenario1.txt:22-28`
- **片段**：

```text
platform sam_site SAM_LAUNCHER
side Red
   icon SA-11_Launcher
   position 35:32n 76:13w altitude 0 ft msl
   heading 0 deg
   commander SELF
end_platform
```

- **演示要点**：演示 platform 的参数：icon, position, heading, commander

### platform（mitm_red_laydown）｜平台实例

- **关键词**：platform, position, heading, commander, sensor, 平台实例
- **出处**：`cyber/scenarios/mitm_red_laydown.txt:23-30`
- **片段**：

```text
platform ground_radar_1 GROUND_RADAR
   position 38:47:59.857n 90:16:40.107w
   heading 90 degrees
   commander cyber_command_post_1
   sensor ground_radar 
      off
   end_sensor
end_platform
```

- **演示要点**：演示 platform 的参数：position, heading, commander, sensor

### platform（ttr_test）｜平台实例

- **关键词**：platform, side, commander, position, processor, 平台实例
- **出处**：`iads/ttr_test.txt:94-101`　（同签名共 3 处，另见 `iads/ttr_test.txt:36`、`iads/ttr_test.txt:82`）
- **片段**：

```text
platform 2920_large_sam_ttr LARGE_SAM_TTR
   side red
   commander 2900_large_sam_battalion
   position 39:59:55n 90:00:00w altitude 0.0 m agl
   processor task_mgr
      show_task_messages
   end_processor
end_platform
```

- **演示要点**：演示 platform 的参数：side, commander, position, processor

### platform（beidou）｜平台实例

- **关键词**：platform, designator, revs_per_day, inclination, raan, 平台实例
- **出处**：`satellite_demos/satellites/orbit_nominal/beidou.txt:269-276`　（同签名共 5 处，另见 `satellite_demos/satellites/orbit_nominal/beidou.txt:278`、`satellite_demos/satellites/orbit_nominal/beidou.txt:287`、`satellite_demos/satellites/orbit_nominal/beidou.txt:296`）
- **片段**：

```text
platform GEO1 BEIDOU
edit mover
   designator GEO1
   revs_per_day 1
   inclination 0 deg
   raan 158.75 deg
end_mover
end_platform
```

- **演示要点**：演示 platform 的参数：designator, revs_per_day, inclination, raan

### platform（full_laydown）｜平台实例

- **关键词**：platform, commander, route, position, heading, 平台实例
- **出处**：`timeline_lead/scenarios/full_laydown.txt:71-78`　（同签名共 6 处，另见 `timeline_lead/scenarios/full_laydown.txt:249`、`timeline_lead/scenarios/full_laydown.txt:258`、`timeline_lead/scenarios/full_laydown.txt:267`）
- **片段**：

```text
platform blue_2 BLUE_STRIKER
  commander blue_flight_lead
  route
    position 38:35:18.18n 93:07:46.00w altitude 35000.00 ft  speed 500 kts
    position 38:31:57.26n 89:41:10.05w altitude 35000.00 ft
  end_route
  heading 90 deg
end_platform
```

- **演示要点**：演示 platform 的参数：commander, route, position, heading

### platform（acoustic_demo）｜平台实例

- **关键词**：platform, position, side, route, speed, 平台实例
- **出处**：`acoustic/acoustic_demo.txt:146-154`
- **片段**：

```text
platform player-1 ACOUSTIC_TARGET
  position 29:30:57.34n 30e altitude 1500.00 ft
  side blue
  route
    position 29:30:57.34n 30e altitude 1500.00 ft
    speed 100 kts
    position 30:40:37.43n 30e altitude 1500.00 ft
  end_route
end_platform
```

- **演示要点**：演示 platform 的参数：position, side, route, speed

### platform（radar）｜平台实例

- **关键词**：platform, side, commander, position, edit, 平台实例
- **出处**：`electronic_warfare/test_multi_beam/scenarios/radar.txt:28-36`　（同签名共 135 处，另见 `iads/scenarios/iads_laydown_cali.txt:50`、`iads/scenarios/iads_laydown_cali.txt:61`、`iads/scenarios/iads_laydown_cali.txt:72`）
- **片段**：

```text
platform 200_ew_radar EW_RADAR
  side red

  commander 100_radar_company
  position 39:22:36n  117:33:25w  altitude 0.0 m agl

  edit sensor ew_radar
  end_sensor
end_platform
```

- **演示要点**：演示 platform 的参数：side, commander, position, edit

### platform（sensor_demo）｜平台实例

- **关键词**：platform, icon, side, optical_signature, route, 平台实例
- **出处**：`multiresolution_demos/sensor_demo.txt:111-119`
- **片段**：

```text
platform fighter SIMPLE_FIGHTER
   icon f-18
   side red
   optical_signature FIGHTER_SPHERICAL_OPTICAL_SIG

   route
      position 40.2n 89.5w altitude 20000 ft heading 270 deg speed 500 kts
   end_route
end_platform
```

- **演示要点**：演示 platform 的参数：icon, side, optical_signature, route

### platform（external_fuel_tank_test2）｜平台实例

- **关键词**：platform, update_interval, side, route, follow_vertical_track, 平台实例
- **出处**：`p6dof/external_fuel_tank_test2.txt:43-51`　（同签名共 12 处，另见 `p6dof/external_fuel_tank_test2.txt:53`、`six_dof/pm6_external_fuel_tank_test2.txt:43`、`six_dof/pm6_external_fuel_tank_test2.txt:53`）
- **片段**：

```text
platform p6dof_1 FA-LGT
   update_interval 0.01 sec
   side blue
   route
      position   21.320n  158.50w  altitude 10000.0 ft speed 500.0 kts
      position   24.320n  158.50w  altitude 10000.0 ft speed 500.0 kts
   end_route
   follow_vertical_track
end_platform
```

- **演示要点**：演示 platform 的参数：update_interval, side, route, follow_vertical_track

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, icon, side, position, add, 平台实例
- **出处**：`sensor_demos/bistatic_demo.txt:95-103`　（同签名共 20 处，另见 `sensor_demos/bistatic_sp_false_target_jamming_demo.txt:129`、`sensor_demos/bistatic_sp_noise_jamming_demo.txt:112`、`sensor_demos/bistatic_support_false_target_jamming_demo.txt:135`）
- **片段**：

```text
platform xmtr_pltfrm WSF_PLATFORM
   icon C4I
   side red

   position 02:02:3.83s 00:00:0.0w altitude 0 m agl
   add sensor snsr_xmtr BISTATIC_SENSOR_XMTR
      on
   end_sensor
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, position, add

### platform（sensor_laydown_rocket）｜平台实例

- **关键词**：platform, side, position, heading, edit, 平台实例
- **出处**：`signature_demos/scenarios/sensor_laydown_rocket.txt:13-21`　（同签名共 4 处，另见 `signature_demos/scenarios/sensor_laydown_rocket.txt:23`、`signature_demos/scenarios/sensor_laydown_rocket.txt:34`、`signature_demos/scenarios/sensor_laydown_rocket.txt:44`）
- **片段**：

```text
platform irst_sensor_fl GENERIC_IRST_SITE
   side blue
   position 25.2673n 80.3234w
   heading 340 deg
   
   edit sensor sensor_irst
      maximum_range 3000 km 
   end_sensor
end_platform
```

- **演示要点**：演示 platform 的参数：side, position, heading, edit

### platform（cloud_attenuation）｜平台实例

- **关键词**：platform, icon, commander, position, edit, 平台实例
- **出处**：`space_operations/cloud_attenuation.txt:262-270`　（同签名共 6 处，另见 `space_operations/cloud_attenuation.txt:337`、`space_operations/cloud_attenuation.txt:144`、`space_operations/cloud_attenuation.txt:308`）
- **片段**：

```text
platform GLOBUSII SSN_TELESCOPE
   icon ew_radar_icon
   commander commander
   position 70.3671n 31.1271e
   edit sensor telescope
      on
      internal_link report
   end_sensor
end_platform
```

- **演示要点**：演示 platform 的参数：icon, commander, position, edit

### platform（targets）｜平台实例

- **关键词**：platform, side, commander, route, heading, 平台实例
- **出处**：`electronic_warfare/test_false_targets/scenarios/targets.txt:145-154`　（同签名共 13 处，另见 `electronic_warfare/test_multi_beam/scenarios/jammers.txt:12`、`electronic_warfare/test_multi_beam/scenarios/jammers.txt:24`、`iads/scenarios/test_jammers.txt:12`）
- **片段**：

```text
platform soj SOJ
   side blue
   commander SELF
   route
      position 41:06:26.281n 117:25:38.386w altitude 35000 ft msl
         speed 0 kts
     position 40:33:00n 117:25:48w altitude 35000 ft msl
   end_route
   heading 180 deg
end_platform
```

- **演示要点**：演示 platform 的参数：side, commander, route, heading

### platform（GoneFishing_ConstraintDemo）｜平台实例

- **关键词**：platform, side, icon, position, execute, 平台实例
- **出处**：`cyber/GoneFishing_ConstraintDemo.txt:209-218`　（同签名共 3 处，另见 `cyber/GoneFishing_ConstraintDemo.txt:168`、`cyber/GoneFishing_ConstraintDemo.txt:188`）
- **片段**：

```text
platform OLD_MAN FISHERMAN
   side blue
   icon ship
   position 26.00n 90.00w
   execute at_time 2.0 hour absolute
      WsfPlatform bigfish = WsfSimulation.FindPlatform("BIG_FISH");

      PLATFORM.CyberAttack(bigfish, "BIG_CATCH");  writeln(PLATFORM.Name(), " caught ", bigfish.Name(), "         ", PLATFORM.CyberAttackStatus(bigfish, "BIG_CATCH"));
   end_execute
end_platform
```

- **演示要点**：演示 platform 的参数：side, icon, position, execute

### platform（naval_ssm_test）｜平台实例

- **关键词**：platform, side, commander, route, icon, 平台实例
- **出处**：`new_guidance/scenarios/naval_ssm_test.txt:11-20`　（同签名共 5 处，另见 `ship_ad/scenarios/naval_ssm_test.txt:18`、`new_guidance/scenarios/naval_ssm_test.txt:22`、`electronic_warfare/comm_jamming.txt:136`）
- **片段**：

```text
platform red_naval_helicopter RED_NAVAL_HELICOPTER
   side blue
   commander 1201_missile_ship
   route
     position 30:34:12n 80:40:00w altitude 5000 ft agl
     speed 100 kts  heading 90 deg
     position 29:59:24n 81:14:36w altitude 5000 ft agl
   end_route
   icon Apache
end_platform
```

- **演示要点**：演示 platform 的参数：side, commander, route, icon

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, icon, add, route, position, 平台实例
- **出处**：`example_scripts/scenario_route_finder_orbit.txt:13-22`
- **片段**：

```text
platform target WSF_PLATFORM
  icon B-747
  add mover WSF_AIR_MOVER end_mover
  route
  position 00.31532n 00.73940e altitude 10000 ft msl
     speed 50 knots
  position 0.315n 1.2e
  position 1.0n 1.2e
  end_route
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, add, route, position

### platform（with_awacs）｜平台实例

- **关键词**：platform, side, commander, route, position, 平台实例
- **出处**：`shooter/scenarios/with_awacs.txt:9-18`　（同签名共 2 处，另见 `laser_designator/scenarios/blue_uav.txt:10`）
- **片段**：

```text
platform awacs1 AWACS
   side blue
   commander SELF
   route
    position 37:00:54n 136:45:06e altitude 20000 ft agl
       speed 150 kts
    position 37:35:54n 136:48:54e altitude 20000 ft agl
       speed 150 kts
   end_route
end_platform
```

- **演示要点**：演示 platform 的参数：side, commander, route, position

### platform（light_attack_initial）｜平台实例

- **关键词**：platform, side, position, heading, route, 平台实例
- **出处**：`laser_designator/scenarios/light_attack_initial.txt:66-75`　（同签名共 10 处，另见 `laser_designator/scenarios/light_attack_initial.txt:77`、`laser_designator/scenarios/light_attack_initial.txt:88`、`laser_designator/scenarios/light_attack_initial.txt:99`）
- **片段**：

```text
platform red_ground_troop-1 SOLDIER
  side red
  #icon mil_GroundCombat
  position 45:02:08.51n 121:48:54.19w altitude 6.00 ft msl
  heading 83 deg
  route
    position 45:02:08.51n 121:48:54.19w altitude 6.00 ft msl speed 2 kts
    position 45:02:10.15n 121:48:35.78w altitude 6.00 ft agl
  end_route
end_platform
```

- **演示要点**：演示 platform 的参数：side, position, heading, route

### platform（close_targets_ttr）｜平台实例

- **关键词**：platform, side, radar_signature, position, route, 平台实例
- **出处**：`electronic_warfare/close_targets_ttr.txt:40-50`
- **片段**：

```text
platform blue_airlifter_jet_2 BLUE_AIRLIFTER_JET
   side blue

   radar_signature BLUE_AIRLIFTER_JET_RADAR_SIG_2

   position 39:31:42.42n 91:38:35.111w

   route
      position 47:31:42n 120:42:35w altitude 30000 ft speed 180 kts
   end_route
end_platform
```

- **演示要点**：演示 platform 的参数：side, radar_signature, position, route

### platform（bistatic_sp_false_target_jamming_demo）｜平台实例

- **关键词**：platform, side, icon, position, add, 平台实例
- **出处**：`sensor_demos/bistatic_sp_false_target_jamming_demo.txt:139-149`　（同签名共 4 处，另见 `sensor_demos/bistatic_sp_noise_jamming_demo.txt:122`、`sensor_demos/bistatic_support_false_target_jamming_demo.txt:152`、`sensor_demos/bistatic_support_noise_jamming_demo.txt:134`）
- **片段**：

```text
platform jet JET
   side blue
   icon b-747

   position 00:00:0.0n 00:00:0.0w altitude 2500 m agl

   add weapon jammer JAMMER
      debug
      on
   end_weapon
end_platform
```

- **演示要点**：演示 platform 的参数：side, icon, position, add

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, position, altitude, heading, add, 平台实例
- **出处**：`sensor_plot/radar/hm-repeater-effect.txt:147-157`　（同签名共 4 处，另见 `sensor_plot/radar/hm-required-jamming-power.txt:40`、`sensor_plot/esm/hm-jammer-detect-2.txt:84`、`sensor_plot/esm/hm-jammer-detect-1.txt:71`）
- **片段**：

```text
platform sensor WSF_PLATFORM
   position 00:00:00n  00:00:00w
   altitude 0.0 ft
   heading 90 deg

   add sensor ew_radar EW_RADAR
      on
#      debug
   end_sensor

end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：position, altitude, heading, add

### platform（simple_one_on_one）｜平台实例

- **关键词**：platform, icon, side, indestructible, route, 平台实例
- **出处**：`shooter/scenarios/simple_one_on_one.txt:38-48`
- **片段**：

```text
platform target1 AIR_TARGET
   icon F-18
   side red
   indestructible
   route
      position 38n 137e altitude 25000 ft agl
        speed 280 kts
      position 39:27:18n 137:04:12e altitude 25000 ft agl
        speed 280 kts
   end_route
end_platform
```

- **演示要点**：演示 platform 的参数：icon, side, indestructible, route

### platform（target）｜平台实例

- **关键词**：platform, heading, side, icon, route, 平台实例
- **出处**：`orwaca_iads/scenarios/target.txt:70-81`　（同签名共 2 处，另见 `orwaca_iads/scenarios/target.txt:55`）
- **片段**：

```text
platform target3 AIR_TARGET
   heading 133 deg
   side blue
   icon rafale_icon
   
   route
      position 49:33:27.35n 126:12:19.82w altitude 10000.00 ft
         speed 400 kts
      position 43:14:08.49n 117:28:12.49w
   end_route

end_platform
```

- **演示要点**：演示 platform 的参数：heading, side, icon, route

### platform（laydown）｜平台实例

- **关键词**：platform, side, category, route, heading, 平台实例
- **出处**：`simple_scenario/scenarios/laydown.txt:18-29`
- **片段**：

```text
platform SimpleStriker BLUE_STRIKER
   side blue
   category fighter
   route
   	#mach 0.9, 30K alt
      position 1.05n 1.05e altitude 30000 ft msl
         speed 580 kts
      position 1.05n 5.0e altitude 30000 ft msl
         speed 580 kts
   end_route
   heading 90 deg
end_platform
```

- **演示要点**：演示 platform 的参数：side, category, route, heading

### platform（uhf_radar）｜平台实例

- **关键词**：platform, position, add, update_interval, on_update, 平台实例
- **出处**：`swarm/scenarios/uhf_radar.txt:11-22`
- **片段**：

```text
platform uhf-radar  UHF_EW_RADAR_PLATFORM
  position 40.0n 87.7w
  add processor rotation WSF_SCRIPT_PROCESSOR
    update_interval 2.5 sec

    on_update
      double CurrentHeading = PLATFORM.Heading(); # -180 to 180...
      double NewHeading = CurrentHeading + 90;
      PLATFORM.SetHeading(NewHeading);
    end_on_update
  end_processor
end_platform
```

- **演示要点**：演示 platform 的参数：position, add, update_interval, on_update

### platform（terrain_demo）｜平台实例

- **关键词**：platform, side, icon, route, position, 平台实例
- **出处**：`terrain_following/terrain_demo.txt:62-73`　（同签名共 2 处，另见 `traffic_demos/scenarios/blue_strike.txt:9`）
- **片段**：

```text
platform test_flyer TEST_AIR_MOVER
  side blue
  icon F-15
  route
    position 36:08:00.00n 115:10:48.00w altitude 1000.00 ft agl
      speed 400 kts
    position 37:18:49.56n 115:10:48.00w altitude 1000.00 ft agl
      speed 400 kts
    position 38:29:39.13n 115:10:48.00w altitude 5000.00 ft agl
      speed 400 kts
  end_route
end_platform
```

- **演示要点**：演示 platform 的参数：side, icon, route, position

### platform（alv_demo）｜平台实例

- **关键词**：platform, side, position, sensor, execute, 平台实例
- **出处**：`alv_routing/alv_demo.txt:42-54`　（同签名共 5 处，另见 `alv_routing/alv_demo_with_jammer.txt:45`、`script_demos/script_demo_5.txt:394`、`script_demos/script_demo_6.txt:394`）
- **片段**：

```text
platform threat-ew-1 EW_RADAR_SITE
   side red
   position 39:31:42.42n 91:38:35.111w

   sensor ew-radar-1
      off
   end_sensor

   execute at_time 1 minutes absolute
      PLATFORM.TurnSensorOn("ew-radar-1");
   end_execute

end_platform
```

- **演示要点**：演示 platform 的参数：side, position, sensor, execute

### platform（false-target_command_center）｜平台实例

- **关键词**：platform, side, commander, track_manager, position, 平台实例
- **出处**：`electronic_warfare/false-target_command_center.txt:421-433`
- **片段**：

```text
platform command_center COMMAND_CENTER
  side red

  commander SELF

  track_manager
     correlation_method perfect end_correlation_method
     fusion_method weighted_average end_fusion_method
  end_track_manager

  position 35:50:42n 115:30:00w

end_platform
```

- **演示要点**：演示 platform 的参数：side, commander, track_manager, position

### platform（missile_comparison）｜平台实例

- **关键词**：platform, update_interval, icon, side, route, 平台实例
- **出处**：`p6dof/missile_comparison.txt:343-355`　（同签名共 8 处，另见 `p6dof/missile_comparison.txt:357`、`six_dof/pm6_missile_comparison.txt:488`、`six_dof/pm6_missile_comparison.txt:502`）
- **片段**：

```text
platform mig_target1 FA-LGT_RED

   update_interval 0.01 sec

   icon  mig29_rus
   side  red

   route
     position 21.26n 157.94w  altitude 24000.0 ft  speed 500.0 kts
     position 21.26n 157.25w  altitude 24000.0 ft  speed 500.0 kts
   end_route 
   
end_platform
```

- **演示要点**：演示 platform 的参数：update_interval, icon, side, route

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, side, icon, add, route, 平台实例
- **出处**：`route_finder_demos/3d_route_finder.txt:190-202`
- **片段**：

```text
platform striker1 WSF_PLATFORM
   side blue
   icon F-18E
   add mover WSF_AIR_MOVER
      update_interval 1 sec
      at_end_of_path stop
   end_mover
   route
      position 00.17462n 03.86294e altitude 35000 ft msl speed 450 knots
      position 00.17462n 02.86294e altitude 35000 ft msl speed 450 knots
   end_route
   add processor router 3D_ROUTER end_processor
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：side, icon, add, route

### platform（naval_sam_test）｜平台实例

- **关键词**：platform, side, icon, route, processor, 平台实例
- **出处**：`ship_ad/scenarios/naval_sam_test.txt:37-49`
- **片段**：

```text
platform target-1 RED_ASM_MSL
   side red
   icon MIG-29
   route
      position 30:00:00n  77:30:00w altitude 9000 m agl
         speed 700 kts
      position 30:00:00n  78:00:00w altitude 9000 m agl
         speed 700 kts
   end_route
   processor fuse
      off
   end_processor
end_platform
```

- **演示要点**：演示 platform 的参数：side, icon, route, processor

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, icon, side, empty_mass, add, 平台实例
- **出处**：`multiresolution_demos/space_mover_demo.txt:53-66`　（同签名共 3 处，另见 `satellite_demos/aerobraking_demo.txt:28`、`cislunar/scenarios/orbiter.txt:11`）
- **片段**：

```text
platform test_sat2 WSF_PLATFORM
   icon satellite
   side red
   empty_mass 100 kg
   add mover WSF_SPACE_MOVER
      update_interval 5 sec
      eccentricity 1e-3
      semi_major_axis 6600 km
      raan 0 deg
      inclination 0 deg
      true_anomaly 0 deg
      argument_of_periapsis 0 deg
   end_mover
end_platform   
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, empty_mass, add

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, icon, side, radar_signature, add, 平台实例
- **出处**：`cyber/exfiltrate_demo/MITM_exfiltrate_demo.txt:21-34`
- **片段**：

```text
platform red_returning WSF_PLATFORM
   icon fighter
   side red
   radar_signature basic_plane

   add mover WSF_AIR_MOVER
      route 
         position 34:35:01.08n 117:02:39.89w altitude 35000 ft
            speed 460 kts
         position 38:26:31.955n 117:12:26.494w
            altitude 35000 ft 
      end_route
   end_mover
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, radar_signature, add

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, position, heading, add, execute, 平台实例
- **出处**：`sensor_plot/radar/vm-ucav-soj.txt:35-48`　（同签名共 3 处，另见 `sensor_plot/radar/hm-pass-detect.txt:78`、`sensor_plot/radar/hm-ucav-soj.txt:36`）
- **片段**：

```text
platform jammer-1 WSF_PLATFORM
   position 0.0n 0.5e altitude 30000 ft
   heading 270 deg
  add weapon jammer SOJ_SBAND_JAMMER
     off
     #power 100 w   // if the power should need adjusting
     yaw 0.0 deg
  end_weapon
  execute at_time 0.001 minutes absolute
     WsfWeapon jammer = PLATFORM.Weapon("jammer");
     // Any of the jamming routines can be used at this point
     jammer.StartJamming(3000000000., 20000000.);
  end_execute
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：position, heading, add, execute

### platform（many_red_launchers）｜平台实例

- **关键词**：platform, side, position, processor, track, 平台实例
- **出处**：`ballistic_missile_shootdown/scenarios/many_red_launchers.txt:15-29`　（同签名共 10 处，另见 `ballistic_missile_shootdown/scenarios/many_red_launchers.txt:31`、`ballistic_missile_shootdown/scenarios/many_red_launchers.txt:47`、`ballistic_missile_shootdown/scenarios/many_red_launchers.txt:64`）
- **片段**：

```text
platform red_mrbm_1_launcher01 RED_MRBM_1_LAUNCHER
   side red
   position 54:45:17.31n 100:17:12.12w
   processor launch_ssm_processor
     script_variables
       TIME_TO_LAUNCH = 60 ; # sim time in seconds
       LAUNCH_RANDOM = true; # uncomment this if you want to randomize the launch time
       MIN_TIME      = 10; # minimum random launch time for this weapon
       MAX_TIME      = 200; # maximum random launch time for this weapon
     end_script_variables
   end_processor
   track
     platform target01
   end_track
end_platform
```

- **演示要点**：演示 platform 的参数：side, position, processor, track

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, category, side, icon, add, 平台实例
- **出处**：`comm/platforms/detector.txt:61-75`
- **片段**：

```text
platform spectator WSF_PLATFORM
   category ad_hoc
   side blue
   icon f-35
   
   add mover WSF_AIR_MOVER
      route
         position 40n 102w altitude 30000 ft speed 3000 km/hr
         position 40n 98w altitude 30000 ft speed 3000 km/hr extrapolate
      end_route
   end_mover
   
   add comm ad_hoc AD_HOC end_comm
   add router default DEFAULT end_router
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：category, side, icon, add

### platform（script_demo_2）｜平台实例

- **关键词**：platform, side, command_chain, sensor, route, 平台实例
- **出处**：`script_demos/script_demo_2.txt:512-526`
- **片段**：

```text
platform early_warning_aircraft-1 EARLY_WARNING_AIRCRAFT
   side blue
   command_chain GOOD_GUYS SELF

   sensor esm-1
      on
   end_sensor

   route
      position 39n 90w altitude 30000 ft speed 450 kts
      position 40n 90w
      position 40n 89:30w
      position 39n 89:30w
   end_route
end_platform
```

- **演示要点**：演示 platform 的参数：side, command_chain, sensor, route

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, optical_signature, icon, script, on_initialize, 平台实例
- **出处**：`space_operations/moon_as_satellite.txt:40-54`
- **片段**：

```text
platform moon WSF_PLATFORM
   optical_signature MOON_SIGNATURE
   icon Satellite

   script void UpdateLocation()
      Calendar c = WsfDateTime.CurrentTime();
      Vec3 moonLocECI = Moon.LocationECI(c);
      Vec3 moonLocWCS = ConvertECIToWCS(moonLocECI);
      SetLocation(WsfGeoPoint.ConstructWCS(moonLocWCS));
   end_script

   on_initialize
      UpdateLocation();
   end_on_initialize
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：optical_signature, icon, script, on_initialize

### platform（simple_auto_jamming）｜平台实例

- **关键词**：platform, side, route, sensor, track, 平台实例
- **出处**：`electronic_warfare/simple_auto_jamming.txt:408-423`
- **片段**：

```text
platform ew-radar-site EW_RADAR_SITE
   side red

   route
      position 37:00:00n 116:00:00w
      altitude 0.0 ft agl
      heading   90 deg
    end_route

   sensor ew_radar
   end_sensor

   track
      platform jammer
   end_track
end_platform
```

- **演示要点**：演示 platform 的参数：side, route, sensor, track

### platform（track_drop_maintain_effect）｜平台实例

- **关键词**：platform, side, route, weapon, execute, 平台实例
- **出处**：`electronic_warfare/track_drop_maintain_effect.txt:251-267`
- **片段**：

```text
platform jammer JAMMER_PLATFORM
   side blue

   route
      position 36:45:48n 114:51:30w
      altitude 35000 ft
      speed      450 kts
      heading    270 deg
   end_route

   weapon jammer
   end_weapon

   execute at_time 5.0 sec absolute
      PLATFORM.Weapon("jammer").TurnOn();
   end_execute
end_platform
```

- **演示要点**：演示 platform 的参数：side, route, weapon, execute

### platform（j11_out）｜平台实例

- **关键词**：platform, side, route, processor, execute, 平台实例
- **出处**：`l16_j11/j11_out.txt:71-87`
- **片段**：

```text
platform blue-1 WEAPON_FIGHTER
   side blue

   route
      position 35:35n 117:55w altitude 10000 ft speed 200.0 m/s
      position 35:35n 120:30w
   end_route

   processor l16_computer
      decimal_track_number 120
   end_processor

   execute at_time 15 s absolute
      PLATFORM.Weapon("network_enabled_weapon").Fire();
   end_execute

end_platform
```

- **演示要点**：演示 platform 的参数：side, route, processor, execute

### platform（script_demo_1）｜平台实例

- **关键词**：platform, side, icon, command_chain, route, 平台实例
- **出处**：`script_demos/script_demo_1.txt:186-202`
- **片段**：

```text
platform strike-1 FIGHTER
   side blue
   icon FIGHTER
   command_chain GOOD_GUYS SELF
   route
#     Take off
      position 38:44:52.3n 90:21:36.4w altitude 6 ft agl speed 10 kts
      position 38:45:07.6n 90:22:09.4w altitude 6 ft agl speed 120 kts # climb_rate 1000 fpm
      position 38:49:00n 90:29:00w altitude 15000 ft speed 400 kts
      position 39:29:00n 91:30:00w altitude 35000 ft
      position 38:45:00n 90:06:08w
      position 38:38:24n 90:07:46w altitude 10000 ft speed 250 kts
#     Landing
      position 38:44:52.3n 90:21:36.4w altitude 6 ft agl speed 120 kts
      position 38:45:07.6n 90:22:09.4w altitude 6 ft agl speed 0 kts
   end_route
end_platform
```

- **演示要点**：演示 platform 的参数：side, icon, command_chain, route

### platform（air-to-air-rt1）｜平台实例

- **关键词**：platform, side, route, sensor, weapon, 平台实例
- **出处**：`electronic_warfare/air-to-air-rt1.txt:338-355`　（同签名共 3 处，另见 `electronic_warfare/air-to-air-rt2.txt:338`、`electronic_warfare/semi-auto_repeater_jamming_1.txt:374`）
- **片段**：

```text
platform jammer JAMMER
   side blue

   route
      position 37:00:00n 114:30:00w
      altitude 35000 ft
      speed      450 kts
      heading    -90 deg
   end_route

   sensor esm
      on
   end_sensor

   weapon jammer
      on
   end_weapon
end_platform
```

- **演示要点**：演示 platform 的参数：side, route, sensor, weapon

### platform（blue_multirole_fighter_1_launch_blue_asm_missile）｜平台实例

- **关键词**：platform, side, route, track, execute, 平台实例
- **出处**：`new_guidance/scenarios/blue_multirole_fighter_1_launch_blue_asm_missile.txt:32-50`　（同签名共 2 处，另见 `new_guidance/scenarios/blue_multirole_fighter_1_launch.txt:32`）
- **片段**：

```text
platform fighter FIGHTER
   side blue
   route
      position 39.5n 89.3w altitude 25000 ft speed 450 kts heading 270 deg
   end_route

   track
      position 38.6n 90.3w altitude 1 m agl
      platform target
   end_track

   execute at_time 0.1 sec relative
      WsfLocalTrackList trackList = PLATFORM.MasterTrackList();
      WsfLocalTrack track = trackList.Entry(0);
      PLATFORM.Weapon("blue_asm_missile").Fire(track);
      PLATFORM.TurnToRelativeHeading(179.0, 0.25 * 9.8);
   end_execute

end_platform
```

- **演示要点**：演示 platform 的参数：side, route, track, execute

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, icon, position, add, execute, 平台实例
- **出处**：`signature_demos/scenarios/rocket_launch.txt:17-35`
- **片段**：

```text
platform launcher WSF_PLATFORM
   icon wedge
   position 25.6n 80.7w altitude 0 m msl heading -30 deg

   add weapon launcher WSF_EXPLICIT_WEAPON
      launched_platform_type ROCKET
      location 0.0 0.0 -5.15 m
      tilt 89.9 degrees
      quantity 1

      launch_computer WSF_LAUNCH_COMPUTER
         commanded_loft_angle 83.3555 deg    # This just about hits 'target' 
      end_launch_computer
   end_weapon

   execute at_time 1 sec relative
      WeaponEntry(0).Fire();
   end_execute
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, position, add, execute

### platform（comm_jamming）｜平台实例

- **关键词**：platform, icon, side, add, execute, 平台实例
- **出处**：`electronic_warfare/comm_jamming.txt:254-274`
- **片段**：

```text
platform red-jammer JAMMER-TYPE
   icon EA-6B
   side red

   // --- Add Offset Mover
   add mover WSF_OFFSET_MOVER
      update_interval 1.5 sec
      update_time_tolerance .25 sec
      attachment_type rigid
      reference_platform blue-surveillance
      offset_from_reference -3200 m -1000 m 0 m    // about 2 mi back
      orphan_action extrapolate
   end_mover

   execute at_time 1000.0 sec absolute
      WsfWeapon jammer = PLATFORM.Weapon("jammer");
      // Any of the jamming routines can be used at this point
      jammer.StartJamming(2400000000., 1000000., "noise_jamming");
      #jammer.SetEA_DeltaGainTechnique("power_adjust", true, "delta_power", -3.0, "", "SENSOR", 0.0, 0.0);
   end_execute
end_platform
```

- **演示要点**：演示 platform 的参数：icon, side, add, execute

### platform（formation_tanking）｜平台实例

- **关键词**：platform, icon, side, route, execute, 平台实例
- **出处**：`p6dof/formation_tanking.txt:97-117`　（同签名共 3 处，另见 `six_dof/pm6_formation_tanking.txt:97`、`six_dof/rb6_formation_tanking.txt:97`）
- **片段**：

```text
platform lambda C-HVY
   icon kc46ext
   side blue
   
   route
      position 0.122n 0.750w altitude 10000 ft speed 450.0 knots
      position 0.122n 0.740w altitude 10000 ft speed 450.0 knots
      position 0.122n 0.730w altitude 10000 ft speed 450.0 knots
   end_route

   execute at_time 0.1 min absolute
      // Set limits on this platform so it will take its turns nice
      // and easy.
      WsfP6DOF_Mover mov = (WsfP6DOF_Mover)PLATFORM.Mover();
      mov.SetBankAngleMax(20.0);
      mov.SetRollRateMax(1.0);

      WsfManeuver orbit = CreateOrbitManeuver();
      mov.ExecuteManeuver(orbit);
   end_execute
end_platform
```

- **演示要点**：演示 platform 的参数：icon, side, route, execute

### platform（parachute_example）｜平台实例

- **关键词**：platform, side, position, route, add, 平台实例
- **出处**：`parachute/parachute_example.txt:88-108`
- **片段**：

```text
platform blue_airlifter_jet BLUE_AIRLIFTER_JET
   side blue
   position 39:31:42.42n 91:38:35.111w
   route
      position 39:31:42n 91:38:35w altitude 30000 ft speed 300 kts
      position 39:31:40n 91:30:00w altitude 30000 ft speed 300 kts
   end_route

   add processor script WSF_SCRIPT_PROCESSOR
      update_interval 1.0 sec
      on_update 
         if (TIME_NOW > 1.0)
         {
            #writeln("TIME_NOW ", TIME_NOW);
            WsfWeapon weapon = PLATFORM.Weapon("parachute");
            weapon.Fire();
            PROCESSOR.TurnOff();
          }
      end_on_update
    end_processor
end_platform
```

- **演示要点**：演示 platform 的参数：side, position, route, add

### platform（script_demo_2）｜平台实例

- **关键词**：platform, side, command_chain, route, weapon, 平台实例
- **出处**：`script_demos/script_demo_2.txt:528-548`
- **片段**：

```text
platform strike-1 FIGHTER_BOMBER
   side blue
   command_chain GOOD_GUYS early_warning_aircraft-1
   route
#     Take off
      position 38:44:52.3n 90:21:36.4w altitude 6 ft agl speed 20 kts
      position 38:45:07.6n 90:22:09.4w altitude 6 ft agl speed 120 kts # climb_rate 1000 fpm
      position 38:49:00n 90:29:00w altitude 15000 ft speed 400 kts
      position 39:29:00n 91:30:00w altitude 35000 ft
      position 38:45:00n 90:06:08w
      position 38:38:24n 90:07:46w altitude 10000 ft speed 250 kts
#     Landing
      position 38:44:52.3n 90:21:36.4w altitude 6 ft agl speed 120 kts
      position 38:45:07.6n 90:22:09.4w altitude 6 ft agl speed 0 kts
   end_route

   weapon bomb_1000_lb
      quantity 4
      firing_interval 2 sec
   end_weapon
end_platform
```

- **演示要点**：演示 platform 的参数：side, command_chain, route, weapon

### platform（chaff_example_ttr）｜平台实例

- **关键词**：platform, side, position, route, execute, 平台实例
- **出处**：`chaff/chaff_example_ttr.txt:97-120`　（同签名共 2 处，另见 `chaff/chaff_example.txt:88`）
- **片段**：

```text
platform blue_airlifter_jet BLUE_AIR_LIFTER_JET
   side blue

   position 39:31:42.42n 91:38:35.111w

   route
      position 47:31:42n 120:42:35w altitude 30000 ft speed 200 kts
   end_route

   execute at_time 5.0 sec absolute
      WsfChaffWeapon weapon = (WsfChaffWeapon)PLATFORM.Weapon("chaff");
      bool fired = weapon.DropChaffCloud(10, 1.0, {"eject-1", "eject-2", "eject-3"});
   end_execute

   execute at_time 65.0 sec absolute
      WsfChaffWeapon weapon = (WsfChaffWeapon)PLATFORM.Weapon("chaff");
      bool fired = weapon.DropChaffCloud(10, 2.0, {"eject-1", "eject-3"});
   end_execute

   execute at_time 125.0 sec absolute
      WsfChaffWeapon weapon = (WsfChaffWeapon)PLATFORM.Weapon("chaff");
      bool fired = weapon.DropChaffCloud(10, 3.0, {"eject-2"});
   end_execute
end_platform
```

- **演示要点**：演示 platform 的参数：side, position, route, execute

### platform（eoir_demo_w_zone_attn）｜平台实例

- **关键词**：platform, side, route, execute, edit, 平台实例
- **出处**：`sensor_demos/scenarios/eoir_demo_w_zone_attn.txt:31-56`
- **片段**：

```text
platform uav UAV
   side blue

   route
      position 34:30:00n 116:00w altitude 60000 ft speed 350 kts heading 0 deg
   end_route

   execute at_time 1 min relative
       BeginImaging("eoir", "", -90, 68000);
   end_execute
   execute at_time 4 min relative
       EndImaging();
   end_execute

   execute at_time 7 min relative
      BeginImaging("eoir", "", -90, 150000);
   end_execute
   execute at_time 10 min relative
      EndImaging();
   end_execute

   edit sensor eoir
      #debug
      modifier_category building_los_category
   end_sensor
end_platform
```

- **演示要点**：演示 platform 的参数：side, route, execute, edit

### platform（launch4tbms）｜平台实例

- **关键词**：platform, side, position, weapon, add, 平台实例
- **出处**：`tbm_demos/scenarios/launch4tbms.txt:13-41`
- **片段**：

```text
platform tbm3-launcher TBM3_LAUNCHER
   side red
   position 38:45n 90:25w heading 90 deg

   weapon tbm3-missile
      quantity 4
   end_weapon

   add processor script WSF_SCRIPT_PROCESSOR
      update_interval 30.0 sec
      on_update 
         if (TIME_NOW > 1.0)
         {
            writeln("TIME_NOW ", TIME_NOW);
            WsfWeapon tbm = PLATFORM.Weapon("tbm3-missile");
            tbm.SetPitch(55.0);
            tbm.Fire();
            tbm.SetPitch(65.0);
            tbm.Fire();
            tbm.SetPitch(75.0);
            tbm.Fire();
            tbm.SetPitch(85.0);
            tbm.Fire();
            PROCESSOR.TurnOff();
         }
      end_on_update
   end_processor

end_platform
```

- **演示要点**：演示 platform 的参数：side, position, weapon, add

### platform（stationary_storage_depots）｜平台实例

- **关键词**：platform, icon, position, edit, on_initialize, 平台实例
- **出处**：`logistics/scenarios/stationary_storage_depots.txt:14-45`　（同签名共 4 处，另见 `logistics/scenarios/stationary_storage_depots.txt:124`、`logistics/scenarios/stationary_storage_depots.txt:48`、`logistics/scenarios/stationary_storage_depots.txt:86`）
- **片段**：

```text
platform GalvestonPierFuelDepot STATIONARY_STORAGE_DEPOT

   icon cmd_post
   # This guy has an 'endless' supply of product, and will never need to request of anyone.
   # He will supply to the <various> shuttling Ocean Going Tankers assigned to him.
   # He will automatically supply to any requester, but only to one at a time.

   position 29.3167n 94.7833w # Port of Galveston, TX

   edit processor exchanger
      edit container fuel_container
         commodity JP-8_FUEL
            maximum_mass_quantity 20000000.0 kg
            mass_rate                  277.8 kg/sec
         end_commodity
         initial_mass_quantity 10000000.0 kg # Half Full
      end_container
      edit transactor fuel_offering_transactor
         time_out_clock_interval 3 sec
      end_transactor
      edit transactor fuel_requesting_transactor
         time_out_clock_interval 3 sec
      end_transactor
   end_processor

   on_initialize
      doIntendToSupplyFuel = true;
      fuelPossibleReceiversToAdd.PushBack("GalvestonBasedTanker_1");
      fuelPossibleReceiversToAdd.PushBack("GalvestonBasedTanker_2");
   end_on_initialize

end_platform
```

- **演示要点**：演示 platform 的参数：icon, position, edit, on_initialize

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, position, add, script, execute, 平台实例
- **出处**：`sensor_demos/scanning_eoir.txt:24-65`
- **片段**：

```text
platform test_scan_cam WSF_PLATFORM
   position 0n 0w heading 180 deg
   add sensor cam WSF_EOIR_SENSOR
      on
      azimuth_slew_limits -90 degrees 90 degrees
      elevation_slew_limits -20 degrees -5 degrees
      slew_mode both
      reports_location
      frame_time 1 s
      angular_resolution .1 degrees
      azimuth_field_of_view -10 deg 10 deg
      update_interval 1 s
      location 0 0 -100 m
      internal_link vid_proc
   end_sensor
   add processor vid_proc WSF_IMAGE_PROCESSOR
      internal_link proc
   end_processor
   add processor proc WSF_SCRIPT_PROCESSOR
      on_message
         type WSF_TRACK_MESSAGE
            script
               writeln(TIME_NOW, " detected Sensor Yaw: ", PLATFORM.Sensor("cam").Yaw());
            end_script
      end_on_message
   end_processor
   script bool IsBetween(double value, double min, double max)
      return (value >= min) && (value <= max);
   end_script

   execute at_interval_of 1 s
      static int sign = -1;
      double yaw = PLATFORM.Sensor("cam").Yaw();
      writeln(TIME_NOW, " Yaw ", yaw);
      if (!IsBetween(yaw, -90, 90))
      {
         sign = -sign;
         writeln("Sign ", sign);
      }
      PLATFORM.Sensor("cam").SetYaw(yaw + sign * MATH.PI()/32);
   end_execute
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：position, add, script, execute

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, icon, position, script, execute, 平台实例
- **出处**：`space_operations/moon_as_satellite.txt:58-105`
- **片段**：

```text
platform observer WSF_PLATFORM
   icon x_marker
   position 39n 90w

   # Return the magnitude of an object in the visual band.
   script double Magnitude_v(double aI_obj,     # Radiant intensity (W/sr)
                             double aD_obj)     # Distance to the object (m)

      # m_obj - m_ref = -2.5 * log10(I_obj/I_ref)
      double m_sun = -26.74;           # According to Wikipedia
      double I_sun = 1.364221e+25;     # Radiant intensity (W/sr) of the sun in the visual band (from code)
      Calendar c = WsfDateTime.CurrentTime();
      double D_sun = Sun.LocationECI(c).Magnitude();
      double E_sun = I_sun / (D_sun * D_sun);      # Irradiance of the Sun at the Earth (W/m2)
      double E_obj = aI_obj / (aD_obj * aD_obj);   # Irradiance of the object at the Earth (W/m2)
      double m_obj = m_sun - 2.5 * Math.Log10(E_obj / E_sun);
      return m_obj;
   end_script

   script void Sample()
      # Update the position of our moon "platform".
      WsfPlatform moon = WsfSimulation.FindPlatform("moon");
      moon->UpdateLocation();

      WsfGeoPoint viewer = Location();
      double I_moon = moon.RadiantIntensity(viewer, 1.0, "visual");
      double m_moon = Magnitude_v(I_moon, moon.LocationWCS().Magnitude());

      Calendar c = WsfDateTime.CurrentTime();
      double phase = Moon.Phase(c);
      double illumination = Moon.Illumination(c);
      writeln(c.ToStringLocalDate(-6).Pad(11), ' ', c.ToStringLocalTime(-6),
              " Phase=", Format.Fixed(phase, 2).Pad(6),
              ", Illum=", Format.Fixed(illumination, 4).Pad(5),
              ", Sig=", Format.Scientific(I_moon, 5).Pad(10), " w/sr",
              ", Mag=", Format.Fixed(m_moon, 2).Pad(6));
   end_script

   script void SampleAndRepeat()
      Sample();
      ExecuteAtTime(TIME_NOW + 3600.0, "SampleAndRepeat");
   end_script

   execute at_time 1.0 sec absolute
      writeln("T=",TIME_NOW);
      SampleAndRepeat();
   end_execute
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, position, script, execute

### platform（ldt_designator_only）｜平台实例

- **关键词**：platform, script_variables, update_interval, on_update, on_initialize, 平台实例
- **出处**：`hellfire/laser_designation_via_dis/ldt_designator_only.txt:41-93`　（同签名共 3 处，另见 `hellfire/laser_designation_via_dis/ldt_three_platforms_combined.txt:40`、`hellfire/semiactive_laser_hellfire/ldt_combined_test.txt:81`）
- **片段**：

```text
platform designator AH-64A

   script_variables

      WsfSensor       mySensor;
      WsfPlatform     myTarget;
      WsfTrack        myTrack;
      bool ok           = true;
      bool errorPrinted = false;

   end_script_variables

   update_interval 1.0 sec

   on_update
         myTarget = WsfSimulation.FindPlatform("<dis>1:2:1");
         ok = myTarget.IsValid();
         if (ok)
         {
            myTrack = myTarget.MakeTrack();
            ok = myTrack.IsValid();
            if (ok)
            {
               mySensor.CueToTrack(myTrack);
               writeln("currently cued");
            }
            else if (! errorPrinted)
            {
               writeln("Track is not valid");
               #errorPrinted = true;
            }
         }
         else if (! errorPrinted)
         {
            writeln("Target not found");
            #errorPrinted = true;
         }
   end_on_update

   on_initialize
      mySensor = Sensor("laser_designator");
      ok = mySensor.IsValid();
      if (ok)
      {
         mySensor.TurnOn();
      }
      else if (! errorPrinted)
      {
         writeln("ERROR:  Sensor of specified name not found.");
         errorPrinted = true;
      }
   end_on_initialize
end_platform
```

- **演示要点**：演示 platform 的参数：script_variables, update_interval, on_update, on_initialize

### platform（shuttle-tspi-demo）｜平台实例

- **关键词**：platform, script_variables, on_initialize, edit, execute, 平台实例
- **出处**：`satellite_demos/shuttle-tspi-demo.txt:54-170`
- **片段**：

```text
platform discovery-nom SPACE_SHUTTLE  // NOMinal Ascent Scenario
   script_variables
      WsfDraw mDraw = WsfDraw();  // todo mark comment bubble locations with WsfDraw.
   end_script_variables

   on_initialize
      mDraw.BeginPoints();
      mDraw.SetPointSize(10);
      mDraw.SetId("points-of-interest");
   end_on_initialize

   edit mover
      TSPI_filename ./tspi/DATA_NOM.txt
   end_mover
   execute at_time  1 s absolute
      PLATFORM.Comment("Abort option: RTLS Only");
      //mDraw.SetColor(0.0, 1.0, 0.0);
      //mDraw.Vertex(PLATFORM);
   end_execute
   execute at_time 11 s absolute
      PLATFORM.Comment("Start Roll");
      //mDraw.SetColor(0.0, 0.0, 1.0);
      //mDraw.Vertex(PLATFORM);
   end_execute
   execute at_time 18 s absolute
      PLATFORM.Comment("End Roll");
   end_execute
   execute at_time 33 s absolute
      PLATFORM.Comment("Start Throttle Down (72%)");
   end_execute
   execute at_time 45 s absolute
      PLATFORM.Comment("Start Throttle Up (104.5%)");
   end_execute
   execute at_time 60 s absolute
      PLATFORM.Comment("Max. Q (742 psf)");
   end_execute
   execute at_time 124 s absolute
      PLATFORM.Comment("SRB Separation");
   end_execute
   execute at_time 134 s absolute
      PLATFORM.Comment("Start OMS Assist");
   end_execute
   execute at_time 139 s absolute
      PLATFORM.Comment("Abort option: TAL Available");
   end_execute
   execute at_time 141 s absolute
      PLATFORM.Comment("2E TAL Moron");
   end_execute
   execute at_time 146 s absolute
      PLATFORM.Comment("2E TAL Zarazoga");
   end_execute
   execute at_time 156 s absolute
      PLATFORM.Comment("2E TAL Istres");
   end_execute
   execute at_time 232 s absolute
      PLATFORM.Comment("Negative Return (KSC)");
   end_execute
   execute at_time 287 s absolute
      PLATFORM.Comment("Abort option: ATO Available");
   end_execute
   execute at_time 322 s absolute
      PLATFORM.Comment("Droop Zaragoza");
   end_execute
   execute at_time 325 s absolute
      PLATFORM.Comment("1E OPS-3 Zaragoza");
   end_execute
   execute at_time 346 s absolute
      PLATFORM.Comment("Roll to Heads-Up");
   end_execute
   execute at_time 363 s absolute
      PLATFORM.Comment("1E TAL Zarazoga");
   end_execute
   execute at_time 387 s absolute
      PLATFORM.Comment("2E Normal Orbit Possible");
   end_execute
   execute at_time 387 s absolute
      PLATFORM.Comment("1E TAL Moron");
   end_execute
   execute at_time 387 s absolute
      PLATFORM.Comment("1E TAL Istres");
   end_execute
   execute at_time 387 s absolute
      PLATFORM.Comment("1E TAL Istres");
   end_execute
   execute at_time 441 s absolute
      PLATFORM.Comment("Negative Moron");
   end_execute
   execute at_time 441 s absolute
      PLATFORM.Comment("3G Limiting");
   end_execute
   execute at_time 461 s absolute
      PLATFORM.Comment("Last 2E Pre-MECO TAL Zarazoga");
   end_execute
   execute at_time 461 s absolute
      PLATFORM.Comment("Negative Istres");
   end_execute
   execute at_time 467 s absolute
      PLATFORM.Comment("Last 1E Pre-MECO TAL Zarazoga");
   end_execute
   execute at_time 472 s absolute
      PLATFORM.Comment("Last 3E Pre-MECO TAL Zarazoga");
   end_execute
   execute at_time 497 s absolute
      PLATFORM.Comment("Last TAL Diego Garcia");
   end_execute
   execute at_time 503 s absolute
      PLATFORM.Comment("MECO");
   end_execute
   execute at_time 509 s absolute
      PLATFORM.Comment("Zero Thrust");
   end_execute

   execute at_time 900 s absolute
      mDraw.End();
   end_execute

end_platform
```

- **演示要点**：演示 platform 的参数：script_variables, on_initialize, edit, execute

### platform（alternate_tactical_maneuvers）｜平台实例

- **关键词**：platform, route, follow_vertical_track, script, execute, 平台实例
- **出处**：`p6dof/alternate_tactical_maneuvers.txt:162-390`　（同签名共 4 处，另见 `six_dof/comparison_alternate_tactical_maneuvers.txt:184`、`six_dof/pm6_alternate_tactical_maneuvers.txt:162`、`six_dof/rb6_alternate_tactical_maneuvers.txt:162`）
- **片段**：

```text
platform ManeuverFighter RedFighter
   route
      position   21.180n  158.55w  altitude 5000.0 ft  speed 550.0 kts
      position   21.480n  157.95w  altitude 5000.0 ft  speed 550.0 kts
      position   21.520n  157.95w  altitude 5000.0 ft  speed 550.0 kts
   end_route
   follow_vertical_track

   script void SetInitialRanges(WsfP6DOF_Mover aMover)
      aMover.SetBankAngleMax(180.0);
      aMover.SetPitchGLoadMax(8.0);
      aMover.SetPitchGLoadMin(0.0);
      aMover.SetRollRateMax(180.0);
   end_script

   # This method and those that follow take the place of the scripts that
   # execute at the equivalent times in the original TacticalManeuvers
   # demo. Some of these return a single maneuver, and some a sequence
   # of maneuvers. All of these maneuvers are 'elemental' maneuvers: they
   # set a single channel on the autopilot as their entire operation.
   # More complex behaviors are pieced together out of elemental maneuvers.
   script WsfManeuver FiveSeconds()
      WsfSpeedKCAS_Maneuver mvr = WsfSpeedKCAS_Maneuver.Construct(6000.0);
      mvr.SetEntryConstraint(WsfManeuverConstraint.AT_TIME(5.0));
      return mvr;
   end_script

   script WsfManeuver TwentySeconds()
      WsfManeuverSequence retval = WsfManeuverSequence.Construct();
      retval.SetEntryConstraint(WsfManeuverConstraint.AT_TIME(20.0));

      retval.Append(WsfPitchDeltaManeuver.Construct(88.0));
      retval.Append(WsfRollDeltaManeuver.Construct(0.0));

      return retval;
   end_script

   script WsfManeuver ThirtySeconds()
      WsfManeuverSequence retval = WsfManeuverSequence.Construct();
      retval.SetEntryConstraint(WsfManeuverConstraint.AT_TIME(30.0));

      retval.Append(WsfRollDeltaManeuver.Construct(90.0));
      retval.Append(WsfPitchDeltaManeuver.Construct(0.0));

      return retval;
   end_script

   script WsfManeuver FortySeconds()
      WsfManeuverSequence retval = WsfManeuverSequence.Construct();
      retval.SetEntryConstraint(WsfManeuverConstraint.AT_TIME(40.0));

      retval.Append(WsfRollDeltaManeuver.Construct(0.0));
      retval.Append(WsfPitchDeltaManeuver.Construct(180.0));
      retval.Append(WsfSpeedKCAS_Maneuver.Construct(450.0));

      return retval;
   end_script

   script WsfManeuver SeventySeconds()
      WsfManeuverSequence retval = WsfManeuverSequence.Construct();
      retval.SetEntryConstraint(WsfManeuverConstraint.AT_TIME(70.0));

      retval.Append(WsfRollDeltaManeuver.Construct(0.0));
      retval.Append(WsfPitchDeltaManeuver.Construct(90.0));

      return retval;
   end_script

   script WsfManeuver EightyFiveSeconds()
      WsfManeuverSequence retval = WsfManeuverSequence.Construct();
      retval.SetEntryConstraint(WsfManeuverConstraint.AT_TIME(85.0));

      retval.Append(WsfRollDeltaManeuver.Construct(0.0));
      retval.Append(WsfPitchDeltaManeuver.Construct(20.0));

      return retval;
   end_script

   script WsfManeuver NinetySeconds()
      WsfManeuverSequence retval = WsfManeuverSequence.Construct();
      retval.SetEntryConstraint(WsfManeuverConstraint.AT_TIME(90.0));

      retval.Append(WsfRollRateManeuver.Construct(30.0));
      retval.Append(WsfPitchRateManeuver.Construct(20.0));

      return retval;
   end_script

   script WsfManeuver OneHundredTenSeconds()
      WsfManeuverSequence retval = WsfManeuverSequence.Construct();
      retval.SetEntryConstraint(WsfManeuverConstraint.AT_TIME(110.0));

      retval.Append(WsfRollAngleManeuver.Construct(88.0));
      retval.Append(WsfPitchGLoadManeuver.Construct(6.0));

      return retval;
   end_script

   script WsfManeuver OneHundredTwentySeconds()
      WsfManeuverSequence retval = WsfManeuverSequence.Construct();
      retval.SetEntryConstraint(WsfManeuverConstraint.AT_TIME(120.0));

      retval.Append(WsfRollAngleManeuver.Construct(0.0));
      retval.Append(WsfFlightPathAngleManeuver.Construct(0.0));

      return retval;
   end_script

   script WsfManeuver OneHundredFiftySeconds()
      WsfManeuverSequence retval = WsfManeuverSequence.Construct();
      retval.SetEntryConstraint(WsfManeuverConstraint.AT_TIME(150.0));

      retval.Append(WsfRollAngleManeuver.Construct(75.0));
      retval.Append(WsfPitchGLoadManeuver.Construct(8.0));

      return retval;
   end_script

   script WsfManeuver TwoHundredFortyFiveSeconds()
      WsfManeuverSequence retval = WsfManeuverSequence.Construct();
      retval.SetEntryConstraint(WsfManeuverConstraint.AT_TIME(245.0));

      retval.Append(WsfRollAngleManeuver.Construct(-70.0));
      retval.Append(WsfPitchGLoadManeuver.Construct(8.0));
      retval.Append(WsfSpeedKCAS_Maneuver.Construct(4500.0));

      return retval;
   end_script

   script WsfManeuver ThreeHundredSeconds()
      WsfManeuverSequence retval = WsfManeuverSequence.Construct();
      retval.SetEntryConstraint(WsfManeuverConstraint.AT_TIME(300.0));

      retval.Append(WsfRollAngleManeuver.Construct(0.0));
      retval.Append(WsfFlightPathAngleManeuver.Construct(0.0));
      retval.Append(WsfSpeedKCAS_Maneuver.Construct(600.0));

      return retval;
   end_script

   script WsfManeuver ThreeHundredThirtySeconds()
      WsfManeuverSequence retval = WsfManeuverSequence.Construct();
      retval.SetEntryConstraint(WsfManeuverConstraint.AT_TIME(330.0));

      retval.Append(WsfPitchDeltaManeuver.Construct(88.0));
      retval.Append(WsfSpeedKCAS_Maneuver.Construct(600.0));

      return retval;
   end_script

   script WsfManeuver ThreeHundredFiftyFiveSeconds()
      WsfManeuverSequence retval = WsfManeuverSequence.Construct();
      retval.SetEntryConstraint(WsfManeuverConstraint.AT_TIME(355.0));

      retval.Append(WsfRollDeltaManeuver.Construct(-90.0));
      retval.Append(WsfPitchGLoadManeuver.Construct(0.0));
      retval.Append(WsfSpeedKCAS_Maneuver.Construct(6000.0));

      return retval;
   end_script

   script WsfManeuver ThreeHundredSixtySeconds()
      WsfManeuverSequence retval = WsfManeuverSequence.Construct();
      retval.SetEntryConstraint(WsfManeuverConstraint.AT_TIME(360.0));

      retval.Append(WsfRollDeltaManeuver.Construct(0.0));
      retval.Append(WsfPitchGLoadManeuver.Construct(8.0));
      retval.Append(WsfSpeedKCAS_Maneuver.Construct(6000.0));

      return retval;
   end_script

   script WsfManeuver FourHundredSixtySeconds()
      WsfManeuverSequence retval = WsfManeuverSequence.Construct();
      retval.SetEntryConstraint(WsfManeuverConstraint.AT_TIME(460.0));

      retval.Append(WsfRollAngleManeuver.Construct(0.0));
      retval.Append(WsfFlightPathAngleManeuver.Construct(0.0));
      retval.Append(WsfSpeedKCAS_Maneuver.Construct(450.0));

      return retval;
   end_script

   # This script will piece together the entire sequence of maneuvers
   # that the red aircraft is executing. Many of the returned values
   # from the methods above are sequences, showing that sequences of
   # sequences are supported.
   script WsfManeuver CreateManeuverSequence()
      WsfManeuverSequence retval = WsfManeuverSequence.Construct();

      retval.Append(FiveSeconds());
      retval.Append(TwentySeconds());
      retval.Append(ThirtySeconds());
      retval.Append(FortySeconds());
      retval.Append(SeventySeconds());
      retval.Append(EightyFiveSeconds());
      retval.Append(NinetySeconds());
      retval.Append(OneHundredTenSeconds());
      retval.Append(OneHundredTwentySeconds());
      retval.Append(OneHundredFiftySeconds());
      retval.Append(TwoHundredFortyFiveSeconds());
      retval.Append(ThreeHundredSeconds());
      retval.Append(ThreeHundredThirtySeconds());
      retval.Append(ThreeHundredFiftyFiveSeconds());
      retval.Append(ThreeHundredSixtySeconds());
      retval.Append(FourHundredSixtySeconds());

      return retval;
   end_script

   execute at_time 5.0 sec absolute
      WsfP6DOF_Mover mov = (WsfP6DOF_Mover)PLATFORM.Mover();

      SetInitialRanges(mov);
      WsfManeuver mvr = CreateManeuverSequence();
      mov.ExecuteManeuver(mvr);
   end_execute

   execute at_time 30.0 sec absolute
      WsfP6DOF_Mover mov = (WsfP6DOF_Mover)PLATFORM.Mover();
      mov.SetRollRateMax(30.0);
   end_execute

   execute at_time 40.0 sec absolute
      WsfP6DOF_Mover mov = (WsfP6DOF_Mover)PLATFORM.Mover();
      mov.SetRollRateMax(180.0);
   end_execute

end_platform
```

- **演示要点**：演示 platform 的参数：route, follow_vertical_track, script, execute

### platform（ttr_test）｜平台实例

- **关键词**：platform, side, commander, position, 平台实例
- **出处**：`iads/ttr_test.txt:53-57`　（同签名共 623 处，另见 `iads/ttr_test.txt:103`、`iads/scenarios/iads_laydown_cali.txt:14`、`iads/scenarios/iads_laydown_cali.txt:20`）
- **片段**：

```text
platform 1510_ew_radar EW_RADAR
   side red
   commander 1500_radar_company
   position 40:00n 89:30:00w altitude 0.0 m agl
end_platform
```

- **演示要点**：演示 platform 的参数：side, commander, position

### platform（ground_station）｜平台实例

- **关键词**：platform, position, altitude, heading, 平台实例
- **出处**：`coverage_demos/scenarios/ground_station.txt:11-15`　（同签名共 6 处，另见 `sensor_demos/spin_scheduler.txt:20`、`sensor_demos/spin_scheduler.txt:26`、`sensor_demos/spin_scheduler.txt:68`）
- **片段**：

```text
platform ground_station GROUND_STATION
   position 40n 97w
   altitude 50 m
   heading 180 deg
end_platform
```

- **演示要点**：演示 platform 的参数：position, altitude, heading

### platform（duck_hunt）｜平台实例

- **关键词**：platform, commander, position, heading, 平台实例
- **出处**：`cyber/scenarios/duck_hunt.txt:93-97`　（同签名共 4 处，另见 `cyber/scenarios/duck_hunt.txt:105`、`cyber/scenarios/duck_hunt.txt:117`、`cyber/scenarios/red_laydown.txt:21`）
- **片段**：

```text
platform ground_radar_1 GROUND_RADAR
   commander cyber_post_1
   position 39:48:41.354n 89:11:49.315w
   heading 270 degrees
end_platform
```

- **演示要点**：演示 platform 的参数：commander, position, heading

### platform（mitm_red_laydown）｜平台实例

- **关键词**：platform, position, icon, commander, 平台实例
- **出处**：`cyber/scenarios/mitm_red_laydown.txt:17-21`　（同签名共 2 处，另见 `cyber/scenarios/red_laydown.txt:15`）
- **片段**：

```text
platform cyber_command_post_1 CYBER_COMMAND_POST
   position 38:48:46.960n 90:17:43.609w
   icon c4i
   commander SELF
end_platform
```

- **演示要点**：演示 platform 的参数：position, icon, commander

### platform（output_file_demo）｜平台实例

- **关键词**：platform, side, icon, position, 平台实例
- **出处**：`example_scripts/output_file_demo.txt:151-155`　（同签名共 6 处，另见 `hel/ground_hel_vs_hypersonic.txt:176`、`space_operations/scenarios/telemetry_intercept.txt:46`、`sensor_demos/bistatic_demo.txt:105`）
- **片段**：

```text
platform f4_phantom F4_PHANTOM
   side blue
   icon f-4
   position 30:00:00.00n 60:00:00.00w altitude 20000.00 ft
end_platform
```

- **演示要点**：演示 platform 的参数：side, icon, position

### platform（radar_signature_demo）｜平台实例

- **关键词**：platform, side, position, heading, 平台实例
- **出处**：`multiresolution_demos/radar_signature_demo.txt:50-54`　（同签名共 12 处，另见 `multiresolution_demos/platforms/sensor_laydown_fighter.txt:17`、`signature_demos/scenarios/sensor_laydown_fighter.txt:17`、`suppressor/bomb_demo_laydown.txt:21`）
- **片段**：

```text
platform ground_radar_2 GENERIC_RADAR_SITE
   side blue
   position 41n 90w
   heading 180 deg
end_platform
```

- **演示要点**：演示 platform 的参数：side, position, heading

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, side, icon, position, 平台实例
- **出处**：`outer_air_battle/scenarios/cvbg.txt:72-76`　（同签名共 7 处，另见 `outer_air_battle/scenarios/cvbg.txt:78`、`outer_air_battle/scenarios/cvbg_mrc_lrc.txt:272`、`outer_air_battle/scenarios/cvbg_mrc_lrc.txt:278`）
- **片段**：

```text
platform tanker1 WSF_PLATFORM
   side blue
   icon kc-135
   position 00:37:55.53n 27:48:46.39w altitude 30000 ft
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：side, icon, position

### platform（6th_Hohmann_leo_orbit_transfer_demo）｜平台实例

- **关键词**：platform, icon, semi_major_axis, argument_of_periapsis, 平台实例
- **出处**：`satellite_demos/6th_Hohmann_leo_orbit_transfer_demo.txt:39-43`
- **片段**：

```text
platform target satellite
  icon satellite
  semi_major_axis 6998 km //200 km above the rendezvous satellite
  argument_of_periapsis 40 degrees
end_platform
```

- **演示要点**：演示 platform 的参数：icon, semi_major_axis, argument_of_periapsis

### platform（comm_satellite）｜平台实例

- **关键词**：platform, category, commander, position, 平台实例
- **出处**：`satellite_demos/scenarios/comm_satellite.txt:55-59`　（同签名共 2 处，另见 `satellite_demos/scenarios/comm_satellite.txt:61`）
- **片段**：

```text
platform SAT_GS-STL SAT_GS
   category ground_station
   commander COMMANDER-1
   position 38:44:51.600N 090:21:36.000W altitude 2 m agl
end_platform
```

- **演示要点**：演示 platform 的参数：category, commander, position

### platform（midwest_airports）｜平台实例

- **关键词**：platform, side, route, position, 平台实例
- **出处**：`traffic_demos/scenarios/midwest_airports.txt:9-14`　（同签名共 15 处，另见 `traffic_demos/scenarios/midwest_airports.txt:16`、`traffic_demos/scenarios/midwest_airports.txt:23`、`traffic_demos/scenarios/midwest_airports.txt:30`）
- **片段**：

```text
platform ORD-Chicago AIRPORT
  side red
  route
    position 41:58:45.993n 87:54:15.991w heading 90 deg
  end_route
end_platform
```

- **演示要点**：演示 platform 的参数：side, route, position

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, add, position, heading, 平台实例
- **出处**：`sensor_plot/radar/hm-mtd_radar.txt:24-29`　（同签名共 5 处，另见 `sensor_plot/radar/hm-mti_radar.txt:24`、`sensor_plot/radar/hm-pd_radar.txt:24`、`sensor_plot/radar/hm-jammer-detect.txt:62`）
- **片段**：

```text
platform sensor WSF_PLATFORM
   add sensor sensor MTD_RADAR
   end_sensor
   position 00:00:00n  00:00:00w  altitude 0.0 m agl
   heading 90 deg
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：add, position, heading

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, position, add, on, 平台实例
- **出处**：`sensor_plot/radar/hm-ucav-soj2.txt:33-38`
- **片段**：

```text
platform sensor-1 WSF_PLATFORM
   position 0n 0e heading 90 deg
   add sensor radar ACQ_RADAR
   on
   end_sensor
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：position, add, on

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, icon, position, add, 平台实例
- **出处**：`space_operations/attitude_control.txt:154-159`
- **片段**：

```text
platform ground_station WSF_PLATFORM
   icon tower
   position 33:29:27.352n 66:39:49.016e
   add comm comm COMM
   end_comm
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, position, add

### platform（bearing_sensors_net）｜平台实例

- **关键词**：platform, position, commander, sensor, 平台实例
- **出处**：`bearing_only/scenarios/bearing_sensors_net.txt:29-35`　（同签名共 2 处，另见 `bearing_only/scenarios/bearing_sensors_net.txt:37`）
- **片段**：

```text
platform bearing_sensor_01 GEOMETRIC_BEARING_ONLY_SENSOR_PLATFORM
   position 48:10:00.00n 128:00:00.00w altitude 3.28 ft agl
   commander fuser_platform_01
   sensor geometric_bearing_only_sensor
       azimuth_field_of_view 0 deg 90 deg
   end_sensor
end_platform
```

- **演示要点**：演示 platform 的参数：position, commander, sensor

### platform（brawler_demo_combined_agent_BVR_8v16）｜平台实例

- **关键词**：platform, side, position, edit, 平台实例
- **出处**：`brawler/brawler_demo_combined_agent_BVR_8v16.txt:330-336`　（同签名共 5 处，另见 `brawler/brawler_demo_combined_agent_BVR_8v16_close.txt:165`、`brawler/brawler_demo_combined_agent_BVR_8v16_no_gci.txt:283`、`brawler/brawler_demo_combined_agent_BVR_8v16_close.txt:67`）
- **片段**：

```text
platform red_cmdr FLIGHT_LEAD
   side red
   position 00:30:00.00n  00:00:00.00e
   edit processor task_mgr
      update_interval 2.0 sec
   end_processor
end_platform
```

- **演示要点**：演示 platform 的参数：side, position, edit

### platform（space_mover_demo）｜平台实例

- **关键词**：platform, icon, side, multiresolution_mover, 平台实例
- **出处**：`multiresolution_demos/space_mover_demo.txt:45-51`
- **片段**：

```text
platform test_sat MR_TEST_SAT
   icon satellite
   side blue
   multiresolution_mover
      fidelity 1
   end_multiresolution_mover
end_platform
```

- **演示要点**：演示 platform 的参数：icon, side, multiresolution_mover

### platform（composite_demo）｜平台实例

- **关键词**：platform, icon, side, route, 平台实例
- **出处**：`sensor_demos/composite_demo.txt:108-114`　（同签名共 9 处，另见 `p6dof/missile_comparison.txt:230`、`script_demos/script_demo_4.txt:99`、`shooter/scenarios/two_more_air_targets.txt:10`）
- **片段**：

```text
platform target TARGET
   icon F-18E
   side blue
   route
      position 39n 89.80w altitude 1000 ft heading 270 deg speed 450 kts
   end_route
end_platform
```

- **演示要点**：演示 platform 的参数：icon, side, route

### platform（glonass）｜平台实例

- **关键词**：platform, designator, raan, anomaly, 平台实例
- **出处**：`satellite_demos/satellites/orbit_nominal/glonass.txt:20-26`　（同签名共 24 处，另见 `satellite_demos/satellites/orbit_nominal/glonass.txt:28`、`satellite_demos/satellites/orbit_nominal/glonass.txt:36`、`satellite_demos/satellites/orbit_nominal/glonass.txt:44`）
- **片段**：

```text
platform P11 GLONASS
edit mover
   designator P11
   raan 120 deg
   anomaly 45 deg
end_mover
end_platform
```

- **演示要点**：演示 platform 的参数：designator, raan, anomaly

### platform（simple_fighter_route）｜平台实例

- **关键词**：platform, side, optical_signature, route, 平台实例
- **出处**：`signature_demos/scenarios/simple_fighter_route.txt:12-18`　（同签名共 3 处，另见 `signature_demos/scenarios/simple_fighter_route.txt:20`、`signature_demos/scenarios/simple_fighter_route.txt:28`）
- **片段**：

```text
platform fighter_box SIMPLE_FIGHTER
   side red
   optical_signature FIGHTER_BOX_OPTICAL_SIG
   route
      position 40.2n 89.5w altitude 20000 ft heading 255 deg speed 500 kts
   end_route
end_platform
```

- **演示要点**：演示 platform 的参数：side, optical_signature, route

### platform（four_ucavs）｜平台实例

- **关键词**：platform, side, commander, route, 平台实例
- **出处**：`iads_c2_demos/scenarios/four_ucavs.txt:14-21`　（同签名共 9 处，另见 `iads_c2_demos/scenarios/four_ucavs.txt:23`、`iads_c2_demos/scenarios/four_ucavs.txt:32`、`iads_c2_demos/scenarios/four_ucavs.txt:41`）
- **片段**：

```text
platform 100_ucav UCAV
   side blue
   commander SELF
   route
      position 38:14:46.0n 114:01:56.0w altitude 35000 ft msl speed 460 kts
      position 38:14:46.0n 118:44:19.0w altitude 35000 ft msl speed 400 kts
   end_route
end_platform
```

- **演示要点**：演示 platform 的参数：side, commander, route

### platform（script_demo_2）｜平台实例

- **关键词**：platform, side, position, sensor, 平台实例
- **出处**：`script_demos/script_demo_2.txt:503-510`　（同签名共 2 处，另见 `satellite_demos/scenarios/gps_denied.txt:537`）
- **片段**：

```text
platform threat-ew-1 EW_RADAR_SITE
   side red
   position 39:31:42.42n 91:38:35.111w

   sensor ew-radar-1
      on
   end_sensor
end_platform
```

- **演示要点**：演示 platform 的参数：side, position, sensor

### platform（full_laydown）｜平台实例

- **关键词**：platform, commander, route, heading, 平台实例
- **出处**：`timeline_lead/scenarios/full_laydown.txt:61-68`　（同签名共 12 处，另见 `timeline_lead/scenarios/full_laydown.txt:81`、`timeline_lead/scenarios/full_laydown.txt:231`、`timeline_lead/scenarios/full_laydown.txt:240`）
- **片段**：

```text
platform blue_1 BLUE_STRIKER
  commander blue_flight_lead
  route
     position 38:50:26.64n 93:07:42.94w altitude 35000.00 ft msl speed 500 kts
     position 38:43:07.17n 89:41:47.90w altitude 35000.00 ft msl speed 500 kts
  end_route
  heading 92 deg
end_platform
```

- **演示要点**：演示 platform 的参数：commander, route, heading

### platform（target_list）｜平台实例

- **关键词**：platform, side, icon, alternate_locations, 平台实例
- **出处**：`alternate_locations/scenarios/target_list.txt:10-18`　（同签名共 4 处，另见 `alternate_locations/scenarios/target_list.txt:20`、`alternate_locations/scenarios/target_list.txt:30`、`alternate_locations/scenarios/target_list.txt:40`）
- **片段**：

```text
platform target_1 TARGET
  side blue
  icon Bullseye_team
  #position 30:30:00.00n 81:41:00.00w
  
  alternate_locations reference sam-1
     offset_ara 0 deg 11 nm altitude 0 m
  end_alternate_locations
end_platform
```

- **演示要点**：演示 platform 的参数：side, icon, alternate_locations

### platform（xio_setup）｜平台实例

- **关键词**：platform, route, edit, commander, 平台实例
- **出处**：`distributed_operations/xio_setup.txt:67-75`
- **片段**：

```text
platform air-3 my_type
   route
      position 0.001s 0.0e altitude 20000 ft heading 90 deg extrapolate
   end_route
   edit sensor sensor-1
      on
   end_sensor
   commander air-2
end_platform
```

- **演示要点**：演示 platform 的参数：route, edit, commander

### platform（hm-ucav-soj2）｜平台实例

- **关键词**：platform, position, heading, execute, 平台实例
- **出处**：`sensor_plot/radar/hm-ucav-soj2.txt:40-48`　（同签名共 2 处，另见 `sensor_plot/radar/vm-ucav-soj2.txt:36`）
- **片段**：

```text
platform jammer-1 SOJ
   position 0.0n 0.5e altitude 30000 ft
   heading 270 deg
   execute at_time 0.001 minutes absolute
      WsfWeapon jammer = PLATFORM.Weapon("fwd_sband_jammer");
      // Any of the jamming routines can be used at this point
      jammer.StartJamming(3000000000., 20000000.);
   end_execute
end_platform
```

- **演示要点**：演示 platform 的参数：position, heading, execute

### platform（fpa-route）｜平台实例

- **关键词**：platform, add, start_time, route, 平台实例
- **出处**：`sensor_plot/radar/fpa-route.txt:18-27`
- **片段**：

```text
platform TARGET TARGET_TYPE
   add mover WSF_AIR_MOVER
   end_mover

   start_time 1 sec
   route
      position 1.0n 0e altitude 30000 ft speed 500 kts
      position 1.0s 0e
   end_route
end_platform
```

- **演示要点**：演示 platform 的参数：add, start_time, route

### platform（proximity_operations）｜平台实例

- **关键词**：platform, side, icon, edit, 平台实例
- **出处**：`space_operations/proximity_operations.txt:28-37`　（同签名共 2 处，另见 `space_operations/proximity_operations.txt:39`）
- **片段**：

```text
platform target SATELLITE
   side red
   icon space_shuttle_atlantis
   edit mover
      semi_major_axis 7000 km
      eccentricity 0.0
      inclination 0 deg
      mean_anomaly 10 deg
   end_mover
end_platform
```

- **演示要点**：演示 platform 的参数：side, icon, edit

### platform（naval_asm_test）｜平台实例

- **关键词**：platform, side, sensor, route, 平台实例
- **出处**：`ship_ad/scenarios/naval_asm_test.txt:33-43`　（同签名共 42 处，另见 `sosm/test_mission/a2a/test_a2a.txt:60`、`electronic_warfare/agile_auto-repeater_jamming.txt:315`、`electronic_warfare/agile_jamming.txt:377`）
- **片段**：

```text
platform 1000_target_ship RED_MISSILE_FRIGATE
   side red
   sensor top_plate
      off
   end_sensor
   route
      position 30:00:00n  77:30:00w altitude 0 m agl
         speed 10 kts
      position 30:30:00n  77:30:00w altitude 0 m agl
   end_route
end_platform
```

- **演示要点**：演示 platform 的参数：side, sensor, route

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, icon, add, route, 平台实例
- **出处**：`multiresolution_demos/air_mover_demo.txt:55-65`
- **片段**：

```text
platform test2 WSF_PLATFORM
   icon F-18  
   add mover WSF_AIR_MOVER
      update_interval 30 sec
   end_mover
   route
      position 0n 0e altitude 20000 ft heading 0 deg speed 450 kts
      position 0.1n 0e altitude 20000 ft speed 450 kts
      position 0.1n 0.1e altitude 25000 ft speed 450 kts
   end_route
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, add, route

### platform（target）｜平台实例

- **关键词**：platform, side, heading, route, 平台实例
- **出处**：`orwaca_iads/scenarios/target.txt:43-53`　（同签名共 11 处，另见 `wargame/scenario/laydowns/blue.txt:22`、`wargame/scenario/laydowns/blue.txt:38`、`wargame/scenario/laydowns/red.txt:39`）
- **片段**：

```text
platform target2 AIR_TARGET
   side blue
   heading 147 deg
  
   route
      position 47:43:35.51n 128:05:32.77w altitude 20000.00 ft speed 400 kts
      position 40:41:38.86n 122:11:49.52w
      position 32:28:58.20n 115:31:32.19w
   end_route
   
end_platform
```

- **演示要点**：演示 platform 的参数：side, heading, route

### platform（naval_sam_test）｜平台实例

- **关键词**：platform, side, route, processor, 平台实例
- **出处**：`ship_ad/scenarios/naval_sam_test.txt:24-35`
- **片段**：

```text
platform target RED_ASM_MSL
   side red
   route
      position 30:00:00n  77:30:00w altitude 20 m agl
         speed 573 kts
      position 30:00:00n  78:00:00w altitude 20 m agl
         speed 573 kts
   end_route
   processor fuse
      off
   end_processor
end_platform
```

- **演示要点**：演示 platform 的参数：side, route, processor

### platform（group_comm_example）｜平台实例

- **关键词**：platform, side, edit, route, 平台实例
- **出处**：`comm/group_comm_example.txt:139-151`　（同签名共 3 处，另见 `comm/group_comm_example.txt:98`、`comm/group_comm_example.txt:117`）
- **片段**：

```text
platform p3 BASIC_FIGHTER
   side blue
   #commander cmdr
   #group_join FIGHTER_GROUP_2

   edit comm datalink
      group_join FIGHTER_GROUP_2
   end_comm

   route
      position 0n 01e altitude 10 kft heading 0 deg speed 700 kts
   end_route
end_platform
```

- **演示要点**：演示 platform 的参数：side, edit, route

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, icon, side, add, 平台实例
- **出处**：`space_operations/satellite_breakup.txt:19-31`　（同签名共 6 处，另见 `space_operations/satellite_breakup.txt:34`、`cyber/avengers_detonate_effect.txt:26`、`visual_part/red_satellite.txt:46`）
- **片段**：

```text
platform comm_sat WSF_PLATFORM
   icon satellite
   side blue
   
   add mover WSF_SPACE_MOVER
      inclination 86.4 deg
      revs_per_day 14.3
      raan 120 deg
      true_anomaly 50 deg
      
      oblate_earth enable
   end_mover
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, add

### platform（agile_jamming）｜平台实例

- **关键词**：platform, side, route, weapon, 平台实例
- **出处**：`electronic_warfare/agile_jamming.txt:363-375`　（同签名共 26 处，另见 `electronic_warfare/esm_detect_jammer.txt:206`、`electronic_warfare/jam_strobe_tracking.txt:263`、`electronic_warfare/pol_mod_jamming.txt:206`）
- **片段**：

```text
platform jammer JAMMER_PLATFORM
   side blue

   route
      position 37:00:00n 114:30:00w
      altitude 35000 ft
      speed      450 kts
      heading    270 deg
   end_route

   weapon jammer
   end_weapon
end_platform
```

- **演示要点**：演示 platform 的参数：side, route, weapon

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, side, position, add, 平台实例
- **出处**：`sensor_demos/passive_detector_df_demo.txt:298-310`　（同签名共 11 处，另见 `sensor_demos/passive_detector_df_demo.txt:319`、`sensor_demos/passive_detector_df_demo.txt:339`、`sensor_demos/passive_detector_df_demo.txt:358`）
- **片段**：

```text
platform 88p1 WSF_PLATFORM
   side red

   position 38:25:01n 90:25:59w altitude 164 m agl
   add sensor 88p1_xmtr BISTATIC_SENSOR_XMTR
      on
      transmitter
         power     42000 w  // ERP
         #frequency  88.1 mhz
         bandwidth 200 khz
      end_transmitter
   end_sensor
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：side, position, add

### platform（optical_signature_demo）｜平台实例

- **关键词**：platform, side, add, route, 平台实例
- **出处**：`multiresolution_demos/optical_signature_demo.txt:38-50`　（同签名共 3 处，另见 `multiresolution_demos/radar_signature_demo.txt:56`、`sensor_demos/esm_tdoa_demo.txt:189`）
- **片段**：

```text
platform fighter_multi SIMPLE_FIGHTER
   side red
   add multiresolution_optical_signature FIGHTER_MULTIRESOLUTION_OPTICAL_SIGNATURE
      fidelity 0.9
   end_multiresolution_optical_signature
   route
      position 40.2n 89.5w altitude 20000 ft heading 270 deg speed 500 kts
      position 40.1n 90.0w altitude 20000 ft heading 270 deg speed 500 kts
      position 40.2n 90.0w altitude 20000 ft heading 270 deg speed 500 kts
      position 40.1n 90.1w altitude 20000 ft heading 270 deg speed 500 kts
      position 40.2n 89.5w altitude 20000 ft heading 270 deg speed 500 kts
   end_route
end_platform
```

- **演示要点**：演示 platform 的参数：side, add, route

### platform（launchers）｜平台实例

- **关键词**：platform, position, processor, track, 平台实例
- **出处**：`ballistic/scenarios/launchers.txt:35-48`　（同签名共 5 处，另见 `ballistic/scenarios/launchers.txt:50`、`ballistic/scenarios/launchers.txt:65`、`ballistic/scenarios/launchers.txt:80`）
- **片段**：

```text
platform red_mrbm_2_launcher RED_MRBM_2_LAUNCHER
   position 31n 56e
   processor launch_weapon_processor
     script_variables
       TIME_TO_LAUNCH = 180 ; # sim time in seconds
       #LAUNCH_RANDOM = 1; # uncomment this if you want to randomize the launch time
       #MIN_TIME      = 10; # minimum random launch time for this weapon
       #MAX_TIME      = 500; # maximum random launch time for this weapon
     end_script_variables
   end_processor
   track
     platform target01
   end_track
end_platform
```

- **演示要点**：演示 platform 的参数：position, processor, track

### platform（nav_demo）｜平台实例

- **关键词**：platform, side, route, zone_set, 平台实例
- **出处**：`sensor_demos/nav_demo.txt:130-143`
- **片段**：

```text
platform uav UAV
   side blue
   route
      position 34:30:12n 117:44:00w altitude 40000 ft msl
        speed 200 kts
      position 36:36:36n 117:37:48w altitude 40000 ft msl
        speed 200 kts
   end_route

   # Reference the zone_set that declares where where GPS is unavailable.
   zone_set no_gps
      use_zone BLUE_NO_GPS
   end_zone_set
end_platform
```

- **演示要点**：演示 platform 的参数：side, route, zone_set

### platform（refueling_trucks）｜平台实例

- **关键词**：platform, position, edit, on_initialize, 平台实例
- **出处**：`logistics/scenarios/refueling_trucks.txt:9-23`　（同签名共 10 处，另见 `logistics/scenarios/refueling_trucks.txt:25`、`logistics/scenarios/ocean_tankers.txt:11`、`logistics/scenarios/strike_bombers.txt:31`）
- **片段**：

```text
platform FuelTruck_1 FUELING_TRUCK

   position 24.5515n 81.7596w # Slightly south of Key West Intl Airport

   edit processor exchanger
      edit container fuel_container
         initial_mass_quantity 200 kg
      end_container
   end_processor

   on_initialize
      #runSilent = true;
   end_on_initialize

end_platform
```

- **演示要点**：演示 platform 的参数：position, edit, on_initialize

### platform（alternate_tactical_maneuvers）｜平台实例

- **关键词**：platform, route, follow_vertical_track, execute, 平台实例
- **出处**：`p6dof/alternate_tactical_maneuvers.txt:144-158`　（同签名共 8 处，另见 `six_dof/comparison_alternate_tactical_maneuvers.txt:150`、`six_dof/comparison_alternate_tactical_maneuvers.txt:166`、`six_dof/pm6_alternate_tactical_maneuvers.txt:144`）
- **片段**：

```text
platform PursuitFighter BlueFighter
   route
      position   21.180n  158.55w  altitude 14000.0 ft  speed 500.0 kts
      position   21.480n  157.95w  altitude 14000.0 ft  speed 500.0 kts
      position   21.520n  157.95w  altitude 14000.0 ft  speed 500.0 kts
   end_route
   follow_vertical_track

   execute at_time 0.1 sec absolute
      WsfManeuver mvr = WsfScriptedManeuver.Construct("ExecuteBluePursuit");
      WsfP6DOF_Mover mov = (WsfP6DOF_Mover)PLATFORM.Mover();
      mov.ExecuteManeuver(mvr);
   end_execute

end_platform
```

- **演示要点**：演示 platform 的参数：route, follow_vertical_track, execute

### platform（waypoint_test）｜平台实例

- **关键词**：platform, update_interval, side, route, 平台实例
- **出处**：`p6dof/waypoint_test.txt:44-60`　（同签名共 5 处，另见 `p6dof/waypoint_test.txt:100`、`six_dof/six_dof_waypoint.txt:44`、`six_dof/six_dof_waypoint.txt:100`）
- **片段**：

```text
platform air_mover AIRMOVER_PLATFORM
   update_interval 0.01 sec
   side green
   route
      position   21.320n  158.50w  altitude 6000.0 ft  speed 500.0 kts
      position   21.320n  157.90w  altitude 10000.0 ft speed 500.0 kts
      position   21.520n  157.90w  altitude 8000.0 ft  speed 500.0 kts
      position   21.520n  157.60w  altitude 6000.0 ft  speed 500.0 kts
      position   21.320n  157.60w  altitude 7000.0 ft  speed 500.0 kts
      position   22.120n  158.20w  altitude 8000.0 ft  speed 500.0 kts
      position   22.120n  157.30w  altitude 6000.0 ft  speed 500.0 kts
      position   21.720n  157.90w  altitude 7000.0 ft  speed 500.0 kts
      position   21.920n  158.20w  altitude 8000.0 ft  speed 500.0 kts
      position   21.320n  158.20w  altitude 6000.0 ft  speed 500.0 kts
      position   21.320n  158.50w  altitude 8000.0 ft  speed 500.0 kts
   end_route
end_platform
```

- **演示要点**：演示 platform 的参数：update_interval, side, route

### platform（blue_sams）｜平台实例

- **关键词**：platform, heading, side, alternate_locations, 平台实例
- **出处**：`alternate_locations/scenarios/blue_sams.txt:10-28`
- **片段**：

```text
platform sam-1 SINGLE_LARGE_SAM
   #position 30:20n 81:40w
   heading 90 deg
   #position 20:20n 70:40w
   side blue
   
   # sam-1 has 4 possible starting locations.
   # Index 1 has 40% chance (2-in-5 probability) of selection.
   # Indices 2-4 have 20% chance (1-in-5) of selection.
   #
   # All the targets refer to sam-1 for their positions.
   
   alternate_locations 
      location 30:20n 81:40w weight 20 altitude 0 m agl   # [1] coast - the training-class position
      location 31:20n 81:40w weight 10 altitude 0 m agl   # [2] north
      location 29:20n 81:40w weight 10 altitude 0 m agl   # [3] south
      location 30:20n 82:40w weight 10 altitude 0 m agl   # [4] west
   end_alternate_locations
end_platform
```

- **演示要点**：演示 platform 的参数：heading, side, alternate_locations

### platform（sat_sensor_constellation）｜平台实例

- **关键词**：platform, commander, edit, add, 平台实例
- **出处**：`space_operations/scenarios/sat_sensor_constellation.txt:48-66`　（同签名共 24 处，另见 `space_operations/scenarios/sat_sensor_constellation.txt:68`、`space_operations/scenarios/sat_sensor_constellation.txt:88`、`space_operations/scenarios/sat_sensor_constellation.txt:108`）
- **片段**：

```text
platform sat_sensor_2 SAT_SENSOR
   commander commander
   edit mover
      raan 0 deg
      anomaly 90 deg
   end_mover

   add sensor sat_sensor SAT_SENSOR
      internal_link report
   end_sensor

   add comm sat_sensor_2 WSF_COMM_TRANSCEIVER
      network_name sat_sensor_2
   end_comm

   add processor report REPORT
      report_to commander via sat_sensor_2 to commander
   end_processor
end_platform
```

- **演示要点**：演示 platform 的参数：commander, edit, add

### platform（eoir_demo）｜平台实例

- **关键词**：platform, side, route, execute, 平台实例
- **出处**：`sensor_demos/scenarios/eoir_demo.txt:9-29`　（同签名共 2 处，另见 `sensor_demos/scenarios/strip_sar_demo.txt:9`）
- **片段**：

```text
platform uav UAV
   side blue

   route
      position 34:30:00n 116:00w altitude 60000 ft speed 350 kts heading 0 deg
   end_route

   execute at_time 1 min relative
       BeginImaging("eoir", "", -90, 68000);
   end_execute
   execute at_time 4 min relative
       EndImaging();
   end_execute

   execute at_time 7 min relative
      BeginImaging("eoir", "", -90, 150000);
   end_execute
   execute at_time 10 min relative
      EndImaging();
   end_execute
end_platform
```

- **演示要点**：演示 platform 的参数：side, route, execute

### platform（proc_mover_demo）｜平台实例

- **关键词**：platform, commander, route, position, 平台实例
- **出处**：`example_scripts/proc_mover_demo.txt:79-101`
- **片段**：

```text
platform cap_west_1 MY_STRIKER
  commander SELF
  ## NOTE: please do NOT use any speeds on the platform route
  ##       let the processor handle it
  ## up & down zig zaggy route
  route
    position 15:31:04.25s 49:02:50.44e altitude 35000.00 ft msl
    position 15:18:12.10s 49:03:57.67e altitude 15000.00 ft msl
    position 15:14:25.02s 48:52:27.80e altitude 30000.00 ft msl
    position 15:27:46.88s 48:40:41.80e altitude 10000.00 ft msl
    position 15:07:40.48s 48:34:25.45e altitude 25000.00 ft msl
    position 15:28:08.23s 48:57:14.80e altitude  5000.00 ft msl
    position 15:41:45.27s 48:28:58.68e altitude 45000.00 ft msl
    position 14:49:20.14s 48:56:36.25e altitude 25000.00 ft msl
  end_route
   ## stair step route
#  route
#    position 15:31:04.25s 49:02:50.44e altitude 5000.00 ft msl
#    position 15:31:46.39s 48:27:01.50e altitude 5000.00 ft msl
#    position 15:04:21.42s 48:27:16.30e altitude 5000.00 ft msl
#    position 15:04:18.24s 47:44:00.40e altitude 5000.00 ft msl
#  end_route
end_platform
```

- **演示要点**：演示 platform 的参数：commander, route, position

### platform（mitm_blue_laydown）｜平台实例

- **关键词**：platform, track, mover, on_update, 平台实例
- **出处**：`cyber/scenarios/mitm_blue_laydown.txt:14-37`
- **片段**：

```text
platform uav_1 UAV

   track platform target_1 end_track
   
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
   
   on_update 
      WsfPlatform spotter = WsfSimulation.FindPlatform("spotter_1");
      if ((PLATFORM.GroundRangeTo(spotter) < 15*MATH.M_PER_MI()) && PLATFORM.CyberAttackStatus(spotter,"DELAY_COMMS") <= 0)
      {
         PLATFORM.CyberAttack(spotter,"DELAY_COMMS");
      }
   end_on_update
   
end_platform
```

- **演示要点**：演示 platform 的参数：track, mover, on_update

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, position, altitude, add, 平台实例
- **出处**：`sensor_demos/spin_scheduler.txt:86-112`
- **片段**：

```text
platform plat WSF_PLATFORM
   position 46:18:44.71n 02:28:16.71e
   altitude 1 km
   add sensor sens WSF_RADAR_SENSOR
      on
      scheduler spin
         scan_period 30 sec
         starting_beam_azimuth 240 deg
         clockwise true
      end_scheduler
      maximum_range 54 km

      transmitter 
         power 10 gw
         frequency 10 ghz
         bandwidth 10 mhz
      end_transmitter
      receiver   
         frequency 10 ghz
         bandwidth 10 mhz
      end_receiver
      update_interval 1 sec
      frame_time 20 sec
      reports_location
      reports_velocity
   end_sensor
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：position, altitude, add

### platform（starlink_autogen）｜平台实例

- **关键词**：platform, mover, aux_data, comm, 平台实例
- **出处**：`space_operations/scenarios/starlink_autogen.txt:13-45`　（同签名共 288 处，另见 `space_operations/scenarios/starlink_autogen.txt:47`、`space_operations/scenarios/starlink_autogen.txt:81`、`space_operations/scenarios/starlink_autogen.txt:115`）
- **片段**：

```text
platform starlink_0_0 STARLINK
   mover
      inclination 53 deg
      revs_per_day 13.3
      raan 0 deg
      true_anomaly 0 deg
   end_mover
   aux_data
      int plane = 0
   end_aux_data
   comm crosslink1
      network_name crosslink1_starlink_0_0
      link starlink_0_1 crosslink2
   end_comm

   comm crosslink2
      network_name crosslink2_starlink_0_0
      link starlink_0_17 crosslink1
   end_comm

   comm crosslink3
      network_name crosslink3_starlink_0_0
   end_comm

   comm crosslink4
      network_name crosslink4_starlink_0_0
   end_comm

   comm downlink
      network_name downlink_starlink_0_0
   end_comm

end_platform
```

- **演示要点**：演示 platform 的参数：mover, aux_data, comm

### platform（kinematic_mover_demo）｜平台实例

- **关键词**：platform, position, mover, route, 平台实例
- **出处**：`kinematic_mover/kinematic_mover_demo.txt:73-107`
- **片段**：

```text
platform flyer1 FLYER
    position 33:54:44.51n 83:20:16.78w altitude 32808.40 ft

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

    route
        label begin
        position 33:54:44.51n 83:20:16.78w altitude 32808.40 ft speed 200 kts
        position 33:54:20.38n 83:20:36.86w altitude 29527.56 ft speed 210 kts
        position 33:54:47.86n 83:21:11.54w altitude 25965.88 ft  speed 180 kts
        position 33:56:39.14n 83:21:36.47w altitude 25685.04 ft  speed 210 kts
        position 33:56:27.61n 83:22:50.54w altitude 23246.72 ft
        position 33:57:01.69n 83:21:55.05w altitude 24685.04 ft  speed 300 kts
        position 33:56:58.70n 83:21:10.76w altitude 26246.72 ft speed 200 kts
        position 33:55:00.49n 83:20:57.03w altitude 22685.04 ft speed 210 kts
        position 33:57:11.21n 83:20:31.00w altitude 29685.04 ft speed 200 kts
        go_to begin

     end_route

     add processor thingy VARY_DIR_ALT end_processor
     heading 215 deg
end_platform
```

- **演示要点**：演示 platform 的参数：position, mover, route

### platform（uav）｜平台实例

- **关键词**：platform, route, script, execute, 平台实例
- **出处**：`coverage_demos/scenarios/uav.txt:11-51`
- **片段**：

```text
platform uav UAV
  # Initial conditions of the UAV
   route
      position 38:45:00.000n 106:35:00.000w altitude 45931.76 ft msl
      speed 120 nm/h
      radial_acceleration 0.22 m/s2      
   end_route
   
  # Creating the orbit route
   script WsfRoute MakeOrbit(WsfPlatform plat, WsfGeoPoint center, double r)
      WsfRoute orbit = WsfRoute();
      WsfWaypoint startPoint;
      
      int points_in_orbit = 8;
      
      double bearing_to_start = center.TrueBearingTo(plat.Location()) + 90;
      
      for (int i = 0; i < points_in_orbit; i = i + 1)
      {         
         WsfGeoPoint offsetPos = WsfGeoPoint.Construct(center.Latitude(), center.Longitude(), plat.Altitude());
         offsetPos.Extrapolate(bearing_to_start + (i * (360 / points_in_orbit)), r);
         WsfWaypoint point = WsfWaypoint.Create(offsetPos, plat.Speed());
         orbit.Append(point);
         
         if (i == 0)
         {
            startPoint = point;
         }
      }
      orbit.Append(startPoint);    
      return orbit;
   end_script
   
  # Inserting orbit conditions
   execute at_time 1 s absolute 
      WsfGeoPoint centerpt = WsfGeoPoint.Construct(39.40, -106.50, 0);
      double radius = 5200;
      WsfRoute orbit = MakeOrbit(PLATFORM, centerpt, radius);
      PLATFORM.FollowRoute(orbit);
   end_execute
end_platform
```

- **演示要点**：演示 platform 的参数：route, script, execute

### platform（ldt_combined_test）｜平台实例

- **关键词**：platform, script_variables, update_interval, on_update, 平台实例
- **出处**：`hellfire/semiactive_laser_hellfire/ldt_combined_test.txt:35-76`
- **片段**：

```text
platform shooter LONGBOW

   script_variables
      bool sal_fired     = false;
      WsfSensor  tracker;
      //bool attemptedMissileFire = false; // inherited from parent object.
   end_script_variables

   update_interval 5 sec

   on_update

      if (attemptedMissileFire) return;

      Sensor("tracker").CueToTrack(WsfSimulation.FindPlatform("target").MakeTrack());

      if ((MasterTrackList().Count() > 0) && (MasterTrackList().Entry(0).TimeSinceStarted() > 15))
      {
         attemptedMissileFire = true;
         sal_fired = PLATFORM.Weapon("hellfire_launcher").Fire(MasterTrackList().Entry(0));
         if (sal_fired)
         {
            PLATFORM.Comment("Weapon fire successful.");
            writeln("Hellfire Missile Launched.");
         }
         else
         {
            PLATFORM.Comment("Launch attempt failed for unknown reason.");
            writeln("Hellfire Missile Launch Attempted, but Failed.");
         }

         WsfSensor tracker = PLATFORM.Sensor("tracker");
         if (tracker.IsValid())
         {
             writeln("Laser tracker turned off after missile fire attempt.");
             tracker.TurnOff();
         }
      }

   end_on_update

end_platform
```

- **演示要点**：演示 platform 的参数：script_variables, update_interval, on_update

### platform（pm6_brawler_maneuvers）｜平台实例

- **关键词**：platform, side, execute, script, 平台实例
- **出处**：`six_dof_with_brawler/pm6_brawler_maneuvers.txt:210-263`　（同签名共 2 处，另见 `six_dof_with_brawler/pm6_brawler_maneuvers.txt:55`）
- **片段**：

```text
platform CommandFighter Fighter   
   side dark_blue
   # This platform uses mover/platform commands, similar to those a BrawlerMover might use
   execute at_time 5.0 sec absolute
      writeln(PLATFORM.Name(), " straight and level at max speed.");
      StraightLevelMaxSpeed(PLATFORM);
   end_execute
   
   script void RepeatSlice(double aInterval, double aMaxTime, double aHeading, double aAltitude_m)
      if (TIME_NOW <= aMaxTime)
      {      
         WsfSixDOF_Mover mover = (WsfSixDOF_Mover)PLATFORM.Mover();
         mover.Slice(180, 2000);
      
         ExecuteAtTime(TIME_NOW + aInterval, "RepeatSlice", {aInterval, aMaxTime, aHeading, aAltitude_m});
      }
   end_script

   execute at_time 10.0 sec absolute
      writeln(PLATFORM.Name(), " slice.");
      RepeatSlice(1.0, 25.0, 180.0, 2000.0);
   end_execute
   
   execute at_time 30.0 sec absolute
      writeln(PLATFORM.Name(), " straight and level.");
      StraightLevel(PLATFORM);
   end_execute

   execute at_time 35.0 sec absolute
      writeln(PLATFORM.Name(), " pull up.");
      PullGMaxSust(PLATFORM);
   end_execute

   execute at_time 45.0 sec absolute
      writeln(PLATFORM.Name(), " straight and level.");
      StraightLevel(PLATFORM);
   end_execute

   execute at_time 80.0 sec absolute
      writeln(PLATFORM.Name(), " slow roll and pull.");
      SlowPullLeft(PLATFORM);
   end_execute

   execute at_time 90.0 sec absolute
      writeln(PLATFORM.Name(), " straight and level at max speed.");
      StraightLevelMaxSpeed(PLATFORM);
   end_execute

   execute at_time 140.0 sec absolute
      writeln(PLATFORM.Name(), " level turn to due south.");
      WsfSixDOF_Mover mover = (WsfSixDOF_Mover)PLATFORM.Mover();
      mover.Prlvl(180, 0.9);
   end_execute
end_platform
```

- **演示要点**：演示 platform 的参数：side, execute, script

### platform（six_dof_fuel_burn_envelope）｜平台实例

- **关键词**：platform, six_dof_position, six_dof_alt, execute, 平台实例
- **出处**：`six_dof/six_dof_fuel_burn_envelope.txt:93-163`
- **片段**：

```text
platform TEST_PLATFORM $<PLATFORM_TYPE:FA-LGT_RB6>$

   six_dof_position 0.0 0.0
   six_dof_alt 10000.0 feet   

   execute at_time 0.1 s absolute
      int iFuel = 0;   
      foreach (double fuelLoad in fuelPercentage)
      {
         WsfSixDOF_Mover mover = (WsfSixDOF_Mover) Mover();
         double minWeight = mover.GetEmptyWeight();
         double fuelWeight = mover.GetTotalFuelCapacity();

         double testingWeight_kg = minWeight + (fuelLoad / 100.0) * fuelWeight;

         int iAlt = 0;
         for(double alt = initialAltitude_ft; alt <= maximumAltitude_ft; alt = alt + altitudeStep_ft)
         {
            if (iFuel == 0) { mAltitudes.PushBack(alt); }               

            double altitude_m = alt * Math.M_PER_FT();

            int iVel = 0;
            for(double vel = initialVelocity; vel <= maximumVelocity; vel = vel + velocityStep)
            {
               if (iAlt == 0 && iFuel == 0) { mVelocities.PushBack(vel); }               

               double mach = 0.0;
               if (speedMode.Lower() == "mach")
               {
                  mach = vel;
               }
               if (speedMode.Lower() == "fps")
               {
                  mach = mover.CalcMachFromFps(altitude_m, vel);
               }
               else if (speedMode.Lower() == "ktas")
               {
                  mach = mover.CalcMachFromKtas(altitude_m, vel);
               }
               else if (speedMode.Lower() == "kcas")
               {
                  mach = mover.CalcMachFromKcas(altitude_m, vel);
               }

               double fuelFlow_kgps = mover.__getTestObject().GetLevelFlightFuelBurnRate(altitude_m,
                                                                                         mach,
                                                                                         testingWeight_kg);               

               FuelData data = FuelData();

               data.iAlt = iAlt;
               data.iVel = iVel;
               data.iFuel = iFuel;               

               data.altitude_ft = alt;
               data.velocity_fps = vel;
               data.fuel_percent = fuelLoad;
               data.fuelBurnRate_kgps = fuelFlow_kgps;

               mFuelFlowData.PushBack(data);

               iVel = iVel + 1;
            }
            iAlt = iAlt + 1;
         }
         iFuel = iFuel + 1;
      }
   end_execute

end_platform
```

- **演示要点**：演示 platform 的参数：six_dof_position, six_dof_alt, execute

### platform（6th_Hohmann_leo_orbit_transfer_demo）｜平台实例

- **关键词**：platform, script_variables, script, add, 平台实例
- **出处**：`satellite_demos/6th_Hohmann_leo_orbit_transfer_demo.txt:53-207`
- **片段**：

```text
platform rendezvous-1 satellite

   script_variables
      string mTargetName = "target";
      double mDVp = 0.0;
      double mDVa = 0.0;
   end_script_variables

   // The following is a script to externally initialize the transfer.
   // For instance, call this script from the Warlock control panel.
   script void BeginTransfer()
      mTargetName = "target";
      writeln(PLATFORM.Name(), " begin transfer to ", mTargetName);
      WsfProcessor proc = PLATFORM.Processor("first-burn");
      proc.SetUpdateInterval(1.0);
      proc.TurnOn();
   end_script

   // Note: for remote turn-on (calling the above script from Warlock,
   // make sure this processor is initially "off"
   // For testing, be sure to leave it "on"
   add processor first-burn WSF_SCRIPT_PROCESSOR
      on
      //off
      update_interval 1.0 second

      script_variables
         bool mInitialBurnComplete = false;
         int k = 0.0;
         double mManeuverPhase;
         double mTOF;
         bool mInitialized = false;
      end_script_variables

      script void Initialize()
         extern string mTargetName;
         extern double mDVp;
         extern double mDVa;

         WsfPlatform target = WsfSimulation.FindPlatform(mTargetName);
         if (target.IsValid())
         {
            WsfSpaceMover tm = (WsfSpaceMover)target.Mover();
            WsfSpaceMover pm = (WsfSpaceMover)PLATFORM.Mover();
            double sma1 = pm.SemiMajorAxis();
            double sma2 = tm.SemiMajorAxis();
            double smaXfer = 0.5*(sma1+sma2);
            mTOF = MATH.PI() * MATH.Sqrt(smaXfer*smaXfer*smaXfer / Earth.GRAVITATIONAL_PARAMETER());
            writeln("TOF: ", mTOF);
            mManeuverPhase = -MATH.Sqrt(Earth.GRAVITATIONAL_PARAMETER() / (sma2*sma2*sma2)) * mTOF + (1.0 + 2.0*k) * MATH.PI();
            writeln("Maneuver Phase: ", mManeuverPhase);
            double ratio = sma2/sma1;
            mDVp = MATH.Sqrt(Earth.GRAVITATIONAL_PARAMETER() / sma1) *
                  (MATH.Sqrt(2.0*ratio / (1.0+ratio)) - 1.0);
            mDVa = MATH.Sqrt(Earth.GRAVITATIONAL_PARAMETER() / sma2) *
                  (1.0 - MATH.Sqrt(2.0 / (1.0+ratio)));
            writeln("deltaVs: ", mDVp, ", ", mDVa);
         }
         else
         {
            writeln("Error!! Invalid target platform name (", mTargetName, ") for maneuver!");
         }

      end_script

      script double DotProduct(double aX1, double aY1, double aZ1,
                               double aX2, double aY2, double aZ2)
         double dp = aX1*aX2 + aY1*aY2 + aZ1*aZ2;
         return dp;
      end_script

      script double Magnitude(double aX, double aY, double aZ)
         double mag = MATH.Sqrt(aX*aX + aY*aY + aZ*aZ);
         return mag;
      end_script

      script double Phase(WsfGeoPoint aTargetLoc,
                          WsfGeoPoint aSourceLoc)
         double tx = aTargetLoc.X();
         double cosArg = DotProduct(aTargetLoc.X(), aTargetLoc.Y(), aTargetLoc.Z(),
                                    aSourceLoc.X(), aSourceLoc.Y(), aSourceLoc.Z());
         double targetMag = Magnitude(aTargetLoc.X(), aTargetLoc.Y(), aTargetLoc.Z());
         double sourceMag = Magnitude(aSourceLoc.X(), aSourceLoc.Y(), aSourceLoc.Z());
         double phase = MATH.ACos(cosArg / targetMag / sourceMag) * MATH.RAD_PER_DEG();
         double cpMinor = aSourceLoc.Y()*aTargetLoc.X() - aSourceLoc.X()*aTargetLoc.Y();
         if (cpMinor > 0)
         {
            phase = -phase;
         }
         return phase;
      end_script

      on_update
         extern string mTargetName;
         extern double mDVp;

         if (! mInitialized)
         {
            writeln(PLATFORM.Name(), " beginning orbit transfer to ", mTargetName);
            Initialize();
            mInitialized = true;
         }
         if (! mInitialBurnComplete)
         {
            WsfPlatform target = WsfSimulation.FindPlatform(mTargetName);
            if (target.IsValid())
            {
               WsfGeoPoint targetLoc = target.Location();
               WsfGeoPoint sourceLoc = PLATFORM.Location();
               double phase = Phase(targetLoc, sourceLoc);
               double diff = MATH.Fabs(phase - mManeuverPhase);
               //writeln("Phase diff: ", diff);
               //writeln("Phase: ", phase);
               if (diff < 0.0001)
               {
                  writeln(TIME_NOW, "Executing 1st burn...");
                  WsfSpaceMover pm = (WsfSpaceMover)PLATFORM.Mover();
                  WsfTangentManeuver mvr = WsfTangentManeuver.Construct(WsfOrbitalEventCondition.NONE(), mDVp);
                  pm.ExecuteManeuver(mvr);
                  writeln(TIME_NOW, "1st burn complete...");
                  WsfProcessor proc = PLATFORM.Processor("second-burn");
                  proc.SetUpdateInterval(mTOF);
                  proc.TurnOn();
                  mInitialBurnComplete = true;
               }
            }
         }
      end_on_update
   end_processor

   add processor second-burn WSF_SCRIPT_PROCESSOR
      off
      update_interval 1.0 s
      script_variables
         bool mOnce = true;
      end_script_variables
      on_update
         writeln(TIME_NOW, " second-burn update");
         if (mOnce) // first time; do nothing
         {
            mOnce = false;
         }
         else
         {
            writeln(TIME_NOW, "Executing 2nd burn...");
            WsfSpaceMover pm = (WsfSpaceMover)PLATFORM.Mover();
            extern double mDVa;
            WsfTangentManeuver mvr = WsfTangentManeuver.Construct(WsfOrbitalEventCondition.NONE(), mDVa);
            pm.ExecuteManeuver(mvr);
            PROCESSOR.TurnOff();
         }
      end_on_update
   end_processor

end_platform
```

- **演示要点**：演示 platform 的参数：script_variables, script, add

### platform（acoustic_demo）｜平台实例

- **关键词**：platform, position, side, 平台实例
- **出处**：`acoustic/acoustic_demo.txt:118-121`　（同签名共 78 处，另见 `acoustic/acoustic_demo.txt:123`、`acoustic/acoustic_demo.txt:129`、`acoustic/acoustic_demo.txt:135`）
- **片段**：

```text
platform jungle_day JUNGLE_DAY_ACOUSTIC_PLATFORM
  position 30.1n 30e altitude 1 m agl
  side red
end_platform
```

- **演示要点**：演示 platform 的参数：position, side

### platform（bearing_sensors_net）｜平台实例

- **关键词**：platform, position, commander, 平台实例
- **出处**：`bearing_only/scenarios/bearing_sensors_net.txt:24-27`　（同签名共 18 处，另见 `cyber/scenarios/duck_hunt.txt:88`、`cyber/scenarios/duck_hunt.txt:100`、`cyber/scenarios/duck_hunt.txt:112`）
- **片段**：

```text
platform fuser_platform_01 FUSER_PLATFORM
   position 48:10:00.00n 127:59:58.00w altitude 3.28 ft agl
   commander commander_platform
end_platform
```

- **演示要点**：演示 platform 的参数：position, commander

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, side, position, 平台实例
- **出处**：`behavior_tree/blackboard.txt:28-31`　（同签名共 53 处，另见 `behavior_tree/blackboard.txt:33`、`behavior_tree/blackboard.txt:38`、`behavior_tree/blackboard.txt:43`）
- **片段**：

```text
platform Blue_checkpoint_1 WSF_PLATFORM
   side blue
   position 01:00:00.00s 03:00:00.00e altitude 30000 ft agl
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：side, position

### platform（semi_tanker_trucks）｜平台实例

- **关键词**：platform, icon, position, 平台实例
- **出处**：`logistics/scenarios/semi_tanker_trucks.txt:15-18`　（同签名共 4 处，另见 `space_operations/scenarios/launch_buildup.txt:13`、`space_operations/scenarios/launch_buildup.txt:18`、`logistics/scenarios/semi_tanker_trucks.txt:9`）
- **片段**：

```text
platform FuelSemi_2 SEMI_TANKER_TRUCK
   icon Semi
   position 24.5515n 81.7600w # Slightly south of Key West Intl Airport
end_platform
```

- **演示要点**：演示 platform 的参数：icon, position

### platform（bomb_sequencers）｜平台实例

- **关键词**：platform, position, heading, 平台实例
- **出处**：`p6dof/bomb_sequencers.txt:58-61`　（同签名共 31 处，另见 `p6dof/bomb_sequencers.txt:63`、`p6dof/bomb_sequencers.txt:68`、`p6dof/bomb_sequencers.txt:73`）
- **片段**：

```text
platform gnd_tgt_1 GROUND-TARGET
   position 21:18:08n 158:04:16.5w  altitude 20 ft
   heading 180 deg
end_platform
```

- **演示要点**：演示 platform 的参数：position, heading

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, icon, position, 平台实例
- **出处**：`route_finder_demos/3d_route_finder.txt:42-45`　（同签名共 5 处，另见 `route_finder_demos/scenario_route_finder_1.txt:15`、`satellite_demos/shuttle-tspi-demo.txt:172`、`signature_demos/scenarios/rocket_launch.txt:12`）
- **片段**：

```text
platform target WSF_PLATFORM
  icon bullseye
  position 00.31532n 00.73940e altitude 35000 ft msl
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, position

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, position, add, 平台实例
- **出处**：`sensor_plot/comm/comm.txt:74-77`　（同签名共 17 处，另见 `sensor_plot/radar/fpa-path.txt:20`、`sensor_plot/radar/fpa-route.txt:29`、`sensor_plot/radar/fpa-tspi-route.txt:30`）
- **片段**：

```text
platform rcvr WSF_PLATFORM
   position 40n 90w altitude 1 m
   add sensor rcvr FAKE_RADIO_RCVR end_sensor
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：position, add

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, position, altitude, 平台实例
- **出处**：`sensor_plot/radar/hm-required-jamming-power.txt:34-37`
- **片段**：

```text
platform jammer WSF_PLATFORM
   position 0.0n 0.5e
   altitude 30000.0 ft
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：position, altitude

### platform（fuel_demo）｜平台实例

- **关键词**：platform, add, fuel_mass, 平台实例
- **出处**：`multiresolution_demos/fuel_demo.txt:58-62`
- **片段**：

```text
platform tabular_fuel_platform SIMPLE_FIGHTER
   add fuel HIGH_FIDELITY_FUEL
   end_fuel
   fuel_mass 500 kg
end_platform
```

- **演示要点**：演示 platform 的参数：add, fuel_mass

### platform（xio_setup）｜平台实例

- **关键词**：platform, route, commander, 平台实例
- **出处**：`distributed_operations/xio_setup.txt:60-65`　（同签名共 10 处，另见 `script_demos/script_demo_3.txt:92`、`script_demos/script_demo_3.txt:99`、`script_demos/script_demo_3.txt:106`）
- **片段**：

```text
platform air-2 my_type
   route
      position 0.001n 0.0e altitude 20000 ft heading 90 deg extrapolate
   end_route
   commander air-1
end_platform
```

- **演示要点**：演示 platform 的参数：route, commander

### platform（j11_out）｜平台实例

- **关键词**：platform, side, route, 平台实例
- **出处**：`l16_j11/j11_out.txt:63-68`　（同签名共 77 处，另见 `sensor_demos/clutter_demo.txt:94`、`sosm/test_mission/a2a/test_a2a.txt:52`、`p6dof/relative_maneuvers.txt:44`）
- **片段**：

```text
platform red-1 FIGHTER
   side red
   route
      position 35:36:55n 118:00w altitude 10000 ft
   end_route
end_platform
```

- **演示要点**：演示 platform 的参数：side, route

### platform（mechanics）｜平台实例

- **关键词**：platform, position, on_initialize, 平台实例
- **出处**：`logistics/scenarios/mechanics.txt:10-15`　（同签名共 3 处，另见 `logistics/scenarios/mechanics.txt:17`、`satellite_demos/5th_iridium_flares_demo.txt:315`）
- **片段**：

```text
platform Mechanic_1 MECHANIC
   position 24.5520n 81.7596w # Slightly south of Key West Intl Airport
   on_initialize
      #runSilent = true;
   end_on_initialize
end_platform
```

- **演示要点**：演示 platform 的参数：position, on_initialize

### platform（fuel_demo）｜平台实例

- **关键词**：platform, multiresolution_fuel, fuel_mass, 平台实例
- **出处**：`multiresolution_demos/fuel_demo.txt:51-56`
- **片段**：

```text
platform mr_fuel_platform MR_FUEL_FIGHTER
   multiresolution_fuel
      fidelity 0
   end_multiresolution_fuel
   fuel_mass 500 kg
end_platform
```

- **演示要点**：演示 platform 的参数：multiresolution_fuel, fuel_mass

### platform（target）｜平台实例

- **关键词**：platform, heading, route, 平台实例
- **出处**：`bearing_only/scenarios/target.txt:11-17`　（同签名共 3 处，另见 `orwaca_iads/scenarios/target.txt:33`、`bearing_only/scenarios/bearing_sensors_net.txt:11`）
- **片段**：

```text
platform target1 AIR_TARGET
   heading 138 deg
   route
     position 49n 128:30:24.58w altitude 10000.00 ft speed 400 kts
     position 48:17:41.35n 125:13:28.56w
   end_route
end_platform
```

- **演示要点**：演示 platform 的参数：heading, route

### platform（GoneFishing_ConstraintDemo）｜平台实例

- **关键词**：platform, icon, route, 平台实例
- **出处**：`cyber/GoneFishing_ConstraintDemo.txt:290-296`
- **片段**：

```text
platform BIG_FISH FISH
   icon bomber
   route
      position 27.95n 86.00w altitude 5000.0 m 
      speed 25 m/s
   end_route
end_platform
```

- **演示要点**：演示 platform 的参数：icon, route

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, add, route, 平台实例
- **出处**：`multiresolution_demos/processor_demo.txt:33-39`
- **片段**：

```text
platform tortoise WSF_PLATFORM
   add mover WSF_AIR_MOVER end_mover
   route
      position 0.5n 0e altitude 20000 ft heading 0 deg speed 100 kts
      position 10.0n 0e altitude 20000 ft speed 450 kts
   end_route
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：add, route

### platform（detector）｜平台实例

- **关键词**：platform, add, edit, 平台实例
- **出处**：`comm/platforms/detector.txt:77-84`
- **片段**：

```text
platform detect1 DETECTOR
   add comm van_comm WSF_COMM_TRANSCEIVER
      network_name van_net
   end_comm
   edit comm ad_hoc
      local_link van_comm
   end_comm
end_platform
```

- **演示要点**：演示 platform 的参数：add, edit

### platform（xio_setup）｜平台实例

- **关键词**：platform, route, edit, 平台实例
- **出处**：`distributed_operations/xio_setup.txt:51-58`
- **片段**：

```text
platform air-1 my_type
   route
      position 0.0n 0.0e altitude 20000 ft heading 90 deg extrapolate
   end_route
   edit processor dumper
      on
   end_processor
end_platform
```

- **演示要点**：演示 platform 的参数：route, edit

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, add, execute, 平台实例
- **出处**：`p6dof/aam_launch_test.txt:187-194`　（同签名共 4 处，另见 `p6dof/sam_launch_test.txt:111`、`multiresolution_demos/processor_with_link_demo.txt:36`、`multiresolution_demos/processor_with_link_demo.txt:53`）
- **片段**：

```text
platform networking_platform WSF_PLATFORM
   add mover WSF_P6DOF_MOVER
      p6dof_object_type $<MOVER_TYPE:AAM-MR>$
   end_mover
   execute at_time 1.0 sec absolute
      DeletePlatform();
   end_execute
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：add, execute

### platform（tactical_maneuvers）｜平台实例

- **关键词**：platform, route, follow_vertical_track, 平台实例
- **出处**：`p6dof/tactical_maneuvers.txt:465-472`　（同签名共 3 处，另见 `six_dof/pm6_tactical_maneuvers.txt:459`、`six_dof/rb6_tactical_maneuvers.txt:459`）
- **片段**：

```text
platform PursuitFighter BlueFighter
   route
      position   21.180n  158.55w  altitude 14000.0 ft  speed 500.0 kts
      position   21.480n  157.95w  altitude 14000.0 ft  speed 500.0 kts
      position   21.520n  157.95w  altitude 14000.0 ft  speed 500.0 kts
   end_route
   follow_vertical_track
end_platform
```

- **演示要点**：演示 platform 的参数：route, follow_vertical_track

### platform（hm-tdoa）｜平台实例

- **关键词**：platform, heading, add, 平台实例
- **出处**：`sensor_plot/esm/hm-tdoa.txt:98-105`　（同签名共 4 处，另见 `sensor_plot/esm/hm-tdoa.txt:107`、`sensor_plot/esm/hm-tdoa.txt:118`、`sensor_plot/esm/hm-tdoa.txt:129`）
- **片段**：

```text
platform sensor-1 MASTER
   heading  90 deg
   add mover WSF_GROUND_MOVER
      route
         position 36:04:55n 115:08:38w altitude 10 ft msl speed 0 kts
      end_route
   end_mover
end_platform
```

- **演示要点**：演示 platform 的参数：heading, add

### platform（globalstar）｜平台实例

- **关键词**：platform, edit, designator, 平台实例
- **出处**：`satellite_demos/satellites/orbit_nominal/globalstar.txt:24-32`　（同签名共 2 处，另见 `satellite_demos/satellites/orbit_nominal/globalstar.txt:138`）
- **片段**：

```text
platform GLOBALSTARA2 GLOBALSTAR
   edit mover
   designator GLOBALSTAR_A2
      revs_per_day 12.6315789
      inclination 52 deg
      raan 45 deg
      anomaly 120 deg
   end_mover
end_platform
```

- **演示要点**：演示 platform 的参数：edit, designator

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, add, radar_signature, 平台实例
- **出处**：`satellite_demos/satellites/satcat/satcat.txt:14-22`　（同签名共 2207 处，另见 `satellite_demos/satellites/satcat/satcat.txt:28`、`satellite_demos/satellites/satcat/satcat.txt:42`、`satellite_demos/satellites/satcat/satcat.txt:56`）
- **片段**：

```text
platform TIROS_1 WSF_PLATFORM
   add mover WSF_SPACE_MOVER
      designator 1960002B
      revs_per_day 14.73899692937564
      inclination 48.4 deg
      eccentricity  0.025482625482625483
   end_mover
   radar_signature TIROS_1_RADAR_SIGNATURE
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：add, radar_signature

### platform（px_fighter）｜平台实例

- **关键词**：platform, route, execute, 平台实例
- **出处**：`sensor_plot/eoir/px_fighter.txt:35-43`　（同签名共 5 处，另见 `sensor_plot/sar/ag_bomber.txt:35`、`sensor_plot/sar/ip_bomber.txt:35`、`sensor_plot/sar/sn_bomber.txt:35`）
- **片段**：

```text
platform fighter FIGHTER
   route
      position 0n 0e altitude 20000 ft heading 0 deg speed 444.36398 kts
   end_route

   execute at_time 0.001 secs absolute
      PLATFORM.Sensor("eoir").CueToAbsoluteAzEl(45.0, -6.0);     # <--- Cue the sensor
   end_execute
end_platform
```

- **演示要点**：演示 platform 的参数：route, execute

### platform（comm_satellite）｜平台实例

- **关键词**：platform, mover, orbit, 平台实例
- **出处**：`satellite_demos/scenarios/comm_satellite.txt:32-41`
- **片段**：

```text
platform AO-51 COMSAT
   mover
     debug
   end_mover
   orbit
1 28375U 04025K   05108.18171526  .00000126  00000-0  50790-4 0  2280
2 28375  98.2173 173.1035 0085146  52.7175 308.1739 14.40449408 41978
   end_orbit

end_platform
```

- **演示要点**：演示 platform 的参数：mover, orbit

### platform（simple_auto_jamming）｜平台实例

- **关键词**：platform, route, weapon, 平台实例
- **出处**：`electronic_warfare/simple_auto_jamming.txt:396-406`
- **片段**：

```text
platform jammer JAMMER_PLATFORM
   route
      position 37:00:00n 114:30:00w
      altitude 35000 ft
      speed      450 kts
      heading    270 deg
   end_route

   weapon jammer
   end_weapon
end_platform
```

- **演示要点**：演示 platform 的参数：route, weapon

### platform（comm_jamming）｜平台实例

- **关键词**：platform, delete, add, 平台实例
- **出处**：`electronic_warfare/comm_jamming.txt:186-197`　（同签名共 2 处，另见 `electronic_warfare/comm_jamming.txt:199`）
- **片段**：

```text
platform blue-fighter-1 BLUE-FIGHTER
   // --- Add Offset Mover
   delete mover
   add mover WSF_OFFSET_MOVER
      update_interval 1.5 sec
      update_time_tolerance .25 sec
      attachment_type rigid
      reference_platform blue-surveillance
      offset_from_reference -450 m -900 m 0 m
      orphan_action extrapolate
   end_mover
end_platform
```

- **演示要点**：演示 platform 的参数：delete, add

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, command_chain, add, 平台实例
- **出处**：`multiresolution_demos/comm_with_command_chain_demo.txt:66-77`　（同签名共 3 处，另见 `multiresolution_demos/comm_with_command_chain_demo.txt:79`、`multiresolution_demos/comm_with_command_chain_demo.txt:46`）
- **片段**：

```text
platform vader WSF_PLATFORM
   command_chain IMPERIAL palpatine
   add multiresolution_comm mr_comm MR_COMM
      fidelity 1
      common
         network_name imperial_net
         internal_link message_receiver
      end_common
   end_multiresolution_comm
   add processor message_receiver MESSAGE_RECEIVER
   end_processor
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：command_chain, add

### platform（blue_laydown）｜平台实例

- **关键词**：platform, track, mover, 平台实例
- **出处**：`cyber/scenarios/blue_laydown.txt:12-27`
- **片段**：

```text
platform uav_1 UAV

   track platform target_1 end_track
   
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
   
end_platform
```

- **演示要点**：演示 platform 的参数：track, mover

### platform（intersect_mesh_test）｜平台实例

- **关键词**：platform, add, route, 平台实例
- **出处**：`hel/intersect_mesh_test.txt:316-340`　（同签名共 3 处，另见 `hel/intersect_mesh_test_beam_director.txt:406`、`sensor_demos/spin_scheduler.txt:32`）
- **片段**：

```text
platform red_adv_fighter_2 RED_ADV_FIGHTER_2
   add processor turn-proc WSF_SCRIPT_PROCESSOR
      script void turn()
         static double heading = 180.0;
         if (heading == 180.0)
         {
            heading = 0.0;
         }
         else
         {
            heading = 180.0;
         }
         PLATFORM.TurnToHeading(heading);
      end_script
      on_update
         turn();
      end_on_update
      update_interval 30.0 seconds
   end_processor

   route
      position 0:10:00n 0.0383e speed 200 kts altitude 2000 meters heading 180 degrees
   end_route

end_platform
```

- **演示要点**：演示 platform 的参数：add, route

### platform（flight_envelope）｜平台实例

- **关键词**：platform, script, on_initialize2, 平台实例
- **出处**：`p6dof/flight_envelope.txt:138-240`
- **片段**：

```text
platform test_platform TEST_PLATFORM_TYPE

   script void GenerateMilDotPlot()
      double throttleSetting = 1.0;
      double flapsSetting = 0.0;

      for( int alt = dotInitialAltitude_ft; alt <= dotFinalAltitude_ft; alt = alt + dotAltitudeStep_ft)
      {
         for( int vel = dotInitialVelocity_fps; vel <= dotFinalVelocity_fps; vel = vel + dotVelocityStep_fps)
         {
            struct temp = struct.New("DataPair");
            temp->altitude_ft = alt;
            temp->velocity_fps = vel;

            int canFly = CanFlyAt(PLATFORM, alt, vel, throttleSetting, flapsSetting);
            if(canFly == 0)
            {
               writeln("Can NOT fly @ ", alt, " ft, ", vel, " mps");
               mCanNotFly.PushBack(temp);
            }
            else if(canFly == 1)
            {
               writeln("Can fly with NO controls @ ", alt, " ft, ", vel, " mps");
               mCanFlyNoControl.PushBack(temp);
            }
            else if(canFly == 2)
            {
               writeln("CAN fly @ ", alt, " ft, ", vel, " mps");
               mCanFly.PushBack(temp);
            }
            else
            {
               writeln("Error in CanFlyAt() return value");
            }
         }
      }
      writeln(".");
   end_script

   script void GenerateMilEnvelope()
      mMilEnvelope = ComputeFlightEnvelope(PLATFORM, 1.0, 0.0);
   end_script

   script void GenerateAB_Envelope()
      mAB_Envelope = ComputeFlightEnvelope(PLATFORM, 2.0, 0.0);
   end_script

   on_initialize2
      //Execute flight envelope test
      if(generateMilDotPlot)
      {
         writeln("Generating MIL Dot Plot");
         GenerateMilDotPlot();
      }
      if(generateMilEnvelope)
      {
         writeln("Generating MIL Flight Envelope");
         GenerateMilEnvelope();
      }
      if(generateAB_Envelope)
      {
         writeln("Generating AB Flight Envelope");
         GenerateAB_Envelope();
      }

      writeln("Writing out results");
      if(generateMilDotPlot)
      {
         WriteOutDotPlot();
      }
      if(generateMilEnvelope)
      {
         WriteOutMilEnvelope();
      }
      if(generateAB_Envelope)
      {
         WriteOutAB_Envelope();
      }
      writeln("Writing results complete");

      # ------------------------------------------------------------------------
      /*
      # Here we can launch excel to generate the plot, or launch a plot
	  # viewing utility to read the csv, to allow us to visualize the data.
	  
      if(generateMilDotPlot)
      {
         System.Command(write_str("start ./plot_viewer/plot_viewer.exe ", milDotFilename));
      }
      if(generateMilEnvelope)
      {
         System.Command(write_str("start ./plot_viewer/plot_viewer.exe ", milEnvelopeFilename));
      }
      if(generateAB_Envelope)
      {
         System.Command(write_str("start ./plot_viewer/plot_viewer.exe ", abEnvelopeFilename));
      }
      */
      # ------------------------------------------------------------------------

   end_on_initialize2

end_platform
```

- **演示要点**：演示 platform 的参数：script, on_initialize2

### platform（launchers）｜平台实例

- **关键词**：platform, position, 平台实例
- **出处**：`ballistic/scenarios/launchers.txt:11-13`　（同签名共 26 处，另见 `ballistic/scenarios/launchers.txt:15`、`ballistic/scenarios/launchers.txt:19`、`ballistic/scenarios/launchers.txt:23`）
- **片段**：

```text
platform target01 TARGET
  position 24n 55e
end_platform
```

- **演示要点**：演示 platform 的参数：position

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, position, 平台实例
- **出处**：`sensor_demos/scanning_eoir.txt:67-69`
- **片段**：

```text
platform target WSF_PLATFORM
   position 0n 0:3:10e
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：position

### platform（px_fighter）｜平台实例

- **关键词**：platform, route, 平台实例
- **出处**：`sensor_plot/sar/px_fighter.txt:44-48`　（同签名共 46 处，另见 `sensor_plot/sar/sc_bomber.txt:32`、`sensor_plot/sar/sc_example.txt:32`、`sensor_plot/sar/sc_fighter.txt:32`）
- **片段**：

```text
platform fighter FIGHTER
   route
      position 0n 0e altitude 20000 ft heading 0 deg speed 444.36398 kts
   end_route
end_platform
```

- **演示要点**：演示 platform 的参数：route

### platform（attitude_control）｜平台实例

- **关键词**：platform, mover, 平台实例
- **出处**：`space_operations/attitude_control.txt:143-147`　（同签名共 148 处，另见 `coverage_demos/scenarios/sat_con_1_autogen.txt:27`、`coverage_demos/scenarios/sat_con_1_autogen.txt:36`、`coverage_demos/scenarios/sat_con_1_autogen.txt:45`）
- **片段**：

```text
platform oriented_satellite1 ORIENTED_SATELLITE
   mover
      position 0n 90w altitude 450 km heading 30 deg
   end_mover
end_platform
```

- **演示要点**：演示 platform 的参数：mover

### platform（comm_demo）｜平台实例

- **关键词**：platform, add, 平台实例
- **出处**：`multiresolution_demos/comm_demo.txt:48-52`　（同签名共 4 处，另见 `sensor_plot/radar/fpa-tspi-route.txt:20`、`electronic_warfare/comm_jamming.txt:282`、`electronic_warfare/comm_jamming.txt:294`）
- **片段**：

```text
platform mr_sender MR_SENDER_BASE
   add multiresolution_comm mr_cmdr_comm MR_COMM
      fidelity 0
   end_multiresolution_comm
end_platform
```

- **演示要点**：演示 platform 的参数：add

### platform（shuttle-tspi-demo）｜平台实例

- **关键词**：platform, edit, 平台实例
- **出处**：`satellite_demos/shuttle-tspi-demo.txt:32-36`　（同签名共 273 处，另见 `satellite_demos/shuttle-tspi-demo.txt:38`、`satellite_demos/shuttle-tspi-demo.txt:44`、`satellite_demos/4th_constellation_demo.txt:57`）
- **片段**：

```text
platform discovery-tal SPACE_SHUTTLE // Transatlantic Abort Scenario
   edit mover
      TSPI_filename ./tspi/DATA_TAL.txt
   end_mover
end_platform
```

- **演示要点**：演示 platform 的参数：edit

### platform（pm6_brawler_maneuver_comparison）｜平台实例

- **关键词**：platform, execute, 平台实例
- **出处**：`six_dof_with_brawler/pm6_brawler_maneuver_comparison.txt:52-57`　（同签名共 10 处，另见 `six_dof_with_brawler/pm6_brawler_maneuver_comparison.txt:59`、`six_dof_with_brawler/pm6_brawler_maneuver_comparison.txt:66`、`six_dof_with_brawler/pm6_brawler_maneuver_comparison.txt:73`）
- **片段**：

```text
platform slice_PM6 MANEUVER_TEST_PM6  
   execute at_interval_of 1 sec
      WsfSixDOF_Mover mover = (WsfSixDOF_Mover)Mover();
      mover.Slice(230, Math.M_PER_FT() * 15000.0, 0.75);
   end_execute 
end_platform
```

- **演示要点**：演示 platform 的参数：execute

### platform（amateur_platforms）｜平台实例

- **关键词**：platform, orbit, 平台实例
- **出处**：`satellite_demos/TLE/amateur_platforms.txt:11-16`　（同签名共 1064 处，另见 `satellite_demos/TLE/amateur_platforms.txt:18`、`satellite_demos/TLE/amateur_platforms.txt:25`、`satellite_demos/TLE/amateur_platforms.txt:32`）
- **片段**：

```text
platform OSCAR_7_(AO-7)(07530) AMATEUR
   orbit
1 07530U 74089B   14243.56173821 -.00000042  00000-0  10847-4 0   509
2 07530 101.4812 222.9335 0012224 146.0425 325.5759 12.53606705820969
   end_orbit
end_platform
```

- **演示要点**：演示 platform 的参数：orbit

### platform（test）｜平台实例

- **关键词**：platform, track, 平台实例
- **出处**：`laser_designator/test.txt:42-49`
- **片段**：

```text
platform test TEST
   track 
      platform primary_target  
   end_track
   track 
      platform secondary_target  
   end_track
end_platform
```

- **演示要点**：演示 platform 的参数：track

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, add, 平台实例
- **出处**：`satellite_demos/satellites/satcat/satcat.txt:2670-2677`　（同签名共 725 处，另见 `satellite_demos/satellites/satcat/satcat.txt:7747`、`satellite_demos/satellites/satcat/satcat.txt:8204`、`satellite_demos/satellites/satcat/satcat.txt:8507`）
- **片段**：

```text
platform EKRAN_5 WSF_PLATFORM
   add mover WSF_SPACE_MOVER
      designator 1980060A
      revs_per_day 1.0027156883225403
      inclination 0.1 deg
      eccentricity  0
   end_mover
end_platform
```

- **演示要点**：演示 WSF_PLATFORM 的参数：add

### platform（gps）｜平台实例

- **关键词**：platform, designator, 平台实例
- **出处**：`satellite_demos/satellites/orbit_nominal/gps.txt:32-40`　（同签名共 56 处，另见 `satellite_demos/satellites/orbit_nominal/gps.txt:42`、`satellite_demos/satellites/orbit_nominal/gps.txt:52`、`satellite_demos/satellites/orbit_nominal/gps.txt:62`）
- **片段**：

```text
platform GPS_A1 GPS
edit mover
   designator A1
      revs_per_day 2.005571
      inclination 55 deg
      raan 272.847 deg
      anomaly 268.126 deg
end_mover
end_platform
```

- **演示要点**：演示 platform 的参数：designator

### platform（air_mover_demo）｜平台实例

- **关键词**：platform, multiresolution_mover, 平台实例
- **出处**：`multiresolution_demos/air_mover_demo.txt:41-52`
- **片段**：

```text
platform test SIMPLE_FIGHTER
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
end_platform
```

- **演示要点**：演示 platform 的参数：multiresolution_mover

### platform（black_van）｜平台实例

- **关键词**：platform, 平台实例
- **出处**：`comm/platforms/black_van.txt:30-31`　（同签名共 441 处，另见 `comm/platforms/detector.txt:86`、`comm/platforms/detector.txt:89`、`comm/platforms/detector.txt:92`）
- **片段**：

```text
platform black_van BLACK_VAN
end_platform
```

- **演示要点**：演示 platform（最小结构，无子参数）

### platform · WSF_PLATFORM｜平台实例

- **关键词**：platform, WSF_PLATFORM, 平台实例
- **出处**：`outer_air_battle/struct_test.txt:23-54`
- **片段**：

```text
platform testing WSF_PLATFORM

#   add processor testing WSF_SCRIPT_PROCESSOR

      on_initialize
         // Create a new instance of the struct
         struct car = struct.New("Car");

         // Print the contents of the struct
         writeln(car);

         // Assign to a variable on the instance
         car->color = "blue";

         // Call a script
         car->Honk();

         // Add a new variable to the instance
         car->make = "Ford";

         // The '->' operator isn't checked until it's executed
         // So variables can be added at runtime.
         writeln("Car Make: ", car->make);

         // However, the script compiler won't know if you use the wrong name
         writeln("This will produce an error", car->Not_A_Variable);

      end_on_initialize

#   end_processor

end_platform
```

- **演示要点**：演示 WSF_PLATFORM（最小结构，无子参数）

### platform_availability（attitude_control）｜

- **关键词**：platform_availability, default, name
- **出处**：`space_operations/attitude_control.txt:172-175`　（同签名共 2 处，另见 `wargame/white_cell_view.txt:25`）
- **片段**：

```text
platform_availability
   default availability 1.0
   name oriented_satellite1  availability 1.0
end_platform_availability
```

- **演示要点**：演示 platform_availability 的参数：default, name

### platform_availability（generate_lunar_orbiter_ics）｜

- **关键词**：platform_availability, name
- **出处**：`cislunar/scripts/generate_lunar_orbiter_ics.txt:77-79`　（同签名共 14 处，另见 `electronic_warfare/false-target_command_center.txt:519`、`heatmap/heatmap_demo.txt:38`、`timeline/timeline_demo.txt:34`）
- **片段**：

```text
platform_availability
   name orbiter availability 0.0
end_platform_availability
```

- **演示要点**：演示 platform_availability 的参数：name

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, radar_signature, infrared_signature, optical_signature, category, mover, default_climb_rate, default_dive_rate, maximum_linear_acceleration, minimum_altitude, maximum_altitude, maximum_speed, 平台类型
- **出处**：`suppressor/platforms/bomber.txt:28-128`
- **片段**：

```text
platform_type BOMBER WSF_PLATFORM
  icon B-52
  radar_signature     BOMBER_RCS_SIG
  infrared_signature  BOMBER_IR_SIG
  optical_signature   BOMBER_OPT_SIG

  category ignored-by-bomber-radar

  mover WSF_AIR_MOVER
    default_climb_rate           50 m/s
    default_dive_rate            30 m/s
    maximum_linear_acceleration  20 m/s2
    minimum_altitude             0 m
    maximum_altitude             15 km
    maximum_speed                500 m/s
  end_mover

  sensor bomber_radar BOMBER_RADAR
    ignore ignored-by-bomber-radar
  end_sensor

  weapon bomber_weapon BLUE_GPS_BOMB_3_2000_LB
    weapon_effects           BLUE_GPS_BOMB_3_2000_LB_EFFECT
    quantity                 14
    firing_delay             2.5 sec
    salvo_interval           1.5 sec
    maximum_request_count    4
  end_weapon

  processor sensor_processor WSF_TRACK_PROCESSOR
    purge_interval  1 min
  end_processor

  // this processor acts like the launch computer
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

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, radar_signature, infrared_signature, optical_signature, category, mover, default_climb_rate, default_dive_rate, maximum_linear_acceleration, minimum_altitude

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, weapon_effects, icon, infrared_signature, optical_signature, radar_signature, mover, total_mass, fuel_mass, thrust_duration, burn_rate, specific_impulse, thrust, 平台类型
- **出处**：`base_types/weapons/aam/test_medium_range_missile.txt:60-108`　（同签名共 2 处，另见 `base_types/weapons/aam/blue_lr_a2a_rf_missile.txt:60`）
- **片段**：

```text
platform_type TEST_MEDIUM_RANGE_MISSILE WSF_PLATFORM

  weapon_effects TEST_EFFECT

  icon SA-10_Missile
  infrared_signature TEST_INFRARED_SIGNATURE
  optical_signature  TEST_OPTICAL_SIGNATURE
  radar_signature    TEST_RADAR_SIGNATURE

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

  processor autopilot WSF_GUIDANCE_COMPUTER
    proportional_navigation_gain  30.0
    velocity_pursuit_gain         30.0
    g_bias                         1.2
    maximum_commanded_g           40.0 g
    #omit_velocity_pursuit
    update_interval                0.1 s
  end_processor

  processor seeker WSF_PERFECT_TRACKER
    update_interval 0.10 s
  end_processor

  processor fuse WSF_AIR_TARGET_FUSE
    time_of_flight_to_arm  2.0 sec
    max_time_of_flight_to_detonate 140.0 sec
    detonate_on_mach_decreasing_to  1.0       # DRB Added 5/10/10
    detonate_below_height_AGL       0.0 ft #  -200.0 m
             # DRB:  Make sure does not detonate prematurely during generation.
             # PROBLEM:  For sea level test, cannot set negative!
  end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：weapon_effects, icon, infrared_signature, optical_signature, radar_signature, mover, total_mass, fuel_mass, thrust_duration, burn_rate

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, weapon_effects, icon, infrared_signature, optical_signature, radar_signature, mover, total_mass, fuel_mass, specific_impulse, thrust, thrust_duration, update_interval, 平台类型
- **出处**：`base_types/weapons/aam/simple_medium_range_missile.txt:50-93`　（同签名共 2 处，另见 `behavior_tree/weapons/aam/simple_mrm.txt:46`）
- **片段**：

```text
platform_type SIMPLE_MEDIUM_RANGE_MISSILE WSF_PLATFORM

  weapon_effects SIMPLE_EFFECT

  icon SA-10_Missile
  infrared_signature SIMPLE_INFRARED_SIGNATURE
  optical_signature  SIMPLE_OPTICAL_SIGNATURE
  radar_signature    SIMPLE_RADAR_SIGNATURE

  mover WSF_GUIDED_MOVER
    total_mass       161.5 kg # (Wikipedia)
    fuel_mass         55.0 kg
    # Isp values of 250 are typical of solid rocket motors of today
    specific_impulse 250.0 sec
    thrust          2500.0 lbf
    thrust_duration    12.12 sec
    update_interval 0.10 s
    aero GUESSED_AERO
    #show_status # Turns on some mass properties diagnostic output
  end_mover

  processor autopilot WSF_GUIDANCE_COMPUTER
    proportional_navigation_gain  30.0
    velocity_pursuit_gain         30.0
    g_bias                         1.2
    maximum_commanded_g           40.0 g
    #omit_velocity_pursuit
    update_interval                0.1 s
  end_processor

  processor seeker WSF_PERFECT_TRACKER
    update_interval 0.10 s
  end_processor

  processor fuse WSF_AIR_TARGET_FUSE
    time_of_flight_to_arm  2.0 sec
    max_time_of_flight_to_detonate 140.0 sec
    detonate_on_mach_decreasing_to  1.0       # DRB Added 5/10/10
    detonate_below_height_AGL       0.0 ft #  -200.0 m
             # DRB:  Make sure does not detonate prematurely during generation.
             # PROBLEM:  For sea level test, cannot set negative!
  end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：weapon_effects, icon, infrared_signature, optical_signature, radar_signature, mover, total_mass, fuel_mass, specific_impulse, thrust

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, sensor, on, processor, ignore, mover, initial_mass, fuel_mass, specific_impulse, thrust, aero, purge_interval, 平台类型
- **出处**：`suppressor/weapons/sam/missile.txt:84-125`
- **片段**：

```text
platform_type MISSILE WSF_PLATFORM
  icon SA-10_Missile

  sensor missile_radar MISSILE_RADAR
    on
    processor track_processor
    ignore ignored-by-iads-radar
  end_sensor

  mover WSF_GUIDED_MOVER
    //show_status
    initial_mass        500 kg
    fuel_mass           200 kg
    specific_impulse    300 sec
    thrust            44000 nt
    aero          MISSILE_AERO
  end_mover

  processor track_processor WSF_TRACK_PROCESSOR
    purge_interval 1 min
  end_processor

  processor missile_guidance_computer WSF_GUIDANCE_COMPUTER
    //JAJ proportional_navigation_gain   4
    //JAJ velocity_pursuit_gain          10
    //JAJ g_bias                         1
    proportional_navigation_gain   10.0
    velocity_pursuit_gain          4.0
    g_bias                         1.2
#   continuous_g_bias
    maximum_commanded_g            40.0 g
    guidance_delay                  4.0 sec
  end_processor

  processor fuze WSF_AIR_TARGET_FUSE
    time_of_flight_to_arm            10.0 sec     // Don't arm during the boost phase
    coast_time_on_loss_of_target      4.0 sec
  end_processor

  category ignored-by-bomber-radar
  category ignored-by-iads-radar
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, sensor, on, processor, ignore, mover, initial_mass, fuel_mass, specific_impulse, thrust

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, category, script_variables, execute, weapon_effects, icon, infrared_signature, optical_signature, radar_signature, mover, total_mass, fuel_mass, specific_impulse, 平台类型
- **出处**：`air_to_air/weapons/aam/medium_range_radar_missile.txt:116-242`
- **片段**：

```text
platform_type MEDIUM_RANGE_RADAR_MISSILE WSF_PLATFORM
   category missile
   category MISSILE

   script_variables
      bool mDrawTarget = false;
      WsfDraw draw = WsfDraw();
   end_script_variables

   execute at_interval_of 1 sec
      if (mDrawTarget)
      {
         WsfTrack tgt = PLATFORM.CurrentTargetTrack();
         if (tgt.IsValid())
         {
            draw.SetDuration(1.0);  //same as execute interval
            draw.SetColor(1, 0, 1); //purple
            draw.SetLineSize(2);    //double thick
            draw.BeginLines();
               draw.Vertex(PLATFORM.Location());
               draw.Vertex(tgt.CurrentLocation());
            draw.End();
         }
      }
   end_execute

   weapon_effects SIMPLE_EFFECT
   icon aim120
   infrared_signature SIMPLE_INFRARED_SIGNATURE
   optical_signature  SIMPLE_OPTICAL_SIGNATURE
   radar_signature    SIMPLE_RADAR_SIGNATURE


   mover WSF_GUIDED_MOVER
    total_mass       350.0 lbm #ref - Weapons File 14th edition
    fuel_mass         157.0 lbm # derived from thrust and specific impulse
    # Isp values of 250 are typical of solid rocket motors of
    # today, but that value would not close, so was reduced.
    specific_impulse 222.0 sec # guess, taken from SRM model
    thrust          5800.0 lbf # guess
    thrust_duration    6.0 sec // guess
    update_interval 0.10 s
    aero MRM_AERO
    #show_status # Turns on some mass properties diagnostic output
  end_mover

# NAS - made up some values
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

   ###########################################################################
   ### simple fuse
   ###########################################################################
   processor fuse WSF_AIR_TARGET_FUSE
      max_time_of_flight_to_detonate  120.0 sec
   end_processor

   ###########################################################################
   ### perfect trackers provide target truth data for the missile
   ###   no uplink or tracking required for this missile
   ###########################################################################
   #processor seeker WSF_PERFECT_TRACKER
   #   update_interval  0.5 s
   #end_processor

   ###########################################################################
   ### imperfect radar provide target data for the missile
   ###########################################################################
   sensor seeker RADAR_SEEKER
      off
      internal_link track_mgr
      internal_link weapon_manager
   end_sensor

   ###########################################################################
   ### simple track manager.  make sure comm & sensor feed it
   ###########################################################################
   processor track_mgr WSF_TRACK_PROCESSOR
      master_track_processor
   end_processor

   ###########################################################################
   ### turns on the weapon radar at the right time
   ###########################################################################
   processor weapon_manager WSF_WEAPON_TRACK_PROCESSOR
      turn_on_sensor seeker  at_time   20 s before_intercept
     #turn_on_sensor seeker at_range 3500 m before_intercept
      coast_time      100 s
      uplink_required false         #this version is active missile only (no no command guidance uplink)
   end_processor

// NAS - add comm, track processor

   comm uplink WSF_COMM_RCVR       // uplink to weapons
      network_name weapons_subnet
      internal_link data_mgr
   end_comm
   
   processor data_mgr WSF_TRACK_PROCESSOR
      master_track_processor 
      fused_track_reporting on
      purge_interval 60 s
   end_processor 

   script void on_platform_deleted()
      if (PLATFORM.Commander().IsValid()) // && PLATFORM.Commander().UplinkProcessor().IsValid)
      {
         PLATFORM.Commander().UplinkProcessor().StopUplinking(PLATFORM);
      }
   end_script
   
   execute at_time 0.1 s relative 
      writeln(" Weapon ",PLATFORM.Name()," GUIDER = ",PLATFORM.CommanderName());
   end_execute
   
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：category, script_variables, execute, weapon_effects, icon, infrared_signature, optical_signature, radar_signature, mover, total_mass

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, mover, total_mass, fuel_mass, thrust, thrust_duration, update_interval, aero, comm, processor, proportional_navigation_gain, velocity_pursuit_gain, 平台类型
- **出处**：`electronic_warfare/track_error.txt:278-348`
- **片段**：

```text
platform_type SAM_MISSILE WSF_PLATFORM
  icon Missile

  mover WSF_GUIDED_MOVER
    #show_status
    total_mass       84.5 kg
    fuel_mass        25.45 kg
    thrust           5200 lbf
    thrust_duration  20.0 sec
    update_interval  0.10 s
    aero             SAM_MISSILE_AERO
  end_mover

  comm uplink WSF_COMM_TRANSCEIVER
     internal_link data_mgr
  end_comm

  processor data_mgr WSF_WEAPON_TRACK_PROCESSOR
  end_processor

  processor computer WSF_GUIDANCE_COMPUTER
    proportional_navigation_gain  6.0
    velocity_pursuit_gain         6.0
    g_bias                        1.2
    maximum_commanded_g           25.0 g
    update_interval               0.1 s
  end_processor

  processor fuse WSF_AIR_TARGET_FUSE
    max_time_of_flight_to_detonate  45.0 sec
  end_processor

  script void on_platform_deleted()
      writeln(TIME_NOW, " ", PLATFORM.Name(), " SlantRange to target1: ", PLATFORM.SlantRangeTo(WsfSimulation.FindPlatform(CurrentTargetTrack().TargetIndex())));
  end_script

   # --------------------------------------
   # Draw track to targets
   # --------------------------------------
   script_variables
      # Create a WsfDraw object.
      WsfDraw draw = WsfDraw();
   end_script_variables

   execute at_interval_of 1.0 s
      WsfTrack track = PLATFORM.CurrentTargetTrack();
      if (track.IsValid())
      {
        # use the track ID as a unique draw ID
        # a track icon and a line to the track icon
        # is drawn at each track update
        string trackId = track.TrackId().ToString();
        draw.SetId(trackId);
        draw.SetDuration(1.0); # this is faster than calling erase every time

        # Draw a track icon
        draw.SetColor(0,1,0);
        draw.BeginIcons(track.Heading(), "Wedge");
           draw.Vertex(track.CurrentLocation());
        draw.End();

        # Draw a line to the track
        draw.SetLineStyle("solid");
        draw.BeginLines();
           draw.Vertex(PLATFORM);
           draw.Vertex(track.CurrentLocation());
        draw.End();
      }
   end_execute
   # ---------------------------------------
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, mover, total_mass, fuel_mass, thrust, thrust_duration, update_interval, aero, comm, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, radar_signature, comm, processor, report_to, track_manager, mover, maximum_speed, sensor, on, ignore_same_side, internal_link, 平台类型
- **出处**：`ship_ad/platforms/red_missile_frigate.txt:44-122`
- **片段**：

```text
platform_type RED_MISSILE_FRIGATE WSF_PLATFORM
  icon JiangKai

  radar_signature SHIP_RADAR_SIGNATURE

  comm datalink RED_DATALINK
     network_name <local:master>
     internal_link task_mgr
  end_comm

  comm RED_SR_SAM_2_uplink WSF_COMM_TRANSCEIVER
  end_comm

  processor data_mgr RED_MISSILE_FRIGATE_DATA_MGR
    report_to commander via datalink
  end_processor

  processor task_mgr RED_MISSILE_FRIGATE_TASK_MGR
     operating_level ENGAGE 1
#     weapon_uplink_path top_plate RED_SR_SAM_2_uplink
  end_processor

  track_manager
     filter FILTER_TACTICS end_filter
  end_track_manager

  mover WSF_SURFACE_MOVER
    maximum_speed  27 kts
  end_mover

  sensor top_plate TOP_PLATE # air search
    on
    ignore_same_side

    internal_link data_mgr
  end_sensor

  sensor ill-1 FRONT_DOME # RED_SR_SAM_2 illuminator
    category ILLUMINATOR
    off
    ignore_same_side
  end_sensor

  sensor ill-2 FRONT_DOME # RED_SR_SAM_2 illuminator
    category ILLUMINATOR
    off
    ignore_same_side
  end_sensor

  sensor ill-3 FRONT_DOME # RED_SR_SAM_2 illuminator
    category ILLUMINATOR
    off
    ignore_same_side
  end_sensor

  sensor ill-4 FRONT_DOME # RED_SR_SAM_2 illuminator
    category ILLUMINATOR
    off
    ignore_same_side
  end_sensor

  weapon sam RED_SR_SAM_2
    location 0 0 -5 m  # estimate
    quantity      32
  end_weapon

  zone full_kinematic
     circular
        maximum_altitude 22 km
        maximum_radius   40 km
  end_zone

  zone half_kinematic
     circular
        maximum_altitude 22 km
        maximum_radius   20 km
  end_zone

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, radar_signature, comm, processor, report_to, track_manager, mover, maximum_speed, sensor, on

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, comm, processor, sensor, off, ignore, weapon, quantity, firing_delay, salvo_interval, slew_mode, purge_interval, 平台类型
- **出处**：`suppressor/platforms/sam_battery.txt:16-191`
- **片段**：

```text
platform_type sam_battery WSF_PLATFORM
  icon SA-6_Launcher

  comm red-net COMM_RADIO
    processor track_processor
    processor thinker
  end_comm

  comm weapon-uplink WSF_COMM_TRANSCEIVER
  end_comm

  sensor sam_radar SAM_RADAR
    off
    processor track_processor
    ignore ignored-by-iads-radar
  end_sensor

  weapon missile missile
    quantity         6
    firing_delay     1.5 sec
    salvo_interval   1.5 sec
    slew_mode        both
  end_weapon

  processor track_processor WSF_TRACK_PROCESSOR
    purge_interval 1 min
  end_processor

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

  category ignored-by-iads-radar
  category ignored-by-bomber-radar
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, comm, processor, sensor, off, ignore, weapon, quantity, firing_delay, salvo_interval

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, mover, total_mass, fuel_mass, specific_impulse, thrust, thrust_duration, update_interval, aero, processor, proportional_navigation_gain, velocity_pursuit_gain, 平台类型
- **出处**：`behavior_tree/weapons/aam/blue_sr_a2a_ir_missile.txt:51-86`
- **片段**：

```text
platform_type BLUE_SR_A2A_IR_MISSILE_BASE WSF_PLATFORM

  icon AIM-9X

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

  processor blue_sr_a2a_ir_missile_autopilot WSF_OLD_GUIDANCE_COMPUTER
    proportional_navigation_gain  30.0
    velocity_pursuit_gain         30.0
    g_bias                         1.0
    continuous_g_bias
    max_commanded_g               40.0 g
    omit_velocity_pursuit
    update_interval                0.1 s
  end_processor

  processor blue_sr_a2a_ir_missile_seeker WSF_PERFECT_TRACKER
    update_interval 0.10 s
  end_processor

  processor blue_sr_a2a_ir_missile_fuse WSF_AIR_TARGET_FUSE
    max_time_of_flight_to_detonate  120.0 sec
  end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, mover, total_mass, fuel_mass, specific_impulse, thrust, thrust_duration, update_interval, aero, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, radar_signature, comm, processor, track_manager, mover, maximum_speed, sensor, on, ignore_same_side, internal_link, off, 平台类型
- **出处**：`ship_ad/platforms/missile_ship.txt:38-106`
- **片段**：

```text
platform_type MISSILE_SHIP WSF_PLATFORM
  icon jiangKai

  radar_signature SHIP_RADAR_SIGNATURE

  comm datalink RED_DATALINK
     network_name <local:master>
     internal_link data_mgr
     internal_link 3rd_party_mgr
  end_comm

  comm ssm_missile_uplink WSF_COMM_TRANSCEIVER
  end_comm

  processor data_mgr MISSILE_SHIP_DATA_MGR
  end_processor

  processor task_mgr MISSILE_SHIP_TASK_MGR
     operating_level ENGAGE 1
     weapon_uplink_path sr_sam_fcr_1 ssm_missile_uplink
  end_processor

  processor 3rd_party_mgr ANNOUNCE_LAUNCH_TACTICS
     on_initialize
        REMOTE_UPDATE_PLATFORM_TYPE = "RED_NAVAL_HELICOPTER";
     end_on_initialize
  end_processor

  processor ssm_task_mgr NAVAL_SSM_TACTICS
     operating_level ENGAGE 1
     on_initialize
        WEAPON_NAME          = "ssm";
     end_on_initialize
  end_processor

  track_manager
     filter FILTER_TACTICS end_filter
  end_track_manager

  mover WSF_SURFACE_MOVER
    maximum_speed  31 kts
  end_mover

  sensor rice_screen RICE_SCREEN
    on
    ignore_same_side
    internal_link data_mgr
  end_sensor

  sensor sr_sam_fcr_1 SR_SAM_FCR_1
    off
    ignore_same_side
    internal_link data_mgr
  end_sensor

  weapon ssm SSM_MISSILE
    location 0 0 -5 m
    quantity      16
    internal_link 3rd_party_mgr
    ignore_launch_platform_velocity true # ignore the movement of the ship
  end_weapon

  zone full_kinematic
     circular
        maximum_altitude 5 km
        maximum_radius   350 km
  end_zone

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, radar_signature, comm, processor, track_manager, mover, maximum_speed, sensor, on, ignore_same_side

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, radar_signature, mover, total_mass, fuel_mass, specific_impulse, thrust, thrust_duration, update_interval, aero, processor, proportional_navigation_gain, 平台类型
- **出处**：`wargame/weapons/aam/aam_type.txt:12-44`
- **片段**：

```text
platform_type AAM_BASE WSF_PLATFORM

  icon AIM-9X

   radar_signature AIR_TARGET_RADAR_SIGNATURE

  mover WSF_GUIDED_MOVER
    total_mass       188.0 lbm
    fuel_mass         61.0 lbm
    specific_impulse 222.0 sec
    thrust          2700.0 lbf
    thrust_duration    5.1 sec
    update_interval 0.10 s
    aero WSF_AERO
  end_mover

  processor aim-9x_autopilot WSF_GUIDANCE_COMPUTER
    proportional_navigation_gain  30.0
    velocity_pursuit_gain         30.0
    g_bias                         1.0
    maximum_commanded_g           40.0 g
    update_interval                0.1 s
  end_processor

  processor aim-9x_seeker WSF_PERFECT_TRACKER
    update_interval 0.10 s
  end_processor

  processor aim-9x_fuse WSF_AIR_TARGET_FUSE
    max_time_of_flight_to_detonate  200.0 sec
  end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, radar_signature, mover, total_mass, fuel_mass, specific_impulse, thrust, thrust_duration, update_interval, aero

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, radar_signature, comm, processor, track_manager, mover, maximum_speed, sensor, on, ignore_same_side, internal_link, off, 平台类型
- **出处**：`ship_ad/platforms/red_missile_destroyer.txt:42-114`
- **片段**：

```text
platform_type RED_MISSILE_DESTROYER WSF_PLATFORM
  icon jiangKai

  radar_signature SHIP_RADAR_SIGNATURE

  comm datalink RED_DATALINK
     network_name <local:master>
     internal_link data_mgr
     internal_link 3rd_party_mgr
  end_comm

  comm RED_SR_SAM_1_uplink WSF_COMM_TRANSCEIVER
  end_comm

  processor data_mgr RED_MISSILE_DESTROYER_DATA_MGR
  end_processor

  processor task_mgr RED_MISSILE_DESTROYER_TASK_MGR
     operating_level ENGAGE 1
     weapon_uplink_path sr_sam_fcr_1 RED_SR_SAM_1_uplink
  end_processor

  processor 3rd_party_mgr ANNOUNCE_LAUNCH_TACTICS
     on_initialize
        REMOTE_UPDATE_PLATFORM_TYPE = "RED_NAVAL_HELICOPTER";
     end_on_initialize
  end_processor

  processor asm_task_mgr NAVAL_ASM_TACTICS
     operating_level ENGAGE 1
     on_initialize
        WEAPON_NAME          = "asm";
     end_on_initialize
  end_processor

  track_manager
     filter FILTER_TACTICS end_filter
  end_track_manager

  mover WSF_SURFACE_MOVER
    maximum_speed  31 kts
  end_mover

  sensor rice_screen RICE_SCREEN # air search
    on
    ignore_same_side
    internal_link data_mgr
  end_sensor

  sensor sr_sam_fcr_1 SR_SAM_FCR_1 # TTR
    off
    ignore_same_side
    internal_link data_mgr
  end_sensor

  weapon sam RED_SR_SAM_1
    location 0 0 -5 m  # estimate
    quantity      8
  end_weapon

  weapon asm RED_ASM_MSL   
    location 0 0 -5 m  # estimate
    quantity      16
    internal_link 3rd_party_mgr
  end_weapon

  zone full_kinematic
     circular
        maximum_altitude 5 km
        maximum_radius   12 km
  end_zone

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, radar_signature, comm, processor, track_manager, mover, maximum_speed, sensor, on, ignore_same_side

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, mover, total_mass, fuel_mass, thrust, thrust_duration, update_interval, aero, comm, processor, proportional_navigation_gain, velocity_pursuit_gain, 平台类型
- **出处**：`launcher/weapons/sam/sam_missile.txt:22-53`　（同签名共 2 处，另见 `ship_ad/weapons/sam/red_sr_sam_1.txt:34`）
- **片段**：

```text
platform_type SAM_MISSILE WSF_PLATFORM
  icon Missile

  mover WSF_GUIDED_MOVER
    #show_status
    total_mass       84.5 kg
    fuel_mass        25.45 kg
    thrust           5200 lbf
    thrust_duration  20.0 sec
    update_interval  0.10 s
    aero             SAM_MISSILE_AERO
  end_mover

  comm uplink WSF_COMM_TRANSCEIVER
     internal_link data_mgr
  end_comm

  processor data_mgr WSF_WEAPON_TRACK_PROCESSOR
  end_processor

  processor computer WSF_GUIDANCE_COMPUTER
    proportional_navigation_gain  6.0
    velocity_pursuit_gain         6.0
    g_bias                        1.2
    maximum_commanded_g           25.0 g
    update_interval               0.1 s
  end_processor

  processor fuse WSF_AIR_TARGET_FUSE
    max_time_of_flight_to_detonate  45.0 sec
  end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, mover, total_mass, fuel_mass, thrust, thrust_duration, update_interval, aero, comm, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, mover, total_mass, fuel_mass, specific_impulse, thrust, thrust_duration, update_interval, aero, processor, proportional_navigation_gain, velocity_pursuit_gain, 平台类型
- **出处**：`base_types/weapons/aam/blue_sr_a2a_ir_missile.txt:50-83`　（同签名共 2 处，另见 `brawler/weapons/aam/blue_sr_a2a_ir_missile.txt:50`）
- **片段**：

```text
platform_type BLUE_SR_A2A_IR_MISSILE_BASE WSF_PLATFORM

  icon AIM-9X

  mover WSF_GUIDED_MOVER
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

  processor blue_sr_a2a_ir_missile_autopilot WSF_GUIDANCE_COMPUTER
    proportional_navigation_gain  30.0
    velocity_pursuit_gain         30.0
    g_bias                         1.0
    maximum_commanded_g           40.0 g
    update_interval                0.1 s
  end_processor

  processor blue_sr_a2a_ir_missile_seeker WSF_PERFECT_TRACKER
    update_interval 0.10 s
  end_processor

  processor blue_sr_a2a_ir_missile_fuse WSF_AIR_TARGET_FUSE
    max_time_of_flight_to_detonate  120.0 sec
  end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, mover, total_mass, fuel_mass, specific_impulse, thrust, thrust_duration, update_interval, aero, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, radar_signature, comm, processor, track_manager, mover, maximum_speed, sensor, off, ignore_same_side, internal_link, weapon, 平台类型
- **出处**：`new_guidance/platforms/missile_ship.txt:31-87`
- **片段**：

```text
platform_type MISSILE_SHIP WSF_PLATFORM
  icon jiangKai

  radar_signature SHIP_RADAR_SIGNATURE

  comm datalink RED_DATALINK
     network_name <local:master>
     internal_link data_mgr
     internal_link 3rd_party_mgr
  end_comm

  comm ssm_missile_uplink WSF_COMM_TRANSCEIVER
  end_comm

  processor data_mgr MISSILE_SHIP_DATA_MGR
  end_processor

  processor task_mgr MISSILE_SHIP_TASK_MGR
     operating_level ENGAGE 1
     weapon_uplink_path sr_sam_fcr_1 ssm_missile_uplink
  end_processor

  processor 3rd_party_mgr ANNOUNCE_LAUNCH_TACTICS
     on_initialize
        REMOTE_UPDATE_PLATFORM_TYPE = "RED_NAVAL_HELICOPTER";
     end_on_initialize
  end_processor

  processor ssm_task_mgr NAVAL_SSM_TACTICS
     operating_level ENGAGE 1
     on_initialize
        WEAPON_NAME          = "ssm";
     end_on_initialize
  end_processor

  track_manager
     filter FILTER_TACTICS end_filter
  end_track_manager

  mover WSF_SURFACE_MOVER
    maximum_speed  31 kts
  end_mover

  sensor sr_sam_fcr_1 SR_SAM_FCR_1
    off
    ignore_same_side
    internal_link data_mgr
  end_sensor

  weapon ssm SSM_MISSILE
    location 0 0 -5 m
    quantity      16
    internal_link 3rd_party_mgr
    ignore_launch_platform_velocity true # ignore the movement of the ship
  end_weapon

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, radar_signature, comm, processor, track_manager, mover, maximum_speed, sensor, off, ignore_same_side

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, infrared_signature, optical_signature, radar_signature, comm, processor, purge_interval, report_to, report_interval, fused_track_reporting, raw_track_reporting, update_interval, 平台类型
- **出处**：`bearing_only/platforms/fuser_platform1.txt:11-150`
- **片段**：

```text
platform_type FUSER_PLATFORM WSF_PLATFORM
  icon comm_truck_icon

  infrared_signature    VEHICLE_INFRARED_SIGNATURE
  optical_signature     VEHICLE_OPTICAL_SIGNATURE
  radar_signature       VEHICLE_RADAR_SIGNATURE

  comm cmdr_net RED_DATALINK
     network_name <local:slave>
     #internal_link data_mgr
     internal_link task_mgr
     internal_link fuser
  end_comm

  comm sub_net RED_DATALINK
     network_name <local:master>
     internal_link fuser
     internal_link task_mgr
  end_comm


  processor task_mgr WSF_TASK_PROCESSOR
  end_processor

  # The following fuser processor uses simple trig to compute range and altitude from bearing only sensors
  # It is not meant to be a total solution but serve as an example only.
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

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, infrared_signature, optical_signature, radar_signature, comm, processor, purge_interval, report_to, report_interval, fused_track_reporting

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, mover, sensor, on, frame_time, pitch, azimuth_field_of_view, elevation_field_of_view, reports_location, hits_to_establish_track, hits_to_maintain_track, transmitter, 平台类型
- **出处**：`satellite_demos/platforms/radar_truck.txt:14-35`
- **片段**：

```text
platform_type RADAR_TRUCK WSF_PLATFORM
  icon Command_Truck
  mover WSF_GROUND_MOVER end_mover
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

  processor dump-radar WSF_MESSAGE_PROCESSOR
  end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, mover, sensor, on, frame_time, pitch, azimuth_field_of_view, elevation_field_of_view, reports_location, hits_to_establish_track

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, radar_signature, comm, track_manager, processor, purge_interval, report_to, mover, maximum_speed, maximum_altitude, maximum_climb_rate, sensor, 平台类型
- **出处**：`new_guidance/platforms/red_naval_helicopter.txt:31-77`　（同签名共 2 处，另见 `ship_ad/platforms/red_naval_helicopter.txt:31`）
- **片段**：

```text
platform_type RED_NAVAL_HELICOPTER WSF_PLATFORM
  icon A-160
  radar_signature VEHICLE_RADAR_SIGNATURE
  comm datalink RED_DATALINK
     network_name <local:slave>
     internal_link data_mgr
     internal_link inflight_update_mgr
  end_comm

  comm uplink_radio RED_DATALINK
  end_comm

  track_manager
     filter FILTER_TACTICS end_filter

     # required for inflight updates to work (as currently employed)
     aux_data
        string weapon_platform = "";
     end_aux_data
  end_track_manager

  processor data_mgr RED_NAVAL_HELICOPTER_DATA_MGR
    purge_interval      60 sec

    report_to commander via datalink
  end_processor

  processor inflight_update_mgr INFLIGHT_UPDATE_TACTICS
     on_initialize
        UPLINK_COMM_NAME = "uplink_radio";
        WEAPON_COMM_NAME = "uplink";
     end_on_initialize
  end_processor

  mover WSF_AIR_MOVER
    maximum_speed         159 kts
    maximum_altitude      14100 ft
    maximum_climb_rate    1614 ft/m
  end_mover

  sensor helicopter_surface_search_radar_1 HELICOPTER_SURFACE_SEARCH_RADAR_1 # surface search
    on
    ignore_same_side
    processor data_mgr
  end_sensor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, radar_signature, comm, track_manager, processor, purge_interval, report_to, mover, maximum_speed, maximum_altitude

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, infrared_signature, optical_signature, radar_signature, comm, include, processor, purge_interval, report_to, report_interval, fused_track_reporting, raw_track_reporting, 平台类型
- **出处**：`aea_iads/platforms/red_radar_company.txt:14-91`
- **片段**：

```text
platform_type RED_RADAR_COMPANY WSF_PLATFORM
  icon TWIN_BOX

  infrared_signature    VEHICLE_INFRARED_SIGNATURE
  optical_signature     VEHICLE_OPTICAL_SIGNATURE
  radar_signature       VEHICLE_RADAR_SIGNATURE

  comm cmdr_net RED_DATALINK
     network_name <local:slave>
     internal_link data_mgr
     internal_link task_mgr
  end_comm

  comm sub_net RED_DATALINK
     network_name <local:master>
     internal_link data_mgr
     internal_link task_mgr
  end_comm

  include processors/commander_track_manager$(TRACKER_TYPE).txt

  processor data_mgr WSF_TRACK_PROCESSOR
    purge_interval       60 sec

    report_to commander via cmdr_net to sub_net

    report_interval      20 sec

    fused_track_reporting on
    raw_track_reporting   off
  end_processor

  processor task_mgr WSF_TASK_PROCESSOR
  end_processor
/*
   # ---------------------------------------------
   # Draw track to false targets and real targets
   # ---------------------------------------------
   script_variables
      # Create a WsfDraw object.
      WsfDraw draw = WsfDraw();
   end_script_variables

   execute at_interval_of 1.0 s
      foreach (WsfTrack track in MasterTrackList())
      {
         if (track.IsValid())
         {
            # use the track ID as a unique draw ID
            # a track icon and a line to the track icon
            # is drawn at each track update
            string trackId = track.TrackId().ToString();
            draw.SetId(trackId);
            draw.SetDuration(1.0); # this is faster than calling erase every time

            if (track.IsFalseTarget())
            {
               draw.SetColor(0,1,0);
            }
            else
            {
               draw.SetColor(0,0,1);
            }
            draw.BeginIcons(track.Heading(), "Wedge");
            draw.Vertex(track.ReportedLocation());
            draw.End();

            # Draw a line to the track
            draw.SetLineStyle("dashed");
            draw.BeginLines();
            draw.Vertex(PLATFORM);
            draw.Vertex(track.ReportedLocation());
            draw.End();
         }
      }
   end_execute
*/
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, infrared_signature, optical_signature, radar_signature, comm, include, processor, purge_interval, report_to, report_interval

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, side, mover, optical_signature, radar_signature, comm, processor, sensor, number_of_servers, track_update_interval, script_variables, script, 平台类型
- **出处**：`shooter/platforms/awacs.txt:22-171`
- **片段**：

```text
platform_type AWACS WSF_PLATFORM

   icon AWACS
   side blue

   mover WSF_AIR_MOVER
      default_linear_acceleration   1.0 g
      default_radial_acceleration   1.0 g
   end_mover

   optical_signature awacs_optical_signature
   radar_signature   awacs_radar_signature

   comm  cmd_net WSF_COMM_TRANSCEIVER
      network_name <local:master>
      internal_link data_mgr
      internal_link CMDR_TASK_MGR
   end_comm

   processor data_mgr WSF_TRACK_PROCESSOR
   end_processor

   sensor geo_sensor WSF_GEOMETRIC_SENSOR
      azimuth_field_of_view -180.0 degrees 180.0 degrees
      elevation_field_of_view -90.0 degrees 90.0 degrees
      minimum_range 0 m
      # 260 nm
      maximum_range 481520 m
      on
      frame_time              0.5 sec
      reports_location
      reports_velocity
      reports_iff
      reports_bearing
      #do not report weapons quality tracks
      track_quality 0.75
      ignore_same_side
      internal_link data_mgr
   end_sensor

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

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, mover, optical_signature, radar_signature, comm, processor, sensor, number_of_servers, track_update_interval

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, infrared_signature, optical_signature, radar_signature, comm, processor, purge_interval, report_to, report_interval, fused_track_reporting, raw_track_reporting, script_variables, 平台类型
- **出处**：`electronic_warfare/test_false_targets/platforms/red_radar_company.txt:14-89`
- **片段**：

```text
platform_type RED_RADAR_COMPANY WSF_PLATFORM
  icon TWIN_BOX

  infrared_signature    VEHICLE_INFRARED_SIGNATURE
  optical_signature     VEHICLE_OPTICAL_SIGNATURE
  radar_signature       VEHICLE_RADAR_SIGNATURE

  comm cmdr_net RED_DATALINK
     network_name <local:slave>
     internal_link data_mgr
     internal_link task_mgr
  end_comm

  comm sub_net RED_DATALINK
     network_name <local:master>
     internal_link data_mgr
     internal_link task_mgr
  end_comm

  processor data_mgr WSF_TRACK_PROCESSOR
    purge_interval       60 sec

    report_to commander via cmdr_net

    report_interval      20 sec

    fused_track_reporting on
    raw_track_reporting   off
  end_processor

  processor task_mgr WSF_TASK_PROCESSOR
  end_processor

   script_variables
      # Create a WsfDraw object.
      WsfDraw draw = WsfDraw();
   end_script_variables

   execute at_interval_of 10.0 s

      foreach (WsfTrack track in MasterTrackList())
      {
         if (track.IsValid())
         {
           if (track.IsFalseTarget())
           {
              # use the track ID as a unique draw ID
              # a track icon and a line to the track icon
              # is drawn at each track update
              string trackId = track.TrackId().ToString();
              draw.SetId(trackId);
              draw.SetDuration(10.0); # this is faster than calling erase every time

              # Draw a track icon
              draw.SetColor(0,1,0);
              draw.SetPointSize(0.25);
              draw.SetLineSize(0.25);
              draw.BeginIcons(track.Heading(), "Wedge");
                 draw.Vertex(track.CurrentLocation());
              draw.End();

              //draw.SetLineStyle("solid");
              //draw.SetLineSize(3);

              # Draw a line to the track
              //draw.BeginLines();
              //   draw.Vertex(PLATFORM);
              //   draw.Vertex(track.CurrentLocation());
              //draw.End();
           }
         }
      }
   end_execute


end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, infrared_signature, optical_signature, radar_signature, comm, processor, purge_interval, report_to, report_interval, fused_track_reporting

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, comm, processor, sensor, on, ignore, purge_interval, script_variables, script, evaluation_interval, time_to_evaluate, state, 平台类型
- **出处**：`suppressor/platforms/sam_regiment.txt:35-147`
- **片段**：

```text
platform_type sam_regiment WSF_PLATFORM
  icon Command_Truck

  comm red-net COMM_RADIO
    processor thinker
    processor track_processor
  end_comm

  sensor sam_radar SAM_RADAR
    on
    processor track_processor
    ignore ignored-by-iads-radar
  end_sensor

  processor track_processor WSF_TRACK_PROCESSOR
    purge_interval 1 min
  end_processor

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

  category ignored-by-iads-radar
  category ignored-by-bomber-radar
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, comm, processor, sensor, on, ignore, purge_interval, script_variables, script, evaluation_interval

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, mover, optical_signature, radar_signature, comm, processor, sensor, number_of_servers, track_update_interval, script_variables, script, evaluation_interval, 平台类型
- **出处**：`laser_designator/platforms/soldier_jtac.txt:12-217`
- **片段**：

```text
platform_type SOLDIER_JTAC WSF_PLATFORM
   icon infantry
   mover WSF_GROUND_MOVER end_mover
   optical_signature soldier_optical_signature
   radar_signature   soldier_radar_signature
   
   comm  cmd_net WSF_COMM_TRANSCEIVER
      transfer_rate 100 mbits/sec
      network_name <local:master>
      internal_link data_mgr
      internal_link CMDR_TASK_MGR
      location 0 0 -4 ft
   end_comm

   processor data_mgr WSF_TRACK_PROCESSOR
      purge_interval 20 sec
   end_processor 
 
#   sensor geo_sensor GEO_SENSOR 
#      internal_link data_mgr
#   end_sensor  # represents eyeball
   
   sensor laser_designator-1212 LASER_DESIGNATOR-1212 
      off  # The logic will turn it on
      location 0 0 -6 ft  # eye level
   end_sensor
   
   processor CMDR_TASK_MGR WSF_TASK_PROCESSOR
   number_of_servers            5
   track_update_interval        1.0 sec

   #show_state_transitions
   #show_task_messages
   
   script_variables
      int MAX_SUBS_PER_TARGET     = 1;
      int MAX_ASSIGNMENTS_PER_SUB = 1;
      string WEAPON_NAME          = "hellfire";
      string AIRCRAFT_TYPE        = "UAV";
      string DESIGNATOR           = "laser_designator-1212";
      string TARGET_TYPE          = "APC";
      string TARGET_NAME          = "";
      bool   NOW_DESIGNATING      = false;
      bool   MADE_ASSIGNMENT      = false;
      bool   DRAW_DESIGNATE_BEAM  = false; # crutch because mystic doesn't show laser beam
   end_script_variables

   // determine if TRACK is assignable  
   script bool IsAssignable()
      if ((! TRACK.IFF_Friend()) && 
          (TRACK.TimeSinceUpdated() < 5.0) &&
          (MADE_ASSIGNMENT == false) &&
          (NOW_DESIGNATING == false))
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

         if (quantity > 0) 
         {
            weaponsAvailable = true;

         }
      }

      return weaponsAvailable;
   end_script

   script void MakeInitialLasingCue()
      if ((TasksAssignedFor(TRACK.TrackId()) >= 0) &&
          (NOW_DESIGNATING == 0) && TRACK.TargetType() == TARGET_TYPE)
      {
         WsfSensor designator = PLATFORM.Sensor(DESIGNATOR); 
         designator.TurnOn();
         designator.CueToPoint(designator.ApparentLocationOf(TRACK.CurrentLocation(), 1.333333));     
         #designator.CueToTrack(TRACK);
         TARGET_NAME          = TRACK.TargetName();
         NOW_DESIGNATING      = true;
         if(DRAW_DESIGNATE_BEAM == true)
         {
            #WsfGeoPoint TargetLLA = TRACK.Location();
            WsfDraw DesBeam = WsfDraw();
            DesBeam.SetLineStyle("solid");
            DesBeam.SetLineSize(5);
            DesBeam.SetDuration(5.0);
            DesBeam.BeginLines();
            DesBeam.Vertex(PLATFORM);
            DesBeam.Vertex(TRACK.CurrentLocation());
            DesBeam.End();
         }
      }
   end_script

   script void KeepCueingDesignator()
      #writeln("Keep Cueing Track name is ", TRACK.TargetType());
      if ((TRACK.TargetType() == TARGET_TYPE) &&
          (NOW_DESIGNATING == true) && 
          (TRACK.TargetName() == TARGET_NAME))
      {
         WsfSensor designator = PLATFORM.Sensor(DESIGNATOR);
         designator.CueToPoint(designator.ApparentLocationOf(TRACK.CurrentLocation(), 1.333333));      
         if(DRAW_DESIGNATE_BEAM == true)
         {
            #WsfGeoPoint TargetLLA = TRACK.Location();
            WsfDraw DesBeam = WsfDraw();
            DesBeam.SetLineStyle("solid");
            DesBeam.SetLineSize(5);
            DesBeam.SetDuration(5.0);
            DesBeam.BeginLines();
            DesBeam.Vertex(PLATFORM);
            DesBeam.Vertex(TRACK.CurrentLocation());
            DesBeam.End();
         }
         
      }
   end_script
   
   script bool MakeAssignments()
      bool MadeAssignment = false;
      Array<WsfPlatform> filter = Array<WsfPlatform>();
      foreach (WsfPlatform sub in PLATFORM.Subordinates())
      {
         if ((sub.Type() == AIRCRAFT_TYPE) && (TRACK.TargetType() == TARGET_TYPE))
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
         MADE_ASSIGNMENT      = true;
         MadeAssignment = true;
      }
      return MadeAssignment;
   end_script

# -------------------------------------------------------------------------

   evaluation_interval DETECTED 2.0 sec
   state DETECTED
      next_state ASSIGNED
         if (! IsAssignable()) return false;
         if (!MakeAssignments()) return false;
         MakeInitialLasingCue();
         return true;
      end_next_state
   end_state

          
   evaluation_interval ASSIGNED 5.0 sec
   state ASSIGNED
      next_state DETECTED
         if (TRACK.TimeSinceUpdated() >  6.0) # lost sight of target         
         {
            CancelTask(TRACK.TrackId());
            MADE_ASSIGNMENT      = false;
            TARGET_NAME          = "";
            NOW_DESIGNATING      = false;
            WsfSensor designator = PLATFORM.Sensor(DESIGNATOR);
            designator.TurnOff();
            return true;
         }
         KeepCueingDesignator();         
         return false;
      end_next_state
   end_state

end_processor
   
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, mover, optical_signature, radar_signature, comm, processor, sensor, number_of_servers, track_update_interval, script_variables

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, infrared_signature, optical_signature, radar_signature, comm, processor, purge_interval, report_to, report_interval, fused_track_reporting, raw_track_reporting, unchanged_track_reporting, 平台类型
- **出处**：`iads_c2_demos/platforms/radar_company.txt:14-47`
- **片段**：

```text
platform_type RADAR_COMPANY WSF_PLATFORM
  icon TWIN_BOX

  infrared_signature    VEHICLE_INFRARED_SIGNATURE
  optical_signature     VEHICLE_OPTICAL_SIGNATURE
  radar_signature       VEHICLE_RADAR_SIGNATURE

  comm cmdr_net RED_DATALINK
     network_name <local:slave>
     internal_link data_mgr
     internal_link dissemination
  end_comm

  comm sub_net RED_DATALINK
     network_name <local:master>
     internal_link data_mgr
     internal_link dissemination
  end_comm

  processor data_mgr WSF_TRACK_PROCESSOR
    purge_interval       60 sec
    report_to commander via cmdr_net to sub_net
    report_interval      20 sec
    fused_track_reporting on
    raw_track_reporting   off
    unchanged_track_reporting disable
  end_processor

  processor asset_manager ASV_AM
  end_processor

  processor dissemination DC2
  end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, infrared_signature, optical_signature, radar_signature, comm, processor, purge_interval, report_to, report_interval, fused_track_reporting

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, spatial_domain, mover, include, p6dof_ned_heading, p6dof_ned_pitch, p6dof_ned_roll, p6dof_set_velocity_ned_fps, p6dof_position, p6dof_alt, edit, on_initialize, 平台类型
- **出处**：`p6dof/flight_envelope.txt:103-136`
- **片段**：

```text
platform_type TEST_PLATFORM_TYPE WSF_PLATFORM
   icon  fighter 
   spatial_domain  air
   
   mover WSF_P6DOF_MOVER
      p6dof_object_type $<MOVER_TYPE:FA-LGT>$
   end_mover

   include p6dof_types/scripts/p6dof_all_scripts.txt

   # This is important for CanFly() to return correct information
   p6dof_ned_heading 0 deg
   p6dof_ned_pitch 0 deg
   p6dof_ned_roll 0 deg
   p6dof_set_velocity_ned_fps 100 0 0
   p6dof_position 0 0
   p6dof_alt 1000 ft

   edit mover
      engines_on true
   end_mover

   on_initialize
      EnableControls(PLATFORM, false);
      SetMasterNoLagTesting(PLATFORM, true);
      SetMasterFreezeAltitude(PLATFORM, false);
      SetMasterFreezePitch(PLATFORM, true);
      SetMasterFreezeRoll(PLATFORM, true);
      SetMasterFreezeYaw(PLATFORM, true);
      SetMasterFreezeFuelBurn(PLATFORM, false);
      SetMasterNoAlphaTesting(PLATFORM, true);
   end_on_initialize

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, spatial_domain, mover, include, p6dof_ned_heading, p6dof_ned_pitch, p6dof_ned_roll, p6dof_set_velocity_ned_fps, p6dof_position, p6dof_alt

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, category, infrared_signature, optical_signature, radar_signature, comm, processor, purge_interval, report_to, report_interval, fused_track_reporting, raw_track_reporting, 平台类型
- **出处**：`orwaca_iads/platforms/radar_company.txt:14-48`　（同签名共 2 处，另见 `cyber/exfiltrate_demo/platforms/red_radar_company.txt:14`）
- **片段**：

```text
platform_type RADAR_COMPANY WSF_PLATFORM
  icon comm_truck_icon
  category Radar

  infrared_signature    VEHICLE_INFRARED_SIGNATURE
  optical_signature     VEHICLE_OPTICAL_SIGNATURE
  radar_signature       VEHICLE_RADAR_SIGNATURE

  comm cmdr_net RED_DATALINK
     network_name <local:slave>
     internal_link data_mgr
     internal_link task_mgr
  end_comm

  comm sub_net RED_DATALINK
     network_name <local:master>
     internal_link data_mgr
     internal_link task_mgr
  end_comm

  processor data_mgr WSF_TRACK_PROCESSOR
    purge_interval       60 sec

    report_to commander via cmdr_net to sub_net

    report_interval      20 sec

    fused_track_reporting on
    raw_track_reporting   off
  end_processor

  processor task_mgr WSF_TASK_PROCESSOR
  end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, category, infrared_signature, optical_signature, radar_signature, comm, processor, purge_interval, report_to, report_interval

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, radar_signature, mover, default_dive_rate, default_radial_acceleration, maximum_speed, comm, processor, sensor, off, ignore_same_side, max_time_of_flight_to_detonate, 平台类型
- **出处**：`ship_ad/weapons/agm/red_asm_msl.txt:28-65`
- **片段**：

```text
platform_type RED_ASM_MSL WSF_PLATFORM
  icon HARPOON
  radar_signature VEHICLE_RADAR_SIGNATURE
  mover WSF_AIR_MOVER
    #show_status
    default_dive_rate            27 m/s   # assume 5 degree dive
    default_radial_acceleration  2.0 g    # assume 2 g
    maximum_speed                306 m/s  # Ref 2 M0.9 @ sea level
  end_mover

  comm uplink WSF_COMM_TRANSCEIVER
     internal_link data_mgr
  end_comm

  processor data_mgr WSF_TRACK_PROCESSOR
     purge_interval   400 sec
  end_processor

  processor task_mgr ASM_TACTICS
     on_initialize
        CRUISE_ALT          = 25;     # Ref 2
        SENSOR_NAME         = "seeker";
        SENSOR_TRACK_MODE   = "default";
        SEEKER_ACTIVATION   = 11000;  # Ref 4 (using SS-N-2 Styx as surrogate)
        TERMINAL_ALT        = 6;      # Ref 2
     end_on_initialize
  end_processor

  sensor seeker RED_MISSILE_SEEKER_1    # using as surrogate
    off
    ignore_same_side
    processor data_mgr
  end_sensor

  processor fuse WSF_GROUND_TARGET_FUSE
    max_time_of_flight_to_detonate  392.0 sec            # 120 km @ M0.9
  end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, radar_signature, mover, default_dive_rate, default_radial_acceleration, maximum_speed, comm, processor, sensor, off

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, mover, stage, comm, processor, guide_to_truth, proportional_navigation_gain, velocity_pursuit_gain, g_bias, maximum_commanded_g, update_interval, max_time_of_flight_to_detonate, 平台类型
- **出处**：`ship_ad/weapons/sam/red_sr_sam_2.txt:38-85`
- **片段**：

```text
platform_type RED_SR_SAM_2 WSF_PLATFORM
  icon SA-11_Missile

  # Ref 2 lists max speed as 1.23 km/s; assume 15% longer burn time then RED_SR_NAVAL_SAM_1
  # Tuned stage 1 and stage 2 against 30kft target
  mover WSF_GUIDED_MOVER
    stage 1
       empty_mass        0.01 kg
       fuel_mass         265 kg
       thrust_duration   2.9 sec       # assuming 25% of total burn time
       specific_impulse  250 sec       # typical solid propellant
       aero              RED_SR_SAM_2_AERO
    end_stage

    stage 2
       total_mass        455 kg        # Ref 2 lists total missile mass of 720 kg
       fuel_mass         80 kg
       thrust_duration   9.8 sec
       specific_impulse  250 sec
       aero              RED_SR_SAM_2_AERO
    end_stage
  end_mover

  comm uplink WSF_COMM_TRANSCEIVER
     internal_link data_mgr
  end_comm

  processor data_mgr WSF_WEAPON_TRACK_PROCESSOR
  end_processor

  processor seeker WSF_PERFECT_TRACKER
     update_interval 1.0 sec
     internal_link data_mgr
  end_processor

  processor computer WSF_GUIDANCE_COMPUTER
    guide_to_truth                true
    proportional_navigation_gain  2.0
    velocity_pursuit_gain         1.0
    g_bias                        1.0
    maximum_commanded_g           23.0 g       # Ref 1
    update_interval               0.1 s
  end_processor

  processor fuse WSF_AIR_TARGET_FUSE
    max_time_of_flight_to_detonate  60.0 sec            # Ref 2 - max range of 40 km
  end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, mover, stage, comm, processor, guide_to_truth, proportional_navigation_gain, velocity_pursuit_gain, g_bias, maximum_commanded_g

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, category, infrared_signature, optical_signature, radar_signature, track_manager, comm, zone, processor, script_variables, execute, foreach, 平台类型
- **出处**：`electronic_warfare/test_false_targets/platforms/large_sam_battalion.txt:85-165`
- **片段**：

```text
platform_type LARGE_SAM_BATTALION WSF_PLATFORM
   icon TWIN_BOX
   category ENGAGEMENT

   infrared_signature    VEHICLE_INFRARED_SIGNATURE
   optical_signature     VEHICLE_OPTICAL_SIGNATURE
   radar_signature       VEHICLE_RADAR_SIGNATURE

   track_manager
      filter FILTER_TACTICS end_filter
   end_track_manager

   comm cmdr_net RED_DATALINK
      network_name <local:slave>
      internal_link data_mgr
      internal_link task_mgr
   end_comm

   comm sub_net RED_DATALINK
      network_name <local:master>
      internal_link data_mgr
      internal_link task_mgr
   end_comm

   zone full_kinematic
      circular
         maximum_altitude 30 km
         maximum_radius   25 nm
   end_zone

   processor data_mgr WSF_TRACK_PROCESSOR
      purge_interval 60 seconds
   end_processor

   processor task_mgr LARGE_SAM_BATTALION_TASK_MGR
   end_processor

   script_variables
      # Create a WsfDraw object.
      WsfDraw draw = WsfDraw();
   end_script_variables

   execute at_interval_of 10.0 s

   foreach (WsfTrack track in MasterTrackList())
   {
      if (track.IsValid())
      {
        if (track.IsFalseTarget())
        {
           //writeln("BATT ", track.TargetName(), "  ", track.Latitude(), "  ", track.Longitude()
           //        , "  ", track.Altitude());
           # use the track ID as a unique draw ID
           # a track icon and a line to the track icon
           # is drawn at each track update
           string trackId = track.TrackId().ToString();
           draw.SetId(trackId);
           draw.SetDuration(10.0); # this is faster than calling erase every time

           # Draw a track icon
           draw.SetColor(0,0,1);
           draw.SetPointSize(0.25);
           draw.SetLineSize(0.25);
           draw.BeginIcons(track.Heading(), "Wedge");
              draw.Vertex(track.CurrentLocation());
           draw.End();

           //draw.SetLineStyle("solid");
           //draw.SetLineSize(3);

           # Draw a line to the track
           //draw.BeginLines();
           //   draw.Vertex(PLATFORM);
           //   draw.Vertex(track.CurrentLocation());
           //draw.End();
        }
      }
   }
   end_execute

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, category, infrared_signature, optical_signature, radar_signature, track_manager, comm, zone, processor, script_variables

### platform_type（six_dof_aam_launch_test）｜平台类型

- **关键词**：platform_type, spatial_domain, icon, edit, update_interval, six_dof_ned_heading, six_dof_position, six_dof_set_velocity_ned_fps, include, enable_controls, on_initialize2, on_update, else, 平台类型
- **出处**：`six_dof/six_dof_aam_launch_test.txt:70-174`
- **片段**：

```text
platform_type AAM_TEST_PLATFORM $<MOVER_TYPE:AAM-MR_RB6>$
   spatial_domain  air
   icon            aim120c

   edit mover 
      # Include SixDOF event pipe data
      event_core_data               30 Hz
      event_kinematic_data          30 Hz  
   end_mover
   update_interval 0.01 sec

   six_dof_ned_heading 0 deg
   six_dof_position 21.4  -158.0
   six_dof_set_velocity_ned_fps  0 0 0

   include scripts/six_dof_all_scripts.txt

   enable_controls false

   on_initialize2
      SetMasterNoLagTesting(PLATFORM, true);
      SetMasterFreezeAltitude(PLATFORM, true);
      SetMasterFreezeVerticalSpeed(PLATFORM, true);
      SetMasterFreezePitch(PLATFORM, true);
      SetMasterFreezeRoll(PLATFORM, true);
      SetMasterFreezeYaw(PLATFORM, true);
      SetMasterFreezeFuelBurn(PLATFORM, false);
   end_on_initialize2

   on_update

   if(!completed)
   {
      //First check to see if termination conditions were reached.
      maxRange_km = GetRangeSinceStart_km(PLATFORM);
      flightTime_s = TIME_NOW;

      double speed_mps = PLATFORM.VelocityNED().X();
      if(speed_mps > maxSpeed_mps)
      {
         maxSpeed_mps = speed_mps;
         maxSpeedTime_s = TIME_NOW;
      }

      if(speed_mps > ACTIVATION_SPEED_MPS && TIME_NOW > ACTIVATION_TIME_SEC )
      {
         activated = true;
      }

      // NOTE: This does not work for solid rocket engines, since
      // GetTotalFuelRemaining_lbs only returns fuel in tanks.
      if(GetTotalFuelRemaining_lbs(PLATFORM) <= 0.0)
      {
         if(outOfFuelTime_s != 0.0)
         {
            outOfFuelTime_s = TIME_NOW;
         }
      }

      double currentMaxGAvail = 0;
      WsfSixDOF_Mover mover = (WsfSixDOF_Mover)PLATFORM.Mover();
      if(mover.IsValid())
      {
         currentMaxGAvail = mover.MaxPotentialManeuverGLoad();
      }

      if(currentMaxGAvail > maxGAvail)
      {
         maxGAvail       = currentMaxGAvail;
         maxGAvailTime_s = TIME_NOW;
      }

      if(activated && maxRange_km >= OUTPUT_DISTANCE_KM)
      {
         writeln(" ");
         writeln("TIME=",TIME_NOW," RANGE=", maxRange_km, "km (", maxRange_km*1000.0*MATH.NM_PER_M(), " nm)");
         writeln("  Speed   =", speed_mps, " m/sec (", speed_mps*MATH.NMPH_PER_MPS(), " KTAS)");
         writeln("  Avail-G =", currentMaxGAvail);
         OUTPUT_DISTANCE_KM += DELTA_OUTPUT_DISTANCE_KM;
      }

      if(activated && speed_mps < TERMINATE_DUE_TO_MIN_SPEED_MPS)
      {
         completed = true;
         terminationReason = "minimum speed";
      }

      if(activated && currentMaxGAvail < TERMINATE_DUE_TO_MIN_G_AVAIL)
      {
         completed = true;
         terminationReason = "minimum g-available";
      }

      // Command the platform to fly level
      // Note: This function does not require a tuned model
      FlyStraightLevelFullThrottle(PLATFORM);
   }
   else
   {
      //Test is complete, terminate test
      WsfSimulation.Terminate();
   }
   end_on_update

end_platform_type
```

- **演示要点**：演示 platform_type 的参数：spatial_domain, icon, edit, update_interval, six_dof_ned_heading, six_dof_position, six_dof_set_velocity_ned_fps, include, enable_controls, on_initialize2

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, spatial_domain, icon, mover, update_interval, p6dof_ned_heading, p6dof_position, p6dof_set_velocity_ned_fps, include, enable_controls, on_initialize2, on_update, else, 平台类型
- **出处**：`p6dof/aam_launch_test.txt:69-183`
- **片段**：

```text
platform_type AAM_TEST_PLATFORM WSF_PLATFORM
   spatial_domain  air
   icon            aim120b

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
   update_interval 0.01 sec

   p6dof_ned_heading 0 deg
   p6dof_position 21.4  -158.0
   p6dof_set_velocity_ned_fps  0 0 0

   include p6dof_types/scripts/p6dof_all_scripts.txt

   enable_controls false

   on_initialize2
      SetMasterNoLagTesting(PLATFORM, true);
      SetMasterFreezeAltitude(PLATFORM, true);
      SetMasterFreezeVerticalSpeed(PLATFORM, true);
      SetMasterFreezePitch(PLATFORM, true);
      SetMasterFreezeRoll(PLATFORM, true);
      SetMasterFreezeYaw(PLATFORM, true);
      SetMasterFreezeFuelBurn(PLATFORM, false);
   end_on_initialize2

   on_update

   if(!completed)
   {
      //First check to see if termination conditions were reached.
      maxRange_km = GetRangeSinceStart_km(PLATFORM);
      flightTime_s = TIME_NOW;

      double speed_mps = PLATFORM.VelocityNED().X();
      if(speed_mps > maxSpeed_mps)
      {
         maxSpeed_mps = speed_mps;
         maxSpeedTime_s = TIME_NOW;
      }

      if(speed_mps > ACTIVATION_SPEED_MPS && TIME_NOW > ACTIVATION_TIME_SEC )
      {
         activated = true;
      }

      // NOTE: This does not work for solid rocket engines, since
      // GetTotalFuelRemaining_lbs only returns fuel in tanks.
      if(GetTotalFuelRemaining_lbs(PLATFORM) <= 0.0)
      {
         if(outOfFuelTime_s != 0.0)
         {
            outOfFuelTime_s = TIME_NOW;
         }
      }

      double currentMaxGAvail = 0;
      WsfMover mover = PLATFORM.Mover();
      if(mover.IsA_TypeOf("WSF_P6DOF_MOVER"))
      {
         WsfP6DOF_Mover p6dofMover = (WsfP6DOF_Mover)mover;
         currentMaxGAvail = p6dofMover.MaxPotentialManeuverGLoad();
      }

      if(currentMaxGAvail > maxGAvail)
      {
         maxGAvail       = currentMaxGAvail;
         maxGAvailTime_s = TIME_NOW;
      }

      if(activated && maxRange_km >= OUTPUT_DISTANCE_KM)
      {
         writeln(" ");
         writeln("TIME=",TIME_NOW," RANGE=", maxRange_km, "km (", maxRange_km*1000.0*MATH.NM_PER_M(), " nm)");
         writeln("  Speed   =", speed_mps, " m/sec (", speed_mps*MATH.NMPH_PER_MPS(), " KTAS)");
         writeln("  Avail-G =", currentMaxGAvail);
         OUTPUT_DISTANCE_KM += DELTA_OUTPUT_DISTANCE_KM;
      }

      if(activated && speed_mps < TERMINATE_DUE_TO_MIN_SPEED_MPS)
      {
         completed = true;
         terminationReason = "minimum speed";
      }

      if(activated && currentMaxGAvail < TERMINATE_DUE_TO_MIN_G_AVAIL)
      {
         completed = true;
         terminationReason = "minimum g-available";
      }

      // Command the platform to fly level
      // Note: This function does not require a tuned model
      FlyStraightLevelFullThrottle(PLATFORM);
   }
   else
   {
      //Test is complete, terminate test
      WsfSimulation.Terminate();
   }
   end_on_update

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：spatial_domain, icon, mover, update_interval, p6dof_ned_heading, p6dof_position, p6dof_set_velocity_ned_fps, include, enable_controls, on_initialize2

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, infrared_signature, optical_signature, radar_signature, comm, processor, purge_interval, report_to, report_interval, fused_track_reporting, raw_track_reporting, 平台类型
- **出处**：`iads/platforms/red_radar_company.txt:14-47`
- **片段**：

```text
platform_type RED_RADAR_COMPANY WSF_PLATFORM
  icon TWIN_BOX

  infrared_signature    VEHICLE_INFRARED_SIGNATURE
  optical_signature     VEHICLE_OPTICAL_SIGNATURE
  radar_signature       VEHICLE_RADAR_SIGNATURE

  comm cmdr_net RED_DATALINK
     network_name <local:slave>
     internal_link data_mgr
     internal_link task_mgr
  end_comm

  comm sub_net RED_DATALINK
     network_name <local:master>
     internal_link data_mgr
     internal_link task_mgr
  end_comm

  processor data_mgr WSF_TRACK_PROCESSOR
    purge_interval       60 sec

    report_to commander via cmdr_net to sub_net

    report_interval      20 sec

    fused_track_reporting on
    raw_track_reporting   off
  end_processor

  processor task_mgr WSF_TASK_PROCESSOR
  end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, infrared_signature, optical_signature, radar_signature, comm, processor, purge_interval, report_to, report_interval, fused_track_reporting

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, mover, stage, comm, processor, proportional_navigation_gain, velocity_pursuit_gain, g_bias, maximum_commanded_g, update_interval, max_time_of_flight_to_detonate, 平台类型
- **出处**：`ship_ad/weapons/sam/red_sr_naval_sam_1.txt:35-76`
- **片段**：

```text
platform_type RED_SR_NAVAL_SAM_1 WSF_PLATFORM
  icon SA-11_Missile

  # Ref 2 lists motor burn time of 11 sec reaching speed of M3.0
  # Tuned stage 1 and stage 2 against 30kft target
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

  comm uplink WSF_COMM_TRANSCEIVER
     internal_link data_mgr
  end_comm

  processor data_mgr WSF_WEAPON_TRACK_PROCESSOR
  end_processor

  processor computer WSF_GUIDANCE_COMPUTER
    proportional_navigation_gain  6.0
    velocity_pursuit_gain         6.0
    g_bias                        1.0
    maximum_commanded_g           23.0 g       # Ref 1
    update_interval               0.1 s
  end_processor

  processor fuse WSF_AIR_TARGET_FUSE
    max_time_of_flight_to_detonate  45.0 sec            # Ref 2 - max range of 30 km
  end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, mover, stage, comm, processor, proportional_navigation_gain, velocity_pursuit_gain, g_bias, maximum_commanded_g, update_interval

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, category, infrared_signature, optical_signature, radar_signature, track_manager, comm, zone, sensor, weapon, processor, 平台类型
- **出处**：`alternate_locations/platforms/single_large_sam.txt:16-65`　（同签名共 3 处，另见 `cyber/platforms/sr_sam_telar.txt:40`、`orwaca_iads/platforms/sr_sam_telar.txt:40`）
- **片段**：

```text
platform_type SINGLE_LARGE_SAM WSF_PLATFORM
   icon TWIN_BOX
   category ENGAGEMENT

   infrared_signature    VEHICLE_INFRARED_SIGNATURE
   optical_signature     VEHICLE_OPTICAL_SIGNATURE
   radar_signature       VEHICLE_RADAR_SIGNATURE

   track_manager
      filter FILTER_TACTICS end_filter
   end_track_manager

   comm cmdr_net RED_DATALINK
      network_name <local:slave>
      internal_link data_mgr
      internal_link task_mgr
   end_comm

   comm sub_net RED_DATALINK
      network_name <local:master>
      internal_link data_mgr
      internal_link task_mgr
   end_comm

   zone full_kinematic
      circular
         maximum_altitude 30 km
         maximum_radius   25 nm
   end_zone
   
   sensor acq ACQ_RADAR
      on
      internal_link data_mgr
   end_sensor
   
   sensor ttr TTR_RADAR
   end_sensor
   
   weapon sam LARGE_SAM
      quantity 16
   end_weapon

   processor data_mgr WSF_TRACK_PROCESSOR
      purge_interval 60 seconds
   end_processor

   processor task_mgr WSF_TASK_PROCESSOR
   end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, category, infrared_signature, optical_signature, radar_signature, track_manager, comm, zone, sensor, weapon

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, infrared_signature, optical_signature, radar_signature, processor, sensor, weapon, quantity, mover, default_radial_acceleration, at_end_of_path, 平台类型
- **出处**：`iads/platforms/ucav.txt:21-89`　（同签名共 2 处，另见 `electronic_warfare/test_multi_beam/platforms/ucav.txt:21`）
- **片段**：

```text
platform_type UCAV WSF_PLATFORM
  icon UCAV

  infrared_signature UCAV_INFRARED_SIG
  optical_signature  UCAV_OPTICAL_SIG
  radar_signature    UCAV_RADAR_SIG

  processor image_proc WSF_IMAGE_PROCESSOR
     #debug
  end_processor

  sensor esm UCAV_ESM
     on
     internal_link data_mgr
     ignore_same_side
  end_sensor

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

   sensor sar_right SAR_RADAR
      off
      yaw        60 deg
      pitch     -10 deg
      aux_data
         double min_frequency_band_hz = 8e9
         double max_frequency_band_hz = 12e9
         double pref_az_aspect1_deg   = 50
         double pref_az_aspect2_deg   = 85
      end_aux_data
      internal_link image_proc
      ignore_same_side
   end_sensor

  weapon blue_gps_bomb_2 BLUE_GPS_BOMB_2
    quantity 1
  end_weapon

  weapon blue_gps_bomb_1 BLUE_GPS_BOMB_1
    quantity 2
  end_weapon

  weapon blue_glide_bomb_1 BLUE_GLIDE_BOMB_1
    quantity 6
  end_weapon

  mover WSF_AIR_MOVER
    default_radial_acceleration 1.5 g
    at_end_of_path remove
  end_mover

  processor data_mgr WSF_TRACK_PROCESSOR
     purge_interval   60.0 sec
  end_processor

  processor task_mgr WSF_TASK_PROCESSOR
  end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, infrared_signature, optical_signature, radar_signature, processor, sensor, weapon, quantity, mover, default_radial_acceleration

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, radar_signature, infrared_signature, optical_signature, spatial_domain, side, icon, category, mover, weapon_effects, sensor, processor, 平台类型
- **出处**：`p6dof/platforms/agm-sr.txt:27-99`
- **片段**：

```text
platform_type  AGM-SR  WSF_PLATFORM

   radar_signature       SIMPLE_FIGHTER_RCS
   infrared_signature    SIMPLE_FIGHTER_IR_SIG
   optical_signature     SIMPLE_FIGHTER_OPTICAL_SIG
   spatial_domain  		 air
   side            		 green
   icon            		 aim120b
   category              weapon

   # Setup the P6DOF mover
   mover WSF_P6DOF_MOVER
      p6dof_object_type AGM-SR
      update_interval   0.01 sec
   end_mover
   
   # Define the weapon effects/lethality
   weapon_effects SR_LETHALITY
   
   # This is a generic/simple geometric seeker
   sensor missile_seeker SIMPLE_GENERIC_SEEKER
      category       missile_seeker
      # Turn on seeker
      on
      internal_link  data_mgr
   end_sensor
   
   processor guidance WSF_P6DOF_GUIDANCE_COMPUTER

      update_interval 0.01 sec
      guide_to_truth  true

      phase LAUNCH_GUIDANCE
         time_constant                   0.01 sec
         proportional_navigation_gain    0
         velocity_pursuit_gain           0
         g_bias                          0
         next_phase MIDCOURSE_GUIDANCE when phase_time > 1.0 sec
      end_phase

      phase MIDCOURSE_GUIDANCE
         time_constant                   0.1 sec
#         proportional_navigation_gain    4
#         velocity_pursuit_gain           2
#         g_bias                          3
         proportional_navigation_gain    2
         velocity_pursuit_gain           2
         g_bias                          1
         next_phase TERMINAL_GUIDANCE when range_to_intercept < 5.0 nm
      end_phase

      phase TERMINAL_GUIDANCE
         time_constant                   0.0 sec
         proportional_navigation_gain    4
#        velocity_pursuit_gain           10
         velocity_pursuit_gain           6
         g_bias                          1
      end_phase

   end_processor

   processor data_mgr WSF_TRACK_PROCESSOR
      on
      master_track_processor
      #show_state_transitions
      update_interval 0.01 sec
      purge_interval  1 sec
   end_processor

   processor fuse medium_range_fuse
   end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：radar_signature, infrared_signature, optical_signature, spatial_domain, side, icon, category, mover, weapon_effects, sensor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, category, infrared_signature, optical_signature, radar_signature, include, comm, zone, processor, script_variables, execute, 平台类型
- **出处**：`aea_iads/platforms/large_sam_battalion.txt:82-160`
- **片段**：

```text
platform_type LARGE_SAM_BATTALION WSF_PLATFORM
   icon TWIN_BOX
   category ENGAGEMENT

   infrared_signature    VEHICLE_INFRARED_SIGNATURE
   optical_signature     VEHICLE_OPTICAL_SIGNATURE
   radar_signature       VEHICLE_RADAR_SIGNATURE

   include processors/commander_track_manager$(TRACKER_TYPE).txt

   comm cmdr_net RED_DATALINK
      network_name <local:slave>
      internal_link data_mgr
      internal_link task_mgr
   end_comm

   comm sub_net RED_DATALINK
      network_name <local:master>
      internal_link data_mgr
      internal_link task_mgr
   end_comm

   zone full_kinematic
      circular
         maximum_altitude 30 km
         maximum_radius   25 nm
   end_zone

   processor data_mgr WSF_TRACK_PROCESSOR
      purge_interval 30 seconds
   end_processor

   processor task_mgr LARGE_SAM_BATTALION_TASK_MGR
   end_processor
/*
   # ---------------------------------------------
   # Draw track to false targets and real targets
   # ---------------------------------------------
   script_variables
      # Create a WsfDraw object.
      WsfDraw draw = WsfDraw();
   end_script_variables

   execute at_interval_of 1.0 s
      foreach (WsfLocalTrack track in MasterTrackList())
      {
         if (track.IsValid() && track.SensorTypeContributor("TTR_RADAR"))
         {
            # use the track ID as a unique draw ID
            # a track icon and a line to the track icon
            # is drawn at each track update
            string trackId = track.TrackId().ToString();
            draw.SetId(trackId);
            draw.SetDuration(1.0); # this is faster than calling erase every time

            if (track.IsFalseTarget())
            {
               draw.SetColor(0,1,0);
            }
            else
            {
               draw.SetColor(1,0,0);

            }
            draw.BeginIcons(track.Heading(), "Wedge");
            draw.Vertex(track.ReportedLocation());
            draw.End();

            # Draw a line to the track
            draw.SetLineStyle("dashed");
            draw.BeginLines();
            draw.Vertex(PLATFORM);
            draw.Vertex(track.ReportedLocation());
            draw.End();
         }
      }
   end_execute
*/
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, category, infrared_signature, optical_signature, radar_signature, include, comm, zone, processor, script_variables

### platform_type（escort）｜平台类型

- **关键词**：platform_type, icon, include, indestructible, radar_signature, mover, fuel, weapon, comm, sensor, processor, edit, 平台类型
- **出处**：`air_to_air/platforms/escort.txt:32-123`
- **片段**：

```text
platform_type  ESCORT  BRAWLER_TEST
   icon f15c
   include prdata/escort.txt
   indestructible 

   radar_signature 10dB_FuzzBall

   mover WSF_BRAWLER_MOVER
      aero_file platforms/fxw/lte_fighter.fxw
      update_time_tolerance 0.01 s
   end_mover

   fuel WSF_BRAWLER_FUEL
      aero_file platforms/fxw/lte_fighter.fxw
      initial_quantity_ratio 1.0
   end_fuel

   weapon fox3 MEDIUM_RANGE_RADAR_MISSILE # fox 3 (MRM)
      quantity 4
   end_weapon

   weapon fox2 SHORT_RANGE_IR_MISSILE # fox 2 (SRM)
      quantity 2
   end_weapon

   weapon fox1 SHORT_RANGE_IR_MISSILE # fox 1 (other)
      quantity 0
   end_weapon
   
   weapon agm SHORT_RANGE_IR_MISSILE # air-to-ground missile, use SRM just to populate something
      quantity 0
   end_weapon

   comm weapon_datalink WSF_COMM_TRANSCEIVER      // uplink to weapons
      network_name weapons_subnet
      internal_link data_mgr
   end_comm

   sensor rdr1 aesa  
      on
      internal_link data_mgr
      internal_link raw_data_mgr
   end_sensor

   sensor eyes WSF_GEOMETRIC_SENSOR
      on
      azimuth_field_of_view   -180.0 degrees  180.0 degrees
      elevation_field_of_view  -90.0 degrees   90.0 degrees
      maximum_range 10 nmi
      frame_time    0.025 sec
      range_error_sigma 2000 ft
      range_rate_error_sigma 100 ft/s
      azimuth_error_sigma 0.1 deg
      elevation_error_sigma 0.1 deg
      reports_velocity 
      reports_range
      reports_bearing 
      reports_iff
      internal_link data_mgr
      internal_link raw_data_mgr
      ignore_same_side
   end_sensor
  
    sensor rwr esm                       // 3
      on
      ignore IGNORE
      ignore_same_side
      internal_link data_mgr
      internal_link raw_data_mgr
   end_sensor

   processor radar_track_cueing SENSOR_CUE_PROCESSOR
      script_variables 
         mSourceSensorNames.Insert("*");
         mCuedSensorName = "rdr1";
         mTrackModeName = "TWS";
      end_script_variables
   end_processor

   processor weapon_datalink_manager WEAPON_DL_MANAGER
      script_variables 
         mUplinkSensorNames.PushBack("rdr1");
      end_script_variables
   end_processor
   
   edit processor assessment
      enemy_side    red
      enemy_type    DCA
      friendly_type ESCORT
      flight_id     1
   end_processor 
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：icon, include, indestructible, radar_signature, mover, fuel, weapon, comm, sensor, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, height, width, length, mover, optical_signature, radar_signature, comm, processor, sensor, 平台类型
- **出处**：`laser_designator/platforms/soldier.txt:19-42`
- **片段**：

```text
platform_type SOLDIER WSF_PLATFORM
   icon infantry
   height 2 meters
   width 0.5 meters
   length 0.5 meters 
   mover WSF_GROUND_MOVER end_mover
   optical_signature soldier_optical_signature
   radar_signature   soldier_radar_signature

   comm  cmd_net WSF_COMM_TRANSCEIVER
      transfer_rate 100 mbits/sec
      network_name <local:slave>
      internal_link data_mgr      
   end_comm
   processor data_mgr WSF_TRACK_PROCESSOR
      report_to commander via cmd_net 
   end_processor    
   sensor geo_sensor GEO_SENSOR 
      location 0 0 -2 meters # about 6 ft up
      internal_link data_mgr
      update_interval 1 sec
      ignore_same_side
   end_sensor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, height, width, length, mover, optical_signature, radar_signature, comm, processor, sensor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, commander, weapon, location, quantity, processor, script_variables, internal_link, purge_interval, sensor, 平台类型
- **出处**：`ciws/platforms/ship.txt:15-48`
- **片段**：

```text
platform_type SHIP WSF_PLATFORM
  icon  ship
  commander SELF
  weapon gun 30MM_BULLET
    location 0 0 -5 m  # 15 feet up off of waterline
    quantity 101
  end_weapon

  processor gun_task_processor GUN_BATTERY_TACTICS

    script_variables
      #TRACK_SENSOR_NAME         = "test_track_sensor";
      TRACK_SENSOR_NAME         = "red_ciws_radar_1";
      ACQ_SENSOR_NAME           = "test_acq_sensor";
      SENSOR_TRACK_MODE         = "default";
      WEAPON_NAME               = "gun";
      SALVO_SIZE                = 100;
      MAX_RANGE                 = 1800; # dont even try to shoot farther
    end_script_variables
  end_processor

  processor track_mgr WSF_TRACK_PROCESSOR
    internal_link gun
    purge_interval       60 sec
  end_processor

  sensor red_ciws_radar_1 RED_CIWS_RADAR_1
     on 
     ignore_same_side 
     processor track_mgr     
     antenna_height                 6.0 m        # about 18 ft above waterline
  end_sensor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, commander, weapon, location, quantity, processor, script_variables, internal_link, purge_interval, sensor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, spatial_domain, icon, mover, update_interval, p6dof_ned_heading, p6dof_position, p6dof_set_velocity_ned_fps, include, enable_controls, on_update, 平台类型
- **出处**：`p6dof/sam_launch_test.txt:64-107`
- **片段**：

```text
platform_type SAM_TEST_PLATFORM WSF_PLATFORM
   spatial_domain  air
   icon            aim120b

   mover WSF_P6DOF_MOVER
      p6dof_object_type $<MOVER_TYPE:SAM-MR>$
   end_mover
   
   update_interval 0.01 sec

   p6dof_ned_heading           0 deg
   p6dof_position              21.4  -158.0
   p6dof_set_velocity_ned_fps  0 0 0

   include p6dof_types/scripts/p6dof_testing_scripts.txt

   enable_controls false

   on_update
      foreach (int key : struct value in mData)
      {
         WsfPlatform platform = WsfSimulation.FindPlatform(key);
         if(!platform.IsNull())
         {
            double time = TIME_NOW;

            double altitude = platform.Altitude();
            if(altitude > value->maxAltitude_m)
            {
               value->maxAltitude_m = altitude;
               value->timeMaxAltitude_sec = time;
            }
            double speed = platform.Speed();
            if(speed > value->maxSpeed_mps)
            {
               value->maxSpeed_mps = speed;
               value->timeMaxSpeed_sec = time;
            }
            value->maxRange_km = GetRangeSinceStart_km(platform);
         }
      }
   end_on_update

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：spatial_domain, icon, mover, update_interval, p6dof_ned_heading, p6dof_position, p6dof_set_velocity_ned_fps, include, enable_controls, on_update

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, infrared_signature, optical_signature, radar_signature, sensor, mover, default_radial_acceleration, at_end_of_path, weapon, processor, 平台类型
- **出处**：`electronic_warfare/test_multi_beam/platforms/soj.txt:207-260`　（同签名共 4 处，另见 `aea_iads/platforms/soj.txt:397`、`electronic_warfare/test_false_targets/platforms/soj.txt:214`、`iads/platforms/soj.txt:166`）
- **片段**：

```text
platform_type SOJ WSF_PLATFORM
  icon weasel

  infrared_signature FIGHTER_INFRARED_SIG
  optical_signature  FIGHTER_OPTICAL_SIG
  radar_signature    FIGHTER_RADAR_SIG

  sensor esm UCAV_ESM
     on
     internal_link data_mgr
     ignore_same_side
  end_sensor

  mover WSF_AIR_MOVER
    default_radial_acceleration 2.0 g
    at_end_of_path remove
  end_mover

  weapon vhf_jammer SOJ_VHF_JAMMER
     off
     ignore_same_side
  end_weapon

  weapon fwd_sband_jammer SOJ_SBAND_JAMMER
     off
     yaw 0.0 deg
     ignore_same_side
  end_weapon

  weapon aft_sband_jammer SOJ_SBAND_JAMMER
     off
     yaw 180.0 deg
     ignore_same_side
  end_weapon

  weapon fwd_xband_jammer SOJ_XBAND_JAMMER
     off
     yaw 0.0 deg
     ignore_same_side
  end_weapon

  weapon aft_xband_jammer SOJ_XBAND_JAMMER
     off
     yaw 180.0 deg
     ignore_same_side
  end_weapon

  processor data_mgr WSF_TRACK_PROCESSOR
     purge_interval   20.0 sec
  end_processor

  processor task_mgr SOJ_TASK_MGR
  end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, infrared_signature, optical_signature, radar_signature, sensor, mover, default_radial_acceleration, at_end_of_path, weapon, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, infrared_signature, optical_signature, radar_signature, comm, processor, update_interval, script, on_update, report_to, 平台类型
- **出处**：`bearing_only/platforms/fuser_platform2.txt:11-68`
- **片段**：

```text
platform_type FUSER_PLATFORM WSF_PLATFORM
  icon comm_truck_icon

  infrared_signature    VEHICLE_INFRARED_SIGNATURE
  optical_signature     VEHICLE_OPTICAL_SIGNATURE
  radar_signature       VEHICLE_RADAR_SIGNATURE

  comm cmdr_net RED_DATALINK
     network_name <local:slave>
     #internal_link data_mgr
     #internal_link task_mgr
     internal_link fuser
  end_comm

  comm sub_net RED_DATALINK
     network_name <local:master>
     internal_link fuser
     #internal_link task_mgr
  end_comm


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

  processor reporter WSF_LINKED_PROCESSOR
   report_to commander via cmdr_net to sub_net
   update_interval  10 sec
   end_processor

  processor fuser WSF_DIRECTION_FINDER_PROCESSOR
     processor trk_mgr
     processor reporter
     maximum_time_difference 5 sec
  end_processor


end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, infrared_signature, optical_signature, radar_signature, comm, processor, update_interval, script, on_update, report_to

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, category, icon, infrared_signature, optical_signature, radar_signature, mover, processor, sensor, comm, script, 平台类型
- **出处**：`air_to_air/weapons/aam/short_range_ir_missile.txt:115-183`
- **片段**：

```text
platform_type SHORT_RANGE_IR_MISSILE_BASE WSF_PLATFORM
   category missile

   icon aim9x
   
   infrared_signature SIMPLE_MISSILE_INFRARED_SIGNATURE
   optical_signature  SIMPLE_MISSILE_OPTICAL_SIGNATURE
   radar_signature    SIMPLE_MISSILE_RADAR_SIGNATURE

   mover WSF_GUIDED_MOVER
      total_mass       188.0 lbm # init=188, bo=127
      fuel_mass         61.0 lbm
      # Isp values of 250 are typical of solid rocket motors of
      # today, but that value would not close, so was reduced.
      specific_impulse 222.0 sec
      thrust          2700.0 lbf
      thrust_duration    5.1 sec
      update_interval 0.10 s
      aero SHORT_RANGE_IR_MISSILE_AERO
      #show_status # Turns on some mass properties diagnostic output
   end_mover

   processor srm_autopilot WSF_GUIDANCE_COMPUTER
      proportional_navigation_gain  30.0
      velocity_pursuit_gain         30.0
      g_bias                         1.0
      maximum_commanded_g           40.0 g
      update_interval                0.1 s
   end_processor

   processor srm_seeker WSF_PERFECT_TRACKER
      update_interval 0.10 s
   end_processor

   processor srm_fuse WSF_AIR_TARGET_FUSE
      max_time_of_flight_to_detonate  120.0 sec
   end_processor

   ###########################################################################
   ### Even though we're simulating an IR missile, use the simple radar
   ### seeker defined above. Since we are using the WSF_PERFECT_TRACKER,
   ### this is only used to provide data from the observer.  
   ###########################################################################
   sensor seeker IR_SEEKER
      off
      internal_link data_mgr
   end_sensor

// NAS - add comm, track processor

   comm uplink WSF_COMM_TRANSCEIVER      // uplink to weapons
      network_name weapons_subnet
      internal_link data_mgr
   end_comm
   
   processor data_mgr WSF_TRACK_PROCESSOR
      master_track_processor 
      fused_track_reporting on
      purge_interval 60 s
   end_processor 

   script void on_platform_deleted()
      if (PLATFORM.Commander().IsValid()) // && PLATFORM.Commander().UplinkProcessor().IsValid)
      {
         PLATFORM.Commander().UplinkProcessor().StopUplinking(PLATFORM);
      }
   end_script

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：category, icon, infrared_signature, optical_signature, radar_signature, mover, processor, sensor, comm, script

### platform_type（aam-sr-tvc）｜平台类型

- **关键词**：platform_type, radar_signature, infrared_signature, optical_signature, spatial_domain, side, icon, category, weapon_effects, sensor, processor, 平台类型
- **出处**：`p6dof/platforms/aam-sr-tvc.txt:45-115`　（同签名共 2 处，另见 `p6dof/platforms/aam-sr.txt:53`）
- **片段**：

```text
platform_type AAM-SR-TVC AAM-SR-TVC-TEST
   radar_signature       SIMPLE_FIGHTER_RCS
   infrared_signature    SIMPLE_FIGHTER_IR_SIG
   optical_signature     SIMPLE_FIGHTER_OPTICAL_SIG
   spatial_domain        air
   side                  green
   icon                  aim9x
   category              weapon
   
   weapon_effects SR_LETHALITY

#...............................................................................

   sensor ir_seeker SIMPLE_GENERIC_SEEKER
      category ir_seeker
      on
      internal_link data_mgr
      internal_link seeker_activation
   end_sensor

   processor guidance WSF_P6DOF_GUIDANCE_COMPUTER

      update_interval 0.01 sec

      phase LAUNCH_GUIDANCE
         time_constant                   1 sec
         proportional_navigation_gain    4
         velocity_pursuit_gain           10
         g_bias                          0
         #maximum_commanded_g             20 g
         next_phase PHASE2 when phase_time > 2.0 sec
      end_phase

      phase PHASE2
         time_constant                   0.01 sec
         proportional_navigation_gain    4
         velocity_pursuit_gain           10
         g_bias                          1
         next_phase TERMINAL_GUIDANCE when range_to_intercept < 2.0 km
      end_phase

      phase TERMINAL_GUIDANCE
         time_constant                   0.0 sec
         proportional_navigation_gain    2
         velocity_pursuit_gain           10
         g_bias                          1
      end_phase

   end_processor

   processor data_mgr WSF_TRACK_PROCESSOR
      on
      master_track_processor
      update_interval 0.01 sec
      purge_interval  1 sec
   end_processor

   processor fuse WSF_AIR_TARGET_FUSE
      use_current_target
      update_interval           0.1 sec
      fine_update_interval      0.01 sec
      gross_proximity_range     500 ft
      detonate_below_height_agl 20.0 ft
      detonate_below_height_msl 20.0 ft
      maximum_time_of_flight    120.0 sec
   end_processor

   processor seeker_activation verbose_seeker_activation
   end_processor

end_platform_type
```

- **演示要点**：演示 platform_type 的参数：radar_signature, infrared_signature, optical_signature, spatial_domain, side, icon, category, weapon_effects, sensor, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, include, icon, radar_signature, side, commander, group_join, mover, router, comm, visual_part, 平台类型
- **出处**：`space_operations/platforms/starlink.txt:28-108`
- **片段**：

```text
platform_type STARLINK WSF_PLATFORM
   
   include platforms/starlink_linkable.txt
   
   icon cubesat
   radar_signature STARLINK_RADAR_SIG
   side blue
   
   commander commander1
   
   group_join DOWNLINK
   group_join CROSSLINK
   
   mover WSF_SPACE_MOVER
      semi_major_axis 7178 km
      inclination 72 deg
   end_mover
   
   router default WSF_COMM_ROUTER
      automated_interface_linking true
   end_router
   
   comm crosslink1 CROSSLINK
      yaw 0 deg      
      group_join DEDICATED_COMM  // links only to forward satellite
      network_name starlink_default
   end_comm
   
   visual_part crosslink1 WSF_VISUAL_PART
      yaw 0 deg
      azimuth_slew_limits -80 deg 80 deg
      elevation_slew_limits -80 deg 80 deg
   end_visual_part
   
   comm crosslink2 CROSSLINK 
      yaw 180 deg
      group_join DEDICATED_COMM  // links only to rearward satellite
      network_name starlink_default
   end_comm
   
   visual_part crosslink2 WSF_VISUAL_PART
      yaw 180 deg
      azimuth_slew_limits -80 deg 80 deg
      elevation_slew_limits -80 deg 80 deg
   end_visual_part

   comm crosslink3 CROSSLINK 
      yaw -90 deg
      network_name starlink_default
   end_comm
   
   visual_part crosslink3 WSF_VISUAL_PART
      yaw -90 deg
      azimuth_slew_limits -80 deg 80 deg
      elevation_slew_limits -80 deg 80 deg      
   end_visual_part

   comm crosslink4 CROSSLINK
      yaw 90 deg
      network_name starlink_default
   end_comm

   visual_part crosslink4 WSF_VISUAL_PART
      yaw 90 deg
      azimuth_slew_limits -80 deg 80 deg
      elevation_slew_limits -80 deg 80 deg
   end_visual_part

   comm downlink DOWNLINK
      pitch -90 deg           
      group_join DOWNLINK
      network_name starlink_default
   end_comm
   
   visual_part downlink WSF_VISUAL_PART
      pitch -90 deg
      azimuth_slew_limits -80 deg 80 deg
      elevation_slew_limits -80 deg 45 deg
   end_visual_part

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：include, icon, radar_signature, side, commander, group_join, mover, router, comm, visual_part

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, script_variables, execute, weapon_effects, icon, infrared_signature, optical_signature, radar_signature, mover, processor, sensor, 平台类型
- **出处**：`base_types/weapons/aam/medium_range_radar_missile.txt:92-174`　（同签名共 6 处，另见 `behavior_tree/weapons/aam/medium_range_radar_missile.txt:90`、`brawler/weapons/aam/medium_range_radar_missile.txt:92`、`heatmap/weapons/aam/medium_range_radar_missile.txt:92`）
- **片段**：

```text
platform_type MEDIUM_RANGE_RADAR_MISSILE WSF_PLATFORM

   script_variables
      bool mDrawTarget = true;
      WsfDraw draw = WsfDraw();
   end_script_variables

   execute at_interval_of 1 sec
      if (mDrawTarget)
      {
         WsfTrack tgt = PLATFORM.CurrentTargetTrack();
         if (tgt.IsValid())
         {
            draw.SetDuration(1.0);  //same as execute interval
            draw.SetColor(1, 0, 1); //purple
            draw.SetLineSize(2);    //double thick
            draw.BeginLines();
               draw.Vertex(PLATFORM.Location());
               draw.Vertex(tgt.CurrentLocation());
            draw.End();
         }
      }
   end_execute

   weapon_effects SIMPLE_EFFECT
   icon Scud_Missile
   infrared_signature SIMPLE_INFRARED_SIGNATURE
   optical_signature  SIMPLE_OPTICAL_SIGNATURE
   radar_signature    SIMPLE_RADAR_SIGNATURE

   ###########################################################################
   ### straight line movers guide themselves, towards the platform's target
   ###########################################################################
   mover WSF_STRAIGHT_LINE_MOVER
      average_speed           3221.5 kts     # mach 5
      update_interval         0.006  sec
      update_time_tolerance   0.0006 sec     # this mover travels 1 meter in 0.00060339 seconds
      maximum_lateral_acceleration  15.0 g   # average turner
      guidance_mode           lead_pursuit   # or pure_pursuit
      guide_to_truth          false          # guide to perception
   end_mover

   ###########################################################################
   ### simple fuse
   ###########################################################################
   processor fuse WSF_AIR_TARGET_FUSE
      max_time_of_flight_to_detonate  100.0 sec
   end_processor

   ###########################################################################
   ### perfect trackers provide target truth data for the missile
   ###   no uplink or tracking required for this missile
   ###########################################################################
   #processor seeker WSF_PERFECT_TRACKER
   #   update_interval  0.5 s
   #end_processor

   ###########################################################################
   ### imperfect radar provide target data for the missile
   ###########################################################################
   sensor seeker RADAR_SEEKER
      off
      internal_link track_mgr
      internal_link weapon_manager
   end_sensor

   ###########################################################################
   ### simple track manager.  make sure comm & sensor feed it
   ###########################################################################
   processor track_mgr WSF_TRACK_PROCESSOR
      master_track_processor
   end_processor

   ###########################################################################
   ### turns on the weapon radar at the right time
   ###########################################################################
   processor weapon_manager WSF_WEAPON_TRACK_PROCESSOR
      turn_on_sensor seeker  at_time   30 s before_intercept
     #turn_on_sensor seeker at_range 3500 m before_intercept
      coast_time      100 s
      uplink_required false         #this version is active missile only (no no command guidance uplink)
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：script_variables, execute, weapon_effects, icon, infrared_signature, optical_signature, radar_signature, mover, processor, sensor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, radar_signature, infrared_signature, optical_signature, spatial_domain, side, icon, category, mover, sensor, processor, 平台类型
- **出处**：`p6dof/platforms/sam-mr.txt:32-114`
- **片段**：

```text
platform_type  SAM-MR  WSF_PLATFORM

   radar_signature    SIMPLE_FIGHTER_RCS
   infrared_signature SIMPLE_FIGHTER_IR_SIG
   optical_signature  SIMPLE_FIGHTER_OPTICAL_SIG
   spatial_domain     air
   side               green
   icon               aim120b
   category           weapon

   # Setup the P6DOF mover
   mover WSF_P6DOF_MOVER
      p6dof_object_type SAM-MR
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
   
   # This is a generic/simple geometric seeker
   sensor missile_seeker SIMPLE_GENERIC_SEEKER
      on
      category       missile_seeker
      internal_link  data_mgr
      internal_link  seeker_activation
   end_sensor
   
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

   processor data_mgr WSF_TRACK_PROCESSOR
      on
      master_track_processor
      update_interval 0.01 sec
      purge_interval  1 sec
   end_processor

   processor fuse WSF_AIR_TARGET_FUSE
      use_current_target
      update_interval           0.1 sec
      fine_update_interval      0.01 sec
      gross_proximity_range     500 ft
      detonate_below_height_agl 20.0 ft
      detonate_below_height_msl 20.0 ft
      maximum_time_of_flight    600.0 sec
   end_processor
   
   processor seeker_activation verbose_seeker_activation
   end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：radar_signature, infrared_signature, optical_signature, spatial_domain, side, icon, category, mover, sensor, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, script_variables, execute, weapon_effects, icon, infrared_signature, optical_signature, radar_signature, mover, processor, comm, 平台类型
- **出处**：`base_types/weapons/aam/medium_range_uplink_missile.txt:40-126`
- **片段**：

```text
platform_type MEDIUM_RANGE_UPLINK_MISSILE WSF_PLATFORM

   script_variables
      bool mDrawTarget = false;
      WsfDraw draw = WsfDraw();
   end_script_variables

   execute at_interval_of 1 sec
      if (mDrawTarget)
      {
         WsfTrack tgt = PLATFORM.CurrentTargetTrack();
         if (tgt.IsValid())
         {
            draw.SetDuration(1.0);  //same as execute interval
            draw.SetColor(1, 0, 1); //purple
            draw.SetLineSize(2);    //double thick
            draw.BeginLines();
               draw.Vertex(PLATFORM.Location());
               draw.Vertex(tgt.CurrentLocation());
            draw.End();
         }
      }
   end_execute

   weapon_effects SIMPLE_EFFECT
   icon Scud_Missile
   infrared_signature SIMPLE_INFRARED_SIGNATURE
   optical_signature  SIMPLE_OPTICAL_SIGNATURE
   radar_signature    SIMPLE_RADAR_SIGNATURE

   ###########################################################################
   ### straight line movers guide themselves, towards the platform's target
   ###########################################################################
   mover WSF_STRAIGHT_LINE_MOVER
      average_speed           3221.5 kts     # mach 5
      update_interval         0.006  sec
      update_time_tolerance   0.0006 sec     # this mover travels 1 meter in 0.00060339 seconds
      maximum_lateral_acceleration  15.0 g   # average turner
      guidance_mode           lead_pursuit   # or pure_pursuit
      guide_to_truth          false          # guide to perception
   end_mover

   ###########################################################################
   ### simple fuse
   ###########################################################################
   processor fuse WSF_AIR_TARGET_FUSE
      max_time_of_flight_to_detonate  100.0 sec
   end_processor

   ###########################################################################
   ### perfect trackers provide target truth data for the missile
   ###   no uplink or tracking required for this missile
   ###########################################################################
   #processor seeker WSF_PERFECT_TRACKER
   #   update_interval  0.5 s
   #end_processor

   ###########################################################################
   ### comm to receive target uplink track reports for weapon manuevering
   ###########################################################################
   comm weapon_downlink WSF_RADIO_RCVR
      network_name weapons_subnet
      internal_link track_mgr
      receiver
         antenna_pattern weapon_datalink_gain
         frequency 10 GHz
         bandwidth 500 MHz
         detection_threshold 0 dB
      end_receiver
   end_comm

   ###########################################################################
   ### simple track manager.  make sure comm & sensor feed it
   ###########################################################################
   processor track_mgr WSF_TRACK_PROCESSOR
      master_track_processor
   end_processor

   ###########################################################################
   ### turns on the weapon radar at the right time
   ###########################################################################
   processor weapon_manager WSF_WEAPON_TRACK_PROCESSOR
      coast_time      100 s
      ignore_uplink_target_change   #the processor ignores track messages that dont pertain to the current target
      uplink_required true          #this version is command guided missile only (no missile-active state)
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：script_variables, execute, weapon_effects, icon, infrared_signature, optical_signature, radar_signature, mover, processor, comm

### platform_type（dca）｜平台类型

- **关键词**：platform_type, icon, include, radar_signature, mover, fuel, weapon, comm, sensor, processor, edit, 平台类型
- **出处**：`air_to_air/platforms/dca.txt:32-122`　（同签名共 2 处，另见 `air_to_air/platforms/hvaa.txt:36`）
- **片段**：

```text
platform_type  DCA  BRAWLER_TEST
   icon f15c
   include prdata/dca.txt

   radar_signature 10dB_FuzzBall

   mover WSF_BRAWLER_MOVER
      aero_file platforms/fxw/lte_fighter.fxw
      update_time_tolerance 0.01 s
   end_mover

   fuel WSF_BRAWLER_FUEL
      aero_file platforms/fxw/lte_fighter.fxw
      initial_quantity 20000 pounds
   end_fuel

   weapon fox3 MEDIUM_RANGE_RADAR_MISSILE # fox 3 (MRM)
      quantity 4
   end_weapon

   weapon fox2 SHORT_RANGE_IR_MISSILE # fox 2 (SRM)
      quantity 2
   end_weapon

   weapon fox1 SHORT_RANGE_IR_MISSILE # fox 1 (other)
      quantity 0
   end_weapon
   
   weapon agm SHORT_RANGE_IR_MISSILE # air-to-ground missile, use SRM just to populate something
      quantity 0
   end_weapon

   comm weapon_datalink WSF_COMM_TRANSCEIVER      // uplink to weapons
      network_name weapons_subnet
      internal_link data_mgr
   end_comm

   sensor rdr1 aesa  
      on
      internal_link data_mgr
      internal_link raw_data_mgr
   end_sensor

   sensor eyes WSF_GEOMETRIC_SENSOR
      on
      azimuth_field_of_view   -180.0 degrees  180.0 degrees
      elevation_field_of_view  -90.0 degrees   90.0 degrees
      maximum_range 10 nmi
      frame_time    2 sec
      range_error_sigma 2000 ft
      range_rate_error_sigma 100 ft/s
      azimuth_error_sigma 0.1 deg
      elevation_error_sigma 0.1 deg
      reports_velocity 
      reports_range
      reports_bearing 
      reports_iff
      internal_link data_mgr
      internal_link raw_data_mgr
      ignore_same_side
   end_sensor
  
    sensor rwr esm                       // 3
      on
      ignore IGNORE
      ignore_same_side
      internal_link data_mgr
      internal_link raw_data_mgr
   end_sensor

   processor radar_track_cueing SENSOR_CUE_PROCESSOR
      script_variables 
         mSourceSensorNames.Insert("*");
         mCuedSensorName = "rdr1";
         mTrackModeName = "TWS";
      end_script_variables
   end_processor

   processor weapon_datalink_manager WEAPON_DL_MANAGER
      script_variables 
         mUplinkSensorNames.PushBack("rdr1");
      end_script_variables
   end_processor
   
   edit processor assessment
      enemy_side    blue
      enemy_type    ESCORT
      friendly_type DCA
      flight_id     202
   end_processor    
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：icon, include, radar_signature, mover, fuel, weapon, comm, sensor, processor, edit

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, category, mover, radar_signature, include, sensor, execute, script, processor, weapon, 平台类型
- **出处**：`outer_air_battle/platforms/blue_multirole_fighter_2.txt:30-151`
- **片段**：

```text
platform_type BLUE_MULTIROLE_FIGHTER_2 WSF_PLATFORM

   icon F-18E
   category fighter

   mover WSF_AIR_MOVER
      roll_rate_limit               1 rad/sec
      default_linear_acceleration   1.0 g
      default_radial_acceleration   6.5 g
      default_climb_rate            400 fps

      //old value
      //maximum_speed                 600.0 knots
      // Janes Reference, Max level speed: more than M1.8 (1160 kts)
      maximum_speed      1160.0 knots

      //old value
      //maximum_altitude              55000 ft
      //Combat Ceiling, Janes Reference
      maximum_altitude              50000 ft

      minimum_altitude              50 ft
      maximum_linear_acceleration   8 g
      #no_pitch
      at_end_of_path remove
   end_mover

   radar_signature blue_a2a_radar_signature

   include platforms/blue_comm.txt

   sensor blue_a2a_radar GEO_AA_RADAR
      //debug
      on
      internal_link data_mgr
      ignore_same_side
   end_sensor

   execute at_time 5 seconds relative
      WsfDraw sensorArc = WsfDraw();
      sensorArc.SetId(PLATFORM.Name());
      sensorArc.SetColor(0,1,0);
      sensorArc.SetEllipseMode("line");
      sensorArc.BeginPolyline();
      sensorArc.Vertex(PLATFORM);
      double range = 125. * MATH.M_PER_NM();
      double heading = PLATFORM.Heading();
      WsfGeoPoint loc = PLATFORM.Location();
      for (double angle = -60.; angle <= 60.; angle = angle + 5.)
      {
         double aFront = MATH.Cos(angle)*range;
         double aRight = MATH.Sin(angle)*range;
         sensorArc.VertexECS(PLATFORM, aFront, aRight, 0.0);
      }
      sensorArc.Vertex(PLATFORM);
      sensorArc.End();
   end_execute

   script void atEndOfRoute()
      # turn off radar arc
      WsfDraw turnOffArc = WsfDraw();
      turnOffArc.Erase(PLATFORM.Name());
   end_script



   sensor esm-1 GENERIC_ESM_SENSOR
      //debug
      on
      yaw 45. degrees
      internal_link data_mgr
   end_sensor

   sensor esm-2 GENERIC_ESM_SENSOR
      //debug
      on
      yaw 135 degrees
      internal_link data_mgr
   end_sensor

   sensor esm-3 GENERIC_ESM_SENSOR
      //debug
      on
      yaw -135 degrees
      internal_link data_mgr
   end_sensor

   sensor esm-4 GENERIC_ESM_SENSOR
      //debug
      on
      yaw -45 degrees
      internal_link data_mgr
   end_sensor

   processor data_mgr WSF_TRACK_PROCESSOR
      //debug
      purge_interval  60 sec
      update_interval 1 sec

      report_to commander via cmdr_net
   end_processor

   processor task_mgr BLUE_MULTIROLE_FIGHTER_2_TASK_PROCESSOR #WSF_TASK_PROCESSOR
   end_processor

#   weapon int_missile SIMPLE_A2A_MISSILE_WEAPON end_weapon

   weapon blue_lr_a2a_rf_missile BLUE_LR_A2A_RF_MISSILE
      quantity 10
   end_weapon
   weapon blue_sr_a2a_ir_missile BLUE_SR_A2A_IR_MISSILE
      quantity 2
   end_weapon

//   weapon HARM2 HARM2_WEAPON
//      quantity 2
//   end_weapon
//   weapon JSOW JSOW_WEAPON
//      quantity 2
//   end_weapon

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, category, mover, radar_signature, include, sensor, execute, script, processor, weapon

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, radar_signature, side, mover, add, comm, script_variables, script, processor, category, 平台类型
- **出处**：`satellite_demos/platforms/iridium.txt:18-314`
- **片段**：

```text
platform_type IRIDIUM_SATELLITE WSF_PLATFORM
   icon satellite
   radar_signature IRIDIUM_RADAR_SIG
   side blue
   mover WSF_SPACE_MOVER
      revs_per_day 14.4
      inclination 86.4 deg
   end_mover
   
   //Allow crosslinks/bridges between local comm devices,
   //regardless of network
   add router default WSF_COMM_ROUTER
      automated_interface_linking true
   end_router
   
   comm iridium_crosslink WSF_RADIO_TRANSCEIVER
      on

      transmitter
         antenna_pattern                     UNIFORM_0DBI_PATTERN
         alternate_frequency 1                1621 mhz   # ref 1
         alternate_frequency 2                22.28 ghz  # ref 1
         bandwidth                            200 mhz    # ref 1
         polarization                         horizontal  # ref 1
         power                                35 dbw  # ref 1
      end_transmitter

      receiver
         antenna_pattern                     UNIFORM_0DBI_PATTERN
         frequency                            22.28 ghz  # ref 1
         bandwidth                            200 mhz    # ref 1
         polarization                         horizontal  # ref 1
      end_receiver
   end_comm

   comm iridium_handheld WSF_RADIO_TRANSCEIVER
      on

      transmitter
         antenna_pattern                     UNIFORM_0DBI_PATTERN
         frequency                           1621 mhz   # ref 1
         bandwidth                           10.5 mhz   # ref 1
         power                               48 dbw
         polarization                        right_circular  # ref 1
      end_transmitter

      receiver
         antenna_pattern                     UNIFORM_0DBI_PATTERN
         frequency                           1621 mhz  # ref 1
         bandwidth                           10.5 mhz  # ref 1
      end_receiver
   end_comm

   comm IRIDIUM_DOWNLINK_TX WSF_RADIO_XMTR

      azimuth_field_of_view                  -180.0 deg 180.0 deg
      elevation_field_of_view                 -90.0 deg   0.0 deg

      transmitter
         antenna_pattern                     UNIFORM_0DBI_PATTERN
         frequency                           19.5 ghz  # ref 1
         bandwidth                           200 mhz    # ref 1
         polarization                        left_circular  # ref 1
         power                               30 dbw
      end_transmitter
   end_comm

   comm IRIDIUM_UPLINK_RX WSF_RADIO_RCVR

      azimuth_field_of_view                  -180.0 deg 180.0 deg
      elevation_field_of_view                 -90.0 deg   0.0 deg

      receiver
         antenna_pattern                     UNIFORM_0DBI_PATTERN
         frequency                           29.2 ghz  # ref 1
         bandwidth                           200 mhz  # ref 1
      end_receiver
   end_comm

   script_variables
      static int sFIRST_SATELLITE = 1;
      static int sLAST_SATELLITE = 11;
      static int sFIRST_ORBIT    = 1;
      static int sLAST_ORBIT     = 6;  // CHANGE TODO
      static bool sDebug = true;

      // Variables initialized / set during "initialize2".
      bool mIsTravelingNorth;
      bool mWasTravelingNorth;

      string mNorthwardUpperLeftLink = "<none>";
      string mNorthwardLowerRightLink = "<none>";

      string mSouthwardUpperLeftLink = "<none>";
      string mSouthwardLowerRightLink = "<none>";

      int mOrbitNumber;
      int mSatelliteNumber;

   end_script_variables

   // Note that the following assume the network naming convention of iridium<orbit#><satellite#>.
   script int OrbitNumber(string aName)
      return (int)(aName.Substring(7, 7));
   end_script

   script int SatelliteNumber(string aName)
      return (int)(aName.Substring(8));
   end_script

   script void UpdateTravelDirection()
      mWasTravelingNorth = mIsTravelingNorth;
      Vec3 velWCS = PLATFORM.VelocityWCS();
      mIsTravelingNorth = (velWCS.Z() > 0.0);
   end_script

   script void AddConnection(WsfComm aComm, string aLink)
      WsfPlatform destinationPlatform = WsfSimulation.FindPlatform(aLink);
      WsfComm destinationComm = destinationPlatform.Comm("iridium_crosslink");
      aComm.AddConnection(destinationComm.GetAddress());
   end_script

   script void RemoveConnection(WsfComm aComm, string aLink)
      WsfPlatform destinationPlatform = WsfSimulation.FindPlatform(aLink);
      WsfComm destinationComm = destinationPlatform.Comm("iridium_crosslink");
      aComm.RemoveConnection(destinationComm.GetAddress());
   end_script

   script void UpdateLinks()
      WsfComm comm = PLATFORM.Comm("iridium_crosslink");
      if (mIsTravelingNorth)
      {
         if (mOrbitNumber != sFIRST_ORBIT)
         {
            RemoveConnection(comm, mSouthwardUpperLeftLink);
            AddConnection(comm, mNorthwardUpperLeftLink);
         }
         if (mOrbitNumber != sLAST_ORBIT)
         {
            RemoveConnection(comm, mSouthwardLowerRightLink);
            AddConnection(comm, mNorthwardLowerRightLink);
         }
      }
      else
      {
         if (mOrbitNumber != sFIRST_ORBIT)
         {
            RemoveConnection(comm, mNorthwardUpperLeftLink);
            AddConnection(comm, mSouthwardUpperLeftLink);
         }
         if (mOrbitNumber != sLAST_ORBIT)
         {
            RemoveConnection(comm, mNorthwardLowerRightLink);
            AddConnection(comm, mSouthwardLowerRightLink);
         }
      }
   end_script

   script void AddStaticConnections()
         WsfComm comm = PLATFORM.Comm("iridium_crosslink");
         string connection1 = "iridium" + (string)mOrbitNumber;
         string connection2 = connection1;
         if (mSatelliteNumber != sLAST_SATELLITE)
         {
            connection1 += (string)(mSatelliteNumber + 1);
         }
         else
         {
            connection1 += (string)sFIRST_SATELLITE;
         }
         if (mSatelliteNumber != sFIRST_SATELLITE)
         {
            connection2 += (string)(mSatelliteNumber - 1);
         }
         else
         {
            connection2 += (string)sLAST_SATELLITE;
         }
         //writeln(connection1, ": ", connection2);
         AddConnection(comm, connection1);
         AddConnection(comm, connection2);
   end_script

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

   category iridium

   script void SendTestMessage(string aReceiver)
   end_script

#=========Uncomment this to send a test message to Iridium Ground Network==============================================
#   execute at_interval_of 15 s
#      // Loop through all the platforms in the simulation
#      for (int i = 1; i <= WsfSimulation.PlatformCount(); i = i + 1)
#      {
#          WsfPlatform myPlatform = WsfSimulation.FindPlatform(i);
#          if ((myPlatform != PLATFORM) && myPlatform.IsValid())   # Make sure we are not trying to talk to ourselves!
#          {
#              WsfControlMessage myMessage = WsfControlMessage();
#              myMessage.SetFunction("This is a test");
#
#	              if (myPlatform.Type() == "IRIDIUM_GS")
#                 {
#                     PLATFORM.Comm("IRIDIUM_DOWNLINK_TX").SendUnicastMessage(myMessage, myPlatform);
#                 }
#          }
#      }
#   end_execute
#========================================================================================================================

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, radar_signature, side, mover, add, comm, script_variables, script, processor, category

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, side, cyber_protect, radar_signature, infrared_signature, optical_signature, mover, weapon, processor, 平台类型
- **出处**：`cyber/platforms/uav.txt:22-46`
- **片段**：

```text
platform_type UAV WSF_PLATFORM
  # indestructible
   icon x-45c
   side blue
   
   cyber_protect ALTITUDE_PROTECT
   end_cyber_protect
   
   radar_signature UAV_RADAR_SIG
   infrared_signature UAV_INFRARED_SIG
   optical_signature UAV_OPTICAL_SIG
   
   mover WSF_AIR_MOVER 
      maximum_climb_rate 900.8 m/s
      maximum_impact_speed 0 mph
   end_mover
   
   weapon blue_gps_bomb_1 BLUE_GPS_BOMB_1
      quantity 2
   end_weapon
   
   processor fire-em BOMBER_WEAPON_RELEASE 
   end_processor
   
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, cyber_protect, radar_signature, infrared_signature, optical_signature, mover, weapon, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, mover, aero, mass, update_interval, processor, script_variables, execute, category, 平台类型
- **出处**：`draw/weapons/agm/bomb_1000_lb.txt:37-62`
- **片段**：

```text
platform_type BOMB_1000_LB WSF_PLATFORM
  icon agm109
  mover WSF_GUIDED_MOVER
    aero BOMB_1000_LB_AERO
    mass 1015.0 lbm
    update_interval 0.5 s
  end_mover
  processor guidance_computer BOMB_GUIDANCE_COMPUTER
  end_processor
  processor detonator CONTACT_FUSE
  end_processor

  script_variables
     WsfDraw draw = WsfDraw();
  end_script_variables

  execute at_time 0.1 sec relative
     draw.SetLayer("gbu-layer");
     draw.SetEllipseMode("fill");
     draw.SetColor(0.0, 1.0, 0.0, 0.25);
     draw.BeginEllipsoid(PLATFORM.Heading(), 0, 0, 75, 25, 25);
        draw.Vertex(PLATFORM);
     draw.End();
  end_execute
  category weapon
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, mover, aero, mass, update_interval, processor, script_variables, execute, category

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, radar_signature, infrared_signature, optical_signature, spatial_domain, side, icon, category, mover, processor, 平台类型
- **出处**：`six_dof/platforms/fa-lgt.txt:47-73`　（同签名共 2 处，另见 `six_dof/platforms/fa-lgt.txt:18`）
- **片段**：

```text
platform_type  FA-LGT_PM6  WSF_PLATFORM

   radar_signature    SIMPLE_FIGHTER_RCS
   infrared_signature SIMPLE_FIGHTER_IR_SIG
   optical_signature  SIMPLE_FIGHTER_OPTICAL_SIG
   spatial_domain     air
   side               green
   icon               f16
   category           aircraft
   
   # Setup the RB6 mover
   mover WSF_POINT_MASS_SIX_DOF_MOVER
      vehicle_type                FA-LGT_PM6
      update_interval             0.05 sec
      
      event_core_data             30 Hz
      event_kinematic_data        30 Hz
      event_engine_fuel_data      10 Hz
      event_autopilot_data        10 Hz
      event_autopilot_limits_data  1 Hz
      event_control_inputs_data   20 Hz
      event_force_moment_data     20 Hz
   end_mover

   processor sa_processor GENERAL_ASSESSMENT end_processor
   
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：radar_signature, infrared_signature, optical_signature, spatial_domain, side, icon, category, mover, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, category, infrared_signature, optical_signature, radar_signature, comm, processor, sensor, aux_data, 平台类型
- **出处**：`orwaca_iads/platforms/s-band_ew_radar.txt:13-41`　（同签名共 6 处，另见 `orwaca_iads/platforms/uhf_ew_radar.txt:13`、`orwaca_iads/platforms/vhf_ew_radar.txt:13`、`orwaca_iads/platforms/elr_sam_acq_radar.txt:18`）
- **片段**：

```text
platform_type S-BAND_EW_RADAR WSF_PLATFORM
   icon ew_radar_icon
   category 2D_RADAR
   infrared_signature   VEHICLE_INFRARED_SIGNATURE
   optical_signature    VEHICLE_OPTICAL_SIGNATURE
   radar_signature      VEHICLE_RADAR_SIGNATURE

   comm datalink RED_DATALINK
      network_name <local:slave>
      internal_link task_mgr
   end_comm

   processor data_mgr WSF_LINKED_PROCESSOR
      report_to commander via datalink to sub_net
   end_processor

   processor task_mgr RED_RADAR_TACTICS
   end_processor
  
   sensor s-band_ew_radar_sensor S-BAND_EW_RADAR_SENSOR
      on
      internal_link data_mgr
      ignore_same_side
   end_sensor

   aux_data
      double max_range = 277800 // meters = 150 nm
   end_aux_data
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, category, infrared_signature, optical_signature, radar_signature, comm, processor, sensor, aux_data

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, height, width, length, optical_signature, radar_signature, mover, sensor, processor, 平台类型
- **出处**：`laser_designator/platforms/apc.txt:19-54`
- **片段**：

```text
platform_type APC WSF_PLATFORM  # armored personnel carrier
   icon apc
   height 2.5 meters
   width 2.5 meters
   length 4.0 meters
   optical_signature apc_optical_signature
   radar_signature   apc_radar_signature
   mover WSF_GROUND_MOVER end_mover
   sensor laser_detector LASER_DETECTOR
      on
      internal_link laser_proc
      internal_link task_proc
   end_sensor
   processor laser_proc WSF_TRACK_PROCESSOR
       purge_interval 15 sec
   end_processor
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
   
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, height, width, length, optical_signature, radar_signature, mover, sensor, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, infrared_signature, optical_signature, radar_signature, weapon_effects, mover, processor, weapon, script, 平台类型
- **出处**：`base_types/weapons/sam/blue_lr_sam_common.txt:299-335`　（同签名共 9 处，另见 `base_types/weapons/ssm/red_mrbm_2.txt:184`、`ballistic_missile_shootdown/weapons/ssm/red_mrbm_1.txt:324`、`base_types/weapons/ssm/red_mrbm_1.txt:324`）
- **片段**：

```text
platform_type BLUE_LR_SAM_BASE WSF_PLATFORM
  icon SA-10_Missile  

  infrared_signature BLUE_LR_SAM_INFRARED_SIGNATURE
  optical_signature  BLUE_LR_SAM_OPTICAL_SIGNATURE
  radar_signature    BLUE_LR_SAM_RADAR_SIGNATURE

  weapon_effects     BLUE_LR_SAM_EFFECT

  mover BLUE_LR_SAM_MOVER
     #show_status
  end_mover

  processor guidance BLUE_LR_SAM_GUIDANCE
     #show_status
     #show_graphics
  end_processor

  processor fuse WSF_AIR_TARGET_FUSE
     detonate_below_mach 1.0
  end_processor

   weapon booster WSF_EXPLICIT_WEAPON
      launched_platform_type BLUE_LR_SAM_SPENT_BOOSTER
      launch_delta_v         -50.0 0.0 0.0 m/s
      quantity 1
   end_weapon

   script void on_stage_separation(int aStage)
      extern Map<string, bool> SHOW_SPENT_STAGES;
      if (SHOW_SPENT_STAGES["ALL"] ||
          SHOW_SPENT_STAGES["BLUE_LR_SAM"])
      {
         if (aStage == 1) Weapon("booster").Fire(WsfTrack());
      }
   end_script
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, infrared_signature, optical_signature, radar_signature, weapon_effects, mover, processor, weapon, script

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, category, infrared_signature, optical_signature, radar_signature, track_manager, comm, zone, processor, 平台类型
- **出处**：`iads/platforms/large_sam_battalion.txt:82-119`　（同签名共 6 处，另见 `cyber/exfiltrate_demo/platforms/large_sam_battalion.txt:82`、`orwaca_iads/platforms/elr_sam_battalion.txt:83`、`orwaca_iads/platforms/lr_sam_battalion.txt:83`）
- **片段**：

```text
platform_type LARGE_SAM_BATTALION WSF_PLATFORM
   icon TWIN_BOX
   category ENGAGEMENT

   infrared_signature    VEHICLE_INFRARED_SIGNATURE
   optical_signature     VEHICLE_OPTICAL_SIGNATURE
   radar_signature       VEHICLE_RADAR_SIGNATURE

   track_manager
      filter FILTER_TACTICS end_filter
   end_track_manager

   comm cmdr_net RED_DATALINK
      network_name <local:slave>
      internal_link data_mgr
      internal_link task_mgr
   end_comm

   comm sub_net RED_DATALINK
      network_name <local:master>
      internal_link data_mgr
      internal_link task_mgr
   end_comm

   zone full_kinematic
      circular
         maximum_altitude 30 km
         maximum_radius   25 nm
   end_zone

   processor data_mgr WSF_TRACK_PROCESSOR
      purge_interval 60 seconds
   end_processor

   processor task_mgr LARGE_SAM_BATTALION_TASK_MGR
   end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, category, infrared_signature, optical_signature, radar_signature, track_manager, comm, zone, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, mover, weapon, processor, route, execute, radar_signature, infrared_signature, optical_signature, 平台类型
- **出处**：`alternate_locations/platforms/ucav.txt:17-55`
- **片段**：

```text
platform_type UCAV WSF_PLATFORM 
   icon UCAV
   
   mover WSF_AIR_MOVER 
      maximum_radial_acceleration 1.5 g
      at_end_of_path remove
   end_mover
   
   weapon blue_gps_bomb_1 BLUE_GPS_BOMB_1 
      quantity 2
   end_weapon
   
   weapon blue_glide_bomb_1 BLUE_GLIDE_BOMB_1 
      quantity 6
   end_weapon
   
   processor fire-em UCAV_WEAPON_RELEASE 
   end_processor
   
   # routes are offsets from the chosen start position
   route
      offset 0 0 nm altitude 35000 ft
      speed 480 kts
      offset 133 0 nm altitude 35000.00 ft
      offset 11 15 nm altitude 35000.00 ft
      offset 0 15 nm altitude 35000.00 ft
      offset -11 15 nm altitude 35000.00 ft
      offset -133 0 nm altitude 35000.00 ft
   end_route
   
   # enables platform to move "instantaneously" to full-speed
   execute at_time 1 s absolute 
      PLATFORM.GoToSpeed(247,247,true);
   end_execute
   
   radar_signature UCAV_RADAR_SIG
   infrared_signature UCAV_INFRARED_SIG
   optical_signature UCAV_OPTICAL_SIG
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, mover, weapon, processor, route, execute, radar_signature, infrared_signature, optical_signature

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, infrared_signature, optical_signature, radar_signature, processor, comm, mover, weapon, sensor, 平台类型
- **出处**：`wargame/platforms/bomber.txt:18-57`　（同签名共 2 处，另见 `wargame/platforms/fighter.txt:18`）
- **片段**：

```text
platform_type BOMBER WSF_PLATFORM
   icon bomber
   
   infrared_signature BOMBER_INFRARED_SIG
   optical_signature BOMBER_OPTICAL_SIG
   radar_signature BOMBER_RADAR_SIG
    
   processor data_mgr WSF_TRACK_PROCESSOR
      purge_interval       60 sec
      internal_link task_mgr
   end_processor
  
   processor task_mgr WSF_TASK_PROCESSOR
   end_processor
    
   comm cmdr_net TEAM_DATALINK
      network_name <local:slave>
      internal_link data_mgr
      internal_link task_mgr
   end_comm

   mover WSF_AIR_MOVER 
      maximum_speed 700 mph
      maximum_altitude 50000 ft
      minimum_altitude 1000 ft
      maximum_turn_rate 180 deg/min
   end_mover
   
   weapon atg ATG
      quantity 6
   end_weapon
    
   sensor BomberSensor BOMBER_RADAR
      on
      ignore_same_side
      internal_link data_mgr
   end_sensor    
   
   
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, infrared_signature, optical_signature, radar_signature, processor, comm, mover, weapon, sensor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, side, command_chain, mover, radar_signature, comm, weapon, sensor, processor, 平台类型
- **出处**：`electronic_warfare/simple_auto_jamming.txt:306-347`
- **片段**：

```text
platform_type JAMMER_PLATFORM WSF_PLATFORM
   icon EA-6B
   side blue

   command_chain blue SELF

   mover WSF_AIR_MOVER end_mover
   radar_signature WIDE_BODY_SIGNATURE

   comm blue_net BLUE_DATALINK
      network_name <local:master>
#      internal_link blue_data_mgr
   end_comm

   weapon jammer JAMMER
      pitch   -10 deg                  // Aim jammer slightly toward the ground
   end_weapon

   sensor esm ESM_SENSOR
      on
      internal_link data_mgr
      ignore_same_side
   end_sensor

   //processor bluetracker BLUE_TRACK_PROCESSOR
   //end_processor

   processor data_mgr WSF_TRACK_PROCESSOR
     purge_interval   20.0 sec
   end_processor
#
#   processor blue_data_mgr WSF_TRACK_PROCESSOR
#      purge_interval 60.0 sec
#      report_interval 5.0 sec
#      report_method batch
#      circular_report_rejection on
#      external_link peers via blue_net
#   end_processor

   processor task_mgr JAMMER_TASK_MGR
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, command_chain, mover, radar_signature, comm, weapon, sensor, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, commander, weapon, quantity, processor, script_variables, internal_link, purge_interval, sensor, 平台类型
- **出处**：`gun_engagement/platforms/gun_battery.txt:16-61`
- **片段**：

```text
platform_type GUN_BATTERY WSF_PLATFORM
  icon  aaa
  commander SELF
  weapon gun $<BULLET_NAME:BULLET>$

    quantity 200
  end_weapon

  processor gun_task_processor GUN_BATTERY_TACTICS

    script_variables
      SENSOR_NAME               = "test_sensor";
      SENSOR_TRACK_MODE         = "default";
      WEAPON_NAME               = "gun";
      SALVO_SIZE                = 10;
      MAX_RANGE                 = 2000; # dont even try to shoot farther
    end_script_variables
  end_processor

  processor track_mgr WSF_TRACK_PROCESSOR
    internal_link gun
    purge_interval       60 sec
  end_processor

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
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, commander, weapon, quantity, processor, script_variables, internal_link, purge_interval, sensor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, side, mover, script_variables, double, string, script, if, processor, 平台类型
- **出处**：`outer_air_battle/platforms/TIMED_STATION_AC.txt:21-74`
- **片段**：

```text
platform_type TIMED_STATION_AC WSF_PLATFORM

  icon F-15
  side BLUE

#  The AIR_MOVER needs to be defined, so the route commands are recognized
#  later.
  mover WSF_AIR_MOVER end_mover


# These are the default values for the user variables.
# Values assigned at instatiation overwrite these values.
  script_variables
    double time_before_refueling  = 1000.0;
    double total_station_time     = 3000.0;
    string refuel_waypoint_label  = "cap_refuel";
    string go_home_waypoint_label = "go_home";
  end_script_variables



#  This script is defined here, instead of in the processor, because it is
#  "called" by the aircraft, as part of the route.

  script void OnStation()
#  This script sets the ON_STATION_TIME variables
#  The two variables are checked each time because this script might be called
#  each time the aircraft goes around the orbit. The check prevents the
#  variables from being reset every time.

#   If this is the first time that the aircraft has hit this CAP station,
#   then set the flag for "on CAP".
    if ( PLATFORM.AuxDataDouble("NOW_ON_CAP") < 0.0 )
      {
        PLATFORM.SetAuxData("NOW_ON_CAP", TIME_NOW);
      }

#   If the aircraft is just arriving at this CAP station, then set the flag.
    if ( PLATFORM.AuxDataDouble("ON_STATION_TIME") < 0.0 )
      {
        PLATFORM.SetAuxData("ON_STATION_TIME", TIME_NOW);
      }
  end_script # OnStation




# This processor manages the station timing
  processor station_timer STATION_TIMER

  end_processor # station_timer


end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, mover, script_variables, double, string, script, if, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, infrared_signature, optical_signature, radar_signature, mover, comm, processor, purge_interval, update_interval, 平台类型
- **出处**：`bearing_only/platforms/commander_platform.txt:17-75`
- **片段**：

```text
platform_type COMMANDER_PLATFORM WSF_PLATFORM
  icon mig-21

  infrared_signature    VEHICLE_INFRARED_SIGNATURE
  optical_signature     VEHICLE_OPTICAL_SIGNATURE
  radar_signature       VEHICLE_RADAR_SIGNATURE
   mover WSF_AIR_MOVER
     maximum_radial_acceleration 1.1 g  # make smooth transitions
     maximum_linear_acceleration 1.5 g
     maximum_climb_rate           10 ft/sec
   end_mover

  comm sub_net RED_DATALINK
     network_name <local:master>
     internal_link data_mgr
     internal_link task_mgr
  end_comm

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


  processor data_mgr WSF_TRACK_PROCESSOR
    purge_interval       60 sec
    update_interval 5 secs
  end_processor

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


end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, infrared_signature, optical_signature, radar_signature, mover, comm, processor, purge_interval, update_interval

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, side, comm, processor, number_of_servers, script, evaluation_interval, state, time_to_evaluate, 平台类型
- **出处**：`cyber/platforms/cyber_outpost.txt:14-76`
- **片段**：

```text
platform_type CYBER_OUTPOST WSF_PLATFORM
   icon c4i
   side red
   
   comm datalink RED_DATALINK
     network_name <local:master>
     internal_link data_mgr
     internal_link task_mgr
   end_comm
   
   processor data_mgr WSF_TRACK_PROCESSOR
      purge_interval 60 s
   end_processor
   
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
   
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, comm, processor, number_of_servers, script, evaluation_interval, state, time_to_evaluate

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, infrared_signature, optical_signature, radar_signature, comm, processor, include, script_variables, execute, 平台类型
- **出处**：`aea_iads/platforms/iads_cmdr.txt:129-195`
- **片段**：

```text
platform_type IADS_CMDR WSF_PLATFORM
   icon C4I

   infrared_signature    VEHICLE_INFRARED_SIGNATURE
   optical_signature     VEHICLE_OPTICAL_SIGNATURE
   radar_signature       VEHICLE_RADAR_SIGNATURE

   comm sub_net RED_DATALINK
      network_name <local:master>
      internal_link data_mgr
      internal_link task_mgr
   end_comm

   processor data_mgr IADS_CMDR_DATA_MGR
   end_processor

   processor task_mgr IADS_CMDR_TASK_MGR
      operating_level ENGAGE 1
   end_processor

   include processors/commander_track_manager$(TRACKER_TYPE).txt

/*
   # ---------------------------------------------
   # Draw track to false targets and real targets
   # ---------------------------------------------
   script_variables
      # Create a WsfDraw object.
      WsfDraw draw = WsfDraw();
   end_script_variables

   execute at_interval_of 10.0 s
      foreach (WsfTrack track in MasterTrackList())
      {
         if (track.IsValid())
         {
            # use the track ID as a unique draw ID
            # a track icon and a line to the track icon
            # is drawn at each track update
            string trackId = track.TrackId().ToString();
            draw.SetId(trackId);
            draw.SetDuration(10.0); # this is faster than calling erase every time

            if (track.IsFalseTarget())
            {
               draw.SetColor(0,1,0);
               draw.BeginIcons(track.Heading(), "Wedge");
            }
            else
            {
               draw.SetColor(0,0,1);
               draw.BeginIcons(track.Heading(), "Wedge");
            }
            draw.Vertex(track.CurrentLocation());
            draw.End();

            # Draw a line to the track
            draw.SetLineStyle("dashed");
            draw.BeginLines();
            draw.Vertex(PLATFORM);
            draw.Vertex(track.CurrentLocation());
            draw.End();
         }
      }
   end_execute
*/
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, infrared_signature, optical_signature, radar_signature, comm, processor, include, script_variables, execute

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, radar_signature, infrared_signature, optical_signature, spatial_domain, side, icon, category, sensor, processor, 平台类型
- **出处**：`six_dof/platforms/sam-mr.txt:77-144`
- **片段**：

```text
platform_type  SAM-MR  WSF_PLATFORM

   radar_signature    SIMPLE_FIGHTER_RCS
   infrared_signature SIMPLE_FIGHTER_IR_SIG
   optical_signature  SIMPLE_FIGHTER_OPTICAL_SIG
   spatial_domain     air
   side               green
   icon               aim120b
   category           weapon

   # This is a generic/simple geometric seeker
   sensor missile_seeker SIMPLE_GENERIC_SEEKER
      on
      category       missile_seeker
      internal_link  data_mgr
      internal_link  seeker_activation
   end_sensor
   
   processor guidance WSF_SIX_DOF_GUIDANCE_COMPUTER

      update_interval 0.01 sec

      phase LAUNCH_GUIDANCE
         time_constant                   0.1 sec
         proportional_navigation_gain    0
         velocity_pursuit_gain           0
         g_bias                          0
         next_phase MIDCOURSE when phase_time > 3 sec
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
         velocity_pursuit_gain           10
         g_bias                          3
      end_phase

   end_processor

   processor data_mgr WSF_TRACK_PROCESSOR
      on
      master_track_processor
      update_interval 0.01 sec
      purge_interval  1 sec
   end_processor

   processor fuse WSF_AIR_TARGET_FUSE
      use_current_target
      update_interval           0.1 sec
      fine_update_interval      0.05 sec
      gross_proximity_range     500 ft
      detonate_below_height_agl 20.0 ft
      detonate_below_height_msl 20.0 ft
      maximum_time_of_flight    600.0 sec
   end_processor
   
   processor seeker_activation verbose_seeker_activation
   end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：radar_signature, infrared_signature, optical_signature, spatial_domain, side, icon, category, sensor, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, infrared_signature, optical_signature, radar_signature, aux_data, processor, sensor, weapon, mover, 平台类型
- **出处**：`iads_c2_demos/platforms/ucav.txt:21-94`
- **片段**：

```text
platform_type UCAV WSF_PLATFORM
  icon UCAV

  infrared_signature UCAV_INFRARED_SIG
  optical_signature  UCAV_OPTICAL_SIG
  radar_signature    UCAV_RADAR_SIG

  aux_data
     string TARGET_SUBTYPE = "ucav"
  end_aux_data

  processor image_proc WSF_IMAGE_PROCESSOR
     debug
     internal_link data_mgr
  end_processor

  sensor esm UCAV_ESM
     on
     internal_link data_mgr
     ignore_same_side
  end_sensor

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

   sensor sar_right SAR_RADAR
      off
      yaw        60 deg
      pitch     -10 deg
      aux_data
         double min_frequency_band_hz = 8e9
         double max_frequency_band_hz = 12e9
         double pref_az_aspect1_deg   = 50
         double pref_az_aspect2_deg   = 85
      end_aux_data
      internal_link image_proc
      ignore_same_side
   end_sensor

  weapon blue_gps_bomb_2 BLUE_GPS_BOMB_2
     quantity 1
  end_weapon

  weapon blue_gps_bomb_1 BLUE_GPS_BOMB_1
     quantity 2
  end_weapon

  weapon blue_glide_bomb_1 BLUE_GLIDE_BOMB_1
     quantity 6
  end_weapon

  mover WSF_AIR_MOVER
     default_radial_acceleration 1.5 g
     at_end_of_path remove
  end_mover

  processor data_mgr WSF_TRACK_MANAGER
     purge_interval   60.0 sec
  end_processor

  processor task_mgr WSF_TASK_PROCESSOR
  end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, infrared_signature, optical_signature, radar_signature, aux_data, processor, sensor, weapon, mover

### platform_type（lte_fighter）｜平台类型

- **关键词**：platform_type, icon, include, radar_signature, mover, fuel, weapon, comm, sensor, processor, 平台类型
- **出处**：`air_to_air/platforms/lte_fighter.txt:34-123`
- **片段**：

```text
platform_type  LTE_FIGHTER  BRAWLER_TEST
   icon f15c
   include prdata/blue.txt

   radar_signature 10dB_FuzzBall
#script_variables 
#      no_tree = true;
#end_script_variables
   mover WSF_BRAWLER_MOVER
      aero_file platforms/fxw/lte_fighter.fxw
      update_time_tolerance 0.01 s
   end_mover

   fuel WSF_BRAWLER_FUEL
      aero_file platforms/fxw/lte_fighter.fxw
      initial_quantity_ratio 1.0
   end_fuel

   weapon fox3 MEDIUM_RANGE_RADAR_MISSILE # fox 3 (MRM)
      quantity 6
   end_weapon

   weapon fox2 SHORT_RANGE_IR_MISSILE # fox 2 (SRM)
      quantity 2
   end_weapon

   weapon fox1 SHORT_RANGE_IR_MISSILE # fox 1 (other)
      quantity 0
   end_weapon
   
   weapon agm SHORT_RANGE_IR_MISSILE # air-to-ground missile, use SRM just to populate something
      quantity 0
   end_weapon

   comm weapon_datalink WSF_COMM_TRANSCEIVER      // uplink to weapons
      network_name weapons_subnet
      internal_link data_mgr
   end_comm

   sensor rdr1 aesa  
      on
      internal_link raw_data_mgr
      internal_link data_mgr
      ignore missile
   end_sensor

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
  
    sensor rwr esm                       // 3
      on
      ignore IGNORE
      ignore_same_side
      internal_link raw_data_mgr
      internal_link data_mgr      
   end_sensor

   processor radar_track_cueing SENSOR_CUE_PROCESSOR
      script_variables 
         mSourceSensorNames.Insert("*");
         mCuedSensorName = "rdr1";
         mTrackModeName = "TWS";
      end_script_variables
   end_processor

   processor weapon_datalink_manager WEAPON_DL_MANAGER
      script_variables 
         mUplinkSensorNames.PushBack("rdr1");
      end_script_variables
   end_processor
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：icon, include, radar_signature, mover, fuel, weapon, comm, sensor, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, indestructible, category, radar_signature, comm, mover, processor, weapon, fuel, sensor, 平台类型
- **出处**：`timeline_lead/platforms/striker.txt:25-119`
- **片段**：

```text
platform_type  STRIKER  WSF_PLATFORM

   indestructible
  #icon     F-22 / SU-27
  #side     blue / red

   category fighter
   radar_signature SIG_RADAR_ONE_M_SQUARED

   comm cmdr_net FINITE_DATALINK
      network_name <local:slave>
      internal_link data_mgr
      internal_link timeline_proc
      internal_link perception
   end_comm

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

   processor data_mgr WSF_TRACK_PROCESSOR
      purge_interval             60 sec
      report_interval            1 sec
      fused_track_reporting      on
      raw_track_reporting        off
      report_to commander        via   cmdr_net to sub_net
      circular_report_rejection  true
   end_processor

   weapon  mrm  MEDIUM_RANGE_RADAR_MISSILE
      quantity 4
   end_weapon

   fuel WSF_FUEL
      consumption_rate     7 lb/s
      initial_quantity 14000 lb     #~33 minutes, at this consumption rate
      maximum_quantity 14000 lb
      bingo_quantity    1000 lb
   end_fuel

   processor timeline_proc TIMELINE_PROC
   end_processor

   processor perception WSF_PERCEPTION_PROCESSOR
      on
      script_debug_writes  off
      report_interval      10 sec
      reporting_self       true
      #report_to            commander:peers via cmdr_net
      report_to commander via cmdr_net to sub_net
      report_to peers via cmdr_net
      asset_perception     status_messages
   end_processor

   processor incoming_threats WSF_THREAT_PROCESSOR
      update_interval 0.2 sec
      threat_velocity 668.7778 m/s
     #threat_angle_spread 30.0 deg
      threat_angle_spread 20.0 deg
     #threat_time_to_intercept 60 sec
      threat_time_to_intercept 5 sec
   end_processor

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
      internal_link timeline_proc
      ignore_same_side
      ignore_domain land
   end_sensor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：indestructible, category, radar_signature, comm, mover, processor, weapon, fuel, sensor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, category, radar_signature, mover, commander, sensor, comm, script, execute, 平台类型
- **出处**：`satellite_demos/platforms/gps.txt:20-128`
- **片段**：

```text
platform_type GPS WSF_PLATFORM
  icon satellite
  category GPS
  radar_signature GPS_RADAR_SIG
   mover WSF_SPACE_MOVER
      update_interval 10 sec
   end_mover

   commander SELF

   sensor optical WSF_GEOMETRIC_SENSOR
      off
      frame_time 10 sec
      ignore GPS
      reports_location
      modifier_category cloud_mod
   end_sensor

  comm GPS_DOWNLINKL1_TX GPS_DOWNLINKL1_TX
     location  394 0 1600 mm   # ref 1, location given for IIF Satellites
     on
     network_name GPS_Net
  end_comm

  comm GPS_UPLINKL1_RX GPS_UPLINKL1_RX
     location  394 0 1600 mm   # ref 1, location given for IIF Satellites
     on
     network_name GPS_Net
  end_comm

  comm GPS_DOWNLINKL2_TX GPS_DOWNLINKL2_TX
     location  394 0 1600 mm   # ref 1, location given for IIF Satellites
     on
     network_name GPS_Net
  end_comm

  comm GPS_UPLINKL2_RX GPS_UPLINKL2_RX
     location  394 0 1600 mm   # ref 1, location given for IIF Satellites
     on
     network_name GPS_Net
  end_comm

  comm GPS_DOWNLINKL3_TX GPS_DOWNLINKL3_TX
     location  394 0 1600 mm   # ref 1, location given for IIF Satellites
     on
     network_name GPS_Net
  end_comm

  comm GPS_DOWNLINKL5_TX GPS_DOWNLINKL5_TX
     location  394 0 1600 mm   # ref 1, location given for IIF Satellites
     on
     network_name GPS_Net
  end_comm

  comm GPS_UPLINKL5_RX GPS_UPLINKL5_RX
     location  394 0 1600 mm   # ref 1, location given for IIF Satellites
     on
     network_name GPS_Net
  end_comm

   script void SendMessage()
      for (int i = 1; i <= WsfSimulation.PlatformCount(); i = i + 1)
      {
         WsfPlatform myPlatform = WsfSimulation.FindPlatform(i);
         if(myPlatform.IsValid())
         {
            if ((myPlatform.Type() != "GPS") && myPlatform.IsValid() && myPlatform.Comm("GPS_UPLINKL1_RX").IsValid())   # Make sure we are not trying to talk to ourselves!
            {
               WsfMessage myMessage = WsfMessage();
               myMessage.SetAuxData("Your location is ", myPlatform.Location());
               PLATFORM.Comm("GPS_DOWNLINKL1_TX").SendMessage(myMessage, myPlatform.Comm("GPS_UPLINKL1_RX"));
            }
            if ((myPlatform.Type() != "GPS") && myPlatform.IsValid() && myPlatform.Comm("GPS_UPLINKL2_RX").IsValid())
            {
               WsfMessage myMessage = WsfMessage();
               myMessage.SetAuxData("Your location is ", myPlatform.Location());
               PLATFORM.Comm("GPS_DOWNLINKL2_TX").SendMessage(myMessage, myPlatform.Comm("GPS_UPLINKL2_RX"));
            }
            if ((myPlatform.Type() != "GPS") && myPlatform.IsValid() && myPlatform.Comm("GPS_UPLINKL5_RX").IsValid())
            {
               WsfMessage myMessage = WsfMessage();
               myMessage.SetAuxData("Your location is ", myPlatform.Location());
               PLATFORM.Comm("GPS_DOWNLINKL5_TX").SendMessage(myMessage, myPlatform.Comm("GPS_UPLINKL5_RX"));
            }
         }
      }
   end_script

   script void CheckComms()
      if(PLATFORM.IsValid())
      {
      WsfComm commDL1 = PLATFORM.Comm("GPS_DOWNLINKL1_TX");
      WsfComm commDL2 = PLATFORM.Comm("GPS_DOWNLINKL2_TX");
      WsfComm commDL5 = PLATFORM.Comm("GPS_DOWNLINKL5_TX");
      if(commDL1.IsValid() && commDL2.IsValid() && commDL5.IsValid())
      {
         if (commDL1.IsTurnedOn() || commDL2.IsTurnedOn() || commDL5.IsTurnedOn())
         {
            SendMessage();
         }
      }
      }
   end_script

   execute at_interval_of 100 s
      CheckComms();
   end_execute

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, category, radar_signature, mover, commander, sensor, comm, script, execute

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, radar_signature, infrared_signature, optical_signature, spatial_domain, side, icon, category, mover, 平台类型
- **出处**：`p6dof/platforms/aam-sr-tvc.txt:19-35`　（同签名共 7 处，另见 `six_dof/platforms/aam-mr.txt:45`、`p6dof/platforms/aam-mr.txt:19`、`p6dof/platforms/aam-sr.txt:19`）
- **片段**：

```text
platform_type  AAM-SR-TVC-TEST  WSF_PLATFORM

   radar_signature       SIMPLE_FIGHTER_RCS
   infrared_signature    SIMPLE_FIGHTER_IR_SIG
   optical_signature     SIMPLE_FIGHTER_OPTICAL_SIG
   spatial_domain        air
   side                  green
   icon                  aim9x
   category              weapon

   # Setup the P6DOF mover
   mover WSF_P6DOF_MOVER
      p6dof_object_type AAM-SR-TVC
      update_interval   0.01 sec
   end_mover

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：radar_signature, infrared_signature, optical_signature, spatial_domain, side, icon, category, mover

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, category, infrared_signature, optical_signature, radar_signature, comm, processor, sensor, 平台类型
- **出处**：`bearing_only/platforms/geometric_bearing_only_sensor_platform.txt:12-39`
- **片段**：

```text
platform_type GEOMETRIC_BEARING_ONLY_SENSOR_PLATFORM WSF_PLATFORM
  icon ew_radar_icon
  category 2D_RADAR
  infrared_signature   VEHICLE_INFRARED_SIGNATURE
  optical_signature    VEHICLE_OPTICAL_SIGNATURE
  radar_signature      VEHICLE_RADAR_SIGNATURE

  comm datalink RED_DATALINK
     network_name <local:slave>
     internal_link task_mgr
  end_comm

  processor task_mgr WSF_TASK_PROCESSOR
  end_processor

  processor data_mgr WSF_TRACK_PROCESSOR
     report_to commander via datalink to sub_net
     report_interval      2 sec
     raw_track_reporting on
  end_processor

  sensor geometric_bearing_only_sensor GEOMETRIC_BEARING_ONLY_SENSOR
     on
     internal_link data_mgr
     ignore_same_side
  end_sensor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, category, infrared_signature, optical_signature, radar_signature, comm, processor, sensor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, side, infrared_signature, optical_signature, radar_signature, comm, processor, sensor, 平台类型
- **出处**：`cyber/platforms/ground_radar.txt:14-42`
- **片段**：

```text
platform_type GROUND_RADAR WSF_PLATFORM
  icon Ground_Radar
  side red
  
  infrared_signature   VEHICLE_INFRARED_SIGNATURE
  optical_signature    VEHICLE_OPTICAL_SIGNATURE
  radar_signature      VEHICLE_RADAR_SIGNATURE

  comm datalink RED_DATALINK
     network_name <local:slave>
     internal_link data_mgr
  end_comm
  
  comm datalink2 RED_DATALINK
     network_name <local:master>
     internal_link data_mgr
  end_comm

  processor data_mgr WSF_TRACK_PROCESSOR
      report_to commander via datalink
  end_processor

  sensor ground_radar GROUND_RADAR
     on
     internal_link data_mgr
     ignore_same_side
  end_sensor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, infrared_signature, optical_signature, radar_signature, comm, processor, sensor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, infrared_signature, optical_signature, radar_signature, mover, comm, processor, sensor, 平台类型
- **出处**：`wargame/platforms/sensor_drone.txt:15-55`
- **片段**：

```text
platform_type SENSOR_DRONE WSF_PLATFORM 
   icon awacs
   
   infrared_signature AIR_TARGET_INFRARED_SIGNATURE
   optical_signature AIR_TARGET_OPTICAL_SIGNATURE
   radar_signature AIR_TARGET_RADAR_SIGNATURE
   
   mover WSF_AIR_MOVER 
      maximum_speed 1400 mph
      maximum_altitude 50000 ft
      minimum_altitude 500 ft
      maximum_turn_rate 360 deg/min
   end_mover
   
   comm sub_net TEAM_DATALINK
      network_name <local:master>
      internal_link data_mgr
      internal_link task_mgr
   end_comm
    
   comm cmdr_net TEAM_DATALINK
      network_name <local:slave>
      internal_link data_mgr
      internal_link task_mgr
   end_comm
   
   processor task_mgr WSF_TASK_PROCESSOR
   end_processor
   
   processor data_mgr WSF_TRACK_PROCESSOR
      purge_interval       60 sec
      internal_link task_mgr
   end_processor
   
   sensor DroneSensor DRONE_SENSOR
     on
     internal_link data_mgr
     ignore_same_side
   end_sensor
   
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, infrared_signature, optical_signature, radar_signature, mover, comm, processor, sensor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, category, infrared_signature, optical_signature, radar_signature, track_manager, comm, processor, 平台类型
- **出处**：`space_operations/platforms/blue_naval_sam_battery.txt:11-52`　（同签名共 2 处，另见 `ballistic_missile_shootdown/platforms/blue_naval_sam_battery.txt:11`）
- **片段**：

```text
platform_type BLUE_NAVAL_SAM_BATTERY WSF_PLATFORM
   icon close-sam_cdr
   category ENGAGEMENT

   infrared_signature    VEHICLE_INFRARED_SIGNATURE
   optical_signature     VEHICLE_OPTICAL_SIGNATURE
   radar_signature       VEHICLE_RADAR_SIGNATURE

   track_manager
      filter FILTER_TACTICS end_filter
   end_track_manager

   comm cmdr_net DATALINK
      network_name <local:slave>
      internal_link data_mgr
      internal_link task_mgr
   end_comm

   comm sub_net DATALINK
      network_name <local:master>
      internal_link data_mgr
      internal_link task_mgr
   end_comm

#   zone full_kinematic
#      circular
#         maximum_altitude 30 km
#         maximum_radius   25 nm
#   end_zone

   processor data_mgr WSF_TRACK_PROCESSOR
      purge_interval 60 seconds
   end_processor

   processor task_mgr ANTI_BALLISTIC_MISSILE_PROCESSOR
      show_state_transitions
      on_initialize
         WEAPON_NAME              =  "blue_naval_sam";
      end_on_initialize
   end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, category, infrared_signature, optical_signature, radar_signature, track_manager, comm, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, mover, radar_signature, sensor, script_variables, on_initialize, execute, processor, 平台类型
- **出处**：`electronic_warfare/esm_detect_radar2.txt:152-207`
- **片段**：

```text
platform_type ESM_PLATFORM WSF_PLATFORM
   icon EA-6B
   mover WSF_AIR_MOVER end_mover
   radar_signature WIDE_BODY_SIGNATURE

   sensor esm ESM_SENSOR
      internal_link track_manager
      ignore_same_side
   end_sensor

   script_variables
      double mAzCue = 0.0;
      double mElCue = 0.0;

      double mDeltaAz = 1;
      double mDeltaEl = 1;
   end_script_variables

   on_initialize
      WsfSensor sensor = PLATFORM.Sensor("esm");
      mAzCue = sensor.SlewMinimumAzimuth();
      mElCue = sensor.SlewMinimumElevation();
   end_on_initialize

   execute at_interval_of 0.2 sec
      WsfSensor sensor = PLATFORM.Sensor("esm");

      if (mAzCue >= sensor.SlewMaximumAzimuth())
      {
         # got to end of azimuth scan
         #writeln("END_AZ");
         mAzCue = sensor.SlewMinimumAzimuth();
         if (mElCue >= sensor.SlewMaximumElevation())
         {
            # got to end of elevation scan
            #writeln(mAzCue, ":", mElCue);
            #writeln("END EL");
            mElCue = sensor.SlewMinimumElevation();
         }
         else
         {
            mElCue = mElCue + mDeltaEl;
         }
      }
      else
      {
         mAzCue = mAzCue + mDeltaAz;
      }
      #writeln(mAzCue, ":", mElCue);
      sensor.CueToAzEl(mAzCue, mElCue);
   end_execute

   processor track_manager WSF_TRACK_PROCESSOR
     purge_interval   20.0 sec
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, mover, radar_signature, sensor, script_variables, on_initialize, execute, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, comm, on, azimuth_field_of_view, elevation_field_of_view, transmitter, receiver, sensor, 平台类型
- **出处**：`satellite_demos/platforms/iridium_gs.txt:16-78`
- **片段**：

```text
platform_type IRIDIUM_GS WSF_PLATFORM
   icon C4I

  comm GROUNDSTATION_IRIDIUM_UPLINK_TX WSF_RADIO_XMTR
   on

   azimuth_field_of_view                  -180.0 deg 180.0 deg
   elevation_field_of_view                   -90.0 deg  90.0 deg

   transmitter
      antenna_pattern                     UNIFORM_0DBI_PATTERN
      frequency                           29.2 ghz  # ref 1
      bandwidth                           195 mhz  # ref 1
      polarization                        right_circular  # ref 1
      power                               45 dbw
   end_transmitter

  end_comm

  comm GROUNDSTATION_IRIDIUM_DOWNLINK_RX WSF_RADIO_RCVR
   on

   azimuth_field_of_view                  -180.0 deg 180.0 deg
   elevation_field_of_view                   0.0 deg  90.0 deg

   receiver
      antenna_pattern                     UNIFORM_0DBI_PATTERN
      frequency                           19.5 ghz  # ref 1
      bandwidth                           195 mhz  # ref 1
   end_receiver

  end_comm

#=======================Uncomment this to send a test message to satellites=========================================
# execute at_interval_of 1 s
#      // Loop through all the platforms in the simulation
#      for (int i = 1; i <= WsfSimulation.PlatformCount(); i = i + 1)
#      {
#          WsfPlatform myPlatform = WsfSimulation.FindPlatform(i);
#          if ((myPlatform != PLATFORM) && myPlatform.IsValid())   # Make sure we are not trying to talk to ourselves!
#          {
#              WsfControlMessage myMessage = WsfControlMessage();
#              myMessage.SetFunction("This is a test");
#
#	              if (myPlatform.Type() == "IRIDIUM_SATELLITE")
#                 {
#                  PLATFORM.Comm("GROUNDSTATION_IRIDIUM_UPLINK_TX").SendUnicastMessage(myMessage, myPlatform);
#                 }
#
#          }
#       }
# end_execute
#=====================================================================================================================

   sensor detect WSF_GEOMETRIC_SENSOR
      on
      reports_location
      frame_time 1 min
      azimuth_field_of_view -180 deg 180 deg
      elevation_field_of_view -90 deg 90 deg
   end_sensor
#
 end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, comm, on, azimuth_field_of_view, elevation_field_of_view, transmitter, receiver, sensor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, infrared_signature, optical_signature, radar_signature, comm, processor, script_variables, execute, 平台类型
- **出处**：`electronic_warfare/test_false_targets/platforms/iads_cmdr.txt:130-193`
- **片段**：

```text
platform_type IADS_CMDR WSF_PLATFORM
   icon C4I

   infrared_signature    VEHICLE_INFRARED_SIGNATURE
   optical_signature     VEHICLE_OPTICAL_SIGNATURE
   radar_signature       VEHICLE_RADAR_SIGNATURE

   comm sub_net RED_DATALINK
      network_name <local:master>
      internal_link data_mgr
      internal_link task_mgr
   end_comm

   processor data_mgr IADS_CMDR_DATA_MGR
   end_processor

   processor task_mgr IADS_CMDR_TASK_MGR
      operating_level ENGAGE 1
   end_processor

   script_variables
      # Create a WsfDraw object.
      WsfDraw draw = WsfDraw();
   end_script_variables

   execute at_interval_of 10.0 s

      foreach (WsfTrack track in MasterTrackList())
      {
         if (track.IsValid())
         {
           if (track.IsFalseTarget())
           {
              //writeln("IADS ", track.TargetName(), "  ", track.Latitude(), "  ", track.Longitude()
              //        , "  ", track.Altitude());
              # use the track ID as a unique draw ID
              # a track icon and a line to the track icon
              # is drawn at each track update
              string trackId = track.TrackId().ToString();
              draw.SetId(trackId);
              draw.SetDuration(10.0); # this is faster than calling erase every time

              # Draw a track icon
              draw.SetColor(1,1,0);
              draw.SetPointSize(0.25);
              draw.SetLineSize(0.25);
              draw.BeginIcons(track.Heading(), "Wedge");
                 draw.Vertex(track.CurrentLocation());
              draw.End();

              //draw.SetLineStyle("solid");
              //draw.SetLineSize(3);

              # Draw a line to the track
              //draw.BeginLines();
              //   draw.Vertex(PLATFORM);
              //   draw.Vertex(track.CurrentLocation());
              //draw.End();
           }
         }
      }
   end_execute

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, infrared_signature, optical_signature, radar_signature, comm, processor, script_variables, execute

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, infrared_signature, optical_signature, radar_signature, weapon_effects, mover, processor, script, 平台类型
- **出处**：`engage/weapons/lrsam.txt:98-163`
- **片段**：

```text
platform_type LRSAM WSF_PLATFORM
   icon SA-10_Missile

  infrared_signature LRSAM_INFRARED_SIGNATURE
  optical_signature  LRSAM_OPTICAL_SIGNATURE
  radar_signature    LRSAM_RADAR_SIGNATURE

   weapon_effects LRSAM_LETHALITY

   mover LRSAM_MOVER
      #time_history_path .
      #show_status
   end_mover

   processor guidance LRSAM_GUIDANCE
      #show_status
      #show_evaluations
   end_processor

   processor seeker WSF_PERFECT_TRACKER
      update_interval 0.1 sec
   end_processor

   processor fuse WSF_AIR_TARGET_FUSE
      #max_time_of_flight_to_detonate   320 sec
      #coast_time_on_loss_of_target    4.0
      gross_proximity_range  100 km
      hit_proximity_range   90 km
   end_processor

   script void PrintAvailableGs()
      Array<double> results = PLATFORM.Mover().PropertyDouble("available_maneuvering_force");
      if (! results.Empty())
      {
         double force = results[0];
         double mass  = TotalMass();
         writeln("T=", TIME_NOW, " F=", force, " M=", mass,
                 " A=", Altitude(), " Mach=", MachNumber(),
                 " Gs=", force / mass / Earth.ACCEL_OF_GRAVITY());
      }
   end_script
/*
   script void on_weapon_target_engagement(WsfWeaponEngagement aEngagement,
                                           WsfPlatform         aTarget)
      double timeOfFlight = aEngagement.TimeSinceStarted();
      WsfGeoPoint launchLoc = aEngagement.WeaponLocationAtLaunch();
      WsfGeoPoint finalLoc  = PLATFORM.Location();
      double slantRange = launchLoc.SlantRangeTo(finalLoc);
      writeln(" ");
      writeln("  Time of flight: ", timeOfFlight);
      writeln("  Slant range   : ", slantRange);
      writeln("  Average speed : ", slantRange / timeOfFlight);
      writeln("  Current speed : ", PLATFORM.Speed());
      PrintAvailableGs();
   end_script
*/
#
#   script void on_platform_deleted()
#      PrintAvailableGs();
#   end_script

#   execute at_interval_of 5 secs
#      #PrintAvailableGs();
#   end_execute

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, infrared_signature, optical_signature, radar_signature, weapon_effects, mover, processor, script

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, category, fuel, mover, radar_signature, sensor, processor, weapon, 平台类型
- **出处**：`base_types/platforms/blue_multirole_fighter_1_base.txt:22-92`
- **片段**：

```text
platform_type BLUE_MULTIROLE_FIGHTER_1 WSF_PLATFORM

   icon F-18E
   category fighter

   fuel WSF_VARIABLE_RATE_FUEL
      rate 7.0 lb/s
      initial_quantity 14000 lb
      maximum_quantity 14000 lb
   end_fuel

   mover WSF_AIR_MOVER
      roll_rate_limit               1 rad/sec
      default_linear_acceleration   1.0 g
      default_radial_acceleration   6.5 g
      default_climb_rate            400 fps

      //old value
      //maximum_speed                 600.0 knots
      // Janes Reference, Max level speed: more than M1.8 (1160 kts)
      maximum_speed      1160.0 knots

      //old value
      //maximum_altitude              55000 ft
      //Combat Ceiling, Janes Reference
      maximum_altitude              50000 ft

      minimum_altitude              50 ft
      maximum_linear_acceleration   8 g
      #no_pitch
      at_end_of_path extrapolate
   end_mover

   radar_signature blue_multirole_fighter_3_radar_signature

   sensor blue_a2a_radar BLUE_A2A_RADAR
      //debug
      on
      internal_link track_manager
      ignore_same_side
   end_sensor

   sensor esm-1 BLUE_ESM
      //debug
      off
      internal_link track_manager
   end_sensor

   processor track_manager WSF_TRACK_PROCESSOR
      //debug
      purge_interval  60 sec
      update_interval 1 sec
   end_processor

   weapon int_missile SIMPLE_A2A_MISSILE_WEAPON end_weapon


//   weapon blue_lr_a2a_rf_missile BLUE_LR_A2A_RF_MISSILE
//      quantity 10
//   end_weapon
//   weapon blue_sr_a2a_ir_missile BLUE_SR_A2A_IR_MISSILE
//      quantity 2
//   end_weapon
//   weapon HARM2 HARM2_WEAPON
//      quantity 2
//   end_weapon
//   weapon JSOW JSOW_WEAPON
//      quantity 2
//   end_weapon

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, category, fuel, mover, radar_signature, sensor, processor, weapon

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, category, infrared_signature, optical_signature, radar_signature, mover, processor, comm, 平台类型
- **出处**：`base_types/weapons/ssm/blue_cruise_missile.txt:42-112`
- **片段**：

```text
platform_type BLUE_CRUISE_MISSILE WSF_PLATFORM
  icon CALCM
  category cruise-missile
  infrared_signature BLUE_CRUISE_MISSILE_INFRARED_SIGNATURE
  optical_signature BLUE_CRUISE_MISSILE_OPTICAL_SIGNATURE
  radar_signature BLUE_CRUISE_MISSILE_RADAR_SIGNATURE
  mover WSF_GUIDED_MOVER
     #show_status
     update_interval .5 sec
     integration_timestep 0.05 sec

     stage 1 # Booster
        initial_mass         550 lbs
        fuel_mass            440 lbs
        thrust               7418 lbf
        thrust_duration      12 sec
        aero                 BLUE_CRUISE_MISSILE_AERO
     end_stage

     stage 2 # Turbofan
        initial_mass         2650 lb
        fuel_mass            500 lb # guess
        thrust               696.9 lbf
        burn_rate            350 lb/hr
        aero                 BLUE_CRUISE_MISSILE_AERO
        thrust_delay         1.0 sec  # no idea how long before it fires off after the booster falls off...
     end_stage
  end_mover

  processor guidance WSF_GUIDANCE_COMPUTER
     #show_status
     #show_evaluations
     #debug
     guide_to_truth true # for testing

     phase LAUNCH
        commanded_altitude    5000 ft
        commanded_flight_path_angle 60 deg
        next_phase CRUISE when phase_time > 16 sec
     end_phase

     phase CRUISE
        commanded_altitude     500 ft agl
        commanded_speed        910 fps
        maximum_commanded_g    2 g
        next_phase TERMINAL    if target_slant_range < 1 miles
     end_phase

     phase TERMINAL
        commanded_speed        800 fps
        proportional_navigation_gain   40
        maximum_pitch_angle        90 deg
        maximum_commanded_g        10 g
     end_phase
  end_processor

  processor fuse WSF_GROUND_TARGET_FUSE
  end_processor

  comm uplink WSF_COMM_TRANSCEIVER
     internal_link data_mgr
  end_comm

  processor task_mgr WSF_TASK_PROCESSOR
  end_processor

  processor data_mgr WSF_TRACK_PROCESSOR
     purge_interval 4000 seconds
  end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, category, infrared_signature, optical_signature, radar_signature, mover, processor, comm

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, category, comm, sensor, processor, aux_data, script_variables, execute, 平台类型
- **出处**：`electronic_warfare/test_false_targets/platforms/large_sam_ttr.txt:16-91`
- **片段**：

```text
platform_type LARGE_SAM_TTR WSF_PLATFORM
   icon Flap_Lid
   category FIRE_CONTROL

   comm datalink RED_DATALINK
     network_name <local:slave>
     internal_link task_mgr
   end_comm

   sensor ttr TTR_RADAR
     off
     #debug
     #debug_scheduler
     internal_link data_mgr
     ignore_same_side
   end_sensor

   processor data_mgr WSF_LINKED_PROCESSOR
      report_to commander via datalink
   end_processor

   processor task_mgr WSF_TASK_PROCESSOR
      #show_state_transitions
      #show_task_messages
   end_processor

   aux_data
      double max_range = 64820 # meters = 35 nm
      double pk = .7
   end_aux_data

   script_variables
      # Create a WsfDraw object.
      WsfDraw draw = WsfDraw();
   end_script_variables

   execute at_interval_of 0.025 s

      foreach (WsfTrack track in MasterTrackList())
      {
         if (track.IsValid())
         {
           if (track.IsFalseTarget())
           {
              //writeln("TTR ", track.TargetName(), "  ", track.Latitude(), "  ", track.Longitude()
              //        , "  ", track.Altitude());
              # use the track ID as a unique draw ID
              # a track icon and a line to the track icon
              # is drawn at each track update
              string trackId = track.TrackId().ToString();
              draw.SetId(trackId);
              draw.SetDuration(0.25); # this is faster than calling erase every time

              # Draw a track icon
              draw.SetColor(1,0,0);
              draw.SetPointSize(0.25);
              draw.SetLineSize(0.25);
              //writeln("Heading: ", track.Heading(), " deg");
              draw.BeginIcons(track.Heading(), "Wedge");
                 draw.Vertex(track.CurrentLocation());
              draw.End();

              draw.SetLineStyle("solid");
              draw.SetLineSize(3);

              # Draw a line to the track
              draw.BeginLines();
                 draw.Vertex(PLATFORM);
                 draw.Vertex(track.CurrentLocation());
              draw.End();
           }
         }
      }
   end_execute

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, category, comm, sensor, processor, aux_data, script_variables, execute

### platform_type（lte_fighter）｜平台类型

- **关键词**：platform_type, icon, include, radar_signature, mover, weapon, comm, sensor, processor, 平台类型
- **出处**：`air_to_air/platforms/lte_fighter.txt:149-237`　（同签名共 2 处，另见 `air_to_air/platforms/lte_fighter.txt:260`）
- **片段**：

```text
platform_type AIR_MOVER_FIGHTER  BRAWLER_TEST_AIRMOVER
   icon f15c
   include prdata/blue.txt

   radar_signature 10dB_FuzzBall

   mover WSF_AIR_MOVER
#      aero_file platforms/fxw/lte_fighter.fxw
#      update_time_tolerance 0.01 s
   end_mover

   weapon fox3 MEDIUM_RANGE_RADAR_MISSILE # fox 3 (MRM)
      quantity 6
   end_weapon

   weapon fox2 SHORT_RANGE_IR_MISSILE # fox 2 (SRM)
      quantity 2
   end_weapon

   weapon fox1 SHORT_RANGE_IR_MISSILE # fox 1 (other)
      quantity 0
   end_weapon
   
   weapon agm SHORT_RANGE_IR_MISSILE # air-to-ground missile, use SRM just to populate something
      quantity 0
   end_weapon

   comm weapon_datalink WSF_COMM_TRANSCEIVER      // uplink to weapons
      network_name weapons_subnet
      internal_link data_mgr
   end_comm

   sensor rdr1 aesa  
      on
      internal_link raw_data_mgr
      ignore missile
   end_sensor

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
  
    sensor rwr esm                       // 3
      on
      ignore IGNORE
      ignore_same_side
      internal_link raw_data_mgr
   end_sensor

   processor radar_track_cueing SENSOR_CUE_PROCESSOR
      script_variables 
         mSourceSensorNames.Insert("*");
         mCuedSensorName = "rdr1";
         mTrackModeName = "TWS";
      end_script_variables
   end_processor

   processor weapon_datalink_manager WEAPON_DL_MANAGER
      script_variables 
         mUplinkSensorNames.PushBack("rdr1");
      end_script_variables
   end_processor
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：icon, include, radar_signature, mover, weapon, comm, sensor, processor

### platform_type（blue_adv_fighter_1_ripr）｜平台类型

- **关键词**：platform_type, delete, weapon, quantity, processor, sensor, update_interval, threat_velocity, threat_angle_spread, 平台类型
- **出处**：`base_types/platforms/blue_adv_fighter_1_ripr.txt:20-120`
- **片段**：

```text
platform_type blue_adv_fighter_1 BLUE_ADV_FIGHTER_1_BASE

  //use a longer range missile for this type
  //adjust missile ranges in int-thinker below to accomodate

  delete weapon int_missile

 #weapon int_missile SUPER_LONG_RANGE_MISSILE end_weapon
 #weapon int_missile SIMPLE_LONG_RANGE_MISSILE end_weapon
 #weapon aim9    SIMPLE_SHORT_RANGE_MISSILE end_weapon
 #weapon jdradm  SUPER_LONG_RANGE_MISSILE end_weapon

  weapon blue_lr_a2a_rf_missile SIMPLE_BLUE_LR_A2A_RF_MISSILE
    quantity 8
  end_weapon

#   edit weapon blue_sr_a2a_ir_missile
#      quantity 2
#   end_weapon
#   edit weapon jdradm
#      quantity 6
#   end_weapon

  //This is the code that lets the interceptor intercept
  processor int-thinker AIAI-thinker
     script_variables

        #mWeaponArray[0] = Map<string, Object>();
        #mWeaponArray[0].Set("name", "blue_sr_a2a_ir_missile");
        #mWeaponArray[0].Set("weapon", PLATFORM.Weapon("blue_sr_a2a_ir_missile"));
        #mWeaponArray[0].Set("rangeMin", 1000);
        #mWeaponArray[0].Set("rangeMax", 65000); // ~35 miles

         mWeaponArray[0] = Map<string, Object>();
         mWeaponArray[0].Set("name", "blue_lr_a2a_rf_missile");
         mWeaponArray[0].Set("weapon", PLATFORM.Weapon("blue_lr_a2a_rf_missile"));
         mWeaponArray[0].Set("rangeMin", 1000);
         mWeaponArray[0].Set("rangeMax", 111120); // ~60 miles
         mWeaponArray[0].Set("numActiveMax", 2); // how many weapons of this type can be in play simultaneously
         mWeaponArray[0].Set("AIR",  1);          // DOMAIN CAPABLE, yes, this weapon can hit air (default true)
         mWeaponArray[0].Set("LAND", 0);          // DOMAIN CAPABLE, no, this weapon can NOT hit land (default false)

/*
         mWeaponArray[1] = Map<string, Object>();
        #mWeaponArray[1].Set("name", "blue_lr_a2a_rf_missile");
        #mWeaponArray[1].Set("weapon", PLATFORM.Weapon("blue_lr_a2a_rf_missile"));
         mWeaponArray[1].Set("name", "jdradm");
         mWeaponArray[1].Set("weapon", PLATFORM.Weapon("jdradm"));
         mWeaponArray[1].Set("rangeMin", 9260);
        #mWeaponArray[1].Set("rangeMax", 111120); // ~60 miles
         mWeaponArray[1].Set("rangeMax", 296320); // ~160 miles
         mWeaponArray[1].Set("numActiveMax", 1); // how many weapons of this type can be in play simultaneously
*/
     end_script_variables
  end_processor

  sensor geo_sensor WSF_GEOMETRIC_SENSOR
     azimuth_field_of_view -180.0 degrees 180.0 degrees
     elevation_field_of_view -90.0 degrees 90.0 degrees
     //azimuth_field_of_view -60.0 degrees 60.0 degrees
     //elevation_field_of_view -30.0 degrees 30.0 degrees
     minimum_range 0 m
     #maximum_range 100000 m
     #maximum_range 138900 m #about 75 nm, 75% of missile range
     maximum_range 185200 m #about 100 nm
     on
     frame_time              0.5 sec
     reports_location
     reports_velocity
     reports_iff
     track_quality 1.0
     ignore_same_side
     internal_link track_manager
  end_sensor

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

end_platform_type
```

- **演示要点**：演示 platform_type 的参数：delete, weapon, quantity, processor, sensor, update_interval, threat_velocity, threat_angle_spread

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, category, radar_signature, comm, mover, processor, weapon, fuel, sensor, 平台类型
- **出处**：`timeline/platforms/striker.txt:30-136`　（同签名共 5 处，另见 `heatmap/platforms/striker.txt:29`、`behavior_tree/platforms/run_tree_striker.txt:36`、`heatmap/platforms/striker_pursuit.txt:25`）
- **片段**：

```text
platform_type  STRIKER  WSF_PLATFORM

  #indestructible
  #icon     F-22 / SU-27
  #side     blue / red

   category fighter
   radar_signature SIG_RADAR_ONE_M_SQUARED

   comm cmdr_net FINITE_DATALINK
      network_name <local:slave>
      internal_link data_mgr
      internal_link task_mgr
      internal_link perception
   end_comm

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

   processor data_mgr WSF_TRACK_PROCESSOR
      purge_interval             60 sec
      report_interval            1 sec
      fused_track_reporting      on
      raw_track_reporting        off
      report_to commander        via   cmdr_net to sub_net
      circular_report_rejection  true
   end_processor

   weapon  mrm  MEDIUM_RANGE_RADAR_MISSILE
      quantity 4
   end_weapon

   fuel WSF_FUEL
      consumption_rate     7 lb/s
      initial_quantity 14000 lb     #~33 minutes, at this consumption rate
      maximum_quantity 14000 lb
      bingo_quantity    1000 lb
   end_fuel

   processor  task_mgr  WSF_QUANTUM_TASKER_PROCESSOR
      #show_task_messages
      script_debug_writes  off
      update_interval 5 sec
      behavior_tree
         selector
            behavior_node  evade
            behavior_node  go_home
            behavior_node  escort
            behavior_node  grinder
            behavior_node  pursue_weapon_task_target
            behavior_node  planned_route
         end_selector
         behavior_node  engage_weapon_task_target
      end_behavior_tree
   end_processor

   processor perception WSF_PERCEPTION_PROCESSOR
      on
      script_debug_writes  off
      report_interval      10 sec
      reporting_self       true
      #report_to            commander:peers via cmdr_net
      report_to commander via cmdr_net to sub_net
      report_to peers via cmdr_net
      asset_perception     status_messages
   end_processor

   processor incoming_threats WSF_THREAT_PROCESSOR
      update_interval 0.2 sec
      threat_velocity 668.7778 m/s
     #threat_angle_spread 30.0 deg
      threat_angle_spread 20.0 deg
     #threat_time_to_intercept 60 sec
      threat_time_to_intercept 15 sec
   end_processor

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

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：category, radar_signature, comm, mover, processor, weapon, fuel, sensor

### platform_type（strike_platform）｜平台类型

- **关键词**：platform_type, icon, script_variables, edit, processor, fuel, mover, script, on_initialize2, 平台类型
- **出处**：`logistics/platforms/strike_platform.txt:16-131`
- **片段**：

```text
platform_type STRIKE_PLATFORM LOGISTICS_PLATFORM

   icon F-18

   script_variables
      WsfProcessor strikeController;
   end_script_variables

   edit processor exchanger

      edit container fuel_container
         commodity JP-8_FUEL
            maximum_mass_quantity 6200.0 kg
            maximum_mass_rate       12.0 kg/sec # fuel in 8.6 min
         end_commodity
         initial_mass_quantity 6200.0 kg # FULL (may edit later)
      end_container

      edit transactor fuel_requesting_transactor
          #debug
          hook_to_fuel true # tie this to fuel quantity!
          time_out_clock_interval  3.0 sec
      end_transactor

      edit container good_engine_container
         service ENGINE_REPAIR
            maximum_quantity 2.0
            service_interval 2 sec # Rediculously fast..., but will be constrained by provider.
         end_service
         initial_quantity 2.0
      end_container

      edit transactor repair_requesting_transactor
         #debug
         container_name good_engine_container
         is_receiver
         proximity_limit         300 m     # If the transacting platforms are more than this distance apart,
                                           # the transaction will not be allowed to take place.
         time_out_clock_interval  3.0 sec
      end_transactor

   end_processor

   processor strike_controller STRIKE_CONTROLLER
   end_processor

   fuel WSF_FUEL
      maximum_quantity 6200.0 kg
      initial_quantity 6200.0 kg
      consumption_rate 100 kg/hr
   end_fuel

   mover WSF_AIR_MOVER
      maximum_speed 200 kts
      minimum_speed  80 kts
      maximum_linear_acceleration 0.5 g
      maximum_radial_acceleration 0.5 g
      update_interval 5 sec
   end_mover

   script bool SP_Init()

      bool success = LP_Init();

      WsfProcessor p2 = PLATFORM.Processor("strike_controller");
      if (p2.IsValid())
      {
         Array<Object> p2args = Array<string>();
         p2args.PushBack(fuelContainer);
         p2args.PushBack(repairContainer);
         p2args.PushBack(fuelRequestTransactor);
         p2args.PushBack(repairRequestTransactor);
         p2args.PushBack(runSilent);

         bool rcOk = (bool)p2.Execute("SC_Init", p2args);

         if (! rcOk)
         {
            # Redundant Say("SC_Init() FAILED.");
            success = false;
         }
      }
      else
      {
         Say("Processor 'strike_controller' not found.");
         success = false;
      }

      if (success)
      {
         Say("SP_Init() succeeded.");
         isInitialized = true;
      }
      else
      {
         Say("SP_Init() FAILED.");
      }
      return success;

   end_script

   on_initialize2

      bool success = SP_Init();
      if (success)
      {
         Say("STRIKE_PLATFORM Initialize() succeeded.");
      }
      else
      {
         Say("STRIKE_PLATFORM Initialize() FAILED.");
      }

   end_on_initialize2

end_platform_type
```

- **演示要点**：演示 platform_type 的参数：icon, script_variables, edit, processor, fuel, mover, script, on_initialize2

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, category, icon, radar_signature, mover, comm, navigation_errors, processor, execute, 平台类型
- **出处**：`satellite_demos/scenarios/gps_denied.txt:68-203`
- **片段**：

```text
platform_type    DECOY_MISSILE       WSF_PLATFORM
   category DECOY_MISSILE
   icon mald
   radar_signature DECOY_MISSILE_RADAR_SIGNATURE

   mover WSF_GUIDED_MOVER
         update_interval 0.10 s
         integration_timestep 0.1 sec
         #debug
		   #show_status
         #show_trajectory
         stage 1 # Drop for 1 sec with folded wings
           aero               DECOY_MISSILE_WINGS_FOLDED_AERO
           pre_separation_coast_time 0.2 sec
         end_stage
         stage 2 # Open wings and fire off engine
         total_mass         250 lb
         fuel_mass          200 lb  # Guess 80% fuel
         thrust             800 Nt
         thrust_duration      100 min
         aero                DECOY_MISSILE_AERO
         end_stage
   end_mover

   comm GPS_UPLINKL1_RX WSF_RADIO_RCVR
      network_name GPS_Net
      azimuth_field_of_view                  -180.0 deg 180.0 deg
      elevation_field_of_view                   0.0 deg  90.0 deg

      receiver
         antenna_pattern                     SATELLITE_NADIR_CONE
         frequency                           1575.42 mhz
         bandwidth                           200 mhz
         noise_power                         -105.0 dbm
         detection_threshold                 3.0 dB
      end_receiver

      jamming_perception_threshold   3.0 dB
      jamming_perception_timeout     1.0 sec

   end_comm

   navigation_errors
      gps_status 1
      gps_degraded_multiplier 100
      gps_in_track_error 1 m
      gps_cross_track_error 1 m
      gps_vertical_error 1 m
      ins_accelerometer_bias_error 1 m/s^2
      ins_gyroscope_bias_error 1 deg/hr
      ins_random_walk_error 1 deg/sqrt-hr
      ins_vertical_error 1 m
   end_navigation_errors

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

            TimeLeft = 5200 - (PLATFORM.TimeSinceCreation()); # give time to get back to target. Change TimeLeft to 5200 - (PLATFORM.TimeSinceCreation()); to have the missles go to phase "OVER TARGET"
         end_on_entry

         next_phase OVER_TARGET if end_of_route
         next_phase TERMINAL1 if phase_time >=  /variable TimeLeft
         #next_phase TERMINAL when phase_time >= 100 min     # allow 9 minutes for target endpoint / ditchpoint
      end_phase

      phase OVER_TARGET
         on_entry
            SetAllowRouteFollowing(true);
            PLATFORM.SetRoute("final_route");
            SetCommandedMach(0.80);
            SetCommandedAltitude(11000);
            SetMaximumCommandedGees(10);
            TimeLeft = 5200 - (PLATFORM.TimeSinceCreation()); # give time to get back to target. Change TimeLeft to 5200 - (PLATFORM.TimeSinceCreation()); to have the missles go to phase "OVER TARGET"
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

   execute at_interval_of 1 sec
     if(PLATFORM.Comm("GPS_UPLINKL1_RX").JammingPerceived() == true)
     {
        PLATFORM.SetGPS_Status(-1); # GPS Not available; revert to INS errors.
#        writeln(PLATFORM.Name(),"'s location is ",PLATFORM.Location()," but believes it is at ",PLATFORM.PerceivedLocation());
     }
   end_execute

   processor fuse WSF_GROUND_TARGET_FUSE
      max_time_of_flight_to_detonate  100 min
      proximity_all_on_loss_of_target  # weapon keeps going even if target lost
   end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：category, icon, radar_signature, mover, comm, navigation_errors, processor, execute

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, mover, comm, sensor, weapon, processor, evaluation_interval, state, 平台类型
- **出处**：`laser_designator/platforms/uav.txt:13-202`
- **片段**：

```text
platform_type UAV WSF_PLATFORM
   icon predator
   mover WSF_AIR_MOVER 
      maximum_radial_acceleration 1.5 g
   end_mover
   comm  cmd_net WSF_COMM_TRANSCEIVER
      transfer_rate 100 mbits/sec
      network_name <local:slave>
      internal_link data_mgr
      internal_link task_mgr
   end_comm   
   sensor laser_tracker-1212 LASER_TRACKER-1212 
      internal_link data_mgr
      ignore_same_side 
   end_sensor
   weapon hellfire HELLFIRE 
      quantity 4      
   end_weapon
   processor data_mgr WSF_TRACK_PROCESSOR end_processor
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
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, mover, comm, sensor, weapon, processor, evaluation_interval, state

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, spatial_domain, side, icon, radar_signature, infrared_signature, optical_signature, mover, processor, 平台类型
- **出处**：`p6dof/platforms/agm-mrc.txt:32-233`
- **片段**：

```text
platform_type  AGM-MRC  WSF_PLATFORM

   spatial_domain        air
   side                  blue
   icon                  agm109
   radar_signature       SIMPLE_FIGHTER_RCS
   infrared_signature    SIMPLE_FIGHTER_IR_SIG
   optical_signature     SIMPLE_FIGHTER_OPTICAL_SIG

   # Setup the P6DOF mover
   mover WSF_P6DOF_MOVER
      p6dof_object_type AGM-MRC
      update_interval   0.01 sec
      event_core_data             30 Hz
      event_kinematic_data        30 Hz
      event_engine_fuel_data      10 Hz
      event_autopilot_data         5 Hz
      event_autopilot_limits_data  1 Hz
      event_control_inputs_data    5 Hz
      event_control_surfaces_data  5 Hz
      event_force_moment_data      5 Hz	  
   end_mover

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
   
   processor data_mgr WSF_TRACK_PROCESSOR
      on
      master_track_processor
      #show_state_transitions
      update_interval 0.01 sec
      purge_interval  1 hr
   end_processor   

   # This will lock-on to the pre-briefed target,
   # if a track exits.
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
   

   processor pitchup WSF_SCRIPT_PROCESSOR
      off      
      update_interval 0.1 sec
      
      script_variables
         bool pitchUpInitiated      = false;
         bool terminalDiveInitiated = false;
      end_script_variables
      
      on_update
      
         if( !pitchUpInitiated )
         {
            WsfTrack trk = PLATFORM.CurrentTargetTrack();
            if( trk.IsValid() )
            {
               if( trk.IsNull() ) { writeln(" Null Track!"); }

               double rng = PLATFORM.SlantRangeTo(trk);
               if( rng < 2200.0 )
               {
                  writeln("Missile begins pitchup ...");

                  pitchUpInitiated = true;
                  
                  WsfMover mover = PLATFORM.Mover();
                  if(mover.IsA_TypeOf("WSF_P6DOF_MOVER"))
                  {
                     WsfP6DOF_Mover p6mover = (WsfP6DOF_Mover)mover;
                     p6mover.SetPitchGLoad(8.0);            // Pull up
                     p6mover.SetAutopilotRollAngle(0.0);    // Wings level
                     p6mover.SetAutopilotSpeedKTAS(1000.0); // Go fast                  
                  }               
               }
            }
         }
         else if( !terminalDiveInitiated )
         {
            WsfTrack trk = PLATFORM.CurrentTargetTrack();
            if( trk.IsValid() )
            {
               #WsfGeoPoint tgtPt = trk.CurrentLocation();
               double rng = PLATFORM.SlantRangeTo(trk);
               
               if( rng < 1600.0 )
               {
                  writeln("Missile begins pushover dive ...");
                  terminalDiveInitiated = true;
                  
                  if( trk.IsNull() ) { writeln(" Null Track!"); }

                  PLATFORM.GoToLocation( trk.Latitude(), trk.Longitude(), trk.Altitude() );
                  
                  WsfMover mover = PLATFORM.Mover();
                  if(mover.IsA_TypeOf("WSF_P6DOF_MOVER"))
                  {
                     WsfP6DOF_Mover p6mover = (WsfP6DOF_Mover)mover;
                     #p6mover.SetPitchGLoad(-8.0);          // Pull up
                     p6mover.SetAutopilotRollAngle(0.0);    // Wings level
                     p6mover.SetAutopilotSpeedKTAS(1000.0); // Go fast                                      
                  }
               }
            }
         }
         else
         {
            WsfTrack trk = PLATFORM.CurrentTargetTrack();
            if( trk.IsValid() )
            {
               double rng = PLATFORM.GroundRangeTo(trk);

               if( rng < 100.0 )
               {
#                 There appears to be a problem with casting a processor to a fuse (below)               
#                 writeln("BANG!!!! ", PLATFORM.Name(), " exploded at time = ", TIME_NOW);
#                  WsfProcessor proc = PLATFORM.Processor("fuse");
#                  if(proc.IsValid())
#                  {
#                     if(proc.IsA_TypeOf("WSF_WEAPON_FUSE"))
#                     {
#                        WsfWeaponFuse fuse = (WsfWeaponFuse)proc;
#                        if(fuse.IsValid())
#                        {
#                           if(!fuse.IsNull())
#                           {
#                              fuse.Detonate();
#                           }
#                        }
#                     }
#                  }
#                  PLATFORM.Detonate("dud");
               }
            }         
         }

      end_on_update
      
   end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：spatial_domain, side, icon, radar_signature, infrared_signature, optical_signature, mover, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, category, aux_data, these, include, processor, comm, track_manager, 平台类型
- **出处**：`air_to_air/platforms/brawler_test.txt:58-282`
- **片段**：

```text
platform_type  BRAWLER_TEST  WSF_PLATFORM
   icon f15c
   category AIRCRAFT
   category aircraft
   category brawler
   category EZJA

   
   aux_data 
      bool captured = false // set to true if captured which is brawler lingo meaning landed at a base
   end_aux_data

/*define global script variables attached to this platform type
  these are used in the EZJA behavior tree
*/
   include rules/ezja_script_variables.txt

   processor thinker WSF_BRAWLER_PROCESSOR
      mind_file platforms/mind
      consciousness_event_update_time 10 s
   end_processor 
   
   comm datalink WSF_COMM_TRANSCEIVER
      propagation_speed 0 m/s   #instantaneous propogation (faster than speed of light)
      network_name brawler_net
      internal_link data_mgr
      internal_link tsk_mgr
      internal_link thinker
      internal_link perception
      internal_link assessment
   end_comm

   comm wpn_datalink WSF_COMM_XMTR 
      propagation_speed 0 m/s   #instantaneous propogation (faster than speed of light)
      network_name weapons_subnet
      internal_link data_mgr
      internal_link raw_data_mgr
   end_comm

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

   track_manager 
      fusion_method weighted_average
      end_fusion_method
   end_track_manager
   
   processor tsk_mgr WSF_TASK_PROCESSOR 
      on
      internal_link data_mgr
   end_processor

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
   
   // processor is not used within the behavior tree but must exist on the platform in order to use Brawler Processor
   processor incoming_threats WSF_THREAT_PROCESSOR
      threat_time_to_intercept 120 sec   #default: 60 sec
   end_processor
     
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

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, category, aux_data, these, include, processor, comm, track_manager

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, side, mover, comm, script_variables, script, processor, category, 平台类型
- **出处**：`space_operations/platforms/iridium_satellite.txt:11-239`
- **片段**：

```text
platform_type IRIDIUM_SATELLITE WSF_PLATFORM
   icon satellite
   side blue
   mover WSF_SPACE_MOVER
      revs_per_day 14.4
      inclination 86.4 deg
   end_mover

   comm iridium_comm WSF_COMM_TRANSCEIVER
   end_comm

   script_variables
      static int sFIRST_SATELLITE = 1;
      static int sLAST_SATELLITE = 11;
      static int sFIRST_ORBIT    = 1;
      static int sLAST_ORBIT     = 6;  // CHANGE TODO
      static bool sDebug = true;

      // Variables initialized / set during "initialize2".
      bool mIsTravelingNorth;
      bool mWasTravelingNorth;

      string mNorthwardUpperLeftLink = "<none>";
      string mNorthwardLowerRightLink = "<none>";

      string mSouthwardUpperLeftLink = "<none>";
      string mSouthwardLowerRightLink = "<none>";

      int mOrbitNumber;
      int mSatelliteNumber;

   end_script_variables

   // Note that the following assume the network naming convention of iridium<orbit#><satellite#>.
   script int OrbitNumber(string aName)
      return (int)(aName.Substring(7, 7));
   end_script

   script int SatelliteNumber(string aName)
      return (int)(aName.Substring(8));
   end_script

   script void UpdateTravelDirection()
      mWasTravelingNorth = mIsTravelingNorth;
      Vec3 velWCS = PLATFORM.VelocityWCS();
      mIsTravelingNorth = (velWCS.Z() > 0.0);
   end_script

script void AddConnection(WsfComm aSourceComm,
                          string aDestinationPlatformName,
                          string aDestCommName)

   WsfAddress sourceAddress = aSourceComm.GetAddress();
   if(!aSourceComm.IsConnectedTo(WsfSimulation.FindPlatform(aDestinationPlatformName).Comm(aDestCommName).GetAddress()))
   {
      aSourceComm.AddConnection(WsfSimulation.FindPlatform(aDestinationPlatformName).Comm(aDestCommName).GetAddress());
   }
end_script

script void RemoveConnection(WsfComm aSourceComm,
                             string aDestinationPlatformName,
                             string aDestCommName)
   WsfAddress sourceAddress = aSourceComm.GetAddress();
   if(aSourceComm.IsConnectedTo(WsfSimulation.FindPlatform(aDestinationPlatformName).Comm(aDestCommName).GetAddress()))
   {
      aSourceComm.RemoveConnection(WsfSimulation.FindPlatform(aDestinationPlatformName).Comm(aDestCommName).GetAddress());
   }
end_script

   script void UpdateLinks()
      WsfComm comm = PLATFORM.Comm("iridium_comm");
      if (mIsTravelingNorth)
      {
         if (mOrbitNumber != sFIRST_ORBIT)
         {
            WsfComm myComm = PLATFORM.Comm("iridium_comm");
            RemoveConnection(myComm, mSouthwardUpperLeftLink, "iridium_comm");
            AddConnection(myComm, mNorthwardUpperLeftLink, "iridium_comm");
         }
         if (mOrbitNumber != sLAST_ORBIT)
         {
            WsfComm myComm = PLATFORM.Comm("iridium_comm");
            RemoveConnection(myComm, mSouthwardLowerRightLink, "iridium_comm");
            AddConnection(myComm, mNorthwardLowerRightLink, "iridium_comm");
         }
      }
      else
      {
         if (mOrbitNumber != sFIRST_ORBIT)
         {
            WsfComm myComm = PLATFORM.Comm("iridium_comm");
            RemoveConnection(myComm, mNorthwardUpperLeftLink, "iridium_comm");
            AddConnection(myComm, mSouthwardUpperLeftLink, "iridium_comm");
         }
         if (mOrbitNumber != sLAST_ORBIT)
         {
            WsfComm myComm = PLATFORM.Comm("iridium_comm");
            RemoveConnection(myComm, mNorthwardLowerRightLink, "iridium_comm");
            AddConnection(myComm, mSouthwardLowerRightLink, "iridium_comm");
         }
      }
   end_script

   script void AddStaticConnections()
         WsfComm comm = PLATFORM.Comm("iridium_comm");
         string connection1 = "iridium" + (string)mOrbitNumber;
         string connection2 = connection1;
         if (mSatelliteNumber != sLAST_SATELLITE)
         {
            connection1 += (string)(mSatelliteNumber + 1);
         }
         else
         {
            connection1 += (string)sFIRST_SATELLITE;
         }
         if (mSatelliteNumber != sFIRST_SATELLITE)
         {
            connection2 += (string)(mSatelliteNumber - 1);
         }
         else
         {
            connection2 += (string)sLAST_SATELLITE;
         }
         WsfPlatform curPlat1 = WsfSimulation.FindPlatform(connection1);
         WsfPlatform curPlat2 = WsfSimulation.FindPlatform(connection2);
         WsfComm comm1 = curPlat1.Comm("iridium_comm");
         WsfComm comm2 = curPlat2.Comm("iridium_comm");
         comm.AddConnection(comm1.GetAddress());
         comm.AddConnection(comm2.GetAddress());
   end_script

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

   category iridium

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, mover, comm, script_variables, script, processor, category

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, infrared_signature, optical_signature, radar_signature, weapon_effects, mover, processor, 平台类型
- **出处**：`cyber/weapons/sam/sr_sam.txt:134-144`　（同签名共 18 处，另见 `orwaca_iads/weapons/sam/elr_sam.txt:128`、`orwaca_iads/weapons/sam/lr_sam.txt:128`、`orwaca_iads/weapons/sam/mr_sam.txt:128`）
- **片段**：

```text
platform_type SR_SAM WSF_PLATFORM
   icon sr_missile_icon
   infrared_signature SR_SAM_INFRARED_SIGNATURE
   optical_signature  SR_SAM_OPTICAL_SIGNATURE
   radar_signature    SR_SAM_RADAR_SIGNATURE
   weapon_effects     SR_SAM_WEAPON_EFFECTS

   mover SR_SAM_MOVER end_mover
   processor autopilot SR_SAM_AUTOPILOT end_processor
   processor fuse SR_SAM_FUSE end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, infrared_signature, optical_signature, radar_signature, weapon_effects, mover, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, radar_signature, infrared_signature, optical_signature, spatial_domain, side, icon, category, 平台类型
- **出处**：`six_dof/platforms/aam-sr-tvc.txt:122-132`　（同签名共 2 处，另见 `six_dof/platforms/aam-sr.txt:120`）
- **片段**：

```text
platform_type  AAM-SR-TVC-TEST  WSF_PLATFORM

   radar_signature       SIMPLE_FIGHTER_RCS
   infrared_signature    SIMPLE_FIGHTER_IR_SIG
   optical_signature     SIMPLE_FIGHTER_OPTICAL_SIG
   spatial_domain        air
   side                  green
   icon                  aim9x
   category              weapon
   
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：radar_signature, infrared_signature, optical_signature, spatial_domain, side, icon, category

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, radar_signature, mover, aero, mass, update_interval, processor, 平台类型
- **出处**：`suppressor/weapons/agm/blue_gps_bomb_3.txt:136-146`　（同签名共 9 处，另见 `suppressor/weapons/agm/blue_gps_bomb_3.txt:162`、`suppressor/weapons/agm/blue_gps_bomb_3.txt:202`、`suppressor/weapons/agm/blue_gps_bomb_3.txt:148`）
- **片段**：

```text
platform_type IRON_500_LB_BOMB WSF_PLATFORM
  icon jdam
  radar_signature BLUE_GPS_BOMB_3_RADAR_SIGNATURE
  mover WSF_UNGUIDED_MOVER
    aero BLUE_GPS_BOMB_3_500_LB_AERO
    mass 500.0 lbm
    update_interval 0.5 s
  end_mover
  processor detonator CONTACT_FUSE
  end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, radar_signature, mover, aero, mass, update_interval, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, radar_signature, infrared_signature, optical_signature, spatial_domain, side, icon, mover, 平台类型
- **出处**：`p6dof/platforms/c-hvy.txt:16-31`　（同签名共 11 处，另见 `p6dof/platforms/fa-hvy.txt:16`、`six_dof/platforms/c-hvy.txt:16`、`six_dof/platforms/c-hvy.txt:33`）
- **片段**：

```text
platform_type  C-HVY  WSF_PLATFORM

   radar_signature    SIMPLE_FIGHTER_RCS
   infrared_signature SIMPLE_FIGHTER_IR_SIG
   optical_signature  SIMPLE_FIGHTER_OPTICAL_SIG
   spatial_domain     air
   side               green
   icon               c130

   # Setup the P6DOF mover
   mover WSF_P6DOF_MOVER
      p6dof_object_type C-HVY
      update_interval   0.01 sec
   end_mover

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：radar_signature, infrared_signature, optical_signature, spatial_domain, side, icon, mover

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, category, infrared_signature, optical_signature, radar_signature, comm, processor, 平台类型
- **出处**：`cyber/exfiltrate_demo/platforms/red_radar.txt:18-38`
- **片段**：

```text
platform_type RED_RADAR WSF_PLATFORM
  icon Ground_Radar
  
  category iads

  infrared_signature   VEHICLE_INFRARED_SIGNATURE
  optical_signature    VEHICLE_OPTICAL_SIGNATURE
  radar_signature      VEHICLE_RADAR_SIGNATURE

  comm sub_net RED_DATALINK
     network_name <local:slave>
     internal_link task_mgr
  end_comm

  processor data_mgr WSF_LINKED_PROCESSOR
     report_to commander via sub_net
  end_processor

  processor task_mgr RED_RADAR_TACTICS
  end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, category, infrared_signature, optical_signature, radar_signature, comm, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, sensor, processor, weapon, pitch, off, execute, 平台类型
- **出处**：`satellite_demos/scenarios/gps_denied.txt:404-429`
- **片段**：

```text
platform_type    EW_RADAR_SITE       WSF_PLATFORM
   icon ground_radar
   sensor ew-radar-1 EARLY_WARNING_SENSOR
      processor track-proc
   end_sensor

   processor track-proc WSF_TRACK_PROCESSOR
   end_processor

   weapon jammer SPOT_JAMMER
   //debug
   pitch 90 deg
   off
   end_weapon

   execute at_interval_of 1 sec
      if(PLATFORM.Sensor("ew-radar-1").ActiveTrackCount() == 1)
      {
         WsfWeapon jammer = PLATFORM.Weapon("jammer");
         // Any of the jamming routines can be used at this point
         jammer.StartJamming(1575420000., 240000000., "noise_jamming");
         jammer.SetEA_DeltaGainTechnique("power_adjust", true, "delta_power", -3.0, "", "SENSOR", 0, 0);
      }
   end_execute

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, sensor, processor, weapon, pitch, off, execute

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, side, command_chain, mover, radar_signature, comm, processor, 平台类型
- **出处**：`electronic_warfare/simple_auto_jamming.txt:349-376`
- **片段**：

```text
platform_type STRIKER_PLATFORM WSF_PLATFORM
   icon F-18E
   side blue

   command_chain blue SELF

   mover WSF_AIR_MOVER end_mover
   radar_signature FIGHTER_RADAR_SIGNATURE

   comm blue_net BLUE_DATALINK
      network_name <local:master>
   end_comm

   //processor bluetracker BLUE_TRACK_PROCESSOR
   //end_processor

   //navigation_errors
   //   update_interval 1.0 sec
   //end_navigation_errors

   processor blue_data_mgr WSF_TRACK_PROCESSOR
      purge_interval 60.0 sec
      report_interval 5.0 sec
      report_method batch
      circular_report_rejection on
      external_link peers via blue_net
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, command_chain, mover, radar_signature, comm, processor

### platform_type（pm6_brawler_route_comparison）｜平台类型

- **关键词**：platform_type, update_interval, side, heading, altitude, position, route, execute, 平台类型
- **出处**：`six_dof_with_brawler/pm6_brawler_route_comparison.txt:59-87`
- **片段**：

```text
platform_type ROUTE_TEST_BM BLUE_FIGHTER
   update_interval 0.01 sec
   side blue
   heading 90 deg
   altitude 30000 ft msl
   position 00:05:00.00n  01:10:00.00w 
   
   route
      position 00:05:00.00n  01:10:00.00w  altitude 30000 ft msl speed 900 ft/s
      position 00:00:36.035n 01:47:21.156e altitude 30000 ft msl speed 900 ft/s
   end_route

   execute at_time 15 sec absolute
      PLATFORM.FlyHeadingSpeedAltitude(60.0, 350.0, 8000.0, 1.25, 200.0);
   end_execute
   execute at_time 75 sec absolute
      PLATFORM.FlyHeadingSpeedAltitude(180.0, 250.0, 5000.0, 4.0, 200.0);
   end_execute
   execute at_time 135 sec absolute
      PLATFORM.FlyHeadingSpeedAltitude(180.0, 250.0, 7000.0, 3.0, 200.0);
   end_execute
   execute at_time 195 sec absolute
      PLATFORM.FlyHeadingSpeedAltitude(15.0, 250.0, 7000.0, 4.0, 200.0);
   end_execute
   execute at_time 255 sec absolute
      PLATFORM.FlyHeadingSpeedAltitude(105.0, 250.0, 10000.0, 3.0, 200.0);
   end_execute
   
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：update_interval, side, heading, altitude, position, route, execute

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, infrared_signature, optical_signature, radar_signature, router, comm, processor, 平台类型
- **出处**：`cyber/exfiltrate_demo/platforms/iads_cmdr.txt:127-156`
- **片段**：

```text
platform_type IADS_CMDR WSF_PLATFORM
   icon C4I

   infrared_signature    VEHICLE_INFRARED_SIGNATURE
   optical_signature     VEHICLE_OPTICAL_SIGNATURE
   radar_signature       VEHICLE_RADAR_SIGNATURE

   router router WSF_COMM_ROUTER 
      automated_interface_linking true
   end_router

   comm sub_net RED_DATALINK
      router_name router
      network_name <local:master>
      internal_link data_mgr
      internal_link task_mgr
   end_comm
   
   comm hackable_comm WSF_COMM_XMTR 
      router_name router
   end_comm

   processor data_mgr IADS_CMDR_DATA_MGR
   end_processor

   processor task_mgr IADS_CMDR_TASK_MGR
      operating_level ENGAGE 1
   end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, infrared_signature, optical_signature, radar_signature, router, comm, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, radar_signature, processor, comm, weapon, mover, sensor, 平台类型
- **出处**：`wargame/platforms/sam_launcher.txt:17-54`
- **片段**：

```text
platform_type SAM_LAUNCHER WSF_PLATFORM
  icon mr_sam_launcher_icon
  radar_signature SAM_RADAR_SIGNATURE

  processor data_mgr WSF_TRACK_PROCESSOR
     purge_interval       60 sec
     internal_link task_mgr
  end_processor
  
  processor task_mgr WSF_TASK_PROCESSOR
  end_processor
    
   comm cmdr_net TEAM_DATALINK
      network_name <local:slave>
      internal_link data_mgr
      internal_link task_mgr
   end_comm
  
   comm sub_net TEAM_DATALINK
      network_name <local:slave>
      internal_link data_mgr
      internal_link task_mgr
   end_comm
  
  weapon sam SAM
     quantity 6
  end_weapon
  
  mover WSF_GROUND_MOVER 
     maximum_speed 50 mph
  end_mover
  
  sensor sam_radar_sensor SAM_RADAR_SENSOR
     on
     internal_link data_mgr
     ignore_same_side
   end_sensor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, radar_signature, processor, comm, weapon, mover, sensor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, side, icon, radar_signature, mover, on_initialize2, processor, include, 平台类型
- **出处**：`engage/grid_react_man.txt:149-201`
- **片段**：

```text
platform_type TARGET_TYPE WSF_PLATFORM
   side blue
   icon F-18E
   radar_signature FIGHTER_RADAR_SIGNATURE
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

   on_initialize2
      target = PLATFORM.Index();
   end_on_initialize2

   #Track incoming weapons with this track list, as once detected,
   #weapon tracks shouldn't be dropped (per ESAMS functionality)
   #Do it in a non-master track list to avoid polluting
   #standard tracking, if needed in the future for other tasks
   processor mar_track_list WSF_TRACK_PROCESSOR
      non_master_track_processor
      retain_track_history
      uncorrelated_track_drops off

      #report incoming weapon tracks to the reactive manuever processor,
      #so the target may make evasive maneuvers
      internal_link maneuver
   end_processor

   #ESAMS to WSF variables for the MAR can be set in the following file
   include ./radars/mar_esams.txt

   processor maneuver BASIC_MANEUVER_PROCESSOR
      #Esams-like definition of reactive_maneuvers are in this file
      include ./targets/reactive_maneuvers_esams.txt
   end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：side, icon, radar_signature, mover, on_initialize2, processor, include

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, script_variables, script, mover, comm, sensor, processor, 平台类型
- **出处**：`sensor_demos/platforms/uav_eoir.txt:15-67`　（同签名共 3 处，另见 `sensor_demos/platforms/uav_sar.txt:15`、`shooter/weapons/aam/aa_mrm.txt:120`）
- **片段**：

```text
platform_type UAV WSF_PLATFORM
   icon Global_Hawk

   script_variables
      string mCurrentSensorName;
      string mCurrentSensorMode;
   end_script_variables

   script void BeginImaging(string aSensorName,
                            string aSensorMode,
                            double aAzimuth,
                            double aGroundRange)
      double az = aAzimuth;

      double alt = Altitude();
      double el = - (MATH.ATan2(alt, aGroundRange));
      writeln("T=",TIME_NOW, " ", Name(),
              "; sensor: ", aSensorName, ", mode: ", aSensorMode,
              ", Az: ", az, ", El: ", el);

      mCurrentSensorName = aSensorName;
      mCurrentSensorMode = aSensorMode;
      WsfSensor sensor = Sensor(mCurrentSensorName);
      sensor.CueToAbsoluteAzEl(az, el);
      if (aSensorMode != "") sensor.SelectMode(aSensorMode);
      sensor.TurnOn();
   end_script

   script void EndImaging()
      WsfSensor sensor = Sensor(mCurrentSensorName);
      sensor.TurnOff();
   end_script

   mover WSF_AIR_MOVER
   end_mover

   comm datalink WSF_COMM_TRANSCEIVER
      internal_link          task_mgr
   end_comm

   sensor eoir GENERIC_EOIR
      yaw                    0 deg
      pitch                  -5 deg
      internal_link          image_proc
   end_sensor

   processor image_proc WSF_IMAGE_PROCESSOR
      debug
   end_processor

   processor task_mgr WSF_TASK_PROCESSOR
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, script_variables, script, mover, comm, sensor, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, side, icon, category, mover, execute, sensor, processor, 平台类型
- **出处**：`space_operations/platforms/sat_sensor.txt:10-63`
- **片段**：

```text
platform_type  SAT_SENSOR  WSF_PLATFORM
   side blue
   icon stereo_satellite
   category sat_sensor

   # Approximately LEO
   mover WSF_SPACE_MOVER
      revs_per_day 11
      inclination 55 deg
   end_mover

   execute at_time 1 s absolute
      WsfPlatform platform = WsfSimulation.FindPlatform("launch_facility");
      PLATFORM.Sensor("sat_sensor").CueToPoint(platform.Location());
   end_execute

   sensor sense_iridium SENSE_IRIDIUM
      on
      internal_link track_mgr
   end_sensor

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

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：side, icon, category, mover, execute, sensor, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, comm, processor, purge_interval, weapon, script_variables, execute, 平台类型
- **出处**：`electronic_warfare/test_multi_beam/platforms/large_sam_launcher.txt:16-77`
- **片段**：

```text
platform_type LARGE_SAM_LAUNCHER WSF_PLATFORM
  icon SA-10_Launcher

  comm cmdr_net RED_DATALINK
     network_name <local:slave>
     internal_link data_mgr
     internal_link task_mgr
  end_comm

  processor data_mgr WSF_TRACK_PROCESSOR
    purge_interval       60 sec
  end_processor

  processor task_mgr WSF_TASK_PROCESSOR
  end_processor

  weapon sam LARGE_SAM
     quantity 4
  end_weapon

   script_variables
      # Create a WsfDraw object.
      WsfDraw draw = WsfDraw();
   end_script_variables

   execute at_interval_of 10.0 s

      foreach (WsfTrack track in MasterTrackList())
      {
         if (track.IsValid())
         {
           if (track.IsFalseTarget())
           {
              # use the track ID as a unique draw ID
              # a track icon and a line to the track icon
              # is drawn at each track update
              string trackId = track.TrackId().ToString();
              draw.SetId(trackId);
              draw.SetDuration(10.0); # this is faster than calling erase every time

              # Draw a track icon
              draw.SetColor(1,0,1);
              draw.SetPointSize(0.25);
              draw.SetLineSize(0.25);
              draw.BeginIcons(track.Heading(), "Wedge");
                 draw.Vertex(track.CurrentLocation());
              draw.End();

              draw.SetLineStyle("solid");
              draw.SetLineSize(3);

              # Draw a line to the track
              draw.BeginLines();
                 draw.Vertex(PLATFORM);
                 draw.Vertex(track.CurrentLocation());
              draw.End();
           }
         }
      }
   end_execute

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, comm, processor, purge_interval, weapon, script_variables, execute

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, side, mover, optical_signature, radar_signature, sensor, processor, 平台类型
- **出处**：`base_types/platforms/awacs.txt:22-85`
- **片段**：

```text
platform_type AWACS WSF_PLATFORM

   icon KC-10
   side blue

   mover WSF_AIR_MOVER
      default_linear_acceleration   1.0 g
      default_radial_acceleration   1.0 g
   end_mover

   optical_signature awacs_optical_signature
   radar_signature   awacs_radar_signature

#   command_chain sat-ops self       // satellites
#   command_chain uavs    self       // UAVs
#   command_chain strike  self       // Strike assets

   // --- * --- * ---
   //      Comm
   // --- * --- * ---
#   comm constellation-xmtr WSF_RADIO_XMTR
#      frequency     900.0 mhz
#   end_comm

#   comm constellation-rcvr WSF_RADIO_RCVR
#      frequency     1000.0 mhz
#      internal_link track-proc
#   end_comm


   // --- * --- * ---
   //     Sensors
   // --- * --- * ---
   // N/A
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


   // --- * --- * ---
   //   Processors
   // --- * --- * ---
   processor track-proc WSF_TRACK_PROCESSOR
#      purge_interval  5 min
      purge_interval  120.0 sec
      update_interval  10.0 sec
   end_processor


end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, mover, optical_signature, radar_signature, sensor, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, category, mover, processor, sensor, weapon, fuel, 平台类型
- **出处**：`base_types/platforms/red_multirole_fighter_2_base.txt:20-83`
- **片段**：

```text
platform_type RED_MULTIROLE_FIGHTER_2_BASE WSF_PLATFORM

   icon SU-27
   category fighter

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


   processor track_manager WSF_TRACK_PROCESSOR
      //debug
      purge_interval  60 sec
      update_interval 1 sec
   end_processor



   sensor red_multirole_fighter_2_radar RED_A2A_RADAR
      on
      processor track_manager
      ignore_same_side
   end_sensor

//   sensor red_esm RED_ESM
//      processor track_manager
//   end_sensor
//   sensor rwr_esm RWR_ESM
//      processor track_manager
//   end_sensor


   weapon int_missile SIMPLE_A2A_MISSILE_WEAPON end_weapon

//   weapon disrupt1 X_JAMMER_RED
//      on
//   end_weapon


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

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, category, mover, processor, sensor, weapon, fuel

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, radar_signature, mover, inclination, revs_per_day, comm, on, 平台类型
- **出处**：`satellite_demos/platforms/galileo.txt:20-86`
- **片段**：

```text
platform_type GALILEO WSF_PLATFORM
  icon satellite
  radar_signature GALILEO_RADAR_SIG
#  mover WSF_NORAD_SPACE_MOVER
#  end_mover

  mover WSF_SPACE_MOVER
  inclination 56 deg
  revs_per_day 1.7
  end_mover

  comm GALILEO_DOWNLINKE1_TX GALILEO_DOWNLINKE1_TX
     location  -150 0 1000 mm   # ref 1, used values for FOC satellites
   on
  end_comm

  comm GALILEO_DOWNLINKE5_TX GALILEO_DOWNLINKE5_TX
     location  -150 0 1000 mm   # ref 1, used values for FOC satellites
   on
  end_comm

  comm GALILEO_DOWNLINKE6_TX GALILEO_DOWNLINKE6_TX
      location  -150 0 1000 mm   # ref 1, used values for FOC satellites
   on
  end_comm

  comm GALILEO_UPLINKE1_RX GALILEO_UPLINKE1_RX
   on
  end_comm

  comm GALILEO_UPLINKE5_RX GALILEO_UPLINKE5_RX
   on
  end_comm

  comm GALILEO_UPLINKE6_RX GALILEO_UPLINKE6_RX
   on
  end_comm

#==================Uncomment this out to send a test message to ground stations==========================================================
#execute at_interval_of 1 s
#      // Loop through all the platforms in the simulation
#      for (int i = 1; i <= WsfSimulation.PlatformCount(); i = i + 1)
#          {
#          WsfPlatform myPlatform = WsfSimulation.FindPlatform(i);
#              if ((myPlatform != PLATFORM) && myPlatform.IsValid())   # Make sure we are not trying to talk to ourselves!
#              {
#              WsfControlMessage myMessage = WsfControlMessage();
#              myMessage.SetFunction("This is a test");
#
#                  if (myPlatform.Type() == "GALILEO_GS")
#                  {
#                  PLATFORM.Comm("GALILEO_DOWNLINKE1_TX").SendUnicastMessage(myMessage, myPlatform);
#                  }
##                  if (myPlatform.Type() == "GALILEO_GS")
##                  {
##                  PLATFORM.Comm("GALILEO_DOWNLINKE5_TX").SendUnicastMessage(myMessage, myPlatform);
##                  }
##                  if (myPlatform.Type() == "GALILEO_GS")
##                  {
##                  PLATFORM.Comm("GALILEO_DOWNLINKE6_TX").SendUnicastMessage(myMessage, myPlatform);
##                  }
#              }
#          }
# end_execute
#=========================================================================================================================================

 end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, radar_signature, mover, inclination, revs_per_day, comm, on

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, mover, sensor, processor, script_variables, script, execute, 平台类型
- **出处**：`chaff/chaff_example_ttr.txt:225-294`　（同签名共 2 处，另见 `electronic_warfare/close_targets_ttr.txt:155`）
- **片段**：

```text
platform_type TTR_RADAR_SITE WSF_PLATFORM
   icon Ground_Radar

   mover WSF_GROUND_MOVER end_mover

   sensor ttr_radar TTR_RADAR
      processor track_manager
      ignore_same_side
   end_sensor

   processor track_manager WSF_TRACK_PROCESSOR
   end_processor

   # ---------------------------------------------
   # Draw track to false targets and real targets
   # ---------------------------------------------
   script_variables
      // Create a WsfDraw object.
      WsfDraw draw = WsfDraw();
      bool mAllowTracking = true;
   end_script_variables

   script void AllowTracking()
      mAllowTracking = true;
   end_script

   execute at_interval_of 1 s
      WsfSensor sensor = PLATFORM.Sensor("ttr_radar");
      foreach (WsfLocalTrack track in MasterTrackList())
      {
         if (mAllowTracking &&
             (!sensor.HaveRequestFor(track.TrackId()) ||
              sensor.IsTurnedOff()))
         {
            if (track.Target().Name() == "blue_airlifter_jet")
            {
               #writeln(TIME_NOW, " Turned on sensor");
               track.SetLocation(track.Target().Location());
               sensor.TurnOn();
               sensor.StartTracking(track, "TRACK");
               mAllowTracking = false;
            }
         }

         if (track.IsValid())
         {
            #sensor.CueToTrack(track);

            // use the track ID as a unique draw ID
            // a track icon and a line to the track icon
            // is drawn at each track update
            string trackId = track.TrackId().ToString();
            draw.SetId(trackId);
            draw.SetDuration(1); // this is faster than calling erase every time

            draw.SetColor(0,0,1);
            draw.BeginIcons(track.Heading(), "Wedge");
            draw.Vertex(track.CurrentLocation());
            draw.End();

            // Draw a line to the track
            draw.SetLineStyle("dashed");
            draw.BeginLines();
            draw.Vertex(PLATFORM);
            draw.Vertex(track.CurrentLocation());
            draw.End();
         }
      }
   end_execute
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, mover, sensor, processor, script_variables, script, execute

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, radar_signature, mover, navigation_errors, comm, script, execute, 平台类型
- **出处**：`satellite_demos/platforms/intelsat.txt:18-90`
- **片段**：

```text
platform_type INTELSAT WSF_PLATFORM
   icon Satellite
   radar_signature INTELSAT_RADAR_SIG

   mover WSF_NORAD_SPACE_MOVER
      update_interval 10 sec
   end_mover

   navigation_errors
      gps_status 1
   end_navigation_errors

   comm INTELSAT_DOWNLINK_TX INTELSAT_DOWNLINK_TX
      on
   end_comm

   comm INTELSAT_UPLINK_RX INTELSAT_UPLINK_RX
      on
   end_comm

   comm INTELSAT_CL_TX INTELSAT_CL_TX
      on
   end_comm

   comm INTELSAT_CL_RX INTELSAT_CL_RX
      on
   end_comm

   comm INTELSAT_HANDHELD_DOWNLINK_TX INTELSAT_HANDHELD_DOWNLINK_TX
      on
   end_comm

   comm INTELSAT_HANDHELD_UPLINK_RX INTELSAT_HANDHELD_UPLINK_RX
      on
   end_comm

   script void SendMessage()
      for (int i = 1; i <= WsfSimulation.PlatformCount(); i = i + 1)
      {
         WsfPlatform myPlatform = WsfSimulation.FindPlatform(i);
         if ((myPlatform != PLATFORM) && myPlatform.IsValid() && myPlatform.Comm("INTELSAT_UPLINK_RX").IsValid())   # Make sure we are not trying to talk to ourselves!
         {
            WsfControlMessage myMessage = WsfControlMessage();
            myMessage.SetFunction("This is a test");
            PLATFORM.Comm("INTELSAT_DOWNLINK_TX").SendMessage(myMessage, myPlatform.Comm("INTELSAT_UPLINK_RX").GetAddress());
         }
         if ((myPlatform != PLATFORM) && myPlatform.IsValid() && myPlatform.Comm("INTELSAT_CL_RX").IsValid())   # Make sure we are not trying to talk to ourselves!
         {
            WsfControlMessage myMessage = WsfControlMessage();
            myMessage.SetFunction("This is a test");
            PLATFORM.Comm("INTELSAT_CL_TX").SendMessage(myMessage, myPlatform.Comm("INTELSAT_CL_RX").GetAddress());
         }
         if ((myPlatform != PLATFORM) && myPlatform.IsValid() && myPlatform.Comm("GROUNDSTATION_INTELSAT_DOWNLINK_RX").IsValid())   # Make sure we are not trying to talk to ourselves!
         {
            WsfControlMessage myMessage = WsfControlMessage();
            myMessage.SetFunction("This is a test");
            PLATFORM.Comm("INTELSAT_DOWNLINK_TX").SendMessage(myMessage, myPlatform.Comm("GROUNDSTATION_INTELSAT_DOWNLINK_RX").GetAddress());
         }
      }
   end_script

   script void CheckComms()
      if (PLATFORM.Comm("INTELSAT_DOWNLINK_TX").IsTurnedOn() || PLATFORM.Comm("INTELSAT_CL_TX").IsTurnedOn() || PLATFORM.Comm("INTELSAT_HANDHELD_DOWNLINK_TX").IsTurnedOn())
      {
         SendMessage();
      }
   end_script

   execute at_interval_of 100 sec
      CheckComms();
   end_execute

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, radar_signature, mover, navigation_errors, comm, script, execute

### platform_type（blue_prop_awacs_1）｜平台类型

- **关键词**：platform_type, icon, edit, include, sensor, execute, script, processor, 平台类型
- **出处**：`outer_air_battle/platforms/blue_prop_awacs_1.txt:13-93`
- **片段**：

```text
platform_type BLUE_PROP_AWACS_1 TIMED_AC
   icon awacs
   edit mover
      maximum_radial_acceleration 0.5 g
      at_end_of_path              remove
   end_mover

   # comm networks
   include platforms/blue_comm.txt


   // --- * --- * ---
   //     Sensors
   // --- * --- * ---
   // N/A
   sensor geo_sensor WSF_GEOMETRIC_SENSOR
      azimuth_field_of_view -180.0 degrees 180.0 degrees
      elevation_field_of_view -90.0 degrees 90.0 degrees
      minimum_range 0 m
      # 300 nm
      maximum_range 250.0 nm
      on
      frame_time              0.5 sec
      reports_location
      reports_velocity
      reports_iff
      reports_bearing
      #do not report weapons quality tracks
      track_quality 0.75
      ignore_same_side
      internal_link data_mgr
   end_sensor

   execute at_time 5 seconds relative
      WsfDraw sensorCircle = WsfDraw();
      sensorCircle.SetId(PLATFORM.Name());
      sensorCircle.SetColor(1,0,0);
      sensorCircle.SetEllipseMode("line");
      sensorCircle.BeginCircle(0.0, MATH.M_PER_NM()*250.0);
      sensorCircle.Vertex(PLATFORM);
      sensorCircle.End();
   end_execute

   script void atEndOfRoute()
      # turn off radar arc
      WsfDraw turnOffArc = WsfDraw();
      turnOffArc.Erase(PLATFORM.Name());
   end_script

   processor sensor_coverage WSF_SCRIPT_PROCESSOR
   end_processor

   // --- * --- * ---
   //   Processors
   // --- * --- * ---
   processor data_mgr WSF_TRACK_PROCESSOR
#      purge_interval  5 min
      purge_interval  10 min # 120.0 sec
      update_interval  10.0 sec

      report_to commander via cmdr_net
   end_processor

   edit processor station_timer
      script_variables
         total_station_time     = 3600.0 * 3.0; # three hours
         time_before_refueling  = MATH.INTEGER_MAX();
      end_script_variables
   end_processor

   processor task_mgr WSF_TASK_PROCESSOR

#      evaluation_interval DETECTED 10 sec
#      state DETECTED
#         on_entry
#            writeln(PLATFORM.Name(), " has detected ", TRACK.TargetName(), " at time ", TIME_NOW);
#         end_on_entry
#      end_state
   end_processor

end_platform_type
```

- **演示要点**：演示 platform_type 的参数：icon, edit, include, sensor, execute, script, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, mover, add, sensor, processor, script_variables, execute, 平台类型
- **出处**：`sensor_demos/coherent_sensor_demo.txt:83-166`
- **片段**：

```text
platform_type EW_RADAR_SITE WSF_PLATFORM
   icon Ground_Radar
   mover WSF_GROUND_MOVER end_mover

   add processor track_manager WSF_TRACK_PROCESSOR
      purge_interval 20 sec
   end_processor

   sensor ew_radar_1 EW_RADAR
      processor track_manager
      ignore_same_side
   end_sensor

   sensor ew_radar_2 EW_RADAR
      processor track_manager
      ignore_same_side
   end_sensor

   processor multi_sensor_detector WSF_COHERENT_SENSOR_PROCESSOR
      debug
      debug_level 2

      update_interval 10 secs

      use_target_result true
      //result_processing_type RSS_BASED
      result_processing_type SNR_BASED
      fusion_method  weighted_average

      processor track_manager
      #internal_link track_manager

      sensors
         sensor ew_radar_1
         sensor ew_radar_2
      end_sensors
   end_processor

   # ---------------------------------------------
   # Draw track for HCS Processor Tracks
   # ---------------------------------------------
   script_variables
      # Create a WsfDraw object.
      WsfDraw draw = WsfDraw();
   end_script_variables

   execute at_interval_of 10.0 s
      foreach (WsfTrack track in MasterTrackList())
      {
         if (track.IsValid() &&
             (track.ProcessorName() == "multi_sensor_detector"))
         {
            #string str = write_str("T=", (string)track.UpdateTime(), " Count=", (string)track.UpdateCount(), " SNR=", (string)Math.LinearToDB(track.SignalToNoise()));
            #writeln("T=" + track.UpdateTime().ToString() + "Count=" + track.UpdateCount().ToString() + " SNR=" + (string)Math.LinearToDB(track.SignalToNoise()));
            #writeln(str);
            # use the track ID as a unique draw ID
            # a track icon and a line to the track icon
            # is drawn at each track update
            string trackId = track.TrackId().ToString();
            draw.SetId(trackId);
            draw.SetDuration(10.0); # this is faster than calling erase every time
            draw.SetColor(0,1,0);
            draw.BeginIcons(track.Heading(), "Wedge");
            draw.Vertex(track.CurrentLocation());
            draw.End();

            # Draw a line to the track
            draw.SetLineStyle("dashed");
            draw.BeginLines();
            draw.Vertex(PLATFORM);
            draw.Vertex(track.CurrentLocation());
            draw.End();

            # draw the text for the track
            double snr = Math.LinearToDB(track.SignalToNoise());
            string str = " SNR: " + (string)snr + " dB";
            draw.BeginText(str);
            draw.Vertex(track.CurrentLocation());
            draw.End();
         }
      }
   end_execute

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, mover, add, sensor, processor, script_variables, execute

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, category, radar_signature, comm, mover, processor, weapon, sensor, 平台类型
- **出处**：`route_finder_demos/platforms/striker.txt:22-108`
- **片段**：

```text
platform_type  STRIKER  WSF_PLATFORM

  #indestructible
  #icon     F-22 / SU-27
  #side     blue / red

   category fighter
   radar_signature SIG_RADAR_ONE_M_SQUARED

   comm network WSF_COMM_TRANSCEIVER
      transfer_rate 100 mbits/sec
      network_name  tactical_net
      internal_link track_manager
      internal_link task_mgr
   end_comm


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

   processor track_manager WSF_TRACK_PROCESSOR
      purge_interval             60 sec
      report_interval            1 sec
      fused_track_reporting      off
      raw_track_reporting        on
      report_to commander        via   network
      circular_report_rejection  true
   end_processor

   processor perception WSF_PERCEPTION_PROCESSOR
      on
      script_debug_writes  off
      report_interval      10 sec
      reporting_self       true
     #report_to            commander:peers via network
      report_to            commander       via network
      asset_perception     status_messages
   end_processor


   weapon  mrm  MEDIUM_RANGE_MISSILE
      quantity 4
   end_weapon


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


   sensor geo_sensor WSF_GEOMETRIC_SENSOR
      on
      azimuth_field_of_view   -180.0 degrees  180.0 degrees
      elevation_field_of_view  -90.0 degrees   90.0 degrees
      minimum_range 0 m
      maximum_range 277800 m     //about 150 nm
      frame_time    0.5 sec
      reports_location
      reports_velocity
      reports_iff
      track_quality 1.0
      internal_link track_manager
      internal_link task_mgr
      ignore_same_side
   end_sensor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：category, radar_signature, comm, mover, processor, weapon, sensor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, mover, script, visual_part, sensor, comm, processor, 平台类型
- **出处**：`space_operations/attitude_control.txt:51-141`
- **片段**：

```text
platform_type ORIENTED_SATELLITE WSF_PLATFORM

   icon stereo_satellite

   mover WSF_SPACE_MOVER
      attitude_controller rate_limited
         maximum_yaw_rate 5 deg/s
         maximum_pitch_rate 5 deg/s
         maximum_roll_rate 5 deg/s
         orientation none
      end_attitude_controller
   end_mover

   // Orient the given articulated part along the vector from the platform to the target location, using a nadir z-axis constraint.
   script void OrientToTarget(WsfArticulatedPart aPart, Vec3 aTargetLocECI)
       Vec3 xAxis = Vec3.Construct(1.0, 0.0, 0.0);
       Vec3 xAxisECS = aPart.ConvertPCSVectorToECS(xAxis);
       Vec3 targetVecECI = Vec3.Subtract(aTargetLocECI, PLATFORM.LocationECI());
       Vec3 nadir = PLATFORM.LocationECI();
       nadir.Scale(-1.0);

       # Below is the call that enable generalized pointing:
       # Align "aPart" (PCS x-axis) with "targetVecECI".
       # Constrain "aPart" PCS z-axis to the nadir.
       ((WsfSpaceMover)PLATFORM.Mover()).SetOrientation(aPart, targetVecECI, nadir);

       //((WsfSpaceMover)PLATFORM.Mover()).SetOrientation(aPart.Yaw(), aPart.Pitch(), aPart.Roll(), targetVec, nadir); # alternate script method.

       # Draw a line indicating the pointing direction.
       WsfDraw draw = {};
       draw.Erase(0);
       draw.SetId(0);
       draw.SetColor(0.2, 0.8, 0.2);
       draw.SetLineSize(2);
       draw.BeginLines();
       draw.Vertex(aPart.Platform());
       draw.VertexWCS(PLATFORM.ConvertECIToWCS(aTargetLocECI));
       draw.End();
   end_script

   visual_part solar_panels WSF_VISUAL_PART
      pitch 90 degrees
   end_visual_part

   sensor sensor WSF_GEOMETRIC_SENSOR
      frame_time 2 s
      pitch -90 deg
      reports_location
      field_of_view circular
         half_angle 5 deg
      end_field_of_view
      yaw 0 degrees
   end_sensor

   comm comm COMM
      yaw 0 deg
   end_comm

   processor xmit WSF_SCRIPT_PROCESSOR
      update_interval 10 s
      on_update
         PLATFORM.Comm("comm").SendMessage(WsfControlMessage(), "ground_station", "comm");
      end_on_update
   end_processor

   processor Controller WSF_SCRIPT_PROCESSOR
      update_interval 10 s
      on_update
         WsfPlatform target = WsfSimulation.FindPlatform("target1");
         WsfPlatform groundStation = WsfSimulation.FindPlatform("ground_station");
         WsfSpaceMover sp = (WsfSpaceMover)PLATFORM.Mover();
         static double cMAX_RANGE = 1500000.0;
         if (PLATFORM.SlantRangeTo(target) < cMAX_RANGE)
         {
            writeln(TIME_NOW, " Orient sensor to target");
            OrientToTarget(PLATFORM.Sensor("sensor"), target.LocationECI());
         }
         else if (PLATFORM.SlantRangeTo(groundStation) < cMAX_RANGE)
         {
            writeln(TIME_NOW, "Orient comm to g station");
            OrientToTarget(PLATFORM.Comm("comm"), groundStation.LocationECI());
         }
         else
         {
            writeln(TIME_NOW, "Orient solar panels to sun");
            OrientToTarget(PLATFORM.VisualPart("solar_panels"), Sun.LocationECI(WsfDateTime.CurrentTime()));
         }
      end_on_update
   end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, mover, script, visual_part, sensor, comm, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, script_variables, on_initialize, script, processor, icon, mover, visual_part, 平台类型
- **出处**：`satellite_demos/5th_iridium_flares_demo.txt:158-281`
- **片段**：

```text
platform_type IRIDIUM WSF_PLATFORM

   script_variables
      Array<WsfVisualPart> mVisualParts = {};
   end_script_variables

   on_initialize
      mVisualParts.PushBack(PLATFORM.VisualPart("MMA1"));
      mVisualParts.PushBack(PLATFORM.VisualPart("MMA2"));
      mVisualParts.PushBack(PLATFORM.VisualPart("MMA3"));
      mVisualParts.PushBack(PLATFORM.VisualPart("SOLAR_PANEL"));
   end_on_initialize

   script void CheckFlares()

      foreach (WsfVisualPart part in mVisualParts)
      {
         if (part.Name() != "SOLAR_PANEL")  // still need to test solar panel geometry
         {
            Vec3 location = GetFlareLocation(part);
            string key = PLATFORM.Name() + "_" + part.Name();

            // check for existing flare
            WsfPlatform groundTrack = WsfSimulation.FindPlatform(key);

            if (! IsNull(location))
            {
               if (! groundTrack.IsValid())
               {
                  groundTrack = WsfSimulation.CreatePlatform("GROUND_TRACK");
                  groundTrack.SetLocation(WsfGeoPoint.ConstructWCS(location));
                  groundTrack.SetOrientationNED(0.0, 0.0, 0.0);
                  groundTrack.SetAuxData("SatelliteName", PLATFORM.Name());
                  groundTrack = WsfSimulation.AddPlatform(groundTrack, key);
                  sDrawIds[key] = sDrawId;
                  sDrawId += 1;
                  
                  if (mDraw)
                  {
                     int drawId = sDrawIds[key];
                     WsfDraw draw = {};
                     draw.SetId(drawId);
                     draw.SetColor(1.0, 0.2, 0.2);
                     draw.BeginLines();
                     draw.Vertex(part.Platform());
                     draw.Vertex(groundTrack);
                     draw.End();
                  }
               }
               else
               {
                  double oldConcealment = groundTrack.ConcealmentFactor();
                  groundTrack.SetConcealmentFactor(0.0);
                  Vec3 orientationNED = PLATFORM.OrientationNED();
                  groundTrack.SetOrientationNED(orientationNED[0], orientationNED[1], orientationNED[2]);
                  WsfGeoPoint loc = WsfGeoPoint.ConstructWCS(location);
                  loc.SetAltitudeAGL(10.0);
                  groundTrack.SetLocation(loc);
                  
                  if ((mDraw) && (oldConcealment == 1.0))
                  {
                     int drawId = sDrawIds[key];
                     WsfDraw draw = {};
                     draw.SetId(drawId);
                     draw.SetColor(1.0, 0.2, 0.2);
                     draw.BeginLines();
                     draw.Vertex(part.Platform());
                     draw.Vertex(groundTrack);
                     draw.End();
                  }
               }

            }
            else if (groundTrack.IsValid())
            {
               double oldConcealment = groundTrack.ConcealmentFactor();
               groundTrack.SetConcealmentFactor(1.0);

               // set below the surface
               groundTrack.SetLocation(groundTrack.Latitude(), groundTrack.Longitude(), -2000.0);
               groundTrack.SetVelocityNED(0.0, 0.0, 0.0);

               if ((mDraw) && (oldConcealment == 0.0))
               {
                  // erase the line
                  int drawId = sDrawIds[key];
                  WsfDraw draw = {};
                  draw.Erase(drawId);
               }
            }
         }
      }
   end_script

   processor CheckFlaresProcessor WSF_SCRIPT_PROCESSOR
      update_interval 10 s
      on_update
         CheckFlares();
      end_on_update
   end_processor

   icon satellite
   mover WSF_NORAD_SPACE_MOVER
      attitude_controller instant
         orientation nadir_with_eci_velocity_constraint
      end_attitude_controller
   end_mover
   visual_part MMA1 WSF_VISUAL_PART
      yaw 0 deg
      pitch 50 deg
   end_visual_part
   visual_part MMA2 WSF_VISUAL_PART
      yaw 120 deg
      pitch 50 deg
   end_visual_part
   visual_part MMA3 WSF_VISUAL_PART
      yaw -120 deg
      pitch 50 deg
   end_visual_part
   visual_part SOLAR_PANEL WSF_VISUAL_PART
      yaw 0 deg
      pitch -45.0 deg  // initial guess
   end_visual_part
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：script_variables, on_initialize, script, processor, icon, mover, visual_part

### platform_type · WSF_BRAWLER_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_BRAWLER_PLATFORM, icon, mover, mind_file, weapon, comm, sensor, processor, 平台类型
- **出处**：`base_types/platforms/brawler/brawler_platform.txt:72-208`
- **片段**：

```text
platform_type  BRAWLER_PLATFORM  WSF_BRAWLER_PLATFORM

   icon F-15

   mover WSF_BRAWLER_MOVER
      aero_file ACFT_BD.FXW
      #draw_projection
   end_mover

   mind_file MIND
   #draw_alternatives
   #draw_nominal_states
   #debug

   weapon srm BLUE_SR_A2A_IR_MISSILE
      quantity 2
   end_weapon

   weapon gun BULLET
      quantity 12   #each "bullet" represents a 1-sec burst of gunfire
   end_weapon

   comm datalink WSF_COMM_TRANSCEIVER
      network_name brawler_net
      internal_link data_mgr
      internal_link task_mgr
      internal_link perception
   end_comm

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

   processor data_mgr WSF_TRACK_PROCESSOR
      purge_interval  60 sec
      report_interval 1.0 sec
      report_to commander via datalink
      fused_track_reporting on
      raw_track_reporting off
   end_processor

   processor perception WSF_PERCEPTION_PROCESSOR
      threat_update_interval 2 sec
      max_threat_load 5
      reports_self on
      report_interval 1.0 sec
      report_to commander via datalink
   end_processor

   processor incoming_threats WSF_THREAT_PROCESSOR
      threat_time_to_intercept 120 sec   #default: 60 sec
   end_processor

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
end_platform_type
```

- **演示要点**：演示 WSF_BRAWLER_PLATFORM 的参数：icon, mover, mind_file, weapon, comm, sensor, processor

### platform_type（mechanic）｜平台类型

- **关键词**：platform_type, icon, add, edit, mover, script, on_initialize2, execute, 平台类型
- **出处**：`logistics/platforms/mechanic.txt:12-160`　（同签名共 4 处，另见 `logistics/platforms/fueling_truck.txt:11`、`logistics/platforms/semi_tanker_truck.txt:12`、`logistics/platforms/ocean_going_tanker.txt:13`）
- **片段**：

```text
platform_type MECHANIC LOGISTICS_PLATFORM

   # DESCRIPTION:  A Mechanic waits stationary (wherever he is), until needed,
   # unless he gets depleted, when he returns to his supplier for refilling.

   icon Human

   add processor transportProcessor PLATFORM_TO_PLATFORM_TRANSPORT_PROCESSOR
   end_processor

   edit processor exchanger

      edit container good_engine_container
         service ENGINE_REPAIR
            maximum_quantity 14
            service_interval 30 min
         end_service
         initial_quantity 14  # We can fully supply 14 engine repairs non-stop.
      end_container

      edit transactor repair_offering_transactor
         time_out_clock_interval  3.0 sec
      end_transactor

      edit transactor repair_requesting_transactor
         time_out_clock_interval  3.0 sec
      end_transactor

   end_processor

   mover WSF_SURFACE_MOVER
      maximum_speed 25 mph
      minimum_speed 10 mph
      maximum_linear_acceleration 0.5 g
      maximum_radial_acceleration 0.5 g
      update_interval 5 sec
   end_mover

   script bool Mech_Init()

      repairPossibleReceiversToAdd.PushBack("StrikeBomber_1");
      repairPossibleReceiversToAdd.PushBack("StrikeBomber_2");
      repairPossibleReceiversToAdd.PushBack("StrikeBomber_3");
      repairPossibleReceiversToAdd.PushBack("StrikeBomber_4");
      repairPossibleReceiversToAdd.PushBack("StrikeBomber_5");
      repairPossibleReceiversToAdd.PushBack("StrikeBomber_6");

      repairPossibleSuppliersToAdd.PushBack("KeyWestAirportPartsStorageDepot");

      bool success = LP_Init();
      return success;

   end_script

   on_initialize2

      bool success = Mech_Init();

      if (success)
      {
         transportProcessor = PLATFORM.Processor("transportProcessor");
         success = transportProcessor.IsValid();
      }

      if (success)
      {
         # These are declared as variables, rather than in-lined, simply to document syntax.
         bool isFuelRelated = false;
         success = (bool)transportProcessor.Execute("PTPTP_Init",
                  { repairOfferTransactor, repairContainer, runSilent, isFuelRelated } );

         if (! success)
         {
            Say("MECHANIC failed PTPTP_Init().");
         }
      }

      if (success)
      {
         Say(" Initialized.");
         isInitialized = true;
      }
      else
      {
         Say(" Initialize FAILED");
      }

   end_on_initialize2

   execute at_interval_of 204 sec

      if (isInitialized && ! allPlayersResolved)
      {
         allPlayersResolved = ResolvePlayersToAdd();
         if (! allPlayersResolved)
         {
            Say("ResolvePlayersToAdd() not yet successful.");
            return;
         }

         if (repairPossibleSuppliers.Size() == 1)
         {
            SetRepairOfferingPlatform(repairPossibleSuppliers[0]);
         }
         if (! RepairOfferingPlatform().IsValid())
         {
            Say(" MECHANIC's Repair Resupply Depot assignment failed.  FATAL!");
            writeln("   - problem is with one of =>");
            foreach(string val in repairPossibleSuppliersToAdd)
            {
               writeln("      ", val);
            }
            allPlayersResolved = false;
         }
      }

      if (isInitialized && allPlayersResolved)
      {
         # Update a couple of critical flags:
         if (repairContainer.IsEmpty())
         {
            Say("MECHANIC ran out of repairs to give.");
            haveRepairsToGive = false;
            repairsAreReserved = false;
         }
         if (repairContainer.IsFull() && ! haveRepairsToGive)
         {
            Say("MECHANIC now has a full load of repairs to give.");
            haveRepairsToGive = true;
         }

         // Our job is to continuously make repairs available for any requesting receivers
         if (haveRepairsToGive && ! repairsAreReserved)
         {
            repairsAreReserved = repairOfferTransactor.ReserveAll();
            if (repairsAreReserved)
            {
               Say("MECHANIC Repairs Reserve was successful.");
            }
            else
            {
               Say("MECHANIC Repairs Reserve was NOT successful.");
            }
         }
      }

   end_execute

end_platform_type
```

- **演示要点**：演示 platform_type 的参数：icon, add, edit, mover, script, on_initialize2, execute

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, weapon_effects, mover, processor, radar_signature, comm, sensor, 平台类型
- **出处**：`new_guidance/weapons/ssm/ssm_missile.txt:52-202`
- **片段**：

```text
platform_type SSM203 WSF_PLATFORM
   icon missile
   weapon_effects SSM203_LETHALITY
   mover WSF_GUIDED_MOVER
#      debug
      #show_status
      update_interval        0.5 s
      integration_timestep   0.05 s

      stage 1
         # Boost 1st phase
         empty_mass          168.19 lb
         fuel_mass           191.68 lb
         thrust              14906.6 lbsf
         thrust_duration     3.27 sec
         aero                SSM203_BOOST_AERO
      end_stage
      stage 2 # Second Stage LightOff
         empty_mass          0.01 lb
         fuel_mass           10.0 lb
         thrust              800 lbsf
         thrust_duration     23 sec
         aero                SSM203_CRUISE_AERO
      end_stage

      stage 3
         # cruise stage
         empty_mass          204.44 lb
         fuel_mass           57.56 lb
         thrust              140 lbsf
         thrust_duration     700 sec  # maximum thrust duration time
         aero                SSM203_CRUISE_AERO
      end_stage
      # pre-briefed route (option example)
#      route
#        position 39.0n 89.5w
#        position 38.8n 89.5w
#        #position 38.6n 90.3w # altitude 1 m agl
#      end_route
   end_mover

   processor guidance WSF_GUIDANCE_COMPUTER
      #show_status
      #show_evaluations
      #debug

      phase LAUNCH
#         allow_route_following    true # if a route is planned
         commanded_altitude      68000 ft
         commanded_speed         2900 fps
         maximum_pitch_angle           30 deg
         proportional_navigation_gain  15.0
         velocity_pursuit_gain         15.0

#        next_phase POPUP when target_slant_range < 3000 m #  option
#        next_phase TERMINAL  when target_slant_range < 6000 m # option
#        next_phase CRUISE when altitude > 66000 ft # option
         next_phase CRUISE when phase_time > 100 sec
      end_phase

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

# more options
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

#      phase POPUP
#         # Command a ridiculous altitude... we just go up until the target
#         # elevation angle is correct...
#
#         commanded_altitude 6000 m
#
#         next_phase DIVE when target_elevation < -20 deg
#
#         proportional_navigation_gain  10.0
#         velocity_pursuit_gain         5.0
#      end_phase
#
      phase TERMINAL
         #proportional_navigation_gain  40.0
         #omit_velocity_pursuit
         commanded_speed              2200 fps
         velocity_pursuit_gain        5.0
        proportional_navigation_gain  40
        maximum_pitch_angle           90 deg
        maximum_commanded_g           25 g
      end_phase
   end_processor

   processor fuse WSF_GROUND_TARGET_FUSE
   end_processor

   radar_signature VEHICLE_RADAR_SIGNATURE

   comm uplink WSF_COMM_TRANSCEIVER
      internal_link data_mgr
   end_comm

   processor task_mgr WSF_TASK_PROCESSOR
   end_processor
   processor data_mgr WSF_TRACK_PROCESSOR
      purge_interval 400 seconds
   end_processor

#   processor seeker WSF_PERFECT_TRACKER
#      update_interval 0.5 sec
#   end_processor

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

   processor seeker_turn_on WSF_WEAPON_TRACK_PROCESSOR
     # switch_time 10 sec
     # turn_on_sensor seeker 80.0 sec after_launch
     turn_on_sensor seeker at_range 30000.0 m before_intercept
   end_processor


end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, weapon_effects, mover, processor, radar_signature, comm, sensor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, mover, fuel, processor, weapon, comm, sensor, 平台类型
- **出处**：`brawler/platforms/brawler_platform.txt:83-261`
- **片段**：

```text
platform_type  BRAWLER_PLATFORM  WSF_PLATFORM
   icon F-15

   mover WSF_BRAWLER_MOVER
      aero_file platforms/ACFT_BD.FXW
      #draw_projection
   end_mover

   fuel WSF_BRAWLER_FUEL
      aero_file platforms/ACFT_BD.FXW
   end_fuel

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

   weapon srm BLUE_SR_A2A_IR_MISSILE
      quantity 2
   end_weapon

   weapon gun BULLET
      quantity 12   #each "bullet" represents a 1-sec burst of gunfire
   end_weapon

   comm datalink WSF_COMM_TRANSCEIVER
      propagation_speed 0 m/s   #instantaneous propogation (faster than speed of light)
      network_name brawler_net
      internal_link data_mgr
      internal_link thinker
      internal_link perception
   end_comm

   sensor simple_sensor WSF_GEOMETRIC_SENSOR
      on
      #azimuth_field_of_view   -45.0 degrees  45.0 degrees
      #elevation_field_of_view  -20.0 degrees   20.0 degrees
      azimuth_field_of_view   -180.0 degrees  180.0 degrees
      elevation_field_of_view  -90.0 degrees   90.0 degrees
      maximum_range 150 km
      frame_time    2 sec     #TEST
     #frame_time    0.3 sec   #TEST
      reports_location
      reports_velocity
      reports_range
      reports_iff
      track_quality 1.0
      internal_link data_mgr
      ignore_same_side
   end_sensor

#   execute at_interval_of 1 sec
#      WsfSensor seeker = PLATFORM.Sensor("RADAR_SEEKER");
#      if (!seeker.IsValid())
#      {
#         writeln("seeker not valid!");
#         return;
#      }
#
#      writeln(" SEARCH: ", seeker.ActiveRequestCount("SEARCH"),
#              ", TRACK: ", seeker.ActiveRequestCount("TRACK"),
#              ", FOCUS: ", seeker.ActiveRequestCount("FOCUS"));
#
#      foreach(WsfLocalTrack lt in PLATFORM.MasterTrackList())
#      {
#         double R = PLATFORM.SlantRangeTo(lt);
#         writeln("T=",TIME_NOW,", ",PLATFORM.Name()," range to ", lt.TargetName()," = ", R);
#         if       (R < 2000)
#         {
#            seeker.StartTracking(lt,"FOCUS");
#         }
#         else if  (R < 5000)
#         {
#            seeker.StartTracking(lt,"TRACK");
#         }
#         else #if (R >= 5000)
#         {
#            seeker.StartTracking(lt,"SEARCH");
#         }
#      }
#   end_execute

   processor data_mgr WSF_TRACK_PROCESSOR
      purge_interval  60 sec
     report_interval 5.0 sec
     #report_interval 2.0 sec
      #report_interval 0.25 sec           #TEST
      unchanged_track_reporting enable   #TEST
      report_to commander via datalink
      fused_track_reporting on
      raw_track_reporting off
      circular_report_rejection true
   end_processor

   processor perception WSF_PERCEPTION_PROCESSOR
#      threat_update_interval 2 sec
#      max_threat_load 5
      reports_self on
      report_interval 1.0 sec
      report_to commander via datalink
   end_processor

   processor incoming_threats WSF_THREAT_PROCESSOR
      threat_time_to_intercept 120 sec   #default: 60 sec
   end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, mover, fuel, processor, weapon, comm, sensor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, optical_signature, script, mover, processor, script_variables, execute, 平台类型
- **出处**：`signature_demos/platforms/rocket.txt:43-253`
- **片段**：

```text
platform_type ROCKET WSF_PLATFORM
   icon Missile
   optical_signature ROCKET_OPTICAL_SIG

   # Switch the signature stage based on what stage separated
   script void on_stage_separation(int aStage)
      if (aStage == 1) SetOpticalSigState("STAGE_2_RV");
      if (aStage == 2) SetOpticalSigState("RV_ONLY");
   end_script

   mover SSM_MOVER_BASE
      # Treat this as a simple launch vehicle and not a weapon (no 'weapon_effects' or fuse)
      check_for_ground_impact

      stage 1
         # Add some coast between stages so we can see the plume change
         pre_separation_coast_time 4.0 sec
      end_stage
   end_mover

   processor guidance SSM_GUIDANCE_BASE
      phase ASCENT
         guidance_delay 5000.0 sec
      end_phase
   end_processor
   script void DoSample()
      writeln("T=", TIME_NOW, " (", TIME_NOW - CreationTime(), ") ", Name(),
              ", Altitude = ", Format.Fixed(Altitude(), 1), " m", ", Mach = ", Format.Fixed(MachNumber(), 2),
              ", FPA = ", Format.Fixed(Pitch(), 2), " deg");
      SamplePoint(PLATFORM, 0.0, 0.0);
      SamplePoint(PLATFORM, 90.0, 0.0);
      SamplePoint(PLATFORM, 180.0, 0.0);
   end_script

   script void TestArea(double aViewAngle,
                        double aExpectedArea)
      gTEST_COUNT = gTEST_COUNT + 1;
      double r = 10000.0;
      Vec3 obsLocECS = Vec3.Construct(r * Math.Cos(aViewAngle), r * Math.Sin(aViewAngle), 0.0);
      Vec3 obsLocWCS = ConvertECSToWCS(obsLocECS);
      WsfGeoPoint obsLoc = WsfGeoPoint.ConstructWCS(obsLocWCS);
      double area = ProjectedArea(obsLoc, 1.0);
      if (Math.Fabs(area - aExpectedArea) > 0.01)
      {
         gFAIL_COUNT = gFAIL_COUNT + 1;
         writeln("-FAIL- T=", TIME_NOW, " (", TIME_NOW - CreationTime(), ")",
                 ", angle=", aViewAngle, " area=", area, ", expected=", aExpectedArea);
      }
   end_script

   script void TestAreas(double aExpected_0,
                         double aExpected_90,
                         double aExpected_180)
      TestArea(0.0, aExpected_0);
      TestArea(90.0, aExpected_90);
      TestArea(180.0, aExpected_180); # porjected area is the same for 0 deg and 180 deg view angles
   end_script

   script_variables
   # head on = 0 deg, cRV_0 < cSTAGE_x_PLUME_0 (since the plume has a larger diameter than the RV)
      double cRV_0 = Math.PI() * 0.7 * 0.7;            # head on to RV cone: A_circle =  pi*r^2 = pi*(0.7^2)
      double cRV_90 = 1.0 * 0.7;                       # RV @ 90 deg: 2*A_triangle = length*radius = 1.0*0.7
      double cSTAGE_12_90 = (2.0 * 0.7) * 10.0;        # Stage 1+2 cylinder @ 90 deg: A_rect = 2*r*h = 2*0.7*10.0
      double cSTAGE_2_90  = (2.0 * 0.7) * 4.0;         # Stage 2 cylinder @ 90 deg: A_rect = 2*r*h = 2*0.7*4.0
      double cSTAGE_1_PLUME_0 = Math.PI() * 1.0 * 1.0; # head on to plume: A_circle =  pi*r^2 = pi*(0.1^2)
      double cSTAGE_1_PLUME_90 = (2.0 * 1.0)* 50.0;    # Plume @ 90 deg: A_rect = 2*r*h = 2*1.0*50.0
      double cSTAGE_2_PLUME_0  = cSTAGE_1_PLUME_0;     # Plume is same dimensions for stage 1 and 2
      double cSTAGE_2_PLUME_90 = cSTAGE_1_PLUME_90;
   end_script_variables

   # Midway through 1st stage (0-90)
   execute at_time  45 sec relative
      DoSample();
      
      # draw point midway through 1st stage
      WsfDraw mid1st = WsfDraw();
      mid1st.SetId("mid1st");
      mid1st.SetPointSize(10);
      mid1st.BeginPoints();
      mid1st.Vertex(PLATFORM.Location());
      mid1st.End();
      
      mid1st.BeginText("mid 1st stage");
      mid1st.Vertex(PLATFORM.Location());
      mid1st.End();
   end_execute
   execute at_time  45 sec relative
     TestAreas(cSTAGE_1_PLUME_0,
               cRV_90 + cSTAGE_12_90 + cSTAGE_1_PLUME_90,
               cSTAGE_1_PLUME_0);
   end_execute

   # Midway through pre-separation coast (90-94)
   execute at_time  92 sec relative
      DoSample();
      
      # draw point midway through pre-separation coast
      WsfDraw midPreSepCoast = WsfDraw();
      midPreSepCoast.SetId("midPreSepCoast");
      midPreSepCoast.SetPointSize(10);
      midPreSepCoast.BeginPoints();
      midPreSepCoast.Vertex(PLATFORM.Location());
      midPreSepCoast.End();
      
      midPreSepCoast.BeginText("mid pre-separation coast");
      midPreSepCoast.Vertex(PLATFORM.Location());
      midPreSepCoast.End();
   end_execute
   execute at_time  92 sec relative
     TestAreas(cRV_0,
               cRV_90 + cSTAGE_12_90,
               cRV_0);
   end_execute

   # Midway through 2nd stage (94-130)
   execute at_time 117 sec relative
      DoSample();
      
      # draw point midway through 2nd stage
      WsfDraw mid2ndDraw = WsfDraw();
      mid2ndDraw.SetId("mid2nd");
      mid2ndDraw.SetPointSize(10);
      mid2ndDraw.BeginPoints();
      mid2ndDraw.Vertex(PLATFORM.Location());
      mid2ndDraw.End();
      
      mid2ndDraw.BeginText("mid 2nd stage");
      mid2ndDraw.Vertex(PLATFORM.Location());
      mid2ndDraw.End();
   end_execute
   execute at_time 117 sec relative
     TestAreas(cSTAGE_2_PLUME_0,
               cRV_90 + cSTAGE_2_90 + cSTAGE_2_PLUME_90,
               cSTAGE_2_PLUME_0);
   end_execute

   # After burnout (130)
   execute at_time 140 sec relative
      DoSample();
      
      # draw the post burnout point
      WsfDraw postBurnoutDraw = WsfDraw();
      postBurnoutDraw.SetId("postburnout");
      postBurnoutDraw.SetPointSize(10);
      postBurnoutDraw.BeginPoints();
      postBurnoutDraw.Vertex(PLATFORM.Location());
      postBurnoutDraw.End();
      
      postBurnoutDraw.BeginText("post burnout");
      postBurnoutDraw.Vertex(PLATFORM.Location());
      postBurnoutDraw.End();
   end_execute
   
   execute at_time 140 sec relative
     TestAreas(cRV_0,
               cRV_90,
               cRV_0);
   end_execute

   # Near apogee (FPA ~ 0)
   execute at_time 480 sec relative
      DoSample();
      
      # draw the apogee point
      WsfDraw apogeeDraw = WsfDraw();
      apogeeDraw.SetId("apogee");
      apogeeDraw.SetColor(0.0,1.0,0.0);
      apogeeDraw.SetPointSize(10);
      apogeeDraw.BeginPoints();
      apogeeDraw.Vertex(PLATFORM.Location());
      apogeeDraw.End();
      
      apogeeDraw.BeginText("apogee");
      apogeeDraw.Vertex(PLATFORM.Location());
      apogeeDraw.End();
   end_execute

   # Coming back in to the atmosphere (Altitude ~83 KM)
   execute at_time 830 sec relative
      DoSample();
      
      # draw the atmospheric reentry point
      WsfDraw reentryDraw = WsfDraw();
      reentryDraw.SetId("reentry");
      reentryDraw.SetPointSize(10);
      reentryDraw.BeginPoints();
      reentryDraw.Vertex(PLATFORM.Location());
      reentryDraw.End();
      
      reentryDraw.BeginText("reentry");
      reentryDraw.Vertex(PLATFORM.Location());
      reentryDraw.End();
   end_execute

   # Near impact
   execute at_time 880 sec relative
      DoSample();
      
      # draw the near impact point
      WsfDraw impactDraw = WsfDraw();
      impactDraw.SetId("impact");
      impactDraw.SetPointSize(10);
      impactDraw.BeginPoints();
      impactDraw.Vertex(PLATFORM.Location());
      impactDraw.End();
      
      impactDraw.BeginText("impact");
      impactDraw.Vertex(PLATFORM.Location());
      impactDraw.End();
   end_execute
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, optical_signature, script, mover, processor, script_variables, execute

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, category, aux_data, include, processor, comm, track_manager, 平台类型
- **出处**：`air_to_air/platforms/brawler_test.txt:284-502`
- **片段**：

```text
platform_type  BRAWLER_TEST_AIRMOVER  WSF_PLATFORM
   icon f15c
   category AIRCRAFT
   category EZJA

   aux_data 
      bool captured = false // set to true if captured which is brawler lingo meaning landed at a base
   end_aux_data

   # define global script variables attached to this platform type - these are used in the EZJA behavior tree
   include rules/ezja_script_variables.txt

#   processor thinker WSF_BRAWLER_PROCESSOR
#      mind_file platforms/mind
#      consciousness_event_update_time 0.5 s
#   end_processor
   
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
/*
   *******  PHASE CHANGING LOGIC ********
*/
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
/*
   *******  WEAPON EMPLOYMENT DECISION ********
*/
            sequence  # weapon logic
               behavior_node select_wpn     // pair a weapon w/ target track
               behavior_node shoot_it       // loop through shoot list, fire weapon if proper conditions are met
               behavior_node sam_shoot_it   // fire weapon against SAMs if proper conditions are met
            end_sequence
         end_sequence 
      end_advanced_behavior_tree   

   end_processor
   
   comm datalink WSF_COMM_TRANSCEIVER
      propagation_speed 0 m/s   #instantaneous propogation (faster than speed of light)
      network_name brawler_net
      internal_link data_mgr
      internal_link tsk_mgr
      internal_link thinker
      internal_link perception
      internal_link assessment
   end_comm

   comm wpn_datalink WSF_COMM_XMTR 
      propagation_speed 0 m/s   #instantaneous propogation (faster than speed of light)
      network_name weapons_subnet
      internal_link data_mgr
      internal_link raw_data_mgr
   end_comm

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

   track_manager 
      fusion_method weighted_average
      end_fusion_method
   end_track_manager
   
   processor tsk_mgr WSF_TASK_PROCESSOR 
      on
      internal_link data_mgr
   end_processor

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
   
   // processor is not used within the behavior tree but must exist on the platform in order to use Brawler Processor
   processor incoming_threats WSF_THREAT_PROCESSOR
      threat_time_to_intercept 120 sec   #default: 60 sec
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, category, aux_data, include, processor, comm, track_manager

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, spatial_domain, side, icon, radar_signature, infrared_signature, optical_signature, processor, 平台类型
- **出处**：`six_dof/platforms/agm-mrc.txt:74-322`
- **片段**：

```text
platform_type  AGM-MRC  WSF_PLATFORM

   spatial_domain        air
   side                  blue
   icon                  agm109
   radar_signature       SIMPLE_FIGHTER_RCS
   infrared_signature    SIMPLE_FIGHTER_IR_SIG
   optical_signature     SIMPLE_FIGHTER_OPTICAL_SIG

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
   
   processor data_mgr WSF_TRACK_PROCESSOR
      on
      master_track_processor
      #show_state_transitions
      update_interval 0.01 sec
      purge_interval  1 hr
   end_processor  
   
   processor guidance WSF_SIX_DOF_GUIDANCE_COMPUTER

      update_interval 0.1 sec      

      phase LAUNCH
         proportional_navigation_gain    0
         velocity_pursuit_gain           0
         g_bias                          1
         next_phase CRUISE when altitude < 500 ft
      end_phase

      phase FLANK
         commanded_altitude 150 ft
         commanded_speed 450 knots
         
         proportional_navigation_gain    4
         velocity_pursuit_gain           10
         lateral_g_bias                  0.1
         
         next_phase INGRESS when range_to_intercept < 50 km
      end_phase

      phase CRUISE
         allow_route_following on
         
         proportional_navigation_gain    4
         velocity_pursuit_gain           10
         
         next_phase INGRESS when target_ground_range < 20 km
      end_phase

      phase INGRESS
         commanded_altitude 150 ft
         commanded_speed 450 knots
         
         proportional_navigation_gain    4
         velocity_pursuit_gain           10
         
         next_phase TERMINAL_LOFT when range_to_intercept < 7 km
      end_phase

      phase TERMINAL_LOFT
         commanded_speed 1000 knots

         time_constant                   0.01 sec
         proportional_navigation_gain    4
         velocity_pursuit_gain           10
         g_bias                          4
         
         next_phase TERMINAL when range_to_intercept < 5 km
      end_phase
      
      phase TERMINAL
         commanded_speed 1000 knots
         
         time_constant                   0 sec
         proportional_navigation_gain    4
         velocity_pursuit_gain           10
         g_bias                          1
      end_phase
   end_processor
   

   # This will lock-on to the pre-briefed target,
   # if a track exits.
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
   
   /*
   processor pitchup WSF_SCRIPT_PROCESSOR
      off      
      update_interval 0.1 sec
      
      script_variables
         bool pitchUpInitiated      = false;
         bool terminalDiveInitiated = false;
      end_script_variables
      
      on_update
      
         if( !pitchUpInitiated )
         {
            WsfTrack trk = PLATFORM.CurrentTargetTrack();
            if( trk.IsValid() )
            {
               if( trk.IsNull() ) { writeln(" Null Track!"); }

               double rng = PLATFORM.SlantRangeTo(trk);
               if( rng < 2200.0 )
               {
                  writeln("Missile begins pitchup ...");

                  pitchUpInitiated = true;
                  
                  WsfSixDOF_Mover mover = (WsfSixDOF_Mover)PLATFORM.Mover();
                  if(!mover.IsNull())
                  {
                     mover.SetPitchGLoad(8.0);            // Pull up
                     mover.SetAutopilotRollAngle(0.0);    // Wings level
                     mover.SetAutopilotSpeedKTAS(1000.0); // Go fast                  
                  }               
               }
            }
         }
         else if( !terminalDiveInitiated )
         {
            WsfTrack trk = PLATFORM.CurrentTargetTrack();
            if( trk.IsValid() )
            {
               #WsfGeoPoint tgtPt = trk.CurrentLocation();
               double rng = PLATFORM.SlantRangeTo(trk);
               
               if( rng < 1600.0 )
               {
                  writeln("Missile begins pushover dive ...");
                  terminalDiveInitiated = true;
                  
                  if( trk.IsNull() ) { writeln(" Null Track!"); }

                  PLATFORM.GoToLocation( trk.Latitude(), trk.Longitude(), trk.Altitude() );
                  
                  WsfSixDOF_Mover mover = (WsfSixDOF_Mover)PLATFORM.Mover();
                  if(!mover.IsNull())
                  {
                     #mover.SetPitchGLoad(-8.0);          // Pull up
                     #mover.SetAutopilotRollAngle(0.0);    // Wings level
                     mover.SetAutopilotSpeedKTAS(1000.0); // Go fast                                      
                  }
               }
            }
         }
         else
         {
            WsfTrack trk = PLATFORM.CurrentTargetTrack();
            if( trk.IsValid() )
            {
               double rng = PLATFORM.GroundRangeTo(trk);

               if( rng < 100.0 )
               {
#                 There appears to be a problem with casting a processor to a fuse (below)               
#                 writeln("BANG!!!! ", PLATFORM.Name(), " exploded at time = ", TIME_NOW);
#                  WsfProcessor proc = PLATFORM.Processor("fuse");
#                  if(proc.IsValid())
#                  {
#                     if(proc.IsA_TypeOf("WSF_WEAPON_FUSE"))
#                     {
#                        WsfWeaponFuse fuse = (WsfWeaponFuse)proc;
#                        if(fuse.IsValid())
#                        {
#                           if(!fuse.IsNull())
#                           {
#                              fuse.Detonate();
#                           }
#                        }
#                     }
#                  }
#                  PLATFORM.Detonate("dud");
               }
            }         
         }

      end_on_update
      
   end_processor
   */
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：spatial_domain, side, icon, radar_signature, infrared_signature, optical_signature, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, indestructible, height, length, width, mover, 平台类型
- **出处**：`ciws/platforms/air_target.txt:10-18`　（同签名共 2 处，另见 `gun_engagement/platforms/air_target.txt:11`）
- **片段**：

```text
platform_type AIR_TARGET WSF_PLATFORM
   icon f-18
   indestructible
   height 8 ft
   length 40 ft
   width 25 ft
   mover WSF_AIR_MOVER
   end_mover
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, indestructible, height, length, width, mover

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, side, mover, eccentricity, inclination, semi_major_axis, 平台类型
- **出处**：`satellite_demos/6th_Hohmann_leo_orbit_transfer_demo.txt:23-33`
- **片段**：

```text
platform_type satellite WSF_PLATFORM
  icon Satellite
  side blue
  mover WSF_SPACE_MOVER 
  end_mover

  // Common orbital elements
  eccentricity 0.0 // circular orbit
  inclination 29.5 deg
  semi_major_axis 6778 km // 6378km (mean earth radius) + 400 km altitude
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, mover, eccentricity, inclination, semi_major_axis

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, mover, aero, mass, update_interval, processor, 平台类型
- **出处**：`script_demos/script_demo_2.txt:113-124`　（同签名共 2 处，另见 `script_demos/script_demo_5.txt:153`）
- **片段**：

```text
platform_type BOMB_1000_LB WSF_PLATFORM
  icon jdam
  mover WSF_GUIDED_MOVER
    aero BOMB_1000_LB_AERO
    mass 1015.0 lbm
    update_interval 0.5 s
  end_mover
  processor guidance_computer BOMB_GUIDANCE_COMPUTER
  end_processor
  processor detonator CONTACT_FUSE
  end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, mover, aero, mass, update_interval, processor

### platform_type（1v1_initial_prediction）｜平台类型

- **关键词**：platform_type, side, commander, command_chain, heading, route, delete, 平台类型
- **出处**：`air_to_air/scenarios/1v1_initial_prediction.txt:258-272`　（同签名共 2 处，另见 `air_to_air/scenarios/1v1_initial_prediction.txt:295`）
- **片段**：

```text
platform_type red_maneuver_target RED_FIGHTER_PM6
   side dark_red
   commander SELF
   command_chain IFLITE SELF
   command_chain ELEMENT SELF
   heading 270 deg
      
   route
      position 00:00:00.00n 01:10:00.00e  altitude 30000.00 ft speed 300 m/s
      position 00:00:00.00n 01:00:00.00e  altitude 30000.00 ft speed 300 m/s
   end_route

   delete processor assessment

end_platform_type
```

- **演示要点**：演示 platform_type 的参数：side, commander, command_chain, heading, route, delete

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, side, radar_signature, mover, sensor, processor, 平台类型
- **出处**：`sensor_demos/esm_demo.txt:134-150`　（同签名共 2 处，另见 `sensor_demos/esm_tdoa_demo.txt:153`）
- **片段**：

```text
platform_type STRIKER_PLATFORM WSF_PLATFORM
   icon F-18E
   side blue

   radar_signature FIGHTER_RADAR_SIGNATURE

   mover WSF_AIR_MOVER end_mover

   sensor esm ESM_SENSOR
      on
      processor track_manager
      ignore_same_side
   end_sensor

   processor track_manager WSF_TRACK_PROCESSOR
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, radar_signature, mover, sensor, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, infrared_signature, optical_signature, radar_signature, mover, processor, 平台类型
- **出处**：`ballistic_missile_shootdown/weapons/ssm/red_mrbm_1.txt:110-127`　（同签名共 26 处，另见 `ballistic_missile_shootdown/weapons/ssm/red_mrbm_1.txt:150`、`base_types/weapons/sam/blue_lr_sam_common.txt:106`、`base_types/weapons/ssm/red_icbm_2.txt:70`）
- **片段**：

```text
platform_type RED_MRBM_1_SPENT_STAGE_1 WSF_PLATFORM
   icon Scud_Missile

   infrared_signature RED_MRBM_1_SPENT_STAGE_1_INFRARED_SIG
   optical_signature  RED_MRBM_1_SPENT_STAGE_1_OPTICAL_SIG
   radar_signature    RED_MRBM_1_SPENT_STAGE_1_RADAR_SIG

   mover WSF_GUIDED_MOVER
      integration_timestep   0.01 secs
      stage 1
         aero                RED_MRBM_1_SPENT_STAGE_1_AERO
         total_mass          1618.0 kg
      end_stage
   end_mover

   processor fuse WSF_GROUND_TARGET_FUSE
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, infrared_signature, optical_signature, radar_signature, mover, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, mover, radar_signature, sensor, weapon, processor, 平台类型
- **出处**：`electronic_warfare/repeater_jamming.txt:234-251`　（同签名共 10 处，另见 `electronic_warfare/agile_auto-repeater_jamming.txt:253`、`electronic_warfare/agile_jamming.txt:314`、`electronic_warfare/agile_repeater_jamming-rt1.txt:368`）
- **片段**：

```text
platform_type JAMMER_PLATFORM WSF_PLATFORM
   icon EA-6B
   mover WSF_AIR_MOVER end_mover
   radar_signature WIDE_BODY_SIGNATURE

   sensor repeater_esm REPEATER_ESM_SENSOR
      on
      internal_link track_manager
      internal_link jammer
   end_sensor

   weapon jammer JAMMER
      pitch   -10 deg                  // Aim jammer slightly toward the ground
   end_weapon

   processor track_manager WSF_TRACK_PROCESSOR
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, mover, radar_signature, sensor, weapon, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, infrared_signature, optical_signature, radar_signature, comm, processor, 平台类型
- **出处**：`electronic_warfare/test_false_targets/platforms/red_radar.txt:18-36`　（同签名共 6 处，另见 `heatmap/platforms/red_radar.txt:18`、`iads/platforms/red_radar.txt:18`、`iads/platforms/iads_cmdr.txt:127`）
- **片段**：

```text
platform_type RED_RADAR WSF_PLATFORM
  icon Ground_Radar

  infrared_signature   VEHICLE_INFRARED_SIGNATURE
  optical_signature    VEHICLE_OPTICAL_SIGNATURE
  radar_signature      VEHICLE_RADAR_SIGNATURE

  comm datalink RED_DATALINK
     network_name <local:slave>
     internal_link task_mgr
  end_comm

  processor data_mgr WSF_LINKED_PROCESSOR
     report_to commander via datalink
  end_processor

  processor task_mgr RED_RADAR_TACTICS
  end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, infrared_signature, optical_signature, radar_signature, comm, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, category, comm, processor, purge_interval, weapon, 平台类型
- **出处**：`cyber/exfiltrate_demo/platforms/large_sam_launcher.txt:16-37`
- **片段**：

```text
platform_type LARGE_SAM_LAUNCHER WSF_PLATFORM
  icon SA-10_Launcher

  category iads

  comm cmdr_net RED_DATALINK
     network_name <local:slave>
     internal_link data_mgr
     internal_link task_mgr
  end_comm

  processor data_mgr WSF_TRACK_PROCESSOR
    purge_interval       60 sec
  end_processor

  processor task_mgr WSF_TASK_PROCESSOR
  end_processor

  weapon sam LARGE_SAM
     quantity 4
  end_weapon
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, category, comm, processor, purge_interval, weapon

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, category, altitude, comm, processor, weapon, 平台类型
- **出处**：`orwaca_iads/platforms/elr_sam_launcher.txt:16-38`　（同签名共 3 处，另见 `orwaca_iads/platforms/lr_sam_launcher.txt:16`、`orwaca_iads/platforms/mr_sam_launcher.txt:16`）
- **片段**：

```text
platform_type ELR_SAM_LAUNCHER WSF_PLATFORM
   icon elr_sam_launcher_icon
   category Large_Sam

   altitude 1 m agl

   comm cmdr_net RED_DATALINK
      network_name <local:slave>
      internal_link data_mgr
      internal_link task_mgr
   end_comm

   processor data_mgr WSF_TRACK_PROCESSOR
      purge_interval       60 sec
   end_processor

   processor task_mgr WSF_TASK_PROCESSOR
   end_processor

   weapon sam ELR_SAM
      quantity 4
   end_weapon
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, category, altitude, comm, processor, weapon

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, category, comm, sensor, processor, aux_data, 平台类型
- **出处**：`iads/platforms/large_sam_ttr.txt:16-42`　（同签名共 6 处，另见 `cyber/exfiltrate_demo/platforms/large_sam_ttr.txt:16`、`orwaca_iads/platforms/elr_sam_ttr_radar.txt:16`、`orwaca_iads/platforms/lr_sam_ttr_radar.txt:16`）
- **片段**：

```text
platform_type LARGE_SAM_TTR WSF_PLATFORM
   icon Flap_Lid
   category FIRE_CONTROL

   comm datalink RED_DATALINK
     network_name <local:slave>
     internal_link task_mgr
   end_comm

   sensor ttr TTR_RADAR
     off
     internal_link data_mgr
     ignore_same_side
   end_sensor

   processor data_mgr WSF_LINKED_PROCESSOR
      report_to commander via datalink to sub_net
   end_processor

   processor task_mgr WSF_TASK_PROCESSOR
   end_processor

   aux_data
      double max_range = 64820 # meters = 35 nm
      double pk = .7
   end_aux_data
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, category, comm, sensor, processor, aux_data

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, mover, comm, sensor, processor, track_manager, 平台类型
- **出处**：`electronic_warfare/jam_strobe_tracking.txt:190-218`
- **片段**：

```text
platform_type EW_RADAR WSF_PLATFORM
   icon Ground_Radar

   mover WSF_GROUND_MOVER end_mover

   comm datalink RED_DATALINK
      network_name <local:slave>
   end_comm

   sensor radar EW_RADAR
      internal_link data_mgr
      processor track_manager
      ignore_same_side
   end_sensor

   processor data_mgr WSF_LINKED_PROCESSOR
      report_to commander via datalink to sub_net
   end_processor

   track_manager
      #correlation_method perfect
      fusion_method weighted_average end_fusion_method
   end_track_manager

   processor track_manager WSF_TRACK_PROCESSOR
      #report_fused_tracks
      purge_interval 10 sec
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, mover, comm, sensor, processor, track_manager

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, radar_signature, mover, comm, sensor, processor, 平台类型
- **出处**：`alv_routing/platforms/awacs.txt:13-44`　（同签名共 2 处，另见 `ship_ad/weapons/ssm/ssm_missile.txt:28`）
- **片段**：

```text
platform_type AWACS WSF_PLATFORM
   icon abn_cmdr
   radar_signature AWACS_RADAR_SIGNATURE

   mover WSF_AIR_MOVER
     maximum_radial_acceleration .5 g
     maximum_linear_acceleration .5 g
   end_mover

   comm rcvr-1 WSF_RADIO_RCVR
      frequency 1200 mhz
   end_comm

   comm xmtr-1 WSF_RADIO_XMTR
      frequency 1200 mhz
   end_comm

   // The 'perfect' ESM device.  It can perfectly locate any transmitter in L-band
   sensor esm-1 WSF_ESM_SENSOR
      on
      frame_time 5 sec
      frequency_band 1000 mhz 2000 mhz    // L-band
      reports_location
      reports_frequency
      processor track-proc
      ignore no_awacs_esm
   end_sensor

   processor track-proc WSF_TRACK_PROCESSOR
      update_interval 2 sec
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, radar_signature, mover, comm, sensor, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, side, icon, mover, comm, sensor, processor, 平台类型
- **出处**：`distributed_operations/xio_setup.txt:17-49`
- **片段**：

```text
platform_type my_type WSF_PLATFORM
   side red
   icon f-18
   mover WSF_AIR_MOVER
   end_mover
   comm com1 WSF_COMM_TRANSCEIVER
      on
      processor dumper
      processor link-proc
   end_comm
   sensor sensor-1 WSF_GEOMETRIC_SENSOR
      off
      maximum_range 100 nm
      frame_time 2.0 s
      reports_location
      processor link-proc
   end_sensor
   processor link-proc WSF_LINKED_PROCESSOR
      on
      external_link commander via com1
   end_processor
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
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：side, icon, mover, comm, sensor, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, side, add, sensor, on_initialize2, processor, 平台类型
- **出处**：`coverage_demos/platforms/sat3.txt:15-48`
- **片段**：

```text
platform_type SAT WSF_PLATFORM
   icon satellite
   side blue
   
   add mover WSF_SPACE_MOVER
      epoch_date_time jun 07 2020 00:00:00.00
   end_mover  
   
   sensor sat_sensor SAT_SENSOR
      off
      internal_link data_mgr 
   end_sensor  
   
   on_initialize2 
      WsfSensor sen = PLATFORM.Sensor("sat_sensor");
      PointSensorToGEO_Belt(sen);
   end_on_initialize2

   processor data_mgr WSF_TRACK_PROCESSOR
      purge_interval 10 s
   end_processor
   
   processor excl_ang_proc SAT_EXCLUSION_ANGLE_PROC 
      script_variables 
         EXCL_SENSOR_NAME = "sat_sensor";
         SOLAR_EXCL_ANGLE = 15.0; # deg
         LUNAR_EXCL_ANGLE = 2.0; # deg
         ANGLES_TO_MYSTIC = true; # true = angles sent to Mystic for plotting or data display in window
         DRAW_SEN_ON_OFF = true;
         BOOKMARK_SEN_OFF = false;
      end_script_variables
   end_processor
   
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, add, sensor, on_initialize2, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, side, commander, mover, comm, processor, 平台类型
- **出处**：`electronic_warfare/comm_jamming.txt:150-184`
- **片段**：

```text
platform_type BLUE-FIGHTER WSF_PLATFORM
   icon F-18E
   side blue

   commander blue-surveillance

   // Define the mover
   mover WSF_AIR_MOVER
      default_linear_acceleration 1.0 g
      default_radial_acceleration 1.0 g
      default_climb_rate 200 fps
   end_mover

   // Define the node's communication device
   comm radio RADIO
      //debug
      internal_link track-proc
   end_comm
   
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
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, commander, mover, comm, processor

### platform_type（six_dof_sam_launch_test）｜平台类型

- **关键词**：platform_type, six_dof_ned_heading, six_dof_position, six_dof_set_velocity_ned_fps, include, enable_controls, on_update, 平台类型
- **出处**：`six_dof/six_dof_sam_launch_test.txt:66-101`
- **片段**：

```text
platform_type SAM_TEST_PLATFORM $<PLATFORM_TYPE:SAM-MR_RB6>$

   six_dof_ned_heading           0 deg
   six_dof_position              21.4  -158.0
   six_dof_set_velocity_ned_fps  0 0 0

   include scripts/six_dof_testing_scripts.txt

   enable_controls false

   on_update
      foreach (int key : struct value in mData)
      {
         WsfPlatform platform = WsfSimulation.FindPlatform(key);
         if(!platform.IsNull())
         {
            double time = TIME_NOW;

            double altitude = platform.Altitude();
            if(altitude > value->maxAltitude_m)
            {
               value->maxAltitude_m = altitude;
               value->timeMaxAltitude_sec = time;
            }
            double speed = platform.Speed();
            if(speed > value->maxSpeed_mps)
            {
               value->maxSpeed_mps = speed;
               value->timeMaxSpeed_sec = time;
            }
            value->maxRange_km = GetRangeSinceStart_km(platform);
         }
      }
   end_on_update

end_platform_type
```

- **演示要点**：演示 platform_type 的参数：six_dof_ned_heading, six_dof_position, six_dof_set_velocity_ned_fps, include, enable_controls, on_update

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, category, mover, fuel, processor, weapon, 平台类型
- **出处**：`base_types/platforms/blue_adv_fighter_1_base.txt:13-55`　（同签名共 3 处，另见 `base_types/platforms/red_fighter_1_base.txt:14`、`base_types/platforms/red_adv_fighter_1_base.txt:16`）
- **片段**：

```text
platform_type BLUE_ADV_FIGHTER_1_BASE WSF_PLATFORM

   icon F-22
   category fighter

   mover WSF_AIR_MOVER

      roll_rate_limit               1 rad/sec
      default_linear_acceleration   1.0 g
      default_radial_acceleration   6.5 g
      default_climb_rate            400 fps

      # Mach 1.7 (1095.3 kts) at 30K feet, with afterburner, Janes Reference
      maximum_speed                 1095.3 knots

      # Ceiling, Janes Reference
      maximum_altitude              50000 ft
      minimum_altitude              50 ft

      # g limit, Janes Reference
      maximum_linear_acceleration   9 g

      #no_pitch
      at_end_of_path extrapolate

   end_mover

   fuel WSF_VARIABLE_RATE_FUEL
      rate 7.0 lb/s
      initial_quantity 14000 lb
      maximum_quantity 14000 lb
   end_fuel


   processor track_manager WSF_TRACK_PROCESSOR
      //debug
      purge_interval  60 sec
      update_interval 1 sec
   end_processor

   weapon int_missile SIMPLE_A2A_MISSILE_WEAPON end_weapon

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, category, mover, fuel, processor, weapon

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, sensor, comm, azimuth_field_of_view, elevation_field_of_view, transmitter, receiver, 平台类型
- **出处**：`satellite_demos/platforms/gps_control.txt:13-58`
- **片段**：

```text
platform_type GPS_CONTROL WSF_PLATFORM

 sensor detect WSF_GEOMETRIC_SENSOR
      on
      reports_location
      frame_time 1 min
      azimuth_field_of_view -180 deg 180 deg
      elevation_field_of_view -90 deg 90 deg
   end_sensor

  comm GPS_UPLINKL3_TX WSF_RADIO_XMTR

   azimuth_field_of_view                  -180 deg    180 deg
   elevation_field_of_view                   0 deg     90 deg


   transmitter
      antenna_pattern                     UNIFORM_0DBI_PATTERN
      frequency                           1381.05 mhz  # ref 8
      wavelength                          22 cm       # guess
      bandwidth                           22 mhz      # guess
      power                               13 dBW      # guess
      polarization                        right_circular  # guess
      pulse_width                         15.0 usec   # guess
      pulse_repetition_interval           150.0 usec  # guess
   end_transmitter

  end_comm

 comm GPS_DOWNLINKL3_RX WSF_RADIO_RCVR

   azimuth_field_of_view                  -180.0 deg  180.0 deg
   elevation_field_of_view                     0 deg   90.0 deg

   receiver
      antenna_pattern                     UNIFORM_0DBI_PATTERN
      frequency                           1381.05 mhz   # ref 8
      bandwidth                           200 mhz
      noise_power                         -105.0 dbm
      detection_threshold                 3.0 dB
   end_receiver

end_comm


end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：sensor, comm, azimuth_field_of_view, elevation_field_of_view, transmitter, receiver

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, mover, script_variables, execute, sensor, processor, 平台类型
- **出处**：`electronic_warfare/closely_space_targets.txt:106-155`　（同签名共 9 处，另见 `electronic_warfare/repeater_jamming.txt:253`、`electronic_warfare/false-target_jamming_1.txt:203`、`electronic_warfare/false-target_jamming_2.txt:198`）
- **片段**：

```text
platform_type EW_RADAR WSF_PLATFORM
   icon Ground_Radar

   mover WSF_GROUND_MOVER end_mover

   # ---------------------------------------------
   # Draw track to false targets and real targets
   # ---------------------------------------------
   script_variables
      # Create a WsfDraw object.
      WsfDraw draw = WsfDraw();
   end_script_variables

   execute at_interval_of 1.0 s
      foreach (WsfTrack track in MasterTrackList())
      {
         if (track.IsValid())
         {
            # use the track ID as a unique draw ID
            # a track icon and a line to the track icon
            # is drawn at each track update
            string trackId = track.TrackId().ToString();
            draw.SetId(trackId);
            draw.SetDuration(1.0); # this is faster than calling erase every time

            draw.SetColor(0,0,1);
            draw.BeginIcons(track.Heading(), "Wedge");
            draw.Vertex(track.CurrentLocation());
            draw.End();

            # Draw a line to the track
            draw.SetLineStyle("dashed");
            draw.BeginLines();
            draw.Vertex(PLATFORM);
            draw.Vertex(track.CurrentLocation());
            draw.End();
         }
      }
   end_execute
   # ---------------------------------------

   sensor ew_radar EW_RADAR
      processor track_manager
      internal_link track_manager
      ignore_same_side
   end_sensor

   processor track_manager WSF_TRACK_PROCESSOR
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, mover, script_variables, execute, sensor, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, radar_signature, comm, mover, processor, weapon, sensor, 平台类型
- **出处**：`iads_c2_demos/platforms/air_interceptor.txt:21-72`
- **片段**：

```text
platform_type AIR_INTERCEPTOR WSF_PLATFORM
   radar_signature SIG_RADAR_ONE_M_SQUARED

   comm cmdr_net DATALINK
      network_name <local:slave>
      internal_link track_manager
      internal_link dissemination
   end_comm

   mover WSF_AIR_MOVER
      roll_rate_limit               1 rad/sec
      default_linear_acceleration   1.0 g
      default_radial_acceleration   6.5 g
      default_climb_rate            400 fps
      maximum_climb_rate            400 fps
      maximum_speed                 800.0 knots
      minimum_speed                 150.0 knots
      maximum_altitude              50000 ft
      minimum_altitude              50 ft
      maximum_linear_acceleration   9 g
      at_end_of_path                stop
      turn_rate_limit               4.0 deg/sec
   end_mover

   processor track_manager WSF_TRACK_MANAGER
      purge_interval             60 sec
      report_interval            1 sec
      fused_track_reporting      off
      raw_track_reporting        on
      report_to commander        via   cmdr_net to sub_net
      circular_report_rejection  true
   end_processor

   weapon missile AIR_TO_AIR_MISSILE
      quantity 12
   end_weapon

   sensor ttr TTR_RADAR
      off
      internal_link track_manager
      ignore_same_side
   end_sensor

   processor asset_manager WPN_AM
   end_processor

   processor dissemination DC2
   end_processor

   processor weapons_manager WM_AI
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：radar_signature, comm, mover, processor, weapon, sensor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, category, comm, mover, processor, weapon, sensor, 平台类型
- **出处**：`base_types/weapons/aam/scenario_test_launch_computer.txt:40-92`
- **片段**：

```text
platform_type  STRIKER  WSF_PLATFORM
   category fighter
   #radar_signature SIG_RADAR_ONE_M_SQUARED

   comm sub_net WSF_COMM_TRANSCEIVER
      network_name <local:slave>
      internal_link track_manager
   end_comm

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

   processor track_manager WSF_TRACK_PROCESSOR
      purge_interval             60 sec
      report_interval            1 sec
      fused_track_reporting      off
      raw_track_reporting        on
      report_to commander        via   sub_net
      circular_report_rejection  true
   end_processor

   weapon  blue_lr_a2a_rf_missile  BLUE_LR_A2A_RF_MISSILE_WITH_LAUNCH_COMPUTER
      quantity 999
   end_weapon

   sensor geo_sensor WSF_GEOMETRIC_SENSOR
      on
      azimuth_field_of_view   -180.0 degrees  180.0 degrees
      elevation_field_of_view  -90.0 degrees   90.0 degrees
      minimum_range 0 m
      maximum_range 277800 m     //about 150 nm
      frame_time    0.5 sec
      reports_location
      reports_velocity
      reports_iff
      track_quality 1.0
      internal_link track_manager
      ignore_same_side
   end_sensor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：category, comm, mover, processor, weapon, sensor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, radar_signature, comm, processor, script_variables, execute, 平台类型
- **出处**：`electronic_warfare/false-target_command_center.txt:304-357`
- **片段**：

```text
platform_type COMMAND_CENTER WSF_PLATFORM
  icon C4I

  radar_signature GROUND_SITE_RADAR_SIGNATURE

  comm sub_net RED_DATALINK
     network_name <local:master>
     internal_link track_processor
  end_comm

  processor track_processor WSF_TRACK_PROCESSOR
     purge_interval 30 sec
  end_processor

  # --------------------------------------
  # Draw track to false targets
  # --------------------------------------
  script_variables
     # Create a WsfDraw object.
     WsfDraw draw = WsfDraw();
  end_script_variables

  execute at_interval_of 1.0 s
     foreach (WsfTrack track in MasterTrackList())
     {
        if (track.IsValid())
        {
          if (track.IsFalseTarget())
          {
             # use the track ID as a unique draw ID
             # a track icon and a line to the track icon
             # is drawn at each track update
             string trackId = track.TrackId().ToString();
             draw.SetId(trackId);
             draw.SetDuration(1.0); # this is faster than calling erase every time
              # Draw a track icon
             draw.SetColor(0,0,1);
             draw.BeginIcons(track.Heading(), "Wedge");
                draw.Vertex(track.CurrentLocation());
             draw.End();

             # Draw a line to the track
             draw.SetLineStyle("dashed");
             draw.BeginLines();
                draw.Vertex(PLATFORM);
                draw.Vertex(track.CurrentLocation());
             draw.End();
          }
        }
     }
  end_execute
  # ---------------------------------------

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, radar_signature, comm, processor, script_variables, execute

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, mover, weapon, comm, processor, sensor, 平台类型
- **出处**：`shooter/platforms/jet_aircraft.txt:27-80`
- **片段**：

```text
platform_type JET_AIRCRAFT WSF_PLATFORM
   icon F-18
   mover WSF_AIR_MOVER
   end_mover

   weapon aa_mrm AA_MRM
     quantity 8
     internal_link task_mgr
     internal_link data_mgr
   end_weapon

   comm cmd_net WSF_COMM_TRANSCEIVER
      network_name <local:slave>  # it is not the commander of the network
      internal_link data_mgr
      internal_link task_mgr
   end_comm

   comm datalink WSF_COMM_TRANSCEIVER
      network_name <local:master>
      internal_link data_mgr
   end_comm

   processor data_mgr AA_DATA_MGR
   end_processor


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

    sensor radar GENERIC_FIRE_CONTROL_RADAR
#      on   # testing only - the task processor will turn on radar
      off
      internal_link data_mgr
      internal_link task_mgr
      ignore_same_side
    end_sensor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, mover, weapon, comm, processor, sensor

### platform_type（acq_radar）｜平台类型

- **关键词**：platform_type, icon, category, sensor, aux_data, script_variables, execute, 平台类型
- **出处**：`electronic_warfare/test_false_targets/platforms/acq_radar.txt:17-74`
- **片段**：

```text
platform_type ACQ_RADAR RED_RADAR
  icon Ground_Radar
  category ACQUISITION

  sensor acq_radar ACQ_RADAR
     off
     internal_link data_mgr
     ignore_same_side
  end_sensor

  aux_data
     double max_range = 92600 # meters = 50 nm
  end_aux_data

   script_variables
      # Create a WsfDraw object.
      WsfDraw draw = WsfDraw();
   end_script_variables

   execute at_interval_of 10.0 s

      foreach (WsfTrack track in MasterTrackList())
      {
         if (track.IsValid())
         {
           if (track.IsFalseTarget())
           {
              writeln("ACQ ", track.TargetName(), "  ", track.Latitude(), "  ", track.Longitude()
                      , "  ", track.Altitude());
              # use the track ID as a unique draw ID
              # a track icon and a line to the track icon
              # is drawn at each track update
              string trackId = track.TrackId().ToString();
              draw.SetId(trackId);
              draw.SetDuration(10.0); # this is faster than calling erase every time

              # Draw a track icon
              draw.SetColor(1,1,1);
              draw.SetPointSize(0.25);
              draw.SetLineSize(0.25);
              draw.BeginIcons(track.Heading(), "Unknown");
                 draw.Vertex(track.CurrentLocation());
              draw.End();

              draw.SetLineStyle("solid");
              draw.SetLineSize(3);

              # Draw a line to the track
              draw.BeginLines();
                 draw.Vertex(PLATFORM);
                 draw.Vertex(track.CurrentLocation());
              draw.End();
           }
         }
      }
   end_execute

end_platform_type
```

- **演示要点**：演示 platform_type 的参数：icon, category, sensor, aux_data, script_variables, execute

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, fuel_mass, empty_mass, payload_mass, processor, mover, execute, 平台类型
- **出处**：`exchange_proc/receiver_definition.txt:9-68`　（同签名共 2 处，另见 `exchange_proc/tanker_definition.txt:9`）
- **片段**：

```text
platform_type RECEIVER WSF_PLATFORM

   fuel_mass         3000 kg  # Wants 5000 more, so 3 + 5 = 8000 kg at end, if successful.
   empty_mass        9000 kg
   payload_mass      2000 kg

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

   mover WSF_AIR_MOVER
   end_mover

   execute at_time 60 sec relative
      WsfExchangeProcessor eproc = (WsfExchangeProcessor)PLATFORM.Processor("exchange_proc");
      if (eproc.IsValid())
      {
          Transactor eprocTransactor = eproc.FindTransactor("fuel_receiver"); 
          WsfPlatform offeror = WsfSimulation.FindPlatform("tanker");
          bool didRequest = eprocTransactor.RequestFrom(offeror, eprocTransactor.Container().TenderNeeded());
          if(didRequest)
          {
             writeln("At t=", TIME_NOW, ", RECEIVER IS REQUESTING FUEL.");
          }
          else
          {
             writeln("Receiver request failed");
          }
         
      }
   end_execute

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：fuel_mass, empty_mass, payload_mass, processor, mover, execute

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, category, icon, mover, comm, processor, weapon, 平台类型
- **出处**：`script_demos/script_demo_5.txt:328-389`　（同签名共 5 处，另见 `script_demos/script_demo_6.txt:328`、`satellite_demos/scenarios/gps_denied.txt:470`、`script_demos/script_demo_7.txt:422`）
- **片段**：

```text
platform_type FIGHTER_BOMBER WSF_PLATFORM
   category no_awacs_esm
   icon FIGHTER
   mover WSF_AIR_MOVER
     maximum_radial_acceleration 1.12 g
     maximum_linear_acceleration 2 g
   end_mover

   comm rcvr-1 WSF_RADIO_RCVR
      frequency 1200 mhz
      processor track-proc
      processor attack-proc
   end_comm

   comm xmtr-1 WSF_RADIO_XMTR
      frequency 1200 mhz
   end_comm

   processor track-proc WSF_TRACK_PROCESSOR
   end_processor

   processor attack-proc WSF_SCRIPT_PROCESSOR

      on_message
         type WSF_TRACK_MESSAGE
            script
               WsfTrackMessage trackMsg = (WsfTrackMessage)MESSAGE;
               WsfTrack        track    = trackMsg.Track();
               WsfTrackId      trackId  = track.TrackId();
               double     targetLat     = track.Latitude();
               double     targetLon     = track.Longitude();
               if (TIME_NOW < 50.0)
               {
                  writeln("Received track message from ", trackId.OwningPlatform());
               }

               // If we aren't attacking then start the 'attack'
               WsfProcessor launchComputer = PLATFORM.Processor("bomb_1000-launch-computer");
               if (! launchComputer.IsTurnedOn())
               {
                  writeln_d("Starting attack at T=", TIME_NOW);
                  launchComputer.TurnOn();
                  PLATFORM.GoToLocation(targetLat, targetLon);
               }
            end_script

         type default
            script
               writeln_d("Received message of type ", MESSAGE.Type());
            end_script
      end_on_message
   end_processor

   weapon bomb_1000 BOMB_1000_LB
   end_weapon

   processor bomb_1000-launch-computer BOMB_1000_LB_LAUNCH_COMPUTER
     off
     #on
     update_interval 2 sec
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：category, icon, mover, comm, processor, weapon

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, side, icon, sensor, comm, processor, script_variables, 平台类型
- **出处**：`engage/trackers/generic_tracker.txt:13-93`
- **片段**：

```text
platform_type GENERIC_TRACKER WSF_PLATFORM
   side red
   icon Flap_Lid

   sensor acq GEOMETRIC_SENSOR
      ignore_same_side
      on
      internal_link tracker
   end_sensor

   sensor ttr LRSAM_TTR
      on
      internal_link tracker
   end_sensor

   comm comm WSF_COMM_TRANSCEIVER
      internal_link operator
   end_comm

   processor tracker WSF_TRACK_PROCESSOR
   end_processor

   script_variables
      string weapon_name = "weapon";
   end_script_variables

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
               status = FireAt(TRACK, "DUMMY", weapon_name, 1, launcher);
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
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：side, icon, sensor, comm, processor, script_variables

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, spatial_domain, side, icon, weapon_effects, sensor, processor, 平台类型
- **出处**：`six_dof/platforms/lrm-1-a.txt:41-121`
- **片段**：

```text
platform_type  LRM-1-A  WSF_PLATFORM

   spatial_domain  air                                # This vehicle operates in the air domain
   side            green                              # Neutral force color
   icon            LRM-1-A                            # Icon based on geometry

   weapon_effects MR_LETHALITY

   sensor ir_seeker SIMPLE_GENERIC_SEEKER
      category ir_seeker
      on
      internal_link data_mgr
      internal_link seeker_activation
   end_sensor

   processor guidance WSF_SIX_DOF_GUIDANCE_COMPUTER

      update_interval 0.01 sec

      phase LAUNCH_GUIDANCE
         time_constant                   0.1 sec
         proportional_navigation_gain    0
         velocity_pursuit_gain           0
         g_bias                          0
         next_phase LEVEL when phase_time > 1 sec
      end_phase

      phase LEVEL
         time_constant                   0.1 sec
         proportional_navigation_gain    0
         velocity_pursuit_gain           0
         g_bias                          1
         next_phase LOFT when phase_time > 1 sec
      end_phase

      phase LOFT
         time_constant                   0.1 sec
         proportional_navigation_gain    4
         velocity_pursuit_gain           4
         g_bias                          10
         next_phase MIDCOURSE when phase_time > 10 sec
      end_phase

      phase MIDCOURSE
         time_constant                   0.05 sec
         proportional_navigation_gain    4
         velocity_pursuit_gain           4
         g_bias                          1
         next_phase TERMINAL_GUIDANCE when range_to_intercept < 8.0 nm
      end_phase

      phase TERMINAL_GUIDANCE
         time_constant                   0.01 sec
         proportional_navigation_gain    4
         velocity_pursuit_gain           4
         g_bias                          1
      end_phase

   end_processor

   processor data_mgr WSF_TRACK_PROCESSOR
      on
      master_track_processor
      update_interval 0.01 sec
      purge_interval  1 sec
   end_processor

   processor fuse WSF_AIR_TARGET_FUSE
      use_current_target
      update_interval           0.1 sec
      fine_update_interval      0.02 sec
      gross_proximity_range     500 ft
      detonate_below_height_agl 20.0 ft
      detonate_below_height_msl 20.0 ft
      maximum_time_of_flight    600.0 sec
   end_processor

   processor seeker_activation verbose_seeker_activation
   end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：spatial_domain, side, icon, weapon_effects, sensor, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, side, weapon, processor, execute, mover, 平台类型
- **出处**：`cyber/GoneFishing_ConstraintDemo.txt:58-141`
- **片段**：

```text
platform_type FISH WSF_PLATFORM   
   icon drone
   side red

   weapon bomb WEAPON
      quantity 1
      weapon_effects WEAPON_EFFECT
   end_weapon

   processor fuse WSF_SCRIPT_PROCESSOR
      update_interval 10.0 sec
      on_update
         
         if (PLATFORM.SlantRangeTo(32, -87, 0) < 7500)
         {   
            WsfPlatform ally = WsfSimulation.FindPlatform("ALLY_AIRPORT");
            if (ally != null)
            {
               WsfTrack track = ally.MakeTrack();
               PLATFORM.Weapon("bomb").Fire(track);

            }
            
         }
      end_on_update
   end_processor
   
   
   execute at_time 0.1 sec absolute
      PLATFORM.GoToLocation(32, -87);    #Attack Allied Airport
   end_execute
   
   execute at_time 4 hr absolute
      PLATFORM.Weapon("bomb").Fire(PLATFORM.MakeTrack());
   end_execute
   
   execute at_time 4.01 hr absolute
      PLATFORM.DeletePlatform();
   end_execute

   mover WSF_AIR_MOVER  
      maximum_speed 50 m/s
      minimum_speed 25 m/s
        
   end_mover
   
   processor CAUGHT_FISH WSF_SCRIPT_PROCESSOR
      # This Cyber Attack scambles the location of the target and replaces it
      # with a location close enough to the attacking platform to collect intell.
      update_interval 10.0 sec
      on_update
         WsfPlatform hemFish = WsfSimulation.FindPlatform("HEMINGWAY");
         if (hemFish.CyberAttackStatus(PLATFORM, "SMALL_CATCH") == 1)
         {
            PLATFORM.GoToLocation(25, -84, 0);      # New Dumby Location 1 of Target
         }
         else if (hemFish.CyberAttackStatus(PLATFORM, "BIG_CATCH") == 1)
         {
            PLATFORM.GoToLocation(25, -84, 0);      # New Dumby Location 1 of Target
         }
         
         WsfPlatform oldFish = WsfSimulation.FindPlatform("OLD_MAN");
         if (oldFish.CyberAttackStatus(PLATFORM, "SMALL_CATCH") == 1)
         {
            PLATFORM.GoToLocation(26, -88, 0);         # New Dumby Location 2 of Target
         }
         else if (oldFish.CyberAttackStatus(PLATFORM, "BIG_CATCH") == 1)
         {
            PLATFORM.GoToLocation(26, -88, 0);         # New Dumby Location 2 of Target
         }
         
         WsfPlatform yngFish = WsfSimulation.FindPlatform("YOUNG_MAN");
         if (yngFish.CyberAttackStatus(PLATFORM, "SMALL_CATCH") == 1)
         {
            PLATFORM.GoToLocation(27, -88.5, 0);      # New Dumby Location 3 of Target
         }
         else if (yngFish.CyberAttackStatus(PLATFORM, "BIG_CATCH") == 1)
         {
            PLATFORM.GoToLocation(27, -88.5, 0);      # New Dumby Location 3 of Target
         }
      end_on_update
   end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, weapon, processor, execute, mover

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, spatial_domain, side, icon, category, mover, processor, 平台类型
- **出处**：`p6dof/platforms/gbu-500.txt:33-128`
- **片段**：

```text
platform_type  GBU-500  WSF_PLATFORM

   spatial_domain  air
   side            blue
   icon            mk82
   category        weapon

   # Setup the P6DOF mover
   mover WSF_P6DOF_MOVER
      p6dof_object_type GBU-500
      update_interval   0.01 sec
      event_core_data             10 Hz
      event_kinematic_data        10 Hz
      event_autopilot_data         1 Hz
      event_control_inputs_data    1 Hz
      event_force_moment_data      1 Hz	  
   end_mover   
   
   processor fuse WSF_WEAPON_FUSE
      on
      gross_update_interval        0.02 sec
      fine_update_interval         0.01 sec
      time_of_flight_to_arm        1.00 sec
      gross_proximity_range      100.00 ft
      maximum_time_of_flight    3600.00 sec
      detonate_below_height_agl   40.00 ft
      detonate_below_height_msl   50.00 ft
   end_processor

   processor data_mgr WSF_TRACK_PROCESSOR
      on
      master_track_processor
      #show_state_transitions
      update_interval 0.01 sec
      purge_interval  1 sec
   end_processor

   # This will lock-on to the pre-briefed target,
   # if a track exits.
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
   
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：spatial_domain, side, icon, category, mover, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, weapon_effects, mover, processor, comm, sensor, 平台类型
- **出处**：`base_types/weapons/agm/mach_4_missile.txt:51-147`
- **片段**：

```text
platform_type MACH_4_MISSILE WSF_PLATFORM
   icon missile
   weapon_effects MACH_4_MISSILE_LETHALITY
   mover WSF_GUIDED_MOVER
#      debug
#      show_status
      update_interval        0.5 s
      integration_timestep   0.05 s

      stage 1 # get the missile up to velocity to light off ramjet
         # Boost 1st phase
         empty_mass          170 lb
         fuel_mass           190 lb
         thrust              14900.0 lbsf
         thrust_duration     3.25 sec
         aero                MACH_4_MISSILE_BOOST_AERO
      end_stage
      stage 2 # Second Stage LightOff
         # Really only 2 stages but this shows how to apply initial thrust
         empty_mass          0.01 lb
         fuel_mass           10.0 lb
         thrust              800 lbsf
         thrust_duration     23 sec
         aero                MACH_4_MISSILE_CRUISE_AERO
      end_stage

      stage 3 # ramjet sustain thrust
         # cruise stage
         empty_mass          300.00 lb
         fuel_mass           60.00 lb
         thrust              140 lbsf
         thrust_duration     700 sec  # maximum thrust duration time
         aero                MACH_4_MISSILE_CRUISE_AERO
      end_stage
   end_mover

   processor guidance WSF_GUIDANCE_COMPUTER
      #show_status
      #show_evaluations
      #debug

      phase LAUNCH
         commanded_altitude      72000 ft
         maximum_pitch_angle           30 deg
         proportional_navigation_gain  15.0
         velocity_pursuit_gain         15.0
         next_phase TERMINAL if target_slant_range < 30 miles
         next_phase CRUISE when phase_time > 100 sec
      end_phase

      phase CRUISE
         commanded_altitude      72000 ft
         commanded_speed         3950 fps #mach 4
         maximum_pitch_angle           40 deg
         proportional_navigation_gain  15.0
         maximum_commanded_g           2 g
         next_phase TERMINAL  when los_target_angle > 35 deg
      end_phase

      phase TERMINAL
         commanded_speed              2200 fps
        proportional_navigation_gain  40
        maximum_pitch_angle           90 deg
        maximum_commanded_g           4 g
      end_phase
   end_processor

   processor fuse WSF_GROUND_TARGET_FUSE
   end_processor

#   radar_signature VEHICLE_RADAR_SIGNATURE

   comm uplink WSF_COMM_TRANSCEIVER
      internal_link data_mgr
   end_comm

   processor task_mgr WSF_TASK_PROCESSOR
   end_processor
   processor data_mgr WSF_TRACK_PROCESSOR
      purge_interval 400 seconds
   end_processor

#   processor seeker WSF_PERFECT_TRACKER
#      update_interval 0.5 sec
#   end_processor

   sensor seeker RED_MISSILE_SEEKER
      # on
      ignore_same_side
      processor data_mgr
   end_sensor

   processor seeker_turn_on WSF_WEAPON_TRACK_PROCESSOR
     turn_on_sensor seeker at_range 30000.0 m before_intercept
   end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, weapon_effects, mover, processor, comm, sensor

### platform_type（tactical_maneuvers）｜平台类型

- **关键词**：platform_type, update_interval, side, icon, script_variables, script, execute, 平台类型
- **出处**：`p6dof/tactical_maneuvers.txt:33-133`　（同签名共 3 处，另见 `six_dof/pm6_tactical_maneuvers.txt:33`、`six_dof/rb6_tactical_maneuvers.txt:33`）
- **片段**：

```text
platform_type BlueFighter FA-LGT
   update_interval 0.01 sec
   side blue
   icon f16
   
   script_variables
      static double rollAndPull_BankAngle_deg  = 0.0;
      static double rollAndPull_targetGLoad    = 0.0;
      static bool   rollAndPull_diving         = true;
      static string rollAndPull_mode           = "NONE";
      static double rollAndPull_TgtRoll_deg    = 0.0;
      static double rollAndPull_TotalAngle_deg = 0.0;
   end_script_variables
   
   script void DetermineRollAndPull(WsfPlatform aAttackingPlatform, WsfPlatform aTargetPlatform)

      WsfGeoPoint tgtPt = aTargetPlatform.Location();
      double az_deg = aAttackingPlatform.RelativeAzimuthOf(tgtPt);
      double el_deg = aAttackingPlatform.RelativeElevationOf(tgtPt);
      double CosEl = Math.Cos(el_deg*Math.RAD_PER_DEG());
      double SinEl = Math.Sin(el_deg*Math.RAD_PER_DEG());
      double x  = Math.Cos(az_deg*Math.RAD_PER_DEG());
      double y  = Math.Sin(az_deg*Math.RAD_PER_DEG());
      double xy = Math.Sqrt( x*x + y*y );
      double z  = 0.0;
      if( Math.Fabs(CosEl) > 0.0000001 )
      {
         z  = (xy/CosEl) * SinEl;
      }
      double yz = Math.Sqrt( y*y + z*z );
      double ang_deg = Math.DEG_PER_RAD() * Math.ATan2(yz,x);

      rollAndPull_TgtRoll_deg    = 90.0 - Math.ATan2(z,y);
      rollAndPull_TotalAngle_deg = ang_deg;

   end_script

   script void PursuitThinker()

      WsfPlatform tgtPlatform = WsfSimulation.FindPlatform("ManeuverFighter");

      DetermineRollAndPull(PLATFORM, tgtPlatform);

      double rollRate_dps = 0.01 * rollAndPull_TgtRoll_deg * Math.Fabs(rollAndPull_TgtRoll_deg);
      if( rollRate_dps > 360.0 )
      {
         rollRate_dps = 360.0;
      }
      if( rollRate_dps < -360.0 )
      {
         rollRate_dps = -360.0;
      }
      SetRollRate(PLATFORM,rollRate_dps);

      double gLoad = 1.0;
      if( rollAndPull_TotalAngle_deg > 90.0 )
      {
         rollAndPull_TotalAngle_deg = 90.0;
      }

      if( rollAndPull_TotalAngle_deg < 5.0 )
      {
         gLoad = 0.25;
      }
      else
      {
         if( rollAndPull_TotalAngle_deg > 45.0 )
         {
            gLoad = 6.5;
         }
         else if( rollAndPull_TotalAngle_deg > 30.0 )
         {
            gLoad = 4.5;
         }
         else if( rollAndPull_TotalAngle_deg > 20.0 )
         {
            gLoad = 3.0;
         }
         else if( rollAndPull_TotalAngle_deg > 10.0 )
         {
            gLoad = 2.0;
         }
         else // > 5 deg
         {
            gLoad = 1.0;
         }
      }

      SetPitchGLoad(PLATFORM, gLoad);

      PLATFORM.ExecuteAtTime(TIME_NOW + 0.01, "PursuitThinker");

   end_script

# ------------------------------------------------------------------------------

   execute at_time 0.01 sec absolute
      PursuitThinker();
   end_execute
   
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：update_interval, side, icon, script_variables, script, execute

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, side, icon, on_initialize, comm, sensor, processor, 平台类型
- **出处**：`engage/grid_react_man.txt:39-146`
- **片段**：

```text
platform_type TRACKER_TYPE WSF_PLATFORM
   side red
   icon Flap_Lid

   on_initialize
      sites.Insert(PLATFORM.Index());
   end_on_initialize

   comm comm WSF_COMM_TRANSCEIVER
      internal_link operator
   end_comm

   #track
   #   platform target
   #end_track

   sensor find WSF_GEOMETRIC_SENSOR
      ignore_same_side
      frame_time 10 sec
      reports_location
      on
      track_quality 0.5
      internal_link tracker
   end_sensor

   sensor ttr LRSAM_TTR
      on
      internal_link tracker
   end_sensor

   processor tracker WSF_TRACK_PROCESSOR
   end_processor

   processor operator WSF_TASK_PROCESSOR
      #show_state_transitions

      evaluation_interval DETECTED 0.5 sec
      state DETECTED
         next_state TRY_TO_ACQUIRE
            return StartTracking(TRACK, "DUMMY", PLATFORM.Sensor("ttr"), "SEARCH");
         end_next_state
      end_state

      evaluation_interval TRY_TO_ACQUIRE 0.5 sec
      state TRY_TO_ACQUIRE
         next_state TRY_TO_TRACK
            #First run indicates acquisition mode
            if(!acquisitionTime.Exists(PLATFORM.Index()))
            {
               acquisitionTime[PLATFORM.Index()] = TIME_NOW;
            }

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
            #First run indicates track mode
            if(!trackTime.Exists(PLATFORM.Index()))
            {
               trackTime[PLATFORM.Index()] = TIME_NOW;
            }
            #Could also possibly be the beginning of illumination
            #TODO: DETERMINE IF SAM MODE IS ILLUMX
            if(!illuminationTime.Exists(PLATFORM.Index()))
            {
               illuminationTime[PLATFORM.Index()] = TIME_NOW;
            }


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

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：side, icon, on_initialize, comm, sensor, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, side, radar_signature, cyber_protect, mover, processor, 平台类型
- **出处**：`cyber/weapons/agm/leader_agm.txt:44-162`
- **片段**：

```text
platform_type LEADER_AGM WSF_PLATFORM
   icon cruise_missile
   side blue
   radar_signature LEADER_AGM_RADAR_SIG

   cyber_protect CRASH_PROTECT 
   end_cyber_protect

   mover WSF_GUIDED_MOVER
      update_interval 0.1 secs
      stage 1
         aero LEADER_AGM_FOLDED_AERO
         total_mass 0 lbs
         pre_ignition_coast_time 0.1 sec
         pre_separation_coast_time 10.0 sec // give it 10 secs to open wings
      end_stage
      stage 2
         aero LEADER_AGM_EXTENDED_AERO
         total_mass 50 lbs
         thrust 150 lbsf
         fuel_mass 40 lbs
         thrust_duration 4 hours
      end_stage
   end_mover
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
   processor fuse WSF_GROUND_TARGET_FUSE
     proximity_all_on_loss_of_target
   end_processor

   processor data_mgr WSF_TRACK_PROCESSOR end_processor
   processor task_mgr WSF_TASK_PROCESSOR  end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, radar_signature, cyber_protect, mover, processor

### platform_type（hellfire_type）｜平台类型

- **关键词**：platform_type, update_interval, script_variables, script, edit, sensor, on_update, 平台类型
- **出处**：`hellfire/laser_designation_via_dis/hellfire_type.txt:124-270`　（同签名共 2 处，另见 `hellfire/semiactive_laser_hellfire/hellfire_type.txt:123`）
- **片段**：

```text
platform_type SAL_HELLFIRE HELLFIRE
   update_interval 0.01 sec

   script_variables

      // === BEGIN CONSTANTS ONLY ===

      // Lock On After Launch (LOAL) trajectory selection = (Direct, Low, High):
      int cDIRECT_TRAJECTORY                   = 1;
      int cLOW_TRAJECTORY                      = 2;
      int cHIGH_TRAJECTORY                     = 3;

      // The time-of-flight timeline for LOAL missile body pitch maneuvers.
      double cLOW_HIGH_TOF_PITCH_UP_ONE        = 0.15;
      double cLOW_HIGH_TOF_PITCH_UP_TWO        = 0.60;
      double cLOW_TOF_PITCH_UP_CANCEL          = 2.0;
      double cHIGH_TOF_PITCH_UP_CANCEL         = 4.0;

      // Lock-on-after-launch (LOAL) look down scan pattern centroid elevation angles (degrees).
      double cDIRECT_LOOK_UP_ANGLE             = -1.5;
      double cLOW_LOOK_UP_ANGLE                = -3.5;
      double cHIGH_LOOK_UP_ANGLE               = -9.0;

      // === END CONSTANTS ONLY ===

      double pitchUpTwoCancelTOF               = cLOW_TOF_PITCH_UP_CANCEL;
      double seekerLookUpAngle                 = cLOW_LOOK_UP_ANGLE;
      int    trajectorySelect                  = cLOW_TRAJECTORY;
      bool   seekerIsTracking                  = false;
   end_script_variables

   script void SelectTrajectory(int aTrajSelect)
      if (trajectorySelect == cDIRECT_TRAJECTORY)
      {
         trajectorySelect      = aTrajSelect;
         pitchUpTwoCancelTOF   = 0.0;
         seekerLookUpAngle     = cDIRECT_LOOK_UP_ANGLE;
      }
      else if (trajectorySelect == cLOW_TRAJECTORY)
      {
         trajectorySelect      = aTrajSelect;
         pitchUpTwoCancelTOF   = cLOW_TOF_PITCH_UP_CANCEL;
         seekerLookUpAngle     = cLOW_LOOK_UP_ANGLE;
      }
      else if (trajectorySelect == cHIGH_TRAJECTORY)
      {
         trajectorySelect      = aTrajSelect;
         pitchUpTwoCancelTOF   = cHIGH_TOF_PITCH_UP_CANCEL;
         seekerLookUpAngle     = cHIGH_LOOK_UP_ANGLE;
      }
   end_script

   edit processor hellfire_autopilot
      #debug
      #show_status
      guide_to_truth false  # Use track location, not truth.
      update_interval              0.01 s

      program pitch_up_one ATTITUDE_PROGRAM
         pitch 10.0 deg  # 4 + 6 deg
         pitch_rate 45 deg/s
      end_program

      program pitch_up_two ATTITUDE_PROGRAM
         pitch 19.0 deg # 4 + 15 deg
         pitch_rate 45 deg/s
      end_program

      program cruise_attitude ATTITUDE_PROGRAM
         # Direct trajectory stays at +4 deg nose up from launch until sensor track is established.
         pitch 4.0 deg # Autopilot zero reference attitude = 4 deg nose above horizon.
         pitch_rate 45 deg/s
      end_program

      phase NULL_GUIDANCE
         g_bias                       0.0
         proportional_navigation_gain 0.0
         velocity_pursuit_gain        0.0
         next_phase PITCH_UP_ONE when flight_time >= 0.15 sec  # cLOW_HIGH_TOF_PITCH_UP_ONE
         next_phase TERMINAL when sensor_track_initiated
      end_phase

      phase PITCH_UP_ONE
         g_bias                       0.0
         proportional_navigation_gain 0.0
         velocity_pursuit_gain        0.0
         use_program pitch_up_one
         next_phase PITCH_UP_TWO when flight_time >= 0.60 sec # cLOW_HIGH_TOF_PITCH_UP_TWO
         next_phase TERMINAL when sensor_track_initiated
      end_phase

      phase PITCH_UP_TWO
         g_bias                       0.0
         proportional_navigation_gain 0.0
         velocity_pursuit_gain        0.0
         use_program pitch_up_two

         # This variable is 2.0 sec for Low, 4.0 sec for High trajectory select.
         next_phase CRUISE when flight_time >= 2.0 sec  # cLOW_TOF_PITCH_UP_CANCEL or cHIGH_TOF_PITCH_UP_CANCEL

         next_phase TERMINAL when sensor_track_initiated

      end_phase

      phase CRUISE
         g_bias                       0.0
         proportional_navigation_gain 0.0
         velocity_pursuit_gain        0.0
         use_program cruise_attitude
         next_phase TERMINAL when sensor_track_initiated
      end_phase

      phase TERMINAL
         proportional_navigation_gain 5.0
         velocity_pursuit_gain        2.0
         g_bias                      12.0
         lateral_g_bias               0.0
      end_phase
   end_processor

   sensor laser_seeker HELLFIRE_LASER_TRACKER
      off
      processor track_manager
      laser_code                    1212
   end_sensor

   on_update
      extern bool seekerIsTracking;

      if (! PLATFORM.Sensor("laser_seeker").IsTurnedOn())
      {
         PLATFORM.Sensor("laser_seeker").TurnOn();
      }

      if (! seekerIsTracking)
      {
         # Set the seeker elevation angle, which varies depending upon trajectory select.
         # Direct = cDIRECT_LOOK_UP_ANGLE, Low, High, etc.
         PLATFORM.Sensor("laser_seeker").CueToAzEl(0.0, seekerLookUpAngle - PLATFORM.Pitch());
      }

      # DRB - TO-DO - if (sensor_track_established)
      #{
      #   seekerIsTracking = true;  # DRB TO-DO
      #}
   end_on_update
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：update_interval, script_variables, script, edit, sensor, on_update

### platform_type（combined_platform）｜平台类型

- **关键词**：platform_type, radar_signature, indestructible, weapon, edit, delete, add, 平台类型
- **出处**：`brawler/platforms/combined_platform.txt:33-183`
- **片段**：

```text
platform_type  COMBINED_PLATFORM  BRAWLER_PLATFORM

   radar_signature SIG_RADAR_ONE_M_SQUARED

   indestructible

  #weapon srm BLUE_SR_A2A_IR_MISSILE
  #weapon gun BULLET
   weapon mrm MEDIUM_RANGE_MISSILE
  #weapon  mrm  MEDIUM_RANGE_RADAR_MISSILE
      quantity 2
   end_weapon

#   fuel WSF_FUEL
#      consumption_rate     7 lb/s
#      initial_quantity 14000 lb     #~33 minutes, at this consumption rate
#      maximum_quantity 14000 lb
#      bingo_quantity    1000 lb
#   end_fuel

   edit sensor simple_sensor
      minimum_range 0 m
      maximum_range 175940 m   #about  95 nm
     #internal_link data_mgr   #link already exists
      internal_link thinker
   end_sensor

   edit processor perception
      reports_self     on
      report_interval  1.0 sec
      report_to commander via datalink
      report_to peers via datalink
      asset_perception status_messages
   end_processor

   edit processor incoming_threats
     #threat_time_to_intercept 120 sec   #default: 60 sec
      threat_time_to_intercept 60 sec   #(default)
     #update_interval           1 sec
      threat_velocity        1300 knots
     #threat_angle_spread     20.0 deg
     #threat_time_to_intercept  60 sec
   end_processor

   #replace the tasker


   delete processor thinker
   add processor thinker WSF_BRAWLER_PROCESSOR

     #draw_alternatives
      mind_file platforms/MIND
      #debug
      #show_task_messages
      #script_debug_writes  off
      #update_interval 5 sec   #brawler consciousness events control the update time

      script_variables
         double mVisualRange = 6.0 * MATH.M_PER_NM();
         bool   mTargetIsWVR = false;
      end_script_variables
      on_update
         mTargetIsWVR = false;
         WsfTaskList tasks = PROCESSOR.TasksReceivedOfType("WEAPON");
         writeln_d("T=",TIME_NOW,", ", PLATFORM.Name(), " updating!  task count = ", tasks.Count());
         foreach(WsfTask task in tasks)
         {
            WsfLocalTrack track = PLATFORM.MasterTrackList().FindTrack(task.LocalTrackId());
            if (track.IsValid() && PLATFORM.SlantRangeTo(track) < mVisualRange)
            {
               mTargetIsWVR = true;
               writeln_d("WITHIN VISUAL RANGE!");
               return;
            }
         }
      end_on_update

      behavior_tree
         #choose between two sub-trees based on range to target
         #   BVR = regular tree,  WVR = brawler tree
         selector
            parallel
               precondition
                  extern bool mTargetIsWVR;
                  if (mTargetIsWVR == true)
                  {
                     return Failure("Target is WVR, use brawler subtree");
                  }
                  return true;
               end_precondition
               selector
                  behavior_node  evade
                  behavior_node  go_home
                  behavior_node  escort
                  behavior_node  pursue_weapon_task_target
                  behavior_node  planned_route
               end_selector
               behavior_node  engage_weapon_task_target
            end_parallel
            parallel
               precondition
                  #if reach here, then we must have a WVR target
                  return true;
               end_precondition
               #PILOT MANEUVERING DECISION
               priority_selector
                  #debug   #prints precondition score of each selector child behavior
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
         end_selector
      end_behavior_tree

      edit behavior pursue_weapon_task_target
         script_variables
            mDrawSteering = true;
         end_script_variables
      end_behavior

   end_processor

end_platform_type
```

- **演示要点**：演示 platform_type 的参数：radar_signature, indestructible, weapon, edit, delete, add

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, category, track_manager, processor, sensor, aux_data, 平台类型
- **出处**：`swarm/platforms/uhf_ew_radar_sensor_platform.txt:19-173`
- **片段**：

```text
platform_type UHF_EW_RADAR_PLATFORM WSF_PLATFORM
   icon ew_radar_icon
   category 3D_RADAR
   #infrared_signature   VEHICLE_INFRARED_SIGNATURE
   #optical_signature    VEHICLE_OPTICAL_SIGNATURE
   #radar_signature      VEHICLE_RADAR_SIGNATURE

   track_manager
      #filter FILTER_TACTICS end_filter
      correlation_method nearest_neighbor
         precise_mode true  #NOT DOCUMENTED - EVENTUALLY WILL BE DEFAULT
         tracking_sigma 1   # multiplier applied to sensor sigma
                            #( 5 gives 99.99% correlation if ellipsoid boundaries intersected
                            #( 3 gives 99.73% correlation if ellipsoid boundaries intersected
                            #( 1 gives 68.27% correlation if ellipsoid boundaries intersected
                             #(.5 gives 38.29% correlation if ellipsoid boundaries intersected
         turning_sigma  1   # KEEP THE SAME AS tracking_sigma!!!
      end_correlation_method
      fusion_method replacement end_fusion_method
      #fusion_method weighted_average end_fusion_method
   end_track_manager

   processor data_mgr WSF_TRACK_PROCESSOR
   end_processor

   sensor uhf_ew_radar_sensor UHF_EW_RADAR_SENSOR
      on
      internal_link data_mgr
      ignore_same_side
   end_sensor

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

   aux_data
      double max_range = 370400 # meters = 200 nm
   end_aux_data
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, category, track_manager, processor, sensor, aux_data

### platform_type（longbow_type）｜平台类型

- **关键词**：platform_type, position, add, script_variables, execute, route, script, 平台类型
- **出处**：`hellfire/laser_designation_via_dis/longbow_type.txt:112-304`　（同签名共 3 处，另见 `hellfire/semiactive_laser_hellfire/longbow_type.txt:112`、`hellfire/active_radar_hellfire/longbow_type.txt:112`）
- **片段**：

```text
platform_type LONGBOW APACHE

   # Beginning location...
   position 39:07:52.920n 106:46:05.756w altitude 10 m agl

   # Laser sensor which can detect the spot after we get Line-Of-Sight to it.
   add sensor tracker HELLFIRE_LASER_TRACKER
      processor track-manager
   end_sensor

   add weapon hellfire_launcher HELLFIRE_LAUNCHER
      launched_platform_type SAL_HELLFIRE # or RF_HELLFIRE
   end_weapon

   add processor track-manager WSF_TRACK_PROCESSOR
      # Use all default attributes for this object.
   end_processor

   script_variables
      # Flag to indicate whether we want to follow terrain or not.
      # Begin ingress using terrain following.
      bool followTerrain = true;
      bool attemptedMissileFire = false;
      bool isEgressing = false;
      bool mobilityKilled = false;
      bool firepowerKilled = false;
   end_script_variables

   # Terrain following involves always setting target altitude to
   # a fixed value above the current terrain height.
   execute at_interval_of 1 s

      if (followTerrain)
      {
         # Very rough terrain might require higher clearances, or slower
         # speeds, or higher allowed rates of climb to avoid terrain.
         GoToAltitude(Location().TerrainHeight() + 100, 50, true);
      }

   end_execute

   # This the route we will follow on the ingress toward the target area:
   route # ingress_along_valley_side_wall
      position 39:07:26.1n 106:45:52.1w altitude 100 m agl
      position 39:08:36.6n 106:47:40.0w altitude 100 m agl
      position 39:10:21.2n 106:48:27.1w altitude 100 m agl
      #  DRB position 39:11:01.9n 106:48:52.6w altitude 100 m agl
        execute BeginPopup
   end_route

   # When is our pop-up manuever complete?
   # We are done when we detect the target with our sensor.
   script void CheckDone()

      if ((attemptedMissileFire && ! isEgressing) ||
          ((MasterTrackList().Count() > 0) &&
           (MasterTrackList().Entry(0).TimeSinceStarted() > 15) &&
           (! isEgressing)))
      {
            # We may or may not have fired a missile, but we are exposed to the threat.
            # After some acceptable amount of exposure to extablish a target track, give up.
            # If we attempted a missile fire, whether successful or not, depart.
            double currentAlt = Altitude();
            #writeln("Target track fixed for 15 seconds.  Actual Alt = ", currentAlt);
            writeln("*** Egressing Target Area Now. ***");
            PLATFORM.Comment("Time to bug out.");
            isEgressing = true;
            attemptedMissileFire = true; # Just to prevent further attempts.

            # Exit the area with more haste, as we will not be terrain following.
            followTerrain = false;
            PLATFORM.Mover().SetMode("CRUISE");

            # Egress along the specified exit route path.
            FollowRoute("egress_along_valley_floor");
            return;
      }
      else if (MasterTrackList().Count() > 0)
      {
         # We have detected a target, so we do now have line of sight to it.

         if (MasterTrackList().Entry(0).TimeSinceStarted() > 5  && ! attemptedMissileFire)
         {
            # Examine the track we have.  If it has been established
            # for 5 seconds, we have an accurate fix on the target.
            # If the LaunchComputer says we can hit, then fire.
            double currentAlt = Altitude();
            PLATFORM.Comment("Target track fixed for 5 seconds.  Attempting Fire.");
            writeln("Target track fixed for 5 seconds. Actual Alt = ", currentAlt);
            if (PLATFORM.Weapon("hellfire_launcher").LaunchComputer().CanIntercept(MasterTrackList().Entry(0)))
            {
               bool fired = PLATFORM.Weapon("hellfire_launcher").Fire(MasterTrackList().Entry(0));
               if (fired)
               {
                  PLATFORM.Comment("Weapon fire successful.");
                  writeln("Hellfire Missile Launched.");
               }
               else
               {
                  PLATFORM.Comment("Launch attempt failed for unknown reason.");
                  writeln("Hellfire Missile Launch Attempted, but Failed.");
               }

               WsfSensor tracker = PLATFORM.Sensor("tracker");
               if (tracker.IsValid())
               {
                   writeln("Laser tracker turned off after missile launch.");
                   tracker.TurnOff();
               }
            }
            else
            {
               writeln("Not within Hellfire Missile Launch Constraints.");
            }
            attemptedMissileFire = true;
         }
      }

      # Repeat running this script at 5 second intervals.
      ExecuteAtTime(TIME_NOW + 10, "CheckDone");

   end_script
   
   script void TurnToTarget()
      WsfGeoPoint expectedTgtLocation = WsfGeoPoint.Construct("39:10:35.0n 106:50:44w");
      expectedTgtLocation.SetAltitudeAGL(1);
      GoToSpeed(10);
      TurnToHeading(PLATFORM.TrueBearingTo(expectedTgtLocation));
   end_script

   # Script to begin the pop-up manuever.  Do this only once, after ingress into the target area.
   script void BeginPopup()

      # We now need to control our altitude directly in this script,
      # not by consideration of terrain heights, so turn off terrain following.
      followTerrain = false;

      # It is necessary to pre-declare the existence of an external function we wish to call:
      extern double GetPopupAltitude(WsfGeoPoint src, WsfGeoPoint target);

      # Set the speed to slow down to be more reasonable for this manuever.
      PLATFORM.Mover().SetMode("HOVER");
      writeln("*** In pop-up.  Set mode HOVER. ***");

      # This is an expected location for a target.
      # It does not have to be the actual location,
      # however must be close enough to enable a detection.
      WsfGeoPoint expectedTgtLocation = WsfGeoPoint.Construct("39:10:35.0n 106:50:44w");
      expectedTgtLocation.SetAltitudeAGL(1);

      # Turn our desired heading toward the expected target location.
      SetHeading(230); 

      # Set a location to fly to.  This is the vantage point location we wish to do the pop-up from.
      WsfGeoPoint verticalClimbPole = WsfGeoPoint.Construct("39:11:05.0n 106:49:17.8w");

      # Create a route to fly, from our current location toward the expected target.
      WsfRoute route = WsfRoute();
      route.Append(verticalClimbPole, 30);

      # Calculate an altitude believed to be sufficient to gain line-of-sight to the expected location for the target
      double popUpAlt = GetPopupAltitude(verticalClimbPole, expectedTgtLocation);
      double currentAlt = Altitude();
      writeln("Current Alt: ", currentAlt, ", Commanded Pop-Up Alt: ", popUpAlt);

      # Add another point into our route that will take us vertically up to our sensor scan altitude.
      verticalClimbPole.SetAltitudeAGL(popUpAlt - verticalClimbPole.TerrainHeight());
      route.Append(verticalClimbPole, 0);
      
      WsfGeoPoint TurnPoint = {};
      TurnPoint = verticalClimbPole;
      TurnPoint.OffsetRBE(100, PLATFORM.TrueBearingTo(expectedTgtLocation), 0);
      route.Append(TurnPoint,1);

      # Engage.  Begin flying toward the target.
      FollowRoute(route);

      WsfSensor tracker = PLATFORM.Sensor("tracker");
      if (tracker.IsValid())
      {
          writeln("Laser tracker turned on at start of pop-up.");
          tracker.TurnOn();
          PLATFORM.Comment("LASER Sensor On.");
      }

      # Run the CheckDone() script.  Since we have yet to get to sensor height and detect the target,
      # one might think there is no reason to check this now.  However, as part of its processing, the
      # script will reschedule itself periodically.  Eventually, it will discern the pop-up was successful.
      CheckDone();

   end_script

end_platform_type
```

- **演示要点**：演示 platform_type 的参数：position, add, script_variables, execute, route, script

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, side, mover, optical_signature, radar_signature, 平台类型
- **出处**：`satellite_demos/platforms/simple_gps_satellite.txt:17-23`
- **片段**：

```text
platform_type GPS WSF_PLATFORM
  icon Satellite
  side blue
  mover WSF_NORAD_SPACE_MOVER end_mover
  optical_signature gps_optical_signature
  radar_signature   gps_radar_signature
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, mover, optical_signature, radar_signature

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, indestructible, icon, side, mover, radar_signature, 平台类型
- **出处**：`bearing_only/platforms/air_target.txt:21-28`　（同签名共 2 处，另见 `orwaca_iads/scenarios/target.txt:22`）
- **片段**：

```text
platform_type       AIR_TARGET                      WSF_PLATFORM
   indestructible
   icon rafale_icon
   side blue
   mover WSF_AIR_MOVER
   end_mover
   radar_signature AIR_TARGET_RADAR_SIGNATURE
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：indestructible, icon, side, mover, radar_signature

### platform_type（pm6_brawler_maneuver_comparison）｜平台类型

- **关键词**：platform_type, update_interval, side, heading, altitude, position, 平台类型
- **出处**：`six_dof_with_brawler/pm6_brawler_maneuver_comparison.txt:43-50`
- **片段**：

```text
platform_type MANEUVER_TEST_BM BLUE_FIGHTER
   update_interval 0.01 sec 
   side blue
   heading 90 deg
   altitude 30000 ft msl
   position 00:05:00.00n  01:10:00.00w 
   
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：update_interval, side, heading, altitude, position

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, radar_signature, infrared_signature, optical_signature, category, 平台类型
- **出处**：`suppressor/platforms/target.txt:25-33`
- **片段**：

```text
platform_type TARGET WSF_PLATFORM
  icon C4I
  radar_signature     TARGET_RCS_SIG
  infrared_signature  TARGET_IR_SIG
  optical_signature   TARGET_OPT_SIG

  category ignored-by-iads-radar
  category ignored-by-abn_cmdr-radar
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, radar_signature, infrared_signature, optical_signature, category

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, side, icon, mover, default_linear_acceleration, category, 平台类型
- **出处**：`traffic_demos/platforms/ship_container.txt:10-18`　（同签名共 5 处，另见 `traffic_demos/platforms/ship_fishing_trawler.txt:10`、`traffic_demos/platforms/ship_jetski.txt:10`、`traffic_demos/platforms/ship_small_fishing.txt:9`）
- **片段**：

```text
platform_type CONTAINER_SHIP WSF_PLATFORM
  side blue
  icon Ship
  mover WSF_SURFACE_MOVER
#    at_end_of_path remove
    default_linear_acceleration 0.3 g
  end_mover
  category background_ship
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：side, icon, mover, default_linear_acceleration, category

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, side, optical_signature, inherent_contrast, processor, category, 平台类型
- **出处**：`space_operations/platforms/launch_vehicle.txt:10-19`
- **片段**：

```text
platform_type  LAUNCH_VEHICLE  WSF_PLATFORM
   side red
   optical_signature LAUNCH_VEHICLE_SIG
   inherent_contrast LAUNCH_VEHICLE_CONTRAST

   processor change_sig CHANGE_SIG
   end_processor

   category launch
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：side, optical_signature, inherent_contrast, processor, category

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, mover, radar_signature, weapon, processor, 平台类型
- **出处**：`electronic_warfare/track_error.txt:241-251`　（同签名共 20 处，另见 `electronic_warfare/barrage_jamming.txt:111`、`electronic_warfare/cover_pulse_jamming.txt:176`、`electronic_warfare/esm_detect_jammer.txt:152`）
- **片段**：

```text
platform_type AIRPLANE WSF_PLATFORM
   icon F-18
   mover WSF_AIR_MOVER end_mover
   radar_signature WIDE_BODY_SIGNATURE
   weapon wpn JAMMER
      pitch   -10 deg                  // Aim jammer slightly toward the ground
   end_weapon

   processor track_manager WSF_TRACK_PROCESSOR
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, mover, radar_signature, weapon, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, infrared_signature, optical_signature, radar_signature, mover, 平台类型
- **出处**：`l16_j11/platforms.txt:59-69`
- **片段**：

```text
platform_type FIGHTER WSF_PLATFORM

   icon F-18E

   infrared_signature   FIGHTER_INFRARED_SIG
   optical_signature    FIGHTER_OPTICAL_SIG
   radar_signature      FIGHTER_RADAR_SIG

   mover WSF_AIR_MOVER end_mover

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, infrared_signature, optical_signature, radar_signature, mover

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, side, icon, category, mover, include, 平台类型
- **出处**：`hel/intersect_mesh_test_beam_director.txt:393-404`
- **片段**：

```text
platform_type RED_ADV_FIGHTER_2 WSF_PLATFORM
   side red
   icon SU-27
   category RED_ADV_FIGHTER_2
   mover WSF_AIR_MOVER end_mover

   // Very Important:  The intersect processor must
   // be defined on targets to get a good result
   // for the "Occluded" script method.
   include intersect_processor.txt

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：side, icon, category, mover, include

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, side, mover, weapon, processor, 平台类型
- **出处**：`ballistic/platforms/red_mrbm_2_launcher.txt:12-24`　（同签名共 7 处，另见 `ballistic/platforms/red_srbm_1_launcher.txt:12`、`ballistic/platforms/red_srbm_2_launcher.txt:12`、`ballistic/platforms/red_srbm_3_launcher.txt:12`）
- **片段**：

```text
platform_type RED_MRBM_2_LAUNCHER WSF_PLATFORM
   icon Scud_Launcher
   side red
   mover WSF_GROUND_MOVER end_mover
   weapon red_mrbm_2 RED_MRBM_2
      quantity 1
   end_weapon
   processor launch_weapon_processor LAUNCH_WEAPON_PROCESSOR
      script_variables
         WEAPON_NAME = "red_mrbm_2";
      end_script_variables
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, mover, weapon, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, mover, radar_signature, sensor, processor, 平台类型
- **出处**：`electronic_warfare/esm_detect_radar.txt:130-143`　（同签名共 5 处，另见 `electronic_warfare/esm_detect_multi_beam_radar.txt:147`、`electronic_warfare/esm_detect_multi_sensor_radar.txt:247`、`electronic_warfare/air-to-air-rt1.txt:321`）
- **片段**：

```text
platform_type ESM_PLATFORM WSF_PLATFORM
   icon EA-6B
   mover WSF_AIR_MOVER end_mover
   radar_signature WIDE_BODY_SIGNATURE

   sensor esm ESM_SENSOR
      internal_link track_manager
      ignore_same_side
   end_sensor

   processor track_manager WSF_TRACK_PROCESSOR
     purge_interval   20.0 sec
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, mover, radar_signature, sensor, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, side, icon, comm, processor, weapon, 平台类型
- **出处**：`engage/flight_path.txt:18-33`　（同签名共 7 处，另见 `engage/flight_route.txt:18`、`engage/grid.txt:18`、`engage/grid_w_observer.txt:18`）
- **片段**：

```text
platform_type LAUNCHER_TYPE WSF_PLATFORM
   side red
   icon SA-10_Launcher

   comm comm WSF_COMM_TRANSCEIVER
      internal_link operator
   end_comm

   processor operator WSF_TASK_PROCESSOR
   end_processor

   weapon lrsam LRSAM
     quantity 1
   end_weapon

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：side, icon, comm, processor, weapon

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, side, mover, update_interval, on_update, 平台类型
- **出处**：`space_operations/satellite_breakup.txt:52-68`
- **片段**：

```text
platform_type DEBRIS WSF_PLATFORM
   icon wedge
   side green
   
   mover WSF_SPACE_MOVER
      oblate_earth enable
   end_mover
   
   update_interval 5 min
   on_update
      if (PLATFORM.Altitude() < 100000.0)
      {
         writeln(TIME_NOW, " debris fragment ", PLATFORM.Name(), " entered the atmosphere and is being removed.");
         WsfSimulation.DeletePlatform(PLATFORM.Name());
      }
   end_on_update
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, mover, update_interval, on_update

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, radar_signature, optical_signature, infrared_signature, weapon, execute, 平台类型
- **出处**：`sensor_plot/radar/hm-jammer-detect.txt:43-60`　（同签名共 2 处，另见 `sensor_plot/esm/hm-jammer-detect-2.txt:63`）
- **片段**：

```text
platform_type TARGET_PLATFORM_TYPE WSF_PLATFORM
   radar_signature    UCAV_RADAR_SIG
   optical_signature  UCAV_OPTICAL_SIG
   infrared_signature UCAV_INFRARED_SIG

   weapon jammer SOJ_SBAND_JAMMER
      off
      slew_mode fixed // since there isn't any radar to jam, i.e. point at to get listener interface to work on ESM
      yaw 0.0 deg
      power 10 w   // if the power should need adjusting
   end_weapon

   execute at_time 0.001 minutes absolute
      WsfWeapon jammer = PLATFORM.Weapon("jammer");
      // Any of the jamming routines can be used at this point
      jammer.StartJamming(3000000000., 20000000.);
   end_execute
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：radar_signature, optical_signature, infrared_signature, weapon, execute

### platform_type（pm6_brawler_maneuvers）｜平台类型

- **关键词**：platform_type, update_interval, icon, route, follow_vertical_track, script, 平台类型
- **出处**：`six_dof_with_brawler/pm6_brawler_maneuvers.txt:36-53`
- **片段**：

```text
platform_type Fighter BLUE_FIGHTER_PM6
   update_interval 0.05 sec
   icon f16
   
   route
      position   21.180n  158.55w  altitude 20000.0 ft  speed 500.0 kts
      position   21.480n  157.95w  altitude 20000.0 ft  speed 500.0 kts
      position   21.520n  157.95w  altitude 20000.0 ft  speed 500.0 kts
   end_route
   follow_vertical_track
   
   script void SetInitialRanges(WsfSixDOF_Mover aMover)
      aMover.SetBankAngleMax(180.0);
      aMover.SetPitchGLoadMax(8.0);
      aMover.SetPitchGLoadMin(0.0);
      aMover.SetRollRateMax(180.0);
   end_script
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：update_interval, icon, route, follow_vertical_track, script

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, side, icon, comm, track_manager, processor, 平台类型
- **出处**：`space_operations/cloud_attenuation.txt:87-105`　（同签名共 2 处，另见 `space_operations/scenarios/ssn_laydown.txt:38`）
- **片段**：

```text
platform_type  COMMANDER  WSF_PLATFORM
   side blue

   icon cmd_post

   comm comm WSF_COMM_TRANSCEIVER
      internal_link tp
   end_comm

   track_manager
      retain_track_history
   end_track_manager

   processor tp WSF_TRACK_PROCESSOR
      update_interval 100 sec
      purge_interval 1 day
      track_history_retention_interval 1000 sec
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：side, icon, comm, track_manager, processor

### platform_type（ew_radar）｜平台类型

- **关键词**：platform_type, icon, category, sensor, processor, aux_data, 平台类型
- **出处**：`aea_iads/platforms/ew_radar.txt:18-37`　（同签名共 2 处，另见 `heatmap/platforms/ew_radar.txt:17`）
- **片段**：

```text
platform_type EW_RADAR RED_RADAR
  icon Ground_Radar
  category 2D_RADAR

  sensor ew_radar EW_RADAR
     on
     internal_link data_mgr
     ignore_same_side
  end_sensor

  processor ep_operations EP_OPERATIONS
     script_variables
        mSensorNameList.PushBack("ew_radar");
     end_script_variables
  end_processor

  aux_data
     double max_range = 185200 # meters = 100 nm
  end_aux_data
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：icon, category, sensor, processor, aux_data

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, comm, processor, purge_interval, weapon, 平台类型
- **出处**：`ballistic_missile_shootdown/platforms/blue_naval_sam_launcher.txt:14-33`　（同签名共 3 处，另见 `iads/platforms/large_sam_launcher.txt:16`、`space_operations/platforms/blue_naval_sam_launcher.txt:14`）
- **片段**：

```text
platform_type BLUE_NAVAL_SAM_LAUNCHER WSF_PLATFORM
  icon PAC-3_Launcher

  comm cmdr_net DATALINK
     network_name <local:slave>
     internal_link data_mgr
     internal_link task_mgr
  end_comm

  processor data_mgr WSF_TRACK_PROCESSOR
    purge_interval       60 sec
  end_processor

  processor task_mgr WSF_TASK_PROCESSOR
  end_processor

  weapon blue_naval_sam BLUE_NAVAL_SAM
     quantity 1
  end_weapon
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, comm, processor, purge_interval, weapon

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, weapon_effects, processor, script_variables, on_initialize, 平台类型
- **出处**：`signature_demos/movers/ssm_base.txt:121-140`
- **片段**：

```text
platform_type SSM_BASE WSF_PLATFORM
   #icon Scud_Missile
   icon HARM
   
   weapon_effects SSM_EFFECT

   processor fuse WSF_GROUND_TARGET_FUSE
   end_processor

   script_variables
      int mShotNumber = 0;
   end_script_variables

   on_initialize
      extern int gShotCount;
      gShotCount = gShotCount + 1;
      mShotNumber = gShotCount;
   end_on_initialize

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, weapon_effects, processor, script_variables, on_initialize

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, spatial_domain, side, icon, weapon_effects, processor, 平台类型
- **出处**：`six_dof/platforms/ubu-500-ld.txt:52-71`
- **片段**：

```text
platform_type  UBU-500-LD  WSF_PLATFORM

   spatial_domain  air
   side            green
   icon            mk82
      
   weapon_effects BOMB_500LB_LD_LETHALITY

   processor fuse WSF_WEAPON_FUSE
      on
      gross_update_interval        0.02 sec
      fine_update_interval         0.01 sec
      time_of_flight_to_arm        1.00 sec
      gross_proximity_range      500.00 ft
      maximum_time_of_flight    3600.00 sec
      detonate_below_height_agl   40.00 ft
      detonate_below_height_msl   50.00 ft
   end_processor
	
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：spatial_domain, side, icon, weapon_effects, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, side, icon, category, mover, processor, 平台类型
- **出处**：`hel/intersect_mesh_test.txt:293-314`
- **片段**：

```text
platform_type RED_ADV_FIGHTER_2 WSF_PLATFORM
   side red
   icon SU-27
   category RED_ADV_FIGHTER_2
   mover WSF_AIR_MOVER end_mover

   // Very Important:  The intersect processor must
   // be defined on targets to get a good result
   // for the "Occluded" script method.
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

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：side, icon, category, mover, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, spatial_domain, side, icon, mover, processor, 平台类型
- **出处**：`six_dof/platforms/fa-lgt_external-tanks.txt:39-60`　（同签名共 7 处，另见 `six_dof/platforms/fa-lgt_external-tanks.txt:15`、`p6dof/platforms/ubu-500-hd.txt:29`、`p6dof/platforms/ubu-500-ld.txt:29`）
- **片段**：

```text
platform_type  FA-LGT-EXTERNAL-TANKS_PM6  WSF_PLATFORM

   spatial_domain  air
   side            green
   icon            f16

   # Setup the PM6 mover
   mover WSF_POINT_MASS_SIX_DOF_MOVER
      vehicle_type                FA-LGT-EXTERNAL-TANKS_PM6
      update_interval             0.05 sec
      event_core_data             30 Hz
      event_kinematic_data        30 Hz
      event_engine_fuel_data      10 Hz
      event_autopilot_data        10 Hz
      event_autopilot_limits_data  1 Hz
      event_control_inputs_data   20 Hz
      event_force_moment_data     20 Hz
   end_mover

   processor sa_processor GENERAL_ASSESSMENT end_processor
   
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：spatial_domain, side, icon, mover, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, spatial_domain, side, icon, mover, weapon, 平台类型
- **出处**：`six_dof/platforms/fa-lgt-bombs-ld.txt:13-34`　（同签名共 2 处，另见 `six_dof/platforms/fa-lgt-bombs-ld.txt:36`）
- **片段**：

```text
platform_type  FA-LGT-BOMBS-LD_RB6  WSF_PLATFORM

   spatial_domain  air
   side            green
   icon            f16

   # Setup the RB6 mover
   mover WSF_RIGID_BODY_SIX_DOF_MOVER
      vehicle_type     FA-LGT-BOMBS-LD_RB6
      update_interval  0.01 sec
   end_mover
   
   weapon Bomb WSF_SIX_DOF_EXPLICIT_WEAPON
      add_subobject Bomb1
      add_subobject Bomb2
      add_subobject Bomb3
      add_subobject Bomb4
      add_subobject Bomb5
      add_subobject Bomb6
   end_weapon

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：spatial_domain, side, icon, mover, weapon

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, category, comm, sensor, processor, 平台类型
- **出处**：`ballistic_missile_shootdown/platforms/blue_abm_ttr.txt:11-33`　（同签名共 3 处，另见 `satellite_demos/platforms/blue_abm_ttr.txt:11`、`space_operations/platforms/blue_abm_ttr.txt:11`）
- **片段**：

```text
platform_type BLUE_ABM_TTR WSF_PLATFORM
   icon Ground_Radar
   category FIRE_CONTROL

   comm datalink DATALINK
     network_name <local:slave>
     internal_link task_mgr
   end_comm

   sensor blue_abm_ttr BLUE_ABM_TTR
     on
     internal_link data_mgr
     ignore_same_side
   end_sensor

   processor data_mgr WSF_LINKED_PROCESSOR
      report_to commander via datalink to sub_net
   end_processor

   processor task_mgr WSF_TASK_PROCESSOR
   end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, category, comm, sensor, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, include, group_join, comm, visual_part, edit, 平台类型
- **出处**：`space_operations/platforms/uplink.txt:16-38`
- **片段**：

```text
platform_type UPLINK WSF_PLATFORM 

  include platforms/starlink_linkable.txt
    
  group_join UPLINK
  
  comm uplink UPLINK
     group_join UPLINK
     pitch 90 deg 
  end_comm

  visual_part uplink WSF_VISUAL_PART
     pitch 90 deg
     azimuth_slew_limits -80 deg 80 deg
     elevation_slew_limits -80 deg 80 deg     
  end_visual_part
  
  edit sensor detect  
     // Set realistic angles for laser transmission.
     elevation_scan_limits 30 deg 90 deg 
  end_sensor
  
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：include, group_join, comm, visual_part, edit

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, sensor, weapon, comm, processor, 平台类型
- **出处**：`electronic_warfare/track_error.txt:253-276`　（同签名共 2 处，另见 `launcher/platforms/sam_launcher.txt:12`）
- **片段**：

```text
platform_type SAM_LAUNCHER WSF_PLATFORM
   icon Launcher
   sensor radar_set RADAR_SET
      on
      internal_link data_mgr
      internal_link task_mgr
      ignore_same_side
   end_sensor

   weapon sam_missile SAM_MISSILE
      internal_link data_mgr
      internal_link task_mgr
   end_weapon

   comm uplink WSF_COMM_TRANSCEIVER
     internal_link data_mgr
   end_comm

   processor task_mgr SAM_TACTICS_PROCESSOR
   end_processor

   processor data_mgr WSF_TRACK_PROCESSOR
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, sensor, weapon, comm, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, mover, comm, sensor, processor, 平台类型
- **出处**：`script_demos/script_demo_2.txt:333-357`　（同签名共 5 处，另见 `script_demos/script_demo_6.txt:299`、`script_demos/script_demo_7.txt:392`、`comm/group_comm_example.txt:57`）
- **片段**：

```text
platform_type EARLY_WARNING_AIRCRAFT WSF_PLATFORM
   icon AWACS
   mover WSF_AIR_MOVER
   end_mover
   comm rcvr-1 WSF_RADIO_RCVR
      frequency 1200 mhz
   end_comm
   comm xmtr-1 WSF_RADIO_XMTR
      frequency 1200 mhz
   end_comm
   // The 'perfect' ESM device.  It can perfectly locate any transmitter in L-band
   sensor esm-1 WSF_ESM_SENSOR
      on
      frame_time 5 sec
      frequency_band 1000 mhz 2000 mhz    // L-band
      reports_location
      reports_frequency
      processor track-proc
      ignore no_awacs_esm
   end_sensor
   processor track-proc WSF_TRACK_PROCESSOR
      update_interval 2 sec
      report_to command_chain GOOD_GUYS subordinates via xmtr-1 to rcvr-1
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, mover, comm, sensor, processor

### platform_type（pm6_brawler_route_comparison）｜平台类型

- **关键词**：platform_type, update_interval, side, heading, route, execute, 平台类型
- **出处**：`six_dof_with_brawler/pm6_brawler_route_comparison.txt:31-57`
- **片段**：

```text
platform_type ROUTE_TEST_PM6 BLUE_FIGHTER_PM6
   update_interval 0.01 sec
   side light_blue 
   heading 90 deg
   
   route
      position 00:05:00.00n  01:10:00.00w  altitude 30000 ft msl speed 900 ft/s
      position 00:00:36.035n 01:47:21.156e altitude 30000 ft msl speed 900 ft/s
   end_route
   
   execute at_time 15 sec absolute
      PLATFORM.FlyHeadingSpeedAltitude(60.0, 350.0, 8000.0, 0.0, 0.0);
   end_execute
   execute at_time 75 sec absolute
      PLATFORM.FlyHeadingSpeedAltitude(180.0, 250.0, 5000.0, 0.0, 0.0);
   end_execute
   execute at_time 135 sec absolute
      PLATFORM.FlyHeadingSpeedAltitude(180.0, 250.0, 7000.0, 0.0, 0.0);
   end_execute
   execute at_time 195 sec absolute
      PLATFORM.FlyHeadingSpeedAltitude(15.0, 250.0, 7000.0, 0.0, 0.0);
   end_execute
   execute at_time 255 sec absolute
      PLATFORM.FlyHeadingSpeedAltitude(105.0, 250.0, 10000.0, 0.0, 0.0);
   end_execute
   
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：update_interval, side, heading, route, execute

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, side, icon, comm, sensor, processor, 平台类型
- **出处**：`cyber/platforms/spotter.txt:14-46`　（同签名共 8 处，另见 `satellite_demos/platforms/ground_station.txt:28`、`engage/grid.txt:35`、`engage/grid_w_observer.txt:35`）
- **片段**：

```text
platform_type SPOTTER WSF_PLATFORM 
   side red
   icon human
   
   comm datalink RED_DATALINK
     network_name <local:slave>
   end_comm
   
   sensor eyeball EYEBALL
      on
      internal_link data_mgr
      internal_link task_mgr
   end_sensor
   
   processor data_mgr WSF_TRACK_PROCESSOR
   end_processor

   processor task_mgr WSF_TASK_PROCESSOR
      
      evaluation_interval REPORT 1 day
      state REPORT
         on_entry
            WsfMessage msg = WsfMessage();
            if (!TRACK.IFF_Friend() && TRACK.TargetType() == "UAV")
            {
              PLATFORM.Comm("datalink").SendMessage(msg, "ground_radar_1", "datalink2");
            }
         end_on_entry
      end_state
      
   end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：side, icon, comm, sensor, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, comm, processor, weapon, script, 平台类型
- **出处**：`iads_c2_demos/platforms/sam_launcher.txt:17-51`
- **片段**：

```text
platform_type SAM_LAUNCHER WSF_PLATFORM
   icon SA-10_Launcher

   comm cmdr_net RED_DATALINK
      network_name <local:slave>
      internal_link data_mgr
      internal_link dissemination
   end_comm

   processor data_mgr WSF_TRACK_PROCESSOR
      purge_interval       60 sec
      unchanged_track_reporting disable
      circular_report_rejection on
   end_processor

   processor dissemination DC2
   end_processor

   processor asset_manager WPN_AM
   end_processor

   processor weapons_manager WM_SAM
   end_processor

   weapon sam SAM
      quantity 4
   end_weapon

   # Intercept calculator
   script WsfBMInterceptCalcResult can_intercept(WsfWeapon weapon, WsfTrack track)
      WsfBMInterceptCalcResult result = SAM_LaunchComputer (track, weapon.Platform(), "no-zone", 0);
      return result;
   end_script

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, comm, processor, weapon, script

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, radar_signature, mover, comm, on, 平台类型
- **出处**：`satellite_demos/platforms/noaa.txt:20-54`　（同签名共 6 处，另见 `satellite_demos/platforms/orbcomm.txt:18`、`satellite_demos/platforms/irnss.txt:20`、`satellite_demos/platforms/globalstar.txt:18`）
- **片段**：

```text
platform_type NOAA WSF_PLATFORM
  icon satellite
  radar_signature NOAA_RADAR_SIG
  mover WSF_NORAD_SPACE_MOVER
  end_mover

  comm NOAA_DOWNLINK1_TX NOAA_DOWNLINK1_TX
   on
  end_comm

  comm NOAA_UPLINK_RX NOAA_UPLINK_RX
   on
  end_comm

#===========Uncomment this to send a test message to Ground stations=================================================
#execute at_interval_of 1 s
#      // Loop through all the platforms in the simulation
#      for (int i = 1; i <= WsfSimulation.PlatformCount(); i = i + 1)
#          {
#          WsfPlatform myPlatform = WsfSimulation.FindPlatform(i);
#          if ((myPlatform != PLATFORM) && myPlatform.IsValid())   # Make sure we are not trying to talk to ourselves!
#              {
#              WsfControlMessage myMessage = WsfControlMessage();
#              myMessage.SetFunction("Blah blah blah");
#
#	      if (myPlatform.Type() == "NOAA_GS")
#                  {
#                  PLATFORM.Comm("NOAA_DOWNLINK1_TX").SendUnicastMessage(myMessage, myPlatform);
#                  }
#              }
#          }
# end_execute
#====================================================================================================================

 end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, radar_signature, mover, comm, on

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, mover, navigation_errors, sensor, processor, 平台类型
- **出处**：`sensor_demos/nav_demo.txt:44-79`
- **片段**：

```text
platform_type UAV WSF_PLATFORM
   icon Predator

   mover WSF_AIR_MOVER
   end_mover

   navigation_errors
      # GPS errors
      gps_in_track_error               8 m
      gps_cross_track_error            2 m
      gps_vertical_error               3 m

      # INS errors
      ins_vertical_error               10 m

      # The following commands aren't strictly necessary. They produce output that
      # is useful for analysis and debugging.

      time_history_path   .          # write time history data
                                     # <time_history_path>/<platform_name>.neh

      show_status_changes true       # write a message to standard output when status changes
   end_navigation_errors

   # A trivial sensor that shows that errors will be generated (look in replay.evt)
   sensor perfect WSF_GEOMETRIC_SENSOR
      frame_time 10 sec
      maximum_range 200 km
      ignore_same_side
      reports_location
      on
   end_sensor

   processor gps ZONE_BASED_GPS_STATUS_PROCESSOR
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, mover, navigation_errors, sensor, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, category, side, icon, add, on_initialize, 平台类型
- **出处**：`comm/platforms/detector.txt:18-56`
- **片段**：

```text
platform_type DETECTOR WSF_PLATFORM
   category ad_hoc
   side blue
   icon predator
   add comm ad_hoc AD_HOC end_comm
   add router default DEFAULT end_router
   
   add mover WSF_AIR_MOVER
   end_mover
   
   add processor tracker WSF_TRACK_PROCESSOR
      external_link platform black_van comm van_comm via ad_hoc
   end_processor
   
   add sensor sense WSF_GEOMETRIC_SENSOR
      on
      maximum_range 50 km
      frame_time 10 s
      reports_location
      ignore ad_hoc
      internal_link tracker 
   end_sensor
   
   on_initialize
      double latitude = 40;
      double longitude = -100;
      double altitude = 2000;
      double heading = 0;
      
      latitude = latitude + RANDOM.Uniform(-1, 1);
      longitude = longitude + RANDOM.Uniform(-1, 1);
      altitude = altitude + RANDOM.Uniform(-2000, 2000);
      heading = RANDOM.Uniform(0, 359);
      
      PLATFORM.SetLocation(latitude, longitude, altitude);
      PLATFORM.SetHeading(heading);
      PLATFORM.SetRoute("detector_route");
   end_on_initialize
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：category, side, icon, add, on_initialize

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, side, radar_signature, mover, processor, 平台类型
- **出处**：`base_types/weapons/agm/blue_adv_cruise_missile.txt:64-105`　（同签名共 4 处，另见 `swarm/weapons/agm/leader_agm.txt:42`、`cyber/weapons/agm/client_agm.txt:42`、`swarm/weapons/agm/client_agm.txt:42`）
- **片段**：

```text
platform_type BLUE_ADV_CRUISE_MISSILE WSF_PLATFORM
   icon JSOW
   side blue
   radar_signature BLUE_ADV_CRUISE_MISSILE_RADAR_SIG
   mover WSF_GUIDED_MOVER
      update_interval 0.1 secs
      stage 1
         aero BLUE_ADV_CRUISE_MISSILE_WINGS_FOLDED
         total_mass 0 lbs
         pre_ignition_coast_time 0.1 sec
         pre_separation_coast_time 10.0 sec #give it 10 secs to open wings
      end_stage
      stage 2
         aero BLUE_ADV_CRUISE_MISSILE_WINGS_EXTENDED
         total_mass 1065 lbs
      end_stage
   end_mover
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
   processor fuse WSF_GROUND_TARGET_FUSE end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, radar_signature, mover, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, category, icon, mover, comm, processor, 平台类型
- **出处**：`alv_routing/platforms/fighter_bomber.txt:12-69`
- **片段**：

```text
platform_type FIGHTER_BOMBER WSF_PLATFORM
   category no_awacs_esm
   icon FIGHTER

   mover WSF_AIR_MOVER
     maximum_radial_acceleration 1.12 g
     maximum_linear_acceleration 2 g
   end_mover

   comm rcvr-1 WSF_RADIO_RCVR
      frequency 1200 mhz
      processor track-proc
      processor attack-proc
   end_comm

   comm xmtr-1 WSF_RADIO_XMTR
      frequency 1200 mhz
   end_comm

   processor track-proc WSF_TRACK_PROCESSOR
   end_processor

   processor attack-proc WSF_SCRIPT_PROCESSOR
      on_message
         type WSF_TRACK_MESSAGE
            script
               WsfTrackMessage trackMsg = (WsfTrackMessage)MESSAGE;
               WsfTrack        track    = trackMsg.Track();
               WsfTrackId      trackId  = track.TrackId();
               double     targetLat     = track.Latitude();
               double     targetLon     = track.Longitude();
               if (TIME_NOW < 50.0)
               {
                  #writeln("Received track message from ", trackId.OwningPlatform());
               }

               // If we aren't attacking then start the 'attack'
               WsfProcessor launchComputer = PLATFORM.Processor("alv-launch-computer");
               if (! launchComputer.IsTurnedOn())
               {
                  writeln_d("Starting attack at T=", TIME_NOW);
                  launchComputer.TurnOn();
                  PLATFORM.GoToLocation(targetLat, targetLon);
               }
            end_script

         type default
            script
               writeln_d("Received message of type ", MESSAGE.Type());
            end_script
      end_on_message
   end_processor

   processor alv-launch-computer ALV_LAUNCH_COMPUTER
     off
     update_interval 1 sec
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：category, icon, mover, comm, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, script_variables, execute, sensor, processor, 平台类型
- **出处**：`electronic_warfare/closely_space_targets_ttr.txt:148-208`
- **片段**：

```text
platform_type TTR_RADAR WSF_PLATFORM
   icon Ground_Radar

   # ---------------------------------------------
   # Draw track to false targets and real targets
   # ---------------------------------------------
   script_variables
      # Create a WsfDraw object.
      WsfDraw draw = WsfDraw();
   end_script_variables

   execute at_interval_of 1.0 s
      foreach (WsfTrack track in MasterTrackList())
      {
         WsfSensor sensor = PLATFORM.Sensor("ttr_radar");
         if (!sensor.HaveRequestFor(track.TrackId()))
         {
            if (track.Target().Name() == "striker-1")
            {
               track.SetLocation(track.Target().Location());
               sensor.TurnOn();
               sensor.StartTracking(track, "TRACK");
            }
         }

         if (track.IsValid())
         {
            writeln(track.LocationAtTime(TIME_NOW));
            sensor.CueToPoint(track.LocationAtTime(TIME_NOW));
            # use the track ID as a unique draw ID
            # a track icon and a line to the track icon
            # is drawn at each track update
            string trackId = track.TrackId().ToString();
            draw.SetId(trackId);
            draw.SetDuration(1.0); # this is faster than calling erase every time

            draw.SetColor(0,0,1);
            draw.BeginIcons(track.Heading(), "Wedge");
            draw.Vertex(track.CurrentLocation());
            draw.End();

            # Draw a line to the track
            draw.SetLineStyle("dashed");
            draw.BeginLines();
            draw.Vertex(PLATFORM);
            draw.Vertex(track.CurrentLocation());
            draw.End();
         }
      }
   end_execute
   # ---------------------------------------

   sensor ttr_radar TTR_RADAR
      processor track_manager
      internal_link track_manager
      ignore_same_side
   end_sensor

   processor track_manager WSF_TRACK_PROCESSOR
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, script_variables, execute, sensor, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, side, mover, add, comm, 平台类型
- **出处**：`satellite_demos/platforms/comsat_satellite.txt:20-89`
- **片段**：

```text
platform_type COMSAT WSF_PLATFORM
   icon Satellite
   side blue
   mover WSF_NORAD_SPACE_MOVER end_mover
   
   // enable automated linking for bridging
   add router default WSF_COMM_ROUTER
      automated_interface_linking true
   end_router

   comm downlink-1 WSF_RADIO_XMTR
     # The earth radius multiplier is set to one to disable the
     # computations that simulate atmospheric refraction.
     earth_radius_multiplier 1.0
     antenna_pattern SAT_ANTENNA
     frequency       435.300 mhz
     power           1 w
     # The internal loss accounts for the 'transmit feeder loss' in the
     # link budget calculator
     internal_loss   0.2 dB
     transfer_rate   1.544 mbit/s
     //debug
     network_name ComsatNet
   end_comm

   comm uplink-1 WSF_RADIO_RCVR
     antenna_pattern SAT_ANTENNA
     frequency       145.920 mhz
     # The internal_loss is used to account the following items from the
     # link budget calculator:
     #   a) 3 dB polarization mismatch loss.
     #   b) 1 dB loss for going through the ionosphere
     #   c) 0.2 dB receive antenna feeder loss
     internal_loss   4.2 dB
     # The receiver noise floor in the link budget calculator is -138 dBm
     noise_power     -138 dBm
     detection_threshold 12 dB
     //debug
     network_name ComsatNet
   end_comm

   comm downlink-2 WSF_RADIO_XMTR
     antenna_pattern SAT_ANTENNA
     frequency       2401.200 mhz
     power           1 w
     # The internal loss accounts for the 'transmit feeder loss' in the
     # link budget calculator
     internal_loss   0.2 dB
     transfer_rate   1.544 mbit/s
     //debug
     network_name ComsatNet
   end_comm

   comm uplink-2 WSF_RADIO_RCVR
     antenna_pattern SAT_ANTENNA
     frequency       1268.700 mhz
     # The internal_loss is used to account the following items from the
     # link budget calculator:
     #   a) 3 dB polarization mismatch loss.
     #   b) 1 dB loss for going through the ionosphere
     #   c) 0.2 dB receive antenna feeder loss
     internal_loss   4.2 db
     # The receiver noise floor in the link budget calculator is -138 dBm
     noise_power     -138 dBm
     detection_threshold 12 dB
     //debug
     network_name ComsatNet
   end_comm

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, mover, add, comm

### platform_type（red_adv_fighter_1_ripr）｜平台类型

- **关键词**：platform_type, delete, weapon, edit, processor, sensor, 平台类型
- **出处**：`base_types/platforms/red_adv_fighter_1_ripr.txt:23-106`
- **片段**：

```text
platform_type RED_ADV_FIGHTER_1 RED_ADV_FIGHTER_1_BASE

  //use a different missile for this type
  //adjust missile ranges in int-thinker below to accomodate
  delete weapon int_missile

  #weapon int_missile RED_MR_A2A_RF_MISSILE end_weapon    # ~45 nm range

  weapon blue_lr_a2a_rf_missile SIMPLE_BLUE_LR_A2A_RF_MISSILE end_weapon  # ~60 nm range
  edit weapon blue_lr_a2a_rf_missile
     quantity 8
  end_weapon

   //This is the code that lets the interceptor intercept
   processor int-thinker AIAI-thinker
      script_variables
         #agentProductions must be relative to working directory of application
         #this file usually sits in scenario_name/platforms folder
         #working directory is typically the scenario folder
         #agentProductions = "../ripr/agents/aiai/RIPR-AIAI.soar";

        #mWeaponArray[0] = Map<string, Object>();
        #mWeaponArray[0].Set("name", "int_missile");
        #mWeaponArray[0].Set("weapon", PLATFORM.Weapon("int_missile"));
        #mWeaponArray[0].Set("rangeMin", 5556);
        #mWeaponArray[0].Set("rangeMax", 83340);
        #mWeaponArray[0].Set("numActiveMax", 2); // how many weapons of this type can be in play simultaneously

         mWeaponArray[0] = Map<string, Object>();
         mWeaponArray[0].Set("name", "blue_lr_a2a_rf_missile");
         mWeaponArray[0].Set("weapon", PLATFORM.Weapon("blue_lr_a2a_rf_missile"));
         mWeaponArray[0].Set("rangeMin", 1000);
         mWeaponArray[0].Set("rangeMax", 111120); // ~60 miles
         mWeaponArray[0].Set("numActiveMax", 2); // how many weapons of this type can be in play simultaneously

      end_script_variables
   end_processor

   sensor geo_sensor WSF_GEOMETRIC_SENSOR
      //azimuth_field_of_view -180.0 degrees 180.0 degrees
      //elevation_field_of_view -90.0 degrees 90.0 degrees
      azimuth_field_of_view -60.0 degrees 60.0 degrees
      elevation_field_of_view -30.0 degrees 30.0 degrees
      minimum_range 0 m
#      maximum_range 100000 m
      maximum_range 63000 m
      on
      frame_time              0.5 sec
      reports_location
      reports_velocity
      reports_iff
      track_quality 1.0
      ignore_same_side
      internal_link track_manager
   end_sensor

   processor incoming_threats WSF_THREAT_PROCESSOR
     update_interval 0.1 sec
     #update_interval 2.0 sec

      #1300 knots
      threat_velocity 668.7778 m/s

      threat_angle_spread 15.0 deg
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

end_platform_type
```

- **演示要点**：演示 platform_type 的参数：delete, weapon, edit, processor, sensor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, spatial_domain, side, icon, category, processor, 平台类型
- **出处**：`six_dof/platforms/gbu-500.txt:70-154`
- **片段**：

```text
platform_type  GBU-500  WSF_PLATFORM

   spatial_domain  air
   side            blue
   icon            mk82
   category        weapon

   processor fuse WSF_WEAPON_FUSE
      on
      gross_update_interval        0.02 sec
      fine_update_interval         0.01 sec
      time_of_flight_to_arm        1.00 sec
      gross_proximity_range      100.00 ft
      maximum_time_of_flight    3600.00 sec
      detonate_below_height_agl   40.00 ft
      detonate_below_height_msl   50.00 ft
   end_processor

   processor data_mgr WSF_TRACK_PROCESSOR
      on
      master_track_processor
      #show_state_transitions
      update_interval 0.01 sec
      purge_interval  1 sec
   end_processor

   # This will lock-on to the pre-briefed target,
   # if a track exits.
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
   
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：spatial_domain, side, icon, category, processor

### platform_type（hellfire_type）｜平台类型

- **关键词**：platform_type, script_variables, edit, sensor, update_interval, on_update, 平台类型
- **出处**：`hellfire/active_radar_hellfire/hellfire_type.txt:131-217`
- **片段**：

```text
platform_type RF_HELLFIRE HELLFIRE

   script_variables

      double cDBS_THRESHOLD      = 0.5; // 0.5 meters per second
      double cDBS_LATERAL_BIAS   = 1.5; // Gees.  Adjust this to change the lateral flight path for stationary target.

      bool dbsTrajectoryIsOn     = false;

   end_script_variables

   edit mover
      total_mass       105.0 lbm
   end_mover

   sensor hellfire_mmw_seeker HELLFIRE_RADAR_SEEKER
      on
      processor track_manager
      #debug
   end_sensor

   edit processor hellfire_autopilot
      #debug
      #show_status
      guide_to_truth true # false # DRB - TO-DO - Want to set false eventually, but currently misses if not set true.
      update_interval              0.01 s
      proportional_navigation_gain 5.0
      velocity_pursuit_gain        2.0
      g_bias                       6.0 # Adjust this to change the height of the trajectory.
      lateral_g_bias               0.0 # This may be overwritten by script for DBS trajectory!
   end_processor

   update_interval 0.1 sec

   on_update
      # Once a DBS trajectory (and direction) is chosen, never revert back to non-DBS.
      if (! dbsTrajectoryIsOn)
      {
         # If the target track comes to rest, switch to a DBS trajectory to increase the SNR in Doppler processing.
         if (PLATFORM.CurrentTargetTrack().IsValid())
         {
            bool autonomous = PLATFORM.CurrentTargetTrack().Originator() == PLATFORM;
            if (autonomous)
            {
               double tgtSpd = PLATFORM.CurrentTargetTrack().Speed();
               bool isMoving = tgtSpd > cDBS_THRESHOLD;
               if (isMoving)
               {
                  #writeln("*** RF_HELLFIRE has a moving target.  Speed = ", tgtSpd, " mps.  DBS not flown. ***");
               }
               else
               {
                  # The target has come to rest.  Switch into Doppler-Beam-Sharpening Trajectory to pull the target out of clutter.

                  dbsTrajectoryIsOn = true;
                  # If the track is to our left, fly the DBS trajectory arc accelerating out to our right, then hooking back to the left.
                  double tgtBearing = PLATFORM.CurrentTargetTrack().Bearing();
                  double thisHeading = PLATFORM.Heading();
                  double azimuth = MATH.NormalizeAngleMinus180_180(tgtBearing - thisHeading);
                  bool dbsTrajectoryHookLeft = azimuth <= 0.0;

                  WsfProcessor proc = PLATFORM.Processor("hellfire_autopilot");
                  if (proc.IsValid())
                  {
                     WsfGuidanceComputer gc = (WsfGuidanceComputer)(proc);
                     if (gc.IsValid())
                     {
                        writeln("*** RF_HELLFIRE GP Ptr Valid.  Setting DBS (Tgt spd = ", tgtSpd, " mps).  ***");

                        double bias = -cDBS_LATERAL_BIAS;
                        if (dbsTrajectoryHookLeft)
                        {
                           bias = cDBS_LATERAL_BIAS;
                        }
                        gc.SetLateralGeeBias(bias);
                     }
                  }
               }
            }
            else
            {
               writeln("*** RF_HELLFIRE Track not yet autonomous.");
            }
         }
      }
   end_on_update
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：script_variables, edit, sensor, update_interval, on_update

### platform_type（pm6_missile_comparison）｜平台类型

- **关键词**：platform_type, icon, side, weapon, sensor, processor, 平台类型
- **出处**：`six_dof/pm6_missile_comparison.txt:260-366`　（同签名共 2 处，另见 `six_dof/rb6_missile_comparison.txt:260`）
- **片段**：

```text
platform_type AirlinerSelfDefense C-HVY_PM6

   icon  b777
   side  white
   
   weapon sr-sdm AAM-SR-TVC_PM6-WEAPON

      quantity 1

      launch_delta_v 0.0 0.0 0.0 ft/sec

      script void on_create(WsfPlatform aWeapon, WsfTrack aTrack)
         missile_on_create(aWeapon, aTrack);
      end_script

   end_weapon   
   
   sensor radar WSF_GEOMETRIC_SENSOR
      on
      azimuth_field_of_view   -110.0 degrees  110.0 degrees
      elevation_field_of_view  -90.0 degrees   90.0 degrees
      maximum_range 10 nm
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

   processor data_mgr WSF_TRACK_PROCESSOR
      purge_interval  60 sec
   end_processor   
   
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

end_platform_type
```

- **演示要点**：演示 platform_type 的参数：icon, side, weapon, sensor, processor

### platform_type（tactical_maneuvers）｜平台类型

- **关键词**：platform_type, update_interval, side, icon, script_variables, script, 平台类型
- **出处**：`p6dof/tactical_maneuvers.txt:135-383`　（同签名共 3 处，另见 `six_dof/pm6_tactical_maneuvers.txt:135`、`six_dof/rb6_tactical_maneuvers.txt:135`）
- **片段**：

```text
platform_type RedFighter FA-HVY
   
   update_interval 0.01 sec
   
   side red
   icon mig29_rus

   script_variables
      static double targetBankAngle_deg = 0.0;
      static double targetGLoad = 0.0;
      static bool   diving = true;
      static string mode = "NONE";
   end_script_variables

   script bool SlicebackRollAchieved(WsfPlatform aPlatform)

      double currentRoll_deg = aPlatform.Roll();
      bool angleMet = false;

      if( targetBankAngle_deg < 0.0 )
      {
         if( currentRoll_deg <= (targetBankAngle_deg + 1) )
         {
            angleMet = true;
         }
      }
      else
      {
         if( currentRoll_deg >= (targetBankAngle_deg - 1) )
         {
            angleMet = true;
         }
      }

      return angleMet;

   end_script

   script bool SlicebackPitchAchieved(WsfPlatform aPlatform)

      double currentRoll_deg = aPlatform.Roll();
      double currentPitch_deg = aPlatform.Pitch();
      bool angleMet = false;

      if( diving )
      {
         if( (currentRoll_deg >= -90.0)&&(currentRoll_deg <= 90.0) )
         {
            if(currentPitch_deg >= 0.0)
            {
               angleMet = true;
            }
         }
      }
      else
      {
         if( (currentRoll_deg <= -90.0)||(currentRoll_deg >= 90.0) )
         {
            if(currentPitch_deg <= 0.0)
            {
               angleMet = true;
            }
         }
      }

      return angleMet;

   end_script

   script bool SlicebackRolloutAchieved(WsfPlatform aPlatform)

      double currentRoll_deg = aPlatform.Roll();
      double currentPitch_deg = aPlatform.Pitch();

      bool angleMet = false;

      if( diving )
      {
         if( (currentRoll_deg >= -0.1)&&(currentRoll_deg <= 0.1) )
         {
            if(currentPitch_deg >= 0.0)
            {
               angleMet = true;
            }
         }
      }
      else
      {
         if( (currentRoll_deg >= -0.1)&&(currentRoll_deg <= 0.1) )
         {
            if(currentPitch_deg >= 0.0)
            {
               angleMet = true;
            }
         }
      }

      return angleMet;

   end_script

   script void PerformSlicebackRoll(WsfPlatform aPlatform, string aCallbackName)
      RollToBankAngle(aPlatform, targetBankAngle_deg);  // Roll to the target bank angle
      if( diving )
      {
         SetPitchGLoad(aPlatform, 0.0);
      }
      else
      {
         SetPitchGLoad(aPlatform, 1.0);
      }
      mode = "PERFORMING_SLICEBACK_ROLL";
      writeln("*** PerformSlicebackRoll ***");
   end_script

   script void PerformSlicebackPitch(WsfPlatform aPlatform, string aCallbackName)
      SetRollRate(aPlatform, 0.0);
      SetPitchGLoad(PLATFORM, targetGLoad);
      mode = "PERFORMING_SLICEBACK_PITCH";
      writeln("*** PerformSlicebackPitch ***");
   end_script

   script void PerformSlicebackRollout(WsfPlatform aPlatform, string aCallbackName)
      RollToBankAngle(aPlatform, 0.0);
      SetGamma(PLATFORM, 0.0);
      mode = "PERFORMING_SLICEBACK_ROLLOUT";
      writeln("*** PerformSlicebackRollout ***");
   end_script

   script void CompleteSliceback(WsfPlatform aPlatform, string aCallbackName)
      RollToBankAngle(aPlatform, 0.0);
      SetGamma(PLATFORM, 0.0);
      mode = "IDLE";
      writeln("*** CompleteSliceback ***");
   end_script

   script void Sliceback(WsfPlatform aPlatform, double aRollAngle_deg, double aGload, string aCallbackName)
      // Allow any bank angle
      SetMaxBankAngle(aPlatform, 180.0);

      // Set bank angle and g-load
      targetBankAngle_deg = aRollAngle_deg;
      targetGLoad = aGload;

      // Set the diving flag, based on roll/bank angle (up or inverted)
      if( (aRollAngle_deg >= -90.0)&&(aRollAngle_deg <= 90.0))
      {
         diving = false;
      }
      else
      {
         diving = true;
      }

      PerformSlicebackRoll(PLATFORM,"SlicebackRollComplete");

      // Call ProcessSliceback to perform the sliceback
      aPlatform.ExecuteAtTime(TIME_NOW + 0.01, "ProcessSliceback", {aPlatform,aCallbackName});

   end_script

   script void SlicebackComplete()
      writeln("*** SlicebackComplete ***");
   end_script

   script void ProcessSliceback(WsfPlatform aPlatform, string aCallbackName)

      bool modeAchieved = false;

      if( mode == "PERFORMING_SLICEBACK_ROLL" )
      {
         modeAchieved = SlicebackRollAchieved(aPlatform);
         if(modeAchieved)
         {
            writeln("  SlicebackRoll achieved...");
            PerformSlicebackPitch(aPlatform,aCallbackName);
         }
      }
      else if( mode == "PERFORMING_SLICEBACK_PITCH" )
      {
         modeAchieved = SlicebackPitchAchieved(aPlatform);
         if(modeAchieved)
         {
            writeln("  SlicebackPitch achieved...");
            PerformSlicebackRollout(aPlatform,aCallbackName);
         }
      }
      else if( mode == "PERFORMING_SLICEBACK_ROLLOUT" )
      {
         modeAchieved = SlicebackRolloutAchieved(aPlatform);
         if(modeAchieved)
         {
            writeln("  SlicebackRollout achieved...");
            CompleteSliceback(aPlatform,aCallbackName);
         }
      }

      if( mode != "IDLE" )
      {
         aPlatform.ExecuteAtTime(TIME_NOW + 0.01, "ProcessSliceback", {aPlatform,aCallbackName});
      }

   end_script
   
# ------------------------------------------------------------------------------

   // The goal of this maneuver set is to always roll to put the target "on the canopy"
   // and to pull-g to keep the target in the sweet-spot (within 10 deg).

   script void DetermineRollAndPull3(WsfPlatform aPlatform, string aCallbackName)

      bool modeAchieved = false;

      if( mode == "PERFORMING_SLICEBACK_ROLL" )
      {
         modeAchieved = SlicebackRollAchieved(aPlatform);
         if(modeAchieved)
         {
            writeln("  SlicebackRoll achieved...");
            PerformSlicebackPitch(aPlatform,aCallbackName);
         }
      }
      else if( mode == "PERFORMING_SLICEBACK_PITCH" )
      {
         modeAchieved = SlicebackPitchAchieved(aPlatform);
         if(modeAchieved)
         {
            writeln("  SlicebackPitch achieved...");
            PerformSlicebackRollout(aPlatform,aCallbackName);
         }
      }
      else if( mode == "PERFORMING_SLICEBACK_ROLLOUT" )
      {
         modeAchieved = SlicebackRolloutAchieved(aPlatform);
         if(modeAchieved)
         {
            writeln("  SlicebackRollout achieved...");
            CompleteSliceback(aPlatform,aCallbackName);
         }
      }

      if( mode != "IDLE" )
      {
         aPlatform.ExecuteAtTime(TIME_NOW + 0.01, "ProcessSliceback", {aPlatform,aCallbackName});
      }

   end_script

end_platform_type
```

- **演示要点**：演示 platform_type 的参数：update_interval, side, icon, script_variables, script

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, radar_signature, infrared_signature, optical_signature, 平台类型
- **出处**：`alternate_locations/platforms/target.txt:10-15`　（同签名共 4 处，另见 `cyber/exfiltrate_demo/platforms/target.txt:14`、`iads/platforms/target.txt:14`、`iads_c2_demos/platforms/target.txt:14`）
- **片段**：

```text
platform_type TARGET WSF_PLATFORM 
   icon Bullseye_team
   radar_signature VEHICLE_RADAR_SIGNATURE
   infrared_signature VEHICLE_INFRARED_SIGNATURE
   optical_signature VEHICLE_OPTICAL_SIGNATURE
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, radar_signature, infrared_signature, optical_signature

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, side, mover, radar_signature, 平台类型
- **出处**：`electronic_warfare/agile_auto-repeater_jamming.txt:289-294`　（同签名共 33 处，另见 `electronic_warfare/agile_jamming.txt:352`、`electronic_warfare/agile_repeater_jamming-rt1.txt:406`、`electronic_warfare/agile_repeater_jamming-rt2.txt:406`）
- **片段**：

```text
platform_type STRIKER_PLATFORM WSF_PLATFORM
   icon F-18E
   side blue
   mover WSF_AIR_MOVER end_mover
   radar_signature FIGHTER_RADAR_SIGNATURE
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, mover, radar_signature

### platform_type（basic_formation）｜平台类型

- **关键词**：platform_type, update_interval, side, icon, follow_vertical_track, 平台类型
- **出处**：`p6dof/basic_formation.txt:30-35`　（同签名共 7 处，另见 `p6dof/formation_tanking.txt:35`、`p6dof/hierarchical_maneuvers.txt:31`、`six_dof/pm6_formation_tanking.txt:35`）
- **片段**：

```text
platform_type FormationFlyer FA-LGT
   update_interval 0.01 sec
   side blue
   icon f16
   follow_vertical_track
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：update_interval, side, icon, follow_vertical_track

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, category, side, icon, mover, 平台类型
- **出处**：`fires/types/fires_120mm_artillery.txt:40-46`　（同签名共 18 处，另见 `fires/types/fires_120mm_mortar.txt:45`、`fires/types/fires_152mm_artillery.txt:39`、`fires/types/fires_60mm_mortar.txt:42`）
- **片段**：

```text
platform_type FIRES_120MM_ARTILLERY WSF_PLATFORM
   category RAM
   side red
   icon SA-10_Missile
   mover WSF_FIRES_MOVER
   end_mover
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：category, side, icon, mover

### platform_type（fires_107mm_rocket）｜平台类型

- **关键词**：platform_type, category, icon, side, weapon, 平台类型
- **出处**：`fires/types/fires_107mm_rocket.txt:68-74`　（同签名共 14 处，另见 `fires/types/fires_107mm_rocket.txt:76`、`fires/types/fires_120mm_artillery.txt:58`、`fires/types/fires_120mm_artillery.txt:66`）
- **片段**：

```text
platform_type FIRES_107MM_ROCKET_EXPLICIT_LAUNCHER FIRES_LAUNCHER
   category HEL_IGNORE
   icon mil_SS-Launcher-LR
   side red
   weapon fires_107mm_rocket FIRES_107MM_ROCKET_EXPLICIT
   end_weapon
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：category, icon, side, weapon

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, side, spatial_domain, mover, 平台类型
- **出处**：`kinematic_mover/kinematic_mover_demo.txt:28-34`　（同签名共 20 处，另见 `kinematic_mover/kinematic_mover_demo.txt:37`、`p6dof/platforms/a-lgt.txt:13`、`p6dof/platforms/fa-lgt-blue.txt:13`）
- **片段**：

```text
platform_type   FLYER    WSF_PLATFORM
  icon F-15
  side blue
  spatial_domain air
  mover WSF_KINEMATIC_MOVER
  end_mover
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, spatial_domain, mover

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, mover, default_linear_acceleration, default_radial_acceleration, default_climb_rate, 平台类型
- **出处**：`traffic_demos/platforms/blue_multirole_fighter_1_static.txt:9-15`
- **片段**：

```text
platform_type BLUE_MULTIROLE_FIGHTER_1_STATIC WSF_PLATFORM
  mover WSF_AIR_MOVER
    default_linear_acceleration 1.0 g
    default_radial_acceleration 1.0 g
    default_climb_rate 200 fps
  end_mover
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：mover, default_linear_acceleration, default_radial_acceleration, default_climb_rate

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, radar_signature, mover, weapon, 平台类型
- **出处**：`chaff/chaff_example_ttr.txt:86-93`　（同签名共 2 处，另见 `electronic_warfare/jam_strobe_direction_finder.txt:171`）
- **片段**：

```text
platform_type BLUE_AIR_LIFTER_JET WSF_PLATFORM
   icon C-17

   radar_signature BLUE_AIR_LIFTER_JET_RADAR_SIG

   mover WSF_AIR_MOVER end_mover
   weapon chaff CHAFF_WEAPON  end_weapon
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, radar_signature, mover, weapon

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, side, icon, concealment_factor, category, 平台类型
- **出处**：`space_operations/platforms/launch_facility.txt:10-17`
- **片段**：

```text
platform_type  LAUNCH_FACILITY  WSF_PLATFORM
   side red
   icon wedge

   concealment_factor 1.0 #cannot be sensed (only sense launch vehicle)

   category launch
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：side, icon, concealment_factor, category

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, radar_signature, optical_signature, infrared_signature, sensor, 平台类型
- **出处**：`sensor_plot/esm/hm-tdoa.txt:88-96`　（同签名共 3 处，另见 `sensor_plot/radar/hm-pass-detect.txt:68`、`sensor_plot/esm/hm-jammer-detect-1.txt:39`）
- **片段**：

```text
platform_type TARGET_PLATFORM_TYPE WSF_PLATFORM
   radar_signature    UCAV_RADAR_SIG
   optical_signature  UCAV_OPTICAL_SIG
   infrared_signature UCAV_INFRARED_SIG

   sensor radar BLUE_A2A_RADAR
      on
   end_sensor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：radar_signature, optical_signature, infrared_signature, sensor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, side, icon, comm, processor, 平台类型
- **出处**：`engage/launchers/generic_launcher.txt:10-20`　（同签名共 2 处，另见 `cyber/platforms/cyber_command_post.txt:14`）
- **片段**：

```text
platform_type GENERIC_LAUNCHER WSF_PLATFORM
   side red
   icon SA-10_Launcher

   comm comm WSF_COMM_TRANSCEIVER
      internal_link operator
   end_comm

   processor operator WSF_TASK_PROCESSOR
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：side, icon, comm, processor

### platform_type（hel_test）｜平台类型

- **关键词**：platform_type, spatial_domain, icon, side, add, 平台类型
- **出处**：`hel/hel_test.txt:202-212`　（同签名共 2 处，另见 `hel/hel_test.txt:282`）
- **片段**：

```text
platform_type BLUE_MULTIROLE_FIGHTER_1EF-HEL HEL_PLATFORM

   spatial_domain air
   icon F-18E
   side blue

   add weapon hel AA_SELF_PROTCECT_HEL
      #debug
   end_weapon

end_platform_type
```

- **演示要点**：演示 platform_type 的参数：spatial_domain, icon, side, add

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, side, add, sensor, 平台类型
- **出处**：`coverage_demos/platforms/sat1.txt:14-25`　（同签名共 2 处，另见 `coverage_demos/platforms/sat2.txt:13`）
- **片段**：

```text
platform_type SAT WSF_PLATFORM
   icon satellite
   side blue
   
   add mover WSF_SPACE_MOVER
      epoch_date_time jun 07 2020 00:00:00.00
   end_mover  
   
   sensor sat_geosensor SAT_GEOSENSOR
      on
   end_sensor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, add, sensor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, side, mover, sensor, 平台类型
- **出处**：`coverage_demos/platforms/uav.txt:13-24`
- **片段**：

```text
platform_type UAV WSF_PLATFORM 
   icon reaper
   side blue

   mover WSF_AIR_MOVER
   end_mover

   sensor uav_sensor UAV_SENSOR  
      on
   end_sensor
   
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, mover, sensor

### platform_type（pm6_brawler_maneuver_comparison）｜平台类型

- **关键词**：platform_type, update_interval, side, heading, route, 平台类型
- **出处**：`six_dof_with_brawler/pm6_brawler_maneuver_comparison.txt:30-41`
- **片段**：

```text
platform_type MANEUVER_TEST_PM6 BLUE_FIGHTER_PM6
   update_interval 0.01 sec 
   side light_blue
   heading 90 deg
   
   route
      position 00:05:00.00n  01:10:00.00w  altitude 30000 ft msl speed 900 ft/s
      position 00:00:36.035n 01:47:21.156e altitude 30000 ft msl speed 900 ft/s
      position 00:00:36.035n 01:57:21.156e altitude 30000 ft msl speed 900 ft/s
   end_route
   
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：update_interval, side, heading, route

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, mover, sensor, processor, 平台类型
- **出处**：`chaff/chaff_example.txt:178-190`　（同签名共 30 处，另见 `electronic_warfare/agile_auto-repeater_jamming.txt:275`、`electronic_warfare/agile_repeater_jamming-rt1.txt:392`、`electronic_warfare/agile_repeater_jamming-rt2.txt:392`）
- **片段**：

```text
platform_type EW_RADAR_SITE WSF_PLATFORM
   icon Ground_Radar

   mover WSF_GROUND_MOVER end_mover

   sensor ew_radar EW_RADAR
      processor track_manager
      ignore_same_side
   end_sensor

   processor track_manager WSF_TRACK_PROCESSOR
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, mover, sensor, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, side, comm, sensor, processor, 平台类型
- **出处**：`space_operations/cloud_attenuation.txt:112-124`　（同签名共 2 处，另见 `space_operations/cloud_attenuation.txt:128`）
- **片段**：

```text
platform_type SSN_RADAR WSF_PLATFORM
   side blue

   comm comm WSF_COMM_TRANSCEIVER
   end_comm

   sensor radar RADAR
   end_sensor

   processor report WSF_LINKED_PROCESSOR
      report_to commander via comm
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：side, comm, sensor, processor

### platform_type（acq_radar）｜平台类型

- **关键词**：platform_type, icon, category, sensor, aux_data, 平台类型
- **出处**：`cyber/exfiltrate_demo/platforms/acq_radar.txt:17-30`　（同签名共 6 处，另见 `cyber/exfiltrate_demo/platforms/ew_radar.txt:17`、`electronic_warfare/test_false_targets/platforms/ew_radar.txt:17`、`iads/platforms/acq_radar.txt:17`）
- **片段**：

```text
platform_type ACQ_RADAR RED_RADAR
  icon Ground_Radar
  category ACQUISITION

  sensor acq_radar ACQ_RADAR
     off
     internal_link data_mgr
     ignore_same_side
  end_sensor

  aux_data
     double max_range = 92600 # meters = 50 nm
  end_aux_data
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：icon, category, sensor, aux_data

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, radar_signature, comm, processor, 平台类型
- **出处**：`electronic_warfare/jam_strobe_tracking.txt:221-234`　（同签名共 2 处，另见 `electronic_warfare/jam_strobe_direction_finder.txt:207`）
- **片段**：

```text
platform_type COMMAND_CENTER WSF_PLATFORM
  icon C4I

  radar_signature GROUND_SITE_RADAR_SIGNATURE

  comm sub_net RED_DATALINK
     network_name <local:master>
     internal_link track_processor
  end_comm

  processor track_processor WSF_TRACK_PROCESSOR
     purge_interval 30 sec
  end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, radar_signature, comm, processor

### platform_type（platforms）｜平台类型

- **关键词**：platform_type, command_chain, comm, processor, weapon, 平台类型
- **出处**：`l16_j11/platforms.txt:72-87`
- **片段**：

```text
platform_type WEAPON_FIGHTER FIGHTER

   command_chain NETWORK_ENABLED_WEAPON SELF

   comm j11_comm J11_COMM
      internal_link l16_computer
   end_comm

   processor l16_computer FIGHTER_LINK16_COMPUTER
      comm j11_comm
   end_processor

   weapon network_enabled_weapon NE_SR_A2A_IR
   end_weapon

end_platform_type
```

- **演示要点**：演示 platform_type 的参数：command_chain, comm, processor, weapon

### platform_type（full_laydown）｜平台类型

- **关键词**：platform_type, side, icon, indestructible, edit, 平台类型
- **出处**：`timeline_lead/scenarios/full_laydown.txt:43-58`
- **片段**：

```text
platform_type    BLUE_STRIKER       STRIKER
  side blue
  icon F-18
  indestructible
   edit weapon  mrm
      quantity 24
   end_weapon

#  edit processor task_mgr
#     edit behavior engage_weapon_task_target
#        script_variables
#           DefaultPercentRangeMax = 0.85;
#        end_script_variables
#     end_behavior
#  end_processor
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：side, icon, indestructible, edit

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, comm, sensor, processor, 平台类型
- **出处**：`electronic_warfare/jam_strobe_direction_finder.txt:89-105`
- **片段**：

```text
platform_type EW_RADAR WSF_PLATFORM
   icon ground_radar

   comm datalink RED_DATALINK
      network_name <local:slave>
   end_comm

   sensor radar EW_RADAR
      internal_link data_manager
      ignore_same_side
   end_sensor

   processor data_manager WSF_TRACK_PROCESSOR
      report_to commander via datalink
      raw_track_reporting on
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, comm, sensor, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, radar_signature, weapon, sensor, 平台类型
- **出处**：`sensor_plot/radar/hm-repeater-effect.txt:82-98`
- **片段**：

```text
platform_type TARGET_PLATFORM_TYPE WSF_PLATFORM
   icon EA-6B
   radar_signature TARGET_RADAR_SIGNATURE

   weapon jammer JAMMER
      pitch   -10 deg                  // Aim jammer slightly toward the ground
      on
      #debug
   end_weapon
/*
   sensor esm ESM_SENSOR
      on
      internal_link jammer
      ignore_same_side
   end_sensor
*/
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, radar_signature, weapon, sensor

### platform_type（lte_fighter）｜平台类型

- **关键词**：platform_type, icon, radar_signature, mover, fuel, 平台类型
- **出处**：`six_dof_with_brawler/platforms/lte_fighter.txt:26-42`
- **片段**：

```text
platform_type  LTE_FIGHTER  BRAWLER_TEST
   icon f15c
   
   radar_signature 10dB_FuzzBall
#script_variables 
#      no_tree = true;
#end_script_variables
   mover WSF_BRAWLER_MOVER
      aero_file platforms/fxw/lte_fighter.fxw
      update_time_tolerance 0.01 s
   end_mover

   fuel WSF_BRAWLER_FUEL
      aero_file platforms/fxw/lte_fighter.fxw
      initial_quantity_ratio 1.0
   end_fuel
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：icon, radar_signature, mover, fuel

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, side, icon, category, add, 平台类型
- **出处**：`comm/platforms/black_van.txt:11-28`
- **片段**：

```text
platform_type BLACK_VAN WSF_PLATFORM
   side black
   icon semi
   category ad_hoc
   add processor bogey_book WSF_TRACK_PROCESSOR
      on_message
         type WSF_TRACK_MESSAGE
            script
               writeln(PLATFORM.Name(), " RECEIVES TRACK AT TIME: ", TIME_NOW);
            end_script
      end_on_message
   end_processor
   
   add comm van_comm WSF_COMM_TRANSCEIVER
      network_name van_net
      internal_link bogey_book
   end_comm
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：side, icon, category, add

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, spatial_domain, side, icon, processor, 平台类型
- **出处**：`six_dof/platforms/ubu-500-hd.txt:54-71`
- **片段**：

```text
platform_type  UBU-500-HD  WSF_PLATFORM

   spatial_domain  air
   side            green
   icon            mk82_hd_ballute

   processor fuse WSF_WEAPON_FUSE
      on
      gross_update_interval        0.02 sec
      fine_update_interval         0.01 sec
      time_of_flight_to_arm        0.5 sec
      gross_proximity_range      500.00 ft
      maximum_time_of_flight    3600.00 sec
      detonate_below_height_agl   40.00 ft
      detonate_below_height_msl   50.00 ft
   end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：spatial_domain, side, icon, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, spatial_domain, side, category, mover, 平台类型
- **出处**：`air_to_air/six_dof_types/aircraft/LTE_FIGHTER/LTE_FIGHTER.txt:45-64`　（同签名共 2 处，另见 `six_dof_with_brawler/six_dof_types/aircraft/LTE_FIGHTER/LTE_FIGHTER.txt:45`）
- **片段**：

```text
platform_type  LTE_FIGHTER_PM6  WSF_PLATFORM

   spatial_domain   air
   side             green
   category         aircraft

   mover WSF_POINT_MASS_SIX_DOF_MOVER
      vehicle_type                LTE_FIGHTER_PM6
      update_interval             0.05 sec

      event_core_data             30 Hz
      event_kinematic_data        30 Hz
      event_engine_fuel_data      10 Hz
      event_autopilot_data        10 Hz
      event_autopilot_limits_data  1 Hz
      event_control_inputs_data   20 Hz
      event_force_moment_data     20 Hz
   end_mover

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：spatial_domain, side, category, mover

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, radar_signature, mover, processor, 平台类型
- **出处**：`alternate_locations/weapons/agm/blue_glide_bomb_1.txt:26-47`　（同签名共 8 处，另见 `alternate_locations/weapons/agm/blue_gps_bomb_1.txt:43`、`cyber/weapons/agm/blue_gps_bomb_1.txt:27`、`wargame/weapons/agm/agm.txt:26`）
- **片段**：

```text
platform_type BLUE_GLIDE_BOMB_1_PT WSF_PLATFORM 
   icon jdam
   radar_signature BLUE_GLIDE_BOMB_1_RADAR_SIGNATURE
   
   mover WSF_GUIDED_MOVER 
      aero BLUE_GLIDE_BOMB_1_AERO
      total_mass 250 lbm
      update_interval .5 s
   end_mover
   
   processor guidance_computer WSF_GUIDANCE_COMPUTER 
      proportional_navigation_gain 10
      velocity_pursuit_gain        10
      g_bias                       1
      maximum_commanded_g          25 g
      guidance_delay               0 sec
   end_processor
   
   processor fuse WSF_GROUND_TARGET_FUSE 
      maximum_time_of_flight       900 s
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, radar_signature, mover, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, spatial_domain, side, icon, execute, 平台类型
- **出处**：`six_dof/platforms/orbiter-main.txt:76-99`
- **片段**：

```text
platform_type  ORBITER-MAIN  WSF_PLATFORM

   spatial_domain  space                              # This vehicle operates in the space domain
   side            green                              # Neutral force color
   icon            space_shuttle
   
   execute at_time 0.01 sec relative
      WsfSixDOF_Mover mover = (WsfSixDOF_Mover) Mover();
      mover.SetAutopilotRollAngle(180.0);
   end_execute
   execute at_time 10 sec relative
      WsfSixDOF_Mover mover = (WsfSixDOF_Mover) Mover();
      mover.SetAutopilotDeltaPitch(80.0);
      mover.SetAutopilotSpeedMach(15.0);
   end_execute
   execute at_time 200 sec relative
      WsfSixDOF_Mover mover = (WsfSixDOF_Mover) Mover();
      mover.SetAutopilotRollAngle(0.0);
   end_execute
   execute at_time 220 sec relative
      TurnProcessorOn("orbit-maintenance");
   end_execute

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：spatial_domain, side, icon, execute

### platform_type（blue_strikers）｜平台类型

- **关键词**：platform_type, side, category, debug, processor, 平台类型
- **出处**：`simple_scenario/platforms/blue_strikers.txt:14-38`
- **片段**：

```text
platform_type BLUE_STRIKER BLUE_ADV_FIGHTER_1_BASE

   side blue
   category fighter

   debug

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


end_platform_type
```

- **演示要点**：演示 platform_type 的参数：side, category, debug, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, side, visual_part, processor, 平台类型
- **出处**：`visual_part/red_tank.txt:13-37`
- **片段**：

```text
platform_type red_tank_type WSF_PLATFORM
   icon demo_tank
   side red

   visual_part turret WSF_VISUAL_PART
   end_visual_part

   visual_part gun WSF_VISUAL_PART
   end_visual_part

   processor part_updater WSF_SCRIPT_PROCESSOR
      update_interval 1 sec
      on_update
         WsfPlatform blue_flyer = WsfSimulation.FindPlatform("blue_flyer");
         // find the target platform
         if (blue_flyer.IsValid())
         {
            double az = PLATFORM.RelativeAzimuthOf(blue_flyer.Location());
            double el = PLATFORM.RelativeElevationOf(blue_flyer.Location());
            PLATFORM.VisualPart("turret").SetYaw(az);
            PLATFORM.VisualPart("gun").SetPitch(el);
         }
      end_on_update
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, visual_part, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, mover, comm, sensor, processor, 平台类型
- **出处**：`script_demos/script_demo_5.txt:300-325`　（同签名共 2 处，另见 `electronic_warfare/comm_jamming.txt:104`）
- **片段**：

```text
platform_type AWACS WSF_PLATFORM
   mover WSF_AIR_MOVER
     maximum_radial_acceleration .5 g
     maximum_linear_acceleration .5 g
   end_mover
   comm rcvr-1 WSF_RADIO_RCVR
      frequency 1200 mhz
   end_comm
   comm xmtr-1 WSF_RADIO_XMTR
      frequency 1200 mhz
   end_comm
   // The 'perfect' ESM device.  It can perfectly locate any transmitter in L-band
   sensor esm-1 WSF_ESM_SENSOR
      on
      frame_time 5 sec
      frequency_band 1000 mhz 2000 mhz    // L-band
      reports_location
      reports_frequency
      processor track-proc
      ignore no_awacs_esm
   end_sensor
   processor track-proc WSF_TRACK_PROCESSOR
      update_interval 2 sec
      report_to command_chain GOOD_GUYS subordinates via xmtr-1 to rcvr-1
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：mover, comm, sensor, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, side, category, icon, script, 平台类型
- **出处**：`fires/types/fires_base_types.txt:9-34`
- **片段**：

```text
platform_type FIRES_LAUNCHER WSF_PLATFORM
   side red
   category HEL_IGNORE
   icon mil_SS-Launcher-LR

   script bool WARLOCK_FireAtLocation(WsfGeoPoint aLocation, int aQuantity)
      WsfTrack targetLoc = WsfTrack();
      targetLoc.SetLocation(aLocation);
      targetLoc.Initialize();

      // We assume we are firing the first weapon in the list.
      return PLATFORM.WeaponEntry(0).FireSalvo(targetLoc, aQuantity);
   end_script
  
#  #For testing purposes
#   track
#      platform scenario_center
#   end_track
#    execute at_time 1 s absolute
#       WsfTrack myTrack = PLATFORM.MasterTrackList().Entry(0);
#       PLATFORM.WeaponEntry(0).FireSalvo(myTrack, 1);
#    end_execute

   //include ../scripts/move.txt

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：side, category, icon, script

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, spatial_domain, mover, edit, on_update, 平台类型
- **出处**：`p6dof/range_endurance_test.txt:80-106`
- **片段**：

```text
platform_type TEST_PLATFORM WSF_PLATFORM
   spatial_domain air
   mover WSF_P6DOF_MOVER
      p6dof_object_type $<MOVER_TYPE:FA-LGT>$
   end_mover

   edit mover
      engines_on true
   end_mover

   on_update
      if(mData.Exists(Index()))
      {
         if(GetTotalFuelRemaining_lbs(PLATFORM) < bingoFuelQuantity_lbs)
         {
            DataStruct value = mData.Get(Index());
            value.flightTime_sec = TIME_NOW;
            value.flightRange_km = GetRangeSinceStart_km(PLATFORM);

            # Run has completed, therefore remove the platform, so that the
            # simulation will complete quicker
            DeletePlatform();
         }
      }
   end_on_update

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：spatial_domain, mover, edit, on_update

### platform_type（launch_with_telemetry）｜平台类型

- **关键词**：platform_type, script_variables, include, comm, execute, 平台类型
- **出处**：`space_operations/scenarios/launch_with_telemetry.txt:21-47`
- **片段**：

```text
platform_type DELTA_IV_M_MOD DELTA_IV_M
   script_variables  # Identify the satellite stage number and platform_type to 'launch_payload.txt'
      int mPayloadStage = 4;
      string mPayloadType = "SATELLITE";
   end_script_variables

   include scripts/launch_payload.txt

   comm LV_comm WSF_COMM_TRANSCEIVER
      add protocol localMulticast LAUNCH_MULTICAST
      end_protocol
   end_comm

   # Launch vehicle makes track of itself and sends back to launch facility to model
   # transmission of telemetry data
   execute at_interval_of 5 s
      WsfTrack LV_track = PLATFORM.MakeTrack();
      WsfTrackMessage lv_trk_msg = WsfTrackMessage();
      lv_trk_msg.SetTrack(LV_track);
#      WsfGroup group = WsfGroup.Group("telemetry");
      WsfAddress telemetry = {};
      telemetry.SetAddress("230.1.1.1", 32);
      PLATFORM.Comm("LV_comm").SendMessage(lv_trk_msg, telemetry);
      PLATFORM.Comment("Sending telemetry back to launch facility.");
   end_execute

end_platform_type
```

- **演示要点**：演示 platform_type 的参数：script_variables, include, comm, execute

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, side, sensor, processor, weapon, 平台类型
- **出处**：`p6dof/missile_comparison.txt:244-272`　（同签名共 3 处，另见 `six_dof/pm6_missile_comparison.txt:391`、`six_dof/rb6_missile_comparison.txt:391`）
- **片段**：

```text
platform_type SAM_LAUNCHER WSF_PLATFORM

   side red
   
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

   processor data_mgr WSF_TRACK_PROCESSOR
      purge_interval  8 sec
   end_processor

   weapon sam-mr SAM-MR_WEAPON
      pitch 60 deg
      quantity 1
   end_weapon
   
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：side, sensor, processor, weapon

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, side, icon, sensor, processor, 平台类型
- **出处**：`satellite_demos/5th_iridium_flares_demo.txt:285-313`
- **片段**：

```text
platform_type CENTER WSF_PLATFORM
   side white
   icon wedge

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

   processor dummy WSF_SCRIPT_PROCESSOR
   end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：side, icon, sensor, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, script_variables, execute, mover, 平台类型
- **出处**：`hellfire/active_radar_hellfire/target_type.txt:10-41`　（同签名共 4 处，另见 `hellfire/laser_designation_via_dis/target_type.txt:10`、`hellfire/semiactive_laser_hellfire/target_type.txt:10`、`electronic_warfare/false-target_command_center.txt:231`）
- **片段**：

```text
platform_type TARGET WSF_PLATFORM

   icon pickup_truck
   #spatial_domain land  # "land" is the default for this platform.

   script_variables
      bool mobilityAnnounced = false;
   end_script_variables

   execute at_interval_of 1 s
      # We cannot announce a firepower kill, as this platform has no weapons.
      # We cannot announce a Catastrophic kill as this removes the platform from the simulation.
      //if (! mobilityAnnounced && PLATFORM.Mover().GetDamageFactor() == 1.0)
      //{
      //   PLATFORM.Comment("Target suffered a Mobility Kill.");
      //   writeln("*** Target suffered a Mobility Kill. ***");
      //   mobilityAnnounced = true;
      //}
   end_execute

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

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, script_variables, execute, mover

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, comm, group_join, sensor, processor, 平台类型
- **出处**：`space_operations/platforms/intercept_radar.txt:12-45`
- **片段**：

```text
platform_type     INTERCEPT_RADAR           WSF_PLATFORM
   comm radar_comm WSF_COMM_TRANSCEIVER
      internal_link message_proc
   end_comm

   # Group of radars receiving intercepted messages from the interceptor ship
   group_join blueTrack

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

   processor message_proc WSF_SCRIPT_PROCESSOR
      on_message
         script
            WsfTrackMessage trk_msg = (WsfTrackMessage)MESSAGE;
#            writeln("Track message received from ", trk_msg.Originator());
            WsfTrack lv_trk = trk_msg.Track();
            PLATFORM.Sensor("radar").CueToTrack(lv_trk);
            if (PLATFORM.Sensor("radar").ActiveTrackCount() > 0)
            {
               PLATFORM.Comment("Message received. Tracking launch vehicle.");
            }
         end_script
      end_on_message
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：comm, group_join, sensor, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, mover, fuel, processor, 平台类型
- **出处**：`base_types/platforms/bomber.txt:13-58`
- **片段**：

```text
platform_type BOMBER WSF_PLATFORM

#  icon EA-6B
   icon B-52

   mover WSF_AIR_MOVER

      # WAGs - Luke Miklos
      roll_rate_limit               0.7 rad/sec
      default_linear_acceleration   0.7 g
      default_radial_acceleration   2.5 g
      default_climb_rate            300 fps

      # Mach 0.9 (516.0 kts) at altitude, Janes Reference
      maximum_speed                 516.0 knots

      # Ceiling, Janes Reference
      maximum_altitude              55000 ft
      minimum_altitude              1000 ft

      # WAG - Luke Miklos
      maximum_linear_acceleration   7 g

      #no_pitch
      at_end_of_path extrapolate

   end_mover

   fuel WSF_VARIABLE_RATE_FUEL
      #rough calculation for fuel rate: based on max range, cruising speed, & max fuel
      rate 4.0 lb/s
      # Janes Reference, max fuel
      # 46000 gallons internal, plus two 700 gallon underwing drop tanks
      # jet fuel is 6 lb per gallon
      initial_quantity 284400 lb
      maximum_quantity 284400 lb
   end_fuel


   processor track_manager WSF_TRACK_PROCESSOR
      //debug
      purge_interval  60 sec
      update_interval 2 sec
   end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, mover, fuel, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, script, mover, processor, 平台类型
- **出处**：`tbm_demos/weapons/ssm/tbm2.txt:12-62`　（同签名共 2 处，另见 `tbm_demos/weapons/ssm/tbm3.txt:9`）
- **片段**：

```text
platform_type TBM2 WSF_PLATFORM
   icon Scud_Missile

   // The following 3 scripts are totally optional and will be invoked by the
   // TBM mover if they are defined. You can put pretty much whatever they want
   // in here. The single argument to each is the stage number [1..n].
   //
   // For instance, you could alter the signature state of the vehicle to
   // reflect the conditions (assuming, of course, that you define multiple
   // signatures for your platform!).

   script void on_stage_ignition(int aStage)
      writeln("T=", TIME_NOW, " ", PLATFORM.Name(), ": Stage ", aStage, " ignition");
   end_script

   script void on_stage_burnout(int aStage)
      writeln("T=", TIME_NOW, " ", PLATFORM.Name(), ": Stage ", aStage, " burnout");
   end_script

   script void on_stage_separation(int aStage)
      writeln("T=", TIME_NOW, " ", PLATFORM.Name(), ": Stage ", aStage, " separation");
   end_script

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

   # The fuse will detonate just before it hits the ground
   processor fuse WSF_GROUND_TARGET_FUSE
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, script, mover, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, mover, sensor, execute, processor, 平台类型
- **出处**：`example_scripts/output_file_demo.txt:40-92`
- **片段**：

```text
platform_type FIGHTER_SENSOR WSF_PLATFORM
   mover WSF_AIR_MOVER  end_mover
   # Can add field of view
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

   execute at_time 1 s absolute
      WsfPlatform platform = WsfSimulation.FindPlatform("f4_phantom");
      WsfTrack targetTrack = platform.MakeTrack();
      PLATFORM.Sensor("eoir").CueToTrack(targetTrack);
   end_execute

   # Processes images to determine number of pixels in each image and then adds the
   # results to a txt file with the first column as the distance from the target
   # and the second column as the pixel count. This file can then be used by plotting
   # software such as excel to analyze the data.
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


end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：mover, sensor, execute, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, side, spatial_domain, mover, fuel, 平台类型
- **出处**：`example_scripts/fuel_table_demo.txt:14-70`
- **片段**：

```text
platform_type FUEL_TEST_TYPE WSF_PLATFORM
   side blue
   spatial_domain air

   mover WSF_AIR_MOVER
   end_mover

   fuel WSF_TABULAR_RATE_FUEL
      maximum_quantity 7000 lb
      initial_quantity 6750 lb
      reserve_quantity 1500 lb
      mode MACH_MODE # Sets the mode in the Fuel Object

      fuel_table
         mode CONSTANT_MODE
         constant 4.0 kg/s
      end_fuel_table

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

   end_fuel
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：side, spatial_domain, mover, fuel

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, side, icon, mover, processor, 平台类型
- **出处**：`example_scripts/proc_mover_demo.txt:20-76`
- **片段**：

```text
platform_type     MY_STRIKER           WSF_PLATFORM
   side blue
   icon F-18
   #note: speed used is a processor script variable!
   #wish I could do without the mover at all, but then I cant attach a route to the platform
   #if you can define the route globally & just refer to it by name from the script, then get rid of the mover
   mover WSF_AIR_MOVER
      maximum_speed     0.000000001 knots
      minimum_speed     0 knots
      maximum_altitude  50000 ft
      minimum_altitude  0 ft
      at_end_of_path    stop
  end_mover

  processor i_like_to_move_it_move_it WSF_SCRIPT_PROCESSOR
     update_interval 0.1 sec   #dunno what is necessary, this is rather frequent
     script_variables
        int routeIndex = 0;
        double speedMPS = 200.0;   #TODO - use speed from route points???
                                   #TODO - adjust heading & pitch based on current route leg???
     end_script_variables
     on_update
        WsfRoute rowt = PLATFORM.Route();
        if (!rowt.IsValid()) {
           return;
        }
        if (routeIndex >= rowt.Size()) {
           return;
        }
        double delta = PROCESSOR.UpdateInterval();
        double myDist = delta * speedMPS;
        WsfGeoPoint a = PLATFORM.Location();
        WsfGeoPoint b = rowt.Get(routeIndex).Location();
        double dist = a.SlantRangeTo(b);
        Vec3 direction = Vec3.Subtract(b.LocationWCS(),a.LocationWCS());
        if (myDist >= dist) {
           #we reach the waypoint this update, start along next leg too
           routeIndex += 1;
           if (routeIndex >= rowt.Size()) {
              PLATFORM.SetLocation(b);
              return;
           }
           a = b;
           b = rowt.Get(routeIndex).Location();
           myDist -= dist;
        }
#        else {
#           #sanity check: both slant range & vector magnitude should be about equal
#           writeln("slant range = ", dist, ", vec magnitude = ", direction.Magnitude());
#        }
        direction.Normalize();
        direction.Scale(myDist);
        a.OffsetWCS(direction);
        PLATFORM.SetLocation(a);
     end_on_update
  end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：side, icon, mover, processor

### platform_type（blue_lr_sam_complex）｜平台类型

- **关键词**：platform_type, comm, sensor, processor, edit, 平台类型
- **出处**：`base_types/weapons/sam/blue_lr_sam_complex.txt:32-93`　（同签名共 2 处，另见 `base_types/weapons/sam/blue_sr_sam_complex.txt:45`）
- **片段**：

```text
platform_type BLUE_LR_SAM BLUE_LR_SAM_BASE

   comm datalink WSF_COMM_TRANSCEIVER
      internal_link data_mgr
   end_comm

   # The seeker is modeled very simplisticly. There is no performance data.
   # This is really just a method to model seeker errors.

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

   processor data_mgr WSF_WEAPON_TRACK_PROCESSOR
   end_processor

   # Modify the guidance processor such that when it enters TERMINAL phase
   # that it turns on the sensor and starts tracking the target. During this
   # phase we guide to perception to allow the introduction of errors.

   edit processor guidance
      edit phase TERMINAL
         guide_to_truth false

         on_entry
            WsfSensor seeker = PLATFORM.Sensor("seeker");
            WsfTrack targetTrack = PLATFORM.CurrentTargetTrack();
            if (seeker.IsValid() &&
                targetTrack.IsValid())
            {
               seeker.TurnOn();
               seeker.StartTracking(targetTrack, "");
            }
         end_on_entry
      end_phase
   end_processor

end_platform_type
```

- **演示要点**：演示 platform_type 的参数：comm, sensor, processor, edit

### platform_type（red_fighter_1_ripr）｜平台类型

- **关键词**：platform_type, delete, weapon, processor, sensor, 平台类型
- **出处**：`base_types/platforms/red_fighter_1_ripr.txt:19-82`　（同签名共 2 处，另见 `base_types/platforms/red_multirole_fighter_2_ripr.txt:24`）
- **片段**：

```text
platform_type RED_FIGHTER_1 RED_FIGHTER_1_BASE

  //use a different missile for this type
  //adjust missile ranges in int-thinker below to accomodate
  delete weapon int_missile
  weapon int_missile RED_MR_A2A_RF_MISSILE end_weapon

   //This is the code that lets the interceptor intercept
   processor int-thinker AIAI-thinker
      script_variables
         mWeaponArray[0] = Map<string, Object>();
         mWeaponArray[0].Set("name", "int_missile");
         mWeaponArray[0].Set("weapon", PLATFORM.Weapon("int_missile"));
         mWeaponArray[0].Set("rangeMin", 5556);
         mWeaponArray[0].Set("rangeMax", 83340);
         mWeaponArray[0].Set("numActiveMax", 2); // how many weapons of this type can be in play simultaneously
      end_script_variables
   end_processor

   sensor geo_sensor WSF_GEOMETRIC_SENSOR
      //azimuth_field_of_view -180.0 degrees 180.0 degrees
      //elevation_field_of_view -90.0 degrees 90.0 degrees
      azimuth_field_of_view -60.0 degrees 60.0 degrees
      elevation_field_of_view -30.0 degrees 30.0 degrees
      minimum_range 0 m
#      maximum_range 100000 m
      maximum_range 63000 m
      on
      frame_time              0.5 sec
      reports_location
      reports_velocity
      reports_iff
      track_quality 1.0
      ignore_same_side
      internal_link track_manager
   end_sensor

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

end_platform_type
```

- **演示要点**：演示 platform_type 的参数：delete, weapon, processor, sensor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, sensor, comm, on, 平台类型
- **出处**：`satellite_demos/platforms/galileo_gs.txt:14-77`
- **片段**：

```text
platform_type GALILEO_GS WSF_PLATFORM
   icon C4I

   sensor detect WSF_GEOMETRIC_SENSOR
      on
      reports_location
      frame_time 1 min
      azimuth_field_of_view -180 deg 180 deg
      elevation_field_of_view -90 deg 90 deg
   end_sensor

  comm GROUNDSTATION_GALILEO_UPLINKE1_TX GROUNDSTATION_GALILEO_UPLINKE1_TX
   on
  end_comm

  comm GROUNDSTATION_GALILEO_UPLINKE5_TX GROUNDSTATION_GALILEO_UPLINKE5_TX
   on
  end_comm

  comm GROUNDSTATION_GALILEO_UPLINKE6_TX GROUNDSTATION_GALILEO_UPLINKE6_TX
   on
  end_comm

  comm GROUNDSTATION_GALILEO_DOWNLINKE1_RX GROUNDSTATION_GALILEO_DOWNLINKE1_RX
   on
  end_comm

  comm GROUNDSTATION_GALILEO_DOWNLINKE5_RX GROUNDSTATION_GALILEO_DOWNLINKE5_RX
   on
  end_comm

  comm GROUNDSTATION_GALILEO_DOWNLINKE6_RX GROUNDSTATION_GALILEO_DOWNLINKE6_RX
   on
  end_comm

#========================Uncomment to send a test message to satellites==============================================================
#execute at_interval_of 1 s
#      // Loop through all the platforms in the simulation
#      for (int i = 1; i <= WsfSimulation.PlatformCount(); i = i + 1)
#          {
#          WsfPlatform myPlatform = WsfSimulation.FindPlatform(i);
#              if ((myPlatform != PLATFORM) && myPlatform.IsValid())   # Make sure we are not trying to talk to ourselves!
#              {
#              WsfControlMessage myMessage = WsfControlMessage();
#              myMessage.SetFunction("This is a Test");
#
#                  if (myPlatform.Type() == "GALILEO")
#                  {
#                  PLATFORM.Comm("GROUNDSTATION_GALILEO_UPLINKE1_TX").SendUnicastMessage(myMessage, myPlatform);
#                  }
##                  if (myPlatform.Type() == "GALILEO")
##                  {
##                  PLATFORM.Comm("GROUNDSTATION_GALILEO_UPLINKE5_TX").SendUnicastMessage(myMessage, myPlatform);
##                  }
##                  if (myPlatform.Type() == "GALILEO")
##                  {
##                  PLATFORM.Comm("GROUNDSTATION_GALILEO_UPLINKE6_TX").SendUnicastMessage(myMessage, myPlatform);
##                  }
#              }
#          }
# end_execute
#=======================================================================================================================================

 end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, sensor, comm, on

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, comm, processor, track_manager, 平台类型
- **出处**：`brawler/platforms/brawler_flight_lead.txt:10-80`
- **片段**：

```text
platform_type   BRAWLER_FLIGHT_LEAD    WSF_PLATFORM

   icon ea-6b

   comm datalink WSF_COMM_TRANSCEIVER
      propagation_speed 0 m/s   #instantaneous propogation (faster than speed of light)
      network_name brawler_net
      internal_link data_mgr
      internal_link task_mgr
      internal_link perception
   end_comm

   processor data_mgr WSF_TRACK_PROCESSOR
      master_track_processor
   end_processor

   track_manager
#      retain_raw_tracks
#      retain_track_history
#      uncorrelated_track_drops disable
   end_track_manager

   processor perception WSF_PERCEPTION_PROCESSOR
      asset_perception status_messages
   end_processor

   processor task_mgr WSF_QUANTUM_TASKER_PROCESSOR
      script_variables
         ## for evaluating weapon tasks
         Map<string,int> mKnownTargetTypes = Map<string,int>();
         mKnownTargetTypes["BRAWLER_PLATFORM"] = 1;
      end_script_variables

      script Array<WsfQuantumTask> FlightLeadTaskGeneration(Array<WsfLocalTrack> aTracks, Array<WsfAssetPerception> aAssets)
         Array<WsfQuantumTask> tasks = Array<WsfQuantumTask>();
         //if its us, then create weapon tasks for enemy tracks
         writeln_d("TRACKS.Size() = ", aTracks.Size(), ", ASSETS.Size() = ", aAssets.Size());
         for (int i=0; i<aTracks.Size(); i=i+1)
         {
            WsfLocalTrack lt = aTracks.Get(i);
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
     #update_interval 0.3 sec
      update_interval 1.0 sec
   end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, comm, processor, track_manager

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, processor, category, sensor, comm, 平台类型
- **出处**：`space_operations/platforms/commander.txt:10-82`
- **片段**：

```text
platform_type COMMANDER WSF_PLATFORM

   processor image_proc IMAGE_PROC
      on_message
         default
         script
            #writeln("COMMANDER GOT A MESSAGE");
         end_script
      end_on_message

      internal_link track_mgr
   end_processor

   category commander

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

  comm commander WSF_COMM_RCVR
     network_name commander1
     internal_link image_proc
  end_comm

  processor iridium_mgr WSF_TRACK_PROCESSOR
     on_message
        type WSF_TRACK_DROP_MESSAGE
            script
               WsfTrackDropMessage dropMessage = (WsfTrackDropMessage)MESSAGE;
               string name = WsfSimulation.FindPlatform(dropMessage.TargetIndex()).Name();
#               writeln(PLATFORM.Name() + " has dropped tracking: " + name + " at time " + (string)TIME_NOW);

               WsfComm otherComm = WsfSimulation.FindPlatform(name).CommEntry(0);
               WsfComm thisComm = PLATFORM.Comm("commander");
               if(otherComm.IsConnectedTo(thisComm.GetAddress()))
               {
                  otherComm.RemoveConnection(thisComm.GetAddress());
               }
            end_script
         type WSF_TRACK_MESSAGE
            script
               WsfTrackMessage trackMessage = (WsfTrackMessage)MESSAGE;
               string name = trackMessage.Track().Target().Name();
#               writeln(PLATFORM.Name() + " is now tracking: " + name + " at time " + (string)TIME_NOW);

               WsfComm otherComm = WsfSimulation.FindPlatform(name).CommEntry(0);
               WsfComm thisComm = PLATFORM.Comm("commander");
               if(!otherComm.IsConnectedTo(thisComm.GetAddress()))
               {
                  otherComm.AddConnection(thisComm.GetAddress());
               }
            end_script
     end_on_message
  end_processor

  processor track_mgr WSF_TRACK_PROCESSOR
     on_message
        default
        script
           #writeln("COMMANDER TRACK MANAGER GOT A TRACK");
        end_script
     end_on_message
  end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：processor, category, sensor, comm

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, radar_signature, mover, comm, 平台类型
- **出处**：`satellite_demos/platforms/satellite_based_navigation_system.txt:21-104`　（同签名共 6 处，另见 `satellite_demos/platforms/satellite_based_navigation_system.txt:106`、`satellite_demos/platforms/satellite_based_navigation_system.txt:191`、`satellite_demos/platforms/satellite_based_navigation_system.txt:276`）
- **片段**：

```text
platform_type EGNOS WSF_PLATFORM
  icon satellite
  radar_signature GPS_RADAR_SIG
#  mover WSF_NORAD_SPACE_MOVER
#  end_mover
   mover WSF_SPACE_MOVER
   end_mover

  comm GPS_DOWNLINKL1_TX GPS_DOWNLINKL1_TX
     location  394 0 1600 mm   # ref 1, location given for IIF Satellites
     on
  end_comm
  
  comm GPS_UPLINKL1_RX GPS_UPLINKL1_RX
     location  394 0 1600 mm   # ref 1, location given for IIF Satellites
     on
  end_comm
  
  comm GPS_DOWNLINKL2_TX GPS_DOWNLINKL2_TX
     location  394 0 1600 mm   # ref 1, location given for IIF Satellites
     on
  end_comm
  
  comm GPS_UPLINKL2_RX GPS_UPLINKL2_RX
     location  394 0 1600 mm   # ref 1, location given for IIF Satellites
     on
  end_comm
  
  comm GPS_DOWNLINKL3_TX GPS_DOWNLINKL3_TX
     location  394 0 1600 mm   # ref 1, location given for IIF Satellites
     on
  end_comm
  
  comm GPS_DOWNLINKL5_TX GPS_DOWNLINKL5_TX
     location  394 0 1600 mm   # ref 1, location given for IIF Satellites
     on
  end_comm
  
  comm GPS_UPLINKL5_RX GPS_UPLINKL5_RX
     location  394 0 1600 mm   # ref 1, location given for IIF Satellites
     on
  end_comm

#=====================Uncomment this to send a test message user handhelds=========================================
#execute at_interval_of 1 s
#      // Loop through all the platforms in the simulation
#      for (int i = 1; i <= WsfSimulation.PlatformCount(); i = i + 1)
#          {
#          WsfPlatform myPlatform = WsfSimulation.FindPlatform(i);
#          if ((myPlatform != PLATFORM) && myPlatform.IsValid())   # Make sure we are not trying to talk to ourselves!
#              {
#              WsfControlMessage myMessage = WsfControlMessage();
#              myMessage.SetFunction("This is a test");
#
#	              if (myPlatform.Type() == "GPS_HANDHELD")
#                 {
#                  PLATFORM.Comm("GPS_DOWNLINKL1_TX").SendUnicastMessage(myMessage, myPlatform);
#                 }
#              }
#          }
# end_execute
#====================================================================================================================

#====================Uncomment this to send a test message to GPS ground network===================================== 
# execute at_interval_of 1 s
#      // Loop through all the platforms in the simulation
#      for (int i = 1; i <= WsfSimulation.PlatformCount(); i = i + 1)
#          {
#          WsfPlatform myPlatform = WsfSimulation.FindPlatform(i);
#          if ((myPlatform != PLATFORM) && myPlatform.IsValid())   # Make sure we are not trying to talk to ourselves!
#              {
#              WsfControlMessage myMessage = WsfControlMessage();
#              myMessage.SetFunction("This is a test");
#
#                 if (myPlatform.Type() == "GPS_CONTROL")
#                 {
#                  PLATFORM.Comm("GPS_DOWNLINKL3_TX").SendUnicastMessage(myMessage, myPlatform);
#                 }
#              }
#          }
# end_execute
#=====================================================================================================================
 
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, radar_signature, mover, comm

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, weapon_effects, mover, processor, 平台类型
- **出处**：`new_guidance/weapons/agm/blue_asm_missile.txt:35-120`
- **片段**：

```text
platform_type BLUE_ASM_MISSILE WSF_PLATFORM
   icon CRUISE_MISSILE

   weapon_effects BLUE_ASM_MISSILE_LETHALITY

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

   processor fuse WSF_GROUND_TARGET_FUSE
   end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, weapon_effects, mover, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, comm, processor, script_variables, script, 平台类型
- **出处**：`timeline/platforms/flight_lead.txt:16-103`
- **片段**：

```text
platform_type FLIGHT_LEAD WSF_PLATFORM

  #side  blue / red

   comm sub_net FINITE_DATALINK
      network_name <local:master>
      internal_link data_mgr
      internal_link task_mgr
      internal_link perception
      internal_link timeline_data
   end_comm

   comm cmdr_net FINITE_DATALINK
      network_name <local:slave>
      internal_link data_mgr
      internal_link task_mgr
      internal_link perception
      internal_link timeline_data
   end_comm

   processor data_mgr WSF_TRACK_PROCESSOR
      purge_interval             30    seconds
      report_to commander        via   cmdr_net
      report_to subordinates     via   sub_net to cmdr_net
     #report_interval            4 sec
      report_interval            1 sec
      fused_track_reporting      on
      raw_track_reporting        off
      circular_report_rejection  true
   end_processor

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

   processor  task_mgr  FL_QUANTUM_TASKER
    #script_debug_writes on
    #show_task_messages
   end_processor

   script_variables
      # Tracks paired timeline tasks for grinder
      # assignments looking up other platform
      Map<int, int> mGrinderPairings = Map<int, int>();
   end_script_variables

   # return the corresponsding platform for the passed in
   # TaskId
   script WsfPlatform GrinderWingman (int aTraskId)
      WsfPlatform wingman;
      #writeln_d("T=", TIME_NOW, " doing platform lookup for task: ", aTraskId);
      if (mGrinderPairings.Exists(aTraskId))
      {
         int otherTaskId = mGrinderPairings.Get(aTraskId);
         #writeln_d("   other task: ", otherTaskId);
         WsfQuantumTaskerProcessor qt = (WsfQuantumTaskerProcessor)Processor("timeline_data");
         WsfTaskList tasks = qt.TasksAssignedOfType("TIMELINE");
         foreach (WsfTask t in tasks)
         {
            if (t.TaskId() == otherTaskId)
            {
               # Found corresponding timeline task
               wingman = t.Assignee();
               #writeln_d("   found corresponding task assigned to ", wingman.Name());
            }
         }
      }
      return wingman;
   end_script

   #processor timeline_data FLIGHT_LEAD_DATA
   #end_processor

   processor timeline_data FLIGHT_LEAD_FILTERED_TIMELINE
   end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：comm, processor, script_variables, script

### platform_type（six_dof_flight_envelope）｜平台类型

- **关键词**：platform_type, include, on_initialize, script, on_initialize2, 平台类型
- **出处**：`six_dof/six_dof_flight_envelope.txt:105-220`
- **片段**：

```text
platform_type TEST_PLATFORM_TYPE $<PLATFORM_TYPE:FA-LGT_RB6>$
   
   include scripts/six_dof_all_scripts.txt

   on_initialize
      EnableControls(PLATFORM, false);
      SetMasterNoLagTesting(PLATFORM, true);
      SetMasterFreezeAltitude(PLATFORM, false);
      SetMasterFreezePitch(PLATFORM, false);
      SetMasterFreezeRoll(PLATFORM, true);
      SetMasterFreezeYaw(PLATFORM, true);
      SetMasterFreezeFuelBurn(PLATFORM, false);
      SetMasterNoAlphaTesting(PLATFORM, true);
   end_on_initialize
   
   script void GenerateMilDotPlot()
      double throttleSetting = 1.0;
      double flapsSetting = 0.0;

      for( int alt = dotInitialAltitude_ft; alt <= dotFinalAltitude_ft; alt = alt + dotAltitudeStep_ft)
      {
         for( int vel = dotInitialVelocity_fps; vel <= dotFinalVelocity_fps; vel = vel + dotVelocityStep_fps)
         {
            struct temp = struct.New("DataPair");
            temp->altitude_ft = alt;
            temp->velocity_fps = vel;

            int canFly = CanFlyAt(PLATFORM, alt, vel, throttleSetting, flapsSetting);
            if(canFly == 0)
            {
               # writeln("Can NOT fly @ ", alt, " ft, ", vel, " fps");
               mCanNotFly.PushBack(temp);
            }
            else if(canFly == 1)
            {
               # writeln("Can fly with NO controls @ ", alt, " ft, ", vel, " fps");
               mCanFlyNoControl.PushBack(temp);
            }
            else if(canFly == 2)
            {
               # writeln("CAN fly @ ", alt, " ft, ", vel, " fps");
               mCanFly.PushBack(temp);
            }
            else
            {
               writeln("Error in CanFlyAt() return value");
            }    
         }
      }
      # writeln(".");
   end_script

   script void GenerateMilEnvelope()
      mMilEnvelope = ComputeFlightEnvelope(PLATFORM, 1.0, 0.0);
   end_script

   script void GenerateAB_Envelope()
      mAB_Envelope = ComputeFlightEnvelope(PLATFORM, 2.0, 0.0);
   end_script

   on_initialize2
      //Execute flight envelope test
      if(generateMilDotPlot)
      {
         writeln("Generating MIL Dot Plot");
         GenerateMilDotPlot();
      }
      if(generateMilEnvelope)
      {
         writeln("Generating MIL Flight Envelope");
         GenerateMilEnvelope();
      }
      if(generateAB_Envelope)
      {
         writeln("Generating AB Flight Envelope");
         GenerateAB_Envelope();
      }

      writeln("Writing out results");
      if(generateMilDotPlot)
      {
         WriteOutDotPlot(PLATFORM.Name());
      }
      if(generateMilEnvelope)
      {
         WriteOutMilEnvelope(PLATFORM.Name());
      }
      if(generateAB_Envelope)
      {
         WriteOutAB_Envelope(PLATFORM.Name());
      }
      writeln("Writing results complete");

      # ------------------------------------------------------------------------
      /*
      # Here we can launch excel to generate the plot, or launch a plot
	  # viewing utility to read the csv, to allow us to visualize the data.
	  
      if(generateMilDotPlot)
      {
         System.Command(write_str("start ./plot_viewer/plot_viewer.exe ", milDotFilename));
      }
      if(generateMilEnvelope)
      {
         System.Command(write_str("start ./plot_viewer/plot_viewer.exe ", milEnvelopeFilename));
      }
      if(generateAB_Envelope)
      {
         System.Command(write_str("start ./plot_viewer/plot_viewer.exe ", abEnvelopeFilename));
      }
      */
      # ------------------------------------------------------------------------

   end_on_initialize2

end_platform_type
```

- **演示要点**：演示 platform_type 的参数：include, on_initialize, script, on_initialize2

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, mover, sensor, processor, weapon, 平台类型
- **出处**：`draw/draw_demo.txt:16-149`
- **片段**：

```text
platform_type FIGHTER WSF_PLATFORM
   mover WSF_AIR_MOVER
     maximum_radial_acceleration 1.5 g # Makes for a smooth turn
     maximum_linear_acceleration 1.3 g
     roll_rate_limit 1 deg/s # smooth turn
   end_mover

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

   sensor eyeball GENERIC_EYEBALL
     on
     ignore weapon
     processor attack-proc
     modifier_category fighter-eyeball-modifier
   end_sensor

   processor track-proc WSF_TRACK_PROCESSOR
   end_processor

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

   weapon 1000_lb_bomb BOMB_1000_LB
   end_weapon
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：mover, sensor, processor, weapon

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, mover, acoustic_signature, 平台类型
- **出处**：`acoustic/acoustic_demo.txt:34-38`　（同签名共 6 处，另见 `acoustic/acoustic_demo2.txt:116`、`acoustic/acoustic_demo2.txt:122`、`acoustic/acoustic_demo2.txt:128`）
- **片段**：

```text
platform_type    ACOUSTIC_TARGET       WSF_PLATFORM
  icon c-130
  mover WSF_AIR_MOVER end_mover
  acoustic_signature ACOUSTIC_SIGNATURE
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, mover, acoustic_signature

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, sensor, acoustic_signature, 平台类型
- **出处**：`acoustic/acoustic_demo2.txt:179-183`　（同签名共 5 处，另见 `acoustic/acoustic_demo2.txt:190`、`acoustic/acoustic_demo2.txt:201`、`acoustic/acoustic_demo2.txt:212`）
- **片段**：

```text
platform_type JUNGLE_DAY_ACOUSTIC_PLATFORM WSF_PLATFORM
   icon target
   sensor jungle_day JUNGLE_DAY_ACOUSTIC_SENSOR end_sensor
   acoustic_signature BOGUS
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, sensor, acoustic_signature

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, mover, side, 平台类型
- **出处**：`ballistic/platforms/target.txt:9-13`　（同签名共 41 处，另见 `satellite_demos/platforms/simple_satellite.txt:9`、`coverage_demos/platforms/air_target.txt:11`、`satellite_demos/platforms/satellite_types.txt:9`）
- **片段**：

```text
platform_type TARGET WSF_PLATFORM
   icon Bullseye
   mover WSF_GROUND_MOVER end_mover
   side blue
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, mover, side

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, mover, weapon, 平台类型
- **出处**：`chaff/chaff_example.txt:80-84`　（同签名共 7 处，另见 `parachute/parachute_example.txt:80`、`new_guidance/scenarios/blue_multirole_fighter_1_launch_blue_asm_missile.txt:11`、`parachute/parachute_example2.txt:61`）
- **片段**：

```text
platform_type BLUE_AIRLIFTER_JET WSF_PLATFORM
   icon C-17
   mover WSF_AIR_MOVER end_mover
   weapon chaff CHAFF_WEAPON  end_weapon
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, mover, weapon

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, side, icon, position, 平台类型
- **出处**：`cyber/GoneFishing_ConstraintDemo.txt:153-157`
- **片段**：

```text
platform_type AIRPORT WSF_PLATFORM
   side green
   icon lha
   position 32n 87w
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：side, icon, position

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, mover, radar_signature, 平台类型
- **出处**：`electronic_warfare/cover_pulse_jamming.txt:203-207`　（同签名共 10 处，另见 `electronic_warfare/jamming_perception.txt:139`、`electronic_warfare/jtos_power.txt:202`、`electronic_warfare/spot_jamming.txt:199`）
- **片段**：

```text
platform_type STRIKER_PLATFORM WSF_PLATFORM
   icon F-18E
   mover WSF_AIR_MOVER end_mover
   radar_signature FIGHTER_RADAR_SIGNATURE
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, mover, radar_signature

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, spatial_domain, side, icon, 平台类型
- **出处**：`p6dof/bomb_sequencers.txt:52-56`　（同签名共 7 处，另见 `p6dof/cruise_missile_test.txt:41`、`six_dof/pm6_bomb_sequencers.txt:52`、`six_dof/pm6_cruise_missile_test.txt:41`）
- **片段**：

```text
platform_type GROUND-TARGET WSF_PLATFORM
   spatial_domain land
   side           red
   icon           target
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：spatial_domain, side, icon

### platform_type（alternate_tactical_maneuvers）｜平台类型

- **关键词**：platform_type, update_interval, side, icon, 平台类型
- **出处**：`p6dof/alternate_tactical_maneuvers.txt:37-41`　（同签名共 9 处，另见 `p6dof/alternate_tactical_maneuvers.txt:43`、`six_dof/comparison_alternate_tactical_maneuvers.txt:37`、`six_dof/comparison_alternate_tactical_maneuvers.txt:43`）
- **片段**：

```text
platform_type RedFighter FA-HVY
   update_interval 0.01 sec
   side red
   icon mig29_rus
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：update_interval, side, icon

### platform_type（relative_maneuvers）｜平台类型

- **关键词**：platform_type, update_interval, icon, follow_vertical_track, 平台类型
- **出处**：`p6dof/relative_maneuvers.txt:32-36`　（同签名共 9 处，另见 `p6dof/relative_maneuvers.txt:38`、`six_dof/comparison_relative_maneuvers.txt:32`、`six_dof/comparison_relative_maneuvers.txt:38`）
- **片段**：

```text
platform_type ManeuveringBlueFlyer FA-LGT
   update_interval 0.01 sec
   icon f16
   follow_vertical_track
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：update_interval, icon, follow_vertical_track

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, radar_signature, optical_signature, 平台类型
- **出处**：`sensor_demos/platforms/ground_site.txt:21-25`
- **片段**：

```text
platform_type GROUND_SITE WSF_PLATFORM
   icon Ground_Radar
   radar_signature      GROUND_SITE_RADAR_SIG
   optical_signature    GROUND_SITE_OPTICAL_SIG
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, radar_signature, optical_signature

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, radar_signature, optical_signature, infrared_signature, 平台类型
- **出处**：`sensor_plot/radar/analysis_map-ucav-dry.txt:25-29`　（同签名共 11 处，另见 `sensor_plot/radar/analysis_map-ucav-wet.txt:26`、`sensor_plot/radar/hm-required-jamming-power.txt:28`、`sensor_plot/radar/hm-ucav-dry.txt:22`）
- **片段**：

```text
platform_type TARGET_PLATFORM_TYPE WSF_PLATFORM
   radar_signature UCAV_RADAR_SIG
   optical_signature UCAV_OPTICAL_SIG
   infrared_signature UCAV_INFRARED_SIG
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：radar_signature, optical_signature, infrared_signature

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, side, add, 平台类型
- **出处**：`visual_part/blue_flyer.txt:10-15`　（同签名共 3 处，另见 `comm/platforms/intruder.txt:10`、`space_operations/platforms/tapsatellite.txt:12`）
- **片段**：

```text
platform_type blue_flyer_type WSF_PLATFORM
   icon F-18e
   side blue

   add mover WSF_AIR_MOVER end_mover
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, add

### platform_type（fires_122mm_rocket）｜平台类型

- **关键词**：platform_type, side, icon, weapon, 平台类型
- **出处**：`fires/types/fires_122mm_rocket.txt:94-99`　（同签名共 10 处，另见 `fires/types/fires_122mm_rocket.txt:101`、`fires/types/fires_122mm_rocket_short.txt:66`、`fires/types/fires_122mm_rocket_short.txt:73`）
- **片段**：

```text
platform_type FIRES_122MM_ROCKET_EXPLICIT_LAUNCHER FIRES_LAUNCHER
   side red
   icon mil_SS-Launcher-LR
   weapon fires_122mm_rocket FIRES_122MM_ROCKET_EXPLICIT
   end_weapon
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：side, icon, weapon

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, add, comm, internal_link, 平台类型
- **出处**：`multiresolution_demos/comm_demo.txt:84-89`
- **片段**：

```text
platform_type RECEIVER WSF_PLATFORM
  add processor message_receiver MESSAGE_RECEIVER end_processor
  comm blue_comm TEAM_DATALINK
    internal_link message_receiver
  end_comm
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：add, comm, internal_link

### platform_type（oo_grid）｜平台类型

- **关键词**：platform_type, side, icon, radar_signature, 平台类型
- **出处**：`engage/oo_grid.txt:36-42`
- **片段**：

```text
platform_type TARGET_TYPE GENERIC_TARGET
   side blue
   icon F-18E
   radar_signature FIGHTER_RADAR_SIGNATURE
   #mover WSF_AIR_MOVER
   #end_mover
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：side, icon, radar_signature

### platform_type（ssn_laydown）｜平台类型

- **关键词**：platform_type, icon, category, sensor, 平台类型
- **出处**：`space_operations/scenarios/ssn_laydown.txt:216-223`　（同签名共 9 处，另见 `space_operations/scenarios/ssn_laydown.txt:271`、`iads_c2_demos/platforms/ew_radar.txt:17`、`space_operations/scenarios/ssn_laydown.txt:133`）
- **片段**：

```text
platform_type GLOBUSII SSN
   icon ew_radar_icon
   category RADAR
   sensor globus_radar RADAR
      on
      internal_link report
   end_sensor
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：icon, category, sensor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, spatial_domain, icon, mover, 平台类型
- **出处**：`p6dof/waypoint_test.txt:35-42`　（同签名共 9 处，另见 `six_dof/six_dof_waypoint.txt:35`、`p6dof/platforms/zell-launcher.txt:40`、`six_dof/platforms/zell-launcher.txt:36`）
- **片段**：

```text
platform_type AIRMOVER_PLATFORM WSF_PLATFORM
   spatial_domain air
   icon           f15e
   
   mover WSF_AIR_MOVER
   end_mover
   
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：spatial_domain, icon, mover

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, sensor, processor, 平台类型
- **出处**：`alv_routing/platforms/ew_radar_site.txt:11-19`　（同签名共 10 处，另见 `multiresolution_demos/radar_signature_demo.txt:35`、`script_demos/script_demo_5.txt:286`、`script_demos/script_demo_6.txt:285`）
- **片段**：

```text
platform_type EW_RADAR_SITE WSF_PLATFORM
   icon ground_radar
   sensor ew-radar-1 EARLY_WARNING_SENSOR
      processor track-proc
   end_sensor

   processor track-proc WSF_TRACK_PROCESSOR
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, sensor, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, side, sensor, 平台类型
- **出处**：`coverage_demos/platforms/groud_station_existing.txt:13-21`　（同签名共 2 处，另见 `coverage_demos/platforms/ground_station.txt:13`）
- **片段**：

```text
platform_type GROUND_STATION WSF_PLATFORM
   icon ew_radar_icon
   side blue

   sensor ground_sensor GROUND_STATION_SENSOR  
      on
      tilt 0 deg
   end_sensor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side, sensor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, mover, sensor, 平台类型
- **出处**：`sosm/test_mission/a2a/test_a2a.txt:31-39`
- **片段**：

```text
platform_type BLUE_MULTIROLE_FIGHTER_1 WSF_PLATFORM
   icon F-18E

   mover WSF_AIR_MOVER
   end_mover

   sensor lwir LWIR_SENSOR
   end_sensor
end_platform_type 
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, mover, sensor

### platform_type（full_laydown）｜平台类型

- **关键词**：platform_type, side, icon, edit, 平台类型
- **出处**：`timeline_lead/scenarios/full_laydown.txt:133-141`
- **片段**：

```text
platform_type   RED_STRIKER    STRIKER
   side red
   icon weasel
   edit processor timeline_proc
      script_variables
         DefaultPercentRangeMax  = 0.50;
      end_script_variables
   end_processor
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：side, icon, edit

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, add, route, 平台类型
- **出处**：`multiresolution_demos/fuel_demo.txt:35-44`
- **片段**：

```text
platform_type SIMPLE_FIGHTER WSF_PLATFORM
   icon F-18
   add mover WSF_AIR_MOVER
      update_interval 5.0 s
   end_mover
   route
      position 0n 0e altitude 30000 ft speed 300 kts
      position 1n 0e altitude  5000 ft speed 600 kts
   end_route
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, add, route

### platform_type（lte_fighter）｜平台类型

- **关键词**：platform_type, icon, radar_signature, mover, 平台类型
- **出处**：`six_dof_with_brawler/platforms/lte_fighter.txt:50-59`
- **片段**：

```text
platform_type SIX_DOF_FIGHTER  BRAWLER_TEST_AIRMOVER
   icon f15c
   
   radar_signature 10dB_FuzzBall

   mover WSF_POINT_MASS_SIX_DOF_MOVER
       vehicle_type LTE_FIGHTER_PM6
       update_interval 0.05 sec
   end_mover
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：icon, radar_signature, mover

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, side, comm, processor, 平台类型
- **出处**：`space_operations/scenarios/ssn_laydown.txt:120-129`
- **片段**：

```text
platform_type SSN WSF_PLATFORM
   side blue

   comm comm WSF_COMM_TRANSCEIVER
   end_comm

   processor report WSF_LINKED_PROCESSOR
      report_to commander via comm
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：side, comm, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, mover, processor, 平台类型
- **出处**：`base_types/weapons/ssm/red_mrbm_3.txt:409-419`　（同签名共 25 处，另见 `base_types/weapons/ssm/red_mrbm_3.txt:427`、`tbm_demos/weapons/ssm/tbm1.txt:18`、`base_types/weapons/other/gun.txt:24`）
- **片段**：

```text
platform_type RED_MRBM_3_STAGE1 WSF_PLATFORM
  icon sam-a_missile
  mover WSF_NEW_UNGUIDED_MOVER
     update_interval 0.5 sec
     show_status
     aero RED_MRBM_3_STAGE_EMPTY_AERO
     total_mass            2500  kg
  end_mover
  processor fuse WSF_GROUND_TARGET_FUSE
  end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, mover, processor

### platform_type（blue_multirole_fighter_2_erc）｜平台类型

- **关键词**：platform_type, category, edit, script, 平台类型
- **出处**：`outer_air_battle/platforms/blue_multirole_fighter_2_erc.txt:13-25`
- **片段**：

```text
platform_type BLUE_MULTIROLE_FIGHTER_2_ERC BLUE_MULTIROLE_FIGHTER_2

   category ERC

   edit mover
      at_end_of_path extrapolate
   end_mover

   script void deleteSelf()
      PLATFORM.DeletePlatform();
   end_script

end_platform_type
```

- **演示要点**：演示 platform_type 的参数：category, edit, script

### platform_type（pm6_bomb_sequencers）｜平台类型

- **关键词**：platform_type, weapon, sensor, processor, 平台类型
- **出处**：`six_dof/pm6_bomb_sequencers.txt:88-102`　（同签名共 5 处，另见 `alv_routing/platforms/alv.txt:134`、`p6dof/missile_comparison.txt:56`、`six_dof/pm6_missile_comparison.txt:63`）
- **片段**：

```text
platform_type B-FW-GPS-BOMBS B-FW_PM6
   weapon gps_bomb GBU-500_PM6-WEAPON
      quantity       8
      location       0.0 0.0 0.0 ft
      launch_delta_v 0.0 0.0 2.0 ft/sec
   end_weapon
   
   sensor seeker SIMPLE_GENERIC_SEEKER
      on
   end_sensor
   
   processor track_manager WSF_TRACK_PROCESSOR
      on
   end_processor
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：weapon, sensor, processor

### platform_type（blue_multirole_fighter_2_mrc）｜平台类型

- **关键词**：platform_type, category, include, processor, 平台类型
- **出处**：`outer_air_battle/platforms/blue_multirole_fighter_2_mrc.txt:15-29`
- **片段**：

```text
platform_type BLUE_MULTIROLE_FIGHTER_2_MRC BLUE_MULTIROLE_FIGHTER_2

   category MRC

#  This script is defined here, instead of in the processor, because it is
#  "called" by the aircraft, as part of the route.
   include processors/onstation.txt

   processor station_timer STATION_TIMER
      script_variables
         total_station_time     = 3600.0 * 3.0;  # three hours
         time_before_refueling  = 3600.0 * 1.5;        # one hour
      end_script_variables
   end_processor
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：category, include, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, comm, group_join, processor, 平台类型
- **出处**：`space_operations/platforms/launch_facility_telemetry.txt:11-26`　（同签名共 2 处，另见 `space_operations/platforms/interceptor.txt:17`）
- **片段**：

```text
platform_type     LAUNCH_FACILITY           WSF_PLATFORM
   comm LF_comm WSF_COMM_TRANSCEIVER
      internal_link message_proc
   end_comm

   # "Network" to receive telemetry messages from launch vehicle
   group_join telemetry

   processor message_proc WSF_SCRIPT_PROCESSOR
      on_message
         script
            PLATFORM.Comment("Receiving telemetry data");
         end_script
      end_on_message
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：comm, group_join, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, mover, include, processor, 平台类型
- **出处**：`outer_air_battle/platforms/timed_ac.txt:14-32`
- **片段**：

```text
platform_type TIMED_AC WSF_PLATFORM

#  this platform MUST have a mover so that the route/labels will work.
   mover WSF_AIR_MOVER end_mover

#  This script is defined here, instead of in the processor, because it is
#  "called" by the aircraft, as part of the route.
   include processors/onstation.txt

   processor station_timer STATION_TIMER
      script_variables
         time_before_refueling = 1000.0;
         total_station_time    = 3000.0;
         refuel_waypoint_label = "cap_refuel";
         go_home_waypoint_label= "go_home";
      end_script_variables
   end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：mover, include, processor

### platform_type（1v1_initial_prediction）｜平台类型

- **关键词**：platform_type, side, script_variables, execute, 平台类型
- **出处**：`air_to_air/scenarios/1v1_initial_prediction.txt:274-293`
- **片段**：

```text
platform_type red_maneuver_test red_maneuver_target
   side red
   
   script_variables
      WsfDraw draw = WsfDraw();
      draw.SetLayer("flyout_" + PLATFORM.Name());
      draw.SetPointSize(3);
      draw.BeginPoints();
      draw.SetColor(0.6, 0.6, 1.0);
   end_script_variables
   
   execute at_interval_of 2 sec
      WsfGeoPoint location = WsfGeoPoint.ConstructWCS(PLATFORM.LocationWCS());
      draw.BeginPoints();
      draw.Vertex(location);
      draw.Vertex(location);
      draw.End();
   end_execute
   
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：side, script_variables, execute

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, sensor, comm, processor, 平台类型
- **出处**：`sensor_demos/passive_detector_demo.txt:171-191`　（同签名共 3 处，另见 `sensor_demos/passive_detector_df_demo.txt:174`、`heatmap/platforms/flight_lead.txt:14`）
- **片段**：

```text
platform_type RCVR_PLATFORM WSF_PLATFORM

   sensor rcvr BISTATIC_SENSOR_RCVR
      on
      internal_link data_mgr
      ignore_same_side
   end_sensor

   comm datalink PASSIVE_DATALINK
      network_name <local:slave>
      internal_link data_mgr
   end_comm

   #processor data_mgr WSF_LINKED_PROCESSOR
   #   report_to commander via datalink
   #end_processor

   processor data_mgr WSF_TRACK_PROCESSOR
      report_to commander via datalink
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：sensor, comm, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, weapon_effects, mover, 平台类型
- **出处**：`parachute/parachute_example2.txt:32-52`
- **片段**：

```text
platform_type PARACHUTER WSF_PLATFORM
   icon parachute

   weapon_effects PARACHUTE_EFFECT

   mover WSF_GUIDED_MOVER
     update_interval 0.01 secs

      stage 1
         aero free_fall
         total_mass 0.0 lbs
         pre_ignition_coast_time 0.1 sec
         pre_separation_coast_time 10.0 sec
      end_stage

      stage 2
         aero chute_out
         total_mass 220 lbs
      end_stage
   end_mover
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, weapon_effects, mover

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, comm, processor, 平台类型
- **出处**：`iads_c2_demos/delegate_battle_manager.txt:75-98`　（同签名共 2 处，另见 `brawler/platforms/gci_cmdr.txt:13`）
- **片段**：

```text
platform_type SAM_LAUNCHER WSF_PLATFORM
   icon SA-10_Launcher

   comm cmdr_net RED_DATALINK
      network_name <local:slave>
      internal_link data_mgr
      internal_link dissemination
   end_comm

   processor data_mgr WSF_TRACK_PROCESSOR
      purge_interval              60 sec
      unchanged_track_reporting   disable
      circular_report_rejection   on
   end_processor

   processor dissemination DC2
   end_processor

   processor asset_manager WPN_AM
   end_processor

   processor weapons_manager WM_SAM
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, comm, processor

### platform_type（platforms）｜平台类型

- **关键词**：platform_type, command_chain, comm, processor, 平台类型
- **出处**：`l16_j11/platforms.txt:15-38`
- **片段**：

```text
platform_type NE_SR_A2A_IR BLUE_SR_A2A_IR_MISSILE_BASE

   // The command chain must be defined when using the JTIDS terminal 
   // otherwise the terminal will fail initialization.
   // This is problematic as the commander of an explicit weapon
   // is by default the platform that fired the weapon.
   command_chain NETWORK_ENABLED_WEAPON SELF

   comm j11_comm J11_COMM
#      debug
      internal_link l16_computer
      internal_link track-processor
   end_comm

   processor l16_computer WEAPON_LINK16_COMPUTER
#      debug
      comm j11_comm
   end_processor

   processor track-processor WSF_WEAPON_TRACK_PROCESSOR
      update_interval 1 sec
   end_processor

end_platform_type
```

- **演示要点**：演示 platform_type 的参数：command_chain, comm, processor

### platform_type（intersect_mesh_test）｜平台类型

- **关键词**：platform_type, add, processor, sensor, 平台类型
- **出处**：`hel/intersect_mesh_test.txt:241-267`　（同签名共 2 处，另见 `hel/intersect_mesh_test_beam_director.txt:245`）
- **片段**：

```text
platform_type BLUE_MULTIROLE_FIGHTER_1EF-HEL BLUE_MULTIROLE_FIGHTER_1EF

   add processor auto_fire auto_fire_computer
      on
   end_processor

   add weapon hel HEL
      #debug
   end_weapon

   processor fuser WSF_TRACK_PROCESSOR
     raw_track_reporting on
     fused_track_reporting off
     purge_interval 60.0 seconds
     report_interval 5.0 seconds
     //debug
   end_processor

   sensor all-seeing WSF_GEOMETRIC_SENSOR
      on
      processor fuser
      reports_location
      reports_velocity
      frame_time 1.0 second
   end_sensor

end_platform_type
```

- **演示要点**：演示 platform_type 的参数：add, processor, sensor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, add, processor, sensor, 平台类型
- **出处**：`hel/hel_test.txt:20-47`
- **片段**：

```text
platform_type HEL_PLATFORM WSF_PLATFORM

   // ADD COMMENTED ITEMS IN DERIVED TYPES
   //spatial_domain air
   //icon F-18E
   //side blue

   add processor auto_fire auto_fire_computer
      on
   end_processor

   //add weapon hel AA_SELF_PROTCECT_HEL
   //   debug
   //end_weapon

   processor fuser WSF_TRACK_PROCESSOR
     purge_interval 60.0 seconds
   end_processor

   sensor all-seeing WSF_GEOMETRIC_SENSOR
      on
      processor fuser
      reports_location
      reports_velocity
      frame_time 1.0 second
   end_sensor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：add, processor, sensor

### platform_type（designator_type）｜平台类型

- **关键词**：platform_type, position, heading, add, 平台类型
- **出处**：`hellfire/semiactive_laser_hellfire/designator_type.txt:13-41`　（同签名共 2 处，另见 `hellfire/laser_designation_via_dis/designator_type.txt:13`）
- **片段**：

```text
platform_type AH-64A APACHE

   # Beginning location...
   #position 39:12n 106:50w altitude 2000 m agl
   position 39:11n 106:49:23w altitude 800 m agl
   heading 240 deg

   # Radar sensor which can detect the target after we get Line-Of-Sight to it.
   add sensor laser_designator WSF_LASER_DESIGNATOR
      azimuth_field_of_view   -10 deg 10 deg
      elevation_field_of_view -10 deg 10 deg
      on
      maximum_transmission_range 10 km
      terrain_float_distance     10 m
      target_association_staleout_interval 10 sec
      maximum_target_association_distance 200 m
      frame_time          0.1 s
      slew_mode           both
      laser_code          1212
      azimuth_slew_rate   10 deg/s
      elevation_slew_rate 10 deg/s
      reports_location
      transmitter
         wavelength 1.06E-6 microns
         power 1 mw
      end_transmitter
   end_sensor

end_platform_type
```

- **演示要点**：演示 platform_type 的参数：position, heading, add

### platform_type（aam-sr-tvc）｜平台类型

- **关键词**：platform_type, weapon_effects, sensor, processor, 平台类型
- **出处**：`six_dof/platforms/aam-sr-tvc.txt:136-167`　（同签名共 5 处，另见 `six_dof/platforms/aam-sr.txt:134`、`p6dof/platforms/aam-mr.txt:53`、`six_dof/platforms/aam-mr.txt:82`）
- **片段**：

```text
platform_type AAM-SR-TVC AAM-SR-TVC-TEST
   
   weapon_effects SR_LETHALITY

   sensor ir_seeker SIMPLE_GENERIC_SEEKER
      category ir_seeker
      on
      internal_link data_mgr
      internal_link seeker_activation
   end_sensor

   processor data_mgr WSF_TRACK_PROCESSOR
      on
      master_track_processor
      update_interval 0.01 sec
      purge_interval  1 sec
   end_processor

   processor fuse WSF_AIR_TARGET_FUSE
      use_current_target
      update_interval           0.1 sec
      fine_update_interval      0.05 sec
      gross_proximity_range     500 ft
      detonate_below_height_agl 20.0 ft
      detonate_below_height_msl 20.0 ft
      maximum_time_of_flight    120.0 sec
   end_processor

   processor seeker_activation verbose_seeker_activation
   end_processor

end_platform_type
```

- **演示要点**：演示 platform_type 的参数：weapon_effects, sensor, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, comm, on, 平台类型
- **出处**：`satellite_demos/platforms/globalstar_gs.txt:14-45`　（同签名共 11 处，另见 `satellite_demos/platforms/globalstar_handheld.txt:13`、`satellite_demos/platforms/gps_handheld.txt:13`、`satellite_demos/platforms/noaa_gs.txt:14`）
- **片段**：

```text
platform_type GLOBALSTAR_GS WSF_PLATFORM
   icon C4I

  comm GROUNDSTATION_GLOBALSTAR_UPLINK_TX GROUNDSTATION_GLOBALSTAR_UPLINK_TX
   on
  end_comm

  comm GROUNDSTATION_GLOBALSTAR_DOWNLINK_RX GROUNDSTATION_GLOBALSTAR_DOWNLINK_RX
   on
  end_comm

#====================Uncomment this to send a test message to satellites===============================================
#execute at_interval_of 1 sec
#      // Loop through all the platforms in the simulation
#      for (int i = 1; i <= WsfSimulation.PlatformCount(); i = i + 1)
#          {
#          WsfPlatform myPlatform = WsfSimulation.FindPlatform(i);
#          if ((myPlatform != PLATFORM) && myPlatform.IsValid())   # Make sure we are not trying to talk to ourselves!
#              {
#              WsfControlMessage myMessage = WsfControlMessage();
#              myMessage.SetFunction("This is a test");
#
#              if (myPlatform.Type() == "GLOBALSTAR")
#                  {
#                  PLATFORM.Comm("GROUNDSTATION_GLOBALSTAR_UPLINK_TX").SendUnicastMessage(myMessage, myPlatform);
#                  }
#              }
#          }
# end_execute
#=======================================================================================================================

 end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, comm, on

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, mover, fuel, processor, 平台类型
- **出处**：`behavior_tree/platforms/priority_selector_striker.txt:15-54`　（同签名共 11 处，另见 `behavior_tree/platforms/selector_with_memory_striker.txt:15`、`behavior_tree/platforms/weighted_random_striker.txt:15`、`behavior_tree/platforms/sequence_striker.txt:18`）
- **片段**：

```text
platform_type  STRIKER  WSF_PLATFORM

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

   fuel WSF_FUEL
      consumption_rate     7 lb/s
      initial_quantity 14000 lb     #~33 minutes, at this consumption rate
      maximum_quantity 14000 lb
      bingo_quantity    1000 lb
   end_fuel  

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

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：mover, fuel, processor

### platform_type（blue_multirole_fighter_1_ripr）｜平台类型

- **关键词**：platform_type, processor, delete, sensor, 平台类型
- **出处**：`base_types/platforms/blue_multirole_fighter_1_ripr.txt:15-73`
- **片段**：

```text
platform_type blue_multirole_fighter_1 BLUE_MULTIROLE_FIGHTER_1


   //This is the code that lets the interceptor intercept
   processor int-thinker AIAI-thinker
      script_variables
         mWeaponArray[0] = Map<string, Object>();
         mWeaponArray[0].Set("name", "int_missile");
         mWeaponArray[0].Set("weapon", PLATFORM.Weapon("int_missile"));
         mWeaponArray[0].Set("rangeMin", 1000);
         mWeaponArray[0].Set("rangeMax", 65000); // ~35 miles
         mWeaponArray[0].Set("numActiveMax", 1); // how many weapons of this type can be in play simultaneously
      end_script_variables
   end_processor


   //don't mess around with crappy radars, use a simple geometric sensor
   delete sensor blue_a2a_radar
   delete sensor esm-1
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

end_platform_type
```

- **演示要点**：演示 platform_type 的参数：processor, delete, sensor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, comm, processor, track_manager, 平台类型
- **出处**：`base_types/platforms/brawler/brawler_flight_lead.txt:10-72`
- **片段**：

```text
platform_type   BRAWLER_FLIGHT_LEAD    WSF_PLATFORM
   comm datalink WSF_COMM_TRANSCEIVER
      network_name brawler_net
      internal_link data_mgr
      internal_link task_mgr
      internal_link perception
   end_comm
   processor data_mgr WSF_TRACK_PROCESSOR
      master_track_processor
   end_processor
   track_manager
      retain_raw_tracks
      retain_track_history
      uncorrelated_track_drops disable
   end_track_manager
   processor perception WSF_PERCEPTION_PROCESSOR
      asset_perception status_messages
   end_processor

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

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：comm, processor, track_manager

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, comm, processor, script_variables, 平台类型
- **出处**：`timeline_lead/platforms/red_flight_lead.txt:15-81`
- **片段**：

```text
platform_type RED_FLIGHT_LEAD WSF_PLATFORM

  #side  blue / red

   comm sub_net FINITE_DATALINK
      network_name <local:master>
      internal_link data_mgr
     #internal_link task_mgr
      internal_link perception
      internal_link timeline
   end_comm

   comm cmdr_net FINITE_DATALINK
      network_name <local:slave>
      internal_link data_mgr
     #internal_link task_mgr
      internal_link perception
      internal_link timeline
   end_comm

   processor data_mgr WSF_TRACK_PROCESSOR
      purge_interval             30    seconds
      report_to commander        via   cmdr_net
      report_to subordinates     via   sub_net to cmdr_net
     #report_interval            4 sec
      report_interval            1 sec
      fused_track_reporting      on
      raw_track_reporting        off
      circular_report_rejection  true
   end_processor

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

#   processor  task_mgr  FL_QUANTUM_TASKER
#    #script_debug_writes off
#    #show_task_messages
#   end_processor

   #TODO - where should this really be found?
   script_variables
      Map<int, int> mGrinderPairings = Map<int, int>();
   end_script_variables

   processor timeline FLIGHT_LEAD_DATA
      script_variables
         RISK = "MEDIUM";
         mStaticRiskLevel = true;
         FSR  = 40 * MATH.M_PER_NM();
         DOR  = 35 * MATH.M_PER_NM();
         MAR  = 20 * MATH.M_PER_NM();
      end_script_variables
   end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：comm, processor, script_variables

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, mover, callback, processor, 平台类型
- **出处**：`script_demos/script_demo_4.txt:22-96`
- **片段**：

```text
platform_type FIGHTER WSF_PLATFORM
   mover WSF_AIR_MOVER
      default_linear_acceleration 1.0 g
      default_radial_acceleration 1.0 g
      default_climb_rate 200 fps
   end_mover

   # Create a callback that will kick-off the maneuvering.
   callback start_maneuvering_cb WSF_SCRIPT_CALLBACK
      execute start_maneuvering in script-proc
   end_callback

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
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：mover, callback, processor

### platform_type（pm6_unguided_rocket_test）｜平台类型

- **关键词**：platform_type, weapon, script_variables, processor, 平台类型
- **出处**：`six_dof/pm6_unguided_rocket_test.txt:42-178`　（同签名共 3 处，另见 `six_dof/rb6_unguided_rocket_test.txt:42`、`p6dof/unguided_rocket_test.txt:42`）
- **片段**：

```text
platform_type FA-LGT-UNGUIDED_ROCKET FA-LGT_PM6

   # Define the weapons
   
   weapon unguided_rocket_pods_lft UNGUIDED_ROCKET_POD
      quantity 8
      location 0.0 -4.0 1.0 m
      launch_delta_v 0.0 0.0 0.0 ft/sec
   end_weapon

   weapon unguided_rocket_pods_rgt UNGUIDED_ROCKET_POD
      quantity 8
      location 0.0 4.0 1.0 m
      launch_delta_v 0.0 0.0 0.0 ft/sec
   end_weapon

   script_variables
      bool diveInitiated     = false;
      bool steadyDive        = false;
      bool triggerPulled     = false;
      bool noAmmo            = false;
      double timeToPullout   = 0.0;
      bool pulloutInitiated  = false;
      bool climboutInitiated = false;
      bool leveloffInitiated = false;
   end_script_variables
   
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

end_platform_type
```

- **演示要点**：演示 platform_type 的参数：weapon, script_variables, processor

### platform_type（flight_lead）｜平台类型

- **关键词**：platform_type, edit, delete, processor, 平台类型
- **出处**：`brawler/platforms/flight_lead.txt:14-197`
- **片段**：

```text
platform_type FLIGHT_LEAD BRAWLER_FLIGHT_LEAD

   edit processor data_mgr
      master_track_processor
      purge_interval             60 seconds
      report_to commander via datalink
      report_to subordinates via datalink
     #report_interval            1 sec
     #report_interval            5 sec
     #report_interval            2 sec
      report_interval            0.5 sec   #TEST
      fused_track_reporting      on
      raw_track_reporting        off
      circular_report_rejection  true
   end_processor

   edit processor perception
      asset_perception         status_messages
      on
      reporting_self           true
      reporting_others         true
      report_interval          1 seconds
      report_to commander      via datalink
   end_processor

   #replace tasker
   delete processor task_mgr
   processor task_mgr WSF_QUANTUM_TASKER_PROCESSOR

     #update_interval 0.3 sec
      update_interval 5.0 sec

      script_variables
         bool mSelfCreateTasks = true;   //if false, simply interpret received tasks
         #########################################################################
         ## for evaluating weapon tasks
         #########################################################################
         Map<string,int> mKnownTargetTypes = Map<string,int>();
         mKnownTargetTypes["BRAWLER_PLATFORM"] = 1;
         mKnownTargetTypes["COMBINED_PLATFORM"] = 1;
         mKnownTargetTypes["RED_COMBINED_PLATFORM"] = 1;
         mKnownTargetTypes["RED_COMBINED_PLATFORM_B"] = 1;
      end_script_variables

      script Array<WsfQuantumTask> FlightLeadTaskGeneration(Array<WsfLocalTrack> aTracks, Array<WsfAssetPerception> aAssets)

         #writeln("T=",TIME_NOW,", ",PLATFORM.Name(),", tracks: ", aTracks.Size());

         Array<WsfQuantumTask> tasks = Array<WsfQuantumTask>();
         //check if we are creating tasks or if we have a commander for that
         if (mSelfCreateTasks == true)
         {
            //if its us, then create weapon tasks for enemy tracks
            for (int i=0; i<aTracks.Size(); i=i+1)
            {
               WsfLocalTrack lt = aTracks.Get(i);
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
         }
         else
         {
            WsfTaskList rcvdTasks = PROCESSOR.TasksReceivedOfType("CLUSTER");
            //do something with them, interpret them
            foreach (WsfTask t in rcvdTasks)
            {
               //writeln(PLATFORM.Name(), " received CLUSTER task: ", t.TaskType(), ", resource: ", t.ResourceName());
               Array<WsfTrack> perceivedThreats = PLATFORM.PerceivedThreats();
               Array<string> clusterMembers = (Array<string>)t.AuxDataObject("ClusterMemberNames");
               bool foundOne = false;
               foreach(string member in clusterMembers)
               {
                  foreach(WsfTrack threat in perceivedThreats)
                  {
                     if (member == threat.TargetName())
                     {
                        if (threat.Target().IsValid())
                        {
                           //create a task for this target, we have perception of it
                           WsfQuantumTask task = WsfQuantumTask.Construct(1.0, "WEAPON", threat);
                           task.SetTaskType("WEAPON");
                           tasks.PushBack(task);
                           foundOne = true;
                        }
                        break;
                     }
                  }
               }
               if (foundOne == false)
               {
                  //cluster task complete, all target members gone
                  PROCESSOR.SetTaskComplete(t,"SUCCESSFUL");
               }
            }
         }
         return tasks;
      end_script


      script double FlightLeadEvaluation(WsfQuantumTask aTask, WsfAssetPerception aAsset)
         #TODO - include missile capability in evaluation
         #       for now: just base value on range & whether or not asset as domain capable weapon
         WsfTrack track = PLATFORM.MasterTrackList().FindTrack(aTask.TrackId());

         writeln_d(PLATFORM.Name(), " evaluating task type ", aTask.TaskType());

         if (aTask.TaskType() == "WEAPON" &&
            #TASK.ResourceIsWeapon() &&
             track.IsValid())
         {
            writeln_d("evaluating weapon task: ", track.TargetName(), ", updated time: ", track.UpdateTime());
            #TODO - select one of the systems?
            for (int i=0; i<aAsset.SystemCount(); i+=1)
            {
               if (aAsset.SystemKind(i) == "weapon" && aAsset.SystemQuantityRemaining(i) >= 1)
               {
                  double value = 1.0 / track.SlantRangeTo(aAsset.Location());

                  struct weaponData = GetWeaponData(aAsset.SystemType(i));
                  if (weaponData->type == aAsset.SystemType(i))
                  {
                     if ((weaponData->domainAir  && track.AirDomain()) ||
                         (weaponData->domainLand && track.LandDomain())  )
                     {
                        return value;
                     }
                  }
                  else
                  {
                     //check launch computers
                     WsfPlatform shooter = WsfSimulation.FindPlatform(aAsset.Index());
                     if (shooter.IsValid())
                     {
                        WsfWeapon weapon = shooter.Weapon(aAsset.SystemName(i));
                        if (weapon.IsValid())
                        {
                           WsfLaunchComputer lcPtr = weapon.LaunchComputer();
                           if (lcPtr.IsValid())
                           {
                              if (track.AirDomain() && lcPtr.IsA_TypeOf("WSF_AIR_TO_AIR_LAUNCH_COMPUTER"))
                              {
                                 return value;
                              }
                              else if (track.LandDomain() && lcPtr.IsA_TypeOf("WSF_ATG_LAUNCH_COMPUTER"))
                              {
                                 return value;
                              }
                           }
                        }
                     }
                  }
               }
            }
         }
         return 0;
      end_script

     #update_interval 0.3 sec
     #show_task_messages
      script_debug_writes    off
      asset_representation   platform
      reallocation_strategy  dynamic
      generator              custom          FlightLeadTaskGeneration
     #evaluator              distance
      evaluator              custom          FlightLeadEvaluation
      allocator              optimal_profit   type   WEAPON
     #allocator_extra_tasks  optimal_profit
      allocator_extra_assets optimal_profit

   #   behavior_tree
   #      behavior_node debug_quantum_tasker
   #   end_behavior_tree

   end_processor

end_platform_type
```

- **演示要点**：演示 platform_type 的参数：edit, delete, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, sensor, 平台类型
- **出处**：`acoustic/acoustic_demo.txt:72-75`　（同签名共 5 处，另见 `acoustic/acoustic_demo.txt:82`、`acoustic/acoustic_demo.txt:92`、`acoustic/acoustic_demo.txt:102`）
- **片段**：

```text
platform_type JUNGLE_DAY_ACOUSTIC_PLATFORM WSF_PLATFORM
   icon target
   sensor jungle_day JUNGLE_DAY_ACOUSTIC_SENSOR end_sensor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, sensor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, mover, 平台类型
- **出处**：`ballistic_missile_shootdown/platforms/target.txt:10-13`　（同签名共 23 处，另见 `script_demos/script_demo_3.txt:25`、`space_operations/demo_delta_iv_m.txt:51`、`traffic_demos/platforms/airport.txt:9`）
- **片段**：

```text
platform_type TARGET WSF_PLATFORM
   icon Bullseye
   mover WSF_GROUND_MOVER end_mover
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, mover

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, radar_signature, 平台类型
- **出处**：`base_types/weapons/agm/atg_mach_4_missile_lc_generator.txt:25-28`　（同签名共 2 处，另见 `wargame/platforms/command.txt:14`）
- **片段**：

```text
platform_type TARGET_PLATFORM_TYPE WSF_PLATFORM
  icon Ground_Radar
  radar_signature TARGET_RADAR_SIG
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, radar_signature

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, side, 平台类型
- **出处**：`cyber/platforms/target.txt:11-14`　（同签名共 6 处，另见 `electronic_warfare/comm_jamming.txt:277`、`fires/time_on_target.txt:14`、`route_finder_demos/3d_route_finder.txt:16`）
- **片段**：

```text
platform_type TARGET WSF_PLATFORM
   icon Bullseye
   side red
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, side

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, radar_signature, optical_signature, 平台类型
- **出处**：`sensor_plot/eoir/px_fighter.txt:54-57`　（同签名共 10 处，另见 `sensor_plot/sar/ag_bomber.txt:54`、`sensor_plot/sar/dt_example.txt:57`、`sensor_plot/sar/ip_bomber.txt:54`）
- **片段**：

```text
platform_type TARGET_PLATFORM_TYPE WSF_PLATFORM
   radar_signature   TARGET_RADAR_SIG
   optical_signature TARGET_OPTICAL_SIG
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：radar_signature, optical_signature

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, indestructible, 平台类型
- **出处**：`swarm/platforms/target.txt:9-12`
- **片段**：

```text
platform_type  TARGET  WSF_PLATFORM
   icon Bullseye
   indestructible
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, indestructible

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, side, weapon, 平台类型
- **出处**：`ballistic_missile_shootdown/weapons/ssm/red_mrbm_1_lcg.txt:15-19`　（同签名共 15 处，另见 `base_types/weapons/sam/blue_lr_sam_lcg.txt:16`、`base_types/weapons/ssm/red_icbm_1_lcg.txt:30`、`base_types/weapons/ssm/red_icbm_2_lcg.txt:15`）
- **片段**：

```text
platform_type LAUNCH_PLATFORM_TYPE WSF_PLATFORM
   side red
   weapon red_mrbm_1 RED_MRBM_1
   end_weapon
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：side, weapon

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, weapon, 平台类型
- **出处**：`base_types/weapons/aam/ata_blue_lr_a2a_rf_missile_lc_generator.txt:35-39`　（同签名共 6 处，另见 `base_types/weapons/agm/atg_mach_4_missile_lc_generator.txt:15`、`base_types/weapons/aam/ata4_generator.txt:36`、`tbm_demos/platforms/tbm_launcher2.txt:15`）
- **片段**：

```text
platform_type LAUNCH_PLATFORM_TYPE WSF_PLATFORM
  icon F-18E
  weapon launching_weapon BLUE_LR_A2A_RF_MISSILE
  end_weapon
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, weapon

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, optical_signature, mover, 平台类型
- **出处**：`example_scripts/output_file_demo.txt:145-149`
- **片段**：

```text
platform_type     F4_PHANTOM           WSF_PLATFORM
   optical_signature F4_OPTICAL_SIG
   mover WSF_AIR_MOVER
   end_mover
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：optical_signature, mover

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, multiresolution_mover, 平台类型
- **出处**：`multiresolution_demos/air_mover_demo.txt:34-38`
- **片段**：

```text
platform_type SIMPLE_FIGHTER WSF_PLATFORM
   icon F-18  
   multiresolution_mover MR_AIR_MOVER
   end_multiresolution_mover
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, multiresolution_mover

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, category, add, 平台类型
- **出处**：`satellite_demos/platforms/iridium_handheld.txt:19-23`
- **片段**：

```text
platform_type HANDHELD WSF_PLATFORM
   category commander
   add sensor detect DETECT
   end_sensor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：category, add

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, radar_signature, mover, 平台类型
- **出处**：`sensor_demos/bistatic_demo.txt:21-25`　（同签名共 9 处，另见 `sensor_demos/bistatic_sp_false_target_jamming_demo.txt:53`、`sensor_demos/bistatic_sp_noise_jamming_demo.txt:36`、`sensor_demos/bistatic_support_false_target_jamming_demo.txt:53`）
- **片段**：

```text
platform_type JET WSF_PLATFORM
   radar_signature RADAR_SIGNATURE
   mover WSF_AIR_MOVER
   end_mover
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：radar_signature, mover

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, position, sensor, 平台类型
- **出处**：`sensor_plot/radar/vm-ucav-dry.txt:28-32`　（同签名共 11 处，另见 `sensor_plot/radar/vm-ucav-soj.txt:29`、`sensor_plot/radar/vm-ucav-soj2.txt:30`、`sensor_plot/radar/hm-bistatic-ft-jamming-lab.txt:117`）
- **片段**：

```text
platform_type SENSOR_PLATFORM_TYPE WSF_PLATFORM
   position 0n 0e heading 90 deg
   sensor radar ACQ_RADAR
   end_sensor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：position, sensor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, category, 平台类型
- **出处**：`six_dof_with_brawler/platforms/brawler_test.txt:25-29`　（同签名共 2 处，另见 `six_dof_with_brawler/platforms/brawler_test.txt:17`）
- **片段**：

```text
platform_type  BRAWLER_TEST_AIRMOVER  WSF_PLATFORM
   icon f15c
   category AIRCRAFT
   category EZJA
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon, category

### platform_type（aam-missile）｜平台类型

- **关键词**：platform_type, category, radar_signature, 平台类型
- **出处**：`wargame/weapons/aam/aam-missile.txt:14-18`
- **片段**：

```text
platform_type SIMPLE_A2A_MISSILE AAM_BASE
   category ignored-by-iads-radar 
   radar_signature AIR_TARGET_RADAR_SIGNATURE
   
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：category, radar_signature

### platform_type（oo_grid）｜平台类型

- **关键词**：platform_type, side, script_variables, 平台类型
- **出处**：`engage/oo_grid.txt:29-34`
- **片段**：

```text
platform_type TRACKER_TYPE GENERIC_TRACKER
   side red
   script_variables
      weapon_name = "lrsam";
   end_script_variables
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：side, script_variables

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, empty_mass, multiresolution_mover, 平台类型
- **出处**：`multiresolution_demos/space_mover_demo.txt:38-43`
- **片段**：

```text
platform_type MR_TEST_SAT WSF_PLATFORM
   empty_mass 100 kg

   multiresolution_mover MR_MOVER
   end_multiresolution_mover
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：empty_mass, multiresolution_mover

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, spatial_domain, mover, 平台类型
- **出处**：`p6dof/platforms/simple-icbm-platform.txt:13-18`　（同签名共 16 处，另见 `p6dof/platforms/simple-icbm-platform.txt:20`、`p6dof/platforms/simple-icbm-platform.txt:27`、`p6dof/platforms/simple-icbm-platform.txt:34`）
- **片段**：

```text
platform_type ICBM_PLATFORM WSF_PLATFORM
   spatial_domain          air
   mover WSF_P6DOF_MOVER
      p6dof_object_type    SIMPLE-ICBM
   end_mover
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：spatial_domain, mover

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, radar_signature, weapon, 平台类型
- **出处**：`sensor_plot/radar/hm-bistatic-ft-jamming-lab.txt:45-50`　（同签名共 2 处，另见 `sensor_plot/radar/hm-bistatic-sp-jamming-lab.txt:29`）
- **片段**：

```text
platform_type TARGET_PLATFORM_TYPE WSF_PLATFORM
   radar_signature TARGET_RADAR_SIGNATURE
   weapon jammer JAMMER
      on
   end_weapon
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：radar_signature, weapon

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, weapon, off, 平台类型
- **出处**：`electronic_warfare/comm_jamming.txt:246-252`
- **片段**：

```text
platform_type JAMMER-TYPE WSF_PLATFORM
   // --- attach jammer
   weapon jammer SPOT_JAMMER
   //debug
   off
   end_weapon
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：weapon, off

### platform_type（pm6_performance_test）｜平台类型

- **关键词**：platform_type, update_interval, delete, 平台类型
- **出处**：`six_dof/pm6_performance_test.txt:36-42`　（同签名共 2 处，另见 `six_dof/rb6_performance_test.txt:36`）
- **片段**：

```text
platform_type MY_PLATFORM_TYPE FA-LGT_PM6
   # Force updates on the platform to test "worst-case" operation
   update_interval 0.01 sec
   
   # Remove the SA Processor for the performance tests
   delete processor sa_processor   
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：update_interval, delete

### platform_type（short_range_ir_missile）｜平台类型

- **关键词**：platform_type, comm, sensor, 平台类型
- **出处**：`air_to_air/weapons/aam/short_range_ir_missile.txt:221-228`　（同签名共 4 处，另见 `base_types/weapons/aam/blue_sr_a2a_ir_missile.txt:114`、`behavior_tree/weapons/aam/blue_sr_a2a_ir_missile.txt:117`、`brawler/weapons/aam/blue_sr_a2a_ir_missile.txt:119`）
- **片段**：

```text
platform_type SHORT_RANGE_IR_MISSILE SHORT_RANGE_IR_MISSILE_BASE
   comm uplink <comm-type>
      <comm-data>
   end_comm
   sensor seeker <sensor-type>
      <sensor-data>
   end_sensor
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：comm, sensor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, weapon_effects, processor, 平台类型
- **出处**：`cyber/avengers_detonate_effect.txt:17-24`
- **片段**：

```text
platform_type HULK WSF_PLATFORM
   weapon_effects ALWAYS_ANGRY
   
   processor fuse WSF_WEAPON_FUSE
      proximity_all_on_loss_of_target
      detonate_below_height_agl 1 m
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：weapon_effects, processor

### platform_type（demo_delta_iv_m）｜平台类型

- **关键词**：platform_type, script_variables, include, 平台类型
- **出处**：`space_operations/demo_delta_iv_m.txt:58-65`　（同签名共 2 处，另见 `space_operations/scenarios/launch.txt:19`）
- **片段**：

```text
platform_type DELTA_IV_M_MOD DELTA_IV_M
   script_variables  # Identify the satellite stage number and platform_type to 'launch_payload.txt'
      int mPayloadStage = 4;
      string mPayloadType = "SATELLITE";
   end_script_variables

   include scripts/launch_payload.txt
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：script_variables, include

### platform_type（cloud_attenuation）｜平台类型

- **关键词**：platform_type, icon, sensor, 平台类型
- **出处**：`space_operations/cloud_attenuation.txt:230-239`
- **片段**：

```text
platform_type GEODSS SSN_TELESCOPE
   icon ground_radar

   sensor geodss TELESCOPE
      on
      internal_link report
      elevation_error_sigma  0.00194 deg
      azimuth_error_sigma 0.00194 deg
   end_sensor
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：icon, sensor

### platform_type（lte_fighter）｜平台类型

- **关键词**：platform_type, icon, edit, 平台类型
- **出处**：`air_to_air/platforms/lte_fighter.txt:137-147`　（同签名共 3 处，另见 `air_to_air/platforms/lte_fighter.txt:248`、`air_to_air/platforms/lte_fighter.txt:359`）
- **片段**：

```text
platform_type RED_FIGHTER LTE_FIGHTER
 
   icon su27

   edit processor assessment
      enemy_side    blue
      enemy_type    BLUE_FIGHTER
      friendly_type RED_FIGHTER
      flight_id     202
   end_processor 
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：icon, edit

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, processor, multiresolution_sensor, 平台类型
- **出处**：`multiresolution_demos/sensor_demo.txt:46-56`
- **片段**：

```text
platform_type MR_SENSOR_SITE WSF_PLATFORM
   processor track_mgr WSF_TRACK_PROCESSOR
   end_processor
   
   processor image_proc WSF_IMAGE_PROCESSOR 
     internal_link track_mgr
   end_processor
   
   multiresolution_sensor mr_sensor MR_SENSOR
   end_multiresolution_sensor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：processor, multiresolution_sensor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, mover, sensor, 平台类型
- **出处**：`sensor_plot/sar/sc_bomber.txt:19-29`　（同签名共 10 处，另见 `sensor_plot/sar/sc_example.txt:19`、`sensor_plot/sar/sc_fighter.txt:19`、`sensor_plot/eoir/px_fighter.txt:19`）
- **片段**：

```text
platform_type BOMBER WSF_PLATFORM
   mover WSF_AIR_MOVER
   end_mover

   sensor sar BOMBER_SAR
      sar_constraint_plotting     true           ###### Required for SAR constraint plotting
      yaw   90 deg                               # <--- Spreadsheet value: Installed azimuth
      pitch -45 deg                              # <--- Spreadsheet value: Installed elevation
      backscatter_coefficient     -11.9 db       # <--- Spreadsheet value: Clutter backscatter
   end_sensor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：mover, sensor

### platform_type（delay_comms）｜平台类型

- **关键词**：platform_type, all, script, 平台类型
- **出处**：`cyber/cyber/cyber_effects/delay_comms.txt:14-25`
- **片段**：

```text
   platform_type SPOTTER
      all
            
      script   WsfCyberMitmMessage OnSend(WsfMessage aMessage)
         writeln("TIME NOW = ",TIME_NOW, " ",aMessage.Originator(), " TRYING TO SEND A MESSAGE");
         return WsfCyberMitmMessage.Construct(aMessage, 20, false);
      end_script
      
      script   WsfCyberMitmMessage OnReceive(WsfMessage aMessage)
         return WsfCyberMitmMessage.Construct(aMessage, 20, false);
      end_script
   end_platform_type
```

- **演示要点**：演示 platform_type 的参数：all, script

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, include, processor, 平台类型
- **出处**：`outer_air_battle/platforms/cvn.txt:14-27`
- **片段**：

```text
platform_type CVN WSF_PLATFORM

   # comm networks
   include platforms/blue_comm.txt


   processor task_mgr CVN_TASK_PROCESSOR

   end_processor

   processor data_mgr WSF_TRACK_PROCESSOR
   end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：include, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, mover, processor, 平台类型
- **出处**：`terrain_following/terrain_demo.txt:47-60`　（同签名共 3 处，另见 `space_operations/launch_vehicles/launcher_one/launcher_one_base.txt:93`、`script_demos/script_demo_1.txt:36`）
- **片段**：

```text
platform_type  TEST_AIR_MOVER  WSF_PLATFORM
   mover WSF_AIR_MOVER
     body_g_limit 4 g
     maximum_climb_rate 200 ft/s
   end_mover

   processor terrain_following TERRAIN_FOLLOWING
     script_variables
        COMMANDED_HEIGHT_ABOVE_TERRAIN = 300; # 300 meters
        #HEIGHT_TOLERANCE = 50;
     end_script_variables
   end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：mover, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, comm, processor, 平台类型
- **出处**：`orwaca_iads/scenarios/orwaca_cmdr_ew.txt:13-27`　（同签名共 9 处，另见 `orwaca_iads/scenarios/orwaca_cmdr_ew_full.txt:13`、`sensor_demos/passive_detector_demo.txt:97`、`sensor_demos/passive_detector_df_demo.txt:102`）
- **片段**：

```text
platform_type    stub_type       WSF_PLATFORM

   comm sub_net RED_DATALINK
      network_name <local:master>
      internal_link data_mgr
      internal_link task_mgr
   end_comm

   processor data_mgr IADS_CMDR_DATA_MGR
   end_processor

   processor task_mgr IADS_CMDR_TASK_MGR
      operating_level ENGAGE 1
   end_processor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：comm, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, processor, sensor, 平台类型
- **出处**：`multiresolution_demos/sensor_demo.txt:59-79`
- **片段**：

```text
platform_type GEOMETRIC_SENSOR_SITE WSF_PLATFORM
   processor track_mgr WSF_TRACK_PROCESSOR
   end_processor
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
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：processor, sensor

### platform_type（six_dof_range_endurance_test）｜平台类型

- **关键词**：platform_type, edit, on_update, 平台类型
- **出处**：`six_dof/six_dof_range_endurance_test.txt:84-106`
- **片段**：

```text
platform_type TEST_PLATFORM $<PLATFORM_TYPE:FA-LGT_PM6>$

   edit mover
      engines_on true
   end_mover

   on_update
      if(mData.Exists(Index()))
      {
         if(GetTotalFuelRemaining_lbs(PLATFORM) < bingoFuelQuantity_lbs)
         {
            DataStruct value = mData.Get(Index());
            value.flightTime_sec = TIME_NOW;
            value.flightRange_km = GetRangeSinceStart_km(PLATFORM);

            # Run has completed, therefore remove the platform, so that the
            # simulation will complete quicker
            DeletePlatform();
         }
      }
   end_on_update

end_platform_type
```

- **演示要点**：演示 platform_type 的参数：edit, on_update

### platform_type（complex_test）｜平台类型

- **关键词**：platform_type, edit, execute, 平台类型
- **出处**：`space_operations/launch_vehicles/saturn_v/complex_test.txt:29-54`　（同签名共 2 处，另见 `space_operations/launch_vehicles/saturn_v/simple_test.txt:28`）
- **片段**：

```text
platform_type SATURN_V_MOD SATURN_V
   edit mover
      #debug
      show_status
      #write_custom_time_history true
   end_mover

   edit processor guidance
      #debug
      show_status
      #show_commands
      #show_graphics
   end_processor

   # This is for comparing one point near MaxQ
   # 83.4 sec our time compares to 83.7 seconds of range time.
   # Range time of 0.3 sec corresponds to our 0.0 sec.
   execute at_time 83.4 sec relative
      writeln("***** T=", TIME_NOW - CreationTime() + 0.3,
         ", altitude=", Math.Floor(Altitude() + 0.5)," m",
         ", speed=", Math.Floor(Speed() * 10.0 + 0.5) * 0.1, " m/s",
         ", flight path angle=", Math.Floor(Pitch() * 100.0 + 0.5) * 0.01, " deg");
      writeln("  EXPECTED, altitude=13779 m, speed=505 m/s, flight path angle=51.70 deg");
   end_execute

end_platform_type
```

- **演示要点**：演示 platform_type 的参数：edit, execute

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, category, sensor, 平台类型
- **出处**：`satellite_demos/platforms/commander.txt:10-37`
- **片段**：

```text
platform_type COMMANDER WSF_PLATFORM

#   processor image_proc IMAGE_PROC
#   end_processor

   category commander

   sensor detect WSF_GEOMETRIC_SENSOR
      on
      reports_location
      frame_time 1 min
      azimuth_field_of_view -180 deg 180 deg
      elevation_field_of_view -90 deg 90 deg
      ignore sat_sensor
#      ignore iridium
   end_sensor

#   comm commander WSF_COMM_TRANSCEIVER
#     default_gateway
##     network_name commander1
##     internal_link image_proc
#  end_comm
#
#  processor router WSF_COMM_ROUTER
#     interface commander
#  end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：category, sensor

### platform_type（aam-sr-tvc）｜平台类型

- **关键词**：platform_type, mover, processor, 平台类型
- **出处**：`six_dof/platforms/aam-sr-tvc.txt:21-59`　（同签名共 5 处，另见 `six_dof/platforms/aam-sr.txt:68`、`six_dof/platforms/aam-sr.txt:21`、`six_dof/platforms/aam-sr-tvc.txt:61`）
- **片段**：

```text
platform_type  AAM-SR-TVC_RB6  AAM-SR-TVC

   # Setup the RB6 mover
   mover WSF_RIGID_BODY_SIX_DOF_MOVER
      vehicle_type     AAM-SR-TVC_RB6
      update_interval  0.001 sec
   end_mover
   
   processor guidance WSF_SIX_DOF_GUIDANCE_COMPUTER

      update_interval 0.01 sec

      phase LAUNCH_GUIDANCE
         time_constant                   0.5 sec
         proportional_navigation_gain    4
         velocity_pursuit_gain           10
         g_bias                          0
         #maximum_commanded_g             20 g
         next_phase PHASE2 when phase_time > 2.0 sec
      end_phase

      phase PHASE2
         time_constant                   0.01 sec
         proportional_navigation_gain    4
         velocity_pursuit_gain           10
         g_bias                          1
         next_phase TERMINAL_GUIDANCE when range_to_intercept < 2.0 km
      end_phase

      phase TERMINAL_GUIDANCE
         time_constant                   0.0 sec
         proportional_navigation_gain    2
         velocity_pursuit_gain           10
         g_bias                          1
      end_phase

   end_processor

end_platform_type
```

- **演示要点**：演示 platform_type 的参数：mover, processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, add, weapon, 平台类型
- **出处**：`hel/ground_hel_vs_hypersonic.txt:87-158`
- **片段**：

```text
platform_type HEL WSF_PLATFORM

   add processor targeting WSF_SCRIPT_PROCESSOR
     on
     update_interval 1.0 seconds

     script_variables
       WsfLaserWeapon mLaser = (WsfLaserWeapon)PLATFORM.Weapon("hel");
       double mFireTime = 0.0;         // The time at which to begin firing
       bool mLockonDelay = false;      // Whether we are waiting for lockon
       double mLockonDelayTime = 5.0;  // seconds
     end_script_variables

     script void FireAtTarget()

         WsfPlatform target = WsfSimulation.FindPlatform("hypersonic-1");

         if (target.IsValid())
         {
            WsfTrack track = target.MakeTrack();

            double groundRange = PLATFORM.GroundRangeTo(target);
            double slantRange = PLATFORM.SlantRangeTo(target);
            double elevation = MATH.ACos(groundRange / slantRange);

            if (elevation > 60.0)
            {
               if (mLockonDelay && (TIME_NOW >= mFireTime))
               {
                  writeln(TIME_NOW, ": firing, elevation: ", elevation);
                  writeln("Firing at target ", target.Name());
                  WsfPlatform target = WsfSimulation.FindPlatform("hypersonic-1");
                  if (! mLaser.IsFiring())
                  {
                     mLaser.Fire(target.Name(), "");
                  }
                  mLockonDelay = false;
               }
               else if ((! mLockonDelay) && (! mLaser.IsFiring()))
               {
                  writeln(TIME_NOW, ": Delaying ", mLockonDelayTime, " seconds to lock onto target.");
                  mLockonDelay = true;
                  mFireTime = TIME_NOW + mLockonDelayTime;
                  writeln("   will fire at time: ", mFireTime);
               }
            }
            else if (mLaser.IsFiring())
            {
               writeln(TIME_NOW, ": CeaseFire (elevation too low) ", elevation);
               mLaser.CeaseFire();
            }
         }
         else if (mLaser.IsFiring())
         {
            writeln(TIME_NOW, ": CeaseFire (target destroyed) ");
            mLaser.CeaseFire();
         }

         //PROCESSOR.TurnOff();
     end_script

     on_update
        FireAtTarget();
     end_on_update

   end_processor

   weapon hel HEL
      #debug
   end_weapon

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：add, weapon

### platform_type（stationary_storage_depot）｜平台类型

- **关键词**：platform_type, on_initialize2, execute, 平台类型
- **出处**：`logistics/platforms/stationary_storage_depot.txt:12-251`
- **片段**：

```text
platform_type STATIONARY_STORAGE_DEPOT LOGISTICS_PLATFORM

   # DESCRIPTION:  A stationary storage depot (SSD) sits stationary at an assigned location.
   # When a receiver approaches, and makes a request, the SSD generally will (most of the
   # time) have the commodity, but will have to go retrieve it, which takes some time.
   # The Depot may or may not have a limitless supply of the product, but if not, will
   # attempt to request a top-off of product to any supplier that happens to pass close
   # by, provided one is known.

   # NOTE:  Since this depot is stationary, it has no need of a Transport Processor, which
   # is a script variable reference in the parent LOGISTICS_PLATFORM class.  The reference
   # will never become valid, so don't use it here.

   # ==================================================
   on_initialize2

      bool success = LP_Init();

      if (success)
      {
         Say("STATIONARY_STORAGE_DEPOT on_initialize2() successful.");
         isInitialized = true;
      }
      else
      {
         Say("STATIONARY_STORAGE_DEPOT on_initialize2() FAILED.");
      }

   end_on_initialize2

   # ==================================================
   execute at_interval_of 207 sec

      if (isInitialized && ! allPlayersResolved)
      {
         allPlayersResolved = ResolvePlayersToAdd();
         if (! allPlayersResolved)
         {
            Say("STATIONARY_STORAGE_DEPOT has not yet resolved all players.");
            return;
         }
      }

      if (isInitialized && allPlayersResolved)
      {
         # An identified Receiver will stay a Receiver until another Receiver is 100 meters CLOSER than
         # the current receiver (which means the current receiver voluntarily departed my location.)

         double distToCurrent = 200.0;
         bool foundNewGuy = false;
         WsfPlatform closerGuy;

         #    ====== SUPPLY LOGIC (FUEL) ==========
         if (doIntendToSupplyFuel)
         {
            # Update a couple of critical flags:
            if (fuelContainer.IsEmpty() && haveFuelToGive)
            {
               string msg = "STATIONARY_STORAGE_DEPOT ran out of fuel to give.";
               Say(msg);
               PLATFORM.Comment(msg);
               haveFuelToGive = false;
               fuelIsReserved = false;
            }
            if (fuelContainer.IsFull() && ! haveFuelToGive)
            {
               string msg = "STATIONARY_STORAGE_DEPOT now has a full load of fuel to give.";
               Say(msg);
               PLATFORM.Comment(msg);
               haveFuelToGive = true;
            }
            else if (! fuelContainer.IsEmpty() && ! haveFuelToGive)
            {
               string msg = "STATIONARY_STORAGE_DEPOT has a partial load of fuel to give.";
               Say(msg);
               PLATFORM.Comment(msg);
               haveFuelToGive = true;
            }
            if (haveFuelToGive && ! fuelIsReserved)
            {
               fuelIsReserved = fuelOfferTransactor.ReserveAll();
               if (fuelIsReserved)
               {
                  string msg = "STATIONARY_STORAGE_DEPOT Fuel Reserve was successful.";
                  Say(msg);
                  PLATFORM.Comment(msg);
               }
               else
               {
                  string msg = "STATIONARY_STORAGE_DEPOT Fuel Reserve was NOT successful.";
                  Say(msg);
                  PLATFORM.Comment(msg);
               }
            }

            # === Resolve who to supply to....
            if (fuelRequestingPlatform.IsValid())
            {
               distToCurrent = PLATFORM.GroundRangeTo(fuelRequestingPlatform);
            }
            foreach(WsfPlatform plat in fuelPossibleReceivers)
            {
               if (plat.IsValid() && plat != fuelRequestingPlatform)
               {
                  double distToNew = PLATFORM.GroundRangeTo(plat);
                  if (distToNew + 100.0 < distToCurrent)
                  {
                     closerGuy = plat;
                     foundNewGuy = true;
                  }
               }
            }
            if (foundNewGuy)
            {
               SetFuelRequestingPlatform(closerGuy);
            }
         }

         #    ====== SUPPLY LOGIC (REPAIRS) ==========
         if (doIntendToSupplyRepair)
         {
            # Update a couple of critical flags:
            if (repairContainer.IsEmpty() && haveRepairsToGive)
            {
               string msg = "STATIONARY_STORAGE_DEPOT ran out of repairs to give.";
               Say(msg);
               PLATFORM.Comment(msg);
               haveRepairsToGive = false;
               repairsAreReserved = false;
            }
            if (repairContainer.IsFull() && ! haveRepairsToGive)
            {
               string msg = "STATIONARY_STORAGE_DEPOT now has a full load of repairs to give.";
               Say(msg);
               PLATFORM.Comment(msg);
               haveRepairsToGive = true;
            }
            else if (! repairContainer.IsEmpty() && ! haveRepairsToGive)
            {
               string msg = "STATIONARY_STORAGE_DEPOT has a partial load of repairs to give.";
               Say(msg);
               PLATFORM.Comment(msg);
               haveRepairsToGive = true;
            }
            if (haveRepairsToGive && ! repairsAreReserved)
            {
               repairsAreReserved = repairOfferTransactor.ReserveAll();
               if (repairsAreReserved)
               {
                  string msg = "STATIONARY_STORAGE_DEPOT Repairs Reserve was successful.";
                  Say(msg);
                  PLATFORM.Comment(msg);
               }
               else
               {
                  string msg = "STATIONARY_STORAGE_DEPOT Repairs Reserve was NOT successful.";
                  Say(msg);
                  PLATFORM.Comment(msg);
               }
            }

            distToCurrent = 200.0;
            foundNewGuy = false;

            # === Resolve who to supply to....
            if (repairRequestingPlatform.IsValid())
            {
               distToCurrent = PLATFORM.GroundRangeTo(repairRequestingPlatform);
            }
            foreach(WsfPlatform plat in repairPossibleReceivers)
            {
               if (plat.IsValid() && plat != repairRequestingPlatform)
               {
                  double distToNew = PLATFORM.GroundRangeTo(plat);
                  if (distToNew + 100.0 < distToCurrent)
                  {
                     closerGuy = plat;
                     foundNewGuy = true;
                  }
               }
            }
            if (foundNewGuy)
            {
               SetRepairRequestingPlatform(closerGuy);
            }
         }

         #    ====== REQUEST LOGIC (FUEL) ==========
         if (doIntendToReceiveFuel)
         {
            distToCurrent = 200.0;
            foundNewGuy = false;

            # === Resolve who to request from....
            if (fuelRequestingPlatform.IsValid())
            {
               distToCurrent = PLATFORM.GroundRangeTo(fuelRequestingPlatform);
            }
            foreach(WsfPlatform plat in fuelPossibleReceivers)
            {
               if (plat.IsValid() && plat != fuelRequestingPlatform)
               {
                  double distToNew = PLATFORM.GroundRangeTo(plat);
                  if (distToNew + 100.0 < distToCurrent)
                  {
                     closerGuy = plat;
                     foundNewGuy = true;
                  }
               }
            }
            if (foundNewGuy)
            {
               SetFuelRequestingPlatform(closerGuy);
            }

            if (FuelRequestingPlatform().IsValid() &&
                ! fuelContainer.IsFull() &&
                 fuelRequestTransactor.IsReady())
            {
               isRequestingFuel = fuelRequestTransactor.RequestFrom(FuelRequestingPlatform(),
                                     fuelRequestTransactor.Container().TenderNeeded());
               if (isRequestingFuel)
               {
                  string msg = "STATIONARY_STORAGE_DEPOT Fuel Request was successful.";
                  Say(msg);
                  PLATFORM.Comment(msg);
               }
               else
               {
                  string msg = "STATIONARY_STORAGE_DEPOT Fuel Request NOT successful.";
                  Say(msg);
                  PLATFORM.Comment(msg);
               }
            }
         }
      }

   end_execute

end_platform_type
```

- **演示要点**：演示 platform_type 的参数：on_initialize2, execute

### platform_type（1v1_initial_prediction）｜平台类型

- **关键词**：platform_type, side, 平台类型
- **出处**：`air_to_air/scenarios/1v1_initial_prediction.txt:311-313`
- **片段**：

```text
platform_type blue_maneuver_test blue_maneuver_target
   side blue
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：side

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, side, 平台类型
- **出处**：`base_types/weapons/ssm/red_icbm_2_lcg.txt:21-23`
- **片段**：

```text
platform_type TARGET_PLATFORM_TYPE WSF_PLATFORM
   side blue
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：side

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, radar_signature, 平台类型
- **出处**：`iads/sensors/radar/acq_radar_vcd.txt:15-17`　（同签名共 19 处，另见 `iads/sensors/radar/ew_radar_vcd.txt:15`、`iads/sensors/radar/ttr_radar_vcd.txt:15`、`orwaca_iads/sensors/radar/elr_sam_acq_radar_sensor_vcd.txt:15`）
- **片段**：

```text
platform_type TARGET_PLATFORM_TYPE WSF_PLATFORM
   radar_signature TARGET_RADAR_SIG
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：radar_signature

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, sensor, 平台类型
- **出处**：`iads/sensors/radar/acq_radar_vcd.txt:19-21`　（同签名共 12 处，另见 `iads/sensors/radar/ew_radar_vcd.txt:19`、`iads/sensors/radar/ttr_radar_vcd.txt:19`、`orwaca_iads/sensors/radar/elr_sam_acq_radar_sensor_vcd.txt:19`）
- **片段**：

```text
platform_type SENSOR_PLATFORM_TYPE WSF_PLATFORM
   sensor sensor ACQ_RADAR end_sensor
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：sensor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, add, 平台类型
- **出处**：`space_operations/launch_vehicles/falcon_heavy/lcg_ccafs_leo.txt:16-18`　（同签名共 14 处，另见 `space_operations/launch_vehicles/atlas_v_401/lcg_ccafs_leo.txt:16`、`space_operations/launch_vehicles/atlas_v_401/tune.txt:15`、`space_operations/launch_vehicles/delta_iv_m/lcg_ccafs_leo.txt:16`）
- **片段**：

```text
platform_type FALCON_HEAVY_LAUNCHER WSF_PLATFORM
   add weapon rocket FALCON_HEAVY end_weapon
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：add

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, mover, 平台类型
- **出处**：`outer_air_battle/scenarios/temp_platforms.txt:11-13`　（同签名共 3 处，另见 `multiresolution_demos/sensor_demo.txt:106`、`shooter/platforms/air_target.txt:9`）
- **片段**：

```text
platform_type FOO WSF_PLATFORM
   mover WSF_AIR_MOVER end_mover
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：mover

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, icon, 平台类型
- **出处**：`new_guidance/scenarios/blue_multirole_fighter_1_launch.txt:23-25`　（同签名共 5 处，另见 `new_guidance/scenarios/blue_multirole_fighter_1_launch_blue_asm_missile.txt:21`、`orwaca_iads/scenarios/tbm_route_and_launch.txt:10`、`sensor_demos/nav_demo.txt:40`）
- **片段**：

```text
platform_type TARGET WSF_PLATFORM
   icon C4I
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：icon

### platform_type（lte_fighter）｜平台类型

- **关键词**：platform_type, icon, 平台类型
- **出处**：`six_dof_with_brawler/platforms/lte_fighter.txt:46-48`　（同签名共 2 处，另见 `six_dof_with_brawler/platforms/lte_fighter.txt:63`）
- **片段**：

```text
platform_type RED_FIGHTER LTE_FIGHTER 
   icon su27
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：icon

### platform_type（simple_a2a_missile）｜平台类型

- **关键词**：platform_type, category, 平台类型
- **出处**：`base_types/weapons/aam/simple_a2a_missile.txt:14-17`
- **片段**：

```text
platform_type SIMPLE_A2A_MISSILE BLUE_SR_A2A_IR_MISSILE_BASE
	// max speed about 850 m/s according to Wikipedia (mach 2.5)
   category ignored-by-iads-radar
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：category

### platform_type（fires_220mm_rocket_9m27f）｜平台类型

- **关键词**：platform_type, weapon, 平台类型
- **出处**：`fires/types/fires_220mm_rocket_9m27f.txt:80-83`　（同签名共 24 处，另见 `fires/types/fires_220mm_rocket_9m27f.txt:85`、`fires/types/fires_227mm_rocket_m26.txt:77`、`fires/types/fires_227mm_rocket_m26.txt:82`）
- **片段**：

```text
platform_type FIRES_220MM_ROCKET_9M27F_EXPLICIT_LAUNCHER FIRES_LAUNCHER
   weapon fires_220MM_ROCKET_9M27F FIRES_220MM_ROCKET_9M27F_EXPLICIT
   end_weapon
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：weapon

### platform_type（comm_demo）｜平台类型

- **关键词**：platform_type, comm, 平台类型
- **出处**：`multiresolution_demos/comm_demo.txt:79-82`
- **片段**：

```text
platform_type SENDER SENDER_BASE
   comm cmdr_comm TEAM_DATALINK
   end_comm
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：comm

### platform_type（fuel_demo）｜平台类型

- **关键词**：platform_type, multiresolution_fuel, 平台类型
- **出处**：`multiresolution_demos/fuel_demo.txt:46-49`
- **片段**：

```text
platform_type MR_FUEL_FIGHTER SIMPLE_FIGHTER
   multiresolution_fuel MR_FUEL
   end_multiresolution_fuel
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：multiresolution_fuel

### platform_type（performance_test）｜平台类型

- **关键词**：platform_type, update_interval, 平台类型
- **出处**：`p6dof/performance_test.txt:36-39`
- **片段**：

```text
platform_type MY_PLATFORM_TYPE FA-LGT
   # Force updates on the platform to test "worst-case" operation
   update_interval 0.01 sec
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：update_interval

### platform_type（brawler_demo_combined_agent_BVR_8v16）｜平台类型

- **关键词**：platform_type, edit, 平台类型
- **出处**：`brawler/brawler_demo_combined_agent_BVR_8v16.txt:359-363`　（同签名共 20 处，另见 `brawler/brawler_demo_combined_agent_BVR_8v16_close.txt:194`、`brawler/brawler_demo_combined_agent_BVR_8v16_no_gci.txt:312`、`air_to_air/platforms/lte_fighter.txt:239`）
- **片段**：

```text
platform_type RED_COMBINED_PLATFORM_B RED_COMBINED_PLATFORM
   edit mover
      aero_file platforms/ACFT_BAC1.FXW
   end_mover
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：edit

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, weapon, 平台类型
- **出处**：`sensor_plot/radar/hm-bistatic-support-jamming-lab.txt:33-37`　（同签名共 5 处，另见 `air_to_air/weapons/aam/short_range_ir_missile.txt:230`、`base_types/weapons/aam/blue_sr_a2a_ir_missile.txt:123`、`behavior_tree/weapons/aam/blue_sr_a2a_ir_missile.txt:126`）
- **片段**：

```text
platform_type JAMMER_PLATFORM_TYPE WSF_PLATFORM
   weapon jammer JAMMER
      on
   end_weapon
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：weapon

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, cyber_constraint, 平台类型
- **出处**：`cyber/GoneFishing_ConstraintDemo.txt:162-166`
- **片段**：

```text
platform_type FISHERMAN WSF_PLATFORM
   cyber_constraint WSF_CYBER_CONSTRAINT 
      resources 5.0
   end_cyber_constraint
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：cyber_constraint

### platform_type（gci_ripr）｜平台类型

- **关键词**：platform_type, processor, 平台类型
- **出处**：`base_types/platforms/gci_ripr.txt:16-21`　（同签名共 4 处，另见 `sensor_plot/esm/hm-tdoa.txt:71`、`gun_engagement/weapons/guns/BULLET_buildertool.txt:9`、`base_types/platforms/flight_lead_ripr.txt:16`）
- **片段**：

```text
platform_type GCI GCI_BASE

   processor gci-thinker AIGCI-thinker
   end_processor

end_platform_type
```

- **演示要点**：演示 platform_type 的参数：processor

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, on_initialize2, 平台类型
- **出处**：`chaff/chaff_example_ttr.txt:12-20`　（同签名共 2 处，另见 `chaff/chaff_example.txt:13`）
- **片段**：

```text
platform_type CHAFF WSF_PLATFORM
   on_initialize2
      string domain = WsfSimulation.FindPlatform("blue_airlifter_jet").SpatialDomain();
      if (SpatialDomain() != domain)
      {
         writeln("-FAIL- Platform: ", Name(), "; unexpected spatial domain: ", SpatialDomain(), ", expected: ", domain);
      }
   end_on_initialize2
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：on_initialize2

### platform_type（lrm-1-a）｜平台类型

- **关键词**：platform_type, mover, 平台类型
- **出处**：`six_dof/platforms/lrm-1-a.txt:21-29`　（同签名共 12 处，另见 `six_dof/platforms/lrm-1-a.txt:31`、`six_dof/platforms/ubu-500-hd.txt:34`、`six_dof/platforms/ubu-500-hd.txt:44`）
- **片段**：

```text
platform_type  LRM-1-A_RB6  LRM-1-A

   # Setup the RB6 mover
   mover WSF_RIGID_BODY_SIX_DOF_MOVER
      vehicle_type      LRM-1-A_RB6
      update_interval   0.01 sec
   end_mover   
   
end_platform_type
```

- **演示要点**：演示 platform_type 的参数：mover

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, processor, 平台类型
- **出处**：`base_types/platforms/gci_base.txt:11-31`　（同签名共 3 处，另见 `laser_designator/test.txt:16`、`base_types/platforms/flight_lead_base.txt:12`）
- **片段**：

```text
platform_type GCI_BASE WSF_PLATFORM


   processor track_manager WSF_TRACK_PROCESSOR
      //debug
      purge_interval 60 seconds

      //report_to commander via cmdr_net
      report_to subordinates via sub_net

      //Only report fused tracks to entities that won't transmit tracks back.
      //report_interval      20 sec

      report_interval      4 sec

      fused_track_reporting off
      raw_track_reporting on

   end_processor

end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM 的参数：processor

### platform_type（cmdr_players）｜平台类型

- **关键词**：platform_type, 平台类型
- **出处**：`aea_iads/platforms/cmdr_players.txt:18-19`　（同签名共 20 处，另见 `base_types/weapons/sam/blue_lr_sam_simple.txt:32`、`base_types/weapons/sam/blue_sr_sam_simple.txt:32`、`cyber/exfiltrate_demo/platforms/cmdr_players.txt:18`）
- **片段**：

```text
platform_type RADAR_COMPANY RED_RADAR_COMPANY
end_platform_type
```

- **演示要点**：演示 platform_type（最小结构，无子参数）

### platform_type · WSF_PLATFORM｜平台类型

- **关键词**：platform_type, WSF_PLATFORM, 平台类型
- **出处**：`hel/hel_test.txt:218-219`　（同签名共 7 处，另见 `noise_cloud/noise_cloud.txt:10`、`sosm/sensor_plot/common_types.txt:27`、`sosm/sensor_plot/test.txt:27`）
- **片段**：

```text
platform_type RED_ADV_FIGHTER_2 WSF_PLATFORM
end_platform_type
```

- **演示要点**：演示 WSF_PLATFORM（最小结构，无子参数）

### route（agile_auto-repeater_jamming）｜航路

- **关键词**：route, position, altitude, speed, heading, 航路
- **出处**：`electronic_warfare/agile_auto-repeater_jamming.txt:303-308`　（同签名共 101 处，另见 `electronic_warfare/agile_auto-repeater_jamming.txt:331`、`electronic_warfare/agile_auto-repeater_jamming.txt:342`、`electronic_warfare/agile_jamming.txt:366`）
- **片段**：

```text
   route
      position 37:00:00n 114:30:00w
      altitude 35000 ft
      speed      450 kts
      heading    270 deg
   end_route
```

- **演示要点**：演示 route 的参数：position, altitude, speed, heading

### route（kinematic_mover_demo）｜航路

- **关键词**：route, label, position, speed, goto, 航路
- **出处**：`kinematic_mover/kinematic_mover_demo.txt:204-223`　（同签名共 2 处，另见 `kinematic_mover/kinematic_mover_demo.txt:168`）
- **片段**：

```text
   route
    label begin
    position 34:00:05.33n 83:12:52.77w altitude 32808.40 ft
    speed 200 kts
    position 33:59:41.20n 83:13:13.35w altitude 29527.56 ft
    speed 210 kts
    position 34:00:08.68n 83:13:48.07w altitude 25965.88 ft
    speed 180 kts
    position 34:01:59.96n 83:14:13.03w altitude 25685.04 ft
    speed 210 kts
    position 34:01:48.43n 83:15:27.17w altitude 23246.72 ft
    position 34:02:22.51n 83:14:31.62w altitude 24685.04 ft speed 300 kts
    position 34:02:19.52n 83:13:47.29w altitude 26246.72 ft
    speed 200 kts
    position 34:00:21.31n 83:13:33.54w altitude 22685.04 ft
    speed 210 kts
    position 34:02:32.03n 83:13:07.49w altitude 29685.04 ft
    speed 200 kts
    goto begin
  end_route
```

- **演示要点**：演示 route 的参数：label, position, speed, goto

### route（bomb_demo_laydown）｜航路

- **关键词**：route, position, speed, radial_acceleration, stop, 航路
- **出处**：`suppressor/bomb_demo_laydown.txt:135-161`　（同签名共 2 处，另见 `suppressor/bomb_demo_laydown.txt:184`）
- **片段**：

```text
  route
    position 33:35:06.9n  34:55:14.1e  altitude 1200 m agl
      speed 235 m/s
      radial_acceleration 1.13 g
    position 33:35:19.5n  35:27:37.0e  altitude 1200 m agl
      speed 235 m/s
      radial_acceleration 1.13 g
    position 33:38:05.4n  35:53:31.2e  altitude 1200 m agl
      speed 235 m/s
      radial_acceleration 1.13 g
    position 33:35:23.7n  36:00:00.0e  altitude 1200 m agl
      speed 235 m/s
      radial_acceleration 1.13 g
    position 33:35:39.5n  36:09:43.0e  altitude 1200 m agl
      speed 235 m/s
      radial_acceleration 1.13 g
    position 33:35:39.2n  36:12:57.3e  altitude 2200 m agl
      speed 235 m/s
      radial_acceleration 1.13 g
    position 33:38:05.4n  35:53:31.2e  altitude 1200 m agl
      speed 235 m/s
      radial_acceleration 1.13 g
    position 33:35:06.9n  34:55:14.1e  altitude 1200 m agl
      speed 235 m/s
      radial_acceleration 1.13 g
      stop
  end_route
```

- **演示要点**：演示 route 的参数：position, speed, radial_acceleration, stop

### route（uav）｜航路

- **关键词**：route, position, speed, radial_acceleration, 航路
- **出处**：`coverage_demos/scenarios/uav.txt:13-17`
- **片段**：

```text
   route
      position 38:45:00.000n 106:35:00.000w altitude 45931.76 ft msl
      speed 120 nm/h
      radial_acceleration 0.22 m/s2      
   end_route
```

- **演示要点**：演示 route 的参数：position, speed, radial_acceleration

### route（agile_auto-repeater_jamming）｜航路

- **关键词**：route, position, altitude, heading, 航路
- **出处**：`electronic_warfare/agile_auto-repeater_jamming.txt:318-322`　（同签名共 39 处，另见 `electronic_warfare/agile_jamming.txt:380`、`electronic_warfare/agile_repeater_jamming-rt1.txt:420`、`electronic_warfare/agile_repeater_jamming-rt2.txt:420`）
- **片段**：

```text
   route
      position 37:00:00n 116:00:00w
      altitude 0.0 ft agl
      heading   90 deg
    end_route
```

- **演示要点**：演示 route 的参数：position, altitude, heading

### route（track_error）｜航路

- **关键词**：route, position, linear_acceleration, speed, 航路
- **出处**：`electronic_warfare/track_error.txt:356-361`　（同签名共 2 处，另见 `launcher/scenarios/scenario1.txt:13`）
- **片段**：

```text
   route
    position 34:42:32n 76:52:56w altitude 4000 ft msl
      linear_acceleration 0.20 g
    position 36:03:28n 75:47:28w altitude 5000 ft msl
      speed 175 kts
   end_route
```

- **演示要点**：演示 route 的参数：position, linear_acceleration, speed

### route（bombers）｜航路

- **关键词**：route, position, speed, pause_time, 航路
- **出处**：`outer_air_battle/scenarios/bombers.txt:16-21`　（同签名共 2 处，另见 `outer_air_battle/scenarios/bombers.txt:31`）
- **片段**：

```text
  route
    position 10:20:29.55n 12:40:30.75w altitude 40000.00 ft
    speed 400 kts
    pause_time 30 minutes
    position 00:00:00.00n 30:00:00.00w altitude 40000.00 ft
  end_route
```

- **演示要点**：演示 route 的参数：position, speed, pause_time

### route（detector）｜航路

- **关键词**：route, label, offset, goto, 航路
- **出处**：`comm/platforms/detector.txt:10-16`　（同签名共 3 处，另见 `traffic_demos/scenarios/west_coast_sea_traffic.txt:170`、`traffic_demos/scenarios/west_coast_sea_traffic.txt:181`）
- **片段**：

```text
route detector_route
   label start offset 0 5 km speed 200 km/h  
   offset -5 0 km   
   offset 0 -5 km  
   offset 5 0 km
   goto start
end_route
```

- **演示要点**：演示 route 的参数：label, offset, goto

### route（alv_demo）｜航路

- **关键词**：route, label, position, goto, 航路
- **出处**：`alv_routing/alv_demo.txt:60-67`　（同签名共 50 处，另见 `alv_routing/alv_demo_with_jammer.txt:63`、`bearing_only/scenarios/bearing_sensors_net.txt:13`、`heatmap/scenarios/red_laydown.txt:19`）
- **片段**：

```text
   route
      label awacs_loiter
      position 41:34:32.15n 89:12:49.08w altitude 35000.00 ft speed 450 kts
      position 42:34:31.97n 89:13:40.29w
      position 42:34:32.11n 88:42:27.79w
      position 41:34:32.11n 88:42:28.54w
      goto awacs_loiter
   end_route
```

- **演示要点**：演示 route 的参数：label, position, goto

### route（routes）｜航路

- **关键词**：route, position, speed, stop, 航路
- **出处**：`logistics/statics_and_globals/routes.txt:31-39`　（同签名共 2 处，另见 `logistics/statics_and_globals/routes.txt:41`）
- **片段**：

```text
route KeyWestPierFuelDepotToKeyWestAirportRoute
   position 24.56709n 81.79592w # Fleming Key Cut, KW, Fl (Tanker Mooring Pier)
   speed 10000 m/s
   position 24:33:48.3345n 81:47:47.58104w
   position 24:33:40.6185n 81:46:54.34149w
   position 24:33:06.9143n 81:46:10.76554w
   position 24.5515n 81.7594w # Slightly south of Key West Intl Airport
   stop
end_route
```

- **演示要点**：演示 route 的参数：position, speed, stop

### route（osm_roadnetwork）｜航路

- **关键词**：route, name, navigation, aux_data, 航路
- **出处**：`traffic_demos/roads/osm_roadnetwork.txt:14-26`　（同签名共 8 处，另见 `traffic_demos/roads/osm_roadnetwork.txt:59`、`traffic_demos/roads/osm_roadnetwork.txt:125`、`traffic_demos/roads/osm_roadnetwork.txt:141`）
- **片段**：

```text
   route
      name North_Rural_St
      navigation
         position 39.219389n 86.5141197w
            node_id 180609922
         position 39.2211938n 86.5141739w
            node_id 180609925
      end_navigation
      aux_data
         string highway = "residential"
         unitary maxspeed = 35 mph
      end_aux_data
   end_route
```

- **演示要点**：演示 route 的参数：name, navigation, aux_data

### route（strike_cali_merged_targets_cali）｜航路

- **关键词**：route, navigation, position, speed, 航路
- **出处**：`iads/scenarios/strike_cali_merged_targets_cali.txt:49-62`　（同签名共 2 处，另见 `iads/scenarios/strike_cali_merged_targets_cali.txt:74`）
- **片段**：

```text
   route
      navigation
      position 33:03:36.000n 122:08:00.000w altitude 5.76 nm msl
         speed 460 kts
      position 34:27:24.076n 121:00:56.411w altitude 5.76 nm msl
         speed 460 kts
      position 35:46:11.936n 120:38:50.636w altitude 5.76 nm msl
         speed 460 kts
      position 35:48:48.000n 120:25:36.000w altitude 5.76 nm msl
         speed 460 kts
     position 33:06:00.000n 121:32:00.000w altitude 5.76 nm msl
       speed 460 kts
      end_navigation
   end_route
```

- **演示要点**：演示 route 的参数：navigation, position, speed

### route（kinematic_mover_demo）｜航路

- **关键词**：route, label, position, go_to, 航路
- **出处**：`kinematic_mover/kinematic_mover_demo.txt:90-103`
- **片段**：

```text
    route
        label begin
        position 33:54:44.51n 83:20:16.78w altitude 32808.40 ft speed 200 kts
        position 33:54:20.38n 83:20:36.86w altitude 29527.56 ft speed 210 kts
        position 33:54:47.86n 83:21:11.54w altitude 25965.88 ft  speed 180 kts
        position 33:56:39.14n 83:21:36.47w altitude 25685.04 ft  speed 210 kts
        position 33:56:27.61n 83:22:50.54w altitude 23246.72 ft
        position 33:57:01.69n 83:21:55.05w altitude 24685.04 ft  speed 300 kts
        position 33:56:58.70n 83:21:10.76w altitude 26246.72 ft speed 200 kts
        position 33:55:00.49n 83:20:57.03w altitude 22685.04 ft speed 210 kts
        position 33:57:11.21n 83:20:31.00w altitude 29685.04 ft speed 200 kts
        go_to begin

     end_route
```

- **演示要点**：演示 route 的参数：label, position, go_to

### route（draw_demo）｜航路

- **关键词**：route, position, speed, climb_rate, 航路
- **出处**：`draw/draw_demo.txt:156-170`
- **片段**：

```text
  route
    position 31:17:38.0n 45:13:54.9e altitude 500.00 ft agl
      speed 250 kts
      climb_rate 41 ft/s
    position 31:18:30.4n 45:13:53.8e altitude 500.00 ft agl
      speed 270 kts
      climb_rate 107 ft/s
    position 31:18:49.30n 45:13:44.80e altitude 1000.00 ft agl
      speed 300 kts
      climb_rate 410 ft/s
    position 31:19:26.4n 45:13:18.6e altitude 10000.00 ft agl
      speed 310 kts
    position 31:23:55.2n 45:09:46.4e altitude 10000.00 ft agl
      speed 330 kts
  end_route
```

- **演示要点**：演示 route 的参数：position, speed, climb_rate

### route（parachute_example2）｜航路

- **关键词**：route, position, heading, speed, 航路
- **出处**：`parachute/parachute_example2.txt:74-88`
- **片段**：

```text
   route
      position   40:00:00.00n   88:00:00.00w altitude 40000.00 ft
      heading 270.00 deg speed 500 kts
      position   40:01:40.75n   88:00:53.11w altitude 40000.00 ft
      speed 500 kts
      heading 0.00 deg
      position   40:01:36.70n   88:03:14.41w altitude 40000.00 ft
      speed 500 kts
      position   39:59:51.27n   88:03:48.20w altitude 40000.00 ft
      speed 500 kts
      position   39:59:07.31n   88:01:43.43w altitude 40000.00 ft
      speed 500 kts
      position   39:59:56.15n   88:00:07.87w altitude 40000.00 ft
      speed 500 kts
   end_route
```

- **演示要点**：演示 route 的参数：position, heading, speed

### route（GoneFishing_ConstraintDemo）｜航路

- **关键词**：route, position, speed, 航路
- **出处**：`cyber/GoneFishing_ConstraintDemo.txt:221-224`　（同签名共 41 处，另见 `cyber/GoneFishing_ConstraintDemo.txt:228`、`cyber/GoneFishing_ConstraintDemo.txt:235`、`cyber/GoneFishing_ConstraintDemo.txt:242`）
- **片段**：

```text
   route
      position 28.25n 86.10w altitude 5000.0 m 
      speed 35 m/s
   end_route
```

- **演示要点**：演示 route 的参数：position, speed

### route（blue_laydown）｜航路

- **关键词**：route, position, insert_route, 航路
- **出处**：`heatmap/scenarios/blue_laydown.txt:73-76`　（同签名共 16 处，另见 `heatmap/scenarios/blue_laydown.txt:92`、`timeline/scenarios/red_dca.txt:46`、`timeline/scenarios/red_dca.txt:58`）
- **片段**：

```text
  route
     position 16:27:39.99s 49:33:47.67e altitude 35000.00 ft
     insert_route cap_orbit reference_heading 180.0 deg
  end_route
```

- **演示要点**：演示 route 的参数：position, insert_route

### route（air_interceptor）｜航路

- **关键词**：route, position, transform_route, 航路
- **出处**：`iads_c2_demos/scenarios/air_interceptor.txt:28-31`
- **片段**：

```text
   route
      position 38:00:00n 117:15:00w altitude 30000 ft msl speed 580 kts
      transform_route cap_orbit reference_heading 0.0 deg
   end_route
```

- **演示要点**：演示 route 的参数：position, transform_route

### route（blue_multirole_fighter_1_launch）｜航路

- **关键词**：route, position, heading, 航路
- **出处**：`new_guidance/scenarios/blue_multirole_fighter_1_launch.txt:34-37`
- **片段**：

```text
   route
     position 42:12:24.0n 87:40:48.0w altitude 7620 m speed 200 kts
     heading 187 deg
   end_route
```

- **演示要点**：演示 route 的参数：position, heading

### route（othTest）｜航路

- **关键词**：route, position, extrapolate, 航路
- **出处**：`oth_radar/othTest.txt:126-129`　（同签名共 6 处，另见 `oth_radar/othTest.txt:152`、`space_operations/scenarios/over_the_horizon_radar.txt:125`、`space_operations/scenarios/over_the_horizon_radar.txt:151`）
- **片段**：

```text
  route
    position 11n 127w altitude 35 kft msl heading 0 deg speed 450 kts
    extrapolate
  end_route
```

- **演示要点**：演示 route 的参数：position, extrapolate

### route（target_type）｜航路

- **关键词**：route, position, stop, 航路
- **出处**：`hellfire/active_radar_hellfire/target_type.txt:34-38`　（同签名共 10 处，另见 `hellfire/laser_designation_via_dis/target_type.txt:34`、`hellfire/semiactive_laser_hellfire/target_type.txt:34`、`logistics/statics_and_globals/routes.txt:17`）
- **片段**：

```text
      route
         position 39:09:29.8n 106:51:10.9w speed 10 km/hr
         position 39:10:35.0n 106:50:44.8w
         stop
      end_route
```

- **演示要点**：演示 route 的参数：position, stop

### route（avengers_detonate_effect）｜航路

- **关键词**：route, speed, altitude, 航路
- **出处**：`cyber/avengers_detonate_effect.txt:34-39`
- **片段**：

```text
      route 
      position 40:42:46.080n 74:00:21.600w altitude 32808.40 ft msl
         speed 50 m/s 
      position 41:02:05.979n 71:50:38.476w
         altitude 32808.40 ft 
      end_route
```

- **演示要点**：演示 route 的参数：speed, altitude

### route（blue_uav）｜航路

- **关键词**：route, label, goto, 航路
- **出处**：`laser_designator/scenarios/blue_uav.txt:14-19`　（同签名共 7 处，另见 `iads_c2_demos/scenarios/air_interceptor.txt:14`、`timeline_lead/scenarios/full_laydown.txt:111`、`electronic_warfare/test_false_targets/platforms/soj.txt:277`）
- **片段**：

```text
  route
     label Loiter_Cap
        position 45:02:19.22n 121:38:40.13w altitude 5000 ft agl speed 150 knots
        position 45:03:19.22n 121:38:40.13w altitude 5000 ft agl speed 150 knots
     goto Loiter_Cap
  end_route
```

- **演示要点**：演示 route 的参数：label, goto

### route（grid_w_offsetroute）｜航路

- **关键词**：route, offset, radial_acceleration, 航路
- **出处**：`engage/grid_w_offsetroute.txt:127-132`
- **片段**：

```text
      route
        offset  5 0 km speed 262 kts altitude 30 kft msl
        radial_acceleration 2 g
        offset  0 2000 km speed 262 kts altitude 30 kft msl
        radial_acceleration 2 g
      end_route
```

- **演示要点**：演示 route 的参数：offset, radial_acceleration

### route（script_demo_4）｜航路

- **关键词**：route, position, execute, 航路
- **出处**：`script_demos/script_demo_4.txt:102-108`
- **片段**：

```text
   route
      // Take off
      position 38:44:52.3n 90:21:36.4w altitude 6 ft agl speed 10 kts
      position 38:45:07.6n 90:22:09.4w altitude 6 ft agl speed 120 kts # climb_rate 1000 fpm
      position 39:00:00.0n 91:00:00.0w altitude 20000 ft speed 400 kts
      execute start_maneuvering_cb
   end_route
```

- **演示要点**：演示 route 的参数：position, execute

### route（china_roadnetwork）｜航路

- **关键词**：route, position, node_id, 航路
- **出处**：`traffic_demos/roads/china_roadnetwork.txt:61-67`　（同签名共 1481 处，另见 `traffic_demos/roads/china_roadnetwork.txt:653`、`traffic_demos/roads/china_roadnetwork.txt:660`、`traffic_demos/roads/china_roadnetwork.txt:801`）
- **片段**：

```text
  route
    # zone roadl_2
    position 36:42:50.306n 119:05:28.107e
      node_id 4247_/v/j/
    position 36:42:24.901n 119:05:58.209e
      node_id 4252_/v/j/
  end_route
```

- **演示要点**：演示 route 的参数：position, node_id

### route（ucav）｜航路

- **关键词**：route, offset, speed, 航路
- **出处**：`alternate_locations/platforms/ucav.txt:37-45`
- **片段**：

```text
   route
      offset 0 0 nm altitude 35000 ft
      speed 480 kts
      offset 133 0 nm altitude 35000.00 ft
      offset 11 15 nm altitude 35000.00 ft
      offset 0 15 nm altitude 35000.00 ft
      offset -11 15 nm altitude 35000.00 ft
      offset -133 0 nm altitude 35000.00 ft
   end_route
```

- **演示要点**：演示 route 的参数：offset, speed

### route（airport_operations）｜航路

- **关键词**：route, label, position, 航路
- **出处**：`p6dof/airport_operations.txt:39-48`　（同签名共 56 处，另见 `six_dof/rb6_airport_operations.txt:39`、`wargame/scenario/laydowns/red.txt:80`、`outer_air_battle/scenarios/routes_2.txt:61`）
- **片段**：

```text
route TaxiRoute
   label TaxiRouteStart
   position   47.43858n  122.31539w  altitude 342.0 ft  speed 7.0 kts
   position   47.43870n  122.31518w  altitude 342.0 ft  speed 7.0 kts
   position   47.43871n  122.31386w  altitude 342.0 ft  speed 7.0 kts
   position   47.43843n  122.31359w  altitude 342.0 ft  speed 7.0 kts
   position   47.43823n  122.31327w  altitude 342.0 ft  speed 7.0 kts
   position   47.43809n  122.31286w  altitude 342.0 ft  speed 7.0 kts
   position   47.43808n  122.31246w  altitude 342.0 ft  speed 7.0 kts
end_route
```

- **演示要点**：演示 route 的参数：label, position

### route（chaff_example）｜航路

- **关键词**：route, position, 航路
- **出处**：`chaff/chaff_example.txt:93-95`　（同签名共 348 处，另见 `chaff/chaff_example_ttr.txt:102`、`comm/group_comm_example.txt:105`、`comm/group_comm_example.txt:148`）
- **片段**：

```text
   route
      position 47:31:42n 120:42:35w altitude 30000 ft speed 200 kts
   end_route
```

- **演示要点**：演示 route 的参数：position

### route（ttr_test）｜航路

- **关键词**：route, navigation, 航路
- **出处**：`iads/ttr_test.txt:115-119`　（同签名共 27 处，另见 `aea_iads/scenarios/strike.txt:114`、`aea_iads/scenarios/strike.txt:128`、`aea_iads/scenarios/strike.txt:142`）
- **片段**：

```text
   route
     navigation
        position 40:00:00n 89:00:00w altitude 35000 ft heading 270 deg speed 400 kts
     end_navigation
   end_route
```

- **演示要点**：演示 route 的参数：navigation

### route（asm_tactics）｜航路

- **关键词**：route, label, 航路
- **出处**：`ship_ad/weapons/agm/asm_tactics.txt:87-91`
- **片段**：

```text
route ASM_DUMMY
   label start
      offset 0 0 km speed 306 m/s altitude 50.0 m msl
      offset 1 0 km speed 306 m/s altitude 50.0 m msl
end_route
```

- **演示要点**：演示 route 的参数：label

### route（scenario_route_finder_orbit）｜航路

- **关键词**：route, speed, 航路
- **出处**：`example_scripts/scenario_route_finder_orbit.txt:16-21`
- **片段**：

```text
  route
  position 00.31532n 00.73940e altitude 10000 ft msl
     speed 50 knots
  position 0.315n 1.2e
  position 1.0n 1.2e
  end_route
```

- **演示要点**：演示 route 的参数：speed

### route（group_comm_example）｜航路

- **关键词**：route, 航路
- **出处**：`comm/group_comm_example.txt:128-130`　（同签名共 137 处，另见 `traffic_demos/roads/china_expressways.txt:6704`、`traffic_demos/roads/china_expressways.txt:11377`、`traffic_demos/roads/china_expressways.txt:11388`）
- **片段**：

```text
   route
         position 0n 0e altitude 10 kft heading 0 deg speed 700 kts
   end_route
```

- **演示要点**：演示 route（最小结构，无子参数）

### route_network（osm_roadnetwork）｜航路网络

- **关键词**：route_network, route, 航路网络
- **出处**：`traffic_demos/roads/osm_roadnetwork.txt:13-296`
- **片段**：

```text
route_network osm_roadnetwork
   route
      name North_Rural_St
      navigation
         position 39.219389n 86.5141197w
            node_id 180609922
         position 39.2211938n 86.5141739w
            node_id 180609925
      end_navigation
      aux_data
         string highway = "residential"
         unitary maxspeed = 35 mph
      end_aux_data
   end_route
   route
      name East_Prairie_Drive
      navigation
         position 39.2222346n 86.5172063w
            aux_data
               bool traffic_signals = true
            end_aux_data
            node_id 180585436
         position 39.2221397n 86.5168094w
         position 39.2220914n 86.5165897w
         position 39.2220614n 86.5163703w
         position 39.2220502n 86.516145w
         position 39.2220473n 86.5160534w
            node_id 180585443
         position 39.2220435n 86.5141509w
         position 39.2220939n 86.5132108w
         position 39.222085n 86.5131103w
         position 39.2220749n 86.5130344w
         position 39.2220475n 86.5129304w
         position 39.2220165n 86.5128725w
         position 39.2219712n 86.5128284w
         position 39.2219059n 86.5128079w
         position 39.2212633n 86.5126866w
         position 39.2211938n 86.5127147w
            node_id 180585448
      end_navigation
      aux_data
         bool oneway = false
         string highway = "residential"
         unitary maxspeed = 35 mph
      end_aux_data
   end_route
   route
      name Woodland_Drive
      navigation
         position 39.2204988n 86.5114021w
            node_id 180618988
         position 39.2206506n 86.5112244w
         position 39.2213165n 86.5103794w
      end_navigation
      aux_data
         string highway = "residential"
         unitary maxspeed = 35 mph
      end_aux_data
   end_route
   route
      name East_Whisnand_Road
      navigation
         position 39.2246488n 86.5397261w
         position 39.224638n 86.539597w
         position 39.2246168n 86.5390133w
         position 39.2246122n 86.5381231w
         position 39.2246052n 86.5380077w
         position 39.2245838n 86.5378756w
         position 39.2245559n 86.5377425w
         position 39.2245083n 86.5376009w
         position 39.2238742n 86.5362544w
         position 39.2236132n 86.5356462w
         position 39.2230417n 86.5344645w
         position 39.2229125n 86.5341883w
         position 39.2228402n 86.5339935w
         position 39.2227944n 86.5338151w
         position 39.2225862n 86.5328309w
         position 39.2225287n 86.532621w
         position 39.2224557n 86.5324713w
         position 39.2223655n 86.5323275w
         position 39.2222494n 86.5322149w
         position 39.2221461n 86.5321033w
         position 39.2220755n 86.5319826w
         position 39.2220018n 86.5318289w
         position 39.2219652n 86.5316531w
         position 39.2219614n 86.5314786w
         position 39.2219815n 86.5312724w
         position 39.2220401n 86.5311087w
         position 39.2223974n 86.5305785w
         position 39.2224958n 86.5303737w
         position 39.222546n 86.530197w
         position 39.2226049n 86.529913w
         position 39.2226327n 86.5296325w
         position 39.2226429n 86.5292076w
         position 39.2226742n 86.5277498w
         position 39.2226681n 86.5254836w
         position 39.2226614n 86.5224368w
         position 39.2226451n 86.519765w
         position 39.2226345n 86.5188346w
         position 39.2226265n 86.517976w
         position 39.2226132n 86.517373w
         position 39.2225885n 86.5171216w
            aux_data
               bool stop = true
            end_aux_data
            node_id 180621052
      end_navigation
      aux_data
         string highway = "residential"
         unitary maxspeed = 35 mph
      end_aux_data
   end_route
   route
      name East_Fairwood_Drive
      navigation
         position 39.2204988n 86.5114021w
            node_id 180618988
         position 39.220344n 86.51123w
         position 39.2202418n 86.5111726w
         position 39.2201084n 86.5111717w
         position 39.2193602n 86.5113145w
            node_id 180646456
      end_navigation
      aux_data
         string highway = "residential"
         unitary maxspeed = 35 mph
      end_aux_data
   end_route
   route
      name East_Richland_Drive
      navigation
         position 39.2193807n 86.5145605w
         position 39.219389n 86.5141197w
            node_id 180609922
         position 39.2193854n 86.5137976w
         position 39.2193572n 86.5126229w
         position 39.2193602n 86.5113145w
            node_id 180646456
         position 39.2193414n 86.5099257w
      end_navigation
      aux_data
         string highway = "residential"
         unitary maxspeed = 35 mph
      end_aux_data
   end_route
   route
      name North_Old_State_Road_37
      navigation
         position 39.2078199n 86.5325427w
         position 39.2078814n 86.5323558w
         position 39.2079388n 86.5321688w
         position 39.2079944n 86.5319621w
         position 39.2080418n 86.5317528w
         position 39.2080868n 86.5316103w
         position 39.2081208n 86.5313945w
         position 39.2081453n 86.5312093w
         position 39.2081626n 86.5310114w
         position 39.2081877n 86.5304694w
         position 39.2081957n 86.530098w
         position 39.20819n 86.5297428w
         position 39.208174n 86.5293876w
         position 39.208145n 86.529181w
         position 39.2080959n 86.5289568w
         position 39.2080218n 86.5287166w
         position 39.207917n 86.528488w
         position 39.2076006n 86.5278486w
         position 39.2075135n 86.527637w
         position 39.2074711n 86.5274624w
         position 39.2074573n 86.5273322w
         position 39.2074596n 86.5272064w
         position 39.2074734n 86.5270806w
         position 39.2075078n 86.5269578w
         position 39.2075731n 86.5267802w
         position 39.2076717n 86.5265641w
         position 39.2077807n 86.5263629w
         position 39.207916n 86.5261306w
         position 39.2079951n 86.5260329w
         position 39.2081063n 86.5259145w
         position 39.208237n 86.5258094w
         position 39.2084104n 86.5257315w
         position 39.2089279n 86.5255176w
         position 39.2092918n 86.5253767w
         position 39.2096233n 86.5252097w
         position 39.2100155n 86.5249854w
         position 39.2114507n 86.5240775w
         position 39.2129653n 86.5231199w
         position 39.2141595n 86.5223369w
         position 39.214546n 86.522096w
         position 39.2153866n 86.5215799w
         position 39.2160448n 86.5211841w
         position 39.2179132n 86.5200156w
         position 39.2181102n 86.5198556w
         position 39.2188438n 86.5191597w
         position 39.2197243n 86.5183501w
         position 39.2201788n 86.51796w
         position 39.2204346n 86.5177765w
         position 39.2206116n 86.5176747w
         position 39.2208148n 86.5176123w
         position 39.2211859n 86.5175091w
         position 39.2221684n 86.5172233w
         position 39.2222346n 86.5172063w
            aux_data
               bool traffic_signals = true
            end_aux_data
            node_id 180585436
         position 39.2225885n 86.5171216w
            aux_data
               bool stop = true
            end_aux_data
            node_id 180621052
         position 39.2233673n 86.5168891w
         position 39.2238429n 86.5167435w
         position 39.2245417n 86.5165257w
         position 39.2249862n 86.5163676w
         position 39.225108n 86.5163003w
         position 39.225209n 86.5162264w
         position 39.2253023n 86.5161313w
         position 39.2253754n 86.5160286w
         position 39.225449n 86.5158879w
         position 39.2258028n 86.5147986w
         position 39.2258465n 86.5146754w
         position 39.2258956n 86.5145492w
         position 39.2259511n 86.5144117w
         position 39.2260104n 86.5142761w
         position 39.2260795n 86.5141432w
         position 39.2261711n 86.5139905w
         position 39.2269192n 86.513027w
         position 39.2278357n 86.511853w
         position 39.227975n 86.5116753w
         position 39.2281143n 86.5114749w
         position 39.2282344n 86.5112837w
         position 39.2283541n 86.5110737w
         position 39.2284267n 86.5109375w
         position 39.2284932n 86.510796w
         position 39.2286101n 86.5105414w
         position 39.2287546n 86.5101791w
         position 39.2289741n 86.5096068w
         position 39.2290778n 86.509357w
         position 39.2291511n 86.509197w
         position 39.2292875n 86.508939w
         position 39.2293812n 86.5087766w
         position 39.2295057n 86.5085785w
         position 39.229594n 86.5084541w
         position 39.2297245n 86.5082953w
         position 39.2298291n 86.508181w
         position 39.2298851n 86.5081304w
         position 39.2301032n 86.5079317w
         position 39.2303337n 86.5077233w
         position 39.2309557n 86.5071569w
      end_navigation
      aux_data
         string surface = "paved"
         string highway = "tertiary"
         unitary maxspeed = 55 mph
         unitary minspeed = 45 mph
      end_aux_data
   end_route
   route
      name East_Fairwood_Drive
      navigation
         position 39.2220473n 86.5160534w
            node_id 180585443
         position 39.2219058n 86.5160317w
         position 39.2215761n 86.5159775w
         position 39.2214395n 86.5159468w
         position 39.2213218n 86.5159043w
         position 39.2212387n 86.5158033w
         position 39.2212037n 86.5156291w
         position 39.2211938n 86.5141739w
            node_id 180609925
         position 39.2211938n 86.5127147w
            node_id 180585448
         position 39.2210674n 86.5124463w
         position 39.2209652n 86.5122526w
         position 39.2204988n 86.5114021w
            node_id 180618988
      end_navigation
      aux_data
         bool oneway = true
         string highway = "residential"
         unitary maxspeed = 35 mph
      end_aux_data
   end_route
end_route_network
```

- **演示要点**：演示 route_network 的参数：route

### ship（west_coast_sea_traffic）｜

- **关键词**：ship, fraction, mean_loiter_time, sigma_loiter_time, mean_speed, sigma_speed, loiter_route
- **出处**：`traffic_demos/scenarios/west_coast_sea_traffic.txt:156-164`
- **片段**：

```text
      ship JETSKI
         fraction           0.25
         mean_loiter_time  30.0 min
         sigma_loiter_time 10.0 min
         mean_speed        40.0 knots
         sigma_speed       15.0 knots
         loiter_route ship-loiter-route-1
         loiter_route ship-loiter-route-2
      end_ship
```

- **演示要点**：演示 ship 的参数：fraction, mean_loiter_time, sigma_loiter_time, mean_speed, sigma_speed, loiter_route

### ship（west_coast_sea_traffic）｜

- **关键词**：ship, fraction, mean_loiter_time, sigma_loiter_time, mean_speed, sigma_speed
- **出处**：`traffic_demos/scenarios/west_coast_sea_traffic.txt:148-154`
- **片段**：

```text
      ship SMALL_FISHING_SHIP
         fraction           0.75
         mean_loiter_time  30.0 min
         sigma_loiter_time 10.0 min
         mean_speed        40.0 knots
         sigma_speed       15.0 knots
      end_ship
```

- **演示要点**：演示 ship 的参数：fraction, mean_loiter_time, sigma_loiter_time, mean_speed, sigma_speed

### ship（west_coast_sea_traffic）｜

- **关键词**：ship, fraction, mean_speed, sigma_speed
- **出处**：`traffic_demos/scenarios/west_coast_sea_traffic.txt:127-131`　（同签名共 3 处，另见 `traffic_demos/scenarios/west_coast_sea_traffic.txt:133`、`traffic_demos/scenarios/west_coast_sea_traffic.txt:139`）
- **片段**：

```text
      ship TANKER_SHIP
         fraction     0.50
         mean_speed  20.0 knots
         sigma_speed  5.0 knots
      end_ship
```

- **演示要点**：演示 ship 的参数：fraction, mean_speed, sigma_speed

### zone（blue_zone）｜区域

- **关键词**：zone, position, minimum_altitude, maximum_radius, start_angle, stop_angle, line_color, fill_color, heading, 区域
- **出处**：`wargame/zones/blue_zone.txt:12-22`　（同签名共 2 处，另见 `wargame/zones/green_zone.txt:12`）
- **片段**：

```text
zone BlueZone circular
   position 39:12:41.509n 101:43:13.116w
   minimum_altitude 50000 ft
   maximum_radius 100 kilometers
   start_angle 0 deg
   stop_angle 360 deg
   line_color 3 3 255
   fill_color 0 168 220 63      
   
   heading 0 degrees
end_zone
```

- **演示要点**：演示 zone 的参数：position, minimum_altitude, maximum_radius, start_angle, stop_angle, line_color, fill_color, heading

### zone（purple_zone）｜区域

- **关键词**：zone, position, minimum_altitude, maximum_radius, start_angle, stop_angle, line_color, fill_color, 区域
- **出处**：`wargame/zones/purple_zone.txt:12-21`　（同签名共 2 处，另见 `wargame/zones/red_zone.txt:12`）
- **片段**：

```text
zone PurpleZone circular
   position 41:05:41.867n 100:01:45.865w
   minimum_altitude 50000 ft
   maximum_radius 100 kilometers
   start_angle 0 deg
   stop_angle 360 deg
   line_color 128 0 128
   fill_color 80 0 80 63

end_zone
```

- **演示要点**：演示 zone 的参数：position, minimum_altitude, maximum_radius, start_angle, stop_angle, line_color, fill_color

### zone（over_the_horizon_radar）｜区域

- **关键词**：zone, polygonal, lat_lon, point, minimum_altitude, maximum_altitude, 区域
- **出处**：`space_operations/scenarios/over_the_horizon_radar.txt:161-170`　（同签名共 3 处，另见 `suppressor/bomb_demo_laydown.txt:167`、`suppressor/bomb_demo_laydown.txt:216`）
- **片段**：

```text
zone ionized_d_layer
   polygonal
   lat_lon
   point 90s 179.9w
   point 90n 179.9w
   point 90n 179.9e
   point 90s 179.9e
   minimum_altitude 80 kilometers
   maximum_altitude 100 kilometers
end_zone
```

- **演示要点**：演示 zone 的参数：polygonal, lat_lon, point, minimum_altitude, maximum_altitude

### zone（lr_sam_battalion）｜区域

- **关键词**：zone, circular, maximum_altitude, maximum_radius, minimum_radius, 区域
- **出处**：`orwaca_iads/platforms/lr_sam_battalion.txt:115-120`　（同签名共 2 处，另见 `orwaca_iads/platforms/mr_sam_battalion.txt:115`）
- **片段**：

```text
   zone battalion_sector
      circular
      maximum_altitude 30 km
      maximum_radius   100 nm
      minimum_radius   10 nm
   end_zone
```

- **演示要点**：演示 zone 的参数：circular, maximum_altitude, maximum_radius, minimum_radius

### zone（cvbg）｜区域

- **关键词**：zone, circular, maximum_radius, start_angle, stop_angle, 区域
- **出处**：`outer_air_battle/scenarios/cvbg.txt:20-25`　（同签名共 16 处，另见 `outer_air_battle/scenarios/cvbg.txt:26`、`outer_air_battle/scenarios/cvbg.txt:32`、`outer_air_battle/scenarios/cvbg.txt:38`）
- **片段**：

```text
  zone circle_zone_52115
    circular
    maximum_radius 150.00 nm
    start_angle 315.00 deg
    stop_angle 45.00 deg
  end_zone
```

- **演示要点**：演示 zone 的参数：circular, maximum_radius, start_angle, stop_angle

### zone（nets_zones）｜区域

- **关键词**：zone, circular, maximum_altitude, maximum_radius, 区域
- **出处**：`cyber/exfiltrate_demo/scenarios/nets_zones.txt:14-18`　（同签名共 6 处，另见 `cyber/platforms/sr_sam_telar.txt:67`、`electronic_warfare/test_false_targets/scenarios/nets_zones.txt:14`、`iads/scenarios/nets_zones.txt:14`）
- **片段**：

```text
zone 100_battalion_sector
  circular
    maximum_altitude 30 km
    maximum_radius   30 nm
end_zone
```

- **演示要点**：演示 zone 的参数：circular, maximum_altitude, maximum_radius

### zone（bomb_demo_laydown）｜区域

- **关键词**：zone, minimum_altitude, maximum_altitude, maximum_radius, 区域
- **出处**：`suppressor/bomb_demo_laydown.txt:65-69`
- **片段**：

```text
zone 100_sam_zone
  minimum_altitude 0 m
  maximum_altitude 30 km
  maximum_radius 45 km
end_zone
```

- **演示要点**：演示 zone 的参数：minimum_altitude, maximum_altitude, maximum_radius

### zone（zone_route_finder_1）｜区域

- **关键词**：zone, polygonal, lat_lon, point, 区域
- **出处**：`route_finder_demos/zone_route_finder_1.txt:26-33`　（同签名共 6 处，另见 `route_finder_demos/zone_route_finder_2.txt:28`、`sensor_demos/nav_demo.txt:85`、`route_finder_demos/zone_route_finder_1.txt:14`）
- **片段**：

```text
zone poly_zone
  polygonal
  lat_lon
  point 13:48:11.27s 48:17:54.76e
  point 13:36:43.68s 49:17:45.98e
  point 14:08:43.62s 49:15:04.57e
  point 14:00:02.04s 48:23:11.21e
end_zone
```

- **演示要点**：演示 zone 的参数：polygonal, lat_lon, point

### zone（hellfire_type）｜区域

- **关键词**：zone, reference_platform, polygonal, point, 区域
- **出处**：`hellfire/laser_designation_via_dis/hellfire_type.txt:285-367`　（同签名共 2 处，另见 `hellfire/semiactive_laser_hellfire/hellfire_type.txt:284`）
- **片段**：

```text
zone HELLFIRE_304m_101mps
   # This is the zone shape within which the launch computer will believe it has a firing solution.
   # (shrink_factor applied was = 1.)
   # Created by ATG_LARGenerator on Tue Mar 21 11:20:59 2006
   reference_platform shooter
   polygonal
   point 500 0 m      # DRB was 1000
   point 1400 400 m
   point 1400 800 m
   point 1400 1200 m
   point 1400 1600 m
   point 1400 2000 m
   point 1400 2400 m
   point 1400 2800 m
   point 1400 3200 m
   point 1400 3600 m
   point 1400 4000 m
   point 1400 4400 m
   point 1400 4800 m
   point 1800 5200 m
   point 1800 5600 m
   point 2200 5600 m
   point 2600 6000 m
   point 3000 6000 m
   point 3400 6000 m
   point 3800 6000 m
   point 4200 6000 m
   point 4600 6000 m
   point 5000 5600 m
   point 5400 5600 m
   point 5800 5200 m
   point 6200 4800 m
   point 6600 4800 m
   point 7000 4400 m
   point 7400 4000 m
   point 7400 3600 m
   point 7800 3200 m
   point 7800 2800 m
   point 8200 2400 m
   point 8200 2000 m
   point 8600 1600 m
   point 8600 1200 m
   point 8600 800 m
   point 8600 400 m
   point 8600 0 m
   point 8600 -400 m
   point 8600 -800 m
   point 8600 -1200 m
   point 8600 -1600 m
   point 8200 -2000 m
   point 8200 -2400 m
   point 7800 -2800 m
   point 7800 -3200 m
   point 7400 -3600 m
   point 7400 -4000 m
   point 7000 -4400 m
   point 6600 -4800 m
   point 6200 -4800 m
   point 5800 -5200 m
   point 5400 -5600 m
   point 5000 -5600 m
   point 4600 -6000 m
   point 4200 -6000 m
   point 3800 -6000 m
   point 3400 -6000 m
   point 3000 -6000 m
   point 2600 -6000 m
   point 2200 -5600 m
   point 1800 -5600 m
   point 1800 -5200 m
   point 1400 -4800 m
   point 1400 -4400 m
   point 1400 -4000 m
   point 1400 -3600 m
   point 1400 -3200 m
   point 1400 -2800 m
   point 1400 -2400 m
   point 1400 -2000 m
   point 1400 -1600 m
   point 1400 -1200 m
   point 1400 -800 m
   point 1400 -400 m
end_zone
```

- **演示要点**：演示 zone 的参数：reference_platform, polygonal, point

### zone（hellfire_type）｜区域

- **关键词**：zone, minimum_radius, maximum_radius, 区域
- **出处**：`hellfire/active_radar_hellfire/hellfire_type.txt:71-74`　（同签名共 3 处，另见 `hellfire/laser_designation_via_dis/hellfire_type.txt:66`、`hellfire/semiactive_laser_hellfire/hellfire_type.txt:65`）
- **片段**：

```text
zone nominal_hellfire_lar
   minimum_radius  500 m
   maximum_radius 7000 m
end_zone
```

- **演示要点**：演示 zone 的参数：minimum_radius, maximum_radius

### zone（cvbg）｜区域

- **关键词**：zone, circular, maximum_radius, 区域
- **出处**：`outer_air_battle/scenarios/cvbg.txt:14-19`　（同签名共 2 处，另见 `outer_air_battle/scenarios/cvbg_mrc_lrc.txt:23`）
- **片段**：

```text
  zone circle_zone_5190
    circular
    maximum_radius 100.00 nm
#    start_angle 315.00 deg
#    stop_angle 45.00 deg
  end_zone
```

- **演示要点**：演示 zone 的参数：circular, maximum_radius

### zone（hellfire_type）｜区域

- **关键词**：zone, polygonal, point, 区域
- **出处**：`hellfire/active_radar_hellfire/hellfire_type.txt:232-313`
- **片段**：

```text
zone HELLFIRE_304m_101mps
   # This is the zone shape within which the launch computer will believe it has a firing solution.
   # (shrink_factor applied was = 1.)
   # Created by ATG_LARGenerator on Tue Mar 21 11:20:59 2006
   polygonal
   point 500 0 m      # DRB was 1000
   point 1400 400 m
   point 1400 800 m
   point 1400 1200 m
   point 1400 1600 m
   point 1400 2000 m
   point 1400 2400 m
   point 1400 2800 m
   point 1400 3200 m
   point 1400 3600 m
   point 1400 4000 m
   point 1400 4400 m
   point 1400 4800 m
   point 1800 5200 m
   point 1800 5600 m
   point 2200 5600 m
   point 2600 6000 m
   point 3000 6000 m
   point 3400 6000 m
   point 3800 6000 m
   point 4200 6000 m
   point 4600 6000 m
   point 5000 5600 m
   point 5400 5600 m
   point 5800 5200 m
   point 6200 4800 m
   point 6600 4800 m
   point 7000 4400 m
   point 7400 4000 m
   point 7400 3600 m
   point 7800 3200 m
   point 7800 2800 m
   point 8200 2400 m
   point 8200 2000 m
   point 8600 1600 m
   point 8600 1200 m
   point 8600 800 m
   point 8600 400 m
   point 8600 0 m
   point 8600 -400 m
   point 8600 -800 m
   point 8600 -1200 m
   point 8600 -1600 m
   point 8200 -2000 m
   point 8200 -2400 m
   point 7800 -2800 m
   point 7800 -3200 m
   point 7400 -3600 m
   point 7400 -4000 m
   point 7000 -4400 m
   point 6600 -4800 m
   point 6200 -4800 m
   point 5800 -5200 m
   point 5400 -5600 m
   point 5000 -5600 m
   point 4600 -6000 m
   point 4200 -6000 m
   point 3800 -6000 m
   point 3400 -6000 m
   point 3000 -6000 m
   point 2600 -6000 m
   point 2200 -5600 m
   point 1800 -5600 m
   point 1800 -5200 m
   point 1400 -4800 m
   point 1400 -4400 m
   point 1400 -4000 m
   point 1400 -3600 m
   point 1400 -3200 m
   point 1400 -2800 m
   point 1400 -2400 m
   point 1400 -2000 m
   point 1400 -1600 m
   point 1400 -1200 m
   point 1400 -800 m
   point 1400 -400 m
end_zone
```

- **演示要点**：演示 zone 的参数：polygonal, point

### zone（ttr_test）｜区域

- **关键词**：zone, circular, 区域
- **出处**：`iads/ttr_test.txt:66-68`　（同签名共 16 处，另见 `aea_iads/platforms/large_sam_battalion.txt:104`、`alternate_locations/platforms/single_large_sam.txt:40`、`cyber/exfiltrate_demo/platforms/large_sam_battalion.txt:107`）
- **片段**：

```text
   zone battalion_sector
      circular maximum_radius 100 nm
   end_zone
```

- **演示要点**：演示 zone 的参数：circular

### zone（assignment_priority）｜区域

- **关键词**：zone, polygonal, 区域
- **出处**：`iads_c2_demos/assignment_priority.txt:48-54`　（同签名共 7 处，另见 `iads_c2_demos/assignment_priority.txt:56`、`iads_c2_demos/weapon_engagement_zone.txt:48`、`iads_c2_demos/scenarios/air_interceptor.txt:37`）
- **片段**：

```text
zone weapon_engagement_zone
   polygonal lat_lon
      point 39:00:00n 117:00:00w // Top Right
      point 38:00:00n 117:00:00w // Bottom Right
      point 38:00:00n 118:00:00w // Bottom Left
      point 39:00:00n 118:00:00w // Top Left
end_zone
```

- **演示要点**：演示 zone 的参数：polygonal

### zone_set（nav_demo）｜

- **关键词**：zone_set, use_zone
- **出处**：`sensor_demos/nav_demo.txt:140-142`　（同签名共 2 处，另见 `sensor_demos/nav_demo.txt:118`）
- **片段**：

```text
   zone_set no_gps
      use_zone BLUE_NO_GPS
   end_zone_set
```

- **演示要点**：演示 zone_set 的参数：use_zone
