import 'package:diyo_test/presentation/pages/table/table_add_order.dart';
import 'package:diyo_test/presentation/pages/table/table_make_order.dart';
import 'package:diyo_test/presentation/pages/table/table_print_qr.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/custom_elevated_button.dart';
import '../table_current_bill.dart';
import '../table_payment.dart';

class TableStatus extends StatefulWidget {
  const TableStatus({Key? key}) : super(key: key);

  @override
  State<TableStatus> createState() => _TableStatusState();
}

class _TableStatusState extends State<TableStatus> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Table'),
        Row(
          children: const [Text('Status : '), Text('Seated')],
        ),
        const SizedBox(
          height: 20,
        ),
        const SingleChildScrollView(
          child: TableCurrentBill(),
        )
      ],
    );
  }
}
