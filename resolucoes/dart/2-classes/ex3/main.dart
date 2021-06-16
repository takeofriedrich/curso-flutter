import '../ex2/bairro.dart';
import '../ex2/regiao.dart';
import 'cidade.dart';

main(List<String> args) {
  Cidade cidade = Cidade();
  cidade.nome = "Joinville";

  Bairro b1 = Bairro(nome: "Floresta", regiao: Regiao.Sul);
  Bairro b2 = Bairro(nome: "America", regiao: Regiao.Norte);
  Bairro b3 = Bairro(nome: "Aventureiro", regiao: Regiao.Leste);
  Bairro b4 = Bairro(nome: "Jardim Iririu", regiao: Regiao.Leste);
  Bairro b5 = Bairro(nome: "Saguaçu", regiao: Regiao.Norte);
  Bairro b6 = Bairro(nome: "Vila Nova", regiao: Regiao.Leste);

  cidade.bairros.add(b1);
  cidade.bairros.add(b2);
  cidade.bairros.add(b3);
  cidade.bairros.add(b4);
  cidade.bairros.add(b5);
  cidade.bairros.add(b6);

  print(cidade.filtrar(Regiao.Leste));
}
