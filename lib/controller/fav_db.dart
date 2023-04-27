// ignore_for_file: depend_on_referenced_packages

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import 'package:path/path.dart';

import '../model/favouriteModel.dart';

class Favoritedb {
  static Database? _db;
  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }

  initDatabase() async {
    io.Directory documentdirectry = await getApplicationDocumentsDirectory();
    String path = join(documentdirectry.path, 'fav2.db');
    var db = await openDatabase(path, version: 1, onCreate: _oncreate);
    return db;
  }

  _oncreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE fav2(id INTEGER PRIMARY KEY AUTOINCREMENT ,text TEXT NOT NULL,text1 TEXT NOT NULL ,first TEXT NOT NULL ,second TEXT NOT NULL)");
  }

  Future<FavoriteM> insert(FavoriteM bmiModel) async {
    var dbclient = await db;
    await dbclient!.insert('fav2', bmiModel.toMap());
    return bmiModel;
  }

  Future<List<FavoriteM>> getbmilist() async {
    var dbclient = await db;
    final List<Map<String, Object?>> queryResult =
        await dbclient!.query('fav2');
    return queryResult.map((e) => FavoriteM.fromMap(e)).toList();
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient!.delete('fav2', where: 'id=?', whereArgs: [id]);
  }
}
