import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../core/network/connectivity_service.dart';
import '../../data/datasources/local/hive_local_datasource.dart';
import '../../data/datasources/remote/firestore_remote_datasource.dart';
import '../../data/models/transaction_model.dart';
import '../../data/repositories/transaction_repository_impl.dart';
import '../../data/sync/sync_engine.dart';
import '../../domain/repositories/transaction_repository.dart';

final uuidProvider = Provider((ref) => const Uuid());
final localDataSourceProvider = Provider((ref) => HiveLocalDataSource());
final remoteDataSourceProvider = Provider((ref) => FirestoreRemoteDataSource(FirebaseFirestore.instance));
final transactionRepositoryProvider = Provider<TransactionRepository>((ref) {
  return TransactionRepositoryImpl(ref.read(localDataSourceProvider));
});
final connectivityServiceProvider = Provider((ref) => ConnectivityService(Connectivity()));
final syncEngineProvider = Provider((ref) => SyncEngine(
      connectivityService: ref.read(connectivityServiceProvider),
      local: ref.read(localDataSourceProvider),
      remote: ref.read(remoteDataSourceProvider),
    ));

final transactionListProvider = StateNotifierProvider<TransactionController, List<TransactionModel>>((ref) {
  return TransactionController(ref.read(transactionRepositoryProvider));
});

class TransactionController extends StateNotifier<List<TransactionModel>> {
  final TransactionRepository repository;
  TransactionController(this.repository) : super(repository.getTransactions());

  Future<void> add(TransactionModel model) async {
    await repository.addTransaction(model);
    state = repository.getTransactions();
  }
}
