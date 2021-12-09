import 'package:budget_app/enums/transaction_type_enum.dart';

class TransactionCategory {
  final String label;
  final List<TransactionTypeEnum> types;

  TransactionCategory({required this.label, required this.types});
}
