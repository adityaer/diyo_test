import 'dart:async';
import 'package:sqflite/sqflite.dart';

import '../../models/billing_model.dart';
import '../../models/order_model.dart';
import '../../models/status_model.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;

  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDb();
    return _database;
  }

  static const String _tblTableStatus = 'tablestatus';
  static const String _tblTableOrder = 'tableorder';
  static const String _tblTableBilling = 'tablebilling';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/diyoapps.db';

    var db = await openDatabase(databasePath, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE  $_tblTableStatus (
        id INTEGER PRIMARY KEY,
        table_name TEXT,
        status  INTEGER,
        order_id TEXT
      );
    ''');

    await db.execute('''
      CREATE TABLE  $_tblTableOrder (
        order_id TEXT PRIMARY KEY,
        id INTEGER,
        date TEXT,
        order_data TEXT
      );
    ''');

    await db.execute('''
      CREATE TABLE  $_tblTableBilling (
        order_id TEXT PRIMARY KEY,
        id INTEGER,
        total INTEGER,
        payment_type TEXT,
        payment_date TEXT
      );
    ''');
  }

  // table status

  Future<bool> isTblTableStatusEmpty() async {
    final db = await database;
    List<Map<String, dynamic>> result = await db!.query(
      _tblTableStatus,
    );

    return result.isEmpty;
  }

  Future<List<Map<String, dynamic>>> getAllTableStatus() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(_tblTableStatus);

    return results;
  }

  Future<int> insertStatus(StatusModel status) async {
    final db = await database;
    return await db!.insert(_tblTableStatus, status.toMap());
  }

  Future<Map<String, dynamic>?> getTableStatusById(int id) async {
    final db = await database;
    final results = await db!.query(
      _tblTableStatus,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  Future<void> updateColumnStatus(int id, int newStatus) async {
    final db = await database;
    int rowsAffected = await db!.update(
      _tblTableStatus,
      {'status': newStatus},
      where: 'id = ?',
      whereArgs: [id],
    );

    if (rowsAffected > 0) {
      print('Data dengan id $id berhasil diupdate');
    } else {
      print('Data dengan id $id tidak ditemukan');
    }
  }

  Future<void> updateColumnOrderId(int id, String orderId) async {
    final db = await database;
    int rowsAffected = await db!.update(
      _tblTableStatus,
      {'order_id': orderId},
      where: 'id = ?',
      whereArgs: [id],
    );

    if (rowsAffected > 0) {
      print('Data dengan id $id berhasil diupdate');
    } else {
      print('Data dengan id $id tidak ditemukan');
    }
  }

  // table order

  Future<int> insertOrder(OrderModel order) async {
    final db = await database;
    return await db!.insert(_tblTableOrder, order.toMap());
  }

  Future<Map<String, dynamic>?> getTableOrderById(int id, String orderId) async {
    final db = await database;
    final results = await db!.query(
      _tblTableOrder,
      where: 'id = ? AND order_id = ?',
      whereArgs: [id, orderId],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  // table billing

  Future<int> insertBilling(BillingModel billing) async {
    final db = await database;
    return await db!.insert(_tblTableBilling, billing.toMap());
  }

  Future<Map<String, dynamic>?> getTableBillingById(int id, String orderId) async {
    final db = await database;
    final results = await db!.query(
      _tblTableBilling,
      where: 'id = ? AND order_id = ?',
      whereArgs: [id, orderId],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }
}
