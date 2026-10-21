# 语法摘抄库 · 检索协议

> **本文件是 `knowledge/corpus/` 的唯一检索入口**。读完这一个文件就够开始查，**不需要再读 `00-index.md`**——那是 36 KB 的全量索引，只在需要「类型 → 卷」定位表时才读。

> 分卷最大 1 MB（`10-platform.md`，3.3 万行），**禁止整卷读入上下文**。按下面四类问题选入口，用 `grep` 定位到行号，再用 `Read` 只取那一条（`offset` + `limit`）。

---

## 1. 先判类型，再选入口

| 你此刻的状态 | 入口 | 命中后做什么 |
| :-- | :-- | :-- |
| 「要做某类功能，不知从哪下手」 | `91-feature-files.md` | 挑 1~2 个 demo 文件，去 `demos/` 读它的入口 `.txt` |
| 「知道命令名 / 参数名，不知放哪、怎么写」 | `90-tokens.md` | 拿「所在块类型」→ 回对应分卷搜 `### <块类型>` |
| 「知道 `WSF_XXX` 类型名」 | 各内容卷 | 直接搜标题行，读 1~3 条片段 |
| 「只知道中文功能词」 | `90-tokens.md` 模糊搜 | 先中→英换词（见 §3），再按上一行走 |

## 2. 五条可直接跑的配方

```bash
# ① 按类型名精确找（最常用）：知道 WSF_TRACK_PROCESSOR
grep -n '^### .* · WSF_TRACK_PROCESSOR' 1[0-9]-*.md 2[0-1]-*.md

# ② 按参数名反查：知道 report_interval，不知放哪
grep -n '`report_interval`' 90-tokens.md
#   → 命中行给出「所在块类型 processor」+ 首个出处 → 转 ①

# ③ 按功能词模糊找 token：只知道语义（fusion / jam / report / track）
grep -i 'fusion' 90-tokens.md | head -20

# ④ 按功能主题导航：完全不知道用什么命令
sed -n '/^## 数据链/,/^## /p' 91-feature-files.md

# ⑤ 在全部内容卷里搜某个命令（跨卷，看谁用过）
grep -rn 'report_fused_tracks' 1[0-9]-*.md 2[0-1]-*.md | head -10
```

命中后只读那一条：

```text
Read(file, offset=<命中行号>, limit=40)   # 一条片段通常 20~60 行，含 出处 + 片段 + 要点
```

## 3. 中 → 英检索词对照（语料是英文，先换词再搜）

| 中文 | 英文 token |
| :-- | :-- |
| 数据链 / 上报 | `datalink` `report_to` `report_interval` `comm` `transmitter` |
| 航迹 / 融合 | `track` `track_manager` `fusion_method` `fused_track` `master_track_processor` |
| 传感器 / 探测 | `sensor` `radar` `esm` `ir` `detection` `beam` `mode` |
| 干扰 / 电子战 | `jam` `jammer` `electronic_attack` `electronic_protect` `technique` `attenuation` |
| 武器 / 杀伤 | `weapon` `launch_computer` `weapon_effects` `kill` `pkill` |
| 运动 / 飞行 | `mover` `route` `waypoint` `orbit` `aero` `autopilot` `pid` |
| 编组 / 指挥 | `group` `command_chain` `task` `asset` `commander` `subordinate` |
| 脚本 / 状态 | `script` `on_update` `state` `next_state` `script_variables` |
| 特征 / RCS | `signature` `radar_signature` `infrared_signature` `optical_signature` |
| 输出 / 记录 | `event_output` `event_pipe` `observer` `csv` `log` |
| 区域 / 位置 | `zone` `position` `latitude` `altitude` `heading` |

## 4. 读多少

- **一次 1~3 条片段**足够写出一个块。片段是完整块（含 `end_xxx`），不是碎片。
- 同一类型有多个条目时（不同签名），**先读第 1 条**；不够再读第 2 条，别一次全读。
- 需要「同签名的其它用法」时，看条目里「另见 `文件:行`」，按出处回 `demos/` 读原文。

## 5. 查不到怎么办

```text
grep 无命中 → demo 里确实没有这个语法，不要硬编。按序降级：
  ① 换同义词再搜（§3 表里同一行换一个 token）
  ② 去 91-feature-files.md 找同类功能的 demo，读它的完整工程
  ③ 回 skill 根目录的 `blueprints/cases/`（已验证可跑）与 `knowledge/`（本项目经验）
  ④ 仍无 → 按 AFSIM 手册语法推演，**必须走语法校验**（4_validate.md），不得跳过
```

## 6. 三条禁忌

1. **不要通读分卷**。`10-platform.md` 3.2 万行，读进来只会挤掉真正有用的上下文。
2. **不要抄数值**。片段里的距离/频率/RCS/时间是 demo 为各自想定调的，只学结构。
3. **不要直接复制 `include` 行**。demo 的 include 依赖它自己的目录树与 `common/` 数据表，复制到新工程会「语法对、校验报错」。
