import 'package:dio/dio.dart';

import '../../environment/environment.dart';
import '../../utils/exception.dart';
import '../models/menu_list_response.dart';

abstract class AppRemoteDataSource {
  Future<List<MenuModel>> getMenuList();
}

class AppRemoteDataSourceImpl implements AppRemoteDataSource {
  static final BASE_URL = Environment.baseUrl;

  final Dio client;

  AppRemoteDataSourceImpl({required this.client});

  @override
  Future<List<MenuModel>> getMenuList() async {
    final response = await client.get('$BASE_URL/menu_list');

    if (response.statusCode == 200) {
      return MenuListResponse.fromJson(response.data).menu!;
    } else {
      throw ServerException();
    }
  }
}
