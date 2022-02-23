import '../../core/base/base_state.dart';
import '../home/home_view.dart';

import '../../core/components/column/column.dart';
import '../../core/components/row/row.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'onboard_view_model.dart';

part 'onboard_string_values.dart';

class OnboardingView extends StatelessWidget with BaseState {
  final _OnboardingStringValue values = _OnboardingStringValue();
  final OnboardingViewModel viewModel = OnboardingViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: buildTitlesSection(context),
          ),
          Expanded(flex: 6, child: buildImagaAndButtonSection(context))
        ],
      ),
    );
  }

  MyRow buildTitlesSection(BuildContext context) {
    return MyRow(
      child: MyColumn(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [buildTitleThinText(context), buildTitleBoldText(context)],
        ),
      ),
    );
  }

  Stack buildImagaAndButtonSection(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [buildImageSection(), buildButtonSection(context)],
    );
  }

  Text buildTitleThinText(BuildContext context) {
    return Text(
      values.title,
      textScaleFactor: 3,
      style: context.textTheme.bodyText1!.copyWith(),
    );
  }

  Text buildTitleBoldText(BuildContext context) {
    return Text(
      values.titleBold,
      textScaleFactor: 3,
      style: context.textTheme.bodyText2!.copyWith(),
    );
  }

  Image buildImageSection() => Image.asset("assets/images/avatar_1.png");

  Positioned buildButtonSection(BuildContext context) {
    return Positioned(
      // bottom: 0,
      // right: 0,
      height: context.dynamicHeight(0.1),
      width: context.dynamicWidth(0.3),
      child: buildCustomElevatedButton(() => viewModel.goHome(context)),
    );
  }

  ElevatedButton buildCustomElevatedButton(VoidCallback func) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: colorConstants.wildWatermelon,
            shape: borderConstants.radiusTopLeft),
        onPressed: func,
        child: Text(
          values.buttonText,
          textScaleFactor: 1.6,
        ));
  }
}
