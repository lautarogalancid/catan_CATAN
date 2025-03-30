import 'package:flutter/widgets.dart';

import '../../setup/model/game_settings.dart';
import '../../setup/model/player_color.dart';

abstract class IScoreboardViewModel extends ChangeNotifier {
  int getScore(PlayerColor color);
  void increment(PlayerColor color);
  void decrease(PlayerColor color);
  void toggleRoute(PlayerColor color);
  void toggleArmy(PlayerColor color);

  PlayerColor? get routeOwner;
  PlayerColor? get armyOwner;
}

class ScoreboardViewModel extends IScoreboardViewModel {
  final Map<PlayerColor, int> _scores = {};
  PlayerColor? _routeOwner;
  PlayerColor? _armyOwner;

  ScoreboardViewModel(GameSettings settings) {
    for (final color in settings.playerColors) {
      _scores[color] = 2;
    }
  }

  @override
  int getScore(PlayerColor color) {
    return _scores[color] ?? 666;
  }

  @override
  void increment(PlayerColor color) {
    final current = getScore(color);
    if (current < 10) {
      _scores[color] = getScore(color) + 1;
    }
    notifyListeners();
  }

  @override
  void decrease(PlayerColor color) {
    final current = getScore(color);
    if (current > 2) {
    _scores[color] = getScore(color) - 1;
    }
    notifyListeners();
  }

  @override
  PlayerColor? get routeOwner => _routeOwner;
  @override
  PlayerColor? get armyOwner => _armyOwner;

  @override
  void toggleRoute(PlayerColor color) {
    if (_routeOwner == color) {
      _safeDecrement(color);
      _routeOwner = null;
    } else {
      if (_routeOwner != null) {
        _safeDecrement(_routeOwner!);
      }
      _routeOwner = color;
      _scores[color] = getScore(color) + 2;
    }
    notifyListeners();
  }

  @override
  void toggleArmy(PlayerColor color) {
    if (_armyOwner == color) {
      _safeDecrement(color);
      _armyOwner = null;
    } else {
      if (_armyOwner != null) {
        _safeDecrement(_armyOwner!);
      }
      _armyOwner = color;
      _scores[color] = getScore(color) + 2;
    }
    notifyListeners();
  }

  void _safeDecrement(PlayerColor color) {
    final current = getScore(color);
    _scores[color] = (current > 3) ? current - 2 :  2;
  }
}