import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/models/user_model.dart';
import '../../features/cart/entities/cart_item_model.dart';
import '../../features/city/entities/city_model.dart';
import '../../features/device/entities/device_model.dart';
import '../../features/order/entities/order_model.dart';
import '../../features/product/entities/product_model.dart';
import '../models/api_response_model.dart';

part 'mock_provider.g.dart';

@Riverpod(keepAlive: true)
MockProvider mockProvider(Ref ref) {
  return MockProvider();
}

/// Mock数据提供者
/// 用于在开发环境或网络不可用时提供模拟数据
class MockProvider {
  /// 获取城市列表
  Future<ApiResponseModel<List<CityModel>>> getCities() async {
    // 模拟网络延迟
    await Future<void>.delayed(const Duration(milliseconds: 300));

    final cities = [
      const CityModel(
        id: '1',
        name: '北京',
        pinyin: 'beijing',
        initial: 'B',
        isHot: true,
        longitude: 116.3974,
        latitude: 39.9093,
        code: '110100',
      ),
      const CityModel(
        id: '2',
        name: '上海',
        pinyin: 'shanghai',
        initial: 'S',
        isHot: true,
        longitude: 121.4737,
        latitude: 31.2304,
        code: '310100',
      ),
      const CityModel(
        id: '3',
        name: '广州',
        pinyin: 'guangzhou',
        initial: 'G',
        isHot: true,
        longitude: 113.2644,
        latitude: 23.1291,
        code: '440100',
      ),
      const CityModel(
        id: '4',
        name: '深圳',
        pinyin: 'shenzhen',
        initial: 'S',
        isHot: true,
        longitude: 114.0579,
        latitude: 22.5431,
        code: '440300',
      ),
      const CityModel(
        id: '5',
        name: '杭州',
        pinyin: 'hangzhou',
        initial: 'H',
        isHot: true,
        longitude: 120.1551,
        latitude: 30.2741,
        code: '330100',
      ),
    ];

    return ApiResponseModel.success(cities);
  }

  /// 获取设备列表
  Future<ApiResponseModel<List<DeviceModel>>> getDevices({
    String? cityId,
    double? latitude,
    double? longitude,
  }) async {
    // 模拟网络延迟
    await Future<void>.delayed(const Duration(milliseconds: 500));

    // 生成模拟设备数据
    final devices = List.generate(10, (index) {
      final random = Random(index);
      final baseLat = latitude ?? 39.9093;
      final baseLng = longitude ?? 116.3974;

      // 生成附近设备的随机位置
      final lat = baseLat + (random.nextDouble() - 0.5) * 0.01;
      final lng = baseLng + (random.nextDouble() - 0.5) * 0.01;

      // 计算距离（米）
      final distance = random.nextInt(5000).toDouble();

      return DeviceModel(
        id: 'device_${index + 1}',
        name: '自动售货机${index + 1}',
        cityId: cityId ?? '1',
        address: '测试地址${index + 1}',
        longitude: lng,
        latitude: lat,
        status: random.nextBool() ? 'online' : 'offline',
        distance: distance,
        supportCashPayment: random.nextBool(),
        lastOnlineTime: DateTime.now().subtract(
          Duration(minutes: random.nextInt(60)),
        ),
        updateTime: DateTime.now(),
      );
    });

    // 按距离排序
    devices.sort((a, b) => (a.distance ?? 0).compareTo(b.distance ?? 0));

    return ApiResponseModel.success(devices);
  }

  /// 获取设备详情
  Future<ApiResponseModel<DeviceModel>> getDeviceDetail(String deviceId) async {
    return getDeviceById(deviceId);
  }

  /// 根据ID获取设备
  Future<ApiResponseModel<DeviceModel>> getDeviceById(String deviceId) async {
    // 模拟网络延迟
    await Future<void>.delayed(const Duration(milliseconds: 300));

    // 生成包含产品的设备详情
    final random = Random(int.parse(deviceId.split('_').last));
    final products = generateMockProducts(random.nextInt(15) + 10);

    final device = DeviceModel(
      id: deviceId,
      name: '自动售货机${deviceId.split('_').last}',
      cityId: '1',
      address: '测试详细地址${deviceId.split('_').last}',
      longitude: 116.3974 + (random.nextDouble() - 0.5) * 0.01,
      latitude: 39.9093 + (random.nextDouble() - 0.5) * 0.01,
      status: random.nextBool() ? 'online' : 'offline',
      distance: random.nextInt(5000).toDouble(),
      products: products,
      supportCashPayment: random.nextBool(),
      lastOnlineTime: DateTime.now().subtract(
        Duration(minutes: random.nextInt(60)),
      ),
      updateTime: DateTime.now(),
    );

    return ApiResponseModel.success(device);
  }

  /// 生成模拟产品数据
  List<ProductModel> generateMockProducts(int count) {
    final productNames = [
      '红烧牛肉面',
      '宫保鸡丁饭',
      '鱼香肉丝饭',
      '糖醋排骨饭',
      '梅菜扣肉饭',
      '黑椒牛排饭',
      '咖喱鸡肉饭',
      '香菇滑鸡饭',
      '西红柿鸡蛋面',
      '炸酱面',
      '海鲜炒饭',
      '扬州炒饭',
      '蔬菜沙拉',
      '水果沙拉',
      '矿泉水',
      '可乐',
      '雪碧',
      '橙汁',
      '酸奶',
      '面包',
      '蛋糕',
      '三明治',
    ];

    final categories = ['food', 'drink', 'snack'];
    final random = Random();

    return List.generate(min(count, productNames.length), (index) {
      final price = (10 + random.nextDouble() * 30).roundToDouble();
      final hasDiscount = random.nextBool();

      return ProductModel(
        id: 'product_${index + 1}',
        name: productNames[index],
        description: '这是一份美味的${productNames[index]}，新鲜制作，营养丰富。',
        price: price,
        originalPrice: hasDiscount ? price * 1.2 : null,
        imageUrl: 'https://via.placeholder.com/150',
        stock: random.nextInt(50) + 10,
        category: categories[random.nextInt(categories.length)],
        isAvailable: random.nextDouble() > 0.1, // 90%的概率在售
        isHot: random.nextDouble() < 0.3, // 30%的概率是热门商品
        isPromotion: hasDiscount,
        specifications: '标准规格',
        updateTime: DateTime.now(),
      );
    });
  }

  /// 根据设备ID获取产品列表
  Future<ApiResponseModel<List<ProductModel>>> getProductsByDeviceId(
    String deviceId,
  ) async {
    // 模拟网络延迟
    await Future<void>.delayed(const Duration(milliseconds: 500));

    // 模拟产品列表，包含更多不同类型和特性的产品
    final List<ProductModel> products = [
      // 食品类别
      ProductModel(
        id: '${deviceId}_food_001',
        name: '午餐盒套餐A',
        description: '包含米饭、炒菜和汤的营养午餐',
        price: 15.50,
        originalPrice: 18,
        imageUrl: 'https://picsum.photos/seed/${deviceId}_food001/300/300',
        stock: 25,
        isHot: true,
        isPromotion: true,
        specifications: '500g/份',
        updateTime: DateTime.now().subtract(const Duration(days: 1)),
      ),
      ProductModel(
        id: '${deviceId}_food_002',
        name: '早餐三明治',
        description: '新鲜制作的火腿三明治，配生菜和酱料',
        price: 8,
        imageUrl: 'https://picsum.photos/seed/${deviceId}_food002/300/300',
        stock: 15,
        isHot: true,
        specifications: '150g/个',
        updateTime: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      ProductModel(
        id: '${deviceId}_food_003',
        name: '沙拉拼盘',
        description: '新鲜蔬菜沙拉，配特制酱汁',
        price: 12,
        imageUrl: 'https://picsum.photos/seed/${deviceId}_food003/300/300',
        stock: 10,
        specifications: '300g/份',
        updateTime: DateTime.now().subtract(const Duration(hours: 5)),
      ),

      // 饮料类别
      ProductModel(
        id: '${deviceId}_drink_001',
        name: '矿泉水',
        description: '500ml瓶装天然矿泉水',
        price: 2,
        imageUrl: 'https://picsum.photos/seed/${deviceId}_drink001/300/300',
        stock: 50,
        category: 'drink',
        isHot: true,
        specifications: '500ml/瓶',
        updateTime: DateTime.now().subtract(const Duration(days: 3)),
      ),
      ProductModel(
        id: '${deviceId}_drink_002',
        name: '可乐',
        description: '330ml罐装可乐',
        price: 3.50,
        originalPrice: 4,
        imageUrl: 'https://picsum.photos/seed/${deviceId}_drink002/300/300',
        stock: 30,
        category: 'drink',
        isHot: true,
        isPromotion: true,
        specifications: '330ml/罐',
        updateTime: DateTime.now().subtract(const Duration(days: 2)),
      ),
      ProductModel(
        id: '${deviceId}_drink_003',
        name: '果汁',
        description: '100%纯果汁，无添加',
        price: 6,
        imageUrl: 'https://picsum.photos/seed/${deviceId}_drink003/300/300',
        stock: 15,
        category: 'drink',
        specifications: '250ml/盒',
        updateTime: DateTime.now().subtract(const Duration(hours: 8)),
      ),
      ProductModel(
        id: '${deviceId}_drink_004',
        name: '咖啡',
        description: '即溶咖啡，提神醒脑',
        price: 5,
        imageUrl: 'https://picsum.photos/seed/${deviceId}_drink004/300/300',
        category: 'drink',
        isAvailable: false,
        isHot: true,
        specifications: '120ml/杯',
        updateTime: DateTime.now().subtract(const Duration(days: 1)),
      ),

      // 零食类别
      ProductModel(
        id: '${deviceId}_snack_001',
        name: '巧克力棒',
        description: '进口巧克力能量棒',
        price: 4.50,
        originalPrice: 6,
        imageUrl: 'https://picsum.photos/seed/${deviceId}_snack001/300/300',
        stock: 40,
        category: 'snack',
        isHot: true,
        isPromotion: true,
        specifications: '45g/条',
        updateTime: DateTime.now().subtract(const Duration(days: 5)),
      ),
      ProductModel(
        id: '${deviceId}_snack_002',
        name: '薯片',
        description: '经典口味薯片',
        price: 3,
        imageUrl: 'https://picsum.photos/seed/${deviceId}_snack002/300/300',
        stock: 35,
        category: 'snack',
        isHot: true,
        specifications: '60g/袋',
        updateTime: DateTime.now().subtract(const Duration(days: 4)),
      ),
      ProductModel(
        id: '${deviceId}_snack_003',
        name: '饼干礼盒',
        description: '精选饼干礼盒装',
        price: 25,
        originalPrice: 30,
        imageUrl: 'https://picsum.photos/seed/${deviceId}_snack003/300/300',
        stock: 8,
        category: 'snack',
        isPromotion: true,
        specifications: '300g/盒',
        updateTime: DateTime.now().subtract(const Duration(days: 2)),
      ),

      // 甜点类别
      ProductModel(
        id: '${deviceId}_dessert_001',
        name: '蛋糕卷',
        description: '奶油蛋糕卷，新鲜制作',
        price: 12,
        imageUrl: 'https://picsum.photos/seed/${deviceId}_dessert001/300/300',
        stock: 12,
        category: 'dessert',
        isHot: true,
        specifications: '150g/份',
        updateTime: DateTime.now().subtract(const Duration(hours: 3)),
      ),
      ProductModel(
        id: '${deviceId}_dessert_002',
        name: '冰淇淋',
        description: '香草味冰淇淋',
        price: 8,
        imageUrl: 'https://picsum.photos/seed/${deviceId}_dessert002/300/300',
        stock: 10,
        category: 'dessert',
        isHot: true,
        specifications: '120ml/盒',
        updateTime: DateTime.now().subtract(const Duration(hours: 1)),
      ),

      // 健康食品类别
      ProductModel(
        id: '${deviceId}_health_001',
        name: '坚果混合包',
        description: '混合坚果，营养丰富',
        price: 18,
        imageUrl: 'https://picsum.photos/seed/${deviceId}_health001/300/300',
        stock: 15,
        category: 'health',
        specifications: '100g/袋',
        updateTime: DateTime.now().subtract(const Duration(days: 7)),
      ),
      ProductModel(
        id: '${deviceId}_health_002',
        name: '蛋白质棒',
        description: '高蛋白质能量棒',
        price: 22,
        originalPrice: 28,
        imageUrl: 'https://picsum.photos/seed/${deviceId}_health002/300/300',
        stock: 20,
        category: 'health',
        isPromotion: true,
        specifications: '60g/条',
        updateTime: DateTime.now().subtract(const Duration(days: 6)),
      ),
    ];

    return ApiResponseModel.success(products);
  }

  /// 根据产品ID获取产品详情
  Future<ApiResponseModel<ProductModel>> getProductById(
    String productId,
  ) async {
    // 模拟网络延迟
    await Future<void>.delayed(const Duration(milliseconds: 300));

    // 生成模拟产品详情
    final product = ProductModel(
      id: productId,
      name: '产品详情 $productId',
      description:
          '这是一个产品的详细描述，包含了产品的所有重要信息。该产品由优质材料制成，适合各种场景使用。详细参数和使用说明请参考产品包装。',
      price: 19.99,
      originalPrice: 25.99,
      imageUrl: 'https://picsum.photos/seed/$productId/600/600',
      stock: 42,
      isHot: true,
      isPromotion: true,
      specifications: '规格：标准型\n重量：200g\n保质期：6个月\n储存方式：常温避光',
      updateTime: DateTime.now().subtract(const Duration(days: 2)),
    );

    return ApiResponseModel.success(product);
  }

  /// 获取订单列表
  Future<ApiResponseModel<List<OrderModel>>> getOrders(String userId) async {
    // 模拟网络延迟
    await Future<void>.delayed(const Duration(milliseconds: 400));

    final orders = List.generate(5, (index) {
      final random = Random(index);
      final statusIndex = random.nextInt(4);
      final statuses = [
        OrderStatus.pending,
        OrderStatus.paid,
        OrderStatus.completed,
        OrderStatus.cancelled,
      ];

      final products = generateMockProducts(random.nextInt(3) + 1);
      final items = products
          .map(
            (product) => CartItemModel(
              id: 'cart_${index}_${product.id}',
              productId: product.id,
              product: product,
              deviceId: 'device_1',
              quantity: random.nextInt(3) + 1,
              addedTime: DateTime.now().subtract(Duration(days: index)),
            ),
          )
          .toList();

      final totalAmount = items.fold<double>(
        0,
        (sum, item) => sum + item.totalPrice,
      );

      return OrderModel(
        id: 'order_${index + 1}',
        userId: userId,
        deviceId: 'device_${random.nextInt(5) + 1}',
        items: items,
        totalAmount: totalAmount,
        paidAmount: statusIndex >= 1 ? totalAmount : 0,
        status: statuses[statusIndex],
        paymentMethod: statusIndex >= 1
            ? [PaymentMethod.wechatPay, PaymentMethod.alipay][random.nextInt(2)]
            : null,
        createdAt: DateTime.now().subtract(Duration(days: index)),
        paidAt: statusIndex >= 1
            ? DateTime.now().subtract(Duration(days: index, hours: 1))
            : null,
        completedAt: statusIndex == 2
            ? DateTime.now().subtract(Duration(days: index, hours: 2))
            : null,
        cancelledAt: statusIndex == 3
            ? DateTime.now().subtract(Duration(days: index, hours: 3))
            : null,
        pickupCode: statusIndex >= 1 ? '${random.nextInt(9000) + 1000}' : null,
      );
    });

    return ApiResponseModel.success(orders);
  }

  /// 获取用户信息
  Future<ApiResponseModel<UserModel>> getUserInfo(String userId) async {
    // 模拟网络延迟
    await Future<void>.delayed(const Duration(milliseconds: 300));

    final user = UserModel(
      id: userId,
      username: '13800138000',
      nickname: '测试用户',
      avatar: 'https://via.placeholder.com/150',
      gender: 'male',
      birthday: DateTime(1990),
      registeredAt: DateTime.now().subtract(const Duration(days: 100)),
      lastLoginAt: DateTime.now(),
      points: 1280,
      memberLevel: 'gold',
      isVerified: true,
      favoriteDevices: ['device_1', 'device_2', 'device_3'],
    );

    return ApiResponseModel.success(user);
  }

  /// 创建订单
  Future<ApiResponseModel<OrderModel>> createOrder(
    String userId,
    String deviceId,
    List<Map<String, dynamic>> cartItems,
    PaymentMethod paymentMethod,
  ) async {
    // 模拟网络延迟
    await Future<void>.delayed(const Duration(milliseconds: 800));

    // 模拟订单创建
    final random = Random();
    final products = generateMockProducts(cartItems.length);
    final items = cartItems.asMap().entries.map((entry) {
      final itemData = entry.value;
      final product = products[entry.key];
      return CartItemModel(
        id: 'cart_${random.nextInt(1000)}',
        productId: product.id,
        product: product,
        deviceId: deviceId,
        quantity: itemData['quantity'] as int,
        addedTime: DateTime.now(),
      );
    }).toList();

    final totalAmount = items.fold(0.0, (sum, item) => sum + item.totalPrice);

    final order = OrderModel(
      id: 'order_${DateTime.now().millisecondsSinceEpoch}',
      userId: userId,
      deviceId: deviceId,
      items: items,
      totalAmount: totalAmount,
      paidAmount: totalAmount,
      status: OrderStatus.paid,
      paymentMethod: paymentMethod,
      createdAt: DateTime.now(),
      paidAt: DateTime.now(),
      pickupCode: '${random.nextInt(9000) + 1000}',
    );

    return ApiResponseModel.success(order);
  }

  /// 用户登录
  Future<ApiResponseModel<Map<String, dynamic>>> login(
    Map<String, dynamic> data,
  ) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    final user = await getUserInfo('user_1');
    return ApiResponseModel.success({
      'user': user.data!.toJson(),
      'token': 'mock_token_${DateTime.now().millisecondsSinceEpoch}',
    });
  }

  /// 用户注册
  Future<ApiResponseModel<UserModel>> register(
    Map<String, dynamic> data,
  ) async {
    await Future<void>.delayed(const Duration(milliseconds: 800));
    return getUserInfo('user_1');
  }

  /// 获取用户订单列表
  Future<ApiResponseModel<List<OrderModel>>> getUserOrders(
    Map<String, dynamic> params,
  ) async {
    return getOrders('user_1');
  }

  /// 根据ID获取订单
  Future<ApiResponseModel<OrderModel>> getOrderById(String orderId) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    final orders = await getOrders('user_1');
    final order = orders.data!.firstWhere(
      (o) => o.id == orderId,
      orElse: () => orders.data!.first,
    );
    return ApiResponseModel.success(order);
  }
}
