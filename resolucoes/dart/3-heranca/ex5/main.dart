import '../ex4/animal.dart';
import '../ex4/cao.dart';
import '../ex4/gato.dart';

main(List<String> args) {
  List<Animal> animais = [
    Gato(),
    Cao(),
  ];
  animais.forEach((element) {
    element.emitirSom();
  });
}
