// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApiResponseModel<T> _$ApiResponseModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => $checkedCreate('_ApiResponseModel', json, ($checkedConvert) {
  final val = _ApiResponseModel<T>(
    code: $checkedConvert('code', (v) => (v as num).toInt()),
    message: $checkedConvert('message', (v) => v as String),
    timestamp: $checkedConvert('timestamp', (v) => (v as num).toInt()),
    data: $checkedConvert(
      'data',
      (v) => _$nullableGenericFromJson(v, fromJsonT),
    ),
  );
  return val;
});

Map<String, dynamic> _$ApiResponseModelToJson<T>(
  _ApiResponseModel<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'code': instance.code,
  'message': instance.message,
  'timestamp': instance.timestamp,
  'data': ?_$nullableGenericToJson(instance.data, toJsonT),
};

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) => input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) => input == null ? null : toJson(input);

_PaginatedResponseModel<T> _$PaginatedResponseModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => $checkedCreate('_PaginatedResponseModel', json, ($checkedConvert) {
  final val = _PaginatedResponseModel<T>(
    list: $checkedConvert(
      'list',
      (v) => (v as List<dynamic>).map(fromJsonT).toList(),
    ),
    total: $checkedConvert('total', (v) => (v as num).toInt()),
    page: $checkedConvert('page', (v) => (v as num).toInt()),
    pageSize: $checkedConvert('page_size', (v) => (v as num).toInt()),
  );
  return val;
}, fieldKeyMap: const {'pageSize': 'page_size'});

Map<String, dynamic> _$PaginatedResponseModelToJson<T>(
  _PaginatedResponseModel<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'list': instance.list.map(toJsonT).toList(),
  'total': instance.total,
  'page': instance.page,
  'page_size': instance.pageSize,
};
