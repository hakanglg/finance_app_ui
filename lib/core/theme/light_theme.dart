import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

ThemeData lightTheme = ThemeData(
  // APPBAR

  appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
  // TEXT
  textTheme: TextTheme(
      bodyText1: TextStyle(
        fontWeight: FontWeight.w300,
        color: ColorConstants.instance.rhino,
      ),
      bodyText2: TextStyle(
        fontWeight: FontWeight.bold,
        color: ColorConstants.instance.rhino,
      )),
);
