# 知识资产来源与许可（NOTICE）

本 skill 的 `knowledge/language/` 与 `knowledge/blocks/` 下的文档**整体移植自第三方开源项目**，
为遵守许可与尊重原作者，特此声明来源。

> 其余内容（`blueprints/`、`workflows/`、`knowledge/system-of-systems/`、`knowledge/lessons/`、`SKILL.md`、`config.yaml`）
> 为本项目自研或由本项目案例实测归纳，不属于移植范围。

---

## 1. 来源项目

| 项 | 内容 |
| :-- | :-- |
| 项目名 | **AFSIM Script Generator**（`afsim-script-generator`） |
| 仓库目录 | `GitHub项目/afsimskills-main/`（本仓库内的快照） |
| 原作者 | **lookingforfeng** |
| 声明许可 | **MIT**（README 徽章标注；**注：该仓库快照中未包含 LICENSE 文件**，本移植按 MIT 处理并保留署名） |
| 适用版本 | AFSIM 2.9.0 |

---

## 2. 移植清单（现存 9 篇）

### `knowledge/language/`（5 篇）

| 现路径 | 原文件名 | 说明 |
| :-- | :-- | :-- |
| `knowledge/language/grammar.md` | `language_grammar.md` | 语言语法基础 |
| `knowledge/language/script-syntax.md` | `script_syntax_critical.md` | ⭐ 脚本编写关键语法规则（必读） |
| `knowledge/language/script-api.md` | `script_api_reference.md` | `WsfPlatform` / `WsfSensor` / `WsfWeapon` 等 API（158 方法） |
| `knowledge/language/script-types.md` | `script_types.md` | 脚本类型与基本类型 |
| `knowledge/language/messages.md` | `message_types_reference.md` | `WsfMessage` 体系与消息类型 |

### `knowledge/blocks/`（4 篇）

| 现路径 | 原文件名 | 说明 |
| :-- | :-- | :-- |
| `knowledge/blocks/commands.md` | `commands_reference.md` | 命令完整参考 |
| `knowledge/blocks/movers.md` | `mover_reference.md` | 22+ 机动类型参考 |
| `knowledge/blocks/sensors.md` | `sensor_types_reference.md` | 雷达 / ESM / EO-IR 传感器参数 |
| `knowledge/blocks/pitfalls.md` | `common_mistakes.md` | 常见错误与最佳实践 |

---

## 3. 已移除的移植内容（及原因）

| 原文件 | 处理 | 原因 |
| :-- | :-- | :-- |
| `commands.md`（命令速查） | **删除** | 与 `commands_reference.md`（现 `knowledge/blocks/commands.md`）重复；保留完整版即可 |
| `examples.md`（完整示例与常用模式） | **删除** | 其示例为**单文件场景**，与多目录工程结构不兼容；完整正例已由 `blueprints/cases/` 的 5 个实测工程替代 |
| `file_structure.md`（文件结构） | **删除** | 描述的同样是**单文件场景**，与本 skill 的**多目录工程**在组织层直接冲突，曾有"适配头"但仍是误导源；结构权威现为 `blueprints/layout/layout.md` |
| `refs/examples/` 下 4 个 `.txt` 场景 | **删除** | 语法层全部实测 `valid=true`（非错例），但**组织层为单文件**（0 处 `include_once`），无法作为多目录工程的范本；同类完整正例改由 `blueprints/cases/` 提供 |

---

## 4. 本项目的改动

移植遵循「**整体移植、不改原文**」原则，仅做以下改动：

1. **重命名 + 目录重排**：按 `language/`（语言与脚本）/ `blocks/`（块与参数）两分，文件名改为简短可读的英文单词（见 §2 对照表）。**正文内容未改写**。
2. **路径引用修正**：文末「参考」段中指向旧文件名的链接已改为新路径。
3. **一处笔误更正**：`blocks/pitfalls.md` 沿用原文；`blocks/commands.md` 等如与官方语料冲突，**以 `blueprints/cases/` 实测案例为准**（见下 §5）。

---

## 5. 使用注意

- **语法层**（块结构、`end_*`、单位、坐标、mover/sensor/weapon/processor 参数、脚本 API）—— **直接可用**。
- **组织层**（"一个 `.txt` 装下所有内容"的写法）—— **不可用**，一律以 `blueprints/layout/` 为准。
- **可信度分级**：移植文档来自第三方整理，**未经本项目逐条实测**。凡与 `blueprints/cases/` 中 `valid=true` 的实测案例冲突，**以案例为准**。
  已知风险点：`blocks/commands.md` 中有少数命令类型在官方 demo 语料中 0 命中（疑为旧版残留），引用前建议先在 `blueprints/cases/` 里找同类用法。

---

## 6. 后续计划

本阶段为**整体移植 + 结构适配**；后续迭代将按需**精选改写**（去芜存菁、补实测证据、剔除官方语料中查无实据的条目）。
