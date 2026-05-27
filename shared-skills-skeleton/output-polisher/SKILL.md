---
name: output-polisher
description: 为已写好的 Markdown 内容做轻量排版与 Obsidian 导出。不改正文，只做输出后处理。
status: stable
---

# Output Polisher

## 定位

这是输出层的后处理环。

它的职责很窄：

- 输入一份已经写好的 `article.md`
- 输出更适合 Obsidian 使用的版本
- 不改正文事实、不改论证结构、不重写文章

## 它做什么

1. 给重点句加轻量强调
2. 把结论、边界、摘要做成更好读的视觉块
3. 产出 Obsidian 可直接落库的不同档位版本

## 支持模式

| 模式 | 用途 | 默认 |
|------|------|------|
| `obsidian-clean` | 保守模式：callout + 层级标题 + 重点强调 | |
| `obsidian-enhanced` | 默认模式：原生增强模式，层级感更强，不依赖插件 | ✓ |
| `obsidian-rich` | 实验对比模式：依赖额外社区插件，不能当默认 | |

## 规则

- 不新增事实
- 不重写论证
- 不把装饰做成噪音
- 默认只把 `obsidian-enhanced` 当正式交付口径
- `clean` 和 `rich` 只保留手动模式
- 输入质量差时（如自动转写稿），宁可保守，也不脑补补齐

## 用法

```bash
# 默认别名，等同 obsidian-enhanced
node scripts/polish-markdown.js --mode obsidian --input article.md --output article.obsidian.md

# 显式指定三档
node scripts/polish-markdown.js --mode obsidian-clean    --input article.md --output article.obsidian-clean.md
node scripts/polish-markdown.js --mode obsidian-enhanced --input article.md --output article.obsidian-enhanced.md
node scripts/polish-markdown.js --mode obsidian-rich     --input article.md --output article.obsidian-rich.md

# 一次导出三档对比稿
node scripts/polish-markdown.js --all --input article.md --outdir export/
```

## 上游约束

调用 output-polisher 之前，建议正文已经通过你自己的写作质量检查（事实正确 / 结构清楚 / 语气一致）。output-polisher 不是写作器，也不是事实补全器。

## 不是什么

- 不是内容改写器
- 不是事实补全器
- 不是资料搜索器
- 不会把 `article.md` 重写成另一篇文章

## 实现说明

- 纯 Node.js（无 npm 依赖）
- 单个脚本 `scripts/polish-markdown.js` 约 400 行
- 支持 `--input` / `--output` / `--outdir` / `--mode` / `--all` 参数
