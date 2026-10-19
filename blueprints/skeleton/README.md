# 工程骨架（skeleton）

> **何时用**：从零生成一个 AFSIM 体系工程时。
> **不逐字复刻样例**——本目录给的是「说明 + 可填骨架」：占位符用 `{{...}}` 标注，按需取舍。

---

## 1. 使用步骤

1. 建目录：按 `dirs.txt` 创建实际用到的目录（**不必 14 个全建**）+ `output/blank_empty.txt`。
2. 填根文件：把本目录 `*.tpl` 复制为工程根下的对应文件，替换占位符。
3. 填组件：从 `blueprints/fragments/` 取片段，落到对应子目录。
4. 登记：把新建的 `platform/*.txt` 写进 `setup.txt`。
5. **校验**：走 `workflows/validate.md`。

---

## 2. 占位符

| 占位符 | 含义 | 缺省 |
| :-- | :-- | :-- |
| `{{SCENARIO_NAME}}` | 想定名 | `<主题拼音>_<日期>` |
| `{{END_TIME}}` | 仿真时长 | `10 m` |
| `{{START_DATE}}` | 开始日期（`mon dd yyyy`，如 `oct 16 2026`） | 当前日期 |
| `{{START_TIME}}` | 开始时间（`hh:mm:ss`） | `00:00:00` |
| `{{EVENT_ENABLE}}` | 事件输出项 | `enable all` |
| `{{PLATFORM_INCLUDES}}` | `setup.txt` 的平台 include 行 | 按实际平台 |

> 日期/时间须与 `config-run.json.tpl` 的 `scenariosTime` 保持一致（格式不同：入口用 `mon dd yyyy`，json 用 `YYYY-MM-DD`）。

---

## 3. 必填 vs 可省

| 文件 | 必填 | 可省条件 |
| :-- | :-: | :-- |
| `entry.txt.tpl` → `<想定名>.txt` | ✔ | — |
| `setup.txt.tpl` | ✔ | — |
| `event_pipe.txt.tpl` | ✔ | — |
| `global_env.txt.tpl` | ✔ | — |
| `config-run.json.tpl` | ✔ | — |
| `global_route.txt.tpl` | ○ | 无全局航路时 |
| `global_script.txt.tpl` | ○ | 无公共脚本时 |
| `global_struct.txt.tpl` | ○ | 无自定义结构时 |
| `group.txt.tpl` | ○ | 无编组时 |
| `zone.txt.tpl` | ○ | 无区域时 |

> ⚠️ **入口文件里不得 `include_once` 不存在的文件**——可省的文件若未生成，须从 `entry.txt.tpl` 中删掉对应行。

---

## 4. 生成后自检

见 `blueprints/layout/layout.md` §5。核心几条：

- [ ] 入口文件名 = 想定名，且与 ZIP 同名
- [ ] 所有 `include_once` 目标真实存在
- [ ] 新平台已登记进 `setup.txt`
- [ ] `output/blank_empty.txt` 存在
- [ ] 数值带单位、坐标用 `:`、块有 `end_*`
- [ ] `run.json` 的 `scenariosTime` 与入口一致，`scenariosId` 为 `0`

---

## 5. 最小可跑工程

见 `minimal/` —— 一个**可直接校验通过**的最小工程（入口 + setup + 1 平台 + 1 实例 + output 占位）。
**建议先跑通最小工程，再逐步扩展。**
