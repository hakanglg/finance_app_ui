import 'package:flutter/material.dart';

class OnboardingViewModel {
  void goHome(BuildContext context) {
    Navigator.pushNamed(
      context,
      '/home',
    );
  }
}
