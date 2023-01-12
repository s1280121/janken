import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janken/answer.dart';

class WinPage extends StatefulWidget {
  var title;
  int winN;
  WinPage({Key? key, required this.title, required this.winN}) : super(key: key);

  @override
  State<WinPage> createState() => _WinPageState();
}

class _WinPageState extends State<WinPage> {
  String startNext = "START!!";
  String enemyName = "VS　ドラ";
  String nextEnemy = "kani";
  var winImage = null;


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
        winImage = Image.asset('images/dora.PNG', height: 400);
      };
      return Text(
        enemyName, style: TextStyle(fontSize: 40, color: Colors.white),);
    };
    return <Widget>[
      ifEnemy(),
      Text(widget.winN.toString() + '/10', style: GoogleFonts.reggaeOne(
        textStyle: Theme.of(context).textTheme.headline4,
        color: Colors.white,
        fontSize: 30,
      ),),
      winImage,
      Spacer(),
      SizedBox(
        width: double.infinity,
        height: 130,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.orange,
            onPrimary: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                // builder: (BuildContext context) => AnswerPage(title: nextEnemy,),
                builder: (BuildContext context) => AnswerPage(title: 'dora',),
              ),
            );
          },
          child: const Text('次のステージへ'),
        ),
      ),
    ];
  }
}
