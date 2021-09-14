import 'package:flappy_bird/bird.dart';
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
  double birdYasix = -1;
  bool isStarted = false;
  void jump() {
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        birdYasix += 0.2;
      });
    });
    isStarted = true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: jump,
      child: Column(
        children: [
          Expanded(
              flex: 3,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 0),
                alignment: Alignment(-1, birdYasix),
                color: Colors.blue,
                child: Bird(),
              )),
          Expanded(
              child: Container(
            color: Colors.green,
          ))
        ],
      ),
    );
  }
}
