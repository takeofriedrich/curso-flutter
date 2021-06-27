import 'package:aula_bd/relacionamentoNparaN/musica.dart';

class Artista {
  int? codA;
  String? nome;
  List<Musica> musicas = [];

  Artista();

  Artista.fromJson(Map<String, dynamic> json) {
    this.codA = json['codA'];
    this.nome = json['nome'];
  }

  @override
  String toString() {
    return '$codA - $nome';
  }
}
