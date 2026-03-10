import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/profile/widgets/about_feature_item.dart';
import 'package:lunchbox/features/profile/widgets/section_title.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';

class AboutFeaturesSection extends StatelessWidget {
  const AboutFeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: t.about.featuresTitle),
          SizedBox(height: 16.h),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 12.w,
            crossAxisSpacing: 12.w,
            childAspectRatio: 1.3,
            children: [
              AboutFeatureItem(
                icon: Symbols.restaurant,
                title: t.about.feature1Title,
                desc: t.about.feature1Desc,
                color: theme.colorScheme.primary,
              ),
              AboutFeatureItem(
                icon: Symbols.rocket_launch,
                title: t.about.feature2Title,
                desc: t.about.feature2Desc,
                color: theme.colorScheme.primary,
              ),
              AboutFeatureItem(
                icon: Symbols.star,
                title: t.about.feature3Title,
                desc: t.about.feature3Desc,
                color: theme.colorScheme.primary,
              ),
              AboutFeatureItem(
                icon: Symbols.diamond,
                title: t.about.feature4Title,
                desc: t.about.feature4Desc,
                color: theme.colorScheme.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
