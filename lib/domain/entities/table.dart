import 'package:equatable/equatable.dart';

class Table extends Equatable {
  const Table(
    this.tableName, {
    required this.status,
  });

  final String tableName;
  final int status;

  @override
  List<Object> get props => [tableName, status];
}
