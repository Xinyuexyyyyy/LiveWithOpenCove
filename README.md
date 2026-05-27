# Live with OpenCove

> 一套把任意目录改造成 OpenCove-ready 工作区的最小骨架。

跑在 [OpenCove](https://github.com/deadwavewave/opencove) 上。

---

## 这套骨架解决什么

- **工作区即角色**：一个目录 = 一个"我"，做事 / 写作 / 研究互不污染
- **跨工作区共享 skill**：一份权威 skill，软链接到任意工作区，改一处全局生效
- **Claude / Codex 双端共享**：两个 agent 读同一份 skills 和 memory
- **agent 不能擅自写记忆**：6 文件 markdown 记忆，必须你点头才落盘
- **可观测、可 diff、可手改**：所有状态都是 markdown，没有黑箱

## 30 秒上手

把任何目录改造成一个 OpenCove-ready 工作区：

```bash
git clone https://github.com/Xinyuexyyyyy/LiveWithOpenCove
cd LiveWithOpenCove
./bin/init-workspace.sh ~/my-new-workspace
```

执行完后，`~/my-new-workspace/` 下会有一个完整的 `.claude/` 骨架（包含规则文件和 6 文件记忆）和 `AGENTS.md`，可以直接用 Claude Code 或 Codex 进入。

## 仓库结构

- [`workspace-skeleton/`](./workspace-skeleton/) — 单个工作区的最小骨架（CLAUDE.md + 6 文件记忆 + AGENTS.md）
- [`shared-skills-skeleton/`](./shared-skills-skeleton/) — 跨工作区共享 skill 池：架构说明 + 三件套（task-analyze / task-decompose / closeout）
- [`examples/`](./examples/) — 三个虚构的示例工作区（maker / writer / researcher），展示不同角色长什么样
- [`docs/`](./docs/) — 设计文档（如 [`global-rules.md`](./docs/global-rules.md) 推荐的全局规则）
- [`bin/init-workspace.sh`](./bin/init-workspace.sh) — 改造任意目录的脚本

## 设计原则

1. **收敛型 MVP 执行** — 每轮明确"只做 / 不做 / 可验证"，不扩展不预设
2. **6 文件记忆模型** — timeline / current-position / decisions / lessons / workspace-brief / workspace-map
3. **明确确认才写入** — agent 提建议，用户点头，才落盘；沉默 = 不写
4. **软链接共享 skill** — 公共 skill 池一份权威，工作区软链接消费

## 不是什么

- 不是 OpenCove 本身，是一套基于 OpenCove 的工作区组织方法
- 不是 agent 框架，是一套人和 agent 协作的规则
- 不是教程，是骨架；具体怎么用看你自己

## License

MIT
