import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _btn(String label) {
      return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          primary: Colors.white,
          elevation: 0,
          side: const BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(color: Colors.black),
        ),
      );
    }

    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      crossAxisSpacing: 30,
      mainAxisSpacing: 20,
      children: [
        _btn('1'),
        _btn('2'),
        _btn('3'),
        _btn('4'),
        _btn('5'),
        _btn('6'),
        _btn('7'),
        _btn('8'),
        _btn('9'),
        _btn(','),
        _btn('0'),
        _btn(''),
      ],
    );
  }
}
