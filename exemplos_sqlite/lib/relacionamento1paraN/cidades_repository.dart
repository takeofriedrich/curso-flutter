import 'package:aula_bd/relacionamento1paraN/banco_de_dados.dart';

import 'cidade.dart';

class CidadesRepository {
  final String sqlSelect = 'select * from cidades where codE = ?';

  Future<List<Cidade>> selectCidadesEstado(int? codE) async {
    List<Cidade> cidades = [];

    await BancoDeDados().db!.rawQuery(sqlSelect, [codE]).then((value) {
      value.forEach((element) {
        cidades.add(Cidade.fromJson(element));
      });
    });

    return cidades;
  }

  final String sqlInsert = 'insert into cidades (nome,codE) values (?,?)';

  Future<void> insert(Cidade cidade, int codE) async {
    await BancoDeDados().db!.rawInsert(sqlInsert, [cidade.nome, codE]);
    return;
  }

  final String sqlUpdate = 'update cidades set nome = ? where codC = ?';

  Future<void> update(Cidade cidade) async {
    await BancoDeDados().db!.rawUpdate(sqlUpdate, [cidade.nome, cidade.codC]);
    return;
  }

  final String sqlDelete = 'delete from cidades where codC = ?';

  Future<void> delete(Cidade cidade) async {
    await BancoDeDados().db!.rawDelete(sqlDelete, [cidade.codC]);
    return;
  }
}
