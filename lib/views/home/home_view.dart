import '../../core/base/base_state.dart';
import '../../core/components/column/column.dart';
import '../../core/components/row/row.dart';
import 'home_view_model.dart';
import '../../widgets/card/daily_stats_card.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:kartal/kartal.dart';
import '../../model/card_model.dart';
import '../../model/users_model.dart';
import '../../widgets/linear_progress_bar/custom_linear_progress_bar.dart';

part 'home_string_values.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget with BaseState {
  final _HomeStringValues values = _HomeStringValues();
  final HomeViewModel model = HomeViewModel();

  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Expanded(
                flex: 4,
                child: buildBodySection(context),
              ),
              Expanded(flex: 2, child: buildBottomContainer(context))
            ],
          )),
    );
  }

  MyRow buildBodySection(BuildContext context) {
    return MyRow(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 1, child: buildWalletTextandAvatar(context)),
          Expanded(flex: 4, child: buidLinearProgresesSection())
        ],
      ),
    );
  }

  Container buildBottomContainer(BuildContext context) {
    return Container(
      width: context.dynamicWidth(1),
      decoration: ShapeDecoration(
        shape: borderConstants.radiusOnlyTop,
        color: colorConstants.governorBay,
      ),
      child: MyColumn(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2, child: MyRow(child: buildDailyStatsText(context))),
            Expanded(
              flex: 3,
              child: buildListViewBuilderSection(),
            ),
            const Spacer(flex: 1)
          ],
        ),
      ),
    );
  }

  ListView buildListViewBuilderSection() {
    return ListView.builder(
        itemCount: cards.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return DailyStatsCard(
              icon: cards[index].icon,
              color: cards[index].color,
              text: cards[index].name,
              value: users[index].dailyActiviy.toString(),
              func: () => model.goDetail(context, index));
        });
  }

  Row buildWalletTextandAvatar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [buildTitleSection(context), buildUserAvatar()],
    );
  }

  CircleAvatar buildUserAvatar() {
    return CircleAvatar(
      child: Image.asset(users[1].image),
    );
  }

  Row buildDailyStatsText(BuildContext context) {
    return Row(
      children: [
        Text(
          values.daily,
          textScaleFactor: 1.7,
          style: context.textTheme.bodyText2!.copyWith(color: Colors.white),
        ),
        context.emptySizedWidthBoxLow,
        Text(
          values.stats,
          textScaleFactor: 1.7,
          style: context.textTheme.bodyText1!.copyWith(color: Colors.white),
        ),
      ],
    );
  }

  MyColumn buidLinearProgresesSection() {
    return MyColumn(
      child: RotatedBox(
        quarterTurns: -1,
        child: Column(
          children: [
            Expanded(
              child: CustomLinearPercentIndicator(
                  day: "S", color: colorConstants.governorBay, percent: 0.34),
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
                  day: "W", color: colorConstants.governorBay, percent: 0.4),
            ),
            Expanded(
              child: CustomLinearPercentIndicator(
                  day: "T", color: colorConstants.governorBay, percent: 0.85),
            ),
            Expanded(
              child: CustomLinearPercentIndicator(
                  day: "F",
                  color: colorConstants.wildWatermelon,
                  percent: 0.80),
            ),
            Expanded(
              child: CustomLinearPercentIndicator(
                  day: "S", color: colorConstants.governorBay, percent: 0.31),
            ),
          ],
        ),
      ),
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
