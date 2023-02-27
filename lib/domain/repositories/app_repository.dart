import 'package:dartz/dartz.dart';
import '../../utils/failure.dart';
import '../entities/menu.dart';

abstract class AppRepository {
  Future<Either<Failure, List<Menu>>> getMenuList();
}
