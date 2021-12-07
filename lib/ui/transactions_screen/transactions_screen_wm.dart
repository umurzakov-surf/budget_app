import 'package:budget_app/service/model/transaction.dart';
import 'package:budget_app/service/repository/transaction_repository.dart';
import 'package:budget_app/ui/transactions_screen/transactions_screen.dart';
import 'package:budget_app/ui/transactions_screen/transactions_screen_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

TransactionsScreenWM transactionsScreenWMFactory(BuildContext context) {
  final transactionRepository = context.read<TransactionRepository>();

  return TransactionsScreenWM(TransactionsScreenModel(transactionRepository));
}

class TransactionsScreenWM
    extends WidgetModel<TransactionsScreen, TransactionsScreenModel> {

  ValueNotifier<List<Transaction>> get transactionsListState => model.transactionsList;

  TransactionsScreenWM(TransactionsScreenModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _loadTransactionsList();
  }

  void addTransaction(Transaction transaction) {
    model.addTransaction(transaction);
  }

  void _loadTransactionsList() {
    model.loadTransactions();
  }
}
