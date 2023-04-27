// ignore_for_file: depend_on_referenced_packages

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import 'package:path/path.dart';

import '../view/widgets/Conversation.dart';

class Chatdb {
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
    String path = join(documentdirectry.path, 'chat1.db');
    var db = await openDatabase(path, version: 1, onCreate: _oncreate);
    return db;
  }

  _oncreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE chat1(id INTEGER PRIMARY KEY AUTOINCREMENT ,text TEXT NOT NULL ,time TEXT NOT NULL)");
  }

  Future<ChatMessage2> insert(ChatMessage2 bmiModel) async {
    var dbclient = await db;
    await dbclient!.insert('chat1', bmiModel.toMap());
    return bmiModel;
  }

  Future<List<ChatMessage2>> getbmilist() async {
    var dbclient = await db;
    final List<Map<String, Object?>> queryResult =
        await dbclient!.query('chat1');
    return queryResult.map((e) => ChatMessage2.fromMap(e)).toList();
  }

  Future<int> delete() async {
    var dbClient = await db;
    return await dbClient!.delete('chat1');
    //  await dbClient!.delete('chat1', where: 'id=?', whereArgs: [id]);
  }

  Future<void> createNewTable(ChatMessage2 data) async {
    final String tableName = DateTime.now().millisecondsSinceEpoch.toString();
    var dbClient = await db;
    await dbClient!.execute('''
      CREATE TABLE $tableName (
       id INTEGER PRIMARY KEY AUTOINCREMENT ,text TEXT NOT NULL ,time TEXT NOT NULL
      )
    ''');
    await dbClient.insert(tableName, {'data': data});
    await dbClient.delete(tableName);
  }
}
