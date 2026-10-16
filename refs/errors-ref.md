# 报错索引（errors-ref）

> **用途**：L1 索引。校验失败时，用 `data.errors[].message`（或 `data.output` 中的 `***** FATAL/ERROR` 关键字）在本文检索，命中 `[Exxx]` 后进入 `memory/lesson-index.md` → `memory/lesson-root-causes.md` 取根因与修法。
> **未命中**时：查 `refs/knowledge/common_mistakes.md`、`refs/knowledge/script_syntax_critical.md`，修复后**回写本文件**新增条目（见 `workflows/debug.md` §4）。

---

## 检索方式

1. 取 `errors[].message` 原文（如 `Unknown command: this`）。
2. 在本文件搜索**关键字**（上表「报错关键字」列，大小写不敏感）。
3. 命中 `[Exxx]` → 按「修法」改文件；需要更细根因时读 `memory/lesson-root-causes.md`。
4. **同时看 `errors[].file` / `line` / `column` 精确定位**——本索引给"是什么"，定位靠字段。

---

## 0. 快速对照（最高频 12 条）

| 报错关键字 | 编号 | 一句话修法 |
| :-- | :-: | :-- |
| `Unknown command: platform_type` | [E020] | 补基类型 `WSF_PLATFORM` |
| `Unknown command: radar_signature` | [E021] | 补基类型 `WSF_RADAR_SIGNATURE` |
| `Unknown command: <自定义块名>` | [E022] | 块名与目录不符 / 块未定义就引用 |
| `Unknown command: this` | [E023] | 上一块缺 `end_*`，命令被吞进块内 |
| `Mover not closed` / `Sensor not closed` | [E024] | 补配对 `end_*` |
| `Unexpected End Of Data` | [E027] | 块未闭合，解析器吃到文件尾 |
| `无法打开` / `cannot open` / `No such file` | [E001] | `include_once` 路径错 / 文件未生成 |
| `缺失启动文件` (code 400) | [E002] | ZIP 名与包内 `<想定名>.txt` 不同名 |
| `打不开输出文件` | [E003] | 缺 `output/` 目录或 `blank_empty.txt` |
| `Bad value for: <参数名>` / `Invalid ...` | [E040] | 补单位 |
| 坐标解析错 | [E041] | 点号改冒号 `d:m:s` |
| `fmod` / `?` / `int(...)` 报错 | [E060] | 脚本用简单 if-else，禁用 fmod/三元/强转/取模 |
| 路径乱码 / 中文目录 | [E004] | 工程路径禁中文 |

---

## 1. 装配与文件（E001–E019）

### [E001] `No such file` / `无法打开文件` / `Unable to open` → 出处：`refs/structure/assembly-rules.md`

- **根因**：`include_once` 的路径写错；或引用的文件**根本没生成**；或大小写不符（Windows 下能容忍、AFSIM 路径变量拼错则不）。
- **修法**：
  1. 核对 `include_once <相对路径>` 与磁盘实际路径**逐字符**一致。
  2. 确认目标文件存在且**非空**。
  3. 组件文件被 include 前，其自身依赖须在**文件头**先 `include_once`（先依赖、后定义）。
- **注意**：入口只 include 实际存在的文件——不存在的一行都别写。

### [E002] `缺失启动文件` / code `400` → 出处：`refs/structure/project-layout.md` §入口

- **根因**：ZIP 名（去扩展名）≠ 包内入口文件名。如 `my_scn.zip` 里放的是 `scenario.txt`。
- **修法**：两者都命名为 `<想定名>`——`my_scn.zip` 内含 `my_scn.txt`。

### [E003] `打不开输出文件` / `Cannot open ... .evt/.aer/.log` → 出处：`refs/structure/project-layout.md` §output

- **根因**：`output/` 目录不存在（ZIP 不保留空目录，目录丢了）。
- **修法**：建 `output/` 并放**空文件** `output/blank_empty.txt` 占位（0 字节即可）。

### [E004] 路径乱码 / 中文目录报错 → 出处：`refs/structure/defaults.md` §禁止项

- **根因**：AFSIM 对中文路径有缺陷（`mystic` 回放尤甚）。
- **修法**：工程与 ZIP 路径**全 ASCII**；中文只允许出现在注释里。

### [E005] 想定名含中文 / 空格 → 出处：`refs/structure/project-layout.md` §命名

- **根因**：入口文件名、ZIP 名、`define_path_variable CASE` 值三者不合法。
- **修法**：只用字母/数字/下划线，如 `kongzhan_20261016`。

### [E006] 新增平台"不存在" / 平台未出现 → 出处：`refs/structure/assembly-rules.md`

- **根因**：新组件文件未登记进 `setup.txt`，装配链断了。
- **修法**：`setup.txt` 补一行 `include_once <路径>`。

### [E007] `define_path_variable` 相关报错 / `$(CASE)` 未展开 → 出处：`refs/structure/assembly-rules.md`

- **根因**：入口**第一行**未写 `define_path_variable CASE <想定名>`，或写在了 `include_once` 之后。
- **修法**：把 `define_path_variable CASE <想定名>` 提到入口首行，再 include。

---

## 2. 语法与块（E020–E039）

### [E020] `Unknown command: platform_type` → 出处：`refs/knowledge/language_grammar.md`

- **根因**：`platform_type` 缺**基类型**，AFSIM 不认识这个自定义类型。
- **修法**：`platform_type <名字> WSF_PLATFORM`（必须带基类型）。

### [E021] `Unknown command: radar_signature` / `infrared_signature` / `optical_signature` → 出处：`refs/knowledge/language_grammar.md`

- **根因**：签名块缺基类型。
- **修法**：`radar_signature <名字> WSF_RADAR_SIGNATURE`（红外 `WSF_INFRARED_SIGNATURE`、光学 `WSF_OPTICAL_SIGNATURE`）。

### [E022] `Unknown command: <自定义名字>` → 出处：`refs/structure/assembly-rules.md`

- **根因**（两类）：
  1. **块名与目录/类型不符**：把 `sensor` 块写进了 `platform/`，或块类型拼错。
  2. **先用了未定义的类型**：实例引用的 `platform_type` 尚未 `include_once`。
- **修法**：
  1. 按"块类型 → 目录"映射归位（`sensor`→`sensor/`、`weapon`→`weapon/`…）。
  2. 在文件头补 `include_once` 依赖，**先定义后使用**。

### [E023] `Unknown command: this` / 后续行整片报错 → 出处：`refs/knowledge/common_mistakes.md`

- **根因**：**上一个块没闭合**（缺 `end_*`），解析器把后续命令当成了块内子命令。
- **修法**：向上找最近的块，补 `end_*`。**这是"报错行不在真正出错处"的典型**——永远先查上一块是否闭合。

### [E024] `... not closed` / `Mover not closed` / `Sensor not closed` → 出处：`refs/knowledge/common_mistakes.md`

- **根因**：块缺配对结束标记。
- **修法**：`mover`→`end_mover`、`sensor`→`end_sensor`、`processor`→`end_processor`、`weapon`→`end_weapon`、`route`→`end_route`、`comm`→`end_comm`。

### [E025] `route` 内报错 / `loop` 不识别 → 出处：`refs/knowledge/common_mistakes.md` §5

- **根因**：`route` 里用了 `loop`。
- **修法**：删 `loop`；需循环用 `route` 外的 `at_end_of_path`。

### [E026] 块嵌套层级报错 → 出处：`refs/knowledge/language_grammar.md`

- **根因**：子块（如 `aux_data`、`constant_pattern`）未闭合或层级错位。
- **修法**：逐层缩进核对，确保**每层都有 `end_*`**。

### [E027] `Unexpected End Of Data` → 出处：`memory/lesson-root-causes.md` L001　**【2026-10-16 实测】**

- **根因**：**块未闭合的另一种表现**。与 [E023] 同源，但报错位置不同——解析器把块内命令一路吃到**文件末尾**，发现数据耗尽即报此错。
- **典型现象**：`errors[].file` 指向**入口文件**（或所在文件）的**最后一行**，`line` 等于文件总行数；`output` 含 `***** FATAL: Could not process input files.`。**报错位置与真正缺 `end_*` 的位置无关**，极易误导。
- **修法**：
  1. **不要**去改报错指向的那一行。
  2. 从报错文件**开头**逐块核对 `end_*` 配对（用"块起始计数 = `end_*` 计数"快速定位）。
  3. 定位到缺 `end_*` 的文件补上。
- **实测记录**（2026-10-16，`minscn_bad_close_20261016`）：
  - 真实错误：`platform/SMOKE_TARGET.txt` 缺 `end_platform_type`
  - MCP 返回：`{"severity":"ERROR","message":"Unexpected End Of Data","file":"minscn_bad_close_20261016.txt","line":14,"column":1}`
  - 印证：报错文件是**入口**而非 `platform/`，行号是入口**最后一行** → 典型的"错位报错"。

---

## 3. 数值与单位（E040–E059）

### [E040] `Bad value for: <参数名>` / `Invalid value` / `Expected unit` → 出处：`refs/knowledge/common_mistakes.md` §2　**【2026-10-16 实测】**

- **根因**：数值**没带单位**。AFSIM 要求 `数字 + 空格 + 单位`。
- **修法**：`1000`→`1000 m`；`500`→`500 m/sec`；`2`→`2 s`；`9500`→`9500 mhz`。
- **常用单位**：速度 `m/sec km/hr knots`；时间 `sec min hr`；距离 `m km ft`；角度 `deg rad`；加速度 `g m/sec^2`。
- **实测记录**（2026-10-16，`minscn_bad_unit_20261016`）：
  - 真实错误：`mover` 块内 `maximum_speed 100`（缺单位）
  - MCP 返回：`{"severity":"ERROR","message":"Bad value for: maximum_speed","file":"platform\\SMOKE_TARGET.txt","line":12,"column":20}`
  - 印证：**报错关键字带参数名**（`Bad value for: <参数名>`），定位**精确到行**（`platform/` 第 12 行即出错行）——与 [E027] 的"错位"形成鲜明对比：**数值类错误定位准，块闭合类错误定位偏**。

### [E041] 坐标解析错 → 出处：`refs/structure/assembly-rules.md` §坐标

- **根因**：用点号分隔度分秒。
- **修法**：用**冒号**：`38:44:52.3n`、`116:20:00e`；或直接十进制 `39.6333n 116.333e`。

### [E042] 时间格式错 / `start_date` 报错 → 出处：`refs/structure/run-json.md`

- **根因**：`start_date` 与 `config/run.json` 的 `scenariosTime` 不一致。
- **修法**：两处 `startDate` / `startTime` **保持一致**；日期格式 `mon dd yyyy`（如 `oct 16 2026`）。

### [E043] `pulse_width` 单位错 → 出处：`refs/knowledge/common_mistakes.md` §错误2

- **根因**：用了 `microsec` 这类不被识别的单位。
- **修法**：改用科学计数法秒：`1.0e-6 sec`。

---

## 4. 脚本（E060–E079）

### [E060] `fmod` / `?` / `int(...)` / `%` 报错 → 出处：`refs/knowledge/script_syntax_critical.md`

- **根因**：AFSIM 脚本**不支持** `fmod()`、三元运算符 `?:`、类型强转 `int()`、取模 `%`。
- **修法**：改用简单比较 + `if-else`；时间判断用差值比较（`if (TIME_NOW - lastReportTime >= 60.0)`）。

### [E061] `cout` / `endl` 报错 → 出处：`refs/knowledge/common_mistakes.md` §错误4

- **根因**：用了 C++ 的 `cout << ... << endl`。
- **修法**：改用 `print(...)`，参数用逗号分隔：`print(TIME_NOW, " [", PLATFORM.Name(), "] Status");`。

### [E062] `on_initialize` / `on_update` 内报错 → 出处：`refs/knowledge/common_mistakes.md` §错误5

- **根因**：在 `on_initialize`/`on_update` 里又套了 `script ... end_script`。
- **修法**：直接写代码，**不要**再包 `script`。

### [E063] 方法不存在 / `Position()` `Geodetic()` 报错 → 出处：`refs/knowledge/script_api_reference.md`

- **根因**：调用了不存在的 API。
- **修法**：查 `refs/knowledge/script_api_reference.md` 确认方法签名；不确定时先用 `print` 输出，避免臆造 API。

### [E064] `script_variables` 未声明 → 出处：`refs/knowledge/script_types.md`

- **根因**：脚本用了未声明的变量。
- **修法**：在 `script_variables ... end_script_variables` 中先声明并初始化。

---

## 5. 组件专有（E080–E099）

### [E080] `antenna_pattern` 内报错 → 出处：`refs/knowledge/common_mistakes.md` §错误1

- **根因**：把 `peak_gain`/`azimuth_beamwidth` 直接写在 `antenna_pattern` 里。
- **修法**：必须包一层 `constant_pattern ... end_constant_pattern`：
  ```text
  antenna_pattern <名字>
     constant_pattern
        peak_gain 35 db
        azimuth_beamwidth 60 deg
        elevation_beamwidth 60 deg
     end_constant_pattern
  end_antenna_pattern
  ```

### [E081] `default_climb_rate` / `default_descent_rate` 不支持 → 出处：`refs/knowledge/mover_reference.md`

- **根因**：`WSF_AIR_MOVER` 无这两个参数。
- **修法**：删掉；用 `default_radial_acceleration 9.0 g` 等受支持参数。

### [E082] `mover` 参数报错 → 出处：`refs/knowledge/mover_reference.md`

- **根因**：mover 类型与参数不匹配（如给地面 mover 配 `maximum_speed 600 m/sec` 却用了空中参数集）。
- **修法**：查 `refs/knowledge/mover_reference.md` 对齐参数；`WSF_AIR_MOVER` 典型三件套 = `maximum_speed` / `minimum_speed` / `default_radial_acceleration`。

### [E083] `sensor` 参数报错 → 出处：`refs/knowledge/sensor_types_reference.md`

- **根因**：传感器类型与参数不符。
- **修法**：查 `refs/knowledge/sensor_types_reference.md`，按类型取参（雷达常用 `WSF_RADAR_SENSOR` + `frame_time` / `antenna_pattern` / `transmitter` / `receiver`）。

### [E084] `weapon_effects` / 杀伤概率报错 → 出处：`refs/knowledge/commands_reference.md`

- **根因**：杀伤模型块名或参数错。
- **修法**：查 `refs/knowledge/commands_reference.md`；常用 `WSF_GRADUATED_LETHALITY` / `WSF_SPHERICAL_LETHALITY`。

---

## 6. 链路与服务（E100–E119）

> 本节**不是语法错误**——`data.valid` 判不出这些，看 `ok` / `code`。

### [E100] `ok=false, code=0` → 出处：`workflows/validate.md` §6

- **根因**：下游 AFSIM 代理服务不可达。
- **修法**：请用户启动 `afsim-server`（`python run.py`）；可先调 `mcp__afsim__health` 复核。

### [E101] `ok=false, code=400` → 出处：`workflows/validate.md` §6

- **根因**：参数或 ZIP 不合规，**多为缺同名启动文件**。
- **修法**：检查 ZIP 名与包内 `<想定名>.txt`；确认 `zip_path` 为绝对路径。

### [E102] `ok=false, code=404` → 出处：`workflows/validate.md` §6

- **根因**：想定/任务/结果文件不存在。
- **修法**：检查路径拼写与文件是否存在。

### [E103] `ok=false, code=503` → 出处：`workflows/validate.md` §6

- **根因**：仿真队列已满。
- **修法**：**稍后重试**——这是限流，不是故障。

### [E104] 用 HTTP 200 判成"通过" → 出处：`workflows/validate.md` §3

- **根因**：误以为状态码能反映语法对错。
- **修法**：**铁律——只看 `data.valid`**。语法对错都返回 HTTP 200。

---

## 7. 新增条目模板

修复成功后，若上表**无**该报错，追加：

```markdown
### [E0xx] `<报错关键字原文>` → 出处：`<文件>`

- **根因**：<一句话>
- **修法**：
  1. <步骤>
- **示例**：<错 → 对>
```

并同步在 `memory/lesson-index.md` 登记、`memory/lesson-root-causes.md` 写根因段落。
