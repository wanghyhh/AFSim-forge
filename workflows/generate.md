# 工作流：生成工程（generate）

> 自然语言需求 → AFSIM 标准工程 → 通过语法校验。
> 结构依据 `refs/structure/project-layout.md`；模板取自 `templates/`；缺省值见 `SKILL.md`「缺省值」与 `refs/structure/defaults.md`。

---

## Step 0：需求解析

从用户描述中抽取：

| 要素 | 缺省 |
| :-- | :-- |
| 想定名 | `<主题拼音>_<日期>` |
| 阵营 | 红 `red` / 蓝 `blue` |
| 平台清单 | — （**核心，尽量问清**） |
| 传感器 / 武器 / 处理器 | 按平台类型推断 |
| 仿真时长 | `10 m` |
| 起始时间 | 当前日期 `00:00:00` |
| 输出需求 | `event_output: enable all` |

**规则**：
- **能推断就推断**，按缺省值补全，**不要反复追问**。
- 仅在**想定名、阵营、平台清单、仿真时长**完全无法推断时才向用户澄清。
- 补全后，在最终交付说明中**列出本次采用的缺省值**。

---

## Step 1：建骨架

> **工作目录**：`.afsim-forge/output/staging/<想定名>/`（工作空间下，见 `config.yaml` 的 `runtime`）。

1. 复制 `templates/project/` 到 `.afsim-forge/output/staging/<想定名>/`。
2. 按 `templates/project/dirs.txt` 创建所需目录。
3. **必须创建工程内的** `output/blank_empty.txt`（空文件）—— ⚠️ 这是**想定工程自己的** `output/` 目录（AFSIM 输出落点，ZIP 不保留空目录），与 skill 的产出区**无关**。
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

**每个文件从 `templates/fragments/` 取对应片段改写**，不要凭空写语法；语法细节查 `refs/knowledge/`。

---

## Step 4：【校验点 T2】阶段校验

**每完成一类组件后**打包校验一次（platform / sensor / weapon / processor / side 各一次），
把错误限制在刚生成的范围内。

→ 走 `workflows/validate.md`。

---

## Step 5：【校验点 T3】终校验

全部生成完毕 → 全量打包 → 校验 → **必须 `data.valid = true`**。

→ 走 `workflows/validate.md`；失败走 `workflows/debug.md`。

---

## Step 6：交付与归档

1. 输出**交付说明**，含：
   - 工程目录树
   - 组件清单（平台/传感器/武器/处理器各几个）
   - **本次采用的缺省值**
   - **待人类补齐清单**（`common/` 数据表、`scenariosId` 等）
   - 校验结论（`data.valid`、`checked_file`）
2. 用户认可 → 走 `workflows/archive.md`。

---

## 硬约束（生成时逐条自检）

1. 扩展名 `.txt`；2. 数值带单位；3. 块有 `end_*`、`platform_type` 带 `WSF_PLATFORM`；
4. 坐标 `d:m:s`；5. 入口严格同名；6. `output/blank_empty.txt` 存在；
7. 组件文件头部先 include 依赖；8. 新平台登记进 `setup.txt`；
9. 无中文路径；10. 不编造 `common/` 数据表与 `scenariosId`。

> 完整自检清单见 `refs/structure/project-layout.md` §5。

---

## 参考

- 结构：`refs/structure/project-layout.md`、`assembly-rules.md`、`run-json.md`、`defaults.md`
- 语法：`refs/knowledge/`（按需加载）
- 范本：`refs/examples/`
- 速查：`refs/quick-ref.md`
- 体系知识：`refs/sos/`
