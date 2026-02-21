import 'package:hive/hive.dart';

part 'loan_model.g.dart';

@HiveType(typeId: 3)
class LoanModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String userId;
  @HiveField(2)
  final String personName;
  @HiveField(3)
  final double amount;
  @HiveField(4)
  final double paidAmount;
  @HiveField(5)
  final double remainingAmount;
  @HiveField(6)
  final DateTime dueDate;
  @HiveField(7)
  final String status;
  @HiveField(8)
  final bool isSynced;

  LoanModel({required this.id, required this.userId, required this.personName, required this.amount, required this.paidAmount, required this.remainingAmount, required this.dueDate, required this.status, this.isSynced = false});
}
