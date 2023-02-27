import 'package:dartz/dartz.dart';
import 'package:diyo_test/domain/entities/table_order.dart';

import '../../utils/failure.dart';
import '../repositories/app_repository.dart';

class InsertOrder {
  final AppRepository repository;

  InsertOrder(this.repository);

  Future<Either<Failure, String>> execute(TableOrder tableOrder) {
    return repository.insertOrder(tableOrder);
  }
}
