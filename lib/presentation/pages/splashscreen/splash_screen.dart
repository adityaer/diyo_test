import 'package:diyo_test/presentation/providers/splashscreen_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../mock_data.dart';
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
    _insertData();
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

  void _insertData() async {
    final splashScreenProvider = context.read<SplashScreenNotifier>();
    await splashScreenProvider.checkTableStatus();

    if (splashScreenProvider.isEmpty) {
      for (var table in tableList) {
        splashScreenProvider.insertStatus.execute(table);
      }
    }
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
