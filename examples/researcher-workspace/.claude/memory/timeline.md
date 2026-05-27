# Timeline

> 研究流水。每次研究 session 结束后，经用户确认追加到顶部。

---

## 2026-05-22 17:30

- **做了什么：** 综述第二章（Constrained Decoding 方法对比）写到第三节。把现有方法分成三类：grammar-based、logits-bias-based、token-tree-based，并比较它们在专业领域的开销/效果权衡。
- **产出：** `~/research/slm-controllability/survey/chapter-2.md`（约 4,000 字，三节完成）。
- **位置：** `~/research/slm-controllability/survey/`
- **下一步：** 第四节"我们的取舍"，要回答为什么 PoC 选 token-tree-based。
- **阻塞：** 无。

---

## 2026-05-19 14:00

- **做了什么：** 把 38 篇 constrained decoding 论文重新过了一遍，做主题聚类。发现 3 篇被引最多的（Outlines, GBNF, JSONFormer）其实在解决三个不同的问题，过去我笔记里把它们混在一起了。
- **产出：** `~/research/literature/constrained-decoding/cluster-2026-05-19.md`，重新整理的主题聚类。
- **位置：** `~/research/literature/constrained-decoding/`
- **下一步：** 这个聚类成为综述第二章的骨架。
- **阻塞：** 无。

---

## 2026-05-12 21:00

- **做了什么：** baseline-eval 实验跑通。Llama-3-8B 在医疗术语规范化任务上 zero-shot 准确率 41%，加上 few-shot 提升到 58%，但仍有 23% 的输出格式错误。
- **产出：** `~/research/code/baseline-eval/results/2026-04-30.json`（注：日期是数据收集日期），分析报告 `analysis.md`。
- **位置：** `~/research/code/baseline-eval/`
- **下一步：** 这个 23% 的格式错误率正是 controlled decoding 要解决的核心痛点。综述里要把它作为问题陈述。
- **阻塞：** 无。

---

## 2026-05-05 11:00

- **做了什么：** 跟一个领域专家（医疗信息学）做了 90 分钟访谈。问的是"什么样的输出错误是临床上最不能容忍的"。答案出乎意料：不是事实错误，而是"用了非标准化的同义词"（如把"心肌梗塞"写成"心梗"，标准库里没有这个简写）。
- **产出：** `~/research/notes/expert-interview-2026-05-05.md`。
- **位置：** `~/research/notes/`
- **下一步：** 这条洞察会改变综述第一章的"问题陈述"段落 — 不能只讲"幻觉"，要讲"不规范"。
- **阻塞：** 无。

---

## 2026-04-28 16:00

- **做了什么：** 提交研究计划 v0.2 给前导师 review。改动：从原来的"SLM 在医疗领域的应用"收窄到"SLM 在医疗术语规范化任务上的可控性"。
- **产出：** `~/research/slm-controllability/proposal-v0.2.pdf`。
- **位置：** `~/research/slm-controllability/`
- **下一步：** 等 review 反馈，预计一周内。
- **阻塞：** 等导师反馈（不影响综述写作）。
