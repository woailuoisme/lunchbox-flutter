import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/auth/providers/signin_state.dart';
import 'package:lunchbox/features/auth/widgets/signin_footer_links.dart';
import 'package:lunchbox/features/auth/widgets/signin_header.dart';
import 'package:lunchbox/features/auth/widgets/signin_password_form.dart';
import 'package:lunchbox/features/auth/widgets/signin_social_signin.dart';
import 'package:lunchbox/i18n/translations.g.dart';

class SignInContent extends StatelessWidget {
  const SignInContent({
    super.key,
    required this.formKey,
    required this.colorScheme,
    required this.state,
    required this.tabController,
    required this.obscurePassword,
    required this.onTogglePasswordVisibility,
    required this.onSignIn,
    required this.onTabTap,
    required this.onUsernameChanged,
    required this.onPasswordChanged,
    required this.onPhoneChanged,
    required this.onCodeChanged,
    required this.onSendCode,
    required this.canSendCode,
    required this.canSubmit,
    required this.onSignUp,
    required this.onForgotPassword,
    required this.onGoogleSignIn,
  });

  final GlobalKey<FormBuilderState> formKey;
  final ColorScheme colorScheme;
  final SignInState state;
  final TabController tabController;
  final bool obscurePassword;
  final VoidCallback onTogglePasswordVisibility;
  final VoidCallback onSignIn;
  final ValueChanged<int> onTabTap;
  final ValueChanged<String> onUsernameChanged;
  final ValueChanged<String> onPasswordChanged;
  final ValueChanged<String> onPhoneChanged;
  final ValueChanged<String> onCodeChanged;
  final VoidCallback onSendCode;
  final bool canSendCode;
  final bool canSubmit;
  final VoidCallback onSignUp;
  final VoidCallback onForgotPassword;
  final VoidCallback onGoogleSignIn;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: FormBuilder(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children:
                      [
                            SizedBox(height: 48.h),
                            SignInHeader(colorScheme: colorScheme),
                            SizedBox(height: 48.h),
                            SignInPasswordForm(
                              colorScheme: colorScheme,
                              username: state.username,
                              password: state.password,
                              obscurePassword: obscurePassword,
                              onUsernameChanged: onUsernameChanged,
                              onPasswordChanged: onPasswordChanged,
                              onTogglePasswordVisibility:
                                  onTogglePasswordVisibility,
                              onSubmit: onSignIn,
                            ),
                            SizedBox(height: 32.h),
                            SizedBox(
                              height: 56.h,
                              child: FilledButton(
                                onPressed: canSubmit ? onSignIn : null,
                                style: FilledButton.styleFrom(
                                  backgroundColor: colorScheme.primary,
                                  foregroundColor: colorScheme.onPrimary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  elevation: 0,
                                ),
                                child: state.status.isInProgress
                                    ? SizedBox(
                                        width: 24.w,
                                        height: 24.w,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: colorScheme.onPrimary,
                                        ),
                                      )
                                    : Text(
                                        t.auth.loginButton,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                              ),
                            ),
                            SizedBox(height: 24.h),
                            SignInFooterLinks(
                              colorScheme: colorScheme,
                              onSignUp: onSignUp,
                              onForgotPassword: onForgotPassword,
                            ),
                            SizedBox(height: 48.h),
                            SignInSocialSignIn(
                              colorScheme: colorScheme,
                              onGoogleSignIn: onGoogleSignIn,
                            ),
                            SizedBox(height: 24.h),
                          ]
                          .animate(interval: 50.ms)
                          .fadeIn(duration: 400.ms)
                          .slideY(begin: 0.1, end: 0),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton({
    required this.colorScheme,
    required this.isLoading,
    required this.isEnabled,
    required this.onSignIn,
  });

  final ColorScheme colorScheme;
  final bool isLoading;
  final bool isEnabled;
  final VoidCallback onSignIn;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      child: FilledButton(
        onPressed: isLoading || !isEnabled ? null : onSignIn,
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          elevation: 0,
        ),
        child: isLoading
            ? SizedBox(
                width: 24.w,
                height: 24.w,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: colorScheme.onPrimary,
                ),
              )
            : Text(
                t.auth.loginButton,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
