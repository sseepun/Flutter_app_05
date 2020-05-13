import 'package:flutter/material.dart';

final titleStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'CM Sans Serif',
  fontSize: 26.0,
  height: 1.5,
);
final subtitleStyle = TextStyle(
  color: Colors.white,
  fontSize: 18.0,
  height: 1.2,
);

final inputLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w500,
  fontSize: 18.0,
  height: 1.2,
);
final inputHintStyle = TextStyle(
  color: Colors.white60,
  fontSize: 18.0,
  height: 1.2,
  letterSpacing: 0.5,
);
final inputTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 18.0,
  height: 1.2,
  letterSpacing: 0.5,
);
final inputErrorStyle = TextStyle(
  color: Colors.red,
  fontSize: 16.0,
  height: 1.2,
  letterSpacing: 0.35,
  fontWeight: FontWeight.w500,
);

final inputBorderStyle = OutlineInputBorder(
  borderRadius: BorderRadius.circular(5),
  borderSide: BorderSide(
    width: 1,
    style: BorderStyle.solid,
    color: Colors.white54,
  ),
);
final inputEnabledBorderStyle = OutlineInputBorder(
  borderRadius: BorderRadius.circular(5),
  borderSide: BorderSide(
    width: 1,
    style: BorderStyle.solid,
    color: Colors.white54,
  ),
);
final inputFocusedBorderStyle = OutlineInputBorder(
  borderRadius: BorderRadius.circular(5),
  borderSide: BorderSide(
    width: 1,
    style: BorderStyle.solid,
    color: Colors.white,
  ),
);
final inputErrorBorderStyle = OutlineInputBorder(
  borderRadius: BorderRadius.circular(5),
  borderSide: BorderSide(
    width: 1,
    style: BorderStyle.solid,
    color: Colors.red,
  ),
);
