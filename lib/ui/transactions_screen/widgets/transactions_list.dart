import 'package:budget_app/service/model/transaction.dart';
import 'package:budget_app/ui/transactions_screen/widgets/transaction_tile.dart';
import 'package:flutter/material.dart';

class TransactionsList extends StatefulWidget {
  final List<Transaction> transactions;

  const TransactionsList({
    Key? key,
    required this.transactions,
  }) : super(key: key);

  @override
  _TransactionsListState createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(10),
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return TransactionTile(transaction: widget.transactions[index], index: index,);
      },
      itemCount: widget.transactions.length,
      separatorBuilder: (context, index) {
        return const Divider(thickness: 1);
      },
    );
  }
}
