import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../BackGroundColor/gradient_background.dart';
import './lista_favoritos_page.dart';
import '../widgets/favoritos_manager.dart';
import '../widgets/menu_telinha.dart';  // Certifique-se de que o menu está importado

class ListaEticaPage extends StatelessWidget {
  final List<String> eticaItems = [
    "Ética 1",
    "Ética 2",
    "Ética 3",
    "Ética 4",
  ];

  @override
  Widget build(BuildContext context) {
    final favoritosManager = Provider.of<FavoritosManager>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Ética'),
        backgroundColor: Color.fromRGBO(138, 167, 236, 1),
        leading: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);  // Volta para a página anterior
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
                  Scaffold.of(context).openDrawer();  // Abre o menu lateral
                },
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListaFavoritosPage(),
                ),
              );
            },
          ),
        ],
      ),
      drawer: MenuTelinha(),  // Adiciona o menu lateral (ícone de menu será mostrado automaticamente)
      body: GradientBackground(
        child: ListView.builder(
          itemCount: eticaItems.length,
          itemBuilder: (context, index) {
            final item = eticaItems[index];
            final bool isFavorito = favoritosManager.isFavorito(item);

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: Colors.blueAccent, width: 1),
                ),
                elevation: 3,
                child: ListTile(
                  leading: Icon(Icons.check_circle_outline, color: Colors.green),
                  title: Text(
                    item,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      isFavorito ? Icons.favorite : Icons.favorite_border,
                      color: isFavorito ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      if (isFavorito) {
                        favoritosManager.removerFavorito(item);
                      } else {
                        favoritosManager.adicionarFavorito(item);
                      }
                    },
                  ),
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
          icon: Icon(Icons.arrow_back),  // Ícone de seta para voltar
          onPressed: () {
            Navigator.pop(context);  // Volta para a página anterior
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
