import 'package:budget_app/service/model/transaction.dart';
import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  final Transaction transaction;
  final String sign;
  final Color color;

  TransactionTile({
    Key? key,
    required this.transaction,
  })  : sign = transaction.type == TransactionType.income ? '+' : '-',
        color = transaction.type == TransactionType.income
            ? Colors.green
            : Colors.red,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      leading: CircleAvatar(
        child: Image.network(transaction.icon),
      ),
      title: Text(
        '$sign ${transaction.value}',
        style: TextStyle(color: color),
      ),
      subtitle: Text('${transaction.category}'),
    );
  }
}
