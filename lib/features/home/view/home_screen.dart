import 'package:catan_catan/features/home/viewmodel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// HomeScreen es la pantalla inicial de la app.
/// Por ahora, solo muestra un botón centrado para iniciar la partida.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar es la barra superior con un título
      appBar: AppBar(
        title: const Text('Catan, Catan!'),
      ),

      // El contenido principal de la pantalla va en el body
      body: Center(
        // ElevatedButton es un botón con estilo "elevado" (sombra, relleno)
        child: ElevatedButton(
          onPressed: () {
            // Esta acción la vamos a reemplazar después con navegación real
            debugPrint('HOME VIEW: onPressed');
            context.read<IHomeViewModel>().startGame(); // Leemos del contexto en busqueda de un vm y llamamos al método startGame.
          },
          child: const Text('Iniciar partida'),
        ),
      ),
    );
  }
}