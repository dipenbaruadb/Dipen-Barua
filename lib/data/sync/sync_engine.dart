import 'dart:async';

import '../../core/network/connectivity_service.dart';
import '../../core/services/logger_service.dart';
import '../datasources/local/hive_local_datasource.dart';
import '../datasources/remote/firestore_remote_datasource.dart';

class SyncEngine {
  final ConnectivityService connectivityService;
  final HiveLocalDataSource local;
  final FirestoreRemoteDataSource remote;
  StreamSubscription<bool>? _subscription;

  SyncEngine({required this.connectivityService, required this.local, required this.remote});

  void start() {
    _subscription = connectivityService.online$.listen((online) {
      if (online) {
        syncPendingChanges();
      }
    });
  }

  Future<void> syncPendingChanges() async {
    final pending = local.pendingSync();
    for (final item in pending) {
      try {
        await remote.upsert(
          collection: item['collection'] as String,
          docId: item['docId'] as String,
          payload: Map<String, dynamic>.from(item['payload'] as Map),
        );
        await local.markSynced(item['docId'] as String);
      } catch (e) {
        appLogger.e('Sync failed for ${item['docId']}: $e');
      }
    }
  }

  Future<void> dispose() async => _subscription?.cancel();
}
