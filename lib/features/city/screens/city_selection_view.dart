import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

import '../../../core/values/app_colors.dart';
import '../../../shared/widgets/error_widget.dart' as app_error; // 防止命名冲突
import '../../../shared/widgets/loading_widget.dart';
import '../entities/city_model.dart';
import '../providers/city_providers.dart';

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
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    ref.read(citySearchQueryProvider.notifier).update(_searchController.text);
  }

  void _showAllCities() {
    _searchController.clear();
    FocusScope.of(context).unfocus();
  }

  Future<void> _selectCity(CityModel city) async {
    try {
      await ref.read(selectedCityProvider.notifier).set(city);
      if (mounted) {
        toastification.show(
          context: context,
          type: ToastificationType.success,
          title: const Text('城市已切换'),
          description: Text('已切换到 ${city.name}'),
          autoCloseDuration: const Duration(seconds: 2),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        toastification.show(
          context: context,
          type: ToastificationType.error,
          title: const Text('切换失败'),
          description: const Text('无法保存选择的城市，请重试'),
          autoCloseDuration: const Duration(seconds: 3),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('选择城市'),
        elevation: 0,
      ),
      body: Column(
        children: [
          // 搜索框
          _buildSearchBar(),

          // 热门城市
          _buildHotCities(),

          // 城市列表
          Expanded(
            child: _buildCityList(),
          ),
        ],
      ),
    );
  }

  /// 构建搜索框
  Widget _buildSearchBar() {
    final searchQuery = ref.watch(citySearchQueryProvider);
    
    return Container(
      padding: EdgeInsets.all(16.w),
      color: Colors.white,
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: '搜索城市',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: searchQuery.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: _showAllCities,
                )
              : const SizedBox.shrink(),
          filled: true,
          fillColor: AppColors.background,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        ),
      ),
    );
  }

  /// 构建热门城市
  Widget _buildHotCities() {
    final hotCitiesAsync = ref.watch(hotCitiesProvider);
    final searchQuery = ref.watch(citySearchQueryProvider);

    if (searchQuery.isNotEmpty) {
      return const SizedBox.shrink();
    }

    return hotCitiesAsync.when(
      data: (cities) {
        if (cities.isEmpty) return const SizedBox.shrink();
        
        return Container(
          color: Colors.white,
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '热门城市',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 12.h),
              Wrap(
                spacing: 12.w,
                runSpacing: 12.h,
                children: cities.map(_buildCityChip).toList(),
              ),
            ],
          ),
        );
      },
      loading: () => const SizedBox.shrink(), // 热门城市加载中不占位，或者显示骨架屏
      error: (_, __) => const SizedBox.shrink(),
    );
  }

  /// 构建城市芯片
  Widget _buildCityChip(CityModel city) {
    return InkWell(
      onTap: () => _selectCity(city),
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.divider),
        ),
        child: Text(
          city.name,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.textPrimary,
          ),
        ),
      ),
    );
  }

  /// 构建城市列表
  Widget _buildCityList() {
    final allCitiesAsync = ref.watch(allCitiesProvider);
    
    // 如果是搜索状态，使用 filteredCitiesProvider
    // 如果不是搜索状态，使用 groupedCitiesProvider (如果我们需要分组显示)
    // 原始代码在搜索时显示列表，未搜索时也显示列表（但可能分组）
    // 这里为了简单，我们统一使用 filteredCitiesProvider，它在无搜索词时返回所有城市
    // 
    // 实际上，如果我们需要分组显示（按首字母），我们需要判断 searchQuery
    
    final searchQuery = ref.watch(citySearchQueryProvider);
    
    if (searchQuery.isEmpty) {
      // 分组显示逻辑
      final groupedCities = ref.watch(groupedCitiesProvider);
      // groupedCitiesProvider 依赖 allCitiesProvider，所以如果 allCities 还在加载，它可能为空
      // 我们还是应该依赖 allCitiesAsync 的状态
      
      return allCitiesAsync.when(
        data: (_) {
           if (groupedCities.isEmpty) return _buildEmptyState();
           
           return RefreshIndicator(
             onRefresh: () async {
               ref.invalidate(allCitiesProvider);
               ref.invalidate(hotCitiesProvider);
               await ref.read(allCitiesProvider.future);
             },
             child: ListView.builder(
               itemCount: groupedCities.length,
               itemBuilder: (context, index) {
                 final initial = groupedCities.keys.elementAt(index);
                 final cities = groupedCities[initial]!;
                 return _buildGroupedItem(initial, cities);
               },
             ),
           );
        },
        loading: () => const LoadingWidget(),
        error: (err, stack) => app_error.ErrorWidget(
          message: err.toString(), 
          onRetry: () => ref.refresh(allCitiesProvider),
        ),
      );
    } else {
      // 搜索结果列表
      final filteredCities = ref.watch(filteredCitiesProvider);
      
      return allCitiesAsync.when(
        data: (_) {
          if (filteredCities.isEmpty) return _buildEmptyState();
          
          return ListView.builder(
            itemCount: filteredCities.length,
            itemBuilder: (context, index) {
              final city = filteredCities[index];
              return _buildCityItem(city);
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
  }

  Widget _buildGroupedItem(String initial, List<CityModel> cities) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          color: AppColors.background,
          width: double.infinity,
          child: Text(
            initial,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.textSecondary,
            ),
          ),
        ),
        ...cities.map(_buildCityItem),
      ],
    );
  }

  /// 构建城市列表项
  Widget _buildCityItem(CityModel city) {
    final selectedCityAsync = ref.watch(selectedCityProvider);
    final selectedCity = selectedCityAsync.valueOrNull;
    final isSelected = selectedCity?.id == city.id;

    return ColoredBox(
      color: Colors.white,
      child: ListTile(
        title: Text(
          city.name,
          style: TextStyle(
            fontSize: 16.sp,
            color: isSelected ? AppColors.primary : AppColors.textPrimary,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        trailing: isSelected
            ? Icon(
                Icons.check_circle,
                color: AppColors.primary,
                size: 24.sp,
              )
            : null,
        onTap: () => _selectCity(city),
      ),
    );
  }

  /// 构建空状态
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.location_city_outlined,
            size: 64.sp,
            color: AppColors.textHint,
          ),
          SizedBox(height: 16.h),
          Text(
            '未找到相关城市',
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: 8.h),
          TextButton(
            onPressed: _showAllCities,
            child: const Text('查看所有城市'),
          ),
        ],
      ),
    );
  }
}
