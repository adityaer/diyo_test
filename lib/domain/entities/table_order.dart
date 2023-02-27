class TableOrder {
  int orderId;
  int id;
  String? date;
  String? order;

  TableOrder({
    required this.orderId,
    required this.id,
    this.date,
    this.order,
  });

  factory TableOrder.fromMap(Map<String, dynamic> map) {
    return TableOrder(
      orderId: map['order_id'],
      id: map['id'],
      date: map['date'],
      order: map['order'],
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
