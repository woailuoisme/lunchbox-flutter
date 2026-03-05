import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lunchbox/features/auth/providers/forgot_password_provider.dart';
import 'package:lunchbox/features/auth/providers/forgot_password_state.dart';
import 'package:lunchbox/features/auth/widgets/auth_input_decoration.dart';
import 'package:lunchbox/features/auth/widgets/reset_password_header.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:toastification/toastification.dart';

class ResetPasswordView extends ConsumerStatefulWidget {
  const ResetPasswordView({super.key});

  @override
  ConsumerState<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends ConsumerState<ResetPasswordView> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  Future<void> _handleResetPassword() async {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      await ref.read(forgotPasswordProvider.notifier).resetPassword();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final state = ref.watch(forgotPasswordProvider);

    ref.listen(forgotPasswordProvider, (previous, next) {
      if (next.status.isSuccess) {
        toastification.show(
          context: context,
          type: ToastificationType.success,
          style: ToastificationStyle.fillColored,
          title: Text(t.auth.loginSuccess), // Or password reset success
          alignment: Alignment.topCenter,
          autoCloseDuration: const Duration(seconds: 3),
        );
        // Navigate back to login
        Navigator.of(context).popUntil((route) => route.isFirst);
      }

      if (next.status.isFailure && next.errorMessage != null) {
        toastification.show(
          context: context,
          type: ToastificationType.error,
          style: ToastificationStyle.fillColored,
          title: Text(t.common.error),
          description: Text(next.errorMessage!),
          alignment: Alignment.topCenter,
        );
      }
    });

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text(t.auth.forgotPasswordTitle),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 32.h),
                ResetPasswordHeader(colorScheme: colorScheme),
                SizedBox(height: 40.h),
                FormBuilderTextField(
                  name: 'newPassword',
                  obscureText: _obscureNewPassword,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: AuthInputDecoration.build(
                    colorScheme: colorScheme,
                    label: t.auth.enterPassword,
                    hint: t.auth.enterPassword,
                    prefixIcon: Symbols.lock,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureNewPassword
                            ? Symbols.visibility
                            : Symbols.visibility_off,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      onPressed: () => setState(
                        () => _obscureNewPassword = !_obscureNewPassword,
                      ),
                    ),
                  ),
                  onChanged: (value) => ref
                      .read(forgotPasswordProvider.notifier)
                      .newPasswordChanged(value ?? ''),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(errorText: t.auth.required),
                    FormBuilderValidators.minLength(
                      8,
                      errorText: t.auth.passwordMinLength(length: 8),
                    ),
                  ]),
                ),
                SizedBox(height: 16.h),
                FormBuilderTextField(
                  name: 'confirmPassword',
                  obscureText: _obscureConfirmPassword,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: AuthInputDecoration.build(
                    colorScheme: colorScheme,
                    label: t.auth.enterPassword, // confirm password label
                    hint: t.auth.enterPassword,
                    prefixIcon: Symbols.lock_reset,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirmPassword
                            ? Symbols.visibility
                            : Symbols.visibility_off,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      onPressed: () => setState(
                        () =>
                            _obscureConfirmPassword = !_obscureConfirmPassword,
                      ),
                    ),
                  ),
                  onChanged: (value) => ref
                      .read(forgotPasswordProvider.notifier)
                      .confirmPasswordChanged(value ?? ''),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(errorText: t.auth.required),
                    (value) {
                      if (value !=
                          _formKey.currentState?.fields['newPassword']?.value) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ]),
                ),
                SizedBox(height: 32.h),
                SizedBox(
                  height: 56.h,
                  child: FilledButton(
                    onPressed: state.status.isInProgress
                        ? null
                        : _handleResetPassword,
                    style: FilledButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                    child: state.status.isInProgress
                        ? CircularProgressIndicator(
                            color: colorScheme.onPrimary,
                          )
                        : Text(
                            t.common.confirm,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ],
            ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.1, end: 0),
          ),
        ),
      ),
    );
  }
}
