#!/bin/bash
set -e

# 日志文件
LOG_FILE="Push_test.log"

# 输入仓库 URL
read -p "请输入要测试的 GitHub 仓库 URL: " REPO_URL

# 提取仓库名作为本地目录名
REPO_NAME=$(basename -s .git "$REPO_URL")
REPO_DIR="$PWD/$REPO_NAME"

# 如果本地目录不存在，则 clone
if [ ! -d "$REPO_DIR/.git" ]; then
    echo "📥 本地仓库不存在，正在 clone..."
    git clone "$REPO_URL" "$REPO_DIR"
else
    echo "📂 本地仓库已存在，使用目录: $REPO_DIR"
fi

cd "$REPO_DIR"

# 检测测试环境
if [ -n "$(git status --porcelain)" ]; then
    echo "⚠️ 工作区若有未提交的更改，请保存或 stash 后再运行测试"
    read -p "是否继续？(Y/N): " CONT
    if [[ ! "$CONT" =~ ^[Yy]$ ]]; then
        echo "❌ 已取消操作"
        exit 0
    fi
fi

# 显示远程 URL
REMOTE_URL=$(git remote get-url origin 2>/dev/null || echo "未配置 origin")
echo "🔍 当前远程仓库 URL: $REMOTE_URL"

# 检测仓库访问权限
echo "🔍 检测仓库访问权限..."
if git ls-remote "$REMOTE_URL" >/dev/null 2>&1; then
    echo "ℹ️ 仓库可访问 [可能是公有仓库或你有权限]"
else
    echo "⚠️ 仓库访问受限 [可能是私有或你没有权限]"
fi

# 确认继续
read -p "是否继续测试 push 权限？(Y/N): " CONFIRM
if [[ ! "$CONFIRM" =~ ^[Yy]$ ]]; then
    echo "❌ 已取消操作"
    exit 0
fi

# 生成唯一分支名
BRANCH="Push-test-$(date +%s)"
echo "🔍 正在创建临时分支: $BRANCH"

# 创建分支并提交测试文件
git checkout -b $BRANCH >/dev/null 2>&1
TEST_FILE="push_test.txt"
echo "test push $(date)" > $TEST_FILE
git add $TEST_FILE
git commit -m "test push access" >/dev/null 2>&1

# 尝试 push 并捕获错误
echo "🚀 尝试推送到远程..."
if OUTPUT=$(git push origin $BRANCH 2>&1); then
    echo "✅ 推送成功，你对该仓库有写权限！"
    echo "$(date): 推送成功，仓库: $REMOTE_URL, 分支: $BRANCH" >> "$LOG_FILE"
    PUSH_SUCCESS=true
else
    echo "❌ 推送失败，你可能没有写权限。"
    echo "错误信息: $OUTPUT"
    echo "$(date): 推送失败，仓库: $REMOTE_URL, 分支: $BRANCH, 错误: $OUTPUT" >> "$LOG_FILE"
    PUSH_SUCCESS=false
fi

# 是否清理临时分支和文件
read -p "是否删除临时分支和测试文件？(Y/N): " CLEANUP
if [[ "$CLEANUP" =~ ^[Yy]$ ]]; then
    echo "🧹 开始清理..."
    git push origin --delete $BRANCH >/dev/null 2>&1 || true
    git checkout - >/dev/null 2>&1
    git branch -D $BRANCH >/dev/null 2>&1
    rm -f $TEST_FILE
    git reset --hard HEAD~1 >/dev/null 2>&1 || true
    echo "✨ 清理完成，仓库已恢复测试前状态。"
else
    echo "⚠️ 临时分支 $BRANCH 和文件 $TEST_FILE 已保留，请手动清理"
fi

echo "ℹ️ 日志已记录到 $LOG_FILE"
