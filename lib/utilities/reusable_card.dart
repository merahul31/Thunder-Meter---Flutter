import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({this.cardChild});

  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: cardChild,
        // alignment: Alignment.center,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
