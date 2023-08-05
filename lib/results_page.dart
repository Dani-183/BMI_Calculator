import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusableCard.dart';
import 'bottom_button.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.bmiResult,
      @required this.interpretation,
      @required this.resultText});
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI_CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsetsDirectional.all(20.0),
            child: Text(
              'FINAL RESULT',
              style: kTitleTextStyle,
            ),
          )),
          Expanded(
            flex: 6,
            child: ReusableCard(
              colour: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: kFinalResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kFinalResultStyle,
                  ),
                  Text(
                    interpretation,
                    style: kFinalResultTextStyle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Center(
                  child: BottomButton(
                buttonTitle: 'RE-CALCULATE',
                onTap: () {
                  Navigator.pop(context);
                },
              )),
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.only(bottom: 15.0),
              width: double.infinity,
              color: bottomCardColor,
              height: 20.0,
            ),
          )
        ],
      ),
    );
  }
}
