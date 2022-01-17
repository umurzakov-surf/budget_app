import 'dart:convert';

import 'package:budget_app/enums/transaction_type_enum.dart';
import 'package:budget_app/service/model/transaction.dart';
import 'package:budget_app/service/repository/shared_preferences_helper.dart';
import 'package:budget_app/service/repository/transaction_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late SharedPrefsHelperMock sharedPrefsHelperMock;
  late TransactionRepository transactionRepository;

  const _sharedPrefKeyTransactions = 'transactions';
  const _sharedPrefKeyBudget = 'budget';
  final transactionsList = <Transaction>[];

  final transaction = Transaction(
    value: 100,
    category: 'gift',
    type: TransactionTypeEnum.income,
  );

  setUp(() {
    sharedPrefsHelperMock = SharedPrefsHelperMock();

    when(() => sharedPrefsHelperMock.get(_sharedPrefKeyTransactions, ''))
        .thenAnswer((_) => Future.value(jsonEncode(transactionsList)));
    when(() => sharedPrefsHelperMock.get(_sharedPrefKeyBudget, 0))
        .thenAnswer((_) => Future.value(transaction.value));
    when(() => sharedPrefsHelperMock.set(_sharedPrefKeyTransactions, jsonEncode([transaction])))
        .thenAnswer((_) => Future.value());
    when(() => sharedPrefsHelperMock.set(_sharedPrefKeyBudget, 200))
        .thenAnswer((_) => Future.value());

    transactionRepository = TransactionRepository(sharedPrefsHelperMock);
  });

  test('Transactions list length should be 1', () async {
    await transactionRepository.addTransaction(transaction);

    expect(transactionRepository.transactionsList.length, 1);
  });

  test('Transactions budget should be 100', () async {
    final budget = await transactionRepository.getBudget();
    expect(budget, 100);
  });
}

class SharedPrefsHelperMock extends Mock implements SharedPreferencesHelper {}
