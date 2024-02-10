import 'package:sqflite_common_ffi/sqflite_ffi.dart' as sql;

class SqlHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.rawQuery('''
      CREATE TABLE items(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        description TEXT
      )
    ''');
  }

  static Future<sql.Database> db() async {
    // Initialize databaseFactoryFfi before opening the database
    sql.databaseFactory = sql.databaseFactoryFfi;

    // Connect to the database
    return sql.openDatabase("bdb.db", version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

  static Future<int> createItem(String title, String? description) async {
    final db = await SqlHelper.db();
    final data = {"title": title, "description": description};
    final id = await db.insert("items", data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SqlHelper.db();
    return db.query("items", orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SqlHelper.db();
    return db.query("items", where: "id=?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateItem(
      int id, String title, String? description) async {
    final db = await SqlHelper.db();
    final data = {
      "title": title,
      "description": description,
    };
    final result =
        await db.update("items", data, where: "id=?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteItem(int id) async {
    final db = await SqlHelper.db();
    try {
      await db.delete("items", where: "id=?", whereArgs: [id]);
    } catch (e) {}
  }
}
