import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lunchbox/features/auth/providers/login_notifier.dart';
import 'package:lunchbox/features/auth/providers/login_state.dart';
import 'package:lunchbox/features/auth/widgets/login_content.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/routes/routes.dart';
import 'package:toastification/toastification.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormBuilderState>();
  late final TabController _tabController;
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    final type = _tabController.index == 0
        ? LoginType.password
        : LoginType.phone;
    final currentType = ref.read(loginProvider).loginType;
    if (currentType != type) {
      ref.read(loginProvider.notifier).setLoginType(type);
    }
  }

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

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final state = ref.watch(loginProvider);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: LoginContent(
        formKey: _formKey,
        colorScheme: colorScheme,
        state: state,
        tabController: _tabController,
        obscurePassword: _obscurePassword,
        onTogglePasswordVisibility: _togglePasswordVisibility,
        onLogin: _handleLogin,
        onTabTap: (index) {
          final type = index == 0 ? LoginType.password : LoginType.phone;
          ref.read(loginProvider.notifier).setLoginType(type);
        },
        onUsernameChanged: (value) =>
            ref.read(loginProvider.notifier).usernameChanged(value),
        onPasswordChanged: (value) =>
            ref.read(loginProvider.notifier).passwordChanged(value),
        onPhoneChanged: (value) =>
            ref.read(loginProvider.notifier).phoneNumberChanged(value),
        onCodeChanged: (value) =>
            ref.read(loginProvider.notifier).verificationCodeChanged(value),
        onSendCode: () =>
            ref.read(loginProvider.notifier).sendVerificationCode(),
        onRegister: () => const RegisterRoute().push<void>(context),
        onForgotPassword: () => const ForgotPasswordRoute().push<void>(context),
        onGoogleLogin: () => ref.read(loginProvider.notifier).loginWithGoogle(),
      ),
    );
  }
}
