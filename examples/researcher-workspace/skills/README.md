# Skills

> 这个示例工作区的 skills 目录是个占位说明。
> 真实使用时，这里应该是软链接到 `~/shared-skills/<skill-name>` 的目录条目。

## 推荐的最小三件套

```bash
ln -sf ~/shared-skills/task-analyze    skills/task-analyze
ln -sf ~/shared-skills/task-decompose  skills/task-decompose
ln -sf ~/shared-skills/closeout        skills/closeout
```

## researcher 工作区可能还会软链接的 skill

如果是真实的 researcher workspace，可能还会用：

- `paper-discovery` — 检索论文、建候选池
- `paper-screening` — 系统综述纳排（PICO / PRISMA）
- `paper-reading` — Keshav 三遍阅读法证据抽取
- `survey-writer` — 基于证据表写综述

这些不在 v0.3 范围内。你可以参考 [`shared-skills-skeleton/README.md`](../../shared-skills-skeleton/README.md) 了解怎么自己加。
