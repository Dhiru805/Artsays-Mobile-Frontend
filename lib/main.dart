import 'package:artsays_app/config/size_config.dart';
import 'package:artsays_app/onboard/wrapper/splash_wrapper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(62),
              topRight: Radius.circular(62),
            ),
          ),
        ),
      ),
      home: SafeArea(child: Builder(
        builder: (context) {
          SizeConfig.init(context);
          // return SplashScreen(showAnimation: false,);
          return SplashWrapper();
        },
        // home: SplashScreen(),
      )),
    );
  }
}
