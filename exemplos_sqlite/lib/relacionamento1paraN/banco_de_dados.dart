import 'package:sqflite/sqflite.dart';

class BancoDeDados {
  static BancoDeDados? _instance;
  Database? db;

  final String onCreateEstadosSQL =
      'CREATE TABLE estados(codE INTEGER PRIMARY KEY AUTOINCREMENT,nome TEXT);';

  final String onCreateCidadesSQL =
      'CREATE TABLE cidades(codC INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT, codE INTEGER references estados);';

  onCreateFunction(Database db, int version) {
    db.execute(onCreateEstadosSQL);
    db.execute(onCreateCidadesSQL);
  }

  BancoDeDados._();

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

  factory BancoDeDados() {
    return _instance ??= BancoDeDados._();
  }
}
