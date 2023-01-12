import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';
import 'package:janken/winPage.dart';


class AnswerPage extends StatefulWidget {
  AnswerPage({Key? key, required this.title}) : super(key: key);
  String title;

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
  String enemyName = "";
  var normalImage, guImage, chokiImage,paImage =  null;



  void _guAnswer() {
    setState(() {
      _visible = !_visible;
      var rand = math.Random();
      if (rand.nextInt(3) == 1) {
        _answer = "敵の手はチョキ";
        _answer2 = "あなたの勝ちです";
        win++;
        total++;
      } else if (rand.nextInt(3) == 1) {
        _answer = "敵の手はグー";
        _answer2 = "あいこ、もう一回！";
      }else {
        _answer = "敵の手はパー";
        _answer2 = "あなたの負けです";
        total++;
      }
    });
    uiWidget();
  }

  void _chokiAnswer() {
    setState(() {
      _visible = !_visible;
      var rand = math.Random();
      if (rand.nextInt(3) == 0) {
        _answer = "敵の手はパー";
        _answer2 = "あなたの勝ちです";
        win++;
        total++;
      } else if (rand.nextInt(3) == 1) {
        _answer = "敵の手はチョキ";
        _answer2 = "あいこ、もう一回！";
      } else {
        _answer = "敵の手はグー";
        _answer2 = "あなたの負けです";
        total++;
      }
    });
    uiWidget();
  }

  void _paAnswer() {
    setState(() {
      _visible = !_visible;
      var rand = math.Random();
      if (rand.nextInt(3) == 1) {
        _answer = "敵の手はグー";
        _answer2 = "あなたの勝ちです";
        win++;
        total++;
      } else if (rand.nextInt(3) == 1) {
        _answer = "敵の手はパー";
        _answer2 = "あいこ、もう一回！";
      }else {
        _answer = "敵の手はチョキ";
        _answer2 = "あなたの負けです";
        total++;
      }
    });
    uiWidget();
  }

  void _next() {
    setState(() {
      _visible = !_visible;
      startNext = "NEXT!!";
    });
    _answer = "";
    if(_answer2 == "あいこ、もう一回！") _answer2 = "あいこで・・・";
    else _answer2 = "最初はグー、じゃんけん・・・";
    if(total == 10){
      if(win >= 3){
        // String A = win as String;
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => WinPage(title: 'dora', winN: win,)),
        );
      }
      else{
      }
    }
    else {uiWidget();}
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
                children: uiWidget()
            ),
          ),
        ),
    );
  }

  List<Widget> uiWidget() {
    Widget ifEnemy() {
      if (widget.title == "dora") {
        enemyName = "VS　ドラ";
        normalImage = Image.asset('images/dora.PNG', height: 400);
        guImage = Image.asset('images/dora_gu.PNG', height: 400);
        chokiImage = Image.asset('images/dora_choki.PNG', height: 400);
        paImage = Image.asset('images/dora_pa.PNG', height: 400);
      };
      return Text(enemyName, style: TextStyle(fontSize: 40, color: Colors.white),);
    };
    return <Widget>[
      Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('$win / $total', style: TextStyle(fontSize: 50, color: Colors.white),),
          ]
      ),
      ifEnemy(),
      if (_answer == "") normalImage,
      if (_answer == "敵の手はグー") guImage,
      if (_answer == "敵の手はチョキ") chokiImage,
      if (_answer == "敵の手はパー") paImage,
      Text("$_answer", style: GoogleFonts.reggaeOne(
        textStyle: Theme.of(context).textTheme.headline4,
        color: Colors.white,
        fontSize: 30,
      ),),
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