import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lunchbox/core/utils/logger_utils.dart';

final firebaseAnalyticsProvider = Provider<FirebaseAnalytics>((ref) {
  return FirebaseAnalytics.instance;
});

final analyticsServiceProvider = Provider<AnalyticsService>((ref) {
  final analytics = ref.watch(firebaseAnalyticsProvider);
  return AnalyticsService(analytics);
});

class AnalyticsService {
  AnalyticsService(this._analytics);

  final FirebaseAnalytics _analytics;

  Future<void> logEvent(String name, {Map<String, Object>? parameters}) async {
    try {
      await _analytics.logEvent(name: name, parameters: parameters);
    } catch (e, stackTrace) {
      LoggerUtils.e('Analytics logEvent failed: $name', e, stackTrace);
    }
  }

  Future<void> logScreenView({
    required String screenName,
    String? screenClass,
  }) async {
    try {
      await _analytics.logScreenView(
        screenName: screenName,
        screenClass: screenClass,
      );
    } catch (e, stackTrace) {
      LoggerUtils.e(
        'Analytics logScreenView failed: $screenName',
        e,
        stackTrace,
      );
    }
  }

  Future<void> setUserId(String? userId) async {
    try {
      await _analytics.setUserId(id: userId);
    } catch (e, stackTrace) {
      LoggerUtils.e('Analytics setUserId failed', e, stackTrace);
    }
  }

  Future<void> setUserProperty({required String name, String? value}) async {
    try {
      await _analytics.setUserProperty(name: name, value: value);
    } catch (e, stackTrace) {
      LoggerUtils.e('Analytics setUserProperty failed: $name', e, stackTrace);
    }
  }

  Future<void> setCollectionEnabled(bool enabled) async {
    try {
      await _analytics.setAnalyticsCollectionEnabled(enabled);
    } catch (e, stackTrace) {
      LoggerUtils.e('Analytics setCollectionEnabled failed', e, stackTrace);
    }
  }

  Future<void> reset() async {
    try {
      await _analytics.resetAnalyticsData();
    } catch (e, stackTrace) {
      LoggerUtils.e('Analytics reset failed', e, stackTrace);
    }
  }
}
