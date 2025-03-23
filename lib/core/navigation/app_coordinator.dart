import 'package:flutter/material.dart';
import '../../features/home/view/home_screen.dart';

/// El coordinador principal de la aplicación.
/// Su única responsabilidad por ahora es mostrar la pantalla inicial de la app.
class AppCoordinator extends StatelessWidget {
  const AppCoordinator({super.key});

  @override
  Widget build(BuildContext context) {
    // En este punto podríamos tener lógica para decidir qué pantalla mostrar.
    // Por ahora, simplemente mostramos la pantalla principal (Home).
    return const HomeScreen();
  }
}