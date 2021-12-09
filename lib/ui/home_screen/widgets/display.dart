import 'package:flutter/widgets.dart';

class Display extends StatelessWidget {
  final ValueNotifier<int> budgetValNotifier;

  const Display({Key? key, required this.budgetValNotifier}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Center(
        child: ValueListenableBuilder(
          valueListenable: budgetValNotifier,
          builder: (_, data, __) => Text('$data'),
        ),
      ),
    );
  }
}
