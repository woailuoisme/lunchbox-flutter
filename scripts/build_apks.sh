#!/bin/bash

# 加载通用工具脚本
LOG_FILE="logs/build.log"
source "$(dirname "$0")/utils.sh"

trap 'log_error "构建中断"; exit 1' ERR


# 接收环境参数，默认为 dev
FLAVOR=${1:-dev}
log_info "开始构建 [${FLAVOR^^}] 环境的多架构 APK..."

# 1. 基础检查
if [[ "$FLAVOR" != "dev" && "$FLAVOR" != "prod" && "$FLAVOR" != "staging" ]]; then
    log_error "不支持的环境 '$FLAVOR'. 请使用 dev, staging 或 prod."
    exit 1
fi

# 2. 同步与代码生成
log_info "正在准备环境 (bootstrap + generate)..."
./scripts/melos.sh prepare || { log_error "环境准备失败"; exit 1; }

# 3. 静态检查
log_info "正在执行静态分析..."
./scripts/melos.sh analyze || { log_error "代码分析失败"; exit 1; }

# 4. 构建 APK
# --flavor: 对应 Android 的 productFlavors
# -t: 指定入口文件，通常为 lib/main_dev.dart 等
log_info "正在打包 [${FLAVOR^^}] APK..."
flutter build apk \
    --release \
    --flavor "$FLAVOR" \
    -t "lib/main_$FLAVOR.dart" \
    --split-per-abi \
    --obfuscate \
    --split-debug-info=build/app/symbols

# 5. 整理产物
OUTPUT_DIR="build/outputs/release_apks/$FLAVOR"
mkdir -p "$OUTPUT_DIR"
# 修正文件名匹配规则，兼容 flavor 和 split-per-abi
cp build/app/outputs/flutter-apk/app-"$FLAVOR"-*-release.apk "$OUTPUT_DIR/" 2>/dev/null || \
cp build/app/outputs/flutter-apk/app-"$FLAVOR"-release.apk "$OUTPUT_DIR/"

log_success "构建成功！环境: $FLAVOR"
log_info "产物目录: $OUTPUT_DIR"

# macOS 自动打开
if [[ "$OSTYPE" == "darwin"* ]]; then
    open "$OUTPUT_DIR"
fi