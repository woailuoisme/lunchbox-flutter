import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lunchbox/features/order/entities/order_model.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:qr_flutter/qr_flutter.dart';

/// 订单取货信息组件（二维码/取货码）
class OrderPickupInfo extends StatelessWidget {
  const OrderPickupInfo({required this.order, super.key});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          // Ticket Header
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
            child: Row(
              children: [
                Container(
                  width: 4.w,
                  height: 16.h,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  t.order.pickupCode,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: theme.textTheme.bodyLarge?.color,
                  ),
                ),
              ],
            ),
          ),

          // QR Code Section
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: theme.dividerColor.withValues(alpha: 0.5),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.02),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(16.w),
                  child: _buildQrCode(theme, order),
                ),
                SizedBox(height: 16.h),
                Text(
                  t.order.pickupHint,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: theme.hintColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQrCode(ThemeData theme, OrderModel order) {
    if (order.qrCodeImage != null && order.qrCodeImage!.isNotEmpty) {
      if (order.qrCodeImage!.startsWith('data:image/svg+xml;charset=utf-8,')) {
        final svgString = Uri.decodeComponent(
          order.qrCodeImage!.substring(
            'data:image/svg+xml;charset=utf-8,'.length,
          ),
        );
        return SizedBox(
          width: 160.w,
          height: 160.w,
          child: SvgPicture.string(svgString),
        );
      } else if (order.qrCodeImage!.startsWith('data:image/svg+xml;base64,')) {
        final base64String = order.qrCodeImage!.substring(
          'data:image/svg+xml;base64,'.length,
        );
        try {
          final svgString = utf8.decode(base64Decode(base64String));
          return SizedBox(
            width: 160.w,
            height: 160.w,
            child: SvgPicture.string(svgString),
          );
        } catch (e) {
          // fallback if decode parse fails
        }
      }
    }

    return QrImageView(
      data: order.id.toString(),
      version: QrVersions.auto,
      size: 160.w,
      gapless: false,
      eyeStyle: const QrEyeStyle(
        eyeShape: QrEyeShape.circle,
        color: Color(0xFF1A1A1A),
      ),
      dataModuleStyle: const QrDataModuleStyle(
        dataModuleShape: QrDataModuleShape.circle,
        color: Color(0xFF1A1A1A),
      ),
    );
  }
}
