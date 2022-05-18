import 'package:budget_app/ui/home_screen/widgets/add_transaction_buttons.dart';
import 'package:budget_app/ui/home_screen/widgets/display.dart';
import 'package:budget_app/ui/home_screen/widgets/input.dart';
import 'package:budget_app/ui/home_screen/widgets/keyboard.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'home_wm.dart';

class HomeScreen extends ElementaryWidget<HomeWM> {
  const HomeScreen({Key? key}) : super(homeWmFactory, key: key);

  @override
  Widget build(HomeWM wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Budget App'),
        leading: IconButton(
          onPressed: wm.onTapTransactionsList,
          icon: const Icon(Icons.list),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Column(
            children: [
              Display(budgetValNotifier: wm.budgetValNotifier),
              Input(
                inputValNotifier: wm.inputValNotifier,
                clearInput: wm.clearInput,
              ),
              const SizedBox(height: 20),
              Keyboard(
                addDigit: wm.addDigit,
                removeDigit: wm.removeDigit,
              ),
              AddTransactionButtons(addTransaction: wm.addTransaction),
            ],
          ),
        ),
      ),
    );
  }
}
