import 'package:diyo_test/presentation/providers/tablepage_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/table_circle.dart';

class TableAvailabilityScreen extends StatefulWidget {
  const TableAvailabilityScreen({super.key});

  @override
  State<TableAvailabilityScreen> createState() => _TableAvailabilityScreenState();
}

class _TableAvailabilityScreenState extends State<TableAvailabilityScreen> {
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
                tableStatus: table,
              ),
          ],
        );
      }),
    );
  }
}