# 全局结构体定义（入口中先于 global_script.txt 被 include）
script_struct {{STRUCT_NAME}}
  script_variables
    {{FIELD_TYPE}} {{FIELD_NAME}} = {{FIELD_DEFAULT}};
  end_script_variables

  # 可选：成员函数（如 Construct / clear），不需要则整段删掉
  script void Construct({{CTOR_PARAMS}})
     {{CTOR_BODY}}
  end_script
end_script_struct
