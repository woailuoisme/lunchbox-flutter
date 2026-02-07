class LotteryPrize {
  const LotteryPrize({
    required this.id,
    required this.name,
    required this.amount,
    required this.type,
    required this.createdAt,
    this.expiredAt,
    this.usedAt,
    this.isUsed = false,
  });

  factory LotteryPrize.fromJson(Map<String, dynamic> json) {
    return LotteryPrize(
      id: json['id'] as String,
      name: json['name'] as String,
      amount: (json['amount'] as num).toDouble(),
      type: json['type'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      expiredAt: json['expired_at'] != null
          ? DateTime.parse(json['expired_at'] as String)
          : null,
      usedAt: json['used_at'] != null
          ? DateTime.parse(json['used_at'] as String)
          : null,
      isUsed: json['is_used'] as bool? ?? false,
    );
  }

  final String id;
  final String name;
  final double amount;
  final String type; // 'coupon', 'coin'
  final DateTime createdAt;
  final DateTime? expiredAt;
  final DateTime? usedAt;
  final bool isUsed;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'amount': amount,
      'type': type,
      'created_at': createdAt.toIso8601String(),
      'expired_at': expiredAt?.toIso8601String(),
      'used_at': usedAt?.toIso8601String(),
      'is_used': isUsed,
    };
  }

  LotteryPrize copyWith({
    String? id,
    String? name,
    double? amount,
    String? type,
    DateTime? createdAt,
    DateTime? expiredAt,
    DateTime? usedAt,
    bool? isUsed,
  }) {
    return LotteryPrize(
      id: id ?? this.id,
      name: name ?? this.name,
      amount: amount ?? this.amount,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      expiredAt: expiredAt ?? this.expiredAt,
      usedAt: usedAt ?? this.usedAt,
      isUsed: isUsed ?? this.isUsed,
    );
  }
}
