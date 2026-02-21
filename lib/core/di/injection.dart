import 'package:hive_flutter/hive_flutter.dart';

import '../../data/models/category_model.dart';
import '../../data/models/loan_model.dart';
import '../../data/models/saving_goal_model.dart';
import '../../data/models/shopping_list_model.dart';
import '../../data/models/transaction_model.dart';
import '../../data/models/user_profile_model.dart';

Future<void> configureDependencies() async {
  await Hive.initFlutter();
  Hive
    ..registerAdapter(TransactionModelAdapter())
    ..registerAdapter(CategoryModelAdapter())
    ..registerAdapter(SavingGoalModelAdapter())
    ..registerAdapter(LoanModelAdapter())
    ..registerAdapter(ShoppingItemModelAdapter())
    ..registerAdapter(ShoppingListModelAdapter())
    ..registerAdapter(UserProfileModelAdapter());

  await Future.wait([
    Hive.openBox<TransactionModel>('transactions'),
    Hive.openBox<CategoryModel>('categories'),
    Hive.openBox<SavingGoalModel>('saving_goals'),
    Hive.openBox<LoanModel>('loans'),
    Hive.openBox<ShoppingListModel>('shopping_lists'),
    Hive.openBox<UserProfileModel>('profiles'),
    Hive.openBox<Map>('sync_queue'),
  ]);
}
