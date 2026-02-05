# 需求文档：Lunchbox 应用技术栈重构

## 简介

本文档规定了使用现代 Flutter 技术栈重构 Lunchbox（饭盒售货机应用）的需求。应用将采用 Riverpod 3.0+ 进行状态管理和依赖注入，GoRouter 17.0+ 进行路由导航，Toastification 进行用户通知，fpdart 进行函数式错误处理。重构旨在构建一个高质量、可维护、可测试的生产级应用，同时保留所有业务功能。

## 术语表

- **Lunchbox_App**（饭盒应用）：用于自动售货机的 Flutter 移动应用
- **Riverpod**：状态管理和依赖注入解决方案
- **GoRouter**：声明式路由框架
- **Toastification**：Toast 通知库
- **fpdart**：使用 Either 和 Option 类型进行错误处理的函数式编程库
- **Feature_Module**（功能模块）：一个独立的业务能力（例如设备管理、支付）
- **State_Provider**（状态提供者）：管理应用状态的 Riverpod provider
- **Repository**（仓储）：处理数据源的数据层抽象
- **Use_Case**（用例）：领域层业务逻辑操作
- **Navigation_Stack**（导航栈）：由 GoRouter 管理的屏幕层次结构
- **AsyncNotifier**：Riverpod 中管理异步状态的类
- **StateNotifier**：Riverpod 中管理同步状态的类

## 需求

### 需求 1：Riverpod 状态管理

**用户故事：** 作为开发者，我希望使用 Riverpod 进行状态管理，以便获得类型安全、可测试性和优秀的开发者体验。

#### 验收标准

1. WHEN 功能需要状态管理时，THE Lunchbox_App SHALL 使用 Riverpod StateNotifier 或 AsyncNotifier
2. WHEN 状态变化发生时，THE Lunchbox_App SHALL 通过 Riverpod 的响应式系统自动通知监听者
3. WHEN 组件需要访问状态时，THE Lunchbox_App SHALL 使用 ref.watch 或 ref.read
4. WHEN 释放资源时，THE Lunchbox_App SHALL 利用 Riverpod 的自动释放机制
5. WHEN 管理复杂状态时，THE Lunchbox_App SHALL 使用 Notifier 类封装状态逻辑
6. THE Lunchbox_App SHALL 确保所有状态变化都是可预测和可追踪的

### 需求 2：GoRouter 路由系统

**用户故事：** 作为开发者，我希望使用 GoRouter 进行路由导航，以便拥有声明式、类型安全的导航和深度链接支持。

#### 验收标准

1. WHEN 定义应用路由时，THE Lunchbox_App SHALL 使用 GoRouter 的声明式路由配置
2. WHEN 在屏幕之间导航时，THE Lunchbox_App SHALL 使用 GoRouter 的 context.go 或 context.push 方法
3. WHEN 在路由之间传递参数时，THE Lunchbox_App SHALL 使用 GoRouter 的类型安全参数传递
4. WHEN 处理导航守卫时，THE Lunchbox_App SHALL 使用 GoRouter 的 redirect 机制
5. WHEN 触发深度链接时，THE Lunchbox_App SHALL 通过 GoRouter 的基于路径的路由处理
6. WHEN 管理嵌套导航时，THE Lunchbox_App SHALL 使用 ShellRoute 或 StatefulShellRoute
7. THE Lunchbox_App SHALL 支持浏览器后退按钮和系统返回手势

### 需求 3：Riverpod 依赖注入

**用户故事：** 作为开发者，我希望使用 Riverpod 进行依赖注入，以便获得编译时安全和优秀的依赖管理。

#### 验收标准

1. WHEN 注册依赖时，THE Lunchbox_App SHALL 使用 Riverpod Provider 定义依赖
2. WHEN 解析依赖时，THE Lunchbox_App SHALL 使用 ref.read 或 ref.watch
3. WHEN 管理依赖生命周期时，THE Lunchbox_App SHALL 使用 Riverpod 的自动释放和 keepAlive
4. WHEN 创建作用域依赖时，THE Lunchbox_App SHALL 使用 family 或 autoDispose 修饰符
5. WHEN 覆盖依赖用于测试时，THE Lunchbox_App SHALL 使用 ProviderScope.overrides
6. THE Lunchbox_App SHALL 确保所有依赖关系清晰且可追踪

### 需求 4：Toastification 通知系统

**用户故事：** 作为用户，我希望看到现代化、可定制的通知提示，以便清楚地收到操作反馈。

#### 验收标准

1. WHEN 显示成功消息时，THE Lunchbox_App SHALL 使用 Toastification 的成功样式
2. WHEN 显示错误消息时，THE Lunchbox_App SHALL 使用 Toastification 的错误样式
3. WHEN 显示信息消息时，THE Lunchbox_App SHALL 使用 Toastification 的信息样式
4. WHEN 显示警告时，THE Lunchbox_App SHALL 使用 Toastification 的警告样式
5. WHEN 显示 Toast 时，THE Lunchbox_App SHALL 确保它可以被关闭并具有适当的持续时间
6. WHEN 配置 Toast 时，THE Lunchbox_App SHALL 支持自定义位置、动画和样式
7. THE Lunchbox_App SHALL 在整个应用中保持一致的 Toast 位置和动画

### 需求 5：fpdart 函数式错误处理

**用户故事：** 作为开发者，我希望使用 fpdart 进行函数式错误处理，以便显式处理错误并避免运行时异常。

#### 验收标准

1. WHEN 仓储操作可能失败时，THE Lunchbox_App SHALL 返回 Either<Failure, Success> 类型
2. WHEN 值可能不存在时，THE Lunchbox_App SHALL 使用 Option<T> 类型
3. WHEN 链接可能失败的操作时，THE Lunchbox_App SHALL 使用 Either 的 flatMap 或 map 方法
4. WHEN 处理带有错误的异步操作时，THE Lunchbox_App SHALL 返回 TaskEither 以实现可组合的错误处理
5. WHEN 向用户呈现错误时，THE Lunchbox_App SHALL 将 Failure 类型映射为用户友好的消息
6. WHEN 定义错误类型时，THE Lunchbox_App SHALL 使用 sealed class 创建类型安全的错误层次结构
7. THE Lunchbox_App SHALL 避免使用 try-catch，优先使用 Either 进行错误处理

### 需求 6：Riverpod 响应式编程

**用户故事：** 作为开发者，我希望使用 Riverpod 的响应式系统，以便拥有一致的状态观察和更新模式。

#### 验收标准

1. WHEN 值需要响应式时，THE Lunchbox_App SHALL 使用 Riverpod StateProvider 或 StateNotifier
2. WHEN 在组件中观察响应式值时，THE Lunchbox_App SHALL 使用 ref.watch
3. WHEN 更新响应式值时，THE Lunchbox_App SHALL 使用 StateNotifier 的 state setter
4. WHEN 计算派生状态时，THE Lunchbox_App SHALL 使用 Riverpod 的计算 provider
5. WHEN 监听状态变化执行副作用时，THE Lunchbox_App SHALL 使用 ref.listen
6. THE Lunchbox_App SHALL 确保所有响应式更新都是高效且可预测的

### 需求 7：功能模块架构

**用户故事：** 作为开发者，我希望采用一致的功能优先架构和清晰的架构分层，以便代码库可维护和可扩展。

#### 验收标准

1. WHEN 组织代码时，THE Lunchbox_App SHALL 使用功能优先的目录结构，包含 data、domain 和 presentation 层
2. WHEN 实现数据访问时，THE Lunchbox_App SHALL 将数据源、模型和仓储实现放置在 data 层
3. WHEN 实现业务逻辑时，THE Lunchbox_App SHALL 将实体和用例放置在 domain 层
4. WHEN 实现 UI 时，THE Lunchbox_App SHALL 将 provider、屏幕和 widget 放置在 presentation 层
5. WHEN 跨功能共享代码时，THE Lunchbox_App SHALL 将其放置在 lib/core 或 lib/shared 目录
6. THE Lunchbox_App SHALL 在各层之间保持清晰的关注点分离
7. WHEN 定义层间依赖时，THE Lunchbox_App SHALL 确保依赖方向始终从外向内（presentation → domain → data）
8. WHEN 使用依赖注入时，THE Lunchbox_App SHALL 在 domain 层定义抽象接口，在 data 层提供具体实现

### 需求 8：应用架构设计

**用户故事：** 作为项目经理，我希望采用清晰的架构设计，以便应用程序易于理解、维护和扩展。

#### 验收标准

1. WHEN 组织代码时，THE Lunchbox_App SHALL 采用功能优先的目录结构
2. WHEN 实现功能时，THE Lunchbox_App SHALL 遵循清晰的分层架构
3. WHEN 添加新功能时，THE Lunchbox_App SHALL 遵循已建立的架构模式
4. WHEN 处理跨功能关注点时，THE Lunchbox_App SHALL 使用共享模块
5. THE Lunchbox_App SHALL 确保架构决策有文档记录且一致执行

### 需求 9：设备管理功能

**用户故事：** 作为用户，我希望设备管理功能运行流畅，以便监控设备、查看信息和报告问题。

#### 验收标准

1. WHEN 查看设备状态时，THE Lunchbox_App SHALL 使用 Riverpod AsyncNotifier 加载和显示实时设备信息
2. WHEN 报告设备问题时，THE Lunchbox_App SHALL 提交报告并使用 Toastification 显示反馈
3. WHEN 导航到设备详情时，THE Lunchbox_App SHALL 使用 GoRouter 进行类型安全导航
4. WHEN 设备数据加载失败时，THE Lunchbox_App SHALL 使用 Either 处理错误并显示适当消息
5. WHEN 刷新设备列表时，THE Lunchbox_App SHALL 使用 ref.refresh 触发数据重新加载
6. THE Lunchbox_App SHALL 提供设备状态的实时更新

### 需求 10：产品浏览与购物功能

**用户故事：** 作为用户，我希望产品浏览和购物车功能运行流畅，以便浏览产品、管理购物车和下单。

#### 验收标准

1. WHEN 按类别浏览产品时，THE Lunchbox_App SHALL 使用 Riverpod AsyncNotifier 加载和显示产品
2. WHEN 添加商品到购物车时，THE Lunchbox_App SHALL 使用 Riverpod 响应式更新购物车状态
3. WHEN 查看购物车时，THE Lunchbox_App SHALL 实时显示当前购物车商品
4. WHEN 创建订单时，THE Lunchbox_App SHALL 使用 Either 处理订单创建流程中的错误
5. WHEN 在产品屏幕间导航时，THE Lunchbox_App SHALL 使用 GoRouter 进行适当的参数传递
6. WHEN 管理购物车数量时，THE Lunchbox_App SHALL 提供增加、减少和删除商品的功能
7. THE Lunchbox_App SHALL 在购物车为空时显示适当的空状态

### 需求 11：支付系统

**用户故事：** 作为用户，我希望支付功能可靠运行，以便使用微信支付或支付宝完成购买。

#### 验收标准

1. WHEN 发起支付时，THE Lunchbox_App SHALL 使用 Riverpod 状态管理支付渠道选择
2. WHEN 处理支付时，THE Lunchbox_App SHALL 使用 AsyncNotifier 管理支付状态
3. WHEN 支付成功时，THE Lunchbox_App SHALL 使用 Toastification 显示成功通知
4. WHEN 支付失败时，THE Lunchbox_App SHALL 使用 Either 处理错误并显示适当消息
5. WHEN 查看交易历史时，THE Lunchbox_App SHALL 使用 Riverpod provider 加载支付记录
6. WHEN 等待支付结果时，THE Lunchbox_App SHALL 显示加载状态并支持取消操作
7. THE Lunchbox_App SHALL 确保所有支付操作的安全性和数据完整性

### 需求 12：位置服务

**用户故事：** 作为用户，我希望位置服务准确运行，以便找到附近的设备和报告设备位置。

#### 验收标准

1. WHEN 请求位置权限时，THE Lunchbox_App SHALL 使用 Riverpod 状态管理处理权限流程
2. WHEN 获取当前位置时，THE Lunchbox_App SHALL 使用 AsyncNotifier 管理位置获取
3. WHEN 位置服务失败时，THE Lunchbox_App SHALL 使用 Either 处理错误并提供备选方案
4. WHEN 显示设备位置时，THE Lunchbox_App SHALL 响应式显示基于位置的信息
5. WHEN 计算距离时，THE Lunchbox_App SHALL 显示用户与设备之间的距离
6. THE Lunchbox_App SHALL 支持手动选择位置作为备选方案

### 需求 13：用户中心

**用户故事：** 作为用户，我希望用户资料和订单历史功能运行流畅，以便管理账户和查看过往订单。

#### 验收标准

1. WHEN 查看订单历史时，THE Lunchbox_App SHALL 使用 Riverpod AsyncNotifier 加载订单
2. WHEN 更新个人资料信息时，THE Lunchbox_App SHALL 使用 Either 处理更新中的错误
3. WHEN 在用户中心内导航时，THE Lunchbox_App SHALL 使用 GoRouter 进行导航
4. WHEN 显示用户数据时，THE Lunchbox_App SHALL 使用 Riverpod provider 管理状态
5. WHEN 查看订单详情时，THE Lunchbox_App SHALL 显示完整的订单信息和状态
6. THE Lunchbox_App SHALL 支持用户退出登录功能

### 需求 14：性能优化

**用户故事：** 作为用户，我希望应用程序运行流畅，以便获得响应迅速的用户体验。

#### 验收标准

1. WHEN 构建 widget 时，THE Lunchbox_App SHALL 尽可能使用 const 构造函数
2. WHEN 管理 provider 生命周期时，THE Lunchbox_App SHALL 使用 autoDispose 防止内存泄漏
3. WHEN 渲染列表时，THE Lunchbox_App SHALL 使用高效的列表构建器和分页
4. WHEN 加载图片时，THE Lunchbox_App SHALL 实现缓存和延迟加载
5. THE Lunchbox_App SHALL 保持或改善当前应用程序性能指标
6. WHEN 使用 Riverpod provider 时，THE Lunchbox_App SHALL 使用 select 方法避免不必要的重建
7. WHEN 处理大量数据时，THE Lunchbox_App SHALL 使用 compute 函数进行后台计算
8. WHEN 监听 provider 时，THE Lunchbox_App SHALL 使用 ref.listen 而非 ref.watch 处理副作用
9. WHEN 创建复杂 UI 时，THE Lunchbox_App SHALL 使用 RepaintBoundary 隔离重绘区域

### 需求 15：测试基础设施

**用户故事：** 作为开发者，我希望拥有全面的测试支持，以便验证应用的正确性并防止回归。

#### 验收标准

1. WHEN 测试 provider 时，THE Lunchbox_App SHALL 使用 ProviderContainer 进行单元测试
2. WHEN 测试导航时，THE Lunchbox_App SHALL 使用 GoRouter 的测试工具
3. WHEN 测试 widget 时，THE Lunchbox_App SHALL 使用 Riverpod 的 ProviderScope 进行 widget 测试
4. WHEN 测试错误处理时，THE Lunchbox_App SHALL 验证 Either 和 Option 的行为
5. THE Lunchbox_App SHALL 保持与当前代码库相当或更好的测试覆盖率
6. WHEN 测试异步操作时，THE Lunchbox_App SHALL 使用 AsyncValue 的测试辅助方法
7. WHEN 模拟依赖时，THE Lunchbox_App SHALL 使用 ProviderContainer.overrides 进行依赖注入
8. WHEN 测试状态变化时，THE Lunchbox_App SHALL 使用 StateNotifier 的测试模式验证状态转换
9. WHEN 进行集成测试时，THE Lunchbox_App SHALL 使用 flutter_test 和 integration_test 包

### 需求 16：文档和代码质量

**用户故事：** 作为开发者，我希望拥有清晰的文档和一致的代码风格，以便代码库易于维护。

#### 验收标准

1. WHEN 编写代码时，THE Lunchbox_App SHALL 遵循 Dart 和 Flutter 风格指南
2. WHEN 创建 provider 时，THE Lunchbox_App SHALL 包含文档注释说明用途和用法
3. WHEN 实现功能时，THE Lunchbox_App SHALL 为复杂逻辑包含内联注释
4. WHEN 组织文件时，THE Lunchbox_App SHALL 遵循一致的命名约定
5. WHEN 编写公共 API 时，THE Lunchbox_App SHALL 提供完整的 dartdoc 文档
6. THE Lunchbox_App SHALL 在代码库中保持一致的文档标准

### 需求 17：平台兼容性

**用户故事：** 作为用户，我希望应用程序在 Android 和 iOS 上都能正常工作，以便无论使用什么平台都能获得一致的体验。

#### 验收标准

1. WHEN 在 Android 上运行时，THE Lunchbox_App SHALL 所有功能正常工作
2. WHEN 在 iOS 上运行时，THE Lunchbox_App SHALL 所有功能正常工作
3. WHEN 使用平台特定功能时，THE Lunchbox_App SHALL 适当处理平台差异
4. WHEN 显示 UI 时，THE Lunchbox_App SHALL 一致遵循 Material Design 指南
5. WHEN 处理平台权限时，THE Lunchbox_App SHALL 使用统一的权限处理流程
6. THE Lunchbox_App SHALL 在两个平台上提供相同的功能集

### 需求 18：配置和环境管理

**用户故事：** 作为开发者，我希望集中化配置管理，以便轻松管理不同的环境和设置。

#### 验收标准

1. WHEN 访问配置时，THE Lunchbox_App SHALL 使用 Riverpod provider 进行配置管理
2. WHEN 切换环境时，THE Lunchbox_App SHALL 加载适当的配置值
3. WHEN 管理 API 端点时，THE Lunchbox_App SHALL 集中化端点配置
4. WHEN 处理功能标志时，THE Lunchbox_App SHALL 使用基于 provider 的功能标志管理
5. THE Lunchbox_App SHALL 支持开发、测试和生产环境的配置切换

### 需求 19：代码生成和类型安全

**用户故事：** 作为开发者，我希望使用代码生成工具确保类型安全和减少样板代码，以便提高开发效率和代码质量。

#### 验收标准

1. WHEN 定义数据模型时，THE Lunchbox_App SHALL 使用 freezed 生成不可变类和 copyWith 方法
2. WHEN 序列化 JSON 时，THE Lunchbox_App SHALL 使用 json_serializable 生成序列化代码
3. WHEN 定义 Riverpod provider 时，THE Lunchbox_App SHALL 使用 riverpod_generator 生成类型安全的 provider
4. WHEN 定义路由时，THE Lunchbox_App SHALL 使用 go_router_builder 生成类型安全的路由
5. WHEN 运行代码生成时，THE Lunchbox_App SHALL 使用 build_runner 自动化生成过程
6. THE Lunchbox_App SHALL 在所有生成的代码中保持一致的命名约定

### 需求 20：响应式状态管理模式

**用户故事：** 作为开发者，我希望使用现代响应式状态管理模式，以便构建可预测和可测试的应用状态。

#### 验收标准

1. WHEN 管理简单状态时，THE Lunchbox_App SHALL 使用 StateProvider 或 NotifierProvider
2. WHEN 管理异步状态时，THE Lunchbox_App SHALL 使用 AsyncNotifierProvider 和 AsyncValue
3. WHEN 状态依赖其他状态时，THE Lunchbox_App SHALL 使用 provider 组合和 ref.watch
4. WHEN 状态需要参数化时，THE Lunchbox_App SHALL 使用 family 修饰符
5. WHEN 状态需要自动释放时，THE Lunchbox_App SHALL 使用 autoDispose 修饰符
6. WHEN 处理副作用时，THE Lunchbox_App SHALL 使用 ref.listen 或 ref.listenManual
7. WHEN 状态需要持久化时，THE Lunchbox_App SHALL 集成持久化层与 Riverpod provider

### 需求 21：错误边界和恢复

**用户故事：** 作为用户，我希望应用程序能够优雅地处理错误并提供恢复选项，以便在出现问题时不会完全崩溃。

#### 验收标准

1. WHEN provider 抛出错误时，THE Lunchbox_App SHALL 使用 AsyncValue.error 捕获并显示错误
2. WHEN 网络请求失败时，THE Lunchbox_App SHALL 提供重试机制
3. WHEN 显示错误状态时，THE Lunchbox_App SHALL 使用一致的错误 UI 组件
4. WHEN 错误可恢复时，THE Lunchbox_App SHALL 提供明确的恢复操作
5. WHEN 记录错误时，THE Lunchbox_App SHALL 使用结构化日志记录错误上下文
6. WHEN 未捕获的异常发生时，THE Lunchbox_App SHALL 使用全局错误处理器防止应用崩溃

### 需求 22：国际化和本地化支持

**用户故事：** 作为开发者，我希望应用支持国际化，以便未来可以轻松添加多语言支持。

#### 验收标准

1. WHEN 显示文本时，THE Lunchbox_App SHALL 使用 Flutter 的国际化框架
2. WHEN 管理翻译时，THE Lunchbox_App SHALL 使用 ARB 文件存储翻译字符串
3. WHEN 访问翻译时，THE Lunchbox_App SHALL 通过 BuildContext 访问本地化字符串
4. WHEN 格式化日期和数字时，THE Lunchbox_App SHALL 使用 intl 包进行本地化格式化
5. THE Lunchbox_App SHALL 支持中文作为主要语言，并为未来多语言扩展做好准备

### 需求 23：网络层优化

**用户故事：** 作为开发者，我希望优化网络层与 Riverpod 的集成，以便实现高效的数据获取和缓存。

#### 验收标准

1. WHEN 发起 HTTP 请求时，THE Lunchbox_App SHALL 使用 Dio 拦截器处理认证和错误
2. WHEN 缓存网络响应时，THE Lunchbox_App SHALL 使用 Riverpod 的 keepAlive 或自定义缓存策略
3. WHEN 处理并发请求时，THE Lunchbox_App SHALL 使用 Riverpod 的自动请求去重
4. WHEN 刷新数据时，THE Lunchbox_App SHALL 使用 ref.invalidate 或 ref.refresh 触发重新获取
5. WHEN 处理分页时，THE Lunchbox_App SHALL 使用 AsyncNotifier 管理分页状态
6. WHEN 网络不可用时，THE Lunchbox_App SHALL 提供离线模式或缓存数据访问

### 需求 24：开发者体验优化

**用户故事：** 作为开发者，我希望拥有良好的开发者体验工具，以便提高开发效率和代码质量。

#### 验收标准

1. WHEN 开发时，THE Lunchbox_App SHALL 使用 Riverpod 的 DevTools 扩展进行状态调试
2. WHEN 检查代码质量时，THE Lunchbox_App SHALL 使用 flutter_lints 和自定义 lint 规则
3. WHEN 格式化代码时，THE Lunchbox_App SHALL 使用 dart format 保持一致的代码风格
4. WHEN 分析代码时，THE Lunchbox_App SHALL 使用 dart analyze 检测潜在问题
5. WHEN 提交代码时，THE Lunchbox_App SHALL 使用 pre-commit hooks 确保代码质量
6. WHEN 查看 provider 依赖图时，THE Lunchbox_App SHALL 使用 Riverpod 的依赖可视化工具
