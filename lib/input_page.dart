import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusableCard.dart';
import 'iconContent.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';

enum Gender {
  Male,
  Female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.Male;
                    });
                  },
                  colour: selectedGender == Gender.Male
                      ? activeCardColor
                      : inactiveCardColor,
                  cardChild: IconContent(
                    lable: 'MALE',
                    icon: FontAwesomeIcons.male,
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.Female;
                    });
                  },
                  colour: selectedGender == Gender.Female
                      ? activeCardColor
                      : inactiveCardColor,
                  cardChild: IconContent(
                    lable: 'FEMALE',
                    icon: FontAwesomeIcons.female,
                  ),
                ))
              ],
            )),
            Expanded(
              child: ReusableCard(
                colour: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT', style: klableTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: klableTextStyle),
                        Text(
                          'cm',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w100,
                          ),
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          inactiveTickMarkColor: Color(0xFF8D8E98),
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555)),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT', style: klableTextStyle),
                        Text(
                          weight.toString(),
                          style: TextStyle(fontSize: 30.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onpress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onpress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                  colour: activeCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('AGE', style: klableTextStyle),
                      Text(
                        age.toString(),
                        style: TextStyle(fontSize: 30.0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onpress: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onpress: () {
                              setState(() {
                                age--;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ))
              ],
            )),
            BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(weight: weight, height: height);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                              bmiResult: calc.calculateBMI(),
                          interpretation: calc.getInterpretation(),
                          resultText: calc.getResult(),
                            )));
              },
            )
          ],
        ));
  }
}
