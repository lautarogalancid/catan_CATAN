import 'package:flutter/material.dart';

/// ScoreboardScreen será la pantalla donde vemos los puntos de los jugadores.
/// Por ahora solo muestra un texto fijo.
class ScoreboardScreen extends StatelessWidget {
  const ScoreboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Partida en curso'),
      ),
      body: const Center(
        child: Text('Aquí irá el marcador de la partida 🧮'),
      ),
    );
  }
}