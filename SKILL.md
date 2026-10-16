---
name: afsim-forge
description: 按标准多目录工程结构，从自然语言生成 AFSIM 工程，并调用 MCP 语法校验接口闭环纠错。当用户提到 AFSIM 工程/想定生成、体系仿真建模、platform_type、sensor、weapon、processor、include_once、工程骨架、语法校验时使用。不运行仿真。
whenToUse: 需要生成、校验或修复 AFSIM 体系工程时
disable-model-invocation: false
user-invocable: true
metadata:
  version: v1.0.0
---

# afsim-forge — AFSIM 体系工程生成与校验

> **单入口 + 意图路由**：本 skill 在 DSH 中以 `/afsim-forge` 调用；进入后按下方「意图路由表」分派工作流。
> 详细知识一律外链，按需加载 —— 本文件只做入口与规则。

---

## 黄金法则

> **不要凭空自造 AFSIM 语法，要基于模板与已验证样例输出。**
>
> 工程**结构**只认 `refs/structure/`；**语法**查 `refs/knowledge/`；**范本**看 `refs/examples/`。
> 生成 → **必须调用语法校验** → 通过才归档。**未过校验的工程，不得交付。**
> **skill 目录只读**：所有运行时产出写工作空间的 `.afsim-forge/`。

---

## 意图路由表

| 意图 | 用户触发词（示例） | 走哪条工作流 |
| :-- | :-- | :-- |
| **生成新工程** | "生成 / 新建 / 做一个 … AFSIM 工程" | `workflows/generate.md` |
| **校验** | "校验 / 检查语法 / 语法对不对" | `workflows/validate.md` |
| **修复** | "报错了 / 帮我修一下 / 通不过" | `workflows/debug.md` |
| **归档** | "归档 / 确认 / 可以了" | `workflows/archive.md` |
| **帮助** | "怎么用 / 有哪些能力" | 本文件「能力概览」 |

**能力概览**：① 按标准工程结构生成 AFSIM 工程；② 调用 MCP 做语法校验并闭环修复；③ 提供 AFSIM 语法与体系仿真知识；④ 成果 staging → verified 闭环管理。
**不做**：跑仿真、回放、下载仿真结果（见下方「MCP 边界」）。

---

## 硬约束清单（生成前必读）

1. **扩展名一律 `.txt`**（不是 `.wsf`）。
2. **所有数值必须带单位**：`500 m/sec`、`10000 m`、`2 s`、`9500 mhz`。纯数字会被判错。
3. **每个块必须有 `end_*`**；`platform_type` 必须写基类型 `WSF_PLATFORM`。
4. **坐标用冒号分隔** `d:m:s`（`38:44:52.3n`），不是 `38.44.52.3n`。
5. **入口文件严格同名**：`<想定名>.txt`，且与 ZIP 同名。
6. **`output/` 目录必须存在**，用 `output/blank_empty.txt` 占位（否则 `log_file` 产生报错噪音）。
7. **组件文件头部先 `include_once` 自己的全部依赖**，再写块定义。
8. **新增平台必须登记进 `setup.txt`**。
9. **禁止中文路径**（AFSIM 中文路径缺陷）。
10. **禁止**编造 `common/` 数据表内容（见「缺省值」§3）。

---

## 缺省值（省略参数时取这些值）

> 生成时**先按缺省值补全，再向用户确认关键项**；不要因为缺参数而反复追问。

### 1. 工程级

| 参数 | 缺省值 | 说明 |
| :-- | :-- | :-- |
| 想定名 | `<主题拼音>_<日期>` | 无中文、无空格；由需求自动生成 |
| `end_time` | `10 m` | 入口文件；单位必带 |
| `start_date` / `start_time` | 当前日期 / `00:00:00` | 与 `config/run.json` 的 `scenariosTime` **保持一致** |
| `event_output` | `enable all` | 后期可收敛为逐项 `enable` |
| `event_pipe` | `AIRCOMBAT` / `TRACK_UPDATE` / `BEHAVIOR_TOOL` | 与样例一致 |
| 阵营 | 红方 `red` / 蓝方 `blue` | 对应 `side/red.txt`、`side/blue.txt` |
| `config/run.json` 输出开关 | `recordAer=1` / `recordEvent=0` / `recordLog=1` | |
| `config/run.json` 的 `scenariosId` | **留空（`0`）** | 由业务侧填充，**不自行编造** |

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
| `config/run.json` 的 `scenariosId` | 留空 `0`，由业务侧填充 |

---

## MCP 校验（唯一校验通道）

> 本 skill **只通过 MCP 工具工作**，不接触 AFSIM 本体（安装位置、可执行文件、命令行等均属服务端职责）。
> 工具名前缀由 DSH 的 `serverName` 决定，**单点维护在 `config.yaml`**（`mcp.prefix`）。

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

| 层级 | 文件 | 何时加载 |
| :-- | :-- | :-- |
| **L0**（常驻） | 本文件 | 默认 |
| **L1**（按需） | `refs/quick-ref.md` | 要最小可跑骨架时 |
| | `refs/structure/project-layout.md` | 要建工程结构时 |
| | `refs/structure/defaults.md` | 要查缺省值时 |
| | `refs/errors-ref.md` | 出现报错时 |
| **L2**（命中后） | `refs/knowledge/*.md` | 查具体语法 / API / 参数时 |
| | `refs/sos/*.md` | 查体系仿真知识时 |
| | `refs/examples/*.txt` | 找完整场景范本时 |
| **L3**（激活后） | `refs/lesson-index.md` → `refs/lesson-root-causes.md` | `errors-ref` 命中 `[Exxx]` 时 |

**工作流**：`workflows/generate.md` · `validate.md` · `debug.md` · `archive.md`

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
| `.afsim-forge/lessons/` | 本项目运行时新增的教训（skill 的 `refs/lesson-*.md` 是只读基线） |

**铁律**：**未通过 `validate_scenario`（`data.valid=true`）的工程，禁止归档到 `verified/`。**

---

## 配置

- MCP 工具契约、工程结构约定、**运行时状态目录（`.afsim-forge/`）**：见 `config.yaml`（**单点维护**）。
- 工具名前缀随 DSH 的 `serverName` 变化，只需改 `config.yaml` 一处。
