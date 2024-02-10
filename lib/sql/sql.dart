import 'package:sqflite/sqflite.dart' as sql;

class Sqlhelper {
  static Future<void> createTables(sql.Database database) async {
    await database.rawQuery('''
  CREATE TABLE warehouse(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    item_name TEXT,
    qty INTEGER
      )
''');
  }

  static Future<sql.Database> db() async {
    //database ma connect
    return sql.openDatabase("bdb.db", version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

  static Future<int> createItem(String title, String description) async {
    final db = await Sqlhelper.db();
    final data = {"item_name": title, "qty": description};
    final id = await db.insert("warehouse", data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await Sqlhelper.db();
    return db.query("warehouse", orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await Sqlhelper.db();
    return db.query("items", where: "id=?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateItem(
      int id, String title, String? description) async {
    final db = await Sqlhelper.db();
    final data = {
      "item_name": title,
      "qty": description,
    };
    final result =
        await db.update("warehouse", data, where: "id=?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteItem(int id) async {
    final db = await Sqlhelper.db();
    try {
      await db.delete("warehouse", where: "id=?", whereArgs: [id]);
    } catch (e) {}
  }
}
