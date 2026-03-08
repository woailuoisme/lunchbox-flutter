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
class TranslationsEn extends Translations with BaseTranslations<AppLocale, Translations> {
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
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
    super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <en>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

  late final TranslationsEn _root = this; // ignore: unused_field

  @override
  TranslationsEn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) =>
      TranslationsEn(meta: meta ?? this.$meta);

  // Translations
  @override
  late final _TranslationsAboutEn about = _TranslationsAboutEn._(_root);
  @override
  late final _TranslationsAuthEn auth = _TranslationsAuthEn._(_root);
  @override
  late final _TranslationsCartEn cart = _TranslationsCartEn._(_root);
  @override
  late final _TranslationsCityEn city = _TranslationsCityEn._(_root);
  @override
  late final _TranslationsCommonEn common = _TranslationsCommonEn._(_root);
  @override
  late final _TranslationsCommunityEn community = _TranslationsCommunityEn._(_root);
  @override
  late final _TranslationsCouponEn coupon = _TranslationsCouponEn._(_root);
  @override
  late final _TranslationsDeviceEn device = _TranslationsDeviceEn._(_root);
  @override
  late final _TranslationsDeviceInfoEn device_info = _TranslationsDeviceInfoEn._(_root);
  @override
  late final _TranslationsFeedbackEn feedback = _TranslationsFeedbackEn._(_root);
  @override
  late final _TranslationsHelpEn help = _TranslationsHelpEn._(_root);
  @override
  late final _TranslationsHomeEn home = _TranslationsHomeEn._(_root);
  @override
  late final _TranslationsInviteEn invite = _TranslationsInviteEn._(_root);
  @override
  late final _TranslationsNavigationEn navigation = _TranslationsNavigationEn._(_root);
  @override
  late final _TranslationsNetworkEn network = _TranslationsNetworkEn._(_root);
  @override
  late final _TranslationsOnboardingEn onboarding = _TranslationsOnboardingEn._(_root);
  @override
  late final _TranslationsOrderEn order = _TranslationsOrderEn._(_root);
  @override
  late final _TranslationsPartnerEn partner = _TranslationsPartnerEn._(_root);
  @override
  late final _TranslationsPaymentEn payment = _TranslationsPaymentEn._(_root);
  @override
  late final _TranslationsPointsEn points = _TranslationsPointsEn._(_root);
  @override
  late final _TranslationsProductEn product = _TranslationsProductEn._(_root);
  @override
  late final _TranslationsProfileEn profile = _TranslationsProfileEn._(_root);
  @override
  late final _TranslationsSettingsEn settings = _TranslationsSettingsEn._(_root);
  @override
  late final _TranslationsSplashEn splash = _TranslationsSplashEn._(_root);
  @override
  late final _TranslationsTeamOrderingEn teamOrdering = _TranslationsTeamOrderingEn._(_root);
  @override
  late final _TranslationsTimeEn time = _TranslationsTimeEn._(_root);
  @override
  late final _TranslationsWelcomeGiftEn welcome_gift = _TranslationsWelcomeGiftEn._(_root);
}

// Path: about
class _TranslationsAboutEn extends TranslationsAboutZhCn {
  _TranslationsAboutEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'about.title', {}) ?? 'About Us';
  @override
  String get appBrand =>
      TranslationOverrides.string(_root.$meta, 'about.appBrand', {}) ?? 'Lunchbox Smart Vending Machine';
  @override
  String get shareWithFriends =>
      TranslationOverrides.string(_root.$meta, 'about.shareWithFriends', {}) ?? 'Share with Friends';
  @override
  String get featuresTitle => TranslationOverrides.string(_root.$meta, 'about.featuresTitle', {}) ?? 'Our Features';
  @override
  String get feature1Title => TranslationOverrides.string(_root.$meta, 'about.feature1Title', {}) ?? 'Central Kitchen';
  @override
  String get feature1Desc =>
      TranslationOverrides.string(_root.$meta, 'about.feature1Desc', {}) ??
      'Vending machines bring changes to diet life';
  @override
  String get feature2Title => TranslationOverrides.string(_root.$meta, 'about.feature2Title', {}) ?? 'Quick Serving';
  @override
  String get feature2Desc =>
      TranslationOverrides.string(_root.$meta, 'about.feature2Desc', {}) ??
      'Different from traditional takeout and restaurants';
  @override
  String get feature3Title =>
      TranslationOverrides.string(_root.$meta, 'about.feature3Title', {}) ?? 'Entrepreneur Partner';
  @override
  String get feature3Desc =>
      TranslationOverrides.string(_root.$meta, 'about.feature3Desc', {}) ?? 'A risk-free investment tool';
  @override
  String get feature4Title => TranslationOverrides.string(_root.$meta, 'about.feature4Title', {}) ?? 'Patented Machine';
  @override
  String get feature4Desc =>
      TranslationOverrides.string(_root.$meta, 'about.feature4Desc', {}) ?? 'Wealth creation machine for everyone';
  @override
  String get policyTitle => TranslationOverrides.string(_root.$meta, 'about.policyTitle', {}) ?? 'Policy & Terms';
  @override
  String get userAgreementAndPrivacy =>
      TranslationOverrides.string(_root.$meta, 'about.userAgreementAndPrivacy', {}) ??
      'User Agreement & Privacy Policy';
  @override
  String get viewDetails => TranslationOverrides.string(_root.$meta, 'about.viewDetails', {}) ?? 'View Details';
  @override
  String get contactTitle => TranslationOverrides.string(_root.$meta, 'about.contactTitle', {}) ?? 'Contact Us';
  @override
  String get customerServiceHotline =>
      TranslationOverrides.string(_root.$meta, 'about.customerServiceHotline', {}) ?? 'Customer Service Hotline';
  @override
  String get customerServiceNumber =>
      TranslationOverrides.string(_root.$meta, 'about.customerServiceNumber', {}) ?? '400-114-8818';
  @override
  String get companyAddress =>
      TranslationOverrides.string(_root.$meta, 'about.companyAddress', {}) ?? 'Company Address';
  @override
  String get addressDetails =>
      TranslationOverrides.string(_root.$meta, 'about.addressDetails', {}) ??
      'Room 1510, Building 1, No. 1 Kehui Road, Songshan Lake Park, Dongguan, Guangdong';
  @override
  String get shareText =>
      TranslationOverrides.string(_root.$meta, 'about.shareText', {}) ??
      'Come and use the Lunchbox Smart Vending Machine!';
}

// Path: auth
class _TranslationsAuthEn extends TranslationsAuthZhCn {
  _TranslationsAuthEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get loginTitle => TranslationOverrides.string(_root.$meta, 'auth.loginTitle', {}) ?? 'Welcome Back';
  @override
  String get loginButton => TranslationOverrides.string(_root.$meta, 'auth.loginButton', {}) ?? 'Login';
  @override
  String get registerButton => TranslationOverrides.string(_root.$meta, 'auth.registerButton', {}) ?? 'Register';
  @override
  String get forgotPassword =>
      TranslationOverrides.string(_root.$meta, 'auth.forgotPassword', {}) ?? 'Forgot Password?';
  @override
  String get loginFailed => TranslationOverrides.string(_root.$meta, 'auth.loginFailed', {}) ?? 'Login Failed';
  @override
  String get loginSuccess => TranslationOverrides.string(_root.$meta, 'auth.loginSuccess', {}) ?? 'Login Success';
  @override
  String get registerTitle => TranslationOverrides.string(_root.$meta, 'auth.registerTitle', {}) ?? 'Create Account';
  @override
  String get nickname => TranslationOverrides.string(_root.$meta, 'auth.nickname', {}) ?? 'Nickname';
  @override
  String get registerSuccess =>
      TranslationOverrides.string(_root.$meta, 'auth.registerSuccess', {}) ?? 'Register Success';
  @override
  String get registerFailed => TranslationOverrides.string(_root.$meta, 'auth.registerFailed', {}) ?? 'Register Failed';
  @override
  String get forgotPasswordTitle =>
      TranslationOverrides.string(_root.$meta, 'auth.forgotPasswordTitle', {}) ?? 'Reset Password';
  @override
  String get sendResetLink => TranslationOverrides.string(_root.$meta, 'auth.sendResetLink', {}) ?? 'Send Reset Link';
  @override
  String get resetLinkSent => TranslationOverrides.string(_root.$meta, 'auth.resetLinkSent', {}) ?? 'Reset Link Sent';
  @override
  String get required => TranslationOverrides.string(_root.$meta, 'auth.required', {}) ?? 'Required';
  @override
  String get enterUsername =>
      TranslationOverrides.string(_root.$meta, 'auth.enterUsername', {}) ?? 'Please enter username';
  @override
  String get enterPassword =>
      TranslationOverrides.string(_root.$meta, 'auth.enterPassword', {}) ?? 'Please enter password';
  @override
  String get enterUsernameHint =>
      TranslationOverrides.string(_root.$meta, 'auth.enterUsernameHint', {}) ?? 'Enter username or phone';
  @override
  String get passwordLoginTab =>
      TranslationOverrides.string(_root.$meta, 'auth.passwordLoginTab', {}) ?? 'Password Login';
  @override
  String get codeLoginTab => TranslationOverrides.string(_root.$meta, 'auth.codeLoginTab', {}) ?? 'Code Login';
  @override
  String get phoneNumber => TranslationOverrides.string(_root.$meta, 'auth.phoneNumber', {}) ?? 'Phone Number';
  @override
  String get enterPhoneNumber =>
      TranslationOverrides.string(_root.$meta, 'auth.enterPhoneNumber', {}) ?? 'Enter phone number';
  @override
  String get phoneInvalid =>
      TranslationOverrides.string(_root.$meta, 'auth.phoneInvalid', {}) ?? 'Invalid phone number';
  @override
  String get getVerificationCode =>
      TranslationOverrides.string(_root.$meta, 'auth.getVerificationCode', {}) ?? 'Get Code';
  @override
  String retryInSeconds({required Object seconds}) =>
      TranslationOverrides.string(_root.$meta, 'auth.retryInSeconds', {'seconds': seconds}) ?? 'Retry in ${seconds}s';
  @override
  String get otherLoginMethods =>
      TranslationOverrides.string(_root.$meta, 'auth.otherLoginMethods', {}) ?? 'Other login methods';
  @override
  String get enterNickname =>
      TranslationOverrides.string(_root.$meta, 'auth.enterNickname', {}) ?? 'Please enter nickname';
  @override
  String passwordMinLength({required Object length}) =>
      TranslationOverrides.string(_root.$meta, 'auth.passwordMinLength', {'length': length}) ??
      'Password must be at least ${length} characters';
  @override
  String get dontHaveAccount =>
      TranslationOverrides.string(_root.$meta, 'auth.dontHaveAccount', {}) ?? 'Don\'t have an account?';
  @override
  String get resetPasswordHint =>
      TranslationOverrides.string(_root.$meta, 'auth.resetPasswordHint', {}) ??
      'Enter your username or email to reset password';
  @override
  String get usernameOrEmail =>
      TranslationOverrides.string(_root.$meta, 'auth.usernameOrEmail', {}) ?? 'Username / Email';
  @override
  String get slogan =>
      TranslationOverrides.string(_root.$meta, 'auth.slogan', {}) ?? 'Convenient purchase, delicious on the go';
  @override
  String get resendCode => TranslationOverrides.string(_root.$meta, 'auth.resendCode', {}) ?? 'Resend Code';
  @override
  String get email => TranslationOverrides.string(_root.$meta, 'auth.email', {}) ?? 'Email';
  @override
  String get enterEmail => TranslationOverrides.string(_root.$meta, 'auth.enterEmail', {}) ?? 'Please enter email';
  @override
  String get emailInvalid =>
      TranslationOverrides.string(_root.$meta, 'auth.emailInvalid', {}) ?? 'Invalid email address';
  @override
  String get oldPassword => TranslationOverrides.string(_root.$meta, 'auth.oldPassword', {}) ?? 'Old Password';
  @override
  String get enterOldPassword =>
      TranslationOverrides.string(_root.$meta, 'auth.enterOldPassword', {}) ?? 'Please enter old password';
  @override
  String get newPassword => TranslationOverrides.string(_root.$meta, 'auth.newPassword', {}) ?? 'New Password';
  @override
  String get enterNewPassword =>
      TranslationOverrides.string(_root.$meta, 'auth.enterNewPassword', {}) ?? 'Please enter new password';
  @override
  String get resetPasswordButton =>
      TranslationOverrides.string(_root.$meta, 'auth.resetPasswordButton', {}) ?? 'Reset Password';
  @override
  String get resetPasswordSuccess =>
      TranslationOverrides.string(_root.$meta, 'auth.resetPasswordSuccess', {}) ?? 'Password reset successful';
  @override
  String get resetPasswordFailed =>
      TranslationOverrides.string(_root.$meta, 'auth.resetPasswordFailed', {}) ?? 'Password reset failed';
  @override
  String get confirmPassword =>
      TranslationOverrides.string(_root.$meta, 'auth.confirmPassword', {}) ?? 'Confirm Password';
  @override
  String get enterConfirmPassword =>
      TranslationOverrides.string(_root.$meta, 'auth.enterConfirmPassword', {}) ?? 'Please enter password again';
  @override
  String get passwordNotMatch =>
      TranslationOverrides.string(_root.$meta, 'auth.passwordNotMatch', {}) ?? 'Passwords do not match';
}

// Path: cart
class _TranslationsCartEn extends TranslationsCartZhCn {
  _TranslationsCartEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'cart.title', {}) ?? 'Cart';
  @override
  String get clear => TranslationOverrides.string(_root.$meta, 'cart.clear', {}) ?? 'Clear';
  @override
  String get empty => TranslationOverrides.string(_root.$meta, 'cart.empty', {}) ?? 'Cart is empty';
  @override
  String get total => TranslationOverrides.string(_root.$meta, 'cart.total', {}) ?? 'Total';
  @override
  String get checkout => TranslationOverrides.string(_root.$meta, 'cart.checkout', {}) ?? 'Checkout';
  @override
  String get goShopping => TranslationOverrides.string(_root.$meta, 'cart.goShopping', {}) ?? 'Go Shopping';
  @override
  String get clearCart => TranslationOverrides.string(_root.$meta, 'cart.clearCart', {}) ?? 'Clear Cart';
  @override
  String get clearCartConfirm =>
      TranslationOverrides.string(_root.$meta, 'cart.clearCartConfirm', {}) ??
      'Are you sure you want to clear the cart?';
  @override
  String get emptyHint => TranslationOverrides.string(_root.$meta, 'cart.emptyHint', {}) ?? 'Go pick some items';
  @override
  String deleteConfirm({required Object count}) =>
      TranslationOverrides.string(_root.$meta, 'cart.deleteConfirm', {'count': count}) ?? 'Delete ${count} items?';
  @override
  String selectedCount({required Object count}) =>
      TranslationOverrides.string(_root.$meta, 'cart.selectedCount', {'count': count}) ?? 'Selected ${count}';
}

// Path: city
class _TranslationsCityEn extends TranslationsCityZhCn {
  _TranslationsCityEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'city.title', {}) ?? 'Select City';
  @override
  String get search => TranslationOverrides.string(_root.$meta, 'city.search', {}) ?? 'Search City';
  @override
  String get hot => TranslationOverrides.string(_root.$meta, 'city.hot', {}) ?? 'Hot Cities';
  @override
  String get noResult => TranslationOverrides.string(_root.$meta, 'city.noResult', {}) ?? 'No related cities found';
  @override
  String get viewAll => TranslationOverrides.string(_root.$meta, 'city.viewAll', {}) ?? 'View All Cities';
  @override
  String get switchSuccess => TranslationOverrides.string(_root.$meta, 'city.switchSuccess', {}) ?? 'City switched';
  @override
  String switchedTo({required Object name}) =>
      TranslationOverrides.string(_root.$meta, 'city.switchedTo', {'name': name}) ?? 'Switched to ${name}';
  @override
  String get switchFailed => TranslationOverrides.string(_root.$meta, 'city.switchFailed', {}) ?? 'Switch failed';
  @override
  String get saveFailed =>
      TranslationOverrides.string(_root.$meta, 'city.saveFailed', {}) ??
      'Unable to save selected city, please try again';
}

// Path: common
class _TranslationsCommonEn extends TranslationsCommonZhCn {
  _TranslationsCommonEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get login => TranslationOverrides.string(_root.$meta, 'common.login', {}) ?? 'Login';
  @override
  String get register => TranslationOverrides.string(_root.$meta, 'common.register', {}) ?? 'Register';
  @override
  String get username => TranslationOverrides.string(_root.$meta, 'common.username', {}) ?? 'Username';
  @override
  String get password => TranslationOverrides.string(_root.$meta, 'common.password', {}) ?? 'Password';
  @override
  String get confirm => TranslationOverrides.string(_root.$meta, 'common.confirm', {}) ?? 'Confirm';
  @override
  String get cancel => TranslationOverrides.string(_root.$meta, 'common.cancel', {}) ?? 'Cancel';
  @override
  String get error => TranslationOverrides.string(_root.$meta, 'common.error', {}) ?? 'Error';
  @override
  String get success => TranslationOverrides.string(_root.$meta, 'common.success', {}) ?? 'Success';
  @override
  String get loading => TranslationOverrides.string(_root.$meta, 'common.loading', {}) ?? 'Loading...';
  @override
  String get ok => TranslationOverrides.string(_root.$meta, 'common.ok', {}) ?? 'OK';
  @override
  String get save => TranslationOverrides.string(_root.$meta, 'common.save', {}) ?? 'Save';
  @override
  String get delete => TranslationOverrides.string(_root.$meta, 'common.delete', {}) ?? 'Delete';
  @override
  String get edit => TranslationOverrides.string(_root.$meta, 'common.edit', {}) ?? 'Edit';
  @override
  String get search => TranslationOverrides.string(_root.$meta, 'common.search', {}) ?? 'Search';
  @override
  String get noData => TranslationOverrides.string(_root.$meta, 'common.noData', {}) ?? 'No Data';
  @override
  String get retry => TranslationOverrides.string(_root.$meta, 'common.retry', {}) ?? 'Retry';
  @override
  String get skip => TranslationOverrides.string(_root.$meta, 'common.skip', {}) ?? 'Skip';
  @override
  String get refresh => TranslationOverrides.string(_root.$meta, 'common.refresh', {}) ?? 'Refresh';
  @override
  String get loadFailed => TranslationOverrides.string(_root.$meta, 'common.loadFailed', {}) ?? 'Load Failed';
  @override
  String get unknownError => TranslationOverrides.string(_root.$meta, 'common.unknownError', {}) ?? 'Unknown Error';
  @override
  String get info => TranslationOverrides.string(_root.$meta, 'common.info', {}) ?? 'Info';
  @override
  String get developing =>
      TranslationOverrides.string(_root.$meta, 'common.developing', {}) ?? 'Page is under development';
  @override
  String get appName => TranslationOverrides.string(_root.$meta, 'common.appName', {}) ?? 'E-Lunchbox';
  @override
  String get logout => TranslationOverrides.string(_root.$meta, 'common.logout', {}) ?? 'Logout';
  @override
  String get pullToRefresh => TranslationOverrides.string(_root.$meta, 'common.pullToRefresh', {}) ?? 'Pull to refresh';
  @override
  String get releaseToRefresh =>
      TranslationOverrides.string(_root.$meta, 'common.releaseToRefresh', {}) ?? 'Release to refresh';
  @override
  String get refreshing => TranslationOverrides.string(_root.$meta, 'common.refreshing', {}) ?? 'Refreshing...';
  @override
  String get noMoreData => TranslationOverrides.string(_root.$meta, 'common.noMoreData', {}) ?? '- No more data -';
  @override
  String price({required Object price}) =>
      TranslationOverrides.string(_root.$meta, 'common.price', {'price': price}) ?? '¥${price}';
  @override
  String networkError({required Object message}) =>
      TranslationOverrides.string(_root.$meta, 'common.networkError', {'message': message}) ??
      'Network Error: ${message}';
  @override
  String networkErrorWithCode({required Object statusCode, required Object message}) =>
      TranslationOverrides.string(_root.$meta, 'common.networkErrorWithCode', {
        'statusCode': statusCode,
        'message': message,
      }) ??
      'Network Error (${statusCode}): ${message}';
  @override
  String serverError({required Object statusCode, required Object message}) =>
      TranslationOverrides.string(_root.$meta, 'common.serverError', {'statusCode': statusCode, 'message': message}) ??
      'Server Error (${statusCode}): ${message}';
  @override
  String cacheError({required Object message}) =>
      TranslationOverrides.string(_root.$meta, 'common.cacheError', {'message': message}) ?? 'Cache Error: ${message}';
  @override
  String notFound({required Object resource}) =>
      TranslationOverrides.string(_root.$meta, 'common.notFound', {'resource': resource}) ?? 'Not Found: ${resource}';
  @override
  String get unauthorized =>
      TranslationOverrides.string(_root.$meta, 'common.unauthorized', {}) ?? 'Unauthorized, please login again';
  @override
  String validationError({required Object message}) =>
      TranslationOverrides.string(_root.$meta, 'common.validationError', {'message': message}) ??
      'Validation Error: ${message}';
  @override
  String validationErrorWithDetails({required Object message, required Object errors}) =>
      TranslationOverrides.string(_root.$meta, 'common.validationErrorWithDetails', {
        'message': message,
        'errors': errors,
      }) ??
      'Validation Error: ${message} (${errors})';
  @override
  String get warning => TranslationOverrides.string(_root.$meta, 'common.warning', {}) ?? 'Warning';
}

// Path: community
class _TranslationsCommunityEn extends TranslationsCommunityZhCn {
  _TranslationsCommunityEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'community.title', {}) ?? 'Community Benefits';
  @override
  String get join => TranslationOverrides.string(_root.$meta, 'community.join', {}) ?? 'Join Community';
  @override
  String get share =>
      TranslationOverrides.string(_root.$meta, 'community.share', {}) ?? 'Share delicious food with foodies';
  @override
  String get org =>
      TranslationOverrides.string(_root.$meta, 'community.org', {}) ?? 'Dongguan CAS Cloud Computing Center';
  @override
  String get dept => TranslationOverrides.string(_root.$meta, 'community.dept', {}) ?? 'Cloud Computing Center';
  @override
  String get scanHint =>
      TranslationOverrides.string(_root.$meta, 'community.scanHint', {}) ??
      'Scan to join Dongguan CAS Cloud Computing Center';
  @override
  late final _TranslationsCommunityFeaturesEn features = _TranslationsCommunityFeaturesEn._(_root);
  @override
  String get whyJoin => TranslationOverrides.string(_root.$meta, 'community.whyJoin', {}) ?? 'Why join our community?';
  @override
  String get reason1 =>
      TranslationOverrides.string(_root.$meta, 'community.reason1', {}) ?? 'Daily food recommendations';
  @override
  String get reason2 =>
      TranslationOverrides.string(_root.$meta, 'community.reason2', {}) ?? 'Limited time offers, save money';
  @override
  String get reason3 =>
      TranslationOverrides.string(_root.$meta, 'community.reason3', {}) ?? 'Professional food reviews';
  @override
  String get reason4 => TranslationOverrides.string(_root.$meta, 'community.reason4', {}) ?? 'Food making tutorials';
}

// Path: coupon
class _TranslationsCouponEn extends TranslationsCouponZhCn {
  _TranslationsCouponEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'coupon.title', {}) ?? 'Coupon';
  @override
  late final _TranslationsCouponTabsEn tabs = _TranslationsCouponTabsEn._(_root);
  @override
  String get unit => TranslationOverrides.string(_root.$meta, 'coupon.unit', {}) ?? '\$';
  @override
  String condition({required Object amount}) =>
      TranslationOverrides.string(_root.$meta, 'coupon.condition', {'amount': amount}) ?? 'Coupon\nOver ${amount}';
  @override
  String get conditionNoThreshold =>
      TranslationOverrides.string(_root.$meta, 'coupon.conditionNoThreshold', {}) ?? 'Coupon\nNo threshold';
  @override
  String get validForever => TranslationOverrides.string(_root.$meta, 'coupon.validForever', {}) ?? 'Valid Forever';
  @override
  String get btnReceive => TranslationOverrides.string(_root.$meta, 'coupon.btnReceive', {}) ?? 'Receive';
  @override
  String get btnReceived => TranslationOverrides.string(_root.$meta, 'coupon.btnReceived', {}) ?? 'Received';
  @override
  String get btnUse => TranslationOverrides.string(_root.$meta, 'coupon.btnUse', {}) ?? 'Use';
  @override
  String get btnExpired => TranslationOverrides.string(_root.$meta, 'coupon.btnExpired', {}) ?? 'Expired';
  @override
  String discount({required Object amount}) =>
      TranslationOverrides.string(_root.$meta, 'coupon.discount', {'amount': amount}) ?? '\$ ${amount} Coupon';
  @override
  String discountOff({required Object amount}) =>
      TranslationOverrides.string(_root.$meta, 'coupon.discountOff', {'amount': amount}) ?? '\$ ${amount} Off';
  @override
  String get noCoupons => TranslationOverrides.string(_root.$meta, 'coupon.noCoupons', {}) ?? 'No coupons available';
  @override
  String get expiryPrefix => TranslationOverrides.string(_root.$meta, 'coupon.expiryPrefix', {}) ?? 'Expires at: ';
  @override
  String get statusAvailable => TranslationOverrides.string(_root.$meta, 'coupon.statusAvailable', {}) ?? 'Available';
  @override
  String get statusUnavailable =>
      TranslationOverrides.string(_root.$meta, 'coupon.statusUnavailable', {}) ?? 'Unavailable';
}

// Path: device
class _TranslationsDeviceEn extends TranslationsDeviceZhCn {
  _TranslationsDeviceEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'device.title', {}) ?? 'Device Detail';
  @override
  String get info => TranslationOverrides.string(_root.$meta, 'device.info', {}) ?? 'Device Information';
  @override
  String get address => TranslationOverrides.string(_root.$meta, 'device.address', {}) ?? 'Address';
  @override
  String get distance => TranslationOverrides.string(_root.$meta, 'device.distance', {}) ?? 'Distance';
  @override
  String get status => TranslationOverrides.string(_root.$meta, 'device.status', {}) ?? 'Status';
  @override
  String get statusOnline => TranslationOverrides.string(_root.$meta, 'device.statusOnline', {}) ?? 'Open';
  @override
  String get statusOffline => TranslationOverrides.string(_root.$meta, 'device.statusOffline', {}) ?? 'Closed';
  @override
  String get online => TranslationOverrides.string(_root.$meta, 'device.online', {}) ?? 'Online';
  @override
  String get offline => TranslationOverrides.string(_root.$meta, 'device.offline', {}) ?? 'Offline';
  @override
  String get paymentMethods =>
      TranslationOverrides.string(_root.$meta, 'device.paymentMethods', {}) ?? 'Payment Methods: ';
  @override
  String get mobilePayment => TranslationOverrides.string(_root.$meta, 'device.mobilePayment', {}) ?? 'Mobile Payment';
  @override
  String get cash => TranslationOverrides.string(_root.$meta, 'device.cash', {}) ?? 'Cash';
  @override
  String get noProducts => TranslationOverrides.string(_root.$meta, 'device.noProducts', {}) ?? 'No products';
  @override
  String get productList => TranslationOverrides.string(_root.$meta, 'device.productList', {}) ?? 'Product List';
  @override
  String get soldOut => TranslationOverrides.string(_root.$meta, 'device.soldOut', {}) ?? 'Sold Out';
  @override
  String get reportIssue => TranslationOverrides.string(_root.$meta, 'device.reportIssue', {}) ?? 'Report Issue';
  @override
  String get reportDeviceIssue =>
      TranslationOverrides.string(_root.$meta, 'device.reportDeviceIssue', {}) ?? 'Report Device Issue';
  @override
  String get reportIssueHint =>
      TranslationOverrides.string(_root.$meta, 'device.reportIssueHint', {}) ?? 'Please describe the issue...';
  @override
  String get reportSuccess =>
      TranslationOverrides.string(_root.$meta, 'device.reportSuccess', {}) ?? 'Issue reported successfully';
  @override
  String loadFailed({required Object error}) =>
      TranslationOverrides.string(_root.$meta, 'device.loadFailed', {'error': error}) ?? 'Load failed: ${error}';
  @override
  String loadProductsFailed({required Object error}) =>
      TranslationOverrides.string(_root.$meta, 'device.loadProductsFailed', {'error': error}) ??
      'Load products failed: ${error}';
  @override
  String get nearby => TranslationOverrides.string(_root.$meta, 'device.nearby', {}) ?? 'Nearby Devices';
  @override
  String get sortByDistance =>
      TranslationOverrides.string(_root.$meta, 'device.sortByDistance', {}) ?? 'Sort by Distance';
  @override
  String get sortByName => TranslationOverrides.string(_root.$meta, 'device.sortByName', {}) ?? 'Sort by Name';
  @override
  String get filterOnline => TranslationOverrides.string(_root.$meta, 'device.filterOnline', {}) ?? 'Show Online Only';
  @override
  String get noDevicesNearby =>
      TranslationOverrides.string(_root.$meta, 'device.noDevicesNearby', {}) ?? 'No devices nearby';
  @override
  String get maintenance => TranslationOverrides.string(_root.$meta, 'device.maintenance', {}) ?? 'Maintenance';
  @override
  String get unknown => TranslationOverrides.string(_root.$meta, 'device.unknown', {}) ?? 'Unknown';
  @override
  String get cashPayment => TranslationOverrides.string(_root.$meta, 'device.cashPayment', {}) ?? 'Cash Payment';
  @override
  String get frequent => TranslationOverrides.string(_root.$meta, 'device.frequent', {}) ?? 'Frequent Devices';
  @override
  String get menu => TranslationOverrides.string(_root.$meta, 'device.menu', {}) ?? 'Menu';
  @override
  String get classicMenu => TranslationOverrides.string(_root.$meta, 'device.classicMenu', {}) ?? 'Classic Menu';
  @override
  String get limitedDiscount =>
      TranslationOverrides.string(_root.$meta, 'device.limitedDiscount', {}) ?? 'Limited Discount';
  @override
  String monthlySales({required Object count}) =>
      TranslationOverrides.string(_root.$meta, 'device.monthlySales', {'count': count}) ?? 'Sold ${count}';
  @override
  String stock({required Object count}) =>
      TranslationOverrides.string(_root.$meta, 'device.stock', {'count': count}) ?? '${count} left';
  @override
  String get soldOutLabel => TranslationOverrides.string(_root.$meta, 'device.soldOutLabel', {}) ?? 'Sold Out';
  @override
  String get selfPickupOrder =>
      TranslationOverrides.string(_root.$meta, 'device.selfPickupOrder', {}) ?? 'Pickup Order';
  @override
  String get selectedProducts => TranslationOverrides.string(_root.$meta, 'device.selectedProducts', {}) ?? 'Selected';
  @override
  String get subtotal => TranslationOverrides.string(_root.$meta, 'device.subtotal', {}) ?? 'Subtotal';
  @override
  String get estimatedPrice => TranslationOverrides.string(_root.$meta, 'device.estimatedPrice', {}) ?? 'Estimated';
  @override
  String get originalPrice => TranslationOverrides.string(_root.$meta, 'device.originalPrice', {}) ?? 'Original';
  @override
  String get enabled => TranslationOverrides.string(_root.$meta, 'device.enabled', {}) ?? 'Enabled';
  @override
  String loadedFrequent({required Object count}) =>
      TranslationOverrides.string(_root.$meta, 'device.loadedFrequent', {'count': count}) ??
      'Loaded ${count} frequent devices';
  @override
  String get noFrequentDevices =>
      TranslationOverrides.string(_root.$meta, 'device.noFrequentDevices', {}) ?? 'No frequent devices';
  @override
  String get noNearbyDevices =>
      TranslationOverrides.string(_root.$meta, 'device.noNearbyDevices', {}) ?? 'No nearby devices';
  @override
  String get businessHoursDefault =>
      TranslationOverrides.string(_root.$meta, 'device.businessHoursDefault', {}) ?? '09:00-18:00';
}

// Path: device_info
class _TranslationsDeviceInfoEn extends TranslationsDeviceInfoZhCn {
  _TranslationsDeviceInfoEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get browser => TranslationOverrides.string(_root.$meta, 'device_info.browser', {}) ?? 'Browser';
  @override
  String get platform => TranslationOverrides.string(_root.$meta, 'device_info.platform', {}) ?? 'Platform';
  @override
  String get userAgent => TranslationOverrides.string(_root.$meta, 'device_info.userAgent', {}) ?? 'User Agent';
  @override
  String get language => TranslationOverrides.string(_root.$meta, 'device_info.language', {}) ?? 'Language';
  @override
  String get memory => TranslationOverrides.string(_root.$meta, 'device_info.memory', {}) ?? 'Memory';
  @override
  String get brand => TranslationOverrides.string(_root.$meta, 'device_info.brand', {}) ?? 'Brand';
  @override
  String get model => TranslationOverrides.string(_root.$meta, 'device_info.model', {}) ?? 'Model';
  @override
  String get systemVersion =>
      TranslationOverrides.string(_root.$meta, 'device_info.systemVersion', {}) ?? 'System Version';
  @override
  String get sdkVersion => TranslationOverrides.string(_root.$meta, 'device_info.sdkVersion', {}) ?? 'SDK Version';
  @override
  String get manufacturer => TranslationOverrides.string(_root.$meta, 'device_info.manufacturer', {}) ?? 'Manufacturer';
  @override
  String get hardware => TranslationOverrides.string(_root.$meta, 'device_info.hardware', {}) ?? 'Hardware';
  @override
  String get host => TranslationOverrides.string(_root.$meta, 'device_info.host', {}) ?? 'Host';
  @override
  String get id => TranslationOverrides.string(_root.$meta, 'device_info.id', {}) ?? 'ID';
  @override
  String get name => TranslationOverrides.string(_root.$meta, 'device_info.name', {}) ?? 'Name';
  @override
  String get systemName => TranslationOverrides.string(_root.$meta, 'device_info.systemName', {}) ?? 'System Name';
  @override
  String get machine => TranslationOverrides.string(_root.$meta, 'device_info.machine', {}) ?? 'Machine';
  @override
  String get uniqueId => TranslationOverrides.string(_root.$meta, 'device_info.uniqueId', {}) ?? 'Unique ID';
}

// Path: feedback
class _TranslationsFeedbackEn extends TranslationsFeedbackZhCn {
  _TranslationsFeedbackEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'feedback.title', {}) ?? 'Feedback';
  @override
  String get subtitle =>
      TranslationOverrides.string(_root.$meta, 'feedback.subtitle', {}) ??
      'Your feedback is our motivation for progress';
  @override
  String get selectType =>
      TranslationOverrides.string(_root.$meta, 'feedback.selectType', {}) ?? 'Select Feedback Type';
  @override
  String get errorReport => TranslationOverrides.string(_root.$meta, 'feedback.errorReport', {}) ?? 'Error Report';
  @override
  String get suggestion => TranslationOverrides.string(_root.$meta, 'feedback.suggestion', {}) ?? 'Suggestion';
  @override
  String get complaint => TranslationOverrides.string(_root.$meta, 'feedback.complaint', {}) ?? 'Complaint';
  @override
  String get other => TranslationOverrides.string(_root.$meta, 'feedback.other', {}) ?? 'Other';
  @override
  String get description =>
      TranslationOverrides.string(_root.$meta, 'feedback.description', {}) ?? 'Problem Description';
  @override
  String get titleHint =>
      TranslationOverrides.string(_root.$meta, 'feedback.titleHint', {}) ?? 'Please enter the problem title (Required)';
  @override
  String get contentHint =>
      TranslationOverrides.string(_root.$meta, 'feedback.contentHint', {}) ??
      'Please describe the problem or suggestion in detail (Required)';
  @override
  String get uploadScreenshot =>
      TranslationOverrides.string(_root.$meta, 'feedback.uploadScreenshot', {}) ?? 'Upload Screenshot (Optional)';
  @override
  String get addImage => TranslationOverrides.string(_root.$meta, 'feedback.addImage', {}) ?? 'Add Image';
  @override
  String get uploadLimitHint =>
      TranslationOverrides.string(_root.$meta, 'feedback.uploadLimitHint', {}) ??
      'Up to 3 images, each not exceeding 2MB, support jpg, png formats';
  @override
  String get contactOptional =>
      TranslationOverrides.string(_root.$meta, 'feedback.contactOptional', {}) ?? 'Contact Information (Optional)';
  @override
  String get contactInputHint =>
      TranslationOverrides.string(_root.$meta, 'feedback.contactInputHint', {}) ??
      'Please enter your phone number or email for us to contact you';
  @override
  String get submit => TranslationOverrides.string(_root.$meta, 'feedback.submit', {}) ?? 'Submit Feedback';
  @override
  String get submitSuccess =>
      TranslationOverrides.string(_root.$meta, 'feedback.submitSuccess', {}) ??
      'Feedback submitted successfully, thank you for your support';
  @override
  String get submitFailed =>
      TranslationOverrides.string(_root.$meta, 'feedback.submitFailed', {}) ??
      'Feedback submission failed, please try again later';
}

// Path: help
class _TranslationsHelpEn extends TranslationsHelpZhCn {
  _TranslationsHelpEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'help.title', {}) ?? 'Help Center';
  @override
  String get developing =>
      TranslationOverrides.string(_root.$meta, 'help.developing', {}) ?? 'Help page is under development';
}

// Path: home
class _TranslationsHomeEn extends TranslationsHomeZhCn {
  _TranslationsHomeEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get selectCity => TranslationOverrides.string(_root.$meta, 'home.selectCity', {}) ?? 'Select City';
  @override
  String get nearbyDevices => TranslationOverrides.string(_root.$meta, 'home.nearbyDevices', {}) ?? 'Nearby Devices';
  @override
  String get moreDevices => TranslationOverrides.string(_root.$meta, 'home.moreDevices', {}) ?? 'More Devices';
  @override
  String deviceDistance({required Object name, required Object distance}) =>
      TranslationOverrides.string(_root.$meta, 'home.deviceDistance', {'name': name, 'distance': distance}) ??
      '${name} is ${distance} away';
  @override
  String get recommendTitle =>
      TranslationOverrides.string(_root.$meta, 'home.recommendTitle', {}) ?? 'Recommended for Me';
  @override
  late final _TranslationsHomeGridEn grid = _TranslationsHomeGridEn._(_root);
  @override
  late final _TranslationsHomeLotteryEn lottery = _TranslationsHomeLotteryEn._(_root);
  @override
  late final _TranslationsHomeStatusEn status = _TranslationsHomeStatusEn._(_root);
}

// Path: invite
class _TranslationsInviteEn extends TranslationsInviteZhCn {
  _TranslationsInviteEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'invite.title', {}) ?? 'Invite Friends';
  @override
  String get ruleBtn => TranslationOverrides.string(_root.$meta, 'invite.ruleBtn', {}) ?? 'Rules';
  @override
  String get rewardTitle => TranslationOverrides.string(_root.$meta, 'invite.rewardTitle', {}) ?? '\$1';
  @override
  String get rewardSubtitle =>
      TranslationOverrides.string(_root.$meta, 'invite.rewardSubtitle', {}) ?? 'No Threshold Coupon';
  @override
  String get rewardDesc =>
      TranslationOverrides.string(_root.$meta, 'invite.rewardDesc', {}) ?? 'Get for every invited person';
  @override
  String get myCode => TranslationOverrides.string(_root.$meta, 'invite.myCode', {}) ?? 'My Invite Code';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'invite.copy', {}) ?? 'Copy';
  @override
  String get btnInvite => TranslationOverrides.string(_root.$meta, 'invite.btnInvite', {}) ?? 'Invite Friends';
  @override
  String get processTitle =>
      TranslationOverrides.string(_root.$meta, 'invite.processTitle', {}) ?? 'Invitation Process';
  @override
  String get step1 => TranslationOverrides.string(_root.$meta, 'invite.step1', {}) ?? 'Share Link';
  @override
  String get step1Desc => TranslationOverrides.string(_root.$meta, 'invite.step1Desc', {}) ?? 'To Friends';
  @override
  String get step2 => TranslationOverrides.string(_root.$meta, 'invite.step2', {}) ?? 'Friend Register';
  @override
  String get step2Desc => TranslationOverrides.string(_root.$meta, 'invite.step2Desc', {}) ?? 'Get Gift';
  @override
  String get step3 => TranslationOverrides.string(_root.$meta, 'invite.step3', {}) ?? 'Friend First Order';
  @override
  String get step3Desc => TranslationOverrides.string(_root.$meta, 'invite.step3Desc', {}) ?? 'Paid ≥ \$5';
  @override
  String get step4 => TranslationOverrides.string(_root.$meta, 'invite.step4', {}) ?? 'Invitation Achieved';
  @override
  String get step4Desc => TranslationOverrides.string(_root.$meta, 'invite.step4Desc', {}) ?? 'Get Reward';
  @override
  String get stats => TranslationOverrides.string(_root.$meta, 'invite.stats', {}) ?? 'My Achievements';
  @override
  String get invitedCount => TranslationOverrides.string(_root.$meta, 'invite.invitedCount', {}) ?? 'Invited (People)';
  @override
  String get rewardAmount => TranslationOverrides.string(_root.$meta, 'invite.rewardAmount', {}) ?? 'Rewards (\$)';
  @override
  late final _TranslationsInviteRulesEn rules = _TranslationsInviteRulesEn._(_root);
}

// Path: navigation
class _TranslationsNavigationEn extends TranslationsNavigationZhCn {
  _TranslationsNavigationEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get home => TranslationOverrides.string(_root.$meta, 'navigation.home', {}) ?? 'Home';
  @override
  String get device => TranslationOverrides.string(_root.$meta, 'navigation.device', {}) ?? 'Device';
  @override
  String get cart => TranslationOverrides.string(_root.$meta, 'navigation.cart', {}) ?? 'Cart';
  @override
  String get orders => TranslationOverrides.string(_root.$meta, 'navigation.orders', {}) ?? 'Orders';
  @override
  String get profile => TranslationOverrides.string(_root.$meta, 'navigation.profile', {}) ?? 'Profile';
}

// Path: network
class _TranslationsNetworkEn extends TranslationsNetworkZhCn {
  _TranslationsNetworkEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsNetworkErrorsEn errors = _TranslationsNetworkErrorsEn._(_root);
}

// Path: onboarding
class _TranslationsOnboardingEn extends TranslationsOnboardingZhCn {
  _TranslationsOnboardingEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get welcomeTitle =>
      TranslationOverrides.string(_root.$meta, 'onboarding.welcomeTitle', {}) ?? 'Welcome to E-Lunchbox';
  @override
  String get welcomeBody =>
      TranslationOverrides.string(_root.$meta, 'onboarding.welcomeBody', {}) ??
      'Anytime, anywhere, easily buy delicious lunch';
  @override
  String get findDevicesTitle =>
      TranslationOverrides.string(_root.$meta, 'onboarding.findDevicesTitle', {}) ?? 'Find Nearby Devices';
  @override
  String get findDevicesBody =>
      TranslationOverrides.string(_root.$meta, 'onboarding.findDevicesBody', {}) ??
      'Quickly locate the nearest vending machine and save your time';
  @override
  String get paymentTitle =>
      TranslationOverrides.string(_root.$meta, 'onboarding.paymentTitle', {}) ?? 'Convenient Payment';
  @override
  String get paymentBody =>
      TranslationOverrides.string(_root.$meta, 'onboarding.paymentBody', {}) ??
      'Supports multiple convenient payment methods like credit cards';
  @override
  String get getStarted => TranslationOverrides.string(_root.$meta, 'onboarding.getStarted', {}) ?? 'Get Started';
}

// Path: order
class _TranslationsOrderEn extends TranslationsOrderZhCn {
  _TranslationsOrderEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get myOrders => TranslationOverrides.string(_root.$meta, 'order.myOrders', {}) ?? 'My Orders';
  @override
  String get foodOrder => TranslationOverrides.string(_root.$meta, 'order.foodOrder', {}) ?? 'Food Order';
  @override
  String get mallOrder => TranslationOverrides.string(_root.$meta, 'order.mallOrder', {}) ?? 'Mall Order';
  @override
  String get noOrders => TranslationOverrides.string(_root.$meta, 'order.noOrders', {}) ?? 'No Orders';
  @override
  String get detail => TranslationOverrides.string(_root.$meta, 'order.detail', {}) ?? 'Order Detail';
  @override
  late final _TranslationsOrderStatusEn status = _TranslationsOrderStatusEn._(_root);
  @override
  String get pickupCode => TranslationOverrides.string(_root.$meta, 'order.pickupCode', {}) ?? 'Pickup Code';
  @override
  String get pickupHint =>
      TranslationOverrides.string(_root.$meta, 'order.pickupHint', {}) ?? 'Enter code on device to pick up';
  @override
  String get items => TranslationOverrides.string(_root.$meta, 'order.items', {}) ?? 'Item List';
  @override
  String get info => TranslationOverrides.string(_root.$meta, 'order.info', {}) ?? 'Order Info';
  @override
  String get id => TranslationOverrides.string(_root.$meta, 'order.id', {}) ?? 'Order ID';
  @override
  String get createdAt => TranslationOverrides.string(_root.$meta, 'order.createdAt', {}) ?? 'Created At';
  @override
  String get paidAt => TranslationOverrides.string(_root.$meta, 'order.paidAt', {}) ?? 'Paid At';
  @override
  String get paymentMethod => TranslationOverrides.string(_root.$meta, 'order.paymentMethod', {}) ?? 'Payment Method';
  @override
  String get totalAmount => TranslationOverrides.string(_root.$meta, 'order.totalAmount', {}) ?? 'Total Amount';
  @override
  String get unknown => TranslationOverrides.string(_root.$meta, 'order.unknown', {}) ?? 'Unknown';
  @override
  String get refresh => TranslationOverrides.string(_root.$meta, 'order.refresh', {}) ?? 'Refresh';
  @override
  String itemsCount({required Object count}) =>
      TranslationOverrides.string(_root.$meta, 'order.itemsCount', {'count': count}) ?? 'and ${count} other items';
  @override
  String get orderIdLabel => TranslationOverrides.string(_root.$meta, 'order.orderIdLabel', {}) ?? 'Order ID: ';
  @override
  String get orderAmount => TranslationOverrides.string(_root.$meta, 'order.orderAmount', {}) ?? 'Order Amount';
  @override
  String get cancelOrder => TranslationOverrides.string(_root.$meta, 'order.cancelOrder', {}) ?? 'Cancel Order';
  @override
  String get payNow => TranslationOverrides.string(_root.$meta, 'order.payNow', {}) ?? 'Pay Now';
  @override
  String get viewDetail => TranslationOverrides.string(_root.$meta, 'order.viewDetail', {}) ?? 'View Details';
  @override
  String get cancelConfirmTitle =>
      TranslationOverrides.string(_root.$meta, 'order.cancelConfirmTitle', {}) ?? 'Confirm Cancel';
  @override
  String get cancelConfirmContent =>
      TranslationOverrides.string(_root.$meta, 'order.cancelConfirmContent', {}) ??
      'Are you sure you want to cancel this order?';
  @override
  String get orderCancelled =>
      TranslationOverrides.string(_root.$meta, 'order.orderCancelled', {}) ?? 'Order cancelled';
  @override
  String get confirmOrder => TranslationOverrides.string(_root.$meta, 'order.confirmOrder', {}) ?? 'Confirm Order';
  @override
  String get actualAmount => TranslationOverrides.string(_root.$meta, 'order.actualAmount', {}) ?? 'Actual Amount';
  @override
  String get totalLabel => TranslationOverrides.string(_root.$meta, 'order.totalLabel', {}) ?? 'Total: ';
  @override
  String get submitOrder => TranslationOverrides.string(_root.$meta, 'order.submitOrder', {}) ?? 'Submit Order';
  @override
  String createFailed({required Object error}) =>
      TranslationOverrides.string(_root.$meta, 'order.createFailed', {'error': error}) ??
      'Create order failed: ${error}';
  @override
  String get retry => TranslationOverrides.string(_root.$meta, 'order.retry', {}) ?? 'Retry';
  @override
  String loadFailed({required Object error}) =>
      TranslationOverrides.string(_root.$meta, 'order.loadFailed', {'error': error}) ?? 'Load failed: ${error}';
  @override
  String specs({required Object specs}) =>
      TranslationOverrides.string(_root.$meta, 'order.specs', {'specs': specs}) ?? 'Specs: ${specs}';
  @override
  String summary({required Object count}) =>
      TranslationOverrides.string(_root.$meta, 'order.summary', {'count': count}) ?? 'Total ${count} items: ';
  @override
  String get refund => TranslationOverrides.string(_root.$meta, 'order.refund', {}) ?? 'Refund';
  @override
  String get viewCode => TranslationOverrides.string(_root.$meta, 'order.viewCode', {}) ?? 'View Code';
  @override
  String get deleteOrder => TranslationOverrides.string(_root.$meta, 'order.deleteOrder', {}) ?? 'Delete Order';
  @override
  String get reorder => TranslationOverrides.string(_root.$meta, 'order.reorder', {}) ?? 'Buy Again';
  @override
  String get paySuccess => TranslationOverrides.string(_root.$meta, 'order.paySuccess', {}) ?? 'Payment Successful';
  @override
  String get reorderSuccess =>
      TranslationOverrides.string(_root.$meta, 'order.reorderSuccess', {}) ?? 'Reordered Successfully';
  @override
  String get refundNotAvailable =>
      TranslationOverrides.string(_root.$meta, 'order.refundNotAvailable', {}) ?? 'Refund not available yet';
  @override
  String get deleteNotAvailable =>
      TranslationOverrides.string(_root.$meta, 'order.deleteNotAvailable', {}) ?? 'Delete not available yet';
  @override
  String operationFailed({required Object error}) =>
      TranslationOverrides.string(_root.$meta, 'order.operationFailed', {'error': error}) ??
      'Operation failed: ${error}';
  @override
  String get scanQrHint =>
      TranslationOverrides.string(_root.$meta, 'order.scanQrHint', {}) ?? 'Please scan QR code at the machine';
  @override
  String get pickupCodeHint =>
      TranslationOverrides.string(_root.$meta, 'order.pickupCodeHint', {}) ??
      'Please pick up with code, enjoy your meal';
  @override
  String get storeInfo => TranslationOverrides.string(_root.$meta, 'order.storeInfo', {}) ?? 'Store Info';
  @override
  String get productInfo => TranslationOverrides.string(_root.$meta, 'order.productInfo', {}) ?? 'Product Info';
  @override
  String get device => TranslationOverrides.string(_root.$meta, 'order.device', {}) ?? 'Device';
  @override
  String get applyRefund => TranslationOverrides.string(_root.$meta, 'order.applyRefund', {}) ?? 'Apply Refund';
  @override
  String get contactService =>
      TranslationOverrides.string(_root.$meta, 'order.contactService', {}) ?? 'Contact Service';
  @override
  String get serviceNotAvailable =>
      TranslationOverrides.string(_root.$meta, 'order.serviceNotAvailable', {}) ?? 'Service not available yet';
  @override
  String get paymentStripe =>
      TranslationOverrides.string(_root.$meta, 'order.paymentStripe', {}) ?? 'Stripe (Credit Card)';
  @override
  String get paymentWechat => TranslationOverrides.string(_root.$meta, 'order.paymentWechat', {}) ?? 'WeChat Pay';
  @override
  String get paymentAlipay => TranslationOverrides.string(_root.$meta, 'order.paymentAlipay', {}) ?? 'Alipay';
}

// Path: partner
class _TranslationsPartnerEn extends TranslationsPartnerZhCn {
  _TranslationsPartnerEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'partner.title', {}) ?? 'Partner Cooperation';
  @override
  String get subtitle =>
      TranslationOverrides.string(_root.$meta, 'partner.subtitle', {}) ?? 'Join hands to create a better future';
  @override
  String get advantages =>
      TranslationOverrides.string(_root.$meta, 'partner.advantages', {}) ?? 'Cooperation Advantages';
  @override
  String get advantage1Title =>
      TranslationOverrides.string(_root.$meta, 'partner.advantage1Title', {}) ?? 'Generous Returns';
  @override
  String get advantage1Desc =>
      TranslationOverrides.string(_root.$meta, 'partner.advantage1Desc', {}) ??
      'Provide competitive profit sharing for your investment';
  @override
  String get advantage2Title =>
      TranslationOverrides.string(_root.$meta, 'partner.advantage2Title', {}) ?? 'Brand Support';
  @override
  String get advantage2Desc =>
      TranslationOverrides.string(_root.$meta, 'partner.advantage2Desc', {}) ??
      'Share well-known brand resources and customer trust';
  @override
  String get advantage3Title =>
      TranslationOverrides.string(_root.$meta, 'partner.advantage3Title', {}) ?? 'Marketing Support';
  @override
  String get advantage3Desc =>
      TranslationOverrides.string(_root.$meta, 'partner.advantage3Desc', {}) ??
      'Professional marketing team for full support';
  @override
  String get advantage4Title =>
      TranslationOverrides.string(_root.$meta, 'partner.advantage4Title', {}) ?? 'Training Support';
  @override
  String get advantage4Desc =>
      TranslationOverrides.string(_root.$meta, 'partner.advantage4Desc', {}) ??
      'Professional training courses to help you master skills';
  @override
  String get process => TranslationOverrides.string(_root.$meta, 'partner.process', {}) ?? 'Cooperation Process';
  @override
  String get process1Title =>
      TranslationOverrides.string(_root.$meta, 'partner.process1Title', {}) ?? 'Submit Application';
  @override
  String get process1Desc =>
      TranslationOverrides.string(_root.$meta, 'partner.process1Desc', {}) ??
      'Fill out the application form and submit relevant information';
  @override
  String get process2Title =>
      TranslationOverrides.string(_root.$meta, 'partner.process2Title', {}) ?? 'Qualification Review';
  @override
  String get process2Desc =>
      TranslationOverrides.string(_root.$meta, 'partner.process2Desc', {}) ??
      'We will complete review within 3-5 working days';
  @override
  String get process3Title => TranslationOverrides.string(_root.$meta, 'partner.process3Title', {}) ?? 'Interview';
  @override
  String get process3Desc =>
      TranslationOverrides.string(_root.$meta, 'partner.process3Desc', {}) ??
      'Arrange an interview to understand cooperation details';
  @override
  String get process4Title => TranslationOverrides.string(_root.$meta, 'partner.process4Title', {}) ?? 'Sign Agreement';
  @override
  String get process4Desc =>
      TranslationOverrides.string(_root.$meta, 'partner.process4Desc', {}) ??
      'Sign formal agreement after reaching consensus';
  @override
  String get process5Title =>
      TranslationOverrides.string(_root.$meta, 'partner.process5Title', {}) ?? 'Start Cooperation';
  @override
  String get process5Desc =>
      TranslationOverrides.string(_root.$meta, 'partner.process5Desc', {}) ??
      'Formally launch cooperation and enjoy support services';
  @override
  String get conditions =>
      TranslationOverrides.string(_root.$meta, 'partner.conditions', {}) ?? 'Cooperation Conditions';
  @override
  String get condition1 =>
      TranslationOverrides.string(_root.$meta, 'partner.condition1', {}) ?? 'Have legal business qualifications';
  @override
  String get condition2 =>
      TranslationOverrides.string(_root.$meta, 'partner.condition2', {}) ??
      'Have certain capital and management ability';
  @override
  String get condition3 =>
      TranslationOverrides.string(_root.$meta, 'partner.condition3', {}) ?? 'Identify with our brand concept and model';
  @override
  String get condition4 =>
      TranslationOverrides.string(_root.$meta, 'partner.condition4', {}) ?? 'Have good business reputation';
  @override
  String get condition5 =>
      TranslationOverrides.string(_root.$meta, 'partner.condition5', {}) ?? 'Relevant industry experience is preferred';
  @override
  String get applicationTitle =>
      TranslationOverrides.string(_root.$meta, 'partner.applicationTitle', {}) ?? 'Apply for Cooperation';
  @override
  String get nameLabel => TranslationOverrides.string(_root.$meta, 'partner.nameLabel', {}) ?? 'Name';
  @override
  String get nameInputHint =>
      TranslationOverrides.string(_root.$meta, 'partner.nameInputHint', {}) ?? 'Please enter your name';
  @override
  String get companyLabel => TranslationOverrides.string(_root.$meta, 'partner.companyLabel', {}) ?? 'Company Name';
  @override
  String get companyInputHint =>
      TranslationOverrides.string(_root.$meta, 'partner.companyInputHint', {}) ?? 'Please enter company name';
  @override
  String get phoneLabel => TranslationOverrides.string(_root.$meta, 'partner.phoneLabel', {}) ?? 'Phone Number';
  @override
  String get phoneInputHint =>
      TranslationOverrides.string(_root.$meta, 'partner.phoneInputHint', {}) ?? 'Please enter phone number';
  @override
  String get intentionLabel =>
      TranslationOverrides.string(_root.$meta, 'partner.intentionLabel', {}) ?? 'Cooperation Intention';
  @override
  String get intentionInputHint =>
      TranslationOverrides.string(_root.$meta, 'partner.intentionInputHint', {}) ??
      'Briefly describe your cooperation intention';
  @override
  String get submit => TranslationOverrides.string(_root.$meta, 'partner.submit', {}) ?? 'Submit Application';
  @override
  String get submitSuccess =>
      TranslationOverrides.string(_root.$meta, 'partner.submitSuccess', {}) ??
      'Application submitted successfully, we will contact you soon';
  @override
  String get submitFailed =>
      TranslationOverrides.string(_root.$meta, 'partner.submitFailed', {}) ??
      'Application submission failed, please try again later';
  @override
  String get incompleteInfo =>
      TranslationOverrides.string(_root.$meta, 'partner.incompleteInfo', {}) ?? 'Please fill in complete information';
  @override
  String get contactTitle => TranslationOverrides.string(_root.$meta, 'partner.contactTitle', {}) ?? 'Contact Us';
  @override
  String get serviceHotline =>
      TranslationOverrides.string(_root.$meta, 'partner.serviceHotline', {}) ?? 'Customer Service Hotline';
  @override
  String get address => TranslationOverrides.string(_root.$meta, 'partner.address', {}) ?? 'Address';
  @override
  String errorOccurred({required Object error}) =>
      TranslationOverrides.string(_root.$meta, 'partner.errorOccurred', {'error': error}) ?? 'Error occurred: ${error}';
}

// Path: payment
class _TranslationsPaymentEn extends TranslationsPaymentZhCn {
  _TranslationsPaymentEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get checkout => TranslationOverrides.string(_root.$meta, 'payment.checkout', {}) ?? 'Checkout';
  @override
  String get success => TranslationOverrides.string(_root.$meta, 'payment.success', {}) ?? 'Payment Successful';
  @override
  String get orderNotFound =>
      TranslationOverrides.string(_root.$meta, 'payment.orderNotFound', {}) ?? 'Order Not Found';
  @override
  String get payNow => TranslationOverrides.string(_root.$meta, 'payment.payNow', {}) ?? 'Pay Now';
  @override
  String get initializing =>
      TranslationOverrides.string(_root.$meta, 'payment.initializing', {}) ?? 'Initializing payment...';
  @override
  String get cancelTitle => TranslationOverrides.string(_root.$meta, 'payment.cancelTitle', {}) ?? 'Cancel Payment';
  @override
  String get cancelContent =>
      TranslationOverrides.string(_root.$meta, 'payment.cancelContent', {}) ??
      'Are you sure you want to cancel? Order will be cancelled';
  @override
  String get continuePay => TranslationOverrides.string(_root.$meta, 'payment.continuePay', {}) ?? 'Continue Payment';
  @override
  String get cancelPay => TranslationOverrides.string(_root.$meta, 'payment.cancelPay', {}) ?? 'Cancel Payment';
  @override
  String get amount => TranslationOverrides.string(_root.$meta, 'payment.amount', {}) ?? 'Payment Amount';
  @override
  String get remainingTime => TranslationOverrides.string(_root.$meta, 'payment.remainingTime', {}) ?? 'Time Remaining';
  @override
  String get addCard => TranslationOverrides.string(_root.$meta, 'payment.addCard', {}) ?? 'Add Card';
  @override
  String get paymentMethods =>
      TranslationOverrides.string(_root.$meta, 'payment.paymentMethods', {}) ?? 'Payment Methods';
  @override
  String get setupSuccess =>
      TranslationOverrides.string(_root.$meta, 'payment.setupSuccess', {}) ?? 'Card added successfully';
  @override
  String get setupFailed => TranslationOverrides.string(_root.$meta, 'payment.setupFailed', {}) ?? 'Failed to add card';
  @override
  String get noCards => TranslationOverrides.string(_root.$meta, 'payment.noCards', {}) ?? 'No saved cards';
}

// Path: points
class _TranslationsPointsEn extends TranslationsPointsZhCn {
  _TranslationsPointsEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'points.title', {}) ?? 'My Points';
  @override
  String get unit => TranslationOverrides.string(_root.$meta, 'points.unit', {}) ?? 'Points';
  @override
  String get mall => TranslationOverrides.string(_root.$meta, 'points.mall', {}) ?? 'Point Mall';
  @override
  String get goExchange => TranslationOverrides.string(_root.$meta, 'points.goExchange', {}) ?? 'Go Exchange';
  @override
  String get rules => TranslationOverrides.string(_root.$meta, 'points.rules', {}) ?? 'Point Rules';
  @override
  String get rule1 => TranslationOverrides.string(_root.$meta, 'points.rule1', {}) ?? 'Points are permanently valid';
  @override
  String get rule2 =>
      TranslationOverrides.string(_root.$meta, 'points.rule2', {}) ?? 'Extra points can be obtained by lottery';
  @override
  String get records => TranslationOverrides.string(_root.$meta, 'points.records', {}) ?? 'Point Records';
  @override
  String get all => TranslationOverrides.string(_root.$meta, 'points.all', {}) ?? 'All';
  @override
  String get earned => TranslationOverrides.string(_root.$meta, 'points.earned', {}) ?? 'Earned';
  @override
  String get used => TranslationOverrides.string(_root.$meta, 'points.used', {}) ?? 'Used';
  @override
  String get noRecords => TranslationOverrides.string(_root.$meta, 'points.noRecords', {}) ?? 'No point records';
  @override
  String get back => TranslationOverrides.string(_root.$meta, 'points.back', {}) ?? 'Back';
  @override
  String get goLottery => TranslationOverrides.string(_root.$meta, 'points.goLottery', {}) ?? 'Go Lottery';
  @override
  String get balance => TranslationOverrides.string(_root.$meta, 'points.balance', {}) ?? 'Balance';
  @override
  String get coupon => TranslationOverrides.string(_root.$meta, 'points.coupon', {}) ?? 'Coupons';
  @override
  String get noMoreProducts =>
      TranslationOverrides.string(_root.$meta, 'points.noMoreProducts', {}) ?? 'No more products';
  @override
  String myPoints({required Object points}) =>
      TranslationOverrides.string(_root.$meta, 'points.myPoints', {'points': points}) ?? 'My Points: ${points}';
  @override
  String get noProducts => TranslationOverrides.string(_root.$meta, 'points.noProducts', {}) ?? 'No products';
  @override
  String cost({required Object points}) =>
      TranslationOverrides.string(_root.$meta, 'points.cost', {'points': points}) ?? '${points} Points';
  @override
  String get exchangeNow => TranslationOverrides.string(_root.$meta, 'points.exchangeNow', {}) ?? 'Exchange Now';
  @override
  String get insufficientPoints =>
      TranslationOverrides.string(_root.$meta, 'points.insufficientPoints', {}) ?? 'Insufficient balance';
}

// Path: product
class _TranslationsProductEn extends TranslationsProductZhCn {
  _TranslationsProductEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'product.title', {}) ?? 'Product List';
  @override
  String get detail => TranslationOverrides.string(_root.$meta, 'product.detail', {}) ?? 'Product Detail';
  @override
  String get hot => TranslationOverrides.string(_root.$meta, 'product.hot', {}) ?? 'Hot';
  @override
  String get promotion => TranslationOverrides.string(_root.$meta, 'product.promotion', {}) ?? 'Sale';
  @override
  String discountOff({required Object percent}) =>
      TranslationOverrides.string(_root.$meta, 'product.discountOff', {'percent': percent}) ?? '${percent}% OFF';
  @override
  String get stockFull => TranslationOverrides.string(_root.$meta, 'product.stockFull', {}) ?? 'In Stock';
  @override
  String get stockEmpty => TranslationOverrides.string(_root.$meta, 'product.stockEmpty', {}) ?? 'Out of Stock';
  @override
  String get addToCart => TranslationOverrides.string(_root.$meta, 'product.addToCart', {}) ?? 'Add to Cart';
  @override
  String get addedToCart => TranslationOverrides.string(_root.$meta, 'product.addedToCart', {}) ?? 'Added to Cart';
  @override
  String get specifications =>
      TranslationOverrides.string(_root.$meta, 'product.specifications', {}) ?? 'Specifications';
  @override
  String get categoryAll => TranslationOverrides.string(_root.$meta, 'product.categoryAll', {}) ?? 'All';
  @override
  String get categoryFood => TranslationOverrides.string(_root.$meta, 'product.categoryFood', {}) ?? 'Food';
  @override
  String get categoryDrink => TranslationOverrides.string(_root.$meta, 'product.categoryDrink', {}) ?? 'Drink';
  @override
  String get categorySnack => TranslationOverrides.string(_root.$meta, 'product.categorySnack', {}) ?? 'Snack';
  @override
  String get sortDefault => TranslationOverrides.string(_root.$meta, 'product.sortDefault', {}) ?? 'Default';
  @override
  String get sortPriceAsc =>
      TranslationOverrides.string(_root.$meta, 'product.sortPriceAsc', {}) ?? 'Price: Low to High';
  @override
  String get sortPriceDesc =>
      TranslationOverrides.string(_root.$meta, 'product.sortPriceDesc', {}) ?? 'Price: High to Low';
  @override
  String get sortName => TranslationOverrides.string(_root.$meta, 'product.sortName', {}) ?? 'Name';
  @override
  String get filterOnlyAvailable =>
      TranslationOverrides.string(_root.$meta, 'product.filterOnlyAvailable', {}) ?? 'Show Available Only';
  @override
  String get cart => TranslationOverrides.string(_root.$meta, 'product.cart', {}) ?? 'Cart';
  @override
  String get noProducts => TranslationOverrides.string(_root.$meta, 'product.noProducts', {}) ?? 'No products found';
  @override
  String get loadingDetail =>
      TranslationOverrides.string(_root.$meta, 'product.loadingDetail', {}) ??
      'Loading product details, please wait...';
  @override
  String get noDescription =>
      TranslationOverrides.string(_root.$meta, 'product.noDescription', {}) ?? 'No detailed description';
  @override
  String get reviews => TranslationOverrides.string(_root.$meta, 'product.reviews', {}) ?? 'Product Reviews';
  @override
  String get noReviews => TranslationOverrides.string(_root.$meta, 'product.noReviews', {}) ?? 'No reviews yet';
  @override
  String get viewAllReviews =>
      TranslationOverrides.string(_root.$meta, 'product.viewAllReviews', {}) ?? 'View all reviews';
}

// Path: profile
class _TranslationsProfileEn extends TranslationsProfileZhCn {
  _TranslationsProfileEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'profile.title', {}) ?? 'User Center';
  @override
  String get notLoggedIn => TranslationOverrides.string(_root.$meta, 'profile.notLoggedIn', {}) ?? 'Not Logged In';
  @override
  String get editProfile => TranslationOverrides.string(_root.$meta, 'profile.editProfile', {}) ?? 'Edit Profile';
  @override
  String get logout => TranslationOverrides.string(_root.$meta, 'profile.logout', {}) ?? 'Logout';
  @override
  String get favoriteDevices =>
      TranslationOverrides.string(_root.$meta, 'profile.favoriteDevices', {}) ?? 'Favorite Devices';
  @override
  String get personalInfo => TranslationOverrides.string(_root.$meta, 'profile.personalInfo', {}) ?? 'Personal Info';
  @override
  String get confirmLogout => TranslationOverrides.string(_root.$meta, 'profile.confirmLogout', {}) ?? 'Confirm Logout';
  @override
  String get confirmLogoutContent =>
      TranslationOverrides.string(_root.$meta, 'profile.confirmLogoutContent', {}) ??
      'Are you sure you want to logout?';
  @override
  String get clearCacheConfirm =>
      TranslationOverrides.string(_root.$meta, 'profile.clearCacheConfirm', {}) ??
      'Are you sure you want to clear all cache data?';
  @override
  String get noFavoriteDevices =>
      TranslationOverrides.string(_root.$meta, 'profile.noFavoriteDevices', {}) ?? 'No favorite devices';
  @override
  String get removeFavorite => TranslationOverrides.string(_root.$meta, 'profile.removeFavorite', {}) ?? 'Unfavorite';
  @override
  String removeFavoriteConfirm({required Object name}) =>
      TranslationOverrides.string(_root.$meta, 'profile.removeFavoriteConfirm', {'name': name}) ??
      'Are you sure you want to unfavorite "${name}"?';
  @override
  String get appDescription =>
      TranslationOverrides.string(_root.$meta, 'profile.appDescription', {}) ??
      'A convenient vending machine purchasing application';
  @override
  String version({required Object version}) =>
      TranslationOverrides.string(_root.$meta, 'profile.version', {'version': version}) ?? 'Version: ${version}';
  @override
  String get wallet => TranslationOverrides.string(_root.$meta, 'profile.wallet', {}) ?? 'My Wallet';
  @override
  String get coupon => TranslationOverrides.string(_root.$meta, 'profile.coupon', {}) ?? 'Coupons';
  @override
  String get feedback => TranslationOverrides.string(_root.$meta, 'profile.feedback', {}) ?? 'Feedback';
  @override
  String get cooperation => TranslationOverrides.string(_root.$meta, 'profile.cooperation', {}) ?? 'Cooperation';
  @override
  String get about => TranslationOverrides.string(_root.$meta, 'profile.about', {}) ?? 'About Us';
  @override
  String get settings => TranslationOverrides.string(_root.$meta, 'profile.settings', {}) ?? 'Settings';
  @override
  late final _TranslationsProfileGenderEn gender = _TranslationsProfileGenderEn._(_root);
  @override
  late final _TranslationsProfileInfoEn info = _TranslationsProfileInfoEn._(_root);
  @override
  late final _TranslationsProfileAvatarEn avatar = _TranslationsProfileAvatarEn._(_root);
  @override
  String get saveSuccess => TranslationOverrides.string(_root.$meta, 'profile.saveSuccess', {}) ?? 'Saved successfully';
  @override
  String saveFailed({required Object error}) =>
      TranslationOverrides.string(_root.$meta, 'profile.saveFailed', {'error': error}) ?? 'Save failed: ${error}';
  @override
  String get saveInfo => TranslationOverrides.string(_root.$meta, 'profile.saveInfo', {}) ?? 'Save Information';
  @override
  String get walletBalance => TranslationOverrides.string(_root.$meta, 'profile.walletBalance', {}) ?? 'Wallet Balance';
  @override
  String get coin => TranslationOverrides.string(_root.$meta, 'profile.coin', {}) ?? 'Points';
  @override
  String get couponCount => TranslationOverrides.string(_root.$meta, 'profile.couponCount', {}) ?? 'Coupons';
  @override
  late final _TranslationsProfileWalletPageEn walletPage = _TranslationsProfileWalletPageEn._(_root);
}

// Path: settings
class _TranslationsSettingsEn extends TranslationsSettingsZhCn {
  _TranslationsSettingsEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.title', {}) ?? 'Settings';
  @override
  String get general => TranslationOverrides.string(_root.$meta, 'settings.general', {}) ?? 'General';
  @override
  String get theme => TranslationOverrides.string(_root.$meta, 'settings.theme', {}) ?? 'Theme Mode';
  @override
  String get themeLight => TranslationOverrides.string(_root.$meta, 'settings.themeLight', {}) ?? 'Light';
  @override
  String get themeDark => TranslationOverrides.string(_root.$meta, 'settings.themeDark', {}) ?? 'Dark';
  @override
  String get themeSystem => TranslationOverrides.string(_root.$meta, 'settings.themeSystem', {}) ?? 'System';
  @override
  String get language => TranslationOverrides.string(_root.$meta, 'settings.language', {}) ?? 'Language';
  @override
  String get checkUpdate => TranslationOverrides.string(_root.$meta, 'settings.checkUpdate', {}) ?? 'Check Update';
  @override
  String get clearCache => TranslationOverrides.string(_root.$meta, 'settings.clearCache', {}) ?? 'Clear Cache';
  @override
  String get about => TranslationOverrides.string(_root.$meta, 'settings.about', {}) ?? 'About';
  @override
  String get deviceInfo => TranslationOverrides.string(_root.$meta, 'settings.deviceInfo', {}) ?? 'Device Info';
  @override
  String get aboutUs => TranslationOverrides.string(_root.$meta, 'settings.aboutUs', {}) ?? 'About Us';
  @override
  String get checkingUpdate =>
      TranslationOverrides.string(_root.$meta, 'settings.checkingUpdate', {}) ?? 'Checking for updates...';
  @override
  String get cacheCleared => TranslationOverrides.string(_root.$meta, 'settings.cacheCleared', {}) ?? 'Cache cleared';
  @override
  String get english => TranslationOverrides.string(_root.$meta, 'settings.english', {}) ?? 'English';
  @override
  String get chinese => TranslationOverrides.string(_root.$meta, 'settings.chinese', {}) ?? 'Simplified Chinese';
  @override
  String get traditionalChinese =>
      TranslationOverrides.string(_root.$meta, 'settings.traditionalChinese', {}) ?? 'Traditional Chinese';
  @override
  String get themeScheme => TranslationOverrides.string(_root.$meta, 'settings.themeScheme', {}) ?? 'Color Scheme';
  @override
  late final _TranslationsSettingsSchemesEn schemes = _TranslationsSettingsSchemesEn._(_root);
  @override
  String get appName => TranslationOverrides.string(_root.$meta, 'settings.appName', {}) ?? 'App Name';
  @override
  String get packageName => TranslationOverrides.string(_root.$meta, 'settings.packageName', {}) ?? 'Package Name';
  @override
  String get versionName => TranslationOverrides.string(_root.$meta, 'settings.versionName', {}) ?? 'Version Name';
  @override
  String get buildNumber => TranslationOverrides.string(_root.$meta, 'settings.buildNumber', {}) ?? 'Build Number';
  @override
  String get copyright => TranslationOverrides.string(_root.$meta, 'settings.copyright', {}) ?? '© 2024 Lunchbox Team';
}

// Path: splash
class _TranslationsSplashEn extends TranslationsSplashZhCn {
  _TranslationsSplashEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get starting => TranslationOverrides.string(_root.$meta, 'splash.starting', {}) ?? 'Starting...';
  @override
  String get checkingServices =>
      TranslationOverrides.string(_root.$meta, 'splash.checkingServices', {}) ?? 'Checking services...';
  @override
  String get loadingConfig =>
      TranslationOverrides.string(_root.$meta, 'splash.loadingConfig', {}) ?? 'Loading config...';
  @override
  String get checkingAuth =>
      TranslationOverrides.string(_root.$meta, 'splash.checkingAuth', {}) ?? 'Checking auth status...';
  @override
  String get preparingData =>
      TranslationOverrides.string(_root.$meta, 'splash.preparingData', {}) ?? 'Preparing data...';
  @override
  String get ready => TranslationOverrides.string(_root.$meta, 'splash.ready', {}) ?? 'Ready';
  @override
  String get failed => TranslationOverrides.string(_root.$meta, 'splash.failed', {}) ?? 'Start Failed';
}

// Path: teamOrdering
class _TranslationsTeamOrderingEn extends TranslationsTeamOrderingZhCn {
  _TranslationsTeamOrderingEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'teamOrdering.title', {}) ?? 'Team Ordering';
  @override
  String get bannerTitle => TranslationOverrides.string(_root.$meta, 'teamOrdering.bannerTitle', {}) ?? 'Team Ordering';
  @override
  String get bannerSubtitle =>
      TranslationOverrides.string(_root.$meta, 'teamOrdering.bannerSubtitle', {}) ??
      'Group Order · Team Dinner · Corporate Team Building';
  @override
  String get tag1 => TranslationOverrides.string(_root.$meta, 'teamOrdering.tag1', {}) ?? 'Professional Service';
  @override
  String get tag2 => TranslationOverrides.string(_root.$meta, 'teamOrdering.tag2', {}) ?? 'Discount Price';
  @override
  String get tag3 => TranslationOverrides.string(_root.$meta, 'teamOrdering.tag3', {}) ?? 'Convenient & Efficient';
  @override
  late final _TranslationsTeamOrderingScenariosEn scenarios = _TranslationsTeamOrderingScenariosEn._(_root);
  @override
  late final _TranslationsTeamOrderingProcessEn process = _TranslationsTeamOrderingProcessEn._(_root);
  @override
  late final _TranslationsTeamOrderingAdvantagesEn advantages = _TranslationsTeamOrderingAdvantagesEn._(_root);
  @override
  String get bookNow => TranslationOverrides.string(_root.$meta, 'teamOrdering.bookNow', {}) ?? 'Book Now';
}

// Path: time
class _TranslationsTimeEn extends TranslationsTimeZhCn {
  _TranslationsTimeEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get justNow => TranslationOverrides.string(_root.$meta, 'time.justNow', {}) ?? 'Just now';
  @override
  String minutesAgo({required Object minutes}) =>
      TranslationOverrides.string(_root.$meta, 'time.minutesAgo', {'minutes': minutes}) ?? '${minutes} mins ago';
  @override
  String hoursAgo({required Object hours}) =>
      TranslationOverrides.string(_root.$meta, 'time.hoursAgo', {'hours': hours}) ?? '${hours} hours ago';
  @override
  String daysAgo({required Object days}) =>
      TranslationOverrides.string(_root.$meta, 'time.daysAgo', {'days': days}) ?? '${days} days ago';
}

// Path: welcome_gift
class _TranslationsWelcomeGiftEn extends TranslationsWelcomeGiftZhCn {
  _TranslationsWelcomeGiftEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'welcome_gift.title', {}) ?? 'Welcome Gift';
  @override
  String get subtitle =>
      TranslationOverrides.string(_root.$meta, 'welcome_gift.subtitle', {}) ??
      'Can be claimed within 30 days of registration, one gift per person';
  @override
  late final _TranslationsWelcomeGiftTabsEn tabs = _TranslationsWelcomeGiftTabsEn._(_root);
  @override
  late final _TranslationsWelcomeGiftCardEn card = _TranslationsWelcomeGiftCardEn._(_root);
}

// Path: community.features
class _TranslationsCommunityFeaturesEn extends TranslationsCommunityFeaturesZhCn {
  _TranslationsCommunityFeaturesEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get coupon => TranslationOverrides.string(_root.$meta, 'community.features.coupon', {}) ?? 'Exclusive Coupons';
  @override
  String get couponHint =>
      TranslationOverrides.string(_root.$meta, 'community.features.couponHint', {}) ??
      'Exclusive discounts for group members';
  @override
  String get tasting =>
      TranslationOverrides.string(_root.$meta, 'community.features.tasting', {}) ?? 'New Product Tasting';
  @override
  String get tastingHint =>
      TranslationOverrides.string(_root.$meta, 'community.features.tastingHint', {}) ?? 'Taste the latest food first';
  @override
  String get exchange => TranslationOverrides.string(_root.$meta, 'community.features.exchange', {}) ?? 'Food Exchange';
  @override
  String get exchangeHint =>
      TranslationOverrides.string(_root.$meta, 'community.features.exchangeHint', {}) ??
      'Share insights with food experts';
  @override
  String get priority =>
      TranslationOverrides.string(_root.$meta, 'community.features.priority', {}) ?? 'Priority Access';
  @override
  String get priorityHint =>
      TranslationOverrides.string(_root.$meta, 'community.features.priorityHint', {}) ??
      'Priority participation in food events';
  @override
  String get activity =>
      TranslationOverrides.string(_root.$meta, 'community.features.activity', {}) ?? 'Community Events';
  @override
  String get activityHint =>
      TranslationOverrides.string(_root.$meta, 'community.features.activityHint', {}) ?? 'Regular offline gatherings';
  @override
  String get topic => TranslationOverrides.string(_root.$meta, 'community.features.topic', {}) ?? 'Topic Discussion';
  @override
  String get topicHint =>
      TranslationOverrides.string(_root.$meta, 'community.features.topicHint', {}) ??
      'Participate in topics to win rewards';
}

// Path: coupon.tabs
class _TranslationsCouponTabsEn extends TranslationsCouponTabsZhCn {
  _TranslationsCouponTabsEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get available => TranslationOverrides.string(_root.$meta, 'coupon.tabs.available', {}) ?? 'Available';
  @override
  String get received => TranslationOverrides.string(_root.$meta, 'coupon.tabs.received', {}) ?? 'Received';
  @override
  String get expired => TranslationOverrides.string(_root.$meta, 'coupon.tabs.expired', {}) ?? 'Expired';
  @override
  String get canUse => TranslationOverrides.string(_root.$meta, 'coupon.tabs.canUse', {}) ?? 'To Use';
  @override
  String get cannotUse => TranslationOverrides.string(_root.$meta, 'coupon.tabs.cannotUse', {}) ?? 'Unavailable';
}

// Path: home.grid
class _TranslationsHomeGridEn extends TranslationsHomeGridZhCn {
  _TranslationsHomeGridEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get welfare => TranslationOverrides.string(_root.$meta, 'home.grid.welfare', {}) ?? 'Welfare';
  @override
  String get service => TranslationOverrides.string(_root.$meta, 'home.grid.service', {}) ?? 'Service';
  @override
  String get coupon => TranslationOverrides.string(_root.$meta, 'home.grid.coupon', {}) ?? 'Coupons';
  @override
  String get lottery => TranslationOverrides.string(_root.$meta, 'home.grid.lottery', {}) ?? 'Lucky Draw';
  @override
  String get invite => TranslationOverrides.string(_root.$meta, 'home.grid.invite', {}) ?? 'Invite Friends';
}

// Path: home.lottery
class _TranslationsHomeLotteryEn extends TranslationsHomeLotteryZhCn {
  _TranslationsHomeLotteryEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'home.lottery.title', {}) ?? 'Lucky Draw';
  @override
  String get prizes => TranslationOverrides.string(_root.$meta, 'home.lottery.prizes', {}) ?? 'My Prizes';
  @override
  String get rules => TranslationOverrides.string(_root.$meta, 'home.lottery.rules', {}) ?? 'Activity Rules';
  @override
  String get subtitle =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.subtitle', {}) ?? 'Join the draw, win great prizes';
  @override
  String remaining({required Object count}) =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.remaining', {'count': count}) ?? 'Remaining: ${count}';
  @override
  String get spin => TranslationOverrides.string(_root.$meta, 'home.lottery.spin', {}) ?? 'Spin';
  @override
  String get spinning => TranslationOverrides.string(_root.$meta, 'home.lottery.spinning', {}) ?? '...';
  @override
  String get congratulations =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.congratulations', {}) ?? 'Congratulations';
  @override
  String get accept => TranslationOverrides.string(_root.$meta, 'home.lottery.accept', {}) ?? 'Accept';
  @override
  String get rule1 =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.rule1', {}) ?? 'Free draws daily, complete tasks for more';
  @override
  String get rule2 =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.rule2', {}) ??
      'Coupons valid for 48h, Points added automatically';
  @override
  String get rule3 =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.rule3', {}) ?? 'Platform reserves all rights';
  @override
  String get prizeUnit => TranslationOverrides.string(_root.$meta, 'home.lottery.prizeUnit', {}) ?? 'Points';
  @override
  String get prizeList => TranslationOverrides.string(_root.$meta, 'home.lottery.prizeList', {}) ?? 'Prize List';
  @override
  String get back => TranslationOverrides.string(_root.$meta, 'home.lottery.back', {}) ?? 'Back';
  @override
  late final _TranslationsHomeLotteryPrizeStatsEn prizeStats = _TranslationsHomeLotteryPrizeStatsEn._(_root);
  @override
  late final _TranslationsHomeLotteryTabsEn tabs = _TranslationsHomeLotteryTabsEn._(_root);
  @override
  late final _TranslationsHomeLotteryPrizeCardEn prizeCard = _TranslationsHomeLotteryPrizeCardEn._(_root);
}

// Path: home.status
class _TranslationsHomeStatusEn extends TranslationsHomeStatusZhCn {
  _TranslationsHomeStatusEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get open => TranslationOverrides.string(_root.$meta, 'home.status.open', {}) ?? 'Open';
  @override
  String get closed => TranslationOverrides.string(_root.$meta, 'home.status.closed', {}) ?? 'Closed';
  @override
  String get mobilePayment =>
      TranslationOverrides.string(_root.$meta, 'home.status.mobilePayment', {}) ?? 'Mobile Payment Supported';
}

// Path: invite.rules
class _TranslationsInviteRulesEn extends TranslationsInviteRulesZhCn {
  _TranslationsInviteRulesEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'invite.rules.title', {}) ?? 'Invitation Rules';
  @override
  String get section1 => TranslationOverrides.string(_root.$meta, 'invite.rules.section1', {}) ?? 'Invitation Rules';
  @override
  String get rule1 =>
      TranslationOverrides.string(_root.$meta, 'invite.rules.rule1', {}) ??
      'Get a \$1 no-threshold coupon for every friend successfully invited to register.';
  @override
  String get rule2 =>
      TranslationOverrides.string(_root.$meta, 'invite.rules.rule2', {}) ??
      'Friends need to complete their first order (paid amount ≥ \$15) to be considered successful.';
  @override
  String get rule3 =>
      TranslationOverrides.string(_root.$meta, 'invite.rules.rule3', {}) ??
      'Each friend can only be invited once, repeated invitations are invalid.';
  @override
  String get rule4 =>
      TranslationOverrides.string(_root.$meta, 'invite.rules.rule4', {}) ??
      'There is no upper limit for invitation rewards, the more you invite, the more you get.';
  @override
  String get rule5 =>
      TranslationOverrides.string(_root.$meta, 'invite.rules.rule5', {}) ??
      'Invitation records are saved permanently and can be viewed at any time.';
  @override
  String get section2 => TranslationOverrides.string(_root.$meta, 'invite.rules.section2', {}) ?? 'Reward Description';
  @override
  String get reward1 =>
      TranslationOverrides.string(_root.$meta, 'invite.rules.reward1', {}) ??
      '\$1 no-threshold coupon, can be directly deducted from the order amount.';
  @override
  String get reward2 =>
      TranslationOverrides.string(_root.$meta, 'invite.rules.reward2', {}) ??
      'The coupon is valid for 30 days, please use it within the validity period.';
  @override
  String get reward3 =>
      TranslationOverrides.string(_root.$meta, 'invite.rules.reward3', {}) ??
      'Coupons cannot be used in conjunction with other promotional activities.';
  @override
  String get reward4 =>
      TranslationOverrides.string(_root.$meta, 'invite.rules.reward4', {}) ??
      'Coupons are limited to use on Good Little Obedient Smart Lunch Box Vending Machines.';
  @override
  String get reward5 =>
      TranslationOverrides.string(_root.$meta, 'invite.rules.reward5', {}) ??
      'Coupons cannot be transferred or exchanged for cash.';
  @override
  String get section3 => TranslationOverrides.string(_root.$meta, 'invite.rules.section3', {}) ?? 'Notes';
  @override
  String get note1 =>
      TranslationOverrides.string(_root.$meta, 'invite.rules.note1', {}) ??
      'Inviting friends must be done through the official invitation link.';
  @override
  String get note2 =>
      TranslationOverrides.string(_root.$meta, 'invite.rules.note2', {}) ??
      'Friends need to complete real-name authentication after registration.';
  @override
  String get note3 =>
      TranslationOverrides.string(_root.$meta, 'invite.rules.note3', {}) ??
      'If malicious invitation behavior is found, the platform has the right to cancel the reward.';
  @override
  String get note4 =>
      TranslationOverrides.string(_root.$meta, 'invite.rules.note4', {}) ??
      'The final interpretation right of the event rules belongs to Good Little Obedient Smart Lunch Box Vending Machine.';
  @override
  String get note5 =>
      TranslationOverrides.string(_root.$meta, 'invite.rules.note5', {}) ??
      'If you have any questions, please contact customer service.';
  @override
  String get section4 => TranslationOverrides.string(_root.$meta, 'invite.rules.section4', {}) ?? 'Invitation Process';
  @override
  String get process1 =>
      TranslationOverrides.string(_root.$meta, 'invite.rules.process1', {}) ?? 'Share the invitation link to friends.';
  @override
  String get process2 =>
      TranslationOverrides.string(_root.$meta, 'invite.rules.process2', {}) ??
      'Friends register an account through the link.';
  @override
  String get process3 =>
      TranslationOverrides.string(_root.$meta, 'invite.rules.process3', {}) ??
      'Friends complete the first order (≥ \$15).';
  @override
  String get process4 =>
      TranslationOverrides.string(_root.$meta, 'invite.rules.process4', {}) ??
      'The system automatically issues rewards to your account.';
  @override
  String get process5 =>
      TranslationOverrides.string(_root.$meta, 'invite.rules.process5', {}) ??
      'You can view invitation records in \'My Achievements\'.';
}

// Path: network.errors
class _TranslationsNetworkErrorsEn extends TranslationsNetworkErrorsZhCn {
  _TranslationsNetworkErrorsEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get connectionTimeout =>
      TranslationOverrides.string(_root.$meta, 'network.errors.connectionTimeout', {}) ??
      'Connection timeout, please check your network';
  @override
  String get sendTimeout =>
      TranslationOverrides.string(_root.$meta, 'network.errors.sendTimeout', {}) ??
      'Send timeout, please check your network';
  @override
  String get receiveTimeout =>
      TranslationOverrides.string(_root.$meta, 'network.errors.receiveTimeout', {}) ??
      'Receive timeout, please check your network';
  @override
  String get badCertificate =>
      TranslationOverrides.string(_root.$meta, 'network.errors.badCertificate', {}) ?? 'Bad certificate';
  @override
  String get cancel => TranslationOverrides.string(_root.$meta, 'network.errors.cancel', {}) ?? 'Request cancelled';
  @override
  String get connectionError =>
      TranslationOverrides.string(_root.$meta, 'network.errors.connectionError', {}) ??
      'Connection error, please check your network';
  @override
  String unknown({required Object error}) =>
      TranslationOverrides.string(_root.$meta, 'network.errors.unknown', {'error': error}) ?? 'Unknown error: ${error}';
  @override
  String get retryLater =>
      TranslationOverrides.string(_root.$meta, 'network.errors.retryLater', {}) ?? 'Please try again later';
  @override
  String get badRequest => TranslationOverrides.string(_root.$meta, 'network.errors.badRequest', {}) ?? 'Bad request';
  @override
  String get unauthorized =>
      TranslationOverrides.string(_root.$meta, 'network.errors.unauthorized', {}) ?? 'Unauthorized, please login again';
  @override
  String get forbidden => TranslationOverrides.string(_root.$meta, 'network.errors.forbidden', {}) ?? 'Forbidden';
  @override
  String get notFound =>
      TranslationOverrides.string(_root.$meta, 'network.errors.notFound', {}) ?? 'Resource not found';
  @override
  String get timeout =>
      TranslationOverrides.string(_root.$meta, 'network.errors.timeout', {}) ?? 'Request timeout, please try again';
  @override
  String get conflict => TranslationOverrides.string(_root.$meta, 'network.errors.conflict', {}) ?? 'Conflict';
  @override
  String get validationFailed =>
      TranslationOverrides.string(_root.$meta, 'network.errors.validationFailed', {}) ?? 'Validation failed';
  @override
  String get tooManyRequests =>
      TranslationOverrides.string(_root.$meta, 'network.errors.tooManyRequests', {}) ??
      'Too many requests, please try again later';
  @override
  String get internalServerError =>
      TranslationOverrides.string(_root.$meta, 'network.errors.internalServerError', {}) ?? 'Internal server error';
  @override
  String get badGateway => TranslationOverrides.string(_root.$meta, 'network.errors.badGateway', {}) ?? 'Bad gateway';
  @override
  String get serviceUnavailable =>
      TranslationOverrides.string(_root.$meta, 'network.errors.serviceUnavailable', {}) ?? 'Service unavailable';
  @override
  String get gatewayTimeout =>
      TranslationOverrides.string(_root.$meta, 'network.errors.gatewayTimeout', {}) ?? 'Gateway timeout';
  @override
  String serverError({required Object code}) =>
      TranslationOverrides.string(_root.$meta, 'network.errors.serverError', {'code': code}) ??
      'Server error (${code})';
  @override
  String requestError({required Object code}) =>
      TranslationOverrides.string(_root.$meta, 'network.errors.requestError', {'code': code}) ??
      'Request error (${code})';
  @override
  String get failed =>
      TranslationOverrides.string(_root.$meta, 'network.errors.failed', {}) ?? 'Network request failed';
}

// Path: order.status
class _TranslationsOrderStatusEn extends TranslationsOrderStatusZhCn {
  _TranslationsOrderStatusEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get all => TranslationOverrides.string(_root.$meta, 'order.status.all', {}) ?? 'All';
  @override
  String get pending => TranslationOverrides.string(_root.$meta, 'order.status.pending', {}) ?? 'Pending';
  @override
  String get paid => TranslationOverrides.string(_root.$meta, 'order.status.paid', {}) ?? 'Paid';
  @override
  String get completed => TranslationOverrides.string(_root.$meta, 'order.status.completed', {}) ?? 'Completed';
  @override
  String get cancelled => TranslationOverrides.string(_root.$meta, 'order.status.cancelled', {}) ?? 'Cancelled';
  @override
  String get refunded => TranslationOverrides.string(_root.$meta, 'order.status.refunded', {}) ?? 'Refunded';
  @override
  String get failed => TranslationOverrides.string(_root.$meta, 'order.status.failed', {}) ?? 'Failed';
}

// Path: profile.gender
class _TranslationsProfileGenderEn extends TranslationsProfileGenderZhCn {
  _TranslationsProfileGenderEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get male => TranslationOverrides.string(_root.$meta, 'profile.gender.male', {}) ?? 'Male';
  @override
  String get female => TranslationOverrides.string(_root.$meta, 'profile.gender.female', {}) ?? 'Female';
  @override
  String get unknown => TranslationOverrides.string(_root.$meta, 'profile.gender.unknown', {}) ?? 'Secret';
}

// Path: profile.info
class _TranslationsProfileInfoEn extends TranslationsProfileInfoZhCn {
  _TranslationsProfileInfoEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get basic => TranslationOverrides.string(_root.$meta, 'profile.info.basic', {}) ?? 'Basic Information';
  @override
  String get other => TranslationOverrides.string(_root.$meta, 'profile.info.other', {}) ?? 'Other Information';
  @override
  String get phone => TranslationOverrides.string(_root.$meta, 'profile.info.phone', {}) ?? 'Phone Number';
  @override
  String get gender => TranslationOverrides.string(_root.$meta, 'profile.info.gender', {}) ?? 'Gender';
  @override
  String get birthday => TranslationOverrides.string(_root.$meta, 'profile.info.birthday', {}) ?? 'Birthday';
  @override
  String get email => TranslationOverrides.string(_root.$meta, 'profile.info.email', {}) ?? 'Email';
  @override
  String get notSet => TranslationOverrides.string(_root.$meta, 'profile.info.notSet', {}) ?? 'Not Set';
}

// Path: profile.avatar
class _TranslationsProfileAvatarEn extends TranslationsProfileAvatarZhCn {
  _TranslationsProfileAvatarEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get clickToChange =>
      TranslationOverrides.string(_root.$meta, 'profile.avatar.clickToChange', {}) ?? 'Click to change avatar';
  @override
  String get uploading =>
      TranslationOverrides.string(_root.$meta, 'profile.avatar.uploading', {}) ??
      'Avatar upload feature is under development';
}

// Path: profile.walletPage
class _TranslationsProfileWalletPageEn extends TranslationsProfileWalletPageZhCn {
  _TranslationsProfileWalletPageEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'profile.walletPage.title', {}) ?? 'Wallet';
  @override
  String get topUp => TranslationOverrides.string(_root.$meta, 'profile.walletPage.topUp', {}) ?? 'Top Up';
  @override
  String get balance => TranslationOverrides.string(_root.$meta, 'profile.walletPage.balance', {}) ?? 'Balance';
  @override
  String get selectAmount =>
      TranslationOverrides.string(_root.$meta, 'profile.walletPage.selectAmount', {}) ?? 'Select Amount';
  @override
  String get rule => TranslationOverrides.string(_root.$meta, 'profile.walletPage.rule', {}) ?? 'Rules';
  @override
  String get ruleDesc =>
      TranslationOverrides.string(_root.$meta, 'profile.walletPage.ruleDesc', {}) ??
      'Top up specific packages to get points. Custom amount does not get points.';
  @override
  String get customAmount =>
      TranslationOverrides.string(_root.$meta, 'profile.walletPage.customAmount', {}) ?? 'Custom Amount';
  @override
  String get customAmountHint =>
      TranslationOverrides.string(_root.$meta, 'profile.walletPage.customAmountHint', {}) ??
      'Only for amounts above ¥500';
  @override
  String realPay({required Object amount}) =>
      TranslationOverrides.string(_root.$meta, 'profile.walletPage.realPay', {'amount': amount}) ?? 'Pay ¥${amount}';
  @override
  String bonus({required Object amount}) =>
      TranslationOverrides.string(_root.$meta, 'profile.walletPage.bonus', {'amount': amount}) ??
      'Get ${amount} points';
  @override
  String get noBonus => TranslationOverrides.string(_root.$meta, 'profile.walletPage.noBonus', {}) ?? 'No points';
  @override
  String get history => TranslationOverrides.string(_root.$meta, 'profile.walletPage.history', {}) ?? 'History';
  @override
  String historyCount({required Object count}) =>
      TranslationOverrides.string(_root.$meta, 'profile.walletPage.historyCount', {'count': count}) ?? 'Total ${count}';
  @override
  String get noHistory =>
      TranslationOverrides.string(_root.$meta, 'profile.walletPage.noHistory', {}) ?? 'No transaction history';
}

// Path: settings.schemes
class _TranslationsSettingsSchemesEn extends TranslationsSettingsSchemesZhCn {
  _TranslationsSettingsSchemesEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get shadOrange =>
      TranslationOverrides.string(_root.$meta, 'settings.schemes.shadOrange', {}) ?? 'Vibrant Orange (ShadOrange)';
  @override
  String get shadGreen =>
      TranslationOverrides.string(_root.$meta, 'settings.schemes.shadGreen', {}) ?? 'Natural Green (ShadGreen)';
  @override
  String get bahamaBlue =>
      TranslationOverrides.string(_root.$meta, 'settings.schemes.bahamaBlue', {}) ?? 'Bahama Blue (BahamaBlue)';
  @override
  String get damask => TranslationOverrides.string(_root.$meta, 'settings.schemes.damask', {}) ?? 'Damask Red (Damask)';
}

// Path: teamOrdering.scenarios
class _TranslationsTeamOrderingScenariosEn extends TranslationsTeamOrderingScenariosZhCn {
  _TranslationsTeamOrderingScenariosEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title =>
      TranslationOverrides.string(_root.$meta, 'teamOrdering.scenarios.title', {}) ?? 'Applicable Scenarios';
  @override
  String get subtitle =>
      TranslationOverrides.string(_root.$meta, 'teamOrdering.scenarios.subtitle', {}) ?? 'Meet different team needs';
  @override
  String get team => TranslationOverrides.string(_root.$meta, 'teamOrdering.scenarios.team', {}) ?? 'Team Ordering';
  @override
  String get teamDesc =>
      TranslationOverrides.string(_root.$meta, 'teamOrdering.scenarios.teamDesc', {}) ??
      'Corporate team building, department dinner';
  @override
  String get reserve =>
      TranslationOverrides.string(_root.$meta, 'teamOrdering.scenarios.reserve', {}) ?? 'Reservation Ordering';
  @override
  String get reserveDesc =>
      TranslationOverrides.string(_root.$meta, 'teamOrdering.scenarios.reserveDesc', {}) ??
      'Book in advance, pick up on time';
  @override
  String get vip => TranslationOverrides.string(_root.$meta, 'teamOrdering.scenarios.vip', {}) ?? 'VIP Ordering';
  @override
  String get vipDesc =>
      TranslationOverrides.string(_root.$meta, 'teamOrdering.scenarios.vipDesc', {}) ??
      'Bulk ordering, exclusive service';
}

// Path: teamOrdering.process
class _TranslationsTeamOrderingProcessEn extends TranslationsTeamOrderingProcessZhCn {
  _TranslationsTeamOrderingProcessEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'teamOrdering.process.title', {}) ?? 'Process';
  @override
  String get subtitle =>
      TranslationOverrides.string(_root.$meta, 'teamOrdering.process.subtitle', {}) ??
      'Simple three steps, easy booking';
  @override
  String get step1Title =>
      TranslationOverrides.string(_root.$meta, 'teamOrdering.process.step1Title', {}) ?? 'Contact Service';
  @override
  String get step1Desc =>
      TranslationOverrides.string(_root.$meta, 'teamOrdering.process.step1Desc', {}) ??
      'Call hotline or consult online to explain dining needs';
  @override
  String get step2Title =>
      TranslationOverrides.string(_root.$meta, 'teamOrdering.process.step2Title', {}) ?? 'Confirm Plan';
  @override
  String get step2Desc =>
      TranslationOverrides.string(_root.$meta, 'teamOrdering.process.step2Desc', {}) ??
      'Customer service customizes exclusive plan, confirms dishes and prices';
  @override
  String get step3Title =>
      TranslationOverrides.string(_root.$meta, 'teamOrdering.process.step3Title', {}) ?? 'Complete Booking';
  @override
  String get step3Desc =>
      TranslationOverrides.string(_root.$meta, 'teamOrdering.process.step3Desc', {}) ??
      'Confirm order info, pick up at store on time';
}

// Path: teamOrdering.advantages
class _TranslationsTeamOrderingAdvantagesEn extends TranslationsTeamOrderingAdvantagesZhCn {
  _TranslationsTeamOrderingAdvantagesEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title =>
      TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.title', {}) ?? 'Service Advantages';
  @override
  String get subtitle =>
      TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.subtitle', {}) ??
      'Professional team, trustworthy';
  @override
  String get custom =>
      TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.custom', {}) ?? 'Professional Customization';
  @override
  String get customDesc =>
      TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.customDesc', {}) ??
      'Provide personalized customization based on team size and taste';
  @override
  String get reserve =>
      TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.reserve', {}) ?? 'Advance Reservation';
  @override
  String get reserveDesc =>
      TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.reserveDesc', {}) ??
      'Support advance reservation, arrange dining time reasonably, avoid waiting';
  @override
  String get price => TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.price', {}) ?? 'Discount Price';
  @override
  String get priceDesc =>
      TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.priceDesc', {}) ??
      'Team ordering enjoys more discounts, bulk is cheaper';
  @override
  String get quality =>
      TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.quality', {}) ?? 'Quality Assurance';
  @override
  String get qualityDesc =>
      TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.qualityDesc', {}) ??
      'Strictly control ingredient quality, ensure every meal is fresh and delicious';
}

// Path: welcome_gift.tabs
class _TranslationsWelcomeGiftTabsEn extends TranslationsWelcomeGiftTabsZhCn {
  _TranslationsWelcomeGiftTabsEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get available => TranslationOverrides.string(_root.$meta, 'welcome_gift.tabs.available', {}) ?? 'Available';
  @override
  String get received => TranslationOverrides.string(_root.$meta, 'welcome_gift.tabs.received', {}) ?? 'Received';
}

// Path: welcome_gift.card
class _TranslationsWelcomeGiftCardEn extends TranslationsWelcomeGiftCardZhCn {
  _TranslationsWelcomeGiftCardEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get tag => TranslationOverrides.string(_root.$meta, 'welcome_gift.card.tag', {}) ?? 'Gift';
  @override
  late final _TranslationsWelcomeGiftCardStatusEn status = _TranslationsWelcomeGiftCardStatusEn._(_root);
  @override
  late final _TranslationsWelcomeGiftCardButtonEn button = _TranslationsWelcomeGiftCardButtonEn._(_root);
}

// Path: home.lottery.prizeStats
class _TranslationsHomeLotteryPrizeStatsEn extends TranslationsHomeLotteryPrizeStatsZhCn {
  _TranslationsHomeLotteryPrizeStatsEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get total => TranslationOverrides.string(_root.$meta, 'home.lottery.prizeStats.total', {}) ?? 'Total';
  @override
  String get used => TranslationOverrides.string(_root.$meta, 'home.lottery.prizeStats.used', {}) ?? 'Used';
  @override
  String get available =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.prizeStats.available', {}) ?? 'Available';
}

// Path: home.lottery.tabs
class _TranslationsHomeLotteryTabsEn extends TranslationsHomeLotteryTabsZhCn {
  _TranslationsHomeLotteryTabsEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get all => TranslationOverrides.string(_root.$meta, 'home.lottery.tabs.all', {}) ?? 'All';
  @override
  String get available => TranslationOverrides.string(_root.$meta, 'home.lottery.tabs.available', {}) ?? 'Available';
  @override
  String get used => TranslationOverrides.string(_root.$meta, 'home.lottery.tabs.used', {}) ?? 'Used';
  @override
  String get expired => TranslationOverrides.string(_root.$meta, 'home.lottery.tabs.expired', {}) ?? 'Expired';
}

// Path: home.lottery.prizeCard
class _TranslationsHomeLotteryPrizeCardEn extends TranslationsHomeLotteryPrizeCardZhCn {
  _TranslationsHomeLotteryPrizeCardEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get source =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.prizeCard.source', {}) ??
      'Point rewards, can be used in Point Mall';
  @override
  String getTime({required Object time}) =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.prizeCard.getTime', {'time': time}) ?? 'Got at: ${time}';
  @override
  String expiryTime({required Object time}) =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.prizeCard.expiryTime', {'time': time}) ??
      'Expiry: ${time}';
  @override
  String get statusExpired =>
      TranslationOverrides.string(_root.$meta, 'home.lottery.prizeCard.statusExpired', {}) ?? 'Expired';
}

// Path: welcome_gift.card.status
class _TranslationsWelcomeGiftCardStatusEn extends TranslationsWelcomeGiftCardStatusZhCn {
  _TranslationsWelcomeGiftCardStatusEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get received =>
      TranslationOverrides.string(_root.$meta, 'welcome_gift.card.status.received', {}) ?? 'Received';
}

// Path: welcome_gift.card.button
class _TranslationsWelcomeGiftCardButtonEn extends TranslationsWelcomeGiftCardButtonZhCn {
  _TranslationsWelcomeGiftCardButtonEn._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get claim => TranslationOverrides.string(_root.$meta, 'welcome_gift.card.button.claim', {}) ?? 'Claim';
  @override
  String get received =>
      TranslationOverrides.string(_root.$meta, 'welcome_gift.card.button.received', {}) ?? 'Received';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
          'about.title' => TranslationOverrides.string(_root.$meta, 'about.title', {}) ?? 'About Us',
          'about.appBrand' =>
            TranslationOverrides.string(_root.$meta, 'about.appBrand', {}) ?? 'Lunchbox Smart Vending Machine',
          'about.shareWithFriends' =>
            TranslationOverrides.string(_root.$meta, 'about.shareWithFriends', {}) ?? 'Share with Friends',
          'about.featuresTitle' =>
            TranslationOverrides.string(_root.$meta, 'about.featuresTitle', {}) ?? 'Our Features',
          'about.feature1Title' =>
            TranslationOverrides.string(_root.$meta, 'about.feature1Title', {}) ?? 'Central Kitchen',
          'about.feature1Desc' =>
            TranslationOverrides.string(_root.$meta, 'about.feature1Desc', {}) ??
                'Vending machines bring changes to diet life',
          'about.feature2Title' =>
            TranslationOverrides.string(_root.$meta, 'about.feature2Title', {}) ?? 'Quick Serving',
          'about.feature2Desc' =>
            TranslationOverrides.string(_root.$meta, 'about.feature2Desc', {}) ??
                'Different from traditional takeout and restaurants',
          'about.feature3Title' =>
            TranslationOverrides.string(_root.$meta, 'about.feature3Title', {}) ?? 'Entrepreneur Partner',
          'about.feature3Desc' =>
            TranslationOverrides.string(_root.$meta, 'about.feature3Desc', {}) ?? 'A risk-free investment tool',
          'about.feature4Title' =>
            TranslationOverrides.string(_root.$meta, 'about.feature4Title', {}) ?? 'Patented Machine',
          'about.feature4Desc' =>
            TranslationOverrides.string(_root.$meta, 'about.feature4Desc', {}) ??
                'Wealth creation machine for everyone',
          'about.policyTitle' => TranslationOverrides.string(_root.$meta, 'about.policyTitle', {}) ?? 'Policy & Terms',
          'about.userAgreementAndPrivacy' =>
            TranslationOverrides.string(_root.$meta, 'about.userAgreementAndPrivacy', {}) ??
                'User Agreement & Privacy Policy',
          'about.viewDetails' => TranslationOverrides.string(_root.$meta, 'about.viewDetails', {}) ?? 'View Details',
          'about.contactTitle' => TranslationOverrides.string(_root.$meta, 'about.contactTitle', {}) ?? 'Contact Us',
          'about.customerServiceHotline' =>
            TranslationOverrides.string(_root.$meta, 'about.customerServiceHotline', {}) ?? 'Customer Service Hotline',
          'about.customerServiceNumber' =>
            TranslationOverrides.string(_root.$meta, 'about.customerServiceNumber', {}) ?? '400-114-8818',
          'about.companyAddress' =>
            TranslationOverrides.string(_root.$meta, 'about.companyAddress', {}) ?? 'Company Address',
          'about.addressDetails' =>
            TranslationOverrides.string(_root.$meta, 'about.addressDetails', {}) ??
                'Room 1510, Building 1, No. 1 Kehui Road, Songshan Lake Park, Dongguan, Guangdong',
          'about.shareText' =>
            TranslationOverrides.string(_root.$meta, 'about.shareText', {}) ??
                'Come and use the Lunchbox Smart Vending Machine!',
          'auth.loginTitle' => TranslationOverrides.string(_root.$meta, 'auth.loginTitle', {}) ?? 'Welcome Back',
          'auth.loginButton' => TranslationOverrides.string(_root.$meta, 'auth.loginButton', {}) ?? 'Login',
          'auth.registerButton' => TranslationOverrides.string(_root.$meta, 'auth.registerButton', {}) ?? 'Register',
          'auth.forgotPassword' =>
            TranslationOverrides.string(_root.$meta, 'auth.forgotPassword', {}) ?? 'Forgot Password?',
          'auth.loginFailed' => TranslationOverrides.string(_root.$meta, 'auth.loginFailed', {}) ?? 'Login Failed',
          'auth.loginSuccess' => TranslationOverrides.string(_root.$meta, 'auth.loginSuccess', {}) ?? 'Login Success',
          'auth.registerTitle' =>
            TranslationOverrides.string(_root.$meta, 'auth.registerTitle', {}) ?? 'Create Account',
          'auth.nickname' => TranslationOverrides.string(_root.$meta, 'auth.nickname', {}) ?? 'Nickname',
          'auth.registerSuccess' =>
            TranslationOverrides.string(_root.$meta, 'auth.registerSuccess', {}) ?? 'Register Success',
          'auth.registerFailed' =>
            TranslationOverrides.string(_root.$meta, 'auth.registerFailed', {}) ?? 'Register Failed',
          'auth.forgotPasswordTitle' =>
            TranslationOverrides.string(_root.$meta, 'auth.forgotPasswordTitle', {}) ?? 'Reset Password',
          'auth.sendResetLink' =>
            TranslationOverrides.string(_root.$meta, 'auth.sendResetLink', {}) ?? 'Send Reset Link',
          'auth.resetLinkSent' =>
            TranslationOverrides.string(_root.$meta, 'auth.resetLinkSent', {}) ?? 'Reset Link Sent',
          'auth.required' => TranslationOverrides.string(_root.$meta, 'auth.required', {}) ?? 'Required',
          'auth.enterUsername' =>
            TranslationOverrides.string(_root.$meta, 'auth.enterUsername', {}) ?? 'Please enter username',
          'auth.enterPassword' =>
            TranslationOverrides.string(_root.$meta, 'auth.enterPassword', {}) ?? 'Please enter password',
          'auth.enterUsernameHint' =>
            TranslationOverrides.string(_root.$meta, 'auth.enterUsernameHint', {}) ?? 'Enter username or phone',
          'auth.passwordLoginTab' =>
            TranslationOverrides.string(_root.$meta, 'auth.passwordLoginTab', {}) ?? 'Password Login',
          'auth.codeLoginTab' => TranslationOverrides.string(_root.$meta, 'auth.codeLoginTab', {}) ?? 'Code Login',
          'auth.phoneNumber' => TranslationOverrides.string(_root.$meta, 'auth.phoneNumber', {}) ?? 'Phone Number',
          'auth.enterPhoneNumber' =>
            TranslationOverrides.string(_root.$meta, 'auth.enterPhoneNumber', {}) ?? 'Enter phone number',
          'auth.phoneInvalid' =>
            TranslationOverrides.string(_root.$meta, 'auth.phoneInvalid', {}) ?? 'Invalid phone number',
          'auth.getVerificationCode' =>
            TranslationOverrides.string(_root.$meta, 'auth.getVerificationCode', {}) ?? 'Get Code',
          'auth.retryInSeconds' =>
            ({required Object seconds}) =>
                TranslationOverrides.string(_root.$meta, 'auth.retryInSeconds', {'seconds': seconds}) ??
                'Retry in ${seconds}s',
          'auth.otherLoginMethods' =>
            TranslationOverrides.string(_root.$meta, 'auth.otherLoginMethods', {}) ?? 'Other login methods',
          'auth.enterNickname' =>
            TranslationOverrides.string(_root.$meta, 'auth.enterNickname', {}) ?? 'Please enter nickname',
          'auth.passwordMinLength' =>
            ({required Object length}) =>
                TranslationOverrides.string(_root.$meta, 'auth.passwordMinLength', {'length': length}) ??
                'Password must be at least ${length} characters',
          'auth.dontHaveAccount' =>
            TranslationOverrides.string(_root.$meta, 'auth.dontHaveAccount', {}) ?? 'Don\'t have an account?',
          'auth.resetPasswordHint' =>
            TranslationOverrides.string(_root.$meta, 'auth.resetPasswordHint', {}) ??
                'Enter your username or email to reset password',
          'auth.usernameOrEmail' =>
            TranslationOverrides.string(_root.$meta, 'auth.usernameOrEmail', {}) ?? 'Username / Email',
          'auth.slogan' =>
            TranslationOverrides.string(_root.$meta, 'auth.slogan', {}) ?? 'Convenient purchase, delicious on the go',
          'auth.resendCode' => TranslationOverrides.string(_root.$meta, 'auth.resendCode', {}) ?? 'Resend Code',
          'auth.email' => TranslationOverrides.string(_root.$meta, 'auth.email', {}) ?? 'Email',
          'auth.enterEmail' => TranslationOverrides.string(_root.$meta, 'auth.enterEmail', {}) ?? 'Please enter email',
          'auth.emailInvalid' =>
            TranslationOverrides.string(_root.$meta, 'auth.emailInvalid', {}) ?? 'Invalid email address',
          'auth.oldPassword' => TranslationOverrides.string(_root.$meta, 'auth.oldPassword', {}) ?? 'Old Password',
          'auth.enterOldPassword' =>
            TranslationOverrides.string(_root.$meta, 'auth.enterOldPassword', {}) ?? 'Please enter old password',
          'auth.newPassword' => TranslationOverrides.string(_root.$meta, 'auth.newPassword', {}) ?? 'New Password',
          'auth.enterNewPassword' =>
            TranslationOverrides.string(_root.$meta, 'auth.enterNewPassword', {}) ?? 'Please enter new password',
          'auth.resetPasswordButton' =>
            TranslationOverrides.string(_root.$meta, 'auth.resetPasswordButton', {}) ?? 'Reset Password',
          'auth.resetPasswordSuccess' =>
            TranslationOverrides.string(_root.$meta, 'auth.resetPasswordSuccess', {}) ?? 'Password reset successful',
          'auth.resetPasswordFailed' =>
            TranslationOverrides.string(_root.$meta, 'auth.resetPasswordFailed', {}) ?? 'Password reset failed',
          'auth.confirmPassword' =>
            TranslationOverrides.string(_root.$meta, 'auth.confirmPassword', {}) ?? 'Confirm Password',
          'auth.enterConfirmPassword' =>
            TranslationOverrides.string(_root.$meta, 'auth.enterConfirmPassword', {}) ?? 'Please enter password again',
          'auth.passwordNotMatch' =>
            TranslationOverrides.string(_root.$meta, 'auth.passwordNotMatch', {}) ?? 'Passwords do not match',
          'cart.title' => TranslationOverrides.string(_root.$meta, 'cart.title', {}) ?? 'Cart',
          'cart.clear' => TranslationOverrides.string(_root.$meta, 'cart.clear', {}) ?? 'Clear',
          'cart.empty' => TranslationOverrides.string(_root.$meta, 'cart.empty', {}) ?? 'Cart is empty',
          'cart.total' => TranslationOverrides.string(_root.$meta, 'cart.total', {}) ?? 'Total',
          'cart.checkout' => TranslationOverrides.string(_root.$meta, 'cart.checkout', {}) ?? 'Checkout',
          'cart.goShopping' => TranslationOverrides.string(_root.$meta, 'cart.goShopping', {}) ?? 'Go Shopping',
          'cart.clearCart' => TranslationOverrides.string(_root.$meta, 'cart.clearCart', {}) ?? 'Clear Cart',
          'cart.clearCartConfirm' =>
            TranslationOverrides.string(_root.$meta, 'cart.clearCartConfirm', {}) ??
                'Are you sure you want to clear the cart?',
          'cart.emptyHint' => TranslationOverrides.string(_root.$meta, 'cart.emptyHint', {}) ?? 'Go pick some items',
          'cart.deleteConfirm' =>
            ({required Object count}) =>
                TranslationOverrides.string(_root.$meta, 'cart.deleteConfirm', {'count': count}) ??
                'Delete ${count} items?',
          'cart.selectedCount' =>
            ({required Object count}) =>
                TranslationOverrides.string(_root.$meta, 'cart.selectedCount', {'count': count}) ?? 'Selected ${count}',
          'city.title' => TranslationOverrides.string(_root.$meta, 'city.title', {}) ?? 'Select City',
          'city.search' => TranslationOverrides.string(_root.$meta, 'city.search', {}) ?? 'Search City',
          'city.hot' => TranslationOverrides.string(_root.$meta, 'city.hot', {}) ?? 'Hot Cities',
          'city.noResult' => TranslationOverrides.string(_root.$meta, 'city.noResult', {}) ?? 'No related cities found',
          'city.viewAll' => TranslationOverrides.string(_root.$meta, 'city.viewAll', {}) ?? 'View All Cities',
          'city.switchSuccess' => TranslationOverrides.string(_root.$meta, 'city.switchSuccess', {}) ?? 'City switched',
          'city.switchedTo' =>
            ({required Object name}) =>
                TranslationOverrides.string(_root.$meta, 'city.switchedTo', {'name': name}) ?? 'Switched to ${name}',
          'city.switchFailed' => TranslationOverrides.string(_root.$meta, 'city.switchFailed', {}) ?? 'Switch failed',
          'city.saveFailed' =>
            TranslationOverrides.string(_root.$meta, 'city.saveFailed', {}) ??
                'Unable to save selected city, please try again',
          'common.login' => TranslationOverrides.string(_root.$meta, 'common.login', {}) ?? 'Login',
          'common.register' => TranslationOverrides.string(_root.$meta, 'common.register', {}) ?? 'Register',
          'common.username' => TranslationOverrides.string(_root.$meta, 'common.username', {}) ?? 'Username',
          'common.password' => TranslationOverrides.string(_root.$meta, 'common.password', {}) ?? 'Password',
          'common.confirm' => TranslationOverrides.string(_root.$meta, 'common.confirm', {}) ?? 'Confirm',
          'common.cancel' => TranslationOverrides.string(_root.$meta, 'common.cancel', {}) ?? 'Cancel',
          'common.error' => TranslationOverrides.string(_root.$meta, 'common.error', {}) ?? 'Error',
          'common.success' => TranslationOverrides.string(_root.$meta, 'common.success', {}) ?? 'Success',
          'common.loading' => TranslationOverrides.string(_root.$meta, 'common.loading', {}) ?? 'Loading...',
          'common.ok' => TranslationOverrides.string(_root.$meta, 'common.ok', {}) ?? 'OK',
          'common.save' => TranslationOverrides.string(_root.$meta, 'common.save', {}) ?? 'Save',
          'common.delete' => TranslationOverrides.string(_root.$meta, 'common.delete', {}) ?? 'Delete',
          'common.edit' => TranslationOverrides.string(_root.$meta, 'common.edit', {}) ?? 'Edit',
          'common.search' => TranslationOverrides.string(_root.$meta, 'common.search', {}) ?? 'Search',
          'common.noData' => TranslationOverrides.string(_root.$meta, 'common.noData', {}) ?? 'No Data',
          'common.retry' => TranslationOverrides.string(_root.$meta, 'common.retry', {}) ?? 'Retry',
          'common.skip' => TranslationOverrides.string(_root.$meta, 'common.skip', {}) ?? 'Skip',
          'common.refresh' => TranslationOverrides.string(_root.$meta, 'common.refresh', {}) ?? 'Refresh',
          'common.loadFailed' => TranslationOverrides.string(_root.$meta, 'common.loadFailed', {}) ?? 'Load Failed',
          'common.unknownError' =>
            TranslationOverrides.string(_root.$meta, 'common.unknownError', {}) ?? 'Unknown Error',
          'common.info' => TranslationOverrides.string(_root.$meta, 'common.info', {}) ?? 'Info',
          'common.developing' =>
            TranslationOverrides.string(_root.$meta, 'common.developing', {}) ?? 'Page is under development',
          'common.appName' => TranslationOverrides.string(_root.$meta, 'common.appName', {}) ?? 'E-Lunchbox',
          'common.logout' => TranslationOverrides.string(_root.$meta, 'common.logout', {}) ?? 'Logout',
          'common.pullToRefresh' =>
            TranslationOverrides.string(_root.$meta, 'common.pullToRefresh', {}) ?? 'Pull to refresh',
          'common.releaseToRefresh' =>
            TranslationOverrides.string(_root.$meta, 'common.releaseToRefresh', {}) ?? 'Release to refresh',
          'common.refreshing' => TranslationOverrides.string(_root.$meta, 'common.refreshing', {}) ?? 'Refreshing...',
          'common.noMoreData' =>
            TranslationOverrides.string(_root.$meta, 'common.noMoreData', {}) ?? '- No more data -',
          'common.price' =>
            ({required Object price}) =>
                TranslationOverrides.string(_root.$meta, 'common.price', {'price': price}) ?? '¥${price}',
          'common.networkError' =>
            ({required Object message}) =>
                TranslationOverrides.string(_root.$meta, 'common.networkError', {'message': message}) ??
                'Network Error: ${message}',
          'common.networkErrorWithCode' =>
            ({required Object statusCode, required Object message}) =>
                TranslationOverrides.string(_root.$meta, 'common.networkErrorWithCode', {
                  'statusCode': statusCode,
                  'message': message,
                }) ??
                'Network Error (${statusCode}): ${message}',
          'common.serverError' =>
            ({required Object statusCode, required Object message}) =>
                TranslationOverrides.string(_root.$meta, 'common.serverError', {
                  'statusCode': statusCode,
                  'message': message,
                }) ??
                'Server Error (${statusCode}): ${message}',
          'common.cacheError' =>
            ({required Object message}) =>
                TranslationOverrides.string(_root.$meta, 'common.cacheError', {'message': message}) ??
                'Cache Error: ${message}',
          'common.notFound' =>
            ({required Object resource}) =>
                TranslationOverrides.string(_root.$meta, 'common.notFound', {'resource': resource}) ??
                'Not Found: ${resource}',
          'common.unauthorized' =>
            TranslationOverrides.string(_root.$meta, 'common.unauthorized', {}) ?? 'Unauthorized, please login again',
          'common.validationError' =>
            ({required Object message}) =>
                TranslationOverrides.string(_root.$meta, 'common.validationError', {'message': message}) ??
                'Validation Error: ${message}',
          'common.validationErrorWithDetails' =>
            ({required Object message, required Object errors}) =>
                TranslationOverrides.string(_root.$meta, 'common.validationErrorWithDetails', {
                  'message': message,
                  'errors': errors,
                }) ??
                'Validation Error: ${message} (${errors})',
          'common.warning' => TranslationOverrides.string(_root.$meta, 'common.warning', {}) ?? 'Warning',
          'community.title' => TranslationOverrides.string(_root.$meta, 'community.title', {}) ?? 'Community Benefits',
          'community.join' => TranslationOverrides.string(_root.$meta, 'community.join', {}) ?? 'Join Community',
          'community.share' =>
            TranslationOverrides.string(_root.$meta, 'community.share', {}) ?? 'Share delicious food with foodies',
          'community.org' =>
            TranslationOverrides.string(_root.$meta, 'community.org', {}) ?? 'Dongguan CAS Cloud Computing Center',
          'community.dept' =>
            TranslationOverrides.string(_root.$meta, 'community.dept', {}) ?? 'Cloud Computing Center',
          'community.scanHint' =>
            TranslationOverrides.string(_root.$meta, 'community.scanHint', {}) ??
                'Scan to join Dongguan CAS Cloud Computing Center',
          'community.features.coupon' =>
            TranslationOverrides.string(_root.$meta, 'community.features.coupon', {}) ?? 'Exclusive Coupons',
          'community.features.couponHint' =>
            TranslationOverrides.string(_root.$meta, 'community.features.couponHint', {}) ??
                'Exclusive discounts for group members',
          'community.features.tasting' =>
            TranslationOverrides.string(_root.$meta, 'community.features.tasting', {}) ?? 'New Product Tasting',
          'community.features.tastingHint' =>
            TranslationOverrides.string(_root.$meta, 'community.features.tastingHint', {}) ??
                'Taste the latest food first',
          'community.features.exchange' =>
            TranslationOverrides.string(_root.$meta, 'community.features.exchange', {}) ?? 'Food Exchange',
          'community.features.exchangeHint' =>
            TranslationOverrides.string(_root.$meta, 'community.features.exchangeHint', {}) ??
                'Share insights with food experts',
          'community.features.priority' =>
            TranslationOverrides.string(_root.$meta, 'community.features.priority', {}) ?? 'Priority Access',
          'community.features.priorityHint' =>
            TranslationOverrides.string(_root.$meta, 'community.features.priorityHint', {}) ??
                'Priority participation in food events',
          'community.features.activity' =>
            TranslationOverrides.string(_root.$meta, 'community.features.activity', {}) ?? 'Community Events',
          'community.features.activityHint' =>
            TranslationOverrides.string(_root.$meta, 'community.features.activityHint', {}) ??
                'Regular offline gatherings',
          'community.features.topic' =>
            TranslationOverrides.string(_root.$meta, 'community.features.topic', {}) ?? 'Topic Discussion',
          'community.features.topicHint' =>
            TranslationOverrides.string(_root.$meta, 'community.features.topicHint', {}) ??
                'Participate in topics to win rewards',
          'community.whyJoin' =>
            TranslationOverrides.string(_root.$meta, 'community.whyJoin', {}) ?? 'Why join our community?',
          'community.reason1' =>
            TranslationOverrides.string(_root.$meta, 'community.reason1', {}) ?? 'Daily food recommendations',
          'community.reason2' =>
            TranslationOverrides.string(_root.$meta, 'community.reason2', {}) ?? 'Limited time offers, save money',
          'community.reason3' =>
            TranslationOverrides.string(_root.$meta, 'community.reason3', {}) ?? 'Professional food reviews',
          'community.reason4' =>
            TranslationOverrides.string(_root.$meta, 'community.reason4', {}) ?? 'Food making tutorials',
          'coupon.title' => TranslationOverrides.string(_root.$meta, 'coupon.title', {}) ?? 'Coupon',
          'coupon.tabs.available' =>
            TranslationOverrides.string(_root.$meta, 'coupon.tabs.available', {}) ?? 'Available',
          'coupon.tabs.received' => TranslationOverrides.string(_root.$meta, 'coupon.tabs.received', {}) ?? 'Received',
          'coupon.tabs.expired' => TranslationOverrides.string(_root.$meta, 'coupon.tabs.expired', {}) ?? 'Expired',
          'coupon.tabs.canUse' => TranslationOverrides.string(_root.$meta, 'coupon.tabs.canUse', {}) ?? 'To Use',
          'coupon.tabs.cannotUse' =>
            TranslationOverrides.string(_root.$meta, 'coupon.tabs.cannotUse', {}) ?? 'Unavailable',
          'coupon.unit' => TranslationOverrides.string(_root.$meta, 'coupon.unit', {}) ?? '\$',
          'coupon.condition' =>
            ({required Object amount}) =>
                TranslationOverrides.string(_root.$meta, 'coupon.condition', {'amount': amount}) ??
                'Coupon\nOver ${amount}',
          'coupon.conditionNoThreshold' =>
            TranslationOverrides.string(_root.$meta, 'coupon.conditionNoThreshold', {}) ?? 'Coupon\nNo threshold',
          'coupon.validForever' =>
            TranslationOverrides.string(_root.$meta, 'coupon.validForever', {}) ?? 'Valid Forever',
          'coupon.btnReceive' => TranslationOverrides.string(_root.$meta, 'coupon.btnReceive', {}) ?? 'Receive',
          'coupon.btnReceived' => TranslationOverrides.string(_root.$meta, 'coupon.btnReceived', {}) ?? 'Received',
          'coupon.btnUse' => TranslationOverrides.string(_root.$meta, 'coupon.btnUse', {}) ?? 'Use',
          'coupon.btnExpired' => TranslationOverrides.string(_root.$meta, 'coupon.btnExpired', {}) ?? 'Expired',
          'coupon.discount' =>
            ({required Object amount}) =>
                TranslationOverrides.string(_root.$meta, 'coupon.discount', {'amount': amount}) ??
                '\$ ${amount} Coupon',
          'coupon.discountOff' =>
            ({required Object amount}) =>
                TranslationOverrides.string(_root.$meta, 'coupon.discountOff', {'amount': amount}) ??
                '\$ ${amount} Off',
          'coupon.noCoupons' =>
            TranslationOverrides.string(_root.$meta, 'coupon.noCoupons', {}) ?? 'No coupons available',
          'coupon.expiryPrefix' =>
            TranslationOverrides.string(_root.$meta, 'coupon.expiryPrefix', {}) ?? 'Expires at: ',
          'coupon.statusAvailable' =>
            TranslationOverrides.string(_root.$meta, 'coupon.statusAvailable', {}) ?? 'Available',
          'coupon.statusUnavailable' =>
            TranslationOverrides.string(_root.$meta, 'coupon.statusUnavailable', {}) ?? 'Unavailable',
          'device.title' => TranslationOverrides.string(_root.$meta, 'device.title', {}) ?? 'Device Detail',
          'device.info' => TranslationOverrides.string(_root.$meta, 'device.info', {}) ?? 'Device Information',
          'device.address' => TranslationOverrides.string(_root.$meta, 'device.address', {}) ?? 'Address',
          'device.distance' => TranslationOverrides.string(_root.$meta, 'device.distance', {}) ?? 'Distance',
          'device.status' => TranslationOverrides.string(_root.$meta, 'device.status', {}) ?? 'Status',
          'device.statusOnline' => TranslationOverrides.string(_root.$meta, 'device.statusOnline', {}) ?? 'Open',
          'device.statusOffline' => TranslationOverrides.string(_root.$meta, 'device.statusOffline', {}) ?? 'Closed',
          'device.online' => TranslationOverrides.string(_root.$meta, 'device.online', {}) ?? 'Online',
          'device.offline' => TranslationOverrides.string(_root.$meta, 'device.offline', {}) ?? 'Offline',
          'device.paymentMethods' =>
            TranslationOverrides.string(_root.$meta, 'device.paymentMethods', {}) ?? 'Payment Methods: ',
          'device.mobilePayment' =>
            TranslationOverrides.string(_root.$meta, 'device.mobilePayment', {}) ?? 'Mobile Payment',
          'device.cash' => TranslationOverrides.string(_root.$meta, 'device.cash', {}) ?? 'Cash',
          'device.noProducts' => TranslationOverrides.string(_root.$meta, 'device.noProducts', {}) ?? 'No products',
          'device.productList' => TranslationOverrides.string(_root.$meta, 'device.productList', {}) ?? 'Product List',
          'device.soldOut' => TranslationOverrides.string(_root.$meta, 'device.soldOut', {}) ?? 'Sold Out',
          'device.reportIssue' => TranslationOverrides.string(_root.$meta, 'device.reportIssue', {}) ?? 'Report Issue',
          'device.reportDeviceIssue' =>
            TranslationOverrides.string(_root.$meta, 'device.reportDeviceIssue', {}) ?? 'Report Device Issue',
          'device.reportIssueHint' =>
            TranslationOverrides.string(_root.$meta, 'device.reportIssueHint', {}) ?? 'Please describe the issue...',
          'device.reportSuccess' =>
            TranslationOverrides.string(_root.$meta, 'device.reportSuccess', {}) ?? 'Issue reported successfully',
          'device.loadFailed' =>
            ({required Object error}) =>
                TranslationOverrides.string(_root.$meta, 'device.loadFailed', {'error': error}) ??
                'Load failed: ${error}',
          'device.loadProductsFailed' =>
            ({required Object error}) =>
                TranslationOverrides.string(_root.$meta, 'device.loadProductsFailed', {'error': error}) ??
                'Load products failed: ${error}',
          'device.nearby' => TranslationOverrides.string(_root.$meta, 'device.nearby', {}) ?? 'Nearby Devices',
          'device.sortByDistance' =>
            TranslationOverrides.string(_root.$meta, 'device.sortByDistance', {}) ?? 'Sort by Distance',
          'device.sortByName' => TranslationOverrides.string(_root.$meta, 'device.sortByName', {}) ?? 'Sort by Name',
          'device.filterOnline' =>
            TranslationOverrides.string(_root.$meta, 'device.filterOnline', {}) ?? 'Show Online Only',
          'device.noDevicesNearby' =>
            TranslationOverrides.string(_root.$meta, 'device.noDevicesNearby', {}) ?? 'No devices nearby',
          'device.maintenance' => TranslationOverrides.string(_root.$meta, 'device.maintenance', {}) ?? 'Maintenance',
          'device.unknown' => TranslationOverrides.string(_root.$meta, 'device.unknown', {}) ?? 'Unknown',
          'device.cashPayment' => TranslationOverrides.string(_root.$meta, 'device.cashPayment', {}) ?? 'Cash Payment',
          'device.frequent' => TranslationOverrides.string(_root.$meta, 'device.frequent', {}) ?? 'Frequent Devices',
          'device.menu' => TranslationOverrides.string(_root.$meta, 'device.menu', {}) ?? 'Menu',
          'device.classicMenu' => TranslationOverrides.string(_root.$meta, 'device.classicMenu', {}) ?? 'Classic Menu',
          'device.limitedDiscount' =>
            TranslationOverrides.string(_root.$meta, 'device.limitedDiscount', {}) ?? 'Limited Discount',
          'device.monthlySales' =>
            ({required Object count}) =>
                TranslationOverrides.string(_root.$meta, 'device.monthlySales', {'count': count}) ?? 'Sold ${count}',
          'device.stock' =>
            ({required Object count}) =>
                TranslationOverrides.string(_root.$meta, 'device.stock', {'count': count}) ?? '${count} left',
          'device.soldOutLabel' => TranslationOverrides.string(_root.$meta, 'device.soldOutLabel', {}) ?? 'Sold Out',
          'device.selfPickupOrder' =>
            TranslationOverrides.string(_root.$meta, 'device.selfPickupOrder', {}) ?? 'Pickup Order',
          'device.selectedProducts' =>
            TranslationOverrides.string(_root.$meta, 'device.selectedProducts', {}) ?? 'Selected',
          'device.subtotal' => TranslationOverrides.string(_root.$meta, 'device.subtotal', {}) ?? 'Subtotal',
          'device.estimatedPrice' =>
            TranslationOverrides.string(_root.$meta, 'device.estimatedPrice', {}) ?? 'Estimated',
          'device.originalPrice' => TranslationOverrides.string(_root.$meta, 'device.originalPrice', {}) ?? 'Original',
          'device.enabled' => TranslationOverrides.string(_root.$meta, 'device.enabled', {}) ?? 'Enabled',
          'device.loadedFrequent' =>
            ({required Object count}) =>
                TranslationOverrides.string(_root.$meta, 'device.loadedFrequent', {'count': count}) ??
                'Loaded ${count} frequent devices',
          'device.noFrequentDevices' =>
            TranslationOverrides.string(_root.$meta, 'device.noFrequentDevices', {}) ?? 'No frequent devices',
          'device.noNearbyDevices' =>
            TranslationOverrides.string(_root.$meta, 'device.noNearbyDevices', {}) ?? 'No nearby devices',
          'device.businessHoursDefault' =>
            TranslationOverrides.string(_root.$meta, 'device.businessHoursDefault', {}) ?? '09:00-18:00',
          'device_info.browser' => TranslationOverrides.string(_root.$meta, 'device_info.browser', {}) ?? 'Browser',
          'device_info.platform' => TranslationOverrides.string(_root.$meta, 'device_info.platform', {}) ?? 'Platform',
          'device_info.userAgent' =>
            TranslationOverrides.string(_root.$meta, 'device_info.userAgent', {}) ?? 'User Agent',
          'device_info.language' => TranslationOverrides.string(_root.$meta, 'device_info.language', {}) ?? 'Language',
          'device_info.memory' => TranslationOverrides.string(_root.$meta, 'device_info.memory', {}) ?? 'Memory',
          'device_info.brand' => TranslationOverrides.string(_root.$meta, 'device_info.brand', {}) ?? 'Brand',
          'device_info.model' => TranslationOverrides.string(_root.$meta, 'device_info.model', {}) ?? 'Model',
          'device_info.systemVersion' =>
            TranslationOverrides.string(_root.$meta, 'device_info.systemVersion', {}) ?? 'System Version',
          'device_info.sdkVersion' =>
            TranslationOverrides.string(_root.$meta, 'device_info.sdkVersion', {}) ?? 'SDK Version',
          'device_info.manufacturer' =>
            TranslationOverrides.string(_root.$meta, 'device_info.manufacturer', {}) ?? 'Manufacturer',
          'device_info.hardware' => TranslationOverrides.string(_root.$meta, 'device_info.hardware', {}) ?? 'Hardware',
          'device_info.host' => TranslationOverrides.string(_root.$meta, 'device_info.host', {}) ?? 'Host',
          'device_info.id' => TranslationOverrides.string(_root.$meta, 'device_info.id', {}) ?? 'ID',
          'device_info.name' => TranslationOverrides.string(_root.$meta, 'device_info.name', {}) ?? 'Name',
          'device_info.systemName' =>
            TranslationOverrides.string(_root.$meta, 'device_info.systemName', {}) ?? 'System Name',
          'device_info.machine' => TranslationOverrides.string(_root.$meta, 'device_info.machine', {}) ?? 'Machine',
          'device_info.uniqueId' => TranslationOverrides.string(_root.$meta, 'device_info.uniqueId', {}) ?? 'Unique ID',
          'feedback.title' => TranslationOverrides.string(_root.$meta, 'feedback.title', {}) ?? 'Feedback',
          'feedback.subtitle' =>
            TranslationOverrides.string(_root.$meta, 'feedback.subtitle', {}) ??
                'Your feedback is our motivation for progress',
          'feedback.selectType' =>
            TranslationOverrides.string(_root.$meta, 'feedback.selectType', {}) ?? 'Select Feedback Type',
          'feedback.errorReport' =>
            TranslationOverrides.string(_root.$meta, 'feedback.errorReport', {}) ?? 'Error Report',
          'feedback.suggestion' => TranslationOverrides.string(_root.$meta, 'feedback.suggestion', {}) ?? 'Suggestion',
          'feedback.complaint' => TranslationOverrides.string(_root.$meta, 'feedback.complaint', {}) ?? 'Complaint',
          'feedback.other' => TranslationOverrides.string(_root.$meta, 'feedback.other', {}) ?? 'Other',
          'feedback.description' =>
            TranslationOverrides.string(_root.$meta, 'feedback.description', {}) ?? 'Problem Description',
          'feedback.titleHint' =>
            TranslationOverrides.string(_root.$meta, 'feedback.titleHint', {}) ??
                'Please enter the problem title (Required)',
          'feedback.contentHint' =>
            TranslationOverrides.string(_root.$meta, 'feedback.contentHint', {}) ??
                'Please describe the problem or suggestion in detail (Required)',
          'feedback.uploadScreenshot' =>
            TranslationOverrides.string(_root.$meta, 'feedback.uploadScreenshot', {}) ?? 'Upload Screenshot (Optional)',
          'feedback.addImage' => TranslationOverrides.string(_root.$meta, 'feedback.addImage', {}) ?? 'Add Image',
          'feedback.uploadLimitHint' =>
            TranslationOverrides.string(_root.$meta, 'feedback.uploadLimitHint', {}) ??
                'Up to 3 images, each not exceeding 2MB, support jpg, png formats',
          'feedback.contactOptional' =>
            TranslationOverrides.string(_root.$meta, 'feedback.contactOptional', {}) ??
                'Contact Information (Optional)',
          'feedback.contactInputHint' =>
            TranslationOverrides.string(_root.$meta, 'feedback.contactInputHint', {}) ??
                'Please enter your phone number or email for us to contact you',
          'feedback.submit' => TranslationOverrides.string(_root.$meta, 'feedback.submit', {}) ?? 'Submit Feedback',
          'feedback.submitSuccess' =>
            TranslationOverrides.string(_root.$meta, 'feedback.submitSuccess', {}) ??
                'Feedback submitted successfully, thank you for your support',
          'feedback.submitFailed' =>
            TranslationOverrides.string(_root.$meta, 'feedback.submitFailed', {}) ??
                'Feedback submission failed, please try again later',
          'help.title' => TranslationOverrides.string(_root.$meta, 'help.title', {}) ?? 'Help Center',
          'help.developing' =>
            TranslationOverrides.string(_root.$meta, 'help.developing', {}) ?? 'Help page is under development',
          'home.selectCity' => TranslationOverrides.string(_root.$meta, 'home.selectCity', {}) ?? 'Select City',
          'home.nearbyDevices' =>
            TranslationOverrides.string(_root.$meta, 'home.nearbyDevices', {}) ?? 'Nearby Devices',
          'home.moreDevices' => TranslationOverrides.string(_root.$meta, 'home.moreDevices', {}) ?? 'More Devices',
          'home.deviceDistance' =>
            ({required Object name, required Object distance}) =>
                TranslationOverrides.string(_root.$meta, 'home.deviceDistance', {'name': name, 'distance': distance}) ??
                '${name} is ${distance} away',
          'home.recommendTitle' =>
            TranslationOverrides.string(_root.$meta, 'home.recommendTitle', {}) ?? 'Recommended for Me',
          'home.grid.welfare' => TranslationOverrides.string(_root.$meta, 'home.grid.welfare', {}) ?? 'Welfare',
          'home.grid.service' => TranslationOverrides.string(_root.$meta, 'home.grid.service', {}) ?? 'Service',
          'home.grid.coupon' => TranslationOverrides.string(_root.$meta, 'home.grid.coupon', {}) ?? 'Coupons',
          'home.grid.lottery' => TranslationOverrides.string(_root.$meta, 'home.grid.lottery', {}) ?? 'Lucky Draw',
          'home.grid.invite' => TranslationOverrides.string(_root.$meta, 'home.grid.invite', {}) ?? 'Invite Friends',
          'home.lottery.title' => TranslationOverrides.string(_root.$meta, 'home.lottery.title', {}) ?? 'Lucky Draw',
          'home.lottery.prizes' => TranslationOverrides.string(_root.$meta, 'home.lottery.prizes', {}) ?? 'My Prizes',
          'home.lottery.rules' =>
            TranslationOverrides.string(_root.$meta, 'home.lottery.rules', {}) ?? 'Activity Rules',
          'home.lottery.subtitle' =>
            TranslationOverrides.string(_root.$meta, 'home.lottery.subtitle', {}) ?? 'Join the draw, win great prizes',
          'home.lottery.remaining' =>
            ({required Object count}) =>
                TranslationOverrides.string(_root.$meta, 'home.lottery.remaining', {'count': count}) ??
                'Remaining: ${count}',
          'home.lottery.spin' => TranslationOverrides.string(_root.$meta, 'home.lottery.spin', {}) ?? 'Spin',
          'home.lottery.spinning' => TranslationOverrides.string(_root.$meta, 'home.lottery.spinning', {}) ?? '...',
          'home.lottery.congratulations' =>
            TranslationOverrides.string(_root.$meta, 'home.lottery.congratulations', {}) ?? 'Congratulations',
          'home.lottery.accept' => TranslationOverrides.string(_root.$meta, 'home.lottery.accept', {}) ?? 'Accept',
          'home.lottery.rule1' =>
            TranslationOverrides.string(_root.$meta, 'home.lottery.rule1', {}) ??
                'Free draws daily, complete tasks for more',
          'home.lottery.rule2' =>
            TranslationOverrides.string(_root.$meta, 'home.lottery.rule2', {}) ??
                'Coupons valid for 48h, Points added automatically',
          'home.lottery.rule3' =>
            TranslationOverrides.string(_root.$meta, 'home.lottery.rule3', {}) ?? 'Platform reserves all rights',
          'home.lottery.prizeUnit' =>
            TranslationOverrides.string(_root.$meta, 'home.lottery.prizeUnit', {}) ?? 'Points',
          'home.lottery.prizeList' =>
            TranslationOverrides.string(_root.$meta, 'home.lottery.prizeList', {}) ?? 'Prize List',
          'home.lottery.back' => TranslationOverrides.string(_root.$meta, 'home.lottery.back', {}) ?? 'Back',
          'home.lottery.prizeStats.total' =>
            TranslationOverrides.string(_root.$meta, 'home.lottery.prizeStats.total', {}) ?? 'Total',
          'home.lottery.prizeStats.used' =>
            TranslationOverrides.string(_root.$meta, 'home.lottery.prizeStats.used', {}) ?? 'Used',
          'home.lottery.prizeStats.available' =>
            TranslationOverrides.string(_root.$meta, 'home.lottery.prizeStats.available', {}) ?? 'Available',
          'home.lottery.tabs.all' => TranslationOverrides.string(_root.$meta, 'home.lottery.tabs.all', {}) ?? 'All',
          'home.lottery.tabs.available' =>
            TranslationOverrides.string(_root.$meta, 'home.lottery.tabs.available', {}) ?? 'Available',
          'home.lottery.tabs.used' => TranslationOverrides.string(_root.$meta, 'home.lottery.tabs.used', {}) ?? 'Used',
          'home.lottery.tabs.expired' =>
            TranslationOverrides.string(_root.$meta, 'home.lottery.tabs.expired', {}) ?? 'Expired',
          'home.lottery.prizeCard.source' =>
            TranslationOverrides.string(_root.$meta, 'home.lottery.prizeCard.source', {}) ??
                'Point rewards, can be used in Point Mall',
          'home.lottery.prizeCard.getTime' =>
            ({required Object time}) =>
                TranslationOverrides.string(_root.$meta, 'home.lottery.prizeCard.getTime', {'time': time}) ??
                'Got at: ${time}',
          'home.lottery.prizeCard.expiryTime' =>
            ({required Object time}) =>
                TranslationOverrides.string(_root.$meta, 'home.lottery.prizeCard.expiryTime', {'time': time}) ??
                'Expiry: ${time}',
          'home.lottery.prizeCard.statusExpired' =>
            TranslationOverrides.string(_root.$meta, 'home.lottery.prizeCard.statusExpired', {}) ?? 'Expired',
          'home.status.open' => TranslationOverrides.string(_root.$meta, 'home.status.open', {}) ?? 'Open',
          'home.status.closed' => TranslationOverrides.string(_root.$meta, 'home.status.closed', {}) ?? 'Closed',
          'home.status.mobilePayment' =>
            TranslationOverrides.string(_root.$meta, 'home.status.mobilePayment', {}) ?? 'Mobile Payment Supported',
          'invite.title' => TranslationOverrides.string(_root.$meta, 'invite.title', {}) ?? 'Invite Friends',
          'invite.ruleBtn' => TranslationOverrides.string(_root.$meta, 'invite.ruleBtn', {}) ?? 'Rules',
          'invite.rewardTitle' => TranslationOverrides.string(_root.$meta, 'invite.rewardTitle', {}) ?? '\$1',
          'invite.rewardSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'invite.rewardSubtitle', {}) ?? 'No Threshold Coupon',
          'invite.rewardDesc' =>
            TranslationOverrides.string(_root.$meta, 'invite.rewardDesc', {}) ?? 'Get for every invited person',
          'invite.myCode' => TranslationOverrides.string(_root.$meta, 'invite.myCode', {}) ?? 'My Invite Code',
          'invite.copy' => TranslationOverrides.string(_root.$meta, 'invite.copy', {}) ?? 'Copy',
          'invite.btnInvite' => TranslationOverrides.string(_root.$meta, 'invite.btnInvite', {}) ?? 'Invite Friends',
          'invite.processTitle' =>
            TranslationOverrides.string(_root.$meta, 'invite.processTitle', {}) ?? 'Invitation Process',
          'invite.step1' => TranslationOverrides.string(_root.$meta, 'invite.step1', {}) ?? 'Share Link',
          'invite.step1Desc' => TranslationOverrides.string(_root.$meta, 'invite.step1Desc', {}) ?? 'To Friends',
          'invite.step2' => TranslationOverrides.string(_root.$meta, 'invite.step2', {}) ?? 'Friend Register',
          'invite.step2Desc' => TranslationOverrides.string(_root.$meta, 'invite.step2Desc', {}) ?? 'Get Gift',
          'invite.step3' => TranslationOverrides.string(_root.$meta, 'invite.step3', {}) ?? 'Friend First Order',
          'invite.step3Desc' => TranslationOverrides.string(_root.$meta, 'invite.step3Desc', {}) ?? 'Paid ≥ \$5',
          'invite.step4' => TranslationOverrides.string(_root.$meta, 'invite.step4', {}) ?? 'Invitation Achieved',
          'invite.step4Desc' => TranslationOverrides.string(_root.$meta, 'invite.step4Desc', {}) ?? 'Get Reward',
          'invite.stats' => TranslationOverrides.string(_root.$meta, 'invite.stats', {}) ?? 'My Achievements',
          'invite.invitedCount' =>
            TranslationOverrides.string(_root.$meta, 'invite.invitedCount', {}) ?? 'Invited (People)',
          'invite.rewardAmount' =>
            TranslationOverrides.string(_root.$meta, 'invite.rewardAmount', {}) ?? 'Rewards (\$)',
          'invite.rules.title' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.title', {}) ?? 'Invitation Rules',
          'invite.rules.section1' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.section1', {}) ?? 'Invitation Rules',
          'invite.rules.rule1' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.rule1', {}) ??
                'Get a \$1 no-threshold coupon for every friend successfully invited to register.',
          'invite.rules.rule2' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.rule2', {}) ??
                'Friends need to complete their first order (paid amount ≥ \$15) to be considered successful.',
          'invite.rules.rule3' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.rule3', {}) ??
                'Each friend can only be invited once, repeated invitations are invalid.',
          'invite.rules.rule4' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.rule4', {}) ??
                'There is no upper limit for invitation rewards, the more you invite, the more you get.',
          'invite.rules.rule5' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.rule5', {}) ??
                'Invitation records are saved permanently and can be viewed at any time.',
          'invite.rules.section2' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.section2', {}) ?? 'Reward Description',
          'invite.rules.reward1' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.reward1', {}) ??
                '\$1 no-threshold coupon, can be directly deducted from the order amount.',
          'invite.rules.reward2' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.reward2', {}) ??
                'The coupon is valid for 30 days, please use it within the validity period.',
          'invite.rules.reward3' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.reward3', {}) ??
                'Coupons cannot be used in conjunction with other promotional activities.',
          'invite.rules.reward4' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.reward4', {}) ??
                'Coupons are limited to use on Good Little Obedient Smart Lunch Box Vending Machines.',
          'invite.rules.reward5' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.reward5', {}) ??
                'Coupons cannot be transferred or exchanged for cash.',
          'invite.rules.section3' => TranslationOverrides.string(_root.$meta, 'invite.rules.section3', {}) ?? 'Notes',
          'invite.rules.note1' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.note1', {}) ??
                'Inviting friends must be done through the official invitation link.',
          'invite.rules.note2' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.note2', {}) ??
                'Friends need to complete real-name authentication after registration.',
          'invite.rules.note3' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.note3', {}) ??
                'If malicious invitation behavior is found, the platform has the right to cancel the reward.',
          'invite.rules.note4' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.note4', {}) ??
                'The final interpretation right of the event rules belongs to Good Little Obedient Smart Lunch Box Vending Machine.',
          'invite.rules.note5' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.note5', {}) ??
                'If you have any questions, please contact customer service.',
          'invite.rules.section4' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.section4', {}) ?? 'Invitation Process',
          'invite.rules.process1' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.process1', {}) ??
                'Share the invitation link to friends.',
          'invite.rules.process2' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.process2', {}) ??
                'Friends register an account through the link.',
          'invite.rules.process3' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.process3', {}) ??
                'Friends complete the first order (≥ \$15).',
          'invite.rules.process4' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.process4', {}) ??
                'The system automatically issues rewards to your account.',
          'invite.rules.process5' =>
            TranslationOverrides.string(_root.$meta, 'invite.rules.process5', {}) ??
                'You can view invitation records in \'My Achievements\'.',
          'navigation.home' => TranslationOverrides.string(_root.$meta, 'navigation.home', {}) ?? 'Home',
          'navigation.device' => TranslationOverrides.string(_root.$meta, 'navigation.device', {}) ?? 'Device',
          'navigation.cart' => TranslationOverrides.string(_root.$meta, 'navigation.cart', {}) ?? 'Cart',
          'navigation.orders' => TranslationOverrides.string(_root.$meta, 'navigation.orders', {}) ?? 'Orders',
          'navigation.profile' => TranslationOverrides.string(_root.$meta, 'navigation.profile', {}) ?? 'Profile',
          'network.errors.connectionTimeout' =>
            TranslationOverrides.string(_root.$meta, 'network.errors.connectionTimeout', {}) ??
                'Connection timeout, please check your network',
          'network.errors.sendTimeout' =>
            TranslationOverrides.string(_root.$meta, 'network.errors.sendTimeout', {}) ??
                'Send timeout, please check your network',
          'network.errors.receiveTimeout' =>
            TranslationOverrides.string(_root.$meta, 'network.errors.receiveTimeout', {}) ??
                'Receive timeout, please check your network',
          'network.errors.badCertificate' =>
            TranslationOverrides.string(_root.$meta, 'network.errors.badCertificate', {}) ?? 'Bad certificate',
          'network.errors.cancel' =>
            TranslationOverrides.string(_root.$meta, 'network.errors.cancel', {}) ?? 'Request cancelled',
          'network.errors.connectionError' =>
            TranslationOverrides.string(_root.$meta, 'network.errors.connectionError', {}) ??
                'Connection error, please check your network',
          'network.errors.unknown' =>
            ({required Object error}) =>
                TranslationOverrides.string(_root.$meta, 'network.errors.unknown', {'error': error}) ??
                'Unknown error: ${error}',
          'network.errors.retryLater' =>
            TranslationOverrides.string(_root.$meta, 'network.errors.retryLater', {}) ?? 'Please try again later',
          'network.errors.badRequest' =>
            TranslationOverrides.string(_root.$meta, 'network.errors.badRequest', {}) ?? 'Bad request',
          'network.errors.unauthorized' =>
            TranslationOverrides.string(_root.$meta, 'network.errors.unauthorized', {}) ??
                'Unauthorized, please login again',
          'network.errors.forbidden' =>
            TranslationOverrides.string(_root.$meta, 'network.errors.forbidden', {}) ?? 'Forbidden',
          'network.errors.notFound' =>
            TranslationOverrides.string(_root.$meta, 'network.errors.notFound', {}) ?? 'Resource not found',
          'network.errors.timeout' =>
            TranslationOverrides.string(_root.$meta, 'network.errors.timeout', {}) ??
                'Request timeout, please try again',
          'network.errors.conflict' =>
            TranslationOverrides.string(_root.$meta, 'network.errors.conflict', {}) ?? 'Conflict',
          'network.errors.validationFailed' =>
            TranslationOverrides.string(_root.$meta, 'network.errors.validationFailed', {}) ?? 'Validation failed',
          'network.errors.tooManyRequests' =>
            TranslationOverrides.string(_root.$meta, 'network.errors.tooManyRequests', {}) ??
                'Too many requests, please try again later',
          'network.errors.internalServerError' =>
            TranslationOverrides.string(_root.$meta, 'network.errors.internalServerError', {}) ??
                'Internal server error',
          'network.errors.badGateway' =>
            TranslationOverrides.string(_root.$meta, 'network.errors.badGateway', {}) ?? 'Bad gateway',
          'network.errors.serviceUnavailable' =>
            TranslationOverrides.string(_root.$meta, 'network.errors.serviceUnavailable', {}) ?? 'Service unavailable',
          'network.errors.gatewayTimeout' =>
            TranslationOverrides.string(_root.$meta, 'network.errors.gatewayTimeout', {}) ?? 'Gateway timeout',
          'network.errors.serverError' =>
            ({required Object code}) =>
                TranslationOverrides.string(_root.$meta, 'network.errors.serverError', {'code': code}) ??
                'Server error (${code})',
          'network.errors.requestError' =>
            ({required Object code}) =>
                TranslationOverrides.string(_root.$meta, 'network.errors.requestError', {'code': code}) ??
                'Request error (${code})',
          'network.errors.failed' =>
            TranslationOverrides.string(_root.$meta, 'network.errors.failed', {}) ?? 'Network request failed',
          'onboarding.welcomeTitle' =>
            TranslationOverrides.string(_root.$meta, 'onboarding.welcomeTitle', {}) ?? 'Welcome to E-Lunchbox',
          'onboarding.welcomeBody' =>
            TranslationOverrides.string(_root.$meta, 'onboarding.welcomeBody', {}) ??
                'Anytime, anywhere, easily buy delicious lunch',
          'onboarding.findDevicesTitle' =>
            TranslationOverrides.string(_root.$meta, 'onboarding.findDevicesTitle', {}) ?? 'Find Nearby Devices',
          'onboarding.findDevicesBody' =>
            TranslationOverrides.string(_root.$meta, 'onboarding.findDevicesBody', {}) ??
                'Quickly locate the nearest vending machine and save your time',
          'onboarding.paymentTitle' =>
            TranslationOverrides.string(_root.$meta, 'onboarding.paymentTitle', {}) ?? 'Convenient Payment',
          'onboarding.paymentBody' =>
            TranslationOverrides.string(_root.$meta, 'onboarding.paymentBody', {}) ??
                'Supports multiple convenient payment methods like credit cards',
          'onboarding.getStarted' =>
            TranslationOverrides.string(_root.$meta, 'onboarding.getStarted', {}) ?? 'Get Started',
          'order.myOrders' => TranslationOverrides.string(_root.$meta, 'order.myOrders', {}) ?? 'My Orders',
          'order.foodOrder' => TranslationOverrides.string(_root.$meta, 'order.foodOrder', {}) ?? 'Food Order',
          'order.mallOrder' => TranslationOverrides.string(_root.$meta, 'order.mallOrder', {}) ?? 'Mall Order',
          'order.noOrders' => TranslationOverrides.string(_root.$meta, 'order.noOrders', {}) ?? 'No Orders',
          'order.detail' => TranslationOverrides.string(_root.$meta, 'order.detail', {}) ?? 'Order Detail',
          'order.status.all' => TranslationOverrides.string(_root.$meta, 'order.status.all', {}) ?? 'All',
          'order.status.pending' => TranslationOverrides.string(_root.$meta, 'order.status.pending', {}) ?? 'Pending',
          'order.status.paid' => TranslationOverrides.string(_root.$meta, 'order.status.paid', {}) ?? 'Paid',
          'order.status.completed' =>
            TranslationOverrides.string(_root.$meta, 'order.status.completed', {}) ?? 'Completed',
          'order.status.cancelled' =>
            TranslationOverrides.string(_root.$meta, 'order.status.cancelled', {}) ?? 'Cancelled',
          'order.status.refunded' =>
            TranslationOverrides.string(_root.$meta, 'order.status.refunded', {}) ?? 'Refunded',
          'order.status.failed' => TranslationOverrides.string(_root.$meta, 'order.status.failed', {}) ?? 'Failed',
          'order.pickupCode' => TranslationOverrides.string(_root.$meta, 'order.pickupCode', {}) ?? 'Pickup Code',
          'order.pickupHint' =>
            TranslationOverrides.string(_root.$meta, 'order.pickupHint', {}) ?? 'Enter code on device to pick up',
          'order.items' => TranslationOverrides.string(_root.$meta, 'order.items', {}) ?? 'Item List',
          'order.info' => TranslationOverrides.string(_root.$meta, 'order.info', {}) ?? 'Order Info',
          'order.id' => TranslationOverrides.string(_root.$meta, 'order.id', {}) ?? 'Order ID',
          'order.createdAt' => TranslationOverrides.string(_root.$meta, 'order.createdAt', {}) ?? 'Created At',
          'order.paidAt' => TranslationOverrides.string(_root.$meta, 'order.paidAt', {}) ?? 'Paid At',
          'order.paymentMethod' =>
            TranslationOverrides.string(_root.$meta, 'order.paymentMethod', {}) ?? 'Payment Method',
          'order.totalAmount' => TranslationOverrides.string(_root.$meta, 'order.totalAmount', {}) ?? 'Total Amount',
          'order.unknown' => TranslationOverrides.string(_root.$meta, 'order.unknown', {}) ?? 'Unknown',
          'order.refresh' => TranslationOverrides.string(_root.$meta, 'order.refresh', {}) ?? 'Refresh',
          'order.itemsCount' =>
            ({required Object count}) =>
                TranslationOverrides.string(_root.$meta, 'order.itemsCount', {'count': count}) ??
                'and ${count} other items',
          'order.orderIdLabel' => TranslationOverrides.string(_root.$meta, 'order.orderIdLabel', {}) ?? 'Order ID: ',
          'order.orderAmount' => TranslationOverrides.string(_root.$meta, 'order.orderAmount', {}) ?? 'Order Amount',
          'order.cancelOrder' => TranslationOverrides.string(_root.$meta, 'order.cancelOrder', {}) ?? 'Cancel Order',
          'order.payNow' => TranslationOverrides.string(_root.$meta, 'order.payNow', {}) ?? 'Pay Now',
          'order.viewDetail' => TranslationOverrides.string(_root.$meta, 'order.viewDetail', {}) ?? 'View Details',
          'order.cancelConfirmTitle' =>
            TranslationOverrides.string(_root.$meta, 'order.cancelConfirmTitle', {}) ?? 'Confirm Cancel',
          'order.cancelConfirmContent' =>
            TranslationOverrides.string(_root.$meta, 'order.cancelConfirmContent', {}) ??
                'Are you sure you want to cancel this order?',
          'order.orderCancelled' =>
            TranslationOverrides.string(_root.$meta, 'order.orderCancelled', {}) ?? 'Order cancelled',
          'order.confirmOrder' => TranslationOverrides.string(_root.$meta, 'order.confirmOrder', {}) ?? 'Confirm Order',
          'order.actualAmount' => TranslationOverrides.string(_root.$meta, 'order.actualAmount', {}) ?? 'Actual Amount',
          'order.totalLabel' => TranslationOverrides.string(_root.$meta, 'order.totalLabel', {}) ?? 'Total: ',
          'order.submitOrder' => TranslationOverrides.string(_root.$meta, 'order.submitOrder', {}) ?? 'Submit Order',
          'order.createFailed' =>
            ({required Object error}) =>
                TranslationOverrides.string(_root.$meta, 'order.createFailed', {'error': error}) ??
                'Create order failed: ${error}',
          'order.retry' => TranslationOverrides.string(_root.$meta, 'order.retry', {}) ?? 'Retry',
          'order.loadFailed' =>
            ({required Object error}) =>
                TranslationOverrides.string(_root.$meta, 'order.loadFailed', {'error': error}) ??
                'Load failed: ${error}',
          'order.specs' =>
            ({required Object specs}) =>
                TranslationOverrides.string(_root.$meta, 'order.specs', {'specs': specs}) ?? 'Specs: ${specs}',
          'order.summary' =>
            ({required Object count}) =>
                TranslationOverrides.string(_root.$meta, 'order.summary', {'count': count}) ?? 'Total ${count} items: ',
          'order.refund' => TranslationOverrides.string(_root.$meta, 'order.refund', {}) ?? 'Refund',
          'order.viewCode' => TranslationOverrides.string(_root.$meta, 'order.viewCode', {}) ?? 'View Code',
          'order.deleteOrder' => TranslationOverrides.string(_root.$meta, 'order.deleteOrder', {}) ?? 'Delete Order',
          'order.reorder' => TranslationOverrides.string(_root.$meta, 'order.reorder', {}) ?? 'Buy Again',
          'order.paySuccess' =>
            TranslationOverrides.string(_root.$meta, 'order.paySuccess', {}) ?? 'Payment Successful',
          'order.reorderSuccess' =>
            TranslationOverrides.string(_root.$meta, 'order.reorderSuccess', {}) ?? 'Reordered Successfully',
          'order.refundNotAvailable' =>
            TranslationOverrides.string(_root.$meta, 'order.refundNotAvailable', {}) ?? 'Refund not available yet',
          'order.deleteNotAvailable' =>
            TranslationOverrides.string(_root.$meta, 'order.deleteNotAvailable', {}) ?? 'Delete not available yet',
          'order.operationFailed' =>
            ({required Object error}) =>
                TranslationOverrides.string(_root.$meta, 'order.operationFailed', {'error': error}) ??
                'Operation failed: ${error}',
          'order.scanQrHint' =>
            TranslationOverrides.string(_root.$meta, 'order.scanQrHint', {}) ?? 'Please scan QR code at the machine',
          'order.pickupCodeHint' =>
            TranslationOverrides.string(_root.$meta, 'order.pickupCodeHint', {}) ??
                'Please pick up with code, enjoy your meal',
          'order.storeInfo' => TranslationOverrides.string(_root.$meta, 'order.storeInfo', {}) ?? 'Store Info',
          'order.productInfo' => TranslationOverrides.string(_root.$meta, 'order.productInfo', {}) ?? 'Product Info',
          'order.device' => TranslationOverrides.string(_root.$meta, 'order.device', {}) ?? 'Device',
          'order.applyRefund' => TranslationOverrides.string(_root.$meta, 'order.applyRefund', {}) ?? 'Apply Refund',
          'order.contactService' =>
            TranslationOverrides.string(_root.$meta, 'order.contactService', {}) ?? 'Contact Service',
          'order.serviceNotAvailable' =>
            TranslationOverrides.string(_root.$meta, 'order.serviceNotAvailable', {}) ?? 'Service not available yet',
          'order.paymentStripe' =>
            TranslationOverrides.string(_root.$meta, 'order.paymentStripe', {}) ?? 'Stripe (Credit Card)',
          'order.paymentWechat' => TranslationOverrides.string(_root.$meta, 'order.paymentWechat', {}) ?? 'WeChat Pay',
          'order.paymentAlipay' => TranslationOverrides.string(_root.$meta, 'order.paymentAlipay', {}) ?? 'Alipay',
          'partner.title' => TranslationOverrides.string(_root.$meta, 'partner.title', {}) ?? 'Partner Cooperation',
          'partner.subtitle' =>
            TranslationOverrides.string(_root.$meta, 'partner.subtitle', {}) ?? 'Join hands to create a better future',
          'partner.advantages' =>
            TranslationOverrides.string(_root.$meta, 'partner.advantages', {}) ?? 'Cooperation Advantages',
          'partner.advantage1Title' =>
            TranslationOverrides.string(_root.$meta, 'partner.advantage1Title', {}) ?? 'Generous Returns',
          'partner.advantage1Desc' =>
            TranslationOverrides.string(_root.$meta, 'partner.advantage1Desc', {}) ??
                'Provide competitive profit sharing for your investment',
          'partner.advantage2Title' =>
            TranslationOverrides.string(_root.$meta, 'partner.advantage2Title', {}) ?? 'Brand Support',
          'partner.advantage2Desc' =>
            TranslationOverrides.string(_root.$meta, 'partner.advantage2Desc', {}) ??
                'Share well-known brand resources and customer trust',
          'partner.advantage3Title' =>
            TranslationOverrides.string(_root.$meta, 'partner.advantage3Title', {}) ?? 'Marketing Support',
          'partner.advantage3Desc' =>
            TranslationOverrides.string(_root.$meta, 'partner.advantage3Desc', {}) ??
                'Professional marketing team for full support',
          'partner.advantage4Title' =>
            TranslationOverrides.string(_root.$meta, 'partner.advantage4Title', {}) ?? 'Training Support',
          'partner.advantage4Desc' =>
            TranslationOverrides.string(_root.$meta, 'partner.advantage4Desc', {}) ??
                'Professional training courses to help you master skills',
          'partner.process' => TranslationOverrides.string(_root.$meta, 'partner.process', {}) ?? 'Cooperation Process',
          'partner.process1Title' =>
            TranslationOverrides.string(_root.$meta, 'partner.process1Title', {}) ?? 'Submit Application',
          'partner.process1Desc' =>
            TranslationOverrides.string(_root.$meta, 'partner.process1Desc', {}) ??
                'Fill out the application form and submit relevant information',
          'partner.process2Title' =>
            TranslationOverrides.string(_root.$meta, 'partner.process2Title', {}) ?? 'Qualification Review',
          'partner.process2Desc' =>
            TranslationOverrides.string(_root.$meta, 'partner.process2Desc', {}) ??
                'We will complete review within 3-5 working days',
          'partner.process3Title' =>
            TranslationOverrides.string(_root.$meta, 'partner.process3Title', {}) ?? 'Interview',
          'partner.process3Desc' =>
            TranslationOverrides.string(_root.$meta, 'partner.process3Desc', {}) ??
                'Arrange an interview to understand cooperation details',
          'partner.process4Title' =>
            TranslationOverrides.string(_root.$meta, 'partner.process4Title', {}) ?? 'Sign Agreement',
          'partner.process4Desc' =>
            TranslationOverrides.string(_root.$meta, 'partner.process4Desc', {}) ??
                'Sign formal agreement after reaching consensus',
          'partner.process5Title' =>
            TranslationOverrides.string(_root.$meta, 'partner.process5Title', {}) ?? 'Start Cooperation',
          'partner.process5Desc' =>
            TranslationOverrides.string(_root.$meta, 'partner.process5Desc', {}) ??
                'Formally launch cooperation and enjoy support services',
          'partner.conditions' =>
            TranslationOverrides.string(_root.$meta, 'partner.conditions', {}) ?? 'Cooperation Conditions',
          'partner.condition1' =>
            TranslationOverrides.string(_root.$meta, 'partner.condition1', {}) ?? 'Have legal business qualifications',
          'partner.condition2' =>
            TranslationOverrides.string(_root.$meta, 'partner.condition2', {}) ??
                'Have certain capital and management ability',
          'partner.condition3' =>
            TranslationOverrides.string(_root.$meta, 'partner.condition3', {}) ??
                'Identify with our brand concept and model',
          'partner.condition4' =>
            TranslationOverrides.string(_root.$meta, 'partner.condition4', {}) ?? 'Have good business reputation',
          'partner.condition5' =>
            TranslationOverrides.string(_root.$meta, 'partner.condition5', {}) ??
                'Relevant industry experience is preferred',
          'partner.applicationTitle' =>
            TranslationOverrides.string(_root.$meta, 'partner.applicationTitle', {}) ?? 'Apply for Cooperation',
          'partner.nameLabel' => TranslationOverrides.string(_root.$meta, 'partner.nameLabel', {}) ?? 'Name',
          'partner.nameInputHint' =>
            TranslationOverrides.string(_root.$meta, 'partner.nameInputHint', {}) ?? 'Please enter your name',
          'partner.companyLabel' =>
            TranslationOverrides.string(_root.$meta, 'partner.companyLabel', {}) ?? 'Company Name',
          'partner.companyInputHint' =>
            TranslationOverrides.string(_root.$meta, 'partner.companyInputHint', {}) ?? 'Please enter company name',
          'partner.phoneLabel' => TranslationOverrides.string(_root.$meta, 'partner.phoneLabel', {}) ?? 'Phone Number',
          'partner.phoneInputHint' =>
            TranslationOverrides.string(_root.$meta, 'partner.phoneInputHint', {}) ?? 'Please enter phone number',
          'partner.intentionLabel' =>
            TranslationOverrides.string(_root.$meta, 'partner.intentionLabel', {}) ?? 'Cooperation Intention',
          'partner.intentionInputHint' =>
            TranslationOverrides.string(_root.$meta, 'partner.intentionInputHint', {}) ??
                'Briefly describe your cooperation intention',
          'partner.submit' => TranslationOverrides.string(_root.$meta, 'partner.submit', {}) ?? 'Submit Application',
          'partner.submitSuccess' =>
            TranslationOverrides.string(_root.$meta, 'partner.submitSuccess', {}) ??
                'Application submitted successfully, we will contact you soon',
          'partner.submitFailed' =>
            TranslationOverrides.string(_root.$meta, 'partner.submitFailed', {}) ??
                'Application submission failed, please try again later',
          'partner.incompleteInfo' =>
            TranslationOverrides.string(_root.$meta, 'partner.incompleteInfo', {}) ??
                'Please fill in complete information',
          'partner.contactTitle' =>
            TranslationOverrides.string(_root.$meta, 'partner.contactTitle', {}) ?? 'Contact Us',
          'partner.serviceHotline' =>
            TranslationOverrides.string(_root.$meta, 'partner.serviceHotline', {}) ?? 'Customer Service Hotline',
          'partner.address' => TranslationOverrides.string(_root.$meta, 'partner.address', {}) ?? 'Address',
          'partner.errorOccurred' =>
            ({required Object error}) =>
                TranslationOverrides.string(_root.$meta, 'partner.errorOccurred', {'error': error}) ??
                'Error occurred: ${error}',
          'payment.checkout' => TranslationOverrides.string(_root.$meta, 'payment.checkout', {}) ?? 'Checkout',
          'payment.success' => TranslationOverrides.string(_root.$meta, 'payment.success', {}) ?? 'Payment Successful',
          'payment.orderNotFound' =>
            TranslationOverrides.string(_root.$meta, 'payment.orderNotFound', {}) ?? 'Order Not Found',
          'payment.payNow' => TranslationOverrides.string(_root.$meta, 'payment.payNow', {}) ?? 'Pay Now',
          'payment.initializing' =>
            TranslationOverrides.string(_root.$meta, 'payment.initializing', {}) ?? 'Initializing payment...',
          'payment.cancelTitle' =>
            TranslationOverrides.string(_root.$meta, 'payment.cancelTitle', {}) ?? 'Cancel Payment',
          'payment.cancelContent' =>
            TranslationOverrides.string(_root.$meta, 'payment.cancelContent', {}) ??
                'Are you sure you want to cancel? Order will be cancelled',
          'payment.continuePay' =>
            TranslationOverrides.string(_root.$meta, 'payment.continuePay', {}) ?? 'Continue Payment',
          'payment.cancelPay' => TranslationOverrides.string(_root.$meta, 'payment.cancelPay', {}) ?? 'Cancel Payment',
          'payment.amount' => TranslationOverrides.string(_root.$meta, 'payment.amount', {}) ?? 'Payment Amount',
          'payment.remainingTime' =>
            TranslationOverrides.string(_root.$meta, 'payment.remainingTime', {}) ?? 'Time Remaining',
          'payment.addCard' => TranslationOverrides.string(_root.$meta, 'payment.addCard', {}) ?? 'Add Card',
          'payment.paymentMethods' =>
            TranslationOverrides.string(_root.$meta, 'payment.paymentMethods', {}) ?? 'Payment Methods',
          'payment.setupSuccess' =>
            TranslationOverrides.string(_root.$meta, 'payment.setupSuccess', {}) ?? 'Card added successfully',
          'payment.setupFailed' =>
            TranslationOverrides.string(_root.$meta, 'payment.setupFailed', {}) ?? 'Failed to add card',
          'payment.noCards' => TranslationOverrides.string(_root.$meta, 'payment.noCards', {}) ?? 'No saved cards',
          'points.title' => TranslationOverrides.string(_root.$meta, 'points.title', {}) ?? 'My Points',
          'points.unit' => TranslationOverrides.string(_root.$meta, 'points.unit', {}) ?? 'Points',
          'points.mall' => TranslationOverrides.string(_root.$meta, 'points.mall', {}) ?? 'Point Mall',
          'points.goExchange' => TranslationOverrides.string(_root.$meta, 'points.goExchange', {}) ?? 'Go Exchange',
          'points.rules' => TranslationOverrides.string(_root.$meta, 'points.rules', {}) ?? 'Point Rules',
          'points.rule1' =>
            TranslationOverrides.string(_root.$meta, 'points.rule1', {}) ?? 'Points are permanently valid',
          'points.rule2' =>
            TranslationOverrides.string(_root.$meta, 'points.rule2', {}) ?? 'Extra points can be obtained by lottery',
          'points.records' => TranslationOverrides.string(_root.$meta, 'points.records', {}) ?? 'Point Records',
          'points.all' => TranslationOverrides.string(_root.$meta, 'points.all', {}) ?? 'All',
          'points.earned' => TranslationOverrides.string(_root.$meta, 'points.earned', {}) ?? 'Earned',
          'points.used' => TranslationOverrides.string(_root.$meta, 'points.used', {}) ?? 'Used',
          'points.noRecords' => TranslationOverrides.string(_root.$meta, 'points.noRecords', {}) ?? 'No point records',
          'points.back' => TranslationOverrides.string(_root.$meta, 'points.back', {}) ?? 'Back',
          'points.goLottery' => TranslationOverrides.string(_root.$meta, 'points.goLottery', {}) ?? 'Go Lottery',
          'points.balance' => TranslationOverrides.string(_root.$meta, 'points.balance', {}) ?? 'Balance',
          'points.coupon' => TranslationOverrides.string(_root.$meta, 'points.coupon', {}) ?? 'Coupons',
          'points.noMoreProducts' =>
            TranslationOverrides.string(_root.$meta, 'points.noMoreProducts', {}) ?? 'No more products',
          'points.myPoints' =>
            ({required Object points}) =>
                TranslationOverrides.string(_root.$meta, 'points.myPoints', {'points': points}) ??
                'My Points: ${points}',
          'points.noProducts' => TranslationOverrides.string(_root.$meta, 'points.noProducts', {}) ?? 'No products',
          'points.cost' =>
            ({required Object points}) =>
                TranslationOverrides.string(_root.$meta, 'points.cost', {'points': points}) ?? '${points} Points',
          'points.exchangeNow' => TranslationOverrides.string(_root.$meta, 'points.exchangeNow', {}) ?? 'Exchange Now',
          _ => null,
        } ??
        switch (path) {
          'points.insufficientPoints' =>
            TranslationOverrides.string(_root.$meta, 'points.insufficientPoints', {}) ?? 'Insufficient balance',
          'product.title' => TranslationOverrides.string(_root.$meta, 'product.title', {}) ?? 'Product List',
          'product.detail' => TranslationOverrides.string(_root.$meta, 'product.detail', {}) ?? 'Product Detail',
          'product.hot' => TranslationOverrides.string(_root.$meta, 'product.hot', {}) ?? 'Hot',
          'product.promotion' => TranslationOverrides.string(_root.$meta, 'product.promotion', {}) ?? 'Sale',
          'product.discountOff' =>
            ({required Object percent}) =>
                TranslationOverrides.string(_root.$meta, 'product.discountOff', {'percent': percent}) ??
                '${percent}% OFF',
          'product.stockFull' => TranslationOverrides.string(_root.$meta, 'product.stockFull', {}) ?? 'In Stock',
          'product.stockEmpty' => TranslationOverrides.string(_root.$meta, 'product.stockEmpty', {}) ?? 'Out of Stock',
          'product.addToCart' => TranslationOverrides.string(_root.$meta, 'product.addToCart', {}) ?? 'Add to Cart',
          'product.addedToCart' =>
            TranslationOverrides.string(_root.$meta, 'product.addedToCart', {}) ?? 'Added to Cart',
          'product.specifications' =>
            TranslationOverrides.string(_root.$meta, 'product.specifications', {}) ?? 'Specifications',
          'product.categoryAll' => TranslationOverrides.string(_root.$meta, 'product.categoryAll', {}) ?? 'All',
          'product.categoryFood' => TranslationOverrides.string(_root.$meta, 'product.categoryFood', {}) ?? 'Food',
          'product.categoryDrink' => TranslationOverrides.string(_root.$meta, 'product.categoryDrink', {}) ?? 'Drink',
          'product.categorySnack' => TranslationOverrides.string(_root.$meta, 'product.categorySnack', {}) ?? 'Snack',
          'product.sortDefault' => TranslationOverrides.string(_root.$meta, 'product.sortDefault', {}) ?? 'Default',
          'product.sortPriceAsc' =>
            TranslationOverrides.string(_root.$meta, 'product.sortPriceAsc', {}) ?? 'Price: Low to High',
          'product.sortPriceDesc' =>
            TranslationOverrides.string(_root.$meta, 'product.sortPriceDesc', {}) ?? 'Price: High to Low',
          'product.sortName' => TranslationOverrides.string(_root.$meta, 'product.sortName', {}) ?? 'Name',
          'product.filterOnlyAvailable' =>
            TranslationOverrides.string(_root.$meta, 'product.filterOnlyAvailable', {}) ?? 'Show Available Only',
          'product.cart' => TranslationOverrides.string(_root.$meta, 'product.cart', {}) ?? 'Cart',
          'product.noProducts' =>
            TranslationOverrides.string(_root.$meta, 'product.noProducts', {}) ?? 'No products found',
          'product.loadingDetail' =>
            TranslationOverrides.string(_root.$meta, 'product.loadingDetail', {}) ??
                'Loading product details, please wait...',
          'product.noDescription' =>
            TranslationOverrides.string(_root.$meta, 'product.noDescription', {}) ?? 'No detailed description',
          'product.reviews' => TranslationOverrides.string(_root.$meta, 'product.reviews', {}) ?? 'Product Reviews',
          'product.noReviews' => TranslationOverrides.string(_root.$meta, 'product.noReviews', {}) ?? 'No reviews yet',
          'product.viewAllReviews' =>
            TranslationOverrides.string(_root.$meta, 'product.viewAllReviews', {}) ?? 'View all reviews',
          'profile.title' => TranslationOverrides.string(_root.$meta, 'profile.title', {}) ?? 'User Center',
          'profile.notLoggedIn' =>
            TranslationOverrides.string(_root.$meta, 'profile.notLoggedIn', {}) ?? 'Not Logged In',
          'profile.editProfile' =>
            TranslationOverrides.string(_root.$meta, 'profile.editProfile', {}) ?? 'Edit Profile',
          'profile.logout' => TranslationOverrides.string(_root.$meta, 'profile.logout', {}) ?? 'Logout',
          'profile.favoriteDevices' =>
            TranslationOverrides.string(_root.$meta, 'profile.favoriteDevices', {}) ?? 'Favorite Devices',
          'profile.personalInfo' =>
            TranslationOverrides.string(_root.$meta, 'profile.personalInfo', {}) ?? 'Personal Info',
          'profile.confirmLogout' =>
            TranslationOverrides.string(_root.$meta, 'profile.confirmLogout', {}) ?? 'Confirm Logout',
          'profile.confirmLogoutContent' =>
            TranslationOverrides.string(_root.$meta, 'profile.confirmLogoutContent', {}) ??
                'Are you sure you want to logout?',
          'profile.clearCacheConfirm' =>
            TranslationOverrides.string(_root.$meta, 'profile.clearCacheConfirm', {}) ??
                'Are you sure you want to clear all cache data?',
          'profile.noFavoriteDevices' =>
            TranslationOverrides.string(_root.$meta, 'profile.noFavoriteDevices', {}) ?? 'No favorite devices',
          'profile.removeFavorite' =>
            TranslationOverrides.string(_root.$meta, 'profile.removeFavorite', {}) ?? 'Unfavorite',
          'profile.removeFavoriteConfirm' =>
            ({required Object name}) =>
                TranslationOverrides.string(_root.$meta, 'profile.removeFavoriteConfirm', {'name': name}) ??
                'Are you sure you want to unfavorite "${name}"?',
          'profile.appDescription' =>
            TranslationOverrides.string(_root.$meta, 'profile.appDescription', {}) ??
                'A convenient vending machine purchasing application',
          'profile.version' =>
            ({required Object version}) =>
                TranslationOverrides.string(_root.$meta, 'profile.version', {'version': version}) ??
                'Version: ${version}',
          'profile.wallet' => TranslationOverrides.string(_root.$meta, 'profile.wallet', {}) ?? 'My Wallet',
          'profile.coupon' => TranslationOverrides.string(_root.$meta, 'profile.coupon', {}) ?? 'Coupons',
          'profile.feedback' => TranslationOverrides.string(_root.$meta, 'profile.feedback', {}) ?? 'Feedback',
          'profile.cooperation' => TranslationOverrides.string(_root.$meta, 'profile.cooperation', {}) ?? 'Cooperation',
          'profile.about' => TranslationOverrides.string(_root.$meta, 'profile.about', {}) ?? 'About Us',
          'profile.settings' => TranslationOverrides.string(_root.$meta, 'profile.settings', {}) ?? 'Settings',
          'profile.gender.male' => TranslationOverrides.string(_root.$meta, 'profile.gender.male', {}) ?? 'Male',
          'profile.gender.female' => TranslationOverrides.string(_root.$meta, 'profile.gender.female', {}) ?? 'Female',
          'profile.gender.unknown' =>
            TranslationOverrides.string(_root.$meta, 'profile.gender.unknown', {}) ?? 'Secret',
          'profile.info.basic' =>
            TranslationOverrides.string(_root.$meta, 'profile.info.basic', {}) ?? 'Basic Information',
          'profile.info.other' =>
            TranslationOverrides.string(_root.$meta, 'profile.info.other', {}) ?? 'Other Information',
          'profile.info.phone' => TranslationOverrides.string(_root.$meta, 'profile.info.phone', {}) ?? 'Phone Number',
          'profile.info.gender' => TranslationOverrides.string(_root.$meta, 'profile.info.gender', {}) ?? 'Gender',
          'profile.info.birthday' =>
            TranslationOverrides.string(_root.$meta, 'profile.info.birthday', {}) ?? 'Birthday',
          'profile.info.email' => TranslationOverrides.string(_root.$meta, 'profile.info.email', {}) ?? 'Email',
          'profile.info.notSet' => TranslationOverrides.string(_root.$meta, 'profile.info.notSet', {}) ?? 'Not Set',
          'profile.avatar.clickToChange' =>
            TranslationOverrides.string(_root.$meta, 'profile.avatar.clickToChange', {}) ?? 'Click to change avatar',
          'profile.avatar.uploading' =>
            TranslationOverrides.string(_root.$meta, 'profile.avatar.uploading', {}) ??
                'Avatar upload feature is under development',
          'profile.saveSuccess' =>
            TranslationOverrides.string(_root.$meta, 'profile.saveSuccess', {}) ?? 'Saved successfully',
          'profile.saveFailed' =>
            ({required Object error}) =>
                TranslationOverrides.string(_root.$meta, 'profile.saveFailed', {'error': error}) ??
                'Save failed: ${error}',
          'profile.saveInfo' => TranslationOverrides.string(_root.$meta, 'profile.saveInfo', {}) ?? 'Save Information',
          'profile.walletBalance' =>
            TranslationOverrides.string(_root.$meta, 'profile.walletBalance', {}) ?? 'Wallet Balance',
          'profile.coin' => TranslationOverrides.string(_root.$meta, 'profile.coin', {}) ?? 'Points',
          'profile.couponCount' => TranslationOverrides.string(_root.$meta, 'profile.couponCount', {}) ?? 'Coupons',
          'profile.walletPage.title' =>
            TranslationOverrides.string(_root.$meta, 'profile.walletPage.title', {}) ?? 'Wallet',
          'profile.walletPage.topUp' =>
            TranslationOverrides.string(_root.$meta, 'profile.walletPage.topUp', {}) ?? 'Top Up',
          'profile.walletPage.balance' =>
            TranslationOverrides.string(_root.$meta, 'profile.walletPage.balance', {}) ?? 'Balance',
          'profile.walletPage.selectAmount' =>
            TranslationOverrides.string(_root.$meta, 'profile.walletPage.selectAmount', {}) ?? 'Select Amount',
          'profile.walletPage.rule' =>
            TranslationOverrides.string(_root.$meta, 'profile.walletPage.rule', {}) ?? 'Rules',
          'profile.walletPage.ruleDesc' =>
            TranslationOverrides.string(_root.$meta, 'profile.walletPage.ruleDesc', {}) ??
                'Top up specific packages to get points. Custom amount does not get points.',
          'profile.walletPage.customAmount' =>
            TranslationOverrides.string(_root.$meta, 'profile.walletPage.customAmount', {}) ?? 'Custom Amount',
          'profile.walletPage.customAmountHint' =>
            TranslationOverrides.string(_root.$meta, 'profile.walletPage.customAmountHint', {}) ??
                'Only for amounts above ¥500',
          'profile.walletPage.realPay' =>
            ({required Object amount}) =>
                TranslationOverrides.string(_root.$meta, 'profile.walletPage.realPay', {'amount': amount}) ??
                'Pay ¥${amount}',
          'profile.walletPage.bonus' =>
            ({required Object amount}) =>
                TranslationOverrides.string(_root.$meta, 'profile.walletPage.bonus', {'amount': amount}) ??
                'Get ${amount} points',
          'profile.walletPage.noBonus' =>
            TranslationOverrides.string(_root.$meta, 'profile.walletPage.noBonus', {}) ?? 'No points',
          'profile.walletPage.history' =>
            TranslationOverrides.string(_root.$meta, 'profile.walletPage.history', {}) ?? 'History',
          'profile.walletPage.historyCount' =>
            ({required Object count}) =>
                TranslationOverrides.string(_root.$meta, 'profile.walletPage.historyCount', {'count': count}) ??
                'Total ${count}',
          'profile.walletPage.noHistory' =>
            TranslationOverrides.string(_root.$meta, 'profile.walletPage.noHistory', {}) ?? 'No transaction history',
          'settings.title' => TranslationOverrides.string(_root.$meta, 'settings.title', {}) ?? 'Settings',
          'settings.general' => TranslationOverrides.string(_root.$meta, 'settings.general', {}) ?? 'General',
          'settings.theme' => TranslationOverrides.string(_root.$meta, 'settings.theme', {}) ?? 'Theme Mode',
          'settings.themeLight' => TranslationOverrides.string(_root.$meta, 'settings.themeLight', {}) ?? 'Light',
          'settings.themeDark' => TranslationOverrides.string(_root.$meta, 'settings.themeDark', {}) ?? 'Dark',
          'settings.themeSystem' => TranslationOverrides.string(_root.$meta, 'settings.themeSystem', {}) ?? 'System',
          'settings.language' => TranslationOverrides.string(_root.$meta, 'settings.language', {}) ?? 'Language',
          'settings.checkUpdate' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkUpdate', {}) ?? 'Check Update',
          'settings.clearCache' => TranslationOverrides.string(_root.$meta, 'settings.clearCache', {}) ?? 'Clear Cache',
          'settings.about' => TranslationOverrides.string(_root.$meta, 'settings.about', {}) ?? 'About',
          'settings.deviceInfo' => TranslationOverrides.string(_root.$meta, 'settings.deviceInfo', {}) ?? 'Device Info',
          'settings.aboutUs' => TranslationOverrides.string(_root.$meta, 'settings.aboutUs', {}) ?? 'About Us',
          'settings.checkingUpdate' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkingUpdate', {}) ?? 'Checking for updates...',
          'settings.cacheCleared' =>
            TranslationOverrides.string(_root.$meta, 'settings.cacheCleared', {}) ?? 'Cache cleared',
          'settings.english' => TranslationOverrides.string(_root.$meta, 'settings.english', {}) ?? 'English',
          'settings.chinese' =>
            TranslationOverrides.string(_root.$meta, 'settings.chinese', {}) ?? 'Simplified Chinese',
          'settings.traditionalChinese' =>
            TranslationOverrides.string(_root.$meta, 'settings.traditionalChinese', {}) ?? 'Traditional Chinese',
          'settings.themeScheme' =>
            TranslationOverrides.string(_root.$meta, 'settings.themeScheme', {}) ?? 'Color Scheme',
          'settings.schemes.shadOrange' =>
            TranslationOverrides.string(_root.$meta, 'settings.schemes.shadOrange', {}) ??
                'Vibrant Orange (ShadOrange)',
          'settings.schemes.shadGreen' =>
            TranslationOverrides.string(_root.$meta, 'settings.schemes.shadGreen', {}) ?? 'Natural Green (ShadGreen)',
          'settings.schemes.bahamaBlue' =>
            TranslationOverrides.string(_root.$meta, 'settings.schemes.bahamaBlue', {}) ?? 'Bahama Blue (BahamaBlue)',
          'settings.schemes.damask' =>
            TranslationOverrides.string(_root.$meta, 'settings.schemes.damask', {}) ?? 'Damask Red (Damask)',
          'settings.appName' => TranslationOverrides.string(_root.$meta, 'settings.appName', {}) ?? 'App Name',
          'settings.packageName' =>
            TranslationOverrides.string(_root.$meta, 'settings.packageName', {}) ?? 'Package Name',
          'settings.versionName' =>
            TranslationOverrides.string(_root.$meta, 'settings.versionName', {}) ?? 'Version Name',
          'settings.buildNumber' =>
            TranslationOverrides.string(_root.$meta, 'settings.buildNumber', {}) ?? 'Build Number',
          'settings.copyright' =>
            TranslationOverrides.string(_root.$meta, 'settings.copyright', {}) ?? '© 2024 Lunchbox Team',
          'splash.starting' => TranslationOverrides.string(_root.$meta, 'splash.starting', {}) ?? 'Starting...',
          'splash.checkingServices' =>
            TranslationOverrides.string(_root.$meta, 'splash.checkingServices', {}) ?? 'Checking services...',
          'splash.loadingConfig' =>
            TranslationOverrides.string(_root.$meta, 'splash.loadingConfig', {}) ?? 'Loading config...',
          'splash.checkingAuth' =>
            TranslationOverrides.string(_root.$meta, 'splash.checkingAuth', {}) ?? 'Checking auth status...',
          'splash.preparingData' =>
            TranslationOverrides.string(_root.$meta, 'splash.preparingData', {}) ?? 'Preparing data...',
          'splash.ready' => TranslationOverrides.string(_root.$meta, 'splash.ready', {}) ?? 'Ready',
          'splash.failed' => TranslationOverrides.string(_root.$meta, 'splash.failed', {}) ?? 'Start Failed',
          'teamOrdering.title' => TranslationOverrides.string(_root.$meta, 'teamOrdering.title', {}) ?? 'Team Ordering',
          'teamOrdering.bannerTitle' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.bannerTitle', {}) ?? 'Team Ordering',
          'teamOrdering.bannerSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.bannerSubtitle', {}) ??
                'Group Order · Team Dinner · Corporate Team Building',
          'teamOrdering.tag1' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.tag1', {}) ?? 'Professional Service',
          'teamOrdering.tag2' => TranslationOverrides.string(_root.$meta, 'teamOrdering.tag2', {}) ?? 'Discount Price',
          'teamOrdering.tag3' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.tag3', {}) ?? 'Convenient & Efficient',
          'teamOrdering.scenarios.title' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.scenarios.title', {}) ?? 'Applicable Scenarios',
          'teamOrdering.scenarios.subtitle' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.scenarios.subtitle', {}) ??
                'Meet different team needs',
          'teamOrdering.scenarios.team' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.scenarios.team', {}) ?? 'Team Ordering',
          'teamOrdering.scenarios.teamDesc' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.scenarios.teamDesc', {}) ??
                'Corporate team building, department dinner',
          'teamOrdering.scenarios.reserve' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.scenarios.reserve', {}) ?? 'Reservation Ordering',
          'teamOrdering.scenarios.reserveDesc' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.scenarios.reserveDesc', {}) ??
                'Book in advance, pick up on time',
          'teamOrdering.scenarios.vip' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.scenarios.vip', {}) ?? 'VIP Ordering',
          'teamOrdering.scenarios.vipDesc' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.scenarios.vipDesc', {}) ??
                'Bulk ordering, exclusive service',
          'teamOrdering.process.title' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.process.title', {}) ?? 'Process',
          'teamOrdering.process.subtitle' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.process.subtitle', {}) ??
                'Simple three steps, easy booking',
          'teamOrdering.process.step1Title' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.process.step1Title', {}) ?? 'Contact Service',
          'teamOrdering.process.step1Desc' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.process.step1Desc', {}) ??
                'Call hotline or consult online to explain dining needs',
          'teamOrdering.process.step2Title' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.process.step2Title', {}) ?? 'Confirm Plan',
          'teamOrdering.process.step2Desc' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.process.step2Desc', {}) ??
                'Customer service customizes exclusive plan, confirms dishes and prices',
          'teamOrdering.process.step3Title' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.process.step3Title', {}) ?? 'Complete Booking',
          'teamOrdering.process.step3Desc' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.process.step3Desc', {}) ??
                'Confirm order info, pick up at store on time',
          'teamOrdering.advantages.title' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.title', {}) ?? 'Service Advantages',
          'teamOrdering.advantages.subtitle' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.subtitle', {}) ??
                'Professional team, trustworthy',
          'teamOrdering.advantages.custom' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.custom', {}) ??
                'Professional Customization',
          'teamOrdering.advantages.customDesc' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.customDesc', {}) ??
                'Provide personalized customization based on team size and taste',
          'teamOrdering.advantages.reserve' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.reserve', {}) ?? 'Advance Reservation',
          'teamOrdering.advantages.reserveDesc' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.reserveDesc', {}) ??
                'Support advance reservation, arrange dining time reasonably, avoid waiting',
          'teamOrdering.advantages.price' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.price', {}) ?? 'Discount Price',
          'teamOrdering.advantages.priceDesc' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.priceDesc', {}) ??
                'Team ordering enjoys more discounts, bulk is cheaper',
          'teamOrdering.advantages.quality' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.quality', {}) ?? 'Quality Assurance',
          'teamOrdering.advantages.qualityDesc' =>
            TranslationOverrides.string(_root.$meta, 'teamOrdering.advantages.qualityDesc', {}) ??
                'Strictly control ingredient quality, ensure every meal is fresh and delicious',
          'teamOrdering.bookNow' => TranslationOverrides.string(_root.$meta, 'teamOrdering.bookNow', {}) ?? 'Book Now',
          'time.justNow' => TranslationOverrides.string(_root.$meta, 'time.justNow', {}) ?? 'Just now',
          'time.minutesAgo' =>
            ({required Object minutes}) =>
                TranslationOverrides.string(_root.$meta, 'time.minutesAgo', {'minutes': minutes}) ??
                '${minutes} mins ago',
          'time.hoursAgo' =>
            ({required Object hours}) =>
                TranslationOverrides.string(_root.$meta, 'time.hoursAgo', {'hours': hours}) ?? '${hours} hours ago',
          'time.daysAgo' =>
            ({required Object days}) =>
                TranslationOverrides.string(_root.$meta, 'time.daysAgo', {'days': days}) ?? '${days} days ago',
          'welcome_gift.title' => TranslationOverrides.string(_root.$meta, 'welcome_gift.title', {}) ?? 'Welcome Gift',
          'welcome_gift.subtitle' =>
            TranslationOverrides.string(_root.$meta, 'welcome_gift.subtitle', {}) ??
                'Can be claimed within 30 days of registration, one gift per person',
          'welcome_gift.tabs.available' =>
            TranslationOverrides.string(_root.$meta, 'welcome_gift.tabs.available', {}) ?? 'Available',
          'welcome_gift.tabs.received' =>
            TranslationOverrides.string(_root.$meta, 'welcome_gift.tabs.received', {}) ?? 'Received',
          'welcome_gift.card.tag' => TranslationOverrides.string(_root.$meta, 'welcome_gift.card.tag', {}) ?? 'Gift',
          'welcome_gift.card.status.received' =>
            TranslationOverrides.string(_root.$meta, 'welcome_gift.card.status.received', {}) ?? 'Received',
          'welcome_gift.card.button.claim' =>
            TranslationOverrides.string(_root.$meta, 'welcome_gift.card.button.claim', {}) ?? 'Claim',
          'welcome_gift.card.button.received' =>
            TranslationOverrides.string(_root.$meta, 'welcome_gift.card.button.received', {}) ?? 'Received',
          _ => null,
        };
  }
}
