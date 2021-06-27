import 'package:flutter/material.dart';

import 'banco_de_dados.dart';
import 'controller.dart';

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  Controller controller = Controller();
  bool loading = true;

  @override
  void initState() {
    super.initState();
    BancoDeDados().openDb().whenComplete(carregar);
  }

  Future<void> carregar() async {
    return await controller.buscarBanco().whenComplete(() {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pessoas'),
        centerTitle: true,
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _divideTelaEmDuas(),
    );
  }

  _cadastrarPessoa() async {
    await controller.cadastrar();
    await carregar();
  }

  _removerPessoa(int index) {
    controller.remover(index).whenComplete(() {
      setState(() {});
    });
  }

  _divideTelaEmDuas() {
    return Column(
      children: [
        _label(),
        _caixa(),
        _botao(),
        _divisor(),
        _lista(),
      ],
    );
  }

  _lista() {
    return controller.pessoas.isEmpty
        ? Expanded(
            flex: 7,
            child: Center(
              child: Text('Não há pessoas na lista'),
            ),
          )
        : Flexible(
            flex: 7,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return _pessoasWidget(index);
              },
              itemCount: controller.pessoas.length,
            ),
          );
  }

  _pessoasWidget(int index) {
    return ListTile(
      title: Text(controller.pessoas[index].nome!),
      trailing: IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          _removerPessoa(index);
        },
      ),
    );
  }

  _divisor() {
    return Divider(
      thickness: 2,
      height: 1,
    );
  }

  _botao() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: ElevatedButton(
        onPressed: _cadastrarPessoa,
        child: Text('Salvar'),
      ),
    );
  }

  _caixa() {
    return Expanded(
      child: Container(
        child: TextField(
          controller: controller.nomeController,
        ),
        margin: EdgeInsets.symmetric(horizontal: 20),
      ),
    );
  }

  _label() {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 20),
      child: Row(
        children: [
          Text('Digite o nome:'),
        ],
      ),
    );
  }
}
