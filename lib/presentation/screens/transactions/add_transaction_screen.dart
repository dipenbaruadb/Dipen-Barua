import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_constants.dart';
import '../../../data/models/transaction_model.dart';
import '../../providers/app_providers.dart';

class AddTransactionScreen extends ConsumerStatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  ConsumerState<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends ConsumerState<AddTransactionScreen> {
  final amountController = TextEditingController();
  String type = 'expense';
  String paymentMethod = AppConstants.paymentMethods.first;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          DropdownButtonFormField(
            value: type,
            items: const [
              DropdownMenuItem(value: 'expense', child: Text('Expense')),
              DropdownMenuItem(value: 'income', child: Text('Income')),
              DropdownMenuItem(value: 'loan_given', child: Text('Loan Given')),
              DropdownMenuItem(value: 'loan_taken', child: Text('Loan Taken')),
              DropdownMenuItem(value: 'gift', child: Text('Gift')),
            ],
            onChanged: (v) => setState(() => type = v!),
          ),
          TextField(controller: amountController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Amount')),
          DropdownButtonFormField(
            value: paymentMethod,
            items: AppConstants.paymentMethods.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
            onChanged: (v) => setState(() => paymentMethod = v!),
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () async {
              final now = DateTime.now();
              final id = ref.read(uuidProvider).v4();
              await ref.read(transactionListProvider.notifier).add(TransactionModel(
                    id: id,
                    userId: 'local-user',
                    type: type,
                    amount: double.tryParse(amountController.text) ?? 0,
                    currency: 'BDT',
                    categoryId: type,
                    categoryName: type,
                    date: now,
                    paymentMethod: paymentMethod,
                    createdAt: now,
                    updatedAt: now,
                  ));
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('সংরক্ষিত হয়েছে (offline-first)')));
              }
            },
            child: const Text('Save'),
          ),
        ]),
      ),
    );
  }
}
