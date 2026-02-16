import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database_service.g.dart';

/// 购物车表
class CartItems extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get deviceId => text()(); // 关联的售货机ID
  TextColumn get productId => text()(); // 商品ID
  TextColumn get productData => text()(); // 商品详细信息 (JSON)
  IntColumn get quantity => integer().withDefault(const Constant(1))(); // 数量
  TextColumn get attributes => text().nullable()(); // 规格/加料 (JSON)
  BoolColumn get isSelected =>
      boolean().withDefault(const Constant(true))(); // 是否选中
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

/// 数据库类
@DriftDatabase(tables: [CartItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
      },
      onUpgrade: (m, from, to) async {
        if (from < 2) {
          // 增加 productData 和 isSelected 列
          await m.addColumn(cartItems, cartItems.productData);
          await m.addColumn(cartItems, cartItems.isSelected);
        }
      },
    );
  }
}

/// 打开数据库连接
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    return driftDatabase(
      name: 'db',
      native: const DriftNativeOptions(shareAcrossIsolates: true),
    );
  });
}

/// 数据库服务 Provider
@Riverpod(keepAlive: true)
AppDatabase databaseService(Ref ref) {
  return AppDatabase();
}
