import 'package:budget_app/service/model/transaction.dart';
import 'package:flutter/material.dart';

class CategoriesModal extends StatelessWidget {
  const CategoriesModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: TransactionCategory.values
            .map((category) => Container(
                  color: Colors.lightBlue,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: MaterialButton(
                    height: 40,
                    minWidth: double.infinity,
                    onPressed: () {
                      Navigator.of(context).pop<TransactionCategory>(category);
                    },
                    child: Text('$category'),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
