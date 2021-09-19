import 'package:flutter/material.dart';

class Barrier extends StatelessWidget {
  final double height, weight;
  final Color poleColor;
  Barrier(this.height, this.weight, this.poleColor);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: weight,
        // color: poleColor,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: poleColor,
        ));
  }
}
