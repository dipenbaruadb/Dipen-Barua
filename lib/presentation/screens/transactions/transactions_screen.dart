import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/app_providers.dart';

class TransactionsScreen extends ConsumerWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final txns = ref.watch(transactionListProvider);
    return SafeArea(
      child: ListView.builder(
        itemCount: txns.length,
        itemBuilder: (context, index) {
          final t = txns[index];
          return ListTile(
            leading: Icon(t.type == 'income' ? Icons.south_west : Icons.north_east),
            title: Text(t.categoryName),
            subtitle: Text('${t.paymentMethod} • ${t.date.toLocal()}'),
            trailing: Text('৳${t.amount.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}
