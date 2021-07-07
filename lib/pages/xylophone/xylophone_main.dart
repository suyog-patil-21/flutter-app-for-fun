import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class XylophoneApp extends StatelessWidget {
  void playSound(int index) {
    final player = AudioCache(prefix: 'assets/sound/');
    player.play('note$index.wav');
  }

  Widget buildKey({required int index, required Color color}) {
    return Expanded(
        child: FlatButton(
      onPressed: () {
        playSound(index);
      },
      color: color,
      child: Container(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Xylophone'),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildKey(index: 1, color: Colors.red),
            buildKey(index: 2, color: Colors.orange),
            buildKey(index: 3, color: Colors.yellow),
            buildKey(index: 4, color: Colors.green),
            buildKey(index: 5, color: Colors.blue),
            buildKey(index: 6, color: Colors.lightBlue),
            buildKey(index: 7, color: Colors.purple),
          ],
        )),
      ),
    );
  }
}
