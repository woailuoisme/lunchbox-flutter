class MallProductModel {
  MallProductModel({
    required this.id,
    required this.title,
    required this.amountValue,
    required this.pointsCost,
    this.isHot = false,
  });

  final String id;
  final String title;
  final int amountValue;
  final int pointsCost;
  final bool isHot;
}
