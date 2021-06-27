import 'package:aula_bd/banco_de_dados.dart';
import 'package:aula_bd/pessoa.dart';

class PessoasRepository {
  Future<List<Pessoa>> selectAll() async {
    List<Pessoa> pessoas = [];
    await BancoDeDados.instance.db
        .rawQuery('select * from pessoas')
        .then((value) {
      value.forEach((element) {
        pessoas.add(Pessoa.fromMap(element));
      });
    });
    return pessoas;
  }

  Future<void> insert(Pessoa pessoa) async {
    return await BancoDeDados.instance.db
        .rawInsert('insert into pessoas (nome) values (?);', [pessoa.nome]);
  }

  Future<void> update(Pessoa pessoa) async {
    return await BancoDeDados.instance.db.rawUpdate(
        'update pessoas set nome = ? where id = ?', [pessoa.nome, pessoa.id]);
  }

  Future<void> delete(Pessoa pessoa) async {
    return await BancoDeDados.instance.db
        .rawDelete('delete from pessoas where id = ?;', [pessoa.id]);
  }
}
