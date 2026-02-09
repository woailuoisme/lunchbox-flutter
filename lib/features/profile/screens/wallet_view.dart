import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:lunchbox/features/profile/repositories/wallet_repository.dart';

class WalletView extends ConsumerWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('钱包'),
        centerTitle: true,
        backgroundColor:
            theme.appBarTheme.backgroundColor ?? theme.colorScheme.surface,
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _buildHeader(context, ref)),
          SliverToBoxAdapter(child: SizedBox(height: 16.h)),
          SliverToBoxAdapter(child: _buildTopUpSection(context)),
          SliverToBoxAdapter(child: SizedBox(height: 16.h)),
          SliverToBoxAdapter(child: _buildTransactionHistory(context, ref)),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final balanceAsync = ref.watch(walletBalanceProvider);
    final balance = balanceAsync.when(
      data: (value) => value,
      loading: () => 0.00,
      error: (_, _) => 0.00,
    );

    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.symmetric(vertical: 24.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.primary.withValues(alpha: 0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '钱包余额',
                style: TextStyle(
                  color: theme.colorScheme.onPrimary,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(width: 4.w),
              const Text('💰', style: TextStyle(fontSize: 14)),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            '¥ ${balance.toStringAsFixed(2)}',
            style: TextStyle(
              color: theme.colorScheme.onPrimary,
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Symbols.credit_card,
                  color: theme.colorScheme.primary,
                  size: 16.sp,
                ),
                SizedBox(width: 8.w),
                Text(
                  '充值',
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopUpSection(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.cardColor,
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '选择充值金额',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: theme.colorScheme.tertiaryContainer,
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(color: theme.colorScheme.tertiary),
                ),
                child: Row(
                  children: [
                    Icon(
                      Symbols.description,
                      size: 14.sp,
                      color: theme.colorScheme.onTertiaryContainer,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '规则说明',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: theme.colorScheme.onTertiaryContainer,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: theme.colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Text(
              '充值部分套餐可获取乖乖币，自选金额充值不获取乖乖币',
              style: TextStyle(
                color: theme.colorScheme.onSecondaryContainer,
                fontSize: 12.sp,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            mainAxisSpacing: 12.w,
            crossAxisSpacing: 12.w,
            childAspectRatio: 1.2,
            children: [
              _buildTopUpOption(context, '100元', '实付¥95', '无乖乖币'),
              _buildTopUpOption(context, '300元', '实付¥285', '送300乖乖币'),
              _buildTopUpOption(context, '500元', '实付¥475', '送400乖乖币'),
              _buildCustomAmountOption(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTopUpOption(
    BuildContext context,
    String amount,
    String realPay,
    String bonus,
  ) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: theme.dividerColor),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            amount,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4.h),
          Text(
            realPay,
            style: TextStyle(fontSize: 12.sp, color: theme.colorScheme.primary),
          ),
          SizedBox(height: 2.h),
          Text(
            bonus,
            style: TextStyle(fontSize: 10.sp, color: theme.hintColor),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomAmountOption(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: theme.dividerColor),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '自选金额',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4.h),
          Text(
            '仅限500元以上充值',
            style: TextStyle(fontSize: 10.sp, color: theme.hintColor),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionHistory(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final transactionsAsync = ref.watch(walletTransactionsProvider);

    return Container(
      color: theme.cardColor,
      padding: EdgeInsets.all(16.w),
      constraints: BoxConstraints(minHeight: 200.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '充值记录',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              transactionsAsync.when(
                data: (transactions) => Text(
                  '共${transactions.length}笔',
                  style: TextStyle(fontSize: 12.sp, color: theme.hintColor),
                ),
                loading: () => const SizedBox.shrink(),
                error: (_, _) => const SizedBox.shrink(),
              ),
            ],
          ),
          SizedBox(height: 32.h),
          transactionsAsync.when(
            data: (transactions) {
              if (transactions.isEmpty) {
                return Center(
                  child: Column(
                    children: [
                      Icon(
                        Symbols.edit_note,
                        size: 48.sp,
                        color: theme.disabledColor,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        '暂无充值记录',
                        style: TextStyle(
                          color: theme.hintColor,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Column(
                children: transactions
                    .map(
                      (t) => ListTile(
                        title: Text(t.title),
                        subtitle: Text(t.date),
                        trailing: Text(
                          '${t.type == 'recharge' ? '+' : '-'} ${t.amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: t.type == 'recharge'
                                ? theme.colorScheme.primary
                                : theme.textTheme.bodyLarge?.color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => Center(child: Text('加载失败: $error')),
          ),
        ],
      ),
    );
  }
}
