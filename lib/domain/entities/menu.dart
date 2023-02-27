import 'package:equatable/equatable.dart';

class Menu extends Equatable {
  const Menu({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  final int id;
  final String name;
  final int price;
  final String image;

  @override
  List<Object> get props => [id, name, price, image];
}
