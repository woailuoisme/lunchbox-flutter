import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/i18n/translations.g.dart';

class LoginFooterLinks extends StatelessWidget {
  const LoginFooterLinks({
    super.key,
    required this.colorScheme,
    required this.onRegister,
    required this.onForgotPassword,
  });

  final ColorScheme colorScheme;
  final VoidCallback onRegister;
  final VoidCallback onForgotPassword;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_buildRegisterHint(), _buildForgotPassword()],
    );
  }

  Widget _buildRegisterHint() {
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
          onPressed: onRegister,
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

  Widget _buildForgotPassword() {
    return TextButton(
      onPressed: onForgotPassword,
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
