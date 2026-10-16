# 场景范本（refs/examples）

> ⚠️ **定位：语法范本，不是结构范本。**

这 4 个场景来自第三方项目（见 `../knowledge/SOURCE.md`），采用**单文件场景**写法——
与本 Skill 的**多目录工程**结构**不同**。

| 用途 | 是否适用 |
| :-- | :-- |
| 查 **块语法 / 参数 / 取值** | ✅ 适用 |
| 查 **脚本 API 用法** | ✅ 适用 |
| 照抄 **文件组织方式** | ❌ **不适用** —— 以 `refs/structure/project-layout.md` 为准 |

---

## 场景清单

| 文件 | 场景 | 可借鉴点 |
| :-- | :-- | :-- |
| `air_to_air_bvr.txt` | 超视距空战 | 雷达探测、导弹交战、航迹共享 |
| `air_to_ground_strike.txt` | 空对地打击 | 对地攻击流程、武器投放 |
| `iamd_layered_defense.txt` | 分层防御 | **体系类场景**：探测→跟踪→拦截的多层协同（最贴近本业务） |
| `isr_surveillance.txt` | ISR 侦察监视 | 传感器配置、巡逻航路 |

---

## 使用方式

1. 找**语法片段** → 直接读。
2. 落到**多目录工程** → 需**拆分**：把场景里的 `platform_type` 放进 `platform/`、`sensor` 放进 `sensor/`、`weapon` 放进 `weapon/`，并在各自文件头补 `include_once` 依赖。
3. 结构问题一律查 `refs/structure/`。
