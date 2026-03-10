import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:lunchbox/features/partner/providers/partner_provider.dart';
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
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isFormValid = false;

  void _onFormChanged() {
    setState(() {
      _isFormValid = _formKey.currentState?.isValid ?? false;
    });
  }

  Future<void> _submitApplication() async {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final values = _formKey.currentState!.value;

      final success = await ref
          .read(partnerProvider.notifier)
          .submitConsult(
            name: values['name'] as String,
            phone: values['phone'] as String,
            company: values['company'] as String,
            message: values['message'] as String,
          );

      if (mounted) {
        if (success) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(t.partner.submitSuccess)));
          _formKey.currentState?.reset();
        } else {
          final state = ref.read(partnerProvider);
          if (state is AsyncError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  t.partner.errorOccurred(error: state.error.toString()),
                ),
              ),
            );
          }
        }
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
          formKey: _formKey,
          onFormChanged: _onFormChanged,
          nameLabel: t.partner.nameLabel,
          nameHint: t.partner.nameInputHint,
          companyLabel: t.partner.companyLabel,
          companyHint: t.partner.companyInputHint,
          phoneLabel: t.partner.phoneLabel,
          phoneHint: t.partner.phoneInputHint,
          intentionLabel: t.partner.intentionLabel,
          intentionHint: t.partner.intentionInputHint,
          submitText: t.partner.submit,
          onSubmit: _isFormValid ? _submitApplication : null,
          isSubmitting: ref.watch(partnerProvider).isLoading,
        ),
      ],
    );
  }
}
