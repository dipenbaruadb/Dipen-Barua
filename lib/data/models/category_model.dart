import 'package:hive/hive.dart';

part 'category_model.g.dart';

@HiveType(typeId: 1)
class CategoryModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String userId;
  @HiveField(2)
  final String nameBn;
  @HiveField(3)
  final String nameEn;
  @HiveField(4)
  final String icon;
  @HiveField(5)
  final int color;
  @HiveField(6)
  final String type;
  @HiveField(7)
  final bool isSynced;

  CategoryModel({
    required this.id,
    required this.userId,
    required this.nameBn,
    required this.nameEn,
    required this.icon,
    required this.color,
    required this.type,
    this.isSynced = false,
  });
}
