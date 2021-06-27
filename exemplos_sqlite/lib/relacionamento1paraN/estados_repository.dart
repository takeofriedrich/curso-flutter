import 'package:aula_bd/relacionamento1paraN/banco_de_dados.dart';
import 'package:aula_bd/relacionamento1paraN/cidades_repository.dart';

import 'estado.dart';

class EstadosRepository {
  CidadesRepository cidadesRepository = CidadesRepository();

  final String sqlSelect = 'select * from estados';

  Future<List<Estado>> selectAll() async {
    List<Estado> estados = [];
    await BancoDeDados.instance.db.rawQuery(sqlSelect).then((value) async {
      for (int i = 0; i < value.length; i++) {
        int codE = value[i]['codE'];
        Estado e = Estado.fromJson(value[i]);
        e.cidades = await cidadesRepository.selectCidadesEstado(codE);
        estados.add(e);
      }
    });
    return estados;
  }

  final String sqlInsert = 'insert into estados (nome) values (?);';

  void insert(Estado estado) async {
    await BancoDeDados.instance.db.rawInsert(
        sqlInsert, [estado.nome]).whenComplete(() => print('salvo!'));
  }

  final String sqlUpdate = 'update estados set nome = ? where codE = ?';

  void update(Estado estado) async {
    await BancoDeDados.instance.db
        .rawUpdate(sqlUpdate, [estado.nome, estado.codE]);
  }

  final String sqlDelete = 'delete from estados where codE = ?';

  void delete(Estado estado) async {
    for (int i = 0; i < estado.cidades.length; i++) {
      cidadesRepository.delete(estado.cidades[i]);
    }
    await BancoDeDados.instance.db.rawDelete(sqlDelete, [estado.codE]);
  }
}
