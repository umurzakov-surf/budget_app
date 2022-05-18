import 'package:budget_app/enums/transaction_type_enum.dart';
import 'package:budget_app/service/model/transaction_category.dart';

class CategoriesRepository {
  final List<TransactionCategory> categoriesList = [
    TransactionCategory(
      label: 'Gift',
      types: [TransactionTypeEnum.income, TransactionTypeEnum.expense],
    ),
    TransactionCategory(
      label: 'Salary',
      types: [TransactionTypeEnum.income],
    ),
    TransactionCategory(
      label: 'Debt',
      types: [TransactionTypeEnum.income, TransactionTypeEnum.expense],
    ),
    TransactionCategory(
      label: 'Food',
      types: [TransactionTypeEnum.expense],
    ),
    TransactionCategory(
      label: 'Gas',
      types: [TransactionTypeEnum.expense],
    ),
    TransactionCategory(
      label: 'Loan',
      types: [TransactionTypeEnum.expense],
    ),
    TransactionCategory(
      label: 'Restaurant',
      types: [TransactionTypeEnum.expense],
    ),
    TransactionCategory(
      label: 'Utility',
      types: [TransactionTypeEnum.expense],
    ),
  ];

  List<TransactionCategory> get() {
    return categoriesList;
  }

  List<TransactionCategory> getByType(TransactionTypeEnum type) {
    return categoriesList
        .where((category) => category.types.contains(type))
        .toList();
  }
}
