import 'package:diyo_test/widgets/order_item.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/menu.dart';
import '../../../domain/entities/order.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/total_order.dart';

class TableAddOrder extends StatelessWidget {
  const TableAddOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var menu = const Menu(id: 1,
        name: "Nasi Goreng",
        price: 15000,
        image: "https://kbu-cdn.com/dk/wp-content/uploads/nasi-goreng-kencur-kemangi.jpg");

    var order = Order(menu: menu, quantity: 1);
    return Column(
      children: [
        const Text('Ordered Menu'),
        OrderItem(order: order, isBilling: false,),
        const TotalOrder(totalPrice: 20000),
        CustomElevatedButton(
          height: 30,
          onTap: () {},
          label: 'Add Order',
          color: Colors.red,
        )
      ],
    );
  }
}
