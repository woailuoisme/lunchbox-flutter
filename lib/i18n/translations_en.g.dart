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
class TranslationsEn extends Translations
    with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  /// [AppLocaleUtils.buildWithOverrides] is recommended for overriding.
  TranslationsEn({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.en,
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

  /// Metadata for the translations of <en>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) =>
      $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

  late final TranslationsEn _root = this; // ignore: unused_field

  @override
  TranslationsEn $copyWith({
    TranslationMetadata<AppLocale, Translations>? meta,
  }) => TranslationsEn(meta: meta ?? this.$meta);

  // Translations
  @override
  late final _TranslationsAuthEn auth = _TranslationsAuthEn._(_root);
  @override
  late final _TranslationsCartEn cart = _TranslationsCartEn._(_root);
  @override
  late final _TranslationsCityEn city = _TranslationsCityEn._(_root);
  @override
  late final _TranslationsCommonEn common = _TranslationsCommonEn._(_root);
  @override
  late final _TranslationsCommunityEn community = _TranslationsCommunityEn._(
    _root,
  );
  @override
  late final _TranslationsCouponEn coupon = _TranslationsCouponEn._(_root);
  @override
  late final _TranslationsDeviceEn device = _TranslationsDeviceEn._(_root);
  @override
  late final _TranslationsDeviceInfoEn device_info =
      _TranslationsDeviceInfoEn._(_root);
  @override
  late final _TranslationsHelpEn help = _TranslationsHelpEn._(_root);
  @override
  late final _TranslationsHomeEn home = _TranslationsHomeEn._(_root);
  @override
  late final _TranslationsNavigationEn navigation = _TranslationsNavigationEn._(
    _root,
  );
  @override
  late final _TranslationsNetworkEn network = _TranslationsNetworkEn._(_root);
  @override
  late final _TranslationsOnboardingEn onboarding = _TranslationsOnboardingEn._(
    _root,
  );
  @override
  late final _TranslationsOrderEn order = _TranslationsOrderEn._(_root);
  @override
  late final _TranslationsPaymentEn payment = _TranslationsPaymentEn._(_root);
  @override
  late final _TranslationsProductEn product = _TranslationsProductEn._(_root);
  @override
  late final _TranslationsProfileEn profile = _TranslationsProfileEn._(_root);
  @override
  late final _TranslationsSettingsEn settings = _TranslationsSettingsEn._(
    _root,
  );
  @override
  late final _TranslationsSplashEn splash = _TranslationsSplashEn._(_root);
  @override
  late final _TranslationsTimeEn time = _TranslationsTimeEn._(_root);
}

// Path: auth
class _TranslationsAuthEn extends TranslationsAuthZhCn {
  _TranslationsAuthEn._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get loginTitle =>
      TranslationOverrides.string(_root.$meta, 'auth.loginTitle', {}) ??
      'Welcome Back';

  @override
  String get loginButton =>
      TranslationOverrides.string(_root.$meta, 'auth.loginButton', {}) ??
      'Login';

  @override
  String get registerButton =>
      TranslationOverrides.string(_root.$meta, 'auth.registerButton', {}) ??
      'Register';

  @override
  String get forgotPassword =>
      TranslationOverrides.string(_root.$meta, 'auth.forgotPassword', {}) ??
      'Forgot Password?';

  @override
  String get loginFailed =>
      TranslationOverrides.string(_root.$meta, 'auth.loginFailed', {}) ??
      'Login Failed';

  @override
  String get loginSuccess =>
      TranslationOverrides.string(_root.$meta, 'auth.loginSuccess', {}) ??
      'Login Success';

  @override
  String get registerTitle =>
      TranslationOverrides.string(_root.$meta, 'auth.registerTitle', {}) ??
      'Create Account';

  @override
  String get nickname =>
      TranslationOverrides.string(_root.$meta, 'auth.nickname', {}) ??
      'Nickname';

  @override
  String get registerSuccess =>
      TranslationOverrides.string(_root.$meta, 'auth.registerSuccess', {}) ??
      'Register Success';

  @override
  String get registerFailed =>
      TranslationOverrides.string(_root.$meta, 'auth.registerFailed', {}) ??
      'Register Failed';

  @override
  String get forgotPasswordTitle =>
      TranslationOverrides.string(
        _root.$meta,
        'auth.forgotPasswordTitle',
        {},
      ) ??
      'Reset Password';

  @override
  String get sendResetLink =>
      TranslationOverrides.string(_root.$meta, 'auth.sendResetLink', {}) ??
      'Send Reset Link';

  @override
  String get resetLinkSent =>
      TranslationOverrides.string(_root.$meta, 'auth.resetLinkSent', {}) ??
      'Reset Link Sent';

  @override
  String get required =>
      TranslationOverrides.string(_root.$meta, 'auth.required', {}) ??
      'Required';

  @override
  String get enterUsername =>
      TranslationOverrides.string(_root.$meta, 'auth.enterUsername', {}) ??
      'Please enter username';

  @override
  String get enterPassword =>
      TranslationOverrides.string(_root.$meta, 'auth.enterPassword', {}) ??
      'Please enter password';

  @override
  String get enterUsernameHint =>
      TranslationOverrides.string(_root.$meta, 'auth.enterUsernameHint', {}) ??
      'Enter username or phone';

  @override
  String get enterNickname =>
      TranslationOverrides.string(_root.$meta, 'auth.enterNickname', {}) ??
      'Please enter nickname';

  @override
  String get dontHaveAccount =>
      TranslationOverrides.string(_root.$meta, 'auth.dontHaveAccount', {}) ??
      'Don\'t have an account?';

  @override
  String get resetPasswordHint =>
      TranslationOverrides.string(_root.$meta, 'auth.resetPasswordHint', {}) ??
      'Enter your username or email to reset password';

  @override
  String get usernameOrEmail =>
      TranslationOverrides.string(_root.$meta, 'auth.usernameOrEmail', {}) ??
      'Username / Email';

  @override
  String get slogan =>
      TranslationOverrides.string(_root.$meta, 'auth.slogan', {}) ??
      'Convenient purchase, delicious on the go';
}

// Path: cart
class _TranslationsCartEn extends TranslationsCartZhCn {
  _TranslationsCartEn._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title =>
      TranslationOverrides.string(_root.$meta, 'cart.title', {}) ?? 'Cart';

  @override
  String get clear =>
      TranslationOverrides.string(_root.$meta, 'cart.clear', {}) ?? 'Clear';

  @override
  String get empty =>
      TranslationOverrides.string(_root.$meta, 'cart.empty', {}) ??
      'Cart is empty';

  @override
  String get total =>
      TranslationOverrides.string(_root.$meta, 'cart.total', {}) ?? 'Total';

  @override
  String get checkout =>
      TranslationOverrides.string(_root.$meta, 'cart.checkout', {}) ??
      'Checkout';

  @override
  String get goShopping =>
      TranslationOverrides.string(_root.$meta, 'cart.goShopping', {}) ??
      'Go Shopping';
}

// Path: city
class _TranslationsCityEn extends TranslationsCityZhCn {
  _TranslationsCityEn._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title =>
      TranslationOverrides.string(_root.$meta, 'city.title', {}) ??
      'Select City';

  @override
  String get search =>
      TranslationOverrides.string(_root.$meta, 'city.search', {}) ??
      'Search City';

  @override
  String get hot =>
      TranslationOverrides.string(_root.$meta, 'city.hot', {}) ?? 'Hot Cities';

  @override
  String get noResult =>
      TranslationOverrides.string(_root.$meta, 'city.noResult', {}) ??
      'No related cities found';

  @override
  String get viewAll =>
      TranslationOverrides.string(_root.$meta, 'city.viewAll', {}) ??
      'View All Cities';

  @override
  String get switchSuccess =>
      TranslationOverrides.string(_root.$meta, 'city.switchSuccess', {}) ??
      'City switched';

  @override
  String switchedTo({required Object name}) =>
      TranslationOverrides.string(_root.$meta, 'city.switchedTo', {
        'name': name,
      }) ??
      'Switched to ${name}';

  @override
  String get switchFailed =>
      TranslationOverrides.string(_root.$meta, 'city.switchFailed', {}) ??
      'Switch failed';

  @override
  String get saveFailed =>
      TranslationOverrides.string(_root.$meta, 'city.saveFailed', {}) ??
      'Unable to save selected city, please try again';
}

// Path: common
class _TranslationsCommonEn extends TranslationsCommonZhCn {
  _TranslationsCommonEn._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get login =>
      TranslationOverrides.string(_root.$meta, 'common.login', {}) ?? 'Login';

  @override
  String get register =>
      TranslationOverrides.string(_root.$meta, 'common.register', {}) ??
      'Register';

  @override
  String get username =>
      TranslationOverrides.string(_root.$meta, 'common.username', {}) ??
      'Username';

  @override
  String get password =>
      TranslationOverrides.string(_root.$meta, 'common.password', {}) ??
      'Password';

  @override
  String get confirm =>
      TranslationOverrides.string(_root.$meta, 'common.confirm', {}) ??
      'Confirm';

  @override
  String get cancel =>
      TranslationOverrides.string(_root.$meta, 'common.cancel', {}) ?? 'Cancel';

  @override
  String get error =>
      TranslationOverrides.string(_root.$meta, 'common.error', {}) ?? 'Error';

  @override
  String get success =>
      TranslationOverrides.string(_root.$meta, 'common.success', {}) ??
      'Success';

  @override
  String get loading =>
      TranslationOverrides.string(_root.$meta, 'common.loading', {}) ??
      'Loading...';

  @override
  String get ok =>
      TranslationOverrides.string(_root.$meta, 'common.ok', {}) ?? 'OK';

  @override
  String get save =>
      TranslationOverrides.string(_root.$meta, 'common.save', {}) ?? 'Save';

  @override
  String get delete =>
      TranslationOverrides.string(_root.$meta, 'common.delete', {}) ?? 'Delete';

  @override
  String get edit =>
      TranslationOverrides.string(_root.$meta, 'common.edit', {}) ?? 'Edit';

  @override
  String get search =>
      TranslationOverrides.string(_root.$meta, 'common.search', {}) ?? 'Search';

  @override
  String get noData =>
      TranslationOverrides.string(_root.$meta, 'common.noData', {}) ??
      'No Data';

  @override
  String get retry =>
      TranslationOverrides.string(_root.$meta, 'common.retry', {}) ?? 'Retry';

  @override
  String get skip =>
      TranslationOverrides.string(_root.$meta, 'common.skip', {}) ?? 'Skip';

  @override
  String get refresh =>
      TranslationOverrides.string(_root.$meta, 'common.refresh', {}) ??
      'Refresh';

  @override
  String get loadFailed =>
      TranslationOverrides.string(_root.$meta, 'common.loadFailed', {}) ??
      'Load Failed';

  @override
  String get unknownError =>
      TranslationOverrides.string(_root.$meta, 'common.unknownError', {}) ??
      'Unknown Error';

  @override
  String get developing =>
      TranslationOverrides.string(_root.$meta, 'common.developing', {}) ??
      'Page is under development';

  @override
  String get appName =>
      TranslationOverrides.string(_root.$meta, 'common.appName', {}) ??
      'E-Lunchbox';

  @override
  String get logout =>
      TranslationOverrides.string(_root.$meta, 'common.logout', {}) ?? 'Logout';

  @override
  String get pullToRefresh =>
      TranslationOverrides.string(_root.$meta, 'common.pullToRefresh', {}) ??
      'Pull to refresh';

  @override
  String get releaseToRefresh =>
      TranslationOverrides.string(_root.$meta, 'common.releaseToRefresh', {}) ??
      'Release to refresh';
}

// Path: community
class _TranslationsCommunityEn extends TranslationsCommunityZhCn {
  _TranslationsCommunityEn._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title =>
      TranslationOverrides.string(_root.$meta, 'community.title', {}) ??
      'Community Benefits';

  @override
  String get join =>
      TranslationOverrides.string(_root.$meta, 'community.join', {}) ??
      'Join Community';

  @override
  String get share =>
      TranslationOverrides.string(_root.$meta, 'community.share', {}) ??
      'Share delicious food with foodies';

  @override
  String get org =>
      TranslationOverrides.string(_root.$meta, 'community.org', {}) ??
      'Dongguan CAS Cloud Computing Center';

  @override
  String get dept =>
      TranslationOverrides.string(_root.$meta, 'community.dept', {}) ??
      'Cloud Computing Center';

  @override
  String get scanHint =>
      TranslationOverrides.string(_root.$meta, 'community.scanHint', {}) ??
      'Scan to join Dongguan CAS Cloud Computing Center';
  @override
  late final _TranslationsCommunityFeaturesEn features =
      _TranslationsCommunityFeaturesEn._(_root);

  @override
  String get whyJoin =>
      TranslationOverrides.string(_root.$meta, 'community.whyJoin', {}) ??
      'Why join our community?';

  @override
  String get reason1 =>
      TranslationOverrides.string(_root.$meta, 'community.reason1', {}) ??
      'Daily food recommendations';

  @override
  String get reason2 =>
      TranslationOverrides.string(_root.$meta, 'community.reason2', {}) ??
      'Limited time offers, save money';

  @override
  String get reason3 =>
      TranslationOverrides.string(_root.$meta, 'community.reason3', {}) ??
      'Professional food reviews';

  @override
  String get reason4 =>
      TranslationOverrides.string(_root.$meta, 'community.reason4', {}) ??
      'Food making tutorials';
}

// Path: coupon
class _TranslationsCouponEn extends TranslationsCouponZhCn {
  _TranslationsCouponEn._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title =>
      TranslationOverrides.string(_root.$meta, 'coupon.title', {}) ?? 'Coupon';
  @override
  late final _TranslationsCouponTabsEn tabs = _TranslationsCouponTabsEn._(
    _root,
  );

  @override
  String get unit =>
      TranslationOverrides.string(_root.$meta, 'coupon.unit', {}) ?? '\$';

  @override
  String condition({required Object amount}) =>
      TranslationOverrides.string(_root.$meta, 'coupon.condition', {
        'amount': amount,
      }) ??
      'Coupon\nOver ${amount}';

  @override
  String get conditionNoThreshold =>
      TranslationOverrides.string(
        _root.$meta,
        'coupon.conditionNoThreshold',
        {},
      ) ??
      'Coupon\nNo threshold';

  @override
  String get validForever =>
      TranslationOverrides.string(_root.$meta, 'coupon.validForever', {}) ??
      'Valid Forever';

  @override
  String get btnReceive =>
      TranslationOverrides.string(_root.$meta, 'coupon.btnReceive', {}) ??
      'Receive';

  @override
  String get btnReceived =>
      TranslationOverrides.string(_root.$meta, 'coupon.btnReceived', {}) ??
      'Received';

  @override
  String get btnUse =>
      TranslationOverrides.string(_root.$meta, 'coupon.btnUse', {}) ?? 'Use';

  @override
  String get btnExpired =>
      TranslationOverrides.string(_root.$meta, 'coupon.btnExpired', {}) ??
      'Expired';

  @override
  String discount({required Object amount}) =>
      TranslationOverrides.string(_root.$meta, 'coupon.discount', {
        'amount': amount,
      }) ??
      '\$ ${amount} Coupon';

  @override
  String discountOff({required Object amount}) =>
      TranslationOverrides.string(_root.$meta, 'coupon.discountOff', {
        'amount': amount,
      }) ??
      '\$ ${amount} Off';
}

// Path: device
class _TranslationsDeviceEn extends TranslationsDeviceZhCn {
  _TranslationsDeviceEn._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title =>
      TranslationOverrides.string(_root.$meta, 'device.title', {}) ??
      'Device Detail';

  @override
  String get info =>
      TranslationOverrides.string(_root.$meta, 'device.info', {}) ??
      'Device Information';

  @override
  String get address =>
      TranslationOverrides.string(_root.$meta, 'device.address', {}) ??
      'Address';

  @override
  String get distance =>
      TranslationOverrides.string(_root.$meta, 'device.distance', {}) ??
      'Distance';

  @override
  String get status =>
      TranslationOverrides.string(_root.$meta, 'device.status', {}) ?? 'Status';

  @override
  String get online =>
      TranslationOverrides.string(_root.$meta, 'device.online', {}) ?? 'Online';

  @override
  String get offline =>
      TranslationOverrides.string(_root.$meta, 'device.offline', {}) ??
      'Offline';

  @override
  String get paymentMethods =>
      TranslationOverrides.string(_root.$meta, 'device.paymentMethods', {}) ??
      'Payment Methods: ';

  @override
  String get mobilePayment =>
      TranslationOverrides.string(_root.$meta, 'device.mobilePayment', {}) ??
      'Mobile Payment';

  @override
  String get cash =>
      TranslationOverrides.string(_root.$meta, 'device.cash', {}) ?? 'Cash';

  @override
  String get noProducts =>
      TranslationOverrides.string(_root.$meta, 'device.noProducts', {}) ??
      'No products';

  @override
  String get productList =>
      TranslationOverrides.string(_root.$meta, 'device.productList', {}) ??
      'Product List';

  @override
  String get soldOut =>
      TranslationOverrides.string(_root.$meta, 'device.soldOut', {}) ??
      'Sold Out';

  @override
  String get reportIssue =>
      TranslationOverrides.string(_root.$meta, 'device.reportIssue', {}) ??
      'Report Issue';

  @override
  String get reportDeviceIssue =>
      TranslationOverrides.string(
        _root.$meta,
        'device.reportDeviceIssue',
        {},
      ) ??
      'Report Device Issue';

  @override
  String get reportIssueHint =>
      TranslationOverrides.string(_root.$meta, 'device.reportIssueHint', {}) ??
      'Please describe the issue...';

  @override
  String get reportSuccess =>
      TranslationOverrides.string(_root.$meta, 'device.reportSuccess', {}) ??
      'Issue reported successfully';

  @override
  String loadFailed({required Object error}) =>
      TranslationOverrides.string(_root.$meta, 'device.loadFailed', {
        'error': error,
      }) ??
      'Load failed: ${error}';

  @override
  String loadProductsFailed({required Object error}) =>
      TranslationOverrides.string(_root.$meta, 'device.loadProductsFailed', {
        'error': error,
      }) ??
      'Load products failed: ${error}';

  @override
  String get nearby =>
      TranslationOverrides.string(_root.$meta, 'device.nearby', {}) ??
      'Nearby Devices';

  @override
  String get sortByDistance =>
      TranslationOverrides.string(_root.$meta, 'device.sortByDistance', {}) ??
      'Sort by Distance';

  @override
  String get sortByName =>
      TranslationOverrides.string(_root.$meta, 'device.sortByName', {}) ??
      'Sort by Name';

  @override
  String get filterOnline =>
      TranslationOverrides.string(_root.$meta, 'device.filterOnline', {}) ??
      'Show Online Only';

  @override
  String get noDevicesNearby =>
      TranslationOverrides.string(_root.$meta, 'device.noDevicesNearby', {}) ??
      'No devices nearby';

  @override
  String get maintenance =>
      TranslationOverrides.string(_root.$meta, 'device.maintenance', {}) ??
      'Maintenance';

  @override
  String get unknown =>
      TranslationOverrides.string(_root.$meta, 'device.unknown', {}) ??
      'Unknown';

  @override
  String get cashPayment =>
      TranslationOverrides.string(_root.$meta, 'device.cashPayment', {}) ??
      'Cash Payment';
}

// Path: device_info
class _TranslationsDeviceInfoEn extends TranslationsDeviceInfoZhCn {
  _TranslationsDeviceInfoEn._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get browser =>
      TranslationOverrides.string(_root.$meta, 'device_info.browser', {}) ??
      'Browser';

  @override
  String get platform =>
      TranslationOverrides.string(_root.$meta, 'device_info.platform', {}) ??
      'Platform';

  @override
  String get userAgent =>
      TranslationOverrides.string(_root.$meta, 'device_info.userAgent', {}) ??
      'User Agent';

  @override
  String get language =>
      TranslationOverrides.string(_root.$meta, 'device_info.language', {}) ??
      'Language';

  @override
  String get memory =>
      TranslationOverrides.string(_root.$meta, 'device_info.memory', {}) ??
      'Memory';

  @override
  String get brand =>
      TranslationOverrides.string(_root.$meta, 'device_info.brand', {}) ??
      'Brand';

  @override
  String get model =>
      TranslationOverrides.string(_root.$meta, 'device_info.model', {}) ??
      'Model';

  @override
  String get systemVersion =>
      TranslationOverrides.string(
        _root.$meta,
        'device_info.systemVersion',
        {},
      ) ??
      'System Version';

  @override
  String get sdkVersion =>
      TranslationOverrides.string(_root.$meta, 'device_info.sdkVersion', {}) ??
      'SDK Version';

  @override
  String get manufacturer =>
      TranslationOverrides.string(
        _root.$meta,
        'device_info.manufacturer',
        {},
      ) ??
      'Manufacturer';

  @override
  String get hardware =>
      TranslationOverrides.string(_root.$meta, 'device_info.hardware', {}) ??
      'Hardware';

  @override
  String get host =>
      TranslationOverrides.string(_root.$meta, 'device_info.host', {}) ??
      'Host';

  @override
  String get id =>
      TranslationOverrides.string(_root.$meta, 'device_info.id', {}) ?? 'ID';

  @override
  String get name =>
      TranslationOverrides.string(_root.$meta, 'device_info.name', {}) ??
      'Name';

  @override
  String get systemName =>
      TranslationOverrides.string(_root.$meta, 'device_info.systemName', {}) ??
      'System Name';

  @override
  String get machine =>
      TranslationOverrides.string(_root.$meta, 'device_info.machine', {}) ??
      'Machine';

  @override
  String get uniqueId =>
      TranslationOverrides.string(_root.$meta, 'device_info.uniqueId', {}) ??
      'Unique ID';
}

// Path: help
class _TranslationsHelpEn extends TranslationsHelpZhCn {
  _TranslationsHelpEn._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title =>
      TranslationOverrides.string(_root.$meta, 'help.title', {}) ??
      'Help Center';

  @override
  String get developing =>
      TranslationOverrides.string(_root.$meta, 'help.developing', {}) ??
      'Help page is under development';
}

// Path: home
class _TranslationsHomeEn extends TranslationsHomeZhCn {
  _TranslationsHomeEn._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get selectCity =>
      TranslationOverrides.string(_root.$meta, 'home.selectCity', {}) ??
      'Select City';

  @override
  String get nearbyDevices =>
      TranslationOverrides.string(_root.$meta, 'home.nearbyDevices', {}) ??
      'Nearby Devices';

  @override
  String get banner1Title =>
      TranslationOverrides.string(_root.$meta, 'home.banner1Title', {}) ??
      'Convenient';

  @override
  String get banner1Subtitle =>
      TranslationOverrides.string(_root.$meta, 'home.banner1Subtitle', {}) ??
      'Delicious on the go';

  @override
  String get banner2Title =>
      TranslationOverrides.string(_root.$meta, 'home.banner2Title', {}) ??
      'Fresh Delivery';

  @override
  String get banner2Subtitle =>
      TranslationOverrides.string(_root.$meta, 'home.banner2Subtitle', {}) ??
      'Daily Updates';

  @override
  String get banner3Title =>
      TranslationOverrides.string(_root.$meta, 'home.banner3Title', {}) ??
      'Best Offers';

  @override
  String get banner3Subtitle =>
      TranslationOverrides.string(_root.$meta, 'home.banner3Subtitle', {}) ??
      'Limited Time Only';

  @override
  String get noDevices =>
      TranslationOverrides.string(_root.$meta, 'home.noDevices', {}) ??
      'No devices nearby';

  @override
  String get welcome =>
      TranslationOverrides.string(_root.$meta, 'home.welcome', {}) ??
      'Hello, User';

  @override
  String get selfPickup =>
      TranslationOverrides.string(_root.$meta, 'home.selfPickup', {}) ??
      'Self Pickup';

  @override
  String get selfPickupHint =>
      TranslationOverrides.string(_root.$meta, 'home.selfPickupHint', {}) ??
      'Scan code to pick up/Take away';

  @override
  String get teamOrder =>
      TranslationOverrides.string(_root.$meta, 'home.teamOrder', {}) ??
      'Team Order';

  @override
  String get teamOrderHint =>
      TranslationOverrides.string(_root.$meta, 'home.teamOrderHint', {}) ??
      'Group ordering/Team meal';

  @override
  String get invite =>
      TranslationOverrides.string(_root.$meta, 'home.invite', {}) ??
      'Invite & Earn';

  @override
  String get inviteHint =>
      TranslationOverrides.string(_root.$meta, 'home.inviteHint', {}) ??
      'Invite friends to get cash';

  @override
  String get recommendTitle =>
      TranslationOverrides.string(_root.$meta, 'home.recommendTitle', {}) ??
      'Recommended for Me';
  @override
  late final _TranslationsHomeGridEn grid = _TranslationsHomeGridEn._(_root);
  @override
  late final _TranslationsHomeLotteryEn lottery = _TranslationsHomeLotteryEn._(
    _root,
  );
  @override
  late final _TranslationsHomeStatusEn status = _TranslationsHomeStatusEn._(
    _root,
  );
}

// Path: navigation
class _TranslationsNavigationEn extends TranslationsNavigationZhCn {
  _TranslationsNavigationEn._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get home =>
      TranslationOverrides.string(_root.$meta, 'navigation.home', {}) ?? 'Home';

  @override
  String get device =>
      TranslationOverrides.string(_root.$meta, 'navigation.device', {}) ??
      'Device';

  @override
  String get orders =>
      TranslationOverrides.string(_root.$meta, 'navigation.orders', {}) ??
      'Orders';

  @override
  String get profile =>
      TranslationOverrides.string(_root.$meta, 'navigation.profile', {}) ??
      'Profile';
}

// Path: network
class _TranslationsNetworkEn extends TranslationsNetworkZhCn {
  _TranslationsNetworkEn._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsNetworkErrorsEn errors =
      _TranslationsNetworkErrorsEn._(_root);
}

// Path: onboarding
class _TranslationsOnboardingEn extends TranslationsOnboardingZhCn {
  _TranslationsOnboardingEn._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get welcomeTitle =>
      TranslationOverrides.string(_root.$meta, 'onboarding.welcomeTitle', {}) ??
      'Welcome to E-Lunchbox';

  @override
  String get welcomeBody =>
      TranslationOverrides.string(_root.$meta, 'onboarding.welcomeBody', {}) ??
      'Anytime, anywhere, easily buy delicious lunch';

  @override
  String get findDevicesTitle =>
      TranslationOverrides.string(
        _root.$meta,
        'onboarding.findDevicesTitle',
        {},
      ) ??
      'Find Nearby Devices';

  @override
  String get findDevicesBody =>
      TranslationOverrides.string(
        _root.$meta,
        'onboarding.findDevicesBody',
        {},
      ) ??
      'Quickly locate the nearest vending machine and save your time';

  @override
  String get paymentTitle =>
      TranslationOverrides.string(_root.$meta, 'onboarding.paymentTitle', {}) ??
      'Convenient Payment';

  @override
  String get paymentBody =>
      TranslationOverrides.string(_root.$meta, 'onboarding.paymentBody', {}) ??
      'Supports multiple convenient payment methods like credit cards';

  @override
  String get getStarted =>
      TranslationOverrides.string(_root.$meta, 'onboarding.getStarted', {}) ??
      'Get Started';
}

// Path: order
class _TranslationsOrderEn extends TranslationsOrderZhCn {
  _TranslationsOrderEn._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get myOrders =>
      TranslationOverrides.string(_root.$meta, 'order.myOrders', {}) ??
      'My Orders';

  @override
  String get noOrders =>
      TranslationOverrides.string(_root.$meta, 'order.noOrders', {}) ??
      'No Orders';

  @override
  String get detail =>
      TranslationOverrides.string(_root.$meta, 'order.detail', {}) ??
      'Order Detail';
  @override
  late final _TranslationsOrderStatusEn status = _TranslationsOrderStatusEn._(
    _root,
  );

  @override
  String get pickupCode =>
      TranslationOverrides.string(_root.$meta, 'order.pickupCode', {}) ??
      'Pickup Code';

  @override
  String get pickupHint =>
      TranslationOverrides.string(_root.$meta, 'order.pickupHint', {}) ??
      'Enter code on device to pick up';

  @override
  String get items =>
      TranslationOverrides.string(_root.$meta, 'order.items', {}) ??
      'Item List';

  @override
  String get info =>
      TranslationOverrides.string(_root.$meta, 'order.info', {}) ??
      'Order Info';

  @override
  String get id =>
      TranslationOverrides.string(_root.$meta, 'order.id', {}) ?? 'Order ID';

  @override
  String get createdAt =>
      TranslationOverrides.string(_root.$meta, 'order.createdAt', {}) ??
      'Created At';

  @override
  String get paidAt =>
      TranslationOverrides.string(_root.$meta, 'order.paidAt', {}) ?? 'Paid At';

  @override
  String get paymentMethod =>
      TranslationOverrides.string(_root.$meta, 'order.paymentMethod', {}) ??
      'Payment Method';

  @override
  String get totalAmount =>
      TranslationOverrides.string(_root.$meta, 'order.totalAmount', {}) ??
      'Total Amount';

  @override
  String get unknown =>
      TranslationOverrides.string(_root.$meta, 'order.unknown', {}) ??
      'Unknown';

  @override
  String get refresh =>
      TranslationOverrides.string(_root.$meta, 'order.refresh', {}) ??
      'Refresh';

  @override
  String itemsCount({required Object count}) =>
      TranslationOverrides.string(_root.$meta, 'order.itemsCount', {
        'count': count,
      }) ??
      'and ${count} other items';

  @override
  String get orderIdLabel =>
      TranslationOverrides.string(_root.$meta, 'order.orderIdLabel', {}) ??
      'Order ID: ';

  @override
  String get orderAmount =>
      TranslationOverrides.string(_root.$meta, 'order.orderAmount', {}) ??
      'Order Amount';

  @override
  String get cancelOrder =>
      TranslationOverrides.string(_root.$meta, 'order.cancelOrder', {}) ??
      'Cancel Order';

  @override
  String get payNow =>
      TranslationOverrides.string(_root.$meta, 'order.payNow', {}) ?? 'Pay Now';

  @override
  String get viewDetail =>
      TranslationOverrides.string(_root.$meta, 'order.viewDetail', {}) ??
      'View Details';

  @override
  String get cancelConfirmTitle =>
      TranslationOverrides.string(
        _root.$meta,
        'order.cancelConfirmTitle',
        {},
      ) ??
      'Confirm Cancel';

  @override
  String get cancelConfirmContent =>
      TranslationOverrides.string(
        _root.$meta,
        'order.cancelConfirmContent',
        {},
      ) ??
      'Are you sure you want to cancel this order?';

  @override
  String get orderCancelled =>
      TranslationOverrides.string(_root.$meta, 'order.orderCancelled', {}) ??
      'Order cancelled';

  @override
  String get confirmOrder =>
      TranslationOverrides.string(_root.$meta, 'order.confirmOrder', {}) ??
      'Confirm Order';

  @override
  String get actualAmount =>
      TranslationOverrides.string(_root.$meta, 'order.actualAmount', {}) ??
      'Actual Amount';

  @override
  String get totalLabel =>
      TranslationOverrides.string(_root.$meta, 'order.totalLabel', {}) ??
      'Total: ';

  @override
  String get submitOrder =>
      TranslationOverrides.string(_root.$meta, 'order.submitOrder', {}) ??
      'Submit Order';

  @override
  String createFailed({required Object error}) =>
      TranslationOverrides.string(_root.$meta, 'order.createFailed', {
        'error': error,
      }) ??
      'Create order failed: ${error}';
}

// Path: payment
class _TranslationsPaymentEn extends TranslationsPaymentZhCn {
  _TranslationsPaymentEn._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get checkout =>
      TranslationOverrides.string(_root.$meta, 'payment.checkout', {}) ??
      'Checkout';

  @override
  String get success =>
      TranslationOverrides.string(_root.$meta, 'payment.success', {}) ??
      'Payment Successful';

  @override
  String get orderNotFound =>
      TranslationOverrides.string(_root.$meta, 'payment.orderNotFound', {}) ??
      'Order Not Found';

  @override
  String get payNow =>
      TranslationOverrides.string(_root.$meta, 'payment.payNow', {}) ??
      'Pay Now';

  @override
  String get initializing =>
      TranslationOverrides.string(_root.$meta, 'payment.initializing', {}) ??
      'Initializing payment...';

  @override
  String get cancelTitle =>
      TranslationOverrides.string(_root.$meta, 'payment.cancelTitle', {}) ??
      'Cancel Payment';

  @override
  String get cancelContent =>
      TranslationOverrides.string(_root.$meta, 'payment.cancelContent', {}) ??
      'Are you sure you want to cancel? Order will be cancelled';

  @override
  String get continuePay =>
      TranslationOverrides.string(_root.$meta, 'payment.continuePay', {}) ??
      'Continue Payment';

  @override
  String get cancelPay =>
      TranslationOverrides.string(_root.$meta, 'payment.cancelPay', {}) ??
      'Cancel Payment';

  @override
  String get amount =>
      TranslationOverrides.string(_root.$meta, 'payment.amount', {}) ??
      'Payment Amount';

  @override
  String get remainingTime =>
      TranslationOverrides.string(_root.$meta, 'payment.remainingTime', {}) ??
      'Time Remaining';
}

// Path: product
class _TranslationsProductEn extends TranslationsProductZhCn {
  _TranslationsProductEn._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title =>
      TranslationOverrides.string(_root.$meta, 'product.title', {}) ??
      'Product List';

  @override
  String get detail =>
      TranslationOverrides.string(_root.$meta, 'product.detail', {}) ??
      'Product Detail';

  @override
  String get hot =>
      TranslationOverrides.string(_root.$meta, 'product.hot', {}) ?? 'Hot';

  @override
  String get promotion =>
      TranslationOverrides.string(_root.$meta, 'product.promotion', {}) ??
      'Sale';

  @override
  String discountOff({required Object percent}) =>
      TranslationOverrides.string(_root.$meta, 'product.discountOff', {
        'percent': percent,
      }) ??
      '${percent}% OFF';

  @override
  String get stockFull =>
      TranslationOverrides.string(_root.$meta, 'product.stockFull', {}) ??
      'In Stock';

  @override
  String get stockEmpty =>
      TranslationOverrides.string(_root.$meta, 'product.stockEmpty', {}) ??
      'Out of Stock';

  @override
  String get addToCart =>
      TranslationOverrides.string(_root.$meta, 'product.addToCart', {}) ??
      'Add to Cart';

  @override
  String get addedToCart =>
      TranslationOverrides.string(_root.$meta, 'product.addedToCart', {}) ??
      'Added to Cart';

  @override
  String get specifications =>
      TranslationOverrides.string(_root.$meta, 'product.specifications', {}) ??
      'Specifications';

  @override
  String get categoryAll =>
      TranslationOverrides.string(_root.$meta, 'product.categoryAll', {}) ??
      'All';

  @override
  String get categoryFood =>
      TranslationOverrides.string(_root.$meta, 'product.categoryFood', {}) ??
      'Food';

  @override
  String get categoryDrink =>
      TranslationOverrides.string(_root.$meta, 'product.categoryDrink', {}) ??
      'Drink';

  @override
  String get categorySnack =>
      TranslationOverrides.string(_root.$meta, 'product.categorySnack', {}) ??
      'Snack';

  @override
  String get sortDefault =>
      TranslationOverrides.string(_root.$meta, 'product.sortDefault', {}) ??
      'Default';

  @override
  String get sortPriceAsc =>
      TranslationOverrides.string(_root.$meta, 'product.sortPriceAsc', {}) ??
      'Price: Low to High';

  @override
  String get sortPriceDesc =>
      TranslationOverrides.string(_root.$meta, 'product.sortPriceDesc', {}) ??
      'Price: High to Low';

  @override
  String get sortName =>
      TranslationOverrides.string(_root.$meta, 'product.sortName', {}) ??
      'Name';

  @override
  String get filterOnlyAvailable =>
      TranslationOverrides.string(
        _root.$meta,
        'product.filterOnlyAvailable',
        {},
      ) ??
      'Show Available Only';

  @override
  String get cart =>
      TranslationOverrides.string(_root.$meta, 'product.cart', {}) ?? 'Cart';
}

// Path: profile
class _TranslationsProfileEn extends TranslationsProfileZhCn {
  _TranslationsProfileEn._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title =>
      TranslationOverrides.string(_root.$meta, 'profile.title', {}) ??
      'User Center';

  @override
  String get notLoggedIn =>
      TranslationOverrides.string(_root.$meta, 'profile.notLoggedIn', {}) ??
      'Not Logged In';

  @override
  String get editProfile =>
      TranslationOverrides.string(_root.$meta, 'profile.editProfile', {}) ??
      'Edit Profile';

  @override
  String get logout =>
      TranslationOverrides.string(_root.$meta, 'profile.logout', {}) ??
      'Logout';

  @override
  String get favoriteDevices =>
      TranslationOverrides.string(_root.$meta, 'profile.favoriteDevices', {}) ??
      'Favorite Devices';

  @override
  String get personalInfo =>
      TranslationOverrides.string(_root.$meta, 'profile.personalInfo', {}) ??
      'Personal Info';

  @override
  String get confirmLogout =>
      TranslationOverrides.string(_root.$meta, 'profile.confirmLogout', {}) ??
      'Confirm Logout';

  @override
  String get confirmLogoutContent =>
      TranslationOverrides.string(
        _root.$meta,
        'profile.confirmLogoutContent',
        {},
      ) ??
      'Are you sure you want to logout?';

  @override
  String get clearCacheConfirm =>
      TranslationOverrides.string(
        _root.$meta,
        'profile.clearCacheConfirm',
        {},
      ) ??
      'Are you sure you want to clear all cache data?';

  @override
  String get noFavoriteDevices =>
      TranslationOverrides.string(
        _root.$meta,
        'profile.noFavoriteDevices',
        {},
      ) ??
      'No favorite devices';

  @override
  String get removeFavorite =>
      TranslationOverrides.string(_root.$meta, 'profile.removeFavorite', {}) ??
      'Unfavorite';

  @override
  String removeFavoriteConfirm({required Object name}) =>
      TranslationOverrides.string(
        _root.$meta,
        'profile.removeFavoriteConfirm',
        {'name': name},
      ) ??
      'Are you sure you want to unfavorite "${name}"?';

  @override
  String get appDescription =>
      TranslationOverrides.string(_root.$meta, 'profile.appDescription', {}) ??
      'A convenient vending machine purchasing application';

  @override
  String version({required Object version}) =>
      TranslationOverrides.string(_root.$meta, 'profile.version', {
        'version': version,
      }) ??
      'Version: ${version}';
}

// Path: settings
class _TranslationsSettingsEn extends TranslationsSettingsZhCn {
  _TranslationsSettingsEn._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title =>
      TranslationOverrides.string(_root.$meta, 'settings.title', {}) ??
      'Settings';

  @override
  String get general =>
      TranslationOverrides.string(_root.$meta, 'settings.general', {}) ??
      'General';

  @override
  String get theme =>
      TranslationOverrides.string(_root.$meta, 'settings.theme', {}) ??
      'Theme Mode';

  @override
  String get themeLight =>
      TranslationOverrides.string(_root.$meta, 'settings.themeLight', {}) ??
      'Light';

  @override
  String get themeDark =>
      TranslationOverrides.string(_root.$meta, 'settings.themeDark', {}) ??
      'Dark';

  @override
  String get themeSystem =>
      TranslationOverrides.string(_root.$meta, 'settings.themeSystem', {}) ??
      'System';

  @override
  String get language =>
      TranslationOverrides.string(_root.$meta, 'settings.language', {}) ??
      'Language';

  @override
  String get checkUpdate =>
      TranslationOverrides.string(_root.$meta, 'settings.checkUpdate', {}) ??
      'Check Update';

  @override
  String get clearCache =>
      TranslationOverrides.string(_root.$meta, 'settings.clearCache', {}) ??
      'Clear Cache';

  @override
  String get about =>
      TranslationOverrides.string(_root.$meta, 'settings.about', {}) ?? 'About';

  @override
  String get deviceInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.deviceInfo', {}) ??
      'Device Info';

  @override
  String get aboutUs =>
      TranslationOverrides.string(_root.$meta, 'settings.aboutUs', {}) ??
      'About Us';

  @override
  String get checkingUpdate =>
      TranslationOverrides.string(_root.$meta, 'settings.checkingUpdate', {}) ??
      'Checking for updates...';

  @override
  String get cacheCleared =>
      TranslationOverrides.string(_root.$meta, 'settings.cacheCleared', {}) ??
      'Cache cleared';

  @override
  String get english =>
      TranslationOverrides.string(_root.$meta, 'settings.english', {}) ??
      'English';

  @override
  String get chinese =>
      TranslationOverrides.string(_root.$meta, 'settings.chinese', {}) ??
      'Simplified Chinese';

  @override
  String get traditionalChinese =>
      TranslationOverrides.string(
        _root.$meta,
        'settings.traditionalChinese',
        {},
      ) ??
      'Traditional Chinese';

  @override
  String get appName =>
      TranslationOverrides.string(_root.$meta, 'settings.appName', {}) ??
      'App Name';

  @override
  String get packageName =>
      TranslationOverrides.string(_root.$meta, 'settings.packageName', {}) ??
      'Package Name';

  @override
  String get versionName =>
      TranslationOverrides.string(_root.$meta, 'settings.versionName', {}) ??
      'Version Name';

  @override
  String get buildNumber =>
      TranslationOverrides.string(_root.$meta, 'settings.buildNumber', {}) ??
      'Build Number';

  @override
  String get copyright =>
      TranslationOverrides.string(_root.$meta, 'settings.copyright', {}) ??
      '© 2024 Lunchbox Team';
}

// Path: splash
class _TranslationsSplashEn extends TranslationsSplashZhCn {
  _TranslationsSplashEn._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get starting =>
      TranslationOverrides.string(_root.$meta, 'splash.starting', {}) ??
      'Starting...';

  @override
  String get checkingServices =>
      TranslationOverrides.string(_root.$meta, 'splash.checkingServices', {}) ??
      'Checking services...';

  @override
  String get loadingConfig =>
      TranslationOverrides.string(_root.$meta, 'splash.loadingConfig', {}) ??
      'Loading config...';

  @override
  String get checkingAuth =>
      TranslationOverrides.string(_root.$meta, 'splash.checkingAuth', {}) ??
      'Checking auth status...';

  @override
  String get preparingData =>
      TranslationOverrides.string(_root.$meta, 'splash.preparingData', {}) ??
      'Preparing data...';

  @override
  String get ready =>
      TranslationOverrides.string(_root.$meta, 'splash.ready', {}) ?? 'Ready';

  @override
  String get failed =>
      TranslationOverrides.string(_root.$meta, 'splash.failed', {}) ??
      'Start Failed';
}

// Path: time
class _TranslationsTimeEn extends TranslationsTimeZhCn {
  _TranslationsTimeEn._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get justNow =>
      TranslationOverrides.string(_root.$meta, 'time.justNow', {}) ??
      'Just now';

  @override
  String minutesAgo({required Object minutes}) =>
      TranslationOverrides.string(_root.$meta, 'time.minutesAgo', {
        'minutes': minutes,
      }) ??
      '${minutes} mins ago';

  @override
  String hoursAgo({required Object hours}) =>
      TranslationOverrides.string(_root.$meta, 'time.hoursAgo', {
        'hours': hours,
      }) ??
      '${hours} hours ago';

  @override
  String daysAgo({required Object days}) =>
      TranslationOverrides.string(_root.$meta, 'time.daysAgo', {
        'days': days,
      }) ??
      '${days} days ago';
}

// Path: community.features
class _TranslationsCommunityFeaturesEn
    extends TranslationsCommunityFeaturesZhCn {
  _TranslationsCommunityFeaturesEn._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get coupon =>
      TranslationOverrides.string(
        _root.$meta,
        'community.features.coupon',
        {},
      ) ??
      'Exclusive Coupons';

  @override
  String get couponHint =>
      TranslationOverrides.string(
        _root.$meta,
        'community.features.couponHint',
        {},
      ) ??
      'Exclusive discounts for group members';

  @override
  String get tasting =>
      TranslationOverrides.string(
        _root.$meta,
        'community.features.tasting',
        {},
      ) ??
      'New Product Tasting';

  @override
  String get tastingHint =>
      TranslationOverrides.string(
        _root.$meta,
        'community.features.tastingHint',
        {},
      ) ??
      'Taste the latest food first';

  @override
  String get exchange =>
      TranslationOverrides.string(
        _root.$meta,
        'community.features.exchange',
        {},
      ) ??
      'Food Exchange';

  @override
  String get exchangeHint =>
      TranslationOverrides.string(
        _root.$meta,
        'community.features.exchangeHint',
        {},
      ) ??
      'Share insights with food experts';

  @override
  String get priority =>
      TranslationOverrides.string(
        _root.$meta,
        'community.features.priority',
        {},
      ) ??
      'Priority Access';

  @override
  String get priorityHint =>
      TranslationOverrides.string(
        _root.$meta,
        'community.features.priorityHint',
        {},
      ) ??
      'Priority participation in food events';

  @override
  String get activity =>
      TranslationOverrides.string(
        _root.$meta,
        'community.features.activity',
        {},
      ) ??
      'Community Events';

  @override
  String get activityHint =>
      TranslationOverrides.string(
        _root.$meta,
        'community.features.activityHint',
        {},
      ) ??
      'Regular offline gatherings';

  @override
  String get topic =>
      TranslationOverrides.string(
        _root.$meta,
        'community.features.topic',
        {},
      ) ??
      'Topic Discussion';

  @override
  String get topicHint =>
      TranslationOverrides.string(
        _root.$meta,
        'community.features.topicHint',
        {},
      ) ??
      'Participate in topics to win rewards';
}

// Path: coupon.tabs
class _TranslationsCouponTabsEn extends TranslationsCouponTabsZhCn {
  _TranslationsCouponTabsEn._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get available =>
      TranslationOverrides.string(_root.$meta, 'coupon.tabs.available', {}) ??
      'Available';

  @override
  String get received =>
      TranslationOverrides.string(_root.$meta, 'coupon.tabs.received', {}) ??
      'Received';

  @override
  String get expired =>
      TranslationOverrides.string(_root.$meta, 'coupon.tabs.expired', {}) ??
      'Expired';
}

// Path: home.grid
class _TranslationsHomeGridEn extends TranslationsHomeGridZhCn {
  _TranslationsHomeGridEn._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get welfare =>
      TranslationOverrides.string(_root.$meta, 'home.grid.welfare', {}) ??
      'Welfare';

  @override
  String get service =>
      TranslationOverrides.string(_root.$meta, 'home.grid.service', {}) ??
      'Service';

  @override
  String get coupon =>
      TranslationOverrides.string(_root.$meta, 'home.grid.coupon', {}) ??
      'Coupons';

  @override
  String get lottery =>
      TranslationOverrides.string(_root.$meta, 'home.grid.lottery', {}) ??
      'Lucky Draw';

  @override
  String get invite =>
      TranslationOverrides.string(_root.$meta, 'home.grid.invite', {}) ??
      'Invite Friends';
}

// Path: home.lottery
class _TranslationsHomeLotteryEn extends TranslationsHomeLotteryZhCn {
  _TranslationsHomeLotteryEn._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.title', {}) ??
      'Lucky Draw';

  @override
  String get prizes =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.prizes', {}) ??
      'My Prizes';

  @override
  String get rules =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.rules', {}) ??
      'Draw Rules';

  @override
  String get remaining =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.remaining', {}) ??
      'Remaining: {count}';

  @override
  String get spin =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.spin', {}) ??
      'Spin';

  @override
  String get rule1 =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.rule1', {}) ??
      'Free draws daily, complete tasks for more';

  @override
  String get rule2 =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.rule2', {}) ??
      'Coupons valid for 48h, Coins added automatically';

  @override
  String get rule3 =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.rule3', {}) ??
      'Platform reserves all rights';

  @override
  String get prizeUnit =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.prizeUnit', {}) ??
      'Coins';

  @override
  String get prizeList =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.prizeList', {}) ??
      'Prize List';

  @override
  String get back =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.back', {}) ??
      'Back';
  @override
  late final _TranslationsHomeLotteryPrizeStatsEn prizeStats =
      _TranslationsHomeLotteryPrizeStatsEn._(_root);
  @override
  late final _TranslationsHomeLotteryTabsEn tabs =
      _TranslationsHomeLotteryTabsEn._(_root);
  @override
  late final _TranslationsHomeLotteryPrizeCardEn prizeCard =
      _TranslationsHomeLotteryPrizeCardEn._(_root);
}

// Path: home.status
class _TranslationsHomeStatusEn extends TranslationsHomeStatusZhCn {
  _TranslationsHomeStatusEn._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get open =>
      TranslationOverrides.string(_root.$meta, 'home.status.open', {}) ??
      'Open';

  @override
  String get closed =>
      TranslationOverrides.string(_root.$meta, 'home.status.closed', {}) ??
      'Closed';

  @override
  String get mobilePayment =>
      TranslationOverrides.string(
        _root.$meta,
        'home.status.mobilePayment',
        {},
      ) ??
      'Mobile Payment Supported';
}

// Path: network.errors
class _TranslationsNetworkErrorsEn extends TranslationsNetworkErrorsZhCn {
  _TranslationsNetworkErrorsEn._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get connectionTimeout =>
      TranslationOverrides.string(
        _root.$meta,
        'network.errors.connectionTimeout',
        {},
      ) ??
      'Connection timeout, please check your network';

  @override
  String get sendTimeout =>
      TranslationOverrides.string(
        _root.$meta,
        'network.errors.sendTimeout',
        {},
      ) ??
      'Send timeout, please check your network';

  @override
  String get receiveTimeout =>
      TranslationOverrides.string(
        _root.$meta,
        'network.errors.receiveTimeout',
        {},
      ) ??
      'Receive timeout, please check your network';

  @override
  String get badCertificate =>
      TranslationOverrides.string(
        _root.$meta,
        'network.errors.badCertificate',
        {},
      ) ??
      'Bad certificate';

  @override
  String get cancel =>
      TranslationOverrides.string(_root.$meta, 'network.errors.cancel', {}) ??
      'Request cancelled';

  @override
  String get connectionError =>
      TranslationOverrides.string(
        _root.$meta,
        'network.errors.connectionError',
        {},
      ) ??
      'Connection error, please check your network';

  @override
  String unknown({required Object error}) =>
      TranslationOverrides.string(_root.$meta, 'network.errors.unknown', {
        'error': error,
      }) ??
      'Unknown error: ${error}';

  @override
  String get retryLater =>
      TranslationOverrides.string(
        _root.$meta,
        'network.errors.retryLater',
        {},
      ) ??
      'Please try again later';

  @override
  String get badRequest =>
      TranslationOverrides.string(
        _root.$meta,
        'network.errors.badRequest',
        {},
      ) ??
      'Bad request';

  @override
  String get unauthorized =>
      TranslationOverrides.string(
        _root.$meta,
        'network.errors.unauthorized',
        {},
      ) ??
      'Unauthorized, please login again';

  @override
  String get forbidden =>
      TranslationOverrides.string(
        _root.$meta,
        'network.errors.forbidden',
        {},
      ) ??
      'Forbidden';

  @override
  String get notFound =>
      TranslationOverrides.string(_root.$meta, 'network.errors.notFound', {}) ??
      'Resource not found';

  @override
  String get timeout =>
      TranslationOverrides.string(_root.$meta, 'network.errors.timeout', {}) ??
      'Request timeout, please try again';

  @override
  String get conflict =>
      TranslationOverrides.string(_root.$meta, 'network.errors.conflict', {}) ??
      'Conflict';

  @override
  String get validationFailed =>
      TranslationOverrides.string(
        _root.$meta,
        'network.errors.validationFailed',
        {},
      ) ??
      'Validation failed';

  @override
  String get tooManyRequests =>
      TranslationOverrides.string(
        _root.$meta,
        'network.errors.tooManyRequests',
        {},
      ) ??
      'Too many requests, please try again later';

  @override
  String get internalServerError =>
      TranslationOverrides.string(
        _root.$meta,
        'network.errors.internalServerError',
        {},
      ) ??
      'Internal server error';

  @override
  String get badGateway =>
      TranslationOverrides.string(
        _root.$meta,
        'network.errors.badGateway',
        {},
      ) ??
      'Bad gateway';

  @override
  String get serviceUnavailable =>
      TranslationOverrides.string(
        _root.$meta,
        'network.errors.serviceUnavailable',
        {},
      ) ??
      'Service unavailable';

  @override
  String get gatewayTimeout =>
      TranslationOverrides.string(
        _root.$meta,
        'network.errors.gatewayTimeout',
        {},
      ) ??
      'Gateway timeout';

  @override
  String serverError({required Object code}) =>
      TranslationOverrides.string(_root.$meta, 'network.errors.serverError', {
        'code': code,
      }) ??
      'Server error (${code})';

  @override
  String requestError({required Object code}) =>
      TranslationOverrides.string(_root.$meta, 'network.errors.requestError', {
        'code': code,
      }) ??
      'Request error (${code})';

  @override
  String get failed =>
      TranslationOverrides.string(_root.$meta, 'network.errors.failed', {}) ??
      'Network request failed';
}

// Path: order.status
class _TranslationsOrderStatusEn extends TranslationsOrderStatusZhCn {
  _TranslationsOrderStatusEn._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get all =>
      TranslationOverrides.string(_root.$meta, 'order.status.all', {}) ?? 'All';

  @override
  String get pending =>
      TranslationOverrides.string(_root.$meta, 'order.status.pending', {}) ??
      'Pending';

  @override
  String get paid =>
      TranslationOverrides.string(_root.$meta, 'order.status.paid', {}) ??
      'Paid';

  @override
  String get completed =>
      TranslationOverrides.string(_root.$meta, 'order.status.completed', {}) ??
      'Completed';

  @override
  String get cancelled =>
      TranslationOverrides.string(_root.$meta, 'order.status.cancelled', {}) ??
      'Cancelled';

  @override
  String get refunded =>
      TranslationOverrides.string(_root.$meta, 'order.status.refunded', {}) ??
      'Refunded';

  @override
  String get failed =>
      TranslationOverrides.string(_root.$meta, 'order.status.failed', {}) ??
      'Failed';
}

// Path: home.lottery.prizeStats
class _TranslationsHomeLotteryPrizeStatsEn
    extends TranslationsHomeLotteryPrizeStatsZhCn {
  _TranslationsHomeLotteryPrizeStatsEn._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get total =>
      TranslationOverrides.string(
        _root.$meta,
        'home.lottery.prizeStats.total',
        {},
      ) ??
      'Total';

  @override
  String get used =>
      TranslationOverrides.string(
        _root.$meta,
        'home.lottery.prizeStats.used',
        {},
      ) ??
      'Used';

  @override
  String get available =>
      TranslationOverrides.string(
        _root.$meta,
        'home.lottery.prizeStats.available',
        {},
      ) ??
      'Available';
}

// Path: home.lottery.tabs
class _TranslationsHomeLotteryTabsEn extends TranslationsHomeLotteryTabsZhCn {
  _TranslationsHomeLotteryTabsEn._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get all =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.tabs.all', {}) ??
      'All';

  @override
  String get available =>
      TranslationOverrides.string(
        _root.$meta,
        'home.lottery.tabs.available',
        {},
      ) ??
      'Available';

  @override
  String get used =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.tabs.used', {}) ??
      'Used';

  @override
  String get expired =>
      TranslationOverrides.string(
        _root.$meta,
        'home.lottery.tabs.expired',
        {},
      ) ??
      'Expired';
}

// Path: home.lottery.prizeCard
class _TranslationsHomeLotteryPrizeCardEn
    extends TranslationsHomeLotteryPrizeCardZhCn {
  _TranslationsHomeLotteryPrizeCardEn._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get source =>
      TranslationOverrides.string(
        _root.$meta,
        'home.lottery.prizeCard.source',
        {},
      ) ??
      'Coin rewards, can be used in Coin Mall';

  @override
  String get getTime =>
      TranslationOverrides.string(
        _root.$meta,
        'home.lottery.prizeCard.getTime',
        {},
      ) ??
      'Got at: {time}';

  @override
  String get expiryTime =>
      TranslationOverrides.string(
        _root.$meta,
        'home.lottery.prizeCard.expiryTime',
        {},
      ) ??
      'Expiry: {time}';

  @override
  String get statusExpired =>
      TranslationOverrides.string(
        _root.$meta,
        'home.lottery.prizeCard.statusExpired',
        {},
      ) ??
      'Expired';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
      'auth.loginTitle' =>
        TranslationOverrides.string(_root.$meta, 'auth.loginTitle', {}) ??
            'Welcome Back',
      'auth.loginButton' =>
        TranslationOverrides.string(_root.$meta, 'auth.loginButton', {}) ??
            'Login',
      'auth.registerButton' =>
        TranslationOverrides.string(_root.$meta, 'auth.registerButton', {}) ??
            'Register',
      'auth.forgotPassword' =>
        TranslationOverrides.string(_root.$meta, 'auth.forgotPassword', {}) ??
            'Forgot Password?',
      'auth.loginFailed' =>
        TranslationOverrides.string(_root.$meta, 'auth.loginFailed', {}) ??
            'Login Failed',
      'auth.loginSuccess' =>
        TranslationOverrides.string(_root.$meta, 'auth.loginSuccess', {}) ??
            'Login Success',
      'auth.registerTitle' =>
        TranslationOverrides.string(_root.$meta, 'auth.registerTitle', {}) ??
            'Create Account',
      'auth.nickname' =>
        TranslationOverrides.string(_root.$meta, 'auth.nickname', {}) ??
            'Nickname',
      'auth.registerSuccess' =>
        TranslationOverrides.string(_root.$meta, 'auth.registerSuccess', {}) ??
            'Register Success',
      'auth.registerFailed' =>
        TranslationOverrides.string(_root.$meta, 'auth.registerFailed', {}) ??
            'Register Failed',
      'auth.forgotPasswordTitle' =>
        TranslationOverrides.string(
              _root.$meta,
              'auth.forgotPasswordTitle',
              {},
            ) ??
            'Reset Password',
      'auth.sendResetLink' =>
        TranslationOverrides.string(_root.$meta, 'auth.sendResetLink', {}) ??
            'Send Reset Link',
      'auth.resetLinkSent' =>
        TranslationOverrides.string(_root.$meta, 'auth.resetLinkSent', {}) ??
            'Reset Link Sent',
      'auth.required' =>
        TranslationOverrides.string(_root.$meta, 'auth.required', {}) ??
            'Required',
      'auth.enterUsername' =>
        TranslationOverrides.string(_root.$meta, 'auth.enterUsername', {}) ??
            'Please enter username',
      'auth.enterPassword' =>
        TranslationOverrides.string(_root.$meta, 'auth.enterPassword', {}) ??
            'Please enter password',
      'auth.enterUsernameHint' =>
        TranslationOverrides.string(
              _root.$meta,
              'auth.enterUsernameHint',
              {},
            ) ??
            'Enter username or phone',
      'auth.enterNickname' =>
        TranslationOverrides.string(_root.$meta, 'auth.enterNickname', {}) ??
            'Please enter nickname',
      'auth.dontHaveAccount' =>
        TranslationOverrides.string(_root.$meta, 'auth.dontHaveAccount', {}) ??
            'Don\'t have an account?',
      'auth.resetPasswordHint' =>
        TranslationOverrides.string(
              _root.$meta,
              'auth.resetPasswordHint',
              {},
            ) ??
            'Enter your username or email to reset password',
      'auth.usernameOrEmail' =>
        TranslationOverrides.string(_root.$meta, 'auth.usernameOrEmail', {}) ??
            'Username / Email',
      'auth.slogan' =>
        TranslationOverrides.string(_root.$meta, 'auth.slogan', {}) ??
            'Convenient purchase, delicious on the go',
      'cart.title' =>
        TranslationOverrides.string(_root.$meta, 'cart.title', {}) ?? 'Cart',
      'cart.clear' =>
        TranslationOverrides.string(_root.$meta, 'cart.clear', {}) ?? 'Clear',
      'cart.empty' =>
        TranslationOverrides.string(_root.$meta, 'cart.empty', {}) ??
            'Cart is empty',
      'cart.total' =>
        TranslationOverrides.string(_root.$meta, 'cart.total', {}) ?? 'Total',
      'cart.checkout' =>
        TranslationOverrides.string(_root.$meta, 'cart.checkout', {}) ??
            'Checkout',
      'cart.goShopping' =>
        TranslationOverrides.string(_root.$meta, 'cart.goShopping', {}) ??
            'Go Shopping',
      'city.title' =>
        TranslationOverrides.string(_root.$meta, 'city.title', {}) ??
            'Select City',
      'city.search' =>
        TranslationOverrides.string(_root.$meta, 'city.search', {}) ??
            'Search City',
      'city.hot' =>
        TranslationOverrides.string(_root.$meta, 'city.hot', {}) ??
            'Hot Cities',
      'city.noResult' =>
        TranslationOverrides.string(_root.$meta, 'city.noResult', {}) ??
            'No related cities found',
      'city.viewAll' =>
        TranslationOverrides.string(_root.$meta, 'city.viewAll', {}) ??
            'View All Cities',
      'city.switchSuccess' =>
        TranslationOverrides.string(_root.$meta, 'city.switchSuccess', {}) ??
            'City switched',
      'city.switchedTo' =>
        ({required Object name}) =>
            TranslationOverrides.string(_root.$meta, 'city.switchedTo', {
              'name': name,
            }) ??
            'Switched to ${name}',
      'city.switchFailed' =>
        TranslationOverrides.string(_root.$meta, 'city.switchFailed', {}) ??
            'Switch failed',
      'city.saveFailed' =>
        TranslationOverrides.string(_root.$meta, 'city.saveFailed', {}) ??
            'Unable to save selected city, please try again',
      'common.login' =>
        TranslationOverrides.string(_root.$meta, 'common.login', {}) ?? 'Login',
      'common.register' =>
        TranslationOverrides.string(_root.$meta, 'common.register', {}) ??
            'Register',
      'common.username' =>
        TranslationOverrides.string(_root.$meta, 'common.username', {}) ??
            'Username',
      'common.password' =>
        TranslationOverrides.string(_root.$meta, 'common.password', {}) ??
            'Password',
      'common.confirm' =>
        TranslationOverrides.string(_root.$meta, 'common.confirm', {}) ??
            'Confirm',
      'common.cancel' =>
        TranslationOverrides.string(_root.$meta, 'common.cancel', {}) ??
            'Cancel',
      'common.error' =>
        TranslationOverrides.string(_root.$meta, 'common.error', {}) ?? 'Error',
      'common.success' =>
        TranslationOverrides.string(_root.$meta, 'common.success', {}) ??
            'Success',
      'common.loading' =>
        TranslationOverrides.string(_root.$meta, 'common.loading', {}) ??
            'Loading...',
      'common.ok' =>
        TranslationOverrides.string(_root.$meta, 'common.ok', {}) ?? 'OK',
      'common.save' =>
        TranslationOverrides.string(_root.$meta, 'common.save', {}) ?? 'Save',
      'common.delete' =>
        TranslationOverrides.string(_root.$meta, 'common.delete', {}) ??
            'Delete',
      'common.edit' =>
        TranslationOverrides.string(_root.$meta, 'common.edit', {}) ?? 'Edit',
      'common.search' =>
        TranslationOverrides.string(_root.$meta, 'common.search', {}) ??
            'Search',
      'common.noData' =>
        TranslationOverrides.string(_root.$meta, 'common.noData', {}) ??
            'No Data',
      'common.retry' =>
        TranslationOverrides.string(_root.$meta, 'common.retry', {}) ?? 'Retry',
      'common.skip' =>
        TranslationOverrides.string(_root.$meta, 'common.skip', {}) ?? 'Skip',
      'common.refresh' =>
        TranslationOverrides.string(_root.$meta, 'common.refresh', {}) ??
            'Refresh',
      'common.loadFailed' =>
        TranslationOverrides.string(_root.$meta, 'common.loadFailed', {}) ??
            'Load Failed',
      'common.unknownError' =>
        TranslationOverrides.string(_root.$meta, 'common.unknownError', {}) ??
            'Unknown Error',
      'common.developing' =>
        TranslationOverrides.string(_root.$meta, 'common.developing', {}) ??
            'Page is under development',
      'common.appName' =>
        TranslationOverrides.string(_root.$meta, 'common.appName', {}) ??
            'E-Lunchbox',
      'common.logout' =>
        TranslationOverrides.string(_root.$meta, 'common.logout', {}) ??
            'Logout',
      'common.pullToRefresh' =>
        TranslationOverrides.string(_root.$meta, 'common.pullToRefresh', {}) ??
            'Pull to refresh',
      'common.releaseToRefresh' =>
        TranslationOverrides.string(
              _root.$meta,
              'common.releaseToRefresh',
              {},
            ) ??
            'Release to refresh',
      'community.title' =>
        TranslationOverrides.string(_root.$meta, 'community.title', {}) ??
            'Community Benefits',
      'community.join' =>
        TranslationOverrides.string(_root.$meta, 'community.join', {}) ??
            'Join Community',
      'community.share' =>
        TranslationOverrides.string(_root.$meta, 'community.share', {}) ??
            'Share delicious food with foodies',
      'community.org' =>
        TranslationOverrides.string(_root.$meta, 'community.org', {}) ??
            'Dongguan CAS Cloud Computing Center',
      'community.dept' =>
        TranslationOverrides.string(_root.$meta, 'community.dept', {}) ??
            'Cloud Computing Center',
      'community.scanHint' =>
        TranslationOverrides.string(_root.$meta, 'community.scanHint', {}) ??
            'Scan to join Dongguan CAS Cloud Computing Center',
      'community.features.coupon' =>
        TranslationOverrides.string(
              _root.$meta,
              'community.features.coupon',
              {},
            ) ??
            'Exclusive Coupons',
      'community.features.couponHint' =>
        TranslationOverrides.string(
              _root.$meta,
              'community.features.couponHint',
              {},
            ) ??
            'Exclusive discounts for group members',
      'community.features.tasting' =>
        TranslationOverrides.string(
              _root.$meta,
              'community.features.tasting',
              {},
            ) ??
            'New Product Tasting',
      'community.features.tastingHint' =>
        TranslationOverrides.string(
              _root.$meta,
              'community.features.tastingHint',
              {},
            ) ??
            'Taste the latest food first',
      'community.features.exchange' =>
        TranslationOverrides.string(
              _root.$meta,
              'community.features.exchange',
              {},
            ) ??
            'Food Exchange',
      'community.features.exchangeHint' =>
        TranslationOverrides.string(
              _root.$meta,
              'community.features.exchangeHint',
              {},
            ) ??
            'Share insights with food experts',
      'community.features.priority' =>
        TranslationOverrides.string(
              _root.$meta,
              'community.features.priority',
              {},
            ) ??
            'Priority Access',
      'community.features.priorityHint' =>
        TranslationOverrides.string(
              _root.$meta,
              'community.features.priorityHint',
              {},
            ) ??
            'Priority participation in food events',
      'community.features.activity' =>
        TranslationOverrides.string(
              _root.$meta,
              'community.features.activity',
              {},
            ) ??
            'Community Events',
      'community.features.activityHint' =>
        TranslationOverrides.string(
              _root.$meta,
              'community.features.activityHint',
              {},
            ) ??
            'Regular offline gatherings',
      'community.features.topic' =>
        TranslationOverrides.string(
              _root.$meta,
              'community.features.topic',
              {},
            ) ??
            'Topic Discussion',
      'community.features.topicHint' =>
        TranslationOverrides.string(
              _root.$meta,
              'community.features.topicHint',
              {},
            ) ??
            'Participate in topics to win rewards',
      'community.whyJoin' =>
        TranslationOverrides.string(_root.$meta, 'community.whyJoin', {}) ??
            'Why join our community?',
      'community.reason1' =>
        TranslationOverrides.string(_root.$meta, 'community.reason1', {}) ??
            'Daily food recommendations',
      'community.reason2' =>
        TranslationOverrides.string(_root.$meta, 'community.reason2', {}) ??
            'Limited time offers, save money',
      'community.reason3' =>
        TranslationOverrides.string(_root.$meta, 'community.reason3', {}) ??
            'Professional food reviews',
      'community.reason4' =>
        TranslationOverrides.string(_root.$meta, 'community.reason4', {}) ??
            'Food making tutorials',
      'coupon.title' =>
        TranslationOverrides.string(_root.$meta, 'coupon.title', {}) ??
            'Coupon',
      'coupon.tabs.available' =>
        TranslationOverrides.string(_root.$meta, 'coupon.tabs.available', {}) ??
            'Available',
      'coupon.tabs.received' =>
        TranslationOverrides.string(_root.$meta, 'coupon.tabs.received', {}) ??
            'Received',
      'coupon.tabs.expired' =>
        TranslationOverrides.string(_root.$meta, 'coupon.tabs.expired', {}) ??
            'Expired',
      'coupon.unit' =>
        TranslationOverrides.string(_root.$meta, 'coupon.unit', {}) ?? '\$',
      'coupon.condition' =>
        ({required Object amount}) =>
            TranslationOverrides.string(_root.$meta, 'coupon.condition', {
              'amount': amount,
            }) ??
            'Coupon\nOver ${amount}',
      'coupon.conditionNoThreshold' =>
        TranslationOverrides.string(
              _root.$meta,
              'coupon.conditionNoThreshold',
              {},
            ) ??
            'Coupon\nNo threshold',
      'coupon.validForever' =>
        TranslationOverrides.string(_root.$meta, 'coupon.validForever', {}) ??
            'Valid Forever',
      'coupon.btnReceive' =>
        TranslationOverrides.string(_root.$meta, 'coupon.btnReceive', {}) ??
            'Receive',
      'coupon.btnReceived' =>
        TranslationOverrides.string(_root.$meta, 'coupon.btnReceived', {}) ??
            'Received',
      'coupon.btnUse' =>
        TranslationOverrides.string(_root.$meta, 'coupon.btnUse', {}) ?? 'Use',
      'coupon.btnExpired' =>
        TranslationOverrides.string(_root.$meta, 'coupon.btnExpired', {}) ??
            'Expired',
      'coupon.discount' =>
        ({required Object amount}) =>
            TranslationOverrides.string(_root.$meta, 'coupon.discount', {
              'amount': amount,
            }) ??
            '\$ ${amount} Coupon',
      'coupon.discountOff' =>
        ({required Object amount}) =>
            TranslationOverrides.string(_root.$meta, 'coupon.discountOff', {
              'amount': amount,
            }) ??
            '\$ ${amount} Off',
      'device.title' =>
        TranslationOverrides.string(_root.$meta, 'device.title', {}) ??
            'Device Detail',
      'device.info' =>
        TranslationOverrides.string(_root.$meta, 'device.info', {}) ??
            'Device Information',
      'device.address' =>
        TranslationOverrides.string(_root.$meta, 'device.address', {}) ??
            'Address',
      'device.distance' =>
        TranslationOverrides.string(_root.$meta, 'device.distance', {}) ??
            'Distance',
      'device.status' =>
        TranslationOverrides.string(_root.$meta, 'device.status', {}) ??
            'Status',
      'device.online' =>
        TranslationOverrides.string(_root.$meta, 'device.online', {}) ??
            'Online',
      'device.offline' =>
        TranslationOverrides.string(_root.$meta, 'device.offline', {}) ??
            'Offline',
      'device.paymentMethods' =>
        TranslationOverrides.string(_root.$meta, 'device.paymentMethods', {}) ??
            'Payment Methods: ',
      'device.mobilePayment' =>
        TranslationOverrides.string(_root.$meta, 'device.mobilePayment', {}) ??
            'Mobile Payment',
      'device.cash' =>
        TranslationOverrides.string(_root.$meta, 'device.cash', {}) ?? 'Cash',
      'device.noProducts' =>
        TranslationOverrides.string(_root.$meta, 'device.noProducts', {}) ??
            'No products',
      'device.productList' =>
        TranslationOverrides.string(_root.$meta, 'device.productList', {}) ??
            'Product List',
      'device.soldOut' =>
        TranslationOverrides.string(_root.$meta, 'device.soldOut', {}) ??
            'Sold Out',
      'device.reportIssue' =>
        TranslationOverrides.string(_root.$meta, 'device.reportIssue', {}) ??
            'Report Issue',
      'device.reportDeviceIssue' =>
        TranslationOverrides.string(
              _root.$meta,
              'device.reportDeviceIssue',
              {},
            ) ??
            'Report Device Issue',
      'device.reportIssueHint' =>
        TranslationOverrides.string(
              _root.$meta,
              'device.reportIssueHint',
              {},
            ) ??
            'Please describe the issue...',
      'device.reportSuccess' =>
        TranslationOverrides.string(_root.$meta, 'device.reportSuccess', {}) ??
            'Issue reported successfully',
      'device.loadFailed' =>
        ({required Object error}) =>
            TranslationOverrides.string(_root.$meta, 'device.loadFailed', {
              'error': error,
            }) ??
            'Load failed: ${error}',
      'device.loadProductsFailed' =>
        ({required Object error}) =>
            TranslationOverrides.string(
              _root.$meta,
              'device.loadProductsFailed',
              {'error': error},
            ) ??
            'Load products failed: ${error}',
      'device.nearby' =>
        TranslationOverrides.string(_root.$meta, 'device.nearby', {}) ??
            'Nearby Devices',
      'device.sortByDistance' =>
        TranslationOverrides.string(_root.$meta, 'device.sortByDistance', {}) ??
            'Sort by Distance',
      'device.sortByName' =>
        TranslationOverrides.string(_root.$meta, 'device.sortByName', {}) ??
            'Sort by Name',
      'device.filterOnline' =>
        TranslationOverrides.string(_root.$meta, 'device.filterOnline', {}) ??
            'Show Online Only',
      'device.noDevicesNearby' =>
        TranslationOverrides.string(
              _root.$meta,
              'device.noDevicesNearby',
              {},
            ) ??
            'No devices nearby',
      'device.maintenance' =>
        TranslationOverrides.string(_root.$meta, 'device.maintenance', {}) ??
            'Maintenance',
      'device.unknown' =>
        TranslationOverrides.string(_root.$meta, 'device.unknown', {}) ??
            'Unknown',
      'device.cashPayment' =>
        TranslationOverrides.string(_root.$meta, 'device.cashPayment', {}) ??
            'Cash Payment',
      'device_info.browser' =>
        TranslationOverrides.string(_root.$meta, 'device_info.browser', {}) ??
            'Browser',
      'device_info.platform' =>
        TranslationOverrides.string(_root.$meta, 'device_info.platform', {}) ??
            'Platform',
      'device_info.userAgent' =>
        TranslationOverrides.string(_root.$meta, 'device_info.userAgent', {}) ??
            'User Agent',
      'device_info.language' =>
        TranslationOverrides.string(_root.$meta, 'device_info.language', {}) ??
            'Language',
      'device_info.memory' =>
        TranslationOverrides.string(_root.$meta, 'device_info.memory', {}) ??
            'Memory',
      'device_info.brand' =>
        TranslationOverrides.string(_root.$meta, 'device_info.brand', {}) ??
            'Brand',
      'device_info.model' =>
        TranslationOverrides.string(_root.$meta, 'device_info.model', {}) ??
            'Model',
      'device_info.systemVersion' =>
        TranslationOverrides.string(
              _root.$meta,
              'device_info.systemVersion',
              {},
            ) ??
            'System Version',
      'device_info.sdkVersion' =>
        TranslationOverrides.string(
              _root.$meta,
              'device_info.sdkVersion',
              {},
            ) ??
            'SDK Version',
      'device_info.manufacturer' =>
        TranslationOverrides.string(
              _root.$meta,
              'device_info.manufacturer',
              {},
            ) ??
            'Manufacturer',
      'device_info.hardware' =>
        TranslationOverrides.string(_root.$meta, 'device_info.hardware', {}) ??
            'Hardware',
      'device_info.host' =>
        TranslationOverrides.string(_root.$meta, 'device_info.host', {}) ??
            'Host',
      'device_info.id' =>
        TranslationOverrides.string(_root.$meta, 'device_info.id', {}) ?? 'ID',
      'device_info.name' =>
        TranslationOverrides.string(_root.$meta, 'device_info.name', {}) ??
            'Name',
      'device_info.systemName' =>
        TranslationOverrides.string(
              _root.$meta,
              'device_info.systemName',
              {},
            ) ??
            'System Name',
      'device_info.machine' =>
        TranslationOverrides.string(_root.$meta, 'device_info.machine', {}) ??
            'Machine',
      'device_info.uniqueId' =>
        TranslationOverrides.string(_root.$meta, 'device_info.uniqueId', {}) ??
            'Unique ID',
      'help.title' =>
        TranslationOverrides.string(_root.$meta, 'help.title', {}) ??
            'Help Center',
      'help.developing' =>
        TranslationOverrides.string(_root.$meta, 'help.developing', {}) ??
            'Help page is under development',
      'home.selectCity' =>
        TranslationOverrides.string(_root.$meta, 'home.selectCity', {}) ??
            'Select City',
      'home.nearbyDevices' =>
        TranslationOverrides.string(_root.$meta, 'home.nearbyDevices', {}) ??
            'Nearby Devices',
      'home.banner1Title' =>
        TranslationOverrides.string(_root.$meta, 'home.banner1Title', {}) ??
            'Convenient',
      'home.banner1Subtitle' =>
        TranslationOverrides.string(_root.$meta, 'home.banner1Subtitle', {}) ??
            'Delicious on the go',
      'home.banner2Title' =>
        TranslationOverrides.string(_root.$meta, 'home.banner2Title', {}) ??
            'Fresh Delivery',
      'home.banner2Subtitle' =>
        TranslationOverrides.string(_root.$meta, 'home.banner2Subtitle', {}) ??
            'Daily Updates',
      'home.banner3Title' =>
        TranslationOverrides.string(_root.$meta, 'home.banner3Title', {}) ??
            'Best Offers',
      'home.banner3Subtitle' =>
        TranslationOverrides.string(_root.$meta, 'home.banner3Subtitle', {}) ??
            'Limited Time Only',
      'home.noDevices' =>
        TranslationOverrides.string(_root.$meta, 'home.noDevices', {}) ??
            'No devices nearby',
      'home.welcome' =>
        TranslationOverrides.string(_root.$meta, 'home.welcome', {}) ??
            'Hello, User',
      'home.selfPickup' =>
        TranslationOverrides.string(_root.$meta, 'home.selfPickup', {}) ??
            'Self Pickup',
      'home.selfPickupHint' =>
        TranslationOverrides.string(_root.$meta, 'home.selfPickupHint', {}) ??
            'Scan code to pick up/Take away',
      'home.teamOrder' =>
        TranslationOverrides.string(_root.$meta, 'home.teamOrder', {}) ??
            'Team Order',
      'home.teamOrderHint' =>
        TranslationOverrides.string(_root.$meta, 'home.teamOrderHint', {}) ??
            'Group ordering/Team meal',
      'home.invite' =>
        TranslationOverrides.string(_root.$meta, 'home.invite', {}) ??
            'Invite & Earn',
      'home.inviteHint' =>
        TranslationOverrides.string(_root.$meta, 'home.inviteHint', {}) ??
            'Invite friends to get cash',
      'home.recommendTitle' =>
        TranslationOverrides.string(_root.$meta, 'home.recommendTitle', {}) ??
            'Recommended for Me',
      'home.grid.welfare' =>
        TranslationOverrides.string(_root.$meta, 'home.grid.welfare', {}) ??
            'Welfare',
      'home.grid.service' =>
        TranslationOverrides.string(_root.$meta, 'home.grid.service', {}) ??
            'Service',
      'home.grid.coupon' =>
        TranslationOverrides.string(_root.$meta, 'home.grid.coupon', {}) ??
            'Coupons',
      'home.grid.lottery' =>
        TranslationOverrides.string(_root.$meta, 'home.grid.lottery', {}) ??
            'Lucky Draw',
      'home.grid.invite' =>
        TranslationOverrides.string(_root.$meta, 'home.grid.invite', {}) ??
            'Invite Friends',
      'home.lottery.title' =>
        TranslationOverrides.string(_root.$meta, 'home.lottery.title', {}) ??
            'Lucky Draw',
      'home.lottery.prizes' =>
        TranslationOverrides.string(_root.$meta, 'home.lottery.prizes', {}) ??
            'My Prizes',
      'home.lottery.rules' =>
        TranslationOverrides.string(_root.$meta, 'home.lottery.rules', {}) ??
            'Draw Rules',
      'home.lottery.remaining' =>
        TranslationOverrides.string(
              _root.$meta,
              'home.lottery.remaining',
              {},
            ) ??
            'Remaining: {count}',
      'home.lottery.spin' =>
        TranslationOverrides.string(_root.$meta, 'home.lottery.spin', {}) ??
            'Spin',
      'home.lottery.rule1' =>
        TranslationOverrides.string(_root.$meta, 'home.lottery.rule1', {}) ??
            'Free draws daily, complete tasks for more',
      'home.lottery.rule2' =>
        TranslationOverrides.string(_root.$meta, 'home.lottery.rule2', {}) ??
            'Coupons valid for 48h, Coins added automatically',
      'home.lottery.rule3' =>
        TranslationOverrides.string(_root.$meta, 'home.lottery.rule3', {}) ??
            'Platform reserves all rights',
      'home.lottery.prizeUnit' =>
        TranslationOverrides.string(
              _root.$meta,
              'home.lottery.prizeUnit',
              {},
            ) ??
            'Coins',
      'home.lottery.prizeList' =>
        TranslationOverrides.string(
              _root.$meta,
              'home.lottery.prizeList',
              {},
            ) ??
            'Prize List',
      'home.lottery.back' =>
        TranslationOverrides.string(_root.$meta, 'home.lottery.back', {}) ??
            'Back',
      'home.lottery.prizeStats.total' =>
        TranslationOverrides.string(
              _root.$meta,
              'home.lottery.prizeStats.total',
              {},
            ) ??
            'Total',
      'home.lottery.prizeStats.used' =>
        TranslationOverrides.string(
              _root.$meta,
              'home.lottery.prizeStats.used',
              {},
            ) ??
            'Used',
      'home.lottery.prizeStats.available' =>
        TranslationOverrides.string(
              _root.$meta,
              'home.lottery.prizeStats.available',
              {},
            ) ??
            'Available',
      'home.lottery.tabs.all' =>
        TranslationOverrides.string(_root.$meta, 'home.lottery.tabs.all', {}) ??
            'All',
      'home.lottery.tabs.available' =>
        TranslationOverrides.string(
              _root.$meta,
              'home.lottery.tabs.available',
              {},
            ) ??
            'Available',
      'home.lottery.tabs.used' =>
        TranslationOverrides.string(
              _root.$meta,
              'home.lottery.tabs.used',
              {},
            ) ??
            'Used',
      'home.lottery.tabs.expired' =>
        TranslationOverrides.string(
              _root.$meta,
              'home.lottery.tabs.expired',
              {},
            ) ??
            'Expired',
      'home.lottery.prizeCard.source' =>
        TranslationOverrides.string(
              _root.$meta,
              'home.lottery.prizeCard.source',
              {},
            ) ??
            'Coin rewards, can be used in Coin Mall',
      'home.lottery.prizeCard.getTime' =>
        TranslationOverrides.string(
              _root.$meta,
              'home.lottery.prizeCard.getTime',
              {},
            ) ??
            'Got at: {time}',
      'home.lottery.prizeCard.expiryTime' =>
        TranslationOverrides.string(
              _root.$meta,
              'home.lottery.prizeCard.expiryTime',
              {},
            ) ??
            'Expiry: {time}',
      'home.lottery.prizeCard.statusExpired' =>
        TranslationOverrides.string(
              _root.$meta,
              'home.lottery.prizeCard.statusExpired',
              {},
            ) ??
            'Expired',
      'home.status.open' =>
        TranslationOverrides.string(_root.$meta, 'home.status.open', {}) ??
            'Open',
      'home.status.closed' =>
        TranslationOverrides.string(_root.$meta, 'home.status.closed', {}) ??
            'Closed',
      'home.status.mobilePayment' =>
        TranslationOverrides.string(
              _root.$meta,
              'home.status.mobilePayment',
              {},
            ) ??
            'Mobile Payment Supported',
      'navigation.home' =>
        TranslationOverrides.string(_root.$meta, 'navigation.home', {}) ??
            'Home',
      'navigation.device' =>
        TranslationOverrides.string(_root.$meta, 'navigation.device', {}) ??
            'Device',
      'navigation.orders' =>
        TranslationOverrides.string(_root.$meta, 'navigation.orders', {}) ??
            'Orders',
      'navigation.profile' =>
        TranslationOverrides.string(_root.$meta, 'navigation.profile', {}) ??
            'Profile',
      'network.errors.connectionTimeout' =>
        TranslationOverrides.string(
              _root.$meta,
              'network.errors.connectionTimeout',
              {},
            ) ??
            'Connection timeout, please check your network',
      'network.errors.sendTimeout' =>
        TranslationOverrides.string(
              _root.$meta,
              'network.errors.sendTimeout',
              {},
            ) ??
            'Send timeout, please check your network',
      'network.errors.receiveTimeout' =>
        TranslationOverrides.string(
              _root.$meta,
              'network.errors.receiveTimeout',
              {},
            ) ??
            'Receive timeout, please check your network',
      'network.errors.badCertificate' =>
        TranslationOverrides.string(
              _root.$meta,
              'network.errors.badCertificate',
              {},
            ) ??
            'Bad certificate',
      'network.errors.cancel' =>
        TranslationOverrides.string(_root.$meta, 'network.errors.cancel', {}) ??
            'Request cancelled',
      'network.errors.connectionError' =>
        TranslationOverrides.string(
              _root.$meta,
              'network.errors.connectionError',
              {},
            ) ??
            'Connection error, please check your network',
      'network.errors.unknown' =>
        ({required Object error}) =>
            TranslationOverrides.string(_root.$meta, 'network.errors.unknown', {
              'error': error,
            }) ??
            'Unknown error: ${error}',
      'network.errors.retryLater' =>
        TranslationOverrides.string(
              _root.$meta,
              'network.errors.retryLater',
              {},
            ) ??
            'Please try again later',
      'network.errors.badRequest' =>
        TranslationOverrides.string(
              _root.$meta,
              'network.errors.badRequest',
              {},
            ) ??
            'Bad request',
      'network.errors.unauthorized' =>
        TranslationOverrides.string(
              _root.$meta,
              'network.errors.unauthorized',
              {},
            ) ??
            'Unauthorized, please login again',
      'network.errors.forbidden' =>
        TranslationOverrides.string(
              _root.$meta,
              'network.errors.forbidden',
              {},
            ) ??
            'Forbidden',
      'network.errors.notFound' =>
        TranslationOverrides.string(
              _root.$meta,
              'network.errors.notFound',
              {},
            ) ??
            'Resource not found',
      'network.errors.timeout' =>
        TranslationOverrides.string(
              _root.$meta,
              'network.errors.timeout',
              {},
            ) ??
            'Request timeout, please try again',
      'network.errors.conflict' =>
        TranslationOverrides.string(
              _root.$meta,
              'network.errors.conflict',
              {},
            ) ??
            'Conflict',
      'network.errors.validationFailed' =>
        TranslationOverrides.string(
              _root.$meta,
              'network.errors.validationFailed',
              {},
            ) ??
            'Validation failed',
      'network.errors.tooManyRequests' =>
        TranslationOverrides.string(
              _root.$meta,
              'network.errors.tooManyRequests',
              {},
            ) ??
            'Too many requests, please try again later',
      'network.errors.internalServerError' =>
        TranslationOverrides.string(
              _root.$meta,
              'network.errors.internalServerError',
              {},
            ) ??
            'Internal server error',
      'network.errors.badGateway' =>
        TranslationOverrides.string(
              _root.$meta,
              'network.errors.badGateway',
              {},
            ) ??
            'Bad gateway',
      'network.errors.serviceUnavailable' =>
        TranslationOverrides.string(
              _root.$meta,
              'network.errors.serviceUnavailable',
              {},
            ) ??
            'Service unavailable',
      'network.errors.gatewayTimeout' =>
        TranslationOverrides.string(
              _root.$meta,
              'network.errors.gatewayTimeout',
              {},
            ) ??
            'Gateway timeout',
      'network.errors.serverError' =>
        ({required Object code}) =>
            TranslationOverrides.string(
              _root.$meta,
              'network.errors.serverError',
              {'code': code},
            ) ??
            'Server error (${code})',
      'network.errors.requestError' =>
        ({required Object code}) =>
            TranslationOverrides.string(
              _root.$meta,
              'network.errors.requestError',
              {'code': code},
            ) ??
            'Request error (${code})',
      'network.errors.failed' =>
        TranslationOverrides.string(_root.$meta, 'network.errors.failed', {}) ??
            'Network request failed',
      'onboarding.welcomeTitle' =>
        TranslationOverrides.string(
              _root.$meta,
              'onboarding.welcomeTitle',
              {},
            ) ??
            'Welcome to E-Lunchbox',
      'onboarding.welcomeBody' =>
        TranslationOverrides.string(
              _root.$meta,
              'onboarding.welcomeBody',
              {},
            ) ??
            'Anytime, anywhere, easily buy delicious lunch',
      'onboarding.findDevicesTitle' =>
        TranslationOverrides.string(
              _root.$meta,
              'onboarding.findDevicesTitle',
              {},
            ) ??
            'Find Nearby Devices',
      'onboarding.findDevicesBody' =>
        TranslationOverrides.string(
              _root.$meta,
              'onboarding.findDevicesBody',
              {},
            ) ??
            'Quickly locate the nearest vending machine and save your time',
      'onboarding.paymentTitle' =>
        TranslationOverrides.string(
              _root.$meta,
              'onboarding.paymentTitle',
              {},
            ) ??
            'Convenient Payment',
      'onboarding.paymentBody' =>
        TranslationOverrides.string(
              _root.$meta,
              'onboarding.paymentBody',
              {},
            ) ??
            'Supports multiple convenient payment methods like credit cards',
      'onboarding.getStarted' =>
        TranslationOverrides.string(_root.$meta, 'onboarding.getStarted', {}) ??
            'Get Started',
      'order.myOrders' =>
        TranslationOverrides.string(_root.$meta, 'order.myOrders', {}) ??
            'My Orders',
      'order.noOrders' =>
        TranslationOverrides.string(_root.$meta, 'order.noOrders', {}) ??
            'No Orders',
      'order.detail' =>
        TranslationOverrides.string(_root.$meta, 'order.detail', {}) ??
            'Order Detail',
      'order.status.all' =>
        TranslationOverrides.string(_root.$meta, 'order.status.all', {}) ??
            'All',
      'order.status.pending' =>
        TranslationOverrides.string(_root.$meta, 'order.status.pending', {}) ??
            'Pending',
      'order.status.paid' =>
        TranslationOverrides.string(_root.$meta, 'order.status.paid', {}) ??
            'Paid',
      'order.status.completed' =>
        TranslationOverrides.string(
              _root.$meta,
              'order.status.completed',
              {},
            ) ??
            'Completed',
      'order.status.cancelled' =>
        TranslationOverrides.string(
              _root.$meta,
              'order.status.cancelled',
              {},
            ) ??
            'Cancelled',
      'order.status.refunded' =>
        TranslationOverrides.string(_root.$meta, 'order.status.refunded', {}) ??
            'Refunded',
      'order.status.failed' =>
        TranslationOverrides.string(_root.$meta, 'order.status.failed', {}) ??
            'Failed',
      'order.pickupCode' =>
        TranslationOverrides.string(_root.$meta, 'order.pickupCode', {}) ??
            'Pickup Code',
      'order.pickupHint' =>
        TranslationOverrides.string(_root.$meta, 'order.pickupHint', {}) ??
            'Enter code on device to pick up',
      'order.items' =>
        TranslationOverrides.string(_root.$meta, 'order.items', {}) ??
            'Item List',
      'order.info' =>
        TranslationOverrides.string(_root.$meta, 'order.info', {}) ??
            'Order Info',
      'order.id' =>
        TranslationOverrides.string(_root.$meta, 'order.id', {}) ?? 'Order ID',
      'order.createdAt' =>
        TranslationOverrides.string(_root.$meta, 'order.createdAt', {}) ??
            'Created At',
      'order.paidAt' =>
        TranslationOverrides.string(_root.$meta, 'order.paidAt', {}) ??
            'Paid At',
      'order.paymentMethod' =>
        TranslationOverrides.string(_root.$meta, 'order.paymentMethod', {}) ??
            'Payment Method',
      'order.totalAmount' =>
        TranslationOverrides.string(_root.$meta, 'order.totalAmount', {}) ??
            'Total Amount',
      'order.unknown' =>
        TranslationOverrides.string(_root.$meta, 'order.unknown', {}) ??
            'Unknown',
      'order.refresh' =>
        TranslationOverrides.string(_root.$meta, 'order.refresh', {}) ??
            'Refresh',
      'order.itemsCount' =>
        ({required Object count}) =>
            TranslationOverrides.string(_root.$meta, 'order.itemsCount', {
              'count': count,
            }) ??
            'and ${count} other items',
      'order.orderIdLabel' =>
        TranslationOverrides.string(_root.$meta, 'order.orderIdLabel', {}) ??
            'Order ID: ',
      'order.orderAmount' =>
        TranslationOverrides.string(_root.$meta, 'order.orderAmount', {}) ??
            'Order Amount',
      'order.cancelOrder' =>
        TranslationOverrides.string(_root.$meta, 'order.cancelOrder', {}) ??
            'Cancel Order',
      'order.payNow' =>
        TranslationOverrides.string(_root.$meta, 'order.payNow', {}) ??
            'Pay Now',
      'order.viewDetail' =>
        TranslationOverrides.string(_root.$meta, 'order.viewDetail', {}) ??
            'View Details',
      'order.cancelConfirmTitle' =>
        TranslationOverrides.string(
              _root.$meta,
              'order.cancelConfirmTitle',
              {},
            ) ??
            'Confirm Cancel',
      'order.cancelConfirmContent' =>
        TranslationOverrides.string(
              _root.$meta,
              'order.cancelConfirmContent',
              {},
            ) ??
            'Are you sure you want to cancel this order?',
      'order.orderCancelled' =>
        TranslationOverrides.string(_root.$meta, 'order.orderCancelled', {}) ??
            'Order cancelled',
      'order.confirmOrder' =>
        TranslationOverrides.string(_root.$meta, 'order.confirmOrder', {}) ??
            'Confirm Order',
      'order.actualAmount' =>
        TranslationOverrides.string(_root.$meta, 'order.actualAmount', {}) ??
            'Actual Amount',
      'order.totalLabel' =>
        TranslationOverrides.string(_root.$meta, 'order.totalLabel', {}) ??
            'Total: ',
      'order.submitOrder' =>
        TranslationOverrides.string(_root.$meta, 'order.submitOrder', {}) ??
            'Submit Order',
      'order.createFailed' =>
        ({required Object error}) =>
            TranslationOverrides.string(_root.$meta, 'order.createFailed', {
              'error': error,
            }) ??
            'Create order failed: ${error}',
      'payment.checkout' =>
        TranslationOverrides.string(_root.$meta, 'payment.checkout', {}) ??
            'Checkout',
      'payment.success' =>
        TranslationOverrides.string(_root.$meta, 'payment.success', {}) ??
            'Payment Successful',
      'payment.orderNotFound' =>
        TranslationOverrides.string(_root.$meta, 'payment.orderNotFound', {}) ??
            'Order Not Found',
      'payment.payNow' =>
        TranslationOverrides.string(_root.$meta, 'payment.payNow', {}) ??
            'Pay Now',
      'payment.initializing' =>
        TranslationOverrides.string(_root.$meta, 'payment.initializing', {}) ??
            'Initializing payment...',
      'payment.cancelTitle' =>
        TranslationOverrides.string(_root.$meta, 'payment.cancelTitle', {}) ??
            'Cancel Payment',
      'payment.cancelContent' =>
        TranslationOverrides.string(_root.$meta, 'payment.cancelContent', {}) ??
            'Are you sure you want to cancel? Order will be cancelled',
      'payment.continuePay' =>
        TranslationOverrides.string(_root.$meta, 'payment.continuePay', {}) ??
            'Continue Payment',
      'payment.cancelPay' =>
        TranslationOverrides.string(_root.$meta, 'payment.cancelPay', {}) ??
            'Cancel Payment',
      'payment.amount' =>
        TranslationOverrides.string(_root.$meta, 'payment.amount', {}) ??
            'Payment Amount',
      'payment.remainingTime' =>
        TranslationOverrides.string(_root.$meta, 'payment.remainingTime', {}) ??
            'Time Remaining',
      'product.title' =>
        TranslationOverrides.string(_root.$meta, 'product.title', {}) ??
            'Product List',
      'product.detail' =>
        TranslationOverrides.string(_root.$meta, 'product.detail', {}) ??
            'Product Detail',
      'product.hot' =>
        TranslationOverrides.string(_root.$meta, 'product.hot', {}) ?? 'Hot',
      'product.promotion' =>
        TranslationOverrides.string(_root.$meta, 'product.promotion', {}) ??
            'Sale',
      'product.discountOff' =>
        ({required Object percent}) =>
            TranslationOverrides.string(_root.$meta, 'product.discountOff', {
              'percent': percent,
            }) ??
            '${percent}% OFF',
      'product.stockFull' =>
        TranslationOverrides.string(_root.$meta, 'product.stockFull', {}) ??
            'In Stock',
      'product.stockEmpty' =>
        TranslationOverrides.string(_root.$meta, 'product.stockEmpty', {}) ??
            'Out of Stock',
      'product.addToCart' =>
        TranslationOverrides.string(_root.$meta, 'product.addToCart', {}) ??
            'Add to Cart',
      'product.addedToCart' =>
        TranslationOverrides.string(_root.$meta, 'product.addedToCart', {}) ??
            'Added to Cart',
      'product.specifications' =>
        TranslationOverrides.string(
              _root.$meta,
              'product.specifications',
              {},
            ) ??
            'Specifications',
      'product.categoryAll' =>
        TranslationOverrides.string(_root.$meta, 'product.categoryAll', {}) ??
            'All',
      'product.categoryFood' =>
        TranslationOverrides.string(_root.$meta, 'product.categoryFood', {}) ??
            'Food',
      'product.categoryDrink' =>
        TranslationOverrides.string(_root.$meta, 'product.categoryDrink', {}) ??
            'Drink',
      'product.categorySnack' =>
        TranslationOverrides.string(_root.$meta, 'product.categorySnack', {}) ??
            'Snack',
      'product.sortDefault' =>
        TranslationOverrides.string(_root.$meta, 'product.sortDefault', {}) ??
            'Default',
      'product.sortPriceAsc' =>
        TranslationOverrides.string(_root.$meta, 'product.sortPriceAsc', {}) ??
            'Price: Low to High',
      'product.sortPriceDesc' =>
        TranslationOverrides.string(_root.$meta, 'product.sortPriceDesc', {}) ??
            'Price: High to Low',
      'product.sortName' =>
        TranslationOverrides.string(_root.$meta, 'product.sortName', {}) ??
            'Name',
      'product.filterOnlyAvailable' =>
        TranslationOverrides.string(
              _root.$meta,
              'product.filterOnlyAvailable',
              {},
            ) ??
            'Show Available Only',
      'product.cart' =>
        TranslationOverrides.string(_root.$meta, 'product.cart', {}) ?? 'Cart',
      'profile.title' =>
        TranslationOverrides.string(_root.$meta, 'profile.title', {}) ??
            'User Center',
      'profile.notLoggedIn' =>
        TranslationOverrides.string(_root.$meta, 'profile.notLoggedIn', {}) ??
            'Not Logged In',
      'profile.editProfile' =>
        TranslationOverrides.string(_root.$meta, 'profile.editProfile', {}) ??
            'Edit Profile',
      'profile.logout' =>
        TranslationOverrides.string(_root.$meta, 'profile.logout', {}) ??
            'Logout',
      'profile.favoriteDevices' =>
        TranslationOverrides.string(
              _root.$meta,
              'profile.favoriteDevices',
              {},
            ) ??
            'Favorite Devices',
      'profile.personalInfo' =>
        TranslationOverrides.string(_root.$meta, 'profile.personalInfo', {}) ??
            'Personal Info',
      'profile.confirmLogout' =>
        TranslationOverrides.string(_root.$meta, 'profile.confirmLogout', {}) ??
            'Confirm Logout',
      'profile.confirmLogoutContent' =>
        TranslationOverrides.string(
              _root.$meta,
              'profile.confirmLogoutContent',
              {},
            ) ??
            'Are you sure you want to logout?',
      'profile.clearCacheConfirm' =>
        TranslationOverrides.string(
              _root.$meta,
              'profile.clearCacheConfirm',
              {},
            ) ??
            'Are you sure you want to clear all cache data?',
      'profile.noFavoriteDevices' =>
        TranslationOverrides.string(
              _root.$meta,
              'profile.noFavoriteDevices',
              {},
            ) ??
            'No favorite devices',
      'profile.removeFavorite' =>
        TranslationOverrides.string(
              _root.$meta,
              'profile.removeFavorite',
              {},
            ) ??
            'Unfavorite',
      'profile.removeFavoriteConfirm' =>
        ({required Object name}) =>
            TranslationOverrides.string(
              _root.$meta,
              'profile.removeFavoriteConfirm',
              {'name': name},
            ) ??
            'Are you sure you want to unfavorite "${name}"?',
      'profile.appDescription' =>
        TranslationOverrides.string(
              _root.$meta,
              'profile.appDescription',
              {},
            ) ??
            'A convenient vending machine purchasing application',
      'profile.version' =>
        ({required Object version}) =>
            TranslationOverrides.string(_root.$meta, 'profile.version', {
              'version': version,
            }) ??
            'Version: ${version}',
      'settings.title' =>
        TranslationOverrides.string(_root.$meta, 'settings.title', {}) ??
            'Settings',
      'settings.general' =>
        TranslationOverrides.string(_root.$meta, 'settings.general', {}) ??
            'General',
      'settings.theme' =>
        TranslationOverrides.string(_root.$meta, 'settings.theme', {}) ??
            'Theme Mode',
      'settings.themeLight' =>
        TranslationOverrides.string(_root.$meta, 'settings.themeLight', {}) ??
            'Light',
      'settings.themeDark' =>
        TranslationOverrides.string(_root.$meta, 'settings.themeDark', {}) ??
            'Dark',
      'settings.themeSystem' =>
        TranslationOverrides.string(_root.$meta, 'settings.themeSystem', {}) ??
            'System',
      'settings.language' =>
        TranslationOverrides.string(_root.$meta, 'settings.language', {}) ??
            'Language',
      'settings.checkUpdate' =>
        TranslationOverrides.string(_root.$meta, 'settings.checkUpdate', {}) ??
            'Check Update',
      'settings.clearCache' =>
        TranslationOverrides.string(_root.$meta, 'settings.clearCache', {}) ??
            'Clear Cache',
      'settings.about' =>
        TranslationOverrides.string(_root.$meta, 'settings.about', {}) ??
            'About',
      'settings.deviceInfo' =>
        TranslationOverrides.string(_root.$meta, 'settings.deviceInfo', {}) ??
            'Device Info',
      'settings.aboutUs' =>
        TranslationOverrides.string(_root.$meta, 'settings.aboutUs', {}) ??
            'About Us',
      'settings.checkingUpdate' =>
        TranslationOverrides.string(
              _root.$meta,
              'settings.checkingUpdate',
              {},
            ) ??
            'Checking for updates...',
      'settings.cacheCleared' =>
        TranslationOverrides.string(_root.$meta, 'settings.cacheCleared', {}) ??
            'Cache cleared',
      'settings.english' =>
        TranslationOverrides.string(_root.$meta, 'settings.english', {}) ??
            'English',
      'settings.chinese' =>
        TranslationOverrides.string(_root.$meta, 'settings.chinese', {}) ??
            'Simplified Chinese',
      'settings.traditionalChinese' =>
        TranslationOverrides.string(
              _root.$meta,
              'settings.traditionalChinese',
              {},
            ) ??
            'Traditional Chinese',
      'settings.appName' =>
        TranslationOverrides.string(_root.$meta, 'settings.appName', {}) ??
            'App Name',
      'settings.packageName' =>
        TranslationOverrides.string(_root.$meta, 'settings.packageName', {}) ??
            'Package Name',
      'settings.versionName' =>
        TranslationOverrides.string(_root.$meta, 'settings.versionName', {}) ??
            'Version Name',
      'settings.buildNumber' =>
        TranslationOverrides.string(_root.$meta, 'settings.buildNumber', {}) ??
            'Build Number',
      'settings.copyright' =>
        TranslationOverrides.string(_root.$meta, 'settings.copyright', {}) ??
            '© 2024 Lunchbox Team',
      'splash.starting' =>
        TranslationOverrides.string(_root.$meta, 'splash.starting', {}) ??
            'Starting...',
      'splash.checkingServices' =>
        TranslationOverrides.string(
              _root.$meta,
              'splash.checkingServices',
              {},
            ) ??
            'Checking services...',
      'splash.loadingConfig' =>
        TranslationOverrides.string(_root.$meta, 'splash.loadingConfig', {}) ??
            'Loading config...',
      'splash.checkingAuth' =>
        TranslationOverrides.string(_root.$meta, 'splash.checkingAuth', {}) ??
            'Checking auth status...',
      'splash.preparingData' =>
        TranslationOverrides.string(_root.$meta, 'splash.preparingData', {}) ??
            'Preparing data...',
      'splash.ready' =>
        TranslationOverrides.string(_root.$meta, 'splash.ready', {}) ?? 'Ready',
      'splash.failed' =>
        TranslationOverrides.string(_root.$meta, 'splash.failed', {}) ??
            'Start Failed',
      'time.justNow' =>
        TranslationOverrides.string(_root.$meta, 'time.justNow', {}) ??
            'Just now',
      'time.minutesAgo' =>
        ({required Object minutes}) =>
            TranslationOverrides.string(_root.$meta, 'time.minutesAgo', {
              'minutes': minutes,
            }) ??
            '${minutes} mins ago',
      'time.hoursAgo' =>
        ({required Object hours}) =>
            TranslationOverrides.string(_root.$meta, 'time.hoursAgo', {
              'hours': hours,
            }) ??
            '${hours} hours ago',
      'time.daysAgo' =>
        ({required Object days}) =>
            TranslationOverrides.string(_root.$meta, 'time.daysAgo', {
              'days': days,
            }) ??
            '${days} days ago',
      _ => null,
    };
  }
}
