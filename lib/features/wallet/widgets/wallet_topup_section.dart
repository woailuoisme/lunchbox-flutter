import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/routes/routes.dart';

class WalletTopUpSection extends StatelessWidget {
  const WalletTopUpSection({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  final int selectedIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
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
              _TopUpSwitchItem(
                index: 0,
                selectedIndex: selectedIndex,
                onChanged: onChanged,
                child: _TopUpOption(
                  amount: '100元',
                  realPay: t.profile.walletPage.realPay(amount: 95),
                  bonus: t.profile.walletPage.noBonus,
                  isSelected: selectedIndex == 0,
                  isRecommended: false,
                ),
              ),
              _TopUpSwitchItem(
                index: 1,
                selectedIndex: selectedIndex,
                onChanged: onChanged,
                child: _TopUpOption(
                  amount: '300元',
                  realPay: t.profile.walletPage.realPay(amount: 285),
                  bonus: t.profile.walletPage.bonus(amount: 300),
                  isSelected: selectedIndex == 1,
                  isRecommended: true,
                ),
              ),
              _TopUpSwitchItem(
                index: 2,
                selectedIndex: selectedIndex,
                onChanged: onChanged,
                child: _TopUpOption(
                  amount: '500元',
                  realPay: t.profile.walletPage.realPay(amount: 475),
                  bonus: t.profile.walletPage.bonus(amount: 400),
                  isSelected: selectedIndex == 2,
                  isRecommended: false,
                ),
              ),
              _TopUpSwitchItem(
                index: 3,
                selectedIndex: selectedIndex,
                onChanged: onChanged,
                child: _CustomAmountOption(isSelected: selectedIndex == 3),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TopUpSwitchItem extends StatelessWidget {
  const _TopUpSwitchItem({
    required this.index,
    required this.selectedIndex,
    required this.onChanged,
    required this.child,
  });

  final int index;
  final int selectedIndex;
  final ValueChanged<int> onChanged;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ToggleSwitch(
          minWidth: constraints.maxWidth,
          minHeight: constraints.maxHeight,
          totalSwitches: 1,
          initialLabelIndex: selectedIndex == index ? 0 : null,
          activeBgColor: const [Colors.transparent],
          inactiveBgColor: Colors.transparent,
          dividerColor: Colors.transparent,
          borderWidth: 0,
          cornerRadius: 12.r,
          customWidgets: [SizedBox.expand(child: child)],
          onToggle: (_) {
            if (selectedIndex != index) {
              onChanged(index);
            }
          },
        );
      },
    );
  }
}

class _TopUpOption extends StatelessWidget {
  const _TopUpOption({
    required this.amount,
    required this.realPay,
    required this.bonus,
    required this.isSelected,
    required this.isRecommended,
  });

  final String amount;
  final String realPay;
  final String bonus;
  final bool isSelected;
  final bool isRecommended;

  @override
  Widget build(BuildContext context) {
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
}

class _CustomAmountOption extends StatelessWidget {
  const _CustomAmountOption({required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
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
}
