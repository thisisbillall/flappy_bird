import 'package:flutter/material.dart';

class Bird extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/bird.png',
      height: 80,
      width: 80,
    );
  }
}
