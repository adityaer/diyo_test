import 'package:dartz/dartz.dart';

import '../../utils/failure.dart';
import '../repositories/app_repository.dart';

class UpdateColumnStatus {
  final AppRepository repository;

  UpdateColumnStatus(this.repository);

  Future<Either<Failure, String>> execute(int id, int newStatus) {
    return repository.updateColumnStatus(id, newStatus);
  }
}
