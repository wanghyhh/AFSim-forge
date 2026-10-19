processor {{PROCESSOR_NAME}} WSF_TASK_PROCESSOR
   evaluate_candidate_tracks {{EVALUATE_TRACKS}}
   auto_weapon_uplink {{AUTO_UPLINK}}

   script_variables
      extern Map<string, Array<string>> InformationInputFlow;
      extern Map<string, Array<string>> InformationOutputFlow;
   end_script_variables
end_processor
