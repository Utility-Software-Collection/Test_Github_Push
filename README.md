# GitHub 推送权限测试脚本

这是一个用于测试你是否对某个 GitHub 仓库具有 **推送(Push)权限** 的 Bash 脚本.
脚本会自动创建一个临时分支并尝试推送一个测试文件，最终清理并恢复原状态，确保安全无残留.

## 🚀 功能特点

- ✅ 自动克隆或使用本地已有的仓库
- 🔍 检测仓库访问权限（公有/私有）
- 🧪 创建临时分支并尝试推送测试文件
- 📝 记录操作日志到本地文件
- 🧹 支持自动清理临时分支和文件
- ⚠️ 提供交互式确认，避免误操作

## 📦 使用方法

### 1. 下载脚本

将 `Test_Github_Push.sh` 下载到你的本地环境：

```bash
wget https://raw.githubusercontent.com/你的用户名/你的仓库名/main/Test_Github_Push.sh
```
或前往 [Release]([URL](https://github.com/Utility-Software-Collection/Test_Github_Push/releases/download/v0.1/Test_Github_Push.sh)) 下载 **.sh** 文件

### 2. 赋予执行权限
bash
```
chmod +x Test_Github_Push.sh
```

### 3. 运行脚本
```
./Test_Github_Push.sh
```
接着按照提示输入你要测试的 GitHub 仓库 URL.

## 使用示例

```markdown
## 🖥️ 使用示例


请输入要测试的 GitHub 仓库 URL: https://github.com/username/repo.git
📥 本地仓库不存在，正在 clone...
🔍 当前远程仓库 URL: https://github.com/username/repo.git
🔍 检测仓库访问权限...
ℹ️ 仓库可访问 [可能是公有仓库或你有权限]
是否继续测试 push 权限？(Y/N): Y
🔍 正在创建临时分支: Push-test-1640995200
🚀 尝试推送到远程...
✅ 推送成功，你对该仓库有写权限！
是否删除临时分支和测试文件？(Y/N): Y
🧹 开始清理...
✨ 清理完成，仓库已恢复测试前状态。
ℹ️ 日志已记录到 Push_test.log
 
 
```

## 📄 日志文件

脚本会记录每次测试的结果到 `Push_test.log`，内容包括：

- 测试时间
- 仓库 URL
- 分支名
- 推送是否成功
- 错误信息（如有）

## ⚠️ 注意事项

- 请确保你已安装 `git` 并配置好 SSH 或 HTTPS 认证方式
- 如果仓库是私有的，请确保你有权限访问
- 脚本会尝试清理临时分支，但如果中断执行，请手动清理
- 建议在测试前保存或提交本地更改，避免冲突

## 📜 许可证
本项目使用 MIT License
---
如果你觉得这个脚本有用，欢迎 ⭐ Star 这个仓库或提交 Issue 和 Pull Request！
