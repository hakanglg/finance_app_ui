import 'package:finance_app_ui/views/onboard/onboard_view.dart';
import 'core/theme/light_theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  final String title = "Finance App";

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      title: '',
      home: OnboardingView(),
    );
  }
}
