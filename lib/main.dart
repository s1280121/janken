import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janken/game_one/home.dart';

import 'game_one/answer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final MaterialColor materialWhite = const MaterialColor(
    0xFFFFFFFF,
    const <int, Color>{
      50: const Color(0xFFFFFFFF),
      100: const Color(0xFFFFFFFF),
      200: const Color(0xFFFFFFFF),
      300: const Color(0xFFFFFFFF),
      400: const Color(0xFFFFFFFF),
      500: const Color(0xFFFFFFFF),
      600: const Color(0xFFFFFFFF),
      700: const Color(0xFFFFFFFF),
      800: const Color(0xFFFFFFFF),
      900: const Color(0xFFFFFFFF),
    },
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: materialWhite,
        textTheme: GoogleFonts.yuseiMagicTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      darkTheme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }

}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

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
            SizedBox(height: 100),
            Text('じゃんけんアプリ', style: TextStyle(fontSize: 50),),
            SizedBox(height: 100),
            MaterialButton(
              child: Text('100連\nじゃんけん', style: TextStyle(fontSize: 30),),
              padding: EdgeInsets.all(30),//パディング
              color: Colors.blue, //背景色
              textColor: Colors.white, //アイコンの色
              shape: CircleBorder(),//丸
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) => OneMainPage(),
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  child: Text('指令\nじゃんけん', style: TextStyle(fontSize: 30),),
                  padding: EdgeInsets.all(30),//パディング
                  color: Colors.blue, //背景色
                  textColor: Colors.white, //アイコンの色
                  shape: CircleBorder(),//丸
                  onPressed:() {
                    // Navigator.push(context, MaterialPageRoute(
                    //   builder: (BuildContext context) => OneMainPage(),
                    // ),
                    // );
                  },
                ),
                MaterialButton(
                  child: Text('グリコ', style: TextStyle(fontSize: 30),),
                  padding: EdgeInsets.all(53),//パディング
                  color: Colors.blue, //背景色
                  textColor: Colors.white, //アイコンの色
                  shape: CircleBorder(),//丸
                  onPressed:() {
                    // Navigator.push(context, MaterialPageRoute(
                    //   builder: (BuildContext context) => OneMainPage(),
                    // ),
                    // );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}