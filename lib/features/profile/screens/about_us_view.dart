import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 32.h),
            _buildLogoSection(context),
            SizedBox(height: 32.h),
            _buildFeaturesSection(context),
            SizedBox(height: 16.h),
            _buildPolicySection(context),
            SizedBox(height: 16.h),
            _buildContactSection(context),
            SizedBox(height: 32.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SizedBox(
                width: double.infinity,
                height: 48.h,
                child: ElevatedButton.icon(
                  onPressed: _shareApp,
                  icon: Icon(Symbols.share, color: theme.colorScheme.onPrimary),
                  label: Text(
                    t.about.shareWithFriends,
                    style: TextStyle(color: theme.colorScheme.onPrimary),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoSection(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(vertical: 32.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Container(
            width: 80.w,
            height: 80.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: theme.shadowColor.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
              image: const DecorationImage(
                image: NetworkImage(
                  'https://picsum.photos/seed/logo/200',
                ), // Replace with actual logo asset
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            t.about.appBrand,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              'v$_version',
              style: TextStyle(
                color: theme.colorScheme.primary,
                fontSize: 12.sp,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Text(
              t.profile.appDescription,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: theme.textTheme.bodyMedium?.color?.withValues(
                  alpha: 0.6,
                ),
                fontSize: 14.sp,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturesSection(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(context, t.about.featuresTitle),
          SizedBox(height: 16.h),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 16.w,
            crossAxisSpacing: 16.w,
            childAspectRatio: 1.2,
            children: [
              _buildFeatureItem(
                context,
                Symbols.restaurant,
                t.about.feature1Title,
                t.about.feature1Desc,
              ),
              _buildFeatureItem(
                context,
                Symbols.rocket_launch,
                t.about.feature2Title,
                t.about.feature2Desc,
              ),
              _buildFeatureItem(
                context,
                Symbols.star,
                t.about.feature3Title,
                t.about.feature3Desc,
              ),
              _buildFeatureItem(
                context,
                Symbols.diamond,
                t.about.feature4Title,
                t.about.feature4Desc,
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
  ) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 28.sp,
            color: theme.colorScheme.primary,
          ), // Simplified color
          SizedBox(height: 8.h),
          Text(
            title,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4.h),
          Text(
            desc,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 10.sp,
              color: theme.textTheme.bodySmall?.color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPolicySection(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(context, t.about.policyTitle),
          SizedBox(height: 16.h),
          ListTile(
            leading: Icon(
              Symbols.description,
              color: theme.colorScheme.primary,
            ),
            title: Text(
              t.about.userAgreementAndPrivacy,
              style: TextStyle(fontSize: 14.sp),
            ),
            subtitle: Text(
              t.about.viewDetails,
              style: TextStyle(
                fontSize: 12.sp,
                color: theme.textTheme.bodySmall?.color,
              ),
            ),
            trailing: const Icon(Symbols.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(context, t.about.contactTitle),
          SizedBox(height: 16.h),
          ListTile(
            leading: Icon(Symbols.phone, color: theme.colorScheme.primary),
            title: Text(
              t.about.customerServiceHotline,
              style: TextStyle(
                fontSize: 12.sp,
                color: theme.textTheme.bodySmall?.color,
              ),
            ),
            subtitle: Text(
              t.about.customerServiceNumber,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: theme.textTheme.bodyLarge?.color,
              ),
            ),
            trailing: const Icon(Symbols.arrow_forward_ios, size: 16),
            onTap: _launchPhone,
          ),
          Divider(height: 1, color: theme.dividerColor),
          ListTile(
            leading: Icon(
              Symbols.location_on,
              color: theme.colorScheme.primary,
            ),
            title: Text(
              t.about.companyAddress,
              style: TextStyle(
                fontSize: 12.sp,
                color: theme.textTheme.bodySmall?.color,
              ),
            ),
            subtitle: Text(
              t.about.addressDetails,
              style: TextStyle(
                fontSize: 14.sp,
                color: theme.textTheme.bodyLarge?.color,
              ),
            ),
            trailing: const Icon(Symbols.arrow_forward_ios, size: 16),
            onTap: _launchMap,
          ),
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
    await SharePlus.instance.share(
      ShareParams(text: 'Lunchbox - 您的专属午餐管家\n版本: $_version'),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Container(width: 4.w, height: 16.h, color: theme.colorScheme.primary),
        SizedBox(width: 8.w),
        Text(
          title,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
