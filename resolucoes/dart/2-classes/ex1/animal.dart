class Animal {
  String _nome = "";
  int idade = 0;

  String get nome => _nome;
  set nome(nome) => _nome = nome;

  Animal({required this.idade});

  @override
  String toString() {
    return 'Nome: $nome - $idade anos';
  }
}
