# 体系仿真概念（concepts）

> **范围**：先求**大而全**，后续再精简。
> **事实依据**：以项目仓库内的样例工程（`docs/体系工程文件说明-20260922/`，**skill 外，仅作溯源**）与《样例工程规范》为准；
> 更可靠的正例是 `blueprints/cases/` 的 5 个实测案例。通用方法论部分标注「待校验」。

---

## 1. 体系 vs 平台

| 维度 | 平台级仿真 | **体系级仿真** |
| :-- | :-- | :-- |
| 关注对象 | 单个平台的能力与行为 | **多平台协同完成作战任务** |
| 核心问题 | 这个平台能不能打到目标 | **这套体系能不能闭合杀伤链** |
| 关键要素 | mover / sensor / weapon | 指挥链、信息流、任务分配、协同 |
| 典型指标 | 命中率、探测距离 | **杀伤链闭合率、任务完成时间、体系生存率** |

**体系仿真的本质**：把「平台」当作**节点**，把「指挥链 + 通信网络」当作**边**，研究**信息如何在体系中流动、任务如何被分配、火力如何被组织**。

---

## 2. 体系的三层结构（本业务样例的形态）

样例工程（反导拦截体系）体现了一个典型的**分层防御体系**：

```
┌─ 感知层（Sensor） ───────────────────────────────────────────┐
│   RED_EWR                早期预警雷达（大范围搜索）          │
│   EWR_TTR                跟踪制导雷达（精确跟踪）            │
└──────────────────────────────────────────────────────────────┘
              ↓ 航迹上报（report_to / DATALINK）
┌─ 指挥层（C2） ───────────────────────────────────────────────┐
│   INTERCEPTOR_BATTERY    指挥/火控单元（WSF_TASK_PROCESSOR） │
│   INTERCEPTOR_DATA_MGR   航迹管理（WSF_TRACK_PROCESSOR）     │
└──────────────────────────────────────────────────────────────┘
              ↓ 任务下发 / 目标指示
┌─ 交战层（Shooter） ──────────────────────────────────────────┐
│   INTERCEPTOR_LAUNCHER   发射车（武器 + 装订）               │
│   INTERCEPTOR（弹）      拦截弹（制导 + 引信 + 毁伤）        │
└──────────────────────────────────────────────────────────────┘
              ↑ 目标
        TARGET_1 / TARGET_2（来袭目标）
```

**对应到工程结构**：

| 层 | 工程中的体现 |
| :-- | :-- |
| 感知层 | `sensor/`（雷达）+ `platform/`（EWR 平台）+ `signatures/`（目标特性） |
| 指挥层 | `processor/`（`WSF_TRACK_PROCESSOR` 航迹管理、`WSF_TASK_PROCESSOR` 任务管理） |
| 交战层 | `weapon/`（武器 + 弹体）+ `weapon_effects/`（毁伤） |
| 连接 | `comm/`（数据链）+ `network/`（网络）+ `internal_link`（平台内连线） |
| 指挥关系 | `side/*.txt` 中的 `command_chain` / `commander` |
| 公共逻辑 | `global_script.txt`（任务类型、公共函数） |

---

## 3. 体系的四类关键关系

| 关系 | AFSIM 中的写法 | 说明 |
| :-- | :-- | :-- |
| **挂载**（平台有什么） | `platform_type` 内 `sensor` / `weapon` / `comm` / `mover` / `processor` 块 | 定义平台的能力 |
| **内部连线**（平台内谁连谁） | `internal_link <处理器名>` | 传感器/通信 → 处理器 |
| **指挥**（谁指挥谁） | `command_chain <链名> <上级>` / `commander <上级>` | 建立 C2 层级 |
| **组网**（谁能和谁通） | `network` 块 `comm_list` → `member <实例名> <comm名>` | 数据链可达性 |

> **注意**：`internal_link` 用**组件名**；`network.member` 用**平台实例名**。

---

## 4. 体系仿真的建模顺序（推荐）

```
① 定义阵营与目标         side/ + platform/TARGET
② 搭感知层               sensor/ + platform/(EWR)
③ 搭指挥层               processor/(TRACK + TASK) + comm/ + network/
④ 搭交战层               weapon/ + weapon_effects/ + platform/(发射平台)
⑤ 建立指挥链             side/*.txt 的 command_chain / commander
⑥ 建立信息流             internal_link + network.member + 处理器 report_to
⑦ 部署实例               side/red.txt · side/blue.txt（position / aux_data）
⑧ 定义任务与脚本         global_script.txt（任务类型枚举、公共函数）
⑨ 定义评估口径           output/ 的 .evt / .aer + 指标
```

---

## 5. 体系效能的关键问题（对应 knowledge/system-of-systems/kpi-metrics.md）

1. **探测**：目标在何时、被谁、在多大距离上首次发现？
2. **跟踪**：航迹是否连续？在多层之间是否交接成功？
3. **决策**：从发现到任务下发耗时多少？
4. **交战**：是否成功发射？是否命中？
5. **闭环**：整条**杀伤链**是否闭合？闭合时间多长？

---

## 6. 待校验项

以下为通用方法论推断，**尚未经本业务样例证实**，使用前需核对：

- 各层之间的**标准上报周期**与**任务下发协议**；
- 「战备等级」（`zhanbeiLevel`）等业务状态的具体取值与转换条件；
- 体系级 KPI 的**正式定义与口径**（见 `kpi-metrics.md`）。
