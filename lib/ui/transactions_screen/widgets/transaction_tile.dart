import 'package:budget_app/enums/transaction_type_enum.dart';
import 'package:budget_app/service/model/transaction.dart';
import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  final Transaction transaction;
  final String sign;
  final Color color;
  final IconData icon;

  TransactionTile({
    Key? key,
    required this.transaction,
  })  : sign = transaction.type == TransactionTypeEnum.income ? '+' : '-',
        color = transaction.type == TransactionTypeEnum.income
            ? const Color(0xff00c79c)
            : const Color(0xffdb7059),
        icon = transaction.type == TransactionTypeEnum.income
            ? Icons.add
            : Icons.remove,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      tileColor: Theme.of(context).colorScheme.primaryVariant,
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: color),
        ),
        child: Icon(icon, color: color),
      ),
      title: Text(
        '$sign ${transaction.value}',
        style: TextStyle(color: color),
      ),
      subtitle: Text(transaction.category, style: const TextStyle(color: Colors.white),),
    );
  }
}
