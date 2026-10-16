# Changelog

本文件记录 afsim-forge 的版本变更。格式遵循 [Keep a Changelog](https://keepachangelog.com/zh-CN/1.1.0/)，版本号遵循语义化版本。

## [v1.0.0] - 2026-10-16

首个版本。按《afsim-forge 实施方案》M0–M7 阶段实施。

### Added

- **入口**：`SKILL.md` —— DSH 合规 frontmatter、黄金法则、意图路由表、硬约束清单、**缺省值专章**、MCP 边界、渐进披露表、成果闭环。
- **配置**：`config.yaml` —— AFSIM 路径、MCP 工具白/黑名单与调用规范、工程结构约定（单点维护）。
- **结构层** `refs/structure/`：
  - `project-layout.md` —— 9 根文件 + 14 目录逐项说明
  - `assembly-rules.md` —— 装配链、路径变量、命名与写法约定
  - `run-json.md` —— `config/run.json` 字段说明
  - `defaults.md` —— 缺省值清单
- **模板层** `templates/`：
  - `project/` —— 工程骨架模板（含最小可跑工程）与 `README.md`
  - `fragments/` —— 按目标目录分类的组件片段（11 类）
- **工作流层** `workflows/`：`generate.md`、`validate.md`、`debug.md`、`archive.md`。
- **知识层** `refs/knowledge/` —— 移植 AFSIM Script Generator（lookingforfeng）的 12 篇 references；`refs/examples/` —— 4 个完整场景范本；`refs/knowledge/SOURCE.md` 记录来源与许可。
- **体系层** `refs/sos/`：`sos-concepts.md`、`task-taxonomy.md`、`command-chain.md`、`kill-chain.md`、`sensor-network.md`、`kpi-metrics.md`。
- **记忆层** `refs/quick-ref.md`、`refs/errors-ref.md`、`memory/lesson-index.md`、`memory/lesson-root-causes.md`
  （后于「运行时状态外置」改造移至 `refs/lesson-*.md`，见下）。
- **产出区** `output/staging/`、`output/verified/{scenario,component,template}/`。

### Notes

- 本 skill **只做生成与语法校验**，**不运行仿真**：MCP 的 `upload_zip` / `submit_simulation` / `get_simulation` / `list_results` / `download_result` / `replay` 一律禁用。
- 校验判据为 `data.valid`；语法对错都返回 HTTP 200。
- `common/` 数据表由人类提供，本 skill 只建目录。

### Verified

- **2026-10-16 端到端实测通过**（详见《验收报告》）：
  - **正例**：最小可跑工程（8 文件）一次通过，`data.valid=true`。
  - **负例**：块未闭合 / 数值缺单位 / ZIP 名与入口不符 —— 三类均被正确判错并可定位。
  - **修复复校**：2 例修复后均转为 `valid=true`，闭环合拢。
- **实测沉淀**（回写三层教训体系）：
  - 新增 `[E027] Unexpected End Of Data`（块未闭合的"错位报错"形态）。
  - 补强 `[E040]`，增收实测关键字 `Bad value for: <参数名>`。
  - 同步更新 `memory/lesson-index.md`（L001）与 `memory/lesson-root-causes.md`（L001）。
- 修正：实施方案 §9 目录数口径 `17` → `14`；§10.3「仍需确认」→「已全部闭环」。

### Changed — 边界收敛（2026-10-16）

**原则**：本 skill 只经 MCP 工具工作，**不接触 AFSIM 本体**；服务端实现细节（装在哪、怎么起、什么端口）一律不进入 skill。

- **移除 AFSIM 实现细节**：`config.yaml` 删除 `afsim:` 整段（`install_dir` / `mission_exe`）。
  理由：skill 只调 MCP，路径属服务端职责；保留只会造成耦合与误导。
- **收敛服务端耦合**：不再出现服务名、启动命令（`python run.py`）、服务地址与端口；
  服务不可达统一表述为"请用户确认校验服务已启动"。
- **精简错误码表**：删除与本 skill 无关的 `409`（任务未完成）、`503`（仿真队列已满）；
  改为"未列出的 `code` → 读 `msg` 原文报告，不要据此判断语法对错"。
  涉及 `config.yaml`、`workflows/validate.md`、`workflows/debug.md`、`refs/errors-ref.md`、`memory/lesson-root-causes.md`。
- **单点维护**：工具名前缀不再在 `SKILL.md` 硬编码，统一指向 `config.yaml` 的 `mcp.prefix`。
- **措辞中性化**：`full_output` 注释与说明不再点名底层可执行文件（"完整校验输出"）。
- **文档边界标注**：`实施方案.md`（设计记录）与 `验收报告.md`（测试报告）保留实现细节，
  但已标注**非运行依赖**；同步修正实施方案 §4.1 命令入口（多命令 → 单入口 + 意图路由）
  与 §4.2 配置示例、文档状态（待评审 → 已实施）。

### Changed — 运行时状态外置（2026-10-16）

**问题**：原设计让运行期写入 skill 目录（`output/` 产出区、`memory/` 教训库、`refs/errors-ref.md`）。
这混淆了「**只读资产**」与「**运行时状态**」—— skill 可被多个项目共享，写 skill 目录会串味，且 skill 升级会丢失积累。

**原则**：**skill 目录 = 只读资产；运行时状态 = 工作空间 `<cwd>/.afsim-forge/`。**

- **改名去歧义**：`memory/` → `refs/lesson-index.md` + `refs/lesson-root-causes.md`
  （避免与智能体的"记忆功能"重名；且明确其为**只读基线**）。
- **删除 skill 内的 `output/`**：产出区外移；`output/README.md` 的说明并入 `SKILL.md`「成果闭环与写入边界」。
- **运行时状态新位置**（`config.yaml` 新增 `runtime` 段）：
  - `.afsim-forge/output/staging/`、`.afsim-forge/output/verified/{scenario,component,template}/`
  - `.afsim-forge/lessons/`（本项目运行时新增教训，与 skill 基线同构）
- **写入边界写进 SKILL.md**：「黄金法则」加"skill 目录只读"；「成果闭环」扩为「成果闭环与写入边界」。
- **教训回流改为显式动作**：通用教训经**用户确认**后才合并回 skill 的 `refs/`，AI 不自动改 skill。
- **`.gitignore`**：`afsim-forge/output/*` 规则废弃，改为 `**/.afsim-forge/`。
- **同步**：`workflows/{generate,validate,debug,archive}.md`、`refs/errors-ref.md`、
  `refs/lesson-*.md` 的全部路径引用。
