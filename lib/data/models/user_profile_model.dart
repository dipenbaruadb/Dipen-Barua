import 'package:hive/hive.dart';

part 'user_profile_model.g.dart';

@HiveType(typeId: 6)
class UserProfileModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String phone;
  @HiveField(4)
  final String language;
  @HiveField(5)
  final String currency;
  @HiveField(6)
  final DateTime createdAt;

  UserProfileModel({required this.id, required this.name, required this.email, required this.phone, required this.language, required this.currency, required this.createdAt});
}
