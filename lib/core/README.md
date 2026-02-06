# Core 核心模块

此目录包含在应用的所有功能模块中通用的共享代码。

## 目录结构

```
core/
├── base/           # 视图 (View) 和视图模型 (ViewModel) 的基类
├── config/         # 应用配置（API、主题等）
├── constants/      # 应用级常量
├── error/          # 错误处理和 Failure 类型
├── network/        # 网络层配置 (Dio)
├── providers/      # 核心 Riverpod Provider
├── services/       # 核心服务（API、存储、定位）
├── theme/          # 应用主题配置
├── utils/          # 工具函数和助手类
├── values/         # 应用数值（颜色、资源、常量）
└── widgets/        # 共享 UI 组件
```

## 架构原则

### 依赖方向

- 核心模块 **不得** 依赖于功能 (Feature) 模块
- 核心模块为功能模块提供基础设施和工具
- 功能模块依赖于核心模块，反之则不然

### 什么属于核心模块？

**属于 - 应包含在核心模块中：**

- 网络配置（Dio 设置、拦截器）
- 错误类型和错误处理工具
- 跨功能模块使用的通用数据模型
- 共享 UI 组件（按钮、卡片、加载指示器）
- 全局服务（存储、日志）
- 主题和样式配置
- 工具函数（日期格式化、验证）

**不属于 - 应保留在功能模块中：**

- 特定于某个功能的业务逻辑
- 特定于某个功能的数据模型
- 特定于某个功能的 UI 界面
- 特定于某个功能的 Repository（仓库）

## 关键组件

### 错误处理

- `error/failure.dart` - 用于类型安全错误处理的密封类层次结构
- 使用 fpdart 的 Either 类型进行函数式错误处理

### 网络层

- `network/dio_provider.dart` - Dio HTTP 客户端配置
- 包含用于身份验证、日志记录和错误处理的拦截器

### 服务

- `services/api_service.dart` - 带有常用 HTTP 方法的基础 API 服务
- `services/storage_service.dart` - 本地存储抽象
- `services/location_service.dart` - 定位服务封装

### Provider

- 用于依赖注入的核心 Riverpod Provider
- 配置相关 Provider
- 服务相关 Provider

## 使用指南

1. **从核心导入**：功能模块应使用相对路径从核心模块导入
2. **禁止循环依赖**：核心模块永远不应从功能模块导入
3. **保持通用性**：核心模块的代码应可在各个功能模块间重用
4. **文档化公共 API**：所有公共类和函数都应包含 dartdoc 注释
