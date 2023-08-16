import 'package:flutter/material.dart';
class Icongenerator extends StatelessWidget {
  final IconData? icon;
  final String ?label;
  Icongenerator(this.icon,this.label){}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon,size: 60),
        SizedBox(height: 20.0),
        Text(label?? '',style: TextStyle(fontSize: 20.0),)
      ],
    );
  }
}

