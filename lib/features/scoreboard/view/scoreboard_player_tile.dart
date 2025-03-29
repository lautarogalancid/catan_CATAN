import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../setup/model/player_color.dart';
import '../viewmodel/scoreboard_view_model.dart';

class ScoreboardPlayerTile extends StatelessWidget {
  // props
  final PlayerColor color;

  // init
  const ScoreboardPlayerTile({required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<IScoreboardViewModel>();
    final score = viewModel.getScore(color);

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          children: [
            CircleAvatar(backgroundColor: color.color),
            const SizedBox(width: 12),
            Expanded(
                child: Text(
                    color.label, style: TextStyle(fontSize: 18),
                ),
            ),
            IconButton(onPressed: () => viewModel.decrease(color), icon: const Icon(Icons.remove)),
            Text('$score', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            IconButton(onPressed: () => viewModel.increment(color), icon: const Icon(Icons.add)),
          ],
        ),
      ),
    );
  }
}