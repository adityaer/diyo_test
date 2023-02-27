import '../../utils/exception.dart';
import '../models/billing_model.dart';
import '../models/order_model.dart';
import '../models/status_model.dart';
import 'db/database_helper.dart';

abstract class AppLocalDataSource {
  Future<bool> isTblTableStatusEmpty();

  Future<String> insertStatus(StatusModel statusModel);

  Future<StatusModel?> getTableStatusById(int id);

  Future<String> updateColumnStatus(int id, int newStatus);

  Future<String> updateColumnOrderId(int id, String orderId);

  Future<String> insertOrder(OrderModel orderModel);

  Future<OrderModel?> getTableOrderById(int id, String orderId);

  Future<String> insertBilling(BillingModel billingModel);

  Future<BillingModel?> getTableBillingById(int id, String orderId);
}

class AppLocalDataSourceImpl implements AppLocalDataSource {
  final DatabaseHelper databaseHelper;

  AppLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<bool> isTblTableStatusEmpty() async {
    try {
      final result = await databaseHelper.isTblTableStatusEmpty();
      return result;
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> insertStatus(StatusModel statusModel) async {
    try {
      await databaseHelper.insertStatus(statusModel);
      return 'Added to Status';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<StatusModel?> getTableStatusById(int id) async {
    final result = await databaseHelper.getTableStatusById(id);
    if (result != null) {
      return StatusModel.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<String> updateColumnStatus(int id, int newStatus) async {
    try {
      await databaseHelper.updateColumnStatus(id, newStatus);
      return 'Update Status Value';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> updateColumnOrderId(int id, String orderId) async {
    try {
      await databaseHelper.updateColumnOrderId(id, orderId);
      return 'Update Order Id Value';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> insertOrder(OrderModel orderModel) async {
    try {
      await databaseHelper.insertOrder(orderModel);
      return 'Added to Order';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<OrderModel?> getTableOrderById(int id, String orderId) async {
    final result = await databaseHelper.getTableOrderById(id, orderId);
    if (result != null) {
      return OrderModel.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<String> insertBilling(BillingModel billingModel) async {
    try {
      await databaseHelper.insertBilling(billingModel);
      return 'Added to Billing';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<BillingModel?> getTableBillingById(int id, String orderId) async {
    final result = await databaseHelper.getTableBillingById(id, orderId);
    if (result != null) {
      return BillingModel.fromMap(result);
    } else {
      return null;
    }
  }
}
