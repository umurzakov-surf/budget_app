import 'dart:convert';

import 'package:budget_app/enums/transaction_type_enum.dart';
import 'package:budget_app/service/model/transaction.dart';
import 'package:budget_app/service/repository/shared_preferences_helper.dart';

const transactionsSharedPref = 'transactions';
const budgetSharedPref = 'budget';

class TransactionRepository {
  final transactionsList = <Transaction>[];
  final SharedPreferencesHelper _sharedPreferencesHelper;

  TransactionRepository(this._sharedPreferencesHelper) {
    _loadTransactions();
  }

  Future<List<Transaction>> getTransactions() async {
    return transactionsList;
  }

  Future<void> addTransaction(Transaction transaction) async {
    transactionsList.add(transaction);

    final transactionsListString = jsonEncode(transactionsList);
    await _sharedPreferencesHelper.set(
      transactionsSharedPref,
      transactionsListString,
    );
    await _setNewBudget(transaction);
  }

  Future<int> getBudget() async {
    final budget = await _sharedPreferencesHelper.get(budgetSharedPref, 0);

    return budget;
  }

  Future<void> _loadTransactions() async {
    final transactionsListString =
        await _sharedPreferencesHelper.get(transactionsSharedPref, '');

    if (transactionsListString.isNotEmpty) {
      for (final transaction in jsonDecode(transactionsListString) as List) {
        transactionsList
            .add(Transaction.fromJson(transaction as Map<String, dynamic>));
      }
    }
  }

  Future<void> _setNewBudget(Transaction transaction) async {
    var currentBudget = await _sharedPreferencesHelper.get(budgetSharedPref, 0);
    transaction.type == TransactionTypeEnum.income
        ? currentBudget += transaction.value
        : currentBudget -= transaction.value;

    await _sharedPreferencesHelper.set(budgetSharedPref, currentBudget);
  }
}
