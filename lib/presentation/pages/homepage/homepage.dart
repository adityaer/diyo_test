import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/colors.dart';
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
      appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: AppColors.grey_3,
          ),
          title: const Text("Drawer White",
              style: TextStyle(color: AppColors.grey_80)),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.menu, color: AppColors.grey_60),
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.close, color: AppColors.grey_60),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ]),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(height: 8),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: <Widget>[
                      const Icon(Icons.domain,
                          color: AppColors.grey_20, size: 20),
                      Container(width: 20),
                      const Expanded(
                          child: Text(
                        "Home",
                      )),
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
                          color: AppColors.grey_20, size: 20),
                      Container(width: 20),
                      const Expanded(
                          child: Text(
                        "Order Queue",
                      )),
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
                      const Icon(Icons.class_,
                          color: AppColors.grey_20, size: 20),
                      Container(width: 20),
                      const Expanded(
                          child: Text(
                        "Menu",
                      )),
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
                          color: AppColors.grey_20, size: 20),
                      Container(width: 20),
                      const Expanded(
                          child: Text(
                        "Logout",
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: TablePage(),
    );
    return widget;
  }
}
