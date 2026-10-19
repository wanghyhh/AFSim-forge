# 工作流：输入解析（intake）

> **本 skill 的输入是两类文本**，生成工程前必须先解析。
> 本文件回答"给进来的东西怎么读、读出来落到哪"；生成动作见 `workflows/generate.md`。

---

## 1. 两类输入

| 输入 | 形式 | 必需 | 作用 |
| :-- | :-- | :-: | :-- |
| **实验筹划** | **自然语言文本** | ✔ | 描述整个想定的详细内容：**任务、仿真目的、过程、包含兵力**等 |
| **想定编辑** | **JSON 文本**（`scenarioJsonData`） | ○ | 一些**必要的配置**；**格式不定** |

**两条基本规则**：

1. **实验筹划必有**，它是想定内容的唯一来源；缺了它无法开工，直接向用户要。
2. **想定编辑 JSON 有就读、没有就生成**：
   - **提供了** → 读取并按 §3 落地，**不要忽略、不要只取一半**；
   - **没提供** → 完全按实验筹划生成，配置项用缺省值补全（`blueprints/layout/defaults.md`），**不得因此停下或反复追问**。

---

## 2. 优先级（冲突裁决）

```
想定编辑 JSON 显式给出  >  实验筹划的明确描述  >  缺省值
```

| 冲突类型 | 怎么裁 |
| :-- | :-- |
| **配置项**（时间、时长、记录开关、工程 ID、步长…） | **以 JSON 为准**；在交付说明中标注"实验筹划原值 X，被 JSON 覆盖为 Y" |
| **想定内容**（兵力、阵营、任务、部署位置） | **停下来问用户** —— 这类冲突通常说明两份输入不同源，猜错代价大 |
| 实验筹划说了、JSON 没说 | 用实验筹划的值 |
| 两份都没说 | 用缺省值，并在交付说明中标注"缺省补全" |

> **不要做的三件事**：① 不要把 JSON 的值"优化"成你以为更合理的值；② 不要因为 JSON 格式陌生就跳过它；③ 不要用 JSON 覆盖实验筹划里的兵力/任务描述。

---

## 3. 想定编辑 JSON 怎么读（格式不定）

**按语义识别，不按固定 schema 解析。** 字段名可能是驼峰、下划线、中文，也可能是嵌套的；看**值的含义**决定落点。

| JSON 里出现什么 | 落到哪 |
| :-- | :-- |
| `scenariosId` 或类似的工程 / 想定 ID | `config/run.json` 的 `scenariosId` —— **原值照抄**（此时**不**置 `0`） |
| 时间 / 时长（`startDate`、`startTime`、`continueTime`、`endTime`、`duration`…） | `config/run.json` 的 `scenariosTime` **＋** 入口的 `start_date` / `start_time` / `end_time`（**两处必须一致**；格式不同：JSON 用 `YYYY-MM-DD`，入口用 `mon dd yyyy`） |
| 记录开关（`recordAer` / `recordEvent` / `recordLog` / `terminalLog`…） | `config/run.json` 对应字段 |
| 步长 / 时间倍率 / 线程 / 启动模式（`stepValue` / `timeRate` / `multithreading` / `startMode`…） | `config/run.json` 对应字段 |
| 阵营 / 兵力 / 平台数量 | 与实验筹划**交叉校验**：一致 → 落 `side/*.txt`；不一致 → **问用户** |
| **认不出的字段** | **原样保留**到 `config/run.json`（不改名、不删、不合并嵌套），并在交付说明中列出**「未识别字段清单」**请用户确认 |

**三条铁律**：

1. **不丢字段** —— JSON 里有的键，最终工程里必须还在：要么落到已知位置，要么**原样并入** `config/run.json`。
2. **不改语义** —— 字段名、嵌套层级、数组顺序保持原样，不做"规范化重命名"。
3. **不猜单位** —— JSON 数值没写单位时，按该字段在 `config/run.json` 的既有口径理解（如 `continueTime` 是**分钟**）；实在判断不了就标"待确认"，**不自行换算**。

> 字段含义与缺省见 `blueprints/layout/run-json.md`。

---

## 4. 实验筹划怎么拆（自然语言 → 工程要素）

实验筹划是自然语言，需逐项落到工程要素上。**按这张表走，不要凭印象发挥**：

| 实验筹划里说的 | 工程要素 | 落到哪 | 参考 |
| :-- | :-- | :-- | :-- |
| 仿真目的 / 想定主题 | 想定名 | `<想定名>.txt`、ZIP 名、`define_path_variable CASE` | `blueprints/layout/layout.md` §2 |
| 任务（侦察 / 预警 / 拦截 / 打击 / 评估…） | 任务类型 + 任务流程 | `global_script.txt`（任务类型函数）、`processor/*` | `knowledge/system-of-systems/task-taxonomy.md` |
| **包含兵力**（型号、数量、归属阵营） | `platform_type` + `platform` 实例 | `platform/*.txt` + `side/*.txt` + **登记进 `setup.txt`** | `blueprints/fragments/platform/`、`fragments/side/` |
| 部署位置 / 航路 | `position` / `route` | `side/*.txt`、`global_route.txt` | `fragments/side/platform_instance.txt.tpl` |
| 指挥关系（谁指挥谁） | `command_chain` / `commander` | `side/*.txt` | `knowledge/system-of-systems/command-chain.md` |
| 通信 / 组网 | `comm` + `network` + `medium` | `comm/`、`network/`、`medium/` | `knowledge/system-of-systems/sensor-network.md` |
| 探测与交战过程 | `sensor` + `weapon` + 处理器链 | `sensor/`、`weapon/`、`processor/` | `knowledge/system-of-systems/kill-chain.md` |
| 仿真过程 / 阶段划分 | `end_time` + `event_pipe` 的 `enable` 项 | 入口、`event_pipe.txt` | `blueprints/layout/run-json.md` |
| 关注的效能指标 | `event_output` 的 `enable` 项（**设计期预留口径**） | 入口（内联 `event_output`） | `knowledge/system-of-systems/kpi-metrics.md` |

**拆不出来就按缺省值补**；**绝不为了"看起来完整"而编造兵力、型号或性能参数**（见 `blueprints/layout/defaults.md` §3）。

---

## 5. 解析产物：6 项结论

进 `workflows/generate.md` 之前，先把这 6 项定下来（可直接用作交付说明的骨架）：

| # | 结论 | 要点 |
| :-: | :-- | :-- |
| 1 | **想定名** | 无中文、无空格；= 入口文件名 = ZIP 名 |
| 2 | **阵营与兵力** | 每方的平台型号 / 数量 / 位置来源 |
| 3 | **任务与过程** | 时间线（起止）+ 关键事件 |
| 4 | **体系关系** | 指挥链、通信组网、信息流 |
| 5 | **配置** | 逐项标明来源：`JSON` / `实验筹划` / `缺省` |
| 6 | **待确认清单** | 未识别字段、缺参数、需人类提供的数据表 |

> **来源必须可追溯** —— 交付说明里每个关键参数都要能说清是"JSON 给的"、"实验筹划说的"还是"缺省补的"。这是用户复核的依据。

---

## 6. 什么时候必须问用户

**只有这 4 种情况**才停下来问，其余一律按优先级补全：

1. **完全没有实验筹划**，或其中**没有兵力清单**且无法从上下文推断；
2. **阵营无法判断**（红/蓝/第三方归属不明）；
3. JSON 与实验筹划在**想定内容**（兵力 / 阵营 / 任务）上**冲突**；
4. 时间或时长在两份输入里**互相矛盾**，且 JSON 无法裁决。

> 追问要**一次问完**（列成清单），不要挤牙膏式反复确认。
