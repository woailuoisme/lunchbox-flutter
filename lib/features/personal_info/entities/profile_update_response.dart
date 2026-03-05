import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_update_response.freezed.dart';
part 'profile_update_response.g.dart';

@freezed
sealed class ProfileUpdateData with _$ProfileUpdateData {
  const factory ProfileUpdateData({
    required int id,
    String? avatar,
    required String gender,
    required String nickname,
    required String telephone,
  }) = _ProfileUpdateData;

  factory ProfileUpdateData.fromJson(Map<String, dynamic> json) =>
      _$ProfileUpdateDataFromJson(json);
}
