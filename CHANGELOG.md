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
- **记忆层** `refs/quick-ref.md`、`refs/errors-ref.md`、`memory/lesson-index.md`、`memory/lesson-root-causes.md`。
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
