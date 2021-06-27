class Cidade {
  int? codC;
  String? nome;

  Cidade();

  Cidade.fromJson(Map<String, dynamic> json) {
    this.codC = json['codC'];
    this.nome = json['nome'];
  }

  @override
  String toString() {
    return '$codC - $nome';
  }
}
