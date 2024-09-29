import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './widgets/menu_telinha.dart';
import './Screen/lista_etica_page.dart';
import './Screen/lista_favoritos_page.dart';
import './BackGroundColor/gradient_background.dart';
import './widgets/favoritos_manager.dart';
import './Screen/login_page.dart';  

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoritosManager()),  
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto Menu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AuthCheck(),  
    );
  }
}

// Classe para decidir qual página exibir
class AuthCheck extends StatelessWidget {
  const AuthCheck({super.key});

  @override
  Widget build(BuildContext context) {
    bool isAuthenticated = false;  

    if (isAuthenticated) {
      return const HomeScreen();  // Redireciona para a HomeScreen se autenticado
    } else {
      return const LoginPage();  // Redireciona para a LoginPage se não autenticado
    }
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página Inicial'),
        backgroundColor: Color(0xFF002894),
      ),
      drawer: const MenuTelinha(),  
      body: GradientBackground(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListaEticaPage()),
                  );
                },
                child: Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    width: 200,
                    height: 100,
                    child: const Center(
                      child: Icon(
                        Icons.list,
                        size: 50,  
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListaFavoritosPage()),
                  );
                },
                child: Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    width: 200,
                    height: 100,
                    child: const Center(
                      child: Icon(
                        Icons.favorite,
                        size: 50,  
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
