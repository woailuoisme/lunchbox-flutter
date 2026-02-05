///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsCommonEn common = TranslationsCommonEn.internal(_root);
	late final TranslationsAuthEn auth = TranslationsAuthEn.internal(_root);
	late final TranslationsTimeEn time = TranslationsTimeEn.internal(_root);
}

// Path: common
class TranslationsCommonEn {
	TranslationsCommonEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Login'
	String get login => 'Login';

	/// en: 'Register'
	String get register => 'Register';

	/// en: 'Username'
	String get username => 'Username';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'Confirm'
	String get confirm => 'Confirm';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Error'
	String get error => 'Error';

	/// en: 'Success'
	String get success => 'Success';

	/// en: 'Loading...'
	String get loading => 'Loading...';
}

// Path: auth
class TranslationsAuthEn {
	TranslationsAuthEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Welcome Back'
	String get loginTitle => 'Welcome Back';

	/// en: 'Login'
	String get loginButton => 'Login';

	/// en: 'Register'
	String get registerButton => 'Register';

	/// en: 'Forgot Password?'
	String get forgotPassword => 'Forgot Password?';

	/// en: 'Login Failed'
	String get loginFailed => 'Login Failed';

	/// en: 'Login Successful'
	String get loginSuccess => 'Login Successful';
}

// Path: time
class TranslationsTimeEn {
	TranslationsTimeEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Just now'
	String get justNow => 'Just now';

	/// en: '${minutes}m ago'
	String minutesAgo({required Object minutes}) => '${minutes}m ago';

	/// en: '${hours}h ago'
	String hoursAgo({required Object hours}) => '${hours}h ago';

	/// en: '${days}d ago'
	String daysAgo({required Object days}) => '${days}d ago';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
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
			'auth.loginTitle' => 'Welcome Back',
			'auth.loginButton' => 'Login',
			'auth.registerButton' => 'Register',
			'auth.forgotPassword' => 'Forgot Password?',
			'auth.loginFailed' => 'Login Failed',
			'auth.loginSuccess' => 'Login Successful',
			'time.justNow' => 'Just now',
			'time.minutesAgo' => ({required Object minutes}) => '${minutes}m ago',
			'time.hoursAgo' => ({required Object hours}) => '${hours}h ago',
			'time.daysAgo' => ({required Object days}) => '${days}d ago',
			_ => null,
		};
	}
}
