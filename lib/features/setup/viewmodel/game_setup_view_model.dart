import 'package:flutter/cupertino.dart';
import '../model/player_color.dart';
import '../model/game_settings.dart';

// ChangeNotifier es un tipo Publisher/Observable como ObservableObject, permite notificar listeners.
class GameSetupViewModel extends ChangeNotifier {
  int _numberOfPlayers = 2;
  final Set<PlayerColor> _selectedColors = {};

  // getters
  int get numberOfPlayers => _numberOfPlayers;
  Set<PlayerColor> get selectedColors => _selectedColors;

  List<PlayerColor> get allColors => PlayerColor.values;

  // Functions
  void incrementPlayers() {
    if (_numberOfPlayers < 6) {
      _numberOfPlayers++;
      _selectedColors.clear();
      notifyListeners();
    }
  }

  void decreasePlayers() {
    if (_numberOfPlayers > 2) {
      _numberOfPlayers--;
      _selectedColors.clear();
      notifyListeners();
    }
  }

  void toggleColor(PlayerColor color) {
    if (_selectedColors.contains(color)) {
      _selectedColors.remove(color);
    } else {
      if (_selectedColors.length < _numberOfPlayers) {
        _selectedColors.add(color);
      }
    }
    notifyListeners();
  }

  bool isColorSelected(PlayerColor color) {
    return _selectedColors.contains(color);
  }

  /// Indica si estamos en el límite de colores permitidos
  bool get colorSelectionList =>
      _selectedColors.length >= _numberOfPlayers;

  GameSettings? buildSettings() {
    if (_selectedColors.length != _numberOfPlayers) return null;
    return GameSettings(
      numberOfPlayers: _numberOfPlayers,
      playerColors: _selectedColors.toList(),
    );
  }

}