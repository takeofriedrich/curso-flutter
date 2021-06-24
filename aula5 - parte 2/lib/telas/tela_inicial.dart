import 'dart:convert';
import 'dart:typed_data';

import 'package:aula5/telas/tela_secundaria.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  ImagePicker picker = ImagePicker();
  Image? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela 1'),
        centerTitle: true,
      ),
      body: Center(
        child: _image == null ? Text('Escolha uma foto') : _image,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final escolhida = await picker.getImage(source: ImageSource.camera);
          final bytes = await escolhida!.readAsBytes();
          String x = base64.encode(bytes);
          print(x);
          var bytes2 = base64.decode(x);
          setState(() {
            _image = Image.memory(bytes2);
          });
        },
        child: Icon(Icons.camera),
      ),
    );
  }
}
