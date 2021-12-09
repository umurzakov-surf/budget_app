// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      value: json['value'] as int,
      category: json['category'] as String,
      type: $enumDecode(_$TransactionTypeEnumEnumMap, json['type']),
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'value': instance.value,
      'category': instance.category,
      'type': _$TransactionTypeEnumEnumMap[instance.type],
    };

const _$TransactionTypeEnumEnumMap = {
  TransactionTypeEnum.income: 'income',
  TransactionTypeEnum.expense: 'expense',
};
