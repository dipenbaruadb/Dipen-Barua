import '../../domain/repositories/transaction_repository.dart';
import '../datasources/local/hive_local_datasource.dart';
import '../models/transaction_model.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final HiveLocalDataSource local;

  TransactionRepositoryImpl(this.local);

  @override
  Future<void> addTransaction(TransactionModel transaction) => local.saveTransaction(transaction);

  @override
  List<TransactionModel> getTransactions() => local.allTransactions();
}
