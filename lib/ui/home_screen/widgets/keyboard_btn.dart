import 'package:flutter/material.dart';

class KeyboardBtn extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const KeyboardBtn({Key? key, required this.label, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        primary: Colors.white,
        elevation: 0,
        side: const BorderSide(
          color: Colors.grey,
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
