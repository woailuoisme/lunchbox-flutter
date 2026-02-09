import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database_service.g.dart';

/// 购物车表
class CartItems extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get deviceId => text()(); // 关联的售货机ID
  TextColumn get productId => text()(); // 商品ID
  IntColumn get quantity => integer().withDefault(const Constant(1))(); // 数量
  TextColumn get attributes => text().nullable()(); // 规格/加料 (JSON)
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

/// 数据库类
@DriftDatabase(tables: [CartItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

/// 打开数据库连接
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

/// 数据库服务 Provider
@Riverpod(keepAlive: true)
AppDatabase databaseService(Ref ref) {
  return AppDatabase();
}
