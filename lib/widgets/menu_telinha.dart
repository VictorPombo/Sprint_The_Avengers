import 'package:flutter/material.dart';
import '../Screen/lista_etica_page.dart';
import '../Screen/lista_favoritos_page.dart';
import '../Screen/login_page.dart'; 
import '../main.dart'; // Certifique-se de importar a página Home

class MenuTelinha extends StatelessWidget {
  const MenuTelinha({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF8AA7EC),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
                SizedBox(height: 10),
                Text(
                  'Usuário',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()), // Direcione para a página Home
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Lista'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListaEticaPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favoritos'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListaFavoritosPage()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sair'),
            onTap: () {
              Navigator.of(context).pop();  
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginPage()), 
              );
            },
          ),
        ],
      ),
    );
  }
}
