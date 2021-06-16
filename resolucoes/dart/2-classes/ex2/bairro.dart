import 'regiao.dart';

class Bairro {
  String nome = "";
  Regiao regiao = Regiao.Norte;

  Bairro({required this.nome, required this.regiao});

  @override
  String toString() {
    // Método replace da classe String, substitui todos as ocorrencias do
    // parametro da esquerda pelo parametro da direita
    // Logo, como o toString() do enum retorna o nome do enum e um ponto
    // Utilizando o replace() podemos tirar e deixar apenas o valor
    return '$nome - Região: ${regiao.toString().replaceAll('Regiao.', '')}';
  }
}
