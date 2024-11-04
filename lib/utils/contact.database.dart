import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/contact.model.dart';

class ContactDatabase {
  static Database? _database;

  Future<void> initDB() async {
    if (_database == null) {
      String databasePath = await getDatabasesPath();
      String _path = join(databasePath, 'voyage.db');
      _database = await openDatabase(_path, version: 1, onCreate: onCreate);
    }
  }

  void onCreate(Database db, int version) async {
    String sql =
        'CREATE TABLE ${Contact.table} (id INTEGER PRIMARY KEY AUTOINCREMENT, nom STRING, tel STRING)';
    await db.execute(sql);
  }

  Future<List<Map<String, dynamic>>> recuperer() async {
    await initDB();
    return _database!.query(Contact.table);
  }

  Future<int> inserer(Contact contact) async {
    await initDB();
    return await _database!.insert(Contact.table, contact.toJson());
  }
  Future<int> modifier(Contact contact) async {
    await initDB();
    return await _database!.update(
      Contact.table,
      contact.toJson(),
      where: 'id = ?',
      whereArgs: [contact.id],
    );
  }

  Future<int> supprimer(Contact contact) async {
    await initDB();
    return await _database!.delete(
      Contact.table,
      where: 'id = ?',
      whereArgs: [contact.id],
    );
  }

}
