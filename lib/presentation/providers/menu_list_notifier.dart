import 'package:flutter/foundation.dart';
import '../../domain/entities/menu.dart';
import '../../domain/usecases/get_menu_list.dart';
import '../../utils/state_enum.dart';

class MenuListNotifier extends ChangeNotifier {
  final GetMenuList getMenuList;

  MenuListNotifier(this.getMenuList);

  RequestState _state = RequestState.Empty;

  RequestState get state => _state;

  List<Menu> _menuList = [];

  List<Menu> get menuList => _menuList;

  String _message = '';

  String get message => _message;

  Future<void> fetchMenuList() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getMenuList.execute();

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (menusData) {
        _menuList = menusData;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
