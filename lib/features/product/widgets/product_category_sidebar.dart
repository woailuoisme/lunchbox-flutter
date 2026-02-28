import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/product/entities/category_product_model.dart';
import 'package:lunchbox/features/product/providers/product_provider.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// 产品分类侧边栏
class ProductCategorySidebar extends ConsumerWidget {
  const ProductCategorySidebar({required this.deviceId, super.key});

  final String deviceId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(productCategoriesProvider(deviceId));
    final theme = Theme.of(context);

    return SizedBox(
      width: 96.w,
      child: Container(
        color: theme.colorScheme.surfaceContainerLow.withValues(alpha: 0.5),
        child: categoriesAsync.when(
          data: (categories) => ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return _CategoryItem(category: category)
                  .animate()
                  .fadeIn(delay: (50 * index).ms)
                  .slideX(begin: -0.2, end: 0);
            },
          ),
          loading: () => Skeletonizer(
            enabled: true,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 8,
              itemBuilder: (context, index) {
                return const _CategorySkeleton();
              },
            ),
          ),
          error: (e, s) => Center(
            child: Icon(
              Symbols.error,
              size: 24.sp,
              color: theme.colorScheme.error,
            ),
          ),
        ),
      ),
    );
  }
}

class _CategoryItem extends ConsumerWidget {
  const _CategoryItem({required this.category});

  final CategoryProductModel category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategoryId = ref.watch(productCategoryProvider);
    final isSelected = selectedCategoryId == category.id;
    final theme = Theme.of(context);

    return InkWell(
      onTap: () {
        ref.read(productCategoryProvider.notifier).update(category.id);
      },
      child: Container(
        height: 64.h,
        alignment: Alignment.center,
        color: isSelected ? theme.scaffoldBackgroundColor : Colors.transparent,
        child: Stack(
          children: [
            if (isSelected)
              Positioned(
                left: 0,
                top: 12.h,
                bottom: 12.h,
                child: Container(
                  width: 4.w,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(4.r),
                      bottomRight: Radius.circular(4.r),
                    ),
                  ),
                ),
              ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: AnimatedDefaultTextStyle(
                  duration: 200.ms,
                  style: TextStyle(
                    fontSize: isSelected ? 13.sp : 12.sp,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    color: isSelected
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onSurfaceVariant,
                  ),
                  child: Text(
                    _getCategoryName(category),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getCategoryName(CategoryProductModel category) {
    if (category.id == -1) {
      return t.product.categoryAll;
    }
    return category.name;
  }
}

class _CategorySkeleton extends StatelessWidget {
  const _CategorySkeleton();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      alignment: Alignment.center,
      child: Container(width: 60.w, height: 16.h, color: Colors.black),
    );
  }
}
