int exponenciacao({required int a, int b = 2}) {
  int exp = 1;
  for (int i = 0; i < b; i++) {
    exp = exp * a;
  }
  return exp;
}

main(List<String> args) {
  print(exponenciacao(
    a: 3,
    b: 3,
  ));
  print(exponenciacao(
    a: 3,
  ));
}
