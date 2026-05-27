# Examples

三个虚构的示例工作区，展示不同角色的工作区长什么样。

| 示例 | 角色 | 节奏 | 主要产出 |
|-----|------|-----|---------|
| [`maker-workspace/`](./maker-workspace/) | 独立开发者 | 周 | 代码 / 功能发布 |
| [`writer-workspace/`](./writer-workspace/) | Newsletter 作者 | 周 | 文章 |
| [`researcher-workspace/`](./researcher-workspace/) | 独立研究者 | 月-季 | 综述 / 报告 |

## 三个示例的共同点

- 都用同一份 `.claude/CLAUDE.md` 规则模板
- 都有完整的 6 文件 memory（虚构填充）
- 都软链接到同一套 `shared-skills/`（task-analyze / task-decompose / closeout）

## 三个示例的不同点

| 维度 | maker | writer | researcher |
|-----|-------|--------|-----------|
| timeline 内容 | commit / 实验 / 用户测试 | 写作进度 / 读者回复 | 论文阅读 / 实验 / 卡点 |
| workspace-map 内容 | 代码仓库 | 文章稿 | 文献库 / 实验代码 |
| decisions 类型 | 技术选型 / 路线图 | 选题方向 / 文体选择 | 范围收窄 / 方法取舍 |
| lessons 类型 | 工程教训 | 写作教训 | 研究教训（卡住、文献囤积） |
| 时间尺度 | 周 | 周 | 月-季 |

这正是"**工作区即角色**"的含义 — 一套规则、一套骨架、一套 skill 池，但每个工作区有自己的内容和节奏。

## 怎么用

### 整个拷贝走当起点

```bash
cp -r examples/maker-workspace ~/my-product-workspace
```

然后修改 memory 内容，软链接你自己的 shared-skills。

### 作为参考自己起一个空的

```bash
./bin/init-workspace.sh ~/my-workspace
```

参考这三个示例的 memory 写法，自己填。

## 这些示例的内容是真的吗？

**不是。** 全部为虚构，但写得尽量贴近真实的工作流颗粒度（具体的 commit 消息、具体的访谈摘要、具体的论文数）。目的是让你看到"填起来长什么样"，不是给你一个真实模板。

虚构的人物：

- maker：在做 `notebook-cli`（命令行笔记工具，模仿 Obsidian 替代品的定位）
- writer：写 newsletter，1,200 订阅，主题"AI 时代的工具与方法"
- researcher：做"小型语言模型在医疗术语规范化上的可控性"研究

这些项目都不存在，但它们的工作流细节是从真实场景里抽象出来的。
