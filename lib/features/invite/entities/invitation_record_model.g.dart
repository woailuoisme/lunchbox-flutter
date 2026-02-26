// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InvitationRecordModel _$InvitationRecordModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_InvitationRecordModel',
  json,
  ($checkedConvert) {
    final val = _InvitationRecordModel(
      id: $checkedConvert('id', (v) => v as String),
      inviteePhone: $checkedConvert('invitee_phone', (v) => v as String),
      status: $checkedConvert('status', (v) => v as String),
      reward: $checkedConvert('reward', (v) => (v as num?)?.toDouble() ?? 0.0),
      createTime: $checkedConvert(
        'create_time',
        (v) => DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'inviteePhone': 'invitee_phone',
    'createTime': 'create_time',
  },
);

Map<String, dynamic> _$InvitationRecordModelToJson(
  _InvitationRecordModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'invitee_phone': instance.inviteePhone,
  'status': instance.status,
  'reward': instance.reward,
  'create_time': instance.createTime.toIso8601String(),
};
