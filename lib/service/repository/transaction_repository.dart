import 'dart:convert';

import 'package:budget_app/service/model/transaction.dart';

class TransactionRepository {
  final jsonString = '[{"value": 100, "category": "gift", "type": "income", "icon": "https://www.vhv.rs/dpng/d/8-86885_map-pin-icon-png-transparent-png.png"}, {"value": 200, "category": "gift", "type": "income", "icon": "https://www.vhv.rs/dpng/d/8-86885_map-pin-icon-png-transparent-png.png"}, {"value": 300, "category": "gift", "type": "income", "icon": "https://www.vhv.rs/dpng/d/8-86885_map-pin-icon-png-transparent-png.png"}]';

  final transactionsList = <Transaction>[];

  TransactionRepository(){
    for(final transaction in jsonDecode(jsonString) as List) {
      transactionsList.add(Transaction.fromJson(transaction as Map<String, dynamic>));
    }
  }

  List<Transaction> getTransactions() {
    return transactionsList;
  }

  void addTransaction(Transaction transaction) {
    transactionsList.add(transaction);
  }
}
