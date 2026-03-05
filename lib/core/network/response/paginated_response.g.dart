// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginatedResponse<T> _$PaginatedResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => $checkedCreate('_PaginatedResponse', json, ($checkedConvert) {
  final val = _PaginatedResponse<T>(
    items: $checkedConvert(
      'items',
      (v) => (v as List<dynamic>).map(fromJsonT).toList(),
    ),
    meta: $checkedConvert(
      'meta',
      (v) => PaginationMeta.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$PaginatedResponseToJson<T>(
  _PaginatedResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'items': instance.items.map(toJsonT).toList(),
  'meta': instance.meta.toJson(),
};

_PaginationMeta _$PaginationMetaFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_PaginationMeta',
      json,
      ($checkedConvert) {
        final val = _PaginationMeta(
          currentPage: $checkedConvert(
            'current_page',
            (v) => (v as num).toInt(),
          ),
          perPage: $checkedConvert('per_page', (v) => (v as num).toInt()),
          lastPage: $checkedConvert('last_page', (v) => (v as num).toInt()),
          hasMore: $checkedConvert('has_more', (v) => v as bool),
          total: $checkedConvert('total', (v) => (v as num).toInt()),
          from: $checkedConvert('from', (v) => (v as num?)?.toInt()),
          to: $checkedConvert('to', (v) => (v as num?)?.toInt()),
        );
        return val;
      },
      fieldKeyMap: const {
        'currentPage': 'current_page',
        'perPage': 'per_page',
        'lastPage': 'last_page',
        'hasMore': 'has_more',
      },
    );

Map<String, dynamic> _$PaginationMetaToJson(_PaginationMeta instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'per_page': instance.perPage,
      'last_page': instance.lastPage,
      'has_more': instance.hasMore,
      'total': instance.total,
      'from': ?instance.from,
      'to': ?instance.to,
    };
