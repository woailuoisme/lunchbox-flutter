/// 应用路由常量
///
/// 定义所有应用路由路径，使用 lowerCamelCase 命名约定
class AppRoutes {
  // 私有构造函数，防止实例化
  AppRoutes._();

  // 启动相关
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';

  // 认证相关
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';

  // 主页面
  static const String home = '/home';
  static const String eat = '/eat';

  // 首页功能入口
  static const String teamOrdering = '/team-ordering';
  static const String community = '/community';
  static const String coupons = '/coupons';
  static const String invite = '/invite';
  static const String inviteRules = 'rules'; // 子路由路径，完整为 /invite/rules
  static const String lottery = '/lottery';
  static const String myPrizes = 'prizes'; // 子路由路径，完整为 /lottery/prizes

  // 城市选择
  static const String citySelection = '/city-selection';

  // 设备相关
  static const String deviceList = '/devices';
  static const String deviceDetail = '/device'; // 实际路径为 /device/:id

  // 产品相关
  static const String productList = '/products';
  static const String productDetail = '/product'; // 实际路径为 /product/:id

  // 购物车
  static const String cart = '/cart';

  // 订单相关
  static const String orderConfirm = '/order-confirm';
  static const String orderList = '/orders';
  static const String orderDetail = '/order'; // 实际路径为 /order/:id

  // 支付
  static const String payment = '/payment';

  // 用户中心
  static const String profile = '/profile';
  static const String profileEdit = '/profile-edit';
  static const String favoriteDevices = '/favorite-devices';
  static const String wallet = '/wallet';
  static const String myPoints = '/my-points';
  static const String pointsMall = '/points-mall';
  static const String feedback = '/feedback';
  static const String partner = '/partner';
  static const String aboutUs = '/about-us';

  // 帮助
  static const String help = '/help';

  // 设置
  static const String settings = '/settings';
  static const String about = '/about';
  static const String deviceInfo = '/device-info';
}
