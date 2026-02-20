import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/core/widgets/app_dialog.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsView extends ConsumerStatefulWidget {
  const AboutUsView({super.key});

  @override
  ConsumerState<AboutUsView> createState() => _AboutUsViewState();
}

class _AboutUsViewState extends ConsumerState<AboutUsView> {
  String _version = '1.0.0';

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  void _showPolicyDialog() {
    AppDialog.showContent(
      context,
      title: t.about.userAgreementAndPrivacy,
      width: 0.9.sw,
      padding: EdgeInsets.zero,
      content: SizedBox(
        height: 0.75.sh,
        child: FutureBuilder<String>(
          future: Future.delayed(
            const Duration(milliseconds: 300),
            () => rootBundle.loadString('assets/html/xieyi.html'),
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Skeletonizer(
                enabled: true,
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 16.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 200.w,
                          height: 24.h,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Container(
                        width: double.infinity,
                        height: 16.h,
                        color: Colors.black,
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        width: double.infinity,
                        height: 16.h,
                        color: Colors.black,
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        width: 200.w,
                        height: 16.h,
                        color: Colors.black,
                      ),
                      SizedBox(height: 16.h),
                      Container(
                        width: double.infinity,
                        height: 16.h,
                        color: Colors.black,
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        width: double.infinity,
                        height: 16.h,
                        color: Colors.black,
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        width: 300.w,
                        height: 16.h,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Symbols.error,
                      size: 48.sp,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    SizedBox(height: 16.h),
                    Text(t.common.error),
                  ],
                ),
              );
            }
            return Scrollbar(
              thumbVisibility: true,
              radius: Radius.circular(4.r),
              thickness: 4.w,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: Html(
                  data: snapshot.data ?? '',
                  style: {
                    "body": Style(
                      fontSize: FontSize(14.sp),
                      lineHeight: const LineHeight(1.6),
                      padding: HtmlPaddings.zero,
                      margin: Margins.zero,
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                      fontFamily: 'Roboto',
                    ),
                    "h1": Style(
                      fontSize: FontSize(20.sp),
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                      margin: Margins.only(bottom: 24.h),
                      color: Theme.of(context).textTheme.titleLarge?.color,
                    ),
                    "h2": Style(
                      fontSize: FontSize(16.sp),
                      fontWeight: FontWeight.bold,
                      margin: Margins.only(top: 20.h, bottom: 12.h),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    "h3": Style(
                      fontSize: FontSize(15.sp),
                      fontWeight: FontWeight.w600,
                      margin: Margins.only(top: 16.h, bottom: 8.h),
                      color: Theme.of(context).textTheme.titleMedium?.color,
                    ),
                    "p": Style(
                      margin: Margins.only(bottom: 12.h),
                      textAlign: TextAlign.justify,
                    ),
                    "li": Style(margin: Margins.only(bottom: 8.h)),
                    "a": Style(
                      color: Theme.of(context).colorScheme.primary,
                      textDecoration: TextDecoration.none,
                    ),
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _version = info.version;
    });
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
          SliverToBoxAdapter(child: _buildLogoSection(context)),
          SliverToBoxAdapter(child: SizedBox(height: 32.h)),
          SliverToBoxAdapter(child: _buildFeaturesSection(context)),
          SliverToBoxAdapter(child: SizedBox(height: 24.h)),
          SliverToBoxAdapter(child: _buildPolicySection(context)),
          SliverToBoxAdapter(child: SizedBox(height: 24.h)),
          SliverToBoxAdapter(child: _buildContactSection(context)),
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

  Widget _buildLogoSection(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Container(
          width: 100.w,
          height: 100.w,
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: theme.shadowColor.withValues(alpha: 0.1),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
            image: const DecorationImage(
              image: NetworkImage('https://picsum.photos/seed/logo/200'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Text(
            'Version $_version',
            style: TextStyle(
              color: theme.colorScheme.primary,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Text(
            t.profile.appDescription,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
              fontSize: 14.sp,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturesSection(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(context, t.about.featuresTitle),
          SizedBox(height: 16.h),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 12.w,
            crossAxisSpacing: 12.w,
            childAspectRatio: 1.3,
            children: [
              _buildFeatureItem(
                context,
                Symbols.restaurant,
                t.about.feature1Title,
                t.about.feature1Desc,
                theme.colorScheme.primary,
              ),
              _buildFeatureItem(
                context,
                Symbols.rocket_launch,
                t.about.feature2Title,
                t.about.feature2Desc,
                theme.colorScheme.primary,
              ),
              _buildFeatureItem(
                context,
                Symbols.star,
                t.about.feature3Title,
                t.about.feature3Desc,
                theme.colorScheme.primary,
              ),
              _buildFeatureItem(
                context,
                Symbols.diamond,
                t.about.feature4Title,
                t.about.feature4Desc,
                theme.colorScheme.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(
    BuildContext context,
    IconData icon,
    String title,
    String desc,
    Color color,
  ) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(icon, size: 20.sp, color: color),
          ),
          const Spacer(),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: theme.textTheme.titleMedium?.color,
            ),
          ),
          const Spacer(),
          Text(
            desc,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11.sp,
              color: theme.textTheme.bodySmall?.color,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPolicySection(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(context, t.about.policyTitle),
          SizedBox(height: 12.h),
          Container(
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: theme.shadowColor.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 4.h,
              ),
              leading: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Symbols.description,
                  color: theme.colorScheme.primary,
                  size: 20.sp,
                ),
              ),
              title: Text(
                t.about.userAgreementAndPrivacy,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                t.about.viewDetails,
                style: TextStyle(fontSize: 12.sp, color: theme.hintColor),
              ),
              trailing: Icon(
                Symbols.chevron_right,
                size: 20.sp,
                color: theme.hintColor,
              ),
              onTap: _showPolicyDialog,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(context, t.about.contactTitle),
          SizedBox(height: 12.h),
          Container(
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: theme.shadowColor.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildContactTile(
                  context,
                  icon: Symbols.phone,
                  title: t.about.customerServiceHotline,
                  subtitle: t.about.customerServiceNumber,
                  onTap: _launchPhone,
                  isFirst: true,
                ),
                Divider(
                  height: 1,
                  indent: 56.w,
                  color: theme.dividerColor.withValues(alpha: 0.5),
                ),
                _buildContactTile(
                  context,
                  icon: Symbols.location_on,
                  title: t.about.companyAddress,
                  subtitle: t.about.addressDetails,
                  onTap: _launchMap,
                  isLast: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    bool isFirst = false,
    bool isLast = false,
  }) {
    final theme = Theme.of(context);
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      leading: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: theme.colorScheme.primary.withValues(alpha: 0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: theme.colorScheme.primary, size: 20.sp),
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 12.sp, color: theme.hintColor),
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(top: 4.h),
        child: Text(
          subtitle,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: theme.textTheme.bodyLarge?.color,
          ),
        ),
      ),
      trailing: Icon(
        Symbols.chevron_right,
        size: 20.sp,
        color: theme.hintColor,
      ),
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: isFirst ? Radius.circular(16.r) : Radius.zero,
          bottom: isLast ? Radius.circular(16.r) : Radius.zero,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(left: 4.w),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: theme.textTheme.titleMedium?.color,
        ),
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
    await SharePlus.instance.share(
      ShareParams(text: 'Lunchbox - 您的专属午餐管家\n版本: $_version'),
    );
  }
}
