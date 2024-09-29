import 'package:flutter/material.dart';
import 'package:projeto_menu/Screen/lista_etica_page.dart';
import '../Screen/lista_favoritos_page.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    
    final List<String> favoritos = []; 

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text('Usuário'),
            accountEmail: Text('email@exemplo.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Color(0xFF002894),
              child: Text('U'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Lista de Ética'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListaEticaPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Lista de Favoritos'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListaFavoritosPage(), // Passando a lista de favoritos
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
