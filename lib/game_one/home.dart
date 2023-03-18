import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:janken/game_one/result.dart';
import 'package:janken/main.dart';
import 'package:page_transition/page_transition.dart';
import 'answer.dart';

import '../common/appbar.dart';
import '../common/backbutton.dart';

class OneMainPage extends StatefulWidget {
  OneMainPage({Key? key}) : super(key: key);

  @override
  _OneMainPageState createState() => _OneMainPageState();
}

class _OneMainPageState extends State<OneMainPage> {
  final player = AudioPlayer();

  int N = -1;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('10連じゃんけん'),
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false, //戻るボタン非表示
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/sea.jpeg'),
              fit: BoxFit.cover,
            )
        ),
        child: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      player.play(AssetSource('tap.mp3'));
                      Navigator.push(context,
                        PageTransition(
                          child: ResultPage(winN: N), //画面遷移先
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 300),//アニメーションの時間
                        ),
                      );
                    },
                    child: const Text('最高記録', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            ),
            // Text('10連じゃんけん！！',style: TextStyle(fontSize: 20, color: Colors.white),),
            SizedBox(height: screenSize.height * 0.05),
            Text('カニくんとじゃんけんしてあげよう！', style: TextStyle(fontSize: 20, color: Colors.white),),
            Image.asset('assets/images/kani.PNG', height: screenSize.height * 0.4),
            SizedBox(height: screenSize.height * 0.05),
            SizedBox(
              width: 300,
              child: MaterialButton(
                child: Text('始める！', style: TextStyle(fontSize: 30),),
                padding: EdgeInsets.all(20),
                color: Colors.white,
                textColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
                onPressed: () {
                  player.play(AssetSource('tap.mp3'));
                  Navigator.push(context,
                    PageTransition(
                      child: AnswerPage(title: 'kani'), //画面遷移先
                      type: PageTransitionType.fade,
                      duration: Duration(milliseconds: 300),//アニメーションの時間
                    ),
                  );
                },
              ),
            ),
            Spacer(),
          ],
        ),
      ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}