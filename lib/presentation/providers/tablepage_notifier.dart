import 'package:diyo_test/domain/usecases/get_all_table_status.dart';
import 'package:diyo_test/domain/usecases/get_table_status.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entities/table_status.dart';
import '../../domain/usecases/update_column_status.dart';
import '../../utils/state_enum.dart';

class TablePageNotifier extends ChangeNotifier {
  final GetAllTableStatus getAllTableStatus;
  final GetTableStatus getTableStatus;
  final UpdateColumnStatus updateColumnStatus;

  TablePageNotifier(
      this.getAllTableStatus, this.getTableStatus, this.updateColumnStatus);

  ////

  bool _isTableScreen = true;

  bool get isTableScreen => _isTableScreen;

  ////

  RequestState _state = RequestState.Empty;

  RequestState get state => _state;

  List<TableStatus> _tableStatusList = [];

  List<TableStatus> get tableStatusList => _tableStatusList;

  String _message = '';

  String get message => _message;

  ////

  int _tableId = 1;

  int get tableId => _tableId;

  ///

  int _rightSideScreen = 0;

  int get rightSideScreen => _rightSideScreen;

  ///

  TableStatus? _tableStatus;

  TableStatus? get tableStatus => _tableStatus;

  Future<void> updateMiddleScreen() async {
    _isTableScreen = !_isTableScreen;
    notifyListeners();
  }

  Future<void> fetchTableStatus() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getAllTableStatus.execute();

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (tableStatusList) {
        _tableStatusList = tableStatusList;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }

  void updateTableChoose(int id) {
    _tableId = id;
    notifyListeners();
  }

  void updateRightSidescreen(int screen) {
    _rightSideScreen = screen;
    notifyListeners();
  }

  Future<void> getSingleTableStatus(int id) async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getTableStatus.execute(id);

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (tableStatus) {
        _tableStatus = tableStatus;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
