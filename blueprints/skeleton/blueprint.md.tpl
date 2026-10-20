# 蓝图：{{SCENARIO_NAME}}（{{TOPIC_CN}}）

> **本文件是工程的唯一事实源**（single source of truth）。
> 智能体对工程的**一切创建与修改，必须先改本文件，再据本文件改工程文件**；不得跳过本文件直接改工程。
> 原因：上下文可能被清理或压缩；工程结构一旦遗忘，遵循本文件即可完整恢复现场，避免发散。
>
> **命名一致性（铁律）**：工程文件夹名 = 入口文件名 `<想定名>.txt` = 校验 ZIP 名 = 本文件名 `<想定名>.md`，四者严格同名。
> **位置**：本文件位于**工程文件夹根目录**（与 `<想定名>.txt` 同级）。
> **行数统计**：交付时统计 AFSIM 脚本行数**不含本文件**。
> **生成顺序**：本文件在**全部工程文件之前**生成；生成后先做 §5 自检，通过再生成工程。

---

## 0. 元信息

| 项 | 内容 |
| :-- | :-- |
| 想定名 | `{{SCENARIO_NAME}}` |
| 中文主题 | {{TOPIC_CN}} |
| 输入来源 | 实验筹划（自然语言）{{＋想定编辑 JSON（有 / 无）}} |
| 仿真起止 | `{{START_DATE}} {{START_TIME}}` → `{{END_TIME}}` |
| 校验状态 | 未校验 / `valid=true` / `valid=false`（注明时间） |
| 蓝图版本 | v1（每次先改蓝图，改后版本 +1，记入 §6） |

---

## 1. 简介与任务想定

（一段话概述本工程是什么、仿真什么、达到什么目的。随后附**任务想定的自然语言描述**——从实验筹划摘录任务 / 仿真目的 / 过程 / 包含兵力，保留原文口径，不改写语义。）

**6 项结论摘要**（来自 `workflows/1_intake.md`）：

| # | 结论 | 内容 |
| :-: | :-- | :-- |
| 1 | 想定名 | `{{SCENARIO_NAME}}` |
| 2 | 阵营与兵力 | {{红 / 蓝方各有哪些平台、数量、初始位置}} |
| 3 | 任务与过程 | {{时间线 + 关键事件}} |
| 4 | 体系关系 | {{指挥链 / 通信组网；无则写「无」}} |
| 5 | 配置及来源 | {{关键配置逐项标注 JSON / 实验筹划 / 缺省值}} |
| 6 | 待确认清单 | {{未识别 JSON 字段 / 缺参数 / 待补数据表；无则写「无」}} |

---

## 2. 文件结构

（**目标**工程目录树。只列实际会生成的文件；用不到的目录不建；`output/blank_empty.txt` 必须存在。）

```
{{SCENARIO_NAME}}/
├── {{SCENARIO_NAME}}.md      ← 本蓝图文件（唯一事实源）
├── {{SCENARIO_NAME}}.txt      ← 入口（与文件夹严格同名）
├── setup.txt                  ← 平台装配
├── event_pipe.txt             ← aer 记录配置
├── global_env.txt             ← 全局环境
├── config/run.json            ← 运行控制
├── output/blank_empty.txt     ← 输出目录占位（必须）
├── platform/{{PLATFORM}}.txt  ← 平台类型
├── side/{{SIDE}}.txt          ← 阵营实例部署
└── …                          ← 其余按需（sensor/ weapon/ comm/ processor/ …）
```

| 文件 / 目录 | 块类型 | 是否建立 | 说明 |
| :-- | :-- | :-: | :-- |
| `{{SCENARIO_NAME}}.txt` | 入口 | ✔ | 必建；含 `file_path .` |
| `setup.txt` | 纯 `include_once` | ✔ | 必建；登记全部 `platform/*.txt` 与 `side/*.txt` |
| `event_pipe.txt` | `event_pipe` 块 | ✔ | 必建 |
| `global_env.txt` | `global_environment` 块 | ✔ | 必建（可空块） |
| `config/run.json` | — | ✔ | 必建 |
| `output/blank_empty.txt` | — | ✔ | 必建（ZIP 不保留空目录） |
| `{{PLATFORM}}/…` | 见 layout.md §3 映射表 | ○ | 按需 |

---

## 3. 工程详细说明

### 3.1 兵力编成与阵营

（每个平台一行：实例名 / 类型名 / 所属阵营 / 初始位置（`d:m:s` 格式）/ 高度 / 速度 / 任务角色。）

| 实例 | 类型 | 阵营 | 初始位置 | 高度 / 速度 | 角色 |
| :-- | :-- | :-: | :-- | :-- | :-- |
| {{INSTANCE_1}} | {{PLATFORM_1}} | blue | {{POS_1}} | {{ALT_1}} / {{SPD_1}} | {{ROLE_1}} |

### 3.2 装配链

（入口文件 `include_once` 顺序 + `setup.txt` 登记表。下层不得引用上层。）

| 顺序 | 入口 include | 内容 |
| :-: | :-- | :-- |
| 1 | `include_once event_pipe.txt` | aer 记录 |
| 2 | `include_once global_env.txt` | 全局环境 |
| 3 | `include_once setup.txt` | 全部 `platform/*.txt` + `side/*.txt` |
| … | | |

### 3.3 组件职责逐项说明

（每个 `platform_type` / `sensor` / `weapon` / `mover` / `comm` / `processor` 一句话职责 + 关键参数。）

| 组件 | 文件 | 职责 | 关键参数 |
| :-- | :-- | :-- | :-- |
| {{PLATFORM_1}} | `platform/{{PLATFORM_1}}.txt` | {{DUTY_1}} | `WSF_PLATFORM` + {{KEY_PARAMS_1}} |

### 3.4 运行时序与数据流

（关键时刻表：T+0/1/3/… 发生什么；平台间经什么消息 / 网络交换什么。**§5.3 仿真时长校核以此节为输入**。）

| 时刻 | 事件 | 涉及实体 | 数据流 |
| :-- | :-- | :-- | :-- |
| T+0 m | {{EVENT_1}} | {{ENTITIES_1}} | {{FLOW_1}} |

### 3.5 关键脚本逻辑

（有 `script` / `processor` 时写：状态机、任务时序、回调逻辑；无则写「无」。）

### 3.6 可复用要点与陷阱

（本工程值得复用的写法；生成时预判或实际踩到的坑。）

---

## 4. 完整脚本全文（工程生成的最终依据）

> **铁律**：本节每个文件块即对应工程文件的**唯一生成依据**；工程文件必须与本文件**逐字符一致**（`3_generate.md` 的 AI 自检核对项）。
> 每个文件标注**相对工程根**的路径；按**装配顺序**排列（先被 include 的在前）。
> 语法规则以 `knowledge/language/`、`knowledge/blocks/` 与 `blueprints/cases/` 案例为准，**不得凭空自造**。

### ===== FILE: {{SCENARIO_NAME}}.txt =====

```text
define_path_variable CASE {{SCENARIO_NAME}}
file_path .
include_once event_pipe.txt
event_output
   file output/$(CASE).evt
   {{EVENT_ENABLE}}
end_event_output
log_file output/$(CASE).log
include_once global_env.txt
include_once setup.txt
include_once side/{{SIDE}}.txt
end_time {{END_TIME}}
start_date {{START_DATE}}
start_time {{START_TIME}}
```

### ===== FILE: setup.txt =====

```text
include_once platform/{{PLATFORM}}.txt
```

### ===== FILE: event_pipe.txt =====

```text
event_pipe
   file output/$(CASE).aer
   enable AIRCOMBAT
   enable TRACK_UPDATE
   enable BEHAVIOR_TOOL
end_event_pipe
```

### ===== FILE: global_env.txt =====

```text
global_environment
end_global_environment
```

### ===== FILE: platform/{{PLATFORM}}.txt =====

```text
platform_type {{PLATFORM}} WSF_PLATFORM
   ...
end_platform_type
```

### ===== FILE: side/{{SIDE}}.txt =====

```text
platform {{INSTANCE_1}} {{PLATFORM}}
   side {{SIDE}}
   ...
end_platform
```

### ===== FILE: config/run.json =====

```json
{
  "baseConfig": {
    "scenariosTime": {
      "continueTime": {{CONTINUE_TIME}},
      "startDate": "{{START_DATE_ISO}}",
      "startTime": "{{START_TIME}}"
    }
  },
  "scenariosId": 0
}
```

（其余文件按 §2 文件结构逐一追加，格式同上。）

---

## 5. AI 自检结论

> 本节在蓝图生成后、工程生成前填写；**未通过不得进入工程生成**。

### 5.1 需求与结构一致性

| 检查项 | 结果 |
| :-- | :-: |
| 蓝图覆盖 intake 6 项结论（无缺项） | □ |
| 蓝图与用户输入一致（兵力 / 阵营 / 任务无编造） | □ |
| 布局符合 `blueprints/layout/layout.md`（必建 4 根文件、目录按需） | □ |
| 命名四者同名（文件夹 / 入口 / ZIP / 蓝图） | □ |
| §4 全文与 §2 文件结构一一对应（无多余、无遗漏） | □ |
| `SKILL.md` 13 条硬约束逐条对照 | □ |

### 5.2 语法预检

（逐文件过一遍可预判项：块闭合、数值带单位、坐标 `d:m:s`、`platform_type` 带 `WSF_PLATFORM`、`include` 目标存在……仅预判，**不替代第 4 步语法校验**。）

| 文件 | 预判结论 |
| :-- | :-- |
| {{FILE_1}} | □ 通过 / ✗ 问题：{{ISSUE_1}} |

### 5.3 仿真时长校核 ★（最重要）

> 历史实测最高发问题：仿真时长小于任务实际所需时长，导致任务没跑完仿真就结束。
> **本项不通过，必须修正 §3.4 / §4 的 `end_time` 与 `run.json` 的 `continueTime` 后再进入工程生成。**

| 项 | 值 |
| :-- | :-- |
| 任务时间线（摘自 §3.4） | {{TIMELINE_SUMMARY}} |
| 任务结束时间 `T_task` | {{T_TASK}}（分钟） |
| 缓冲 = max(T_task × 0.2, 2 m) | {{BUFFER}} |
| 应设 `end_time` ≥ T_task + 缓冲 | {{END_TIME}} ✓ |
| `run.json` 的 `continueTime`（分钟）同步 | {{CONTINUE_TIME}} ✓ |
| 入口 `start_date` / `start_time` 与 `run.json` 一致 | □ |

**结论**：`end_time = {{END_TIME}}`，覆盖任务全过程。

---

## 6. 变更记录

> 工程的一切修改走本表：**先改蓝图**（版本 +1、记录改动），**再改工程文件**。

| 版本 | 日期 | 改动内容 | 原因（用户反馈 / 校验报错） | 涉及文件 |
| :-: | :-- | :-- | :-- | :-- |
| v1 | {{DATE}} | 初版 | 用户输入 | 全部 |
