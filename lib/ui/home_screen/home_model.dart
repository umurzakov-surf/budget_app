import 'package:budget_app/service/model/transaction.dart';
import 'package:budget_app/service/repository/transaction_repository.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/widgets.dart';

class HomeModel extends ElementaryModel {
  final ValueNotifier<String> inputValNotifier = ValueNotifier('');
  final ValueNotifier<int> budgetValNotifier = ValueNotifier(0);
  final TransactionRepository _transactionRepository;

  HomeModel(this._transactionRepository) : super();

  Future<void> addTransaction(Transaction transaction) async {
    await _transactionRepository.addTransaction(transaction);
    await loadBudget();
  }

  Future<void> loadBudget() async {
    final budget = await _transactionRepository.getBudget();

    budgetValNotifier.value = budget;
  }
}
