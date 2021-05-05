import 'package:flutter/material.dart';

class MyNavigator {
  static void goToHome(BuildContext context) {
    Navigator.pushNamed(context, "/home");
  }

  static void goToSplash(BuildContext context) {
    Navigator.pushNamed(context, "/splash");
  }
}
