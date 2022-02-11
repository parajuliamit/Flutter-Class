import 'package:flutter/material.dart';
import 'package:grocery_nepal/app_controller.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/modules/auth/login/login_screen.dart';
import 'package:grocery_nepal/modules/auth/register/register_screen.dart';
import 'package:grocery_nepal/modules/home/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'modules/order_tab/order_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var sharedPrefs = await SharedPreferences.getInstance();
  runApp(MyApp(sharedPrefs));
}

class MyApp extends StatelessWidget {
  const MyApp(this.sharedPreferences, {Key? key}) : super(key: key);
  final SharedPreferences sharedPreferences;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Grocery Nepal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        appBarTheme: const AppBarTheme(
            // systemOverlayStyle: SystemUiOverlayStyle(
            //   statusBarColor: Theme.of(context).scaffoldBackgroundColor,
            //   statusBarIconBrightness: Brightness.dark,
            //   statusBarBrightness: Brightness.light,
            // ),
            color: greenColor,
            elevation: 1,
            // titleTextStyle: TextStyle(
            //   color: Colors.black,
            //   fontWeight: FontWeight.w600,
            //   fontSize: 18,
            // ),
            centerTitle: true),
      ),
      // home: const HomeScreen(),
      initialBinding: BindingsBuilder(() {
        Get.put(OrderController());
        Get.put(AppController(sharedPreferences), permanent: true);
      }),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen()
      },
    );
  }
}
