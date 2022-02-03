import 'package:factories_equipments/utils/components/custom_button.dart';
import 'package:factories_equipments/view_models/welcome_view_model.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40.0,
                ),
                const SizedBox(
                    width: 150,
                    height: 150,
                    child: Image(
                      image: AssetImage(WelcomeViewModel.welcomeLogo),
                    )),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  WelcomeViewModel.appDescriptionOne,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Text(
                  WelcomeViewModel.appDescriptionTwo,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 60.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomMaterialButton(
                    pressed: () {
                      //Go to login screen
                      WelcomeViewModel.goToLoginScreen(context);
                    },
                    text: WelcomeViewModel.startShoppingButton,
                    isUpperCase: false,
                    radius: 30.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
