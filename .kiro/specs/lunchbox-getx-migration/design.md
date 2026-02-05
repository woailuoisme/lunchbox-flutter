# 设计文档：Lunchbox 应用技术栈

## 概述

本设计文档描述了使用现代 Flutter 技术栈构建 Lunchbox（饭盒售货机应用）的技术架构和实现方案。应用采用功能优先（Feature-First）的清晰架构，结合以下核心技术：

- **Riverpod 3.0+**：状态管理和依赖注入
- **GoRouter 17.0+**：声明式路由和导航
- **Toastification**：用户通知系统
- **fpdart**：函数式错误处理
- **freezed**：不可变数据模型
- **json_serializable**：JSON 序列化
- **Dio 5.0+**：HTTP 网络请求

### 设计目标

1. **类型安全**：利用 Dart 的类型系统和代码生成确保编译时安全
2. **可测试性**：通过依赖注入和纯函数设计实现高可测试性
3. **可维护性**：清晰的架构分层和功能模块化
4. **性能优化**：响应式状态管理和高效的 UI 更新
5. **开发者体验**：现代化的工具链和优秀的调试支持

### 核心业务功能

1. **设备管理**：监控设备状态、查看设备信息、报告设备问题
2. **产品浏览与购买**：按类别浏览产品、管理购物车、创建订单
3. **支付系统**：微信支付和支付宝集成、支付状态管理、交易历史
4. **位置服务**：实时位置获取、基于位置的设备查找
5. **用户中心**：订单历史、个人资料管理、帮助中心

### 数据层级

应用遵循三级数据结构：

1. **城市（City）**：地理区域，包含多个设备
2. **设备（Device）**：物理售货机，位于特定城市，包含多个产品
3. **产品（Product）**：可购买的商品，属于特定设备


## 架构

### 整体架构

应用采用**功能优先（Feature-First）**的清晰架构模式，每个功能模块包含三个层次：

```
lib/
├── core/                    # 核心共享代码
│   ├── network/            # 网络层配置
│   ├── error/              # 错误处理
│   ├── utils/              # 工具函数
│   └── constants/          # 常量定义
├── shared/                  # 共享组件
│   ├── widgets/            # 共享 UI 组件
│   ├── models/             # 共享数据模型
│   └── providers/          # 共享 Provider
└── features/                # 功能模块
    ├── device/             # 设备管理
    │   ├── data/           # 数据层
    │   │   ├── datasources/
    │   │   ├── models/
    │   │   └── repositories/
    │   ├── domain/         # 领域层
    │   │   ├── entities/
    │   │   └── usecases/
    │   └── presentation/   # 表现层
    │       ├── providers/
    │       ├── screens/
    │       └── widgets/
    ├── product/            # 产品与购物
    ├── payment/            # 支付系统
    ├── location/           # 位置服务
    └── user/               # 用户中心
```

### 架构层次

#### 1. 数据层（Data Layer）

**职责**：
- 与外部数据源交互（API、本地存储）
- 数据模型的序列化和反序列化
- 实现 Repository 接口

**组件**：
- **DataSource**：封装具体的数据获取逻辑（API 调用、本地存储）
- **Model**：使用 freezed 和 json_serializable 的数据传输对象
- **Repository Implementation**：实现领域层定义的 Repository 接口

#### 2. 领域层（Domain Layer）

**职责**：
- 定义业务实体和业务规则
- 定义 Repository 接口（抽象）
- 实现用例（Use Cases）

**组件**：
- **Entity**：纯业务对象，不依赖任何框架
- **Repository Interface**：定义数据访问的抽象接口
- **Use Case**：封装单一业务操作的逻辑

#### 3. 表现层（Presentation Layer）

**职责**：
- UI 渲染和用户交互
- 状态管理
- 导航控制

**组件**：
- **Provider**：Riverpod 状态管理（Notifier、AsyncNotifier）
- **Screen**：页面级 Widget
- **Widget**：可复用的 UI 组件

### 依赖方向

依赖方向始终从外向内：

```
Presentation → Domain → Data
```

- Presentation 层依赖 Domain 层
- Data 层依赖 Domain 层（实现接口）
- Domain 层不依赖任何其他层（纯业务逻辑）


## 组件和接口

### 状态管理（Riverpod）

#### Provider 类型选择

1. **Provider**：用于不可变的依赖注入
   ```dart
   @riverpod
   Dio dio(DioRef ref) {
     return Dio(BaseOptions(baseUrl: apiBaseUrl));
   }
   ```

2. **NotifierProvider**：用于同步状态管理
   ```dart
   @riverpod
   class CartNotifier extends _$CartNotifier {
     @override
     CartState build() => CartState.empty();
     
     void addItem(Product product) {
       state = state.copyWith(
         items: [...state.items, CartItem(product: product, quantity: 1)]
       );
     }
   }
   ```

3. **AsyncNotifierProvider**：用于异步状态管理
   ```dart
   @riverpod
   class DeviceList extends _$DeviceList {
     @override
     Future<List<Device>> build() async {
       final repository = ref.read(deviceRepositoryProvider);
       final result = await repository.getDevices();
       return result.fold(
         (failure) => throw failure,
         (devices) => devices,
       );
     }
   }
   ```

4. **FutureProvider**：用于一次性异步数据获取
   ```dart
   @riverpod
   Future<City> city(CityRef ref, String cityId) async {
     final repository = ref.read(cityRepositoryProvider);
     final result = await repository.getCityById(cityId);
     return result.fold(
       (failure) => throw failure,
       (city) => city,
     );
   }
   ```

#### Provider 生命周期管理

- **autoDispose**：自动释放不再使用的 Provider
- **keepAlive**：保持 Provider 活跃状态
- **family**：参数化 Provider

```dart
@riverpod
Future<Device> device(DeviceRef ref, String deviceId) async {
  // 自动释放，带参数
  final repository = ref.read(deviceRepositoryProvider);
  final result = await repository.getDeviceById(deviceId);
  return result.getOrElse(() => throw DeviceNotFoundFailure());
}
```

### 路由系统（GoRouter）

#### 路由配置

使用声明式路由配置和类型安全的路由生成：

```dart
@TypedGoRoute<HomeRoute>(path: '/')
class HomeRoute extends GoRouteData {
  const HomeRoute();
  
  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}

@TypedGoRoute<DeviceRoute>(path: '/device/:id')
class DeviceRoute extends GoRouteData {
  final String id;
  
  const DeviceRoute({required this.id});
  
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return DeviceDetailScreen(deviceId: id);
  }
}

@TypedGoRoute<ProductRoute>(path: '/device/:deviceId/product/:productId')
class ProductRoute extends GoRouteData {
  final String deviceId;
  final String productId;
  
  const ProductRoute({required this.deviceId, required this.productId});
  
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ProductDetailScreen(
      deviceId: deviceId,
      productId: productId,
    );
  }
}
```

#### 导航守卫

使用 redirect 实现认证检查和条件导航：

```dart
@riverpod
GoRouter router(RouterRef ref) {
  final authState = ref.watch(authStateProvider);
  
  return GoRouter(
    routes: $appRoutes,
    redirect: (context, state) {
      final isAuthenticated = authState.maybeWhen(
        authenticated: (_) => true,
        orElse: () => false,
      );
      
      final isAuthRoute = state.matchedLocation.startsWith('/auth');
      
      if (!isAuthenticated && !isAuthRoute) {
        return '/auth/login';
      }
      
      if (isAuthenticated && isAuthRoute) {
        return '/';
      }
      
      return null;
    },
  );
}
```

#### 嵌套导航

使用 ShellRoute 实现底部导航栏：

```dart
@TypedShellRoute<MainShellRoute>(
  routes: [
    TypedGoRoute<HomeRoute>(path: '/home'),
    TypedGoRoute<DevicesRoute>(path: '/devices'),
    TypedGoRoute<OrdersRoute>(path: '/orders'),
    TypedGoRoute<ProfileRoute>(path: '/profile'),
  ],
)
class MainShellRoute extends ShellRouteData {
  const MainShellRoute();
  
  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return MainScaffold(child: navigator);
  }
}
```


### 错误处理（fpdart）

#### Failure 类型定义

使用 sealed class 定义类型安全的错误层次：

```dart
@freezed
sealed class Failure with _$Failure {
  const factory Failure.network({
    required String message,
    int? statusCode,
  }) = NetworkFailure;
  
  const factory Failure.server({
    required String message,
    required int statusCode,
  }) = ServerFailure;
  
  const factory Failure.cache({
    required String message,
  }) = CacheFailure;
  
  const factory Failure.notFound({
    required String resource,
  }) = NotFoundFailure;
  
  const factory Failure.unauthorized() = UnauthorizedFailure;
  
  const factory Failure.validation({
    required String message,
    Map<String, String>? fieldErrors,
  }) = ValidationFailure;
}
```

#### Either 使用模式

Repository 返回 Either<Failure, Success>：

```dart
abstract class DeviceRepository {
  Future<Either<Failure, List<Device>>> getDevices();
  Future<Either<Failure, Device>> getDeviceById(String id);
  Future<Either<Failure, Unit>> reportIssue(String deviceId, String issue);
}

class DeviceRepositoryImpl implements DeviceRepository {
  final DeviceRemoteDataSource remoteDataSource;
  final DeviceLocalDataSource localDataSource;
  
  @override
  Future<Either<Failure, List<Device>>> getDevices() async {
    try {
      final models = await remoteDataSource.getDevices();
      final devices = models.map((m) => m.toEntity()).toList();
      await localDataSource.cacheDevices(models);
      return right(devices);
    } on DioException catch (e) {
      return left(Failure.network(
        message: e.message ?? 'Network error',
        statusCode: e.response?.statusCode,
      ));
    } catch (e) {
      return left(Failure.cache(message: e.toString()));
    }
  }
}
```

#### TaskEither 用于异步操作链

```dart
TaskEither<Failure, Order> createOrder(CreateOrderRequest request) {
  return TaskEither.tryCatch(
    () => remoteDataSource.createOrder(request),
    (error, stackTrace) => Failure.network(message: error.toString()),
  ).flatMap((orderModel) => TaskEither.tryCatch(
    () => paymentService.initiatePayment(orderModel.id),
    (error, stackTrace) => Failure.server(
      message: 'Payment initiation failed',
      statusCode: 500,
    ),
  )).map((paymentResult) => orderModel.toEntity());
}
```

#### Option 用于可选值

```dart
Option<User> getCurrentUser() {
  final userJson = sharedPreferences.getString('current_user');
  return Option.fromNullable(userJson).flatMap((json) {
    try {
      return some(User.fromJson(jsonDecode(json)));
    } catch (e) {
      return none();
    }
  });
}
```

### 通知系统（Toastification）

#### Toast 配置

```dart
@riverpod
class ToastService extends _$ToastService {
  @override
  void build() {}
  
  void showSuccess(String message) {
    toastification.show(
      context: navigatorKey.currentContext!,
      type: ToastificationType.success,
      style: ToastificationStyle.fillColored,
      title: Text('成功'),
      description: Text(message),
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 300),
      icon: const Icon(Icons.check_circle),
    );
  }
  
  void showError(String message) {
    toastification.show(
      context: navigatorKey.currentContext!,
      type: ToastificationType.error,
      style: ToastificationStyle.fillColored,
      title: Text('错误'),
      description: Text(message),
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 5),
      animationDuration: const Duration(milliseconds: 300),
      icon: const Icon(Icons.error),
    );
  }
  
  void showInfo(String message) {
    toastification.show(
      context: navigatorKey.currentContext!,
      type: ToastificationType.info,
      style: ToastificationStyle.fillColored,
      title: Text('提示'),
      description: Text(message),
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 300),
      icon: const Icon(Icons.info),
    );
  }
}
```

#### 与 Either 集成

```dart
extension EitherToastExtension<L extends Failure, R> on Either<L, R> {
  R getOrShowError(ToastService toastService) {
    return fold(
      (failure) {
        final message = failure.when(
          network: (msg, _) => '网络错误：$msg',
          server: (msg, _) => '服务器错误：$msg',
          cache: (msg) => '缓存错误：$msg',
          notFound: (resource) => '未找到：$resource',
          unauthorized: () => '未授权，请重新登录',
          validation: (msg, _) => '验证错误：$msg',
        );
        toastService.showError(message);
        throw failure;
      },
      (value) => value,
    );
  }
}
```


## 数据模型

### 模型设计原则

1. **领域实体（Entity）**：纯业务对象，不包含序列化逻辑
2. **数据模型（Model）**：用于数据传输，包含序列化逻辑
3. **使用 freezed**：生成不可变类和 copyWith 方法
4. **使用 json_serializable**：生成 JSON 序列化代码

### 核心数据模型

#### City（城市）

```dart
// Domain Entity
@freezed
class City with _$City {
  const factory City({
    required String id,
    required String name,
    required String code,
    required int deviceCount,
  }) = _City;
}

// Data Model
@freezed
class CityModel with _$CityModel {
  const factory CityModel({
    required String id,
    required String name,
    required String code,
    @JsonKey(name: 'device_count') required int deviceCount,
  }) = _CityModel;
  
  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);
  
  const CityModel._();
  
  City toEntity() => City(
    id: id,
    name: name,
    code: code,
    deviceCount: deviceCount,
  );
}
```

#### Device（设备）

```dart
// Domain Entity
@freezed
class Device with _$Device {
  const factory Device({
    required String id,
    required String name,
    required String cityId,
    required DeviceStatus status,
    required Location location,
    required List<String> productIds,
    required DateTime lastUpdated,
  }) = _Device;
}

enum DeviceStatus {
  online,
  offline,
  maintenance,
  error,
}

@freezed
class Location with _$Location {
  const factory Location({
    required double latitude,
    required double longitude,
    String? address,
  }) = _Location;
}

// Data Model
@freezed
class DeviceModel with _$DeviceModel {
  const factory DeviceModel({
    required String id,
    required String name,
    @JsonKey(name: 'city_id') required String cityId,
    required String status,
    required LocationModel location,
    @JsonKey(name: 'product_ids') required List<String> productIds,
    @JsonKey(name: 'last_updated') required String lastUpdated,
  }) = _DeviceModel;
  
  factory DeviceModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceModelFromJson(json);
  
  const DeviceModel._();
  
  Device toEntity() => Device(
    id: id,
    name: name,
    cityId: cityId,
    status: _parseStatus(status),
    location: location.toEntity(),
    productIds: productIds,
    lastUpdated: DateTime.parse(lastUpdated),
  );
  
  DeviceStatus _parseStatus(String status) {
    return DeviceStatus.values.firstWhere(
      (s) => s.name == status,
      orElse: () => DeviceStatus.offline,
    );
  }
}

@freezed
class LocationModel with _$LocationModel {
  const factory LocationModel({
    required double latitude,
    required double longitude,
    String? address,
  }) = _LocationModel;
  
  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
  
  const LocationModel._();
  
  Location toEntity() => Location(
    latitude: latitude,
    longitude: longitude,
    address: address,
  );
}
```

#### Product（产品）

```dart
// Domain Entity
@freezed
class Product with _$Product {
  const factory Product({
    required String id,
    required String name,
    required String description,
    required double price,
    required String category,
    required String imageUrl,
    required int stock,
    required String deviceId,
  }) = _Product;
}

// Data Model
@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String id,
    required String name,
    required String description,
    required double price,
    required String category,
    @JsonKey(name: 'image_url') required String imageUrl,
    required int stock,
    @JsonKey(name: 'device_id') required String deviceId,
  }) = _ProductModel;
  
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  
  const ProductModel._();
  
  Product toEntity() => Product(
    id: id,
    name: name,
    description: description,
    price: price,
    category: category,
    imageUrl: imageUrl,
    stock: stock,
    deviceId: deviceId,
  );
}
```

#### Cart（购物车）

```dart
@freezed
class CartState with _$CartState {
  const factory CartState({
    required List<CartItem> items,
    required String? deviceId,
  }) = _CartState;
  
  const CartState._();
  
  factory CartState.empty() => const CartState(
    items: [],
    deviceId: null,
  );
  
  double get totalPrice => items.fold(
    0.0,
    (sum, item) => sum + (item.product.price * item.quantity),
  );
  
  int get totalItems => items.fold(
    0,
    (sum, item) => sum + item.quantity,
  );
}

@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    required Product product,
    required int quantity,
  }) = _CartItem;
}
```

#### Order（订单）

```dart
// Domain Entity
@freezed
class Order with _$Order {
  const factory Order({
    required String id,
    required String userId,
    required String deviceId,
    required List<OrderItem> items,
    required double totalAmount,
    required OrderStatus status,
    required PaymentMethod paymentMethod,
    required DateTime createdAt,
    DateTime? paidAt,
    DateTime? completedAt,
  }) = _Order;
}

enum OrderStatus {
  pending,
  paid,
  processing,
  completed,
  cancelled,
}

enum PaymentMethod {
  wechat,
  alipay,
}

@freezed
class OrderItem with _$OrderItem {
  const factory OrderItem({
    required String productId,
    required String productName,
    required double price,
    required int quantity,
  }) = _OrderItem;
}

// Data Model
@freezed
class OrderModel with _$OrderModel {
  const factory OrderModel({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'device_id') required String deviceId,
    required List<OrderItemModel> items,
    @JsonKey(name: 'total_amount') required double totalAmount,
    required String status,
    @JsonKey(name: 'payment_method') required String paymentMethod,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'paid_at') String? paidAt,
    @JsonKey(name: 'completed_at') String? completedAt,
  }) = _OrderModel;
  
  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
  
  const OrderModel._();
  
  Order toEntity() => Order(
    id: id,
    userId: userId,
    deviceId: deviceId,
    items: items.map((i) => i.toEntity()).toList(),
    totalAmount: totalAmount,
    status: _parseOrderStatus(status),
    paymentMethod: _parsePaymentMethod(paymentMethod),
    createdAt: DateTime.parse(createdAt),
    paidAt: paidAt != null ? DateTime.parse(paidAt!) : null,
    completedAt: completedAt != null ? DateTime.parse(completedAt!) : null,
  );
  
  OrderStatus _parseOrderStatus(String status) {
    return OrderStatus.values.firstWhere(
      (s) => s.name == status,
      orElse: () => OrderStatus.pending,
    );
  }
  
  PaymentMethod _parsePaymentMethod(String method) {
    return PaymentMethod.values.firstWhere(
      (m) => m.name == method,
      orElse: () => PaymentMethod.wechat,
    );
  }
}

@freezed
class OrderItemModel with _$OrderItemModel {
  const factory OrderItemModel({
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'product_name') required String productName,
    required double price,
    required int quantity,
  }) = _OrderItemModel;
  
  factory OrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemModelFromJson(json);
  
  const OrderItemModel._();
  
  OrderItem toEntity() => OrderItem(
    productId: productId,
    productName: productName,
    price: price,
    quantity: quantity,
  );
}
```


## 正确性属性

*属性是一个特征或行为，应该在系统的所有有效执行中保持为真——本质上是关于系统应该做什么的形式化陈述。属性作为人类可读规范和机器可验证正确性保证之间的桥梁。*

### 属性 1：状态变化响应式通知

*对于任何* Riverpod provider 的状态，当状态发生变化时，所有监听该状态的组件都应该收到通知并重新构建

**验证：需求 1.2**

### 属性 2：Provider 自动释放

*对于任何* 使用 autoDispose 修饰符的 Riverpod provider，当没有监听者时，该 provider 应该被自动释放并清理资源

**验证：需求 1.4**

### 属性 3：路由参数类型安全传递

*对于任何* 带参数的路由导航，传递的参数类型应该与路由定义的参数类型匹配，并且在目标页面能够正确接收

**验证：需求 2.3**

### 属性 4：深度链接路径解析

*对于任何* 有效的深度链接 URL，GoRouter 应该能够解析路径并导航到对应的页面，参数应该正确提取

**验证：需求 2.5**

### 属性 5：Either 链式操作正确性

*对于任何* Either 值的链式操作（map、flatMap），如果初始值是 Left，则整个链应该短路并返回 Left；如果初始值是 Right，则应该依次执行所有操作

**验证：需求 5.3**

### 属性 6：Failure 到用户消息映射完整性

*对于任何* Failure 类型（NetworkFailure、ServerFailure、CacheFailure、NotFoundFailure、UnauthorizedFailure、ValidationFailure），都应该能够映射到非空的用户友好消息

**验证：需求 5.5**

### 属性 7：Repository 错误处理一致性

*对于任何* Repository 的异步操作，当操作失败时应该返回 Either 的 Left(Failure)，成功时返回 Right(Success)，不应该抛出未捕获的异常

**验证：需求 9.4, 10.4, 11.4**

### 属性 8：设备问题报告反馈

*对于任何* 设备问题报告提交，无论成功或失败，都应该通过 Toastification 显示相应的反馈消息

**验证：需求 9.2**

### 属性 9：购物车添加商品不变量

*对于任何* 购物车状态和产品，添加商品后购物车的商品数量应该增加，总价应该增加相应产品的价格

**验证：需求 10.2**

### 属性 10：购物车数量管理不变量

*对于任何* 购物车中的商品：
- 增加数量后，该商品的数量应该加 1
- 减少数量后，该商品的数量应该减 1（如果数量为 1 则删除）
- 删除商品后，该商品不应该存在于购物车中

**验证：需求 10.6**

### 属性 11：JSON 序列化往返一致性

*对于任何* 有效的领域实体（City、Device、Product、Order），将其转换为 Model 然后序列化为 JSON，再反序列化并转换回实体，应该得到等价的实体对象

**验证：需求 19.2**

### 属性 12：支付状态转换有效性

*对于任何* 订单的支付状态转换，状态变化应该遵循有效的状态机：pending → paid → processing → completed，或 pending → cancelled

**验证：需求 11.2**


## 错误处理

### 错误处理策略

应用采用多层错误处理策略：

#### 1. Repository 层错误处理

Repository 层捕获所有异常并转换为 Either<Failure, Success>：

```dart
@override
Future<Either<Failure, List<Device>>> getDevices() async {
  try {
    final models = await remoteDataSource.getDevices();
    final devices = models.map((m) => m.toEntity()).toList();
    await localDataSource.cacheDevices(models);
    return right(devices);
  } on DioException catch (e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return left(Failure.network(
        message: '网络连接超时',
        statusCode: null,
      ));
    }
    if (e.response?.statusCode == 401) {
      return left(const Failure.unauthorized());
    }
    if (e.response?.statusCode == 404) {
      return left(Failure.notFound(resource: '设备列表'));
    }
    return left(Failure.server(
      message: e.response?.data['message'] ?? '服务器错误',
      statusCode: e.response?.statusCode ?? 500,
    ));
  } on CacheException catch (e) {
    return left(Failure.cache(message: e.message));
  } catch (e) {
    return left(Failure.network(message: '未知错误：${e.toString()}'));
  }
}
```

#### 2. Provider 层错误处理

Provider 使用 AsyncValue 处理异步操作的错误状态：

```dart
@riverpod
class DeviceList extends _$DeviceList {
  @override
  Future<List<Device>> build() async {
    final repository = ref.read(deviceRepositoryProvider);
    final result = await repository.getDevices();
    
    return result.fold(
      (failure) {
        // 记录错误
        ref.read(loggerProvider).error('Failed to load devices', failure);
        // 抛出异常，让 AsyncValue 捕获
        throw failure;
      },
      (devices) => devices,
    );
  }
  
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(deviceRepositoryProvider);
      final result = await repository.getDevices();
      return result.getOrElse(() => throw const Failure.network(message: '刷新失败'));
    });
  }
}
```

#### 3. UI 层错误处理

UI 层使用 AsyncValue 的 when 方法处理不同状态：

```dart
class DeviceListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final devicesAsync = ref.watch(deviceListProvider);
    
    return devicesAsync.when(
      data: (devices) => DeviceListView(devices: devices),
      loading: () => const LoadingIndicator(),
      error: (error, stackTrace) {
        final message = error is Failure
            ? _failureToMessage(error)
            : '未知错误';
        
        return ErrorView(
          message: message,
          onRetry: () => ref.refresh(deviceListProvider.future),
        );
      },
    );
  }
  
  String _failureToMessage(Failure failure) {
    return failure.when(
      network: (msg, _) => '网络错误：$msg',
      server: (msg, _) => '服务器错误：$msg',
      cache: (msg) => '缓存错误：$msg',
      notFound: (resource) => '未找到：$resource',
      unauthorized: () => '未授权，请重新登录',
      validation: (msg, _) => '验证错误：$msg',
    );
  }
}
```

#### 4. 全局错误处理

使用 ProviderObserver 监听所有 provider 的错误：

```dart
class ErrorLoggingObserver extends ProviderObserver {
  @override
  void providerDidFail(
    ProviderBase provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    // 记录到日志服务
    logger.error(
      'Provider ${provider.name ?? provider.runtimeType} failed',
      error,
      stackTrace,
    );
    
    // 如果是严重错误，上报到错误追踪服务
    if (error is! Failure) {
      errorTrackingService.reportError(error, stackTrace);
    }
  }
}
```

#### 5. 用户友好的错误提示

使用 ref.listen 监听错误并显示 Toast：

```dart
class DeviceListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<List<Device>>>(
      deviceListProvider,
      (previous, next) {
        next.whenOrNull(
          error: (error, stackTrace) {
            if (error is Failure) {
              final message = _failureToMessage(error);
              ref.read(toastServiceProvider).showError(message);
            }
          },
        );
      },
    );
    
    // ... rest of build method
  }
}
```

### 错误恢复策略

#### 网络错误恢复

- 自动重试（指数退避）
- 使用缓存数据作为备选
- 提供手动刷新选项

```dart
Future<Either<Failure, List<Device>>> getDevicesWithRetry() async {
  int retryCount = 0;
  const maxRetries = 3;
  
  while (retryCount < maxRetries) {
    final result = await getDevices();
    
    if (result.isRight()) {
      return result;
    }
    
    final failure = result.getLeft().toNullable()!;
    if (failure is! NetworkFailure) {
      return result; // 非网络错误不重试
    }
    
    retryCount++;
    if (retryCount < maxRetries) {
      await Future.delayed(Duration(seconds: math.pow(2, retryCount).toInt()));
    }
  }
  
  // 所有重试失败，尝试返回缓存数据
  try {
    final cachedModels = await localDataSource.getCachedDevices();
    if (cachedModels.isNotEmpty) {
      return right(cachedModels.map((m) => m.toEntity()).toList());
    }
  } catch (e) {
    // 缓存也失败了
  }
  
  return left(const Failure.network(message: '网络连接失败，请检查网络设置'));
}
```

#### 认证错误恢复

- 自动刷新 token
- 重定向到登录页
- 保存当前状态以便登录后恢复

```dart
class AuthInterceptor extends Interceptor {
  final Ref ref;
  
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // 尝试刷新 token
      final refreshResult = await ref.read(authRepositoryProvider).refreshToken();
      
      if (refreshResult.isRight()) {
        // Token 刷新成功，重试原请求
        final options = err.requestOptions;
        final newToken = refreshResult.getOrElse(() => throw Exception());
        options.headers['Authorization'] = 'Bearer $newToken';
        
        try {
          final response = await ref.read(dioProvider).fetch(options);
          return handler.resolve(response);
        } catch (e) {
          return handler.next(err);
        }
      } else {
        // Token 刷新失败，清除认证状态并导航到登录页
        await ref.read(authRepositoryProvider).logout();
        ref.read(routerProvider).go('/auth/login');
      }
    }
    
    return handler.next(err);
  }
}
```


## 测试策略

### 测试方法

应用采用**双重测试方法**：

1. **单元测试**：验证具体示例、边缘情况和错误条件
2. **属性测试**：验证跨所有输入的通用属性

两者是互补的，对于全面覆盖都是必需的：
- 单元测试捕获具体的 bug
- 属性测试验证通用正确性

### 测试层次

#### 1. 单元测试

**Repository 测试**：

```dart
void main() {
  group('DeviceRepository', () {
    late DeviceRepository repository;
    late MockDeviceRemoteDataSource mockRemoteDataSource;
    late MockDeviceLocalDataSource mockLocalDataSource;
    
    setUp(() {
      mockRemoteDataSource = MockDeviceRemoteDataSource();
      mockLocalDataSource = MockDeviceLocalDataSource();
      repository = DeviceRepositoryImpl(
        remoteDataSource: mockRemoteDataSource,
        localDataSource: mockLocalDataSource,
      );
    });
    
    test('getDevices returns Right when remote call succeeds', () async {
      // Arrange
      final models = [DeviceModel(/* ... */)];
      when(() => mockRemoteDataSource.getDevices())
          .thenAnswer((_) async => models);
      when(() => mockLocalDataSource.cacheDevices(any()))
          .thenAnswer((_) async => {});
      
      // Act
      final result = await repository.getDevices();
      
      // Assert
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Should not be Left'),
        (devices) => expect(devices.length, models.length),
      );
    });
    
    test('getDevices returns Left(NetworkFailure) when network fails', () async {
      // Arrange
      when(() => mockRemoteDataSource.getDevices())
          .thenThrow(DioException(
            requestOptions: RequestOptions(path: '/devices'),
            type: DioExceptionType.connectionTimeout,
          ));
      
      // Act
      final result = await repository.getDevices();
      
      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) => expect(failure, isA<NetworkFailure>()),
        (devices) => fail('Should not be Right'),
      );
    });
  });
}
```

**Provider 测试**：

```dart
void main() {
  group('DeviceListNotifier', () {
    late ProviderContainer container;
    
    setUp(() {
      container = ProviderContainer(
        overrides: [
          deviceRepositoryProvider.overrideWithValue(MockDeviceRepository()),
        ],
      );
    });
    
    tearDown(() {
      container.dispose();
    });
    
    test('initial state is loading', () {
      final state = container.read(deviceListProvider);
      expect(state, const AsyncValue<List<Device>>.loading());
    });
    
    test('loads devices successfully', () async {
      // Arrange
      final mockRepo = container.read(deviceRepositoryProvider) as MockDeviceRepository;
      final devices = [Device(/* ... */)];
      when(() => mockRepo.getDevices())
          .thenAnswer((_) async => right(devices));
      
      // Act
      final future = container.read(deviceListProvider.future);
      
      // Assert
      expect(await future, devices);
    });
  });
}
```

**Widget 测试**：

```dart
void main() {
  group('DeviceListScreen', () {
    testWidgets('displays loading indicator initially', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            deviceListProvider.overrideWith((ref) => const AsyncValue.loading()),
          ],
          child: const MaterialApp(home: DeviceListScreen()),
        ),
      );
      
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
    
    testWidgets('displays devices when loaded', (tester) async {
      final devices = [
        Device(id: '1', name: 'Device 1', /* ... */),
        Device(id: '2', name: 'Device 2', /* ... */),
      ];
      
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            deviceListProvider.overrideWith((ref) => AsyncValue.data(devices)),
          ],
          child: const MaterialApp(home: DeviceListScreen()),
        ),
      );
      
      expect(find.text('Device 1'), findsOneWidget);
      expect(find.text('Device 2'), findsOneWidget);
    });
    
    testWidgets('displays error message when loading fails', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            deviceListProvider.overrideWith((ref) => AsyncValue.error(
              const Failure.network(message: '网络错误'),
              StackTrace.current,
            )),
          ],
          child: const MaterialApp(home: DeviceListScreen()),
        ),
      );
      
      expect(find.text('网络错误'), findsOneWidget);
    });
  });
}
```

#### 2. 属性测试

使用 **test** 包的属性测试功能（或集成 **fast_check** 等库）：

**配置**：
- 每个属性测试最少运行 100 次迭代
- 每个测试必须引用设计文档中的属性
- 标签格式：`Feature: lunchbox-getx-migration, Property {number}: {property_text}`

**示例属性测试**：

```dart
// Feature: lunchbox-getx-migration, Property 9: 购物车添加商品不变量
void main() {
  group('Cart Properties', () {
    test('adding product increases cart count and total price', () {
      // 运行 100 次迭代
      for (int i = 0; i < 100; i++) {
        // 生成随机购物车状态和产品
        final cart = _generateRandomCart();
        final product = _generateRandomProduct();
        
        final initialCount = cart.totalItems;
        final initialPrice = cart.totalPrice;
        
        // 添加商品
        final newCart = cart.copyWith(
          items: [...cart.items, CartItem(product: product, quantity: 1)],
        );
        
        // 验证不变量
        expect(newCart.totalItems, initialCount + 1);
        expect(newCart.totalPrice, closeTo(initialPrice + product.price, 0.01));
      }
    });
  });
}

CartState _generateRandomCart() {
  final random = Random();
  final itemCount = random.nextInt(10);
  final items = List.generate(
    itemCount,
    (_) => CartItem(
      product: _generateRandomProduct(),
      quantity: random.nextInt(5) + 1,
    ),
  );
  return CartState(items: items, deviceId: 'device-${random.nextInt(100)}');
}

Product _generateRandomProduct() {
  final random = Random();
  return Product(
    id: 'product-${random.nextInt(1000)}',
    name: 'Product ${random.nextInt(100)}',
    description: 'Description',
    price: random.nextDouble() * 100,
    category: 'Category',
    imageUrl: 'https://example.com/image.jpg',
    stock: random.nextInt(50),
    deviceId: 'device-${random.nextInt(100)}',
  );
}
```

```dart
// Feature: lunchbox-getx-migration, Property 11: JSON 序列化往返一致性
void main() {
  group('Serialization Properties', () {
    test('Device serialization round-trip preserves data', () {
      for (int i = 0; i < 100; i++) {
        // 生成随机设备实体
        final device = _generateRandomDevice();
        
        // 转换为 Model
        final model = DeviceModel(
          id: device.id,
          name: device.name,
          cityId: device.cityId,
          status: device.status.name,
          location: LocationModel(
            latitude: device.location.latitude,
            longitude: device.location.longitude,
            address: device.location.address,
          ),
          productIds: device.productIds,
          lastUpdated: device.lastUpdated.toIso8601String(),
        );
        
        // 序列化为 JSON
        final json = model.toJson();
        
        // 反序列化
        final deserializedModel = DeviceModel.fromJson(json);
        
        // 转换回实体
        final deserializedDevice = deserializedModel.toEntity();
        
        // 验证等价性
        expect(deserializedDevice.id, device.id);
        expect(deserializedDevice.name, device.name);
        expect(deserializedDevice.cityId, device.cityId);
        expect(deserializedDevice.status, device.status);
        expect(deserializedDevice.location.latitude, device.location.latitude);
        expect(deserializedDevice.location.longitude, device.location.longitude);
        expect(deserializedDevice.productIds, device.productIds);
      }
    });
  });
}
```

```dart
// Feature: lunchbox-getx-migration, Property 7: Repository 错误处理一致性
void main() {
  group('Repository Error Handling Properties', () {
    test('repository operations never throw uncaught exceptions', () async {
      final mockDataSource = MockDeviceRemoteDataSource();
      final repository = DeviceRepositoryImpl(
        remoteDataSource: mockDataSource,
        localDataSource: MockDeviceLocalDataSource(),
      );
      
      // 测试各种异常情况
      final exceptions = [
        DioException(
          requestOptions: RequestOptions(path: '/'),
          type: DioExceptionType.connectionTimeout,
        ),
        DioException(
          requestOptions: RequestOptions(path: '/'),
          type: DioExceptionType.badResponse,
          response: Response(
            requestOptions: RequestOptions(path: '/'),
            statusCode: 500,
          ),
        ),
        Exception('Unknown error'),
        FormatException('Invalid format'),
      ];
      
      for (final exception in exceptions) {
        when(() => mockDataSource.getDevices()).thenThrow(exception);
        
        // 不应该抛出异常，应该返回 Left(Failure)
        final result = await repository.getDevices();
        expect(result.isLeft(), true);
      }
    });
  });
}
```

#### 3. 集成测试

测试完整的用户流程：

```dart
void main() {
  group('Purchase Flow Integration Test', () {
    testWidgets('complete purchase flow', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp.router(
            routerConfig: router,
          ),
        ),
      );
      
      // 1. 浏览设备列表
      expect(find.text('设备列表'), findsOneWidget);
      await tester.tap(find.text('Device 1'));
      await tester.pumpAndSettle();
      
      // 2. 查看产品列表
      expect(find.text('产品列表'), findsOneWidget);
      await tester.tap(find.text('Product 1'));
      await tester.pumpAndSettle();
      
      // 3. 添加到购物车
      await tester.tap(find.byIcon(Icons.add_shopping_cart));
      await tester.pumpAndSettle();
      expect(find.text('已添加到购物车'), findsOneWidget);
      
      // 4. 查看购物车
      await tester.tap(find.byIcon(Icons.shopping_cart));
      await tester.pumpAndSettle();
      expect(find.text('购物车'), findsOneWidget);
      
      // 5. 创建订单
      await tester.tap(find.text('结算'));
      await tester.pumpAndSettle();
      
      // 6. 选择支付方式
      await tester.tap(find.text('微信支付'));
      await tester.pumpAndSettle();
      
      // 7. 确认支付
      await tester.tap(find.text('确认支付'));
      await tester.pumpAndSettle();
      
      // 验证支付成功
      expect(find.text('支付成功'), findsOneWidget);
    });
  });
}
```

### 测试覆盖率目标

- **单元测试覆盖率**：≥ 80%
- **Widget 测试覆盖率**：≥ 70%
- **集成测试**：覆盖所有主要用户流程
- **属性测试**：每个正确性属性至少一个测试

### 持续集成

- 所有测试在 CI/CD 管道中自动运行
- Pull Request 必须通过所有测试才能合并
- 代码覆盖率报告自动生成
- 性能测试定期运行

