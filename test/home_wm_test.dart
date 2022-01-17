// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:budget_app/enums/transaction_type_enum.dart';
import 'package:budget_app/service/model/transaction.dart';
import 'package:budget_app/ui/home_screen/home_model.dart';
import 'package:budget_app/ui/home_screen/home_screen.dart';
import 'package:budget_app/ui/home_screen/home_wm.dart';
import 'package:budget_app/ui/home_screen/methods/dialog_helper.dart';
import 'package:budget_app/ui/home_screen/methods/navigation_helper.dart';
import 'package:budget_app/ui/home_screen/methods/snack_helper.dart';
import 'package:elementary_test/elementary_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late HomeModelMock model;
  late DialogHelperMock dialogServiceMock;
  late NavigationHelperMock navigationHelperMock;
  late SnackMock snackMock;

  final newTransaction = Transaction(
    type: TransactionTypeEnum.income,
    category: 'gift',
    value: 100,
  );

  HomeWM setUpWM() {
    model = HomeModelMock();
    dialogServiceMock = DialogHelperMock();
    navigationHelperMock = NavigationHelperMock();
    snackMock = SnackMock();

    when(() => model.budgetValNotifier).thenReturn(ValueNotifier(0));
    when(() => model.addTransaction(newTransaction))
        .thenAnswer((_) => Future.value());
    when(() => model.loadBudget()).thenAnswer((_) => Future.value());

    registerFallbackValue(MaterialPageRoute<void>(builder: (_) {
      return const Center();
    }));

    return HomeWM(model, dialogServiceMock, navigationHelperMock, snackMock);
  }

  testWidgetModel<HomeWM, HomeScreen>(
    'budget should be 0',
    setUpWM,
    (wm, tester, context) {
      tester.init();

      expect(wm.budgetValNotifier.value, 0);
    },
  );

  testWidgetModel<HomeWM, HomeScreen>(
    'input controller value length should be 1',
    setUpWM,
    (wm, tester, context) async {
      tester.init();

      wm.addDigit('1');

      expect(wm.inputValNotifier.value.length, 1);
    },
  );

  testWidgetModel<HomeWM, HomeScreen>(
    'input controller value length should be 2',
    setUpWM,
    (wm, tester, context) async {
      tester.init();

      wm
        ..inputValNotifier.value = '111'
        ..removeDigit();

      expect(wm.inputValNotifier.value.length, 2);
    },
  );

  testWidgetModel<HomeWM, HomeScreen>(
    'input controller value length should be 0',
    setUpWM,
    (wm, tester, context) async {
      tester.init();

      wm
        ..inputValNotifier.value = '111'
        ..clearInput();

      expect(wm.inputValNotifier.value.length, 0);
    },
  );


  // Тест не проходит
  testWidgetModel<HomeWM, HomeScreen>(
    'add transaction should be called once',
    setUpWM,
    (wm, tester, context) async {

      when(() => dialogServiceMock.showCustomDialog<String>(
            context: context,
            builder: (context) => const Center(),
          )).thenAnswer((_) => Future.value('gift'));

      tester.init();

      wm.inputValNotifier.value = '100';

      await wm.addTransaction(newTransaction.type);

      verify(() => wm.addTransaction(newTransaction.type)).called(1);
    },
  );

  testWidgetModel<HomeWM, HomeScreen>(
    'navigation works',
    setUpWM,
    (wm, tester, context) async {
      tester.init();

      wm.onTapTransactionsList();

      verify(() => navigationHelperMock.push(context, any()));
    },
  );
}

class HomeModelMock extends Mock implements HomeModel {}

class DialogHelperMock extends Mock implements DialogHelper {}

class NavigationHelperMock extends Mock implements NavigationHelper {}

class SnackMock extends Mock implements SnackHelper {}
