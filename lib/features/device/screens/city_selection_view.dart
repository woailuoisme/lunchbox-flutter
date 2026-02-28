import 'package:alphabet_list_view/alphabet_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/core/widgets/error_widget.dart' as app_error;
import 'package:lunchbox/core/widgets/loading_widget.dart';
import 'package:lunchbox/features/device/entities/city_model.dart';
import 'package:lunchbox/features/device/providers/city_provider.dart';
import 'package:lunchbox/features/device/providers/device_provider.dart';
import 'package:lunchbox/features/device/widgets/city_empty_state.dart';
import 'package:lunchbox/features/device/widgets/city_hot_grid.dart';
import 'package:lunchbox/features/device/widgets/city_item.dart';
import 'package:lunchbox/features/device/widgets/city_search_bar.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:toastification/toastification.dart';

/// 城市选择视图
class CitySelectionView extends ConsumerStatefulWidget {
  const CitySelectionView({super.key});

  @override
  ConsumerState<CitySelectionView> createState() => _CitySelectionViewState();
}

class _CitySelectionViewState extends ConsumerState<CitySelectionView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController
      ..removeListener(_onSearchChanged)
      ..dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    ref.read(citySearchQueryProvider.notifier).query = _searchController.text;
  }

  void _showAllCities() {
    _searchController.clear();
    FocusScope.of(context).unfocus();
  }

  Future<void> _selectCity(CityModel city) async {
    try {
      await ref.read(selectedCityProvider.notifier).set(city);

      // 强制刷新附近设备列表
      ref.invalidate(nearbyDevicesProvider);

      if (mounted) {
        toastification.show(
          context: context,
          type: ToastificationType.success,
          title: Text(t.city.switchSuccess),
          description: Text(t.city.switchedTo(name: city.name)),
          autoCloseDuration: const Duration(seconds: 2),
        );
        // 返回上一页
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        toastification.show(
          context: context,
          type: ToastificationType.error,
          title: Text(t.city.switchFailed),
          description: Text(t.city.saveFailed),
          autoCloseDuration: const Duration(seconds: 3),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(t.city.title),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // 搜索框
          CitySearchBar(controller: _searchController, onClear: _showAllCities),

          // 城市列表 (包含热门城市)
          Expanded(child: _buildCityList(theme)),
        ],
      ),
    );
  }

  /// 构建城市列表
  Widget _buildCityList(ThemeData theme) {
    final allCitiesAsync = ref.watch(allCitiesProvider);
    final searchQuery = ref.watch(citySearchQueryProvider);

    if (searchQuery.isNotEmpty) {
      // 搜索结果列表
      final filteredCities = ref.watch(filteredCitiesProvider);

      return allCitiesAsync.when(
        data: (_) {
          if (filteredCities.isEmpty) {
            return CityEmptyState(onViewAll: _showAllCities);
          }

          return ListView.builder(
            itemCount: filteredCities.length,
            itemBuilder: (context, index) {
              final city = filteredCities[index];
              return CityItem(city: city, onSelect: _selectCity);
            },
          );
        },
        loading: () => const LoadingWidget(),
        error: (err, stack) => app_error.ErrorWidget(
          message: err.toString(),
          onRetry: () => ref.refresh(allCitiesProvider),
        ),
      );
    }

    // 分组显示逻辑
    final groupedCities = ref.watch(groupedCitiesProvider);
    final hotCitiesAsync = ref.watch(hotCitiesProvider);

    return allCitiesAsync.when(
      data: (_) {
        if (groupedCities.isEmpty) {
          return CityEmptyState(onViewAll: _showAllCities);
        }

        // 构建 AlphabetListView 数据源
        final List<AlphabetListViewItemGroup> items = [];

        // 添加热门城市
        if (hotCitiesAsync.hasValue && hotCitiesAsync.value!.isNotEmpty) {
          items.add(
            AlphabetListViewItemGroup(
              tag: '★',
              children: [
                CityHotGrid(
                  cities: hotCitiesAsync.value!,
                  onSelect: _selectCity,
                ),
              ],
            ),
          );
        }

        // 添加分组城市
        items.addAll(
          groupedCities.entries.map((entry) {
            return AlphabetListViewItemGroup(
              tag: entry.key,
              children: entry.value
                  .map((city) => CityItem(city: city, onSelect: _selectCity))
                  .toList(),
            );
          }),
        );

        return AlphabetListView(
          items: items,
          options: AlphabetListViewOptions(
            listOptions: ListOptions(
              stickySectionHeader: true,
              listHeaderBuilder: (context, symbol) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  color: theme.colorScheme.surfaceContainer,
                  width: double.infinity,
                  child: Text(
                    symbol == '★' ? t.city.hot : symbol,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                );
              },
            ),
            scrollbarOptions: ScrollbarOptions(
              symbolBuilder: (context, symbol, state) {
                final isActive = state == AlphabetScrollbarItemState.active;
                return Center(
                  child: Container(
                    width: 24.w,
                    height: 24.w,
                    decoration: isActive
                        ? BoxDecoration(
                            color: theme.colorScheme.primary,
                            shape: BoxShape.circle,
                          )
                        : null,
                    alignment: Alignment.center,
                    child: Text(
                      symbol,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: isActive
                            ? theme.colorScheme.onPrimary
                            : theme.colorScheme.onSurfaceVariant,
                        fontWeight: isActive
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              },
              backgroundColor: Colors.transparent,
              width: 32.w,
              padding: EdgeInsets.symmetric(vertical: 8.h),
            ),
            overlayOptions: OverlayOptions(
              showOverlay: true,
              overlayBuilder: (context, symbol) {
                return Container(
                  alignment: Alignment.center,
                  width: 64.w,
                  height: 64.w,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withValues(alpha: 0.9),
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: theme.colorScheme.shadow.withValues(alpha: 0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Text(
                    symbol == '★' ? '★' : symbol,
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
      loading: () => const LoadingWidget(),
      error: (err, stack) => app_error.ErrorWidget(
        message: err.toString(),
        onRetry: () => ref.refresh(allCitiesProvider),
      ),
    );
  }
}
