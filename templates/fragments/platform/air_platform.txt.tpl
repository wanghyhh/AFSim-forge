include_once mover/{{MOVER_NAME}}.txt
include_once sensor/{{SENSOR_NAME}}.txt
include_once weapon/{{WEAPON_NAME}}.txt
include_once comm/{{COMM_NAME}}.txt
include_once signatures/{{RADAR_SIG_NAME}}.txt
include_once signatures/{{IR_SIG_NAME}}.txt
include_once signatures/{{OPT_SIG_NAME}}.txt
include_once processor/{{PROCESSOR_NAME}}.txt

platform_type {{PLATFORM_TYPE}} WSF_PLATFORM
   side {{SIDE}}
   icon {{ICON}}
   indestructible destructible
   on_broken remove
   category {{CATEGORY}}
   aux_data
      int health_point_num = 100
      double health_point_percent = 100
   end_aux_data
   mover {{MOVER_NAME}}
   end_mover
   sensor {{SENSOR_NAME}} {{SENSOR_NAME}}
      internal_link {{PROCESSOR_NAME}}
      internal_link data_mgr
   end_sensor
   weapon {{WEAPON_NAME}} {{WEAPON_NAME}}
   end_weapon
   comm {{COMM_NAME}} {{COMM_NAME}}
      internal_link {{PROCESSOR_NAME}}
      internal_link data_mgr
   end_comm
   processor data_mgr WSF_TRACK_PROCESSOR
   end_processor
   processor {{PROCESSOR_NAME}} {{PROCESSOR_NAME}}
   end_processor
end_platform_type
