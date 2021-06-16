import 'aceleravel.dart';

class Carro with Aceleravel {
  int distancia = 0;

  @override
  acelerar() {
    distancia += 10;
  }
}
