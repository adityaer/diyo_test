import 'package:diyo_test/widgets/order_item.dart';
import 'package:diyo_test/widgets/total_order.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/menu.dart';
import '../../../domain/entities/order.dart';
import '../../../widgets/custom_elevated_button.dart';

class TableCurrentBill extends StatelessWidget {
  const TableCurrentBill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var menu = const Menu(
        id: 1,
        name: "Nasi Goreng",
        price: 15000,
        image:
            "https://kbu-cdn.com/dk/wp-content/uploads/nasi-goreng-kencur-kemangi.jpg");

    var order = Order(menu: menu, quantity: 1);
    return Column(
      children: [
        const Text('Current Bill'),
        OrderItem(
          order: order,
          isBilling: true,
        ),
        const TotalOrder(totalPrice: 20000),
        const Divider(
          color: Colors.black,
          height: 10,
          thickness: 1,
        ),
        CustomElevatedButton(
          height: 30,
          onTap: () {},
          label: 'Add Order',
        ),
        const SizedBox(
          height: 10,
        ),
        CustomElevatedButton(
          height: 30,
          onTap: () {},
          label: 'Billing',
        )
      ],
    );
  }
}
