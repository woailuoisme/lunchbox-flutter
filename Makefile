.PHONY: help build gen-i18n slang gen-icons gen-splash clean watch deps run run-dev run-prod run-offline attach test format analyze fix upgrade doctor full-build install install-release clean-all ready pre-release prepare build-apk build-apk-google build-apk-fat build-apk-split build-all

# 默认目标 - 显示帮助信息
help:
	@echo "Flutter 项目 Makefile 命令"
	@echo "------------------------------------------------------------"
	@echo "  开发命令:"
	@echo "  make deps          - 获取依赖"
	@echo "  make upgrade       - 升级项目所有依赖 (含跨大版本)"
	@echo "  make build         - 生成代码 (freezed/json)"
	@echo "  make gen-i18n      - 生成国际化代码 (slang)"
	@echo "  make slang         - 生成国际化代码 (同 gen-i18n)"
	@echo "  make gen-icons     - 生成应用图标 (flutter_launcher_icons)"
	@echo "  make gen-splash    - 生成原生启动页 (flutter_native_splash)"
	@echo "  make clean         - 清理生成文件"
	@echo "  make watch         - 监听生成"
	@echo "  make full-build    - 重建 (clean+deps+build)"
	@echo "  make prepare       - 准备开发环境 (deps+build+gen-i18n)"
	@echo "  make ready         - 代码准备 (fix+format+analyze)"
	@echo ""
	@echo "  运行命令:"
	@echo "  make run           - 运行 (默认)"
	@echo "  make run-dev       - 运行 (开发环境配置)"
	@echo "  make run-prod      - 运行 (生产环境配置)"
	@echo "  make run-offline   - 离线运行 (指定设备)"
	@echo "  make attach        - 连接到已运行的应用 (支持热重载)"
	@echo ""
	@echo "  测试与代码质量:"
	@echo "  make test          - 测试 (unit+widget)"
	@echo "  make format        - 格式化"
	@echo "  make analyze       - 分析"
	@echo "  make fix           - 修复"
	@echo ""
	@echo "  构建命令:"
	@echo "  make build-apk     - 构建 Android 包 (AAB + 通用APK + 分架构APK)"
	@echo "  make build-apk-google - 构建 Google Play AAB"
	@echo "  make build-apk-fat - 构建通用 APK"
	@echo "  make build-apk-split - 构建分架构 APK"
	@echo "  make build-all     - 构建所有 Android 包 (AAB+APK)"
	@echo "  make install       - 安装调试版 APK 到设备"
	@echo "  make install-release - 安装 release APK 到设备"
	@echo ""
	@echo "  其他:"
	@echo "  make doctor        - 环境检查"
	@echo "  make clean-all     - 深度清理"

deps:
	flutter pub get --no-example

upgrade:
	flutter pub upgrade --major-versions

build:
	dart run build_runner build --delete-conflicting-outputs

gen-i18n:
	dart run slang

slang: gen-i18n

gen-icons:
	dart run flutter_launcher_icons

gen-splash:
	dart run flutter_native_splash:create

clean:
	dart run build_runner clean
	find lib -name "*.g.dart" -type f -delete
	find lib -name "*.freezed.dart" -type f -delete

clean-all: clean
	flutter clean
	rm -rf .dart_tool build

watch:
	dart run build_runner watch --delete-conflicting-outputs

full-build: clean deps build

run:
	flutter run

run-dev:
	flutter run --dart-define-from-file=config/env_dev.json

run-prod:
	flutter run --dart-define-from-file=config/env_prod.json

run-offline:
	flutter run -d ADDK6R3A12003434

attach:
	flutter attach -d ADDK6R3A12003434

test:
	flutter test

test-unit:
	flutter test test/unit

test-widget:
	flutter test test/widget


analyze:
	flutter analyze | grep -v "info •" || true

analyze-strict:
	flutter analyze

fix:
	dart fix --apply

format:
	dart format lib test

lint: analyze

# 一键全套：修复 -> 格式化 -> 分析
ready:
	./scripts/lunchbox.sh ready

doctor:
	flutter doctor -v

# -r: 保留数据替换安装
# -d: 允许降级安装
# -t: 允许测试版 APK
# -g: 自动授予所有运行时权限
install:
		flutter build apk --debug
		adb install -r -d -t -g build/app/outputs/flutter-apk/app-debug.apk

install-release:
		adb install -r -d -g build/app/outputs/flutter-apk/app-release.apk

dev: deps build

pre-release: clean-all deps build format analyze test

# 新增的构建命令 - 使用统一的脚本
prepare:
	./scripts/lunchbox.sh prepare

build-apk:
	# 构建全部产物：Google Play AAB + 通用 APK
	./scripts/lunchbox.sh build:apk all

build-apk-google:
	# 仅构建 Google Play 上架包 (AAB)
	./scripts/lunchbox.sh build:apk google

build-apk-fat:
	# 仅构建通用 APK (兼容多架构)
	./scripts/lunchbox.sh build:apk fat

build-apk-split:
	# 仅构建分架构 APK (arm64-v8a/armeabi-v7a 等)
	./scripts/lunchbox.sh build:apk split

build-all:
	./scripts/lunchbox.sh build:all
