import 'package:flutter/material.dart';

class Play extends StatelessWidget {
  final String text;
  @override
  Play(this.text);
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // color: Colors.lightBlue.shade100,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.indigo.shade800, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.indigo.shade800,
          ),
        ),
      ),
    );
  }
}
