#!/bin/bash

# 加载通用工具脚本
LOG_FILE="logs/melos.log"
source "$(dirname "$0")/utils.sh"

trap 'log_error "安装中断"; exit 1' ERR


# 打印帮助信息
function show_help() {
    echo -e "${BOLD}用法:${NC} ./scripts/melos.sh [命令]"
    echo ""
    echo -e "${BOLD}可用命令:${NC}"
    echo "  analyze       运行静态代码分析"
    echo "  analyze-strict 严格模式代码分析 (警告/提示均视为失败)"
    echo "  format        格式化代码"
    echo "  fix           自动修复代码问题"
    echo "  test          运行测试"
    echo "  build         运行 build_runner 生成代码"
    echo "  watch         运行 build_runner 监听模式"
    echo "  gen:i18n      生成国际化代码"
    echo "  gen:icons     生成应用图标"
    echo "  build:apk     构建 Android APK (可接环境参数: dev/staging/prod)"
    echo "  build:ios     构建 iOS IPA (可接环境参数: dev/staging/prod)"
    echo "  run:offline   离线运行 (指定设备)"
    echo "  clean         清理构建文件"
    echo "  prepare       准备开发环境 (bootstrap + build + i18n)"
}

# 检查参数
if [ -z "$1" ]; then
    show_help
    exit 1
fi

COMMAND=$1

case $COMMAND in
    analyze)
        log_info "运行静态代码分析..."
        flutter analyze
        ;;
    analyze-strict)
        log_info "运行严格模式代码分析 (Fatal Infos/Warnings)..."
        flutter analyze --fatal-infos --fatal-warnings
        ;;
    format)
        log_info "格式化代码..."
        dart format lib test
        ;;
    fix)
        log_info "自动修复代码问题..."
        dart fix --apply
        ;;
    test)
        log_info "运行测试..."
        flutter test
        ;;
    build)
        log_info "运行 build_runner 生成代码..."
        dart run build_runner build --delete-conflicting-outputs
        ;;
    watch)
        log_info "运行 build_runner 监听模式..."
        dart run build_runner watch --delete-conflicting-outputs
        ;;
    gen:i18n)
        log_info "生成国际化代码..."
        dart run slang
        ;;
    gen:icons)
        log_info "生成应用图标..."
        dart run flutter_launcher_icons
        ;;
    build:apk)
        log_info "构建 Android APK..."
        ./scripts/build_apks.sh "$2"
        ;;
    build:ios)
        log_info "构建 iOS IPA..."
        ./scripts/build_ios.sh "$2"
        ;;
    run:offline)
        log_info "离线运行 (指定设备: ADDK6R3A12003434)..."
        flutter run --offline -d ADDK6R3A12003434
        ;;
    clean)
        log_info "清理构建文件..."
        flutter clean
        ;;
    prepare)
        log_info "准备开发环境 (bootstrap + build + i18n)..."
        dart run melos bootstrap
        $0 build
        $0 gen:i18n
        log_success "环境准备完成！"
        ;;
    *)
        log_error "未知命令: $COMMAND"
        show_help
        exit 1
        ;;
esac
