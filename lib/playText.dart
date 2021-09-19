import 'package:flutter/material.dart';

class Play extends StatelessWidget {
  final String text;
  @override
  Play(this.text);
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.indigo.shade800,
        ),
      ),
    );
  }
}
