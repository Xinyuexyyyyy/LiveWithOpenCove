# Live with OpenCove

> 我用 OpenCove 跑了一套多工作区 agent setup：3 个目录 = 3 个我（做事 / 写作 / 研究），跨 agent 共享一份 skill，agent 不能擅自写我的记忆。这是它的骨架，开源出来你可以直接抄。

跑在 [OpenCove](https://github.com/deadwavewave/opencove) 上。

---

## 这套设计在解决什么

如果你在用 Claude Code / Codex / Cursor，可能踩过这些坑：

- 上一会儿在写代码，下一会儿在写文章。agent 把两边上下文搅成一锅，建议越来越奇怪
- 同一套 skill 在 Claude 和 Codex 里各维护一份，改一处忘改另一处
- 让 agent 自动写记忆，结果它把"用户半夜抱怨产品"这种话也写进去了
- 三天没碰项目，回来打开 agent，它不记得上次到哪，你自己也想不起来
- skill 越加越多，最后变成一棵自己都找不到的目录树

这套骨架解决前 4 件事。第 5 件（skill 治理）有部分工具但还没全部开源。

它**不解决**：agent 本身的智力问题、多人团队协作、agent 之间的实时编排。

---

## 一份工作区长什么样

clone 仓库后跑：

```bash
./bin/init-workspace.sh ~/my-workspace
```

`~/my-workspace/` 就有了：

```
my-workspace/
├── .claude/
│   ├── CLAUDE.md                  # 这个工作区的规则（agent 必读）
│   └── memory/
│       ├── MEMORY.md              # 记忆索引
│       ├── workspace-brief.md     # 这个工作区是什么、做什么
│       ├── workspace-map.md       # 活跃项目地图
│       ├── timeline.md            # 会话流水（倒序追加）
│       ├── current-position.md    # 当前焦点、下一步、阻塞
│       ├── decisions.md           # 拍板决策（为什么这么做）
│       └── lessons.md             # 复盘（下次怎么做）
├── AGENTS.md                      # Codex 入口（读同一份资产）
└── skills/                        # 软链接到 ~/shared-skills/<name>
    ├── task-analyze    -> ~/shared-skills/task-analyze
    ├── task-decompose  -> ~/shared-skills/task-decompose
    └── ...
```

记忆全是 markdown — 你能 `cat`、能 `diff`、能 `grep`、能手改。**没有黑箱 sqlite，也没有 agent 偷偷写的字段**。

---

## 真实运行起来长什么样

场景：你打开 agent，说"我想给 notebook-cli 加个搜索功能"。

按这套规则，agent **不会直接动手**，先输出：

```
- 本轮只做：搜索功能的 CLI 入口（nb search）
- 本轮不做：TUI 集成、跨设备同步
- 做完可验证：cd notebook-cli && nb search "关键词" 能返回结果列表
```

你点头之后它才写代码。

做完时它收尾，输出：

```
## 收尾总结

### 我要做的事
给 notebook-cli 加 nb search CLI 命令

### 解决的问题
之前用户找不到 3 个月前写的笔记，需要全文检索

### 现在用户能做什么
cd notebook-cli && cargo run -- search "关键词"

### 下一步决策
要不要把搜索接入 TUI？要不要支持正则？

---
建议更新 timeline 和 current-position，确认写入？
```

**关键是最后那句**。agent 不自动写记忆，它给你看建议，你说"是"才写。说"否"或沉默 = 不写。

下一次 session 打开，agent 读 `current-position.md` 就知道"上次说要决定 TUI 集成 / 正则支持"，不用你重新交代上下文。

---

## 三个填好的示例工作区

`examples/` 下有 3 个虚构但完整的工作区，clone 下来直接看比读 README 快：

| 示例 | 虚构角色 | 节奏 | 看点 |
|---|---|---|---|
| [`maker-workspace`](./examples/maker-workspace) | 在做 `notebook-cli` 的独立开发者 | 周 | timeline 里是 commit / 用户访谈 / 实验数据 |
| [`writer-workspace`](./examples/writer-workspace) | 1,200 订阅 newsletter 作者 | 周 | timeline 里是写作进度 / 读者回复 / 标题选择 |
| [`researcher-workspace`](./examples/researcher-workspace) | 做 SLM 可控性的独立研究者 | 月-季 | timeline 里是论文阅读聚类 / 专家访谈 / 实验卡点 |

三个工作区**用同一套规则、同一套 skill 池**，但 memory 内容完全不同。这就是"工作区即角色"的含义。

直接打开 [`examples/maker-workspace/.claude/memory/timeline.md`](./examples/maker-workspace/.claude/memory/timeline.md) 看，颗粒度具体到"v0.3 全文搜索 CLI 跑通，11 项单元测试过"那种。

---

## 跟已有方案的差别

| 方案 | 它做什么 | 它不做的（这套来补） |
|---|---|---|
| Claude Code 官方 `CLAUDE.md` | 单文件全局规则 | 多工作区、跨 agent、记忆模型、skill 治理 |
| Cursor `.cursor/rules` | IDE 内规则注入 | 记忆、跨工具共享、长期项目状态 |
| Aider `.aider/` | 编程会话状态 | 角色分离、skill 复用 |
| 各种"AI 第二大脑"应用 | 知识库 + 检索 | 跟 agent 工作流的耦合、可执行规则 |

这套不是"更好的 CLAUDE.md"，是**把 CLAUDE.md / 跨 agent 共享 / 6 文件记忆 / skill 治理 / 写入权限模型装在同一个套件里**。

差异化不在"做了别人没做的事"，在"把别人各做一块的事合成同一个 setup"。

---

## 谁该用 / 谁不该用

**该用：**

- 一个人扮多个角色（白天写代码、晚上写文章、周末做研究）
- 同时用 Claude Code 和 Codex（或想给未来多 agent 平台留活口）
- 项目周期长（月-季级），三天不打开也想能续上
- 受不了 agent 自作主张写记忆、自作主张扩需求

**不该用：**

- 团队多人协作 — 这是单人 setup，`current-position` 会冲突
- 一次性任务为主 — 6 文件记忆对短任务太重
- 想要 GUI 不想看 markdown
- 不会 / 不想用 unix 软链接

---

## 当前包含什么

**5 个 skill**（在 `shared-skills-skeleton/`）：

| Skill | 类型 | 是什么 |
|---|---|---|
| [`task-analyze`](./shared-skills-skeleton/task-analyze/SKILL.md) | 轻型 | 任何新需求的第一步 — 先把"用户到底想干什么"说清楚 |
| [`task-decompose`](./shared-skills-skeleton/task-decompose/SKILL.md) | 轻型 | 已分析清楚的任务拆成最多 5 个可验收步骤 |
| [`idea-to-research`](./shared-skills-skeleton/idea-to-research/SKILL.md) | 重型（Python + 测试） | 模糊想法路由：抄 GitHub / 产品调研 / 社会调研 / 待澄清 |
| [`closeout`](./shared-skills-skeleton/closeout/SKILL.md) | 轻型 | 任务结束 6 段总结 + 记忆更新建议 |
| [`output-polisher`](./shared-skills-skeleton/output-polisher/SKILL.md) | 工具（Node.js） | Markdown → Obsidian 三档导出 |

**1 个姊妹仓库**：[`harvest-tool`](https://github.com/Xinyuexyyyyy/harvest-tool) — GitHub 借鉴型调研工具，独立维护。

**3 个示例工作区**（`examples/`）：完整填了虚构 memory，clone 下来能直接看。

**1 份推荐全局规则**（[`docs/global-rules.md`](./docs/global-rules.md)）：可选，对照着写自己的 `~/.claude/CLAUDE.md`。

---

## 30 秒上手

```bash
git clone https://github.com/Xinyuexyyyyy/LiveWithOpenCove
cd LiveWithOpenCove
./bin/init-workspace.sh ~/my-workspace
```

之后：

1. 编辑 `~/my-workspace/.claude/memory/workspace-brief.md` 写明这个工作区做什么
2. （可选）建公共 skill 池，软链接需要的 skill：
   ```bash
   mkdir -p ~/shared-skills
   cp -r shared-skills-skeleton/task-analyze ~/shared-skills/
   ln -sf ~/shared-skills/task-analyze ~/my-workspace/skills/task-analyze
   ```
3. 用 Claude Code 或 Codex 进入 `~/my-workspace/` 开始工作

---

## 仓库结构

- [`workspace-skeleton/`](./workspace-skeleton/) — 单个工作区最小骨架
- [`shared-skills-skeleton/`](./shared-skills-skeleton/) — 5 个 skill + 跨工作区软链接架构
- [`examples/`](./examples/) — 3 个虚构示例工作区
- [`docs/`](./docs/) — 设计文档
- [`bin/init-workspace.sh`](./bin/init-workspace.sh) — 改造任意目录的脚本

---

## 四条设计原则

1. **收敛型 MVP 执行** — 每轮"只做 / 不做 / 可验证"，不扩展不预设
2. **6 文件记忆模型** — 把 agent 记忆从"一锅 memory"拆成时间（timeline）、空间（workspace-map）、状态（current-position）、反思（decisions / lessons）、元（workspace-brief）五个维度
3. **明确确认才写入** — agent 提建议，用户点头，才落盘；沉默 = 不写
4. **软链接共享 skill** — 公共池一份权威，工作区软链接消费，改一处全局生效

---

## 不是什么

- 不是 OpenCove 本身 — 是基于 OpenCove 的工作区组织方法
- 不是 agent 框架 — 是人和 agent 协作的规则
- 不是给 agent 加智能 — 是把 agent 关在一个可观测、可叫停、可手改的盒子里

---

## License

MIT
