# config/run.json 字段说明

> `config/run.json` 是**业务侧运行控制文件**，非 AFSIM 语法，由上层工具读取。
> 生成时按本文件填写；**`scenariosId` 留空（`0`）**，由业务侧填充。

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

## 3. 生成约定

1. **`scenariosTime` 必须与入口文件的 `start_date` / `start_time` / `end_time` 保持一致**。
   - 例：入口 `start_date sep 15 2026` / `start_time 19:44:46` → `"startDate": "2026-09-15"` / `"startTime": "19:44:46"`。
   - 入口 `end_time 140 m` → `continueTime` 建议同量级（分钟）。
2. **`scenariosId` 一律置 `0`**，afsim-forge **不自行编造**，由业务侧填充。
3. `recordAer` / `recordEvent` / `recordLog` 缺省取 `1 / 0 / 1`；若用户明确要 `.evt` 事件文件，把 `recordEvent` 置 `1`。
4. 日期/时间格式固定：日期 `YYYY-MM-DD`，时间 `HH:MM:SS`。
