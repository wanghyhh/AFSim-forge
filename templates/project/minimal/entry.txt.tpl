define_path_variable CASE {{SCENARIO_NAME}}
include_once event_pipe.txt
event_output
   file output/$(CASE).evt
   enable all
end_event_output
log_file output/$(CASE).log
include_once global_env.txt
include_once setup.txt
include_once side/red.txt
end_time 10 m
start_date {{START_DATE}}
start_time {{START_TIME}}
