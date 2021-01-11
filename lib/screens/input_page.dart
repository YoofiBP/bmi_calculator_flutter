import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/utils/calculator_brain.dart';
import 'package:flutter/material.dart';
import '../utils/card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/card_info.dart';
import '../utils/constants.dart';
import '../utils/bottom_button.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  enumGender selectedGender;

  void updateSelectedGender(enumGender gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  int height = 120;
  int weight = 50;
  int age = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: selectedGender == enumGender.male
                        ? kactiveCardColor
                        : kinactiveCardColor,
                    cardChild: CardInfo(FontAwesomeIcons.mars, kmaleGenderText),
                    cardAction: () {
                      updateSelectedGender(enumGender.male);
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: selectedGender == enumGender.female
                        ? kactiveCardColor
                        : kinactiveCardColor,
                    cardChild:
                        CardInfo(FontAwesomeIcons.venus, kfemaleGenderText),
                    cardAction: () {
                      updateSelectedGender(enumGender.female);
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: klabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              height.toString(),
                              style: kNumberLabelTextStyle,
                            ),
                            Text(
                              'cm',
                              style: klabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.white,
                              thumbColor: Color(0xFFEB1555),
                              overlayColor: Color(0x29EB1555),
                              thumbShape:
                                  RoundSliderThumbShape(enabledThumbRadius: 15),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30)),
                          child: Slider(
                              min: kminimumHeight,
                              max: kmaximumHeight,
                              value: height.toDouble(),
                              inactiveColor: Color(0xFF8D8E98),
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.toInt();
                                });
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          kweightLabel,
                          style: klabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              buttonAction: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              buttonAction: () {
                                setState(() {
                                  weight++;
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
                    color: kactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          kageLabel,
                          style: klabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              buttonAction: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              buttonAction: () {
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          BottomButton(
              buttonText: "CALCULATE",
              onTap: () {
                CalculatorBrain calculator =
                    CalculatorBrain(height: height, weight: weight);
                String bmiResult = calculator.calculateBMI();
                String resultText = calculator.getResult()['output']['result'];
                String bmiIntepretation =
                    calculator.getResult()['output']['intepretation'];
                Navigator.pushNamed(context, '/results',
                    arguments: ResultsPageArguments(
                        bmiResult, resultText, bmiIntepretation));
              }),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.buttonAction});

  final IconData icon;
  final Function buttonAction;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: buttonAction,
      elevation: 6,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
