import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:google_fonts/google_fonts.dart';

class TicTacToeHomePage extends StatefulWidget {
  @override
  _TicTacToeHomePageState createState() => _TicTacToeHomePageState();
}

class _TicTacToeHomePageState extends State<TicTacToeHomePage> {
  bool onTurn = true; //first tun is for O player
  List<int> _playerScore = [0, 0];
  int filledBox = 0;
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];
  String chance = 'O';
  static var newFont = GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: Colors.black, letterSpacing: 3));
  static var newFontWhite = GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: Colors.white, letterSpacing: 3));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tic Tac Toe',
              style: GoogleFonts.pressStart2p(
                color: Colors.white,
              )),
          centerTitle: true,
          backgroundColor: Colors.black87,
        ),
        backgroundColor: Colors.black87,
        body: Column(
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: Text('ScoreBoard',
                          textScaleFactor: 1.5, style: newFontWhite),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _clearboard();
                          _playerScore[0] = 0;
                          _playerScore[1] = 0;
                        });
                      },
                      child: CircleAvatar(
                          radius: 15.0,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.refresh,
                            size: 25.0,
                          )),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                defaultColumnWidth: FlexColumnWidth(2.0),
                border: TableBorder.all(color: Colors.white, width: 1.0),
                children: [
                  TableRow(children: <Widget>[
                    Center(
                      child: Text('Player O',
                          textScaleFactor: 1.2, style: newFontWhite),
                    ),
                    Center(
                        child: Text(
                      'Player X',
                      textScaleFactor: 1.2,
                      style: newFontWhite,
                    ))
                  ]),
                  TableRow(children: <Widget>[
                    Center(
                      child: Text(_playerScore[0].toString(),
                          textScaleFactor: 2, style: newFontWhite),
                    ),
                    Center(
                      child: Text(_playerScore[1].toString(),
                          textScaleFactor: 2, style: newFontWhite),
                    )
                  ])
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Play ' + chance,
              style: newFontWhite,
              textScaleFactor: 1.5,
            ),
            SizedBox(height: 10.0),
            Expanded(
              flex: 2,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade700)),
                        child: Center(
                            child: Text(displayXO[index],
                                textScaleFactor: 3, style: newFontWhite))),
                  );
                },
              ),
            ),
            Container(
              child: Text('Tic Tac Toe',
                  textScaleFactor: 1.6, style: newFontWhite),
            ),
            SizedBox(height: 8.0),
            Center(
              child: Container(
                padding: EdgeInsets.only(bottom: 20.0, top: 30.0),
                child: Text('@CreatedBy:Suyog',
                    style: GoogleFonts.pressStart2p(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ));
  }

  void _tapped(int idx) {
    setState(() {
      if (onTurn && displayXO[idx] == '') {
        displayXO[idx] = 'O';
        onTurn = !onTurn;
        filledBox += 1;
      } else if (displayXO[idx] == '') {
        displayXO[idx] = 'X';
        filledBox += 1;
        onTurn = !onTurn;
      }

      chance = onTurn ? 'O' : 'X';
      _checkwinner();
    });
  }

  void _checkwinner() {
    //first row
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      _showDialog(displayXO[0]);
    } //second row
    else if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      _showDialog(displayXO[3]);
    } //third row
    else if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      _showDialog(displayXO[6]);
    }
    //first column
    else if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      _showDialog(displayXO[0]);
    } //second column
    else if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      _showDialog(displayXO[1]);
    } //third column
    else if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      _showDialog(displayXO[2]);
    } //Principle digonal
    else if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      _showDialog(displayXO[0]);
    } //digonal 2
    else if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != '') {
      _showDialog(displayXO[2]);
    } else if (filledBox == 9) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(' It was DRAW', style: newFont),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      setState(() {
                        _clearboard();
                        Navigator.of(context).pop();
                      });
                    },
                    child: Text('Play Agin', style: newFont))
              ],
            );
          });
    }
  }

  void _showDialog(String winplayer) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          if (winplayer == 'O') {
            _playerScore[0] += 1;
          } else if (winplayer == 'X') {
            _playerScore[1] += 1;
          }

          return AlertDialog(
            title: Text(winplayer + ' Player wins', style: newFont),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    setState(() {
                      _clearboard();
                      Navigator.of(context).pop();
                    });
                  },
                  child: Text('Play Agin', style: newFont))
            ],
          );
        });
  }

  void _clearboard() {
    for (int i = 0; i < displayXO.length; i++) {
      displayXO[i] = '';
    }
    filledBox = 0;
  }
}

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: Text('Tic Tac Toe',
                  style: GoogleFonts.pressStart2p(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
              child: AvatarGlow(
                  glowColor: Colors.white,
                  duration: Duration(seconds: 2),
                  child: Container(
                      child: CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.white,
                    child: Container(
                        decoration: BoxDecoration(),
                        child: Image.asset(
                          'assets/images/tic.png',
                          fit: BoxFit.scaleDown,
                        )),
                  )),
                  endRadius: 140.0)),
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: Text('@CreatedBy:Suyog',
                  style: GoogleFonts.pressStart2p(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(bottom: 60.0, top: 40.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => TicTacToeHomePage()));
                },
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(30.0),
                        child: Text('Play Again',
                            style: GoogleFonts.pressStart2p(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold)))),
              ))
        ],
      ),
    );
  }
}
