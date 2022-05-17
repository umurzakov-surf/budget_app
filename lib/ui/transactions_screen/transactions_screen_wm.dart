import 'package:budget_app/main.dart';
import 'package:budget_app/service/model/transaction.dart';
import 'package:budget_app/service/model/transaction_category.dart';
import 'package:budget_app/service/repository/categories_repository.dart';
import 'package:budget_app/service/repository/transaction_repository.dart';
import 'package:budget_app/ui/transactions_screen/transactions_screen.dart';
import 'package:budget_app/ui/transactions_screen/transactions_screen_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';

TransactionsScreenWM transactionsScreenWMFactory(BuildContext _) {
  final transactionRepository = getIt<TransactionRepository>();

  return TransactionsScreenWM(TransactionsScreenModel(transactionRepository));
}

class TransactionsScreenWM
    extends WidgetModel<TransactionsScreen, TransactionsScreenModel> {

  final _transactionsListState = EntityStateNotifier<List<Transaction>>();
  final _categoriesList = CategoriesRepository().get();

  ListenableState<EntityState<List<Transaction>>> get transactionsListState => _transactionsListState;
  List<TransactionCategory> get categoriesList => _categoriesList;

  TransactionsScreenWM(TransactionsScreenModel model) : super(model);

  @override
  void initWidgetModel() {

    _loadTransactions();
    super.initWidgetModel();
  }

  Future<void> _loadTransactions() async {
    final transactionsList = await model.loadTransactions();
    _transactionsListState.content(transactionsList);
  }
}
