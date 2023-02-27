import 'package:dartz/dartz.dart';
import '../../presentation/pages/table/status/table_status.dart';
import '../../utils/failure.dart';
import '../entities/menu.dart';
import '../entities/table_billing.dart';
import '../entities/table_order.dart';
import '../entities/table_status.dart';

abstract class AppRepository {
  Future<Either<Failure, List<Menu>>> getMenuList();

  // database

  Future<Either<Failure, String>> insertStatus(TableStatus tableStatus);

  Future<Either<Failure, TableStatus>> getTableStatusById(int id);

  Future<Either<Failure, String>> updateColumnStatus(int id, int newStatus);

  Future<Either<Failure, String>> updateColumnOrderId(int id, String orderid);

  Future<Either<Failure, String>> insertOrder(TableOrder tableOrder);

  Future<Either<Failure, TableOrder>> getTableOrderById(int id, String orderId);

  Future<Either<Failure, String>> insertBilling(TableBilling tableBilling);

  Future<Either<Failure, TableBilling>> getTableBillingById(int id, String orderId);
}
