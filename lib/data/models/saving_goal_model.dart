import 'package:hive/hive.dart';

part 'saving_goal_model.g.dart';

@HiveType(typeId: 2)
class SavingGoalModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String userId;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final double targetAmount;
  @HiveField(4)
  final double savedAmount;
  @HiveField(5)
  final double monthlyContribution;
  @HiveField(6)
  final DateTime startDate;
  @HiveField(7)
  final DateTime targetDate;
  @HiveField(8)
  final bool isSynced;

  SavingGoalModel({required this.id, required this.userId, required this.name, required this.targetAmount, required this.savedAmount, required this.monthlyContribution, required this.startDate, required this.targetDate, this.isSynced = false});
}
