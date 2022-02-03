import 'package:factories_equipments/utils/components/custom_button.dart';
import 'package:factories_equipments/view_models/login_view_model.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              flex: 1,
              child: SizedBox(
                width: 150.0,
                height: 150.0,
                child: Image(
                  image: AssetImage(LoginViewModel.loginAppLogo),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          width: double.infinity,
                          height: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  color: Colors.amber,
                                  child: MaterialButton(
                                    onPressed: () {
                                      //Go to user account
                                      LoginViewModel.goToUserAccountScreen(
                                          context);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Column(
                                        children: const [
                                          SizedBox(
                                            width: 25,
                                            height: 25,
                                            child: Image(
                                              image: AssetImage(LoginViewModel
                                                  .loginUserImage),
                                            ),
                                          ),
                                          Text(
                                            LoginViewModel.loginUserAccount,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.red,
                                  child: MaterialButton(
                                    onPressed: () {
                                      //Go to shop account
                                      LoginViewModel.goToShopAccountScreen(
                                          context);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Column(
                                        children: const [
                                          SizedBox(
                                            width: 25,
                                            height: 25,
                                            child: Image(
                                              image: AssetImage(
                                                LoginViewModel.loginShopImage,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            LoginViewModel.loginShopAccount,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: CustomMaterialButton(
                          pressed: () {
                            //TODO: Go to login screen
                          },
                          text: LoginViewModel.loginButton,
                          isUpperCase: false,
                          radius: 30.0,
                          background: Colors.black,
                          textColor: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      TextButton(
                        onPressed: () {
                          //TODO: Go to forget password screen
                        },
                        child: Column(
                          children: [
                            const Text(
                              LoginViewModel.forgetPasswordTextButton,
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              width: 130,
                              height: 1,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}