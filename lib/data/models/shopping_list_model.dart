import 'package:hive/hive.dart';

part 'shopping_list_model.g.dart';

@HiveType(typeId: 4)
class ShoppingItemModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final double plannedPrice;
  @HiveField(2)
  final double actualPrice;
  @HiveField(3)
  final bool isPurchased;

  ShoppingItemModel({required this.name, required this.plannedPrice, required this.actualPrice, required this.isPurchased});
}

@HiveType(typeId: 5)
class ShoppingListModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String userId;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final List<ShoppingItemModel> items;
  @HiveField(4)
  final bool isSynced;

  ShoppingListModel({required this.id, required this.userId, required this.title, required this.items, this.isSynced = false});
}
