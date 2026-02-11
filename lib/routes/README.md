# 路由系统 (Routing System)

本目录包含应用的路由配置，使用 `go_router` 和 `go_router_builder` 实现类型安全、声明式的导航。

## 文件结构

```
lib/routes/
├── app_routes.dart       # 路由路径常量定义 (String constants)
├── routes.dart           # 类型安全路由定义 (GoRouteData)
├── routes.g.dart         # 自动生成的路由映射代码
├── app_router.dart       # GoRouter 实例配置与认证守卫
├── app_router.g.dart     # 生成的 Riverpod provider 代码
└── README.md            # 本文档
```

## 核心组件

### 1. 路由常量 (`app_routes.dart`)

集中定义所有路由路径，确保路径在整个应用中的唯一性和一致性。

```dart
class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  // ...
}
```

### 2. 类型安全路由 (`routes.dart`)

使用 `go_router_builder` 提供的 `TypedGoRoute` 进行定义。这种方式相比传统的 `GoRoute` 具有以下优势：
- **类型安全**：编译器检查参数类型。
- **自动导航方法**：生成 `.go()`、`.push()` 等方法。
- **结构清晰**：路由与其对应的视图绑定关系一目了然。

#### 示例定义：
```dart
@TypedGoRoute<LoginRoute>(path: AppRoutes.login)
class LoginRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) => const LoginView();
}
```

#### 嵌套路由与 ShellRoute：
应用使用 `TypedStatefulShellRoute` 实现底部导航（GNavScaffold），保持各个 Tab 的状态。
- **Home**: 首页
- **Eat**: 设备列表
- **Orders**: 订单列表
- **Profile**: 个人中心

### 3. GoRouter 配置 (`app_router.dart`)

通过 Riverpod provider (`goRouterProvider`) 提供 `GoRouter` 实例，主要职责包括：
- **认证守卫**：监听认证状态并在 `redirect` 中处理登录重定向逻辑。
- **错误处理**：配置全局错误页面（待完善）。
- **初始化路径**：设置应用启动时的初始位置。

## 导航方法

由于使用了类型安全路由，推荐使用生成的路由类进行导航，而不是手动拼写字符串。

### 1. 简单导航
```dart
const HomeRoute().go(context);
```

### 2. 带参数导航
```dart
DeviceDetailRoute(id: 'device_123').push(context);
```

### 3. 页面转场
部分路由在 `routes.dart` 中通过重写 `buildPage` 使用了 `PageTransitionPage` 实现自定义动画（如 `rightToLeft`）。

## 认证流程

1. **Splash/Onboarding**：检查用户状态。
2. **Redirect 逻辑**：
   - 若未认证且访问受保护页面 -> 重定向到 `LoginRoute`。
   - 若已认证且访问登录页面 -> 重定向到 `HomeRoute`。
3. **状态同步**：`app_router.dart` 监听 `authProvider`，状态变化时 `GoRouter` 会自动重新评估 `redirect` 逻辑。

## 扩展建议

1. **添加新页面**：
   - 在 `app_routes.dart` 定义常量路径。
   - 在 `routes.dart` 定义对应的 `GoRouteData` 类并添加 `@TypedGoRoute` 注解。
   - 运行 `melos run gen` (或 `dart run build_runner build`) 生成代码。
2. **处理深度链接**：
   - 目前路由结构已支持路径参数，可在原生平台（Android/iOS）配置 Scheme。

## 相关需求验证

- **需求 2.1**: 使用 GoRouter 的声明式路由配置 ✅
- **需求 2.3**: 使用类型安全的参数传递 (TypedGoRoute) ✅
- **需求 2.4**: 使用 redirect 机制实现导航守卫 ✅
- **需求 2.6**: 使用 StatefulShellRoute 管理底部导航 ✅
