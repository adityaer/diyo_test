import 'package:equatable/equatable.dart';

import 'menu.dart';

class Order extends Equatable {
  const Order({
    required this.menu,
    required this.quantity,
  });

  final Menu menu;
  final int quantity;

  @override
  List<Object> get props => [menu, quantity];
}
