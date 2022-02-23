import 'model/users_model.dart';

import 'core/theme/light_theme.dart';
import 'views/details/details_view.dart';
import 'views/home/home_view.dart';
import 'views/onboard/onboard_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        title: 'Finance App',
        home: HomeView(),);
  }
}
