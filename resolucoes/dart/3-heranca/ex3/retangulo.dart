import '../ex1/quadrado.dart';

class Retangulo extends Quadrado {
  int calcularArea() {
    return (super.calcularArea() / 2) as int;
  }
}
