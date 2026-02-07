import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 订单列表视图 (食品/商城)
///
/// 按照最新 UI 截图重构，包含订单分类 Tab、状态筛选横向列表、以及详细的订单信息卡片
class OrderListView extends ConsumerStatefulWidget {
  const OrderListView({super.key});

  @override
  ConsumerState<OrderListView> createState() => _OrderListViewState();
}

class _OrderListViewState extends ConsumerState<OrderListView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedFilterIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 240.w,
              child: TabBar(
                controller: _tabController,
                labelColor: const Color(0xFFFF5252),
                // 红色激活态
                unselectedLabelColor: const Color(0xFF999999),
                indicatorColor: const Color(0xFFFF5252),
                // 红色指示器
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 3.h,
                labelStyle: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
                tabs: const [
                  Tab(text: '食品订单'),
                  Tab(text: '商城订单'),
                ],
              ),
            ),
          ],
        ),
        actions: [
          Icon(Icons.more_horiz, color: Colors.black, size: 24.sp),
          SizedBox(width: 12.w),
          Icon(Icons.radio_button_checked, color: Colors.black, size: 24.sp),
          SizedBox(width: 16.w),
        ],
      ),
      body: Column(
        children: [
          // 状态过滤
          _buildStatusFilter(),
          // 列表内容
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [_buildOrderList(), _buildOrderList()],
            ),
          ),
        ],
      ),
    );
  }

  /// 构建状态筛选器
  ///
  /// 横向滚动的状态标签列表，支持全部、待支付等六种状态过滤
  Widget _buildStatusFilter() {
    final filters = ['全部订单', '待支付', '已支付', '已使用', '已完成', '退款'];
    return Container(
      height: 60.h,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: filters.length,
        itemBuilder: (context, index) {
          final isSelected = _selectedFilterIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedFilterIndex = index;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    filters[index],
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: isSelected
                          ? const Color(0xFFFF5252)
                          : const Color(0xFF666666),
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  if (isSelected)
                    Container(
                      margin: EdgeInsets.only(top: 4.h),
                      width: 20.w,
                      height: 2.h,
                      color: const Color(0xFFFF5252),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// 构建订单列表
  Widget _buildOrderList() {
    return ListView.builder(
      padding: EdgeInsets.all(16.w),
      itemCount: 2,
      itemBuilder: (context, index) {
        return _buildOrderCard(index);
      },
    );
  }

  /// 构建订单卡片
  ///
  /// 展示订单号、时间、状态、商品图片、名称、价格及合计信息
  Widget _buildOrderCard(int index) {
    final orders = [
      {
        'id': 'PO202511282323468071978422',
        'time': '2025-11-28 23:23:46',
        'status': '已取消',
        'product': '土猪大骨菜干汤',
        'price': '6.99',
        'count': '1',
        'hint': null,
      },
      {
        'id': 'PO20251128232321597498857400',
        'time': '2025-11-28 23:21:59',
        'status': '已支付',
        'product': '客家食神卤老鹅饭',
        'price': '21.69',
        'count': '1',
        'hint': '订单将于今晚10点30分过期',
      },
    ];

    final order = orders[index];

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '订单号：',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: const Color(0xFF333333),
                      ),
                    ),
                    Text(
                      order['id']!,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF333333),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  order['status']!,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xFF999999),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            order['time']!,
            style: TextStyle(fontSize: 12.sp, color: const Color(0xFFCCCCCC)),
          ),
          SizedBox(height: 16.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 64.w,
                height: 64.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  image: const DecorationImage(
                    image: NetworkImage('https://picsum.photos/seed/food/200'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order['product']!,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF333333),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '默认规格',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xFF999999),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '¥ ${order['price']}',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFFFF5252),
                          ),
                        ),
                        Text(
                          'x${order['count']}',
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: const Color(0xFF999999),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          const Divider(height: 1, color: Color(0xFFEEEEEE)),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '共1件商品',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: const Color(0xFF999999),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '商品金额：¥ ${order['price']}',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: const Color(0xFF666666),
                    ),
                  ),
                  Text(
                    '运费：¥ 0.00',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: const Color(0xFF666666),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '合计：',
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: const Color(0xFF333333),
                          ),
                        ),
                        TextSpan(
                          text: '¥ ${order['price']}',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF333333),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (order['hint'] != null) ...[
            SizedBox(height: 12.h),
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF3E0),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                order['hint']!,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: const Color(0xFFFF9800),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
