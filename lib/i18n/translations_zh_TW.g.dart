///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';

import 'translations.g.dart';

// Path: <root>
class TranslationsZhTw extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsZhTw({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.zhTw,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh-TW>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsZhTw _root = this; // ignore: unused_field

  @override
	TranslationsZhTw $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsZhTw(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsCommonZhTw common = _TranslationsCommonZhTw._(_root);
  @override late final _TranslationsNavigationZhTw navigation = _TranslationsNavigationZhTw
      ._(_root);
	@override late final _TranslationsAuthZhTw auth = _TranslationsAuthZhTw._(_root);
  @override late final _TranslationsHomeZhTw home = _TranslationsHomeZhTw._(
      _root);
  @override late final _TranslationsProductZhTw product = _TranslationsProductZhTw
      ._(_root);
  @override late final _TranslationsCartZhTw cart = _TranslationsCartZhTw._(
      _root);
  @override late final _TranslationsOrderZhTw order = _TranslationsOrderZhTw._(
      _root);
  @override late final _TranslationsPaymentZhTw payment = _TranslationsPaymentZhTw
      ._(_root);
  @override late final _TranslationsSplashZhTw splash = _TranslationsSplashZhTw
      ._(_root);
  @override late final _TranslationsProfileZhTw profile = _TranslationsProfileZhTw
      ._(_root);
  @override late final _TranslationsSettingsZhTw settings = _TranslationsSettingsZhTw
      ._(_root);
  @override late final _TranslationsDeviceInfoZhTw device_info = _TranslationsDeviceInfoZhTw
      ._(_root);
  @override late final _TranslationsHelpZhTw help = _TranslationsHelpZhTw._(
      _root);
  @override late final _TranslationsOnboardingZhTw onboarding = _TranslationsOnboardingZhTw
      ._(_root);
  @override late final _TranslationsCityZhTw city = _TranslationsCityZhTw._(
      _root);
  @override late final _TranslationsDeviceZhTw device = _TranslationsDeviceZhTw
      ._(_root);
	@override late final _TranslationsTimeZhTw time = _TranslationsTimeZhTw._(_root);
  @override late final _TranslationsCouponZhTw coupon = _TranslationsCouponZhTw
      ._(_root);
}

// Path: common
class _TranslationsCommonZhTw extends TranslationsCommonZhCn {
	_TranslationsCommonZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get login => '登入';
	@override String get register => '註冊';
	@override String get username => '使用者名稱';
	@override String get password => '密碼';
	@override String get confirm => '確認';
	@override String get cancel => '取消';
	@override String get error => '錯誤';
	@override String get success => '成功';
	@override String get loading => '載入中...';

  @override String get ok => '確定';

  @override String get save => '儲存';

  @override String get delete => '刪除';

  @override String get edit => '編輯';

  @override String get search => '搜尋';

  @override String get noData => '暫無數據';

  @override String get retry => '重試';

  @override String get skip => '跳過';

  @override String get refresh => '重新整理';

  @override String get loadFailed => '載入失敗';

  @override String get unknownError => '未知錯誤';

  @override String get developing => '頁面正在开发中';

  @override String get appName => '飯盒售貨機';

  @override String get logout => '登出';
}

// Path: navigation
class _TranslationsNavigationZhTw extends TranslationsNavigationZhCn {
  _TranslationsNavigationZhTw._(TranslationsZhTw root)
      : this._root = root,
        super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override String get home => '首頁';

  @override String get device => '設備';

  @override String get orders => '訂單';

  @override String get profile => '個人中心';
}

// Path: auth
class _TranslationsAuthZhTw extends TranslationsAuthZhCn {
	_TranslationsAuthZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get loginTitle => '歡迎回來';
	@override String get loginButton => '登入';
	@override String get registerButton => '註冊';
	@override String get forgotPassword => '忘記密碼？';
	@override String get loginFailed => '登入失敗';
	@override String get loginSuccess => '登入成功';

  @override String get registerTitle => '建立帳號';

  @override String get nickname => '暱稱';

  @override String get registerSuccess => '註冊成功';

  @override String get registerFailed => '註冊失敗';

  @override String get forgotPasswordTitle => '重設密碼';

  @override String get sendResetLink => '發送重設連結';

  @override String get resetLinkSent => '重設連結已發送';

  @override String get required => '必填';

  @override String get enterUsername => '請輸入使用者名稱';

  @override String get enterPassword => '請輸入密碼';

  @override String get enterUsernameHint => '請輸入使用者名稱或手機號碼';

  @override String get enterNickname => '請輸入暱稱';

  @override String get dontHaveAccount => '還沒有帳號？';

  @override String get resetPasswordHint =>
      '請輸入您的使用者名稱或電子郵件來重設密碼';

  @override String get usernameOrEmail => '使用者名稱 / 電子郵件';

  @override String get slogan => '便捷購買，美味隨行';
}

// Path: home
class _TranslationsHomeZhTw extends TranslationsHomeZhCn {
  _TranslationsHomeZhTw._(TranslationsZhTw root)
      : this._root = root,
        super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override String get selectCity => '選擇城市';

  @override String get nearbyDevices => '附近設備';

  @override String get banner1Title => '便捷購買';

  @override String get banner1Subtitle => '美味隨行';

  @override String get banner2Title => '新鮮速遞';

  @override String get banner2Subtitle => '每日更新';

  @override String get banner3Title => '超值優惠';

  @override String get banner3Subtitle => '限時特價';

  @override String get noDevices => '附近暫無設備';

  @override String get welcome => '您好，好小乖用戶';

  @override String get selfPickup => '自取點餐';

  @override String get selfPickupHint => '掃碼取餐/打包帶走';

  @override String get teamOrder => '團隊點餐';

  @override String get teamOrderHint => '多人訂購/團隊點餐';

  @override String get recommendTitle => '為我推薦';
  @override late final _TranslationsHomeGridZhTw grid = _TranslationsHomeGridZhTw
      ._(_root);
  @override late final _TranslationsHomeLotteryZhTw lottery = _TranslationsHomeLotteryZhTw
      ._(_root);
  @override late final _TranslationsHomeStatusZhTw status = _TranslationsHomeStatusZhTw
      ._(_root);
}

// Path: product
class _TranslationsProductZhTw extends TranslationsProductZhCn {
  _TranslationsProductZhTw._(TranslationsZhTw root)
      : this._root = root,
        super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override String get title => '商品列表';

  @override String get detail => '商品詳情';

  @override String get hot => '熱銷';

  @override String get promotion => '促銷';

  @override String discountOff({required Object percent}) => '${percent}% OFF';

  @override String get stockFull => '庫存充足';

  @override String get stockEmpty => '暫時缺貨';

  @override String get addToCart => '加入購物車';

  @override String get addedToCart => '已加入購物車';

  @override String get specifications => '規格參數';

  @override String get categoryAll => '全部';

  @override String get categoryFood => '食品';

  @override String get categoryDrink => '飲料';

  @override String get categorySnack => '零食';

  @override String get sortDefault => '預設排序';

  @override String get sortPriceAsc => '價格從低到高';

  @override String get sortPriceDesc => '價格從高到低';

  @override String get sortName => '按名稱排序';

  @override String get filterOnlyAvailable => '僅顯示可用商品';

  @override String get cart => '購物車';
}

// Path: cart
class _TranslationsCartZhTw extends TranslationsCartZhCn {
  _TranslationsCartZhTw._(TranslationsZhTw root)
      : this._root = root,
        super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override String get title => '購物車';

  @override String get clear => '清空';

  @override String get empty => '購物車是空的';

  @override String get total => '合計';

  @override String get checkout => '結算';

  @override String get goShopping => '去逛逛';
}

// Path: order
class _TranslationsOrderZhTw extends TranslationsOrderZhCn {
  _TranslationsOrderZhTw._(TranslationsZhTw root)
      : this._root = root,
        super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override String get myOrders => '我的訂單';

  @override String get noOrders => '暫無訂單';

  @override String get detail => '訂單詳情';
  @override late final _TranslationsOrderStatusZhTw status = _TranslationsOrderStatusZhTw
      ._(_root);

  @override String get pickupCode => '取貨碼';

  @override String get pickupHint => '請在設備上輸入取貨碼取貨';

  @override String get items => '商品清單';

  @override String get info => '訂單資訊';

  @override String get id => '訂單號';

  @override String get createdAt => '建立時間';

  @override String get paidAt => '支付時間';

  @override String get paymentMethod => '支付方式';

  @override String get totalAmount => '訂單總額';

  @override String get unknown => '未知';

  @override String get refresh => '重新整理';

  @override String itemsCount({required Object count}) => '等${count}件商品';

  @override String get orderIdLabel => '訂單號：';

  @override String get orderAmount => '訂單金額';

  @override String get cancelOrder => '取消訂單';

  @override String get payNow => '去支付';

  @override String get viewDetail => '查看詳情';

  @override String get cancelConfirmTitle => '確認取消';

  @override String get cancelConfirmContent => '確定要取消這個訂單嗎？';

  @override String get orderCancelled => '訂單已取消';

  @override String get confirmOrder => '確認訂單';

  @override String get actualAmount => '實付金額';

  @override String get totalLabel => '合計: ';

  @override String get submitOrder => '提交訂單';

  @override String createFailed({required Object error}) =>
      '建立訂單失敗: ${error}';
}

// Path: payment
class _TranslationsPaymentZhTw extends TranslationsPaymentZhCn {
  _TranslationsPaymentZhTw._(TranslationsZhTw root)
      : this._root = root,
        super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override String get checkout => '收銀台';

  @override String get success => '支付成功';

  @override String get orderNotFound => '訂單資訊不存在';

  @override String get payNow => '立即支付';

  @override String get initializing => '正在初始化支付組件...';

  @override String get cancelTitle => '取消支付';

  @override String get cancelContent => '確定要取消支付嗎？訂單將被取消';

  @override String get continuePay => '繼續支付';

  @override String get cancelPay => '取消支付';

  @override String get amount => '支付金額';

  @override String get remainingTime => '支付剩餘時間';
}

// Path: splash
class _TranslationsSplashZhTw extends TranslationsSplashZhCn {
  _TranslationsSplashZhTw._(TranslationsZhTw root)
      : this._root = root,
        super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override String get starting => '正在啟動...';

  @override String get checkingServices => '檢查服務狀態...';

  @override String get loadingConfig => '載入配置...';

  @override String get checkingAuth => '檢查登入狀態...';

  @override String get preparingData => '準備數據...';

  @override String get ready => '啟動完成';

  @override String get failed => '啟動失敗';
}

// Path: profile
class _TranslationsProfileZhTw extends TranslationsProfileZhCn {
  _TranslationsProfileZhTw._(TranslationsZhTw root)
      : this._root = root,
        super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override String get title => '用戶中心';

  @override String get notLoggedIn => '未登入';

  @override String get editProfile => '編輯資料';

  @override String get logout => '登出';

  @override String get favoriteDevices => '收藏設備';

  @override String get personalInfo => '個人資訊';

  @override String get confirmLogout => '確認登出';

  @override String get confirmLogoutContent => '確定要登出嗎？';

  @override String get clearCacheConfirm => '確定要清除所有快取數據嗎？';

  @override String get noFavoriteDevices => '暫無收藏設備';

  @override String get removeFavorite => '取消收藏';

  @override String removeFavoriteConfirm({required Object name}) =>
      '確定要取消收藏"${name}"嗎？';

  @override String get appDescription => '一個便捷的自動售貨機購買應用';

  @override String version({required Object version}) => '版本：${version}';
}

// Path: settings
class _TranslationsSettingsZhTw extends TranslationsSettingsZhCn {
  _TranslationsSettingsZhTw._(TranslationsZhTw root)
      : this._root = root,
        super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override String get title => '設定';

  @override String get general => '通用';

  @override String get language => '語言';

  @override String get checkUpdate => '檢查更新';

  @override String get clearCache => '清除快取';

  @override String get about => '關於';

  @override String get deviceInfo => '設備資訊';

  @override String get aboutUs => '關於我們';

  @override String get checkingUpdate => '正在檢查更新...';

  @override String get cacheCleared => '快取已清除';

  @override String get english => '英語';

  @override String get chinese => '簡體中文';

  @override String get appName => '應用名稱';

  @override String get packageName => '包名';

  @override String get versionName => '版本號';

  @override String get buildNumber => '構建號';

  @override String get copyright => '© 2024 Lunchbox Team';
}

// Path: device_info
class _TranslationsDeviceInfoZhTw extends TranslationsDeviceInfoZhCn {
  _TranslationsDeviceInfoZhTw._(TranslationsZhTw root)
      : this._root = root,
        super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override String get browser => '瀏覽器';

  @override String get platform => '平台';

  @override String get userAgent => 'User Agent';

  @override String get language => '語言';

  @override String get memory => '記憶體';

  @override String get brand => '品牌';

  @override String get model => '型號';

  @override String get systemVersion => '系統版本';

  @override String get sdkVersion => 'SDK版本';

  @override String get manufacturer => '廠商';

  @override String get hardware => '硬體';

  @override String get host => '主機';

  @override String get id => 'ID';

  @override String get name => '名稱';

  @override String get systemName => '系統名';

  @override String get machine => '機器碼';

  @override String get uniqueId => '唯一ID';
}

// Path: help
class _TranslationsHelpZhTw extends TranslationsHelpZhCn {
  _TranslationsHelpZhTw._(TranslationsZhTw root)
      : this._root = root,
        super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override String get title => '幫助中心';

  @override String get developing => '幫助頁面正在開發中';
}

// Path: onboarding
class _TranslationsOnboardingZhTw extends TranslationsOnboardingZhCn {
  _TranslationsOnboardingZhTw._(TranslationsZhTw root)
      : this._root = root,
        super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override String get welcomeTitle => '歡迎使用飯盒售货機';

  @override String get welcomeBody => '隨時隨地，輕鬆購買美味午餐';

  @override String get findDevicesTitle => '查找附近設備';

  @override String get findDevicesBody => '快速定位最近的售貨機，節省您的時間';

  @override String get paymentTitle => '便捷支付';

  @override String get paymentBody => '支援信用卡等多種便捷支付方式';

  @override String get getStarted => '開始使用';
}

// Path: city
class _TranslationsCityZhTw extends TranslationsCityZhCn {
  _TranslationsCityZhTw._(TranslationsZhTw root)
      : this._root = root,
        super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override String get title => '選擇城市';

  @override String get search => '搜尋城市';

  @override String get hot => '熱門城市';

  @override String get noResult => '未找到相關城市';

  @override String get viewAll => '查看所有城市';

  @override String get switchSuccess => '城市已切換';

  @override String switchedTo({required Object name}) => '已切換到 ${name}';

  @override String get switchFailed => '切換失敗';

  @override String get saveFailed => '無法儲存選擇的城市，請重試';
}

// Path: device
class _TranslationsDeviceZhTw extends TranslationsDeviceZhCn {
  _TranslationsDeviceZhTw._(TranslationsZhTw root)
      : this._root = root,
        super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override String get title => '設備詳情';

  @override String get info => '設備資訊';

  @override String get address => '地址';

  @override String get distance => '距離';

  @override String get status => '狀態';

  @override String get online => '在線';

  @override String get offline => '離線';

  @override String get paymentMethods => '支付方式：';

  @override String get mobilePayment => '行動支付';

  @override String get cash => '現金';

  @override String get noProducts => '暫無商品';

  @override String get productList => '商品列表';

  @override String get soldOut => '已售罄';

  @override String get reportIssue => '上報故障';

  @override String get reportDeviceIssue => '上報設備故障';

  @override String get reportIssueHint => '請描述設備故障情況...';

  @override String get reportSuccess => '故障上報成功';

  @override String loadFailed({required Object error}) => '載入失敗: ${error}';

  @override String loadProductsFailed({required Object error}) =>
      '載入商品失敗: ${error}';

  @override String get nearby => '附近設備';

  @override String get sortByDistance => '按距離排序';

  @override String get sortByName => '按名稱排序';

  @override String get filterOnline => '僅顯示在線設備';

  @override String get noDevicesNearby => '附近暫無設備';

  @override String get maintenance => '維護中';

  @override String get unknown => '未知';

  @override String get cashPayment => '現金支付';
}

// Path: time
class _TranslationsTimeZhTw extends TranslationsTimeZhCn {
	_TranslationsTimeZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get justNow => '剛剛';
	@override String minutesAgo({required Object minutes}) => '${minutes}分鐘前';
	@override String hoursAgo({required Object hours}) => '${hours}小時前';
	@override String daysAgo({required Object days}) => '${days}天前';
}

// Path: coupon
class _TranslationsCouponZhTw extends TranslationsCouponZhCn {
  _TranslationsCouponZhTw._(TranslationsZhTw root)
      : this._root = root,
        super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override String get title => '優惠券';
  @override late final _TranslationsCouponTabsZhTw tabs = _TranslationsCouponTabsZhTw
      ._(_root);

  @override String get unit => 'NT\$';

  @override String condition({required Object amount}) =>
      '滿減券\n滿${amount}元可用';

  @override String get conditionNoThreshold => '滿減券\n滿0元可用';

  @override String get validForever => '長期有效';

  @override String get btnReceive => '立即領取';

  @override String get btnReceived => '已領取';

  @override String get btnUse => '去使用';

  @override String get btnExpired => '已過期';

  @override String discount({required Object amount}) => '${amount}元優惠券';

  @override String discountOff({required Object amount}) => '${amount}元減免券';
}

// Path: home.grid
class _TranslationsHomeGridZhTw extends TranslationsHomeGridZhCn {
  _TranslationsHomeGridZhTw._(TranslationsZhTw root)
      : this._root = root,
        super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override String get welfare => '社群福利';

  @override String get service => '客服中心';

  @override String get coupon => '領優惠券';

  @override String get lottery => '幸運抽獎';

  @override String get invite => '邀請好友';
}

// Path: home.lottery
class _TranslationsHomeLotteryZhTw extends TranslationsHomeLotteryZhCn {
  _TranslationsHomeLotteryZhTw._(TranslationsZhTw root)
      : this._root = root,
        super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override String get title => '幸運抽獎';

  @override String get prizes => '我的獎品';

  @override String get rules => '抽獎規則';

  @override String get remaining => '剩餘次數: {count}';

  @override String get spin => '抽獎';

  @override String get rule1 => '每日有免費抽獎次數，次數用完後可領取任務獲得';

  @override String get rule2 => '優惠券48小時內有效，乖乖幣自動到帳';

  @override String get rule3 => '活動最終解釋權歸平台所有';

  @override String get prizeUnit => '乖乖幣';

  @override String get prizeList => '獎品說明';

  @override String get back => '返回';
  @override late final _TranslationsHomeLotteryPrizeStatsZhTw prizeStats = _TranslationsHomeLotteryPrizeStatsZhTw
      ._(_root);
  @override late final _TranslationsHomeLotteryTabsZhTw tabs = _TranslationsHomeLotteryTabsZhTw
      ._(_root);
  @override late final _TranslationsHomeLotteryPrizeCardZhTw prizeCard = _TranslationsHomeLotteryPrizeCardZhTw
      ._(_root);
}

// Path: home.status
class _TranslationsHomeStatusZhTw extends TranslationsHomeStatusZhCn {
  _TranslationsHomeStatusZhTw._(TranslationsZhTw root)
      : this._root = root,
        super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override String get open => '營業中';

  @override String get closed => '休息中';

  @override String get mobilePayment => '支援行動支付';
}

// Path: order.status
class _TranslationsOrderStatusZhTw extends TranslationsOrderStatusZhCn {
  _TranslationsOrderStatusZhTw._(TranslationsZhTw root)
      : this._root = root,
        super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override String get all => '全部';

  @override String get pending => '待支付';

  @override String get paid => '已支付';

  @override String get completed => '已完成';

  @override String get cancelled => '已取消';

  @override String get refunded => '已退款';

  @override String get failed => '支付失敗';
}

// Path: coupon.tabs
class _TranslationsCouponTabsZhTw extends TranslationsCouponTabsZhCn {
  _TranslationsCouponTabsZhTw._(TranslationsZhTw root)
      : this._root = root,
        super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override String get available => '可領取';

  @override String get received => '已領取';

  @override String get expired => '已過期';
}

// Path: home.lottery.prizeStats
class _TranslationsHomeLotteryPrizeStatsZhTw
    extends TranslationsHomeLotteryPrizeStatsZhCn {
  _TranslationsHomeLotteryPrizeStatsZhTw._(TranslationsZhTw root)
      : this._root = root,
        super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override String get total => '總獎品';

  @override String get used => '已使用';

  @override String get available => '可用';
}

// Path: home.lottery.tabs
class _TranslationsHomeLotteryTabsZhTw extends TranslationsHomeLotteryTabsZhCn {
  _TranslationsHomeLotteryTabsZhTw._(TranslationsZhTw root)
      : this._root = root,
        super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override String get all => '全部';

  @override String get available => '可用';

  @override String get used => '已使用';

  @override String get expired => '已過期';
}

// Path: home.lottery.prizeCard
class _TranslationsHomeLotteryPrizeCardZhTw
    extends TranslationsHomeLotteryPrizeCardZhCn {
  _TranslationsHomeLotteryPrizeCardZhTw._(TranslationsZhTw root)
      : this._root = root,
        super.internal(root);

  final TranslationsZhTw _root; // ignore: unused_field

  // Translations
  @override String get source => '乖乖幣獎勵，可在乖乖幣商城使用';

  @override String get getTime => '獲得時間: {time}';

  @override String get expiryTime => '有效期至: {time}';

  @override String get statusExpired => '已過期';
}

/// The flat map containing all translations for locale <zh-TW>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsZhTw {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.login' => '登入',
			'common.register' => '註冊',
			'common.username' => '使用者名稱',
			'common.password' => '密碼',
			'common.confirm' => '確認',
			'common.cancel' => '取消',
			'common.error' => '錯誤',
			'common.success' => '成功',
			'common.loading' => '載入中...',
      'common.ok' => '確定',
      'common.save' => '儲存',
      'common.delete' => '刪除',
      'common.edit' => '編輯',
      'common.search' => '搜尋',
      'common.noData' => '暫無數據',
      'common.retry' => '重試',
      'common.skip' => '跳過',
      'common.refresh' => '重新整理',
      'common.loadFailed' => '載入失敗',
      'common.unknownError' => '未知錯誤',
      'common.developing' => '頁面正在开发中',
      'common.appName' => '飯盒售貨機',
      'common.logout' => '登出',
      'navigation.home' => '首頁',
      'navigation.device' => '設備',
      'navigation.orders' => '訂單',
      'navigation.profile' => '個人中心',
			'auth.loginTitle' => '歡迎回來',
			'auth.loginButton' => '登入',
			'auth.registerButton' => '註冊',
			'auth.forgotPassword' => '忘記密碼？',
			'auth.loginFailed' => '登入失敗',
			'auth.loginSuccess' => '登入成功',
      'auth.registerTitle' => '建立帳號',
      'auth.nickname' => '暱稱',
      'auth.registerSuccess' => '註冊成功',
      'auth.registerFailed' => '註冊失敗',
      'auth.forgotPasswordTitle' => '重設密碼',
      'auth.sendResetLink' => '發送重設連結',
      'auth.resetLinkSent' => '重設連結已發送',
      'auth.required' => '必填',
      'auth.enterUsername' => '請輸入使用者名稱',
      'auth.enterPassword' => '請輸入密碼',
      'auth.enterUsernameHint' => '請輸入使用者名稱或手機號碼',
      'auth.enterNickname' => '請輸入暱稱',
      'auth.dontHaveAccount' => '還沒有帳號？',
      'auth.resetPasswordHint' => '請輸入您的使用者名稱或電子郵件來重設密碼',
      'auth.usernameOrEmail' => '使用者名稱 / 電子郵件',
      'auth.slogan' => '便捷購買，美味隨行',
      'home.selectCity' => '選擇城市',
      'home.nearbyDevices' => '附近設備',
      'home.banner1Title' => '便捷購買',
      'home.banner1Subtitle' => '美味隨行',
      'home.banner2Title' => '新鮮速遞',
      'home.banner2Subtitle' => '每日更新',
      'home.banner3Title' => '超值優惠',
      'home.banner3Subtitle' => '限時特價',
      'home.noDevices' => '附近暫無設備',
      'home.welcome' => '您好，好小乖用戶',
      'home.selfPickup' => '自取點餐',
      'home.selfPickupHint' => '掃碼取餐/打包帶走',
      'home.teamOrder' => '團隊點餐',
      'home.teamOrderHint' => '多人訂購/團隊點餐',
      'home.recommendTitle' => '為我推薦',
      'home.grid.welfare' => '社群福利',
      'home.grid.service' => '客服中心',
      'home.grid.coupon' => '領優惠券',
      'home.grid.lottery' => '幸運抽獎',
      'home.grid.invite' => '邀請好友',
      'home.lottery.title' => '幸運抽獎',
      'home.lottery.prizes' => '我的獎品',
      'home.lottery.rules' => '抽獎規則',
      'home.lottery.remaining' => '剩餘次數: {count}',
      'home.lottery.spin' => '抽獎',
      'home.lottery.rule1' => '每日有免費抽獎次數，次數用完後可領取任務獲得',
      'home.lottery.rule2' => '優惠券48小時內有效，乖乖幣自動到帳',
      'home.lottery.rule3' => '活動最終解釋權歸平台所有',
      'home.lottery.prizeUnit' => '乖乖幣',
      'home.lottery.prizeList' => '獎品說明',
      'home.lottery.back' => '返回',
      'home.lottery.prizeStats.total' => '總獎品',
      'home.lottery.prizeStats.used' => '已使用',
      'home.lottery.prizeStats.available' => '可用',
      'home.lottery.tabs.all' => '全部',
      'home.lottery.tabs.available' => '可用',
      'home.lottery.tabs.used' => '已使用',
      'home.lottery.tabs.expired' => '已過期',
      'home.lottery.prizeCard.source' => '乖乖幣獎勵，可在乖乖幣商城使用',
      'home.lottery.prizeCard.getTime' => '獲得時間: {time}',
      'home.lottery.prizeCard.expiryTime' => '有效期至: {time}',
      'home.lottery.prizeCard.statusExpired' => '已過期',
      'home.status.open' => '營業中',
      'home.status.closed' => '休息中',
      'home.status.mobilePayment' => '支援行動支付',
      'product.title' => '商品列表',
      'product.detail' => '商品詳情',
      'product.hot' => '熱銷',
      'product.promotion' => '促銷',
      'product.discountOff' => ({required Object percent}) => '${percent}% OFF',
      'product.stockFull' => '庫存充足',
      'product.stockEmpty' => '暫時缺貨',
      'product.addToCart' => '加入購物車',
      'product.addedToCart' => '已加入購物車',
      'product.specifications' => '規格參數',
      'product.categoryAll' => '全部',
      'product.categoryFood' => '食品',
      'product.categoryDrink' => '飲料',
      'product.categorySnack' => '零食',
      'product.sortDefault' => '預設排序',
      'product.sortPriceAsc' => '價格從低到高',
      'product.sortPriceDesc' => '價格從高到低',
      'product.sortName' => '按名稱排序',
      'product.filterOnlyAvailable' => '僅顯示可用商品',
      'product.cart' => '購物車',
      'cart.title' => '購物車',
      'cart.clear' => '清空',
      'cart.empty' => '購物車是空的',
      'cart.total' => '合計',
      'cart.checkout' => '結算',
      'cart.goShopping' => '去逛逛',
      'order.myOrders' => '我的訂單',
      'order.noOrders' => '暫無訂單',
      'order.detail' => '訂單詳情',
      'order.status.all' => '全部',
      'order.status.pending' => '待支付',
      'order.status.paid' => '已支付',
      'order.status.completed' => '已完成',
      'order.status.cancelled' => '已取消',
      'order.status.refunded' => '已退款',
      'order.status.failed' => '支付失敗',
      'order.pickupCode' => '取貨碼',
      'order.pickupHint' => '請在設備上輸入取貨碼取貨',
      'order.items' => '商品清單',
      'order.info' => '訂單資訊',
      'order.id' => '訂單號',
      'order.createdAt' => '建立時間',
      'order.paidAt' => '支付時間',
      'order.paymentMethod' => '支付方式',
      'order.totalAmount' => '訂單總額',
      'order.unknown' => '未知',
      'order.refresh' => '重新整理',
      'order.itemsCount' => ({required Object count}) => '等${count}件商品',
      'order.orderIdLabel' => '訂單號：',
      'order.orderAmount' => '訂單金額',
      'order.cancelOrder' => '取消訂單',
      'order.payNow' => '去支付',
      'order.viewDetail' => '查看詳情',
      'order.cancelConfirmTitle' => '確認取消',
      'order.cancelConfirmContent' => '確定要取消這個訂單嗎？',
      'order.orderCancelled' => '訂單已取消',
      'order.confirmOrder' => '確認訂單',
      'order.actualAmount' => '實付金額',
      'order.totalLabel' => '合計: ',
      'order.submitOrder' => '提交訂單',
      'order.createFailed' =>
          ({required Object error}) => '建立訂單失敗: ${error}',
      'payment.checkout' => '收銀台',
      'payment.success' => '支付成功',
      'payment.orderNotFound' => '訂單資訊不存在',
      'payment.payNow' => '立即支付',
      'payment.initializing' => '正在初始化支付組件...',
      'payment.cancelTitle' => '取消支付',
      'payment.cancelContent' => '確定要取消支付嗎？訂單將被取消',
      'payment.continuePay' => '繼續支付',
      'payment.cancelPay' => '取消支付',
      'payment.amount' => '支付金額',
      'payment.remainingTime' => '支付剩餘時間',
      'splash.starting' => '正在啟動...',
      'splash.checkingServices' => '檢查服務狀態...',
      'splash.loadingConfig' => '載入配置...',
      'splash.checkingAuth' => '檢查登入狀態...',
      'splash.preparingData' => '準備數據...',
      'splash.ready' => '啟動完成',
      'splash.failed' => '啟動失敗',
      'profile.title' => '用戶中心',
      'profile.notLoggedIn' => '未登入',
      'profile.editProfile' => '編輯資料',
      'profile.logout' => '登出',
      'profile.favoriteDevices' => '收藏設備',
      'profile.personalInfo' => '個人資訊',
      'profile.confirmLogout' => '確認登出',
      'profile.confirmLogoutContent' => '確定要登出嗎？',
      'profile.clearCacheConfirm' => '確定要清除所有快取數據嗎？',
      'profile.noFavoriteDevices' => '暫無收藏設備',
      'profile.removeFavorite' => '取消收藏',
      'profile.removeFavoriteConfirm' =>
          ({required Object name}) => '確定要取消收藏"${name}"嗎？',
      'profile.appDescription' => '一個便捷的自動售貨機購買應用',
      'profile.version' => ({required Object version}) => '版本：${version}',
      'settings.title' => '設定',
      'settings.general' => '通用',
      'settings.language' => '語言',
      'settings.checkUpdate' => '檢查更新',
      'settings.clearCache' => '清除快取',
      'settings.about' => '關於',
      'settings.deviceInfo' => '設備資訊',
      'settings.aboutUs' => '關於我們',
      'settings.checkingUpdate' => '正在檢查更新...',
      'settings.cacheCleared' => '快取已清除',
      'settings.english' => '英語',
      'settings.chinese' => '簡體中文',
      'settings.appName' => '應用名稱',
      'settings.packageName' => '包名',
      'settings.versionName' => '版本號',
      'settings.buildNumber' => '構建號',
      'settings.copyright' => '© 2024 Lunchbox Team',
      'device_info.browser' => '瀏覽器',
      'device_info.platform' => '平台',
      'device_info.userAgent' => 'User Agent',
      'device_info.language' => '語言',
      'device_info.memory' => '記憶體',
      'device_info.brand' => '品牌',
      'device_info.model' => '型號',
      'device_info.systemVersion' => '系統版本',
      'device_info.sdkVersion' => 'SDK版本',
      'device_info.manufacturer' => '廠商',
      'device_info.hardware' => '硬體',
      'device_info.host' => '主機',
      'device_info.id' => 'ID',
      'device_info.name' => '名稱',
      'device_info.systemName' => '系統名',
      'device_info.machine' => '機器碼',
      'device_info.uniqueId' => '唯一ID',
      'help.title' => '幫助中心',
      'help.developing' => '幫助頁面正在開發中',
      'onboarding.welcomeTitle' => '歡迎使用飯盒售货機',
      'onboarding.welcomeBody' => '隨時隨地，輕鬆購買美味午餐',
      'onboarding.findDevicesTitle' => '查找附近設備',
      'onboarding.findDevicesBody' => '快速定位最近的售貨機，節省您的時間',
      'onboarding.paymentTitle' => '便捷支付',
      'onboarding.paymentBody' => '支援信用卡等多種便捷支付方式',
      'onboarding.getStarted' => '開始使用',
      'city.title' => '選擇城市',
      'city.search' => '搜尋城市',
      'city.hot' => '熱門城市',
      'city.noResult' => '未找到相關城市',
      'city.viewAll' => '查看所有城市',
      'city.switchSuccess' => '城市已切換',
      'city.switchedTo' => ({required Object name}) => '已切換到 ${name}',
      'city.switchFailed' => '切換失敗',
      'city.saveFailed' => '無法儲存選擇的城市，請重試',
      'device.title' => '設備詳情',
      'device.info' => '設備資訊',
      'device.address' => '地址',
      'device.distance' => '距離',
      'device.status' => '狀態',
      'device.online' => '在線',
      'device.offline' => '離線',
      'device.paymentMethods' => '支付方式：',
      'device.mobilePayment' => '行動支付',
      'device.cash' => '現金',
      'device.noProducts' => '暫無商品',
      'device.productList' => '商品列表',
      'device.soldOut' => '已售罄',
      'device.reportIssue' => '上報故障',
      'device.reportDeviceIssue' => '上報設備故障',
      'device.reportIssueHint' => '請描述設備故障情況...',
      'device.reportSuccess' => '故障上報成功',
      'device.loadFailed' => ({required Object error}) => '載入失敗: ${error}',
      'device.loadProductsFailed' =>
          ({required Object error}) => '載入商品失敗: ${error}',
      'device.nearby' => '附近設備',
      'device.sortByDistance' => '按距離排序',
      'device.sortByName' => '按名稱排序',
      'device.filterOnline' => '僅顯示在線設備',
      'device.noDevicesNearby' => '附近暫無設備',
      'device.maintenance' => '維護中',
      'device.unknown' => '未知',
      'device.cashPayment' => '現金支付',
			'time.justNow' => '剛剛',
			'time.minutesAgo' => ({required Object minutes}) => '${minutes}分鐘前',
			'time.hoursAgo' => ({required Object hours}) => '${hours}小時前',
			'time.daysAgo' => ({required Object days}) => '${days}天前',
      'coupon.title' => '優惠券',
      'coupon.tabs.available' => '可領取',
      'coupon.tabs.received' => '已領取',
      'coupon.tabs.expired' => '已過期',
      'coupon.unit' => 'NT\$',
      'coupon.condition' =>
          ({required Object amount}) => '滿減券\n滿${amount}元可用',
      'coupon.conditionNoThreshold' => '滿減券\n滿0元可用',
      'coupon.validForever' => '長期有效',
      'coupon.btnReceive' => '立即領取',
      'coupon.btnReceived' => '已領取',
      'coupon.btnUse' => '去使用',
      'coupon.btnExpired' => '已過期',
      'coupon.discount' => ({required Object amount}) => '${amount}元優惠券',
      'coupon.discountOff' => ({required Object amount}) => '${amount}元減免券',
			_ => null,
		};
	}
}
