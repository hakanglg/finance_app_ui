import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../core/constants/color_constants.dart';
import '../../model/users_model.dart';

class CustomCircularIndicator extends StatelessWidget {
  const CustomCircularIndicator({
    Key? key,
    required this.user,
    required this.colorConstants,
    required this.cash,
    this.icon = Icons.star_rounded,
    this.color = Colors.white,
    required this.percent,
  }) : super(key: key);

  final User user;
  final ColorConstants colorConstants;
  final int cash;
  final IconData icon;
  final Color color;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      circularStrokeCap: CircularStrokeCap.round,
      radius: 85.0,
      lineWidth: 15.0,
      percent: percent,
      center: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildIcon(),
          context.emptySizedHeightBoxLow,
          buildText(context),
        ],
      ),
      backgroundColor: colorConstants.transparentBlue,
      progressColor: Colors.white,
    );
  }

  Icon buildIcon() {
    return Icon(
      icon,
      color: color,
    );
  }

  Text buildText(BuildContext context) {
    return Text(
      "\$ ${cash.toString()}",
      textScaleFactor: 1.7,
      style: context.textTheme.bodyText2!.copyWith(color: Colors.white),
    );
  }
}
