import 'package:flutter/material.dart';

enum PlayerColor {
  red,
  blue,
  green,
  amber,
  white,
  brown;

  String get label {
    switch (this) {
      case PlayerColor.red:
        return 'Rojo';
      case PlayerColor.blue:
        return 'Azul';
      case PlayerColor.green:
        return 'Verde';
      case PlayerColor.amber:
        return 'Mostaza';
      case PlayerColor.white:
        return 'Blanco';
      case PlayerColor.brown:
        return 'Marrón';
    }
  }

  Color get color {
    switch (this) {
      case PlayerColor.red:
        return Colors.red;
      case PlayerColor.blue:
        return Colors.blue;
      case PlayerColor.green:
        return Colors.green;
      case PlayerColor.amber:
        return Colors.amber;
      case PlayerColor.white:
        return Colors.white;
      case PlayerColor.brown:
        return Colors.brown;
    }
  }
}