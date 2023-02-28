import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/string.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../providers/tablepage_notifier.dart';

class TableMakeOrder extends StatelessWidget {
  final int id;

  const TableMakeOrder({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      height: 30,
      onTap: () {
        context.read<TablePageNotifier>().updateColumnStatus.execute(id, 2);
        context.read<TablePageNotifier>().updateMiddleScreen();
        context.read<TablePageNotifier>().updateRightSidescreen(2);
      },
      label: StringConstants.makeAnOrder,
      color: Colors.red,
    );
  }
}
