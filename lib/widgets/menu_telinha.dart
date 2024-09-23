import 'package:flutter/material.dart';
import '../Screen/lista_etica_page.dart';  // Certifique-se de que o caminho está correto
import '../Screen/lista_favoritos_page.dart';  // Certifique-se de que o caminho está correto
import '../main.dart';

class MenuTelinha extends StatelessWidget {
  const MenuTelinha({super.key});

  @override
  Widget build(BuildContext context) {
    // Inicialmente, lista vazia de favoritos
    

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(138, 167, 236, 1),
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Página Inicial'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
                );  
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('Lista'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListaEticaPage()),  // Navega para ListaEticaPage
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favoritos'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListaFavoritosPage(),  // Passando a lista de favoritos (vazia neste caso)
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
