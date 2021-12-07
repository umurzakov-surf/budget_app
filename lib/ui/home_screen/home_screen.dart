import 'package:budget_app/service/model/transaction.dart';
import 'package:budget_app/ui/home_screen/widgets/keyboard.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_wm.dart';
import 'widgets/add_transaction_btn.dart';

class HomeScreen extends ElementaryWidget<HomeWM> {
  const HomeScreen({Key? key}) : super(homeWmFactory, key: key);

  @override
  Widget build(HomeWM wm) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 100,
                      child: Center(
                        child: ValueListenableBuilder(
                          valueListenable: wm.budgetValNotifier,
                          builder: (_, data, __) => Text('$data'),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: wm.onTapTransactionsList,
                      icon: const Icon(Icons.list),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: ValueListenableBuilder(
                      valueListenable: wm.inputValNotifier,
                      builder: (_, data, __) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 20,
                              ),
                              child: Text(
                                data.toString(),
                              ),
                            ),
                            Container(
                              width: 1,
                              color: Colors.grey,
                            ),
                            MaterialButton(
                              onPressed: wm.clearInput,
                              child: const Text('x'),
                              height: double.infinity,
                              minWidth: 60,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Center(
                      child: Keyboard(
                        addDigit: wm.addDigit,
                        removeDigit: wm.removeDigit,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AddTransactionBtn(
                      label: 'Income',
                      onPressed: () => wm.addTransaction(TransactionType.income),
                      type: TransactionType.income,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    AddTransactionBtn(
                      label: 'Expense',
                      onPressed: () => wm.addTransaction(TransactionType.expense),
                      type: TransactionType.expense,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
