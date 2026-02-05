# 路由系统 (Routing System)

本目录包含应用的路由配置，使用 GoRouter 17.0+ 实现声明式、类型安全的导航。

## 文件结构

```
lib/routes/
├── app_router.dart       # GoRouter 配置和认证守卫
├── app_router.g.dart     # 生成的 Riverpod provider 代码
├── app_routes.dart       # 路由路径常量定义
└── README.md            # 本文档
```

## 核心组件

### 1. GoRouter 配置 (`app_router.dart`)

主路由配置 provider，提供以下功能：

#### 认证守卫 (Authentication Guard)

使用 `redirect` 回调实现认证检查：

```dart
redirect: (context, state) {
  final isAuthRoute = state.matchedLocation.startsWith('/auth') ||
      state.matchedLocation == AppRoutes.splash;
  
  // 未认证用户重定向到登录页
  if (!isAuthenticated && !isAuthRoute) {
    return AppRoutes.login;
  }
  
  // 已认证用户访问登录页时重定向到首页
  if (isAuthenticated && state.matchedLocation == AppRoutes.login) {
    return AppRoutes.home;
  }
  
  return null; // 不需要重定向
}
```

**验证需求：2.4**

#### StatefulShellRoute 底部导航

使用 `StatefulShellRoute.indexedStack` 实现底部导航栏，保持各标签页的状态：

```dart
StatefulShellRoute.indexedStack(
  builder: (context, state, navigationShell) {
    return ScaffoldWithNavbar(navigationShell: navigationShell);
  },
  branches: [
    StatefulShellBranch(routes: [/* 首页路由 */]),
    StatefulShellBranch(routes: [/* 订单路由 */]),
    StatefulShellBranch(routes: [/* 个人中心路由 */]),
  ],
)
```

**验证需求：2.6**

### 2. 路由常量 (`app_routes.dart`)

定义所有路由路径常量，使用 `lowerCamelCase` 命名约定：

```dart
class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String deviceList = '/devices';
  static const String deviceDetail = '/device'; // 实际: /device/:id
  // ... 更多路由
}
```

**优点：**
- 类型安全，避免拼写错误
- 集中管理，易于维护
- 符合 Dart 代码风格指南

## 使用方法

### 在应用中使用路由

在 `main.dart` 中配置：

```dart
@override
Widget build(BuildContext context, WidgetRef ref) {
  final router = ref.watch(goRouterProvider);
  
  return MaterialApp.router(
    routerConfig: router,
    // ... 其他配置
  );
}
```

### 导航到其他页面

#### 使用 context 扩展方法

```dart
// 导航到新页面（替换当前历史）
context.go(AppRoutes.home);

// 推入新页面（保留历史）
context.push(AppRoutes.deviceDetail);

// 带参数导航
context.push('${AppRoutes.deviceList}/123');

// 返回上一页
context.pop();
```

#### 使用 GoRouter 实例

```dart
final router = ref.read(goRouterProvider);
router.go(AppRoutes.home);
```

**验证需求：2.1, 2.2**

### 路由参数传递

#### 路径参数

```dart
GoRoute(
  path: '${AppRoutes.deviceList}/:id',
  builder: (context, state) {
    final id = state.pathParameters['id']!;
    return DeviceDetailView(deviceId: id);
  },
)
```

使用：
```dart
context.push('${AppRoutes.deviceList}/device-123');
```

**验证需求：2.3**

#### 查询参数

```dart
GoRoute(
  path: AppRoutes.productList,
  builder: (context, state) {
    final category = state.uri.queryParameters['category'];
    return ProductListView(category: category);
  },
)
```

使用：
```dart
context.push('${AppRoutes.productList}?category=lunch');
```

### 深度链接支持

GoRouter 自动支持深度链接。配置 Android 和 iOS 的深度链接后，可以通过 URL 直接导航到应用内页面。

**验证需求：2.5**

## 路由结构

### 公开路由（无需认证）

- `/splash` - 启动页
- `/login` - 登录页
- `/register` - 注册页（待实现）

### 受保护路由（需要认证）

#### 底部导航标签页

- `/home` - 首页
- `/orders` - 订单列表
- `/profile` - 个人中心

#### 其他页面

- `/device/:id` - 设备详情
- `/product/:id` - 产品详情
- `/cart` - 购物车
- `/payment` - 支付页面
- 等等...

## 认证流程

1. **应用启动** → 显示启动页 (`/splash`)
2. **检查认证状态**
   - 未认证 → 重定向到登录页 (`/login`)
   - 已认证 → 重定向到首页 (`/home`)
3. **用户登录成功** → 自动重定向到首页
4. **用户退出登录** → 自动重定向到登录页

## 底部导航栏

使用 `ScaffoldWithNavbar` widget 实现，包含三个标签：

1. **首页** (Home) - 主要功能入口
2. **订单** (Orders) - 订单历史和管理
3. **我的** (Profile) - 用户中心和设置

每个标签页的状态独立保持，切换时不会重新构建。

## 最佳实践

### 1. 使用路由常量

❌ **不推荐：**
```dart
context.go('/home');
```

✅ **推荐：**
```dart
context.go(AppRoutes.home);
```

### 2. 类型安全的参数传递

❌ **不推荐：**
```dart
context.push('/device/123');
```

✅ **推荐：**
```dart
final deviceId = 'device-123';
context.push('${AppRoutes.deviceList}/$deviceId');
```

### 3. 处理导航结果

```dart
final result = await context.push<bool>(AppRoutes.payment);
if (result == true) {
  // 支付成功
}
```

### 4. 监听路由变化

```dart
ref.listen(goRouterProvider, (previous, next) {
  // 路由配置变化时的处理
});
```

## 扩展路由

### 添加新路由

1. 在 `app_routes.dart` 中添加路由常量：

```dart
static const String newFeature = '/new-feature';
```

2. 在 `app_router.dart` 中添加路由配置：

```dart
GoRoute(
  path: AppRoutes.newFeature,
  builder: (context, state) => const NewFeatureView(),
)
```

### 添加嵌套路由

```dart
GoRoute(
  path: AppRoutes.settings,
  builder: (context, state) => const SettingsView(),
  routes: [
    GoRoute(
      path: 'account',
      builder: (context, state) => const AccountSettingsView(),
    ),
    GoRoute(
      path: 'privacy',
      builder: (context, state) => const PrivacySettingsView(),
    ),
  ],
)
```

访问：`/settings/account` 或 `/settings/privacy`

## 调试

启用调试日志：

```dart
GoRouter(
  debugLogDiagnostics: true, // 已启用
  // ...
)
```

这将在控制台输出路由导航信息，帮助调试路由问题。

## 相关需求

- **需求 2.1**: 使用 GoRouter 的声明式路由配置 ✅
- **需求 2.2**: 使用 context.go 或 context.push 方法导航 ✅
- **需求 2.3**: 使用类型安全的参数传递 ✅
- **需求 2.4**: 使用 redirect 机制实现导航守卫 ✅
- **需求 2.5**: 通过基于路径的路由处理深度链接 ✅
- **需求 2.6**: 使用 ShellRoute 管理嵌套导航 ✅
- **需求 2.7**: 支持浏览器后退按钮和系统返回手势 ✅

## 待实现功能

- [ ] 更多路由页面（产品、购物车、支付等）
- [ ] 路由转场动画自定义
- [ ] 路由级别的错误处理
- [ ] 路由分析和追踪
- [ ] 完整的深度链接配置（Android/iOS）

## 参考资料

- [GoRouter 官方文档](https://pub.dev/packages/go_router)
- [Flutter 导航和路由](https://docs.flutter.dev/development/ui/navigation)
- [Riverpod 与 GoRouter 集成](https://riverpod.dev/docs/essentials/side_effects#performing-actions-on-provider-initialization)
