import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/auth/providers/forgot_password_provider.dart';
import 'package:lunchbox/features/auth/providers/forgot_password_state.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/routes/routes.dart';
import 'package:pinput/pinput.dart';
import 'package:toastification/toastification.dart';

class OTPVerificationView extends ConsumerWidget {
  const OTPVerificationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final state = ref.watch(forgotPasswordProvider);

    // Listen for state changes
    ref.listen(forgotPasswordProvider, (previous, next) {
      // If OTP is verified, navigate to ResetPasswordView
      if (next.isOtpVerified && !previous!.isOtpVerified) {
        const ResetPasswordRoute().push<void>(context);
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

    final defaultPinTheme = PinTheme(
      width: 56.w,
      height: 56.h,
      textStyle: theme.textTheme.headlineSmall?.copyWith(
        color: colorScheme.onSurface,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.transparent),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: colorScheme.primary, width: 2),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: colorScheme.primaryContainer.withValues(alpha: 0.3),
      ),
    );

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text(t.auth.codeLoginTab), // OTP Verification Title
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: colorScheme.onSurface,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 48.h),
              Text(
                t.auth.codeLoginTab,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12.h),
              Text(
                '${t.auth.codeLoginTab} ${state.identifier}', // Replace with proper translation
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 48.h),
              Pinput(
                length: 6,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                autofocus: true,
                onChanged: (value) =>
                    ref.read(forgotPasswordProvider.notifier).otpChanged(value),
                onCompleted: (pin) =>
                    ref.read(forgotPasswordProvider.notifier).verifyOtp(),
              ),
              SizedBox(height: 48.h),
              SizedBox(
                height: 56.h,
                child: FilledButton(
                  onPressed: state.status.isInProgress || state.otp.length < 6
                      ? null
                      : () => ref
                            .read(forgotPasswordProvider.notifier)
                            .verifyOtp(),
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  child: state.status.isInProgress
                      ? CircularProgressIndicator(color: colorScheme.onPrimary)
                      : Text(
                          t.common.confirm,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    t
                        .auth
                        .forgotPassword, // Use existing if noCodeReceived is missing
                    style: TextStyle(color: colorScheme.onSurfaceVariant),
                  ),
                  TextButton(
                    onPressed: state.countdown > 0
                        ? null
                        : () => ref
                              .read(forgotPasswordProvider.notifier)
                              .sendOtp(),
                    child: Text(
                      state.countdown > 0
                          ? '${state.countdown}s'
                          : t.auth.getVerificationCode,
                    ),
                  ),
                ],
              ),
            ],
          ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.1, end: 0),
        ),
      ),
    );
  }
}
