import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:lunchbox/features/profile/repositories/wallet_repository.dart';
import 'package:lunchbox/i18n/translations.g.dart';

class WalletView extends ConsumerWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(t.profile.walletPage.title),
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
          SliverToBoxAdapter(child: SizedBox(height: 32.h)),
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
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  theme.colorScheme.primary,
                  theme.colorScheme.primary.withValues(alpha: 0.8),
                ],
              ),
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.primary.withValues(alpha: 0.3),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Symbols.account_balance_wallet,
                      size: 18.sp,
                      color: theme.colorScheme.onPrimary.withValues(alpha: 0.9),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      t.profile.walletPage.balance,
                      style: TextStyle(
                        color: theme.colorScheme.onPrimary.withValues(
                          alpha: 0.9,
                        ),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '¥ ${balance.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: theme.colorScheme.onPrimary,
                        fontSize: 36.sp,
                        fontWeight: FontWeight.bold,
                        height: 1.0,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surface.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(24.r),
                        border: Border.all(
                          color: theme.colorScheme.surface.withValues(
                            alpha: 0.3,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Symbols.add,
                            color: theme.colorScheme.onPrimary,
                            size: 16.sp,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            t.profile.walletPage.topUp,
                            style: TextStyle(
                              color: theme.colorScheme.onPrimary,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: -20,
            top: -20,
            child: Icon(
              Symbols.account_balance_wallet,
              size: 120.sp,
              color: theme.colorScheme.onPrimary.withValues(alpha: 0.1),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopUpSection(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                t.profile.walletPage.selectAmount,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {
                  // TODO: Show rules dialog
                },
                borderRadius: BorderRadius.circular(12.r),
                child: Padding(
                  padding: EdgeInsets.all(4.w),
                  child: Row(
                    children: [
                      Icon(
                        Symbols.info,
                        size: 14.sp,
                        color: theme.colorScheme.primary,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        t.profile.walletPage.rule,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: theme.colorScheme.primary.withValues(alpha: 0.1),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Symbols.campaign,
                  size: 16.sp,
                  color: theme.colorScheme.primary,
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    t.profile.walletPage.ruleDesc,
                    style: TextStyle(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 12.w,
            crossAxisSpacing: 12.w,
            childAspectRatio: 2.2,
            children: [
              _buildTopUpOption(
                context,
                '100元',
                t.profile.walletPage.realPay(amount: 95),
                t.profile.walletPage.noBonus,
                false,
              ),
              _buildTopUpOption(
                context,
                '300元',
                t.profile.walletPage.realPay(amount: 285),
                t.profile.walletPage.bonus(amount: 300),
                true, // Highlight recommended option
              ),
              _buildTopUpOption(
                context,
                '500元',
                t.profile.walletPage.realPay(amount: 475),
                t.profile.walletPage.bonus(amount: 400),
                false,
              ),
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
    bool isRecommended,
  ) {
    final theme = Theme.of(context);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: isRecommended
                ? theme.colorScheme.primary.withValues(alpha: 0.05)
                : theme.cardColor,
            border: Border.all(
              color: isRecommended
                  ? theme.colorScheme.primary
                  : theme.dividerColor,
              width: isRecommended ? 1.5 : 1,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                amount,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: isRecommended
                      ? theme.colorScheme.primary
                      : theme.textTheme.bodyLarge?.color,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                bonus,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: isRecommended
                      ? theme.colorScheme.primary
                      : theme.hintColor,
                  fontWeight: isRecommended
                      ? FontWeight.w600
                      : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
        if (isRecommended)
          Positioned(
            top: -8,
            right: -8,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: theme.colorScheme.error,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8.r),
                  bottomLeft: Radius.circular(8.r),
                ),
              ),
              child: Text(
                'HOT',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildCustomAmountOption(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: theme.dividerColor),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            t.profile.walletPage.customAmount,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4.h),
          Text(
            t.profile.walletPage.customAmountHint,
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
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      constraints: BoxConstraints(minHeight: 200.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
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
                    t.profile.walletPage.history,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              transactionsAsync.when(
                data: (transactions) => Text(
                  t.profile.walletPage.historyCount(count: transactions.length),
                  style: TextStyle(fontSize: 12.sp, color: theme.hintColor),
                ),
                loading: () => const SizedBox.shrink(),
                error: (_, _) => const SizedBox.shrink(),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          transactionsAsync.when(
            data: (transactions) {
              if (transactions.isEmpty) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 32.h),
                    child: Column(
                      children: [
                        Icon(
                          Symbols.receipt_long,
                          size: 48.sp,
                          color: theme.disabledColor.withValues(alpha: 0.3),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          t.profile.walletPage.noHistory,
                          style: TextStyle(
                            color: theme.hintColor,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: transactions.length,
                separatorBuilder: (context, index) => Divider(
                  height: 1,
                  color: theme.dividerColor.withValues(alpha: 0.5),
                  indent: 56.w,
                ),
                itemBuilder: (context, index) {
                  final transaction = transactions[index];
                  final isRecharge = transaction.type == 'recharge';
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: Row(
                      children: [
                        Container(
                          width: 40.w,
                          height: 40.w,
                          decoration: BoxDecoration(
                            color: isRecharge
                                ? theme.colorScheme.primaryContainer
                                : theme.colorScheme.secondaryContainer,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            isRecharge
                                ? Symbols.account_balance_wallet
                                : Symbols.shopping_bag,
                            size: 20.sp,
                            color: isRecharge
                                ? theme.colorScheme.primary
                                : theme.colorScheme.secondary,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                transaction.title,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                transaction.date,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: theme.hintColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '${isRecharge ? '+' : '-'} ${transaction.amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: isRecharge
                                ? theme.colorScheme.primary
                                : theme.textTheme.bodyLarge?.color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            loading: () => const Center(
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: CircularProgressIndicator(),
              ),
            ),
            error: (error, _) => Center(
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Text('${t.common.loadFailed}: $error'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
