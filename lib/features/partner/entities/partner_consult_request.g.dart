// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_consult_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PartnerConsultRequest _$PartnerConsultRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_PartnerConsultRequest', json, ($checkedConvert) {
  final val = _PartnerConsultRequest(
    name: $checkedConvert('name', (v) => v as String),
    phone: $checkedConvert('phone', (v) => v as String),
    company: $checkedConvert('company', (v) => v as String),
    message: $checkedConvert('message', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$PartnerConsultRequestToJson(
  _PartnerConsultRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'phone': instance.phone,
  'company': instance.company,
  'message': instance.message,
};
