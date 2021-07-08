import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// * globle variable
// * random change the value

//! PageView don't working in linux
var leftpress = 1;
var rightpress = 1;

class DicePage extends StatelessWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Roll Dice'),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: Icon(Icons.help_center_rounded),
            onPressed: () {
              Alert(
                      context: context,
                      title: "HELP",
                      desc: "Swipe to Change the Number of Dice.")
                  .show();
            },
          )
        ],
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: MyPageView(),
    );
  }
}

class MyPageView extends StatefulWidget {
  const MyPageView({Key? key}) : super(key: key);

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        SingleDicePage(),
        DoubleDicePage(),
      ],
    );
  }
}

class SingleDicePage extends StatefulWidget {
  @override
  _SingleDicePageState createState() => _SingleDicePageState();
}

class _SingleDicePageState extends State<SingleDicePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Single Dice',
          style: TextStyle(
            fontSize: 35.0,
          ),
        ),
        Expanded(
          flex: 1,
          child: GestureDetector(
            child: TextButton(
              child: Image.asset(
                'assets/images/dices/dice$leftpress.png',
              ),
              onPressed: () {
                setState(() {
                  leftpress = Random().nextInt(6) + 1;
                });
              },
            ),
          ),
        ),
        helpshuffle,
      ],
    );
  }
}

class DoubleDicePage extends StatefulWidget {
  @override
  _DoubleDicePageState createState() => _DoubleDicePageState();
}

class _DoubleDicePageState extends State<DoubleDicePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Column(
        children: <Widget>[
          const Text(
            'Double Dice',
            style: TextStyle(
              fontSize: 35.0,
            ),
          ),
          Container(
              child: Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _changeData();
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child:
                        Image.asset('assets/images/dices/dice$leftpress.png'),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child:
                        Image.asset('assets/images/dices/dice$rightpress.png'),
                  ),
                ],
              ),
            ),
          )),
          helpshuffle,
        ],
      ),
    );
  }

  void _changeData() {
    leftpress = Random().nextInt(6) + 1;
    rightpress = Random().nextInt(6) + 1;
  }
}

const Widget helpshuffle = Padding(
    padding: EdgeInsets.all(6.0),
    child: Text('Tap To Shuffle ',
        style: TextStyle(
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w700,
          // color: Colors.white
        )));
