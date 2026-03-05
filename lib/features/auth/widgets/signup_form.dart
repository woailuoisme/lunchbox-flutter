import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lunchbox/features/auth/widgets/auth_input_decoration.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.colorScheme,
    required this.obscurePassword,
    required this.onTogglePasswordVisibility,
    required this.onSubmit,
  });

  final ColorScheme colorScheme;
  final bool obscurePassword;
  final VoidCallback onTogglePasswordVisibility;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormBuilderTextField(
          name: 'email',
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
          textInputAction: TextInputAction.next,
        ),
        SizedBox(height: 16.h),
        FormBuilderTextField(
          name: 'password',
          obscureText: obscurePassword,
          style: TextStyle(
            fontSize: 16.sp,
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w500,
          ),
          decoration: AuthInputDecoration.build(
            colorScheme: colorScheme,
            label: t.common.password,
            hint: t.auth.enterPassword,
            prefixIcon: Symbols.lock,
            suffixIcon: IconButton(
              icon: Icon(
                obscurePassword ? Symbols.visibility : Symbols.visibility_off,
                color: colorScheme.onSurfaceVariant,
              ),
              onPressed: onTogglePasswordVisibility,
            ),
          ),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(errorText: t.auth.required),
            FormBuilderValidators.minLength(
              6,
              errorText: t.auth.passwordMinLength(length: 6),
            ),
          ]),
          textInputAction: TextInputAction.next,
        ),
        SizedBox(height: 16.h),
        FormBuilderTextField(
          name: 'password_confirmation',
          obscureText: obscurePassword,
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
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(errorText: t.auth.required),
          ]),
          textInputAction: TextInputAction.done,
          onSubmitted: (_) => onSubmit(),
        ),
      ],
    );
  }
}
