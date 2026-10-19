# NOTICE — 第三方来源与许可

本项目的 `knowledge/language/` 与 `knowledge/blocks/` 下的文档**整体移植自第三方开源项目**。
为遵守许可、尊重原作者，特此声明来源。

> 其余内容（`workflows/`、`blueprints/`、`knowledge/system-of-systems/`、`knowledge/lessons/`、
> `SKILL.md`、`config.yaml`、`README.md`）为本项目自研或由本项目实测归纳，不属于移植范围。

---

## 1. 来源项目

| 项 | 内容 |
| :-- | :-- |
| 项目名 | **AFSIM Script Generator**（`afsim-script-generator`） |
| 原作者 | **lookingforfeng** |
| 声明许可 | **MIT**（上游 README 徽章标注；**注：上游快照中未包含 LICENSE 文件**，本移植按 MIT 处理并保留署名） |
| 适用版本 | AFSIM 2.9.0 |

---

## 2. 移植清单（现存 9 篇）

仅做**重命名与目录重排**，**正文未改写**。

### 2.1 `knowledge/language/`（5 篇）

| 本项目路径 | 上游文件名 | 说明 |
| :-- | :-- | :-- |
| `knowledge/language/grammar.md` | `language_grammar.md` | 语言语法基础 |
| `knowledge/language/script-syntax.md` | `script_syntax_critical.md` | ⭐ 脚本编写关键语法规则 |
| `knowledge/language/script-api.md` | `script_api_reference.md` | `WsfPlatform` / `WsfSensor` / `WsfWeapon` 等 API |
| `knowledge/language/script-types.md` | `script_types.md` | 脚本类型与基本类型 |
| `knowledge/language/messages.md` | `message_types_reference.md` | `WsfMessage` 体系与消息类型 |

### 2.2 `knowledge/blocks/`（4 篇）

| 本项目路径 | 上游文件名 | 说明 |
| :-- | :-- | :-- |
| `knowledge/blocks/commands.md` | `commands_reference.md` | 命令完整参考 |
| `knowledge/blocks/movers.md` | `mover_reference.md` | 机动（mover）类型参考 |
| `knowledge/blocks/sensors.md` | `sensor_types_reference.md` | 雷达 / ESM / EO-IR 传感器参数 |
| `knowledge/blocks/pitfalls.md` | `common_mistakes.md` | 常见错误与最佳实践 |

---

## 3. 未纳入的移植内容（及原因）

| 上游文件 | 处理 | 原因 |
| :-- | :-- | :-- |
| `commands.md`（命令速查） | 未纳入 | 与 `commands_reference.md`（现 `blocks/commands.md`）重复；且其 `{}` 包块 / `RUN_SIMULATION` 写法**实测报错** |
| `examples.md`（示例与常用模式） | 未纳入 | 示例为**单文件场景**，与本项目的多目录工程结构不兼容 |
| `file_structure.md`（文件结构） | 未纳入 | 同为单文件场景，与本项目组织层**直接冲突**；曾有"适配头"但仍是误导源 |
| 4 个单文件场景 `.txt` | 未纳入 | 语法层实测可解析，但**0 处 `include_once`**，无法作为多目录工程范本；同类完整正例改由 `blueprints/cases/` 提供 |

---

## 4. 本项目对移植内容的改动

1. **重命名 + 目录重排**：按 `language/`（语言与脚本）/ `blocks/`（块与参数）两分，文件名改为简短可读的英文单词（见 §2 对照表）。**正文未改写**。
2. **路径引用修正**：文末「参考」段中指向旧文件名的链接已改为新路径。

---

## 5. 使用注意与可信度

- **语法层**（块结构、`end_*`、单位、坐标、mover/sensor/weapon/processor 参数、脚本 API）—— **直接可用**。
- **组织层**（"一个 `.txt` 装下所有内容"的写法）—— **不可用**，一律以 `blueprints/layout/` 为准。
- 移植文档来自第三方整理，**未经本项目逐条实测**。凡与 `blueprints/cases/` 中已通过语法校验的实测案例冲突，**以案例为准**。
- 已知风险：`knowledge/blocks/commands.md` 中有少数命令类型在公开 demo 语料中 0 命中（疑为旧版残留），引用前建议先在 `blueprints/cases/` 找同类用法。

---

## 6. 本项目自研部分的许可

`workflows/`、`blueprints/`、`knowledge/system-of-systems/`、`knowledge/lessons/`、`SKILL.md`、`config.yaml`、`README.md`
为本项目自研或实测归纳，**目前未单独声明开源许可**。如需对外开源，请另行补充 `LICENSE`。
