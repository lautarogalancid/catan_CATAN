import 'package:flutter/material.dart';

// Interfaz que extiende de change notifier para poder ser usado en PROVIDER.
abstract class IHomeViewModel extends ChangeNotifier {
  void startGame();
}

/// ViewModel de la pantalla Home.
/// En MVVM, el ViewModel se encarga de manejar la lógica de la vista:
/// - Estado
/// - Interacciones del usuario
/// - Comunicación con coordinadores o servicios
///
/// En este caso, aún no tenemos estado, pero ya dejamos lista la estructura.

class HomeViewModel extends IHomeViewModel {
  // Este método simula lo que haríamos cuando se toca el botón "Iniciar partida"
  // Más adelante podríamos notificar a un coordinador o cambiar el estado de la app.
  @override // Necesario solo porque necesitamos que
  void startGame() {
    debugPrint('HOME VIEWMODEL: (startGame)');
  }
}