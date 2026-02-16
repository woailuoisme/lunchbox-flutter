import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:lunchbox/features/wallet/repositories/wallet_repository.dart';
import 'package:lunchbox/routes/routes.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lunchbox/features/wallet/entities/wallet_transaction_model.dart';

class WalletView extends ConsumerStatefulWidget {
  const WalletView({super.key});

  @override
  ConsumerState<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends ConsumerState<WalletView> {
  int _selectedTopUpIndex = 1;
  late final PagingController<int, WalletTransactionModel> _pagingController;

  @override
  void initState() {
    super.initState();
    _pagingController = PagingController<int, WalletTransactionModel>(
      getNextPageKey: (state) {
        if (state.pages == null || state.pages!.isEmpty) {
          return 1;
        }
        final lastPageItemCount = state.pages!.last.length;
        if (lastPageItemCount < 10) {
          return null;
        }
        return (state.keys?.last ?? 0) + 1;
      },
      fetchPage: (pageKey) => _fetchPage(pageKey),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<List<WalletTransactionModel>> _fetchPage(int pageKey) async {
    return await ref
        .read(walletRepositoryProvider.notifier)
        .getTransactionsPaginated(page: pageKey, pageSize: 10);
  }

  @override
  Widget build(BuildContext context) {
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
          SliverToBoxAdapter(child: _buildHistoryHeader(context)),
          SliverPadding(
            padding: EdgeInsets.only(bottom: 32.h),
            sliver: PagingListener(
              controller: _pagingController,
              builder: (context, state, fetchNextPage) =>
                  PagedSliverList<int, WalletTransactionModel>(
                    state: state,
                    fetchNextPage: fetchNextPage,
                    builderDelegate:
                        PagedChildBuilderDelegate<WalletTransactionModel>(
                          itemBuilder: (context, item, index) =>
                              _buildTransactionItem(context, item),
                          noItemsFoundIndicatorBuilder: (context) =>
                              _buildNoHistory(context),
                          firstPageProgressIndicatorBuilder: (context) =>
                              const Center(child: CircularProgressIndicator()),
                          newPageProgressIndicatorBuilder: (context) =>
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                        ),
                  ),
            ),
          ),
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
                  const WalletRulesRoute().push<void>(context);
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
              _buildTopUpSwitchItem(
                context,
                index: 0,
                child: _buildTopUpOption(
                  context,
                  '100元',
                  t.profile.walletPage.realPay(amount: 95),
                  t.profile.walletPage.noBonus,
                  _selectedTopUpIndex == 0,
                  false,
                ),
              ),
              _buildTopUpSwitchItem(
                context,
                index: 1,
                child: _buildTopUpOption(
                  context,
                  '300元',
                  t.profile.walletPage.realPay(amount: 285),
                  t.profile.walletPage.bonus(amount: 300),
                  _selectedTopUpIndex == 1,
                  true,
                ),
              ),
              _buildTopUpSwitchItem(
                context,
                index: 2,
                child: _buildTopUpOption(
                  context,
                  '500元',
                  t.profile.walletPage.realPay(amount: 475),
                  t.profile.walletPage.bonus(amount: 400),
                  _selectedTopUpIndex == 2,
                  false,
                ),
              ),
              _buildTopUpSwitchItem(
                context,
                index: 3,
                child: _buildCustomAmountOption(
                  context,
                  _selectedTopUpIndex == 3,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTopUpSwitchItem(
    BuildContext context, {
    required int index,
    required Widget child,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ToggleSwitch(
          minWidth: constraints.maxWidth,
          minHeight: constraints.maxHeight,
          totalSwitches: 1,
          initialLabelIndex: _selectedTopUpIndex == index ? 0 : null,
          activeBgColor: const [Colors.transparent],
          inactiveBgColor: Colors.transparent,
          dividerColor: Colors.transparent,
          borderWidth: 0,
          cornerRadius: 12.r,
          customWidgets: [SizedBox.expand(child: child)],
          onToggle: (_) {
            if (_selectedTopUpIndex != index) {
              setState(() {
                _selectedTopUpIndex = index;
              });
            }
          },
        );
      },
    );
  }

  Widget _buildTopUpOption(
    BuildContext context,
    String amount,
    String realPay,
    String bonus,
    bool isSelected,
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
            color: isSelected
                ? theme.colorScheme.primary.withValues(alpha: 0.05)
                : theme.cardColor,
            border: Border.all(
              color: isSelected
                  ? theme.colorScheme.primary
                  : theme.dividerColor,
              width: isSelected ? 1.5 : 1,
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
                  color: isSelected
                      ? theme.colorScheme.primary
                      : theme.textTheme.bodyLarge?.color,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                bonus,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: isSelected
                      ? theme.colorScheme.primary
                      : theme.hintColor,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
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

  Widget _buildCustomAmountOption(BuildContext context, bool isSelected) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: isSelected
            ? theme.colorScheme.primary.withValues(alpha: 0.05)
            : theme.cardColor,
        border: Border.all(
          color: isSelected ? theme.colorScheme.primary : theme.dividerColor,
          width: isSelected ? 1.5 : 1,
        ),
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

  Widget _buildHistoryHeader(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
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
            t.profile.walletPage.history,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: theme.textTheme.titleMedium?.color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(
    BuildContext context,
    WalletTransactionModel transaction,
  ) {
    final theme = Theme.of(context);
    final isRecharge = transaction.type == 'recharge';

    final iconColor = isRecharge
        ? const Color(0xFF4CAF50)
        : const Color(0xFFF44336);
    final backgroundColor = isRecharge
        ? const Color(0xFFE8F5E9)
        : const Color(0xFFFFEBEE);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: theme.brightness == Brightness.dark
                  ? iconColor.withValues(alpha: 0.2)
                  : backgroundColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              isRecharge ? Symbols.add : Symbols.remove,
              size: 20.sp,
              color: iconColor,
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
                    color: theme.textTheme.bodyLarge?.color,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  transaction.date,
                  style: TextStyle(fontSize: 12.sp, color: theme.hintColor),
                ),
              ],
            ),
          ),
          Text(
            '${isRecharge ? '+' : '-'} ${transaction.amount.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: iconColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoHistory(BuildContext context) {
    final theme = Theme.of(context);
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
              style: TextStyle(color: theme.hintColor, fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}
