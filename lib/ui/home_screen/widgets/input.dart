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
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Text(
                    data.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  height: double.infinity,
                  color: Colors.grey,
                ),
                MaterialButton(
                  onPressed: clearInput,
                  child: const Icon(Icons.clear, color: Colors.white),
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
