import 'package:factories_equipments/repositories/shop_account/shop_account_api.dart';
import 'package:factories_equipments/utils/components/custom_button.dart';
import 'package:factories_equipments/utils/components/custom_text_form_field.dart';
import 'package:factories_equipments/view_models/shop_account_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ShopAccountScreen extends StatefulWidget {
  const ShopAccountScreen({Key? key}) : super(key: key);

  @override
  State<ShopAccountScreen> createState() => _ShopAccountScreenState();
}

class _ShopAccountScreenState extends State<ShopAccountScreen> {
  final shopAccountViewModelProvider =
      ShopAccountViewModelProvider(shopAccountRepository: ShopAccountAPI());

  @override
  void dispose() {
    super.dispose();
    shopAccountViewModelProvider.firstNameController.dispose();
    shopAccountViewModelProvider.phoneController.dispose();
    shopAccountViewModelProvider.userNameController.dispose();
    shopAccountViewModelProvider.passwordController.dispose();
    shopAccountViewModelProvider.emailController.dispose();
    shopAccountViewModelProvider.companyNameInCommercialRegistryController
        .dispose();
    shopAccountViewModelProvider.commercialRegistryNumberController.dispose();
    shopAccountViewModelProvider.countryController.dispose();
    shopAccountViewModelProvider.governorateController.dispose();
    shopAccountViewModelProvider.regionController.dispose();
    shopAccountViewModelProvider.productsCategoryController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.amber,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          iconSize: 50.0,
          color: Colors.black,
          icon: const Icon(Icons.keyboard_arrow_left_outlined),
          onPressed: () {
            //to hide keyboard to prevent overflow
            FocusScope.of(context).requestFocus(FocusNode());
            shopAccountViewModelProvider.backToLoginScreen(context);
          },
        ),
        centerTitle: true,
        title: SizedBox(
          width: 50,
          height: 50,
          child: Image(
            image: AssetImage(shopAccountViewModelProvider.shopLogo),
          ),
        ),
        actions: [
          IconButton(
            iconSize: 50.0,
            color: Colors.black,
            icon: const Icon(Icons.more_horiz_rounded),
            onPressed: () {
              //TODO: Later Isa
            },
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: double.infinity,
            height: 150,
            decoration: const BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
            ),
            child: Text(
              shopAccountViewModelProvider.createShopAccount,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(
                  top: 30.0, right: 30.0, left: 30.0, bottom: 30.0),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Consumer<ShopAccountViewModelProvider>(
                    builder: (BuildContext context, provider, Widget? child) {
                      return Form(
                        key: provider.formKey,
                        child: Column(
                          children: [
                            CustomTextFormField(
                              hint: provider.firstNameHint,
                              controller: provider.firstNameController,
                              type: TextInputType.name,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return provider.firstNameError;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            CustomTextFormField(
                              hint: provider.phoneHint,
                              controller: provider.phoneController,
                              type: TextInputType.phone,
                              validate: (String? value) {
                                if (value!.isEmpty || value.length < 11) {
                                  return provider.phoneError;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            CustomTextFormField(
                              hint: provider.userNameHint,
                              controller: provider.userNameController,
                              type: TextInputType.text,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return provider.userNameError;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            CustomTextFormField(
                              hint: provider.passwordHint,
                              controller: provider.passwordController,
                              suffix: provider.suffix,
                              isPassword: provider.isPassword,
                              suffixPressed: () {
                                provider.showHidePassword();
                              },
                              type: TextInputType.text,
                              validate: (String? value) {
                                if (value!.isEmpty || value.length < 6) {
                                  return provider.passwordError;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            CustomTextFormField(
                              hint: provider.emailHint,
                              controller: provider.emailController,
                              type: TextInputType.emailAddress,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return provider.emailError;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            CustomTextFormField(
                              hint:
                                  provider.companyNameInCommercialRegistryHint,
                              controller: provider
                                  .companyNameInCommercialRegistryController,
                              type: TextInputType.name,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return provider
                                      .companyNameInCommercialRegistryError;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            CustomTextFormField(
                              hint: provider.commercialRegistryNumberHint,
                              controller:
                                  provider.commercialRegistryNumberController,
                              type: TextInputType.number,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return provider.commercialRegistryNumberError;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            CustomTextFormField(
                              hint: provider.countryHint,
                              controller: provider.countryController,
                              type: TextInputType.name,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return provider.countryError;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            CustomTextFormField(
                              hint: provider.governorateHint,
                              controller: provider.governorateController,
                              type: TextInputType.name,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return provider.governorateError;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            CustomTextFormField(
                              hint: provider.regionHint,
                              controller: provider.regionController,
                              type: TextInputType.name,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return provider.regionError;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            CustomTextFormField(
                              hint: provider.chooseProductsCategoryHint,
                              controller: provider.productsCategoryController,
                              type: TextInputType.name,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return provider.chooseProductsCategoryError;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: (){
                                    provider.changeAgreeToTermsAndConditionsState();
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 30.0,
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5.0),
                                          border: Border.all(
                                              color: Colors.black,
                                              width: 3,
                                              style: BorderStyle.solid),
                                          shape: BoxShape.rectangle,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Visibility(
                                        visible: provider
                                            .agreeToTermsAndConditionsChecked
                                            ? true
                                            : false,
                                        child: Image.asset(
                                          'assets/images/check.png',
                                          width: 33,
                                          height: 33,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Text(
                                  provider.agreeToTermsAndConditions,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40.0),
                              child: CustomMaterialButton(
                                pressed: () {
                                  //Go to AccountVerificationWaitingScreen
                                  provider
                                      .goToAccountVerificationWaitingScreen(
                                          context);
                                },
                                text: provider.createNewAccountButton,
                                radius: 30.0,
                                background: Colors.red,
                                textColor: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
