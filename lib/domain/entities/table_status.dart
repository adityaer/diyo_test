class TableStatus {
  int id;
  String? tableName;
  int? status;
  String? orderId;

  TableStatus({
    required this.id,
    this.tableName,
    this.status,
    this.orderId,
  });
}
