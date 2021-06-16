import 'aceleravel.dart';

class Foguete with Aceleravel {
  int altura = 0;
  @override
  acelerar() {
    altura += 15;
  }
}
