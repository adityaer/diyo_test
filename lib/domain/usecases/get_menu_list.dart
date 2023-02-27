import 'package:dartz/dartz.dart';

import '../../utils/failure.dart';
import '../entities/menu.dart';
import '../repositories/app_repository.dart';

class GetMenuList {
  final AppRepository repository;

  GetMenuList(this.repository);

  Future<Either<Failure, List<Menu>>> execute() {
    return repository.getMenuList();
  }
}
