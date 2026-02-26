import 'package:freezed_annotation/freezed_annotation.dart';

part 'welcome_gift_item_model.freezed.dart';
part 'welcome_gift_item_model.g.dart';

@freezed
abstract class WelcomeGiftItemModel with _$WelcomeGiftItemModel {
  const factory WelcomeGiftItemModel({
    required String id,
    required String title,
    required String description,
    @Default(false) bool isClaimed,
    String? imageUrl,
    @Default(0) double value,
    String? type,
  }) = _WelcomeGiftItemModel;

  factory WelcomeGiftItemModel.fromJson(Map<String, dynamic> json) =>
      _$WelcomeGiftItemModelFromJson(json);
}
