import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/wallet/repositories/wallet_repository.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lunchbox/features/wallet/entities/wallet_transaction_model.dart';
import 'package:lunchbox/features/wallet/widgets/wallet_balance_card.dart';
import 'package:lunchbox/features/wallet/widgets/wallet_transaction_item.dart';
import 'package:lunchbox/features/wallet/widgets/wallet_topup_section.dart';
import 'package:lunchbox/features/wallet/widgets/wallet_history_header.dart';
import 'package:lunchbox/features/wallet/widgets/wallet_no_history.dart';

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
          const SliverToBoxAdapter(child: WalletBalanceCard()),
          SliverToBoxAdapter(child: SizedBox(height: 16.h)),
          SliverToBoxAdapter(
            child: WalletTopUpSection(
              selectedIndex: _selectedTopUpIndex,
              onChanged: (index) {
                setState(() {
                  _selectedTopUpIndex = index;
                });
              },
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16.h)),
          const SliverToBoxAdapter(child: WalletHistoryHeader()),
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
                              WalletTransactionItem(transaction: item),
                          noItemsFoundIndicatorBuilder: (context) =>
                              const WalletNoHistory(),
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
}
