import 'package:flutter/material.dart';

import '../homepage/homepage.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  void startSplashScreen() {
    Future.delayed(
      const Duration(seconds: 4),
      () {
        Navigator.pushNamed(
          context,
          HomePage.routeName,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/diyo_logo.png'),
          ],
        ),
      ),
    );
  }
}
