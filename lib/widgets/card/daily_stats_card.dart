import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:kartal/kartal.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../core/base/base_state.dart';

// ignore: must_be_immutable
class DailyStatsCard extends StatelessWidget with BaseState {
  final IconData icon;
  final Color color;
  final String text;
  final String value;
  final VoidCallback func;

  DailyStatsCard(
      {Key? key,
      required this.icon,
      required this.color,
      required this.text,
      required this.value,
      required this.func})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: SizedBox(
        width: context.dynamicWidth(0.5),
        child: Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.04),
          child: Container(
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: borderConstants.radiusCircul,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: buildCirculerIndicatorSection(),
                  ),
                  Expanded(flex: 1, child: buildTitleAndValueSectio(context))
                ],
              )),
        ),
      ),
    );
  }

  CircularPercentIndicator buildCirculerIndicatorSection() {
    return CircularPercentIndicator(
      circularStrokeCap: CircularStrokeCap.round,
      radius: 30.0,
      lineWidth: 6.0,
      percent: .7,
      center: Icon(
        icon,
        size: 30.0,
        color: color,
      ),
      progressColor: color,
    );
  }

  Column buildTitleAndValueSectio(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [buildTitleText(context), buildValueText(context)],
    );
  }

  Text buildTitleText(BuildContext context) {
    return Text(
      text,
      textScaleFactor: 1.2,
      style: context.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w400),
    );
  }

  Text buildValueText(BuildContext context) {
    return Text(
      "\$ ${value.toString()}",
      textScaleFactor: 1.4,
      style: context.textTheme.bodyText2,
    );
  }
}
