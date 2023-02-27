import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../domain/entities/menu.dart';
import '../../domain/repositories/app_repository.dart';
import '../../utils/exception.dart';
import '../../utils/failure.dart';
import '../datasources/app_remote_data_source.dart';

class AppRepositoryImpl implements AppRepository {
  final AppRemoteDataSource remoteDataSource;

  AppRepositoryImpl({
    required this.remoteDataSource,
  });

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
}
