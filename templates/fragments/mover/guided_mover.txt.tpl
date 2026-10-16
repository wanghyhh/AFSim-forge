aero {{MOVER_NAME}}_AERO WSF_AERO
   reference_area {{REF_AREA}} m2
   cd_zero_subsonic 0.1
   mach_begin_cd_rise 0.95
   cd_zero_supersonic 0.25
   mach_end_cd_rise 1.3
   mach_max_supersonic 10
end_aero

mover {{MOVER_NAME}} WSF_GUIDED_MOVER
   on
   damage_factor 0
   update_interval {{UPDATE_INTERVAL}} s
   stage 1
      aero {{MOVER_NAME}}_AERO
      fuel_mass {{FUEL_MASS_1}} kg
      total_mass {{TOTAL_MASS_1}} kg
      thrust {{THRUST_1}} nt
      thrust_duration {{DURATION_1}} s
   end_stage
   stage 2
      aero {{MOVER_NAME}}_AERO
      total_mass {{TOTAL_MASS_2}} kg
   end_stage
end_mover
