import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

enum TransactionCategory {
  @JsonValue('food')
  food,
  @JsonValue('gas')
  gas,
  @JsonValue('restaurant')
  restaurant,
  @JsonValue('utility')
  utility,
  @JsonValue('debt')
  debt,
  @JsonValue('loan')
  loan,
  @JsonValue('gift')
  gift,
  @JsonValue('salary')
  salary,
}

enum TransactionType {
  @JsonValue('income')
  income,
  @JsonValue('expense')
  expense,
}

@JsonSerializable()
class Transaction {
  final int value;
  final TransactionCategory category;
  final TransactionType type;
  final String icon;

  Transaction({
    required this.value,
    required this.category,
    required this.type,
    required this.icon,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
