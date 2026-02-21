import 'package:hive/hive.dart';

import '../../models/transaction_model.dart';

class HiveLocalDataSource {
  final Box<TransactionModel> transactionBox = Hive.box<TransactionModel>('transactions');
  final Box<Map> syncQueue = Hive.box<Map>('sync_queue');

  Future<void> saveTransaction(TransactionModel transaction) async {
    await transactionBox.put(transaction.id, transaction);
    await syncQueue.put(transaction.id, {
      'collection': 'transactions',
      'docId': transaction.id,
      'payload': transaction.toJson(),
      'updatedAt': transaction.updatedAt.toIso8601String(),
      'operation': 'upsert',
    });
  }

  List<TransactionModel> allTransactions() => transactionBox.values.toList();

  List<Map> pendingSync() => syncQueue.values.toList();

  Future<void> markSynced(String id) async => syncQueue.delete(id);
}
