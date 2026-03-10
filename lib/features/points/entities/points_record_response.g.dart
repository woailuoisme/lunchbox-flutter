// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'points_record_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PointsRecordResponse _$PointsRecordResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_PointsRecordResponse',
  json,
  ($checkedConvert) {
    final val = _PointsRecordResponse(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      userId: $checkedConvert('user_id', (v) => (v as num?)?.toInt() ?? 0),
      itemId: $checkedConvert('item_id', (v) => (v as num?)?.toInt()),
      inte: $checkedConvert('inte', (v) => (v as num?)?.toInt() ?? 0),
      status: $checkedConvert('status', (v) => v as String? ?? ''),
      redemptionItem: $checkedConvert(
        'redemption_item',
        (v) => v as Map<String, dynamic>?,
      ),
      redemptionType: $checkedConvert('redemption_type', (v) => v as String?),
      redemptionContent: $checkedConvert(
        'redemption_content',
        (v) => v as String? ?? '',
      ),
      statusLabel: $checkedConvert('status_label', (v) => v as String? ?? ''),
      createdAt: $checkedConvert('created_at', (v) => v as String? ?? ''),
    );
    return val;
  },
  fieldKeyMap: const {
    'userId': 'user_id',
    'itemId': 'item_id',
    'redemptionItem': 'redemption_item',
    'redemptionType': 'redemption_type',
    'redemptionContent': 'redemption_content',
    'statusLabel': 'status_label',
    'createdAt': 'created_at',
  },
);

Map<String, dynamic> _$PointsRecordResponseToJson(
  _PointsRecordResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'item_id': ?instance.itemId,
  'inte': instance.inte,
  'status': instance.status,
  'redemption_item': ?instance.redemptionItem,
  'redemption_type': ?instance.redemptionType,
  'redemption_content': instance.redemptionContent,
  'status_label': instance.statusLabel,
  'created_at': instance.createdAt,
};
