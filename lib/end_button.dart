import 'package:flutter/material.dart';
import 'inputpage.dart';

class Endbutton extends StatelessWidget {
  final String buttonText;
  final VoidCallback press;
  Endbutton({required this.buttonText,required this.press}){}


  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: press,
      child: Container(
        width: double.infinity,
        color: Color(0xFFEB1555),
        height: boxheight,
        margin: EdgeInsets.only(top: 20.0),
        child: Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 3.0),
              child: Text(
                'CALCULATE',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            )),
      ),
    );
  }
}