import 'dart:math';
import 'package:bmi_calculator/utils/constants.dart';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});
  final int height;
  final int weight;
  //final enumGender gender;

  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(2);
  }

  Map<String, Map<String, String>> getResult() {
    if (_bmi >= 25) {
      return {
        'output': {
          'result': 'Overweight',
          'intepretation':
              'You have a higher than normal body weight. Try to exercise more.'
        }
      };
    } else if (_bmi > 18.5) {
      return {
        'output': {
          'result': 'Normal',
          'intepretation': 'You have a normal body weight. Good job!'
        }
      };
    } else {
      return {
        'output': {
          'result': 'Underweight',
          'intepretation':
              'You have a lower than normal body weight. You can eat a bit more.'
        }
      };
    }
  }
}
