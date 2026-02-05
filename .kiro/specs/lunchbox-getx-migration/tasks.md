# 实现计划：Lunchbox 应用技术栈

## 概述

本实现计划将设计文档转换为一系列可执行的编码任务。每个任务都是离散的、可管理的步骤，构建在前面的任务之上。任务专注于使用 Riverpod、GoRouter、Toastification 和 fpdart 实现核心功能。

## 任务

- [x] 1. 项目初始化和核心配置
  - 创建 Flutter 项目结构
  - 配置 pubspec.yaml 依赖项（riverpod 3.0+, go_router 17.0+, toastification, fpdart, freezed, json_serializable, dio 5.0+）
  - 设置代码生成配置（build.yaml）
  - 配置 analysis_options.yaml 和 lint 规则
  - 创建功能优先目录结构（lib/core, lib/shared, lib/features）
  - _需求：18.1, 18.2, 24.2_

- [ ] 2. 核心基础设施
  - [x] 2.1 实现 Failure 错误类型层次
    - 使用 freezed 创建 sealed class Failure
    - 定义 NetworkFailure、ServerFailure、CacheFailure、NotFoundFailure、UnauthorizedFailure、ValidationFailure
    - _需求：5.1, 5.6_
  
  - [x] 2.2 配置 Dio 网络层
    - 创建 Dio provider 配置
    - 实现认证拦截器（AuthInterceptor）
    - 实现日志拦截器
    - 实现错误处理拦截器
    - _需求：23.1, 23.2_
  
  - [x] 2.3 实现 ToastService
    - 创建 ToastService provider
    - 实现 showSuccess、showError、showInfo、showWarning 方法
    - 配置 Toastification 样式和动画
    - _需求：4.1, 4.2, 4.3, 4.4, 4.5, 4.6_
  
  - [x] 2.4 设置 GoRouter 配置
    - 创建路由配置 provider
    - 实现认证守卫（redirect 逻辑）
    - 配置 ShellRoute 用于底部导航
    - _需求：2.1, 2.4, 2.6_

- [~] 3. 数据模型层
  - [x] 3.1 实现 City 数据模型
    - 创建 City 领域实体（使用 freezed）
    - 创建 CityModel 数据模型（使用 freezed + json_serializable）
    - 实现 toEntity 转换方法
    - _需求：19.1, 19.2_
  
  - [x] 3.2 实现 Device 和 Location 数据模型
    - 创建 Device 和 Location 领域实体
    - 创建 DeviceModel 和 LocationModel 数据模型
    - 定义 DeviceStatus 枚举
    - 实现 toEntity 转换方法
    - _需求：19.1, 19.2_
  
  - [x] 3.3 实现 Product 数据模型
    - 创建 Product 领域实体
    - 创建 ProductModel 数据模型
    - 实现 toEntity 转换方法
    - _需求：19.1, 19.2_
  
  - [x] 3.4 实现 Cart 状态模型
    - 创建 CartState 和 CartItem 类（使用 freezed）
    - 实现 totalPrice 和 totalItems 计算属性
    - 实现 empty 工厂方法
    - _需求：10.2, 10.6_
  
  - [x] 3.5 实现 Order 数据模型
    - 创建 Order 和 OrderItem 领域实体
    - 创建 OrderModel 和 OrderItemModel 数据模型
    - 定义 OrderStatus 和 PaymentMethod 枚举
    - 实现 toEntity 转换方法
    - _需求：19.1, 19.2_
  
  - [x] 3.6 编写数据模型的属性测试
    - **属性 11：JSON 序列化往返一致性**
    - **验证：需求 19.2**
  
  - [x] 3.7 运行代码生成
    - 执行 dart run build_runner build --delete-conflicting-outputs
    - 验证所有生成的代码无错误
    - _需求：19.5_


- [x] 4. 设备管理功能（Device Feature）
  - [x] 4.1 实现 Device 数据层
    - 创建 DeviceRemoteDataSource 接口和实现
    - 创建 DeviceLocalDataSource 接口和实现（缓存）
    - 创建 DeviceRepository 接口（domain 层）
    - 实现 DeviceRepositoryImpl（data 层）
    - 使用 Either 处理所有错误情况
    - _需求：7.1, 7.2, 7.3, 9.4_
  
  - [x] 4.2 实现 Device 用例
    - 创建 GetDevicesUseCase
    - 创建 GetDeviceByIdUseCase
    - 创建 ReportDeviceIssueUseCase
    - _需求：7.4_
  
  - [x] 4.3 实现 Device Provider
    - 创建 deviceRepositoryProvider
    - 创建 DeviceListNotifier（AsyncNotifier）
    - 实现 refresh 方法
    - 创建 deviceByIdProvider（family）
    - _需求：1.1, 1.2, 9.1, 9.5_
  
  - [x] 4.4 实现设备列表 UI
    - 创建 DeviceListScreen
    - 创建 DeviceCard widget
    - 实现加载、错误和数据状态的 UI
    - 集成下拉刷新功能
    - _需求：9.1_
  
  - [x] 4.5 实现设备详情 UI
    - 创建 DeviceDetailScreen
    - 显示设备信息、状态、位置
    - 实现报告问题功能
    - 使用 ToastService 显示反馈
    - _需求：9.2, 9.3_
  
  - [x] 4.6 编写设备管理单元测试
    - 测试 DeviceRepository 的成功和失败情况
    - 测试 DeviceListNotifier 的状态管理
    - 测试错误处理和缓存逻辑
    - _需求：15.1, 15.7_
  
  - [ ]* 4.7 编写设备管理属性测试
    - **属性 7：Repository 错误处理一致性**
    - **属性 8：设备问题报告反馈**
    - **验证：需求 9.2, 9.4**
  
  - [ ]* 4.8 编写设备管理 Widget 测试
    - 测试 DeviceListScreen 的各种状态
    - 测试 DeviceDetailScreen 的交互
    - _需求：15.3_

- [~] 5. 产品浏览与购物功能（Product & Cart Feature）
  - [x] 5.1 实现 Product 数据层
    - 创建 ProductRemoteDataSource 接口和实现
    - 创建 ProductLocalDataSource 接口和实现
    - 创建 ProductRepository 接口和实现
    - 使用 Either 处理错误
    - _需求：7.1, 7.2, 7.3_
  
  - [x] 5.2 实现 Product Provider
    - 创建 productRepositoryProvider
    - 创建 ProductListNotifier（AsyncNotifier，按设备和类别）
    - 创建 productByIdProvider（family）
    - _需求：1.1, 10.1_
  
  - [x] 5.3 实现购物车状态管理
    - 创建 CartNotifier（Notifier）
    - 实现 addItem、removeItem、updateQuantity、clear 方法
    - 实现购物车不变量逻辑
    - _需求：10.2, 10.6_
  
  - [x] 5.4 实现产品列表 UI
    - 创建 ProductListScreen
    - 创建 ProductCard widget
    - 实现按类别筛选
    - 集成添加到购物车功能
    - _需求：10.1, 10.2_
  
  - [x] 5.5 实现产品详情 UI
    - 创建 ProductDetailScreen
    - 显示产品详细信息、价格、库存
    - 实现添加到购物车功能
    - 使用 ToastService 显示反馈
    - _需求：10.2_
  
  - [x] 5.6 实现购物车 UI
    - 创建 CartScreen
    - 创建 CartItemWidget
    - 实现数量增减和删除功能
    - 显示总价和总数量
    - 实现空购物车状态
    - _需求：10.3, 10.6, 10.7_
  
  - [x] 5.7 编写购物车单元测试
    - 测试 CartNotifier 的所有操作
    - 测试购物车计算逻辑
    - _需求：15.1_
  
  - [ ]* 5.8 编写购物车属性测试
    - **属性 9：购物车添加商品不变量**
    - **属性 10：购物车数量管理不变量**
    - **验证：需求 10.2, 10.6**

- [~] 6. 订单和支付功能（Order & Payment Feature）
  - [x] 6.1 实现 Order 数据层
    - 创建 OrderRemoteDataSource 接口和实现
    - 创建 OrderLocalDataSource 接口和实现
    - 创建 OrderRepository 接口和实现
    - 使用 Either 和 TaskEither 处理错误
    - _需求：7.1, 7.2, 10.4_
  
  - [x] 6.2 实现 Payment 数据层
    - 创建 PaymentRemoteDataSource 接口和实现
    - 创建 PaymentRepository 接口和实现
    - 集成微信支付和支付宝 SDK
    - _需求：11.1, 11.2_
  
  - [~] 6.3 实现订单创建用例
    - 创建 CreateOrderUseCase
    - 从购物车生成订单
    - 验证库存和价格
    - _需求：10.4_
  
  - [~] 6.4 实现支付流程 Provider
    - 创建 PaymentNotifier（AsyncNotifier）
    - 实现 initiatePayment 方法
    - 实现 checkPaymentStatus 方法
    - 处理支付状态转换
    - _需求：11.2, 11.4_
  
  - [~] 6.5 实现订单确认 UI
    - 创建 OrderConfirmationScreen
    - 显示订单摘要和总价
    - 实现支付方式选择
    - _需求：11.1_
  
  - [~] 6.6 实现支付处理 UI
    - 创建 PaymentProcessingScreen
    - 显示支付加载状态
    - 实现取消支付功能
    - 处理支付成功/失败
    - 使用 ToastService 显示结果
    - _需求：11.3, 11.4, 11.6_
  
  - [~] 6.7 实现订单历史 UI
    - 创建 OrderHistoryScreen
    - 创建 OrderCard widget
    - 显示订单状态和详情
    - _需求：11.5, 13.1_
  
  - [x] 6.8 编写订单和支付单元测试
    - 测试 OrderRepository 的创建流程
    - 测试 PaymentNotifier 的状态管理
    - 测试支付状态转换逻辑
    - _需求：15.1_
  
  - [ ]* 6.9 编写支付属性测试
    - **属性 12：支付状态转换有效性**
    - **验证：需求 11.2**

- [~] 7. 位置服务功能（Location Feature）
  - [~] 7.1 实现位置服务数据层
    - 创建 LocationService 接口
    - 实现 LocationServiceImpl（使用 geolocator）
    - 处理位置权限请求
    - 使用 Either 处理错误
    - _需求：12.1, 12.3_
  
  - [~] 7.2 实现位置 Provider
    - 创建 locationServiceProvider
    - 创建 CurrentLocationNotifier（AsyncNotifier）
    - 实现位置权限状态管理
    - _需求：12.2_
  
  - [~] 7.3 实现基于位置的设备查找
    - 创建 NearbyDevicesNotifier
    - 计算设备距离
    - 按距离排序设备列表
    - _需求：12.4, 12.5_
  
  - [~] 7.4 实现位置选择 UI
    - 创建位置权限请求对话框
    - 实现手动位置选择功能
    - 显示当前位置和设备距离
    - _需求：12.1, 12.6_
  
  - [ ]* 7.5 编写位置服务单元测试
    - 测试位置权限处理
    - 测试距离计算逻辑
    - 测试错误处理
    - _需求：15.1_

- [~] 8. 用户中心功能（User Feature）
  - [~] 8.1 实现用户数据层
    - 创建 UserRemoteDataSource 接口和实现
    - 创建 UserLocalDataSource 接口和实现
    - 创建 UserRepository 接口和实现
    - _需求：7.1, 7.2_
  
  - [~] 8.2 实现认证 Provider
    - 创建 AuthNotifier（AsyncNotifier）
    - 实现 login、logout、refreshToken 方法
    - 管理认证状态
    - _需求：1.1, 2.4_
  
  - [~] 8.3 实现用户资料 Provider
    - 创建 UserProfileNotifier（AsyncNotifier）
    - 实现 updateProfile 方法
    - _需求：13.2, 13.4_
  
  - [~] 8.4 实现用户中心 UI
    - 创建 UserCenterScreen
    - 显示用户信息和订单统计
    - 实现导航到订单历史、资料设置
    - _需求：13.3, 13.6_
  
  - [~] 8.5 实现个人资料编辑 UI
    - 创建 ProfileEditScreen
    - 实现表单验证
    - 使用 ToastService 显示保存结果
    - _需求：13.2_
  
  - [ ]* 8.6 编写用户功能单元测试
    - 测试 AuthNotifier 的认证流程
    - 测试 UserProfileNotifier 的更新逻辑
    - _需求：15.1_


- [~] 9. 路由和导航集成
  - [~] 9.1 定义所有应用路由
    - 使用 go_router_builder 定义类型安全路由
    - 创建 HomeRoute、DeviceRoute、ProductRoute、CartRoute 等
    - 配置路由参数和查询参数
    - _需求：2.1, 2.3, 2.5_
  
  - [~] 9.2 实现底部导航栏
    - 创建 MainScaffold 使用 ShellRoute
    - 实现 Home、Devices、Orders、Profile 标签
    - 管理导航状态
    - _需求：2.6_
  
  - [~] 9.3 实现深度链接支持
    - 配置 Android 和 iOS 深度链接
    - 测试深度链接导航
    - _需求：2.5_
  
  - [ ]* 9.4 编写路由单元测试
    - 测试路由参数传递
    - 测试导航守卫逻辑
    - 测试深度链接解析
    - _需求：15.2_
  
  - [ ]* 9.5 编写路由属性测试
    - **属性 3：路由参数类型安全传递**
    - **属性 4：深度链接路径解析**
    - **验证：需求 2.3, 2.5**

- [~] 10. 国际化和本地化
  - [~] 10.1 配置国际化框架
    - 设置 flutter_localizations
    - 创建 ARB 文件结构
    - 配置中文（zh）作为主要语言
    - _需求：22.1, 22.2, 22.5_
  
  - [~] 10.2 实现本地化字符串
    - 创建所有 UI 文本的翻译
    - 实现日期和数字格式化
    - _需求：22.3, 22.4_
  
  - [~] 10.3 集成本地化到应用
    - 在所有 UI 中使用本地化字符串
    - 测试本地化显示
    - _需求：22.3_

- [~] 11. 性能优化
  - [~] 11.1 优化 Widget 构建
    - 添加 const 构造函数
    - 使用 RepaintBoundary 隔离重绘
    - 优化列表渲染（ListView.builder）
    - _需求：14.1, 14.9_
  
  - [~] 11.2 优化 Provider 使用
    - 使用 autoDispose 防止内存泄漏
    - 使用 select 避免不必要的重建
    - 使用 ref.listen 处理副作用
    - _需求：14.2, 14.6, 14.8_
  
  - [~] 11.3 优化图片加载
    - 实现图片缓存策略
    - 使用 cached_network_image
    - 实现延迟加载
    - _需求：14.4_
  
  - [~] 11.4 优化数据加载
    - 实现分页加载
    - 使用 compute 进行后台计算
    - 优化网络请求缓存
    - _需求：14.3, 14.7, 23.2, 23.3_

- [~] 12. 错误处理和日志
  - [~] 12.1 实现全局错误处理
    - 创建 ErrorLoggingObserver
    - 配置 FlutterError.onError
    - 实现错误上报服务集成
    - _需求：21.1, 21.5, 21.6_
  
  - [~] 12.2 实现错误恢复机制
    - 实现网络请求重试逻辑
    - 实现认证 token 自动刷新
    - 实现缓存降级策略
    - _需求：21.2, 23.6_
  
  - [~] 12.3 实现统一错误 UI
    - 创建 ErrorView widget
    - 实现重试按钮
    - 提供用户友好的错误消息
    - _需求：21.3, 21.4_
  
  - [ ]* 12.4 编写错误处理属性测试
    - **属性 5：Either 链式操作正确性**
    - **属性 6：Failure 到用户消息映射完整性**
    - **验证：需求 5.3, 5.5**

- [~] 13. 开发者工具和代码质量
  - [~] 13.1 配置 Riverpod DevTools
    - 启用 Riverpod 状态检查器
    - 配置 provider 依赖可视化
    - _需求：24.1, 24.6_
  
  - [~] 13.2 配置代码质量工具
    - 设置 flutter_lints 和自定义规则
    - 配置 dart format 和 dart analyze
    - 设置 pre-commit hooks
    - _需求：24.2, 24.3, 24.4, 24.5_
  
  - [~] 13.3 编写代码文档
    - 为所有公共 API 添加 dartdoc 注释
    - 为 Provider 添加用途说明
    - 为复杂逻辑添加内联注释
    - _需求：16.1, 16.2, 16.3, 16.5_

- [~] 14. 集成测试和端到端测试
  - [ ]* 14.1 编写购买流程集成测试
    - 测试从浏览设备到完成支付的完整流程
    - 验证所有状态转换
    - _需求：15.9_
  
  - [ ]* 14.2 编写用户中心集成测试
    - 测试登录、查看订单、更新资料流程
    - _需求：15.9_
  
  - [ ]* 14.3 编写设备管理集成测试
    - 测试浏览设备、查看详情、报告问题流程
    - _需求：15.9_

- [~] 15. 平台特定配置
  - [~] 15.1 配置 Android 平台
    - 设置应用图标和启动画面
    - 配置权限（位置、网络、存储）
    - 配置深度链接
    - 测试 Android 平台功能
    - _需求：17.1, 17.3, 17.5_
  
  - [~] 15.2 配置 iOS 平台
    - 设置应用图标和启动画面
    - 配置权限描述（Info.plist）
    - 配置深度链接
    - 测试 iOS 平台功能
    - _需求：17.2, 17.3, 17.5_
  
  - [~] 15.3 验证平台一致性
    - 测试两个平台的 UI 一致性
    - 验证 Material Design 实现
    - 测试平台特定功能
    - _需求：17.4, 17.6_

- [~] 16. 最终检查点
  - 确保所有测试通过
  - 验证代码覆盖率达标（单元测试 ≥80%，Widget 测试 ≥70%）
  - 运行性能测试
  - 检查所有文档完整性
  - 验证所有正确性属性
  - 询问用户是否有问题或需要调整

## 注意事项

- 标记 `*` 的任务是可选的，可以跳过以加快 MVP 开发
- 每个任务都引用了具体的需求以便追溯
- 检查点确保增量验证
- 属性测试验证通用正确性属性
- 单元测试验证具体示例和边缘情况

