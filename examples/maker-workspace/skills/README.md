# Skills

> 这个示例工作区的 skills 目录是个占位说明。
> 在你自己的工作区里，这里应该是软链接到 `~/shared-skills/<skill-name>` 的目录条目。

## 推荐的最小三件套

```bash
ln -sf ~/shared-skills/task-analyze    skills/task-analyze
ln -sf ~/shared-skills/task-decompose  skills/task-decompose
ln -sf ~/shared-skills/closeout        skills/closeout
```

执行后 `ls -la skills/` 会看到三条软链接：

```
task-analyze    -> /Users/you/shared-skills/task-analyze
task-decompose  -> /Users/you/shared-skills/task-decompose
closeout        -> /Users/you/shared-skills/closeout
```

## 为什么不在 examples 里直接放软链接？

git 不能跨机器跟踪绝对路径软链接（每个用户的 `$HOME` 不一样）。所以 examples 里只放说明，不放真实软链接。

## 这个示例的特定 skill

如果是真实的 maker workspace，可能还会软链接：

- `harvest-tool` — 借鉴 GitHub 项目时用
- `output-layer` — 把 release notes 做成正式格式时用

但这些不在 v0.3 范围内。
