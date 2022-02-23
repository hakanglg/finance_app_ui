import 'package:flutter/material.dart';

class BorderConstants {
  static BorderConstants instance = BorderConstants._init();
  BorderConstants._init();

  final radiusTopLeft = const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(topLeft: Radius.circular(15)),
  );

  final radiusCircular = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  );
  final radiusCircul = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(40),
  );

  final radiusOnlyTop = RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30), topRight: Radius.circular(30)));
}
