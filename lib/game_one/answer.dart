import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';
import 'package:janken/game_one/result.dart';
import 'package:page_transition/page_transition.dart';

import '../main.dart';


class AnswerPage extends StatefulWidget {
  AnswerPage({Key? key, required this.title}) : super(key: key);
  String title;

  @override
  _AnswerPageState createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswerPage> {
  final player = AudioPlayer(); //タップ音
  final bgm = AudioPlayer(); //バトルBGM

  String _answer = "僕に勝てるかな？";
  String _answer2 = "";
  bool _visible = false;
  int total = 0;
  int win = 0;
  String startNext = "START!!";
  String enemyName = "";
  var normalImage, guImage, chokiImage, paImage =  null;

  @override
  void initState() {
    super.initState();
    bgm.setReleaseMode(ReleaseMode.loop);
    init();
  }

  // 画面起動時に読み込む
  void init() async {
    bgm.play(AssetSource('battle.mp3'));
  }

  void _guAnswer() {
    player.play(AssetSource('tap.mp3'));
    setState(() {
      _visible = !_visible;
      var rand = math.Random();
      if (rand.nextInt(3) == 0) {
        _answer = "敵の手はチョキ";
        _answer2 = "あなたの勝ちです";
        win++;
        total++;
        if(total == 10) startNext = "RESULT!!";
      } else if (rand.nextInt(3) == 1) {
        _answer = "敵の手はグー";
        _answer2 = "あいこ、もう一回！";
      }else {
        _answer = "敵の手はパー";
        _answer2 = "あなたの負けです";
        total++;
        if(total == 10) startNext = "RESULT!!";
      }
    });
    uiWidget();
  }

  void _chokiAnswer() {
    player.play(AssetSource('tap.mp3'));
    setState(() {
      _visible = !_visible;
      var rand = math.Random();
      if (rand.nextInt(3) == 0) {
        _answer = "敵の手はパー";
        _answer2 = "あなたの勝ちです";
        win++;
        total++;
        if(total == 10) startNext = "RESULT!!";
      } else if (rand.nextInt(3) == 1) {
        _answer = "敵の手はチョキ";
        _answer2 = "あいこ、もう一回！";
      } else {
        _answer = "敵の手はグー";
        _answer2 = "あなたの負けです";
        total++;
        if(total == 10) startNext = "RESULT!!";
      }
    });
    uiWidget();
  }

  void _paAnswer() {
    player.play(AssetSource('tap.mp3'));
    setState(() {
      _visible = !_visible;
      var rand = math.Random();
      if (rand.nextInt(3) == 0) {
        _answer = "敵の手はグー";
        _answer2 = "あなたの勝ちです";
        win++;
        total++;
        if(total == 10) startNext = "RESULT!!";
      } else if (rand.nextInt(3) == 1) {
        _answer = "敵の手はパー";
        _answer2 = "あいこ、もう一回！";
      }else {
        _answer = "敵の手はチョキ";
        _answer2 = "あなたの負けです";
        total++;
        if(total == 10) startNext = "RESULT!!";
      }
    });
    uiWidget();
  }

  void _next() {
    if(startNext == 'START!!') player.play(AssetSource('start.mp3'));
    if(startNext == 'NEXT!!') player.play(AssetSource('tap.mp3'));
    if(startNext == 'RESULT!!') {
      bgm.stop();
      player.play(AssetSource('tap.mp3'));
    }
    if(total != 10 || total != 0) startNext = "NEXT!!";
    setState(() {
      _visible = !_visible;
    });
    _answer = "";
    if(_answer2 == "あいこ、もう一回！") _answer2 = "あいこで・・・";
    else _answer2 = "最初はグー、じゃんけん・・・";
    if(total == 10){
      Navigator.push(context,
        PageTransition(
          child: ResultPage(winN: win), //画面遷移先
          type: PageTransitionType.fade,
          duration: Duration(milliseconds: 300),//アニメーションの時間
        ),
      );
    }
    else {uiWidget();}
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,   //戻るボタン無効
      child: Scaffold(
        appBar: AppBar(
          title: Text('10連じゃんけん'),
          backgroundColor: Colors.white,
          centerTitle: true,
          automaticallyImplyLeading: false, //戻るボタン非表示
          // actions: <Widget>[
          //   IconButton(
          //     icon: const Icon(
          //       Icons.home,
          //       color: Colors.black,
          //     ),
          //     onPressed: () {
          //       bgm.stop();
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => MyApp(),
          //           fullscreenDialog: true,
          //         ),
          //       );
          //     },
          //   ),
          // ],
        ),
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/sea.jpeg'),
                  fit: BoxFit.cover,
                )
            ),
            child: Column(
                  children: uiWidget()
              ),
            ),
      ),
    );
  }

  List<Widget> uiWidget() {
    var screenSize = MediaQuery.of(context).size;
    Widget ifEnemy() {
      if (widget.title == "kani") {
        enemyName = "VS　カニ太郎";
        normalImage = Image.asset('assets/images/kani.PNG', height: screenSize.height * 0.35);
        guImage = Image.asset('assets/images/kani_gu.PNG', height: screenSize.height * 0.35);
        chokiImage = Image.asset('assets/images/kani_choki.PNG', height: screenSize.height * 0.35);
        paImage = Image.asset('assets/images/kani_pa.PNG', height: screenSize.height * 0.35);
      };
        return Text(enemyName, style: TextStyle(fontSize: 30, color: Colors.white));
    };
    return <Widget>[
      Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('$win / $total', style: TextStyle(fontSize: 40, color: Colors.white),),
          ]
      ),
      ifEnemy(),
      if (_answer == "僕に勝てるかな？" || _answer == "") normalImage,
      if (_answer == "敵の手はグー") guImage,
      if (_answer == "敵の手はチョキ") chokiImage,
      if (_answer == "敵の手はパー") paImage,
      Text("$_answer", style: GoogleFonts.reggaeOne(
        textStyle: Theme.of(context).textTheme.headline4,
        color: Colors.white,
        fontSize: 30,
      ),),
      Text(_answer2, style: TextStyle(fontSize: 25, color: Colors.white),),
      Spacer(),
      if(_visible == false)
        if(startNext == 'NEXT!!')
        Container(
          height: screenSize.height * 0.2,
          alignment: Alignment.bottomCenter,
          child: Visibility(
            visible: !_visible,
            child: GestureDetector(
              onTap: () {
                _next();
              },
              child: Container(
                height: 150,
                width: double.infinity,
                color: Colors.white,
                child: Center(child: Text(startNext, style: TextStyle(fontSize: 50),)),
              ),
            ),
          ),
        ),
      if(_visible == false)
        if(startNext == 'START!!' || startNext == 'RESULT!!')
          Container(
            height: screenSize.height * 0.2,
            alignment: Alignment.bottomCenter,
            child: Visibility(
              visible: !_visible,
              child: GestureDetector(
                onTap: () {
                    _next();
                },
                child: Container(
                  height: 150,
                  width: double.infinity,
                  color: Colors.orange,
                  child: Center(child: Text(startNext, style: TextStyle(fontSize: 50),)),
                ),
              ),
            ),
          ),
      if(_visible == true)
      Container(
        height: screenSize.height * 0.2,
        alignment: Alignment.center,
        color: Colors.grey,
        child: Visibility(
          visible: _visible,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<CircleBorder>(
                    CircleBorder(),
                  ),
                ),
                onPressed: () {
                  if(0 <= total && total < 10)
                    _guAnswer();
                },
                child: ClipOval(
                    child: Image(
                      width: screenSize.width * 0.25,
                      image: AssetImage('assets/images/gu.png'),
                      fit: BoxFit.fitWidth,
                    )
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<CircleBorder>(
                    CircleBorder(),
                  ),
                ),
                onPressed: () {
                  if(0 <= total && total < 10)
                    _chokiAnswer();
                },
                child: ClipOval(
                    child: Image(
                      width: screenSize.width * 0.23,
                      image: AssetImage('assets/images/choki.png'),
                      fit: BoxFit.fitWidth,
                    )
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<CircleBorder>(
                    CircleBorder(),
                  ),
                ),
                onPressed: () {
                  if(0 <= total && total < 10)
                    _paAnswer();
                },
                child: ClipOval(
                    child: Image(
                      width: screenSize.width * 0.26,
                      image: AssetImage('assets/images/pa.png'),
                      fit: BoxFit.fitWidth,
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