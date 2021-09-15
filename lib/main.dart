import 'package:flappy_bird/barrier.dart';
import 'package:flappy_bird/bird.dart';
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
  bool isStarted = false;
  double time = 0;
  double initialHeight = birdYasix;
  double height = 0;
  double barrierX = 1;
  double barrierY = 0;
  double barrHeight = 100;
  double barrWidth = 60;
  int score = 0;
  void startGame() {
    isStarted = true;
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      time += 0.04;
      height = -4.9 * time * time + 2.8 * time;
      setState(() {
        birdYasix = initialHeight - height;
        barrierX -= 0.05;
      });

      if (barrierX <= -1.5) {
        barrierX = 1;
        score++;
      }
      // if (birdYasix <= barrHeight &&
      //     birdYasix <= barrHeight &&
      //     birdYasix >= barrierX) {
      //   timer.cancel();
      // }
      if (birdYasix > 1) {
        timer.cancel();
        isStarted = false;
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (isStarted) {
                          jump();
                        } else {
                          startGame();
                        }
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 0),
                        alignment: Alignment(-1, birdYasix),
                        color: Colors.blue,
                        child: Bird(),
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 0),
                      alignment: Alignment(barrierX, barrierY),
                      child: Barrier(barrHeight, barrWidth),
                    )
                  ],
                )),
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.green,
                  child: Score(score),
                ))
          ],
        ),
      ),
    );
  }
}
