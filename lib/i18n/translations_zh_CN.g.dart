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
class TranslationsZhCn extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsZhCn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.zhCn,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh-CN>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsZhCn _root = this; // ignore: unused_field

	@override 
	TranslationsZhCn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsZhCn(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsCommonZhCn common = _TranslationsCommonZhCn._(_root);
	@override late final _TranslationsAuthZhCn auth = _TranslationsAuthZhCn._(_root);
	@override late final _TranslationsTimeZhCn time = _TranslationsTimeZhCn._(_root);
}

// Path: common
class _TranslationsCommonZhCn extends TranslationsCommonEn {
	_TranslationsCommonZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get login => '登录';
	@override String get register => '注册';
	@override String get username => '用户名';
	@override String get password => '密码';
	@override String get confirm => '确认';
	@override String get cancel => '取消';
	@override String get error => '错误';
	@override String get success => '成功';
	@override String get loading => '加载中...';
}

// Path: auth
class _TranslationsAuthZhCn extends TranslationsAuthEn {
	_TranslationsAuthZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get loginTitle => '欢迎回来';
	@override String get loginButton => '登录';
	@override String get registerButton => '注册';
	@override String get forgotPassword => '忘记密码？';
	@override String get loginFailed => '登录失败';
	@override String get loginSuccess => '登录成功';
}

// Path: time
class _TranslationsTimeZhCn extends TranslationsTimeEn {
	_TranslationsTimeZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get justNow => '刚刚';
	@override String minutesAgo({required Object minutes}) => '${minutes}分钟前';
	@override String hoursAgo({required Object hours}) => '${hours}小时前';
	@override String daysAgo({required Object days}) => '${days}天前';
}

/// The flat map containing all translations for locale <zh-CN>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsZhCn {
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
			'auth.loginTitle' => '欢迎回来',
			'auth.loginButton' => '登录',
			'auth.registerButton' => '注册',
			'auth.forgotPassword' => '忘记密码？',
			'auth.loginFailed' => '登录失败',
			'auth.loginSuccess' => '登录成功',
			'time.justNow' => '刚刚',
			'time.minutesAgo' => ({required Object minutes}) => '${minutes}分钟前',
			'time.hoursAgo' => ({required Object hours}) => '${hours}小时前',
			'time.daysAgo' => ({required Object days}) => '${days}天前',
			_ => null,
		};
	}
}
