import 'package:diyo_test/presentation/providers/menu_list_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/state_enum.dart';
import '../../../widgets/menu_card.dart';
import '../../../widgets/progress_dot.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<MenuListNotifier>(context, listen: false).fetchMenuList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuListNotifier>(builder: (context, data, child) {
      final state = data.state;
      if (state == RequestState.Loading) {
        return SizedBox(
          height: 150,
          child: WidgetDotFade(color: Colors.teal[400], size: 20.0),
        );
      } else if (state == RequestState.Loaded) {
        return Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            children: <Widget>[
              for (var menu in data.menuList)
                MenuCard(
                  menu: menu,
                ),
            ],
          ),
        ); //MovieList(data.movies);
      } else {
        return const SizedBox(
          height: 150,
          child: Center(
            child: Text('Can not load data'),
          ),
        );
      }
    });
  }
}
