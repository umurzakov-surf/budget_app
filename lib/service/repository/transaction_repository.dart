import 'dart:convert';

import 'package:budget_app/service/model/transaction.dart';
import 'package:flutter/widgets.dart';

const baseUrl = 'https://www.metaweather.com';

class TransactionRepository {
  final jsonString = '[{"value": 100, "category": "gift", "type": "income", "icon": "https://www.vhv.rs/dpng/d/8-86885_map-pin-icon-png-transparent-png.png"}, {"value": 200, "category": "gift", "type": "income", "icon": "https://www.vhv.rs/dpng/d/8-86885_map-pin-icon-png-transparent-png.png"}, {"value": 300, "category": "gift", "type": "income", "icon": "https://www.vhv.rs/dpng/d/8-86885_map-pin-icon-png-transparent-png.png"}]';

  final ValueNotifier<List<Transaction>> transactionListNotifier = ValueNotifier([]);
  final ValueNotifier<int> budgetNotifier = ValueNotifier(0);
  final newList = <Transaction>[];

  void getList() {
    final jsonList = jsonDecode(jsonString) as List;
    final list = <Transaction>[];

    for(final transaction in jsonList) {
      list.add(Transaction.fromJson(transaction as Map<String, dynamic>));
    }

    transactionListNotifier.value = [...list, ...newList];

    for(final transaction in [...list, ...newList]) {
      budgetNotifier.value += transaction.value;
    }
  }

  void addTransaction(Transaction transaction) {
    newList.add(transaction);

    transaction.type == TransactionType.income ? budgetNotifier.value += transaction.value : budgetNotifier.value -= transaction.value;
  }
}
