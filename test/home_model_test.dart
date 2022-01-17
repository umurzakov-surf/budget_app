import 'package:budget_app/enums/transaction_type_enum.dart';
import 'package:budget_app/service/model/transaction.dart';
import 'package:budget_app/service/repository/transaction_repository.dart';
import 'package:budget_app/ui/home_screen/home_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late TransactionRepoMock transactionRepoMock;
  late HomeModel homeModel;

  final transactionsList = <Transaction>[];
  final transaction = Transaction(
    value: 100,
    category: 'gift',
    type: TransactionTypeEnum.income,
  );

  setUp(() {
    transactionRepoMock = TransactionRepoMock();

    when(() => transactionRepoMock.getBudget())
        .thenAnswer((invocation) => Future.value(100));
    when(() => transactionRepoMock.addTransaction(transaction))
        .thenAnswer((invocation) => Future.value());
    when(() => transactionRepoMock.transactionsList).thenReturn(transactionsList);

    homeModel = HomeModel(transactionRepoMock);
  });

  test('budget should be 100', () async {
    await homeModel.loadBudget();
    expect(homeModel.budgetValNotifier.value, 100);
  });

  test('transactions list length should have 1 transaction', () async {
    await homeModel.addTransaction(transaction);
    transactionsList.add(transaction);
    when(() => transactionRepoMock.transactionsList).thenReturn(transactionsList);
    verify(() => transactionRepoMock.addTransaction(transaction)).called(1);
  });
}

class TransactionRepoMock extends Mock implements TransactionRepository {}
