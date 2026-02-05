import 'package:intl/intl.dart';

/// 日期时间工具类
class DateUtils {
  /// 格式化日期时间
  static String formatDateTime(DateTime dateTime, {String pattern = 'yyyy-MM-dd HH:mm:ss'}) {
    return DateFormat(pattern).format(dateTime);
  }
  
  /// 格式化日期
  static String formatDate(DateTime dateTime, {String pattern = 'yyyy-MM-dd'}) {
    return DateFormat(pattern).format(dateTime);
  }
  
  /// 格式化时间
  static String formatTime(DateTime dateTime, {String pattern = 'HH:mm:ss'}) {
    return DateFormat(pattern).format(dateTime);
  }
  
  /// 获取友好的时间显示
  static String getFriendlyTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    
    if (difference.inSeconds < 60) {
      return '刚刚';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}分钟前';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}小时前';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}天前';
    } else {
      return formatDate(dateTime);
    }
  }
  
  /// 判断是否是今天
  static bool isToday(DateTime dateTime) {
    final now = DateTime.now();
    return dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day;
  }
  
  /// 判断是否是昨天
  static bool isYesterday(DateTime dateTime) {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return dateTime.year == yesterday.year &&
        dateTime.month == yesterday.month &&
        dateTime.day == yesterday.day;
  }
}
