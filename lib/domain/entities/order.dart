import 'package:equatable/equatable.dart';

import 'menu.dart';

class Order extends Equatable {
  Order({required this.menu, this.quantity = 0});

  final Menu menu;
  int quantity;

  @override
  List<Object> get props => [menu, quantity];
}
