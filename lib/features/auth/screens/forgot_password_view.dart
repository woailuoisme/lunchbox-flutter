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
import 'package:lunchbox/routes/routes.dart';
import 'package:toastification/toastification.dart';

class ForgotPasswordView extends ConsumerStatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  ConsumerState<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends ConsumerState<ForgotPasswordView> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    // Reset status when entering the view
    Future.microtask(() {
      ref.read(forgotPasswordProvider.notifier).resetStatus();
    });
  }

  /// 处理发送重置链接逻辑
  Future<void> _handleResetPassword() async {
    if (!(_formKey.currentState?.saveAndValidate() ?? false)) {
      return;
    }

    await ref.read(forgotPasswordProvider.notifier).sendOtp();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final state = ref.watch(forgotPasswordProvider);

    // Listen for success state to navigate to OTP Verification
    ref.listen(forgotPasswordProvider, (previous, next) {
      if (next.isOtpSent && !(previous?.isOtpSent ?? false)) {
        toastification.show(
          context: context,
          type: ToastificationType.success,
          style: ToastificationStyle.fillColored,
          title: Text(t.auth.resetLinkSent),
          alignment: Alignment.topCenter,
          autoCloseDuration: const Duration(seconds: 3),
        );
        // Navigate to OTP verification
        const OTPVerificationRoute().push<void>(context);
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
                                SizedBox(height: 16.h),
                                ForgotPasswordHeader(colorScheme: colorScheme),
                                SizedBox(height: 40.h),
                                ForgotPasswordForm(
                                  colorScheme: colorScheme,
                                  onChanged: (value) => ref
                                      .read(forgotPasswordProvider.notifier)
                                      .identifierChanged(value),
                                  onSubmit: _handleResetPassword,
                                ),
                                SizedBox(height: 32.h),
                                ForgotPasswordButton(
                                  colorScheme: colorScheme,
                                  isLoading: state.status.isInProgress,
                                  onPressed: _handleResetPassword,
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
              ),
            );
          },
        ),
      ),
    );
  }
}
