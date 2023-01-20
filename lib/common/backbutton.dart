import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


class CustomBackButton extends StatelessWidget {
  final Widget screen;

  const CustomBackButton({Key? key, required this.screen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text('<', style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
      onPressed: () {
        Navigator.push(context,
          PageTransition(
            child: screen, //画面遷移先
            type: PageTransitionType.fade,
            duration: Duration(milliseconds: 300),//アニメーションの時間
          ),
        );},
    );
  }
}