import 'package:freezed_annotation/freezed_annotation.dart';

part 'partner_consult_request.freezed.dart';
part 'partner_consult_request.g.dart';

@freezed
sealed class PartnerConsultRequest with _$PartnerConsultRequest {
  const factory PartnerConsultRequest({
    required String name,
    required String phone,
    required String company,
    required String message,
  }) = _PartnerConsultRequest;

  factory PartnerConsultRequest.fromJson(Map<String, dynamic> json) =>
      _$PartnerConsultRequestFromJson(json);
}
