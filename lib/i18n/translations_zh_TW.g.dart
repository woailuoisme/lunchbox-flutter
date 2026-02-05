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
	@override late final _TranslationsAuthZhTw auth = _TranslationsAuthZhTw._(_root);
	@override late final _TranslationsTimeZhTw time = _TranslationsTimeZhTw._(_root);
}

// Path: common
class _TranslationsCommonZhTw extends TranslationsCommonEn {
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
}

// Path: auth
class _TranslationsAuthZhTw extends TranslationsAuthEn {
	_TranslationsAuthZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get loginTitle => '歡迎回來';
	@override String get loginButton => '登入';
	@override String get registerButton => '註冊';
	@override String get forgotPassword => '忘記密碼？';
	@override String get loginFailed => '登入失敗';
	@override String get loginSuccess => '登入成功';
}

// Path: time
class _TranslationsTimeZhTw extends TranslationsTimeEn {
	_TranslationsTimeZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get justNow => '剛剛';
	@override String minutesAgo({required Object minutes}) => '${minutes}分鐘前';
	@override String hoursAgo({required Object hours}) => '${hours}小時前';
	@override String daysAgo({required Object days}) => '${days}天前';
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
			'auth.loginTitle' => '歡迎回來',
			'auth.loginButton' => '登入',
			'auth.registerButton' => '註冊',
			'auth.forgotPassword' => '忘記密碼？',
			'auth.loginFailed' => '登入失敗',
			'auth.loginSuccess' => '登入成功',
			'time.justNow' => '剛剛',
			'time.minutesAgo' => ({required Object minutes}) => '${minutes}分鐘前',
			'time.hoursAgo' => ({required Object hours}) => '${hours}小時前',
			'time.daysAgo' => ({required Object days}) => '${days}天前',
			_ => null,
		};
	}
}
