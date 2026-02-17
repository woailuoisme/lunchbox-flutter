class MallProductModel {
  MallProductModel({
    required this.id,
    required this.title,
    required this.amountValue,
    required this.pointsCost,
    required this.type,
    this.isHot = false,
  });

  final String id;
  final String title;
  final int amountValue;
  final int pointsCost;
  final String type;
  final bool isHot;
}
