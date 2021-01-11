import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.color, this.cardChild, this.cardAction});

  final Color color;
  final Widget cardChild;
  final Function cardAction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: cardAction,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
