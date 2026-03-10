import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:lunchbox/core/widgets/html_web_view.dart';
import 'package:lunchbox/features/profile/widgets/about_contact_section.dart';
import 'package:lunchbox/features/profile/widgets/about_features_section.dart';
import 'package:lunchbox/features/profile/widgets/about_logo_section.dart';
import 'package:lunchbox/features/profile/widgets/about_policy_section.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsView extends ConsumerStatefulWidget {
  const AboutUsView({super.key});

  @override
  ConsumerState<AboutUsView> createState() => _AboutUsViewState();
}

class _AboutUsViewState extends ConsumerState<AboutUsView> {
  @override
  void initState() {
    super.initState();
  }

  void _showPolicyDialog() {
    showDialog<void>(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.zero, // 关键：去掉外部边距，使宽度等于屏幕宽度
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Container(
            width: 1.1.sw,
            constraints: BoxConstraints(maxHeight: 0.8.sh),
            padding: EdgeInsets.symmetric(vertical: 24.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 标题
                Text(
                  t.about.userAgreementAndPrivacy,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.h),
                // 内容
                Flexible(
                  child: FutureBuilder<String>(
                    future: Future.delayed(
                      const Duration(milliseconds: 300),
                      () => rootBundle.loadString('assets/html/xieyi.html'),
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Symbols.error,
                                size: 40.sp,
                                color: Theme.of(context).colorScheme.error,
                              ),
                              SizedBox(height: 12.h),
                              Text(
                                t.common.error,
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ],
                          ),
                        );
                      }
                      // 将 HtmlWebView 包裹在 Padding 中，让内部内容贴边或留缝
                      return HtmlWebView(htmlContent: snapshot.data ?? '');
                    },
                  ),
                ),
                SizedBox(height: 16.h),
                // 底部按钮
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(t.common.ok),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(t.about.title),
        centerTitle: true,
        backgroundColor:
            theme.appBarTheme.backgroundColor ?? theme.colorScheme.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 24.h)),
          const SliverToBoxAdapter(child: AboutLogoSection()),
          SliverToBoxAdapter(child: SizedBox(height: 32.h)),
          const SliverToBoxAdapter(child: AboutFeaturesSection()),
          SliverToBoxAdapter(child: SizedBox(height: 24.h)),
          SliverToBoxAdapter(
            child: AboutPolicySection(onTapPolicy: _showPolicyDialog),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 24.h)),
          SliverToBoxAdapter(
            child: AboutContactSection(
              onTapPhone: _launchPhone,
              onTapAddress: _launchMap,
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 32.h)),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: SizedBox(
                width: double.infinity,
                height: 50.h,
                child: FilledButton.icon(
                  onPressed: _shareApp,
                  icon: const Icon(Symbols.share, size: 20),
                  label: Text(
                    t.about.shareWithFriends,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 32.h)),
        ],
      ),
    );
  }

  Future<void> _launchPhone() async {
    final Uri launchUri = Uri(scheme: 'tel', path: '4001148818');
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  Future<void> _launchMap() async {
    const address = '广东省东莞市松山湖园区科汇路1号1栋1510室';
    final query = Uri.encodeComponent(address);
    Uri uri;

    if (Platform.isIOS || Platform.isMacOS) {
      uri = Uri.parse('https://maps.apple.com/?q=$query');
    } else {
      uri = Uri.parse('geo:0,0?q=$query');
    }

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      // Fallback to web map
      final webUri = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$query',
      );
      if (await canLaunchUrl(webUri)) {
        await launchUrl(webUri, mode: LaunchMode.externalApplication);
      }
    }
  }

  Future<void> _shareApp() async {
    await SharePlus.instance.share(ShareParams(text: 'Lunchbox - 您的专属午餐管家'));
  }
}
