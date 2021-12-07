import 'package:budget_app/service/model/transaction.dart';
import 'package:budget_app/service/repository/transaction_repository.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/widgets.dart';

class TransactionsScreenModel extends ElementaryModel {
  final TransactionRepository transactionRepository;
  ValueNotifier<List<Transaction>> get transactionsList => transactionRepository.transactionListNotifier;

  TransactionsScreenModel(this.transactionRepository);

  void loadTransactions() {
    transactionRepository.getList();
  }

  void addTransaction(Transaction transaction) {
    transactionRepository.addTransaction(transaction);
  }
}
