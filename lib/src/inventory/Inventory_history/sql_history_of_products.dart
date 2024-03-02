import 'package:sqflite_common_ffi/sqflite_ffi.dart' as sql;

import '../../../core/model/product_model.dart';

class HistoryOfInventoryOfProducts {
  static Future<void> createTables(sql.Database database) async {
    await database.rawQuery('''
      CREATE TABLE productsHistory(
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

    return sql.openDatabase("historyOfProduct.db", version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

  static Future<int> createProduct(ProductModel product) async {
    final db = await HistoryOfInventoryOfProducts.db();
    final data = product.toMap();
    final id = await db.insert("productsHistory", data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getProducts() async {
    final db = await HistoryOfInventoryOfProducts.db();
    return db.query("productsHistory", orderBy: "id");
  }

  static Future<ProductModel?> getProduct(int id) async {
    final db = await HistoryOfInventoryOfProducts.db();
    final results = await db.query("productsHistory",
        where: "id=?", whereArgs: [id], limit: 1);
    if (results.isEmpty) {
      return null;
    }
    return ProductModel.fromJson(results.first);
  }

  static Future<int> updateProduct(ProductModel product) async {
    final db = await HistoryOfInventoryOfProducts.db();
    final data = product.toMap();
    final result = await db.update("productsHistory", data,
        where: "id=?", whereArgs: [product.id]);
    return result;
  }

  static Future<void> deleteProduct(int id) async {
    final db = await HistoryOfInventoryOfProducts.db();
    try {
      await db.delete("productsHistory", where: "id=?", whereArgs: [id]);
    } catch (e) {
      // Handle error
    }
  }
}
