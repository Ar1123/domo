import 'package:flutter/material.dart';

Color get backGroundColor => Color.fromRGBO(93, 183, 217, 1);
Color get colorText => Color.fromRGBO(17, 48, 89, 1);

TextStyle textStyle({
  FontWeight fontWeight = FontWeight.bold,
  required Color color,
  required double size,
}) =>
    TextStyle(
      fontWeight: fontWeight,
      fontSize: size,
      color: color,
    );
