import 'dart:convert';

class WaterIntake {
  final int amount;
  final DateTime date;
  final String userId;
  final String id;
  WaterIntake({
    required this.amount,
    required this.date,
    required this.userId,
    required this.id,
  });

  WaterIntake copyWith({
    int? amount,
    DateTime? date,
    String? userId,
    String? id,
  }) {
    return WaterIntake(
      amount: amount ?? this.amount,
      date: date ?? this.date,
      userId: userId ?? this.userId,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'date': date.millisecondsSinceEpoch,
      'user_id': userId,
    };
  }

  factory WaterIntake.fromMap(Map<String, dynamic> map) {
    return WaterIntake(
      amount: map['amount'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      userId: map['user_id'],
      id: map['\$id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WaterIntake.fromJson(String source) => WaterIntake.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WaterIntake(amount: $amount, date: $date, userId: $userId, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is WaterIntake &&
      other.amount == amount &&
      other.date == date &&
      other.userId == userId &&
      other.id == id;
  }

  @override
  int get hashCode {
    return amount.hashCode ^
      date.hashCode ^
      userId.hashCode ^
      id.hashCode;
  }
}
