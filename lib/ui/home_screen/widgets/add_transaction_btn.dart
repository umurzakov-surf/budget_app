import 'package:budget_app/service/model/transaction.dart';
import 'package:flutter/material.dart';

class AddTransactionBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final TransactionType type;
  final Color btnColor;

  const AddTransactionBtn({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.type,
  })  : btnColor = type == TransactionType.income ? Colors.green : Colors.red,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          elevation: 0,
          side: BorderSide(color: btnColor),
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        child: Text(
          label,
          style: TextStyle(color: btnColor, fontSize: 16),
        ),
      ),
    );
  }
}
