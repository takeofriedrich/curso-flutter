import 'package:aula_bd/banco_de_dados.dart';
import 'package:aula_bd/pessoa.dart';

class PessoasRepository {
  Future<List<Pessoa>> selectAll() async {
    List<Pessoa> pessoas = [];
    await BancoDeDados().db!.rawQuery('select * from pessoas').then((value) {
      value.forEach((element) {
        pessoas.add(Pessoa.fromMap(element));
      });
    });
    return pessoas;
  }

  Future<void> insert(Pessoa pessoa) async {
    await BancoDeDados()
        .db!
        .rawInsert('insert into pessoas (nome) values (?);', [pessoa.nome]);
    return;
  }

  Future<void> update(Pessoa pessoa) async {
    await BancoDeDados().db!.rawUpdate(
        'update pessoas set nome = ? where id = ?', [pessoa.nome, pessoa.id]);
    return;
  }

  Future<void> delete(Pessoa pessoa) async {
    await BancoDeDados()
        .db!
        .rawDelete('delete from pessoas where id = ?;', [pessoa.id]);
    return;
  }
}
