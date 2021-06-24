import 'package:aula5/controller/controller.dart';
import 'package:flutter/material.dart';

class TelaSecundaria extends StatefulWidget {
  @override
  _TelaSecundariaState createState() => _TelaSecundariaState();
}

class _TelaSecundariaState extends State<TelaSecundaria> {
  Controller controller = Controller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferences"),
        centerTitle: true,
        backgroundColor: controller.cor,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: controller.cor,
          ),
          onPressed: () {
            setState(() {
              controller.proximaCor();
            });
          },
          child: Text('Trocar'),
        ),
      ),
    );
  }
}
