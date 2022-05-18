import 'package:flutter/material.dart';

class KeyboardBtn extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isRemove;

  const KeyboardBtn({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isRemove = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        primary: Theme.of(context).colorScheme.primaryVariant,
        elevation: 0,
      ),
      child: !isRemove
          ? Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            )
          : const Icon(
              Icons.backspace_outlined,
              color: Colors.white,
            ),
    );
  }
}
