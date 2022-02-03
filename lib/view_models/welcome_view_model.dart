import 'package:factories_equipments/utils/routing/route_names.dart';
import 'package:flutter/material.dart';

class WelcomeViewModel {
  static const String welcomeLogo = 'assets/images/repair.png';
  static const String appDescriptionOne =
      'شارع الجمهورية\n لمعدات ومستلزمات المصانع';
  static String appDescriptionTwo =
      'اكبر تطبيق للمعدات ومستلزمات المصانع في الوطن العربي';
  static String startShoppingButton = 'ابدء التسوق';

  static void goToLoginScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, loginRoute);
  }
}
