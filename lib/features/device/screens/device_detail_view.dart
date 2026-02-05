import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../product/entities/product_model.dart';
import '../entities/device_model.dart';
import '../providers/device_providers.dart';

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
        error: (error, stack) => Center(child: Text('加载失败: $error')),
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
              '设备信息',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12.h),

            _buildInfoRow(Icons.location_on, '地址', device.address),
            SizedBox(height: 8.h),

            if (device.distance != null)
              _buildInfoRow(Icons.directions_walk, '距离', device.distanceText),

            SizedBox(height: 8.h),
            _buildInfoRow(
              Icons.circle,
              '状态',
              device.isOnline ? '在线' : '离线',
              valueColor: device.isOnline ? Colors.green : Colors.grey,
            ),

            SizedBox(height: 8.h),
            Row(
              children: [
                Icon(Icons.payment, size: 20.sp, color: Colors.grey),
                SizedBox(width: 8.w),
                Text('支付方式：', style: TextStyle(fontSize: 14.sp)),
                SizedBox(width: 8.w),
                if (device.supportMobilePayment)
                  Chip(
                    label: const Text('移动支付'),
                    labelStyle: TextStyle(fontSize: 12.sp),
                    padding: EdgeInsets.zero,
                  ),
                SizedBox(width: 8.w),
                if (device.supportCashPayment)
                  Chip(
                    label: const Text('现金'),
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
                      '暂无商品',
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
              '商品列表',
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
      error: (error, stack) => Center(child: Text('加载商品失败: $error')),
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
              child: CachedNetworkImage(
                imageUrl: product.imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: Colors.grey[200],
                  child: const Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (context, url, error) => Container(
                  color: Colors.grey[200],
                  child: Icon(Icons.image_not_supported, size: 48.sp),
                ),
              ),
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
                      '已售罄',
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
          child: const Text('上报故障'),
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
        title: const Text('上报设备故障'),
        content: TextField(
          controller: textController,
          maxLines: 3,
          decoration: const InputDecoration(
            hintText: '请描述设备故障情况...',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('取消'),
          ),
          ElevatedButton(
            onPressed: () {
              if (textController.text.isNotEmpty) {
                // TODO(User): 实现故障上报逻辑
                // ref.read(deviceRepositoryProvider).reportIssue(...)
                Navigator.of(context).pop();
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('故障上报成功')));
              }
            },
            child: const Text('提交'),
          ),
        ],
      ),
    );
  }
}
