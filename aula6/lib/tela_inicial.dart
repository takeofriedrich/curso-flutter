import 'package:aula6/tela_locallizacao.dart';
import 'package:aula6/tela_sensores.dart';
import 'package:flutter/material.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (c) {
                  return TelaSensores();
                }));
              },
              child: Text('Sensores'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (c) {
                return TelaLocalizacao();
              }));
            },
            child: Text('Localização'),
          ),
        ],
      ),
    );
  }
}
