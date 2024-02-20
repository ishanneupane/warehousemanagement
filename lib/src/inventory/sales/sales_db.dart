import 'package:sqflite_common_ffi/sqflite_ffi.dart' as sql;

import 'model/sold.dart';

class SalesInventory {
  static Future<void> createTables(sql.Database database) async {
    await database.rawQuery('''
      CREATE TABLE salesInventory(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        productName TEXT,
        weight REAL
      )
    ''');
  }

  static Future<sql.Database> db() async {
    sql.databaseFactory = sql.databaseFactoryFfi;

    return sql.openDatabase("salesInventory.db", version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

  static Future<int> createProduct(Sold product) async {
    final db = await SalesInventory.db();
    final data = product.toMap();
    final id = await db.insert("salesInventory", data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getProducts() async {
    final db = await SalesInventory.db();
    return db.query("salesInventory", orderBy: "id");
  }

  static Future<Sold?> getProduct(int id) async {
    final db = await SalesInventory.db();
    final results = await db.query("salesInventory",
        where: "id=?", whereArgs: [id], limit: 1);
    if (results.isEmpty) {
      return null;
    }
    return Sold.fromJson(results.first);
  }

  static Future<int> updateProduct(Sold product) async {
    final db = await SalesInventory.db();
    final data = product.toMap();
    final result = await db
        .update("salesInventory", data, where: "id=?", whereArgs: [product.id]);
    return result;
  }

  static Future<void> deleteProduct(int id) async {
    final db = await SalesInventory.db();
    try {
      await db.delete("salesInventory", where: "id=?", whereArgs: [id]);
    } catch (e) {
      // Handle error
    }
  }
}
