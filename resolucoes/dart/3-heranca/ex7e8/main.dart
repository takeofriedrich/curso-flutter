import 'dart:math';

import 'aluno.dart';
import 'turma.dart';

main(List<String> args) {
  Turma turma = Turma();

  turma.adicionarAlunos(
      Aluno(nome: 'Joao', idade: 19, notas: gerarNotasAleatorias(5)));
  turma.adicionarAlunos(
      Aluno(nome: 'Julia', idade: 19, notas: gerarNotasAleatorias(5)));
  turma.adicionarAlunos(
      Aluno(nome: 'Leticia', idade: 19, notas: gerarNotasAleatorias(5)));
  turma.adicionarAlunos(
      Aluno(nome: 'Maria', idade: 19, notas: gerarNotasAleatorias(5)));
  turma.adicionarAlunos(
      Aluno(nome: 'Matheus', idade: 19, notas: gerarNotasAleatorias(5)));
  turma.adicionarAlunos(
      Aluno(nome: 'Marcos', idade: 19, notas: gerarNotasAleatorias(5)));

  List<Aluno> aprovados = turma.filtrarAprovados();
  aprovados.sort((aluno1, aluno2) => aluno1.nome.compareTo(aluno2.nome));

  aprovados.forEach((element) {
    print(element);
  });

  print('---------------------------------------');

  aprovados.sort((aluno1, aluno2) =>
      aluno1.calcularMedia().compareTo(aluno2.calcularMedia()));

  aprovados.forEach((element) {
    print(element);
  });
}

double gerarNotaAleatoria() {
  // Retorna uma nota aleatoria entre 5 e 10.
  Random random = Random();
  return 5 + random.nextDouble() * 5;
}

List<double> gerarNotasAleatorias(int n) {
  List<double> notas = [];
  for (int i = 0; i < n; i++) {
    notas.add(gerarNotaAleatoria());
  }
  return notas;
}
