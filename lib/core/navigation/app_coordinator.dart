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
      onStartGame: (settings) {
        final coordinator = ScoreboardCoordinator(settings: settings);
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => coordinator.build()),
        );
      }
      ),
    child: const HomeScreen()
    );
  }
}