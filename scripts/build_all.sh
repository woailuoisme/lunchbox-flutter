#!/bin/bash

# --- 严格模式 (Defensive Bash) ---
set -Eeuo pipefail

# 获取脚本所在目录并引用 utils.sh
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
source "$SCRIPT_DIR/utils.sh"

# 定义错误处理
trap 'log_error "脚本在第 $LINENO 行出错，请检查输出信息。"; exit 1' ERR

# 1. 检查环境
log_info "正在检查 Flutter 环境..."
if ! command -v flutter &> /dev/null; then
    log_error "未找到 flutter 命令，请确保 Flutter 已正确安装并添加到 PATH。"
    exit 1
fi

# 2. 预检查
log_info "获取最新依赖..."
flutter pub get

# 3. 构建 Google Play 专用包 (AAB)
log_info "正在构建 Google Play 专用 AAB (Android App Bundle)..."
flutter build appbundle --release --obfuscate --split-debug-info=build/app/outputs/symbols

# 4. 构建通用 APK (包含所有架构)
log_info "正在构建通用 APK (Fat APK)..."
flutter build apk --release --obfuscate --split-debug-info=build/app/outputs/symbols

# 5. 构建分架构 APK (用于减小体积)
log_info "正在构建分架构 APK (arm64-v8a, armeabi-v7a)..."
flutter build apk --release --split-per-abi --obfuscate --split-debug-info=build/app/outputs/symbols

# 6. 汇总输出结果
log_info "--------------------------------------------------"
log_success "打包任务全部完成！"
log_info "--------------------------------------------------"
log_info "Google AAB 路径: build/app/outputs/bundle/release/"
log_info "通用 APK 路径:   build/app/outputs/flutter-apk/app-release.apk"
log_info "分架构 APK 路径: build/app/outputs/flutter-apk/"
log_info "--------------------------------------------------"
