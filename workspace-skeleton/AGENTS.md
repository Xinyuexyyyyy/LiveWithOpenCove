# Agents

> Codex 端入口。让 Codex 进入这个工作区时知道去哪读规则、记忆和 skill。
> Claude Code 端入口在 `.claude/CLAUDE.md`。两者读同一份资产。

## 工作区规则

见 `.claude/CLAUDE.md`。

## 记忆位置

`.claude/memory/`，共 6 个文件：

- `workspace-brief.md` — 工作区性质
- `workspace-map.md` — 项目地图
- `timeline.md` — 会话流水
- `current-position.md` — 当前焦点
- `decisions.md` — 拍板决策
- `lessons.md` — 复盘记录

读写规则见 `.claude/CLAUDE.md` 第三节。**记忆写入需要用户明确确认**。

## Skills 位置

`skills/`（如果存在）。建议通过软链接指向 `~/shared-skills/<skill-name>`，让 Claude / Codex 共享同一份 skill。
