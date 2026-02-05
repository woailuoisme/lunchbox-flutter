# Riverpod State Management

## Provider Types (Riverpod 3.0+)

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

// Simple state (Generated)
@riverpod
String helloWorld(Ref ref) {
  return 'Hello world';
}

// Async state (API calls)
@riverpod
Future<List<User>> users(Ref ref) async {
  final api = ref.read(apiProvider);
  return api.getUsers();
}

// Stream state (real-time)
@riverpod
Stream<List<Message>> messages(Ref ref) {
  return ref.read(chatServiceProvider).messagesStream;
}
```

## Notifier Pattern (Riverpod 2.0/3.0)

```dart
@riverpod
class TodoList extends _$TodoList {
  @override
  List<Todo> build() => [];

  void add(Todo todo) {
    state = [...state, todo];
  }

  void toggle(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(completed: !todo.completed) else todo,
    ];
  }

  void remove(String id) {
    state = state.where((t) => t.id != id).toList();
  }
}

// Async Notifier
@riverpod
class UserProfile extends _$UserProfile {
  @override
  Future<User> build() async {
    return ref.read(apiProvider).getCurrentUser();
  }

  Future<void> updateName(String name) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final updated = await ref.read(apiProvider).updateUser(name: name);
      return updated;
    });
  }
}
```

## Usage in Widgets

```dart
// ConsumerWidget (recommended)
class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the generated provider
    final todos = ref.watch(todoListProvider);

    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return ListTile(
          title: Text(todo.title),
          leading: Checkbox(
            value: todo.completed,
            onChanged: (_) => ref.read(todoListProvider.notifier).toggle(todo.id),
          ),
        );
      },
    );
  }
}

// Selective rebuilds with select
class UserAvatar extends ConsumerWidget {
  const UserAvatar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Only rebuild if avatarUrl changes
    final avatarUrl = ref.watch(userProvider.select((u) => u?.avatarUrl));

    return CircleAvatar(
      backgroundImage: avatarUrl != null ? NetworkImage(avatarUrl) : null,
    );
  }
}

// Async state handling
class UserProfileScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userProfileProvider);

    return userAsync.when(
      data: (user) => Text(user.name),
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text('Error: $err'),
    );
  }
}
```

## Quick Reference

| Provider | Use Case |
|----------|----------|
| `@riverpod` (Func) | Computed/derived values, Async operations (Future/Stream) |
| `@riverpod` (Class) | Mutable state, Complex logic, Async mutations |
| `Ref` | Access other providers |
| `WidgetRef` | Access providers in widgets |

*Note: In Riverpod 3.0+, generator usage (@riverpod) is the default recommended approach.*
