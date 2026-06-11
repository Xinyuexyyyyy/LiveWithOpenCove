#!/usr/bin/env bash
# init-workspace.sh — 把任意目录改造成 OpenCove-ready 工作区
#
# 用法：
#   ./bin/init-workspace.sh <target-dir>
#
# 例子：
#   ./bin/init-workspace.sh ~/my-new-workspace
#   ./bin/init-workspace.sh .

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SKELETON="$REPO_ROOT/workspace-skeleton"

if [[ $# -lt 1 ]]; then
  echo "用法: $0 <target-dir>" >&2
  echo "例子: $0 ~/my-new-workspace" >&2
  exit 1
fi

TARGET="$1"

# 展开 ~ 和创建目录
TARGET="${TARGET/#\~/$HOME}"
mkdir -p "$TARGET"
TARGET="$(cd "$TARGET" && pwd)"

echo "==> 目标工作区: $TARGET"

# 检查是否已经初始化
if [[ -d "$TARGET/.claude" ]]; then
  echo "警告: $TARGET/.claude 已存在。" >&2
  read -p "是否覆盖? [y/N] " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "已取消。"
    exit 0
  fi
fi

# 拷贝骨架（保留软链接友好）
echo "==> 拷贝骨架文件..."
mkdir -p "$TARGET/.claude/memory"

cp "$SKELETON/.claude/CLAUDE.md" "$TARGET/.claude/CLAUDE.md"
cp "$SKELETON/.claude/memory/"*.md "$TARGET/.claude/memory/"
cp "$SKELETON/AGENTS.md" "$TARGET/AGENTS.md"

# 拷贝机器维护脚本（记忆裁剪 / 经验体检 / 归位检测 / 产物整理）
mkdir -p "$TARGET/.claude/scripts"
cp "$SKELETON/.claude/scripts/"*.py "$TARGET/.claude/scripts/"

# 创建 skills 目录（空，等用户自己建软链接）
mkdir -p "$TARGET/skills"

echo ""
echo "==> 完成。新工作区已就绪："
echo "    $TARGET/"
echo "    ├── .claude/"
echo "    │   ├── CLAUDE.md"
echo "    │   ├── memory/   (记忆骨架: timeline / lessons / decisions ...)"
echo "    │   └── scripts/  (memory_gc / lessons_gc / check_map / organize)"
echo "    ├── AGENTS.md"
echo "    └── skills/       (空，按需软链接到 ~/shared-skills/)"
echo ""
echo "下一步："
echo "  1. 编辑 $TARGET/.claude/memory/workspace-brief.md 写入工作区性质"
echo "  2. 用 Claude Code 或 Codex 进入 $TARGET 开始工作"
echo "  3. （可选）建立软链接到公共 skill 池："
echo "     ln -sf ~/shared-skills/<skill-name> $TARGET/skills/<skill-name>"
