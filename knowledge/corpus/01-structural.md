# 结构与装配（入口 / include / setup / 块闭合）

> **来源**：AFSIM 2.9.0 官方 demo 集（`demos/`，共 4,751 个 `.txt`）
> **性质**：原文摘抄，未改写；参数值为 demo 原值，仅供语法参考，不得直接用于新想定
> **检索**：按命令名 / 类型名 / 参数名搜索本卷；条目末尾给出出处，可回原文核对

### 入口文件骨架｜file_path / define_path_variable / log_file / include_once

- **关键词**：入口文件, entry, file_path, define_path_variable, log_file, include_once, 启动文件
- **出处**：`air_to_air/1v1.txt:10-18`
- **片段**：

```text
file_path .

define_path_variable SCNRIO  1v1             // 1v1 scenario
#define_path_variable SCNRIO 2v2             // 2v2 scenario
#define_path_variable SCNRIO 2v2_air_movers
#define_path_variable SCNRIO hvaa_dca        // 4v6 blue HVAA DCA
#define_path_variable SCNRIO escort          // 4v6 blue bomber escort

log_file output/${SCNRIO}.log
```

- **演示要点**：入口以 `file_path .` 开头（必须在首个 include 之前），随后定义路径变量、指定日志，再 include 装配中心；同一入口用注释切换多套路径变量

### 装配中心 setup.txt｜多 file_path / include 分类 / include_once

- **关键词**：setup, 装配中心, file_path, include, include_once, randomize_radar_frequencies, 装配清单
- **出处**：`aea_iads/setup.txt:15-30`
- **片段**：

```text
file_path .
file_path ../iads
file_path ../base_types

randomize_radar_frequencies true

include event_output.txt
include event_pipe.txt
include csv_event_output.txt
include terrain.txt

#include multi_thread.txt

# include common type definitions

include_once platforms/common.txt
```

- **演示要点**：setup 先声明多个 `file_path` 搜索根，再按类别 `include` 各功能文件、用 `include_once` 引入公共类型定义（避免重复定义）

### 平台部署｜position / altitude / speed

- **关键词**：position, 部署位置, 坐标, altitude, speed, msl, d:m:s, 经纬度
- **出处**：`air_to_air/scenarios/1v1.txt:13`
- **片段**：

```text
   position 00:00:36.035n 01:47:21.156e altitude 30000 ft msl speed 900 ft/s
```

- **演示要点**：坐标用 `d:m:s` 度分秒格式（带 `n`/`e` 方位），高度带 `ft` 与 `msl`，速度带 `ft/s`——数值一律带单位

### 块闭合｜zone … end_zone（完整小块）

- **关键词**：zone, end_zone, circular, maximum_radius, maximum_altitude, 块闭合, 区域
- **出处**：`aea_iads/platforms/large_sam_battalion.txt:104-108`
- **片段**：

```text
   zone full_kinematic
      circular
         maximum_altitude 30 km
         maximum_radius   25 nm
   end_zone
```

- **演示要点**：块以 `<类型> <名称> [类型名]` 开头、`end_<类型>` 收尾；内部子命令按缩进分层，同名 `end_*` 必须与起始关键字配对

### include 与 include_once｜使用边界

- **关键词**：include, include_once, 重复定义, 装配顺序, 头文件
- **出处**：`aea_iads/setup.txt:21-30`（上一条 setup 片段中可见两者的实际用法）
- **片段**：

```text
include event_output.txt
include event_pipe.txt
include csv_event_output.txt
include terrain.txt

#include multi_thread.txt

# include common type definitions

include_once platforms/common.txt
```

- **演示要点**：功能类文件用 `include`（可多处重复引入）；类型定义等"只能定义一次"的文件用 `include_once`，第二处引用会被静默跳过
