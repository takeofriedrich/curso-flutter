import 'package:flutter/material.dart';
import 'package:lista_contatos/controllers/tela_inicial_controller.dart';
import 'package:lista_contatos/models/contato.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  TelaInicialController telaInicialController = TelaInicialController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Contatos'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text('Digite o nome:'),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  controller: telaInicialController.caixaNome,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text('Digite o telefone:'),
                  ],
                ),
              ),
              Container(
                child: TextField(
                  controller: telaInicialController.caixaTelefone,
                  keyboardType: TextInputType.phone,
                ),
                margin: EdgeInsets.all(10),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    telaInicialController.adicionarContato();
                  });
                },
                child: Text('Salvar'),
              ),
            ],
          ),
          Divider(
            thickness: 2,
            color: Colors.black,
          ),
          Flexible(child: _lista()),
        ],
      ),
    );
  }

  _lista() {
    return ListView.builder(
      itemBuilder: (c, i) {
        Contato contato = telaInicialController.contatos[i];
        return ListTile(
          title: Text(contato.nome),
          subtitle: Text(contato.telefone),
          leading: IconButton(
            onPressed: () {
              setState(() {
                telaInicialController.removerContato(i);
              });
            },
            icon: Icon(Icons.clear),
          ),
        );
      },
      itemCount: telaInicialController.contatos.length,
    );
  }
}
