import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/auth/providers/auth_provider.dart';
import 'package:lunchbox/features/auth/widgets/signup_button.dart';
import 'package:lunchbox/features/auth/widgets/signup_form.dart';
import 'package:lunchbox/features/auth/widgets/signup_header.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:toastification/toastification.dart';

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({super.key});

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isLoading = false;
  bool _obscurePassword = true;

  void _togglePasswordVisibility() {
    setState(() => _obscurePassword = !_obscurePassword);
  }

  /// Handles the sign-up logic
  Future<void> _handleSignUp() async {
    if (!(_formKey.currentState?.saveAndValidate() ?? false)) {
      return;
    }

    final values = _formKey.currentState!.value;
    final username = values['username'] as String;
    final password = values['password'] as String;
    final nickname = values['nickname'] as String;

    setState(() => _isLoading = true);

    try {
      await ref
          .read(authProvider.notifier)
          .register(username.trim(), password, nickname.trim());
      if (mounted) {
        toastification.show(
          context: context,
          type: ToastificationType.success,
          style: ToastificationStyle.fillColored,
          title: Text(t.auth.registerSuccess),
          alignment: Alignment.topCenter,
          autoCloseDuration: const Duration(seconds: 2),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        toastification.show(
          context: context,
          type: ToastificationType.error,
          style: ToastificationStyle.fillColored,
          title: Text(t.auth.registerFailed),
          description: Text(e.toString()),
          alignment: Alignment.topCenter,
          autoCloseDuration: const Duration(seconds: 3),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text(t.auth.registerTitle),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: colorScheme.onSurface,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: FormBuilder(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children:
                          [
                                SizedBox(height: 24.h),
                                SignUpHeader(colorScheme: colorScheme),
                                SizedBox(height: 48.h),
                                SignUpForm(
                                  colorScheme: colorScheme,
                                  obscurePassword: _obscurePassword,
                                  onTogglePasswordVisibility:
                                      _togglePasswordVisibility,
                                  onSubmit: _handleSignUp,
                                ),
                                SizedBox(height: 32.h),
                                SignUpButton(
                                  colorScheme: colorScheme,
                                  isLoading: _isLoading,
                                  onPressed: _handleSignUp,
                                ),
                                SizedBox(height: 24.h),
                              ]
                              .animate(interval: 50.ms)
                              .fadeIn(duration: 400.ms, curve: Curves.easeOut)
                              .slideY(
                                begin: 0.1,
                                end: 0,
                                curve: Curves.easeOut,
                              ),
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
