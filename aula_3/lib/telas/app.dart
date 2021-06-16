import 'package:aula_3/telas/tela_inicial.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aula 3',
      home: TelaInicial(),
      debugShowCheckedModeBanner: false,
    );
  }
}
