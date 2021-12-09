import 'package:budget_app/ui/app/app_dependencies.dart';
import 'package:flutter/material.dart';
import 'ui/app/budget_app.dart';

Future<void> main() async {
  runApp(
    const AppDependencies(
      app: BudgetApp(),
    ),
  );
}
