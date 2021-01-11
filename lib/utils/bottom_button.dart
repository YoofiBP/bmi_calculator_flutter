import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.buttonText, @required this.onTap});

  final String buttonText;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: kCalculateButtonStyle,
        ),
        color: kbottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kbottomContainerHeight,
      ),
    );
  }
}
