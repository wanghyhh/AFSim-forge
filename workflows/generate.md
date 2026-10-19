# 工作流：生成工程（generate）

> **输入（实验筹划 + 想定编辑 JSON）** → AFSIM 标准工程 → 通过语法校验。
> 结构依据 `blueprints/layout/layout.md`；模板取自 `blueprints/`；缺省值见 `SKILL.md`「缺省值」与 `blueprints/layout/defaults.md`。

---

## Step 0：输入解析（→ `workflows/intake.md`）

**本步不在本文件展开** —— 输入是两类文本（**实验筹划**自然语言 + **想定编辑** JSON，后者可选、格式不定），
解析规则、优先级、JSON 字段落点、实验筹划→工程要素映射，全部见 **`workflows/intake.md`**。

**必须产出的 6 项结论**（作为后续步骤与交付说明的骨架）：

| # | 结论 | 缺省 |
| :-: | :-- | :-- |
| 1 | 想定名 | `<主题拼音>_<日期>` |
| 2 | 阵营与兵力（型号 / 数量 / 位置） | 红 `red` / 蓝 `blue`；兵力**核心，尽量问清** |
| 3 | 任务与过程（时间线 + 关键事件） | 仿真时长 `10 m`，起始为当前日期 `00:00:00` |
| 4 | 体系关系（指挥链 / 通信组网） | 无指挥关系时省略 |
| 5 | 配置（**逐项标明来源：JSON / 实验筹划 / 缺省**） | 见 `blueprints/layout/defaults.md` |
| 6 | 待确认清单（未识别 JSON 字段 / 缺参数 / 待补数据表） | — |

**规则**：
- **JSON 提供了就必须读**（不丢字段、不改语义、不猜单位）；**没提供就按实验筹划 + 缺省生成**，不得因此停下。
- **能推断就推断**，按缺省值补全，**不要反复追问**；只有 `intake.md` §6 列的 4 种情况才问，且**一次问完**。
- 传感器 / 武器 / 处理器按平台类型推断；输出需求缺省 `event_output: enable all`。
- 补全后，在最终交付说明中**逐项标注来源**（这是用户复核的依据）。

---

## Step 1：建骨架

> **工作目录**：`.afsim-forge/output/staging/<想定名>/`（工作空间下，见 `config.yaml` 的 `runtime`）。

1. 复制 `blueprints/skeleton/` 到 `.afsim-forge/output/staging/<想定名>/`。
2. 按 `blueprints/skeleton/dirs.txt` 创建所需目录。
3. **必须创建工程内的** `output/blank_empty.txt`（空文件）—— ⚠️ 这是**想定工程自己的** `output/` 目录（AFSIM 输出落点，ZIP 不保留空目录），与**运行时产出区**（`.afsim-forge/output/`）**无关**。
4. 生成根文件，替换占位符：
   - `<想定名>.txt`（入口）
   - `setup.txt` / `event_pipe.txt` / `global_env.txt`
   - `config/run.json`
   - 按需：`global_route.txt` / `global_script.txt` / `global_struct.txt` / `group.txt` / `zone.txt`

> ⚠️ **入口文件只 include 实际存在的文件**——可省的文件若未生成，删掉对应 `include_once` 行。

---

## Step 2：【校验点 T1】骨架校验

空壳先过一遍 —— 确认 `include_once` 链、路径变量、文件名无误。

→ 走 `workflows/validate.md`。**不通过则先修骨架，不要继续。**

---

## Step 3：分模块生成

按**自下而上**顺序填充（下层不得引用上层）：

```
① 组件定义      mover/ · comm/ · processor/ · signatures/ · weapon_effects/ · medium/ · network/
② 传感器        sensor/（antenna_pattern 须在 sensor 之前）
③ 武器          weapon/（弹体 platform_type + weapon 块）
④ 平台类型      platform/（头部先 include 依赖，再写 platform_type）
⑤ 平台装配      setup.txt 登记所有 platform/*.txt
⑥ 实例部署      side/red.txt · side/blue.txt（含 position / aux_data / command_chain）
⑦ 网络/媒介汇总 network/network.txt · medium/medium.txt
```

**每个文件从 `blueprints/fragments/` 取对应片段改写**，不要凭空写语法；语法细节查 `knowledge/`。

---

## Step 4：【校验点 T2】阶段校验

**每完成一类组件后**打包校验一次（platform / sensor / weapon / processor / side 各一次），
把错误限制在刚生成的范围内。

→ 走 `workflows/validate.md`。

## Step 4.5：AI 自检（语法校验前必做）

> **目的**：在调用校验服务前，用规则检查排除风格偏离、配置语义不一致、仿真时长不足等**非语法问题**。  
> 这些错误校验服务也能报，但 AI 自检可以提前发现、定位更精确、修复更快。

### 4.5.1 结构自检（逐条核对）

| # | 检查项 | 判定标准 | 不通过处理 |
| :-: | :-- | :-- | :-- |
| 1 | **装配中心完整性** | `setup.txt` 必须包含**所有** `platform/*.txt` 和 `side/*.txt` 的 `include_once` | 补全缺失的 `include_once` 行 |
| 2 | **入口文件装配链** | 入口文件只 `include_once` `setup.txt`（以及按需的 `event_pipe.txt`、`global_env.txt` 等根文件），**不直接 include `side/*.txt`** | 把 `side/*.txt` 的 include 移到 `setup.txt` |
| 3 | **`log_file` 位置** | `log_file` 必须在 `file_path .` **之后**（推荐紧跟 `event_output`） | 调整顺序 |
| 4 | **配置语义一致性** | `config/run.json` 的 `scenariosTime` 与入口文件的 `start_date`/`start_time`/`end_time` **完全一致** | 同步修正 |
| 5 | **记录开关一致性** | `event_pipe.txt` 中 `enable` 的类别，与 `run.json` 的 `recordAer`/`recordEvent`/`recordLog` 语义匹配 | 按需调整（如 `enable` 了事件但 `recordEvent=0`，则改为 `1`） |
| 6 | **时间一致性** | `run.json` 的 `continueTime`（分钟）≥ `end_time` 换算后的分钟数 | 同步修正 |

### 4.5.2 仿真时长自检（任务 vs 仿真时间）

**规则**：

1. 从实验筹划 / 想定编辑中提取**任务时间线**（飞行航程、作战持续时间、机动到位时间等）。
2. 计算**任务结束时间** `T_task`（分钟）。
3. `end_time` 必须满足：`end_time ≥ T_task + 缓冲时间`。
   - **缓冲时间** = max(T_task × 0.2, 2 m)（至少 20% 余量，最少 2 分钟）。
4. 若 `end_time` 不足，**自动延长**并更新 `run.json` 的 `continueTime`，同时在交付说明中标注。

**示例**：

- 任务：F22 从洛杉矶飞纽约，巡航速度 500 knots，航程约 2,400 nm，预计飞行时间 ≈ 288 m（4.8 h）。
- 计算：`T_task = 288 m`，缓冲 = max(288 × 0.2, 2) = 57.6 m → 取整 60 m。
- `end_time` 应设为 `348 m`（≈ 5.8 h），而非缺省 `10 m`。

> ⚠️ **若实验筹划未给出明确任务时间线**，按缺省 `10 m` 生成，并在交付说明中标注「任务时长未明确，采用缺省值，请用户确认」。

**自检通过标准**：上述 6 项全部通过，且仿真时长自检无告警。

---

## Step 5：【校验点 T3】终校验

全部生成完毕 → 全量打包 → 校验 → **必须 `data.valid = true`**。

→ 走 `workflows/validate.md`；失败走 `workflows/debug.md`。

---

## Step 6：交付与归档

1. 输出**交付说明**，含：
   - 工程目录树
   - 组件清单（平台/传感器/武器/处理器各几个）
   - **参数来源表**：每个关键参数标明是 `想定编辑 JSON` / `实验筹划` / `缺省值` 给的；被 JSON 覆盖的实验筹划值要写明
   - **未识别 JSON 字段清单**（原样保留在 `config/run.json`，请用户确认）
   - **待人类补齐清单**（`common/` 数据表、未提供的 `scenariosId` 等）
   - 校验结论（`data.valid`、`checked_file`）
2. 用户认可 → 走 `workflows/archive.md`。

---

## 硬约束（生成时逐条自检）

1. 扩展名 `.txt`；2. 数值带单位；3. 块有 `end_*`、`platform_type` 带 `WSF_PLATFORM`；
4. 坐标 `d:m:s`；5. 入口严格同名；6. `output/blank_empty.txt` 存在；
7. 组件文件头部先 include 依赖；8. 新平台登记进 `setup.txt`；
9. 无中文路径；10. 不编造 `common/` 数据表与 `scenariosId`。

> 完整自检清单见 `blueprints/layout/layout.md` §5。

---

## 参考

- 输入：`workflows/intake.md`
- 结构：`blueprints/layout/layout.md`、`assembly.md`、`run-json.md`、`defaults.md`
- 骨架：`blueprints/skeleton/`（含 `minimal/` 最小可跑工程）
- 片段：`blueprints/fragments/`
- 完整案例：`blueprints/cases/`
- 语法：`knowledge/language/`、`knowledge/blocks/`（按需加载）
- 体系知识：`knowledge/system-of-systems/`
