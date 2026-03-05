import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lunchbox/features/auth/widgets/auth_input_decoration.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({
    super.key,
    required this.colorScheme,
    required this.onSubmit,
    required this.onIdentifierChanged,
    required this.onOldPasswordChanged,
    required this.onNewPasswordChanged,
    required this.onConfirmPasswordChanged,
  });

  final ColorScheme colorScheme;
  final VoidCallback onSubmit;
  final ValueChanged<String> onIdentifierChanged;
  final ValueChanged<String> onOldPasswordChanged;
  final ValueChanged<String> onNewPasswordChanged;
  final ValueChanged<String> onConfirmPasswordChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormBuilderTextField(
          name: 'identifier',
          style: TextStyle(
            fontSize: 16.sp,
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w500,
          ),
          decoration: AuthInputDecoration.build(
            colorScheme: colorScheme,
            label: t.auth.email,
            hint: t.auth.enterEmail,
            prefixIcon: Symbols.mail,
          ),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(errorText: t.auth.required),
            FormBuilderValidators.email(errorText: t.auth.emailInvalid),
          ]),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onChanged: (value) => onIdentifierChanged(value ?? ''),
        ),
        SizedBox(height: 16.h),
        FormBuilderTextField(
          name: 'old_password',
          obscureText: true,
          style: TextStyle(
            fontSize: 16.sp,
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w500,
          ),
          decoration: AuthInputDecoration.build(
            colorScheme: colorScheme,
            label: t.auth.oldPassword,
            hint: t.auth.enterOldPassword,
            prefixIcon: Symbols.lock_open,
          ),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(errorText: t.auth.required),
          ]),
          textInputAction: TextInputAction.next,
          onChanged: (value) => onOldPasswordChanged(value ?? ''),
        ),
        SizedBox(height: 16.h),
        FormBuilderTextField(
          name: 'new_password',
          obscureText: true,
          style: TextStyle(
            fontSize: 16.sp,
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w500,
          ),
          decoration: AuthInputDecoration.build(
            colorScheme: colorScheme,
            label: t.auth.newPassword,
            hint: t.auth.enterNewPassword,
            prefixIcon: Symbols.lock,
          ),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(errorText: t.auth.required),
            FormBuilderValidators.minLength(
              6,
              errorText: t.auth.passwordMinLength(length: 6),
            ),
          ]),
          textInputAction: TextInputAction.next,
          onChanged: (value) => onNewPasswordChanged(value ?? ''),
        ),
        SizedBox(height: 16.h),
        FormBuilderTextField(
          name: 'confirm_password',
          obscureText: true,
          style: TextStyle(
            fontSize: 16.sp,
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w500,
          ),
          decoration: AuthInputDecoration.build(
            colorScheme: colorScheme,
            label: t.auth.confirmPassword,
            hint: t.auth.enterConfirmPassword,
            prefixIcon: Symbols.lock,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return t.auth.required;
            }
            // We'll handle the match check in the provider/view or use a controller
            return null;
          },
          textInputAction: TextInputAction.done,
          onChanged: (value) => onConfirmPasswordChanged(value ?? ''),
          onSubmitted: (_) => onSubmit(),
        ),
      ],
    );
  }
}
