include_once mover/{{MOVER_NAME}}.txt
include_once weapon_effects/{{EFFECTS_NAME}}.txt
include_once signatures/{{RADAR_SIG_NAME}}.txt
include_once processor/{{GUIDANCE_PROCESSOR}}.txt

platform_type {{WEAPON_TYPE}} WSF_PLATFORM
   side {{SIDE}}
   icon Scud_Missile
   indestructible destructible
   on_broken remove
   aux_data
      int health_point_num = 100
      double health_point_percent = 100
   end_aux_data
   mover {{MOVER_NAME}}
   end_mover
   processor data_mgr WSF_TRACK_PROCESSOR
   end_processor
   processor {{GUIDANCE_PROCESSOR}} {{GUIDANCE_PROCESSOR}}
   end_processor
end_platform_type

weapon {{WEAPON_TYPE}} WSF_EXPLICIT_WEAPON
   on
   quantity {{QUANTITY}}
   maximum_quantity {{MAX_QUANTITY}}
   automatic_target_cueing true
   cue_to_predicted_intercept true
   unknown_target_range {{UNKNOWN_RANGE}} km
   launched_platform_type {{WEAPON_TYPE}}
   launch_computer WSF_BALLISTIC_MISSILE_LAUNCH_COMPUTER
      surface_to_surface_table common/{{DATA_TABLE_FILE}}
   end_launch_computer
   weapon_effects {{EFFECTS_NAME}}
end_weapon
