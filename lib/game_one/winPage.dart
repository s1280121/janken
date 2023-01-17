import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janken/game_one/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'backbutton.dart';


class WinPage extends StatefulWidget {
  int winN;
  WinPage({Key? key, required this.winN}) : super(key: key);

  @override
  State<WinPage> createState() => _WinPageState();
}

class _WinPageState extends State<WinPage> {
  String startNext = "START!!";
  String enemyName = "VS　ドラ";
  String nextEnemy = "kani";
  var winImage = null;

  int N = 0;

  final prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    init();
  }

  // 画面起動時に読み込むメソッド
  void init() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      //　データの読み込み
      N = prefs.getInt('win')!;
      //　勝率が越された時のみ更新
      if(widget.winN > N) prefs.setInt('win', widget.winN);

      //　更新した瞬間最高記録も変えるならここも必要？
      // N = prefs.getInt('win')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("じゃんけんページ"),
        automaticallyImplyLeading: false, // 自動で生成される戻るボタンを無効化
        leading: const WinPageBackButton(),
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
    return <Widget>[
      SizedBox(height: 100,),
      // 最高記録表示
      Text('これまでの最高記録', style: TextStyle(fontSize: 40, color: Colors.white),),
      Text(N.toString() + '/10', style: GoogleFonts.reggaeOne(
          textStyle: Theme.of(context).textTheme.headline4,
          color: Colors.white,
          fontSize: 50,
        ),),
      // 勝負後の画面遷移なら当回の勝率も表示
      if(widget.winN != -1)
        Column(
          children: [
            Text('今回の記録', style: TextStyle(fontSize: 40, color: Colors.white),),
            Text(widget.winN.toString() + '/10', style: GoogleFonts.reggaeOne(
              textStyle: Theme.of(context).textTheme.headline4,
              color: Colors.white,
              fontSize: 50,
            ),),
          ],
        ),
      Text('\nお見事！！！', style: TextStyle(fontSize: 40, color: Colors.white),),
      SizedBox(height: 50),
      if(widget.winN != -1)
        Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              onPrimary: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  // builder: (BuildContext context) => AnswerPage(title: nextEnemy,),
                  builder: (BuildContext context) => OneMainPage(),
                ),
              );
            },
            child: const Text('→',style: TextStyle(fontSize: 100,)),
          ),
          SizedBox(height: 70,),
        ],
      ),
    ];
  }
}