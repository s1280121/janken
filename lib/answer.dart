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
  bool _visible = false;
  int total = 0;
  int win = 0;
  String startNext = "START!!";


  void _guAnswer() {
    setState(() {
      _visible = !_visible;
      var rand = math.Random();
      if (rand.nextInt(3) == 1) {
        _answer = "敵の手はチョキ";
        _answer2 = "であなたの勝ちです";
        win++;
        total++;
      } else if (rand.nextInt(3) == 1) {
        _answer = "敵の手はグー";
        _answer2 = "あいこ";
      }else {
        _answer = "敵の手はパー";
        _answer2 = "であなたの負けです";
        total++;
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
      _visible = !_visible;
      var rand = math.Random();
      if (rand.nextInt(3) == 0) {
        _answer = "敵の手はパー";
        _answer2 = "であなたの勝ちです";
        win++;
        total++;
      } else if (rand.nextInt(3) == 1) {
        _answer = "敵の手はチョキ";
        _answer2 = "あいこ";
      } else {
        _answer = "敵の手はグー";
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
      _visible = !_visible;
      var rand = math.Random();
      if (rand.nextInt(3) == 1) {
        _answer = "敵の手はグー";
        _answer2 = "であなたの勝ちです";
        win++;
        total++;
      } else if (rand.nextInt(3) == 1) {
        _answer = "敵の手はパー";
        _answer2 = "あいこ";
      }else {
        _answer = "敵の手はチョキ";
        _answer2 = "であなたの負けです";
        total++;
      }
    });
    if(total == 10){
    }
    else {notAnswerWidget();}
  }

  void _next() {
    setState(() {
      _visible = !_visible;
      startNext = "NEXT!!";
    });
    _answer = "";
    if(_answer2 == "あいこ") _answer2 = "あいこで・・・";
    else _answer2 = "最初はグー、じゃんけん・・・";
    notAnswerWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("じゃんけんページ"),
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
                children: notAnswerWidget()
            ),
          ),
        ),
    );
  }

  List<Widget> notAnswerWidget() {
    return <Widget>[
      Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('$win / $total', style: TextStyle(fontSize: 50, color: Colors.white),),
          ]
      ),
      Text("$_answer", style: TextStyle(fontSize: 30, color: Colors.white),),
      if (_answer == "") Image.asset('images/dora.PNG', height: 400),
      if (_answer == "敵の手はグー") Image.asset('images/dora_gu.PNG', height: 400),
      if (_answer == "敵の手はチョキ") Image.asset('images/dora_choki.PNG', height: 400),
      if (_answer == "敵の手はパー") Image.asset('images/dora_pa.PNG', height: 400),
      Text(_answer2, style: TextStyle(fontSize: 20, color: Colors.white),),
      Spacer(),
      if(_visible == false)
        Visibility(
          visible: !_visible,
          child: GestureDetector(
            onTap: () {
              _next();
            },
            child: Container(
              height: 150,
              width: double.infinity,
              color: Colors.grey,
              child: Center(child: Text(startNext, style: TextStyle(fontSize: 40),)),
            ),
          ),
        ),
      if(_visible == true)
      Container(
        height: 150,
        color: Colors.grey,
        child: Visibility(
          visible: _visible,
          child: Row(
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
        ),
      ),
    ];
  }
}