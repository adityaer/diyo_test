import 'package:diyo_test/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../presentation/providers/tablepage_notifier.dart';

class TotalOrder extends StatelessWidget {
  final int totalPrice;

  const TotalOrder({Key? key, required this.totalPrice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Total",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const Spacer(),
        Consumer<TablePageNotifier>(builder: (context, data, child) {
          return Text(data.totalPrice.toCurrencyString(),
              style: const TextStyle(fontWeight: FontWeight.w600));
        })
      ],
    );
  }
}
