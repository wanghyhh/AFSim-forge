define_path_variable CASE {{SCENARIO_NAME}}
include_once event_pipe.txt
event_output
   file output/$(CASE).evt
   {{EVENT_ENABLE}}
end_event_output
log_file output/$(CASE).log
include_once zone.txt
include_once global_env.txt
include_once global_struct.txt
include_once global_script.txt
include_once global_route.txt
include_once group.txt
include_once setup.txt
include_once network/network.txt
include_once medium/medium.txt
include_once side/red.txt
include_once side/blue.txt
end_time {{END_TIME}}
start_date {{START_DATE}}
start_time {{START_TIME}}
