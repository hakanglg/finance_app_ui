import '../home/home_view.dart';
import 'package:flutter/material.dart';

class OnboardingViewModel {
  void goHome(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeView(),
        ));
  }
}
