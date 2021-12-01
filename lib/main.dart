import 'dart:io';

import 'package:dart_code_metrics/lint_analyzer.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ui/home_screen/home_model.dart';
import 'ui/home_screen/home_page.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Provider(
        create: (_) => HomeModel(HomeErrorHandler()),
        child: const HomePage(),
      ),
    );
  }
}

class HomeErrorHandler implements ErrorHandler {
  @override
  void handleError(Object error) {
    // ignore: avoid_print
    print(error);
  }
}
