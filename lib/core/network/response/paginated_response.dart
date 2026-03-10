import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginated_response.freezed.dart';
part 'paginated_response.g.dart';

/// 分页响应封装
@Freezed(genericArgumentFactories: true)
sealed class PaginatedResponse<T> with _$PaginatedResponse<T> {
  const factory PaginatedResponse({
    @Default([]) List<T> items,
    required PaginationMeta meta,
  }) = _PaginatedResponse;

  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$PaginatedResponseFromJson(json, fromJsonT);
}

/// 分页元数据
@freezed
sealed class PaginationMeta with _$PaginationMeta {
  const factory PaginationMeta({
    @Default(1) @JsonKey(name: 'current_page') int currentPage,
    @Default(10) @JsonKey(name: 'per_page') int perPage,
    @Default(1) @JsonKey(name: 'last_page') int lastPage,
    @Default(false) @JsonKey(name: 'has_more') bool hasMore,
    @Default(0) int total,
    int? from,
    int? to,
  }) = _PaginationMeta;

  factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaFromJson(json);
}
