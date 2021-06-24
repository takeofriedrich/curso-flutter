import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class TelaSensores extends StatefulWidget {
  const TelaSensores({Key? key}) : super(key: key);

  @override
  _TelaSensoresState createState() => _TelaSensoresState();
}

class _TelaSensoresState extends State<TelaSensores> {
  AccelerometerEvent? acelerometro;
  GyroscopeEvent? giroscopio;
  List<StreamSubscription?> inscricoes = [];

  @override
  void initState() {
    super.initState();
    inscricoes.add(accelerometerEvents.listen(_escutar));
    inscricoes.add(gyroscopeEvents.listen((event) {
      setState(() {
        giroscopio = event;
      });
    }));
  }

  _escutar(AccelerometerEvent event) {
    setState(() {
      acelerometro = event;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sensores'),
      ),
      body: Center(
        child: acelerometro != null && giroscopio != null
            ? Text(
                '''
Acelerometro:
x = ${acelerometro!.x},
y = ${acelerometro!.y}
z = ${acelerometro!.z}

Giroscopio:
x = ${giroscopio!.x},
y = ${giroscopio!.y}
z = ${giroscopio!.z}
        ''',
                style: TextStyle(fontSize: 20),
              )
            : Text('Aguarde'),
      ),
    );
  }

  @override
  void dispose() {
    for (int i = 0; i < inscricoes.length; i++) {
      inscricoes[i]!.cancel();
    }
    super.dispose();
  }
}
