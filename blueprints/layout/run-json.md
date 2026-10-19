# config/run.json 字段说明

> `config/run.json` 是**业务侧运行控制文件**，非 AFSIM 语法，由上层工具读取。
> 生成时按本文件填写；**`scenariosId` 优先取「想定编辑 JSON」的值**（原值照抄），JSON 没给才留空（`0`）。
> **想定编辑 JSON（`scenarioJsonData`）的已知字段全部落在这里**，认不出的字段也**原样并入**本文件。详见 `workflows/intake.md` §3。

---

## 1. 结构

```json
{
  "baseConfig": {
    "highPrecisionCounter": 0,
    "multithreading": 0,
    "pausetoadvancetime": 1,
    "propulsionMethod": 2,
    "recordAer": 1,
    "recordEvent": 0,
    "recordLog": 1,
    "scenariosTime": {
      "continueTime": 1440,
      "startDate": "2026-09-15",
      "startTime": "19:44:46"
    },
    "startMode": 2,
    "stepValue": 0.1,
    "terminalLog": 1,
    "timeRate": 1.0,
    "timeType": 1
  },
  "scenariosId": 0
}
```

---

## 2. 字段

| 字段 | 类型 | 含义 | 缺省 |
| :-- | :-- | :-- | :-- |
| `highPrecisionCounter` | int | 高精度计数 | `0` |
| `multithreading` | int | 多线程开关 | `0` |
| `pausetoadvancetime` | int | 暂停即推进时间 | `1` |
| `propulsionMethod` | int | 推进方式 | `2` |
| `recordAer` | int | **是否记录 `.aer` 回放** | `1` |
| `recordEvent` | int | **是否记录 `.evt` 事件** | `0` |
| `recordLog` | int | **是否记录日志** | `1` |
| `scenariosTime.continueTime` | int | 持续时长（分钟） | `1440` |
| `scenariosTime.startDate` | string | 开始日期 `YYYY-MM-DD` | 与入口 `start_date` 一致 |
| `scenariosTime.startTime` | string | 开始时间 `HH:MM:SS` | 与入口 `start_time` 一致 |
| `startMode` | int | 启动模式 | `2` |
| `stepValue` | float | 步长 | `0.1` |
| `terminalLog` | int | 终端日志开关 | `1` |
| `timeRate` | float | 时间倍率 | `1.0` |
| `timeType` | int | 时间类型 | `1` |
| `scenariosId` | int | **业务侧工程 ID** | **`0`（留空）** |

---

## 3. 与「想定编辑 JSON」的关系

想定编辑（`scenarioJsonData`）是**可选输入、格式不定**。凡是能对上本文件字段的，**原值照抄**；对不上的，**原样保留**：

| JSON 里的键 | 处理 |
| :-- | :-- |
| 能对上 §2 表中任一字段（含语义等价、驼峰/下划线差异） | 落到对应字段，**值不改** |
| `scenariosId` 或类似的工程 / 想定 ID | 落到 `scenariosId`（**此时不置 0**） |
| 时间 / 时长 | 落到 `scenariosTime`，**同时**同步入口文件的 `start_date` / `start_time` / `end_time`（两处必须一致） |
| **认不出的键** | **原样并入本文件**（不改名、不删、不合并嵌套），并在交付说明中列「未识别字段清单」 |

**三条铁律**：① 不丢字段；② 不改语义（字段名 / 嵌套 / 数组顺序保持原样）；③ 不猜单位（数值无单位时按本文件既有口径，如 `continueTime` 是**分钟**）。

> 若 JSON 与实验筹划在**兵力 / 阵营 / 任务**上冲突 → **停下来问用户**，不要用 JSON 覆盖想定内容。

---

## 4. 生成约定

1. **`scenariosTime` 必须与入口文件的 `start_date` / `start_time` / `end_time` 保持一致**（若来自 JSON，两处都要按 JSON 改）。
   - 例：入口 `start_date sep 15 2026` / `start_time 19:44:46` → `"startDate": "2026-09-15"` / `"startTime": "19:44:46"`。
   - 入口 `end_time 140 m` → `continueTime` 建议同量级（分钟）。
2. **`scenariosId` 一律置 `0`**，afsim-forge **不自行编造**，由业务侧填充。
3. `recordAer` / `recordEvent` / `recordLog` 缺省取 `1 / 0 / 1`；若用户明确要 `.evt` 事件文件，把 `recordEvent` 置 `1`。
4. 日期/时间格式固定：日期 `YYYY-MM-DD`，时间 `HH:MM:SS`。
