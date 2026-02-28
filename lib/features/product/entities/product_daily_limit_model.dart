import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_daily_limit_model.freezed.dart';
part 'product_daily_limit_model.g.dart';

@freezed
sealed class ProductDailyLimitModel with _$ProductDailyLimitModel {
  const factory ProductDailyLimitModel({
    /// 当前已购买数量
    @Default(0) int current,

    /// 每日限购数量
    @Default(0) int limit,

    /// 剩余可购买数量
    @Default(0) int remaining,
  }) = _ProductDailyLimitModel;

  factory ProductDailyLimitModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDailyLimitModelFromJson(json);
}
