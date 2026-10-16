# 缺省值清单（defaults）

> 本文件是 `SKILL.md`「缺省值」章节的数据源。
> 生成时**先按缺省值补全，再向用户确认关键项**；不要因为缺参数而反复追问。

---

## 1. 工程级

| 参数 | 缺省值 | 说明 |
| :-- | :-- | :-- |
| 想定名 | `<主题拼音>_<日期>` | 无中文、无空格 |
| `end_time` | `10 m` | 入口文件；单位必带 |
| `start_date` | 当前日期 | 与 `run.json` 的 `scenariosTime.startDate` 一致 |
| `start_time` | `00:00:00` | 与 `run.json` 的 `scenariosTime.startTime` 一致 |
| `event_output` | `enable all` | 后期可收敛为逐项 `enable` |
| `event_pipe` | `enable AIRCOMBAT` / `TRACK_UPDATE` / `BEHAVIOR_TOOL` | 与样例一致 |
| 阵营 | 红 `red` / 蓝 `blue` | 对应 `side/red.txt`、`side/blue.txt` |
| `run.json` 输出开关 | `recordAer=1` / `recordEvent=0` / `recordLog=1` | |
| `run.json` 的 `scenariosId` | **`0`（留空）** | 业务侧填充，**不自行编造** |
| `run.json` 的 `continueTime` | `1440` | 分钟 |

---

## 2. 组件级

| 参数 | 缺省值 |
| :-- | :-- |
| 平台基类型 | `WSF_PLATFORM`（**必写**） |
| 平台生存性 | `indestructible destructible` + `on_broken remove` |
| 平台 `aux_data` | `int health_point_num = 100` / `double health_point_percent = 100` |
| 通信 `comm` | `WSF_COMM_TRANSCEIVER`，`on` + `operational`，`transfer_rate 100 mbits/sec` |
| 雷达签名 | `radar_signature <名>` → `constant 1 m^2` |
| 红外签名 | `infrared_signature <名> WSF_INFRARED_SIGNATURE` → `constant 50000 w/sr` |
| 光学签名 | `optical_signature <名> WSF_OPTICAL_SIGNATURE` → `constant 20 m2` |
| 地面机动 | `WSF_GROUND_MOVER`，`on`，`update_interval 1 s`，`at_end_of_path extrapolate` |
| 航迹处理器 | `processor data_mgr WSF_TRACK_PROCESSOR` |
| 网络 | `WSF_COMM_NETWORK_AD_HOC`，`update_rate 1 s` |
| 媒介 | `WSF_COMM_MEDIUM_UNGUIDED`，`channels 10`，`use_sharing true`，`propagation_speed 3e8 m/s`，`transfer_rate 100 mbits/s` |
| 杀伤效能 | `WSF_GRADUATED_LETHALITY`，`incidental_damage_allowed false`，`remove_weapon_platform true`，`discrete`，`use_2d_radius`，`radius_and_pk 2 m 1` |

---

## 3. 不由本 skill 生成（须人类提供）

| 内容 | 处理 |
| :-- | :-- |
| `common/` 数据表（弹道表等） | **只建目录、不造数据**；若工程引用，须在交付说明中**列出待补清单**（文件名 + 用途 + 被谁引用） |
| `run.json` 的 `scenariosId` | 留空 `0`，业务侧填充 |
| 真实平台性能参数（雷达功率、导弹推力等） | 优先从 `refs/examples/` 与样例工程取用；无依据时**标注"待确认"**，不编造 |

---

## 4. 使用规则

1. **可省略即省略**：用户没提的参数，按上表补全，**不要追问**。
2. **只追问关键项**：想定名、阵营、平台清单、仿真时长这 4 项若完全无法推断，才向用户澄清。
3. **补全后要标注**：生成的工程需在交付说明中列出"本次采用的缺省值"，便于用户复核。
4. **禁止编造**：物理性能参数、业务 ID、数据表内容一律不编造。
