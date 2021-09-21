import 'dart:math';

import 'package:flappy_bird/barrier.dart';
import 'package:flappy_bird/bird.dart';
import 'package:flappy_bird/playText.dart';
import 'package:flappy_bird/scoreBoard.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double birdYasix = -1;
  static double birdXasix = -1;

  bool isStarted = false;
  bool disableTap = false;
  double time = 0;
  double initialHeight = birdYasix;
  double height = 0;
  double barrierX = 1.5;
  double barrierY = 0;
  double barrHeight = 100;
  double barrWidth = 60;
  double birdHeight = 80;
  double birdWidth = 80;
  double birdTotal = 0;
  double barrTotal = 0;
  Color bacColor = Colors.blue.shade100;
  Color poleColor = Colors.green.shade900;

  int score = 0;
  int life = 3;
  String dispText = "PLAY";
  void startGame() {
    dispText = "PLAY";
    isStarted = true;
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      time += 0.04;
      height = -4.9 * time * time + 2.8 * time;
      setState(() {
        if (score > 25) {
          Random random = new Random();
          barrHeight = (200 + random.nextInt(300 - 200)) * random.nextDouble();
          barrWidth = (120 + random.nextInt(150 - 120)) * random.nextDouble();
        }

        birdYasix = initialHeight - height;
        barrierX -= 0.05;
      });

      if (barrierX <= -2) {
        barrierX = 1;
        Random random = new Random();
        barrHeight = (200 + random.nextInt(300 - 200)) * random.nextDouble();
        barrWidth = (100 + random.nextInt(150 - 100)) * random.nextDouble();
        score++;
      }
      //reset Game
      void resetGame() {
        time = 0;
        initialHeight = birdYasix;
        height = 0;
        birdYasix = -1;
        birdXasix = -1;
        barrierX = 1.5;
        barrierY = 0;
        barrHeight = 100;
        barrWidth = 60;
        birdHeight = 80;
        birdWidth = 80;
        birdTotal = 0;
        barrTotal = 0;
        bacColor = Colors.blue.shade100;
        poleColor = Colors.green.shade900;
        score = 0;
        life = 3;
        dispText = "NEW GAME?";
      }

      //Game over
      if ((birdYasix >= barrierY && birdYasix - barrierY < 0.3) &&
          barrierX - birdXasix < 0.2) {
        timer.cancel();
        // birdYasix = -1;
        isStarted = false;
        disableTap = true;
        if (life == 0) {
          resetGame();
        } else {
          birdYasix = -1;
          life--;
        }
      }
      if (birdYasix > 1 || birdYasix < -1.8) {
        timer.cancel();
        // birdYasix = -1;
        isStarted = false;
        disableTap = true;
        if (life == 0) {
          resetGame();
        } else {
          birdYasix = -1;
          life--;
        }
      }
    });
  }

  void jump() {
    setState(() {
      time = 0;
      initialHeight = birdYasix;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget SkyAnimation(Widget child) {
      switch (score) {
        case 5:
          bacColor = Colors.lightBlue.shade700;
          poleColor = Colors.white;

          break;
        case 8:
          bacColor = Colors.lightBlue.shade800;
          poleColor = Colors.lightBlueAccent.shade100;

          break;
        case 10:
          bacColor = Colors.lightBlue.shade900;
          poleColor = Colors.lightBlueAccent.shade100;
          break;
        case 15:
          bacColor = Colors.black87;
          poleColor = Colors.orangeAccent.shade700;
          break;
        case 20:
          bacColor = Colors.amber;
          poleColor = Colors.green.shade700;
          break;
        case 25:
          bacColor = Colors.amber.shade800;
          poleColor = Colors.greenAccent.shade700;
          break;
        default:
      }

      return GestureDetector(
        onTap: (!disableTap)
            ? () {
                if (isStarted) {
                  jump();
                } else {
                  startGame();
                }
              }
            : null,

        //animated

        child: AnimatedContainer(
          duration: Duration(milliseconds: 0),
          alignment: Alignment(birdXasix, birdYasix),
          color: bacColor,
          child: child,
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    SkyAnimation(Bird()),
                    if (!isStarted)
                      GestureDetector(
                        onTap: () {
                          disableTap = false;
                          startGame();
                          jump();
                        },
                        child: (dispText == "NEW GAME?")
                            ? Play("GAME OVER!")
                            : Play("PLAY"),
                      ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 0),
                      alignment: Alignment(barrierX, barrierY),
                      child: Barrier(barrHeight, barrWidth, poleColor),
                    ),
                  ],
                )),
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.green,
                  child: Score(score, life),
                ))
          ],
        ),
      ),
    );
  }
}
