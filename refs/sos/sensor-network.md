# 传感器组网与信息流（sensor-network）

> **素材来源**：样例工程 `comm/*`、`network/*`、`medium/*`、`sensor/*`、`processor/*`。
> 通用方法论标注「待校验」。

---

## 1. 三层通信结构

```
┌─ 媒介层 medium/ ─────────────────────────────┐
│  MediumAABBCC  WSF_COMM_MEDIUM_UNGUIDED      │
│  物理信道：信道数、传播速度、误码率、丢包        │
└──────────────────────────────────────────────┘
                    ↑ 承载
┌─ 组件层 comm/ ───────────────────────────────┐
│  DATALINK      WSF_COMM_TRANSCEIVER          │
│  收发机：速率、开关、工作状态                   │
└──────────────────────────────────────────────┘
                    ↑ 组成
┌─ 网络层 network/ ────────────────────────────┐
│  NetworkA      WSF_COMM_NETWORK_AD_HOC       │
│  成员表：member <平台实例名> <comm名>          │
└──────────────────────────────────────────────┘
```

| 层 | 目录 | 关键块 | 关注点 |
| :-- | :-- | :-- | :-- |
| 媒介 | `medium/` | `medium` | 信道容量、误码、丢包 |
| 组件 | `comm/` | `comm` | 收发机能力、速率 |
| 网络 | `network/` | `network` | **谁能和谁通** |

---

## 2. 典型写法

### `comm/`（一个 comm 一个文件）

```text
comm DATALINK WSF_COMM_TRANSCEIVER
   on
   operational
   transfer_rate 100 mbits/sec
end_comm
```

### `network/`（成员用**实例名**）

```text
network NetworkA WSF_COMM_NETWORK_AD_HOC
   update_rate 1 s
   comm_list
      member RED_EWR_322728 EWR_DATALINK
      member GBI_LAUNCHER_322857 DATALINK
      member GBI_BATTERY_322860 DATALINK
      member GBI_BATTERY_322860 gbi_cmd_link
   end_comm_list
end_network
```

> ⚠️ `member` 第一个参数是 **`side/` 里的平台实例名**，不是类型名。
> 同一平台可挂多条 comm（如指挥车同时挂 `DATALINK` 与 `gbi_cmd_link`）。

### `medium/`

```text
medium MediumAABBCC WSF_COMM_MEDIUM_UNGUIDED
   channels 10
   use_sharing true
   mode a
      propagation_speed 3e8 m/s
      transfer_rate 100 mbits/s
      packet_loss_time 0 s
      bit_error_probability 0
      error_correction 0
   end_mode
end_medium
```

---

## 3. 平台内的信息流连线

```text
# platform/GBI_BATTERY.txt
comm DATALINK DATALINK
   internal_link GBI_DATA_MGR
   internal_link GBI_PROCESSOR_WITH_EWR_GUIDANCE
   internal_link data_mgr
end_comm
sensor TTR_RADAR TTR_RADAR
   internal_link processor_2100780702274809857
   internal_link data_mgr
end_sensor
```

**`internal_link <处理器名>`** —— 把传感器/通信的**数据交给处理器**。

典型流向：

```
sensor ──internal_link──▶ WSF_TRACK_PROCESSOR（航迹管理）
comm   ──internal_link──▶ WSF_TRACK_PROCESSOR（航迹管理）
                            │
                            └──report_to / via / to──▶ 网络（上报给上级）
```

---

## 4. 体系级信息流（跨平台）

```
RED_EWR_322728                GBI_BATTERY_322860             GBI_LAUNCHER_322857
   BLUE_EWR_RADAR_B              GBI_DATA_MGR                   GBI_DATA_MGR
        │ 探测航迹                     │ 汇总航迹                       │ 接收目标指示
        ▼                             ▼                              ▼
   EWR_DATALINK ──NetworkA──▶ DATALINK / gbi_cmd_link ──NetworkA──▶ DATALINK
        │                             │                              │
        └────── commander ────────────┴────────── commander ─────────┘
                 (上级：GBI_BATTERY_322860)
```

**两个关键机制**：

| 机制 | 写法 | 作用 |
| :-- | :-- | :-- |
| **网络可达性** | `network` 的 `comm_list.member` | 决定数据能否送达 |
| **上报意图** | 处理器的 `report_to` / `commander` / `via` / `to` | 决定数据**往哪报** |

> **两者必须同时正确**：只在 `network` 里加了成员，但处理器没写 `report_to`，数据不会流动。

---

## 5. 传感器组网的关键设计点

| 设计点 | 说明 |
| :-- | :-- |
| **探测范围互补** | 预警雷达（大范围、粗精度）→ 跟踪雷达（小范围、高精度） |
| **频段错开** | 样例：预警 `250 mhz`，跟踪 `9500 mhz` |
| **扫描模式** | 预警 `scan_mode both` + 大 `azimuth_scan_limits`（±45°）；跟踪窄扫描（±1°~±5°） |
| **跟踪容量** | `hits_to_establish_track` / `hits_to_maintain_track` 决定航迹建立与维持难度 |
| **航迹老化** | `purge_interval`（如 `60 s`）决定航迹保留时长 |
| **交接** | 预警航迹经数据链交给指挥节点，再下达给跟踪/交战单元 |

---

## 6. 常见"通不了"的排查顺序

1. `network` 的 `member` 是否用了**实例名**（而非类型名）？
2. 该平台的 `comm` 名是否与 `member` 第二个参数**一致**？
3. 平台 `platform_type` 内是否**挂了**这条 `comm`？
4. `comm` 是否 `on` + `operational`？
5. 处理器的 `via` / `to` 是否指向**真实存在的 comm / 网络名**？
6. 处理器的 `internal_link` 是否指向**真实存在的处理器名**？
7. `medium/` 是否已 include 且参数合理（`bit_error_probability`、`packet_loss_time`）？

---

## 7. 待校验项

- 各 comm 的**频段/速率**是否与实际装备一致；
- `medium` 的信道参数（`channels`、`use_sharing`）业务口径；
- 是否存在**多网络分层**（如指挥网 + 数据网分离）的标准做法。
