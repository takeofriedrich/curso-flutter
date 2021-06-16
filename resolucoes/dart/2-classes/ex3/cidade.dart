import '../ex2/bairro.dart';
import '../ex2/regiao.dart';

class Cidade {
  String nome = "";
  List<Bairro> bairros = [];

  List<Bairro> filtrar(Regiao regiao) {
    List<Bairro> filtro = [];
    for (Bairro bairro in bairros) {
      if (bairro.regiao == regiao) filtro.add(bairro);
    }
    return filtro;
  }
}
