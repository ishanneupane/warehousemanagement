import 'package:sqflite_common_ffi/sqflite_ffi.dart' as sql;

import '../../../core/model/product_model.dart';

class CurrentInventory {
  static Future<void> createTables(sql.Database database) async {
    await database.rawQuery('''
      CREATE TABLE currentInventory(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        productName TEXT,
        weight REAL,
        arrival TEXT,
        bestBefore TEXT
      )
    ''');
  }

  static Future<sql.Database> db() async {
    sql.databaseFactory = sql.databaseFactoryFfi;

    return sql.openDatabase("currentInventory.db", version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

  static Future<int> createProduct(OrderModel product) async {
    final db = await CurrentInventory.db();
    final data = product.toMap();
    final id = await db.insert("currentInventory", data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getProducts() async {
    final db = await CurrentInventory.db();
    return db.query("currentInventory", orderBy: "id");
  }

  static Future<OrderModel?> getProduct(int id) async {
    final db = await CurrentInventory.db();
    final results = await db.query("currentInventory",
        where: "id=?", whereArgs: [id], limit: 1);
    if (results.isEmpty) {
      return null;
    }
    return OrderModel.fromJson(results.first);
  }

  static Future<int> updateProduct(OrderModel product) async {
    final db = await CurrentInventory.db();
    final data = product.toMap();
    final result = await db.update("currentInventory", data,
        where: "id=?", whereArgs: [product.id]);
    return result;
  }

  static Future<void> deleteProduct(int id) async {
    final db = await CurrentInventory.db();
    try {
      await db.delete("currentInventory", where: "id=?", whereArgs: [id]);
    } catch (e) {
      // Handle error
    }
  }
}
