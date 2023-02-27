import 'package:dartz/dartz.dart';

import '../../utils/failure.dart';
import '../entities/table_billing.dart';
import '../repositories/app_repository.dart';

class GetTableBilling {
  final AppRepository repository;

  GetTableBilling(this.repository);

  Future<Either<Failure, TableBilling>> execute(int id, String orderId) {
    return repository.getTableBillingById(id, orderId);
  }
}
