import 'package:dio/dio.dart';
import 'package:factories_equipments/repositories/shop_account/shop_account_repo.dart';
import 'package:factories_equipments/utils/routing/route_names.dart';
import 'package:flutter/material.dart';

class ShopAccountViewModelProvider with ChangeNotifier {
  String shopLogo = 'assets/images/store.png';
  String createShopAccount = 'انشاء حساب محل';
  String firstNameHint = 'الاسم الاول';
  String phoneHint = 'الموبايل';
  String userNameHint = 'اسم المستخدم';
  String passwordHint = 'كلمة المرور';
  String emailHint = 'الايميل';
  String companyNameInCommercialRegistryHint = 'اسم الشركة ف السجل التجاري';
  String commercialRegistryNumberHint = 'رقم السجل التجاري';
  String countryHint = 'الدولة';
  String governorateHint = 'المحافظة';
  String regionHint = 'المنطقة';
  String chooseProductsCategoryHint = 'اختر فئات المنتجات';
  String agreeToTermsAndConditions = 'موافق علي الشروط والأحكام';
  String createNewAccountButton = 'أنشاء حساب جديد';
  late Dio dio;
  ShopAccountRepository shopAccountRepository;
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final phoneController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final companyNameInCommercialRegistryController = TextEditingController();
  final commercialRegistryNumberController = TextEditingController();
  final countryController = TextEditingController();
  final governorateController = TextEditingController();
  final regionController = TextEditingController();
  final productsCategoryController = TextEditingController();

  String firstNameError = 'يجب ادخال الاسم';
  String phoneError = 'رقم الموبايل يجب ان يكون 11 رقم';
  String userNameError = 'يجب ادخال اسم المستخدم';
  String passwordError = 'كلمة المرور يجب الا تقل عن 6 ارقام';
  String emailError = 'يجب ادخال البريد الالكتروني';
  String companyNameInCommercialRegistryError =
      'يجب ادخال اسم الشركة ف السجل التجاري';
  String commercialRegistryNumberError = 'يجب ادخال رقم السجل التجاري';
  String countryError = 'يجب ادخال الدولة';
  String governorateError = 'يجب ادخال المحافظة';
  String regionError = 'يجب ادخال المنطقة';
  String chooseProductsCategoryError = 'يجب ادخال فئات المنتجات';
  bool agreeToTermsAndConditionsChecked = false;
  bool isPassword = false;
  IconData suffix=Icons.visibility_outlined;

  ShopAccountViewModelProvider({required this.shopAccountRepository});

  void backToLoginScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  void changeAgreeToTermsAndConditionsState() {
    agreeToTermsAndConditionsChecked = !agreeToTermsAndConditionsChecked;
    notifyListeners();
  }

  void showHidePassword() {
    isPassword = !isPassword;
    if(isPassword){
      suffix=Icons.visibility_outlined;
    }
    else{
      suffix=Icons.visibility_off_outlined;
    }
    notifyListeners();
  }

  void goToAccountVerificationWaitingScreen(BuildContext context) {
    if (formKey.currentState!.validate() && agreeToTermsAndConditionsChecked) {
      Navigator.pushNamed(context, accountVerificationWaitingRoute);
      firstNameController.clear();
      phoneController.clear();
      userNameController.clear();
      passwordController.clear();
      emailController.clear();
      companyNameInCommercialRegistryController.clear();
      commercialRegistryNumberController.clear();
      countryController.clear();
      governorateController.clear();
      regionController.clear();
      productsCategoryController.clear();
      agreeToTermsAndConditionsChecked = false;
      notifyListeners();
    }
  }

  void registerShopAccount() {
    shopAccountRepository.registerShopAccount().then((value) {
      notifyListeners();
    }).catchError((error) {
      debugPrint('registerShopAccountError: $error');
      notifyListeners();
    });
  }
}
