import 'package:flutter/material.dart';

import '../../../widgets/custom_elevated_button.dart';

class TablePayment extends StatefulWidget {
  const TablePayment({Key? key}) : super(key: key);

  @override
  State<TablePayment> createState() => _TablePaymentState();
}

class _TablePaymentState extends State<TablePayment> {
  String gender = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Action'),
        Column(
          children: [
            RadioListTile<String>(
              title: Text("Cash"),
              value: "cash",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                });
              },
            ),
            RadioListTile<String>(
              title: Text("Credit Card"),
              value: "cc",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                });
              },
            ),
            RadioListTile<String>(
              title: Text("Debit Card"),
              value: "debit",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                });
              },
            ),
            RadioListTile<String>(
              title: Text("QRIS"),
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
          onTap: () {},
          label: 'Payment',
          color: Colors.red,
        )
      ],
    );
  }
}
