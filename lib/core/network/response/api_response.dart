import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

/// 通用 API 响应封装
@Freezed(genericArgumentFactories: true)
sealed class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse({
    required bool success,
    required int code,
    required String message,
    T? data,
    Map<String, List<String>>? errors,
  }) = _ApiResponse;

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$ApiResponseFromJson(json, fromJsonT);
}
