# 工程结构权威说明（project-layout）

> **本文件是 afsim-forge 生成工程的唯一结构依据。**
> 完整规范（含示例片段、常见错误）见 `docs/体系工程文件说明-20260922/样例工程规范.md`。

---

## 1. 目录树

```
<想定名>/
├── <想定名>.txt          ★ 入口文件（严格同名）
├── setup.txt                平台装配
├── event_pipe.txt           aer 记录配置
├── global_env.txt           全局环境
├── global_route.txt         全局航路
├── global_script.txt        全局脚本
├── global_struct.txt        全局结构
├── group.txt                群组
├── zone.txt                 区域
│
├── config/          运行控制（run.json）
├── common/          通用数据表（人类提供）
├── output/          输出产物（含 blank_empty.txt 占位）
├── medium/          媒介模型
├── comm/            通信组件
├── mover/           机动组件
├── network/         网络模型
├── platform/        平台类型
├── processor/       行为组件
├── sensor/          传感器组件
├── side/            阵营实例部署
├── signatures/      目标特性
├── weapon/          武器组件
└── weapon_effects/  杀伤效能组件
```

**9 个根文件 + 14 个目录。**

---

## 2. 根文件

| 文件 | 块 / 语法 | 必含内容 | 必建 |
| :-- | :-- | :-- | :-: |
| `<想定名>.txt` | `define_path_variable` / `include_once` / `event_output` / `log_file` / `end_time` / `start_date` / `start_time` | 路径变量 + 装配链 + 仿真控制；**不定义模型** | ✔ |
| `setup.txt` | 纯 `include_once` | 所有 `platform/*.txt`，一平台一行 | ✔ |
| `event_pipe.txt` | `event_pipe`…`end_event_pipe` | `file output/$(CASE).aer` + `enable` 列表 | ✔ |
| `global_env.txt` | `global_environment`…`end_global_environment` | 可空块 | ✔ |
| `global_route.txt` | `route`…`end_route` | 全局航路（可复用） | ○ |
| `global_script.txt` | `zone` / `script_variables` / `script_struct` / `script` | 公共脚本层（任务类型、公共函数） | ○ |
| `global_struct.txt` | `script_struct`…`end_script_struct` | 自定义数据结构 | ○ |
| `group.txt` | `group`…`end_group` | `WSF_GROUP` 编组 | ○ |
| `zone.txt` | `zone`…`end_zone` | 地理区域 | ○ |

> 「必建 ○」表示按需——**用不到可不建，但入口文件里不得 `include_once` 不存在的文件**。

---

## 3. 目录 → 块类型映射（决定文件放哪）

| 目录 | 块类型 | 一个文件放几个块 | 备注 |
| :-- | :-- | :-- | :-- |
| `platform/` | `platform_type`…`end_platform_type` | 1 个类型 | 头部 include 其依赖 |
| `sensor/` | `antenna_pattern` + `sensor`…`end_sensor` | 1 个 sensor（+ 若干方向图） | 方向图须在前 |
| `weapon/` | 弹体 `platform_type` + `weapon`…`end_weapon` | 1 组 | 两段式 |
| `mover/` | `mover`…`end_mover`（可含 `aero`） | 1 个 | |
| `comm/` | `comm`…`end_comm` | 1 个 | |
| `processor/` | `processor`…`end_processor` | 1 个 | |
| `signatures/` | `radar_signature` / `infrared_signature` / `optical_signature` | 1 个 | 命名 `<对象>_<类型>_SIG` |
| `weapon_effects/` | `weapon_effects`…`end_weapon_effects` | 1 个 | |
| `medium/` | `medium`…`end_medium` + `medium.txt` 汇总 | 1 个媒介 | 汇总只 include |
| `network/` | `network`…`end_network` + `network.txt` 汇总 | 1 个网络 | 汇总只 include |
| `side/` | `platform`…`end_platform`（**实例**） | 按阵营分文件 | `red.txt` / `blue.txt` |
| `config/` | — | `run.json` | JSON，非 AFSIM 语法 |
| `common/` | — | 纯数据表 | **人类提供** |
| `output/` | — | 运行时产物 | 须含 `blank_empty.txt` |

---

## 4. 各目录内容要点

### `platform/`
要素顺序：基类型 `WSF_PLATFORM`（**必写**）→ `side` → `icon` → 生存性（`indestructible destructible` / `on_broken remove`）→ `category` → `aux_data` 业务字段 → 挂载组件（mover / sensor / weapon / comm / processor）→ `internal_link` 内部连线 → `script_variables`。

### `side/`
要素顺序：`platform <实例名> <类型名>` → `side` → `heading` → `position`（**必填**，高度可选）→ `aux_data` → 可选 `edit <组件>` 覆写参数 → `command_chain` / `commander` 指挥关系 → `track` 预置航迹。

> **实例名 = 类型名 + `_` + 业务 code**，如 `GBI_LAUNCHER_322857`。
> `edit` 是实例化关键：类型给默认值，实例局部覆写。

### `sensor/`
层次：`sensor` → `mode`（工作模式）→ `beam`（波束）→ `transmitter` / `receiver`。`antenna_pattern` 必须定义在 `sensor` 之前。

### `weapon/`
两段式：**弹体 `platform_type`**（挂 mover）+ **`weapon` 块**。`launched_platform_type` 指向弹体类型；`weapon_effects` 指向效能定义。

### `network/`
`member <平台实例名> <comm 名>` —— **用实例名，不是类型名**。

### `output/`
必须预建 + `blank_empty.txt` 占位（ZIP 不保留空目录）。

---

## 5. 生成自检清单

- [ ] 入口文件名 = 想定名
- [ ] 入口含 `define_path_variable CASE <想定名>`
- [ ] 所有 `include_once` 目标文件真实存在
- [ ] 新增平台已登记进 `setup.txt`
- [ ] 组件文件头部已 include 全部依赖
- [ ] 每块有 `end_*`，`platform_type` 写了 `WSF_PLATFORM`
- [ ] 所有数值带单位；坐标用 `:` 分隔
- [ ] `side/*.txt` 实例含 `position`，阵营与文件一致
- [ ] `network` 的 `member` 用实例名
- [ ] `output/` 存在且含 `blank_empty.txt`
- [ ] 无中文路径
- [ ] `config/run.json` 的 `scenariosTime` 与入口文件一致，`scenariosId` 留空
