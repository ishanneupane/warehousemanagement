import 'package:sqflite/sqflite.dart' as sql;

class ProductCrud {
  static Future<void> createTables(sql.Database database) async {
    await database.rawQuery('''
  CREATE TABLE productDetail(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    item_name TEXT,
    qty INTEGER
      )
''');
  }

  static Future<sql.Database> db() async {
    //database ma connect
    return sql.openDatabase("productDetail.db", version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

  static Future<int> createItem(String title, String description) async {
    final db = await ProductCrud.db();
    final data = {"item_name": title, "qty": description};
    final id = await db.insert("productDetail", data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await ProductCrud.db();
    return db.query("productDetail", orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await ProductCrud.db();
    return db.query("items", where: "id=?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateItem(
      int id, String title, String? description) async {
    final db = await ProductCrud.db();
    final data = {
      "item_name": title,
      "qty": description,
    };
    final result =
        await db.update("productDetail", data, where: "id=?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteItem(int id) async {
    final db = await ProductCrud.db();
    try {
      await db.delete("productDetail", where: "id=?", whereArgs: [id]);
    } catch (e) {}
  }
}
