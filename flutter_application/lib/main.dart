import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/pages/article.dart';
import 'package:flutter_application/pages/home_page.dart';
import 'package:flutter_application/pages/login_page.dart';
import 'package:flutter_application/pages/onbording.dart';
import 'package:flutter_application/pages/splash.dart';
import 'package:flutter_application/pages/main_profile.dart';
import 'package:flutter_application/widget/routs.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,


      routes: {
        "/": (context) => const MyAppLoginPage(),
        MyRoutes.splashRoute: (context) => const MyAppSplashScreen(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.onboardingRoute: (context) => const OnBoardingScreen(),
        MyRoutes.loginRoute: (context) => const MyAppLoginPage(),
        MyRoutes.articleRoute: (context) => const ArticleScreen(),
        MyRoutes.mainProfileRoute: (context) => const MainProfile(),
      },
    );
  }
}