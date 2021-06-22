import 'package:flutter/material.dart';

class TelaSecundaria extends StatelessWidget {
  TextEditingController caixaTexto = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Secundaria"),
        centerTitle: true,
        leading: Container(),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: caixaTexto,
            ),
            ElevatedButton(
              child: Text('Retornar'),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
