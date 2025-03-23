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
  final void Function() onStartGame;

  HomeViewModel({required this.onStartGame});

  @override // Necesario dado que no estamos implementando sino extendiendo
  void startGame() {
    debugPrint("Inicio de partida");
    onStartGame(); // 👈 delegamos la navegación
  }
}