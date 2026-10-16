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
① refs/errors-ref.md          按报错关键字匹配 [Exxx]
  ↓ 命中 [Exxx]
② memory/lesson-index.md      查该报错对应的教训 ID
  ↓ 命中教训 ID
③ memory/lesson-root-causes.md 加载教训段落（根因 + 修法）
  ↓
输出修正方案 + 教训提醒
```

**未命中**时：查 `refs/knowledge/common_mistakes.md` 与 `refs/knowledge/script_syntax_critical.md`。

---

## 3. 修复

1. 按 `errors[].file` + `line` + `column` 定位到**具体文件的具体行**。
2. 依据 §2 的修法改文件。
3. **重新打包** → 再校验（`workflows/validate.md`）。
4. 循环上限 **3 轮**；超限则停止并向用户报告。

---

## 4. 沉淀教训（关键）

修复成功后，**追加一条教训**：

1. 若 `refs/errors-ref.md` 中**无**该报错条目 → 新增 `[Exxx]` 条目：
   ```text
   ## [E0xx] <报错关键字> → <根因> → <修法> → <出处>
   ```
2. 在 `memory/lesson-index.md` 登记教训 ID。
3. 在 `memory/lesson-root-causes.md` 写根因与修法段落。

> 这是"**越用越准**"的唯一途径 —— 每次修复都让下一次更快。

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

> 完整索引见 `refs/errors-ref.md`。

---

## 6. 停止条件

| 情形 | 动作 |
| :-- | :-- |
| 3 轮仍未通过 | **停止**，向用户报告：当前错误、已尝试修复、建议 |
| `ok=false, code=0` | 校验服务不可达 → 请用户确认校验服务已启动 |
| `ok=false, code=400` | ZIP 不合规 → 检查 ZIP 名与包内同名启动文件 |
| `ok=false, 其他 code` | 读 `msg` 原文向用户报告；**不要**用 `code` 判断语法对错 |

**任何情况下都不得**在未通过校验时归档或交付。
