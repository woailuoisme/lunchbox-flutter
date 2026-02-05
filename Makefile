.PHONY: help build gen-i18n gen-icons clean watch deps run run-dev run-prod test format analyze fix upgrade doctor full-build

# 默认目标 - 显示帮助信息
help:
	@echo "Flutter 项目 Makefile 命令"
	@echo "------------------------------------------------------------"
	@echo "  make deps          - 获取依赖"
	@echo "  make upgrade       - 升级项目所有依赖 (含跨大版本)"
	@echo "  make build         - 生成代码 (freezed/json)"
	@echo "  make gen-i18n      - 生成国际化代码 (slang)"
	@echo "  make gen-icons     - 生成应用图标 (flutter_launcher_icons)"
	@echo "  make clean         - 清理生成文件"
	@echo "  make watch         - 监听生成"
	@echo "  make full-build    - 重建 (clean+deps+build)"
	@echo "  make run           - 运行 (默认)"
	@echo "  make run-dev       - 运行 (开发环境配置)"
	@echo "  make run-prod      - 运行 (生产环境配置)"
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


test:
	flutter test

test-unit:
	flutter test test/unit

test-widget:
	flutter test test/widget

format:
	dart format lib test

analyze:
	flutter analyze | grep -v "info •" || true

analyze-strict:
	flutter analyze

fix:
	dart fix --apply

lint: analyze

doctor:
	flutter doctor -v

dev: deps build

pre-release: clean-all deps build format analyze test
