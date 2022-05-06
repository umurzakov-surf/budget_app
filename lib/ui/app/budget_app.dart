import 'package:budget_app/ui/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class BudgetApp extends StatelessWidget {
  const BudgetApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
          primary: const Color(0xff16202e),
          primaryContainer: const Color(0xff2f3e50),
          secondary: const Color(0xff00c79c),
          error: const Color(0xffdb7059),
        ),
        scaffoldBackgroundColor: const Color(0xff1f2936),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
