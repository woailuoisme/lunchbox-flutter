.PHONY: help build gen-i18n slang gen-icons clean watch deps run run-dev run-prod run-offline attach test format analyze fix upgrade doctor full-build install clean-all ready pre-release

# 默认目标 - 显示帮助信息
help:
	@echo "Flutter 项目 Makefile 命令"
	@echo "------------------------------------------------------------"
	@echo "  make deps          - 获取依赖"
	@echo "  make upgrade       - 升级项目所有依赖 (含跨大版本)"
	@echo "  make build         - 生成代码 (freezed/json)"
	@echo "  make install       - 安装调试版 APK 到设备"
	@echo "  make gen-i18n      - 生成国际化代码 (slang)"
	@echo "  make slang         - 生成国际化代码 (同 gen-i18n)"
	@echo "  make gen-icons     - 生成应用图标 (flutter_launcher_icons)"
	@echo "  make clean         - 清理生成文件"
	@echo "  make watch         - 监听生成"
	@echo "  make full-build    - 重建 (clean+deps+build)"
	@echo "  make run           - 运行 (默认)"
	@echo "  make run-dev       - 运行 (开发环境配置)"
	@echo "  make run-prod      - 运行 (生产环境配置)"
	@echo "  make run-offline   - 离线运行 (指定设备)"
	@echo "  make attach        - 连接到已运行的应用 (支持热重载)"
	@echo "  make test          - 测试 (unit+widget)"
	@echo "  make format        - 格式化"
	@echo "  make analyze       - 分析"
	@echo "  make fix           - 修复"
	@echo "  make doctor        - 环境检查"
	@echo "  make clean-all     - 深度清理"

deps:
	flutter pub get

upgrade:
	flutter pub upgrade --major-versions

build:
	dart run build_runner build --delete-conflicting-outputs

gen-i18n:
	dart run slang

slang: gen-i18n

gen-icons:
	dart run flutter_launcher_icons

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
ready: fix format lint
	@echo "✅ 代码已准备就绪，可以提交！"

doctor:
	flutter doctor -v

# -r: 保留数据替换安装
# -d: 允许降级安装
# -t: 允许测试版 APK
# -g: 自动授予所有运行时权限
install:
		flutter build apk --debug
		adb install -r -d -t -g build/app/outputs/flutter-apk/app-debug.apk

dev: deps build

pre-release: clean-all deps build format analyze test
