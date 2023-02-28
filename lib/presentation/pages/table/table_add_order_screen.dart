import 'package:diyo_test/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/string.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/total_order.dart';
import '../../providers/tablepage_notifier.dart';

class TableAddOrderScreen extends StatelessWidget {
  final int id;

  const TableAddOrderScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          StringConstants.orderedMenu,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 30,
        ),
        Consumer<TablePageNotifier>(builder: (context, data, child) {
          return ListView.builder(
            itemCount: data.orderList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final order = data.orderList[index];
              return OrderItem(
                order: order,
                isBilling: false,
              );
            },
          );
        }),
        const SizedBox(
          height: 30,
        ),
        const TotalOrder(totalPrice: 20000),
        const SizedBox(
          height: 30,
        ),
        CustomElevatedButton(
          height: 50,
          onTap: () {
            context.read<TablePageNotifier>().updateColumnStatus.execute(id, 3);
            context.read<TablePageNotifier>().updateMiddleScreen();
            context.read<TablePageNotifier>().getSingleTableStatus(id);
            context.read<TablePageNotifier>().fetchTableStatus();
          },
          label: StringConstants.addOrder,
          color: Colors.red,
        )
      ],
    );
  }
}
