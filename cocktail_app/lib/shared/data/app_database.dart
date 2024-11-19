import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  final int version = 1;
  final String databaseName = 'app_database.db';
  final String cocktailTableName = 'cocktails';

  Database? _db;

  Future<Database> openDb() async {
    _db ??= await openDatabase(join(await getDatabasesPath(), databaseName), version: version, onCreate: (db, version) {
      return db.execute('''
        CREATE TABLE $cocktailTableName(
          id TEXT PRIMARY KEY,
          name TEXT,
          category TEXT,
          instructions TEXT,
          image TEXT
        )
      ''');
    });
    return _db as Database;
  }
}
