import 'package:json_annotation/json_annotation.dart';

enum TransactionTypeEnum {
  @JsonValue('income')
  income,
  @JsonValue('expense')
  expense,
}
