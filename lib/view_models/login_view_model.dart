import 'package:factories_equipments/utils/routing/route_names.dart';
import 'package:flutter/material.dart';

class LoginViewModel {
  static const String loginAppLogo = 'assets/images/repair.png';
  static const String loginUserImage = 'assets/images/avatar.png';
  static const String loginUserAccount = 'حساب مستخدم';
  static const String loginShopImage = 'assets/images/shop.png';
  static const String loginShopAccount = 'حساب محل';
  static const String loginButton = 'تسجيل الدخول';
  static const String forgetPasswordTextButton = 'نسيت كلمة المرور';

  static void goToUserAccountScreen(BuildContext context) {
    Navigator.pushNamed(context, userAccountRoute);
  }

  static void goToShopAccountScreen(BuildContext context) {
    Navigator.pushNamed(context, shopAccountRoute);
  }
}
