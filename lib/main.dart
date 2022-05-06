import 'package:budget_app/service/repository/shared_preferences_helper.dart';
import 'package:budget_app/service/repository/transaction_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'ui/app/budget_app.dart';

final getIt = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  getIt
    ..registerSingleton<SharedPreferencesHelper>(SharedPreferencesHelper())
    ..registerSingleton<TransactionRepository>(
      TransactionRepository(SharedPreferencesHelper()),
    );

  runApp(const BudgetApp());
}
