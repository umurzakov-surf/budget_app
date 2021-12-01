import 'package:budget_app/enums/transaction_types.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_model.dart';
import 'home_page.dart';

HomeWm homeWmFactory(BuildContext context) {
  final model = context.read<HomeModel>();

  return HomeWm(model);
}

class HomeWm extends WidgetModel<HomePage, HomeModel> implements IHomeWM {

  @override
  ListenableState<EntityState<int>> get budgetState => _budgetController;

  late EntityStateNotifier<int> _budgetController;

  HomeWm(HomeModel model) : super(model);

  @override
  void addTransaction(int val, TransactionType type) {
    _budgetController.loading();

    final newVal = model.addTransaction(val, type);

    _budgetController.content(newVal);
  }

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _budgetController = EntityStateNotifier<int>.value(model.currentBudget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void onErrorHandle(Object error) {
    super.onErrorHandle(error);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error.toString()),
      ),
    );
  }

  @override
  void dispose() {
    _budgetController.dispose();

    super.dispose();
  }
}

abstract class IHomeWM extends IWidgetModel {
  ListenableState<EntityState<int>> get budgetState;
  void addTransaction(int value, TransactionType type);
}