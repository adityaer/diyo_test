import 'package:diyo_test/presentation/providers/tablepage_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/table_circle.dart';
import '../../providers/menu_list_notifier.dart';

class TableAvailability extends StatefulWidget {
  const TableAvailability({super.key});

  @override
  State<TableAvailability> createState() => _TableAvailabilityState();
}

class _TableAvailabilityState extends State<TableAvailability> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<TablePageNotifier>(context, listen: false).fetchTableStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<TablePageNotifier>(builder: (context, data, child) {
        return GridView.count(
          crossAxisCount: 3,
          children: <Widget>[
            for (var table in data.tableStatusList)
              TableCircle(
                tableName: table.tableName!,
                status: table.status!,
              ),
          ],
        );
      })
      /*GridView.count(
        crossAxisCount: 3,
        children: <Widget>[
          for (int i = 0; i < 7; i++)
            TableCircle(
              tableName: 'Table ${i + 1}',
              status: 1,
            ),
        ],
      ),*/
    );
  }
}
