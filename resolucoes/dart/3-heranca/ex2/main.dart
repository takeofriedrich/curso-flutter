import '../ex1/quadrado.dart';

main(List<String> args) {
  Quadrado q = Quadrado();
  q.lado = 3;
  print(q.calcularArea());
  print(q.calcularPerimetro());
}
