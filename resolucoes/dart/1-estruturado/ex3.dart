void traduz(Map<String, String> palavras, bool traduzir) {
  if (traduzir) {
    palavras.forEach((key, value) {
      print(key);
    });
  } else {
    palavras.forEach((key, value) {
      print(value);
    });
  }
}

main(List<String> args) {
  Map<String, String> frutas = {
    'Banana': 'Banana',
    'Strawberry': 'Morango',
    'Orange': 'Laranja',
    'Watermelon': 'Melancia'
  };
  print('Original:');
  traduz(frutas, false);
  print('\nTraduzido:');
  traduz(frutas, true);
}
