import 'package:flutter/foundation.dart';

class FavoritosProvider with ChangeNotifier {
  final Set<String> _favoritos = Set<String>();

  List<String> get favoritosItems => _favoritos.toList();

  bool isFavorito(String item) => _favoritos.contains(item);

  void toggleFavorito(String item) {
    if (_favoritos.contains(item)) {
      _favoritos.remove(item);
    } else {
      _favoritos.add(item);
    }
    notifyListeners();  
  }
}
