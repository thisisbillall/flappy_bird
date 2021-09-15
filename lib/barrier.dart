import 'package:flutter/material.dart';

class Barrier extends StatelessWidget {
  final double height, weight;
  Barrier(this.height, this.weight);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: weight,
      color: Colors.green.shade900,
    );
  }
}
