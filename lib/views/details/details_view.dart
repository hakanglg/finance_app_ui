import '../../core/components/column/column.dart';
import '../../core/components/row/row.dart';
import '../../core/constants/color_constants.dart';
import '../../widgets/circular_progress_indicator/circular_percent_indicator.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../core/base/base_state.dart';
import '../../model/users_model.dart';

part 'details_string_values.dart';

class DetailsView extends StatelessWidget with BaseState {
  final User user;
  final _DetailsStringValues values = _DetailsStringValues();
  DetailsView({Key? key, required this.user}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorConstants.governorBay,
      appBar: buildCustomAppBar(context),
      body: Column(
        children: [
          Expanded(flex: 3, child: buildChartsSection(context)),
          Expanded(flex: 2, child: buildPaymentSection(context)),
        ],
      ),
    );
  }

  AppBar buildCustomAppBar(BuildContext context) {
    return AppBar(
      leading: buildAppBarLeadingIconButton(context),
      centerTitle: true,
      title: buildAppBarTitleText(context),
    );
  }

  IconButton buildAppBarLeadingIconButton(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          context.pop();
        });
  }

  Text buildAppBarTitleText(BuildContext context) {
    return Text(
      values.title,
      style: context.textTheme.bodyText2!.copyWith(color: Colors.white),
      textScaleFactor: 1.5,
    );
  }

  Column buildChartsSection(BuildContext context) {
    return Column(
      children: [
        context.emptySizedHeightBoxNormal,
        buildCustomIndicatorSection(),
        context.emptySizedHeightBoxNormal,
        buildIncomeExpenseSection(context)
      ],
    );
  }

  Container buildPaymentSection(BuildContext context) {
    return Container(
        decoration: ShapeDecoration(
            color: Colors.white, shape: borderConstants.radiusOnlyTop),
        child: Column(
          children: [
            Expanded(flex: 1, child: buildPaymentTitleSection(context)),
            Expanded(
              flex: 3,
              child: buildPaymentListViewBuilder(),
            ),
          ],
        ));
  }

  MyRow buildPaymentTitleSection(BuildContext context) {
    return MyRow(
      child: Row(
        children: [
          Text(
            values.last,
            style: context.textTheme.bodyText2,
            textScaleFactor: 1.8,
          ),
          context.emptySizedWidthBoxLow,
          Text(
            values.transactions,
            style: context.textTheme.bodyText1,
            textScaleFactor: 1.8,
          )
        ],
      ),
    );
  }

  ListView buildPaymentListViewBuilder() {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) => buildListTile(context, index),
    );
  }

  Padding buildListTile(BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.lowValue),
      child: ListTile(
        leading: buildLeadingAvatarSection(index),
        title: buildTitleSection(index, context),
        trailing: buildTrailingTextSection(index, context),
      ),
    );
  }

  CircleAvatar buildLeadingAvatarSection(int index) =>
      CircleAvatar(child: Image.asset(users[index].image));

  Column buildTitleSection(int index, BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          users[index].name,
          style: context.textTheme.bodyText2,
          textScaleFactor: 1.2,
        ),
        Text(
          values.payment,
          style: context.textTheme.bodyText1!
              .copyWith(fontWeight: FontWeight.w400, color: Colors.grey),
          textScaleFactor: 1,
        ),
      ],
    );
  }

  Text buildTrailingTextSection(int index, BuildContext context) => Text(
        "\$${users[index].income.toString()}",
        style:
            context.textTheme.bodyText2!.copyWith(fontWeight: FontWeight.w900),
      );

  Padding buildIncomeExpenseSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.mediumValue),
      child: Container(
        height: context.dynamicHeight(.15),
        decoration: ShapeDecoration(
          shape: borderConstants.radiusCircul,
          color: colorConstants.transparentBlue,
        ),
        child: Row(
          children: [
            Expanded(child: buildIncomeSection(context)),
            Expanded(child: buildExpenseSection(context))
          ],
        ),
      ),
    );
  }

  Center buildIncomeSection(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [buildIncomeText(context), buildIncomeValueText(context)],
      ),
    );
  }

  Text buildIncomeText(BuildContext context) {
    return Text(
      values.income,
      textScaleFactor: 1,
      style: context.textTheme.bodyText1!.copyWith(color: Colors.grey[300]),
    );
  }

  Text buildIncomeValueText(BuildContext context) {
    return Text(
      "\$ ${user.income.toString()}",
      textScaleFactor: 2,
      style: context.textTheme.bodyText2!.copyWith(color: Colors.white),
    );
  }

  Center buildExpenseSection(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [buildExpenseText(context), buildExpenseValueText(context)],
      ),
    );
  }

  Text buildExpenseText(BuildContext context) {
    return Text(
      values.expense,
      textScaleFactor: 1,
      style: context.textTheme.bodyText1!.copyWith(color: Colors.grey[300]),
    );
  }

  Text buildExpenseValueText(BuildContext context) {
    return Text(
      "\$ ${user.expense.toString()}",
      textScaleFactor: 2,
      style: context.textTheme.bodyText2!.copyWith(color: Colors.white),
    );
  }

  CustomCircularIndicator buildCustomIndicatorSection() {
    return CustomCircularIndicator(
      user: user,
      colorConstants: colorConstants,
      cash: user.dailyActiviy,
      percent: user.percent,
    );
  }
}
