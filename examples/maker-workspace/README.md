# Maker Workspace（示例）

> 这是 LiveWithOpenCove 提供的示例工作区之一：**做产品的我**。
>
> 内容全部为虚构，用来展示一个真实在用的工作区长什么样。你可以把它整个拷贝走当起点，或者作为参考，理解 6 文件 memory 怎么填。

## 这个示例展示什么

- **真实 6 文件 memory 的填充感** — 不是空模板，每份都有虚构但合理的内容
- **skills/ 怎么软链接** — 这个工作区软链接了 `task-analyze` / `task-decompose` / `closeout`
- **AGENTS.md 怎么写** — 让 Codex 进入时知道去哪读规则和记忆

## 角色设定（虚构）

"我"是一个独立开发者，正在做一个叫 `notebook-cli` 的命令行笔记工具。当前在 v0.3 的开发周期里，主要在做"全文搜索"功能。

## 怎么用

```bash
# 整个拷贝走当起点
cp -r examples/maker-workspace ~/my-product-workspace

# 或者保留为参考，自己用 init-workspace.sh 起一个空的
./bin/init-workspace.sh ~/my-product-workspace
```

## 文件结构

```
maker-workspace/
├── .claude/
│   ├── CLAUDE.md          # 工作区规则
│   └── memory/            # 6 文件，全部填了虚构内容
│       ├── MEMORY.md
│       ├── workspace-brief.md
│       ├── workspace-map.md
│       ├── timeline.md
│       ├── current-position.md
│       ├── decisions.md
│       └── lessons.md
├── AGENTS.md              # Codex 入口
└── skills/                # 软链接到 shared-skills（示例中是占位说明）
    └── README.md
```
