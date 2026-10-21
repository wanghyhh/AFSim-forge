# 输出 / 接口 / 绘图

> **来源**：AFSIM 2.9.0 官方 demo 集（`demos/`，4,751 个 `.txt`，132 万行）
> **性质**：原文摘抄，未改写。同一「参数签名」只保留 1 条代表，并注明出现次数与另见位置
> **警示**：片段中数值为 demo 原值，**仅供语法参考，不得直接复用**；依赖 `common/` 数据表的片段须另行提供
> **检索**：按命令 / 类型名 / 参数名搜本卷；总表见 `90-tokens.md`

### altitude（AAA_README）｜

- **关键词**：altitude
- **出处**：`hel/atmosphere/AAA_README.txt:87-88`　（同签名共 27 处，另见 `hel/atmosphere/COEFSxxxx_x.txt:15`、`hel/atmosphere/COEFS1000_1.txt:15`、`hel/atmosphere/COEFS1000_2.txt:15`）
- **片段**：

```text
altitude
end_altitude
```

- **演示要点**：演示 altitude（最小结构，无子参数）

### altitudes（clutter_table_generation）｜

- **关键词**：altitudes, from, ranges, bearings
- **出处**：`sensor_plot/clutter/clutter_table_generation.txt:110-116`　（同签名共 2 处，另见 `sensor_plot/clutter/clutter_table_regneration_test.txt:117`）
- **片段**：

```text
   altitudes
      from  0 m to 5000 m by 0.5 km
      ranges
         from 1 km to 10 km by 0.5 km
      bearings
         from -180 degrees to 180 degrees by 20 degrees
   end_altitudes
```

- **演示要点**：演示 altitudes 的参数：from, ranges, bearings

### altitudes（fuel_table_demo）｜

- **关键词**：altitudes, units
- **出处**：`example_scripts/fuel_table_demo.txt:34-37`　（同签名共 3 处，另见 `example_scripts/fuel_table_demo.txt:52`、`multiresolution_demos/fuel/fuel_include.txt:28`）
- **片段**：

```text
         altitudes
            units m
            0 5000 10000
         end_altitudes
```

- **演示要点**：演示 altitudes 的参数：units

### analysis_map（analysis_map-ucav-dry）｜

- **关键词**：analysis_map, file, color_range, data_title, units
- **出处**：`sensor_plot/radar/analysis_map-ucav-dry.txt:35-43`　（同签名共 2 处，另见 `sensor_plot/radar/analysis_map-ucav-wet.txt:71`）
- **片段**：

```text
   analysis_map
      file analysis_map-ucav-dry.dat
      color_range 0.9 to 1.0 float 0.9 0.1 0.1 1.0
      color_range 0.5 to 0.9 float 1.0 0.5 0.0 1.0
      color_range 0.1 to 0.5 float 0.1 0.1 0.9 1.0
      color_range 0.0 to 0.1 float 0.0 0.0 0.0 0.0
      data_title Pd
      units Pd
   end_analysis_map
```

- **演示要点**：演示 analysis_map 的参数：file, color_range, data_title, units

### contour_level（analysis_map-ucav-dry）｜

- **关键词**：contour_level, line_color, line_width
- **出处**：`sensor_plot/radar/analysis_map-ucav-dry.txt:45-48`　（同签名共 3 处，另见 `sensor_plot/radar/analysis_map-ucav-wet.txt:81`、`sensor_plot/radar/sedit-ucav-dry.txt:36`）
- **片段**：

```text
   contour_level 0.5
      line_color float 1. 0. 0.
      line_width 2
   end_contour_level
```

- **演示要点**：演示 contour_level 的参数：line_color, line_width

### coverage · WSF_SENSOR_COVERAGE｜

- **关键词**：coverage, WSF_SENSOR_COVERAGE, grid, assets, start_epoch, output_dir, raw_data_file, moe, overlay_file
- **出处**：`coverage_demos/coverage_grids/uav_stepped_grid_coverage.txt:21-53`　（同签名共 4 处，另见 `coverage_demos/coverage_grids/global_lat_lon_coverage.txt:23`、`coverage_demos/coverage_grids/geo_belt_grid_coverage.txt:23`、`coverage_demos/coverage_grids/conus_zone_coverage.txt:20`）
- **片段**：

```text
coverage demo_coverage WSF_SENSOR_COVERAGE

   # Specify grid to be used
   grid uav_grid
   
   # Specify platform and sensor on which coverage will be based
   assets
      platform uav uav_sensor
   end_assets
   
   # Specify start and stop time for coverage to be computed
   start_epoch jul 07 2020 00:00:00.00       
   end_epoch jul 07 2020 03:00:00.00
   
   # Specify where the data will be sent   
   output_dir ./coverage_data
   raw_data_file raw_intervals_uav.csv
   
   # Define measures of effectiveness
   moe simple_uav WSF_SIMPLE_COVERAGE_MOE
      output data end_output
      output grid_stats end_output
   end_moe
   
   moe revisit_uav WSF_REVISIT_TIME_MOE
      subtype maximum 
      output data end_output
   end_moe
   
   # Create heatmap to visualize coverage results.
   # Load this file using the Coverage Overlay view in Wizard, Warlock, or Mystic.  
   overlay_file overlay_uav
end_coverage
```

- **演示要点**：演示 WSF_SENSOR_COVERAGE 的参数：grid, assets, start_epoch, output_dir, raw_data_file, moe, overlay_file

### coverage · WSF_SENSOR_COVERAGE｜

- **关键词**：coverage, WSF_SENSOR_COVERAGE, grid, assets, start_epoch, output_dir, raw_data_file, moe
- **出处**：`coverage_demos/coverage_grids/existing_grid_coverage.txt:22-53`
- **片段**：

```text
coverage demo_coverage WSF_SENSOR_COVERAGE

   # Specify grid to be used
   grid ex_grid
   
   # Specify platform and sensor on which coverage will be based
   # For this demo, the platform is a ground station and the sensor is looking up for air targets
   assets
      platform ground_station ground_sensor
   end_assets
   
   # Specify start and stop time for coverage to be computed
   start_epoch jul 07 2020 00:00:00.00       
   end_epoch jul 07 2020 00:30:00.00
   
   # Specify where the data will be sent  
   output_dir ./coverage_data
   raw_data_file raw_intervals_ex.csv
   
   # Define measures of effectiveness
   moe simple_existing WSF_SIMPLE_COVERAGE_MOE
      output data end_output
      output grid_stats end_output
   end_moe
   
   # Create heatmap to visualize coverage results.
   # Load this file using the Coverage Overlay view in Wizard, Warlock, or Mystic. 
   # As of 2.7 release, the heatmap overlay has not been implemented for the
   # WSF_EXISTING_PLATFORM_GRID. This is held here as a placeholder for a future
   # release when this is added.
   #overlay_file overlay_existing
end_coverage
```

- **演示要点**：演示 WSF_SENSOR_COVERAGE 的参数：grid, assets, start_epoch, output_dir, raw_data_file, moe

### coverage · WSF_SENSOR_COVERAGE｜

- **关键词**：coverage, WSF_SENSOR_COVERAGE, grid, assets, output_dir, raw_data_file, moe, overlay_file
- **出处**：`coverage_demos/coverage_grids/state_zone_lat_lon_grid_coverage.txt:32-64`
- **片段**：

```text
coverage demo_coverage WSF_SENSOR_COVERAGE

   # Specify grid to be used
   grid state_grid
   
   # Specify platform and sensor on which coverage will be based
   assets
      platform_type SAT narrow_sat_sensor
   end_assets
   
   # Specify start and stop time for coverage to be computed
#   start_epoch jul 07 2020 01:30:00.00       
#   end_epoch jul 07 2020 01:40:00.00
   
   # Specify where the data will be written  
   output_dir ./coverage_data
   raw_data_file raw_intervals_states.csv
   
   # Define measures of effectiveness
   moe simple_states WSF_SIMPLE_COVERAGE_MOE
      output data end_output
      output grid_stats end_output
   end_moe
   
   moe revisit_states WSF_REVISIT_TIME_MOE
      subtype mean 
      output data end_output
   end_moe
   
   # Create heatmap to visualize coverage results.
   # Load this file using the Coverage Overlay view in Wizard, Warlock, or Mystic.
   overlay_file overlay_states
end_coverage
```

- **演示要点**：演示 WSF_SENSOR_COVERAGE 的参数：grid, assets, output_dir, raw_data_file, moe, overlay_file

### csv_event_output（csv_event_output）｜CSV 事件输出

- **关键词**：csv_event_output, file, enable, CSV 事件输出
- **出处**：`aea_iads/csv_event_output.txt:10-13`　（同签名共 2 处，另见 `iads/csv_event_output.txt:10`）
- **片段**：

```text
csv_event_output
   file replay.csv
   enable all
end_csv_event_output
```

- **演示要点**：演示 csv_event_output 的参数：file, enable

### dis_exchange（dis_interface）｜

- **关键词**：dis_exchange, debug
- **出处**：`exchange_proc/dis_interface.txt:41-43`
- **片段**：

```text
   dis_exchange
      debug
   end_dis_exchange
```

- **演示要点**：演示 dis_exchange 的参数：debug

### dis_interface（observer）｜DIS 接口

- **关键词**：dis_interface, exercise, site, application, multicast, port, autostart, ignore_pdu_time, deferred_connection_time, simple_detonations, simple_kill_range, heartbeat_timer, heartbeat_multiplier, DIS 接口
- **出处**：`script_demos/observer.txt:58-84`
- **片段**：

```text
dis_interface
   #log_created_entities
   exercise    1
   site        25
   application 1
   multicast   235.7.11.13 130.38
   #broadcast 10.
   port        3225

   autostart
   ignore_pdu_time
   deferred_connection_time  970 secs
   simple_detonations on
   simple_kill_range  100 m

   heartbeat_timer             5.0 sec
   heartbeat_multiplier        2.4
   mover_update_timer          5.0 sec
   entity_position_threshold   5.0 meters

   #suppress_comm_data          true

   initial_distribution_interval 1 sec

   #debug_emission_pdu 2

end_dis_interface
```

- **演示要点**：演示 dis_interface 的参数：exercise, site, application, multicast, port, autostart, ignore_pdu_time, deferred_connection_time, simple_detonations, simple_kill_range

### dis_interface（air-to-air-rt1）｜DIS 接口

- **关键词**：dis_interface, exercise, site, application, multicast, port, autostart, heartbeat_timer, heartbeat_multiplier, mover_update_timer, entity_position_threshold, debug_emission_pdu, entity_type, DIS 接口
- **出处**：`electronic_warfare/air-to-air-rt1.txt:377-405`　（同签名共 2 处，另见 `electronic_warfare/air-to-air-rt2.txt:377`）
- **片段**：

```text
dis_interface
   exercise    1
   site        25
   application 1
   multicast   224.2.25.55 10.
   #broadcast 10.
   port        3225
   autostart

   heartbeat_timer             5.0 sec
   heartbeat_multiplier        2.4
   mover_update_timer          5.0 sec
   entity_position_threshold   10.0 meters

   debug_emission_pdu 2

   entity_type STRIKER         1:2:225:1:9:10:0
   entity_type JAMMER          1:2:225:2:10:1:0

   emitter_type JAMMER     1
   #emitter_type ESM_SENSOR 10
   emitter_type AIRBORNE_RADAR   11

   ew_technique_type noise_jamming               0
   ew_technique_type random_pulse_jamming        132
   ew_technique_type jtos_gain_jamming           136
   ew_technique_type false_target_jamming        148
   ew_technique_type simple_false_target_jamming 152
end_dis_interface
```

- **演示要点**：演示 dis_interface 的参数：exercise, site, application, multicast, port, autostart, heartbeat_timer, heartbeat_multiplier, mover_update_timer, entity_position_threshold

### dis_interface（dis_realtime）｜DIS 接口

- **关键词**：dis_interface, exercise, site, application, multicast, port, autostart, ignore_pdu_time, simple_detonations, simple_kill_range, heartbeat_timer, heartbeat_multiplier, mover_update_timer, DIS 接口
- **出处**：`aea_iads/dis_realtime.txt:9-36`　（同签名共 2 处，另见 `iads/dis_realtime.txt:9`）
- **片段**：

```text
dis_interface
   #log_created_entities
   exercise    1
   site        25
   application 1
   multicast   224.2.25.55 10.
   #broadcast 10.
   port        3225
   autostart

   #use_pdu_time
   ignore_pdu_time

   simple_detonations on
   simple_kill_range  100 m

   heartbeat_timer             5.0 sec
   heartbeat_multiplier        2.4
   mover_update_timer          5.0 sec
   entity_position_threshold   10.0 meters

   #suppress_comm_data          true

   #initial_distribution_interval 5 sec

   #debug_emission_pdu 2

end_dis_interface
```

- **演示要点**：演示 dis_interface 的参数：exercise, site, application, multicast, port, autostart, ignore_pdu_time, simple_detonations, simple_kill_range, heartbeat_timer

### dis_interface（agile_repeater_jamming-rt1）｜DIS 接口

- **关键词**：dis_interface, exercise, site, application, multicast, port, autostart, heartbeat_timer, heartbeat_multiplier, mover_update_timer, entity_position_threshold, entity_type, emitter_type, DIS 接口
- **出处**：`electronic_warfare/agile_repeater_jamming-rt1.txt:472-501`　（同签名共 2 处，另见 `electronic_warfare/agile_repeater_jamming-rt2.txt:472`）
- **片段**：

```text
dis_interface
   exercise    1
   site        25
   application 1
   multicast   224.2.25.55 10.
   #broadcast 10.
   port        3225
   autostart

   heartbeat_timer             5.0 sec
   heartbeat_multiplier        2.4
   mover_update_timer          5.0 sec
   entity_position_threshold   10.0 meters

   #debug_emission_pdu 2

   entity_type STRIKER         1:2:225:1:9:10:0
   entity_type JAMMER          1:2:225:2:10:1:0
   entity_type EW_RADAR        9:1:222:2:2:7:0

   emitter_type JAMMER     1
   #emitter_type ESM_SENSOR 10
   emitter_type EW_RADAR   11

   ew_technique_type noise_jamming               0
   ew_technique_type random_pulse_jamming        132
   ew_technique_type jtos_gain_jamming           136
   ew_technique_type false_target_jamming        148
   ew_technique_type simple_false_target_jamming 152
end_dis_interface
```

- **演示要点**：演示 dis_interface 的参数：exercise, site, application, multicast, port, autostart, heartbeat_timer, heartbeat_multiplier, mover_update_timer, entity_position_threshold

### dis_interface（dis_config）｜DIS 接口

- **关键词**：dis_interface, entity_position_threshold, entity_orientation_threshold, emitter_type, entity_type, autostart, connections, multicast, port, exercise, site, application, heartbeat_timer, DIS 接口
- **出处**：`p6dof/config/dis_config.txt:10-52`　（同签名共 3 处，另见 `six_dof/config/dis_config.txt:10`、`six_dof_with_brawler/config/dis_config.txt:10`）
- **片段**：

```text
dis_interface

  # Set parameters to ensure smooth Mystic event pipe data
  
  entity_position_threshold     1 m
  entity_orientation_threshold  0.5 deg
# heartbeat_timer               0.05 seconds  # This is an alternate approach
  
/* Uncomment these lines to use DIS networking and edit as required
  # Emitter types
  emitter_type RADAR_NAME        1111

  # Entity types
  entity_type  BLUE_SR_A2A_IR_MISSILE_SIMPLE       2:1:225:1:1:0:0
  entity_type  BLUE_LR_A2A_RF_MISSILE_SIMPLE       2:1:225:1:2:0:0

# suppress_cme_entity_data       # suppress cme icon mapping pdus

  autostart

  connections
    multicast  228.10.10.2  10.34.209.67
    port 3000
  end_connections

  exercise     99
  site         22
  application  52

  # Increase the heartbeat_timer, mover_update_timer, and entity_position_threshold
  # to cause a smaller replay file to be generated (trade precision for size)
  #
  # heartbeat_timer               5.0 seconds
  # mover_update_timer            5.0 seconds
  # entity_position_threshold     10 m           # default is 1 m
  # entity_orientation_threshold   3 deg         # default is 3 deg

  heartbeat_timer               0.01 seconds
  mover_update_timer            0.01 sec
  entity_position_threshold     0.03 m
*/

end_dis_interface
```

- **演示要点**：演示 dis_interface 的参数：entity_position_threshold, entity_orientation_threshold, emitter_type, entity_type, autostart, connections, multicast, port, exercise, site

### dis_interface（dis_realtime）｜DIS 接口

- **关键词**：dis_interface, exercise, site, application, broadcast, port, autostart, ignore_pdu_time, simple_detonations, simple_kill_range, heartbeat_timer, mover_update_timer, entity_position_threshold, DIS 接口
- **出处**：`simple_scenario/dis_realtime.txt:18-47`
- **片段**：

```text
dis_interface
   #log_created_entities
   exercise    1
   site        25
   application 1

  #multicast 224.2.25.55 192.168.10.32
  #unicast   192.168.10.46
   broadcast 192.168.10.255
   port      3000

   autostart

   #use_pdu_time
   ignore_pdu_time

   simple_detonations on
   simple_kill_range  100 m

  #heartbeat_timer            12.0 sec
   heartbeat_timer             2.0 sec
  #mover_update_timer          5.0 sec
   mover_update_timer          1.0 sec
  #entity_position_threshold  10.0 meters
   entity_position_threshold   5.0 meters

   #suppress_comm_data          true
   #debug_emission_pdu 2

end_dis_interface
```

- **演示要点**：演示 dis_interface 的参数：exercise, site, application, broadcast, port, autostart, ignore_pdu_time, simple_detonations, simple_kill_range, heartbeat_timer

### dis_interface（dis_interface）｜DIS 接口

- **关键词**：dis_interface, autostart, protocol_version, force, site, application, exercise, initial_distribution_interval, entity_type, multicast, dis_exchange, DIS 接口
- **出处**：`exchange_proc/dis_interface.txt:11-45`
- **片段**：

```text
dis_interface

   autostart

   # Specifies the DIS Protocol Version, range 0-6.
   protocol_version 5

   force blue   1
   force red    2
   force green  3

   site         1
   application  1
   exercise     1

   # If a large quantity of entities are present at the start of the simulation, the
   # entities will be intially created over this distribution time in order to not
   # overload the network upon start up.

   initial_distribution_interval 5.0 sec

#  keyword            PLATFORM_TYPE       kind:domain:country:cat:scat:specific:extra
   entity_type        TANKER              1:1:222:28:2:0:0    # NOT DIS COMPLIANT
   entity_type        RECEIVER            1:1:222:28:3:0:0    # NOT DIS COMPLIANT
   entity_type        JP8_FUEL            1:1:222:28:4:0:0    # NOT DIS COMPLIANT

   entity_type        ENGINE_REPAIR       1:1:222:29:9:9:9    # NOT DIS COMPLIANT

   multicast 227.1.1.1 10. port 3031

   dis_exchange
      debug
   end_dis_exchange

end_dis_interface
```

- **演示要点**：演示 dis_interface 的参数：autostart, protocol_version, force, site, application, exercise, initial_distribution_interval, entity_type, multicast, dis_exchange

### dis_interface（dis_network）｜DIS 接口

- **关键词**：dis_interface, multicast, autostart, exercise, site, application, heartbeat_timer, heartbeat_multiplier, entity_position_threshold, entity_orientation_threshold, protocol_version, DIS 接口
- **出处**：`l16_j11/dis_network.txt:36-73`
- **片段**：

```text
dis_interface

  multicast 227.1.1.1 10. port 3224

  # Uncomment the 'autostart' line if the clock is to start automatically.
  # If this line in not uncommented then the application will wait until it
  # receives a DIS Start PDU from a simulation controller.

  autostart

  #############################################################################
  # All of the following have default values.  They are provided here just to
  # document the command formats.
  #############################################################################

  exercise                     1               # default is 1
  site                         1               # default is 1
  application                  1               # default is 1

  # Physical time is multiplied by the following to generate simulation time.

  heartbeat_timer              5.0 seconds
  heartbeat_multiplier         2.4

  entity_position_threshold    1 m             # default is 1 m
  entity_orientation_threshold 3 deg           # default is 3 degrees

  protocol_version             5               # default is 1278.1
                                               # 1 = 1.0
                                               # 2 = IEEE 1278 (1993)
                                               # 3 = 2.0 Third Draft
                                               # 4 = 2.0 Fourth Draft
                                               # 5 = IEEE 1278.1 (1995)
                                               # 6 = IEEE 1278.1a (1998)

#  mover_update_timer 5 seconds

end_dis_interface
```

- **演示要点**：演示 dis_interface 的参数：multicast, autostart, exercise, site, application, heartbeat_timer, heartbeat_multiplier, entity_position_threshold, entity_orientation_threshold, protocol_version

### dis_interface（ldt_dis）｜DIS 接口

- **关键词**：dis_interface, autostart, protocol_version, site, application, exercise, entity_type, DIS 接口
- **出处**：`hellfire/active_radar_hellfire/ldt_dis.txt:10-29`　（同签名共 3 处，另见 `hellfire/laser_designation_via_dis/ldt_dis.txt:10`、`hellfire/semiactive_laser_hellfire/ldt_dis.txt:10`）
- **片段**：

```text
dis_interface

   autostart

   # Specifies the DIS Protocol Version, range 0-6.
   protocol_version 5

   site         1
   application  1
   exercise     1

#  keyword            PLATFORM_TYPE       kind:domain:country:cat:scat:specific:extra
   entity_type        APACHE              1:1:222:28:2:0:0    # NOT DIS COMPLIANT
   entity_type        HELLFIRE            1:1:222:28:3:0:0    # NOT DIS COMPLIANT
   entity_type        TARGET              1:1:222:28:4:0:0    # NOT DIS COMPLIANT

   # This IP address is 10:34:209:51
   #multicast 227.1.1.1 10.34.209 port 3031

end_dis_interface
```

- **演示要点**：演示 dis_interface 的参数：autostart, protocol_version, site, application, exercise, entity_type

### dis_interface（dis_interface）｜DIS 接口

- **关键词**：dis_interface, broadcast, port, force, entity_type, application, site, DIS 接口
- **出处**：`wargame/dis_interface.txt:11-74`
- **片段**：

```text
dis_interface

   #Broadcast vs Multicast: choose one to define based on needs.

   #broadcast <broadcast-IP-address>
   #Defining a broadcast will cause packets to be sent to all hosts connected to the network.
   #Broadcasts are typically made up with the first six numbers of your IP following a mask.
   #Ex: broadcast 192.168.255.255 ---> Ip:192.168.1.4 and Mask:255.255.0.0
   
   broadcast 127.255.255.255

   #multicast <multicast-IP-address> <interface-address>
   #Defining a multicast will insure packets are sent to only intended recipients.
   #multicast-ip-address: An address in the range 224.0.0.0 to 239.255.255.255.
   #interface-address: The first six digit of your machine s IP address.
   #Ex: multicast 224.0.0.0 192.168
   
   #port <ip-port-number>
   #A communication endpoint for computers on a network. choose a number between 1024 and 65535
   #Ports from 0 to 1023 are usually reserved for privileged services and should be avoided.
   #Ex:
   port 7654
   
   #send_port <IP-port-number>
   #receive_port <IP-port-number>
   #The ports in which you send and recieve data can be specified seperately. 
   #Choose two port numbers between 1024 and 65535
   
   #force <side> <dis-force-id>
   #Specify the DIS force identifier that corresponds to a WSF platform side. 
   #This command should be specified for each side that is present in the scenario.
   #Ex:
   force blue   1
   force red    2
   force green  3
   force purple 4
   
   #entity_type <platform_type> <dis-entity-type>
   #Specify the DIS entity type to be used when sending PDUs for platforms or munitions 
   #with the indicated WSF platform type. This command should be specified for each
   #WSF platform type that is present in the scenario. If the type of a platform does 
   #not have a corresponding DIS entity type then 0:0:0:0:0:0:0 will be used. 
   #For proper WSF interaction of received DIS entities from other networked simulations, 
   #a corresponding simple platform_type must be created with defined signatures.
   #Ex:
   entity_type BOMBER              1:1:200:1:1:1:0 
   entity_type COMMAND             1:1:200:2:2:2:0 
   entity_type FIGHTER             1:1:200:3:3:3:0 
   entity_type SAM_LAUNCHER        1:1:200:4:4:4:0
   entity_type SENSOR_DRONE        1:1:200:5:5:5:0
   entity_type AAM_BASE            1:1:200:6:6:6:0
   entity_type AGM                 1:1:200:7:7:7:0
   entity_type ATG                 1:1:200:8:8:8:0

   #application <ignore_type <dis_entity_type>
   #Specify the DIS application ID in the range [1, 65534]. Each scenario will need to overide this interface and 
   #have a unique application number. see red_team.txt
   #Ex:
   application 11
   
   #site <dis-site-id>
   #Specify the DIS site ID in the range [1, 65534].
   site 22
end_dis_interface
```

- **演示要点**：演示 dis_interface 的参数：broadcast, port, force, entity_type, application, site

### dis_interface（xio_part_1）｜DIS 接口

- **关键词**：dis_interface, broadcast, port, application, site, autostart, DIS 接口
- **出处**：`distributed_operations/xio_part_1.txt:11-17`　（同签名共 2 处，另见 `distributed_operations/xio_part_2.txt:11`）
- **片段**：

```text
dis_interface
   broadcast 10.9.16.255
   port 27322
   application 11
   site 22
   autostart
end_dis_interface
```

- **演示要点**：演示 dis_interface 的参数：broadcast, port, application, site, autostart

### dis_interface（j11_out）｜DIS 接口

- **关键词**：dis_interface, application, entity_type, munition_type, log_created_entities, DIS 接口
- **出处**：`l16_j11/j11_out.txt:20-28`　（同签名共 2 处，另见 `l16_j11/j11_in.txt:24`）
- **片段**：

```text
dis_interface
   application 2

   entity_type   FIGHTER           1:2:225:1:9:10:0
   entity_type   WEAPON_FIGHTER    1:2:225:1:9:10:1
   munition_type NE_SR_A2A_IR      2:1:225:1:1:6:0   // Network-enabled

   log_created_entities
end_dis_interface
```

- **演示要点**：演示 dis_interface 的参数：application, entity_type, munition_type, log_created_entities

### dis_interface（event_pipe）｜DIS 接口

- **关键词**：dis_interface, suppress_comm_data, mover_update_timer, entity_position_threshold, DIS 接口
- **出处**：`bearing_only/event_pipe.txt:11-15`
- **片段**：

```text
dis_interface
   suppress_comm_data          false
   mover_update_timer          0.0 sec
   entity_position_threshold   10.0 meters
end_dis_interface
```

- **演示要点**：演示 dis_interface 的参数：suppress_comm_data, mover_update_timer, entity_position_threshold

### dis_interface（ldt_target_only）｜DIS 接口

- **关键词**：dis_interface, application, multicast, port, DIS 接口
- **出处**：`hellfire/laser_designation_via_dis/ldt_target_only.txt:36-41`
- **片段**：

```text
dis_interface
   application  2
   # You must specify an interface address for multicast. You can't use default.
   multicast 227.1.1.1 10. 
   port 3031
end_dis_interface
```

- **演示要点**：演示 dis_interface 的参数：application, multicast, port

### dis_interface（ldt_designator_only）｜DIS 接口

- **关键词**：dis_interface, application, multicast, DIS 接口
- **出处**：`hellfire/laser_designation_via_dis/ldt_designator_only.txt:35-39`　（同签名共 2 处，另见 `hellfire/laser_designation_via_dis/ldt_shooter_only.txt:35`）
- **片段**：

```text
dis_interface
   application  3
   # This assumes IP address is 10:34:209:51
   multicast 227.1.1.1 10.34.209 port 3031
end_dis_interface
```

- **演示要点**：演示 dis_interface 的参数：application, multicast

### dis_interface（dis_data）｜DIS 接口

- **关键词**：dis_interface, entity_type, emitter_type, DIS 接口
- **出处**：`iads/dis_data.txt:9-39`　（同签名共 2 处，另见 `aea_iads/dis_data.txt:9`）
- **片段**：

```text
dis_interface

   entity_type TARGET                                 2:1:222:2:1:1:0
   entity_type ACQ_RADAR                              9:1:222:2:1:15:0
   entity_type EW_RADAR                               9:1:222:2:2:7:0
   entity_type LARGE_SAM_TTR                          1:1:222:28:4:3:0
   entity_type LARGE_SAM_LAUNCHER                     1:1:222:28:9:2:0
   entity_type LARGE_SAM_BATTALION                    1:1:222:7:0:0:0
   entity_type IADS_CMDR                              1:1:225:0:5:0:0
   entity_type RADAR_COMPANY                          1:1:222:7:6:0:0
   entity_type BLUE_MULTIROLE_FIGHTER_1E               1:2:225:1:9:10:0
   entity_type SOJ                                    1:2:225:2:10:1:0
   entity_type UCAV                                   1:2:225:50:8:0:0

   entity_type LARGE_SAM           2:1:225:1:16:0:0

   entity_type BLUE_GPS_BOMB_2              2:1:225:1:13:1:0
   entity_type BLUE_GPS_BOMB_1              2:1:225:1:13:2:0
   entity_type BLUE_GLIDE_BOMB_1              2:1:225:1:13:2:1

   emitter_type SOJ_SBAND_JAMMER 1
   emitter_type SOJ_VHF_JAMMER   2
   emitter_type SOJ_XBAND_JAMMER 3

   emitter_type UCAV_ESM 10

   emitter_type EW_RADAR  11
   emitter_type TTR_RADAR 12
   emitter_type ACQ_RADAR 13

end_dis_interface
```

- **演示要点**：演示 dis_interface 的参数：entity_type, emitter_type

### dis_interface（iads-rt）｜DIS 接口

- **关键词**：dis_interface, application, DIS 接口
- **出处**：`aea_iads/iads-rt.txt:29-31`　（同签名共 11 处，另见 `aea_iads/strike-rt.txt:28`、`aea_iads/view.txt:24`、`iads/iads-rt.txt:28`）
- **片段**：

```text
dis_interface
   application 2
end_dis_interface
```

- **演示要点**：演示 dis_interface 的参数：application

### dis_interface（multi_thread）｜DIS 接口

- **关键词**：dis_interface, multi_threading, DIS 接口
- **出处**：`aea_iads/multi_thread.txt:21-24`　（同签名共 2 处，另见 `iads/multi_thread.txt:21`）
- **片段**：

```text
dis_interface
   #debug_thread
   multi_threading on
end_dis_interface
```

- **演示要点**：演示 dis_interface 的参数：multi_threading

### dis_interface（dis_ew_data）｜DIS 接口

- **关键词**：dis_interface, ew_technique_type, DIS 接口
- **出处**：`aea_iads/dis_ew_data.txt:9-15`　（同签名共 2 处，另见 `iads/dis_ew_data.txt:9`）
- **片段**：

```text
dis_interface
   ew_technique_type noise_jamming               0
   ew_technique_type random_pulse_jamming        132
   ew_technique_type jtos_gain_jamming           136
   ew_technique_type false_target_jamming        148
   ew_technique_type simple_false_target_jamming 152
end_dis_interface
```

- **演示要点**：演示 dis_interface 的参数：ew_technique_type

### dis_interface（dis_mappings）｜DIS 接口

- **关键词**：dis_interface, entity_type, DIS 接口
- **出处**：`logistics/dis/dis_mappings.txt:12-18`
- **片段**：

```text
dis_interface
   entity_type JP-8_FUEL     6:0:0:0:1:5:0
   entity_type FOODSTUFFS    5:0:0:0:2:0:0   # NOT DIS COMPLIANT
   entity_type LEAFLETS      5:0:0:0:3:0:0   # NOT DIS COMPLIANT
   entity_type SPARE_PARTS   5:0:0:0:4:0:0   # NOT DIS COMPLIANT
   entity_type ENGINE_REPAIR 5:0:0:0:5:0:0   # NOT DIS COMPLIANT
end_dis_interface
```

- **演示要点**：演示 dis_interface 的参数：entity_type

### dis_interface（dis_setup）｜DIS 接口

- **关键词**：dis_interface, DIS 接口
- **出处**：`logistics/dis/dis_setup.txt:11-13`
- **片段**：

```text
dis_interface
   # DRB TO-DO
end_dis_interface
```

- **演示要点**：演示 dis_interface（最小结构，无子参数）

### event（mission_design_astrolabe）｜

- **关键词**：event, execute_at
- **出处**：`space_operations/mission_design_astrolabe.txt:100-102`
- **片段**：

```text
         event perform_staging
            execute_at relative_time 0 seconds
         end_event
```

- **演示要点**：演示 event 的参数：execute_at

### event_output（bomb_demo）｜事件输出

- **关键词**：event_output, file, time_format, enable, disable, print_failed_sensor_detection_attempts, print_failed_message_delivery_attempts, 事件输出
- **出处**：`suppressor/bomb_demo.txt:49-62`
- **片段**：

```text
event_output
   file replay.evt
   time_format h:m:s.3
   enable all
   disable LOCAL_TRACK_UPDATED
   disable LOCAL_TRACK_CORRELATION
   disable LOCAL_TRACK_DECORRELATION
   disable SENSOR_DETECTION_ATTEMPT
   disable SENSOR_TRACK_UPDATED

   enable SENSOR_DETECTION_ATTEMPT
   print_failed_sensor_detection_attempts true
   print_failed_message_delivery_attempts false
end_event_output
```

- **演示要点**：演示 event_output 的参数：file, time_format, enable, disable, print_failed_sensor_detection_attempts, print_failed_message_delivery_attempts

### event_output（j11_out）｜事件输出

- **关键词**：event_output, file, time_format, lat_lon_format, print_track_in_message, disable, enable, 事件输出
- **出处**：`l16_j11/j11_out.txt:33-49`　（同签名共 27 处，另见 `l16_j11/j11_in.txt:38`、`iads_c2_demos/setup/event_output.txt:16`、`launcher/event_output.txt:11`）
- **片段**：

```text
event_output
   file output/$(CASE).evt
   time_format h:m:s.1
   lat_lon_format d:m:s.2
   print_track_in_message true

   disable TEAM_NAME_DEFINITION

   enable MESSAGE_RECEIVED
   enable PLATFORM_ADDED
   enable WEAPON_FIRED
   enable WEAPON_HIT
   enable WEAPON_MISSED
   enable WEAPON_TERMINATED
   enable WEAPON_TURNED_OFF
   enable WEAPON_TURNED_ON
end_event_output
```

- **演示要点**：演示 event_output 的参数：file, time_format, lat_lon_format, print_track_in_message, disable, enable

### event_output（oo_grid）｜事件输出

- **关键词**：event_output, time_format, lat_lon_format, print_track_in_message, disable, enable, 事件输出
- **出处**：`engage/oo_grid.txt:105-158`
- **片段**：

```text
event_output
   time_format h:m:s.1
   lat_lon_format d:m:s.2
   print_track_in_message true

   disable TEAM_NAME_DEFINITION

   #enable COMM_TURNED_OFF
   #enable COMM_TURNED_ON
   #enable JAMMING_ATTEMPT
   #enable JAMMING_REQUEST_CANCELED
   #enable JAMMING_REQUEST_INITIATED
   #enable JAMMING_REQUEST_UPDATED
   #enable LOCAL_TRACK_CORRELATION
   #enable LOCAL_TRACK_DECORRELATION
   #enable LOCAL_TRACK_INITIATED
   #enable LOCAL_TRACK_UPDATED
   #enable LOCAL_TRACK_DROPPED
   #enable MESSAGE_DISCARDED
   #enable MESSAGE_UPDATED
   #enable MESSAGE_QUEUED
   #enable MESSAGE_RECEIVED
   #enable MESSAGE_TRANSMITTED
   #enable OPERATING_LEVEL_CHANGED
   #enable PLATFORM_ADDED
   #enable PLATFORM_DELETED
   #enable PLATFORM_BROKEN
   #enable PROCESSOR_TURNED_OFF
   #enable PROCESSOR_TURNED_ON
   #enable SENSOR_DETECTION_ATTEMPT
   #enable SENSOR_MODE_ACTIVATED
   #enable SENSOR_MODE_DEACTIVATED
   #enable SENSOR_REQUEST_CANCELED
   #enable SENSOR_REQUEST_INITIATED
   #enable SENSOR_REQUEST_UPDATED
   #enable SENSOR_TRACK_INITIATED
   #enable SENSOR_TRACK_UPDATED
   #enable SENSOR_TRACK_DROPPED
   #enable SENSOR_TURNED_ON
   #enable SENSOR_TURNED_OFF
   #enable TASK_ASSIGNED
   #enable TASK_CANCELED
   #enable TASK_COMPLETED
   enable WEAPON_FIRE_ABORTED
   enable WEAPON_FIRE_REQUESTED
   enable WEAPON_FIRED
   enable WEAPON_HIT
   enable WEAPON_MISSED
   enable WEAPON_RELOAD_STARTED
   enable WEAPON_RELOAD_ENDED
   enable WEAPON_TERMINATED
   enable WEAPON_TURNED_OFF
   enable WEAPON_TURNED_ON
end_event_output
```

- **演示要点**：演示 event_output 的参数：time_format, lat_lon_format, print_track_in_message, disable, enable

### event_output（event_output）｜事件输出

- **关键词**：event_output, file, time_format, lat_lon_format, print_track_in_message, enable, 事件输出
- **出处**：`new_guidance/event_output.txt:11-64`
- **片段**：

```text
event_output
   file replay.evt
   time_format h:m:s.1
   lat_lon_format d:m:s.2
   print_track_in_message true

#   disable TEAM_NAME_DEFINITION
#   #enable all
#   #enable COMM_TURNED_OFF
#   #enable COMM_TURNED_ON
#   enable JAMMING_ATTEMPT
#   #enable LOCAL_TRACK_CORRELATION
#   #enable LOCAL_TRACK_DECORRELATION
#   enable LOCAL_TRACK_INITIATED
#   #enable LOCAL_TRACK_UPDATED
#   enable LOCAL_TRACK_DROPPED
#   #enable MESSAGE_DISCARDED
#   #enable MESSAGE_UPDATED
#   #enable MESSAGE_QUEUED
#   #enable MESSAGE_RECEIVED
#   #enable MESSAGE_TRANSMITTED
#   enable OPERATING_LEVEL_CHANGED
#   #enable PLATFORM_ADDED
#   #enable PLATFORM_DELETED
#   enable PLATFORM_BROKEN
#   #enable PROCESSOR_TURNED_OFF
#   #enable PROCESSOR_TURNED_ON
#   #enable SENSOR_DETECTION_ATTEMPT
#   enable SENSOR_MODE_ACTIVATED
#   enable SENSOR_MODE_DEACTIVATED
#   enable SENSOR_REQUEST_CANCELED
#   enable SENSOR_REQUEST_INITIATED
#   enable SENSOR_REQUEST_UPDATED
#   enable SENSOR_TRACK_INITIATED
#   #enable SENSOR_TRACK_UPDATED
#   enable SENSOR_TRACK_DROPPED
#   enable SENSOR_TURNED_ON
#   enable SENSOR_TURNED_OFF
#   enable TASK_ASSIGNED
#   enable TASK_CANCELED
#   enable TASK_COMPLETED
#   enable WEAPON_FIRE_ABORTED
#   enable WEAPON_FIRE_REQUESTED
#   enable WEAPON_FIRED
#   enable WEAPON_HIT
#   enable WEAPON_MISSED
#   enable WEAPON_RELOAD_STARTED
#   enable WEAPON_RELOAD_ENDED
#   enable WEAPON_TERMINATED
#   #enable WEAPON_TURNED_OFF
#   #enable WEAPON_TURNED_ON

   enable all
end_event_output
```

- **演示要点**：演示 event_output 的参数：file, time_format, lat_lon_format, print_track_in_message, enable

### event_output（ground_hel_vs_hypersonic）｜事件输出

- **关键词**：event_output, file, disable, flush_output, enable, 事件输出
- **出处**：`hel/ground_hel_vs_hypersonic.txt:160-174`
- **片段**：

```text
event_output
  file output/$(CASE).evt
  disable all
  flush_output enabled
  //enable LASER_SENSOR_STATE_CHANGE
  enable IMPLICIT_WEAPON_BEGIN_ENGAGEMENT
  enable IMPLICIT_WEAPON_END_ENGAGEMENT
  enable DIRECTED_ENERGY_WEAPON_BEGIN_SHOT
  enable DIRECTED_ENERGY_WEAPON_UPDATE_SHOT
  enable DIRECTED_ENERGY_WEAPON_END_SHOT
  enable SENSOR_MODE_ACTIVATED
  enable SENSOR_MODE_DEACTIVATED
  enable WEAPON_HIT
  enable PLATFORM_DELETED
end_event_output
```

- **演示要点**：演示 event_output 的参数：file, disable, flush_output, enable

### event_output（acoustic_demo2）｜事件输出

- **关键词**：event_output, file, disable, enable, 事件输出
- **出处**：`acoustic/acoustic_demo2.txt:264-270`　（同签名共 10 处，另见 `brawler/brawler_demo_combined_agent_BVR.txt:18`、`acoustic/acoustic_demo.txt:189`、`multiresolution_demos/sensor_demo.txt:35`）
- **片段**：

```text
event_output
   file output/acoustic_demo2.evt
   disable all
#   enable SENSOR_DETECTION_ATTEMPT
   enable SENSOR_TRACK_INITIATED
   enable SENSOR_TRACK_DROPPED
end_event_output
```

- **演示要点**：演示 event_output 的参数：file, disable, enable

### event_output（hel_test）｜事件输出

- **关键词**：event_output, file, enable, flush_output, 事件输出
- **出处**：`hel/hel_test.txt:325-340`　（同签名共 2 处，另见 `hel/intersect_mesh_test_beam_director.txt:439`）
- **片段**：

```text
event_output
  file output/$(CASE).evt
  enable DIRECTED_ENERGY_WEAPON_BEGIN_SHOT
  enable DIRECTED_ENERGY_WEAPON_END_SHOT
  //enable DIRECTED_ENERGY_WEAPON_BEGIN_ENGAGEMENT
  //enable DIRECTED_ENERGY_WEAPON_END_ENGAGEMENT
  enable DIRECTED_ENERGY_WEAPON_UPDATE_SHOT
  enable DIRECTED_ENERGY_WEAPON_COOLDOWN_COMPLETE
  //enable WEAPON_FIRED
  //enable WEAPON_HIT
  //enable SENSOR_TRACK_INITIATED
  enable WEAPON_TERMINATED
  enable PLATFORM_DELETED
  //enable COMMENT
  flush_output enabled
end_event_output
```

- **演示要点**：演示 event_output 的参数：file, enable, flush_output

### event_output（ttr_test）｜事件输出

- **关键词**：event_output, time_format, disable, enable, 事件输出
- **出处**：`iads/ttr_test.txt:125-148`
- **片段**：

```text
event_output
#   file STDOUT
   time_format s.3
   disable all
   enable LOCAL_TRACK_INITIATED
   enable LOCAL_TRACK_UPDATED
   enable LOCAL_TRACK_DROPPED
   #enable MESSAGE_TRANSMITTED
   #enable MESSAGE_RECEIVED
   enable SENSOR_TURNED_OFF
   enable SENSOR_TURNED_ON
   enable SENSOR_DETECTION_ATTEMPT
   enable SENSOR_REQUEST_INITIATED
   enable SENSOR_REQUEST_CANCELED
   enable SENSOR_REQUEST_UPDATED
   enable SENSOR_TRACK_INITIATED
   enable SENSOR_TRACK_UPDATED
   enable SENSOR_TRACK_DROPPED
   enable STATE_ENTRY
   enable STATE_EXIT
   enable TASK_ASSIGNED
   enable TASK_CANCELED
   enable TASK_COMPLETED
end_event_output
```

- **演示要点**：演示 event_output 的参数：time_format, disable, enable

### event_output（event_output）｜事件输出

- **关键词**：event_output, file, enable, 事件输出
- **出处**：`alternate_locations/event_output.txt:10-13`　（同签名共 107 处，另见 `alv_routing/setup.txt:21`、`comm/ad_hoc.txt:44`、`draw/draw_demo.txt:221`）
- **片段**：

```text
event_output
   file STDOUT
   enable ALTERNATE_LOCATIONS_INITIALIZED
end_event_output
```

- **演示要点**：演示 event_output 的参数：file, enable

### event_output（scenario_test_launch_computer）｜事件输出

- **关键词**：event_output, file, 事件输出
- **出处**：`base_types/weapons/aam/scenario_test_launch_computer.txt:26-28`　（同签名共 13 处，另见 `electronic_warfare/agile_repeater_jamming-rt1.txt:467`、`electronic_warfare/agile_repeater_jamming-rt2.txt:467`、`electronic_warfare/air-to-air-rt1.txt:372`）
- **片段**：

```text
event_output
   file   $(CASE).evt
end_event_output
```

- **演示要点**：演示 event_output 的参数：file

### event_output（test_strike）｜事件输出

- **关键词**：event_output, enable, 事件输出
- **出处**：`iads/test_strike.txt:24-29`　（同签名共 2 处，另见 `cyber/Cyber_Script_Effect_Demo.txt:20`）
- **片段**：

```text
event_output
   enable SENSOR_DETECTION_ATTEMPT
   enable SENSOR_TRACK_UPDATED
   enable MESSAGE_TRANSMITTED
   enable MESSAGE_RECEIVED
end_event_output
```

- **演示要点**：演示 event_output 的参数：enable

### event_output（MITM_demo）｜事件输出

- **关键词**：event_output, 事件输出
- **出处**：`cyber/MITM_demo.txt:20-21`
- **片段**：

```text
event_output file output/cyber_script_effect_demo.evt
end_event_output
```

- **演示要点**：演示 event_output（最小结构，无子参数）

### event_pipe（optical_signature_demo）｜事件管道

- **关键词**：event_pipe, file, use_preset, enable, 事件管道
- **出处**：`multiresolution_demos/optical_signature_demo.txt:57-61`　（同签名共 4 处，另见 `multiresolution_demos/radar_signature_demo.txt:75`、`signature_demos/1st_composite_optical_signature_rocket.txt:65`、`signature_demos/2nd_composite_optical_signature_fighter.txt:65`）
- **片段**：

```text
event_pipe
   file output/$(CASE).aer
   use_preset full
   enable DETECTION_ATTEMPT 
end_event_pipe
```

- **演示要点**：演示 event_pipe 的参数：file, use_preset, enable

### event_pipe（sensor_demo）｜事件管道

- **关键词**：event_pipe, use_preset, enable, maximum_mover_update_interval, 事件管道
- **出处**：`multiresolution_demos/sensor_demo.txt:28-33`
- **片段**：

```text
event_pipe file 
   output/$(CASE).aer
   use_preset full
   enable DETECTION_ATTEMPT
   maximum_mover_update_interval 0 sec
end_event_pipe
```

- **演示要点**：演示 event_pipe 的参数：use_preset, enable, maximum_mover_update_interval

### event_pipe（event_pipe）｜事件管道

- **关键词**：event_pipe, file, use_preset, 事件管道
- **出处**：`aea_iads/event_pipe.txt:11-14`　（同签名共 32 处，另见 `ballistic/event_pipe.txt:11`、`ballistic_missile_shootdown/ballistic_shootdown.txt:16`、`ballistic_missile_shootdown/event_pipe.txt:11`）
- **片段**：

```text
event_pipe
   file replay.aer
   use_preset default
end_event_pipe
```

- **演示要点**：演示 event_pipe 的参数：file, use_preset

### event_pipe（alv_demo_with_jammer）｜事件管道

- **关键词**：event_pipe, file, enable, 事件管道
- **出处**：`alv_routing/alv_demo_with_jammer.txt:19-22`　（同签名共 13 处，另见 `p6dof/std_setup.txt:43`、`air_to_air/1v1_initial_prediction.txt:69`、`six_dof/std_setup.txt:43`）
- **片段**：

```text
event_pipe
   file output/$(CASE).aer
   enable DETECTION_ATTEMPT
end_event_pipe
```

- **演示要点**：演示 event_pipe 的参数：file, enable

### event_pipe（duck_hunt）｜事件管道

- **关键词**：event_pipe, file, disable, 事件管道
- **出处**：`cyber/duck_hunt.txt:23-26`
- **片段**：

```text
event_pipe
   file output/$(CASE).aer
   disable DRAW
end_event_pipe
```

- **演示要点**：演示 event_pipe 的参数：file, disable

### event_pipe（space_mover_demo）｜事件管道

- **关键词**：event_pipe, file, maximum_mover_update_interval, 事件管道
- **出处**：`multiresolution_demos/space_mover_demo.txt:33-36`
- **片段**：

```text
event_pipe
  file output/$(CASE).aer
  maximum_mover_update_interval 0 sec
end_event_pipe
```

- **演示要点**：演示 event_pipe 的参数：file, maximum_mover_update_interval

### event_pipe（startup）｜事件管道

- **关键词**：event_pipe, file, visual_part_update_interval, 事件管道
- **出处**：`visual_part/startup.txt:18-21`
- **片段**：

```text
event_pipe
   file output/visual_part_demo.aer
   visual_part_update_interval 1 sec
end_event_pipe
```

- **演示要点**：演示 event_pipe 的参数：file, visual_part_update_interval

### event_pipe（acoustic_demo）｜事件管道

- **关键词**：event_pipe, file, 事件管道
- **出处**：`acoustic/acoustic_demo.txt:185-187`　（同签名共 117 处，另见 `acoustic/acoustic_demo2.txt:260`、`alv_routing/setup.txt:17`、`ballistic_missile_shootdown/weapons/sam/blue_naval_sam_lcg.txt:49`）
- **片段**：

```text
event_pipe
   file output/acoustic_demo.aer
end_event_pipe
```

- **演示要点**：演示 event_pipe 的参数：file

### event_pipe（air_mover_demo）｜事件管道

- **关键词**：event_pipe, maximum_mover_update_interval, 事件管道
- **出处**：`multiresolution_demos/air_mover_demo.txt:29-32`　（同签名共 3 处，另见 `multiresolution_demos/fuel_demo.txt:30`、`multiresolution_demos/processor_demo.txt:26`）
- **片段**：

```text
event_pipe file 
   output/$(CASE).aer
   maximum_mover_update_interval 0 sec
end_event_pipe
```

- **演示要点**：演示 event_pipe 的参数：maximum_mover_update_interval

### event_pipe（blue_lr_sam_lcg）｜事件管道

- **关键词**：event_pipe, 事件管道
- **出处**：`base_types/weapons/sam/blue_lr_sam_lcg.txt:52-54`　（同签名共 18 处，另见 `base_types/weapons/sam/blue_naval_sam_lcg.txt:49`、`base_types/weapons/sam/blue_sr_sam_lcg.txt:67`、`behavior_tree/blackboard.txt:17`）
- **片段**：

```text
event_pipe
   #file replay.aer
end_event_pipe
```

- **演示要点**：演示 event_pipe（最小结构，无子参数）

### events（grid_w_observer）｜

- **关键词**：events, enable
- **出处**：`engage/grid_w_observer.txt:186-188`　（同签名共 2 处，另见 `engage/oo_grid.txt:97`）
- **片段**：

```text
     events
        enable all
     end_events
```

- **演示要点**：演示 events 的参数：enable

### grid · WSF_LAT_LON_GRID｜

- **关键词**：grid, WSF_LAT_LON_GRID, origin, longitude_spacing, latitude_spacing, latitude_span, longitude_span, altitude, asset, grid_data_file
- **出处**：`coverage_demos/coverage_grids/geo_belt_grid_coverage.txt:12-21`　（同签名共 2 处，另见 `coverage_demos/coverage_grids/global_lat_lon_coverage.txt:12`）
- **片段**：

```text
grid geo_grid WSF_LAT_LON_GRID 
   origin 0.0n 120w 
   longitude_spacing 8 deg
   latitude_spacing 1 deg
   latitude_span 3.0n 3.0s
   longitude_span 180w 180.0e
   altitude 35786 km msl
   asset WSF_PLATFORM none
   grid_data_file output/geo_grid_data.txt
end_grid
```

- **演示要点**：演示 WSF_LAT_LON_GRID 的参数：origin, longitude_spacing, latitude_spacing, latitude_span, longitude_span, altitude, asset, grid_data_file

### grid · WSF_ZONE_BASED_GRID｜

- **关键词**：grid, WSF_ZONE_BASED_GRID, zone, asset, spacing, grid_data_file
- **出处**：`coverage_demos/coverage_grids/conus_zone_coverage.txt:13-18`
- **片段**：

```text
grid conusgrid WSF_ZONE_BASED_GRID 
   zone UNITED_STATES
   asset WSF_PLATFORM none
   spacing 4 deg
   grid_data_file output/conus_grid_data.txt
end_grid
```

- **演示要点**：演示 WSF_ZONE_BASED_GRID 的参数：zone, asset, spacing, grid_data_file

### grid · WSF_EXISTING_PLATFORM_GRID｜

- **关键词**：grid, WSF_EXISTING_PLATFORM_GRID, platform, grid_data_file
- **出处**：`coverage_demos/coverage_grids/existing_grid_coverage.txt:13-20`
- **片段**：

```text
grid ex_grid WSF_EXISTING_PLATFORM_GRID
   platform mover1 none
   platform mover2 none
   platform mover3 none
   platform mover4 none
   platform mover5 none
   grid_data_file output/ex_grid_data.txt
end_grid
```

- **演示要点**：演示 WSF_EXISTING_PLATFORM_GRID 的参数：platform, grid_data_file

### grid · WSF_COMPOSITE_GRID｜

- **关键词**：grid, WSF_COMPOSITE_GRID, subgrid, grid_data_file
- **出处**：`coverage_demos/coverage_grids/state_zone_lat_lon_grid_coverage.txt:13-30`
- **片段**：

```text
grid state_grid WSF_COMPOSITE_GRID

   subgrid fl_grid WSF_ZONE_BASED_GRID 
      zone Florida
      asset WSF_PLATFORM none
      spacing 0.5 deg
      altitude 1 m agl
   end_subgrid
   
   subgrid tx_grid WSF_ZONE_BASED_GRID
      zone Texas
      asset WSF_PLATFORM none
      spacing 1 deg
      altitude 1 m agl
   end_subgrid
   
   grid_data_file output/states_grid_data.txt
end_grid
```

- **演示要点**：演示 WSF_COMPOSITE_GRID 的参数：subgrid, grid_data_file

### grid · WSF_DISTANCE_STEPPED_GRID｜

- **关键词**：grid, WSF_DISTANCE_STEPPED_GRID, grid_data_file
- **出处**：`coverage_demos/coverage_grids/uav_stepped_grid_coverage.txt:12-19`
- **片段**：

```text
grid uav_grid WSF_DISTANCE_STEPPED_GRID  
     altitude 1.0 m agl
     step_distance 10 km 10 km
     size 7 7
     origin 39:10n 106:50w
     asset WSF_PLATFORM none
   grid_data_file output/uav_grid_data.txt  
end_grid
```

- **演示要点**：演示 WSF_DISTANCE_STEPPED_GRID 的参数：grid_data_file

### horizontal_coverage（hcd-ew_radar）｜

- **关键词**：horizontal_coverage, required_pd, target_speed, target_heading, target_pitch, target_roll, azimuth_limits, azimuth_step, large_range_step, small_range_step, output_file, altitude_units, range_units
- **出处**：`sensor_plot/radar/hcd-ew_radar.txt:29-55`　（同签名共 5 处，另见 `sensor_plot/radar/hm-bistatic-ft-jamming-lab.txt:236`、`sensor_plot/radar/hm-bistatic-lab.txt:170`、`sensor_plot/radar/hm-bistatic-sp-jamming-lab.txt:187`）
- **片段**：

```text
horizontal_coverage
   required_pd 0.5

   target_speed 450 kts
   target_heading 0 deg
   target_pitch 0 deg
   target_roll  0 deg

   azimuth_limits 0.0 deg 360.0 deg
   #azimuth_limits -180.0 deg 180.0 deg
   azimuth_step 0.1 deg

   #maximum_range 100 km # comment out for auto range finding
   large_range_step 5000 m
   small_range_step  100 m

   output_file hcd-ew_radar.hcd
   altitude_units ft
   range_units km
   x_units km
   y_units km

   altitude 30 kft

   output_min_range
   output_max_range
end_horizontal_coverage
```

- **演示要点**：演示 horizontal_coverage 的参数：required_pd, target_speed, target_heading, target_pitch, target_roll, azimuth_limits, azimuth_step, large_range_step, small_range_step, output_file

### horizontal_map（hm-reverse）｜

- **关键词**：horizontal_map, platform_to_detect_name, exclude, gnuplot_file, output_column_limit, variable, header_line_1, down_range_limits, down_range_step, cross_range_limits, cross_range_step, target_heading, target_altitude
- **出处**：`sensor_plot/esm/hm-reverse.txt:43-68`
- **片段**：

```text
horizontal_map
   platform_to_detect_name emitter
   exclude sensor_type BLUE_FCR_RADAR_1
   exclude sensor_type BLUE_ABM_TTR

   gnuplot_file hm-reverse.plt
   output_column_limit 100

   // One of the below sections can be used to choose the
   // variable of interest to plot

   variable signal_power
   header_line_1 "Received signal power"

   down_range_limits  -200 nm 200 nm
   down_range_step     1 nm
   cross_range_limits  -200 nm 200 nm
   cross_range_step    1 nm
   cross_range_limits 0 nm 0 nm

   target_heading  270 deg
   target_altitude 30000 ft
   target_speed    0 kts
   target_pitch    0 deg
   target_roll     0 deg
end_horizontal_map
```

- **演示要点**：演示 horizontal_map 的参数：platform_to_detect_name, exclude, gnuplot_file, output_column_limit, variable, header_line_1, down_range_limits, down_range_step, cross_range_limits, cross_range_step

### horizontal_map（hm-bistatic-lab）｜

- **关键词**：horizontal_map, pd_map_file, gnuplot_file, gnuplot_player_file, output_column_limit, exclude, variable, header_line_1, defended_area_report_file, target_region, target_heading, target_altitude, target_speed
- **出处**：`sensor_plot/radar/hm-bistatic-lab.txt:99-168`　（同签名共 5 处，另见 `sensor_plot/radar/hm-bistatic-radar.txt:105`、`sensor_plot/radar/hm-bistatic-sp-jamming-lab.txt:116`、`sensor_plot/radar/hm-bistatic-support-jamming-lab.txt:123`）
- **片段**：

```text
horizontal_map
   pd_map_file hm-bistatic-lab-$(CASE).pd
   gnuplot_file hm-bistatic-lab-$(CASE).plt
   gnuplot_player_file players-bistatic-lab.plt
   output_column_limit 100

   exclude sensor_type BISTATIC_SENSOR_XMTR

   // One of the below sections can be used to choose the
   // variable of interest to plot
   variable pd
   header_line_1 "Horizontal pd map"
   defended_area_report_file bistatic-lab.log # valid only if variable is pd

   #variable required_rcs
   #detection_reference 12.8 dB
   #header_line_1 "Required RCS map"

   #variable radar_signature
   #header_line_1 "Radar Signature viewed by sensor"

   #variable optical_signature
   #header_line_1 "Optical Signature viewed by sensor"

   #variable infrared_signature
   #header_line_1 "Infrared Signature viewed by sensor"

   #variable signal_power
   #header_line_1 "signal power in watts"

   variable signal_to_noise
   header_line_1 "S/N Ratio in dB"

   #variable signal_to_interference
   #header_line_1 "S/I Ratio in dB"

   #variable detection_threshold
   #header_line_1 "DT"

   #variable background_radiant_intensity
   #header_line_1 "Background Radiant Intensity"

   #variable signal_at_target
   #header_line_1 "Signal at target."

   #variable azimuth_angle
   #variable angle
   #variable grazing_angle

   target_region
      down_range_limits   -500 km 500 km
      down_range_step     1 km
      cross_range_limits  -300 km 300 km
      cross_range_step    1 km
   end_target_region

   #target_region
   #   latitude_limits  3s 3n
   #   latitude_step     0.01
   #   longitude_limits  2w 2e
   #   longitude_step    0.01
   #end_target_region

   target_heading  180 deg
   target_altitude 2500 m
   target_speed    450 kts
   target_pitch    0 deg
   target_roll     0 deg

end_horizontal_map
```

- **演示要点**：演示 horizontal_map 的参数：pd_map_file, gnuplot_file, gnuplot_player_file, output_column_limit, exclude, variable, header_line_1, defended_area_report_file, target_region, target_heading

### horizontal_map（hm-tdoa）｜

- **关键词**：horizontal_map, platform_to_detect_name, exclude, gnuplot_file, output_column_limit, variable, header_line_1, defended_area_report_file, target_region, target_heading, target_altitude, target_speed, target_pitch
- **出处**：`sensor_plot/esm/hm-tdoa.txt:140-168`
- **片段**：

```text
horizontal_map

   platform_to_detect_name TARGET

   exclude platform_type SLAVE

   #pd_map_file hm-tdoa.pd
   gnuplot_file hm-tdoa.plt
   output_column_limit 100

   // One of the below sections can be used to choose the
   // variable of interest to plot
   variable pd
   header_line_1 "Horizontal pd map"
   defended_area_report_file tdoa.log # valid only if variable is pd

   target_region
      down_range_limits  -120 nm 120 nm
      down_range_step     2 nm
      cross_range_limits  -120 nm 120 nm
      cross_range_step    2 nm
   end_target_region

   target_heading  270 deg
   target_altitude 30000 ft
   target_speed    0 kts
   target_pitch    0 deg
   target_roll     0 deg
end_horizontal_map
```

- **演示要点**：演示 horizontal_map 的参数：platform_to_detect_name, exclude, gnuplot_file, output_column_limit, variable, header_line_1, defended_area_report_file, target_region, target_heading, target_altitude

### horizontal_map（hm-mtd_radar）｜

- **关键词**：horizontal_map, pd_map_file, gnuplot_file, gnuplot_player_file, output_column_limit, header_line_1, variable, defended_area_report_file, target_region, target_heading, target_altitude, target_speed, target_pitch
- **出处**：`sensor_plot/radar/hm-mtd_radar.txt:43-90`　（同签名共 5 处，另见 `sensor_plot/radar/hm-mti_radar.txt:43`、`sensor_plot/radar/hm-pd_radar.txt:43`、`sensor_plot/radar/hm-ucav-dry.txt:34`）
- **片段**：

```text
horizontal_map
   pd_map_file hm-mtd_radar.pd
   gnuplot_file hm-mtd_radar.plt
   gnuplot_player_file mtd_radar.plt
   output_column_limit 100

   header_line_1 "MTD Radar Horizontal Map"

   // One of the below sections can be used to choose the
   // variable of interest to plot
   variable pd
   defended_area_report_file mtd_radar.log # valid only if variable is pd

   #variable required_rcs
   #detection_reference 12.8 dB

   #variable radar_signature
   #variable optical_signature
   #variable infrared_signature
   #variable signal_to_noise
   #variable signal_to_interference
   #variable background_radiant_intensity
   #variable signal_at_target
   #variable clutter_power
   #variable ground_range
   #variable slant_range
   #variable azimuth_angle
   #variable angle
   #variable grazing_angle
   #variable detection_threshold
   #variable noise_power
   #variable noise_jammer_power
   #variable jammer_to_mds
   #script_variable jammer_to_mds

   target_region
      down_range_limits  -350 km 350 km
      down_range_step     5 km
      cross_range_limits  -350 km 350 km
      cross_range_step    5 km
   end_target_region

   target_heading  90 deg
   target_altitude 20000 ft
   target_speed    250 kts
   target_pitch    0 deg
   target_roll     0 deg
end_horizontal_map
```

- **演示要点**：演示 horizontal_map 的参数：pd_map_file, gnuplot_file, gnuplot_player_file, output_column_limit, header_line_1, variable, defended_area_report_file, target_region, target_heading, target_altitude

### horizontal_map（hm-ucav-soj2）｜

- **关键词**：horizontal_map, exclude, pd_map_file, gnuplot_file, output_column_limit, variable, header_line_1, defended_area_report_file, target_region, target_heading, target_altitude, target_speed, target_pitch
- **出处**：`sensor_plot/radar/hm-ucav-soj2.txt:50-122`
- **片段**：

```text
horizontal_map

   exclude sensor_type UCAV_ESM

   pd_map_file hm-ucav_vs_acq-soj.pd
   gnuplot_file hm-ucav_vs_acq-soj.plt
   output_column_limit 100

   // One of the below sections can be used to choose the
   // variable of interest to plot
   variable pd
   header_line_1 "Horizontal pd map"
   defended_area_report_file ucav_vs_acq-soj.log # valid only if variable is pd

   #variable required_rcs
   #detection_reference 12.8 dB
   #header_line_1 "Required RCS map"

   #variable radar_signature
   #header_line_1 "Radar Signature viewed by sensor"

   #variable optical_signature
   #header_line_1 "Optical Signature viewed by sensor"

   #variable infrared_signature
   #header_line_1 "Infrared Signature viewed by sensor"

   #variable signal_power
   #header_line_1 "Received signal power"

   #variable clutter_power
   #header_line_1 "Clutter power"

   #variable jammer_power
   #header_line_1 "Received jammer power"

   #variable jammer_to_signal
   #header_line_1 "J/S in dB

   #variable signal_to_noise
   #header_line_1 "S/N Ratio in dB

   #variable signal_to_interference
   #header_line_1 "S/I Ratio in dB

   #variable signal_at_target
   #header_line_1 "Signal at target."

   #variable background_radiant_intensity
   #header_line_1 "Background Radiant Intensity"

   #variable contrast_radiant_intensity
   #header_line_1 "Contrast Radiant Intensity."

   #variable attenuation_factor
   #header_line_1 "Attenuation factor."

   #variable propagation_factor
   #header_line_1 "Propagation factor."

   target_region
      down_range_limits  -120 nm 120 nm
      down_range_step     1 nm
      cross_range_limits  -120 nm 120 nm
      cross_range_step    1 nm
   end_target_region

   target_heading  270 deg
   target_altitude 30000 ft
   target_speed    450 kts
   target_pitch 0 deg
   target_roll 0 deg
end_horizontal_map
```

- **演示要点**：演示 horizontal_map 的参数：exclude, pd_map_file, gnuplot_file, output_column_limit, variable, header_line_1, defended_area_report_file, target_region, target_heading, target_altitude

### horizontal_map（hm-required-jamming-power）｜

- **关键词**：horizontal_map, platform_to_detect_name, jamming_platform_name, jammer_to_signal_reference, gnuplot_file, output_column_limit, variable, header_line_1, target_region, target_heading, target_altitude, target_speed, target_pitch
- **出处**：`sensor_plot/radar/hm-required-jamming-power.txt:53-133`
- **片段**：

```text
horizontal_map

   platform_to_detect_name TARGET

   jamming_platform_name jammer  # For escort or stand-off jammer
   #jamming_platform_name TARGET # For self-protect (after 1.6.3 this is the default)
   jammer_to_signal_reference 1.0 dB

   #pd_map_file hm-jammer-detect.pd
   gnuplot_file hm-required-jammer-power.plt
   output_column_limit 100

   // One of the below sections can be used to choose the
   // variable of interest to plot
   #variable pd
   #header_line_1 "Horizontal pd map"
   #defended_area_report_file ucav_vs_acq-soj.log # valid only if variable is pd

   #variable detection_threshold
   #header_line_1 "Detection Threshold"

   #variable required_rcs
   #detection_reference 12.8 dB
   #header_line_1 "Required RCS map"

   #variable radar_signature
   #header_line_1 "Radar Signature viewed by sensor"

   #variable optical_signature
   #header_line_1 "Optical Signature viewed by sensor"

   #variable infrared_signature
   #header_line_1 "Infrared Signature viewed by sensor"

   #variable signal_power
   #header_line_1 "Received signal power"

   #variable clutter_power
   #header_line_1 "Clutter power"

   #variable signal_to_noise
   #header_line_1 "S/N Ratio in dB"

   #variable signal_to_interference
   #header_line_1 "S/I Ratio in dB"

   #variable signal_at_target
   #header_line_1 "Signal at target."

   #variable background_radiant_intensity
   #header_line_1 "Background Radiant Intensity"

   #variable contrast_radiant_intensity
   #header_line_1 "Contrast Radiant Intensity."

   #variable attenuation_factor
   #header_line_1 "Attenuation factor."

   #variable propagation_factor
   #header_line_1 "Propagation factor."

   variable required_jamming_power
   header_line_1 "Required jamming power"

   target_region
      down_range_limits  -200 nm 200 nm
      down_range_step     1 nm
      cross_range_limits  -200 nm 200 nm
      cross_range_step    1 nm

#      down_range_limits   134 nm 135 nm
#      down_range_limits   -151 nm 0 nm
#      cross_range_limits  -151 nm 0 nm
   end_target_region

   target_heading  270 deg
   target_altitude 30000 ft
   target_speed    450 kts
   target_pitch    0 deg
   target_roll     0 deg
end_horizontal_map
```

- **演示要点**：演示 horizontal_map 的参数：platform_to_detect_name, jamming_platform_name, jammer_to_signal_reference, gnuplot_file, output_column_limit, variable, header_line_1, target_region, target_heading, target_altitude

### horizontal_map（hm-pass-detect）｜

- **关键词**：horizontal_map, platform_to_detect_name, jamming_platform_name, gnuplot_file, output_column_limit, variable, header_line_1, target_region, target_heading, target_altitude, target_speed, target_pitch, target_roll
- **出处**：`sensor_plot/radar/hm-pass-detect.txt:94-167`
- **片段**：

```text
horizontal_map

   platform_to_detect_name jammer-1
   jamming_platform_name jammer-1

   #pd_map_file hm-pass-detect.pd
   gnuplot_file hm-pass-detect.plt
   output_column_limit 100

   // One of the below sections can be used to choose the
   // variable of interest to plot
   #variable pd
   #header_line_1 "Horizontal pd map"
   #defended_area_report_file ucav_vs_acq-soj.log # valid only if variable is pd

   #variable required_rcs
   #detection_reference 12.8 dB
   #header_line_1 "Required RCS map"

   #variable radar_signature
   #header_line_1 "Radar Signature viewed by sensor"

   #variable optical_signature
   #header_line_1 "Optical Signature viewed by sensor"

   #variable infrared_signature
   #header_line_1 "Infrared Signature viewed by sensor"

   #variable signal_power
   #header_line_1 "Received signal power"

   #variable clutter_power
   #header_line_1 "Clutter power"

   #variable jammer_power
   #header_line_1 "Received jammer power"

   #variable jammer_to_signal
   #header_line_1 "J/S in dB"

   variable signal_to_noise
   header_line_1 "S/N Ratio in dB"

   #variable signal_to_interference
   #header_line_1 "S/I Ratio in dB"

   #variable signal_at_target
   #header_line_1 "Signal at target."

   #variable background_radiant_intensity
   #header_line_1 "Background Radiant Intensity"

   #variable contrast_radiant_intensity
   #header_line_1 "Contrast Radiant Intensity."

   #variable attenuation_factor
   #header_line_1 "Attenuation factor."

   #variable propagation_factor
   #header_line_1 "Propagation factor."

   target_region
      down_range_limits  -200 nm 200 nm
      down_range_step     1 nm
      cross_range_limits  -200 nm 200 nm
      cross_range_step    1 nm
   end_target_region

   target_heading  270 deg
   target_altitude 0 ft
   target_speed    0 kts
   target_pitch 0 deg
   target_roll 0 deg
end_horizontal_map
```

- **演示要点**：演示 horizontal_map 的参数：platform_to_detect_name, jamming_platform_name, gnuplot_file, output_column_limit, variable, header_line_1, target_region, target_heading, target_altitude, target_speed

### horizontal_map（hm-jammer-detect-1）｜

- **关键词**：horizontal_map, platform_to_detect_name, gnuplot_file, output_column_limit, variable, header_line_1, target_region, target_heading, target_altitude, target_speed, target_pitch, target_roll
- **出处**：`sensor_plot/esm/hm-jammer-detect-1.txt:87-162`　（同签名共 2 处，另见 `sensor_plot/esm/hm-jammer-detect-2.txt:98`）
- **片段**：

```text
horizontal_map

   platform_to_detect_name jammer-1

   #pd_map_file hm-jammer-detect.pd
   gnuplot_file hm-jammer-detect-1.plt
   output_column_limit 100

   // One of the below sections can be used to choose the
   // variable of interest to plot
   #variable pd
   #header_line_1 "Horizontal pd map"
   #report_file uvav_vs_acq-soj.log # valid only if variable is pd

   #variable detection_threshold
   #header_line_1 "Detection Threshold"

   #variable required_rcs
   #detection_reference 12.8 dB
   #header_line_1 "Required RCS map"

   #variable radar_signature
   #header_line_1 "Radar Signature viewed by sensor"

   #variable optical_signature
   #header_line_1 "Optical Signature viewed by sensor"

   #variable infrared_signature
   #header_line_1 "Infrared Signature viewed by sensor"

   variable signal_power
   header_line_1 "Received signal power"

   #variable clutter_power
   #header_line_1 "Clutter power"

   #variable jammer_power
   #header_line_1 "Received jammer power"

   #variable jammer_to_signal
   #header_line_1 "J/S in dB"

   #variable signal_to_noise
   #header_line_1 "S/N Ratio in dB"

   #variable signal_to_interference
   #header_line_1 "S/I Ratio in dB"

   #variable signal_at_target
   #header_line_1 "Signal at target."

   #variable background_radiant_intensity
   #header_line_1 "Background Radiant Intensity"

   #variable contrast_radiant_intensity
   #header_line_1 "Contrast Radiant Intensity."

   #variable attenuation_factor
   #header_line_1 "Attenuation factor."

   #variable propagation_factor
   #header_line_1 "Propagation factor."

   target_region
      down_range_limits   -200 nm 200 nm
      down_range_step        1 nm
      cross_range_limits  -200 nm 200 nm
      cross_range_step       1 nm
   end_target_region

   target_heading  270 deg
   target_altitude 10 ft
   target_speed    0 kts
   target_pitch    0 deg
   target_roll     0 deg
end_horizontal_map
```

- **演示要点**：演示 horizontal_map 的参数：platform_to_detect_name, gnuplot_file, output_column_limit, variable, header_line_1, target_region, target_heading, target_altitude, target_speed, target_pitch

### horizontal_map（hm-jammer-detect）｜

- **关键词**：horizontal_map, jamming_platform_name, gnuplot_file, output_column_limit, variable, header_line_1, target_region, target_heading, target_altitude, target_speed, target_pitch, target_roll
- **出处**：`sensor_plot/radar/hm-jammer-detect.txt:75-154`
- **片段**：

```text
horizontal_map

   #platform_to_detect_name TARGET
   jamming_platform_name TARGET

   #pd_map_file hm-jammer-detect.pd
   gnuplot_file hm-jammer-detect.plt
   output_column_limit 100

   // One of the below sections can be used to choose the
   // variable of interest to plot
   #variable pd
   #header_line_1 "Horizontal pd map"
   #defended_area_report_file ucav_vs_acq-soj.log # valid only if variable is pd

   #variable detection_threshold
   #header_line_1 "Detection Threshold"

   #variable required_rcs
   #detection_reference 12.8 dB
   #header_line_1 "Required RCS map"

   #variable radar_signature
   #header_line_1 "Radar Signature viewed by sensor"

   #variable optical_signature
   #header_line_1 "Optical Signature viewed by sensor"

   #variable infrared_signature
   #header_line_1 "Infrared Signature viewed by sensor"

   #variable signal_power
   #header_line_1 "Received signal power"

   #variable clutter_power
   #header_line_1 "Clutter power"

   #variable jammer_power
   #header_line_1 "Received jammer power"

   #variable jammer_to_signal
   #header_line_1 "J/S in dB"

   variable signal_to_noise
   header_line_1 "S/N Ratio in dB"

   #variable signal_to_interference
   #header_line_1 "S/I Ratio in dB"

   #variable signal_at_target
   #header_line_1 "Signal at target."

   #variable background_radiant_intensity
   #header_line_1 "Background Radiant Intensity"

   #variable contrast_radiant_intensity
   #header_line_1 "Contrast Radiant Intensity."

   #variable attenuation_factor
   #header_line_1 "Attenuation factor."

   #variable propagation_factor
   #header_line_1 "Propagation factor."

   #variable required_jammer_power
   #header_line_1 "Required jammer power"

   target_region
      down_range_limits  -200 nm 200 nm
      down_range_step     1 nm
      cross_range_limits  -200 nm 200 nm
      cross_range_step    1 nm
   end_target_region

   target_heading  270 deg
   target_altitude 0 ft
   target_speed    0 kts
   target_pitch 0 deg
   target_roll 0 deg
end_horizontal_map
```

- **演示要点**：演示 horizontal_map 的参数：jamming_platform_name, gnuplot_file, output_column_limit, variable, header_line_1, target_region, target_heading, target_altitude, target_speed, target_pitch

### horizontal_map（sc_fighter）｜

- **关键词**：horizontal_map, sensor_platform_yaw, sensor_platform_pitch, sensor_platform_roll, down_range_limits, down_range_step, cross_range_limits, cross_range_step, target_speed, gnuplot_file, variable
- **出处**：`sensor_plot/sar/sc_fighter.txt:53-71`　（同签名共 2 处，另见 `sensor_plot/sar/sc_bomber.txt:53`）
- **片段**：

```text
horizontal_map
   sensor_platform_yaw       0.0 deg             # <--- Spreadsheet value: Yaw angle
   sensor_platform_pitch     3.0 deg             # <--- Spreadsheet value: Pitch angle
   sensor_platform_roll      0.0 deg             # <--- Spreadsheet value: Roll angle

   down_range_limits         -100 nm 100 nm
   down_range_step           1 nm
   cross_range_limits        -100 nm 100 nm
   cross_range_step          1 nm

   # Default target speed is 250 m/s. Must override so SAR will detect it.
   target_speed              0 kts

   gnuplot_file              sc_fighter.plt
   variable                  sar_clutter_to_noise
   variable                  sar_dwell_time
   variable                  sar_doppler_foldover
   variable                  angle
end_horizontal_map
```

- **演示要点**：演示 horizontal_map 的参数：sensor_platform_yaw, sensor_platform_pitch, sensor_platform_roll, down_range_limits, down_range_step, cross_range_limits, cross_range_step, target_speed, gnuplot_file, variable

### horizontal_map（hm-ucav-spj）｜

- **关键词**：horizontal_map, gnuplot_file, variable, jamming_platform_name, jammer_to_signal_reference, target_region, target_heading, target_altitude, target_speed, target_pitch, target_roll
- **出处**：`sensor_plot/radar/hm-ucav-spj.txt:33-52`
- **片段**：

```text
horizontal_map
   gnuplot_file  hm-ucav-spj.plt

   variable      required_jamming_power
   jamming_platform_name      TARGET
   jammer_to_signal_reference 10 db

   target_region
      down_range_limits  -120 nm 120 nm
      down_range_step     1 nm
      cross_range_limits  -120 nm 120 nm
      cross_range_step    1 nm
   end_target_region

   target_heading  270 deg
   target_altitude 30000 ft
   target_speed    450 kts
   target_pitch 0 deg
   target_roll 0 deg
end_horizontal_map
```

- **演示要点**：演示 horizontal_map 的参数：gnuplot_file, variable, jamming_platform_name, jammer_to_signal_reference, target_region, target_heading, target_altitude, target_speed, target_pitch, target_roll

### horizontal_map（test）｜

- **关键词**：horizontal_map, gnuplot_file, variable, target_region, down_range_limits, down_range_step, cross_range_limits, cross_range_step, target_altitude, target_heading, target_mach
- **出处**：`sosm/sensor_plot/test.txt:50-69`
- **片段**：

```text
horizontal_map
   gnuplot_file              test.plt
   variable                  optical_signature
   variable                  infrared_signature
   variable                  background_radiant_intensity
   variable                  contrast_radiant_intensity
   variable                  signal_to_noise
   variable                  pd

   target_region
   down_range_limits         0 nm 0 nm
   down_range_step           1 nm
   cross_range_limits        0 nm 0 nm
   cross_range_step          1 nm
   end_target_region

   target_altitude           30000 ft
   target_heading            180 deg
   target_mach               1.2
end_horizontal_map
```

- **演示要点**：演示 horizontal_map 的参数：gnuplot_file, variable, target_region, down_range_limits, down_range_step, cross_range_limits, cross_range_step, target_altitude, target_heading, target_mach

### horizontal_map（comm）｜

- **关键词**：horizontal_map, exclude, gnuplot_file, variable, header_line_1, target_region, target_heading, target_altitude, target_speed, target_pitch, target_roll
- **出处**：`sensor_plot/comm/comm.txt:80-105`
- **片段**：

```text
horizontal_map

   exclude sensor_type FAKE_RADIO_XMTR

   gnuplot_file              comm.plt
   variable                  signal_to_noise
   header_line_1             "S/N Ratio in dB"

   # Define the sample grid over which the transmitter will be placed.

   target_region
      down_range_limits      -100 nm 100 nm
      down_range_step        1 nm
      cross_range_limits     -100 nm 100 nm
      cross_range_step       1 nm
   end_target_region

   # Define the heading, altitude, speed, pitch and roll to be assigned to the
   # target as it is placed at each grid point defined by 'target_region'.

   target_heading            270 deg             # Default 0 deg
   target_altitude           20000 ft            # Default 0 ft
   target_speed              0 kts               # Default 0 kts
   target_pitch              0 deg               # Default 0 deg
   target_roll               0 deg               # Default 0 deg
end_horizontal_map
```

- **演示要点**：演示 horizontal_map 的参数：exclude, gnuplot_file, variable, header_line_1, target_region, target_heading, target_altitude, target_speed, target_pitch, target_roll

### horizontal_map（analysis_map-ucav-dry）｜

- **关键词**：horizontal_map, exclude, analysis_map, contour_level, variable, target_region, target_heading, target_altitude, target_speed, target_pitch, target_roll
- **出处**：`sensor_plot/radar/analysis_map-ucav-dry.txt:31-68`　（同签名共 2 处，另见 `sensor_plot/radar/analysis_map-ucav-wet.txt:66`）
- **片段**：

```text
horizontal_map
   exclude sensor_type ACQ_RADAR
   exclude sensor_type TTR_RADAR

   analysis_map
      file analysis_map-ucav-dry.dat
      color_range 0.9 to 1.0 float 0.9 0.1 0.1 1.0
      color_range 0.5 to 0.9 float 1.0 0.5 0.0 1.0
      color_range 0.1 to 0.5 float 0.1 0.1 0.9 1.0
      color_range 0.0 to 0.1 float 0.0 0.0 0.0 0.0
      data_title Pd
      units Pd
   end_analysis_map

   contour_level 0.5
      line_color float 1. 0. 0.
      line_width 2
   end_contour_level

   variable pd

   target_region
      #down_range_limits  -120 nm 120 nm
      #down_range_step     1 nm
      #cross_range_limits  -120 nm 120 nm
      #cross_range_step    1 nm
      latitude_limits 34n 44n
      longitude_limits 122w 112w
      latitude_step 0.05
      longitude_step 0.05
   end_target_region

   target_heading  270 deg
   target_altitude 30000 ft
   target_speed    450 kts
   target_pitch 0 deg
   target_roll 0 deg
end_horizontal_map
```

- **演示要点**：演示 horizontal_map 的参数：exclude, analysis_map, contour_level, variable, target_region, target_heading, target_altitude, target_speed, target_pitch, target_roll

### horizontal_map（hm-repeater-effect）｜

- **关键词**：horizontal_map, gnuplot_file, output_column_limit, variable, header_line_1, target_region, target_heading, target_altitude, target_speed, target_pitch, target_roll
- **出处**：`sensor_plot/radar/hm-repeater-effect.txt:159-235`
- **片段**：

```text
horizontal_map

   #pd_map_file hm-repeater-effect.pd
   gnuplot_file hm-repeater-effect.plt
   output_column_limit 100

   // One of the below sections can be used to choose the
   // variable of interest to plot
   #variable pd
   #header_line_1 "Horizontal pd map"
   #defended_area_report_file ucav_vs_acq-soj.log # valid only if variable is pd

   #variable detection_threshold
   #header_line_1 "Detection Threshold"

   #variable required_rcs
   #detection_reference 12.8 dB
   #header_line_1 "Required RCS map"

   #variable radar_signature
   #header_line_1 "Radar Signature viewed by sensor"

   #variable optical_signature
   #header_line_1 "Optical Signature viewed by sensor"

   #variable infrared_signature
   #header_line_1 "Infrared Signature viewed by sensor"

   #variable signal_power
   #header_line_1 "Received signal power"

   #variable clutter_power
   #header_line_1 "Clutter power"

   #variable signal_to_noise
   #header_line_1 "S/N Ratio in dB"

   variable signal_to_interference
   header_line_1 "S/I Ratio in dB"

   #variable signal_at_target
   #header_line_1 "Signal at target."

   #variable background_radiant_intensity
   #header_line_1 "Background Radiant Intensity"

   #variable contrast_radiant_intensity
   #header_line_1 "Contrast Radiant Intensity."

   #variable attenuation_factor
   #header_line_1 "Attenuation factor."

   #variable propagation_factor
   #header_line_1 "Propagation factor."

   #variable required_jammer_power
   #header_line_1 "Required jammer power"

   variable jammer_power
   header_line_1 "Received jammer power"

   variable jammer_to_signal
   header_line_1 "Jammer-to-Signal"

   target_region
      down_range_limits  -300 km 300 km
      down_range_step     1 km
      cross_range_limits  -300 km 300 km
      cross_range_step    1 km
   end_target_region

   target_heading  270 deg
   target_altitude 25000 ft
   target_speed    450 kts
   target_pitch    0 deg
   target_roll     0 deg
end_horizontal_map
```

- **演示要点**：演示 horizontal_map 的参数：gnuplot_file, output_column_limit, variable, header_line_1, target_region, target_heading, target_altitude, target_speed, target_pitch, target_roll

### horizontal_map（hmap_base）｜

- **关键词**：horizontal_map, gnuplot_file, variable, down_range_limits, down_range_step, cross_range_limits, cross_range_step, target_altitude, target_heading, target_mach
- **出处**：`sosm/sensor_plot/hmap/hmap_base.txt:25-41`
- **片段**：

```text
horizontal_map
   gnuplot_file              $(GNUPLOT_FILE)
   variable                  contrast_radiant_intensity
   variable                  background_radiant_intensity
   variable                  infrared_signature
   variable                  optical_signature
   variable                  pd

   down_range_limits         -200 nm 200 nm
   down_range_step           1 nm
   cross_range_limits        -200 nm 200 nm
   cross_range_step          1 nm

   target_altitude           30000 ft
   target_heading            180 deg
   target_mach               1.2
end_horizontal_map
```

- **演示要点**：演示 horizontal_map 的参数：gnuplot_file, variable, down_range_limits, down_range_step, cross_range_limits, cross_range_step, target_altitude, target_heading, target_mach

### horizontal_map（sedit-ucav-dry）｜

- **关键词**：horizontal_map, sedit_file, contour_level, variable, target_region, target_heading, target_altitude, target_speed, target_pitch, target_roll
- **出处**：`sensor_plot/radar/sedit-ucav-dry.txt:33-55`
- **片段**：

```text
horizontal_map
   sedit_file cntr-ucav-dry.sed

   contour_level 0.5
      line_color float 1. 0. 0.
      line_width 2
   end_contour_level

   variable pd

   target_region
      down_range_limits  -120 nm 120 nm
      down_range_step     1 nm
      cross_range_limits  -120 nm 120 nm
      cross_range_step    1 nm
   end_target_region

   target_heading  270 deg
   target_altitude 30000 ft
   target_speed    450 kts
   target_pitch 0 deg
   target_roll 0 deg
end_horizontal_map
```

- **演示要点**：演示 horizontal_map 的参数：sedit_file, contour_level, variable, target_region, target_heading, target_altitude, target_speed, target_pitch, target_roll

### horizontal_map（noise_cloud）｜

- **关键词**：horizontal_map, target_platform_type, target_altitude, variable, longitude_range, latitude_range, longitude_step, latitude_step, tiff_file
- **出处**：`noise_cloud/noise_cloud.txt:45-54`
- **片段**：

```text
horizontal_map
   target_platform_type target_type
   target_altitude 30000 ft
   variable pd
   longitude_range 90.6w 89.4w
   latitude_range 29.4n 30.6n
   longitude_step 0.002
   latitude_step 0.002
   tiff_file output\noise_cloud.tiff
end_horizontal_map
```

- **演示要点**：演示 horizontal_map 的参数：target_platform_type, target_altitude, variable, longitude_range, latitude_range, longitude_step, latitude_step, tiff_file

### horizontal_map（ag_bomber）｜

- **关键词**：horizontal_map, down_range_limits, down_range_step, cross_range_limits, cross_range_step, target_speed, automatic_target_cueing, gnuplot_file, variable
- **出处**：`sensor_plot/sar/ag_bomber.txt:60-74`　（同签名共 4 处，另见 `sensor_plot/sar/ip_bomber.txt:60`、`sensor_plot/sar/sn_bomber.txt:60`、`sensor_plot/sar/sn_fighter.txt:62`）
- **片段**：

```text
horizontal_map
   down_range_limits         -100 nm 100 nm
   down_range_step           0.2 nm
   cross_range_limits        -100 nm 100 nm
   cross_range_step          0.2 nm

   # Default target speed is 250 m/s. Must override so SAR will detect it.
   target_speed              0 kts

   # Don't try to cue to the target point. Leave the cue where it was initialized.

   automatic_target_cueing   false
   gnuplot_file              ag_bomber.plt
   variable                  transmit_antenna_gain
end_horizontal_map
```

- **演示要点**：演示 horizontal_map 的参数：down_range_limits, down_range_step, cross_range_limits, cross_range_step, target_speed, automatic_target_cueing, gnuplot_file, variable

### horizontal_map（px_fighter）｜

- **关键词**：horizontal_map, down_range_limits, down_range_step, cross_range_limits, cross_range_step, target_speed, gnuplot_file, variable
- **出处**：`sensor_plot/sar/px_fighter.txt:65-76`　（同签名共 3 处，另见 `sensor_plot/sar/dt_example.txt:63`、`sensor_plot/sar/sc_example.txt:53`）
- **片段**：

```text
horizontal_map
   down_range_limits         0 nm 60 nm
   down_range_step           0.06 nm
   cross_range_limits        -60 nm 0 nm
   cross_range_step          0.06 nm

   # Default target speed is 250 m/s. Must override so SAR will detect it.
   target_speed              0 kts

   gnuplot_file              px_fighter.plt
   variable                  pixel_count
end_horizontal_map
```

- **演示要点**：演示 horizontal_map 的参数：down_range_limits, down_range_step, cross_range_limits, cross_range_step, target_speed, gnuplot_file, variable

### horizontal_map（px_fighter）｜

- **关键词**：horizontal_map, target_region, target_speed, automatic_target_cueing, gnuplot_file, variable
- **出处**：`sensor_plot/eoir/px_fighter.txt:60-76`
- **片段**：

```text
horizontal_map
   target_region
      down_range_limits      -6 nm 6 nm
      down_range_step        0.01 nm
      cross_range_limits     -6 nm 6 nm
      cross_range_step       0.01 nm
   end_target_region

   # Default target speed is 250 m/s.
   target_speed              0 kts

   # Don't try to cue to the target point. Leave the cue where it was initialized.

   automatic_target_cueing   false
   gnuplot_file              px_fighter.plt
   variable                  pixel_count
end_horizontal_map
```

- **演示要点**：演示 horizontal_map 的参数：target_region, target_speed, automatic_target_cueing, gnuplot_file, variable

### observer（detection_writes）｜观测器

- **关键词**：observer, enable, 观测器
- **出处**：`aea_iads/detection_writes.txt:62-64`　（同签名共 70 处，另见 `base_types/processors/quantum_agents/common/common_platform_script.txt:129`、`base_types/processors/ripr_agents/common/common_platform_script.txt:129`、`base_types/weapons/agm/atg_mach_4_missile_lc_generator.txt:83`）
- **片段**：

```text
observer
   enable SENSOR_DETECTION_ATTEMPT SensorDetectionAttempt
end_observer
```

- **演示要点**：演示 observer 的参数：enable

### observer（observer_test）｜观测器

- **关键词**：observer, 观测器
- **出处**：`iads/observer_test.txt:21-24`
- **片段**：

```text
observer
enable SENSOR_TRACK_INITIATED sensorinfo
enable SENSOR_TRACK_DROPPED sensorinfo
end_observer
```

- **演示要点**：演示 observer（最小结构，无子参数）

### output（grid_w_observer）｜

- **关键词**：output, file, event_output, events, summary_output
- **出处**：`engage/grid_w_observer.txt:183-190`　（同签名共 2 处，另见 `engage/oo_grid.txt:94`）
- **片段**：

```text
   output
     file fort.gwob.6
     event_output true
     events
        enable all
     end_events
     summary_output true
   end_output
```

- **演示要点**：演示 output 的参数：file, event_output, events, summary_output

### output（flight_path）｜

- **关键词**：output, file, event_output, summary_output
- **出处**：`engage/flight_path.txt:187-191`　（同签名共 6 处，另见 `engage/flight_route.txt:198`、`engage/grid.txt:183`、`engage/grid_react_man.txt:256`）
- **片段**：

```text
   output
     file fort.fp.6
     event_output true
     summary_output true
   end_output
```

- **演示要点**：演示 output 的参数：file, event_output, summary_output

### output（flight_path）｜

- **关键词**：output, file, phase, items
- **出处**：`engage/flight_path.txt:160-170`　（同签名共 16 处，另见 `engage/flight_route.txt:171`、`engage/grid.txt:156`、`engage/grid_react_man.txt:229`）
- **片段**：

```text
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
```

- **演示要点**：演示 output 的参数：file, phase, items

### output_rate（flight_path）｜

- **关键词**：output_rate, time
- **出处**：`engage/flight_path.txt:141-146`　（同签名共 8 处，另见 `engage/flight_route.txt:140`、`engage/grid.txt:135`、`engage/grid_react_man.txt:209`）
- **片段**：

```text
output_rate default
   time     0.0 secs period  1.0 sec
   time   500.0 secs period 10.0 sec
   time   800.0 secs period 50.0 sec
   time   950.0 secs
end_output_rate
```

- **演示要点**：演示 output_rate 的参数：time

### print_settings（battle_manager）｜

- **关键词**：print_settings, valid_units, valid_unit_details, invalid_unit_details
- **出处**：`iads_c2_demos/processors/battle_manager.txt:24-28`
- **片段**：

```text
      print_settings
         valid_units            on
         valid_unit_details     on
         invalid_unit_details   on
      end_print_settings
```

- **演示要点**：演示 print_settings 的参数：valid_units, valid_unit_details, invalid_unit_details

### region（intersect_mesh_test）｜

- **关键词**：region, minimum_energy, damage_radius
- **出处**：`hel/intersect_mesh_test.txt:50-53`　（同签名共 2 处，另见 `hel/intersect_mesh_test_beam_director.txt:58`）
- **片段**：

```text
   region RED_ADV_FIGHTER_2 IRST
      minimum_energy 2 kj
      damage_radius 5 cm
   end_region
```

- **演示要点**：演示 region 的参数：minimum_energy, damage_radius

### region（intersect_mesh_test）｜

- **关键词**：region, minimum_energy
- **出处**：`hel/intersect_mesh_test.txt:46-48`　（同签名共 2 处，另见 `hel/intersect_mesh_test_beam_director.txt:54`）
- **片段**：

```text
   region RED_ADV_FIGHTER_2 CANOPY
      minimum_energy 5 kj
   end_region
```

- **演示要点**：演示 region 的参数：minimum_energy

### region（terrain_config）｜

- **关键词**：region, location
- **出处**：`air_to_air/six_dof_types/environment/terrain_config.txt:12-50`　（同签名共 4 处，另见 `p6dof/p6dof_types/environment/terrain_config.txt:20`、`six_dof/six_dof_types/environment/terrain_config.txt:12`、`six_dof_with_brawler/six_dof_types/environment/terrain_config.txt:12`）
- **片段**：

```text
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
```

- **演示要点**：演示 region 的参数：location

### sosm_interface（test）｜

- **关键词**：sosm_interface, load_sensor, load_target, map_sensor_type, map_target_type, load_atmosphere, debug_level, show_iripp_data
- **出处**：`sosm/sensor_plot/test.txt:11-23`
- **片段**：

```text
sosm_interface
#  load_atmosphere      DEFAULT                          from ../../sosm/modtran/us_std_day.txt
   load_sensor          LWIR                             from ../../sosm/sensors/uniform_lwir.txt
   load_target          RED_MULTIROLE_FIGHTER_3          from ../../sosm/targets/red_multirole_fighter_3/red_multirole_fighter_3.txt

   map_sensor_type      IRST           LWIR
   map_target_type      TARGET         RED_MULTIROLE_FIGHTER_3
   load_atmosphere      DEFAULT        from ../../sosm/modtran/mid_lat_summer_day.txt

   debug_level 1
   show_iripp_data
#   spectral_print_format wavelength
end_sosm_interface
```

- **演示要点**：演示 sosm_interface 的参数：load_sensor, load_target, map_sensor_type, map_target_type, load_atmosphere, debug_level, show_iripp_data

### sosm_interface（test_qd）｜

- **关键词**：sosm_interface, load_atmosphere, load_sensor, load_target, debug_level, show_iripp_data, test
- **出处**：`sosm/test_mission/query_detect/test_qd.txt:15-29`
- **片段**：

```text
sosm_interface
   load_atmosphere      DEFAULT from ../../modtran/mid_lat_summer_day.txt
   load_sensor          SENSOR  from ../../sensors/uniform_lwir.txt
   load_target          TARGET  from ../../targets/red_multirole_fighter_3/red_multirole_fighter_3.txt

   debug_level 1
   show_iripp_data

   test query_detect
      target_altitude                  30000 ft
      target_to_sensor_range           26.0960 km
      target_to_sensor_azimuth         0.0 deg
      target_to_sensor_elevation       0.0 deg
   end_test
end_sosm_interface
```

- **演示要点**：演示 sosm_interface 的参数：load_atmosphere, load_sensor, load_target, debug_level, show_iripp_data, test

### sosm_interface（test_simple_plot）｜

- **关键词**：sosm_interface, show_status, load_atmosphere, load_sensor, load_target, test
- **出处**：`sosm/test_mission/simple_plot/test_simple_plot.txt:20-28`
- **片段**：

```text
sosm_interface
   show_status          true
   load_atmosphere      DEFAULT     from ../../modtran/us_std_day.txt
   load_sensor          MWIR_SENSOR from simple_mwir_sensor.txt
   load_sensor          LWIR_SENSOR from simple_lwir_sensor.txt
   load_target          TARGET      from simple_target.txt

   test simple_target_plot
end_sosm_interface
```

- **演示要点**：演示 sosm_interface 的参数：show_status, load_atmosphere, load_sensor, load_target, test

### sosm_interface（test_qt）｜

- **关键词**：sosm_interface, load_atmosphere, load_sensor, load_target, spectral_print_format, test
- **出处**：`sosm/test_mission/query_target/test_qt.txt:15-29`
- **片段**：

```text
sosm_interface

   load_atmosphere      DEFAULT from ../../modtran/mid_lat_summer_day.txt
   load_sensor          SENSOR  from ../../sensors/uniform_lwir.txt
   load_target          TARGET  from ../../targets/red_multirole_fighter_3/red_multirole_fighter_3.txt

   spectral_print_format wavelength

   test query_target
      target_altitude                  30000 ft
      target_to_sensor_azimuth         0 deg
      target_to_sensor_elevation       0 deg
   end_test

end_sosm_interface
```

- **演示要点**：演示 sosm_interface 的参数：load_atmosphere, load_sensor, load_target, spectral_print_format, test

### sosm_interface（test_a2a）｜

- **关键词**：sosm_interface, show_status, load_atmosphere, load_sensor, load_target
- **出处**：`sosm/test_mission/a2a/test_a2a.txt:12-17`
- **片段**：

```text
sosm_interface
   show_status          true
   load_atmosphere      DEFAULT        from ../../modtran/us_std_day.txt
   load_sensor          LWIR_SENSOR    from ../../sensors/uniform_lwir.txt
   load_target          RED_MULTIROLE_FIGHTER_3          from ../../targets/red_multirole_fighter_3/red_multirole_fighter_3.txt
end_sosm_interface
```

- **演示要点**：演示 sosm_interface 的参数：show_status, load_atmosphere, load_sensor, load_target

### sosm_interface（common_types）｜

- **关键词**：sosm_interface, load_atmosphere, load_sensor, load_target
- **出处**：`sosm/sensor_plot/common_types.txt:13-23`
- **片段**：

```text
sosm_interface
#  load_atmosphere DEFAULT             from ../../sosm/modtran/us_std_day.txt
#  load_atmosphere DEFAULT             from ../../sosm/modtran/us_std_night.txt
   load_atmosphere DEFAULT             from ../../sosm/modtran/mid_lat_summer_day.txt
#  load_atmosphere DEFAULT             from ../../sosm/modtran/mid_lat_summer_night.txt
#  load_atmosphere DEFAULT             from ../../sosm/modtran/mid_lat_winter_day.txt
#  load_atmosphere DEFAULT             from ../../sosm/modtran/mid_lat_winter_night.txt

   load_sensor     IRST                from ../../sosm/sensors/uniform_lwir.txt
   load_target     TARGET              from ../../sosm/targets/red_multirole_fighter_3/red_multirole_fighter_3.txt
end_sosm_interface
```

- **演示要点**：演示 sosm_interface 的参数：load_atmosphere, load_sensor, load_target

### sosm_interface（test_qa）｜

- **关键词**：sosm_interface, load_atmosphere, spectral_print_format, test
- **出处**：`sosm/test_mission/query_atmosphere/test_qa.txt:15-25`
- **片段**：

```text
sosm_interface
   load_atmosphere     DEFAULT from ../../modtran/us_std_day.txt

   spectral_print_format wavelength

   test query_atmosphere
      sensor_altitude                  30000 ft
      sensor_to_target_elevation       5 deg
      sensor_to_target_range           10 nm
   end_test
end_sosm_interface
```

- **演示要点**：演示 sosm_interface 的参数：load_atmosphere, spectral_print_format, test

### sosm_interface（hmapf）｜

- **关键词**：sosm_interface, fast_detection_mode
- **出处**：`sosm/sensor_plot/hmap/hmapf/hmapf.txt:13-15`　（同签名共 4 处，另见 `sosm/sensor_plot/hmap/hmaps/hmaps.txt:13`、`sosm/sensor_plot/vmap/vmapf/vmapf.txt:13`、`sosm/sensor_plot/vmap/vmaps/vmaps.txt:13`）
- **片段**：

```text
sosm_interface
   fast_detection_mode true
end_sosm_interface
```

- **演示要点**：演示 sosm_interface 的参数：fast_detection_mode

### sosm_interface（test_bbp）｜

- **关键词**：sosm_interface, test
- **出处**：`sosm/test_mission/test_bbp.txt:17-19`
- **片段**：

```text
sosm_interface
   test blackbody_plot
end_sosm_interface
```

- **演示要点**：演示 sosm_interface 的参数：test

### spherical_map（smap）｜

- **关键词**：spherical_map, gnuplot_file, variable, azimuth_limits, azimuth_step, elevation_limits, elevation_step, range, target_heading, target_mach
- **出处**：`sosm/sensor_plot/smap/smap.txt:22-39`
- **片段**：

```text
spherical_map
   gnuplot_file              smap.plt
   variable                  contrast_radiant_intensity
   variable                  signal_power
   variable                  background_radiant_intensity
#   variable                  infrared_signature
#   variable                  optical_signature
   variable                  pd

   azimuth_limits            -1 deg 1 deg
   azimuth_step              1 deg
   elevation_limits          -10 deg 10 deg
   elevation_step            0.5 deg
   range                     2 nm

   target_heading            180 deg
   target_mach               1.2
end_spherical_map
```

- **演示要点**：演示 spherical_map 的参数：gnuplot_file, variable, azimuth_limits, azimuth_step, elevation_limits, elevation_step, range, target_heading, target_mach

### spherical_map（sm-stab）｜

- **关键词**：spherical_map, sensor_platform_roll, azimuth_limits, elevation_limits, range, variable, pd_map_file
- **出处**：`sensor_plot/radar/sm-stab.txt:61-72`
- **片段**：

```text
spherical_map
   #sensor_platform_pitch     10 deg
   sensor_platform_roll      30 deg

   azimuth_limits            -180 deg 180 deg
   elevation_limits          -80 deg 80 deg
   range                      20 nm

   variable                  signal_to_noise

   pd_map_file               sm-stab.pd
end_spherical_map
```

- **演示要点**：演示 spherical_map 的参数：sensor_platform_roll, azimuth_limits, elevation_limits, range, variable, pd_map_file

### spherical_map（sm-nostab）｜

- **关键词**：spherical_map, azimuth_limits, elevation_limits, range, variable, pd_map_file
- **出处**：`sensor_plot/radar/sm-nostab.txt:50-59`
- **片段**：

```text
spherical_map
   azimuth_limits            -90 deg 90 deg
   elevation_limits          -80 deg 80 deg
   range                      20 nm

   variable                  signal_to_noise

   #gnuplot_file              sm-nostab.plt
   pd_map_file               sm-nostab.pd
end_spherical_map
```

- **演示要点**：演示 spherical_map 的参数：azimuth_limits, elevation_limits, range, variable, pd_map_file

### subgrid · WSF_ZONE_BASED_GRID｜

- **关键词**：subgrid, WSF_ZONE_BASED_GRID, zone, asset, spacing, altitude
- **出处**：`coverage_demos/coverage_grids/state_zone_lat_lon_grid_coverage.txt:15-20`　（同签名共 2 处，另见 `coverage_demos/coverage_grids/state_zone_lat_lon_grid_coverage.txt:22`）
- **片段**：

```text
   subgrid fl_grid WSF_ZONE_BASED_GRID 
      zone Florida
      asset WSF_PLATFORM none
      spacing 0.5 deg
      altitude 1 m agl
   end_subgrid
```

- **演示要点**：演示 WSF_ZONE_BASED_GRID 的参数：zone, asset, spacing, altitude

### surface（fighter_multi_shape_optical_signature）｜

- **关键词**：surface, length, radius, temperature
- **出处**：`multiresolution_demos/signatures/fighter_multi_shape_optical_signature.txt:21-25`　（同签名共 13 处，另见 `multiresolution_demos/signatures/fighter_multi_shape_optical_signature.txt:28`、`multiresolution_demos/signatures/fighter_multi_shape_optical_signature.txt:35`、`signature_demos/signatures/fighter_multi_shape_optical_signature.txt:21`）
- **片段**：

```text
   surface cone
      length 1 m
      radius 0.7 m
      temperature adiabatic_wall
   end_surface
```

- **演示要点**：演示 surface 的参数：length, radius, temperature

### surface（sensor_demo）｜

- **关键词**：surface, radius, temperature
- **出处**：`multiresolution_demos/sensor_demo.txt:100-103`　（同签名共 3 处，另见 `multiresolution_demos/signatures/fighter_spherical_optical_signature.txt:14`、`signature_demos/signatures/fighter_spherical_optical_signature.txt:14`）
- **片段**：

```text
   surface sphere 
      radius 2 m
      temperature adiabatic_wall
   end_surface
```

- **演示要点**：演示 surface 的参数：radius, temperature

### surface（fighter_box_optical_signature）｜

- **关键词**：surface, size, temperature
- **出处**：`multiresolution_demos/signatures/fighter_box_optical_signature.txt:14-17`　（同签名共 4 处，另见 `multiresolution_demos/signatures/fighter_multi_shape_optical_signature.txt:15`、`signature_demos/signatures/fighter_box_optical_signature.txt:14`、`signature_demos/signatures/fighter_multi_shape_optical_signature.txt:15`）
- **片段**：

```text
   surface box
      size 10 m 2 m 2 m
      temperature adiabatic_wall
   end_surface
```

- **演示要点**：演示 surface 的参数：size, temperature

### surface（moon_as_satellite）｜

- **关键词**：surface, radius, reflectance
- **出处**：`space_operations/moon_as_satellite.txt:34-37`
- **片段**：

```text
   surface sphere
      radius      1737.1 km
      reflectance 0.1362
   end_surface
```

- **演示要点**：演示 surface 的参数：radius, reflectance

### target_grid（grid）｜

- **关键词**：target_grid, down_range, cross_range, altitude, speed
- **出处**：`engage/grid.txt:146-154`　（同签名共 5 处，另见 `engage/grid_react_man.txt:219`、`engage/grid_w_observer.txt:146`、`engage/grid_w_offsetroute.txt:154`）
- **片段**：

```text
   target_grid
      down_range  from -100 km to 100 km by 100 km
      cross_range from  -20 km to  20 km by  40 km
      altitude    from  30 kft to 30 kft by 10 kft
      speed 262 kts

      #down_range  from 100 km to 100 km by 100 km
      #cross_range from  20 km to  20 km by 40 km
   end_target_grid
```

- **演示要点**：演示 target_grid 的参数：down_range, cross_range, altitude, speed

### target_region（comm）｜

- **关键词**：target_region, down_range_limits, down_range_step, cross_range_limits, cross_range_step
- **出处**：`sensor_plot/comm/comm.txt:90-95`　（同签名共 22 处，另见 `sensor_plot/eoir/px_fighter.txt:61`、`sensor_plot/esm/hm-jammer-detect-1.txt:150`、`sensor_plot/esm/hm-jammer-detect-2.txt:161`）
- **片段**：

```text
   target_region
      down_range_limits      -100 nm 100 nm
      down_range_step        1 nm
      cross_range_limits     -100 nm 100 nm
      cross_range_step       1 nm
   end_target_region
```

- **演示要点**：演示 target_region 的参数：down_range_limits, down_range_step, cross_range_limits, cross_range_step

### target_region（analysis_map-ucav-dry）｜

- **关键词**：target_region, latitude_limits, longitude_limits, latitude_step, longitude_step
- **出处**：`sensor_plot/radar/analysis_map-ucav-dry.txt:52-61`　（同签名共 2 处，另见 `sensor_plot/radar/analysis_map-ucav-wet.txt:88`）
- **片段**：

```text
   target_region
      #down_range_limits  -120 nm 120 nm
      #down_range_step     1 nm
      #cross_range_limits  -120 nm 120 nm
      #cross_range_step    1 nm
      latitude_limits 34n 44n
      longitude_limits 122w 112w
      latitude_step 0.05
      longitude_step 0.05
   end_target_region
```

- **演示要点**：演示 target_region 的参数：latitude_limits, longitude_limits, latitude_step, longitude_step

### target_region（test）｜

- **关键词**：target_region
- **出处**：`sosm/sensor_plot/test.txt:59-64`
- **片段**：

```text
   target_region
   down_range_limits         0 nm 0 nm
   down_range_step           1 nm
   cross_range_limits        0 nm 0 nm
   cross_range_step          1 nm
   end_target_region
```

- **演示要点**：演示 target_region（最小结构，无子参数）

### vertical_coverage（vcd-acq_radar）｜

- **关键词**：vertical_coverage, required_pd, target_speed, target_pitch, target_roll, elevation_limits, elevation_step, large_range_step, small_range_step, output_file, range_units, altitude_units, x_units
- **出处**：`sensor_plot/radar/vcd-acq_radar.txt:26-50`
- **片段**：

```text
vertical_coverage

   required_pd 0.5

   target_speed 450 kts
   target_pitch 0 deg
   target_roll  0 deg

   elevation_limits -5.0 deg 89.9 deg
   elevation_step 0.1 deg

   #maximum_range 100 km # comment out for auto range finding
   large_range_step 5000 m
   small_range_step  100 m

   output_file acq_radar.vcd
   range_units nm
   altitude_units kft
   x_units nm
   y_units kft

   output_max_height
   output_max_range

end_vertical_coverage
```

- **演示要点**：演示 vertical_coverage 的参数：required_pd, target_speed, target_pitch, target_roll, elevation_limits, elevation_step, large_range_step, small_range_step, output_file, range_units

### vertical_coverage（acq_radar_vcd）｜

- **关键词**：vertical_coverage, output_file, x_units, y_units
- **出处**：`iads/sensors/radar/acq_radar_vcd.txt:23-27`　（同签名共 5 处，另见 `iads/sensors/radar/ew_radar_vcd.txt:23`、`iads/sensors/radar/ttr_radar_vcd.txt:23`、`orwaca_iads/sensors/radar/elr_sam_acq_radar_sensor_vcd.txt:23`）
- **片段**：

```text
vertical_coverage
   output_file acq_radar.vcd
   x_units nm
   y_units kft
end_vertical_coverage
```

- **演示要点**：演示 vertical_coverage 的参数：output_file, x_units, y_units

### vertical_map（vm-ucav-dry）｜

- **关键词**：vertical_map, pd_map_file, gnuplot_file, output_column_limit, variable, header_line_1, ground_range_limits, ground_range_step, altitude_limits, altitude_step, target_speed
- **出处**：`sensor_plot/radar/vm-ucav-dry.txt:34-91`　（同签名共 3 处，另见 `sensor_plot/radar/vm-ucav-soj.txt:50`、`sensor_plot/radar/vm-ucav-soj2.txt:46`）
- **片段**：

```text
vertical_map
   pd_map_file vm-ucav_vs_acq-dry.pd
   gnuplot_file vm-ucav_vs_acq-dry.plt
   output_column_limit 100

   // One of the below sections can be used to choose the
   // variable of interest to plot
   variable pd
   header_line_1 "Horizontal pd map"

   #variable required_rcs
   #detection_reference 12.8 dB
   #header_line_1 "Required RCS map"

   #variable radar_signature
   #header_line_1 "Radar Signature viewed by sensor"

   #variable optical_signature
   #header_line_1 "Optical Signature viewed by sensor"

   #variable infrared_signature
   #header_line_1 "Infrared Signature viewed by sensor"

   #variable signal_power
   #header_line_1 "Received signal power"

   #variable clutter_power
   #header_line_1 "Clutter power"

   #variable signal_to_noise
   #header_line_1 "S/N Ratio in dB

   #variable signal_to_interference
   #header_line_1 "S/I Ratio in dB

   #variable signal_at_target
   #header_line_1 "Signal at target."

   #variable background_radiant_intensity
   #header_line_1 "Background Radiant Intensity"

   #variable contrast_radiant_intensity
   #header_line_1 "Contrast Radiant Intensity."

   #variable attenuation_factor
   #header_line_1 "Attenuation factor."

   #variable propagation_factor
   #header_line_1 "Propagation factor."

   ground_range_limits     0 nm 120 nm
   ground_range_step       0.5 nm
   altitude_limits         0 kft 250 kft
   altitude_step           500 ft

   target_speed    450 kts

end_vertical_map
```

- **演示要点**：演示 vertical_map 的参数：pd_map_file, gnuplot_file, output_column_limit, variable, header_line_1, ground_range_limits, ground_range_step, altitude_limits, altitude_step, target_speed

### vertical_map（vmap_base）｜

- **关键词**：vertical_map, gnuplot_file, variable, ground_range_limits, ground_range_step, altitude_limits, altitude_step, target_heading, target_mach
- **出处**：`sosm/sensor_plot/vmap/vmap_base.txt:26-41`
- **片段**：

```text
vertical_map
   gnuplot_file              $(GNUPLOT_FILE)
   variable                  contrast_radiant_intensity
   variable                  background_radiant_intensity
   variable                  infrared_signature
   variable                  optical_signature
   variable                  pd

   ground_range_limits       -200 nm 200 nm
   ground_range_step         1 nm
   altitude_limits           0 ft 60000 ft
   altitude_step             200 ft

   target_heading            180 deg
   target_mach               1.2
end_vertical_map
```

- **演示要点**：演示 vertical_map 的参数：gnuplot_file, variable, ground_range_limits, ground_range_step, altitude_limits, altitude_step, target_heading, target_mach

### weighted_region（china_traffic）｜

- **关键词**：weighted_region, latitude, longitude, inner_radius, outer_radius, inner_weight, outer_weight
- **出处**：`traffic_demos/scenarios/china_traffic.txt:26-33`　（同签名共 6 处，另见 `traffic_demos/scenarios/korea_traffic.txt:34`、`traffic_demos/scenarios/korea_traffic.txt:44`、`traffic_demos/scenarios/korea_traffic.txt:54`）
- **片段**：

```text
      weighted_region
         latitude     37:32:00n
         longitude   126:56:00e
         inner_radius  0 nm
         outer_radius  12 nm
         inner_weight  12.0
         outer_weight  6.0
      end_weighted_region
```

- **演示要点**：演示 weighted_region 的参数：latitude, longitude, inner_radius, outer_radius, inner_weight, outer_weight

### xio_interface（xio_setup）｜

- **关键词**：xio_interface, broadcast, port, debug, connect_to_simulations, auto_dis_mapping
- **出处**：`distributed_operations/xio_setup.txt:9-15`
- **片段**：

```text
xio_interface
   broadcast 10.9.16.255
   port 39583
   debug yes
   connect_to_simulations
   auto_dis_mapping yes
end_xio_interface
```

- **演示要点**：演示 xio_interface 的参数：broadcast, port, debug, connect_to_simulations, auto_dis_mapping

### xio_interface（xio_interface）｜

- **关键词**：xio_interface, multicast, port, connect_to_simulations, auto_dis_mapping, time_to_live
- **出处**：`aea_iads/xio_interface.txt:10-20`　（同签名共 2 处，另见 `iads/xio_interface.txt:10`）
- **片段**：

```text
xio_interface
   multicast 235.7.11.27 10.
   #broadcast 10.
   port 3002
   connect_to_simulations
   auto_dis_mapping yes
   time_to_live 8

   #verbose true
   #debug true
end_xio_interface
```

- **演示要点**：演示 xio_interface 的参数：multicast, port, connect_to_simulations, auto_dis_mapping, time_to_live
