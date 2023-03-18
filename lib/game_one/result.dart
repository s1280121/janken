import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janken/game_one/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/appbar.dart';
import '../common/backbutton.dart';


class ResultPage extends StatefulWidget {
  int winN; //対戦画面から引き継いだ結果
  ResultPage({Key? key, required this.winN}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final player = AudioPlayer();

  String startNext = "START!!";
  String enemyName = "VS　カニ太郎";
  String nextEnemy = "kani";
  var winImage = null;

  int N = 0;  //最高記録を記録しておく値
  bool isNewRecord = false;

  final prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    init();
  }

  // 画面起動時に読み込む
  void init() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      //　データの読み込み
      N = prefs.getInt('win')!;
      //　勝率が越された時のみ更新
      if(widget.winN > N) prefs.setInt('win', widget.winN);
    });
    isNewRecord = false;
  }

  _setNtoWin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('win', N);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: Text('記録'),
        pop: CustomBackButton(screen: OneMainPage(),), appBar: AppBar(),
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
              children: uiWidget()
          ),
        ),
      ),
    );
  }

  List<Widget> uiWidget() {
    var screenSize = MediaQuery.of(context).size;
    Widget ifEnemy() {
      if(widget.winN > N && widget.winN != -1) isNewRecord = true;
      if(widget.winN > N) N = widget.winN;
      return Text('\n');
    }
    ifEnemy();
    _setNtoWin();
    return <Widget>[
      if(isNewRecord == true) Text('記録更新！！', style: TextStyle(fontSize: 40, color: Colors.white),),
      if(N == 0) Text('記録なし', style: TextStyle(fontSize: 40, color: Colors.white),),
      if(N != 0) Column(children: <Widget>[
        SizedBox(height: screenSize.height * 0.1,),
        Text('最高記録', style: TextStyle(fontSize: 40, color: Colors.white),),
        Text(N.toString() + '/10', style: GoogleFonts.reggaeOne(
          textStyle: Theme.of(context).textTheme.headline4,
          color: Colors.white,
          fontSize: 40,
        ),
        ),
        SizedBox(height: screenSize.height * 0.07,),
        if(widget.winN == -1 && N >= 7) Text('素晴らしい!!', style: TextStyle(fontSize: 40, color: Colors.white),),
        if(widget.winN == -1 && N < 7) Text('頑張ろう!!', style: TextStyle(fontSize: 40, color: Colors.white),),
      // 勝負後の画面遷移なら当回の勝率も表示
        if(widget.winN != -1)
          Column(
            children: [
            Text('今回の記録', style: TextStyle(fontSize: 40, color: Colors.white),),
            Text(widget.winN.toString() + '/10', style: GoogleFonts.reggaeOne(
              textStyle: Theme.of(context).textTheme.headline4,
              color: Colors.white,
              fontSize: 40,
            ),),
          ],
        ),
        SizedBox(height: screenSize.height * 0.05,),
        if(widget.winN != -1 && widget.winN >= 7) Text('素晴らしい!!', style: TextStyle(fontSize: 40, color: Colors.white),),
        if(widget.winN != -1 && widget.winN < 7) Text('頑張ろう!!', style: TextStyle(fontSize: 40, color: Colors.white),),
        // SizedBox(height: 50),
        //じゃんけん後の場合下に→
        // if(widget.winN != -1)
        //   Row(
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     children: [
        //       ElevatedButton(
        //         style: ElevatedButton.styleFrom(
        //           primary: Colors.transparent,
        //           onPrimary: Colors.white,
        //         ),
        //         onPressed: () {
        //           player.play(AssetSource('tap.mp3'));
        //           Navigator.push(context,
        //             PageTransition(
        //               child: OneMainPage(), //画面遷移先
        //               type: PageTransitionType.fade,
        //               duration: Duration(milliseconds: 300),//アニメーションの時間
        //           ),
        //           );
        //           },
        //         child: const Text('→',style: TextStyle(fontSize: 100,)),
        //       ),
        //     ],
        //   ),
      ],
      ),
    ];
  }
}