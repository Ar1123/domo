import 'package:domo/src/config/style/style.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget apbar({required String title, required Size size}) =>
    AppBar(
      backgroundColor: colorText,
      elevation: 2,
      title: Text(title),
      centerTitle: true,
      titleTextStyle: textStyle(
        color: whiteColor,
        size: size.height * .03,
        fontWeight: FontWeight.normal,
      ),
      leading: Icon(
        Icons.arrow_back_ios,
        color: whiteColor,
      ),
    );
