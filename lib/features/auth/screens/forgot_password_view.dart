import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/auth/widgets/forgot_password_button.dart';
import 'package:lunchbox/features/auth/widgets/forgot_password_form.dart';
import 'package:lunchbox/features/auth/widgets/forgot_password_header.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:toastification/toastification.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isLoading = false;

  /// 处理发送重置链接逻辑
  Future<void> _handleResetPassword() async {
    if (!(_formKey.currentState?.saveAndValidate() ?? false)) {
      return;
    }

    // 获取输入值
    final email = _formKey.currentState?.value['email'];
    debugPrint('Reset password for: $email');

    setState(() => _isLoading = true);

    try {
      // 模拟发送重置邮件
      await Future<void>.delayed(const Duration(seconds: 1));

      if (mounted) {
        toastification.show(
          context: context,
          type: ToastificationType.success,
          style: ToastificationStyle.fillColored,
          title: Text(t.auth.resetLinkSent),
          alignment: Alignment.topCenter,
          autoCloseDuration: const Duration(seconds: 3),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        toastification.show(
          context: context,
          type: ToastificationType.error,
          style: ToastificationStyle.fillColored,
          title: Text(t.common.error),
          description: Text(e.toString()),
          alignment: Alignment.topCenter,
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
                                  onSubmit: _handleResetPassword,
                                ),
                                SizedBox(height: 32.h),
                                ForgotPasswordButton(
                                  colorScheme: colorScheme,
                                  isLoading: _isLoading,
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
