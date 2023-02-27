import '../../domain/entities/table_order.dart';

class OrderModel {
  int orderId;
  int id;
  String? date;
  String? order;

  OrderModel({
    required this.orderId,
    required this.id,
    this.date,
    this.order,
  });

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      orderId: map['order_id'],
      id: map['id'],
      date: map['date'],
      order: map['order'],
    );
  }

  factory OrderModel.fromEntity(TableOrder tableOrder) => OrderModel(
        orderId: tableOrder.orderId,
        id: tableOrder.id,
        date: tableOrder.date,
        order: tableOrder.order,
      );

  TableOrder toEntity() {
    return TableOrder(
      orderId: orderId,
      id: id,
      date: date,
      order: order,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'order_id': orderId,
      'id': id,
      'date': date,
      'order': order,
    };
  }
}
