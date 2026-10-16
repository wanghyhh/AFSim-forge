# 组件片段（templates/fragments）

> **定位**：可复用的**组件片段**，按**目标目录**分类。
> 每个片段 = 落到某个子目录的**一个 `.txt` 文件**，**自带其 `include_once` 依赖头**——直接决定生成文件落在哪、依赖谁。
> **不逐字复刻样例**：片段是「说明 + 可填骨架」，占位符用 `{{...}}`。

---

## 分类与目标目录

| 片段目录 | 目标目录 | 块类型 | 一个文件放几个 |
| :-- | :-- | :-- | :-- |
| `platform/` | `platform/` | `platform_type`…`end_platform_type` | 1 个类型 |
| `sensor/` | `sensor/` | `antenna_pattern` + `sensor`…`end_sensor` | 1 个 sensor |
| `weapon/` | `weapon/` | 弹体 `platform_type` + `weapon`…`end_weapon` | 1 组 |
| `mover/` | `mover/` | `mover`…`end_mover`（可含 `aero`） | 1 个 |
| `comm/` | `comm/` | `comm`…`end_comm` | 1 个 |
| `processor/` | `processor/` | `processor`…`end_processor` | 1 个 |
| `signatures/` | `signatures/` | `radar_signature` / `infrared_signature` / `optical_signature` | 1 个 |
| `weapon_effects/` | `weapon_effects/` | `weapon_effects`…`end_weapon_effects` | 1 个 |
| `side/` | `side/` | `platform`…`end_platform`（**实例**） | 1 个实例 |
| `medium/` | `medium/` | `medium`…`end_medium` + `medium.txt` 汇总 | 1 个媒介 |
| `network/` | `network/` | `network`…`end_network` + `network.txt` 汇总 | 1 个网络 |

---

## 使用规则

1. **取片段 → 改名 → 替换占位符 → 落到目标目录**。
2. **改完必须检查 `include_once` 依赖头**是否指向真实存在的文件。
3. **新建 `platform/*.txt` 后，必须登记进 `setup.txt`**。
4. **语法细节**（参数名、取值）查 `refs/knowledge/`，不要凭记忆写。
5. **物理性能参数**（雷达功率、导弹推力等）优先从 `refs/examples/` 与样例工程取；无依据时**标注"待确认"**，不编造。

---

## 依赖关系速记

```
side/<实例>  →  platform/<类型>
platform/<类型>  →  mover/ · sensor/ · weapon/ · comm/ · signatures/ · processor/
weapon/<武器>  →  mover/(弹体) · weapon_effects/ · signatures/ · processor/
network/<网络>  →  comm/（通过 member <实例名> <comm名>）
```
