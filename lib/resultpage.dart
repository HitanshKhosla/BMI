import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'inputpage.dart';
import 'end_button.dart';

class ResultPage extends StatelessWidget {
  final  String getstart;
  final String mid;
  final String end;
  ResultPage({required this.getstart,required this.mid,required this.end}){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Container(
                    child: Text(
                  'Your Result',
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                )),
              ),
            ),
            Expanded(
                flex: 5,
                child: ReusableCard(
                  colour: activecolour,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        getstart.toUpperCase(),
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.green.shade400,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        mid.toUpperCase(),
                        style: TextStyle(
                          fontSize: 80.0,
                        ),
                      ),
                      Text(end.toUpperCase(),style: TextStyle(
                        fontSize: 20.0,
                      ),textAlign: TextAlign.center,),
                    Endbutton(buttonText: 'RE-CALCULATE', press: (){
                      Navigator.pop(context);
                    }),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
