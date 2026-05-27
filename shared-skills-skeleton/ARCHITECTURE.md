# 跨工作区 Skill 共享架构

> 一份权威 skill，多工作区软链接共享。改一处，全局生效。

---

## 核心原则

**每个 skill 只维护一份权威版本，其他工作区通过软链接引用。**

软链接是 Unix 的内置能力，不需要任何工具支持。Claude Code 和 Codex 都能正常解析软链接指向的文件。

---

## 推荐目录结构

```
~/shared-skills/
├── ARCHITECTURE.md          # 本文件的实例化版本
├── README.md                # 公共层入口说明
├── <skill-a>/               # 一个 skill 一个目录
│   ├── SKILL.md
│   └── ...
├── <skill-b>/
└── _tools/                  # 本机工具层（下划线前缀，不被扫描为 skill）
    └── auto-link.sh         # 批量建软链接
```

每个工作区的接入方式：

```
~/my-workspace/
├── .claude/
│   └── CLAUDE.md
└── skills/
    ├── <skill-a>  ->  ~/shared-skills/<skill-a>   # 软链接
    └── <skill-b>  ->  ~/shared-skills/<skill-b>   # 软链接
```

---

## Skill 分层建议

不按业务分类，按消耗 / 产出 / 依赖分层：

| 类型 | 特征 | 例子 |
|------|------|------|
| **轻型** | 单步、无副作用、几秒内完成 | 意图分析、任务拆解、收尾总结 |
| **重型** | 多步、有产出物、可能跨会话 | 调研、复杂项目规划 |
| **工具** | 被其他 skill 调用、不直接面向用户 | 输出层、规则检查、外部数据收割 |

避免按业务领域（"写作类 / 研究类 / 编码类"）分，因为业务边界会模糊，治理类边界（轻 / 重 / 工具）更稳定。

---

## 接入新工作区

1. 在新工作区下创建 `skills/` 目录
2. 按需建软链接到 `~/shared-skills/` 下的 skill：
   ```bash
   ln -sf ~/shared-skills/<skill-name> ~/my-workspace/skills/<skill-name>
   ```
3. 在工作区的 `.claude/CLAUDE.md` 中维护 Skills 边界表
4. 创建 `AGENTS.md`（让 Codex 也能读）

---

## 跨工作区 skill 命名冲突

- 共用 skill 改名时，需要同时更新所有工作区的软链接
- 如果某个工作区需要对共用 skill 做个性化，应把它移回本地，不要在 shared-skills 里加条件分支

---

## 验证软链接

```bash
# 确认软链接完整性（在工作区 skills/ 下）
ls -la skills/ | grep "^l"

# 确认同一 skill 跨区指向同一文件（inode 一致）
stat -f "%i" ~/shared-skills/<skill-name>/SKILL.md ~/my-workspace/skills/<skill-name>/SKILL.md
```

inode 一致 = 软链接生效，两端读的是同一份文件。

---

## 设计取舍

**为什么用软链接而不是 git submodule / package manager？**

- 软链接是内置能力，零依赖
- 改 skill 立即生效，不需要 commit / publish / pull
- agent 不感知"这是软链接"，按普通文件读
- 跨工作区一致性是 inode 级别的，比 commit hash 强

**代价**：跨设备同步需要自己处理（rsync / 网盘 / git 都行，但软链接本身不跨设备同步）。
