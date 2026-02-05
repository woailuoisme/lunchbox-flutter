import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

import '../../../core/values/app_colors.dart';
import '../providers/auth_notifier.dart';

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

  Future<void> _handleRegister() async {
    if (!_formKey.currentState!.validate()) return;

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
        Navigator.pop(context); // Go back to login or home?
        // Usually register logs you in.
      }
    } catch (e) {
      if (mounted) {
        toastification.show(
          context: context,
          type: ToastificationType.error,
          style: ToastificationStyle.fillColored,
          title: const Text('注册失败'),
          description: Text(e.toString()),
          alignment: Alignment.topCenter,
          autoCloseDuration: const Duration(seconds: 3),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('注册')),
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 24.h),
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(labelText: '用户名'),
                  validator: (v) => v?.isNotEmpty ?? false ? null : 'Required',
                ),
                SizedBox(height: 16.h),
                TextFormField(
                  controller: _nicknameController,
                  decoration: const InputDecoration(labelText: '昵称'),
                  validator: (v) => v?.isNotEmpty ?? false ? null : 'Required',
                ),
                SizedBox(height: 16.h),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: '密码'),
                  obscureText: true,
                  validator: (v) => v?.isNotEmpty ?? false ? null : 'Required',
                ),
                SizedBox(height: 24.h),
                ElevatedButton(
                  onPressed: _isLoading ? null : _handleRegister,
                  child: _isLoading
                      ? const CircularProgressIndicator()
                      : const Text('注册'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
