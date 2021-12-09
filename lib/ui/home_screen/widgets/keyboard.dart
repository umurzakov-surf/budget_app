import 'package:flutter/widgets.dart';

import 'keyboard_btn.dart';

const _data = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '', '0'];

class Keyboard extends StatelessWidget {
  final Function(String) addDigit;
  final VoidCallback removeDigit;

  const Keyboard({
    Key? key,
    required this.addDigit,
    required this.removeDigit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            crossAxisSpacing: 30,
            mainAxisSpacing: 20,
            children: [
              for (final label in _data)
                label.isEmpty
                    ? const SizedBox()
                    : KeyboardBtn(
                        label: label,
                        onPressed: () => addDigit(label),
                      ),
              KeyboardBtn(
                label: 'remove',
                onPressed: removeDigit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
