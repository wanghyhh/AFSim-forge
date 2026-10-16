processor {{PROCESSOR_NAME}} WSF_SCRIPT_PROCESSOR
   update_interval {{UPDATE_INTERVAL}} s

   script_variables
      {{VAR_DECL}}
   end_script_variables

   on_initialize
      {{INIT_BODY}}
   end_on_initialize

   on_update
      {{UPDATE_BODY}}
   end_on_update
end_processor
