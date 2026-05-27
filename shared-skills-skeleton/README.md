# Shared Skills

> 跨工作区共享 skill 池的骨架。架构说明见 [`ARCHITECTURE.md`](./ARCHITECTURE.md)。

## 包含的 skill

这三个是任意工作区都用得到的最小闭环：

| Skill | 类型 | 触发场景 |
|-------|------|---------|
| [`task-analyze`](./task-analyze/SKILL.md) | 轻型 | 任何新需求、模糊想法、问题描述的第一步 |
| [`task-decompose`](./task-decompose/SKILL.md) | 轻型 | 已分析清楚的任务需要拆成多步执行 |
| [`closeout`](./closeout/SKILL.md) | 轻型 | 任务结束时输出 6 段总结，建议更新记忆 |

三个 skill 共同形成 **理解 → 拆 → 收** 的最小协作回路。

## 怎么用

### 方式一：直接拷贝到你的 shared-skills 池

```bash
# 假设你已经有 ~/shared-skills/
cp -r shared-skills-skeleton/task-analyze ~/shared-skills/
cp -r shared-skills-skeleton/task-decompose ~/shared-skills/
cp -r shared-skills-skeleton/closeout ~/shared-skills/
```

然后在工作区下软链接：

```bash
ln -sf ~/shared-skills/task-analyze ~/my-workspace/skills/task-analyze
ln -sf ~/shared-skills/task-decompose ~/my-workspace/skills/task-decompose
ln -sf ~/shared-skills/closeout ~/my-workspace/skills/closeout
```

### 方式二：从这里直接软链接

如果你想保持 LiveWithOpenCove 仓库作为权威源：

```bash
ln -sf <path-to-LiveWithOpenCove>/shared-skills-skeleton/task-analyze ~/my-workspace/skills/task-analyze
```

> **代价**：你 `git pull` 这个仓库时，软链接的 skill 会跟着更新。如果你已经做了本地修改，会有冲突。推荐方式一。

## 自己加 skill

在 `shared-skills-skeleton/` 下新建一个目录，放 `SKILL.md`，按这三个的格式写就行。每个 skill 一个目录，目录名就是 skill 名。

每个 `SKILL.md` 用 YAML frontmatter 声明 `name` / `description` / `status`，正文写：

- 定位
- 它在防什么坑
- 什么时候用 / 不什么时候用
- 默认工作方式
- 工作流（如果不止一步）
- 输出格式
- 最小验收

## 关于 skill 分层

按"消耗 / 产出 / 依赖"分，不按业务领域：

- **轻型**：单步、几秒内完成、无副作用（这三个都是）
- **重型**：多步、有产出物、可能跨会话
- **工具**：被其他 skill 调用、不直接面向用户

避免按"写作类 / 研究类 / 编码类"分 — 业务边界容易模糊，治理边界（轻 / 重 / 工具）更稳定。
