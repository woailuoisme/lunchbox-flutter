import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/core/widgets/widgets.dart';
import 'package:lunchbox/features/home/providers/home_provider.dart';

import 'package:lunchbox/features/home/entities/banner_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// 首页轮播图组件
class HomeHeaderCarousel extends ConsumerStatefulWidget {
  const HomeHeaderCarousel({super.key});

  @override
  ConsumerState<HomeHeaderCarousel> createState() => _HomeHeaderCarouselState();
}

class _HomeHeaderCarouselState extends ConsumerState<HomeHeaderCarousel> {
  int _currentHeaderIndex = 0;
  final CarouselSliderController _headerController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final banners = ref.watch(homeProvider.select((state) => state.banners));
    final isLoading = ref.watch(
      homeProvider.select((state) => state.isLoading),
    );

    var displayBanners = banners;
    if (displayBanners.isEmpty && isLoading) {
      displayBanners = List.generate(
        1,
        (index) => const BannerModel(
          id: 0,
          title: 'Loading Banner Title',
          thumb: '',
          type: '',
          thumbMedia: ThumbMedia(thumbnail: '', webp: ''),
          order: 0,
        ),
      );
    }

    if (displayBanners.isEmpty) {
      return SizedBox(
        height: 260.h,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    return Skeletonizer(
      enabled: isLoading,
      child: Stack(
        children: [
          CarouselSlider(
            carouselController: _headerController,
            options: CarouselOptions(
              height: 260.h,
              viewportFraction: 1,
              autoPlay: !isLoading, // 加载时不自动播放
              autoPlayInterval: const Duration(seconds: 5),
              onPageChanged: (index, reason) {
                setState(() {
                  _currentHeaderIndex = index;
                });
              },
            ),
            items: displayBanners.map((banner) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: AppImage(
                            imageUrl: banner.thumb,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                        ),
                        // 渐变蒙层，提升文字可读性
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withValues(alpha: 0.5),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // 运营文字叠加
                        Positioned(
                          left: 24.w,
                          bottom: 60.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                banner.title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          ),
          // 指示器
          if (!isLoading)
            Positioned(
              bottom: 20.h,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: displayBanners.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _headerController.animateToPage(entry.key),
                    child: Container(
                      width: 8.w,
                      height: 8.w,
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withValues(
                          alpha: _currentHeaderIndex == entry.key ? 0.9 : 0.4,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}
