import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/string.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../providers/tablepage_notifier.dart';

class TablePrintQRScreen extends StatelessWidget {
  final int id;

  const TablePrintQRScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          StringConstants.action,
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
        ),
        const SizedBox(
          height: 20,
        ),
        CustomElevatedButton(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: 50,
          onTap: () {
            context.read<TablePageNotifier>().updateColumnStatus.execute(id, 1);
            context.read<TablePageNotifier>().updateRightSidescreen(1);
            context.read<TablePageNotifier>().getSingleTableStatus(id);
            context.read<TablePageNotifier>().fetchTableStatus();
          },
          label: StringConstants.printQR,
          color: Colors.red,
        )
      ],
    );
  }
}
