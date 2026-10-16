script_variables
   {{GLOBAL_VAR_DECL}}
end_script_variables

script_struct {{STRUCT_NAME}}
   script_variables
      {{STRUCT_FIELD_DECL}}
   end_script_variables
end_script_struct

script {{RET_TYPE}} {{FUNC_NAME}}({{PARAMS}})
   {{BODY}}
end_script
