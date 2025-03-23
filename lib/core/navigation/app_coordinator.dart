import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../features/home/view/home_screen.dart';
import '../../features/home/viewmodel/home_view_model.dart';

/// Coordinador principal de la app
class AppCoordinator extends StatelessWidget {
  const AppCoordinator({super.key});

  @override
  Widget build(BuildContext context) {
    // Inyectamos el HomeViewModel usando Provider
    // ChangeNotifierProvider es como un ObservableObject en Combine, es un widget.
    return ChangeNotifierProvider<IHomeViewModel>(
      // Esto es un bloque, el _ es elcontext, estamos creando e inyectando una instancia de homeviewmodel y poniendola a disposicion a trves del buildcontext, escucha cambios y redibuja.
      create: (_) => HomeViewModel(),
      child: const HomeScreen(),
      // El child va a poder acceder al home view model. Al usar provider, estamos usando un paquete preparado para MVVM.
    );
  }
}