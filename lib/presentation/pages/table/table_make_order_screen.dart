import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/string.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../providers/tablepage_notifier.dart';

class TableMakeOrderScreen extends StatelessWidget {
  final int id;

  const TableMakeOrderScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      height: 50,
      onTap: () {
        context.read<TablePageNotifier>().updateColumnStatus.execute(id, 2);
        context.read<TablePageNotifier>().updateMiddleScreen();
        context.read<TablePageNotifier>().updateRightSidescreen(2);
        context.read<TablePageNotifier>().getSingleTableStatus(id);
      },
      label: StringConstants.makeAnOrder,
      color: Colors.red,
    );
  }
}
