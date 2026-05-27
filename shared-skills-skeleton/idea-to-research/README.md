# Idea To Research

## 一句话

`idea-to-research` 用来处理"想法还太模糊，先判断后面该走哪条调研路线"的阶段。如果输入太模糊，它会先停在待澄清层，不会硬选一条路。

## 路线判断

根据用户原话和缩边界问答的回答，把模糊想法路由到下面四条路线之一：

| 路线 | 适用 | 下游 |
|------|------|------|
| `github-build` | 想抄 GitHub 成熟项目当起点 | 调用 [harvest-tool](https://github.com/Xinyuexyyyyy/harvest-tool) |
| `product-research` | 做产品调研 / 竞品分析 / MVP 拆分 | 通用调研流程（自己接） |
| `social-research` | 社会趋势 / 行业研究 / 多视角分析 | 通用调研流程（自己接） |
| `needs-clarification` | 信号太弱或多条路线打平 | 停下来问 1-3 个缩边界问题 |

## 怎么跑

```bash
# 任意工作区下，挂载好 skills/idea-to-research/ 后：
python3 skills/idea-to-research/skill.py align "我想抄 GitHub 上成熟的 skill，后面直接接开发实现"
python3 skills/idea-to-research/skill.py brief "我有个新功能想法，想先定义用户、需求和 MVP"
python3 skills/idea-to-research/skill.py prompt "我想研究一个 AI 能力秘书产品"
python3 skills/idea-to-research/skill.py run "我有个新想法，先帮我看看下一步怎么研究比较合适"
```

输出默认落在 `task_draft/consensus/<idea-slug>-<timestamp>/`，可以用 `--output-root /tmp/check` 改位置。

## 依赖说明

**仅 `github-build` 路线需要外部依赖：[harvest-tool](https://github.com/Xinyuexyyyyy/harvest-tool)**。其他三条路线（product / social / needs-clarification）零外部依赖。

如果你想用 `github-build` 路线，按下面任一方式让 idea-to-research 找到 harvest-tool：

| 方式 | 怎么做 |
|------|--------|
| 环境变量（推荐） | `export HARVEST_TOOL_ROOT=/path/to/harvest-tool` |
| 标准路径 | clone harvest-tool 到 `~/harvest-tool` / `~/code/harvest-tool` / `~/projects/harvest-tool` |
| 工作区内 | 把 harvest-tool 软链接到 `<workspace>/skills/harvest-tool/`（兼容旧布局） |

找不到时会给一条清晰的错误，不会沉默地崩。

## 什么时候该停

- 用户目标太模糊或多条路线信号打平 → 进入 `needs-clarification`
- 用户已经明确要走下游 skill → 不要重复兜圈
- 用户不同意推荐路线 → 先确认 override
- GitHub 路线依赖没跑通 → 只保留前置对齐结果，提示装 harvest-tool
- 用户只想看路线判断 → 不直接落盘

## 关键目录

```
idea-to-research/
├── SKILL.md              # 完整规则
├── README.md             # 本文件
├── skill.py              # CLI 入口（align / brief / prompt / run）
├── idea_to_research/
│   ├── __init__.py
│   └── pipeline.py       # 主流程
└── tests/
    └── test_pipeline_smoke.py  # 烟雾测试
```

## 最小验收

```bash
cd <path-to-this-skill>
python3 -m unittest tests.test_pipeline_smoke
```

11 项测试全过就 OK。

## 实现说明

- 纯 Python 标准库（无第三方依赖）
- harvest-tool 是**运行时**动态加载，不是 import 时硬依赖。其他三条路线不装 harvest-tool 也能跑。
