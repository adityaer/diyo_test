import 'package:diyo_test/presentation/providers/tablepage_notifier.dart';
import 'package:diyo_test/widgets/availability_legend.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/table_circle.dart';

class TableAvailabilityScreen extends StatefulWidget {
  const TableAvailabilityScreen({super.key});

  @override
  State<TableAvailabilityScreen> createState() =>
      _TableAvailabilityScreenState();
}

class _TableAvailabilityScreenState extends State<TableAvailabilityScreen> {
  void refreshState() {
    setState(() {});
  }

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
      child: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<TablePageNotifier>(builder: (context, data, child) {
              return GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: <Widget>[
                  for (var table in data.tableStatusList)
                    TableCircle(
                      tableStatus: table,
                    ),
                ],
              );
            }),
            const SizedBox(
              height: 25,
            ),
            const AvailabilityLegend(status: 0),
            const AvailabilityLegend(status: 1),
            const AvailabilityLegend(status: 3),
            const AvailabilityLegend(status: 4)
          ],
        ),
      ),
    );
  }
}
