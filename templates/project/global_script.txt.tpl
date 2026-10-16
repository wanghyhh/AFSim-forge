# 全局脚本：脚本变量 + 函数定义
# 注意：结构体定义归 global_struct.txt（入口中先 include 它，本文件可引用其类型）
script_variables
   {{GLOBAL_VARS}}
end_script_variables

script {{RET_TYPE}} {{FUNC_NAME}}({{PARAMS}})
   {{BODY}}
end_script
