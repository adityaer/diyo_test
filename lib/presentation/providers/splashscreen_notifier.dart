import 'package:diyo_test/domain/usecases/check_tbltablestatus.dart';
import 'package:flutter/foundation.dart';
import '../../domain/usecases/insert_status.dart';
import '../../utils/state_enum.dart';

class SplashScreenNotifier extends ChangeNotifier {
  final CheckTblTableStatus checkTblTableStatus;
  final InsertStatus insertStatus;

  SplashScreenNotifier(this.checkTblTableStatus, this.insertStatus);

  RequestState _state = RequestState.Empty;

  RequestState get state => _state;

  bool _isEmpty = false;

  bool get isEmpty => _isEmpty;

  String _message = '';

  String get message => _message;

  Future<void> checkTableStatus() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await checkTblTableStatus.execute();

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (isEmpty) {
        _isEmpty = isEmpty;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
