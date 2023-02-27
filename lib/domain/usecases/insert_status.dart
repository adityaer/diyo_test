import 'package:dartz/dartz.dart';
import 'package:diyo_test/domain/entities/table_status.dart';

import '../../utils/failure.dart';
import '../repositories/app_repository.dart';

class GetMenuList {
  final AppRepository repository;

  GetMenuList(this.repository);

  Future<Either<Failure, String>> execute(TableStatus tableStatus) {
    return repository.insertStatus(tableStatus);
  }
}
