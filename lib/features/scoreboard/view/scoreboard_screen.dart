import 'package:catan_catan/features/setup/model/game_settings.dart';
import 'package:flutter/material.dart';

class ScoreboardScreen extends StatelessWidget {
  // PARAMETROS
  final GameSettings settings;
  // INIT
  const ScoreboardScreen({required this.settings, super.key});

  // IMPLEMENTACION
  @override
  Widget build(BuildContext context) {
    // Obtenemos el "navigator" antes de cualquier await
    final navigator = Navigator.of(context, rootNavigator: true);
    return PopScope(
      canPop: false, // esto es para poder interceptar el popeo, si es true, se hace automaticamente.
      // ignore: deprecated_member_use ~ TODO: Fix later
      onPopInvoked: (didPop) async {
        if (!didPop) {
          // Mostramos el diálogo con 'showDialog', usando context
          final confirmed = await showDialog<bool>( // esto espera el valor que retorne el alert dialog
            context: context,
            useRootNavigator: true,
            builder: (dialogContext) {
              return AlertDialog(
                title: const Text('¿Finalizar partida?'),
                content: const Text('Se perderán los datos de la partida en curso.'),
                actions: [
                  TextButton(
                    // Acá ya no usamos `Navigator.of(dialogContext)` ni `context`
                    // Usamos la referencia 'navigator' que guardamos arriba
                    onPressed: () => navigator.pop(false), // este pop es para el alert dialog, y el false es para el confirmed. linea 16.
                    child: const Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () => navigator.pop(true), // este pop es para el alert dialog, y el true es para el confirmed. linea 16.
                    child: const Text('Finalizar'),
                  ),
                ],
              );
            },
          );

          // Y ahora sí, tras el await, usamos 'navigator', no 'context'
          if (confirmed == true) {
            navigator.pop(); // volver al Home
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Marcador'),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: settings.playerColors.length,
          itemBuilder: (_, index) {
            final color = settings.playerColors[index];
            return ListTile(
              leading: CircleAvatar(backgroundColor: color.color),
              title: Text(color.label),
              subtitle: const Text('Puntos: 2'),
            );
          },
        ),
      ),
    );
  }
}