import 'package:budget_app/enums/transaction_types.dart';
import 'package:elementary/elementary.dart';

class HomeModel extends ElementaryModel {
  int get currentBudget => _currentBudget;
  int _currentBudget = 0;

  HomeModel(ErrorHandler errorHandler) : super(errorHandler: errorHandler);

  Future<int> addTransaction(int value, TransactionType type) async {

    type == TransactionType.income
        ? _currentBudget += value
        : _currentBudget -= value;

    return _currentBudget;
  }
}
