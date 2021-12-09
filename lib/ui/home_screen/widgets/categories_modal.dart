import 'package:budget_app/service/model/transaction_category.dart';
import 'package:flutter/material.dart';

class CategoriesModal extends StatelessWidget {
  final List<TransactionCategory> categoriesList;

  const CategoriesModal({
    Key? key,
    required this.categoriesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: categoriesList
            .map((category) => Container(
                  color: Colors.lightBlue,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: MaterialButton(
                    height: 40,
                    minWidth: double.infinity,
                    onPressed: () {
                      Navigator.of(context).pop<String>(category.label);
                    },
                    child: Text(category.label),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
