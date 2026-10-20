# 工作流：交付（deliver）

> 收口工程：结束判定 → 内容整理 → 行数统计 → 后续询问 → 归档。
> 所有路径均在工作空间的状态目录 `.afsim-forge/` 下（见 `config.yaml` 的 `runtime`）—— skill 目录只读。

---

## 1. 结束判定（**必须全部满足**）

| # | 条件 |
| :-: | :-- |
| 1 | **语法校验通过**：校验返回 `data.valid = true` |
| 2 | **用户明确认可**：用户说「可以 / 确认 / 交付」 |
| 3 | 无未解决的报错（最后一轮校验无 `errors[]`） |

不满足 → 留 `staging`，按情况回 `workflows/4_validate.md` / `workflows/debug.md`，**不得交付、不得归档**。

---

## 2. 内容整理

满足结束条件后：

1. **清理过程文件**：`.afsim-forge/tmp/` 下本工程的解压目录、修复过程中的中间产物、多余临时 ZIP —— 全部清理。
2. **仅保留工程文件**，工程文件夹内只留：
   - `<想定名>.md`（**蓝图，保留**）
   - 全部 AFSIM 脚本与配置（入口、`setup.txt`、`event_pipe.txt`、`global_env.txt`、各组件目录、`config/run.json`、`output/blank_empty.txt`）
3. 若 §4 已跑过仿真，`output/` 中的仿真产物（`.log` / `.evt` / `.aer` 等）**保留**。

---

## 3. 行数统计（向用户打印）

**统计范围**：工程文件夹中**除蓝图文件外、所有模型生成的文本类型文件**（`*.txt`、`*.json` 等；不含 `<想定名>.md`、不含 `output/` 下 AFSIM 产物）。

逐文件列出：相对路径 + 行数，最后给出合计。示例：

| 文件 | 行数 |
| :-- | :-: |
| `<想定名>.txt` | 17 |
| `setup.txt` | 3 |
| `config/run.json` | 22 |
| `platform/F22.txt` | 18 |
| `side/blue.txt` | 13 |
| **合计** | **73** |

> 蓝图 `<想定名>.md` **不计入**行数统计。

---

## 4. 后续操作询问

整理完成后，向用户询问：

> 「工程已交付完毕。是否需要完整跑一次仿真？」

- **不需要** → 进入 §5 归档。
- **需要** → 按通道执行：

### 4.1 MCP 通道（默认）

1. `upload_zip`：上传工程 ZIP（ZIP 名 = 想定名）。
2. `submit_simulation`：提交仿真。
3. `get_simulation`：轮询状态，直至仿真结束（completed / failed）。
4. `download_result`：下载结果清单中 `output/` 的全部内容（`.log` / `.evt` / `.aer` 等）。
5. 下载物落盘到**工程文件夹的 `output/` 子目录**。
6. 向用户报告：仿真结论、产物清单、关键事件摘要（有 `.evt` 时）。

### 4.2 本地备用通道（MCP 不可用）

按 `workflows/local-exec.md` §2 以 `mission.exe` 跑仿真——本地运行时结果文件**本就直接落在工程 `output/`**，无需下载；回放按该文档 §3（用户需要时）。

> **注意**：跑仿真是**交付后的一次性可选动作**，用户没要求就不做；本 skill 的日常流程止于语法校验。

---

## 5. 归档（保留 verified 机制）

用户认可且（若跑过仿真）结果已交付后：

1. **移动**：`.afsim-forge/output/staging/<想定名>/` → `.afsim-forge/output/verified/scenario/<想定名>/`（**只进不出**）。
2. 校验留痕 ZIP（如保留）随工程一并归档。
3. 在 `.afsim-forge/output/verified/scenario/README.md` 追加一行元信息：

   | 想定名 | 生成时间 | 校验结论 | checked_file | 组件清单 | 脚本行数合计 | 仿真是否跑过 |
   | :-- | :-- | :-- | :-- | :-- | :-: | :-: |

4. 回写蓝图 §0「校验状态」为 `valid=true`（注明时间）。

**归档后**：

- 后续生成新工程时，**优先从 `verified/` 找同类案例作为参考**（仅次于 `blueprints/cases/` 与 `blueprints/fragments/`）。
- 归档后发现错误 → **不得直接改 `verified/`**，应回 `staging` 重做、重新校验、再归档。

---

## 6. 不归档的情形

| 情形 | 处理 |
| :-- | :-- |
| 校验未通过 | 留在 `staging`，走 `workflows/debug.md` |
| 校验通过但用户未认可 | 留在 `staging`，等用户确认 |
| 修复轮次超限（> 3） | 停止，向用户报告，不归档 |
| 只是试验性片段 | 留在 `staging`，或按需放入 `verified/component/` |
