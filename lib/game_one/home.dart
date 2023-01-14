import 'package:flutter/material.dart';

import 'answer.dart';

class OneMainPage extends StatefulWidget {
  OneMainPage({Key? key, required this.newrecord}) : super(key: key);

  final int newrecord;

  @override
  _OneMainPageState createState() => _OneMainPageState();
}

class _OneMainPageState extends State<OneMainPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('上い'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if(widget.newrecord!=0)Text('最高記録\n${widget.newrecord}/50'),
            Image.asset('images/dora.PNG', height: 400),
            Text('勝ち抜きゲーム！！'),
            Text('次々と現れる敵を倒していこう'),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => AnswerPage(title: 'dora',),
                  ),
                );
              },
              child: const Text('始める'),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}