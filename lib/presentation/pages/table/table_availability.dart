import 'package:flutter/material.dart';

import '../../../widgets/table_circle.dart';

class TableAvailability extends StatelessWidget {
  const TableAvailability({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 3,
        children: <Widget>[
          for (int i = 0; i < 7; i++)
            TableCircle(
              tableName: 'Table ${i + 1}',
              status: 1,
            ),
        ],
      ),
    );
  }
}
