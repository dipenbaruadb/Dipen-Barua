import 'package:hive/hive.dart';

part 'transaction_model.g.dart';

@HiveType(typeId: 0)
class TransactionModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String userId;
  @HiveField(2)
  final String type;
  @HiveField(3)
  final double amount;
  @HiveField(4)
  final String currency;
  @HiveField(5)
  final String categoryId;
  @HiveField(6)
  final String categoryName;
  @HiveField(7)
  final DateTime date;
  @HiveField(8)
  final String paymentMethod;
  @HiveField(9)
  final String? note;
  @HiveField(10)
  final List<String> tags;
  @HiveField(11)
  final bool isRecurring;
  @HiveField(12)
  final String? recurringFrequency;
  @HiveField(13)
  final DateTime createdAt;
  @HiveField(14)
  final DateTime updatedAt;
  @HiveField(15)
  final bool isSynced;

  TransactionModel({
    required this.id,
    required this.userId,
    required this.type,
    required this.amount,
    required this.currency,
    required this.categoryId,
    required this.categoryName,
    required this.date,
    required this.paymentMethod,
    this.note,
    this.tags = const [],
    this.isRecurring = false,
    this.recurringFrequency,
    required this.createdAt,
    required this.updatedAt,
    this.isSynced = false,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'type': type,
        'amount': amount,
        'currency': currency,
        'categoryId': categoryId,
        'categoryName': categoryName,
        'date': date.toIso8601String(),
        'paymentMethod': paymentMethod,
        'note': note,
        'tags': tags,
        'isRecurring': isRecurring,
        'recurringFrequency': recurringFrequency,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };
}
