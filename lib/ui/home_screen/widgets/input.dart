import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final ValueNotifier<String> inputValNotifier;
  final VoidCallback clearInput;

  const Input({
    Key? key,
    required this.inputValNotifier,
    required this.clearInput,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        height: 60,
        width: double.infinity,
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: ValueListenableBuilder(
          valueListenable: inputValNotifier,
          builder: (_, data, __) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  child: Text(
                    data.toString(),
                  ),
                ),
                Container(
                  width: 1,
                  color: Colors.grey,
                ),
                MaterialButton(
                  onPressed: clearInput,
                  child: const Text('x'),
                  height: double.infinity,
                  minWidth: 60,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
