import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lunchbox/features/auth/providers/login_notifier.dart';
import 'package:lunchbox/features/auth/providers/login_state.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/routes/routes.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:pinput/pinput.dart';
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
    if (_tabController.indexIsChanging) {
      final type = _tabController.index == 0
          ? LoginType.password
          : LoginType.phone;
      ref.read(loginProvider.notifier).setLoginType(type);
    }
  }

  void _handleLogin() {
    // 简单的表单验证，更复杂的逻辑在 Notifier 中处理
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
                                SizedBox(height: 48.h),
                                _buildHeader(colorScheme),
                                SizedBox(height: 48.h),
                                _buildLoginTypeSelector(colorScheme, state),
                                SizedBox(height: 32.h),
                                state.loginType == LoginType.password
                                    ? _buildPasswordLoginForm(
                                        colorScheme,
                                        state,
                                      )
                                    : _buildPhoneLoginForm(colorScheme, state),
                                SizedBox(height: 32.h),
                                _buildLoginButton(colorScheme, state),
                                SizedBox(height: 16.h),
                                _buildFooterLinks(colorScheme),
                                const Spacer(),
                                _buildSocialLogin(colorScheme),
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

  Widget _buildLoginTypeSelector(ColorScheme colorScheme, LoginState state) {
    // 确保 TabController 状态与 Provider 状态同步
    if (!_tabController.indexIsChanging) {
      final targetIndex = state.loginType == LoginType.password ? 0 : 1;
      if (_tabController.index != targetIndex) {
        _tabController.animateTo(targetIndex);
      }
    }

    return TabBar(
      controller: _tabController,
      indicatorColor: colorScheme.primary,
      indicatorSize: TabBarIndicatorSize.tab,
      dividerColor: Colors.transparent,
      labelColor: colorScheme.primary,
      unselectedLabelColor: colorScheme.onSurfaceVariant,
      labelStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      tabs: const [
        Tab(text: '密码登录'),
        Tab(text: '验证码登录'),
      ],
      onTap: (index) {
        final type = index == 0 ? LoginType.password : LoginType.phone;
        ref.read(loginProvider.notifier).setLoginType(type);
      },
    );
  }

  Widget _buildPasswordLoginForm(ColorScheme colorScheme, LoginState state) {
    return Column(
      children: [
        FormBuilderTextField(
          name: 'username',
          initialValue: state.username,
          onChanged: (value) =>
              ref.read(loginProvider.notifier).usernameChanged(value ?? ''),
          style: TextStyle(
            fontSize: 16.sp,
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w500,
          ),
          decoration: _buildInputDecoration(
            colorScheme,
            label: t.common.username,
            hint: t.auth.enterUsernameHint,
            prefixIcon: Symbols.person,
          ),
          validator: FormBuilderValidators.required(errorText: t.auth.required),
          textInputAction: TextInputAction.next,
        ),
        SizedBox(height: 16.h),
        FormBuilderTextField(
          name: 'password',
          initialValue: state.password,
          onChanged: (value) =>
              ref.read(loginProvider.notifier).passwordChanged(value ?? ''),
          obscureText: _obscurePassword,
          style: TextStyle(
            fontSize: 16.sp,
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w500,
          ),
          decoration: _buildInputDecoration(
            colorScheme,
            label: t.common.password,
            hint: t.auth.enterPassword,
            prefixIcon: Symbols.lock,
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword ? Symbols.visibility : Symbols.visibility_off,
                color: colorScheme.onSurfaceVariant,
              ),
              onPressed: _togglePasswordVisibility,
            ),
          ),
          validator: FormBuilderValidators.required(errorText: t.auth.required),
          textInputAction: TextInputAction.done,
          onSubmitted: (_) => _handleLogin(),
        ),
      ],
    );
  }

  Widget _buildPhoneLoginForm(ColorScheme colorScheme, LoginState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PhoneFormField(
          initialValue: PhoneNumber.parse('+86'), // 默认中国
          onChanged: (p) => ref
              .read(loginProvider.notifier)
              .phoneNumberChanged(p.international),
          decoration: _buildInputDecoration(
            colorScheme,
            label: '手机号',
            hint: '请输入手机号',
            prefixIcon: Symbols.phone_iphone,
          ),
          validator: PhoneValidator.compose([
            PhoneValidator.required(context),
            PhoneValidator.validMobile(context),
          ]),
          countrySelectorNavigator: const CountrySelectorNavigator.dialog(),
        ),
        SizedBox(height: 16.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Pinput(
                length: 6,
                onChanged: (value) => ref
                    .read(loginProvider.notifier)
                    .verificationCodeChanged(value),
                defaultPinTheme: PinTheme(
                  width: 56.w,
                  height: 56.w,
                  textStyle: TextStyle(
                    fontSize: 20.sp,
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest.withValues(
                      alpha: 0.3,
                    ),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.transparent),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  width: 56.w,
                  height: 56.w,
                  textStyle: TextStyle(
                    fontSize: 20.sp,
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: colorScheme.primary, width: 2),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: state.countdown > 0
                ? null
                : () => ref.read(loginProvider.notifier).sendVerificationCode(),
            child: Text(
              state.countdown > 0 ? '${state.countdown}s 后重试' : '获取验证码',
              style: TextStyle(
                color: state.countdown > 0
                    ? colorScheme.outline
                    : colorScheme.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }

  InputDecoration _buildInputDecoration(
    ColorScheme colorScheme, {
    required String label,
    required String hint,
    required IconData prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
      hintText: hint,
      hintStyle: TextStyle(color: colorScheme.outline),
      prefixIcon: Icon(prefixIcon, color: colorScheme.primary),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.1),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: colorScheme.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: colorScheme.error, width: 1.5),
      ),
    );
  }

  Widget _buildSocialLogin(ColorScheme colorScheme) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider(color: colorScheme.outlineVariant)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                '其他登录方式',
                style: TextStyle(
                  color: colorScheme.onSurfaceVariant,
                  fontSize: 12.sp,
                ),
              ),
            ),
            Expanded(child: Divider(color: colorScheme.outlineVariant)),
          ],
        ),
        SizedBox(height: 24.h),
        InkWell(
          onTap: () => ref.read(loginProvider.notifier).loginWithGoogle(),
          borderRadius: BorderRadius.circular(30.r),
          child: Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: colorScheme.outlineVariant),
              color: colorScheme.surface,
            ),
            child: Icon(
              Symbols.account_circle,
              size: 24.w,
              color: colorScheme.onSurface,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton(ColorScheme colorScheme, LoginState state) {
    return SizedBox(
      height: 56.h,
      child: FilledButton(
        onPressed: state.status.isInProgress ? null : _handleLogin,
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          elevation: 0,
        ),
        child: state.status.isInProgress
            ? SizedBox(
                width: 24.w,
                height: 24.w,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: colorScheme.onPrimary,
                ),
              )
            : Text(
                t.auth.loginButton,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }

  Widget _buildFooterLinks(ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildRegisterHint(colorScheme),
        _buildForgotPassword(colorScheme),
      ],
    );
  }

  Widget _buildHeader(ColorScheme colorScheme) {
    return Column(
      children: [
        Text(
          t.auth.loginTitle,
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

  Widget _buildRegisterHint(ColorScheme colorScheme) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          t.auth.dontHaveAccount,
          style: TextStyle(
            fontSize: 14.sp,
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        TextButton(
          onPressed: () => const RegisterRoute().push<void>(context),
          style: TextButton.styleFrom(
            padding: EdgeInsets.only(left: 4.w),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            t.common.register,
            style: TextStyle(
              fontSize: 14.sp,
              color: colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPassword(ColorScheme colorScheme) {
    return TextButton(
      onPressed: () => const ForgotPasswordRoute().push<void>(context),
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        t.auth.forgotPassword,
        style: TextStyle(fontSize: 14.sp, color: colorScheme.primary),
      ),
    );
  }
}
