#!/bin/bash

# --- 严格模式 (Defensive Bash) ---
set -Eeuo pipefail

# 获取脚本所在目录
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
LOG_DIR="$PROJECT_ROOT/logs"
mkdir -p "$LOG_DIR"

# 引用通用工具脚本
source "$SCRIPT_DIR/utils.sh"

# 定义错误处理
trap 'log_error "脚本在第 $LINENO 行出错，请检查输出信息。"; exit 1' ERR

# --- 帮助信息 ---
function show_help() {
    echo -e "${BOLD}用法:${NC} $0 [命令] [选项]"
    echo ""
    echo -e "${BOLD}开发命令:${NC}"
    echo "  analyze              运行静态代码分析"
    echo "  analyze-strict       严格模式代码分析 (警告/提示均视为失败)"
    echo "  format               格式化代码"
    echo "  fix                  自动修复代码问题"
    echo "  ready                执行代码准备 (format + fix + analyze)"
    echo "  test                 运行测试"
    echo "  build                运行 build_runner 生成代码"
    echo "  watch                运行 build_runner 监听模式"
    echo "  gen:i18n             生成国际化代码"
    echo "  gen:icons            生成应用图标"
    echo "  clean                清理构建文件"
    echo "  prepare              准备开发环境 (deps + build + gen:i18n)"
    echo ""
    echo -e "${BOLD}构建命令:${NC}"
    echo "  build:apk [模式]     构建 Android 包 (模式: google/fat/split/all, 默认: all)"
    echo "  build:ios           构建 iOS IPA"
    echo "  build:all            构建所有 Android 包 (AAB + APK)"
    echo ""
    echo -e "${BOLD}运行命令:${NC}"
    echo "  run:offline          离线运行 (指定设备)"
    echo ""
    echo -e "${BOLD}示例:${NC}"
    echo "  $0 prepare"
    echo "  $0 build:apk all"
    echo "  $0 build:ios"
    echo "  $0 ready"
}

# --- 检查 Flutter 环境 ---
function check_flutter() {
    require_cmd flutter
}

# --- 获取依赖 ---
function get_deps() {
    log_info "获取项目依赖..."
    cd "$PROJECT_ROOT"
    flutter pub get --no-example
    log_success "依赖获取完成"
}

# --- 开发命令实现 ---
function cmd_analyze() {
    log_info "运行静态代码分析..."
    cd "$PROJECT_ROOT"
    flutter analyze | grep -v "info •" || true
    log_success "代码分析完成"
}

function cmd_analyze_strict() {
    log_info "运行严格模式代码分析 (Fatal Infos/Warnings)..."
    cd "$PROJECT_ROOT"
    flutter analyze --fatal-infos --fatal-warnings
    log_success "严格模式代码分析完成"
}

function cmd_format() {
    log_info "格式化代码..."
    cd "$PROJECT_ROOT"
    dart format lib test
    log_success "代码格式化完成"
}

function cmd_fix() {
    log_info "自动修复代码问题..."
    cd "$PROJECT_ROOT"
    dart fix --apply
    log_success "代码自动修复完成"
}

function cmd_ready() {
    log_info "执行代码准备 (format + fix + analyze)..."
    cmd_format
    cmd_fix
    cmd_analyze
    log_success "代码准备全部完成！"
}

function cmd_test() {
    log_info "运行测试..."
    cd "$PROJECT_ROOT"
    flutter test
    log_success "所有测试运行完成"
}

function cmd_build() {
    log_info "运行 build_runner 生成代码..."
    cd "$PROJECT_ROOT"
    dart run build_runner build --delete-conflicting-outputs
    log_success "代码生成完成"
}

function cmd_watch() {
    log_info "运行 build_runner 监听模式..."
    cd "$PROJECT_ROOT"
    dart run build_runner watch --delete-conflicting-outputs
}

function cmd_gen_i18n() {
    log_info "生成国际化代码..."
    cd "$PROJECT_ROOT"
    dart run slang
    log_success "国际化代码生成完成"
}

function cmd_gen_icons() {
    log_info "生成应用图标..."
    cd "$PROJECT_ROOT"
    dart run flutter_launcher_icons
    log_success "应用图标生成完成"
}

function cmd_clean() {
    log_info "清理构建文件..."
    cd "$PROJECT_ROOT"
    dart run build_runner clean 2>/dev/null || true
    find lib -name "*.g.dart" -type f -delete 2>/dev/null || true
    find lib -name "*.freezed.dart" -type f -delete 2>/dev/null || true
    flutter clean
    log_success "清理完成"
}

function cmd_prepare() {
    log_info "准备开发环境 (deps + build + gen:i18n)..."
    get_deps
    cmd_build
    cmd_gen_i18n
    log_success "开发环境准备完成！"
}

# --- 构建命令实现 ---
function cmd_build_apk() {
    local MODE=${1:-all}

    if [[ "$MODE" != "google" && "$MODE" != "fat" && "$MODE" != "split" && "$MODE" != "all" ]]; then
        log_error "不支持的构建模式 '$MODE'. 请使用 google, fat, split 或 all."
        exit 1
    fi

    log_info "开始构建 Android 包..."

    check_flutter
    cd "$PROJECT_ROOT"

    # 准备环境
    log_info "正在准备环境 (prepare)..."
    cmd_prepare

    # 静态检查
    log_info "正在执行静态分析..."
    cmd_analyze

    local DART_DEFINE=""
    if [[ -f "config/env_prod.json" ]]; then
        DART_DEFINE="--dart-define-from-file=config/env_prod.json"
    fi

    OUTPUT_DIR="build/outputs/release_apks"
    mkdir -p "$OUTPUT_DIR"

    if [[ "$MODE" == "google" || "$MODE" == "all" ]]; then
        log_info "正在打包 Google Play AAB..."
        flutter build appbundle --release $DART_DEFINE --obfuscate --split-debug-info=build/app/outputs/symbols
        cp build/app/outputs/bundle/release/app-release.aab "$OUTPUT_DIR/app-release.aab"
    fi

    if [[ "$MODE" == "fat" || "$MODE" == "all" ]]; then
        log_info "正在打包通用 APK (Fat APK)..."
        flutter build apk --release $DART_DEFINE --obfuscate --split-debug-info=build/app/outputs/symbols
        cp build/app/outputs/flutter-apk/app-release.apk "$OUTPUT_DIR/app-release.apk"
    fi

    if [[ "$MODE" == "split" ]]; then
        log_info "正在打包分架构 APK..."
        flutter build apk --release $DART_DEFINE --split-per-abi --obfuscate --split-debug-info=build/app/outputs/symbols
        cp build/app/outputs/flutter-apk/app-*-release.apk "$OUTPUT_DIR/" 2>/dev/null || true
    fi

    log_success "构建成功！模式: $MODE"
    log_info "产物目录: $OUTPUT_DIR"

    if [[ "$OSTYPE" == "darwin"* ]]; then
        open "$OUTPUT_DIR"
    fi
}

function cmd_build_ios() {
    log_info "开始构建 iOS IPA..."

    check_flutter
    cd "$PROJECT_ROOT"

    if [[ -f "$SCRIPT_DIR/build_ios.sh" ]]; then
        "$SCRIPT_DIR/build_ios.sh"
    else
        log_warning "build_ios.sh 不存在，使用默认方式构建..."
        flutter build ipa \
            --release \
            --obfuscate \
            --split-debug-info=build/ios/symbols
    fi

    log_success "iOS IPA 构建完成"
}

function cmd_build_all() {
    log_info "正在构建所有 Android 包..."

    check_flutter
    cd "$PROJECT_ROOT"

    # 1. 检查环境
    log_info "正在检查 Flutter 环境..."

    # 2. 预检查
    log_info "获取最新依赖..."
    get_deps

    # 3. 准备环境
    log_info "正在准备环境..."
    cmd_prepare

    # 4. 静态检查
    log_info "正在执行静态分析..."
    cmd_analyze

    cmd_build_aab
    cmd_build_apk_fat
    cmd_build_apk_split

    # 8. 汇总输出结果
    log_info "--------------------------------------------------"
    log_success "打包任务全部完成！"
    log_info "--------------------------------------------------"
    log_info "Google AAB 路径: build/app/outputs/bundle/release/"
    log_info "通用 APK 路径:   build/app/outputs/flutter-apk/app-release.apk"
    log_info "分架构 APK 路径: build/app/outputs/flutter-apk/"
    log_info "--------------------------------------------------"
}

function cmd_build_aab() {
    log_info "正在构建 Google Play 专用 AAB (Android App Bundle)..."
    flutter build appbundle --release --obfuscate --split-debug-info=build/app/outputs/symbols
}

function cmd_build_apk_fat() {
    log_info "正在构建通用 APK (Fat APK)..."
    flutter build apk --release --obfuscate --split-debug-info=build/app/outputs/symbols
}

function cmd_build_apk_split() {
    log_info "正在构建分架构 APK (arm64-v8a, armeabi-v7a)..."
    flutter build apk --release --split-per-abi --obfuscate --split-debug-info=build/app/outputs/symbols
}

function cmd_run_offline() {
    log_info "离线运行 (指定设备: ADDK6R3A12003434)..."
    cd "$PROJECT_ROOT"
    flutter run --offline -d ADDK6R3A12003434
}

# --- 主逻辑 ---
if [ $# -eq 0 ]; then
    show_help
    exit 0
fi

COMMAND="$1"
shift

case "$COMMAND" in
    analyze)
        cmd_analyze
        ;;
    analyze-strict)
        cmd_analyze_strict
        ;;
    format)
        cmd_format
        ;;
    fix)
        cmd_fix
        ;;
    ready)
        cmd_ready
        ;;
    test)
        cmd_test
        ;;
    build)
        cmd_build
        ;;
    watch)
        cmd_watch
        ;;
    gen:i18n)
        cmd_gen_i18n
        ;;
    gen:icons)
        cmd_gen_icons
        ;;
    clean)
        cmd_clean
        ;;
    prepare)
        cmd_prepare
        ;;
    build:apk)
        cmd_build_apk "${1:-all}"
        ;;
    build:ios)
        cmd_build_ios
        ;;
    build:all)
        cmd_build_all
        ;;
    run:offline)
        cmd_run_offline
        ;;
    help|--help|-h)
        show_help
        ;;
    *)
        log_error "未知命令: $COMMAND"
        show_help
        exit 1
        ;;
esac
