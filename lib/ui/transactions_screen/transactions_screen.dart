import 'package:budget_app/service/model/transaction.dart';
import 'package:budget_app/ui/transactions_screen/transactions_screen_wm.dart';
import 'package:budget_app/ui/transactions_screen/widgets/transaction_tile.dart';
import 'package:budget_app/ui/transactions_screen/widgets/transactions_list.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

class TransactionsScreen extends ElementaryWidget<TransactionsScreenWM> {
  const TransactionsScreen({Key? key})
      : super(transactionsScreenWMFactory, key: key);

  @override
  Widget build(TransactionsScreenWM wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions list'),
      ),
      body: EntityStateNotifierBuilder<List<Transaction>>(
        listenableEntityState: wm.transactionsListState,
        builder: (_, data) {
          if (data == null) {
            return const CircularProgressIndicator();
          }

          return TransactionsList(transactions: data);
        },
      ),
    );
  }
}
