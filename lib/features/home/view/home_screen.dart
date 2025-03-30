import 'package:catan_catan/features/home/viewmodel/home_view_model.dart';
import 'package:catan_catan/features/scoreboard/coordinator/scoreboard_coordinator.dart';
import 'package:catan_catan/features/setup/view/game_setup_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../setup/viewmodel/game_setup_view_model.dart';

/// HomeScreen es la pantalla inicial de la app.
/// Por ahora, solo muestra un botón centrado para iniciar la partida.

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => GameSetupViewModel(),
        child: const _HomeScreenContent());
  }
}

class _HomeScreenContent extends StatelessWidget {
  const _HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GameSetupViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catan, Catan!'),
      ),
      body: Padding(padding: const EdgeInsets.all(16),
        child: Column( crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Accede a su VM por medio del contexto. Este ya se creo en el build de la clase HomeScreen.
            const GameSetupView(),
            const SizedBox(height: 24),
            Center(
              // ElevatedButton es un botón con estilo "elevado" (sombra, relleno)
            child: ElevatedButton(
                  onPressed: () {
                    final settings = viewModel.buildSettings();
                    if (settings == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Elegi un color por jugador.'),)
                      );
                      return;
                    }
                    // Llamamos al VM para que haga lo que sea que tenga que hacer durante start game.
                    context.read<IHomeViewModel>().startGame(settings);
                  }, child: const Text('Iniciar partida')),
            ),
            const Spacer(),
            const Padding(padding: EdgeInsets.only(bottom: 8),
              child: Text('by Lautaro Galan Cid @kautaron\nTodos los derechos reservados,\ny los izquierdos en el baúl del Falcon 🚗',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 12, color: Colors.grey)),
            )
          ],
        ),
      )
    );
  }
}
