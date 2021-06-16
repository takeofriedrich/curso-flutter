import 'aluno.dart';

class Turma {
  List<Aluno> _alunos = [];
  void adicionarAlunos(Aluno aluno) {
    _alunos.add(aluno);
  }

  List<Aluno> filtrarAprovados() {
    List<Aluno> aprovados = [];
    for (Aluno aluno in _alunos) {
      if (aluno.calcularMedia() >= 7) aprovados.add(aluno);
    }
    return aprovados;
  }
}
