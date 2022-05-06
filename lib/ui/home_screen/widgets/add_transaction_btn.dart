import 'package:budget_app/enums/transaction_type_enum.dart';
import 'package:flutter/material.dart';

class AddTransactionBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final TransactionTypeEnum type;
  final Color btnColor;

  const AddTransactionBtn({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.type,
  })  : btnColor =
            type == TransactionTypeEnum.income ? const Color(0xff00c79c) : const Color(0xffdb7059),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).colorScheme.primaryContainer,
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
