import 'package:diyo_test/domain/usecases/get_all_table_status.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entities/table_status.dart';
import '../../utils/state_enum.dart';

class TablePageNotifier extends ChangeNotifier {
  bool _isTableScreen = true;

  bool get isTableScreen => _isTableScreen;

  ////

  final GetAllTableStatus getAllTableStatus;

  TablePageNotifier(this.getAllTableStatus);

  RequestState _state = RequestState.Empty;

  RequestState get state => _state;

  List<TableStatus> _tableStatusList = [];

  List<TableStatus> get tableStatusList => _tableStatusList;

  String _message = '';

  String get message => _message;

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
}
