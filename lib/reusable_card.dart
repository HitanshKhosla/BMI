import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Widget? cardchild;
  final Color colour;
  final VoidCallback? onpress;
  ReusableCard({required this.colour, this.cardchild, this.onpress}) {}
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: cardchild,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
