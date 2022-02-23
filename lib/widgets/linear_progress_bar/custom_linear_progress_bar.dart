// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:kartal/kartal.dart';

class CustomLinearPercentIndicator extends StatelessWidget {
  final String day;
  final Color color;
  final double percent;

  const CustomLinearPercentIndicator(
      {Key? key, required this.day, required this.color, required this.percent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      leading: Text(
        day,
        style: context.textTheme.bodyText2!.copyWith(color: Colors.grey[400]),
      ),
      barRadius: const Radius.circular(15),
      backgroundColor: Colors.grey[200],
      lineHeight: 20,
      percent: percent,
      progressColor: color,
    );
  }
}
