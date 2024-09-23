import 'package:flutter/material.dart';

class FavoritosManager extends ChangeNotifier {
  List<String> _favoritos = [];

  List<String> get favoritos => _favoritos;

  void adicionarFavorito(String item) {
    if (!_favoritos.contains(item)) {
      _favoritos.add(item);
      notifyListeners();
    }
  }

  void removerFavorito(String item) {
    if (_favoritos.contains(item)) {
      _favoritos.remove(item);
      notifyListeners();
    }
  }

  bool isFavorito(String item) => _favoritos.contains(item);
}
