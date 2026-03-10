import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

/// 合作伙伴申请表单组件
/// 使用 FormBuilder 构建，包含校验逻辑
class PartnerApplicationForm extends StatelessWidget {
  const PartnerApplicationForm({
    required this.formKey,
    required this.onFormChanged,
    required this.nameLabel,
    required this.nameHint,
    required this.companyLabel,
    required this.companyHint,
    required this.phoneLabel,
    required this.phoneHint,
    required this.intentionLabel,
    required this.intentionHint,
    required this.submitText,
    required this.onSubmit,
    this.isSubmitting = false,
    super.key,
  });

  final GlobalKey<FormBuilderState> formKey;
  final VoidCallback onFormChanged;
  final String nameLabel;
  final String nameHint;
  final String companyLabel;
  final String companyHint;
  final String phoneLabel;
  final String phoneHint;
  final String intentionLabel;
  final String intentionHint;
  final String submitText;
  final VoidCallback? onSubmit;
  final bool isSubmitting;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FormBuilder(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onFormChanged,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLabel(context, nameLabel),
          FormBuilderTextField(
            name: 'name',
            decoration: _getInputDecoration(context, nameHint),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.minLength(2),
            ]),
          ),
          SizedBox(height: 16.h),
          _buildLabel(context, companyLabel),
          FormBuilderTextField(
            name: 'company',
            decoration: _getInputDecoration(context, companyHint),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
            ]),
          ),
          SizedBox(height: 16.h),
          _buildLabel(context, phoneLabel),
          FormBuilderTextField(
            name: 'phone',
            keyboardType: TextInputType.phone,
            decoration: _getInputDecoration(context, phoneHint),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.numeric(),
              FormBuilderValidators.minLength(11),
              FormBuilderValidators.maxLength(11),
            ]),
          ),
          SizedBox(height: 16.h),
          _buildLabel(context, intentionLabel),
          FormBuilderTextField(
            name: 'message',
            maxLines: 4,
            decoration: _getInputDecoration(context, intentionHint),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.minLength(5),
            ]),
          ),
          SizedBox(height: 32.h),
          SizedBox(
            width: double.infinity,
            height: 52.h,
            child: ElevatedButton(
              onPressed: isSubmitting ? null : onSubmit,
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: isSubmitting
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
                      submitText,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(BuildContext context, String label) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }

  InputDecoration _getInputDecoration(BuildContext context, String hint) {
    final theme = Theme.of(context);
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
        fontSize: 14.sp,
        color: theme.colorScheme.outline.withValues(alpha: 0.6),
      ),
      filled: true,
      fillColor: theme.colorScheme.surfaceContainerHighest.withValues(
        alpha: 0.3,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: theme.colorScheme.primary, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: theme.colorScheme.error, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: theme.colorScheme.error, width: 1.5),
      ),
      errorStyle: TextStyle(fontSize: 12.sp),
    );
  }
}
