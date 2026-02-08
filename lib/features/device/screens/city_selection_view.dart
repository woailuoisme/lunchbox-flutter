import 'package:alphabet_list_view/alphabet_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/features/device/entities/city_model.dart';
import 'package:lunchbox/features/device/repositories/city_repository.dart';

class CitySelectionView extends ConsumerStatefulWidget {
  const CitySelectionView({super.key});

  @override
  ConsumerState<CitySelectionView> createState() => _CitySelectionViewState();
}

class _CitySelectionViewState extends ConsumerState<CitySelectionView> {
  @override
  Widget build(BuildContext context) {
    final cityListAsync = ref.watch(cityListProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          '选择城市',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => context.pop(),
        ),
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          cityListAsync.when(
            data: (cities) => Expanded(
              child: Column(
                children: [
                  _buildCurrentLocation(cities.length),
                  Expanded(
                    child: AlphabetListView(
                      items: _buildAlphabetItems(cities),
                      options: AlphabetListViewOptions(
                        listOptions: ListOptions(
                          stickySectionHeader: true,
                          listHeaderBuilder: (context, symbol) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 8.h,
                              ),
                              color: const Color(
                                0xFFE0E0E0,
                              ), // Grey background for header
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    symbol,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        scrollbarOptions: ScrollbarOptions(
                          backgroundColor: Colors.transparent,
                          symbolBuilder: (context, symbol, state) {
                            return Container(
                              alignment: Alignment.center,
                              width: 30.w,
                              padding: EdgeInsets.symmetric(vertical: 2.h),
                              child: Text(
                                symbol,
                                style: TextStyle(
                                  color:
                                      state == AlphabetScrollbarItemState.active
                                      ? const Color(0xFFFF5252)
                                      : Colors.grey,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          },
                        ),
                        overlayOptions: OverlayOptions(
                          showOverlay: true,
                          overlayBuilder: (context, symbol) {
                            return Container(
                              width: 60.w,
                              height: 60.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.5),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Text(
                                symbol,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            loading: () => const Expanded(
              child: Center(
                child: CircularProgressIndicator(color: Color(0xFFFF5252)),
              ),
            ),
            error: (error, stack) => Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, size: 48.sp, color: Colors.grey),
                    SizedBox(height: 16.h),
                    Text(
                      '加载失败，请重试',
                      style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                    ),
                    TextButton(
                      onPressed: () => ref.refresh(cityListProvider),
                      child: const Text('重试'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<AlphabetListViewItemGroup> _buildAlphabetItems(List<CityModel> cities) {
    final Map<String, List<CityModel>> grouped = {};
    for (final city in cities) {
      if (!grouped.containsKey(city.tag)) {
        grouped[city.tag] = [];
      }
      grouped[city.tag]!.add(city);
    }

    final sortedKeys = grouped.keys.toList()..sort();

    return sortedKeys.map((tag) {
      return AlphabetListViewItemGroup(
        tag: tag,
        children: grouped[tag]!.map((city) => _buildCityItem(city)).toList(),
      );
    }).toList();
  }

  Widget _buildSearchBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      height: 40.h,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey, size: 20.sp),
          SizedBox(width: 8.w),
          Text(
            '搜索城市名称或省份',
            style: TextStyle(color: Colors.grey, fontSize: 14.sp),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentLocation(int cityCount) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F5E9),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '从预加载数据加载 ($cityCount个城市)',
              style: TextStyle(color: const Color(0xFF4CAF50), fontSize: 13.sp),
            ),
          ),
          InkWell(
            onTap: () => ref.refresh(cityListProvider),
            child: Icon(
              Icons.refresh,
              color: const Color(0xFF4CAF50),
              size: 18.sp,
            ),
          ),
          SizedBox(width: 8.w),
          Icon(Icons.edit, color: const Color(0xFF4CAF50), size: 18.sp),
        ],
      ),
    );
  }

  Widget _buildCityItem(CityModel city) {
    return InkWell(
      onTap: () {
        context.pop(city.name);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xFFEEEEEE))),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              city.name,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF333333),
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              city.code,
              style: TextStyle(fontSize: 12.sp, color: const Color(0xFF999999)),
            ),
          ],
        ),
      ),
    );
  }
}
