# GitHub Push Permission Test Script

This is a Bash script designed to test whether you have **push** permissions for a specific GitHub repository. The script automatically creates a temporary branch and attempts to push a test file, then cleans up and restores the original state to ensure no residual changes.

## Language
  [ZH](https://github.com/Utility-Software-Collection/Test_Github_Push/blob/main/README.md)

## 🚀 Features

- ✅ Automatically clones or uses existing local repositories

- 🔍 Detects repository access permissions (public/private)

- 🧪 Creates temporary branches and attempts to push test files

- 📝 Logs operation results to local files

- 🧹 Supports automatic cleanup of temporary branches and files

- ⚠️ Provides interactive confirmation to prevent misoperations

## 📦 Usage

### 1. Download

Download `Test_Github_Push.sh` to your local environment:

```bash
wget https://raw.githubusercontent.com/Utility-Software-Collection/Test_Github_Push/main/Test_Github_Push.sh
```
Or visit [Release](https://github.com/Utility-Software-Collection/Test_Github_Push/releases/) to download the .sh file.

### 2. Grant Execution Permissions

```bash
chmod +x Test_Github_Push.sh
```

### 3. Run
```bash
./Test_Github_Push.sh
```
Then follow the prompts to enter the GitHub repository URL you want to test.

## 🖥️ Usage Example

```markdown
##  Test


Please enter the GitHub repository URL to test: https://github.com/username/repo.git
📥 Local repository doesn't exist, cloning...
🔍 Current remote repository URL: https://github.com/username/repo.git
🔍 Checking repository access permissions...
ℹ️ Repository is accessible [may be public or you have permissions]
    Continue testing push permissions? (Y/N): Y
🔍 Creating temporary branch: Push-test-1640995200
🚀 Attempting to push to remote...
✅ Push successful! You have write permissions to this repository!
    Delete temporary branch and test files? (Y/N): Y
🧹 Cleaning up...
✨ Cleanup completed, repository restored to pre-test state.
ℹ️ Log recorded to Push_test.log
 
 
```

## 📄 Log File

The script records each test result to `Push_test.log`, including:

- Test timestamp

- Repository URL

- Branch name

- Push success status

- Error messages (if any)）

## ⚠️ Precautions

- Ensure you have git installed and configured with SSH or HTTPS authentication

- If the repository is private, make sure you have access permissions

- The script attempts to clean up temporary branches, but manual cleanup may be needed if execution is interrupted

- Recommended to save or commit local changes before testing to avoid conflicts

## 📜 License
Test_Github_Push is licensed under the **The MIT License (MIT)** (https://mit-license.org/).
---
If you find this script useful, welcome to ⭐ Star this repository or submit Issues and Pull Requests!
