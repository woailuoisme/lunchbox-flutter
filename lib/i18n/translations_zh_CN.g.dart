///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsZhCn = Translations; // ignore: unused_element

class Translations with BaseTranslations<AppLocale, Translations> {
  /// Returns the current translations of the given [context].
  ///
  /// Usage:
  /// final t = Translations.of(context);
  static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  /// [AppLocaleUtils.buildWithOverrides] is recommended for overriding.
  Translations({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.zhCn,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <zh-CN>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  dynamic operator [](String key) => $meta.getTranslation(key);

  late final Translations _root = this; // ignore: unused_field

  Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) =>
      Translations(meta: meta ?? this.$meta);

  // Translations
  late final TranslationsAboutZhCn about = TranslationsAboutZhCn.internal(_root);
  late final TranslationsAuthZhCn auth = TranslationsAuthZhCn.internal(_root);
  late final TranslationsCartZhCn cart = TranslationsCartZhCn.internal(_root);
  late final TranslationsCityZhCn city = TranslationsCityZhCn.internal(_root);
  late final TranslationsCommonZhCn common = TranslationsCommonZhCn.internal(_root);
  late final TranslationsCommunityZhCn community = TranslationsCommunityZhCn.internal(_root);
  late final TranslationsCouponZhCn coupon = TranslationsCouponZhCn.internal(_root);
  late final TranslationsDeviceZhCn device = TranslationsDeviceZhCn.internal(_root);
  late final TranslationsDeviceInfoZhCn device_info = TranslationsDeviceInfoZhCn.internal(_root);
  late final TranslationsFeedbackZhCn feedback = TranslationsFeedbackZhCn.internal(_root);
  late final TranslationsHelpZhCn help = TranslationsHelpZhCn.internal(_root);
  late final TranslationsHomeZhCn home = TranslationsHomeZhCn.internal(_root);
  late final TranslationsInviteZhCn invite = TranslationsInviteZhCn.internal(_root);
  late final TranslationsNavigationZhCn navigation = TranslationsNavigationZhCn.internal(_root);
  late final TranslationsNetworkZhCn network = TranslationsNetworkZhCn.internal(_root);
  late final TranslationsOnboardingZhCn onboarding = TranslationsOnboardingZhCn.internal(_root);
  late final TranslationsOrderZhCn order = TranslationsOrderZhCn.internal(_root);
  late final TranslationsPartnerZhCn partner = TranslationsPartnerZhCn.internal(_root);
  late final TranslationsPaymentZhCn payment = TranslationsPaymentZhCn.internal(_root);
  late final TranslationsPointsZhCn points = TranslationsPointsZhCn.internal(_root);
  late final TranslationsProductZhCn product = TranslationsProductZhCn.internal(_root);
  late final TranslationsProfileZhCn profile = TranslationsProfileZhCn.internal(_root);
  late final TranslationsSettingsZhCn settings = TranslationsSettingsZhCn.internal(_root);
  late final TranslationsSplashZhCn splash = TranslationsSplashZhCn.internal(_root);
  late final TranslationsTeamOrderingZhCn teamOrdering = TranslationsTeamOrderingZhCn.internal(_root);
  late final TranslationsTimeZhCn time = TranslationsTimeZhCn.internal(_root);
}

// Path: about
class TranslationsAboutZhCn {
  TranslationsAboutZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '关于我们'
  String get title => TranslationOverrides.string(_root.$meta, 'about.title', {}) ?? '关于我们';

  /// zh-CN: '好小乖智能盒饭售卖机'
  String get appBrand => TranslationOverrides.string(_root.$meta, 'about.appBrand', {}) ?? '好小乖智能盒饭售卖机';

  /// zh-CN: '分享给朋友'
  String get shareWithFriends => TranslationOverrides.string(_root.$meta, 'about.shareWithFriends', {}) ?? '分享给朋友';

  /// zh-CN: '我们的特色'
  String get featuresTitle => TranslationOverrides.string(_root.$meta, 'about.featuresTitle', {}) ?? '我们的特色';

  /// zh-CN: '中餐央厨'
  String get feature1Title => TranslationOverrides.string(_root.$meta, 'about.feature1Title', {}) ?? '中餐央厨';

  /// zh-CN: '售卖机为饮食生活带来的改变'
  String get feature1Desc => TranslationOverrides.string(_root.$meta, 'about.feature1Desc', {}) ?? '售卖机为饮食生活带来的改变';

  /// zh-CN: '出餐迅速'
  String get feature2Title => TranslationOverrides.string(_root.$meta, 'about.feature2Title', {}) ?? '出餐迅速';

  /// zh-CN: '区别于传统外卖和餐饮店的三维入口'
  String get feature2Desc => TranslationOverrides.string(_root.$meta, 'about.feature2Desc', {}) ?? '区别于传统外卖和餐饮店的三维入口';

  /// zh-CN: '创业搭档'
  String get feature3Title => TranslationOverrides.string(_root.$meta, 'about.feature3Title', {}) ?? '创业搭档';

  /// zh-CN: '一个无风险的投资创业利器'
  String get feature3Desc => TranslationOverrides.string(_root.$meta, 'about.feature3Desc', {}) ?? '一个无风险的投资创业利器';

  /// zh-CN: '专利机器'
  String get feature4Title => TranslationOverrides.string(_root.$meta, 'about.feature4Title', {}) ?? '专利机器';

  /// zh-CN: '世上再无穷人的造富机'
  String get feature4Desc => TranslationOverrides.string(_root.$meta, 'about.feature4Desc', {}) ?? '世上再无穷人的造富机';

  /// zh-CN: '政策条款'
  String get policyTitle => TranslationOverrides.string(_root.$meta, 'about.policyTitle', {}) ?? '政策条款';

  /// zh-CN: '用户协议与隐私政策'
  String get userAgreementAndPrivacy =>
      TranslationOverrides.string(_root.$meta, 'about.userAgreementAndPrivacy', {}) ?? '用户协议与隐私政策';

  /// zh-CN: '查看详细条款'
  String get viewDetails => TranslationOverrides.string(_root.$meta, 'about.viewDetails', {}) ?? '查看详细条款';

  /// zh-CN: '联系我们'
  String get contactTitle => TranslationOverrides.string(_root.$meta, 'about.contactTitle', {}) ?? '联系我们';

  /// zh-CN: '客服热线'
  String get customerServiceHotline =>
      TranslationOverrides.string(_root.$meta, 'about.customerServiceHotline', {}) ?? '客服热线';

  /// zh-CN: '400-114-8818'
  String get customerServiceNumber =>
      TranslationOverrides.string(_root.$meta, 'about.customerServiceNumber', {}) ?? '400-114-8818';

  /// zh-CN: '公司地址'
  String get companyAddress => TranslationOverrides.string(_root.$meta, 'about.companyAddress', {}) ?? '公司地址';

  /// zh-CN: '广东省东莞市松山湖园区科汇路1号1栋1510室'
  String get addressDetails =>
      TranslationOverrides.string(_root.$meta, 'about.addressDetails', {}) ?? '广东省东莞市松山湖园区科汇路1号1栋1510室';

  /// zh-CN: '快来使用好小乖智能盒饭售卖机吧！'
  String get shareText => TranslationOverrides.string(_root.$meta, 'about.shareText', {}) ?? '快来使用好小乖智能盒饭售卖机吧！';
}

// Path: auth
class TranslationsAuthZhCn {
  TranslationsAuthZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '欢迎回来'
  String get loginTitle => TranslationOverrides.string(_root.$meta, 'auth.loginTitle', {}) ?? '欢迎回来';

  /// zh-CN: '登录'
  String get loginButton => TranslationOverrides.string(_root.$meta, 'auth.loginButton', {}) ?? '登录';

  /// zh-CN: '注册'
  String get registerButton => TranslationOverrides.string(_root.$meta, 'auth.registerButton', {}) ?? '注册';

  /// zh-CN: '忘记密码？'
  String get forgotPassword => TranslationOverrides.string(_root.$meta, 'auth.forgotPassword', {}) ?? '忘记密码？';

  /// zh-CN: '登录失败'
  String get loginFailed => TranslationOverrides.string(_root.$meta, 'auth.loginFailed', {}) ?? '登录失败';

  /// zh-CN: '登录成功'
  String get loginSuccess => TranslationOverrides.string(_root.$meta, 'auth.loginSuccess', {}) ?? '登录成功';

  /// zh-CN: '创建账号'
  String get registerTitle => TranslationOverrides.string(_root.$meta, 'auth.registerTitle', {}) ?? '创建账号';

  /// zh-CN: '昵称'
  String get nickname => TranslationOverrides.string(_root.$meta, 'auth.nickname', {}) ?? '昵称';

  /// zh-CN: '注册成功'
  String get registerSuccess => TranslationOverrides.string(_root.$meta, 'auth.registerSuccess', {}) ?? '注册成功';

  /// zh-CN: '注册失败'
  String get registerFailed => TranslationOverrides.string(_root.$meta, 'auth.registerFailed', {}) ?? '注册失败';

  /// zh-CN: '重置密码'
  String get forgotPasswordTitle => TranslationOverrides.string(_root.$meta, 'auth.forgotPasswordTitle', {}) ?? '重置密码';

  /// zh-CN: '发送重置链接'
  String get sendResetLink => TranslationOverrides.string(_root.$meta, 'auth.sendResetLink', {}) ?? '发送重置链接';

  /// zh-CN: '重置链接已发送'
  String get resetLinkSent => TranslationOverrides.string(_root.$meta, 'auth.resetLinkSent', {}) ?? '重置链接已发送';

  /// zh-CN: '必填'
  String get required => TranslationOverrides.string(_root.$meta, 'auth.required', {}) ?? '必填';

  /// zh-CN: '请输入用户名'
  String get enterUsername => TranslationOverrides.string(_root.$meta, 'auth.enterUsername', {}) ?? '请输入用户名';

  /// zh-CN: '请输入密码'
  String get enterPassword => TranslationOverrides.string(_root.$meta, 'auth.enterPassword', {}) ?? '请输入密码';

  /// zh-CN: '请输入用户名或手机号'
  String get enterUsernameHint =>
      TranslationOverrides.string(_root.$meta, 'auth.enterUsernameHint', {}) ?? '请输入用户名或手机号';

  /// zh-CN: '请输入昵称'
  String get enterNickname => TranslationOverrides.string(_root.$meta, 'auth.enterNickname', {}) ?? '请输入昵称';

  /// zh-CN: '还没有账号？'
  String get dontHaveAccount => TranslationOverrides.string(_root.$meta, 'auth.dontHaveAccount', {}) ?? '还没有账号？';

  /// zh-CN: '请输入您的用户名或邮箱来重置密码'
  String get resetPasswordHint =>
      TranslationOverrides.string(_root.$meta, 'auth.resetPasswordHint', {}) ?? '请输入您的用户名或邮箱来重置密码';

  /// zh-CN: '用户名 / 邮箱'
  String get usernameOrEmail => TranslationOverrides.string(_root.$meta, 'auth.usernameOrEmail', {}) ?? '用户名 / 邮箱';

  /// zh-CN: '便捷购买，美味随行'
  String get slogan => TranslationOverrides.string(_root.$meta, 'auth.slogan', {}) ?? '便捷购买，美味随行';
}

// Path: cart
class TranslationsCartZhCn {
  TranslationsCartZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '购物车'
  String get title => TranslationOverrides.string(_root.$meta, 'cart.title', {}) ?? '购物车';

  /// zh-CN: '清空'
  String get clear => TranslationOverrides.string(_root.$meta, 'cart.clear', {}) ?? '清空';

  /// zh-CN: '购物车是空的'
  String get empty => TranslationOverrides.string(_root.$meta, 'cart.empty', {}) ?? '购物车是空的';

  /// zh-CN: '合计'
  String get total => TranslationOverrides.string(_root.$meta, 'cart.total', {}) ?? '合计';

  /// zh-CN: '结算'
  String get checkout => TranslationOverrides.string(_root.$meta, 'cart.checkout', {}) ?? '结算';

  /// zh-CN: '去逛逛'
  String get goShopping => TranslationOverrides.string(_root.$meta, 'cart.goShopping', {}) ?? '去逛逛';
}

// Path: city
class TranslationsCityZhCn {
  TranslationsCityZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '选择城市'
  String get title => TranslationOverrides.string(_root.$meta, 'city.title', {}) ?? '选择城市';

  /// zh-CN: '搜索城市'
  String get search => TranslationOverrides.string(_root.$meta, 'city.search', {}) ?? '搜索城市';

  /// zh-CN: '热门城市'
  String get hot => TranslationOverrides.string(_root.$meta, 'city.hot', {}) ?? '热门城市';

  /// zh-CN: '未找到相关城市'
  String get noResult => TranslationOverrides.string(_root.$meta, 'city.noResult', {}) ?? '未找到相关城市';

  /// zh-CN: '查看所有城市'
  String get viewAll => TranslationOverrides.string(_root.$meta, 'city.viewAll', {}) ?? '查看所有城市';

  /// zh-CN: '城市已切换'
  String get switchSuccess => TranslationOverrides.string(_root.$meta, 'city.switchSuccess', {}) ?? '城市已切换';

  /// zh-CN: '已切换到 ${name}'
  String switchedTo({required Object name}) =>
      TranslationOverrides.string(_root.$meta, 'city.switchedTo', {'name': name}) ?? '已切换到 ${name}';

  /// zh-CN: '切换失败'
  String get switchFailed => TranslationOverrides.string(_root.$meta, 'city.switchFailed', {}) ?? '切换失败';

  /// zh-CN: '无法保存选择的城市，请重试'
  String get saveFailed => TranslationOverrides.string(_root.$meta, 'city.saveFailed', {}) ?? '无法保存选择的城市，请重试';
}

// Path: common
class TranslationsCommonZhCn {
  TranslationsCommonZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '登录'
  String get login => TranslationOverrides.string(_root.$meta, 'common.login', {}) ?? '登录';

  /// zh-CN: '注册'
  String get register => TranslationOverrides.string(_root.$meta, 'common.register', {}) ?? '注册';

  /// zh-CN: '用户名'
  String get username => TranslationOverrides.string(_root.$meta, 'common.username', {}) ?? '用户名';

  /// zh-CN: '密码'
  String get password => TranslationOverrides.string(_root.$meta, 'common.password', {}) ?? '密码';

  /// zh-CN: '确认'
  String get confirm => TranslationOverrides.string(_root.$meta, 'common.confirm', {}) ?? '确认';

  /// zh-CN: '取消'
  String get cancel => TranslationOverrides.string(_root.$meta, 'common.cancel', {}) ?? '取消';

  /// zh-CN: '错误'
  String get error => TranslationOverrides.string(_root.$meta, 'common.error', {}) ?? '错误';

  /// zh-CN: '成功'
  String get success => TranslationOverrides.string(_root.$meta, 'common.success', {}) ?? '成功';

  /// zh-CN: '加载中...'
  String get loading => TranslationOverrides.string(_root.$meta, 'common.loading', {}) ?? '加载中...';

  /// zh-CN: '确定'
  String get ok => TranslationOverrides.string(_root.$meta, 'common.ok', {}) ?? '确定';

  /// zh-CN: '保存'
  String get save => TranslationOverrides.string(_root.$meta, 'common.save', {}) ?? '保存';

  /// zh-CN: '删除'
  String get delete => TranslationOverrides.string(_root.$meta, 'common.delete', {}) ?? '删除';

  /// zh-CN: '编辑'
  String get edit => TranslationOverrides.string(_root.$meta, 'common.edit', {}) ?? '编辑';

  /// zh-CN: '搜索'
  String get search => TranslationOverrides.string(_root.$meta, 'common.search', {}) ?? '搜索';

  /// zh-CN: '暂无数据'
  String get noData => TranslationOverrides.string(_root.$meta, 'common.noData', {}) ?? '暂无数据';

  /// zh-CN: '重试'
  String get retry => TranslationOverrides.string(_root.$meta, 'common.retry', {}) ?? '重试';

  /// zh-CN: '跳过'
  String get skip => TranslationOverrides.string(_root.$meta, 'common.skip', {}) ?? '跳过';

  /// zh-CN: '刷新'
  String get refresh => TranslationOverrides.string(_root.$meta, 'common.refresh', {}) ?? '刷新';

  /// zh-CN: '加载失败'
  String get loadFailed => TranslationOverrides.string(_root.$meta, 'common.loadFailed', {}) ?? '加载失败';

  /// zh-CN: '未知错误'
  String get unknownError => TranslationOverrides.string(_root.$meta, 'common.unknownError', {}) ?? '未知错误';

  /// zh-CN: '页面正在开发中'
  String get developing => TranslationOverrides.string(_root.$meta, 'common.developing', {}) ?? '页面正在开发中';

  /// zh-CN: '好小乖'
  String get appName => TranslationOverrides.string(_root.$meta, 'common.appName', {}) ?? '好小乖';

  /// zh-CN: '退出'
  String get logout => TranslationOverrides.string(_root.$meta, 'common.logout', {}) ?? '退出';

  /// zh-CN: '下拉刷新'
  String get pullToRefresh => TranslationOverrides.string(_root.$meta, 'common.pullToRefresh', {}) ?? '下拉刷新';

  /// zh-CN: '释放刷新'
  String get releaseToRefresh => TranslationOverrides.string(_root.$meta, 'common.releaseToRefresh', {}) ?? '释放刷新';

  /// zh-CN: '正在刷新...'
  String get refreshing => TranslationOverrides.string(_root.$meta, 'common.refreshing', {}) ?? '正在刷新...';

  /// zh-CN: '- 已经到底啦 -'
  String get noMoreData => TranslationOverrides.string(_root.$meta, 'common.noMoreData', {}) ?? '- 已经到底啦 -';

  /// zh-CN: '¥${price}'
  String price({required Object price}) =>
      TranslationOverrides.string(_root.$meta, 'common.price', {'price': price}) ?? '¥${price}';

  /// zh-CN: '网络错误：${message}'
  String networkError({required Object message}) =>
      TranslationOverrides.string(_root.$meta, 'common.networkError', {'message': message}) ?? '网络错误：${message}';

  /// zh-CN: '网络错误 (${statusCode})：${message}'
  String networkErrorWithCode({required Object statusCode, required Object message}) =>
      TranslationOverrides.string(_root.$meta, 'common.networkErrorWithCode', {
        'statusCode': statusCode,
        'message': message,
      }) ??
      '网络错误 (${statusCode})：${message}';

  /// zh-CN: '服务器错误 (${statusCode})：${message}'
  String serverError({required Object statusCode, required Object message}) =>
      TranslationOverrides.string(_root.$meta, 'common.serverError', {'statusCode': statusCode, 'message': message}) ??
      '服务器错误 (${statusCode})：${message}';

  /// zh-CN: '缓存错误：${message}'
  String cacheError({required Object message}) =>
      TranslationOverrides.string(_root.$meta, 'common.cacheError', {'message': message}) ?? '缓存错误：${message}';

  /// zh-CN: '未找到：${resource}'
  String notFound({required Object resource}) =>
      TranslationOverrides.string(_root.$meta, 'common.notFound', {'resource': resource}) ?? '未找到：${resource}';

  /// zh-CN: '未授权，请重新登录'
  String get unauthorized => TranslationOverrides.string(_root.$meta, 'common.unauthorized', {}) ?? '未授权，请重新登录';

  /// zh-CN: '验证错误：${message}'
  String validationError({required Object message}) =>
      TranslationOverrides.string(_root.$meta, 'common.validationError', {'message': message}) ?? '验证错误：${message}';

  /// zh-CN: '验证错误：${message} (${errors})'
  String validationErrorWithDetails({required Object message, required Object errors}) =>
      TranslationOverrides.string(_root.$meta, 'common.validationErrorWithDetails', {
        'message': message,
        'errors': errors,
      }) ??
      '验证错误：${message} (${errors})';
}

// Path: community
class TranslationsCommunityZhCn {
  TranslationsCommunityZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '社群福利'
  String get title => TranslationOverrides.string(_root.$meta, 'community.title', {}) ?? '社群福利';

  /// zh-CN: '加入社群'
  String get join => TranslationOverrides.string(_root.$meta, 'community.join', {}) ?? '加入社群';

  /// zh-CN: '与美食爱好者一起分享美味'
  String get share => TranslationOverrides.string(_root.$meta, 'community.share', {}) ?? '与美食爱好者一起分享美味';

  /// zh-CN: '东莞中科云计算研究院'
  String get org => TranslationOverrides.string(_root.$meta, 'community.org', {}) ?? '东莞中科云计算研究院';

  /// zh-CN: '云计算中心'
  String get dept => TranslationOverrides.string(_root.$meta, 'community.dept', {}) ?? '云计算中心';

  /// zh-CN: '扫码加入东莞中科云计算研究院'
  String get scanHint => TranslationOverrides.string(_root.$meta, 'community.scanHint', {}) ?? '扫码加入东莞中科云计算研究院';

  late final TranslationsCommunityFeaturesZhCn features = TranslationsCommunityFeaturesZhCn.internal(_root);

  /// zh-CN: '为什么加入我们的社群？'
  String get whyJoin => TranslationOverrides.string(_root.$meta, 'community.whyJoin', {}) ?? '为什么加入我们的社群？';

  /// zh-CN: '每日美食推荐，让你不再纠结吃什么'
  String get reason1 => TranslationOverrides.string(_root.$meta, 'community.reason1', {}) ?? '每日美食推荐，让你不再纠结吃什么';

  /// zh-CN: '限时优惠活动，省钱又省心'
  String get reason2 => TranslationOverrides.string(_root.$meta, 'community.reason2', {}) ?? '限时优惠活动，省钱又省心';

  /// zh-CN: '专业美食测评，帮你避坑'
  String get reason3 => TranslationOverrides.string(_root.$meta, 'community.reason3', {}) ?? '专业美食测评，帮你避坑';

  /// zh-CN: '美食制作教程，在家也能做出美味'
  String get reason4 => TranslationOverrides.string(_root.$meta, 'community.reason4', {}) ?? '美食制作教程，在家也能做出美味';
}

// Path: coupon
class TranslationsCouponZhCn {
  TranslationsCouponZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '优惠券'
  String get title => TranslationOverrides.string(_root.$meta, 'coupon.title', {}) ?? '优惠券';

  late final TranslationsCouponTabsZhCn tabs = TranslationsCouponTabsZhCn.internal(_root);

  /// zh-CN: '¥'
  String get unit => TranslationOverrides.string(_root.$meta, 'coupon.unit', {}) ?? '¥';

  /// zh-CN: '满减券 满${amount}元可用'
  String condition({required Object amount}) =>
      TranslationOverrides.string(_root.$meta, 'coupon.condition', {'amount': amount}) ?? '满减券\n满${amount}元可用';

  /// zh-CN: '满减券 满0元可用'
  String get conditionNoThreshold =>
      TranslationOverrides.string(_root.$meta, 'coupon.conditionNoThreshold', {}) ?? '满减券\n满0元可用';

  /// zh-CN: '长期有效'
  String get validForever => TranslationOverrides.string(_root.$meta, 'coupon.validForever', {}) ?? '长期有效';

  /// zh-CN: '立即领取'
  String get btnReceive => TranslationOverrides.string(_root.$meta, 'coupon.btnReceive', {}) ?? '立即领取';

  /// zh-CN: '已领取'
  String get btnReceived => TranslationOverrides.string(_root.$meta, 'coupon.btnReceived', {}) ?? '已领取';

  /// zh-CN: '去使用'
  String get btnUse => TranslationOverrides.string(_root.$meta, 'coupon.btnUse', {}) ?? '去使用';

  /// zh-CN: '已过期'
  String get btnExpired => TranslationOverrides.string(_root.$meta, 'coupon.btnExpired', {}) ?? '已过期';

  /// zh-CN: '${amount}元优惠券'
  String discount({required Object amount}) =>
      TranslationOverrides.string(_root.$meta, 'coupon.discount', {'amount': amount}) ?? '${amount}元优惠券';

  /// zh-CN: '${amount}元减免券'
  String discountOff({required Object amount}) =>
      TranslationOverrides.string(_root.$meta, 'coupon.discountOff', {'amount': amount}) ?? '${amount}元减免券';

  /// zh-CN: '暂无优惠券'
  String get noCoupons => TranslationOverrides.string(_root.$meta, 'coupon.noCoupons', {}) ?? '暂无优惠券';

  /// zh-CN: '有效期至：'
  String get expiryPrefix => TranslationOverrides.string(_root.$meta, 'coupon.expiryPrefix', {}) ?? '有效期至：';

  /// zh-CN: '可用'
  String get statusAvailable => TranslationOverrides.string(_root.$meta, 'coupon.statusAvailable', {}) ?? '可用';

  /// zh-CN: '不可用'
  String get statusUnavailable => TranslationOverrides.string(_root.$meta, 'coupon.statusUnavailable', {}) ?? '不可用';
}

// Path: device
class TranslationsDeviceZhCn {
  TranslationsDeviceZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '取餐机'
  String get title => TranslationOverrides.string(_root.$meta, 'device.title', {}) ?? '取餐机';

  /// zh-CN: '设备信息'
  String get info => TranslationOverrides.string(_root.$meta, 'device.info', {}) ?? '设备信息';

  /// zh-CN: '地址'
  String get address => TranslationOverrides.string(_root.$meta, 'device.address', {}) ?? '地址';

  /// zh-CN: '距离'
  String get distance => TranslationOverrides.string(_root.$meta, 'device.distance', {}) ?? '距离';

  /// zh-CN: '状态'
  String get status => TranslationOverrides.string(_root.$meta, 'device.status', {}) ?? '状态';

  /// zh-CN: '营业中'
  String get statusOnline => TranslationOverrides.string(_root.$meta, 'device.statusOnline', {}) ?? '营业中';

  /// zh-CN: '休息中'
  String get statusOffline => TranslationOverrides.string(_root.$meta, 'device.statusOffline', {}) ?? '休息中';

  /// zh-CN: '营业中'
  String get online => TranslationOverrides.string(_root.$meta, 'device.online', {}) ?? '营业中';

  /// zh-CN: '休息中'
  String get offline => TranslationOverrides.string(_root.$meta, 'device.offline', {}) ?? '休息中';

  /// zh-CN: '支付方式：'
  String get paymentMethods => TranslationOverrides.string(_root.$meta, 'device.paymentMethods', {}) ?? '支付方式：';

  /// zh-CN: '移动支付'
  String get mobilePayment => TranslationOverrides.string(_root.$meta, 'device.mobilePayment', {}) ?? '移动支付';

  /// zh-CN: '现金'
  String get cash => TranslationOverrides.string(_root.$meta, 'device.cash', {}) ?? '现金';

  /// zh-CN: '暂无商品'
  String get noProducts => TranslationOverrides.string(_root.$meta, 'device.noProducts', {}) ?? '暂无商品';

  /// zh-CN: '商品列表'
  String get productList => TranslationOverrides.string(_root.$meta, 'device.productList', {}) ?? '商品列表';

  /// zh-CN: '已售罄'
  String get soldOut => TranslationOverrides.string(_root.$meta, 'device.soldOut', {}) ?? '已售罄';

  /// zh-CN: '上报故障'
  String get reportIssue => TranslationOverrides.string(_root.$meta, 'device.reportIssue', {}) ?? '上报故障';

  /// zh-CN: '上报设备故障'
  String get reportDeviceIssue => TranslationOverrides.string(_root.$meta, 'device.reportDeviceIssue', {}) ?? '上报设备故障';

  /// zh-CN: '请描述设备故障情况...'
  String get reportIssueHint =>
      TranslationOverrides.string(_root.$meta, 'device.reportIssueHint', {}) ?? '请描述设备故障情况...';

  /// zh-CN: '故障上报成功'
  String get reportSuccess => TranslationOverrides.string(_root.$meta, 'device.reportSuccess', {}) ?? '故障上报成功';

  /// zh-CN: '加载失败: ${error}'
  String loadFailed({required Object error}) =>
      TranslationOverrides.string(_root.$meta, 'device.loadFailed', {'error': error}) ?? '加载失败: ${error}';

  /// zh-CN: '加载商品失败: ${error}'
  String loadProductsFailed({required Object error}) =>
      TranslationOverrides.string(_root.$meta, 'device.loadProductsFailed', {'error': error}) ?? '加载商品失败: ${error}';

  /// zh-CN: '点餐'
  String get menu => TranslationOverrides.string(_root.$meta, 'device.menu', {}) ?? '点餐';

  /// zh-CN: '经典菜单'
  String get classicMenu => TranslationOverrides.string(_root.$meta, 'device.classicMenu', {}) ?? '经典菜单';

  /// zh-CN: '限时优惠'
  String get limitedDiscount => TranslationOverrides.string(_root.$meta, 'device.limitedDiscount', {}) ?? '限时优惠';

  /// zh-CN: '月售 ${count}'
  String monthlySales({required Object count}) =>
      TranslationOverrides.string(_root.$meta, 'device.monthlySales', {'count': count}) ?? '月售 ${count}';

  /// zh-CN: '剩余 ${count}'
  String stock({required Object count}) =>
      TranslationOverrides.string(_root.$meta, 'device.stock', {'count': count}) ?? '剩余 ${count}';

  /// zh-CN: '已售罄'
  String get soldOutLabel => TranslationOverrides.string(_root.$meta, 'device.soldOutLabel', {}) ?? '已售罄';

  /// zh-CN: '自取点餐'
  String get selfPickupOrder => TranslationOverrides.string(_root.$meta, 'device.selfPickupOrder', {}) ?? '自取点餐';

  /// zh-CN: '已选商品'
  String get selectedProducts => TranslationOverrides.string(_root.$meta, 'device.selectedProducts', {}) ?? '已选商品';

  /// zh-CN: '小计'
  String get subtotal => TranslationOverrides.string(_root.$meta, 'device.subtotal', {}) ?? '小计';

  /// zh-CN: '预估到手'
  String get estimatedPrice => TranslationOverrides.string(_root.$meta, 'device.estimatedPrice', {}) ?? '预估到手';

  /// zh-CN: '原价'
  String get originalPrice => TranslationOverrides.string(_root.$meta, 'device.originalPrice', {}) ?? '原价';

  /// zh-CN: '附近营业点'
  String get nearby => TranslationOverrides.string(_root.$meta, 'device.nearby', {}) ?? '附近营业点';

  /// zh-CN: '常去营业点'
  String get frequent => TranslationOverrides.string(_root.$meta, 'device.frequent', {}) ?? '常去营业点';

  /// zh-CN: '按距离排序'
  String get sortByDistance => TranslationOverrides.string(_root.$meta, 'device.sortByDistance', {}) ?? '按距离排序';

  /// zh-CN: '按名称排序'
  String get sortByName => TranslationOverrides.string(_root.$meta, 'device.sortByName', {}) ?? '按名称排序';

  /// zh-CN: '仅显示在线设备'
  String get filterOnline => TranslationOverrides.string(_root.$meta, 'device.filterOnline', {}) ?? '仅显示在线设备';

  /// zh-CN: '附近暂无设备'
  String get noDevicesNearby => TranslationOverrides.string(_root.$meta, 'device.noDevicesNearby', {}) ?? '附近暂无设备';

  /// zh-CN: '维护中'
  String get maintenance => TranslationOverrides.string(_root.$meta, 'device.maintenance', {}) ?? '维护中';

  /// zh-CN: '未知'
  String get unknown => TranslationOverrides.string(_root.$meta, 'device.unknown', {}) ?? '未知';

  /// zh-CN: '现金支付'
  String get cashPayment => TranslationOverrides.string(_root.$meta, 'device.cashPayment', {}) ?? '现金支付';

  /// zh-CN: '已启用'
  String get enabled => TranslationOverrides.string(_root.$meta, 'device.enabled', {}) ?? '已启用';

  /// zh-CN: '已加载 ${count} 个常用设备'
  String loadedFrequent({required Object count}) =>
      TranslationOverrides.string(_root.$meta, 'device.loadedFrequent', {'count': count}) ?? '已加载 ${count} 个常用设备';

  /// zh-CN: '暂无常去营业点'
  String get noFrequentDevices => TranslationOverrides.string(_root.$meta, 'device.noFrequentDevices', {}) ?? '暂无常去营业点';

  /// zh-CN: '暂无附近营业点'
  String get noNearbyDevices => TranslationOverrides.string(_root.$meta, 'device.noNearbyDevices', {}) ?? '暂无附近营业点';

  /// zh-CN: '09:00-18:00'
  String get businessHoursDefault =>
      TranslationOverrides.string(_root.$meta, 'device.businessHoursDefault', {}) ?? '09:00-18:00';
}

// Path: device_info
class TranslationsDeviceInfoZhCn {
  TranslationsDeviceInfoZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '浏览器'
  String get browser => TranslationOverrides.string(_root.$meta, 'device_info.browser', {}) ?? '浏览器';

  /// zh-CN: '平台'
  String get platform => TranslationOverrides.string(_root.$meta, 'device_info.platform', {}) ?? '平台';

  /// zh-CN: 'User Agent'
  String get userAgent => TranslationOverrides.string(_root.$meta, 'device_info.userAgent', {}) ?? 'User Agent';

  /// zh-CN: '语言'
  String get language => TranslationOverrides.string(_root.$meta, 'device_info.language', {}) ?? '语言';

  /// zh-CN: '内存'
  String get memory => TranslationOverrides.string(_root.$meta, 'device_info.memory', {}) ?? '内存';

  /// zh-CN: '品牌'
  String get brand => TranslationOverrides.string(_root.$meta, 'device_info.brand', {}) ?? '品牌';

  /// zh-CN: '型号'
  String get model => TranslationOverrides.string(_root.$meta, 'device_info.model', {}) ?? '型号';

  /// zh-CN: '系统版本'
  String get systemVersion => TranslationOverrides.string(_root.$meta, 'device_info.systemVersion', {}) ?? '系统版本';

  /// zh-CN: 'SDK版本'
  String get sdkVersion => TranslationOverrides.string(_root.$meta, 'device_info.sdkVersion', {}) ?? 'SDK版本';

  /// zh-CN: '厂商'
  String get manufacturer => TranslationOverrides.string(_root.$meta, 'device_info.manufacturer', {}) ?? '厂商';

  /// zh-CN: '硬件'
  String get hardware => TranslationOverrides.string(_root.$meta, 'device_info.hardware', {}) ?? '硬件';

  /// zh-CN: '主机'
  String get host => TranslationOverrides.string(_root.$meta, 'device_info.host', {}) ?? '主机';

  /// zh-CN: 'ID'
  String get id => TranslationOverrides.string(_root.$meta, 'device_info.id', {}) ?? 'ID';

  /// zh-CN: '名称'
  String get name => TranslationOverrides.string(_root.$meta, 'device_info.name', {}) ?? '名称';

  /// zh-CN: '系统名'
  String get systemName => TranslationOverrides.string(_root.$meta, 'device_info.systemName', {}) ?? '系统名';

  /// zh-CN: '机器码'
  String get machine => TranslationOverrides.string(_root.$meta, 'device_info.machine', {}) ?? '机器码';

  /// zh-CN: '唯一ID'
  String get uniqueId => TranslationOverrides.string(_root.$meta, 'device_info.uniqueId', {}) ?? '唯一ID';
}

// Path: feedback
class TranslationsFeedbackZhCn {
  TranslationsFeedbackZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '问题反馈'
  String get title => TranslationOverrides.string(_root.$meta, 'feedback.title', {}) ?? '问题反馈';

  /// zh-CN: '您的反馈是我们进步的动力'
  String get subtitle => TranslationOverrides.string(_root.$meta, 'feedback.subtitle', {}) ?? '您的反馈是我们进步的动力';

  /// zh-CN: '选择反馈类型'
  String get selectType => TranslationOverrides.string(_root.$meta, 'feedback.selectType', {}) ?? '选择反馈类型';

  /// zh-CN: '错误报告'
  String get errorReport => TranslationOverrides.string(_root.$meta, 'feedback.errorReport', {}) ?? '错误报告';

  /// zh-CN: '建议'
  String get suggestion => TranslationOverrides.string(_root.$meta, 'feedback.suggestion', {}) ?? '建议';

  /// zh-CN: '投诉'
  String get complaint => TranslationOverrides.string(_root.$meta, 'feedback.complaint', {}) ?? '投诉';

  /// zh-CN: '其他'
  String get other => TranslationOverrides.string(_root.$meta, 'feedback.other', {}) ?? '其他';

  /// zh-CN: '问题描述'
  String get description => TranslationOverrides.string(_root.$meta, 'feedback.description', {}) ?? '问题描述';

  /// zh-CN: '请输入问题标题 (必填)'
  String get titleHint => TranslationOverrides.string(_root.$meta, 'feedback.titleHint', {}) ?? '请输入问题标题 (必填)';

  /// zh-CN: '请详细描述您遇到的问题或建议 (必填)'
  String get contentHint =>
      TranslationOverrides.string(_root.$meta, 'feedback.contentHint', {}) ?? '请详细描述您遇到的问题或建议 (必填)';

  /// zh-CN: '上传截图 (可选)'
  String get uploadScreenshot =>
      TranslationOverrides.string(_root.$meta, 'feedback.uploadScreenshot', {}) ?? '上传截图 (可选)';

  /// zh-CN: '添加图片'
  String get addImage => TranslationOverrides.string(_root.$meta, 'feedback.addImage', {}) ?? '添加图片';

  /// zh-CN: '最多可上传3张图片，每张不超过2MB，支持jpg、png格式'
  String get uploadLimitHint =>
      TranslationOverrides.string(_root.$meta, 'feedback.uploadLimitHint', {}) ?? '最多可上传3张图片，每张不超过2MB，支持jpg、png格式';

  /// zh-CN: '联系方式 (可选)'
  String get contactOptional => TranslationOverrides.string(_root.$meta, 'feedback.contactOptional', {}) ?? '联系方式 (可选)';

  /// zh-CN: '请输入您的手机号或邮箱，方便我们联系您'
  String get contactInputHint =>
      TranslationOverrides.string(_root.$meta, 'feedback.contactInputHint', {}) ?? '请输入您的手机号或邮箱，方便我们联系您';

  /// zh-CN: '提交反馈'
  String get submit => TranslationOverrides.string(_root.$meta, 'feedback.submit', {}) ?? '提交反馈';

  /// zh-CN: '反馈提交成功，感谢您的支持'
  String get submitSuccess => TranslationOverrides.string(_root.$meta, 'feedback.submitSuccess', {}) ?? '反馈提交成功，感谢您的支持';

  /// zh-CN: '反馈提交失败，请稍后重试'
  String get submitFailed => TranslationOverrides.string(_root.$meta, 'feedback.submitFailed', {}) ?? '反馈提交失败，请稍后重试';
}

// Path: help
class TranslationsHelpZhCn {
  TranslationsHelpZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '帮助中心'
  String get title => TranslationOverrides.string(_root.$meta, 'help.title', {}) ?? '帮助中心';

  /// zh-CN: '帮助页面正在开发中'
  String get developing => TranslationOverrides.string(_root.$meta, 'help.developing', {}) ?? '帮助页面正在开发中';
}

// Path: home
class TranslationsHomeZhCn {
  TranslationsHomeZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '选择城市'
  String get selectCity => TranslationOverrides.string(_root.$meta, 'home.selectCity', {}) ?? '选择城市';

  /// zh-CN: '附近设备'
  String get nearbyDevices => TranslationOverrides.string(_root.$meta, 'home.nearbyDevices', {}) ?? '附近设备';

  /// zh-CN: '便捷购买'
  String get banner1Title => TranslationOverrides.string(_root.$meta, 'home.banner1Title', {}) ?? '便捷购买';

  /// zh-CN: '美味随行'
  String get banner1Subtitle => TranslationOverrides.string(_root.$meta, 'home.banner1Subtitle', {}) ?? '美味随行';

  /// zh-CN: '新鲜速递'
  String get banner2Title => TranslationOverrides.string(_root.$meta, 'home.banner2Title', {}) ?? '新鲜速递';

  /// zh-CN: '每日更新'
  String get banner2Subtitle => TranslationOverrides.string(_root.$meta, 'home.banner2Subtitle', {}) ?? '每日更新';

  /// zh-CN: '超值优惠'
  String get banner3Title => TranslationOverrides.string(_root.$meta, 'home.banner3Title', {}) ?? '超值优惠';

  /// zh-CN: '限时特价'
  String get banner3Subtitle => TranslationOverrides.string(_root.$meta, 'home.banner3Subtitle', {}) ?? '限时特价';

  /// zh-CN: '附近暂无设备'
  String get noDevices => TranslationOverrides.string(_root.$meta, 'home.noDevices', {}) ?? '附近暂无设备';

  /// zh-CN: '您好，好小乖用户'
  String get welcome => TranslationOverrides.string(_root.$meta, 'home.welcome', {}) ?? '您好，好小乖用户';

  /// zh-CN: '自取点餐'
  String get selfPickup => TranslationOverrides.string(_root.$meta, 'home.selfPickup', {}) ?? '自取点餐';

  /// zh-CN: '扫码取餐/打包带走'
  String get selfPickupHint => TranslationOverrides.string(_root.$meta, 'home.selfPickupHint', {}) ?? '扫码取餐/打包带走';

  /// zh-CN: '团队点餐'
  String get teamOrder => TranslationOverrides.string(_root.$meta, 'home.teamOrder', {}) ?? '团队点餐';

  /// zh-CN: '多人订购/团队点餐'
  String get teamOrderHint => TranslationOverrides.string(_root.$meta, 'home.teamOrderHint', {}) ?? '多人订购/团队点餐';

  /// zh-CN: '邀请有礼'
  String get invite => TranslationOverrides.string(_root.$meta, 'home.invite', {}) ?? '邀请有礼';

  /// zh-CN: '邀请好友得现金'
  String get inviteHint => TranslationOverrides.string(_root.$meta, 'home.inviteHint', {}) ?? '邀请好友得现金';

  /// zh-CN: '为我推荐'
  String get recommendTitle => TranslationOverrides.string(_root.$meta, 'home.recommendTitle', {}) ?? '为我推荐';

  late final TranslationsHomeGridZhCn grid = TranslationsHomeGridZhCn.internal(_root);
  late final TranslationsHomeLotteryZhCn lottery = TranslationsHomeLotteryZhCn.internal(_root);
  late final TranslationsHomeStatusZhCn status = TranslationsHomeStatusZhCn.internal(_root);
}

// Path: invite
class TranslationsInviteZhCn {
  TranslationsInviteZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '邀请好友'
  String get title => TranslationOverrides.string(_root.$meta, 'invite.title', {}) ?? '邀请好友';

  /// zh-CN: '规则'
  String get ruleBtn => TranslationOverrides.string(_root.$meta, 'invite.ruleBtn', {}) ?? '规则';

  /// zh-CN: '1元'
  String get rewardTitle => TranslationOverrides.string(_root.$meta, 'invite.rewardTitle', {}) ?? '1元';

  /// zh-CN: '无门槛券'
  String get rewardSubtitle => TranslationOverrides.string(_root.$meta, 'invite.rewardSubtitle', {}) ?? '无门槛券';

  /// zh-CN: '每邀请1个人重复可得'
  String get rewardDesc => TranslationOverrides.string(_root.$meta, 'invite.rewardDesc', {}) ?? '每邀请1个人重复可得';

  /// zh-CN: '我的邀请码'
  String get myCode => TranslationOverrides.string(_root.$meta, 'invite.myCode', {}) ?? '我的邀请码';

  /// zh-CN: '复制'
  String get copy => TranslationOverrides.string(_root.$meta, 'invite.copy', {}) ?? '复制';

  /// zh-CN: '邀请微信好友'
  String get btnInvite => TranslationOverrides.string(_root.$meta, 'invite.btnInvite', {}) ?? '邀请微信好友';

  /// zh-CN: '邀请流程'
  String get processTitle => TranslationOverrides.string(_root.$meta, 'invite.processTitle', {}) ?? '邀请流程';

  /// zh-CN: '分享链接'
  String get step1 => TranslationOverrides.string(_root.$meta, 'invite.step1', {}) ?? '分享链接';

  /// zh-CN: '给好友'
  String get step1Desc => TranslationOverrides.string(_root.$meta, 'invite.step1Desc', {}) ?? '给好友';

  /// zh-CN: '好友注册'
  String get step2 => TranslationOverrides.string(_root.$meta, 'invite.step2', {}) ?? '好友注册';

  /// zh-CN: '得新人礼包'
  String get step2Desc => TranslationOverrides.string(_root.$meta, 'invite.step2Desc', {}) ?? '得新人礼包';

  /// zh-CN: '好友首单'
  String get step3 => TranslationOverrides.string(_root.$meta, 'invite.step3', {}) ?? '好友首单';

  /// zh-CN: '实付≥5元'
  String get step3Desc => TranslationOverrides.string(_root.$meta, 'invite.step3Desc', {}) ?? '实付≥5元';

  /// zh-CN: '邀请达成'
  String get step4 => TranslationOverrides.string(_root.$meta, 'invite.step4', {}) ?? '邀请达成';

  /// zh-CN: '获得奖励'
  String get step4Desc => TranslationOverrides.string(_root.$meta, 'invite.step4Desc', {}) ?? '获得奖励';

  /// zh-CN: '我的成就'
  String get stats => TranslationOverrides.string(_root.$meta, 'invite.stats', {}) ?? '我的成就';

  /// zh-CN: '已成功邀请(人)'
  String get invitedCount => TranslationOverrides.string(_root.$meta, 'invite.invitedCount', {}) ?? '已成功邀请(人)';

  /// zh-CN: '已获得奖励(元)'
  String get rewardAmount => TranslationOverrides.string(_root.$meta, 'invite.rewardAmount', {}) ?? '已获得奖励(元)';

  late final TranslationsInviteRulesZhCn rules = TranslationsInviteRulesZhCn.internal(_root);
}

// Path: navigation
class TranslationsNavigationZhCn {
  TranslationsNavigationZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '首页'
  String get home => TranslationOverrides.string(_root.$meta, 'navigation.home', {}) ?? '首页';

  /// zh-CN: '设备'
  String get device => TranslationOverrides.string(_root.$meta, 'navigation.device', {}) ?? '设备';

  /// zh-CN: '订单'
  String get orders => TranslationOverrides.string(_root.$meta, 'navigation.orders', {}) ?? '订单';

  /// zh-CN: '个人中心'
  String get profile => TranslationOverrides.string(_root.$meta, 'navigation.profile', {}) ?? '个人中心';
}

// Path: network
class TranslationsNetworkZhCn {
  TranslationsNetworkZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsNetworkErrorsZhCn errors = TranslationsNetworkErrorsZhCn.internal(_root);
}

// Path: onboarding
class TranslationsOnboardingZhCn {
  TranslationsOnboardingZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '欢迎使用饭盒售货机'
  String get welcomeTitle => TranslationOverrides.string(_root.$meta, 'onboarding.welcomeTitle', {}) ?? '欢迎使用饭盒售货机';

  /// zh-CN: '随时随地，轻松购买美味午餐'
  String get welcomeBody => TranslationOverrides.string(_root.$meta, 'onboarding.welcomeBody', {}) ?? '随时随地，轻松购买美味午餐';

  /// zh-CN: '查找附近设备'
  String get findDevicesTitle =>
      TranslationOverrides.string(_root.$meta, 'onboarding.findDevicesTitle', {}) ?? '查找附近设备';

  /// zh-CN: '快速定位最近的售货机，节省您的时间'
  String get findDevicesBody =>
      TranslationOverrides.string(_root.$meta, 'onboarding.findDevicesBody', {}) ?? '快速定位最近的售货机，节省您的时间';

  /// zh-CN: '便捷支付'
  String get paymentTitle => TranslationOverrides.string(_root.$meta, 'onboarding.paymentTitle', {}) ?? '便捷支付';

  /// zh-CN: '支持信用卡等多种便捷支付方式'
  String get paymentBody => TranslationOverrides.string(_root.$meta, 'onboarding.paymentBody', {}) ?? '支持信用卡等多种便捷支付方式';

  /// zh-CN: '开始使用'
  String get getStarted => TranslationOverrides.string(_root.$meta, 'onboarding.getStarted', {}) ?? '开始使用';
}

// Path: order
class TranslationsOrderZhCn {
  TranslationsOrderZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '我的订单'
  String get myOrders => TranslationOverrides.string(_root.$meta, 'order.myOrders', {}) ?? '我的订单';

  /// zh-CN: '食品订单'
  String get foodOrder => TranslationOverrides.string(_root.$meta, 'order.foodOrder', {}) ?? '食品订单';

  /// zh-CN: '商城订单'
  String get mallOrder => TranslationOverrides.string(_root.$meta, 'order.mallOrder', {}) ?? '商城订单';

  /// zh-CN: '暂无订单'
  String get noOrders => TranslationOverrides.string(_root.$meta, 'order.noOrders', {}) ?? '暂无订单';

  /// zh-CN: '订单详情'
  String get detail => TranslationOverrides.string(_root.$meta, 'order.detail', {}) ?? '订单详情';

  late final TranslationsOrderStatusZhCn status = TranslationsOrderStatusZhCn.internal(_root);

  /// zh-CN: '订单将于今晚10点30分过期'
  String get expiryHint => TranslationOverrides.string(_root.$meta, 'order.expiryHint', {}) ?? '订单将于今晚10点30分过期';

  /// zh-CN: '取货码'
  String get pickupCode => TranslationOverrides.string(_root.$meta, 'order.pickupCode', {}) ?? '取货码';

  /// zh-CN: '请在设备上输入取货码取货'
  String get pickupHint => TranslationOverrides.string(_root.$meta, 'order.pickupHint', {}) ?? '请在设备上输入取货码取货';

  /// zh-CN: '商品清单'
  String get items => TranslationOverrides.string(_root.$meta, 'order.items', {}) ?? '商品清单';

  /// zh-CN: '订单信息'
  String get info => TranslationOverrides.string(_root.$meta, 'order.info', {}) ?? '订单信息';

  /// zh-CN: '订单号'
  String get id => TranslationOverrides.string(_root.$meta, 'order.id', {}) ?? '订单号';

  /// zh-CN: '创建时间'
  String get createdAt => TranslationOverrides.string(_root.$meta, 'order.createdAt', {}) ?? '创建时间';

  /// zh-CN: '支付时间'
  String get paidAt => TranslationOverrides.string(_root.$meta, 'order.paidAt', {}) ?? '支付时间';

  /// zh-CN: '支付方式'
  String get paymentMethod => TranslationOverrides.string(_root.$meta, 'order.paymentMethod', {}) ?? '支付方式';

  /// zh-CN: '订单总额'
  String get totalAmount => TranslationOverrides.string(_root.$meta, 'order.totalAmount', {}) ?? '订单总额';

  /// zh-CN: '未知'
  String get unknown => TranslationOverrides.string(_root.$meta, 'order.unknown', {}) ?? '未知';

  /// zh-CN: '刷新'
  String get refresh => TranslationOverrides.string(_root.$meta, 'order.refresh', {}) ?? '刷新';

  /// zh-CN: '等${count}件商品'
  String itemsCount({required Object count}) =>
      TranslationOverrides.string(_root.$meta, 'order.itemsCount', {'count': count}) ?? '等${count}件商品';

  /// zh-CN: '订单号：'
  String get orderIdLabel => TranslationOverrides.string(_root.$meta, 'order.orderIdLabel', {}) ?? '订单号：';

  /// zh-CN: '订单金额'
  String get orderAmount => TranslationOverrides.string(_root.$meta, 'order.orderAmount', {}) ?? '订单金额';

  /// zh-CN: '立即支付'
  String get payNow => TranslationOverrides.string(_root.$meta, 'order.payNow', {}) ?? '立即支付';

  /// zh-CN: '取消订单'
  String get cancelOrder => TranslationOverrides.string(_root.$meta, 'order.cancelOrder', {}) ?? '取消订单';

  /// zh-CN: '联系客服'
  String get contactService => TranslationOverrides.string(_root.$meta, 'order.contactService', {}) ?? '联系客服';

  /// zh-CN: '申请退款'
  String get applyRefund => TranslationOverrides.string(_root.$meta, 'order.applyRefund', {}) ?? '申请退款';

  /// zh-CN: 'Stripe (信用卡)'
  String get paymentStripe => TranslationOverrides.string(_root.$meta, 'order.paymentStripe', {}) ?? 'Stripe (信用卡)';

  /// zh-CN: '微信支付'
  String get paymentWechat => TranslationOverrides.string(_root.$meta, 'order.paymentWechat', {}) ?? '微信支付';

  /// zh-CN: '支付宝'
  String get paymentAlipay => TranslationOverrides.string(_root.$meta, 'order.paymentAlipay', {}) ?? '支付宝';

  /// zh-CN: '查看详情'
  String get viewDetail => TranslationOverrides.string(_root.$meta, 'order.viewDetail', {}) ?? '查看详情';

  /// zh-CN: '确认取消'
  String get cancelConfirmTitle => TranslationOverrides.string(_root.$meta, 'order.cancelConfirmTitle', {}) ?? '确认取消';

  /// zh-CN: '确定要取消这个订单吗？'
  String get cancelConfirmContent =>
      TranslationOverrides.string(_root.$meta, 'order.cancelConfirmContent', {}) ?? '确定要取消这个订单吗？';

  /// zh-CN: '订单已取消'
  String get orderCancelled => TranslationOverrides.string(_root.$meta, 'order.orderCancelled', {}) ?? '订单已取消';

  /// zh-CN: '确认订单'
  String get confirmOrder => TranslationOverrides.string(_root.$meta, 'order.confirmOrder', {}) ?? '确认订单';

  /// zh-CN: '实付金额'
  String get actualAmount => TranslationOverrides.string(_root.$meta, 'order.actualAmount', {}) ?? '实付金额';

  /// zh-CN: '合计: '
  String get totalLabel => TranslationOverrides.string(_root.$meta, 'order.totalLabel', {}) ?? '合计: ';

  /// zh-CN: '提交订单'
  String get submitOrder => TranslationOverrides.string(_root.$meta, 'order.submitOrder', {}) ?? '提交订单';

  /// zh-CN: '创建订单失败: ${error}'
  String createFailed({required Object error}) =>
      TranslationOverrides.string(_root.$meta, 'order.createFailed', {'error': error}) ?? '创建订单失败: ${error}';

  /// zh-CN: '重试'
  String get retry => TranslationOverrides.string(_root.$meta, 'order.retry', {}) ?? '重试';

  /// zh-CN: '加载失败: ${error}'
  String loadFailed({required Object error}) =>
      TranslationOverrides.string(_root.$meta, 'order.loadFailed', {'error': error}) ?? '加载失败: ${error}';

  /// zh-CN: '规格：${specs}'
  String specs({required Object specs}) =>
      TranslationOverrides.string(_root.$meta, 'order.specs', {'specs': specs}) ?? '规格：${specs}';

  /// zh-CN: '共${count}件 合计：'
  String summary({required Object count}) =>
      TranslationOverrides.string(_root.$meta, 'order.summary', {'count': count}) ?? '共${count}件 合计：';

  /// zh-CN: '退款'
  String get refund => TranslationOverrides.string(_root.$meta, 'order.refund', {}) ?? '退款';

  /// zh-CN: '查看券码'
  String get viewCode => TranslationOverrides.string(_root.$meta, 'order.viewCode', {}) ?? '查看券码';

  /// zh-CN: '删除订单'
  String get deleteOrder => TranslationOverrides.string(_root.$meta, 'order.deleteOrder', {}) ?? '删除订单';

  /// zh-CN: '重新购买'
  String get reorder => TranslationOverrides.string(_root.$meta, 'order.reorder', {}) ?? '重新购买';

  /// zh-CN: '支付成功'
  String get paySuccess => TranslationOverrides.string(_root.$meta, 'order.paySuccess', {}) ?? '支付成功';

  /// zh-CN: '已重新下单'
  String get reorderSuccess => TranslationOverrides.string(_root.$meta, 'order.reorderSuccess', {}) ?? '已重新下单';

  /// zh-CN: '退款功能暂未开放'
  String get refundNotAvailable =>
      TranslationOverrides.string(_root.$meta, 'order.refundNotAvailable', {}) ?? '退款功能暂未开放';

  /// zh-CN: '删除功能暂未开放'
  String get deleteNotAvailable =>
      TranslationOverrides.string(_root.$meta, 'order.deleteNotAvailable', {}) ?? '删除功能暂未开放';

  /// zh-CN: '操作失败: ${error}'
  String operationFailed({required Object error}) =>
      TranslationOverrides.string(_root.$meta, 'order.operationFailed', {'error': error}) ?? '操作失败: ${error}';

  /// zh-CN: '请对准柜机扫描二维码'
  String get scanQrHint => TranslationOverrides.string(_root.$meta, 'order.scanQrHint', {}) ?? '请对准柜机扫描二维码';

  /// zh-CN: '请凭码取餐，祝您用餐愉快'
  String get pickupCodeHint => TranslationOverrides.string(_root.$meta, 'order.pickupCodeHint', {}) ?? '请凭码取餐，祝您用餐愉快';

  /// zh-CN: '门店信息'
  String get storeInfo => TranslationOverrides.string(_root.$meta, 'order.storeInfo', {}) ?? '门店信息';

  /// zh-CN: '商品信息'
  String get productInfo => TranslationOverrides.string(_root.$meta, 'order.productInfo', {}) ?? '商品信息';

  /// zh-CN: '取餐设备'
  String get device => TranslationOverrides.string(_root.$meta, 'order.device', {}) ?? '取餐设备';

  /// zh-CN: '客服功能暂未开放'
  String get serviceNotAvailable =>
      TranslationOverrides.string(_root.$meta, 'order.serviceNotAvailable', {}) ?? '客服功能暂未开放';
}

// Path: partner
class TranslationsPartnerZhCn {
  TranslationsPartnerZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '合作商加盟'
  String get title => TranslationOverrides.string(_root.$meta, 'partner.title', {}) ?? '合作商加盟';

  /// zh-CN: '携手共创美好未来'
  String get subtitle => TranslationOverrides.string(_root.$meta, 'partner.subtitle', {}) ?? '携手共创美好未来';

  /// zh-CN: '合作优势'
  String get advantages => TranslationOverrides.string(_root.$meta, 'partner.advantages', {}) ?? '合作优势';

  /// zh-CN: '丰厚收益'
  String get advantage1Title => TranslationOverrides.string(_root.$meta, 'partner.advantage1Title', {}) ?? '丰厚收益';

  /// zh-CN: '提供有竞争力的分成比例，让您的投入获得丰厚回报'
  String get advantage1Desc =>
      TranslationOverrides.string(_root.$meta, 'partner.advantage1Desc', {}) ?? '提供有竞争力的分成比例，让您的投入获得丰厚回报';

  /// zh-CN: '品牌支持'
  String get advantage2Title => TranslationOverrides.string(_root.$meta, 'partner.advantage2Title', {}) ?? '品牌支持';

  /// zh-CN: '共享知名品牌资源，享受品牌效应带来的客户信任'
  String get advantage2Desc =>
      TranslationOverrides.string(_root.$meta, 'partner.advantage2Desc', {}) ?? '共享知名品牌资源，享受品牌效应带来的客户信任';

  /// zh-CN: '市场推广'
  String get advantage3Title => TranslationOverrides.string(_root.$meta, 'partner.advantage3Title', {}) ?? '市场推广';

  /// zh-CN: '专业的市场推广团队，为您提供全方位的营销支持'
  String get advantage3Desc =>
      TranslationOverrides.string(_root.$meta, 'partner.advantage3Desc', {}) ?? '专业的市场推广团队，为您提供全方位的营销支持';

  /// zh-CN: '培训支持'
  String get advantage4Title => TranslationOverrides.string(_root.$meta, 'partner.advantage4Title', {}) ?? '培训支持';

  /// zh-CN: '提供专业的培训课程，帮助您快速掌握经营技巧'
  String get advantage4Desc =>
      TranslationOverrides.string(_root.$meta, 'partner.advantage4Desc', {}) ?? '提供专业的培训课程，帮助您快速掌握经营技巧';

  /// zh-CN: '合作流程'
  String get process => TranslationOverrides.string(_root.$meta, 'partner.process', {}) ?? '合作流程';

  /// zh-CN: '提交申请'
  String get process1Title => TranslationOverrides.string(_root.$meta, 'partner.process1Title', {}) ?? '提交申请';

  /// zh-CN: '填写合作申请表，提交相关资料'
  String get process1Desc => TranslationOverrides.string(_root.$meta, 'partner.process1Desc', {}) ?? '填写合作申请表，提交相关资料';

  /// zh-CN: '资质审核'
  String get process2Title => TranslationOverrides.string(_root.$meta, 'partner.process2Title', {}) ?? '资质审核';

  /// zh-CN: '我们将在3-5个工作日内完成资质审核'
  String get process2Desc =>
      TranslationOverrides.string(_root.$meta, 'partner.process2Desc', {}) ?? '我们将在3-5个工作日内完成资质审核';

  /// zh-CN: '面谈沟通'
  String get process3Title => TranslationOverrides.string(_root.$meta, 'partner.process3Title', {}) ?? '面谈沟通';

  /// zh-CN: '安排面谈，详细了解合作细节'
  String get process3Desc => TranslationOverrides.string(_root.$meta, 'partner.process3Desc', {}) ?? '安排面谈，详细了解合作细节';

  /// zh-CN: '签署协议'
  String get process4Title => TranslationOverrides.string(_root.$meta, 'partner.process4Title', {}) ?? '签署协议';

  /// zh-CN: '双方达成一致后签署正式合作协议'
  String get process4Desc => TranslationOverrides.string(_root.$meta, 'partner.process4Desc', {}) ?? '双方达成一致后签署正式合作协议';

  /// zh-CN: '开始合作'
  String get process5Title => TranslationOverrides.string(_root.$meta, 'partner.process5Title', {}) ?? '开始合作';

  /// zh-CN: '正式启动合作，享受各项支持服务'
  String get process5Desc => TranslationOverrides.string(_root.$meta, 'partner.process5Desc', {}) ?? '正式启动合作，享受各项支持服务';

  /// zh-CN: '合作条件'
  String get conditions => TranslationOverrides.string(_root.$meta, 'partner.conditions', {}) ?? '合作条件';

  /// zh-CN: '具有合法的经营资质'
  String get condition1 => TranslationOverrides.string(_root.$meta, 'partner.condition1', {}) ?? '具有合法的经营资质';

  /// zh-CN: '有一定的资金实力和经营能力'
  String get condition2 => TranslationOverrides.string(_root.$meta, 'partner.condition2', {}) ?? '有一定的资金实力和经营能力';

  /// zh-CN: '认同我们的品牌理念和经营模式'
  String get condition3 => TranslationOverrides.string(_root.$meta, 'partner.condition3', {}) ?? '认同我们的品牌理念和经营模式';

  /// zh-CN: '具备良好的商业信誉'
  String get condition4 => TranslationOverrides.string(_root.$meta, 'partner.condition4', {}) ?? '具备良好的商业信誉';

  /// zh-CN: '有相关行业经验者优先'
  String get condition5 => TranslationOverrides.string(_root.$meta, 'partner.condition5', {}) ?? '有相关行业经验者优先';

  /// zh-CN: '申请合作'
  String get applicationTitle => TranslationOverrides.string(_root.$meta, 'partner.applicationTitle', {}) ?? '申请合作';

  /// zh-CN: '姓名'
  String get nameLabel => TranslationOverrides.string(_root.$meta, 'partner.nameLabel', {}) ?? '姓名';

  /// zh-CN: '请输入您的姓名'
  String get nameInputHint => TranslationOverrides.string(_root.$meta, 'partner.nameInputHint', {}) ?? '请输入您的姓名';

  /// zh-CN: '公司名称'
  String get companyLabel => TranslationOverrides.string(_root.$meta, 'partner.companyLabel', {}) ?? '公司名称';

  /// zh-CN: '请输入公司名称'
  String get companyInputHint => TranslationOverrides.string(_root.$meta, 'partner.companyInputHint', {}) ?? '请输入公司名称';

  /// zh-CN: '联系电话'
  String get phoneLabel => TranslationOverrides.string(_root.$meta, 'partner.phoneLabel', {}) ?? '联系电话';

  /// zh-CN: '请输入联系电话'
  String get phoneInputHint => TranslationOverrides.string(_root.$meta, 'partner.phoneInputHint', {}) ?? '请输入联系电话';

  /// zh-CN: '合作意向'
  String get intentionLabel => TranslationOverrides.string(_root.$meta, 'partner.intentionLabel', {}) ?? '合作意向';

  /// zh-CN: '请简述您的合作意向'
  String get intentionInputHint =>
      TranslationOverrides.string(_root.$meta, 'partner.intentionInputHint', {}) ?? '请简述您的合作意向';

  /// zh-CN: '提交申请'
  String get submit => TranslationOverrides.string(_root.$meta, 'partner.submit', {}) ?? '提交申请';

  /// zh-CN: '申请提交成功，我们会尽快联系您'
  String get submitSuccess =>
      TranslationOverrides.string(_root.$meta, 'partner.submitSuccess', {}) ?? '申请提交成功，我们会尽快联系您';

  /// zh-CN: '申请提交失败，请稍后重试'
  String get submitFailed => TranslationOverrides.string(_root.$meta, 'partner.submitFailed', {}) ?? '申请提交失败，请稍后重试';

  /// zh-CN: '请填写完整信息'
  String get incompleteInfo => TranslationOverrides.string(_root.$meta, 'partner.incompleteInfo', {}) ?? '请填写完整信息';

  /// zh-CN: '联系我们'
  String get contactTitle => TranslationOverrides.string(_root.$meta, 'partner.contactTitle', {}) ?? '联系我们';

  /// zh-CN: '客服热线'
  String get serviceHotline => TranslationOverrides.string(_root.$meta, 'partner.serviceHotline', {}) ?? '客服热线';

  /// zh-CN: '地址'
  String get address => TranslationOverrides.string(_root.$meta, 'partner.address', {}) ?? '地址';

  /// zh-CN: '发生错误: ${error}'
  String errorOccurred({required Object error}) =>
      TranslationOverrides.string(_root.$meta, 'partner.errorOccurred', {'error': error}) ?? '发生错误: ${error}';
}

// Path: payment
class TranslationsPaymentZhCn {
  TranslationsPaymentZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '收银台'
  String get checkout => TranslationOverrides.string(_root.$meta, 'payment.checkout', {}) ?? '收银台';

  /// zh-CN: '支付成功'
  String get success => TranslationOverrides.string(_root.$meta, 'payment.success', {}) ?? '支付成功';

  /// zh-CN: '订单信息不存在'
  String get orderNotFound => TranslationOverrides.string(_root.$meta, 'payment.orderNotFound', {}) ?? '订单信息不存在';

  /// zh-CN: '立即支付'
  String get payNow => TranslationOverrides.string(_root.$meta, 'payment.payNow', {}) ?? '立即支付';

  /// zh-CN: '正在初始化支付组件...'
  String get initializing => TranslationOverrides.string(_root.$meta, 'payment.initializing', {}) ?? '正在初始化支付组件...';

  /// zh-CN: '取消支付'
  String get cancelTitle => TranslationOverrides.string(_root.$meta, 'payment.cancelTitle', {}) ?? '取消支付';

  /// zh-CN: '确定要取消支付吗？订单将被取消'
  String get cancelContent =>
      TranslationOverrides.string(_root.$meta, 'payment.cancelContent', {}) ?? '确定要取消支付吗？订单将被取消';

  /// zh-CN: '继续支付'
  String get continuePay => TranslationOverrides.string(_root.$meta, 'payment.continuePay', {}) ?? '继续支付';

  /// zh-CN: '取消支付'
  String get cancelPay => TranslationOverrides.string(_root.$meta, 'payment.cancelPay', {}) ?? '取消支付';

  /// zh-CN: '支付金额'
  String get amount => TranslationOverrides.string(_root.$meta, 'payment.amount', {}) ?? '支付金额';

  /// zh-CN: '支付剩余时间'
  String get remainingTime => TranslationOverrides.string(_root.$meta, 'payment.remainingTime', {}) ?? '支付剩余时间';
}

// Path: points
class TranslationsPointsZhCn {
  TranslationsPointsZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '我的乖乖币'
  String get title => TranslationOverrides.string(_root.$meta, 'points.title', {}) ?? '我的乖乖币';

  /// zh-CN: '乖乖币'
  String get unit => TranslationOverrides.string(_root.$meta, 'points.unit', {}) ?? '乖乖币';

  /// zh-CN: '乖乖币商城'
  String get mall => TranslationOverrides.string(_root.$meta, 'points.mall', {}) ?? '乖乖币商城';

  /// zh-CN: '去兑换'
  String get goExchange => TranslationOverrides.string(_root.$meta, 'points.goExchange', {}) ?? '去兑换';

  /// zh-CN: '乖乖币规则'
  String get rules => TranslationOverrides.string(_root.$meta, 'points.rules', {}) ?? '乖乖币规则';

  /// zh-CN: '乖乖币永久有效'
  String get rule1 => TranslationOverrides.string(_root.$meta, 'points.rule1', {}) ?? '乖乖币永久有效';

  /// zh-CN: '抽奖可获得额外乖乖币'
  String get rule2 => TranslationOverrides.string(_root.$meta, 'points.rule2', {}) ?? '抽奖可获得额外乖乖币';

  /// zh-CN: '乖乖币记录'
  String get records => TranslationOverrides.string(_root.$meta, 'points.records', {}) ?? '乖乖币记录';

  /// zh-CN: '全部'
  String get all => TranslationOverrides.string(_root.$meta, 'points.all', {}) ?? '全部';

  /// zh-CN: '获得'
  String get earned => TranslationOverrides.string(_root.$meta, 'points.earned', {}) ?? '获得';

  /// zh-CN: '使用'
  String get used => TranslationOverrides.string(_root.$meta, 'points.used', {}) ?? '使用';

  /// zh-CN: '暂无乖乖币记录'
  String get noRecords => TranslationOverrides.string(_root.$meta, 'points.noRecords', {}) ?? '暂无乖乖币记录';

  /// zh-CN: '返回'
  String get back => TranslationOverrides.string(_root.$meta, 'points.back', {}) ?? '返回';

  /// zh-CN: '去抽奖'
  String get goLottery => TranslationOverrides.string(_root.$meta, 'points.goLottery', {}) ?? '去抽奖';

  /// zh-CN: '余额'
  String get balance => TranslationOverrides.string(_root.$meta, 'points.balance', {}) ?? '余额';

  /// zh-CN: '优惠券'
  String get coupon => TranslationOverrides.string(_root.$meta, 'points.coupon', {}) ?? '优惠券';

  /// zh-CN: '没有更多商品了'
  String get noMoreProducts => TranslationOverrides.string(_root.$meta, 'points.noMoreProducts', {}) ?? '没有更多商品了';

  /// zh-CN: '我的乖乖币: ${points}'
  String myPoints({required Object points}) =>
      TranslationOverrides.string(_root.$meta, 'points.myPoints', {'points': points}) ?? '我的乖乖币: ${points}';

  /// zh-CN: '暂无商品'
  String get noProducts => TranslationOverrides.string(_root.$meta, 'points.noProducts', {}) ?? '暂无商品';

  /// zh-CN: '${points} 乖乖币'
  String cost({required Object points}) =>
      TranslationOverrides.string(_root.$meta, 'points.cost', {'points': points}) ?? '${points} 乖乖币';

  /// zh-CN: '立即兑换'
  String get exchangeNow => TranslationOverrides.string(_root.$meta, 'points.exchangeNow', {}) ?? '立即兑换';

  /// zh-CN: '余额不足'
  String get insufficientPoints => TranslationOverrides.string(_root.$meta, 'points.insufficientPoints', {}) ?? '余额不足';
}

// Path: product
class TranslationsProductZhCn {
  TranslationsProductZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '商品列表'
  String get title => TranslationOverrides.string(_root.$meta, 'product.title', {}) ?? '商品列表';

  /// zh-CN: '商品详情'
  String get detail => TranslationOverrides.string(_root.$meta, 'product.detail', {}) ?? '商品详情';

  /// zh-CN: '热销'
  String get hot => TranslationOverrides.string(_root.$meta, 'product.hot', {}) ?? '热销';

  /// zh-CN: '促销'
  String get promotion => TranslationOverrides.string(_root.$meta, 'product.promotion', {}) ?? '促销';

  /// zh-CN: '${percent}% OFF'
  String discountOff({required Object percent}) =>
      TranslationOverrides.string(_root.$meta, 'product.discountOff', {'percent': percent}) ?? '${percent}% OFF';

  /// zh-CN: '月售'
  String get monthlySales => TranslationOverrides.string(_root.$meta, 'product.monthlySales', {}) ?? '月售';

  /// zh-CN: '库存'
  String get stock => TranslationOverrides.string(_root.$meta, 'product.stock', {}) ?? '库存';

  /// zh-CN: '库存充足'
  String get stockFull => TranslationOverrides.string(_root.$meta, 'product.stockFull', {}) ?? '库存充足';

  /// zh-CN: '暂时缺货'
  String get stockEmpty => TranslationOverrides.string(_root.$meta, 'product.stockEmpty', {}) ?? '暂时缺货';

  /// zh-CN: '加入购物车'
  String get addToCart => TranslationOverrides.string(_root.$meta, 'product.addToCart', {}) ?? '加入购物车';

  /// zh-CN: '已加入购物车'
  String get addedToCart => TranslationOverrides.string(_root.$meta, 'product.addedToCart', {}) ?? '已加入购物车';

  /// zh-CN: '规格参数'
  String get specifications => TranslationOverrides.string(_root.$meta, 'product.specifications', {}) ?? '规格参数';

  /// zh-CN: '全部'
  String get categoryAll => TranslationOverrides.string(_root.$meta, 'product.categoryAll', {}) ?? '全部';

  /// zh-CN: '食品'
  String get categoryFood => TranslationOverrides.string(_root.$meta, 'product.categoryFood', {}) ?? '食品';

  /// zh-CN: '饮料'
  String get categoryDrink => TranslationOverrides.string(_root.$meta, 'product.categoryDrink', {}) ?? '饮料';

  /// zh-CN: '零食'
  String get categorySnack => TranslationOverrides.string(_root.$meta, 'product.categorySnack', {}) ?? '零食';

  /// zh-CN: '默认排序'
  String get sortDefault => TranslationOverrides.string(_root.$meta, 'product.sortDefault', {}) ?? '默认排序';

  /// zh-CN: '价格从低到高'
  String get sortPriceAsc => TranslationOverrides.string(_root.$meta, 'product.sortPriceAsc', {}) ?? '价格从低到高';

  /// zh-CN: '价格从高到低'
  String get sortPriceDesc => TranslationOverrides.string(_root.$meta, 'product.sortPriceDesc', {}) ?? '价格从高到低';

  /// zh-CN: '按名称排序'
  String get sortName => TranslationOverrides.string(_root.$meta, 'product.sortName', {}) ?? '按名称排序';

  /// zh-CN: '仅显示可用商品'
  String get filterOnlyAvailable =>
      TranslationOverrides.string(_root.$meta, 'product.filterOnlyAvailable', {}) ?? '仅显示可用商品';

  /// zh-CN: '购物车'
  String get cart => TranslationOverrides.string(_root.$meta, 'product.cart', {}) ?? '购物车';
}

// Path: profile
class TranslationsProfileZhCn {
  TranslationsProfileZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '个人中心'
  String get title => TranslationOverrides.string(_root.$meta, 'profile.title', {}) ?? '个人中心';

  /// zh-CN: '未登录'
  String get notLoggedIn => TranslationOverrides.string(_root.$meta, 'profile.notLoggedIn', {}) ?? '未登录';

  /// zh-CN: '编辑资料'
  String get editProfile => TranslationOverrides.string(_root.$meta, 'profile.editProfile', {}) ?? '编辑资料';

  /// zh-CN: '退出登录'
  String get logout => TranslationOverrides.string(_root.$meta, 'profile.logout', {}) ?? '退出登录';

  /// zh-CN: '收藏设备'
  String get favoriteDevices => TranslationOverrides.string(_root.$meta, 'profile.favoriteDevices', {}) ?? '收藏设备';

  /// zh-CN: '个人信息'
  String get personalInfo => TranslationOverrides.string(_root.$meta, 'profile.personalInfo', {}) ?? '个人信息';

  /// zh-CN: '确认退出'
  String get confirmLogout => TranslationOverrides.string(_root.$meta, 'profile.confirmLogout', {}) ?? '确认退出';

  /// zh-CN: '确定要退出登录吗？'
  String get confirmLogoutContent =>
      TranslationOverrides.string(_root.$meta, 'profile.confirmLogoutContent', {}) ?? '确定要退出登录吗？';

  /// zh-CN: '确定要清除所有缓存数据吗？'
  String get clearCacheConfirm =>
      TranslationOverrides.string(_root.$meta, 'profile.clearCacheConfirm', {}) ?? '确定要清除所有缓存数据吗？';

  /// zh-CN: '暂无收藏设备'
  String get noFavoriteDevices => TranslationOverrides.string(_root.$meta, 'profile.noFavoriteDevices', {}) ?? '暂无收藏设备';

  /// zh-CN: '取消收藏'
  String get removeFavorite => TranslationOverrides.string(_root.$meta, 'profile.removeFavorite', {}) ?? '取消收藏';

  /// zh-CN: '确定要取消收藏"${name}"吗？'
  String removeFavoriteConfirm({required Object name}) =>
      TranslationOverrides.string(_root.$meta, 'profile.removeFavoriteConfirm', {'name': name}) ?? '确定要取消收藏"${name}"吗？';

  /// zh-CN: '一个便捷的自动售货机购买应用'
  String get appDescription =>
      TranslationOverrides.string(_root.$meta, 'profile.appDescription', {}) ?? '一个便捷的自动售货机购买应用';

  /// zh-CN: '版本：${version}'
  String version({required Object version}) =>
      TranslationOverrides.string(_root.$meta, 'profile.version', {'version': version}) ?? '版本：${version}';

  /// zh-CN: '我的钱包'
  String get wallet => TranslationOverrides.string(_root.$meta, 'profile.wallet', {}) ?? '我的钱包';

  /// zh-CN: '优惠券'
  String get coupon => TranslationOverrides.string(_root.$meta, 'profile.coupon', {}) ?? '优惠券';

  /// zh-CN: '问题反馈'
  String get feedback => TranslationOverrides.string(_root.$meta, 'profile.feedback', {}) ?? '问题反馈';

  /// zh-CN: '合作商加盟'
  String get cooperation => TranslationOverrides.string(_root.$meta, 'profile.cooperation', {}) ?? '合作商加盟';

  /// zh-CN: '关于我们'
  String get about => TranslationOverrides.string(_root.$meta, 'profile.about', {}) ?? '关于我们';

  /// zh-CN: '设置'
  String get settings => TranslationOverrides.string(_root.$meta, 'profile.settings', {}) ?? '设置';

  late final TranslationsProfileGenderZhCn gender = TranslationsProfileGenderZhCn.internal(_root);
  late final TranslationsProfileInfoZhCn info = TranslationsProfileInfoZhCn.internal(_root);
  late final TranslationsProfileAvatarZhCn avatar = TranslationsProfileAvatarZhCn.internal(_root);

  /// zh-CN: '保存成功'
  String get saveSuccess => TranslationOverrides.string(_root.$meta, 'profile.saveSuccess', {}) ?? '保存成功';

  /// zh-CN: '保存失败: ${error}'
  String saveFailed({required Object error}) =>
      TranslationOverrides.string(_root.$meta, 'profile.saveFailed', {'error': error}) ?? '保存失败: ${error}';

  /// zh-CN: '保存信息'
  String get saveInfo => TranslationOverrides.string(_root.$meta, 'profile.saveInfo', {}) ?? '保存信息';

  /// zh-CN: '钱包余额'
  String get walletBalance => TranslationOverrides.string(_root.$meta, 'profile.walletBalance', {}) ?? '钱包余额';

  /// zh-CN: '乖乖币'
  String get coin => TranslationOverrides.string(_root.$meta, 'profile.coin', {}) ?? '乖乖币';

  /// zh-CN: '优惠券'
  String get couponCount => TranslationOverrides.string(_root.$meta, 'profile.couponCount', {}) ?? '优惠券';
}

// Path: settings
class TranslationsSettingsZhCn {
  TranslationsSettingsZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '设置'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.title', {}) ?? '设置';

  /// zh-CN: '通用'
  String get general => TranslationOverrides.string(_root.$meta, 'settings.general', {}) ?? '通用';

  /// zh-CN: '主题模式'
  String get theme => TranslationOverrides.string(_root.$meta, 'settings.theme', {}) ?? '主题模式';

  /// zh-CN: '浅色'
  String get themeLight => TranslationOverrides.string(_root.$meta, 'settings.themeLight', {}) ?? '浅色';

  /// zh-CN: '深色'
  String get themeDark => TranslationOverrides.string(_root.$meta, 'settings.themeDark', {}) ?? '深色';

  /// zh-CN: '跟随系统'
  String get themeSystem => TranslationOverrides.string(_root.$meta, 'settings.themeSystem', {}) ?? '跟随系统';

  /// zh-CN: '语言'
  String get language => TranslationOverrides.string(_root.$meta, 'settings.language', {}) ?? '语言';

  /// zh-CN: '检查更新'
  String get checkUpdate => TranslationOverrides.string(_root.$meta, 'settings.checkUpdate', {}) ?? '检查更新';

  /// zh-CN: '清除缓存'
  String get clearCache => TranslationOverrides.string(_root.$meta, 'settings.clearCache', {}) ?? '清除缓存';

  /// zh-CN: '关于'
  String get about => TranslationOverrides.string(_root.$meta, 'settings.about', {}) ?? '关于';

  /// zh-CN: '设备信息'
  String get deviceInfo => TranslationOverrides.string(_root.$meta, 'settings.deviceInfo', {}) ?? '设备信息';

  /// zh-CN: '关于我们'
  String get aboutUs => TranslationOverrides.string(_root.$meta, 'settings.aboutUs', {}) ?? '关于我们';

  /// zh-CN: '正在检查更新...'
  String get checkingUpdate => TranslationOverrides.string(_root.$meta, 'settings.checkingUpdate', {}) ?? '正在检查更新...';

  /// zh-CN: '缓存已清除'
  String get cacheCleared => TranslationOverrides.string(_root.$meta, 'settings.cacheCleared', {}) ?? '缓存已清除';

  /// zh-CN: '英语'
  String get english => TranslationOverrides.string(_root.$meta, 'settings.english', {}) ?? '英语';

  /// zh-CN: '简体中文'
  String get chinese => TranslationOverrides.string(_root.$meta, 'settings.chinese', {}) ?? '简体中文';

  /// zh-CN: '繁体中文'
  String get traditionalChinese =>
      TranslationOverrides.string(_root.$meta, 'settings.traditionalChinese', {}) ?? '繁体中文';

  /// zh-CN: '主题配色'
  String get themeScheme => TranslationOverrides.string(_root.$meta, 'settings.themeScheme', {}) ?? '主题配色';

  late final TranslationsSettingsSchemesZhCn schemes = TranslationsSettingsSchemesZhCn.internal(_root);

  /// zh-CN: '应用名称'
  String get appName => TranslationOverrides.string(_root.$meta, 'settings.appName', {}) ?? '应用名称';

  /// zh-CN: '包名'
  String get packageName => TranslationOverrides.string(_root.$meta, 'settings.packageName', {}) ?? '包名';

  /// zh-CN: '版本号'
  String get versionName => TranslationOverrides.string(_root.$meta, 'settings.versionName', {}) ?? '版本号';

  /// zh-CN: '构建号'
  String get buildNumber => TranslationOverrides.string(_root.$meta, 'settings.buildNumber', {}) ?? '构建号';

  /// zh-CN: '© 2024 Lunchbox Team'
  String get copyright => TranslationOverrides.string(_root.$meta, 'settings.copyright', {}) ?? '© 2024 Lunchbox Team';
}

// Path: splash
class TranslationsSplashZhCn {
  TranslationsSplashZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '正在启动...'
  String get starting => TranslationOverrides.string(_root.$meta, 'splash.starting', {}) ?? '正在启动...';

  /// zh-CN: '检查服务状态...'
  String get checkingServices => TranslationOverrides.string(_root.$meta, 'splash.checkingServices', {}) ?? '检查服务状态...';

  /// zh-CN: '加载配置...'
  String get loadingConfig => TranslationOverrides.string(_root.$meta, 'splash.loadingConfig', {}) ?? '加载配置...';

  /// zh-CN: '检查登录状态...'
  String get checkingAuth => TranslationOverrides.string(_root.$meta, 'splash.checkingAuth', {}) ?? '检查登录状态...';

  /// zh-CN: '准备数据...'
  String get preparingData => TranslationOverrides.string(_root.$meta, 'splash.preparingData', {}) ?? '准备数据...';

  /// zh-CN: '启动完成'
  String get ready => TranslationOverrides.string(_root.$meta, 'splash.ready', {}) ?? '启动完成';

  /// zh-CN: '启动失败'
  String get failed => TranslationOverrides.string(_root.$meta, 'splash.failed', {}) ?? '启动失败';
}

// Path: teamOrdering
class TranslationsTeamOrderingZhCn {
  TranslationsTeamOrderingZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '团队用餐'
  String get title => TranslationOverrides.string(_root.$meta, 'teamOrdering.title', {}) ?? '团队用餐';

  /// zh-CN: '团队点餐'
  String get bannerTitle => TranslationOverrides.string(_root.$meta, 'teamOrdering.bannerTitle', {}) ?? '团队点餐';

  /// zh-CN: '多人订购 · 团队聚餐 · 企业团建'
  String get bannerSubtitle =>
      TranslationOverrides.string(_root.$meta, 'teamOrdering.bannerSubtitle', {}) ?? '多人订购 · 团队聚餐 · 企业团建';

  /// zh-CN: '专业服务'
  String get tag1 => TranslationOverrides.string(_root.$meta, 'teamOrdering.tag1', {}) ?? '专业服务';

  /// zh-CN: '优惠价格'
  String get tag2 => TranslationOverrides.string(_root.$meta, 'teamOrdering.tag2', {}) ?? '优惠价格';

  /// zh-CN: '便捷高效'
  String get tag3 => TranslationOverrides.string(_root.$meta, 'teamOrdering.tag3', {}) ?? '便捷高效';

  late final TranslationsTeamOrderingScenariosZhCn scenarios = TranslationsTeamOrderingScenariosZhCn.internal(_root);
  late final TranslationsTeamOrderingProcessZhCn process = TranslationsTeamOrderingProcessZhCn.internal(_root);
  late final TranslationsTeamOrderingAdvantagesZhCn advantages = TranslationsTeamOrderingAdvantagesZhCn.internal(_root);

  /// zh-CN: '立即预订'
  String get bookNow => TranslationOverrides.string(_root.$meta, 'teamOrdering.bookNow', {}) ?? '立即预订';
}

// Path: time
class TranslationsTimeZhCn {
  TranslationsTimeZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '刚刚'
  String get justNow => TranslationOverrides.string(_root.$meta, 'time.justNow', {}) ?? '刚刚';

  /// zh-CN: '${minutes} 分钟前'
  String minutesAgo({required Object minutes}) =>
      TranslationOverrides.string(_root.$meta, 'time.minutesAgo', {'minutes': minutes}) ?? '${minutes} 分钟前';

  /// zh-CN: '${hours} 小时前'
  String hoursAgo({required Object hours}) =>
      TranslationOverrides.string(_root.$meta, 'time.hoursAgo', {'hours': hours}) ?? '${hours} 小时前';

  /// zh-CN: '${days} 天前'
  String daysAgo({required Object days}) =>
      TranslationOverrides.string(_root.$meta, 'time.daysAgo', {'days': days}) ?? '${days} 天前';
}

// Path: community.features
class TranslationsCommunityFeaturesZhCn {
  TranslationsCommunityFeaturesZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '专属优惠券'
  String get coupon => TranslationOverrides.string(_root.$meta, 'community.features.coupon', {}) ?? '专属优惠券';

  /// zh-CN: '群内专享折扣，省钱又美味'
  String get couponHint =>
      TranslationOverrides.string(_root.$meta, 'community.features.couponHint', {}) ?? '群内专享折扣，省钱又美味';

  /// zh-CN: '新品试吃'
  String get tasting => TranslationOverrides.string(_root.$meta, 'community.features.tasting', {}) ?? '新品试吃';

  /// zh-CN: '第一时间品尝最新美食'
  String get tastingHint =>
      TranslationOverrides.string(_root.$meta, 'community.features.tastingHint', {}) ?? '第一时间品尝最新美食';

  /// zh-CN: '美食交流'
  String get exchange => TranslationOverrides.string(_root.$meta, 'community.features.exchange', {}) ?? '美食交流';

  /// zh-CN: '与美食达人分享心得'
  String get exchangeHint =>
      TranslationOverrides.string(_root.$meta, 'community.features.exchangeHint', {}) ?? '与美食达人分享心得';

  /// zh-CN: '活动优先'
  String get priority => TranslationOverrides.string(_root.$meta, 'community.features.priority', {}) ?? '活动优先';

  /// zh-CN: '优先参与各种美食活动'
  String get priorityHint =>
      TranslationOverrides.string(_root.$meta, 'community.features.priorityHint', {}) ?? '优先参与各种美食活动';

  /// zh-CN: '社群活动'
  String get activity => TranslationOverrides.string(_root.$meta, 'community.features.activity', {}) ?? '社群活动';

  /// zh-CN: '定期举办线下聚会'
  String get activityHint =>
      TranslationOverrides.string(_root.$meta, 'community.features.activityHint', {}) ?? '定期举办线下聚会';

  /// zh-CN: '话题讨论'
  String get topic => TranslationOverrides.string(_root.$meta, 'community.features.topic', {}) ?? '话题讨论';

  /// zh-CN: '参与话题赢取奖励'
  String get topicHint => TranslationOverrides.string(_root.$meta, 'community.features.topicHint', {}) ?? '参与话题赢取奖励';
}

// Path: coupon.tabs
class TranslationsCouponTabsZhCn {
  TranslationsCouponTabsZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '可领取'
  String get available => TranslationOverrides.string(_root.$meta, 'coupon.tabs.available', {}) ?? '可领取';

  /// zh-CN: '已领取'
  String get received => TranslationOverrides.string(_root.$meta, 'coupon.tabs.received', {}) ?? '已领取';

  /// zh-CN: '已过期'
  String get expired => TranslationOverrides.string(_root.$meta, 'coupon.tabs.expired', {}) ?? '已过期';

  /// zh-CN: '可使用'
  String get canUse => TranslationOverrides.string(_root.$meta, 'coupon.tabs.canUse', {}) ?? '可使用';

  /// zh-CN: '不可使用'
  String get cannotUse => TranslationOverrides.string(_root.$meta, 'coupon.tabs.cannotUse', {}) ?? '不可使用';
}

// Path: home.grid
class TranslationsHomeGridZhCn {
  TranslationsHomeGridZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '社群福利'
  String get welfare => TranslationOverrides.string(_root.$meta, 'home.grid.welfare', {}) ?? '社群福利';

  /// zh-CN: '客服中心'
  String get service => TranslationOverrides.string(_root.$meta, 'home.grid.service', {}) ?? '客服中心';

  /// zh-CN: '领优惠券'
  String get coupon => TranslationOverrides.string(_root.$meta, 'home.grid.coupon', {}) ?? '领优惠券';

  /// zh-CN: '幸运抽奖'
  String get lottery => TranslationOverrides.string(_root.$meta, 'home.grid.lottery', {}) ?? '幸运抽奖';

  /// zh-CN: '邀请好友'
  String get invite => TranslationOverrides.string(_root.$meta, 'home.grid.invite', {}) ?? '邀请好友';

  /// zh-CN: '邀请好友得现金'
  String get inviteHint => TranslationOverrides.string(_root.$meta, 'home.grid.inviteHint', {}) ?? '邀请好友得现金';
}

// Path: home.lottery
class TranslationsHomeLotteryZhCn {
  TranslationsHomeLotteryZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '幸运抽奖'
  String get title => TranslationOverrides.string(_root.$meta, 'home.lottery.title', {}) ?? '幸运抽奖';

  /// zh-CN: '我的奖品'
  String get prizes => TranslationOverrides.string(_root.$meta, 'home.lottery.prizes', {}) ?? '我的奖品';

  /// zh-CN: '抽奖规则'
  String get rules => TranslationOverrides.string(_root.$meta, 'home.lottery.rules', {}) ?? '抽奖规则';

  /// zh-CN: '剩余次数: {count}'
  String get remaining => TranslationOverrides.string(_root.$meta, 'home.lottery.remaining', {}) ?? '剩余次数: {count}';

  /// zh-CN: '抽奖'
  String get spin => TranslationOverrides.string(_root.$meta, 'home.lottery.spin', {}) ?? '抽奖';

  /// zh-CN: '每日有免费抽奖次数，次数用完后可领取任务获得'
  String get rule1 => TranslationOverrides.string(_root.$meta, 'home.lottery.rule1', {}) ?? '每日有免费抽奖次数，次数用完后可领取任务获得';

  /// zh-CN: '优惠券48小时内有效，乖乖币自动到账'
  String get rule2 => TranslationOverrides.string(_root.$meta, 'home.lottery.rule2', {}) ?? '优惠券48小时内有效，乖乖币自动到账';

  /// zh-CN: '活动最终解释权归平台所有'
  String get rule3 => TranslationOverrides.string(_root.$meta, 'home.lottery.rule3', {}) ?? '活动最终解释权归平台所有';

  /// zh-CN: '乖乖币'
  String get prizeUnit => TranslationOverrides.string(_root.$meta, 'home.lottery.prizeUnit', {}) ?? '乖乖币';

  /// zh-CN: '奖品说明'
  String get prizeList => TranslationOverrides.string(_root.$meta, 'home.lottery.prizeList', {}) ?? '奖品说明';

  /// zh-CN: '返回'
  String get back => TranslationOverrides.string(_root.$meta, 'home.lottery.back', {}) ?? '返回';

  late final TranslationsHomeLotteryPrizeStatsZhCn prizeStats = TranslationsHomeLotteryPrizeStatsZhCn.internal(_root);
  late final TranslationsHomeLotteryTabsZhCn tabs = TranslationsHomeLotteryTabsZhCn.internal(_root);
  late final TranslationsHomeLotteryPrizeCardZhCn prizeCard = TranslationsHomeLotteryPrizeCardZhCn.internal(_root);
}

// Path: home.status
class TranslationsHomeStatusZhCn {
  TranslationsHomeStatusZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '营业中'
  String get open => TranslationOverrides.string(_root.$meta, 'home.status.open', {}) ?? '营业中';

  /// zh-CN: '休息中'
  String get closed => TranslationOverrides.string(_root.$meta, 'home.status.closed', {}) ?? '休息中';

  /// zh-CN: '支持移动支付'
  String get mobilePayment => TranslationOverrides.string(_root.$meta, 'home.status.mobilePayment', {}) ?? '支持移动支付';
}

// Path: invite.rules
class TranslationsInviteRulesZhCn {
  TranslationsInviteRulesZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '邀请规则'
  String get title => TranslationOverrides.string(_root.$meta, 'invite.rules.title', {}) ?? '邀请规则';

  /// zh-CN: '邀请规则'
  String get section1 => TranslationOverrides.string(_root.$meta, 'invite.rules.section1', {}) ?? '邀请规则';

  /// zh-CN: '每成功邀请1位好友注册，即可获得1元无门槛优惠券'
  String get rule1 => TranslationOverrides.string(_root.$meta, 'invite.rules.rule1', {}) ?? '每成功邀请1位好友注册，即可获得1元无门槛优惠券';

  /// zh-CN: '邀请好友需完成首次下单（实付金额≥15元）才算成功'
  String get rule2 => TranslationOverrides.string(_root.$meta, 'invite.rules.rule2', {}) ?? '邀请好友需完成首次下单（实付金额≥15元）才算成功';

  /// zh-CN: '每位好友仅可被邀请一次，重复邀请无效'
  String get rule3 => TranslationOverrides.string(_root.$meta, 'invite.rules.rule3', {}) ?? '每位好友仅可被邀请一次，重复邀请无效';

  /// zh-CN: '邀请奖励无上限，邀请越多奖励越多'
  String get rule4 => TranslationOverrides.string(_root.$meta, 'invite.rules.rule4', {}) ?? '邀请奖励无上限，邀请越多奖励越多';

  /// zh-CN: '邀请记录永久保存，可随时查看'
  String get rule5 => TranslationOverrides.string(_root.$meta, 'invite.rules.rule5', {}) ?? '邀请记录永久保存，可随时查看';

  /// zh-CN: '奖励说明'
  String get section2 => TranslationOverrides.string(_root.$meta, 'invite.rules.section2', {}) ?? '奖励说明';

  /// zh-CN: '1元无门槛优惠券，可直接抵扣订单金额'
  String get reward1 => TranslationOverrides.string(_root.$meta, 'invite.rules.reward1', {}) ?? '1元无门槛优惠券，可直接抵扣订单金额';

  /// zh-CN: '优惠券有效期为30天，请在有效期内使用'
  String get reward2 => TranslationOverrides.string(_root.$meta, 'invite.rules.reward2', {}) ?? '优惠券有效期为30天，请在有效期内使用';

  /// zh-CN: '优惠券不可与其他优惠活动同时使用'
  String get reward3 => TranslationOverrides.string(_root.$meta, 'invite.rules.reward3', {}) ?? '优惠券不可与其他优惠活动同时使用';

  /// zh-CN: '优惠券仅限在好小乖智能盒饭售卖机使用'
  String get reward4 => TranslationOverrides.string(_root.$meta, 'invite.rules.reward4', {}) ?? '优惠券仅限在好小乖智能盒饭售卖机使用';

  /// zh-CN: '优惠券不可转让、不可兑换现金'
  String get reward5 => TranslationOverrides.string(_root.$meta, 'invite.rules.reward5', {}) ?? '优惠券不可转让、不可兑换现金';

  /// zh-CN: '注意事项'
  String get section3 => TranslationOverrides.string(_root.$meta, 'invite.rules.section3', {}) ?? '注意事项';

  /// zh-CN: '邀请好友必须通过官方邀请链接进行'
  String get note1 => TranslationOverrides.string(_root.$meta, 'invite.rules.note1', {}) ?? '邀请好友必须通过官方邀请链接进行';

  /// zh-CN: '好友注册后需完成实名认证'
  String get note2 => TranslationOverrides.string(_root.$meta, 'invite.rules.note2', {}) ?? '好友注册后需完成实名认证';

  /// zh-CN: '如发现恶意刷邀请行为，平台有权取消奖励'
  String get note3 => TranslationOverrides.string(_root.$meta, 'invite.rules.note3', {}) ?? '如发现恶意刷邀请行为，平台有权取消奖励';

  /// zh-CN: '活动规则最终解释权归好小乖智能盒饭售卖机所有'
  String get note4 => TranslationOverrides.string(_root.$meta, 'invite.rules.note4', {}) ?? '活动规则最终解释权归好小乖智能盒饭售卖机所有';

  /// zh-CN: '如有疑问请联系客服处理'
  String get note5 => TranslationOverrides.string(_root.$meta, 'invite.rules.note5', {}) ?? '如有疑问请联系客服处理';

  /// zh-CN: '邀请流程'
  String get section4 => TranslationOverrides.string(_root.$meta, 'invite.rules.section4', {}) ?? '邀请流程';

  /// zh-CN: '分享邀请链接给好友'
  String get process1 => TranslationOverrides.string(_root.$meta, 'invite.rules.process1', {}) ?? '分享邀请链接给好友';

  /// zh-CN: '好友通过链接注册账号'
  String get process2 => TranslationOverrides.string(_root.$meta, 'invite.rules.process2', {}) ?? '好友通过链接注册账号';

  /// zh-CN: '好友完成首次下单（≥15元）'
  String get process3 => TranslationOverrides.string(_root.$meta, 'invite.rules.process3', {}) ?? '好友完成首次下单（≥15元）';

  /// zh-CN: '系统自动发放奖励到您的账户'
  String get process4 => TranslationOverrides.string(_root.$meta, 'invite.rules.process4', {}) ?? '系统自动发放奖励到您的账户';

  /// zh-CN: '可在“我的成就”中查看邀请记录'
  String get process5 => TranslationOverrides.string(_root.$meta, 'invite.rules.process5', {}) ?? '可在“我的成就”中查看邀请记录';
}

// Path: network.errors
class TranslationsNetworkErrorsZhCn {
  TranslationsNetworkErrorsZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '连接超时，请检查网络连接'
  String get connectionTimeout =>
      TranslationOverrides.string(_root.$meta, 'network.errors.connectionTimeout', {}) ?? '连接超时，请检查网络连接';

  /// zh-CN: '发送请求超时，请检查网络连接'
  String get sendTimeout =>
      TranslationOverrides.string(_root.$meta, 'network.errors.sendTimeout', {}) ?? '发送请求超时，请检查网络连接';

  /// zh-CN: '接收响应超时，请检查网络连接'
  String get receiveTimeout =>
      TranslationOverrides.string(_root.$meta, 'network.errors.receiveTimeout', {}) ?? '接收响应超时，请检查网络连接';

  /// zh-CN: '证书验证失败'
  String get badCertificate =>
      TranslationOverrides.string(_root.$meta, 'network.errors.badCertificate', {}) ?? '证书验证失败';

  /// zh-CN: '请求已取消'
  String get cancel => TranslationOverrides.string(_root.$meta, 'network.errors.cancel', {}) ?? '请求已取消';

  /// zh-CN: '网络连接失败，请检查网络设置'
  String get connectionError =>
      TranslationOverrides.string(_root.$meta, 'network.errors.connectionError', {}) ?? '网络连接失败，请检查网络设置';

  /// zh-CN: '未知错误：${error}'
  String unknown({required Object error}) =>
      TranslationOverrides.string(_root.$meta, 'network.errors.unknown', {'error': error}) ?? '未知错误：${error}';

  /// zh-CN: '请稍后重试'
  String get retryLater => TranslationOverrides.string(_root.$meta, 'network.errors.retryLater', {}) ?? '请稍后重试';

  /// zh-CN: '请求参数错误'
  String get badRequest => TranslationOverrides.string(_root.$meta, 'network.errors.badRequest', {}) ?? '请求参数错误';

  /// zh-CN: '未授权，请重新登录'
  String get unauthorized => TranslationOverrides.string(_root.$meta, 'network.errors.unauthorized', {}) ?? '未授权，请重新登录';

  /// zh-CN: '没有权限访问该资源'
  String get forbidden => TranslationOverrides.string(_root.$meta, 'network.errors.forbidden', {}) ?? '没有权限访问该资源';

  /// zh-CN: '请求的资源不存在'
  String get notFound => TranslationOverrides.string(_root.$meta, 'network.errors.notFound', {}) ?? '请求的资源不存在';

  /// zh-CN: '请求超时，请重试'
  String get timeout => TranslationOverrides.string(_root.$meta, 'network.errors.timeout', {}) ?? '请求超时，请重试';

  /// zh-CN: '请求冲突'
  String get conflict => TranslationOverrides.string(_root.$meta, 'network.errors.conflict', {}) ?? '请求冲突';

  /// zh-CN: '请求数据验证失败'
  String get validationFailed =>
      TranslationOverrides.string(_root.$meta, 'network.errors.validationFailed', {}) ?? '请求数据验证失败';

  /// zh-CN: '请求过于频繁，请稍后重试'
  String get tooManyRequests =>
      TranslationOverrides.string(_root.$meta, 'network.errors.tooManyRequests', {}) ?? '请求过于频繁，请稍后重试';

  /// zh-CN: '服务器内部错误'
  String get internalServerError =>
      TranslationOverrides.string(_root.$meta, 'network.errors.internalServerError', {}) ?? '服务器内部错误';

  /// zh-CN: '网关错误，请稍后重试'
  String get badGateway => TranslationOverrides.string(_root.$meta, 'network.errors.badGateway', {}) ?? '网关错误，请稍后重试';

  /// zh-CN: '服务暂时不可用，请稍后重试'
  String get serviceUnavailable =>
      TranslationOverrides.string(_root.$meta, 'network.errors.serviceUnavailable', {}) ?? '服务暂时不可用，请稍后重试';

  /// zh-CN: '网关超时，请稍后重试'
  String get gatewayTimeout =>
      TranslationOverrides.string(_root.$meta, 'network.errors.gatewayTimeout', {}) ?? '网关超时，请稍后重试';

  /// zh-CN: '服务器错误（${code}）'
  String serverError({required Object code}) =>
      TranslationOverrides.string(_root.$meta, 'network.errors.serverError', {'code': code}) ?? '服务器错误（${code}）';

  /// zh-CN: '请求错误（${code}）'
  String requestError({required Object code}) =>
      TranslationOverrides.string(_root.$meta, 'network.errors.requestError', {'code': code}) ?? '请求错误（${code}）';

  /// zh-CN: '网络请求失败'
  String get failed => TranslationOverrides.string(_root.$meta, 'network.errors.failed', {}) ?? '网络请求失败';
}

// Path: order.status
class TranslationsOrderStatusZhCn {
  TranslationsOrderStatusZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '全部订单'
  String get all => TranslationOverrides.string(_root.$meta, 'order.status.all', {}) ?? '全部订单';

  /// zh-CN: '待支付'
  String get pending => TranslationOverrides.string(_root.$meta, 'order.status.pending', {}) ?? '待支付';

  /// zh-CN: '已支付'
  String get paid => TranslationOverrides.string(_root.$meta, 'order.status.paid', {}) ?? '已支付';

  /// zh-CN: '已使用'
  String get used => TranslationOverrides.string(_root.$meta, 'order.status.used', {}) ?? '已使用';

  /// zh-CN: '已完成'
  String get completed => TranslationOverrides.string(_root.$meta, 'order.status.completed', {}) ?? '已完成';

  /// zh-CN: '已取消'
  String get cancelled => TranslationOverrides.string(_root.$meta, 'order.status.cancelled', {}) ?? '已取消';

  /// zh-CN: '退款'
  String get refunded => TranslationOverrides.string(_root.$meta, 'order.status.refunded', {}) ?? '退款';

  /// zh-CN: '支付失败'
  String get failed => TranslationOverrides.string(_root.$meta, 'order.status.failed', {}) ?? '支付失败';
}

// Path: profile.gender
class TranslationsProfileGenderZhCn {
  TranslationsProfileGenderZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '男'
  String get male => TranslationOverrides.string(_root.$meta, 'profile.gender.male', {}) ?? '男';

  /// zh-CN: '女'
  String get female => TranslationOverrides.string(_root.$meta, 'profile.gender.female', {}) ?? '女';

  /// zh-CN: '保密'
  String get unknown => TranslationOverrides.string(_root.$meta, 'profile.gender.unknown', {}) ?? '保密';
}

// Path: profile.info
class TranslationsProfileInfoZhCn {
  TranslationsProfileInfoZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '基本信息'
  String get basic => TranslationOverrides.string(_root.$meta, 'profile.info.basic', {}) ?? '基本信息';

  /// zh-CN: '其他信息'
  String get other => TranslationOverrides.string(_root.$meta, 'profile.info.other', {}) ?? '其他信息';

  /// zh-CN: '手机号'
  String get phone => TranslationOverrides.string(_root.$meta, 'profile.info.phone', {}) ?? '手机号';

  /// zh-CN: '性别'
  String get gender => TranslationOverrides.string(_root.$meta, 'profile.info.gender', {}) ?? '性别';

  /// zh-CN: '生日'
  String get birthday => TranslationOverrides.string(_root.$meta, 'profile.info.birthday', {}) ?? '生日';

  /// zh-CN: '邮箱'
  String get email => TranslationOverrides.string(_root.$meta, 'profile.info.email', {}) ?? '邮箱';

  /// zh-CN: '未设置'
  String get notSet => TranslationOverrides.string(_root.$meta, 'profile.info.notSet', {}) ?? '未设置';
}

// Path: profile.avatar
class TranslationsProfileAvatarZhCn {
  TranslationsProfileAvatarZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '点击更换头像'
  String get clickToChange => TranslationOverrides.string(_root.$meta, 'profile.avatar.clickToChange', {}) ?? '点击更换头像';

  /// zh-CN: '头像上传功能开发中'
  String get uploading => TranslationOverrides.string(_root.$meta, 'profile.avatar.uploading', {}) ?? '头像上传功能开发中';
}

// Path: settings.schemes
class TranslationsSettingsSchemesZhCn {
  TranslationsSettingsSchemesZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '活力橙 (ShadOrange)'
  String get shadOrange =>
      TranslationOverrides.string(_root.$meta, 'settings.schemes.shadOrange', {}) ?? '活力橙 (ShadOrange)';

  /// zh-CN: '自然绿 (ShadGreen)'
  String get shadGreen =>
      TranslationOverrides.string(_root.$meta, 'settings.schemes.shadGreen', {}) ?? '自然绿 (ShadGreen)';

  /// zh-CN: '巴哈马蓝 (BahamaBlue)'
  String get bahamaBlue =>
      TranslationOverrides.string(_root.$meta, 'settings.schemes.bahamaBlue', {}) ?? '巴哈马蓝 (BahamaBlue)';

  /// zh-CN: '锦缎红 (Damask)'
  String get damask => TranslationOverrides.string(_root.$meta, 'settings.schemes.damask', {}) ?? '锦缎红 (Damask)';
}

// Path: teamOrdering.scenarios
class TranslationsTeamOrderingScenariosZhCn {
  TranslationsTeamOrderingScenariosZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '适用场景'
  String get title => TranslationOverrides.string(_root.$meta, 'teamOrdering.scenarios.title', {}) ?? '适用场景';

  /// zh-CN: '满足不同团队需求'
  String get subtitle => TranslationOverrides.string(_root.$meta, 'teamOrdering.scenarios.subtitle', {}) ?? '满足不同团队需求';

  /// zh-CN: '团队点餐'
  String get team => TranslationOverrides.string(_root.$meta, 'teamOrdering.scenarios.team', {}) ?? '团队点餐';

  /// zh-CN: '企业团建、部门聚餐'
  String get teamDesc => TranslationOverrides.string(_root.$meta, 'teamOrdering.scenarios.teamDesc', {}) ?? '企业团建、部门聚餐';

  /// zh-CN: '预约点餐'
  String get reserve => TranslationOverrides.string(_root.$meta, 'teamOrdering.scenarios.reserve', {}) ?? '预约点餐';

  /// zh-CN: '提前预订，按时取餐'
  String get reserveDesc =>
      TranslationOverrides.string(_root.$meta, 'teamOrdering.scenarios.reserveDesc', {}) ?? '提前预订，按时取餐';

  /// zh-CN: '大客户点餐'
  String get vip => TranslationOverrides.string(_root.$meta, 'teamOrdering.scenarios.vip', {}) ?? '大客户点餐';

  /// zh-CN: '批量订购，专属服务'
  String get vipDesc => TranslationOverrides.string(_root.$meta, 'teamOrdering.scenarios.vipDesc', {}) ?? '批量订购，专属服务';
}

// Path: teamOrdering.process
class TranslationsTeamOrderingProcessZhCn {
  TranslationsTeamOrderingProcessZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '操作流程'
  String get title => TranslationOverrides.string(_root.$meta, 'teamOrdering.process.title', {}) ?? '操作流程';

  /// zh-CN: '简单三步，轻松预订'
  String get subtitle => TranslationOverrides.string(_root.$meta, 'teamOrdering.process.subtitle', {}) ?? '简单三步，轻松预订';

  /// zh-CN: '联系客服'
  String get step1Title => TranslationOverrides.string(_root.$meta, 'teamOrdering.process.step1Title', {}) ?? '联系客服';

  /// zh-CN: '拨打热线或在线咨询，说明用餐需求'
  String get step1Desc =>
      TranslationOverrides.string(_root.$meta, 'teamOrdering.process.step1Desc', {}) ?? '拨打热线或在线咨询，说明用餐需求';

  /// zh-CN: '确认方案'
  String get step2Title => TranslationOverrides.string(_root.$meta, 'teamOrdering.process.step2Title', {}) ?? '确认方案';

  /// zh-CN: '客服为您定制专属方案，确认菜品和价格'
  String get step2Desc =>
      TranslationOverrides.string(_root.$meta, 'teamOrdering.process.step2Desc', {}) ?? '客服为您定制专属方案，确认菜品和价格';

  /// zh-CN: '完成预订'
  String get step3Title => TranslationOverrides.string(_root.$meta, 'teamOrdering.process.step3Title', {}) ?? '完成预订';

  /// zh-CN: '确认订单信息，按时到店自取'
  String get step3Desc =>
      TranslationOverrides.string(_root.$meta, 'teamOrdering.process.step3Desc', {}) ?? '确认订单信息，按时到店自取';
}

// Path: teamOrdering.advantages
class TranslationsTeamOrderingAdvantagesZhCn {
  TranslationsTeamOrderingAdvantagesZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '服务优势'
  String get title => TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.title', {}) ?? '服务优势';

  /// zh-CN: '专业团队，值得信赖'
  String get subtitle =>
      TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.subtitle', {}) ?? '专业团队，值得信赖';

  /// zh-CN: '专业定制'
  String get custom => TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.custom', {}) ?? '专业定制';

  /// zh-CN: '根据团队规模和个人口味，提供个性化定制方案'
  String get customDesc =>
      TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.customDesc', {}) ?? '根据团队规模和个人口味，提供个性化定制方案';

  /// zh-CN: '提前预约'
  String get reserve => TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.reserve', {}) ?? '提前预约';

  /// zh-CN: '支持提前预约，合理安排用餐时间，避免等待'
  String get reserveDesc =>
      TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.reserveDesc', {}) ?? '支持提前预约，合理安排用餐时间，避免等待';

  /// zh-CN: '优惠价格'
  String get price => TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.price', {}) ?? '优惠价格';

  /// zh-CN: '团队订购享受更多折扣，量大更优惠'
  String get priceDesc =>
      TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.priceDesc', {}) ?? '团队订购享受更多折扣，量大更优惠';

  /// zh-CN: '品质保证'
  String get quality => TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.quality', {}) ?? '品质保证';

  /// zh-CN: '严格把控食材质量，确保每一份餐点新鲜美味'
  String get qualityDesc =>
      TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.qualityDesc', {}) ?? '严格把控食材质量，确保每一份餐点新鲜美味';
}

// Path: home.lottery.prizeStats
class TranslationsHomeLotteryPrizeStatsZhCn {
  TranslationsHomeLotteryPrizeStatsZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '总奖品'
  String get total => TranslationOverrides.string(_root.$meta, 'home.lottery.prizeStats.total', {}) ?? '总奖品';

  /// zh-CN: '已使用'
  String get used => TranslationOverrides.string(_root.$meta, 'home.lottery.prizeStats.used', {}) ?? '已使用';

  /// zh-CN: '可用'
  String get available => TranslationOverrides.string(_root.$meta, 'home.lottery.prizeStats.available', {}) ?? '可用';
}

// Path: home.lottery.tabs
class TranslationsHomeLotteryTabsZhCn {
  TranslationsHomeLotteryTabsZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '全部'
  String get all => TranslationOverrides.string(_root.$meta, 'home.lottery.tabs.all', {}) ?? '全部';

  /// zh-CN: '可用'
  String get available => TranslationOverrides.string(_root.$meta, 'home.lottery.tabs.available', {}) ?? '可用';

  /// zh-CN: '已使用'
  String get used => TranslationOverrides.string(_root.$meta, 'home.lottery.tabs.used', {}) ?? '已使用';

  /// zh-CN: '已过期'
  String get expired => TranslationOverrides.string(_root.$meta, 'home.lottery.tabs.expired', {}) ?? '已过期';
}

// Path: home.lottery.prizeCard
class TranslationsHomeLotteryPrizeCardZhCn {
  TranslationsHomeLotteryPrizeCardZhCn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// zh-CN: '乖乖币奖励，可在乖乖币商城使用'
  String get source =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.prizeCard.source', {}) ?? '乖乖币奖励，可在乖乖币商城使用';

  /// zh-CN: '获得时间: {time}'
  String get getTime =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.prizeCard.getTime', {}) ?? '获得时间: {time}';

  /// zh-CN: '有效期至: {time}'
  String get expiryTime =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.prizeCard.expiryTime', {}) ?? '有效期至: {time}';

  /// zh-CN: '已过期'
  String get statusExpired =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.prizeCard.statusExpired', {}) ?? '已过期';
}

/// The flat map containing all translations for locale <zh-CN>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
          'about.title' => TranslationOverrides.string(_root.$meta, 'about.title', {}) ?? '关于我们',
          'about.appBrand' => TranslationOverrides.string(_root.$meta, 'about.appBrand', {}) ?? '好小乖智能盒饭售卖机',
          'about.shareWithFriends' => TranslationOverrides.string(_root.$meta, 'about.shareWithFriends', {}) ?? '分享给朋友',
          'about.featuresTitle' => TranslationOverrides.string(_root.$meta, 'about.featuresTitle', {}) ?? '我们的特色',
          'about.feature1Title' => TranslationOverrides.string(_root.$meta, 'about.feature1Title', {}) ?? '中餐央厨',
          'about.feature1Desc' => TranslationOverrides.string(_root.$meta, 'about.feature1Desc', {}) ?? '售卖机为饮食生活带来的改变',
          'about.feature2Title' => TranslationOverrides.string(_root.$meta, 'about.feature2Title', {}) ?? '出餐迅速',
          'about.feature2Desc' =>
            TranslationOverrides.string(_root.$meta, 'about.feature2Desc', {}) ?? '区别于传统外卖和餐饮店的三维入口',
          'about.feature3Title' => TranslationOverrides.string(_root.$meta, 'about.feature3Title', {}) ?? '创业搭档',
          'about.feature3Desc' => TranslationOverrides.string(_root.$meta, 'about.feature3Desc', {}) ?? '一个无风险的投资创业利器',
          'about.feature4Title' => TranslationOverrides.string(_root.$meta, 'about.feature4Title', {}) ?? '专利机器',
          'about.feature4Desc' => TranslationOverrides.string(_root.$meta, 'about.feature4Desc', {}) ?? '世上再无穷人的造富机',
          'about.policyTitle' => TranslationOverrides.string(_root.$meta, 'about.policyTitle', {}) ?? '政策条款',
          'about.userAgreementAndPrivacy' =>
            TranslationOverrides.string(_root.$meta, 'about.userAgreementAndPrivacy', {}) ?? '用户协议与隐私政策',
          'about.viewDetails' => TranslationOverrides.string(_root.$meta, 'about.viewDetails', {}) ?? '查看详细条款',
          'about.contactTitle' => TranslationOverrides.string(_root.$meta, 'about.contactTitle', {}) ?? '联系我们',
          'about.customerServiceHotline' =>
            TranslationOverrides.string(_root.$meta, 'about.customerServiceHotline', {}) ?? '客服热线',
          'about.customerServiceNumber' =>
            TranslationOverrides.string(_root.$meta, 'about.customerServiceNumber', {}) ?? '400-114-8818',
          'about.companyAddress' => TranslationOverrides.string(_root.$meta, 'about.companyAddress', {}) ?? '公司地址',
          'about.addressDetails' =>
            TranslationOverrides.string(_root.$meta, 'about.addressDetails', {}) ?? '广东省东莞市松山湖园区科汇路1号1栋1510室',
          'about.shareText' => TranslationOverrides.string(_root.$meta, 'about.shareText', {}) ?? '快来使用好小乖智能盒饭售卖机吧！',
          'auth.loginTitle' => TranslationOverrides.string(_root.$meta, 'auth.loginTitle', {}) ?? '欢迎回来',
          'auth.loginButton' => TranslationOverrides.string(_root.$meta, 'auth.loginButton', {}) ?? '登录',
          'auth.registerButton' => TranslationOverrides.string(_root.$meta, 'auth.registerButton', {}) ?? '注册',
          'auth.forgotPassword' => TranslationOverrides.string(_root.$meta, 'auth.forgotPassword', {}) ?? '忘记密码？',
          'auth.loginFailed' => TranslationOverrides.string(_root.$meta, 'auth.loginFailed', {}) ?? '登录失败',
          'auth.loginSuccess' => TranslationOverrides.string(_root.$meta, 'auth.loginSuccess', {}) ?? '登录成功',
          'auth.registerTitle' => TranslationOverrides.string(_root.$meta, 'auth.registerTitle', {}) ?? '创建账号',
          'auth.nickname' => TranslationOverrides.string(_root.$meta, 'auth.nickname', {}) ?? '昵称',
          'auth.registerSuccess' => TranslationOverrides.string(_root.$meta, 'auth.registerSuccess', {}) ?? '注册成功',
          'auth.registerFailed' => TranslationOverrides.string(_root.$meta, 'auth.registerFailed', {}) ?? '注册失败',
          'auth.forgotPasswordTitle' =>
            TranslationOverrides.string(_root.$meta, 'auth.forgotPasswordTitle', {}) ?? '重置密码',
          'auth.sendResetLink' => TranslationOverrides.string(_root.$meta, 'auth.sendResetLink', {}) ?? '发送重置链接',
          'auth.resetLinkSent' => TranslationOverrides.string(_root.$meta, 'auth.resetLinkSent', {}) ?? '重置链接已发送',
          'auth.required' => TranslationOverrides.string(_root.$meta, 'auth.required', {}) ?? '必填',
          'auth.enterUsername' => TranslationOverrides.string(_root.$meta, 'auth.enterUsername', {}) ?? '请输入用户名',
          'auth.enterPassword' => TranslationOverrides.string(_root.$meta, 'auth.enterPassword', {}) ?? '请输入密码',
          'auth.enterUsernameHint' =>
            TranslationOverrides.string(_root.$meta, 'auth.enterUsernameHint', {}) ?? '请输入用户名或手机号',
          'auth.enterNickname' => TranslationOverrides.string(_root.$meta, 'auth.enterNickname', {}) ?? '请输入昵称',
          'auth.dontHaveAccount' => TranslationOverrides.string(_root.$meta, 'auth.dontHaveAccount', {}) ?? '还没有账号？',
          'auth.resetPasswordHint' =>
            TranslationOverrides.string(_root.$meta, 'auth.resetPasswordHint', {}) ?? '请输入您的用户名或邮箱来重置密码',
          'auth.usernameOrEmail' => TranslationOverrides.string(_root.$meta, 'auth.usernameOrEmail', {}) ?? '用户名 / 邮箱',
          'auth.slogan' => TranslationOverrides.string(_root.$meta, 'auth.slogan', {}) ?? '便捷购买，美味随行',
          'cart.title' => TranslationOverrides.string(_root.$meta, 'cart.title', {}) ?? '购物车',
          'cart.clear' => TranslationOverrides.string(_root.$meta, 'cart.clear', {}) ?? '清空',
          'cart.empty' => TranslationOverrides.string(_root.$meta, 'cart.empty', {}) ?? '购物车是空的',
          'cart.total' => TranslationOverrides.string(_root.$meta, 'cart.total', {}) ?? '合计',
          'cart.checkout' => TranslationOverrides.string(_root.$meta, 'cart.checkout', {}) ?? '结算',
          'cart.goShopping' => TranslationOverrides.string(_root.$meta, 'cart.goShopping', {}) ?? '去逛逛',
          'city.title' => TranslationOverrides.string(_root.$meta, 'city.title', {}) ?? '选择城市',
          'city.search' => TranslationOverrides.string(_root.$meta, 'city.search', {}) ?? '搜索城市',
          'city.hot' => TranslationOverrides.string(_root.$meta, 'city.hot', {}) ?? '热门城市',
          'city.noResult' => TranslationOverrides.string(_root.$meta, 'city.noResult', {}) ?? '未找到相关城市',
          'city.viewAll' => TranslationOverrides.string(_root.$meta, 'city.viewAll', {}) ?? '查看所有城市',
          'city.switchSuccess' => TranslationOverrides.string(_root.$meta, 'city.switchSuccess', {}) ?? '城市已切换',
          'city.switchedTo' =>
            ({required Object name}) =>
                TranslationOverrides.string(_root.$meta, 'city.switchedTo', {'name': name}) ?? '已切换到 ${name}',
          'city.switchFailed' => TranslationOverrides.string(_root.$meta, 'city.switchFailed', {}) ?? '切换失败',
          'city.saveFailed' => TranslationOverrides.string(_root.$meta, 'city.saveFailed', {}) ?? '无法保存选择的城市，请重试',
          'common.login' => TranslationOverrides.string(_root.$meta, 'common.login', {}) ?? '登录',
          'common.register' => TranslationOverrides.string(_root.$meta, 'common.register', {}) ?? '注册',
          'common.username' => TranslationOverrides.string(_root.$meta, 'common.username', {}) ?? '用户名',
          'common.password' => TranslationOverrides.string(_root.$meta, 'common.password', {}) ?? '密码',
          'common.confirm' => TranslationOverrides.string(_root.$meta, 'common.confirm', {}) ?? '确认',
          'common.cancel' => TranslationOverrides.string(_root.$meta, 'common.cancel', {}) ?? '取消',
          'common.error' => TranslationOverrides.string(_root.$meta, 'common.error', {}) ?? '错误',
          'common.success' => TranslationOverrides.string(_root.$meta, 'common.success', {}) ?? '成功',
          'common.loading' => TranslationOverrides.string(_root.$meta, 'common.loading', {}) ?? '加载中...',
          'common.ok' => TranslationOverrides.string(_root.$meta, 'common.ok', {}) ?? '确定',
          'common.save' => TranslationOverrides.string(_root.$meta, 'common.save', {}) ?? '保存',
          'common.delete' => TranslationOverrides.string(_root.$meta, 'common.delete', {}) ?? '删除',
          'common.edit' => TranslationOverrides.string(_root.$meta, 'common.edit', {}) ?? '编辑',
          'common.search' => TranslationOverrides.string(_root.$meta, 'common.search', {}) ?? '搜索',
          'common.noData' => TranslationOverrides.string(_root.$meta, 'common.noData', {}) ?? '暂无数据',
          'common.retry' => TranslationOverrides.string(_root.$meta, 'common.retry', {}) ?? '重试',
          'common.skip' => TranslationOverrides.string(_root.$meta, 'common.skip', {}) ?? '跳过',
          'common.refresh' => TranslationOverrides.string(_root.$meta, 'common.refresh', {}) ?? '刷新',
          'common.loadFailed' => TranslationOverrides.string(_root.$meta, 'common.loadFailed', {}) ?? '加载失败',
          'common.unknownError' => TranslationOverrides.string(_root.$meta, 'common.unknownError', {}) ?? '未知错误',
          'common.developing' => TranslationOverrides.string(_root.$meta, 'common.developing', {}) ?? '页面正在开发中',
          'common.appName' => TranslationOverrides.string(_root.$meta, 'common.appName', {}) ?? '好小乖',
          'common.logout' => TranslationOverrides.string(_root.$meta, 'common.logout', {}) ?? '退出',
          'common.pullToRefresh' => TranslationOverrides.string(_root.$meta, 'common.pullToRefresh', {}) ?? '下拉刷新',
          'common.releaseToRefresh' =>
            TranslationOverrides.string(_root.$meta, 'common.releaseToRefresh', {}) ?? '释放刷新',
          'common.refreshing' => TranslationOverrides.string(_root.$meta, 'common.refreshing', {}) ?? '正在刷新...',
          'common.noMoreData' => TranslationOverrides.string(_root.$meta, 'common.noMoreData', {}) ?? '- 已经到底啦 -',
          'common.price' =>
            ({required Object price}) =>
                TranslationOverrides.string(_root.$meta, 'common.price', {'price': price}) ?? '¥${price}',
          'common.networkError' =>
            ({required Object message}) =>
                TranslationOverrides.string(_root.$meta, 'common.networkError', {'message': message}) ??
                '网络错误：${message}',
          'common.networkErrorWithCode' =>
            ({required Object statusCode, required Object message}) =>
                TranslationOverrides.string(_root.$meta, 'common.networkErrorWithCode', {
                  'statusCode': statusCode,
                  'message': message,
                }) ??
                '网络错误 (${statusCode})：${message}',
          'common.serverError' =>
            ({required Object statusCode, required Object message}) =>
                TranslationOverrides.string(_root.$meta, 'common.serverError', {
                  'statusCode': statusCode,
                  'message': message,
                }) ??
                '服务器错误 (${statusCode})：${message}',
          'common.cacheError' =>
            ({required Object message}) =>
                TranslationOverrides.string(_root.$meta, 'common.cacheError', {'message': message}) ??
                '缓存错误：${message}',
          'common.notFound' =>
            ({required Object resource}) =>
                TranslationOverrides.string(_root.$meta, 'common.notFound', {'resource': resource}) ??
                '未找到：${resource}',
          'common.unauthorized' => TranslationOverrides.string(_root.$meta, 'common.unauthorized', {}) ?? '未授权，请重新登录',
          'common.validationError' =>
            ({required Object message}) =>
                TranslationOverrides.string(_root.$meta, 'common.validationError', {'message': message}) ??
                '验证错误：${message}',
          'common.validationErrorWithDetails' =>
            ({required Object message, required Object errors}) =>
                TranslationOverrides.string(_root.$meta, 'common.validationErrorWithDetails', {
                  'message': message,
                  'errors': errors,
                }) ??
                '验证错误：${message} (${errors})',
          'community.title' => TranslationOverrides.string(_root.$meta, 'community.title', {}) ?? '社群福利',
          'community.join' => TranslationOverrides.string(_root.$meta, 'community.join', {}) ?? '加入社群',
          'community.share' => TranslationOverrides.string(_root.$meta, 'community.share', {}) ?? '与美食爱好者一起分享美味',
          'community.org' => TranslationOverrides.string(_root.$meta, 'community.org', {}) ?? '东莞中科云计算研究院',
          'community.dept' => TranslationOverrides.string(_root.$meta, 'community.dept', {}) ?? '云计算中心',
          'community.scanHint' =>
            TranslationOverrides.string(_root.$meta, 'community.scanHint', {}) ?? '扫码加入东莞中科云计算研究院',
          'community.features.coupon' =>
            TranslationOverrides.string(_root.$meta, 'community.features.coupon', {}) ?? '专属优惠券',
          'community.features.couponHint' =>
            TranslationOverrides.string(_root.$meta, 'community.features.couponHint', {}) ?? '群内专享折扣，省钱又美味',
          'community.features.tasting' =>
            TranslationOverrides.string(_root.$meta, 'community.features.tasting', {}) ?? '新品试吃',
          'community.features.tastingHint' =>
            TranslationOverrides.string(_root.$meta, 'community.features.tastingHint', {}) ?? '第一时间品尝最新美食',
          'community.features.exchange' =>
            TranslationOverrides.string(_root.$meta, 'community.features.exchange', {}) ?? '美食交流',
          'community.features.exchangeHint' =>
            TranslationOverrides.string(_root.$meta, 'community.features.exchangeHint', {}) ?? '与美食达人分享心得',
          'community.features.priority' =>
            TranslationOverrides.string(_root.$meta, 'community.features.priority', {}) ?? '活动优先',
          'community.features.priorityHint' =>
            TranslationOverrides.string(_root.$meta, 'community.features.priorityHint', {}) ?? '优先参与各种美食活动',
          'community.features.activity' =>
            TranslationOverrides.string(_root.$meta, 'community.features.activity', {}) ?? '社群活动',
          'community.features.activityHint' =>
            TranslationOverrides.string(_root.$meta, 'community.features.activityHint', {}) ?? '定期举办线下聚会',
          'community.features.topic' =>
            TranslationOverrides.string(_root.$meta, 'community.features.topic', {}) ?? '话题讨论',
          'community.features.topicHint' =>
            TranslationOverrides.string(_root.$meta, 'community.features.topicHint', {}) ?? '参与话题赢取奖励',
          'community.whyJoin' => TranslationOverrides.string(_root.$meta, 'community.whyJoin', {}) ?? '为什么加入我们的社群？',
          'community.reason1' =>
            TranslationOverrides.string(_root.$meta, 'community.reason1', {}) ?? '每日美食推荐，让你不再纠结吃什么',
          'community.reason2' => TranslationOverrides.string(_root.$meta, 'community.reason2', {}) ?? '限时优惠活动，省钱又省心',
          'community.reason3' => TranslationOverrides.string(_root.$meta, 'community.reason3', {}) ?? '专业美食测评，帮你避坑',
          'community.reason4' => TranslationOverrides.string(_root.$meta, 'community.reason4', {}) ?? '美食制作教程，在家也能做出美味',
          'coupon.title' => TranslationOverrides.string(_root.$meta, 'coupon.title', {}) ?? '优惠券',
          'coupon.tabs.available' => TranslationOverrides.string(_root.$meta, 'coupon.tabs.available', {}) ?? '可领取',
          'coupon.tabs.received' => TranslationOverrides.string(_root.$meta, 'coupon.tabs.received', {}) ?? '已领取',
          'coupon.tabs.expired' => TranslationOverrides.string(_root.$meta, 'coupon.tabs.expired', {}) ?? '已过期',
          'coupon.tabs.canUse' => TranslationOverrides.string(_root.$meta, 'coupon.tabs.canUse', {}) ?? '可使用',
          'coupon.tabs.cannotUse' => TranslationOverrides.string(_root.$meta, 'coupon.tabs.cannotUse', {}) ?? '不可使用',
          'coupon.unit' => TranslationOverrides.string(_root.$meta, 'coupon.unit', {}) ?? '¥',
          'coupon.condition' =>
            ({required Object amount}) =>
                TranslationOverrides.string(_root.$meta, 'coupon.condition', {'amount': amount}) ??
                '满减券\n满${amount}元可用',
          'coupon.conditionNoThreshold' =>
            TranslationOverrides.string(_root.$meta, 'coupon.conditionNoThreshold', {}) ?? '满减券\n满0元可用',
          'coupon.validForever' => TranslationOverrides.string(_root.$meta, 'coupon.validForever', {}) ?? '长期有效',
          'coupon.btnReceive' => TranslationOverrides.string(_root.$meta, 'coupon.btnReceive', {}) ?? '立即领取',
          'coupon.btnReceived' => TranslationOverrides.string(_root.$meta, 'coupon.btnReceived', {}) ?? '已领取',
          'coupon.btnUse' => TranslationOverrides.string(_root.$meta, 'coupon.btnUse', {}) ?? '去使用',
          'coupon.btnExpired' => TranslationOverrides.string(_root.$meta, 'coupon.btnExpired', {}) ?? '已过期',
          'coupon.discount' =>
            ({required Object amount}) =>
                TranslationOverrides.string(_root.$meta, 'coupon.discount', {'amount': amount}) ?? '${amount}元优惠券',
          'coupon.discountOff' =>
            ({required Object amount}) =>
                TranslationOverrides.string(_root.$meta, 'coupon.discountOff', {'amount': amount}) ?? '${amount}元减免券',
          'coupon.noCoupons' => TranslationOverrides.string(_root.$meta, 'coupon.noCoupons', {}) ?? '暂无优惠券',
          'coupon.expiryPrefix' => TranslationOverrides.string(_root.$meta, 'coupon.expiryPrefix', {}) ?? '有效期至：',
          'coupon.statusAvailable' => TranslationOverrides.string(_root.$meta, 'coupon.statusAvailable', {}) ?? '可用',
          'coupon.statusUnavailable' =>
            TranslationOverrides.string(_root.$meta, 'coupon.statusUnavailable', {}) ?? '不可用',
          'device.title' => TranslationOverrides.string(_root.$meta, 'device.title', {}) ?? '取餐机',
          'device.info' => TranslationOverrides.string(_root.$meta, 'device.info', {}) ?? '设备信息',
          'device.address' => TranslationOverrides.string(_root.$meta, 'device.address', {}) ?? '地址',
          'device.distance' => TranslationOverrides.string(_root.$meta, 'device.distance', {}) ?? '距离',
          'device.status' => TranslationOverrides.string(_root.$meta, 'device.status', {}) ?? '状态',
          'device.statusOnline' => TranslationOverrides.string(_root.$meta, 'device.statusOnline', {}) ?? '营业中',
          'device.statusOffline' => TranslationOverrides.string(_root.$meta, 'device.statusOffline', {}) ?? '休息中',
          'device.online' => TranslationOverrides.string(_root.$meta, 'device.online', {}) ?? '营业中',
          'device.offline' => TranslationOverrides.string(_root.$meta, 'device.offline', {}) ?? '休息中',
          'device.paymentMethods' => TranslationOverrides.string(_root.$meta, 'device.paymentMethods', {}) ?? '支付方式：',
          'device.mobilePayment' => TranslationOverrides.string(_root.$meta, 'device.mobilePayment', {}) ?? '移动支付',
          'device.cash' => TranslationOverrides.string(_root.$meta, 'device.cash', {}) ?? '现金',
          'device.noProducts' => TranslationOverrides.string(_root.$meta, 'device.noProducts', {}) ?? '暂无商品',
          'device.productList' => TranslationOverrides.string(_root.$meta, 'device.productList', {}) ?? '商品列表',
          'device.soldOut' => TranslationOverrides.string(_root.$meta, 'device.soldOut', {}) ?? '已售罄',
          'device.reportIssue' => TranslationOverrides.string(_root.$meta, 'device.reportIssue', {}) ?? '上报故障',
          'device.reportDeviceIssue' =>
            TranslationOverrides.string(_root.$meta, 'device.reportDeviceIssue', {}) ?? '上报设备故障',
          'device.reportIssueHint' =>
            TranslationOverrides.string(_root.$meta, 'device.reportIssueHint', {}) ?? '请描述设备故障情况...',
          'device.reportSuccess' => TranslationOverrides.string(_root.$meta, 'device.reportSuccess', {}) ?? '故障上报成功',
          'device.loadFailed' =>
            ({required Object error}) =>
                TranslationOverrides.string(_root.$meta, 'device.loadFailed', {'error': error}) ?? '加载失败: ${error}',
          'device.loadProductsFailed' =>
            ({required Object error}) =>
                TranslationOverrides.string(_root.$meta, 'device.loadProductsFailed', {'error': error}) ??
                '加载商品失败: ${error}',
          'device.menu' => TranslationOverrides.string(_root.$meta, 'device.menu', {}) ?? '点餐',
          'device.classicMenu' => TranslationOverrides.string(_root.$meta, 'device.classicMenu', {}) ?? '经典菜单',
          'device.limitedDiscount' => TranslationOverrides.string(_root.$meta, 'device.limitedDiscount', {}) ?? '限时优惠',
          'device.monthlySales' =>
            ({required Object count}) =>
                TranslationOverrides.string(_root.$meta, 'device.monthlySales', {'count': count}) ?? '月售 ${count}',
          'device.stock' =>
            ({required Object count}) =>
                TranslationOverrides.string(_root.$meta, 'device.stock', {'count': count}) ?? '剩余 ${count}',
          'device.soldOutLabel' => TranslationOverrides.string(_root.$meta, 'device.soldOutLabel', {}) ?? '已售罄',
          'device.selfPickupOrder' => TranslationOverrides.string(_root.$meta, 'device.selfPickupOrder', {}) ?? '自取点餐',
          'device.selectedProducts' =>
            TranslationOverrides.string(_root.$meta, 'device.selectedProducts', {}) ?? '已选商品',
          'device.subtotal' => TranslationOverrides.string(_root.$meta, 'device.subtotal', {}) ?? '小计',
          'device.estimatedPrice' => TranslationOverrides.string(_root.$meta, 'device.estimatedPrice', {}) ?? '预估到手',
          'device.originalPrice' => TranslationOverrides.string(_root.$meta, 'device.originalPrice', {}) ?? '原价',
          'device.nearby' => TranslationOverrides.string(_root.$meta, 'device.nearby', {}) ?? '附近营业点',
          'device.frequent' => TranslationOverrides.string(_root.$meta, 'device.frequent', {}) ?? '常去营业点',
          'device.sortByDistance' => TranslationOverrides.string(_root.$meta, 'device.sortByDistance', {}) ?? '按距离排序',
          'device.sortByName' => TranslationOverrides.string(_root.$meta, 'device.sortByName', {}) ?? '按名称排序',
          'device.filterOnline' => TranslationOverrides.string(_root.$meta, 'device.filterOnline', {}) ?? '仅显示在线设备',
          'device.noDevicesNearby' =>
            TranslationOverrides.string(_root.$meta, 'device.noDevicesNearby', {}) ?? '附近暂无设备',
          'device.maintenance' => TranslationOverrides.string(_root.$meta, 'device.maintenance', {}) ?? '维护中',
          'device.unknown' => TranslationOverrides.string(_root.$meta, 'device.unknown', {}) ?? '未知',
          'device.cashPayment' => TranslationOverrides.string(_root.$meta, 'device.cashPayment', {}) ?? '现金支付',
          'device.enabled' => TranslationOverrides.string(_root.$meta, 'device.enabled', {}) ?? '已启用',
          'device.loadedFrequent' =>
            ({required Object count}) =>
                TranslationOverrides.string(_root.$meta, 'device.loadedFrequent', {'count': count}) ??
                '已加载 ${count} 个常用设备',
          'device.noFrequentDevices' =>
            TranslationOverrides.string(_root.$meta, 'device.noFrequentDevices', {}) ?? '暂无常去营业点',
          'device.noNearbyDevices' =>
            TranslationOverrides.string(_root.$meta, 'device.noNearbyDevices', {}) ?? '暂无附近营业点',
          'device.businessHoursDefault' =>
            TranslationOverrides.string(_root.$meta, 'device.businessHoursDefault', {}) ?? '09:00-18:00',
          'device_info.browser' => TranslationOverrides.string(_root.$meta, 'device_info.browser', {}) ?? '浏览器',
          'device_info.platform' => TranslationOverrides.string(_root.$meta, 'device_info.platform', {}) ?? '平台',
          'device_info.userAgent' =>
            TranslationOverrides.string(_root.$meta, 'device_info.userAgent', {}) ?? 'User Agent',
          'device_info.language' => TranslationOverrides.string(_root.$meta, 'device_info.language', {}) ?? '语言',
          'device_info.memory' => TranslationOverrides.string(_root.$meta, 'device_info.memory', {}) ?? '内存',
          'device_info.brand' => TranslationOverrides.string(_root.$meta, 'device_info.brand', {}) ?? '品牌',
          'device_info.model' => TranslationOverrides.string(_root.$meta, 'device_info.model', {}) ?? '型号',
          'device_info.systemVersion' =>
            TranslationOverrides.string(_root.$meta, 'device_info.systemVersion', {}) ?? '系统版本',
          'device_info.sdkVersion' => TranslationOverrides.string(_root.$meta, 'device_info.sdkVersion', {}) ?? 'SDK版本',
          'device_info.manufacturer' =>
            TranslationOverrides.string(_root.$meta, 'device_info.manufacturer', {}) ?? '厂商',
          'device_info.hardware' => TranslationOverrides.string(_root.$meta, 'device_info.hardware', {}) ?? '硬件',
          'device_info.host' => TranslationOverrides.string(_root.$meta, 'device_info.host', {}) ?? '主机',
          'device_info.id' => TranslationOverrides.string(_root.$meta, 'device_info.id', {}) ?? 'ID',
          'device_info.name' => TranslationOverrides.string(_root.$meta, 'device_info.name', {}) ?? '名称',
          'device_info.systemName' => TranslationOverrides.string(_root.$meta, 'device_info.systemName', {}) ?? '系统名',
          'device_info.machine' => TranslationOverrides.string(_root.$meta, 'device_info.machine', {}) ?? '机器码',
          'device_info.uniqueId' => TranslationOverrides.string(_root.$meta, 'device_info.uniqueId', {}) ?? '唯一ID',
          'feedback.title' => TranslationOverrides.string(_root.$meta, 'feedback.title', {}) ?? '问题反馈',
          'feedback.subtitle' => TranslationOverrides.string(_root.$meta, 'feedback.subtitle', {}) ?? '您的反馈是我们进步的动力',
          'feedback.selectType' => TranslationOverrides.string(_root.$meta, 'feedback.selectType', {}) ?? '选择反馈类型',
          'feedback.errorReport' => TranslationOverrides.string(_root.$meta, 'feedback.errorReport', {}) ?? '错误报告',
          'feedback.suggestion' => TranslationOverrides.string(_root.$meta, 'feedback.suggestion', {}) ?? '建议',
          'feedback.complaint' => TranslationOverrides.string(_root.$meta, 'feedback.complaint', {}) ?? '投诉',
          'feedback.other' => TranslationOverrides.string(_root.$meta, 'feedback.other', {}) ?? '其他',
          'feedback.description' => TranslationOverrides.string(_root.$meta, 'feedback.description', {}) ?? '问题描述',
          'feedback.titleHint' => TranslationOverrides.string(_root.$meta, 'feedback.titleHint', {}) ?? '请输入问题标题 (必填)',
          'feedback.contentHint' =>
            TranslationOverrides.string(_root.$meta, 'feedback.contentHint', {}) ?? '请详细描述您遇到的问题或建议 (必填)',
          'feedback.uploadScreenshot' =>
            TranslationOverrides.string(_root.$meta, 'feedback.uploadScreenshot', {}) ?? '上传截图 (可选)',
          'feedback.addImage' => TranslationOverrides.string(_root.$meta, 'feedback.addImage', {}) ?? '添加图片',
          'feedback.uploadLimitHint' =>
            TranslationOverrides.string(_root.$meta, 'feedback.uploadLimitHint', {}) ??
                '最多可上传3张图片，每张不超过2MB，支持jpg、png格式',
          'feedback.contactOptional' =>
            TranslationOverrides.string(_root.$meta, 'feedback.contactOptional', {}) ?? '联系方式 (可选)',
          'feedback.contactInputHint' =>
            TranslationOverrides.string(_root.$meta, 'feedback.contactInputHint', {}) ?? '请输入您的手机号或邮箱，方便我们联系您',
          'feedback.submit' => TranslationOverrides.string(_root.$meta, 'feedback.submit', {}) ?? '提交反馈',
          'feedback.submitSuccess' =>
            TranslationOverrides.string(_root.$meta, 'feedback.submitSuccess', {}) ?? '反馈提交成功，感谢您的支持',
          'feedback.submitFailed' =>
            TranslationOverrides.string(_root.$meta, 'feedback.submitFailed', {}) ?? '反馈提交失败，请稍后重试',
          'help.title' => TranslationOverrides.string(_root.$meta, 'help.title', {}) ?? '帮助中心',
          'help.developing' => TranslationOverrides.string(_root.$meta, 'help.developing', {}) ?? '帮助页面正在开发中',
          'home.selectCity' => TranslationOverrides.string(_root.$meta, 'home.selectCity', {}) ?? '选择城市',
          'home.nearbyDevices' => TranslationOverrides.string(_root.$meta, 'home.nearbyDevices', {}) ?? '附近设备',
          'home.banner1Title' => TranslationOverrides.string(_root.$meta, 'home.banner1Title', {}) ?? '便捷购买',
          'home.banner1Subtitle' => TranslationOverrides.string(_root.$meta, 'home.banner1Subtitle', {}) ?? '美味随行',
          'home.banner2Title' => TranslationOverrides.string(_root.$meta, 'home.banner2Title', {}) ?? '新鲜速递',
          'home.banner2Subtitle' => TranslationOverrides.string(_root.$meta, 'home.banner2Subtitle', {}) ?? '每日更新',
          'home.banner3Title' => TranslationOverrides.string(_root.$meta, 'home.banner3Title', {}) ?? '超值优惠',
          'home.banner3Subtitle' => TranslationOverrides.string(_root.$meta, 'home.banner3Subtitle', {}) ?? '限时特价',
          'home.noDevices' => TranslationOverrides.string(_root.$meta, 'home.noDevices', {}) ?? '附近暂无设备',
          'home.welcome' => TranslationOverrides.string(_root.$meta, 'home.welcome', {}) ?? '您好，好小乖用户',
          'home.selfPickup' => TranslationOverrides.string(_root.$meta, 'home.selfPickup', {}) ?? '自取点餐',
          'home.selfPickupHint' => TranslationOverrides.string(_root.$meta, 'home.selfPickupHint', {}) ?? '扫码取餐/打包带走',
          'home.teamOrder' => TranslationOverrides.string(_root.$meta, 'home.teamOrder', {}) ?? '团队点餐',
          'home.teamOrderHint' => TranslationOverrides.string(_root.$meta, 'home.teamOrderHint', {}) ?? '多人订购/团队点餐',
          'home.invite' => TranslationOverrides.string(_root.$meta, 'home.invite', {}) ?? '邀请有礼',
          'home.inviteHint' => TranslationOverrides.string(_root.$meta, 'home.inviteHint', {}) ?? '邀请好友得现金',
          'home.recommendTitle' => TranslationOverrides.string(_root.$meta, 'home.recommendTitle', {}) ?? '为我推荐',
          'home.grid.welfare' => TranslationOverrides.string(_root.$meta, 'home.grid.welfare', {}) ?? '社群福利',
          'home.grid.service' => TranslationOverrides.string(_root.$meta, 'home.grid.service', {}) ?? '客服中心',
          'home.grid.coupon' => TranslationOverrides.string(_root.$meta, 'home.grid.coupon', {}) ?? '领优惠券',
          'home.grid.lottery' => TranslationOverrides.string(_root.$meta, 'home.grid.lottery', {}) ?? '幸运抽奖',
          'home.grid.invite' => TranslationOverrides.string(_root.$meta, 'home.grid.invite', {}) ?? '邀请好友',
          'home.grid.inviteHint' => TranslationOverrides.string(_root.$meta, 'home.grid.inviteHint', {}) ?? '邀请好友得现金',
          'home.lottery.title' => TranslationOverrides.string(_root.$meta, 'home.lottery.title', {}) ?? '幸运抽奖',
          'home.lottery.prizes' => TranslationOverrides.string(_root.$meta, 'home.lottery.prizes', {}) ?? '我的奖品',
          'home.lottery.rules' => TranslationOverrides.string(_root.$meta, 'home.lottery.rules', {}) ?? '抽奖规则',
          'home.lottery.remaining' =>
            TranslationOverrides.string(_root.$meta, 'home.lottery.remaining', {}) ?? '剩余次数: {count}',
          'home.lottery.spin' => TranslationOverrides.string(_root.$meta, 'home.lottery.spin', {}) ?? '抽奖',
          'home.lottery.rule1' =>
            TranslationOverrides.string(_root.$meta, 'home.lottery.rule1', {}) ?? '每日有免费抽奖次数，次数用完后可领取任务获得',
          'home.lottery.rule2' =>
            TranslationOverrides.string(_root.$meta, 'home.lottery.rule2', {}) ?? '优惠券48小时内有效，乖乖币自动到账',
          'home.lottery.rule3' => TranslationOverrides.string(_root.$meta, 'home.lottery.rule3', {}) ?? '活动最终解释权归平台所有',
          'home.lottery.prizeUnit' => TranslationOverrides.string(_root.$meta, 'home.lottery.prizeUnit', {}) ?? '乖乖币',
          'home.lottery.prizeList' => TranslationOverrides.string(_root.$meta, 'home.lottery.prizeList', {}) ?? '奖品说明',
          'home.lottery.back' => TranslationOverrides.string(_root.$meta, 'home.lottery.back', {}) ?? '返回',
          'home.lottery.prizeStats.total' =>
            TranslationOverrides.string(_root.$meta, 'home.lottery.prizeStats.total', {}) ?? '总奖品',
          'home.lottery.prizeStats.used' =>
            TranslationOverrides.string(_root.$meta, 'home.lottery.prizeStats.used', {}) ?? '已使用',
          'home.lottery.prizeStats.available' =>
            TranslationOverrides.string(_root.$meta, 'home.lottery.prizeStats.available', {}) ?? '可用',
          'home.lottery.tabs.all' => TranslationOverrides.string(_root.$meta, 'home.lottery.tabs.all', {}) ?? '全部',
          'home.lottery.tabs.available' =>
            TranslationOverrides.string(_root.$meta, 'home.lottery.tabs.available', {}) ?? '可用',
          'home.lottery.tabs.used' => TranslationOverrides.string(_root.$meta, 'home.lottery.tabs.used', {}) ?? '已使用',
          'home.lottery.tabs.expired' =>
            TranslationOverrides.string(_root.$meta, 'home.lottery.tabs.expired', {}) ?? '已过期',
          'home.lottery.prizeCard.source' =>
            TranslationOverrides.string(_root.$meta, 'home.lottery.prizeCard.source', {}) ?? '乖乖币奖励，可在乖乖币商城使用',
          'home.lottery.prizeCard.getTime' =>
            TranslationOverrides.string(_root.$meta, 'home.lottery.prizeCard.getTime', {}) ?? '获得时间: {time}',
          'home.lottery.prizeCard.expiryTime' =>
            TranslationOverrides.string(_root.$meta, 'home.lottery.prizeCard.expiryTime', {}) ?? '有效期至: {time}',
          'home.lottery.prizeCard.statusExpired' =>
            TranslationOverrides.string(_root.$meta, 'home.lottery.prizeCard.statusExpired', {}) ?? '已过期',
          'home.status.open' => TranslationOverrides.string(_root.$meta, 'home.status.open', {}) ?? '营业中',
          'home.status.closed' => TranslationOverrides.string(_root.$meta, 'home.status.closed', {}) ?? '休息中',
          'home.status.mobilePayment' =>
            TranslationOverrides.string(_root.$meta, 'home.status.mobilePayment', {}) ?? '支持移动支付',
          'invite.title' => TranslationOverrides.string(_root.$meta, 'invite.title', {}) ?? '邀请好友',
          'invite.ruleBtn' => TranslationOverrides.string(_root.$meta, 'invite.ruleBtn', {}) ?? '规则',
          'invite.rewardTitle' => TranslationOverrides.string(_root.$meta, 'invite.rewardTitle', {}) ?? '1元',
          'invite.rewardSubtitle' => TranslationOverrides.string(_root.$meta, 'invite.rewardSubtitle', {}) ?? '无门槛券',
          'invite.rewardDesc' => TranslationOverrides.string(_root.$meta, 'invite.rewardDesc', {}) ?? '每邀请1个人重复可得',
          'invite.myCode' => TranslationOverrides.string(_root.$meta, 'invite.myCode', {}) ?? '我的邀请码',
          'invite.copy' => TranslationOverrides.string(_root.$meta, 'invite.copy', {}) ?? '复制',
          'invite.btnInvite' => TranslationOverrides.string(_root.$meta, 'invite.btnInvite', {}) ?? '邀请微信好友',
          'invite.processTitle' => TranslationOverrides.string(_root.$meta, 'invite.processTitle', {}) ?? '邀请流程',
          'invite.step1' => TranslationOverrides.string(_root.$meta, 'invite.step1', {}) ?? '分享链接',
          'invite.step1Desc' => TranslationOverrides.string(_root.$meta, 'invite.step1Desc', {}) ?? '给好友',
          'invite.step2' => TranslationOverrides.string(_root.$meta, 'invite.step2', {}) ?? '好友注册',
          'invite.step2Desc' => TranslationOverrides.string(_root.$meta, 'invite.step2Desc', {}) ?? '得新人礼包',
          'invite.step3' => TranslationOverrides.string(_root.$meta, 'invite.step3', {}) ?? '好友首单',
          'invite.step3Desc' => TranslationOverrides.string(_root.$meta, 'invite.step3Desc', {}) ?? '实付≥5元',
          'invite.step4' => TranslationOverrides.string(_root.$meta, 'invite.step4', {}) ?? '邀请达成',
          'invite.step4Desc' => TranslationOverrides.string(_root.$meta, 'invite.step4Desc', {}) ?? '获得奖励',
          'invite.stats' => TranslationOverrides.string(_root.$meta, 'invite.stats', {}) ?? '我的成就',
          'invite.invitedCount' => TranslationOverrides.string(_root.$meta, 'invite.invitedCount', {}) ?? '已成功邀请(人)',
          'invite.rewardAmount' => TranslationOverrides.string(_root.$meta, 'invite.rewardAmount', {}) ?? '已获得奖励(元)',
          'invite.rules.title' => TranslationOverrides.string(_root.$meta, 'invite.rules.title', {}) ?? '邀请规则',
          'invite.rules.section1' => TranslationOverrides.string(_root.$meta, 'invite.rules.section1', {}) ?? '邀请规则',
          'invite.rules.rule1' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.rule1', {}) ?? '每成功邀请1位好友注册，即可获得1元无门槛优惠券',
          'invite.rules.rule2' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.rule2', {}) ?? '邀请好友需完成首次下单（实付金额≥15元）才算成功',
          'invite.rules.rule3' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.rule3', {}) ?? '每位好友仅可被邀请一次，重复邀请无效',
          'invite.rules.rule4' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.rule4', {}) ?? '邀请奖励无上限，邀请越多奖励越多',
          'invite.rules.rule5' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.rule5', {}) ?? '邀请记录永久保存，可随时查看',
          'invite.rules.section2' => TranslationOverrides.string(_root.$meta, 'invite.rules.section2', {}) ?? '奖励说明',
          'invite.rules.reward1' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.reward1', {}) ?? '1元无门槛优惠券，可直接抵扣订单金额',
          'invite.rules.reward2' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.reward2', {}) ?? '优惠券有效期为30天，请在有效期内使用',
          'invite.rules.reward3' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.reward3', {}) ?? '优惠券不可与其他优惠活动同时使用',
          'invite.rules.reward4' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.reward4', {}) ?? '优惠券仅限在好小乖智能盒饭售卖机使用',
          'invite.rules.reward5' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.reward5', {}) ?? '优惠券不可转让、不可兑换现金',
          'invite.rules.section3' => TranslationOverrides.string(_root.$meta, 'invite.rules.section3', {}) ?? '注意事项',
          'invite.rules.note1' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.note1', {}) ?? '邀请好友必须通过官方邀请链接进行',
          'invite.rules.note2' => TranslationOverrides.string(_root.$meta, 'invite.rules.note2', {}) ?? '好友注册后需完成实名认证',
          'invite.rules.note3' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.note3', {}) ?? '如发现恶意刷邀请行为，平台有权取消奖励',
          'invite.rules.note4' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.note4', {}) ?? '活动规则最终解释权归好小乖智能盒饭售卖机所有',
          'invite.rules.note5' => TranslationOverrides.string(_root.$meta, 'invite.rules.note5', {}) ?? '如有疑问请联系客服处理',
          'invite.rules.section4' => TranslationOverrides.string(_root.$meta, 'invite.rules.section4', {}) ?? '邀请流程',
          'invite.rules.process1' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.process1', {}) ?? '分享邀请链接给好友',
          'invite.rules.process2' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.process2', {}) ?? '好友通过链接注册账号',
          'invite.rules.process3' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.process3', {}) ?? '好友完成首次下单（≥15元）',
          'invite.rules.process4' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.process4', {}) ?? '系统自动发放奖励到您的账户',
          'invite.rules.process5' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.process5', {}) ?? '可在“我的成就”中查看邀请记录',
          'navigation.home' => TranslationOverrides.string(_root.$meta, 'navigation.home', {}) ?? '首页',
          'navigation.device' => TranslationOverrides.string(_root.$meta, 'navigation.device', {}) ?? '设备',
          'navigation.orders' => TranslationOverrides.string(_root.$meta, 'navigation.orders', {}) ?? '订单',
          'navigation.profile' => TranslationOverrides.string(_root.$meta, 'navigation.profile', {}) ?? '个人中心',
          'network.errors.connectionTimeout' =>
            TranslationOverrides.string(_root.$meta, 'network.errors.connectionTimeout', {}) ?? '连接超时，请检查网络连接',
          'network.errors.sendTimeout' =>
            TranslationOverrides.string(_root.$meta, 'network.errors.sendTimeout', {}) ?? '发送请求超时，请检查网络连接',
          'network.errors.receiveTimeout' =>
            TranslationOverrides.string(_root.$meta, 'network.errors.receiveTimeout', {}) ?? '接收响应超时，请检查网络连接',
          'network.errors.badCertificate' =>
            TranslationOverrides.string(_root.$meta, 'network.errors.badCertificate', {}) ?? '证书验证失败',
          'network.errors.cancel' => TranslationOverrides.string(_root.$meta, 'network.errors.cancel', {}) ?? '请求已取消',
          'network.errors.connectionError' =>
            TranslationOverrides.string(_root.$meta, 'network.errors.connectionError', {}) ?? '网络连接失败，请检查网络设置',
          'network.errors.unknown' =>
            ({required Object error}) =>
                TranslationOverrides.string(_root.$meta, 'network.errors.unknown', {'error': error}) ?? '未知错误：${error}',
          'network.errors.retryLater' =>
            TranslationOverrides.string(_root.$meta, 'network.errors.retryLater', {}) ?? '请稍后重试',
          'network.errors.badRequest' =>
            TranslationOverrides.string(_root.$meta, 'network.errors.badRequest', {}) ?? '请求参数错误',
          'network.errors.unauthorized' =>
            TranslationOverrides.string(_root.$meta, 'network.errors.unauthorized', {}) ?? '未授权，请重新登录',
          'network.errors.forbidden' =>
            TranslationOverrides.string(_root.$meta, 'network.errors.forbidden', {}) ?? '没有权限访问该资源',
          'network.errors.notFound' =>
            TranslationOverrides.string(_root.$meta, 'network.errors.notFound', {}) ?? '请求的资源不存在',
          'network.errors.timeout' =>
            TranslationOverrides.string(_root.$meta, 'network.errors.timeout', {}) ?? '请求超时，请重试',
          'network.errors.conflict' =>
            TranslationOverrides.string(_root.$meta, 'network.errors.conflict', {}) ?? '请求冲突',
          'network.errors.validationFailed' =>
            TranslationOverrides.string(_root.$meta, 'network.errors.validationFailed', {}) ?? '请求数据验证失败',
          'network.errors.tooManyRequests' =>
            TranslationOverrides.string(_root.$meta, 'network.errors.tooManyRequests', {}) ?? '请求过于频繁，请稍后重试',
          'network.errors.internalServerError' =>
            TranslationOverrides.string(_root.$meta, 'network.errors.internalServerError', {}) ?? '服务器内部错误',
          'network.errors.badGateway' =>
            TranslationOverrides.string(_root.$meta, 'network.errors.badGateway', {}) ?? '网关错误，请稍后重试',
          'network.errors.serviceUnavailable' =>
            TranslationOverrides.string(_root.$meta, 'network.errors.serviceUnavailable', {}) ?? '服务暂时不可用，请稍后重试',
          'network.errors.gatewayTimeout' =>
            TranslationOverrides.string(_root.$meta, 'network.errors.gatewayTimeout', {}) ?? '网关超时，请稍后重试',
          'network.errors.serverError' =>
            ({required Object code}) =>
                TranslationOverrides.string(_root.$meta, 'network.errors.serverError', {'code': code}) ??
                '服务器错误（${code}）',
          'network.errors.requestError' =>
            ({required Object code}) =>
                TranslationOverrides.string(_root.$meta, 'network.errors.requestError', {'code': code}) ??
                '请求错误（${code}）',
          'network.errors.failed' => TranslationOverrides.string(_root.$meta, 'network.errors.failed', {}) ?? '网络请求失败',
          'onboarding.welcomeTitle' =>
            TranslationOverrides.string(_root.$meta, 'onboarding.welcomeTitle', {}) ?? '欢迎使用饭盒售货机',
          'onboarding.welcomeBody' =>
            TranslationOverrides.string(_root.$meta, 'onboarding.welcomeBody', {}) ?? '随时随地，轻松购买美味午餐',
          'onboarding.findDevicesTitle' =>
            TranslationOverrides.string(_root.$meta, 'onboarding.findDevicesTitle', {}) ?? '查找附近设备',
          'onboarding.findDevicesBody' =>
            TranslationOverrides.string(_root.$meta, 'onboarding.findDevicesBody', {}) ?? '快速定位最近的售货机，节省您的时间',
          'onboarding.paymentTitle' =>
            TranslationOverrides.string(_root.$meta, 'onboarding.paymentTitle', {}) ?? '便捷支付',
          'onboarding.paymentBody' =>
            TranslationOverrides.string(_root.$meta, 'onboarding.paymentBody', {}) ?? '支持信用卡等多种便捷支付方式',
          'onboarding.getStarted' => TranslationOverrides.string(_root.$meta, 'onboarding.getStarted', {}) ?? '开始使用',
          'order.myOrders' => TranslationOverrides.string(_root.$meta, 'order.myOrders', {}) ?? '我的订单',
          'order.foodOrder' => TranslationOverrides.string(_root.$meta, 'order.foodOrder', {}) ?? '食品订单',
          'order.mallOrder' => TranslationOverrides.string(_root.$meta, 'order.mallOrder', {}) ?? '商城订单',
          'order.noOrders' => TranslationOverrides.string(_root.$meta, 'order.noOrders', {}) ?? '暂无订单',
          'order.detail' => TranslationOverrides.string(_root.$meta, 'order.detail', {}) ?? '订单详情',
          'order.status.all' => TranslationOverrides.string(_root.$meta, 'order.status.all', {}) ?? '全部订单',
          'order.status.pending' => TranslationOverrides.string(_root.$meta, 'order.status.pending', {}) ?? '待支付',
          'order.status.paid' => TranslationOverrides.string(_root.$meta, 'order.status.paid', {}) ?? '已支付',
          'order.status.used' => TranslationOverrides.string(_root.$meta, 'order.status.used', {}) ?? '已使用',
          'order.status.completed' => TranslationOverrides.string(_root.$meta, 'order.status.completed', {}) ?? '已完成',
          'order.status.cancelled' => TranslationOverrides.string(_root.$meta, 'order.status.cancelled', {}) ?? '已取消',
          'order.status.refunded' => TranslationOverrides.string(_root.$meta, 'order.status.refunded', {}) ?? '退款',
          'order.status.failed' => TranslationOverrides.string(_root.$meta, 'order.status.failed', {}) ?? '支付失败',
          'order.expiryHint' => TranslationOverrides.string(_root.$meta, 'order.expiryHint', {}) ?? '订单将于今晚10点30分过期',
          'order.pickupCode' => TranslationOverrides.string(_root.$meta, 'order.pickupCode', {}) ?? '取货码',
          'order.pickupHint' => TranslationOverrides.string(_root.$meta, 'order.pickupHint', {}) ?? '请在设备上输入取货码取货',
          'order.items' => TranslationOverrides.string(_root.$meta, 'order.items', {}) ?? '商品清单',
          'order.info' => TranslationOverrides.string(_root.$meta, 'order.info', {}) ?? '订单信息',
          'order.id' => TranslationOverrides.string(_root.$meta, 'order.id', {}) ?? '订单号',
          'order.createdAt' => TranslationOverrides.string(_root.$meta, 'order.createdAt', {}) ?? '创建时间',
          'order.paidAt' => TranslationOverrides.string(_root.$meta, 'order.paidAt', {}) ?? '支付时间',
          'order.paymentMethod' => TranslationOverrides.string(_root.$meta, 'order.paymentMethod', {}) ?? '支付方式',
          'order.totalAmount' => TranslationOverrides.string(_root.$meta, 'order.totalAmount', {}) ?? '订单总额',
          'order.unknown' => TranslationOverrides.string(_root.$meta, 'order.unknown', {}) ?? '未知',
          'order.refresh' => TranslationOverrides.string(_root.$meta, 'order.refresh', {}) ?? '刷新',
          'order.itemsCount' =>
            ({required Object count}) =>
                TranslationOverrides.string(_root.$meta, 'order.itemsCount', {'count': count}) ?? '等${count}件商品',
          'order.orderIdLabel' => TranslationOverrides.string(_root.$meta, 'order.orderIdLabel', {}) ?? '订单号：',
          'order.orderAmount' => TranslationOverrides.string(_root.$meta, 'order.orderAmount', {}) ?? '订单金额',
          'order.payNow' => TranslationOverrides.string(_root.$meta, 'order.payNow', {}) ?? '立即支付',
          'order.cancelOrder' => TranslationOverrides.string(_root.$meta, 'order.cancelOrder', {}) ?? '取消订单',
          'order.contactService' => TranslationOverrides.string(_root.$meta, 'order.contactService', {}) ?? '联系客服',
          'order.applyRefund' => TranslationOverrides.string(_root.$meta, 'order.applyRefund', {}) ?? '申请退款',
          'order.paymentStripe' =>
            TranslationOverrides.string(_root.$meta, 'order.paymentStripe', {}) ?? 'Stripe (信用卡)',
          'order.paymentWechat' => TranslationOverrides.string(_root.$meta, 'order.paymentWechat', {}) ?? '微信支付',
          'order.paymentAlipay' => TranslationOverrides.string(_root.$meta, 'order.paymentAlipay', {}) ?? '支付宝',
          'order.viewDetail' => TranslationOverrides.string(_root.$meta, 'order.viewDetail', {}) ?? '查看详情',
          'order.cancelConfirmTitle' =>
            TranslationOverrides.string(_root.$meta, 'order.cancelConfirmTitle', {}) ?? '确认取消',
          'order.cancelConfirmContent' =>
            TranslationOverrides.string(_root.$meta, 'order.cancelConfirmContent', {}) ?? '确定要取消这个订单吗？',
          'order.orderCancelled' => TranslationOverrides.string(_root.$meta, 'order.orderCancelled', {}) ?? '订单已取消',
          'order.confirmOrder' => TranslationOverrides.string(_root.$meta, 'order.confirmOrder', {}) ?? '确认订单',
          'order.actualAmount' => TranslationOverrides.string(_root.$meta, 'order.actualAmount', {}) ?? '实付金额',
          'order.totalLabel' => TranslationOverrides.string(_root.$meta, 'order.totalLabel', {}) ?? '合计: ',
          'order.submitOrder' => TranslationOverrides.string(_root.$meta, 'order.submitOrder', {}) ?? '提交订单',
          'order.createFailed' =>
            ({required Object error}) =>
                TranslationOverrides.string(_root.$meta, 'order.createFailed', {'error': error}) ?? '创建订单失败: ${error}',
          'order.retry' => TranslationOverrides.string(_root.$meta, 'order.retry', {}) ?? '重试',
          'order.loadFailed' =>
            ({required Object error}) =>
                TranslationOverrides.string(_root.$meta, 'order.loadFailed', {'error': error}) ?? '加载失败: ${error}',
          'order.specs' =>
            ({required Object specs}) =>
                TranslationOverrides.string(_root.$meta, 'order.specs', {'specs': specs}) ?? '规格：${specs}',
          'order.summary' =>
            ({required Object count}) =>
                TranslationOverrides.string(_root.$meta, 'order.summary', {'count': count}) ?? '共${count}件 合计：',
          'order.refund' => TranslationOverrides.string(_root.$meta, 'order.refund', {}) ?? '退款',
          'order.viewCode' => TranslationOverrides.string(_root.$meta, 'order.viewCode', {}) ?? '查看券码',
          'order.deleteOrder' => TranslationOverrides.string(_root.$meta, 'order.deleteOrder', {}) ?? '删除订单',
          'order.reorder' => TranslationOverrides.string(_root.$meta, 'order.reorder', {}) ?? '重新购买',
          'order.paySuccess' => TranslationOverrides.string(_root.$meta, 'order.paySuccess', {}) ?? '支付成功',
          'order.reorderSuccess' => TranslationOverrides.string(_root.$meta, 'order.reorderSuccess', {}) ?? '已重新下单',
          'order.refundNotAvailable' =>
            TranslationOverrides.string(_root.$meta, 'order.refundNotAvailable', {}) ?? '退款功能暂未开放',
          'order.deleteNotAvailable' =>
            TranslationOverrides.string(_root.$meta, 'order.deleteNotAvailable', {}) ?? '删除功能暂未开放',
          'order.operationFailed' =>
            ({required Object error}) =>
                TranslationOverrides.string(_root.$meta, 'order.operationFailed', {'error': error}) ?? '操作失败: ${error}',
          'order.scanQrHint' => TranslationOverrides.string(_root.$meta, 'order.scanQrHint', {}) ?? '请对准柜机扫描二维码',
          'order.pickupCodeHint' =>
            TranslationOverrides.string(_root.$meta, 'order.pickupCodeHint', {}) ?? '请凭码取餐，祝您用餐愉快',
          'order.storeInfo' => TranslationOverrides.string(_root.$meta, 'order.storeInfo', {}) ?? '门店信息',
          'order.productInfo' => TranslationOverrides.string(_root.$meta, 'order.productInfo', {}) ?? '商品信息',
          'order.device' => TranslationOverrides.string(_root.$meta, 'order.device', {}) ?? '取餐设备',
          'order.serviceNotAvailable' =>
            TranslationOverrides.string(_root.$meta, 'order.serviceNotAvailable', {}) ?? '客服功能暂未开放',
          'partner.title' => TranslationOverrides.string(_root.$meta, 'partner.title', {}) ?? '合作商加盟',
          'partner.subtitle' => TranslationOverrides.string(_root.$meta, 'partner.subtitle', {}) ?? '携手共创美好未来',
          'partner.advantages' => TranslationOverrides.string(_root.$meta, 'partner.advantages', {}) ?? '合作优势',
          'partner.advantage1Title' =>
            TranslationOverrides.string(_root.$meta, 'partner.advantage1Title', {}) ?? '丰厚收益',
          'partner.advantage1Desc' =>
            TranslationOverrides.string(_root.$meta, 'partner.advantage1Desc', {}) ?? '提供有竞争力的分成比例，让您的投入获得丰厚回报',
          'partner.advantage2Title' =>
            TranslationOverrides.string(_root.$meta, 'partner.advantage2Title', {}) ?? '品牌支持',
          'partner.advantage2Desc' =>
            TranslationOverrides.string(_root.$meta, 'partner.advantage2Desc', {}) ?? '共享知名品牌资源，享受品牌效应带来的客户信任',
          'partner.advantage3Title' =>
            TranslationOverrides.string(_root.$meta, 'partner.advantage3Title', {}) ?? '市场推广',
          'partner.advantage3Desc' =>
            TranslationOverrides.string(_root.$meta, 'partner.advantage3Desc', {}) ?? '专业的市场推广团队，为您提供全方位的营销支持',
          'partner.advantage4Title' =>
            TranslationOverrides.string(_root.$meta, 'partner.advantage4Title', {}) ?? '培训支持',
          'partner.advantage4Desc' =>
            TranslationOverrides.string(_root.$meta, 'partner.advantage4Desc', {}) ?? '提供专业的培训课程，帮助您快速掌握经营技巧',
          'partner.process' => TranslationOverrides.string(_root.$meta, 'partner.process', {}) ?? '合作流程',
          'partner.process1Title' => TranslationOverrides.string(_root.$meta, 'partner.process1Title', {}) ?? '提交申请',
          'partner.process1Desc' =>
            TranslationOverrides.string(_root.$meta, 'partner.process1Desc', {}) ?? '填写合作申请表，提交相关资料',
          'partner.process2Title' => TranslationOverrides.string(_root.$meta, 'partner.process2Title', {}) ?? '资质审核',
          'partner.process2Desc' =>
            TranslationOverrides.string(_root.$meta, 'partner.process2Desc', {}) ?? '我们将在3-5个工作日内完成资质审核',
          'partner.process3Title' => TranslationOverrides.string(_root.$meta, 'partner.process3Title', {}) ?? '面谈沟通',
          'partner.process3Desc' =>
            TranslationOverrides.string(_root.$meta, 'partner.process3Desc', {}) ?? '安排面谈，详细了解合作细节',
          'partner.process4Title' => TranslationOverrides.string(_root.$meta, 'partner.process4Title', {}) ?? '签署协议',
          'partner.process4Desc' =>
            TranslationOverrides.string(_root.$meta, 'partner.process4Desc', {}) ?? '双方达成一致后签署正式合作协议',
          'partner.process5Title' => TranslationOverrides.string(_root.$meta, 'partner.process5Title', {}) ?? '开始合作',
          'partner.process5Desc' =>
            TranslationOverrides.string(_root.$meta, 'partner.process5Desc', {}) ?? '正式启动合作，享受各项支持服务',
          'partner.conditions' => TranslationOverrides.string(_root.$meta, 'partner.conditions', {}) ?? '合作条件',
          'partner.condition1' => TranslationOverrides.string(_root.$meta, 'partner.condition1', {}) ?? '具有合法的经营资质',
          'partner.condition2' => TranslationOverrides.string(_root.$meta, 'partner.condition2', {}) ?? '有一定的资金实力和经营能力',
          'partner.condition3' =>
            TranslationOverrides.string(_root.$meta, 'partner.condition3', {}) ?? '认同我们的品牌理念和经营模式',
          'partner.condition4' => TranslationOverrides.string(_root.$meta, 'partner.condition4', {}) ?? '具备良好的商业信誉',
          'partner.condition5' => TranslationOverrides.string(_root.$meta, 'partner.condition5', {}) ?? '有相关行业经验者优先',
          'partner.applicationTitle' =>
            TranslationOverrides.string(_root.$meta, 'partner.applicationTitle', {}) ?? '申请合作',
          'partner.nameLabel' => TranslationOverrides.string(_root.$meta, 'partner.nameLabel', {}) ?? '姓名',
          'partner.nameInputHint' => TranslationOverrides.string(_root.$meta, 'partner.nameInputHint', {}) ?? '请输入您的姓名',
          'partner.companyLabel' => TranslationOverrides.string(_root.$meta, 'partner.companyLabel', {}) ?? '公司名称',
          'partner.companyInputHint' =>
            TranslationOverrides.string(_root.$meta, 'partner.companyInputHint', {}) ?? '请输入公司名称',
          'partner.phoneLabel' => TranslationOverrides.string(_root.$meta, 'partner.phoneLabel', {}) ?? '联系电话',
          'partner.phoneInputHint' =>
            TranslationOverrides.string(_root.$meta, 'partner.phoneInputHint', {}) ?? '请输入联系电话',
          'partner.intentionLabel' => TranslationOverrides.string(_root.$meta, 'partner.intentionLabel', {}) ?? '合作意向',
          'partner.intentionInputHint' =>
            TranslationOverrides.string(_root.$meta, 'partner.intentionInputHint', {}) ?? '请简述您的合作意向',
          'partner.submit' => TranslationOverrides.string(_root.$meta, 'partner.submit', {}) ?? '提交申请',
          'partner.submitSuccess' =>
            TranslationOverrides.string(_root.$meta, 'partner.submitSuccess', {}) ?? '申请提交成功，我们会尽快联系您',
          'partner.submitFailed' =>
            TranslationOverrides.string(_root.$meta, 'partner.submitFailed', {}) ?? '申请提交失败，请稍后重试',
          'partner.incompleteInfo' =>
            TranslationOverrides.string(_root.$meta, 'partner.incompleteInfo', {}) ?? '请填写完整信息',
          'partner.contactTitle' => TranslationOverrides.string(_root.$meta, 'partner.contactTitle', {}) ?? '联系我们',
          'partner.serviceHotline' => TranslationOverrides.string(_root.$meta, 'partner.serviceHotline', {}) ?? '客服热线',
          'partner.address' => TranslationOverrides.string(_root.$meta, 'partner.address', {}) ?? '地址',
          'partner.errorOccurred' =>
            ({required Object error}) =>
                TranslationOverrides.string(_root.$meta, 'partner.errorOccurred', {'error': error}) ?? '发生错误: ${error}',
          'payment.checkout' => TranslationOverrides.string(_root.$meta, 'payment.checkout', {}) ?? '收银台',
          'payment.success' => TranslationOverrides.string(_root.$meta, 'payment.success', {}) ?? '支付成功',
          'payment.orderNotFound' => TranslationOverrides.string(_root.$meta, 'payment.orderNotFound', {}) ?? '订单信息不存在',
          'payment.payNow' => TranslationOverrides.string(_root.$meta, 'payment.payNow', {}) ?? '立即支付',
          'payment.initializing' =>
            TranslationOverrides.string(_root.$meta, 'payment.initializing', {}) ?? '正在初始化支付组件...',
          'payment.cancelTitle' => TranslationOverrides.string(_root.$meta, 'payment.cancelTitle', {}) ?? '取消支付',
          'payment.cancelContent' =>
            TranslationOverrides.string(_root.$meta, 'payment.cancelContent', {}) ?? '确定要取消支付吗？订单将被取消',
          'payment.continuePay' => TranslationOverrides.string(_root.$meta, 'payment.continuePay', {}) ?? '继续支付',
          'payment.cancelPay' => TranslationOverrides.string(_root.$meta, 'payment.cancelPay', {}) ?? '取消支付',
          'payment.amount' => TranslationOverrides.string(_root.$meta, 'payment.amount', {}) ?? '支付金额',
          'payment.remainingTime' => TranslationOverrides.string(_root.$meta, 'payment.remainingTime', {}) ?? '支付剩余时间',
          'points.title' => TranslationOverrides.string(_root.$meta, 'points.title', {}) ?? '我的乖乖币',
          'points.unit' => TranslationOverrides.string(_root.$meta, 'points.unit', {}) ?? '乖乖币',
          'points.mall' => TranslationOverrides.string(_root.$meta, 'points.mall', {}) ?? '乖乖币商城',
          'points.goExchange' => TranslationOverrides.string(_root.$meta, 'points.goExchange', {}) ?? '去兑换',
          'points.rules' => TranslationOverrides.string(_root.$meta, 'points.rules', {}) ?? '乖乖币规则',
          'points.rule1' => TranslationOverrides.string(_root.$meta, 'points.rule1', {}) ?? '乖乖币永久有效',
          'points.rule2' => TranslationOverrides.string(_root.$meta, 'points.rule2', {}) ?? '抽奖可获得额外乖乖币',
          'points.records' => TranslationOverrides.string(_root.$meta, 'points.records', {}) ?? '乖乖币记录',
          'points.all' => TranslationOverrides.string(_root.$meta, 'points.all', {}) ?? '全部',
          'points.earned' => TranslationOverrides.string(_root.$meta, 'points.earned', {}) ?? '获得',
          'points.used' => TranslationOverrides.string(_root.$meta, 'points.used', {}) ?? '使用',
          'points.noRecords' => TranslationOverrides.string(_root.$meta, 'points.noRecords', {}) ?? '暂无乖乖币记录',
          'points.back' => TranslationOverrides.string(_root.$meta, 'points.back', {}) ?? '返回',
          'points.goLottery' => TranslationOverrides.string(_root.$meta, 'points.goLottery', {}) ?? '去抽奖',
          'points.balance' => TranslationOverrides.string(_root.$meta, 'points.balance', {}) ?? '余额',
          'points.coupon' => TranslationOverrides.string(_root.$meta, 'points.coupon', {}) ?? '优惠券',
          'points.noMoreProducts' => TranslationOverrides.string(_root.$meta, 'points.noMoreProducts', {}) ?? '没有更多商品了',
          'points.myPoints' =>
            ({required Object points}) =>
                TranslationOverrides.string(_root.$meta, 'points.myPoints', {'points': points}) ?? '我的乖乖币: ${points}',
          'points.noProducts' => TranslationOverrides.string(_root.$meta, 'points.noProducts', {}) ?? '暂无商品',
          'points.cost' =>
            ({required Object points}) =>
                TranslationOverrides.string(_root.$meta, 'points.cost', {'points': points}) ?? '${points} 乖乖币',
          'points.exchangeNow' => TranslationOverrides.string(_root.$meta, 'points.exchangeNow', {}) ?? '立即兑换',
          'points.insufficientPoints' =>
            TranslationOverrides.string(_root.$meta, 'points.insufficientPoints', {}) ?? '余额不足',
          'product.title' => TranslationOverrides.string(_root.$meta, 'product.title', {}) ?? '商品列表',
          'product.detail' => TranslationOverrides.string(_root.$meta, 'product.detail', {}) ?? '商品详情',
          'product.hot' => TranslationOverrides.string(_root.$meta, 'product.hot', {}) ?? '热销',
          'product.promotion' => TranslationOverrides.string(_root.$meta, 'product.promotion', {}) ?? '促销',
          'product.discountOff' =>
            ({required Object percent}) =>
                TranslationOverrides.string(_root.$meta, 'product.discountOff', {'percent': percent}) ??
                '${percent}% OFF',
          'product.monthlySales' => TranslationOverrides.string(_root.$meta, 'product.monthlySales', {}) ?? '月售',
          'product.stock' => TranslationOverrides.string(_root.$meta, 'product.stock', {}) ?? '库存',
          'product.stockFull' => TranslationOverrides.string(_root.$meta, 'product.stockFull', {}) ?? '库存充足',
          'product.stockEmpty' => TranslationOverrides.string(_root.$meta, 'product.stockEmpty', {}) ?? '暂时缺货',
          'product.addToCart' => TranslationOverrides.string(_root.$meta, 'product.addToCart', {}) ?? '加入购物车',
          'product.addedToCart' => TranslationOverrides.string(_root.$meta, 'product.addedToCart', {}) ?? '已加入购物车',
          'product.specifications' => TranslationOverrides.string(_root.$meta, 'product.specifications', {}) ?? '规格参数',
          'product.categoryAll' => TranslationOverrides.string(_root.$meta, 'product.categoryAll', {}) ?? '全部',
          'product.categoryFood' => TranslationOverrides.string(_root.$meta, 'product.categoryFood', {}) ?? '食品',
          'product.categoryDrink' => TranslationOverrides.string(_root.$meta, 'product.categoryDrink', {}) ?? '饮料',
          'product.categorySnack' => TranslationOverrides.string(_root.$meta, 'product.categorySnack', {}) ?? '零食',
          'product.sortDefault' => TranslationOverrides.string(_root.$meta, 'product.sortDefault', {}) ?? '默认排序',
          'product.sortPriceAsc' => TranslationOverrides.string(_root.$meta, 'product.sortPriceAsc', {}) ?? '价格从低到高',
          'product.sortPriceDesc' => TranslationOverrides.string(_root.$meta, 'product.sortPriceDesc', {}) ?? '价格从高到低',
          'product.sortName' => TranslationOverrides.string(_root.$meta, 'product.sortName', {}) ?? '按名称排序',
          'product.filterOnlyAvailable' =>
            TranslationOverrides.string(_root.$meta, 'product.filterOnlyAvailable', {}) ?? '仅显示可用商品',
          'product.cart' => TranslationOverrides.string(_root.$meta, 'product.cart', {}) ?? '购物车',
          'profile.title' => TranslationOverrides.string(_root.$meta, 'profile.title', {}) ?? '个人中心',
          'profile.notLoggedIn' => TranslationOverrides.string(_root.$meta, 'profile.notLoggedIn', {}) ?? '未登录',
          _ => null,
        } ??
        switch (path) {
          'profile.editProfile' => TranslationOverrides.string(_root.$meta, 'profile.editProfile', {}) ?? '编辑资料',
          'profile.logout' => TranslationOverrides.string(_root.$meta, 'profile.logout', {}) ?? '退出登录',
          'profile.favoriteDevices' =>
            TranslationOverrides.string(_root.$meta, 'profile.favoriteDevices', {}) ?? '收藏设备',
          'profile.personalInfo' => TranslationOverrides.string(_root.$meta, 'profile.personalInfo', {}) ?? '个人信息',
          'profile.confirmLogout' => TranslationOverrides.string(_root.$meta, 'profile.confirmLogout', {}) ?? '确认退出',
          'profile.confirmLogoutContent' =>
            TranslationOverrides.string(_root.$meta, 'profile.confirmLogoutContent', {}) ?? '确定要退出登录吗？',
          'profile.clearCacheConfirm' =>
            TranslationOverrides.string(_root.$meta, 'profile.clearCacheConfirm', {}) ?? '确定要清除所有缓存数据吗？',
          'profile.noFavoriteDevices' =>
            TranslationOverrides.string(_root.$meta, 'profile.noFavoriteDevices', {}) ?? '暂无收藏设备',
          'profile.removeFavorite' => TranslationOverrides.string(_root.$meta, 'profile.removeFavorite', {}) ?? '取消收藏',
          'profile.removeFavoriteConfirm' =>
            ({required Object name}) =>
                TranslationOverrides.string(_root.$meta, 'profile.removeFavoriteConfirm', {'name': name}) ??
                '确定要取消收藏"${name}"吗？',
          'profile.appDescription' =>
            TranslationOverrides.string(_root.$meta, 'profile.appDescription', {}) ?? '一个便捷的自动售货机购买应用',
          'profile.version' =>
            ({required Object version}) =>
                TranslationOverrides.string(_root.$meta, 'profile.version', {'version': version}) ?? '版本：${version}',
          'profile.wallet' => TranslationOverrides.string(_root.$meta, 'profile.wallet', {}) ?? '我的钱包',
          'profile.coupon' => TranslationOverrides.string(_root.$meta, 'profile.coupon', {}) ?? '优惠券',
          'profile.feedback' => TranslationOverrides.string(_root.$meta, 'profile.feedback', {}) ?? '问题反馈',
          'profile.cooperation' => TranslationOverrides.string(_root.$meta, 'profile.cooperation', {}) ?? '合作商加盟',
          'profile.about' => TranslationOverrides.string(_root.$meta, 'profile.about', {}) ?? '关于我们',
          'profile.settings' => TranslationOverrides.string(_root.$meta, 'profile.settings', {}) ?? '设置',
          'profile.gender.male' => TranslationOverrides.string(_root.$meta, 'profile.gender.male', {}) ?? '男',
          'profile.gender.female' => TranslationOverrides.string(_root.$meta, 'profile.gender.female', {}) ?? '女',
          'profile.gender.unknown' => TranslationOverrides.string(_root.$meta, 'profile.gender.unknown', {}) ?? '保密',
          'profile.info.basic' => TranslationOverrides.string(_root.$meta, 'profile.info.basic', {}) ?? '基本信息',
          'profile.info.other' => TranslationOverrides.string(_root.$meta, 'profile.info.other', {}) ?? '其他信息',
          'profile.info.phone' => TranslationOverrides.string(_root.$meta, 'profile.info.phone', {}) ?? '手机号',
          'profile.info.gender' => TranslationOverrides.string(_root.$meta, 'profile.info.gender', {}) ?? '性别',
          'profile.info.birthday' => TranslationOverrides.string(_root.$meta, 'profile.info.birthday', {}) ?? '生日',
          'profile.info.email' => TranslationOverrides.string(_root.$meta, 'profile.info.email', {}) ?? '邮箱',
          'profile.info.notSet' => TranslationOverrides.string(_root.$meta, 'profile.info.notSet', {}) ?? '未设置',
          'profile.avatar.clickToChange' =>
            TranslationOverrides.string(_root.$meta, 'profile.avatar.clickToChange', {}) ?? '点击更换头像',
          'profile.avatar.uploading' =>
            TranslationOverrides.string(_root.$meta, 'profile.avatar.uploading', {}) ?? '头像上传功能开发中',
          'profile.saveSuccess' => TranslationOverrides.string(_root.$meta, 'profile.saveSuccess', {}) ?? '保存成功',
          'profile.saveFailed' =>
            ({required Object error}) =>
                TranslationOverrides.string(_root.$meta, 'profile.saveFailed', {'error': error}) ?? '保存失败: ${error}',
          'profile.saveInfo' => TranslationOverrides.string(_root.$meta, 'profile.saveInfo', {}) ?? '保存信息',
          'profile.walletBalance' => TranslationOverrides.string(_root.$meta, 'profile.walletBalance', {}) ?? '钱包余额',
          'profile.coin' => TranslationOverrides.string(_root.$meta, 'profile.coin', {}) ?? '乖乖币',
          'profile.couponCount' => TranslationOverrides.string(_root.$meta, 'profile.couponCount', {}) ?? '优惠券',
          'settings.title' => TranslationOverrides.string(_root.$meta, 'settings.title', {}) ?? '设置',
          'settings.general' => TranslationOverrides.string(_root.$meta, 'settings.general', {}) ?? '通用',
          'settings.theme' => TranslationOverrides.string(_root.$meta, 'settings.theme', {}) ?? '主题模式',
          'settings.themeLight' => TranslationOverrides.string(_root.$meta, 'settings.themeLight', {}) ?? '浅色',
          'settings.themeDark' => TranslationOverrides.string(_root.$meta, 'settings.themeDark', {}) ?? '深色',
          'settings.themeSystem' => TranslationOverrides.string(_root.$meta, 'settings.themeSystem', {}) ?? '跟随系统',
          'settings.language' => TranslationOverrides.string(_root.$meta, 'settings.language', {}) ?? '语言',
          'settings.checkUpdate' => TranslationOverrides.string(_root.$meta, 'settings.checkUpdate', {}) ?? '检查更新',
          'settings.clearCache' => TranslationOverrides.string(_root.$meta, 'settings.clearCache', {}) ?? '清除缓存',
          'settings.about' => TranslationOverrides.string(_root.$meta, 'settings.about', {}) ?? '关于',
          'settings.deviceInfo' => TranslationOverrides.string(_root.$meta, 'settings.deviceInfo', {}) ?? '设备信息',
          'settings.aboutUs' => TranslationOverrides.string(_root.$meta, 'settings.aboutUs', {}) ?? '关于我们',
          'settings.checkingUpdate' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkingUpdate', {}) ?? '正在检查更新...',
          'settings.cacheCleared' => TranslationOverrides.string(_root.$meta, 'settings.cacheCleared', {}) ?? '缓存已清除',
          'settings.english' => TranslationOverrides.string(_root.$meta, 'settings.english', {}) ?? '英语',
          'settings.chinese' => TranslationOverrides.string(_root.$meta, 'settings.chinese', {}) ?? '简体中文',
          'settings.traditionalChinese' =>
            TranslationOverrides.string(_root.$meta, 'settings.traditionalChinese', {}) ?? '繁体中文',
          'settings.themeScheme' => TranslationOverrides.string(_root.$meta, 'settings.themeScheme', {}) ?? '主题配色',
          'settings.schemes.shadOrange' =>
            TranslationOverrides.string(_root.$meta, 'settings.schemes.shadOrange', {}) ?? '活力橙 (ShadOrange)',
          'settings.schemes.shadGreen' =>
            TranslationOverrides.string(_root.$meta, 'settings.schemes.shadGreen', {}) ?? '自然绿 (ShadGreen)',
          'settings.schemes.bahamaBlue' =>
            TranslationOverrides.string(_root.$meta, 'settings.schemes.bahamaBlue', {}) ?? '巴哈马蓝 (BahamaBlue)',
          'settings.schemes.damask' =>
            TranslationOverrides.string(_root.$meta, 'settings.schemes.damask', {}) ?? '锦缎红 (Damask)',
          'settings.appName' => TranslationOverrides.string(_root.$meta, 'settings.appName', {}) ?? '应用名称',
          'settings.packageName' => TranslationOverrides.string(_root.$meta, 'settings.packageName', {}) ?? '包名',
          'settings.versionName' => TranslationOverrides.string(_root.$meta, 'settings.versionName', {}) ?? '版本号',
          'settings.buildNumber' => TranslationOverrides.string(_root.$meta, 'settings.buildNumber', {}) ?? '构建号',
          'settings.copyright' =>
            TranslationOverrides.string(_root.$meta, 'settings.copyright', {}) ?? '© 2024 Lunchbox Team',
          'splash.starting' => TranslationOverrides.string(_root.$meta, 'splash.starting', {}) ?? '正在启动...',
          'splash.checkingServices' =>
            TranslationOverrides.string(_root.$meta, 'splash.checkingServices', {}) ?? '检查服务状态...',
          'splash.loadingConfig' => TranslationOverrides.string(_root.$meta, 'splash.loadingConfig', {}) ?? '加载配置...',
          'splash.checkingAuth' => TranslationOverrides.string(_root.$meta, 'splash.checkingAuth', {}) ?? '检查登录状态...',
          'splash.preparingData' => TranslationOverrides.string(_root.$meta, 'splash.preparingData', {}) ?? '准备数据...',
          'splash.ready' => TranslationOverrides.string(_root.$meta, 'splash.ready', {}) ?? '启动完成',
          'splash.failed' => TranslationOverrides.string(_root.$meta, 'splash.failed', {}) ?? '启动失败',
          'teamOrdering.title' => TranslationOverrides.string(_root.$meta, 'teamOrdering.title', {}) ?? '团队用餐',
          'teamOrdering.bannerTitle' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.bannerTitle', {}) ?? '团队点餐',
          'teamOrdering.bannerSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.bannerSubtitle', {}) ?? '多人订购 · 团队聚餐 · 企业团建',
          'teamOrdering.tag1' => TranslationOverrides.string(_root.$meta, 'teamOrdering.tag1', {}) ?? '专业服务',
          'teamOrdering.tag2' => TranslationOverrides.string(_root.$meta, 'teamOrdering.tag2', {}) ?? '优惠价格',
          'teamOrdering.tag3' => TranslationOverrides.string(_root.$meta, 'teamOrdering.tag3', {}) ?? '便捷高效',
          'teamOrdering.scenarios.title' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.scenarios.title', {}) ?? '适用场景',
          'teamOrdering.scenarios.subtitle' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.scenarios.subtitle', {}) ?? '满足不同团队需求',
          'teamOrdering.scenarios.team' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.scenarios.team', {}) ?? '团队点餐',
          'teamOrdering.scenarios.teamDesc' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.scenarios.teamDesc', {}) ?? '企业团建、部门聚餐',
          'teamOrdering.scenarios.reserve' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.scenarios.reserve', {}) ?? '预约点餐',
          'teamOrdering.scenarios.reserveDesc' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.scenarios.reserveDesc', {}) ?? '提前预订，按时取餐',
          'teamOrdering.scenarios.vip' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.scenarios.vip', {}) ?? '大客户点餐',
          'teamOrdering.scenarios.vipDesc' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.scenarios.vipDesc', {}) ?? '批量订购，专属服务',
          'teamOrdering.process.title' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.process.title', {}) ?? '操作流程',
          'teamOrdering.process.subtitle' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.process.subtitle', {}) ?? '简单三步，轻松预订',
          'teamOrdering.process.step1Title' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.process.step1Title', {}) ?? '联系客服',
          'teamOrdering.process.step1Desc' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.process.step1Desc', {}) ?? '拨打热线或在线咨询，说明用餐需求',
          'teamOrdering.process.step2Title' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.process.step2Title', {}) ?? '确认方案',
          'teamOrdering.process.step2Desc' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.process.step2Desc', {}) ?? '客服为您定制专属方案，确认菜品和价格',
          'teamOrdering.process.step3Title' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.process.step3Title', {}) ?? '完成预订',
          'teamOrdering.process.step3Desc' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.process.step3Desc', {}) ?? '确认订单信息，按时到店自取',
          'teamOrdering.advantages.title' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.title', {}) ?? '服务优势',
          'teamOrdering.advantages.subtitle' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.subtitle', {}) ?? '专业团队，值得信赖',
          'teamOrdering.advantages.custom' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.custom', {}) ?? '专业定制',
          'teamOrdering.advantages.customDesc' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.customDesc', {}) ??
                '根据团队规模和个人口味，提供个性化定制方案',
          'teamOrdering.advantages.reserve' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.reserve', {}) ?? '提前预约',
          'teamOrdering.advantages.reserveDesc' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.reserveDesc', {}) ??
                '支持提前预约，合理安排用餐时间，避免等待',
          'teamOrdering.advantages.price' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.price', {}) ?? '优惠价格',
          'teamOrdering.advantages.priceDesc' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.priceDesc', {}) ?? '团队订购享受更多折扣，量大更优惠',
          'teamOrdering.advantages.quality' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.quality', {}) ?? '品质保证',
          'teamOrdering.advantages.qualityDesc' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.qualityDesc', {}) ??
                '严格把控食材质量，确保每一份餐点新鲜美味',
          'teamOrdering.bookNow' => TranslationOverrides.string(_root.$meta, 'teamOrdering.bookNow', {}) ?? '立即预订',
          'time.justNow' => TranslationOverrides.string(_root.$meta, 'time.justNow', {}) ?? '刚刚',
          'time.minutesAgo' =>
            ({required Object minutes}) =>
                TranslationOverrides.string(_root.$meta, 'time.minutesAgo', {'minutes': minutes}) ?? '${minutes} 分钟前',
          'time.hoursAgo' =>
            ({required Object hours}) =>
                TranslationOverrides.string(_root.$meta, 'time.hoursAgo', {'hours': hours}) ?? '${hours} 小时前',
          'time.daysAgo' =>
            ({required Object days}) =>
                TranslationOverrides.string(_root.$meta, 'time.daysAgo', {'days': days}) ?? '${days} 天前',
          _ => null,
        };
  }
}
