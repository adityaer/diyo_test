import 'package:diyo_test/constants/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../table/table_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late BuildContext context;

  void onDrawerItemClicked(String name) {
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    Widget widget = Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        drawer: Drawer(
          backgroundColor: Colors.red,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(
                        Icons.menu,
                        size: 20,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: <Widget>[
                        const Icon(Icons.home, color: Colors.white, size: 20),
                        Container(width: 20),
                        Expanded(
                            child: Text(StringConstants.home,
                                style: const TextStyle(color: Colors.white))),
                      ],
                    ),
                  ),
                ),
                Container(height: 10),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: <Widget>[
                        const Icon(Icons.data_usage,
                            color: Colors.white, size: 20),
                        Container(width: 20),
                        Expanded(
                            child: Text(StringConstants.orderQueueu,
                                style: const TextStyle(color: Colors.white))),
                      ],
                    ),
                  ),
                ),
                Container(height: 10),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: <Widget>[
                        const Icon(Icons.class_, color: Colors.white, size: 20),
                        Container(width: 20),
                        Expanded(
                            child: Text(StringConstants.menu,
                                style: const TextStyle(color: Colors.white))),
                      ],
                    ),
                  ),
                ),
                Container(height: 10),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: <Widget>[
                        const Icon(Icons.power_settings_new,
                            color: Colors.white, size: 20),
                        Container(width: 20),
                        Expanded(
                            child: Text(
                          StringConstants.logout,
                          style: const TextStyle(color: Colors.white),
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.menu, color: Colors.black),
                onPressed: () {
                  scaffoldKey.currentState?.openDrawer();
                },
              ),
              const Expanded(child: TablePage())
            ],
          ),
        ));
    return widget;
  }
}
