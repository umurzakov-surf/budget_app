import 'package:budget_app/enums/transaction_type_enum.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction {
  final int value;
  final String category;
  final TransactionTypeEnum type;

  Transaction({
    required this.value,
    required this.category,
    required this.type,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
