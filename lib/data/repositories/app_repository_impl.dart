import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:diyo_test/domain/entities/table_billing.dart';
import 'package:diyo_test/domain/entities/table_order.dart';
import '../../domain/entities/menu.dart';
import '../../domain/entities/table_status.dart';
import '../../domain/repositories/app_repository.dart';
import '../../utils/exception.dart';
import '../../utils/failure.dart';
import '../datasources/app_local_data_source.dart';
import '../datasources/app_remote_data_source.dart';
import '../models/billing_model.dart';
import '../models/order_model.dart';
import '../models/status_model.dart';

class AppRepositoryImpl implements AppRepository {
  final AppRemoteDataSource remoteDataSource;
  final AppLocalDataSource localDataSource;

  AppRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, bool>> isTblTableStatusEmpty() async {
    try {
      final result = await localDataSource.isTblTableStatusEmpty();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<TableStatus>>> getAllTableStatus() async {
    final result = await localDataSource.getAllTableStatus();
    return Right(result.map((data) => data.toEntity()).toList());
  }

  @override
  Future<Either<Failure, List<Menu>>> getMenuList() async {
    try {
      final result = await remoteDataSource.getMenuList();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, TableBilling>> getTableBillingById(
      int id, String orderId) async {
    final result = await localDataSource.getTableBillingById(id, orderId);
    return Right(result!.toEntity());
  }

  @override
  Future<Either<Failure, TableOrder>> getTableOrderById(
      int id, String orderId) async {
    final result = await localDataSource.getTableOrderById(id, orderId);
    return Right(result!.toEntity());
  }

  @override
  Future<Either<Failure, TableStatus>> getTableStatusById(int id) async {
    final result = await localDataSource.getTableStatusById(id);
    return Right(result!.toEntity());
  }

  @override
  Future<Either<Failure, String>> insertBilling(
      TableBilling tableBilling) async {
    try {
      final result = await localDataSource
          .insertBilling(BillingModel.fromEntity(tableBilling));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, String>> insertOrder(TableOrder tableOrder) async {
    try {
      final result =
          await localDataSource.insertOrder(OrderModel.fromEntity(tableOrder));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, String>> insertStatus(TableStatus tableStatus) async {
    try {
      final result = await localDataSource
          .insertStatus(StatusModel.fromEntity(tableStatus));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, String>> updateColumnOrderId(
      int id, String orderid) async {
    try {
      final result = await localDataSource.updateColumnOrderId(id, orderid);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, String>> updateColumnStatus(
      int id, int newStatus) async {
    try {
      final result = await localDataSource.updateColumnStatus(id, newStatus);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }
}
