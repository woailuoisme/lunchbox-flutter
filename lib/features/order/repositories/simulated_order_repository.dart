import 'package:fpdart/fpdart.dart';
import 'package:lunchbox/core/errors/errors.dart';
import 'package:lunchbox/features/device/entities/cart_item_model.dart';
import 'package:lunchbox/features/device/entities/device_model.dart';
import 'package:lunchbox/features/device/entities/location_model.dart';
import 'package:lunchbox/features/order/entities/order_model.dart';
import 'package:lunchbox/features/order/repositories/order_repository.dart';
import 'package:lunchbox/features/product/entities/product_model.dart';

class SimulatedOrderRepository implements OrderRepository {
  // 模拟数据
  final List<OrderModel> _mockOrders = [
    OrderModel(
      id: 'PO202511282323468071978422',
      userId: 'user1',
      deviceId: '5',
      items: [
        CartItemModel(
          id: 'item1',
          productId: 'p_soup',
          product: ProductModel(
            id: 'p_soup',
            name: '土猪大骨菜干汤',
            description: '美味',
            price: 6.99,
            imageUrl: 'https://picsum.photos/seed/soup/200',
            updateTime: DateTime.now(),
            specifications: '默认规格',
          ),
          addedTime: DateTime.parse('2025-11-28 23:23:46'),
          quantity: 1,
        ),
      ],
      totalAmount: 6.99,
      createdAt: DateTime.parse('2025-11-28 23:23:46'),
      status: OrderStatus.cancelled,
      cancelledAt: DateTime.parse('2025-11-28 23:25:00'),
    ),
    OrderModel(
      id: 'PO20251128232321597498857400',
      userId: 'user1',
      deviceId: '5',
      items: [
        CartItemModel(
          id: 'item2',
          productId: 'p_rice',
          product: ProductModel(
            id: 'p_rice',
            name: '客家食神卤老鹅饭',
            description: '美味',
            price: 21.69,
            imageUrl: 'https://picsum.photos/seed/rice/200',
            updateTime: DateTime.now(),
            specifications: '默认规格',
          ),
          addedTime: DateTime.parse('2025-11-28 23:21:59'),
          quantity: 1,
        ),
      ],
      totalAmount: 21.69,
      createdAt: DateTime.parse('2025-11-28 23:21:59'),
      status: OrderStatus.paid,
      paidAt: DateTime.parse('2025-11-28 23:22:00'),
      paymentMethod: PaymentMethod.wechatPay,
      pickupCode: '123456',
      pickupHint: '请前往1号柜取餐',
      storeName: '深圳南山科技园店',
      storeAddress: '深圳市南山区科技园南路1号',
      storePhone: '0755-12345678',
      qrCodeData: 'ORDER:PO20251128232321597498857400',
      remark: '订单将于今晚10点30分过期',
      device: const DeviceModel(
        id: '5',
        name: '5号机',
        cityId: 'sz',
        status: 'online',
        location: LocationModel(latitude: 0, longitude: 0, address: '深圳市南山区'),
        productIds: [],
        lastUpdated: '2023-10-01T12:00:00Z',
      ),
    ),
    OrderModel(
      id: 'PO202511201813314265742922',
      userId: 'user1',
      deviceId: '5',
      items: [
        CartItemModel(
          id: 'item3',
          productId: 'p_duck',
          product: ProductModel(
            id: 'p_duck',
            name: '客家食神卤老鸭饭',
            description: '美味',
            price: 15.00,
            imageUrl: 'https://picsum.photos/seed/duck/200',
            updateTime: DateTime.now(),
            specifications: '默认规格',
          ),
          addedTime: DateTime.parse('2025-11-20 18:13:31'),
          quantity: 1,
        ),
      ],
      totalAmount: 15.00,
      createdAt: DateTime.parse('2025-11-20 18:13:31'),
      status: OrderStatus.paid,
      paidAt: DateTime.parse('2025-11-20 18:14:00'),
      paymentMethod: PaymentMethod.alipay,
      pickupCode: '654321',
      remark: '订单将于今晚10点30分过期',
    ),
  ];

  @override
  TaskEither<Failure, OrderModel> createOrder({
    required String deviceId,
    required List<CartItemModel> cartItems,
    required String paymentMethod,
    String? remark,
  }) {
    // 模拟创建订单
    final newOrder = OrderModel(
      id: 'PO${DateTime.now().millisecondsSinceEpoch}',
      userId: 'user1',
      deviceId: deviceId,
      items: cartItems,
      totalAmount: cartItems.fold(0, (sum, item) => sum + item.totalPrice),
      createdAt: DateTime.now(),
      status: OrderStatus.paid,
      // 模拟直接支付成功
      paidAt: DateTime.now(),
      paymentMethod: PaymentMethod.values.firstWhere(
        (e) => e.name == paymentMethod,
        orElse: () => PaymentMethod.wechatPay,
      ),
      pickupCode: '${DateTime.now().millisecond}',
      pickupHint: '请前往1号柜取餐',
      qrCodeData: 'ORDER:PO${DateTime.now().millisecondsSinceEpoch}',
      storeName: '深圳南山科技园店',
      storeAddress: '深圳市南山区科技园南路1号',
      remark: remark ?? '订单将于今晚10点30分过期',
    );
    _mockOrders.insert(0, newOrder);
    return TaskEither.right(newOrder);
  }

  @override
  TaskEither<Failure, List<OrderModel>> getUserOrders({
    int page = 1,
    int pageSize = 10,
    String? status,
  }) {
    // 模拟分页和筛选
    var filtered = _mockOrders;
    if (status != null &&
        status != '全部订单' &&
        status != 'all' &&
        status != 'pending' &&
        status != 'paid' &&
        status != 'completed' &&
        status != 'cancelled') {
      // 兼容旧的中文状态传参 (虽然现在 filterValues 是英文)
      if (status == '待支付') {
        filtered = filtered
            .where((o) => o.status == OrderStatus.pending)
            .toList();
      } else if (status == '已支付') {
        filtered = filtered.where((o) => o.status == OrderStatus.paid).toList();
      } else if (status == '已取消' || status == '退款') {
        filtered = filtered
            .where(
              (o) =>
                  o.status == OrderStatus.cancelled ||
                  o.status == OrderStatus.refunded,
            )
            .toList();
      } else if (status == '已完成' || status == '已使用') {
        filtered = filtered
            .where((o) => o.status == OrderStatus.completed)
            .toList();
      }
    } else if (status != null && status != 'all') {
      // 英文状态匹配
      filtered = filtered.where((o) => o.status.name == status).toList();
    }

    // 分页处理
    final startIndex = (page - 1) * pageSize;
    if (startIndex >= filtered.length) {
      return TaskEither.right([]);
    }

    final endIndex = startIndex + pageSize;
    final pagedOrders = filtered.sublist(
      startIndex,
      endIndex > filtered.length ? filtered.length : endIndex,
    );

    return TaskEither.right(pagedOrders);
  }

  @override
  TaskEither<Failure, OrderModel> getOrderById(String orderId) {
    final order = _mockOrders.firstWhere(
      (o) => o.id == orderId,
      orElse: () => _mockOrders.first, // Fallback for demo
    );
    return TaskEither.right(order);
  }

  @override
  TaskEither<Failure, bool> cancelOrder(String orderId) {
    final index = _mockOrders.indexWhere((o) => o.id == orderId);
    if (index != -1) {
      _mockOrders[index] = _mockOrders[index].copyWith(
        status: OrderStatus.cancelled,
        cancelledAt: DateTime.now(),
      );
      return TaskEither.right(true);
    }
    return TaskEither.left(const Failure.notFound(resource: 'Order'));
  }

  @override
  TaskEither<Failure, Map<String, dynamic>> payOrder(
    String orderId,
    String paymentMethod,
  ) {
    final index = _mockOrders.indexWhere((o) => o.id == orderId);
    if (index != -1) {
      _mockOrders[index] = _mockOrders[index].copyWith(
        status: OrderStatus.paid,
        paidAt: DateTime.now(),
        paymentMethod: PaymentMethod.values.firstWhere(
          (e) => e.name == paymentMethod,
          orElse: () => PaymentMethod.wechatPay,
        ),
      );
      return TaskEither.right({'status': 'success', 'orderId': orderId});
    }
    return TaskEither.left(const Failure.notFound(resource: 'Order'));
  }

  @override
  TaskEither<Failure, String> checkPaymentStatus(
    String orderId,
    String paymentId,
  ) {
    final index = _mockOrders.indexWhere((o) => o.id == orderId);
    if (index != -1) {
      return TaskEither.right(_mockOrders[index].status.name);
    }
    return TaskEither.left(const Failure.notFound(resource: 'Order'));
  }

  @override
  TaskEither<Failure, OrderModel> reorder(String orderId) {
    final index = _mockOrders.indexWhere((o) => o.id == orderId);
    if (index != -1) {
      return TaskEither.right(_mockOrders[index]);
    }
    return TaskEither.left(const Failure.notFound(resource: 'Order'));
  }

  @override
  TaskEither<Failure, Map<String, dynamic>> getDeviceOrderStatistics(
    String deviceId,
  ) {
    return TaskEither.right({'total': _mockOrders.length});
  }
}
