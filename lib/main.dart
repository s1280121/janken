import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janken/game_one/home.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final MaterialColor materialWhite = const MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFFFFFF),
      200: Color(0xFFFFFFFF),
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(0xFFFFFFFF),
      600: Color(0xFFFFFFFF),
      700: Color(0xFFFFFFFF),
      800: Color(0xFFFFFFFF),
      900: Color(0xFFFFFFFF),
    },
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'じゃんけんアプリ',
      theme: ThemeData(
        primarySwatch: materialWhite,
        textTheme: GoogleFonts.yuseiMagicTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      darkTheme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 100),
            const Text('じゃんけんアプリ', style: TextStyle(fontSize: 50),),
            const SizedBox(height: 100),
            MaterialButton(
              padding: const EdgeInsets.all(30),
              color: Colors.blue,
              textColor: Colors.white,
              shape: const CircleBorder(),//丸
              onPressed:() {
                Navigator.push(context,
                  PageTransition(
                    child: OneMainPage(), //画面遷移先
                    type: PageTransitionType.fade,
                    duration: Duration(milliseconds: 300),//アニメーションの時間
                    reverseDuration: Duration(seconds: 1),//戻る際のアニメーションの時間
                  ),
                );
              },
              child: const Text('100連\nじゃんけん', style: TextStyle(fontSize: 30),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  padding: const EdgeInsets.all(30),
                  color: Colors.blue,
                  textColor: Colors.white,
                  shape: const CircleBorder(),
                  onPressed:() {
                    // Navigator.push(context, MaterialPageRoute(
                    //   builder: (BuildContext context) => OneMainPage(),
                    // ),
                    // );
                  },
                  child: const Text('指令\nじゃんけん', style: TextStyle(fontSize: 30),),
                ),
                MaterialButton(
                  padding: const EdgeInsets.all(53),
                  color: Colors.blue,
                  textColor: Colors.white,
                  shape: const CircleBorder(),
                  onPressed:() {
                    // Navigator.push(context, MaterialPageRoute(
                    //   builder: (BuildContext context) => OneMainPage(),
                    // ),
                    // );
                  },
                  child: const Text('グリコ', style: TextStyle(fontSize: 30)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}