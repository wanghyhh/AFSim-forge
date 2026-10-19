# 任务类型体系（task-taxonomy）

> **素材来源**：样例工程 `global_script.txt` 中的 `getTaskTypeName(int typeId)` 函数。
> 这是本业务**体系仿真的任务分类骨架**——`SimTask` 结构的 `taskTypeId` 即取这些值。
>
> ⚠️ **中文释义为推断，标注「待校验」者需业务确认。**

---

## 1. 任务类型表

| `taskTypeId` | 拼音标识 | 中文（推断） | 备注 |
| :-: | :-- | :-- | :-- |
| 1 | `zhanjijidong` | 战机机动 | |
| 2 | `jiJie` | 集结 | 源码中为驼峰，非全小写 |
| 3 | `kaijinzhankai` | 开进展开 | |
| 4 | `shusanyinbi` | 疏散隐蔽 | |
| 5 | `fangshou` | 防守 | |
| 6 | `cheli` | 撤离 | |
| 7 | `bansui` | 伴随 | |
| 8 | `baowei` | 保卫 / 包围 | **待校验**（两义） |
| 9 | `zhuanli` | 转隶 | |
| 10 | `guijian` | 归建 | |
| 11 | `fenbing` | 分兵 | |
| 12 | `zhanbeidengjizhuanjin` | 战备等级转换 | |
| 13 | `wuxiandianjingmo` | 无线电静默 | |
| 14 | `wuxiandianqiyong` | 无线电启用 | |
| 15 | `zhihuicheqiyong` | 指挥车启用 | |
| 16 | `zhihuicheguanting` | 指挥车关停 | |
| 17 | `jietizhihui` | 接替指挥 | |
| 18 | `leidatance` | 雷达探测 | |
| 19 | `raoguozhangaiqu` | 绕过障碍区 | |
| 20 | `genzong` | 跟踪 | |
| 21 | `zhuiji` | 追击 | |
| 23 | `xunluo` | 巡逻 | |
| 27 | `huoliyazhi` | 火力压制 | |
| 29 | `dianzizhencha` | 电子侦察 | |
| 30 | `dianziganrao` | 电子干扰 | |
| 31 | `tongxinzuwang` | 通信组网 | |
| 32 | `weixingtongxin` | 卫星通信 | |
| 33 | `jidongtongxin` | 机动通信 | |
| 34 | `dizhuangyunshu` | 地装运输 | **待校验** |
| — | `unknown` | 未知 | 兜底值 |

**共 29 个具名任务类型**（ID 有跳号：22 / 24 / 25 / 26 / 28 未定义）。

---

## 2. 分类（推断，待校验）

| 类别 | 任务 |
| :-- | :-- |
| **机动类** | 战机机动(1)、集结(2)、开进展开(3)、疏散隐蔽(4)、撤离(6)、伴随(7)、分兵(11)、巡逻(23)、地装运输(34) |
| **作战类** | 防守(5)、保卫/包围(8)、跟踪(20)、追击(21)、火力压制(27) |
| **指挥类** | 转隶(9)、归建(10)、战备等级转换(12)、指挥车启用(15)、指挥车关停(16)、接替指挥(17) |
| **电子/通信类** | 无线电静默(13)、无线电启用(14)、电子侦察(29)、电子干扰(30)、通信组网(31)、卫星通信(32)、机动通信(33) |
| **探测类** | 雷达探测(18)、绕过障碍区(19) |

---

## 3. 与工程结构的关系

| 元素 | 位置 | 作用 |
| :-- | :-- | :-- |
| `SimTask` 结构 | `global_script.txt` / `global_struct.txt` | 任务的数据结构 |
| `taskTypeId` | `SimTask` 字段 | 取本表的值 |
| `getTaskTypeName(int)` | `global_script.txt` | ID → 名称（用于状态上报） |
| `platformTaskMap` | `global_script.txt` | 平台 → 当前任务 ID |
| 任务下发/回报 | `processor/`（`WSF_TASK_PROCESSOR`）+ `command-chain.md` | 执行机制 |

**`SimTask` 主要字段**（摘自样例 `global_script.txt`）：

```
int taskTypeId      任务类型（本表）
int level           层级
double startTime / endTime / duringTime   时间
string zoneName     区域
string routeName    航路
string targetName   目标
string conditon     条件
Map<string,string> taskParams   任务参数
int taskState       任务状态
string taskFrom     任务来源
WsfLocalTrack localTrack  本地航迹
```

---

## 4. 使用建议

1. **生成体系类工程时**，在 `global_script.txt` 中保留 `getTaskTypeName` 函数，便于状态上报。
2. **新增任务类型**时，须同步更新：`SimTask` 字段、`getTaskTypeName` 映射、以及各处理器的任务分派逻辑。
3. **中文释义务必核对**——本表释义为拼音推断，**业务含义以内部规范为准**。
