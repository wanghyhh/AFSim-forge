# 模板层（templates）

> **定位**：本目录是**可复用的填空骨架**，**不是**样例工程的副本。
> 结构上与《样例工程规范》**逐项对齐**；内容上是**参数化骨架**（占位符 `{{...}}`），由生成时按需求填充。

---

## 1. 两个子目录

| 子目录 | 作用 | 产物落点 |
| :-- | :-- | :-- |
| `project/` | **工程骨架**：9 个根文件 + `config/run.json` + `dirs.txt`；含 `minimal/` 最小可跑工程 | 工程根 |
| `fragments/` | **组件片段**：按目标目录分类（11 类），每个片段自带 `include_once` 依赖头 | 各子目录 |

---

## 2. 与样例工程的关系：**骨架 vs 实例**

`docs/体系工程文件说明-20260922/` 是**一个具体想定的完整实例**（IAMD 反导：GBI 拦截三叉戟）；
`templates/` 是**从该实例抽象出的可复用骨架**。

### 2.1 结构：逐项对齐

| 维度 | 样例工程 | templates |
| :-- | :-- | :-- |
| 根文件 | 9 个（`<想定名>.txt` / setup / event_pipe / global_env / global_route / global_script / global_struct / group / zone） | `project/*.tpl` 一一对应 |
| 目录 | 14 个 | `project/dirs.txt` 全列 |
| 入口装配链 | `define_path_variable CASE` → include 链 → `end_time` / `start_date` / `start_time` | `project/entry.txt.tpl` **逐行同构**（仅占位符不同） |
| 组件块 | `platform_type X WSF_PLATFORM` + 依赖 include 头 | `fragments/platform/*.tpl` 同构 |
| 装配登记 | `setup.txt` 列全部 `platform/*.txt` | `project/setup.txt.tpl`（占位符） |
| `output/` 占位 | `output/blank_empty.txt` | `project/minimal/output/blank_empty.txt` |

**可验证**：`project/entry.txt.tpl` 与样例入口 `bhkTest_FDCJ_To10s.txt` 对比，除占位符外**逐行一致**（include 顺序都相同）。

### 2.2 内容：有意不同

| 差异 | 样例工程 | templates | 为什么 |
| :-- | :-- | :-- | :-- |
| 命名 | 具体业务名 `GBI_LAUNCHER`、`TTR_RADAR` | 占位符 `{{PLATFORM_TYPE}}`、`{{SENSOR_NAME}}` | 模板要能生成**任意**想定 |
| 数值 | 具体值 `9500 mhz`、`power 1000 kw` | 占位符 `{{FREQUENCY}}`、`{{POWER}}` | 同上；无依据时**不编造**，标注"待确认" |
| 自动 ID | 雪花 ID `TTR_RADAR_ANTENNA_2101585057718595585` | 语义化 `{{SENSOR_NAME}}_ANTENNA_SEARCH` | 样例 ID 由工具生成，无复用价值 |
| 天线数量 | 一个 sensor 挂 4 个 `antenna_pattern`（ACQUIRE / TRACK 各用不同） | 1 个 | 属该想定的**具体设计**，非通用结构 |
| 业务脚本 | `script_variables Map<int,SimTask> preTaskMap…`（任务管理逻辑） | **不含** | 属用户**内部业务**，不该硬编码进通用模板 |
| `common/` 数据表 | `trident_ii_launch_data_low_*.txt`（约 39 万行弹道表） | **不含**（只建目录） | 业务数据**由人类提供**，skill 不造 |
| 缩进 | 样例部分文件无缩进 / 不统一 | 统一缩进 | 模板求可读 |

> **一句话**：样例回答"**这个想定长什么样**"；模板回答"**这类文件该放什么块、结构是什么样**"。

---

## 3. 使用

- 工程骨架：见 `project/README.md`
- 组件片段：见 `fragments/README.md`

**建议顺序**：先跑通 `project/minimal/`（可一次校验通过）→ 再按需逐步扩展。
