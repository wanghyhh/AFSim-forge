processor {{PROCESSOR_NAME}} WSF_TRACK_PROCESSOR
   report_to
   commander
   via {{COMM_NAME}}
   to {{NETWORK_NAME}}
   purge_interval {{PURGE_INTERVAL}} s

   # 体系工程统一约定：信息流变量（工程不用信息流机制则整段删掉）
   script_variables
      extern Map<string, Array<string>> InformationInputFlow;
      extern Map<string, Array<string>> InformationOutputFlow;
   end_script_variables
end_processor
