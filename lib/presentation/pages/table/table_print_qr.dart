import 'package:flutter/material.dart';

import '../../../widgets/custom_elevated_button.dart';

class TablePrintQR extends StatelessWidget {
  const TablePrintQR({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Action'),
        CustomElevatedButton(
          height: 30,
          onTap: () {},
          label: 'Print QR',
          color: Colors.red,
        )
      ],
    );
  }
}
