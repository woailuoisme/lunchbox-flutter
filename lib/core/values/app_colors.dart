import 'package:flutter/material.dart';

/// 应用颜色配置
class AppColors {
  // 主色调
  static const Color primary = Color(0xFFFF6B6B);
  static const Color primaryDark = Color(0xFFE85555);
  static const Color primaryLight = Color(0xFFFF8787);

  // 辅助色
  static const Color secondary = Color(0xFF4ECDC4);
  static const Color accent = Color(0xFFFFE66D);

  // 背景色
  static const Color background = Color(0xFFF7F7F7);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color card = Color(0xFFFFFFFF);

  // 文本色
  static const Color textPrimary = Color(0xFF2D3436);
  static const Color textSecondary = Color(0xFF636E72);
  static const Color textHint = Color(0xFFB2BEC3);
  static const Color textDisabled = Color(0xFFDFE6E9);

  // 状态色
  static const Color success = Color(0xFF00B894);
  static const Color warning = Color(0xFFFDCB6E);
  static const Color error = Color(0xFFD63031);
  static const Color info = Color(0xFF74B9FF);

  // 设备状态色
  static const Color deviceOnline = Color(0xFF00B894);
  static const Color deviceOffline = Color(0xFF636E72);
  static const Color deviceMaintenance = Color(0xFFFDCB6E);

  // 订单状态色
  static const Color orderPending = Color(0xFFFDCB6E);
  static const Color orderPaid = Color(0xFF74B9FF);
  static const Color orderCompleted = Color(0xFF00B894);
  static const Color orderCancelled = Color(0xFF636E72);
  static const Color orderRefunded = Color(0xFFD63031);

  // 其他
  static const Color divider = Color(0xFFDFE6E9);
  static const Color shadow = Color(0x1A000000);
  static const Color overlay = Color(0x80000000);
}
