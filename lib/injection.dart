import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:diyo_test/presentation/providers/menu_list_notifier.dart';
import 'package:get_it/get_it.dart';
import 'data/datasources/app_remote_data_source.dart';
import 'data/repositories/app_repository_impl.dart';
import 'domain/repositories/app_repository.dart';
import 'domain/usecases/get_menu_list.dart';
import 'environtment/environment.dart';

final locator = GetIt.instance;

void init() {
  locator.registerLazySingleton<AppRepository>(
    () => AppRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  locator.registerLazySingleton<AppRemoteDataSource>(
      () => AppRemoteDataSourceImpl(client: locator()));

  locator.registerFactory(
    () => MenuListNotifier(
      locator(),
    ),
  );

  locator.registerLazySingleton(() => GetMenuList(locator()));

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
