# 装配规则（assembly）

> AFSIM 线性解析：**用到什么，之前必须先定义**。装配链自下而上，下层不得引用上层。

---

## 1. 装配链

```
<想定名>.txt（入口）
  ├─ include_once event_pipe.txt
  ├─ include_once zone.txt
  ├─ include_once global_env.txt
  ├─ include_once global_struct.txt
  ├─ include_once global_script.txt
  ├─ include_once global_route.txt
  ├─ include_once group.txt
  ├─ include_once setup.txt ──┬─ platform/TARGET.txt ─── signatures/*.txt
  │                           ├─ platform/EWR_TTR.txt ── sensor/ + comm/ + processor/
  │                           └─ …
  ├─ include_once network/network.txt ── NetworkA.txt
  ├─ include_once medium/medium.txt ──── MediumAABBCC.txt
  ├─ include_once side/red.txt
  └─ include_once side/blue.txt
```

**层次**：组件定义（底层）→ 平台类型（组装）→ 实例部署（顶层）。

---

## 2. 入口文件四要素

入口文件**只做四件事**，不定义任何模型：

```text
define_path_variable CASE <想定名>        ← ① 路径变量
file_path .                                ← ② 路径基准（必须在任何 include 之前）
include_once <装配链各文件>                 ← ③ 装配
end_time 10 m                              ← ④ 仿真控制
start_date <mon dd yyyy>
start_time <hh:mm:ss>
```

> **`file_path .` 不可省**：AFSIM 按 `file_path` 搜索 `include_once` 目标；缺了它，所有「相对工程根」的路径都可能解析失败。位置必须在第一个 `include_once` 之前。详见 `layout.md` §2.2。

**内联的只有** `event_output` 与 `log_file`（输出配置），其余一律 include：

```text
event_output
   file output/$(CASE).evt
   enable all
end_event_output
log_file output/$(CASE).log
```

---

## 3. 路径变量

```text
define_path_variable CASE <想定名>
```

定义后用 `$(CASE)` 引用。**所有输出文件名都应以 `$(CASE)` 为基**：

| 用途 | 写法 |
| :-- | :-- |
| 日志 | `log_file output/$(CASE).log` |
| 回放 | `event_pipe` → `file output/$(CASE).aer` |
| 事件 | `event_output` → `file output/$(CASE).evt` |

想定改名只需改一处。

---

## 4. 组件文件的"先依赖、后定义"

组件文件（`platform/*`、`weapon/*`）**文件头必须先 include 自己的全部依赖**，再写块：

```text
include_once sensor/TTR_RADAR.txt
include_once comm/C2_LINK.txt
include_once signatures/VEHICLE_RADAR_SIGNATURE.txt
include_once processor/processor_TRACK_0001.txt

platform_type EWR_TTR WSF_PLATFORM
   …
end_platform_type
```

---

## 5. 汇总文件

`setup.txt` / `network/network.txt` / `medium/medium.txt` **只做 include，不定义块**：

```text
# setup.txt
include_once platform/TARGET.txt
include_once platform/EWR_TTR.txt
```

> **新增平台必须同步登记进 `setup.txt`**，否则类型不会被加载。

---

## 6. 命名与写法约定

| 项 | 约定 |
| :-- | :-- |
| 想定名 | 字母/数字/下划线，**无中文、无空格**；= 入口文件名 = 压缩包名 |
| 平台类型 | 大写 + 下划线（`INTERCEPTOR_LAUNCHER`） |
| 平台实例 | 类型名 + `_` + 业务 code（`INTERCEPTOR_LAUNCHER_322857`） |
| 组件名 | 大写 + 下划线，语义化（`DATALINK`、`TTR_RADAR`） |
| 签名 | `<对象>_<类型>_SIG` / `_SIGNATURE` |
| 扩展名 | **一律 `.txt`**（不是 `.wsf`） |
| 单位 | **所有数值必须带单位**（`500 m/sec`、`10000 m`、`2 s`、`9500 mhz`） |
| 坐标 | `d:m:s` 冒号分隔（`38:44:52.3n`）或小数度（`31.24n 121.52e`） |
| 块闭合 | 每个 `xxx` 配 `end_xxx`；基类型不可省 |
| 注释 | `#` 或 `//`；**建议独占一行**（行尾注释不可靠） |
| 编码 | UTF-8（无 BOM） |
| 路径 | `include_once` 与数据表路径**相对工程根目录**；**禁用中文路径** |
| include 形式 | **顶层装配用 `include_once`；块体内联用 `include`**（见 §7） |

---

## 7. `include` vs `include_once`（★ 高频踩坑）

两者的差别不是风格，而是**语义**：`include_once` 全局只生效**一次**，`include` 每次都展开。

| 场景 | 用哪个 | 为什么 |
| :-- | :-- | :-- |
| **入口文件装配链**（`include_once setup.txt` 等） | `include_once` | 防止同一文件被多次装配、重复定义类型 |
| **`setup.txt` / `network.txt` / `medium.txt` 汇总** | `include_once` | 同上 |
| **组件文件头部的依赖声明**（`include_once sensor/X.txt`） | `include_once` | 依赖只定义一次即可 |
| **块体内的内联片段**（`platform_type` 里 `include COMMON_LINK.txt`） | **`include`** | 多个 `platform_type` 各需内联**一份**；用 `include_once` 会让**第二处及以后静默跳过**，片段内容凭空消失（不报错，极难查） |

**裸片段文件的特征**：没有自己的块头尾（不是完整的 `platform_type … end_platform_type`），只是一段要嵌进别人块里的语句。典型如 `COMMON_LINK.txt`、`STARLINK_LINKABLE.txt`。

> **两条铁律**：
> 1. 裸片段**只能在块体内用 `include`**；**不可顶层 `include_once`**（顶层展开会报 `Unknown command: group_join` 之类的错）。
> 2. 裸片段**必须 `include` 而非 `include_once`**（否则第二处静默跳过）。

> 实测依据：`blueprints/cases/` 的归一化工程中共有 7 处块内 `include`，全部属此类。

---

## 8. 常见装配错误

| 现象 | 根因 | 修正 |
| :-- | :-- | :-- |
| `Unknown command: XXX` | 缺基类型（`platform_type X` 未写 `WSF_PLATFORM`） | 补基类型 |
| `Mover not closed` / `Sensor not closed` | 缺 `end_mover` / `end_sensor` | 补 `end_*` |
| 找不到文件 | `include_once` 路径错 / 文件未建 / 未登记 `setup.txt` | 核对路径与登记 |
| 数值被判错 | 未带单位 | 补单位 |
| 平台未出现 | `side/*.txt` 未 include，或 `setup.txt` 未登记类型 | 补 include / 登记 |
| `ERROR: 打不开输出文件` | `output/` 目录缺失 | 建目录 + `blank_empty.txt` 占位 |
| 回放无平台 | 工程路径含中文 | 迁到纯英文路径 |
