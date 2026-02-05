---
name: flutter-architecture
description: 遵循 MVVM 模式和最佳实践的 Flutter 应用架构综合指南，采用功能优先（Feature-First）的项目组织方式。适用于构建结构合理的 Flutter 项目，实现清晰的架构分层（UI层、数据层、领域层），应用推荐的设计模式，并使用功能优先的方法组织项目，以构建可扩展、易维护的应用程序。
---

# Flutter 架构

## 概览

提供使用 MVVM 模式、分层架构以及 Flutter 团队推荐的设计模式来构建可扩展 Flutter 应用程序的架构指导和最佳实践。

## 项目结构：功能优先 vs 分层优先

根据您的应用复杂度和团队规模选择合适的项目组织方式。

### 功能优先 (推荐用于团队)

按业务功能组织代码：

```
lib/
├── features/
│   ├── auth/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   ├── todos/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   └── settings/
│       ├── data/
│       ├── domain/
│       └── presentation/
├── shared/
│   ├── core/
│   ├── data/
│   └── ui/
└── main.dart
```

**何时使用：**
- 中大型应用（10+ 功能模块）
- 团队开发（2+ 开发人员）
- 频繁添加/移除功能
- 复杂的业务逻辑

**优势：**
- 功能是独立的单元
- 易于添加/移除完整功能
- 清晰的功能边界
- 减少合并冲突
- 团队可独立开发各个功能

请参阅 [功能优先指南](references/feature-first.md) 获取完整的实施细节。

### 分层优先 (传统)

按架构层级组织代码：

```
lib/
├── data/
│   ├── repositories/
│   ├── services/
│   └── models/
├── domain/
│   ├── use-cases/
│   └── entities/
├── presentation/
│   ├── views/
│   └── viewmodels/
└── shared/
```

**何时使用：**
- 中小型应用
- 功能较少（<10）
- 个人开发者或小团队
- 简单的业务逻辑

**优势：**
- 按层级清晰分离
- 易于按类型查找组件
- 嵌套较少

## 快速开始

从这些核心概念开始：

1. **关注点分离 (Separation of concerns)** - 将应用拆分为 UI 层和数据层
2. **MVVM 模式** - 使用 Views、ViewModels、Repositories 和 Services
3. **单一数据源 (Single source of truth)** - Repositories 掌握权威数据
4. **单向数据流 (Unidirectional data flow)** - 状态流向：数据 → 逻辑 → UI

详细概念请参阅 [核心概念](references/concepts.md)。

## 架构分层

Flutter 应用应按层级结构化：

- **UI 层 (UI Layer)**: Views (组件) 和 ViewModels (UI 逻辑)
- **数据层 (Data Layer)**: Repositories (单一数据源) 和 Services (数据源)
- **领域层 (Domain Layer)** (可选): 用于复杂业务逻辑的用例 (Use-cases)

请参阅 [分层指南](references/layers.md) 了解详细的层级职责和交互。

## 核心组件

### Views (视图)
- 组合 Widget 以呈现 UI
- 包含最少的逻辑（动画、简单条件判断、路由）
- 从 ViewModels 接收数据
- 通过 ViewModel 命令传递事件

### ViewModels (视图模型)
- 将 Repository 数据转换为 UI 状态
- 管理 UI 状态和命令
- 处理 UI 交互的业务逻辑
- 以流 (Streams) 或变更通知 (Change Notifiers) 的形式暴露状态

### Repositories (仓库)
- 数据类型的单一数据源
- 聚合来自 Services 的数据
- 处理缓存、错误处理、重试逻辑
- 以领域模型 (Domain Models) 的形式暴露数据

### Services (服务)
- 封装外部数据源（API、数据库、平台 API）
- 无状态的数据访问层
- 每个数据源对应一个 Service

## 设计模式

构建健壮 Flutter 应用的常用模式：

- **命令模式 (Command Pattern)** - 封装操作并处理结果 (Result)
- **结果类型 (Result Type)** - 类型安全的错误处理
- **仓库模式 (Repository Pattern)** - 数据源的抽象
- **离线优先 (Offline-First)** - 带同步机制的乐观 UI 更新

请参阅 [设计模式](references/design-patterns.md) 了解实现细节。

## 何时使用此技能

在以下情况下使用此技能：
- 设计或重构 Flutter 应用架构
- 在功能优先和分层优先的项目结构之间做选择
- 在 Flutter 中实现 MVVM 模式
- 为团队创建可扩展的应用结构
- 向现有架构添加新功能
- 应用最佳实践和设计模式

## 资源

### references/
- [concepts.md](references/concepts.md) - 核心架构原则（关注点分离、单一数据源、单向数据流）
- [feature-first.md](references/feature-first.md) - 功能优先的项目组织和最佳实践
- [mvvm.md](references/mvvm.md) - Flutter 中的 MVVM 模式实现
- [layers.md](references/layers.md) - 详细的层级职责和交互
- [design-patterns.md](references/design-patterns.md) - 常用模式和实现

### assets/
- [command.dart](assets/command.dart) - 用于封装操作的命令模式模板
- [result.dart](assets/result.dart) - 用于安全错误处理的结果类型
- [examples/](assets/examples/) - 展示架构实践的代码示例
