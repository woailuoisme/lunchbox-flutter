import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:lunchbox/features/partner/repositories/partner_repository.dart';
import 'package:timelines_plus/timelines_plus.dart';

class PartnerView extends ConsumerStatefulWidget {
  const PartnerView({super.key});

  @override
  ConsumerState<PartnerView> createState() => _PartnerViewState();
}

class _PartnerViewState extends ConsumerState<PartnerView> {
  final _nameController = TextEditingController();
  final _companyController = TextEditingController();
  final _phoneController = TextEditingController();
  final _intentionController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _companyController.dispose();
    _phoneController.dispose();
    _intentionController.dispose();
    super.dispose();
  }

  Future<void> _submitApplication() async {
    final name = _nameController.text.trim();
    final company = _companyController.text.trim();
    final phone = _phoneController.text.trim();
    final intention = _intentionController.text.trim();

    if (name.isEmpty || company.isEmpty || phone.isEmpty || intention.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(t.partner.incompleteInfo)));
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      // partnerRepositoryProvider provides PartnerRepository, which has applyPartner method.
      // It does NOT have a notifier or return bool success directly (it returns Future<void>).
      // We should wrap it in try-catch.
      await ref.read(partnerRepositoryProvider).applyPartner({
        'name': name,
        'company': company,
        'phone': phone,
        'intention': intention,
      });

      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(t.partner.submitSuccess)));
        _nameController.clear();
        _companyController.clear();
        _phoneController.clear();
        _intentionController.clear();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.partner.errorOccurred(error: e.toString()))),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(t.partner.title),
        centerTitle: true,
        backgroundColor:
            theme.appBarTheme.backgroundColor ?? theme.colorScheme.surface,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  _buildAdvantages(context),
                  SizedBox(height: 16.h),
                  _buildProcess(context),
                  SizedBox(height: 16.h),
                  _buildConditions(context),
                  SizedBox(height: 16.h),
                  _buildApplicationForm(context),
                  SizedBox(height: 16.h),
                  _buildContactInfo(context),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 32.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.primaryContainer,
          ],
        ),
      ),
      child: Column(
        children: [
          Text(
            t.partner.title,
            style: TextStyle(
              color: theme.colorScheme.onPrimary,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            t.partner.subtitle,
            style: TextStyle(
              color: theme.colorScheme.onPrimary.withValues(alpha: 0.8),
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdvantages(BuildContext context) {
    final theme = Theme.of(context);
    return _buildSectionCard(
      context: context,
      title: t.partner.advantages,
      children: [
        _buildAdvantageItem(
          Symbols.monetization_on,
          t.partner.advantage1Title,
          t.partner.advantage1Desc,
          theme.colorScheme.primary,
          context,
        ),
        _buildAdvantageItem(
          Symbols.security,
          t.partner.advantage2Title,
          t.partner.advantage2Desc,
          theme.colorScheme.primary,
          context,
        ),
        _buildAdvantageItem(
          Symbols.trending_up,
          t.partner.advantage3Title,
          t.partner.advantage3Desc,
          theme.colorScheme.primary,
          context,
        ),
        _buildAdvantageItem(
          Symbols.school,
          t.partner.advantage4Title,
          t.partner.advantage4Desc,
          theme.colorScheme.primary,
          context,
        ),
      ],
    );
  }

  Widget _buildAdvantageItem(
    IconData icon,
    String title,
    String desc,
    Color color,
    BuildContext context,
  ) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(icon, color: color, size: 24.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: theme.textTheme.titleMedium?.color,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  desc,
                  style: TextStyle(fontSize: 12.sp, color: theme.hintColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProcess(BuildContext context) {
    final theme = Theme.of(context);
    final processes = [
      {
        'step': '1',
        'title': t.partner.process1Title,
        'desc': t.partner.process1Desc,
      },
      {
        'step': '2',
        'title': t.partner.process2Title,
        'desc': t.partner.process2Desc,
      },
      {
        'step': '3',
        'title': t.partner.process3Title,
        'desc': t.partner.process3Desc,
      },
      {
        'step': '4',
        'title': t.partner.process4Title,
        'desc': t.partner.process4Desc,
      },
      {
        'step': '5',
        'title': t.partner.process5Title,
        'desc': t.partner.process5Desc,
      },
    ];

    return _buildSectionCard(
      context: context,
      title: t.partner.process,
      children: [
        FixedTimeline.tileBuilder(
          theme: TimelineThemeData(
            nodePosition: 0,
            color: theme.colorScheme.primary,
            indicatorTheme: IndicatorThemeData(position: 0, size: 24.w),
            connectorTheme: ConnectorThemeData(
              thickness: 2.w,
              color: theme.dividerColor,
            ),
          ),
          builder: TimelineTileBuilder.connected(
            connectionDirection: ConnectionDirection.after,
            itemCount: processes.length,
            contentsBuilder: (context, index) {
              final item = processes[index];
              return Padding(
                padding: EdgeInsets.only(left: 12.w, bottom: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title']!,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: theme.textTheme.titleMedium?.color,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      item['desc']!,
                      style: TextStyle(fontSize: 12.sp, color: theme.hintColor),
                    ),
                  ],
                ),
              );
            },
            indicatorBuilder: (context, index) {
              final item = processes[index];
              return DotIndicator(
                color: theme.colorScheme.primary,
                child: Center(
                  child: Text(
                    item['step']!,
                    style: TextStyle(
                      color: theme.colorScheme.onPrimary,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              );
            },
            connectorBuilder: (context, index, type) {
              return SolidLineConnector(color: theme.dividerColor);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildConditions(BuildContext context) {
    final theme = Theme.of(context);
    final conditions = [
      t.partner.condition1,
      t.partner.condition2,
      t.partner.condition3,
      t.partner.condition4,
      t.partner.condition5,
    ];

    return _buildSectionCard(
      context: context,
      title: t.partner.conditions,
      children: [
        FixedTimeline.tileBuilder(
          theme: TimelineThemeData(
            nodePosition: 0,
            color: theme.colorScheme.primary,
            indicatorTheme: IndicatorThemeData(position: 0, size: 20.w),
            connectorTheme: ConnectorThemeData(
              thickness: 2.w,
              color: theme.dividerColor,
            ),
          ),
          builder: TimelineTileBuilder.connected(
            connectionDirection: ConnectionDirection.after,
            itemCount: conditions.length,
            contentsBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 12.w, bottom: 24.h),
                child: Text(
                  conditions[index],
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: theme.textTheme.bodyMedium?.color,
                  ),
                ),
              );
            },
            indicatorBuilder: (context, index) {
              return DotIndicator(
                color: theme.colorScheme.primary,
                child: Icon(
                  Symbols.check,
                  size: 14.sp,
                  color: theme.colorScheme.onPrimary,
                ),
              );
            },
            connectorBuilder: (context, index, type) {
              return SolidLineConnector(color: theme.dividerColor);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildApplicationForm(BuildContext context) {
    final theme = Theme.of(context);
    return _buildSectionCard(
      context: context,
      title: t.partner.applicationTitle,
      children: [
        _buildTextField(
          context,
          t.partner.nameLabel,
          t.partner.nameInputHint,
          controller: _nameController,
        ),
        SizedBox(height: 12.h),
        _buildTextField(
          context,
          t.partner.companyLabel,
          t.partner.companyInputHint,
          controller: _companyController,
        ),
        SizedBox(height: 12.h),
        _buildTextField(
          context,
          t.partner.phoneLabel,
          t.partner.phoneInputHint,
          controller: _phoneController,
        ),
        SizedBox(height: 12.h),
        _buildTextField(
          context,
          t.partner.intentionLabel,
          t.partner.intentionInputHint,
          maxLines: 3,
          controller: _intentionController,
        ),
        SizedBox(height: 24.h),
        SizedBox(
          width: double.infinity,
          height: 48.h,
          child: ElevatedButton(
            onPressed: _isSubmitting ? null : _submitApplication,
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: _isSubmitting
                ? SizedBox(
                    width: 24.w,
                    height: 24.w,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation(
                        theme.colorScheme.onPrimary,
                      ),
                    ),
                  )
                : Text(
                    t.partner.submit,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(
    BuildContext context,
    String label,
    String hint, {
    int maxLines = 1,
    TextEditingController? controller,
  }) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: theme.textTheme.titleMedium?.color,
          ),
        ),
        SizedBox(height: 8.h),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: theme.hintColor),
            filled: true,
            fillColor: theme.colorScheme.surfaceContainerHighest,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 12.h,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Text(
            t.partner.contactTitle,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: theme.textTheme.titleMedium?.color,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Icon(
                Symbols.phone,
                size: 20.sp,
                color: theme.colorScheme.primary,
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  '${t.partner.serviceHotline}: 400-114-8818',
                  style: TextStyle(color: theme.textTheme.bodyMedium?.color),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Symbols.location_on,
                size: 20.sp,
                color: theme.colorScheme.primary,
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  '${t.partner.address}: 广东省东莞市松山湖园区科汇路1号1栋1510室',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: theme.textTheme.bodyMedium?.color,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard({
    required BuildContext context,
    required String title,
    required List<Widget> children,
  }) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: theme.textTheme.titleMedium?.color,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 4.h, bottom: 16.h),
                width: 32.w,
                height: 3.h,
                color: theme.colorScheme.primary.withValues(alpha: 0.3),
              ),
            ],
          ),
          ...children,
        ],
      ),
    );
  }
}
