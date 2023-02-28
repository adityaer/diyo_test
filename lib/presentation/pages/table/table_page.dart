import 'package:diyo_test/presentation/pages/table/status/table_status.dart';
import 'package:diyo_test/presentation/pages/table/table_availability.dart';
import 'package:diyo_test/presentation/providers/tablepage_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../menu/menu_screen.dart';

class TablePage extends StatelessWidget {
  const TablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Consumer<TablePageNotifier>(builder: (context, data, child) {
                return data.isTableScreen
                    ? TableAvailability()
                    : const MenuScreen();
              })
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            children: const [TableStatusScreen()],
          ),
        )
      ],
    );
  }
}
