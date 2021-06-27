import 'package:sqflite/sqflite.dart';

class BancoDeDados {
  static BancoDeDados _instance;
  Database db;

  final String onCreateMusicas =
      'CREATE TABLE musicas(codM INTEGER PRIMARY KEY AUTOINCREMENT,nome TEXT);';

  final String onCreateArtistas =
      'CREATE TABLE artistas(codA INTEGER PRIMARY KEY AUTOINCREMENT,nome TEXT);';

  final String onCreateFeats =
      'CREATE TABLE feats(codF INTEGER PRIMARY KEY AUTOINCREMENT, codM INTEGER references musicas, codA INTEGER references artistas );';

  onCreateFunction(Database db, int version) {
    db.execute(onCreateMusicas);
    db.execute(onCreateArtistas);
    db.execute(onCreateFeats);
  }

  BancoDeDados._internal();

  Future<void> openDb() async {
    if (db == null)
      return await getDatabasesPath().then((value) async {
        String path = value += 'exemplo.db';
        await openDatabase(
          path,
          version: 1,
          onCreate: onCreateFunction,
        ).then((value) {
          db = value;
        });
      });
  }

  static BancoDeDados get instance {
    if (_instance == null) _instance = BancoDeDados._internal();
    return _instance;
  }
}
