# knowledge — 知识库总索引

> **本目录回答"为什么这样写"**：AFSIM 语言、块参数、体系方法论、踩过的坑。
> 全是**只读基线**（运行期不改）；本项目新增的教训写工作空间 `.afsim-forge/lessons/`。
>
> **不在这里找的东西**：目录结构 / 骨架 / 完整工程案例 → 去 `blueprints/`。

---

## 1. 按"我要查什么"找

| 你要解决的问题 | 去哪 | 规模 |
| :-- | :-- | :-- |
| 这个**块/命令**的完整语法是什么？有哪些子命令？ | `blocks/commands.md` | 557 行 |
| 这个 **mover 类型**有哪些参数？该选哪种？ | `blocks/movers.md` | 456 行 |
| 这个**传感器**（雷达 / ESM / EO-IR）参数怎么填？ | `blocks/sensors.md` | 620 行 |
| 我这么写**为什么报错**？有没有已知坑？ | `blocks/pitfalls.md` | 283 行 |
| AFSIM **语言基础**（类型、运算、控制流） | `language/grammar.md` | 144 行 |
| **脚本语法**的硬规则（无三元、无强转、无 `fmod`…） | `language/script-syntax.md` | 290 行 |
| **脚本 API**：`WsfPlatform` / `WsfSensor` / `WsfWeapon` 有哪些方法？ | `language/script-api.md` | 620 行 |
| **脚本类型**（`script` / `on_initialize` / `on_update` 等） | `language/script-types.md` | 63 行 |
| **消息类型**（`WsfMessage` 体系、平台/传感器/处理器间通信） | `language/messages.md` | 477 行 |
| **体系仿真**怎么做：指挥链、杀伤链、传感器组网、任务分类、效能指标 | `system-of-systems/`（见其 `README.md`） | 6 篇 |
| 校验**报错关键字**对应哪条教训？ | `lessons/errors.md` → `lessons/index.md` → `lessons/root-causes.md` | 277 / 64 / 322 行 |

---

## 2. 四个子目录

| 子目录 | 定位 | 一句话 |
| :-- | :-- | :-- |
| `language/` | **语言与脚本层** | 语言怎么写、脚本怎么调 API、消息怎么发 |
| `blocks/` | **块与参数层** | 每个块有哪些参数、每种类型怎么配 |
| `system-of-systems/` | **体系方法论层** | 多平台怎么协同、任务怎么分配、效能怎么量 |
| `lessons/` | **经验层** | 踩过的坑：现象 → 归类 → 根因 → 修法 |

**分工**：`language/` 与 `blocks/` 是**规范**（权威描述"正确写法"）；`lessons/` 是**经验**（"为什么会错"）。两者互补、不重复。

---

## 3. 与 `blueprints/` 的边界

| 问题 | 去 `blueprints/` | 来 `knowledge/` |
| :-- | :-- | :-- |
| 文件该放哪个目录 | ✔ `blueprints/layout/layout.md` | |
| 根文件骨架怎么写 | ✔ `blueprints/skeleton/` | |
| 完整工程长什么样 | ✔ `blueprints/cases/` | |
| `sensor` 块有哪些参数 | | ✔ `blocks/sensors.md` |
| 脚本里能不能用三元运算符 | | ✔ `language/script-syntax.md` |
| 这个报错什么意思 | | ✔ `lessons/errors.md` |

---

## 4. 使用注意

- 本目录文件**体量较大**（合计约 4,900 行），**按需逐个加载**，不要一次全读。
- 少数文件的头部有「待校验」标记 —— 表示该结论来自**推断**而非实测，用于生成时可参考但**不应作为唯一依据**；遇到与 `blueprints/cases/` 实测案例冲突时，**以案例为准**。
- **来源与许可**：`language/` 与 `blocks/` 的文档**整体移植自第三方开源项目 AFSIM Script Generator**（作者 **lookingforfeng**，README 声明 **MIT**，快照内无 LICENSE 文件）；本项目仅做**重命名与目录重排**，正文未改写。移植清单与改动说明见 `../NOTICE.md`。
