import 'package:catan_catan/features/scoreboard/view/scoreboard_player_tile.dart';
import 'package:flutter/cupertino.dart';

import '../../setup/model/player_color.dart';

class ScoreboardBody extends StatelessWidget {
  final List<PlayerColor> playerColors;

  const ScoreboardBody({required this.playerColors, super.key});

  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: playerColors.length,
      itemBuilder: (_, index) {
       final color = playerColors[index];
       return ScoreboardPlayerTile(color: color);
      }
    );
  }

}