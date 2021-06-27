class Pessoa {
  int id;
  String nome;

  Pessoa(this.nome);

  Pessoa.fromMap(Map<String, dynamic> json) {
    this.id = json['id'];
    this.nome = json['nome'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'nome': this.nome,
    };
  }

  @override
  String toString() {
    return '$id - $nome';
  }
}
