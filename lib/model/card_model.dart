import 'package:flutter/material.dart';

import '../core/constants/color_constants.dart';

class Card {
  final Color color;
  final IconData icon;
  final String name;

  Card({
    required this.color,
    required this.name,
    required this.icon,
  });
}

List<Card> cards = [
  Card(
      icon: Icons.local_activity,
      color: ColorConstants.instance.governorBay,
      name: "Activity"),
  Card(
      icon: Icons.savings,
      color: ColorConstants.instance.wildWatermelon,
      name: "Income"),
  Card(
      icon: Icons.swap_vert,
      color: ColorConstants.instance.governorBay,
      name: "Expense")
];
