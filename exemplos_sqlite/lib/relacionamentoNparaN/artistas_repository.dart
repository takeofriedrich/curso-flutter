import 'package:aula_bd/relacionamentoNparaN/artista.dart';
import 'package:aula_bd/relacionamentoNparaN/banco_de_dados.dart';

class ArtistasRepository {
  final String sqlSelect = 'select * from artistas where codA = ?';

  Future<Artista?> select(int? codA) async {
    Artista? a;
    await BancoDeDados().db!.rawQuery(sqlSelect, [codA]).then((value) {
      value.forEach((element) {
        a = Artista.fromJson(element);
      });
    });
    return a;
  }

  final String sqlInsert = 'insert into artistas (nome) values (?);';

  Future<void> insert(Artista artista) async {
    await BancoDeDados().db!.rawInsert(sqlInsert, [artista.nome]);
  }

  final String sqlDelete = 'delete from artistas where codA = ?';
  final String sqlDeleteFeats = 'delete from feats where codA = ?';

  Future<void> delete(Artista artista) async {
    await BancoDeDados().db!.rawDelete(sqlDelete, [artista.codA]);
    await BancoDeDados().db!.rawDelete(sqlDeleteFeats, [artista.codA]);
  }
}
