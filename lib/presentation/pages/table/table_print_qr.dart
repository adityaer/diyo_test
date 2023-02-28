import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/string.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../providers/tablepage_notifier.dart';

class TablePrintQR extends StatelessWidget {
  final int id;

  const TablePrintQR({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(StringConstants.action),
        CustomElevatedButton(
          height: 30,
          onTap: () {
            context.read<TablePageNotifier>().updateColumnStatus.execute(id, 1);
            context.read<TablePageNotifier>().updateRightSidescreen(1);
          },
          label: StringConstants.printQR,
          color: Colors.red,
        )
      ],
    );
  }
}
