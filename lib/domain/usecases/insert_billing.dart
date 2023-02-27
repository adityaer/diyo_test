import 'package:dartz/dartz.dart';

import '../../utils/failure.dart';
import '../entities/table_billing.dart';
import '../repositories/app_repository.dart';

class InsertBilling {
  final AppRepository repository;

  InsertBilling(this.repository);

  Future<Either<Failure, String>> execute(TableBilling tableBilling) {
    return repository.insertBilling(tableBilling);
  }
}
