import 'package:freezed_annotation/freezed_annotation.dart';

part 'welcome_gift_log_model.freezed.dart';
part 'welcome_gift_log_model.g.dart';

@freezed
abstract class WelcomeGiftLogModel with _$WelcomeGiftLogModel {
  const factory WelcomeGiftLogModel({
    required String id,
    required String giftId,
    required String giftTitle,
    required DateTime claimedAt,
  }) = _WelcomeGiftLogModel;

  factory WelcomeGiftLogModel.fromJson(Map<String, dynamic> json) =>
      _$WelcomeGiftLogModelFromJson(json);
}
