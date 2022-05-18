import 'package:budget_app/enums/transaction_type_enum.dart';
import 'package:budget_app/service/model/transaction.dart';
import 'package:budget_app/service/repository/categories_repository.dart';
import 'package:budget_app/service/repository/transaction_repository.dart';
import 'package:budget_app/ui/home_screen/widgets/categories_modal.dart';
import 'package:budget_app/ui/transactions_screen/transactions_screen.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_model.dart';
import 'home_screen.dart';
import 'methods/dialog_helper.dart';
import 'methods/navigation_helper.dart';
import 'methods/snack_helper.dart';

HomeWM homeWmFactory(BuildContext context) {
  return HomeWM(
    HomeModel(context.read<TransactionRepository>()),
    DialogHelper(),
    NavigationHelper(),
    SnackHelper(),
  );
}

class HomeWM extends WidgetModel<HomeScreen, HomeModel> {
  final ValueNotifier<String> inputValNotifier = ValueNotifier('');
  final DialogHelper _dialogHelper;
  final NavigationHelper _navigationHelper;
  final SnackHelper _snackHelper;

  ValueNotifier<int> get budgetValNotifier => model.budgetValNotifier;

  HomeWM(
    HomeModel model,
    this._dialogHelper,
    this._navigationHelper,
    this._snackHelper,
  ) : super(model);

  Future<void> addTransaction(TransactionTypeEnum type) async {
    if (inputValNotifier.value.isNotEmpty) {
      final categoriesList = CategoriesRepository().getByType(type);

      final category = await _dialogHelper.showCustomDialog<String>(
        context: context,
        builder: (context) => CategoriesModal(categoriesList: categoriesList),
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
    _navigationHelper.push(
      context,
      MaterialPageRoute<void>(builder: (_) => const TransactionsScreen()),
    );
  }

  void _showSnackBar(String text) {
    _snackHelper.showSnack(
      context,
      SnackBar(
        content: Text(text),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
