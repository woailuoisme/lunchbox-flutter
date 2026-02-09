class WalletTransactionModel {
  // 'recharge', 'consume'

  WalletTransactionModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.type,
  });

  final String id;
  final String title;
  final double amount;
  final String date;
  final String type;
}
