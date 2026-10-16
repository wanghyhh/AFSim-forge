# 速查：最小可跑骨架

> **用途**：L1 速查。需要"立刻搭一个能过校验的骨架"时加载本文件，**不必**先读 `refs/structure/*`。
> 本文件给出**可直接复制**的最小工程全文；结构细节仍以 `refs/structure/project-layout.md` 为权威。

---

## 0. 一句话记忆

```
入口 <想定名>.txt → include_once 各根文件 → include_once 各 side/*.txt → 各组件 .txt
目录 = 组件类型的家；块名 → 目录名；所有数值带单位；所有块有 end_*。
```

---

## 1. 目录（最小集）

```
<想定名>/
├── <想定名>.txt          ← 入口（严格同名）
├── setup.txt             ← 装配清单（required）
├── event_pipe.txt        ← 事件管道（required）
├── global_env.txt        ← 全局环境（required）
├── config/
│   └── run.json          ← 业务运行控制
├── platform/
│   └── <类型名>.txt
├── side/
│   └── red.txt           ← 平台实例
└── output/
    └── blank_empty.txt   ← 空文件占位（ZIP 不保留空目录）
```

**其余目录**（`common/ medium/ comm/ mover/ network/ processor/ sensor/ signatures/ weapon/ weapon_effects/`）按需创建；**不用到的可以不建**，但 `config/ output/ side/` 与根文件必须在。

---

## 2. 文件全文（替换 `{{...}}` 即可）

### 2.1 `<想定名>.txt`

```text
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
```

> **只 include 实际存在的文件**——不存在的一行都不要写。

### 2.2 `event_pipe.txt`

```text
event_pipe
   file output/$(CASE).aer
   enable AIRCOMBAT
   enable TRACK_UPDATE
   enable BEHAVIOR_TOOL
end_event_pipe
```

### 2.3 `global_env.txt`

```text
global_environment
end_global_environment
```

### 2.4 `setup.txt`

```text
include_once platform/{{PLATFORM_TYPE}}.txt
```

> 每新增一个组件文件，就在这里补一行 `include_once`。

### 2.5 `platform/{{PLATFORM_TYPE}}.txt`

```text
platform_type {{PLATFORM_TYPE}} WSF_PLATFORM
   side red
   icon target
   indestructible destructible
   on_broken remove
   aux_data
      int health_point_num = 100
      double health_point_percent = 100
   end_aux_data
end_platform_type
```

### 2.6 `side/red.txt`

```text
platform {{PLATFORM_TYPE}}_1 {{PLATFORM_TYPE}}
   side red
   position 39.6333n 116.333e
   aux_data
      int code = 1
      string model_code = "0"
   end_aux_data
end_platform
```

### 2.7 `config/run.json`

```json
{
  "baseConfig": {
    "highPrecisionCounter": 0,
    "multithreading": 0,
    "pausetoadvancetime": 1,
    "propulsionMethod": 2,
    "recordAer": 1,
    "recordEvent": 0,
    "recordLog": 1,
    "scenariosTime": {
      "continueTime": 10,
      "startDate": "{{START_DATE_ISO}}",
      "startTime": "{{START_TIME}}"
    },
    "startMode": 2,
    "stepValue": 0.1,
    "terminalLog": 1,
    "timeRate": 1.0,
    "timeType": 1
  },
  "scenariosId": 0
}
```

### 2.8 `output/blank_empty.txt`

空文件（0 字节）。

---

## 3. 占位符缺省值

| 占位符 | 缺省 |
| :-- | :-- |
| `{{SCENARIO_NAME}}` | `<主题拼音>_<日期>`，无中文、无空格 |
| `{{PLATFORM_TYPE}}` | 依需求命名，全大写字母 + 下划线 |
| `{{START_DATE}}` | 当前日期 `mon dd yyyy`（如 `oct 16 2026`） |
| `{{START_DATE_ISO}}` | 当前日期 `YYYY-MM-DD`，须与 `run.json` 一致 |
| `{{START_TIME}}` | `00:00:00` |

---

## 4. 打完包立刻校验

```powershell
Compress-Archive -Path "<工程目录>\*" -DestinationPath "<绝对路径>\<想定名>.zip" -Force
```

```
mcp__afsim__validate_scenario({ "zip_path": "<ZIP 绝对路径>", "full_output": false })
```

**判据只看 `data.valid`**（`true` 通过 / `false` 失败）。详见 `workflows/validate.md`。

---

## 5. 六条最易踩的坑

| # | 坑 | 正解 |
| :-: | :-- | :-- |
| 1 | 数值不写单位 | `1000 m`、`500 m/sec`、`2 s` |
| 2 | 忘写 `end_*` | 每个块都有配对结束标记 |
| 3 | `platform_type` 缺基类型 | 写 `WSF_PLATFORM` |
| 4 | 坐标用点号 | 用冒号：`38:44:52.3n` |
| 5 | `output/` 缺失 | 建目录 + `blank_empty.txt` |
| 6 | ZIP 名与入口文件不同名 | 两者都叫 `<想定名>` |

> 完整报错索引见 `refs/errors-ref.md`。
