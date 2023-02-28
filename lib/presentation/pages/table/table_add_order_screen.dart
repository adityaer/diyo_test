import 'package:diyo_test/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/string.dart';
import '../../../domain/entities/menu.dart';
import '../../../domain/entities/order.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/total_order.dart';
import '../../providers/tablepage_notifier.dart';

class TableAddOrderScreen extends StatelessWidget {
  final int id;

  const TableAddOrderScreen({Key? key, required this.id}) : super(key: key);

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
        Text(StringConstants.orderedMenu),
        OrderItem(
          order: order,
          isBilling: false,
        ),
        const TotalOrder(totalPrice: 20000),
        CustomElevatedButton(
          height: 30,
          onTap: () {
            context.read<TablePageNotifier>().updateColumnStatus.execute(id, 3);
            context.read<TablePageNotifier>().updateMiddleScreen();
            context.read<TablePageNotifier>().updateRightSidescreen(3);
          },
          label: StringConstants.addOrder,
          color: Colors.red,
        )
      ],
    );
  }
}
