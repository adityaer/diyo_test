import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/string.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../providers/tablepage_notifier.dart';

class TablePayment extends StatefulWidget {
  final int id;

  const TablePayment({Key? key, required this.id}) : super(key: key);

  @override
  State<TablePayment> createState() => _TablePaymentState();
}

class _TablePaymentState extends State<TablePayment> {
  String gender = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(StringConstants.action),
        Column(
          children: [
            RadioListTile<String>(
              title: Text(StringConstants.cash),
              value: "cash",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                });
              },
            ),
            RadioListTile<String>(
              title: Text(StringConstants.creditCard),
              value: "cc",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                });
              },
            ),
            RadioListTile<String>(
              title: Text(StringConstants.debitCard),
              value: "debit",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                });
              },
            ),
            RadioListTile<String>(
              title: Text(StringConstants.qris),
              value: "qris",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                });
              },
            )
          ],
        ),
        CustomElevatedButton(
          height: 30,
          onTap: () {
            context
                .read<TablePageNotifier>()
                .updateColumnStatus
                .execute(widget.id, 0);
            context.read<TablePageNotifier>().updateRightSidescreen(0);
          },
          label: StringConstants.payment,
          color: Colors.red,
        )
      ],
    );
  }
}
