import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lunchbox/features/auth/widgets/auth_input_decoration.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';

class SignInPasswordForm extends StatelessWidget {
  const SignInPasswordForm({
    super.key,
    required this.colorScheme,
    required this.username,
    required this.password,
    required this.obscurePassword,
    required this.onUsernameChanged,
    required this.onPasswordChanged,
    required this.onTogglePasswordVisibility,
    required this.onSubmit,
  });

  final ColorScheme colorScheme;
  final String username;
  final String password;
  final bool obscurePassword;
  final ValueChanged<String> onUsernameChanged;
  final ValueChanged<String> onPasswordChanged;
  final VoidCallback onTogglePasswordVisibility;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8.h),
        FormBuilderTextField(
          name: 'username',
          initialValue: username,
          onChanged: (value) => onUsernameChanged(value ?? ''),
          style: TextStyle(
            fontSize: 16.sp,
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w500,
          ),
          decoration: AuthInputDecoration.build(
            colorScheme: colorScheme,
            label: t.common.username,
            hint: t.auth.enterUsernameHint,
            prefixIcon: Symbols.person,
          ),
          validator: FormBuilderValidators.required(errorText: t.auth.required),
          textInputAction: TextInputAction.next,
        ),
        SizedBox(height: 16.h),
        FormBuilderTextField(
          name: 'password',
          initialValue: password,
          onChanged: (value) => onPasswordChanged(value ?? ''),
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
          validator: FormBuilderValidators.required(errorText: t.auth.required),
          textInputAction: TextInputAction.done,
          onSubmitted: (_) => onSubmit(),
        ),
      ],
    );
  }
}
