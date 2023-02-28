import 'package:diyo_test/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../domain/entities/order.dart';
import '../presentation/providers/tablepage_notifier.dart';

class OrderItem extends StatelessWidget {
  final Order order;
  final bool isBilling;

  const OrderItem({Key? key, required this.order, required this.isBilling})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(order.menu.name),
        ),
        Expanded(
          flex: 1,
          child: Text(' x${order.quantity}'),
        ),
        Expanded(
          flex: 2,
          child: Text(order.menu.price.toCurrencyString()),
        ),
        Visibility(
            visible: !isBilling,
            child: IconButton(
                onPressed: () {
                  context.read<TablePageNotifier>().decreaseOrder(order);
                },
                icon: const Icon(
                  Icons.remove_circle_outline,
                  color: Colors.red,
                )))
      ],
    );
  }
}
