import 'package:flutter/material.dart';

import '../../setup/model/game_settings.dart';

// Interfaz que extiende de change notifier para poder ser usado en PROVIDER.
abstract class IHomeViewModel extends ChangeNotifier {
  void startGame(GameSettings settings);
}

/// ViewModel de la pantalla Home.
/// En MVVM, el ViewModel se encarga de manejar la lógica de la vista:
/// - Estado
/// - Interacciones del usuario
/// - Comunicación con coordinadores o servicios
///
/// En este caso, aún no tenemos estado, pero ya dejamos lista la estructura.

class HomeViewModel extends IHomeViewModel {
  final void Function(GameSettings settings) onStartGame;
  HomeViewModel({required this.onStartGame});

  @override
  void startGame(GameSettings settings) {
    onStartGame(settings);
  }
}