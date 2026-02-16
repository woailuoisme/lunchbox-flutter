import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';

class LoginSocialLogin extends StatelessWidget {
  const LoginSocialLogin({
    super.key,
    required this.colorScheme,
    required this.onGoogleLogin,
  });

  final ColorScheme colorScheme;
  final VoidCallback onGoogleLogin;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider(color: colorScheme.outlineVariant)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                t.auth.otherLoginMethods,
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
          onTap: onGoogleLogin,
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
}
