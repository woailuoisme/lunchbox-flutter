// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RefreshTokenResponseData _$RefreshTokenResponseDataFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_RefreshTokenResponseData', json, ($checkedConvert) {
  final val = _RefreshTokenResponseData(
    token: $checkedConvert('token', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$RefreshTokenResponseDataToJson(
  _RefreshTokenResponseData instance,
) => <String, dynamic>{'token': instance.token};
