import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/auth/providers/login_provider.dart';
import 'package:lunchbox/features/auth/providers/login_state.dart';
import 'package:lunchbox/features/auth/widgets/login_footer_links.dart';
import 'package:lunchbox/features/auth/widgets/login_header.dart';
import 'package:lunchbox/features/auth/widgets/login_password_form.dart';
import 'package:lunchbox/features/auth/widgets/login_social_login.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/routes/routes.dart';
import 'package:toastification/toastification.dart';

class SimpleLoginView extends ConsumerStatefulWidget {
  const SimpleLoginView({super.key});

  @override
  ConsumerState<SimpleLoginView> createState() => _SimpleLoginViewState();
}

class _SimpleLoginViewState extends ConsumerState<SimpleLoginView> {
  final _formKey = GlobalKey<FormBuilderState>();
  ProviderSubscription<LoginState>? _loginSubscription;
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _loginSubscription = ref.listenManual<LoginState>(loginProvider, (
      previous,
      next,
    ) {
      if (previous?.status == next.status) {
        return;
      }
      if (next.status.isFailure) {
        toastification.show(
          context: context,
          type: ToastificationType.error,
          style: ToastificationStyle.fillColored,
          title: Text(t.auth.loginFailed),
          description: Text(next.errorMessage ?? t.common.error),
          alignment: Alignment.topCenter,
          autoCloseDuration: const Duration(seconds: 3),
        );
      }
    });

    // Ensure login type is password for simple view
    Future.microtask(() {
      ref.read(loginProvider.notifier).setLoginType(LoginType.password);
    });
  }

  @override
  void dispose() {
    _loginSubscription?.close();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      ref.read(loginProvider.notifier).login();
    }
  }

  void _togglePasswordVisibility() {
    setState(() => _obscurePassword = !_obscurePassword);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final state = ref.watch(loginProvider);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: FormBuilder(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children:
                        [
                              SizedBox(height: 48.h),
                              LoginHeader(colorScheme: colorScheme),
                              SizedBox(height: 48.h),
                              LoginPasswordForm(
                                colorScheme: colorScheme,
                                username: state.username,
                                password: state.password,
                                obscurePassword: _obscurePassword,
                                onUsernameChanged: (value) => ref
                                    .read(loginProvider.notifier)
                                    .usernameChanged(value),
                                onPasswordChanged: (value) => ref
                                    .read(loginProvider.notifier)
                                    .passwordChanged(value),
                                onTogglePasswordVisibility:
                                    _togglePasswordVisibility,
                                onSubmit: _handleLogin,
                              ),
                              SizedBox(height: 32.h),
                              _LoginButton(
                                colorScheme: colorScheme,
                                isLoading: state.status.isInProgress,
                                isEnabled: state.canSubmit,
                                onLogin: _handleLogin,
                              ),
                              SizedBox(height: 16.h),
                              LoginFooterLinks(
                                colorScheme: colorScheme,
                                onRegister: () =>
                                    const RegisterRoute().push<void>(context),
                                onForgotPassword: () =>
                                    const ForgotPasswordRoute().push<void>(
                                      context,
                                    ),
                              ),
                              SizedBox(height: 32.h),
                              LoginSocialLogin(
                                colorScheme: colorScheme,
                                onGoogleLogin: () => ref
                                    .read(loginProvider.notifier)
                                    .loginWithGoogle(),
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
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    required this.colorScheme,
    required this.isLoading,
    required this.isEnabled,
    required this.onLogin,
  });

  final ColorScheme colorScheme;
  final bool isLoading;
  final bool isEnabled;
  final VoidCallback onLogin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      child: FilledButton(
        onPressed: isLoading || !isEnabled ? null : onLogin,
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
