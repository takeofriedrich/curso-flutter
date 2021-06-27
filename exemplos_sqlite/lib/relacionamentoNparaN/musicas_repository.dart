import 'package:aula_bd/relacionamentoNparaN/artista.dart';
import 'package:aula_bd/relacionamentoNparaN/artistas_repository.dart';
import 'package:aula_bd/relacionamentoNparaN/banco_de_dados.dart';
import 'package:aula_bd/relacionamentoNparaN/musica.dart';

class MusicasRepository {
  ArtistasRepository artistasRepository = ArtistasRepository();

  final String sqlSelectFeat = 'select * from feats where codM = ?';

  Future<List<int?>> selectCodAMusicas(int? codM) async {
    List<int?> codAs = [];
    await BancoDeDados().db!.rawQuery(sqlSelectFeat, [codM]).then((value) {
      value.forEach((element) {
        codAs.add(element['codA'] as int?);
      });
    });
    return codAs;
  }

  final String sqlSelect = 'select * from musicas';

  Future<List<Musica>> selectAll() async {
    List<Musica> musicas = [];
    await BancoDeDados().db!.rawQuery(sqlSelect).then((value) async {
      for (int i = 0; i < value.length; i++) {
        List<int?> codAs = await selectCodAMusicas(value[i]['codM'] as int?);
        Musica m = Musica.fromJson(value[i]);
        for (int j = 0; j < codAs.length; j++) {
          Artista? a = await artistasRepository.select(codAs[i]);
          m.artistas.add(a);
        }
        musicas.add(m);
      }
    });
    return musicas;
  }

  final String sqlInsert = 'insert into musicas (nome) values (?);';

  Future<void> insert(Musica musica) async {
    await BancoDeDados().db!.rawInsert(sqlInsert, [musica.nome]);
  }

  final String sqlInsertFeats = 'insert into feats (codM,codA) values (?,?);';

  Future<void> inserirFeat(int codM, int codA) async {
    await BancoDeDados().db!.rawInsert(sqlInsertFeats, [codM, codA]);
  }

  final String sqlDelete = 'delete from musicas where codM = ?';
  final String sqlDeleteFeats = 'delete from feats where codM = ?';

  Future<void> delete(Musica musica) async {
    await BancoDeDados().db!.rawDelete(sqlDelete, [musica.codM]);
    await BancoDeDados().db!.rawDelete(sqlDeleteFeats, [musica.codM]);
  }
}
