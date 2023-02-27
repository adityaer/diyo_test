import 'package:dartz/dartz.dart';

import '../../utils/failure.dart';
import '../entities/table_order.dart';
import '../repositories/app_repository.dart';

class GetTableOrder {
  final AppRepository repository;

  GetTableOrder(this.repository);

  Future<Either<Failure, TableOrder>> execute(int id, String orderId) {
    return repository.getTableOrderById(id, orderId);
  }
}
