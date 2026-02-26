// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_daily_limit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductDailyLimitModel _$ProductDailyLimitModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ProductDailyLimitModel', json, ($checkedConvert) {
  final val = _ProductDailyLimitModel(
    current: $checkedConvert('current', (v) => (v as num?)?.toInt() ?? 0),
    limit: $checkedConvert('limit', (v) => (v as num?)?.toInt() ?? 0),
    remaining: $checkedConvert('remaining', (v) => (v as num?)?.toInt() ?? 0),
  );
  return val;
});

Map<String, dynamic> _$ProductDailyLimitModelToJson(
  _ProductDailyLimitModel instance,
) => <String, dynamic>{
  'current': instance.current,
  'limit': instance.limit,
  'remaining': instance.remaining,
};
