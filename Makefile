.PHONY: help build clean watch deps run test format analyze fix upgrade doctor full-build

# 默认目标 - 显示帮助信息
help:
	@echo "Flutter 项目 Makefile 命令"
	@echo "------------------------------------------------------------"
	@echo "  make deps          - 获取依赖"
	@echo "  make upgrade       - 升级项目所有依赖 (含跨大版本)"
	@echo "  make build         - 生成代码 (freezed/json)"
	@echo "  make clean         - 清理生成文件"
	@echo "  make watch         - 监听生成"
	@echo "  make full-build    - 重建 (clean+deps+build)"
	@echo "  make run           - 运行"
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

test:
	flutter test

test-unit:
	flutter test test/unit

test-widget:
	flutter test test/widget

format:
	dart format lib test

analyze:
	flutter analyze

fix:
	dart fix --apply

lint: analyze

doctor:
	flutter doctor -v

dev: deps build

pre-release: clean-all deps build format analyze test
