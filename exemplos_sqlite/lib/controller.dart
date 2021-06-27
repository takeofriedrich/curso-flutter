import 'package:aula_bd/pessoa.dart';
import 'package:aula_bd/pessoas_repository.dart';
import 'package:flutter/cupertino.dart';

class Controller {
  List<Pessoa> pessoas = [];

  PessoasRepository repository = PessoasRepository();

  TextEditingController nomeController = TextEditingController();

  Future<void> buscarBanco() async {
    return await repository.selectAll().then((value) {
      pessoas = value;
    });
  }

  Future<void> cadastrar() async {
    Pessoa pessoa = Pessoa(nomeController.text);
    return await repository.insert(pessoa).then((value) {
      nomeController.clear();
    });
  }

  Future<void> remover(int index) async {
    await repository.delete(pessoas[index]).whenComplete(() {
      pessoas.removeAt(index);
    });
  }
}
