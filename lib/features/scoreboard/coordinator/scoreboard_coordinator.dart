import 'package:catan_catan/features/setup/model/game_settings.dart';
import 'package:flutter/material.dart';
import '../../scoreboard/view/scoreboard_screen.dart';

class ScoreboardCoordinator {
  final GameSettings settings;
  ScoreboardCoordinator({required this.settings});

  Widget build() {
    return ScoreboardScreen(settings: settings);
  }
}