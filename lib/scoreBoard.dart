import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  final score;
  final life;

  Score(this.score, this.life);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.attach_money,
                color: Colors.amberAccent.shade700,
                size: 50,
              ),
              SizedBox(height: 10),
              Text(
                score.toString(),
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite,
                color: Colors.red,
                size: 50,
              ),
              SizedBox(height: 10),
              Text(
                life.toString(),
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
