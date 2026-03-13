import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/community/providers/community_provider.dart';
import 'package:lunchbox/features/community/widgets/community_features.dart';
import 'package:lunchbox/features/community/widgets/community_header.dart';
import 'package:lunchbox/features/community/widgets/community_qr_card.dart';
import 'package:lunchbox/features/community/widgets/community_why_join.dart';
import 'package:lunchbox/i18n/translations.g.dart';

/// 社群福利页面
///
/// 展示加入社群的引导，包含二维码和福利说明
class CommunityView extends ConsumerWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final communityAsync = ref.watch(communityProvider);

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainer,
      appBar: AppBar(
        title: Text(t.community.title),
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        centerTitle: true,
      ),
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const CommunityHeader(),
                communityAsync.when(
                  data: (community) => CommunityQrCard(community: community),
                  loading: () => const CommunityQrCard(), // 显示占位/默认状态
                  error: (err, stack) => const CommunityQrCard(),
                ),
                const CommunityFeatures(),
                const CommunityWhyJoin(),
                SizedBox(height: 32.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
