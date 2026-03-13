import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/core/utils/logger_utils.dart';
import 'package:lunchbox/features/order/entities/order_model.dart';
import 'package:lunchbox/features/order/providers/order_provider.dart';
import 'package:lunchbox/features/order/widgets/order_review_bottom_sheet_header.dart';
import 'package:lunchbox/features/order/widgets/order_review_product_card.dart';
import 'package:lunchbox/features/order/widgets/order_review_submit_button.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:toastification/toastification.dart';

/// 订单评价页面 (支持作为全屏页面或 BottomSheet)
class OrderReviewView extends ConsumerStatefulWidget {
  const OrderReviewView({
    super.key,
    required this.order,
    this.isBottomSheet = false,
    this.scrollController,
  });

  final OrderModel order;
  final bool isBottomSheet;
  final ScrollController? scrollController;

  /// 静态方法：以 BottomSheet 方式显示评价界面
  static Future<bool?> show(BuildContext context, OrderModel order) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      enableDrag: true,
      showDragHandle: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      clipBehavior: Clip.hardEdge,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) => OrderReviewView(
          order: order,
          isBottomSheet: true,
          scrollController: scrollController,
        ),
      ),
    );
  }

  @override
  ConsumerState<OrderReviewView> createState() => _OrderReviewViewState();
}

class _OrderReviewViewState extends ConsumerState<OrderReviewView> {
  // 存储每个商品的评价数据
  final Map<int, double> _ratings = {};
  final Map<int, TextEditingController> _controllers = {};
  final Map<int, List<File>> _images = {};
  bool _isSubmitting = false;

  @override
  void dispose() {
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  /// 提交所有评价
  Future<void> _submitAllReviews() async {
    // 基础校验
    for (final product in widget.order.products) {
      if ((_ratings[product.id] ?? 0) == 0) {
        _showToast(t.order.review.pleaseRate, ToastificationType.warning);
        return;
      }
      final content = _controllers[product.id]?.text.trim() ?? '';
      if (content.isEmpty) {
        _showToast(t.order.review.pleaseInput, ToastificationType.warning);
        return;
      }
      if (content.length > 256) {
        _showToast(t.order.review.contentTooLong, ToastificationType.warning);
        return;
      }
    }

    setState(() => _isSubmitting = true);

    try {
      for (final product in widget.order.products) {
        final rating = _ratings[product.id]!.toInt();
        final content = _controllers[product.id]!.text.trim();
        final productImages = _images[product.id] ?? [];

        final multipartImages = await Future.wait(
          productImages.map(
            (file) async => await MultipartFile.fromFile(file.path),
          ),
        );

        await ref
            .read(orderProvider.notifier)
            .addProductReview(
              orderId: widget.order.id,
              productId: product.id,
              content: content,
              rating: rating,
              images: multipartImages.isNotEmpty ? multipartImages : null,
            );
      }

      if (mounted) {
        _showToast(t.order.review.submitSuccess, ToastificationType.success);
        Navigator.pop(context, true);
      }
    } catch (e) {
      LoggerUtils.e('Failed to submit reviews', e);
      if (mounted) {
        _showToast(t.order.review.submitFailed, ToastificationType.error);
      }
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  void _showToast(String message, ToastificationType type) {
    toastification.show(
      context: context,
      type: type,
      title: Text(message),
      autoCloseDuration: const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // 根据模式构建主体内容
    final content = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.isBottomSheet) const OrderReviewBottomSheetHeader(),
        Expanded(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: ListView.builder(
              controller: widget.scrollController,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              itemCount: widget.order.products.length,
              itemBuilder: (context, index) {
                final product = widget.order.products[index];

                // 初始化控制器
                if (!_controllers.containsKey(product.id)) {
                  _controllers[product.id] = TextEditingController();
                  _ratings[product.id] = 5.0; // 默认5星
                }

                return OrderReviewProductCard(
                      product: product,
                      controller: _controllers[product.id]!,
                      initialRating: _ratings[product.id]!,
                      onRatingChanged: (rating) {
                        setState(() => _ratings[product.id] = rating);
                      },
                      onImagesChanged: (files) {
                        _images[product.id] = files;
                      },
                    )
                    .animate(delay: (index * 100).ms)
                    .fadeIn()
                    .slideY(begin: 0.1, end: 0);
              },
            ),
          ),
        ),
        OrderReviewSubmitButton(
          isSubmitting: _isSubmitting,
          onPressed: _submitAllReviews,
          isBottomSheet: widget.isBottomSheet,
        ),
      ],
    );

    if (widget.isBottomSheet) {
      return Container(
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        child: content,
      );
    }

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(title: Text(t.order.review.title), centerTitle: true),
      body: content,
    );
  }
}
