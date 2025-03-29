import 'package:catan_catan/features/scoreboard/coordinator/scoreboard_coordinator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../features/home/view/home_screen.dart';
import '../../features/home/viewmodel/home_view_model.dart';

/// Coordinador principal de la app
class AppCoordinator extends StatelessWidget {
  const AppCoordinator({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<IHomeViewModel>(
      create: (_) => HomeViewModel(
        // Este settings es un placeholder para quien llame al metodo este mas adelante, solo pasamos el metodo.
      onStartGame: (settings) {
        final coordinator = ScoreboardCoordinator(settings: settings);
        Navigator.of(context).push(
          // Es una suerte de NavigationLink o pushViewController, le estamos pasando esta funcion privada por parametro
          MaterialPageRoute(builder: (_) => coordinator.build()),
        );
      }
      ),
    child: const HomeScreen()
    );
  }
}