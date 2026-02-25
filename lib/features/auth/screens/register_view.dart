import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/auth/providers/auth_provider.dart';
import 'package:lunchbox/features/auth/widgets/register_button.dart';
import 'package:lunchbox/features/auth/widgets/register_form.dart';
import 'package:lunchbox/features/auth/widgets/register_header.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:toastification/toastification.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  ConsumerState<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isLoading = false;
  bool _obscurePassword = true;

  void _togglePasswordVisibility() {
    setState(() => _obscurePassword = !_obscurePassword);
  }

  /// 处理注册逻辑
  Future<void> _handleRegister() async {
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
                                SizedBox(height: 16.h),
                                RegisterHeader(colorScheme: colorScheme),
                                SizedBox(height: 32.h),
                                RegisterForm(
                                  colorScheme: colorScheme,
                                  obscurePassword: _obscurePassword,
                                  onTogglePasswordVisibility:
                                      _togglePasswordVisibility,
                                  onSubmit: _handleRegister,
                                ),
                                SizedBox(height: 32.h),
                                RegisterButton(
                                  colorScheme: colorScheme,
                                  isLoading: _isLoading,
                                  onPressed: _handleRegister,
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
