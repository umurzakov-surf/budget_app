// import 'package:budget_app/enums/transaction_type.dart';
import 'package:budget_app/service/model/transaction.dart';
import 'package:budget_app/service/repository/transaction_repository.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/widgets.dart';

class HomeModel extends ElementaryModel {
  final ValueNotifier<String> inputValNotifier = ValueNotifier('');
  final TransactionRepository transactionRepository;

  HomeModel(this.transactionRepository) : super();

  void addTransaction(TransactionType type) {
    if (inputValNotifier.value != '') {
      final transaction = Transaction(value: int.parse(inputValNotifier.value), category: TransactionCategory.gift, type: type, icon: 'https://www.vhv.rs/dpng/d/8-86885_map-pin-icon-png-transparent-png.png');
      transactionRepository.addTransaction(transaction);
      inputValNotifier.value = '';
    }
  }

  void addDigit(String digit) {
    inputValNotifier.value += digit;
  }

  void removeDigit() {
    inputValNotifier.value = inputValNotifier.value == ''
        ? inputValNotifier.value
        : inputValNotifier.value
            .substring(0, inputValNotifier.value.length - 1);
  }

  void clearInput() {
    inputValNotifier.value = '';
  }

  void loadTransactions() {
    transactionRepository.getList();
  }
}
