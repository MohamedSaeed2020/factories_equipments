import 'package:factories_equipments/repositories/shop_account/shop_account_api.dart';
import 'package:factories_equipments/repositories/user_account/user_account_api.dart';
import 'package:factories_equipments/utils/routing/route_names.dart';
import 'package:factories_equipments/view_models/shop_account_view_model.dart';
import 'package:factories_equipments/view_models/user_account_view_model.dart';
import 'package:factories_equipments/views/account_verification_waiting_screen.dart';
import 'package:factories_equipments/views/login_screen.dart';
import 'package:factories_equipments/views/shop_account_screen.dart';
import 'package:factories_equipments/views/user_account_screen.dart';
import 'package:factories_equipments/views/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppRouter {
  static Route<dynamic>? generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcomeRoute:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case userAccountRoute:
        return MaterialPageRoute(builder: (_) {
          return ChangeNotifierProvider<UserAccountViewModelProvider>(
            create: (BuildContext context) => UserAccountViewModelProvider(
                userAccountRepository: UserAccountAPI()),
            child: const UserAccountScreen(),
          );
        });
      case shopAccountRoute:
        return MaterialPageRoute(builder: (_) {
          return ChangeNotifierProvider<ShopAccountViewModelProvider>(
            create: (BuildContext context) => ShopAccountViewModelProvider(
                shopAccountRepository: ShopAccountAPI()),
            child: const ShopAccountScreen(),
          );
        });
      case accountVerificationWaitingRoute:
        return MaterialPageRoute(
            builder: (_) => AccountVerificationWaitingScreen());
    }
  }
}
