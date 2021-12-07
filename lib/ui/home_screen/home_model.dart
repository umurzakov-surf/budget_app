import 'package:budget_app/service/model/transaction.dart';
import 'package:budget_app/service/repository/transaction_repository.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/widgets.dart';

class HomeModel extends ElementaryModel {
  final ValueNotifier<String> inputValNotifier = ValueNotifier('');
  final ValueNotifier<int> budgetValNotifier = ValueNotifier(0);
  final TransactionRepository _transactionRepository;

  HomeModel(this._transactionRepository) : super();

  void addTransaction(Transaction transaction) {
    _transactionRepository.addTransaction(transaction);
  }

  void loadBudget() {
    var budget = 0;
    final transactionsList = _transactionRepository.getTransactions();

    for (final transaction in transactionsList) {
      transaction.type == TransactionType.income
          ? budget += transaction.value
          : budget -= transaction.value;
    }

    budgetValNotifier.value = budget;
  }
}
