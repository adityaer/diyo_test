import 'package:diyo_test/presentation/pages/homepage/home_page.dart';
import 'package:diyo_test/presentation/pages/login/pin_page.dart';
import 'package:diyo_test/presentation/pages/splashscreen/splash_screen.dart';
import 'package:diyo_test/presentation/providers/menu_list_notifier.dart';
import 'package:diyo_test/presentation/providers/splashscreen_notifier.dart';
import 'package:diyo_test/presentation/providers/tablepage_notifier.dart';
import 'package:diyo_test/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'constants/string.dart';
import 'environment/environment.dart';
import 'injection.dart' as di;

void main() async {
  Environment.flavorName = 'develop';
  await dotenv.load(fileName: Environment.fileName);
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => di.locator<MenuListNotifier>()),
        ChangeNotifierProvider(
            create: (_) => di.locator<SplashScreenNotifier>()),
        ChangeNotifierProvider(create: (_) => di.locator<TablePageNotifier>()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Diyo Test App',
          theme: ThemeData(
            primarySwatch: Colors.red,
            textTheme: GoogleFonts.montserratTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          home: const SplashScreenPage(),
          navigatorObservers: [routeObserver],
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case HomePage.routeName:
                return MaterialPageRoute(builder: (_) => const HomePage());
              case PinPage.routeName:
                return MaterialPageRoute(builder: (_) => PinPage());
              default:
                return MaterialPageRoute(builder: (_) {
                  return Scaffold(
                    body: Center(
                      child: Text(StringConstants.pageNotFound),
                    ),
                  );
                });
            }
          }),
    );
  }
}
