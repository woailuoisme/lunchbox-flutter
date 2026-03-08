import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/auth/providers/forgot_password_provider.dart';
import 'package:lunchbox/features/auth/providers/forgot_password_state.dart';
import 'package:lunchbox/features/auth/widgets/forgot_password_button.dart';
import 'package:lunchbox/features/auth/widgets/forgot_password_form.dart';
import 'package:lunchbox/features/auth/widgets/forgot_password_header.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:toastification/toastification.dart';

class ForgotPasswordView extends ConsumerStatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  ConsumerState<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends ConsumerState<ForgotPasswordView> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
    // Reset status when entering the view
    Future.microtask(() {
      ref.read(forgotPasswordProvider.notifier).resetStatus();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// 处理重置密码逻辑
  Future<void> _handleResetPassword() async {
    if (!(_formKey.currentState?.saveAndValidate() ?? false)) {
      return;
    }

    await ref.read(forgotPasswordProvider.notifier).resetPassword();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final state = ref.watch(forgotPasswordProvider);

    // Listen for state changes
    ref.listen(forgotPasswordProvider, (previous, next) {
      // Handle success
      if (next.isSuccess && !(previous?.isSuccess ?? false)) {
        toastification.show(
          context: context,
          type: ToastificationType.success,
          style: ToastificationStyle.fillColored,
          title: Text(t.auth.resetPasswordSuccess),
          alignment: Alignment.topCenter,
          autoCloseDuration: const Duration(seconds: 3),
        );
        Navigator.of(context).pop();
      }

      // Handle errors
      if (next.isFailure && next.errorMessage != null) {
        toastification.show(
          context: context,
          type: ToastificationType.error,
          style: ToastificationStyle.fillColored,
          title: Text(t.auth.resetPasswordFailed),
          description: Text(next.errorMessage!),
          alignment: Alignment.topCenter,
        );
      }
    });

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 24.h),
                ForgotPasswordHeader(colorScheme: colorScheme),
                SizedBox(height: 32.h),
                ForgotPasswordForm(
                  colorScheme: colorScheme,
                  onIdentifierChanged: (val) => ref
                      .read(forgotPasswordProvider.notifier)
                      .identifierChanged(val),
                  onOldPasswordChanged: (val) => ref
                      .read(forgotPasswordProvider.notifier)
                      .oldPasswordChanged(val),
                  onNewPasswordChanged: (val) => ref
                      .read(forgotPasswordProvider.notifier)
                      .newPasswordChanged(val),
                  onConfirmPasswordChanged: (val) => ref
                      .read(forgotPasswordProvider.notifier)
                      .confirmPasswordChanged(val),
                  onSubmit: _handleResetPassword,
                ),
                SizedBox(height: 40.h),
                ForgotPasswordButton(
                  colorScheme: colorScheme,
                  isLoading: state.status.isInProgress,
                  onPressed: _handleResetPassword,
                ),
              ],
            ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.1, end: 0),
          ),
        ),
      ),
    );
  }
}
