import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../domain/entities/menu.dart';
import '../domain/entities/order.dart';
import '../presentation/providers/tablepage_notifier.dart';

class MenuCard extends StatelessWidget {
  final Menu menu;

  const MenuCard({Key? key, required this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: GestureDetector(
        onTap: () {
          var order = Order(menu: menu);
          order.quantity = 1;
          context.read<TablePageNotifier>().addOrder(order);
        },
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.red,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  menu.image,
                ),
              )),
        ),
      ),
    );
  }
}
