import 'package:aula5/telas/tela_secundaria.dart';
import 'package:flutter/material.dart';

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  String palavra = '';
  TelaSecundaria x = TelaSecundaria();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela 1'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(palavra),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext c) {
            return x;
          }));
        },
        child: Icon(Icons.arrow_right_alt),
      ),
    );
  }
}
