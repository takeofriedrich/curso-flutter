import 'package:aula5/telas/tela_secundaria.dart';
import 'package:flutter/material.dart';

import 'telas/tela_inicial.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: TelaSecundaria(),
    );
  }
}
