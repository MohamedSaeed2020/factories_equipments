import 'package:flutter/material.dart';

class AccountVerificationWaitingViewModel with ChangeNotifier {
  AccountVerificationWaitingViewModel();

  String shopLogo = 'assets/images/store_big.png';
  String registeredSuccessfully = 'تم التسجيل بنجاح';
  String accountVerificationWaiting =
      'بانتظار تفعيل الحساب من جانب \n ادارة تطبيق \n شارع الجمهورية';
  String surpriseImage = 'assets/images/openbox.png';

  void backToUserOrShopAccountScreen(BuildContext context) {
    Navigator.of(context).pop();
  }
}
