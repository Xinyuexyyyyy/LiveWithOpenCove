# Output Polisher

## 一句话

把一份已经写好的 `article.md` 润成更适合 Obsidian 使用的版本 — 不改正文，只做后处理。

## 快速试一下

```bash
cd <path-to-this-skill>
node scripts/polish-markdown.js --mode obsidian --input samples/source.md --output /tmp/source.obsidian.md
```

看 `/tmp/source.obsidian.md`，对比原文 `samples/source.md` — 重点句被轻量强调，关键结论被做成视觉块。

## 三档模式

| 模式 | 用途 |
|------|------|
| `obsidian-clean` | 保守模式 |
| `obsidian-enhanced`（默认） | 层级感更强的原生增强 |
| `obsidian-rich` | 依赖社区插件的实验模式 |

详细规则见 [SKILL.md](./SKILL.md)。

## 不做什么

- 不改正文事实
- 不改论证结构
- 不补全内容

## 实现说明

纯 Node.js，无 npm 依赖，单文件脚本 `scripts/polish-markdown.js` 约 400 行。
