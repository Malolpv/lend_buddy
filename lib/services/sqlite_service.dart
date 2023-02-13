import 'dart:js_util';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:lend_buddy/models/base_model.dart';

class SqliteService {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();

    return openDatabase(
      join(path, 'database.db'),
      onCreate: (database, version) async {
        await database.execute(
          //TODO REFAIRE LA CREATION DE LA DB
          "CREATE TABLE Notes(id INTEGER PRIMARY KEY AUTOINCREMENT, description TEXT NOT NULL)",
        );
      },
      version: 1,
    );
  }

  Future<int> createItem(BaseModel item, String tableName) async {
    final Database db = await initializeDB();
    final id = await db.insert(tableName, item.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  Future<List<T>> getItems<T extends BaseModel>(
      final String tableName,
      final String where,
      final List<Object> whereArgs,
      final String orderBy) async {
    final db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query(tableName,
        where: where, whereArgs: whereArgs, orderBy: orderBy);
    return queryResult.map((e) => newObject<T>().fromMap(e)).toList().cast<T>();
  }

  Future<void> update(String tableName, BaseModel item) async {
    final db = await initializeDB();
    db.update(tableName, item.toMap(), where: "id = ?", whereArgs: [item.id]);
  }

  Future<void> delete(String tableName, int id) async {
    final dbClient = await initializeDB();
    await dbClient.delete(tableName, where: "id = ?", whereArgs: [id]);
  }
}
