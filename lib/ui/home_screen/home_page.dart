import 'package:budget_app/enums/transaction_types.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import 'home_wm.dart';

class HomePage extends ElementaryWidget<IHomeWM> {
  const HomePage({
    Key? key,
    WidgetModelFactory wmFactory = homeWmFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IHomeWM wm) {
    final inputController = TextEditingController();

    Widget _btn() {
      return Container(
        color: Colors.blue,
      );
    }

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: EntityStateNotifierBuilder<int>(
                listenableEntityState: wm.budgetState,
                loadingBuilder: (_, data) {
                  return const CircularProgressIndicator();
                },
                builder: (_, data) {
                  return Text(
                    data.toString(),
                  );
                },
              ),
            ),
          ),
          Container(
            height: 80,
            color: Colors.red,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  _btn(),
                  _btn(),
                  _btn(),
                  _btn(),
                  _btn(),
                  _btn(),
                  _btn(),
                  _btn(),
                  _btn(),
                ],
              ),
            ),
          ),
          EntityStateNotifierBuilder(
            listenableEntityState: wm.budgetState,
            builder: (_, data) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      wm.addTransaction(10, TransactionType.income);
                    },
                    child: const Text('Income'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      wm.addTransaction(10, TransactionType.expense);
                    },
                    child: const Text('Expense'),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
