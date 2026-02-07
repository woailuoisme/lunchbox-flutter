///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsZhCn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
  /// Returns the current translations of the given [context].
  ///
  /// Usage:
  /// final t = Translations.of(context);
  static Translations of(BuildContext context) =>
      InheritedLocaleData
          .of<AppLocale, Translations>(context)
          .translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
  Translations({Map<String,
      Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<
      AppLocale,
      Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.zhCn,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
      ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh-CN>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
  dynamic operator [](String key) => $meta.getTranslation(key);

  late final Translations _root = this; // ignore: unused_field

  Translations $copyWith(
      {TranslationMetadata<AppLocale, Translations>? meta}) =>
      Translations(meta: meta ?? this.$meta);

	// Translations
  late final TranslationsCommonZhCn common = TranslationsCommonZhCn.internal(
      _root);
  late final TranslationsAuthZhCn auth = TranslationsAuthZhCn.internal(_root);
  late final TranslationsHomeZhCn home = TranslationsHomeZhCn.internal(_root);
  late final TranslationsProductZhCn product = TranslationsProductZhCn.internal(
      _root);
  late final TranslationsCartZhCn cart = TranslationsCartZhCn.internal(_root);
  late final TranslationsOrderZhCn order = TranslationsOrderZhCn.internal(
      _root);
  late final TranslationsPaymentZhCn payment = TranslationsPaymentZhCn.internal(
      _root);
  late final TranslationsSplashZhCn splash = TranslationsSplashZhCn.internal(
      _root);
  late final TranslationsProfileZhCn profile = TranslationsProfileZhCn.internal(
      _root);
  late final TranslationsTimeZhCn time = TranslationsTimeZhCn.internal(_root);
  late final TranslationsSettingsZhCn settings = TranslationsSettingsZhCn
      .internal(_root);
  late final TranslationsDeviceInfoZhCn device_info = TranslationsDeviceInfoZhCn
      .internal(_root);
  late final TranslationsHelpZhCn help = TranslationsHelpZhCn.internal(_root);
  late final TranslationsOnboardingZhCn onboarding = TranslationsOnboardingZhCn
      .internal(_root);
  late final TranslationsCityZhCn city = TranslationsCityZhCn.internal(_root);
  late final TranslationsDeviceZhCn device = TranslationsDeviceZhCn.internal(
      _root);
}

// Path: common
class TranslationsCommonZhCn {
  TranslationsCommonZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

	// Translations

  /// zh-CN: '登录'
  String get login => '登录';

  /// zh-CN: '注册'
  String get register => '注册';

  /// zh-CN: '用户名'
  String get username => '用户名';

  /// zh-CN: '密码'
  String get password => '密码';

  /// zh-CN: '确认'
  String get confirm => '确认';

  /// zh-CN: '取消'
  String get cancel => '取消';

  /// zh-CN: '错误'
  String get error => '错误';

  /// zh-CN: '成功'
  String get success => '成功';

  /// zh-CN: '加载中...'
  String get loading => '加载中...';

  /// zh-CN: '确定'
  String get ok => '确定';

  /// zh-CN: '保存'
  String get save => '保存';

  /// zh-CN: '删除'
  String get delete => '删除';

  /// zh-CN: '编辑'
  String get edit => '编辑';

  /// zh-CN: '搜索'
  String get search => '搜索';

  /// zh-CN: '暂无数据'
  String get noData => '暂无数据';

  /// zh-CN: '重试'
  String get retry => '重试';

  /// zh-CN: '跳过'
  String get skip => '跳过';

  /// zh-CN: '刷新'
  String get refresh => '刷新';

  /// zh-CN: '加载失败'
  String get loadFailed => '加载失败';

  /// zh-CN: '未知错误'
  String get unknownError => '未知错误';

  /// zh-CN: '页面正在开发中'
  String get developing => '页面正在开发中';

  /// zh-CN: '饭盒售货机'
  String get appName => '饭盒售货机';

  /// zh-CN: '退出'
  String get logout => '退出';
}

// Path: auth
class TranslationsAuthZhCn {
  TranslationsAuthZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '欢迎回来'
  String get loginTitle => '欢迎回来';

  /// zh-CN: '登录'
  String get loginButton => '登录';

  /// zh-CN: '注册'
  String get registerButton => '注册';

  /// zh-CN: '忘记密码？'
  String get forgotPassword => '忘记密码？';

  /// zh-CN: '登录失败'
  String get loginFailed => '登录失败';

  /// zh-CN: '登录成功'
  String get loginSuccess => '登录成功';

  /// zh-CN: '创建账号'
  String get registerTitle => '创建账号';

  /// zh-CN: '昵称'
  String get nickname => '昵称';

  /// zh-CN: '注册成功'
  String get registerSuccess => '注册成功';

  /// zh-CN: '注册失败'
  String get registerFailed => '注册失败';

  /// zh-CN: '重置密码'
  String get forgotPasswordTitle => '重置密码';

  /// zh-CN: '发送重置链接'
  String get sendResetLink => '发送重置链接';

  /// zh-CN: '重置链接已发送'
  String get resetLinkSent => '重置链接已发送';

  /// zh-CN: '必填'
  String get required => '必填';

  /// zh-CN: '请输入用户名'
  String get enterUsername => '请输入用户名';

  /// zh-CN: '请输入密码'
  String get enterPassword => '请输入密码';

  /// zh-CN: '请输入用户名或手机号'
  String get enterUsernameHint => '请输入用户名或手机号';

  /// zh-CN: '请输入昵称'
  String get enterNickname => '请输入昵称';

  /// zh-CN: '还没有账号？'
  String get dontHaveAccount => '还没有账号？';

  /// zh-CN: '请输入您的用户名或邮箱来重置密码'
  String get resetPasswordHint => '请输入您的用户名或邮箱来重置密码';

  /// zh-CN: '用户名 / 邮箱'
  String get usernameOrEmail => '用户名 / 邮箱';

  /// zh-CN: '便捷购买，美味随行'
  String get slogan => '便捷购买，美味随行';
}

// Path: home
class TranslationsHomeZhCn {
  TranslationsHomeZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '选择城市'
  String get selectCity => '选择城市';

  /// zh-CN: '附近设备'
  String get nearbyDevices => '附近设备';

  /// zh-CN: '便捷购买'
  String get banner1Title => '便捷购买';

  /// zh-CN: '美味随行'
  String get banner1Subtitle => '美味随行';

  /// zh-CN: '新鲜速递'
  String get banner2Title => '新鲜速递';

  /// zh-CN: '每日更新'
  String get banner2Subtitle => '每日更新';

  /// zh-CN: '超值优惠'
  String get banner3Title => '超值优惠';

  /// zh-CN: '限时特价'
  String get banner3Subtitle => '限时特价';

  /// zh-CN: '附近暂无设备'
  String get noDevices => '附近暂无设备';

  late final TranslationsHomeStatusZhCn status = TranslationsHomeStatusZhCn
      .internal(_root);
}

// Path: product
class TranslationsProductZhCn {
  TranslationsProductZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '商品列表'
  String get title => '商品列表';

  /// zh-CN: '商品详情'
  String get detail => '商品详情';

  /// zh-CN: '热销'
  String get hot => '热销';

  /// zh-CN: '促销'
  String get promotion => '促销';

  /// zh-CN: '${percent}% OFF'
  String discountOff({required Object percent}) => '${percent}% OFF';

  /// zh-CN: '库存充足'
  String get stockFull => '库存充足';

  /// zh-CN: '暂时缺货'
  String get stockEmpty => '暂时缺货';

  /// zh-CN: '加入购物车'
  String get addToCart => '加入购物车';

  /// zh-CN: '已加入购物车'
  String get addedToCart => '已加入购物车';

  /// zh-CN: '规格参数'
  String get specifications => '规格参数';

  /// zh-CN: '全部'
  String get categoryAll => '全部';

  /// zh-CN: '食品'
  String get categoryFood => '食品';

  /// zh-CN: '饮料'
  String get categoryDrink => '饮料';

  /// zh-CN: '零食'
  String get categorySnack => '零食';

  /// zh-CN: '默认排序'
  String get sortDefault => '默认排序';

  /// zh-CN: '价格从低到高'
  String get sortPriceAsc => '价格从低到高';

  /// zh-CN: '价格从高到低'
  String get sortPriceDesc => '价格从高到低';

  /// zh-CN: '按名称排序'
  String get sortName => '按名称排序';

  /// zh-CN: '仅显示可用商品'
  String get filterOnlyAvailable => '仅显示可用商品';

  /// zh-CN: '购物车'
  String get cart => '购物车';
}

// Path: cart
class TranslationsCartZhCn {
  TranslationsCartZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '购物车'
  String get title => '购物车';

  /// zh-CN: '清空'
  String get clear => '清空';

  /// zh-CN: '购物车是空的'
  String get empty => '购物车是空的';

  /// zh-CN: '合计'
  String get total => '合计';

  /// zh-CN: '结算'
  String get checkout => '结算';

  /// zh-CN: '去逛逛'
  String get goShopping => '去逛逛';
}

// Path: order
class TranslationsOrderZhCn {
  TranslationsOrderZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '我的订单'
  String get myOrders => '我的订单';

  /// zh-CN: '暂无订单'
  String get noOrders => '暂无订单';

  /// zh-CN: '订单详情'
  String get detail => '订单详情';

  late final TranslationsOrderStatusZhCn status = TranslationsOrderStatusZhCn
      .internal(_root);

  /// zh-CN: '取货码'
  String get pickupCode => '取货码';

  /// zh-CN: '请在设备上输入取货码取货'
  String get pickupHint => '请在设备上输入取货码取货';

  /// zh-CN: '商品清单'
  String get items => '商品清单';

  /// zh-CN: '订单信息'
  String get info => '订单信息';

  /// zh-CN: '订单号'
  String get id => '订单号';

  /// zh-CN: '创建时间'
  String get createdAt => '创建时间';

  /// zh-CN: '支付时间'
  String get paidAt => '支付时间';

  /// zh-CN: '支付方式'
  String get paymentMethod => '支付方式';

  /// zh-CN: '订单总额'
  String get totalAmount => '订单总额';

  /// zh-CN: '未知'
  String get unknown => '未知';

  /// zh-CN: '刷新'
  String get refresh => '刷新';

  /// zh-CN: '等${count}件商品'
  String itemsCount({required Object count}) => '等${count}件商品';

  /// zh-CN: '订单号：'
  String get orderIdLabel => '订单号：';

  /// zh-CN: '订单金额'
  String get orderAmount => '订单金额';

  /// zh-CN: '取消订单'
  String get cancelOrder => '取消订单';

  /// zh-CN: '去支付'
  String get payNow => '去支付';

  /// zh-CN: '查看详情'
  String get viewDetail => '查看详情';

  /// zh-CN: '确认取消'
  String get cancelConfirmTitle => '确认取消';

  /// zh-CN: '确定要取消这个订单吗？'
  String get cancelConfirmContent => '确定要取消这个订单吗？';

  /// zh-CN: '订单已取消'
  String get orderCancelled => '订单已取消';

  /// zh-CN: '确认订单'
  String get confirmOrder => '确认订单';

  /// zh-CN: '实付金额'
  String get actualAmount => '实付金额';

  /// zh-CN: '合计: '
  String get totalLabel => '合计: ';

  /// zh-CN: '提交订单'
  String get submitOrder => '提交订单';

  /// zh-CN: '创建订单失败: ${error}'
  String createFailed({required Object error}) => '创建订单失败: ${error}';
}

// Path: payment
class TranslationsPaymentZhCn {
  TranslationsPaymentZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '收银台'
  String get checkout => '收银台';

  /// zh-CN: '支付成功'
  String get success => '支付成功';

  /// zh-CN: '订单信息不存在'
  String get orderNotFound => '订单信息不存在';

  /// zh-CN: '立即支付'
  String get payNow => '立即支付';

  /// zh-CN: '正在初始化支付组件...'
  String get initializing => '正在初始化支付组件...';

  /// zh-CN: '取消支付'
  String get cancelTitle => '取消支付';

  /// zh-CN: '确定要取消支付吗？订单将被取消'
  String get cancelContent => '确定要取消支付吗？订单将被取消';

  /// zh-CN: '继续支付'
  String get continuePay => '继续支付';

  /// zh-CN: '取消支付'
  String get cancelPay => '取消支付';

  /// zh-CN: '支付金额'
  String get amount => '支付金额';

  /// zh-CN: '支付剩余时间'
  String get remainingTime => '支付剩余时间';
}

// Path: splash
class TranslationsSplashZhCn {
  TranslationsSplashZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '正在启动...'
  String get starting => '正在启动...';

  /// zh-CN: '检查服务状态...'
  String get checkingServices => '检查服务状态...';

  /// zh-CN: '加载配置...'
  String get loadingConfig => '加载配置...';

  /// zh-CN: '检查登录状态...'
  String get checkingAuth => '检查登录状态...';

  /// zh-CN: '准备数据...'
  String get preparingData => '准备数据...';

  /// zh-CN: '启动完成'
  String get ready => '启动完成';

  /// zh-CN: '启动失败'
  String get failed => '启动失败';
}

// Path: profile
class TranslationsProfileZhCn {
  TranslationsProfileZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

	// Translations

  /// zh-CN: '用户中心'
  String get title => '用户中心';

  /// zh-CN: '未登录'
  String get notLoggedIn => '未登录';

  /// zh-CN: '编辑资料'
  String get editProfile => '编辑资料';

  /// zh-CN: '退出登录'
  String get logout => '退出登录';

  /// zh-CN: '收藏设备'
  String get favoriteDevices => '收藏设备';

  /// zh-CN: '个人信息'
  String get personalInfo => '个人信息';

  /// zh-CN: '确认退出'
  String get confirmLogout => '确认退出';

  /// zh-CN: '确定要退出登录吗？'
  String get confirmLogoutContent => '确定要退出登录吗？';

  /// zh-CN: '确定要清除所有缓存数据吗？'
  String get clearCacheConfirm => '确定要清除所有缓存数据吗？';

  /// zh-CN: '暂无收藏设备'
  String get noFavoriteDevices => '暂无收藏设备';

  /// zh-CN: '取消收藏'
  String get removeFavorite => '取消收藏';

  /// zh-CN: '确定要取消收藏"${name}"吗？'
  String removeFavoriteConfirm({required Object name}) =>
      '确定要取消收藏"${name}"吗？';

  /// zh-CN: '一个便捷的自动售货机购买应用'
  String get appDescription => '一个便捷的自动售货机购买应用';

  /// zh-CN: '版本：${version}'
  String version({required Object version}) => '版本：${version}';
}

// Path: time
class TranslationsTimeZhCn {
  TranslationsTimeZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

	// Translations

  /// zh-CN: '刚刚'
  String get justNow => '刚刚';

  /// zh-CN: '${minutes} 分钟前'
  String minutesAgo({required Object minutes}) => '${minutes} 分钟前';

  /// zh-CN: '${hours} 小时前'
  String hoursAgo({required Object hours}) => '${hours} 小时前';

  /// zh-CN: '${days} 天前'
  String daysAgo({required Object days}) => '${days} 天前';
}

// Path: settings
class TranslationsSettingsZhCn {
  TranslationsSettingsZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '设置'
  String get title => '设置';

  /// zh-CN: '通用'
  String get general => '通用';

  /// zh-CN: '主题模式'
  String get theme => '主题模式';

  /// zh-CN: '浅色'
  String get themeLight => '浅色';

  /// zh-CN: '深色'
  String get themeDark => '深色';

  /// zh-CN: '跟随系统'
  String get themeSystem => '跟随系统';

  /// zh-CN: '语言'
  String get language => '语言';

  /// zh-CN: '检查更新'
  String get checkUpdate => '检查更新';

  /// zh-CN: '清除缓存'
  String get clearCache => '清除缓存';

  /// zh-CN: '关于'
  String get about => '关于';

  /// zh-CN: '设备信息'
  String get deviceInfo => '设备信息';

  /// zh-CN: '关于我们'
  String get aboutUs => '关于我们';

  /// zh-CN: '正在检查更新...'
  String get checkingUpdate => '正在检查更新...';

  /// zh-CN: '缓存已清除'
  String get cacheCleared => '缓存已清除';

  /// zh-CN: '英语'
  String get english => '英语';

  /// zh-CN: '简体中文'
  String get chinese => '简体中文';

  /// zh-CN: '应用名称'
  String get appName => '应用名称';

  /// zh-CN: '包名'
  String get packageName => '包名';

  /// zh-CN: '版本号'
  String get versionName => '版本号';

  /// zh-CN: '构建号'
  String get buildNumber => '构建号';

  /// zh-CN: '© 2024 Lunchbox Team'
  String get copyright => '© 2024 Lunchbox Team';
}

// Path: device_info
class TranslationsDeviceInfoZhCn {
  TranslationsDeviceInfoZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '浏览器'
  String get browser => '浏览器';

  /// zh-CN: '平台'
  String get platform => '平台';

  /// zh-CN: 'User Agent'
  String get userAgent => 'User Agent';

  /// zh-CN: '语言'
  String get language => '语言';

  /// zh-CN: '内存'
  String get memory => '内存';

  /// zh-CN: '品牌'
  String get brand => '品牌';

  /// zh-CN: '型号'
  String get model => '型号';

  /// zh-CN: '系统版本'
  String get systemVersion => '系统版本';

  /// zh-CN: 'SDK版本'
  String get sdkVersion => 'SDK版本';

  /// zh-CN: '厂商'
  String get manufacturer => '厂商';

  /// zh-CN: '硬件'
  String get hardware => '硬件';

  /// zh-CN: '主机'
  String get host => '主机';

  /// zh-CN: 'ID'
  String get id => 'ID';

  /// zh-CN: '名称'
  String get name => '名称';

  /// zh-CN: '系统名'
  String get systemName => '系统名';

  /// zh-CN: '机器码'
  String get machine => '机器码';

  /// zh-CN: '唯一ID'
  String get uniqueId => '唯一ID';
}

// Path: help
class TranslationsHelpZhCn {
  TranslationsHelpZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '帮助中心'
  String get title => '帮助中心';

  /// zh-CN: '帮助页面正在开发中'
  String get developing => '帮助页面正在开发中';
}

// Path: onboarding
class TranslationsOnboardingZhCn {
  TranslationsOnboardingZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '欢迎使用饭盒售货机'
  String get welcomeTitle => '欢迎使用饭盒售货机';

  /// zh-CN: '随时随地，轻松购买美味午餐'
  String get welcomeBody => '随时随地，轻松购买美味午餐';

  /// zh-CN: '查找附近设备'
  String get findDevicesTitle => '查找附近设备';

  /// zh-CN: '快速定位最近的售货机，节省您的时间'
  String get findDevicesBody => '快速定位最近的售货机，节省您的时间';

  /// zh-CN: '便捷支付'
  String get paymentTitle => '便捷支付';

  /// zh-CN: '支持信用卡等多种便捷支付方式'
  String get paymentBody => '支持信用卡等多种便捷支付方式';

  /// zh-CN: '开始使用'
  String get getStarted => '开始使用';
}

// Path: city
class TranslationsCityZhCn {
  TranslationsCityZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '选择城市'
  String get title => '选择城市';

  /// zh-CN: '搜索城市'
  String get search => '搜索城市';

  /// zh-CN: '热门城市'
  String get hot => '热门城市';

  /// zh-CN: '未找到相关城市'
  String get noResult => '未找到相关城市';

  /// zh-CN: '查看所有城市'
  String get viewAll => '查看所有城市';

  /// zh-CN: '城市已切换'
  String get switchSuccess => '城市已切换';

  /// zh-CN: '已切换到 ${name}'
  String switchedTo({required Object name}) => '已切换到 ${name}';

  /// zh-CN: '切换失败'
  String get switchFailed => '切换失败';

  /// zh-CN: '无法保存选择的城市，请重试'
  String get saveFailed => '无法保存选择的城市，请重试';
}

// Path: device
class TranslationsDeviceZhCn {
  TranslationsDeviceZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '设备详情'
  String get title => '设备详情';

  /// zh-CN: '设备信息'
  String get info => '设备信息';

  /// zh-CN: '地址'
  String get address => '地址';

  /// zh-CN: '距离'
  String get distance => '距离';

  /// zh-CN: '状态'
  String get status => '状态';

  /// zh-CN: '在线'
  String get online => '在线';

  /// zh-CN: '离线'
  String get offline => '离线';

  /// zh-CN: '支付方式：'
  String get paymentMethods => '支付方式：';

  /// zh-CN: '移动支付'
  String get mobilePayment => '移动支付';

  /// zh-CN: '现金'
  String get cash => '现金';

  /// zh-CN: '暂无商品'
  String get noProducts => '暂无商品';

  /// zh-CN: '商品列表'
  String get productList => '商品列表';

  /// zh-CN: '已售罄'
  String get soldOut => '已售罄';

  /// zh-CN: '上报故障'
  String get reportIssue => '上报故障';

  /// zh-CN: '上报设备故障'
  String get reportDeviceIssue => '上报设备故障';

  /// zh-CN: '请描述设备故障情况...'
  String get reportIssueHint => '请描述设备故障情况...';

  /// zh-CN: '故障上报成功'
  String get reportSuccess => '故障上报成功';

  /// zh-CN: '加载失败: ${error}'
  String loadFailed({required Object error}) => '加载失败: ${error}';

  /// zh-CN: '加载商品失败: ${error}'
  String loadProductsFailed({required Object error}) =>
      '加载商品失败: ${error}';

  /// zh-CN: '附近设备'
  String get nearby => '附近设备';

  /// zh-CN: '按距离排序'
  String get sortByDistance => '按距离排序';

  /// zh-CN: '按名称排序'
  String get sortByName => '按名称排序';

  /// zh-CN: '仅显示在线设备'
  String get filterOnline => '仅显示在线设备';

  /// zh-CN: '附近暂无设备'
  String get noDevicesNearby => '附近暂无设备';

  /// zh-CN: '维护中'
  String get maintenance => '维护中';

  /// zh-CN: '未知'
  String get unknown => '未知';

  /// zh-CN: '现金支付'
  String get cashPayment => '现金支付';
}

// Path: home.status
class TranslationsHomeStatusZhCn {
  TranslationsHomeStatusZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '营业中'
  String get open => '营业中';

  /// zh-CN: '休息中'
  String get closed => '休息中';

  /// zh-CN: '支持移动支付'
  String get mobilePayment => '支持移动支付';
}

// Path: order.status
class TranslationsOrderStatusZhCn {
  TranslationsOrderStatusZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '全部'
  String get all => '全部';

  /// zh-CN: '待支付'
  String get pending => '待支付';

  /// zh-CN: '已支付'
  String get paid => '已支付';

  /// zh-CN: '已完成'
  String get completed => '已完成';

  /// zh-CN: '已取消'
  String get cancelled => '已取消';

  /// zh-CN: '已退款'
  String get refunded => '已退款';

  /// zh-CN: '支付失败'
  String get failed => '支付失败';
}

/// The flat map containing all translations for locale <zh-CN>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.login' => '登录',
			'common.register' => '注册',
			'common.username' => '用户名',
			'common.password' => '密码',
			'common.confirm' => '确认',
			'common.cancel' => '取消',
			'common.error' => '错误',
			'common.success' => '成功',
			'common.loading' => '加载中...',
      'common.ok' => '确定',
      'common.save' => '保存',
      'common.delete' => '删除',
      'common.edit' => '编辑',
      'common.search' => '搜索',
      'common.noData' => '暂无数据',
      'common.retry' => '重试',
      'common.skip' => '跳过',
      'common.refresh' => '刷新',
      'common.loadFailed' => '加载失败',
      'common.unknownError' => '未知错误',
      'common.developing' => '页面正在开发中',
      'common.appName' => '饭盒售货机',
      'common.logout' => '退出',
			'auth.loginTitle' => '欢迎回来',
			'auth.loginButton' => '登录',
			'auth.registerButton' => '注册',
			'auth.forgotPassword' => '忘记密码？',
			'auth.loginFailed' => '登录失败',
			'auth.loginSuccess' => '登录成功',
      'auth.registerTitle' => '创建账号',
      'auth.nickname' => '昵称',
      'auth.registerSuccess' => '注册成功',
      'auth.registerFailed' => '注册失败',
      'auth.forgotPasswordTitle' => '重置密码',
      'auth.sendResetLink' => '发送重置链接',
      'auth.resetLinkSent' => '重置链接已发送',
      'auth.required' => '必填',
      'auth.enterUsername' => '请输入用户名',
      'auth.enterPassword' => '请输入密码',
      'auth.enterUsernameHint' => '请输入用户名或手机号',
      'auth.enterNickname' => '请输入昵称',
      'auth.dontHaveAccount' => '还没有账号？',
      'auth.resetPasswordHint' => '请输入您的用户名或邮箱来重置密码',
      'auth.usernameOrEmail' => '用户名 / 邮箱',
      'auth.slogan' => '便捷购买，美味随行',
      'home.selectCity' => '选择城市',
      'home.nearbyDevices' => '附近设备',
      'home.banner1Title' => '便捷购买',
      'home.banner1Subtitle' => '美味随行',
      'home.banner2Title' => '新鲜速递',
      'home.banner2Subtitle' => '每日更新',
      'home.banner3Title' => '超值优惠',
      'home.banner3Subtitle' => '限时特价',
      'home.noDevices' => '附近暂无设备',
      'home.status.open' => '营业中',
      'home.status.closed' => '休息中',
      'home.status.mobilePayment' => '支持移动支付',
      'product.title' => '商品列表',
      'product.detail' => '商品详情',
      'product.hot' => '热销',
      'product.promotion' => '促销',
      'product.discountOff' => ({required Object percent}) => '${percent}% OFF',
      'product.stockFull' => '库存充足',
      'product.stockEmpty' => '暂时缺货',
      'product.addToCart' => '加入购物车',
      'product.addedToCart' => '已加入购物车',
      'product.specifications' => '规格参数',
      'product.categoryAll' => '全部',
      'product.categoryFood' => '食品',
      'product.categoryDrink' => '饮料',
      'product.categorySnack' => '零食',
      'product.sortDefault' => '默认排序',
      'product.sortPriceAsc' => '价格从低到高',
      'product.sortPriceDesc' => '价格从高到低',
      'product.sortName' => '按名称排序',
      'product.filterOnlyAvailable' => '仅显示可用商品',
      'product.cart' => '购物车',
      'cart.title' => '购物车',
      'cart.clear' => '清空',
      'cart.empty' => '购物车是空的',
      'cart.total' => '合计',
      'cart.checkout' => '结算',
      'cart.goShopping' => '去逛逛',
      'order.myOrders' => '我的订单',
      'order.noOrders' => '暂无订单',
      'order.detail' => '订单详情',
      'order.status.all' => '全部',
      'order.status.pending' => '待支付',
      'order.status.paid' => '已支付',
      'order.status.completed' => '已完成',
      'order.status.cancelled' => '已取消',
      'order.status.refunded' => '已退款',
      'order.status.failed' => '支付失败',
      'order.pickupCode' => '取货码',
      'order.pickupHint' => '请在设备上输入取货码取货',
      'order.items' => '商品清单',
      'order.info' => '订单信息',
      'order.id' => '订单号',
      'order.createdAt' => '创建时间',
      'order.paidAt' => '支付时间',
      'order.paymentMethod' => '支付方式',
      'order.totalAmount' => '订单总额',
      'order.unknown' => '未知',
      'order.refresh' => '刷新',
      'order.itemsCount' => ({required Object count}) => '等${count}件商品',
      'order.orderIdLabel' => '订单号：',
      'order.orderAmount' => '订单金额',
      'order.cancelOrder' => '取消订单',
      'order.payNow' => '去支付',
      'order.viewDetail' => '查看详情',
      'order.cancelConfirmTitle' => '确认取消',
      'order.cancelConfirmContent' => '确定要取消这个订单吗？',
      'order.orderCancelled' => '订单已取消',
      'order.confirmOrder' => '确认订单',
      'order.actualAmount' => '实付金额',
      'order.totalLabel' => '合计: ',
      'order.submitOrder' => '提交订单',
      'order.createFailed' =>
          ({required Object error}) => '创建订单失败: ${error}',
      'payment.checkout' => '收银台',
      'payment.success' => '支付成功',
      'payment.orderNotFound' => '订单信息不存在',
      'payment.payNow' => '立即支付',
      'payment.initializing' => '正在初始化支付组件...',
      'payment.cancelTitle' => '取消支付',
      'payment.cancelContent' => '确定要取消支付吗？订单将被取消',
      'payment.continuePay' => '继续支付',
      'payment.cancelPay' => '取消支付',
      'payment.amount' => '支付金额',
      'payment.remainingTime' => '支付剩余时间',
      'splash.starting' => '正在启动...',
      'splash.checkingServices' => '检查服务状态...',
      'splash.loadingConfig' => '加载配置...',
      'splash.checkingAuth' => '检查登录状态...',
      'splash.preparingData' => '准备数据...',
      'splash.ready' => '启动完成',
      'splash.failed' => '启动失败',
      'profile.title' => '用户中心',
      'profile.notLoggedIn' => '未登录',
      'profile.editProfile' => '编辑资料',
      'profile.logout' => '退出登录',
      'profile.favoriteDevices' => '收藏设备',
      'profile.personalInfo' => '个人信息',
      'profile.confirmLogout' => '确认退出',
      'profile.confirmLogoutContent' => '确定要退出登录吗？',
      'profile.clearCacheConfirm' => '确定要清除所有缓存数据吗？',
      'profile.noFavoriteDevices' => '暂无收藏设备',
      'profile.removeFavorite' => '取消收藏',
      'profile.removeFavoriteConfirm' =>
          ({required Object name}) => '确定要取消收藏"${name}"吗？',
      'profile.appDescription' => '一个便捷的自动售货机购买应用',
      'profile.version' => ({required Object version}) => '版本：${version}',
			'time.justNow' => '刚刚',
      'time.minutesAgo' => ({required Object minutes}) => '${minutes} 分钟前',
      'time.hoursAgo' => ({required Object hours}) => '${hours} 小时前',
      'time.daysAgo' => ({required Object days}) => '${days} 天前',
      'settings.title' => '设置',
      'settings.general' => '通用',
      'settings.theme' => '主题模式',
      'settings.themeLight' => '浅色',
      'settings.themeDark' => '深色',
      'settings.themeSystem' => '跟随系统',
      'settings.language' => '语言',
      'settings.checkUpdate' => '检查更新',
      'settings.clearCache' => '清除缓存',
      'settings.about' => '关于',
      'settings.deviceInfo' => '设备信息',
      'settings.aboutUs' => '关于我们',
      'settings.checkingUpdate' => '正在检查更新...',
      'settings.cacheCleared' => '缓存已清除',
      'settings.english' => '英语',
      'settings.chinese' => '简体中文',
      'settings.appName' => '应用名称',
      'settings.packageName' => '包名',
      'settings.versionName' => '版本号',
      'settings.buildNumber' => '构建号',
      'settings.copyright' => '© 2024 Lunchbox Team',
      'device_info.browser' => '浏览器',
      'device_info.platform' => '平台',
      'device_info.userAgent' => 'User Agent',
      'device_info.language' => '语言',
      'device_info.memory' => '内存',
      'device_info.brand' => '品牌',
      'device_info.model' => '型号',
      'device_info.systemVersion' => '系统版本',
      'device_info.sdkVersion' => 'SDK版本',
      'device_info.manufacturer' => '厂商',
      'device_info.hardware' => '硬件',
      'device_info.host' => '主机',
      'device_info.id' => 'ID',
      'device_info.name' => '名称',
      'device_info.systemName' => '系统名',
      'device_info.machine' => '机器码',
      'device_info.uniqueId' => '唯一ID',
      'help.title' => '帮助中心',
      'help.developing' => '帮助页面正在开发中',
      'onboarding.welcomeTitle' => '欢迎使用饭盒售货机',
      'onboarding.welcomeBody' => '随时随地，轻松购买美味午餐',
      'onboarding.findDevicesTitle' => '查找附近设备',
      'onboarding.findDevicesBody' => '快速定位最近的售货机，节省您的时间',
      'onboarding.paymentTitle' => '便捷支付',
      'onboarding.paymentBody' => '支持信用卡等多种便捷支付方式',
      'onboarding.getStarted' => '开始使用',
      'city.title' => '选择城市',
      'city.search' => '搜索城市',
      'city.hot' => '热门城市',
      'city.noResult' => '未找到相关城市',
      'city.viewAll' => '查看所有城市',
      'city.switchSuccess' => '城市已切换',
      'city.switchedTo' => ({required Object name}) => '已切换到 ${name}',
      'city.switchFailed' => '切换失败',
      'city.saveFailed' => '无法保存选择的城市，请重试',
      'device.title' => '设备详情',
      'device.info' => '设备信息',
      'device.address' => '地址',
      'device.distance' => '距离',
      'device.status' => '状态',
      'device.online' => '在线',
      'device.offline' => '离线',
      'device.paymentMethods' => '支付方式：',
      'device.mobilePayment' => '移动支付',
      'device.cash' => '现金',
      'device.noProducts' => '暂无商品',
      'device.productList' => '商品列表',
      'device.soldOut' => '已售罄',
      'device.reportIssue' => '上报故障',
      'device.reportDeviceIssue' => '上报设备故障',
      'device.reportIssueHint' => '请描述设备故障情况...',
      'device.reportSuccess' => '故障上报成功',
      'device.loadFailed' => ({required Object error}) => '加载失败: ${error}',
      'device.loadProductsFailed' =>
          ({required Object error}) => '加载商品失败: ${error}',
      'device.nearby' => '附近设备',
      'device.sortByDistance' => '按距离排序',
      'device.sortByName' => '按名称排序',
      'device.filterOnline' => '仅显示在线设备',
      'device.noDevicesNearby' => '附近暂无设备',
      'device.maintenance' => '维护中',
      'device.unknown' => '未知',
      'device.cashPayment' => '现金支付',
			_ => null,
		};
	}
}
