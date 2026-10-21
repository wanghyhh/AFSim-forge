# 工作流：语法校验（validate）

> **本 skill 的首选校验通道**是 MCP 的 `mcp__afsim__validate_scenario` 工具。
> **备用通道**：当 MCP 不可用时，按 `workflows/local-exec.md` 询问用户本地 AFSIM 安装路径，直接调用 `mission.exe` 完成校验。
> 本工作流**只做校验**，不跑仿真、不回放——仿真仅在 `workflows/5_deliver.md` 第 4 步、用户明确要求时进行。

---

## 0. 前置检查（可选，建议做）

```
mcp__afsim__health        → 确认校验服务在线
```

若 `ok=false, code=0` → 校验服务不可达，**进入备用通道**：
1. 询问用户 AFSIM 本地安装路径（如 `C:\Program Files\afsim-2.9.0-win64`）。
2. 按 `workflows/local-exec.md` §1 执行本地 `mission.exe -sm -list-variables` 校验。
3. **不要**在没有校验通道的情况下继续生成或归档。

> 备用通道的判据、错误解析、output 截取规则与 MCP 服务**完全一致**，只是执行环境从服务端换到本地。

---

## 1. 打包

把工程目录压成 ZIP：

| 要求 | 说明 |
| :-- | :-- |
| **ZIP 名 = 想定名** | 如想定 `my_scn` → `my_scn.zip` |
| **包内含 `<想定名>.txt`** | 与 ZIP 同名，否则返回 `400 缺失启动文件` |
| **保留目录结构** | `platform/`、`side/`、`output/` 等子目录须在包内 |
| **含 `output/` 占位** | 必须含 `output/blank_empty.txt` |
| **路径** | `zip_path` 须为 **MCP 服务所在机器上的绝对路径** |

打包示例（PowerShell）：

```powershell
Compress-Archive -Path "<工程目录>\*" -DestinationPath "<绝对路径>\<想定名>.zip" -Force
```

> ⚠️ ZIP 不保留空目录 —— 这正是 `output/blank_empty.txt` 存在的原因。

---

## 2. 调用

```
mcp__afsim__validate_scenario({ "zip_path": "<ZIP 绝对路径>", "full_output": false })
```

**返回契约**：`{"ok": bool, "code": int, "msg": str, "data": {...}}`

`data` 结构：

```json
{
  "valid": true,
  "checked_file": "<想定名>.txt",
  "errors": [],
  "output": "Loading simulation input complete.\n ..."
}
```

---

## 3. 判读（铁律）

> **只看 `data.valid`。**
> 语法对错**都返回 HTTP 200** —— **禁止**用 HTTP 状态码、`ok`、`code` 判断语法对错。

| `data.valid` | 结论 | 下一步 |
| :-- | :-- | :-- |
| `true` | 语法通过 | 进入 §6 归档判断 |
| `false` | 存在语法错误 | 进入 §4 定位修复 |

---

## 4. 失败定位与修复

1. 读 `data.errors[]`：

   | 字段 | 用途 |
   | :-- | :-- |
   | `severity` | `FATAL` / `ERROR` |
   | `message` | 错误原因，如 `Unknown command: this` |
   | `file` | **出错文件（相对工程目录的路径）** |
   | `line` | 出错行号 |
   | `column` | 出错近似列号 |

2. 用 `file` + `line` + `column` **精确定位**到具体文件的具体行。
3. 在 `data.output` 中交叉印证 `***** FATAL` / `***** ERROR` 原文。
4. **查教训库**：
   - `knowledge/lessons/errors.md` —— 按报错关键字匹配 `[Exxx]` 条目
   - 命中后 → `knowledge/lessons/index.md` → `knowledge/lessons/root-causes.md`（见 `workflows/debug.md`）
5. 修复 → **重新打包** → 再校验。

> **修改铁律（贯穿全 skill，按蓝图 §4 状态分层）**：
> - **§4 仍含全文**（生成期 / T1·T2 阶段）：脚本改动**先改蓝图 §4**（§6 记一条），**再改工程**——Step 5 一致性自检要求二者逐字符一致。
> - **§4 已裁剪**（T3 及之后的校验修复）：脚本**直接改工程文件**，并在蓝图 §6 记一条（改了什么、为什么）。
> - **结构 / 兵力 / 任务 / 配置语义**类变更：任何阶段都**先改蓝图**对应章节，再改工程。
>
> 无论哪类，**变更必须落到蓝图 §6**——它是唯一的差异记录。修复循环上限见 §5。

### 若 `output` 不足以定位

改用 `full_output: true` 重取完整校验输出：

```
mcp__afsim__validate_scenario({ "zip_path": "<...>", "full_output": true })
```

---

## 5. 修复循环上限

- **最多 3 轮**（`config.yaml` 的 `mcp.validate.max_repair_rounds`）。
- 超限 → **停止并向用户报告**：当前错误、已尝试的修复、建议。
- **严禁**在未通过校验的情况下归档或交付。

---

## 6. 链路异常兜底（`ok = false`）

> 以下都是**链路层**错误，与语法对错**无关** —— 判语法只认 `data.valid`。

| `code` | 含义 | 处理 |
| :-: | :-- | :-- |
| `0` | 校验服务不可达 | 进入**备用通道**：询问用户本地 AFSIM 安装路径，按 `workflows/local-exec.md` §1 执行本地校验 |
| `400` | 参数或 ZIP 不合规 | **多为缺同名启动文件** → 检查 ZIP 名与包内 `<想定名>.txt` |
| `404` | `zip_path` 指向的文件不存在 | 检查路径拼写 |
| 其他 | 未列出的异常 | 读 `msg` 原文向用户报告；**不要**用 `code` 判断语法对错 |

> **禁止**在无校验通道的情况下继续生成或交付。

---

## 7. 工具使用边界

MCP 工具已全部解禁，但**按阶段取用**（`config.yaml` 的 `mcp` 段单点维护）：

| 阶段 | 可用工具 |
| :-- | :-- |
| 本工作流（校验） | `health` / `selftest`（可选）、`validate_scenario`（核心） |
| 交付后仿真（`5_deliver.md` §4，用户明确要求时） | `upload_zip` / `submit_simulation` / `get_simulation` / `list_results` / `download_result` |
| 交付后回放（用户明确要求时） | `replay` |

> 日常流程**止于校验**：用户没要求跑仿真时，不得调用仿真类工具。

---

## 8. 校验通过后

- 若 `data.valid = true` → 进入 `workflows/5_deliver.md`（结束判定 → 内容整理 → 行数统计 → 后续询问 → 归档）。
- **归档前必须**：`data.valid = true` **且** 用户认可。

---

## 9. 增量校验触发点

| 触发点 | 时机 | 目的 |
| :-- | :-- | :-- |
| **T1** | 骨架建成后（空壳） | 早发现 `include_once` 链、路径变量、文件名错误 |
| **T2** | 每完成一类组件后（platform / sensor / weapon / processor / side） | 防错误累积，缩小定位范围 |
| **T3** | 全部生成完毕 | 终校验，归档前置条件 |

> 依据：`validate_scenario` **沿 `include` 链递归覆盖**，因此阶段性打包也能校验已生成部分。**越早校验，返工成本越低。**
> 三个触发点均为**语法校验**（本文全部流程），与 AI 自检无关，**必须逐点真实执行**。
