# 完整工程案例（refs/demos）

> ✅ **定位：完整工程范本（工程级）。**

本目录的案例来自 **AFSIM 官方 demo**（`docs/afsim-demos/`），是**多目录工程**写法 ——
与本 Skill 的结构**一致**（经"**仅结构改造、内容未增删**"的归一化处理）。

| 用途 | 是否适用 |
| :-- | :-- |
| 看 **一个完整工程长什么样**（结构 + 全文） | ✅ 适用 |
| 看 **块之间如何装配**（include 链、自下而上） | ✅ 适用 |
| 看 **中等规模的脚本组织** | ✅ 适用 |
| 查 **单条块语法 / 参数 / 取值** | 用 `refs/knowledge/` 更快 |

> **与 `refs/examples/` 的分工**：examples 教"**一句话怎么说**"（单文件语法片段），demos 教"**一整篇怎么组织**"（完整工程）。
> **结构权威**仍是 `refs/structure/project-layout.md`；本目录案例是**佐证与参照**，不是新权威。

---

## 案例清单

| 案例 | 任务类型 | 文件数 | 总行数 | 结构 | 自包含 | 亮点 | 何时看 |
| :-- | :-- | :-: | :-: | :-- | :-: | :-- | :-- |
| [`ad_hoc`](ad_hoc.md) | 通信 / 组网：自组织网络 + 动态路由 | 19 | 522 | 根 6 + 目录 6 | ✅ | 动态组网、贪心路由、`WsfDraw` 绘图、三阵营 | 建**通信组网类**想定时；或看 `network` / `router_protocol` / `observer` / 顶层 `execute` 怎么写 |
| [`launcher`](launcher.md) | 陆基防空：SAM 拦截（探测→交战→发射） | 16 | 462 | 根 5 + 目录 9 | ✅ | 完整武器链路（`aero`→弹体→`weapon`→`weapon_effects`）、任务处理器状态机、事件输出白名单 | 建**防空 / 武器交战类**想定时；或看 `weapon` 两段式、`aero` 块、`WSF_TASK_PROCESSOR` 状态机怎么写 |
| [`outer_air_battle`](outer_air_battle.md) | 空战体系对抗：航母战斗群 CAP 拦截轰炸机群 | 39 | 2,590 | 根 6 + 目录 11 | ⚠️→✅（已内化 `base_types` 依赖） | 体系级派单（`CreatePlatform` + `AssignTask`）、甲板周期出动、CAP 驻留/加油/返场定时器、多机种两级派生、武器链路 ×2、表驱动 `launch_computer` | 建**体系对抗 / 空战 / 任务分配类**想定时；或看**多机种派生**、**任务剖面飞行**（`label`/`goto`/`execute`）、**运行期造机**怎么写 |
| [`ship_ad`](ship_ad.md) | 水面舰艇：反舰导弹交战（含舰载直升机中继制导） | 58 | 3,031 | 根 6 + 目录 11 | ✅ | **中继制导闭环**（发射通报 → 派 `Update` 任务 → 上行送航迹）、`launch_computer` 两层聚合、拦截包线 `zone` + `WithinZoneOf`、武器链路 ×4、战术处理器族（4 态状态机 ×3 同构）、`filter` + `track_manager`、三类签名齐备 | 建**水面舰艇 / 反舰交战类**想定时；或看**第三方中继制导**、**包线参数化**、**`launch_computer` 分派**怎么写 |
| [`space_operations`](space_operations.md) | 天基：激光通信星座 + 脚本化动态组网 | 23 | 1,429 | 根 6 + 目录 9 | ✅ | **运行期造星座**（`WsfConstellationMaker` → 回调 `StarlinkSetup` / `AddInPlaneLink`）、**运行期换网**（`WsfNetwork.*`）、自定义脚本类 `script_struct CommLink` + `AuxData` 挂对象、激光通信模型（`WSF_LASER_TRANSCEIVER` + `WSF_OPTICAL_ATTENUATION`）、五组组网 + `category`、七态建链状态机、`WsfDraw` 画动态链路 | 建**天基 / 通信组网类**想定时；或看 `script_struct`、`WsfConstellationMaker`、`comm`/`network`/`group` 块怎么写 |

> **一案例一文档**：每个案例只对应 **一个** `.md`（早先按大案例切出的 `outer_air_battle.components.md` / `ship_ad.components.md`
> 两份续篇**已并入主文档**，不再单独存在）。
> `space_operations` 是**选摘**案例（原 demo 132 文件 / 36 个入口候选，只收 `lasercomm_scripted.txt` 闭包 15 个源文件）；
> `outer_air_battle` 把 `base_types` 的 4 个武器文件**内化**进工程，故自包含。

---

## 文档结构（每个案例一份 `.md`，五段式）

| 段 | 内容 |
| :-- | :-- |
| 元信息 | 任务类型 / 来源 / 改造说明 / 规模 / 结构 / 自包含 / 许可限制 / 亮点 / 对应（`>` 引用块） |
| `§1 文件结构` | `tree`（逐文件标注行数与中文注记）+ 范围说明（哪些源文件不在本闭包内） |
| `§2 案例详细说明` | 任务背景与态势、兵力编成与阵营、装配链、**组件职责逐项说明**、运行时序与数据流、关键脚本逻辑、可复用要点与陷阱 |
| `§3 完整脚本全文` | 全工程文件按**装配顺序**逐一给出（`### ===== FILE: <相对路径> =====` + `text` 围栏） |
| `§4 使用指引` | 4.1 看点速览 / 4.2 怎么跑 / 4.3 可借鉴·勿照抄 / 4.4 对应关系 / 4.5 改造中实测到的坑 / 4.6 许可说明 |

**一致性保证**：`§1` 的 tree 行数、元信息「规模」数字、`§3` 全文正文**全部以归一化工程为准现算**，
校验时逐项比对「tree ↔ 工程 ↔ 全文」三方一致（见下）。

---

## 来源与校验

| 项 | 说明 |
| :-- | :-- |
| **来源** | AFSIM 官方 demo（`docs/afsim-demos/`）的**单个入口闭包**：`comm/ad_hoc.txt` · `launcher/1st_run.txt` · `outer_air_battle/OAB_mrc_erc.txt` · `ship_ad/1st_asm.txt` · `space_operations/lasercomm_scripted.txt` |
| **处理** | **仅结构改造，内容未增删** —— 三重复核：① **块计数对比**；② **行级保真审计**（逐行比对，差异只剩 `include` / `include_once` 路径改写与依赖补齐）；③ **include 目标存在性检查**（0 条悬空）。唯一新增为规范要求的组件依赖 `include_once` 与 `config/run.json` / `output/blank_empty.txt` 骨架 |
| **归一化工程** | 保留在 `docs/afsim-demos-normalized/<案例名>/`（便于直接查看 / 打包） |
| **校验** | 每个案例均经 `mcp__afsim__validate_scenario`（或等价 HTTP `POST /api/v1/scenarios/validate`）→ `valid = true`（**仅语法校验，未跑仿真**） |
| **许可** | 原始文件含 CUI 受控横幅，**原样保留**；使用与再分发须遵守原始许可（另见方案 §12 R1） |

### 本轮复核结论（2026-10-16）

| 案例 | 块计数差异 | 行级审计（丢失 / 新增） | include 悬空 | 语法校验 |
| :-- | :-: | :-: | :-: | :-: |
| `ad_hoc` | 2 行（规范要求的空 `global_environment` 块） | 0 / 0 | 0 | ✅ `valid=true` |
| `launcher` | 0 | 0 / 0 | 0 | ✅ `valid=true` |
| `outer_air_battle` | 0（含 `base_types` 基线） | 0 / 0（内化后） | 0 | ✅ `valid=true` |
| `ship_ad` | 0 | 0 / 0 | 0 | ✅ `valid=true` |
| `space_operations` | 0（30 类块全部一致） | 0 / 0 | 0 | ✅ `valid=true` |

**本轮修复的 4 项问题**（复核中发现 → 已修 → 已复验）：

1. `launcher` 归一化工程曾丢失 4 行源内容（`# simple task processor…`、`#-------…`、`file_path .`、`# common file for selecting…`）→ 已按源顺序补回。
2. `ad_hoc` 工程内曾残留仿真运行产物（`mission.log` / `warlock.log` / `output/ad_hoc.aer` / `output/ad_hoc.evt`）→ 已清理，工程现只含 18 个 `.txt` + `config/run.json`。
3. `ad_hoc` / `space_operations` 入口曾出现**源中不存在**的 `define_path_variable CASE …` 声明（且 `ad_hoc` 还把源字面量改写成了 `$(CASE)`）→ 已移除声明、还原源字面量；口径统一为"**输出文件名照源字面量；只有源本身用 `$(CASE)` 时才保留路径变量**"。
4. CUI 横幅后的排版空行与文件末换行统一对齐源文件；`space_operations` 文档正文末行缺失、`blank_empty` 块多余空行等**文档侧**问题一并消除。

**2026-10-19 第三轮复检**：重跑「文档 ↔ 归一化工程」8 项判据 + 3 项深审，修复 5 类问题（`ad_hoc` / `space_operations` 各 1 处**行号越界**；`outer_air_battle` / `space_operations` 各 1 处**行数口径**；工作区 132 个工程文件由 CRLF **统一为 LF**；`.gitattributes` 注释口径矛盾）。复验：**8 项 × 5 案例全过**、**§2 引用 172 条 + 1 条源引用全部可解析**、**§2.4 覆盖每个文件**、**5/5 语法 `valid=true`**、**块计数 0 差异**。详见方案 §11.7.7。

---

## 使用方式

1. 按案例 `.md` 的 §1 `tree` **复原目录**（路径均相对案例工程根）；`§3` 给出每个文件的全文，可直接复制。
2. 打包 ZIP：**ZIP 名与入口同名**（如 `ad_hoc.zip`，内含 `ad_hoc.txt` 于压缩包根）；且**全工程只能有一个文件与工程名同名**（否则报"启动文件不唯一"）。
3. 结构问题一律查 `refs/structure/`；语法问题查 `refs/knowledge/`。
4. 复核「文档 ↔ 工程」一致性：以 `docs/afsim-demos-normalized/<案例>/` 为基准，逐项比对
   `§1` tree 行数、`§3` 全文正文、元信息「规模」数字三方一致。
