import 'package:factories_equipments/view_models/account_verification_waiting_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AccountVerificationWaitingScreen extends StatelessWidget {

  AccountVerificationWaitingScreen({Key? key}) : super(key: key);
  final accountVerificationWaitingViewModel =
      AccountVerificationWaitingViewModel();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.amber,
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 250,
              decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
              child: ListTile(
                leading: IconButton(
                  iconSize: 50.0,
                  color: Colors.black,
                  icon: const Icon(Icons.keyboard_arrow_left_outlined),
                  onPressed: () {
                    accountVerificationWaitingViewModel
                        .backToUserOrShopAccountScreen(context);
                  },
                ),
                title: SizedBox(
                  width: 60,
                  height: 60,
                  child: Image(
                    image: AssetImage(
                        accountVerificationWaitingViewModel.shopLogo),
                  ),
                ),
                trailing: IconButton(
                  iconSize: 50.0,
                  color: Colors.black,
                  icon: const Icon(Icons.more_horiz_rounded),
                  onPressed: () {
                    //TODO: Later Isa
                  },
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(
                  top: 80.0, right: 30.0, left: 30.0, bottom: 30.0),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      accountVerificationWaitingViewModel
                          .registeredSuccessfully,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      accountVerificationWaitingViewModel
                          .accountVerificationWaiting,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    SizedBox(
                        width: 150,
                        height: 150,
                        child: Image(
                          image: AssetImage(
                            accountVerificationWaitingViewModel.surpriseImage,
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
