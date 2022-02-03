import 'package:factories_equipments/network/local/cache_helper.dart';
import 'package:factories_equipments/network/remote/dio_helper.dart';
import 'package:factories_equipments/utils/routing/app_router.dart';
import 'package:factories_equipments/utils/routing/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack,overlays: [SystemUiOverlay.top,SystemUiOverlay.bottom]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  //init dio and cache helper
  DioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.amber,
          textTheme: GoogleFonts.cairoTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        initialRoute: welcomeRoute,
        onGenerateRoute: AppRouter.generatedRoute,
      ),
    );
  }
}
