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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: categoriesList
            .map((category) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: MaterialButton(
                    color: Theme.of(context).colorScheme.primaryVariant,
                    height: 40,
                    minWidth: double.infinity,
                    onPressed: () {
                      Navigator.of(context).pop<String>(category.label);
                    },
                    child: Text(
                      category.label,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
