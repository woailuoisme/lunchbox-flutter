---
name: dart-expert
version: 1.0.0
description: 专家级 Dart、Flutter、移动开发及跨平台应用指南
category: languages
tags: [dart, flutter, mobile, cross-platform, widgets]
allowed-tools:
  - Read
  - Write
  - Edit
  - Bash(dart:*, flutter:*)
---

# Dart & Flutter 专家

Dart 编程、Flutter 框架、移动开发及跨平台应用的专家级指南。

## 核心概念

### Dart 语言
- 强类型与类型推断
- Async/await 和 Futures
- Streams (流)
- Mixins (混入) 和 Extensions (扩展)
- 空安全 (Null safety)
- 集合 (Collections)

### Flutter 框架
- Widgets (Stateless & Stateful)
- 状态管理 (Provider, Riverpod, Bloc)
- 导航与路由
- Material 和 Cupertino 设计风格
- 响应式布局
- 平台集成

## Dart 基础

```dart
// 变量与类型
var name = 'John';  // 类型推断
String explicitType = 'Explicit';
final constantValue = 42;  // 运行时常量
const compileConstant = 'Compile-time'; // 编译时常量

// 空安全
String? nullableString;
String nonNullable = 'Never null';

// 延迟初始化
late String lateInit;

// 集合
List<String> names = ['Alice', 'Bob', 'Charlie'];
Map<String, int> ages = {'Alice': 25, 'Bob': 30};
Set<int> uniqueNumbers = {1, 2, 3, 3};  // {1, 2, 3}

// 函数
int add(int a, int b) => a + b;

// 命名参数
void createUser({
  required String name,
  int age = 18,
  String? email,
}) {
  print('Creating user: $name, age: $age');
}

// 类
class User {
  final String id;
  final String name;
  int age;

  User({
    required this.id,
    required this.name,
    this.age = 0,
  });

  // 命名构造函数
  User.guest() : this(id: 'guest', name: 'Guest');

  // 方法
  void celebrateBirthday() {
    age++;
  }

  @override
  String toString() => 'User($name, $age)';
}

// Mixins (混入)
mixin Loggable {
  void log(String message) {
    print('[${DateTime.now()}] $message');
  }
}

class LoggableUser extends User with Loggable {
  LoggableUser({required String id, required String name})
      : super(id: id, name: name);
}

// Extensions (扩展)
extension StringExtensions on String {
  bool get isValidEmail => contains('@') && contains('.');
  String capitalize() => '${this[0].toUpperCase()}${substring(1)}';
}
```

## 异步编程

```dart
import 'dart:async';

// Future
Future<String> fetchUser(String id) async {
  await Future.delayed(Duration(seconds: 1));
  return 'User $id';
}

// 错误处理
Future<User?> fetchUserSafely(String id) async {
  try {
    final user = await fetchUser(id);
    return User(id: id, name: user);
  } catch (e) {
    print('Error: $e');
    return null;
  }
}

// 多个 Futures
Future<void> fetchMultiple() async {
  final results = await Future.wait([
    fetchUser('1'),
    fetchUser('2'),
    fetchUser('3'),
  ]);
  print(results);
}

// Streams (流)
Stream<int> countStream() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

// 监听 Stream
void listenToStream() {
  countStream().listen(
    (data) => print('Received: $data'),
    onError: (error) => print('Error: $error'),
    onDone: () => print('Done'),
  );
}

// Stream 转换
Stream<String> transformedStream() {
  return countStream()
      .where((n) => n % 2 == 0)
      .map((n) => 'Number: $n')
      .take(3);
}

// StreamController
class Counter {
  final _controller = StreamController<int>();

  Stream<int> get stream => _controller.stream;

  void increment(int value) {
    _controller.add(value);
  }

  void dispose() {
    _controller.close();
  }
}
```

## Flutter Widgets

```dart
import 'package:flutter/material.dart';

// Stateless Widget (无状态组件)
class UserCard extends StatelessWidget {
  final User user;

  const UserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(user.name),
        subtitle: Text('Age: ${user.age}'),
        trailing: Icon(Icons.arrow_forward),
      ),
    );
  }
}

// Stateful Widget (有状态组件)
class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Counter: $_counter'),
        ElevatedButton(
          onPressed: _incrementCounter,
          child: Text('Increment'),
        ),
      ],
    );
  }
}

// 布局
class UserListScreen extends StatelessWidget {
  final List<User> users;

  const UserListScreen({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AddUserScreen()),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return UserCard(user: users[index]);
        },
      ),
    );
  }
}
```

## 状态管理 (Provider)

```dart
import 'package:provider/provider.dart';

// State 类
class UserProvider extends ChangeNotifier {
  List<User> _users = [];

  List<User> get users => _users;

  Future<void> fetchUsers() async {
    _users = await api.getUsers();
    notifyListeners();
  }

  void addUser(User user) {
    _users.add(user);
    notifyListeners();
  }

  void removeUser(String id) {
    _users.removeWhere((user) => user.id == id);
    notifyListeners();
  }
}

// 设置 Provider
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MyApp(),
    ),
  );
}

// 使用 Provider
class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return ListView.builder(
      itemCount: userProvider.users.length,
      itemBuilder: (context, index) {
        final user = userProvider.users[index];
        return ListTile(
          title: Text(user.name),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => userProvider.removeUser(user.id),
          ),
        );
      },
    );
  }
}

// Consumer 组件
class UserCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        return Text('Total users: ${userProvider.users.length}');
      },
    );
  }
}
```

## 导航 (Navigation)

```dart
// 基本导航
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => DetailScreen()),
);

// 命名路由
MaterialApp(
  routes: {
    '/': (context) => HomeScreen(),
    '/details': (context) => DetailScreen(),
    '/settings': (context) => SettingsScreen(),
  },
);

Navigator.pushNamed(context, '/details');

// 传递参数
Navigator.pushNamed(
  context,
  '/details',
  arguments: {'userId': '123'},
);

// 获取参数
final args = ModalRoute.of(context)!.settings.arguments as Map;

// 返回数据
final result = await Navigator.push(
  context,
  MaterialPageRoute(builder: (_) => SelectionScreen()),
);

// 带结果返回 (Pop)
Navigator.pop(context, selectedValue);
```

## HTTP 与 API

```dart
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl = 'https://api.example.com';

  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<User> createUser(User user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );

    if (response.statusCode == 201) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create user');
    }
  }
}

// 包含 JSON 序列化的模型
class User {
  final String id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}
```

## 最佳实践

### Dart
- 尽可能使用 const 构造函数
- 充分利用空安全 (Null safety)
- 使用 final 定义不可变值
- 优先使用 async/await 而非 .then()
- 使用 extensions 编写工具方法
- 遵循 Effective Dart 指南

### Flutter
- 保持 Widgets 小而专注
- 使用 const Widgets 进行优化
- 避免重建整个 Widget 树
- 实现正确的状态管理
- 优雅地处理错误
- 彻底测试 Widgets
- 必要时使用 Keys

### 性能
- 长列表使用 ListView.builder
- 实现分页加载
- 缓存网络图片
- 最小化 Widget 重建
- 使用 const 构造函数
- 分析应用性能
- 懒加载资源

## 反模式 (Anti-Patterns)

❌ 巨大的 Widget 树
❌ 在 StatelessWidget 中保存状态
❌ 不销毁控制器 (Controllers)
❌ 忽略空安全
❌ 在 UI 中执行同步 I/O 操作
❌ 无错误处理
❌ 硬编码字符串

## 资源

- Dart: https://dart.dev/
- Flutter: https://flutter.dev/
- Pub.dev: https://pub.dev/
- Flutter Widget Catalog: https://flutter.dev/docs/development/ui/widgets
- Effective Dart: https://dart.dev/guides/language/effective-dart
