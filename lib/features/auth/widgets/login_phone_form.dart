import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/core/utils/validator_utils.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:pinput/pinput.dart';

class LoginPhoneForm extends StatelessWidget {
  const LoginPhoneForm({
    super.key,
    required this.colorScheme,
    required this.countdown,
    required this.canSendCode,
    required this.onPhoneChanged,
    required this.onCodeChanged,
    required this.onSendCode,
  });

  final ColorScheme colorScheme;
  final int countdown;
  final bool canSendCode;
  final ValueChanged<String> onPhoneChanged;
  final ValueChanged<String> onCodeChanged;
  final VoidCallback onSendCode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h),
        PhoneFormField(
          initialValue: PhoneNumber.parse('+86'),
          onChanged: (p) => onPhoneChanged(p.international),
          decoration: _buildInputDecoration(
            label: t.auth.phoneNumber,
            hint: t.auth.enterPhoneNumber,
            prefixIcon: Symbols.phone_iphone,
          ),
          validator: (value) {
            final raw = value?.nsn ?? value?.international ?? '';
            final digits = raw.replaceAll(RegExp(r'\D'), '');
            if (digits.isEmpty) {
              return t.auth.required;
            }
            if (!ValidatorUtils.isValidPhone(digits)) {
              return t.auth.enterPhoneNumber;
            }
            return null;
          },
          countrySelectorNavigator: const CountrySelectorNavigator.dialog(),
        ),
        SizedBox(height: 16.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Pinput(
                length: 6,
                onChanged: onCodeChanged,
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
            onPressed: canSendCode ? onSendCode : null,
            child: Text(
              countdown > 0
                  ? t.auth.retryInSeconds(seconds: countdown)
                  : t.auth.getVerificationCode,
              style: TextStyle(
                color: canSendCode ? colorScheme.outline : colorScheme.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }

  InputDecoration _buildInputDecoration({
    required String label,
    required String hint,
    required IconData prefixIcon,
  }) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
      hintText: hint,
      hintStyle: TextStyle(color: colorScheme.outline),
      prefixIcon: Icon(prefixIcon, color: colorScheme.primary),
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
}
