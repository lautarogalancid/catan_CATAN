import 'package:flutter/material.dart';
import 'player_color.dart';

class GameSettings {
  final int numberOfPlayers;
  final List<PlayerColor> playerColors;
  GameSettings({
    required this.numberOfPlayers,
    required this.playerColors
});

  // Devuelve los colores de los jugadores convertidos a Flutter Colors
  List<Color> get colors =>
      playerColors.map((color) => color.color).toList();

  // Devuelve los nombres de los colores para mostrar si es necesario / SMELL: Quiza no haga falta
  List<String> get labels =>
      playerColors.map((color) => color.label).toList();

}