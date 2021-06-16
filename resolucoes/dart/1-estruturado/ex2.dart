int operacoes({required int a, required int b, required int op}) {
  switch (op) {
    case 1:
      return a + b;
    case 2:
      return a - b;
    case 3:
      return a * b;
    default:
      return a % b;
  }
}

main(List<String> args) {
  print(
    operacoes(
      a: 3,
      b: 4,
      op: 3,
    ),
  );
}
