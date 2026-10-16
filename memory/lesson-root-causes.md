# 教训根因库（lesson-root-causes）

> **层级**：L3 正文。由 `memory/lesson-index.md` 的 `Lxxx` 索引跳入。
> **本文件是"经验"而非"规范"**：讲清**为什么会错**、**怎么避免**。正确写法请查 `refs/knowledge/*.md`。
> **追加规则**：新教训在文末新增 `## Lxxx` 段落；已有教训的新案例，只在其「案例」小节追加一行（不新开段落）。

---

## L001 块未闭合 → 错位报错　★强度★★★

**覆盖报错**：[E023] [E024] [E025] [E026]

### 根因

AFSIM 解析器**逐行吃 token**，遇到块起始命令就进入"块内模式"，直到遇到配对 `end_*` 才退出。缺一个 `end_*`，解析器不会立刻报错——它会继续把**后面所有行**当作这个块的子命令，于是**报错行出现在很远的地方**（典型 `Unknown command: this`，因为 `this` 通常是下一段英文注释或 `define` 的残留）。

### 典型现象

- 报错行是注释、空行或看似正常的语句 → **99% 是上一块未闭合**。
- 同一文件**连续多行**报错，或错误 `line` 远超实际改动处。
- **`Unexpected End Of Data`** 且 `line` 恰为文件**总行数** → 解析器吃到尾，必有块未闭合（2026-10-16 实测）。
- `Mover not closed` / `Sensor not closed` 这类显式提示（较幸运的情况）。

### 修法

1. **先别改报错行**——从报错位置**向上**找最近的块起始，检查是否缺 `end_*`。
2. 逐层核对嵌套：`aux_data`、`constant_pattern`、`transmitter`/`receiver` 等子块**每层都要闭合**。
3. 修完重新打包校验。

### 生成期预防

- 生成任何块**必须成对输出**起始行与 `end_*` 行；**不允许**分两步写（先写块、稍后补 `end`）。
- 采用"模板填空"而非"自由生成"：`templates/fragments/` 中每个 `.tpl` 都自带闭合标记。
- T1/T2 增量校验**正是为了尽早暴露这类错误**——不要攒到最后一次校验。

### 案例

| 现象 | 实际根因 |
| :-- | :-- |
| `Unknown command: this` 指向注释行 | 上一 `platform_type` 缺 `end_platform_type` |
| `platform` 块内命令全部报错 | 前一个 `mover` 缺 `end_mover` |
| **`Unexpected End Of Data`，`file` = 入口文件、`line` = 14（末行）**（2026-10-16 实测） | `platform/SMOKE_TARGET.txt` 缺 `end_platform_type` —— **报错文件与出错文件根本不是同一个** |

---

## L002 自定义类型缺基类型　★强度★★★

**覆盖报错**：[E020] [E021] [E022]

### 根因

AFSIM 的**用户自定义类型必须显式继承内置基类型**。`platform_type`、`*_signature`、`weapon_effects` 等块若无基类型，解析器无法确定该类型的能力集，直接判 `Unknown command`。

### 典型现象

`Unknown command: platform_type` / `Unknown command: radar_signature`。

### 修法

| 块 | 必须写的基类型 |
| :-- | :-- |
| `platform_type` | `WSF_PLATFORM` |
| `radar_signature` | `WSF_RADAR_SIGNATURE` |
| `infrared_signature` | `WSF_INFRARED_SIGNATURE` |
| `optical_signature` | `WSF_OPTICAL_SIGNATURE` |
| `weapon_effects` | `WSF_GRADUATED_LETHALITY` / `WSF_SPHERICAL_LETHALITY` |

### 生成期预防

- 写进 `SKILL.md` 硬约束第 3 条（已落地）。
- 组件模板**首行即含基类型**，生成时不做删改。

---

## L003 数值缺单位　★强度★★★

**覆盖报错**：[E040] [E043]

### 根因

AFSIM 的物理量是**带量纲的值对象**，不是裸浮点。`1000` 无法判断是米、节还是英尺，解析器直接判非法。这是与通用编程语言最大的习惯冲突点——写惯了 `speed = 100` 的人必然踩。

### 典型现象

`Invalid value` / `Expected unit` / 数值行报错；`pulse_width 1.0 microsec` 这类"单位名不对"也归此。

### 修法

`数字 + 空格 + 单位`：`1000 m`、`500 m/sec`、`2 s`、`9500 mhz`、`60 deg`、`9.0 g`。
**微秒类**用科学计数法秒：`1.0e-6 sec`。

### 生成期预防

- 硬约束第 2 条（已落地）："所有数值必须带单位"。
- **组件模板中所有数值位一律预置单位**——生成时只需改数字，单位不动。

---

## L004 `output/` 目录丢失　★强度★★★

**覆盖报错**：[E003]

### 根因

两条机制叠加：
1. `log_file` / `event_output` 会**无条件写入** `output/`，目录不存在即失败；
2. **ZIP 格式不保留空目录**——即使本地建了空的 `output/`，打包后也会消失。

### 典型现象

`打不开输出文件` / `Cannot open ... .evt`；本地明明有目录，一打包就报错。

### 修法

在 `output/` 放一个**空文件** `blank_empty.txt`（0 字节），让目录"非空"，从而被 ZIP 保留。

### 生成期预防

- 建骨架时**必须**创建 `output/blank_empty.txt`（硬约束第 6 条）。
- `templates/project/minimal/output/blank_empty.txt` 已内置该占位文件。
- 自检清单中列为必查项。

---

## L005 入口 / ZIP / 命名三处不一致　★强度★★★

**覆盖报错**：[E002] [E005] [E007]

### 根因

`validate_scenario` 依赖**入口文件严格同名**：ZIP 名（去扩展名）→ 期望包内存在同名 `.txt` → 该文件内 `define_path_variable CASE <想定名>` 又须与之一致（`$(CASE)` 展开路径要用）。**三个名字是一个名字**，任一处不同即断链。

### 典型现象

- code `400` `缺失启动文件`（ZIP 名 ≠ 包内入口名）。
- `$(CASE)` 未展开、路径指向错误目录（`define_path_variable` 值不对）。
- 想定名含中文/空格导致各种诡异报错。

### 修法

统一为**一个 ASCII 名**：`my_scn.zip` ⊃ `my_scn.txt` ⊃ `define_path_variable CASE my_scn`。

### 生成期预防

- 想定名由需求自动生成（`<主题拼音>_<日期>`），**只含字母/数字/下划线**。
- 入口文件与 ZIP 在同一处命名，不做二次改名。
- `define_path_variable CASE` **置于入口首行**（在首个 `include_once` 之前）。

---

## L006 装配链断裂　★强度★★★

**覆盖报错**：[E001] [E006]

### 根因

AFSIM 靠 `include_once` **自上而下装配**，没有自动扫描机制——**没被 include 的文件等于不存在**。三种断法：文件没生成、生成了但没登记 `setup.txt`、`include_once` 路径写错。

### 典型现象

`No such file` / 平台"不存在" / 实例引用类型报未定义。

### 修法

1. 核对 `include_once` 路径与磁盘**逐字符**一致。
2. 新增组件后**必在 `setup.txt` 补一行**。
3. 组件文件自身依赖写在**文件头**（先依赖、后定义）。

### 生成期预防

- 生成顺序固定：**先建骨架（含 setup.txt）→ 每生成一个组件文件，立即登记 setup.txt**，不做"最后统一登记"。
- T1 校验（空壳阶段）就是为了验证装配链**在只有骨架时就通**。

---

## L007 AFSIM 脚本方言限制　★强度★★★

**覆盖报错**：[E060] [E061] [E062] [E063] [E064]

### 根因

AFSIM 脚本语言是**自研 DSL**，语法像 C++ 但**能力集是子集**。凭通用语言直觉写必踩四类坑：`fmod()`、三元运算符 `?:`、类型强转 `int()`、取模 `%`、`cout/endl` 均**不存在**。此外 `on_initialize` / `on_update` **本身就是脚本体**，再套 `script ... end_script` 会报错。

### 典型现象

`Unknown command` 指向脚本行；`fmod` / `int` / `cout` 相关报错；方法不存在（臆造的 API）。

### 修法

| 想写 | 改写成 |
| :-- | :-- |
| `fmod(t, 60.0)` | `if (TIME_NOW - lastTime >= 60.0)` |
| `cond ? a : b` | `if (cond) {...} else {...}` |
| `int(t)` | 保持浮点比较 |
| `t % 60` | 差值比较 |
| `cout << x << endl` | `print(x)` |
| `on_update` 内套 `script` | 直接写语句 |

**API 不确定时先查 `refs/knowledge/script_api_reference.md`，不要臆造。**

### 生成期预防

- 脚本块优先**照抄 `refs/examples/*.txt` 中已验证的写法**，不自由发挥。
- 新增脚本时先查 `refs/knowledge/script_syntax_critical.md`。

---

## L008 组件参数凭直觉臆造　★强度★★☆

**覆盖报错**：[E080] [E081] [E082] [E083] [E084]

### 根因

AFSIM 组件**按类型划分参数集**，不同 mover/sensor/weapon 类型互不通用。直觉上"合理"的参数（如 `default_climb_rate`）在具体类型下可能**根本不存在**；`antenna_pattern` 还需额外套 `constant_pattern` 子块。

### 典型现象

`Unknown command: default_climb_rate`；`antenna_pattern` 内参数报错。

### 修法

- 查 `refs/knowledge/mover_reference.md` / `sensor_types_reference.md` / `commands_reference.md` 对齐参数集。
- `antenna_pattern` 必须包 `constant_pattern ... end_constant_pattern`。

### 生成期预防

- 一律**用 `templates/fragments/` 中对应类型的模板**，模板内只保留受支持参数。
- 需要新参数时**先查知识层**，不凭记忆添加。

---

## L009 中文路径　★强度★★★

**覆盖报错**：[E004]

### 根因

AFSIM 对**非 ASCII 路径**处理有缺陷（`mystic` 回放乱码最明显）。这是工具链问题，无法在脚本层规避。

### 修法

工程目录、ZIP 路径**全 ASCII**。中文只允许出现在**注释内容**里。

### 生成期预防

- 想定名/文件名自动生成时**禁止中文**（硬约束第 9 条）。
- 若用户给的中文路径 → 生成到 ASCII 工作目录，交付时说明。

---

## L010 坐标与时间格式　★强度★★☆

**覆盖报错**：[E041] [E042]

### 根因

两处易错：
1. 坐标分隔符——AFSIM 用 `d:m:s`（**冒号**），与常见的点分十进制习惯冲突；
2. `start_date` / `start_time` 在**入口文件**与 `config/run.json` 的 `scenariosTime` **两处都要写**，不一致会导致时间错乱。

### 修法

- 坐标：`38:44:52.3n` 或十进制 `39.6333n 116.333e`。
- 时间：入口与 `run.json` **保持一致**；日期格式 `mon dd yyyy`（`oct 16 2026`），`run.json` 用 `YYYY-MM-DD`。

### 生成期预防

- 坐标**统一用十进制**（少一次换算、少一类错）。
- 时间两处由**同一占位符**填（`{{START_DATE}}` / `{{START_DATE_ISO}}`），保证同源。

---

## L011 判据误用　★强度★★★

**覆盖报错**：[E100] [E101] [E102] [E103] [E104]

### 根因

`validate_scenario` 的设计是**语法对错都返回 HTTP 200**（错误信息在 `data.errors[]` 里）。习惯用状态码判断成败的人会把"语法有错"误判成"通过"。反过来，`ok=false` 的 code 反映的是**链路问题**，与语法无关。

### 修法

| 想判断 | 该看 |
| :-- | :-- |
| **语法是否通过** | **`data.valid`**（唯一判据） |
| 链路是否异常 | `ok` / `code` / `msg` |
| 错在哪 | `data.errors[].file` + `line` + `column` |

遇到未列出的 `code` → 读 `msg` 原文向用户报告，**不要**用 `code` 判断语法对错。

### 生成期预防

- 写进 `SKILL.md`「判据铁律」（已落地）。
- `workflows/validate.md` §3 与 `config.yaml` 的 `judge: "data.valid"` 双重固化。

---

## 新增教训模板

```markdown
## L0xx <教训名>　★强度★★☆

**覆盖报错**：[Exxx]

### 根因
<为什么会错——机制层解释>

### 典型现象
<怎么认出来>

### 修法
<怎么做>

### 生成期预防
<怎么写代码/模板才能不发生>

### 案例
| 现象 | 实际根因 |
| :-- | :-- |
| | |
```
