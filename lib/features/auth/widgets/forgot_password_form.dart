import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({
    super.key,
    required this.colorScheme,
    required this.onSubmit,
  });

  final ColorScheme colorScheme;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: 'email',
      style: TextStyle(
        fontSize: 16.sp,
        color: colorScheme.onSurface,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        labelText: t.common.username,
        labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
        hintText: t.auth.usernameOrEmail,
        hintStyle: TextStyle(color: colorScheme.outline),
        prefixIcon: Icon(Symbols.person, color: colorScheme.primary),
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
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
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: colorScheme.error, width: 1.5),
        ),
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: t.auth.required),
      ]),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
      onSubmitted: (_) => onSubmit(),
    );
  }
}
