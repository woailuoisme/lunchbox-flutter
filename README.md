# 饭盒售货机应用 (Lunchbox)

## 项目概述

Lunchbox 是一个高可靠、产品级的自动饭盒售货机移动端应用程序。该应用为用户提供了便捷的午餐购买体验，支持
Stripe 全球支付，并集成了设备管理、地理位置服务及现代化的状态管理架构。

## 项目特点

- **高性能架构**：基于 Riverpod 的响应式状态管理，确保应用运行流畅且易于维护。
- **现代化技术栈**：采用 Feature-First 目录结构，代码解耦，便于团队协作开发。
- **Stripe 支付集成**：支持全球化的 Stripe 支付流程，提供安全可靠的交易体验。
- **多平台支持**：完美适配 Android 和 iOS 平台。
- **地理位置服务**：实时获取设备位置，支持基于 Google Maps 的设备搜索。
- **国际化支持**：使用 slang 实现多语言切换（支持中简、中繁、英文）。

## 技术栈

### 核心框架

- **前端框架**：Flutter ^3.10.8
- **状态管理**：[Riverpod](https://riverpod.dev/) (使用 riverpod_generator 生成代码)
- **路由管理**：[GoRouter](https://pub.dev/packages/go_router)
- **工程管理**：[Melos](https://melos.invertase.dev/) (多包管理与脚本自动化)

### 数据与网络

- **网络请求**：[Dio](https://pub.dev/packages/dio) + [Retrofit](https://pub.dev/packages/retrofit)
- **本地数据库**：[Drift](https://drift.simonbinder.eu/) (高效的 SQLite 封装)
- **键值存储**：SharedPreferences
- **函数式编程**：[fpdart](https://pub.dev/packages/fpdart) (用于 Either 错误处理)

### UI 与 动画

- **主题管理**：FlexColorScheme
- **图标库**：Lucide Icons, Font Awesome
- **动画效果**：Lottie, Flutter Animate
- **响应式布局**：Flutter ScreenUtil
- **图片加载**：CachedNetworkImage
- **骨架屏**：Skeletonizer

### 业务功能

- **支付系统**：Flutter Stripe (独占支持)
- **地图服务**：Google Maps Flutter
- **国际化**：Slang
- **表单验证**：Formz

## 架构设计

### 目录结构 (Feature-First)

项目采用按功能模块划分的目录结构，提高代码的可维护性和可扩展性：

```
lib/
├── core/                # 核心基础设施 (网络、错误处理、服务、工具类)
├── features/            # 业务功能模块 (按功能划分)
│   ├── auth/            # 认证模块 (登录、注册、状态)
│   ├── product/         # 产品模块 (列表、详情)
│   ├── order/           # 订单模块 (创建、查询)
│   ├── payment/         # 支付模块 (Stripe 集成)
│   └── ...              # 其他功能 (设备、购物车、个人中心等)
├── i18n/                # 国际化资源文件
├── routes/              # 基于 GoRouter 的路由配置
├── shared/              # 跨模块共享的组件和模型
└── main.dart            # 应用入口
```

### 核心设计模式

- **Repository Pattern**：隔离数据源与业务逻辑。
- **Notifier/State Pattern**：通过 Riverpod Notifier 统一管理 UI 状态。
- **Functional Error Handling**：使用 `Either<Failure, Success>` 显式处理错误，避免异常抛出导致的应用崩溃。

## 核心功能

### 1. 智能设备管理

- 实时监控售货机状态。
- 基于地理位置的设备搜索与地图展示。

### 2. 购物流程

- 响应式购物车管理。
- 动态产品分类与搜索。
- 丝滑的下单体验，支持订单详情追踪。

### 3. Stripe 支付系统

- 深度集成 Stripe 支付网关。
- 支持支付意图 (Payment Intent) 与支付表单 (Payment Sheet)。

### 4. 国际化 (i18n)

- 完整支持多语言环境，实时切换不闪退。

## 开发与构建

项目使用 Melos 管理常用开发脚本，提高开发效率。

### 环境准备

1. 安装 Melos：
   ```bash
   dart pub global activate melos
   ```

2. 初始化项目（安装依赖并生成代码）：
   ```bash
   melos run prepare
   ```

### 常用命令

| 命令                       | 描述                         |
|:-------------------------|:---------------------------|
| `melos run build:runner` | 运行 build_runner 生成代码 (一次性) |
| `melos run watch`        | 运行 build_runner 监听模式       |
| `melos run gen:i18n`     | 生成国际化代码                    |
| `melos run analyze`      | 运行静态代码分析                   |
| `melos run test`         | 运行所有单元测试                   |

### 运行应用

```bash
# 运行到 Android
flutter run --target-platform android-arm64

# 运行到 iOS (无签名)
flutter run --no-codesign
```

## 许可证

本项目采用 MIT 许可证。详情请查看 [LICENSE](file:///Users/seaside/Projects/flutter/lunchbox/LICENSE)
文件。
