import 'package:budget_app/service/model/transaction.dart';
import 'package:budget_app/service/repository/transaction_repository.dart';
import 'package:elementary/elementary.dart';

class TransactionsScreenModel extends ElementaryModel {
  final TransactionRepository _transactionRepository;

  TransactionsScreenModel(this._transactionRepository);

  Future<List<Transaction>> loadTransactions() async {
    final transactions = await _transactionRepository.getTransactions();

    return transactions;
  }
}
