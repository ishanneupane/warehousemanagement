import 'package:sqflite_common_ffi/sqflite_ffi.dart' as sql;

import '../../core/model/product_model.dart';

class Order {
  static Future<void> createTables(sql.Database database) async {
    await database.rawQuery('''
      CREATE TABLE order(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        productName TEXT,
        weight REAL,
        bestBefore TEXT
      )
    ''');
  }

  static Future<sql.Database> db() async {
    sql.databaseFactory = sql.databaseFactoryFfi;

    return sql.openDatabase("order.db", version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

  static Future<int> createProduct(Product product) async {
    final db = await Order.db();
    final data = product.toMap();
    final id = await db.insert("order", data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getProducts() async {
    final db = await Order.db();
    return db.query("order", orderBy: "id");
  }

  static Future<Product?> getProduct(int id) async {
    final db = await Order.db();
    final results =
        await db.query("order", where: "id=?", whereArgs: [id], limit: 1);
    if (results.isEmpty) {
      return null;
    }
    return Product.fromJson(results.first);
  }

  static Future<int> updateProduct(Product product) async {
    final db = await Order.db();
    final data = product.toMap();
    final result =
        await db.update("order", data, where: "id=?", whereArgs: [product.id]);
    return result;
  }

  static Future<void> deleteProduct(int id) async {
    final db = await Order.db();
    try {
      await db.delete("order", where: "id=?", whereArgs: [id]);
    } catch (e) {
      // Handle error
    }
  }
}
