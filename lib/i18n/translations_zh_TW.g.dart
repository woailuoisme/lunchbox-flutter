///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'package:slang/overrides.dart';

import 'translations.g.dart';

// Path: <root>
class TranslationsZhTw extends Translations
    with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  /// [AppLocaleUtils.buildWithOverrides] is recommended for overriding.
  TranslationsZhTw({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.zhTw,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(
         cardinalResolver: cardinalResolver,
         ordinalResolver: ordinalResolver,
       ) {
    super.$meta.setFlatMapFunction(
      $meta.getTranslation,
    ); // copy base translations to super.$meta
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <zh-TW>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) =>
      $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

  late final TranslationsZhTw _root = this; // ignore: unused_field

  @override
  TranslationsZhTw $copyWith({
    TranslationMetadata<AppLocale, Translations>? meta,
  }) => TranslationsZhTw(meta: meta ?? this.$meta);

  // Translations
  @override
  late final _TranslationsAboutZhTw about = _TranslationsAboutZhTw._(_root);
  @override
  late final _TranslationsAuthZhTw auth = _TranslationsAuthZhTw._(_root);
  @override
  late final _TranslationsCartZhTw cart = _TranslationsCartZhTw._(_root);
  @override
  late final _TranslationsCityZhTw city = _TranslationsCityZhTw._(_root);
  @override
  late final _TranslationsCommonZhTw common = _TranslationsCommonZhTw._(_root);
  @override
  late final _TranslationsCommunityZhTw community =
      _TranslationsCommunityZhTw._(_root);
  @override
  late final _TranslationsCouponZhTw coupon = _TranslationsCouponZhTw._(_root);
  @override
  late final _TranslationsDeviceZhTw device = _TranslationsDeviceZhTw._(_root);
  @override
  late final _TranslationsDeviceInfoZhTw device_info =
      _TranslationsDeviceInfoZhTw._(_root);
  @override
  late final _TranslationsFeedbackZhTw feedback = _TranslationsFeedbackZhTw._(
    _root,
  );
  @override
  late final _TranslationsHelpZhTw help = _TranslationsHelpZhTw._(_root);
  @override
  late final _TranslationsHomeZhTw home = _TranslationsHomeZhTw._(_root);
  @override
  late final _TranslationsNavigationZhTw navigation =
      _TranslationsNavigationZhTw._(_root);
  @override
  late final _TranslationsOnboardingZhTw onboarding =
      _TranslationsOnboardingZhTw._(_root);
  @override
  late final _TranslationsOrderZhTw order = _TranslationsOrderZhTw._(_root);
  @override
  late final _TranslationsPartnerZhTw partner = _TranslationsPartnerZhTw._(
    _root,
  );
  @override
  late final _TranslationsPaymentZhTw payment = _TranslationsPaymentZhTw._(
    _root,
  );
  @override
  late final _TranslationsPointsZhTw points = _TranslationsPointsZhTw._(_root);
  @override
  late final _TranslationsProductZhTw product = _TranslationsProductZhTw._(
    _root,
  );
  @override
  late final _TranslationsProfileZhTw profile = _TranslationsProfileZhTw._(
    _root,
  );
  @override
  late final _TranslationsSettingsZhTw settings = _TranslationsSettingsZhTw._(
    _root,
  );
  @override
  late final _TranslationsSplashZhTw splash = _TranslationsSplashZhTw._(_root);
  @override
  late final _TranslationsTimeZhTw time = _TranslationsTimeZhTw._(_root);
}

// Path: about
class _TranslationsAboutZhTw extends TranslationsAboutZhCn {
  _TranslationsAboutZhTw._(TranslationsZhTw root)
    : this._root = root,
      super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title =>
      TranslationOverrides.string(_root.$meta, 'about.title', {}) ?? '關於我們';

  @override
  String get appBrand =>
      TranslationOverrides.string(_root.$meta, 'about.appBrand', {}) ??
      '好小乖智能盒飯售賣機';

  @override
  String get shareWithFriends =>
      TranslationOverrides.string(_root.$meta, 'about.shareWithFriends', {}) ??
      '分享給朋友';

  @override
  String get featuresTitle =>
      TranslationOverrides.string(_root.$meta, 'about.featuresTitle', {}) ??
      '我們的特色';

  @override
  String get feature1Title =>
      TranslationOverrides.string(_root.$meta, 'about.feature1Title', {}) ??
      '中餐央廚';

  @override
  String get feature1Desc =>
      TranslationOverrides.string(_root.$meta, 'about.feature1Desc', {}) ??
      '售賣機為飲食生活带来的改變';

  @override
  String get feature2Title =>
      TranslationOverrides.string(_root.$meta, 'about.feature2Title', {}) ??
      '出餐迅速';

  @override
  String get feature2Desc =>
      TranslationOverrides.string(_root.$meta, 'about.feature2Desc', {}) ??
      '區別於傳統外賣和餐飲店的三維入口';

  @override
  String get feature3Title =>
      TranslationOverrides.string(_root.$meta, 'about.feature3Title', {}) ??
      '創業搭檔';

  @override
  String get feature3Desc =>
      TranslationOverrides.string(_root.$meta, 'about.feature3Desc', {}) ??
      '一個無風險的投資創業利器';

  @override
  String get feature4Title =>
      TranslationOverrides.string(_root.$meta, 'about.feature4Title', {}) ??
      '專利機器';

  @override
  String get feature4Desc =>
      TranslationOverrides.string(_root.$meta, 'about.feature4Desc', {}) ??
      '世上再無窮人的造富機';

  @override
  String get policyTitle =>
      TranslationOverrides.string(_root.$meta, 'about.policyTitle', {}) ??
      '政策條款';

  @override
  String get userAgreementAndPrivacy =>
      TranslationOverrides.string(
        _root.$meta,
        'about.userAgreementAndPrivacy',
        {},
      ) ??
      '用戶協議與隱私政策';

  @override
  String get viewDetails =>
      TranslationOverrides.string(_root.$meta, 'about.viewDetails', {}) ??
      '查看詳細條款';

  @override
  String get contactTitle =>
      TranslationOverrides.string(_root.$meta, 'about.contactTitle', {}) ??
      '聯繫我們';

  @override
  String get customerServiceHotline =>
      TranslationOverrides.string(
        _root.$meta,
        'about.customerServiceHotline',
        {},
      ) ??
      '客服熱線';

  @override
  String get customerServiceNumber =>
      TranslationOverrides.string(
        _root.$meta,
        'about.customerServiceNumber',
        {},
      ) ??
      '400-114-8818';

  @override
  String get companyAddress =>
      TranslationOverrides.string(_root.$meta, 'about.companyAddress', {}) ??
      '公司地址';

  @override
  String get addressDetails =>
      TranslationOverrides.string(_root.$meta, 'about.addressDetails', {}) ??
      '廣東省東莞市松山湖園區科匯路1號1棟1510室';

  @override
  String get shareText =>
      TranslationOverrides.string(_root.$meta, 'about.shareText', {}) ??
      '快來使用好小乖智能盒飯售卖機吧！';
}

// Path: auth
class _TranslationsAuthZhTw extends TranslationsAuthZhCn {
  _TranslationsAuthZhTw._(TranslationsZhTw root)
    : this._root = root,
      super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get loginTitle =>
      TranslationOverrides.string(_root.$meta, 'auth.loginTitle', {}) ?? '歡迎回來';
  @override
  String get loginButton =>
      TranslationOverrides.string(_root.$meta, 'auth.loginButton', {}) ?? '登入';
  @override
  String get registerButton =>
      TranslationOverrides.string(_root.$meta, 'auth.registerButton', {}) ??
      '註冊';
  @override
  String get forgotPassword =>
      TranslationOverrides.string(_root.$meta, 'auth.forgotPassword', {}) ??
      '忘記密碼？';
  @override
  String get loginFailed =>
      TranslationOverrides.string(_root.$meta, 'auth.loginFailed', {}) ??
      '登入失敗';
  @override
  String get loginSuccess =>
      TranslationOverrides.string(_root.$meta, 'auth.loginSuccess', {}) ??
      '登入成功';
  @override
  String get registerTitle =>
      TranslationOverrides.string(_root.$meta, 'auth.registerTitle', {}) ??
      '建立帳號';
  @override
  String get nickname =>
      TranslationOverrides.string(_root.$meta, 'auth.nickname', {}) ?? '暱稱';
  @override
  String get registerSuccess =>
      TranslationOverrides.string(_root.$meta, 'auth.registerSuccess', {}) ??
      '註冊成功';
  @override
  String get registerFailed =>
      TranslationOverrides.string(_root.$meta, 'auth.registerFailed', {}) ??
      '註冊失敗';
  @override
  String get forgotPasswordTitle =>
      TranslationOverrides.string(
        _root.$meta,
        'auth.forgotPasswordTitle',
        {},
      ) ??
      '重設密碼';
  @override
  String get sendResetLink =>
      TranslationOverrides.string(_root.$meta, 'auth.sendResetLink', {}) ??
      '發送重設連結';
  @override
  String get resetLinkSent =>
      TranslationOverrides.string(_root.$meta, 'auth.resetLinkSent', {}) ??
      '重設連結已發送';
  @override
  String get required =>
      TranslationOverrides.string(_root.$meta, 'auth.required', {}) ?? '必填';
  @override
  String get enterUsername =>
      TranslationOverrides.string(_root.$meta, 'auth.enterUsername', {}) ??
      '請輸入使用者名稱';
  @override
  String get enterPassword =>
      TranslationOverrides.string(_root.$meta, 'auth.enterPassword', {}) ??
      '請輸入密碼';
  @override
  String get enterUsernameHint =>
      TranslationOverrides.string(_root.$meta, 'auth.enterUsernameHint', {}) ??
      '請輸入使用者名稱或手機號碼';
  @override
  String get enterNickname =>
      TranslationOverrides.string(_root.$meta, 'auth.enterNickname', {}) ??
      '請輸入暱稱';
  @override
  String get dontHaveAccount =>
      TranslationOverrides.string(_root.$meta, 'auth.dontHaveAccount', {}) ??
      '還沒有帳號？';
  @override
  String get resetPasswordHint =>
      TranslationOverrides.string(_root.$meta, 'auth.resetPasswordHint', {}) ??
      '請輸入您的使用者名稱或電子郵件來重設密碼';
  @override
  String get usernameOrEmail =>
      TranslationOverrides.string(_root.$meta, 'auth.usernameOrEmail', {}) ??
      '使用者名稱 / 電子郵件';
  @override
  String get slogan =>
      TranslationOverrides.string(_root.$meta, 'auth.slogan', {}) ??
      '便捷購買，美味隨行';
}

// Path: cart
class _TranslationsCartZhTw extends TranslationsCartZhCn {
  _TranslationsCartZhTw._(TranslationsZhTw root)
    : this._root = root,
      super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title =>
      TranslationOverrides.string(_root.$meta, 'cart.title', {}) ?? '購物車';
  @override
  String get clear =>
      TranslationOverrides.string(_root.$meta, 'cart.clear', {}) ?? '清空';
  @override
  String get empty =>
      TranslationOverrides.string(_root.$meta, 'cart.empty', {}) ?? '購物車是空的';
  @override
  String get total =>
      TranslationOverrides.string(_root.$meta, 'cart.total', {}) ?? '合計';
  @override
  String get checkout =>
      TranslationOverrides.string(_root.$meta, 'cart.checkout', {}) ?? '結算';
  @override
  String get goShopping =>
      TranslationOverrides.string(_root.$meta, 'cart.goShopping', {}) ?? '去逛逛';
}

// Path: city
class _TranslationsCityZhTw extends TranslationsCityZhCn {
  _TranslationsCityZhTw._(TranslationsZhTw root)
    : this._root = root,
      super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title =>
      TranslationOverrides.string(_root.$meta, 'city.title', {}) ?? '選擇城市';
  @override
  String get search =>
      TranslationOverrides.string(_root.$meta, 'city.search', {}) ?? '搜尋城市';
  @override
  String get hot =>
      TranslationOverrides.string(_root.$meta, 'city.hot', {}) ?? '熱門城市';
  @override
  String get noResult =>
      TranslationOverrides.string(_root.$meta, 'city.noResult', {}) ??
      '未找到相關城市';
  @override
  String get viewAll =>
      TranslationOverrides.string(_root.$meta, 'city.viewAll', {}) ?? '查看所有城市';
  @override
  String get switchSuccess =>
      TranslationOverrides.string(_root.$meta, 'city.switchSuccess', {}) ??
      '城市已切換';
  @override
  String switchedTo({required Object name}) =>
      TranslationOverrides.string(_root.$meta, 'city.switchedTo', {
        'name': name,
      }) ??
      '已切換到 ${name}';
  @override
  String get switchFailed =>
      TranslationOverrides.string(_root.$meta, 'city.switchFailed', {}) ??
      '切換失敗';
  @override
  String get saveFailed =>
      TranslationOverrides.string(_root.$meta, 'city.saveFailed', {}) ??
      '無法儲存選擇的城市，請重試';
}

// Path: common
class _TranslationsCommonZhTw extends TranslationsCommonZhCn {
  _TranslationsCommonZhTw._(TranslationsZhTw root)
    : this._root = root,
      super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get login =>
      TranslationOverrides.string(_root.$meta, 'common.login', {}) ?? '登入';
  @override
  String get register =>
      TranslationOverrides.string(_root.$meta, 'common.register', {}) ?? '註冊';
  @override
  String get username =>
      TranslationOverrides.string(_root.$meta, 'common.username', {}) ??
      '使用者名稱';
  @override
  String get password =>
      TranslationOverrides.string(_root.$meta, 'common.password', {}) ?? '密碼';
  @override
  String get confirm =>
      TranslationOverrides.string(_root.$meta, 'common.confirm', {}) ?? '確認';
  @override
  String get cancel =>
      TranslationOverrides.string(_root.$meta, 'common.cancel', {}) ?? '取消';
  @override
  String get error =>
      TranslationOverrides.string(_root.$meta, 'common.error', {}) ?? '錯誤';
  @override
  String get success =>
      TranslationOverrides.string(_root.$meta, 'common.success', {}) ?? '成功';
  @override
  String get loading =>
      TranslationOverrides.string(_root.$meta, 'common.loading', {}) ??
      '載入中...';
  @override
  String get ok =>
      TranslationOverrides.string(_root.$meta, 'common.ok', {}) ?? '確定';
  @override
  String get save =>
      TranslationOverrides.string(_root.$meta, 'common.save', {}) ?? '儲存';
  @override
  String get delete =>
      TranslationOverrides.string(_root.$meta, 'common.delete', {}) ?? '刪除';
  @override
  String get edit =>
      TranslationOverrides.string(_root.$meta, 'common.edit', {}) ?? '編輯';
  @override
  String get search =>
      TranslationOverrides.string(_root.$meta, 'common.search', {}) ?? '搜尋';
  @override
  String get noData =>
      TranslationOverrides.string(_root.$meta, 'common.noData', {}) ?? '暫無數據';
  @override
  String get retry =>
      TranslationOverrides.string(_root.$meta, 'common.retry', {}) ?? '重試';
  @override
  String get skip =>
      TranslationOverrides.string(_root.$meta, 'common.skip', {}) ?? '跳過';
  @override
  String get refresh =>
      TranslationOverrides.string(_root.$meta, 'common.refresh', {}) ?? '重新整理';
  @override
  String get loadFailed =>
      TranslationOverrides.string(_root.$meta, 'common.loadFailed', {}) ??
      '載入失敗';
  @override
  String get unknownError =>
      TranslationOverrides.string(_root.$meta, 'common.unknownError', {}) ??
      '未知錯誤';
  @override
  String get developing =>
      TranslationOverrides.string(_root.$meta, 'common.developing', {}) ??
      '頁面正在开发中';
  @override
  String get appName =>
      TranslationOverrides.string(_root.$meta, 'common.appName', {}) ?? '飯盒售貨機';
  @override
  String get logout =>
      TranslationOverrides.string(_root.$meta, 'common.logout', {}) ?? '登出';
  @override
  String get pullToRefresh =>
      TranslationOverrides.string(_root.$meta, 'common.pullToRefresh', {}) ??
      '下拉重新整理';
  @override
  String get releaseToRefresh =>
      TranslationOverrides.string(_root.$meta, 'common.releaseToRefresh', {}) ??
      '釋放重新整理';
}

// Path: community
class _TranslationsCommunityZhTw extends TranslationsCommunityZhCn {
  _TranslationsCommunityZhTw._(TranslationsZhTw root)
    : this._root = root,
      super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title =>
      TranslationOverrides.string(_root.$meta, 'community.title', {}) ?? '社群福利';
  @override
  String get join =>
      TranslationOverrides.string(_root.$meta, 'community.join', {}) ?? '加入社群';
  @override
  String get share =>
      TranslationOverrides.string(_root.$meta, 'community.share', {}) ??
      '與美食愛好者一起分享美味';
  @override
  String get org =>
      TranslationOverrides.string(_root.$meta, 'community.org', {}) ??
      '東莞中科雲計算研究院';
  @override
  String get dept =>
      TranslationOverrides.string(_root.$meta, 'community.dept', {}) ?? '雲計算中心';
  @override
  String get scanHint =>
      TranslationOverrides.string(_root.$meta, 'community.scanHint', {}) ??
      '掃碼加入東莞中科雲計算研究院';
  @override
  late final _TranslationsCommunityFeaturesZhTw features =
      _TranslationsCommunityFeaturesZhTw._(_root);
  @override
  String get whyJoin =>
      TranslationOverrides.string(_root.$meta, 'community.whyJoin', {}) ??
      '為什麼加入我們的社群？';
  @override
  String get reason1 =>
      TranslationOverrides.string(_root.$meta, 'community.reason1', {}) ??
      '每日美食推薦，讓您不再糾結吃什麼';
  @override
  String get reason2 =>
      TranslationOverrides.string(_root.$meta, 'community.reason2', {}) ??
      '限時優惠活動，省錢又省心';
  @override
  String get reason3 =>
      TranslationOverrides.string(_root.$meta, 'community.reason3', {}) ??
      '專業美食測評，幫您避坑';
  @override
  String get reason4 =>
      TranslationOverrides.string(_root.$meta, 'community.reason4', {}) ??
      '美食製作教程，在家也能做出美味';
}

// Path: coupon
class _TranslationsCouponZhTw extends TranslationsCouponZhCn {
  _TranslationsCouponZhTw._(TranslationsZhTw root)
    : this._root = root,
      super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title =>
      TranslationOverrides.string(_root.$meta, 'coupon.title', {}) ?? '優惠券';
  @override
  late final _TranslationsCouponTabsZhTw tabs = _TranslationsCouponTabsZhTw._(
    _root,
  );
  @override
  String get unit =>
      TranslationOverrides.string(_root.$meta, 'coupon.unit', {}) ?? 'NT\$';
  @override
  String condition({required Object amount}) =>
      TranslationOverrides.string(_root.$meta, 'coupon.condition', {
        'amount': amount,
      }) ??
      '滿減券\n滿${amount}元可用';
  @override
  String get conditionNoThreshold =>
      TranslationOverrides.string(
        _root.$meta,
        'coupon.conditionNoThreshold',
        {},
      ) ??
      '滿減券\n滿0元可用';
  @override
  String get validForever =>
      TranslationOverrides.string(_root.$meta, 'coupon.validForever', {}) ??
      '長期有效';
  @override
  String get btnReceive =>
      TranslationOverrides.string(_root.$meta, 'coupon.btnReceive', {}) ??
      '立即領取';
  @override
  String get btnReceived =>
      TranslationOverrides.string(_root.$meta, 'coupon.btnReceived', {}) ??
      '已領取';
  @override
  String get btnUse =>
      TranslationOverrides.string(_root.$meta, 'coupon.btnUse', {}) ?? '去使用';
  @override
  String get btnExpired =>
      TranslationOverrides.string(_root.$meta, 'coupon.btnExpired', {}) ??
      '已過期';
  @override
  String discount({required Object amount}) =>
      TranslationOverrides.string(_root.$meta, 'coupon.discount', {
        'amount': amount,
      }) ??
      '${amount}元優惠券';
  @override
  String discountOff({required Object amount}) =>
      TranslationOverrides.string(_root.$meta, 'coupon.discountOff', {
        'amount': amount,
      }) ??
      '${amount}元減免券';

  @override
  String get noCoupons =>
      TranslationOverrides.string(_root.$meta, 'coupon.noCoupons', {}) ??
      '暫無優惠券';

  @override
  String get expiryPrefix =>
      TranslationOverrides.string(_root.$meta, 'coupon.expiryPrefix', {}) ??
      '有效期至：';

  @override
  String get statusAvailable =>
      TranslationOverrides.string(_root.$meta, 'coupon.statusAvailable', {}) ??
      '可用';

  @override
  String get statusUnavailable =>
      TranslationOverrides.string(
        _root.$meta,
        'coupon.statusUnavailable',
        {},
      ) ??
      '不可用';
}

// Path: device
class _TranslationsDeviceZhTw extends TranslationsDeviceZhCn {
  _TranslationsDeviceZhTw._(TranslationsZhTw root)
    : this._root = root,
      super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title =>
      TranslationOverrides.string(_root.$meta, 'device.title', {}) ?? '設備詳情';
  @override
  String get info =>
      TranslationOverrides.string(_root.$meta, 'device.info', {}) ?? '設備資訊';
  @override
  String get address =>
      TranslationOverrides.string(_root.$meta, 'device.address', {}) ?? '地址';
  @override
  String get distance =>
      TranslationOverrides.string(_root.$meta, 'device.distance', {}) ?? '距離';
  @override
  String get status =>
      TranslationOverrides.string(_root.$meta, 'device.status', {}) ?? '狀態';
  @override
  String get online =>
      TranslationOverrides.string(_root.$meta, 'device.online', {}) ?? '在線';
  @override
  String get offline =>
      TranslationOverrides.string(_root.$meta, 'device.offline', {}) ?? '離線';
  @override
  String get paymentMethods =>
      TranslationOverrides.string(_root.$meta, 'device.paymentMethods', {}) ??
      '支付方式：';
  @override
  String get mobilePayment =>
      TranslationOverrides.string(_root.$meta, 'device.mobilePayment', {}) ??
      '行動支付';
  @override
  String get cash =>
      TranslationOverrides.string(_root.$meta, 'device.cash', {}) ?? '現金';
  @override
  String get noProducts =>
      TranslationOverrides.string(_root.$meta, 'device.noProducts', {}) ??
      '暫無商品';
  @override
  String get productList =>
      TranslationOverrides.string(_root.$meta, 'device.productList', {}) ??
      '商品列表';
  @override
  String get soldOut =>
      TranslationOverrides.string(_root.$meta, 'device.soldOut', {}) ?? '已售罄';
  @override
  String get reportIssue =>
      TranslationOverrides.string(_root.$meta, 'device.reportIssue', {}) ??
      '上報故障';
  @override
  String get reportDeviceIssue =>
      TranslationOverrides.string(
        _root.$meta,
        'device.reportDeviceIssue',
        {},
      ) ??
      '上報設備故障';
  @override
  String get reportIssueHint =>
      TranslationOverrides.string(_root.$meta, 'device.reportIssueHint', {}) ??
      '請描述設備故障情況...';
  @override
  String get reportSuccess =>
      TranslationOverrides.string(_root.$meta, 'device.reportSuccess', {}) ??
      '故障上報成功';
  @override
  String loadFailed({required Object error}) =>
      TranslationOverrides.string(_root.$meta, 'device.loadFailed', {
        'error': error,
      }) ??
      '載入失敗: ${error}';
  @override
  String loadProductsFailed({required Object error}) =>
      TranslationOverrides.string(_root.$meta, 'device.loadProductsFailed', {
        'error': error,
      }) ??
      '載入商品失敗: ${error}';
  @override
  String get nearby =>
      TranslationOverrides.string(_root.$meta, 'device.nearby', {}) ?? '附近設備';
  @override
  String get sortByDistance =>
      TranslationOverrides.string(_root.$meta, 'device.sortByDistance', {}) ??
      '按距離排序';
  @override
  String get sortByName =>
      TranslationOverrides.string(_root.$meta, 'device.sortByName', {}) ??
      '按名稱排序';
  @override
  String get filterOnline =>
      TranslationOverrides.string(_root.$meta, 'device.filterOnline', {}) ??
      '僅顯示在線設備';
  @override
  String get noDevicesNearby =>
      TranslationOverrides.string(_root.$meta, 'device.noDevicesNearby', {}) ??
      '附近暫無設備';
  @override
  String get maintenance =>
      TranslationOverrides.string(_root.$meta, 'device.maintenance', {}) ??
      '維護中';
  @override
  String get unknown =>
      TranslationOverrides.string(_root.$meta, 'device.unknown', {}) ?? '未知';
  @override
  String get cashPayment =>
      TranslationOverrides.string(_root.$meta, 'device.cashPayment', {}) ??
      '現金支付';
}

// Path: device_info
class _TranslationsDeviceInfoZhTw extends TranslationsDeviceInfoZhCn {
  _TranslationsDeviceInfoZhTw._(TranslationsZhTw root)
    : this._root = root,
      super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get browser =>
      TranslationOverrides.string(_root.$meta, 'device_info.browser', {}) ??
      '瀏覽器';

  @override
  String get platform =>
      TranslationOverrides.string(_root.$meta, 'device_info.platform', {}) ??
      '平台';

  @override
  String get userAgent =>
      TranslationOverrides.string(_root.$meta, 'device_info.userAgent', {}) ??
      'User Agent';

  @override
  String get language =>
      TranslationOverrides.string(_root.$meta, 'device_info.language', {}) ??
      '語言';

  @override
  String get memory =>
      TranslationOverrides.string(_root.$meta, 'device_info.memory', {}) ??
      '記憶體';

  @override
  String get brand =>
      TranslationOverrides.string(_root.$meta, 'device_info.brand', {}) ?? '品牌';

  @override
  String get model =>
      TranslationOverrides.string(_root.$meta, 'device_info.model', {}) ?? '型號';

  @override
  String get systemVersion =>
      TranslationOverrides.string(
        _root.$meta,
        'device_info.systemVersion',
        {},
      ) ??
      '系統版本';

  @override
  String get sdkVersion =>
      TranslationOverrides.string(_root.$meta, 'device_info.sdkVersion', {}) ??
      'SDK版本';

  @override
  String get manufacturer =>
      TranslationOverrides.string(
        _root.$meta,
        'device_info.manufacturer',
        {},
      ) ??
      '廠商';

  @override
  String get hardware =>
      TranslationOverrides.string(_root.$meta, 'device_info.hardware', {}) ??
      '硬體';

  @override
  String get host =>
      TranslationOverrides.string(_root.$meta, 'device_info.host', {}) ?? '主機';

  @override
  String get id =>
      TranslationOverrides.string(_root.$meta, 'device_info.id', {}) ?? 'ID';

  @override
  String get name =>
      TranslationOverrides.string(_root.$meta, 'device_info.name', {}) ?? '名稱';

  @override
  String get systemName =>
      TranslationOverrides.string(_root.$meta, 'device_info.systemName', {}) ??
      '系統名';

  @override
  String get machine =>
      TranslationOverrides.string(_root.$meta, 'device_info.machine', {}) ??
      '機器碼';

  @override
  String get uniqueId =>
      TranslationOverrides.string(_root.$meta, 'device_info.uniqueId', {}) ??
      '唯一ID';
}

// Path: feedback
class _TranslationsFeedbackZhTw extends TranslationsFeedbackZhCn {
  _TranslationsFeedbackZhTw._(TranslationsZhTw root)
    : this._root = root,
      super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title =>
      TranslationOverrides.string(_root.$meta, 'feedback.title', {}) ?? '問題反饋';

  @override
  String get subtitle =>
      TranslationOverrides.string(_root.$meta, 'feedback.subtitle', {}) ??
      '您的反饋是我們進步的動力';
  @override
  String get selectType =>
      TranslationOverrides.string(_root.$meta, 'feedback.selectType', {}) ??
      '選擇反饋類型';
  @override
  String get errorReport =>
      TranslationOverrides.string(_root.$meta, 'feedback.errorReport', {}) ??
      '錯誤報告';
  @override
  String get suggestion =>
      TranslationOverrides.string(_root.$meta, 'feedback.suggestion', {}) ??
      '建議';
  @override
  String get complaint =>
      TranslationOverrides.string(_root.$meta, 'feedback.complaint', {}) ??
      '投訴';
  @override
  String get other =>
      TranslationOverrides.string(_root.$meta, 'feedback.other', {}) ?? '其他';
  @override
  String get description =>
      TranslationOverrides.string(_root.$meta, 'feedback.description', {}) ??
      '問題描述';
  @override
  String get titleHint =>
      TranslationOverrides.string(_root.$meta, 'feedback.titleHint', {}) ??
      '請輸入問題標題 (必填)';
  @override
  String get contentHint =>
      TranslationOverrides.string(_root.$meta, 'feedback.contentHint', {}) ??
      '請詳細描述您遇到的問題或建議 (必填)';
  @override
  String get uploadScreenshot =>
      TranslationOverrides.string(
        _root.$meta,
        'feedback.uploadScreenshot',
        {},
      ) ??
      '上傳截圖 (可選)';
  @override
  String get addImage =>
      TranslationOverrides.string(_root.$meta, 'feedback.addImage', {}) ??
      '添加圖片';
  @override
  String get uploadLimitHint =>
      TranslationOverrides.string(
        _root.$meta,
        'feedback.uploadLimitHint',
        {},
      ) ??
      '最多可上傳3張圖片，每張不超過2MB，支持jpg、png格式';
  @override
  String get contactOptional =>
      TranslationOverrides.string(
        _root.$meta,
        'feedback.contactOptional',
        {},
      ) ??
      '聯繫方式 (可選)';
  @override
  String get contactInputHint =>
      TranslationOverrides.string(
        _root.$meta,
        'feedback.contactInputHint',
        {},
      ) ??
      '請輸入您的手機號或郵箱，方便我們聯繫您';
  @override
  String get submit =>
      TranslationOverrides.string(_root.$meta, 'feedback.submit', {}) ?? '提交反饋';
  @override
  String get submitSuccess =>
      TranslationOverrides.string(_root.$meta, 'feedback.submitSuccess', {}) ??
      '反饋提交成功，感謝您的支持';
  @override
  String get submitFailed =>
      TranslationOverrides.string(_root.$meta, 'feedback.submitFailed', {}) ??
      '反饋提交失敗，請稍後重試';
}

// Path: help
class _TranslationsHelpZhTw extends TranslationsHelpZhCn {
  _TranslationsHelpZhTw._(TranslationsZhTw root)
    : this._root = root,
      super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title =>
      TranslationOverrides.string(_root.$meta, 'help.title', {}) ?? '幫助中心';
  @override
  String get developing =>
      TranslationOverrides.string(_root.$meta, 'help.developing', {}) ??
      '幫助頁面正在開發中';
}

// Path: home
class _TranslationsHomeZhTw extends TranslationsHomeZhCn {
  _TranslationsHomeZhTw._(TranslationsZhTw root)
    : this._root = root,
      super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get selectCity =>
      TranslationOverrides.string(_root.$meta, 'home.selectCity', {}) ?? '選擇城市';
  @override
  String get nearbyDevices =>
      TranslationOverrides.string(_root.$meta, 'home.nearbyDevices', {}) ??
      '附近設備';
  @override
  String get banner1Title =>
      TranslationOverrides.string(_root.$meta, 'home.banner1Title', {}) ??
      '便捷購買';
  @override
  String get banner1Subtitle =>
      TranslationOverrides.string(_root.$meta, 'home.banner1Subtitle', {}) ??
      '美味隨行';
  @override
  String get banner2Title =>
      TranslationOverrides.string(_root.$meta, 'home.banner2Title', {}) ??
      '新鮮速遞';
  @override
  String get banner2Subtitle =>
      TranslationOverrides.string(_root.$meta, 'home.banner2Subtitle', {}) ??
      '每日更新';
  @override
  String get banner3Title =>
      TranslationOverrides.string(_root.$meta, 'home.banner3Title', {}) ??
      '超值優惠';
  @override
  String get banner3Subtitle =>
      TranslationOverrides.string(_root.$meta, 'home.banner3Subtitle', {}) ??
      '限時特價';
  @override
  String get noDevices =>
      TranslationOverrides.string(_root.$meta, 'home.noDevices', {}) ??
      '附近暫無設備';
  @override
  String get welcome =>
      TranslationOverrides.string(_root.$meta, 'home.welcome', {}) ??
      '您好，好小乖用戶';
  @override
  String get selfPickup =>
      TranslationOverrides.string(_root.$meta, 'home.selfPickup', {}) ?? '自取點餐';
  @override
  String get selfPickupHint =>
      TranslationOverrides.string(_root.$meta, 'home.selfPickupHint', {}) ??
      '掃碼取餐/打包帶走';
  @override
  String get teamOrder =>
      TranslationOverrides.string(_root.$meta, 'home.teamOrder', {}) ?? '團隊點餐';
  @override
  String get teamOrderHint =>
      TranslationOverrides.string(_root.$meta, 'home.teamOrderHint', {}) ??
      '多人訂購/團隊點餐';
  @override
  String get invite =>
      TranslationOverrides.string(_root.$meta, 'home.invite', {}) ?? '邀請有禮';
  @override
  String get inviteHint =>
      TranslationOverrides.string(_root.$meta, 'home.inviteHint', {}) ??
      '邀請好友得現金';
  @override
  String get recommendTitle =>
      TranslationOverrides.string(_root.$meta, 'home.recommendTitle', {}) ??
      '為我推薦';
  @override
  late final _TranslationsHomeGridZhTw grid = _TranslationsHomeGridZhTw._(
    _root,
  );
  @override
  late final _TranslationsHomeLotteryZhTw lottery =
      _TranslationsHomeLotteryZhTw._(_root);
  @override
  late final _TranslationsHomeStatusZhTw status = _TranslationsHomeStatusZhTw._(
    _root,
  );
}

// Path: navigation
class _TranslationsNavigationZhTw extends TranslationsNavigationZhCn {
  _TranslationsNavigationZhTw._(TranslationsZhTw root)
    : this._root = root,
      super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get home =>
      TranslationOverrides.string(_root.$meta, 'navigation.home', {}) ?? '首頁';
  @override
  String get device =>
      TranslationOverrides.string(_root.$meta, 'navigation.device', {}) ?? '設備';
  @override
  String get orders =>
      TranslationOverrides.string(_root.$meta, 'navigation.orders', {}) ?? '訂單';
  @override
  String get profile =>
      TranslationOverrides.string(_root.$meta, 'navigation.profile', {}) ??
      '個人中心';
}

// Path: onboarding
class _TranslationsOnboardingZhTw extends TranslationsOnboardingZhCn {
  _TranslationsOnboardingZhTw._(TranslationsZhTw root)
    : this._root = root,
      super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get welcomeTitle =>
      TranslationOverrides.string(_root.$meta, 'onboarding.welcomeTitle', {}) ??
      '歡迎使用飯盒售货機';
  @override
  String get welcomeBody =>
      TranslationOverrides.string(_root.$meta, 'onboarding.welcomeBody', {}) ??
      '隨時隨地，輕鬆購買美味午餐';
  @override
  String get findDevicesTitle =>
      TranslationOverrides.string(
        _root.$meta,
        'onboarding.findDevicesTitle',
        {},
      ) ??
      '查找附近設備';
  @override
  String get findDevicesBody =>
      TranslationOverrides.string(
        _root.$meta,
        'onboarding.findDevicesBody',
        {},
      ) ??
      '快速定位最近的售貨機，節省您的時間';
  @override
  String get paymentTitle =>
      TranslationOverrides.string(_root.$meta, 'onboarding.paymentTitle', {}) ??
      '便捷支付';
  @override
  String get paymentBody =>
      TranslationOverrides.string(_root.$meta, 'onboarding.paymentBody', {}) ??
      '支援信用卡等多種便捷支付方式';
  @override
  String get getStarted =>
      TranslationOverrides.string(_root.$meta, 'onboarding.getStarted', {}) ??
      '開始使用';
}

// Path: order
class _TranslationsOrderZhTw extends TranslationsOrderZhCn {
  _TranslationsOrderZhTw._(TranslationsZhTw root)
    : this._root = root,
      super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get myOrders =>
      TranslationOverrides.string(_root.$meta, 'order.myOrders', {}) ?? '我的訂單';
  @override
  String get noOrders =>
      TranslationOverrides.string(_root.$meta, 'order.noOrders', {}) ?? '暫無訂單';
  @override
  String get detail =>
      TranslationOverrides.string(_root.$meta, 'order.detail', {}) ?? '訂單詳情';
  @override
  late final _TranslationsOrderStatusZhTw status =
      _TranslationsOrderStatusZhTw._(_root);
  @override
  String get pickupCode =>
      TranslationOverrides.string(_root.$meta, 'order.pickupCode', {}) ?? '取貨碼';
  @override
  String get pickupHint =>
      TranslationOverrides.string(_root.$meta, 'order.pickupHint', {}) ??
      '請在設備上輸入取貨碼取貨';
  @override
  String get items =>
      TranslationOverrides.string(_root.$meta, 'order.items', {}) ?? '商品清單';
  @override
  String get info =>
      TranslationOverrides.string(_root.$meta, 'order.info', {}) ?? '訂單資訊';
  @override
  String get id =>
      TranslationOverrides.string(_root.$meta, 'order.id', {}) ?? '訂單號';
  @override
  String get createdAt =>
      TranslationOverrides.string(_root.$meta, 'order.createdAt', {}) ?? '建立時間';
  @override
  String get paidAt =>
      TranslationOverrides.string(_root.$meta, 'order.paidAt', {}) ?? '支付時間';
  @override
  String get paymentMethod =>
      TranslationOverrides.string(_root.$meta, 'order.paymentMethod', {}) ??
      '支付方式';
  @override
  String get totalAmount =>
      TranslationOverrides.string(_root.$meta, 'order.totalAmount', {}) ??
      '訂單總額';
  @override
  String get unknown =>
      TranslationOverrides.string(_root.$meta, 'order.unknown', {}) ?? '未知';
  @override
  String get refresh =>
      TranslationOverrides.string(_root.$meta, 'order.refresh', {}) ?? '重新整理';
  @override
  String itemsCount({required Object count}) =>
      TranslationOverrides.string(_root.$meta, 'order.itemsCount', {
        'count': count,
      }) ??
      '等${count}件商品';
  @override
  String get orderIdLabel =>
      TranslationOverrides.string(_root.$meta, 'order.orderIdLabel', {}) ??
      '訂單號：';
  @override
  String get orderAmount =>
      TranslationOverrides.string(_root.$meta, 'order.orderAmount', {}) ??
      '訂單金額';
  @override
  String get cancelOrder =>
      TranslationOverrides.string(_root.$meta, 'order.cancelOrder', {}) ??
      '取消訂單';
  @override
  String get payNow =>
      TranslationOverrides.string(_root.$meta, 'order.payNow', {}) ?? '去支付';
  @override
  String get viewDetail =>
      TranslationOverrides.string(_root.$meta, 'order.viewDetail', {}) ??
      '查看詳情';
  @override
  String get cancelConfirmTitle =>
      TranslationOverrides.string(
        _root.$meta,
        'order.cancelConfirmTitle',
        {},
      ) ??
      '確認取消';
  @override
  String get cancelConfirmContent =>
      TranslationOverrides.string(
        _root.$meta,
        'order.cancelConfirmContent',
        {},
      ) ??
      '確定要取消這個訂單嗎？';
  @override
  String get orderCancelled =>
      TranslationOverrides.string(_root.$meta, 'order.orderCancelled', {}) ??
      '訂單已取消';
  @override
  String get confirmOrder =>
      TranslationOverrides.string(_root.$meta, 'order.confirmOrder', {}) ??
      '確認訂單';
  @override
  String get actualAmount =>
      TranslationOverrides.string(_root.$meta, 'order.actualAmount', {}) ??
      '實付金額';
  @override
  String get totalLabel =>
      TranslationOverrides.string(_root.$meta, 'order.totalLabel', {}) ??
      '合計: ';
  @override
  String get submitOrder =>
      TranslationOverrides.string(_root.$meta, 'order.submitOrder', {}) ??
      '提交訂單';
  @override
  String createFailed({required Object error}) =>
      TranslationOverrides.string(_root.$meta, 'order.createFailed', {
        'error': error,
      }) ??
      '建立訂單失敗: ${error}';
}

// Path: partner
class _TranslationsPartnerZhTw extends TranslationsPartnerZhCn {
  _TranslationsPartnerZhTw._(TranslationsZhTw root)
    : this._root = root,
      super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title =>
      TranslationOverrides.string(_root.$meta, 'partner.title', {}) ?? '合作商加盟';

  @override
  String get subtitle =>
      TranslationOverrides.string(_root.$meta, 'partner.subtitle', {}) ??
      '攜手共創美好未來';

  @override
  String get advantages =>
      TranslationOverrides.string(_root.$meta, 'partner.advantages', {}) ??
      '合作優勢';

  @override
  String get advantage1Title =>
      TranslationOverrides.string(_root.$meta, 'partner.advantage1Title', {}) ??
      '豐厚收益';

  @override
  String get advantage1Desc =>
      TranslationOverrides.string(_root.$meta, 'partner.advantage1Desc', {}) ??
      '提供有競爭力的分成比例，讓您的投入獲得豐厚回報';

  @override
  String get advantage2Title =>
      TranslationOverrides.string(_root.$meta, 'partner.advantage2Title', {}) ??
      '品牌支持';

  @override
  String get advantage2Desc =>
      TranslationOverrides.string(_root.$meta, 'partner.advantage2Desc', {}) ??
      '共享知名品牌資源，享受品牌效應帶來的客戶信任';

  @override
  String get advantage3Title =>
      TranslationOverrides.string(_root.$meta, 'partner.advantage3Title', {}) ??
      '市場推廣';

  @override
  String get advantage3Desc =>
      TranslationOverrides.string(_root.$meta, 'partner.advantage3Desc', {}) ??
      '專業的市場推廣團隊，為您提供全方位的營銷支持';

  @override
  String get advantage4Title =>
      TranslationOverrides.string(_root.$meta, 'partner.advantage4Title', {}) ??
      '培訓支持';

  @override
  String get advantage4Desc =>
      TranslationOverrides.string(_root.$meta, 'partner.advantage4Desc', {}) ??
      '提供專業的培訓課程，幫助您快速掌握經營技巧';

  @override
  String get process =>
      TranslationOverrides.string(_root.$meta, 'partner.process', {}) ?? '合作流程';

  @override
  String get process1Title =>
      TranslationOverrides.string(_root.$meta, 'partner.process1Title', {}) ??
      '提交申請';

  @override
  String get process1Desc =>
      TranslationOverrides.string(_root.$meta, 'partner.process1Desc', {}) ??
      '填寫合作申請表，提交相關資料';

  @override
  String get process2Title =>
      TranslationOverrides.string(_root.$meta, 'partner.process2Title', {}) ??
      '資質審核';

  @override
  String get process2Desc =>
      TranslationOverrides.string(_root.$meta, 'partner.process2Desc', {}) ??
      '我們將在3-5個工作日內完成資質審核';

  @override
  String get process3Title =>
      TranslationOverrides.string(_root.$meta, 'partner.process3Title', {}) ??
      '面談溝通';

  @override
  String get process3Desc =>
      TranslationOverrides.string(_root.$meta, 'partner.process3Desc', {}) ??
      '安排面談，詳細了解合作細節';

  @override
  String get process4Title =>
      TranslationOverrides.string(_root.$meta, 'partner.process4Title', {}) ??
      '簽署協議';

  @override
  String get process4Desc =>
      TranslationOverrides.string(_root.$meta, 'partner.process4Desc', {}) ??
      '雙方達成一致後簽署正式合作協議';

  @override
  String get process5Title =>
      TranslationOverrides.string(_root.$meta, 'partner.process5Title', {}) ??
      '開始合作';

  @override
  String get process5Desc =>
      TranslationOverrides.string(_root.$meta, 'partner.process5Desc', {}) ??
      '正式啟動合作，享受各項支持服務';

  @override
  String get conditions =>
      TranslationOverrides.string(_root.$meta, 'partner.conditions', {}) ??
      '合作條件';

  @override
  String get condition1 =>
      TranslationOverrides.string(_root.$meta, 'partner.condition1', {}) ??
      '具有合法的經營資質';

  @override
  String get condition2 =>
      TranslationOverrides.string(_root.$meta, 'partner.condition2', {}) ??
      '有一定的資金實力和經營能力';

  @override
  String get condition3 =>
      TranslationOverrides.string(_root.$meta, 'partner.condition3', {}) ??
      '認同我們的品牌理念和經營模式';

  @override
  String get condition4 =>
      TranslationOverrides.string(_root.$meta, 'partner.condition4', {}) ??
      '具備良好的商業信譽';

  @override
  String get condition5 =>
      TranslationOverrides.string(_root.$meta, 'partner.condition5', {}) ??
      '有相關行業經驗者優先';

  @override
  String get applicationTitle =>
      TranslationOverrides.string(
        _root.$meta,
        'partner.applicationTitle',
        {},
      ) ??
      '申請合作';

  @override
  String get nameLabel =>
      TranslationOverrides.string(_root.$meta, 'partner.nameLabel', {}) ?? '姓名';

  @override
  String get nameInputHint =>
      TranslationOverrides.string(_root.$meta, 'partner.nameInputHint', {}) ??
      '請輸入您的姓名';

  @override
  String get companyLabel =>
      TranslationOverrides.string(_root.$meta, 'partner.companyLabel', {}) ??
      '公司名稱';

  @override
  String get companyInputHint =>
      TranslationOverrides.string(
        _root.$meta,
        'partner.companyInputHint',
        {},
      ) ??
      '請輸入公司名稱';

  @override
  String get phoneLabel =>
      TranslationOverrides.string(_root.$meta, 'partner.phoneLabel', {}) ??
      '聯繫電話';

  @override
  String get phoneInputHint =>
      TranslationOverrides.string(_root.$meta, 'partner.phoneInputHint', {}) ??
      '請輸入聯繫電話';

  @override
  String get intentionLabel =>
      TranslationOverrides.string(_root.$meta, 'partner.intentionLabel', {}) ??
      '合作意向';

  @override
  String get intentionInputHint =>
      TranslationOverrides.string(
        _root.$meta,
        'partner.intentionInputHint',
        {},
      ) ??
      '請簡述您的合作意向';

  @override
  String get submit =>
      TranslationOverrides.string(_root.$meta, 'partner.submit', {}) ?? '提交申請';

  @override
  String get submitSuccess =>
      TranslationOverrides.string(_root.$meta, 'partner.submitSuccess', {}) ??
      '申請提交成功，我們會盡快聯繫您';

  @override
  String get submitFailed =>
      TranslationOverrides.string(_root.$meta, 'partner.submitFailed', {}) ??
      '申請提交失敗，請稍後重試';

  @override
  String get incompleteInfo =>
      TranslationOverrides.string(_root.$meta, 'partner.incompleteInfo', {}) ??
      '請填寫完整信息';

  @override
  String get contactTitle =>
      TranslationOverrides.string(_root.$meta, 'partner.contactTitle', {}) ??
      '聯繫我們';

  @override
  String get serviceHotline =>
      TranslationOverrides.string(_root.$meta, 'partner.serviceHotline', {}) ??
      '客服熱線';

  @override
  String get address =>
      TranslationOverrides.string(_root.$meta, 'partner.address', {}) ?? '地址';

  @override
  String errorOccurred({required Object error}) =>
      TranslationOverrides.string(_root.$meta, 'partner.errorOccurred', {
        'error': error,
      }) ??
      '發生錯誤: ${error}';
}

// Path: payment
class _TranslationsPaymentZhTw extends TranslationsPaymentZhCn {
  _TranslationsPaymentZhTw._(TranslationsZhTw root)
    : this._root = root,
      super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get checkout =>
      TranslationOverrides.string(_root.$meta, 'payment.checkout', {}) ?? '收銀台';
  @override
  String get success =>
      TranslationOverrides.string(_root.$meta, 'payment.success', {}) ?? '支付成功';
  @override
  String get orderNotFound =>
      TranslationOverrides.string(_root.$meta, 'payment.orderNotFound', {}) ??
      '訂單資訊不存在';
  @override
  String get payNow =>
      TranslationOverrides.string(_root.$meta, 'payment.payNow', {}) ?? '立即支付';
  @override
  String get initializing =>
      TranslationOverrides.string(_root.$meta, 'payment.initializing', {}) ??
      '正在初始化支付組件...';
  @override
  String get cancelTitle =>
      TranslationOverrides.string(_root.$meta, 'payment.cancelTitle', {}) ??
      '取消支付';
  @override
  String get cancelContent =>
      TranslationOverrides.string(_root.$meta, 'payment.cancelContent', {}) ??
      '確定要取消支付嗎？訂單將被取消';
  @override
  String get continuePay =>
      TranslationOverrides.string(_root.$meta, 'payment.continuePay', {}) ??
      '繼續支付';
  @override
  String get cancelPay =>
      TranslationOverrides.string(_root.$meta, 'payment.cancelPay', {}) ??
      '取消支付';
  @override
  String get amount =>
      TranslationOverrides.string(_root.$meta, 'payment.amount', {}) ?? '支付金額';
  @override
  String get remainingTime =>
      TranslationOverrides.string(_root.$meta, 'payment.remainingTime', {}) ??
      '支付剩餘時間';
}

// Path: points
class _TranslationsPointsZhTw extends TranslationsPointsZhCn {
  _TranslationsPointsZhTw._(TranslationsZhTw root)
    : this._root = root,
      super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title =>
      TranslationOverrides.string(_root.$meta, 'points.title', {}) ?? '我的乖乖幣';

  @override
  String get unit =>
      TranslationOverrides.string(_root.$meta, 'points.unit', {}) ?? '乖乖幣';

  @override
  String get mall =>
      TranslationOverrides.string(_root.$meta, 'points.mall', {}) ?? '乖乖幣商城';

  @override
  String get goExchange =>
      TranslationOverrides.string(_root.$meta, 'points.goExchange', {}) ??
      '去兌換';

  @override
  String get rules =>
      TranslationOverrides.string(_root.$meta, 'points.rules', {}) ?? '乖乖幣規則';

  @override
  String get rule1 =>
      TranslationOverrides.string(_root.$meta, 'points.rule1', {}) ?? '乖乖幣永久有效';

  @override
  String get rule2 =>
      TranslationOverrides.string(_root.$meta, 'points.rule2', {}) ??
      '抽獎可獲得額外乖乖幣';

  @override
  String get records =>
      TranslationOverrides.string(_root.$meta, 'points.records', {}) ?? '乖乖幣記錄';

  @override
  String get all =>
      TranslationOverrides.string(_root.$meta, 'points.all', {}) ?? '全部';

  @override
  String get earned =>
      TranslationOverrides.string(_root.$meta, 'points.earned', {}) ?? '獲得';

  @override
  String get used =>
      TranslationOverrides.string(_root.$meta, 'points.used', {}) ?? '使用';

  @override
  String get noRecords =>
      TranslationOverrides.string(_root.$meta, 'points.noRecords', {}) ??
      '暫無乖乖幣記錄';

  @override
  String get back =>
      TranslationOverrides.string(_root.$meta, 'points.back', {}) ?? '返回';

  @override
  String get goLottery =>
      TranslationOverrides.string(_root.$meta, 'points.goLottery', {}) ?? '去抽獎';

  @override
  String get balance =>
      TranslationOverrides.string(_root.$meta, 'points.balance', {}) ?? '餘額';

  @override
  String get coupon =>
      TranslationOverrides.string(_root.$meta, 'points.coupon', {}) ?? '優惠券';

  @override
  String get noMoreProducts =>
      TranslationOverrides.string(_root.$meta, 'points.noMoreProducts', {}) ??
      '沒有更多商品了';

  @override
  String myPoints({required Object points}) =>
      TranslationOverrides.string(_root.$meta, 'points.myPoints', {
        'points': points,
      }) ??
      '我的乖乖幣: ${points}';

  @override
  String get noProducts =>
      TranslationOverrides.string(_root.$meta, 'points.noProducts', {}) ??
      '暫無商品';

  @override
  String cost({required Object points}) =>
      TranslationOverrides.string(_root.$meta, 'points.cost', {
        'points': points,
      }) ??
      '${points} 乖乖幣';

  @override
  String get exchangeNow =>
      TranslationOverrides.string(_root.$meta, 'points.exchangeNow', {}) ??
      '立即兌換';

  @override
  String get insufficientPoints =>
      TranslationOverrides.string(
        _root.$meta,
        'points.insufficientPoints',
        {},
      ) ??
      '餘額不足';
}

// Path: product
class _TranslationsProductZhTw extends TranslationsProductZhCn {
  _TranslationsProductZhTw._(TranslationsZhTw root)
    : this._root = root,
      super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title =>
      TranslationOverrides.string(_root.$meta, 'product.title', {}) ?? '商品列表';
  @override
  String get detail =>
      TranslationOverrides.string(_root.$meta, 'product.detail', {}) ?? '商品詳情';
  @override
  String get hot =>
      TranslationOverrides.string(_root.$meta, 'product.hot', {}) ?? '熱銷';
  @override
  String get promotion =>
      TranslationOverrides.string(_root.$meta, 'product.promotion', {}) ?? '促銷';
  @override
  String discountOff({required Object percent}) =>
      TranslationOverrides.string(_root.$meta, 'product.discountOff', {
        'percent': percent,
      }) ??
      '${percent}% OFF';
  @override
  String get stockFull =>
      TranslationOverrides.string(_root.$meta, 'product.stockFull', {}) ??
      '庫存充足';
  @override
  String get stockEmpty =>
      TranslationOverrides.string(_root.$meta, 'product.stockEmpty', {}) ??
      '暫時缺貨';
  @override
  String get addToCart =>
      TranslationOverrides.string(_root.$meta, 'product.addToCart', {}) ??
      '加入購物車';
  @override
  String get addedToCart =>
      TranslationOverrides.string(_root.$meta, 'product.addedToCart', {}) ??
      '已加入購物車';
  @override
  String get specifications =>
      TranslationOverrides.string(_root.$meta, 'product.specifications', {}) ??
      '規格參數';
  @override
  String get categoryAll =>
      TranslationOverrides.string(_root.$meta, 'product.categoryAll', {}) ??
      '全部';
  @override
  String get categoryFood =>
      TranslationOverrides.string(_root.$meta, 'product.categoryFood', {}) ??
      '食品';
  @override
  String get categoryDrink =>
      TranslationOverrides.string(_root.$meta, 'product.categoryDrink', {}) ??
      '飲料';
  @override
  String get categorySnack =>
      TranslationOverrides.string(_root.$meta, 'product.categorySnack', {}) ??
      '零食';
  @override
  String get sortDefault =>
      TranslationOverrides.string(_root.$meta, 'product.sortDefault', {}) ??
      '預設排序';
  @override
  String get sortPriceAsc =>
      TranslationOverrides.string(_root.$meta, 'product.sortPriceAsc', {}) ??
      '價格從低到高';
  @override
  String get sortPriceDesc =>
      TranslationOverrides.string(_root.$meta, 'product.sortPriceDesc', {}) ??
      '價格從高到低';
  @override
  String get sortName =>
      TranslationOverrides.string(_root.$meta, 'product.sortName', {}) ??
      '按名稱排序';
  @override
  String get filterOnlyAvailable =>
      TranslationOverrides.string(
        _root.$meta,
        'product.filterOnlyAvailable',
        {},
      ) ??
      '僅顯示可用商品';
  @override
  String get cart =>
      TranslationOverrides.string(_root.$meta, 'product.cart', {}) ?? '購物車';
}

// Path: profile
class _TranslationsProfileZhTw extends TranslationsProfileZhCn {
  _TranslationsProfileZhTw._(TranslationsZhTw root)
    : this._root = root,
      super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title =>
      TranslationOverrides.string(_root.$meta, 'profile.title', {}) ?? '用戶中心';
  @override
  String get notLoggedIn =>
      TranslationOverrides.string(_root.$meta, 'profile.notLoggedIn', {}) ??
      '未登入';
  @override
  String get editProfile =>
      TranslationOverrides.string(_root.$meta, 'profile.editProfile', {}) ??
      '編輯資料';
  @override
  String get logout =>
      TranslationOverrides.string(_root.$meta, 'profile.logout', {}) ?? '登出';
  @override
  String get favoriteDevices =>
      TranslationOverrides.string(_root.$meta, 'profile.favoriteDevices', {}) ??
      '收藏設備';
  @override
  String get personalInfo =>
      TranslationOverrides.string(_root.$meta, 'profile.personalInfo', {}) ??
      '個人資訊';
  @override
  String get confirmLogout =>
      TranslationOverrides.string(_root.$meta, 'profile.confirmLogout', {}) ??
      '確認登出';
  @override
  String get confirmLogoutContent =>
      TranslationOverrides.string(
        _root.$meta,
        'profile.confirmLogoutContent',
        {},
      ) ??
      '確定要登出嗎？';
  @override
  String get clearCacheConfirm =>
      TranslationOverrides.string(
        _root.$meta,
        'profile.clearCacheConfirm',
        {},
      ) ??
      '確定要清除所有快取數據嗎？';
  @override
  String get noFavoriteDevices =>
      TranslationOverrides.string(
        _root.$meta,
        'profile.noFavoriteDevices',
        {},
      ) ??
      '暫無收藏設備';
  @override
  String get removeFavorite =>
      TranslationOverrides.string(_root.$meta, 'profile.removeFavorite', {}) ??
      '取消收藏';
  @override
  String removeFavoriteConfirm({required Object name}) =>
      TranslationOverrides.string(
        _root.$meta,
        'profile.removeFavoriteConfirm',
        {'name': name},
      ) ??
      '確定要取消收藏"${name}"嗎？';
  @override
  String get appDescription =>
      TranslationOverrides.string(_root.$meta, 'profile.appDescription', {}) ??
      '一個便捷的自動售貨機購買應用';
  @override
  String version({required Object version}) =>
      TranslationOverrides.string(_root.$meta, 'profile.version', {
        'version': version,
      }) ??
      '版本：${version}';

  @override
  String get wallet =>
      TranslationOverrides.string(_root.$meta, 'profile.wallet', {}) ?? '我的錢包';

  @override
  String get coupon =>
      TranslationOverrides.string(_root.$meta, 'profile.coupon', {}) ?? '優惠券';

  @override
  String get feedback =>
      TranslationOverrides.string(_root.$meta, 'profile.feedback', {}) ??
      '問題反饋';

  @override
  String get cooperation =>
      TranslationOverrides.string(_root.$meta, 'profile.cooperation', {}) ??
      '合作商加盟';

  @override
  String get about =>
      TranslationOverrides.string(_root.$meta, 'profile.about', {}) ?? '關於我們';

  @override
  String get settings =>
      TranslationOverrides.string(_root.$meta, 'profile.settings', {}) ?? '設置';
  @override
  late final _TranslationsProfileGenderZhTw gender =
      _TranslationsProfileGenderZhTw._(_root);
  @override
  late final _TranslationsProfileInfoZhTw info = _TranslationsProfileInfoZhTw._(
    _root,
  );
  @override
  late final _TranslationsProfileAvatarZhTw avatar =
      _TranslationsProfileAvatarZhTw._(_root);

  @override
  String get saveSuccess =>
      TranslationOverrides.string(_root.$meta, 'profile.saveSuccess', {}) ??
      '保存成功';

  @override
  String saveFailed({required Object error}) =>
      TranslationOverrides.string(_root.$meta, 'profile.saveFailed', {
        'error': error,
      }) ??
      '保存失敗: ${error}';

  @override
  String get saveInfo =>
      TranslationOverrides.string(_root.$meta, 'profile.saveInfo', {}) ??
      '保存信息';

  @override
  String get walletBalance =>
      TranslationOverrides.string(_root.$meta, 'profile.walletBalance', {}) ??
      '錢包餘額';

  @override
  String get coin =>
      TranslationOverrides.string(_root.$meta, 'profile.coin', {}) ?? '乖乖幣';

  @override
  String get couponCount =>
      TranslationOverrides.string(_root.$meta, 'profile.couponCount', {}) ??
      '優惠券';
}

// Path: settings
class _TranslationsSettingsZhTw extends TranslationsSettingsZhCn {
  _TranslationsSettingsZhTw._(TranslationsZhTw root)
    : this._root = root,
      super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title =>
      TranslationOverrides.string(_root.$meta, 'settings.title', {}) ?? '設定';
  @override
  String get general =>
      TranslationOverrides.string(_root.$meta, 'settings.general', {}) ?? '通用';
  @override
  String get language =>
      TranslationOverrides.string(_root.$meta, 'settings.language', {}) ?? '語言';
  @override
  String get checkUpdate =>
      TranslationOverrides.string(_root.$meta, 'settings.checkUpdate', {}) ??
      '檢查更新';
  @override
  String get clearCache =>
      TranslationOverrides.string(_root.$meta, 'settings.clearCache', {}) ??
      '清除快取';
  @override
  String get about =>
      TranslationOverrides.string(_root.$meta, 'settings.about', {}) ?? '關於';
  @override
  String get deviceInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.deviceInfo', {}) ??
      '設備資訊';
  @override
  String get aboutUs =>
      TranslationOverrides.string(_root.$meta, 'settings.aboutUs', {}) ??
      '關於我們';
  @override
  String get checkingUpdate =>
      TranslationOverrides.string(_root.$meta, 'settings.checkingUpdate', {}) ??
      '正在檢查更新...';
  @override
  String get cacheCleared =>
      TranslationOverrides.string(_root.$meta, 'settings.cacheCleared', {}) ??
      '快取已清除';
  @override
  String get english =>
      TranslationOverrides.string(_root.$meta, 'settings.english', {}) ?? '英語';
  @override
  String get chinese =>
      TranslationOverrides.string(_root.$meta, 'settings.chinese', {}) ??
      '簡體中文';
  @override
  String get traditionalChinese =>
      TranslationOverrides.string(
        _root.$meta,
        'settings.traditionalChinese',
        {},
      ) ??
      '繁體中文';
  @override
  String get theme =>
      TranslationOverrides.string(_root.$meta, 'settings.theme', {}) ?? '主題模式';
  @override
  String get themeScheme =>
      TranslationOverrides.string(_root.$meta, 'settings.themeScheme', {}) ??
      '主題配色';
  @override
  late final _TranslationsSettingsSchemesZhTw schemes =
      _TranslationsSettingsSchemesZhTw._(_root);
  @override
  String get appName =>
      TranslationOverrides.string(_root.$meta, 'settings.appName', {}) ??
      '應用名稱';
  @override
  String get packageName =>
      TranslationOverrides.string(_root.$meta, 'settings.packageName', {}) ??
      '包名';

  @override
  String get versionName =>
      TranslationOverrides.string(_root.$meta, 'settings.versionName', {}) ??
      '版本號';

  @override
  String get buildNumber =>
      TranslationOverrides.string(_root.$meta, 'settings.buildNumber', {}) ??
      '構建號';

  @override
  String get copyright =>
      TranslationOverrides.string(_root.$meta, 'settings.copyright', {}) ??
      '© 2024 Lunchbox Team';
}

// Path: splash
class _TranslationsSplashZhTw extends TranslationsSplashZhCn {
  _TranslationsSplashZhTw._(TranslationsZhTw root)
    : this._root = root,
      super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get starting =>
      TranslationOverrides.string(_root.$meta, 'splash.starting', {}) ??
      '正在啟動...';
  @override
  String get checkingServices =>
      TranslationOverrides.string(_root.$meta, 'splash.checkingServices', {}) ??
      '檢查服務狀態...';
  @override
  String get loadingConfig =>
      TranslationOverrides.string(_root.$meta, 'splash.loadingConfig', {}) ??
      '載入配置...';
  @override
  String get checkingAuth =>
      TranslationOverrides.string(_root.$meta, 'splash.checkingAuth', {}) ??
      '檢查登入狀態...';
  @override
  String get preparingData =>
      TranslationOverrides.string(_root.$meta, 'splash.preparingData', {}) ??
      '準備數據...';
  @override
  String get ready =>
      TranslationOverrides.string(_root.$meta, 'splash.ready', {}) ?? '啟動完成';
  @override
  String get failed =>
      TranslationOverrides.string(_root.$meta, 'splash.failed', {}) ?? '啟動失敗';
}

// Path: time
class _TranslationsTimeZhTw extends TranslationsTimeZhCn {
  _TranslationsTimeZhTw._(TranslationsZhTw root)
    : this._root = root,
      super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get justNow =>
      TranslationOverrides.string(_root.$meta, 'time.justNow', {}) ?? '剛剛';
  @override
  String minutesAgo({required Object minutes}) =>
      TranslationOverrides.string(_root.$meta, 'time.minutesAgo', {
        'minutes': minutes,
      }) ??
      '${minutes}分鐘前';
  @override
  String hoursAgo({required Object hours}) =>
      TranslationOverrides.string(_root.$meta, 'time.hoursAgo', {
        'hours': hours,
      }) ??
      '${hours}小時前';
  @override
  String daysAgo({required Object days}) =>
      TranslationOverrides.string(_root.$meta, 'time.daysAgo', {
        'days': days,
      }) ??
      '${days}天前';
}

// Path: community.features
class _TranslationsCommunityFeaturesZhTw
    extends TranslationsCommunityFeaturesZhCn {
  _TranslationsCommunityFeaturesZhTw._(TranslationsZhTw root)
    : this._root = root,
      super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get coupon =>
      TranslationOverrides.string(
        _root.$meta,
        'community.features.coupon',
        {},
      ) ??
      '專屬優惠券';
  @override
  String get couponHint =>
      TranslationOverrides.string(
        _root.$meta,
        'community.features.couponHint',
        {},
      ) ??
      '群內專享折扣，省錢又美味';
  @override
  String get tasting =>
      TranslationOverrides.string(
        _root.$meta,
        'community.features.tasting',
        {},
      ) ??
      '新品試吃';
  @override
  String get tastingHint =>
      TranslationOverrides.string(
        _root.$meta,
        'community.features.tastingHint',
        {},
      ) ??
      '第一時間品嚐最新美食';
  @override
  String get exchange =>
      TranslationOverrides.string(
        _root.$meta,
        'community.features.exchange',
        {},
      ) ??
      '美食交流';
  @override
  String get exchangeHint =>
      TranslationOverrides.string(
        _root.$meta,
        'community.features.exchangeHint',
        {},
      ) ??
      '與美食達人分享心得';
  @override
  String get priority =>
      TranslationOverrides.string(
        _root.$meta,
        'community.features.priority',
        {},
      ) ??
      '活動優先';
  @override
  String get priorityHint =>
      TranslationOverrides.string(
        _root.$meta,
        'community.features.priorityHint',
        {},
      ) ??
      '優先參與各種美食活動';
  @override
  String get activity =>
      TranslationOverrides.string(
        _root.$meta,
        'community.features.activity',
        {},
      ) ??
      '社群活動';
  @override
  String get activityHint =>
      TranslationOverrides.string(
        _root.$meta,
        'community.features.activityHint',
        {},
      ) ??
      '定期舉辦線下聚會';
  @override
  String get topic =>
      TranslationOverrides.string(
        _root.$meta,
        'community.features.topic',
        {},
      ) ??
      '話題討論';
  @override
  String get topicHint =>
      TranslationOverrides.string(
        _root.$meta,
        'community.features.topicHint',
        {},
      ) ??
      '參與話題贏取獎勵';
}

// Path: coupon.tabs
class _TranslationsCouponTabsZhTw extends TranslationsCouponTabsZhCn {
  _TranslationsCouponTabsZhTw._(TranslationsZhTw root)
    : this._root = root,
      super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get available =>
      TranslationOverrides.string(_root.$meta, 'coupon.tabs.available', {}) ??
      '可領取';

  @override
  String get received =>
      TranslationOverrides.string(_root.$meta, 'coupon.tabs.received', {}) ??
      '已領取';

  @override
  String get expired =>
      TranslationOverrides.string(_root.$meta, 'coupon.tabs.expired', {}) ??
      '已過期';
  @override
  String get canUse =>
      TranslationOverrides.string(_root.$meta, 'coupon.tabs.canUse', {}) ??
      '可使用';
  @override
  String get cannotUse =>
      TranslationOverrides.string(_root.$meta, 'coupon.tabs.cannotUse', {}) ??
      '不可使用';
}

// Path: home.grid
class _TranslationsHomeGridZhTw extends TranslationsHomeGridZhCn {
  _TranslationsHomeGridZhTw._(TranslationsZhTw root)
    : this._root = root,
      super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get welfare =>
      TranslationOverrides.string(_root.$meta, 'home.grid.welfare', {}) ??
      '社群福利';
  @override
  String get service =>
      TranslationOverrides.string(_root.$meta, 'home.grid.service', {}) ??
      '客服中心';
  @override
  String get coupon =>
      TranslationOverrides.string(_root.$meta, 'home.grid.coupon', {}) ??
      '領優惠券';
  @override
  String get lottery =>
      TranslationOverrides.string(_root.$meta, 'home.grid.lottery', {}) ??
      '幸運抽獎';
  @override
  String get invite =>
      TranslationOverrides.string(_root.$meta, 'home.grid.invite', {}) ??
      '邀請好友';
}

// Path: home.lottery
class _TranslationsHomeLotteryZhTw extends TranslationsHomeLotteryZhCn {
  _TranslationsHomeLotteryZhTw._(TranslationsZhTw root)
    : this._root = root,
      super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get title =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.title', {}) ??
      '幸運抽獎';
  @override
  String get prizes =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.prizes', {}) ??
      '我的獎品';
  @override
  String get rules =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.rules', {}) ??
      '抽獎規則';
  @override
  String get remaining =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.remaining', {}) ??
      '剩餘次數: {count}';
  @override
  String get spin =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.spin', {}) ?? '抽獎';
  @override
  String get rule1 =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.rule1', {}) ??
      '每日有免費抽獎次數，次數用完後可領取任務獲得';
  @override
  String get rule2 =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.rule2', {}) ??
      '優惠券48小時內有效，乖乖幣自動到帳';
  @override
  String get rule3 =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.rule3', {}) ??
      '活動最終解釋權歸平台所有';
  @override
  String get prizeUnit =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.prizeUnit', {}) ??
      '乖乖幣';
  @override
  String get prizeList =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.prizeList', {}) ??
      '獎品說明';
  @override
  String get back =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.back', {}) ?? '返回';
  @override
  late final _TranslationsHomeLotteryPrizeStatsZhTw prizeStats =
      _TranslationsHomeLotteryPrizeStatsZhTw._(_root);
  @override
  late final _TranslationsHomeLotteryTabsZhTw tabs =
      _TranslationsHomeLotteryTabsZhTw._(_root);
  @override
  late final _TranslationsHomeLotteryPrizeCardZhTw prizeCard =
      _TranslationsHomeLotteryPrizeCardZhTw._(_root);
}

// Path: home.status
class _TranslationsHomeStatusZhTw extends TranslationsHomeStatusZhCn {
  _TranslationsHomeStatusZhTw._(TranslationsZhTw root)
    : this._root = root,
      super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get open =>
      TranslationOverrides.string(_root.$meta, 'home.status.open', {}) ?? '營業中';
  @override
  String get closed =>
      TranslationOverrides.string(_root.$meta, 'home.status.closed', {}) ??
      '休息中';
  @override
  String get mobilePayment =>
      TranslationOverrides.string(
        _root.$meta,
        'home.status.mobilePayment',
        {},
      ) ??
      '支援行動支付';
}

// Path: order.status
class _TranslationsOrderStatusZhTw extends TranslationsOrderStatusZhCn {
  _TranslationsOrderStatusZhTw._(TranslationsZhTw root)
    : this._root = root,
      super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get all =>
      TranslationOverrides.string(_root.$meta, 'order.status.all', {}) ?? '全部';

  @override
  String get pending =>
      TranslationOverrides.string(_root.$meta, 'order.status.pending', {}) ??
      '待支付';

  @override
  String get paid =>
      TranslationOverrides.string(_root.$meta, 'order.status.paid', {}) ??
      '已支付';

  @override
  String get completed =>
      TranslationOverrides.string(_root.$meta, 'order.status.completed', {}) ??
      '已完成';

  @override
  String get cancelled =>
      TranslationOverrides.string(_root.$meta, 'order.status.cancelled', {}) ??
      '已取消';

  @override
  String get refunded =>
      TranslationOverrides.string(_root.$meta, 'order.status.refunded', {}) ??
      '已退款';

  @override
  String get failed =>
      TranslationOverrides.string(_root.$meta, 'order.status.failed', {}) ??
      '支付失敗';
}

// Path: profile.gender
class _TranslationsProfileGenderZhTw extends TranslationsProfileGenderZhCn {
  _TranslationsProfileGenderZhTw._(TranslationsZhTw root)
    : this._root = root,
      super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get male =>
      TranslationOverrides.string(_root.$meta, 'profile.gender.male', {}) ??
      '男';
  @override
  String get female =>
      TranslationOverrides.string(_root.$meta, 'profile.gender.female', {}) ??
      '女';
  @override
  String get unknown =>
      TranslationOverrides.string(_root.$meta, 'profile.gender.unknown', {}) ??
      '保密';
}

// Path: profile.info
class _TranslationsProfileInfoZhTw extends TranslationsProfileInfoZhCn {
  _TranslationsProfileInfoZhTw._(TranslationsZhTw root)
    : this._root = root,
      super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get basic =>
      TranslationOverrides.string(_root.$meta, 'profile.info.basic', {}) ??
      '基本信息';
  @override
  String get other =>
      TranslationOverrides.string(_root.$meta, 'profile.info.other', {}) ??
      '其他信息';
  @override
  String get phone =>
      TranslationOverrides.string(_root.$meta, 'profile.info.phone', {}) ??
      '手機號';
  @override
  String get gender =>
      TranslationOverrides.string(_root.$meta, 'profile.info.gender', {}) ??
      '性別';

  @override
  String get birthday =>
      TranslationOverrides.string(_root.$meta, 'profile.info.birthday', {}) ??
      '生日';

  @override
  String get email =>
      TranslationOverrides.string(_root.$meta, 'profile.info.email', {}) ??
      '郵箱';

  @override
  String get notSet =>
      TranslationOverrides.string(_root.$meta, 'profile.info.notSet', {}) ??
      '未設置';
}

// Path: profile.avatar
class _TranslationsProfileAvatarZhTw extends TranslationsProfileAvatarZhCn {
  _TranslationsProfileAvatarZhTw._(TranslationsZhTw root)
    : this._root = root,
      super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get clickToChange =>
      TranslationOverrides.string(
        _root.$meta,
        'profile.avatar.clickToChange',
        {},
      ) ??
      '點擊更換頭像';

  @override
  String get uploading =>
      TranslationOverrides.string(
        _root.$meta,
        'profile.avatar.uploading',
        {},
      ) ??
      '頭像上傳功能開發中';
}

// Path: settings.schemes
class _TranslationsSettingsSchemesZhTw extends TranslationsSettingsSchemesZhCn {
  _TranslationsSettingsSchemesZhTw._(TranslationsZhTw root)
    : this._root = root,
      super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get shadOrange =>
      TranslationOverrides.string(
        _root.$meta,
        'settings.schemes.shadOrange',
        {},
      ) ??
      '活力橙 (ShadOrange)';

  @override
  String get shadGreen =>
      TranslationOverrides.string(
        _root.$meta,
        'settings.schemes.shadGreen',
        {},
      ) ??
      '自然綠 (ShadGreen)';

  @override
  String get bahamaBlue =>
      TranslationOverrides.string(
        _root.$meta,
        'settings.schemes.bahamaBlue',
        {},
      ) ??
      '巴哈馬藍 (BahamaBlue)';

  @override
  String get damask =>
      TranslationOverrides.string(_root.$meta, 'settings.schemes.damask', {}) ??
      '錦緞紅 (Damask)';
}

// Path: home.lottery.prizeStats
class _TranslationsHomeLotteryPrizeStatsZhTw
    extends TranslationsHomeLotteryPrizeStatsZhCn {
  _TranslationsHomeLotteryPrizeStatsZhTw._(TranslationsZhTw root)
    : this._root = root,
      super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get total =>
      TranslationOverrides.string(
        _root.$meta,
        'home.lottery.prizeStats.total',
        {},
      ) ??
      '總獎品';
  @override
  String get used =>
      TranslationOverrides.string(
        _root.$meta,
        'home.lottery.prizeStats.used',
        {},
      ) ??
      '已使用';
  @override
  String get available =>
      TranslationOverrides.string(
        _root.$meta,
        'home.lottery.prizeStats.available',
        {},
      ) ??
      '可用';
}

// Path: home.lottery.tabs
class _TranslationsHomeLotteryTabsZhTw extends TranslationsHomeLotteryTabsZhCn {
  _TranslationsHomeLotteryTabsZhTw._(TranslationsZhTw root)
    : this._root = root,
      super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get all =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.tabs.all', {}) ??
      '全部';
  @override
  String get available =>
      TranslationOverrides.string(
        _root.$meta,
        'home.lottery.tabs.available',
        {},
      ) ??
      '可用';
  @override
  String get used =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.tabs.used', {}) ??
      '已使用';
  @override
  String get expired =>
      TranslationOverrides.string(
        _root.$meta,
        'home.lottery.tabs.expired',
        {},
      ) ??
      '已過期';
}

// Path: home.lottery.prizeCard
class _TranslationsHomeLotteryPrizeCardZhTw
    extends TranslationsHomeLotteryPrizeCardZhCn {
  _TranslationsHomeLotteryPrizeCardZhTw._(TranslationsZhTw root)
    : this._root = root,
      super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override
  String get source =>
      TranslationOverrides.string(
        _root.$meta,
        'home.lottery.prizeCard.source',
        {},
      ) ??
      '乖乖幣獎勵，可在乖乖幣商城使用';
  @override
  String get getTime =>
      TranslationOverrides.string(
        _root.$meta,
        'home.lottery.prizeCard.getTime',
        {},
      ) ??
      '獲得時間: {time}';
  @override
  String get expiryTime =>
      TranslationOverrides.string(
        _root.$meta,
        'home.lottery.prizeCard.expiryTime',
        {},
      ) ??
      '有效期至: {time}';
  @override
  String get statusExpired =>
      TranslationOverrides.string(
        _root.$meta,
        'home.lottery.prizeCard.statusExpired',
        {},
      ) ??
      '已過期';
}

/// The flat map containing all translations for locale <zh-TW>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsZhTw {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
      'about.title' =>
        TranslationOverrides.string(_root.$meta, 'about.title', {}) ?? '關於我們',
      'about.appBrand' =>
        TranslationOverrides.string(_root.$meta, 'about.appBrand', {}) ??
            '好小乖智能盒飯售賣機',
      'about.shareWithFriends' =>
        TranslationOverrides.string(
              _root.$meta,
              'about.shareWithFriends',
              {},
            ) ??
            '分享給朋友',
      'about.featuresTitle' =>
        TranslationOverrides.string(_root.$meta, 'about.featuresTitle', {}) ??
            '我們的特色',
      'about.feature1Title' =>
        TranslationOverrides.string(_root.$meta, 'about.feature1Title', {}) ??
            '中餐央廚',
      'about.feature1Desc' =>
        TranslationOverrides.string(_root.$meta, 'about.feature1Desc', {}) ??
            '售賣機為飲食生活带来的改變',
      'about.feature2Title' =>
        TranslationOverrides.string(_root.$meta, 'about.feature2Title', {}) ??
            '出餐迅速',
      'about.feature2Desc' =>
        TranslationOverrides.string(_root.$meta, 'about.feature2Desc', {}) ??
            '區別於傳統外賣和餐飲店的三維入口',
      'about.feature3Title' =>
        TranslationOverrides.string(_root.$meta, 'about.feature3Title', {}) ??
            '創業搭檔',
      'about.feature3Desc' =>
        TranslationOverrides.string(_root.$meta, 'about.feature3Desc', {}) ??
            '一個無風險的投資創業利器',
      'about.feature4Title' =>
        TranslationOverrides.string(_root.$meta, 'about.feature4Title', {}) ??
            '專利機器',
      'about.feature4Desc' =>
        TranslationOverrides.string(_root.$meta, 'about.feature4Desc', {}) ??
            '世上再無窮人的造富機',
      'about.policyTitle' =>
        TranslationOverrides.string(_root.$meta, 'about.policyTitle', {}) ??
            '政策條款',
      'about.userAgreementAndPrivacy' =>
        TranslationOverrides.string(
              _root.$meta,
              'about.userAgreementAndPrivacy',
              {},
            ) ??
            '用戶協議與隱私政策',
      'about.viewDetails' =>
        TranslationOverrides.string(_root.$meta, 'about.viewDetails', {}) ??
            '查看詳細條款',
      'about.contactTitle' =>
        TranslationOverrides.string(_root.$meta, 'about.contactTitle', {}) ??
            '聯繫我們',
      'about.customerServiceHotline' =>
        TranslationOverrides.string(
              _root.$meta,
              'about.customerServiceHotline',
              {},
            ) ??
            '客服熱線',
      'about.customerServiceNumber' =>
        TranslationOverrides.string(
              _root.$meta,
              'about.customerServiceNumber',
              {},
            ) ??
            '400-114-8818',
      'about.companyAddress' =>
        TranslationOverrides.string(_root.$meta, 'about.companyAddress', {}) ??
            '公司地址',
      'about.addressDetails' =>
        TranslationOverrides.string(_root.$meta, 'about.addressDetails', {}) ??
            '廣東省東莞市松山湖園區科匯路1號1棟1510室',
      'about.shareText' =>
        TranslationOverrides.string(_root.$meta, 'about.shareText', {}) ??
            '快來使用好小乖智能盒飯售卖機吧！',
      'auth.loginTitle' =>
        TranslationOverrides.string(_root.$meta, 'auth.loginTitle', {}) ??
            '歡迎回來',
      'auth.loginButton' =>
        TranslationOverrides.string(_root.$meta, 'auth.loginButton', {}) ??
            '登入',
      'auth.registerButton' =>
        TranslationOverrides.string(_root.$meta, 'auth.registerButton', {}) ??
            '註冊',
      'auth.forgotPassword' =>
        TranslationOverrides.string(_root.$meta, 'auth.forgotPassword', {}) ??
            '忘記密碼？',
      'auth.loginFailed' =>
        TranslationOverrides.string(_root.$meta, 'auth.loginFailed', {}) ??
            '登入失敗',
      'auth.loginSuccess' =>
        TranslationOverrides.string(_root.$meta, 'auth.loginSuccess', {}) ??
            '登入成功',
      'auth.registerTitle' =>
        TranslationOverrides.string(_root.$meta, 'auth.registerTitle', {}) ??
            '建立帳號',
      'auth.nickname' =>
        TranslationOverrides.string(_root.$meta, 'auth.nickname', {}) ?? '暱稱',
      'auth.registerSuccess' =>
        TranslationOverrides.string(_root.$meta, 'auth.registerSuccess', {}) ??
            '註冊成功',
      'auth.registerFailed' =>
        TranslationOverrides.string(_root.$meta, 'auth.registerFailed', {}) ??
            '註冊失敗',
      'auth.forgotPasswordTitle' =>
        TranslationOverrides.string(
              _root.$meta,
              'auth.forgotPasswordTitle',
              {},
            ) ??
            '重設密碼',
      'auth.sendResetLink' =>
        TranslationOverrides.string(_root.$meta, 'auth.sendResetLink', {}) ??
            '發送重設連結',
      'auth.resetLinkSent' =>
        TranslationOverrides.string(_root.$meta, 'auth.resetLinkSent', {}) ??
            '重設連結已發送',
      'auth.required' =>
        TranslationOverrides.string(_root.$meta, 'auth.required', {}) ?? '必填',
      'auth.enterUsername' =>
        TranslationOverrides.string(_root.$meta, 'auth.enterUsername', {}) ??
            '請輸入使用者名稱',
      'auth.enterPassword' =>
        TranslationOverrides.string(_root.$meta, 'auth.enterPassword', {}) ??
            '請輸入密碼',
      'auth.enterUsernameHint' =>
        TranslationOverrides.string(
              _root.$meta,
              'auth.enterUsernameHint',
              {},
            ) ??
            '請輸入使用者名稱或手機號碼',
      'auth.enterNickname' =>
        TranslationOverrides.string(_root.$meta, 'auth.enterNickname', {}) ??
            '請輸入暱稱',
      'auth.dontHaveAccount' =>
        TranslationOverrides.string(_root.$meta, 'auth.dontHaveAccount', {}) ??
            '還沒有帳號？',
      'auth.resetPasswordHint' =>
        TranslationOverrides.string(
              _root.$meta,
              'auth.resetPasswordHint',
              {},
            ) ??
            '請輸入您的使用者名稱或電子郵件來重設密碼',
      'auth.usernameOrEmail' =>
        TranslationOverrides.string(_root.$meta, 'auth.usernameOrEmail', {}) ??
            '使用者名稱 / 電子郵件',
      'auth.slogan' =>
        TranslationOverrides.string(_root.$meta, 'auth.slogan', {}) ??
            '便捷購買，美味隨行',
      'cart.title' =>
        TranslationOverrides.string(_root.$meta, 'cart.title', {}) ?? '購物車',
      'cart.clear' =>
        TranslationOverrides.string(_root.$meta, 'cart.clear', {}) ?? '清空',
      'cart.empty' =>
        TranslationOverrides.string(_root.$meta, 'cart.empty', {}) ?? '購物車是空的',
      'cart.total' =>
        TranslationOverrides.string(_root.$meta, 'cart.total', {}) ?? '合計',
      'cart.checkout' =>
        TranslationOverrides.string(_root.$meta, 'cart.checkout', {}) ?? '結算',
      'cart.goShopping' =>
        TranslationOverrides.string(_root.$meta, 'cart.goShopping', {}) ??
            '去逛逛',
      'city.title' =>
        TranslationOverrides.string(_root.$meta, 'city.title', {}) ?? '選擇城市',
      'city.search' =>
        TranslationOverrides.string(_root.$meta, 'city.search', {}) ?? '搜尋城市',
      'city.hot' =>
        TranslationOverrides.string(_root.$meta, 'city.hot', {}) ?? '熱門城市',
      'city.noResult' =>
        TranslationOverrides.string(_root.$meta, 'city.noResult', {}) ??
            '未找到相關城市',
      'city.viewAll' =>
        TranslationOverrides.string(_root.$meta, 'city.viewAll', {}) ??
            '查看所有城市',
      'city.switchSuccess' =>
        TranslationOverrides.string(_root.$meta, 'city.switchSuccess', {}) ??
            '城市已切換',
      'city.switchedTo' =>
        ({required Object name}) =>
            TranslationOverrides.string(_root.$meta, 'city.switchedTo', {
              'name': name,
            }) ??
            '已切換到 ${name}',
      'city.switchFailed' =>
        TranslationOverrides.string(_root.$meta, 'city.switchFailed', {}) ??
            '切換失敗',
      'city.saveFailed' =>
        TranslationOverrides.string(_root.$meta, 'city.saveFailed', {}) ??
            '無法儲存選擇的城市，請重試',
      'common.login' =>
        TranslationOverrides.string(_root.$meta, 'common.login', {}) ?? '登入',
      'common.register' =>
        TranslationOverrides.string(_root.$meta, 'common.register', {}) ?? '註冊',
      'common.username' =>
        TranslationOverrides.string(_root.$meta, 'common.username', {}) ??
            '使用者名稱',
      'common.password' =>
        TranslationOverrides.string(_root.$meta, 'common.password', {}) ?? '密碼',
      'common.confirm' =>
        TranslationOverrides.string(_root.$meta, 'common.confirm', {}) ?? '確認',
      'common.cancel' =>
        TranslationOverrides.string(_root.$meta, 'common.cancel', {}) ?? '取消',
      'common.error' =>
        TranslationOverrides.string(_root.$meta, 'common.error', {}) ?? '錯誤',
      'common.success' =>
        TranslationOverrides.string(_root.$meta, 'common.success', {}) ?? '成功',
      'common.loading' =>
        TranslationOverrides.string(_root.$meta, 'common.loading', {}) ??
            '載入中...',
      'common.ok' =>
        TranslationOverrides.string(_root.$meta, 'common.ok', {}) ?? '確定',
      'common.save' =>
        TranslationOverrides.string(_root.$meta, 'common.save', {}) ?? '儲存',
      'common.delete' =>
        TranslationOverrides.string(_root.$meta, 'common.delete', {}) ?? '刪除',
      'common.edit' =>
        TranslationOverrides.string(_root.$meta, 'common.edit', {}) ?? '編輯',
      'common.search' =>
        TranslationOverrides.string(_root.$meta, 'common.search', {}) ?? '搜尋',
      'common.noData' =>
        TranslationOverrides.string(_root.$meta, 'common.noData', {}) ?? '暫無數據',
      'common.retry' =>
        TranslationOverrides.string(_root.$meta, 'common.retry', {}) ?? '重試',
      'common.skip' =>
        TranslationOverrides.string(_root.$meta, 'common.skip', {}) ?? '跳過',
      'common.refresh' =>
        TranslationOverrides.string(_root.$meta, 'common.refresh', {}) ??
            '重新整理',
      'common.loadFailed' =>
        TranslationOverrides.string(_root.$meta, 'common.loadFailed', {}) ??
            '載入失敗',
      'common.unknownError' =>
        TranslationOverrides.string(_root.$meta, 'common.unknownError', {}) ??
            '未知錯誤',
      'common.developing' =>
        TranslationOverrides.string(_root.$meta, 'common.developing', {}) ??
            '頁面正在开发中',
      'common.appName' =>
        TranslationOverrides.string(_root.$meta, 'common.appName', {}) ??
            '飯盒售貨機',
      'common.logout' =>
        TranslationOverrides.string(_root.$meta, 'common.logout', {}) ?? '登出',
      'common.pullToRefresh' =>
        TranslationOverrides.string(_root.$meta, 'common.pullToRefresh', {}) ??
            '下拉重新整理',
      'common.releaseToRefresh' =>
        TranslationOverrides.string(
              _root.$meta,
              'common.releaseToRefresh',
              {},
            ) ??
            '釋放重新整理',
      'community.title' =>
        TranslationOverrides.string(_root.$meta, 'community.title', {}) ??
            '社群福利',
      'community.join' =>
        TranslationOverrides.string(_root.$meta, 'community.join', {}) ??
            '加入社群',
      'community.share' =>
        TranslationOverrides.string(_root.$meta, 'community.share', {}) ??
            '與美食愛好者一起分享美味',
      'community.org' =>
        TranslationOverrides.string(_root.$meta, 'community.org', {}) ??
            '東莞中科雲計算研究院',
      'community.dept' =>
        TranslationOverrides.string(_root.$meta, 'community.dept', {}) ??
            '雲計算中心',
      'community.scanHint' =>
        TranslationOverrides.string(_root.$meta, 'community.scanHint', {}) ??
            '掃碼加入東莞中科雲計算研究院',
      'community.features.coupon' =>
        TranslationOverrides.string(
              _root.$meta,
              'community.features.coupon',
              {},
            ) ??
            '專屬優惠券',
      'community.features.couponHint' =>
        TranslationOverrides.string(
              _root.$meta,
              'community.features.couponHint',
              {},
            ) ??
            '群內專享折扣，省錢又美味',
      'community.features.tasting' =>
        TranslationOverrides.string(
              _root.$meta,
              'community.features.tasting',
              {},
            ) ??
            '新品試吃',
      'community.features.tastingHint' =>
        TranslationOverrides.string(
              _root.$meta,
              'community.features.tastingHint',
              {},
            ) ??
            '第一時間品嚐最新美食',
      'community.features.exchange' =>
        TranslationOverrides.string(
              _root.$meta,
              'community.features.exchange',
              {},
            ) ??
            '美食交流',
      'community.features.exchangeHint' =>
        TranslationOverrides.string(
              _root.$meta,
              'community.features.exchangeHint',
              {},
            ) ??
            '與美食達人分享心得',
      'community.features.priority' =>
        TranslationOverrides.string(
              _root.$meta,
              'community.features.priority',
              {},
            ) ??
            '活動優先',
      'community.features.priorityHint' =>
        TranslationOverrides.string(
              _root.$meta,
              'community.features.priorityHint',
              {},
            ) ??
            '優先參與各種美食活動',
      'community.features.activity' =>
        TranslationOverrides.string(
              _root.$meta,
              'community.features.activity',
              {},
            ) ??
            '社群活動',
      'community.features.activityHint' =>
        TranslationOverrides.string(
              _root.$meta,
              'community.features.activityHint',
              {},
            ) ??
            '定期舉辦線下聚會',
      'community.features.topic' =>
        TranslationOverrides.string(
              _root.$meta,
              'community.features.topic',
              {},
            ) ??
            '話題討論',
      'community.features.topicHint' =>
        TranslationOverrides.string(
              _root.$meta,
              'community.features.topicHint',
              {},
            ) ??
            '參與話題贏取獎勵',
      'community.whyJoin' =>
        TranslationOverrides.string(_root.$meta, 'community.whyJoin', {}) ??
            '為什麼加入我們的社群？',
      'community.reason1' =>
        TranslationOverrides.string(_root.$meta, 'community.reason1', {}) ??
            '每日美食推薦，讓您不再糾結吃什麼',
      'community.reason2' =>
        TranslationOverrides.string(_root.$meta, 'community.reason2', {}) ??
            '限時優惠活動，省錢又省心',
      'community.reason3' =>
        TranslationOverrides.string(_root.$meta, 'community.reason3', {}) ??
            '專業美食測評，幫您避坑',
      'community.reason4' =>
        TranslationOverrides.string(_root.$meta, 'community.reason4', {}) ??
            '美食製作教程，在家也能做出美味',
      'coupon.title' =>
        TranslationOverrides.string(_root.$meta, 'coupon.title', {}) ?? '優惠券',
      'coupon.tabs.available' =>
        TranslationOverrides.string(_root.$meta, 'coupon.tabs.available', {}) ??
            '可領取',
      'coupon.tabs.received' =>
        TranslationOverrides.string(_root.$meta, 'coupon.tabs.received', {}) ??
            '已領取',
      'coupon.tabs.expired' =>
        TranslationOverrides.string(_root.$meta, 'coupon.tabs.expired', {}) ??
            '已過期',
      'coupon.tabs.canUse' =>
        TranslationOverrides.string(_root.$meta, 'coupon.tabs.canUse', {}) ??
            '可使用',
      'coupon.tabs.cannotUse' =>
        TranslationOverrides.string(_root.$meta, 'coupon.tabs.cannotUse', {}) ??
            '不可使用',
      'coupon.unit' =>
        TranslationOverrides.string(_root.$meta, 'coupon.unit', {}) ?? 'NT\$',
      'coupon.condition' =>
        ({required Object amount}) =>
            TranslationOverrides.string(_root.$meta, 'coupon.condition', {
              'amount': amount,
            }) ??
            '滿減券\n滿${amount}元可用',
      'coupon.conditionNoThreshold' =>
        TranslationOverrides.string(
              _root.$meta,
              'coupon.conditionNoThreshold',
              {},
            ) ??
            '滿減券\n滿0元可用',
      'coupon.validForever' =>
        TranslationOverrides.string(_root.$meta, 'coupon.validForever', {}) ??
            '長期有效',
      'coupon.btnReceive' =>
        TranslationOverrides.string(_root.$meta, 'coupon.btnReceive', {}) ??
            '立即領取',
      'coupon.btnReceived' =>
        TranslationOverrides.string(_root.$meta, 'coupon.btnReceived', {}) ??
            '已領取',
      'coupon.btnUse' =>
        TranslationOverrides.string(_root.$meta, 'coupon.btnUse', {}) ?? '去使用',
      'coupon.btnExpired' =>
        TranslationOverrides.string(_root.$meta, 'coupon.btnExpired', {}) ??
            '已過期',
      'coupon.discount' =>
        ({required Object amount}) =>
            TranslationOverrides.string(_root.$meta, 'coupon.discount', {
              'amount': amount,
            }) ??
            '${amount}元優惠券',
      'coupon.discountOff' =>
        ({required Object amount}) =>
            TranslationOverrides.string(_root.$meta, 'coupon.discountOff', {
              'amount': amount,
            }) ??
            '${amount}元減免券',
      'coupon.noCoupons' =>
        TranslationOverrides.string(_root.$meta, 'coupon.noCoupons', {}) ??
            '暫無優惠券',
      'coupon.expiryPrefix' =>
        TranslationOverrides.string(_root.$meta, 'coupon.expiryPrefix', {}) ??
            '有效期至：',
      'coupon.statusAvailable' =>
        TranslationOverrides.string(
              _root.$meta,
              'coupon.statusAvailable',
              {},
            ) ??
            '可用',
      'coupon.statusUnavailable' =>
        TranslationOverrides.string(
              _root.$meta,
              'coupon.statusUnavailable',
              {},
            ) ??
            '不可用',
      'device.title' =>
        TranslationOverrides.string(_root.$meta, 'device.title', {}) ?? '設備詳情',
      'device.info' =>
        TranslationOverrides.string(_root.$meta, 'device.info', {}) ?? '設備資訊',
      'device.address' =>
        TranslationOverrides.string(_root.$meta, 'device.address', {}) ?? '地址',
      'device.distance' =>
        TranslationOverrides.string(_root.$meta, 'device.distance', {}) ?? '距離',
      'device.status' =>
        TranslationOverrides.string(_root.$meta, 'device.status', {}) ?? '狀態',
      'device.online' =>
        TranslationOverrides.string(_root.$meta, 'device.online', {}) ?? '在線',
      'device.offline' =>
        TranslationOverrides.string(_root.$meta, 'device.offline', {}) ?? '離線',
      'device.paymentMethods' =>
        TranslationOverrides.string(_root.$meta, 'device.paymentMethods', {}) ??
            '支付方式：',
      'device.mobilePayment' =>
        TranslationOverrides.string(_root.$meta, 'device.mobilePayment', {}) ??
            '行動支付',
      'device.cash' =>
        TranslationOverrides.string(_root.$meta, 'device.cash', {}) ?? '現金',
      'device.noProducts' =>
        TranslationOverrides.string(_root.$meta, 'device.noProducts', {}) ??
            '暫無商品',
      'device.productList' =>
        TranslationOverrides.string(_root.$meta, 'device.productList', {}) ??
            '商品列表',
      'device.soldOut' =>
        TranslationOverrides.string(_root.$meta, 'device.soldOut', {}) ?? '已售罄',
      'device.reportIssue' =>
        TranslationOverrides.string(_root.$meta, 'device.reportIssue', {}) ??
            '上報故障',
      'device.reportDeviceIssue' =>
        TranslationOverrides.string(
              _root.$meta,
              'device.reportDeviceIssue',
              {},
            ) ??
            '上報設備故障',
      'device.reportIssueHint' =>
        TranslationOverrides.string(
              _root.$meta,
              'device.reportIssueHint',
              {},
            ) ??
            '請描述設備故障情況...',
      'device.reportSuccess' =>
        TranslationOverrides.string(_root.$meta, 'device.reportSuccess', {}) ??
            '故障上報成功',
      'device.loadFailed' =>
        ({required Object error}) =>
            TranslationOverrides.string(_root.$meta, 'device.loadFailed', {
              'error': error,
            }) ??
            '載入失敗: ${error}',
      'device.loadProductsFailed' =>
        ({required Object error}) =>
            TranslationOverrides.string(
              _root.$meta,
              'device.loadProductsFailed',
              {'error': error},
            ) ??
            '載入商品失敗: ${error}',
      'device.nearby' =>
        TranslationOverrides.string(_root.$meta, 'device.nearby', {}) ?? '附近設備',
      'device.sortByDistance' =>
        TranslationOverrides.string(_root.$meta, 'device.sortByDistance', {}) ??
            '按距離排序',
      'device.sortByName' =>
        TranslationOverrides.string(_root.$meta, 'device.sortByName', {}) ??
            '按名稱排序',
      'device.filterOnline' =>
        TranslationOverrides.string(_root.$meta, 'device.filterOnline', {}) ??
            '僅顯示在線設備',
      'device.noDevicesNearby' =>
        TranslationOverrides.string(
              _root.$meta,
              'device.noDevicesNearby',
              {},
            ) ??
            '附近暫無設備',
      'device.maintenance' =>
        TranslationOverrides.string(_root.$meta, 'device.maintenance', {}) ??
            '維護中',
      'device.unknown' =>
        TranslationOverrides.string(_root.$meta, 'device.unknown', {}) ?? '未知',
      'device.cashPayment' =>
        TranslationOverrides.string(_root.$meta, 'device.cashPayment', {}) ??
            '現金支付',
      'device_info.browser' =>
        TranslationOverrides.string(_root.$meta, 'device_info.browser', {}) ??
            '瀏覽器',
      'device_info.platform' =>
        TranslationOverrides.string(_root.$meta, 'device_info.platform', {}) ??
            '平台',
      'device_info.userAgent' =>
        TranslationOverrides.string(_root.$meta, 'device_info.userAgent', {}) ??
            'User Agent',
      'device_info.language' =>
        TranslationOverrides.string(_root.$meta, 'device_info.language', {}) ??
            '語言',
      'device_info.memory' =>
        TranslationOverrides.string(_root.$meta, 'device_info.memory', {}) ??
            '記憶體',
      'device_info.brand' =>
        TranslationOverrides.string(_root.$meta, 'device_info.brand', {}) ??
            '品牌',
      'device_info.model' =>
        TranslationOverrides.string(_root.$meta, 'device_info.model', {}) ??
            '型號',
      'device_info.systemVersion' =>
        TranslationOverrides.string(
              _root.$meta,
              'device_info.systemVersion',
              {},
            ) ??
            '系統版本',
      'device_info.sdkVersion' =>
        TranslationOverrides.string(
              _root.$meta,
              'device_info.sdkVersion',
              {},
            ) ??
            'SDK版本',
      'device_info.manufacturer' =>
        TranslationOverrides.string(
              _root.$meta,
              'device_info.manufacturer',
              {},
            ) ??
            '廠商',
      'device_info.hardware' =>
        TranslationOverrides.string(_root.$meta, 'device_info.hardware', {}) ??
            '硬體',
      'device_info.host' =>
        TranslationOverrides.string(_root.$meta, 'device_info.host', {}) ??
            '主機',
      'device_info.id' =>
        TranslationOverrides.string(_root.$meta, 'device_info.id', {}) ?? 'ID',
      'device_info.name' =>
        TranslationOverrides.string(_root.$meta, 'device_info.name', {}) ??
            '名稱',
      'device_info.systemName' =>
        TranslationOverrides.string(
              _root.$meta,
              'device_info.systemName',
              {},
            ) ??
            '系統名',
      'device_info.machine' =>
        TranslationOverrides.string(_root.$meta, 'device_info.machine', {}) ??
            '機器碼',
      'device_info.uniqueId' =>
        TranslationOverrides.string(_root.$meta, 'device_info.uniqueId', {}) ??
            '唯一ID',
      'feedback.title' =>
        TranslationOverrides.string(_root.$meta, 'feedback.title', {}) ??
            '問題反饋',
      'feedback.subtitle' =>
        TranslationOverrides.string(_root.$meta, 'feedback.subtitle', {}) ??
            '您的反饋是我們進步的動力',
      'feedback.selectType' =>
        TranslationOverrides.string(_root.$meta, 'feedback.selectType', {}) ??
            '選擇反饋類型',
      'feedback.errorReport' =>
        TranslationOverrides.string(_root.$meta, 'feedback.errorReport', {}) ??
            '錯誤報告',
      'feedback.suggestion' =>
        TranslationOverrides.string(_root.$meta, 'feedback.suggestion', {}) ??
            '建議',
      'feedback.complaint' =>
        TranslationOverrides.string(_root.$meta, 'feedback.complaint', {}) ??
            '投訴',
      'feedback.other' =>
        TranslationOverrides.string(_root.$meta, 'feedback.other', {}) ?? '其他',
      'feedback.description' =>
        TranslationOverrides.string(_root.$meta, 'feedback.description', {}) ??
            '問題描述',
      'feedback.titleHint' =>
        TranslationOverrides.string(_root.$meta, 'feedback.titleHint', {}) ??
            '請輸入問題標題 (必填)',
      'feedback.contentHint' =>
        TranslationOverrides.string(_root.$meta, 'feedback.contentHint', {}) ??
            '請詳細描述您遇到的問題或建議 (必填)',
      'feedback.uploadScreenshot' =>
        TranslationOverrides.string(
              _root.$meta,
              'feedback.uploadScreenshot',
              {},
            ) ??
            '上傳截圖 (可選)',
      'feedback.addImage' =>
        TranslationOverrides.string(_root.$meta, 'feedback.addImage', {}) ??
            '添加圖片',
      'feedback.uploadLimitHint' =>
        TranslationOverrides.string(
              _root.$meta,
              'feedback.uploadLimitHint',
              {},
            ) ??
            '最多可上傳3張圖片，每張不超過2MB，支持jpg、png格式',
      'feedback.contactOptional' =>
        TranslationOverrides.string(
              _root.$meta,
              'feedback.contactOptional',
              {},
            ) ??
            '聯繫方式 (可選)',
      'feedback.contactInputHint' =>
        TranslationOverrides.string(
              _root.$meta,
              'feedback.contactInputHint',
              {},
            ) ??
            '請輸入您的手機號或郵箱，方便我們聯繫您',
      'feedback.submit' =>
        TranslationOverrides.string(_root.$meta, 'feedback.submit', {}) ??
            '提交反饋',
      'feedback.submitSuccess' =>
        TranslationOverrides.string(
              _root.$meta,
              'feedback.submitSuccess',
              {},
            ) ??
            '反饋提交成功，感謝您的支持',
      'feedback.submitFailed' =>
        TranslationOverrides.string(_root.$meta, 'feedback.submitFailed', {}) ??
            '反饋提交失敗，請稍後重試',
      'help.title' =>
        TranslationOverrides.string(_root.$meta, 'help.title', {}) ?? '幫助中心',
      'help.developing' =>
        TranslationOverrides.string(_root.$meta, 'help.developing', {}) ??
            '幫助頁面正在開發中',
      'home.selectCity' =>
        TranslationOverrides.string(_root.$meta, 'home.selectCity', {}) ??
            '選擇城市',
      'home.nearbyDevices' =>
        TranslationOverrides.string(_root.$meta, 'home.nearbyDevices', {}) ??
            '附近設備',
      'home.banner1Title' =>
        TranslationOverrides.string(_root.$meta, 'home.banner1Title', {}) ??
            '便捷購買',
      'home.banner1Subtitle' =>
        TranslationOverrides.string(_root.$meta, 'home.banner1Subtitle', {}) ??
            '美味隨行',
      'home.banner2Title' =>
        TranslationOverrides.string(_root.$meta, 'home.banner2Title', {}) ??
            '新鮮速遞',
      'home.banner2Subtitle' =>
        TranslationOverrides.string(_root.$meta, 'home.banner2Subtitle', {}) ??
            '每日更新',
      'home.banner3Title' =>
        TranslationOverrides.string(_root.$meta, 'home.banner3Title', {}) ??
            '超值優惠',
      'home.banner3Subtitle' =>
        TranslationOverrides.string(_root.$meta, 'home.banner3Subtitle', {}) ??
            '限時特價',
      'home.noDevices' =>
        TranslationOverrides.string(_root.$meta, 'home.noDevices', {}) ??
            '附近暫無設備',
      'home.welcome' =>
        TranslationOverrides.string(_root.$meta, 'home.welcome', {}) ??
            '您好，好小乖用戶',
      'home.selfPickup' =>
        TranslationOverrides.string(_root.$meta, 'home.selfPickup', {}) ??
            '自取點餐',
      'home.selfPickupHint' =>
        TranslationOverrides.string(_root.$meta, 'home.selfPickupHint', {}) ??
            '掃碼取餐/打包帶走',
      'home.teamOrder' =>
        TranslationOverrides.string(_root.$meta, 'home.teamOrder', {}) ??
            '團隊點餐',
      'home.teamOrderHint' =>
        TranslationOverrides.string(_root.$meta, 'home.teamOrderHint', {}) ??
            '多人訂購/團隊點餐',
      'home.invite' =>
        TranslationOverrides.string(_root.$meta, 'home.invite', {}) ?? '邀請有禮',
      'home.inviteHint' =>
        TranslationOverrides.string(_root.$meta, 'home.inviteHint', {}) ??
            '邀請好友得現金',
      'home.recommendTitle' =>
        TranslationOverrides.string(_root.$meta, 'home.recommendTitle', {}) ??
            '為我推薦',
      'home.grid.welfare' =>
        TranslationOverrides.string(_root.$meta, 'home.grid.welfare', {}) ??
            '社群福利',
      'home.grid.service' =>
        TranslationOverrides.string(_root.$meta, 'home.grid.service', {}) ??
            '客服中心',
      'home.grid.coupon' =>
        TranslationOverrides.string(_root.$meta, 'home.grid.coupon', {}) ??
            '領優惠券',
      'home.grid.lottery' =>
        TranslationOverrides.string(_root.$meta, 'home.grid.lottery', {}) ??
            '幸運抽獎',
      'home.grid.invite' =>
        TranslationOverrides.string(_root.$meta, 'home.grid.invite', {}) ??
            '邀請好友',
      'home.lottery.title' =>
        TranslationOverrides.string(_root.$meta, 'home.lottery.title', {}) ??
            '幸運抽獎',
      'home.lottery.prizes' =>
        TranslationOverrides.string(_root.$meta, 'home.lottery.prizes', {}) ??
            '我的獎品',
      'home.lottery.rules' =>
        TranslationOverrides.string(_root.$meta, 'home.lottery.rules', {}) ??
            '抽獎規則',
      'home.lottery.remaining' =>
        TranslationOverrides.string(
              _root.$meta,
              'home.lottery.remaining',
              {},
            ) ??
            '剩餘次數: {count}',
      'home.lottery.spin' =>
        TranslationOverrides.string(_root.$meta, 'home.lottery.spin', {}) ??
            '抽獎',
      'home.lottery.rule1' =>
        TranslationOverrides.string(_root.$meta, 'home.lottery.rule1', {}) ??
            '每日有免費抽獎次數，次數用完後可領取任務獲得',
      'home.lottery.rule2' =>
        TranslationOverrides.string(_root.$meta, 'home.lottery.rule2', {}) ??
            '優惠券48小時內有效，乖乖幣自動到帳',
      'home.lottery.rule3' =>
        TranslationOverrides.string(_root.$meta, 'home.lottery.rule3', {}) ??
            '活動最終解釋權歸平台所有',
      'home.lottery.prizeUnit' =>
        TranslationOverrides.string(
              _root.$meta,
              'home.lottery.prizeUnit',
              {},
            ) ??
            '乖乖幣',
      'home.lottery.prizeList' =>
        TranslationOverrides.string(
              _root.$meta,
              'home.lottery.prizeList',
              {},
            ) ??
            '獎品說明',
      'home.lottery.back' =>
        TranslationOverrides.string(_root.$meta, 'home.lottery.back', {}) ??
            '返回',
      'home.lottery.prizeStats.total' =>
        TranslationOverrides.string(
              _root.$meta,
              'home.lottery.prizeStats.total',
              {},
            ) ??
            '總獎品',
      'home.lottery.prizeStats.used' =>
        TranslationOverrides.string(
              _root.$meta,
              'home.lottery.prizeStats.used',
              {},
            ) ??
            '已使用',
      'home.lottery.prizeStats.available' =>
        TranslationOverrides.string(
              _root.$meta,
              'home.lottery.prizeStats.available',
              {},
            ) ??
            '可用',
      'home.lottery.tabs.all' =>
        TranslationOverrides.string(_root.$meta, 'home.lottery.tabs.all', {}) ??
            '全部',
      'home.lottery.tabs.available' =>
        TranslationOverrides.string(
              _root.$meta,
              'home.lottery.tabs.available',
              {},
            ) ??
            '可用',
      'home.lottery.tabs.used' =>
        TranslationOverrides.string(
              _root.$meta,
              'home.lottery.tabs.used',
              {},
            ) ??
            '已使用',
      'home.lottery.tabs.expired' =>
        TranslationOverrides.string(
              _root.$meta,
              'home.lottery.tabs.expired',
              {},
            ) ??
            '已過期',
      'home.lottery.prizeCard.source' =>
        TranslationOverrides.string(
              _root.$meta,
              'home.lottery.prizeCard.source',
              {},
            ) ??
            '乖乖幣獎勵，可在乖乖幣商城使用',
      'home.lottery.prizeCard.getTime' =>
        TranslationOverrides.string(
              _root.$meta,
              'home.lottery.prizeCard.getTime',
              {},
            ) ??
            '獲得時間: {time}',
      'home.lottery.prizeCard.expiryTime' =>
        TranslationOverrides.string(
              _root.$meta,
              'home.lottery.prizeCard.expiryTime',
              {},
            ) ??
            '有效期至: {time}',
      'home.lottery.prizeCard.statusExpired' =>
        TranslationOverrides.string(
              _root.$meta,
              'home.lottery.prizeCard.statusExpired',
              {},
            ) ??
            '已過期',
      'home.status.open' =>
        TranslationOverrides.string(_root.$meta, 'home.status.open', {}) ??
            '營業中',
      'home.status.closed' =>
        TranslationOverrides.string(_root.$meta, 'home.status.closed', {}) ??
            '休息中',
      'home.status.mobilePayment' =>
        TranslationOverrides.string(
              _root.$meta,
              'home.status.mobilePayment',
              {},
            ) ??
            '支援行動支付',
      'navigation.home' =>
        TranslationOverrides.string(_root.$meta, 'navigation.home', {}) ?? '首頁',
      'navigation.device' =>
        TranslationOverrides.string(_root.$meta, 'navigation.device', {}) ??
            '設備',
      'navigation.orders' =>
        TranslationOverrides.string(_root.$meta, 'navigation.orders', {}) ??
            '訂單',
      'navigation.profile' =>
        TranslationOverrides.string(_root.$meta, 'navigation.profile', {}) ??
            '個人中心',
      'onboarding.welcomeTitle' =>
        TranslationOverrides.string(
              _root.$meta,
              'onboarding.welcomeTitle',
              {},
            ) ??
            '歡迎使用飯盒售货機',
      'onboarding.welcomeBody' =>
        TranslationOverrides.string(
              _root.$meta,
              'onboarding.welcomeBody',
              {},
            ) ??
            '隨時隨地，輕鬆購買美味午餐',
      'onboarding.findDevicesTitle' =>
        TranslationOverrides.string(
              _root.$meta,
              'onboarding.findDevicesTitle',
              {},
            ) ??
            '查找附近設備',
      'onboarding.findDevicesBody' =>
        TranslationOverrides.string(
              _root.$meta,
              'onboarding.findDevicesBody',
              {},
            ) ??
            '快速定位最近的售貨機，節省您的時間',
      'onboarding.paymentTitle' =>
        TranslationOverrides.string(
              _root.$meta,
              'onboarding.paymentTitle',
              {},
            ) ??
            '便捷支付',
      'onboarding.paymentBody' =>
        TranslationOverrides.string(
              _root.$meta,
              'onboarding.paymentBody',
              {},
            ) ??
            '支援信用卡等多種便捷支付方式',
      'onboarding.getStarted' =>
        TranslationOverrides.string(_root.$meta, 'onboarding.getStarted', {}) ??
            '開始使用',
      'order.myOrders' =>
        TranslationOverrides.string(_root.$meta, 'order.myOrders', {}) ??
            '我的訂單',
      'order.noOrders' =>
        TranslationOverrides.string(_root.$meta, 'order.noOrders', {}) ??
            '暫無訂單',
      'order.detail' =>
        TranslationOverrides.string(_root.$meta, 'order.detail', {}) ?? '訂單詳情',
      'order.status.all' =>
        TranslationOverrides.string(_root.$meta, 'order.status.all', {}) ??
            '全部',
      'order.status.pending' =>
        TranslationOverrides.string(_root.$meta, 'order.status.pending', {}) ??
            '待支付',
      'order.status.paid' =>
        TranslationOverrides.string(_root.$meta, 'order.status.paid', {}) ??
            '已支付',
      'order.status.completed' =>
        TranslationOverrides.string(
              _root.$meta,
              'order.status.completed',
              {},
            ) ??
            '已完成',
      'order.status.cancelled' =>
        TranslationOverrides.string(
              _root.$meta,
              'order.status.cancelled',
              {},
            ) ??
            '已取消',
      'order.status.refunded' =>
        TranslationOverrides.string(_root.$meta, 'order.status.refunded', {}) ??
            '已退款',
      'order.status.failed' =>
        TranslationOverrides.string(_root.$meta, 'order.status.failed', {}) ??
            '支付失敗',
      'order.pickupCode' =>
        TranslationOverrides.string(_root.$meta, 'order.pickupCode', {}) ??
            '取貨碼',
      'order.pickupHint' =>
        TranslationOverrides.string(_root.$meta, 'order.pickupHint', {}) ??
            '請在設備上輸入取貨碼取貨',
      'order.items' =>
        TranslationOverrides.string(_root.$meta, 'order.items', {}) ?? '商品清單',
      'order.info' =>
        TranslationOverrides.string(_root.$meta, 'order.info', {}) ?? '訂單資訊',
      'order.id' =>
        TranslationOverrides.string(_root.$meta, 'order.id', {}) ?? '訂單號',
      'order.createdAt' =>
        TranslationOverrides.string(_root.$meta, 'order.createdAt', {}) ??
            '建立時間',
      'order.paidAt' =>
        TranslationOverrides.string(_root.$meta, 'order.paidAt', {}) ?? '支付時間',
      'order.paymentMethod' =>
        TranslationOverrides.string(_root.$meta, 'order.paymentMethod', {}) ??
            '支付方式',
      'order.totalAmount' =>
        TranslationOverrides.string(_root.$meta, 'order.totalAmount', {}) ??
            '訂單總額',
      'order.unknown' =>
        TranslationOverrides.string(_root.$meta, 'order.unknown', {}) ?? '未知',
      'order.refresh' =>
        TranslationOverrides.string(_root.$meta, 'order.refresh', {}) ?? '重新整理',
      'order.itemsCount' =>
        ({required Object count}) =>
            TranslationOverrides.string(_root.$meta, 'order.itemsCount', {
              'count': count,
            }) ??
            '等${count}件商品',
      'order.orderIdLabel' =>
        TranslationOverrides.string(_root.$meta, 'order.orderIdLabel', {}) ??
            '訂單號：',
      'order.orderAmount' =>
        TranslationOverrides.string(_root.$meta, 'order.orderAmount', {}) ??
            '訂單金額',
      'order.cancelOrder' =>
        TranslationOverrides.string(_root.$meta, 'order.cancelOrder', {}) ??
            '取消訂單',
      'order.payNow' =>
        TranslationOverrides.string(_root.$meta, 'order.payNow', {}) ?? '去支付',
      'order.viewDetail' =>
        TranslationOverrides.string(_root.$meta, 'order.viewDetail', {}) ??
            '查看詳情',
      'order.cancelConfirmTitle' =>
        TranslationOverrides.string(
              _root.$meta,
              'order.cancelConfirmTitle',
              {},
            ) ??
            '確認取消',
      'order.cancelConfirmContent' =>
        TranslationOverrides.string(
              _root.$meta,
              'order.cancelConfirmContent',
              {},
            ) ??
            '確定要取消這個訂單嗎？',
      'order.orderCancelled' =>
        TranslationOverrides.string(_root.$meta, 'order.orderCancelled', {}) ??
            '訂單已取消',
      'order.confirmOrder' =>
        TranslationOverrides.string(_root.$meta, 'order.confirmOrder', {}) ??
            '確認訂單',
      'order.actualAmount' =>
        TranslationOverrides.string(_root.$meta, 'order.actualAmount', {}) ??
            '實付金額',
      'order.totalLabel' =>
        TranslationOverrides.string(_root.$meta, 'order.totalLabel', {}) ??
            '合計: ',
      'order.submitOrder' =>
        TranslationOverrides.string(_root.$meta, 'order.submitOrder', {}) ??
            '提交訂單',
      'order.createFailed' =>
        ({required Object error}) =>
            TranslationOverrides.string(_root.$meta, 'order.createFailed', {
              'error': error,
            }) ??
            '建立訂單失敗: ${error}',
      'partner.title' =>
        TranslationOverrides.string(_root.$meta, 'partner.title', {}) ??
            '合作商加盟',
      'partner.subtitle' =>
        TranslationOverrides.string(_root.$meta, 'partner.subtitle', {}) ??
            '攜手共創美好未來',
      'partner.advantages' =>
        TranslationOverrides.string(_root.$meta, 'partner.advantages', {}) ??
            '合作優勢',
      'partner.advantage1Title' =>
        TranslationOverrides.string(
              _root.$meta,
              'partner.advantage1Title',
              {},
            ) ??
            '豐厚收益',
      'partner.advantage1Desc' =>
        TranslationOverrides.string(
              _root.$meta,
              'partner.advantage1Desc',
              {},
            ) ??
            '提供有競爭力的分成比例，讓您的投入獲得豐厚回報',
      'partner.advantage2Title' =>
        TranslationOverrides.string(
              _root.$meta,
              'partner.advantage2Title',
              {},
            ) ??
            '品牌支持',
      'partner.advantage2Desc' =>
        TranslationOverrides.string(
              _root.$meta,
              'partner.advantage2Desc',
              {},
            ) ??
            '共享知名品牌資源，享受品牌效應帶來的客戶信任',
      'partner.advantage3Title' =>
        TranslationOverrides.string(
              _root.$meta,
              'partner.advantage3Title',
              {},
            ) ??
            '市場推廣',
      'partner.advantage3Desc' =>
        TranslationOverrides.string(
              _root.$meta,
              'partner.advantage3Desc',
              {},
            ) ??
            '專業的市場推廣團隊，為您提供全方位的營銷支持',
      'partner.advantage4Title' =>
        TranslationOverrides.string(
              _root.$meta,
              'partner.advantage4Title',
              {},
            ) ??
            '培訓支持',
      'partner.advantage4Desc' =>
        TranslationOverrides.string(
              _root.$meta,
              'partner.advantage4Desc',
              {},
            ) ??
            '提供專業的培訓課程，幫助您快速掌握經營技巧',
      'partner.process' =>
        TranslationOverrides.string(_root.$meta, 'partner.process', {}) ??
            '合作流程',
      'partner.process1Title' =>
        TranslationOverrides.string(_root.$meta, 'partner.process1Title', {}) ??
            '提交申請',
      'partner.process1Desc' =>
        TranslationOverrides.string(_root.$meta, 'partner.process1Desc', {}) ??
            '填寫合作申請表，提交相關資料',
      'partner.process2Title' =>
        TranslationOverrides.string(_root.$meta, 'partner.process2Title', {}) ??
            '資質審核',
      'partner.process2Desc' =>
        TranslationOverrides.string(_root.$meta, 'partner.process2Desc', {}) ??
            '我們將在3-5個工作日內完成資質審核',
      'partner.process3Title' =>
        TranslationOverrides.string(_root.$meta, 'partner.process3Title', {}) ??
            '面談溝通',
      'partner.process3Desc' =>
        TranslationOverrides.string(_root.$meta, 'partner.process3Desc', {}) ??
            '安排面談，詳細了解合作細節',
      'partner.process4Title' =>
        TranslationOverrides.string(_root.$meta, 'partner.process4Title', {}) ??
            '簽署協議',
      'partner.process4Desc' =>
        TranslationOverrides.string(_root.$meta, 'partner.process4Desc', {}) ??
            '雙方達成一致後簽署正式合作協議',
      'partner.process5Title' =>
        TranslationOverrides.string(_root.$meta, 'partner.process5Title', {}) ??
            '開始合作',
      'partner.process5Desc' =>
        TranslationOverrides.string(_root.$meta, 'partner.process5Desc', {}) ??
            '正式啟動合作，享受各項支持服務',
      'partner.conditions' =>
        TranslationOverrides.string(_root.$meta, 'partner.conditions', {}) ??
            '合作條件',
      'partner.condition1' =>
        TranslationOverrides.string(_root.$meta, 'partner.condition1', {}) ??
            '具有合法的經營資質',
      'partner.condition2' =>
        TranslationOverrides.string(_root.$meta, 'partner.condition2', {}) ??
            '有一定的資金實力和經營能力',
      'partner.condition3' =>
        TranslationOverrides.string(_root.$meta, 'partner.condition3', {}) ??
            '認同我們的品牌理念和經營模式',
      'partner.condition4' =>
        TranslationOverrides.string(_root.$meta, 'partner.condition4', {}) ??
            '具備良好的商業信譽',
      'partner.condition5' =>
        TranslationOverrides.string(_root.$meta, 'partner.condition5', {}) ??
            '有相關行業經驗者優先',
      'partner.applicationTitle' =>
        TranslationOverrides.string(
              _root.$meta,
              'partner.applicationTitle',
              {},
            ) ??
            '申請合作',
      'partner.nameLabel' =>
        TranslationOverrides.string(_root.$meta, 'partner.nameLabel', {}) ??
            '姓名',
      'partner.nameInputHint' =>
        TranslationOverrides.string(_root.$meta, 'partner.nameInputHint', {}) ??
            '請輸入您的姓名',
      'partner.companyLabel' =>
        TranslationOverrides.string(_root.$meta, 'partner.companyLabel', {}) ??
            '公司名稱',
      'partner.companyInputHint' =>
        TranslationOverrides.string(
              _root.$meta,
              'partner.companyInputHint',
              {},
            ) ??
            '請輸入公司名稱',
      'partner.phoneLabel' =>
        TranslationOverrides.string(_root.$meta, 'partner.phoneLabel', {}) ??
            '聯繫電話',
      'partner.phoneInputHint' =>
        TranslationOverrides.string(
              _root.$meta,
              'partner.phoneInputHint',
              {},
            ) ??
            '請輸入聯繫電話',
      'partner.intentionLabel' =>
        TranslationOverrides.string(
              _root.$meta,
              'partner.intentionLabel',
              {},
            ) ??
            '合作意向',
      'partner.intentionInputHint' =>
        TranslationOverrides.string(
              _root.$meta,
              'partner.intentionInputHint',
              {},
            ) ??
            '請簡述您的合作意向',
      'partner.submit' =>
        TranslationOverrides.string(_root.$meta, 'partner.submit', {}) ??
            '提交申請',
      'partner.submitSuccess' =>
        TranslationOverrides.string(_root.$meta, 'partner.submitSuccess', {}) ??
            '申請提交成功，我們會盡快聯繫您',
      'partner.submitFailed' =>
        TranslationOverrides.string(_root.$meta, 'partner.submitFailed', {}) ??
            '申請提交失敗，請稍後重試',
      'partner.incompleteInfo' =>
        TranslationOverrides.string(
              _root.$meta,
              'partner.incompleteInfo',
              {},
            ) ??
            '請填寫完整信息',
      'partner.contactTitle' =>
        TranslationOverrides.string(_root.$meta, 'partner.contactTitle', {}) ??
            '聯繫我們',
      'partner.serviceHotline' =>
        TranslationOverrides.string(
              _root.$meta,
              'partner.serviceHotline',
              {},
            ) ??
            '客服熱線',
      'partner.address' =>
        TranslationOverrides.string(_root.$meta, 'partner.address', {}) ?? '地址',
      'partner.errorOccurred' =>
        ({required Object error}) =>
            TranslationOverrides.string(_root.$meta, 'partner.errorOccurred', {
              'error': error,
            }) ??
            '發生錯誤: ${error}',
      'payment.checkout' =>
        TranslationOverrides.string(_root.$meta, 'payment.checkout', {}) ??
            '收銀台',
      'payment.success' =>
        TranslationOverrides.string(_root.$meta, 'payment.success', {}) ??
            '支付成功',
      'payment.orderNotFound' =>
        TranslationOverrides.string(_root.$meta, 'payment.orderNotFound', {}) ??
            '訂單資訊不存在',
      'payment.payNow' =>
        TranslationOverrides.string(_root.$meta, 'payment.payNow', {}) ??
            '立即支付',
      'payment.initializing' =>
        TranslationOverrides.string(_root.$meta, 'payment.initializing', {}) ??
            '正在初始化支付組件...',
      'payment.cancelTitle' =>
        TranslationOverrides.string(_root.$meta, 'payment.cancelTitle', {}) ??
            '取消支付',
      'payment.cancelContent' =>
        TranslationOverrides.string(_root.$meta, 'payment.cancelContent', {}) ??
            '確定要取消支付嗎？訂單將被取消',
      'payment.continuePay' =>
        TranslationOverrides.string(_root.$meta, 'payment.continuePay', {}) ??
            '繼續支付',
      'payment.cancelPay' =>
        TranslationOverrides.string(_root.$meta, 'payment.cancelPay', {}) ??
            '取消支付',
      'payment.amount' =>
        TranslationOverrides.string(_root.$meta, 'payment.amount', {}) ??
            '支付金額',
      'payment.remainingTime' =>
        TranslationOverrides.string(_root.$meta, 'payment.remainingTime', {}) ??
            '支付剩餘時間',
      'points.title' =>
        TranslationOverrides.string(_root.$meta, 'points.title', {}) ?? '我的乖乖幣',
      'points.unit' =>
        TranslationOverrides.string(_root.$meta, 'points.unit', {}) ?? '乖乖幣',
      'points.mall' =>
        TranslationOverrides.string(_root.$meta, 'points.mall', {}) ?? '乖乖幣商城',
      'points.goExchange' =>
        TranslationOverrides.string(_root.$meta, 'points.goExchange', {}) ??
            '去兌換',
      'points.rules' =>
        TranslationOverrides.string(_root.$meta, 'points.rules', {}) ?? '乖乖幣規則',
      'points.rule1' =>
        TranslationOverrides.string(_root.$meta, 'points.rule1', {}) ??
            '乖乖幣永久有效',
      'points.rule2' =>
        TranslationOverrides.string(_root.$meta, 'points.rule2', {}) ??
            '抽獎可獲得額外乖乖幣',
      'points.records' =>
        TranslationOverrides.string(_root.$meta, 'points.records', {}) ??
            '乖乖幣記錄',
      'points.all' =>
        TranslationOverrides.string(_root.$meta, 'points.all', {}) ?? '全部',
      'points.earned' =>
        TranslationOverrides.string(_root.$meta, 'points.earned', {}) ?? '獲得',
      'points.used' =>
        TranslationOverrides.string(_root.$meta, 'points.used', {}) ?? '使用',
      'points.noRecords' =>
        TranslationOverrides.string(_root.$meta, 'points.noRecords', {}) ??
            '暫無乖乖幣記錄',
      'points.back' =>
        TranslationOverrides.string(_root.$meta, 'points.back', {}) ?? '返回',
      'points.goLottery' =>
        TranslationOverrides.string(_root.$meta, 'points.goLottery', {}) ??
            '去抽獎',
      'points.balance' =>
        TranslationOverrides.string(_root.$meta, 'points.balance', {}) ?? '餘額',
      'points.coupon' =>
        TranslationOverrides.string(_root.$meta, 'points.coupon', {}) ?? '優惠券',
      'points.noMoreProducts' =>
        TranslationOverrides.string(_root.$meta, 'points.noMoreProducts', {}) ??
            '沒有更多商品了',
      'points.myPoints' =>
        ({required Object points}) =>
            TranslationOverrides.string(_root.$meta, 'points.myPoints', {
              'points': points,
            }) ??
            '我的乖乖幣: ${points}',
      'points.noProducts' =>
        TranslationOverrides.string(_root.$meta, 'points.noProducts', {}) ??
            '暫無商品',
      'points.cost' =>
        ({required Object points}) =>
            TranslationOverrides.string(_root.$meta, 'points.cost', {
              'points': points,
            }) ??
            '${points} 乖乖幣',
      'points.exchangeNow' =>
        TranslationOverrides.string(_root.$meta, 'points.exchangeNow', {}) ??
            '立即兌換',
      'points.insufficientPoints' =>
        TranslationOverrides.string(
              _root.$meta,
              'points.insufficientPoints',
              {},
            ) ??
            '餘額不足',
      'product.title' =>
        TranslationOverrides.string(_root.$meta, 'product.title', {}) ?? '商品列表',
      'product.detail' =>
        TranslationOverrides.string(_root.$meta, 'product.detail', {}) ??
            '商品詳情',
      'product.hot' =>
        TranslationOverrides.string(_root.$meta, 'product.hot', {}) ?? '熱銷',
      'product.promotion' =>
        TranslationOverrides.string(_root.$meta, 'product.promotion', {}) ??
            '促銷',
      'product.discountOff' =>
        ({required Object percent}) =>
            TranslationOverrides.string(_root.$meta, 'product.discountOff', {
              'percent': percent,
            }) ??
            '${percent}% OFF',
      'product.stockFull' =>
        TranslationOverrides.string(_root.$meta, 'product.stockFull', {}) ??
            '庫存充足',
      'product.stockEmpty' =>
        TranslationOverrides.string(_root.$meta, 'product.stockEmpty', {}) ??
            '暫時缺貨',
      'product.addToCart' =>
        TranslationOverrides.string(_root.$meta, 'product.addToCart', {}) ??
            '加入購物車',
      'product.addedToCart' =>
        TranslationOverrides.string(_root.$meta, 'product.addedToCart', {}) ??
            '已加入購物車',
      'product.specifications' =>
        TranslationOverrides.string(
              _root.$meta,
              'product.specifications',
              {},
            ) ??
            '規格參數',
      'product.categoryAll' =>
        TranslationOverrides.string(_root.$meta, 'product.categoryAll', {}) ??
            '全部',
      'product.categoryFood' =>
        TranslationOverrides.string(_root.$meta, 'product.categoryFood', {}) ??
            '食品',
      'product.categoryDrink' =>
        TranslationOverrides.string(_root.$meta, 'product.categoryDrink', {}) ??
            '飲料',
      'product.categorySnack' =>
        TranslationOverrides.string(_root.$meta, 'product.categorySnack', {}) ??
            '零食',
      'product.sortDefault' =>
        TranslationOverrides.string(_root.$meta, 'product.sortDefault', {}) ??
            '預設排序',
      'product.sortPriceAsc' =>
        TranslationOverrides.string(_root.$meta, 'product.sortPriceAsc', {}) ??
            '價格從低到高',
      'product.sortPriceDesc' =>
        TranslationOverrides.string(_root.$meta, 'product.sortPriceDesc', {}) ??
            '價格從高到低',
      'product.sortName' =>
        TranslationOverrides.string(_root.$meta, 'product.sortName', {}) ??
            '按名稱排序',
      'product.filterOnlyAvailable' =>
        TranslationOverrides.string(
              _root.$meta,
              'product.filterOnlyAvailable',
              {},
            ) ??
            '僅顯示可用商品',
      'product.cart' =>
        TranslationOverrides.string(_root.$meta, 'product.cart', {}) ?? '購物車',
      'profile.title' =>
        TranslationOverrides.string(_root.$meta, 'profile.title', {}) ?? '用戶中心',
      'profile.notLoggedIn' =>
        TranslationOverrides.string(_root.$meta, 'profile.notLoggedIn', {}) ??
            '未登入',
      'profile.editProfile' =>
        TranslationOverrides.string(_root.$meta, 'profile.editProfile', {}) ??
            '編輯資料',
      'profile.logout' =>
        TranslationOverrides.string(_root.$meta, 'profile.logout', {}) ?? '登出',
      'profile.favoriteDevices' =>
        TranslationOverrides.string(
              _root.$meta,
              'profile.favoriteDevices',
              {},
            ) ??
            '收藏設備',
      'profile.personalInfo' =>
        TranslationOverrides.string(_root.$meta, 'profile.personalInfo', {}) ??
            '個人資訊',
      'profile.confirmLogout' =>
        TranslationOverrides.string(_root.$meta, 'profile.confirmLogout', {}) ??
            '確認登出',
      'profile.confirmLogoutContent' =>
        TranslationOverrides.string(
              _root.$meta,
              'profile.confirmLogoutContent',
              {},
            ) ??
            '確定要登出嗎？',
      'profile.clearCacheConfirm' =>
        TranslationOverrides.string(
              _root.$meta,
              'profile.clearCacheConfirm',
              {},
            ) ??
            '確定要清除所有快取數據嗎？',
      'profile.noFavoriteDevices' =>
        TranslationOverrides.string(
              _root.$meta,
              'profile.noFavoriteDevices',
              {},
            ) ??
            '暫無收藏設備',
      'profile.removeFavorite' =>
        TranslationOverrides.string(
              _root.$meta,
              'profile.removeFavorite',
              {},
            ) ??
            '取消收藏',
      'profile.removeFavoriteConfirm' =>
        ({required Object name}) =>
            TranslationOverrides.string(
              _root.$meta,
              'profile.removeFavoriteConfirm',
              {'name': name},
            ) ??
            '確定要取消收藏"${name}"嗎？',
      'profile.appDescription' =>
        TranslationOverrides.string(
              _root.$meta,
              'profile.appDescription',
              {},
            ) ??
            '一個便捷的自動售貨機購買應用',
      'profile.version' =>
        ({required Object version}) =>
            TranslationOverrides.string(_root.$meta, 'profile.version', {
              'version': version,
            }) ??
            '版本：${version}',
      'profile.wallet' =>
        TranslationOverrides.string(_root.$meta, 'profile.wallet', {}) ??
            '我的錢包',
      'profile.coupon' =>
        TranslationOverrides.string(_root.$meta, 'profile.coupon', {}) ?? '優惠券',
      'profile.feedback' =>
        TranslationOverrides.string(_root.$meta, 'profile.feedback', {}) ??
            '問題反饋',
      'profile.cooperation' =>
        TranslationOverrides.string(_root.$meta, 'profile.cooperation', {}) ??
            '合作商加盟',
      'profile.about' =>
        TranslationOverrides.string(_root.$meta, 'profile.about', {}) ?? '關於我們',
      'profile.settings' =>
        TranslationOverrides.string(_root.$meta, 'profile.settings', {}) ??
            '設置',
      'profile.gender.male' =>
        TranslationOverrides.string(_root.$meta, 'profile.gender.male', {}) ??
            '男',
      'profile.gender.female' =>
        TranslationOverrides.string(_root.$meta, 'profile.gender.female', {}) ??
            '女',
      'profile.gender.unknown' =>
        TranslationOverrides.string(
              _root.$meta,
              'profile.gender.unknown',
              {},
            ) ??
            '保密',
      'profile.info.basic' =>
        TranslationOverrides.string(_root.$meta, 'profile.info.basic', {}) ??
            '基本信息',
      'profile.info.other' =>
        TranslationOverrides.string(_root.$meta, 'profile.info.other', {}) ??
            '其他信息',
      'profile.info.phone' =>
        TranslationOverrides.string(_root.$meta, 'profile.info.phone', {}) ??
            '手機號',
      'profile.info.gender' =>
        TranslationOverrides.string(_root.$meta, 'profile.info.gender', {}) ??
            '性別',
      'profile.info.birthday' =>
        TranslationOverrides.string(_root.$meta, 'profile.info.birthday', {}) ??
            '生日',
      'profile.info.email' =>
        TranslationOverrides.string(_root.$meta, 'profile.info.email', {}) ??
            '郵箱',
      'profile.info.notSet' =>
        TranslationOverrides.string(_root.$meta, 'profile.info.notSet', {}) ??
            '未設置',
      'profile.avatar.clickToChange' =>
        TranslationOverrides.string(
              _root.$meta,
              'profile.avatar.clickToChange',
              {},
            ) ??
            '點擊更換頭像',
      'profile.avatar.uploading' =>
        TranslationOverrides.string(
              _root.$meta,
              'profile.avatar.uploading',
              {},
            ) ??
            '頭像上傳功能開發中',
      'profile.saveSuccess' =>
        TranslationOverrides.string(_root.$meta, 'profile.saveSuccess', {}) ??
            '保存成功',
      'profile.saveFailed' =>
        ({required Object error}) =>
            TranslationOverrides.string(_root.$meta, 'profile.saveFailed', {
              'error': error,
            }) ??
            '保存失敗: ${error}',
      'profile.saveInfo' =>
        TranslationOverrides.string(_root.$meta, 'profile.saveInfo', {}) ??
            '保存信息',
      'profile.walletBalance' =>
        TranslationOverrides.string(_root.$meta, 'profile.walletBalance', {}) ??
            '錢包餘額',
      'profile.coin' =>
        TranslationOverrides.string(_root.$meta, 'profile.coin', {}) ?? '乖乖幣',
      'profile.couponCount' =>
        TranslationOverrides.string(_root.$meta, 'profile.couponCount', {}) ??
            '優惠券',
      'settings.title' =>
        TranslationOverrides.string(_root.$meta, 'settings.title', {}) ?? '設定',
      'settings.general' =>
        TranslationOverrides.string(_root.$meta, 'settings.general', {}) ??
            '通用',
      'settings.language' =>
        TranslationOverrides.string(_root.$meta, 'settings.language', {}) ??
            '語言',
      'settings.checkUpdate' =>
        TranslationOverrides.string(_root.$meta, 'settings.checkUpdate', {}) ??
            '檢查更新',
      'settings.clearCache' =>
        TranslationOverrides.string(_root.$meta, 'settings.clearCache', {}) ??
            '清除快取',
      'settings.about' =>
        TranslationOverrides.string(_root.$meta, 'settings.about', {}) ?? '關於',
      'settings.deviceInfo' =>
        TranslationOverrides.string(_root.$meta, 'settings.deviceInfo', {}) ??
            '設備資訊',
      'settings.aboutUs' =>
        TranslationOverrides.string(_root.$meta, 'settings.aboutUs', {}) ??
            '關於我們',
      'settings.checkingUpdate' =>
        TranslationOverrides.string(
              _root.$meta,
              'settings.checkingUpdate',
              {},
            ) ??
            '正在檢查更新...',
      'settings.cacheCleared' =>
        TranslationOverrides.string(_root.$meta, 'settings.cacheCleared', {}) ??
            '快取已清除',
      'settings.english' =>
        TranslationOverrides.string(_root.$meta, 'settings.english', {}) ??
            '英語',
      'settings.chinese' =>
        TranslationOverrides.string(_root.$meta, 'settings.chinese', {}) ??
            '簡體中文',
      'settings.traditionalChinese' =>
        TranslationOverrides.string(
              _root.$meta,
              'settings.traditionalChinese',
              {},
            ) ??
            '繁體中文',
      'settings.theme' =>
        TranslationOverrides.string(_root.$meta, 'settings.theme', {}) ??
            '主題模式',
      'settings.themeScheme' =>
        TranslationOverrides.string(_root.$meta, 'settings.themeScheme', {}) ??
            '主題配色',
      'settings.schemes.shadOrange' =>
        TranslationOverrides.string(
              _root.$meta,
              'settings.schemes.shadOrange',
              {},
            ) ??
            '活力橙 (ShadOrange)',
      'settings.schemes.shadGreen' =>
        TranslationOverrides.string(
              _root.$meta,
              'settings.schemes.shadGreen',
              {},
            ) ??
            '自然綠 (ShadGreen)',
      'settings.schemes.bahamaBlue' =>
        TranslationOverrides.string(
              _root.$meta,
              'settings.schemes.bahamaBlue',
              {},
            ) ??
            '巴哈馬藍 (BahamaBlue)',
      'settings.schemes.damask' =>
        TranslationOverrides.string(
              _root.$meta,
              'settings.schemes.damask',
              {},
            ) ??
            '錦緞紅 (Damask)',
      'settings.appName' =>
        TranslationOverrides.string(_root.$meta, 'settings.appName', {}) ??
            '應用名稱',
      'settings.packageName' =>
        TranslationOverrides.string(_root.$meta, 'settings.packageName', {}) ??
            '包名',
      'settings.versionName' =>
        TranslationOverrides.string(_root.$meta, 'settings.versionName', {}) ??
            '版本號',
      'settings.buildNumber' =>
        TranslationOverrides.string(_root.$meta, 'settings.buildNumber', {}) ??
            '構建號',
      'settings.copyright' =>
        TranslationOverrides.string(_root.$meta, 'settings.copyright', {}) ??
            '© 2024 Lunchbox Team',
      'splash.starting' =>
        TranslationOverrides.string(_root.$meta, 'splash.starting', {}) ??
            '正在啟動...',
      'splash.checkingServices' =>
        TranslationOverrides.string(
              _root.$meta,
              'splash.checkingServices',
              {},
            ) ??
            '檢查服務狀態...',
      'splash.loadingConfig' =>
        TranslationOverrides.string(_root.$meta, 'splash.loadingConfig', {}) ??
            '載入配置...',
      'splash.checkingAuth' =>
        TranslationOverrides.string(_root.$meta, 'splash.checkingAuth', {}) ??
            '檢查登入狀態...',
      'splash.preparingData' =>
        TranslationOverrides.string(_root.$meta, 'splash.preparingData', {}) ??
            '準備數據...',
      'splash.ready' =>
        TranslationOverrides.string(_root.$meta, 'splash.ready', {}) ?? '啟動完成',
      'splash.failed' =>
        TranslationOverrides.string(_root.$meta, 'splash.failed', {}) ?? '啟動失敗',
      'time.justNow' =>
        TranslationOverrides.string(_root.$meta, 'time.justNow', {}) ?? '剛剛',
      'time.minutesAgo' =>
        ({required Object minutes}) =>
            TranslationOverrides.string(_root.$meta, 'time.minutesAgo', {
              'minutes': minutes,
            }) ??
            '${minutes}分鐘前',
      'time.hoursAgo' =>
        ({required Object hours}) =>
            TranslationOverrides.string(_root.$meta, 'time.hoursAgo', {
              'hours': hours,
            }) ??
            '${hours}小時前',
      'time.daysAgo' =>
        ({required Object days}) =>
            TranslationOverrides.string(_root.$meta, 'time.daysAgo', {
              'days': days,
            }) ??
            '${days}天前',
      _ => null,
    };
  }
}
