# Writer Workspace（示例）

> 这是 LiveWithOpenCove 提供的示例工作区之一：**写作的我**。
>
> 内容全部为虚构。展示一个内容创作者的工作区长什么样 — 跟做产品的工作区不一样的地方在于：项目地图记的是"在写的文章"而不是代码仓库，timeline 记的是"今天写到哪"而不是"今天 commit 了什么"。

## 角色设定（虚构）

"我"是一个 newsletter 作者，每周写一篇关于"AI 时代的工具与方法"的中长文。当前在写一个三篇连载，主题是"agent 不是新瓶装旧酒"。

## 怎么用

```bash
cp -r examples/writer-workspace ~/my-writing-workspace
```

## 跟 maker-workspace 的对比

| 维度 | maker | writer |
|-----|-------|--------|
| workspace-map | 代码仓库 + 状态 | 在写的文章 + 状态 |
| timeline | commit / 实验 / 用户测试 | 今天写到哪、收到什么反馈 |
| decisions | 技术选型 / 路线图 | 选题方向 / 文体选择 |
| lessons | 工程教训 | 写作教训（标题失败、读者反馈意外点） |

**两个工作区共用同一套规则和 skill 池**，但 memory 内容完全不同。这就是"工作区即角色"的含义。
