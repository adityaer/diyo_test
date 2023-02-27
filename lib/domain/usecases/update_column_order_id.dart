import 'package:dartz/dartz.dart';

import '../../utils/failure.dart';
import '../repositories/app_repository.dart';

class UpdateColumnOrderId {
  final AppRepository repository;

  UpdateColumnOrderId(this.repository);

  Future<Either<Failure, String>> execute(int id,String orderid) {
    return repository.updateColumnOrderId(id, orderid);
  }
}
