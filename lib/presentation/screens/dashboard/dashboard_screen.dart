import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/app_providers.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final txns = ref.watch(transactionListProvider);
    final income = txns.where((e) => e.type == 'income').fold<double>(0, (a, b) => a + b.amount);
    final expense = txns.where((e) => e.type == 'expense').fold<double>(0, (a, b) => a + b.amount);
    final balance = income - expense;

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(child: ListTile(title: const Text('মোট ব্যালেন্স'), subtitle: Text('৳ ${balance.toStringAsFixed(2)}'))),
          Row(children: [
            Expanded(child: Card(child: ListTile(title: const Text('আয়'), subtitle: Text('৳ ${income.toStringAsFixed(2)}')))),
            Expanded(child: Card(child: ListTile(title: const Text('ব্যয়'), subtitle: Text('৳ ${expense.toStringAsFixed(2)}')))),
          ]),
          const SizedBox(height: 12),
          const Text('Income vs Expense'),
          SizedBox(
            height: 180,
            child: BarChart(BarChartData(barGroups: [
              BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: income, color: Colors.green)]),
              BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: expense, color: Colors.red)]),
            ])),
          ),
          const Divider(),
          const Text('সাম্প্রতিক লেনদেন'),
          ...txns.take(5).map((e) => ListTile(title: Text(e.categoryName), subtitle: Text(e.type), trailing: Text('৳${e.amount}'))),
          if (txns.any((e) => e.type == 'expense' && e.amount > 10000))
            const Card(color: Colors.orangeAccent, child: ListTile(title: Text('বড় ব্যয় সতর্কতা'))),
        ],
      ),
    );
  }
}
