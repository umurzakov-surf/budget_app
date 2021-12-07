import 'package:budget_app/service/model/transaction.dart';
import 'package:budget_app/service/repository/transaction_repository.dart';
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

  ValueNotifier<int> get budgetNotifier => model.transactionRepository.budgetNotifier;
  ValueNotifier<String> get inputValNotifier  => model.inputValNotifier;

  HomeWM(HomeModel model) : super(model);

  @override
  void initWidgetModel() {
    _loadTransactions();
    super.initWidgetModel();
  }

  void addTransaction(TransactionType type) {
    model.addTransaction(type);
  }

  void addDigit(String digit) {
    if(inputValNotifier.value.isNotEmpty || digit != '0') model.addDigit(digit);
  }

  void removeDigit() {
    model.removeDigit();
  }

  void clearInput() {
    model.clearInput();
  }

  void onTapTransactionsList() {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => const TransactionsScreen()));
  }

  void _loadTransactions() {
    model.loadTransactions();
  }
}
