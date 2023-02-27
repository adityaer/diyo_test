import 'package:dartz/dartz.dart';

import '../../utils/failure.dart';
import '../entities/table_status.dart';
import '../repositories/app_repository.dart';

class GetTableStatus {
  final AppRepository repository;

  GetTableStatus(this.repository);

  Future<Either<Failure, TableStatus>> execute(int id) {
    return repository.getTableStatusById(id);
  }
}
