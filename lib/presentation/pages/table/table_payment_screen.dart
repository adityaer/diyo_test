import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/string.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../providers/tablepage_notifier.dart';

class TablePaymentScreen extends StatefulWidget {
  final int id;

  const TablePaymentScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<TablePaymentScreen> createState() => _TablePaymentScreenState();
}

class _TablePaymentScreenState extends State<TablePaymentScreen> {
  String paymentType = "cash";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(StringConstants.action,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
        Column(
          children: [
            RadioListTile<String>(
              title: Text(StringConstants.cash),
              value: "cash",
              dense: true,
              groupValue: paymentType,
              onChanged: (value) {
                setState(() {
                  paymentType = value.toString();
                });
              },
            ),
            RadioListTile<String>(
              title: Text(StringConstants.creditCard),
              value: "cc",
              dense: true,
              groupValue: paymentType,
              onChanged: (value) {
                setState(() {
                  paymentType = value.toString();
                });
              },
            ),
            RadioListTile<String>(
              dense: true,
              title: Text(StringConstants.debitCard),
              value: "debit",
              groupValue: paymentType,
              onChanged: (value) {
                setState(() {
                  paymentType = value.toString();
                });
              },
            ),
            RadioListTile<String>(
              title: Text(StringConstants.qris),
              value: "qris",
              dense: true,
              groupValue: paymentType,
              onChanged: (value) {
                setState(() {
                  paymentType = value.toString();
                });
              },
            )
          ],
        ),
        CustomElevatedButton(
          height: 50,
          onTap: () {
            context
                .read<TablePageNotifier>()
                .updateColumnStatus
                .execute(widget.id, 0);
            context.read<TablePageNotifier>().getSingleTableStatus(widget.id);
            context.read<TablePageNotifier>().fetchTableStatus();
          },
          label: StringConstants.payment,
          color: Colors.red,
        )
      ],
    );
  }
}
