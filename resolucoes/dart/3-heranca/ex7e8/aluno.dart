class Aluno {
  String nome = "";
  int idade = 0;
  List<double> notas = [];

  Aluno({required this.nome, required this.idade, required this.notas});

  double calcularMedia() {
    double media = 0;
    for (double nota in notas) {
      media += nota;
    }
    return media / notas.length;
  }

  @override
  String toString() {
    return '$nome - $idade anos - MF: ${calcularMedia().toStringAsPrecision(2)}';
  }
}
