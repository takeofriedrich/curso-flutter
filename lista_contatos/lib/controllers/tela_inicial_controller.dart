import 'package:flutter/cupertino.dart';
import 'package:lista_contatos/models/contato.dart';

class TelaInicialController {
  TextEditingController caixaNome = TextEditingController();
  TextEditingController caixaTelefone = TextEditingController();

  List<Contato> _contatos = [
    Contato(nome: 'Vinicius', telefone: '111111'),
    Contato(nome: 'Luciano', telefone: '22222'),
    Contato(nome: 'Matias', telefone: '33333'),
  ];

  List<Contato> get contatos => _contatos;

  void adicionarContato() {
    Contato contato = Contato();
    contato.nome = caixaNome.text;
    contato.telefone = caixaTelefone.text;
    _contatos.add(contato);
    caixaNome.clear();
    caixaTelefone.clear();
  }

  void removerContato(int posicao) {
    _contatos.removeAt(posicao);
  }
}
