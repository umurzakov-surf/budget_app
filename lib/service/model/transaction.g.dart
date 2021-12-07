// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      value: json['value'] as int,
      category: $enumDecode(_$TransactionCategoryEnumMap, json['category']),
      type: $enumDecode(_$TransactionTypeEnumMap, json['type']),
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'value': instance.value,
      'category': _$TransactionCategoryEnumMap[instance.category],
      'type': _$TransactionTypeEnumMap[instance.type],
      'icon': instance.icon,
    };

const _$TransactionCategoryEnumMap = {
  TransactionCategory.food: 'food',
  TransactionCategory.gas: 'gas',
  TransactionCategory.restaurant: 'restaurant',
  TransactionCategory.utility: 'utility',
  TransactionCategory.debt: 'debt',
  TransactionCategory.loan: 'loan',
  TransactionCategory.gift: 'gift',
  TransactionCategory.salary: 'salary',
};

const _$TransactionTypeEnumMap = {
  TransactionType.income: 'income',
  TransactionType.expense: 'expense',
};
