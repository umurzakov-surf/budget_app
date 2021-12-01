import 'package:budget_app/enums/transaction_types.dart';
import 'package:elementary/elementary.dart';

class HomeModel extends ElementaryModel {
  int get currentBudget => _currentBudget;
  String get inputVal => _inputVal;

  int _currentBudget = 0;
  String _inputVal = '0';

  HomeModel(ErrorHandler errorHandler) : super(errorHandler: errorHandler);

  int addTransaction(int value, TransactionType type) {

    type == TransactionType.income
        ? _currentBudget += value
        : _currentBudget -= value;

    return _currentBudget;
  }

  void inputDigit(String digit) {
    _inputVal == '0' ? _inputVal = digit : _inputVal += digit;
  }

  void removeLastDigit() {
    _inputVal.length == 1 ? _inputVal = '0' : _inputVal.substring(0, _inputVal.length - 1);
  }
}
