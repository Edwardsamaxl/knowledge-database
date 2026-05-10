#!/bin/bash
# Learner 知识库自动同步脚本
# 运行于云端 Ubuntu 服务器（hermes-agent，43.173.247.213）
# 频率：每两天同步一次

set -euo pipefail

REPO_DIR="${LEARNER_REPO_DIR:-$HOME/knowledge-database}"
BRANCH="${LEARNER_BRANCH:-main}"
LOG_FILE="$REPO_DIR/learner/sync.log"

# 确保在仓库目录
cd "$REPO_DIR" || {
    echo "$(date '+%Y-%m-%d %H:%M:%S') ERROR: Cannot cd to $REPO_DIR" >> "$LOG_FILE"
    exit 1
}

# 确保使用 SSH remote（避免 HTTPS 认证问题）
git remote set-url origin git@github.com:Edwardsamaxl/knowledge-database.git 2>/dev/null || true

# 检查是否有变更（包括未跟踪文件）
if git diff --quiet && git diff --staged --quiet && [ -z "$(git ls-files --others --exclude-standard learner/)" ]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') INFO: No changes to sync" >> "$LOG_FILE"
    exit 0
fi

# 先拉取最新（处理本地/云端并发修改）
echo "$(date '+%Y-%m-%d %H:%M:%S') INFO: Pulling latest changes..." >> "$LOG_FILE"
if ! git pull origin "$BRANCH" --no-rebase >> "$LOG_FILE" 2>&1; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') WARN: Pull failed, attempting to continue..." >> "$LOG_FILE"
fi

# 添加 learner 目录所有变更
git add learner/
# 排除 sync log，防止无限循环
git reset HEAD learner/sync.log 2>/dev/null || true

# 生成提交信息（包含变更摘要）
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
DATE=$(date '+%Y-%m-%d')
# 统计变更文件数
CHANGED_FILES=$(git diff --cached --name-only | wc -l)
COMMIT_MSG="auto(learner): sync $TIMESTAMP

- changed files: $CHANGED_FILES
- source: hermes-agent (43.173.247.213)"

# 提交（如果有内容的话）
if git diff --cached --quiet; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') INFO: Nothing to commit after staging" >> "$LOG_FILE"
    exit 0
fi

git commit -m "$COMMIT_MSG" >> "$LOG_FILE" 2>&1 || true

# 推送
if git push origin "$BRANCH" >> "$LOG_FILE" 2>&1; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') INFO: Sync completed successfully" >> "$LOG_FILE"
else
    echo "$(date '+%Y-%m-%d %H:%M:%S') ERROR: Push failed" >> "$LOG_FILE"
    exit 1
fi
