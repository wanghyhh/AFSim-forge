# 工作流：本地 AFSIM 可执行文件调用（local-exec）

> **定位**：本 skill 的**备用校验通道**。当 MCP 工具（`mcp__afsim__validate_scenario`）不可用时，AI 应主动询问用户 AFSIM 本地安装路径，通过直接调用 `mission.exe` / `mystic.exe` 完成校验与回放。
> 
> **原则**：**不固化任何安装路径到 skill 文档中**；每次临时询问用户，仅作本次会话生效，不保存到配置文件。

---

## 0. 触发条件

| 场景 | 判断 | 动作 |
| :-- | :-- | :-- |
| MCP `validate_scenario` 调用返回「工具不存在」或连接失败 | 服务未挂载 / 未启动 | **立即进入本工作流**，询问用户本地安装路径 |
| `health` 返回 `ok=false` 且确认服务确实未启动 | 服务离线 | 同上 |
| 用户主动要求「不用服务，直接用本地 AFSIM」 | 用户偏好 | 同上 |

**询问话术示例**：

> 当前环境未检测到 AFSIM 校验服务。如需继续语法校验，请提供 AFSIM 安装路径（例如 `C:\Program Files\afsim-2.9.0-win64`），我将直接调用本地 `mission.exe` 完成校验。

---

## 1. 本地校验（语法检查，不跑仿真）

### 1.1 命令

```powershell
"<用户提供的AFSIM安装路径>\bin\mission.exe" -sm -list-variables "<入口文件名>.txt"
```

| 参数 | 说明 |
| :-- | :-- |
| `-sm` | 单任务模式（single mission），只解析不运行仿真 |
| `-list-variables` | 解析完成后列出输入变量，强制走完完整解析链路 |
| `<入口文件名>.txt` | **相对工作目录**的路径，必须与 ZIP 同名（如 `my_scn.txt`） |

**工作目录**：解压后的工程根目录（含 `<入口文件名>.txt` 及全部子目录的目录）。

### 1.2 执行步骤

1. **解压 ZIP**：把工程 ZIP 解压到临时目录（如 `<工作空间>\.afsim-forge\tmp\validate-<uuid>\`）。
2. **定位入口文件**：按「严格同名」规则找到 `<ZIP名>.txt`。
3. **执行命令**：以临时目录为工作目录，调用上述 `mission.exe` 命令。
4. **捕获输出**：收集 `mission.exe` 的**标准输出（stdout）**；stderr 通常为空但仍建议捕获。
5. **清理**：无论成功失败，`try/finally` 删除临时目录。

### 1.3 判据

| 退出码 | 含义 | 对应 `valid` |
| :--: | :-- | :--: |
| `0` | 解析成功，无语法错误 | `true` |
| `1` | 解析失败，存在语法错误 | `false` |
| 其他 | 启动失败、文件缺失、超时等异常 | 视为失败，向用户报告原始输出 |

> **与 MCP 服务的等价性**：服务端同样执行 `mission.exe -sm -list-variables` 并据退出码判成败，**命令与判据完全一致**。

### 1.4 错误解析（构造与 MCP 返回等价的 `errors`）

从 stdout 中提取 `ERROR` / `FATAL` 行及其后的文件/行/列信息：

**典型错误行格式**：
```text
***** ERROR: Unknown command: this
             'badscn.txt', line 1, near column 5
```

**解析规则**：
- `severity`：`ERROR` 或 `FATAL`
- `message`：`:` 后的错误描述（如 `Unknown command: this`）
- `file`：单引号内的文件名（相对工作目录）
- `line`：`line` 后的数字
- `column`：`column` 后的数字（若存在）

**构造的 `errors` 结构**（与 MCP 返回格式一致）：
```json
[
  {
    "severity": "ERROR",
    "message": "Unknown command: this",
    "file": "badscn.txt",
    "line": 1,
    "column": 5
  }
]
```

### 1.5 `output` 字段截取

| 模式 | 规则 | 与 MCP 对齐 |
| :-- | :-- | :-- |
| 默认 | 从 `Loading simulation input complete.` **起（含该行）**截取到结尾 | ✔ |
| 完整输出 | `full_output=true` 时保留 `mission.exe` 完整 stdout（含版本横幅、插件加载等） | ✔ |

> 语法错误时，`Loading simulation input complete.` 仍会出现，其后紧跟 `***** FATAL` / `***** ERROR`，因此默认截取模式下 `output` **非空**。

### 1.6 返回结构（与 MCP 等价）

```json
{
  "valid": true,
  "checked_file": "<入口文件名>.txt",
  "errors": [],
  "output": "Loading simulation input complete.\n    Elapsed Wall Clock Time: ...\nInput Variables:\n"
}
```

---

## 2. 本地仿真执行（如需）

> 本 skill **默认不跑仿真**，仅做语法校验。但如用户明确要求本地运行，可按本节执行。

### 2.1 命令

```powershell
"<用户提供的AFSIM安装路径>\bin\mission.exe" "<入口文件名>.txt"
```

**工作目录**：工程根目录。

### 2.2 判据

| 退出码 | 含义 |
| :--: | :-- |
| `0` | 仿真正常结束（到达 `end_time`） |
| 非 `0` | 失败（语法错误、文件缺失、插件加载失败等） |

### 2.3 输出

- 标准输出：AFSIM 运行日志（含 FATAL/ERROR）
- 输出文件：`.log` / `.evt` / `.aer` 等生成在工程 `output/` 子目录中

---

## 3. 本地回放（如需）

> 本 skill **默认不回放**，但如用户明确要求本地回放，可按本节执行。

### 3.1 命令

```powershell
"<用户提供的AFSIM安装路径>\bin\mystic.exe" "<结果文件>.aer"
```

**工作目录**：**工程根目录**（不是 `output/` 子目录）。

> **关键**：mystic 除读取 `.aer` 的动态消息外，还需按 aer 中记录的场景文件名加载场景文件（平台列表、图标、雷达区域等静态定义）。因此工作目录必须能定位到场景文件。

### 3.2 执行方式

非阻塞启动（`subprocess.Popen` 或等效方式），启动成功后立即返回，不等待 mystic 退出。

---

## 4. 与 MCP 服务方式的对比

| 维度 | MCP 服务方式（默认） | 本地可执行文件方式（回退） |
| :-- | :-- | :-- |
| **触发条件** | 工具可用 | 工具不可用 / 用户偏好 |
| **ZIP 传递** | 通过 MCP 参数 `zip_path`（服务侧读文件） | AI 自行解压到临时目录 |
| **命令执行** | 服务端调用 `mission.exe` | AI 自行调用 `mission.exe` |
| **判据** | 退出码 `0/1` | 退出码 `0/1`（完全一致） |
| **错误解析** | 服务端从 stdout 解析 | AI 从 stdout 解析（格式一致） |
| **output 截取** | 服务端截取 | AI 自行截取（规则一致） |
| **临时目录清理** | 服务端 `finally` 删除 | AI `finally` 删除 |
| **路径要求** | ZIP 须在服务机器可读 | 工程须在 AI 所在环境可读 |

---

## 5. 注意事项

1. **不要猜测路径**：每次必须询问用户，不得使用任何默认路径（如 `C:\Program Files\afsim-*`）。
2. **验证可执行文件存在**：调用前先用 `Test-Path` / `os.path.exists` 检查 `<路径>\bin\mission.exe` 是否存在，不存在则再次询问。
3. **入口文件路径**：传给 `mission.exe` 的必须是**相对工作目录**的路径（如 `my_scn.txt`），不是绝对路径。
4. **工作目录**：必须是工程根目录（含 `file_path .` 和全部子目录的位置）。
5. **中文路径**：AFSIM 对中文路径支持有缺陷，工程目录和安装路径均应避免中文。
6. **超时保护**：`mission.exe` 执行应设超时（建议 30s 内），超时应终止进程并向用户报告。
7. **仅作临时替代**：本地调用仅为当前会话的临时方案；长期仍建议用户部署 MCP 校验服务以获得稳定体验。
