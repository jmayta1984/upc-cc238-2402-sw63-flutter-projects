import 'package:cocktail_app/features/cocktails/domain/cocktail.dart';
import 'package:cocktail_app/shared/data/app_database.dart';
import 'package:sqflite/sqlite_api.dart';

class CocktailDao {
  final AppDatabase _appDatabase = AppDatabase();

  Future<void> insert(Cocktail cocktail) async {
    Database db = await _appDatabase.openDb();
    await db.insert(_appDatabase.cocktailTableName, cocktail.toMap());
  }

  Future<void> delete(String id) async {
    Database db = await _appDatabase.openDb();
    await db.delete(_appDatabase.cocktailTableName,
        where: " id = ?", whereArgs: [id]);
  }

  Future<List<Cocktail>> fetchAll() async {
    Database db = await _appDatabase.openDb();
    List maps = await db.query(_appDatabase.cocktailTableName);
    return maps.map((map) => Cocktail.fromMap(map)).toList();
  }

  Future<bool> isFavorite(String id) async {
    Database db = await _appDatabase.openDb();
    List maps = await db.query(_appDatabase.cocktailTableName,
        where: " id = ?", whereArgs: [id]);
    return maps.isNotEmpty;
  }
}
