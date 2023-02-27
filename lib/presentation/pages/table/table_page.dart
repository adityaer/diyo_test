import 'package:diyo_test/presentation/pages/table/status/table_status.dart';
import 'package:diyo_test/presentation/pages/table/table_availability.dart';
import 'package:flutter/material.dart';

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
            children: const [
              TableAvailability()
              //MenuScreen()
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
