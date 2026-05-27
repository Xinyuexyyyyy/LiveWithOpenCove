# Skills

> 这个示例工作区的 skills 目录是个占位说明。
> 真实使用时，这里应该是软链接到 `~/shared-skills/<skill-name>` 的目录条目。

## 推荐的最小三件套

```bash
ln -sf ~/shared-skills/task-analyze    skills/task-analyze
ln -sf ~/shared-skills/task-decompose  skills/task-decompose
ln -sf ~/shared-skills/closeout        skills/closeout
```

## writer 工作区可能还会软链接的 skill

如果是真实的 writer workspace，可能还会用：

- `interview-writer` — 把零散素材整理成访谈稿
- `output-polisher` — 把成稿做最后的排版和导出
- `output-style-checker` — 中文文体检查

这些不在 v0.3 范围内，但你可以参考 [`shared-skills-skeleton/README.md`](../../shared-skills-skeleton/README.md) 了解怎么自己加。
