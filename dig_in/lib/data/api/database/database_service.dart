import 'package:dig_in/data/api/database/constants_database.dart';
import 'package:dig_in/data/api/database/database.dart';

class DatabaseService {
  final Database _database;
  DatabaseService(this._database);

  Future<int> createUser(Map<String, dynamic> data) async {
    final db = await _database.instanceDb;
    return await db.insert(userTable, data);
  }

}