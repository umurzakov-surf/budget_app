import 'package:flutter/material.dart';

class DialogHelper {
  Future<T?> showCustomDialog<T>({
    required BuildContext context,
    required WidgetBuilder builder,
  }) {
    return showDialog<T>(context: context, builder: builder);
  }
}
