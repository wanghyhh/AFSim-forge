# 知识资产来源与许可（SOURCE）

本目录（`refs/knowledge/`）与 `refs/examples/` 的文档**整体移植自第三方开源项目**，为遵守许可与尊重原作者，特此声明来源。

---

## 来源项目

| 项 | 内容 |
| :-- | :-- |
| 项目名 | **AFSIM Script Generator**（`afsim-script-generator`） |
| 仓库目录 | `GitHub项目/afsimskills-main/`（本仓库内的快照） |
| 原作者 | **lookingforfeng** |
| 声明许可 | **MIT**（README 徽章标注；**注：该仓库快照中未包含 LICENSE 文件**，本移植按 MIT 处理并保留署名） |
| 适用版本 | AFSIM 2.9.0 |

---

## 移植清单

### `refs/knowledge/`（12 篇 references）

| 文件 | 说明 |
| :-- | :-- |
| `language_grammar.md` | 语言语法 |
| `commands.md` | 命令速查 |
| `commands_reference.md` | 命令完整参考 |
| `mover_reference.md` | 22+ 机动类型参考 |
| `sensor_types_reference.md` | 雷达 / ESM / EO-IR 传感器参数 |
| `script_api_reference.md` | WsfPlatform / WsfSensor / WsfWeapon 等 API（158 方法） |
| `script_types.md` | 脚本类型 |
| `script_syntax_critical.md` | ⭐ 脚本编写关键语法规则（必读） |
| `message_types_reference.md` | WsfMessage 体系与消息类型 |
| `common_mistakes.md` | 10 条常见错误 |
| `examples.md` | 完整示例与常用模式 |
| `file_structure.md` | 文件结构（**已加适配头**，见下） |

### `refs/examples/`（4 个完整场景）

| 文件 | 场景 |
| :-- | :-- |
| `air_to_air_bvr.txt` | 超视距空战 |
| `air_to_ground_strike.txt` | 空对地打击 |
| `iamd_layered_defense.txt` | 分层防御（体系类，最贴近本业务） |
| `isr_surveillance.txt` | ISR 侦察监视 |

---

## 本项目的改动

移植遵循「**整体移植、不改原文**」原则，仅做以下最小改动：

1. **`file_structure.md` 添加了适配头** —— 原文描述的是**单文件场景**，与本业务的**多目录工程**在"组织层"冲突。
   适配头声明：**语法层内容有效，组织层一律以 `refs/structure/project-layout.md` 为准**。
2. 文件**未做任何内容改写**，保持原样。

---

## 使用注意

- **语法层**（块结构、`end_*`、单位、坐标、mover/sensor/weapon/processor 参数、脚本 API）—— **直接可用**。
- **组织层**（"一个 `.txt` 装下所有内容"的写法）—— **不可用**，以 `refs/structure/` 为准。
- `refs/examples/` 的 4 个场景定位为 **"语法范本"**，**不是结构范本**。

---

## 后续计划

本阶段为**整体移植**；后续迭代将按需**精选改写**，以去芜存菁并适配多目录工程结构。
