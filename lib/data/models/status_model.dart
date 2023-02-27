import '../../domain/entities/table_status.dart';

class StatusModel {
  int id;
  String? tableName;
  int? status;
  String? orderId;

  StatusModel({
    required this.id,
    this.tableName,
    this.status,
    this.orderId,
  });

  factory StatusModel.fromMap(Map<String, dynamic> map) {
    return StatusModel(
      id: map['id'],
      tableName: map['table_name'],
      status: map['status'],
      orderId: map['order_id'],
    );
  }

  factory StatusModel.fromEntity(TableStatus tableStatus) => StatusModel(
      id: tableStatus.id,
      tableName: tableStatus.tableName,
      status: tableStatus.status,
      orderId: tableStatus.orderId);

  TableStatus toEntity() {
    return TableStatus(
      id: id,
      tableName: tableName,
      status: status,
      orderId: orderId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'table_name': tableName,
      'status': status,
      'order_id': orderId,
    };
  }
}
