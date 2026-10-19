---
name: afsim-forge
description: 按标准多目录工程结构，从「实验筹划（自然语言）+ 想定编辑（scenarioJsonData JSON）」两类输入生成 AFSIM 工程，并调用 MCP 语法校验接口闭环纠错。当用户提供实验筹划/想定编辑、或提到 AFSIM 工程/想定生成、体系仿真建模、platform_type、sensor、weapon、processor、include_once、工程骨架、语法校验时使用。不运行仿真。
whenToUse: 需要生成、校验或修复 AFSIM 体系工程时
disable-model-invocation: false
user-invocable: true
metadata:
  version: v1.0.0
---

# afsim-forge — AFSIM 体系工程生成与校验

> **单入口 + 意图路由**：本 skill 在支持 skill 的宿主环境中以 `/afsim-forge` 调用；进入后按下方「意图路由表」分派工作流。
> **输入 = 实验筹划（自然语言，必需）+ 想定编辑（`scenarioJsonData` JSON，可选、格式不定）**，生成前必走 `workflows/intake.md`。
> 详细知识一律外链，按需加载 —— 本文件只做入口与规则。

---

## 目录结构（4 层）

```
afsim-forge/
├── SKILL.md · config.yaml · README.md   ← ① 入口层：本文件是唯一入口，知识一律外链
├── workflows/                            ← ② 流程层：intake / generate / validate / debug / archive / local-exec
├── blueprints/                           ← ③ 骨架层：要"照抄/填空"的东西
│   ├── layout/       结构与装配规则（权威）
│   ├── skeleton/     9 根文件 + run.json 的可填骨架（含 minimal/ 最小可跑工程）
│   ├── fragments/    11 类组件片段（.tpl）
│   └── cases/        5 个完整工程案例（一案例一文档：说明 + 逐文件全文）
└── knowledge/                            ← ④ 知识层：要"读懂/查阅"的东西
    ├── language/         AFSIM 语言与脚本（语法、API、消息、类型）
    ├── blocks/           块级参数参考（命令、mover、sensor、常见坑）
    ├── system-of-systems/ 体系仿真方法论（指挥链、杀伤链、传感器网、指标）
    └── lessons/          教训库（报错现象 → 归类 → 根因与修法）
```

> **一句话分工**：`blueprints/` 回答"**该长什么样**"（可复制），`knowledge/` 回答"**为什么这样写**"（可查阅）。

---

## 黄金法则

> **不要凭空自造 AFSIM 语法，要基于骨架与已验证案例输出。**
>
> **结构**只认 `blueprints/layout/layout.md`；**骨架/片段**取 `blueprints/skeleton/`、`blueprints/fragments/`；
> **完整案例**看 `blueprints/cases/`（结构 + 逐文件全文，最可靠的正例）；**语法**查 `knowledge/language/`、`knowledge/blocks/`。
> 生成 → **必须调用语法校验** → 通过才归档。**未过校验的工程，不得交付。**
> **skill 目录只读**：所有运行时产出写工作空间的 `.afsim-forge/`。

---

## 意图路由表

| 意图 | 用户触发词（示例） | 走哪条工作流 |
| :-- | :-- | :-- |
| **解析输入** | 给了"实验筹划 / 想定编辑 / scenarioJsonData" | `workflows/intake.md`（**生成前必走**） |
| **生成新工程** | "生成 / 新建 / 做一个 … AFSIM 工程" | `workflows/intake.md` → `workflows/generate.md` |
| **校验** | "校验 / 检查语法 / 语法对不对" | `workflows/validate.md` |
| **修复** | "报错了 / 帮我修一下 / 通不过" | `workflows/debug.md` |
| **归档** | "归档 / 确认 / 可以了" | `workflows/archive.md` |
| **帮助** | "怎么用 / 有哪些能力" | 本文件「能力概览」 |

**能力概览**：① 解析两类输入（实验筹划 + 想定编辑 JSON）；② 按标准工程结构生成 AFSIM 工程；③ 调用 MCP 或本地 `mission.exe` 做语法校验并闭环修复；④ 提供 AFSIM 语法与体系仿真知识；⑤ 成果 staging → verified 闭环管理。
**不做**：跑仿真、回放、下载仿真结果（见下方「MCP 边界」）。

---

## 输入（两类，生成前必须先解析）

> **详细规则见 `workflows/intake.md`**；这里只放必须记住的结论。

| 输入 | 形式 | 必需 | 作用 |
| :-- | :-- | :-: | :-- |
| **实验筹划** | **自然语言文本** | ✔ | 整个想定的详细内容：**任务、仿真目的、过程、包含兵力**等 |
| **想定编辑** | **JSON 文本**（`scenarioJsonData`） | ○ | 一些**必要的配置**；**格式不定** |

**三条必须记住的规则**：

1. **JSON 有就读、没有就生成** —— 提供了必须读取并按语义落地（**不许忽略、不许只取一半、不许丢字段**）；没提供就按实验筹划 + 缺省值生成，**不得因此停下追问**。
2. **优先级**：`JSON 显式给出 > 实验筹划明确描述 > 缺省值`。配置项冲突以 JSON 为准并标注；**想定内容（兵力/阵营/任务）冲突必须问用户**。
3. **实验筹划要拆成工程要素**（想定名 / 阵营与兵力 / 任务与过程 / 指挥与通信 / 传感器与武器 / 指标口径），拆不出就按缺省补，**不编造兵力与性能参数**。

> 解析产出一份**6 项结论**（想定名 / 阵营与兵力 / 任务与过程 / 体系关系 / 配置及来源 / 待确认清单），它就是交付说明的骨架。

---

## 硬约束清单（生成前必读）

1. **扩展名一律 `.txt`**（不是 `.wsf`）。
2. **所有数值必须带单位**：`500 m/sec`、`10000 m`、`2 s`、`9500 mhz`。纯数字会被判错。
3. **每个块必须有 `end_*`**；`platform_type` 必须写基类型 `WSF_PLATFORM`。
4. **坐标用冒号分隔** `d:m:s`（`38:44:52.3n`），不是 `38.44.52.3n`。
5. **入口文件严格同名**：`<想定名>.txt`，且与 ZIP 同名。
6. **入口文件必须写 `file_path .`**，且在**第一个 `include_once` 之前**（AFSIM 按它搜索 include 目标）。
7. **`include_once` 路径一律相对工程根**（`include_once sensor/X.txt`），不是相对当前文件。
8. **`output/` 目录必须存在**，用 `output/blank_empty.txt` 占位（否则 `log_file` 产生报错噪音）。
9. **组件文件头部先 `include_once` 自己的全部依赖**，再写块定义。
10. **顶层装配用 `include_once`；块体内联裸片段用 `include`**（用错会让第二处静默跳过）。
11. **新增平台必须登记进 `setup.txt`**。
12. **禁止中文路径**（AFSIM 中文路径缺陷）。
13. **禁止**编造 `common/` 数据表内容（见「缺省值」§3）。

---

## 缺省值（省略参数时取这些值）

> 生成时**先按缺省值补全，再向用户确认关键项**；不要因为缺参数而反复追问。

### 1. 工程级

| 参数 | 缺省值 | 说明 |
| :-- | :-- | :-- |
| 想定名 | `<主题拼音>_<日期>` | 无中文、无空格；由需求自动生成 |
| `file_path` | `.` | 入口文件，**必须在第一个 `include_once` 之前** |
| `end_time` | `10 m` | 入口文件；单位必带 |
| `start_date` / `start_time` | 当前日期 / `00:00:00` | 与 `config/run.json` 的 `scenariosTime` **保持一致** |
| `event_output` | `enable all` | 后期可收敛为逐项 `enable` |
| `event_pipe` | `AIRCOMBAT` / `TRACK_UPDATE` / `BEHAVIOR_TOOL` | 与样例一致 |
| 阵营 | 红方 `red` / 蓝方 `blue` | 对应 `side/red.txt`、`side/blue.txt` |
| `config/run.json` 输出开关 | `recordAer=1` / `recordEvent=0` / `recordLog=1` | |
| `config/run.json` 的 `scenariosId` | **留空（`0`）** | **想定编辑 JSON 给了就照抄**；没给才留空，**不自行编造** |

### 2. 组件级

| 参数 | 缺省值 |
| :-- | :-- |
| 平台 `aux_data` 生存字段 | `int health_point_num = 100` / `double health_point_percent = 100` |
| 通信 `comm` | `WSF_COMM_TRANSCEIVER`，`transfer_rate 100 mbits/sec` |
| 雷达签名 | `constant 1 m^2` |
| 红外签名 | `constant 50000 w/sr` |
| 光学签名 | `constant 20 m2` |
| 平台 `indestructible` | `indestructible destructible` |
| 平台 `on_broken` | `remove` |

### 3. 不由本 skill 生成的内容（须人类提供）

| 内容 | 处理 |
| :-- | :-- |
| `common/` 数据表（弹道表等） | **只建目录、不造数据**；若工程引用，须在交付说明中**列出待补清单**（文件名 + 用途 + 被谁引用） |
| `config/run.json` 的 `scenariosId` | JSON 给了照抄；没给留空 `0`，由业务侧填充 |

---

## MCP 校验（首选通道）

> 本 skill **默认通过 MCP 工具完成校验**。当 MCP 不可用时，AI 应主动询问用户本地 AFSIM 安装路径，通过直接调用 `mission.exe` 完成校验 —— **不固化任何安装路径到 skill 文档中**，每次临时询问。
> 工具名前缀由宿主环境的 `serverName` 决定，**单点维护在 `config.yaml`**（`mcp.prefix`）。
> 本地调用方案的完整命令、判据与错误解析见 `workflows/local-exec.md`。

| 允许 | 用途 |
| :-- | :-- |
| `validate_scenario` | **核心**：语法校验（无状态，不跑仿真），参数 `zip_path`、`full_output` |
| `health` | 可选：确认校验服务在线 |
| `selftest` | 可选：MCP 链路自检 |

**禁止**（服务端其他能力，本 skill 一概不用）：`upload_zip`、`submit_simulation`、`get_simulation`、`list_results`、`download_result`、`replay`。

**判据铁律**：**只看 `data.valid`**。语法对错**都返回 HTTP 200**，禁止用状态码或 `ok` 判断。

> 完整调用规范见 `workflows/validate.md`；工具契约详见 `config.yaml`。

---

## 渐进披露（按需加载）

> **原则**：本文件（L0）**只放规则与索引，不放知识**。往下每一层都是"命中才读"，避免上下文被大文件占满。

| 层级 | 文件 | 何时加载 |
| :-- | :-- | :-- |
| **L0**（常驻） | `SKILL.md`（本文件） | 默认；含输入契约、硬约束、缺省值、判据铁律 |
| **L1**（生成前必读） | `workflows/intake.md` | 拿到实验筹划 / 想定编辑 JSON，要解析成工程要素时 |
| **L1**（起步必读） | `blueprints/README.md` | 想知道"该去哪个目录找东西"时 |
| | `blueprints/layout/layout.md` | 要建工程结构（哪个文件放哪、必建哪些）时 |
| | `blueprints/skeleton/README.md` → `skeleton/minimal/` | 要**立刻**搭一个能过校验的最小骨架时 |
| **L2**（命中后） | `blueprints/layout/defaults.md` · `assembly.md` | 查缺省值 / 装配顺序与 include 规则时 |
| | `blueprints/fragments/README.md` | 要按组件类型取填空片段时 |
| | `blueprints/cases/README.md` → `<案例>.md` | 找**同类完整工程**照结构时（5 个案例，含全文） |
| | `knowledge/README.md` | 要查语法 / 参数 / 体系知识时的总索引 |
| | `knowledge/language/*.md` | 脚本语法、API、消息、类型 |
| | `knowledge/blocks/*.md` | 命令、mover、sensor 参数、常见坑 |
| | `knowledge/system-of-systems/*.md` | 体系设计（指挥链、杀伤链、传感器网、指标） |
| **L3**（报错后） | `knowledge/lessons/errors.md` | 拿到校验报错，按关键字找 `[Exxx]` |
| | `knowledge/lessons/index.md` → `root-causes.md` | `[Exxx]` 命中后查归类与根因修法 |

**工作流**（流程性内容全在这，不重复写进本文件）：`workflows/intake.md` · `generate.md` · `validate.md` · `debug.md` · `archive.md` · `local-exec.md`

**加载顺序建议**：`L0 → workflows/intake.md（生成类意图必走）→ workflows/<意图>.md → L1 → L2 → L3`。**同一轮不要把所有 L2 文件都读进来**，按需逐个加载。

---

## 成果闭环与写入边界

> **写入边界（铁律）**：skill 目录是**只读资产** —— 运行期**一律不写**。
> 一切运行时产出（工程、ZIP、教训）写入**当前工作空间**的状态目录 `.afsim-forge/`（见 `config.yaml` 的 `runtime`）。

```
需求 → 生成（staging）→ MCP 校验 → [未通过] → 修复 → 再校验
                                ↓ [data.valid = true]
                          用户认可 → 归档（verified）
```

| 位置（均在工作空间下） | 含义 |
| :-- | :-- |
| `.afsim-forge/output/staging/` | 临时成果：已生成、待校验 |
| `.afsim-forge/output/verified/` | 成熟成果：**已过校验 + 用户认可**，只进不出 |
| `.afsim-forge/lessons/` | 本项目运行时新增的教训（skill 的 `knowledge/lessons/*.md` 是只读基线） |

**铁律**：**未通过 `validate_scenario`（`data.valid=true`）的工程，禁止归档到 `verified/`。**

---

## 配置

- MCP 工具契约、工程结构约定、**运行时状态目录（`.afsim-forge/`）**：见 `config.yaml`（**单点维护**）。
- 工具名前缀随宿主环境的 `serverName` 变化，只需改 `config.yaml` 一处。
