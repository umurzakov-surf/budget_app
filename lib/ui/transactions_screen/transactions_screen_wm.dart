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

  final _transactionsListState = EntityStateNotifier<List<Transaction>>();

  ListenableState<EntityState<List<Transaction>>> get transactionsListState => _transactionsListState;

  TransactionsScreenWM(TransactionsScreenModel model) : super(model);

  @override
  void initWidgetModel() {

    _loadTransactions();
    super.initWidgetModel();
  }

  void _loadTransactions() {
    final transactionsList = model.loadTransactions();
    _transactionsListState.content(transactionsList);
  }
}
