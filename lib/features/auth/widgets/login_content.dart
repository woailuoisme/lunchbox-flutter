import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/auth/providers/login_state.dart';
import 'package:lunchbox/features/auth/widgets/login_footer_links.dart';
import 'package:lunchbox/features/auth/widgets/login_header.dart';
import 'package:lunchbox/features/auth/widgets/login_password_form.dart';
import 'package:lunchbox/features/auth/widgets/login_phone_form.dart';
import 'package:lunchbox/features/auth/widgets/login_social_login.dart';
import 'package:lunchbox/features/auth/widgets/login_type_selector.dart';
import 'package:lunchbox/i18n/translations.g.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({
    super.key,
    required this.formKey,
    required this.colorScheme,
    required this.state,
    required this.tabController,
    required this.obscurePassword,
    required this.onTogglePasswordVisibility,
    required this.onLogin,
    required this.onTabTap,
    required this.onUsernameChanged,
    required this.onPasswordChanged,
    required this.onPhoneChanged,
    required this.onCodeChanged,
    required this.onSendCode,
    required this.onRegister,
    required this.onForgotPassword,
    required this.onGoogleLogin,
  });

  final GlobalKey<FormBuilderState> formKey;
  final ColorScheme colorScheme;
  final LoginState state;
  final TabController tabController;
  final bool obscurePassword;
  final VoidCallback onTogglePasswordVisibility;
  final VoidCallback onLogin;
  final ValueChanged<int> onTabTap;
  final ValueChanged<String> onUsernameChanged;
  final ValueChanged<String> onPasswordChanged;
  final ValueChanged<String> onPhoneChanged;
  final ValueChanged<String> onCodeChanged;
  final VoidCallback onSendCode;
  final VoidCallback onRegister;
  final VoidCallback onForgotPassword;
  final VoidCallback onGoogleLogin;

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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children:
                      [
                            SizedBox(height: 48.h),
                            LoginHeader(colorScheme: colorScheme),
                            SizedBox(height: 48.h),
                            LoginTypeSelector(
                              colorScheme: colorScheme,
                              tabController: tabController,
                              loginType: state.loginType,
                              onTabTap: onTabTap,
                            ),
                            SizedBox(height: 32.h),
                            AnimatedSize(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeOut,
                              child: SizedBox(
                                height: 260.h,
                                child: TabBarView(
                                  controller: tabController,
                                  physics: const BouncingScrollPhysics(),
                                  children: [
                                    LoginPasswordForm(
                                      colorScheme: colorScheme,
                                      username: state.username,
                                      password: state.password,
                                      obscurePassword: obscurePassword,
                                      onUsernameChanged: onUsernameChanged,
                                      onPasswordChanged: onPasswordChanged,
                                      onTogglePasswordVisibility:
                                          onTogglePasswordVisibility,
                                      onSubmit: onLogin,
                                    ),
                                    LoginPhoneForm(
                                      colorScheme: colorScheme,
                                      countdown: state.countdown,
                                      onPhoneChanged: onPhoneChanged,
                                      onCodeChanged: onCodeChanged,
                                      onSendCode: onSendCode,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 32.h),
                            _LoginButton(
                              colorScheme: colorScheme,
                              isLoading: state.status.isInProgress,
                              onLogin: onLogin,
                            ),
                            SizedBox(height: 16.h),
                            LoginFooterLinks(
                              colorScheme: colorScheme,
                              onRegister: onRegister,
                              onForgotPassword: onForgotPassword,
                            ),
                            SizedBox(height: 32.h),
                            LoginSocialLogin(
                              colorScheme: colorScheme,
                              onGoogleLogin: onGoogleLogin,
                            ),
                            SizedBox(height: 24.h),
                          ]
                          .animate(interval: 50.ms)
                          .fadeIn(duration: 400.ms)
                          .slideY(
                            begin: 0.1,
                            end: 0,
                            curve: Curves.easeOutQuad,
                          ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    required this.colorScheme,
    required this.isLoading,
    required this.onLogin,
  });

  final ColorScheme colorScheme;
  final bool isLoading;
  final VoidCallback onLogin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      child: FilledButton(
        onPressed: isLoading ? null : onLogin,
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
