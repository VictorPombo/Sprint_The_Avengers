import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../BackGroundColor/gradient_background.dart';
import '../widgets/favoritos_manager.dart';
import '../widgets/menu_telinha.dart'; 

class ListaFavoritosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoritosManager = Provider.of<FavoritosManager>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Favoritos'),
        backgroundColor: Color.fromRGBO(138, 167, 236, 1),
        leading: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context); // Volta para a página anterior
              },
            ),
          ],
        ),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Abre o menu lateral
                },
              );
            },
          ),
        ],
      ),
      drawer: MenuTelinha(), // Adiciona o menu lateral
      body: GradientBackground(
        child: favoritosManager.favoritos.isEmpty
            ? Center(
                child: Text(
                  'Nenhum item favoritado ainda.',
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
              )
            : ListView.builder(
                itemCount: favoritosManager.favoritos.length,
                itemBuilder: (context, index) {
                  final item = favoritosManager.favoritos[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(color: Colors.blueAccent, width: 1),
                      ),
                      elevation: 3,
                      child: ListTile(
                        leading: Icon(Icons.favorite, color: Colors.red),
                        title: Text(
                          item,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueAccent),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetalheEticaPage(titulo: item),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

class DetalheEticaPage extends StatelessWidget {
  final String titulo;

  DetalheEticaPage({required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
        backgroundColor: Color.fromRGBO(138, 167, 236, 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Ícone de seta para voltar
          onPressed: () {
            Navigator.pop(context); // Volta para a página anterior
          },
        ),
      ),
      body: GradientBackground(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Este é o texto de exemplo sobre $titulo. Aqui você pode colocar uma descrição detalhada sobre o item favoritado.',
            style: TextStyle(fontSize: 18, color: Colors.black87),
          ),
        ),
      ),
    );
  }
}
