import 'package:dio/dio.dart';
import 'package:factories_equipments/repositories/user_account/user_account_repo.dart';
import 'package:factories_equipments/utils/routing/route_names.dart';
import 'package:flutter/material.dart';

class UserAccountViewModelProvider with ChangeNotifier {
  String userLogo = 'assets/images/avatar.png';
  String createUserAccount = 'انشاء حساب مستخدم';
  String phoneNumberHint = 'رقم الموبايل';
  String phoneNumberLengthError = 'رقم الموبايل يجب ان يكون 11 رقم';
  String agreeToTermsAndConditions = 'موافق علي الشروط والأحكام';
  String nextButton = 'التالي';
  late Dio dio;
  UserAccountRepository userAccountRepository;
  final phoneNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool agreeToTermsAndConditionsChecked = false;

  UserAccountViewModelProvider({required this.userAccountRepository});

  void changeAgreeToTermsAndConditionsState() {
    agreeToTermsAndConditionsChecked = !agreeToTermsAndConditionsChecked;
    notifyListeners();
  }

  void backToLoginScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  void goToAccountVerificationWaitingScreen(BuildContext context) {
    if (formKey.currentState!.validate() && agreeToTermsAndConditionsChecked) {
      phoneNumberController.clear();
      Navigator.pushNamed(context, accountVerificationWaitingRoute);
      agreeToTermsAndConditionsChecked = false;
      notifyListeners();
    }
  }

  void registerUserAccount() {
    userAccountRepository.registerUserAccount().then((value) {
      notifyListeners();
    }).catchError((error) {
      debugPrint('registerUserAccountError: $error');
      notifyListeners();
    });
  }


}
