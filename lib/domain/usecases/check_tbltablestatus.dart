import 'package:dartz/dartz.dart';

import '../../utils/failure.dart';
import '../repositories/app_repository.dart';

class CheckTblTableStatus {
  final AppRepository repository;

  CheckTblTableStatus(this.repository);

  Future<Either<Failure, bool>> execute() {
    return repository.isTblTableStatusEmpty();
  }
}
