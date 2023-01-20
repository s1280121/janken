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
  int N = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: Text('100連じゃんけん'),
        pop: CustomBackButton(screen: MyApp(),), appBar: AppBar(),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/mori.jpg'),
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
            Text('100連じゃんけん！！',style: TextStyle(fontSize: 20, color: Colors.white),),
            Text('次々と現れる敵を倒していこう', style: TextStyle(fontSize: 20, color: Colors.white),),
            SizedBox(height: 20,),
            Image.asset('images/dora.PNG', height: 400),
            SizedBox(height: 80),
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
                  Navigator.push(context,
                    PageTransition(
                      child: AnswerPage(title: 'dora'), //画面遷移先
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