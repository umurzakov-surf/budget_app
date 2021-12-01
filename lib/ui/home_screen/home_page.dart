import 'package:budget_app/enums/transaction_types.dart';
import 'package:budget_app/ui/home_screen/widgets/keyboard.dart';
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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Column(
          children: [
            Flexible(
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
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: TextField(

              ),
            ),
            const Flexible(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Keyboard(),
              ),
            ),
            EntityStateNotifierBuilder(
              listenableEntityState: wm.budgetState,
              builder: (_, data) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          wm.addTransaction(10, TransactionType.income);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          elevation: 0,
                          side: const BorderSide(
                            width: 1,
                            color: Colors.green,
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            'Income',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15,),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          wm.addTransaction(10, TransactionType.expense);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          elevation: 0,
                          side: const BorderSide(
                            width: 1,
                            color: Colors.red,
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            'Expense',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
