# 最小可跑工程（minimal）

> **用途**：先跑通结构 + 打通校验链路，再逐步扩展。
> 本目录的文件**替换占位符后可直接校验通过**（`data.valid = true`）。

---

## 1. 文件清单

```
<想定名>/
├── <想定名>.txt                     ← entry.txt.tpl
├── setup.txt                        ← setup.txt.tpl
├── event_pipe.txt                   ← event_pipe.txt.tpl
├── global_env.txt                   ← global_env.txt.tpl
├── config/
│   └── run.json                     ← config-run.json.tpl
├── platform/
│   └── EXAMPLE_PLATFORM.txt         ← platform/EXAMPLE_PLATFORM.txt.tpl
├── side/
│   └── red.txt                      ← side/red.txt.tpl
└── output/
    └── blank_empty.txt              ← 空文件（占位）
```

**入口文件只 include 实际存在的文件**——所以最小版的 `entry.txt.tpl` 比 `blueprints/skeleton/entry.txt.tpl` 少若干行。

---

## 2. 使用

1. 建目录 `config/ platform/ side/ output/`。
2. 复制各 `.tpl` 到目标位置并去掉 `.tpl` 后缀，替换 `{{...}}` 占位符。
3. 创建空的 `output/blank_empty.txt`。
4. 打包 ZIP（ZIP 名 = 想定名）→ 按 `workflows/validate.md` 调用校验。
5. 通过后，再按 `workflows/generate.md` 逐步加平台、传感器、武器。

---

## 3. 缺省值

| 占位符 | 缺省 |
| :-- | :-- |
| `{{SCENARIO_NAME}}` | `<主题拼音>_<日期>` |
| `{{START_DATE}}` | 当前日期（`mon dd yyyy`） |
| `{{START_DATE_ISO}}` | 当前日期（`YYYY-MM-DD`） |
| `{{START_TIME}}` | `00:00:00` |
