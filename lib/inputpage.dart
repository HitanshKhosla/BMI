import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icongen.dart';
import 'end_button.dart';
import 'resultpage.dart';
import 'calculator.dart';

const boxheight = 60.0;
const activecolour = Color(0xFF1C1C2D);
const inactivecolour = Color(0xFF111328);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedgender;
  int height = 120;
  int weight = 50;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onpress: () {
                      setState(() {
                        selectedgender = Gender.male;
                      });
                    },
                    colour: selectedgender == Gender.male
                        ? inactivecolour
                        : activecolour,
                    cardchild: Icongenerator(FontAwesomeIcons.mars, 'MALE'),
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                  onpress: () {
                    setState(() {
                      selectedgender = Gender.female;
                    });
                  },
                  colour: selectedgender == Gender.female
                      ? inactivecolour
                      : activecolour,
                  cardchild: Icongenerator(FontAwesomeIcons.venus, 'FEMALE'),
                ))
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: activecolour,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Height', style: TextStyle(fontSize: 20.0)),
                  SizedBox(
                    width: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: TextStyle(
                            fontSize: 50.0, fontWeight: FontWeight.w900),
                      ),
                      Text('cm'),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D898),
                      thumbColor: Color(0xFFEB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayColor: Color(0x29EB1555),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 100.0,
                        max: 250.0,
                        onChanged: (double newvalue) {
                          setState(() {
                            height = newvalue.round();
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: activecolour,
                    cardchild: Column(
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        SizedBox(
                          height: 7.0,
                        ),
                        Text(weight.toString(),
                            style: TextStyle(
                                fontSize: 50.0, fontWeight: FontWeight.w900)),
                        SizedBox(
                          height: 7.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundButton(
                                icon: FontAwesomeIcons.minus,
                                onpress: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundButton(
                                icon: FontAwesomeIcons.plus,
                                onpress: () {
                                  setState(() {
                                    weight++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activecolour,
                    cardchild: Column(
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        SizedBox(height: 7.0),
                        Text(age.toString(),
                            style: TextStyle(
                                fontSize: 50.0, fontWeight: FontWeight.w900)),
                        SizedBox(
                          height: 7.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundButton(
                                icon: FontAwesomeIcons.minus,
                                onpress: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(
                              width: 10,
                            ),
                            RoundButton(
                                icon: FontAwesomeIcons.plus,
                                onpress: () {
                                  setState(() {
                                    age++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Endbutton(
            buttonText: 'CALCULATE',
            press: () {
              BmiCalculator calc =
                  BmiCalculator(weight: weight, height: height);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            getstart: calc.getBmi(),
                            mid: calc.getresult(),
                            end: calc.getInter(),
                          )));
            },
          )
        ],
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onpress;
  RoundButton({required this.icon, required this.onpress}) {}

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      elevation: 6.0,
      constraints: BoxConstraints(minHeight: 50.0, minWidth: 50.0),
      fillColor: Color(0xFF444355),
      child: Icon(icon),
      onPressed: onpress,
    );
  }
}
