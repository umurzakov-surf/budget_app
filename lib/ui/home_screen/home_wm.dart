import 'package:budget_app/enums/transaction_type_enum.dart';
import 'package:budget_app/service/model/transaction.dart';
import 'package:budget_app/service/repository/categories_repository.dart';
import 'package:budget_app/service/repository/transaction_repository.dart';
import 'package:budget_app/ui/home_screen/widgets/categories_modal.dart';
import 'package:budget_app/ui/transactions_screen/transactions_screen.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_model.dart';
import 'home_screen.dart';

HomeWM homeWmFactory(BuildContext context) {
  final transactionRepository = context.read<TransactionRepository>();

  return HomeWM(HomeModel(transactionRepository));
}

class HomeWM extends WidgetModel<HomeScreen, HomeModel> {
  final ValueNotifier<String> inputValNotifier = ValueNotifier('');

  ValueNotifier<int> get budgetValNotifier => model.budgetValNotifier;

  HomeWM(HomeModel model) : super(model);

  Future<void> addTransaction(TransactionTypeEnum type) async {
    if (inputValNotifier.value.isNotEmpty) {
      final categoriesList = CategoriesRepository().getByType(type);

      final category = await showDialog<String?>(
        context: context,
        builder: (_) {
          return CategoriesModal(categoriesList: categoriesList);
        },
      );

      if (category != null) {
        final transaction = Transaction(
          value: int.parse(inputValNotifier.value),
          category: category,
          type: type,
        );

        await model.addTransaction(transaction);
      }
      inputValNotifier.value = '';
    } else {
      _showSnackBar('Fill input');
    }
  }

  void addDigit(String digit) {
    if (inputValNotifier.value.isNotEmpty || digit != '0') {
      inputValNotifier.value += digit;
    }
  }

  void removeDigit() {
    inputValNotifier.value = inputValNotifier.value.isEmpty
        ? inputValNotifier.value
        : inputValNotifier.value
            .substring(0, inputValNotifier.value.length - 1);
  }

  void clearInput() {
    inputValNotifier.value = '';
  }

  void onTapTransactionsList() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => const TransactionsScreen()),
    );
  }

  void _showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      backgroundColor: Colors.redAccent,
    ));
  }
}
