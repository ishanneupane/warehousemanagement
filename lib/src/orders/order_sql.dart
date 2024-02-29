import 'package:sqflite_common_ffi/sqflite_ffi.dart' as sql;

import 'model/order_model.dart';

class Order {
  static Future<void> createTables(sql.Database database) async {
    await database.rawQuery('''
      CREATE TABLE totalorder(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        productName TEXT,
        weight REAL,
        publishedDate TEXT
      )
    ''');
  }

  static Future<sql.Database> db() async {
    sql.databaseFactory = sql.databaseFactoryFfi;

    return sql.openDatabase("totalorder.db", version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

  static Future<int> createProduct(OrderModel product) async {
    final db = await Order.db();
    final data = product.toMap();
    final id = await db.insert("totalorder", data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getProducts() async {
    final db = await Order.db();
    return db.query("totalorder", orderBy: "id");
  }

  static Future<OrderModel?> getProduct(int id) async {
    final db = await Order.db();
    final results =
        await db.query("totalorder", where: "id=?", whereArgs: [id], limit: 1);
    if (results.isEmpty) {
      return null;
    }
    return OrderModel.fromJson(results.first);
  }

  static Future<int> updateProduct(OrderModel product) async {
    final db = await Order.db();
    final data = product.toMap();
    final result = await db
        .update("totalorder", data, where: "id=?", whereArgs: [product.id]);
    return result;
  }

  static Future<void> deleteProduct(int id) async {
    final db = await Order.db();
    try {
      await db.delete("totalorder", where: "id=?", whereArgs: [id]);
    } catch (e) {
      // Handle error
    }
  }
}
