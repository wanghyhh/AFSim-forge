processor {{PROCESSOR_NAME}} WSF_TRACK_PROCESSOR
   report_to
   commander
   via {{COMM_NAME}}
   to {{NETWORK_NAME}}
   purge_interval {{PURGE_INTERVAL}} s

   script_variables
      extern Map<string, Array<string>> InformationInputFlow;
      extern Map<string, Array<string>> InformationOutputFlow;
   end_script_variables
end_processor
