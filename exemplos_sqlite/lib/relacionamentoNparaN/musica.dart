import 'package:aula_bd/relacionamentoNparaN/artista.dart';

class Musica {
  int? codM;
  String? nome;
  List<Artista?> artistas = [];

  Musica();

  Musica.fromJson(Map<String, dynamic> json) {
    this.codM = json['codM'];
    this.nome = json['nome'];
  }

  @override
  String toString() {
    return '$codM - $nome - Artistas: $artistas';
  }
}
