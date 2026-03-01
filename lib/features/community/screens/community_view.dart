import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/community/widgets/community_features.dart';
import 'package:lunchbox/features/community/widgets/community_header.dart';
import 'package:lunchbox/features/community/widgets/community_qr_card.dart';
import 'package:lunchbox/features/community/widgets/community_why_join.dart';
import 'package:lunchbox/i18n/translations.g.dart';

/// 社群福利页面
///
/// 展示加入社群的引导，包含二维码和福利说明
class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainer,
      appBar: AppBar(
        title: Text(t.community.title),
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CommunityHeader(),
            const CommunityQrCard(),
            const CommunityFeatures(),
            const CommunityWhyJoin(),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}
