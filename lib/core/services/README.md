# 核心服务 (Core Services)

本目录包含应用的核心服务，这些服务为整个应用提供基础功能支持。

## 文件结构

```
lib/core/services/
├── api_service.dart       # 基于 Dio 的网络请求服务
├── database_service.dart  # 基于 Drift (SQLite) 的本地数据库服务
├── location_service.dart  # 基于 Geolocator 的位置服务
├── permission_service.dart # 基于 Permission Handler 的权限管理服务
├── storage_service.dart   # 基于 SharedPreferences 的持久化存储服务
├── toast_service.dart     # 基于 Toastification 的通知提醒服务
├── services.dart          # 导出所有服务的统一入口
└── README.md              # 本文档
```

## 核心服务说明

### 1. ApiService (`api_service.dart`)

提供统一的 HTTP 网络请求接口，封装了常用的 `GET`、`POST`、`PUT`、`DELETE` 等方法。

- **依赖**: `dio`
- **Provider**: `apiServiceProvider`
- **主要功能**:
  - 自动注入 `Dio` 实例（包含拦截器配置）。
  - 提供类型安全的响应处理。

### 2. DatabaseService (`database_service.dart`)

管理应用的本地关系型数据库，用于存储复杂的数据结构（如购物车）。

- **依赖**: `drift`, `sqlite3`
- **Provider**: `databaseServiceProvider`
- **核心表**:
  - `CartItems`: 存储购物车商品、数量及规格。
- **功能**:
  - 支持数据库版本迁移管理。
  - 提供响应式（Stream）的查询接口。

### 3. LocationService (`location_service.dart`)

处理与地理位置相关的逻辑。

- **依赖**: `geolocator`
- **Provider**: `locationServiceProvider`
- **主要功能**:
  - 获取设备当前经纬度坐标。
  - 计算两个坐标点之间的距离（米）。
  - 自动检查位置服务状态并请求权限。

### 4. PermissionService (`permission_service.dart`)

统一管理应用所需的各项硬件权限。

- **依赖**: `permission_handler`
- **Provider**: `permissionServiceProvider`
- **主要功能**:
  - 检查并请求：相机、相册（Android 13+ 特殊处理）、位置、通知权限。
  - 提供打开系统设置页面的便捷方法。

### 5. StorageService (`storage_service.dart`)

提供简单的键值对（Key-Value）持久化存储。

- **依赖**: `shared_preferences`
- **Provider**: `storageServiceProvider`
- **主要功能**:
  - 泛型读写接口（String, int, bool, double, List<String>）。
  - 异常捕获与日志记录。
  - 清理存储空间。

### 6. ToastService (`toast_service.dart`)

提供全应用统一的 UI 提示组件。

- **依赖**: `toastification`
- **Provider**: `toastServiceProvider`
- **通知类型**:
  - `showSuccess`: 成功（绿色）
  - `showError`: 错误（红色）
  - `showInfo`: 信息（蓝色）
  - `showWarning`: 警告（橙色）
- **特点**: 支持自动关闭、进度条显示、点击关闭、毛玻璃特效等。

## 使用建议

1. **获取服务**: 推荐在 Riverpod 的 Provider 或 `ConsumerWidget` 中通过 `ref.watch` 或 `ref.read` 获取对应服务。
   ```dart
   final apiService = ref.read(apiServiceProvider);
   ```
2. **统一导出**: 外部模块只需导入 `import 'package:lunchbox/core/services/services.dart';` 即可访问所有服务类。
3. **初始化**: 像 `SharedPreferences` 这样的服务通常需要在 `main.dart` 中提前初始化。

## 需求验证

- **需求 4.1-4.4**: 提供四种类型的 Toast 提示 ✅
- **需求 4.5-4.6**: Toast 支持自定义时长、位置和样式 ✅
- **权限管理**: 封装了 Android 13+ 的权限适配逻辑 ✅
- **数据持久化**: 同时支持 SQLite (复杂数据) 和 SharedPreferences (简单配置) ✅
