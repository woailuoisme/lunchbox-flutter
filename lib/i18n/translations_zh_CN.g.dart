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
  late final TranslationsNavigationZhCn navigation = TranslationsNavigationZhCn
      .internal(_root);
  late final TranslationsAuthZhCn auth = TranslationsAuthZhCn.internal(_root);
  late final TranslationsHomeZhCn home = TranslationsHomeZhCn.internal(_root);
  late final TranslationsCommunityZhCn community = TranslationsCommunityZhCn
      .internal(_root);
  late final TranslationsTeamOrderingZhCn teamOrdering = TranslationsTeamOrderingZhCn
      .internal(_root);
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
  late final TranslationsNetworkZhCn network = TranslationsNetworkZhCn.internal(
      _root);
  late final TranslationsInviteZhCn invite = TranslationsInviteZhCn.internal(
      _root);
  late final TranslationsCouponZhCn coupon = TranslationsCouponZhCn.internal(
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

// Path: navigation
class TranslationsNavigationZhCn {
  TranslationsNavigationZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '首页'
  String get home => '首页';

  /// zh-CN: '设备'
  String get device => '设备';

  /// zh-CN: '订单'
  String get orders => '订单';

  /// zh-CN: '个人中心'
  String get profile => '个人中心';
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

  /// zh-CN: '您好，好小乖用户'
  String get welcome => '您好，好小乖用户';

  /// zh-CN: '自取点餐'
  String get selfPickup => '自取点餐';

  /// zh-CN: '扫码取餐/打包带走'
  String get selfPickupHint => '扫码取餐/打包带走';

  /// zh-CN: '团队点餐'
  String get teamOrder => '团队点餐';

  /// zh-CN: '多人订购/团队点餐'
  String get teamOrderHint => '多人订购/团队点餐';

  /// zh-CN: '为我推荐'
  String get recommendTitle => '为我推荐';

  late final TranslationsHomeGridZhCn grid = TranslationsHomeGridZhCn.internal(
      _root);
  late final TranslationsHomeLotteryZhCn lottery = TranslationsHomeLotteryZhCn
      .internal(_root);
  late final TranslationsHomeStatusZhCn status = TranslationsHomeStatusZhCn
      .internal(_root);
}

// Path: community
class TranslationsCommunityZhCn {
  TranslationsCommunityZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '社群福利'
  String get title => '社群福利';

  /// zh-CN: '加入社群'
  String get join => '加入社群';

  /// zh-CN: '与美食爱好者一起分享美味'
  String get share => '与美食爱好者一起分享美味';

  /// zh-CN: '东莞中科云计算研究院'
  String get org => '东莞中科云计算研究院';

  /// zh-CN: '云计算中心'
  String get dept => '云计算中心';

  /// zh-CN: '扫码加入东莞中科云计算研究院'
  String get scanHint => '扫码加入东莞中科云计算研究院';

  late final TranslationsCommunityFeaturesZhCn features = TranslationsCommunityFeaturesZhCn
      .internal(_root);

  /// zh-CN: '为什么加入我们的社群？'
  String get whyJoin => '为什么加入我们的社群？';

  /// zh-CN: '每日美食推荐，让你不再纠结吃什么'
  String get reason1 => '每日美食推荐，让你不再纠结吃什么';

  /// zh-CN: '限时优惠活动，省钱又省心'
  String get reason2 => '限时优惠活动，省钱又省心';

  /// zh-CN: '专业美食测评，帮你避坑'
  String get reason3 => '专业美食测评，帮你避坑';

  /// zh-CN: '美食制作教程，在家也能做出美味'
  String get reason4 => '美食制作教程，在家也能做出美味';
}

// Path: teamOrdering
class TranslationsTeamOrderingZhCn {
  TranslationsTeamOrderingZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '团队用餐'
  String get title => '团队用餐';

  /// zh-CN: '团队点餐'
  String get bannerTitle => '团队点餐';

  /// zh-CN: '多人订购 · 团队聚餐 · 企业团建'
  String get bannerSubtitle => '多人订购 · 团队聚餐 · 企业团建';

  /// zh-CN: '专业服务'
  String get tag1 => '专业服务';

  /// zh-CN: '优惠价格'
  String get tag2 => '优惠价格';

  /// zh-CN: '便捷高效'
  String get tag3 => '便捷高效';

  late final TranslationsTeamOrderingScenariosZhCn scenarios = TranslationsTeamOrderingScenariosZhCn
      .internal(_root);
  late final TranslationsTeamOrderingProcessZhCn process = TranslationsTeamOrderingProcessZhCn
      .internal(_root);
  late final TranslationsTeamOrderingAdvantagesZhCn advantages = TranslationsTeamOrderingAdvantagesZhCn
      .internal(_root);

  /// zh-CN: '立即预订'
  String get bookNow => '立即预订';
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

  /// zh-CN: '食品订单'
  String get foodOrder => '食品订单';

  /// zh-CN: '商城订单'
  String get mallOrder => '商城订单';

  /// zh-CN: '暂无订单'
  String get noOrders => '暂无订单';

  /// zh-CN: '订单详情'
  String get detail => '订单详情';

  late final TranslationsOrderStatusZhCn status = TranslationsOrderStatusZhCn
      .internal(_root);

  /// zh-CN: '订单将于今晚10点30分过期'
  String get expiryHint => '订单将于今晚10点30分过期';

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

  /// zh-CN: '我的'
  String get title => '我的';

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

  /// zh-CN: '我的钱包'
  String get wallet => '我的钱包';

  /// zh-CN: '优惠券'
  String get coupon => '优惠券';

  /// zh-CN: '问题反馈'
  String get feedback => '问题反馈';

  /// zh-CN: '合作商加盟'
  String get cooperation => '合作商加盟';

  /// zh-CN: '关于我们'
  String get about => '关于我们';

  /// zh-CN: '设置'
  String get settings => '设置';

  /// zh-CN: '钱包余额'
  String get walletBalance => '钱包余额';

  /// zh-CN: '乖乖币'
  String get coin => '乖乖币';

  /// zh-CN: '优惠券'
  String get couponCount => '优惠券';
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

  /// zh-CN: '取餐机'
  String get title => '取餐机';

  /// zh-CN: '设备信息'
  String get info => '设备信息';

  /// zh-CN: '地址'
  String get address => '地址';

  /// zh-CN: '距离'
  String get distance => '距离';

  /// zh-CN: '状态'
  String get status => '状态';

  /// zh-CN: '营业中'
  String get online => '营业中';

  /// zh-CN: '休息中'
  String get offline => '休息中';

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

  /// zh-CN: '点餐'
  String get menu => '点餐';

  /// zh-CN: '经典菜单'
  String get classicMenu => '经典菜单';

  /// zh-CN: '限时优惠'
  String get limitedDiscount => '限时优惠';

  /// zh-CN: '月售 ${count}'
  String monthlySales({required Object count}) => '月售 ${count}';

  /// zh-CN: '剩余 ${count}'
  String stock({required Object count}) => '剩余 ${count}';

  /// zh-CN: '已售罄'
  String get soldOutLabel => '已售罄';

  /// zh-CN: '自取点餐'
  String get selfPickupOrder => '自取点餐';

  /// zh-CN: '已选商品'
  String get selectedProducts => '已选商品';

  /// zh-CN: '小计'
  String get subtotal => '小计';

  /// zh-CN: '预估到手'
  String get estimatedPrice => '预估到手';

  /// zh-CN: '原价'
  String get originalPrice => '原价';

  /// zh-CN: '附近营业点'
  String get nearby => '附近营业点';

  /// zh-CN: '常去营业点'
  String get frequent => '常去营业点';

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

  /// zh-CN: '已启用'
  String get enabled => '已启用';
}

// Path: network
class TranslationsNetworkZhCn {
  TranslationsNetworkZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsNetworkErrorsZhCn errors = TranslationsNetworkErrorsZhCn
      .internal(_root);
}

// Path: invite
class TranslationsInviteZhCn {
  TranslationsInviteZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '邀请好友'
  String get title => '邀请好友';

  /// zh-CN: '规则'
  String get ruleBtn => '规则';

  /// zh-CN: '1元'
  String get rewardTitle => '1元';

  /// zh-CN: '无门槛券'
  String get rewardSubtitle => '无门槛券';

  /// zh-CN: '每邀请1个人重复可得'
  String get rewardDesc => '每邀请1个人重复可得';

  /// zh-CN: '我的邀请码'
  String get myCode => '我的邀请码';

  /// zh-CN: '复制'
  String get copy => '复制';

  /// zh-CN: '邀请微信好友'
  String get btnInvite => '邀请微信好友';

  /// zh-CN: '邀请流程'
  String get processTitle => '邀请流程';

  /// zh-CN: '分享链接'
  String get step1 => '分享链接';

  /// zh-CN: '给好友'
  String get step1Desc => '给好友';

  /// zh-CN: '好友注册'
  String get step2 => '好友注册';

  /// zh-CN: '得新人礼包'
  String get step2Desc => '得新人礼包';

  /// zh-CN: '好友首单'
  String get step3 => '好友首单';

  /// zh-CN: '实付≥5元'
  String get step3Desc => '实付≥5元';

  /// zh-CN: '邀请达成'
  String get step4 => '邀请达成';

  /// zh-CN: '获得奖励'
  String get step4Desc => '获得奖励';

  /// zh-CN: '我的成就'
  String get stats => '我的成就';

  /// zh-CN: '已成功邀请(人)'
  String get invitedCount => '已成功邀请(人)';

  /// zh-CN: '已获得奖励(元)'
  String get rewardAmount => '已获得奖励(元)';

  late final TranslationsInviteRulesZhCn rules = TranslationsInviteRulesZhCn
      .internal(_root);
}

// Path: coupon
class TranslationsCouponZhCn {
  TranslationsCouponZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '优惠券'
  String get title => '优惠券';

  late final TranslationsCouponTabsZhCn tabs = TranslationsCouponTabsZhCn
      .internal(_root);

  /// zh-CN: '¥'
  String get unit => '¥';

  /// zh-CN: '满减券 满${amount}元可用'
  String condition({required Object amount}) => '满减券\n满${amount}元可用';

  /// zh-CN: '满减券 满0元可用'
  String get conditionNoThreshold => '满减券\n满0元可用';

  /// zh-CN: '长期有效'
  String get validForever => '长期有效';

  /// zh-CN: '立即领取'
  String get btnReceive => '立即领取';

  /// zh-CN: '已领取'
  String get btnReceived => '已领取';

  /// zh-CN: '去使用'
  String get btnUse => '去使用';

  /// zh-CN: '已过期'
  String get btnExpired => '已过期';

  /// zh-CN: '${amount}元优惠券'
  String discount({required Object amount}) => '${amount}元优惠券';

  /// zh-CN: '${amount}元减免券'
  String discountOff({required Object amount}) => '${amount}元减免券';
}

// Path: home.grid
class TranslationsHomeGridZhCn {
  TranslationsHomeGridZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '社群福利'
  String get welfare => '社群福利';

  /// zh-CN: '客服中心'
  String get service => '客服中心';

  /// zh-CN: '领优惠券'
  String get coupon => '领优惠券';

  /// zh-CN: '幸运抽奖'
  String get lottery => '幸运抽奖';

  /// zh-CN: '邀请好友'
  String get invite => '邀请好友';
}

// Path: home.lottery
class TranslationsHomeLotteryZhCn {
  TranslationsHomeLotteryZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '幸运抽奖'
  String get title => '幸运抽奖';

  /// zh-CN: '我的奖品'
  String get prizes => '我的奖品';

  /// zh-CN: '抽奖规则'
  String get rules => '抽奖规则';

  /// zh-CN: '剩余次数: {count}'
  String get remaining => '剩余次数: {count}';

  /// zh-CN: '抽奖'
  String get spin => '抽奖';

  /// zh-CN: '每日有免费抽奖次数，次数用完后可领取任务获得'
  String get rule1 => '每日有免费抽奖次数，次数用完后可领取任务获得';

  /// zh-CN: '优惠券48小时内有效，乖乖币自动到账'
  String get rule2 => '优惠券48小时内有效，乖乖币自动到账';

  /// zh-CN: '活动最终解释权归平台所有'
  String get rule3 => '活动最终解释权归平台所有';

  /// zh-CN: '乖乖币'
  String get prizeUnit => '乖乖币';

  /// zh-CN: '奖品说明'
  String get prizeList => '奖品说明';

  /// zh-CN: '返回'
  String get back => '返回';

  late final TranslationsHomeLotteryPrizeStatsZhCn prizeStats = TranslationsHomeLotteryPrizeStatsZhCn
      .internal(_root);
  late final TranslationsHomeLotteryTabsZhCn tabs = TranslationsHomeLotteryTabsZhCn
      .internal(_root);
  late final TranslationsHomeLotteryPrizeCardZhCn prizeCard = TranslationsHomeLotteryPrizeCardZhCn
      .internal(_root);
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

// Path: community.features
class TranslationsCommunityFeaturesZhCn {
  TranslationsCommunityFeaturesZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '专属优惠券'
  String get coupon => '专属优惠券';

  /// zh-CN: '群内专享折扣，省钱又美味'
  String get couponHint => '群内专享折扣，省钱又美味';

  /// zh-CN: '新品试吃'
  String get tasting => '新品试吃';

  /// zh-CN: '第一时间品尝最新美食'
  String get tastingHint => '第一时间品尝最新美食';

  /// zh-CN: '美食交流'
  String get exchange => '美食交流';

  /// zh-CN: '与美食达人分享心得'
  String get exchangeHint => '与美食达人分享心得';

  /// zh-CN: '活动优先'
  String get priority => '活动优先';

  /// zh-CN: '优先参与各种美食活动'
  String get priorityHint => '优先参与各种美食活动';
}

// Path: teamOrdering.scenarios
class TranslationsTeamOrderingScenariosZhCn {
  TranslationsTeamOrderingScenariosZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '适用场景'
  String get title => '适用场景';

  /// zh-CN: '满足不同团队需求'
  String get subtitle => '满足不同团队需求';

  /// zh-CN: '团队点餐'
  String get team => '团队点餐';

  /// zh-CN: '企业团建、部门聚餐'
  String get teamDesc => '企业团建、部门聚餐';

  /// zh-CN: '预约点餐'
  String get reserve => '预约点餐';

  /// zh-CN: '提前预订，按时取餐'
  String get reserveDesc => '提前预订，按时取餐';

  /// zh-CN: '大客户点餐'
  String get vip => '大客户点餐';

  /// zh-CN: '批量订购，专属服务'
  String get vipDesc => '批量订购，专属服务';
}

// Path: teamOrdering.process
class TranslationsTeamOrderingProcessZhCn {
  TranslationsTeamOrderingProcessZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '操作流程'
  String get title => '操作流程';

  /// zh-CN: '简单三步，轻松预订'
  String get subtitle => '简单三步，轻松预订';

  /// zh-CN: '联系客服'
  String get step1Title => '联系客服';

  /// zh-CN: '拨打热线或在线咨询，说明用餐需求'
  String get step1Desc => '拨打热线或在线咨询，说明用餐需求';

  /// zh-CN: '确认方案'
  String get step2Title => '确认方案';

  /// zh-CN: '客服为您定制专属方案，确认菜品和价格'
  String get step2Desc => '客服为您定制专属方案，确认菜品和价格';

  /// zh-CN: '完成预订'
  String get step3Title => '完成预订';

  /// zh-CN: '确认订单信息，按时到店自取'
  String get step3Desc => '确认订单信息，按时到店自取';
}

// Path: teamOrdering.advantages
class TranslationsTeamOrderingAdvantagesZhCn {
  TranslationsTeamOrderingAdvantagesZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '服务优势'
  String get title => '服务优势';

  /// zh-CN: '专业团队，值得信赖'
  String get subtitle => '专业团队，值得信赖';

  /// zh-CN: '专业定制'
  String get custom => '专业定制';

  /// zh-CN: '根据团队规模和个人口味，提供个性化定制方案'
  String get customDesc => '根据团队规模和个人口味，提供个性化定制方案';

  /// zh-CN: '提前预约'
  String get reserve => '提前预约';

  /// zh-CN: '支持提前预约，合理安排用餐时间，避免等待'
  String get reserveDesc => '支持提前预约，合理安排用餐时间，避免等待';

  /// zh-CN: '优惠价格'
  String get price => '优惠价格';

  /// zh-CN: '团队订购享受更多折扣，量大更优惠'
  String get priceDesc => '团队订购享受更多折扣，量大更优惠';

  /// zh-CN: '品质保证'
  String get quality => '品质保证';

  /// zh-CN: '严格把控食材质量，确保每一份餐点新鲜美味'
  String get qualityDesc => '严格把控食材质量，确保每一份餐点新鲜美味';
}

// Path: order.status
class TranslationsOrderStatusZhCn {
  TranslationsOrderStatusZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '全部订单'
  String get all => '全部订单';

  /// zh-CN: '待支付'
  String get pending => '待支付';

  /// zh-CN: '已支付'
  String get paid => '已支付';

  /// zh-CN: '已使用'
  String get used => '已使用';

  /// zh-CN: '已完成'
  String get completed => '已完成';

  /// zh-CN: '已取消'
  String get cancelled => '已取消';

  /// zh-CN: '退款'
  String get refunded => '退款';

  /// zh-CN: '支付失败'
  String get failed => '支付失败';
}

// Path: network.errors
class TranslationsNetworkErrorsZhCn {
  TranslationsNetworkErrorsZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '连接超时，请检查网络连接'
  String get connectionTimeout => '连接超时，请检查网络连接';

  /// zh-CN: '发送请求超时，请检查网络连接'
  String get sendTimeout => '发送请求超时，请检查网络连接';

  /// zh-CN: '接收响应超时，请检查网络连接'
  String get receiveTimeout => '接收响应超时，请检查网络连接';

  /// zh-CN: '证书验证失败'
  String get badCertificate => '证书验证失败';

  /// zh-CN: '请求已取消'
  String get cancel => '请求已取消';

  /// zh-CN: '网络连接失败，请检查网络设置'
  String get connectionError => '网络连接失败，请检查网络设置';

  /// zh-CN: '未知错误：${error}'
  String unknown({required Object error}) => '未知错误：${error}';

  /// zh-CN: '请稍后重试'
  String get retryLater => '请稍后重试';

  /// zh-CN: '请求参数错误'
  String get badRequest => '请求参数错误';

  /// zh-CN: '未授权，请重新登录'
  String get unauthorized => '未授权，请重新登录';

  /// zh-CN: '没有权限访问该资源'
  String get forbidden => '没有权限访问该资源';

  /// zh-CN: '请求的资源不存在'
  String get notFound => '请求的资源不存在';

  /// zh-CN: '请求超时，请重试'
  String get timeout => '请求超时，请重试';

  /// zh-CN: '请求冲突'
  String get conflict => '请求冲突';

  /// zh-CN: '请求数据验证失败'
  String get validationFailed => '请求数据验证失败';

  /// zh-CN: '请求过于频繁，请稍后重试'
  String get tooManyRequests => '请求过于频繁，请稍后重试';

  /// zh-CN: '服务器内部错误'
  String get internalServerError => '服务器内部错误';

  /// zh-CN: '网关错误，请稍后重试'
  String get badGateway => '网关错误，请稍后重试';

  /// zh-CN: '服务暂时不可用，请稍后重试'
  String get serviceUnavailable => '服务暂时不可用，请稍后重试';

  /// zh-CN: '网关超时，请稍后重试'
  String get gatewayTimeout => '网关超时，请稍后重试';

  /// zh-CN: '服务器错误（${code}）'
  String serverError({required Object code}) => '服务器错误（${code}）';

  /// zh-CN: '请求错误（${code}）'
  String requestError({required Object code}) => '请求错误（${code}）';

  /// zh-CN: '网络请求失败'
  String get failed => '网络请求失败';
}

// Path: invite.rules
class TranslationsInviteRulesZhCn {
  TranslationsInviteRulesZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '邀请规则'
  String get title => '邀请规则';

  /// zh-CN: '邀请规则'
  String get section1 => '邀请规则';

  /// zh-CN: '每成功邀请1位好友注册，即可获得1元无门槛优惠券'
  String get rule1 => '每成功邀请1位好友注册，即可获得1元无门槛优惠券';

  /// zh-CN: '邀请好友需完成首次下单（实付金额≥15元）才算成功'
  String get rule2 => '邀请好友需完成首次下单（实付金额≥15元）才算成功';

  /// zh-CN: '每位好友仅可被邀请一次，重复邀请无效'
  String get rule3 => '每位好友仅可被邀请一次，重复邀请无效';

  /// zh-CN: '邀请奖励无上限，邀请越多奖励越多'
  String get rule4 => '邀请奖励无上限，邀请越多奖励越多';

  /// zh-CN: '邀请记录永久保存，可随时查看'
  String get rule5 => '邀请记录永久保存，可随时查看';

  /// zh-CN: '奖励说明'
  String get section2 => '奖励说明';

  /// zh-CN: '1元无门槛优惠券，可直接抵扣订单金额'
  String get reward1 => '1元无门槛优惠券，可直接抵扣订单金额';

  /// zh-CN: '优惠券有效期为30天，请在有效期内使用'
  String get reward2 => '优惠券有效期为30天，请在有效期内使用';

  /// zh-CN: '优惠券不可与其他优惠活动同时使用'
  String get reward3 => '优惠券不可与其他优惠活动同时使用';

  /// zh-CN: '优惠券仅限在好小乖智能盒饭售卖机使用'
  String get reward4 => '优惠券仅限在好小乖智能盒饭售卖机使用';

  /// zh-CN: '优惠券不可转让、不可兑换现金'
  String get reward5 => '优惠券不可转让、不可兑换现金';

  /// zh-CN: '注意事项'
  String get section3 => '注意事项';

  /// zh-CN: '邀请好友必须通过官方邀请链接进行'
  String get note1 => '邀请好友必须通过官方邀请链接进行';

  /// zh-CN: '好友注册后需完成实名认证'
  String get note2 => '好友注册后需完成实名认证';

  /// zh-CN: '如发现恶意刷邀请行为，平台有权取消奖励'
  String get note3 => '如发现恶意刷邀请行为，平台有权取消奖励';

  /// zh-CN: '活动规则最终解释权归好小乖智能盒饭售卖机所有'
  String get note4 => '活动规则最终解释权归好小乖智能盒饭售卖机所有';

  /// zh-CN: '如有疑问请联系客服处理'
  String get note5 => '如有疑问请联系客服处理';

  /// zh-CN: '邀请流程'
  String get section4 => '邀请流程';

  /// zh-CN: '分享邀请链接给好友'
  String get process1 => '分享邀请链接给好友';

  /// zh-CN: '好友通过链接注册账号'
  String get process2 => '好友通过链接注册账号';

  /// zh-CN: '好友完成首次下单（≥15元）'
  String get process3 => '好友完成首次下单（≥15元）';

  /// zh-CN: '系统自动发放奖励到您的账户'
  String get process4 => '系统自动发放奖励到您的账户';

  /// zh-CN: '可在“我的成就”中查看邀请记录'
  String get process5 => '可在“我的成就”中查看邀请记录';
}

// Path: coupon.tabs
class TranslationsCouponTabsZhCn {
  TranslationsCouponTabsZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '可领取'
  String get available => '可领取';

  /// zh-CN: '已领取'
  String get received => '已领取';

  /// zh-CN: '已过期'
  String get expired => '已过期';
}

// Path: home.lottery.prizeStats
class TranslationsHomeLotteryPrizeStatsZhCn {
  TranslationsHomeLotteryPrizeStatsZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '总奖品'
  String get total => '总奖品';

  /// zh-CN: '已使用'
  String get used => '已使用';

  /// zh-CN: '可用'
  String get available => '可用';
}

// Path: home.lottery.tabs
class TranslationsHomeLotteryTabsZhCn {
  TranslationsHomeLotteryTabsZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '全部'
  String get all => '全部';

  /// zh-CN: '可用'
  String get available => '可用';

  /// zh-CN: '已使用'
  String get used => '已使用';

  /// zh-CN: '已过期'
  String get expired => '已过期';
}

// Path: home.lottery.prizeCard
class TranslationsHomeLotteryPrizeCardZhCn {
  TranslationsHomeLotteryPrizeCardZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '乖乖币奖励，可在乖乖币商城使用'
  String get source => '乖乖币奖励，可在乖乖币商城使用';

  /// zh-CN: '获得时间: {time}'
  String get getTime => '获得时间: {time}';

  /// zh-CN: '有效期至: {time}'
  String get expiryTime => '有效期至: {time}';

  /// zh-CN: '已过期'
  String get statusExpired => '已过期';
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
      'navigation.home' => '首页',
      'navigation.device' => '设备',
      'navigation.orders' => '订单',
      'navigation.profile' => '个人中心',
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
      'home.welcome' => '您好，好小乖用户',
      'home.selfPickup' => '自取点餐',
      'home.selfPickupHint' => '扫码取餐/打包带走',
      'home.teamOrder' => '团队点餐',
      'home.teamOrderHint' => '多人订购/团队点餐',
      'home.recommendTitle' => '为我推荐',
      'home.grid.welfare' => '社群福利',
      'home.grid.service' => '客服中心',
      'home.grid.coupon' => '领优惠券',
      'home.grid.lottery' => '幸运抽奖',
      'home.grid.invite' => '邀请好友',
      'home.lottery.title' => '幸运抽奖',
      'home.lottery.prizes' => '我的奖品',
      'home.lottery.rules' => '抽奖规则',
      'home.lottery.remaining' => '剩余次数: {count}',
      'home.lottery.spin' => '抽奖',
      'home.lottery.rule1' => '每日有免费抽奖次数，次数用完后可领取任务获得',
      'home.lottery.rule2' => '优惠券48小时内有效，乖乖币自动到账',
      'home.lottery.rule3' => '活动最终解释权归平台所有',
      'home.lottery.prizeUnit' => '乖乖币',
      'home.lottery.prizeList' => '奖品说明',
      'home.lottery.back' => '返回',
      'home.lottery.prizeStats.total' => '总奖品',
      'home.lottery.prizeStats.used' => '已使用',
      'home.lottery.prizeStats.available' => '可用',
      'home.lottery.tabs.all' => '全部',
      'home.lottery.tabs.available' => '可用',
      'home.lottery.tabs.used' => '已使用',
      'home.lottery.tabs.expired' => '已过期',
      'home.lottery.prizeCard.source' => '乖乖币奖励，可在乖乖币商城使用',
      'home.lottery.prizeCard.getTime' => '获得时间: {time}',
      'home.lottery.prizeCard.expiryTime' => '有效期至: {time}',
      'home.lottery.prizeCard.statusExpired' => '已过期',
      'home.status.open' => '营业中',
      'home.status.closed' => '休息中',
      'home.status.mobilePayment' => '支持移动支付',
      'community.title' => '社群福利',
      'community.join' => '加入社群',
      'community.share' => '与美食爱好者一起分享美味',
      'community.org' => '东莞中科云计算研究院',
      'community.dept' => '云计算中心',
      'community.scanHint' => '扫码加入东莞中科云计算研究院',
      'community.features.coupon' => '专属优惠券',
      'community.features.couponHint' => '群内专享折扣，省钱又美味',
      'community.features.tasting' => '新品试吃',
      'community.features.tastingHint' => '第一时间品尝最新美食',
      'community.features.exchange' => '美食交流',
      'community.features.exchangeHint' => '与美食达人分享心得',
      'community.features.priority' => '活动优先',
      'community.features.priorityHint' => '优先参与各种美食活动',
      'community.whyJoin' => '为什么加入我们的社群？',
      'community.reason1' => '每日美食推荐，让你不再纠结吃什么',
      'community.reason2' => '限时优惠活动，省钱又省心',
      'community.reason3' => '专业美食测评，帮你避坑',
      'community.reason4' => '美食制作教程，在家也能做出美味',
      'teamOrdering.title' => '团队用餐',
      'teamOrdering.bannerTitle' => '团队点餐',
      'teamOrdering.bannerSubtitle' => '多人订购 · 团队聚餐 · 企业团建',
      'teamOrdering.tag1' => '专业服务',
      'teamOrdering.tag2' => '优惠价格',
      'teamOrdering.tag3' => '便捷高效',
      'teamOrdering.scenarios.title' => '适用场景',
      'teamOrdering.scenarios.subtitle' => '满足不同团队需求',
      'teamOrdering.scenarios.team' => '团队点餐',
      'teamOrdering.scenarios.teamDesc' => '企业团建、部门聚餐',
      'teamOrdering.scenarios.reserve' => '预约点餐',
      'teamOrdering.scenarios.reserveDesc' => '提前预订，按时取餐',
      'teamOrdering.scenarios.vip' => '大客户点餐',
      'teamOrdering.scenarios.vipDesc' => '批量订购，专属服务',
      'teamOrdering.process.title' => '操作流程',
      'teamOrdering.process.subtitle' => '简单三步，轻松预订',
      'teamOrdering.process.step1Title' => '联系客服',
      'teamOrdering.process.step1Desc' => '拨打热线或在线咨询，说明用餐需求',
      'teamOrdering.process.step2Title' => '确认方案',
      'teamOrdering.process.step2Desc' => '客服为您定制专属方案，确认菜品和价格',
      'teamOrdering.process.step3Title' => '完成预订',
      'teamOrdering.process.step3Desc' => '确认订单信息，按时到店自取',
      'teamOrdering.advantages.title' => '服务优势',
      'teamOrdering.advantages.subtitle' => '专业团队，值得信赖',
      'teamOrdering.advantages.custom' => '专业定制',
      'teamOrdering.advantages.customDesc' => '根据团队规模和个人口味，提供个性化定制方案',
      'teamOrdering.advantages.reserve' => '提前预约',
      'teamOrdering.advantages.reserveDesc' => '支持提前预约，合理安排用餐时间，避免等待',
      'teamOrdering.advantages.price' => '优惠价格',
      'teamOrdering.advantages.priceDesc' => '团队订购享受更多折扣，量大更优惠',
      'teamOrdering.advantages.quality' => '品质保证',
      'teamOrdering.advantages.qualityDesc' => '严格把控食材质量，确保每一份餐点新鲜美味',
      'teamOrdering.bookNow' => '立即预订',
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
      'order.foodOrder' => '食品订单',
      'order.mallOrder' => '商城订单',
      'order.noOrders' => '暂无订单',
      'order.detail' => '订单详情',
      'order.status.all' => '全部订单',
      'order.status.pending' => '待支付',
      'order.status.paid' => '已支付',
      'order.status.used' => '已使用',
      'order.status.completed' => '已完成',
      'order.status.cancelled' => '已取消',
      'order.status.refunded' => '退款',
      'order.status.failed' => '支付失败',
      'order.expiryHint' => '订单将于今晚10点30分过期',
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
      'profile.title' => '我的',
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
      'profile.wallet' => '我的钱包',
      'profile.coupon' => '优惠券',
      'profile.feedback' => '问题反馈',
      'profile.cooperation' => '合作商加盟',
      'profile.about' => '关于我们',
      'profile.settings' => '设置',
      'profile.walletBalance' => '钱包余额',
      'profile.coin' => '乖乖币',
      'profile.couponCount' => '优惠券',
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
      'device.title' => '取餐机',
      'device.info' => '设备信息',
      'device.address' => '地址',
      'device.distance' => '距离',
      'device.status' => '状态',
      'device.online' => '营业中',
      'device.offline' => '休息中',
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
      'device.menu' => '点餐',
      'device.classicMenu' => '经典菜单',
      'device.limitedDiscount' => '限时优惠',
      'device.monthlySales' => ({required Object count}) => '月售 ${count}',
      'device.stock' => ({required Object count}) => '剩余 ${count}',
      'device.soldOutLabel' => '已售罄',
      'device.selfPickupOrder' => '自取点餐',
      'device.selectedProducts' => '已选商品',
      'device.subtotal' => '小计',
      'device.estimatedPrice' => '预估到手',
      'device.originalPrice' => '原价',
      'device.nearby' => '附近营业点',
      'device.frequent' => '常去营业点',
      'device.sortByDistance' => '按距离排序',
      'device.sortByName' => '按名称排序',
      'device.filterOnline' => '仅显示在线设备',
      'device.noDevicesNearby' => '附近暂无设备',
      'device.maintenance' => '维护中',
      'device.unknown' => '未知',
      'device.cashPayment' => '现金支付',
      'device.enabled' => '已启用',
      'network.errors.connectionTimeout' => '连接超时，请检查网络连接',
      'network.errors.sendTimeout' => '发送请求超时，请检查网络连接',
      'network.errors.receiveTimeout' => '接收响应超时，请检查网络连接',
      'network.errors.badCertificate' => '证书验证失败',
      'network.errors.cancel' => '请求已取消',
      'network.errors.connectionError' => '网络连接失败，请检查网络设置',
      'network.errors.unknown' =>
          ({required Object error}) => '未知错误：${error}',
      'network.errors.retryLater' => '请稍后重试',
      'network.errors.badRequest' => '请求参数错误',
      'network.errors.unauthorized' => '未授权，请重新登录',
      'network.errors.forbidden' => '没有权限访问该资源',
      'network.errors.notFound' => '请求的资源不存在',
      'network.errors.timeout' => '请求超时，请重试',
      'network.errors.conflict' => '请求冲突',
      'network.errors.validationFailed' => '请求数据验证失败',
      'network.errors.tooManyRequests' => '请求过于频繁，请稍后重试',
      'network.errors.internalServerError' => '服务器内部错误',
      'network.errors.badGateway' => '网关错误，请稍后重试',
      'network.errors.serviceUnavailable' => '服务暂时不可用，请稍后重试',
      'network.errors.gatewayTimeout' => '网关超时，请稍后重试',
      'network.errors.serverError' =>
          ({required Object code}) => '服务器错误（${code}）',
      'network.errors.requestError' =>
          ({required Object code}) => '请求错误（${code}）',
      'network.errors.failed' => '网络请求失败',
      'invite.title' => '邀请好友',
      'invite.ruleBtn' => '规则',
      'invite.rewardTitle' => '1元',
      'invite.rewardSubtitle' => '无门槛券',
      'invite.rewardDesc' => '每邀请1个人重复可得',
      'invite.myCode' => '我的邀请码',
      'invite.copy' => '复制',
      'invite.btnInvite' => '邀请微信好友',
      'invite.processTitle' => '邀请流程',
      'invite.step1' => '分享链接',
      'invite.step1Desc' => '给好友',
      'invite.step2' => '好友注册',
      'invite.step2Desc' => '得新人礼包',
      'invite.step3' => '好友首单',
      'invite.step3Desc' => '实付≥5元',
      'invite.step4' => '邀请达成',
      'invite.step4Desc' => '获得奖励',
      'invite.stats' => '我的成就',
      'invite.invitedCount' => '已成功邀请(人)',
      'invite.rewardAmount' => '已获得奖励(元)',
      'invite.rules.title' => '邀请规则',
      'invite.rules.section1' => '邀请规则',
      'invite.rules.rule1' => '每成功邀请1位好友注册，即可获得1元无门槛优惠券',
      'invite.rules.rule2' => '邀请好友需完成首次下单（实付金额≥15元）才算成功',
      'invite.rules.rule3' => '每位好友仅可被邀请一次，重复邀请无效',
      'invite.rules.rule4' => '邀请奖励无上限，邀请越多奖励越多',
      'invite.rules.rule5' => '邀请记录永久保存，可随时查看',
      'invite.rules.section2' => '奖励说明',
      'invite.rules.reward1' => '1元无门槛优惠券，可直接抵扣订单金额',
      'invite.rules.reward2' => '优惠券有效期为30天，请在有效期内使用',
      'invite.rules.reward3' => '优惠券不可与其他优惠活动同时使用',
      'invite.rules.reward4' => '优惠券仅限在好小乖智能盒饭售卖机使用',
      'invite.rules.reward5' => '优惠券不可转让、不可兑换现金',
      'invite.rules.section3' => '注意事项',
      'invite.rules.note1' => '邀请好友必须通过官方邀请链接进行',
      'invite.rules.note2' => '好友注册后需完成实名认证',
      'invite.rules.note3' => '如发现恶意刷邀请行为，平台有权取消奖励',
      'invite.rules.note4' => '活动规则最终解释权归好小乖智能盒饭售卖机所有',
      'invite.rules.note5' => '如有疑问请联系客服处理',
      'invite.rules.section4' => '邀请流程',
      'invite.rules.process1' => '分享邀请链接给好友',
      'invite.rules.process2' => '好友通过链接注册账号',
      'invite.rules.process3' => '好友完成首次下单（≥15元）',
      'invite.rules.process4' => '系统自动发放奖励到您的账户',
      'invite.rules.process5' => '可在“我的成就”中查看邀请记录',
      'coupon.title' => '优惠券',
      'coupon.tabs.available' => '可领取',
      'coupon.tabs.received' => '已领取',
      'coupon.tabs.expired' => '已过期',
      'coupon.unit' => '¥',
      'coupon.condition' =>
          ({required Object amount}) => '满减券\n满${amount}元可用',
      'coupon.conditionNoThreshold' => '满减券\n满0元可用',
      'coupon.validForever' => '长期有效',
      'coupon.btnReceive' => '立即领取',
      'coupon.btnReceived' => '已领取',
      'coupon.btnUse' => '去使用',
      'coupon.btnExpired' => '已过期',
      'coupon.discount' => ({required Object amount}) => '${amount}元优惠券',
      'coupon.discountOff' => ({required Object amount}) => '${amount}元减免券',
			_ => null,
		};
	}
}
