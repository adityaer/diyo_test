class TableBilling {
  int orderId;
  int? id;
  int? total;
  String? paymentType;
  String? paymentDate;

  TableBilling({
    required this.orderId,
    this.id,
    this.total,
    this.paymentType,
    this.paymentDate,
  });

  factory TableBilling.fromMap(Map<String, dynamic> map) {
    return TableBilling(
      orderId: map['order_id'],
      id: map['id'],
      total: map['total'],
      paymentType: map['payment_type'],
      paymentDate: map['payment_date'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'order_id': orderId,
      'id': id,
      'total': total,
      'payment_type': paymentType,
      'payment_date': paymentDate,
    };
  }
}
