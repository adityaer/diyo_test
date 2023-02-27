import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:diyo_test/domain/usecases/check_tbltablestatus.dart';
import 'package:diyo_test/domain/usecases/get_table_billing.dart';
import 'package:diyo_test/domain/usecases/get_table_order.dart';
import 'package:diyo_test/domain/usecases/get_table_status.dart';
import 'package:diyo_test/domain/usecases/insert_billing.dart';
import 'package:diyo_test/domain/usecases/update_column_status.dart';
import 'package:diyo_test/presentation/providers/menu_list_notifier.dart';
import 'package:diyo_test/presentation/providers/splashscreen_notifier.dart';
import 'package:get_it/get_it.dart';
import 'data/datasources/app_local_data_source.dart';
import 'data/datasources/app_remote_data_source.dart';
import 'data/datasources/db/database_helper.dart';
import 'data/repositories/app_repository_impl.dart';
import 'domain/repositories/app_repository.dart';
import 'domain/usecases/get_menu_list.dart';
import 'domain/usecases/insert_order.dart';
import 'domain/usecases/insert_status.dart';
import 'domain/usecases/update_column_order_id.dart';
import 'environtment/environment.dart';

final locator = GetIt.instance;

void init() {
  locator.registerLazySingleton<AppRepository>(
    () => AppRepositoryImpl(
        remoteDataSource: locator(), localDataSource: locator()),
  );

  locator.registerLazySingleton<AppRemoteDataSource>(
      () => AppRemoteDataSourceImpl(client: locator()));

  locator.registerLazySingleton<AppLocalDataSource>(
      () => AppLocalDataSourceImpl(databaseHelper: locator()));

  locator.registerFactory(
    () => MenuListNotifier(
      locator(),
    ),
  );

  locator.registerFactory(
    () => SplashScreenNotifier(locator(), locator()),
  );

  locator.registerLazySingleton(() => CheckTblTableStatus(locator()));
  locator.registerLazySingleton(() => GetMenuList(locator()));
  locator.registerLazySingleton(() => GetTableBilling(locator()));
  locator.registerLazySingleton(() => GetTableOrder(locator()));
  locator.registerLazySingleton(() => GetTableStatus(locator()));
  locator.registerLazySingleton(() => InsertBilling(locator()));
  locator.registerLazySingleton(() => InsertOrder(locator()));
  locator.registerLazySingleton(() => InsertStatus(locator()));
  locator.registerLazySingleton(() => UpdateColumnOrderId(locator()));
  locator.registerLazySingleton(() => UpdateColumnStatus(locator()));

  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // Dio
  var dio = Dio(
    BaseOptions(
      baseUrl: Environment.baseUrl,
      connectTimeout: 60 * 1000,
      receiveTimeout: 60 * 1000,
    ),
  );
  dio.interceptors.add(DioLoggingInterceptor(
    level: Level.body,
    compact: false,
  ));

  locator.registerLazySingleton(() => dio);
}
