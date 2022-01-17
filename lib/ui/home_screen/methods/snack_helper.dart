import 'package:flutter/material.dart';

class SnackHelper {
  void showSnack(BuildContext context, SnackBar snackBar) {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
