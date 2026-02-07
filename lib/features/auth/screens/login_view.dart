import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/core/values/app_colors.dart';
import 'package:lunchbox/features/auth/models/password.dart';
import 'package:lunchbox/features/auth/models/username.dart';
import 'package:lunchbox/features/auth/providers/login_notifier.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/routes/app_routes.dart';
import 'package:toastification/toastification.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  bool _obscurePassword = true;

  void _handleLogin() {
    ref.read(loginProvider.notifier).login();
  }

  void _togglePasswordVisibility() {
    setState(() => _obscurePassword = !_obscurePassword);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(loginProvider, (previous, next) {
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

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 60.h),
              _buildHeader(),
              SizedBox(height: 60.h),
              _buildLoginForm(),
              SizedBox(height: 24.h),
              _buildLoginButton(),
              SizedBox(height: 16.h),
              _buildForgotPassword(),
              SizedBox(height: 32.h),
              _buildRegisterHint(),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          width: 80.w,
          height: 80.w,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Icon(Icons.lunch_dining, size: 48.sp, color: Colors.white),
        ),
        SizedBox(height: 24.h),
        Text(
          t.auth.loginTitle,
          style: TextStyle(
            fontSize: 28.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          t.auth.slogan,
          style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
        ),
      ],
    );
  }

  Widget _buildLoginForm() {
    final state = ref.watch(loginProvider);

    return Column(
      children: [
        TextFormField(
          initialValue: state.username.value,
          onChanged: (value) =>
              ref.read(loginProvider.notifier).usernameChanged(value),
          decoration: InputDecoration(
            labelText: t.common.username,
            hintText: t.auth.enterUsernameHint,
            errorText:
                state.username.displayError == UsernameValidationError.empty
                ? t.auth.enterUsername
                : null,
            prefixIcon: const Icon(Icons.person_outline),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
        ),
        SizedBox(height: 16.h),
        TextFormField(
          initialValue: state.password.value,
          onChanged: (value) =>
              ref.read(loginProvider.notifier).passwordChanged(value),
          obscureText: _obscurePassword,
          decoration: InputDecoration(
            labelText: t.common.password,
            hintText: t.auth.enterPassword,
            errorText:
                state.password.displayError == PasswordValidationError.empty
                ? t.auth.enterPassword
                : null,
            prefixIcon: const Icon(Icons.lock_outline),
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
              ),
              onPressed: _togglePasswordVisibility,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          textInputAction: TextInputAction.done,
          onFieldSubmitted: (_) => _handleLogin(),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    final state = ref.watch(loginProvider);
    final isLoading = state.status.isInProgress;

    return ElevatedButton(
      onPressed: state.isValid && !isLoading ? _handleLogin : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        elevation: 0,
      ),
      child: isLoading
          ? SizedBox(
              width: 20.w,
              height: 20.w,
              child: const CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Text(
              t.auth.loginButton,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
    );
  }

  Widget _buildForgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => context.push(AppRoutes.forgotPassword),
        child: Text(
          t.auth.forgotPassword,
          style: TextStyle(fontSize: 14.sp, color: AppColors.primary),
        ),
      ),
    );
  }

  Widget _buildRegisterHint() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          t.auth.dontHaveAccount,
          style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
        ),
        TextButton(
          onPressed: () => context.push(AppRoutes.register),
          child: Text(
            t.common.register,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
