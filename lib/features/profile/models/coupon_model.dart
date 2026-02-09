class CouponModel {
  // 0: available, 1: used, 2: expired

  CouponModel({
    required this.id,
    required this.amount,
    required this.title,
    required this.condition,
    required this.expiryDate,
    required this.status,
  });

  final int id;
  final int amount;
  final String title;
  final String condition;
  final String expiryDate;
  final int status;
}
