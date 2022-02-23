import 'package:finance_app_ui/core/base/base_state.dart';
import 'package:finance_app_ui/core/components/column/column.dart';
import 'package:finance_app_ui/core/components/row/row.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../model/users_model.dart';
import '../../widgets/linear_progress_bar/custom_linear_progress_bar.dart';

part 'home_string_values.dart';

class HomeView extends StatelessWidget with BaseState {
  final _HomeStringValues values = _HomeStringValues();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Expanded(
                flex: 4,
                child: MyRow(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      context.emptySizedHeightBoxLow3x,
                      Expanded(flex: 1, child: buildTitleSection(context)),
                      Expanded(
                          flex: 3,
                          child: RotatedBox(
                            quarterTurns: -1,
                            child: Column(
                              children: [
                                Expanded(
                                  child: CustomLinearPercentIndicator(
                                      day: "S",
                                      color: colorConstants.governorBay,
                                      percent: 0.34),
                                ),
                                Expanded(
                                  child: CustomLinearPercentIndicator(
                                      day: "M",
                                      color: colorConstants.wildWatermelon,
                                      percent: 0.73),
                                ),
                                Expanded(
                                  child: CustomLinearPercentIndicator(
                                      day: "T",
                                      color: colorConstants.wildWatermelon,
                                      percent: 0.59),
                                ),
                                Expanded(
                                  child: CustomLinearPercentIndicator(
                                      day: "W",
                                      color: colorConstants.governorBay,
                                      percent: 0.4),
                                ),
                                Expanded(
                                  child: CustomLinearPercentIndicator(
                                      day: "T",
                                      color: colorConstants.governorBay,
                                      percent: 0.85),
                                ),
                                Expanded(
                                  child: CustomLinearPercentIndicator(
                                      day: "F",
                                      color: colorConstants.wildWatermelon,
                                      percent: 0.80),
                                ),
                                Expanded(
                                  child: CustomLinearPercentIndicator(
                                      day: "S",
                                      color: colorConstants.governorBay,
                                      percent: 0.31),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    color: colorConstants.governorBay,
                  ))
            ],
          )),
    );
  }

  Column buildTitleSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [buildTitleText(context), buildWalletText(context)],
    );
  }

  Text buildTitleText(BuildContext context) {
    return Text(values.title,
        textScaleFactor: 1.5,
        style:
            context.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w400));
  }

  Text buildWalletText(BuildContext context) {
    return Text(
      "\$ ${users[1].wallet.toString()}",
      textScaleFactor: 3,
      style: context.textTheme.bodyText2,
    );
  }
}
