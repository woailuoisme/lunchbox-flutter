import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response_model.freezed.dart';
part 'api_response_model.g.dart';

/// API响应模型类
/// 用于标准化处理网络请求返回的数据格式
@Freezed(genericArgumentFactories: true)
abstract class ApiResponseModel<T> with _$ApiResponseModel<T> {
  const factory ApiResponseModel({
    /// 响应状态码
    required int code,

    /// 响应消息
    required String message,

    /// 响应时间戳
    required int timestamp,

    /// 响应数据
    T? data,
  }) = _ApiResponseModel<T>;

  /// 创建成功响应
  factory ApiResponseModel.success(T data) {
    return ApiResponseModel(
      code: 200,
      message: 'success',
      data: data,
      timestamp: DateTime.now().millisecondsSinceEpoch,
    );
  }

  /// 创建失败响应
  factory ApiResponseModel.failure(String message, {int code = -1}) {
    return ApiResponseModel(
      code: code,
      message: message,
      timestamp: DateTime.now().millisecondsSinceEpoch,
    );
  }
  const ApiResponseModel._();

  /// 从JSON映射创建ApiResponseModel实例
  factory ApiResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$ApiResponseModelFromJson(json, fromJsonT);

  /// 是否成功
  bool get isSuccess => code == 200 || code == 0;
}

/// 分页响应模型类
@Freezed(genericArgumentFactories: true)
abstract class PaginatedResponseModel<T> with _$PaginatedResponseModel<T> {
  const factory PaginatedResponseModel({
    /// 数据列表
    required List<T> list,

    /// 总数
    required int total,

    /// 当前页码
    required int page,

    /// 每页数量
    required int pageSize,
  }) = _PaginatedResponseModel<T>;
  const PaginatedResponseModel._();

  /// 从JSON映射创建PaginatedResponseModel实例
  factory PaginatedResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$PaginatedResponseModelFromJson(json, fromJsonT);

  /// 总页数
  int get totalPages => (total + pageSize - 1) ~/ pageSize;

  /// 是否有下一页
  bool get hasNextPage => page < totalPages;

  /// 是否有上一页
  bool get hasPrevPage => page > 1;
}
