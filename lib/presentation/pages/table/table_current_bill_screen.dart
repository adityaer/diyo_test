import 'package:diyo_test/widgets/order_item.dart';
import 'package:diyo_test/widgets/total_order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/string.dart';
import '../../../domain/entities/menu.dart';
import '../../../domain/entities/order.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../providers/tablepage_notifier.dart';

class TableCurrentBillScreen extends StatelessWidget {
  final int id;

  const TableCurrentBillScreen({Key? key, required this.id}) : super(key: key);

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
          margin: EdgeInsets.symmetric(vertical: 15),
          color: Colors.red,
          height: 50,
          onTap: () {},
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
            context.read<TablePageNotifier>().updateRightSidescreen(4);
            context.read<TablePageNotifier>().getSingleTableStatus(id);
            context.read<TablePageNotifier>().fetchTableStatus();
          },
          label: StringConstants.billing,
        )
      ],
    );
  }
}
