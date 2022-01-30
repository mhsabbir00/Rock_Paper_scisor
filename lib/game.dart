import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  String userChoise = "";
  String comChoise = "";
  String message = "";
  double myPoints = 0.0;
  bool hasChosen = false;
  List<String> _choise = ["rock", "Paper", "scisor"];
  Widget iPicked = Container(), comPicked = Container();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 30.0,
          left: 8.0,
          right: 8.0,
          bottom: 8.0,
        ),
        decoration: BoxDecoration(
            gradient: RadialGradient(colors: [
          HSLColor.fromAHSL(1, 214, 0.47, 0.23).toColor(),
          HSLColor.fromAHSL(1, 239, 0.49, 0.15).toColor()
        ])),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 3.0,
                      color: HSLColor.fromAHSL(1, 217, 0.16, 0.45).toColor()),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'ROCK\nPAPER\nSCISOR',
                    style: GoogleFonts.barlowSemiCondensed(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 24.0,
                    ),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(100, 80)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: null,
                      child: RichText(
                          text: TextSpan(
                              style: TextStyle(fontWeight: FontWeight.w700),
                              children: <TextSpan>[
                            TextSpan(
                                text: "Score\n",
                                style: GoogleFonts.barlowSemiCondensed(
                                    fontSize: 15.0,
                                    color: HSLColor.fromAHSL(1, 229, 0.25, 0.31)
                                        .toColor())),
                            TextSpan(
                                text: myPoints.toString(),
                                style: GoogleFonts.barlowSemiCondensed(
                                    fontSize: 40.0,
                                    color: HSLColor.fromAHSL(1, 229, 0.64, 0.46)
                                        .toColor())),
                          ])))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 30, left: 10, right: 10.0),
              child: hasChosen
                  ? Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                iPicked,
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "I picked",
                                  style: GoogleFonts.barlowSemiCondensed(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                comPicked,
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text("Computer Picked",
                                    style: GoogleFonts.barlowSemiCondensed(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.0,
                                    )),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Text(
                          message,
                          style: GoogleFonts.barlowSemiCondensed(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 60.0,
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 60.0, vertical: 10.0),
                            ),
                            onPressed: () {
                              setState(() {
                                hasChosen = false;
                              });
                            },
                            child: Text(
                              "Playing Again",
                              style: GoogleFonts.barlowSemiCondensed(
                                color: HSLColor.fromAHSL(1, 239, 0.49, 0.15)
                                    .toColor(),
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                              ),
                            )),
                      ],
                    )
                  : Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                userChoise = "rock";
                                userClicking();
                              },
                              child: BigCircle(
                                  Image.asset("images/rockk.png"),
                                  HSLColor.fromAHSL(1, 230, 0.89, 0.62)
                                      .toColor(),
                                  HSLColor.fromAHSL(1, 230, 0.49, 0.65)
                                      .toColor(),
                                  HSLColor.fromAHSL(1, 239, 0.64, 0.49)
                                      .toColor()),
                            ),
                            InkWell(
                              onTap: () {
                                userChoise = "paper";
                                userClicking();
                              },
                              child: BigCircle(
                                  Image.asset("images/paperr.png"),
                                  HSLColor.fromAHSL(1, 39, 0.89, 0.49)
                                      .toColor(),
                                  HSLColor.fromAHSL(1, 40, 0.84, 0.53)
                                      .toColor(),
                                  HSLColor.fromAHSL(1, 39, 0.64, 0.46)
                                      .toColor()),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        InkWell(
                          onTap: () {
                            userChoise = "scisor";
                            userClicking();
                          },
                          child: BigCircle(
                              Image.asset("images/scisorr.png"),
                              HSLColor.fromAHSL(1, 349, 0.71, 0.52).toColor(),
                              HSLColor.fromAHSL(1, 349, 0.70, 0.56).toColor(),
                              HSLColor.fromAHSL(1, 349, 0.64, 0.46).toColor()),
                        )
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }

  userClicking() {
    comChoises();
    whowon(userChoise, comChoise);
    setState(() {
      myPoints;
      hasChosen;
    });
  }

  void comChoises() {
    Random random = Random();
    int randomNumber = random.nextInt(3);
    comChoise = _choise[randomNumber];
  }

  whowon(userC, comC) {
    var rpsChoises = {
      "rock": {"scisor": 1, "rock": 0.5, "Paper": 0},
      "paper": {"paper": 0.5, "rock": 1, "scisor": 0},
      "scisor": {"scisor": 0.5, "paper": 1, "rock": 0},
    };
    var myscore = rpsChoises[userC]?[comC];
    upDateScore(myscore);
    picked();
    hasChosen = true;
  }

  upDateScore(myscore) {
    if (myscore == 0) {
      return {message = "You Lost", myPoints += 0.0};
    } else if (myscore == 0.5) {
      return {message = "You Tied", myPoints += 0.5};
    } else {
      return {message = "You Won", myPoints += 1};
    }
  }

  picked() {
    if (userChoise == "rock") {
      iPicked = BigCircle(
          Image.asset("images/rockk.png"),
          HSLColor.fromAHSL(1, 230, 0.89, 0.62).toColor(),
          HSLColor.fromAHSL(1, 230, 0.49, 0.65).toColor(),
          HSLColor.fromAHSL(1, 239, 0.64, 0.49).toColor());
    } else if (userChoise == "paper") {
      iPicked = BigCircle(
          Image.asset("images/paperr.png"),
          HSLColor.fromAHSL(1, 39, 0.89, 0.49).toColor(),
          HSLColor.fromAHSL(1, 40, 0.84, 0.53).toColor(),
          HSLColor.fromAHSL(1, 39, 0.64, 0.46).toColor());
    } else {
      iPicked = BigCircle(
          Image.asset("images/scisorr.png"),
          HSLColor.fromAHSL(1, 349, 0.71, 0.52).toColor(),
          HSLColor.fromAHSL(1, 349, 0.70, 0.56).toColor(),
          HSLColor.fromAHSL(1, 349, 0.64, 0.46).toColor());
    }

    // computer choises
    if (comChoise == "rock") {
      comPicked = BigCircle(
          Image.asset("images/rockk.png"),
          HSLColor.fromAHSL(1, 230, 0.89, 0.62).toColor(),
          HSLColor.fromAHSL(1, 230, 0.49, 0.65).toColor(),
          HSLColor.fromAHSL(1, 239, 0.64, 0.49).toColor());
    } else if (comChoise == "paper") {
      comPicked = BigCircle(
          Image.asset("images/paperr.png"),
          HSLColor.fromAHSL(1, 39, 0.89, 0.49).toColor(),
          HSLColor.fromAHSL(1, 40, 0.84, 0.53).toColor(),
          HSLColor.fromAHSL(1, 39, 0.64, 0.46).toColor());
    } else {
      comPicked = BigCircle(
          Image.asset("images/scisorr.png"),
          HSLColor.fromAHSL(1, 349, 0.71, 0.52).toColor(),
          HSLColor.fromAHSL(1, 349, 0.70, 0.56).toColor(),
          HSLColor.fromAHSL(1, 349, 0.64, 0.46).toColor());
    }
  }
}

class BigCircle extends StatelessWidget {
  final Widget innerChild;
  final Color gradientColor1;
  final Color gradientColor2;
  final Color shadowColor;
  const BigCircle(this.innerChild, this.gradientColor1, this.gradientColor2,
      this.shadowColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          gradient: RadialGradient(colors: [gradientColor1, gradientColor2]),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: shadowColor, spreadRadius: 1, offset: Offset(1.0, 4))
          ],
          shape: BoxShape.circle),
      child: Container(
          padding: EdgeInsets.all(20.0),
          width: 80.0,
          height: 80.0,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 0.6,
                    blurRadius: 7.0,
                    offset: Offset(4, -6))
              ]),
          child: innerChild),
    );
  }
}
