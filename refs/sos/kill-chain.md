# 杀伤链（kill-chain）

> **素材来源**：样例工程 `event_pipe.txt`、`processor/GBI_*`、`weapon/GBI.txt`、`side/red.txt`。
> 通用方法论标注「待校验」。

---

## 1. 杀伤链五环

```
① 探测（Detect）→ ② 跟踪（Track）→ ③ 决策（Decide）→ ④ 交战（Engage）→ ⑤ 评估（Assess）
```

| 环节 | 体系中的承担者 | AFSIM 中的体现 |
| :-- | :-- | :-- |
| ① 探测 | 预警雷达（`RED_EWR`） | `sensor/`（`WSF_RADAR_SENSOR`，SEARCH 模式） |
| ② 跟踪 | 跟踪雷达（`EWR_TTR`）+ 航迹管理 | `sensor/`（TRACK 模式）+ `WSF_TRACK_PROCESSOR` |
| ③ 决策 | 指挥单元（`GBI_BATTERY`） | `WSF_TASK_PROCESSOR` + 任务下发 |
| ④ 交战 | 发射车（`GBI_LAUNCHER`）+ 拦截弹 | `weapon/` + `WSF_EXPLICIT_WEAPON` + 制导/引信处理器 |
| ⑤ 评估 | 拦截评估处理器 | `processor/GBI_INTERCEPT_ASSESS.txt` + 毁伤 `weapon_effects/` |

---

## 2. 样例工程中的杀伤链处理器链

GBI 拦截弹内部挂了一串专用处理器，正是杀伤链的实现：

| 处理器 | 类型 | 环节 |
| :-- | :-- | :-- |
| `GBI_LAUNCH_PREP` | — | 发射准备 |
| `GBI_GUIDANCE` | — | 制导（中段/末段） |
| `GBI_SEEKER` | — | 导引头（末制导） |
| `GBI_FUSE` | `WSF_AIR_TARGET_FUSE` | **引信**（起爆控制） |
| `GBI_INTERCEPT_ASSESS` | — | **拦截评估**（⑤） |
| `GBI_LETHALITY` | `weapon_effects` `WSF_GRADUATED_LETHALITY` | 毁伤判定 |

发射平台侧：

| 处理器 | 类型 | 作用 |
| :-- | :-- | :-- |
| `GBI_DATA_MGR` | `WSF_TRACK_PROCESSOR` | 航迹管理（②） |
| `GBI_TASK_MGR` | `WSF_TASK_PROCESSOR` | 任务管理（③） |
| `GBI_PROCESSOR_WITH_EWR_GUIDANCE` | — | 用预警雷达引导 |

---

## 3. 关键事件（`event_pipe` / `event_output`）

| 事件 | 环节 | 说明 |
| :-- | :-- | :-- |
| `SENSOR_TRACK_INITIATED` | ② | 航迹建立 |
| `SENSOR_TRACK_UPDATED` | ② | 航迹更新 |
| `PLATFORM_INITIALIZED` | — | 平台初始化 |
| `PLATFORM_BROKEN` | ⑤ | 平台被毁 |
| `WEAPON_FIRED` | ④ | 武器发射 |
| `WEAPON_HIT` | ④⑤ | 命中 |
| `WEAPON_MISSED` | ④⑤ | 未命中 |

**`event_pipe.txt` 中的类别**（决定 `.aer` 记录什么）：

```text
event_pipe
   file output/$(CASE).aer
   enable AIRCOMBAT
   enable TRACK_UPDATE
   enable BEHAVIOR_TOOL
end_event_pipe
```

---

## 4. 时间线口径（用于 KPI）

一条完整杀伤链的关键时间点：

```
t0  目标出现
t1  首次探测（SENSOR_TRACK_INITIATED，SEARCH 雷达）
t2  航迹交接给跟踪雷达 / 指挥节点
t3  任务下发（WEAPON 待发）
t4  武器发射（WEAPON_FIRED）
t5  命中/未命中（WEAPON_HIT / WEAPON_MISSED）
t6  评估完成（PLATFORM_BROKEN）
```

| 指标 | 定义 |
| :-- | :-- |
| **探测时延** | `t1 - t0` |
| **决策时延** | `t3 - t2` |
| **交战时延** | `t5 - t4` |
| **杀伤链闭合时间** | `t5 - t1`（**核心指标**） |
| **评估时延** | `t6 - t5` |

> 时间戳可从 `output/$(CASE).evt` 事件记录中提取。

---

## 5. 杀伤链的"断链"分析

体系仿真的核心问题之一：**链条在哪一环断掉？**

| 断点 | 现象 | 排查方向 |
| :-- | :-- | :-- |
| ① 探测失败 | 无 `SENSOR_TRACK_INITIATED` | 传感器未开机 / 功率不足 / 目标 RCS 太低 / 超出探测范围 / 被地形遮蔽 |
| ② 跟踪丢失 | 有 INITIATED 无持续 UPDATED | `frame_time` 过大 / `hits_to_maintain_track` 过高 |
| ②→③ 交接失败 | 跟踪雷达无航迹 | `internal_link` 未连 / `report_to` 未配 / 数据链不通 |
| ③ 决策失败 | 无任务下发 | `WSF_TASK_PROCESSOR` 未配 / 指挥链断裂 / 目标不在交战包线 |
| ④ 发射失败 | 无 `WEAPON_FIRED` | `quantity` 为 0 / 目标超出 `unknown_target_range` / 发射条件未满足 |
| ④ 制导失败 | 有 FIRED 无 HIT | 制导处理器 / 导引头 / 引信配置 |
| ⑤ 毁伤失败 | 有 HIT 无 `PLATFORM_BROKEN` | `weapon_effects` 的 `radius_and_pk` 过小 / `use_2d_radius` 与目标高度不匹配 |

---

## 6. 待校验项

- 各处理器的**内部逻辑**（`GBI_GUIDANCE` / `GBI_SEEKER` / `GBI_INTERCEPT_ASSESS` 的脚本未在样例规范中展开）；
- 任务下发到发射的**判定条件**；
- 毁伤判定与**评估口径**的正式定义。
