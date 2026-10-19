# 指挥链与 C2（command-chain）

> **素材来源**：样例工程 `side/red.txt`、`side/blue.txt`、`processor/*`、`global_script.txt`。
> 事实依据以样例为准；通用方法论标注「待校验」。

---

## 1. 建立指挥关系的三种写法

| 写法 | 位置 | 语义 |
| :-- | :-- | :-- |
| `command_chain <链名> <上级实例名>` | 平台**实例**内（`side/*.txt`） | 加入某条指挥链，上级是某实例 |
| `command_chain <链名> SELF` | 平台实例内 | **自己是指挥节点**（链首） |
| `commander <上级实例名>` | 平台实例内 | 直接指定上级 |
| `commander SELF` | 平台实例内 | 自己为最高指挥 |

样例中的实际写法：

```text
# 上级（指挥节点）：GBI_BATTERY_322860
platform GBI_BATTERY_322860 GBI_BATTERY
   side red
   commander SELF
   command_chain CmdChain_1 SELF
end_platform

# 下级：RED_EWR_322728 与 GBI_LAUNCHER_322857 都挂在它下面
platform RED_EWR_322728 RED_EWR
   commander GBI_BATTERY_322860
end_platform

platform GBI_LAUNCHER_322857 GBI_LAUNCHER
   commander GBI_BATTERY_322860
end_platform
```

> ⚠️ **`command_chain` / `commander` 里写的是「平台实例名」**（如 `GBI_BATTERY_322860`），**不是类型名**。

---

## 2. 指挥链的典型形态

```
GBI_BATTERY_322860  （SELF，链首）
   ├── RED_EWR_322728          （预警雷达）
   └── GBI_LAUNCHER_322857     （发射车）
```

**层级原则**：上级负责**任务分配与态势汇总**，下级负责**执行与上报**。

---

## 3. 任务下发与回报

样例 `global_script.txt` 中的全局变量揭示了任务的交互机制：

| 变量 | 作用 |
| :-- | :-- |
| `Map<string,int> platformTaskMap` | 平台 → 当前任务 ID |
| `Map<string,bool> task_dispatch_ack_map` | **任务下发确认**（下级 → 已收到） |
| `Map<string,bool> cmdNewTaskFlag` / `Map<string,int> cmdNewTaskId` | **跨平台任务注入**（新任务） |
| `Map<string,bool> cmdRecallFlag` / `Map<string,int> cmdRecallTaskId` | **任务召回** |

**流程（推断，待校验）**：

```
上级：下发任务 → cmdNewTaskFlag[name]=true, cmdNewTaskId[name]=<id>
下级：收到并 ACK → task_dispatch_ack_map[name]=true
上级：回收任务 → cmdRecallFlag[name]=true, cmdRecallTaskId[name]=<id>
```

---

## 4. 航迹上报与态势共享

处理器层面的上报写法（见 `blueprints/fragments/processor/track_processor.txt.tpl`）：

```text
processor GBI_DATA_MGR WSF_TRACK_PROCESSOR
   report_to
   commander
   via DATALINK            ← 经由哪条数据链
   to gbi_sub_net          ← 报到哪个子网
   purge_interval 60 s     ← 航迹老化时间
end_processor
```

| 关键字 | 含义 |
| :-- | :-- |
| `report_to` | 允许上报航迹 |
| `commander` | 报给上级 |
| `via <comm名>` | 用哪条通信链路 |
| `to <网络名>` | 报到哪个网络 |
| `purge_interval` | 航迹清除间隔 |

---

## 5. 信息流变量（业务约定）

样例中各处理器的 `script_variables` 均含：

```text
extern Map<string, Array<string>> InformationInputFlow;
extern Map<string, Array<string>> InformationOutputFlow;
```

| 变量 | 语义 |
| :-- | :-- |
| `InformationInputFlow` | 该处理器的**信息输入流**声明 |
| `InformationOutputFlow` | 该处理器的**信息输出流**声明 |

平台级也有一份（`platform/*.txt`）：

```text
script_variables
   Map<string, string> InformationInputFlow = {};
   Map<string, string> InformationOutputFlow = {};
end_script_variables
```

> 这是**体系信息流的声明式描述**——用它可以静态看出信息在体系中的流向。生成体系工程时应保留。

---

## 6. 战备等级（待校验）

样例中平台 `script_variables` 含 `string zhanbeiLevel;`，与任务类型 `zhanbeidengjizhuanjin`（战备等级转换，ID=12）呼应。

- **取值**：未在样例中给出 → **待业务确认**。
- **转换条件**：未在样例中给出 → **待业务确认**。

---

## 7. 生成检查清单

- [ ] 每条指挥链有且仅有一个 `SELF` 链首
- [ ] 下级的 `commander` / `command_chain` 指向**真实存在的实例名**
- [ ] 上报处理器的 `via` 指向真实 `comm/` 中的 comm 名
- [ ] `to` 指向 `network/` 中真实网络名
- [ ] 平台的 `internal_link` 指向真实处理器名
- [ ] `InformationInputFlow` / `InformationOutputFlow` 已声明
