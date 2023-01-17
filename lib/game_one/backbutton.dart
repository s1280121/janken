import 'package:flutter/material.dart';
import 'package:janken/main.dart';

import 'home.dart';

class WinPageBackButton extends StatelessWidget {
  const WinPageBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text(
        '<',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
      onPressed: () {
        // ここで任意の処理
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => OneMainPage()),
        );      },
    );
  }
}


class OneMainPageBackButton extends StatelessWidget {
  const OneMainPageBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text(
        '<',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
      onPressed: () {
        // ここで任意の処理
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );      },
    );
  }
}