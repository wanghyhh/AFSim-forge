antenna_pattern {{SENSOR_NAME}}_ANTENNA_SEARCH circular_pattern
   peak_gain {{PEAK_GAIN}} db
   beamwidth {{BEAMWIDTH}} degrees
   minimum_gain -10 db
end_antenna_pattern

sensor {{SENSOR_NAME}} WSF_RADAR_SENSOR
   on
   damage_factor 0
   slew_mode both
   azimuth_slew_limits -180 degrees 180 degrees
   elevation_slew_limits 0 degrees 80 degrees
   ignore_same_side
   mode ACQUIRE
      frame_time {{FRAME_TIME}} s
      hits_to_establish_track 3 5
      hits_to_maintain_track 1 5
      reports_range
      reports_velocity
      reports_bearing
      reports_elevation
      track_quality 0.9
      beam 1
         antenna_height {{ANTENNA_HEIGHT}} m
         scan_mode both
         azimuth_scan_limits -5 degrees 5 degrees
         elevation_scan_limits -5 degrees 5 degrees
         probability_of_false_alarm 0.000001
         transmitter
            frequency {{FREQUENCY}} mhz
            antenna_pattern {{SENSOR_NAME}}_ANTENNA_SEARCH
            bandwidth {{BANDWIDTH}} mhz
            check_terrain_masking off
            internal_loss 2 db
            power {{POWER}} kw
         end_transmitter
         receiver
            bandwidth {{BANDWIDTH}} mhz
            internal_loss 7 db
         end_receiver
      end_beam
   end_mode
   mode TRACK
      frame_time 1 s
      hits_to_establish_track 3 5
      hits_to_maintain_track 1 3
      reports_range
      reports_velocity
      reports_bearing
      reports_elevation
      track_quality 1
      beam 1
         antenna_height {{ANTENNA_HEIGHT}} m
         scan_mode both
         azimuth_scan_limits -1 degrees 1 degrees
         elevation_scan_limits -1 degrees 1 degrees
         probability_of_false_alarm 0.000001
         transmitter
            frequency {{FREQUENCY}} mhz
            antenna_pattern {{SENSOR_NAME}}_ANTENNA_SEARCH
            bandwidth {{BANDWIDTH}} mhz
            check_terrain_masking off
            internal_loss 2 db
            power {{POWER}} kw
         end_transmitter
         receiver
            bandwidth {{BANDWIDTH}} mhz
            internal_loss 7 db
         end_receiver
      end_beam
   end_mode
end_sensor
