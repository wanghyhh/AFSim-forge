# 通信与组网

> **来源**：AFSIM 2.9.0 官方 demo 集（`demos/`，4,751 个 `.txt`，132 万行）
> **性质**：原文摘抄，未改写。同一「参数签名」只保留 1 条代表，并注明出现次数与另见位置
> **警示**：片段中数值为 demo 原值，**仅供语法参考，不得直接复用**；依赖 `common/` 数据表的片段须另行提供
> **检索**：按命令 / 类型名 / 参数名搜本卷；总表见 `90-tokens.md`

### comm · WSF_RADIO_XMTR｜通信设备

- **关键词**：comm, WSF_RADIO_XMTR, azimuth_field_of_view, elevation_field_of_view, transmitter, antenna_pattern, frequency, wavelength, bandwidth, power, polarization, pulse_width, pulse_repetition_interval, 通信设备
- **出处**：`satellite_demos/platforms/gps_control.txt:23-40`
- **片段**：

```text
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
```

- **演示要点**：演示 WSF_RADIO_XMTR 的参数：azimuth_field_of_view, elevation_field_of_view, transmitter, antenna_pattern, frequency, wavelength, bandwidth, power, polarization, pulse_width

### comm · WSF_RADIO_XMTR｜通信设备

- **关键词**：comm, WSF_RADIO_XMTR, on, azimuth_field_of_view, elevation_field_of_view, transmitter, antenna_pattern, frequency, bandwidth, polarization, power, 通信设备
- **出处**：`satellite_demos/platforms/iridium_gs.txt:19-33`
- **片段**：

```text
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
```

- **演示要点**：演示 WSF_RADIO_XMTR 的参数：on, azimuth_field_of_view, elevation_field_of_view, transmitter, antenna_pattern, frequency, bandwidth, polarization, power

### comm · WSF_LASER_TRANSCEIVER｜通信设备

- **关键词**：comm, WSF_LASER_TRANSCEIVER, on, category, slew_mode, azimuth_slew_rate, elevation_slew_rate, azimuth_slew_limits, elevation_slew_limits, transmitter, receiver, 通信设备
- **出处**：`space_operations/comms/lasercomm_link.txt:16-69`
- **片段**：

```text
comm LASERCOMM_LINK WSF_LASER_TRANSCEIVER  
   on
   
   category linkable
   
   slew_mode azimuth_and_elevation   
   azimuth_slew_rate 30 deg/s
   elevation_slew_rate 30 deg/s  
   azimuth_slew_limits -80 deg 80 deg
   elevation_slew_limits -80 deg 80 deg

   azimuth_slew_limits -80 deg 80 deg
   elevation_slew_limits -80 deg 80 deg
   slew_mode azimuth_and_elevation   
   azimuth_slew_rate 30 deg/s
   elevation_slew_rate 30 deg/s
   
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
   
end_comm
```

- **演示要点**：演示 WSF_LASER_TRANSCEIVER 的参数：on, category, slew_mode, azimuth_slew_rate, elevation_slew_rate, azimuth_slew_limits, elevation_slew_limits, transmitter, receiver

### comm · WSF_RADIO_RCVR｜通信设备

- **关键词**：comm, WSF_RADIO_RCVR, on, azimuth_field_of_view, elevation_field_of_view, receiver, antenna_pattern, frequency, bandwidth, 通信设备
- **出处**：`satellite_demos/platforms/iridium_gs.txt:35-47`
- **片段**：

```text
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
```

- **演示要点**：演示 WSF_RADIO_RCVR 的参数：on, azimuth_field_of_view, elevation_field_of_view, receiver, antenna_pattern, frequency, bandwidth

### comm · WSF_RADIO_XMTR｜通信设备

- **关键词**：comm, WSF_RADIO_XMTR, earth_radius_multiplier, antenna_pattern, frequency, power, internal_loss, transfer_rate, network_name, 通信设备
- **出处**：`satellite_demos/platforms/comsat_satellite.txt:30-43`
- **片段**：

```text
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
```

- **演示要点**：演示 WSF_RADIO_XMTR 的参数：earth_radius_multiplier, antenna_pattern, frequency, power, internal_loss, transfer_rate, network_name

### comm · WSF_RADIO_XMTR｜通信设备

- **关键词**：comm, WSF_RADIO_XMTR, antenna_pattern, frequency, power, internal_loss, transfer_rate, network_name, 通信设备
- **出处**：`satellite_demos/platforms/comsat_satellite.txt:61-71`
- **片段**：

```text
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
```

- **演示要点**：演示 WSF_RADIO_XMTR 的参数：antenna_pattern, frequency, power, internal_loss, transfer_rate, network_name

### comm · WSF_RADIO_RCVR｜通信设备

- **关键词**：comm, WSF_RADIO_RCVR, antenna_pattern, frequency, internal_loss, noise_power, detection_threshold, network_name, 通信设备
- **出处**：`satellite_demos/platforms/comsat_satellite.txt:45-59`　（同签名共 2 处，另见 `satellite_demos/platforms/comsat_satellite.txt:73`）
- **片段**：

```text
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
```

- **演示要点**：演示 WSF_RADIO_RCVR 的参数：antenna_pattern, frequency, internal_loss, noise_power, detection_threshold, network_name

### comm · WSF_RADIO_RCVR｜通信设备

- **关键词**：comm, WSF_RADIO_RCVR, network_name, azimuth_field_of_view, elevation_field_of_view, receiver, jamming_perception_threshold, jamming_perception_timeout, 通信设备
- **出处**：`satellite_demos/scenarios/gps_denied.txt:92-108`
- **片段**：

```text
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
```

- **演示要点**：演示 WSF_RADIO_RCVR 的参数：network_name, azimuth_field_of_view, elevation_field_of_view, receiver, jamming_perception_threshold, jamming_perception_timeout

### comm · WSF_RADIO_TRANSCEIVER｜通信设备

- **关键词**：comm, WSF_RADIO_TRANSCEIVER, maximum_range, transmit_mode, transmitter, receiver, jamming_perception_threshold, jamming_perception_timeout, 通信设备
- **出处**：`electronic_warfare/comm_jamming.txt:80-99`
- **片段**：

```text
comm RADIO WSF_RADIO_TRANSCEIVER
   //debug
   maximum_range 100 nm
   transmit_mode continuous               // default: intermittent
   transmitter
      power 100 w
      antenna_pattern RADIO_ANTENNA_PATTERN
      frequency 2.4 GHz
      bandwidth 5.0 MHz
   end_transmitter
   receiver
      antenna_pattern RADIO_ANTENNA_PATTERN
      frequency 2.4 GHz
      bandwidth 1 MHz
      electronic_protect RADIO_EP end_electronic_protect
   end_receiver

   jamming_perception_threshold 3.0 db
   jamming_perception_timeout   60 sec
end_comm
```

- **演示要点**：演示 WSF_RADIO_TRANSCEIVER 的参数：maximum_range, transmit_mode, transmitter, receiver, jamming_perception_threshold, jamming_perception_timeout

### comm · WSF_RADIO_TRANSCEIVER｜通信设备

- **关键词**：comm, WSF_RADIO_TRANSCEIVER, transfer_rate, transmitter, receiver, processor, network_name, 通信设备
- **出处**：`satellite_demos/platforms/ground_station.txt:31-63`
- **片段**：

```text
   comm radio WSF_RADIO_TRANSCEIVER
      transfer_rate   1.544 mbit/s

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

      processor       dump-rcvr
      network_name ComsatNet
      //debug
   end_comm
```

- **演示要点**：演示 WSF_RADIO_TRANSCEIVER 的参数：transfer_rate, transmitter, receiver, processor, network_name

### comm · WSF_COMM_TRANSCEIVER｜通信设备

- **关键词**：comm, WSF_COMM_TRANSCEIVER, transfer_rate, network_name, internal_link, location, 通信设备
- **出处**：`laser_designator/platforms/soldier_jtac.txt:18-24`
- **片段**：

```text
   comm  cmd_net WSF_COMM_TRANSCEIVER
      transfer_rate 100 mbits/sec
      network_name <local:master>
      internal_link data_mgr
      internal_link CMDR_TASK_MGR
      location 0 0 -4 ft
   end_comm
```

- **演示要点**：演示 WSF_COMM_TRANSCEIVER 的参数：transfer_rate, network_name, internal_link, location

### comm · WSF_RADIO_RCVR｜通信设备

- **关键词**：comm, WSF_RADIO_RCVR, azimuth_field_of_view, elevation_field_of_view, network_name, receiver, 通信设备
- **出处**：`satellite_demos/avionics/comm/IntelsatCommDef.txt:45-59`　（同签名共 3 处，另见 `satellite_demos/avionics/comm/IntelsatCommDef.txt:80`、`satellite_demos/avionics/comm/IntelsatCommDef.txt:115`）
- **片段**：

```text
comm INTELSAT_UPLINK_RX WSF_RADIO_RCVR

   azimuth_field_of_view                  -180.0 deg 180.0 deg
   elevation_field_of_view                 -90.0 deg   0.0 deg
   network_name intelsat_dl_ul

   receiver
      antenna_pattern                     UNIFORM_0DBI_PATTERN
      frequency                           19.25 ghz      #
      bandwidth                           31.5 kHz      #
      noise_power                         -69.0 dbm
      detection_threshold                 3.0 dB
   end_receiver

end_comm
```

- **演示要点**：演示 WSF_RADIO_RCVR 的参数：azimuth_field_of_view, elevation_field_of_view, network_name, receiver

### comm · WSF_RADIO_XMTR｜通信设备

- **关键词**：comm, WSF_RADIO_XMTR, azimuth_field_of_view, elevation_field_of_view, transmit_mode, transmitter, 通信设备
- **出处**：`satellite_demos/avionics/comm/GPSCommDef.txt:28-44`
- **片段**：

```text
comm GPS_DOWNLINKL1_TX WSF_RADIO_XMTR

   azimuth_field_of_view                  -180 deg    180 deg
   elevation_field_of_view                 -90 deg    -68.7 deg   # ref 2
   transmit_mode continuous

   transmitter
      antenna_pattern                     SATELLITE_NADIR_CONE
      frequency                           1575.42 mhz  # ref 2
      wavelength                          19.05 cm     # ref 2
      bandwidth                           24 mhz       # ref 3
      power                               12.75 dBW   # ref 4  this is the average between C/A and PY codes
      polarization                        right_circular  # ref 3
      pulse_repetition_interval           1.0 msecs    # ref 4  chipping rate of 1.023 Mbps with code of 1 ms
   end_transmitter

end_comm
```

- **演示要点**：演示 WSF_RADIO_XMTR 的参数：azimuth_field_of_view, elevation_field_of_view, transmit_mode, transmitter

### comm · WSF_RADIO_XMTR｜通信设备

- **关键词**：comm, WSF_RADIO_XMTR, azimuth_field_of_view, elevation_field_of_view, network_name, transmitter, 通信设备
- **出处**：`satellite_demos/avionics/comm/IntelsatCommDef.txt:26-43`　（同签名共 3 处，另见 `satellite_demos/avionics/comm/IntelsatCommDef.txt:61`、`satellite_demos/avionics/comm/IntelsatCommDef.txt:96`）
- **片段**：

```text
comm INTELSAT_DOWNLINK_TX WSF_RADIO_XMTR

   azimuth_field_of_view                  -180.0 deg 180.0 deg
   elevation_field_of_view                 -90.0 deg   -77 deg
   network_name intelsat_dl_ul

   transmitter
      antenna_pattern                     SATELLITE_NADIR_CONE
      attenuation                         none
      frequency                           19.25 ghz    #
      bandwidth                           31.5 kHz     #
      propagation_model                   none
      power                               50 dBW       #
      pulse_width                         15.0 usec
      pulse_repetition_interval           150.0 usec
   end_transmitter

end_comm
```

- **演示要点**：演示 WSF_RADIO_XMTR 的参数：azimuth_field_of_view, elevation_field_of_view, network_name, transmitter

### comm · WSF_COMM_TRANSCEIVER｜通信设备

- **关键词**：comm, WSF_COMM_TRANSCEIVER, transfer_rate, network_name, internal_link, 通信设备
- **出处**：`laser_designator/platforms/soldier.txt:28-32`　（同签名共 4 处，另见 `laser_designator/platforms/uav.txt:18`、`route_finder_demos/platforms/striker.txt:31`、`route_finder_demos/platforms/flight_lead.txt:16`）
- **片段**：

```text
   comm  cmd_net WSF_COMM_TRANSCEIVER
      transfer_rate 100 mbits/sec
      network_name <local:slave>
      internal_link data_mgr      
   end_comm
```

- **演示要点**：演示 WSF_COMM_TRANSCEIVER 的参数：transfer_rate, network_name, internal_link

### comm（gps）｜通信设备

- **关键词**：comm, location, on, network_name, 通信设备
- **出处**：`satellite_demos/platforms/gps.txt:38-42`　（同签名共 7 处，另见 `satellite_demos/platforms/gps.txt:44`、`satellite_demos/platforms/gps.txt:50`、`satellite_demos/platforms/gps.txt:56`）
- **片段**：

```text
  comm GPS_DOWNLINKL1_TX GPS_DOWNLINKL1_TX
     location  394 0 1600 mm   # ref 1, location given for IIF Satellites
     on
     network_name GPS_Net
  end_comm
```

- **演示要点**：演示 comm 的参数：location, on, network_name

### comm（starlink）｜通信设备

- **关键词**：comm, yaw, group_join, network_name, 通信设备
- **出处**：`space_operations/platforms/starlink.txt:50-54`　（同签名共 2 处，另见 `space_operations/platforms/starlink.txt:62`）
- **片段**：

```text
   comm crosslink1 CROSSLINK
      yaw 0 deg      
      group_join DEDICATED_COMM  // links only to forward satellite
      network_name starlink_default
   end_comm
```

- **演示要点**：演示 comm 的参数：yaw, group_join, network_name

### comm（starlink）｜通信设备

- **关键词**：comm, pitch, group_join, network_name, 通信设备
- **出处**：`space_operations/platforms/starlink.txt:96-100`
- **片段**：

```text
   comm downlink DOWNLINK
      pitch -90 deg           
      group_join DOWNLINK
      network_name starlink_default
   end_comm
```

- **演示要点**：演示 comm 的参数：pitch, group_join, network_name

### comm · WSF_COMM_XMTR｜通信设备

- **关键词**：comm, WSF_COMM_XMTR, propagation_speed, network_name, internal_link, 通信设备
- **出处**：`air_to_air/platforms/brawler_test.txt:90-95`　（同签名共 2 处，另见 `air_to_air/platforms/brawler_test.txt:427`）
- **片段**：

```text
   comm wpn_datalink WSF_COMM_XMTR 
      propagation_speed 0 m/s   #instantaneous propogation (faster than speed of light)
      network_name weapons_subnet
      internal_link data_mgr
      internal_link raw_data_mgr
   end_comm
```

- **演示要点**：演示 WSF_COMM_XMTR 的参数：propagation_speed, network_name, internal_link

### comm（iads_cmdr）｜通信设备

- **关键词**：comm, router_name, network_name, internal_link, 通信设备
- **出处**：`cyber/exfiltrate_demo/platforms/iads_cmdr.txt:138-143`
- **片段**：

```text
   comm sub_net RED_DATALINK
      router_name router
      network_name <local:master>
      internal_link data_mgr
      internal_link task_mgr
   end_comm
```

- **演示要点**：演示 comm 的参数：router_name, network_name, internal_link

### comm · WSF_RADIO_RCVR｜通信设备

- **关键词**：comm, WSF_RADIO_RCVR, frequency, processor, network_name, 通信设备
- **出处**：`script_demos/script_demo_7.txt:430-435`
- **片段**：

```text
   comm rcvr-1 WSF_RADIO_RCVR
      frequency 1200 mhz
      processor track-proc
      processor attack-proc
      network_name blue_net
   end_comm
```

- **演示要点**：演示 WSF_RADIO_RCVR 的参数：frequency, processor, network_name

### comm · WSF_COMM_TRANSCEIVER｜通信设备

- **关键词**：comm, WSF_COMM_TRANSCEIVER, propagation_speed, network_name, internal_link, 通信设备
- **出处**：`brawler/platforms/brawler_flight_lead.txt:14-20`　（同签名共 5 处，另见 `brawler/platforms/brawler_platform.txt:180`、`brawler/platforms/gci_cmdr.txt:16`、`air_to_air/platforms/brawler_test.txt:80`）
- **片段**：

```text
   comm datalink WSF_COMM_TRANSCEIVER
      propagation_speed 0 m/s   #instantaneous propogation (faster than speed of light)
      network_name brawler_net
      internal_link data_mgr
      internal_link task_mgr
      internal_link perception
   end_comm
```

- **演示要点**：演示 WSF_COMM_TRANSCEIVER 的参数：propagation_speed, network_name, internal_link

### comm · WSF_RADIO_RCVR｜通信设备

- **关键词**：comm, WSF_RADIO_RCVR, network_name, internal_link, receiver, 通信设备
- **出处**：`base_types/weapons/aam/medium_range_uplink_missile.txt:100-109`
- **片段**：

```text
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
```

- **演示要点**：演示 WSF_RADIO_RCVR 的参数：network_name, internal_link, receiver

### comm · WSF_RADIO_RCVR｜通信设备

- **关键词**：comm, WSF_RADIO_RCVR, azimuth_field_of_view, elevation_field_of_view, receiver, 通信设备
- **出处**：`satellite_demos/avionics/comm/GPSCommDef.txt:118-128`　（同签名共 38 处，另见 `satellite_demos/avionics/comm/GPSCommDef.txt:130`、`satellite_demos/platforms/iridium.txt:85`、`satellite_demos/avionics/comm/GlobalstarCommDef.txt:39`）
- **片段**：

```text
comm GPS_UPLINKL2_RX WSF_RADIO_RCVR

   azimuth_field_of_view                  -180.0 deg 180.0 deg
   elevation_field_of_view                 -90.0 deg   90.0 deg

   receiver
      antenna_pattern                     SATELLITE_NADIR_CONE
      frequency                           1227.6 mhz
   end_receiver

end_comm
```

- **演示要点**：演示 WSF_RADIO_RCVR 的参数：azimuth_field_of_view, elevation_field_of_view, receiver

### comm · WSF_RADIO_TRANSCEIVER｜通信设备

- **关键词**：comm, WSF_RADIO_TRANSCEIVER, network_name, transmitter, receiver, 通信设备
- **出处**：`comm/comms/ad_hoc_comm.txt:50-61`
- **片段**：

```text
comm AD_HOC WSF_RADIO_TRANSCEIVER
   network_name ad_hoc
   transmitter
      frequency 100 mhz
      power 50 mw
      maximum_range 100 km
   end_transmitter
   
   receiver
      frequency 100 mhz
   end_receiver
end_comm
```

- **演示要点**：演示 WSF_RADIO_TRANSCEIVER 的参数：network_name, transmitter, receiver

### comm · WSF_RADIO_TRANSCEIVER｜通信设备

- **关键词**：comm, WSF_RADIO_TRANSCEIVER, transfer_rate, transmitter, receiver, 通信设备
- **出处**：`multiresolution_demos/comms/comm_include.txt:30-41`
- **片段**：

```text
comm TEAM_RADIOLINK WSF_RADIO_TRANSCEIVER
   transfer_rate 100 mbits/sec
   transmitter
     frequency 100 mhz
     power 1.21 gw
     maximum_range 100 km
   end_transmitter

   receiver
     frequency 100 mhz
   end_receiver
end_comm
```

- **演示要点**：演示 WSF_RADIO_TRANSCEIVER 的参数：transfer_rate, transmitter, receiver

### comm · WSF_RADIO_XMTR｜通信设备

- **关键词**：comm, WSF_RADIO_XMTR, azimuth_field_of_view, elevation_field_of_view, transmitter, 通信设备
- **出处**：`satellite_demos/platforms/iridium.txt:71-83`　（同签名共 35 处，另见 `satellite_demos/avionics/comm/GPSCommDef.txt:86`、`satellite_demos/avionics/comm/GlobalstarCommDef.txt:54`、`satellite_demos/avionics/comm/GlobalstarCommDef_GS.txt:15`）
- **片段**：

```text
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
```

- **演示要点**：演示 WSF_RADIO_XMTR 的参数：azimuth_field_of_view, elevation_field_of_view, transmitter

### comm · WSF_RADIO_TRANSCEIVER｜通信设备

- **关键词**：comm, WSF_RADIO_TRANSCEIVER, on, transmitter, receiver, 通信设备
- **出处**：`satellite_demos/platforms/iridium.txt:53-69`　（同签名共 2 处，另见 `satellite_demos/platforms/iridium.txt:33`）
- **片段**：

```text
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
```

- **演示要点**：演示 WSF_RADIO_TRANSCEIVER 的参数：on, transmitter, receiver

### comm（blue_abm_ttr）｜通信设备

- **关键词**：comm, network_name, internal_link, 通信设备
- **出处**：`ballistic_missile_shootdown/platforms/blue_abm_ttr.txt:15-18`　（同签名共 121 处，另见 `bearing_only/platforms/geometric_bearing_only_sensor_platform.txt:19`、`behavior_tree/platforms/gci.txt:21`、`behavior_tree/platforms/gci.txt:26`）
- **片段**：

```text
   comm datalink DATALINK
     network_name <local:slave>
     internal_link task_mgr
   end_comm
```

- **演示要点**：演示 comm 的参数：network_name, internal_link

### comm · WSF_COMM_TRANSCEIVER｜通信设备

- **关键词**：comm, WSF_COMM_TRANSCEIVER, network_name, internal_link, 通信设备
- **出处**：`air_to_air/platforms/dca.txt:64-67`　（同签名共 15 处，另见 `air_to_air/platforms/escort.txt:65`、`air_to_air/platforms/hvaa.txt:68`、`air_to_air/platforms/lte_fighter.txt:68`）
- **片段**：

```text
   comm weapon_datalink WSF_COMM_TRANSCEIVER      // uplink to weapons
      network_name weapons_subnet
      internal_link data_mgr
   end_comm
```

- **演示要点**：演示 WSF_COMM_TRANSCEIVER 的参数：network_name, internal_link

### comm · WSF_COMM_RCVR｜通信设备

- **关键词**：comm, WSF_COMM_RCVR, network_name, internal_link, 通信设备
- **出处**：`air_to_air/weapons/aam/medium_range_radar_missile.txt:220-223`　（同签名共 2 处，另见 `space_operations/platforms/commander.txt:37`）
- **片段**：

```text
   comm uplink WSF_COMM_RCVR       // uplink to weapons
      network_name weapons_subnet
      internal_link data_mgr
   end_comm
```

- **演示要点**：演示 WSF_COMM_RCVR 的参数：network_name, internal_link

### comm（beidou）｜通信设备

- **关键词**：comm, location, on, 通信设备
- **出处**：`satellite_demos/platforms/beidou.txt:30-33`　（同签名共 53 处，另见 `satellite_demos/platforms/beidou.txt:35`、`satellite_demos/platforms/beidou.txt:40`、`satellite_demos/platforms/galileo.txt:31`）
- **片段**：

```text
  comm BEIDOU_DOWNLINKB1_TX BEIDOU_DOWNLINKB1_TX
     location  600 0 1100 mm   # ref 1, the same location on MEO, IGSO, and GEO
   on
  end_comm
```

- **演示要点**：演示 comm 的参数：location, on

### comm · WSF_RADIO_XMTR｜通信设备

- **关键词**：comm, WSF_RADIO_XMTR, frequency, network_name, 通信设备
- **出处**：`script_demos/script_demo_7.txt:401-404`　（同签名共 2 处，另见 `script_demos/script_demo_7.txt:437`）
- **片段**：

```text
   comm xmtr-1 WSF_RADIO_XMTR
      frequency 1200 mhz
      network_name blue_net
   end_comm
```

- **演示要点**：演示 WSF_RADIO_XMTR 的参数：frequency, network_name

### comm（downlink）｜通信设备

- **关键词**：comm, on, group_join, 通信设备
- **出处**：`space_operations/comms/downlink.txt:15-18`　（同签名共 2 处，另见 `space_operations/comms/uplink.txt:15`）
- **片段**：

```text
comm DOWNLINK LASERCOMM_LINK 
   on
   group_join DOWNLINK   
end_comm
```

- **演示要点**：演示 comm 的参数：on, group_join

### comm（starlink）｜通信设备

- **关键词**：comm, yaw, network_name, 通信设备
- **出处**：`space_operations/platforms/starlink.txt:74-77`　（同签名共 2 处，另见 `space_operations/platforms/starlink.txt:85`）
- **片段**：

```text
   comm crosslink3 CROSSLINK 
      yaw -90 deg
      network_name starlink_default
   end_comm
```

- **演示要点**：演示 comm 的参数：yaw, network_name

### comm（uplink）｜通信设备

- **关键词**：comm, group_join, pitch, 通信设备
- **出处**：`space_operations/platforms/uplink.txt:22-25`
- **片段**：

```text
  comm uplink UPLINK
     group_join UPLINK
     pitch 90 deg 
  end_comm
```

- **演示要点**：演示 comm 的参数：group_join, pitch

### comm（ground_segment）｜通信设备

- **关键词**：comm, network_name, pitch, 通信设备
- **出处**：`space_operations/scenarios/ground_segment.txt:34-37`
- **片段**：

```text
  comm uplink
     network_name sender1
     pitch 90 deg
  end_comm
```

- **演示要点**：演示 comm 的参数：network_name, pitch

### comm（starlink_autogen）｜通信设备

- **关键词**：comm, network_name, link, 通信设备
- **出处**：`space_operations/scenarios/starlink_autogen.txt:23-26`　（同签名共 576 处，另见 `space_operations/scenarios/starlink_autogen.txt:28`、`space_operations/scenarios/starlink_autogen.txt:57`、`space_operations/scenarios/starlink_autogen.txt:62`）
- **片段**：

```text
   comm crosslink1
      network_name crosslink1_starlink_0_0
      link starlink_0_1 crosslink2
   end_comm
```

- **演示要点**：演示 comm 的参数：network_name, link

### comm · WSF_RADIO_RCVR｜通信设备

- **关键词**：comm, WSF_RADIO_RCVR, frequency, processor, 通信设备
- **出处**：`alv_routing/platforms/fighter_bomber.txt:21-25`　（同签名共 5 处，另见 `satellite_demos/scenarios/gps_denied.txt:479`、`script_demos/script_demo_2.txt:370`、`script_demos/script_demo_5.txt:336`）
- **片段**：

```text
   comm rcvr-1 WSF_RADIO_RCVR
      frequency 1200 mhz
      processor track-proc
      processor attack-proc
   end_comm
```

- **演示要点**：演示 WSF_RADIO_RCVR 的参数：frequency, processor

### comm · WSF_COMM_TRANSCEIVER｜通信设备

- **关键词**：comm, WSF_COMM_TRANSCEIVER, on, processor, 通信设备
- **出处**：`distributed_operations/xio_setup.txt:22-26`
- **片段**：

```text
   comm com1 WSF_COMM_TRANSCEIVER
      on
      processor dumper
      processor link-proc
   end_comm
```

- **演示要点**：演示 WSF_COMM_TRANSCEIVER 的参数：on, processor

### comm · WSF_COMM_TRANSCEIVER｜通信设备

- **关键词**：comm, WSF_COMM_TRANSCEIVER, internal_link, add, 通信设备
- **出处**：`space_operations/platforms/interceptor.txt:18-22`
- **片段**：

```text
   comm intercept_comm WSF_COMM_TRANSCEIVER
      internal_link message_proc
      add protocol localMulticast MULTICAST
      end_protocol
   end_comm
```

- **演示要点**：演示 WSF_COMM_TRANSCEIVER 的参数：internal_link, add

### comm · WSF_JTIDS_TERMINAL｜通信设备

- **关键词**：comm, WSF_JTIDS_TERMINAL, command_chain, slot_group, 通信设备
- **出处**：`l16_j11/jtids.txt:11-16`
- **片段**：

```text
comm J11_COMM WSF_JTIDS_TERMINAL
   command_chain NETWORK_ENABLED_WEAPON WEAPON_GRP
   slot_group WEAPON_GRP
      slots_per_frame 512
   end_slot_group
end_comm
```

- **演示要点**：演示 WSF_JTIDS_TERMINAL 的参数：command_chain, slot_group

### comm · WSF_RADIO_TRANSCEIVER｜通信设备

- **关键词**：comm, WSF_RADIO_TRANSCEIVER, transmitter, receiver, 通信设备
- **出处**：`space_operations/attitude_control.txt:41-49`
- **片段**：

```text
comm COMM WSF_RADIO_TRANSCEIVER
   transmitter
      power 1 kw
      frequency 1 ghz
      antenna_pattern comm_antenna
   end_transmitter
   receiver
   end_receiver
end_comm
```

- **演示要点**：演示 WSF_RADIO_TRANSCEIVER 的参数：transmitter, receiver

### comm · WSF_COMM_TRANSCEIVER｜通信设备

- **关键词**：comm, WSF_COMM_TRANSCEIVER, transfer_rate, 通信设备
- **出处**：`ballistic_missile_shootdown/platforms/common.txt:33-35`　（同签名共 26 处，另见 `behavior_tree/platforms/common.txt:26`、`behavior_tree/platforms/common.txt:35`、`behavior_tree/platforms/common.txt:43`）
- **片段**：

```text
comm DATALINK WSF_COMM_TRANSCEIVER
   transfer_rate      100 mbits/sec
end_comm
```

- **演示要点**：演示 WSF_COMM_TRANSCEIVER 的参数：transfer_rate

### comm · WSF_RADIO_RCVR｜通信设备

- **关键词**：comm, WSF_RADIO_RCVR, frequency, 通信设备
- **出处**：`alv_routing/platforms/awacs.txt:22-24`　（同签名共 6 处，另见 `satellite_demos/scenarios/gps_denied.txt:442`、`script_demos/script_demo_2.txt:337`、`script_demos/script_demo_5.txt:305`）
- **片段**：

```text
   comm rcvr-1 WSF_RADIO_RCVR
      frequency 1200 mhz
   end_comm
```

- **演示要点**：演示 WSF_RADIO_RCVR 的参数：frequency

### comm · WSF_RADIO_XMTR｜通信设备

- **关键词**：comm, WSF_RADIO_XMTR, frequency, 通信设备
- **出处**：`alv_routing/platforms/awacs.txt:26-28`　（同签名共 10 处，另见 `alv_routing/platforms/fighter_bomber.txt:27`、`satellite_demos/scenarios/gps_denied.txt:446`、`satellite_demos/scenarios/gps_denied.txt:485`）
- **片段**：

```text
   comm xmtr-1 WSF_RADIO_XMTR
      frequency 1200 mhz
   end_comm
```

- **演示要点**：演示 WSF_RADIO_XMTR 的参数：frequency

### comm · WSF_COMM_TRANSCEIVER｜通信设备

- **关键词**：comm, WSF_COMM_TRANSCEIVER, internal_link, 通信设备
- **出处**：`base_types/weapons/agm/mach_4_missile.txt:123-125`　（同签名共 37 处，另见 `base_types/weapons/sam/blue_lr_sam_complex.txt:34`、`base_types/weapons/sam/blue_sr_sam_complex.txt:47`、`base_types/weapons/ssm/blue_cruise_missile.txt:101`）
- **片段**：

```text
   comm uplink WSF_COMM_TRANSCEIVER
      internal_link data_mgr
   end_comm
```

- **演示要点**：演示 WSF_COMM_TRANSCEIVER 的参数：internal_link

### comm（group_comm_example）｜通信设备

- **关键词**：comm, internal_link, 通信设备
- **出处**：`comm/group_comm_example.txt:61-63`　（同签名共 5 处，另见 `l16_j11/platforms.txt:76`、`multiresolution_demos/comm_demo.txt:86`、`electronic_warfare/comm_jamming.txt:164`）
- **片段**：

```text
   comm datalink BASIC_COMM
      internal_link track_proc
   end_comm
```

- **演示要点**：演示 comm 的参数：internal_link

### comm · WSF_COMM_XMTR｜通信设备

- **关键词**：comm, WSF_COMM_XMTR, router_name, 通信设备
- **出处**：`cyber/exfiltrate_demo/platforms/iads_cmdr.txt:145-147`
- **片段**：

```text
   comm hackable_comm WSF_COMM_XMTR 
      router_name router
   end_comm
```

- **演示要点**：演示 WSF_COMM_XMTR 的参数：router_name

### comm（spotter）｜通信设备

- **关键词**：comm, network_name, 通信设备
- **出处**：`cyber/platforms/spotter.txt:18-20`　（同签名共 877 处，另见 `electronic_warfare/false-target_command_center.txt:237`、`electronic_warfare/jam_strobe_direction_finder.txt:92`、`electronic_warfare/jam_strobe_tracking.txt:195`）
- **片段**：

```text
   comm datalink RED_DATALINK
     network_name <local:slave>
   end_comm
```

- **演示要点**：演示 comm 的参数：network_name

### comm（beidou）｜通信设备

- **关键词**：comm, on, 通信设备
- **出处**：`satellite_demos/platforms/beidou.txt:45-47`　（同签名共 59 处，另见 `satellite_demos/platforms/beidou.txt:49`、`satellite_demos/platforms/beidou.txt:53`、`satellite_demos/platforms/beidou_gs.txt:17`）
- **片段**：

```text
  comm BEIDOU_UPLINKB1_RX BEIDOU_UPLINKB1_RX
   on
  end_comm
```

- **演示要点**：演示 comm 的参数：on

### comm（attitude_control）｜通信设备

- **关键词**：comm, yaw, 通信设备
- **出处**：`space_operations/attitude_control.txt:105-107`
- **片段**：

```text
   comm comm COMM
      yaw 0 deg
   end_comm
```

- **演示要点**：演示 comm 的参数：yaw

### comm（crosslink）｜通信设备

- **关键词**：comm, group_join, 通信设备
- **出处**：`space_operations/comms/crosslink.txt:15-17`
- **片段**：

```text
comm CROSSLINK LASERCOMM_LINK 
   group_join CROSSLINK 
end_comm
```

- **演示要点**：演示 comm 的参数：group_join

### comm · WSF_COMM_TRANSCEIVER｜通信设备

- **关键词**：comm, WSF_COMM_TRANSCEIVER, add, 通信设备
- **出处**：`space_operations/scenarios/launch_with_telemetry.txt:29-32`
- **片段**：

```text
   comm LV_comm WSF_COMM_TRANSCEIVER
      add protocol localMulticast LAUNCH_MULTICAST
      end_protocol
   end_comm
```

- **演示要点**：演示 WSF_COMM_TRANSCEIVER 的参数：add

### comm（sam_battery）｜通信设备

- **关键词**：comm, processor, 通信设备
- **出处**：`suppressor/platforms/sam_battery.txt:19-22`　（同签名共 2 处，另见 `suppressor/platforms/sam_regiment.txt:38`）
- **片段**：

```text
  comm red-net COMM_RADIO
    processor track_processor
    processor thinker
  end_comm
```

- **演示要点**：演示 comm 的参数：processor

### comm（comm_demo）｜通信设备

- **关键词**：comm, 通信设备
- **出处**：`multiresolution_demos/comm_demo.txt:80-81`　（同签名共 10 处，另见 `multiresolution_demos/comms/comm_include.txt:46`、`multiresolution_demos/comms/comm_include.txt:52`、`new_guidance/platforms/red_naval_helicopter.txt:40`）
- **片段**：

```text
   comm cmdr_comm TEAM_DATALINK
   end_comm
```

- **演示要点**：演示 comm（最小结构，无子参数）

### comm · WSF_COMM_TRANSCEIVER｜通信设备

- **关键词**：comm, WSF_COMM_TRANSCEIVER, 通信设备
- **出处**：`bearing_only/platforms/common.txt:45-46`　（同签名共 19 处，另见 `electronic_warfare/jam_strobe_direction_finder.txt:25`、`fires/time_on_target.txt:19`、`new_guidance/platforms/missile_ship.txt:42`）
- **片段**：

```text
comm WINGMAN_DATALINK WSF_COMM_TRANSCEIVER
end_comm
```

- **演示要点**：演示 WSF_COMM_TRANSCEIVER（最小结构，无子参数）

### comm_link_list（comm_with_command_chain_demo）｜

- **关键词**：comm_link_list, link
- **出处**：`multiresolution_demos/comm_with_command_chain_demo.txt:40-43`　（同签名共 2 处，另见 `satellite_demos/scenarios/comm_satellite.txt:21`）
- **片段**：

```text
   comm_link_list
      link palpatine mr_comm vader mr_comm
      link palpatine mr_comm tarkin mr_comm
   end_comm_link_list
```

- **演示要点**：演示 comm_link_list 的参数：link

### comm_list（comm_with_command_chain_demo）｜

- **关键词**：comm_list, member
- **出处**：`multiresolution_demos/comm_with_command_chain_demo.txt:35-39`
- **片段**：

```text
   comm_list
      member palpatine mr_comm
      member vader mr_comm
      member tarkin mr_comm
   end_comm_list
```

- **演示要点**：演示 comm_list 的参数：member

### comm_network · WSF_COMM_NETWORK｜

- **关键词**：comm_network, WSF_COMM_NETWORK, transfer_rate
- **出处**：`satellite_demos/iridium.txt:30-32`
- **片段**：

```text
comm_network iridium_ground_network WSF_COMM_NETWORK
   transfer_rate 2400 bits/sec
end_comm_network
```

- **演示要点**：演示 WSF_COMM_NETWORK 的参数：transfer_rate

### commodity（receiver_definition）｜

- **关键词**：commodity, maximum_mass_quantity, mass_rate
- **出处**：`exchange_proc/receiver_definition.txt:24-27`　（同签名共 6 处，另见 `exchange_proc/tanker_definition.txt:24`、`logistics/platforms/ocean_going_tanker.txt:39`、`logistics/scenarios/stationary_storage_depots.txt:25`）
- **片段**：

```text
         commodity JP8_FUEL
           maximum_mass_quantity 8000 kg
           mass_rate 40 kg/s
         end_commodity
```

- **演示要点**：演示 commodity 的参数：maximum_mass_quantity, mass_rate

### commodity（fueling_truck）｜

- **关键词**：commodity, maximum_mass_quantity, maximum_mass_rate
- **出处**：`logistics/platforms/fueling_truck.txt:33-36`　（同签名共 3 处，另见 `logistics/platforms/semi_tanker_truck.txt:33`、`logistics/platforms/strike_platform.txt:27`）
- **片段**：

```text
         commodity JP-8_FUEL
            maximum_mass_quantity 6200 kg
            maximum_mass_rate       30 kg/sec
         end_commodity
```

- **演示要点**：演示 commodity 的参数：maximum_mass_quantity, maximum_mass_rate

### commodity（stationary_storage_depots）｜

- **关键词**：commodity, maximum_quantity, rate
- **出处**：`logistics/scenarios/stationary_storage_depots.txt:135-138`
- **片段**：

```text
         commodity ENGINE_REPAIR
            maximum_quantity 200.0
            rate              0.1 # One in ten seconds (VERY FAST!)
         end_commodity
```

- **演示要点**：演示 commodity 的参数：maximum_quantity, rate

### common（sensor_include）｜

- **关键词**：common, on, reports_range, frame_time, azimuth_field_of_view, elevation_field_of_view, maximum_range, slew_mode, azimuth_slew_limits, elevation_slew_limits, azimuth_slew_rate, elevation_slew_rate, selection_mode
- **出处**：`multiresolution_demos/sensors/sensor_include.txt:44-59`
- **片段**：

```text
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
```

- **演示要点**：演示 common 的参数：on, reports_range, frame_time, azimuth_field_of_view, elevation_field_of_view, maximum_range, slew_mode, azimuth_slew_limits, elevation_slew_limits, azimuth_slew_rate

### common（space_mover）｜

- **关键词**：common, update_interval, eccentricity, semi_major_axis, raan, inclination, true_anomaly, argument_of_periapsis
- **出处**：`multiresolution_demos/movers/space_mover.txt:48-56`
- **片段**：

```text
   common
      update_interval 5 sec
      eccentricity 1e-3
      semi_major_axis 6600 km
      raan 0 deg
      inclination 0 deg
      true_anomaly 0 deg
      argument_of_periapsis 0 deg
   end_common
```

- **演示要点**：演示 common 的参数：update_interval, eccentricity, semi_major_axis, raan, inclination, true_anomaly, argument_of_periapsis

### common（comm_with_command_chain_demo）｜

- **关键词**：common, network_name, internal_link
- **出处**：`multiresolution_demos/comm_with_command_chain_demo.txt:70-73`　（同签名共 2 处，另见 `multiresolution_demos/comm_with_command_chain_demo.txt:85`）
- **片段**：

```text
      common
         network_name imperial_net
         internal_link message_receiver
      end_common
```

- **演示要点**：演示 common 的参数：network_name, internal_link

### common（comm_demo）｜

- **关键词**：common, internal_link
- **出处**：`multiresolution_demos/comm_demo.txt:58-60`
- **片段**：

```text
      common
         internal_link message_receiver
      end_common
```

- **演示要点**：演示 common 的参数：internal_link

### common（comm_with_command_chain_demo）｜

- **关键词**：common, network_name
- **出处**：`multiresolution_demos/comm_with_command_chain_demo.txt:50-52`
- **片段**：

```text
      common
         network_name imperial_net
      end_common
```

- **演示要点**：演示 common 的参数：network_name

### common（air_mover_demo）｜

- **关键词**：common, route
- **出处**：`multiresolution_demos/air_mover_demo.txt:44-50`
- **片段**：

```text
      common
         route
            position 0n 0e altitude 20000 ft heading 0 deg speed 450 kts
            position 0.1n 0e altitude 20000 ft speed 450 kts
            position 0.1n 0.1e altitude 25000 ft speed 450 kts
         end_route
      end_common
```

- **演示要点**：演示 common 的参数：route

### link16_interface（j11_out）｜

- **关键词**：link16_interface, j11
- **出处**：`l16_j11/j11_out.txt:90-96`　（同签名共 2 处，另见 `l16_j11/j11_in.txt:62`）
- **片段**：

```text
link16_interface
#   debug true
   j11
      allow_any_comm
#      print_messages
   end_j11
end_link16_interface
```

- **演示要点**：演示 link16_interface 的参数：j11

### message_processor（jtids）｜

- **关键词**：message_processor, send_interval, command_chain, script
- **出处**：`l16_j11/jtids.txt:45-107`
- **片段**：

```text
   message_processor j11 SCRIPTED

      send_interval rrn 9
      command_chain NETWORK_ENABLED_WEAPON

      # Gets called based on the send_interval
      script void on_send()
         # The weapon is launched around 15 sec so start
         # sending in-flight target update (IFTU) messages at this point
         if (TIME_NOW > 15)
         {
            // J11.1 Initial
            WsfTadilJ11_1I msg = WsfTadilJ11_1I();
            msg.TrackNumberAddressee(1);
            msg.WeaponDirective(12);
            msg.ResponseRequest(true);

            // J11.1 Continuation Word 2
            WsfTadilJ11_1C2 cont2 = msg.FindContinuation2();
            if (!cont2.IsValid())
            {
               cont2 = msg.AddContinuation2();
            }
            cont2.Latitude(35.6153);
            cont2.Longitude(-118);
#            cont2.TargetVelocityDown(0);

            // J11.1 Continuation Word 3
            WsfTadilJ11_1C3 cont3 = msg.FindContinuation3();
            if (!cont3.IsValid())
            {
               cont3 = msg.AddContinuation3();
            }
            cont3.HeightAboveEllipsoid(PLATFORM.Altitude());
#            cont3.TargetVelocityNorth(0);
#            cont3.TargetVelocityEast(0);

            // J11.1 Continuation Word 5
            WsfTadilJ11_1C5 cont5 = msg.FindContinuation5();
            if (!cont5.IsValid())
            {
               cont5 = msg.AddContinuation5();
            }
            // This MUST be added or the J11.1 is not considered valid J11.1-5
            // and will not be sent!!
            string trackNumberString = "11";
            cont5.TrackNumber(trackNumberString);

            // Request the SCRIPTED part to send the message
            // If output_wsf is true, then the part will try to send this message
            // internally to recipients found on the command chain defined in this processor
            // If output_dis is true, the message will get sent over DIS as a signal PDU
#            msg.Print();
            JPROCESSOR.SendJMessage(msg);
         }
      end_script

      # Notification that a WIFT has been received
      script void on_message_11_0(WsfTadilJ11_0I aMessage)
         writeln("Received a WIFT (11.0) message");
      end_script

   end_message_processor
```

- **演示要点**：演示 message_processor 的参数：send_interval, command_chain, script

### message_processor（jtids）｜

- **关键词**：message_processor, send_interval, command_chain
- **出处**：`l16_j11/jtids.txt:33-36`
- **片段**：

```text
   message_processor NetworkEnabledWeapon NETWORK_ENABLED_WEAPON
      send_interval rrn 9
      command_chain NETWORK_ENABLED_WEAPON
   end_message_processor
```

- **演示要点**：演示 message_processor 的参数：send_interval, command_chain

### message_table（bomb_demo）｜

- **关键词**：message_table, default_comm_type, type, default
- **出处**：`suppressor/bomb_demo.txt:37-43`
- **片段**：

```text
message_table
  default_comm_type
    type WSF_TASK_ASSIGN_MESSAGE 3600 bits          // 3.6 sec
    type WSF_TASK_CANCEL_MESSAGE 2700 bits          // 2.7 sec
    type WSF_TASK_STATUS_MESSAGE 3600 bits          // 3.6 sec
    default                      2500 bits          // 2.5 sec
end_message_table
```

- **演示要点**：演示 message_table 的参数：default_comm_type, type, default

### multiresolution_comm · WSF_MULTIRESOLUTION_COMM｜

- **关键词**：multiresolution_comm, WSF_MULTIRESOLUTION_COMM, model
- **出处**：`multiresolution_demos/comms/comm_include.txt:43-55`
- **片段**：

```text
multiresolution_comm MR_COMM WSF_MULTIRESOLUTION_COMM
   model low_fidelity_comm
      fidelity_range 0.0 0.5
      comm TEAM_DATALINK
      end_comm
   end_model
    
   model high_fidelity_comm 
      fidelity_range 0.5 1.0
      comm TEAM_RADIOLINK
      end_comm
   end_model
end_multiresolution_comm
```

- **演示要点**：演示 WSF_MULTIRESOLUTION_COMM 的参数：model

### network（nkorea_traffic）｜网络

- **关键词**：network, vehicle_count, maximum_speed, minimum_distance_off_road, maximum_distance_off_road, pause_time_off_road, mean_travel_time, sigma_travel_time, vehicle, fraction, mean_speed, sigma_speed, 网络
- **出处**：`traffic_demos/scenarios/nkorea_traffic.txt:11-37`　（同签名共 2 处，另见 `traffic_demos/scenarios/stl_traffic.txt:10`）
- **片段**：

```text
  network nkorea_roadnetwork
    vehicle_count              500
    maximum_speed               80 mi/h
    minimum_distance_off_road    0.09 nm
    maximum_distance_off_road    0.11 nm
    pause_time_off_road          0.5 min
    mean_travel_time            40.0 min
    sigma_travel_time            5.0 min

    vehicle CAR
      fraction      0.80
      mean_speed   60 mi/h
      sigma_speed   5 mi/h
    end_vehicle

    vehicle PICKUP_TRUCK
      fraction      0.15
      mean_speed   60 mi/h
      sigma_speed  10 mi/h
    end_vehicle

    vehicle SCHOOL_BUS
      fraction      0.05
      mean_speed   50 mi/h
      sigma_speed  10 mi/h
    end_vehicle
  end_network
```

- **演示要点**：演示 network 的参数：vehicle_count, maximum_speed, minimum_distance_off_road, maximum_distance_off_road, pause_time_off_road, mean_travel_time, sigma_travel_time, vehicle, fraction, mean_speed

### network（korea_traffic）｜网络

- **关键词**：network, vehicle_count, maximum_speed, minimum_distance_off_road, maximum_distance_off_road, pause_time_off_road, mean_travel_time, sigma_travel_time, weighted_region, vehicle, convoy, 网络
- **出处**：`traffic_demos/scenarios/korea_traffic.txt:16-112`
- **片段**：

```text
   network korea_roadnetwork

      vehicle_count               200
      maximum_speed               100.0 mi/h
      minimum_distance_off_road     0.1 nm
      maximum_distance_off_road     0.2 nm
      pause_time_off_road           0.01 min
      mean_travel_time              2 hr
      sigma_travel_time             1 hr

      // The following weighted regions define areas of higher concentrations
      // of traffic.  You can place as many as you want and specify their radii
      // and weighting factors.  The higher the weighting factor, the higher the
      // the density of traffic will be around that region.

      // Lets cluster the vehicles around the following Korean cities.

      // Seoul
      weighted_region
         latitude     37:32:00n
         longitude   126:56:00e
         inner_radius  0 nm
         outer_radius  12 nm
         inner_weight  12.0
         outer_weight  6.0
      end_weighted_region

      // Yongyang
      weighted_region
         latitude     39:02:00n
         longitude   125:45:00e
         inner_radius  0 nm
         outer_radius  3 nm
         inner_weight  2.0
         outer_weight  2.0
      end_weighted_region

      // Kaesong
      weighted_region
         latitude     37:58:00n
         longitude   126:33:30e
         inner_radius  0 nm
         outer_radius  2 nm
         inner_weight  2.5
         outer_weight  2.0
      end_weighted_region

      // Wonsan
      weighted_region
         latitude     39:10:00n
         longitude   127:26:00e
         inner_radius  1 nm
         outer_radius  2 nm
         inner_weight  2.0
         outer_weight  2.0
      end_weighted_region

      // Specify the types of vehicles that should show up as random traffic
      // on this road network.
      // Note: fraction is the percentage of vehicles that will be of a given
      // type. Make sure all the fractions sum to 1.0.

      vehicle CAR
         fraction      0.75
         mean_speed   60 mi/h
         sigma_speed   5 mi/h
      end_vehicle

      vehicle PICKUP_TRUCK
         fraction      0.20
         mean_speed   55 mi/h
         sigma_speed  10 mi/h
      end_vehicle

      vehicle SCHOOL_BUS
         fraction      0.05
         mean_speed   50 mi/h
         sigma_speed   5 mi/h
      end_vehicle

      // Create a convoy.  (Convoy is broken right now)
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
  end_network
```

- **演示要点**：演示 network 的参数：vehicle_count, maximum_speed, minimum_distance_off_road, maximum_distance_off_road, pause_time_off_road, mean_travel_time, sigma_travel_time, weighted_region, vehicle, convoy

### network（china_traffic）｜网络

- **关键词**：network, vehicle_count, maximum_speed, minimum_distance_off_road, maximum_distance_off_road, pause_time_off_road, mean_travel_time, sigma_travel_time, weighted_region, vehicle, 网络
- **出处**：`traffic_demos/scenarios/china_traffic.txt:16-54`　（同签名共 2 处，另见 `traffic_demos/scenarios/taiwan_traffic.txt:16`）
- **片段**：

```text
   network china_expressways

      vehicle_count               800
      maximum_speed               100.0 mi/h
      minimum_distance_off_road     0.1 nm
      maximum_distance_off_road     0.2 nm
      pause_time_off_road           0.01 min
      mean_travel_time              3 hr
      sigma_travel_time             3 hr
/*
      weighted_region
         latitude     37:32:00n
         longitude   126:56:00e
         inner_radius  0 nm
         outer_radius  12 nm
         inner_weight  12.0
         outer_weight  6.0
      end_weighted_region
*/

      vehicle CAR
         fraction      0.75
         mean_speed   60 mi/h
         sigma_speed   5 mi/h
      end_vehicle

      vehicle PICKUP_TRUCK
         fraction      0.20
         mean_speed   55 mi/h
         sigma_speed  10 mi/h
      end_vehicle

      vehicle SCHOOL_BUS
         fraction      0.05
         mean_speed   50 mi/h
         sigma_speed   5 mi/h
      end_vehicle

  end_network
```

- **演示要点**：演示 network 的参数：vehicle_count, maximum_speed, minimum_distance_off_road, maximum_distance_off_road, pause_time_off_road, mean_travel_time, sigma_travel_time, weighted_region, vehicle

### network（taiwan_traffic）｜网络

- **关键词**：network, vehicle_count, maximum_speed, minimum_distance_off_road, maximum_distance_off_road, pause_time_off_road, mean_travel_time, sigma_travel_time, vehicle, 网络
- **出处**：`traffic_demos/scenarios/taiwan_traffic.txt:59-87`
- **片段**：

```text
   network taiwan_highways

      vehicle_count               200
      maximum_speed               100.0 mi/h
      minimum_distance_off_road     0.1 nm
      maximum_distance_off_road     0.2 nm
      pause_time_off_road           0.01 min
      mean_travel_time              2 hr
      sigma_travel_time             1 hr

      vehicle CAR
         fraction      0.75
         mean_speed   60 mi/h
         sigma_speed   5 mi/h
      end_vehicle

      vehicle PICKUP_TRUCK
         fraction      0.20
         mean_speed   55 mi/h
         sigma_speed  10 mi/h
      end_vehicle

      vehicle SCHOOL_BUS
         fraction      0.05
         mean_speed   50 mi/h
         sigma_speed   5 mi/h
      end_vehicle

  end_network
```

- **演示要点**：演示 network 的参数：vehicle_count, maximum_speed, minimum_distance_off_road, maximum_distance_off_road, pause_time_off_road, mean_travel_time, sigma_travel_time, vehicle

### network（osm_traffic）｜网络

- **关键词**：network, vehicle_count, maximum_speed, vehicle, fraction, mean_speed, sigma_speed, 网络
- **出处**：`traffic_demos/scenarios/osm_traffic.txt:10-36`
- **片段**：

```text
  network osm_roadnetwork 
    vehicle_count                50
    maximum_speed                75 mi/h
    #minimum_distance_off_road    1 nm
    #maximum_distance_off_road    2 nm
    #pause_time_off_road        240 min
    #mean_travel_time            40.0 min
    #sigma_travel_time            5.0 min

    vehicle CAR
      fraction      0.80
      mean_speed   60 mi/h
      sigma_speed   5 mi/h
    end_vehicle

    vehicle PICKUP_TRUCK
      fraction      0.15
      mean_speed   60 mi/h
      sigma_speed  10 mi/h
    end_vehicle

    vehicle SCHOOL_BUS
      fraction      0.05
      mean_speed   50 mi/h
      sigma_speed  10 mi/h
    end_vehicle
  end_network
```

- **演示要点**：演示 network 的参数：vehicle_count, maximum_speed, vehicle, fraction, mean_speed, sigma_speed

### network · WSF_COMM_NETWORK_GENERIC｜网络

- **关键词**：network, WSF_COMM_NETWORK_GENERIC, comm_list, comm_link_list, 网络
- **出处**：`multiresolution_demos/comm_with_command_chain_demo.txt:34-44`
- **片段**：

```text
network imperial_net WSF_COMM_NETWORK_GENERIC
   comm_list
      member palpatine mr_comm
      member vader mr_comm
      member tarkin mr_comm
   end_comm_list
   comm_link_list
      link palpatine mr_comm vader mr_comm
      link palpatine mr_comm tarkin mr_comm
   end_comm_link_list
end_network
```

- **演示要点**：演示 WSF_COMM_NETWORK_GENERIC 的参数：comm_list, comm_link_list

### network · WSF_COMM_NETWORK_AD_HOC｜网络

- **关键词**：network, WSF_COMM_NETWORK_AD_HOC, update_rate, 网络
- **出处**：`comm/comms/network.txt:10-12`
- **片段**：

```text
network ad_hoc WSF_COMM_NETWORK_AD_HOC
   update_rate normal mean 5.0 s sigma 0.25 s
end_network
```

- **演示要点**：演示 WSF_COMM_NETWORK_AD_HOC 的参数：update_rate

### network · WSF_COMM_NETWORK_GENERIC｜网络

- **关键词**：network, WSF_COMM_NETWORK_GENERIC, network_address, 网络
- **出处**：`space_operations/platforms/starlink.txt:24-26`
- **片段**：

```text
network starlink_default WSF_COMM_NETWORK_GENERIC
   network_address 192.168.1.1/21
end_network
```

- **演示要点**：演示 WSF_COMM_NETWORK_GENERIC 的参数：network_address

### network · WSF_COMM_NETWORK_GENERIC｜网络

- **关键词**：network, WSF_COMM_NETWORK_GENERIC, comm_link_list, 网络
- **出处**：`satellite_demos/scenarios/comm_satellite.txt:20-29`
- **片段**：

```text
network ComsatNet WSF_COMM_NETWORK_GENERIC
   comm_link_list
      # uplinks to satellite
      link SAT_GS-STL radio AO-51 uplink-1
      link SAT_GS-LAX radio AO-51 uplink-1
      # downlinks to ground stations
      link AO-51 downlink-1 SAT_GS-STL radio
      link AO-51 downlink-1 SAT_GS-LAX radio
   end_comm_link_list
end_network
```

- **演示要点**：演示 WSF_COMM_NETWORK_GENERIC 的参数：comm_link_list

### network · WSF_COMM_NETWORK_MESH｜网络

- **关键词**：network, WSF_COMM_NETWORK_MESH, 网络
- **出处**：`multiresolution_demos/processor_with_link_demo.txt:33-34`　（同签名共 3 处，另见 `satellite_demos/scenarios/gps_denied.txt:11`、`script_demos/script_demo_7.txt:41`）
- **片段**：

```text
network mesh_net WSF_COMM_NETWORK_MESH
end_network
```

- **演示要点**：演示 WSF_COMM_NETWORK_MESH（最小结构，无子参数）

### protocol · WSF_COMM_PROTOCOL_IGMP｜协议

- **关键词**：protocol, WSF_COMM_PROTOCOL_IGMP, join_multicast_group, 协议
- **出处**：`space_operations/platforms/interceptor.txt:13-15`
- **片段**：

```text
protocol MULTICAST WSF_COMM_PROTOCOL_IGMP
   join_multicast_group 230.1.1.1/32
end_protocol
```

- **演示要点**：演示 WSF_COMM_PROTOCOL_IGMP 的参数：join_multicast_group

### protocol · WSF_COMM_PROTOCOL_IGMP｜协议

- **关键词**：protocol, WSF_COMM_PROTOCOL_IGMP, 协议
- **出处**：`space_operations/scenarios/launch_with_telemetry.txt:17-19`
- **片段**：

```text
protocol LAUNCH_MULTICAST WSF_COMM_PROTOCOL_IGMP
      join_multicast_group 230.1.1.1/32
end_protocol
```

- **演示要点**：演示 WSF_COMM_PROTOCOL_IGMP（最小结构，无子参数）

### router · WSF_COMM_ROUTER｜路由器

- **关键词**：router, WSF_COMM_ROUTER, add, use_default_protocol, hop_limit, 路由器
- **出处**：`comm/comms/ad_hoc_comm.txt:132-136`
- **片段**：

```text
router DEFAULT WSF_COMM_ROUTER
   add router_protocol ad_hoc AD_HOC end_router_protocol
   use_default_protocol false
   hop_limit 10
end_router
```

- **演示要点**：演示 WSF_COMM_ROUTER 的参数：add, use_default_protocol, hop_limit

### router · WSF_COMM_ROUTER｜路由器

- **关键词**：router, WSF_COMM_ROUTER, automated_interface_linking, 路由器
- **出处**：`cyber/exfiltrate_demo/platforms/iads_cmdr.txt:134-136`　（同签名共 2 处，另见 `space_operations/platforms/starlink.txt:46`）
- **片段**：

```text
   router router WSF_COMM_ROUTER 
      automated_interface_linking true
   end_router
```

- **演示要点**：演示 WSF_COMM_ROUTER 的参数：automated_interface_linking

### router_protocol · WSF_COMM_ROUTER_PROTOCOL_AD_HOC｜

- **关键词**：router_protocol, WSF_COMM_ROUTER_PROTOCOL_AD_HOC, script
- **出处**：`comm/comms/ad_hoc_comm.txt:63-130`
- **片段**：

```text
router_protocol AD_HOC WSF_COMM_ROUTER_PROTOCOL_AD_HOC
   
   script bool OnCommAdded(WsfAddress aAddress, WsfCommGraph aGraph, WsfCommRouter aRouter)
      return true;
   end_script
   
   script bool OnCommRemoved(WsfAddress aAddress, WsfCommGraph aGraph, WsfCommRouter aRouter)
      return true;
   end_script
   
   script bool OnConnectionAdded(WsfAddress aSourceAddress, WsfAddress aDestinationAddress, WsfCommGraph aGraph, WsfCommRouter aRouter)
      // Only accept outgoing connections with a local interface
      Array<WsfAddress> interfaces = aRouter.GetInterfaces();
      foreach(WsfAddress address in interfaces)
      {
         if(address.GetAddress() == aSourceAddress.GetAddress())
         {
            DrawConnection(aSourceAddress, aDestinationAddress);
            return true;
         }
      }
      return false;
   end_script
   
   script bool OnConnectionRemoved(WsfAddress aSourceAddress, WsfAddress aDestinationAddress, WsfCommGraph aGraph, WsfCommRouter aRouter)
      EraseDrawConnection(aSourceAddress, aDestinationAddress);
      return true;
   end_script
   
   script WsfAddress OnMessageRouting(WsfCommMessage aMessage, WsfAddress aAddress, WsfCommGraph aGraph, WsfCommRouter aRouter)
      // Use a greedy algorithm that selects the next hop based on distance from destination.
      Array<WsfCommGraphEdge> edges = aGraph.GetOutgoingNodeEdges(aAddress);
      WsfComm destinationComm = WsfComm.GetComm(aMessage.GetSourceMessage().Destination());
      WsfGeoPoint destLoc = destinationComm.Platform().Location();
      WsfAddress hop = {};
      double totalDistance = MATH.DOUBLE_MAX();
      Array<WsfAddress> traceRoute = aMessage.GetTraceRoute();
      foreach(WsfCommGraphEdge edge in edges)
      {
         if(edge.DestinationAddress().GetAddress() == aAddress.GetAddress())
         {
            continue;
         }
         
         foreach(WsfAddress visited in traceRoute)
         {
            if(visited.GetAddress() == edge.DestinationAddress().GetAddress())
            {
               continue;
            }
         }
         WsfComm potentialComm = WsfComm.GetComm(edge.DestinationAddress());
         double distance = destLoc.GroundRangeTo(potentialComm.Platform().Location());
         if(distance < totalDistance)
         {
            totalDistance = distance;
            hop = edge.DestinationAddress();
         }
      }
      
      if(!hop.IsNull())
      {
         DrawRouting(aAddress, hop);
      }
      
      return hop;  
   end_script
end_router_protocol
```

- **演示要点**：演示 WSF_COMM_ROUTER_PROTOCOL_AD_HOC 的参数：script
