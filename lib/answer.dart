import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnswerPage extends StatefulWidget {
  AnswerPage({Key? key}) : super(key: key);
  @override
  _AnswerPageState createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswerPage> {
  String _answer = "";
  String _answer2 = "";
  bool showFirst = true;
  int total = 0;
  int win = 0;


  void _guAnswer() {
    setState(() {
      var rand = math.Random();
      if (rand.nextInt(3) == 1) {
        _answer = "チョキ";
        _answer2 = "であなたの勝ちです";
        win++;
        total++;
        showFirst = !showFirst;
      } else if (rand.nextInt(3) == 1) {
        _answer = "グー";
        _answer2 = "あいこで・・・";
        showFirst = !showFirst;
      }else {
        _answer = "パー";
        _answer2 = "であなたの負けです";
        total++;
        showFirst = !showFirst;
      }
    });
    if(total == 10){
      if(win >= 5){
      }
      else{
      }
    }
    else {notAnswerWidget();}
  }

  void _chokiAnswer() {
    setState(() {
      var rand = math.Random();
      if (rand.nextInt(3) == 0) {
        _answer = "パー";
        _answer2 = "であなたの勝ちです";
        win++;
        total++;
      } else if (rand.nextInt(3) == 1) {
        _answer = "チョキ";
        _answer2 = "あいこで・・・";
      } else {
        _answer = "グー";
        _answer2 = "であなたの負けです";
        total++;
      }
    });
    if(total == 10){
    }
    else { notAnswerWidget();}
  }

  void _paAnswer() {
    setState(() {
      var rand = math.Random();
      if (rand.nextInt(3) == 1) {
        _answer = "グー";
        _answer2 = "であなたの勝ちです";
        win++;
        total++;
      } else if (rand.nextInt(3) == 1) {
        _answer = "パー";
        _answer2 = "あいこで・・・";
      }else {
        _answer = "チョキ";
        _answer2 = "であなたの負けです";
        total++;
      }
    });
    if(total == 10){
    }
    else {notAnswerWidget();}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("じゃんけんページ"),
        ),
        body: Center(
            child: Column(
              children: notAnswerWidget()
            ),
        )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<Widget> notAnswerWidget() {
    return <Widget>[
      Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('$win / $total', style: TextStyle(fontSize: 50),),          ]
      ),
      Text("敵の手は $_answer"),
      if (_answer == "") Image.asset('images/kogepan.png', height: 200),
      if (_answer == "グー") AnimatedCrossFade(
        firstChild: Image.asset('images/gu.png', height: 200),
        secondChild: Image.asset('images/kogepan.png', height: 200),
        duration: Duration(seconds: 1),
        crossFadeState: showFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      ),
      if (_answer == "チョキ") Image.asset('images/choki.png', height: 200),
      if (_answer == "パー") Image.asset('images/pa.png', height: 200),
      Text(_answer2),
      SizedBox(height: 50),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            shape: CircleBorder(),
            onPressed: _guAnswer,
            child: ClipOval(
                child: Image(
                  width: 100,
                  image: AssetImage('images/gu.png'),
                  fit: BoxFit.contain,
                )
            ),
          ),
          RaisedButton(
            shape: CircleBorder(),
            onPressed: _chokiAnswer,
            child: ClipOval(
                child: Image(
                  width: 80,
                  image: AssetImage('images/choki.png'),
                  fit: BoxFit.contain,
                )
            ),
          ),
          RaisedButton(
            shape: CircleBorder(),
            onPressed: _paAnswer,
            child: ClipOval(
                child: Image(
                  width: 70,
                  image: AssetImage('images/pa.png'),
                  fit: BoxFit.contain,
                )
            ),
          ),
        ],
      ),
    ];
  }
}