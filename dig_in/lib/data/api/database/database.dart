import 'dart:io';

import 'package:dig_in/data/api/database/constants_database.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart'as db;

class Database {
  db.Database? _database;

  Future<db.Database> get instanceDb async{
    if (_database != null) return _database!;
    return _database = await initDb();
  }
  
  Future<db.Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path,nameBaseData);
    return await db.openDatabase(
      path,
      version: version,
      onCreate: (db, version)async{
        await db.execute('''
        CREATE TABLE $userTable(
          email TEXT,
          password TEXT,
          name TEXT,
          lastname TEXT,
          uid TEXT PRIMARY KEY,
          image TEXT
        )
        ''');
      },
    );
  }
}