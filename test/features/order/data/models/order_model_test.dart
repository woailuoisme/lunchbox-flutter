import 'package:flutter_test/flutter_test.dart';
import 'package:lunchbox/features/cart/cart.dart';
import 'package:lunchbox/features/device/device.dart';
import 'package:lunchbox/features/order/entities/order_model.dart';
import 'package:lunchbox/features/product/entities/product_model.dart';

void main() {
  final tProduct = ProductModel(
    id: 'p1',
    name: 'Product 1',
    description: 'Desc',
    price: 10,
    imageUrl: 'url',
    updateTime: DateTime.parse('2023-01-01T12:00:00.000'),
    stock: 10,
  );

  final tCartItem = CartItemModel(
    id: 'ci1',
    productId: 'p1',
    product: tProduct,
    addedTime: DateTime.parse('2023-01-01T12:00:00.000'),
    quantity: 2,
  );

  const tDevice = DeviceModel(
    id: 'd1',
    name: 'Device 1',
    cityId: 'c1',
    status: 'online',
    location: LocationModel(latitude: 0, longitude: 0, address: 'addr'),
    productIds: ['p1'],
    lastUpdated: '2023-01-01T12:00:00.000',
  );

  final tOrderModel = OrderModel(
    id: 'o1',
    userId: 'u1',
    deviceId: 'd1',
    items: [tCartItem],
    totalAmount: 20,
    createdAt: DateTime.parse('2023-01-01T12:00:00.000'),
    device: tDevice,
  );

  group('OrderModel', () {
    test('fromJson should return a valid model', () async {
      // Simulate JSON behavior where nested objects are maps
      final jsonMap = {
        'id': 'o1',
        'user_id': 'u1',
        'device_id': 'd1',
        'items': [tCartItem.toJson()],
        'total_amount': 20.0,
        'created_at': '2023-01-01T12:00:00.000',
        'device': tDevice.toJson(),
        'paid_amount': 0.0,
        'status': 'pending',
        // null fields omitted
      };

      final result = OrderModel.fromJson(jsonMap);
      expect(result, tOrderModel);
    });

    test('toJson should return a JSON map containing proper data', () async {
      final result = tOrderModel.toJson();
      final expectedMap = {
        'id': 'o1',
        'user_id': 'u1',
        'device_id': 'd1',
        'items': [tCartItem.toJson()],
        'total_amount': 20.0,
        'created_at': '2023-01-01T12:00:00.000',
        'device': tDevice.toJson(),
        'paid_amount': 0.0,
        'status': 'pending',
      };
      expect(result, expectedMap);
    });

    test('totalItemsCount should return correct count', () async {
      expect(tOrderModel.totalItemsCount, 2);
    });

    test('canCancel should be true for pending order', () async {
      expect(tOrderModel.canCancel, true);
    });

    test('canCancel should be false for completed order', () async {
      final completedOrder = tOrderModel.copyWith(
        status: OrderStatus.completed,
      );
      expect(completedOrder.canCancel, false);
    });

    test('statusText should return correct Chinese text', () async {
      expect(
        tOrderModel.copyWith(status: OrderStatus.pending).statusText,
        '待支付',
      );
      expect(tOrderModel.copyWith(status: OrderStatus.paid).statusText, '已支付');
      expect(
        tOrderModel.copyWith(status: OrderStatus.completed).statusText,
        '已完成',
      );
      expect(
        tOrderModel.copyWith(status: OrderStatus.cancelled).statusText,
        '已取消',
      );
      expect(
        tOrderModel.copyWith(status: OrderStatus.refunded).statusText,
        '已退款',
      );
      expect(
        tOrderModel.copyWith(status: OrderStatus.failed).statusText,
        '支付失败',
      );
    });
  });
}
