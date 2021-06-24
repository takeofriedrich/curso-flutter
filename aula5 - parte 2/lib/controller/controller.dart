import 'package:aula5/models/cor_app.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Controller {
  CoresApp _cor = CoresApp.Azul;
  Future<void> proximaCor() async {
    if (_cor == CoresApp.Laranja) {
      _cor = CoresApp.Azul;
    } else {
      _cor = CoresApp.values[_cor.index + 1];
    }
    return await salvaCorShared();
  }

  Future<void> salvaCorShared() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt('cor', _cor.index);
  }

  Future<void> buscaCor() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (!sharedPreferences.containsKey('cor')) {
      sharedPreferences.setInt('cor', 0);
    } else {
      int? valor = sharedPreferences.getInt('cor');
      if (valor != null) {
        _cor = CoresApp.values[valor];
      } else {
        _cor = CoresApp.values[0];
      }
    }
  }

  Color get cor {
    switch (_cor) {
      case CoresApp.Azul:
        return Colors.blue;
      case CoresApp.Preto:
        return Colors.black;
      case CoresApp.Verde:
        return Colors.green;
      case CoresApp.Vermelho:
        return Colors.red;
      case CoresApp.Roxo:
        return Colors.purple;
      case CoresApp.Amarelo:
        return Colors.yellow;
      case CoresApp.Laranja:
        return Colors.orange;
    }
  }
}
