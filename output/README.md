# 产出区（output）

> 本目录是 afsim-forge 的**成果区**，由 `workflows/archive.md` 管理。
> **产出物不入库**（见根 `.gitignore`）；本 README 用于说明目录用途。

---

## 目录结构

```
output/
├── staging/                     ← 临时成果：已生成、待校验
└── verified/                    ← 成熟成果：已过校验 + 用户认可，只进不出
    ├── scenario/                ← 完整工程
    ├── component/               ← 可复用组件（platform/sensor/weapon/processor…）
    └── template/                ← 沉淀的模板
```

---

## 铁律

> **未通过 `validate_scenario`（`data.valid = true`）的工程，禁止归档到 `verified/`。**
> 归档还需**用户认可**（双条件）。

---

## 验收记录（2026-10-16）

M7 端到端验收时，在 `staging/` 生成了最小验证工程 `minscn_20261016`（由 `templates/project/minimal/` 生成），
实测 6 个用例全部通过（1 正例 + 3 负例 + 2 修复复校）。

- **实测结论与返回报文**：见 `../验收报告.md` §2
- **可复现方式**：用 `templates/project/minimal/` 重新生成即可（该工程即由此模板产出）
- **该工程未入库**：属运行产出物；验证方法已由模板 + 验收报告固化

> `verified/` 当前为空 —— 因归档需"过校验 + 用户认可"双条件，验收产物仅满足前者。
