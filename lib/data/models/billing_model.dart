import '../../domain/entities/table_billing.dart';

class BillingModel {
  int orderId;
  int? id;
  int? total;
  String? paymentType;
  String? paymentDate;

  BillingModel({
    required this.orderId,
    this.id,
    this.total,
    this.paymentType,
    this.paymentDate,
  });

  factory BillingModel.fromMap(Map<String, dynamic> map) {
    return BillingModel(
      orderId: map['order_id'],
      id: map['id'],
      total: map['total'],
      paymentType: map['payment_type'],
      paymentDate: map['payment_date'],
    );
  }

  factory BillingModel.fromEntity(TableBilling tableBilling) => BillingModel(
        orderId: tableBilling.orderId,
        id: tableBilling.id,
        total: tableBilling.total,
        paymentDate: tableBilling.paymentDate,
        paymentType: tableBilling.paymentType,
      );

  TableBilling toEntity() {
    return TableBilling(
        orderId: orderId,
        id: id,
        total: total,
        paymentDate: paymentDate,
        paymentType: paymentType);
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
