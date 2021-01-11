import 'package:flutter/material.dart';
import 'constants.dart';

class CardInfo extends StatelessWidget {
  CardInfo(this._icon, this._text);

  final IconData _icon;
  final String _text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          _icon,
          size: kiconSize,
        ),
        SizedBox(
          height: ksizedBoxHeight,
        ),
        Text(
          _text,
          style: klabelTextStyle,
        )
      ],
    );
  }
}
