import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 合作伙伴申请表单组件
/// 包含所有输入字段和提交按钮
class PartnerApplicationForm extends StatelessWidget {
  const PartnerApplicationForm({
    required this.nameLabel,
    required this.nameHint,
    required this.companyLabel,
    required this.companyHint,
    required this.phoneLabel,
    required this.phoneHint,
    required this.intentionLabel,
    required this.intentionHint,
    required this.submitText,
    required this.nameController,
    required this.companyController,
    required this.phoneController,
    required this.intentionController,
    required this.onSubmit,
    this.isSubmitting = false,
    super.key,
  });

  final String nameLabel;
  final String nameHint;
  final String companyLabel;
  final String companyHint;
  final String phoneLabel;
  final String phoneHint;
  final String intentionLabel;
  final String intentionHint;
  final String submitText;
  final TextEditingController nameController;
  final TextEditingController companyController;
  final TextEditingController phoneController;
  final TextEditingController intentionController;
  final VoidCallback onSubmit;
  final bool isSubmitting;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        _buildTextField(
          context,
          nameLabel,
          nameHint,
          controller: nameController,
        ),
        SizedBox(height: 12.h),
        _buildTextField(
          context,
          companyLabel,
          companyHint,
          controller: companyController,
        ),
        SizedBox(height: 12.h),
        _buildTextField(
          context,
          phoneLabel,
          phoneHint,
          controller: phoneController,
        ),
        SizedBox(height: 12.h),
        _buildTextField(
          context,
          intentionLabel,
          intentionHint,
          maxLines: 3,
          controller: intentionController,
        ),
        SizedBox(height: 24.h),
        SizedBox(
          width: double.infinity,
          height: 48.h,
          child: ElevatedButton(
            onPressed: isSubmitting ? null : onSubmit,
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
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
}
