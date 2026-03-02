#!/bin/bash

# --- Strict Mode (Defensive Bash) ---
set -Eeuo pipefail

# Get script directory
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
LOG_DIR="$PROJECT_ROOT/logs"
mkdir -p "$LOG_DIR"

# Source utility script
source "$SCRIPT_DIR/utils.sh"

# Define error handling
trap 'log_error "Script failed at line $LINENO. Please check the output messages."; exit 1' ERR

# --- Help Information ---
function show_help() {
    echo -e "${BOLD}Usage:${NC} $0 [command] [options]"
    echo ""
    echo -e "${BOLD}Development Commands:${NC}"
    echo "  analyze              Run static code analysis"
    echo "  analyze-strict       Strict code analysis (treats warnings/infos as failures)"
    echo "  format               Format code"
    echo "  fix                  Automatically fix code issues"
    echo "  ready                Prepare code (format + fix + analyze)"
    echo "  test                 Run tests"
    echo "  build                Run build_runner to generate code"
    echo "  watch                Run build_runner in watch mode"
    echo "  gen:i18n             Generate internationalization code"
    echo "  gen:icons            Generate application icons"
    echo "  clean                Clean build artifacts"
    echo "  prepare              Prepare development environment (deps + build + gen:i18n)"
    echo ""
    echo -e "${BOLD}Build Commands:${NC}"
    echo "  build:apk [mode]     Build Android APK (modes: google/fat/split/all, default: all)"
    echo "  build:ios            Build iOS IPA"
    echo "  build:all            Build all Android artifacts (AAB + APK)"
    echo ""
    echo -e "${BOLD}Run Commands:${NC}"
    echo "  run:offline          Run offline on a specified device"
    echo ""
    echo -e "${BOLD}Examples:${NC}"
    echo "  $0 prepare"
    echo "  $0 build:apk all"
    echo "  $0 build:ios"
    echo "  $0 ready"
}

# --- Check Flutter Environment ---
function check_flutter() {
    require_cmd flutter
}

# --- Get Dependencies ---
function get_deps() {
    log_info "Fetching project dependencies..."
    cd "$PROJECT_ROOT"
    flutter pub get --no-example
    log_success "Dependencies fetched successfully"
}

# --- Development Command Implementation ---
function cmd_analyze() {
    log_info "Running static code analysis..."
    cd "$PROJECT_ROOT"
    flutter analyze | grep -v "info •" || true
    log_success "Code analysis completed"
}

function cmd_analyze_strict() {
    log_info "Running strict mode code analysis (Fatal Infos/Warnings)..."
    cd "$PROJECT_ROOT"
    flutter analyze --fatal-infos --fatal-warnings
    log_success "Strict mode code analysis completed"
}

function cmd_format() {
    log_info "Formatting code..."
    cd "$PROJECT_ROOT"
    dart format lib test
    log_success "Code formatting completed"
}

function cmd_fix() {
    log_info "Automatically fixing code issues..."
    cd "$PROJECT_ROOT"
    dart fix --apply
    log_success "Automatic code fix completed"
}

function cmd_ready() {
    log_info "Executing code preparation (format + fix + analyze)..."
    cmd_format
    cmd_fix
    cmd_analyze
    log_success "Code preparation fully completed!"
}

function cmd_test() {
    log_info "Running tests..."
    cd "$PROJECT_ROOT"
    flutter test
    log_success "All tests ran successfully"
}

function cmd_build() {
    log_info "Running build_runner to generate code..."
    cd "$PROJECT_ROOT"
    dart run build_runner build --delete-conflicting-outputs
    log_success "Code generation completed"
}

function cmd_watch() {
    log_info "Running build_runner in watch mode..."
    cd "$PROJECT_ROOT"
    dart run build_runner watch --delete-conflicting-outputs
}

function cmd_gen_i18n() {
    log_info "Generating internationalization code..."
    cd "$PROJECT_ROOT"
    dart run slang
    log_success "Internationalization code generation completed"
}

function cmd_gen_icons() {
    log_info "Generating application icons..."
    cd "$PROJECT_ROOT"
    dart run flutter_launcher_icons
    log_success "Application icons generation completed"
}

function cmd_clean() {
    log_info "Cleaning build artifacts..."
    cd "$PROJECT_ROOT"
    dart run build_runner clean 2>/dev/null || true
    find lib -name "*.g.dart" -type f -delete 2>/dev/null || true
    find lib -name "*.freezed.dart" -type f -delete 2>/dev/null || true
    flutter clean
    log_success "Cleaning completed"
}

function cmd_prepare() {
    log_info "Preparing development environment (deps + build + gen:i18n)..."
    get_deps
    cmd_build
    cmd_gen_i18n
    log_success "Development environment preparation completed!"
}

# --- Build Command Implementation ---
function cmd_build_apk() {
    local MODE=${1:-all}

    if [[ "$MODE" != "google" && "$MODE" != "fat" && "$MODE" != "split" && "$MODE" != "all" ]]; then
        log_error "Unsupported build mode '$MODE'. Please use google, fat, split, or all."
        exit 1
    fi

    log_info "Starting Android package build..."

    check_flutter
    cd "$PROJECT_ROOT"

    # Prepare environment
    log_info "Preparing environment (prepare)..."
    cmd_prepare

    # Static check
    log_info "Executing static analysis..."
    cmd_analyze

    local DART_DEFINE=""
    if [[ -f "config/env_prod.json" ]]; then
        DART_DEFINE="--dart-define-from-file=config/env_prod.json"
    fi

    OUTPUT_DIR="build/outputs/release_apks"
    mkdir -p "$OUTPUT_DIR"

    if [[ "$MODE" == "google" || "$MODE" == "all" ]]; then
        log_info "Packaging Google Play AAB..."
        flutter build appbundle --release $DART_DEFINE --obfuscate --split-debug-info=build/app/outputs/symbols
        cp build/app/outputs/bundle/release/app-release.aab "$OUTPUT_DIR/app-release.aab"
    fi

    if [[ "$MODE" == "fat" || "$MODE" == "all" ]]; then
        log_info "Packaging Fat APK..."
        flutter build apk --release $DART_DEFINE --obfuscate --split-debug-info=build/app/outputs/symbols
        cp build/app/outputs/flutter-apk/app-release.apk "$OUTPUT_DIR/app-release.apk"
    fi

    if [[ "$MODE" == "split" ]]; then
        log_info "Packaging split-ABI APKs..."
        flutter build apk --release $DART_DEFINE --split-per-abi --obfuscate --split-debug-info=build/app/outputs/symbols
        cp build/app/outputs/flutter-apk/app-*-release.apk "$OUTPUT_DIR/" 2>/dev/null || true
    fi

    log_success "Build successful! Mode: $MODE"
    log_info "Artifacts directory: $OUTPUT_DIR"

    if [[ "$OSTYPE" == "darwin"* ]]; then
        open "$OUTPUT_DIR"
    fi
}

function cmd_build_ios() {
    log_info "Starting iOS IPA build..."

    check_flutter
    cd "$PROJECT_ROOT"

    if [[ -f "$SCRIPT_DIR/build_ios.sh" ]]; then
        "$SCRIPT_DIR/build_ios.sh"
    else
        log_warning "build_ios.sh not found, using default build method..."
        flutter build ipa \
            --release \
            --obfuscate \
            --split-debug-info=build/ios/symbols
    fi

    log_success "iOS IPA build completed"
}

function cmd_build_all() {
    log_info "Building all Android artifacts..."

    check_flutter
    cd "$PROJECT_ROOT"

    # 1. Check environment
    log_info "Checking Flutter environment..."

    # 2. Pre-check
    log_info "Fetching latest dependencies..."
    get_deps

    # 3. Prepare environment
    log_info "Preparing environment..."
    cmd_prepare

    # 4. Static check
    log_info "Executing static analysis..."
    cmd_analyze

    cmd_build_aab
    cmd_build_apk_fat
    cmd_build_apk_split

    # 8. Summary of results
    log_info "--------------------------------------------------"
    log_success "All packaging tasks completed!"
    log_info "--------------------------------------------------"
    log_info "Google AAB path: build/app/outputs/bundle/release/"
    log_info "Fat APK path:    build/app/outputs/flutter-apk/app-release.apk"
    log_info "Split APK path:  build/app/outputs/flutter-apk/"
    log_info "--------------------------------------------------"
}

function cmd_build_aab() {
    log_info "Building Google Play AAB (Android App Bundle)..."
    flutter build appbundle --release --obfuscate --split-debug-info=build/app/outputs/symbols
}

function cmd_build_apk_fat() {
    log_info "Building Fat APK..."
    flutter build apk --release --obfuscate --split-debug-info=build/app/outputs/symbols
}

function cmd_build_apk_split() {
    log_info "Building split-ABI APKs (arm64-v8a, armeabi-v7a)..."
    flutter build apk --release --split-per-abi --obfuscate --split-debug-info=build/app/outputs/symbols
}

function cmd_run_offline() {
    log_info "Running offline (Device: ADDK6R3A12003434)..."
    cd "$PROJECT_ROOT"
    flutter run --offline -d ADDK6R3A12003434
}

# --- Main Logic ---
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
        log_error "Unknown command: $COMMAND"
        show_help
        exit 1
        ;;
esac
