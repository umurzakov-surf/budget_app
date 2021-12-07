import 'package:budget_app/service/model/transaction.dart';
import 'package:budget_app/ui/transactions_screen/transactions_screen_wm.dart';
import 'package:budget_app/ui/transactions_screen/widgets/transaction_tile.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TransactionsScreen extends ElementaryWidget<TransactionsScreenWM> {
  const TransactionsScreen({Key? key})
      : super(transactionsScreenWMFactory, key: key);

  @override
  Widget build(TransactionsScreenWM wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions list'),
      ),
      body: ValueListenableBuilder<List<Transaction>>(
        valueListenable: wm.transactionsListState,
        builder: (_, data, __) {
          if (data.isEmpty) {
            return const CircularProgressIndicator();
          }

          return ListView(
            children: [
              for (final transaction in data)
                TransactionTile(transaction: transaction),
            ],
          );
        },
      ),
    );
  }
}
