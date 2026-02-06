#!/bin/bash

# 加载通用工具脚本
LOG_FILE="logs/ios_build.log"
source "$(dirname "$0")/utils.sh"

trap 'log_error "构建中断"; exit 1' ERR

# 0. 平台检查
if [[ "$OSTYPE" != "darwin"* ]]; then
    log_error "iOS 构建只能在 macOS 上进行。"
    exit 1
fi

# 接收环境参数，默认为 dev
FLAVOR=${1:-dev}
log_info "开始构建 [${FLAVOR^^}] 环境的 iOS App (IPA)..."

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

# 4. 构建 IPA
# --flavor: 对应 iOS 的 Build Configuration 或 Scheme 映射
# -t: 指定入口文件
# --export-method: 指定导出方式 (ad-hoc, app-store, enterprise, development)
# 这里使用 --no-codesign 方便 CI 或没有配置证书的环境，实际发布时需根据需求调整
log_info "正在打包 [${FLAVOR^^}] IPA..."
flutter build ipa \
    --release \
    --flavor "$FLAVOR" \
    -t "lib/main_$FLAVOR.dart" \
    --no-codesign \
    --obfuscate \
    --split-debug-info=build/ios/symbols

# 5. 整理产物
OUTPUT_DIR="build/outputs/release_ipas/$FLAVOR"
mkdir -p "$OUTPUT_DIR"

# 复制生成的 IPA 目录或文件
# flutter build ipa 会在 build/ios/ipa 目录下生成产物
if [ -d "build/ios/ipa" ]; then
    cp -R build/ios/ipa/*.ipa "$OUTPUT_DIR/" 2>/dev/null || \
    log_warning "未在 build/ios/ipa 中找到 .ipa 文件，可能仅生成了 .xcarchive"
fi

log_success "构建完成！环境: $FLAVOR"
log_info "产物目录: $OUTPUT_DIR"
log_info "注意: 当前使用了 --no-codesign，如需发布请在 Xcode 中签名或配置导出选项。"

# 打开产物目录
open "$OUTPUT_DIR"
