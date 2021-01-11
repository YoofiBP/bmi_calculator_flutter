import 'package:bmi_calculator/utils/bottom_button.dart';
import 'package:bmi_calculator/utils/card.dart';
import 'package:bmi_calculator/utils/constants.dart';
import 'package:flutter/material.dart';

class ResultsPageArguments {
  final String bmiResult;
  final String resultText;
  final String bmiIntepretation;

  ResultsPageArguments(this.bmiResult, this.resultText, this.bmiIntepretation);
}

class ResultsPage extends StatelessWidget {
  static const routeName = '/results';
  final String bmiResult;
  final String resultText;
  final String bmiIntepretation;

  ResultsPage({this.bmiResult, this.resultText, this.bmiIntepretation});
  @override
  Widget build(BuildContext context) {
    final ResultsPageArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("YOUR RESULT"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: ReusableCard(
            color: kactiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  args.resultText.toUpperCase(),
                  style: kresultTextStyle,
                ),
                Text(
                  args.bmiResult,
                  style: kbmiTextStyle,
                ),
                Text(
                  args.bmiIntepretation,
                  textAlign: TextAlign.center,
                  style: kbodyTextStyle,
                )
              ],
            ),
          )),
          BottomButton(
              buttonText: "RE-CALCULATE",
              onTap: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
