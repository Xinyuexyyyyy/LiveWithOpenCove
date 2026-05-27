# Timeline

> 会话流水。每次会话结束后，经用户确认追加到顶部。

---

## 2026-05-22 16:40

- **做了什么：** notebook-cli v0.3 全文搜索原型跑通。集成 ripgrep 作为后端，封装 `nb search <query>` 命令，支持 `--tag`、`--since`、`--limit` 三个参数。
- **产出：** `src/search.rs`、`src/cli/search_cmd.rs`，单元测试 11 项全过。
- **位置：** `~/code/notebook-cli/`
- **下一步：** 接入到 TUI 模式（`nb tui` 进入后用 `/` 触发搜索），需要决定结果列表的 UI 形态。
- **阻塞：** 无。

---

## 2026-05-20 22:15

- **做了什么：** 用户测试招募的 5 个人完成了第一轮访谈。痛点排序结果出乎意料：搜索 > 跨设备同步 > 模板 > 标签管理。同步原本以为是 P0，结果只有 2/5 提到。
- **产出：** `~/notes/maker/user-research/round1-summary.md`（5 份访谈摘要 + 痛点排序 + 我的判断）
- **位置：** `~/notes/maker/user-research/`
- **下一步：** v0.3 优先做搜索，同步推迟到 v0.4。
- **阻塞：** 无。

---

## 2026-05-18 14:30

- **做了什么：** 把 v0.2 留下的 Markdown 解析器从手写正则换成 `pulldown-cmark`。性能没变化但 bug 少了 8 个 issue。
- **产出：** PR #47 合入 main。
- **位置：** `~/code/notebook-cli/`
- **下一步：** 继续清理 v0.2 的技术债，重点是 storage 层的 SQLite migrations。
- **阻塞：** 无。

---

## 2026-05-15 11:05

- **做了什么：** 决定 v0.3 重点做搜索，不做同步。基于昨晚思考的"用户为什么用我而不用 Obsidian"。
- **产出：** [decisions.md](decisions.md) 新增决策记录。
- **位置：** `.claude/memory/decisions.md`
- **下一步：** 招募 5 个用户做访谈验证这个判断。
- **阻塞：** 无。

---

## 2026-05-12 20:00

- **做了什么：** 复盘 v0.2 上线后两周的反馈，整理出 23 条 issue。其中 9 条是同一个根因：导入器对带空格的文件名处理错误。
- **产出：** `~/code/notebook-cli/docs/v0.2-postmortem.md`，[lessons.md](lessons.md) 新增一条教训。
- **位置：** `~/code/notebook-cli/docs/`
- **下一步：** 把这 9 条合并成一个 PR 修。
- **阻塞：** 无。
