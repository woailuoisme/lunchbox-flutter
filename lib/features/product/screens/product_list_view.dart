import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/device/device.dart';
import 'package:lunchbox/features/product/widgets/product_content.dart';
import 'package:lunchbox/features/product/widgets/product_device_header.dart';
import 'package:lunchbox/i18n/translations.g.dart';

/// 产品列表视图
/// 展示特定设备下的所有可用商品，按分类组织
class ProductListView extends ConsumerWidget {
  const ProductListView({required this.deviceId, super.key});
  final String deviceId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceAsync = ref.watch(deviceDetailProvider(deviceId));
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          t.product.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: theme.scaffoldBackgroundColor,
      ),
      body: deviceAsync.when(
        data: (device) {
          if (device == null) {
            return Center(child: Text(t.common.noData));
          }
          return Column(
            children: [
              // 设备信息头部
              ProductDeviceHeader(device: device),
              // 产品列表核心内容（分类侧边栏 + 商品网格）
              Expanded(child: ProductContent(deviceId: deviceId)),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) =>
            Center(child: Text('${t.common.loadFailed}: $error')),
      ),
    );
  }
}
