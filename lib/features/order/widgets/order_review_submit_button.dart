import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/i18n/translations.g.dart';

class OrderReviewSubmitButton extends StatelessWidget {
  const OrderReviewSubmitButton({
    super.key,
    required this.isSubmitting,
    required this.onPressed,
    this.isBottomSheet = false,
  });

  final bool isSubmitting;
  final VoidCallback? onPressed;
  final bool isBottomSheet;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // BottomSheet 模式下需要考虑底部安全区和键盘
    final bottomPadding = isBottomSheet
        ? MediaQuery.of(context).viewInsets.bottom + 16.h
        : ScreenUtil().bottomBarHeight;

    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h + bottomPadding),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: isSubmitting ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: Colors.white,
          minimumSize: Size(double.infinity, 48.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.r),
          ),
          elevation: 0,
        ),
        child: isSubmitting
            ? SizedBox(
                width: 20.w,
                height: 20.w,
                child: const CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              )
            : Text(
                t.order.review.submit,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
