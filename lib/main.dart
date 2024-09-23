import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './widgets/menu_telinha.dart';
import './Screen/lista_etica_page.dart';
import './Screen/lista_favoritos_page.dart';
import './BackGroundColor/gradient_background.dart';
import './widgets/favoritos_manager.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoritosManager()),  // Provê o FavoritosManager
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
      title: 'Projeto Menu Telinha',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),  // Mantém o HomeScreen como a página inicial
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página Inicial'),
        backgroundColor: Color.fromRGBO(138, 167, 236, 100),
      ),
      drawer: const MenuTelinha(),  // Mantém o menu lateral
      body: GradientBackground(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Card para a página de Lista
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
                    padding: EdgeInsets.all(16.0),
                    width: 200,
                    height: 100,
                    child: const Center(
                      child: Text(
                        'Lista',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Card para a página de Favoritos
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
                    padding: EdgeInsets.all(16.0),
                    width: 200,
                    height: 100,
                    child: const Center(
                      child: Text(
                        'Favoritos',
                        style: TextStyle(fontSize: 24),
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
