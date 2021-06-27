import 'cidade.dart';

class Estado {
  int codE;
  String nome;
  List<Cidade> cidades = [];

  Estado();

  Estado.fromJson(Map<String, dynamic> json) {
    this.codE = json['codE'];
    this.nome = json['nome'];
  }

  @override
  String toString() {
    return '$codE - $nome => ${printCidades()}';
  }

  printCidades() {
    String s = '';
    cidades.forEach((element) {
      s += element.toString() + ", ";
    });
    return s;
  }
}
