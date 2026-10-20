# 工作流：报错修复（debug）

> 校验失败 → 定位 → 修复 → 复校 → **把新教训沉淀进记忆层**。

---

## 1. 获取报错

| 来源 | 做法 |
| :-- | :-- |
| **首选** | `validate_scenario` 的 `data.errors[]`（含 `file` / `line` / `column`） |
| 交叉印证 | `data.output` 中的 `***** FATAL` / `***** ERROR` 原文 |
| 不足以定位 | 用 `full_output: true` 重取完整 stdout |

---

## 2. 三层教训联动

```
报错
  ↓
① knowledge/lessons/errors.md              按报错关键字匹配 [Exxx]
  ↓ 命中 [Exxx]
② knowledge/lessons/index.md            查该报错对应的教训 ID
  ↓ 命中教训 ID
③ knowledge/lessons/root-causes.md      加载教训段落（根因 + 修法）
  ↓
输出修正方案 + 教训提醒
```

**未命中**时：查 `knowledge/blocks/pitfalls.md` 与 `knowledge/language/script-syntax.md`。

> `knowledge/lessons/*.md` 是 skill 自带的**只读基线**；本项目运行时新增的教训在工作空间的 `.afsim-forge/lessons/`（同构），**查找时先看后者**。

---

## 3. 修复

1. 按 `errors[].file` + `line` + `column` 定位到**具体文件的具体行**。
2. 依据 §2 的修法**先改蓝图 `<想定名>.md`（§6 记一条），再据蓝图改工程文件**。
3. **重新打包** → 再校验（`workflows/4_validate.md`）。
4. 循环上限 **3 轮**；超限则停止并向用户报告。

---

## 4. 沉淀教训（关键）

修复成功后，**把新教训写入工作空间的 `.afsim-forge/lessons/`** —— skill 目录**只读**，运行期不得写入：

1. 新增 `[Exxx]` 条目：
   ```text
   ## [E0xx] <报错关键字> → <根因> → <修法> → <出处>
   ```
2. 在 `.afsim-forge/lessons/index.md` 登记教训 ID。
3. 在 `.afsim-forge/lessons/root-causes.md` 写根因与修法段落。

> **回流（可选，需用户确认）**：若某条教训有**通用价值**，可建议用户将其合并回 skill 的 `knowledge/lessons/errors.md` 与 `knowledge/lessons/*.md`。
> 这是**显式动作** —— AI **不自动**改 skill 目录。
>
> 这是"**越用越准**"的途径 —— 本项目内每次修复都让下一次更快。

---

## 5. 高频错误速查

| 报错关键字 | 根因 | 修法 |
| :-- | :-- | :-- |
| `Unknown command: platform_type` | 缺基类型 `WSF_PLATFORM` | 补基类型 |
| `Unknown command: radar_signature` | 缺基类型 `WSF_RADAR_SIGNATURE` | 补基类型 |
| `Mover not closed` / `Sensor not closed` | 缺 `end_mover` / `end_sensor` | 补 `end_*` |
| 数值被判错 | 未带单位 | 补单位 |
| `打不开输出文件` | `output/` 目录缺失 | 建目录 + `blank_empty.txt` |
| 找不到文件 | `include_once` 路径错 / 未登记 `setup.txt` | 核对路径与登记 |

> 完整索引见 `knowledge/lessons/errors.md`。

---

## 6. 停止条件

| 情形 | 动作 |
| :-- | :-- |
| 3 轮仍未通过 | **停止**，向用户报告：当前错误、已尝试修复、建议 |
| `ok=false, code=0` | 校验服务不可达 → 请用户确认校验服务已启动 |
| `ok=false, code=400` | ZIP 不合规 → 检查 ZIP 名与包内同名启动文件 |
| `ok=false, 其他 code` | 读 `msg` 原文向用户报告；**不要**用 `code` 判断语法对错 |

**任何情况下都不得**在未通过校验时归档或交付。
