import 'package:budget_app/enums/transaction_type_enum.dart';
import 'package:budget_app/ui/home_screen/widgets/add_transaction_btn.dart';
import 'package:flutter/widgets.dart';

class AddTransactionButtons extends StatelessWidget {
  final Function(TransactionTypeEnum) addTransaction;

  const AddTransactionButtons({
    Key? key,
    required this.addTransaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AddTransactionBtn(
          label: 'Income',
          onPressed: () => addTransaction(TransactionTypeEnum.income),
          type: TransactionTypeEnum.income,
        ),
        const SizedBox(
          width: 15,
        ),
        AddTransactionBtn(
          label: 'Expense',
          onPressed: () => addTransaction(TransactionTypeEnum.expense),
          type: TransactionTypeEnum.expense,
        ),
      ],
    );
  }
}
