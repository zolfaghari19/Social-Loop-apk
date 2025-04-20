import 'package:flutter/material.dart';
import 'package:flutter_application/gen/assets.gen.dart';
import 'package:flutter_application/pages/onbording.dart';

class MyAppSplashScreen extends StatefulWidget {
  const MyAppSplashScreen({super.key});

  @override
  State<MyAppSplashScreen> createState() => _MyAppSplashScreenState();
}

class _MyAppSplashScreenState extends State<MyAppSplashScreen> {
  @override
  void initState() {
    super.initState();

    // تأخیر در ناوبری پس از ساخت کامل ویجت
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2)).then((_) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Assets.background.splash.image(
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          // لوگو در مرکز صفحه
          Center(
            child: Assets.icons.logo.svg(
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
