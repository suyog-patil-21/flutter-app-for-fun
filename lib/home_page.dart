import 'package:flutter/material.dart';
import 'package:fun_app/pages/dice/dice.dart';
import 'package:fun_app/myfonts.dart';
import 'package:fun_app/pages/magic_ball_8/magicball8.dart';
import 'package:fun_app/pages/quizzler/quizmain.dart';
import 'package:fun_app/pages/tic_tac_toe/tictactoe_homepage.dart';
import 'package:fun_app/pages/xylophone/xylophone_main.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:
          AppBar(centerTitle: true, title: Text('Fun App', style: titlefont)),
      body: ListView(children: [
        const SizedBox(height: 10.0),
        ImageButton(
            name: 'Roll Dice',
            color: Colors.red,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => DicePage()));
            }),
        const SizedBox(height: 10.0),
        ImageButton(
            name: 'Quizzler',
            color: Colors.deepOrange,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => QuizPage()));
            }),
        const SizedBox(height: 10.0),
        ImageButton(
            name: 'Tic Tac Toe',
            color: Colors.blueAccent,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => TicTacToeHomePage()));
            }),
        const SizedBox(height: 10.0),
        ImageButton(
            name: 'Magic Ball 8',
            color: Colors.blueGrey.shade900,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MagicBall8Page()));
            }),
        const SizedBox(height: 10.0),
        ImageButton(
            name: 'Xylophone',
            color: Colors.yellow,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => XylophoneApp()));
            }),
        const SizedBox(height: 10.0),
      ]),
    );
  }
}

Widget ImageButton({
  required String? name,
  Color color = Colors.white,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.zero,
      height: 120.0,
      width: double.infinity,
      child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              '$name',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          )),
      color: color,
    ),
  );
}
