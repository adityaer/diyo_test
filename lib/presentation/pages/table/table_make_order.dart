import 'package:flutter/material.dart';

import '../../../widgets/custom_elevated_button.dart';

class TableMakeOrder extends StatelessWidget {
  const TableMakeOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      height: 30,
      onTap: () {},
      label: 'Make an Order',
      color: Colors.red,
    );
  }
}
