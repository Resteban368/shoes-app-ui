import 'package:flutter/material.dart';

class ZapatoModel with ChangeNotifier {
  String _assetImage = 'assets/azul.png';
  double _talla = 9.0;

  String get assetImage => this._assetImage;
  double get talla => this._talla;

  set assetImage(String valor) {
    this._assetImage = valor;
    notifyListeners();
  }

  set talla(double valor) {
    this._talla = valor;
    notifyListeners();
  }
}
