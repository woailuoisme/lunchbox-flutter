import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lunchbox/features/home/entities/banner_model.dart';
import 'package:lunchbox/features/home/entities/nearest_device_model.dart';
import 'package:lunchbox/features/home/entities/recommend_product_model.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    NearestDeviceModel? nearestDevice,
    @Default([]) List<BannerModel> banners,
    @Default([]) List<RecommendProductModel> recommendProducts,
    @Default(false) bool isLoading,
    @Default(0) int selectedTabIndex,
    String? errorMessage,
  }) = _HomeState;
}
