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
class TranslationsEn extends Translations
    with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsEn({Map<String,
      Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<
      AppLocale,
      Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
      ),
        super(cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver) {
    super.$meta.setFlatMapFunction(
        $meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
  @override dynamic operator [](String key) =>
      $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

  late final TranslationsEn _root = this; // ignore: unused_field

  @override
  TranslationsEn $copyWith(
      {TranslationMetadata<AppLocale, Translations>? meta}) =>
      TranslationsEn(meta: meta ?? this.$meta);

	// Translations
  @override late final _TranslationsCommonEn common = _TranslationsCommonEn._(
      _root);
  @override late final _TranslationsNavigationEn navigation = _TranslationsNavigationEn
      ._(_root);
  @override late final _TranslationsAuthEn auth = _TranslationsAuthEn._(_root);
  @override late final _TranslationsHomeEn home = _TranslationsHomeEn._(_root);
  @override late final _TranslationsProductEn product = _TranslationsProductEn
      ._(_root);
  @override late final _TranslationsCartEn cart = _TranslationsCartEn._(_root);
  @override late final _TranslationsOrderEn order = _TranslationsOrderEn._(
      _root);
  @override late final _TranslationsPaymentEn payment = _TranslationsPaymentEn
      ._(_root);
  @override late final _TranslationsSplashEn splash = _TranslationsSplashEn._(
      _root);
  @override late final _TranslationsProfileEn profile = _TranslationsProfileEn
      ._(_root);
  @override late final _TranslationsTimeEn time = _TranslationsTimeEn._(_root);
  @override late final _TranslationsSettingsEn settings = _TranslationsSettingsEn
      ._(_root);
  @override late final _TranslationsDeviceInfoEn device_info = _TranslationsDeviceInfoEn
      ._(_root);
  @override late final _TranslationsHelpEn help = _TranslationsHelpEn._(_root);
  @override late final _TranslationsOnboardingEn onboarding = _TranslationsOnboardingEn
      ._(_root);
  @override late final _TranslationsCityEn city = _TranslationsCityEn._(_root);
  @override late final _TranslationsDeviceEn device = _TranslationsDeviceEn._(
      _root);
  @override late final _TranslationsNetworkEn network = _TranslationsNetworkEn
      ._(_root);
  @override late final _TranslationsCouponEn coupon = _TranslationsCouponEn._(
      _root);
  @override late final _TranslationsCommunityEn community = _TranslationsCommunityEn
      ._(_root);
}

// Path: common
class _TranslationsCommonEn extends TranslationsCommonZhCn {
  _TranslationsCommonEn._(TranslationsEn root)
      : this._root = root,
        super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

	// Translations
  @override String get login => 'Login';

  @override String get register => 'Register';

  @override String get username => 'Username';

  @override String get password => 'Password';

  @override String get confirm => 'Confirm';

  @override String get cancel => 'Cancel';

  @override String get error => 'Error';

  @override String get success => 'Success';

  @override String get loading => 'Loading...';

  @override String get ok => 'OK';

  @override String get save => 'Save';

  @override String get delete => 'Delete';

  @override String get edit => 'Edit';

  @override String get search => 'Search';

  @override String get noData => 'No Data';

  @override String get retry => 'Retry';

  @override String get skip => 'Skip';

  @override String get refresh => 'Refresh';

  @override String get loadFailed => 'Load Failed';

  @override String get unknownError => 'Unknown Error';

  @override String get developing => 'Page is under development';

  @override String get appName => 'E-Lunchbox';

  @override String get logout => 'Logout';
}

// Path: navigation
class _TranslationsNavigationEn extends TranslationsNavigationZhCn {
  _TranslationsNavigationEn._(TranslationsEn root)
      : this._root = root,
        super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override String get home => 'Home';

  @override String get device => 'Device';

  @override String get orders => 'Orders';

  @override String get profile => 'Profile';
}

// Path: auth
class _TranslationsAuthEn extends TranslationsAuthZhCn {
  _TranslationsAuthEn._(TranslationsEn root)
      : this._root = root,
        super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override String get loginTitle => 'Welcome Back';

  @override String get loginButton => 'Login';

  @override String get registerButton => 'Register';

  @override String get forgotPassword => 'Forgot Password?';

  @override String get loginFailed => 'Login Failed';

  @override String get loginSuccess => 'Login Success';

  @override String get registerTitle => 'Create Account';

  @override String get nickname => 'Nickname';

  @override String get registerSuccess => 'Register Success';

  @override String get registerFailed => 'Register Failed';

  @override String get forgotPasswordTitle => 'Reset Password';

  @override String get sendResetLink => 'Send Reset Link';

  @override String get resetLinkSent => 'Reset Link Sent';

  @override String get required => 'Required';

  @override String get enterUsername => 'Please enter username';

  @override String get enterPassword => 'Please enter password';

  @override String get enterUsernameHint => 'Enter username or phone';

  @override String get enterNickname => 'Please enter nickname';

  @override String get dontHaveAccount => 'Don\'t have an account?';

  @override String get resetPasswordHint =>
      'Enter your username or email to reset password';

  @override String get usernameOrEmail => 'Username / Email';

  @override String get slogan => 'Convenient purchase, delicious on the go';
}

// Path: home
class _TranslationsHomeEn extends TranslationsHomeZhCn {
  _TranslationsHomeEn._(TranslationsEn root)
      : this._root = root,
        super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override String get selectCity => 'Select City';

  @override String get nearbyDevices => 'Nearby Devices';

  @override String get banner1Title => 'Convenient';

  @override String get banner1Subtitle => 'Delicious on the go';

  @override String get banner2Title => 'Fresh Delivery';

  @override String get banner2Subtitle => 'Daily Updates';

  @override String get banner3Title => 'Best Offers';

  @override String get banner3Subtitle => 'Limited Time Only';

  @override String get noDevices => 'No devices nearby';

  @override String get welcome => 'Hello, User';

  @override String get selfPickup => 'Self Pickup';

  @override String get selfPickupHint => 'Scan code to pick up/Take away';

  @override String get teamOrder => 'Team Order';

  @override String get teamOrderHint => 'Group ordering/Team meal';

  @override String get invite => 'Invite & Earn';

  @override String get inviteHint => 'Invite friends to get cash';

  @override String get recommendTitle => 'Recommended for Me';
  @override late final _TranslationsHomeGridEn grid = _TranslationsHomeGridEn._(
      _root);
  @override late final _TranslationsHomeLotteryEn lottery = _TranslationsHomeLotteryEn
      ._(_root);
  @override late final _TranslationsHomeStatusEn status = _TranslationsHomeStatusEn
      ._(_root);
}

// Path: product
class _TranslationsProductEn extends TranslationsProductZhCn {
  _TranslationsProductEn._(TranslationsEn root)
      : this._root = root,
        super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override String get title => 'Product List';

  @override String get detail => 'Product Detail';

  @override String get hot => 'Hot';

  @override String get promotion => 'Sale';

  @override String discountOff({required Object percent}) => '${percent}% OFF';

  @override String get stockFull => 'In Stock';

  @override String get stockEmpty => 'Out of Stock';

  @override String get addToCart => 'Add to Cart';

  @override String get addedToCart => 'Added to Cart';

  @override String get specifications => 'Specifications';

  @override String get categoryAll => 'All';

  @override String get categoryFood => 'Food';

  @override String get categoryDrink => 'Drink';

  @override String get categorySnack => 'Snack';

  @override String get sortDefault => 'Default';

  @override String get sortPriceAsc => 'Price: Low to High';

  @override String get sortPriceDesc => 'Price: High to Low';

  @override String get sortName => 'Name';

  @override String get filterOnlyAvailable => 'Show Available Only';

  @override String get cart => 'Cart';
}

// Path: cart
class _TranslationsCartEn extends TranslationsCartZhCn {
  _TranslationsCartEn._(TranslationsEn root)
      : this._root = root,
        super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override String get title => 'Cart';

  @override String get clear => 'Clear';

  @override String get empty => 'Cart is empty';

  @override String get total => 'Total';

  @override String get checkout => 'Checkout';

  @override String get goShopping => 'Go Shopping';
}

// Path: order
class _TranslationsOrderEn extends TranslationsOrderZhCn {
  _TranslationsOrderEn._(TranslationsEn root)
      : this._root = root,
        super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override String get myOrders => 'My Orders';

  @override String get noOrders => 'No Orders';

  @override String get detail => 'Order Detail';
  @override late final _TranslationsOrderStatusEn status = _TranslationsOrderStatusEn
      ._(_root);

  @override String get pickupCode => 'Pickup Code';

  @override String get pickupHint => 'Enter code on device to pick up';

  @override String get items => 'Item List';

  @override String get info => 'Order Info';

  @override String get id => 'Order ID';

  @override String get createdAt => 'Created At';

  @override String get paidAt => 'Paid At';

  @override String get paymentMethod => 'Payment Method';

  @override String get totalAmount => 'Total Amount';

  @override String get unknown => 'Unknown';

  @override String get refresh => 'Refresh';

  @override String itemsCount({required Object count}) =>
      'and ${count} other items';

  @override String get orderIdLabel => 'Order ID: ';

  @override String get orderAmount => 'Order Amount';

  @override String get cancelOrder => 'Cancel Order';

  @override String get payNow => 'Pay Now';

  @override String get viewDetail => 'View Details';

  @override String get cancelConfirmTitle => 'Confirm Cancel';

  @override String get cancelConfirmContent =>
      'Are you sure you want to cancel this order?';

  @override String get orderCancelled => 'Order cancelled';

  @override String get confirmOrder => 'Confirm Order';

  @override String get actualAmount => 'Actual Amount';

  @override String get totalLabel => 'Total: ';

  @override String get submitOrder => 'Submit Order';

  @override String createFailed({required Object error}) =>
      'Create order failed: ${error}';
}

// Path: payment
class _TranslationsPaymentEn extends TranslationsPaymentZhCn {
  _TranslationsPaymentEn._(TranslationsEn root)
      : this._root = root,
        super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override String get checkout => 'Checkout';

  @override String get success => 'Payment Successful';

  @override String get orderNotFound => 'Order Not Found';

  @override String get payNow => 'Pay Now';

  @override String get initializing => 'Initializing payment...';

  @override String get cancelTitle => 'Cancel Payment';

  @override String get cancelContent =>
      'Are you sure you want to cancel? Order will be cancelled';

  @override String get continuePay => 'Continue Payment';

  @override String get cancelPay => 'Cancel Payment';

  @override String get amount => 'Payment Amount';

  @override String get remainingTime => 'Time Remaining';
}

// Path: splash
class _TranslationsSplashEn extends TranslationsSplashZhCn {
  _TranslationsSplashEn._(TranslationsEn root)
      : this._root = root,
        super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override String get starting => 'Starting...';

  @override String get checkingServices => 'Checking services...';

  @override String get loadingConfig => 'Loading config...';

  @override String get checkingAuth => 'Checking auth status...';

  @override String get preparingData => 'Preparing data...';

  @override String get ready => 'Ready';

  @override String get failed => 'Start Failed';
}

// Path: profile
class _TranslationsProfileEn extends TranslationsProfileZhCn {
  _TranslationsProfileEn._(TranslationsEn root)
      : this._root = root,
        super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

	// Translations
  @override String get title => 'User Center';

  @override String get notLoggedIn => 'Not Logged In';

  @override String get editProfile => 'Edit Profile';

  @override String get logout => 'Logout';

  @override String get favoriteDevices => 'Favorite Devices';

  @override String get personalInfo => 'Personal Info';

  @override String get confirmLogout => 'Confirm Logout';

  @override String get confirmLogoutContent =>
      'Are you sure you want to logout?';

  @override String get clearCacheConfirm =>
      'Are you sure you want to clear all cache data?';

  @override String get noFavoriteDevices => 'No favorite devices';

  @override String get removeFavorite => 'Unfavorite';

  @override String removeFavoriteConfirm({required Object name}) =>
      'Are you sure you want to unfavorite "${name}"?';

  @override String get appDescription =>
      'A convenient vending machine purchasing application';

  @override String version({required Object version}) => 'Version: ${version}';
}

// Path: time
class _TranslationsTimeEn extends TranslationsTimeZhCn {
  _TranslationsTimeEn._(TranslationsEn root)
      : this._root = root,
        super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

	// Translations
  @override String get justNow => 'Just now';

  @override String minutesAgo({required Object minutes}) =>
      '${minutes} mins ago';

  @override String hoursAgo({required Object hours}) => '${hours} hours ago';

  @override String daysAgo({required Object days}) => '${days} days ago';
}

// Path: settings
class _TranslationsSettingsEn extends TranslationsSettingsZhCn {
  _TranslationsSettingsEn._(TranslationsEn root)
      : this._root = root,
        super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override String get title => 'Settings';

  @override String get general => 'General';

  @override String get theme => 'Theme Mode';

  @override String get themeLight => 'Light';

  @override String get themeDark => 'Dark';

  @override String get themeSystem => 'System';

  @override String get language => 'Language';

  @override String get checkUpdate => 'Check Update';

  @override String get clearCache => 'Clear Cache';

  @override String get about => 'About';

  @override String get deviceInfo => 'Device Info';

  @override String get aboutUs => 'About Us';

  @override String get checkingUpdate => 'Checking for updates...';

  @override String get cacheCleared => 'Cache cleared';

  @override String get english => 'English';

  @override String get chinese => 'Simplified Chinese';

  @override String get appName => 'App Name';

  @override String get packageName => 'Package Name';

  @override String get versionName => 'Version Name';

  @override String get buildNumber => 'Build Number';

  @override String get copyright => '© 2024 Lunchbox Team';
}

// Path: device_info
class _TranslationsDeviceInfoEn extends TranslationsDeviceInfoZhCn {
  _TranslationsDeviceInfoEn._(TranslationsEn root)
      : this._root = root,
        super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override String get browser => 'Browser';

  @override String get platform => 'Platform';

  @override String get userAgent => 'User Agent';

  @override String get language => 'Language';

  @override String get memory => 'Memory';

  @override String get brand => 'Brand';

  @override String get model => 'Model';

  @override String get systemVersion => 'System Version';

  @override String get sdkVersion => 'SDK Version';

  @override String get manufacturer => 'Manufacturer';

  @override String get hardware => 'Hardware';

  @override String get host => 'Host';

  @override String get id => 'ID';

  @override String get name => 'Name';

  @override String get systemName => 'System Name';

  @override String get machine => 'Machine';

  @override String get uniqueId => 'Unique ID';
}

// Path: help
class _TranslationsHelpEn extends TranslationsHelpZhCn {
  _TranslationsHelpEn._(TranslationsEn root)
      : this._root = root,
        super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override String get title => 'Help Center';

  @override String get developing => 'Help page is under development';
}

// Path: onboarding
class _TranslationsOnboardingEn extends TranslationsOnboardingZhCn {
  _TranslationsOnboardingEn._(TranslationsEn root)
      : this._root = root,
        super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override String get welcomeTitle => 'Welcome to E-Lunchbox';

  @override String get welcomeBody =>
      'Anytime, anywhere, easily buy delicious lunch';

  @override String get findDevicesTitle => 'Find Nearby Devices';

  @override String get findDevicesBody =>
      'Quickly locate the nearest vending machine and save your time';

  @override String get paymentTitle => 'Convenient Payment';

  @override String get paymentBody =>
      'Supports multiple convenient payment methods like credit cards';

  @override String get getStarted => 'Get Started';
}

// Path: city
class _TranslationsCityEn extends TranslationsCityZhCn {
  _TranslationsCityEn._(TranslationsEn root)
      : this._root = root,
        super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override String get title => 'Select City';

  @override String get search => 'Search City';

  @override String get hot => 'Hot Cities';

  @override String get noResult => 'No related cities found';

  @override String get viewAll => 'View All Cities';

  @override String get switchSuccess => 'City switched';

  @override String switchedTo({required Object name}) => 'Switched to ${name}';

  @override String get switchFailed => 'Switch failed';

  @override String get saveFailed =>
      'Unable to save selected city, please try again';
}

// Path: device
class _TranslationsDeviceEn extends TranslationsDeviceZhCn {
  _TranslationsDeviceEn._(TranslationsEn root)
      : this._root = root,
        super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override String get title => 'Device Detail';

  @override String get info => 'Device Information';

  @override String get address => 'Address';

  @override String get distance => 'Distance';

  @override String get status => 'Status';

  @override String get online => 'Online';

  @override String get offline => 'Offline';

  @override String get paymentMethods => 'Payment Methods: ';

  @override String get mobilePayment => 'Mobile Payment';

  @override String get cash => 'Cash';

  @override String get noProducts => 'No products';

  @override String get productList => 'Product List';

  @override String get soldOut => 'Sold Out';

  @override String get reportIssue => 'Report Issue';

  @override String get reportDeviceIssue => 'Report Device Issue';

  @override String get reportIssueHint => 'Please describe the issue...';

  @override String get reportSuccess => 'Issue reported successfully';

  @override String loadFailed({required Object error}) =>
      'Load failed: ${error}';

  @override String loadProductsFailed({required Object error}) =>
      'Load products failed: ${error}';

  @override String get nearby => 'Nearby Devices';

  @override String get sortByDistance => 'Sort by Distance';

  @override String get sortByName => 'Sort by Name';

  @override String get filterOnline => 'Show Online Only';

  @override String get noDevicesNearby => 'No devices nearby';

  @override String get maintenance => 'Maintenance';

  @override String get unknown => 'Unknown';

  @override String get cashPayment => 'Cash Payment';
}

// Path: network
class _TranslationsNetworkEn extends TranslationsNetworkZhCn {
  _TranslationsNetworkEn._(TranslationsEn root)
      : this._root = root,
        super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override late final _TranslationsNetworkErrorsEn errors = _TranslationsNetworkErrorsEn
      ._(_root);
}

// Path: coupon
class _TranslationsCouponEn extends TranslationsCouponZhCn {
  _TranslationsCouponEn._(TranslationsEn root)
      : this._root = root,
        super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override String get title => 'Coupon';
  @override late final _TranslationsCouponTabsEn tabs = _TranslationsCouponTabsEn
      ._(_root);

  @override String get unit => '\$';

  @override String condition({required Object amount}) =>
      'Coupon\nOver ${amount}';

  @override String get conditionNoThreshold => 'Coupon\nNo threshold';

  @override String get validForever => 'Valid Forever';

  @override String get btnReceive => 'Receive';

  @override String get btnReceived => 'Received';

  @override String get btnUse => 'Use';

  @override String get btnExpired => 'Expired';

  @override String discount({required Object amount}) => '\$ ${amount} Coupon';

  @override String discountOff({required Object amount}) => '\$ ${amount} Off';
}

// Path: community
class _TranslationsCommunityEn extends TranslationsCommunityZhCn {
  _TranslationsCommunityEn._(TranslationsEn root)
      : this._root = root,
        super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override String get title => 'Community Benefits';

  @override String get join => 'Join Community';

  @override String get share => 'Share delicious food with foodies';

  @override String get org => 'Dongguan CAS Cloud Computing Center';

  @override String get dept => 'Cloud Computing Center';

  @override String get scanHint =>
      'Scan to join Dongguan CAS Cloud Computing Center';
  @override late final _TranslationsCommunityFeaturesEn features = _TranslationsCommunityFeaturesEn
      ._(_root);

  @override String get whyJoin => 'Why join our community?';

  @override String get reason1 => 'Daily food recommendations';

  @override String get reason2 => 'Limited time offers, save money';

  @override String get reason3 => 'Professional food reviews';

  @override String get reason4 => 'Food making tutorials';
}

// Path: home.grid
class _TranslationsHomeGridEn extends TranslationsHomeGridZhCn {
  _TranslationsHomeGridEn._(TranslationsEn root)
      : this._root = root,
        super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override String get welfare => 'Welfare';

  @override String get service => 'Service';

  @override String get coupon => 'Coupons';

  @override String get lottery => 'Lucky Draw';

  @override String get invite => 'Invite Friends';
}

// Path: home.lottery
class _TranslationsHomeLotteryEn extends TranslationsHomeLotteryZhCn {
  _TranslationsHomeLotteryEn._(TranslationsEn root)
      : this._root = root,
        super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override String get title => 'Lucky Draw';

  @override String get prizes => 'My Prizes';

  @override String get rules => 'Draw Rules';

  @override String get remaining => 'Remaining: {count}';

  @override String get spin => 'Spin';

  @override String get rule1 => 'Free draws daily, complete tasks for more';

  @override String get rule2 =>
      'Coupons valid for 48h, Coins added automatically';

  @override String get rule3 => 'Platform reserves all rights';

  @override String get prizeUnit => 'Coins';

  @override String get prizeList => 'Prize List';

  @override String get back => 'Back';
  @override late final _TranslationsHomeLotteryPrizeStatsEn prizeStats = _TranslationsHomeLotteryPrizeStatsEn
      ._(_root);
  @override late final _TranslationsHomeLotteryTabsEn tabs = _TranslationsHomeLotteryTabsEn
      ._(_root);
  @override late final _TranslationsHomeLotteryPrizeCardEn prizeCard = _TranslationsHomeLotteryPrizeCardEn
      ._(_root);
}

// Path: home.status
class _TranslationsHomeStatusEn extends TranslationsHomeStatusZhCn {
  _TranslationsHomeStatusEn._(TranslationsEn root)
      : this._root = root,
        super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override String get open => 'Open';

  @override String get closed => 'Closed';

  @override String get mobilePayment => 'Mobile Payment Supported';
}

// Path: order.status
class _TranslationsOrderStatusEn extends TranslationsOrderStatusZhCn {
  _TranslationsOrderStatusEn._(TranslationsEn root)
      : this._root = root,
        super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override String get all => 'All';

  @override String get pending => 'Pending';

  @override String get paid => 'Paid';

  @override String get completed => 'Completed';

  @override String get cancelled => 'Cancelled';

  @override String get refunded => 'Refunded';

  @override String get failed => 'Failed';
}

// Path: network.errors
class _TranslationsNetworkErrorsEn extends TranslationsNetworkErrorsZhCn {
  _TranslationsNetworkErrorsEn._(TranslationsEn root)
      : this._root = root,
        super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override String get connectionTimeout =>
      'Connection timeout, please check your network';

  @override String get sendTimeout => 'Send timeout, please check your network';

  @override String get receiveTimeout =>
      'Receive timeout, please check your network';

  @override String get badCertificate => 'Bad certificate';

  @override String get cancel => 'Request cancelled';

  @override String get connectionError =>
      'Connection error, please check your network';

  @override String unknown({required Object error}) =>
      'Unknown error: ${error}';

  @override String get retryLater => 'Please try again later';

  @override String get badRequest => 'Bad request';

  @override String get unauthorized => 'Unauthorized, please login again';

  @override String get forbidden => 'Forbidden';

  @override String get notFound => 'Resource not found';

  @override String get timeout => 'Request timeout, please try again';

  @override String get conflict => 'Conflict';

  @override String get validationFailed => 'Validation failed';

  @override String get tooManyRequests =>
      'Too many requests, please try again later';

  @override String get internalServerError => 'Internal server error';

  @override String get badGateway => 'Bad gateway';

  @override String get serviceUnavailable => 'Service unavailable';

  @override String get gatewayTimeout => 'Gateway timeout';

  @override String serverError({required Object code}) =>
      'Server error (${code})';

  @override String requestError({required Object code}) =>
      'Request error (${code})';

  @override String get failed => 'Network request failed';
}

// Path: coupon.tabs
class _TranslationsCouponTabsEn extends TranslationsCouponTabsZhCn {
  _TranslationsCouponTabsEn._(TranslationsEn root)
      : this._root = root,
        super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override String get available => 'Available';

  @override String get received => 'Received';

  @override String get expired => 'Expired';
}

// Path: community.features
class _TranslationsCommunityFeaturesEn
    extends TranslationsCommunityFeaturesZhCn {
  _TranslationsCommunityFeaturesEn._(TranslationsEn root)
      : this._root = root,
        super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override String get coupon => 'Exclusive Coupons';

  @override String get couponHint => 'Exclusive discounts for group members';

  @override String get tasting => 'New Product Tasting';

  @override String get tastingHint => 'Taste the latest food first';

  @override String get exchange => 'Food Exchange';

  @override String get exchangeHint => 'Share insights with food experts';

  @override String get priority => 'Priority Access';

  @override String get priorityHint => 'Priority participation in food events';

  @override String get activity => 'Community Events';

  @override String get activityHint => 'Regular offline gatherings';

  @override String get topic => 'Topic Discussion';

  @override String get topicHint => 'Participate in topics to win rewards';
}

// Path: home.lottery.prizeStats
class _TranslationsHomeLotteryPrizeStatsEn
    extends TranslationsHomeLotteryPrizeStatsZhCn {
  _TranslationsHomeLotteryPrizeStatsEn._(TranslationsEn root)
      : this._root = root,
        super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override String get total => 'Total';

  @override String get used => 'Used';

  @override String get available => 'Available';
}

// Path: home.lottery.tabs
class _TranslationsHomeLotteryTabsEn extends TranslationsHomeLotteryTabsZhCn {
  _TranslationsHomeLotteryTabsEn._(TranslationsEn root)
      : this._root = root,
        super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override String get all => 'All';

  @override String get available => 'Available';

  @override String get used => 'Used';

  @override String get expired => 'Expired';
}

// Path: home.lottery.prizeCard
class _TranslationsHomeLotteryPrizeCardEn
    extends TranslationsHomeLotteryPrizeCardZhCn {
  _TranslationsHomeLotteryPrizeCardEn._(TranslationsEn root)
      : this._root = root,
        super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override String get source => 'Coin rewards, can be used in Coin Mall';

  @override String get getTime => 'Got at: {time}';

  @override String get expiryTime => 'Expiry: {time}';

  @override String get statusExpired => 'Expired';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.login' => 'Login',
			'common.register' => 'Register',
			'common.username' => 'Username',
			'common.password' => 'Password',
			'common.confirm' => 'Confirm',
			'common.cancel' => 'Cancel',
			'common.error' => 'Error',
			'common.success' => 'Success',
			'common.loading' => 'Loading...',
      'common.ok' => 'OK',
      'common.save' => 'Save',
      'common.delete' => 'Delete',
      'common.edit' => 'Edit',
      'common.search' => 'Search',
      'common.noData' => 'No Data',
      'common.retry' => 'Retry',
      'common.skip' => 'Skip',
      'common.refresh' => 'Refresh',
      'common.loadFailed' => 'Load Failed',
      'common.unknownError' => 'Unknown Error',
      'common.developing' => 'Page is under development',
      'common.appName' => 'E-Lunchbox',
      'common.logout' => 'Logout',
      'navigation.home' => 'Home',
      'navigation.device' => 'Device',
      'navigation.orders' => 'Orders',
      'navigation.profile' => 'Profile',
			'auth.loginTitle' => 'Welcome Back',
			'auth.loginButton' => 'Login',
			'auth.registerButton' => 'Register',
			'auth.forgotPassword' => 'Forgot Password?',
			'auth.loginFailed' => 'Login Failed',
      'auth.loginSuccess' => 'Login Success',
      'auth.registerTitle' => 'Create Account',
      'auth.nickname' => 'Nickname',
      'auth.registerSuccess' => 'Register Success',
      'auth.registerFailed' => 'Register Failed',
      'auth.forgotPasswordTitle' => 'Reset Password',
      'auth.sendResetLink' => 'Send Reset Link',
      'auth.resetLinkSent' => 'Reset Link Sent',
      'auth.required' => 'Required',
      'auth.enterUsername' => 'Please enter username',
      'auth.enterPassword' => 'Please enter password',
      'auth.enterUsernameHint' => 'Enter username or phone',
      'auth.enterNickname' => 'Please enter nickname',
      'auth.dontHaveAccount' => 'Don\'t have an account?',
      'auth.resetPasswordHint' => 'Enter your username or email to reset password',
      'auth.usernameOrEmail' => 'Username / Email',
      'auth.slogan' => 'Convenient purchase, delicious on the go',
      'home.selectCity' => 'Select City',
      'home.nearbyDevices' => 'Nearby Devices',
      'home.banner1Title' => 'Convenient',
      'home.banner1Subtitle' => 'Delicious on the go',
      'home.banner2Title' => 'Fresh Delivery',
      'home.banner2Subtitle' => 'Daily Updates',
      'home.banner3Title' => 'Best Offers',
      'home.banner3Subtitle' => 'Limited Time Only',
      'home.noDevices' => 'No devices nearby',
      'home.welcome' => 'Hello, User',
      'home.selfPickup' => 'Self Pickup',
      'home.selfPickupHint' => 'Scan code to pick up/Take away',
      'home.teamOrder' => 'Team Order',
      'home.teamOrderHint' => 'Group ordering/Team meal',
      'home.invite' => 'Invite & Earn',
      'home.inviteHint' => 'Invite friends to get cash',
      'home.recommendTitle' => 'Recommended for Me',
      'home.grid.welfare' => 'Welfare',
      'home.grid.service' => 'Service',
      'home.grid.coupon' => 'Coupons',
      'home.grid.lottery' => 'Lucky Draw',
      'home.grid.invite' => 'Invite Friends',
      'home.lottery.title' => 'Lucky Draw',
      'home.lottery.prizes' => 'My Prizes',
      'home.lottery.rules' => 'Draw Rules',
      'home.lottery.remaining' => 'Remaining: {count}',
      'home.lottery.spin' => 'Spin',
      'home.lottery.rule1' => 'Free draws daily, complete tasks for more',
      'home.lottery.rule2' => 'Coupons valid for 48h, Coins added automatically',
      'home.lottery.rule3' => 'Platform reserves all rights',
      'home.lottery.prizeUnit' => 'Coins',
      'home.lottery.prizeList' => 'Prize List',
      'home.lottery.back' => 'Back',
      'home.lottery.prizeStats.total' => 'Total',
      'home.lottery.prizeStats.used' => 'Used',
      'home.lottery.prizeStats.available' => 'Available',
      'home.lottery.tabs.all' => 'All',
      'home.lottery.tabs.available' => 'Available',
      'home.lottery.tabs.used' => 'Used',
      'home.lottery.tabs.expired' => 'Expired',
      'home.lottery.prizeCard.source' => 'Coin rewards, can be used in Coin Mall',
      'home.lottery.prizeCard.getTime' => 'Got at: {time}',
      'home.lottery.prizeCard.expiryTime' => 'Expiry: {time}',
      'home.lottery.prizeCard.statusExpired' => 'Expired',
      'home.status.open' => 'Open',
      'home.status.closed' => 'Closed',
      'home.status.mobilePayment' => 'Mobile Payment Supported',
      'product.title' => 'Product List',
      'product.detail' => 'Product Detail',
      'product.hot' => 'Hot',
      'product.promotion' => 'Sale',
      'product.discountOff' => ({required Object percent}) => '${percent}% OFF',
      'product.stockFull' => 'In Stock',
      'product.stockEmpty' => 'Out of Stock',
      'product.addToCart' => 'Add to Cart',
      'product.addedToCart' => 'Added to Cart',
      'product.specifications' => 'Specifications',
      'product.categoryAll' => 'All',
      'product.categoryFood' => 'Food',
      'product.categoryDrink' => 'Drink',
      'product.categorySnack' => 'Snack',
      'product.sortDefault' => 'Default',
      'product.sortPriceAsc' => 'Price: Low to High',
      'product.sortPriceDesc' => 'Price: High to Low',
      'product.sortName' => 'Name',
      'product.filterOnlyAvailable' => 'Show Available Only',
      'product.cart' => 'Cart',
      'cart.title' => 'Cart',
      'cart.clear' => 'Clear',
      'cart.empty' => 'Cart is empty',
      'cart.total' => 'Total',
      'cart.checkout' => 'Checkout',
      'cart.goShopping' => 'Go Shopping',
      'order.myOrders' => 'My Orders',
      'order.noOrders' => 'No Orders',
      'order.detail' => 'Order Detail',
      'order.status.all' => 'All',
      'order.status.pending' => 'Pending',
      'order.status.paid' => 'Paid',
      'order.status.completed' => 'Completed',
      'order.status.cancelled' => 'Cancelled',
      'order.status.refunded' => 'Refunded',
      'order.status.failed' => 'Failed',
      'order.pickupCode' => 'Pickup Code',
      'order.pickupHint' => 'Enter code on device to pick up',
      'order.items' => 'Item List',
      'order.info' => 'Order Info',
      'order.id' => 'Order ID',
      'order.createdAt' => 'Created At',
      'order.paidAt' => 'Paid At',
      'order.paymentMethod' => 'Payment Method',
      'order.totalAmount' => 'Total Amount',
      'order.unknown' => 'Unknown',
      'order.refresh' => 'Refresh',
      'order.itemsCount' =>
          ({required Object count}) => 'and ${count} other items',
      'order.orderIdLabel' => 'Order ID: ',
      'order.orderAmount' => 'Order Amount',
      'order.cancelOrder' => 'Cancel Order',
      'order.payNow' => 'Pay Now',
      'order.viewDetail' => 'View Details',
      'order.cancelConfirmTitle' => 'Confirm Cancel',
      'order.cancelConfirmContent' => 'Are you sure you want to cancel this order?',
      'order.orderCancelled' => 'Order cancelled',
      'order.confirmOrder' => 'Confirm Order',
      'order.actualAmount' => 'Actual Amount',
      'order.totalLabel' => 'Total: ',
      'order.submitOrder' => 'Submit Order',
      'order.createFailed' =>
          ({required Object error}) => 'Create order failed: ${error}',
      'payment.checkout' => 'Checkout',
      'payment.success' => 'Payment Successful',
      'payment.orderNotFound' => 'Order Not Found',
      'payment.payNow' => 'Pay Now',
      'payment.initializing' => 'Initializing payment...',
      'payment.cancelTitle' => 'Cancel Payment',
      'payment.cancelContent' => 'Are you sure you want to cancel? Order will be cancelled',
      'payment.continuePay' => 'Continue Payment',
      'payment.cancelPay' => 'Cancel Payment',
      'payment.amount' => 'Payment Amount',
      'payment.remainingTime' => 'Time Remaining',
      'splash.starting' => 'Starting...',
      'splash.checkingServices' => 'Checking services...',
      'splash.loadingConfig' => 'Loading config...',
      'splash.checkingAuth' => 'Checking auth status...',
      'splash.preparingData' => 'Preparing data...',
      'splash.ready' => 'Ready',
      'splash.failed' => 'Start Failed',
      'profile.title' => 'User Center',
      'profile.notLoggedIn' => 'Not Logged In',
      'profile.editProfile' => 'Edit Profile',
      'profile.logout' => 'Logout',
      'profile.favoriteDevices' => 'Favorite Devices',
      'profile.personalInfo' => 'Personal Info',
      'profile.confirmLogout' => 'Confirm Logout',
      'profile.confirmLogoutContent' => 'Are you sure you want to logout?',
      'profile.clearCacheConfirm' => 'Are you sure you want to clear all cache data?',
      'profile.noFavoriteDevices' => 'No favorite devices',
      'profile.removeFavorite' => 'Unfavorite',
      'profile.removeFavoriteConfirm' =>
          (
          {required Object name}) => 'Are you sure you want to unfavorite "${name}"?',
      'profile.appDescription' => 'A convenient vending machine purchasing application',
      'profile.version' => ({required Object version}) => 'Version: ${version}',
			'time.justNow' => 'Just now',
      'time.minutesAgo' => ({required Object minutes}) => '${minutes} mins ago',
      'time.hoursAgo' => ({required Object hours}) => '${hours} hours ago',
      'time.daysAgo' => ({required Object days}) => '${days} days ago',
      'settings.title' => 'Settings',
      'settings.general' => 'General',
      'settings.theme' => 'Theme Mode',
      'settings.themeLight' => 'Light',
      'settings.themeDark' => 'Dark',
      'settings.themeSystem' => 'System',
      'settings.language' => 'Language',
      'settings.checkUpdate' => 'Check Update',
      'settings.clearCache' => 'Clear Cache',
      'settings.about' => 'About',
      'settings.deviceInfo' => 'Device Info',
      'settings.aboutUs' => 'About Us',
      'settings.checkingUpdate' => 'Checking for updates...',
      'settings.cacheCleared' => 'Cache cleared',
      'settings.english' => 'English',
      'settings.chinese' => 'Simplified Chinese',
      'settings.appName' => 'App Name',
      'settings.packageName' => 'Package Name',
      'settings.versionName' => 'Version Name',
      'settings.buildNumber' => 'Build Number',
      'settings.copyright' => '© 2024 Lunchbox Team',
      'device_info.browser' => 'Browser',
      'device_info.platform' => 'Platform',
      'device_info.userAgent' => 'User Agent',
      'device_info.language' => 'Language',
      'device_info.memory' => 'Memory',
      'device_info.brand' => 'Brand',
      'device_info.model' => 'Model',
      'device_info.systemVersion' => 'System Version',
      'device_info.sdkVersion' => 'SDK Version',
      'device_info.manufacturer' => 'Manufacturer',
      'device_info.hardware' => 'Hardware',
      'device_info.host' => 'Host',
      'device_info.id' => 'ID',
      'device_info.name' => 'Name',
      'device_info.systemName' => 'System Name',
      'device_info.machine' => 'Machine',
      'device_info.uniqueId' => 'Unique ID',
      'help.title' => 'Help Center',
      'help.developing' => 'Help page is under development',
      'onboarding.welcomeTitle' => 'Welcome to E-Lunchbox',
      'onboarding.welcomeBody' => 'Anytime, anywhere, easily buy delicious lunch',
      'onboarding.findDevicesTitle' => 'Find Nearby Devices',
      'onboarding.findDevicesBody' => 'Quickly locate the nearest vending machine and save your time',
      'onboarding.paymentTitle' => 'Convenient Payment',
      'onboarding.paymentBody' => 'Supports multiple convenient payment methods like credit cards',
      'onboarding.getStarted' => 'Get Started',
      'city.title' => 'Select City',
      'city.search' => 'Search City',
      'city.hot' => 'Hot Cities',
      'city.noResult' => 'No related cities found',
      'city.viewAll' => 'View All Cities',
      'city.switchSuccess' => 'City switched',
      'city.switchedTo' => ({required Object name}) => 'Switched to ${name}',
      'city.switchFailed' => 'Switch failed',
      'city.saveFailed' => 'Unable to save selected city, please try again',
      'device.title' => 'Device Detail',
      'device.info' => 'Device Information',
      'device.address' => 'Address',
      'device.distance' => 'Distance',
      'device.status' => 'Status',
      'device.online' => 'Online',
      'device.offline' => 'Offline',
      'device.paymentMethods' => 'Payment Methods: ',
      'device.mobilePayment' => 'Mobile Payment',
      'device.cash' => 'Cash',
      'device.noProducts' => 'No products',
      'device.productList' => 'Product List',
      'device.soldOut' => 'Sold Out',
      'device.reportIssue' => 'Report Issue',
      'device.reportDeviceIssue' => 'Report Device Issue',
      'device.reportIssueHint' => 'Please describe the issue...',
      'device.reportSuccess' => 'Issue reported successfully',
      'device.loadFailed' =>
          ({required Object error}) => 'Load failed: ${error}',
      'device.loadProductsFailed' =>
          ({required Object error}) => 'Load products failed: ${error}',
      'device.nearby' => 'Nearby Devices',
      'device.sortByDistance' => 'Sort by Distance',
      'device.sortByName' => 'Sort by Name',
      'device.filterOnline' => 'Show Online Only',
      'device.noDevicesNearby' => 'No devices nearby',
      'device.maintenance' => 'Maintenance',
      'device.unknown' => 'Unknown',
      'device.cashPayment' => 'Cash Payment',
      'network.errors.connectionTimeout' => 'Connection timeout, please check your network',
      'network.errors.sendTimeout' => 'Send timeout, please check your network',
      'network.errors.receiveTimeout' => 'Receive timeout, please check your network',
      'network.errors.badCertificate' => 'Bad certificate',
      'network.errors.cancel' => 'Request cancelled',
      'network.errors.connectionError' => 'Connection error, please check your network',
      'network.errors.unknown' =>
          ({required Object error}) => 'Unknown error: ${error}',
      'network.errors.retryLater' => 'Please try again later',
      'network.errors.badRequest' => 'Bad request',
      'network.errors.unauthorized' => 'Unauthorized, please login again',
      'network.errors.forbidden' => 'Forbidden',
      'network.errors.notFound' => 'Resource not found',
      'network.errors.timeout' => 'Request timeout, please try again',
      'network.errors.conflict' => 'Conflict',
      'network.errors.validationFailed' => 'Validation failed',
      'network.errors.tooManyRequests' => 'Too many requests, please try again later',
      'network.errors.internalServerError' => 'Internal server error',
      'network.errors.badGateway' => 'Bad gateway',
      'network.errors.serviceUnavailable' => 'Service unavailable',
      'network.errors.gatewayTimeout' => 'Gateway timeout',
      'network.errors.serverError' =>
          ({required Object code}) => 'Server error (${code})',
      'network.errors.requestError' =>
          ({required Object code}) => 'Request error (${code})',
      'network.errors.failed' => 'Network request failed',
      'coupon.title' => 'Coupon',
      'coupon.tabs.available' => 'Available',
      'coupon.tabs.received' => 'Received',
      'coupon.tabs.expired' => 'Expired',
      'coupon.unit' => '\$',
      'coupon.condition' =>
          ({required Object amount}) => 'Coupon\nOver ${amount}',
      'coupon.conditionNoThreshold' => 'Coupon\nNo threshold',
      'coupon.validForever' => 'Valid Forever',
      'coupon.btnReceive' => 'Receive',
      'coupon.btnReceived' => 'Received',
      'coupon.btnUse' => 'Use',
      'coupon.btnExpired' => 'Expired',
      'coupon.discount' => ({required Object amount}) => '\$ ${amount} Coupon',
      'coupon.discountOff' => ({required Object amount}) => '\$ ${amount} Off',
      'community.title' => 'Community Benefits',
      'community.join' => 'Join Community',
      'community.share' => 'Share delicious food with foodies',
      'community.org' => 'Dongguan CAS Cloud Computing Center',
      'community.dept' => 'Cloud Computing Center',
      'community.scanHint' => 'Scan to join Dongguan CAS Cloud Computing Center',
      'community.features.coupon' => 'Exclusive Coupons',
      'community.features.couponHint' => 'Exclusive discounts for group members',
      'community.features.tasting' => 'New Product Tasting',
      'community.features.tastingHint' => 'Taste the latest food first',
      'community.features.exchange' => 'Food Exchange',
      'community.features.exchangeHint' => 'Share insights with food experts',
      'community.features.priority' => 'Priority Access',
      'community.features.priorityHint' => 'Priority participation in food events',
      'community.features.activity' => 'Community Events',
      'community.features.activityHint' => 'Regular offline gatherings',
      'community.features.topic' => 'Topic Discussion',
      'community.features.topicHint' => 'Participate in topics to win rewards',
      'community.whyJoin' => 'Why join our community?',
      'community.reason1' => 'Daily food recommendations',
      'community.reason2' => 'Limited time offers, save money',
      'community.reason3' => 'Professional food reviews',
      'community.reason4' => 'Food making tutorials',
			_ => null,
		};
	}
}
