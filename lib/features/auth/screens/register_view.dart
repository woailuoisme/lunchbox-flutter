import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/auth/providers/auth_notifier.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:toastification/toastification.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  ConsumerState<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nicknameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _nicknameController.dispose();
    super.dispose();
  }

  /// 处理注册逻辑
  Future<void> _handleRegister() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isLoading = true);

    try {
      await ref
          .read(authProvider.notifier)
          .register(
            _usernameController.text.trim(),
            _passwordController.text,
            _nicknameController.text.trim(),
          );
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 16.h),
                        _buildHeader(colorScheme),
                        SizedBox(height: 32.h),
                        _buildForm(colorScheme),
                        SizedBox(height: 32.h),
                        _buildRegisterButton(colorScheme),
                        SizedBox(height: 24.h),
                      ],
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

  Widget _buildHeader(ColorScheme colorScheme) {
    return Column(
      children: [
        Text(
          t.auth.registerTitle,
          style: TextStyle(
            fontSize: 28.sp,
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          t.auth.slogan,
          style: TextStyle(
            fontSize: 14.sp,
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildForm(ColorScheme colorScheme) {
    return Column(
      children: [
        TextFormField(
          controller: _usernameController,
          style: TextStyle(
            fontSize: 16.sp,
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            labelText: t.common.username,
            labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
            hintText: t.auth.enterUsernameHint,
            hintStyle: TextStyle(color: colorScheme.outline),
            prefixIcon: Icon(Symbols.person, color: colorScheme.primary),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: colorScheme.outlineVariant),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: colorScheme.outlineVariant,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: colorScheme.primary, width: 2),
            ),
          ),
          validator: (v) => v?.isNotEmpty ?? false ? null : t.auth.required,
          textInputAction: TextInputAction.next,
        ),
        SizedBox(height: 16.h),
        TextFormField(
          controller: _nicknameController,
          style: TextStyle(
            fontSize: 16.sp,
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            labelText: t.auth.nickname,
            labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
            hintText: t.auth.enterNickname,
            hintStyle: TextStyle(color: colorScheme.outline),
            prefixIcon: Icon(Symbols.face, color: colorScheme.primary),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: colorScheme.outlineVariant),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: colorScheme.outlineVariant,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: colorScheme.primary, width: 2),
            ),
          ),
          validator: (v) => v?.isNotEmpty ?? false ? null : t.auth.required,
          textInputAction: TextInputAction.next,
        ),
        SizedBox(height: 16.h),
        TextFormField(
          controller: _passwordController,
          obscureText: true,
          style: TextStyle(
            fontSize: 16.sp,
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            labelText: t.common.password,
            labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
            hintText: t.auth.enterPassword,
            hintStyle: TextStyle(color: colorScheme.outline),
            prefixIcon: Icon(Symbols.lock, color: colorScheme.primary),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: colorScheme.outlineVariant),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: colorScheme.outlineVariant,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: colorScheme.primary, width: 2),
            ),
          ),
          validator: (v) => v?.isNotEmpty ?? false ? null : t.auth.required,
          textInputAction: TextInputAction.done,
          onFieldSubmitted: (_) => _handleRegister(),
        ),
      ],
    );
  }

  Widget _buildRegisterButton(ColorScheme colorScheme) {
    return ElevatedButton(
      onPressed: _isLoading ? null : _handleRegister,
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        disabledBackgroundColor: colorScheme.primary.withValues(alpha: 0.5),
        disabledForegroundColor: colorScheme.onPrimary.withValues(alpha: 0.8),
        padding: EdgeInsets.symmetric(vertical: 16.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        elevation: 0,
      ),
      child: _isLoading
          ? SizedBox(
              width: 20.w,
              height: 20.w,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  colorScheme.onPrimary,
                ),
              ),
            )
          : Text(
              t.common.register,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
    );
  }
}
