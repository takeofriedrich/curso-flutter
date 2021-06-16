import 'package:flutter/material.dart';

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  int x = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('iniciou a tela');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela 1'),
        centerTitle: true,
        leading: IconButton(
          onPressed: _funcaoBotao,
          icon: Icon(
            Icons.add,
          ),
        ),
        actions: [
          Icon(Icons.add),
          Icon(Icons.arrow_back),
        ],
      ),
      body: Container(
        child: Text(
          '$x',
          maxLines: 10,
          style: TextStyle(
            fontSize: 30,
            color: Colors.purple,
          ),
        ),
        margin: EdgeInsets.only(top: 20, left: 50),
      ),
    );
  }

  _funcaoBotao() {
    setState(() {
      x++;
    });
  }

  _incrementaRedesenhando() {
    setState(() {
      x++;
    });
  }
}
