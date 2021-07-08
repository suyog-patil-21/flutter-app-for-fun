import 'package:flutter/material.dart';
import 'dart:math';

class MagicBall8Page extends StatefulWidget {
  @override
  _MagicBall8PageState createState() => _MagicBall8PageState();
}

class _MagicBall8PageState extends State<MagicBall8Page> {
  var imageNum = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ask Me Anything'),
        backgroundColor: Colors.blue[900],
      ),
      body: Center(
        child: FittedBox(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            InkWell(
                onTap: () {
                  setState(() {
                    imageNum = Random().nextInt(5) + 1;
                  });
                },
                child: Container(
                  child: Image.asset(
                      'assets/images/magic_ball8/ball$imageNum.png'),
                )),
            Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('Tap to Check Your Fortune',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                      // color: Colors.white
                    )))
          ]),
        ),
      ),
    );
  }
}
