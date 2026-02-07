import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/core/widgets/widgets.dart';
import 'package:lunchbox/features/device/entities/device_model.dart';
import 'package:lunchbox/features/device/providers/device_providers.dart';
import 'package:lunchbox/features/product/entities/product_model.dart';
import 'package:lunchbox/i18n/translations.g.dart';

/// 设备详情视图
class DeviceDetailView extends ConsumerWidget {
  const DeviceDetailView({required this.deviceId, super.key});
  final String deviceId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceAsync = ref.watch(deviceDetailProvider(deviceId));

    return Scaffold(
      body: deviceAsync.when(
        data: (device) => CustomScrollView(
          slivers: [
            // AppBar
            SliverAppBar(
              expandedHeight: 200.h,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(device.name),
                background: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).primaryColor.withValues(alpha: 0.8),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.storefront,
                      size: 80.sp,
                      color: Colors.white.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ),
            ),

            // 设备信息
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoSection(device),
                    SizedBox(height: 16.h),
                    _buildProductsSection(ref, deviceId),
                  ],
                ),
              ),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) =>
            Center(child: Text(t.device.loadFailed(error: error))),
      ),

      // 底部操作栏
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  /// 构建设备信息区域
  Widget _buildInfoSection(DeviceModel device) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.device.info,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12.h),

            _buildInfoRow(Icons.location_on, t.device.address, device.address),
            SizedBox(height: 8.h),

            if (device.distance != null)
              _buildInfoRow(
                Icons.directions_walk,
                t.device.distance,
                device.distanceText,
              ),

            SizedBox(height: 8.h),
            _buildInfoRow(
              Icons.circle,
              t.device.status,
              device.isOnline ? t.device.online : t.device.offline,
              valueColor: device.isOnline ? Colors.green : Colors.grey,
            ),

            SizedBox(height: 8.h),
            Row(
              children: [
                Icon(Icons.payment, size: 20.sp, color: Colors.grey),
                SizedBox(width: 8.w),
                Text(
                  t.device.paymentMethods,
                  style: TextStyle(fontSize: 14.sp),
                ),
                SizedBox(width: 8.w),
                if (device.supportMobilePayment)
                  Chip(
                    label: Text(t.device.mobilePayment),
                    labelStyle: TextStyle(fontSize: 12.sp),
                    padding: EdgeInsets.zero,
                  ),
                SizedBox(width: 8.w),
                if (device.supportCashPayment)
                  Chip(
                    label: Text(t.device.cash),
                    labelStyle: TextStyle(fontSize: 12.sp),
                    padding: EdgeInsets.zero,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// 构建信息行
  Widget _buildInfoRow(
    IconData icon,
    String label,
    String value, {
    Color? valueColor,
  }) {
    return Row(
      children: [
        Icon(icon, size: 20.sp, color: Colors.grey),
        SizedBox(width: 8.w),
        Text('$label：', style: TextStyle(fontSize: 14.sp)),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 14.sp,
              color: valueColor ?? Colors.black87,
              fontWeight: valueColor != null
                  ? FontWeight.bold
                  : FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }

  /// 构建产品列表区域
  Widget _buildProductsSection(WidgetRef ref, String deviceId) {
    final productsAsync = ref.watch(deviceProductsProvider(deviceId));

    return productsAsync.when(
      data: (products) {
        if (products.isEmpty) {
          return Card(
            child: Padding(
              padding: EdgeInsets.all(32.w),
              child: Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.inventory_2_outlined,
                      size: 48.sp,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      t.device.noProducts,
                      style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.device.productList,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12.h),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return _buildProductCard(context, product);
              },
            ),
          ],
        );
      },
      loading: () => const Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, stack) =>
          Center(child: Text(t.device.loadProductsFailed(error: error))),
    );
  }

  /// 构建产品卡片
  Widget _buildProductCard(BuildContext context, ProductModel product) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          // TODO(User): 跳转到产品详情
          // context.push('/product/${product.id}');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 产品图片
            AspectRatio(
              aspectRatio: 1,
              child: AppImage(imageUrl: product.imageUrl),
            ),

            Padding(
              padding: EdgeInsets.all(8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 产品名称
                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4.h),

                  // 价格
                  Row(
                    children: [
                      Text(
                        '¥${product.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      if (product.hasDiscount) ...[
                        SizedBox(width: 4.w),
                        Text(
                          '¥${product.originalPrice!.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ],
                  ),

                  // 库存状态
                  if (!product.hasStock)
                    Text(
                      t.device.soldOut,
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 构建底部操作栏
  Widget _buildBottomBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: ElevatedButton(
          onPressed: () {
            // 显示故障上报对话框
            _showReportDialog(context);
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 12.h),
          ),
          child: Text(t.device.reportIssue),
        ),
      ),
    );
  }

  /// 显示故障上报对话框
  void _showReportDialog(BuildContext context) {
    final TextEditingController textController = TextEditingController();

    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.device.reportDeviceIssue),
        content: TextField(
          controller: textController,
          maxLines: 3,
          decoration: InputDecoration(
            hintText: t.device.reportIssueHint,
            border: const OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(t.common.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              if (textController.text.isNotEmpty) {
                // TODO(User): 实现故障上报逻辑
                // ref.read(deviceRepositoryProvider).reportIssue(...)
                Navigator.of(context).pop();
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(t.device.reportSuccess)));
              }
            },
            child: Text(t.common.confirm),
          ),
        ],
      ),
    );
  }
}
