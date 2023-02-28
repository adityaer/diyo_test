import 'package:diyo_test/widgets/order_item.dart';
import 'package:diyo_test/widgets/total_order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/string.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../providers/tablepage_notifier.dart';

class TableCurrentBillScreen extends StatelessWidget {
  final int id;

  const TableCurrentBillScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(StringConstants.currentBilling,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
        const SizedBox(
          height: 15,
        ),
        Consumer<TablePageNotifier>(builder: (context, data, child) {
          return ListView.builder(
            itemCount: data.orderList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final order = data.orderList[index];
              return OrderItem(
                order: order,
                isBilling: true,
              );
            },
          );
        }),
        const SizedBox(
          height: 10,
        ),
        const TotalOrder(totalPrice: 20000),
        const SizedBox(height: 10),
        const Divider(
          color: Colors.black,
          height: 10,
          thickness: 1,
        ),
        CustomElevatedButton(
          margin: const EdgeInsets.symmetric(vertical: 15),
          color: Colors.red,
          height: 50,
          onTap: () {
            context.read<TablePageNotifier>().updateColumnStatus.execute(id, 2);
            context.read<TablePageNotifier>().updateMiddleScreen();
            context.read<TablePageNotifier>().getSingleTableStatus(id);
          },
          label: StringConstants.addOrder,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomElevatedButton(
          color: Colors.red,
          height: 50,
          onTap: () {
            context.read<TablePageNotifier>().updateColumnStatus.execute(id, 4);
            context.read<TablePageNotifier>().getSingleTableStatus(id);
            context.read<TablePageNotifier>().fetchTableStatus();
            context.read<TablePageNotifier>().orderList.clear();
            context.read<TablePageNotifier>().resetTotalPrice();
          },
          label: StringConstants.billing,
        )
      ],
    );
  }
}
