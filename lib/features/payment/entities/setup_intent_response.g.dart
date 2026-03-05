// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setup_intent_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SetupIntentResponse _$SetupIntentResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_SetupIntentResponse', json, ($checkedConvert) {
      final val = _SetupIntentResponse(
        clientSecret: $checkedConvert('client_secret', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'clientSecret': 'client_secret'});

Map<String, dynamic> _$SetupIntentResponseToJson(
  _SetupIntentResponse instance,
) => <String, dynamic>{'client_secret': instance.clientSecret};
