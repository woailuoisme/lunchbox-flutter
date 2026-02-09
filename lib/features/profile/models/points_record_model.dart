class PointsRecordModel {
  // 'gain' or 'use'

  PointsRecordModel({
    required this.id,
    required this.title,
    required this.points,
    required this.date,
    required this.type,
  });

  final String id;
  final String title;
  final int points; // + or -
  final String date;
  final String type;
}
