import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:lunchbox/features/partner/repositories/partner_repository.dart';
import 'package:lunchbox/features/partner/widgets/partner_advantage_item.dart';
import 'package:lunchbox/features/partner/widgets/partner_application_form.dart';
import 'package:lunchbox/features/partner/widgets/partner_condition_list.dart';
import 'package:lunchbox/features/partner/widgets/partner_header.dart';
import 'package:lunchbox/features/partner/widgets/partner_process_list.dart';
import 'package:lunchbox/features/partner/widgets/partner_section_card.dart';

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
      await ref
          .read(partnerRepositoryProvider.notifier)
          .submitApplication(
            name: name,
            company: company,
            phone: phone,
            intention: intention,
          );

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
            PartnerHeader(title: t.partner.title, subtitle: t.partner.subtitle),
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

  Widget _buildAdvantages(BuildContext context) {
    return PartnerSectionCard(
      title: t.partner.advantages,
      children: [
        PartnerAdvantageItem(
          icon: Symbols.monetization_on,
          title: t.partner.advantage1Title,
          description: t.partner.advantage1Desc,
        ),
        PartnerAdvantageItem(
          icon: Symbols.security,
          title: t.partner.advantage2Title,
          description: t.partner.advantage2Desc,
        ),
        PartnerAdvantageItem(
          icon: Symbols.trending_up,
          title: t.partner.advantage3Title,
          description: t.partner.advantage3Desc,
        ),
        PartnerAdvantageItem(
          icon: Symbols.school,
          title: t.partner.advantage4Title,
          description: t.partner.advantage4Desc,
        ),
      ],
    );
  }

  Widget _buildProcess(BuildContext context) {
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

    return PartnerSectionCard(
      title: t.partner.process,
      children: [PartnerProcessList(processes: processes)],
    );
  }

  Widget _buildConditions(BuildContext context) {
    final conditions = [
      t.partner.condition1,
      t.partner.condition2,
      t.partner.condition3,
      t.partner.condition4,
      t.partner.condition5,
    ];

    return PartnerSectionCard(
      title: t.partner.conditions,
      children: [PartnerConditionList(conditions: conditions)],
    );
  }

  Widget _buildApplicationForm(BuildContext context) {
    return PartnerSectionCard(
      title: t.partner.applicationTitle,
      children: [
        PartnerApplicationForm(
          nameLabel: t.partner.nameLabel,
          nameHint: t.partner.nameInputHint,
          companyLabel: t.partner.companyLabel,
          companyHint: t.partner.companyInputHint,
          phoneLabel: t.partner.phoneLabel,
          phoneHint: t.partner.phoneInputHint,
          intentionLabel: t.partner.intentionLabel,
          intentionHint: t.partner.intentionInputHint,
          submitText: t.partner.submit,
          nameController: _nameController,
          companyController: _companyController,
          phoneController: _phoneController,
          intentionController: _intentionController,
          onSubmit: _submitApplication,
          isSubmitting: _isSubmitting,
        ),
      ],
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return PartnerSectionCard(
      title: t.partner.contactTitle,
      children: [
        _buildContactTile(
          context,
          Symbols.phone,
          t.partner.serviceHotline,
          '400-114-8818',
        ),
        _buildContactTile(
          context,
          Symbols.location_on,
          t.partner.address,
          '广东省东莞市松山湖园区科汇路1号1栋1510室',
        ),
      ],
    );
  }

  Widget _buildContactTile(
    BuildContext context,
    IconData icon,
    String label,
    String content,
  ) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          Icon(icon, size: 20.sp, color: theme.colorScheme.primary),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              '$label: $content',
              style: TextStyle(color: theme.textTheme.bodyMedium?.color),
            ),
          ),
        ],
      ),
    );
  }
}
