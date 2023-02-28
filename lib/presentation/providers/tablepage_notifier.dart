import 'package:diyo_test/domain/usecases/get_all_table_status.dart';
import 'package:diyo_test/domain/usecases/get_table_status.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entities/order.dart';
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

  TableStatus? _tableStatus;

  TableStatus? get tableStatus => _tableStatus;

  ///
  List<Order> _orderList = [];

  List<Order> get orderList => _orderList;

  ///
  int _totalPrice = 0;

  int get totalPrice => _totalPrice;

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

  Future<void> addOrder(Order order) async {
    if (_orderList.isEmpty) {
      _orderList.add(order);
    } else {
      var isMenuExist = false;
      for (var orderData in _orderList) {
        if (order.menu.id == orderData.menu.id) {
          orderData.quantity = orderData.quantity + 1;
          isMenuExist = !isMenuExist;
          break;
        }
      }

      if (!isMenuExist) {
        _orderList.add(order);
      }
    }
    calculateTotalPrice();
    notifyListeners();
  }

  Future<void> decreaseOrder(Order order) async {
    if (_orderList.isNotEmpty) {
      for (var orderData in _orderList) {
        if (order.menu.id == orderData.menu.id) {
          orderData.quantity = orderData.quantity - 1;
          if (orderData.quantity == 0) {
            _orderList.remove(orderData);
          }
          break;
        }
      }
    }
    calculateTotalPrice();
    notifyListeners();
  }

  void calculateTotalPrice() {
    var priceTemp = 0;
    for (var order in _orderList) {
      priceTemp = priceTemp + (order.quantity * order.menu.price);
    }
    _totalPrice = priceTemp;
  }

  void resetTotalPrice() {
    _totalPrice = 0;
  }
}
