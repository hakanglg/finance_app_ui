import 'package:flutter/material.dart';

class HomeViewModel {
  void goDetail(BuildContext context) {
    Navigator.pushNamed(
      context,
      '/details',
    );
    print("object");
  }
}
