/// 基础模型类
/// 为所有数据模型提供通用功能和序列化支持
library;

class BaseModel {

  /// 构造函数
  BaseModel({required this.id, DateTime? createdAt, DateTime? updatedAt})
      : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  /// 从JSON映射创建BaseModel实例
  factory BaseModel.fromJson(Map<String, dynamic> json) {
    // 这里仅作为基础类使用，具体子类应实现自己的fromJson方法
    return BaseModel(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }
  /// 数据ID（通用标识符）
  final String id;

  /// 创建时间
  final DateTime createdAt;

  /// 更新时间
  final DateTime updatedAt;

  /// 将BaseModel实例转换为JSON映射
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  /// 创建模型ID的辅助方法（生成唯一ID）
  static String generateId() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final random = DateTime.now().microsecond % 1000;
    return '${timestamp}_$random';
  }

  /// 格式化日期时间
  static String formatDateTime(DateTime dateTime) {
    return '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}';
  }

  /// 格式化日期
  static String formatDate(DateTime dateTime) {
    return '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
  }

  /// 格式化时间
  static String formatTime(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
