# 工作流：工程生成（generate）

> **输入**：已就绪的蓝图文件 `<想定名>.md`（`workflows/2_blueprint.md` 的产出）。
> **产出**：与蓝图 §4 **逐字符一致**的完整工程（落在 `.afsim-forge/output/staging/<想定名>/`）。
> 结构规则仍以 `blueprints/layout/layout.md` 为准；蓝图与 layout 冲突时，**先修蓝图再实施**。

---

## Step 0：读取蓝图

1. 打开 `<想定名>.md`，确认 §5 自检已全部通过；未通过 → 回 `workflows/2_blueprint.md`。
2. 蓝图 §2「文件结构」+ §4「完整脚本全文」就是施工图——本工作流的唯一任务是把蓝图落成磁盘文件。
3. 若上下文已被清理 / 压缩、对「要求或结构」记忆模糊：**先重读 `SKILL.md` 与蓝图**，再继续。

---

## Step 1：建目录与骨架

1. 建工程目录 `.afsim-forge/output/staging/<想定名>/`。
2. **蓝图文件复制进去**：`<想定名>.md` 放工程根（蓝图是工程的一部分，随工程交付）。
3. 按蓝图 §2 创建实际用到的目录（不必 14 个全建）；`output/blank_empty.txt` 必须建。

---

## Step 2：【校验点 T1】骨架校验

先生成 4 个必建根文件（入口 / setup / event_pipe / global_env）+ `config/run.json` 的空壳，打包校验一遍，确认 `include_once` 链、路径变量、文件名无误。

→ 走 `workflows/4_validate.md`。**不通过则先修（先改蓝图，再改工程），不要继续。**

---

## Step 3：按蓝图 §4 生成全部工程文件

- **按蓝图 §4 的文件顺序逐一落盘**：每个文件块 → 对应路径的文件，内容**逐字符一致**。
- 平台、传感器、武器等组件不得自行增删——蓝图有的才建；蓝图没覆盖的，**停下来先改蓝图**。
- 生成中若发现蓝图问题（语法预检漏网、装配缺失）→ **先改蓝图（§6 记录），再继续生成**。禁止「将错就错」。

---

## Step 4：【校验点 T2】阶段校验

每完成一类组件（platform / sensor / weapon / processor / side）打包校验一次，把错误限制在刚生成的范围内。

→ 走 `workflows/4_validate.md`。

---

## Step 5：AI 自检 —— 工程 vs 蓝图一致性

全部文件落盘后、终校验前，逐项核对：

| # | 检查项 |
| :-: | :-- |
| 1 | 工程目录树与蓝图 §2 一致（无多建、无漏建） |
| 2 | 每个工程文件与蓝图 §4 对应文件块**逐字符一致**（diff 为空） |
| 3 | `setup.txt` 登记了蓝图 §3.2 装配链中的全部 `platform/*.txt` 与 `side/*.txt` |
| 4 | 仿真控制参数（`end_time` / `start_date` / `start_time` / `continueTime`）与蓝图 §5.3 校核结论一致 |
| 5 | 无中文路径；`output/blank_empty.txt` 存在 |

不一致 → **以蓝图为准修正工程**（或先改蓝图再修正，视问题归属）。

---

## Step 6：【校验点 T3】终校验

全量打包 → 校验 → **必须 `data.valid = true`**。

→ 走 `workflows/4_validate.md`；失败走 `workflows/debug.md`。

---

## Step 7：移交交付

向用户报告工程已生成且通过校验，进入 `workflows/5_deliver.md`（结束判定 → 内容整理 → 行数统计 → 后续询问 → 归档）。

---

## 硬约束（生成时逐条自检）

1. 扩展名 `.txt`；2. 数值带单位；3. 块有 `end_*`、`platform_type` 带 `WSF_PLATFORM`；
4. 坐标 `d:m:s`；5. 入口严格同名；6. `output/blank_empty.txt` 存在；
7. 组件文件头部先 include 依赖；8. 新平台登记进 `setup.txt`；
9. 无中文路径；10. 不编造 `common/` 数据表与 `scenariosId`。

> 完整自检清单见 `blueprints/layout/layout.md` §5。

---

## 参考

- 蓝图：`workflows/2_blueprint.md` · 模板 `blueprints/skeleton/blueprint.md.tpl`
- 输入：`workflows/1_intake.md`
- 结构：`blueprints/layout/layout.md`、`assembly.md`、`run-json.md`、`defaults.md`
- 骨架：`blueprints/skeleton/`（含 `minimal/` 最小可跑工程）
- 片段：`blueprints/fragments/`
- 完整案例：`blueprints/cases/`
- 语法：`knowledge/language/`、`knowledge/blocks/`（按需加载）
- 体系知识：`knowledge/system-of-systems/`
