import 'package:budget_app/service/repository/transaction_repository.dart';
import 'package:budget_app/ui/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class BudgetApp extends StatelessWidget {
  const BudgetApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Provider(
      create: (_) => TransactionRepository(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
