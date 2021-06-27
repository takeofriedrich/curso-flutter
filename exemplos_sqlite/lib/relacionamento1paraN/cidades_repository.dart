import 'package:aula_bd/relacionamento1paraN/banco_de_dados.dart';

import 'cidade.dart';

class CidadesRepository {
  final String sqlSelect = 'select * from cidades where codE = ?';

  Future<List<Cidade>> selectCidadesEstado(int codE) async {
    List<Cidade> cidades = [];

    await BancoDeDados.instance.db.rawQuery(sqlSelect, [codE]).then((value) {
      value.forEach((element) {
        cidades.add(Cidade.fromJson(element));
      });
    });

    return cidades;
  }

  final String sqlInsert = 'insert into cidades (nome,codE) values (?,?)';

  void insert(Cidade cidade, int codE) async {
    await BancoDeDados.instance.db.rawInsert(sqlInsert, [cidade.nome, codE]);
  }

  final String sqlUpdate = 'update cidades set nome = ? where codC = ?';

  void update(Cidade cidade) async {
    await BancoDeDados.instance.db
        .rawUpdate(sqlUpdate, [cidade.nome, cidade.codC]);
  }

  final String sqlDelete = 'delete from cidades where codC = ?';

  void delete(Cidade cidade) async {
    await BancoDeDados.instance.db.rawDelete(sqlDelete, [cidade.codC]);
  }
}
