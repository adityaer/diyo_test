import 'package:dartz/dartz.dart';
import 'package:diyo_test/domain/entities/table_status.dart';
import 'package:diyo_test/domain/repositories/app_repository.dart';

import '../../utils/failure.dart';

class GetAllTableStatus {
  final AppRepository _repository;

  GetAllTableStatus(this._repository);

  Future<Either<Failure, List<TableStatus>>> execute() {
    return _repository.getAllTableStatus();
  }
}
