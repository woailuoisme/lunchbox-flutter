import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/auth/providers/signin_provider.dart';
import 'package:lunchbox/features/auth/providers/signin_state.dart';
import 'package:lunchbox/features/auth/widgets/signin_footer_links.dart';
import 'package:lunchbox/features/auth/widgets/signin_header.dart';
import 'package:lunchbox/features/auth/widgets/signin_password_form.dart';
import 'package:lunchbox/features/auth/widgets/signin_social_signin.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/routes/routes.dart';
import 'package:toastification/toastification.dart';

class SimpleSignInView extends ConsumerStatefulWidget {
  const SimpleSignInView({super.key});

  @override
  ConsumerState<SimpleSignInView> createState() => _SimpleSignInViewState();
}

class _SimpleSignInViewState extends ConsumerState<SimpleSignInView> {
  final _formKey = GlobalKey<FormBuilderState>();
  ProviderSubscription<SignInState>? _signInSubscription;
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _signInSubscription = ref.listenManual<SignInState>(signInProvider, (
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

    // Ensure sign in type is password for simple view
    Future.microtask(() {
      ref.read(signInProvider.notifier).setSignInType(SignInType.password);
    });
  }

  @override
  void dispose() {
    _signInSubscription?.close();
    super.dispose();
  }

  void _handleSignIn() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      ref.read(signInProvider.notifier).signIn();
    }
  }

  void _togglePasswordVisibility() {
    setState(() => _obscurePassword = !_obscurePassword);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final state = ref.watch(signInProvider);

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
                              SignInHeader(colorScheme: colorScheme),
                              SizedBox(height: 48.h),
                              SignInPasswordForm(
                                colorScheme: colorScheme,
                                username: state.username,
                                password: state.password,
                                obscurePassword: _obscurePassword,
                                onTogglePasswordVisibility:
                                    _togglePasswordVisibility,
                                onUsernameChanged: (value) => ref
                                    .read(signInProvider.notifier)
                                    .usernameChanged(value),
                                onPasswordChanged: (value) => ref
                                    .read(signInProvider.notifier)
                                    .passwordChanged(value),
                                onSubmit: _handleSignIn,
                              ),
                              SizedBox(height: 32.h),
                              SizedBox(
                                height: 56.h,
                                child: FilledButton(
                                  onPressed:
                                      state.status.isInProgress ||
                                          !state.canSubmit
                                      ? null
                                      : _handleSignIn,
                                  style: FilledButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.r),
                                    ),
                                    elevation: 0,
                                  ),
                                  child: state.status.isInProgress
                                      ? CircularProgressIndicator(
                                          color: colorScheme.onPrimary,
                                        )
                                      : Text(
                                          t.auth.loginButton,
                                          style: TextStyle(fontSize: 18.sp),
                                        ),
                                ),
                              ),
                              SizedBox(height: 48.h),
                              SignInSocialSignIn(
                                colorScheme: colorScheme,
                                onGoogleSignIn: () {
                                  // TODO: Implement Google Sign In
                                },
                              ),
                              const Spacer(),
                              SignInFooterLinks(
                                colorScheme: colorScheme,
                                onSignUp: () =>
                                    const SignUpRoute().push<void>(context),
                                onForgotPassword: () =>
                                    const ForgotPasswordRoute().push<void>(
                                      context,
                                    ),
                              ),
                              SizedBox(height: 24.h),
                            ]
                            .animate(interval: 50.ms)
                            .fadeIn(duration: 400.ms, curve: Curves.easeOut)
                            .slideY(begin: 0.1, end: 0, curve: Curves.easeOut),
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
