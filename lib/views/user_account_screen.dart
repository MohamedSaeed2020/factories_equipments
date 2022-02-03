import 'package:factories_equipments/repositories/user_account/user_account_api.dart';
import 'package:factories_equipments/utils/components/custom_button.dart';
import 'package:factories_equipments/utils/components/custom_text_form_field.dart';
import 'package:factories_equipments/view_models/user_account_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class UserAccountScreen extends StatefulWidget {
  const UserAccountScreen({Key? key}) : super(key: key);

  @override
  State<UserAccountScreen> createState() => _UserAccountScreenState();
}

class _UserAccountScreenState extends State<UserAccountScreen> {
  final userAccountViewModelProvider =
      UserAccountViewModelProvider(userAccountRepository: UserAccountAPI());


  @override
  void dispose() {
    super.dispose();
    userAccountViewModelProvider.phoneNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          iconSize: 50.0,
          color: Colors.black,
          icon: const Icon(Icons.keyboard_arrow_left_outlined),
          onPressed: () {
            //to hide keyboard to prevent overflow
            FocusScope.of(context).requestFocus(FocusNode());
            userAccountViewModelProvider.backToLoginScreen(context);
          },
        ),
        centerTitle: true,
        title: SizedBox(
          width: 50,
          height: 50,
          child: Image(
            image: AssetImage(userAccountViewModelProvider.userLogo),
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
              userAccountViewModelProvider.createUserAccount,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(
                top: 30.0, right: 30.0, left: 30.0, bottom: 30.0),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Consumer<UserAccountViewModelProvider>(
                  builder: (BuildContext context, provider, Widget? child) {
                    return Form(
                      key: provider.formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextFormField(
                            controller: provider.phoneNumberController,
                            type: TextInputType.phone,
                            validate: (String? value) {
                              if (value!.isEmpty || value.length < 11) {
                                return provider.phoneNumberLengthError;
                              }
                            },
                            hint: provider.phoneNumberHint,
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
                                provider.goToAccountVerificationWaitingScreen(
                                  context,
                                );
                              },
                              text: provider.nextButton,
                              radius: 30.0,
                              background: Colors.amber,
                              textColor: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}