# 工作流：归档（archive）

> 把**已通过校验**且**用户认可**的工程从 `staging` 移入 `verified`。
> **所有路径均在工作空间的状态目录 `.afsim-forge/` 下**（见 `config.yaml` 的 `runtime`）—— skill 目录只读。

---

## 1. 归档前置条件（**必须全部满足**）

| # | 条件 | 校验方式 |
| :-: | :-- | :-- |
| 1 | **语法校验通过** | `validate_scenario` 返回 `data.valid = true` |
| 2 | **用户明确认可** | 用户说"可以 / 确认 / 归档" |
| 3 | 无未解决的报错 | 最后一轮校验无 `errors[]` |

> **铁律**：**未通过校验的工程，禁止归档到 `verified/`。**

---

## 2. 归档目标

| 成果类型 | 归档位置（工作空间下） |
| :-- | :-- |
| 完整工程（可运行） | `.afsim-forge/output/verified/scenario/<想定名>/` |
| 可复用组件（单块） | `.afsim-forge/output/verified/component/<组件名>.txt` |
| 模板片段 | `.afsim-forge/output/verified/template/<片段名>.txt` |

---

## 3. 操作步骤

1. **确认前置条件**（见 §1）。
2. **建目录**（若不存在）：`.afsim-forge/output/verified/{scenario,component,template}/`。
3. **移动**：`.afsim-forge/output/staging/<想定名>/` → `.afsim-forge/output/verified/scenario/<想定名>/`。
4. **记录元信息**：在 `.afsim-forge/output/verified/scenario/README.md` 追加一行：

   | 想定名 | 生成时间 | 校验结论 | checked_file | 组件清单 | 采用的缺省值 |
   | :-- | :-- | :-- | :-- | :-- | :-- |
   | `<名>` | `YYYY-MM-DD HH:MM` | `valid=true` | `<名>.txt` | 平台×N / 传感器×N / … | 见交付说明 |

5. **保留 staging**：`staging/<想定名>.zip` 可保留作为校验留痕；工程目录移走后，ZIP 即为该版本的快照。
6. **清空 staging 的中间产物**（可选）：修复过程中的临时 ZIP 可清理。

---

## 4. 归档后

- 后续生成新工程时，**优先从 `verified/` 找同类案例作为参考**（仅次于 `templates/` 与 `refs/examples/`）。
- 若归档后发现错误 → **不得直接改 `verified/`**，应回到 `staging` 重做、重新校验、再归档。

---

## 5. 不归档的情形

| 情形 | 处理 |
| :-- | :-- |
| 校验未通过 | 留在 `staging`，走 `workflows/debug.md` |
| 校验通过但用户未认可 | 留在 `staging`，等用户确认 |
| 修复轮次超限 | 停止，向用户报告，不归档 |
| 只是试验性片段 | 留在 `staging`，或按需放入 `verified/component/` |
