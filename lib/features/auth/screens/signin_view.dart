import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lunchbox/features/auth/providers/signin_provider.dart';
import 'package:lunchbox/features/auth/providers/signin_state.dart';
import 'package:lunchbox/features/auth/widgets/signin_content.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/routes/routes.dart';
import 'package:toastification/toastification.dart';

class SignInView extends ConsumerStatefulWidget {
  const SignInView({super.key});

  @override
  ConsumerState<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends ConsumerState<SignInView>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormBuilderState>();
  late final TabController _tabController;
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleSignIn() {
    ref.read(signInProvider.notifier).signIn();
  }

  void _togglePasswordVisibility() {
    setState(() => _obscurePassword = !_obscurePassword);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final state = ref.watch(signInProvider);

    ref.listen(signInProvider, (previous, next) {
      if (next.isFailure && next.errorMessage != null) {
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
      backgroundColor: colorScheme.surface,
      body: SignInContent(
        formKey: _formKey,
        colorScheme: colorScheme,
        state: state,
        tabController: _tabController,
        obscurePassword: _obscurePassword,
        onTogglePasswordVisibility: _togglePasswordVisibility,
        onSignIn: _handleSignIn,
        canSendCode: false,
        canSubmit: state.canSubmit,
        onTabTap: (index) {},
        onUsernameChanged: (value) =>
            ref.read(signInProvider.notifier).usernameChanged(value),
        onPasswordChanged: (value) =>
            ref.read(signInProvider.notifier).passwordChanged(value),
        onPhoneChanged: (_) {},
        onCodeChanged: (_) {},
        onSendCode: () {},
        onSignUp: () => const SignUpRoute().push<void>(context),
        onForgotPassword: () => const ForgotPasswordRoute().push<void>(context),
        onGoogleSignIn: () => ref.read(signInProvider.notifier).signIn(),
      ),
    );
  }
}
