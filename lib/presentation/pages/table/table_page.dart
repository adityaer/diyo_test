import 'package:diyo_test/presentation/pages/table/table_status_screen.dart';
import 'package:diyo_test/presentation/pages/table/table_availability_screen.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                child: Image.asset(
                  'assets/images/diyo_logo.png',
                  height: 30,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Consumer<TablePageNotifier>(builder: (context, data, child) {
                return data.isTableScreen
                    ? const TableAvailabilityScreen()
                    : const MenuScreen();
              })
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(children: [
            Consumer<TablePageNotifier>(builder: (context, data, child) {
              return TableStatusScreen(
                id: data.tableId,
              );
            })
          ]),
        )
      ],
    );
  }
}
